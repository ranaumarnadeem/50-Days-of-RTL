module decoder(input [2:0]I,output [7:0] Y);

assign Y =
(I== 3'b000)?8'b00000001:
(I== 3'b001)?8'b00000010:
(I== 3'b010)?8'b00000011:
(I== 3'b011)?8'b00000100:
(I== 3'b100)?8'b00000101:
(I== 3'b101)?8'b00000110:
(I== 3'b110)?8'b00000111:
(I== 3'b111)?8'b00001000:8'b00000000;

endmodule

module decoder_tb();

reg [2:0] i;
wire [7:0] y;
integer a;

decoder uut (.I(i), .Y(y));

initial begin
    for (a = 0; a < 8; a = a + 1) begin
        i = a;
        #10;
    end
    $finish;
end
endmodule


