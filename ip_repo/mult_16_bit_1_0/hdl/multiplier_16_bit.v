`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2026 08:58:31 AM
// Design Name: 
// Module Name: multiplier_16_bit
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


module multiplier_16_bit(
input rst_n, input clk, input [15:0] a, input [15:0] b,
output [31:0] prod
);
reg [31:0] out;

always @(posedge clk or negedge rst_n)  begin
if (!rst_n) begin
out<=32'b0;
end else begin
out<=a*b;
end
end
assign prod=out;
endmodule
