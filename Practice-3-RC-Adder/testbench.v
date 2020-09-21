// Copyright © 2020 Joel luo
// Examples for HDL with Verilog
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to deal
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

`timescale 1ns/10ps
`include "RC_Adder.v"

`define PERIOD 10
`define MAX_NUM_CLK 1000

`define VCD

module testBench();

    reg     clk;
    reg     [`RC_ADDR_BANDWITH-1:0] Input_A;
    reg     [`RC_ADDR_BANDWITH-1:0] Input_B;
    wire    [`RC_ADDR_BANDWITH-1:0] Output_Sum; 
    wire                            Output_Cout; 

    RC_Adder RC_adder(
        .A(Input_A), 
        .B(Input_B), 
        .Sum(Output_Sum), 
        .Cout(Output_Cout)
    );

    // clk generator
    always #(`PERIOD/2) clk = ~clk;

    integer nPassCount;
    integer i;
    
    initial begin 
        // print  0ns:
        clk=0;
        nPassCount = 0;
        i = 0;

        // **** Case 1 ****
        Input_A=`RC_ADDR_BANDWITH'd0;
        Input_B=`RC_ADDR_BANDWITH'd0;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd0 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 1 ****

        // **** Case 2 ****
        Input_A=`RC_ADDR_BANDWITH'd1;
        Input_B=`RC_ADDR_BANDWITH'd0;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd1 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 2 ****

        // **** Case 3 ****
        Input_A=`RC_ADDR_BANDWITH'd2;
        Input_B=`RC_ADDR_BANDWITH'd2;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd4 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 3 ****

        // **** Case 4 ****
        Input_A=`RC_ADDR_BANDWITH'd14;
        Input_B=`RC_ADDR_BANDWITH'd1;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd15 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 4 ****

        // **** Case 5 ****
        Input_A=`RC_ADDR_BANDWITH'd15;
        Input_B=`RC_ADDR_BANDWITH'd1;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd0 && Output_Cout == 1'b1)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 5 ****

        // **** Case 6 ****
        Input_A=`RC_ADDR_BANDWITH'd15;
        Input_B=`RC_ADDR_BANDWITH'd15;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd14 && Output_Cout == 1'b1)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 6 ****

        // **** Case 7 ****
        Input_A=`RC_ADDR_BANDWITH'd6;
        Input_B=`RC_ADDR_BANDWITH'd6;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd12 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
        // **** Case 7 ****

        // **** Case 8 ****
        Input_A=`RC_ADDR_BANDWITH'd7;
        Input_B=`RC_ADDR_BANDWITH'd8;
                
        #(`PERIOD)
        i = i+1;
        if( Output_Sum == `RC_ADDR_BANDWITH'd15 && Output_Cout == 1'b0)
        begin
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Pass.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            nPassCount = nPassCount + 1;
        end
        else
            $display("%4dns: A=%d, B=%d, Sum=%d, Cout=%d. Fail.", $stime, Input_A, Input_B, Output_Sum, Output_Cout); 
            
        // **** Case 8 ****

        #(`PERIOD)

        if(nPassCount == i ) begin
            $display("Pass the TestBench!");
        end
        else begin
            $display("Fail the TestBench!");
        end

        $finish; 
    end
    
    initial begin
`ifdef VCD 
        $dumpfile("wave.vcd"); 
        $dumpvars(); 
`endif 
    end
   
endmodule

