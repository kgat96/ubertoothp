EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:ubertooth-symbols
LIBS:stm32
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:microcontrollers
LIBS:dsp
LIBS:analog_switches
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:t3-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "ubertooth pro debug board"
Date "2016-11-08"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CC2400 U?
U 1 1 58218126
P 6450 3400
F 0 "U?" H 6450 3500 60  0000 C CNN
F 1 "CC2400" H 6450 3300 60  0000 C CNN
F 2 "" H 6450 3400 60  0001 C CNN
F 3 "" H 6450 3400 60  0001 C CNN
	1    6450 3400
	1    0    0    -1  
$EndComp
$Comp
L L_Small L?
U 1 1 5821BE66
P 4800 3450
F 0 "L?" H 4850 3500 50  0000 L CNN
F 1 "NC" H 4830 3410 50  0000 L CNN
F 2 "" H 4800 3450 50  0000 C CNN
F 3 "" H 4800 3450 50  0000 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
$Comp
L CC2591 U?
U 1 1 5821C144
P 3650 3500
F 0 "U?" H 3650 3600 60  0000 C CNN
F 1 "CC2591" H 3650 3400 60  0000 C CNN
F 2 "" H 3650 3500 60  0001 C CNN
F 3 "" H 3650 3500 60  0001 C CNN
	1    3650 3500
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 58230374
P 4550 4000
F 0 "#PWR?" H 4550 3850 50  0001 C CNN
F 1 "+3.3V" V 4500 4050 50  0000 C CNN
F 2 "" H 4550 4000 50  0000 C CNN
F 3 "" H 4550 4000 50  0000 C CNN
	1    4550 4000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58230439
P 4750 4450
F 0 "#PWR?" H 4750 4200 50  0001 C CNN
F 1 "GND" H 4750 4300 50  0000 C CNN
F 2 "" H 4750 4450 50  0000 C CNN
F 3 "" H 4750 4450 50  0000 C CNN
	1    4750 4450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 582309BC
P 3950 4450
F 0 "#PWR?" H 3950 4300 50  0001 C CNN
F 1 "+3.3V" H 4100 4550 50  0000 C CNN
F 2 "" H 3950 4450 50  0000 C CNN
F 3 "" H 3950 4450 50  0000 C CNN
	1    3950 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58230A8C
P 3950 4850
F 0 "#PWR?" H 3950 4600 50  0001 C CNN
F 1 "GND" H 3950 4700 50  0000 C CNN
F 2 "" H 3950 4850 50  0000 C CNN
F 3 "" H 3950 4850 50  0000 C CNN
	1    3950 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58230B7C
P 3700 4850
F 0 "#PWR?" H 3700 4600 50  0001 C CNN
F 1 "GND" H 3700 4700 50  0000 C CNN
F 2 "" H 3700 4850 50  0000 C CNN
F 3 "" H 3700 4850 50  0000 C CNN
	1    3700 4850
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58230C05
P 3700 4650
F 0 "R?" V 3780 4650 50  0000 C CNN
F 1 "4k3" V 3700 4650 50  0000 C CNN
F 2 "" V 3630 4650 50  0000 C CNN
F 3 "" H 3700 4650 50  0000 C CNN
	1    3700 4650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58230C80
P 4550 4200
F 0 "C?" H 4575 4300 50  0000 L CNN
F 1 "1nf" H 4600 4100 50  0000 L CNN
F 2 "" H 4588 4050 50  0000 C CNN
F 3 "" H 4550 4200 50  0000 C CNN
	1    4550 4200
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58230E8A
P 3950 4650
F 0 "C?" H 3975 4750 50  0000 L CNN
F 1 "1nf" H 4000 4550 50  0000 L CNN
F 2 "" H 3988 4500 50  0000 C CNN
F 3 "" H 3950 4650 50  0000 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58230FCE
P 3600 4500
F 0 "#PWR?" H 3600 4250 50  0001 C CNN
F 1 "GND" V 3550 4350 50  0000 C CNN
F 2 "" H 3600 4500 50  0000 C CNN
F 3 "" H 3600 4500 50  0000 C CNN
	1    3600 4500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58231036
