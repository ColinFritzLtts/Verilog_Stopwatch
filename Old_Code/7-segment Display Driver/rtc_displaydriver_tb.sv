`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 11:56:23 AM
// Design Name: 24-bit BCD to 7-Segment Display Driver testbench
// Module Name: rtc_displaydriver_tb
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2 
// Description:  A display driver testbench module for converting BCD digits to their 7-segment visual equivalent.
// 
// Dependencies: rtc_displaydriver_tb
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_displaydriver_tb;
    reg  [23:0] i_count;  
    wire [7:0]  o_segout1;
    wire [7:0]  o_segout2;
    wire [7:0]  o_segout3;
    wire [7:0]  o_segout4;
    wire [7:0]  o_segout5;
    wire [7:0]  o_segout6;
    
    rtc_displaydriver DUT1(
        .i_count   (i_count),
        .o_segout1 (o_segout1),
        .o_segout2 (o_segout2),
        .o_segout3 (o_segout3),
        .o_segout4 (o_segout4),
        .o_segout5 (o_segout5),
        .o_segout6 (o_segout6)
    );
    initial begin
        i_count   = 24'h654321;
    end 
    
  
  initial  begin
    $dumpfile ("rtc_displaydriver_tb.vcd"); 
    $dumpvars; 
  end 
    
  initial  begin
    $display("\t\ttime,\ti_count,\to_segout1,\to_segout2,\to_segout3,\to_segout4,\to_segout5,\to_segout6"); 
    $monitor("%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d",$time, 
    i_count, o_segout1, o_segout2, o_segout3, o_segout4, o_segout5, o_segout6); 
  end 
    
  initial 
  #100 $finish; 
    
  //Rest of testbench code after this line 
  initial begin
    i_count = #10 24'h765432;
    i_count = #10 24'h876543;
    i_count = #10 24'h987654;
    i_count = #10 24'h098765;
    i_count = #10 24'h109876;
    i_count = #10 24'h210987;
    i_count = #10 24'h321098;
    i_count = #10 24'h432109;
    i_count = #10 24'h543210;
    
  end
  
endmodule
