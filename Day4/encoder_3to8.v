module encoder_8to3(input [7:0] I, output reg [2:0] Y);
    always @(*) begin
        case (I)
            8'b00000001: Y = 3'd0;
            8'b00000010: Y = 3'd1;
            8'b00000100: Y = 3'd2;
            8'b00001000: Y = 3'd3;
            8'b00010000: Y = 3'd4;
            8'b00100000: Y = 3'd5;
            8'b01000000: Y = 3'd6;
            8'b10000000: Y = 3'd7;
            default: Y = 3'd0;
        endcase
    end
endmodule

module encoder_tb();
    reg [7:0] i;
    wire [2:0] y;
    integer temp;
    encoder_8to3 uut (i, y);

    initial begin
        for (temp = 0; temp < 8; temp = temp + 1) begin
            i = 8'b1 << temp;
            #10;
        end
        $finish;
    end
endmodule
