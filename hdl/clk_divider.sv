module clk_divider
    #(
        parameter div_amt = 10
    )
    (
        input logic clk_in, rst,
        input logic [31:0] div_amt,
        output logic clk_out
    );

    // TODO: output one positive edge for every `div_amt` input positive edges

endmodule
