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

`include "Full_Adder.v"

`define RC_ADDR_BANDWITH 4

module RC_Adder(A, B, Sum, Cout );

    input   [`RC_ADDR_BANDWITH-1:0]     A;
    input   [`RC_ADDR_BANDWITH-1:0]     B;
    output  [`RC_ADDR_BANDWITH-1:0]     Sum;
    output                              Cout;
    
    wire Carry [`RC_ADDR_BANDWITH-2:0];


    // Ripple Carry Adder
    Full_Adder FA0(A[0], B[0], 0, Sum[0], Carry[0]);
    
    genvar i;
    generate
        for( i=1; i<`RC_ADDR_BANDWITH-1; i=i+1 ) begin
            Full_Adder fa1(A[i], B[i], Carry[i-1], Sum[i], Carry[i]);
        end
    endgenerate

    Full_Adder fa3(A[`RC_ADDR_BANDWITH-1], B[`RC_ADDR_BANDWITH-1], Carry[`RC_ADDR_BANDWITH-2], Sum[`RC_ADDR_BANDWITH-1], Cout);
    
endmodule
