// Design an odd number detector (and an even number detector)
// Implement a circuit that illuminates an LED when an odd number of the eight slide switches are set to “1”, and illuminates a second LED when an even number of slide switches are set to “1”.
// Enhance the odd number detector with pushbutton inputs
// Illuminate a third LED when an odd number of the eight slide switches are set to “1”, and 0, 2, or all 4 of the pushbuttons are pressed.

module num_sw_det_enhance (
  input logic [7:0] in_sw,
  input logic [3:0] in_bn,
  output logic out_bn, out_even_sw, out_odd_sw
);
  logic w_even_bn;

  assign out_odd_sw = ^in_sw[7:0];
  assign out_even_sw = ~^in_sw[7:0];
    
  assign w_even_bn = ~^in_bn[3:0];
    
  assign out_bn = out_odd_sw & w_even_bn;
endmodule