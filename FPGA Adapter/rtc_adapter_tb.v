`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 01:01:24 PM
// Design Name: 7-Segment FPGA Adapter Testbench
// Module Name: rtc_adapter_tb
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2
// Description: A FPGA adapter testbench for the common cathode 7-segment array.
// 
// Dependencies: rtc_adapter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_adapter_tb;
    reg  [7:0] i_segout1;
    reg  [7:0] i_segout2;
    reg  [7:0] i_segout3;
    reg  [7:0] i_segout4;
    reg  [7:0] i_segout5;
    reg  [7:0] i_segout6;
    reg        i_reset_n;
    reg        i_sclk;
    wire [7:0] o_segments;
    wire [7:0] o_digits;
    
    rtc_adapter DUT1(
        .i_segout1  (i_segout1),
        .i_segout2  (i_segout2),
        .i_segout3  (i_segout3),
        .i_segout4  (i_segout4),
        .i_segout5  (i_segout5),
        .i_segout6  (i_segout6),
        .i_reset_n  (i_reset_n),
        .i_sclk     (i_sclk),   
        .o_segments (o_segments),
        .o_digits   (o_digits)
    );
    initial begin
        i_sclk = 0; 
        i_reset_n = 0; 
        i_segout1 = 8'h11;
        i_segout2 = 8'h22;
        i_segout3 = 8'h33;
        i_segout4 = 8'h44;
        i_segout5 = 8'h55;
        i_segout6 = 8'h66;
    end 
    
  always  
    #5 i_sclk = !i_sclk;  //clock generator 
    
  initial  begin
    $dumpfile ("rtc_counter_tb.vcd"); 
    $dumpvars; 
  end 
    
  initial  begin
    $display("\t\ttime,\tclk,\treset,\ti_sclk,\ti_reset_n,\ti_segout1,\ti_segout2,\ti_segout3,\ti_segout4,\ti_segout5,\ti_segout6,\to_segments,\to_digits"); 
    $monitor("%d,\t%b,\t%b,\t%d,\t%d\t%d,\t%d\t%d,\t%d\t%d,\t%d",$time, i_sclk, i_reset_n, 
             i_segout1, i_segout2, i_segout3, i_segout4, i_segout5, i_segout6, 
             o_segments, o_digits); 
  end 
    
  initial 
  #100 $finish; 
    
  //Rest of testbench code after this line 
  initial begin
    i_reset_n = 1;
    i_reset_n = #100 0;
  end
  
endmodule
