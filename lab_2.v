
module Part_II(HEX0, HEX1, SW, LEDR);

 input [7:0] SW;
 output [6:0] HEX0, HEX1;
 output [7:0] LEDR;
 hex_decode hex_decode_0(SW[3:0], HEX0);
 hex_decode hex_decode_1(SW[7:4], HEX1);
 assign LEDR=SW;
 
endmodule

module  hex_decode(B,H);

 input[3:0] B;
 output[6:0] H;
 
 assign H[0] = B[2]&~B[1]&~B[0]|~B[3]&~B[2]&~B[1]&B[0];
 assign H[1] = B[2]&~B[1]&B[0]|B[2]&B[1]&~B[0];
 assign H[2] = ~B[2]&B[1]&~B[0];
 assign H[3] = B[2]&~B[1]&~B[0]|B[2]&B[1]&B[0]|~B[3]&~B[2]&~B[1]&B[0];
 assign H[4] = B[2]&~B[1]|B[0];
 assign H[5] = ~B[3]&~B[2]&B[0]|B[1]&B[0]|~B[2]&B[1];
 assign H[6] = ~B[3]&~B[2]&~B[1]|B[2]&B[1]&B[0];
 
endmodule 