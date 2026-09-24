module top (
  input logic sys_clk_p, sys_clk_n,
  input logic [7:0] in_sw,
  input logic [3:0] in_bn_bouncy,
  output logic out_bn, out_even_sw, out_odd_sw
);
  logic [3:0] in_bn;
  logic in_clk, buf_clk_p;

  IBUFDS IBUFDS_inst (
    .O(buf_clk_p),   // 1-bit output: Buffer output
    .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
    .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
  );
    
  BUFG BUFG_inst (
    .O(in_clk), // 1-bit output: Clock output.
    .I(buf_clk_p)  // 1-bit input: Clock input.
  );

  Debounce_Filter #(.DEBOUNCE_LIMIT(1_000_000)) debounce_inst (
    .in_clk(in_clk), 
    .in_bouncy(in_bn_bouncy), 
    .out_debounced(in_bn)
  );

  num_sw_det_enhance logic_inst (.*);
  
endmodule
