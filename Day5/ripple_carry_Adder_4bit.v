module fulladder(input a, input b,output sum ,output carryout);
    assign sum = a ^ b;
    assign carryout = a & b;



endmodule

module ripple_carry_Adder_4biy(input [3:0] a, input [3:0] b, output [3:0] sum, output carryout);
    wire [3:0] c;
    fulladder fa0 (a[0], b[0], sum[0], c[0]);
    fulladder fa1 (a[1], b[1], sum[1], c[1]);
    fulladder fa2 (a[2], b[2], sum[2], c[2]);
    fulladder fa3 (a[3], b[3], sum[3], c[3]);
    assign carryout = c[3];

    endmodule

module ripple_carry_Adder_4bit_tb();

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carryout;
    integer temp;
    ripple_carry_Adder_4biy uut (a, b, sum, carryout);

    initial begin
        for (temp = 0; temp < 16; temp = temp + 1) begin
            a = temp;
            b = temp;
            #10;
        end
        $finish;
    end

    endmodule