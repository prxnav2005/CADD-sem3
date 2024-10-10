// Code your design here
// This file contains all codes for Structural model coding. I will also include circuit diagrams for as many codes as possible to have a clear understanding.

// Code for Full Adder using Half Adders. We know that a full adder uses 2 half adders and an or gate.

module HA(input logic a,b, output logic s, cout);
  assign s = a^b;
  assign cout = a&b;
endmodule

module FA(input logic x,y,cin, output logic s,carry);
  logic n1,n2,n3;
  HA I1(x,y,n1,n2);
  HA I2(n1,cin,s,n3);
  or I3(carry,n3,n2); //or is a built in primitive. syntax is (output,input,input...)
endmodule

// Code for 4-bit ripple carry adder 

// A ripple carry adder is built using a full adder. Since in this case we are considering 4 bits, we use 4 full adders. The same full adder module is used from previous code and in turn to build the full adder we obviously require the half adder. 

module RCA(input logic [3:0] a,b, input logic cin, output logic [3:0] s, output logic cout);
  logic c0,c1,c2;
  FA FA1(a[0], b[0], cin, s[0], c0); //These lines essentially describe the inputs and outputs for each
  FA FA2(a[1], b[1], c0, s[1], c1); // full adder block.
  FA FA3(a[2], b[2], c1, s[2], c2);
  FA FA4(a[3], b[3], c2, s[3], c3);
endmodule

// 4:1 mux using 2:1 mux

// A 4:1 mux uses 3 2:1 muxs, one active low, one active high, and a final mux which receives both inputs of active low and active high to provide the final output.

module mux2(input logic [3:0] a,b, input logic c, output logic [3:0] d);
  assign d = c?a:b;
endmodule

module mux4(input logic [3:0] d0,d1,d2,d3, input logic [1:0] s, output logic [3:0] y);
  logic [3:0] low,high;
  mux2 lowmux(d0,d1,s[0],low);
  mux2 highmux(d2,d3,s[0],high);
  mux2 finalmux(low,high,s[1],y);
endmodule

// 2:1 mux using tri-state buffers.

module tri_buff(input logic din, s, output logic dout);
  assign dout = s?din : 1'bz;
endmodule

module mux2(input logic d0,d,s, output logic y);
  tri_buff I1(d0,~s,y);
  tri_buff I2(d1,s,y);
endmodule

// Accessing parts of busses

module mux2_8(input logic [7:0] d0, d1,input logic s,output logic [7:0] y);
  mux2 lsbmux(d0[3:0], d1[3:0], s, y[3:0]);
  mux2 msbmux(d0[7:4], d1[7:4], s, y[7:4]);
endmodule




                                  