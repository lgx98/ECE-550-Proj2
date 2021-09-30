# ALU - ADD/SUB/CMP

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
└───tristateBuffer
```

- [ ] regfile.v: top level entity, register file with 1 write port and 2 read ports.
- [x] dffe_WeRs.v: implements D-Flip-Flop with Write-Enable and asynchronous Reset.
- [ ] decoder.v: just a decoder.
- [x] tristateBuffer.v: a tri-state buffer that outputs high-impedance when Enable is 0.

## 🐞 Bugs and Issues

Nothing at the moment.

