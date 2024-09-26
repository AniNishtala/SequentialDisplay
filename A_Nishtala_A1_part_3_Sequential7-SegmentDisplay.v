 module Mux2to1_10bit(
    input [9:0] in0,    // First 10-bit input bus
    input [9:0] in1,    // Second 10-bit input bus
    input sel,          // Select line (1 bit)
    output [9:0] out    // 10-bit output bus
);

    // Assign the output based on the value of the select line
    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
