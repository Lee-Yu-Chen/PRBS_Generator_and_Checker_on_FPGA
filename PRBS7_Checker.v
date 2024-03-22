module prbs_chk(prbs_err, prbs_received, clk);

  output prbs_err;
  input prbs_received;
  input clk;

  reg [0:7] flipflop;

  initial begin
    flipflop <= 8'b00000000;
  end

  always @(posedge clk) begin
    flipflop = flipflop >> 1;
    flipflop[0] = prbs_received;
  end

  assign prbs_err = flipflop[6] ^ flipflop[7] ^ flipflop[0];

endmodule
  
