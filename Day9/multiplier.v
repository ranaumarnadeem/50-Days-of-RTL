module mutliplier(input [3:0]A, input [3:0]B, output [7:0]Product);
wire [7:0]p0,p1,p2,p3;
assign p0= B[0]?A:8'b0;
assign p1 =B[1]?A:8'b0;
assign p2 =B[2]?A:8'b0;
assign p3 =B[3]?A:8'b0;
assign Product=p0+(p1<<1)+(p2<<2)+(p3<<3);
endmodule

module testbench_multiplier();
reg [3:0]A,B;
wire [7:0]Product;
mutliplier c1(A,B,Product);
initial
begin

A=4'b0000; B=4'b0000;
#10 A=4'b0000; B=4'b0001;
#10 A=4'b0001; B=4'b0001;
#10 A=4'b0101; B=4'b0001;
#10 A=4'b1111; B=4'b1111;
end
endmodule


