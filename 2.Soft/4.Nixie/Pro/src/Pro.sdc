//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.02 
//Created Time: 2024-10-30 00:09:54
create_clock -name sys_clk -period 20 -waveform {0 10} [get_ports {sys_clk}]
