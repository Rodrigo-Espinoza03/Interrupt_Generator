`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2026 10:24:37 AM
// Design Name: 
// Module Name: interrupt_generator
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


module interrupt_generator(
input sys_clk, input sys_rst_n, input int_en, input int_clr, input sig_in,
output reg int_out
    );
reg sig_in_prev;
always @(posedge sys_clk) begin
 if (!sys_rst_n) begin
    int_out<=0;
    sig_in_prev<=0;
 end else begin
 sig_in_prev<=sig_in;
 if (int_clr) begin
    int_out<=0;
end else if (sig_in && int_en&& (!sig_in_prev)) begin
    int_out<=1'b1;
 end
 end
end
endmodule
