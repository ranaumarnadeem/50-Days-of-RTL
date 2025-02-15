module alu (
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input [3:0] Mode,
    output reg [7:0] result,
    output reg overflow_flag,
    output reg zero_flag,
    output reg negative_flag,
    output reg carry_flag
);

always@(*) begin
    carry_flag=0;
    overflow_flag=0;
    zero_flag=0;
    negative_flag=0;
    case (Mode)
4'b0000: begin
    {carry_flag,result}=A+B+Cin;
    overflow_flag=(A[7]&B[7]&~result[7])|(~A[7]&~B[7]&result[7]);
end
4'b0001: begin
    {carry_flag,result}=A-B-Cin;
    overflow_flag=(A[7]&~B[7]&~result[7])|(~A[7]&B[7]&result[7]);
end
4'b0010: begin
    {carry_flag,result}=A&B;
end
4'b0011: begin
    {carry_flag,result}=A|B;
end
4'b0100:result =A&B;
4'b0101:result =A|B;
4'b0110:result =A^B;
4'b0111:result =~A;
4'b1000:result =A<<1;
4'b1001:result =A>>1;
4'b1010:result =A<<B;
4'b1011:result =A>>B;
4'b1100:result =~(A&B);
4'b1101:result =~(A|B);
4'b1110:result =~(A^B);
4'b1111:result =A~^B;
default: result =8'b0;
endcase
if (result==0) zero_flag=1;
if (result[7]==1) negative_flag=1;
end
endmodule

module testbench_alu();
reg [7:0]A,B;
reg Cin;
reg [3:0]Mode;
wire [7:0]Result;
wire overflow_flag,zero_flag,negative_flag,carry_flag;
alu c1(A,B,Cin,Mode,Result,overflow_flag,zero_flag,negative_flag,carry_flag);
initial
begin
A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0000;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0000;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0000;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0000;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0000;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0001;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0001;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0001;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0001;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0001;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0010;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0010;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0010;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0010;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0010;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0011;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0011;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0011;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0011;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0011;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0100;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0100;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0100;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0100;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0100;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0101;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0101;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0101;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0101;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0101;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0110;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0110;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0110;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0110;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0110;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b0111;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b0111;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b0111;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b0111;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b0111;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1000;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1000;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1000;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1000;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1000;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1001;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1001;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1001;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1001;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1001;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1010;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1010;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1010;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1010;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1010;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1011;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1011;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1011;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1011;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1011;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1100;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1100;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1100;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1100;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1100;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1101;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1101;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1101;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1101;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1101;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1110;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1110;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1110;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1110;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1110;
#10 A=8'b00000000; B=8'b00000000; Cin=0; Mode=4'b1111;
#10 A=8'b00000000; B=8'b00000001; Cin=0; Mode=4'b1111;
#10 A=8'b00000001; B=8'b00000001; Cin=0; Mode=4'b1111;
#10 A=8'b00000001; B=8'b00000001; Cin=1; Mode=4'b1111;
#10 A=8'b11111111; B=8'b11111111; Cin=1; Mode=4'b1111;

end
endmodule