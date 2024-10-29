`timescale 1ns/1ns					//时间尺度预编译指令 时间单位/时间精度。
									//第一个 1ns 是时间单位（每个时间单位表示 1 纳秒）。
									//第二个 1ns 是时间精度（时间精度决定了仿真时间的分辨率，也就是说，模拟器能区分的最小时间间隔为 1 纳秒）。
module led_mod();

//reg define
	reg sys_clk;					//定义仿真文件全局时钟。
	reg sys_rst_n;					//定义仿真文件全局复位，下降沿有效。

//wire define
	wire led;						////定义仿真文件 led 端口。


always#10 sys_clk = ~sys_clk;		//#10 表示延时 10ns。
									//也就是说，每 10ns  sys_clk就反转一下。


initial begin                       //初始化

    sys_clk   = 1'd0;
	sys_rst_n = 1'd0;			    //将复位信号拉低。
#200;					            //#200 表示延时 200ns。
	sys_rst_n = 1'd1;			    //将复位信号拉高。
#200;					            //#200 表示延时 200ns。

end

led u_led(
	.sys_clk(sys_clk),			    //将仿真文件的sys_clk 和 led_light 的时钟进一个绑定。
	.sys_rst_n(sys_rst_n),
	.led(led)
);

endmodule