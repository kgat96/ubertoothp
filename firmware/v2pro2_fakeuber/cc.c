/*
 * This file is part of the ubertoothp project.
 *
 * Copyright (C) 2016 Kage Shen <kgat96@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <libopencm3/stm32/gpio.h>

#include "config.h"
#include "cc.h"
#include "uart.h"

#define cc_debug(a)         kputs(a)
#define cc_puthex(a, b)     kputhex(a, b)
#define cc_putchar(a)       kputc(a)
/*
 * This is a single SPI transaction of variable length, usually 8 or 24 bits.
 * The CC2400 also supports longer transactions (e.g. for the FIFO), but we
 * haven't implemented anything longer than 32 bits.
 *
 * We're bit-banging because:
 *
 * 1. We're using one SPI peripheral for the CC2400's unbuffered data
 *    interface.
 * 2. We're saving the second SPI peripheral for an expansion port.
 * 3. The CC2400 needs CSN held low for the entire transaction which the
 *    LPC17xx SPI peripheral won't do without some workaround anyway.
 */

static u32 cc_spi(u8 len, u32 data)
{
    u32 msb = 1 << (len - 1);

    /* start transaction by dropping CSN */
    CSN_CLR();

    while (len--) {
        if (data & msb)
            MOSI_SET();
        else
            MOSI_CLR();
        data <<= 1;

        SCLK_SET();
        if (MISO())
            data |= 1;

        SCLK_CLR();
    }

    /* end transaction by raising CSN */
    CSN_SET();

    return data;
}

/* read 16 bit value from a register */
static u16 cc_get(u8 reg)
{
    u32 in;

    u32 out = (reg | 0x80) << 16;
    in = cc_spi(24, out);
    return in & 0xFFFF;
}

/* write 16 bit value to a register */
static void cc_set(u8 reg, u16 val)
{
    u32 out = (reg << 16) | val;
    cc_spi(24, out);
}

/* get the status */
static u8 cc_status(void)
{
    return cc_spi(8, 0);
}

/* strobe register, return status */
static u8 cc_strobe(u8 reg)
{
    return cc_spi(8, reg);
}

static inline void wait_fslock(void)
{
    //while (!(cc_status() & FS_LOCK));
    while (!gpio_get(GPIOA, PIN_GIO6));
}

static inline void wait_fsunlock(void)
{
    //while ((cc_status() & FS_LOCK));
    while (gpio_get(GPIOA, PIN_GIO6));
}

/*
 * Warning: This should only be called when running on the internal oscillator.
 * Otherwise use clock_start().
 */
void cc_reset(void)
{
    cc_strobe(SXOSCOFF);

    delay();

    cc_set(MAIN, 0x0000);
    while (cc_get(MAIN) != 0x0000) {
        cc_puthex(cc_get(FSMSTATE), 2);
        delay();
    }
    cc_set(MAIN, 0x8000);
    while (cc_get(MAIN) != 0x8000) {
        cc_puthex(cc_get(FSMSTATE), 2);
        delay();
    }

    cc_set(MAIN, 0x8000);   // HW v2
    //cc_set(MAIN, 0x8002); // HW v1
}

static void clock_init(void)
{
    /* configure CCxx00 oscillator
     * output carrier sense on GIO1,
     * output 16MHz GIO6 */

    cc_strobe(SXOSCOFF);

    cc_set(IOCFG, (GIO_CLK_16M << 3) | (GIO_LOCK_STATUS << 9));

    cc_strobe(SXOSCON);

    while (!(cc_status() & XOSC16M_STABLE)) {
        //cc_puthex(cc_get(FSMSTATE), 2);
    };

    //cc_puthex(cc_get(FSMSTATE), 2);

    cc_debug("cchip XOSC16M stable done\n");
}

