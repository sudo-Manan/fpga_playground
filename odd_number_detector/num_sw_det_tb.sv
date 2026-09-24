module num_sw_det_tb;
  logic [7:0] in_sw;
  logic [3:0] in_bn;
  logic out_bn, out_even_sw, out_odd_sw;

  num_sw_det_enhance logic_inst (.*);

  initial begin
    in_sw = 8'b0; in_bn = 4'b0;
    $display("|   in_sw   | in_bn | even | odd | out_bn |");
    $monitor("| %b  | %b |  %b  | %b  |   %b   |", in_sw, in_bn, even, odd, out_bn);

    #5; in_sw = 8'b0101_0100; in_bn = 4'b0001;
    odd: assert(out_odd_sw == 1 && out_even_sw == 0)
      else $warning("odd: shoulld be odd");
    
    #5; in_sw = 8'b1111_0000; in_bn = 4'b0000;
    even: assert(out_odd_sw == 0 && out_even_sw == 1 && out_bn == 0)
      else $warning("even: shoulld be even");

    #5; in_sw = 8'b0101_0100; in_bn = 4'b0110;
    bn: assert(out_odd_sw == 1 && out_even_sw == 0 && out_bn == 1)
      else $warning("bn: button led should be high");
  end
endmodule