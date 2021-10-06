/* This module implements an n to 2^n decoder
 ##### For TAs: #####
 the "<<" and  ">>" operators here are only used for calculating the indexes of the wires
 */
module decoder #(parameter n = 5)
                (input [n-1:0] sel,
                 output [(1<<n)-1:0] out);
    parameter WIDTH = 1<<n;
    wire [n-1:0] selN;

    //assign selN=~sel;
    // The code above is considered behavioral verilog by TAs :(
    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin: gen_neg_sel
            not u_not(selN[i], sel[i]);
        end
    endgenerate

    wire [n-1:0] and_inputs [WIDTH-1:0];
    genvar j;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin: gen_and_input
            for (j = 0; j < n; j = j + 1) begin: gen_and_input_each_bit
                // get the jth of j; if it is 1 assign sel, else assign selN.
                // assign and_inputs[i][j] = ((i>>j)&1)?sel[j]:selN[j];
                // make code look more "structural"
                if ((i>>j)%2==1) begin
                    assign and_inputs[i][j] = sel[j];
                end else begin
                    assign and_inputs[i][j] = selN[j];
                end
            end
            // assign out[i] = &and_inputs[i];
            and_arr #(.Width(n))
                u_and_arr (
                    .in(and_inputs[i]),
                    .out(out[i])
                );
        end
    endgenerate
endmodule
