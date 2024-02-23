`timescale 1 ns/1 ns
module ad9708_sender(
    input                       dac_clk,
	output reg [7:0]            dac_data,
	input                       send_start,
	input [31:0]                send_len,
	output reg                  st_clr,

    input [31:0]                DMA_AXIS_tdata,
    input [3:0]                 DMA_AXIS_tkeep,
    input                       DMA_AXIS_tlast,
    output                      DMA_AXIS_tready,
    input                       DMA_AXIS_tvalid,
    input [0:0]                 DMA_RST_N,
	input                       DMA_CLK
);

wire         full ;
wire         empty ;
wire [9:0]   rd_data_count ;
wire [31:0]  dac_buf_data ;
reg  [31:0]  send_cnt ;

reg          send_start_d0 ;
reg          send_start_d1 ;
reg          send_start_d1 ;
reg [31:0]   send_len_d0   ;
reg [31:0]   send_len_d1   ;
reg [31:0]   send_len_d2   ;

assign  DMA_AXIS_tready = ~full ;
assign  dac_buf_rd = (state == S_SEND) & (send_cnt[1:0] == 2'b11) & ~empty ;


always@(posedge adc_clk or negedge DMA_RST_N)
begin
	if(DMA_RST_N == 1'b0)
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



localparam       S_IDLE      = 0;
localparam       S_SEND_WAIT = 1;
localparam       S_SAMPLE    = 2;
reg [1:0]      state ;

always@(posedge adc_clk or negedge DMA_RST_N)
begin
	if(DMA_RST_N == 1'b0)
	begin
		state        <= S_IDLE;
		wait_cnt     <= 32'd0;
		sample_cnt   <= 32'd0;
		adc_buf_data <= 32'd0 ;
		st_clr        <= 1'b0 ;
	end
	else
		case(state)
			S_IDLE:
			begin
			  if (send_start_d0)
			  begin
				state  <= S_SEND_WAIT ;
				st_clr <= 1'b1 ;
			  end		    
			end
			S_SEND_WAIT :
			begin
			  if(rd_data_count > 10'd0)
			  begin
				state      <= S_SAMPLE;
				dac_buf_rd <= 1'b1 ;
			  end
		      st_clr <= 1'b0 ;
			end
			S_SEND:
            begin
            	if(send_cnt == send_len_d2)
            	begin
            		send_cnt <= 32'd0;
            		state <= S_IDLE;
            	end
            	else
            	begin
				  case(send_cnt[1:0]) 
				    2'b00  :  dac_data <= dac_buf_data[31:24] ; 
				    2'b01  :  dac_data <= dac_buf_data[23:16] ; 
				    2'b10  :  dac_data <= dac_buf_data[15:8]  ;
				    2'b11  :  dac_data <= dac_buf_data[7:0]   ;
				  default ;
				  endcase
				  
                  send_cnt <= send_cnt + 32'd1;
            	end
            end
			default:
				state <= S_IDLE;
		endcase
end



afifo dac_inst
(
  .rst                (~DMA_RST_N),
  .wr_clk             (DMA_CLK   ),
  .rd_clk             (dac_clk   ),
  .din                (DMA_AXIS_tdata   ),
  .wr_en              (DMA_AXIS_tvalid     ),
  .rd_en              (dac_buf_rd     ),
  .dout               (dac_buf_data      ),
  .full               (full          ), 
  .empty              (empty         ),
  .rd_data_count      (rd_data_count  ),
  .wr_data_count      (              ) 

) ;

endmodule