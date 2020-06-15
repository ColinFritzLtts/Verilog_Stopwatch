`timescale 1ns / 1ps

module rtc_timer #(parameter TEN_MS_TICK = 1_000_000, parameter cnt_width = 20)
(
    input wire i_sclk, 
    input wire i_reset_n, 
    input wire i_timerenb, 
    output wire o_base_tick
    );
    // 1000000 ticks for 0.01 seconds
    // divide by 2 to get period of 0.01s for o_basetick
    
    // INTERNAL COUNTER
    reg [cnt_width-1:0] clk_cnt = 0;
    reg o_tick = 0;
    
    always @(posedge i_sclk) begin
    
        if (!i_reset_n) begin
            clk_cnt <= 20'h00000;
            o_tick = 0;
        end
        else begin
            if (i_timerenb) begin
                if (clk_cnt == TEN_MS_TICK) begin
                    clk_cnt <= 0;
                    o_tick <= !o_tick;
                end
                else clk_cnt <= clk_cnt + 1;
            end
        end
    end
    
    assign o_base_tick = o_tick;
    
endmodule