`timescale 1ns / 1ps

module rtc_timer #(parameter TEN_MS_TICK = 1_000_000, parameter count_width = 20)
(
    input wire i_sclk, 
    input wire i_reset_n, 
    input wire i_timerenb, 
    output wire o_base_tick
    );
    // 1000000 ticks for 0.01 seconds
    
    // INTERNAL COUNTER
    reg [count_width-1:0] count = 0;
    reg o_tick = 0;
    
    always @(posedge i_sclk) begin
    
        if (!i_reset_n) begin
            count <= 20'h00000;
            o_tick = 0;
        end
        else begin
            if (i_timerenb) begin
                if (count == TEN_MS_TICK) begin
                    count <= 0;
                    o_tick <= !o_tick;
                end
                else count <= count + 1;
            end
        end
    end
    
    assign o_base_tick = o_tick;
    
endmodule