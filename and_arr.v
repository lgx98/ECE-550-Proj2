/* This module implements a and gate
 that takes an array and AND them together
 */
module and_arr #(parameter Width = 5)
                (input [Width - 1:0] in,
                 output out);
    wire [Width - 1:0] temp;
    assign temp[0] = in[0];

    genvar i;
    generate
        for (i = 1; i < Width; i = i + 1) begin: gen_and
            and u_and(temp[i], in[i], temp[i-1]);
        end
    endgenerate
    
    assign out = temp[Width - 1];
endmodule
