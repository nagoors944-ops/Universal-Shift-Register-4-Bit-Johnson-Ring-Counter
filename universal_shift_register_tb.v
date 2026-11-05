`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 14:29:16
// Design Name: 
// Module Name: universal_shift_register_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



`timescale 1ns / 1ps

module universal_shift_register_tb;

reg clk;
reg rst;
reg s1, s0;
reg serial_left, serial_right;
reg [3:0] parallel_in;

wire [3:0] q;

universal_shift_register DUT (
    .clk(clk),
    .rst(rst),
    .s1(s1),
    .s0(s0),
    .serial_left(serial_left),
    .serial_right(serial_right),
    .parallel_in(parallel_in),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    s1 = 0;
    s0 = 0;
    serial_left = 0;
    serial_right = 0;
    parallel_in = 4'b0000;

    // Reset
    #10 rst = 0;

    // Parallel Load
    s1 = 1; s0 = 1;
    parallel_in = 4'b1010;
    #10;

    // Hold
    s1 = 0; s0 = 0;
    #10;

    // Shift Right
    s1 = 0; s0 = 1;
    serial_right = 1;
    #10;

    // Shift Left
    s1 = 1; s0 = 0;
    serial_left = 0;
    #10;

    // Parallel Load
    s1 = 1; s0 = 1;
    parallel_in = 4'b1101;
    #10;

    // Hold
    s1 = 0; s0 = 0;
    #10;

    $finish;
end

endmodule

