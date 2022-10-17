

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:57 11/15/2021 
// Design Name: 
// Module Name:    UDC 
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
module UDC(rst,clk,upDown,sevenSegment,anode);
input rst,clk;
input upDown;
output reg[7:0] sevenSegment;
output reg[3:0] anode;
wire en;
timer timer(.clk(clk),.rst(rst),.en(en));
reg [3:0] cnt,cntNext;
always@(posedge clk) begin
 cnt <= #1 cntNext;
end
always @(*) begin 
	anode=4'b0111;
	cntNext=cnt;
	sevenSegment = 8'b00000011;
	 if(rst) begin
	  cntNext=0;
	  sevenSegment = 8'b00000011;
	 end
	else if(en) begin 
	 if(upDown==1) begin
	 cntNext=cnt+1;
	 if(cnt==9) begin
	 cntNext=0;
	 end 
	 end else if(upDown==0) begin
	 cntNext=cnt-1;
	 if(cnt==0) begin
	 cntNext=9;
	 end 
	 end
	 end
	 case(cnt)
			0:  sevenSegment = 8'b00000011;  //0
			1:  sevenSegment = 8'b10011111;  //1
			2:  sevenSegment = 8'b00100101;  //2
			3:  sevenSegment = 8'b00001101;  //3
			4:  sevenSegment = 8'b10011001;  //4
			5:  sevenSegment = 8'b01001001;  //5
			6:  sevenSegment = 8'b01000001;  //6
			7:  sevenSegment = 8'b00011111;  //7
			8:  sevenSegment = 8'b00000001;  //8
			9:  sevenSegment = 8'b00001001;  //9
		endcase
  end
		  
endmodule