void cc_init(void)
{
    /* CSN (slave select) is active low */
    CSN_SET();

    // check chip id
    {
        u32 id = cc_get(MANFIDL);

        if (id == 0x133d) {
            cc_debug("read cc chip id:"); cc_puthex(id, 4);cc_debug("\n");
        } else {
            cc_debug("Can't read cc chip id !");
        }
    }

    /* initialize various cc2400 settings - see datasheet pg63 */
    cc_set(MANAND,  0x7fff);

    if (cc_get(AGCCTRL) != 0xf700) {
        cc_debug("RF chip error!\n");
        while(1);
    }

    clock_init();
}

/* DMA buffers */
#define DMA_SIZE 50
u8 rxbuf1[DMA_SIZE];
u8 rxbuf2[DMA_SIZE];

/* rx terminal count and error interrupt counters */
volatile u32 rx_tc;
volatile u32 rx_err;

/*
 * The active buffer is the one with an active DMA transfer.
 * The idle buffer is the one we can read/write between transfers.
 */
u8 *active_rxbuf = &rxbuf1[0];
u8 *idle_rxbuf = &rxbuf2[0];

/* operation mode */
#define mode requested_mode
extern u8 requested_mode;
extern u8 modulation;

/* specan stuff */
volatile u16 low_freq = 2400;
volatile u16 high_freq = 2483;

/* hopping stuff */
volatile u8  hop_mode = HOP_SWEEP;
volatile u8  do_hop = 0;                  // set by timer interrupt
volatile u16 channel = 2441;
volatile u16 hop_direct_channel = 0;      // for hopping directly to a channel
volatile u16 hop_timeout = 158;
volatile u16 requested_channel = 2402;
volatile u16 saved_request = 0;

u64 syncword;
u8 afh_enabled;
u8 afh_map[10];
u8 used_channels;

volatile u32 clkn = 0;
volatile u32 last_hop = 0;

volatile u32 clkn_offset = 0;
volatile u16 clk100ns_offset = 0;

/* bulk USB stuff */
volatile uint8_t  idle_buf_clkn_high = 0;
volatile uint32_t idle_buf_clk100ns = 0;
volatile uint16_t idle_buf_channel = 0;

volatile char max_rssi = -120;

void cc_clkn_handler(void)
{
    clkn += clkn_offset + 1;
    clkn_offset = 0;

    /* NONE or SWEEP -> 25 Hz */
    if (hop_mode == HOP_NONE || hop_mode == HOP_SWEEP) {
        if ((clkn & 0x7f) == 0) {
            do_hop = 1;
        }
    }
}

void cc_hop(void)
{

    if (!do_hop) {
        char rssi = (int8_t)(cc_get(RSSI) >> 8);
        if (rssi > max_rssi) max_rssi = rssi;
        return;
    } else {
        //cc_puthex(channel, 2);
        //cc_putchar('-');
        //cc_puthex(max_rssi*(-1), 2);
        //cc_putchar('\n');cc_putchar('\r');
        max_rssi = -120;
    }

    do_hop = 0;
    last_hop = clkn;

    // No hopping, if channel is set correctly, do nothing
    if (hop_mode == HOP_NONE) {
        if (cc_get(FSDIV) == (channel - 1))
            return;
    }
    /* only hop to currently used channels if AFH is enabled
     */
    else if (hop_mode == HOP_SWEEP) {
        do {
            channel += 32;
            if (channel > 2480)
                channel -= 79;
        } while ( used_channels != 0 && afh_enabled && !( afh_map[(channel-2402)/8] & 0x1<<((channel-2402)%8) ) );
    }

    /* IDLE mode, but leave amp on, so don't call cc2400_idle(). */
    cc_strobe(SRFOFF);
    wait_fsunlock();

    /* return */
    if(mode == MODE_TX_SYMBOLS)
        cc_set(FSDIV, channel);
    else
        cc_set(FSDIV, channel - 1);

    /* Wait for lock */
    cc_strobe(SFSON);
    wait_fslock();

    if(mode == MODE_TX_SYMBOLS)
        cc_strobe(STX);
    else
        cc_strobe(SRX);
}