P 2700 4700
F 0 "C?" H 2725 4800 50  0000 L CNN
F 1 "1nf" H 2750 4600 50  0000 L CNN
F 2 "" H 2738 4550 50  0000 C CNN
F 3 "" H 2700 4700 50  0000 C CNN
	1    2700 4700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58231067
P 2950 4700
F 0 "C?" H 2975 4800 50  0000 L CNN
F 1 "10pf" H 3000 4600 50  0000 L CNN
F 2 "" H 2988 4550 50  0000 C CNN
F 3 "" H 2950 4700 50  0000 C CNN
	1    2950 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582314A7
P 2700 4900
F 0 "#PWR?" H 2700 4650 50  0001 C CNN
F 1 "GND" H 2700 4750 50  0000 C CNN
F 2 "" H 2700 4900 50  0000 C CNN
F 3 "" H 2700 4900 50  0000 C CNN
	1    2700 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582314CA
P 2950 4900
F 0 "#PWR?" H 2950 4650 50  0001 C CNN
F 1 "GND" H 2950 4750 50  0000 C CNN
F 2 "" H 2950 4900 50  0000 C CNN
F 3 "" H 2950 4900 50  0000 C CNN
	1    2950 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 582314ED
P 2700 4450
F 0 "#PWR?" H 2700 4300 50  0001 C CNN
F 1 "+3.3V" H 2850 4550 50  0000 C CNN
F 2 "" H 2700 4450 50  0000 C CNN
F 3 "" H 2700 4450 50  0000 C CNN
	1    2700 4450
	1    0    0    -1  
$EndComp
Text Notes 3050 4400 0    39   ~ 0
tx line inductor\n
$Comp
L GND #PWR?
U 1 1 5823213E
P 2650 3650
F 0 "#PWR?" H 2650 3400 50  0001 C CNN
F 1 "GND" V 2750 3650 50  0000 C CNN
F 2 "" H 2650 3650 50  0000 C CNN
F 3 "" H 2650 3650 50  0000 C CNN
	1    2650 3650
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 58232529
P 2250 3550
F 0 "C?" H 2275 3650 50  0000 L CNN
F 1 "6p8" H 2300 3450 50  0000 L CNN
F 2 "" H 2288 3400 50  0000 C CNN
F 3 "" H 2250 3550 50  0000 C CNN
	1    2250 3550
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 582326A2
P 2050 3800
F 0 "C?" H 2075 3900 50  0000 L CNN
F 1 "1pf" H 2100 3700 50  0000 L CNN
F 2 "" H 2088 3650 50  0000 C CNN
F 3 "" H 2050 3800 50  0000 C CNN
	1    2050 3800
	-1   0    0    1   
$EndComp
$Comp
L INDUCTOR L?
U 1 1 58232836
P 1700 3550
F 0 "L?" V 1650 3550 50  0000 C CNN
F 1 "2n2" V 1800 3550 50  0000 C CNN
F 2 "" H 1700 3550 50  0000 C CNN
F 3 "" H 1700 3550 50  0000 C CNN
	1    1700 3550
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 58232D90
P 1350 3800
F 0 "C?" H 1375 3900 50  0000 L CNN
F 1 "2p2" H 1400 3700 50  0000 L CNN
F 2 "" H 1388 3650 50  0000 C CNN
F 3 "" H 1350 3800 50  0000 C CNN
	1    1350 3800
	-1   0    0    1   
$EndComp
$Comp
L SMA-CONN P?
U 1 1 58232DDF
P 1000 3550
F 0 "P?" H 1000 3700 60  0000 C CNN
F 1 "SMA" H 850 3400 60  0000 C CNN
F 2 "" H 1000 3550 60  0001 C CNN
F 3 "" H 1000 3550 60  0001 C CNN
	1    1000 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58233203
P 2050 4000
F 0 "#PWR?" H 2050 3750 50  0001 C CNN
F 1 "GND" H 2050 3850 50  0000 C CNN
F 2 "" H 2050 4000 50  0000 C CNN
F 3 "" H 2050 4000 50  0000 C CNN
	1    2050 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5823324F
