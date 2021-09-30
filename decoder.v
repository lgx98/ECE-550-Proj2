/* This module implements an n to 2^n decoder
 */
module decoder #(parameter n = 5)
                (input [n-1:0] sel,
                 output [(1<<n)-1:0] out);
    assign out = {(1<<n){1'b0}};
endmodule
