//Author: Eric Wagner
//Jira ticket: SWATCH2-30
//Filename: rtc_trigger
//
//This module debounces the input trigger and also drives control signals for the
//10-ms timer and 24-bit counter.
//
module rtc_trigger(
//--------------------------------Port Declrations--------------------------------
    input wire i_sclk,          //System clock
    input wire i_reset_n,       //Active low asyn reset
    input wire i_trigger,       //Push button input
    output reg o_count_init,    //Output control signal
    output reg o_count_enb,     //Output control signal
    output reg o_latch_count    //Output control signal
    );
//--------------------------------------------------------------------------------
    parameter BOUND = 5;           //Used to set the Debounce time
    
    parameter [1:0] IDLE     = 2'b00;    //
    parameter [1:0] COUNTING = 2'b01;    //States as parameters
    parameter [1:0] PAUSE    = 2'b10;    //
     
//--------------------------------Internal Signals--------------------------------
    reg [1:0] curState_t;   //Current State (IDLE, COUNTING, or PAUSE)
    reg [1:0] nxtState_t;   //Next State (IDLE, COUNTING, or PAUSE)
    
    reg triggerDB;          //Signals the trigger has been debounced
    reg prvTrigger;         //Stores the last value of the trigger
    integer countDB;        //Counter to debounce the trigger
//--------------------------------------------------------------------------------

//--------------------------------Next State Logic--------------------------------
    always @ (posedge triggerDB)
    begin
        if (curState_t == IDLE) begin
            nxtState_t = COUNTING;
        end else if (curState_t == COUNTING) begin
            nxtState_t = PAUSE;
        end else if (curState_t == PAUSE) begin
            nxtState_t = COUNTING;
        end else begin
            nxtState_t = IDLE;
        end
    end
//--------------------------------------------------------------------------------

//---------------------------------State Machine----------------------------------
    always @ (posedge i_sclk, negedge i_reset_n)
    begin
        if (i_reset_n == 0) begin
            curState_t = IDLE;
            nxtState_t = IDLE;
        end
        curState_t = nxtState_t;
        case(curState_t)
            IDLE : begin
                o_count_init = 1;
                o_count_enb = 0;
                o_latch_count = 0;
            end
            COUNTING : begin
                o_count_init = 0;
                o_count_enb = 1;
                o_latch_count = 1;
            end
            PAUSE : begin
                o_count_init = 0;
                o_count_enb = 1;
                o_latch_count = 0;
            end
            default : begin
                curState_t = IDLE;
            end
        endcase
    end
//--------------------------------------------------------------------------------

//---------------------------------Debounce Logic---------------------------------
always @ (posedge i_sclk, negedge i_reset_n)
begin
    if(i_reset_n == 0) begin
        countDB = 0;
        triggerDB = 0;
        prvTrigger = 1'b0;
    end else begin
        if (countDB == 0) begin
            prvTrigger = i_trigger;
            countDB = countDB + 1;
        end else if (countDB < BOUND) begin
            if (prvTrigger == i_trigger) begin
                countDB = countDB + 1;
            end else begin
                countDB = 0;
            end
        end else if (countDB == BOUND) begin
            if (prvTrigger == i_trigger) begin
                triggerDB = i_trigger;
            end else begin
                countDB = 0;
                triggerDB = 0;
            end
        end else begin
            countDB = 0;
        end
    end
end
//--------------------------------------------------------------------------------   
endmodule
