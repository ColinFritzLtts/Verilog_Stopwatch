`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.    
// Engineer: Matt Stevenson 
// 
// Create Date: 06/17/2020 10:41:12 AM
// Design Name: Top level wrapper testbench
// Module Name: rtc_stopwatch_tb
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100 
// Tool Versions: Vivado 2019.2
// Description: Wrapper taking hardware constraints and passing to project sub-modules
// 
// Dependencies: rtc_stopwatch 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rtc_stopwatch_tb;

    // INPUTS
    reg sys_clk;
    reg reset_n;
    reg trigger_in;
    
    // OUTPUTS
    // TRIGGER DETECTION
    reg o_count_init;
    reg o_count_enb;
    reg o_latch_count;
    
    // TIMER
    reg o_base_tick;
    
    // 24-BIT COUNTER
    reg [23:0] o_count;
    
    // DISPLAY DRIVER
    reg [7:0] o_segout1;
    reg [7:0] o_segout2;
    reg [7:0] o_segout3;
    reg [7:0] o_segout4;
    reg [7:0] o_segout5;
    reg [7:0] o_segout6;
    
    // ADAPTER
    reg [7:0] o_segments;
    reg [7:0] o_digits;
    
    rtc_stopwatch TOP(
        .sys_clk(sys_clk),
        .reset_n(reset_n),
        .trigger_in(trigger_in)
    );
    
    initial begin
        sys_clk = 0;
        reset_n = 0;
    end
    
    initial  begin
        $dumpfile ("rtc_stopwatch_tb.vcd"); 
        $dumpvars; 
    end 
    
    initial  begin
        $display("\t\ttime,\tsys_clk,\treset_n,\ttrigger_n,\to_count_init,\to_count_enb,\to_latch_count,\to_base_tick,\to_count"); 
        $monitor("%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d",$time, 
        sys_clk, reset_n, trigger_in, o_count_init, o_count_init, o_latch_count, o_base_tick, o_count); 
    end 
    
    initial 
    #1000 $finish;
    
    initial begin
        #10 reset_n = 1;
        trigger_in = 1;
        #50 trigger_in = 0;
        o_count_init = TOP.trigger.o_count_init;
        o_count_enb = TOP.trigger.o_count_enb;
        o_latch_count = TOP.trigger.o_latch_count;
        
        o_base_tick = TOP.timer.o_base_tick;
        
        o_count = TOP.counter.o_count;
        
        o_segout1 = TOP.display.o_segout1;
        o_segout2 = TOP.display.o_segout2;
        o_segout3 = TOP.display.o_segout3;
        o_segout4 = TOP.display.o_segout4;
        o_segout5 = TOP.display.o_segout5;
        o_segout6 = TOP.display.o_segout6;
        
        o_segments = TOP.adapter.o_segments;
        o_digits = TOP.adapter.o_digits;
    end
    
    always
        #5 sys_clk = !sys_clk;
    


endmodule