/* start un-buffered rx */
void cc_rx_mode(void)
{
    if (modulation == MOD_BT_BASIC_RATE) {
        cc_set(MANAND,  0x7fff);
        cc_set(LMTST,   0x2b22);
        cc_set(MDMTST0, 0x134b); // without PRNG
        cc_set(GRMDM,   0x0101); // un-buffered mode, GFSK
        cc_set(FSDIV,   channel - 1); // 1 MHz IF
        cc_set(MDMCTRL, 0x0029); // 160 kHz frequency deviation
    } else if (modulation == MOD_BT_LOW_ENERGY) {
        cc_set(MANAND,  0x7fff);
        cc_set(LMTST,   0x2b22);
        cc_set(MDMTST0, 0x134b); // without PRNG
        cc_set(GRMDM,   0x0101); // un-buffered mode, GFSK
        cc_set(FSDIV,   channel - 1); // 1 MHz IF
        cc_set(MDMCTRL, 0x0040); // 250 kHz frequency deviation
    } else {
        /* oops */
        return;
    }

    cc_strobe(SXOSCON);

    while (!(cc_status() & XOSC16M_STABLE));

    cc_strobe(SFSON);

    wait_fslock();

    cc_strobe(SRX);

    PAEN_SET();
    HGM_SET();

    cc_debug("cchip rx mode\n");
}

void cc_specan_mode(void)
{
    cc_set(MANAND,  0x7fff);
    cc_set(LMTST,   0x2b22);
    cc_set(MDMTST0, 0x134b); // without PRNG
    cc_set(GRMDM,   0x0101); // un-buffered mode, GFSK
    cc_set(MDMCTRL, 0x0029); // 160 kHz frequency deviation
    //FIXME maybe set RSSI.RSSI_FILT

    cc_strobe(SXOSCON);

    while (!(cc_status() & XOSC16M_STABLE));

    cc_strobe(SRFOFF);

    wait_fsunlock();

    PAEN_SET();
    HGM_SET();

    cc_debug("cchip entry specan mode\n");
}


void get_specan_date(u8 *buf, int len)
{
    static int f = 2400;
    int i = 0;

    //cc_debug("get_specan\n");

     while(len > 0) {
        len -= 2;
        cc_set(FSDIV, f - 1);
        cc_strobe(SFSON);
        wait_fslock();
        cc_strobe(SRX);

        {
            u32 k;
            for (k = 0; k < 30000; k++) { /* Wait a bit. */
                __asm__("nop");
            }
        }

        buf[i++] = f - low_freq;
        buf[i++] = cc_get(RSSI) >> 8;

        {
            char t = (char)buf[i-1];
            t *= -1;

            //cc_puthex(t, 2); cc_putchar('\n');cc_putchar('\r');
        }


        f += 1;
        if (f > high_freq) f = low_freq;

        cc_strobe(SRFOFF);
        wait_fsunlock();
    }
}

static const u8 whitening_index[] = {
    70, 62, 120, 111, 77, 46, 15, 101, 66, 39, 31, 26, 80,
    83, 125, 89, 10, 35, 8, 54, 122, 17, 33, 0, 58, 115, 6,
    94, 86, 49, 52, 20, 40, 27, 84, 90, 63, 112, 47, 102
};

static const u8 whitening[] = {
    1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1,
    1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0,
    0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0,
    1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0,
    1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1
};

