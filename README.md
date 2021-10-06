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
└───decoder_precoding
    └───decoder
        └───and_arr
```

- [x] regfile.v: top level entity, register file with 1 write port and 2 read ports.
- [x] dffe_WeRs.v: implements D-Flip-Flop with Write-Enable and asynchronous Reset.
- [x] decoder.v: just a decoder.
- [x] and_arr.v: an and gate that takes an array and AND all the bits together.
- [x] decoder_precoding.v: a decoder with precoding.

## 🐞 Bugs and Issues

High delay (about 21 ns).

The waveform below is generated under 85℃ slow model.

![image-20211006121717117](.\README.assets\image-20211006121717117.png)

## ⚠️ Achtung!

There are some "forbidden" operators like <<, >>, &, /, %, etc., in the code. This seems like behavior Verilog but actually not. They are only used to calculate genvars to determine the wiring and will not be translated to logic gates in the circuit.

