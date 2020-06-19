//`include "rtc_trigger.sv"
//`include "rtc_timer.sv"
//`include "rtc_24bitcounter.sv"
//`include "rtc_displaydriver.sv"
//`include "rtc_adapter.sv"

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.    
// Engineer: Matt Stevenson 
// 
// Create Date: 06/15/2020 01:41:12 PM
// Design Name: Top level wrapper 
// Module Name: rtc_stopwatch
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100 
// Tool Versions: Vivado 2019.2
// Description: Wrapper taking hardware constraints and passing to project sub-modules
// 
// Dependencies: rtc_trigger, rtc_timer, rtc_24bitcounter, rtc_displaydriver, rtc_adapter 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rtc_stopwatch(
    input wire sys_clk,
    input wire reset_n,
    input wire trigger_in,
    output reg [7:0] o_segments,
    output reg [7:0] o_digits
);

    wire latch_count;
    wire count_init;
    wire count_enb;
    
    // trigger detection passes o_countenb to timer .i_timerenb
    rtc_trigger trigger(
        .i_sclk   (sys_clk),
        .i_trigger(trigger_in),
        .i_reset_n(reset_n),
        .o_latch_count(latch_count), 
        .o_count_init(count_init),
        .o_count_enb(count_enb) // passed to rtc_timer & rtc_24bitcounter
    );
    
    wire base_tick;
        
    rtc_timer timer(
        .i_sclk     (sys_clk),
        .i_reset_n  (reset_n),
        .i_timerenb (count_enb),
        .o_base_tick(base_tick) // passed to rtc_24bitcounter as i_rtcclk
    );
    
    wire [23:0] count;
    
    // 24-bit BCD Counter
    rtc_24bitcounter counter(
        .i_rtcclk(base_tick),
        .i_reset_n(reset_n),
        .i_countenb(count_enb),
        .i_countinit(count_init),
        .i_latchcount(latch_count),
        .o_count(count)
    );
    
    wire [7:0] segout1;
    wire [7:0] segout2;
    wire [7:0] segout3;
    wire [7:0] segout4;
    wire [7:0] segout5;
    wire [7:0] segout6;
    
    // 24-bit BCD to 7-Segment Display Driver
    rtc_displaydriver display(
        .i_count(count),
        .o_segout1(segout1),
        .o_segout2(segout2),
        .o_segout3(segout3),
        .o_segout4(segout4),
        .o_segout5(segout5),
        .o_segout6(segout6)
    );
    
    // 7-Segment FPGA Adapter
    rtc_adapter adapter(
        .i_segout1(segout1),
        .i_segout2(segout2),
        .i_segout3(segout3),
        .i_segout4(segout4),
        .i_segout5(segout5),
        .i_segout6(segout6),
        .i_reset_n(reset_n),
        .i_sclk(sys_clk),
        .o_segments(o_segments),
        .o_digits(o_digits)
    );
    
endmodule