`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 08.02.2024 15:20:12
// Design Name: 
// Module Name: SYNQ_FIFO_tb
//////////////////////////////////////////////////////////////////////////////////


module SYNQ_FIFO_tb();
    parameter t_data_width =8, t_depth=8;
    
    reg clk;
    reg wr_en;
    reg [t_data_width-1:0] wr_data;
    reg rd_en;
    wire [t_data_width-1:0] rd_data; 
    wire f_empty;
    wire f_full;
    
SYNQ_FIFO #(.data_width(t_data_width), .depth(t_depth)) fifo_inst_1
    (.clk(clk), 
    .wr_en(wr_en), 
    .wr_data(wr_data),
    .rd_en(rd_en), 
    .rd_data(rd_data), 
    .f_empty(f_empty), 
    .f_full(f_full));
    

initial
begin
    clk = 0;
    wr_en = 0;
    wr_data = 0;
    rd_en = 0;
end

initial
begin
    #10 wr_en = 1;
        wr_data = 8'haa;
    #20 wr_data = 8'ha0;
    #20 wr_data = 8'ha1;
    #20 wr_data = 8'ha2;
    #20 wr_data = 8'ha3;
    #10 wr_en = 0;
    #10 rd_en = 1;
    #100 rd_en = 0;
end
    
always #5 clk = ~clk;

initial #300 $stop;
endmodule
