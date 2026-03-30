`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2026 09:01:31 AM
// Design Name: 
// Module Name: tb_multiplier_16_bit
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


module tb_multiplier_16_bit();
reg rst_n;
reg clk;
reg [15:0] a;
reg [15:0] b;
wire [31:0] prod;

multiplier_16_bit multiplier_16_bit_tb(.rst_n(rst_n),.clk(clk),.a(a),.b(b),
.prod(prod));

localparam CLK_PERIOD=10;//set period to 10ns
reg [15:0] i;

initial
clk=1'b0;

always #(CLK_PERIOD/2)
clk=~clk;
initial begin
rst_n=1'b0;a=16'b0;i=16'b0;b=16'b0;#5;
rst_n=1'b1;
for(i=16'b0;i<33;i=i+16'b1) begin
a=i[15:0];
b=i[15:0];

#10;
end
a=16'b0;
b=16'b0;
end
endmodule
