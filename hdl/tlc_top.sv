module tlc_top
    (
        input logic [7:0] sw,
        input logic [4:0] btn,
        input logic reset_n, clk,
        output logic [7:0] led,
        output logic [7:0] sseg,
        output logic [7:0] an
    );

    logic btn_center, btn_down;
    assign btn_center = btn[4];
    assign btn_down = btn[2];

    logic clk_1hz, car_ns, car_ew, ped, rst;
    logic [2:0] light_ew, light_ns;
    logic [1:0] light_ped;

    logic en, load, timer_rst;
    logic [3:0] init, out;
    logic [7:0] out_sseg;

    assign rst = !reset_n;

    assign timer_rst = btn_down;

    clk_divider #(.div_amt(100000000)) div_1hz (.clk_in(clk), .rst(rst), .clk_out(clk_1hz));

    timer timer_u (.clk(clk), .clk_en(clk_1hz), .rst(timer_rst), .en(en),
                   .load(load), .init(init), .out(out));

    // Uncomment for part 2
    // tlc tlc_u (.clk(clk), .clk_en(clk_1hz), .rst(timer_rst), .timer_en(en),
    //            .timer_load(load), .timer_init(init), .timer_out(out),
    //            .car_ns(car_ns), .car_ew(car_ew), .ped(ped), .light_ns(light_ns),
    //            .light_ew(light_ew), .light_ped(light_ped));

    // Part 1 I/O
    // Comment out for part 2
    assign led[7:4] = 3'b0;
    assign led[3:0] = out;
    assign init = sw[3:0];
    assign load = btn_center;
    assign en = 1'b1;

    // Part 2 I/O
    // Uncomment for part 2
    // assign car_ns = |sw[7:5];
    // assign car_ew = |sw[2:0];
    // assign ped = |sw[4:3];
    // assign led[7:5] = light_ns;
    // assign led[4:3] = light_ped;
    // assign led[2:0] = light_ew;

    // to display timer bits on seven segment display
    hex_to_sseg sseg_unit_0
      (.hex(out), .dp(1'b0), .sseg(out_sseg));

    assign sseg = out_sseg;
    assign an = 8'hFE;

endmodule
