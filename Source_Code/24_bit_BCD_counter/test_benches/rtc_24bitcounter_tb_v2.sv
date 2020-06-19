`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2020 03:44:05 PM
// Design Name: 
// Module Name: practice2_higher_level_module
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


module rtc_24bitcounter_tb_v2();
reg i_rtcclk, i_reset_n, i_latchcount, i_countinit,i_countenb;
wire [23:0] o_count;
integer ticks;

rtc_24bitcounter dut(.i_reset_n(i_reset_n), .i_rtcclk(i_rtcclk), .i_latchcount(i_latchcount), .i_countinit(i_countinit), .i_countenb(i_countenb), 
.o_count(o_count));

initial begin
i_rtcclk = 0;
i_latchcount = 1;
ticks = 0;
forever #5 i_rtcclk=~i_rtcclk;
end

initial begin 
//----------------------------------------START_BCD_RESET_01---------------------------------
//Req tags: BCD_INIT_01
i_reset_n = 0;
#5;
//----------------------------------------END_BCD_RESET_01-----------------------------------
i_latchcount=0;
#20;
//----------------------------------------START_BCD_RESET_02---------------------------------
//Req tags: BCD_INIT_02
i_latchcount=1;
i_reset_n=1;
//----------------------------------------END_BCD_RESET_02------------------------------------

//----------------------------------------START_BCD_COUNT_01----------------------------------
//Req tags: BCD_RO_01
wait (o_count[3:0]== 4'b1001);
#1;
if (o_count == 24'b000000000000000000001001)
    begin
        $display("SUCCESS ", o_count);
    end
else 
    begin 
        $display("FAILURE ", o_count);
        $finish;
    end
//----------------------------------------END_BCD_COUNT_01------------------------------------
//----------------------------------------START_BCD_COUNT_02----------------------------------
//Req tags: BCD_RO_02
wait (o_count[7:4]== 4'b1001);
if (o_count == 24'b000000000000000010010000)
        begin 
            $display("SUCCESS ", o_count);
        end
else 
        begin 
            $display("FAILURE ", o_count);
            $finish;
        end
//----------------------------------------END_BCD_COUNT_02----------------------------------
//----------------------------------------START_BCD_COUNT_03----------------------------------
//Req tags: BCD_RO_03
wait (o_count[11:8]== 4'b1001);
#1;
if (o_count == 24'b000000000000100100000000)
        begin 
            $display("SUCCESS ", o_count);
        end
else 
        begin 
            $display("FAILURE ", o_count);
            $finish;
        end
//----------------------------------------END_BCD_COUNT_03----------------------------------
//----------------------------------------START_BCD_COUNT_04----------------------------------
//Req tags: BCD_RO_04
wait (o_count[15:12]== 4'b0101);
if (o_count == 24'b000000000101000000000000)
    begin 
        $display("SUCCESS ", o_count);
       
    end        
else 
    begin 
        $display("FAILURE ", o_count);
        $finish;
    end
    
wait (o_count[19:16]== 4'b1001);
if (o_count == 24'b000010010000000000000000)
        begin 
            $display("SUCCESS ", o_count);
        end
else   
        begin 
            $display("FAILURE ", o_count);
            $finish;
        end 
//----------------------------------------END_BCD_COUNT_04----------------------------------
//----------------------------------------START_BCD_COUNT_05----------------------------------
//Req tags: BCD_RO_05
wait (o_count[23:20]== 4'b0101);

if (o_count == 24'b010100000000000000000000)
        begin 
            $display("SUCCESS ", o_count);
        end
else 
        begin 
            $display("FAILURE ", o_count);
            $finish;
        end
//----------------------------------------END_BCD_COUNT_05----------------------------------
//----------------------------------------START_BCD_COUNT_06----------------------------------
//Req tags: BCD_RO_06
wait (o_count == 24'b010110010101100110011001);
@ (posedge i_rtcclk);
#3;
if (o_count == 24'b000000000000000000000000)
    begin 
        $display("SUCCESS ", o_count);
    end 
else
    begin 
        $display("FAILURE ", o_count);
        $finish;
    end 
$display("END ", o_count);

end
//----------------------------------------END_BCD_COUNT_06----------------------------------
//----------------------------------START_BCD_INCR_01,START_BCD_INCR_02-----------------------
//Req tags: BCD_INC_01,BCD_INC_02,BCD_INC_03
always @ (posedge i_rtcclk) 
    begin 
        $display("o_count check  ", o_count);
    end 
//----------------------------------END_BCD_INCR_01,END_BCD_INCR_02----------------------------
endmodule
