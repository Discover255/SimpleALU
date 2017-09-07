module testPCB(A,B);
input [11:0] A;
output [6:0] B;
wire [4:0] fuck;

assign B[0] = ~A[0];
assign B[1] = ~A[1];
assign B[2] = ~A[2];
assign B[3] = ~A[3];
assign B[4] = ~A[4];
assign B[5] = ~A[5];
assign B[6] = ~A[6];
assign fuck[0] = ~A[7];
assign fuck[1] = ~A[8];
assign fuck[2] = ~A[9];
assign fuck[3] = ~A[10];
assign fuck[4] = ~A[11];
endmodule
