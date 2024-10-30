module Template_Nuo(
    input sys_clk,                      //全局系统时钟
//	input sys_rst_n,		            //全局复位,低电平有效
    input      [1:0] key,              //按键

    output reg [1:0] led                //LED灯
);

reg  flag_led;                          //LED 状态控制信号
reg [24:0] count;                       //计数器
parameter  Scends = 25_000_000;         // 0.5S 所需的脉冲
//parameter  Scends = 25;               // 用于仿真

//定时 0.5 S
always @(posedge sys_clk)begin
//	if(!sys_rst_n)
//		count <= 25'd0;
//    else if(count < Scends - 25'd1)
    if(count < Scends - 25'd1)          // 如果计数器小于 0.5 秒所需的脉冲数，计数器加 1
        count <= count + 25'd1;
    else
        count <= 25'd0;                 // 否则，重置计数器

end

always @(posedge sys_clk) begin
//	if(!sys_rst_n)
//		flag_led <= 1'd0;
//    else if(count == (Scends - 25'd1))
    if(count == (Scends - 25'd1))
        flag_led <= ~flag_led;              //定时时间超过 0.5S 后将 flag_led 状态取反
    else
        flag_led <= flag_led;               //其他时间段保存不变

end


always @(posedge sys_clk) begin
//	if(!sys_rst_n)
//		led <= 2'b11;
//	else begin
    case(key)
        //如果二个按键都未被按下或者都被按下，则二个 LED 都保持常灭
        2'b11:
				led <= 2'b11;
		2'd00:
				led <= 2'b11;
        //如果 KEY0 按键都未被按下，则二个 LED 2'b00 -> 2'b11 ->2'b00 ->2'b11
        2'b10:begin
            if(flag_led == 1'b1)
                led <= 2'b00;
            else
                led <= 2'b11;
        end
        //如果 KEY1 按键都未被按下，则二个 LED 2'b01 -> 2'b10 ->2'b01 ->2'b10
        2'b01:begin
            if(flag_led == 1'b1)
                led <= 2'b01;
            else
                led <= 2'b10;
        end
        default :  ;            // 默认情况，不做任何改变

    endcase
//	end
end

endmodule