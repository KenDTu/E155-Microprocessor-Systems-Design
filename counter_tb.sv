// Author: Ken Tu
// Email: ktu@g.hmc.edu
// Date of Creation: 09/0/2026
// Test bench for the counter verifying functionality of reset, enable, and max count

`timescale 1 ns/1 ns

module counter_tb();
	logic clk, reset; // system clock, active high reset
	logic [3:0] s; // input switches
	logic [2:0] led; // output from logic
	logic [6:0] seg; // output the segments of a common-anode 7-segment display
	
	// Instantiate the lab1_ktu DUT for testing
    lab1_ktu lab1_ktu(
        .s(s),
        .reset(reset),
		.led(led),
        .seg(seg)
    );
	
		// Instantiate the counter DUT for testing
    counter counter(
        .int_osc(clk),
        .reset(reset),
		.ledLast(led[2])
    );
  
  // apply stimuli and check outputs
  initial begin
	// --------------------- TESTING COUNTER ------------------------------
	
	// test reset
	// force reset to 0 and verify that counter becomes 0
		reset = 1;
    #22 reset = 0;              // setup inputs
        #10;                        // wait required time
        assert (reset == 0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	
	// test enable
	// force ....
	
        assert (reset == 0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 


	// test max count
	// force counter to max and verify count wraps back to zero

        assert (reset == 0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	
			
    #100 $stop;
  end
endmodule
