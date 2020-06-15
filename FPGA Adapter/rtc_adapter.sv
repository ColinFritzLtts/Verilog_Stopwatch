`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: L&T Technology Services Ltd. 
// Engineer: Andrew Newman
// 
// Create Date: 06/12/2020 11:56:23 AM
// Design Name: 7-Segment FPGA Adapter
// Module Name: rtc_adapter
// Project Name: Verilog Stopwatch
// Target Devices: Nexys A7-100
// Tool Versions: Vivado 2019.2
// Description: A FPGA adapter for the common cathode 7-segment array.
// 
// Dependencies: rtc_displaydriver, rtc_stopwatch
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rtc_adapter(
    input  wire [7:0] i_segout1,
    input  wire [7:0] i_segout2,
    input  wire [7:0] i_segout3,
    input  wire [7:0] i_segout4,
    input  wire [7:0] i_segout5,
    input  wire [7:0] i_segout6,
    input  wire       i_reset_n,
    input  wire       i_sclk,
    output reg  [7:0] o_segments = 8'hFF,
    output reg  [7:0] o_digits   = 8'hFF
);
    //-------------Internal Constants--------------------------
     parameter SIZE = 6;
     parameter FRM1 = 6'b000001, 
               FRM2 = 6'b000010,
               FRM3 = 6'b000100,
               FRM4 = 6'b001000, 
               FRM5 = 6'b010000,
               FRM6 = 6'b100000;
     //-------------Internal Variables---------------------------
     reg  [SIZE-1:0] intstatenext = FRM1;// Seq part of the FSM
     reg  [SIZE-1:0] intstate     = FRM6;// combo part of FSM
    
    //--------------FSM process----------------------------------
    always @ (posedge i_sclk)
    begin : FSM
        if(i_reset_n == 1'b0) begin
            intstate <= FRM1;
            intstatenext <= FRM2;
        end else              begin
            intstate <= #1 intstatenext;
            case(intstatenext)
                FRM1:    intstatenext <= #1 FRM2;
                FRM2:    intstatenext <= #1 FRM3;
                FRM3:    intstatenext <= #1 FRM4;
                FRM4:    intstatenext <= #1 FRM5;
                FRM5:    intstatenext <= #1 FRM6;
                FRM6:    intstatenext <= #1 FRM1;
                default: intstatenext <= #1 FRM1;
            endcase
        end
    end
     
    always @ (posedge i_sclk)
    if(i_reset_n == 1'b0) begin
        o_segments <= 8'b00000000;
        o_digits   <= 8'b00000000;
    end 
    else begin
        case(intstate)
            FRM1:    begin
                         o_digits   <= i_segout1;
                         o_segments <= 8'b11111110;
                     end
            FRM2:    begin
                         o_digits   <= i_segout2;
                         o_segments <= 8'b11111101;
                     end
            FRM3:    begin
                         o_digits   <= i_segout3;
                         o_segments <= 8'b11111011;
                     end
            FRM4:    begin
                         o_digits   <= i_segout4;
                         o_segments <= 8'b11110111;
                     end
            FRM5:    begin
                         o_digits   <= i_segout5;
                         o_segments <= 8'b11101111;
                     end
            FRM6:    begin
                         o_digits   <= i_segout6;
                         o_segments <= 8'b11011111;
                     end
            default: begin
                         o_digits   <= 8'b11111111;
                         o_segments <= 8'b11111111;
                     end
        endcase
    end
endmodule
