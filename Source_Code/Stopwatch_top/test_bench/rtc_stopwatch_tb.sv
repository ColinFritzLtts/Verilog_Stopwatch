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

    reg sys_clk;
    reg reset_n;
    reg trigger_in;
    
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
        $display("\t\ttime,\tsys_clk\treset_n\ttrigger_n"); 
        $monitor("%d,\t%d,\t%d,\t%d",$time, 
        sys_clk, reset_n, trigger_in); 
    end 
    
    initial 
    #100 $finish;
    
    initial begin
        #10 reset_n = 1;
        trigger_in = 1;
        #50 trigger_in = 0;
    end
    
    always
        #5 sys_clk = !sys_clk;
    


endmodule
