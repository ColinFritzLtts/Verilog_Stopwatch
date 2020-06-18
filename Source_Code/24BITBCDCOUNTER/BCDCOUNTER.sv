`timescale 1ns / 1ps

/*
input i_rtcclk produces a transition every 5milliseconds.  
input i_countenb 
*/

module BCDcounter(
    i_rtcclk, 
    i_countenb, 
    i_countinit,
    i_latchcount, 
    i_reset_n,
    o_count

    );
 
 input i_rtcclk;
 input i_countenb;
 input i_countinit;
 input i_latchcount;
 input i_reset_n;
 output [23:0] o_count;
 
 wire i_rtcclk;
 wire i_countenb;
 wire i_countinit;
 wire i_latchcount;
 wire i_reset_n;
 wire [23:0] o_count;
 wire rst;
 
 reg [3:0] Tens_Of_Minutes           = 4'b0000;
 reg [3:0] Minutes                   = 4'b0000;
 reg [3:0] Tens_of_Seconds           = 4'b0000;
 reg [3:0] Seconds                   = 4'b0000;
 reg [3:0] Hundreds_of_Milliseconds  = 4'b0000;
 reg [3:0] Tens_Of_Milliseconds      = 4'b0000;
 
 always @ (posedge i_rtcclk or posedge rst ) 
 
	begin : BCD_counter
 
		if (rst == 1)
			begin 
				Tens_Of_Minutes<="0000";
				Minutes<="0000";
				Tens_of_Seconds<="0000";
				Seconds<="0000";
				Hundreds_of_Milliseconds<="0000";
				Tens_Of_Milliseconds<="0000";
			end
			
		else if (rst == 0 & i_latchcount == 1)
			begin 
				if (Tens_Of_Milliseconds == 4'b1001)
					begin 
						Tens_Of_Milliseconds<=4'b0000;
						
						if (Hundreds_of_Milliseconds == 4'b1001)
							begin 
								Hundreds_of_Milliseconds <= 4'b0000; 
						
								if (Seconds == 4'b1001)
									begin 
										Seconds <= 4'b0000;
								
										if (Tens_of_Seconds == 4'b0101)
											begin 
												Tens_of_Seconds<=4'b0000;
									
												if (Minutes == 4'b1001) 
													begin 
														Minutes<=4'b0000;
										
														if (Tens_Of_Minutes == 4'b0101) 
															begin 
																Tens_Of_Minutes<=4'b0000;
															end 
														
														else 
															begin 
																Tens_Of_Minutes<=Tens_Of_Minutes+4'b0001;
															end 
													end 
												else 
													begin 
														Minutes<=Minutes + 4'b0001;
													end 
											end 
										else 
											begin 
												Tens_of_Seconds<=4'b0001;
											end 
									end 
								else 
									begin 
										Seconds<=4'b0001;
									end 
							end
						else 
							begin 
								Hundreds_of_Milliseconds<=Hundreds_of_Milliseconds+4'b0001;
							end 
					end 
				else  
					begin 
						Tens_Of_Milliseconds<=Tens_Of_Milliseconds+4'b0001;
					end 
			end 
			
	end 
								
assign o_count = {Tens_Of_Minutes,Minutes,Tens_of_Seconds,Seconds, Hundreds_of_Milliseconds, Tens_Of_Milliseconds};
assign rst = ~i_reset_n;
endmodule



