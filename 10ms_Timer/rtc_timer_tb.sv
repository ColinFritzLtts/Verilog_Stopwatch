`timescale 1ns / 1ps
`include "rtc_timer.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.    
// Engineer: Matt Stevenson 
// 
// Create Date: 06/08/2020 06:41:12 PM
// Design Name: 10ms Timer Testbench
// Module Name: rtc_timer_tb
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100 
// Tool Versions: Vivado 2019.2
// Description: Timer which inverts tick output with period of 10ms
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rtc_timer_tb;

    reg i_sclk;
    reg i_reset_n;
    reg i_timerenb;
    wire o_base_tick;
    
    rtc_timer DUT(
        .i_sclk     (i_sclk),
        .i_reset_n  (i_reset_n),
        .i_timerenb (i_timerenb),
        .o_base_tick(o_base_tick)
    );
    
    initial begin
        i_sclk = 0;
        i_reset_n = 0;
        i_timerenb = 0;
    end
        
    initial  begin
        $dumpfile ("rtc_timer_tb.vcd"); 
        $dumpvars; 
    end    

    initial  begin
        $display("\t\ttime,\ti_sclk,\ti_reset_n,\ti_timerenb,\to_base_tick"); 
        $monitor("%d,\t%d,\t%d,\t%d,\t%d",$time, i_sclk, i_reset_n, i_timerenb, o_base_tick); 
    end 
    
    initial 
        #100 $finish;
    
    initial begin
        #10 i_reset_n = 1;
        i_timerenb = 1;
        // #50 i_timerenb = 0;
    end
    
    always 
        #5 i_sclk = !i_sclk;
        
      
endmodule
