
`timescale 1ps /1ps

module tb();

   reg clk,rst_n;
   wire                  ddr_cs;
   wire                  ddr_ras;
   wire                  ddr_cas;
   wire                  ddr_we;
   wire                  ddr_ck;
   wire                  ddr_ck_n;
   wire                  ddr_cke;
   wire                  ddr_odt;
   wire                  ddr_reset_n;
   wire [2-1:0]          ddr_dm;	//DM_WIDTH=2
   wire [16-1:0]         ddr_dq;	//DQ_WIDTH=16
   wire [2-1:0]          ddr_dqs;	//DQS_WIDTH=2
   wire [2-1:0]          ddr_dqs_n;
   wire [14-1:0]         ddr_addr;		//ROW_WIDTH=14
   wire [3-1:0]          ddr_bank;		//BANK_WIDTH=3

   wire [3:0]            led;
   wire 			     init_calib_complete;
   wire  			     error;
   wire  			     error_flag;
   wire  			     running;

GSR GSR(.GSRI(1'b1));

ddr3_syn_top u_top(
  .clk(clk),
  .rst_nn(rst_n),
  .ddr_addr(ddr_addr),
  .ddr_bank(ddr_bank),
  .ddr_cs(ddr_cs),
  .ddr_ras(ddr_ras),
  .ddr_cas(ddr_cas),
  .ddr_we(ddr_we),
  .ddr_ck(ddr_ck),
  .ddr_ck_n(ddr_ck_n),
  .ddr_cke(ddr_cke),
  .ddr_odt(ddr_odt),
  .ddr_reset_n(ddr_reset_n),
  .ddr_dm(ddr_dm),
  .ddr_dq(ddr_dq),
  .ddr_dqs(ddr_dqs),
  .ddr_dqs_n(ddr_dqs_n),
  .led(led)
);

assign init_calib_complete = ~led[0];
assign running = led[1];
assign error = ~led[2];
assign error_flag = ~led[3];

ddr3_model ddr3_model(
          .rst_n            (ddr_reset_n),
          .ck               (ddr_ck),
          .ck_n             (ddr_ck_n),
          .cke              (ddr_cke),
          .cs_n             (ddr_cs),
          .ras_n            (ddr_ras),
          .cas_n            (ddr_cas),
          .we_n             (ddr_we),
          .dm_tdqs          (ddr_dm),
          .ba               (ddr_bank),
          .addr             (ddr_addr),
          .dq               (ddr_dq),
          .dqs              (ddr_dqs),
          .dqs_n            (ddr_dqs_n),
          .tdqs_n           (),
          .odt              (ddr_odt)
        );

always #10000 clk = ~clk; //unit ps

initial begin
  $fsdbDumpfile("tb.fsdb");
  $fsdbDumpvars;
end

initial
begin
    clk = 0;
    rst_n = 1;
    
    #2400000 //unit ps
    rst_n = 0;
    #480000 //unit ps
    rst_n = 1;

  #2000000000;//unit ps, 2ms
   $finish;
end

endmodule