P 1350 4000
F 0 "#PWR?" H 1350 3750 50  0001 C CNN
F 1 "GND" H 1350 3850 50  0000 C CNN
F 2 "" H 1350 4000 50  0000 C CNN
F 3 "" H 1350 4000 50  0000 C CNN
	1    1350 4000
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L?
U 1 1 582334A9
P 1350 3150
F 0 "L?" V 1300 3150 50  0000 C CNN
F 1 "3nH" V 1450 3150 50  0000 C CNN
F 2 "" H 1350 3150 50  0000 C CNN
F 3 "" H 1350 3150 50  0000 C CNN
	1    1350 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58233B5B
P 2650 3350
F 0 "#PWR?" H 2650 3100 50  0001 C CNN
F 1 "GND" V 2550 3350 50  0000 C CNN
F 2 "" H 2650 3350 50  0000 C CNN
F 3 "" H 2650 3350 50  0000 C CNN
	1    2650 3350
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 58233C68
P 2100 3100
F 0 "C?" H 2125 3200 50  0000 L CNN
F 1 "1nf" H 2150 3000 50  0000 L CNN
F 2 "" H 2138 2950 50  0000 C CNN
F 3 "" H 2100 3100 50  0000 C CNN
	1    2100 3100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58233CEF
P 1800 3100
F 0 "C?" H 1825 3200 50  0000 L CNN
F 1 "18pf" H 1850 3000 50  0000 L CNN
F 2 "" H 1838 2950 50  0000 C CNN
F 3 "" H 1800 3100 50  0000 C CNN
	1    1800 3100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 58233E1E
P 1650 3350
F 0 "#PWR?" H 1650 3200 50  0001 C CNN
F 1 "+3.3V" V 1750 3400 50  0000 C CNN
F 2 "" H 1650 3350 50  0000 C CNN
F 3 "" H 1650 3350 50  0000 C CNN
	1    1650 3350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58233E9B
P 1800 2750
F 0 "#PWR?" H 1800 2500 50  0001 C CNN
F 1 "GND" H 1800 2600 50  0000 C CNN
F 2 "" H 1800 2750 50  0000 C CNN
F 3 "" H 1800 2750 50  0000 C CNN
	1    1800 2750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5823493B
P 1350 2750
F 0 "#PWR?" H 1350 2500 50  0001 C CNN
F 1 "GND" H 1350 2600 50  0000 C CNN
F 2 "" H 1350 2750 50  0000 C CNN
F 3 "" H 1350 2750 50  0000 C CNN
	1    1350 2750
	-1   0    0    1   
$EndComp
Text Notes 2150 3300 0    39   ~ 0
tx line inductor\n
$Comp
L GND #PWR?
U 1 1 58235B78
P 3150 2500
F 0 "#PWR?" H 3150 2250 50  0001 C CNN
F 1 "GND" H 3150 2350 50  0000 C CNN
F 2 "" H 3150 2500 50  0000 C CNN
F 3 "" H 3150 2500 50  0000 C CNN
	1    3150 2500
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 582340F5
P 3800 2350
F 0 "R?" V 3700 2350 50  0000 C CNN
F 1 "10k" V 3800 2350 50  0000 C CNN
F 2 "" V 3730 2350 50  0000 C CNN
F 3 "" H 3800 2350 50  0000 C CNN
	1    3800 2350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 58234269
P 3800 2150
F 0 "#PWR?" H 3800 1900 50  0001 C CNN
F 1 "GND" H 3800 2000 50  0000 C CNN
F 2 "" H 3800 2150 50  0000 C CNN
F 3 "" H 3800 2150 50  0000 C CNN
	1    3800 2150
	-1   0    0    1   
