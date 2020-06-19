`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd. 
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 11:56:23 AM
// Design Name: 7-Segment FPGA Adapter Clock divider
// Module Name: rtc_adapter
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2
// Description: Derives a 1ms clock for use in FPGA adapter.
// 
// Dependencies: rtc_adapter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_adapter_clk(
    input  wire i_sclk = 0,
    input  wire i_reset_n = 0,
    output reg  o_intclk
    );
    
    parameter COUNT_WIDTH = 16;
    
    reg [(COUNT_WIDTH-1):0] counter = 0;
    reg intclk = 0;
    always @ (posedge i_sclk)
    begin
        if(i_reset_n == 1'b0) begin
            counter <= 0;
            intclk <= 0;
        end else              begin
            if(counter >= 49999) begin
                counter <= 0;
                intclk <= ~intclk;
            end else             begin
                counter <= counter + 1;
            end
        end
        o_intclk <= intclk;
    end
    
endmodule
