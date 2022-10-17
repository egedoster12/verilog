`timescale 1ns / 1ps
module led(clk, rst,switch, dataOut);

input clk, rst;
input [7:0] switch;
output reg [7:0] dataOut;

reg [21:0] counter, counterNext;
reg [ 7:0] dataOutNext;
reg changeD=0;
reg changeDnext;
parameter COUNT = 50000000;
wire [3:0] mod1;

always @(posedge clk) begin
	counter <= #1 counterNext;
	dataOut <= #1 dataOutNext;
	changeD <= #1 changeDnext; 
end

always @(*) begin
	counterNext = counter;
	dataOutNext = dataOut;
	changeDnext = changeD;
	if(rst) begin
		dataOutNext = 8'b1000_0000;
		counterNext = 0;
		changeDnext = 0;
	end
	
	if(counter == COUNT -1)begin
	
	if(((switch[0]+switch[1]+switch[2]+switch[3]+switch[4]+switch[5]+switch[6]+switch[7])%4)==3)begin
	if(dataOut[6]==1)begin
		changeDnext=0;
		end
	if(dataOut[1]==1)begin
		changeDnext=1;
		end
	if(changeD == 0)begin
		dataOutNext = {dataOut[0], dataOut[7:1]};
		counterNext = 0;		
		end
	if(changeD==1) begin
		dataOutNext = {dataOut[6:0], dataOut[7]};
		counterNext = 0;
		end
		end
		end
	if(counter == COUNT -1)begin
	if((mod1) /4==2)begin
	dataOutNext = {dataOut[0], dataOut[7:1]};
		counterNext = 0;
		end 
		end
	if(counter == COUNT -1)begin
	if((mod1) /4==1)begin
	dataOutNext = {dataOut[6:0], dataOut[7]};
	counterNext = 0;
		end 
		end
		if(counter == COUNT -1)begin
	if((mod1) /4==0)begin
	dataOutNext[7:0]=1;
	counterNext = 0;
	end
	end
		else begin
		dataOutNext = dataOut;
		counterNext = counter +1;
		 
	end
end

endmodule

