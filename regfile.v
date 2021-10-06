module regfile (clock,
                ctrl_writeEnable,
                ctrl_reset,
                ctrl_writeReg,
                ctrl_readRegA,
                ctrl_readRegB,
                data_writeReg,
                data_readRegA,
                data_readRegB);
    
    input clock, ctrl_writeEnable, ctrl_reset;
    input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    input [31:0] data_writeReg;
    
    output [31:0] data_readRegA, data_readRegB;
    
    /* YOUR CODE HERE */

    // delclare wires
    wire [31:0] dec_write, dec_readA, dec_readB;
    wire [31:1] reg_en;
    wire [31:0] reg_out [31:0];

    // write port
    decoder decoder_write(
        .sel(ctrl_writeReg),
        .out(dec_write)
    );
    // decoder_precoding decoder_write(
    //     .sel(ctrl_writeReg),
    //     .out(dec_write)
    // );
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin: gen_and
            and u_and(reg_en[i], ctrl_writeEnable, dec_write[i]);
        end
    endgenerate

    // registers
    assign reg_out[0] = 32'h00000000;
    generate
        for (i = 1; i < 32; i = i + 1) begin: gen_reg
            dffe_WeRs u_dffe_WeRs(
                .we(reg_en[i]),
                .din(data_writeReg),
                .qout(reg_out[i]),
                .clk(clock),
                .rst(ctrl_reset)
            );
        end
    endgenerate

    // read port A
    decoder decoder_readA(
        .sel(ctrl_readRegA),
        .out(dec_readA)
    );
    // decoder_precoding decoder_readA(
    //     .sel(ctrl_readRegA),
    //     .out(dec_readA)
    // );
    generate
        for (i = 0; i < 32; i = i + 1) begin: gen_readA
            assign data_readRegA=dec_readA[i]?reg_out[i]:32'hzzzzzzzz;
            tristateBuffer u_tristateBuffer(
                .Din(reg_out[i]),
                .Dout(data_readRegA),
                .en(dec_readA[i])
            );
        end
    endgenerate

    // read port B
    decoder decoder_readB(
        .sel(ctrl_readRegB),
        .out(dec_readB)
    );
    // decoder_precoding decoder_readB(
    //     .sel(ctrl_readRegB),
    //     .out(dec_readB)
    // );
    generate
        for (i = 0; i < 32; i = i + 1) begin: gen_readB
            // assign data_readRegB=dec_readB[i]?reg_out[i]:32'hzzzzzzzz;
            tristateBuffer u_tristateBuffer(
                .Din(reg_out[i]),
                .Dout(data_readRegB),
                .en(dec_readB[i])
            );
        end
    endgenerate
endmodule
