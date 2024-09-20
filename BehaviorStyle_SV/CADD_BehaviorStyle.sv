//This file contains all the codes for Behavior style. 
// Note : We use begin and end when there are multiple statements within the always procedural block.

// Code for register 
/*
module regi(input logic clk, input logic [3:0] d, output logic [3:0] q);
  always_ff @(posedge clk)
    q <= d;
endmodule
*/

//Code for a resettable register(Asynchronous reset)
/*
module resettable_regi(input logic clk, reset, input logic [3:0] d, output logic [3:0] q);
  always_ff @(posedge clk, posedge reset) //in asynchronous reset, both clock and reset are given equal priority
    begin
      if(reset) // this statement means if reset = true, then output is set to initial set (i.e. 0)
      	q <= 4'b0;
  	  else 
        q <= d; // if reset = false, then output = input 
    end
endmodule 

// Code for a resettable register (Synchronous reset)

module resettable_regi(input logic clk, reset, input logic [3:0] d, output logic [3:0] q);
  always_ff @(posedge clk) // in synchronous reset, clock is given higher priority
    begin
      if(reset)
        q <= 4'b0;
  	  else 
      	q <= d;
    end
endmodule
*/

//Code for resettable enabled register 
/*
module res_ena_regi(input logic clk, reset, en, input logic [3:0] d, output logic q);
  always_ff @(posedge clk, posedge reset)
    if (reset)
      q <= 4'b0;
  else if (en) //If the enable is true, then the register works. 
      q <= d;
endmodule 
*/

//Code for multiple registers
/*
module mul_regi(input logic d, clk, output logic q);
  logic n1;
  always_ff @(posedge clk)
    begin
      n1 <= d;
      q <= n1;
    end
endmodule
*/

//Code for Full adder (normal one) 
/*
module FA(input logic a,b,cin, output logic cout, s);
  always_comb // Full Adder is a combinational circuit
    begin
      s = a^b^c;
      cout = (a&b)|(b&c)|(c&a);
    end
endmodule
*/

//Code for Full Adder (using generate and propagate)
/*
module FA(input logic a,b,cin, output logic cout,s);
  logic p,g;
  always_comb
    begin
      p = a^b;
      g = a&b;
      
      s = p^cin;
      cout = g | (p&cin);
    end
endmodule
*/

//Code for D Latch (Also can be called a 4-bit positive level edge triggered latch)
/*
module latch4(input logic [3:0] d, input logic clk, output logic [3:0] q);
  always_latch
    if(clk)
      q <= d;
endmodule
*/

// Code for an inverter using always procedural block
/*
module inv(input logic [3:0] a, output logic [3:0] y);
  always_comb
    y = ~a;
endmodule
*/

//Code for 2:4 decoder (Introducing concept of case statements)
/*
module deco24(input logic [1:0] A, output logic [3:0] Y);
  always_comb
    case(A)
      2'b00 : Y = 4'b0001;
      2'b01 : Y = 4'b0010;
      2'b10 : Y = 4'b0100;
      2'b11 : Y = 4'b1000;
    endcase
  end
endmodule
*/

//Code for 3:8 decoder 
/*
module deco38(input logic [2:0] a, output logic [7:0] y);
  always_comb
    case(a)
      3'b000 : y = 8'b00000001;
      3'b001 : y = 8'b00000010;
      3'b010 : y = 8'b00000100;
      3'b011 : y = 8'b00001000;
      3'b100 : y = 8'b00010000;
      3'b101 : y = 8'b00100000;
      3'b110 : y = 8'b01000000;
      3'b111 : y = 8'b10000000;
      default: y = 8'bxxxxxxxx; //Note that this default statement aint always necessary. Just in case one of the inputs is X or Z, i have included the default statement too.
    endcase
endmodule
*/

// Code for 4:2 Priority encoder
/*
module prio_enco(input logic [3:0] A, output logic [1:0] Y);
  always_comb
    case(A)
      4'b0000 : Y = 2'b00;
      4'b0001 : Y = 2'b00;
      4'b001X : Y = 2'b01;
      4'b01XX : Y = 2'b10;
      4'b1XXX : Y = 2'b11;
    endcase
endmodule
*/

// Code for JK Flip-Flop
/*
module jkff(input logic j,k,clk, inout logic q);
  always_ff @(posedge clk)
    case ({J,K})
      2'b00 : q <= q;
      2'b01 : q <= 0;
      2'b10 : q <= 1;
      2'b11 : q <= ~q;
    endcase
endmodule
*/