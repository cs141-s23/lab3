module timer
    #(parameter N = 4)
    (
        input logic clk, clk_en,
        input logic rst, en, load,
        input logic [N-1:0] init,
        output logic [N-1:0] out
    );

    /*** IMPORTANT NOTE ********************************************************
    * Please make sure to write your synchronous always blocks as such:

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            // asynchronous reset
        end
        else if (clk_en) begin
            // do stuff
        end
    end

    * or as such:

    always_ff @(posedge clk) begin
        if (rst) begin
            // synchronous reset
        end
        else if (clk_en) begin
            // do stuff
        end
    end

    * where clk is the 100 MHz system clock and clk_en is the 1 Hz "clock"
    * produced by your clock divider.
    *
    * Why is this the correct way to write things? Behind the scenes, clk is
    * generated by specialized clock generation circuitry within the FPGA chip,
    * while clk_en (the 1 Hz "clock") is not. This means that clk_en will be a
    * VERY bad choice of signal to clock FFs with and may cause a slew of subtle
    * bugs -- it's not a "real" clock. Additionally, directly clocking FFs with
    * such slow clocks is NEVER a good idea for lots of lower level electronics
    * reasons.
    *
    * If you put the 1 Hz "clock" in the sensitivity list of an always block,
    * you will lose points. So don't do it.
    *
    * Bug Jon if you're curious and want to know more.
    ***************************************************************************/

    // TODO: implement the timer specified in the lab guide

endmodule