$EndComp
Text Notes 4500 4050 1    39   ~ 0
tx line inductor\n
$Comp
L GND #PWR?
U 1 1 58235C31
P 4500 3050
F 0 "#PWR?" H 4500 2800 50  0001 C CNN
F 1 "GND" H 4500 2900 50  0000 C CNN
F 2 "" H 4500 3050 50  0000 C CNN
F 3 "" H 4500 3050 50  0000 C CNN
	1    4500 3050
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 58236204
P 4750 3050
F 0 "C?" V 4700 2850 50  0000 L CNN
F 1 "68pf" V 4650 3100 50  0000 L CNN
F 2 "" H 4788 2900 50  0000 C CNN
F 3 "" H 4750 3050 50  0000 C CNN
	1    4750 3050
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 582364C2
P 4750 2850
F 0 "C?" V 4700 2650 50  0000 L CNN
F 1 "100nf" V 4600 2850 50  0000 L CNN
F 2 "" H 4788 2700 50  0000 C CNN
F 3 "" H 4750 2850 50  0000 C CNN
	1    4750 2850
	0    1    1    0   
$EndComp
$Comp
L +1V8 #PWR?
U 1 1 58236D8A
P 5000 2000
F 0 "#PWR?" H 5000 1850 50  0001 C CNN
F 1 "+1V8" H 5000 2140 50  0000 C CNN
F 2 "" H 5000 2000 50  0000 C CNN
F 3 "" H 5000 2000 50  0000 C CNN
	1    5000 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58238B73
P 700 4100
F 0 "#PWR?" H 700 3850 50  0001 C CNN
F 1 "GND" H 700 3950 50  0000 C CNN
F 2 "" H 700 4100 50  0000 C CNN
F 3 "" H 700 4100 50  0000 C CNN
	1    700  4100
	1    0    0    -1  
$EndComp
Text Label 3800 1700 0    60   Italic 12
PAEN
$Comp
L Crystal Y?
U 1 1 5824A1D3
P 6450 1700
F 0 "Y?" H 6450 1850 50  0000 C CNN
F 1 "16MHz" H 6450 1550 50  0000 C CNN
F 2 "" H 6450 1700 50  0000 C CNN
F 3 "" H 6450 1700 50  0000 C CNN
	1    6450 1700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5824A981
P 6300 1450
F 0 "C?" V 6350 1550 50  0000 L CNN
F 1 "27pf" V 6400 1300 50  0000 L CNN
F 2 "" H 6338 1300 50  0000 C CNN
F 3 "" H 6300 1450 50  0000 C CNN
	1    6300 1450
	-1   0    0    1   
$EndComp
$Comp
L C C?
U 1 1 5824AB61
P 6600 1450
F 0 "C?" V 6500 1550 50  0000 L CNN
F 1 "27pf" V 6700 1300 50  0000 L CNN
F 2 "" H 6638 1300 50  0000 C CNN
F 3 "" H 6600 1450 50  0000 C CNN
	1    6600 1450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5824B574
P 6450 1200
F 0 "#PWR?" H 6450 950 50  0001 C CNN
F 1 "GND" H 6450 1050 50  0000 C CNN
F 2 "" H 6450 1200 50  0000 C CNN
F 3 "" H 6450 1200 50  0000 C CNN
	1    6450 1200
	-1   0    0    1   
$EndComp
Text Label 6000 1750 1    39   Italic 8
ATEST1
Text Label 6100 1750 1    39   Italic 8
ATEST2
$Comp
L R R?
U 1 1 5824CE6D
P 5750 1750
F 0 "R?" V 5650 1750 50  0000 C CNN
F 1 "43k" V 5750 1750 50  0000 C CNN
F 2 "" V 5680 1750 50  0000 C CNN
F 3 "" H 5750 1750 50  0000 C CNN
	1    5750 1750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5824D07A
P 5750 1500
F 0 "#PWR?" H 5750 1250 50  0001 C CNN
F 1 "GND" H 5750 1350 50  0000 C CNN
F 2 "" H 5750 1500 50  0000 C CNN
F 3 "" H 5750 1500 50  0000 C CNN
	1    5750 1500
	-1   0    0    1   
$EndComp
NoConn ~ 6700 2050
NoConn ~ 6800 2050
NoConn ~ 6900 2050
NoConn ~ 7000 2050
$Comp
L C C?
U 1 1 5824DF6C
P 6900 1450
F 0 "C?" V 6800 1550 50  0000 L CNN
F 1 "68pf" V 7000 1300 50  0000 L CNN
F 2 "" H 6938 1300 50  0000 C CNN
F 3 "" H 6900 1450 50  0000 C CNN
	1    6900 1450
	-1   0    0    1   
