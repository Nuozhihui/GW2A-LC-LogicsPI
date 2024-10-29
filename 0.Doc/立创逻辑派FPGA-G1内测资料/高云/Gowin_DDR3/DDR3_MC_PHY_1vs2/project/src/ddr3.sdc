//Copyright (C)2014-2022 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8.07 
//Created Time: 2022-07-08 10:16:44
create_clock -name clk -period 20 -waveform {0 10} [get_ports {clk}]
create_clock -name tck_pad_i -period 10 -waveform {0 5} [get_ports {tck_pad_i}] -add
create_clock -name clk_x1 -period 10 -waveform {0 5} [get_nets {clk_x1}] -add
create_clock -name memory_clk -period 5 -waveform {0 2.5} [get_nets {memory_clk}] -add
set_clock_groups -exclusive -group [get_clocks {clk}] -group [get_clocks {memory_clk}] -group [get_clocks {clk_x1}] -group [get_clocks {tck_pad_i}]
