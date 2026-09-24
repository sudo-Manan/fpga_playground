module Debounce_Filter #(parameter DEBOUNCE_LIMIT = 20)(
    input logic in_clk, in_bouncy,
    output logic out_debounced
);
    
    logic [($clog2(DEBOUNCE_LIMIT))-1:0] r_count = 0;
    logic r_state = 1'b0;
    
    always_ff @(posedge in_clk) begin
        if ((in_bouncy != r_state) && (r_count < DEBOUNCE_LIMIT-1)) r_count <= r_count + 1;
        else if (r_count == (DEBOUNCE_LIMIT - 1)) begin
            r_state <= in_bouncy;
            r_count <= 0;
        end
        else r_count <= 0;
    end
    
    assign out_debounced = r_state;
    
endmodule
