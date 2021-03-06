/*
 * This file is part of the ubermini project.
 *
 * Copyright (C) 2017 Kage Shen <kgat96@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#ifndef __UART_H
#define __UART_H

#include <libopencm3/stm32/usart.h>

#define nUSART USART1

#define printf xprintf

void xprintf(const char* fmt, ...);

void kputhex(unsigned int value, int digits);
void kputs(char *s);
void kputc(char c);

void delay(void);

#endif
