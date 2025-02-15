module router(input [7:0]A,input [2:0]select_line, output reg [7:0]out[7:0]);

always@(*) begin
    case (select_line)
 3'b000: begin
     out[0]=A;
 end
 3'b001: begin
     out[1]=A;
 end
 3'b010: begin
     out[2]=A;
 end
 3'b011: begin
     out[3]=A;
 end
 3'b100: begin
     out[4]=A;
 end
 3'b101: begin
     out[5]=A;
 end
 3'b110: begin
     out[6]=A;
 end
 3'b111: begin
     out[7]=A;
 end
 default: out[0]=8'b0;
 endcase
end
endmodule   

module testbench_router();

reg [7:0]A;
reg [2:0]select_line;
wire [7:0]out[7:0];
router c1(A,select_line,out);
initial
begin
    A=8'b00000000; select_line=3'b000;
    #10 A=8'b00000001; select_line=3'b000;
    #10 A=8'b00000010; select_line=3'b000;
    #10 A=8'b00000011; select_line=3'b000;
    #10 A=8'b00000100; select_line=3'b000;
    #10 A=8'b00000101; select_line=3'b000;
    #10 A=8'b00000110; select_line=3'b000;
    #10 A=8'b00000111; select_line=3'b000;
    #10 A=8'b00000000; select_line=3'b001;
    #10 A=8'b00000001; select_line=3'b001;
    #10 A=8'b00000010; select_line=3'b001;
    #10 A=8'b00000011; select_line=3'b001;
    #10 A=8'b00000100; select_line=3'b001;
    #10 A=8'b00000101; select_line=3'b001;
    #10 A=8'b00000110; select_line=3'b001;
    #10 A=8'b00000111; select_line=3'b001;
    #10 A=8'b00000000; select_line=3'b010;
    #10 A=8'b00000001; select_line=3'b010;
    #10 A=8'b00000010; select_line=3'b010;
    #10 A=8'b00000011; select_line=3'b010;
    #10 A=8'b00000100; select_line=3'b010;
    #10 A=8'b00000101; select_line=3'b010;
    #10 A=8'b00000110; select_line=3'b010;
    #10 A=8'b00000111; select_line=3'b010;
    #10 A=8'b00000000; select_line=3'b011;
    #10 A=8'b00000001; select_line=3'b011;
    #10 A=8'b00000010; select_line=3'b011;
    #10 A=8'b00000011; select_line=3'b011;
    #10 A=8'b00000100; select_line=3'b011;
    #10 A=8'b00000101; select_line=3'b011;
    #10 A=8'b00000110; select_line=3'b011;
    #10 A=8'b00000111; select_line=3'b011;
    #10 A=8'b00000000; select_line=3'b100;
    #10 A=8'b00000001; select_line=3'b100;
    #10 A=8'b00000010; select_line=3'b100;
    #10 A=8'b00000011; select_line=3'b100;
    #10 A=8'b00000100; select_line=3'b100;
    #10 A=8'b00000101; select_line=3'b100;
    #10 A=8'b00000110; select_line=3'b100;
    #10 A=8'b00000111; select_line=3'b100;
    #10 A=8'b00000000; select_line=3'b101;
    #10 A=8'b00000001; select_line=3'b101;
    #10 A=8'b00000010; select_line=3'b101;
    #10 A=8'b00000011; select_line=3'b101;
    #10 A=8'b00000100; select_line=3'b101;
    #10 A=8'b00000101; select_line=3'b101;
    #10 A=8'b00000110; select_line=3'b101;
    #10 A=8'b00000111; select_line=3'b101;
    #10 A=8'b00000000; select_line=3'b110;
    #10 A=8'b00000001; select_line=3'b110;
    #10 A=8'b00000010; select_line=3'b110;
    #10 A=8'b00000011; select_line=3'b110;
    #10 A=8'b00000100; select_line=3'b110;
    #10 A=8'b00000101; select_line=3'b110;
    #10 A=8'b00000110; select_line=3'b110;
    #10 A=8'b00000111; select_line=3'b110;
    #10 A=8'b00000000; select_line=3'b111;
    #10 A=8'b00000001; select_line=3'b111;
    #10 A=8'b00000010; select_line=3'b111;
    #10 A=8'b00000011; select_line=3'b111;
    #10 A=8'b00000100; select_line=3'b111;
    #10 A=8'b00000101; select_line=3'b111;
    #10 A=8'b00000110; select_line=3'b111;
    #10 A=8'b00000111; select_line=3'b111;
     

end
endmodule



