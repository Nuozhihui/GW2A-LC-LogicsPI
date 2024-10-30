
#####################################################################################
quit -sim

vlib work  

#mapping work library to current directory
#vmap [-help] [-c] [-del] [<logical_name>] [<path>]
vmap work  


#####################################################################################
#compile all .v files to work library
#-work <path>       Specify library WORK
#-vlog01compat      Ensure compatibility with Std 1364-2001
#-incr              Enable incremental compilation
#"rtl/*.v"          rtl directory all .v files, support relative path, need to add ""
#vlog

vlog -novopt  \
+incdir+../../tb/sim_model/ \
../../tb/prim_sim.v \
../../tb/tb.v \
../../project/src/ddr3_syn_top.v \
../../project/src/DDR3_test.v \
../../project/src/gowin_rpll/gowin_rpll.v \
../../project/src/ddr3_memory_interface/ddr3_memory_interface.vo \
../../tb/sim_model/ddr3_model.v


#complie all .vhd files
#-work <path>       Specify library WORK
#-93                Enable support for VHDL 1076-1993
#-2002              Enable support for VHDL 1076-2002
#vcom


#####################################################################################
#simulate testbench top file
#-L <libname>                     Search library for design units instantiated from Verilog and for VHDL default component binding
#+nowarn<CODE | Number>           Disable specified warning message  (Example: +nowarnTFMPC)                      
#-t [1|10|100]fs|ps|ns|us|ms|sec  Time resolution limit VHDL default: resolution setting from .ini file) 
#                                 (Verilog default: minimum time_precision in the design)
#-novopt                          Force incremental mode (pre-6.0 behavior)

vsim +nowarnTFMPC -L work -novopt -l tb.log work.tb 

#generate wave log format(WLF)......
log -r /*


#####################################################################################
#open wave window
view wave

#add simulation singals
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave /tb/u_top/clk
add wave /tb/u_top/rst_n
add wave /tb/u_top/clk_x1
add wave /tb/u_top/init_calib_complete
add wave /tb/u_top/app_en
add wave /tb/u_top/app_cmd
add wave /tb/u_top/app_addr
add wave /tb/u_top/app_rdy
add wave /tb/u_top/app_wdf_rdy
add wave /tb/u_top/app_wdf_wren
add wave /tb/u_top/app_wdf_end
add wave /tb/u_top/app_wdf_data
add wave /tb/u_top/app_wdf_mask
add wave /tb/u_top/app_rd_data_valid
add wave /tb/u_top/app_rd_data_end
add wave /tb/u_top/app_rd_data
add wave /tb/u_top/app_burst
add wave /tb/u_top/error
add wave /tb/u_top/error_flag
add wave /tb/u_top/ddr_addr
add wave /tb/u_top/ddr_bank
add wave /tb/u_top/ddr_cs
add wave /tb/u_top/ddr_ras
add wave /tb/u_top/ddr_cas
add wave /tb/u_top/ddr_we
add wave /tb/u_top/ddr_ck
add wave /tb/u_top/ddr_ck_n
add wave /tb/u_top/ddr_cke
add wave /tb/u_top/ddr_dm
add wave /tb/u_top/ddr_odt
add wave /tb/u_top/ddr_dq
add wave /tb/u_top/ddr_dqs
add wave /tb/u_top/ddr_dqs_n

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {912366093 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
update
WaveRestoreZoom {891247063 ps} {925431255 ps}



#####################################################################################
#set run time
run  -all





