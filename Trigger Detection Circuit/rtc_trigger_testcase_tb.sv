module rtc_trigger_testcase_tb();
//------------------Port signals------------------
reg i_sclk;
reg i_reset_n;
reg i_trigger;

wire o_count_init;
wire o_count_enb;
wire o_latch_count;
//------------------------------------------------

//--------------Internal Parameters---------------
    parameter BOUND = 1000000;           //Used to set the Debounce time
    
    parameter [1:0] IDLE     = 2'b00;    //
    parameter [1:0] COUNTING = 2'b01;    //States as parameters
    parameter [1:0] PAUSE    = 2'b10;    //

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
        i_sclk    = 0;
        i_reset_n = 0;
        i_trigger = 0;
    end
    
    always 
        #1 i_sclk =  ~i_sclk;
    
    initial begin
    //#5000000 $finish;
//----------------------------------------------------------------TDC_INIT----------------------------------------------------------------
        //TDC_INIT_01_1
        $display("[TDC_INIT_01_1] The module shall preset o_count_init to logic high upon system startup.");
        #1 if (o_count_init == 1) begin
            $display("\tPASS: o_count_init = %b", o_count_init);
        end else begin
            $display("\tFAIL: o_count_init = %b", o_count_init);
        end
        
        //TDC_INIT_02_1
        $display("[TDC_INIT_02_1] The module shall preset o_count_enb and o_latch_count to logic low upon system startup.");
        #1 if (o_count_enb == 0 & o_latch_count == 0) begin 
            $display("\tPASS: o_count_enb = %b; o_latch_count = %b", o_count_enb, o_latch_count);
        end else begin
            $display("\tFAIL: o_count_enb = %b; o_latch_count = %b", o_count_enb, o_latch_count);
        end
        
        //TDC_INIT_03_1
        $display("[TDC_INIT_03_1] The module shall preset curState_t and nxt_state_t to IDLE upon system startup.");
        #1 if (TDC.curState_t == IDLE & TDC.nxtState_t == IDLE) begin 
            $display("\tPASS: curState_t = IDLE; nxtState_t = IDLE");
        end else begin
            $display("\tFAIL: curState_t != IDLE or nxtState_t != IDLE");
        end
        
        //set up
        TDC.curState_t = #1 COUNTING;
        TDC.nxtState_t = COUNTING;        
        //TDC_INIT_04_1        
        i_reset_n = #1 0;
                
        $display("[TDC_INIT_04_1] The module shall set curState_t and nxt_state_t to IDLE when i_reset_n is set to active low.");
        #1 if (TDC.curState_t == IDLE & TDC.nxtState_t == IDLE) begin 
            $display("\tPASS: curState_t = IDLE; nxtState_t = IDLE");
        end else begin
            $display("\tFAIL: curState_t != IDLE or nxtState_t != IDLE");
        end
        
        i_reset_n = #1 1;
        
        //TDC_INIT_05_1        
        i_reset_n = #1 0;
                
        $display("[TDC_INIT_05_1] The module shall set countDB to zero and set triggerDB, and prvTrigger to logic low when i_reset_n is set to logic low.");
        #1 if (TDC.countDB == 0 & TDC.triggerDB == 0 & TDC.prvTrigger == 0) begin 
            $display("\tPASS: countDB = %d; triggerDB = %b; prvTrigger = %b", TDC.countDB, TDC.triggerDB, TDC.prvTrigger);
        end else begin
            $display("\tFAIL: countDB = %d; triggerDB = %b; prvTrigger = %b", TDC.countDB, TDC.triggerDB, TDC.prvTrigger);
        end
        
        i_reset_n = #1 1;
//----------------------------------------------------------------------------------------------------------------------------------------
        

//-----------------------------------------------------------------TDC_DB-----------------------------------------------------------------
        //TDC_DB_01_1
        $display("[TDC_DB_01_1] The module shall increment countDB by one at every rising edge of the clock.");
        
        #2 if (TDC.countDB == 1) begin
            $display("\tPASS: countDB = %d after 1 clock cycle", TDC.countDB);
        end else begin
            $display("\tFAIL: countDB = %d after 1 clock cycle", TDC.countDB);
        end
        
        #100 if (TDC.countDB == 51) begin
            $display("\tPASS: countDB = %d after 51 clock cycle", TDC.countDB);
        end else begin
            $display("\tFAIL: countDB = %d after 51 clock cycle", TDC.countDB);
        end
        
        #1000000 if (TDC.countDB == 500051) begin
            $display("\tPASS: countDB = %d after 500051 clock cycle", TDC.countDB);
        end else begin
            $display("\tFAIL: countDB = %d after 500051 clock cycle", TDC.countDB);
        end
        
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        
        i_trigger      = 1;
        TDC.prvTrigger = 1;
        TDC.countDB    = 999990;
        //TDC_DB_01_2
        $display("[TDC_DB_01_2] The module shall not set countDB to zero when countDB reaches 1,000,000.");
        @(TDC.countDB == 1000000) #10 if (TDC.countDB == 1000000) begin
            $display("\tPASS: countDB = %d", TDC.countDB);
        end else begin
            $display("\tFAIL: countDB = %d", TDC.countDB);
        end
        
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        //TDC_DB_02_1
        $display("[TDC_DB_02_1] The module shall set prvTrigger to i_trigger when countDB equals zero.");
        #1 if (TDC.prvTrigger == i_trigger) begin
            $display("\tPASS: prvTrigger = i_trigger");
        end else begin
            $display("\tFAIL: prvTrigger != i_trigger");
        end
        
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        
        i_trigger = 1;
        //TDC_DB_03_1
        $display("[TDC_DB_03_1] The module shall not set triggerDB to i_trigger when countDB does not equal 1,000,000.");
        @(TDC.countDB == 999999) if (TDC.triggerDB == 0) begin
            $display("\tPASS: triggerDB was unchagned.");
        end else begin
            $display("\tFAIL: triggerDB was changed early");
        end
        
        //TDC_DB_03_2
        $display("[TDC_DB_03_2] The module shall set triggerDB to i_trigger when countDb equals 1,000,000 and i_trigger is equal to prvTrigger.");
        @(TDC.countDB == 1000000) #3 if (TDC.triggerDB == 1) begin
            $display("\tPASS: triggerDB = %b", TDC.triggerDB);
        end else begin
            $display("\tFAIL: triggerDB = %b", TDC.triggerDB);
        end
        
        //setup
        i_trigger = #1 0;
        //TDC_DB_04_1
        $display("[TDC_DB_04_1] The Module shall set countDB to zero when i_trigger is not equal to prvTrigger.");
        #2 if (TDC.countDB == 0) begin
            $display("\tPASS: countDB = %d", TDC.countDB);
        end else begin
            $display("\tFAIL: countDB = %d", TDC.countDB);
        end        
