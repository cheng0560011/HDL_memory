// Code your design here
// This is a HDL practice of a single port RAM

module RAM 
  #(
	parameter ADDR_WIDTH = 4,
  	parameter DATA_WIDTH = 32,
  	parameter DEPTH = 1 << ADDR_WIDTH
	)
  (	input wire clk,
   	input wire we,
   	input wire cs,
   input wire[ADDR_WIDTH-1:0] addr,
   input wire[DATA_WIDTH-1:0] data_in,
   output wire[DATA_WIDTH-1:0] data_out
  );
  
  reg[DATA_WIDTH-1:0] mem[DEPTH-1:0];
  reg[DATA_WIDTH-1:0] out_buffer;

  assign data_out = cs ? out_buffer: 'hz;
  
  always @ (posedge clk) begin
    if (cs & we)
      mem[addr] <= data_in;
    if (cs & !we)
      out_buffer <= mem[addr];
  end
  
endmodule
