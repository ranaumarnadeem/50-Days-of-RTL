module add_sub_4bit(input [3:0]A, input [3:0]B, input Cin, input Mode, output [3:0]Sum, output Cout);
wire [4:0]c;
wire [3:0]b;

xor x1(b[0],B[0],Mode);
xor x2(b[1],B[1],Mode);
xor x3(b[2],B[2],Mode);
xor x4(b[3],B[3],Mode);

assign c[0]=Cin;

fulladder f1(A[0],b[0],c[0],Sum[0],c[1]);
fulladder f2(A[1],b[1],c[1],Sum[1],c[2]);
fulladder f3(A[2],b[2],c[2],Sum[2],c[3]);
fulladder f4(A[3],b[3],c[3],Sum[3],c[4]);
assign Cout=c[4];
endmodule

module fulladder(input A,B,Cin, output Sum, output Cout);
assign sum=A+B+Cin;
assign Cout=(A&B)|(B&Cin)|(A&Cin);

endmodule

module testbench_add_sub_4bit();

reg [3:0]A,B;
reg Cin,Mode;
wire [3:0]Sum;
wire Cout;
add_sub_4bit c1(A,B,Cin,Mode,Sum,Cout);
initial
begin
A=4'b0000; B=4'b0000; Cin=0; Mode=0;
#10 A=4'b0000; B=4'b0001; Cin=0; Mode=0;
#10 A=4'b0001; B=4'b0001; Cin=0; Mode=0;
#10 A=4'b0001; B=4'b0001; Cin=1; Mode=0;
#10 A=4'b1111; B=4'b1111; Cin=1; Mode=0;
#10 A=4'b0000; B=4'b0000; Cin=0; Mode=1;
#10 A=4'b0000; B=4'b0001; Cin=0; Mode=1;
#10 A=4'b0001; B=4'b0001; Cin=0; Mode=1;
#10 A=4'b0001; B=4'b0001; Cin=1; Mode=1;
#10 A=4'b1111; B=4'b1111; Cin=1; Mode=1;
$finish;
end

endmodule
