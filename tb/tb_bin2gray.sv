// File: tb/tb_bin2gray.sv
// Description: Self-checking testbench for bin2gray
// Author: <Srikant >

`timescale 1ns/1ps

module tb_bin2gray;

    // Change this to test different widths
    localparam int WIDTH = 4;

    logic [WIDTH-1:0] bin;
    logic [WIDTH-1:0] gray_dut;
    logic [WIDTH-1:0] gray_ref;

    // DUT instance
    bin2gray #(
        .WIDTH(WIDTH)
    ) dut (
        .bin(bin),
        .gray(gray_dut)
    );

    // Reference model (same formula as theory)
    function automatic logic [WIDTH-1:0] bin2gray_ref (logic [WIDTH-1:0] b);
        return b ^ (b >> 1);
    endfunction

    initial begin
        $display("==========================================");
        $display("  Binary to Gray Code Converter Testbench");
        $display("  WIDTH = %0d", WIDTH);
        $display("==========================================");

        // Exhaustive testing for all possible input values
        for (int i = 0; i < (1 << WIDTH); i++) begin
            bin = i;
            #1;  // allow some time for combinational logic to settle

            gray_ref = bin2gray_ref(bin);

            assert (gray_dut === gray_ref)
            else begin
                $error("Mismatch detected! bin=%0b, gray_dut=%0b, gray_ref=%0b",
                       bin, gray_dut, gray_ref);
                $fatal;  // stop simulation on error
            end

            $display("OK: bin=%0b -> gray=%0b", bin, gray_dut);
        end

        $display("==========================================");
        $display("  All %0d input combinations PASSED ✅", (1 << WIDTH));
        $display("==========================================");
        $finish;
    end

endmodule
