// Author: Ken Tu
// Email: ktu@g.hmc.edu
// Date of Creation: 09/0/2026
// Test bench for top module tb 
// “are the connections to submodules correct?”, 
// “does the HSOSC work?” 
// and “does the assign 1 liner work?”.

`timescale 1 ns/1 ps //what does this scale mean?

module lab1_ktu_tb();
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
	
	// generates the clock to oscillate
	always 
		begin
			clk = 1; #5; clk = 0; #5;
		end
		
	// ============ TESTING CONNECTIONS TO SUBMODULES ==================== 
	

	
	// ============ TESTING FUNCTIONALITY OF HSOSC =======================
	
    // ============ TESTING FUNCTIONALITY OF SEVEN SEGMENT =======================
			
	//  ========== TESTING TOP LEVEL LOGIC ==========
	// namely,
	// assign led[0] = s[1] ^ s[0];
	// assign led[1] = s[3] && s[2];
	
	// test xor 1
        s[1] = 1'b0; s[0] = 1'b0;    			 // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test xor 2
        s[1] = 1'b0; s[0] = 1'b1;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test xor 3
        s[1] = 1'b1; s[0] = 1'b0;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

	// test xor 4
        s[1] = 1'b1; s[0] = 1'b1;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	

	// test and 1
        s[3] = 1'b0; s[2] = 1'b0;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test and 2
        s[3] = 1'b0; s[2] = 1'b1;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test and 3
        s[3] = 1'b1; s[2] = 1'b0;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test and 4
        s[3] = 1'b1; s[2] = 1'b1;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time);
			
    #100 $stop;
  end
endmodule
