/* This module implements a Width bit tristateBuffer
 */
module tristateBuffer #(parameter Width = 32)
                       (input [Width-1:0] Din,
                        output [Width-1:0] Dout,
                        input en);
    //assign Dout = en?Din:{(Width){1'bz}};
    // The code above is considered behavioral verilog by TAs :(
    genvar i;
    generate
        for (i = 0; i < Width; i = i + 1) begin: gen_tribuf
            assign Dout[i] = en?Din[i]:1'bz;
        end
    endgenerate
endmodule
