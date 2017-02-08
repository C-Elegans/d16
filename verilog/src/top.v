module top(input CLOCK_50, input [1:0] KEY, output [7:0] LED, output Tx, input Rx);
/*AUTOWIRE*/
wire clk;
reg [2:0] rst_n;

core core(/*AUTOINST*/
          // Outputs
          .LED                          (LED),
          .tx                           (Tx),
          // Inputs
          .clk                          (clk),
          .rst_n                        (rst_n[2]),
          .rx                           (Rx));
assign clk = CLOCK_50;

always @(posedge clk)
    rst_n <= {rst_n[1:0],KEY[0]};
endmodule
