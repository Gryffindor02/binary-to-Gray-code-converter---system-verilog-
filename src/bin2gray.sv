// File: src/bin2gray.sv
// Description: Parameterized Binary to Gray code converter
`timescale 1ns/1ps

module bin2gray #(
    parameter int WIDTH = 4    // Number of bits in input/output
) (
    input  logic [WIDTH-1:0] bin,   // Binary input
    output logic [WIDTH-1:0] gray   // Gray code output
);

    // Binary to Gray conversion:
    // gray[n-1] = bin[n-1]
    // gray[i]   = bin[i+1] ^ bin[i]  for i = 0..n-2
    //
    // This can be compactly written as:
    // gray = bin ^ (bin >> 1)

    assign gray = bin ^ (bin >> 1);

endmodule
