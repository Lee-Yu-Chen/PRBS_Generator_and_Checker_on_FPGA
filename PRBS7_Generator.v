module prbs_gen(prbs, clk);
  
  output prbs;
  input clk;

  reg [0:6] prbg_gen;
  integer x;

  initial begin
    prbs_gen <= 7'b1111111;
  end

  always @(posedge clk) begin
    x = prbs_gen[0] ^ prbs_gen[1];
    
    prbs_gen = prbs_gen << 1;
    prbs_gen[6] = x;
  end

  assign prbs = prbs_gen[6];

endmodule
    