$EndComp
NoConn ~ 7800 2850
Text Label 3800 1550 0    60   Italic 12
HGM
Text Label 7850 3750 0    39   Italic 8
RX
Text Label 7850 3650 0    39   Italic 8
TX
Text Label 7850 3550 0    39   Italic 8
DIO
Text Label 7850 3450 0    39   Italic 8
DCLK
Text Label 7850 3350 0    39   Italic 8
CSn
Text Label 7850 3250 0    39   Italic 8
SCLK
Text Label 7850 3150 0    39   Italic 8
SI
Text Label 7850 3050 0    39   Italic 8
SO
Text Label 7850 2950 0    39   Italic 8
GIO6
NoConn ~ 5900 4750
NoConn ~ 5100 3950
NoConn ~ 5100 3850
$Comp
L C C?
U 1 1 58252D32
P 4900 4200
F 0 "C?" H 4925 4300 50  0000 L CNN
F 1 "10nf" H 4950 4100 50  0000 L CNN
F 2 "" H 4938 4050 50  0000 C CNN
F 3 "" H 4900 4200 50  0000 C CNN
	1    4900 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58252D97
P 4800 3650
F 0 "#PWR?" H 4800 3400 50  0001 C CNN
F 1 "GND" V 4750 3700 50  0000 C CNN
F 2 "" H 4800 3650 50  0000 C CNN
F 3 "" H 4800 3650 50  0000 C CNN
	1    4800 3650
	0    1    1    0   
$EndComp
$Comp
L +1V8 #PWR?
U 1 1 582530A7
P 4800 3750
F 0 "#PWR?" H 4800 3600 50  0001 C CNN
F 1 "+1V8" V 4700 3800 50  0000 C CNN
F 2 "" H 4800 3750 50  0000 C CNN
F 3 "" H 4800 3750 50  0000 C CNN
	1    4800 3750
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 582555AF
P 6200 5000
F 0 "C?" H 6225 5100 50  0000 L CNN
F 1 "68pf" H 6250 4900 50  0000 L CNN
F 2 "" H 6238 4850 50  0000 C CNN
F 3 "" H 6200 5000 50  0000 C CNN
	1    6200 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582559E9
P 6200 5200
F 0 "#PWR?" H 6200 4950 50  0001 C CNN
F 1 "GND" H 6200 5050 50  0000 C CNN
F 2 "" H 6200 5200 50  0000 C CNN
F 3 "" H 6200 5200 50  0000 C CNN
	1    6200 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58257585
P 7400 5150
F 0 "#PWR?" H 7400 4900 50  0001 C CNN
F 1 "GND" H 7400 5000 50  0000 C CNN
F 2 "" H 7400 5150 50  0000 C CNN
F 3 "" H 7400 5150 50  0000 C CNN
	1    7400 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3450 5100 3450
Wire Wire Line
	4550 3350 5100 3350
Connection ~ 4800 3350
Wire Wire Line
	4550 3550 5100 3550
Connection ~ 4800 3550
Wire Wire Line
	4550 3650 4550 4050
Wire Wire Line
	3950 4850 3950 4800
Wire Wire Line
	3700 4400 3700 4500
Wire Wire Line
	3700 4800 3700 4850
Wire Wire Line
	3600 4400 3600 4500
Wire Wire Line
	3500 4500 3500 4400
Wire Wire Line
	2700 4500 3500 4500
Wire Wire Line
	3800 4400 3800 4500
Wire Wire Line
	3800 4500 3950 4500
Wire Wire Line
	3950 4500 3950 4450
Wire Wire Line
	2700 4450 2700 4550
Connection ~ 2950 4500
Wire Wire Line
	2950 4500 2950 4550
Wire Wire Line
	2700 4850 2700 4900
Wire Wire Line
	2950 4850 2950 4900
Connection ~ 2700 4500
Wire Notes Line
	3150 4450 3150 4550
Wire Notes Line
	3150 4550 3400 4550
Wire Notes Line
	3400 4550 3400 4450
