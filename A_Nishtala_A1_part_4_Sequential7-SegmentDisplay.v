module TopModule(
    input clk,               // Clock signal
    input reset,             // Reset signal
    input sel,               // Select signal for the MUX
    input [3:0] in0,         // First 4-bit input for 2's complement decoder
    input [3:0] in1,         // Second 4-bit input for unsigned decoder
    output reg [9:0] out_display // 10-bit output for the digital display
);

    wire [9:0] mux_out;      // Output of the MUX
    wire [9:0] decoded0;     // Output of the 2's complement decoder
    wire [9:0] decoded1;     // Output of the unsigned decoder

    // Instantiate the 2's complement digital display decoder
    DisplayDecoder2sComplement decoder2s (
        .number(in0),
        .d(decoded0)
    );

    // Instantiate the unsigned digital display decoder
    DisplayDecoderUnsigned decoder_unsigned (
        .number(in1),
        .d(decoded1)
    );

    // Instantiate the 2-to-1 multiplexer
    Mux2to1_10bit mux (
        .in0(decoded0),
        .in1(decoded1),
        .sel(sel),
        .out(mux_out)
    );

    // Register to hold the output, updated on the positive edge of the clock
    always @(posedge clk or posedge reset) begin
        if (reset)
            out_display <= 10'b0;      // Clear the output on reset
        else
            out_display <= mux_out;    // Update output on clock edge
    end

endmodule
