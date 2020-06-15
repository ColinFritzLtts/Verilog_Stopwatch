`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd.
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 01:01:24 PM
// Design Name: 7-Segment FPGA Adapter Testbench
// Module Name: FPGA_testcases
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2
// Description: A FPGA adapter testbench checking the compliance to testcases.
// 
// Dependencies: rtc_adapter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FPGA_testcases;
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
    //-------------Internal Constants--------------------------
     parameter SIZE = 6;
     parameter FRM1 = 6'b000001, 
               FRM2 = 6'b000010,
               FRM3 = 6'b000100,
               FRM4 = 6'b001000, 
               FRM5 = 6'b010000,
               FRM6 = 6'b100000;
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
  
  
  //debug variables
    
  //initial  begin
    //$display("\t\ttime,\tclk,\treset,\ti_sclk,\ti_reset_n,\ti_segout1,\ti_segout2,\ti_segout3,\ti_segout4,\ti_segout5,\ti_segout6,\to_segments,\to_digits"); 
    //$monitor("%d,\t%b,\t%b,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d,\t%d",$time, i_sclk, i_reset_n, 
    //         i_segout1, i_segout2, i_segout3, i_segout4, i_segout5, i_segout6, 
    //         o_segments, o_digits); 
  //end 
    
 
    
  //Rest of testbench code after this line 
  initial begin
  
    //FPGA_INIT_01_01
    $display("[FPGA_INIT_01_01] The module shall preset o_segments to '11111111' upon system startup.");
    #1 assert (o_segments == 8'hFF) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    
    //FPGA_INIT_02_01
    $display("[FPGA_INIT_02_01] The module shall preset o_digits to '11111111' upon system startup.");
    #1 assert (o_segments == 8'hFF) 
        $display("PASS: o_digits = %b", o_segments);
    else
        $error("FAIL: o_digits = %b", o_segments);
    
    //FPGA_INIT_03_01
    #1 $display("[FPGA_INIT_03_01] The module shall preset intstate to FRM6 upon system startup.");
    assert (DUT1.intstate == FRM6) 
        $display("PASS: intstate = %b", DUT1.intstate);
    else
        $error("FAIL: intstate = %b", DUT1.intstate);
    
    //FPGA_INIT_04_01
    #1 $display("[FPGA_INIT_04_01] The module shall preset intstatenext to FRM1 upon system startup.");
    assert (DUT1.intstatenext == FRM1) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //FPGA_DIV_01_01
    $display("[FPGA_DIV_01_01] The module shall generate an internal clock signal intclk with period of 1ms based on clock division of i_sclk.");
    
    #100000 $warning("Please check the period of the intclk to be 1ms");
    
    //FPGA_DIV_02_01
    i_reset_n = 0;
    i_reset_n = #10 1;
    $display("[FPGA_DIV_02_01] The module shall set intclk to a falling edge of the clock when i_reset_n is set to logic low.");
    
    #100000 $warning("Please check the phase of intclk.");
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //FPGA_FSM_01_01
    $display("[FPGA_FSM_01_01] The module shall set internal state intstate to FRM1 when i_reset_n is set to logic low.");
    i_reset_n = 0;
    #10 assert (DUT1.intstate == FRM1) 
        $display("PASS: intstate = %b", DUT1.intstate);
    else
        $error("FAIL: intstate = %b", DUT1.intstate);
    i_reset_n = #10 1;
    
    //FPGA_FSM_02_01
    i_reset_n = 0;
    i_reset_n = #10 1;
    $display("[FPGA_FSM_02_01] The module shall set intstate equal to intstatenext on rising edge of intclk. ");
    #10 assert (DUT1.intstate == FRM2) 
        $display("PASS: intstate = %b", DUT1.intstate);
    else
        $error("FAIL: intstate = %b", DUT1.intstate);
    
    //FPGA_FSM_03_01
    $display("[FPGA_FSM_03_01] The module shall set intstatenext equal to FRM1 when intstate is equal to FRM6.");
    @(DUT1.intstate == FRM6) assert (DUT1.intstatenext == FRM1) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    //FPGA_FSM_04_01
    $display("[FPGA_FSM_04_01] The module shall set intstatenext equal to FRM2 when intstate is equal to FRM1.");
    @(DUT1.intstate == FRM1) assert (DUT1.intstatenext == FRM2) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    //FPGA_FSM_05_01
    $display("[FPGA_FSM_05_01] The module shall set intstatenext equal to FRM3 when intstate is equal to FRM2.");
    @(DUT1.intstate == FRM2) assert (DUT1.intstatenext == FRM3) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    //FPGA_FSM_06_01
    $display("[FPGA_FSM_06_01] The module shall set intstatenext equal to FRM4 when intstate is equal to FRM3.");
    @(DUT1.intstate == FRM3) assert (DUT1.intstatenext == FRM4) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    //FPGA_FSM_07_01
    $display("[FPGA_FSM_07_01] The module shall set intstatenext equal to FRM5 when intstate is equal to FRM4.");
    @(DUT1.intstate == FRM4) assert (DUT1.intstatenext == FRM5) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    //FPGA_FSM_08_01
    $display("[FPGA_FSM_08_01] The module shall set intstatenext equal to FRM6 when intstate is equal to FRM5.");
    @(DUT1.intstate == FRM5) assert (DUT1.intstatenext == FRM6) 
        $display("PASS: intstatenext = %b", DUT1.intstatenext);
    else
        $error("FAIL: intstatenext = %b", DUT1.intstatenext);
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //FPGA_OUT_01_01
    $display("[FPGA_FSM_01_01] The module shall set o_digits equal to '00000000' when i_reset_n is set to logic low.");
    i_reset_n = 0;
    #10 assert (o_digits == 8'h00) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    i_reset_n = #10 1;
    
    //FPGA_OUT_02_01
    $display("[FPGA_FSM_01_01] The module shall set o_segments equal to '00000000' when i_reset_n is set to logic low.");
    
    i_reset_n = 0;
    #10 assert (o_segments == 8'h00) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    i_reset_n = #10 1;
    
    //FPGA_OUT_03_01
    i_segout1 = 8'h11;
    $display("[FPGA_OUT_03_01] The module shall set o_digits equal to i_segout1 when intstate is equal to FRM1.");
    @(DUT1.intstate == FRM1) assert (o_digits == i_segout1) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_04_01
    i_segout2 = 8'h22;
    $display("[FPGA_OUT_04_01] The module shall set o_digits equal to i_segout2 when intstate is equal to FRM2.");
    @(DUT1.intstate == FRM2) assert (o_digits == i_segout2) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_05_01
    i_segout3 = 8'h33;
    $display("[FPGA_OUT_05_01] The module shall set o_digits equal to i_segout3 when intstate is equal to FRM3.");
    @(DUT1.intstate == FRM3) assert (o_digits == i_segout3) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_06_01
    i_segout4 = 8'h44;
    $display("[FPGA_OUT_06_01] The module shall set o_digits equal to i_segout4 when intstate is equal to FRM4.");
    @(DUT1.intstate == FRM4) assert (o_digits == i_segout4) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_07_01
    i_segout5 = 8'h55;
    $display("[FPGA_OUT_07_01] The module shall set o_digits equal to i_segout5 when intstate is equal to FRM5.");
    @(DUT1.intstate == FRM5) assert (o_digits == i_segout5) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_08_01
    i_segout4 = 8'h66;
    $display("[FPGA_OUT_08_01] The module shall set o_digits equal to i_segout6 when intstate is equal to FRM6.");
    @(DUT1.intstate == FRM6) assert (o_digits == i_segout6) 
        $display("PASS: o_digits = %b", o_digits);
    else
        $error("FAIL: o_digits = %b", o_digits);
    
    //FPGA_OUT_09_01
    $display("[FPGA_OUT_09_01] The module shall set o_segments equal to '11111110' when intstate is equal to FRM1.");
    @(DUT1.intstate == FRM1) assert (o_segments == 8'b11111110) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    
    //FPGA_OUT_10_01
    $display("[FPGA_OUT_10_01] The module shall set o_segments equal to '11111101' when intstate is equal to FRM2.");
    @(DUT1.intstate == FRM2) assert (o_segments == 8'b11111101) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    
    //FPGA_OUT_11_01
    $display("[FPGA_OUT_11_01] The module shall set o_segments equal to '11111011' when intstate is equal to FRM3.");
    @(DUT1.intstate == FRM3) assert (o_segments == 8'b11111011) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    
    //FPGA_OUT_12_01
    $display("[FPGA_OUT_12_01] The module shall set o_segments equal to '11110111' when intstate is equal to FRM4.");
    @(DUT1.intstate == FRM4) assert (o_segments == 8'b11110111) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
        
    //FPGA_OUT_13_01
    $display("[FPGA_OUT_13_01] The module shall set o_segments equal to '11101111' when intstate is equal to FRM5.");
    @(DUT1.intstate == FRM5) assert (o_segments == 8'b11101111) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
        
    //FPGA_OUT_14_01
    $display("[FPGA_OUT_14_01] The module shall set o_segments equal to '11011111' when intstate is equal to FRM6.");
    @(DUT1.intstate == FRM6) assert (o_segments == 8'b11011111) 
        $display("PASS: o_segments = %b", o_segments);
    else
        $error("FAIL: o_segments = %b", o_segments);
    
    //Done
    #1 $finish;
  end
  
endmodule
