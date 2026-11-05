`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 14:48:55
// Design Name: 
// Module Name: johnson_counter_tb
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

module johnson_counter_tb;

reg clk;
reg rst;
wire [3:0] q;

johnson_counter DUT (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    rst = 1;
    #10;
    rst = 0;

    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t rst=%b q=%b",
              $time, rst, q);
end

endmodule

