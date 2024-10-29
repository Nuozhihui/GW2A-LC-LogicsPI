module led_light(
  input sys_clk,          //全局系统时钟
  input sys_rst_n,        //全局系统复位，低电平有效

  output reg [1:0] led    //LED灯

);

reg [25:0] count;         //计数器
//parameter  Scends = 50; // 1S 所需的脉冲
parameter  Scends = 50_000_000; // 1S 所需的脉冲

//定时 1 S
always @(posedge sys_clk or negedge sys_rst_n) begin
  if(!sys_rst_n)
    count <= 26'd0;
  else if(count < Scends - 26'd1 )
    count <= count +26'd1;
  else
    count <= 26'd0;
end

//LED 输出
always @(*) begin
  if(!sys_rst_n)
    led <= 2'b00;
  else if(count < Scends / 2  )
    led <= 2'b01;
  else
    led <= 2'b10;

end

endmodule