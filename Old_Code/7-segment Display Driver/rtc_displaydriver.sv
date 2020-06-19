`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 11:56:23 AM
// Design Name: 24-bit BCD to 7-Segment Display Driver
// Module Name: rtc_displaydriver
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2 
// Description:  A display driver module converting BCD digits to their 7-segment visual equivalent.
// 
// Dependencies: rtc_24bitcounter, rtc_adapter, rtc_stopwatch, rtc_bcd_to_7seg_translator
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_displaydriver(
    input  wire [23:0] i_count,
    output wire [7:0]  o_segout1,
    output wire [7:0]  o_segout2,
    output wire [7:0]  o_segout3,
    output wire [7:0]  o_segout4,
    output wire [7:0]  o_segout5,
    output wire [7:0]  o_segout6
    );
    rtc_bcd_to_7seg_translator SEG1(
        .i_bcd_digit (i_count[3:0]),
        .o_segout    (o_segout1)
    );
    rtc_bcd_to_7seg_translator SEG2(
        .i_bcd_digit (i_count[7:4]),
        .o_segout    (o_segout2)
    );
    rtc_bcd_to_7seg_translator SEG3(
        .i_bcd_digit (i_count[11:8]),
        .o_segout    (o_segout3)
    );
    rtc_bcd_to_7seg_translator SEG4(
        .i_bcd_digit (i_count[15:12]),
        .o_segout    (o_segout4)
    );
    rtc_bcd_to_7seg_translator SEG5(
        .i_bcd_digit (i_count[19:16]),
        .o_segout    (o_segout5)
    );
    rtc_bcd_to_7seg_translator SEG6(
        .i_bcd_digit (i_count[23:20]),
        .o_segout    (o_segout6)
    );
endmodule