//----------------------------------------------------------------------------------------------------------------------------------------
        

//-----------------------------------------------------------------TDC_FSM----------------------------------------------------------------
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        
        i_trigger =    1;
        //TDC_FSM_01_1
        $display("[TDC_FSM_01_1] The module shall not set nxtState_t to COUNTING when triggerDB is set to logic low and curState_t is IDLE.");
        @(TDC.countDB == 999999) if(TDC.nxtState_t == IDLE) begin
            $display("\tPASS: nxtState_t was unchanged.");
        end else begin
            $display("\tFAIL: nxtState_t changed to early");
        end
        //TDC_FSM_01_3
        $display("[TDC_FSM_01_3] The module shall set nxtState_t to COUNTING when triggerDB is set to logic high and curState_t is IDLE.");
        @(TDC.triggerDB == 1) #1 if (TDC.nxtState_t == COUNTING) begin
            $display("\tPASS: nxtState_t = COUNTING");
        end else begin
            $display("\tFAIL: nxtState_t was not changed");
        end
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        
        TDC.curState_t = PAUSE;
        TDC.nxtState_t = PAUSE;
        
        i_trigger = #1 1;
        //TDC_FSM_01_2
        $display("[TDC_FSM_01_2] The module shall not set nxtState_t to COUNTING when triggerDB is set to logic low and curState_t is PAUSE.");
        @(TDC.countDB == 999999) if(TDC.nxtState_t == PAUSE) begin
            $display("\tPASS: nxtState_t was unchanged.");
        end else begin
            $display("\tFAIL: nxtState_t changed to early");
        end
        
        //TDC_FSM_01_4
        $display("[TDC_FSM_01_4] The module shall set nxtState_t to COUNTING when triggerDB is set to logic high and curState_t is PAUSE.");
        @(TDC.triggerDB == 1) #1 if (TDC.nxtState_t == COUNTING) begin
            $display("\tPASS: nxtState_t = COUNTING");
        end else begin
            $display("\tFAIL: nxtState_t was not changed");
        end
        
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        
        TDC.curState_t = COUNTING;
        TDC.nxtState_t = COUNTING;
        
        i_trigger = #1 1;
        //TDC_FSM_02_1
        $display("[TDC_FSM_02_1] The module shall not set nxtState_t to PAUSE when triggerDB is set to logic low and curState_t is COUNTING.");
        @(TDC.countDB == 999999) #1 if (TDC.nxtState_t == COUNTING) begin
            $display("\tPASS: nxtState_t = COUNTING");
        end else begin
            $display("\tFAIL: nxtState_t was changed early");
        end
        
        //TDC_FSM_02_2
        $display("[TDC_FSM_02_2] The module shall set nxtState_t to PAUSE when triggerDB is set to logic high and curState_t is COUNTING.");
        @(TDC.triggerDB == 1) #1 if (TDC.nxtState_t == PAUSE) begin
            $display("\tPASS: nxtState_t = PAUSE");
        end else begin
            $display("\tFAIL: nxtState_t was changed early");
        end
               
        //setup
        i_reset_n = #1 0;
        i_reset_n = #1 1;
        //TDC_FSM_03_1
        $display("[TDC_FSM_03_1] The module shall set o_count_enb and o_latch count to logic low and shall set o_count_init to logic high when curState_t is IDLE.");
        #1 if (o_count_enb == 0 & o_latch_count == 0 & o_count_init == 1) begin
            $display("\tPASS: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end else begin
            $display("\tFAIL: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end
        
        //setup
        i_trigger = #1 1;
        //TDC_FSM_04_1
        $display("[TDC_FSM_04_1] The module shall set o_count_init and o_latch_count to logic low and shall set o_count_enable and to logic high when curState_t is PAUSE.");
        @(TDC.triggerDB == 1) #3 if (o_count_enb == 1 & o_latch_count == 1 & o_count_init == 0) begin
            $display("\tPASS: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end else begin
            $display("\tFAIL: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end
        
        //setup
        i_trigger = #1 0;
        i_trigger = #1 1;
        //TDC_FSM_05_1
        $display("[TDC_FSM_05_1] The module shall set o_count_init to logic low and shall set o_count_enb and o_latch_count to logic high when curState_t is COUNTING.");
        @(TDC.triggerDB == 1) #3 if (o_count_enb == 1 & o_latch_count == 0 & o_count_init == 0) begin
            $display("\tPASS: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end else begin
            $display("\tFAIL: o_count_enb = %b; o_latch_count = %b; o_count_init = %b",
                o_count_enb, o_latch_count, o_count_init);
        end        
//----------------------------------------------------------------------------------------------------------------------------------------
        $finish;            
    end 
    
    
endmodule
