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
`include "Full_Adder.v"

`define PERIOD 10
`define MAX_NUM_CLK 1000

`define VCD

module testBench();

    reg     clk;
    reg     Input_A;
    reg     Input_B;
    reg     Input_Cin;
    wire    Output_S; 
    wire    Output_Cout; 

    Full_Adder full_adder(
        .A(Input_A), 
        .B(Input_B), 
        .Cin(Input_Cin),
        .Sum(Output_S), 
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
        Input_A=1'b0;
        Input_B=1'b0;
        Input_Cin=1'b0;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b0 && Output_Cout == 1'b0)
            nPassCount = nPassCount + 1;
        
        // **** Case 1 ****

        // **** Case 2 ****
        Input_A=1'b1;
        Input_B=1'b0;
        Input_Cin=1'b0;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b1 && Output_Cout == 1'b0)
            nPassCount = nPassCount + 1;
        // **** Case 2 ****    

        // **** Case 3 ****
        Input_A=1'b0;
        Input_B=1'b1;
        Input_Cin=1'b0;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b1 && Output_Cout == 1'b0)
            nPassCount = nPassCount + 1;
        // **** Case 3 ****

        // **** Case 4 ****
        Input_A=1'b1;
        Input_B=1'b1;
        Input_Cin=1'b0;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b0 && Output_Cout == 1'b1)
            nPassCount = nPassCount + 1;
        // **** Case 4 ****
        
        // **** Case 5 ****
        Input_A=1'b0;
        Input_B=1'b0;
        Input_Cin=1'b1;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b1 && Output_Cout == 1'b0)
            nPassCount = nPassCount + 1;
        // **** Case 5 ****

        // **** Case 6 ****
        Input_A=1'b1;
        Input_B=1'b0;
        Input_Cin=1'b1;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b0 && Output_Cout == 1'b1)
            nPassCount = nPassCount + 1;
        // **** Case 6 ****    

        // **** Case 7 ****
        Input_A=1'b0;
        Input_B=1'b1;
        Input_Cin=1'b1;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b0 && Output_Cout == 1'b1)
            nPassCount = nPassCount + 1;
        // **** Case 7 ****

        // **** Case 8 ****
        Input_A=1'b1;
        Input_B=1'b1;
        Input_Cin=1'b1;
                
        #(`PERIOD)
        $display("%4dns: A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $stime, Input_A, Input_B, Input_Cin, Output_S, Output_Cout); 
        i = i+1;
        if( Output_S == 1'b1 && Output_Cout == 1'b1)
            nPassCount = nPassCount + 1;
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

