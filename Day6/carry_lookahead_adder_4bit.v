module carry_lookahead_adder(input [3:0]A, input [3:0]B,input Cin, output [3:0]Sum,output Cout);
wire [3:0]G,P;
wire [4:0]C;
assign G = A & B;
assign P = A ^ B;
assign C[0]=Cin;
assign C[1]=G[0] | (P[0] & C[0]);
assign C[2]=G[1] | (P[1]&C[1]);
assign C[3]=G[2] | (P[2]&C[2]);
assign C[4]=G[3] | (P[3]&C[3]);
assign Sum = P ^ C[3:0];
endmodule

module testbench_carry_lookahead_adder();
reg [3:0]A,B;
reg Cin;
wire [3:0]Sum;
wire Cout;
carry_lookahead_adder c1(A,B,Cin,Sum,Cout);
initial
begin
A=4'b0000; B=4'b0000; Cin=0;
#10 A=4'b0000; B=4'b0001; Cin=0;
#10 A=4'b0001; B=4'b0001; Cin=0;
#10 A=4'b0001; B=4'b0001; Cin=1;
#10 A=4'b1111; B=4'b1111; Cin=1;
#10 $finish;
end
endmodule