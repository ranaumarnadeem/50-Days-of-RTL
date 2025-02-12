module MUX(input [2:0] S, input [7:0] I, output reg Y);
    always @(*) begin
        case (S)
            3'b000: Y = I[0];
            3'b001: Y = I[1];
            3'b010: Y = I[2];
            3'b011: Y = I[3];
            3'b100: Y = I[4];
            3'b101: Y = I[5];
            3'b110: Y = I[6];
            3'b111: Y = I[7];
            default: $display("Invalid Argument");
        endcase
    end
endmodule


module mux_tb();
    reg [2:0] s;
    reg [7:0] i;
    wire y;

    MUX uut (.S(s), .I(i), .Y(y));

    initial begin
        $monitor("Time: %0t | S: %b | I: %b | Y: %b", $time, s, i, y);

        i = 8'b10101010;
        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;

        i = 8'b01010101;
        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;

        $finish;
    end
endmodule
