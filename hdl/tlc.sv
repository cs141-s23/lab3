`include "tlc.svh"

module tlc
    (
        input logic clk, clk_en,
        input logic rst, car_ns, car_ew, ped,
        input logic [3:0] timer_out,
        output logic [3:0] timer_init,
        output logic [2:0] light_ns, light_ew,
        output logic [1:0] light_ped,
        output logic timer_load, timer_en
    );

    typedef enum {s_idle, s_two, s_three /*change these*/} state_t;
    state_t state, next_state;

    // TODO: complete the implementation of the traffic light controller

    // synchronous logic (update the state on clock edge)
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= s_idle;
        end
        else if (clk_en) begin
            state <= next_state;
        end
    end

    // combinational logic (determine what the next state is)
    always_comb begin
        unique case (state)
            s_idle: begin
                // set outputs
                light_ns = `LIGHT_RED;
                light_ew = `LIGHT_RED;
                light_ped = `PED_NEITHER;
                timer_en = 0;
                timer_load = 1;
                timer_init = 4'b1111;


                // sample state transition
                if (ped)
                    next_state = s_two;
                else
                    next_state = s_three;

                // set next value for internal registers
            end
            default: begin
                light_ns = `LIGHT_RED;
                light_ew = `LIGHT_RED;
                light_ped = `PED_NEITHER;
                timer_en = 0;
                timer_load = 1;
                timer_init = 4'b1111;

                next_state = s_idle;

            end
        endcase
    end
endmodule