Wire Notes Line
	3400 4450 3150 4450
Wire Wire Line
	2000 3550 2100 3550
Wire Wire Line
	2050 3650 2050 3550
Connection ~ 2050 3550
Wire Wire Line
	1300 3550 1400 3550
Wire Wire Line
	1350 3450 1350 3650
Connection ~ 1350 3550
Wire Wire Line
	1350 3950 1350 4000
Wire Wire Line
	2050 3950 2050 4000
Wire Wire Line
	2400 3550 2750 3550
Wire Wire Line
	1650 3350 2500 3350
Wire Wire Line
	2500 3350 2500 3450
Wire Wire Line
	2500 3450 2750 3450
Wire Wire Line
	1800 3350 1800 3250
Connection ~ 1800 3350
Wire Wire Line
	2100 3350 2100 3250
Connection ~ 2100 3350
Wire Wire Line
	1800 2750 1800 2950
Wire Wire Line
	2100 2850 2100 2950
Connection ~ 1800 2850
Wire Wire Line
	1800 2850 2100 2850
Wire Wire Line
	1350 2850 1350 2750
Wire Wire Line
	2650 3350 2750 3350
Wire Wire Line
	2650 3650 2750 3650
Wire Notes Line
	2250 3300 2250 3400
Wire Notes Line
	2250 3400 2500 3400
Wire Notes Line
	2500 3400 2500 3300
Wire Notes Line
	2500 3300 2250 3300
Wire Wire Line
	3150 2600 3150 2500
Wire Wire Line
	3150 2550 3500 2550
Connection ~ 3150 2550
Wire Wire Line
	3500 2550 3500 2600
Wire Notes Line
	9350 550  9350 6050
Wire Notes Line
	9350 6050 700  6050
Wire Wire Line
	3600 2600 3600 1550
Wire Wire Line
	3600 1550 4050 1550
Wire Wire Line
	4050 1700 3700 1700
Wire Wire Line
	3700 1700 3700 2600
Wire Wire Line
	3800 2500 3800 2600
Wire Notes Line
	4500 3700 4500 3900
Wire Notes Line
	4500 3900 4600 3900
Wire Notes Line
	4600 3900 4600 3700
Wire Notes Line
	4600 3700 4500 3700
Wire Wire Line
	5100 2950 5000 2950
Wire Wire Line
	5000 3150 5100 3150
Connection ~ 5000 3050
Connection ~ 5000 2950
Connection ~ 5000 2850
Wire Wire Line
	4550 2850 4550 3250
Wire Wire Line
	5000 2000 5000 3150
Connection ~ 4550 3050
Wire Wire Line
	4550 2850 4600 2850
Wire Wire Line
	4500 3050 4600 3050
Wire Wire Line
	4900 3050 5100 3050
Wire Wire Line
	4900 2850 5100 2850
Wire Wire Line
	700  3750 700  4100
Connection ~ 700  4050
Connection ~ 700  3950
Connection ~ 700  3850
Wire Wire Line
	3800 2550 3700 2550
Connection ~ 3700 2550
Connection ~ 3800 2550
Wire Wire Line
	3800 2200 3800 2150
Wire Wire Line
	6400 2050 6400 1950
Wire Wire Line
	6500 2050 6500 1950
Wire Wire Line
	6400 1950 6300 1950
Wire Wire Line
	6300 1950 6300 1600
Wire Wire Line
	6500 1950 6600 1950
Wire Wire Line
	6600 1950 6600 1600
Connection ~ 6300 1700
Connection ~ 6600 1700
Wire Wire Line
	6300 1300 6300 1250
Wire Wire Line
	6300 1250 6900 1250
Wire Wire Line
	6600 1250 6600 1300
Wire Wire Line
	6450 1250 6450 1200
Connection ~ 6450 1250
Wire Wire Line
	6000 1550 6000 2050
Wire Wire Line
	6100 1550 6100 2050
Wire Wire Line
	6200 2050 6200 1950
Wire Wire Line
	6200 1950 5750 1950
Wire Wire Line
	5750 1950 5750 1900
Wire Wire Line
	5750 1600 5750 1500
