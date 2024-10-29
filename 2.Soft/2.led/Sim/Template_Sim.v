`timescale 1ns/1ns            // 时间尺度预编译指令：时间单位/时间精度
                              // 第一个 1ns 是时间单位（每个时间单位表示 1 纳秒）。
                              // 第二个 1ns 是时间精度（时间精度决定了仿真时间的分辨率，也就是说，模拟器能区分的最小时间间隔为 1 纳秒）。

module led_light_mod();       // 定义测试模块

// reg define
	reg sys_clk;                // 定义仿真文件全局时钟信号
	reg sys_rst_n;              // 定义仿真文件全局复位信号，下降沿有效

// wire define
	wire [1:0] led;             // 定义仿真文件的 LED 端口，使用 2 位宽度

always #10 sys_clk = ~sys_clk; // 每 10ns 反转一次 sys_clk 的值

initial begin
    sys_clk = 1'd0;             // 初始时钟状态为高电平
	sys_rst_n = 1'd0;           // 将复位信号拉低（有效复位）
	#200;                       // 延时 200ns
	sys_rst_n = 1'd1;           // 将复位信号拉高（复位结束）
	#200;                       // 延时 200ns
end

// 实例化
led_light u_led_light(
	.sys_clk(sys_clk),          // 将仿真文件的 sys_clk 连接到被测模块的时钟输入
	.sys_rst_n(sys_rst_n),      // 将仿真文件的复位信号连接到被测模块的复位输入
	.led(led)                   // 将被测模块的 LED 输出连接到仿真文件的 LED 端口
);

endmodule