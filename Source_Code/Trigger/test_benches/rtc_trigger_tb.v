//`include "rtc_trigger.v"

module trigger_tb();
//------------------Port signals------------------
reg i_sclk;
reg i_reset_n;
reg i_trigger;

wire o_count_init;
wire o_count_enb;
wire o_latch_count;
//------------------------------------------------

rtc_trigger TDC(
    .i_sclk     (i_sclk),
    .i_reset_n  (i_reset_n),
    .i_trigger  (i_trigger),
    
    .o_count_init   (o_count_init),
    .o_count_enb    (o_count_enb),
    .o_latch_count  (o_latch_count)
);

    initial begin
        i_sclk = 0;
        i_reset_n = 0;
        i_trigger = 0;
    end
    
    always 
        #1 i_sclk =  ~i_sclk;
        
//    initial begin
//        $dumpfile (trigger_tb.vcd);
//        $dumpvars;
//    end
    
//    initial begin
//        $display("Time\ti_sclk\ti_reset_n\ti_trigger\to_count_init\to_count_enb\to_latch_count");
//        $moniter("%d,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b", $time, i_sclk, i_reset_n, i_trigger,
//                 o_count_init, o_count_enb, o_latch_count);
//    end
    
    initial
    #100 $finish;
    
    initial begin
        i_reset_n = 0;
        i_reset_n = #5  1;

        i_trigger = #1  1;
        i_trigger = #3  0; 
        i_trigger = #5  1;
        i_trigger = #16 0;
        i_trigger = #1  1;
        i_trigger = #9  0;
        i_trigger = #5  1;
        i_trigger = #18 0;
        i_trigger = #13 1;
        i_trigger = #15 0;
        
        i_reset_n = #1  0;
        i_reset_n = #3  1;
    end
endmodule
