`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2020 03:57:48 PM
// Design Name: 
// Module Name: rtc_stopwatch_testcases_tb
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


module rtc_stopwatch_testcases_tb;

    reg sys_clk;
    reg reset_n;
    reg trigger_in;
    wire [7:0] o_segments;
    wire [7:0] o_digits;
    
    reg [7:0] prev_segments;
    reg [7:0] prev_digits;

    rtc_stopwatch TOP(
        .sys_clk(sys_clk),
        .reset_n(reset_n),
        .trigger_in(trigger_in),
        .o_segments(o_segments),
        .o_digits(o_digits)
    );
    
    initial begin
        sys_clk = 0;
        reset_n = 1;
        trigger_in = 0;
    end
    
    always
        #5 sys_clk = !sys_clk;
        
    initial  begin
        $dumpfile ("rtc_stopwatch_testcases_tb.vcd"); 
        $dumpvars; 
    end 
    
    // DISPLAY DEBUG VARIABLES
    //initial  begin
    //    $display("\ttime,\tsys_clk,\treset_n,\ttrigger_in"); 
    //    $monitor("\t%d,\t%d,\t%d,\t%d",$time, sys_clk, reset_n, trigger_in);
    //end 
    
    initial begin
        
        // TOP_CLK_01_1 
        $display("[TOP_CLK_01_1] The module shall pass the system clock to trigger detection, timer and FPGA adapter sub-modules.");
        @ (posedge sys_clk)
            #1 assert (sys_clk == TOP.trigger.i_sclk && sys_clk == TOP.timer.i_sclk && sys_clk == TOP.adapter.i_sclk)
                $display("PASS: sys_clk = %b, trigger.i_sclk = %b, adapter.i_sclk = %b", sys_clk, TOP.trigger.i_sclk, TOP.adapter.i_sclk);
            else
                $error("FAIL: sys_clk = %b, trigger.i_sclk = %b, adapter.i_sclk = %b", sys_clk, TOP.trigger.i_sclk, TOP.adapter.i_sclk);
        @ (negedge sys_clk)
            #1 assert (sys_clk == TOP.trigger.i_sclk && sys_clk == TOP.timer.i_sclk && sys_clk == TOP.adapter.i_sclk)
                $display("PASS: sys_clk = %b, trigger.i_sclk = %b, adapter.i_sclk = %b", sys_clk, TOP.trigger.i_sclk, TOP.adapter.i_sclk);
            else
                $error("FAIL: sys_clk = %b, trigger.i_sclk = %b, adapter.i_sclk = %b", sys_clk, TOP.trigger.i_sclk, TOP.adapter.i_sclk);
                
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
               
        // TOP_IN_01_1
        trigger_in = 1;
        $display("[TOP_IN_01_1] The module shall trigger_in to trigger detection module.");
        #1 assert (trigger_in == TOP.trigger.i_trigger)
            $display("PASS: trigger_in = %b, trigger.i_trigger = %b", trigger_in, TOP.trigger.i_trigger);
        else
            $error("FAIL: trigger_in = %b, trigger.i_trigger = %b", trigger_in, TOP.trigger.i_trigger);
        #110 trigger_in = 0;
        #1 assert (trigger_in == TOP.trigger.i_trigger)
            $display("PASS: trigger_in = %b, trigger.i_trigger = %b", trigger_in, TOP.trigger.i_trigger);
        else
            $error("FAIL: trigger_in = %b, trigger.i_trigger = %b", trigger_in, TOP.trigger.i_trigger);
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
           
        // TOP_OUT_01_1
        $display("[TOP_OUT_01_1] The module shall change state proportional to a real time clock.");
        prev_segments = TOP.adapter.o_segments;
        prev_digits = TOP.adapter.o_digits;
        #10 TOP.timer.count = 499999;
        
        #100 assert (o_segments != prev_segments && o_segments != prev_digits)
            $display("PASS: prev_segments = %b, prev_digits = %b, o_segments = %b, o_digits = %b", prev_segments, prev_digits, TOP.adapter.o_segments, TOP.adapter.o_digits);
        else
            $display("FAIL: prev_segments = %b, prev_digits = %b, o_segments = %b, o_digits = %b", prev_segments, prev_digits, TOP.adapter.o_segments, TOP.adapter.o_digits);
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        // TOP_RST_01_1
        $display("[TOP_RST_01_1] The module shall display all zeroes across 7-segment displays when i_reset_n is set logic low ('0').");
        reset_n = 0;
        #10 assert (o_segments == 8'b00000000 && o_digits == 8'b00000000)
            $display("PASS: o_segments = %b, o_digits = %b", o_segments, o_digits);
        else
            $display("FAIL: o_segments = %b, o_digits = %b", o_segments, o_digits);
            
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    #100 $finish;
    
    end
        
endmodule
