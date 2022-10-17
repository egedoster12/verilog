`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:00:18 11/16/2021 
// Design Name: 
// Module Name:    timer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module timer(clk, rst, en);
input clk, rst;
output en;


parameter COUNT=50_000_000;
reg [25:0] cnt, cntNext;

always@(posedge clk)begin
	cnt <= cntNext;
end

always@(*)begin
	cntNext=cnt;
if(rst) begin
cntNext = 0;
end
else if(COUNT==cnt-1)begin
cntNext=0;
end
cntNext = cnt + 1;
end

assign en = (cnt==0);

endmodule
