; Mega Man 2 — PRG Bank 13
; Base address: $8000
; Size: 16384 bytes

  $8000  4C 15 80  JMP $8015
  $8003  4C EC 90  JMP $90EC
  $8006  4C 78 96  JMP $9678
  $8009  4C E7 9E  JMP $9EE7
  $800C  4C 01 B1  JMP $B101
  $800F  4C F1 B6  JMP $B6F1
  $8012  4C E0 BA  JMP $BAE0

L_8015:
  $8015  A9 10     LDA #$10
  $8017  85 F7     STA $F7
  $8019  8D 00 20  STA $2000
  $801C  A9 06     LDA #$06
  $801E  85 F8     STA $F8
  $8020  8D 01 20  STA $2001
  $8023  20 7E 84  JSR $847E
  $8026  20 3C 84  JSR $843C
  $8029  A2 00     LDX #$00
  $802B  A5 9A     LDA $9A
  $802D  85 01     STA $01

L_802F:
  $802F  86 00     STX $00
  $8031  46 01     LSR $01
  $8033  90 2C     BCC $8061
  $8035  BD 31 85  LDA $8531,X
  $8038  85 09     STA $09
  $803A  BD 39 85  LDA $8539,X
  $803D  85 08     STA $08
  $803F  A2 04     LDX #$04
  $8041  A9 00     LDA #$00

L_8043:
  $8043  A5 09     LDA $09
  $8045  8D 06 20  STA $2006
  $8048  A5 08     LDA $08
  $804A  8D 06 20  STA $2006
  $804D  A0 04     LDY #$04
  $804F  A9 00     LDA #$00

L_8051:
  $8051  8D 07 20  STA $2007
  $8054  88        DEY
  $8055  D0 FA     BNE $8051
  $8057  18        CLC
  $8058  A5 08     LDA $08
  $805A  69 20     ADC #$20
  $805C  85 08     STA $08
  $805E  CA        DEX
  $805F  D0 E2     BNE $8043

L_8061:
  $8061  A6 00     LDX $00
  $8063  E8        INX
  $8064  E0 08     CPX #$08
  $8066  D0 C7     BNE $802F
  $8068  A2 1F     LDX #$1F
  $806A  20 9E 82  JSR $829E
  $806D  20 73 84  JSR $8473
  $8070  A2 00     LDX #$00
  $8072  A5 9A     LDA $9A
  $8074  85 02     STA $02
  $8076  A0 00     LDY #$00

L_8078:
  $8078  86 01     STX $01
  $807A  46 02     LSR $02
  $807C  B0 15     BCS $8093
  $807E  BD 05 86  LDA $8605,X
  $8081  85 00     STA $00
  $8083  BD FD 85  LDA $85FD,X
  $8086  AA        TAX

L_8087:
  $8087  BD 41 85  LDA $8541,X
  $808A  99 00 02  STA $0200,Y
  $808D  C8        INY
  $808E  E8        INX
  $808F  C6 00     DEC $00
  $8091  D0 F4     BNE $8087

L_8093:
  $8093  A6 01     LDX $01
  $8095  E8        INX
  $8096  E0 08     CPX #$08
  $8098  D0 DE     BNE $8078
  $809A  20 1D A5  JSR $A51D
  $809D  A9 0C     LDA #$0C
  $809F  20 51 C0  JSR $C051
  $80A2  A9 00     LDA #$00
  $80A4  85 2A     STA $2A
  $80A6  85 FD     STA $FD
  $80A8  20 AB C0  JSR $C0AB

L_80AB:
  $80AB  A5 27     LDA $27
  $80AD  29 08     AND #$08
  $80AF  D0 17     BNE $80C8
  $80B1  A5 27     LDA $27
  $80B3  29 F0     AND #$F0
  $80B5  F0 08     BEQ $80BF
  $80B7  A9 2F     LDA #$2F
  $80B9  20 51 C0  JSR $C051
  $80BC  20 AB 82  JSR $82AB

L_80BF:
  $80BF  20 12 83  JSR $8312
  $80C2  20 AB C0  JSR $C0AB
  $80C5  4C AB 80  JMP $80AB

L_80C8:
  $80C8  A6 2A     LDX $2A
  $80CA  D0 0D     BNE $80D9
  $80CC  A5 9A     LDA $9A
  $80CE  C9 FF     CMP #$FF
  $80D0  D0 ED     BNE $80BF
  $80D2  A9 08     LDA #$08
  $80D4  85 2A     STA $2A
  $80D6  4C 9A 82  JMP $829A

L_80D9:
  $80D9  BC 5F 86  LDY $865F,X
  $80DC  A5 9A     LDA $9A
  $80DE  39 D1 86  AND $86D1,Y
  $80E1  D0 DC     BNE $80BF
  $80E3  84 2A     STY $2A
  $80E5  A9 3A     LDA #$3A
  $80E7  20 51 C0  JSR $C051
  $80EA  A5 2A     LDA $2A
  $80EC  0A        ASL
  $80ED  85 00     STA $00
  $80EF  0A        ASL
  $80F0  65 00     ADC $00
  $80F2  AA        TAX
  $80F3  A0 00     LDY #$00

L_80F5:
  $80F5  BD 71 86  LDA $8671,X
  $80F8  99 60 04  STA $0460,Y
  $80FB  BD A1 86  LDA $86A1,X
  $80FE  99 40 04  STA $0440,Y
  $8101  A9 00     LDA #$00
  $8103  99 80 04  STA $0480,Y
  $8106  E8        INX
  $8107  C8        INY
  $8108  C0 06     CPY #$06
  $810A  D0 E9     BNE $80F5
  $810C  A9 0A     LDA #$0A
  $810E  8D A0 04  STA $04A0
  $8111  A9 00     LDA #$00
  $8113  8D C0 04  STA $04C0
  $8116  8D 80 06  STA $0680
  $8119  A9 30     LDA #$30
  $811B  85 FD     STA $FD

L_811D:
  $811D  A2 3F     LDX #$3F
  $811F  A5 FD     LDA $FD
  $8121  29 04     AND #$04
  $8123  D0 02     BNE $8127
  $8125  A2 1F     LDX #$1F

L_8127:
  $8127  20 9E 82  JSR $829E
  $812A  AE 80 06  LDX $0680
  $812D  18        CLC
  $812E  BD 80 04  LDA $0480,X
  $8131  85 08     STA $08
  $8133  69 20     ADC #$20
  $8135  9D 80 04  STA $0480,X
  $8138  08        PHP
  $8139  BD 60 04  LDA $0460,X
  $813C  85 09     STA $09
  $813E  69 00     ADC #$00
  $8140  9D 60 04  STA $0460,X
  $8143  28        PLP
  $8144  D0 03     BNE $8149
  $8146  EE 80 06  INC $0680

L_8149:
  $8149  BD 40 04  LDA $0440,X
  $814C  20 0C C7  JSR $C70C
  $814F  18        CLC
  $8150  AD C0 04  LDA $04C0
  $8153  8D B7 03  STA $03B7
  $8156  69 20     ADC #$20
  $8158  8D C0 04  STA $04C0
  $815B  AD A0 04  LDA $04A0
  $815E  8D B6 03  STA $03B6
  $8161  69 00     ADC #$00
  $8163  8D A0 04  STA $04A0
  $8166  C6 FD     DEC $FD
  $8168  F0 06     BEQ $8170
  $816A  20 AB C0  JSR $C0AB
  $816D  4C 1D 81  JMP $811D

L_8170:
  $8170  A2 1F     LDX #$1F
  $8172  20 9E 82  JSR $829E
  $8175  A9 2C     LDA #$2C
  $8177  8D 58 03  STA $0358
  $817A  A9 11     LDA #$11
  $817C  8D 59 03  STA $0359
  $817F  A0 07     LDY #$07

L_8181:
  $8181  B9 D9 84  LDA $84D9,Y
  $8184  99 66 03  STA $0366,Y
  $8187  88        DEY
  $8188  10 F7     BPL $8181
  $818A  A5 2A     LDA $2A
  $818C  0A        ASL
  $818D  0A        ASL
  $818E  0A        ASL
  $818F  AA        TAX
  $8190  A0 00     LDY #$00

L_8192:
  $8192  BD E1 84  LDA $84E1,X
  $8195  99 6E 03  STA $036E,Y
  $8198  E8        INX
  $8199  C8        INY
  $819A  C0 08     CPY #$08
  $819C  D0 F4     BNE $8192
  $819E  A9 01     LDA #$01
  $81A0  85 20     STA $20
  $81A2  20 23 C7  JSR $C723
  $81A5  A9 18     LDA #$18
  $81A7  85 FD     STA $FD
  $81A9  A9 0A     LDA #$0A
  $81AB  20 51 C0  JSR $C051

L_81AE:
  $81AE  20 73 84  JSR $8473
  $81B1  20 AB C0  JSR $C0AB
  $81B4  C6 FD     DEC $FD
  $81B6  D0 F6     BNE $81AE
  $81B8  20 65 84  JSR $8465
  $81BB  A9 80     LDA #$80
  $81BD  8D 60 04  STA $0460
  $81C0  A9 20     LDA #$20
  $81C2  8D A0 04  STA $04A0
  $81C5  A9 00     LDA #$00
  $81C7  8D 80 06  STA $0680
  $81CA  8D A0 06  STA $06A0

L_81CD:
  $81CD  A9 00     LDA #$00
  $81CF  8D 80 06  STA $0680
  $81D2  18        CLC
  $81D3  AD A0 04  LDA $04A0
  $81D6  69 08     ADC #$08
  $81D8  8D A0 04  STA $04A0
  $81DB  C9 78     CMP #$78
  $81DD  F0 0F     BEQ $81EE
  $81DF  20 73 84  JSR $8473
  $81E2  20 D5 83  JSR $83D5
  $81E5  20 58 83  JSR $8358
  $81E8  20 AB C0  JSR $C0AB
  $81EB  4C CD 81  JMP $81CD

L_81EE:
  $81EE  EE A0 06  INC $06A0
  $81F1  A5 23     LDA $23
  $81F3  29 01     AND #$01
  $81F5  8D 20 04  STA $0420
  $81F8  A9 00     LDA #$00
  $81FA  85 FD     STA $FD
  $81FC  A9 08     LDA #$08
  $81FE  85 FE     STA $FE

L_8200:
  $8200  A9 00     LDA #$00
  $8202  8D 80 06  STA $0680
  $8205  C6 FE     DEC $FE
  $8207  D0 1A     BNE $8223
  $8209  A9 08     LDA #$08
  $820B  85 FE     STA $FE
  $820D  A6 FD     LDX $FD
  $820F  BD 21 85  LDA $8521,X
  $8212  8D 68 03  STA $0368
  $8215  BD 22 85  LDA $8522,X
  $8218  8D 69 03  STA $0369
  $821B  E8        INX
  $821C  E8        INX
  $821D  E0 10     CPX #$10
  $821F  F0 11     BEQ $8232
  $8221  86 FD     STX $FD

L_8223:
  $8223  20 73 84  JSR $8473
  $8226  20 D5 83  JSR $83D5
  $8229  20 58 83  JSR $8358
  $822C  20 AB C0  JSR $C0AB
  $822F  4C 00 82  JMP $8200

L_8232:
  $8232  A9 50     LDA #$50
  $8234  85 FD     STA $FD

L_8236:
  $8236  20 73 84  JSR $8473
  $8239  20 D5 83  JSR $83D5
  $823C  20 58 83  JSR $8358
  $823F  20 AB C0  JSR $C0AB
  $8242  C6 FD     DEC $FD
  $8244  D0 F0     BNE $8236
  $8246  A9 28     LDA #$28
  $8248  85 FD     STA $FD
  $824A  A9 26     LDA #$26
  $824C  8D B6 03  STA $03B6
  $824F  A9 0A     LDA #$0A
  $8251  8D B7 03  STA $03B7
  $8254  A5 2A     LDA $2A
  $8256  0A        ASL
  $8257  85 FE     STA $FE
  $8259  0A        ASL
  $825A  0A        ASL
  $825B  65 FE     ADC $FE
  $825D  85 FE     STA $FE

L_825F:
  $825F  A5 FD     LDA $FD
  $8261  29 03     AND #$03
  $8263  D0 11     BNE $8276
  $8265  A6 FE     LDX $FE
  $8267  BD D9 86  LDA $86D9,X
  $826A  8D B8 03  STA $03B8
  $826D  A9 01     LDA #$01
  $826F  85 47     STA $47
  $8271  E6 FE     INC $FE
  $8273  EE B7 03  INC $03B7

L_8276:
  $8276  20 73 84  JSR $8473
  $8279  20 D5 83  JSR $83D5
  $827C  20 58 83  JSR $8358
  $827F  20 AB C0  JSR $C0AB
  $8282  C6 FD     DEC $FD
  $8284  D0 D9     BNE $825F
  $8286  A9 BB     LDA #$BB
  $8288  85 FD     STA $FD

L_828A:
  $828A  20 73 84  JSR $8473
  $828D  20 D5 83  JSR $83D5
  $8290  20 58 83  JSR $8358
  $8293  20 AB C0  JSR $C0AB
  $8296  C6 FD     DEC $FD
  $8298  D0 F0     BNE $828A

L_829A:
  $829A  20 2D A5  JSR $A52D
  $829D  60        RTS

L_829E:
  $829E  A0 1F     LDY #$1F

L_82A0:
  $82A0  BD 99 84  LDA $8499,X
  $82A3  99 56 03  STA $0356,Y
  $82A6  CA        DEX
  $82A7  88        DEY
  $82A8  10 F6     BPL $82A0
  $82AA  60        RTS

L_82AB:
  $82AB  A5 27     LDA $27
  $82AD  4A        LSR
  $82AE  4A        LSR
  $82AF  4A        LSR
  $82B0  4A        LSR
  $82B1  F0 16     BEQ $82C9
  $82B3  C9 09     CMP #$09
  $82B5  B0 12     BCS $82C9
  $82B7  85 00     STA $00
  $82B9  C6 00     DEC $00
  $82BB  A5 2A     LDA $2A
  $82BD  0A        ASL
  $82BE  0A        ASL
  $82BF  0A        ASL
  $82C0  18        CLC
  $82C1  65 00     ADC $00
  $82C3  AA        TAX
  $82C4  BD CA 82  LDA $82CA,X
  $82C7  85 2A     STA $2A

L_82C9:
  $82C9  60        RTS
  $82CA  02        .db $02
  $82CB  06 00     ASL $00
  $82CD  08        PHP
  $82CE  00        BRK
  $82CF  00        BRK
  $82D0  00        BRK
  $82D1  04        .db $04
  $82D2  01 08     ORA ($08,X)
  $82D4  01 01     ORA ($01,X)
  $82D6  01 01     ORA ($01,X)
  $82D8  01 02     ORA ($02,X)
  $82DA  02        .db $02
  $82DB  00        BRK
  $82DC  02        .db $02
  $82DD  01 02     ORA ($02,X)
  $82DF  02        .db $02
  $82E0  02        .db $02
  $82E1  03        .db $03
  $82E2  03        .db $03
  $82E3  04        .db $04
  $82E4  03        .db $03
  $82E5  02        .db $02
  $82E6  03        .db $03
  $82E7  03        .db $03
  $82E8  03        .db $03
  $82E9  03        .db $03
  $82EA  03        .db $03
  $82EB  05 04     ORA $04
  $82ED  00        BRK
  $82EE  04        .db $04
  $82EF  04        .db $04
  $82F0  04        .db $04
  $82F1  04        .db $04
  $82F2  04        .db $04
  $82F3  05 05     ORA $05
  $82F5  06 05     ASL $05
  $82F7  05 05     ORA $05
  $82F9  05 00     ORA $00
  $82FB  06 06     ASL $06
  $82FD  07        .db $07
  $82FE  06 06     ASL $06
  $8300  06 05     ASL $05
  $8302  08        PHP
  $8303  07        .db $07
  $8304  07        .db $07
  $8305  07        .db $07
  $8306  07        .db $07
  $8307  07        .db $07
  $8308  07        .db $07
  $8309  06 01     ASL $01
  $830B  07        .db $07
  $830C  08        PHP
  $830D  08        PHP
  $830E  08        PHP
  $830F  08        PHP
  $8310  08        PHP
  $8311  00        BRK

L_8312:
  $8312  A5 1C     LDA $1C
  $8314  29 08     AND #$08
  $8316  D0 35     BNE $834D
  $8318  A4 2A     LDY $2A
  $831A  B9 1D 86  LDA $861D,Y
  $831D  85 09     STA $09
  $831F  B9 26 86  LDA $8626,Y
  $8322  85 08     STA $08
  $8324  A2 00     LDX #$00

L_8326:
  $8326  18        CLC
  $8327  BD 0D 86  LDA $860D,X
  $832A  65 09     ADC $09
  $832C  9D E0 02  STA $02E0,X
  $832F  E8        INX
  $8330  BD 0D 86  LDA $860D,X
  $8333  9D E0 02  STA $02E0,X
  $8336  E8        INX
  $8337  BD 0D 86  LDA $860D,X
  $833A  9D E0 02  STA $02E0,X
  $833D  E8        INX
  $833E  18        CLC
  $833F  BD 0D 86  LDA $860D,X
  $8342  65 08     ADC $08
  $8344  9D E0 02  STA $02E0,X
  $8347  E8        INX
  $8348  E0 10     CPX #$10
  $834A  D0 DA     BNE $8326
  $834C  60        RTS

L_834D:
  $834D  A9 F8     LDA #$F8
  $834F  A2 0F     LDX #$0F

L_8351:
  $8351  9D E0 02  STA $02E0,X
  $8354  CA        DEX
  $8355  10 FA     BPL $8351
  $8357  60        RTS

L_8358:
  $8358  A0 50     LDY #$50
  $835A  A2 00     LDX #$00
  $835C  A9 30     LDA #$30
  $835E  85 00     STA $00
  $8360  A9 02     LDA #$02
  $8362  85 03     STA $03

L_8364:
  $8364  84 04     STY $04
  $8366  86 05     STX $05
  $8368  AD 20 04  LDA $0420
  $836B  F0 0C     BEQ $8379
  $836D  A9 80     LDA #$80
  $836F  85 00     STA $00
  $8371  A5 1C     LDA $1C
  $8373  29 04     AND #$04
  $8375  D0 02     BNE $8379
  $8377  E6 00     INC $00

L_8379:
  $8379  A6 03     LDX $03
  $837B  BD A3 83  LDA $83A3,X
  $837E  85 01     STA $01
  $8380  18        CLC
  $8381  BD 81 04  LDA $0481,X
  $8384  7D A6 83  ADC $83A6,X
  $8387  9D 81 04  STA $0481,X
  $838A  BD 61 04  LDA $0461,X
  $838D  7D A9 83  ADC $83A9,X
  $8390  9D 61 04  STA $0461,X
  $8393  85 02     STA $02
  $8395  A6 05     LDX $05
  $8397  A4 04     LDY $04
  $8399  20 AC 83  JSR $83AC
  $839C  E6 00     INC $00
  $839E  C6 03     DEC $03
  $83A0  10 C2     BPL $8364
  $83A2  60        RTS
  $83A3  07        .db $07
  $83A4  0D 15 00  ORA $0015
  $83A7  47        .db $47
  $83A8  41 04     EOR ($04,X)
  $83AA  01 00     ORA ($00,X)

L_83AC:
  $83AC  BD 29 87  LDA $8729,X
  $83AF  99 00 02  STA $0200,Y
  $83B2  C8        INY
  $83B3  A5 00     LDA $00
  $83B5  99 00 02  STA $0200,Y
  $83B8  C8        INY
  $83B9  AD 20 04  LDA $0420
  $83BC  F0 02     BEQ $83C0
  $83BE  A9 40     LDA #$40

L_83C0:
  $83C0  99 00 02  STA $0200,Y
  $83C3  C8        INY
  $83C4  18        CLC
  $83C5  BD 2A 87  LDA $872A,X
  $83C8  65 02     ADC $02
  $83CA  99 00 02  STA $0200,Y
  $83CD  C8        INY
  $83CE  E8        INX
  $83CF  E8        INX
  $83D0  C6 01     DEC $01
  $83D2  D0 D8     BNE $83AC
  $83D4  60        RTS

L_83D5:
  $83D5  A6 2A     LDX $2A
  $83D7  EE 80 06  INC $0680
  $83DA  AD 80 06  LDA $0680
  $83DD  DD 91 87  CMP $8791,X
  $83E0  90 13     BCC $83F5
  $83E2  A9 00     LDA #$00
  $83E4  8D 80 06  STA $0680
  $83E7  EE A0 06  INC $06A0
  $83EA  BD 89 87  LDA $8789,X
  $83ED  CD A0 06  CMP $06A0
  $83F0  B0 03     BCS $83F5
  $83F2  8D A0 06  STA $06A0

L_83F5:
  $83F5  BD 81 87  LDA $8781,X
  $83F8  18        CLC
  $83F9  6D A0 06  ADC $06A0
  $83FC  AA        TAX
  $83FD  BC 99 87  LDY $8799,X
  $8400  B9 ED 87  LDA $87ED,Y
  $8403  85 08     STA $08
  $8405  B9 16 88  LDA $8816,Y
  $8408  85 09     STA $09
  $840A  A0 00     LDY #$00
  $840C  B1 08     LDA ($08),Y
  $840E  85 00     STA $00
  $8410  C8        INY
  $8411  A2 00     LDX #$00

L_8413:
  $8413  18        CLC
  $8414  AD A0 04  LDA $04A0
  $8417  71 08     ADC ($08),Y
  $8419  9D 00 02  STA $0200,X
  $841C  C8        INY
  $841D  E8        INX
  $841E  B1 08     LDA ($08),Y
  $8420  9D 00 02  STA $0200,X
  $8423  C8        INY
  $8424  E8        INX
  $8425  B1 08     LDA ($08),Y
  $8427  9D 00 02  STA $0200,X
  $842A  C8        INY
  $842B  E8        INX
  $842C  18        CLC
  $842D  AD 60 04  LDA $0460
  $8430  71 08     ADC ($08),Y
  $8432  9D 00 02  STA $0200,X
  $8435  E8        INX
  $8436  C8        INY
  $8437  C6 00     DEC $00
  $8439  D0 D8     BNE $8413
  $843B  60        RTS

L_843C:
  $843C  A9 00     LDA #$00
  $843E  20 44 C6  JSR $C644
  $8441  A9 20     LDA #$20
  $8443  8D 06 20  STA $2006
  $8446  A0 00     LDY #$00
  $8448  8C 06 20  STY $2006
  $844B  A9 AE     LDA #$AE
  $844D  85 09     STA $09
  $844F  A9 0B     LDA #$0B
  $8451  20 28 C6  JSR $C628
  $8454  A0 1F     LDY #$1F

L_8456:
  $8456  B9 3F 86  LDA $863F,Y
  $8459  A2 20     LDX #$20

L_845B:
  $845B  8D 07 20  STA $2007
  $845E  CA        DEX
  $845F  D0 FA     BNE $845B
  $8461  88        DEY
  $8462  10 F2     BPL $8456
  $8464  60        RTS

L_8465:
  $8465  A2 02     LDX #$02
  $8467  A9 00     LDA #$00

L_8469:
  $8469  9D 61 04  STA $0461,X
  $846C  9D 81 04  STA $0481,X
  $846F  CA        DEX
  $8470  10 F7     BPL $8469
  $8472  60        RTS

L_8473:
  $8473  A2 00     LDX #$00
  $8475  A9 F8     LDA #$F8

L_8477:
  $8477  9D 00 02  STA $0200,X
  $847A  E8        INX
  $847B  D0 FA     BNE $8477
  $847D  60        RTS

L_847E:
  $847E  A9 00     LDA #$00
  $8480  85 1F     STA $1F
  $8482  85 20     STA $20
  $8484  85 22     STA $22
  $8486  85 21     STA $21
  $8488  85 B5     STA $B5
  $848A  85 B6     STA $B6
  $848C  85 B7     STA $B7
  $848E  85 B8     STA $B8
  $8490  85 B9     STA $B9
  $8492  8D 54 03  STA $0354
  $8495  8D 55 03  STA $0355
  $8498  60        RTS
  $8499  0F        .db $0F
  $849A  20 11 2C  JSR $2C11
  $849D  0F        .db $0F
  $849E  20 29 19  JSR $1929
  $84A1  0F        .db $0F
  $84A2  19 37 17  ORA $1737,Y
  $84A5  0F        .db $0F
  $84A6  28        PLP
  $84A7  15 05     ORA $05,X
  $84A9  0F        .db $0F
  $84AA  30 36     BMI $84E2
  $84AC  26 0F     ROL $0F
  $84AE  0F        .db $0F
  $84AF  28        PLP
  $84B0  05 0F     ORA $0F
  $84B2  30 38     BMI $84EC
  $84B4  26 0F     ROL $0F
  $84B6  0F        .db $0F
  $84B7  36 26     ROL $26,X
  $84B9  20 30 10  JSR $1030
  $84BC  20 0F 30  JSR $300F
  $84BF  20 10 0F  JSR $0F10
  $84C2  10 20     BPL $84E4
  $84C4  10 0F     BPL $84D5
  $84C6  30 20     BMI $84E8
  $84C8  10 20     BPL $84EA
  $84CA  30 20     BMI $84EC
  $84CC  10 0F     BPL $84DD
  $84CE  30 20     BMI $84F0
  $84D0  10 0F     BPL $84E1
  $84D2  30 20     BMI $84F4
  $84D4  10 0F     BPL $84E5
  $84D6  30 20     BMI $84F8
  $84D8  10 0F     BPL $84E9
  $84DA  0F        .db $0F
  $84DB  0F        .db $0F
  $84DC  0F        .db $0F

L_84DD:
  $84DD  0F        .db $0F
  $84DE  0F        .db $0F
  $84DF  30 38     BMI $8519

L_84E1:
  $84E1  0F        .db $0F

L_84E2:
  $84E2  0F        .db $0F
  $84E3  28        PLP

L_84E4:
  $84E4  15 0F     ORA $0F,X
  $84E6  0F        .db $0F
  $84E7  28        PLP

L_84E8:
  $84E8  15 0F     ORA $0F,X

L_84EA:
  $84EA  0F        .db $0F
  $84EB  28        PLP

L_84EC:
  $84EC  11 0F     ORA ($0F),Y
  $84EE  0F        .db $0F
  $84EF  28        PLP

L_84F0:
  $84F0  11 0F     ORA ($0F),Y
  $84F2  0F        .db $0F
  $84F3  30 29     BMI $851E
  $84F5  0F        .db $0F
  $84F6  0F        .db $0F
  $84F7  36 17     ROL $17,X
  $84F9  0F        .db $0F
  $84FA  0F        .db $0F
  $84FB  30 19     BMI $8516
  $84FD  0F        .db $0F
  $84FE  0F        .db $0F
  $84FF  30 19     BMI $851A
  $8501  0F        .db $0F
  $8502  0F        .db $0F
  $8503  30 28     BMI $852D
  $8505  0F        .db $0F
  $8506  0F        .db $0F
  $8507  28        PLP
  $8508  15 0F     ORA $0F,X
  $850A  30 30     BMI $853C
  $850C  28        PLP
  $850D  0F        .db $0F
  $850E  0F        .db $0F
  $850F  30 12     BMI $8523
  $8511  0F        .db $0F
  $8512  0F        .db $0F
  $8513  30 15     BMI $852A
  $8515  0F        .db $0F

L_8516:
  $8516  0F        .db $0F
  $8517  28        PLP
  $8518  15 0F     ORA $0F,X

L_851A:
  $851A  0F        .db $0F
  $851B  30 30     BMI $854D
  $851D  0F        .db $0F

L_851E:
  $851E  0F        .db $0F
  $851F  30 16     BMI $8537
  $8521  00        BRK
  $8522  00        BRK

L_8523:
  $8523  07        .db $07
  $8524  10 17     BPL $853D
  $8526  20 17 20  JSR $2017
  $8529  17        .db $17

L_852A:
  $852A  20 17 20  JSR $2017

L_852D:
  $852D  17        .db $17
  $852E  20 17 20  JSR $2017
  $8531  21 20     AND ($20,X)
  $8533  21 20     AND ($20,X)
  $8535  20 22 22  JSR $2222
  $8538  22        .db $22
  $8539  86 8E     STX $8E
  $853B  96 86     STX $86,Y

L_853D:
  $853D  96 8E     STX $8E,Y
  $853F  86 96     STX $96
  $8541  29 0A     AND #$0A
  $8543  01 31     ORA ($31,X)
  $8545  28        PLP
  $8546  0B        .db $0B
  $8547  00        BRK
  $8548  3D 28 0C  AND $0C28,X
  $854B  00        BRK
  $854C  45 26     EOR $26
  $854E  27        .db $27
  $854F  02        .db $02
  $8550  78        SEI
  $8551  2E 25 01  ROL $0125
  $8554  76 2E     ROR $2E,X
  $8556  26 01     ROL $01
  $8558  7E 36 23  ROR $2336,X
  $855B  01 70     ORA ($70,X)
  $855D  36 24     ROL $24,X
  $855F  01 83     ORA ($83,X)
  $8561  17        .db $17
  $8562  2E 01 C8  ROL $C801
  $8565  26 28     ROL $28
  $8567  00        BRK
  $8568  C0 2E     CPY #$2E
  $856A  29 00     AND #$00
  $856C  B0 2E     BCS $859C
  $856E  2A        ROL
  $856F  00        BRK
  $8570  B8        CLV
  $8571  2E 2B 00  ROL $002B
  $8574  C0 36     CPY #$36
  $8576  2C 00 B8  BIT $B800
  $8579  36 2D     ROL $2D,X
  $857B  00        BRK
  $857C  C0 6C     CPY #$6C
  $857E  06 00     ASL $00
  $8580  3B        .db $3B
  $8581  6C 07 00  JMP ($0007)
  $8584  43        .db $43
  $8585  74        .db $74
  $8586  08        PHP
  $8587  00        BRK
  $8588  3B        .db $3B
  $8589  74        .db $74
  $858A  09 00     ORA #$00
  $858C  43        .db $43
  $858D  5F        .db $5F
  $858E  0D 00 B0  ORA $B000
  $8591  5F        .db $5F
  $8592  0E 00 B8  ASL $B800
  $8595  5F        .db $5F
  $8596  0F        .db $0F
  $8597  00        BRK
  $8598  C0 67     CPY #$67
  $859A  10 00     BPL $859C

L_859C:
  $859C  B0 67     BCS $8605
  $859E  11 00     ORA ($00),Y
  $85A0  B8        CLV
  $85A1  67        .db $67
  $85A2  12        .db $12
  $85A3  00        BRK
  $85A4  C0 6F     CPY #$6F
  $85A6  13        .db $13
  $85A7  00        BRK
  $85A8  B7        .db $B7
  $85A9  6F        .db $6F
  $85AA  14        .db $14
  $85AB  00        BRK
  $85AC  BF        .db $BF
  $85AD  77        .db $77
  $85AE  15 00     ORA $00,X
  $85B0  B7        .db $B7
  $85B1  77        .db $77
  $85B2  16 00     ASL $00,X
  $85B4  BF        .db $BF
  $85B5  9F        .db $9F
  $85B6  1F        .db $1F
  $85B7  00        BRK
  $85B8  38        SEC
  $85B9  A7        .db $A7
  $85BA  20 00 38  JSR $3800
  $85BD  AF        .db $AF
  $85BE  21 00     AND ($00,X)
  $85C0  3B        .db $3B
  $85C1  AF        .db $AF
  $85C2  22        .db $22
  $85C3  00        BRK
  $85C4  43        .db $43
  $85C5  A7        .db $A7
  $85C6  17        .db $17
  $85C7  01 71     ORA ($71,X)
  $85C9  A7        .db $A7
  $85CA  18        CLC
  $85CB  00        BRK
  $85CC  79 A7 19  ADC $19A7,Y
  $85CF  02        .db $02
  $85D0  81 AF     STA ($AF,X)
  $85D2  1A        .db $1A
  $85D3  01 71     ORA ($71,X)
  $85D5  AF        .db $AF
  $85D6  1B        .db $1B
  $85D7  00        BRK
  $85D8  79 AF 1C  ADC $1CAF,Y
  $85DB  00        BRK

L_85DC:
  $85DC  81 B7     STA ($B7,X)
  $85DE  1D 00 79  ORA $7900,X
  $85E1  B7        .db $B7
  $85E2  1E 00 81  ASL $8100,X
  $85E5  9D 04 00  STA $0004,X
  $85E8  C0 A5     CPY #$A5

L_85EA:
  $85EA  05 00     ORA $00

L_85EC:
  $85EC  C0 AD     CPY #$AD
  $85EE  00        BRK
  $85EF  00        BRK
  $85F0  B6 AD     LDX $AD,Y
  $85F2  01 00     ORA ($00,X)
  $85F4  BE B5 02  LDX $02B5,Y
  $85F7  00        BRK
  $85F8  B6 B5     LDX $B5,Y
  $85FA  03        .db $03
  $85FB  00        BRK
  $85FC  BE 3C 0C  LDX $0C3C,Y
  $85FF  4C 00 20  JMP $2000
  $8602  84 74     STY $74
  $8604  A4 10     LDY $10
  $8606  14        .db $14
  $8607  28        PLP
  $8608  0C        .db $0C
  $8609  1C        .db $1C
  $860A  20 10 18  JSR $1810
  $860D  F8        SED
  $860E  2F        .db $2F
  $860F  00        BRK
  $8610  F9 F8 2F  SBC $2FF8,Y
  $8613  00        BRK
  $8614  1F        .db $1F
  $8615  1E 2F 00  ASL $002F,X
  $8618  F9 1E 2F  SBC $2F1E,Y
  $861B  00        BRK
  $861C  1F        .db $1F
  $861D  60        RTS
  $861E  20 20 20  JSR $2020
  $8621  60        RTS
  $8622  A0 A0     LDY #$A0
  $8624  A0 60     LDY #$60
  $8626  70 30     BVS $8658
  $8628  70 B0     BVS $85DA
  $862A  B0 B0     BCS $85DC
  $862C  70 30     BVS $865E
  $862E  30 60     BMI $8690
  $8630  20 60 20  JSR $2060
  $8633  20 A0 A0  JSR $A0A0
  $8636  A0 30     LDY #$30
  $8638  70 B0     BVS $85EA
  $863A  30 B0     BMI $85EC
  $863C  70 30     BVS $866E
  $863E  B0 00     BCS $8640

L_8640:
  $8640  00        BRK
  $8641  00        BRK
  $8642  00        BRK
  $8643  00        BRK
  $8644  00        BRK
  $8645  00        BRK
  $8646  00        BRK
  $8647  00        BRK

L_8648:
  $8648  00        BRK
  $8649  00        BRK
  $864A  00        BRK
  $864B  00        BRK
  $864C  00        BRK
  $864D  2D 20 20  AND $2020
  $8650  20 20 20  JSR $2020
  $8653  20 2C 00  JSR $002C
  $8656  00        BRK
  $8657  00        BRK

L_8658:
  $8658  00        BRK
  $8659  00        BRK
  $865A  00        BRK
  $865B  00        BRK
  $865C  00        BRK
  $865D  00        BRK

L_865E:
  $865E  00        BRK
  $865F  08        PHP
  $8660  03        .db $03
  $8661  01 04     ORA ($04,X)
  $8663  02        .db $02
  $8664  07        .db $07
  $8665  05 06     ORA $06
  $8667  00        BRK
  $8668  00        BRK
  $8669  08        PHP
  $866A  02        .db $02
  $866B  10 04     BPL $8671
  $866D  20 80 40  JSR $4080
  $8670  01 98     ORA ($98,X)
  $8672  99 9A 9B  STA $9B9A,Y
  $8675  9C        .db $9C
  $8676  9D AB AC  STA $ACAB,X
  $8679  AD AA AB  LDA $ABAA
  $867C  AC AC AD  LDY $ADAC
  $867F  AE AF B0  LDX $B0AF
  $8682  B1 98     LDA ($98),Y
  $8684  99 9A 9B  STA $9B9A,Y
  $8687  9C        .db $9C
  $8688  9D 90 91  STA $9190,X
  $868B  92        .db $92
  $868C  93        .db $93
  $868D  94 95     STY $95,X
  $868F  9E        .db $9E

L_8690:
  $8690  9F        .db $9F
  $8691  96 97     STX $97,Y
  $8693  9E        .db $9E
  $8694  9F        .db $9F
  $8695  B0 B1     BCS $8648
  $8697  B2        .db $B2
  $8698  B3        .db $B3
  $8699  AA        TAX
  $869A  AB        .db $AB
  $869B  AE AF B0  LDX $B0AF
  $869E  B1 B2     LDA ($B2),Y
  $86A0  B3        .db $B3
  $86A1  06 06     ASL $06
  $86A3  06 06     ASL $06
  $86A5  06 06     ASL $06
  $86A7  05 05     ORA $05
  $86A9  05 06     ORA $06
  $86AB  06 06     ASL $06

L_86AD:
  $86AD  06 06     ASL $06
  $86AF  06 06     ASL $06
  $86B1  06 06     ASL $06
  $86B3  07        .db $07
  $86B4  07        .db $07
  $86B5  07        .db $07
  $86B6  07        .db $07
  $86B7  07        .db $07
  $86B8  07        .db $07
  $86B9  07        .db $07
  $86BA  07        .db $07
  $86BB  07        .db $07
  $86BC  07        .db $07
  $86BD  07        .db $07
  $86BE  07        .db $07
  $86BF  06 06     ASL $06
  $86C1  07        .db $07
  $86C2  07        .db $07
  $86C3  07        .db $07
  $86C4  07        .db $07
  $86C5  03        .db $03
  $86C6  03        .db $03
  $86C7  03        .db $03
  $86C8  03        .db $03
  $86C9  05 05     ORA $05
  $86CB  05 05     ORA $05
  $86CD  05 05     ORA $05
  $86CF  05 05     ORA $05
  $86D1  01 02     ORA ($02,X)
  $86D3  04        .db $04
  $86D4  08        PHP

L_86D5:
  $86D5  10 20     BPL $86F7
  $86D7  40        RTI
  $86D8  80        .db $80
  $86D9  20 08 05  JSR $0508
  $86DC  01 14     ORA ($14,X)
  $86DE  0D 01 0E  ORA $0E01
  $86E1  20 20 20  JSR $2020
  $86E4  20 01 09  JSR $0901
  $86E7  12        .db $12
  $86E8  0D 01 0E  ORA $0E01
  $86EB  20 20 20  JSR $2020
  $86EE  17        .db $17
  $86EF  0F        .db $0F
  $86F0  0F        .db $0F
  $86F1  04        .db $04
  $86F2  0D 01 0E  ORA $0E01
  $86F5  20 20 02  JSR $0220
  $86F8  15 02     ORA $02,X
  $86FA  02        .db $02
  $86FB  0C        .db $0C

L_86FC:
  $86FC  05 0D     ORA $0D
  $86FE  01 0E     ORA ($0E,X)
  $8700  20 20 11  JSR $1120
  $8703  15 09     ORA $09,X
  $8705  03        .db $03
  $8706  0B        .db $0B
  $8707  0D 01 0E  ORA $0E01
  $870A  20 20 06  JSR $0620
  $870D  0C        .db $0C
  $870E  01 13     ORA ($13,X)
  $8710  08        PHP
  $8711  0D 01 0E  ORA $0E01

L_8714:
  $8714  20 20 0D  JSR $0D20
  $8717  05 14     ORA $14
  $8719  01 0C     ORA ($0C,X)
  $871B  0D 01 0E  ORA $0E01
  $871E  20 20 03  JSR $0320
  $8721  12        .db $12
  $8722  01 13     ORA ($13,X)
  $8724  08        PHP
  $8725  0D 01 0E  ORA $0E01
  $8728  20 10 18  JSR $1810
  $872B  10 80     BPL $86AD
  $872D  10 D0     BPL $86FF
  $872F  14        .db $14
  $8730  40        RTI

L_8731:
  $8731  18        CLC
  $8732  90 28     BCC $875C
  $8734  78        SEI
  $8735  30 20     BMI $8757
  $8737  30 F8     BMI $8731
  $8739  38        SEC
  $873A  B0 40     BCS $877C
  $873C  E8        INX
  $873D  98        TYA
  $873E  90 A0     BCC $86E0
  $8740  40        RTI
  $8741  A0 E8     LDY #$E8
  $8743  B0 90     BCS $86D5
  $8745  B8        CLV
  $8746  68        PLA
  $8747  C0 18     CPY #$18
  $8749  C8        INY
  $874A  70 C8     BVS $8714
  $874C  C0 D0     CPY #$D0
  $874E  D8        CLD
  $874F  D8        CLD
  $8750  60        RTS
  $8751  D8        CLD
  $8752  C8        INY
  $8753  18        CLC
  $8754  50 08     BVC $875E
  $8756  50 18     BVC $8770
  $8758  F8        SED
  $8759  20 08 20  JSR $2008

L_875C:
  $875C  A8        TAY
  $875D  30 40     BMI $879F
  $875F  38        SEC
  $8760  D0 48     BNE $87AA
  $8762  50 98     BVC $86FC
  $8764  B8        CLV
  $8765  A8        TAY
  $8766  78        SEI
  $8767  B0 00     BCS $8769

L_8769:
  $8769  B8        CLV
  $876A  28        PLP
  $876B  C0 C8     CPY #$C8
  $876D  D0 20     BNE $878F
  $876F  E0 88     CPX #$88
  $8771  24 D0     BIT $D0
  $8773  34        .db $34
  $8774  88        DEY
  $8775  3C        .db $3C
  $8776  30 9C     BMI $8714
  $8778  20 A4 D0  JSR $D0A4
  $877B  B4 58     LDY $58,X
  $877D  D4        .db $D4
  $877E  E8        INX
  $877F  D4        .db $D4
  $8780  A0 00     LDY #$00
  $8782  18        CLC
  $8783  29 32     AND #$32
  $8785  37        .db $37
  $8786  41 49     EOR ($49,X)
  $8788  4F        .db $4F
  $8789  17        .db $17
  $878A  10 08     BPL $8794
  $878C  04        .db $04
  $878D  09 07     ORA #$07

L_878F:
  $878F  05 04     ORA $04
  $8791  02        .db $02
  $8792  03        .db $03
  $8793  08        PHP

L_8794:
  $8794  08        PHP
  $8795  05 06     ORA $06
  $8797  08        PHP
  $8798  08        PHP
  $8799  03        .db $03
  $879A  02        .db $02
  $879B  02        .db $02
  $879C  01 01     ORA ($01,X)
  $879E  00        BRK

L_879F:
  $879F  27        .db $27
  $87A0  28        PLP
  $87A1  27        .db $27
  $87A2  28        PLP
  $87A3  27        .db $27
  $87A4  28        PLP
  $87A5  27        .db $27
  $87A6  28        PLP
  $87A7  27        .db $27
  $87A8  28        PLP
  $87A9  27        .db $27

L_87AA:
  $87AA  28        PLP
  $87AB  27        .db $27
  $87AC  28        PLP
  $87AD  27        .db $27
  $87AE  28        PLP
  $87AF  27        .db $27
  $87B0  00        BRK
  $87B1  1E 1B 1B  ASL $1B1B,X
  $87B4  1C        .db $1C
  $87B5  1D 1C 1D  ORA $1D1C,X
  $87B8  1C        .db $1C
  $87B9  1D 1B 1C  ORA $1C1B,X
  $87BC  1D 1C 1D  ORA $1D1C,X
  $87BF  1C        .db $1C
  $87C0  1D 1B 26  ORA $261B,X
  $87C3  23        .db $23
  $87C4  24 25     BIT $25
  $87C6  24 25     BIT $25
  $87C8  24 25     BIT $25
  $87CA  23        .db $23
  $87CB  04        .db $04
  $87CC  04        .db $04
  $87CD  04        .db $04

L_87CE:
  $87CE  05 06     ORA $06
  $87D0  0F        .db $0F
  $87D1  07        .db $07
  $87D2  08        PHP
  $87D3  09 0A     ORA #$0A
  $87D5  0B        .db $0B
  $87D6  0C        .db $0C
  $87D7  0D 0E 09  ORA $090E
  $87DA  16 10     ASL $10,X
  $87DC  11 12     ORA ($12),Y
  $87DE  13        .db $13
  $87DF  14        .db $14
  $87E0  15 12     ORA $12,X
  $87E2  1A        .db $1A
  $87E3  17        .db $17
  $87E4  17        .db $17
  $87E5  17        .db $17
  $87E6  18        CLC
  $87E7  19 22 1F  ORA $1F22,Y
  $87EA  1F        .db $1F
  $87EB  20 21 3F  JSR $3F21
  $87EE  78        SEI
  $87EF  A9 D2     LDA #$D2
  $87F1  FF        .db $FF
  $87F2  28        PLP
  $87F3  59 8A BB  EOR $BB8A,Y
  $87F6  EC 1D 4E  CPX $4E1D
  $87F9  83        .db $83
  $87FA  B8        CLV

L_87FB:
  $87FB  ED 1E 4F  SBC $4F1E
  $87FE  84 BD     STY $BD
  $8800  F2        .db $F2
  $8801  27        .db $27
  $8802  5C        .db $5C
  $8803  91 CA     STA ($CA),Y

L_8805:
  $8805  EF        .db $EF
  $8806  1C        .db $1C
  $8807  41 6A     EOR ($6A,X)
  $8809  AF        .db $AF

L_880A:
  $880A  F8        SED
  $880B  41 8E     EOR ($8E,X)
  $880D  BB        .db $BB
  $880E  F0 25     BEQ $8835
  $8810  5E 9F DC  LSR $DC9F,X
  $8813  1D 62 A7  ORA $A762,X
  $8816  88        DEY
  $8817  88        DEY
  $8818  88        DEY
  $8819  88        DEY
  $881A  88        DEY
  $881B  89        .db $89
  $881C  89        .db $89
  $881D  89        .db $89
  $881E  89        .db $89
  $881F  89        .db $89
  $8820  8A        TXA
  $8821  8A        TXA
  $8822  8A        TXA
  $8823  8A        TXA
  $8824  8A        TXA
  $8825  8B        .db $8B

L_8826:
  $8826  8B        .db $8B
  $8827  8B        .db $8B
  $8828  8B        .db $8B
  $8829  8B        .db $8B
  $882A  8C 8C 8C  STY $8C8C
  $882D  8C 8C 8D  STY $8D8C
  $8830  8D 8D 8D  STA $8D8D
  $8833  8D 8E 8E  STA $8E8E
  $8836  8E 8E 8F  STX $8F8E
  $8839  8F        .db $8F
  $883A  8F        .db $8F
  $883B  8F        .db $8F
  $883C  90 90     BCC $87CE
  $883E  90 0E     BCC $884E

L_8840:
  $8840  E0 A0     CPX #$A0
  $8842  03        .db $03
  $8843  FA        .db $FA
  $8844  E8        INX

L_8845:
  $8845  A1 03     LDA ($03,X)
  $8847  F0 E8     BEQ $8831

L_8849:
  $8849  A2 03     LDX #$03
  $884B  F8        SED
  $884C  E8        INX
  $884D  A3        .db $A3

L_884E:
  $884E  03        .db $03
  $884F  00        BRK
  $8850  E8        INX
  $8851  A4 03     LDY $03
  $8853  08        PHP
  $8854  F0 A5     BEQ $87FB
  $8856  03        .db $03
  $8857  F0 F0     BEQ $8849
  $8859  A6 03     LDX $03
  $885B  F8        SED
  $885C  F0 A7     BEQ $8805
  $885E  03        .db $03
  $885F  00        BRK
  $8860  F0 A8     BEQ $880A
  $8862  03        .db $03
  $8863  08        PHP
  $8864  F0 C0     BEQ $8826
  $8866  01 FA     ORA ($FA,X)
  $8868  F8        SED
  $8869  A9 03     LDA #$03
  $886B  F0 F8     BEQ $8865

L_886D:
  $886D  AA        TAX
  $886E  03        .db $03
  $886F  F8        SED
  $8870  F8        SED
  $8871  AB        .db $AB
  $8872  03        .db $03
  $8873  00        BRK
  $8874  F8        SED
  $8875  AC 03 08  LDY $0803
  $8878  0C        .db $0C

L_8879:
  $8879  E0 AD     CPX #$AD
  $887B  03        .db $03
  $887C  FA        .db $FA
  $887D  E0 AD     CPX #$AD
  $887F  03        .db $03
  $8880  04        .db $04
  $8881  E8        INX
  $8882  AE 03 F4  LDX $F403
  $8885  E8        INX
  $8886  AF        .db $AF
  $8887  03        .db $03
  $8888  FC        .db $FC
  $8889  E8        INX
  $888A  B0 03     BCS $888F
  $888C  04        .db $04
  $888D  F0 B1     BEQ $8840

L_888F:
  $888F  03        .db $03
  $8890  F4        .db $F4
  $8891  F0 B2     BEQ $8845
  $8893  03        .db $03
  $8894  FC        .db $FC
  $8895  F0 B3     BEQ $884A
  $8897  03        .db $03
  $8898  04        .db $04
  $8899  EF        .db $EF
  $889A  C0 01     CPY #$01
  $889C  FA        .db $FA
  $889D  F8        SED
  $889E  B4 03     LDY $03,X
  $88A0  F4        .db $F4
  $88A1  F8        SED
  $88A2  B5 03     LDA $03,X
  $88A4  FC        .db $FC
  $88A5  F8        SED
  $88A6  B6 03     LDX $03,Y
  $88A8  04        .db $04
  $88A9  0A        ASL
  $88AA  E8        INX
  $88AB  B7        .db $B7
  $88AC  03        .db $03
  $88AD  F8        SED
  $88AE  E8        INX
  $88AF  B8        CLV
  $88B0  03        .db $03

L_88B1:
  $88B1  00        BRK
  $88B2  F0 B9     BEQ $886D
  $88B4  03        .db $03
  $88B5  F0 F0     BEQ $88A7
  $88B7  BA        TSX
  $88B8  03        .db $03
  $88B9  F8        SED
  $88BA  F0 BB     BEQ $8877
  $88BC  03        .db $03
  $88BD  00        BRK
  $88BE  F0 B9     BEQ $8879
  $88C0  43        .db $43
  $88C1  08        PHP
  $88C2  F8        SED
  $88C3  BC 03 F0  LDY $F003,X
  $88C6  F8        SED
  $88C7  BD 03 F8  LDA $F803,X
  $88CA  F8        SED
  $88CB  BE 03 00  LDX $0003,Y
  $88CE  F8        SED

L_88CF:
  $88CF  BF        .db $BF
  $88D0  03        .db $03
  $88D1  08        PHP
  $88D2  0B        .db $0B
  $88D3  E0 DC     CPX #$DC
  $88D5  03        .db $03
  $88D6  F8        SED
  $88D7  E0 DD     CPX #$DD

L_88D9:
  $88D9  03        .db $03
  $88DA  00        BRK
  $88DB  E8        INX
  $88DC  DE 03 F4  DEC $F403,X
  $88DF  E8        INX
  $88E0  E0 03     CPX #$03
  $88E2  FC        .db $FC
  $88E3  E8        INX
  $88E4  E1 03     SBC ($03,X)
  $88E6  04        .db $04
  $88E7  E9 C0     SBC #$C0
  $88E9  01 FA     ORA ($FA,X)
  $88EB  F0 E2     BEQ $88CF
  $88ED  03        .db $03

L_88EE:
  $88EE  F4        .db $F4
  $88EF  F0 E3     BEQ $88D4
  $88F1  03        .db $03
  $88F2  FC        .db $FC
  $88F3  F0 E4     BEQ $88D9
  $88F5  03        .db $03
  $88F6  04        .db $04
  $88F7  F8        SED

L_88F8:
  $88F8  E5 03     SBC $03
  $88FA  F7        .db $F7
  $88FB  F8        SED
  $88FC  E6 03     INC $03
  $88FE  04        .db $04
  $88FF  0A        ASL
  $8900  E0 A0     CPX #$A0
  $8902  03        .db $03
  $8903  F8        SED
  $8904  E8        INX
  $8905  A1 03     LDA ($03,X)
  $8907  F7        .db $F7
  $8908  E8        INX
  $8909  A2 03     LDX #$03
  $890B  FF        .db $FF
  $890C  F0 A3     BEQ $88B1
  $890E  03        .db $03
  $890F  F0 F0     BEQ $8901
  $8911  A4 03     LDY $03
  $8913  F8        SED
  $8914  F0 A5     BEQ $88BB
  $8916  03        .db $03
  $8917  00        BRK
  $8918  F8        SED
  $8919  A6 03     LDX $03
  $891B  F0 F8     BEQ $8915
  $891D  A7        .db $A7
  $891E  03        .db $03
  $891F  F8        SED
  $8920  F8        SED
  $8921  A8        TAY
  $8922  03        .db $03
  $8923  00        BRK
  $8924  F8        SED
  $8925  A9 03     LDA #$03
  $8927  08        PHP
  $8928  0C        .db $0C
  $8929  E0 AA     CPX #$AA
  $892B  03        .db $03
  $892C  F2        .db $F2
  $892D  E0 AB     CPX #$AB
  $892F  03        .db $03

L_8930:
  $8930  F8        SED
  $8931  E8        INX

L_8932:
  $8932  AC 03 F0  LDY $F003

L_8935:
  $8935  E8        INX
  $8936  AD 03 F8  LDA $F803
  $8939  E8        INX
  $893A  AE 03 00  LDX $0003
  $893D  F0 AF     BEQ $88EE
  $893F  03        .db $03
  $8940  F0 F0     BEQ $8932
  $8942  B0 03     BCS $8947
  $8944  F8        SED
  $8945  F0 B1     BEQ $88F8

L_8947:
  $8947  03        .db $03
  $8948  00        BRK
  $8949  F8        SED

L_894A:
  $894A  B2        .db $B2
  $894B  03        .db $03
  $894C  F0 F8     BEQ $8946
  $894E  B3        .db $B3

L_894F:
  $894F  03        .db $03
  $8950  F8        SED
  $8951  F8        SED
  $8952  B4 03     LDY $03,X

L_8954:
  $8954  00        BRK
  $8955  F8        SED
  $8956  B5 03     LDA $03,X
  $8958  08        PHP
  $8959  0C        .db $0C
  $895A  E0 B6     CPX #$B6
  $895C  03        .db $03
  $895D  F8        SED
  $895E  E8        INX

L_895F:
  $895F  B7        .db $B7
  $8960  03        .db $03
  $8961  F3        .db $F3
  $8962  E8        INX
  $8963  B8        CLV
  $8964  03        .db $03
  $8965  FB        .db $FB
  $8966  E8        INX
  $8967  B9 03 03  LDA $0303,Y
  $896A  F0 BA     BEQ $8926
  $896C  03        .db $03
  $896D  F0 F0     BEQ $895F
  $896F  BB        .db $BB
  $8970  03        .db $03
  $8971  F8        SED
  $8972  F0 BC     BEQ $8930
  $8974  03        .db $03
  $8975  00        BRK
  $8976  F0 BD     BEQ $8935
  $8978  03        .db $03
  $8979  08        PHP
  $897A  F8        SED
  $897B  BE 03 F0  LDX $F003,Y
  $897E  F8        SED
  $897F  BF        .db $BF
  $8980  03        .db $03
  $8981  F8        SED
  $8982  F8        SED
  $8983  C0 03     CPY #$03
  $8985  00        BRK
  $8986  F8        SED
  $8987  C1 03     CMP ($03,X)
  $8989  08        PHP
  $898A  0C        .db $0C
  $898B  E0 A0     CPX #$A0
  $898D  03        .db $03
  $898E  F4        .db $F4

L_898F:
  $898F  E0 A1     CPX #$A1
  $8991  03        .db $03
  $8992  04        .db $04
  $8993  E8        INX

L_8994:
  $8994  A2 03     LDX #$03
  $8996  F4        .db $F4
  $8997  E8        INX
  $8998  A3        .db $A3

L_8999:
  $8999  03        .db $03
  $899A  FC        .db $FC
  $899B  E8        INX
  $899C  A4 03     LDY $03
  $899E  04        .db $04
  $899F  EC BF 01  CPX $01BF
  $89A2  FC        .db $FC
  $89A3  F0 A5     BEQ $894A
  $89A5  03        .db $03
  $89A6  F4        .db $F4
  $89A7  F0 A6     BEQ $894F
  $89A9  03        .db $03
  $89AA  FC        .db $FC
  $89AB  F0 A7     BEQ $8954
  $89AD  03        .db $03
  $89AE  04        .db $04
  $89AF  F8        SED
  $89B0  A8        TAY
  $89B1  03        .db $03

L_89B2:
  $89B2  F4        .db $F4
  $89B3  F8        SED
  $89B4  A9 03     LDA #$03
  $89B6  FC        .db $FC

L_89B7:
  $89B7  F8        SED
  $89B8  AA        TAX
  $89B9  03        .db $03
  $89BA  04        .db $04
  $89BB  0C        .db $0C

L_89BC:
  $89BC  E0 A0     CPX #$A0
  $89BE  03        .db $03
  $89BF  F0 E0     BEQ $89A1
  $89C1  A1 03     LDA ($03,X)
  $89C3  00        BRK
  $89C4  E8        INX
  $89C5  B6 03     LDX $03,Y
  $89C7  EC E8 B7  CPX $B7E8
  $89CA  03        .db $03
  $89CB  F4        .db $F4
  $89CC  E8        INX
  $89CD  B8        CLV
  $89CE  03        .db $03
  $89CF  FC        .db $FC
  $89D0  EC BF 01  CPX $01BF
  $89D3  F8        SED
  $89D4  F0 B9     BEQ $898F
  $89D6  03        .db $03
  $89D7  F4        .db $F4
  $89D8  F0 BA     BEQ $8994
  $89DA  03        .db $03
  $89DB  FC        .db $FC
  $89DC  F0 BB     BEQ $8999
  $89DE  03        .db $03
  $89DF  04        .db $04
  $89E0  F8        SED
  $89E1  BC 03 F4  LDY $F403,X
  $89E4  F8        SED
  $89E5  BD 03 FC  LDA $FC03,X

L_89E8:
  $89E8  F8        SED
  $89E9  BE 03 04  LDX $0403,Y
  $89EC  0C        .db $0C

L_89ED:
  $89ED  E0 AB     CPX #$AB
  $89EF  03        .db $03
  $89F0  04        .db $04
  $89F1  E8        INX
  $89F2  AC 03 F4  LDY $F403
  $89F5  E8        INX
  $89F6  AD 03 FC  LDA $FC03
  $89F9  E8        INX
  $89FA  AE 03 04  LDX $0403
  $89FD  EE BF 01  INC $01BF
  $8A00  FB        .db $FB
  $8A01  F0 AF     BEQ $89B2
  $8A03  03        .db $03
  $8A04  F4        .db $F4
  $8A05  F0 B0     BEQ $89B7
  $8A07  03        .db $03
  $8A08  FC        .db $FC
  $8A09  F0 B1     BEQ $89BC
  $8A0B  03        .db $03
  $8A0C  04        .db $04
  $8A0D  F8        SED
  $8A0E  B2        .db $B2
  $8A0F  03        .db $03
  $8A10  EC F8 B3  CPX $B3F8
  $8A13  03        .db $03
  $8A14  F4        .db $F4
  $8A15  F8        SED
  $8A16  B4 03     LDY $03,X

L_8A18:
  $8A18  FC        .db $FC
  $8A19  F8        SED
  $8A1A  B5 03     LDA $03,X
  $8A1C  04        .db $04

L_8A1D:
  $8A1D  0C        .db $0C
  $8A1E  E0 AB     CPX #$AB
  $8A20  03        .db $03
  $8A21  04        .db $04

L_8A22:
  $8A22  E8        INX
  $8A23  C0 02     CPY #$02
  $8A25  F4        .db $F4
  $8A26  E8        INX
  $8A27  AD 03 FC  LDA $FC03
  $8A2A  E8        INX
  $8A2B  AE 03 04  LDX $0403
  $8A2E  EE BF 01  INC $01BF
  $8A31  FB        .db $FB
  $8A32  F0 AF     BEQ $89E3
  $8A34  03        .db $03
  $8A35  F4        .db $F4
  $8A36  F0 B0     BEQ $89E8
  $8A38  03        .db $03
  $8A39  FC        .db $FC
  $8A3A  F0 B1     BEQ $89ED
  $8A3C  03        .db $03
  $8A3D  04        .db $04
  $8A3E  F8        SED
  $8A3F  B2        .db $B2
  $8A40  03        .db $03
  $8A41  EC F8 B3  CPX $B3F8
  $8A44  03        .db $03
  $8A45  F4        .db $F4
  $8A46  F8        SED
  $8A47  B4 03     LDY $03,X
  $8A49  FC        .db $FC
  $8A4A  F8        SED
  $8A4B  B5 03     LDA $03,X

L_8A4D:
  $8A4D  04        .db $04
  $8A4E  0D E0 AB  ORA $ABE0
  $8A51  03        .db $03

L_8A52:
  $8A52  04        .db $04
  $8A53  E8        INX
  $8A54  C1 03     CMP ($03,X)
  $8A56  F4        .db $F4

L_8A57:
  $8A57  E8        INX
  $8A58  C2        .db $C2
  $8A59  02        .db $02
  $8A5A  FC        .db $FC
  $8A5B  E8        INX
  $8A5C  C3        .db $C3
  $8A5D  03        .db $03
  $8A5E  FC        .db $FC
  $8A5F  E8        INX
  $8A60  AE 03 04  LDX $0403
  $8A63  EE BF 01  INC $01BF
  $8A66  FB        .db $FB
  $8A67  F0 AF     BEQ $8A18
  $8A69  03        .db $03
  $8A6A  F4        .db $F4
  $8A6B  F0 B0     BEQ $8A1D
  $8A6D  03        .db $03
  $8A6E  FC        .db $FC
  $8A6F  F0 B1     BEQ $8A22
  $8A71  03        .db $03
  $8A72  04        .db $04
  $8A73  F8        SED
  $8A74  B2        .db $B2
  $8A75  03        .db $03
  $8A76  EC F8 B3  CPX $B3F8
  $8A79  03        .db $03
  $8A7A  F4        .db $F4
  $8A7B  F8        SED
  $8A7C  B4 03     LDY $03,X
  $8A7E  FC        .db $FC
  $8A7F  F8        SED
  $8A80  B5 03     LDA $03,X

L_8A82:
  $8A82  04        .db $04
  $8A83  0D E0 C5  ORA $C5E0
  $8A86  02        .db $02

L_8A87:
  $8A87  04        .db $04
  $8A88  E8        INX
  $8A89  AC 03 F4  LDY $F403

L_8A8C:
  $8A8C  E8        INX
  $8A8D  C4 02     CPY $02
  $8A8F  FC        .db $FC
  $8A90  E8        INX
  $8A91  C3        .db $C3
  $8A92  03        .db $03
  $8A93  FC        .db $FC
  $8A94  E8        INX
  $8A95  AE 03 04  LDX $0403
  $8A98  EE BF 01  INC $01BF
  $8A9B  FB        .db $FB
  $8A9C  F0 AF     BEQ $8A4D
  $8A9E  03        .db $03
  $8A9F  F4        .db $F4
  $8AA0  F0 B0     BEQ $8A52
  $8AA2  03        .db $03
  $8AA3  FC        .db $FC
  $8AA4  F0 B1     BEQ $8A57
  $8AA6  03        .db $03
  $8AA7  04        .db $04
  $8AA8  F8        SED
  $8AA9  B2        .db $B2
  $8AAA  03        .db $03
  $8AAB  EC F8 B3  CPX $B3F8
  $8AAE  03        .db $03
  $8AAF  F4        .db $F4
  $8AB0  F8        SED
  $8AB1  B4 03     LDY $03,X

L_8AB3:
  $8AB3  FC        .db $FC
  $8AB4  F8        SED
  $8AB5  B5 03     LDA $03,X
  $8AB7  04        .db $04

L_8AB8:
  $8AB8  0D E0 C6  ORA $C6E0
  $8ABB  02        .db $02
  $8ABC  04        .db $04

L_8ABD:
  $8ABD  E8        INX
  $8ABE  AC 03 F4  LDY $F403
  $8AC1  E8        INX
  $8AC2  AD 03 FC  LDA $FC03
  $8AC5  E8        INX
  $8AC6  AE 03 04  LDX $0403
  $8AC9  E8        INX
  $8ACA  C7        .db $C7
  $8ACB  02        .db $02
  $8ACC  04        .db $04
  $8ACD  EE BF 01  INC $01BF
  $8AD0  FB        .db $FB
  $8AD1  F0 AF     BEQ $8A82
  $8AD3  03        .db $03
  $8AD4  F4        .db $F4
  $8AD5  F0 B0     BEQ $8A87
  $8AD7  03        .db $03
  $8AD8  FC        .db $FC
  $8AD9  F0 B1     BEQ $8A8C
  $8ADB  03        .db $03
  $8ADC  04        .db $04
  $8ADD  F8        SED
  $8ADE  B2        .db $B2
  $8ADF  03        .db $03
  $8AE0  EC F8 B3  CPX $B3F8
  $8AE3  03        .db $03
  $8AE4  F4        .db $F4
  $8AE5  F8        SED
  $8AE6  B4 03     LDY $03,X
  $8AE8  FC        .db $FC
  $8AE9  F8        SED
  $8AEA  B5 03     LDA $03,X
  $8AEC  04        .db $04
  $8AED  0C        .db $0C
  $8AEE  E0 C8     CPX #$C8
  $8AF0  02        .db $02
  $8AF1  04        .db $04
  $8AF2  E8        INX
  $8AF3  AC 03 F4  LDY $F403
  $8AF6  E8        INX
  $8AF7  AD 03 FC  LDA $FC03
  $8AFA  E8        INX
  $8AFB  AE 03 04  LDX $0403
  $8AFE  EE BF 01  INC $01BF
  $8B01  FB        .db $FB
  $8B02  F0 AF     BEQ $8AB3
  $8B04  03        .db $03
  $8B05  F4        .db $F4
  $8B06  F0 B0     BEQ $8AB8
  $8B08  03        .db $03
  $8B09  FC        .db $FC

L_8B0A:
  $8B0A  F0 B1     BEQ $8ABD
  $8B0C  03        .db $03
  $8B0D  04        .db $04
  $8B0E  F8        SED
  $8B0F  B2        .db $B2
  $8B10  03        .db $03
  $8B11  EC F8 B3  CPX $B3F8

L_8B14:
  $8B14  03        .db $03
  $8B15  F4        .db $F4
  $8B16  F8        SED
  $8B17  B4 03     LDY $03,X

L_8B19:
  $8B19  FC        .db $FC
  $8B1A  F8        SED
  $8B1B  B5 03     LDA $03,X
  $8B1D  04        .db $04
  $8B1E  0C        .db $0C
  $8B1F  E0 A0     CPX #$A0
  $8B21  03        .db $03
  $8B22  F3        .db $F3
  $8B23  E0 A1     CPX #$A1
  $8B25  03        .db $03
  $8B26  03        .db $03
  $8B27  E8        INX
  $8B28  F5 03     SBC $03,X
  $8B2A  F2        .db $F2
  $8B2B  E8        INX
  $8B2C  F6 03     INC $03,X
  $8B2E  FA        .db $FA
  $8B2F  E8        INX
  $8B30  F7        .db $F7

L_8B31:
  $8B31  03        .db $03
  $8B32  02        .db $02
  $8B33  EC BF 01  CPX $01BF

L_8B36:
  $8B36  FB        .db $FB
  $8B37  F0 F8     BEQ $8B31
  $8B39  03        .db $03
  $8B3A  F4        .db $F4

L_8B3B:
  $8B3B  F0 F9     BEQ $8B36
  $8B3D  03        .db $03
  $8B3E  FC        .db $FC
  $8B3F  F0 FA     BEQ $8B3B
  $8B41  03        .db $03
  $8B42  04        .db $04
  $8B43  F8        SED
  $8B44  FB        .db $FB
  $8B45  03        .db $03
  $8B46  F4        .db $F4
  $8B47  F8        SED
  $8B48  FC        .db $FC
  $8B49  03        .db $03
  $8B4A  FC        .db $FC
  $8B4B  00        BRK
  $8B4C  FD 03 FD  SBC $FD03,X
  $8B4F  0D E0 A0  ORA $A0E0
  $8B52  03        .db $03
  $8B53  FC        .db $FC

L_8B54:
  $8B54  E8        INX
  $8B55  A1 03     LDA ($03,X)
  $8B57  F6 E8     INC $E8,X

L_8B59:
  $8B59  A2 03     LDX #$03
  $8B5B  FE E8 A3  INC $A3E8,X

L_8B5E:
  $8B5E  03        .db $03
  $8B5F  06 EB     ASL $EB
  $8B61  F4        .db $F4
  $8B62  01 FB     ORA ($FB,X)
  $8B64  F0 A4     BEQ $8B0A
  $8B66  03        .db $03
  $8B67  F0 F0     BEQ $8B59
  $8B69  A5 03     LDA $03
  $8B6B  F8        SED
  $8B6C  F0 A6     BEQ $8B14
  $8B6E  03        .db $03
  $8B6F  00        BRK
  $8B70  F0 A7     BEQ $8B19
  $8B72  03        .db $03
  $8B73  08        PHP
  $8B74  F8        SED
  $8B75  A8        TAY
  $8B76  03        .db $03
  $8B77  F0 F8     BEQ $8B71
  $8B79  A9 03     LDA #$03
  $8B7B  F8        SED
  $8B7C  F8        SED
  $8B7D  AA        TAX
  $8B7E  03        .db $03
  $8B7F  00        BRK
  $8B80  F8        SED
  $8B81  AB        .db $AB
  $8B82  03        .db $03
  $8B83  08        PHP
  $8B84  0E E0 AC  ASL $ACE0
  $8B87  03        .db $03
  $8B88  F1 E0     SBC ($E0),Y
  $8B8A  A0 03     LDY #$03
  $8B8C  FE E8 AD  INC $ADE8,X
  $8B8F  03        .db $03
  $8B90  F0 E8     BEQ $8B7A
  $8B92  AE 03 F8  LDX $F803
  $8B95  E8        INX
  $8B96  AF        .db $AF
  $8B97  03        .db $03
  $8B98  00        BRK
  $8B99  E8        INX

L_8B9A:
  $8B9A  B0 03     BCS $8B9F
  $8B9C  08        PHP
  $8B9D  EB        .db $EB
  $8B9E  F4        .db $F4

L_8B9F:
  $8B9F  01 FD     ORA ($FD,X)
  $8BA1  F0 B1     BEQ $8B54
  $8BA3  03        .db $03
  $8BA4  F8        SED
  $8BA5  F0 B2     BEQ $8B59
  $8BA7  03        .db $03
  $8BA8  00        BRK
  $8BA9  F0 B3     BEQ $8B5E

L_8BAB:
  $8BAB  03        .db $03
  $8BAC  08        PHP
  $8BAD  F8        SED
  $8BAE  B4 03     LDY $03,X
  $8BB0  F0 F8     BEQ $8BAA
  $8BB2  B5 03     LDA $03,X
  $8BB4  F8        SED
  $8BB5  F8        SED
  $8BB6  B6 03     LDX $03,Y
  $8BB8  00        BRK
  $8BB9  F8        SED
  $8BBA  B7        .db $B7
  $8BBB  03        .db $03
  $8BBC  08        PHP
  $8BBD  0D E8 B8  ORA $B8E8
  $8BC0  03        .db $03
  $8BC1  F0 E8     BEQ $8BAB
  $8BC3  B9 03 F8  LDA $F803,Y
  $8BC6  E8        INX

L_8BC7:
  $8BC7  BA        TSX
  $8BC8  03        .db $03
  $8BC9  00        BRK
  $8BCA  E8        INX
  $8BCB  BB        .db $BB
  $8BCC  03        .db $03
  $8BCD  08        PHP
  $8BCE  ED F4 01  SBC $01F4
  $8BD1  FD F0 BC  SBC $BCF0,X

L_8BD4:
  $8BD4  03        .db $03
  $8BD5  F0 F0     BEQ $8BC7
  $8BD7  BD 03 F8  LDA $F803,X
  $8BDA  F0 BE     BEQ $8B9A
  $8BDC  03        .db $03
  $8BDD  00        BRK
  $8BDE  F0 BF     BEQ $8B9F

L_8BE0:
  $8BE0  03        .db $03
  $8BE1  08        PHP
  $8BE2  F8        SED
  $8BE3  C0 03     CPY #$03
  $8BE5  F0 F8     BEQ $8BDF
  $8BE7  C1 03     CMP ($03,X)
  $8BE9  F8        SED
  $8BEA  F8        SED
  $8BEB  C2        .db $C2
  $8BEC  03        .db $03
  $8BED  00        BRK
  $8BEE  F8        SED
  $8BEF  C3        .db $C3
  $8BF0  03        .db $03
  $8BF1  08        PHP
  $8BF2  0D E8 B8  ORA $B8E8
  $8BF5  03        .db $03
  $8BF6  F0 E8     BEQ $8BE0
  $8BF8  C4 03     CPY $03
  $8BFA  F8        SED
  $8BFB  E8        INX

L_8BFC:
  $8BFC  C5 03     CMP $03
  $8BFE  00        BRK
  $8BFF  E8        INX
  $8C00  BB        .db $BB
  $8C01  03        .db $03
  $8C02  08        PHP
  $8C03  ED F4 01  SBC $01F4
  $8C06  FD F0 BC  SBC $BCF0,X

L_8C09:
  $8C09  03        .db $03
  $8C0A  F0 F0     BEQ $8BFC
  $8C0C  BD 03 F8  LDA $F803,X
  $8C0F  F0 BE     BEQ $8BCF
  $8C11  03        .db $03
  $8C12  00        BRK
  $8C13  F0 BF     BEQ $8BD4

L_8C15:
  $8C15  03        .db $03
  $8C16  08        PHP
  $8C17  F8        SED
  $8C18  C0 03     CPY #$03
  $8C1A  F0 F8     BEQ $8C14
  $8C1C  C1 03     CMP ($03,X)
  $8C1E  F8        SED
  $8C1F  F8        SED
  $8C20  C2        .db $C2
  $8C21  03        .db $03
  $8C22  00        BRK
  $8C23  F8        SED
  $8C24  C3        .db $C3

L_8C25:
  $8C25  03        .db $03
  $8C26  08        PHP
  $8C27  0D E8 B8  ORA $B8E8
  $8C2A  03        .db $03
  $8C2B  F0 E8     BEQ $8C15
  $8C2D  B9 03 F8  LDA $F803,Y
  $8C30  E8        INX

L_8C31:
  $8C31  BA        TSX
  $8C32  03        .db $03
  $8C33  00        BRK
  $8C34  E8        INX
  $8C35  BB        .db $BB
  $8C36  03        .db $03
  $8C37  08        PHP
  $8C38  ED F4 01  SBC $01F4
  $8C3B  FD F0 BC  SBC $BCF0,X

L_8C3E:
  $8C3E  03        .db $03
  $8C3F  F0 F0     BEQ $8C31
  $8C41  BD 02 F8  LDA $F802,X
  $8C44  F0 BE     BEQ $8C04
  $8C46  02        .db $02
  $8C47  00        BRK
  $8C48  F0 BF     BEQ $8C09

L_8C4A:
  $8C4A  03        .db $03
  $8C4B  08        PHP
  $8C4C  F8        SED
  $8C4D  C0 03     CPY #$03
  $8C4F  F0 F8     BEQ $8C49
  $8C51  C6 03     DEC $03
  $8C53  F8        SED
  $8C54  F8        SED
  $8C55  C7        .db $C7
  $8C56  03        .db $03
  $8C57  00        BRK
  $8C58  F8        SED
  $8C59  C3        .db $C3
  $8C5A  03        .db $03
  $8C5B  08        PHP
  $8C5C  0D E8 B8  ORA $B8E8
  $8C5F  02        .db $02
  $8C60  F0 E8     BEQ $8C4A
  $8C62  B9 02 F8  LDA $F802,Y
  $8C65  E8        INX

L_8C66:
  $8C66  BA        TSX
  $8C67  02        .db $02
  $8C68  00        BRK
  $8C69  E8        INX
  $8C6A  BB        .db $BB
  $8C6B  02        .db $02
  $8C6C  08        PHP
  $8C6D  ED F4 01  SBC $01F4
  $8C70  FD F0 BC  SBC $BCF0,X
  $8C73  02        .db $02
  $8C74  F0 F0     BEQ $8C66
  $8C76  BD 03 F8  LDA $F803,X
  $8C79  F0 BE     BEQ $8C39
  $8C7B  03        .db $03

L_8C7C:
  $8C7C  00        BRK
  $8C7D  F0 BF     BEQ $8C3E
  $8C7F  02        .db $02
  $8C80  08        PHP

L_8C81:
  $8C81  F8        SED
  $8C82  C0 02     CPY #$02
  $8C84  F0 F8     BEQ $8C7E

L_8C86:
  $8C86  C8        INY

L_8C87:
  $8C87  02        .db $02
  $8C88  F8        SED
  $8C89  F8        SED
  $8C8A  C9 03     CMP #$03
  $8C8C  00        BRK
  $8C8D  F8        SED
  $8C8E  C3        .db $C3
  $8C8F  02        .db $02

L_8C90:
  $8C90  08        PHP
  $8C91  0E E0 AC  ASL $ACE0
  $8C94  03        .db $03
  $8C95  F1 E0     SBC ($E0),Y
  $8C97  A0 03     LDY #$03
  $8C99  FE E8 AD  INC $ADE8,X
  $8C9C  03        .db $03
  $8C9D  F0 E8     BEQ $8C87
  $8C9F  AE 03 F8  LDX $F803
  $8CA2  E8        INX
  $8CA3  AF        .db $AF
  $8CA4  03        .db $03
  $8CA5  00        BRK
  $8CA6  E8        INX
  $8CA7  B0 03     BCS $8CAC
  $8CA9  08        PHP
  $8CAA  EB        .db $EB
  $8CAB  F4        .db $F4

L_8CAC:
  $8CAC  01 FD     ORA ($FD,X)
  $8CAE  F0 D6     BEQ $8C86
  $8CB0  03        .db $03
  $8CB1  F8        SED
  $8CB2  F0 D7     BEQ $8C8B
  $8CB4  03        .db $03
  $8CB5  00        BRK
  $8CB6  F0 D8     BEQ $8C90
  $8CB8  03        .db $03
  $8CB9  08        PHP
  $8CBA  F8        SED
  $8CBB  D9 03 F8  CMP $F803,Y
  $8CBE  F8        SED
  $8CBF  DA        .db $DA
  $8CC0  03        .db $03
  $8CC1  00        BRK
  $8CC2  00        BRK
  $8CC3  DB        .db $DB
  $8CC4  03        .db $03
  $8CC5  F8        SED
  $8CC6  00        BRK
  $8CC7  DC        .db $DC
  $8CC8  03        .db $03
  $8CC9  00        BRK
  $8CCA  09 E8     ORA #$E8
  $8CCC  A1 03     LDA ($03,X)
  $8CCE  F8        SED
  $8CCF  E8        INX
  $8CD0  A2 03     LDX #$03
  $8CD2  00        BRK
  $8CD3  E9 A0     SBC #$A0
  $8CD5  01 F9     ORA ($F9,X)
  $8CD7  F0 A3     BEQ $8C7C
  $8CD9  03        .db $03
  $8CDA  F4        .db $F4
  $8CDB  F0 A4     BEQ $8C81
  $8CDD  03        .db $03
  $8CDE  FC        .db $FC
  $8CDF  F0 A5     BEQ $8C86
  $8CE1  03        .db $03
  $8CE2  04        .db $04
  $8CE3  F8        SED
  $8CE4  A6 03     LDX $03
  $8CE6  F4        .db $F4
  $8CE7  F8        SED
  $8CE8  A7        .db $A7
  $8CE9  03        .db $03
  $8CEA  FC        .db $FC
  $8CEB  F8        SED
  $8CEC  A8        TAY
  $8CED  03        .db $03
  $8CEE  04        .db $04
  $8CEF  0B        .db $0B
  $8CF0  E8        INX
  $8CF1  A9 03     LDA #$03
  $8CF3  F4        .db $F4
  $8CF4  E8        INX
  $8CF5  AA        TAX
  $8CF6  03        .db $03
  $8CF7  FC        .db $FC
  $8CF8  E8        INX
  $8CF9  AB        .db $AB
  $8CFA  03        .db $03
  $8CFB  04        .db $04
  $8CFC  EA        NOP
  $8CFD  A0 01     LDY #$01
  $8CFF  F6 F0     INC $F0,X
  $8D01  AC 03 F1  LDY $F103
  $8D04  F0 AD     BEQ $8CB3
  $8D06  03        .db $03
  $8D07  F9 F0 AE  SBC $AEF0,Y
  $8D0A  03        .db $03
  $8D0B  01 F8     ORA ($F8,X)
  $8D0D  AF        .db $AF
  $8D0E  03        .db $03
  $8D0F  EC F8 B0  CPX $B0F8
  $8D12  03        .db $03
  $8D13  F4        .db $F4
  $8D14  F8        SED
  $8D15  B1 03     LDA ($03),Y
  $8D17  FC        .db $FC
  $8D18  F8        SED
  $8D19  B2        .db $B2
  $8D1A  03        .db $03
  $8D1B  04        .db $04
  $8D1C  09 E8     ORA #$E8
  $8D1E  B3        .db $B3
  $8D1F  03        .db $03
  $8D20  F4        .db $F4
  $8D21  E8        INX
  $8D22  B4 03     LDY $03,X
  $8D24  FC        .db $FC
  $8D25  E8        INX
  $8D26  B5 03     LDA $03,X
  $8D28  04        .db $04
  $8D29  E9 A0     SBC #$A0
  $8D2B  01 FC     ORA ($FC,X)
  $8D2D  F0 B6     BEQ $8CE5
  $8D2F  03        .db $03
  $8D30  F9 F0 B7  SBC $B7F0,Y
  $8D33  03        .db $03
  $8D34  01 F8     ORA ($F8,X)
  $8D36  B8        CLV
  $8D37  03        .db $03
  $8D38  F4        .db $F4
  $8D39  F8        SED
  $8D3A  B9 03 FC  LDA $FC03,Y
  $8D3D  F8        SED
  $8D3E  BA        TSX

L_8D3F:
  $8D3F  03        .db $03
  $8D40  04        .db $04
  $8D41  0A        ASL
  $8D42  E8        INX
  $8D43  A1 03     LDA ($03,X)
  $8D45  F8        SED
  $8D46  E8        INX
  $8D47  BB        .db $BB
  $8D48  03        .db $03
  $8D49  00        BRK
  $8D4A  E9 A0     SBC #$A0
  $8D4C  01 F9     ORA ($F9,X)
  $8D4E  F0 BC     BEQ $8D0C

L_8D50:
  $8D50  03        .db $03
  $8D51  F4        .db $F4
  $8D52  F0 BD     BEQ $8D11
  $8D54  03        .db $03
  $8D55  FC        .db $FC
  $8D56  F0 BE     BEQ $8D16
  $8D58  03        .db $03
  $8D59  04        .db $04
  $8D5A  F8        SED
  $8D5B  BF        .db $BF
  $8D5C  03        .db $03
  $8D5D  F4        .db $F4
  $8D5E  F8        SED
  $8D5F  C0 03     CPY #$03
  $8D61  FC        .db $FC
  $8D62  F8        SED
  $8D63  C1 03     CMP ($03,X)
  $8D65  04        .db $04
  $8D66  00        BRK
  $8D67  C2        .db $C2

L_8D68:
  $8D68  03        .db $03
  $8D69  FA        .db $FA
  $8D6A  11 E0     ORA ($E0),Y
  $8D6C  A0 03     LDY #$03
  $8D6E  F0 E0     BEQ $8D50
  $8D70  A1 03     LDA ($03,X)
  $8D72  F8        SED
  $8D73  E0 A2     CPX #$A2
  $8D75  03        .db $03
  $8D76  00        BRK
  $8D77  E0 A3     CPX #$A3
  $8D79  03        .db $03
  $8D7A  08        PHP
  $8D7B  E8        INX
  $8D7C  A4 03     LDY $03
  $8D7E  F0 E8     BEQ $8D68

L_8D80:
  $8D80  A5 03     LDA $03
  $8D82  F8        SED
  $8D83  E8        INX
  $8D84  A6 03     LDX $03
  $8D86  00        BRK
  $8D87  E8        INX
  $8D88  A7        .db $A7
  $8D89  03        .db $03
  $8D8A  08        PHP
  $8D8B  F0 A8     BEQ $8D35
  $8D8D  03        .db $03
  $8D8E  F0 F0     BEQ $8D80
  $8D90  A9 03     LDA #$03
  $8D92  F8        SED
  $8D93  F0 AA     BEQ $8D3F
  $8D95  03        .db $03
  $8D96  00        BRK
  $8D97  F0 AB     BEQ $8D44

L_8D99:
  $8D99  03        .db $03
  $8D9A  08        PHP
  $8D9B  F8        SED
  $8D9C  AC 03 F0  LDY $F003
  $8D9F  F8        SED
  $8DA0  AD 03 F8  LDA $F803
  $8DA3  F8        SED
  $8DA4  AE 03 00  LDX $0003
  $8DA7  F8        SED
  $8DA8  AF        .db $AF
  $8DA9  03        .db $03
  $8DAA  08        PHP
  $8DAB  E2        .db $E2
  $8DAC  DE 01 FB  DEC $FB01,X
  $8DAF  12        .db $12
  $8DB0  E0 B0     CPX #$B0
  $8DB2  03        .db $03
  $8DB3  F6 E0     INC $E0,X
  $8DB5  B1 03     LDA ($03),Y
  $8DB7  FE E0 B2  INC $B2E0,X
  $8DBA  03        .db $03
  $8DBB  06 E0     ASL $E0
  $8DBD  B3        .db $B3
  $8DBE  03        .db $03
  $8DBF  0E E8 B4  ASL $B4E8
  $8DC2  03        .db $03
  $8DC3  F0 E8     BEQ $8DAD

L_8DC5:
  $8DC5  B5 03     LDA $03,X
  $8DC7  F8        SED
  $8DC8  E8        INX
  $8DC9  B6 03     LDX $03,Y
  $8DCB  00        BRK
  $8DCC  E8        INX
  $8DCD  B7        .db $B7
  $8DCE  03        .db $03
  $8DCF  08        PHP
  $8DD0  E8        INX
  $8DD1  B8        CLV
  $8DD2  03        .db $03
  $8DD3  10 F0     BPL $8DC5
  $8DD5  B9 03 F0  LDA $F003,Y
  $8DD8  F0 BA     BEQ $8D94
  $8DDA  03        .db $03
  $8DDB  F8        SED
  $8DDC  F0 BB     BEQ $8D99
  $8DDE  03        .db $03
  $8DDF  00        BRK
  $8DE0  F0 BC     BEQ $8D9E
  $8DE2  03        .db $03
  $8DE3  08        PHP
  $8DE4  F8        SED
  $8DE5  BD 03 F0  LDA $F003,X
  $8DE8  F8        SED
  $8DE9  BE 03 F8  LDX $F803,Y
  $8DEC  F8        SED
  $8DED  BF        .db $BF
  $8DEE  03        .db $03
  $8DEF  00        BRK
  $8DF0  F8        SED
  $8DF1  C0 03     CPY #$03
  $8DF3  08        PHP
  $8DF4  E4 DE     CPX $DE

L_8DF6:
  $8DF6  01 FB     ORA ($FB,X)
  $8DF8  12        .db $12
  $8DF9  E0 B0     CPX #$B0
  $8DFB  03        .db $03
  $8DFC  F6 E0     INC $E0,X
  $8DFE  B1 03     LDA ($03),Y
  $8E00  FE E0 B2  INC $B2E0,X
  $8E03  03        .db $03
  $8E04  06 E0     ASL $E0
  $8E06  B3        .db $B3
  $8E07  03        .db $03
  $8E08  0E E8 B4  ASL $B4E8
  $8E0B  03        .db $03
  $8E0C  F0 E8     BEQ $8DF6

L_8E0E:
  $8E0E  C1 03     CMP ($03,X)
  $8E10  F8        SED
  $8E11  E8        INX
  $8E12  C2        .db $C2
  $8E13  03        .db $03
  $8E14  00        BRK
  $8E15  E8        INX
  $8E16  B7        .db $B7
  $8E17  03        .db $03
  $8E18  08        PHP
  $8E19  E8        INX
  $8E1A  B8        CLV
  $8E1B  03        .db $03
  $8E1C  10 F0     BPL $8E0E
  $8E1E  B9 03 F0  LDA $F003,Y
  $8E21  F0 C3     BEQ $8DE6
  $8E23  03        .db $03
  $8E24  F8        SED
  $8E25  F0 C4     BEQ $8DEB
  $8E27  03        .db $03
  $8E28  00        BRK
  $8E29  F0 BC     BEQ $8DE7
  $8E2B  03        .db $03
  $8E2C  08        PHP
  $8E2D  F8        SED
  $8E2E  BD 03 F0  LDA $F003,X
  $8E31  F8        SED
  $8E32  BE 03 F8  LDX $F803,Y
  $8E35  F8        SED
  $8E36  BF        .db $BF

L_8E37:
  $8E37  03        .db $03
  $8E38  00        BRK
  $8E39  F8        SED
  $8E3A  C0 03     CPY #$03

L_8E3C:
  $8E3C  08        PHP
  $8E3D  E4 DE     CPX $DE

L_8E3F:
  $8E3F  01 FB     ORA ($FB,X)
  $8E41  13        .db $13
  $8E42  E0 B0     CPX #$B0
  $8E44  03        .db $03

L_8E45:
  $8E45  F6 E0     INC $E0,X
  $8E47  B1 03     LDA ($03),Y
  $8E49  FE E0 B2  INC $B2E0,X
  $8E4C  03        .db $03
  $8E4D  06 E0     ASL $E0
  $8E4F  B3        .db $B3
  $8E50  03        .db $03
  $8E51  0A        ASL
  $8E52  E8        INX
  $8E53  B4 03     LDY $03,X
  $8E55  F0 E8     BEQ $8E3F

L_8E57:
  $8E57  B5 03     LDA $03,X
  $8E59  F8        SED
  $8E5A  E8        INX

L_8E5B:
  $8E5B  B6 03     LDX $03,Y
  $8E5D  00        BRK
  $8E5E  E8        INX
  $8E5F  B7        .db $B7
  $8E60  03        .db $03
  $8E61  08        PHP
  $8E62  E8        INX
  $8E63  B8        CLV
  $8E64  03        .db $03
  $8E65  10 F0     BPL $8E57
  $8E67  C5 03     CMP $03
  $8E69  F0 F0     BEQ $8E5B
  $8E6B  C6 03     DEC $03
  $8E6D  F8        SED
  $8E6E  F0 C7     BEQ $8E37
  $8E70  03        .db $03
  $8E71  00        BRK
  $8E72  F0 C8     BEQ $8E3C
  $8E74  03        .db $03
  $8E75  08        PHP
  $8E76  F8        SED
  $8E77  C9 03     CMP #$03
  $8E79  F5 F8     SBC $F8,X
  $8E7B  CA        DEX
  $8E7C  03        .db $03
  $8E7D  FD F8 CB  SBC $CBF8,X
  $8E80  03        .db $03

L_8E81:
  $8E81  05 00     ORA $00
  $8E83  CC 03 F5  CPY $F503
  $8E86  00        BRK
  $8E87  CD 03 05  CMP $0503
  $8E8A  E4 DE     CPX $DE

L_8E8C:
  $8E8C  01 FB     ORA ($FB,X)
  $8E8E  0B        .db $0B
  $8E8F  E8        INX
  $8E90  A0 03     LDY #$03
  $8E92  F8        SED
  $8E93  E8        INX
  $8E94  A1 03     LDA ($03,X)
  $8E96  00        BRK
  $8E97  F0 A2     BEQ $8E3B
  $8E99  03        .db $03
  $8E9A  F0 F0     BEQ $8E8C
  $8E9C  A3        .db $A3
  $8E9D  03        .db $03
  $8E9E  F8        SED
  $8E9F  F0 A4     BEQ $8E45

L_8EA1:
  $8EA1  03        .db $03
  $8EA2  00        BRK
  $8EA3  F0 A5     BEQ $8E4A
  $8EA5  03        .db $03
  $8EA6  08        PHP
  $8EA7  F8        SED

L_8EA8:
  $8EA8  A6 03     LDX $03
  $8EAA  F0 F8     BEQ $8EA4
  $8EAC  A7        .db $A7
  $8EAD  03        .db $03
  $8EAE  F8        SED
  $8EAF  F8        SED
  $8EB0  A8        TAY
  $8EB1  03        .db $03
  $8EB2  00        BRK
  $8EB3  F8        SED
  $8EB4  A9 03     LDA #$03
  $8EB6  08        PHP
  $8EB7  ED F3 01  SBC $01F3
  $8EBA  FA        .db $FA
  $8EBB  0D E0 AA  ORA $AAE0
  $8EBE  03        .db $03
  $8EBF  F0 E0     BEQ $8EA1
  $8EC1  AB        .db $AB
  $8EC2  03        .db $03
  $8EC3  F8        SED
  $8EC4  E8        INX

L_8EC5:
  $8EC5  AC 03 F0  LDY $F003
  $8EC8  E8        INX
  $8EC9  AD 03 F8  LDA $F803

L_8ECC:
  $8ECC  E8        INX
  $8ECD  AE 03 00  LDX $0003
  $8ED0  F0 AF     BEQ $8E81
  $8ED2  03        .db $03
  $8ED3  F0 F0     BEQ $8EC5
  $8ED5  B0 03     BCS $8EDA
  $8ED7  F8        SED
  $8ED8  F0 B1     BEQ $8E8B

L_8EDA:
  $8EDA  03        .db $03
  $8EDB  00        BRK
  $8EDC  F8        SED
  $8EDD  B2        .db $B2

L_8EDE:
  $8EDE  03        .db $03
  $8EDF  F0 F8     BEQ $8ED9
  $8EE1  B3        .db $B3
  $8EE2  03        .db $03
  $8EE3  F8        SED
  $8EE4  F8        SED
  $8EE5  B4 03     LDY $03,X
  $8EE7  00        BRK
  $8EE8  F8        SED
  $8EE9  B5 03     LDA $03,X
  $8EEB  08        PHP
  $8EEC  ED F3 01  SBC $01F3
  $8EEF  F9 0D E8  SBC $E80D,Y
  $8EF2  B6 03     LDX $03,Y
  $8EF4  F0 E8     BEQ $8EDE

L_8EF6:
  $8EF6  B7        .db $B7
  $8EF7  03        .db $03
  $8EF8  F8        SED
  $8EF9  E8        INX
  $8EFA  B8        CLV
  $8EFB  03        .db $03
  $8EFC  00        BRK
  $8EFD  E8        INX
  $8EFE  B9 03 08  LDA $0803,Y

L_8F01:
  $8F01  F0 BA     BEQ $8EBD
  $8F03  03        .db $03
  $8F04  F0 F0     BEQ $8EF6
  $8F06  BB        .db $BB
  $8F07  03        .db $03
  $8F08  F8        SED
  $8F09  F0 BC     BEQ $8EC7
  $8F0B  03        .db $03
  $8F0C  00        BRK
  $8F0D  F0 BD     BEQ $8ECC
  $8F0F  03        .db $03
  $8F10  08        PHP
  $8F11  F8        SED
  $8F12  BE 03 F0  LDX $F003,Y
  $8F15  F8        SED
  $8F16  BF        .db $BF
  $8F17  03        .db $03
  $8F18  F8        SED
  $8F19  F8        SED
  $8F1A  C0 03     CPY #$03
  $8F1C  00        BRK
  $8F1D  F8        SED
  $8F1E  C1 03     CMP ($03,X)
  $8F20  08        PHP
  $8F21  ED F3 01  SBC $01F3

L_8F24:
  $8F24  FC        .db $FC
  $8F25  0E E8 B6  ASL $B6E8
  $8F28  03        .db $03
  $8F29  EE E8 B7  INC $B7E8
  $8F2C  03        .db $03
  $8F2D  F6 E8     INC $E8,X
  $8F2F  B8        CLV
  $8F30  03        .db $03
  $8F31  FE E8 B9  INC $B9E8,X
  $8F34  03        .db $03
  $8F35  06 F0     ASL $F0
  $8F37  BA        TSX
  $8F38  03        .db $03
  $8F39  EE F0 BB  INC $BBF0
  $8F3C  03        .db $03
  $8F3D  F6 F0     INC $F0,X
  $8F3F  BC 03 FE  LDY $FE03,X
  $8F42  F0 BD     BEQ $8F01
  $8F44  03        .db $03
  $8F45  06 F8     ASL $F8
  $8F47  C2        .db $C2
  $8F48  03        .db $03
  $8F49  F8        SED
  $8F4A  F8        SED
  $8F4B  C3        .db $C3
  $8F4C  03        .db $03
  $8F4D  00        BRK
  $8F4E  F8        SED
  $8F4F  C4 03     CPY $03
  $8F51  08        PHP
  $8F52  00        BRK
  $8F53  C5 03     CMP $03
  $8F55  F8        SED
  $8F56  00        BRK
  $8F57  C6 03     DEC $03
  $8F59  00        BRK
  $8F5A  ED F3 01  SBC $01F3
  $8F5D  FB        .db $FB
  $8F5E  10 E0     BPL $8F40
  $8F60  A0 03     LDY #$03
  $8F62  F8        SED
  $8F63  E0 A1     CPX #$A1
  $8F65  03        .db $03
  $8F66  00        BRK
  $8F67  E0 A2     CPX #$A2
  $8F69  03        .db $03
  $8F6A  08        PHP
  $8F6B  E8        INX
  $8F6C  A3        .db $A3
  $8F6D  03        .db $03
  $8F6E  F0 E8     BEQ $8F58

L_8F70:
  $8F70  A4 03     LDY $03
  $8F72  F8        SED

L_8F73:
  $8F73  E8        INX
  $8F74  A5 03     LDA $03
  $8F76  00        BRK
  $8F77  E8        INX
  $8F78  A6 03     LDX $03
  $8F7A  08        PHP
  $8F7B  F0 A7     BEQ $8F24
  $8F7D  03        .db $03
  $8F7E  F0 F0     BEQ $8F70
  $8F80  A8        TAY
  $8F81  03        .db $03
  $8F82  F8        SED
  $8F83  F0 A9     BEQ $8F2E
  $8F85  03        .db $03
  $8F86  00        BRK
  $8F87  F0 AA     BEQ $8F33
  $8F89  03        .db $03
  $8F8A  08        PHP
  $8F8B  F8        SED
  $8F8C  AB        .db $AB
  $8F8D  03        .db $03
  $8F8E  F0 F8     BEQ $8F88
  $8F90  AC 03 F8  LDY $F803
  $8F93  F8        SED
  $8F94  AC 43 00  LDY $0043
  $8F97  F8        SED
  $8F98  AD 03 08  LDA $0803
  $8F9B  E7        .db $E7
  $8F9C  F4        .db $F4
  $8F9D  02        .db $02
  $8F9E  FA        .db $FA
  $8F9F  0F        .db $0F
  $8FA0  E0 AE     CPX #$AE
  $8FA2  03        .db $03
  $8FA3  F8        SED
  $8FA4  E0 AF     CPX #$AF
  $8FA6  03        .db $03
  $8FA7  00        BRK
  $8FA8  E0 B0     CPX #$B0
  $8FAA  03        .db $03
  $8FAB  08        PHP
  $8FAC  E8        INX
  $8FAD  B1 03     LDA ($03),Y
  $8FAF  F0 E8     BEQ $8F99
  $8FB1  B2        .db $B2
  $8FB2  03        .db $03
  $8FB3  F8        SED
  $8FB4  E8        INX
  $8FB5  B3        .db $B3
  $8FB6  03        .db $03
  $8FB7  00        BRK
  $8FB8  E8        INX
  $8FB9  B4 03     LDY $03,X

L_8FBB:
  $8FBB  08        PHP
  $8FBC  F0 B5     BEQ $8F73

L_8FBE:
  $8FBE  03        .db $03
  $8FBF  F5 F0     SBC $F0,X
  $8FC1  B6 03     LDX $03,Y
  $8FC3  FD F0 B7  SBC $B7F0,X
  $8FC6  03        .db $03
  $8FC7  05 F8     ORA $F8
  $8FC9  B8        CLV

L_8FCA:
  $8FCA  03        .db $03
  $8FCB  F0 F8     BEQ $8FC5
  $8FCD  B9 03 F8  LDA $F803,Y
  $8FD0  F8        SED
  $8FD1  BA        TSX
  $8FD2  03        .db $03
  $8FD3  00        BRK
  $8FD4  F8        SED
  $8FD5  BB        .db $BB
  $8FD6  03        .db $03
  $8FD7  08        PHP
  $8FD8  E8        INX
  $8FD9  F4        .db $F4
  $8FDA  02        .db $02
  $8FDB  FA        .db $FA
  $8FDC  10 E0     BPL $8FBE
  $8FDE  AE 03 F8  LDX $F803
  $8FE1  E0 AF     CPX #$AF
  $8FE3  03        .db $03
  $8FE4  00        BRK
  $8FE5  E0 B0     CPX #$B0
  $8FE7  03        .db $03
  $8FE8  08        PHP
  $8FE9  E8        INX
  $8FEA  BC 03 F0  LDY $F003,X
  $8FED  E8        INX

L_8FEE:
  $8FEE  BD 03 F8  LDA $F803,X
  $8FF1  E8        INX
  $8FF2  BE 03 00  LDX $0003,Y
  $8FF5  E8        INX
  $8FF6  BF        .db $BF
  $8FF7  03        .db $03
  $8FF8  08        PHP
  $8FF9  F0 C0     BEQ $8FBB
  $8FFB  03        .db $03
  $8FFC  F0 F0     BEQ $8FEE
  $8FFE  C1 03     CMP ($03,X)
  $9000  F8        SED
  $9001  F0 C2     BEQ $8FC5
  $9003  03        .db $03
  $9004  00        BRK
  $9005  F0 C3     BEQ $8FCA
  $9007  03        .db $03
  $9008  08        PHP
  $9009  F8        SED
  $900A  B8        CLV
  $900B  03        .db $03

L_900C:
  $900C  F0 F8     BEQ $9006
  $900E  B9 03 F8  LDA $F803,Y
  $9011  F8        SED
  $9012  BA        TSX
  $9013  03        .db $03
  $9014  00        BRK
  $9015  F8        SED

L_9016:
  $9016  BB        .db $BB
  $9017  03        .db $03
  $9018  08        PHP
  $9019  E8        INX
  $901A  F4        .db $F4

L_901B:
  $901B  02        .db $02
  $901C  FA        .db $FA
  $901D  11 E0     ORA ($E0),Y
  $901F  A0 03     LDY #$03
  $9021  F8        SED
  $9022  E0 A1     CPX #$A1
  $9024  03        .db $03
  $9025  00        BRK
  $9026  E0 CC     CPX #$CC
  $9028  03        .db $03
  $9029  08        PHP
  $902A  E8        INX
  $902B  CD 03 F0  CMP $F003
  $902E  E8        INX

L_902F:
  $902F  CE 03 F8  DEC $F803
  $9032  E8        INX
  $9033  A5 03     LDA $03
  $9035  00        BRK
  $9036  E8        INX
  $9037  CF        .db $CF
  $9038  03        .db $03
  $9039  08        PHP
  $903A  F0 D0     BEQ $900C
  $903C  03        .db $03
  $903D  F0 F0     BEQ $902F
  $903F  D1 03     CMP ($03),Y
  $9041  F8        SED
  $9042  F0 D2     BEQ $9016
  $9044  03        .db $03
  $9045  00        BRK
  $9046  F0 D3     BEQ $901B

L_9048:
  $9048  03        .db $03
  $9049  08        PHP
  $904A  F8        SED
  $904B  D4        .db $D4
  $904C  03        .db $03

L_904D:
  $904D  F0 F8     BEQ $9047
  $904F  D5 03     CMP $03,X
  $9051  F8        SED
  $9052  F8        SED
  $9053  D5 03     CMP $03,X

L_9055:
  $9055  00        BRK
  $9056  F8        SED
  $9057  D6 03     DEC $03,X
  $9059  08        PHP

L_905A:
  $905A  E7        .db $E7
  $905B  F4        .db $F4
  $905C  02        .db $02
  $905D  FA        .db $FA
  $905E  E0 CB     CPX #$CB

L_9060:
  $9060  03        .db $03
  $9061  F0 11     BEQ $9074
  $9063  E0 C1     CPX #$C1
  $9065  03        .db $03
  $9066  F0 E0     BEQ $9048
  $9068  C2        .db $C2
  $9069  03        .db $03
  $906A  F8        SED
  $906B  E0 C3     CPX #$C3
  $906D  03        .db $03
  $906E  00        BRK
  $906F  E0 C4     CPX #$C4
  $9071  03        .db $03
  $9072  08        PHP
  $9073  E8        INX

L_9074:
  $9074  C5 03     CMP $03
  $9076  F0 E8     BEQ $9060

L_9078:
  $9078  A2 03     LDX #$03
  $907A  F8        SED
  $907B  E8        INX
  $907C  C6 03     DEC $03
  $907E  00        BRK
  $907F  E8        INX
  $9080  C7        .db $C7
  $9081  03        .db $03
  $9082  08        PHP
  $9083  F0 C8     BEQ $904D
  $9085  03        .db $03
  $9086  F0 F0     BEQ $9078
  $9088  A6 03     LDX $03
  $908A  F8        SED
  $908B  F0 A7     BEQ $9034
  $908D  03        .db $03
  $908E  00        BRK
  $908F  F0 C9     BEQ $905A
  $9091  03        .db $03
  $9092  08        PHP
  $9093  F0 C0     BEQ $9055
  $9095  01 FA     ORA ($FA,X)
  $9097  F8        SED
  $9098  CA        DEX
  $9099  03        .db $03

L_909A:
  $909A  F0 F8     BEQ $9094
  $909C  CB        .db $CB
  $909D  03        .db $03
  $909E  F8        SED

L_909F:
  $909F  F8        SED
  $90A0  CC 03 00  CPY $0003
  $90A3  F8        SED
  $90A4  CD 03 08  CMP $0803
  $90A7  11 E0     ORA ($E0),Y
  $90A9  CE 03 F0  DEC $F003
  $90AC  E0 CF     CPX #$CF
  $90AE  03        .db $03
  $90AF  F8        SED
  $90B0  E0 D0     CPX #$D0
  $90B2  03        .db $03
  $90B3  00        BRK
  $90B4  E0 D1     CPX #$D1
  $90B6  03        .db $03
  $90B7  08        PHP
  $90B8  E8        INX
  $90B9  D2        .db $D2
  $90BA  03        .db $03
  $90BB  F0 E8     BEQ $90A5

L_90BD:
  $90BD  A2 03     LDX #$03
  $90BF  F8        SED
  $90C0  E8        INX
  $90C1  D3        .db $D3
  $90C2  03        .db $03
  $90C3  00        BRK
  $90C4  E8        INX
  $90C5  D4        .db $D4
  $90C6  03        .db $03
  $90C7  08        PHP
  $90C8  F0 D5     BEQ $909F
  $90CA  03        .db $03
  $90CB  F0 F0     BEQ $90BD
  $90CD  A6 03     LDX $03
  $90CF  F8        SED
  $90D0  F0 A7     BEQ $9079
  $90D2  03        .db $03
  $90D3  00        BRK
  $90D4  F0 C9     BEQ $909F
  $90D6  03        .db $03
  $90D7  08        PHP
  $90D8  F0 C0     BEQ $909A
  $90DA  01 FA     ORA ($FA,X)
  $90DC  F8        SED
  $90DD  CA        DEX
  $90DE  03        .db $03
  $90DF  F0 F8     BEQ $90D9
  $90E1  CB        .db $CB
  $90E2  03        .db $03
  $90E3  F8        SED
  $90E4  F8        SED
  $90E5  CC 03 00  CPY $0003
  $90E8  F8        SED
  $90E9  CD 03 08  CMP $0803

L_90EC:
  $90EC  20 6C CC  JSR $CC6C
  $90EF  A9 00     LDA #$00
  $90F1  20 EF D2  JSR $D2EF
  $90F4  A5 B5     LDA $B5
  $90F6  48        PHA
  $90F7  A5 B6     LDA $B6
  $90F9  48        PHA
  $90FA  A5 B7     LDA $B7
  $90FC  48        PHA
  $90FD  A5 B8     LDA $B8
  $90FF  48        PHA
  $9100  A5 B9     LDA $B9
  $9102  48        PHA
  $9103  A5 20     LDA $20
  $9105  48        PHA
  $9106  A5 1F     LDA $1F
  $9108  48        PHA
  $9109  A2 11     LDX #$11

L_910B:
  $910B  BD 54 03  LDA $0354,X
  $910E  9D 00 07  STA $0700,X
  $9111  CA        DEX
  $9112  10 F7     BPL $910B
  $9114  A9 00     LDA #$00
  $9116  85 B8     STA $B8
  $9118  85 B7     STA $B7
  $911A  85 B5     STA $B5
  $911C  85 B6     STA $B6
  $911E  A5 2A     LDA $2A
  $9120  C9 04     CMP #$04
  $9122  D0 19     BNE $913D
  $9124  A5 38     LDA $38
  $9126  C9 03     CMP #$03
  $9128  90 13     BCC $913D
  $912A  C9 0F     CMP #$0F
  $912C  B0 0F     BCS $913D
  $912E  C9 07     CMP #$07
  $9130  F0 0B     BEQ $913D
  $9132  A2 0F     LDX #$0F
  $9134  8A        TXA

L_9135:
  $9135  9D 56 03  STA $0356,X
  $9138  CA        DEX
  $9139  10 FA     BPL $9135
  $913B  E6 20     INC $20

L_913D:
  $913D  A5 B1     LDA $B1
  $913F  F0 14     BEQ $9155
  $9141  A5 B3     LDA $B3
  $9143  C9 08     CMP #$08
  $9145  90 0E     BCC $9155
  $9147  A2 00     LDX #$00
  $9149  86 1F     STX $1F
  $914B  C9 0A     CMP #$0A
  $914D  F0 06     BEQ $9155
  $914F  C9 0B     CMP #$0B
  $9151  F0 02     BEQ $9155
  $9153  E6 20     INC $20

L_9155:
  $9155  A9 0A     LDA #$0A
  $9157  C5 2A     CMP $2A
  $9159  D0 17     BNE $9172
  $915B  A5 B1     LDA $B1
  $915D  F0 13     BEQ $9172
  $915F  A9 0F     LDA #$0F
  $9161  A2 02     LDX #$02

L_9163:
  $9163  9D 5B 03  STA $035B,X
  $9166  9D 7B 03  STA $037B,X
  $9169  9D 8B 03  STA $038B,X
  $916C  9D 9B 03  STA $039B,X
  $916F  CA        DEX
  $9170  10 F1     BPL $9163

L_9172:
  $9172  18        CLC
  $9173  A5 1F     LDA $1F
  $9175  69 80     ADC #$80
  $9177  29 E0     AND #$E0
  $9179  09 04     ORA #$04
  $917B  85 52     STA $52
  $917D  A5 20     LDA $20
  $917F  69 00     ADC #$00
  $9181  85 53     STA $53
  $9183  A2 00     LDX #$00

L_9185:
  $9185  86 FD     STX $FD
  $9187  18        CLC
  $9188  A5 52     LDA $52
  $918A  7D 7F 95  ADC $957F,X
  $918D  85 08     STA $08
  $918F  A5 53     LDA $53
  $9191  69 00     ADC #$00
  $9193  85 09     STA $09
  $9195  A9 00     LDA #$00
  $9197  85 1B     STA $1B
  $9199  20 B1 C8  JSR $C8B1
  $919C  A6 FD     LDX $FD
  $919E  BD 70 95  LDA $9570,X
  $91A1  0A        ASL
  $91A2  0A        ASL
  $91A3  0A        ASL
  $91A4  0A        ASL
  $91A5  AA        TAX
  $91A6  A0 00     LDY #$00

L_91A8:
  $91A8  BD 8E 95  LDA $958E,X
  $91AB  99 10 03  STA $0310,Y
  $91AE  E8        INX
  $91AF  C8        INY
  $91B0  C0 10     CPY #$10
  $91B2  D0 F4     BNE $91A8
  $91B4  A6 2A     LDX $2A
  $91B6  BD 1E 96  LDA $961E,X
  $91B9  8D 50 03  STA $0350
  $91BC  A9 01     LDA #$01
  $91BE  85 1B     STA $1B
  $91C0  A0 99     LDY #$99
  $91C2  A2 00     LDX #$00
  $91C4  20 60 C7  JSR $C760
  $91C7  20 AB C0  JSR $C0AB
  $91CA  A6 FD     LDX $FD
  $91CC  E8        INX
  $91CD  E0 0F     CPX #$0F
  $91CF  D0 B4     BNE $9185
  $91D1  86 FD     STX $FD
  $91D3  A0 99     LDY #$99
  $91D5  A2 00     LDX #$00
  $91D7  20 60 C7  JSR $C760
  $91DA  A9 00     LDA #$00
  $91DC  85 FE     STA $FE
  $91DE  85 FF     STA $FF
  $91E0  A6 A9     LDX $A9
  $91E2  E8        INX
  $91E3  E0 07     CPX #$07
  $91E5  90 06     BCC $91ED
  $91E7  8A        TXA
  $91E8  E9 06     SBC #$06
  $91EA  AA        TAX
  $91EB  E6 FE     INC $FE

L_91ED:
  $91ED  86 FD     STX $FD

L_91EF:
  $91EF  A5 9A     LDA $9A
  $91F1  0A        ASL
  $91F2  09 41     ORA #$41
  $91F4  85 07     STA $07
  $91F6  A5 FE     LDA $FE
  $91F8  F0 11     BEQ $920B
  $91FA  A5 9A     LDA $9A
  $91FC  85 07     STA $07
  $91FE  A5 9B     LDA $9B
  $9200  06 07     ASL $07
  $9202  2A        ROL
  $9203  06 07     ASL $07
  $9205  2A        ROL
  $9206  06 07     ASL $07
  $9208  2A        ROL
  $9209  85 07     STA $07

L_920B:
  $920B  A5 27     LDA $27
  $920D  29 08     AND #$08
  $920F  F0 03     BEQ $9214
  $9211  4C 81 92  JMP $9281

L_9214:
  $9214  A5 27     LDA $27
  $9216  29 30     AND #$30
  $9218  D0 1C     BNE $9236
  $921A  A5 23     LDA $23
  $921C  29 30     AND #$30
  $921E  F0 54     BEQ $9274
  $9220  85 00     STA $00
  $9222  A5 25     LDA $25
  $9224  29 30     AND #$30
  $9226  C5 00     CMP $00
  $9228  D0 4A     BNE $9274
  $922A  E6 FF     INC $FF
  $922C  A5 FF     LDA $FF
  $922E  C9 18     CMP #$18
  $9230  90 46     BCC $9278
  $9232  A9 08     LDA #$08
  $9234  85 FF     STA $FF

L_9236:
  $9236  A2 07     LDX #$07
  $9238  A5 FE     LDA $FE
  $923A  F0 01     BEQ $923D
  $923C  CA        DEX

L_923D:
  $923D  A9 2F     LDA #$2F
  $923F  20 51 C0  JSR $C051
  $9242  A5 23     LDA $23
  $9244  29 30     AND #$30
  $9246  29 10     AND #$10
  $9248  D0 17     BNE $9261

L_924A:
  $924A  E6 FD     INC $FD
  $924C  E4 FD     CPX $FD
  $924E  B0 04     BCS $9254
  $9250  A9 00     LDA #$00
  $9252  85 FD     STA $FD

L_9254:
  $9254  A4 FD     LDY $FD
  $9256  F0 20     BEQ $9278
  $9258  B9 70 96  LDA $9670,Y
  $925B  25 07     AND $07
  $925D  F0 EB     BEQ $924A
  $925F  D0 17     BNE $9278

L_9261:
  $9261  C6 FD     DEC $FD
  $9263  10 02     BPL $9267
  $9265  86 FD     STX $FD

L_9267:
  $9267  A4 FD     LDY $FD
  $9269  F0 0D     BEQ $9278
  $926B  B9 70 96  LDA $9670,Y
  $926E  25 07     AND $07
  $9270  F0 EF     BEQ $9261
  $9272  D0 04     BNE $9278

L_9274:
  $9274  A9 00     LDA #$00
  $9276  85 FF     STA $FF

L_9278:
  $9278  20 96 93  JSR $9396
  $927B  20 AB C0  JSR $C0AB
  $927E  4C EF 91  JMP $91EF

L_9281:
  $9281  A5 FD     LDA $FD
  $9283  D0 09     BNE $928E
  $9285  A5 FE     LDA $FE
  $9287  49 01     EOR #$01
  $9289  85 FE     STA $FE
  $928B  4C 74 92  JMP $9274

L_928E:
  $928E  C9 07     CMP #$07
  $9290  D0 24     BNE $92B6
  $9292  A5 A7     LDA $A7
  $9294  F0 DE     BEQ $9274
  $9296  C6 A7     DEC $A7

L_9298:
  $9298  AD C0 06  LDA $06C0
  $929B  C9 1C     CMP #$1C
  $929D  F0 D5     BEQ $9274
  $929F  A5 1C     LDA $1C
  $92A1  29 03     AND #$03
  $92A3  D0 08     BNE $92AD
  $92A5  EE C0 06  INC $06C0
  $92A8  A9 28     LDA #$28
  $92AA  20 51 C0  JSR $C051

L_92AD:
  $92AD  20 96 93  JSR $9396
  $92B0  20 AB C0  JSR $C0AB
  $92B3  4C 98 92  JMP $9298

L_92B6:
  $92B6  A5 FD     LDA $FD
  $92B8  F0 BA     BEQ $9274
  $92BA  C9 07     CMP #$07
  $92BC  F0 B6     BEQ $9274
  $92BE  AA        TAX
  $92BF  CA        DEX
  $92C0  A5 FE     LDA $FE
  $92C2  F0 05     BEQ $92C9
  $92C4  18        CLC
  $92C5  8A        TXA
  $92C6  69 06     ADC #$06
  $92C8  AA        TAX

L_92C9:
  $92C9  86 A9     STX $A9
  $92CB  20 6C CC  JSR $CC6C
  $92CE  A5 1A     LDA $1A
  $92D0  48        PHA
  $92D1  A2 00     LDX #$00

L_92D3:
  $92D3  86 FD     STX $FD
  $92D5  18        CLC
  $92D6  A5 52     LDA $52
  $92D8  7D 7F 95  ADC $957F,X
  $92DB  85 08     STA $08
  $92DD  A5 53     LDA $53
  $92DF  69 00     ADC #$00
  $92E1  85 09     STA $09
  $92E3  A5 08     LDA $08
  $92E5  46 09     LSR $09
  $92E7  6A        ROR
  $92E8  46 09     LSR $09
  $92EA  6A        ROR
  $92EB  85 08     STA $08
  $92ED  29 3F     AND #$3F
  $92EF  85 1A     STA $1A
  $92F1  18        CLC
  $92F2  A5 09     LDA $09
  $92F4  69 85     ADC #$85
  $92F6  85 09     STA $09
  $92F8  A9 00     LDA #$00
  $92FA  85 1B     STA $1B
  $92FC  20 0B CA  JSR $CA0B
  $92FF  A5 FD     LDA $FD
  $9301  C9 08     CMP #$08
  $9303  B0 12     BCS $9317
  $9305  A6 A9     LDX $A9
  $9307  BD 64 96  LDA $9664,X
  $930A  A8        TAY
  $930B  E0 09     CPX #$09
  $930D  90 04     BCC $9313
  $930F  A2 00     LDX #$00
  $9311  F0 08     BEQ $931B

L_9313:
  $9313  A2 05     LDX #$05
  $9315  D0 04     BNE $931B

L_9317:
  $9317  A0 90     LDY #$90
  $9319  A2 00     LDX #$00

L_931B:
  $931B  20 60 C7  JSR $C760
  $931E  20 AB C0  JSR $C0AB
  $9321  A6 FD     LDX $FD
  $9323  E8        INX
  $9324  E0 0F     CPX #$0F
  $9326  D0 AB     BNE $92D3
  $9328  86 FD     STX $FD
  $932A  A0 90     LDY #$90
  $932C  A2 00     LDX #$00
  $932E  20 60 C7  JSR $C760
  $9331  20 ED D2  JSR $D2ED
  $9334  20 AB C0  JSR $C0AB
  $9337  68        PLA
  $9338  85 1A     STA $1A
  $933A  A5 2A     LDA $2A
  $933C  C9 0A     CMP #$0A
  $933E  D0 18     BNE $9358
  $9340  A5 B1     LDA $B1
  $9342  F0 14     BEQ $9358
  $9344  A2 02     LDX #$02

L_9346:
  $9346  BD 93 93  LDA $9393,X
  $9349  9D 5B 03  STA $035B,X
  $934C  9D 7B 03  STA $037B,X
  $934F  9D 8B 03  STA $038B,X
  $9352  9D 9B 03  STA $039B,X
  $9355  CA        DEX
  $9356  10 EE     BPL $9346

L_9358:
  $9358  A2 11     LDX #$11

L_935A:
  $935A  BD 00 07  LDA $0700,X
  $935D  9D 54 03  STA $0354,X
  $9360  CA        DEX
  $9361  10 F7     BPL $935A
  $9363  68        PLA
  $9364  85 1F     STA $1F
  $9366  68        PLA
  $9367  85 20     STA $20
  $9369  68        PLA
  $936A  85 B9     STA $B9
  $936C  68        PLA
  $936D  85 B8     STA $B8
  $936F  68        PLA
  $9370  85 B7     STA $B7
  $9372  68        PLA
  $9373  85 B6     STA $B6
  $9375  68        PLA
  $9376  85 B5     STA $B5
  $9378  A9 00     LDA #$00
  $937A  85 AC     STA $AC
  $937C  85 2C     STA $2C
  $937E  8D 80 06  STA $0680
  $9381  8D A0 06  STA $06A0
  $9384  A9 1A     LDA #$1A
  $9386  8D 00 04  STA $0400
  $9389  A9 03     LDA #$03
  $938B  85 AA     STA $AA
  $938D  A9 30     LDA #$30
  $938F  20 51 C0  JSR $C051
  $9392  60        RTS
  $9393  27        .db $27
  $9394  11 16     ORA ($16),Y

L_9396:
  $9396  20 6C CC  JSR $CC6C
  $9399  A5 52     LDA $52
  $939B  29 E0     AND #$E0
  $939D  38        SEC
  $939E  E5 1F     SBC $1F
  $93A0  85 08     STA $08
  $93A2  A0 00     LDY #$00

L_93A4:
  $93A4  B9 2C 96  LDA $962C,Y
  $93A7  99 00 02  STA $0200,Y
  $93AA  C8        INY
  $93AB  C0 14     CPY #$14
  $93AD  D0 F5     BNE $93A4
  $93AF  A5 9A     LDA $9A
  $93B1  0A        ASL
  $93B2  09 01     ORA #$01
  $93B4  85 07     STA $07
  $93B6  A9 05     LDA #$05
  $93B8  85 01     STA $01
  $93BA  A2 00     LDX #$00
  $93BC  A5 FE     LDA $FE
  $93BE  F0 13     BEQ $93D3
  $93C0  A2 06     LDX #$06
  $93C2  A5 9A     LDA $9A
  $93C4  85 07     STA $07
  $93C6  A5 9B     LDA $9B
  $93C8  06 07     ASL $07
  $93CA  2A        ROL
  $93CB  06 07     ASL $07
  $93CD  2A        ROL
  $93CE  06 07     ASL $07
  $93D0  2A        ROL
  $93D1  85 07     STA $07

L_93D3:
  $93D3  A5 07     LDA $07
  $93D5  85 02     STA $02
  $93D7  A9 44     LDA #$44
  $93D9  85 00     STA $00

L_93DB:
  $93DB  99 00 02  STA $0200,Y
  $93DE  46 02     LSR $02
  $93E0  B0 05     BCS $93E7
  $93E2  A9 F8     LDA #$F8
  $93E4  99 00 02  STA $0200,Y

L_93E7:
  $93E7  BD 40 96  LDA $9640,X
  $93EA  99 01 02  STA $0201,Y
  $93ED  A9 01     LDA #$01
  $93EF  99 02 02  STA $0202,Y
  $93F2  A9 0C     LDA #$0C
  $93F4  99 03 02  STA $0203,Y
  $93F7  18        CLC
  $93F8  A5 00     LDA $00
  $93FA  69 10     ADC #$10
  $93FC  85 00     STA $00
  $93FE  C8        INY
  $93FF  C8        INY
  $9400  C8        INY
  $9401  C8        INY
  $9402  E8        INX
  $9403  C6 01     DEC $01
  $9405  10 D4     BPL $93DB
  $9407  A5 FE     LDA $FE
  $9409  D0 6A     BNE $9475
  $940B  A2 00     LDX #$00

L_940D:
  $940D  BD 4C 96  LDA $964C,X
  $9410  99 00 02  STA $0200,Y
  $9413  C8        INY
  $9414  E8        INX
  $9415  E0 04     CPX #$04
  $9417  D0 F4     BNE $940D
  $9419  84 00     STY $00
  $941B  A9 44     LDA #$44
  $941D  85 02     STA $02
  $941F  AD C0 06  LDA $06C0
  $9422  20 2B 95  JSR $952B
  $9425  A5 07     LDA $07
  $9427  4A        LSR
  $9428  85 04     STA $04
  $942A  A2 00     LDX #$00
  $942C  A9 54     LDA #$54

L_942E:
  $942E  86 03     STX $03
  $9430  85 02     STA $02
  $9432  46 04     LSR $04
  $9434  90 03     BCC $9439
  $9436  20 29 95  JSR $9529

L_9439:
  $9439  18        CLC
  $943A  A5 02     LDA $02
  $943C  69 10     ADC #$10
  $943E  A6 03     LDX $03
  $9440  E8        INX
  $9441  E0 05     CPX #$05
  $9443  D0 E9     BNE $942E

L_9445:
  $9445  A4 00     LDY $00
  $9447  A5 A7     LDA $A7
  $9449  F0 27     BEQ $9472
  $944B  85 02     STA $02
  $944D  A9 1C     LDA #$1C

L_944F:
  $944F  85 01     STA $01
  $9451  A9 A4     LDA #$A4
  $9453  99 00 02  STA $0200,Y
  $9456  A9 13     LDA #$13
  $9458  99 01 02  STA $0201,Y
  $945B  A9 00     LDA #$00
  $945D  99 02 02  STA $0202,Y
  $9460  A5 01     LDA $01
  $9462  99 03 02  STA $0203,Y
  $9465  C8        INY
  $9466  C8        INY
  $9467  C8        INY
  $9468  C8        INY
  $9469  18        CLC
  $946A  A5 01     LDA $01
  $946C  69 10     ADC #$10
  $946E  C6 02     DEC $02
  $9470  D0 DD     BNE $944F

L_9472:
  $9472  4C DD 94  JMP $94DD

L_9475:
  $9475  A2 04     LDX #$04

L_9477:
  $9477  BD 4C 96  LDA $964C,X
  $947A  99 00 02  STA $0200,Y
  $947D  C8        INY
  $947E  E8        INX
  $947F  E0 18     CPX #$18
  $9481  D0 F4     BNE $9477
  $9483  84 00     STY $00
  $9485  A5 07     LDA $07
  $9487  85 04     STA $04
  $9489  A2 05     LDX #$05
  $948B  A9 44     LDA #$44

L_948D:
  $948D  86 03     STX $03
  $948F  85 02     STA $02
  $9491  46 04     LSR $04
  $9493  90 03     BCC $9498
  $9495  20 29 95  JSR $9529

L_9498:
  $9498  18        CLC
  $9499  A5 02     LDA $02
  $949B  69 10     ADC #$10
  $949D  A6 03     LDX $03
  $949F  E8        INX
  $94A0  E0 0B     CPX #$0B
  $94A2  D0 E9     BNE $948D
  $94A4  A5 A8     LDA $A8
  $94A6  85 01     STA $01
  $94A8  C6 01     DEC $01
  $94AA  A9 0A     LDA #$0A
  $94AC  85 02     STA $02
  $94AE  20 4E C8  JSR $C84E
  $94B1  A4 00     LDY $00
  $94B3  A9 A5     LDA #$A5
  $94B5  99 00 02  STA $0200,Y
  $94B8  99 04 02  STA $0204,Y
  $94BB  18        CLC
  $94BC  A5 03     LDA $03
  $94BE  69 14     ADC #$14
  $94C0  99 01 02  STA $0201,Y
  $94C3  18        CLC
  $94C4  A5 04     LDA $04
  $94C6  69 14     ADC #$14
  $94C8  99 05 02  STA $0205,Y
  $94CB  A9 01     LDA #$01
  $94CD  99 02 02  STA $0202,Y
  $94D0  99 06 02  STA $0206,Y
  $94D3  A9 38     LDA #$38
  $94D5  99 03 02  STA $0203,Y
  $94D8  A9 40     LDA #$40
  $94DA  99 07 02  STA $0207,Y

L_94DD:
  $94DD  A0 00     LDY #$00
  $94DF  A5 1C     LDA $1C
  $94E1  29 08     AND #$08
  $94E3  D0 02     BNE $94E7
  $94E5  A0 20     LDY #$20

L_94E7:
  $94E7  84 00     STY $00
  $94E9  A6 FD     LDX $FD
  $94EB  D0 0C     BNE $94F9
  $94ED  A5 00     LDA $00
  $94EF  F0 16     BEQ $9507
  $94F1  A9 F8     LDA #$F8
  $94F3  8D 00 02  STA $0200
  $94F6  4C 07 95  JMP $9507

L_94F9:
  $94F9  CA        DEX
  $94FA  8A        TXA
  $94FB  0A        ASL
  $94FC  0A        ASL
  $94FD  A8        TAY
  $94FE  A5 00     LDA $00
  $9500  F0 05     BEQ $9507
  $9502  A9 F8     LDA #$F8
  $9504  99 14 02  STA $0214,Y

L_9507:
  $9507  A2 00     LDX #$00

L_9509:
  $9509  18        CLC
  $950A  BD 03 02  LDA $0203,X
  $950D  65 08     ADC $08
  $950F  9D 03 02  STA $0203,X
  $9512  E8        INX
  $9513  E8        INX
  $9514  E8        INX
  $9515  E8        INX
  $9516  D0 F1     BNE $9509
  $9518  60        RTS
  $9519  2C 3C 4C  BIT $4C3C
  $951C  5C        .db $5C
  $951D  6C 7C 8C  JMP ($8C7C)
  $9520  9C        .db $9C
  $9521  3C        .db $3C
  $9522  4C 5C 6C  JMP $6C5C
  $9525  7C        .db $7C
  $9526  8C 9C AC  STY $AC9C

L_9529:
  $9529  B5 9C     LDA $9C,X

L_952B:
  $952B  85 01     STA $01
  $952D  A2 06     LDX #$06

L_952F:
  $952F  A5 02     LDA $02
  $9531  99 00 02  STA $0200,Y
  $9534  38        SEC
  $9535  A5 01     LDA $01
  $9537  E9 04     SBC #$04
  $9539  B0 0E     BCS $9549
  $953B  A4 01     LDY $01
  $953D  A9 00     LDA #$00
  $953F  85 01     STA $01
  $9541  B9 6C 95  LDA $956C,Y
  $9544  A4 00     LDY $00
  $9546  4C 4D 95  JMP $954D

L_9549:
  $9549  85 01     STA $01
  $954B  A9 90     LDA #$90

L_954D:
  $954D  99 01 02  STA $0201,Y
  $9550  A9 01     LDA #$01
  $9552  99 02 02  STA $0202,Y
  $9555  BD 65 95  LDA $9565,X
  $9558  99 03 02  STA $0203,Y
  $955B  C8        INY
  $955C  C8        INY
  $955D  C8        INY
  $955E  C8        INY
  $955F  84 00     STY $00
  $9561  CA        DEX
  $9562  10 CB     BPL $952F
  $9564  60        RTS
  $9565  4C 44 3C  JMP $3C44
  $9568  34        .db $34
  $9569  2C 24 1C  BIT $1C24
  $956C  94 93     STY $93,X
  $956E  92        .db $92
  $956F  91 00     STA ($00),Y
  $9571  01 02     ORA ($02,X)
  $9573  03        .db $03
  $9574  04        .db $04
  $9575  05 03     ORA $03
  $9577  04        .db $04
  $9578  05 03     ORA $03
  $957A  04        .db $04
  $957B  05 06     ORA $06
  $957D  07        .db $07
  $957E  08        PHP
  $957F  00        BRK
  $9580  20 40 04  JSR $0440
  $9583  24 44     BIT $44
  $9585  08        PHP
  $9586  28        PLP
  $9587  48        PHA
  $9588  0C        .db $0C
  $9589  2C 4C 10  BIT $104C
  $958C  30 50     BMI $95DE
  $958E  40        RTI
  $958F  40        RTI
  $9590  40        RTI
  $9591  40        RTI
  $9592  40        RTI
  $9593  41 41     EOR ($41,X)
  $9595  41 40     EOR ($40,X)
  $9597  41 41     EOR ($41,X)
  $9599  41 40     EOR ($40,X)
  $959B  41 41     EOR ($41,X)
  $959D  41 40     EOR ($40,X)
  $959F  40        RTI
  $95A0  40        RTI
  $95A1  40        RTI
  $95A2  41 41     EOR ($41,X)
  $95A4  41 41     EOR ($41,X)
  $95A6  41 41     EOR ($41,X)
  $95A8  41 41     EOR ($41,X)
  $95AA  41 41     EOR ($41,X)
  $95AC  41 41     EOR ($41,X)
  $95AE  40        RTI
  $95AF  40        RTI
  $95B0  40        RTI
  $95B1  40        RTI
  $95B2  41 41     EOR ($41,X)
  $95B4  41 40     EOR ($40,X)
  $95B6  41 41     EOR ($41,X)
  $95B8  41 40     EOR ($40,X)
  $95BA  41 41     EOR ($41,X)
  $95BC  41 40     EOR ($40,X)
  $95BE  40        RTI
  $95BF  41 41     EOR ($41,X)
  $95C1  41 40     EOR ($40,X)
  $95C3  41 41     EOR ($41,X)
  $95C5  41 40     EOR ($40,X)
  $95C7  41 41     EOR ($41,X)
  $95C9  41 40     EOR ($40,X)
  $95CB  41 41     EOR ($41,X)
  $95CD  41 41     EOR ($41,X)
  $95CF  41 41     EOR ($41,X)
  $95D1  41 41     EOR ($41,X)
  $95D3  41 41     EOR ($41,X)
  $95D5  41 41     EOR ($41,X)
  $95D7  41 41     EOR ($41,X)
  $95D9  41 41     EOR ($41,X)
  $95DB  41 41     EOR ($41,X)
  $95DD  41 41     EOR ($41,X)
  $95DF  41 41     EOR ($41,X)
  $95E1  40        RTI
  $95E2  41 41     EOR ($41,X)
  $95E4  41 40     EOR ($40,X)
  $95E6  41 41     EOR ($41,X)
  $95E8  41 40     EOR ($40,X)
  $95EA  41 41     EOR ($41,X)
  $95EC  41 40     EOR ($40,X)
  $95EE  40        RTI
  $95EF  41 41     EOR ($41,X)
  $95F1  41 40     EOR ($40,X)
  $95F3  41 41     EOR ($41,X)
  $95F5  41 40     EOR ($40,X)
  $95F7  41 41     EOR ($41,X)
  $95F9  41 40     EOR ($40,X)
  $95FB  40        RTI
  $95FC  40        RTI
  $95FD  40        RTI
  $95FE  41 41     EOR ($41,X)
  $9600  41 41     EOR ($41,X)
  $9602  41 41     EOR ($41,X)
  $9604  41 41     EOR ($41,X)
  $9606  41 41     EOR ($41,X)
  $9608  41 41     EOR ($41,X)
  $960A  40        RTI
  $960B  40        RTI
  $960C  40        RTI
  $960D  40        RTI
  $960E  41 41     EOR ($41,X)
  $9610  41 40     EOR ($40,X)
  $9612  41 41     EOR ($41,X)
  $9614  41 40     EOR ($40,X)
  $9616  41 41     EOR ($41,X)
  $9618  41 40     EOR ($40,X)
  $961A  40        RTI
  $961B  40        RTI
  $961C  40        RTI
  $961D  40        RTI
  $961E  00        BRK
  $961F  55 AA     EOR $AA,X
  $9621  00        BRK
  $9622  AA        TAX
  $9623  00        BRK
  $9624  00        BRK
  $9625  00        BRK
  $9626  00        BRK
  $9627  00        BRK
  $9628  55 AA     EOR $AA,X
  $962A  00        BRK
  $962B  00        BRK
  $962C  34        .db $34
  $962D  11 01     ORA ($01),Y
  $962F  0C        .db $0C
  $9630  34        .db $34
  $9631  95 01     STA $01,X
  $9633  1C        .db $1C
  $9634  34        .db $34
  $9635  96 01     STX $01,Y
  $9637  24 34     BIT $34
  $9639  97        .db $97
  $963A  01 2C     ORA ($2C,X)
  $963C  34        .db $34
  $963D  98        TYA
  $963E  01 34     ORA ($34,X)
  $9640  1F        .db $1F
  $9641  9F        .db $9F
  $9642  9B        .db $9B
  $9643  99 9D 9C  STA $9C9D,Y
  $9646  9A        TXS
  $9647  9E        .db $9E
  $9648  10 15     BPL $965F
  $964A  16 17     ASL $17,X
  $964C  A4 96     LDY $96
  $964E  01 0C     ORA ($0C,X)
  $9650  A0 8D     LDY #$8D
  $9652  00        BRK
  $9653  18        CLC
  $9654  A0 8D     LDY #$8D
  $9656  40        RTI
  $9657  20 A8 8E  JSR $8EA8
  $965A  01 18     ORA ($18,X)
  $965C  A8        TAY
  $965D  8E 41 20  STX $2041
  $9660  A4 1E     LDY $1E
  $9662  01 2C     ORA ($2C,X)
  $9664  98        TYA
  $9665  9A        TXS
  $9666  99 9C 98  STA $989C,Y
  $9669  98        TYA
  $966A  9A        TXS
  $966B  98        TYA
  $966C  9B        .db $9B
  $966D  9B        .db $9B
  $966E  9B        .db $9B
  $966F  9B        .db $9B
  $9670  00        BRK
  $9671  01 02     ORA ($02,X)
  $9673  04        .db $04
  $9674  08        PHP
  $9675  10 20     BPL $9697
  $9677  40        RTI

L_9678:
  $9678  A9 10     LDA #$10
  $967A  85 F7     STA $F7
  $967C  8D 00 20  STA $2000
  $967F  A9 06     LDA #$06
  $9681  85 F8     STA $F8
  $9683  8D 01 20  STA $2001
  $9686  A9 0F     LDA #$0F
  $9688  20 5D C0  JSR $C05D
  $968B  20 7E 84  JSR $847E
  $968E  A9 01     LDA #$01
  $9690  20 44 C6  JSR $C644
  $9693  A9 20     LDA #$20
  $9695  8D 06 20  STA $2006
  $9698  A0 00     LDY #$00
  $969A  8C 06 20  STY $2006

L_969D:
  $969D  B9 83 9B  LDA $9B83,Y
  $96A0  A2 40     LDX #$40

L_96A2:
  $96A2  8D 07 20  STA $2007
  $96A5  CA        DEX
  $96A6  D0 FA     BNE $96A2
  $96A8  C8        INY
  $96A9  C0 10     CPY #$10
  $96AB  D0 F0     BNE $969D
  $96AD  A9 28     LDA #$28
  $96AF  8D 06 20  STA $2006
  $96B2  A0 00     LDY #$00
  $96B4  8C 06 20  STY $2006
  $96B7  A9 AC     LDA #$AC
  $96B9  85 09     STA $09
  $96BB  A9 03     LDA #$03
  $96BD  20 28 C6  JSR $C628
  $96C0  A2 1F     LDX #$1F

L_96C2:
  $96C2  BD 93 9B  LDA $9B93,X
  $96C5  9D 56 03  STA $0356,X
  $96C8  CA        DEX
  $96C9  10 F7     BPL $96C2
  $96CB  20 73 84  JSR $8473
  $96CE  A5 2A     LDA $2A
  $96D0  C9 09     CMP #$09
  $96D2  90 06     BCC $96DA
  $96D4  20 27 9B  JSR $9B27
  $96D7  4C 45 99  JMP $9945

L_96DA:
  $96DA  A9 12     LDA #$12
  $96DC  20 51 C0  JSR $C051
  $96DF  20 1D A5  JSR $A51D
  $96E2  A9 FF     LDA #$FF
  $96E4  8D 40 04  STA $0440
  $96E7  8D 41 04  STA $0441
  $96EA  A9 D0     LDA #$D0
  $96EC  8D 60 04  STA $0460
  $96EF  8D 61 04  STA $0461
  $96F2  A9 68     LDA #$68
  $96F4  8D A0 04  STA $04A0
  $96F7  A9 80     LDA #$80
  $96F9  8D A1 04  STA $04A1
  $96FC  A9 00     LDA #$00
  $96FE  8D 00 04  STA $0400
  $9701  8D 81 06  STA $0681
  $9704  8D 80 04  STA $0480
  $9707  8D 81 04  STA $0481
  $970A  8D C0 04  STA $04C0
  $970D  8D C1 04  STA $04C1
  $9710  A9 01     LDA #$01
  $9712  8D 01 04  STA $0401

L_9715:
  $9715  18        CLC
  $9716  AD 80 04  LDA $0480
  $9719  69 40     ADC #$40
  $971B  8D 80 04  STA $0480
  $971E  AD 60 04  LDA $0460
  $9721  69 01     ADC #$01
  $9723  8D 60 04  STA $0460
  $9726  8D 61 04  STA $0461
  $9729  AD 40 04  LDA $0440
  $972C  69 00     ADC #$00
  $972E  8D 40 04  STA $0440
  $9731  8D 41 04  STA $0441
  $9734  D0 07     BNE $973D
  $9736  AD 60 04  LDA $0460
  $9739  C9 68     CMP #$68
  $973B  B0 18     BCS $9755

L_973D:
  $973D  20 C6 99  JSR $99C6
  $9740  20 73 84  JSR $8473
  $9743  A2 00     LDX #$00
  $9745  86 00     STX $00
  $9747  20 C8 9A  JSR $9AC8
  $974A  A2 01     LDX #$01
  $974C  20 C8 9A  JSR $9AC8
  $974F  20 AB C0  JSR $C0AB
  $9752  4C 15 97  JMP $9715

L_9755:
  $9755  20 73 84  JSR $8473
  $9758  A2 00     LDX #$00
  $975A  86 00     STX $00
  $975C  20 C8 9A  JSR $9AC8
  $975F  A2 01     LDX #$01
  $9761  20 C8 9A  JSR $9AC8
  $9764  A9 3E     LDA #$3E
  $9766  85 FD     STA $FD

L_9768:
  $9768  20 C6 99  JSR $99C6
  $976B  A2 00     LDX #$00
  $976D  86 00     STX $00
  $976F  20 C8 9A  JSR $9AC8
  $9772  A2 01     LDX #$01
  $9774  20 C8 9A  JSR $9AC8
  $9777  20 AB C0  JSR $C0AB
  $977A  C6 FD     DEC $FD
  $977C  D0 EA     BNE $9768
  $977E  A9 04     LDA #$04
  $9780  8D 02 04  STA $0402
  $9783  A9 6C     LDA #$6C
  $9785  8D 62 04  STA $0462
  $9788  A9 70     LDA #$70
  $978A  8D A2 04  STA $04A2
  $978D  A9 00     LDA #$00
  $978F  8D 42 04  STA $0442
  $9792  A9 50     LDA #$50
  $9794  85 FD     STA $FD

L_9796:
  $9796  38        SEC
  $9797  AD C0 04  LDA $04C0
  $979A  E9 80     SBC #$80
  $979C  8D C0 04  STA $04C0
  $979F  AD A0 04  LDA $04A0
  $97A2  E9 00     SBC #$00
  $97A4  8D A0 04  STA $04A0
  $97A7  20 C6 99  JSR $99C6
  $97AA  20 E5 99  JSR $99E5
  $97AD  20 AB C0  JSR $C0AB
  $97B0  C6 FD     DEC $FD
  $97B2  D0 E2     BNE $9796
  $97B4  A9 FA     LDA #$FA
  $97B6  85 FD     STA $FD

L_97B8:
  $97B8  EE 82 06  INC $0682
  $97BB  AD 82 06  LDA $0682
  $97BE  C9 08     CMP #$08
  $97C0  90 14     BCC $97D6
  $97C2  A9 00     LDA #$00
  $97C4  8D 82 06  STA $0682
  $97C7  EE 02 04  INC $0402
  $97CA  AD 02 04  LDA $0402
  $97CD  C9 06     CMP #$06
  $97CF  90 05     BCC $97D6
  $97D1  A9 04     LDA #$04
  $97D3  8D 02 04  STA $0402

L_97D6:
  $97D6  20 C6 99  JSR $99C6
  $97D9  20 E5 99  JSR $99E5
  $97DC  20 AB C0  JSR $C0AB
  $97DF  C6 FD     DEC $FD
  $97E1  D0 D5     BNE $97B8
  $97E3  A9 50     LDA #$50
  $97E5  85 FD     STA $FD

L_97E7:
  $97E7  18        CLC
  $97E8  AD C0 04  LDA $04C0
  $97EB  69 80     ADC #$80
  $97ED  8D C0 04  STA $04C0
  $97F0  AD A0 04  LDA $04A0
  $97F3  69 00     ADC #$00
  $97F5  8D A0 04  STA $04A0
  $97F8  20 C6 99  JSR $99C6
  $97FB  20 E5 99  JSR $99E5
  $97FE  20 AB C0  JSR $C0AB
  $9801  C6 FD     DEC $FD
  $9803  D0 E2     BNE $97E7
  $9805  A9 FD     LDA #$FD
  $9807  20 51 C0  JSR $C051
  $980A  A9 06     LDA #$06
  $980C  8D 00 04  STA $0400
  $980F  A9 01     LDA #$01
  $9811  8D A0 06  STA $06A0
  $9814  A9 00     LDA #$00
  $9816  85 FD     STA $FD
  $9818  8D 20 06  STA $0620
  $981B  A9 04     LDA #$04
  $981D  8D 00 06  STA $0600

L_9820:
  $9820  AD A0 06  LDA $06A0
  $9823  D0 36     BNE $985B
  $9825  A2 00     LDX #$00
  $9827  AD 60 04  LDA $0460
  $982A  C9 68     CMP #$68
  $982C  B0 01     BCS $982F
  $982E  E8        INX

L_982F:
  $982F  18        CLC
  $9830  AD 20 06  LDA $0620
  $9833  7D 88 9D  ADC $9D88,X
  $9836  8D 20 06  STA $0620
  $9839  AD 00 06  LDA $0600
  $983C  7D 8A 9D  ADC $9D8A,X
  $983F  8D 00 06  STA $0600
  $9842  38        SEC
  $9843  AD 80 04  LDA $0480
  $9846  ED 20 06  SBC $0620
  $9849  8D 80 04  STA $0480
  $984C  AD 60 04  LDA $0460
  $984F  ED 00 06  SBC $0600
  $9852  8D 60 04  STA $0460
  $9855  C9 18     CMP #$18
  $9857  B0 66     BCS $98BF
  $9859  90 43     BCC $989E

L_985B:
  $985B  A2 00     LDX #$00
  $985D  AD 60 04  LDA $0460
  $9860  C9 68     CMP #$68
  $9862  90 01     BCC $9865
  $9864  E8        INX

L_9865:
  $9865  18        CLC
  $9866  AD 20 06  LDA $0620
  $9869  7D 88 9D  ADC $9D88,X
  $986C  8D 20 06  STA $0620
  $986F  AD 00 06  LDA $0600
  $9872  7D 8A 9D  ADC $9D8A,X
  $9875  8D 00 06  STA $0600
  $9878  18        CLC
  $9879  AD 80 04  LDA $0480
  $987C  6D 20 06  ADC $0620
  $987F  8D 80 04  STA $0480
  $9882  AD 60 04  LDA $0460
  $9885  6D 00 06  ADC $0600
  $9888  8D 60 04  STA $0460
  $988B  C9 68     CMP #$68
  $988D  90 30     BCC $98BF
  $988F  A6 FD     LDX $FD
  $9891  BD 83 9D  LDA $9D83,X
  $9894  8D 00 04  STA $0400
  $9897  AD 60 04  LDA $0460
  $989A  C9 B8     CMP #$B8
  $989C  90 21     BCC $98BF

L_989E:
  $989E  A9 00     LDA #$00
  $98A0  8D 00 06  STA $0600
  $98A3  8D 20 06  STA $0620
  $98A6  AD A0 06  LDA $06A0
  $98A9  08        PHP
  $98AA  49 01     EOR #$01
  $98AC  8D A0 06  STA $06A0
  $98AF  28        PLP
  $98B0  F0 0D     BEQ $98BF
  $98B2  E6 FD     INC $FD
  $98B4  A5 FD     LDA $FD
  $98B6  C9 03     CMP #$03
  $98B8  D0 05     BNE $98BF
  $98BA  A9 11     LDA #$11
  $98BC  20 51 C0  JSR $C051

L_98BF:
  $98BF  20 73 84  JSR $8473
  $98C2  A2 00     LDX #$00
  $98C4  86 00     STX $00
  $98C6  20 C8 9A  JSR $9AC8
  $98C9  AD 00 04  LDA $0400
  $98CC  D0 0E     BNE $98DC
  $98CE  AD 60 04  LDA $0460
  $98D1  8D 61 04  STA $0461
  $98D4  20 C6 99  JSR $99C6
  $98D7  A2 01     LDX #$01
  $98D9  20 C8 9A  JSR $9AC8

L_98DC:
  $98DC  20 F9 99  JSR $99F9
  $98DF  20 1D 9A  JSR $9A1D
  $98E2  20 AB C0  JSR $C0AB
  $98E5  A5 FD     LDA $FD
  $98E7  C9 05     CMP #$05
  $98E9  F0 03     BEQ $98EE
  $98EB  4C 20 98  JMP $9820

L_98EE:
  $98EE  A9 0A     LDA #$0A
  $98F0  8D 00 04  STA $0400

L_98F3:
  $98F3  18        CLC
  $98F4  AD 20 06  LDA $0620
  $98F7  69 18     ADC #$18
  $98F9  8D 20 06  STA $0620
  $98FC  AD 00 06  LDA $0600
  $98FF  69 00     ADC #$00
  $9901  8D 00 06  STA $0600
  $9904  38        SEC
  $9905  AD 80 04  LDA $0480
  $9908  ED 20 06  SBC $0620
  $990B  8D 80 04  STA $0480
  $990E  AD 60 04  LDA $0460
  $9911  ED 00 06  SBC $0600
  $9914  8D 60 04  STA $0460
  $9917  C9 68     CMP #$68
  $9919  90 16     BCC $9931
  $991B  20 73 84  JSR $8473
  $991E  A2 00     LDX #$00
  $9920  86 00     STX $00
  $9922  20 C8 9A  JSR $9AC8
  $9925  20 F9 99  JSR $99F9
  $9928  20 1D 9A  JSR $9A1D
  $992B  20 AB C0  JSR $C0AB
  $992E  4C F3 98  JMP $98F3

L_9931:
  $9931  20 73 84  JSR $8473
  $9934  20 1D 9A  JSR $9A1D
  $9937  A9 3E     LDA #$3E
  $9939  85 FD     STA $FD

L_993B:
  $993B  20 AB C0  JSR $C0AB
  $993E  C6 FD     DEC $FD
  $9940  D0 F9     BNE $993B
  $9942  20 73 84  JSR $8473

L_9945:
  $9945  A2 1F     LDX #$1F

L_9947:
  $9947  BD B3 9B  LDA $9BB3,X
  $994A  9D 56 03  STA $0356,X
  $994D  CA        DEX
  $994E  10 F7     BPL $9947
  $9950  A9 37     LDA #$37
  $9952  85 FD     STA $FD

L_9954:
  $9954  A2 0F     LDX #$0F
  $9956  A5 FD     LDA $FD
  $9958  29 08     AND #$08
  $995A  F0 02     BEQ $995E
  $995C  A2 30     LDX #$30

L_995E:
  $995E  8E 66 03  STX $0366
  $9961  20 AB C0  JSR $C0AB
  $9964  C6 FD     DEC $FD
  $9966  10 EC     BPL $9954
  $9968  A6 2A     LDX $2A
  $996A  BD A8 9D  LDA $9DA8,X
  $996D  85 FD     STA $FD
  $996F  A9 3E     LDA #$3E
  $9971  85 FE     STA $FE

L_9973:
  $9973  A5 FD     LDA $FD
  $9975  85 00     STA $00
  $9977  20 63 9A  JSR $9A63
  $997A  20 AB C0  JSR $C0AB
  $997D  C6 FE     DEC $FE
  $997F  D0 F2     BNE $9973

L_9981:
  $9981  A5 1C     LDA $1C
  $9983  29 03     AND #$03
  $9985  D0 13     BNE $999A
  $9987  A9 28     LDA #$28
  $9989  20 51 C0  JSR $C051
  $998C  18        CLC
  $998D  A5 FD     LDA $FD
  $998F  69 04     ADC #$04
  $9991  85 FD     STA $FD
  $9993  A6 2A     LDX $2A
  $9995  DD A9 9D  CMP $9DA9,X
  $9998  F0 0D     BEQ $99A7

L_999A:
  $999A  A5 FD     LDA $FD
  $999C  85 00     STA $00
  $999E  20 63 9A  JSR $9A63
  $99A1  20 AB C0  JSR $C0AB
  $99A4  4C 81 99  JMP $9981

L_99A7:
  $99A7  A9 7D     LDA #$7D
  $99A9  85 FE     STA $FE

L_99AB:
  $99AB  A5 FD     LDA $FD
  $99AD  85 00     STA $00
  $99AF  20 63 9A  JSR $9A63
  $99B2  20 AB C0  JSR $C0AB
  $99B5  C6 FE     DEC $FE
  $99B7  D0 F2     BNE $99AB
  $99B9  20 2D A5  JSR $A52D
  $99BC  A9 00     LDA #$00
  $99BE  85 AE     STA $AE
  $99C0  A9 0E     LDA #$0E
  $99C2  20 5D C0  JSR $C05D
  $99C5  60        RTS

L_99C6:
  $99C6  EE 81 06  INC $0681
  $99C9  AD 81 06  LDA $0681
  $99CC  C9 06     CMP #$06
  $99CE  90 14     BCC $99E4
  $99D0  A9 00     LDA #$00
  $99D2  8D 81 06  STA $0681
  $99D5  EE 01 04  INC $0401
  $99D8  AD 01 04  LDA $0401
  $99DB  C9 04     CMP #$04
  $99DD  90 05     BCC $99E4
  $99DF  A9 01     LDA #$01
  $99E1  8D 01 04  STA $0401

L_99E4:
  $99E4  60        RTS

L_99E5:
  $99E5  20 73 84  JSR $8473
  $99E8  A2 00     LDX #$00
  $99EA  86 00     STX $00

L_99EC:
  $99EC  86 2B     STX $2B
  $99EE  20 C8 9A  JSR $9AC8
  $99F1  A6 2B     LDX $2B
  $99F3  E8        INX
  $99F4  E0 03     CPX #$03
  $99F6  D0 F4     BNE $99EC
  $99F8  60        RTS

L_99F9:
  $99F9  A5 22     LDA $22
  $99FB  D0 04     BNE $9A01
  $99FD  A5 AE     LDA $AE
  $99FF  D0 1B     BNE $9A1C

L_9A01:
  $9A01  18        CLC
  $9A02  A5 21     LDA $21
  $9A04  69 80     ADC #$80
  $9A06  85 21     STA $21
  $9A08  A5 22     LDA $22
  $9A0A  69 00     ADC #$00
  $9A0C  C9 F0     CMP #$F0
  $9A0E  D0 06     BNE $9A16
  $9A10  A9 02     LDA #$02
  $9A12  85 AE     STA $AE
  $9A14  A9 00     LDA #$00

L_9A16:
  $9A16  85 22     STA $22
  $9A18  A5 22     LDA $22
  $9A1A  D0 00     BNE $9A1C

L_9A1C:
  $9A1C  60        RTS

L_9A1D:
  $9A1D  A5 AE     LDA $AE
  $9A1F  D0 0E     BNE $9A2F
  $9A21  38        SEC
  $9A22  A9 5F     LDA #$5F
  $9A24  E5 22     SBC $22
  $9A26  85 01     STA $01
  $9A28  A9 01     LDA #$01
  $9A2A  E9 00     SBC #$00
  $9A2C  F0 05     BEQ $9A33
  $9A2E  60        RTS

L_9A2F:
  $9A2F  A9 6F     LDA #$6F
  $9A31  85 01     STA $01

L_9A33:
  $9A33  A9 05     LDA #$05
  $9A35  85 02     STA $02
  $9A37  A2 00     LDX #$00

L_9A39:
  $9A39  18        CLC
  $9A3A  BD 6F 9D  LDA $9D6F,X
  $9A3D  65 01     ADC $01
  $9A3F  B0 19     BCS $9A5A
  $9A41  C9 F0     CMP #$F0
  $9A43  B0 15     BCS $9A5A
  $9A45  9D EC 02  STA $02EC,X
  $9A48  BD 70 9D  LDA $9D70,X
  $9A4B  9D ED 02  STA $02ED,X
  $9A4E  BD 71 9D  LDA $9D71,X
  $9A51  9D EE 02  STA $02EE,X
  $9A54  BD 72 9D  LDA $9D72,X
  $9A57  9D EF 02  STA $02EF,X

L_9A5A:
  $9A5A  E8        INX
  $9A5B  E8        INX
  $9A5C  E8        INX
  $9A5D  E8        INX
  $9A5E  C6 02     DEC $02
  $9A60  D0 D7     BNE $9A39
  $9A62  60        RTS

L_9A63:
  $9A63  20 73 84  JSR $8473
  $9A66  A2 23     LDX #$23

L_9A68:
  $9A68  BD 8C 9D  LDA $9D8C,X
  $9A6B  9D 00 02  STA $0200,X
  $9A6E  CA        DEX
  $9A6F  10 F7     BPL $9A68
  $9A71  A5 00     LDA $00
  $9A73  F0 52     BEQ $9AC7
  $9A75  A0 00     LDY #$00

L_9A77:
  $9A77  B9 B7 9D  LDA $9DB7,Y
  $9A7A  99 24 02  STA $0224,Y
  $9A7D  C8        INY
  $9A7E  E8        INX
  $9A7F  C6 00     DEC $00
  $9A81  D0 F4     BNE $9A77
  $9A83  A5 1C     LDA $1C
  $9A85  29 08     AND #$08
  $9A87  D0 3E     BNE $9AC7
  $9A89  A5 2A     LDA $2A
  $9A8B  C9 0C     CMP #$0C
  $9A8D  B0 12     BCS $9AA1
  $9A8F  38        SEC
  $9A90  A5 2A     LDA $2A
  $9A92  E9 07     SBC #$07
  $9A94  0A        ASL
  $9A95  0A        ASL
  $9A96  AA        TAX
  $9A97  A9 73     LDA #$73
  $9A99  9D 01 02  STA $0201,X
  $9A9C  A9 03     LDA #$03
  $9A9E  9D 02 02  STA $0202,X

L_9AA1:
  $9AA1  A9 77     LDA #$77
  $9AA3  8D 15 02  STA $0215
  $9AA6  8D 19 02  STA $0219
  $9AA9  A9 78     LDA #$78
  $9AAB  8D 1D 02  STA $021D
  $9AAE  8D 21 02  STA $0221
  $9AB1  A5 2A     LDA $2A
  $9AB3  C9 0D     CMP #$0D
  $9AB5  D0 10     BNE $9AC7
  $9AB7  A9 77     LDA #$77
  $9AB9  8D F5 02  STA $02F5
  $9ABC  8D E9 02  STA $02E9
  $9ABF  A9 78     LDA #$78
  $9AC1  8D ED 02  STA $02ED
  $9AC4  8D F1 02  STA $02F1

L_9AC7:
  $9AC7  60        RTS

L_9AC8:
  $9AC8  BC 00 04  LDY $0400,X
  $9ACB  B9 D3 9B  LDA $9BD3,Y
  $9ACE  85 08     STA $08
  $9AD0  B9 DE 9B  LDA $9BDE,Y
  $9AD3  85 09     STA $09
  $9AD5  BD 60 04  LDA $0460,X
  $9AD8  85 0A     STA $0A
  $9ADA  BD 40 04  LDA $0440,X
  $9ADD  85 0B     STA $0B
  $9ADF  BD A0 04  LDA $04A0,X
  $9AE2  85 0C     STA $0C
  $9AE4  A0 00     LDY #$00
  $9AE6  B1 08     LDA ($08),Y
  $9AE8  C8        INY
  $9AE9  85 0D     STA $0D
  $9AEB  A6 00     LDX $00

L_9AED:
  $9AED  18        CLC
  $9AEE  B1 08     LDA ($08),Y
  $9AF0  65 0C     ADC $0C
  $9AF2  9D 00 02  STA $0200,X
  $9AF5  C8        INY
  $9AF6  B1 08     LDA ($08),Y
  $9AF8  9D 01 02  STA $0201,X
  $9AFB  C8        INY
  $9AFC  B1 08     LDA ($08),Y
  $9AFE  9D 02 02  STA $0202,X
  $9B01  C8        INY
  $9B02  18        CLC
  $9B03  B1 08     LDA ($08),Y
  $9B05  65 0A     ADC $0A
  $9B07  85 01     STA $01
  $9B09  A5 0B     LDA $0B
  $9B0B  69 00     ADC #$00
  $9B0D  F0 07     BEQ $9B16
  $9B0F  A9 F8     LDA #$F8
  $9B11  9D 00 02  STA $0200,X
  $9B14  D0 09     BNE $9B1F

L_9B16:
  $9B16  A5 01     LDA $01
  $9B18  9D 03 02  STA $0203,X
  $9B1B  E8        INX
  $9B1C  E8        INX
  $9B1D  E8        INX
  $9B1E  E8        INX

L_9B1F:
  $9B1F  C8        INY
  $9B20  C6 0D     DEC $0D
  $9B22  D0 C9     BNE $9AED
  $9B24  86 00     STX $00
  $9B26  60        RTS

L_9B27:
  $9B27  A2 1F     LDX #$1F
  $9B29  A9 0F     LDA #$0F

L_9B2B:
  $9B2B  9D 56 03  STA $0356,X
  $9B2E  CA        DEX
  $9B2F  10 FA     BPL $9B2B
  $9B31  A9 02     LDA #$02
  $9B33  85 AE     STA $AE
  $9B35  20 1D A5  JSR $A51D
  $9B38  20 1D 9A  JSR $9A1D
  $9B3B  A2 00     LDX #$00
  $9B3D  86 FD     STX $FD
  $9B3F  A9 08     LDA #$08
  $9B41  85 FE     STA $FE

L_9B43:
  $9B43  C6 FE     DEC $FE
  $9B45  D0 1A     BNE $9B61
  $9B47  A9 08     LDA #$08
  $9B49  85 FE     STA $FE
  $9B4B  A6 FD     LDX $FD
  $9B4D  A0 00     LDY #$00

L_9B4F:
  $9B4F  BD 87 9E  LDA $9E87,X
  $9B52  99 56 03  STA $0356,Y
  $9B55  E8        INX
  $9B56  C8        INY
  $9B57  C0 20     CPY #$20
  $9B59  D0 F4     BNE $9B4F
  $9B5B  E0 60     CPX #$60
  $9B5D  F0 08     BEQ $9B67
  $9B5F  86 FD     STX $FD

L_9B61:
  $9B61  20 AB C0  JSR $C0AB
  $9B64  4C 43 9B  JMP $9B43

L_9B67:
  $9B67  A9 11     LDA #$11
  $9B69  20 51 C0  JSR $C051
  $9B6C  A9 02     LDA #$02
  $9B6E  85 FE     STA $FE

L_9B70:
  $9B70  A9 A0     LDA #$A0
  $9B72  85 FD     STA $FD

L_9B74:
  $9B74  20 AB C0  JSR $C0AB
  $9B77  C6 FD     DEC $FD
  $9B79  D0 F9     BNE $9B74
  $9B7B  C6 FE     DEC $FE
  $9B7D  D0 F1     BNE $9B70
  $9B7F  20 73 84  JSR $8473
  $9B82  60        RTS
  $9B83  E8        INX
  $9B84  E8        INX
  $9B85  E8        INX
  $9B86  E8        INX
  $9B87  E8        INX
  $9B88  E8        INX
  $9B89  E8        INX
  $9B8A  E8        INX
  $9B8B  E8        INX
  $9B8C  E8        INX
  $9B8D  E8        INX
  $9B8E  E8        INX
  $9B8F  E8        INX
  $9B90  E8        INX
  $9B91  E8        INX
  $9B92  00        BRK
  $9B93  0F        .db $0F
  $9B94  20 21 11  JSR $1121
  $9B97  0F        .db $0F
  $9B98  20 10 00  JSR $0010
  $9B9B  0F        .db $0F
  $9B9C  20 26 15  JSR $1526
  $9B9F  0F        .db $0F
  $9BA0  17        .db $17
  $9BA1  21 07     AND ($07,X)
  $9BA3  0F        .db $0F
  $9BA4  16 29     ASL $29,X
  $9BA6  09 0F     ORA #$0F
  $9BA8  0F        .db $0F
  $9BA9  30 38     BMI $9BE3
  $9BAB  0F        .db $0F
  $9BAC  0F        .db $0F
  $9BAD  30 28     BMI $9BD7
  $9BAF  0F        .db $0F
  $9BB0  0F        .db $0F
  $9BB1  12        .db $12
  $9BB2  2C 0F 11  BIT $110F
  $9BB5  11 11     ORA ($11),Y
  $9BB7  0F        .db $0F
  $9BB8  11 11     ORA ($11),Y
  $9BBA  11 0F     ORA ($0F),Y
  $9BBC  11 11     ORA ($11),Y
  $9BBE  11 0F     ORA ($0F),Y
  $9BC0  17        .db $17
  $9BC1  11 07     ORA ($07),Y
  $9BC3  0F        .db $0F
  $9BC4  16 29     ASL $29,X
  $9BC6  09 0F     ORA #$0F
  $9BC8  0F        .db $0F
  $9BC9  30 38     BMI $9C03
  $9BCB  0F        .db $0F
  $9BCC  0F        .db $0F
  $9BCD  28        PLP
  $9BCE  30 0F     BMI $9BDF
  $9BD0  0F        .db $0F
  $9BD1  12        .db $12
  $9BD2  2C E9 2A  BIT $2AE9
  $9BD5  5B        .db $5B
  $9BD6  8C BD E6  STY $E6BD
  $9BD9  0F        .db $0F
  $9BDA  0F        .db $0F
  $9BDB  50 61     BVC $9C3E
  $9BDD  6A        ROR
  $9BDE  9B        .db $9B

L_9BDF:
  $9BDF  9C        .db $9C
  $9BE0  9C        .db $9C
  $9BE1  9C        .db $9C
  $9BE2  9C        .db $9C

L_9BE3:
  $9BE3  9C        .db $9C
  $9BE4  9D 9D 9D  STA $9D9D,X
  $9BE7  9D 9D 10  STA $109D,X
  $9BEA  00        BRK
  $9BEB  48        PHA
  $9BEC  03        .db $03
  $9BED  08        PHP
  $9BEE  00        BRK
  $9BEF  49 03     EOR #$03
  $9BF1  10 00     BPL $9BF3

L_9BF3:
  $9BF3  49 43     EOR #$43
  $9BF5  18        CLC
  $9BF6  00        BRK
  $9BF7  48        PHA
  $9BF8  43        .db $43
  $9BF9  20 08 4A  JSR $4A08
  $9BFC  03        .db $03
  $9BFD  00        BRK
  $9BFE  08        PHP
  $9BFF  4B        .db $4B
  $9C00  03        .db $03
  $9C01  08        PHP
  $9C02  08        PHP

L_9C03:
  $9C03  4C 03 10  JMP $1003
  $9C06  08        PHP
  $9C07  4C 43 18  JMP $1843
  $9C0A  08        PHP
  $9C0B  4B        .db $4B
  $9C0C  43        .db $43
  $9C0D  20 08 4A  JSR $4A08
  $9C10  43        .db $43
  $9C11  28        PLP
  $9C12  10 4D     BPL $9C61
  $9C14  03        .db $03
  $9C15  00        BRK
  $9C16  10 4E     BPL $9C66
  $9C18  03        .db $03
  $9C19  08        PHP
  $9C1A  10 4F     BPL $9C6B
  $9C1C  03        .db $03
  $9C1D  10 10     BPL $9C2F
  $9C1F  4F        .db $4F
  $9C20  43        .db $43
  $9C21  18        CLC
  $9C22  10 4E     BPL $9C72
  $9C24  43        .db $43
  $9C25  20 10 4D  JSR $4D10
  $9C28  43        .db $43
  $9C29  28        PLP
  $9C2A  0C        .db $0C
  $9C2B  00        BRK
  $9C2C  50 02     BVC $9C30
  $9C2E  00        BRK

L_9C2F:
  $9C2F  00        BRK

L_9C30:
  $9C30  51 02     EOR ($02),Y
  $9C32  08        PHP
  $9C33  00        BRK
  $9C34  52        .db $52
  $9C35  02        .db $02
  $9C36  10 00     BPL $9C38

L_9C38:
  $9C38  52        .db $52
  $9C39  42        .db $42
  $9C3A  18        CLC
  $9C3B  00        BRK
  $9C3C  51 42     EOR ($42),Y

L_9C3E:
  $9C3E  20 00 50  JSR $5000
  $9C41  42        .db $42
  $9C42  28        PLP
  $9C43  08        PHP
  $9C44  53        .db $53
  $9C45  02        .db $02
  $9C46  00        BRK
  $9C47  08        PHP
  $9C48  54        .db $54
  $9C49  02        .db $02
  $9C4A  08        PHP
  $9C4B  08        PHP
  $9C4C  55 02     EOR $02,X
  $9C4E  10 08     BPL $9C58
  $9C50  55 42     EOR $42,X
  $9C52  18        CLC
  $9C53  08        PHP
  $9C54  54        .db $54
  $9C55  42        .db $42
  $9C56  20 08 53  JSR $5308
  $9C59  42        .db $42
  $9C5A  28        PLP
  $9C5B  0C        .db $0C
  $9C5C  00        BRK
  $9C5D  56 02     LSR $02,X
  $9C5F  00        BRK
  $9C60  00        BRK

L_9C61:
  $9C61  57        .db $57
  $9C62  02        .db $02
  $9C63  08        PHP
  $9C64  00        BRK
  $9C65  58        CLI

L_9C66:
  $9C66  02        .db $02
  $9C67  10 00     BPL $9C69

L_9C69:
  $9C69  59 02 18  EOR $1802,Y
  $9C6C  00        BRK
  $9C6D  5A        .db $5A
  $9C6E  02        .db $02
  $9C6F  20 00 5B  JSR $5B00

L_9C72:
  $9C72  02        .db $02
  $9C73  28        PLP
  $9C74  08        PHP
  $9C75  53        .db $53
  $9C76  02        .db $02
  $9C77  00        BRK
  $9C78  08        PHP
  $9C79  54        .db $54
  $9C7A  02        .db $02
  $9C7B  08        PHP
  $9C7C  08        PHP
  $9C7D  55 02     EOR $02,X
  $9C7F  10 08     BPL $9C89
  $9C81  55 42     EOR $42,X
  $9C83  18        CLC
  $9C84  08        PHP
  $9C85  54        .db $54
  $9C86  42        .db $42
  $9C87  20 08 53  JSR $5308
  $9C8A  42        .db $42
  $9C8B  28        PLP
  $9C8C  0C        .db $0C
  $9C8D  00        BRK
  $9C8E  5B        .db $5B
  $9C8F  42        .db $42
  $9C90  00        BRK
  $9C91  00        BRK
  $9C92  5A        .db $5A
  $9C93  42        .db $42
  $9C94  08        PHP
  $9C95  00        BRK
  $9C96  59 42 10  EOR $1042,Y
  $9C99  00        BRK
  $9C9A  58        CLI
  $9C9B  42        .db $42
  $9C9C  18        CLC
  $9C9D  00        BRK
  $9C9E  57        .db $57
  $9C9F  42        .db $42
  $9CA0  20 00 56  JSR $5600
  $9CA3  42        .db $42
  $9CA4  28        PLP
  $9CA5  08        PHP
  $9CA6  53        .db $53
  $9CA7  02        .db $02
  $9CA8  00        BRK
  $9CA9  08        PHP
  $9CAA  54        .db $54
  $9CAB  02        .db $02
  $9CAC  08        PHP
  $9CAD  08        PHP
  $9CAE  55 02     EOR $02,X
  $9CB0  10 08     BPL $9CBA
  $9CB2  55 42     EOR $42,X
  $9CB4  18        CLC
  $9CB5  08        PHP
  $9CB6  54        .db $54
  $9CB7  42        .db $42
  $9CB8  20 08 53  JSR $5308
  $9CBB  42        .db $42
  $9CBC  28        PLP
  $9CBD  0A        ASL
  $9CBE  00        BRK
  $9CBF  69 03     ADC #$03
  $9CC1  00        BRK
  $9CC2  00        BRK
  $9CC3  40        RTI
  $9CC4  01 08     ORA ($08,X)
  $9CC6  00        BRK
  $9CC7  41 01     EOR ($01,X)
  $9CC9  10 00     BPL $9CCB

L_9CCB:
  $9CCB  42        .db $42
  $9CCC  01 18     ORA ($18,X)
  $9CCE  00        BRK
  $9CCF  69 43     ADC #$43
  $9CD1  20 08 6A  JSR $6A08
  $9CD4  03        .db $03
  $9CD5  00        BRK
  $9CD6  08        PHP
  $9CD7  43        .db $43
  $9CD8  01 08     ORA ($08,X)
  $9CDA  08        PHP
  $9CDB  44        .db $44
  $9CDC  01 10     ORA ($10,X)
  $9CDE  08        PHP
  $9CDF  45 01     EOR $01
  $9CE1  18        CLC
  $9CE2  08        PHP
  $9CE3  6A        ROR
  $9CE4  43        .db $43
  $9CE5  20 0A 00  JSR $000A
  $9CE8  69 03     ADC #$03
  $9CEA  00        BRK
  $9CEB  00        BRK
  $9CEC  46 01     LSR $01
  $9CEE  08        PHP
  $9CEF  00        BRK
  $9CF0  47        .db $47
  $9CF1  01 10     ORA ($10,X)
  $9CF3  00        BRK
  $9CF4  42        .db $42
  $9CF5  01 18     ORA ($18,X)
  $9CF7  00        BRK
  $9CF8  69 43     ADC #$43
  $9CFA  20 08 6A  JSR $6A08
  $9CFD  03        .db $03
  $9CFE  00        BRK
  $9CFF  08        PHP
  $9D00  43        .db $43
  $9D01  01 08     ORA ($08,X)
  $9D03  08        PHP
  $9D04  44        .db $44
  $9D05  01 10     ORA ($10,X)
  $9D07  08        PHP
  $9D08  45 01     EOR $01
  $9D0A  18        CLC
  $9D0B  08        PHP
  $9D0C  6A        ROR
  $9D0D  43        .db $43
  $9D0E  20 10 08  JSR $0810
  $9D11  5C        .db $5C
  $9D12  03        .db $03
  $9D13  08        PHP
  $9D14  08        PHP
  $9D15  5D 03 10  EOR $1003,X
  $9D18  08        PHP

L_9D19:
  $9D19  5D 43 18  EOR $1843,X
  $9D1C  08        PHP
  $9D1D  5C        .db $5C
  $9D1E  43        .db $43
  $9D1F  20 10 5E  JSR $5E10
  $9D22  03        .db $03
  $9D23  08        PHP
  $9D24  10 5F     BPL $9D85
  $9D26  03        .db $03
  $9D27  10 10     BPL $9D39
  $9D29  5F        .db $5F
  $9D2A  43        .db $43
  $9D2B  18        CLC
  $9D2C  10 5E     BPL $9D8C
  $9D2E  43        .db $43
  $9D2F  20 18 60  JSR $6018
  $9D32  02        .db $02
  $9D33  08        PHP
  $9D34  18        CLC
  $9D35  61 02     ADC ($02,X)
  $9D37  10 18     BPL $9D51

L_9D39:
  $9D39  61 42     ADC ($42,X)
  $9D3B  18        CLC
  $9D3C  18        CLC
  $9D3D  60        RTS
  $9D3E  42        .db $42
  $9D3F  20 20 62  JSR $6220
  $9D42  02        .db $02
  $9D43  08        PHP
  $9D44  20 63 02  JSR $0263
  $9D47  10 20     BPL $9D69
  $9D49  63        .db $63
  $9D4A  42        .db $42
  $9D4B  18        CLC
  $9D4C  20 62 42  JSR $4262
  $9D4F  20 04 10  JSR $1004
  $9D52  64        .db $64
  $9D53  03        .db $03
  $9D54  10 10     BPL $9D66
  $9D56  64        .db $64
  $9D57  43        .db $43
  $9D58  18        CLC
  $9D59  18        CLC
  $9D5A  65 02     ADC $02
  $9D5C  10 18     BPL $9D76
  $9D5E  65 42     ADC $42
  $9D60  18        CLC
  $9D61  02        .db $02
  $9D62  10 66     BPL $9DCA
  $9D64  03        .db $03
  $9D65  14        .db $14

L_9D66:
  $9D66  18        CLC
  $9D67  67        .db $67

L_9D68:
  $9D68  02        .db $02

L_9D69:
  $9D69  14        .db $14
  $9D6A  01 14     ORA ($14,X)

L_9D6C:
  $9D6C  68        PLA
  $9D6D  03        .db $03
  $9D6E  14        .db $14
  $9D6F  00        BRK
  $9D70  6B        .db $6B
  $9D71  00        BRK
  $9D72  60        RTS
  $9D73  00        BRK
  $9D74  6C 00 68  JMP ($6800)
  $9D77  00        BRK

L_9D78:
  $9D78  6D 00 70  ADC $7000
  $9D7B  08        PHP
  $9D7C  6E 00 60  ROR $6000
  $9D7F  08        PHP
  $9D80  6F        .db $6F
  $9D81  00        BRK
  $9D82  68        PLA
  $9D83  00        BRK
  $9D84  00        BRK

L_9D85:
  $9D85  07        .db $07
  $9D86  08        PHP
  $9D87  09 18     ORA #$18
  $9D89  E9 00     SBC #$00
  $9D8B  FF        .db $FF

L_9D8C:
  $9D8C  C0 73     CPY #$73
  $9D8E  02        .db $02
  $9D8F  10 88     BPL $9D19
  $9D91  73        .db $73
  $9D92  02        .db $02
  $9D93  40        RTI
  $9D94  A0 73     LDY #$73
  $9D96  02        .db $02
  $9D97  60        RTS

L_9D98:
  $9D98  A8        TAY
  $9D99  73        .db $73
  $9D9A  02        .db $02
  $9D9B  88        DEY

L_9D9C:
  $9D9C  70 73     BVS $9E11
  $9D9E  02        .db $02
  $9D9F  98        TYA
  $9DA0  8C 75 02  STY $0275
  $9DA3  B4 8C     LDY $8C,X
  $9DA5  75 42     ADC $42,X
  $9DA7  BC 94 76  LDY $7694,X
  $9DAA  02        .db $02
  $9DAB  B4 94     LDY $94,X
  $9DAD  76 42     ROR $42,X
  $9DAF  BC 00 30  LDY $3000,X
  $9DB2  48        PHA
  $9DB3  5C        .db $5C

L_9DB4:
  $9DB4  7C        .db $7C
  $9DB5  98        TYA
  $9DB6  D0 C0     BNE $9D78

L_9DB8:
  $9DB8  71 03     ADC ($03),Y
  $9DBA  18        CLC
  $9DBB  C0 70     CPY #$70
  $9DBD  C3        .db $C3
  $9DBE  20 B8 72  JSR $72B8
  $9DC1  03        .db $03
  $9DC2  20 B0 72  JSR $72B0
  $9DC5  03        .db $03
  $9DC6  20 A8 72  JSR $72A8
  $9DC9  03        .db $03

L_9DCA:
  $9DCA  20 A0 72  JSR $72A0
  $9DCD  03        .db $03
  $9DCE  20 98 70  JSR $7098
  $9DD1  03        .db $03
  $9DD2  20 98 71  JSR $7198
  $9DD5  03        .db $03
  $9DD6  28        PLP
  $9DD7  98        TYA
  $9DD8  70 C3     BVS $9D9D
  $9DDA  30 90     BMI $9D6C
  $9DDC  72        .db $72
  $9DDD  03        .db $03
  $9DDE  30 88     BMI $9D68
  $9DE0  70 03     BVS $9DE5
  $9DE2  30 88     BMI $9D6C
  $9DE4  71 03     ADC ($03),Y
  $9DE6  38        SEC
  $9DE7  88        DEY

L_9DE8:
  $9DE8  70 43     BVS $9E2D
  $9DEA  48        PHA
  $9DEB  90 70     BCC $9E5D

L_9DED:
  $9DED  83        .db $83
  $9DEE  48        PHA
  $9DEF  90 70     BCC $9E61

L_9DF1:
  $9DF1  43        .db $43
  $9DF2  50 98     BVC $9D8C
  $9DF4  72        .db $72
  $9DF5  03        .db $03
  $9DF6  50 A0     BVC $9D98
  $9DF8  70 83     BVS $9D7D
  $9DFA  50 A0     BVC $9D9C
  $9DFC  71 03     ADC ($03),Y
  $9DFE  58        CLI
  $9DFF  A0 71     LDY #$71
  $9E01  03        .db $03
  $9E02  68        PLA
  $9E03  A0 70     LDY #$70
  $9E05  43        .db $43
  $9E06  70 A8     BVS $9DB0
  $9E08  70 83     BVS $9D8D
  $9E0A  70 A8     BVS $9DB4
  $9E0C  71 03     ADC ($03),Y
  $9E0E  78        SEI
  $9E0F  A8        TAY
  $9E10  71 03     ADC ($03),Y
  $9E12  80        .db $80
  $9E13  A8        TAY
  $9E14  70 C3     BVS $9DD9
  $9E16  90 A0     BCC $9DB8
  $9E18  72        .db $72
  $9E19  03        .db $03
  $9E1A  90 98     BCC $9DB4
  $9E1C  72        .db $72
  $9E1D  03        .db $03
  $9E1E  90 90     BCC $9DB0
  $9E20  72        .db $72
  $9E21  03        .db $03
  $9E22  90 88     BCC $9DAC
  $9E24  72        .db $72
  $9E25  03        .db $03
  $9E26  90 80     BCC $9DA8
  $9E28  70 03     BVS $9E2D
  $9E2A  90 80     BCC $9DAC
  $9E2C  70 C3     BVS $9DF1
  $9E2E  98        TYA
  $9E2F  78        SEI
  $9E30  72        .db $72
  $9E31  03        .db $03
  $9E32  98        TYA
  $9E33  70 71     BVS $9EA6
  $9E35  03        .db $03
  $9E36  A0 70     LDY #$70
  $9E38  70 43     BVS $9E7D
  $9E3A  A8        TAY
  $9E3B  78        SEI

L_9E3C:
  $9E3C  72        .db $72
  $9E3D  03        .db $03
  $9E3E  A8        TAY
  $9E3F  80        .db $80
  $9E40  72        .db $72
  $9E41  03        .db $03
  $9E42  A8        TAY
  $9E43  88        DEY
  $9E44  72        .db $72
  $9E45  03        .db $03
  $9E46  A8        TAY
  $9E47  90 70     BCC $9EB9
  $9E49  83        .db $83
  $9E4A  A8        TAY
  $9E4B  90 71     BCC $9EBE
  $9E4D  03        .db $03
  $9E4E  B0 98     BCS $9DE8
  $9E50  72        .db $72
  $9E51  03        .db $03
  $9E52  B8        CLV
  $9E53  A0 72     LDY #$72
  $9E55  03        .db $03
  $9E56  B8        CLV
  $9E57  A8        TAY
  $9E58  72        .db $72
  $9E59  03        .db $03
  $9E5A  B8        CLV
  $9E5B  B0 72     BCS $9ECF

L_9E5D:
  $9E5D  03        .db $03
  $9E5E  B8        CLV
  $9E5F  B8        CLV
  $9E60  72        .db $72

L_9E61:
  $9E61  03        .db $03
  $9E62  B8        CLV
  $9E63  C0 72     CPY #$72
  $9E65  03        .db $03
  $9E66  B8        CLV
  $9E67  C8        INY
  $9E68  70 83     BVS $9DED
  $9E6A  B8        CLV
  $9E6B  C8        INY
  $9E6C  71 03     ADC ($03),Y
  $9E6E  C0 C8     CPY #$C8
  $9E70  71 03     ADC ($03),Y
  $9E72  C8        INY
  $9E73  C8        INY
  $9E74  71 03     ADC ($03),Y
  $9E76  D0 C4     BNE $9E3C
  $9E78  75 02     ADC $02,X
  $9E7A  D8        CLD
  $9E7B  C4 75     CPY $75

L_9E7D:
  $9E7D  42        .db $42
  $9E7E  E0 CC     CPX #$CC
  $9E80  76 02     ROR $02,X
  $9E82  D8        CLD
  $9E83  CC 76 42  CPY $4276
  $9E86  E0 0F     CPX #$0F
  $9E88  00        BRK
  $9E89  01 0F     ORA ($0F,X)
  $9E8B  0F        .db $0F
  $9E8C  00        BRK
  $9E8D  0F        .db $0F
  $9E8E  0F        .db $0F
  $9E8F  0F        .db $0F
  $9E90  00        BRK
  $9E91  06 0F     ASL $0F
  $9E93  0F        .db $0F
  $9E94  00        BRK
  $9E95  01 0F     ORA ($0F,X)
  $9E97  0F        .db $0F
  $9E98  0F        .db $0F
  $9E99  09 0F     ORA #$0F
  $9E9B  0F        .db $0F
  $9E9C  0F        .db $0F
  $9E9D  00        BRK
  $9E9E  08        PHP
  $9E9F  0F        .db $0F
  $9EA0  0F        .db $0F
  $9EA1  08        PHP
  $9EA2  00        BRK
  $9EA3  0F        .db $0F
  $9EA4  0F        .db $0F
  $9EA5  00        BRK

L_9EA6:
  $9EA6  0C        .db $0C
  $9EA7  0F        .db $0F
  $9EA8  10 11     BPL $9EBB
  $9EAA  11 0F     ORA ($0F),Y
  $9EAC  10 00     BPL $9EAE

L_9EAE:
  $9EAE  00        BRK
  $9EAF  0F        .db $0F
  $9EB0  10 16     BPL $9EC8
  $9EB2  05 0F     ORA $0F
  $9EB4  07        .db $07
  $9EB5  11 00     ORA ($00),Y
  $9EB7  0F        .db $0F
  $9EB8  06 19     ASL $19
  $9EBA  00        BRK

L_9EBB:
  $9EBB  0F        .db $0F
  $9EBC  0F        .db $0F
  $9EBD  10 18     BPL $9ED7
  $9EBF  0F        .db $0F
  $9EC0  0F        .db $0F
  $9EC1  18        CLC
  $9EC2  10 0F     BPL $9ED3
  $9EC4  0F        .db $0F
  $9EC5  02        .db $02
  $9EC6  1C        .db $1C
  $9EC7  0F        .db $0F

L_9EC8:
  $9EC8  20 21 11  JSR $1121
  $9ECB  0F        .db $0F
  $9ECC  20 10 00  JSR $0010

L_9ECF:
  $9ECF  0F        .db $0F
  $9ED0  20 26 15  JSR $1526

L_9ED3:
  $9ED3  0F        .db $0F
  $9ED4  17        .db $17
  $9ED5  21 07     AND ($07,X)

L_9ED7:
  $9ED7  0F        .db $0F
  $9ED8  16 29     ASL $29,X
  $9EDA  09 0F     ORA #$0F
  $9EDC  0F        .db $0F
  $9EDD  30 38     BMI $9F17
  $9EDF  0F        .db $0F
  $9EE0  0F        .db $0F
  $9EE1  28        PLP
  $9EE2  30 0F     BMI $9EF3
  $9EE4  0F        .db $0F
  $9EE5  12        .db $12
  $9EE6  2C A9 10  BIT $10A9
  $9EE9  85 F7     STA $F7
  $9EEB  8D 00 20  STA $2000
  $9EEE  A9 06     LDA #$06
  $9EF0  85 F8     STA $F8
  $9EF2  8D 01 20  STA $2001
  $9EF5  A9 0F     LDA #$0F
  $9EF7  20 5D C0  JSR $C05D
  $9EFA  20 7E 84  JSR $847E
  $9EFD  A9 00     LDA #$00
  $9EFF  85 BE     STA $BE
  $9F01  A9 02     LDA #$02
  $9F03  20 44 C6  JSR $C644
  $9F06  A9 20     LDA #$20
  $9F08  8D 06 20  STA $2006
  $9F0B  A2 00     LDX #$00
  $9F0D  8E 06 20  STX $2006
  $9F10  8A        TXA
  $9F11  A0 04     LDY #$04

L_9F13:
  $9F13  8D 07 20  STA $2007
  $9F16  E8        INX

L_9F17:
  $9F17  D0 FA     BNE $9F13
  $9F19  88        DEY
  $9F1A  D0 F7     BNE $9F13
  $9F1C  A9 0F     LDA #$0F
  $9F1E  A2 1F     LDX #$1F

L_9F20:
  $9F20  9D 56 03  STA $0356,X
  $9F23  CA        DEX
  $9F24  10 FA     BPL $9F20
  $9F26  A9 04     LDA #$04
  $9F28  85 00     STA $00
  $9F2A  A2 00     LDX #$00

L_9F2C:
  $9F2C  BC 95 AE  LDY $AE95,X
  $9F2F  E8        INX
  $9F30  BD 95 AE  LDA $AE95,X
  $9F33  8D 06 20  STA $2006
  $9F36  E8        INX
  $9F37  BD 95 AE  LDA $AE95,X
  $9F3A  8D 06 20  STA $2006
  $9F3D  E8        INX

L_9F3E:
  $9F3E  BD 95 AE  LDA $AE95,X
  $9F41  8D 07 20  STA $2007
  $9F44  E8        INX
  $9F45  88        DEY
  $9F46  D0 F6     BNE $9F3E
  $9F48  C6 00     DEC $00
  $9F4A  D0 E0     BNE $9F2C
  $9F4C  20 73 84  JSR $8473
  $9F4F  20 1D A5  JSR $A51D
  $9F52  A9 FE     LDA #$FE
  $9F54  20 51 C0  JSR $C051
  $9F57  A9 FF     LDA #$FF
  $9F59  20 51 C0  JSR $C051
  $9F5C  A9 1F     LDA #$1F
  $9F5E  85 FE     STA $FE

L_9F60:
  $9F60  A9 0A     LDA #$0A
  $9F62  85 FF     STA $FF

L_9F64:
  $9F64  A6 FE     LDX $FE
  $9F66  BD 54 AE  LDA $AE54,X
  $9F69  8D 57 03  STA $0357
  $9F6C  20 AB C0  JSR $C0AB
  $9F6F  A5 27     LDA $27
  $9F71  29 08     AND #$08
  $9F73  F0 03     BEQ $9F78
  $9F75  4C B0 A7  JMP $A7B0

L_9F78:
  $9F78  C6 FF     DEC $FF
  $9F7A  D0 E8     BNE $9F64
  $9F7C  C6 FE     DEC $FE
  $9F7E  10 E0     BPL $9F60
  $9F80  A9 00     LDA #$00
  $9F82  85 47     STA $47
  $9F84  20 2D A5  JSR $A52D
  $9F87  A9 00     LDA #$00
  $9F89  85 AE     STA $AE
  $9F8B  A9 07     LDA #$07
  $9F8D  85 2A     STA $2A
  $9F8F  A9 00     LDA #$00
  $9F91  85 08     STA $08
  $9F93  A9 8A     LDA #$8A
  $9F95  85 09     STA $09
  $9F97  A9 00     LDA #$00
  $9F99  85 1A     STA $1A
  $9F9B  85 1B     STA $1B

L_9F9D:
  $9F9D  20 0B CA  JSR $CA0B
  $9FA0  E6 08     INC $08
  $9FA2  E6 1A     INC $1A
  $9FA4  20 0B CA  JSR $CA0B
  $9FA7  20 3C A5  JSR $A53C
  $9FAA  A5 08     LDA $08
  $9FAC  29 3F     AND #$3F
  $9FAE  D0 ED     BNE $9F9D
  $9FB0  A9 40     LDA #$40
  $9FB2  85 08     STA $08
  $9FB4  A9 8A     LDA #$8A
  $9FB6  85 09     STA $09
  $9FB8  A9 00     LDA #$00
  $9FBA  85 1A     STA $1A
  $9FBC  85 1B     STA $1B

L_9FBE:
  $9FBE  20 0B CA  JSR $CA0B
  $9FC1  18        CLC
  $9FC2  AD 00 03  LDA $0300
  $9FC5  69 04     ADC #$04
  $9FC7  8D 00 03  STA $0300
  $9FCA  18        CLC
  $9FCB  AD 08 03  LDA $0308
  $9FCE  69 04     ADC #$04
  $9FD0  8D 08 03  STA $0308
  $9FD3  20 3C A5  JSR $A53C
  $9FD6  A5 08     LDA $08
  $9FD8  29 3F     AND #$3F
  $9FDA  D0 E2     BNE $9FBE
  $9FDC  A2 1F     LDX #$1F
  $9FDE  A9 0F     LDA #$0F

L_9FE0:
  $9FE0  9D 56 03  STA $0356,X
  $9FE3  CA        DEX
  $9FE4  10 FA     BPL $9FE0
  $9FE6  20 73 84  JSR $8473
  $9FE9  20 1D A5  JSR $A51D
  $9FEC  A2 0F     LDX #$0F
  $9FEE  A9 00     LDA #$00

L_9FF0:
  $9FF0  9D 40 04  STA $0440,X
  $9FF3  9D 00 04  STA $0400,X
  $9FF6  CA        DEX
  $9FF7  10 F7     BPL $9FF0
  $9FF9  A9 80     LDA #$80
  $9FFB  8D C0 04  STA $04C0
  $9FFE  A9 00     LDA #$00
  $A000  8D A0 04  STA $04A0
  $A003  A9 28     LDA #$28
  $A005  8D A1 04  STA $04A1
  $A008  A9 00     LDA #$00
  $A00A  8D C1 04  STA $04C1
  $A00D  A9 00     LDA #$00
  $A00F  8D A2 04  STA $04A2
  $A012  A9 47     LDA #$47
  $A014  8D A3 04  STA $04A3
  $A017  A9 02     LDA #$02
  $A019  8D 02 04  STA $0402
  $A01C  8D 03 04  STA $0403
  $A01F  A9 27     LDA #$27
  $A021  8D A5 04  STA $04A5
  $A024  A9 6F     LDA #$6F
  $A026  8D A6 04  STA $04A6
  $A029  A9 01     LDA #$01
  $A02B  8D 05 04  STA $0405
  $A02E  8D 06 04  STA $0406
  $A031  A9 80     LDA #$80
  $A033  8D 60 06  STA $0660
  $A036  A9 00     LDA #$00
  $A038  8D 40 06  STA $0640
  $A03B  A9 00     LDA #$00
  $A03D  85 AE     STA $AE
  $A03F  A9 00     LDA #$00
  $A041  85 22     STA $22
  $A043  A9 00     LDA #$00
  $A045  85 FD     STA $FD
  $A047  A9 08     LDA #$08
  $A049  85 FE     STA $FE

L_A04B:
  $A04B  C6 FE     DEC $FE
  $A04D  D0 1A     BNE $A069
  $A04F  A9 08     LDA #$08
  $A051  85 FE     STA $FE
  $A053  A6 FD     LDX $FD
  $A055  A0 00     LDY #$00

L_A057:
  $A057  BD 4F AA  LDA $AA4F,X
  $A05A  99 56 03  STA $0356,Y
  $A05D  E8        INX
  $A05E  C8        INY
  $A05F  C0 20     CPY #$20
  $A061  D0 F4     BNE $A057
  $A063  E0 60     CPX #$60
  $A065  F0 11     BEQ $A078
  $A067  86 FD     STX $FD

L_A069:
  $A069  20 F7 A6  JSR $A6F7
  $A06C  20 AB C0  JSR $C0AB
  $A06F  A5 27     LDA $27
  $A071  29 08     AND #$08
  $A073  F0 D6     BEQ $A04B
  $A075  4C B0 A7  JMP $A7B0

L_A078:
  $A078  A9 0E     LDA #$0E
  $A07A  20 51 C0  JSR $C051
  $A07D  A9 00     LDA #$00
  $A07F  85 FD     STA $FD
  $A081  85 C8     STA $C8

L_A083:
  $A083  A5 FD     LDA $FD
  $A085  C9 36     CMP #$36
  $A087  D0 00     BNE $A089

L_A089:
  $A089  20 53 A5  JSR $A553
  $A08C  A9 23     LDA #$23
  $A08E  8D B6 03  STA $03B6
  $A091  A9 03     LDA #$03
  $A093  8D B7 03  STA $03B7
  $A096  20 AB C0  JSR $C0AB
  $A099  A5 27     LDA $27
  $A09B  29 08     AND #$08
  $A09D  F0 03     BEQ $A0A2
  $A09F  4C B0 A7  JMP $A7B0

L_A0A2:
  $A0A2  20 53 A5  JSR $A553
  $A0A5  A9 23     LDA #$23
  $A0A7  8D B6 03  STA $03B6
  $A0AA  A9 43     LDA #$43
  $A0AC  8D B7 03  STA $03B7
  $A0AF  A9 1F     LDA #$1F
  $A0B1  85 FE     STA $FE
  $A0B3  A9 0A     LDA #$0A
  $A0B5  85 FF     STA $FF

L_A0B7:
  $A0B7  C6 FF     DEC $FF
  $A0B9  D0 10     BNE $A0CB
  $A0BB  A9 0A     LDA #$0A
  $A0BD  85 FF     STA $FF
  $A0BF  A6 FE     LDX $FE
  $A0C1  BD 54 AE  LDA $AE54,X
  $A0C4  8D 5B 03  STA $035B
  $A0C7  C6 FE     DEC $FE
  $A0C9  30 0C     BMI $A0D7

L_A0CB:
  $A0CB  20 AB C0  JSR $C0AB
  $A0CE  A5 27     LDA $27
  $A0D0  29 08     AND #$08
  $A0D2  F0 E3     BEQ $A0B7
  $A0D4  4C B0 A7  JMP $A7B0

L_A0D7:
  $A0D7  A5 FD     LDA $FD
  $A0D9  C9 0E     CMP #$0E
  $A0DB  D0 A6     BNE $A083
  $A0DD  A9 02     LDA #$02
  $A0DF  85 AE     STA $AE
  $A0E1  A9 F0     LDA #$F0
  $A0E3  85 22     STA $22

L_A0E5:
  $A0E5  38        SEC
  $A0E6  A5 21     LDA $21
  $A0E8  E9 80     SBC #$80
  $A0EA  85 21     STA $21
  $A0EC  A5 22     LDA $22
  $A0EE  E9 00     SBC #$00
  $A0F0  85 22     STA $22
  $A0F2  90 19     BCC $A10D
  $A0F4  C9 40     CMP #$40
  $A0F6  B0 03     BCS $A0FB
  $A0F8  20 7C A5  JSR $A57C

L_A0FB:
  $A0FB  20 1B A6  JSR $A61B
  $A0FE  20 F7 A6  JSR $A6F7
  $A101  20 AB C0  JSR $C0AB
  $A104  A5 27     LDA $27
  $A106  29 08     AND #$08
  $A108  F0 DB     BEQ $A0E5
  $A10A  4C B0 A7  JMP $A7B0

L_A10D:
  $A10D  A9 F0     LDA #$F0
  $A10F  85 22     STA $22
  $A111  A9 00     LDA #$00
  $A113  85 21     STA $21
  $A115  85 AE     STA $AE

L_A117:
  $A117  38        SEC
  $A118  A5 21     LDA $21
  $A11A  E9 80     SBC #$80
  $A11C  85 21     STA $21
  $A11E  A5 22     LDA $22
  $A120  E9 00     SBC #$00
  $A122  85 22     STA $22
  $A124  C9 C0     CMP #$C0
  $A126  F0 12     BEQ $A13A
  $A128  20 1B A6  JSR $A61B
  $A12B  20 F7 A6  JSR $A6F7
  $A12E  20 AB C0  JSR $C0AB
  $A131  A5 27     LDA $27
  $A133  29 08     AND #$08
  $A135  F0 E0     BEQ $A117
  $A137  4C B0 A7  JMP $A7B0

L_A13A:
  $A13A  A2 0F     LDX #$0F

L_A13C:
  $A13C  BD AF AA  LDA $AAAF,X
  $A13F  9D 56 03  STA $0356,X
  $A142  CA        DEX
  $A143  10 F7     BPL $A13C
  $A145  A9 00     LDA #$00
  $A147  8D 10 04  STA $0410
  $A14A  A9 08     LDA #$08
  $A14C  8D 90 06  STA $0690
  $A14F  A9 FF     LDA #$FF
  $A151  8D 50 04  STA $0450
  $A154  A9 B7     LDA #$B7
  $A156  8D B0 04  STA $04B0

L_A159:
  $A159  38        SEC
  $A15A  A5 22     LDA $22
  $A15C  E9 02     SBC #$02
  $A15E  85 22     STA $22
  $A160  20 1B A6  JSR $A61B
  $A163  A5 22     LDA $22
  $A165  F0 15     BEQ $A17C
  $A167  20 F7 A6  JSR $A6F7
  $A16A  20 F5 A5  JSR $A5F5
  $A16D  20 5F A7  JSR $A75F
  $A170  20 AB C0  JSR $C0AB
  $A173  A5 27     LDA $27
  $A175  29 08     AND #$08
  $A177  F0 E0     BEQ $A159
  $A179  4C B0 A7  JMP $A7B0

L_A17C:
  $A17C  A9 50     LDA #$50
  $A17E  85 FD     STA $FD
  $A180  A9 00     LDA #$00
  $A182  8D B7 03  STA $03B7
  $A185  85 FE     STA $FE
  $A187  A9 10     LDA #$10
  $A189  8D B6 03  STA $03B6
  $A18C  A9 B0     LDA #$B0
  $A18E  85 FF     STA $FF

L_A190:
  $A190  20 F5 A5  JSR $A5F5
  $A193  20 F7 A6  JSR $A6F7
  $A196  20 5F A7  JSR $A75F
  $A199  20 47 C7  JSR $C747
  $A19C  20 AB C0  JSR $C0AB
  $A19F  18        CLC
  $A1A0  AD B7 03  LDA $03B7
  $A1A3  69 20     ADC #$20
  $A1A5  8D B7 03  STA $03B7
  $A1A8  AD B6 03  LDA $03B6
  $A1AB  69 00     ADC #$00
  $A1AD  8D B6 03  STA $03B6
  $A1B0  18        CLC
  $A1B1  A5 FE     LDA $FE
  $A1B3  69 20     ADC #$20
  $A1B5  85 FE     STA $FE
  $A1B7  A5 FF     LDA $FF
  $A1B9  69 00     ADC #$00
  $A1BB  85 FF     STA $FF
  $A1BD  C6 FD     DEC $FD
  $A1BF  D0 CF     BNE $A190
  $A1C1  A9 20     LDA #$20
  $A1C3  85 FD     STA $FD

L_A1C5:
  $A1C5  20 F5 A5  JSR $A5F5
  $A1C8  20 F7 A6  JSR $A6F7
  $A1CB  20 5F A7  JSR $A75F
  $A1CE  20 AB C0  JSR $C0AB
  $A1D1  C6 FD     DEC $FD
  $A1D3  D0 F0     BNE $A1C5
  $A1D5  A2 0F     LDX #$0F

L_A1D7:
  $A1D7  BD BF AA  LDA $AABF,X
  $A1DA  9D 56 03  STA $0356,X
  $A1DD  CA        DEX
  $A1DE  10 F7     BPL $A1D7

L_A1E0:
  $A1E0  A9 0D     LDA #$0D
  $A1E2  20 51 C0  JSR $C051
  $A1E5  A9 0B     LDA #$0B
  $A1E7  85 C1     STA $C1
  $A1E9  A9 00     LDA #$00
  $A1EB  85 C0     STA $C0
  $A1ED  85 CB     STA $CB

L_A1EF:
  $A1EF  A5 27     LDA $27
  $A1F1  29 08     AND #$08
  $A1F3  D0 50     BNE $A245
  $A1F5  20 F7 A6  JSR $A6F7
  $A1F8  20 F5 A5  JSR $A5F5
  $A1FB  20 5F A7  JSR $A75F
  $A1FE  A2 02     LDX #$02

L_A200:
  $A200  BD C1 A2  LDA $A2C1,X
  $A203  9D 81 02  STA $0281,X
  $A206  CA        DEX
  $A207  10 F7     BPL $A200
  $A209  A6 CB     LDX $CB
  $A20B  A0 F8     LDY #$F8
  $A20D  A5 1C     LDA $1C
  $A20F  29 08     AND #$08
  $A211  F0 03     BEQ $A216
  $A213  BC C4 A2  LDY $A2C4,X

L_A216:
  $A216  8C 80 02  STY $0280
  $A219  A5 27     LDA $27
  $A21B  29 34     AND #$34
  $A21D  F0 12     BEQ $A231
  $A21F  8A        TXA
  $A220  49 01     EOR #$01
  $A222  85 CB     STA $CB
  $A224  A9 2F     LDA #$2F
  $A226  20 51 C0  JSR $C051
  $A229  A9 0B     LDA #$0B
  $A22B  85 C1     STA $C1
  $A22D  A9 00     LDA #$00
  $A22F  85 C0     STA $C0

L_A231:
  $A231  20 AB C0  JSR $C0AB
  $A234  38        SEC
  $A235  A5 C0     LDA $C0
  $A237  E9 01     SBC #$01
  $A239  85 C0     STA $C0
  $A23B  A5 C1     LDA $C1
  $A23D  E9 00     SBC #$00
  $A23F  85 C1     STA $C1
  $A241  B0 AC     BCS $A1EF
  $A243  E6 BE     INC $BE

L_A245:
  $A245  A9 FF     LDA #$FF
  $A247  20 51 C0  JSR $C051
  $A24A  A9 19     LDA #$19
  $A24C  85 FD     STA $FD

L_A24E:
  $A24E  A5 1C     LDA $1C
  $A250  29 01     AND #$01
  $A252  D0 0F     BNE $A263
  $A254  A5 FD     LDA $FD
  $A256  C9 04     CMP #$04
  $A258  D0 05     BNE $A25F
  $A25A  A9 3A     LDA #$3A
  $A25C  20 51 C0  JSR $C051

L_A25F:
  $A25F  C6 FD     DEC $FD
  $A261  30 14     BMI $A277

L_A263:
  $A263  A6 FD     LDX $FD
  $A265  BD 7B AE  LDA $AE7B,X
  $A268  8D 10 04  STA $0410
  $A26B  20 F7 A6  JSR $A6F7
  $A26E  20 5F A7  JSR $A75F
  $A271  20 AB C0  JSR $C0AB
  $A274  4C 4E A2  JMP $A24E

L_A277:
  $A277  A9 0A     LDA #$0A
  $A279  8D 10 04  STA $0410
  $A27C  38        SEC
  $A27D  AD B0 04  LDA $04B0
  $A280  E9 08     SBC #$08
  $A282  8D B0 04  STA $04B0
  $A285  AD 50 04  LDA $0450
  $A288  E9 00     SBC #$00
  $A28A  8D 50 04  STA $0450
  $A28D  F0 07     BEQ $A296
  $A28F  AD B0 04  LDA $04B0
  $A292  C9 F0     CMP #$F0
  $A294  90 0C     BCC $A2A2

L_A296:
  $A296  20 F7 A6  JSR $A6F7
  $A299  20 5F A7  JSR $A75F
  $A29C  20 AB C0  JSR $C0AB
  $A29F  4C 77 A2  JMP $A277

L_A2A2:
  $A2A2  20 F7 A6  JSR $A6F7
  $A2A5  A9 3E     LDA #$3E
  $A2A7  85 FD     STA $FD

L_A2A9:
  $A2A9  20 AB C0  JSR $C0AB
  $A2AC  C6 FD     DEC $FD
  $A2AE  D0 F9     BNE $A2A9
  $A2B0  20 2D A5  JSR $A52D
  $A2B3  A9 00     LDA #$00
  $A2B5  85 AE     STA $AE
  $A2B7  A9 0E     LDA #$0E
  $A2B9  20 5D C0  JSR $C05D
  $A2BC  A5 BE     LDA $BE
  $A2BE  F0 06     BEQ $A2C6
  $A2C0  60        RTS
  $A2C1  A2 01     LDX #$01
  $A2C3  30 98     BMI $A25D
  $A2C5  A8        TAY

L_A2C6:
  $A2C6  A9 03     LDA #$03
  $A2C8  20 44 C6  JSR $C644
  $A2CB  A9 05     LDA #$05
  $A2CD  85 2A     STA $2A
  $A2CF  A9 40     LDA #$40
  $A2D1  85 08     STA $08
  $A2D3  A9 8D     LDA #$8D
  $A2D5  85 09     STA $09
  $A2D7  20 7E A8  JSR $A87E
  $A2DA  A9 80     LDA #$80
  $A2DC  85 08     STA $08
  $A2DE  A9 8D     LDA #$8D
  $A2E0  85 09     STA $09
  $A2E2  20 7E A8  JSR $A87E
  $A2E5  A2 00     LDX #$00

L_A2E7:
  $A2E7  BD 39 AF  LDA $AF39,X
  $A2EA  8D 06 20  STA $2006
  $A2ED  BD 3A AF  LDA $AF3A,X
  $A2F0  8D 06 20  STA $2006
  $A2F3  E8        INX
  $A2F4  E8        INX
  $A2F5  BC 39 AF  LDY $AF39,X
  $A2F8  E8        INX

L_A2F9:
  $A2F9  BD 39 AF  LDA $AF39,X
  $A2FC  8D 07 20  STA $2007
  $A2FF  E8        INX
  $A300  88        DEY
  $A301  D0 F6     BNE $A2F9
  $A303  E0 19     CPX #$19
  $A305  D0 E0     BNE $A2E7
  $A307  A9 10     LDA #$10
  $A309  20 51 C0  JSR $C051
  $A30C  A9 01     LDA #$01
  $A30E  20 B2 A9  JSR $A9B2

L_A311:
  $A311  A9 00     LDA #$00
  $A313  85 FD     STA $FD
  $A315  85 9A     STA $9A
  $A317  85 9B     STA $9B

L_A319:
  $A319  A2 03     LDX #$03

L_A31B:
  $A31B  BD C7 AF  LDA $AFC7,X
  $A31E  9D 00 02  STA $0200,X
  $A321  CA        DEX
  $A322  10 F7     BPL $A31B
  $A324  A5 1C     LDA $1C
  $A326  29 08     AND #$08
  $A328  D0 0B     BNE $A335
  $A32A  A2 60     LDX #$60
  $A32C  A5 FD     LDA $FD
  $A32E  F0 02     BEQ $A332
  $A330  A2 70     LDX #$70

L_A332:
  $A332  8E 00 02  STX $0200

L_A335:
  $A335  A5 27     LDA $27
  $A337  29 3C     AND #$3C
  $A339  F0 0F     BEQ $A34A
  $A33B  29 08     AND #$08
  $A33D  D0 11     BNE $A350
  $A33F  A9 2F     LDA #$2F
  $A341  20 51 C0  JSR $C051
  $A344  A5 FD     LDA $FD
  $A346  49 01     EOR #$01
  $A348  85 FD     STA $FD

L_A34A:
  $A34A  20 AB C0  JSR $C0AB
  $A34D  4C 19 A3  JMP $A319

L_A350:
  $A350  A5 FD     LDA $FD
  $A352  D0 03     BNE $A357
  $A354  4C 19 A5  JMP $A519

L_A357:
  $A357  20 98 A8  JSR $A898
  $A35A  20 73 84  JSR $8473
  $A35D  20 CC A9  JSR $A9CC
  $A360  A2 2F     LDX #$2F

L_A362:
  $A362  BD CB AF  LDA $AFCB,X
  $A365  9D 00 02  STA $0200,X
  $A368  CA        DEX
  $A369  10 F7     BPL $A362
  $A36B  A9 00     LDA #$00
  $A36D  A2 18     LDX #$18

L_A36F:
  $A36F  9D 20 04  STA $0420,X
  $A372  CA        DEX
  $A373  10 FA     BPL $A36F
  $A375  20 25 AA  JSR $AA25
  $A378  20 D4 A8  JSR $A8D4
  $A37B  A9 00     LDA #$00
  $A37D  8D A0 06  STA $06A0
  $A380  A9 09     LDA #$09
  $A382  8D 80 06  STA $0680
  $A385  A9 00     LDA #$00
  $A387  85 FE     STA $FE

L_A389:
  $A389  A5 27     LDA $27
  $A38B  29 F0     AND #$F0
  $A38D  D0 18     BNE $A3A7
  $A38F  A5 23     LDA $23
  $A391  29 F0     AND #$F0
  $A393  F0 45     BEQ $A3DA
  $A395  A5 25     LDA $25
  $A397  C5 23     CMP $23
  $A399  D0 3F     BNE $A3DA
  $A39B  E6 FE     INC $FE
  $A39D  A5 FE     LDA $FE
  $A39F  C9 18     CMP #$18
  $A3A1  90 3B     BCC $A3DE
  $A3A3  A9 08     LDA #$08
  $A3A5  85 FE     STA $FE

L_A3A7:
  $A3A7  A9 2F     LDA #$2F
  $A3A9  20 51 C0  JSR $C051
  $A3AC  AE A0 06  LDX $06A0
  $A3AF  A5 23     LDA $23
  $A3B1  29 C0     AND #$C0
  $A3B3  F0 10     BEQ $A3C5
  $A3B5  29 80     AND #$80
  $A3B7  F0 06     BEQ $A3BF
  $A3B9  BD 2D B0  LDA $B02D,X
  $A3BC  4C D4 A3  JMP $A3D4

L_A3BF:
  $A3BF  BD 46 B0  LDA $B046,X
  $A3C2  4C D4 A3  JMP $A3D4

L_A3C5:
  $A3C5  A5 23     LDA $23
  $A3C7  29 10     AND #$10
  $A3C9  F0 06     BEQ $A3D1
  $A3CB  BD 5F B0  LDA $B05F,X
  $A3CE  4C D4 A3  JMP $A3D4

L_A3D1:
  $A3D1  BD 78 B0  LDA $B078,X

L_A3D4:
  $A3D4  8D A0 06  STA $06A0
  $A3D7  4C DE A3  JMP $A3DE

L_A3DA:
  $A3DA  A9 00     LDA #$00
  $A3DC  85 FE     STA $FE

L_A3DE:
  $A3DE  A5 27     LDA $27
  $A3E0  29 03     AND #$03
  $A3E2  F0 28     BEQ $A40C
  $A3E4  A5 27     LDA $27
  $A3E6  AE A0 06  LDX $06A0
  $A3E9  29 01     AND #$01
  $A3EB  F0 14     BEQ $A401
  $A3ED  BD 20 04  LDA $0420,X
  $A3F0  D0 1A     BNE $A40C
  $A3F2  A9 42     LDA #$42
  $A3F4  20 51 C0  JSR $C051
  $A3F7  FE 20 04  INC $0420,X
  $A3FA  CE 80 06  DEC $0680
  $A3FD  F0 16     BEQ $A415
  $A3FF  D0 0B     BNE $A40C

L_A401:
  $A401  BD 20 04  LDA $0420,X
  $A404  F0 06     BEQ $A40C
  $A406  DE 20 04  DEC $0420,X
  $A409  EE 80 06  INC $0680

L_A40C:
  $A40C  20 27 A9  JSR $A927
  $A40F  20 AB C0  JSR $C0AB
  $A412  4C 89 A3  JMP $A389

L_A415:
  $A415  20 27 A9  JSR $A927
  $A418  A9 0F     LDA #$0F
  $A41A  8D 6C 03  STA $036C
  $A41D  A2 00     LDX #$00

L_A41F:
  $A41F  BD 20 04  LDA $0420,X
  $A422  D0 05     BNE $A429
  $A424  E8        INX
  $A425  E0 04     CPX #$04
  $A427  D0 F6     BNE $A41F

L_A429:
  $A429  86 04     STX $04
  $A42B  8A        TXA
  $A42C  18        CLC
  $A42D  69 05     ADC #$05
  $A42F  AA        TAX
  $A430  A9 00     LDA #$00
  $A432  85 01     STA $01
  $A434  85 02     STA $02
  $A436  85 03     STA $03

L_A438:
  $A438  BD 20 04  LDA $0420,X
  $A43B  F0 11     BEQ $A44E
  $A43D  A4 01     LDY $01
  $A43F  B9 A9 B0  LDA $B0A9,Y
  $A442  48        PHA
  $A443  B9 BD B0  LDA $B0BD,Y
  $A446  A8        TAY
  $A447  68        PLA
  $A448  19 02 00  ORA $0002,Y
  $A44B  99 02 00  STA $0002,Y

L_A44E:
  $A44E  E8        INX
  $A44F  E0 19     CPX #$19
  $A451  D0 02     BNE $A455
  $A453  A2 05     LDX #$05

L_A455:
  $A455  E6 01     INC $01
  $A457  A5 01     LDA $01
  $A459  C9 14     CMP #$14
  $A45B  D0 DB     BNE $A438
  $A45D  A5 02     LDA $02
  $A45F  05 03     ORA $03
  $A461  C9 FF     CMP #$FF
  $A463  D0 03     BNE $A468
  $A465  4C AD A4  JMP $A4AD

L_A468:
  $A468  A2 02     LDX #$02
  $A46A  20 8B A9  JSR $A98B
  $A46D  A9 7D     LDA #$7D
  $A46F  85 FD     STA $FD

L_A471:
  $A471  20 AB C0  JSR $C0AB
  $A474  C6 FD     DEC $FD
  $A476  D0 F9     BNE $A471
  $A478  A2 03     LDX #$03
  $A47A  20 8B A9  JSR $A98B
  $A47D  20 98 A8  JSR $A898
  $A480  20 73 84  JSR $8473
  $A483  20 09 AA  JSR $AA09
  $A486  20 D4 A8  JSR $A8D4
  $A489  A9 7D     LDA #$7D
  $A48B  85 FD     STA $FD

L_A48D:
  $A48D  20 AB C0  JSR $C0AB
  $A490  C6 FD     DEC $FD
  $A492  D0 F9     BNE $A48D
  $A494  20 98 A8  JSR $A898
  $A497  A2 00     LDX #$00
  $A499  20 8B A9  JSR $A98B
  $A49C  20 AB C0  JSR $C0AB
  $A49F  A2 01     LDX #$01
  $A4A1  20 8B A9  JSR $A98B
  $A4A4  20 AB C0  JSR $C0AB
  $A4A7  20 D4 A8  JSR $A8D4
  $A4AA  4C 11 A3  JMP $A311

L_A4AD:
  $A4AD  A5 02     LDA $02
  $A4AF  85 9A     STA $9A
  $A4B1  29 03     AND #$03
  $A4B3  85 9B     STA $9B
  $A4B5  A5 9A     LDA $9A
  $A4B7  29 20     AND #$20
  $A4B9  4A        LSR
  $A4BA  4A        LSR
  $A4BB  4A        LSR
  $A4BC  05 9B     ORA $9B
  $A4BE  85 9B     STA $9B
  $A4C0  A5 04     LDA $04
  $A4C2  85 A7     STA $A7
  $A4C4  A9 C0     LDA #$C0
  $A4C6  85 FD     STA $FD
  $A4C8  A9 8D     LDA #$8D
  $A4CA  85 FE     STA $FE
  $A4CC  20 EA A9  JSR $A9EA
  $A4CF  A9 3C     LDA #$3C
  $A4D1  85 FD     STA $FD

L_A4D3:
  $A4D3  20 AB C0  JSR $C0AB
  $A4D6  C6 FD     DEC $FD
  $A4D8  D0 F9     BNE $A4D3
  $A4DA  20 98 A8  JSR $A898
  $A4DD  20 73 84  JSR $8473
  $A4E0  20 CC A9  JSR $A9CC
  $A4E3  A5 9A     LDA $9A
  $A4E5  85 01     STA $01
  $A4E7  A5 9B     LDA $9B
  $A4E9  85 02     STA $02
  $A4EB  A2 00     LDX #$00
  $A4ED  F0 0C     BEQ $A4FB

L_A4EF:
  $A4EF  46 02     LSR $02
  $A4F1  66 01     ROR $01
  $A4F3  B0 06     BCS $A4FB
  $A4F5  E8        INX
  $A4F6  E8        INX
  $A4F7  E8        INX
  $A4F8  E8        INX
  $A4F9  D0 0C     BNE $A507

L_A4FB:
  $A4FB  A0 04     LDY #$04

L_A4FD:
  $A4FD  BD D1 B0  LDA $B0D1,X
  $A500  9D 00 02  STA $0200,X
  $A503  E8        INX
  $A504  88        DEY
  $A505  D0 F6     BNE $A4FD

L_A507:
  $A507  E0 30     CPX #$30
  $A509  D0 E4     BNE $A4EF
  $A50B  20 D4 A8  JSR $A8D4
  $A50E  A9 7D     LDA #$7D
  $A510  85 FD     STA $FD

L_A512:
  $A512  20 AB C0  JSR $C0AB
  $A515  C6 FD     DEC $FD
  $A517  D0 F9     BNE $A512

L_A519:
  $A519  20 2D A5  JSR $A52D
  $A51C  60        RTS

L_A51D:
  $A51D  A5 F8     LDA $F8
  $A51F  09 18     ORA #$18
  $A521  85 F8     STA $F8
  $A523  A5 F7     LDA $F7
  $A525  09 80     ORA #$80
  $A527  85 F7     STA $F7
  $A529  8D 00 20  STA $2000
  $A52C  60        RTS

L_A52D:
  $A52D  A9 10     LDA #$10
  $A52F  85 F7     STA $F7
  $A531  8D 00 20  STA $2000
  $A534  A9 06     LDA #$06
  $A536  85 F8     STA $F8
  $A538  8D 01 20  STA $2001
  $A53B  60        RTS

L_A53C:
  $A53C  A5 08     LDA $08
  $A53E  48        PHA
  $A53F  A5 09     LDA $09
  $A541  48        PHA
  $A542  A5 1B     LDA $1B
  $A544  20 1B D1  JSR $D11B
  $A547  18        CLC
  $A548  68        PLA
  $A549  85 09     STA $09
  $A54B  68        PLA
  $A54C  85 08     STA $08
  $A54E  E6 08     INC $08
  $A550  E6 1A     INC $1A
  $A552  60        RTS

L_A553:
  $A553  A4 FD     LDY $FD
  $A555  A2 00     LDX #$00

L_A557:
  $A557  A9 46     LDA #$46
  $A559  85 C9     STA $C9
  $A55B  A9 AD     LDA #$AD
  $A55D  18        CLC
  $A55E  65 C8     ADC $C8
  $A560  85 CA     STA $CA
  $A562  B1 C9     LDA ($C9),Y
  $A564  9D B8 03  STA $03B8,X
  $A567  98        TYA
  $A568  18        CLC
  $A569  69 01     ADC #$01
  $A56B  A8        TAY
  $A56C  A5 C8     LDA $C8
  $A56E  69 00     ADC #$00
  $A570  85 C8     STA $C8
  $A572  E8        INX
  $A573  E0 1B     CPX #$1B
  $A575  D0 E0     BNE $A557
  $A577  86 47     STX $47
  $A579  84 FD     STY $FD
  $A57B  60        RTS

L_A57C:
  $A57C  85 00     STA $00
  $A57E  A5 00     LDA $00
  $A580  29 01     AND #$01
  $A582  F0 24     BEQ $A5A8
  $A584  A5 00     LDA $00
  $A586  49 3F     EOR #$3F
  $A588  AA        TAX
  $A589  BD F1 B2  LDA $B2F1,X
  $A58C  8D B9 03  STA $03B9
  $A58F  BD F2 B2  LDA $B2F2,X
  $A592  8D B8 03  STA $03B8
  $A595  A9 23     LDA #$23
  $A597  8D B6 03  STA $03B6
  $A59A  A6 00     LDX $00
  $A59C  CA        DEX
  $A59D  8A        TXA
  $A59E  09 C0     ORA #$C0
  $A5A0  8D B7 03  STA $03B7
  $A5A3  A9 02     LDA #$02
  $A5A5  85 47     STA $47
  $A5A7  60        RTS

L_A5A8:
  $A5A8  A5 00     LDA $00
  $A5AA  4A        LSR
  $A5AB  C9 1E     CMP #$1E
  $A5AD  90 01     BCC $A5B0
  $A5AF  60        RTS

L_A5B0:
  $A5B0  0A        ASL
  $A5B1  0A        ASL
  $A5B2  0A        ASL
  $A5B3  0A        ASL
  $A5B4  26 08     ROL $08
  $A5B6  0A        ASL
  $A5B7  26 08     ROL $08
  $A5B9  8D B7 03  STA $03B7
  $A5BC  A5 08     LDA $08
  $A5BE  29 03     AND #$03
  $A5C0  09 20     ORA #$20
  $A5C2  8D B6 03  STA $03B6
  $A5C5  A5 00     LDA $00
  $A5C7  4A        LSR
  $A5C8  49 1F     EOR #$1F
  $A5CA  85 09     STA $09
  $A5CC  A9 00     LDA #$00
  $A5CE  46 09     LSR $09
  $A5D0  6A        ROR
  $A5D1  46 09     LSR $09
  $A5D3  6A        ROR
  $A5D4  46 09     LSR $09
  $A5D6  6A        ROR
  $A5D7  85 08     STA $08
  $A5D9  18        CLC
  $A5DA  A5 08     LDA $08
  $A5DC  69 F1     ADC #$F1
  $A5DE  85 08     STA $08
  $A5E0  A5 09     LDA $09
  $A5E2  69 B2     ADC #$B2
  $A5E4  85 09     STA $09
  $A5E6  A0 1F     LDY #$1F

L_A5E8:
  $A5E8  B1 08     LDA ($08),Y
  $A5EA  99 B8 03  STA $03B8,Y
  $A5ED  88        DEY
  $A5EE  10 F8     BPL $A5E8
  $A5F0  A9 20     LDA #$20
  $A5F2  85 47     STA $47
  $A5F4  60        RTS

L_A5F5:
  $A5F5  CE 90 06  DEC $0690
  $A5F8  D0 14     BNE $A60E
  $A5FA  A9 05     LDA #$05
  $A5FC  8D 90 06  STA $0690
  $A5FF  EE 10 04  INC $0410
  $A602  AD 10 04  LDA $0410
  $A605  C9 02     CMP #$02
  $A607  D0 05     BNE $A60E
  $A609  A9 00     LDA #$00
  $A60B  8D 10 04  STA $0410

L_A60E:
  $A60E  60        RTS
  $A60F  A2 14     LDX #$14

L_A611:
  $A611  BD CF AA  LDA $AACF,X
  $A614  9D EC 02  STA $02EC,X
  $A617  CA        DEX
  $A618  10 F7     BPL $A611
  $A61A  60        RTS

L_A61B:
  $A61B  A2 02     LDX #$02

L_A61D:
  $A61D  86 2B     STX $2B
  $A61F  BD 00 04  LDA $0400,X
  $A622  F0 29     BEQ $A64D
  $A624  18        CLC
  $A625  BD C0 04  LDA $04C0,X
  $A628  6D 60 06  ADC $0660
  $A62B  9D C0 04  STA $04C0,X
  $A62E  BD A0 04  LDA $04A0,X
  $A631  6D 40 06  ADC $0640
  $A634  9D A0 04  STA $04A0,X
  $A637  BD 40 04  LDA $0440,X
  $A63A  69 00     ADC #$00
  $A63C  9D 40 04  STA $0440,X
  $A63F  D0 0C     BNE $A64D
  $A641  BD A0 04  LDA $04A0,X
  $A644  C9 E8     CMP #$E8
  $A646  90 05     BCC $A64D
  $A648  A9 00     LDA #$00
  $A64A  9D 00 04  STA $0400,X

L_A64D:
  $A64D  A6 2B     LDX $2B
  $A64F  E8        INX
  $A650  E0 0F     CPX #$0F
  $A652  D0 C9     BNE $A61D
  $A654  A5 AE     LDA $AE
  $A656  D0 06     BNE $A65E
  $A658  A5 22     LDA $22
  $A65A  C9 A8     CMP #$A8
  $A65C  90 48     BCC $A6A6

L_A65E:
  $A65E  38        SEC
  $A65F  AD C0 04  LDA $04C0
  $A662  ED 60 06  SBC $0660
  $A665  8D C0 04  STA $04C0
  $A668  AD A0 04  LDA $04A0
  $A66B  ED 40 06  SBC $0640
  $A66E  8D A0 04  STA $04A0
  $A671  B0 0F     BCS $A682
  $A673  A9 01     LDA #$01
  $A675  20 D3 A6  JSR $A6D3
  $A678  A9 00     LDA #$00
  $A67A  8D C0 04  STA $04C0
  $A67D  A9 48     LDA #$48
  $A67F  8D A0 04  STA $04A0

L_A682:
  $A682  38        SEC
  $A683  AD C1 04  LDA $04C1
  $A686  ED 60 06  SBC $0660
  $A689  8D C1 04  STA $04C1
  $A68C  AD A1 04  LDA $04A1
  $A68F  ED 40 06  SBC $0640
  $A692  8D A1 04  STA $04A1
  $A695  B0 0F     BCS $A6A6
  $A697  A9 02     LDA #$02
  $A699  20 D3 A6  JSR $A6D3
  $A69C  A9 00     LDA #$00
  $A69E  8D C1 04  STA $04C1
  $A6A1  A9 48     LDA #$48
  $A6A3  8D A1 04  STA $04A1

L_A6A6:
  $A6A6  18        CLC
  $A6A7  AD 60 06  LDA $0660
  $A6AA  69 02     ADC #$02
  $A6AC  8D 60 06  STA $0660
  $A6AF  AD 40 06  LDA $0640
  $A6B2  69 00     ADC #$00
  $A6B4  8D 40 06  STA $0640
  $A6B7  C9 02     CMP #$02
  $A6B9  D0 05     BNE $A6C0
  $A6BB  A9 00     LDA #$00
  $A6BD  8D 60 06  STA $0660

L_A6C0:
  $A6C0  18        CLC
  $A6C1  AD B0 04  LDA $04B0
  $A6C4  6D 40 06  ADC $0640
  $A6C7  8D B0 04  STA $04B0
  $A6CA  AD 50 04  LDA $0450
  $A6CD  69 00     ADC #$00
  $A6CF  8D 50 04  STA $0450
  $A6D2  60        RTS

L_A6D3:
  $A6D3  85 00     STA $00
  $A6D5  A2 02     LDX #$02

L_A6D7:
  $A6D7  BD 00 04  LDA $0400,X
  $A6DA  F0 06     BEQ $A6E2
  $A6DC  E8        INX
  $A6DD  E0 0F     CPX #$0F
  $A6DF  D0 F6     BNE $A6D7
  $A6E1  60        RTS

L_A6E2:
  $A6E2  A5 00     LDA $00
  $A6E4  9D 00 04  STA $0400,X
  $A6E7  A9 FF     LDA #$FF
  $A6E9  9D 40 04  STA $0440,X
  $A6EC  A9 E0     LDA #$E0
  $A6EE  9D A0 04  STA $04A0,X
  $A6F1  A9 00     LDA #$00
  $A6F3  9D C0 04  STA $04C0,X
  $A6F6  60        RTS

L_A6F7:
  $A6F7  20 73 84  JSR $8473
  $A6FA  A9 00     LDA #$00
  $A6FC  85 00     STA $00
  $A6FE  A2 02     LDX #$02

L_A700:
  $A700  86 2B     STX $2B
  $A702  BD 00 04  LDA $0400,X
  $A705  F0 50     BEQ $A757
  $A707  BC A0 04  LDY $04A0,X
  $A70A  84 08     STY $08
  $A70C  BC 40 04  LDY $0440,X
  $A70F  84 09     STY $09
  $A711  A2 00     LDX #$00
  $A713  A0 0C     LDY #$0C
  $A715  C9 01     CMP #$01
  $A717  F0 04     BEQ $A71D
  $A719  A0 04     LDY #$04
  $A71B  A2 30     LDX #$30

L_A71D:
  $A71D  84 02     STY $02
  $A71F  A4 00     LDY $00

L_A721:
  $A721  18        CLC
  $A722  A5 08     LDA $08
  $A724  7D E3 AA  ADC $AAE3,X
  $A727  99 00 02  STA $0200,Y
  $A72A  A5 09     LDA $09
  $A72C  69 00     ADC #$00
  $A72E  F0 07     BEQ $A737
  $A730  A9 F8     LDA #$F8
  $A732  99 00 02  STA $0200,Y
  $A735  D0 16     BNE $A74D

L_A737:
  $A737  BD E4 AA  LDA $AAE4,X
  $A73A  99 01 02  STA $0201,Y
  $A73D  BD E5 AA  LDA $AAE5,X
  $A740  99 02 02  STA $0202,Y
  $A743  BD E6 AA  LDA $AAE6,X
  $A746  99 03 02  STA $0203,Y
  $A749  C8        INY
  $A74A  C8        INY
  $A74B  C8        INY
  $A74C  C8        INY

L_A74D:
  $A74D  E8        INX
  $A74E  E8        INX
  $A74F  E8        INX
  $A750  E8        INX
  $A751  C6 02     DEC $02
  $A753  D0 CC     BNE $A721
  $A755  84 00     STY $00

L_A757:
  $A757  A6 2B     LDX $2B
  $A759  E8        INX
  $A75A  E0 0F     CPX #$0F
  $A75C  D0 A2     BNE $A700
  $A75E  60        RTS

L_A75F:
  $A75F  AE 10 04  LDX $0410
  $A762  BD 23 AB  LDA $AB23,X
  $A765  85 08     STA $08
  $A767  BD 30 AB  LDA $AB30,X
  $A76A  85 09     STA $09
  $A76C  A0 00     LDY #$00
  $A76E  B1 08     LDA ($08),Y
  $A770  85 01     STA $01
  $A772  A6 00     LDX $00
  $A774  F0 39     BEQ $A7AF
  $A776  C8        INY

L_A777:
  $A777  18        CLC
  $A778  AD B0 04  LDA $04B0
  $A77B  71 08     ADC ($08),Y
  $A77D  9D 00 02  STA $0200,X
  $A780  AD 50 04  LDA $0450
  $A783  69 00     ADC #$00
  $A785  F0 0B     BEQ $A792
  $A787  C8        INY
  $A788  C8        INY
  $A789  C8        INY
  $A78A  C8        INY
  $A78B  A9 F8     LDA #$F8
  $A78D  9D 00 02  STA $0200,X
  $A790  D0 13     BNE $A7A5

L_A792:
  $A792  C8        INY
  $A793  B1 08     LDA ($08),Y
  $A795  9D 01 02  STA $0201,X
  $A798  C8        INY
  $A799  B1 08     LDA ($08),Y
  $A79B  9D 02 02  STA $0202,X
  $A79E  C8        INY
  $A79F  B1 08     LDA ($08),Y
  $A7A1  9D 03 02  STA $0203,X
  $A7A4  C8        INY

L_A7A5:
  $A7A5  E8        INX
  $A7A6  E8        INX
  $A7A7  E8        INX
  $A7A8  E8        INX
  $A7A9  F0 04     BEQ $A7AF
  $A7AB  C6 01     DEC $01
  $A7AD  D0 C8     BNE $A777

L_A7AF:
  $A7AF  60        RTS

L_A7B0:
  $A7B0  20 2D A5  JSR $A52D
  $A7B3  A9 50     LDA #$50
  $A7B5  85 FD     STA $FD
  $A7B7  A9 00     LDA #$00
  $A7B9  8D B7 03  STA $03B7
  $A7BC  85 FE     STA $FE
  $A7BE  A9 10     LDA #$10
  $A7C0  8D B6 03  STA $03B6
  $A7C3  A9 B0     LDA #$B0
  $A7C5  85 FF     STA $FF

L_A7C7:
  $A7C7  20 47 C7  JSR $C747
  $A7CA  20 DF D1  JSR $D1DF
  $A7CD  18        CLC
  $A7CE  AD B7 03  LDA $03B7
  $A7D1  69 20     ADC #$20
  $A7D3  8D B7 03  STA $03B7
  $A7D6  AD B6 03  LDA $03B6
  $A7D9  69 00     ADC #$00
  $A7DB  8D B6 03  STA $03B6
  $A7DE  18        CLC
  $A7DF  A5 FE     LDA $FE
  $A7E1  69 20     ADC #$20
  $A7E3  85 FE     STA $FE
  $A7E5  A5 FF     LDA $FF
  $A7E7  69 00     ADC #$00
  $A7E9  85 FF     STA $FF
  $A7EB  C6 FD     DEC $FD
  $A7ED  D0 D8     BNE $A7C7
  $A7EF  A9 D1     LDA #$D1
  $A7F1  85 08     STA $08
  $A7F3  A9 B6     LDA #$B6
  $A7F5  85 09     STA $09
  $A7F7  A9 20     LDA #$20
  $A7F9  8D 06 20  STA $2006
  $A7FC  A0 00     LDY #$00
  $A7FE  8C 06 20  STY $2006
  $A801  A2 1E     LDX #$1E

L_A803:
  $A803  A0 00     LDY #$00

L_A805:
  $A805  B1 08     LDA ($08),Y
  $A807  8D 07 20  STA $2007
  $A80A  C8        INY
  $A80B  C0 20     CPY #$20
  $A80D  D0 F6     BNE $A805
  $A80F  38        SEC
  $A810  A5 08     LDA $08
  $A812  E9 20     SBC #$20
  $A814  85 08     STA $08
  $A816  A5 09     LDA $09
  $A818  E9 00     SBC #$00
  $A81A  85 09     STA $09
  $A81C  CA        DEX
  $A81D  D0 E4     BNE $A803
  $A81F  A0 3F     LDY #$3F

L_A821:
  $A821  B9 F1 B2  LDA $B2F1,Y
  $A824  8D 07 20  STA $2007
  $A827  88        DEY
  $A828  10 F7     BPL $A821
  $A82A  A2 1F     LDX #$1F

L_A82C:
  $A82C  BD 8F AA  LDA $AA8F,X
  $A82F  9D 56 03  STA $0356,X
  $A832  CA        DEX
  $A833  10 F7     BPL $A82C
  $A835  A2 0F     LDX #$0F

L_A837:
  $A837  BD BF AA  LDA $AABF,X
  $A83A  9D 56 03  STA $0356,X
  $A83D  CA        DEX
  $A83E  10 F7     BPL $A837
  $A840  A2 1F     LDX #$1F
  $A842  A9 00     LDA #$00

L_A844:
  $A844  9D 40 04  STA $0440,X
  $A847  9D 00 04  STA $0400,X
  $A84A  CA        DEX
  $A84B  10 F7     BPL $A844
  $A84D  A9 77     LDA #$77
  $A84F  8D B0 04  STA $04B0
  $A852  A9 00     LDA #$00
  $A854  8D 10 04  STA $0410
  $A857  A9 08     LDA #$08
  $A859  8D 90 06  STA $0690
  $A85C  A9 01     LDA #$01
  $A85E  8D 02 04  STA $0402
  $A861  A9 CC     LDA #$CC
  $A863  8D A2 04  STA $04A2
  $A866  A9 02     LDA #$02
  $A868  8D 03 04  STA $0403
  $A86B  A9 A4     LDA #$A4
  $A86D  8D A3 04  STA $04A3
  $A870  20 1D A5  JSR $A51D
  $A873  A9 00     LDA #$00
  $A875  85 27     STA $27
  $A877  85 22     STA $22
  $A879  85 AE     STA $AE
  $A87B  4C E0 A1  JMP $A1E0

L_A87E:
  $A87E  A9 00     LDA #$00
  $A880  85 1A     STA $1A
  $A882  85 1B     STA $1B

L_A884:
  $A884  20 0B CA  JSR $CA0B
  $A887  E6 08     INC $08
  $A889  E6 1A     INC $1A
  $A88B  20 0B CA  JSR $CA0B
  $A88E  20 3C A5  JSR $A53C
  $A891  A5 08     LDA $08
  $A893  29 3F     AND #$3F
  $A895  D0 ED     BNE $A884
  $A897  60        RTS

L_A898:
  $A898  A9 04     LDA #$04
  $A89A  85 FD     STA $FD

L_A89C:
  $A89C  A5 1C     LDA $1C
  $A89E  29 03     AND #$03
  $A8A0  D0 07     BNE $A8A9
  $A8A2  20 B0 A8  JSR $A8B0
  $A8A5  C6 FD     DEC $FD
  $A8A7  30 06     BMI $A8AF

L_A8A9:
  $A8A9  20 AB C0  JSR $C0AB
  $A8AC  4C 9C A8  JMP $A89C

L_A8AF:
  $A8AF  60        RTS

L_A8B0:
  $A8B0  A2 07     LDX #$07
  $A8B2  A9 04     LDA #$04
  $A8B4  20 BF A8  JSR $A8BF
  $A8B7  A2 1F     LDX #$1F
  $A8B9  A9 0F     LDA #$0F
  $A8BB  20 BF A8  JSR $A8BF
  $A8BE  60        RTS

L_A8BF:
  $A8BF  85 00     STA $00

L_A8C1:
  $A8C1  38        SEC
  $A8C2  BD 56 03  LDA $0356,X
  $A8C5  E9 10     SBC #$10
  $A8C7  10 02     BPL $A8CB
  $A8C9  A9 0F     LDA #$0F

L_A8CB:
  $A8CB  9D 56 03  STA $0356,X
  $A8CE  CA        DEX
  $A8CF  E4 00     CPX $00
  $A8D1  D0 EE     BNE $A8C1
  $A8D3  60        RTS

L_A8D4:
  $A8D4  A9 04     LDA #$04
  $A8D6  85 FD     STA $FD

L_A8D8:
  $A8D8  A5 1C     LDA $1C
  $A8DA  29 03     AND #$03
  $A8DC  D0 07     BNE $A8E5
  $A8DE  20 EC A8  JSR $A8EC
  $A8E1  C6 FD     DEC $FD
  $A8E3  30 06     BMI $A8EB

L_A8E5:
  $A8E5  20 AB C0  JSR $C0AB
  $A8E8  4C D8 A8  JMP $A8D8

L_A8EB:
  $A8EB  60        RTS

L_A8EC:
  $A8EC  A2 07     LDX #$07
  $A8EE  A0 07     LDY #$07
  $A8F0  A9 04     LDA #$04
  $A8F2  20 FF A8  JSR $A8FF
  $A8F5  A2 1F     LDX #$1F
  $A8F7  A0 1F     LDY #$1F
  $A8F9  A9 0F     LDA #$0F
  $A8FB  20 FF A8  JSR $A8FF
  $A8FE  60        RTS

L_A8FF:
  $A8FF  85 01     STA $01

L_A901:
  $A901  BD 56 03  LDA $0356,X
  $A904  C9 0F     CMP #$0F
  $A906  D0 08     BNE $A910
  $A908  B9 F9 AE  LDA $AEF9,Y
  $A90B  29 0F     AND #$0F
  $A90D  4C 1D A9  JMP $A91D

L_A910:
  $A910  18        CLC
  $A911  BD 56 03  LDA $0356,X
  $A914  69 10     ADC #$10
  $A916  D9 F9 AE  CMP $AEF9,Y
  $A919  F0 02     BEQ $A91D
  $A91B  B0 03     BCS $A920

L_A91D:
  $A91D  9D 56 03  STA $0356,X

L_A920:
  $A920  88        DEY
  $A921  CA        DEX
  $A922  E4 01     CPX $01
  $A924  D0 DB     BNE $A901
  $A926  60        RTS

L_A927:
  $A927  AE A0 06  LDX $06A0
  $A92A  BD FB AF  LDA $AFFB,X
  $A92D  85 09     STA $09
  $A92F  BD 14 B0  LDA $B014,X
  $A932  85 08     STA $08
  $A934  A2 0F     LDX #$0F

L_A936:
  $A936  18        CLC
  $A937  BD 99 B0  LDA $B099,X
  $A93A  65 08     ADC $08
  $A93C  9D 30 02  STA $0230,X
  $A93F  CA        DEX
  $A940  BD 99 B0  LDA $B099,X
  $A943  9D 30 02  STA $0230,X
  $A946  CA        DEX
  $A947  BD 99 B0  LDA $B099,X
  $A94A  9D 30 02  STA $0230,X
  $A94D  CA        DEX
  $A94E  18        CLC
  $A94F  BD 99 B0  LDA $B099,X
  $A952  65 09     ADC $09
  $A954  9D 30 02  STA $0230,X
  $A957  CA        DEX
  $A958  10 DC     BPL $A936
  $A95A  A5 1C     LDA $1C
  $A95C  4A        LSR
  $A95D  29 07     AND #$07
  $A95F  AA        TAX
  $A960  BD 91 B0  LDA $B091,X
  $A963  8D 6C 03  STA $036C
  $A966  18        CLC
  $A967  AD 80 06  LDA $0680
  $A96A  69 24     ADC #$24
  $A96C  8D 2D 02  STA $022D
  $A96F  A2 00     LDX #$00
  $A971  A0 40     LDY #$40

L_A973:
  $A973  BD 20 04  LDA $0420,X
  $A976  D0 04     BNE $A97C
  $A978  A9 F8     LDA #$F8
  $A97A  D0 02     BNE $A97E

L_A97C:
  $A97C  A9 3F     LDA #$3F

L_A97E:
  $A97E  99 01 02  STA $0201,Y
  $A981  C8        INY
  $A982  C8        INY
  $A983  C8        INY
  $A984  C8        INY
  $A985  E8        INX
  $A986  E0 19     CPX #$19
  $A988  D0 E9     BNE $A973
  $A98A  60        RTS

L_A98B:
  $A98B  BD BD AF  LDA $AFBD,X
  $A98E  AA        TAX
  $A98F  BD 39 AF  LDA $AF39,X
  $A992  8D B6 03  STA $03B6
  $A995  E8        INX
  $A996  BD 39 AF  LDA $AF39,X
  $A999  8D B7 03  STA $03B7
  $A99C  E8        INX
  $A99D  BD 39 AF  LDA $AF39,X
  $A9A0  85 47     STA $47
  $A9A2  E8        INX
  $A9A3  A0 00     LDY #$00

L_A9A5:
  $A9A5  BD 39 AF  LDA $AF39,X
  $A9A8  99 B8 03  STA $03B8,Y
  $A9AB  E8        INX
  $A9AC  C8        INY
  $A9AD  C4 47     CPY $47
  $A9AF  D0 F4     BNE $A9A5
  $A9B1  60        RTS

L_A9B2:
  $A9B2  85 20     STA $20
  $A9B4  A9 00     LDA #$00
  $A9B6  85 1F     STA $1F
  $A9B8  85 22     STA $22
  $A9BA  A2 21     LDX #$21

L_A9BC:
  $A9BC  BD F7 AE  LDA $AEF7,X
  $A9BF  9D 54 03  STA $0354,X
  $A9C2  CA        DEX
  $A9C3  10 F7     BPL $A9BC
  $A9C5  20 73 84  JSR $8473
  $A9C8  20 1D A5  JSR $A51D
  $A9CB  60        RTS

L_A9CC:
  $A9CC  18        CLC
  $A9CD  A5 1F     LDA $1F
  $A9CF  69 08     ADC #$08
  $A9D1  85 1F     STA $1F
  $A9D3  08        PHP
  $A9D4  A5 20     LDA $20
  $A9D6  69 00     ADC #$00
  $A9D8  85 20     STA $20
  $A9DA  28        PLP
  $A9DB  F0 0C     BEQ $A9E9
  $A9DD  20 AB C0  JSR $C0AB
  $A9E0  20 AB C0  JSR $C0AB
  $A9E3  20 AB C0  JSR $C0AB
  $A9E6  4C CC A9  JMP $A9CC

L_A9E9:
  $A9E9  60        RTS

L_A9EA:
  $A9EA  A9 00     LDA #$00
  $A9EC  85 1B     STA $1B
  $A9EE  85 1A     STA $1A

L_A9F0:
  $A9F0  A5 FD     LDA $FD
  $A9F2  85 08     STA $08
  $A9F4  A5 FE     LDA $FE
  $A9F6  85 09     STA $09
  $A9F8  20 0B CA  JSR $CA0B
  $A9FB  E6 FD     INC $FD
  $A9FD  E6 1A     INC $1A
  $A9FF  20 AB C0  JSR $C0AB
  $AA02  A5 FD     LDA $FD
  $AA04  29 3F     AND #$3F
  $AA06  D0 E8     BNE $A9F0
  $AA08  60        RTS

L_AA09:
  $AA09  38        SEC
  $AA0A  A5 1F     LDA $1F
  $AA0C  E9 08     SBC #$08
  $AA0E  85 1F     STA $1F
  $AA10  F0 12     BEQ $AA24
  $AA12  A5 20     LDA $20
  $AA14  E9 00     SBC #$00
  $AA16  85 20     STA $20
  $AA18  20 AB C0  JSR $C0AB
  $AA1B  20 AB C0  JSR $C0AB
  $AA1E  20 AB C0  JSR $C0AB
  $AA21  4C 09 AA  JMP $AA09

L_AA24:
  $AA24  60        RTS

L_AA25:
  $AA25  A2 00     LDX #$00
  $AA27  A0 40     LDY #$40

L_AA29:
  $AA29  18        CLC
  $AA2A  BD FB AF  LDA $AFFB,X
  $AA2D  69 04     ADC #$04
  $AA2F  99 00 02  STA $0200,Y
  $AA32  C8        INY
  $AA33  A9 0F     LDA #$0F
  $AA35  99 00 02  STA $0200,Y
  $AA38  C8        INY
  $AA39  A9 00     LDA #$00
  $AA3B  99 00 02  STA $0200,Y
  $AA3E  C8        INY
  $AA3F  18        CLC
  $AA40  BD 14 B0  LDA $B014,X
  $AA43  69 04     ADC #$04
  $AA45  99 00 02  STA $0200,Y
  $AA48  C8        INY
  $AA49  E8        INX
  $AA4A  E0 19     CPX #$19
  $AA4C  D0 DB     BNE $AA29
  $AA4E  60        RTS
  $AA4F  0F        .db $0F
  $AA50  0F        .db $0F
  $AA51  0F        .db $0F
  $AA52  04        .db $04
  $AA53  0F        .db $0F
  $AA54  0F        .db $0F
  $AA55  0F        .db $0F
  $AA56  0F        .db $0F
  $AA57  0F        .db $0F
  $AA58  0F        .db $0F
  $AA59  0F        .db $0F
  $AA5A  07        .db $07
  $AA5B  0F        .db $0F
  $AA5C  0F        .db $0F
  $AA5D  0F        .db $0F
  $AA5E  00        BRK
  $AA5F  0F        .db $0F
  $AA60  0F        .db $0F
  $AA61  2C 11 0F  BIT $0F11
  $AA64  0F        .db $0F
  $AA65  30 38     BMI $AA9F
  $AA67  0F        .db $0F
  $AA68  0F        .db $0F
  $AA69  0C        .db $0C
  $AA6A  00        BRK
  $AA6B  0F        .db $0F
  $AA6C  0F        .db $0F
  $AA6D  0F        .db $0F
  $AA6E  00        BRK
  $AA6F  0F        .db $0F
  $AA70  00        BRK
  $AA71  03        .db $03
  $AA72  14        .db $14
  $AA73  0F        .db $0F
  $AA74  0F        .db $0F
  $AA75  01 00     ORA ($00,X)
  $AA77  0F        .db $0F
  $AA78  00        BRK
  $AA79  04        .db $04
  $AA7A  17        .db $17
  $AA7B  0F        .db $0F
  $AA7C  00        BRK
  $AA7D  00        BRK
  $AA7E  10 0F     BPL $AA8F
  $AA80  0F        .db $0F
  $AA81  2C 11 0F  BIT $0F11
  $AA84  0F        .db $0F
  $AA85  30 38     BMI $AABF
  $AA87  0F        .db $0F
  $AA88  10 1C     BPL $AAA6
  $AA8A  01 0F     ORA ($0F,X)
  $AA8C  00        BRK
  $AA8D  00        BRK
  $AA8E  10 0F     BPL $AA9F
  $AA90  03        .db $03
  $AA91  13        .db $13
  $AA92  24 0F     BIT $0F
  $AA94  0F        .db $0F
  $AA95  11 0C     ORA ($0C),Y
  $AA97  0F        .db $0F
  $AA98  04        .db $04
  $AA99  14        .db $14
  $AA9A  27        .db $27
  $AA9B  0F        .db $0F
  $AA9C  00        BRK
  $AA9D  10 30     BPL $AACF

L_AA9F:
  $AA9F  0F        .db $0F
  $AAA0  0F        .db $0F
  $AAA1  2C 11 0F  BIT $0F11
  $AAA4  0F        .db $0F
  $AAA5  30 38     BMI $AADF
  $AAA7  0F        .db $0F
  $AAA8  30 2C     BMI $AAD6
  $AAAA  11 0F     ORA ($0F),Y
  $AAAC  00        BRK
  $AAAD  10 30     BPL $AADF
  $AAAF  0F        .db $0F
  $AAB0  0F        .db $0F
  $AAB1  0F        .db $0F
  $AAB2  0F        .db $0F
  $AAB3  0F        .db $0F
  $AAB4  0F        .db $0F
  $AAB5  0F        .db $0F
  $AAB6  0F        .db $0F
  $AAB7  0F        .db $0F
  $AAB8  0F        .db $0F
  $AAB9  0F        .db $0F
  $AABA  0F        .db $0F
  $AABB  0F        .db $0F
  $AABC  00        BRK
  $AABD  10 30     BPL $AAEF

L_AABF:
  $AABF  26 15     ROL $15
  $AAC1  20 06 0F  JSR $0F06
  $AAC4  30 2C     BMI $AAF2
  $AAC6  15 26     ORA $26,X
  $AAC8  21 20     AND ($20,X)
  $AACA  0B        .db $0B
  $AACB  0F        .db $0F
  $AACC  00        BRK
  $AACD  10 30     BPL $AAFF

L_AACF:
  $AACF  2F        .db $2F
  $AAD0  3C        .db $3C
  $AAD1  02        .db $02
  $AAD2  C0 37     CPY #$37
  $AAD4  3D 02 C0  AND $C002,X
  $AAD7  3F        .db $3F
  $AAD8  3B        .db $3B
  $AAD9  02        .db $02
  $AADA  C0 3F     CPY #$3F
  $AADC  3A        .db $3A
  $AADD  02        .db $02
  $AADE  B8        CLV

L_AADF:
  $AADF  3F        .db $3F
  $AAE0  39 02 B0  AND $B002,Y
  $AAE3  00        BRK
  $AAE4  30 02     BMI $AAE8
  $AAE6  C0 00     CPY #$00

L_AAE8:
  $AAE8  31 02     AND ($02),Y
  $AAEA  C8        INY
  $AAEB  08        PHP
  $AAEC  32        .db $32
  $AAED  02        .db $02
  $AAEE  C0 08     CPY #$08
  $AAF0  33        .db $33
  $AAF1  02        .db $02

L_AAF2:
  $AAF2  C8        INY
  $AAF3  10 34     BPL $AB29
  $AAF5  02        .db $02
  $AAF6  C0 10     CPY #$10
  $AAF8  35 02     AND $02,X
  $AAFA  C8        INY
  $AAFB  00        BRK
  $AAFC  30 02     BMI $AB00
  $AAFE  E0 00     CPX #$00

L_AB00:
  $AB00  31 02     AND ($02),Y
  $AB02  E8        INX
  $AB03  08        PHP
  $AB04  32        .db $32
  $AB05  02        .db $02
  $AB06  E0 08     CPX #$08
  $AB08  33        .db $33
  $AB09  02        .db $02
  $AB0A  E8        INX
  $AB0B  10 34     BPL $AB41
  $AB0D  02        .db $02
  $AB0E  E0 10     CPX #$10
  $AB10  35 02     AND $02,X
  $AB12  E8        INX
  $AB13  00        BRK
  $AB14  36 03     ROL $03,X
  $AB16  98        TYA
  $AB17  08        PHP
  $AB18  37        .db $37
  $AB19  03        .db $03
  $AB1A  98        TYA
  $AB1B  10 37     BPL $AB54
  $AB1D  03        .db $03
  $AB1E  98        TYA
  $AB1F  18        CLC
  $AB20  38        SEC
  $AB21  03        .db $03
  $AB22  98        TYA
  $AB23  3D 6A 97  AND $976A,X
  $AB26  C8        INY
  $AB27  F9 2E 57  SBC $572E,Y
  $AB2A  80        .db $80
  $AB2B  A9 D2     LDA #$D2
  $AB2D  FB        .db $FB
  $AB2E  0C        .db $0C
  $AB2F  35 AB     AND $AB,X
  $AB31  AB        .db $AB
  $AB32  AB        .db $AB
  $AB33  AB        .db $AB
  $AB34  AB        .db $AB
  $AB35  AC AC AC  LDY $ACAC
  $AB38  AC AC AC  LDY $ACAC
  $AB3B  AD AD 0B  LDA $0BAD
  $AB3E  00        BRK
  $AB3F  00        BRK
  $AB40  01 C8     ORA ($C8,X)
  $AB42  00        BRK
  $AB43  01 01     ORA ($01,X)
  $AB45  D0 00     BNE $AB47

L_AB47:
  $AB47  02        .db $02
  $AB48  01 D8     ORA ($D8,X)
  $AB4A  08        PHP
  $AB4B  03        .db $03
  $AB4C  00        BRK
  $AB4D  C8        INY
  $AB4E  08        PHP
  $AB4F  04        .db $04
  $AB50  00        BRK
  $AB51  D0 08     BNE $AB5B
  $AB53  05 00     ORA $00
  $AB55  D8        CLD
  $AB56  08        PHP
  $AB57  1F        .db $1F
  $AB58  01 C8     ORA ($C8,X)
  $AB5A  08        PHP

L_AB5B:
  $AB5B  20 01 D0  JSR $D001
  $AB5E  10 06     BPL $AB66
  $AB60  00        BRK
  $AB61  C8        INY
  $AB62  10 07     BPL $AB6B
  $AB64  00        BRK
  $AB65  D0 10     BNE $AB77
  $AB67  08        PHP
  $AB68  00        BRK
  $AB69  D8        CLD
  $AB6A  0B        .db $0B

L_AB6B:
  $AB6B  00        BRK
  $AB6C  09 01     ORA #$01
  $AB6E  C8        INY
  $AB6F  00        BRK
  $AB70  0A        ASL
  $AB71  01 D0     ORA ($D0,X)
  $AB73  00        BRK
  $AB74  0B        .db $0B
  $AB75  01 D8     ORA ($D8,X)

L_AB77:
  $AB77  08        PHP
  $AB78  03        .db $03
  $AB79  00        BRK
  $AB7A  C8        INY
  $AB7B  08        PHP
  $AB7C  04        .db $04
  $AB7D  00        BRK
  $AB7E  D0 08     BNE $AB88
  $AB80  05 00     ORA $00
  $AB82  D8        CLD
  $AB83  08        PHP
  $AB84  1F        .db $1F
  $AB85  01 C8     ORA ($C8,X)
  $AB87  08        PHP

L_AB88:
  $AB88  20 01 D0  JSR $D001
  $AB8B  10 06     BPL $AB93
  $AB8D  00        BRK
  $AB8E  C8        INY
  $AB8F  10 07     BPL $AB98
  $AB91  00        BRK
  $AB92  D0 10     BNE $ABA4
  $AB94  08        PHP
  $AB95  00        BRK
  $AB96  D8        CLD
  $AB97  0C        .db $0C

L_AB98:
  $AB98  00        BRK
  $AB99  0C        .db $0C
  $AB9A  01 C8     ORA ($C8,X)
  $AB9C  00        BRK
  $AB9D  0D 01 D0  ORA $D001
  $ABA0  00        BRK
  $ABA1  02        .db $02
  $ABA2  01 D8     ORA ($D8,X)

L_ABA4:
  $ABA4  00        BRK
  $ABA5  21 00     AND ($00,X)
  $ABA7  D0 08     BNE $ABB1
  $ABA9  03        .db $03
  $ABAA  00        BRK
  $ABAB  C8        INY
  $ABAC  08        PHP
  $ABAD  04        .db $04
  $ABAE  00        BRK
  $ABAF  D0 08     BNE $ABB9

L_ABB1:
  $ABB1  05 00     ORA $00
  $ABB3  D8        CLD
  $ABB4  08        PHP
  $ABB5  23        .db $23
  $ABB6  01 C8     ORA ($C8,X)
  $ABB8  08        PHP

L_ABB9:
  $ABB9  24 01     BIT $01
  $ABBB  D0 10     BNE $ABCD
  $ABBD  06 00     ASL $00
  $ABBF  C8        INY
  $ABC0  10 07     BPL $ABC9
  $ABC2  00        BRK
  $ABC3  D0 10     BNE $ABD5
  $ABC5  08        PHP
  $ABC6  00        BRK
  $ABC7  D8        CLD
  $ABC8  0C        .db $0C

L_ABC9:
  $ABC9  00        BRK
  $ABCA  0C        .db $0C
  $ABCB  01 C8     ORA ($C8,X)

L_ABCD:
  $ABCD  00        BRK
  $ABCE  0E 01 D0  ASL $D001
  $ABD1  00        BRK
  $ABD2  02        .db $02
  $ABD3  01 D8     ORA ($D8,X)

L_ABD5:
  $ABD5  00        BRK
  $ABD6  22        .db $22
  $ABD7  00        BRK
  $ABD8  D0 08     BNE $ABE2
  $ABDA  03        .db $03
  $ABDB  00        BRK
  $ABDC  C8        INY
  $ABDD  08        PHP
  $ABDE  04        .db $04
  $ABDF  00        BRK
  $ABE0  D0 08     BNE $ABEA

L_ABE2:
  $ABE2  05 00     ORA $00
  $ABE4  D8        CLD
  $ABE5  08        PHP
  $ABE6  23        .db $23
  $ABE7  01 C8     ORA ($C8,X)
  $ABE9  08        PHP

L_ABEA:
  $ABEA  24 01     BIT $01
  $ABEC  D0 10     BNE $ABFE
  $ABEE  06 00     ASL $00
  $ABF0  C8        INY
  $ABF1  10 07     BPL $ABFA
  $ABF3  00        BRK
  $ABF4  D0 10     BNE $AC06
  $ABF6  08        PHP
  $ABF7  00        BRK
  $ABF8  D8        CLD
  $ABF9  0D 00 0F  ORA $0F00
  $ABFC  01 C8     ORA ($C8,X)

L_ABFE:
  $ABFE  00        BRK
  $ABFF  10 01     BPL $AC02
  $AC01  D0 00     BNE $AC03

L_AC03:
  $AC03  11 01     ORA ($01),Y
  $AC05  D8        CLD

L_AC06:
  $AC06  00        BRK
  $AC07  25 00     AND $00
  $AC09  C8        INY
  $AC0A  00        BRK
  $AC0B  26 00     ROL $00
  $AC0D  D0 08     BNE $AC17
  $AC0F  03        .db $03
  $AC10  00        BRK
  $AC11  C8        INY
  $AC12  08        PHP
  $AC13  04        .db $04
  $AC14  00        BRK
  $AC15  D0 08     BNE $AC1F

L_AC17:
  $AC17  05 00     ORA $00
  $AC19  D8        CLD
  $AC1A  08        PHP
  $AC1B  1F        .db $1F
  $AC1C  01 C8     ORA ($C8,X)
  $AC1E  08        PHP

L_AC1F:
  $AC1F  20 01 D0  JSR $D001
  $AC22  10 06     BPL $AC2A
  $AC24  00        BRK
  $AC25  C8        INY
  $AC26  10 07     BPL $AC2F
  $AC28  00        BRK
  $AC29  D0 10     BNE $AC3B
  $AC2B  08        PHP
  $AC2C  00        BRK
  $AC2D  D8        CLD
  $AC2E  0A        ASL

L_AC2F:
  $AC2F  00        BRK
  $AC30  12        .db $12
  $AC31  00        BRK
  $AC32  C8        INY
  $AC33  00        BRK
  $AC34  13        .db $13
  $AC35  00        BRK
  $AC36  D0 00     BNE $AC38

L_AC38:
  $AC38  14        .db $14
  $AC39  00        BRK
  $AC3A  D8        CLD

L_AC3B:
  $AC3B  08        PHP
  $AC3C  03        .db $03
  $AC3D  00        BRK
  $AC3E  C8        INY
  $AC3F  08        PHP
  $AC40  15 00     ORA $00,X
  $AC42  D0 08     BNE $AC4C
  $AC44  05 00     ORA $00
  $AC46  D8        CLD
  $AC47  10 06     BPL $AC4F
  $AC49  00        BRK
  $AC4A  C8        INY
  $AC4B  10 07     BPL $AC54
  $AC4D  00        BRK
  $AC4E  D0 10     BNE $AC60
  $AC50  08        PHP
  $AC51  00        BRK
  $AC52  D8        CLD
  $AC53  06 27     ASL $27
  $AC55  01 CF     ORA ($CF,X)
  $AC57  0A        ASL
  $AC58  00        BRK
  $AC59  12        .db $12
  $AC5A  00        BRK
  $AC5B  C8        INY
  $AC5C  00        BRK
  $AC5D  16 00     ASL $00,X
  $AC5F  D0 00     BNE $AC61

L_AC61:
  $AC61  17        .db $17
  $AC62  00        BRK
  $AC63  D8        CLD
  $AC64  08        PHP
  $AC65  03        .db $03
  $AC66  00        BRK
  $AC67  C8        INY
  $AC68  08        PHP
  $AC69  18        CLC
  $AC6A  00        BRK
  $AC6B  D0 08     BNE $AC75
  $AC6D  19 00 D8  ORA $D800,Y
  $AC70  10 06     BPL $AC78
  $AC72  00        BRK
  $AC73  C8        INY
  $AC74  10 07     BPL $AC7D
  $AC76  00        BRK
  $AC77  D0 10     BNE $AC89
  $AC79  08        PHP
  $AC7A  00        BRK
  $AC7B  D8        CLD
  $AC7C  06 28     ASL $28
  $AC7E  01 CF     ORA ($CF,X)
  $AC80  0A        ASL
  $AC81  00        BRK
  $AC82  12        .db $12
  $AC83  00        BRK
  $AC84  C8        INY
  $AC85  00        BRK
  $AC86  1A        .db $1A
  $AC87  00        BRK
  $AC88  D0 00     BNE $AC8A

L_AC8A:
  $AC8A  17        .db $17
  $AC8B  00        BRK
  $AC8C  D8        CLD
  $AC8D  08        PHP
  $AC8E  03        .db $03
  $AC8F  00        BRK
  $AC90  C8        INY
  $AC91  08        PHP
  $AC92  1B        .db $1B
  $AC93  00        BRK
  $AC94  D0 08     BNE $AC9E
  $AC96  05 00     ORA $00
  $AC98  D8        CLD
  $AC99  10 06     BPL $ACA1
  $AC9B  00        BRK
  $AC9C  C8        INY
  $AC9D  10 07     BPL $ACA6
  $AC9F  00        BRK
  $ACA0  D0 10     BNE $ACB2
  $ACA2  08        PHP
  $ACA3  00        BRK
  $ACA4  D8        CLD
  $ACA5  06 28     ASL $28
  $ACA7  01 CF     ORA ($CF,X)
  $ACA9  0A        ASL
  $ACAA  00        BRK
  $ACAB  1C        .db $1C
  $ACAC  00        BRK
  $ACAD  C8        INY
  $ACAE  00        BRK
  $ACAF  1D 00 D0  ORA $D000,X

L_ACB2:
  $ACB2  00        BRK
  $ACB3  17        .db $17
  $ACB4  00        BRK
  $ACB5  D8        CLD
  $ACB6  08        PHP
  $ACB7  03        .db $03
  $ACB8  00        BRK
  $ACB9  C8        INY
  $ACBA  08        PHP
  $ACBB  18        CLC
  $ACBC  00        BRK
  $ACBD  D0 08     BNE $ACC7
  $ACBF  05 00     ORA $00
  $ACC1  D8        CLD
  $ACC2  10 06     BPL $ACCA
  $ACC4  00        BRK
  $ACC5  C8        INY
  $ACC6  10 07     BPL $ACCF
  $ACC8  00        BRK
  $ACC9  D0 10     BNE $ACDB
  $ACCB  08        PHP
  $ACCC  00        BRK
  $ACCD  D8        CLD
  $ACCE  06 28     ASL $28
  $ACD0  01 CF     ORA ($CF,X)
  $ACD2  0A        ASL
  $ACD3  00        BRK
  $ACD4  1C        .db $1C
  $ACD5  00        BRK
  $ACD6  C8        INY
  $ACD7  00        BRK
  $ACD8  1E 00 D0  ASL $D000,X

L_ACDB:
  $ACDB  00        BRK
  $ACDC  17        .db $17
  $ACDD  00        BRK
  $ACDE  D8        CLD
  $ACDF  08        PHP
  $ACE0  03        .db $03
  $ACE1  00        BRK
  $ACE2  C8        INY
  $ACE3  08        PHP
  $ACE4  18        CLC
  $ACE5  00        BRK
  $ACE6  D0 08     BNE $ACF0
  $ACE8  05 00     ORA $00
  $ACEA  D8        CLD
  $ACEB  10 06     BPL $ACF3
  $ACED  00        BRK
  $ACEE  C8        INY
  $ACEF  10 07     BPL $ACF8
  $ACF1  00        BRK
  $ACF2  D0 10     BNE $AD04
  $ACF4  08        PHP
  $ACF5  00        BRK
  $ACF6  D8        CLD
  $ACF7  06 28     ASL $28
  $ACF9  01 CF     ORA ($CF,X)
  $ACFB  04        .db $04
  $ACFC  F8        SED
  $ACFD  2A        ROL
  $ACFE  00        BRK
  $ACFF  D0 00     BNE $AD01

L_AD01:
  $AD01  2A        ROL
  $AD02  00        BRK
  $AD03  D0 08     BNE $AD0D
  $AD05  2A        ROL
  $AD06  00        BRK
  $AD07  D0 10     BNE $AD19
  $AD09  2A        ROL
  $AD0A  00        BRK
  $AD0B  D0 0A     BNE $AD17

L_AD0D:
  $AD0D  F8        SED
  $AD0E  2F        .db $2F
  $AD0F  00        BRK
  $AD10  D0 00     BNE $AD12

L_AD12:
  $AD12  2C 00 C8  BIT $C800
  $AD15  00        BRK
  $AD16  2D 00 D0  AND $D000

L_AD19:
  $AD19  00        BRK
  $AD1A  2C 40 D8  BIT $D840
  $AD1D  08        PHP
  $AD1E  2C 00 C8  BIT $C800
  $AD21  08        PHP
  $AD22  2D 00 D0  AND $D000
  $AD25  08        PHP
  $AD26  2C 40 D8  BIT $D840
  $AD29  10 2B     BPL $AD56
  $AD2B  00        BRK
  $AD2C  C8        INY
  $AD2D  10 2E     BPL $AD5D
  $AD2F  00        BRK
  $AD30  D0 10     BNE $AD42
  $AD32  2B        .db $2B
  $AD33  40        RTI
  $AD34  D8        CLD
  $AD35  04        .db $04
  $AD36  08        PHP
  $AD37  2F        .db $2F
  $AD38  00        BRK
  $AD39  D0 10     BNE $AD4B
  $AD3B  2B        .db $2B
  $AD3C  00        BRK
  $AD3D  C8        INY
  $AD3E  10 2E     BPL $AD6E
  $AD40  00        BRK
  $AD41  D0 10     BNE $AD53
  $AD43  2B        .db $2B
  $AD44  40        RTI
  $AD45  D8        CLD
  $AD46  00        BRK
  $AD47  00        BRK
  $AD48  00        BRK
  $AD49  C9 CE     CMP #$CE

L_AD4B:
  $AD4B  00        BRK
  $AD4C  D4        .db $D4
  $AD4D  C8        INY
  $AD4E  C5 00     CMP $00
  $AD50  D9 C5 C1  CMP $C1C5,Y

L_AD53:
  $AD53  D2        .db $D2
  $AD54  00        BRK
  $AD55  CF        .db $CF

L_AD56:
  $AD56  C6 00     DEC $00
  $AD58  A2 A0     LDX #$A0
  $AD5A  A0 D8     LDY #$D8
  $AD5C  DD 00 00  CMP $0000,X
  $AD5F  00        BRK
  $AD60  00        BRK
  $AD61  C1 00     CMP ($00,X)
  $AD63  D3        .db $D3
  $AD64  D5 D0     CMP $D0,X
  $AD66  C5 D2     CMP $D2
  $AD68  00        BRK
  $AD69  D2        .db $D2
  $AD6A  CF        .db $CF
  $AD6B  C2        .db $C2
  $AD6C  CF        .db $CF
  $AD6D  D4        .db $D4

L_AD6E:
  $AD6E  00        BRK
  $AD6F  CE C1 CD  DEC $CDC1
  $AD72  C5 C4     CMP $C4
  $AD74  00        BRK
  $AD75  CD C5 C7  CMP $C7C5
  $AD78  C1 CD     CMP ($CD,X)
  $AD7A  C1 CE     CMP ($CE,X)
  $AD7C  00        BRK
  $AD7D  00        BRK
  $AD7E  00        BRK
  $AD7F  00        BRK
  $AD80  00        BRK
  $AD81  00        BRK
  $AD82  00        BRK
  $AD83  D7        .db $D7
  $AD84  C1 D3     CMP ($D3,X)
  $AD86  00        BRK
  $AD87  C3        .db $C3
  $AD88  D2        .db $D2
  $AD89  C5 C1     CMP $C1
  $AD8B  D4        .db $D4
  $AD8C  C5 C4     CMP $C4
  $AD8E  DC        .db $DC
  $AD8F  00        BRK
  $AD90  00        BRK
  $AD91  00        BRK
  $AD92  00        BRK
  $AD93  00        BRK
  $AD94  00        BRK
  $AD95  00        BRK
  $AD96  00        BRK
  $AD97  00        BRK
  $AD98  C4 D2     CPY $D2
  $AD9A  DC        .db $DC
  $AD9B  CC C9 C7  CPY $C7C9
  $AD9E  C8        INY
  $AD9F  D4        .db $D4
  $ADA0  00        BRK
  $ADA1  C3        .db $C3
  $ADA2  D2        .db $D2
  $ADA3  C5 C1     CMP $C1
  $ADA5  D4        .db $D4
  $ADA6  C5 C4     CMP $C4
  $ADA8  00        BRK
  $ADA9  CD C5 C7  CMP $C7C5
  $ADAC  C1 CD     CMP ($CD,X)
  $ADAE  C1 CE     CMP ($CE,X)
  $ADB0  00        BRK
  $ADB1  00        BRK
  $ADB2  00        BRK
  $ADB3  D4        .db $D4
  $ADB4  CF        .db $CF
  $ADB5  00        BRK
  $ADB6  D3        .db $D3
  $ADB7  D4        .db $D4
  $ADB8  CF        .db $CF
  $ADB9  D0 00     BNE $ADBB

L_ADBB:
  $ADBB  D4        .db $D4
  $ADBC  C8        INY
  $ADBD  C5 00     CMP $00
  $ADBF  C5 D6     CMP $D6
  $ADC1  C9 CC     CMP #$CC
  $ADC3  00        BRK
  $ADC4  C4 C5     CPY $C5
  $ADC6  D3        .db $D3
  $ADC7  C9 D2     CMP #$D2
  $ADC9  C5 D3     CMP $D3
  $ADCB  00        BRK
  $ADCC  00        BRK
  $ADCD  00        BRK
  $ADCE  00        BRK
  $ADCF  00        BRK
  $ADD0  00        BRK
  $ADD1  00        BRK
  $ADD2  00        BRK
  $ADD3  00        BRK
  $ADD4  00        BRK
  $ADD5  CF        .db $CF
  $ADD6  C6 00     DEC $00
  $ADD8  C4 D2     CPY $D2
  $ADDA  DC        .db $DC
  $ADDB  D7        .db $D7
  $ADDC  C9 CC     CMP #$CC
  $ADDE  D9 DC 00  CMP $00DC,Y
  $ADE1  00        BRK
  $ADE2  00        BRK
  $ADE3  00        BRK
  $ADE4  00        BRK
  $ADE5  00        BRK
  $ADE6  00        BRK
  $ADE7  00        BRK
  $ADE8  00        BRK
  $ADE9  C8        INY
  $ADEA  CF        .db $CF
  $ADEB  D7        .db $D7
  $ADEC  C5 D6     CMP $D6
  $ADEE  C5 D2     CMP $D2
  $ADF0  DD C1 C6  CMP $C6C1,X
  $ADF3  D4        .db $D4
  $ADF4  C5 D2     CMP $D2
  $ADF6  00        BRK
  $ADF7  C8        INY
  $ADF8  C9 D3     CMP #$D3
  $ADFA  00        BRK
  $ADFB  C4 C5     CPY $C5
  $ADFD  C6 C5     DEC $C5
  $ADFF  C1 D4     CMP ($D4,X)
  $AE01  DD 00 00  CMP $0000,X
  $AE04  00        BRK
  $AE05  00        BRK
  $AE06  C4 D2     CPY $D2
  $AE08  DC        .db $DC
  $AE09  D7        .db $D7
  $AE0A  C9 CC     CMP #$CC
  $AE0C  D9 00 C3  CMP $C300,Y
  $AE0F  D2        .db $D2
  $AE10  C5 C1     CMP $C1
  $AE12  D4        .db $D4
  $AE13  C5 C4     CMP $C4
  $AE15  00        BRK
  $AE16  C5 C9     CMP $C9
  $AE18  C7        .db $C7
  $AE19  C8        INY
  $AE1A  D4        .db $D4
  $AE1B  00        BRK
  $AE1C  00        BRK
  $AE1D  00        BRK
  $AE1E  00        BRK
  $AE1F  00        BRK
  $AE20  00        BRK
  $AE21  00        BRK
  $AE22  CF        .db $CF
  $AE23  C6 00     DEC $00
  $AE25  C8        INY
  $AE26  C9 D3     CMP #$D3
  $AE28  00        BRK
  $AE29  CF        .db $CF
  $AE2A  D7        .db $D7
  $AE2B  CE 00 D2  DEC $D200
  $AE2E  CF        .db $CF
  $AE2F  C2        .db $C2
  $AE30  CF        .db $CF
  $AE31  D4        .db $D4
  $AE32  D3        .db $D3
  $AE33  00        BRK
  $AE34  00        BRK
  $AE35  00        BRK
  $AE36  00        BRK
  $AE37  00        BRK
  $AE38  00        BRK
  $AE39  00        BRK
  $AE3A  00        BRK
  $AE3B  00        BRK
  $AE3C  D4        .db $D4
  $AE3D  CF        .db $CF
  $AE3E  00        BRK
  $AE3F  C3        .db $C3
  $AE40  CF        .db $CF
  $AE41  D5 CE     CMP $CE,X
  $AE43  D4        .db $D4
  $AE44  C5 D2     CMP $D2
  $AE46  00        BRK
  $AE47  CD C5 C7  CMP $C7C5
  $AE4A  C1 CD     CMP ($CD,X)
  $AE4C  C1 CE     CMP ($CE,X)
  $AE4E  DC        .db $DC
  $AE4F  00        BRK
  $AE50  00        BRK
  $AE51  00        BRK
  $AE52  00        BRK
  $AE53  00        BRK
  $AE54  0F        .db $0F
  $AE55  00        BRK
  $AE56  10 20     BPL $AE78
  $AE58  30 30     BMI $AE8A
  $AE5A  30 30     BMI $AE8C
  $AE5C  30 30     BMI $AE8E
  $AE5E  30 30     BMI $AE90
  $AE60  30 30     BMI $AE92
  $AE62  30 30     BMI $AE94
  $AE64  30 30     BMI $AE96
  $AE66  30 30     BMI $AE98
  $AE68  30 30     BMI $AE9A
  $AE6A  30 30     BMI $AE9C
  $AE6C  30 30     BMI $AE9E
  $AE6E  30 30     BMI $AEA0
  $AE70  20 10 00  JSR $0010
  $AE73  0F        .db $0F
  $AE74  30 30     BMI $AEA6
  $AE76  30 20     BMI $AE98

L_AE78:
  $AE78  10 00     BPL $AE7A

L_AE7A:
  $AE7A  0F        .db $0F
  $AE7B  0C        .db $0C
  $AE7C  0B        .db $0B
  $AE7D  0A        ASL
  $AE7E  06 06     ASL $06
  $AE80  09 09     ORA #$09
  $AE82  08        PHP
  $AE83  08        PHP
  $AE84  07        .db $07
  $AE85  07        .db $07
  $AE86  06 06     ASL $06
  $AE88  06 06     ASL $06

L_AE8A:
  $AE8A  06 06     ASL $06

L_AE8C:
  $AE8C  05 05     ORA $05

L_AE8E:
  $AE8E  04        .db $04
  $AE8F  04        .db $04

L_AE90:
  $AE90  03        .db $03
  $AE91  03        .db $03

L_AE92:
  $AE92  02        .db $02
  $AE93  02        .db $02

L_AE94:
  $AE94  01 13     ORA ($13,X)

L_AE96:
  $AE96  21 47     AND ($47,X)

L_AE98:
  $AE98  A3        .db $A3
  $AE99  A7        .db $A7

L_AE9A:
  $AE9A  A5 A1     LDA $A1

L_AE9C:
  $AE9C  A1 00     LDA ($00,X)

L_AE9E:
  $AE9E  C3        .db $C3
  $AE9F  C1 D0     CMP ($D0,X)
  $AEA1  C3        .db $C3
  $AEA2  CF        .db $CF
  $AEA3  CD 00 C3  CMP $C300

L_AEA6:
  $AEA6  CF        .db $CF
  $AEA7  DC        .db $DC
  $AEA8  CC D4 C4  CPY $C4D4
  $AEAB  1F        .db $1F
  $AEAC  21 81     AND ($81,X)
  $AEAE  D4        .db $D4
  $AEAF  CD 00 C1  CMP $C100
  $AEB2  CE C4 00  DEC $00C4
  $AEB5  A3        .db $A3
  $AEB6  A7        .db $A7
  $AEB7  A5 A1     LDA $A1
  $AEB9  A5 00     LDA $00
  $AEBB  C3        .db $C3
  $AEBC  C1 D0     CMP ($D0,X)
  $AEBE  C3        .db $C3
  $AEBF  CF        .db $CF
  $AEC0  CD 00 D5  CMP $D500
  $AEC3  DC        .db $DC
  $AEC4  D3        .db $D3
  $AEC5  DC        .db $DC
  $AEC6  C1 DC     CMP ($DC,X)
  $AEC8  DD C9 CE  CMP $CEC9,X
  $AECB  C3        .db $C3
  $AECC  DC        .db $DC
  $AECD  0B        .db $0B
  $AECE  21 CB     AND ($CB,X)
  $AED0  CC C9 C3  CPY $C3C9
  $AED3  C5 CE     CMP $CE
  $AED5  D3        .db $D3
  $AED6  C5 C4     CMP $C4
  $AED8  00        BRK
  $AED9  C2        .db $C2
  $AEDA  D9 19 22  CMP $2219,Y
  $AEDD  04        .db $04
  $AEDE  CE C9 CE  DEC $CEC9
  $AEE1  D4        .db $D4
  $AEE2  C5 CE     CMP $CE
  $AEE4  C4 CF     CPY $CF
  $AEE6  00        BRK
  $AEE7  CF        .db $CF
  $AEE8  C6 00     DEC $00
  $AEEA  C1 CD     CMP ($CD,X)
  $AEEC  C5 D2     CMP $D2
  $AEEE  C9 C3     CMP #$C3
  $AEF0  C1 DC     CMP ($DC,X)
  $AEF2  00        BRK
  $AEF3  C9 CE     CMP #$CE
  $AEF5  C3        .db $C3
  $AEF6  DC        .db $DC
  $AEF7  00        BRK
  $AEF8  00        BRK
  $AEF9  0F        .db $0F
  $AEFA  35 21     AND $21,X
  $AEFC  11 0F     ORA ($0F),Y
  $AEFE  30 3C     BMI $AF3C
  $AF00  21 0F     AND ($0F,X)
  $AF02  27        .db $27
  $AF03  17        .db $17
  $AF04  07        .db $07
  $AF05  0F        .db $0F
  $AF06  30 11     BMI $AF19
  $AF08  0C        .db $0C
  $AF09  0F        .db $0F
  $AF0A  0F        .db $0F
  $AF0B  30 16     BMI $AF23
  $AF0D  0F        .db $0F
  $AF0E  0F        .db $0F
  $AF0F  30 0F     BMI $AF20
  $AF11  0F        .db $0F
  $AF12  30 30     BMI $AF44
  $AF14  30 0F     BMI $AF25
  $AF16  0F        .db $0F
  $AF17  0F        .db $0F
  $AF18  0F        .db $0F

L_AF19:
  $AF19  0F        .db $0F
  $AF1A  26 26     ROL $26
  $AF1C  27        .db $27
  $AF1D  0F        .db $0F
  $AF1E  17        .db $17
  $AF1F  28        PLP

L_AF20:
  $AF20  05 0F     ORA $0F
  $AF22  17        .db $17

L_AF23:
  $AF23  27        .db $27
  $AF24  18        CLC

L_AF25:
  $AF25  0F        .db $0F
  $AF26  19 2A 37  ORA $372A,Y
  $AF29  0F        .db $0F
  $AF2A  20 2C 11  JSR $112C
  $AF2D  0F        .db $0F
  $AF2E  20 26 36  JSR $3626
  $AF31  0F        .db $0F
  $AF32  00        BRK
  $AF33  2C 11 0F  BIT $0F11
  $AF36  16 35     ASL $35,X
  $AF38  20 25 8C  JSR $8C25
  $AF3B  09 40     ORA #$40
  $AF3D  53        .db $53
  $AF3E  54        .db $54
  $AF3F  41 52     EOR ($52,X)
  $AF41  54        .db $54
  $AF42  40        RTI
  $AF43  40        RTI

L_AF44:
  $AF44  40        RTI
  $AF45  25 CC     AND $CC
  $AF47  0A        ASL
  $AF48  40        RTI
  $AF49  50 41     BVC $AF8C
  $AF4B  53        .db $53
  $AF4C  53        .db $53
  $AF4D  57        .db $57
  $AF4E  4F        .db $4F
  $AF4F  52        .db $52
  $AF50  44        .db $44
  $AF51  40        RTI
  $AF52  25 8C     AND $8C
  $AF54  09 50     ORA #$50
  $AF56  41 53     EOR ($53,X)
  $AF58  53        .db $53
  $AF59  57        .db $57
  $AF5A  4F        .db $4F
  $AF5B  52        .db $52
  $AF5C  44        .db $44
  $AF5D  40        RTI
  $AF5E  25 CC     AND $CC
  $AF60  0A        ASL
  $AF61  45 52     EOR $52
  $AF63  52        .db $52
  $AF64  4F        .db $4F
  $AF65  52        .db $52
  $AF66  40        RTI
  $AF67  5F        .db $5F
  $AF68  40        RTI
  $AF69  40        RTI
  $AF6A  40        RTI
  $AF6B  25 8B     AND $8B
  $AF6D  08        PHP
  $AF6E  43        .db $43
  $AF6F  4F        .db $4F
  $AF70  4E 54 49  LSR $4954
  $AF73  4E 55 45  LSR $4555
  $AF76  25 CB     AND $CB
  $AF78  0C        .db $0C
  $AF79  53        .db $53
  $AF7A  54        .db $54
  $AF7B  41 47     EOR ($47,X)
  $AF7D  45 40     EOR $40
  $AF7F  53        .db $53
  $AF80  45 4C     EOR $4C
  $AF82  45 43     EOR $43
  $AF84  54        .db $54
  $AF85  26 0B     ROL $0B
  $AF87  09 50     ORA #$50
  $AF89  41 53     EOR ($53,X)
  $AF8B  53        .db $53

L_AF8C:
  $AF8C  57        .db $57
  $AF8D  4F        .db $4F
  $AF8E  52        .db $52
  $AF8F  44        .db $44

L_AF90:
  $AF90  40        RTI
  $AF91  22        .db $22
  $AF92  66 0E     ROR $0E

L_AF94:
  $AF94  50 52     BVC $AFE8
  $AF96  45 53     EOR $53
  $AF98  53        .db $53
  $AF99  40        RTI
  $AF9A  41 94     EOR ($94,X)
  $AF9C  42        .db $42
  $AF9D  55 54     EOR $54,X
  $AF9F  54        .db $54
  $AFA0  4F        .db $4F
  $AFA1  4E 26 CA  LSR $CA26
  $AFA4  09 50     ORA #$50
  $AFA6  41 53     EOR ($53,X)
  $AFA8  53        .db $53
  $AFA9  57        .db $57
  $AFAA  4F        .db $4F
  $AFAB  52        .db $52

L_AFAC:
  $AFAC  44        .db $44
  $AFAD  40        RTI
  $AFAE  27        .db $27
  $AFAF  0A        ASL
  $AFB0  0C        .db $0C
  $AFB1  53        .db $53
  $AFB2  54        .db $54
  $AFB3  41 47     EOR ($47,X)
  $AFB5  45 40     EOR $40
  $AFB7  53        .db $53
  $AFB8  45 4C     EOR $4C
  $AFBA  45 43     EOR $43
  $AFBC  54        .db $54
  $AFBD  00        BRK
  $AFBE  0C        .db $0C
  $AFBF  19 25 32  ORA $3225,Y
  $AFC2  3D 4C 58  AND $584C,X
  $AFC5  69 75     ADC #$75
  $AFC7  F8        SED
  $AFC8  22        .db $22
  $AFC9  00        BRK
  $AFCA  58        CLI
  $AFCB  30 25     BMI $AFF2
  $AFCD  00        BRK
  $AFCE  44        .db $44
  $AFCF  30 26     BMI $AFF7
  $AFD1  00        BRK
  $AFD2  54        .db $54
  $AFD3  30 27     BMI $AFFC
  $AFD5  00        BRK
  $AFD6  64        .db $64
  $AFD7  30 28     BMI $B001
  $AFD9  00        BRK
  $AFDA  74        .db $74
  $AFDB  30 29     BMI $B006
  $AFDD  00        BRK
  $AFDE  84 44     STY $44
  $AFE0  E1 02     SBC ($02,X)
  $AFE2  30 54     BMI $B038
  $AFE4  E2        .db $E2
  $AFE5  02        .db $02
  $AFE6  30 64     BMI $B04C

L_AFE8:
  $AFE8  E3        .db $E3
  $AFE9  02        .db $02
  $AFEA  30 74     BMI $B060
  $AFEC  E4 02     CPX $02
  $AFEE  30 84     BMI $AF74
  $AFF0  E5 02     SBC $02

L_AFF2:
  $AFF2  30 A0     BMI $AF94
  $AFF4  3F        .db $3F
  $AFF5  00        BRK
  $AFF6  D0 B4     BNE $AFAC
  $AFF8  2D 01 D0  AND $D001
  $AFFB  40        RTI

L_AFFC:
  $AFFC  40        RTI
  $AFFD  40        RTI
  $AFFE  40        RTI
  $AFFF  40        RTI
  $B000  50 50     BVC $B052
  $B002  50 50     BVC $B054
  $B004  50 60     BVC $B066

L_B006:
  $B006  60        RTS
  $B007  60        RTS
  $B008  60        RTS
  $B009  60        RTS
  $B00A  70 70     BVS $B07C
  $B00C  70 70     BVS $B07E
  $B00E  70 80     BVS $AF90
  $B010  80        .db $80
  $B011  80        .db $80
  $B012  80        .db $80
  $B013  80        .db $80
  $B014  41 51     EOR ($51,X)
  $B016  61 71     ADC ($71,X)
  $B018  81 41     STA ($41,X)
  $B01A  51 61     EOR ($61),Y
  $B01C  71 81     ADC ($81),Y
  $B01E  41 51     EOR ($51,X)
  $B020  61 71     ADC ($71,X)
  $B022  81 41     STA ($41,X)
  $B024  51 61     EOR ($61),Y
  $B026  71 81     ADC ($81),Y
  $B028  41 51     EOR ($51,X)
  $B02A  61 71     ADC ($71,X)
  $B02C  81 01     STA ($01,X)
  $B02E  02        .db $02
  $B02F  03        .db $03
  $B030  04        .db $04
  $B031  00        BRK
  $B032  06 07     ASL $07
  $B034  08        PHP
  $B035  09 05     ORA #$05
  $B037  0B        .db $0B

L_B038:
  $B038  0C        .db $0C
  $B039  0D 0E 0A  ORA $0A0E
  $B03C  10 11     BPL $B04F
  $B03E  12        .db $12
  $B03F  13        .db $13
  $B040  0F        .db $0F
  $B041  15 16     ORA $16,X
  $B043  17        .db $17
  $B044  18        CLC
  $B045  14        .db $14
  $B046  04        .db $04
  $B047  00        BRK
  $B048  01 02     ORA ($02,X)
  $B04A  03        .db $03
  $B04B  09 05     ORA #$05
  $B04D  06 07     ASL $07

L_B04F:
  $B04F  08        PHP
  $B050  0E 0A 0B  ASL $0B0A
  $B053  0C        .db $0C

L_B054:
  $B054  0D 13 0F  ORA $0F13
  $B057  10 11     BPL $B06A
  $B059  12        .db $12
  $B05A  18        CLC
  $B05B  14        .db $14
  $B05C  15 16     ORA $16,X
  $B05E  17        .db $17
  $B05F  14        .db $14

L_B060:
  $B060  15 16     ORA $16,X
  $B062  17        .db $17
  $B063  18        CLC
  $B064  00        BRK
  $B065  01 02     ORA ($02,X)
  $B067  03        .db $03
  $B068  04        .db $04
  $B069  05 06     ORA $06
  $B06B  07        .db $07
  $B06C  08        PHP
  $B06D  09 0A     ORA #$0A
  $B06F  0B        .db $0B
  $B070  0C        .db $0C
  $B071  0D 0E 0F  ORA $0F0E
  $B074  10 11     BPL $B087
  $B076  12        .db $12
  $B077  13        .db $13
  $B078  05 06     ORA $06

L_B07A:
  $B07A  07        .db $07
  $B07B  08        PHP

L_B07C:
  $B07C  09 0A     ORA #$0A

L_B07E:
  $B07E  0B        .db $0B
  $B07F  0C        .db $0C
  $B080  0D 0E 0F  ORA $0F0E
  $B083  10 11     BPL $B096
  $B085  12        .db $12
  $B086  13        .db $13

L_B087:
  $B087  14        .db $14
  $B088  15 16     ORA $16,X
  $B08A  17        .db $17
  $B08B  18        CLC
  $B08C  00        BRK
  $B08D  01 02     ORA ($02,X)
  $B08F  03        .db $03
  $B090  04        .db $04
  $B091  0F        .db $0F
  $B092  00        BRK
  $B093  10 20     BPL $B0B5
  $B095  30 20     BMI $B0B7
  $B097  10 00     BPL $B099

L_B099:
  $B099  00        BRK
  $B09A  3E 01 00  ROL $0001,X
  $B09D  00        BRK
  $B09E  3E 41 08  ROL $0841,X
  $B0A1  08        PHP
  $B0A2  3E 81 00  ROL $0081,X
  $B0A5  08        PHP
  $B0A6  3E C1 08  ROL $08C1,X
  $B0A9  00        BRK
  $B0AA  01 00     ORA ($00,X)
  $B0AC  10 04     BPL $B0B2
  $B0AE  20 00 08  JSR $0800
  $B0B1  10 80     BPL $B033
  $B0B3  08        PHP
  $B0B4  02        .db $02

L_B0B5:
  $B0B5  04        .db $04
  $B0B6  00        BRK

L_B0B7:
  $B0B7  01 40     ORA ($40,X)
  $B0B9  80        .db $80
  $B0BA  02        .db $02
  $B0BB  20 40 00  JSR $0040
  $B0BE  00        BRK
  $B0BF  00        BRK
  $B0C0  00        BRK
  $B0C1  01 00     ORA ($00,X)
  $B0C3  00        BRK
  $B0C4  01 01     ORA ($01,X)
  $B0C6  00        BRK
  $B0C7  00        BRK
  $B0C8  01 00     ORA ($00,X)
  $B0CA  00        BRK
  $B0CB  01 01     ORA ($01,X)
  $B0CD  01 00     ORA ($00,X)
  $B0CF  01 00     ORA ($00,X)
  $B0D1  60        RTS
  $B0D2  2F        .db $2F
  $B0D3  00        BRK
  $B0D4  60        RTS
  $B0D5  70 1F     BVS $B0F6
  $B0D7  00        BRK
  $B0D8  60        RTS
  $B0D9  60        RTS
  $B0DA  1B        .db $1B
  $B0DB  00        BRK
  $B0DC  80        .db $80
  $B0DD  70 19     BVS $B0F8
  $B0DF  00        BRK
  $B0E0  70 60     BVS $B142
  $B0E2  1D 00 70  ORA $7000,X
  $B0E5  60        RTS
  $B0E6  1C        .db $1C
  $B0E7  00        BRK
  $B0E8  90 70     BCC $B15A
  $B0EA  1A        .db $1A
  $B0EB  00        BRK
  $B0EC  90 70     BCC $B15E
  $B0EE  1E 00 80  ASL $8000,X
  $B0F1  80        .db $80
  $B0F2  20 00 60  JSR $6000
  $B0F5  80        .db $80

L_B0F6:
  $B0F6  25 00     AND $00

L_B0F8:
  $B0F8  70 80     BVS $B07A
  $B0FA  26 00     ROL $00
  $B0FC  80        .db $80
  $B0FD  80        .db $80
  $B0FE  27        .db $27
  $B0FF  00        BRK
  $B100  90 A9     BCC $B0AB
  $B102  03        .db $03
  $B103  20 44 C6  JSR $C644
  $B106  A5 2A     LDA $2A
  $B108  48        PHA
  $B109  A9 05     LDA #$05
  $B10B  85 2A     STA $2A
  $B10D  A9 00     LDA #$00
  $B10F  85 08     STA $08
  $B111  A9 8E     LDA #$8E
  $B113  85 09     STA $09
  $B115  20 7E A8  JSR $A87E
  $B118  A9 40     LDA #$40
  $B11A  85 08     STA $08
  $B11C  A9 8E     LDA #$8E
  $B11E  20 7E A8  JSR $A87E
  $B121  A9 21     LDA #$21
  $B123  8D 06 20  STA $2006
  $B126  A9 CC     LDA #$CC
  $B128  8D 06 20  STA $2006
  $B12B  A2 00     LDX #$00

L_B12D:
  $B12D  BD E0 B1  LDA $B1E0,X
  $B130  8D 07 20  STA $2007
  $B133  E8        INX
  $B134  E0 09     CPX #$09
  $B136  D0 F5     BNE $B12D
  $B138  A9 0F     LDA #$0F
  $B13A  20 51 C0  JSR $C051
  $B13D  20 7E 84  JSR $847E
  $B140  A9 00     LDA #$00

L_B142:
  $B142  20 B2 A9  JSR $A9B2
  $B145  A9 04     LDA #$04
  $B147  85 FE     STA $FE
  $B149  A9 7D     LDA #$7D
  $B14B  85 FD     STA $FD

L_B14D:
  $B14D  A6 FE     LDX $FE
  $B14F  E0 07     CPX #$07
  $B151  F0 05     BEQ $B158
  $B153  20 8B A9  JSR $A98B
  $B156  E6 FE     INC $FE

L_B158:
  $B158  20 AB C0  JSR $C0AB
  $B15B  C6 FD     DEC $FD
  $B15D  D0 EE     BNE $B14D
  $B15F  20 98 A8  JSR $A898
  $B162  20 CC A9  JSR $A9CC
  $B165  A9 80     LDA #$80
  $B167  85 FD     STA $FD
  $B169  A9 8E     LDA #$8E
  $B16B  85 FE     STA $FE
  $B16D  20 EA A9  JSR $A9EA

L_B170:
  $B170  A9 10     LDA #$10
  $B172  20 51 C0  JSR $C051

L_B175:
  $B175  20 D4 A8  JSR $A8D4
  $B178  A9 00     LDA #$00
  $B17A  85 FD     STA $FD

L_B17C:
  $B17C  A5 27     LDA $27
  $B17E  29 3C     AND #$3C
  $B180  F0 25     BEQ $B1A7
  $B182  29 08     AND #$08
  $B184  D0 40     BNE $B1C6
  $B186  A9 2F     LDA #$2F
  $B188  20 51 C0  JSR $C051
  $B18B  A5 27     LDA $27
  $B18D  29 24     AND #$24
  $B18F  D0 0A     BNE $B19B
  $B191  C6 FD     DEC $FD
  $B193  10 12     BPL $B1A7
  $B195  A9 02     LDA #$02
  $B197  85 FD     STA $FD
  $B199  D0 0C     BNE $B1A7

L_B19B:
  $B19B  E6 FD     INC $FD
  $B19D  A5 FD     LDA $FD
  $B19F  C9 03     CMP #$03
  $B1A1  D0 04     BNE $B1A7
  $B1A3  A9 00     LDA #$00
  $B1A5  85 FD     STA $FD

L_B1A7:
  $B1A7  A2 03     LDX #$03

L_B1A9:
  $B1A9  BD E9 B1  LDA $B1E9,X
  $B1AC  9D 00 02  STA $0200,X
  $B1AF  CA        DEX
  $B1B0  10 F7     BPL $B1A9
  $B1B2  A5 1C     LDA $1C
  $B1B4  29 08     AND #$08
  $B1B6  D0 08     BNE $B1C0
  $B1B8  A6 FD     LDX $FD
  $B1BA  BD ED B1  LDA $B1ED,X
  $B1BD  8D 00 02  STA $0200

L_B1C0:
  $B1C0  20 AB C0  JSR $C0AB
  $B1C3  4C 7C B1  JMP $B17C

L_B1C6:
  $B1C6  A5 FD     LDA $FD
  $B1C8  C9 02     CMP #$02
  $B1CA  F0 03     BEQ $B1CF
  $B1CC  4C D5 B1  JMP $B1D5

L_B1CF:
  $B1CF  20 24 B2  JSR $B224
  $B1D2  4C 75 B1  JMP $B175

L_B1D5:
  $B1D5  20 2D A5  JSR $A52D
  $B1D8  68        PLA
  $B1D9  85 2A     STA $2A
  $B1DB  A9 03     LDA #$03
  $B1DD  85 A8     STA $A8
  $B1DF  60        RTS
  $B1E0  47        .db $47
  $B1E1  41 4D     EOR ($4D,X)
  $B1E3  45 40     EOR $40
  $B1E5  4F        .db $4F
  $B1E6  56 45     LSR $45,X
  $B1E8  52        .db $52
  $B1E9  F8        SED
  $B1EA  22        .db $22
  $B1EB  00        BRK
  $B1EC  48        PHA
  $B1ED  60        RTS
  $B1EE  70 80     BVS $B170
  $B1F0  98        TYA
  $B1F1  22        .db $22
  $B1F2  00        BRK
  $B1F3  28        PLP
  $B1F4  68        PLA
  $B1F5  2F        .db $2F
  $B1F6  00        BRK
  $B1F7  C8        INY
  $B1F8  88        DEY
  $B1F9  1F        .db $1F
  $B1FA  00        BRK
  $B1FB  C8        INY
  $B1FC  78        SEI
  $B1FD  1B        .db $1B
  $B1FE  00        BRK
  $B1FF  C8        INY
  $B200  88        DEY
  $B201  19 00 D8  ORA $D800,Y
  $B204  68        PLA
  $B205  1D 00 D8  ORA $D800,X
  $B208  78        SEI
  $B209  1C        .db $1C
  $B20A  00        BRK
  $B20B  D8        CLD
  $B20C  98        TYA
  $B20D  1A        .db $1A
  $B20E  00        BRK
  $B20F  D8        CLD
  $B210  98        TYA
  $B211  1E 00 C8  ASL $C800,X
  $B214  A8        TAY
  $B215  20 00 C8  JSR $C800
  $B218  A8        TAY
  $B219  25 00     AND $00
  $B21B  D8        CLD
  $B21C  B8        CLV
  $B21D  26 00     ROL $00
  $B21F  C8        INY
  $B220  B8        CLV
  $B221  27        .db $27
  $B222  00        BRK
  $B223  D8        CLD

L_B224:
  $B224  20 98 A8  JSR $A898
  $B227  20 73 84  JSR $8473
  $B22A  20 CC A9  JSR $A9CC
  $B22D  A9 00     LDA #$00
  $B22F  A2 18     LDX #$18

L_B231:
  $B231  9D 20 04  STA $0420,X
  $B234  CA        DEX
  $B235  10 FA     BPL $B231
  $B237  A5 9A     LDA $9A
  $B239  85 00     STA $00
  $B23B  49 FF     EOR #$FF
  $B23D  85 01     STA $01
  $B23F  18        CLC
  $B240  A5 A7     LDA $A7
  $B242  AA        TAX
  $B243  69 05     ADC #$05
  $B245  85 03     STA $03
  $B247  FE 20 04  INC $0420,X
  $B24A  A2 00     LDX #$00

L_B24C:
  $B24C  BC BD B0  LDY $B0BD,X
  $B24F  B9 00 00  LDA $0000,Y
  $B252  A4 03     LDY $03
  $B254  3D A9 B0  AND $B0A9,X
  $B257  F0 02     BEQ $B25B
  $B259  A9 01     LDA #$01

L_B25B:
  $B25B  99 20 04  STA $0420,Y
  $B25E  C8        INY
  $B25F  C0 19     CPY #$19
  $B261  D0 02     BNE $B265
  $B263  A0 05     LDY #$05

L_B265:
  $B265  84 03     STY $03
  $B267  E8        INX
  $B268  E0 14     CPX #$14
  $B26A  D0 E0     BNE $B24C
  $B26C  20 25 AA  JSR $AA25
  $B26F  20 27 A9  JSR $A927
  $B272  A9 F8     LDA #$F8
  $B274  8D 30 02  STA $0230
  $B277  8D 34 02  STA $0234
  $B27A  8D 38 02  STA $0238
  $B27D  8D 3C 02  STA $023C
  $B280  A2 27     LDX #$27

L_B282:
  $B282  BD CB AF  LDA $AFCB,X
  $B285  9D 00 02  STA $0200,X
  $B288  CA        DEX
  $B289  10 F7     BPL $B282
  $B28B  A2 03     LDX #$03

L_B28D:
  $B28D  BD F0 B1  LDA $B1F0,X
  $B290  9D 28 02  STA $0228,X
  $B293  CA        DEX
  $B294  10 F7     BPL $B28D
  $B296  A5 9A     LDA $9A
  $B298  0A        ASL
  $B299  09 01     ORA #$01
  $B29B  85 00     STA $00
  $B29D  A5 9B     LDA $9B
  $B29F  2A        ROL
  $B2A0  85 01     STA $01
  $B2A2  A2 00     LDX #$00
  $B2A4  A9 0C     LDA #$0C
  $B2A6  85 02     STA $02

L_B2A8:
  $B2A8  46 01     LSR $01
  $B2AA  66 00     ROR $00
  $B2AC  90 0E     BCC $B2BC
  $B2AE  A0 04     LDY #$04

L_B2B0:
  $B2B0  BD F4 B1  LDA $B1F4,X
  $B2B3  9D A4 02  STA $02A4,X
  $B2B6  E8        INX
  $B2B7  88        DEY
  $B2B8  D0 F6     BNE $B2B0
  $B2BA  F0 04     BEQ $B2C0

L_B2BC:
  $B2BC  E8        INX
  $B2BD  E8        INX
  $B2BE  E8        INX
  $B2BF  E8        INX

L_B2C0:
  $B2C0  C6 02     DEC $02
  $B2C2  D0 E4     BNE $B2A8
  $B2C4  A2 07     LDX #$07
  $B2C6  20 8B A9  JSR $A98B
  $B2C9  20 D4 A8  JSR $A8D4

L_B2CC:
  $B2CC  A2 F8     LDX #$F8
  $B2CE  A5 1C     LDA $1C
  $B2D0  29 08     AND #$08
  $B2D2  D0 02     BNE $B2D6
  $B2D4  A2 98     LDX #$98

L_B2D6:
  $B2D6  8E 28 02  STX $0228
  $B2D9  20 AB C0  JSR $C0AB
  $B2DC  A5 27     LDA $27
  $B2DE  29 01     AND #$01
  $B2E0  F0 EA     BEQ $B2CC
  $B2E2  A9 42     LDA #$42
  $B2E4  20 51 C0  JSR $C051
  $B2E7  20 98 A8  JSR $A898
  $B2EA  20 73 84  JSR $8473
  $B2ED  20 09 AA  JSR $AA09
  $B2F0  60        RTS
  $B2F1  FF        .db $FF
  $B2F2  FF        .db $FF
  $B2F3  FF        .db $FF
  $B2F4  55 55     EOR $55,X
  $B2F6  55 55     EOR $55,X
  $B2F8  55 FF     EOR $FF,X
  $B2FA  FF        .db $FF
  $B2FB  FF        .db $FF
  $B2FC  55 55     EOR $55,X
  $B2FE  55 55     EOR $55,X
  $B300  55 FF     EOR $FF,X
  $B302  FF        .db $FF
  $B303  FF        .db $FF
  $B304  55 55     EOR $55,X
  $B306  55 55     EOR $55,X
  $B308  55 FF     EOR $FF,X
  $B30A  FF        .db $FF
  $B30B  F7        .db $F7
  $B30C  50 50     BVC $B35E
  $B30E  55 55     EOR $55,X
  $B310  55 F5     EOR $F5,X
  $B312  F5 55     SBC $55,X
  $B314  04        .db $04
  $B315  01 55     ORA ($55,X)
  $B317  55 55     EOR $55,X
  $B319  55 A6     EOR $A6,X
  $B31B  AA        TAX
  $B31C  AA        TAX
  $B31D  AA        TAX
  $B31E  AA        TAX
  $B31F  A9 55     LDA #$55
  $B321  55 55     EOR $55,X
  $B323  A4 A0     LDY $A0
  $B325  A0 A1     LDY #$A1
  $B327  55 55     EOR $55,X
  $B329  55 55     EOR $55,X
  $B32B  55 55     EOR $55,X
  $B32D  55 55     EOR $55,X
  $B32F  55 55     EOR $55,X
  $B331  00        BRK
  $B332  00        BRK
  $B333  00        BRK
  $B334  00        BRK
  $B335  00        BRK
  $B336  00        BRK
  $B337  00        BRK
  $B338  00        BRK
  $B339  00        BRK
  $B33A  00        BRK
  $B33B  00        BRK
  $B33C  00        BRK
  $B33D  00        BRK
  $B33E  00        BRK
  $B33F  00        BRK
  $B340  00        BRK
  $B341  00        BRK
  $B342  00        BRK
  $B343  00        BRK
  $B344  00        BRK
  $B345  E0 E2     CPX #$E2
  $B347  E4 E6     CPX $E6
  $B349  E8        INX
  $B34A  EA        NOP
  $B34B  E4 E6     CPX $E6
  $B34D  E8        INX
  $B34E  EA        NOP
  $B34F  E4 E6     CPX $E6
  $B351  00        BRK
  $B352  00        BRK
  $B353  00        BRK
  $B354  00        BRK
  $B355  00        BRK
  $B356  00        BRK
  $B357  00        BRK
  $B358  00        BRK
  $B359  00        BRK
  $B35A  00        BRK
  $B35B  00        BRK
  $B35C  00        BRK
  $B35D  00        BRK

L_B35E:
  $B35E  00        BRK
  $B35F  00        BRK
  $B360  00        BRK
  $B361  00        BRK
  $B362  00        BRK
  $B363  00        BRK
  $B364  00        BRK
  $B365  E0 E2     CPX #$E2
  $B367  E4 E6     CPX $E6
  $B369  E8        INX
  $B36A  EA        NOP
  $B36B  E4 E6     CPX $E6
  $B36D  E8        INX
  $B36E  EA        NOP
  $B36F  E4 E6     CPX $E6
  $B371  00        BRK
  $B372  00        BRK
  $B373  00        BRK
  $B374  00        BRK
  $B375  00        BRK
  $B376  00        BRK
  $B377  00        BRK
  $B378  00        BRK
  $B379  00        BRK
  $B37A  00        BRK
  $B37B  00        BRK
  $B37C  00        BRK
  $B37D  00        BRK
  $B37E  00        BRK
  $B37F  00        BRK
  $B380  00        BRK
  $B381  00        BRK
  $B382  00        BRK
  $B383  00        BRK
  $B384  00        BRK
  $B385  E0 E2     CPX #$E2
  $B387  E4 E6     CPX $E6
  $B389  E8        INX
  $B38A  EA        NOP
  $B38B  E4 E6     CPX $E6
  $B38D  E8        INX
  $B38E  EA        NOP
  $B38F  E4 E6     CPX $E6
  $B391  00        BRK
  $B392  00        BRK
  $B393  00        BRK
  $B394  00        BRK
  $B395  00        BRK
  $B396  00        BRK
  $B397  00        BRK
  $B398  00        BRK
  $B399  00        BRK
  $B39A  00        BRK
  $B39B  00        BRK
  $B39C  00        BRK
  $B39D  00        BRK
  $B39E  00        BRK
  $B39F  00        BRK
  $B3A0  00        BRK
  $B3A1  00        BRK
  $B3A2  00        BRK
  $B3A3  00        BRK
  $B3A4  00        BRK
  $B3A5  E0 E2     CPX #$E2
  $B3A7  E4 E6     CPX $E6
  $B3A9  E8        INX
  $B3AA  EA        NOP

L_B3AB:
  $B3AB  E4 E6     CPX $E6
  $B3AD  E8        INX
  $B3AE  EA        NOP
  $B3AF  E4 E6     CPX $E6
  $B3B1  00        BRK
  $B3B2  00        BRK
  $B3B3  00        BRK
  $B3B4  00        BRK
  $B3B5  00        BRK
  $B3B6  00        BRK
  $B3B7  00        BRK
  $B3B8  00        BRK
  $B3B9  00        BRK
  $B3BA  00        BRK
  $B3BB  00        BRK
  $B3BC  00        BRK
  $B3BD  00        BRK
  $B3BE  00        BRK
  $B3BF  00        BRK
  $B3C0  00        BRK
  $B3C1  00        BRK
  $B3C2  00        BRK
  $B3C3  00        BRK
  $B3C4  00        BRK
  $B3C5  E0 E2     CPX #$E2
  $B3C7  E4 E6     CPX $E6
  $B3C9  E8        INX
  $B3CA  EA        NOP
  $B3CB  E4 E6     CPX $E6
  $B3CD  E8        INX
  $B3CE  EA        NOP
  $B3CF  E4 E6     CPX $E6
  $B3D1  00        BRK
  $B3D2  00        BRK
  $B3D3  00        BRK
  $B3D4  00        BRK
  $B3D5  00        BRK
  $B3D6  00        BRK
  $B3D7  D0 D2     BNE $B3AB
  $B3D9  C5 D3     CMP $D3
  $B3DB  D3        .db $D3
  $B3DC  00        BRK
  $B3DD  D3        .db $D3
  $B3DE  D4        .db $D4
  $B3DF  C1 D2     CMP ($D2,X)
  $B3E1  D4        .db $D4
  $B3E2  00        BRK
  $B3E3  00        BRK
  $B3E4  00        BRK
  $B3E5  E0 E2     CPX #$E2
  $B3E7  E4 E6     CPX $E6
  $B3E9  E8        INX
  $B3EA  EA        NOP
  $B3EB  E4 E6     CPX $E6
  $B3ED  E8        INX
  $B3EE  EA        NOP
  $B3EF  E4 E6     CPX $E6
  $B3F1  00        BRK
  $B3F2  00        BRK
  $B3F3  00        BRK
  $B3F4  00        BRK
  $B3F5  00        BRK
  $B3F6  00        BRK
  $B3F7  00        BRK
  $B3F8  00        BRK
  $B3F9  00        BRK
  $B3FA  00        BRK
  $B3FB  00        BRK
  $B3FC  00        BRK
  $B3FD  00        BRK
  $B3FE  00        BRK
  $B3FF  00        BRK
  $B400  00        BRK
  $B401  00        BRK
  $B402  00        BRK
  $B403  00        BRK
  $B404  00        BRK
  $B405  E0 E2     CPX #$E2
  $B407  E4 E6     CPX $E6
  $B409  E8        INX
  $B40A  EA        NOP
  $B40B  E4 E6     CPX $E6
  $B40D  E8        INX
  $B40E  EA        NOP
  $B40F  E4 E6     CPX $E6
  $B411  00        BRK
  $B412  00        BRK
  $B413  00        BRK
  $B414  00        BRK
  $B415  00        BRK
  $B416  00        BRK
  $B417  00        BRK
  $B418  00        BRK
  $B419  00        BRK
  $B41A  00        BRK
  $B41B  00        BRK
  $B41C  00        BRK
  $B41D  00        BRK
  $B41E  00        BRK
  $B41F  00        BRK
  $B420  00        BRK
  $B421  00        BRK
  $B422  00        BRK
  $B423  00        BRK
  $B424  00        BRK
  $B425  E0 E2     CPX #$E2
  $B427  E4 E6     CPX $E6
  $B429  E8        INX
  $B42A  EA        NOP
  $B42B  E4 E6     CPX $E6
  $B42D  E8        INX
  $B42E  EA        NOP
  $B42F  E4 E6     CPX $E6
  $B431  00        BRK
  $B432  00        BRK
  $B433  00        BRK
  $B434  00        BRK
  $B435  00        BRK
  $B436  00        BRK
  $B437  00        BRK
  $B438  00        BRK
  $B439  C4 C9     CPY $C9
  $B43B  C6 C6     DEC $C6
  $B43D  C9 C3     CMP #$C3
  $B43F  D5 CC     CMP $CC,X
  $B441  D4        .db $D4
  $B442  00        BRK
  $B443  00        BRK
  $B444  00        BRK
  $B445  E0 E2     CPX #$E2
  $B447  E4 E6     CPX $E6
  $B449  E8        INX
  $B44A  EA        NOP
  $B44B  E4 E6     CPX $E6
  $B44D  E8        INX
  $B44E  EA        NOP
  $B44F  E4 E6     CPX $E6
  $B451  00        BRK
  $B452  00        BRK
  $B453  00        BRK
  $B454  00        BRK
  $B455  00        BRK
  $B456  00        BRK
  $B457  00        BRK
  $B458  00        BRK
  $B459  00        BRK
  $B45A  00        BRK
  $B45B  00        BRK
  $B45C  00        BRK
  $B45D  00        BRK
  $B45E  00        BRK
  $B45F  00        BRK
  $B460  00        BRK
  $B461  00        BRK
  $B462  00        BRK
  $B463  00        BRK
  $B464  00        BRK
  $B465  E0 E2     CPX #$E2
  $B467  E4 E6     CPX $E6
  $B469  E8        INX
  $B46A  EA        NOP
  $B46B  E4 E6     CPX $E6
  $B46D  E8        INX
  $B46E  EA        NOP
  $B46F  E4 E6     CPX $E6
  $B471  00        BRK
  $B472  00        BRK
  $B473  00        BRK
  $B474  00        BRK
  $B475  00        BRK
  $B476  00        BRK
  $B477  00        BRK
  $B478  00        BRK
  $B479  CE CF D2  DEC $D2CF
  $B47C  CD C1 CC  CMP $CCC1
  $B47F  00        BRK
  $B480  00        BRK
  $B481  00        BRK
  $B482  00        BRK
  $B483  00        BRK
  $B484  00        BRK
  $B485  E0 E2     CPX #$E2
  $B487  ED ED ED  SBC $EDED
  $B48A  ED ED ED  SBC $EDED
  $B48D  ED ED ED  SBC $EDED
  $B490  ED 00 00  SBC $0000
  $B493  00        BRK
  $B494  00        BRK
  $B495  00        BRK
  $B496  00        BRK
  $B497  00        BRK
  $B498  00        BRK
  $B499  00        BRK
  $B49A  00        BRK
  $B49B  00        BRK
  $B49C  00        BRK
  $B49D  00        BRK
  $B49E  00        BRK
  $B49F  00        BRK
  $B4A0  00        BRK
  $B4A1  00        BRK
  $B4A2  00        BRK
  $B4A3  00        BRK
  $B4A4  00        BRK
  $B4A5  E0 E2     CPX #$E2
  $B4A7  EC EC EC  CPX $ECEC
  $B4AA  EC EC EC  CPX $ECEC
  $B4AD  EC EC EC  CPX $ECEC
  $B4B0  EC 00 00  CPX $0000
  $B4B3  00        BRK
  $B4B4  00        BRK
  $B4B5  00        BRK
  $B4B6  00        BRK
  $B4B7  00        BRK
  $B4B8  00        BRK
  $B4B9  00        BRK
  $B4BA  00        BRK
  $B4BB  00        BRK
  $B4BC  00        BRK
  $B4BD  00        BRK
  $B4BE  00        BRK
  $B4BF  00        BRK
  $B4C0  00        BRK
  $B4C1  00        BRK
  $B4C2  00        BRK
  $B4C3  00        BRK
  $B4C4  00        BRK
  $B4C5  EE EF 00  INC $00EF
  $B4C8  00        BRK
  $B4C9  F1 F3     SBC ($F3),Y
  $B4CB  F3        .db $F3
  $B4CC  F3        .db $F3
  $B4CD  F5 F7     SBC $F7,X
  $B4CF  F3        .db $F3
  $B4D0  F3        .db $F3
  $B4D1  00        BRK

L_B4D2:
  $B4D2  00        BRK
  $B4D3  00        BRK
  $B4D4  00        BRK
  $B4D5  00        BRK
  $B4D6  00        BRK
  $B4D7  00        BRK
  $B4D8  00        BRK
  $B4D9  00        BRK
  $B4DA  00        BRK
  $B4DB  00        BRK
  $B4DC  00        BRK
  $B4DD  00        BRK
  $B4DE  BA        TSX
  $B4DF  BB        .db $BB
  $B4E0  BB        .db $BB
  $B4E1  BB        .db $BB
  $B4E2  BB        .db $BB
  $B4E3  BC 00 00  LDY $0000,X
  $B4E6  00        BRK
  $B4E7  00        BRK
  $B4E8  00        BRK
  $B4E9  F1 F3     SBC ($F3),Y
  $B4EB  F3        .db $F3
  $B4EC  F3        .db $F3
  $B4ED  F4        .db $F4
  $B4EE  F6 F3     INC $F3,X
  $B4F0  F3        .db $F3
  $B4F1  00        BRK
  $B4F2  00        BRK
  $B4F3  00        BRK
  $B4F4  00        BRK
  $B4F5  00        BRK
  $B4F6  00        BRK
  $B4F7  00        BRK
  $B4F8  00        BRK
  $B4F9  00        BRK
  $B4FA  00        BRK
  $B4FB  00        BRK
  $B4FC  00        BRK
  $B4FD  00        BRK
  $B4FE  B4 B5     LDY $B5,X
  $B500  B6 B7     LDX $B7,Y
  $B502  B8        CLV
  $B503  B9 00 00  LDA $0000,Y
  $B506  00        BRK
  $B507  00        BRK
  $B508  00        BRK
  $B509  F1 F3     SBC ($F3),Y
  $B50B  F3        .db $F3
  $B50C  F3        .db $F3
  $B50D  F3        .db $F3
  $B50E  F3        .db $F3
  $B50F  F3        .db $F3
  $B510  F3        .db $F3
  $B511  00        BRK
  $B512  00        BRK
  $B513  00        BRK
  $B514  00        BRK
  $B515  00        BRK
  $B516  00        BRK
  $B517  00        BRK
  $B518  00        BRK
  $B519  00        BRK
  $B51A  00        BRK
  $B51B  00        BRK
  $B51C  00        BRK

L_B51D:
  $B51D  00        BRK
  $B51E  00        BRK
  $B51F  B0 B1     BCS $B4D2
  $B521  B2        .db $B2
  $B522  B3        .db $B3
  $B523  00        BRK
  $B524  00        BRK
  $B525  00        BRK
  $B526  00        BRK
  $B527  00        BRK
  $B528  00        BRK
  $B529  F0 F2     BEQ $B51D
  $B52B  F2        .db $F2
  $B52C  F2        .db $F2
  $B52D  F2        .db $F2
  $B52E  F2        .db $F2
  $B52F  F2        .db $F2
  $B530  F2        .db $F2
  $B531  00        BRK
  $B532  00        BRK
  $B533  00        BRK
  $B534  00        BRK
  $B535  00        BRK
  $B536  00        BRK
  $B537  00        BRK
  $B538  00        BRK
  $B539  00        BRK
  $B53A  00        BRK
  $B53B  00        BRK
  $B53C  00        BRK
  $B53D  00        BRK
  $B53E  00        BRK
  $B53F  AC AD AE  LDY $AEAD
  $B542  AF        .db $AF
  $B543  00        BRK
  $B544  00        BRK
  $B545  00        BRK
  $B546  00        BRK
  $B547  00        BRK
  $B548  00        BRK
  $B549  00        BRK
  $B54A  00        BRK
  $B54B  00        BRK
  $B54C  00        BRK
  $B54D  00        BRK
  $B54E  00        BRK
  $B54F  00        BRK
  $B550  00        BRK
  $B551  00        BRK
  $B552  00        BRK
  $B553  00        BRK
  $B554  00        BRK
  $B555  00        BRK
  $B556  00        BRK
  $B557  00        BRK
  $B558  00        BRK
  $B559  00        BRK
  $B55A  00        BRK
  $B55B  00        BRK
  $B55C  00        BRK
  $B55D  00        BRK
  $B55E  00        BRK
  $B55F  00        BRK
  $B560  00        BRK
  $B561  00        BRK
  $B562  00        BRK
  $B563  00        BRK
  $B564  00        BRK
  $B565  00        BRK
  $B566  00        BRK
  $B567  00        BRK
  $B568  00        BRK
  $B569  00        BRK
  $B56A  00        BRK
  $B56B  00        BRK
  $B56C  00        BRK
  $B56D  00        BRK
  $B56E  00        BRK
  $B56F  00        BRK
  $B570  00        BRK
  $B571  00        BRK
  $B572  00        BRK
  $B573  00        BRK
  $B574  00        BRK
  $B575  66 67     ROR $67
  $B577  68        PLA
  $B578  69 6A     ADC #$6A
  $B57A  6B        .db $6B
  $B57B  6C 6D 6E  JMP ($6E6D)
  $B57E  6F        .db $6F
  $B57F  70 71     BVS $B5F2
  $B581  72        .db $72
  $B582  73        .db $73
  $B583  74        .db $74
  $B584  75 76     ADC $76,X
  $B586  77        .db $77
  $B587  78        SEI
  $B588  79 7A 7B  ADC $7B7A,Y
  $B58B  7C        .db $7C
  $B58C  7D 00 00  ADC $0000,X
  $B58F  00        BRK
  $B590  00        BRK
  $B591  00        BRK
  $B592  00        BRK
  $B593  00        BRK
  $B594  00        BRK
  $B595  00        BRK
  $B596  50 51     BVC $B5E9
  $B598  52        .db $52
  $B599  53        .db $53
  $B59A  54        .db $54
  $B59B  55 56     EOR $56,X
  $B59D  57        .db $57
  $B59E  58        CLI
  $B59F  59 5A 5B  EOR $5B5A,Y
  $B5A2  5C        .db $5C
  $B5A3  5D 5E 5F  EOR $5F5E,X
  $B5A6  60        RTS
  $B5A7  61 62     ADC ($62,X)
  $B5A9  63        .db $63
  $B5AA  64        .db $64
  $B5AB  65 00     ADC $00
  $B5AD  00        BRK
  $B5AE  00        BRK
  $B5AF  00        BRK
  $B5B0  00        BRK
  $B5B1  00        BRK
  $B5B2  00        BRK
  $B5B3  00        BRK
  $B5B4  00        BRK
  $B5B5  00        BRK
  $B5B6  00        BRK
  $B5B7  3C        .db $3C
  $B5B8  3D 3E 3F  AND $3F3E,X
  $B5BB  40        RTI
  $B5BC  41 42     EOR ($42,X)
  $B5BE  43        .db $43
  $B5BF  44        .db $44
  $B5C0  45 46     EOR $46
  $B5C2  47        .db $47
  $B5C3  48        PHA
  $B5C4  49 4A     EOR #$4A
  $B5C6  4B        .db $4B
  $B5C7  4C 4D 4E  JMP $4E4D
  $B5CA  4F        .db $4F
  $B5CB  00        BRK
  $B5CC  00        BRK
  $B5CD  00        BRK
  $B5CE  00        BRK
  $B5CF  00        BRK
  $B5D0  00        BRK
  $B5D1  00        BRK
  $B5D2  00        BRK
  $B5D3  00        BRK
  $B5D4  00        BRK
  $B5D5  00        BRK
  $B5D6  00        BRK
  $B5D7  00        BRK
  $B5D8  2A        ROL
  $B5D9  2B        .db $2B
  $B5DA  2C 2D 2E  BIT $2E2D
  $B5DD  2F        .db $2F
  $B5DE  30 31     BMI $B611
  $B5E0  32        .db $32
  $B5E1  33        .db $33
  $B5E2  34        .db $34
  $B5E3  35 36     AND $36,X
  $B5E5  37        .db $37
  $B5E6  38        SEC
  $B5E7  39 3A 3B  AND $3B3A,Y
  $B5EA  00        BRK
  $B5EB  00        BRK
  $B5EC  00        BRK
  $B5ED  00        BRK
  $B5EE  00        BRK
  $B5EF  00        BRK
  $B5F0  00        BRK
  $B5F1  00        BRK

L_B5F2:
  $B5F2  00        BRK
  $B5F3  00        BRK
  $B5F4  00        BRK
  $B5F5  00        BRK
  $B5F6  00        BRK
  $B5F7  00        BRK
  $B5F8  00        BRK
  $B5F9  1A        .db $1A
  $B5FA  1B        .db $1B
  $B5FB  1C        .db $1C
  $B5FC  1D 1E 1F  ORA $1F1E,X
  $B5FF  20 21 22  JSR $2221
  $B602  23        .db $23
  $B603  24 25     BIT $25
  $B605  26 27     ROL $27
  $B607  28        PLP
  $B608  29 00     AND #$00
  $B60A  00        BRK
  $B60B  00        BRK
  $B60C  00        BRK
  $B60D  00        BRK
  $B60E  00        BRK
  $B60F  00        BRK
  $B610  00        BRK

L_B611:
  $B611  00        BRK
  $B612  00        BRK
  $B613  00        BRK
  $B614  00        BRK
  $B615  00        BRK
  $B616  00        BRK
  $B617  00        BRK
  $B618  00        BRK
  $B619  00        BRK
  $B61A  0C        .db $0C
  $B61B  0D 0E 0F  ORA $0F0E
  $B61E  10 11     BPL $B631
  $B620  12        .db $12
  $B621  13        .db $13
  $B622  14        .db $14
  $B623  15 16     ORA $16,X
  $B625  17        .db $17
  $B626  18        CLC
  $B627  19 00 00  ORA $0000,Y
  $B62A  00        BRK
  $B62B  00        BRK
  $B62C  00        BRK
  $B62D  00        BRK
  $B62E  00        BRK
  $B62F  00        BRK
  $B630  00        BRK

L_B631:
  $B631  00        BRK
  $B632  00        BRK
  $B633  00        BRK
  $B634  00        BRK
  $B635  00        BRK
  $B636  00        BRK
  $B637  00        BRK
  $B638  00        BRK
  $B639  00        BRK
  $B63A  00        BRK
  $B63B  7E 01 02  ROR $0201,X
  $B63E  03        .db $03
  $B63F  04        .db $04
  $B640  05 06     ORA $06
  $B642  07        .db $07
  $B643  08        PHP
  $B644  09 0A     ORA #$0A
  $B646  0B        .db $0B
  $B647  00        BRK
  $B648  00        BRK
  $B649  00        BRK
  $B64A  00        BRK
  $B64B  00        BRK
  $B64C  00        BRK
  $B64D  00        BRK
  $B64E  00        BRK
  $B64F  00        BRK
  $B650  00        BRK
  $B651  00        BRK
  $B652  00        BRK
  $B653  00        BRK
  $B654  00        BRK
  $B655  00        BRK
  $B656  00        BRK
  $B657  00        BRK
  $B658  00        BRK
  $B659  00        BRK
  $B65A  00        BRK
  $B65B  00        BRK
  $B65C  00        BRK
  $B65D  00        BRK
  $B65E  00        BRK
  $B65F  00        BRK
  $B660  00        BRK
  $B661  00        BRK
  $B662  00        BRK
  $B663  00        BRK
  $B664  00        BRK
  $B665  00        BRK
  $B666  00        BRK
  $B667  00        BRK
  $B668  00        BRK
  $B669  00        BRK
  $B66A  00        BRK
  $B66B  00        BRK
  $B66C  00        BRK
  $B66D  00        BRK
  $B66E  00        BRK
  $B66F  00        BRK
  $B670  00        BRK
  $B671  00        BRK
  $B672  00        BRK
  $B673  00        BRK
  $B674  00        BRK
  $B675  00        BRK
  $B676  00        BRK
  $B677  00        BRK
  $B678  00        BRK
  $B679  00        BRK
  $B67A  00        BRK
  $B67B  00        BRK
  $B67C  00        BRK
  $B67D  00        BRK
  $B67E  00        BRK
  $B67F  00        BRK
  $B680  00        BRK
  $B681  00        BRK
  $B682  00        BRK
  $B683  00        BRK
  $B684  00        BRK
  $B685  00        BRK
  $B686  00        BRK
  $B687  00        BRK
  $B688  00        BRK
  $B689  00        BRK
  $B68A  00        BRK
  $B68B  00        BRK
  $B68C  00        BRK
  $B68D  00        BRK
  $B68E  00        BRK
  $B68F  00        BRK
  $B690  00        BRK
  $B691  00        BRK
  $B692  00        BRK
  $B693  00        BRK
  $B694  00        BRK
  $B695  00        BRK
  $B696  00        BRK
  $B697  00        BRK
  $B698  00        BRK
  $B699  00        BRK
  $B69A  00        BRK
  $B69B  00        BRK
  $B69C  00        BRK
  $B69D  00        BRK
  $B69E  00        BRK
  $B69F  00        BRK
  $B6A0  00        BRK
  $B6A1  00        BRK
  $B6A2  00        BRK
  $B6A3  00        BRK
  $B6A4  00        BRK
  $B6A5  00        BRK
  $B6A6  00        BRK
  $B6A7  00        BRK
  $B6A8  00        BRK
  $B6A9  00        BRK
  $B6AA  00        BRK
  $B6AB  00        BRK
  $B6AC  00        BRK
  $B6AD  00        BRK
  $B6AE  00        BRK
  $B6AF  00        BRK
  $B6B0  00        BRK
  $B6B1  00        BRK
  $B6B2  00        BRK
  $B6B3  00        BRK
  $B6B4  00        BRK
  $B6B5  00        BRK
  $B6B6  00        BRK
  $B6B7  00        BRK
  $B6B8  00        BRK
  $B6B9  00        BRK
  $B6BA  00        BRK
  $B6BB  00        BRK
  $B6BC  00        BRK
  $B6BD  00        BRK
  $B6BE  00        BRK
  $B6BF  00        BRK
  $B6C0  00        BRK
  $B6C1  00        BRK
  $B6C2  00        BRK
  $B6C3  00        BRK
  $B6C4  00        BRK
  $B6C5  00        BRK
  $B6C6  00        BRK
  $B6C7  00        BRK
  $B6C8  00        BRK
  $B6C9  00        BRK
  $B6CA  00        BRK
  $B6CB  00        BRK
  $B6CC  00        BRK
  $B6CD  00        BRK
  $B6CE  00        BRK
  $B6CF  00        BRK
  $B6D0  00        BRK
  $B6D1  00        BRK
  $B6D2  00        BRK
  $B6D3  00        BRK
  $B6D4  00        BRK
  $B6D5  00        BRK
  $B6D6  00        BRK
  $B6D7  00        BRK
  $B6D8  00        BRK
  $B6D9  00        BRK
  $B6DA  00        BRK
  $B6DB  00        BRK
  $B6DC  00        BRK
  $B6DD  00        BRK
  $B6DE  00        BRK
  $B6DF  00        BRK
  $B6E0  00        BRK
  $B6E1  00        BRK
  $B6E2  00        BRK
  $B6E3  00        BRK
  $B6E4  00        BRK
  $B6E5  00        BRK
  $B6E6  00        BRK
  $B6E7  00        BRK
  $B6E8  00        BRK
  $B6E9  00        BRK
  $B6EA  00        BRK
  $B6EB  00        BRK
  $B6EC  00        BRK
  $B6ED  00        BRK
  $B6EE  00        BRK
  $B6EF  00        BRK
  $B6F0  00        BRK

L_B6F1:
  $B6F1  20 7E 84  JSR $847E
  $B6F4  E6 20     INC $20
  $B6F6  A9 04     LDA #$04
  $B6F8  20 44 C6  JSR $C644
  $B6FB  A9 05     LDA #$05
  $B6FD  85 2A     STA $2A
  $B6FF  A9 C0     LDA #$C0
  $B701  85 08     STA $08
  $B703  A9 8E     LDA #$8E
  $B705  85 09     STA $09
  $B707  20 7E A8  JSR $A87E
  $B70A  A9 00     LDA #$00
  $B70C  85 08     STA $08
  $B70E  A9 8F     LDA #$8F
  $B710  85 09     STA $09
  $B712  20 7E A8  JSR $A87E
  $B715  A9 00     LDA #$00
  $B717  8D A0 06  STA $06A0
  $B71A  8D 80 06  STA $0680
  $B71D  8D 81 06  STA $0681
  $B720  8D 00 04  STA $0400
  $B723  8D 01 04  STA $0401
  $B726  8D A1 04  STA $04A1
  $B729  A9 0F     LDA #$0F
  $B72B  A2 1F     LDX #$1F

L_B72D:
  $B72D  9D 56 03  STA $0356,X
  $B730  CA        DEX
  $B731  10 FA     BPL $B72D
  $B733  A9 FF     LDA #$FF
  $B735  20 51 C0  JSR $C051
  $B738  20 73 84  JSR $8473
  $B73B  20 1D A5  JSR $A51D
  $B73E  A9 BB     LDA #$BB
  $B740  85 FD     STA $FD

L_B742:
  $B742  20 AB C0  JSR $C0AB
  $B745  C6 FD     DEC $FD
  $B747  D0 F9     BNE $B742
  $B749  A9 13     LDA #$13
  $B74B  20 51 C0  JSR $C051
  $B74E  A9 04     LDA #$04
  $B750  85 FD     STA $FD
  $B752  A9 3F     LDA #$3F
  $B754  85 FE     STA $FE

L_B756:
  $B756  C6 FE     DEC $FE
  $B758  D0 11     BNE $B76B
  $B75A  A9 3F     LDA #$3F
  $B75C  85 FE     STA $FE
  $B75E  A2 1B     LDX #$1B
  $B760  A0 3B     LDY #$3B
  $B762  A9 0F     LDA #$0F
  $B764  20 FF A8  JSR $A8FF
  $B767  C6 FD     DEC $FD
  $B769  F0 09     BEQ $B774

L_B76B:
  $B76B  20 F9 B8  JSR $B8F9
  $B76E  20 AB C0  JSR $C0AB
  $B771  4C 56 B7  JMP $B756

L_B774:
  $B774  AE A0 06  LDX $06A0
  $B777  BD 7B BA  LDA $BA7B,X
  $B77A  85 FD     STA $FD
  $B77C  BD 81 BA  LDA $BA81,X
  $B77F  85 FE     STA $FE
  $B781  A9 3F     LDA #$3F
  $B783  85 FF     STA $FF

L_B785:
  $B785  A5 FF     LDA $FF
  $B787  F0 02     BEQ $B78B
  $B789  C6 FF     DEC $FF

L_B78B:
  $B78B  AD A0 06  LDA $06A0
  $B78E  C9 05     CMP #$05
  $B790  D0 09     BNE $B79B
  $B792  A5 FF     LDA $FF
  $B794  29 01     AND #$01
  $B796  85 20     STA $20
  $B798  4C A1 B7  JMP $B7A1

L_B79B:
  $B79B  20 E0 B9  JSR $B9E0
  $B79E  20 FF B9  JSR $B9FF

L_B7A1:
  $B7A1  AD A0 06  LDA $06A0
  $B7A4  D0 0F     BNE $B7B5
  $B7A6  A5 1C     LDA $1C
  $B7A8  29 07     AND #$07
  $B7AA  D0 09     BNE $B7B5
  $B7AC  A2 1F     LDX #$1F
  $B7AE  A0 3F     LDY #$3F
  $B7B0  A9 FF     LDA #$FF
  $B7B2  20 FF A8  JSR $A8FF

L_B7B5:
  $B7B5  20 F9 B8  JSR $B8F9
  $B7B8  20 AB C0  JSR $C0AB
  $B7BB  38        SEC
  $B7BC  A5 FD     LDA $FD
  $B7BE  E9 01     SBC #$01
  $B7C0  85 FD     STA $FD
  $B7C2  A5 FE     LDA $FE
  $B7C4  E9 00     SBC #$00
  $B7C6  85 FE     STA $FE
  $B7C8  B0 BB     BCS $B785
  $B7CA  EE A0 06  INC $06A0
  $B7CD  AD A0 06  LDA $06A0
  $B7D0  C9 06     CMP #$06
  $B7D2  D0 A0     BNE $B774
  $B7D4  20 2D A5  JSR $A52D
  $B7D7  20 3C 84  JSR $843C
  $B7DA  A9 05     LDA #$05
  $B7DC  20 44 C6  JSR $C644
  $B7DF  A9 20     LDA #$20
  $B7E1  8D 06 20  STA $2006
  $B7E4  A9 00     LDA #$00
  $B7E6  8D 06 20  STA $2006
  $B7E9  A0 04     LDY #$04

L_B7EB:
  $B7EB  A2 00     LDX #$00

L_B7ED:
  $B7ED  8D 07 20  STA $2007
  $B7F0  E8        INX
  $B7F1  D0 FA     BNE $B7ED
  $B7F3  88        DEY
  $B7F4  D0 F5     BNE $B7EB
  $B7F6  8D 20 04  STA $0420
  $B7F9  A2 1F     LDX #$1F
  $B7FB  20 9E 82  JSR $829E
  $B7FE  E6 20     INC $20
  $B800  20 73 84  JSR $8473
  $B803  A9 30     LDA #$30
  $B805  8D 69 03  STA $0369
  $B808  A9 0D     LDA #$0D
  $B80A  20 51 C0  JSR $C051
  $B80D  20 1D A5  JSR $A51D
  $B810  20 65 84  JSR $8465
  $B813  A9 25     LDA #$25
  $B815  8D B6 03  STA $03B6
  $B818  A9 AC     LDA #$AC
  $B81A  8D B7 03  STA $03B7
  $B81D  A9 A2     LDA #$A2
  $B81F  85 FD     STA $FD
  $B821  A9 00     LDA #$00
  $B823  85 FE     STA $FE
  $B825  8D A0 06  STA $06A0

L_B828:
  $B828  A5 FD     LDA $FD
  $B82A  29 03     AND #$03
  $B82C  D0 13     BNE $B841
  $B82E  A6 FE     LDX $FE
  $B830  E0 05     CPX #$05
  $B832  F0 0D     BEQ $B841
  $B834  BD DB BA  LDA $BADB,X
  $B837  8D B8 03  STA $03B8
  $B83A  E6 47     INC $47
  $B83C  E6 FE     INC $FE
  $B83E  EE B7 03  INC $03B7

L_B841:
  $B841  20 58 83  JSR $8358
  $B844  20 AB C0  JSR $C0AB
  $B847  C6 FD     DEC $FD
  $B849  D0 DD     BNE $B828
  $B84B  A9 A0     LDA #$A0
  $B84D  8D B7 03  STA $03B7
  $B850  A9 20     LDA #$20
  $B852  20 24 BA  JSR $BA24

L_B855:
  $B855  A9 49     LDA #$49
  $B857  85 FD     STA $FD
  $B859  A9 01     LDA #$01
  $B85B  85 FE     STA $FE
  $B85D  A9 00     LDA #$00
  $B85F  8D 80 06  STA $0680
  $B862  A9 25     LDA #$25
  $B864  8D B6 03  STA $03B6
  $B867  A9 83     LDA #$83
  $B869  8D B7 03  STA $03B7

L_B86C:
  $B86C  20 37 D6  JSR $D637
  $B86F  20 58 83  JSR $8358
  $B872  20 AB C0  JSR $C0AB
  $B875  38        SEC
  $B876  A5 FD     LDA $FD
  $B878  E9 01     SBC #$01
  $B87A  85 FD     STA $FD
  $B87C  A5 FE     LDA $FE
  $B87E  E9 00     SBC #$00
  $B880  85 FE     STA $FE
  $B882  D0 E8     BNE $B86C
  $B884  A5 FD     LDA $FD
  $B886  F0 13     BEQ $B89B
  $B888  C9 D0     CMP #$D0
  $B88A  D0 E0     BNE $B86C
  $B88C  AD A0 06  LDA $06A0
  $B88F  C9 0E     CMP #$0E
  $B891  90 D9     BCC $B86C
  $B893  A9 14     LDA #$14
  $B895  20 51 C0  JSR $C051
  $B898  4C 6C B8  JMP $B86C

L_B89B:
  $B89B  A9 25     LDA #$25
  $B89D  8D B6 03  STA $03B6
  $B8A0  A9 80     LDA #$80
  $B8A2  8D B7 03  STA $03B7
  $B8A5  A9 20     LDA #$20
  $B8A7  20 24 BA  JSR $BA24
  $B8AA  A9 25     LDA #$25
  $B8AC  8D B6 03  STA $03B6
  $B8AF  A9 C0     LDA #$C0
  $B8B1  8D B7 03  STA $03B7
  $B8B4  A9 20     LDA #$20
  $B8B6  20 24 BA  JSR $BA24
  $B8B9  EE A0 06  INC $06A0
  $B8BC  AD A0 06  LDA $06A0
  $B8BF  C9 10     CMP #$10
  $B8C1  D0 92     BNE $B855
  $B8C3  A9 0F     LDA #$0F
  $B8C5  8D 58 03  STA $0358
  $B8C8  8D 59 03  STA $0359
  $B8CB  A9 00     LDA #$00
  $B8CD  8D A0 06  STA $06A0
  $B8D0  85 20     STA $20
  $B8D2  20 42 D6  JSR $D642

L_B8D5:
  $B8D5  20 4D D6  JSR $D64D
  $B8D8  20 58 83  JSR $8358
  $B8DB  20 AB C0  JSR $C0AB
  $B8DE  AD A0 06  LDA $06A0
  $B8E1  C9 3C     CMP #$3C
  $B8E3  D0 F0     BNE $B8D5
  $B8E5  A5 22     LDA $22
  $B8E7  D0 EC     BNE $B8D5

L_B8E9:
  $B8E9  20 58 83  JSR $8358
  $B8EC  20 AB C0  JSR $C0AB
  $B8EF  A5 27     LDA $27
  $B8F1  29 08     AND #$08
  $B8F3  F0 F4     BEQ $B8E9
  $B8F5  20 2D A5  JSR $A52D
  $B8F8  60        RTS

L_B8F9:
  $B8F9  20 73 84  JSR $8473
  $B8FC  AD A0 06  LDA $06A0
  $B8FF  C9 05     CMP #$05
  $B901  D0 1B     BNE $B91E
  $B903  A0 04     LDY #$04
  $B905  A2 30     LDX #$30
  $B907  A5 FF     LDA $FF
  $B909  29 01     AND #$01
  $B90B  D0 04     BNE $B911
  $B90D  A0 05     LDY #$05
  $B90F  A2 0F     LDX #$0F

L_B911:
  $B911  8E 67 03  STX $0367
  $B914  8A        TXA
  $B915  29 0F     AND #$0F
  $B917  8D 6F 03  STA $036F
  $B91A  20 27 D6  JSR $D627
  $B91D  60        RTS

L_B91E:
  $B91E  A9 00     LDA #$00
  $B920  8D 60 04  STA $0460
  $B923  8D A0 04  STA $04A0
  $B926  8D 40 04  STA $0440
  $B929  85 00     STA $00
  $B92B  EE 80 06  INC $0680
  $B92E  AD 80 06  LDA $0680
  $B931  C9 10     CMP #$10
  $B933  D0 14     BNE $B949
  $B935  A9 00     LDA #$00
  $B937  8D 80 06  STA $0680
  $B93A  EE 00 04  INC $0400
  $B93D  AD 00 04  LDA $0400
  $B940  C9 04     CMP #$04
  $B942  D0 05     BNE $B949
  $B944  A9 00     LDA #$00
  $B946  8D 00 04  STA $0400

L_B949:
  $B949  AD A0 06  LDA $06A0
  $B94C  C9 04     CMP #$04
  $B94E  90 0F     BCC $B95F
  $B950  AC 00 04  LDY $0400
  $B953  A5 FF     LDA $FF
  $B955  29 01     AND #$01
  $B957  D0 02     BNE $B95B
  $B959  A0 04     LDY #$04

L_B95B:
  $B95B  20 27 D6  JSR $D627
  $B95E  60        RTS

L_B95F:
  $B95F  20 24 D6  JSR $D624
  $B962  AE A0 06  LDX $06A0
  $B965  18        CLC
  $B966  AD C1 04  LDA $04C1
  $B969  7D D3 BA  ADC $BAD3,X
  $B96C  8D C1 04  STA $04C1
  $B96F  AD A1 04  LDA $04A1
  $B972  7D D7 BA  ADC $BAD7,X
  $B975  8D A1 04  STA $04A1
  $B978  A5 1C     LDA $1C
  $B97A  29 07     AND #$07
  $B97C  D0 0F     BNE $B98D
  $B97E  EE 81 06  INC $0681
  $B981  AD 81 06  LDA $0681
  $B984  C9 04     CMP #$04
  $B986  D0 05     BNE $B98D
  $B988  A9 00     LDA #$00
  $B98A  8D 81 06  STA $0681

L_B98D:
  $B98D  AD A0 06  LDA $06A0
  $B990  0A        ASL
  $B991  0A        ASL
  $B992  6D 81 06  ADC $0681
  $B995  AA        TAX
  $B996  BD B3 BA  LDA $BAB3,X
  $B999  85 02     STA $02
  $B99B  A5 FF     LDA $FF
  $B99D  F0 1B     BEQ $B9BA
  $B99F  AE A0 06  LDX $06A0
  $B9A2  F0 16     BEQ $B9BA
  $B9A4  CA        DEX
  $B9A5  A5 FF     LDA $FF
  $B9A7  F0 11     BEQ $B9BA
  $B9A9  4A        LSR
  $B9AA  4A        LSR
  $B9AB  4A        LSR
  $B9AC  4A        LSR
  $B9AD  85 02     STA $02
  $B9AF  8A        TXA
  $B9B0  0A        ASL
  $B9B1  0A        ASL
  $B9B2  65 02     ADC $02
  $B9B4  AA        TAX
  $B9B5  BD C3 BA  LDA $BAC3,X
  $B9B8  85 02     STA $02

L_B9BA:
  $B9BA  A4 00     LDY $00
  $B9BC  A2 15     LDX #$15

L_B9BE:
  $B9BE  18        CLC
  $B9BF  BD 87 BA  LDA $BA87,X
  $B9C2  6D A1 04  ADC $04A1
  $B9C5  99 00 02  STA $0200,Y
  $B9C8  C8        INY
  $B9C9  A5 02     LDA $02
  $B9CB  99 00 02  STA $0200,Y
  $B9CE  C8        INY
  $B9CF  A9 03     LDA #$03
  $B9D1  99 00 02  STA $0200,Y
  $B9D4  C8        INY
  $B9D5  BD 9D BA  LDA $BA9D,X
  $B9D8  99 00 02  STA $0200,Y
  $B9DB  C8        INY
  $B9DC  CA        DEX
  $B9DD  10 DF     BPL $B9BE
  $B9DF  60        RTS

L_B9E0:
  $B9E0  AE A0 06  LDX $06A0
  $B9E3  A5 FF     LDA $FF
  $B9E5  29 01     AND #$01
  $B9E7  D0 01     BNE $B9EA
  $B9E9  E8        INX

L_B9EA:
  $B9EA  8A        TXA
  $B9EB  0A        ASL
  $B9EC  AA        TAX
  $B9ED  A0 00     LDY #$00

L_B9EF:
  $B9EF  BD 6F BA  LDA $BA6F,X
  $B9F2  99 68 03  STA $0368,Y
  $B9F5  99 70 03  STA $0370,Y
  $B9F8  E8        INX
  $B9F9  C8        INY
  $B9FA  C0 02     CPY #$02
  $B9FC  D0 F1     BNE $B9EF
  $B9FE  60        RTS

L_B9FF:
  $B9FF  AE A0 06  LDX $06A0
  $BA02  F0 1F     BEQ $BA23
  $BA04  A5 FF     LDA $FF
  $BA06  29 01     AND #$01
  $BA08  F0 01     BEQ $BA0B
  $BA0A  CA        DEX

L_BA0B:
  $BA0B  8A        TXA
  $BA0C  0A        ASL
  $BA0D  0A        ASL
  $BA0E  85 00     STA $00
  $BA10  18        CLC
  $BA11  0A        ASL
  $BA12  65 00     ADC $00
  $BA14  AA        TAX
  $BA15  A0 00     LDY #$00

L_BA17:
  $BA17  BD 33 BA  LDA $BA33,X
  $BA1A  99 56 03  STA $0356,Y
  $BA1D  E8        INX
  $BA1E  C8        INY
  $BA1F  C0 0C     CPY #$0C
  $BA21  D0 F4     BNE $BA17

L_BA23:
  $BA23  60        RTS

L_BA24:
  $BA24  A2 20     LDX #$20
  $BA26  86 47     STX $47
  $BA28  CA        DEX

L_BA29:
  $BA29  9D B8 03  STA $03B8,X
  $BA2C  CA        DEX
  $BA2D  10 FA     BPL $BA29
  $BA2F  20 AB C0  JSR $C0AB
  $BA32  60        RTS
  $BA33  0F        .db $0F
  $BA34  26 26     ROL $26
  $BA36  27        .db $27
  $BA37  0F        .db $0F
  $BA38  17        .db $17
  $BA39  28        PLP
  $BA3A  05 0F     ORA $0F
  $BA3C  17        .db $17
  $BA3D  27        .db $27
  $BA3E  18        CLC

L_BA3F:
  $BA3F  0F        .db $0F
  $BA40  11 11     ORA ($11),Y
  $BA42  20 0F 10  JSR $100F
  $BA45  28        PLP
  $BA46  20 0F 10  JSR $100F
  $BA49  20 18 0F  JSR $0F18
  $BA4C  21 21     AND ($21,X)
  $BA4E  35 0F     AND $0F,X
  $BA50  25 37     AND $37
  $BA52  16 0F     ASL $0F,X
  $BA54  25 35     AND $35
  $BA56  17        .db $17
  $BA57  0F        .db $0F
  $BA58  10 10     BPL $BA6A
  $BA5A  00        BRK
  $BA5B  0F        .db $0F
  $BA5C  00        BRK
  $BA5D  18        CLC
  $BA5E  05 0F     ORA $0F
  $BA60  00        BRK
  $BA61  10 00     BPL $BA63

L_BA63:
  $BA63  0F        .db $0F
  $BA64  30 21     BMI $BA87
  $BA66  1C        .db $1C
  $BA67  0F        .db $0F
  $BA68  19 37 16  ORA $1637,Y
  $BA6B  0F        .db $0F
  $BA6C  19 2A 18  ORA $182A,Y
  $BA6F  2C 11 28  BIT $2811
  $BA72  15 30     ORA $30,X
  $BA74  00        BRK
  $BA75  34        .db $34
  $BA76  24 30     BIT $30
  $BA78  11 2C     ORA ($2C),Y
  $BA7A  11 2C     ORA ($2C),Y
  $BA7C  32        .db $32
  $BA7D  32        .db $32
  $BA7E  32        .db $32
  $BA7F  32        .db $32
  $BA80  90 03     BCC $BA85
  $BA82  02        .db $02
  $BA83  02        .db $02
  $BA84  02        .db $02

L_BA85:
  $BA85  02        .db $02
  $BA86  02        .db $02

L_BA87:
  $BA87  00        BRK
  $BA88  08        PHP
  $BA89  10 20     BPL $BAAB
  $BA8B  28        PLP
  $BA8C  30 40     BMI $BACE
  $BA8E  48        PHA
  $BA8F  50 58     BVC $BAE9
  $BA91  68        PLA
  $BA92  78        SEI
  $BA93  80        .db $80
  $BA94  88        DEY
  $BA95  90 A8     BCC $BA3F
  $BA97  B8        CLV
  $BA98  C0 D0     CPY #$D0
  $BA9A  D8        CLD
  $BA9B  E0 E8     CPX #$E8
  $BA9D  D8        CLD
  $BA9E  70 18     BVS $BAB8
  $BAA0  B0 88     BCS $BA2A
  $BAA2  40        RTI
  $BAA3  A0 F8     LDY #$F8
  $BAA5  20 58 C8  JSR $C858
  $BAA8  08        PHP
  $BAA9  88        DEY
  $BAAA  38        SEC

L_BAAB:
  $BAAB  B0 D8     BCS $BA85
  $BAAD  70 28     BVS $BAD7
  $BAAF  B8        CLV
  $BAB0  08        PHP
  $BAB1  98        TYA
  $BAB2  48        PHA
  $BAB3  0C        .db $0C
  $BAB4  0D 0E 0D  ORA $0D0E
  $BAB7  1B        .db $1B

L_BAB8:
  $BAB8  1C        .db $1C
  $BAB9  1B        .db $1B
  $BABA  1C        .db $1C
  $BABB  2C 2D 2E  BIT $2E2D
  $BABE  2D 3B 3B  AND $3B3B
  $BAC1  3B        .db $3B
  $BAC2  3B        .db $3B
  $BAC3  1B        .db $1B
  $BAC4  1A        .db $1A
  $BAC5  19 0F 2C  ORA $2C0F,Y
  $BAC8  1F        .db $1F
  $BAC9  1E 1D 3C  ASL $3C1D,X
  $BACC  3A        .db $3A
  $BACD  39 2F 3D  AND $3D2F,Y
  $BAD0  3D 3D 3C  AND $3C3D,X
  $BAD3  80        .db $80
  $BAD4  80        .db $80
  $BAD5  E5 00     SBC $00

L_BAD7:
  $BAD7  00        BRK
  $BAD8  00        BRK
  $BAD9  00        BRK
  $BADA  08        PHP
  $BADB  13        .db $13
  $BADC  14        .db $14
  $BADD  01 06     ORA ($06,X)
  $BADF  06 A9     ASL $A9
  $BAE1  03        .db $03
  $BAE2  20 44 C6  JSR $C644
  $BAE5  A9 06     LDA #$06
  $BAE7  20 44 C6  JSR $C644
  $BAEA  A5 2A     LDA $2A
  $BAEC  48        PHA
  $BAED  A9 05     LDA #$05
  $BAEF  85 2A     STA $2A
  $BAF1  A9 40     LDA #$40
  $BAF3  85 08     STA $08
  $BAF5  A9 8F     LDA #$8F
  $BAF7  85 09     STA $09
  $BAF9  20 7E A8  JSR $A87E
  $BAFC  A9 80     LDA #$80
  $BAFE  85 08     STA $08
  $BB00  A9 8F     LDA #$8F
  $BB02  85 09     STA $09
  $BB04  20 7E A8  JSR $A87E
  $BB07  68        PLA
  $BB08  85 2A     STA $2A
  $BB0A  A9 17     LDA #$17
  $BB0C  20 51 C0  JSR $C051
  $BB0F  20 7E 84  JSR $847E
  $BB12  A9 01     LDA #$01
  $BB14  20 B2 A9  JSR $A9B2
  $BB17  A2 0F     LDX #$0F
  $BB19  8A        TXA

L_BB1A:
  $BB1A  9D 66 03  STA $0366,X
  $BB1D  CA        DEX
  $BB1E  10 FA     BPL $BB1A
  $BB20  A9 06     LDA #$06
  $BB22  8D 00 04  STA $0400
  $BB25  20 24 D6  JSR $D624
  $BB28  A9 05     LDA #$05
  $BB2A  85 FD     STA $FD

L_BB2C:
  $BB2C  A5 1C     LDA $1C
  $BB2E  29 07     AND #$07
  $BB30  D0 0D     BNE $BB3F
  $BB32  A2 1B     LDX #$1B
  $BB34  A0 3B     LDY #$3B
  $BB36  A9 0F     LDA #$0F
  $BB38  20 FF A8  JSR $A8FF
  $BB3B  C6 FD     DEC $FD
  $BB3D  F0 06     BEQ $BB45

L_BB3F:
  $BB3F  20 AB C0  JSR $C0AB
  $BB42  4C 2C BB  JMP $BB2C

L_BB45:
  $BB45  20 34 BD  JSR $BD34
  $BB48  20 22 BD  JSR $BD22
  $BB4B  20 34 BD  JSR $BD34
  $BB4E  EE B7 03  INC $03B7
  $BB51  A6 2A     LDX $2A
  $BB53  BD 12 BE  LDA $BE12,X
  $BB56  8D B8 03  STA $03B8
  $BB59  E6 47     INC $47
  $BB5B  20 34 BD  JSR $BD34
  $BB5E  20 22 BD  JSR $BD22
  $BB61  EE B7 03  INC $03B7
  $BB64  EE B7 03  INC $03B7
  $BB67  20 AB C0  JSR $C0AB
  $BB6A  A9 08     LDA #$08
  $BB6C  20 3E BD  JSR $BD3E
  $BB6F  A9 09     LDA #$09
  $BB71  20 3E BD  JSR $BD3E
  $BB74  A5 2A     LDA $2A
  $BB76  20 3E BD  JSR $BD3E
  $BB79  A5 2A     LDA $2A
  $BB7B  C9 04     CMP #$04
  $BB7D  D0 05     BNE $BB84
  $BB7F  A9 13     LDA #$13
  $BB81  20 3E BD  JSR $BD3E

L_BB84:
  $BB84  A9 9C     LDA #$9C
  $BB86  85 FD     STA $FD

L_BB88:
  $BB88  A2 00     LDX #$00
  $BB8A  A5 FD     LDA $FD
  $BB8C  29 01     AND #$01
  $BB8E  F0 06     BEQ $BB96
  $BB90  A6 2A     LDX $2A
  $BB92  E8        INX
  $BB93  8A        TXA
  $BB94  0A        ASL
  $BB95  AA        TAX

L_BB96:
  $BB96  BD 5A BF  LDA $BF5A,X
  $BB99  8D 68 03  STA $0368
  $BB9C  8D 70 03  STA $0370
  $BB9F  BD 5B BF  LDA $BF5B,X
  $BBA2  8D 69 03  STA $0369
  $BBA5  8D 71 03  STA $0371
  $BBA8  20 AB C0  JSR $C0AB
  $BBAB  C6 FD     DEC $FD
  $BBAD  D0 D9     BNE $BB88
  $BBAF  A6 2A     LDX $2A
  $BBB1  BD 81 C2  LDA $C281,X
  $BBB4  F0 03     BEQ $BBB9
  $BBB6  20 62 BC  JSR $BC62

L_BBB9:
  $BBB9  A2 08     LDX #$08
  $BBBB  20 8B A9  JSR $A98B
  $BBBE  20 AB C0  JSR $C0AB
  $BBC1  A2 09     LDX #$09
  $BBC3  20 8B A9  JSR $A98B
  $BBC6  20 AB C0  JSR $C0AB

L_BBC9:
  $BBC9  A2 03     LDX #$03

L_BBCB:
  $BBCB  BD 70 BF  LDA $BF70,X
  $BBCE  9D FC 02  STA $02FC,X
  $BBD1  CA        DEX
  $BBD2  10 F7     BPL $BBCB
  $BBD4  A9 30     LDA #$30
  $BBD6  8D 74 03  STA $0374
  $BBD9  A9 00     LDA #$00
  $BBDB  85 FD     STA $FD

L_BBDD:
  $BBDD  A6 FD     LDX $FD
  $BBDF  BD 6E BF  LDA $BF6E,X
  $BBE2  8D FC 02  STA $02FC
  $BBE5  A5 1C     LDA $1C
  $BBE7  29 08     AND #$08
  $BBE9  D0 05     BNE $BBF0
  $BBEB  A9 F8     LDA #$F8
  $BBED  8D FC 02  STA $02FC

L_BBF0:
  $BBF0  A5 27     LDA $27
  $BBF2  29 3C     AND #$3C
  $BBF4  F0 0F     BEQ $BC05
  $BBF6  29 08     AND #$08
  $BBF8  D0 11     BNE $BC0B
  $BBFA  A9 2F     LDA #$2F
  $BBFC  20 51 C0  JSR $C051
  $BBFF  A5 FD     LDA $FD
  $BC01  49 01     EOR #$01
  $BC03  85 FD     STA $FD

L_BC05:
  $BC05  20 AB C0  JSR $C0AB
  $BC08  4C DD BB  JMP $BBDD

L_BC0B:
  $BC0B  A5 FD     LDA $FD
  $BC0D  F0 03     BEQ $BC12
  $BC0F  4C 5E BC  JMP $BC5E

L_BC12:
  $BC12  A2 1F     LDX #$1F

L_BC14:
  $BC14  BD 56 03  LDA $0356,X
  $BC17  9D 00 07  STA $0700,X
  $BC1A  CA        DEX
  $BC1B  10 F7     BPL $BC14
  $BC1D  20 24 B2  JSR $B224
  $BC20  20 24 D6  JSR $D624
  $BC23  A9 05     LDA #$05
  $BC25  85 FD     STA $FD

L_BC27:
  $BC27  A5 1C     LDA $1C
  $BC29  29 03     AND #$03
  $BC2B  D0 28     BNE $BC55
  $BC2D  A2 1F     LDX #$1F

L_BC2F:
  $BC2F  BD 56 03  LDA $0356,X
  $BC32  C9 0F     CMP #$0F
  $BC34  D0 0B     BNE $BC41
  $BC36  BD 00 07  LDA $0700,X
  $BC39  29 0F     AND #$0F
  $BC3B  9D 56 03  STA $0356,X
  $BC3E  4C 4E BC  JMP $BC4E

L_BC41:
  $BC41  18        CLC
  $BC42  69 10     ADC #$10
  $BC44  DD 00 07  CMP $0700,X
  $BC47  F0 02     BEQ $BC4B
  $BC49  B0 03     BCS $BC4E

L_BC4B:
  $BC4B  9D 56 03  STA $0356,X

L_BC4E:
  $BC4E  CA        DEX
  $BC4F  10 DE     BPL $BC2F
  $BC51  C6 FD     DEC $FD
  $BC53  F0 06     BEQ $BC5B

L_BC55:
  $BC55  20 AB C0  JSR $C0AB
  $BC58  4C 27 BC  JMP $BC27

L_BC5B:
  $BC5B  4C C9 BB  JMP $BBC9

L_BC5E:
  $BC5E  20 2D A5  JSR $A52D
  $BC61  60        RTS

L_BC62:
  $BC62  A9 0F     LDA #$0F
  $BC64  8D 5C 03  STA $035C
  $BC67  8D 5D 03  STA $035D
  $BC6A  A2 02     LDX #$02

L_BC6C:
  $BC6C  BD 74 BF  LDA $BF74,X
  $BC6F  9D 73 03  STA $0373,X
  $BC72  CA        DEX
  $BC73  10 F7     BPL $BC6C
  $BC75  20 73 84  JSR $8473
  $BC78  20 B7 BD  JSR $BDB7
  $BC7B  A9 7D     LDA #$7D
  $BC7D  85 FD     STA $FD

L_BC7F:
  $BC7F  A2 0F     LDX #$0F
  $BC81  A5 FD     LDA $FD
  $BC83  29 08     AND #$08
  $BC85  F0 02     BEQ $BC89
  $BC87  A2 15     LDX #$15

L_BC89:
  $BC89  8E 66 03  STX $0366
  $BC8C  20 AB C0  JSR $C0AB
  $BC8F  C6 FD     DEC $FD
  $BC91  D0 EC     BNE $BC7F
  $BC93  A9 07     LDA #$07
  $BC95  8D 00 04  STA $0400
  $BC98  20 24 D6  JSR $D624
  $BC9B  A9 0A     LDA #$0A
  $BC9D  20 3E BD  JSR $BD3E
  $BCA0  A9 0B     LDA #$0B
  $BCA2  20 3E BD  JSR $BD3E
  $BCA5  20 AB BD  JSR $BDAB
  $BCA8  20 B7 BD  JSR $BDB7
  $BCAB  A6 2A     LDX $2A
  $BCAD  BD 81 C2  LDA $C281,X
  $BCB0  4A        LSR
  $BCB1  09 A0     ORA #$A0
  $BCB3  8D 20 04  STA $0420
  $BCB6  EE 20 04  INC $0420
  $BCB9  A9 0F     LDA #$0F
  $BCBB  20 3E BD  JSR $BD3E
  $BCBE  A9 0C     LDA #$0C
  $BCC0  20 3E BD  JSR $BD3E
  $BCC3  A9 0D     LDA #$0D
  $BCC5  20 3E BD  JSR $BD3E
  $BCC8  A9 0E     LDA #$0E
  $BCCA  20 3E BD  JSR $BD3E
  $BCCD  20 AB BD  JSR $BDAB
  $BCD0  20 B7 BD  JSR $BDB7
  $BCD3  20 73 84  JSR $8473
  $BCD6  A9 06     LDA #$06
  $BCD8  8D 00 04  STA $0400
  $BCDB  20 24 D6  JSR $D624
  $BCDE  20 EC BD  JSR $BDEC
  $BCE1  A9 08     LDA #$08
  $BCE3  20 3E BD  JSR $BD3E
  $BCE6  A9 09     LDA #$09
  $BCE8  20 3E BD  JSR $BD3E
  $BCEB  AD 20 04  LDA $0420
  $BCEE  29 0F     AND #$0F
  $BCF0  18        CLC
  $BCF1  69 0F     ADC #$0F
  $BCF3  20 3E BD  JSR $BD3E
  $BCF6  A9 7D     LDA #$7D
  $BCF8  85 FD     STA $FD

L_BCFA:
  $BCFA  A2 12     LDX #$12
  $BCFC  A5 FD     LDA $FD
  $BCFE  29 01     AND #$01
  $BD00  D0 06     BNE $BD08
  $BD02  A6 2A     LDX $2A
  $BD04  E8        INX
  $BD05  8A        TXA
  $BD06  0A        ASL
  $BD07  AA        TAX

L_BD08:
  $BD08  BD 5A BF  LDA $BF5A,X
  $BD0B  8D 68 03  STA $0368
  $BD0E  8D 70 03  STA $0370
  $BD11  BD 5B BF  LDA $BF5B,X
  $BD14  8D 69 03  STA $0369
  $BD17  8D 71 03  STA $0371
  $BD1A  20 AB C0  JSR $C0AB
  $BD1D  C6 FD     DEC $FD
  $BD1F  D0 D9     BNE $BCFA
  $BD21  60        RTS

L_BD22:
  $BD22  A9 24     LDA #$24
  $BD24  8D B6 03  STA $03B6
  $BD27  A9 CD     LDA #$CD
  $BD29  8D B7 03  STA $03B7
  $BD2C  A9 94     LDA #$94
  $BD2E  8D B8 03  STA $03B8
  $BD31  E6 47     INC $47
  $BD33  60        RTS

L_BD34:
  $BD34  20 AB C0  JSR $C0AB
  $BD37  A5 1C     LDA $1C
  $BD39  29 07     AND #$07
  $BD3B  D0 F7     BNE $BD34
  $BD3D  60        RTS

L_BD3E:
  $BD3E  84 00     STY $00
  $BD40  0A        ASL
  $BD41  0A        ASL
  $BD42  0A        ASL
  $BD43  0A        ASL
  $BD44  A8        TAY
  $BD45  A9 00     LDA #$00
  $BD47  69 00     ADC #$00
  $BD49  85 C8     STA $C8
  $BD4B  A9 1A     LDA #$1A
  $BD4D  85 C9     STA $C9
  $BD4F  A9 BE     LDA #$BE
  $BD51  18        CLC
  $BD52  65 C8     ADC $C8
  $BD54  85 CA     STA $CA
  $BD56  B1 C9     LDA ($C9),Y
  $BD58  8D B6 03  STA $03B6
  $BD5B  98        TYA
  $BD5C  18        CLC
  $BD5D  69 01     ADC #$01
  $BD5F  A8        TAY
  $BD60  A5 CA     LDA $CA
  $BD62  69 00     ADC #$00
  $BD64  85 CA     STA $CA
  $BD66  B1 C9     LDA ($C9),Y
  $BD68  8D B7 03  STA $03B7
  $BD6B  98        TYA
  $BD6C  18        CLC
  $BD6D  69 01     ADC #$01
  $BD6F  A8        TAY
  $BD70  A5 CA     LDA $CA
  $BD72  69 00     ADC #$00
  $BD74  85 CA     STA $CA
  $BD76  84 FE     STY $FE
  $BD78  A9 0E     LDA #$0E
  $BD7A  85 FD     STA $FD

L_BD7C:
  $BD7C  20 34 BD  JSR $BD34
  $BD7F  A4 FE     LDY $FE
  $BD81  C0 F7     CPY #$F7
  $BD83  D0 05     BNE $BD8A
  $BD85  AD 20 04  LDA $0420
  $BD88  D0 02     BNE $BD8C

L_BD8A:
  $BD8A  B1 C9     LDA ($C9),Y

L_BD8C:
  $BD8C  8D B8 03  STA $03B8
  $BD8F  E6 47     INC $47
  $BD91  EE B7 03  INC $03B7
  $BD94  A5 FE     LDA $FE
  $BD96  18        CLC
  $BD97  69 01     ADC #$01
  $BD99  85 FE     STA $FE
  $BD9B  A5 CA     LDA $CA
  $BD9D  69 00     ADC #$00
  $BD9F  85 CA     STA $CA
  $BDA1  C6 FD     DEC $FD
  $BDA3  D0 D7     BNE $BD7C
  $BDA5  A4 00     LDY $00
  $BDA7  20 AB C0  JSR $C0AB
  $BDAA  60        RTS

L_BDAB:
  $BDAB  A9 7D     LDA #$7D
  $BDAD  85 FD     STA $FD

L_BDAF:
  $BDAF  20 AB C0  JSR $C0AB
  $BDB2  C6 FD     DEC $FD
  $BDB4  D0 F9     BNE $BDAF
  $BDB6  60        RTS

L_BDB7:
  $BDB7  A2 1F     LDX #$1F
  $BDB9  A9 00     LDA #$00

L_BDBB:
  $BDBB  9D B8 03  STA $03B8,X
  $BDBE  CA        DEX
  $BDBF  10 FA     BPL $BDBB
  $BDC1  A9 09     LDA #$09
  $BDC3  85 FD     STA $FD
  $BDC5  A9 24     LDA #$24
  $BDC7  8D B6 03  STA $03B6
  $BDCA  A9 AB     LDA #$AB
  $BDCC  8D B7 03  STA $03B7

L_BDCF:
  $BDCF  18        CLC
  $BDD0  AD B7 03  LDA $03B7
  $BDD3  69 20     ADC #$20
  $BDD5  8D B7 03  STA $03B7
  $BDD8  AD B6 03  LDA $03B6
  $BDDB  69 00     ADC #$00
  $BDDD  8D B6 03  STA $03B6
  $BDE0  A9 0F     LDA #$0F
  $BDE2  85 47     STA $47
  $BDE4  20 AB C0  JSR $C0AB
  $BDE7  C6 FD     DEC $FD
  $BDE9  10 E4     BPL $BDCF
  $BDEB  60        RTS

L_BDEC:
  $BDEC  20 34 BD  JSR $BD34
  $BDEF  20 22 BD  JSR $BD22
  $BDF2  20 34 BD  JSR $BD34
  $BDF5  EE B7 03  INC $03B7
  $BDF8  A6 2A     LDX $2A
  $BDFA  AD 20 04  LDA $0420
  $BDFD  8D B8 03  STA $03B8
  $BE00  E6 47     INC $47
  $BE02  20 34 BD  JSR $BD34
  $BE05  20 22 BD  JSR $BD22
  $BE08  EE B7 03  INC $03B7
  $BE0B  EE B7 03  INC $03B7
  $BE0E  20 AB C0  JSR $C0AB
  $BE11  60        RTS
  $BE12  48        PHA
  $BE13  41 57     EOR ($57,X)
  $BE15  42        .db $42
  $BE16  51 46     EOR ($46),Y
  $BE18  4D 43 25  EOR $2543
  $BE1B  8B        .db $8B
  $BE1C  40        RTI
  $BE1D  40        RTI
  $BE1E  41 54     EOR ($54,X)
  $BE20  4F        .db $4F
  $BE21  4D 49 43  EOR $4349
  $BE24  40        RTI
  $BE25  46 49     LSR $49
  $BE27  52        .db $52
  $BE28  45 40     EOR $40
  $BE2A  25 8B     AND $8B
  $BE2C  40        RTI
  $BE2D  40        RTI
  $BE2E  41 49     EOR ($49,X)
  $BE30  52        .db $52
  $BE31  40        RTI
  $BE32  53        .db $53
  $BE33  48        PHA
  $BE34  4F        .db $4F
  $BE35  4F        .db $4F
  $BE36  54        .db $54
  $BE37  45 52     EOR $52
  $BE39  40        RTI
  $BE3A  25 8B     AND $8B
  $BE3C  40        RTI
  $BE3D  40        RTI
  $BE3E  4C 45 41  JMP $4145
  $BE41  46 40     LSR $40
  $BE43  53        .db $53
  $BE44  48        PHA
  $BE45  49 45     EOR #$45
  $BE47  4C 44 40  JMP $4044
  $BE4A  25 8B     AND $8B
  $BE4C  40        RTI
  $BE4D  40        RTI
  $BE4E  42        .db $42
  $BE4F  55 42     EOR $42,X
  $BE51  42        .db $42
  $BE52  4C 45 94  JMP $9445
  $BE55  4C 45 41  JMP $4145
  $BE58  44        .db $44
  $BE59  40        RTI
  $BE5A  25 8B     AND $8B
  $BE5C  40        RTI
  $BE5D  40        RTI
  $BE5E  51 55     EOR ($55),Y
  $BE60  49 43     EOR #$43
  $BE62  4B        .db $4B
  $BE63  40        RTI
  $BE64  40        RTI
  $BE65  40        RTI
  $BE66  40        RTI
  $BE67  40        RTI
  $BE68  40        RTI
  $BE69  40        RTI
  $BE6A  25 8B     AND $8B
  $BE6C  40        RTI
  $BE6D  40        RTI
  $BE6E  54        .db $54
  $BE6F  49 4D     EOR #$4D
  $BE71  45 94     EOR $94
  $BE73  53        .db $53
  $BE74  54        .db $54
  $BE75  4F        .db $4F
  $BE76  50 50     BVC $BEC8
  $BE78  45 52     EOR $52
  $BE7A  25 8B     AND $8B
  $BE7C  40        RTI
  $BE7D  40        RTI
  $BE7E  4D 45 54  EOR $5445
  $BE81  41 4C     EOR ($4C,X)
  $BE83  94 42     STY $42,X
  $BE85  4C 41 44  JMP $4441
  $BE88  45 40     EOR $40
  $BE8A  25 8B     AND $8B
  $BE8C  40        RTI
  $BE8D  40        RTI
  $BE8E  43        .db $43
  $BE8F  52        .db $52
  $BE90  41 53     EOR ($53,X)
  $BE92  48        PHA
  $BE93  40        RTI
  $BE94  42        .db $42
  $BE95  4F        .db $4F
  $BE96  4D 42 45  EOR $4542
  $BE99  52        .db $52
  $BE9A  25 0B     AND $0B
  $BE9C  40        RTI
  $BE9D  40        RTI
  $BE9E  47        .db $47
  $BE9F  45 54     EOR $54
  $BEA1  40        RTI
  $BEA2  45 51     EOR $51
  $BEA4  55 49     EOR $49,X
  $BEA6  50 50     BVC $BEF8
  $BEA8  45 44     EOR $44
  $BEAA  25 4B     AND $4B
  $BEAC  40        RTI
  $BEAD  40        RTI
  $BEAE  57        .db $57
  $BEAF  49 54     EOR #$54
  $BEB1  48        PHA
  $BEB2  40        RTI
  $BEB3  40        RTI
  $BEB4  40        RTI
  $BEB5  40        RTI
  $BEB6  40        RTI
  $BEB7  40        RTI
  $BEB8  40        RTI
  $BEB9  40        RTI
  $BEBA  25 2B     AND $2B
  $BEBC  40        RTI
  $BEBD  4D 45 53  EOR $5345
  $BEC0  53        .db $53
  $BEC1  41 47     EOR ($47,X)
  $BEC3  45 40     EOR $40
  $BEC5  46 52     LSR $52
  $BEC7  4F        .db $4F

L_BEC8:
  $BEC8  4D 40 25  EOR $2540
  $BECB  6B        .db $6B
  $BECC  40        RTI
  $BECD  44        .db $44
  $BECE  52        .db $52
  $BECF  5C        .db $5C
  $BED0  4C 49 47  JMP $4749
  $BED3  48        PHA
  $BED4  54        .db $54
  $BED5  5C        .db $5C
  $BED6  40        RTI
  $BED7  40        RTI
  $BED8  40        RTI
  $BED9  40        RTI
  $BEDA  25 2B     AND $2B
  $BEDC  43        .db $43
  $BEDD  4F        .db $4F
  $BEDE  4D 50 4C  EOR $4C50
  $BEE1  45 54     EOR $54
  $BEE3  45 44     EOR $44
  $BEE5  5F        .db $5F
  $BEE6  40        RTI
  $BEE7  40        RTI
  $BEE8  40        RTI
  $BEE9  40        RTI
  $BEEA  25 6B     AND $6B
  $BEEC  47        .db $47
  $BEED  45 54     EOR $54
  $BEEF  40        RTI
  $BEF0  59 4F 55  EOR $554F,Y
  $BEF3  52        .db $52
  $BEF4  40        RTI
  $BEF5  40        RTI
  $BEF6  40        RTI
  $BEF7  40        RTI

L_BEF8:
  $BEF8  40        RTI
  $BEF9  40        RTI
  $BEFA  25 AB     AND $AB
  $BEFC  57        .db $57
  $BEFD  45 41     EOR $41
  $BEFF  50 4F     BVC $BF50
  $BF01  4E 53 40  LSR $4053
  $BF04  52        .db $52
  $BF05  45 41     EOR $41
  $BF07  44        .db $44
  $BF08  59 5F 24  EOR $245F,Y
  $BF0B  EB        .db $EB
  $BF0C  49 54     EOR #$54
  $BF0E  45 4D     EOR $4D
  $BF10  94 40     STY $40,X
  $BF12  40        RTI
  $BF13  40        RTI
  $BF14  40        RTI
  $BF15  40        RTI
  $BF16  40        RTI
  $BF17  40        RTI
  $BF18  40        RTI
  $BF19  40        RTI
  $BF1A  25 8B     AND $8B
  $BF1C  40        RTI
  $BF1D  40        RTI
  $BF1E  49 54     EOR #$54
  $BF20  45 4D     EOR $4D
  $BF22  94 A1     STY $A1,X
  $BF24  40        RTI
  $BF25  40        RTI
  $BF26  40        RTI
  $BF27  40        RTI
  $BF28  40        RTI
  $BF29  40        RTI
  $BF2A  25 8B     AND $8B
  $BF2C  40        RTI
  $BF2D  40        RTI
  $BF2E  49 54     EOR #$54
  $BF30  45 4D     EOR $4D
  $BF32  94 A2     STY $A2,X
  $BF34  40        RTI
  $BF35  40        RTI
  $BF36  40        RTI
  $BF37  40        RTI
  $BF38  40        RTI
  $BF39  40        RTI
  $BF3A  25 8B     AND $8B
  $BF3C  40        RTI
  $BF3D  40        RTI
  $BF3E  49 54     EOR #$54
  $BF40  45 4D     EOR $4D
  $BF42  94 A3     STY $A3,X
  $BF44  40        RTI
  $BF45  40        RTI
  $BF46  40        RTI
  $BF47  40        RTI
  $BF48  40        RTI
  $BF49  40        RTI
  $BF4A  25 CB     AND $CB
  $BF4C  40        RTI
  $BF4D  40        RTI
  $BF4E  94 42     STY $42,X

L_BF50:
  $BF50  4F        .db $4F
  $BF51  4F        .db $4F
  $BF52  4D 45 52  EOR $5245
  $BF55  41 4E     EOR ($4E,X)
  $BF57  47        .db $47
  $BF58  40        RTI
  $BF59  40        RTI
  $BF5A  2C 11 28  BIT $2811
  $BF5D  15 20     ORA $20,X
  $BF5F  11 20     ORA ($20),Y
  $BF61  19 20 00  ORA $0020,Y
  $BF64  34        .db $34
  $BF65  25 34     AND $34
  $BF67  14        .db $14
  $BF68  37        .db $37
  $BF69  18        CLC
  $BF6A  20 26 20  JSR $2026
  $BF6D  16 B0     ASL $B0,X
  $BF6F  C0 B0     CPY #$B0
  $BF71  22        .db $22
  $BF72  03        .db $03
  $BF73  40        RTI
  $BF74  20 10 36  JSR $3610
  $BF77  FF        .db $FF
  $BF78  FF        .db $FF
  $BF79  FF        .db $FF
  $BF7A  FF        .db $FF
  $BF7B  FF        .db $FF
  $BF7C  FF        .db $FF
  $BF7D  FF        .db $FF
  $BF7E  FF        .db $FF
  $BF7F  FF        .db $FF
  $BF80  FF        .db $FF
  $BF81  FF        .db $FF
  $BF82  FF        .db $FF
  $BF83  FF        .db $FF
  $BF84  FF        .db $FF
  $BF85  FF        .db $FF
  $BF86  FF        .db $FF
  $BF87  FF        .db $FF
  $BF88  FF        .db $FF
  $BF89  FF        .db $FF
  $BF8A  FF        .db $FF
  $BF8B  FF        .db $FF
  $BF8C  FF        .db $FF
  $BF8D  FF        .db $FF
  $BF8E  FF        .db $FF
  $BF8F  FF        .db $FF
  $BF90  FF        .db $FF
  $BF91  FF        .db $FF
  $BF92  FF        .db $FF
  $BF93  FF        .db $FF
  $BF94  FF        .db $FF
  $BF95  FF        .db $FF
  $BF96  FF        .db $FF
  $BF97  FF        .db $FF
  $BF98  FF        .db $FF
  $BF99  FF        .db $FF
  $BF9A  FF        .db $FF
  $BF9B  FF        .db $FF
  $BF9C  FF        .db $FF
  $BF9D  FF        .db $FF
  $BF9E  FF        .db $FF
  $BF9F  FF        .db $FF
  $BFA0  FF        .db $FF
  $BFA1  FF        .db $FF
  $BFA2  FF        .db $FF
  $BFA3  FF        .db $FF
  $BFA4  FF        .db $FF
  $BFA5  FF        .db $FF
  $BFA6  FF        .db $FF
  $BFA7  FF        .db $FF
  $BFA8  FF        .db $FF
  $BFA9  FF        .db $FF
  $BFAA  FF        .db $FF
  $BFAB  FF        .db $FF
  $BFAC  FF        .db $FF
  $BFAD  FF        .db $FF
  $BFAE  FF        .db $FF
  $BFAF  FF        .db $FF
  $BFB0  FF        .db $FF
  $BFB1  FF        .db $FF
  $BFB2  FF        .db $FF
  $BFB3  FF        .db $FF
  $BFB4  FF        .db $FF
  $BFB5  FF        .db $FF
  $BFB6  FF        .db $FF
  $BFB7  FF        .db $FF
  $BFB8  FF        .db $FF
  $BFB9  FF        .db $FF
  $BFBA  FF        .db $FF
  $BFBB  FF        .db $FF
  $BFBC  FF        .db $FF
  $BFBD  FF        .db $FF
  $BFBE  FF        .db $FF
  $BFBF  FF        .db $FF
  $BFC0  FF        .db $FF
  $BFC1  FF        .db $FF
  $BFC2  FF        .db $FF
  $BFC3  FF        .db $FF
  $BFC4  FF        .db $FF
  $BFC5  FF        .db $FF
  $BFC6  FF        .db $FF
  $BFC7  FF        .db $FF
  $BFC8  FF        .db $FF
  $BFC9  FF        .db $FF
  $BFCA  FF        .db $FF

L_BFCB:
  $BFCB  FF        .db $FF
  $BFCC  FF        .db $FF
  $BFCD  FF        .db $FF
  $BFCE  FF        .db $FF
  $BFCF  FF        .db $FF
  $BFD0  FF        .db $FF
  $BFD1  FF        .db $FF
  $BFD2  FF        .db $FF
  $BFD3  FF        .db $FF
  $BFD4  FF        .db $FF
  $BFD5  FF        .db $FF
  $BFD6  FF        .db $FF
  $BFD7  FF        .db $FF
  $BFD8  FF        .db $FF
  $BFD9  FF        .db $FF
  $BFDA  FF        .db $FF
  $BFDB  FF        .db $FF
  $BFDC  FF        .db $FF
  $BFDD  FF        .db $FF
  $BFDE  FF        .db $FF
  $BFDF  FF        .db $FF
  $BFE0  78        SEI
  $BFE1  EE E1 BF  INC $BFE1
  $BFE4  FF        .db $FF
  $BFE5  FF        .db $FF
  $BFE6  FF        .db $FF
  $BFE7  FF        .db $FF
  $BFE8  FF        .db $FF
  $BFE9  FF        .db $FF
  $BFEA  FF        .db $FF
  $BFEB  FF        .db $FF
  $BFEC  FF        .db $FF
  $BFED  FF        .db $FF
  $BFEE  FF        .db $FF
  $BFEF  FF        .db $FF
  $BFF0  FF        .db $FF
  $BFF1  FF        .db $FF
  $BFF2  FF        .db $FF
  $BFF3  FF        .db $FF
  $BFF4  FF        .db $FF
  $BFF5  FF        .db $FF
  $BFF6  FF        .db $FF
  $BFF7  FF        .db $FF
  $BFF8  FF        .db $FF
  $BFF9  FF        .db $FF
  $BFFA  F0 CF     BEQ $BFCB
  $BFFC  E0 BF     CPX #$BF
  $BFFE  E0 BF     CPX #$BF