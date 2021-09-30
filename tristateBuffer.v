/* This module implements a Width bit tristateBuffer
 */
module tristateBuffer #(parameter Width = 32)
                       (input [Width-1:0] Din,
                        output [Width-1:0] Dout,
                        input en);
    assign Dout = {(Width){1'b0}};
endmodule
