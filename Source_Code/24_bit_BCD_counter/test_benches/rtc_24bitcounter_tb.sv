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


module rtc_24bitcounter_tb();
reg i_rtcclk, i_reset_n, i_latchcount, i_countinit,i_countenb;
wire [23:0] o_count;

rtc_24bitcounter dut(.i_reset_n(i_reset_n), .i_rtcclk(i_rtcclk), .i_latchcount(i_latchcount), .i_countinit(i_countinit), .i_countenb(i_countenb), 
.o_count(o_count));

initial begin
i_rtcclk = 0;
i_latchcount = 1;
forever #100 i_rtcclk=~i_rtcclk;
end

initial begin 
i_reset_n = 0;
#20;
i_reset_n = 1;
end

always @ (posedge i_rtcclk)
    begin 
        $display ("o_count ", o_count);
    end
endmodule