/* write multiple bytes to SPI */
static void cc_fifo_write(u8 len, u8 *data) {
    u8 msb = 1 << 7;
    u8 reg = FIFOREG;
    u8 i, j, temp;

    /* start transaction by dropping CSN */
    CSN_CLR();

    for (i = 0; i < 8; ++i) {
        if (reg & msb)
            MOSI_SET();
        else
            MOSI_CLR();
        reg <<= 1;
        SCLK_SET();
        SCLK_CLR();
    }

    for (i = 0; i < len; ++i) {
        temp = data[i];
        for (j = 0; j < 8; ++j) {
            if (temp & msb)
                MOSI_SET();
            else
                MOSI_CLR();
            temp <<= 1;
            SCLK_SET();
            SCLK_CLR();
        }
    }

    // this is necessary to clock in the last byte
    for (i = 0; i < 8; ++i) {
        SCLK_SET();
        SCLK_CLR();
    }

    //delay();

    __asm__("nop");__asm__("nop");__asm__("nop");
    __asm__("nop");__asm__("nop");__asm__("nop");


    if (0) {
        u32 nn = 500;
        while(nn--) {
            __asm__("nop");__asm__("nop");__asm__("nop");
        }
    }

    /* end transaction by raising CSN */
    CSN_SET();
}

static u8 btle_channel_index(u8 ch)
{
    u8 idx;
    ch /= 2;
    if (ch == 0)
        idx = 37;
    else if (ch < 12)
        idx = ch - 1;
    else if (ch == 12)
        idx = 38;
    else if (ch < 39)
        idx = ch - 2;
    else
        idx = 39;
    return idx;
}

/*
 * Transmit a BTLE packet with the specified access address.
 *
 * All modulation parameters are set within this function. The data
 * should not be pre-whitened, but the CRC should be calculated and
 * included in the data length.
 */
static void le_transmit(u32 aa, u8 len, u8 *data)
{
    unsigned i, j;
    int bit;
    u8 txbuf[64];
    u8 tx_len;
    u8 byte;
    u16 gio_save;

    channel = 2426;     // 38

    // first four bytes: AA
    for (i = 0; i < 4; ++i) {
        byte = aa & 0xff;
        aa >>= 8;
        txbuf[i] = 0;
        for (j = 0; j < 8; ++j) {
            txbuf[i] |= (byte & 1) << (7 - j);
            byte >>= 1;
        }
    }

    // whiten the data and copy it into the txbuf
    int idx = whitening_index[btle_channel_index(channel-2402)];
    for (i = 0; i < len; ++i) {
        byte = data[i];
        txbuf[i+4] = 0;
        for (j = 0; j < 8; ++j) {
            bit = (byte & 1) ^ whitening[idx];
            idx = (idx + 1) % sizeof(whitening);
            byte >>= 1;
            txbuf[i+4] |= bit << (7 - j);
        }
    }

    len += 4; // include the AA in len

    // 6b 7d 91 71 6b 33 42 a4 ba bb c7 71 9d 20 50 f6 5f fd
    printf("whiten:");
    for (u32 i = 0; i < len; i++)
        printf("%x ", txbuf[i]);

    // Bluetooth-like modulation
    cc_set(MANAND,  0x7fff);
    cc_set(LMTST,   0x2b22);    // LNA and receive mixers test register
    cc_set(MDMTST0, 0x134b);    // no PRNG

    cc_set(GRMDM,   0x0c01);
    // 0 00 01 1 000 00 0 00 0 1
    //      |  | |   |  +--------> CRC off
    //      |  | |   +-----------> sync word: 8 MSB bits of SYNC_WORD
    //      |  | +---------------> 0 preamble bytes of 01010101
    //      |  +-----------------> packet mode
    //      +--------------------> buffered mode

    cc_set(FSDIV,   channel);   // 37
    cc_set(FREND,   0b1011);    // amplifier level (-7 dBm, picked from hat)
    cc_set(MDMCTRL, 0x0040);    // 250 kHz frequency deviation
    cc_set(INT,     0x0014);    // FIFO_THRESHOLD: 20 bytes

    // sync byte depends on the first transmitted bit of the AA
    if (aa & 1)
        cc_set(SYNCH,   0xaaaa);
    else
        cc_set(SYNCH,   0x5555);

    // set GIO to FIFO_FULL
    gio_save = cc_get(IOCFG);

    cc_set(IOCFG, (GIO_CLK_16M << 3) | (GIO_FIFO_FULL << 9));

    while (!(cc_status() & XOSC16M_STABLE));
    cc_strobe(SFSON);

    while (!(cc_status() & FS_LOCK));

    PAEN_SET();

    //while(0) {
    //    kputc('.');

        if (0) {
            for(i = 0; i < 64; i++) {
                txbuf[i] = (i & 1) ? 0xff : 0xff;
            }

            //txbuf[0] = 0xff;
            //txbuf[1] = 0xff;

            //txbuf[2] = 0;
            //txbuf[3] = 0;

            //txbuf[4] = 0xff;
            //txbuf[5] = 0xff;

            //txbuf[6] = 0;
            //txbuf[7] = 0;
        }

        while ((cc_get(FSMSTATE) & 0x1f) != STATE_STROBE_FS_ON);
        cc_strobe(STX);

        // put the packet into the FIFO
        for (i = 0; i < len; i += 16) {
            while (gpio_get(GPIOA, PIN_GIO6)); // wait for the FIFO to drain (FIFO_FULL false)
            tx_len = len - i;
            if (tx_len > 16)
                tx_len = 16;
            cc_fifo_write(tx_len, txbuf + i);
        }

        if(1) {
            u32 nn = 50000;
            while(nn--) {
                __asm__("nop");__asm__("nop");__asm__("nop");
                __asm__("nop");__asm__("nop");__asm__("nop");
                __asm__("nop");__asm__("nop");__asm__("nop");
            }
        }
    //}

    while ((cc_get(FSMSTATE) & 0x1f) != STATE_STROBE_FS_ON);

    cc_strobe(SRFOFF);
    while ((cc_status() & FS_LOCK));

    PAEN_CLR();

    // reset GIO
    cc_set(IOCFG, gio_save);
}

