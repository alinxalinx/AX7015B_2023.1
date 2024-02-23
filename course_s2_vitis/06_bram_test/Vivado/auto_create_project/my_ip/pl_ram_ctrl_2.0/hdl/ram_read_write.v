`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 09:12:16
// Design Name: 
// Module Name: ram_read_write
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_read_write
    (
	 input              clk,
	 input              rst_n,
	 
	(* MARK_DEBUG="true" *) input      [31:0]  din,	 
	 output reg [31:0]  dout,
	 output reg         en,
	 output reg [3:0]   we,
	 output             rst,
	 output reg [31:0]  addr,
	 
	 input              start,
	 output reg         write_end,
	 input      [31:0]  len,
	 input      [31:0]  start_addr
    );


assign rst = 1'b0 ;
	
localparam IDLE      = 3'd0 ;
localparam READ_RAM  = 3'd1 ;
localparam READ_END  = 3'd2 ;
localparam WRITE_RAM = 3'd3 ;
localparam WRITE_END = 3'd4 ;

reg [2:0] state ;

//write part	
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
  begin
    state      <= IDLE  ;
	dout       <= 32'd0 ;
	en         <= 1'b0  ;
	we         <= 4'd0  ;
	addr       <= 32'd0 ;
	write_end  <= 1'b0  ;
  end
	
  else
  begin
    case(state)
	IDLE            : begin
			            if (start)
						begin
			              state <= READ_RAM     ;
						  addr  <= start_addr   ;
						  en    <= 1'b1 ;
						end			  
				        write_end <= 1'b0 ;
			          end

    
    READ_RAM        : begin
	                    if ((addr - start_addr) == len - 4)
						begin
						  state <= READ_END ;
						  en    <= 1'b0     ;
						end
						else
						begin
						  addr <= addr + 32'd4 ;						  
						end
					  end
					  
    READ_END        : begin
	                    addr  <= start_addr ;
	                    en <= 1'b1 ;
                        we <= 4'hf ;
					    state <= WRITE_RAM  ;					    
					  end
    
	WRITE_RAM       : begin
	                    if ((addr - start_addr) == len - 4)
						begin
						  state <= WRITE_END ;
						  dout  <= 32'd0 ;
						  en    <= 1'b0  ;
						  we    <= 4'd0  ;
						end
						else
						begin
						  addr <= addr + 32'd4 ;
						  dout <= dout + 32'd2 ;						  
						end
					  end
					  
	WRITE_END       : begin
	                    addr <= 32'd0 ;
						write_end <= 1'b1 ;
					    state <= IDLE ;					    
					  end	
	default         : state <= IDLE ;
	endcase
  end
end	
	
endmodule
