`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 11:56:23 AM
// Design Name: 24-bit BCD to 7-Segment Display Driver testbench
// Module Name: DRV_testcases
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2 
// Description:  A display driver testbench module checking the compliance to testcases.
// 
// Dependencies: rtc_displaydriver
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DRV_testcases;
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
        i_count   = 24'hffffff;
    end 
    
  
  initial  begin
    $dumpfile ("rtc_displaydriver_tb.vcd"); 
    $dumpvars; 
  end 
  
  //debug output
    
  //initial  begin
  //  $display("\t\ttime,\ti_count,\to_segout1,\to_segout2,\to_segout3,\to_segout4,\to_segout5,\to_segout6"); 
  //  $monitor("%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d",$time, 
  //  i_count, o_segout1, o_segout2, o_segout3, o_segout4, o_segout5, o_segout6); 
  //end 
  
    
  //Rest of testbench code after this line 
  initial begin
    #1 i_count = 24'hFFFFFF;
    //DRV_INIT_01_01
    $display("[DRV_INIT_01_01] The module shall preset o_segout1 to '11111111' upon system startup.");
    assert (DUT1.SEG1.o_segout == 8'hFF) 
        $display("PASS: o_segout1 = %b", o_segout1);
    else
        $error("FAIL: o_segout1 = %b", o_segout1);
        
    //DRV_INIT_02_01
    $display("[DRV_INIT_02_01] The module shall preset o_segout2 to '11111111' upon system startup.");
    assert (DUT1.SEG2.o_segout == 8'hFF) 
        $display("PASS: o_segout2 = %b", o_segout2);
    else
        $error("FAIL: o_segout2 = %b", o_segout2);
    
    //DRV_INIT_03_01
    $display("[DRV_INIT_03_01] The module shall preset o_segout3 to '11111111' upon system startup.");
    assert (DUT1.SEG3.o_segout == 8'hFF) 
        $display("PASS: o_segout3 = %b", o_segout3);
    else
        $error("FAIL: o_segout3 = %b", o_segout3);
    
    //DRV_INIT_04_01
    $display("[DRV_INIT_04_01] The module shall preset o_segout4 to '11111111' upon system startup.");
    assert (DUT1.SEG4.o_segout == 8'hFF) 
        $display("PASS: o_segout4 = %b", o_segout4);
    else
        $error("FAIL: o_segout4 = %b", o_segout4);
    
    //DRV_INIT_05_01
    $display("[DRV_INIT_05_01] The module shall preset o_segout5 to '11111111' upon system startup.");
    assert (DUT1.SEG5.o_segout == 8'hFF) 
        $display("PASS: o_segout5 = %b", o_segout5);
    else
        $error("FAIL: o_segout5 = %b", o_segout5);
    
    //DRV_INIT_06_01
    $display("[DRV_INIT_06_01] The module shall preset o_segout6 to '11111111' upon system startup.");
    assert (DUT1.SEG6.o_segout == 8'hFF) 
        $display("PASS: o_segout6 = %b", o_segout6);
    else
        $error("FAIL: o_segout6 = %b", o_segout6);
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP1_01_01
    $display("[DRV_MAP1_01_01] The module shall append the DRV_MAP1_ group of requirements to the module's intialized value of o_segout1.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1 == 8'hFF) 
        $display("PASS: o_segout1 = %b", o_segout1);
    else
        $error("FAIL: o_segout1 = %b", o_segout1);
    
    //DRV_MAP1_02_01
    $display("[DRV_MAP1_02_01] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_02
    $display("[DRV_MAP1_02_02] The module shall set o_segout1[7] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[7] == 0) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_03
    $display("[DRV_MAP1_02_03] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_04
    $display("[DRV_MAP1_02_04] The module shall set o_segout1[7] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[7] == 0) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_05
    $display("[DRV_MAP1_02_05] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_06
    $display("[DRV_MAP1_02_06] The module shall set o_segout1[7] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[7] == 0) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_07
    $display("[DRV_MAP1_02_07] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_08
    $display("[DRV_MAP1_02_08] The module shall set o_segout1[7] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[7] == 0) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_09
    $display("[DRV_MAP1_02_09] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_10
    $display("[DRV_MAP1_02_10] The module shall set o_segout1[7] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[7] == 0) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_11
    $display("[DRV_MAP1_02_11] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_12
    $display("[DRV_MAP1_02_12] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_13
    $display("[DRV_MAP1_02_13] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_14
    $display("[DRV_MAP1_02_14] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_15
    $display("[DRV_MAP1_02_15] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_02_16
    $display("[DRV_MAP1_02_16] The module shall NOT set o_segout1[7] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[7] == 1) 
        $display("PASS: o_segout1[7] = %b", o_segout1[7]);
    else
        $error("FAIL: o_segout1[7] = %b", o_segout1[7]);

    //DRV_MAP1_03_01
    $display("[DRV_MAP1_03_01] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_02
    $display("[DRV_MAP1_03_02] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_03
    $display("[DRV_MAP1_03_03] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_04
    $display("[DRV_MAP1_03_04] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_05
    $display("[DRV_MAP1_03_05] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_06
    $display("[DRV_MAP1_03_06] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_07
    $display("[DRV_MAP1_03_07] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_08
    $display("[DRV_MAP1_03_08] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_09
    $display("[DRV_MAP1_03_09] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_10
    $display("[DRV_MAP1_03_10] The module shall set o_segout1[6] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[6] == 0) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_11
    $display("[DRV_MAP1_03_11] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_12
    $display("[DRV_MAP1_03_12] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_13
    $display("[DRV_MAP1_03_13] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_14
    $display("[DRV_MAP1_03_14] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_15
    $display("[DRV_MAP1_03_15] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_03_16
    $display("[DRV_MAP1_03_16] The module shall NOT set o_segout1[6] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[6] == 1) 
        $display("PASS: o_segout1[6] = %b", o_segout1[6]);
    else
        $error("FAIL: o_segout1[6] = %b", o_segout1[6]);

    //DRV_MAP1_04_01
    $display("[DRV_MAP1_04_01] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_02
    $display("[DRV_MAP1_04_02] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_03
    $display("[DRV_MAP1_04_03] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_04
    $display("[DRV_MAP1_04_04] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_05
    $display("[DRV_MAP1_04_05] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_06
    $display("[DRV_MAP1_04_06] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_07
    $display("[DRV_MAP1_04_07] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_08
    $display("[DRV_MAP1_04_08] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_09
    $display("[DRV_MAP1_04_09] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_10
    $display("[DRV_MAP1_04_10] The module shall set o_segout1[5] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[5] == 0) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_11
    $display("[DRV_MAP1_04_11] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_12
    $display("[DRV_MAP1_04_12] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_13
    $display("[DRV_MAP1_04_13] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_14
    $display("[DRV_MAP1_04_14] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_15
    $display("[DRV_MAP1_04_15] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_04_16
    $display("[DRV_MAP1_04_16] The module shall NOT set o_segout1[5] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[5] == 1) 
        $display("PASS: o_segout1[5] = %b", o_segout1[5]);
    else
        $error("FAIL: o_segout1[5] = %b", o_segout1[5]);

    //DRV_MAP1_05_01
    $display("[DRV_MAP1_05_01] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_02
    $display("[DRV_MAP1_05_02] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_03
    $display("[DRV_MAP1_05_03] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_04
    $display("[DRV_MAP1_05_04] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_05
    $display("[DRV_MAP1_05_05] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_06
    $display("[DRV_MAP1_05_06] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_07
    $display("[DRV_MAP1_05_07] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_08
    $display("[DRV_MAP1_05_08] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_09
    $display("[DRV_MAP1_05_09] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_10
    $display("[DRV_MAP1_05_10] The module shall set o_segout1[4] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[4] == 0) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_11
    $display("[DRV_MAP1_05_11] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_12
    $display("[DRV_MAP1_05_12] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_13
    $display("[DRV_MAP1_05_13] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_14
    $display("[DRV_MAP1_05_14] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_15
    $display("[DRV_MAP1_05_15] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_05_16
    $display("[DRV_MAP1_05_16] The module shall NOT set o_segout1[4] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[4] == 1) 
        $display("PASS: o_segout1[4] = %b", o_segout1[4]);
    else
        $error("FAIL: o_segout1[4] = %b", o_segout1[4]);

    //DRV_MAP1_06_01
    $display("[DRV_MAP1_06_01] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_02
    $display("[DRV_MAP1_06_02] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_03
    $display("[DRV_MAP1_06_03] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_04
    $display("[DRV_MAP1_06_04] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_05
    $display("[DRV_MAP1_06_05] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_06
    $display("[DRV_MAP1_06_06] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_07
    $display("[DRV_MAP1_06_07] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_08
    $display("[DRV_MAP1_06_08] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_09
    $display("[DRV_MAP1_06_09] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_10
    $display("[DRV_MAP1_06_10] The module shall set o_segout1[3] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[3] == 0) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_11
    $display("[DRV_MAP1_06_11] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_12
    $display("[DRV_MAP1_06_12] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_13
    $display("[DRV_MAP1_06_13] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_14
    $display("[DRV_MAP1_06_14] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_15
    $display("[DRV_MAP1_06_15] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_06_16
    $display("[DRV_MAP1_06_16] The module shall NOT set o_segout1[3] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[3] == 1) 
        $display("PASS: o_segout1[3] = %b", o_segout1[3]);
    else
        $error("FAIL: o_segout1[3] = %b", o_segout1[3]);

    //DRV_MAP1_07_01
    $display("[DRV_MAP1_07_01] The module shall set o_segout1[2] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[2] == 0) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_02
    $display("[DRV_MAP1_07_02] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_03
    $display("[DRV_MAP1_07_03] The module shall set o_segout1[2] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[2] == 0) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_04
    $display("[DRV_MAP1_07_04] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_05
    $display("[DRV_MAP1_07_05] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_06
    $display("[DRV_MAP1_07_06] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_07
    $display("[DRV_MAP1_07_07] The module shall set o_segout1[2] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[2] == 0) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_08
    $display("[DRV_MAP1_07_08] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_09
    $display("[DRV_MAP1_07_09] The module shall set o_segout1[2] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[2] == 0) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_10
    $display("[DRV_MAP1_07_10] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_11
    $display("[DRV_MAP1_07_11] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_12
    $display("[DRV_MAP1_07_12] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_13
    $display("[DRV_MAP1_07_13] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_14
    $display("[DRV_MAP1_07_14] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_15
    $display("[DRV_MAP1_07_15] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_07_16
    $display("[DRV_MAP1_07_16] The module shall NOT set o_segout1[2] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[2] == 1) 
        $display("PASS: o_segout1[2] = %b", o_segout1[2]);
    else
        $error("FAIL: o_segout1[2] = %b", o_segout1[2]);

    //DRV_MAP1_08_01
    $display("[DRV_MAP1_08_01] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_02
    $display("[DRV_MAP1_08_02] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_03
    $display("[DRV_MAP1_08_03] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_04
    $display("[DRV_MAP1_08_04] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_05
    $display("[DRV_MAP1_08_05] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_06
    $display("[DRV_MAP1_08_06] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_07
    $display("[DRV_MAP1_08_07] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_08
    $display("[DRV_MAP1_08_08] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_09
    $display("[DRV_MAP1_08_09] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_10
    $display("[DRV_MAP1_08_10] The module shall set o_segout1[1] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[1] == 0) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_11
    $display("[DRV_MAP1_08_11] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_12
    $display("[DRV_MAP1_08_12] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_13
    $display("[DRV_MAP1_08_13] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_14
    $display("[DRV_MAP1_08_14] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_15
    $display("[DRV_MAP1_08_15] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_08_16
    $display("[DRV_MAP1_08_16] The module shall NOT set o_segout1[1] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[1] == 1) 
        $display("PASS: o_segout1[1] = %b", o_segout1[1]);
    else
        $error("FAIL: o_segout1[1] = %b", o_segout1[1]);

    //DRV_MAP1_09_01
    $display("[DRV_MAP1_09_01] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '0000'.");
    i_count[3:0] = 4'h0;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_02
    $display("[DRV_MAP1_09_02] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '0001'.");
    i_count[3:0] = 4'h1;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_03
    $display("[DRV_MAP1_09_03] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '0010'.");
    i_count[3:0] = 4'h2;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_04
    $display("[DRV_MAP1_09_04] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '0011'.");
    i_count[3:0] = 4'h3;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_05
    $display("[DRV_MAP1_09_05] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '0100'.");
    i_count[3:0] = 4'h4;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_06
    $display("[DRV_MAP1_09_06] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '0101'.");
    i_count[3:0] = 4'h5;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_07
    $display("[DRV_MAP1_09_07] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '0110'.");
    i_count[3:0] = 4'h6;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_08
    $display("[DRV_MAP1_09_08] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '0111'.");
    i_count[3:0] = 4'h7;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_09
    $display("[DRV_MAP1_09_09] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '1000'.");
    i_count[3:0] = 4'h8;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_10
    $display("[DRV_MAP1_09_10] The module shall set o_segout1[0] to logic low when i_count[3:0] is set to '1001'.");
    i_count[3:0] = 4'h9;
    #1 assert (o_segout1[0] == 0) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_11
    $display("[DRV_MAP1_09_11] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1010'.");
    i_count[3:0] = 4'hA;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_12
    $display("[DRV_MAP1_09_12] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1011'.");
    i_count[3:0] = 4'hB;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_13
    $display("[DRV_MAP1_09_13] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1100'.");
    i_count[3:0] = 4'hC;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_14
    $display("[DRV_MAP1_09_14] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1101'.");
    i_count[3:0] = 4'hD;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_15
    $display("[DRV_MAP1_09_15] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1110'.");
    i_count[3:0] = 4'hE;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    //DRV_MAP1_09_16
    $display("[DRV_MAP1_09_16] The module shall NOT set o_segout1[0] to logic low when i_count[3:0] is set to '1111'.");
    i_count[3:0] = 4'hF;
    #1 assert (o_segout1[0] == 1) 
        $display("PASS: o_segout1[0] = %b", o_segout1[0]);
    else
        $error("FAIL: o_segout1[0] = %b", o_segout1[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP2_01_01
    $display("[DRV_MAP2_01_01] The module shall append the DRV_MAP2_ group of requirements to the module's intialized value of o_segout2.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2 == 8'hFF) 
        $display("PASS: o_segout2 = %b", o_segout2);
    else
        $error("FAIL: o_segout2 = %b", o_segout2);
    
    //DRV_MAP2_02_01
    $display("[DRV_MAP2_02_01] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_02
    $display("[DRV_MAP2_02_02] The module shall set o_segout2[7] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[7] == 0) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_03
    $display("[DRV_MAP2_02_03] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_04
    $display("[DRV_MAP2_02_04] The module shall set o_segout2[7] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[7] == 0) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_05
    $display("[DRV_MAP2_02_05] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_06
    $display("[DRV_MAP2_02_06] The module shall set o_segout2[7] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[7] == 0) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_07
    $display("[DRV_MAP2_02_07] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_08
    $display("[DRV_MAP2_02_08] The module shall set o_segout2[7] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[7] == 0) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_09
    $display("[DRV_MAP2_02_09] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_10
    $display("[DRV_MAP2_02_10] The module shall set o_segout2[7] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[7] == 0) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_11
    $display("[DRV_MAP2_02_11] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_12
    $display("[DRV_MAP2_02_12] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_13
    $display("[DRV_MAP2_02_13] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_14
    $display("[DRV_MAP2_02_14] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_15
    $display("[DRV_MAP2_02_15] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_02_16
    $display("[DRV_MAP2_02_16] The module shall NOT set o_segout2[7] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[7] == 1) 
        $display("PASS: o_segout2[7] = %b", o_segout2[7]);
    else
        $error("FAIL: o_segout2[7] = %b", o_segout2[7]);

    //DRV_MAP2_03_01
    $display("[DRV_MAP2_03_01] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_02
    $display("[DRV_MAP2_03_02] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_03
    $display("[DRV_MAP2_03_03] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_04
    $display("[DRV_MAP2_03_04] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_05
    $display("[DRV_MAP2_03_05] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_06
    $display("[DRV_MAP2_03_06] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_07
    $display("[DRV_MAP2_03_07] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_08
    $display("[DRV_MAP2_03_08] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_09
    $display("[DRV_MAP2_03_09] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_10
    $display("[DRV_MAP2_03_10] The module shall set o_segout2[6] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[6] == 0) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_11
    $display("[DRV_MAP2_03_11] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_12
    $display("[DRV_MAP2_03_12] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_13
    $display("[DRV_MAP2_03_13] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_14
    $display("[DRV_MAP2_03_14] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_15
    $display("[DRV_MAP2_03_15] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_03_16
    $display("[DRV_MAP2_03_16] The module shall NOT set o_segout2[6] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[6] == 1) 
        $display("PASS: o_segout2[6] = %b", o_segout2[6]);
    else
        $error("FAIL: o_segout2[6] = %b", o_segout2[6]);

    //DRV_MAP2_04_01
    $display("[DRV_MAP2_04_01] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_02
    $display("[DRV_MAP2_04_02] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_03
    $display("[DRV_MAP2_04_03] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_04
    $display("[DRV_MAP2_04_04] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_05
    $display("[DRV_MAP2_04_05] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_06
    $display("[DRV_MAP2_04_06] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_07
    $display("[DRV_MAP2_04_07] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_08
    $display("[DRV_MAP2_04_08] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_09
    $display("[DRV_MAP2_04_09] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_10
    $display("[DRV_MAP2_04_10] The module shall set o_segout2[5] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[5] == 0) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_11
    $display("[DRV_MAP2_04_11] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_12
    $display("[DRV_MAP2_04_12] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_13
    $display("[DRV_MAP2_04_13] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_14
    $display("[DRV_MAP2_04_14] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_15
    $display("[DRV_MAP2_04_15] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_04_16
    $display("[DRV_MAP2_04_16] The module shall NOT set o_segout2[5] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[5] == 1) 
        $display("PASS: o_segout2[5] = %b", o_segout2[5]);
    else
        $error("FAIL: o_segout2[5] = %b", o_segout2[5]);

    //DRV_MAP2_05_01
    $display("[DRV_MAP2_05_01] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_02
    $display("[DRV_MAP2_05_02] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_03
    $display("[DRV_MAP2_05_03] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_04
    $display("[DRV_MAP2_05_04] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_05
    $display("[DRV_MAP2_05_05] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_06
    $display("[DRV_MAP2_05_06] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_07
    $display("[DRV_MAP2_05_07] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_08
    $display("[DRV_MAP2_05_08] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_09
    $display("[DRV_MAP2_05_09] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_10
    $display("[DRV_MAP2_05_10] The module shall set o_segout2[4] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[4] == 0) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_11
    $display("[DRV_MAP2_05_11] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_12
    $display("[DRV_MAP2_05_12] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_13
    $display("[DRV_MAP2_05_13] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_14
    $display("[DRV_MAP2_05_14] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_15
    $display("[DRV_MAP2_05_15] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_05_16
    $display("[DRV_MAP2_05_16] The module shall NOT set o_segout2[4] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[4] == 1) 
        $display("PASS: o_segout2[4] = %b", o_segout2[4]);
    else
        $error("FAIL: o_segout2[4] = %b", o_segout2[4]);

    //DRV_MAP2_06_01
    $display("[DRV_MAP2_06_01] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_02
    $display("[DRV_MAP2_06_02] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_03
    $display("[DRV_MAP2_06_03] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_04
    $display("[DRV_MAP2_06_04] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_05
    $display("[DRV_MAP2_06_05] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_06
    $display("[DRV_MAP2_06_06] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_07
    $display("[DRV_MAP2_06_07] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_08
    $display("[DRV_MAP2_06_08] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_09
    $display("[DRV_MAP2_06_09] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_10
    $display("[DRV_MAP2_06_10] The module shall set o_segout2[3] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[3] == 0) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_11
    $display("[DRV_MAP2_06_11] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_12
    $display("[DRV_MAP2_06_12] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_13
    $display("[DRV_MAP2_06_13] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_14
    $display("[DRV_MAP2_06_14] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_15
    $display("[DRV_MAP2_06_15] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_06_16
    $display("[DRV_MAP2_06_16] The module shall NOT set o_segout2[3] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[3] == 1) 
        $display("PASS: o_segout2[3] = %b", o_segout2[3]);
    else
        $error("FAIL: o_segout2[3] = %b", o_segout2[3]);

    //DRV_MAP2_07_01
    $display("[DRV_MAP2_07_01] The module shall set o_segout2[2] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[2] == 0) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_02
    $display("[DRV_MAP2_07_02] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_03
    $display("[DRV_MAP2_07_03] The module shall set o_segout2[2] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[2] == 0) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_04
    $display("[DRV_MAP2_07_04] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_05
    $display("[DRV_MAP2_07_05] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_06
    $display("[DRV_MAP2_07_06] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_07
    $display("[DRV_MAP2_07_07] The module shall set o_segout2[2] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[2] == 0) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_08
    $display("[DRV_MAP2_07_08] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_09
    $display("[DRV_MAP2_07_09] The module shall set o_segout2[2] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[2] == 0) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_10
    $display("[DRV_MAP2_07_10] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_11
    $display("[DRV_MAP2_07_11] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_12
    $display("[DRV_MAP2_07_12] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_13
    $display("[DRV_MAP2_07_13] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_14
    $display("[DRV_MAP2_07_14] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_15
    $display("[DRV_MAP2_07_15] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_07_16
    $display("[DRV_MAP2_07_16] The module shall NOT set o_segout2[2] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[2] == 1) 
        $display("PASS: o_segout2[2] = %b", o_segout2[2]);
    else
        $error("FAIL: o_segout2[2] = %b", o_segout2[2]);

    //DRV_MAP2_08_01
    $display("[DRV_MAP2_08_01] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_02
    $display("[DRV_MAP2_08_02] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_03
    $display("[DRV_MAP2_08_03] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_04
    $display("[DRV_MAP2_08_04] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_05
    $display("[DRV_MAP2_08_05] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_06
    $display("[DRV_MAP2_08_06] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_07
    $display("[DRV_MAP2_08_07] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_08
    $display("[DRV_MAP2_08_08] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_09
    $display("[DRV_MAP2_08_09] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_10
    $display("[DRV_MAP2_08_10] The module shall set o_segout2[1] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[1] == 0) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_11
    $display("[DRV_MAP2_08_11] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_12
    $display("[DRV_MAP2_08_12] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_13
    $display("[DRV_MAP2_08_13] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_14
    $display("[DRV_MAP2_08_14] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_15
    $display("[DRV_MAP2_08_15] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_08_16
    $display("[DRV_MAP2_08_16] The module shall NOT set o_segout2[1] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[1] == 1) 
        $display("PASS: o_segout2[1] = %b", o_segout2[1]);
    else
        $error("FAIL: o_segout2[1] = %b", o_segout2[1]);

    //DRV_MAP2_09_01
    $display("[DRV_MAP2_09_01] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '0000'.");
    i_count[7:4] = 4'h0;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_02
    $display("[DRV_MAP2_09_02] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '0001'.");
    i_count[7:4] = 4'h1;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_03
    $display("[DRV_MAP2_09_03] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '0010'.");
    i_count[7:4] = 4'h2;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_04
    $display("[DRV_MAP2_09_04] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '0011'.");
    i_count[7:4] = 4'h3;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_05
    $display("[DRV_MAP2_09_05] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '0100'.");
    i_count[7:4] = 4'h4;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_06
    $display("[DRV_MAP2_09_06] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '0101'.");
    i_count[7:4] = 4'h5;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_07
    $display("[DRV_MAP2_09_07] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '0110'.");
    i_count[7:4] = 4'h6;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_08
    $display("[DRV_MAP2_09_08] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '0111'.");
    i_count[7:4] = 4'h7;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_09
    $display("[DRV_MAP2_09_09] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '1000'.");
    i_count[7:4] = 4'h8;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_10
    $display("[DRV_MAP2_09_10] The module shall set o_segout2[0] to logic low when i_count[7:4] is set to '1001'.");
    i_count[7:4] = 4'h9;
    #1 assert (o_segout2[0] == 0) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_11
    $display("[DRV_MAP2_09_11] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1010'.");
    i_count[7:4] = 4'hA;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_12
    $display("[DRV_MAP2_09_12] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1011'.");
    i_count[7:4] = 4'hB;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_13
    $display("[DRV_MAP2_09_13] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1100'.");
    i_count[7:4] = 4'hC;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_14
    $display("[DRV_MAP2_09_14] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1101'.");
    i_count[7:4] = 4'hD;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_15
    $display("[DRV_MAP2_09_15] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1110'.");
    i_count[7:4] = 4'hE;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    //DRV_MAP2_09_16
    $display("[DRV_MAP2_09_16] The module shall NOT set o_segout2[0] to logic low when i_count[7:4] is set to '1111'.");
    i_count[7:4] = 4'hF;
    #1 assert (o_segout2[0] == 1) 
        $display("PASS: o_segout2[0] = %b", o_segout2[0]);
    else
        $error("FAIL: o_segout2[0] = %b", o_segout2[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP3_01_01
    $display("[DRV_MAP3_01_01] The module shall append the DRV_MAP3_ group of requirements to the module's intialized value of o_segout3.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3 == 8'hFF) 
        $display("PASS: o_segout3 = %b", o_segout3);
    else
        $error("FAIL: o_segout3 = %b", o_segout3);
    
    //DRV_MAP3_02_01
    $display("[DRV_MAP3_02_01] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_02
    $display("[DRV_MAP3_02_02] The module shall set o_segout3[7] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[7] == 0) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_03
    $display("[DRV_MAP3_02_03] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_04
    $display("[DRV_MAP3_02_04] The module shall set o_segout3[7] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[7] == 0) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_05
    $display("[DRV_MAP3_02_05] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_06
    $display("[DRV_MAP3_02_06] The module shall set o_segout3[7] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[7] == 0) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_07
    $display("[DRV_MAP3_02_07] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_08
    $display("[DRV_MAP3_02_08] The module shall set o_segout3[7] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[7] == 0) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_09
    $display("[DRV_MAP3_02_09] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_10
    $display("[DRV_MAP3_02_10] The module shall set o_segout3[7] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[7] == 0) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_11
    $display("[DRV_MAP3_02_11] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_12
    $display("[DRV_MAP3_02_12] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_13
    $display("[DRV_MAP3_02_13] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_14
    $display("[DRV_MAP3_02_14] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_15
    $display("[DRV_MAP3_02_15] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_02_16
    $display("[DRV_MAP3_02_16] The module shall NOT set o_segout3[7] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[7] == 1) 
        $display("PASS: o_segout3[7] = %b", o_segout3[7]);
    else
        $error("FAIL: o_segout3[7] = %b", o_segout3[7]);

    //DRV_MAP3_03_01
    $display("[DRV_MAP3_03_01] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_02
    $display("[DRV_MAP3_03_02] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_03
    $display("[DRV_MAP3_03_03] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_04
    $display("[DRV_MAP3_03_04] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_05
    $display("[DRV_MAP3_03_05] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_06
    $display("[DRV_MAP3_03_06] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_07
    $display("[DRV_MAP3_03_07] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_08
    $display("[DRV_MAP3_03_08] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_09
    $display("[DRV_MAP3_03_09] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_10
    $display("[DRV_MAP3_03_10] The module shall set o_segout3[6] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[6] == 0) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_11
    $display("[DRV_MAP3_03_11] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_12
    $display("[DRV_MAP3_03_12] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_13
    $display("[DRV_MAP3_03_13] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_14
    $display("[DRV_MAP3_03_14] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_15
    $display("[DRV_MAP3_03_15] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_03_16
    $display("[DRV_MAP3_03_16] The module shall NOT set o_segout3[6] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[6] == 1) 
        $display("PASS: o_segout3[6] = %b", o_segout3[6]);
    else
        $error("FAIL: o_segout3[6] = %b", o_segout3[6]);

    //DRV_MAP3_04_01
    $display("[DRV_MAP3_04_01] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_02
    $display("[DRV_MAP3_04_02] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_03
    $display("[DRV_MAP3_04_03] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_04
    $display("[DRV_MAP3_04_04] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_05
    $display("[DRV_MAP3_04_05] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_06
    $display("[DRV_MAP3_04_06] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_07
    $display("[DRV_MAP3_04_07] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_08
    $display("[DRV_MAP3_04_08] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_09
    $display("[DRV_MAP3_04_09] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_10
    $display("[DRV_MAP3_04_10] The module shall set o_segout3[5] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[5] == 0) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_11
    $display("[DRV_MAP3_04_11] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_12
    $display("[DRV_MAP3_04_12] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_13
    $display("[DRV_MAP3_04_13] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_14
    $display("[DRV_MAP3_04_14] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_15
    $display("[DRV_MAP3_04_15] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_04_16
    $display("[DRV_MAP3_04_16] The module shall NOT set o_segout3[5] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[5] == 1) 
        $display("PASS: o_segout3[5] = %b", o_segout3[5]);
    else
        $error("FAIL: o_segout3[5] = %b", o_segout3[5]);

    //DRV_MAP3_05_01
    $display("[DRV_MAP3_05_01] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_02
    $display("[DRV_MAP3_05_02] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_03
    $display("[DRV_MAP3_05_03] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_04
    $display("[DRV_MAP3_05_04] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_05
    $display("[DRV_MAP3_05_05] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_06
    $display("[DRV_MAP3_05_06] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_07
    $display("[DRV_MAP3_05_07] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_08
    $display("[DRV_MAP3_05_08] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_09
    $display("[DRV_MAP3_05_09] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_10
    $display("[DRV_MAP3_05_10] The module shall set o_segout3[4] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[4] == 0) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_11
    $display("[DRV_MAP3_05_11] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_12
    $display("[DRV_MAP3_05_12] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_13
    $display("[DRV_MAP3_05_13] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_14
    $display("[DRV_MAP3_05_14] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_15
    $display("[DRV_MAP3_05_15] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_05_16
    $display("[DRV_MAP3_05_16] The module shall NOT set o_segout3[4] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[4] == 1) 
        $display("PASS: o_segout3[4] = %b", o_segout3[4]);
    else
        $error("FAIL: o_segout3[4] = %b", o_segout3[4]);

    //DRV_MAP3_06_01
    $display("[DRV_MAP3_06_01] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_02
    $display("[DRV_MAP3_06_02] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_03
    $display("[DRV_MAP3_06_03] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_04
    $display("[DRV_MAP3_06_04] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_05
    $display("[DRV_MAP3_06_05] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_06
    $display("[DRV_MAP3_06_06] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_07
    $display("[DRV_MAP3_06_07] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_08
    $display("[DRV_MAP3_06_08] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_09
    $display("[DRV_MAP3_06_09] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_10
    $display("[DRV_MAP3_06_10] The module shall set o_segout3[3] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[3] == 0) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_11
    $display("[DRV_MAP3_06_11] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_12
    $display("[DRV_MAP3_06_12] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_13
    $display("[DRV_MAP3_06_13] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_14
    $display("[DRV_MAP3_06_14] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_15
    $display("[DRV_MAP3_06_15] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_06_16
    $display("[DRV_MAP3_06_16] The module shall NOT set o_segout3[3] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[3] == 1) 
        $display("PASS: o_segout3[3] = %b", o_segout3[3]);
    else
        $error("FAIL: o_segout3[3] = %b", o_segout3[3]);

    //DRV_MAP3_07_01
    $display("[DRV_MAP3_07_01] The module shall set o_segout3[2] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[2] == 0) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_02
    $display("[DRV_MAP3_07_02] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_03
    $display("[DRV_MAP3_07_03] The module shall set o_segout3[2] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[2] == 0) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_04
    $display("[DRV_MAP3_07_04] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_05
    $display("[DRV_MAP3_07_05] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_06
    $display("[DRV_MAP3_07_06] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_07
    $display("[DRV_MAP3_07_07] The module shall set o_segout3[2] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[2] == 0) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_08
    $display("[DRV_MAP3_07_08] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_09
    $display("[DRV_MAP3_07_09] The module shall set o_segout3[2] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[2] == 0) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_10
    $display("[DRV_MAP3_07_10] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_11
    $display("[DRV_MAP3_07_11] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_12
    $display("[DRV_MAP3_07_12] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_13
    $display("[DRV_MAP3_07_13] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_14
    $display("[DRV_MAP3_07_14] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_15
    $display("[DRV_MAP3_07_15] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_07_16
    $display("[DRV_MAP3_07_16] The module shall NOT set o_segout3[2] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[2] == 1) 
        $display("PASS: o_segout3[2] = %b", o_segout3[2]);
    else
        $error("FAIL: o_segout3[2] = %b", o_segout3[2]);

    //DRV_MAP3_08_01
    $display("[DRV_MAP3_08_01] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_02
    $display("[DRV_MAP3_08_02] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_03
    $display("[DRV_MAP3_08_03] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_04
    $display("[DRV_MAP3_08_04] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_05
    $display("[DRV_MAP3_08_05] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_06
    $display("[DRV_MAP3_08_06] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_07
    $display("[DRV_MAP3_08_07] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_08
    $display("[DRV_MAP3_08_08] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_09
    $display("[DRV_MAP3_08_09] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_10
    $display("[DRV_MAP3_08_10] The module shall set o_segout3[1] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[1] == 0) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_11
    $display("[DRV_MAP3_08_11] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_12
    $display("[DRV_MAP3_08_12] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_13
    $display("[DRV_MAP3_08_13] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_14
    $display("[DRV_MAP3_08_14] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_15
    $display("[DRV_MAP3_08_15] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_08_16
    $display("[DRV_MAP3_08_16] The module shall NOT set o_segout3[1] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[1] == 1) 
        $display("PASS: o_segout3[1] = %b", o_segout3[1]);
    else
        $error("FAIL: o_segout3[1] = %b", o_segout3[1]);

    //DRV_MAP3_09_01
    $display("[DRV_MAP3_09_01] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '0000'.");
    i_count[11:8] = 4'h0;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_02
    $display("[DRV_MAP3_09_02] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '0001'.");
    i_count[11:8] = 4'h1;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_03
    $display("[DRV_MAP3_09_03] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '0010'.");
    i_count[11:8] = 4'h2;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_04
    $display("[DRV_MAP3_09_04] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '0011'.");
    i_count[11:8] = 4'h3;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_05
    $display("[DRV_MAP3_09_05] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '0100'.");
    i_count[11:8] = 4'h4;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_06
    $display("[DRV_MAP3_09_06] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '0101'.");
    i_count[11:8] = 4'h5;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_07
    $display("[DRV_MAP3_09_07] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '0110'.");
    i_count[11:8] = 4'h6;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_08
    $display("[DRV_MAP3_09_08] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '0111'.");
    i_count[11:8] = 4'h7;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_09
    $display("[DRV_MAP3_09_09] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '1000'.");
    i_count[11:8] = 4'h8;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_10
    $display("[DRV_MAP3_09_10] The module shall set o_segout3[0] to logic low when i_count[11:8] is set to '1001'.");
    i_count[11:8] = 4'h9;
    #1 assert (o_segout3[0] == 0) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_11
    $display("[DRV_MAP3_09_11] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1010'.");
    i_count[11:8] = 4'hA;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_12
    $display("[DRV_MAP3_09_12] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1011'.");
    i_count[11:8] = 4'hB;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_13
    $display("[DRV_MAP3_09_13] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1100'.");
    i_count[11:8] = 4'hC;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_14
    $display("[DRV_MAP3_09_14] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1101'.");
    i_count[11:8] = 4'hD;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_15
    $display("[DRV_MAP3_09_15] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1110'.");
    i_count[11:8] = 4'hE;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    //DRV_MAP3_09_16
    $display("[DRV_MAP3_09_16] The module shall NOT set o_segout3[0] to logic low when i_count[11:8] is set to '1111'.");
    i_count[11:8] = 4'hF;
    #1 assert (o_segout3[0] == 1) 
        $display("PASS: o_segout3[0] = %b", o_segout3[0]);
    else
        $error("FAIL: o_segout3[0] = %b", o_segout3[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP4_01_01
    $display("[DRV_MAP4_01_01] The module shall append the DRV_MAP4_ group of requirements to the module's intialized value of o_segout4.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4 == 8'hFF) 
        $display("PASS: o_segout4 = %b", o_segout4);
    else
        $error("FAIL: o_segout4 = %b", o_segout4);
    
    //DRV_MAP4_02_01
    $display("[DRV_MAP4_02_01] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_02
    $display("[DRV_MAP4_02_02] The module shall set o_segout4[7] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[7] == 0) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_03
    $display("[DRV_MAP4_02_03] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_04
    $display("[DRV_MAP4_02_04] The module shall set o_segout4[7] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[7] == 0) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_05
    $display("[DRV_MAP4_02_05] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_06
    $display("[DRV_MAP4_02_06] The module shall set o_segout4[7] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[7] == 0) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_07
    $display("[DRV_MAP4_02_07] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_08
    $display("[DRV_MAP4_02_08] The module shall set o_segout4[7] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[7] == 0) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_09
    $display("[DRV_MAP4_02_09] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_10
    $display("[DRV_MAP4_02_10] The module shall set o_segout4[7] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[7] == 0) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_11
    $display("[DRV_MAP4_02_11] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_12
    $display("[DRV_MAP4_02_12] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_13
    $display("[DRV_MAP4_02_13] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_14
    $display("[DRV_MAP4_02_14] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_15
    $display("[DRV_MAP4_02_15] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_02_16
    $display("[DRV_MAP4_02_16] The module shall NOT set o_segout4[7] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[7] == 1) 
        $display("PASS: o_segout4[7] = %b", o_segout4[7]);
    else
        $error("FAIL: o_segout4[7] = %b", o_segout4[7]);

    //DRV_MAP4_03_01
    $display("[DRV_MAP4_03_01] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_02
    $display("[DRV_MAP4_03_02] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_03
    $display("[DRV_MAP4_03_03] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_04
    $display("[DRV_MAP4_03_04] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_05
    $display("[DRV_MAP4_03_05] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_06
    $display("[DRV_MAP4_03_06] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_07
    $display("[DRV_MAP4_03_07] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_08
    $display("[DRV_MAP4_03_08] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_09
    $display("[DRV_MAP4_03_09] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_10
    $display("[DRV_MAP4_03_10] The module shall set o_segout4[6] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[6] == 0) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_11
    $display("[DRV_MAP4_03_11] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_12
    $display("[DRV_MAP4_03_12] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_13
    $display("[DRV_MAP4_03_13] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_14
    $display("[DRV_MAP4_03_14] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_15
    $display("[DRV_MAP4_03_15] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_03_16
    $display("[DRV_MAP4_03_16] The module shall NOT set o_segout4[6] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[6] == 1) 
        $display("PASS: o_segout4[6] = %b", o_segout4[6]);
    else
        $error("FAIL: o_segout4[6] = %b", o_segout4[6]);

    //DRV_MAP4_04_01
    $display("[DRV_MAP4_04_01] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_02
    $display("[DRV_MAP4_04_02] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_03
    $display("[DRV_MAP4_04_03] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_04
    $display("[DRV_MAP4_04_04] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_05
    $display("[DRV_MAP4_04_05] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_06
    $display("[DRV_MAP4_04_06] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_07
    $display("[DRV_MAP4_04_07] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_08
    $display("[DRV_MAP4_04_08] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_09
    $display("[DRV_MAP4_04_09] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_10
    $display("[DRV_MAP4_04_10] The module shall set o_segout4[5] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[5] == 0) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_11
    $display("[DRV_MAP4_04_11] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_12
    $display("[DRV_MAP4_04_12] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_13
    $display("[DRV_MAP4_04_13] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_14
    $display("[DRV_MAP4_04_14] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_15
    $display("[DRV_MAP4_04_15] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_04_16
    $display("[DRV_MAP4_04_16] The module shall NOT set o_segout4[5] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[5] == 1) 
        $display("PASS: o_segout4[5] = %b", o_segout4[5]);
    else
        $error("FAIL: o_segout4[5] = %b", o_segout4[5]);

    //DRV_MAP4_05_01
    $display("[DRV_MAP4_05_01] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_02
    $display("[DRV_MAP4_05_02] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_03
    $display("[DRV_MAP4_05_03] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_04
    $display("[DRV_MAP4_05_04] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_05
    $display("[DRV_MAP4_05_05] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_06
    $display("[DRV_MAP4_05_06] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_07
    $display("[DRV_MAP4_05_07] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_08
    $display("[DRV_MAP4_05_08] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_09
    $display("[DRV_MAP4_05_09] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_10
    $display("[DRV_MAP4_05_10] The module shall set o_segout4[4] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[4] == 0) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_11
    $display("[DRV_MAP4_05_11] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_12
    $display("[DRV_MAP4_05_12] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_13
    $display("[DRV_MAP4_05_13] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_14
    $display("[DRV_MAP4_05_14] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_15
    $display("[DRV_MAP4_05_15] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_05_16
    $display("[DRV_MAP4_05_16] The module shall NOT set o_segout4[4] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[4] == 1) 
        $display("PASS: o_segout4[4] = %b", o_segout4[4]);
    else
        $error("FAIL: o_segout4[4] = %b", o_segout4[4]);

    //DRV_MAP4_06_01
    $display("[DRV_MAP4_06_01] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_02
    $display("[DRV_MAP4_06_02] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_03
    $display("[DRV_MAP4_06_03] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_04
    $display("[DRV_MAP4_06_04] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_05
    $display("[DRV_MAP4_06_05] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_06
    $display("[DRV_MAP4_06_06] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_07
    $display("[DRV_MAP4_06_07] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_08
    $display("[DRV_MAP4_06_08] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_09
    $display("[DRV_MAP4_06_09] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_10
    $display("[DRV_MAP4_06_10] The module shall set o_segout4[3] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[3] == 0) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_11
    $display("[DRV_MAP4_06_11] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_12
    $display("[DRV_MAP4_06_12] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_13
    $display("[DRV_MAP4_06_13] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_14
    $display("[DRV_MAP4_06_14] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_15
    $display("[DRV_MAP4_06_15] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_06_16
    $display("[DRV_MAP4_06_16] The module shall NOT set o_segout4[3] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[3] == 1) 
        $display("PASS: o_segout4[3] = %b", o_segout4[3]);
    else
        $error("FAIL: o_segout4[3] = %b", o_segout4[3]);

    //DRV_MAP4_07_01
    $display("[DRV_MAP4_07_01] The module shall set o_segout4[2] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[2] == 0) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_02
    $display("[DRV_MAP4_07_02] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_03
    $display("[DRV_MAP4_07_03] The module shall set o_segout4[2] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[2] == 0) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_04
    $display("[DRV_MAP4_07_04] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_05
    $display("[DRV_MAP4_07_05] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_06
    $display("[DRV_MAP4_07_06] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_07
    $display("[DRV_MAP4_07_07] The module shall set o_segout4[2] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[2] == 0) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_08
    $display("[DRV_MAP4_07_08] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_09
    $display("[DRV_MAP4_07_09] The module shall set o_segout4[2] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[2] == 0) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_10
    $display("[DRV_MAP4_07_10] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_11
    $display("[DRV_MAP4_07_11] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_12
    $display("[DRV_MAP4_07_12] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_13
    $display("[DRV_MAP4_07_13] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_14
    $display("[DRV_MAP4_07_14] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_15
    $display("[DRV_MAP4_07_15] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_07_16
    $display("[DRV_MAP4_07_16] The module shall NOT set o_segout4[2] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[2] == 1) 
        $display("PASS: o_segout4[2] = %b", o_segout4[2]);
    else
        $error("FAIL: o_segout4[2] = %b", o_segout4[2]);

    //DRV_MAP4_08_01
    $display("[DRV_MAP4_08_01] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_02
    $display("[DRV_MAP4_08_02] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_03
    $display("[DRV_MAP4_08_03] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_04
    $display("[DRV_MAP4_08_04] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_05
    $display("[DRV_MAP4_08_05] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_06
    $display("[DRV_MAP4_08_06] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_07
    $display("[DRV_MAP4_08_07] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_08
    $display("[DRV_MAP4_08_08] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_09
    $display("[DRV_MAP4_08_09] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_10
    $display("[DRV_MAP4_08_10] The module shall set o_segout4[1] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[1] == 0) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_11
    $display("[DRV_MAP4_08_11] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_12
    $display("[DRV_MAP4_08_12] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_13
    $display("[DRV_MAP4_08_13] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_14
    $display("[DRV_MAP4_08_14] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_15
    $display("[DRV_MAP4_08_15] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_08_16
    $display("[DRV_MAP4_08_16] The module shall NOT set o_segout4[1] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[1] == 1) 
        $display("PASS: o_segout4[1] = %b", o_segout4[1]);
    else
        $error("FAIL: o_segout4[1] = %b", o_segout4[1]);

    //DRV_MAP4_09_01
    $display("[DRV_MAP4_09_01] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '0000'.");
    i_count[15:12] = 4'h0;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_02
    $display("[DRV_MAP4_09_02] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '0001'.");
    i_count[15:12] = 4'h1;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_03
    $display("[DRV_MAP4_09_03] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '0010'.");
    i_count[15:12] = 4'h2;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_04
    $display("[DRV_MAP4_09_04] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '0011'.");
    i_count[15:12] = 4'h3;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_05
    $display("[DRV_MAP4_09_05] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '0100'.");
    i_count[15:12] = 4'h4;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_06
    $display("[DRV_MAP4_09_06] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '0101'.");
    i_count[15:12] = 4'h5;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_07
    $display("[DRV_MAP4_09_07] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '0110'.");
    i_count[15:12] = 4'h6;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_08
    $display("[DRV_MAP4_09_08] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '0111'.");
    i_count[15:12] = 4'h7;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_09
    $display("[DRV_MAP4_09_09] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '1000'.");
    i_count[15:12] = 4'h8;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_10
    $display("[DRV_MAP4_09_10] The module shall set o_segout4[0] to logic low when i_count[15:12] is set to '1001'.");
    i_count[15:12] = 4'h9;
    #1 assert (o_segout4[0] == 0) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_11
    $display("[DRV_MAP4_09_11] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1010'.");
    i_count[15:12] = 4'hA;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_12
    $display("[DRV_MAP4_09_12] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1011'.");
    i_count[15:12] = 4'hB;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_13
    $display("[DRV_MAP4_09_13] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1100'.");
    i_count[15:12] = 4'hC;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_14
    $display("[DRV_MAP4_09_14] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1101'.");
    i_count[15:12] = 4'hD;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_15
    $display("[DRV_MAP4_09_15] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1110'.");
    i_count[15:12] = 4'hE;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    //DRV_MAP4_09_16
    $display("[DRV_MAP4_09_16] The module shall NOT set o_segout4[0] to logic low when i_count[15:12] is set to '1111'.");
    i_count[15:12] = 4'hF;
    #1 assert (o_segout4[0] == 1) 
        $display("PASS: o_segout4[0] = %b", o_segout4[0]);
    else
        $error("FAIL: o_segout4[0] = %b", o_segout4[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP5_01_01
    $display("[DRV_MAP5_01_01] The module shall append the DRV_MAP5_ group of requirements to the module's intialized value of o_segout5.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5 == 8'hFF) 
        $display("PASS: o_segout5 = %b", o_segout5);
    else
        $error("FAIL: o_segout5 = %b", o_segout5);
    
    //DRV_MAP5_02_01
    $display("[DRV_MAP5_02_01] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_02
    $display("[DRV_MAP5_02_02] The module shall set o_segout5[7] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[7] == 0) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_03
    $display("[DRV_MAP5_02_03] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_04
    $display("[DRV_MAP5_02_04] The module shall set o_segout5[7] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[7] == 0) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_05
    $display("[DRV_MAP5_02_05] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_06
    $display("[DRV_MAP5_02_06] The module shall set o_segout5[7] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[7] == 0) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_07
    $display("[DRV_MAP5_02_07] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_08
    $display("[DRV_MAP5_02_08] The module shall set o_segout5[7] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[7] == 0) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_09
    $display("[DRV_MAP5_02_09] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_10
    $display("[DRV_MAP5_02_10] The module shall set o_segout5[7] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[7] == 0) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_11
    $display("[DRV_MAP5_02_11] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_12
    $display("[DRV_MAP5_02_12] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_13
    $display("[DRV_MAP5_02_13] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_14
    $display("[DRV_MAP5_02_14] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_15
    $display("[DRV_MAP5_02_15] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_02_16
    $display("[DRV_MAP5_02_16] The module shall NOT set o_segout5[7] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[7] == 1) 
        $display("PASS: o_segout5[7] = %b", o_segout5[7]);
    else
        $error("FAIL: o_segout5[7] = %b", o_segout5[7]);

    //DRV_MAP5_03_01
    $display("[DRV_MAP5_03_01] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_02
    $display("[DRV_MAP5_03_02] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_03
    $display("[DRV_MAP5_03_03] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_04
    $display("[DRV_MAP5_03_04] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_05
    $display("[DRV_MAP5_03_05] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_06
    $display("[DRV_MAP5_03_06] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_07
    $display("[DRV_MAP5_03_07] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_08
    $display("[DRV_MAP5_03_08] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_09
    $display("[DRV_MAP5_03_09] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_10
    $display("[DRV_MAP5_03_10] The module shall set o_segout5[6] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[6] == 0) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_11
    $display("[DRV_MAP5_03_11] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_12
    $display("[DRV_MAP5_03_12] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_13
    $display("[DRV_MAP5_03_13] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_14
    $display("[DRV_MAP5_03_14] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_15
    $display("[DRV_MAP5_03_15] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_03_16
    $display("[DRV_MAP5_03_16] The module shall NOT set o_segout5[6] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[6] == 1) 
        $display("PASS: o_segout5[6] = %b", o_segout5[6]);
    else
        $error("FAIL: o_segout5[6] = %b", o_segout5[6]);

    //DRV_MAP5_04_01
    $display("[DRV_MAP5_04_01] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_02
    $display("[DRV_MAP5_04_02] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_03
    $display("[DRV_MAP5_04_03] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_04
    $display("[DRV_MAP5_04_04] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_05
    $display("[DRV_MAP5_04_05] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_06
    $display("[DRV_MAP5_04_06] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_07
    $display("[DRV_MAP5_04_07] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_08
    $display("[DRV_MAP5_04_08] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_09
    $display("[DRV_MAP5_04_09] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_10
    $display("[DRV_MAP5_04_10] The module shall set o_segout5[5] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[5] == 0) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_11
    $display("[DRV_MAP5_04_11] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_12
    $display("[DRV_MAP5_04_12] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_13
    $display("[DRV_MAP5_04_13] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_14
    $display("[DRV_MAP5_04_14] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_15
    $display("[DRV_MAP5_04_15] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_04_16
    $display("[DRV_MAP5_04_16] The module shall NOT set o_segout5[5] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[5] == 1) 
        $display("PASS: o_segout5[5] = %b", o_segout5[5]);
    else
        $error("FAIL: o_segout5[5] = %b", o_segout5[5]);

    //DRV_MAP5_05_01
    $display("[DRV_MAP5_05_01] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_02
    $display("[DRV_MAP5_05_02] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_03
    $display("[DRV_MAP5_05_03] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_04
    $display("[DRV_MAP5_05_04] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_05
    $display("[DRV_MAP5_05_05] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_06
    $display("[DRV_MAP5_05_06] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_07
    $display("[DRV_MAP5_05_07] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_08
    $display("[DRV_MAP5_05_08] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_09
    $display("[DRV_MAP5_05_09] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_10
    $display("[DRV_MAP5_05_10] The module shall set o_segout5[4] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[4] == 0) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_11
    $display("[DRV_MAP5_05_11] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_12
    $display("[DRV_MAP5_05_12] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_13
    $display("[DRV_MAP5_05_13] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_14
    $display("[DRV_MAP5_05_14] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_15
    $display("[DRV_MAP5_05_15] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_05_16
    $display("[DRV_MAP5_05_16] The module shall NOT set o_segout5[4] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[4] == 1) 
        $display("PASS: o_segout5[4] = %b", o_segout5[4]);
    else
        $error("FAIL: o_segout5[4] = %b", o_segout5[4]);

    //DRV_MAP5_06_01
    $display("[DRV_MAP5_06_01] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_02
    $display("[DRV_MAP5_06_02] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_03
    $display("[DRV_MAP5_06_03] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_04
    $display("[DRV_MAP5_06_04] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_05
    $display("[DRV_MAP5_06_05] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_06
    $display("[DRV_MAP5_06_06] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_07
    $display("[DRV_MAP5_06_07] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_08
    $display("[DRV_MAP5_06_08] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_09
    $display("[DRV_MAP5_06_09] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_10
    $display("[DRV_MAP5_06_10] The module shall set o_segout5[3] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[3] == 0) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_11
    $display("[DRV_MAP5_06_11] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_12
    $display("[DRV_MAP5_06_12] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_13
    $display("[DRV_MAP5_06_13] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_14
    $display("[DRV_MAP5_06_14] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_15
    $display("[DRV_MAP5_06_15] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_06_16
    $display("[DRV_MAP5_06_16] The module shall NOT set o_segout5[3] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[3] == 1) 
        $display("PASS: o_segout5[3] = %b", o_segout5[3]);
    else
        $error("FAIL: o_segout5[3] = %b", o_segout5[3]);

    //DRV_MAP5_07_01
    $display("[DRV_MAP5_07_01] The module shall set o_segout5[2] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[2] == 0) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_02
    $display("[DRV_MAP5_07_02] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_03
    $display("[DRV_MAP5_07_03] The module shall set o_segout5[2] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[2] == 0) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_04
    $display("[DRV_MAP5_07_04] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_05
    $display("[DRV_MAP5_07_05] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_06
    $display("[DRV_MAP5_07_06] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_07
    $display("[DRV_MAP5_07_07] The module shall set o_segout5[2] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[2] == 0) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_08
    $display("[DRV_MAP5_07_08] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_09
    $display("[DRV_MAP5_07_09] The module shall set o_segout5[2] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[2] == 0) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_10
    $display("[DRV_MAP5_07_10] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_11
    $display("[DRV_MAP5_07_11] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_12
    $display("[DRV_MAP5_07_12] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_13
    $display("[DRV_MAP5_07_13] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_14
    $display("[DRV_MAP5_07_14] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_15
    $display("[DRV_MAP5_07_15] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_07_16
    $display("[DRV_MAP5_07_16] The module shall NOT set o_segout5[2] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[2] == 1) 
        $display("PASS: o_segout5[2] = %b", o_segout5[2]);
    else
        $error("FAIL: o_segout5[2] = %b", o_segout5[2]);

    //DRV_MAP5_08_01
    $display("[DRV_MAP5_08_01] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_02
    $display("[DRV_MAP5_08_02] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_03
    $display("[DRV_MAP5_08_03] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_04
    $display("[DRV_MAP5_08_04] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_05
    $display("[DRV_MAP5_08_05] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_06
    $display("[DRV_MAP5_08_06] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_07
    $display("[DRV_MAP5_08_07] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_08
    $display("[DRV_MAP5_08_08] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_09
    $display("[DRV_MAP5_08_09] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_10
    $display("[DRV_MAP5_08_10] The module shall set o_segout5[1] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[1] == 0) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_11
    $display("[DRV_MAP5_08_11] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_12
    $display("[DRV_MAP5_08_12] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_13
    $display("[DRV_MAP5_08_13] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_14
    $display("[DRV_MAP5_08_14] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_15
    $display("[DRV_MAP5_08_15] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_08_16
    $display("[DRV_MAP5_08_16] The module shall NOT set o_segout5[1] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[1] == 1) 
        $display("PASS: o_segout5[1] = %b", o_segout5[1]);
    else
        $error("FAIL: o_segout5[1] = %b", o_segout5[1]);

    //DRV_MAP5_09_01
    $display("[DRV_MAP5_09_01] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '0000'.");
    i_count[19:16] = 4'h0;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_02
    $display("[DRV_MAP5_09_02] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '0001'.");
    i_count[19:16] = 4'h1;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_03
    $display("[DRV_MAP5_09_03] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '0010'.");
    i_count[19:16] = 4'h2;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_04
    $display("[DRV_MAP5_09_04] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '0011'.");
    i_count[19:16] = 4'h3;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_05
    $display("[DRV_MAP5_09_05] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '0100'.");
    i_count[19:16] = 4'h4;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_06
    $display("[DRV_MAP5_09_06] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '0101'.");
    i_count[19:16] = 4'h5;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_07
    $display("[DRV_MAP5_09_07] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '0110'.");
    i_count[19:16] = 4'h6;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_08
    $display("[DRV_MAP5_09_08] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '0111'.");
    i_count[19:16] = 4'h7;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_09
    $display("[DRV_MAP5_09_09] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '1000'.");
    i_count[19:16] = 4'h8;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_10
    $display("[DRV_MAP5_09_10] The module shall set o_segout5[0] to logic low when i_count[19:16] is set to '1001'.");
    i_count[19:16] = 4'h9;
    #1 assert (o_segout5[0] == 0) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_11
    $display("[DRV_MAP5_09_11] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1010'.");
    i_count[19:16] = 4'hA;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_12
    $display("[DRV_MAP5_09_12] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1011'.");
    i_count[19:16] = 4'hB;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_13
    $display("[DRV_MAP5_09_13] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1100'.");
    i_count[19:16] = 4'hC;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_14
    $display("[DRV_MAP5_09_14] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1101'.");
    i_count[19:16] = 4'hD;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_15
    $display("[DRV_MAP5_09_15] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1110'.");
    i_count[19:16] = 4'hE;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    //DRV_MAP5_09_16
    $display("[DRV_MAP5_09_16] The module shall NOT set o_segout5[0] to logic low when i_count[19:16] is set to '1111'.");
    i_count[19:16] = 4'hF;
    #1 assert (o_segout5[0] == 1) 
        $display("PASS: o_segout5[0] = %b", o_segout5[0]);
    else
        $error("FAIL: o_segout5[0] = %b", o_segout5[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //DRV_MAP6_01_01
    $display("[DRV_MAP6_01_01] The module shall append the DRV_MAP6_ group of requirements to the module's intialized value of o_segout6.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6 == 8'hFF) 
        $display("PASS: o_segout6 = %b", o_segout6);
    else
        $error("FAIL: o_segout6 = %b", o_segout6);
    
    //DRV_MAP6_02_01
    $display("[DRV_MAP6_02_01] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_02
    $display("[DRV_MAP6_02_02] The module shall set o_segout6[7] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[7] == 0) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_03
    $display("[DRV_MAP6_02_03] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_04
    $display("[DRV_MAP6_02_04] The module shall set o_segout6[7] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[7] == 0) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_05
    $display("[DRV_MAP6_02_05] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_06
    $display("[DRV_MAP6_02_06] The module shall set o_segout6[7] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[7] == 0) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_07
    $display("[DRV_MAP6_02_07] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_08
    $display("[DRV_MAP6_02_08] The module shall set o_segout6[7] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[7] == 0) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_09
    $display("[DRV_MAP6_02_09] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_10
    $display("[DRV_MAP6_02_10] The module shall set o_segout6[7] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[7] == 0) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_11
    $display("[DRV_MAP6_02_11] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_12
    $display("[DRV_MAP6_02_12] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_13
    $display("[DRV_MAP6_02_13] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_14
    $display("[DRV_MAP6_02_14] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_15
    $display("[DRV_MAP6_02_15] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_02_16
    $display("[DRV_MAP6_02_16] The module shall NOT set o_segout6[7] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[7] == 1) 
        $display("PASS: o_segout6[7] = %b", o_segout6[7]);
    else
        $error("FAIL: o_segout6[7] = %b", o_segout6[7]);

    //DRV_MAP6_03_01
    $display("[DRV_MAP6_03_01] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_02
    $display("[DRV_MAP6_03_02] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_03
    $display("[DRV_MAP6_03_03] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_04
    $display("[DRV_MAP6_03_04] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_05
    $display("[DRV_MAP6_03_05] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_06
    $display("[DRV_MAP6_03_06] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_07
    $display("[DRV_MAP6_03_07] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_08
    $display("[DRV_MAP6_03_08] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_09
    $display("[DRV_MAP6_03_09] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_10
    $display("[DRV_MAP6_03_10] The module shall set o_segout6[6] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[6] == 0) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_11
    $display("[DRV_MAP6_03_11] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_12
    $display("[DRV_MAP6_03_12] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_13
    $display("[DRV_MAP6_03_13] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_14
    $display("[DRV_MAP6_03_14] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_15
    $display("[DRV_MAP6_03_15] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_03_16
    $display("[DRV_MAP6_03_16] The module shall NOT set o_segout6[6] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[6] == 1) 
        $display("PASS: o_segout6[6] = %b", o_segout6[6]);
    else
        $error("FAIL: o_segout6[6] = %b", o_segout6[6]);

    //DRV_MAP6_04_01
    $display("[DRV_MAP6_04_01] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_02
    $display("[DRV_MAP6_04_02] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_03
    $display("[DRV_MAP6_04_03] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_04
    $display("[DRV_MAP6_04_04] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_05
    $display("[DRV_MAP6_04_05] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_06
    $display("[DRV_MAP6_04_06] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_07
    $display("[DRV_MAP6_04_07] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_08
    $display("[DRV_MAP6_04_08] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_09
    $display("[DRV_MAP6_04_09] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_10
    $display("[DRV_MAP6_04_10] The module shall set o_segout6[5] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[5] == 0) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_11
    $display("[DRV_MAP6_04_11] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_12
    $display("[DRV_MAP6_04_12] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_13
    $display("[DRV_MAP6_04_13] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_14
    $display("[DRV_MAP6_04_14] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_15
    $display("[DRV_MAP6_04_15] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_04_16
    $display("[DRV_MAP6_04_16] The module shall NOT set o_segout6[5] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[5] == 1) 
        $display("PASS: o_segout6[5] = %b", o_segout6[5]);
    else
        $error("FAIL: o_segout6[5] = %b", o_segout6[5]);

    //DRV_MAP6_05_01
    $display("[DRV_MAP6_05_01] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_02
    $display("[DRV_MAP6_05_02] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_03
    $display("[DRV_MAP6_05_03] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_04
    $display("[DRV_MAP6_05_04] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_05
    $display("[DRV_MAP6_05_05] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_06
    $display("[DRV_MAP6_05_06] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_07
    $display("[DRV_MAP6_05_07] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_08
    $display("[DRV_MAP6_05_08] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_09
    $display("[DRV_MAP6_05_09] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_10
    $display("[DRV_MAP6_05_10] The module shall set o_segout6[4] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[4] == 0) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_11
    $display("[DRV_MAP6_05_11] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_12
    $display("[DRV_MAP6_05_12] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_13
    $display("[DRV_MAP6_05_13] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_14
    $display("[DRV_MAP6_05_14] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_15
    $display("[DRV_MAP6_05_15] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_05_16
    $display("[DRV_MAP6_05_16] The module shall NOT set o_segout6[4] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[4] == 1) 
        $display("PASS: o_segout6[4] = %b", o_segout6[4]);
    else
        $error("FAIL: o_segout6[4] = %b", o_segout6[4]);

    //DRV_MAP6_06_01
    $display("[DRV_MAP6_06_01] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_02
    $display("[DRV_MAP6_06_02] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_03
    $display("[DRV_MAP6_06_03] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_04
    $display("[DRV_MAP6_06_04] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_05
    $display("[DRV_MAP6_06_05] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_06
    $display("[DRV_MAP6_06_06] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_07
    $display("[DRV_MAP6_06_07] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_08
    $display("[DRV_MAP6_06_08] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_09
    $display("[DRV_MAP6_06_09] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_10
    $display("[DRV_MAP6_06_10] The module shall set o_segout6[3] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[3] == 0) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_11
    $display("[DRV_MAP6_06_11] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_12
    $display("[DRV_MAP6_06_12] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_13
    $display("[DRV_MAP6_06_13] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_14
    $display("[DRV_MAP6_06_14] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_15
    $display("[DRV_MAP6_06_15] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_06_16
    $display("[DRV_MAP6_06_16] The module shall NOT set o_segout6[3] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[3] == 1) 
        $display("PASS: o_segout6[3] = %b", o_segout6[3]);
    else
        $error("FAIL: o_segout6[3] = %b", o_segout6[3]);

    //DRV_MAP6_07_01
    $display("[DRV_MAP6_07_01] The module shall set o_segout6[2] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[2] == 0) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_02
    $display("[DRV_MAP6_07_02] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_03
    $display("[DRV_MAP6_07_03] The module shall set o_segout6[2] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[2] == 0) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_04
    $display("[DRV_MAP6_07_04] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_05
    $display("[DRV_MAP6_07_05] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_06
    $display("[DRV_MAP6_07_06] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_07
    $display("[DRV_MAP6_07_07] The module shall set o_segout6[2] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[2] == 0) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_08
    $display("[DRV_MAP6_07_08] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_09
    $display("[DRV_MAP6_07_09] The module shall set o_segout6[2] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[2] == 0) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_10
    $display("[DRV_MAP6_07_10] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_11
    $display("[DRV_MAP6_07_11] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_12
    $display("[DRV_MAP6_07_12] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_13
    $display("[DRV_MAP6_07_13] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_14
    $display("[DRV_MAP6_07_14] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_15
    $display("[DRV_MAP6_07_15] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_07_16
    $display("[DRV_MAP6_07_16] The module shall NOT set o_segout6[2] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[2] == 1) 
        $display("PASS: o_segout6[2] = %b", o_segout6[2]);
    else
        $error("FAIL: o_segout6[2] = %b", o_segout6[2]);

    //DRV_MAP6_08_01
    $display("[DRV_MAP6_08_01] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_02
    $display("[DRV_MAP6_08_02] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_03
    $display("[DRV_MAP6_08_03] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_04
    $display("[DRV_MAP6_08_04] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_05
    $display("[DRV_MAP6_08_05] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_06
    $display("[DRV_MAP6_08_06] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_07
    $display("[DRV_MAP6_08_07] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_08
    $display("[DRV_MAP6_08_08] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_09
    $display("[DRV_MAP6_08_09] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_10
    $display("[DRV_MAP6_08_10] The module shall set o_segout6[1] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[1] == 0) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_11
    $display("[DRV_MAP6_08_11] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_12
    $display("[DRV_MAP6_08_12] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_13
    $display("[DRV_MAP6_08_13] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_14
    $display("[DRV_MAP6_08_14] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_15
    $display("[DRV_MAP6_08_15] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_08_16
    $display("[DRV_MAP6_08_16] The module shall NOT set o_segout6[1] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[1] == 1) 
        $display("PASS: o_segout6[1] = %b", o_segout6[1]);
    else
        $error("FAIL: o_segout6[1] = %b", o_segout6[1]);

    //DRV_MAP6_09_01
    $display("[DRV_MAP6_09_01] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '0000'.");
    i_count[23:20] = 4'h0;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_02
    $display("[DRV_MAP6_09_02] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '0001'.");
    i_count[23:20] = 4'h1;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_03
    $display("[DRV_MAP6_09_03] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '0010'.");
    i_count[23:20] = 4'h2;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_04
    $display("[DRV_MAP6_09_04] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '0011'.");
    i_count[23:20] = 4'h3;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_05
    $display("[DRV_MAP6_09_05] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '0100'.");
    i_count[23:20] = 4'h4;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_06
    $display("[DRV_MAP6_09_06] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '0101'.");
    i_count[23:20] = 4'h5;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_07
    $display("[DRV_MAP6_09_07] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '0110'.");
    i_count[23:20] = 4'h6;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_08
    $display("[DRV_MAP6_09_08] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '0111'.");
    i_count[23:20] = 4'h7;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_09
    $display("[DRV_MAP6_09_09] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '1000'.");
    i_count[23:20] = 4'h8;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_10
    $display("[DRV_MAP6_09_10] The module shall set o_segout6[0] to logic low when i_count[23:20] is set to '1001'.");
    i_count[23:20] = 4'h9;
    #1 assert (o_segout6[0] == 0) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_11
    $display("[DRV_MAP6_09_11] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1010'.");
    i_count[23:20] = 4'hA;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_12
    $display("[DRV_MAP6_09_12] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1011'.");
    i_count[23:20] = 4'hB;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_13
    $display("[DRV_MAP6_09_13] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1100'.");
    i_count[23:20] = 4'hC;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_14
    $display("[DRV_MAP6_09_14] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1101'.");
    i_count[23:20] = 4'hD;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_15
    $display("[DRV_MAP6_09_15] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1110'.");
    i_count[23:20] = 4'hE;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    //DRV_MAP6_09_16
    $display("[DRV_MAP6_09_16] The module shall NOT set o_segout6[0] to logic low when i_count[23:20] is set to '1111'.");
    i_count[23:20] = 4'hF;
    #1 assert (o_segout6[0] == 1) 
        $display("PASS: o_segout6[0] = %b", o_segout6[0]);
    else
        $error("FAIL: o_segout6[0] = %b", o_segout6[0]);

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #1 $finish;
  end
  
endmodule
