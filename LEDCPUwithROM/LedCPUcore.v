`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:29 12/21/2021 
// Design Name: 
// Module Name:    LedCPUcore 
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
module LedCPUcore(clk,rst,addrRd,dataRd,outPattern );
	input  clk,rst;
	output reg [7:0] addrRd;
	input [15:0] dataRd;
	output reg [7:0] outPattern; 

	parameter FREQ = 50_000_000/16;

	reg [7:0] addrRdNext;
	reg [7:0] outPatternNext;
	reg [25:0] count, countNext;
	reg [7:0] processTime, processTimeNext;
  
	always@(posedge clk) begin
		addrRd <= addrRdNext;
		outPattern <= outPatternNext;
		count <= countNext;
		processTime <= processTimeNext;
	end

	always@(*)begin
		outPatternNext = outPattern;
		countNext = count;
		processTimeNext = processTime;
		addrRdNext = addrRd;
		if(rst)begin
			addrRdNext = 0;
			outPatternNext = 0;
			countNext = 0;
			processTimeNext = 0;
		end
	 else if(dataRd[7:0]!=0)begin
		countNext=count+1;
		outPatternNext=dataRd[15:8];
		if(count==FREQ)begin
		countNext=0;
		processTimeNext=processTime+1;
		end
		if(processTime==dataRd[7:0]) begin
		addrRdNext=addrRd+1;
		processTimeNext=0;
		end
                 
      end
	 else if(dataRd[7:0]==0) begin
	 addrRdNext=addrRd+1;
	 end
	 end
	endmodule