module Template_Nuo(
    input sys_clk,              // 全局时钟
    input sys_rst_n,            // 全局复位，低电平有效

    output reg [7:0] seg        // 数码管输出定义
);

reg [25:0] count;               // 计数器，用于1秒计时
reg [3:0]  number;              // 数码管显示的数字

parameter Scends = 50_000_000;  // 1秒所需的脉冲计数
// parameter Scends = 50;       // 仿真使用的脉冲计数

// 计数器部分：用于产生1秒周期的脉冲
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        count <= 26'd0;                  // 复位时计数器清零
    else if(count < Scends - 1)
        count <= count + 1;              // 计数递增
    else
        count <= 26'd0;                  // 到达1秒后重新计数
end

// 数字增量部分：每秒递增数码管显示的数字
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        number <= 4'd0;                  // 复位时显示数字为0
    else if(count == Scends - 1) begin
        number <= number + 4'd1;         // 每到1秒，数字加1
        if(number == 4'd9)               // 若达到9则重置为0
            number <= 4'd0;
    end
end

// 数码管显示部分：根据当前的数字控制数码管输出
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        seg <= 8'hC0;                    // 复位时显示"0"
    else begin
        case(number)
            4'd0: seg <= 8'hC0;          // 显示"0"
            4'd1: seg <= 8'hF9;          // 显示"1"
            4'd2: seg <= 8'hA4;          // 显示"2"
            4'd3: seg <= 8'hB0;          // 显示"3"
            4'd4: seg <= 8'h99;          // 显示"4"
            4'd5: seg <= 8'h92;          // 显示"5"
            4'd6: seg <= 8'h82;          // 显示"6"
            4'd7: seg <= 8'hF8;          // 显示"7"
            4'd8: seg <= 8'h80;          // 显示"8"
            4'd9: seg <= 8'h90;          // 显示"9"
            default: seg <= 8'hFF;       // 其他情况清屏
        endcase
    end
end

endmodule
