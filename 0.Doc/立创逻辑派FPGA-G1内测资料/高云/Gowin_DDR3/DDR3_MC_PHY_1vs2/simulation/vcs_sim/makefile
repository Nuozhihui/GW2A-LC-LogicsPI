srcfile:=	../../project/src/ddr3_syn_top.v \
            ../../project/src/DDR3_test.v \
            ../../project/src/gowin_rpll/gowin_rpll.v \
            ../../project/src/ddr3_memory_interface/ddr3_memory_interface.vo
			

tbfile:=	../../tb/tb.v \
			../../tb/sim_model/ddr3_model.v

incpath:=	+incdir+../../tb/sim_model/  
			

vcs:
	vcs -debug_all -R -full64 -fsdb -sverilog \
	-v ../../tb/prim_sim.v \
	$(tbfile) \
	$(srcfile) \
	$(incpath) 

verdi:
	verdi -sverilog	-nologo \
	-v ../../tb/prim_sim.v \
	$(tbfile) \
	$(srcfile) \
	$(incpath) \
	-ssf tb.fsdb \
	&

clean:
	rm -rf compile  *.err *.log csrc  run.do  simv  simv.daidir  ucli.key  vc_hdrs.h  work novas.rc  nWaveLog   vcd2fsdbLog  verilog.vcd  verilog.vcd.fsdb vsim.wlf simv.vdb INCA_libs waves.shm .simvision *.rc cov_work daTaseT.asdb  fcover.acdb  library.cfg elab_file *.ucdb verdiLog inTer.vpd novas.conf wave.ses.png *.fsdb daTa


