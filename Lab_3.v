
module lab_3(SW,KEY,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,LEDR);

input [7:0] SW;
input [1:0] KEY;

output [6:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
output [9:0] LEDR;

reg [7:0] A;
wire [7:0] B,S;
wire carry0;

always @ (posedge KEY[1] or negegde KEY[0]) 
begin
if(!KEY[0])
A<=8'd0;
else
A<=SW[7:0];
end

assign B=SW;

hex7seg digit_3(A[7:4],HEX3);
hex7seg digit_2(A[3:0],HEX2);
hex7seg digit_1(B[7:4],HEX1);
hex7seg digit_0(B[3:0],HEX0);
hex7seg digit_5(S[7:4],HEX5);
hex7seg digit_4(S[3:0],HEX4);

assign (carry, S)=A+B;
assign LEDR[0]=carry;
assign LEDR [9:1]=9'b0;

endmodule

module hex7seg(hex,display);
 
input [3:0] hex;
output [6:0] display;
reg [6:0] display;
 
always @*
case(hex)
4'h0 : display=7'b1000000;
4'h1 : display=7'b1111001;
4'h2 : display=7'b0010100;
4'h3 : display=7'b0011000;
4'h4 : display=7'b0011001;
4'h5 : display=7'b0010010;
4'h6 : display=7'b0000010;
4'h7 : display=7'b1111000;
4'h8 : display=7'b0000000;
4'h9 : display=7'b0010000;
4'hA : display=7'b0100000;
4'hb : display=7'b0000011;
4'hC : display=7'b1000110;
4'hd : display=7'b0100001;
4'hE : display=7'b0000110;
4'hF : display=7'b0001110;
endcase

endmodule 