module led(
  input sys_clk,          // 全局系统时钟
  input sys_rst_n,        // 全局系统复位，低电平有效

  output reg led          // LED 灯输出
);

reg [25:0] count;         // 计数器，用于计时
parameter Scends = 50_000_000; // 1 秒所需的脉冲数（假设系统时钟为 50MHz）

// 定时 1 秒
always @(posedge sys_clk or negedge sys_rst_n) begin
  if (!sys_rst_n)
    count <= 26'd0;                 // 如果复位信号有效，计数器清零
  else if (count < Scends - 26'd1)
    count <= count + 26'd1;         // 如果计数器未到达 1 秒，继续计数
  else
    count <= 26'd0;                  // 达到 1 秒后，计数器清零
end

always @(*) begin
  if (!sys_rst_n)
    led <= 1'b0;                    // 如果复位信号有效，LED 关闭
  else if (count < Scends / 2)
    led <= 1'b1;                    // 计数器在前半秒，LED 点亮
  else
    led <= 1'b0;                    // 计数器在后半秒，LED 熄灭
end

endmodule