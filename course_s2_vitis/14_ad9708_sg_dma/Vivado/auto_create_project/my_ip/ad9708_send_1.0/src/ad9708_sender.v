`timescale 1 ns/1 ns
module ad9708_sender(
    input                       dac_clk,
    input                       dac_rst_n,
    output reg [7:0]            dac_data,
	input                       send_start,
	input [31:0]                send_len,
	output reg                  st_clr,

    input [7:0]                 DMA_AXIS_tdata,
    input [0:0]                 DMA_AXIS_tkeep,
    input                       DMA_AXIS_tlast,
    output                      DMA_AXIS_tready,
    input                       DMA_AXIS_tvalid,
    input [0:0]                 DMA_RST_N,
	input                       DMA_CLK
);

wire         almost_full; 
wire         empty ;
wire [9:0]   rd_data_count ;
wire [7:0]   dac_buf_data ;
reg  [31:0]  send_cnt ;

reg          send_start_d0 ;
reg          send_start_d1 ;
reg          send_start_d2 ;
reg [31:0]   send_len_d0   ;
reg [31:0]   send_len_d1   ;
reg [31:0]   send_len_d2   ;
wire         dac_buf_rd ;
reg          fifo_wr_en   ;
reg [7:0]    fifo_wr_data ;

localparam       S_IDLE      = 0;
localparam       S_SEND_WAIT = 1;
localparam       S_SEND      = 2;
reg [1:0]      state ;

/* When almost_full is not valid, DMA_AXIS_tready valid */
assign  DMA_AXIS_tready = ~almost_full ;
/* When in send state and fifo not empty, read valid */
assign  dac_buf_rd = (state == S_SEND)  & ~empty ;


always@(posedge dac_clk or negedge dac_rst_n)
begin
	if(dac_rst_n == 1'b0)
	begin
		send_start_d0 <= 1'b0;
		send_start_d1 <= 1'b0;
		send_start_d2 <= 1'b0;
		send_len_d0   <= 32'd0 ;
		send_len_d1   <= 32'd0 ;
		send_len_d2   <= 32'd0 ;
	end	
	else 
	begin
         send_start_d0 <= send_start;
         send_start_d1 <= send_start_d0;
         send_start_d2 <= send_start_d1;
         send_len_d0   <= send_len ;
         send_len_d1   <= send_len_d0 ;
         send_len_d2   <= send_len_d1 ;
     end    
end





always@(posedge dac_clk or negedge dac_rst_n)
begin
	if(dac_rst_n == 1'b0)
	begin
		state        <= S_IDLE;
		send_cnt     <= 32'd0;
		dac_data     <= 8'd0 ;
		st_clr       <= 1'b0 ;
	end
	else
		case(state)
			S_IDLE:
			begin
			  if (send_start_d2 && rd_data_count > 10'd256)
			  begin
				state  <= S_SEND_WAIT ;
				st_clr <= 1'b1 ;
			  end		    
			end
			S_SEND_WAIT :
			begin
			  state   <= S_SEND;
		      st_clr  <= 1'b0  ;
			end
			/* always in send state */
			S_SEND :
            begin
                  dac_data <= dac_buf_data ;	  
                  send_cnt <= send_cnt + 32'd1;     	
            end
			default:
				state <= S_IDLE;
		endcase
end


/* When DMA_AXIS_tready and DMA_AXIS_tvalid both valid, write data from DMA AXI4-Stream to fifo*/
always@(posedge DMA_CLK or negedge DMA_RST_N)
begin
	if(DMA_RST_N == 1'b0)
	begin
	  fifo_wr_en   <= 1'b0 ;
	  fifo_wr_data <= 8'd0 ;
	end
	else if (DMA_AXIS_tready & DMA_AXIS_tvalid)
	begin
	  fifo_wr_en   <= 1'b1 ;
      fifo_wr_data <= DMA_AXIS_tdata ;
	end
	else
	begin
	  fifo_wr_en   <= 1'b0 ;
	end
end


dac_fifo dac_inst
(
  .rst                (~DMA_RST_N),
  .wr_clk             (DMA_CLK   ),
  .rd_clk             (dac_clk   ),
  .din                (fifo_wr_data   ),
  .wr_en              (fifo_wr_en     ),
  .rd_en              (dac_buf_rd     ),
  .dout               (dac_buf_data      ),
  .full               (          ), 
  .almost_full        (almost_full  ),
  .empty              (empty         ),
  .rd_data_count      (rd_data_count  ),
  .wr_data_count      (              ) 

) ;

endmodule