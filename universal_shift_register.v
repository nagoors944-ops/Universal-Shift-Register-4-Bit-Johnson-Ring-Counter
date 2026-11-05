`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 14:14:52
// Design Name: 
// Module Name: universal_shift_register
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

module universal_shift_register (
    input clk,
    input rst,
    input s1,
    input s0,
    input serial_left,
    input serial_right,
    input [3:0] parallel_in,
    output reg [3:0] q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 4'b0000;

    else
    begin
        case ({s1, s0})

            2'b00: q <= q; 
            
            2'b01: q <= {serial_right, q[3:1]};
            
            2'b10: q <= {q[2:0], serial_left};
            
            2'b11: q <= parallel_in;

            default: q <= q;

        endcase
    end
end

endmodule