// calculate CRC
//  note 1: crc_init's bits should be in reverse order
//  note 2: output bytes are in reverse order compared to wire
//
//      example output:
//          0x6ff46e
//
//      bytes in packet will be:
//        { 0x6e, 0xf4, 0x6f }
//
static u32 btle_calc_crc(u32 crc_init, u8 *data, int len)
{
    u32 state = crc_init & 0xffffff;
    u32 lfsr_mask = 0x5a6000; // 010110100110000000000000
    int i, j;

    for (i = 0; i < len; ++i) {
        u8 cur = data[i];
        for (j = 0; j < 8; ++j) {
            int next_bit = (state ^ cur) & 1;
            cur >>= 1;
            state >>= 1;
            if (next_bit) {
                state |= 1 << 23;
                state ^= lfsr_mask;
            }
        }
    }
    return state;
}

/* le stuff */
uint8_t slave_mac_address[6] = {0x1, 0x2, 0x3, 0x4, 0x5, 0x6};
void ble_adv(void);

void ble_adv(void)
{
    u32 calc_crc;
    int i;

    u8 adv_ind[] = {
        // LL header
        0x00, 0x09,

        // advertising address
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff,

        // advertising data
        0xa2, 0xa1, 0xa5,

        // CRC (calc)
        0xff, 0xff, 0xff,
    };

    u8 adv_ind_len = sizeof(adv_ind) - 3;

    // copy the user-specified mac address
    for (i = 0; i < 6; ++i)
        adv_ind[i+2] = slave_mac_address[5-i];

    calc_crc = btle_calc_crc(0xAAAAAA, adv_ind, adv_ind_len);
    adv_ind[adv_ind_len+0] = (calc_crc >>  0) & 0xff;
    adv_ind[adv_ind_len+1] = (calc_crc >>  8) & 0xff;
    adv_ind[adv_ind_len+2] = (calc_crc >> 16) & 0xff;

    //printf("crc %x\n", calc_crc);

    // spam advertising packets
    //while (requested_mode == MODE_BT_SLAVE_LE) {
        le_transmit(0x8e89bed6, adv_ind_len+3, adv_ind);
        //msleep(100);
    //}
}


