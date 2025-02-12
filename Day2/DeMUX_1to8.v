module DEMUX(input Y,input [2:0]S, output reg [7:0] I);

always @(*)begin
case (S)
3'b000:I[0]<=Y;
3'b001:I[1]<=Y;
3'b010:I[2]<=Y;
3'b011:I[3]<=Y;
3'b100:I[4]<=Y;
3'b101:I[5]<=Y;
3'b110:I[6]<=Y;
3'b111:I[7]<=Y;

endcase
end
endmodule

module demux_tb();
 reg y;
 reg s;
 wire i;

DEMUX uut(.Y(y),.S(s),.I(i));

initial begin
        $monitor("Time: %0t | Y: %b | S: %b | I: %b", $time, y, s, i);

        y = 1;
        s = 3'b000; #100;
        s = 3'b001; #100;
        s = 3'b010; #100;
        s = 3'b011; #100;
        s = 3'b100; #100;
        s = 3'b101; #100;
        s = 3'b110; #100;
        s = 3'b111; #100;

        y = 0;
        s = 3'b000; #100;
        s = 3'b001; #100;
        s = 3'b010; #100;
        s = 3'b011; #100;
        s = 3'b100; #100;
        s = 3'b101; #100;
        s = 3'b110; #100;
        s = 3'b111; #100;

        $finish;
    end
endmodule