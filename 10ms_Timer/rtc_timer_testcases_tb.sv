`timescale 1ns / 1ps
`include "rtc_timer.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.    
// Engineer: Matt Stevenson 
// 
// Create Date: 06/08/2020 06:41:12 PM
// Design Name: 10ms Timer Testcases Testbench
// Module Name: rtc_timer_testcases_tb
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100 
// Tool Versions: Vivado 2019.2
// Description: Timer which inverts tick output with period of 10ms
// 
// Dependencies: rtc_timer
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_timer_testcases_tb;

    reg i_sclk;
    reg i_reset_n;
    reg i_timerenb;
    wire o_base_tick;
    
    rtc_timer DUT1(
        .i_sclk     (i_sclk),
        .i_reset_n  (i_reset_n),
        .i_timerenb (i_timerenb),
        .o_base_tick(o_base_tick)
    );   
    
    initial begin
        i_sclk = 0;
        i_reset_n = 1;
        i_timerenb = 1;
    end

    always  
        #5 i_sclk = !i_sclk;  //100MHz clock generator
    
    initial  begin
        $dumpfile ("rtc_timer_testcases_tb.vcd"); 
        $dumpvars; 
    end 
    
    
    // testbench code after this line
    
    initial begin
        // TIMER_INIT_01_1
        $display("[TIMER_INIT_01_1] The module shall set o_basetick logic low upon system startup.");
        #1 assert (o_base_tick == 8'h00)
            $display("PASS: o_base_tick = %b", o_base_tick);
        else
            $error("FAIL: o_base_tick = %b", o_base_tick);
            
        /////////////////////////////////////////////////////////////////////////////////////////
        
        // TIMER_CNT_01_1
        $display("[TIMER_CNT_01_1] The module shall increment count on the positive edge of every clock cycle when i_timerenb is logic high.");
        @ (posedge DUT1.i_sclk) 
        #10 assert (DUT1.i_timerenb == 1)
            $display("count = %d", DUT1.count);
        else
            $error("ensure i_timerenb logic high for test.");
        #10 assert (DUT1.i_timerenb == 1)
            $display("count = %d", DUT1.count);
        else
            $error("ensure i_timerenb logic high for test.");
            
        $warning("Check count to be incrementing.");
            
        // TIMER_CNT_01_2
        $display("[TIMER_CNT_01_2] The module shall stop incrementing while i_timerenb is logic low.");
        i_timerenb = 0;
        @ (posedge DUT1.i_sclk) 
        #10 assert (DUT1.i_timerenb == 0)
            $display("count = %d", DUT1.count);
        else
            $error("ensure i_timerenb logic low for test.");
        #10 assert (DUT1.i_timerenb == 0)
            $display("count = %d", DUT1.count);
        else
            $error("ensure i_timerenb logic high for test.");
            
        $warning("Check count to be the same as before.");
        
        // TIMER_CNT_02_1
        $display("[TIMER_CNT_02_1] The module shall invert o_base_tick output once count reaches 499999.");
        DUT1.count = 499998;
        i_timerenb = 1;
        @ (posedge DUT1.i_sclk)
        #10 assert (DUT1.count == 499999)
            $display("count = %d\to_base_time = %b", DUT1.count, o_base_tick);
        else
            $error("ensure count is set to upper limit.");
        #10 assert (DUT1.count == 0)
            $display("count = %d\to_base_tick = %b", DUT1.count, o_base_tick);
        else
            $error("ensure correct count value");
            
        $warning("Check o_base_tick inverts at count == 499999");
        
        /////////////////////////////////////////////////////////////////////////////////////////
        
        // TIMER_RST_01_1
        $display("[TIMER_RST_01_1] The module shall set count to 499998 when i_reset_n is logic low.");
        i_reset_n = 0;
        #10 assert (DUT1.count == 499998)
            $display("PASS: count = %d", DUT1.count);
        else
            $error("FAIL: count = %d", DUT1.count);
        #10 i_reset_n = 1;
        
        #1 $finish;
        
    end
    
endmodule
