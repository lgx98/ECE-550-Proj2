# Register File

## 👨‍💻 Group Members

|Name|NetID|
|---|---|
|Guangxuan Li|gl137|
|Zhigang Wei|zw261|

## 📝 Description

Module tree:

```
regfile
├───dffe_WeRs
├───decoder
│   └───and_arr
└───//decoder_precoding
    └───decoder
        └───and_arr
```

- [x] regfile.v: top level entity, register file with 1 write port and 2 read ports.
- [x] dffe_WeRs.v: implements D-Flip-Flop with Write-Enable and asynchronous Reset.
- [x] decoder.v: just a decoder.
- [x] and_arr.v: an and gate that takes an array and AND all the bits together.
- [x] decoder_precoding.v: a decoder with precoding.

## 🐞 Bugs and Issues

High delay (85℃ slow model, ctrl_readRegB[2] to data_readRegB[16], falling to falling, 20.236 ns).

The default testbench cannot detect this bug.

In order to make successful reads, the clock period should not be faster than 20.236ns plus hold time for the accepting register.

It seems that the best way to implement the decoder is to use 5-input and gates and let the compiler generate the LUTs.

## ⚠️ Achtung!

There are some "forbidden" operators like <<, >>, &, /, %, etc., in the code. This seems like behavior Verilog but actually not. They are only used to calculate genvars to determine the wiring and will not be translated to logic gates in the circuit.

