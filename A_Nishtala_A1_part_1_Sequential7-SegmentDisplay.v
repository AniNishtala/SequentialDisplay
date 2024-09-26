module DisplayDecoder(
    input [3:0] number,     // 4-bit input number (0-15)
    output reg [9:0] d      // 10-bit output to control segments
);
    always @(*) begin
        case (number)
            4'b0000: d = 10'b0000000011; // 0
            4'b0001: d = 10'b1001111111; // 1
            4'b0010: d = 10'b0010010100; // 2
            4'b0011: d = 10'b0000110100; // 3
            4'b0100: d = 10'b1001100100; // 4
            4'b0101: d = 10'b0100100100; // 5
            4'b0110: d = 10'b0100000100; // 6
            4'b0111: d = 10'b0001111111; // 7
            4'b1000: d = 10'b0000000100; // 8
            4'b1001: d = 10'b0000100100; // 9
            4'b1010: d = 10'b0001000100; // A
            4'b1011: d = 10'b1100000100; // b
            4'b1100: d = 10'b0110001110; // C
            4'b1101: d = 10'b1000010100; // d
            4'b1110: d = 10'b0110000100; // E
            4'b1111: d = 10'b0111000100; // F
            default: d = 10'b1111111111; // Turn off all segments
        endcase
    end
endmodule