// This file contains all the codes that's required for ISA-1

//Starting with Data flow model style of coding:- 

/*module sillyfunction (input logic a,b,c, output logic y);
  
  assign y = ~a & ~b & ~c | // ~ is NOT operator, & is AND operator, | is OR operator.
    		  a & ~b & ~c |
			  a & ~b & c;
endmodule
*/

// Code for bitwise operator 
/*
module inv(input logic [3:0] a, output logic [3:0]y);
  
  assign y = ~a; 
endmodule
*/

//Code for logic gates operation 
/*
module gates(input logic [3:0] a,b, output logic [3:0] y1, y2, y3, y4, y5);
  assign y1 = a&b; // AND Gate
  assign y2 = a|b; // OR Gate
  assign y3 = a^b; // XOR Gate
  assign y4 = ~(a&b); // NAND 
  assign y5 = ~(a|b); // NOR Gate
endmodule
*/

//Code for 2:1 Mux
/*
module mux2 (input logic [3:0] d0, d1, input logic s, output logic [3:0] y);
  assign y = s ? d1 : d0; // This is the conditional operator(also called the ternary operator). If the value of 's' is 1, then y = d1, otherwise if s = 0, y = d0
  
endmodule
*/

// Code for 4:1 Mux
/*
module mux4(input logic [3:0] d0,d1,d2,d3, input logic [1:0]s, output logic [3:0]y);
  
  assign y = s[1] ? (s[0] ? d3: d2) : (s[0] ? d1 : d0); 
// If s[1] is 1, then the multiplexer chooses the first expression,(s[0] ? d3 : d2). This expression in turn chooses either d3 or d2 based on s[0] (y = d3 if s[0] is 1 and d2 if s[0] is 0).If s[1] is 0, then the multiplexer similarly chooses the second expression, which gives either d1 or d0 based on s[0].
endmodule
*/

//Code for Full Adder (Normal one)
/*
module full_adder_d (
    input a,b,cin,
    output sum,carry
);

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin)  | (cin & a) ;

endmodule
*/

//Code for Full Adder (Independent of Cin) 
/*
module FA(input logic a,b,cin, output logic s,cout);
  logic p,g; // Internal variables, p stands for propagate and g stands for generate
  
  assign p = a^b;
  assign g = a&b;
  
  assign s = p^cin;
  assign cout = g | (p&cin);
endmodule
*/

//Code for Tri-state buffer 
/*
module tristate_buffer(input din, s1, output dout);
  assign dout = s ? din : 1'bz;
endmodule
*/

//Introducing delays to our codes
 
//timescale 1ns/1ps This is SystemVerilog's timescale, syntax is timescale<time_unit>/<time_precision> where the time_unit is the measurement of delays and simulation time, while the time_precision specifies how delay values are rounded before being used in the simulation.
/*
module example(input logic a, b, c,output logic y);
  logic ab, bb, cb, n1, n2, n3;
  assign #1 {ab, bb, cb} = ~{a, b, c};
  assign #2 n1 = ab & bb & cb;
  assign #2 n2 = a & bb & cb;
  assign #2 n3 = a & bb & c;
  assign #4 y = n1 | n2 | n3;
endmodule
*/