Wire Wire Line
	6600 2050 6600 2000
Wire Wire Line
	6900 2000 5000 2000
Wire Wire Line
	6900 1600 6900 2000
Wire Wire Line
	5900 2050 5900 2000
Connection ~ 6600 2000
Wire Wire Line
	6300 2050 6300 2000
Connection ~ 6300 2000
Connection ~ 5900 2000
Connection ~ 5000 2000
Wire Wire Line
	6900 1250 6900 1300
Connection ~ 6600 1250
Wire Wire Line
	7800 2950 8000 2950
Wire Wire Line
	7800 3050 8000 3050
Wire Wire Line
	7800 3150 8000 3150
Wire Wire Line
	8000 3250 7800 3250
Wire Wire Line
	7800 3350 8000 3350
Wire Wire Line
	7800 3450 8000 3450
Wire Wire Line
	7800 3550 8000 3550
Wire Wire Line
	7800 3650 8000 3650
Wire Wire Line
	7800 3750 8000 3750
Wire Wire Line
	6000 4750 6000 4800
Wire Wire Line
	6100 4800 6100 4750
Wire Wire Line
	4800 3650 5100 3650
Wire Wire Line
	4800 3750 5100 3750
Wire Wire Line
	4900 3750 4900 4050
Connection ~ 4900 3750
Wire Wire Line
	4550 4400 4900 4400
Wire Wire Line
	4900 4400 4900 4350
Wire Wire Line
	6200 4750 6200 4850
Connection ~ 6100 4800
Wire Wire Line
	6300 4800 6300 4750
Connection ~ 6200 4800
Wire Wire Line
	6200 5150 6200 5200
Wire Wire Line
	4550 4400 4550 4350
Wire Wire Line
	4750 4450 4750 4400
Connection ~ 4750 4400
Wire Wire Line
	6700 4750 6700 5150
Wire Wire Line
	6600 4750 6600 5150
Wire Wire Line
	6500 4800 6500 4750
Connection ~ 6300 4800
Connection ~ 6500 4800
Wire Wire Line
	6400 4750 6400 4900
Wire Wire Line
	6800 4750 6800 4900
Wire Wire Line
	6900 4750 6900 4900
Wire Wire Line
	7000 4750 7000 4900
Wire Wire Line
	6400 4900 7400 4900
Connection ~ 6800 4900
Connection ~ 6900 4900
Connection ~ 7000 4900
Wire Wire Line
	7400 4750 7400 5150
Connection ~ 7400 4900
Text Label 6600 5100 1    47   Italic 9
GR
Text Label 6700 5100 1    47   Italic 9
GIO1
Wire Wire Line
	7800 3850 7950 3850
Wire Wire Line
	7900 3850 7900 4800
Connection ~ 7900 4800
Wire Wire Line
	7900 4800 6000 4800
$Comp
L C C?
U 1 1 5825965F
P 7900 4950
F 0 "C?" H 7925 5050 50  0000 L CNN
F 1 "100nf" H 7950 4850 50  0000 L CNN
F 2 "" H 7938 4800 50  0000 C CNN
F 3 "" H 7900 4950 50  0000 C CNN
	1    7900 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5825985F
P 7900 5150
F 0 "#PWR?" H 7900 4900 50  0001 C CNN
F 1 "GND" H 7900 5000 50  0000 C CNN
F 2 "" H 7900 5150 50  0000 C CNN
F 3 "" H 7900 5150 50  0000 C CNN
	1    7900 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5150 7900 5100
$Comp
L +1V8 #PWR?
U 1 1 5825A128
P 7950 3850
F 0 "#PWR?" H 7950 3700 50  0001 C CNN
F 1 "+1V8" V 7900 4050 50  0000 C CNN
F 2 "" H 7950 3850 50  0000 C CNN
F 3 "" H 7950 3850 50  0000 C CNN
	1    7950 3850
	0    1    1    0   
$EndComp
Connection ~ 7900 3850
Wire Wire Line
	7800 3950 8250 3950
Text Label 7950 3950 0    47   Italic 9
GPIO3.3
Wire Wire Line
	4550 3250 5100 3250
$EndSCHEMATC
