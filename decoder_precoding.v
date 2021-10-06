/* This module implements an 5 to 32 decoder with precoding
 Step 1. predecode the input in groups 3-2, that gives us 8 + 4 =12 wires
 Step 2. combine the pre-decoded wires to generate final output
 */
module decoder_precoding (input [4:0] sel,
                          output [31:0] out);

    // predecoding upper 3 bits
    wire [7:0] predec0_out;
    decoder #(.n(3)) decoder0(
        .sel(sel[4:2]),
        .out(predec0_out)
    );

    // predecoding lower 2 bits
    wire [3:0] predec1_out;
    decoder #(.n(2)) decoder1(
        .sel(sel[1:0]),
        .out(predec1_out)
    );

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: gen_postdec
            and u_and(out[i], predec0_out[i / 4], predec1_out[i % 4]);
        end
    endgenerate
endmodule
