module comparator (input [3:0]A,input [3:0]B, output A_greater_than_B, output A_equal_to_B, output A_less_than_B);
    assign A_greater_than_B = (A>B);
    assign A_equal_to_B = (A==B);
    assign A_less_than_B = (A<B);
endmodule

module testbench_comparator();
    reg [3:0]A,B;
    wire A_greater_than_B, A_equal_to_B, A_less_than_B;
    comparator c1(A,B,A_greater_than_B,A_equal_to_B,A_less_than_B);
    initial
    begin
        A=4'b0000; B=4'b0000;
        #10 A=4'b0000; B=4'b0001;
        #10 A=4'b0001; B=4'b0001;
        #10 A=4'b0101; B=4'b0001;
        #10 A=4'b1111; B=4'b1111;
       
    end
    endmodule