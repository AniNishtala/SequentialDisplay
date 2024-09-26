module DisplayDecoder2sComplement(
    input [3:0] number,     // 4-bit 2's complement input number (-8 to 7)
    output reg [9:0] d      // 10-bit output to control segments
);
    always @(*) begin
        case (number)
            4'b0000: d = 10'b0000111111; // 0
            4'b0001: d = 10'b0000000110; // 1
            4'b0010: d = 10'b0001011011; // 2
            4'b0011: d = 10'b0001001111; // 3
            4'b0100: d = 10'b0001100110; // 4
            4'b0101: d = 10'b0001101101; // 5
            4'b0110: d = 10'b0001111101; // 6
            4'b0111: d = 10'b0000000111; // 7
            4'b1000: d = 10'b1001111111; // -8 (Represents the value -8)
            4'b1001: d = 10'b1000000111; // -7
            4'b1010: d = 10'b1001011111; // -6
            4'b1011: d = 10'b1001111010; // -5
            4'b1100: d = 10'b1001100110; // -4
            4'b1101: d = 10'b1001001111; // -3
            4'b1110: d = 10'b1001011011; // -2
            4'b1111: d = 10'b1000110111; // -1
            default: d = 10'b1111111111; // Error case: all segments off
        endcase
    end
endmodule