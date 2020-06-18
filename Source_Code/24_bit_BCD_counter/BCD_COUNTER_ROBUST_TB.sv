timescale 1ns / 1ps
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


module BCDCOUNTER_TESTBENCH();
reg i_rtcclk, i_reset_n, i_latchcount, i_countinit,i_countenb;
wire [23:0] o_count;
integer ticks;

BCDcounter dut(.i_reset_n(i_reset_n), .i_rtcclk(i_rtcclk), .i_latchcount(i_latchcount), .i_countinit(i_countinit), .i_countenb(i_countenb), 
.o_count(o_count));

initial begin
i_rtcclk = 0;
i_latchcount = 1;
ticks = 0;
forever #5 i_rtcclk=~i_rtcclk;
end

initial begin 
i_reset_n = 0;
#5;
i_latchcount=0;
#20;
i_latchcount=1;
i_reset_n=1;
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

always @ (posedge i_rtcclk) 
    begin 
        $display("o_count check  ", o_count);
    end 
endmodule
