`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 01:57:35 PM
// Design Name: BCD to 7-segment display translator submodule
// Module Name: rtc_bcd_to_7seg_translator
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2
// Description: BCD to 7-segment display translator submodule, part of the rtc_displaydriver module.
// 
// Dependencies: rtc_displaydriver
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_bcd_to_7seg_translator(
    input  wire [3:0] i_bcd_digit,
    output reg  [7:0] o_segout
    );
    always @i_bcd_digit 
    begin
        case(i_bcd_digit)
            4'h0:    o_segout = 8'b10000001;
            4'h1:    o_segout = 8'b01001111;
            4'h2:    o_segout = 8'b10010010;
            4'h3:    o_segout = 8'b00000110;
            4'h4:    o_segout = 8'b11001100;
            4'h5:    o_segout = 8'b00100100;
            4'h6:    o_segout = 8'b10100000;
            4'h7:    o_segout = 8'b00001111;
            4'h8:    o_segout = 8'b10000000;
            4'h9:    o_segout = 8'b00000100;
            default: o_segout = 8'b11111111;
        endcase
    end
endmodule
