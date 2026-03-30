`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2026 11:07:12 AM
// Design Name: 
// Module Name: tb_interrupt_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_interrupt_generator();
reg sys_clk;
reg sys_rst_n;
reg int_en;
reg int_clr;
reg sig_in;
wire int_out;

interrupt_generator interrupt_generator_inst(.sys_clk(sys_clk),.sys_rst_n(sys_rst_n),
.int_en(int_en),.int_clr(int_clr),.sig_in(sig_in),.int_out(int_out));

localparam CLK_PERIOD=10;
initial
sys_clk=1'b0;
always #(CLK_PERIOD/2)
sys_clk=~sys_clk;
initial begin
//note that every 5 seconds is rising edge of clk
sys_rst_n=0;int_en=0;int_clr=0;sig_in=0;#45;
sys_rst_n=1;sig_in=0;#50;
int_en=1; #50;
sig_in=1; #50;
sig_in=0;#50;
int_clr=1;#10;
int_clr=0;
end
endmodule
