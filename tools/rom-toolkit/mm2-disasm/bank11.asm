; Mega Man 2 — PRG Bank 11
; Base address: $8000
; Size: 16384 bytes

  $8000  4C 51 A4  JMP $A451
  $8003  A9 01     LDA #$01
  $8005  85 2B     STA $2B
  $8007  A4 B3     LDY $B3
  $8009  A5 AA     LDA $AA
  $800B  29 01     AND #$01
  $800D  F0 08     BEQ $8017
  $800F  B9 2B 80  LDA $802B,Y
  $8012  F0 03     BEQ $8017
  $8014  4C 63 80  JMP $8063

L_8017:
  $8017  A6 B1     LDX $B1
  $8019  10 03     BPL $801E
  $801B  4C D3 9F  JMP $9FD3

L_801E:
  $801E  B9 47 80  LDA $8047,Y
  $8021  85 08     STA $08
  $8023  B9 55 80  LDA $8055,Y
  $8026  85 09     STA $09
  $8028  6C 08 00  JMP ($0008)
  $802B  0F        .db $0F
  $802C  0F        .db $0F
  $802D  0F        .db $0F
  $802E  0F        .db $0F
  $802F  1E 0F 0F  ASL $0F0F,X
  $8032  0F        .db $0F
  $8033  0F        .db $0F
  $8034  0F        .db $0F
  $8035  0F        .db $0F
  $8036  0F        .db $0F
  $8037  0F        .db $0F
  $8038  0F        .db $0F
  $8039  00        BRK
  $803A  00        BRK
  $803B  00        BRK
  $803C  00        BRK
  $803D  01 00     ORA ($00,X)
  $803F  00        BRK
  $8040  00        BRK
  $8041  00        BRK
  $8042  00        BRK
  $8043  00        BRK
  $8044  00        BRK
  $8045  00        BRK
  $8046  00        BRK
  $8047  C5 E3     CMP $E3
  $8049  FB        .db $FB
  $804A  56 9E     LSR $9E,X
  $804C  56 20     LSR $20,X
  $804E  C3        .db $C3
  $804F  10 13     BPL $8064
  $8051  9B        .db $9B
  $8052  6E C0 2A  ROR $2AC0
  $8055  80        .db $80
  $8056  82        .db $82
  $8057  84 86     STY $86
  $8059  87        .db $87
  $805A  89        .db $89
  $805B  8B        .db $8B
  $805C  8C 8E 92  STY $928E
  $805F  93        .db $93
  $8060  96 96     STX $96,Y
  $8062  9B        .db $9B

L_8063:
  $8063  A9 00     LDA #$00
  $8065  8D 81 06  STA $0681
  $8068  20 2D A5  JSR $A52D
  $806B  A5 A9     LDA $A9
  $806D  C9 06     CMP #$06
  $806F  D0 53     BNE $80C4
  $8071  AD 22 04  LDA $0422
  $8074  10 4E     BPL $80C4
  $8076  A5 B1     LDA $B1
  $8078  C9 02     CMP #$02
  $807A  90 48     BCC $80C4
  $807C  A5 B3     LDA $B3
  $807E  C9 05     CMP #$05
  $8080  F0 04     BEQ $8086
  $8082  C9 0D     CMP #$0D
  $8084  D0 07     BNE $808D

L_8086:
  $8086  A9 1C     LDA #$1C
  $8088  8D C1 06  STA $06C1
  $808B  D0 37     BNE $80C4

L_808D:
  $808D  EE A6 05  INC $05A6
  $8090  A6 B3     LDX $B3
  $8092  AD A6 05  LDA $05A6
  $8095  DD 2B 80  CMP $802B,X
  $8098  D0 2A     BNE $80C4
  $809A  A9 00     LDA #$00
  $809C  8D A6 05  STA $05A6
  $809F  BD 39 80  LDA $8039,X
  $80A2  F0 20     BEQ $80C4
  $80A4  38        SEC
  $80A5  AD C1 06  LDA $06C1
  $80A8  FD 39 80  SBC $8039,X
  $80AB  F0 02     BEQ $80AF
  $80AD  B0 12     BCS $80C1

L_80AF:
  $80AF  A9 00     LDA #$00
  $80B1  4E 22 04  LSR $0422
  $80B4  A9 00     LDA #$00
  $80B6  85 AA     STA $AA
  $80B8  A9 01     LDA #$01
  $80BA  85 50     STA $50
  $80BC  EE AA 05  INC $05AA
  $80BF  A9 00     LDA #$00

L_80C1:
  $80C1  8D C1 06  STA $06C1

L_80C4:
  $80C4  60        RTS
  $80C5  CA        DEX
  $80C6  BD D9 82  LDA $82D9,X
  $80C9  85 08     STA $08
  $80CB  BD DE 82  LDA $82DE,X
  $80CE  85 09     STA $09
  $80D0  6C 08 00  JMP ($0008)
  $80D3  AD E1 04  LDA $04E1
  $80D6  D0 2A     BNE $8102
  $80D8  A4 B3     LDY $B3
  $80DA  B9 3E 81  LDA $813E,Y
  $80DD  85 01     STA $01
  $80DF  B9 46 81  LDA $8146,Y
  $80E2  85 02     STA $02
  $80E4  20 49 A2  JSR $A249
  $80E7  A5 00     LDA $00
  $80E9  D0 0C     BNE $80F7
  $80EB  A9 00     LDA #$00
  $80ED  8D A1 06  STA $06A1
  $80F0  8D 81 06  STA $0681

L_80F3:
  $80F3  20 4F A1  JSR $A14F
  $80F6  60        RTS

L_80F7:
  $80F7  A9 00     LDA #$00
  $80F9  8D 41 06  STA $0641
  $80FC  8D 61 06  STA $0661
  $80FF  EE E1 04  INC $04E1

L_8102:
  $8102  AD A1 06  LDA $06A1
  $8105  A4 B3     LDY $B3
  $8107  D9 4E 81  CMP $814E,Y
  $810A  D0 E7     BNE $80F3
  $810C  8D A1 06  STA $06A1
  $810F  A9 00     LDA #$00
  $8111  8D 81 06  STA $0681
  $8114  AD C1 06  LDA $06C1
  $8117  C9 1C     CMP #$1C
  $8119  D0 14     BNE $812F

L_811B:
  $811B  A9 02     LDA #$02
  $811D  85 B1     STA $B1
  $811F  A9 00     LDA #$00
  $8121  85 B2     STA $B2
  $8123  8D E1 04  STA $04E1
  $8126  A4 B3     LDY $B3
  $8128  B9 56 81  LDA $8156,Y
  $812B  20 0C A1  JSR $A10C
  $812E  60        RTS

L_812F:
  $812F  A5 1C     LDA $1C
  $8131  29 03     AND #$03
  $8133  D0 08     BNE $813D
  $8135  EE C1 06  INC $06C1
  $8138  A9 28     LDA #$28
  $813A  20 51 C0  JSR $C051

L_813D:
  $813D  60        RTS
  $813E  09 0C     ORA #$0C
  $8140  0F        .db $0F
  $8141  0A        ASL
  $8142  09 09     ORA #$09
  $8144  08        PHP
  $8145  08        PHP
  $8146  0C        .db $0C
  $8147  10 10     BPL $8159
  $8149  0C        .db $0C
  $814A  0C        .db $0C
  $814B  0C        .db $0C
  $814C  0C        .db $0C
  $814D  0C        .db $0C
  $814E  0F        .db $0F
  $814F  0F        .db $0F
  $8150  0B        .db $0B
  $8151  05 09     ORA $09
  $8153  07        .db $07
  $8154  05 03     ORA $03
  $8156  51 67     EOR ($67),Y
  $8158  6D 61 55  ADC $5561
  $815B  5C        .db $5C
  $815C  64        .db $64
  $815D  6A        ROR
  $815E  A9 58     LDA #$58
  $8160  20 2D A2  JSR $A22D
  $8163  B0 0A     BCS $816F
  $8165  AD A1 06  LDA $06A1
  $8168  D0 69     BNE $81D3
  $816A  8D 81 06  STA $0681
  $816D  F0 64     BEQ $81D3

L_816F:
  $816F  AD 81 06  LDA $0681
  $8172  D0 5F     BNE $81D3
  $8174  AD A1 06  LDA $06A1
  $8177  C9 02     CMP #$02
  $8179  D0 58     BNE $81D3
  $817B  20 09 A2  JSR $A209
  $817E  A5 00     LDA $00
  $8180  85 03     STA $03
  $8182  18        CLC
  $8183  69 20     ADC #$20
  $8185  85 02     STA $02
  $8187  38        SEC
  $8188  E9 40     SBC #$40
  $818A  B0 02     BCS $818E
  $818C  A9 00     LDA #$00

L_818E:
  $818E  85 04     STA $04
  $8190  A9 02     LDA #$02
  $8192  85 01     STA $01

L_8194:
  $8194  A6 01     LDX $01
  $8196  A9 00     LDA #$00
  $8198  85 0A     STA $0A
  $819A  85 0C     STA $0C
  $819C  B5 02     LDA $02,X
  $819E  85 0B     STA $0B
  $81A0  BD FA 81  LDA $81FA,X
  $81A3  85 0D     STA $0D
  $81A5  20 74 C8  JSR $C874
  $81A8  A2 01     LDX #$01
  $81AA  A9 58     LDA #$58
  $81AC  20 52 A3  JSR $A352
  $81AF  A6 01     LDX $01
  $81B1  BD F4 81  LDA $81F4,X
  $81B4  99 70 06  STA $0670,Y
  $81B7  BD F7 81  LDA $81F7,X
  $81BA  99 50 06  STA $0650,Y
  $81BD  A5 0E     LDA $0E
  $81BF  99 30 06  STA $0630,Y
  $81C2  A5 0F     LDA $0F
  $81C4  99 10 06  STA $0610,Y
  $81C7  B9 30 04  LDA $0430,Y
  $81CA  09 04     ORA #$04
  $81CC  99 30 04  STA $0430,Y
  $81CF  C6 01     DEC $01
  $81D1  10 C1     BPL $8194

L_81D3:
  $81D3  A2 01     LDX #$01
  $81D5  20 46 A1  JSR $A146
  $81D8  A5 02     LDA $02
  $81DA  C9 01     CMP #$01
  $81DC  D0 10     BNE $81EE
  $81DE  D0 0E     BNE $81EE
  $81E0  A9 04     LDA #$04
  $81E2  85 B1     STA $B1
  $81E4  A9 12     LDA #$12
  $81E6  8D A8 05  STA $05A8
  $81E9  A9 53     LDA #$53
  $81EB  20 0C A1  JSR $A10C

L_81EE:
  $81EE  60        RTS
  $81EF  0F        .db $0F
  $81F0  15 0F     ORA $0F,X
  $81F2  0F        .db $0F
  $81F3  0F        .db $0F
  $81F4  36 A8     ROL $A8,X
  $81F6  76 07     ROR $07,X
  $81F8  05 03     ORA $03
  $81FA  3A        .db $3A
  $81FB  2E 1C AD  ROL $AD1C
  $81FE  E1 04     SBC ($04,X)
  $8200  D0 35     BNE $8237
  $8202  AD A1 06  LDA $06A1
  $8205  C9 02     CMP #$02
  $8207  D0 05     BNE $820E
  $8209  A9 00     LDA #$00
  $820B  8D A1 06  STA $06A1

L_820E:
  $820E  C6 B2     DEC $B2
  $8210  D0 C1     BNE $81D3
  $8212  A9 03     LDA #$03
  $8214  8D A1 06  STA $06A1
  $8217  A9 00     LDA #$00
  $8219  8D 81 06  STA $0681
  $821C  A9 11     LDA #$11
  $821E  8D E1 06  STA $06E1
  $8221  20 09 A2  JSR $A209
  $8224  A5 00     LDA $00
  $8226  4A        LSR
  $8227  4A        LSR
  $8228  18        CLC
  $8229  69 0A     ADC #$0A
  $822B  85 B2     STA $B2
  $822D  A9 38     LDA #$38
  $822F  20 51 C0  JSR $C051
  $8232  EE E1 04  INC $04E1
  $8235  D0 9C     BNE $81D3

L_8237:
  $8237  C9 01     CMP #$01
  $8239  D0 34     BNE $826F
  $823B  AD A1 06  LDA $06A1
  $823E  C9 06     CMP #$06
  $8240  90 05     BCC $8247
  $8242  A0 04     LDY #$04
  $8244  8C 01 06  STY $0601

L_8247:
  $8247  C9 09     CMP #$09
  $8249  D0 05     BNE $8250
  $824B  A9 06     LDA #$06
  $824D  8D A1 06  STA $06A1

L_8250:
  $8250  A5 B2     LDA $B2
  $8252  F0 04     BEQ $8258
  $8254  C6 B2     DEC $B2
  $8256  D0 32     BNE $828A

L_8258:
  $8258  A9 00     LDA #$00
  $825A  8D 01 06  STA $0601
  $825D  8D 81 06  STA $0681
  $8260  A9 01     LDA #$01
  $8262  8D E1 06  STA $06E1
  $8265  A9 0A     LDA #$0A
  $8267  8D A1 06  STA $06A1
  $826A  EE E1 04  INC $04E1
  $826D  D0 1B     BNE $828A

L_826F:
  $826F  AD A1 06  LDA $06A1
  $8272  C9 0D     CMP #$0D
  $8274  D0 14     BNE $828A
  $8276  A9 50     LDA #$50
  $8278  20 0C A1  JSR $A10C
  $827B  A9 83     LDA #$83
  $827D  8D 21 04  STA $0421
  $8280  20 09 A2  JSR $A209
  $8283  FE A0 06  INC $06A0,X
  $8286  A9 05     LDA #$05
  $8288  85 B1     STA $B1

L_828A:
  $828A  4C D3 81  JMP $81D3
  $828D  1F        .db $1F
  $828E  3E 5D AD  ROL $AD5D,X
  $8291  A1 06     LDA ($06,X)
  $8293  F0 33     BEQ $82C8
  $8295  C6 B1     DEC $B1
  $8297  A9 8B     LDA #$8B
  $8299  AE 61 04  LDX $0461
  $829C  E0 80     CPX #$80
  $829E  B0 02     BCS $82A2
  $82A0  A9 CB     LDA #$CB

L_82A2:
  $82A2  8D 21 04  STA $0421
  $82A5  A9 00     LDA #$00
  $82A7  8D E1 04  STA $04E1
  $82AA  85 B4     STA $B4
  $82AC  A5 4A     LDA $4A
  $82AE  85 01     STA $01
  $82B0  A9 03     LDA #$03
  $82B2  85 02     STA $02
  $82B4  20 4E C8  JSR $C84E
  $82B7  A6 04     LDX $04
  $82B9  BD 8D 82  LDA $828D,X
  $82BC  85 B2     STA $B2
  $82BE  A9 52     LDA #$52
  $82C0  20 0C A1  JSR $A10C
  $82C3  A9 38     LDA #$38
  $82C5  20 51 C0  JSR $C051

L_82C8:
  $82C8  20 4F A1  JSR $A14F
  $82CB  60        RTS
  $82CC  AD A1 06  LDA $06A1
  $82CF  C9 04     CMP #$04
  $82D1  F0 03     BEQ $82D6
  $82D3  4C D3 81  JMP $81D3

L_82D6:
  $82D6  4C 1B 81  JMP $811B
  $82D9  D3        .db $D3
  $82DA  5E FD 90  LSR $90FD,X
  $82DD  CC 80 81  CPY $8180
  $82E0  81 82     STA ($82,X)
  $82E2  82        .db $82
  $82E3  CA        DEX
  $82E4  BD F3 84  LDA $84F3,X
  $82E7  85 08     STA $08
  $82E9  BD F7 84  LDA $84F7,X
  $82EC  85 09     STA $09
  $82EE  6C 08 00  JMP ($0008)
  $82F1  A9 00     LDA #$00
  $82F3  85 40     STA $40
  $82F5  85 4F     STA $4F
  $82F7  85 50     STA $50
  $82F9  A5 B2     LDA $B2
  $82FB  C9 03     CMP #$03
  $82FD  D0 1C     BNE $831B
  $82FF  A9 00     LDA #$00
  $8301  85 B2     STA $B2
  $8303  A9 68     LDA #$68
  $8305  20 0C A1  JSR $A10C
  $8308  AD 21 04  LDA $0421
  $830B  09 04     ORA #$04
  $830D  8D 21 04  STA $0421
  $8310  A9 04     LDA #$04
  $8312  85 B1     STA $B1
  $8314  A9 FF     LDA #$FF
  $8316  8D 41 06  STA $0641
  $8319  D0 5F     BNE $837A

L_831B:
  $831B  A5 4A     LDA $4A
  $831D  85 01     STA $01
  $831F  A9 05     LDA #$05
  $8321  85 02     STA $02
  $8323  20 4E C8  JSR $C84E
  $8326  A6 04     LDX $04
  $8328  BD 7E 83  LDA $837E,X
  $832B  8D E1 04  STA $04E1
  $832E  A5 04     LDA $04
  $8330  0A        ASL
  $8331  85 01     STA $01
  $8333  0A        ASL
  $8334  65 01     ADC $01
  $8336  85 01     STA $01
  $8338  A9 06     LDA #$06
  $833A  85 02     STA $02

L_833C:
  $833C  A9 5D     LDA #$5D
  $833E  A2 01     LDX #$01
  $8340  20 52 A3  JSR $A352
  $8343  A6 01     LDX $01
  $8345  BD 83 83  LDA $8383,X
  $8348  99 70 06  STA $0670,Y
  $834B  BD A1 83  LDA $83A1,X
  $834E  99 50 06  STA $0650,Y
  $8351  BD BF 83  LDA $83BF,X
  $8354  99 30 06  STA $0630,Y
  $8357  BD DD 83  LDA $83DD,X
  $835A  99 10 06  STA $0610,Y
  $835D  BD FB 83  LDA $83FB,X
  $8360  99 F0 04  STA $04F0,Y
  $8363  E6 01     INC $01
  $8365  C6 02     DEC $02
  $8367  D0 D3     BNE $833C
  $8369  A9 3F     LDA #$3F
  $836B  20 51 C0  JSR $C051
  $836E  E6 B2     INC $B2
  $8370  E6 B1     INC $B1
  $8372  A9 00     LDA #$00
  $8374  8D A1 06  STA $06A1
  $8377  8D 81 06  STA $0681

L_837A:
  $837A  20 D9 84  JSR $84D9
  $837D  60        RTS
  $837E  44        .db $44
  $837F  4A        LSR
  $8380  42        .db $42
  $8381  43        .db $43
  $8382  43        .db $43
  $8383  00        BRK
  $8384  F0 50     BEQ $83D6
  $8386  3C        .db $3C
  $8387  00        BRK
  $8388  00        BRK
  $8389  D3        .db $D3
  $838A  CD 68 0F  CMP $0F68
  $838D  1A        .db $1A
  $838E  00        BRK
  $838F  A7        .db $A7
  $8390  68        PLA
  $8391  00        BRK
  $8392  7F        .db $7F
  $8393  B1 A7     LDA ($A7),Y
  $8395  88        DEY
  $8396  50 D4     BVC $836C
  $8398  D0 D0     BNE $836A
  $839A  B9 98 50  LDA $5098,Y
  $839D  3C        .db $3C
  $839E  1A        .db $1A
  $839F  7C        .db $7C
  $83A0  35 04     AND $04,X
  $83A2  03        .db $03
  $83A3  03        .db $03
  $83A4  02        .db $02
  $83A5  02        .db $02
  $83A6  00        BRK
  $83A7  03        .db $03
  $83A8  03        .db $03
  $83A9  02        .db $02
  $83AA  02        .db $02
  $83AB  01 00     ORA ($00,X)
  $83AD  03        .db $03
  $83AE  02        .db $02
  $83AF  02        .db $02
  $83B0  01 00     ORA ($00,X)
  $83B2  FF        .db $FF
  $83B3  03        .db $03
  $83B4  03        .db $03
  $83B5  02        .db $02

L_83B6:
  $83B6  01 01     ORA ($01,X)
  $83B8  FF        .db $FF
  $83B9  03        .db $03
  $83BA  03        .db $03
  $83BB  02        .db $02
  $83BC  01 00     ORA ($00,X)
  $83BE  00        BRK
  $83BF  00        BRK
  $83C0  B1 3C     LDA ($3C),Y
  $83C2  50 76     BVC $843A
  $83C4  00        BRK
  $83C5  2B        .db $2B
  $83C6  3C        .db $3C
  $83C7  31 6B     AND ($6B),Y
  $83C9  DB        .db $DB
  $83CA  00        BRK
  $83CB  A0 31     LDY #$31

L_83CD:
  $83CD  76 B5     ROR $B5,X
  $83CF  F0 FC     BEQ $83CD
  $83D1  E0 3C     CPX #$3C
  $83D3  D4        .db $D4
  $83D4  90 90     BCC $8366

L_83D6:
  $83D6  FD C0 3C  SBC $3CC0,X
  $83D9  50 DB     BVC $83B6
  $83DB  F8        SED
  $83DC  FE 00 00  INC $0000,X
  $83DF  02        .db $02
  $83E0  03        .db $03
  $83E1  03        .db $03
  $83E2  04        .db $04
  $83E3  01 01     ORA ($01,X)
  $83E5  03        .db $03
  $83E6  03        .db $03
  $83E7  03        .db $03
  $83E8  04        .db $04
  $83E9  01 03     ORA ($03,X)
  $83EB  03        .db $03
  $83EC  03        .db $03
  $83ED  03        .db $03
  $83EE  03        .db $03
  $83EF  01 02     ORA ($02,X)
  $83F1  02        .db $02
  $83F2  03        .db $03
  $83F3  03        .db $03
  $83F4  03        .db $03
  $83F5  01 02     ORA ($02,X)
  $83F7  03        .db $03
  $83F8  03        .db $03
  $83F9  03        .db $03
  $83FA  03        .db $03
  $83FB  0C        .db $0C
  $83FC  16 24     ASL $24,X
  $83FE  0E 24 18  ASL $1824
  $8401  1B        .db $1B
  $8402  0E 1E 2A  ASL $2A1E
  $8405  1D 0C 0D  ORA $0D0C,X
  $8408  0A        ASL
  $8409  20 15 22  JSR $2215
  $840C  18        CLC
  $840D  21 15     AND ($15,X)
  $840F  05 0D     ORA $0D
  $8411  23        .db $23
  $8412  1C        .db $1C
  $8413  1A        .db $1A
  $8414  0E 1C 1D  ASL $1D1C
  $8417  10 24     BPL $843D
  $8419  AD E1 04  LDA $04E1
  $841C  F0 0C     BEQ $842A

L_841E:
  $841E  A9 00     LDA #$00
  $8420  8D 81 06  STA $0681
  $8423  CE E1 04  DEC $04E1
  $8426  20 D9 84  JSR $84D9
  $8429  60        RTS

L_842A:
  $842A  A9 5D     LDA #$5D
  $842C  20 2D A2  JSR $A22D
  $842F  90 05     BCC $8436
  $8431  C6 B1     DEC $B1
  $8433  4C 1E 84  JMP $841E

L_8436:
  $8436  A9 01     LDA #$01
  $8438  85 40     STA $40

L_843A:
  $843A  AD 21 04  LDA $0421

L_843D:
  $843D  29 40     AND #$40
  $843F  85 AF     STA $AF
  $8441  18        CLC
  $8442  A5 4F     LDA $4F
  $8444  69 10     ADC #$10
  $8446  85 4F     STA $4F
  $8448  A5 50     LDA $50
  $844A  69 00     ADC #$00
  $844C  85 50     STA $50
  $844E  C9 04     CMP #$04
  $8450  D0 04     BNE $8456
  $8452  A9 00     LDA #$00
  $8454  85 4F     STA $4F

L_8456:
  $8456  A0 0F     LDY #$0F
  $8458  A9 5D     LDA #$5D
  $845A  85 00     STA $00

L_845C:
  $845C  20 31 A2  JSR $A231
  $845F  B0 0D     BCS $846E
  $8461  A5 4F     LDA $4F
  $8463  99 30 06  STA $0630,Y
  $8466  A5 50     LDA $50
  $8468  99 10 06  STA $0610,Y
  $846B  88        DEY
  $846C  10 EE     BPL $845C

L_846E:
  $846E  AD A1 06  LDA $06A1
  $8471  C9 03     CMP #$03
  $8473  D0 05     BNE $847A
  $8475  A9 01     LDA #$01
  $8477  8D A1 06  STA $06A1

L_847A:
  $847A  A2 01     LDX #$01
  $847C  20 D9 84  JSR $84D9
  $847F  60        RTS
  $8480  20 D9 84  JSR $84D9
  $8483  A9 0B     LDA #$0B
  $8485  85 01     STA $01
  $8487  A9 10     LDA #$10
  $8489  85 02     STA $02
  $848B  20 D4 A2  JSR $A2D4
  $848E  A5 00     LDA $00
  $8490  F0 3A     BEQ $84CC
  $8492  A6 B2     LDX $B2
  $8494  BD CD 84  LDA $84CD,X
  $8497  8D 61 06  STA $0661
  $849A  BD D0 84  LDA $84D0,X
  $849D  8D 41 06  STA $0641
  $84A0  BD D3 84  LDA $84D3,X
  $84A3  8D 21 06  STA $0621
  $84A6  BD D6 84  LDA $84D6,X
  $84A9  8D 01 06  STA $0601
  $84AC  E6 B2     INC $B2
  $84AE  A5 B2     LDA $B2
  $84B0  C9 03     CMP #$03
  $84B2  D0 18     BNE $84CC
  $84B4  A9 02     LDA #$02
  $84B6  85 B1     STA $B1
  $84B8  AD 21 04  LDA $0421
  $84BB  29 FB     AND #$FB
  $84BD  49 40     EOR #$40
  $84BF  8D 21 04  STA $0421
  $84C2  A9 00     LDA #$00
  $84C4  85 B2     STA $B2
  $84C6  A9 67     LDA #$67
  $84C8  20 0C A1  JSR $A10C
  $84CB  60        RTS

L_84CC:
  $84CC  60        RTS
  $84CD  E6 76     INC $76
  $84CF  00        BRK
  $84D0  04        .db $04
  $84D1  07        .db $07
  $84D2  00        BRK
  $84D3  39 9A 00  AND $009A,Y
  $84D6  01 01     ORA ($01,X)
  $84D8  00        BRK

L_84D9:
  $84D9  AD A8 05  LDA $05A8
  $84DC  F0 06     BEQ $84E4
  $84DE  20 4F A1  JSR $A14F
  $84E1  4C F2 84  JMP $84F2

L_84E4:
  $84E4  20 46 A1  JSR $A146
  $84E7  A5 02     LDA $02
  $84E9  C9 01     CMP #$01
  $84EB  D0 05     BNE $84F2
  $84ED  A9 12     LDA #$12
  $84EF  8D A8 05  STA $05A8

L_84F2:
  $84F2  60        RTS
  $84F3  D3        .db $D3
  $84F4  F1 19     SBC ($19),Y
  $84F6  80        .db $80
  $84F7  80        .db $80
  $84F8  82        .db $82
  $84F9  84 84     STY $84
  $84FB  CA        DEX
  $84FC  BD 4E 86  LDA $864E,X
  $84FF  85 08     STA $08
  $8501  BD 52 86  LDA $8652,X
  $8504  85 09     STA $09
  $8506  6C 08 00  JMP ($0008)
  $8509  20 09 A2  JSR $A209
  $850C  AD E1 04  LDA $04E1
  $850F  D0 0D     BNE $851E
  $8511  A9 61     LDA #$61
  $8513  A2 01     LDX #$01
  $8515  20 52 A3  JSR $A352
  $8518  EE E1 04  INC $04E1
  $851B  4C 7B 85  JMP $857B

L_851E:
  $851E  C9 04     CMP #$04
  $8520  B0 19     BCS $853B

L_8522:
  $8522  E6 B2     INC $B2
  $8524  A5 B2     LDA $B2
  $8526  C9 12     CMP #$12
  $8528  D0 0E     BNE $8538
  $852A  A9 00     LDA #$00
  $852C  85 B2     STA $B2
  $852E  EE E1 04  INC $04E1

L_8531:
  $8531  A9 62     LDA #$62
  $8533  A2 01     LDX #$01
  $8535  20 52 A3  JSR $A352

L_8538:
  $8538  4C 7B 85  JMP $857B

L_853B:
  $853B  A9 62     LDA #$62
  $853D  20 2D A2  JSR $A22D
  $8540  90 39     BCC $857B
  $8542  A9 03     LDA #$03
  $8544  85 02     STA $02

L_8546:
  $8546  A9 62     LDA #$62
  $8548  A2 01     LDX #$01
  $854A  20 52 A3  JSR $A352
  $854D  B0 25     BCS $8574
  $854F  A6 02     LDX $02
  $8551  A9 C1     LDA #$C1
  $8553  99 30 04  STA $0430,Y
  $8556  A9 20     LDA #$20
  $8558  99 B0 04  STA $04B0,Y
  $855B  A9 01     LDA #$01
  $855D  99 F0 04  STA $04F0,Y
  $8560  A9 FE     LDA #$FE
  $8562  99 50 06  STA $0650,Y
  $8565  A9 02     LDA #$02
  $8567  99 10 06  STA $0610,Y
  $856A  BD 7F 85  LDA $857F,X
  $856D  99 70 04  STA $0470,Y
  $8570  C6 02     DEC $02
  $8572  10 D2     BPL $8546

L_8574:
  $8574  E6 B1     INC $B1
  $8576  A9 6F     LDA #$6F
  $8578  20 0C A1  JSR $A10C

L_857B:
  $857B  20 36 86  JSR $8636
  $857E  60        RTS
  $857F  40        RTI
  $8580  70 A0     BVS $8522
  $8582  D0 AD     BNE $8531
  $8584  A1 06     LDA ($06,X)
  $8586  C9 02     CMP #$02
  $8588  90 2D     BCC $85B7
  $858A  D0 24     BNE $85B0
  $858C  AD 81 06  LDA $0681
  $858F  D0 26     BNE $85B7
  $8591  A9 61     LDA #$61
  $8593  20 2D A2  JSR $A22D
  $8596  B0 1F     BCS $85B7
  $8598  A9 04     LDA #$04
  $859A  99 10 06  STA $0610,Y
  $859D  B9 30 04  LDA $0430,Y
  $85A0  29 BF     AND #$BF
  $85A2  85 00     STA $00
  $85A4  AD 21 04  LDA $0421
  $85A7  29 40     AND #$40
  $85A9  05 00     ORA $00
  $85AB  99 30 04  STA $0430,Y
  $85AE  D0 07     BNE $85B7

L_85B0:
  $85B0  A9 6E     LDA #$6E
  $85B2  20 0C A1  JSR $A10C
  $85B5  E6 B1     INC $B1

L_85B7:
  $85B7  20 36 86  JSR $8636
  $85BA  60        RTS
  $85BB  20 36 86  JSR $8636
  $85BE  AD A1 06  LDA $06A1
  $85C1  C9 02     CMP #$02
  $85C3  90 70     BCC $8635
  $85C5  D0 52     BNE $8619
  $85C7  AD 81 06  LDA $0681
  $85CA  D0 12     BNE $85DE
  $85CC  A9 04     LDA #$04
  $85CE  8D 41 06  STA $0641
  $85D1  A9 01     LDA #$01
  $85D3  8D 01 06  STA $0601
  $85D6  AD 21 04  LDA $0421
  $85D9  09 04     ORA #$04
  $85DB  8D 21 04  STA $0421

L_85DE:
  $85DE  A9 01     LDA #$01
  $85E0  8D 81 06  STA $0681
  $85E3  AD 41 06  LDA $0641
  $85E6  08        PHP
  $85E7  A9 0F     LDA #$0F
  $85E9  85 01     STA $01
  $85EB  A9 10     LDA #$10
  $85ED  85 02     STA $02
  $85EF  20 D4 A2  JSR $A2D4
  $85F2  28        PLP
  $85F3  10 40     BPL $8635
  $85F5  A5 00     LDA $00
  $85F7  F0 3C     BEQ $8635
  $85F9  A9 03     LDA #$03
  $85FB  8D A1 06  STA $06A1
  $85FE  A9 00     LDA #$00
  $8600  8D 41 06  STA $0641
  $8603  8D 61 06  STA $0661
  $8606  8D 01 06  STA $0601
  $8609  8D 81 06  STA $0681
  $860C  8D E1 04  STA $04E1
  $860F  85 B2     STA $B2
  $8611  AD 21 04  LDA $0421
  $8614  29 FB     AND #$FB
  $8616  8D 21 04  STA $0421

L_8619:
  $8619  AD A1 06  LDA $06A1
  $861C  C9 04     CMP #$04
  $861E  D0 15     BNE $8635
  $8620  A9 00     LDA #$00
  $8622  8D 81 06  STA $0681
  $8625  A9 62     LDA #$62
  $8627  20 2D A2  JSR $A22D
  $862A  90 09     BCC $8635
  $862C  A9 02     LDA #$02
  $862E  85 B1     STA $B1
  $8630  A9 6D     LDA #$6D
  $8632  20 0C A1  JSR $A10C

L_8635:
  $8635  60        RTS

L_8636:
  $8636  AD A8 05  LDA $05A8
  $8639  F0 04     BEQ $863F
  $863B  20 4F A1  JSR $A14F
  $863E  60        RTS

L_863F:
  $863F  20 46 A1  JSR $A146
  $8642  A5 02     LDA $02
  $8644  C9 01     CMP #$01
  $8646  D0 05     BNE $864D
  $8648  A9 12     LDA #$12
  $864A  8D A8 05  STA $05A8

L_864D:
  $864D  60        RTS
  $864E  D3        .db $D3
  $864F  09 83     ORA #$83
  $8651  BB        .db $BB
  $8652  80        .db $80
  $8653  85 85     STA $85
  $8655  85 CA     STA $CA
  $8657  BD 96 87  LDA $8796,X
  $865A  85 08     STA $08
  $865C  BD 9A 87  LDA $879A,X
  $865F  85 09     STA $09
  $8661  6C 08 00  JMP ($0008)
  $8664  A9 83     LDA #$83
  $8666  8D 21 04  STA $0421
  $8669  20 09 A2  JSR $A209
  $866C  BD A0 06  LDA $06A0,X
  $866F  D0 03     BNE $8674
  $8671  8D 81 06  STA $0681

L_8674:
  $8674  AD E1 04  LDA $04E1
  $8677  D0 27     BNE $86A0
  $8679  38        SEC
  $867A  AD A1 04  LDA $04A1
  $867D  ED A0 04  SBC $04A0
  $8680  B0 04     BCS $8686
  $8682  49 FF     EOR #$FF
  $8684  69 01     ADC #$01

L_8686:
  $8686  C9 03     CMP #$03
  $8688  B0 5C     BCS $86E6
  $868A  A5 4A     LDA $4A
  $868C  85 01     STA $01
  $868E  A9 03     LDA #$03
  $8690  85 02     STA $02
  $8692  20 4E C8  JSR $C84E
  $8695  E6 04     INC $04
  $8697  A5 04     LDA $04
  $8699  8D E1 04  STA $04E1
  $869C  A9 01     LDA #$01
  $869E  85 B2     STA $B2

L_86A0:
  $86A0  C6 B2     DEC $B2
  $86A2  D0 42     BNE $86E6
  $86A4  A9 1F     LDA #$1F
  $86A6  85 B2     STA $B2
  $86A8  A9 5B     LDA #$5B
  $86AA  A2 01     LDX #$01
  $86AC  20 52 A3  JSR $A352
  $86AF  A9 01     LDA #$01
  $86B1  8D A1 06  STA $06A1
  $86B4  CE E1 04  DEC $04E1
  $86B7  D0 2D     BNE $86E6
  $86B9  AD A0 04  LDA $04A0
  $86BC  48        PHA
  $86BD  A9 50     LDA #$50
  $86BF  8D A0 04  STA $04A0
  $86C2  A9 01     LDA #$01
  $86C4  85 09     STA $09
  $86C6  A9 60     LDA #$60
  $86C8  85 08     STA $08
  $86CA  A2 01     LDX #$01
  $86CC  86 2B     STX $2B
  $86CE  20 8C A3  JSR $A38C
  $86D1  68        PLA
  $86D2  8D A0 04  STA $04A0
  $86D5  A9 00     LDA #$00
  $86D7  85 B2     STA $B2
  $86D9  AD 21 04  LDA $0421
  $86DC  8D E1 04  STA $04E1
  $86DF  E6 B1     INC $B1
  $86E1  A9 62     LDA #$62
  $86E3  20 0C A1  JSR $A10C

L_86E6:
  $86E6  20 71 87  JSR $8771
  $86E9  60        RTS
  $86EA  AD E1 04  LDA $04E1
  $86ED  8D 21 04  STA $0421
  $86F0  20 71 87  JSR $8771
  $86F3  AD A1 04  LDA $04A1
  $86F6  C9 50     CMP #$50
  $86F8  B0 14     BCS $870E
  $86FA  A9 FF     LDA #$FF
  $86FC  8D 41 06  STA $0641
  $86FF  A9 00     LDA #$00
  $8701  8D 61 06  STA $0661
  $8704  8D 01 06  STA $0601
  $8707  8D 21 06  STA $0621
  $870A  A9 04     LDA #$04
  $870C  85 B1     STA $B1

L_870E:
  $870E  20 09 A2  JSR $A209
  $8711  A5 B2     LDA $B2
  $8713  D0 1A     BNE $872F
  $8715  38        SEC
  $8716  AD A1 04  LDA $04A1
  $8719  ED A0 04  SBC $04A0
  $871C  B0 04     BCS $8722
  $871E  49 FF     EOR #$FF
  $8720  69 01     ADC #$01

L_8722:
  $8722  C9 03     CMP #$03
  $8724  B0 21     BCS $8747
  $8726  A9 01     LDA #$01
  $8728  8D A7 05  STA $05A7
  $872B  A9 04     LDA #$04
  $872D  85 B2     STA $B2

L_872F:
  $872F  CE A7 05  DEC $05A7
  $8732  D0 13     BNE $8747
  $8734  A9 12     LDA #$12
  $8736  8D A7 05  STA $05A7
  $8739  A9 03     LDA #$03
  $873B  8D A1 06  STA $06A1
  $873E  A9 5A     LDA #$5A
  $8740  A2 01     LDX #$01
  $8742  20 52 A3  JSR $A352
  $8745  C6 B2     DEC $B2

L_8747:
  $8747  AD A1 06  LDA $06A1
  $874A  C9 02     CMP #$02
  $874C  D0 05     BNE $8753
  $874E  A9 00     LDA #$00
  $8750  8D A1 06  STA $06A1

L_8753:
  $8753  60        RTS
  $8754  20 71 87  JSR $8771
  $8757  A5 00     LDA $00
  $8759  F0 B3     BEQ $870E
  $875B  A9 02     LDA #$02
  $875D  85 B1     STA $B1
  $875F  A9 00     LDA #$00
  $8761  8D 41 06  STA $0641
  $8764  8D E1 04  STA $04E1
  $8767  85 B2     STA $B2
  $8769  A9 61     LDA #$61
  $876B  20 0C A1  JSR $A10C
  $876E  4C 47 87  JMP $8747

L_8771:
  $8771  AD A8 05  LDA $05A8
  $8774  F0 06     BEQ $877C
  $8776  20 4F A1  JSR $A14F
  $8779  4C 8A 87  JMP $878A

L_877C:
  $877C  20 46 A1  JSR $A146
  $877F  A5 02     LDA $02
  $8781  C9 01     CMP #$01
  $8783  D0 05     BNE $878A
  $8785  A9 12     LDA #$12
  $8787  8D A8 05  STA $05A8

L_878A:
  $878A  A9 09     LDA #$09
  $878C  85 01     STA $01
  $878E  A9 0C     LDA #$0C
  $8790  85 02     STA $02
  $8792  20 D4 A2  JSR $A2D4
  $8795  60        RTS
  $8796  D3        .db $D3
  $8797  64        .db $64
  $8798  EA        NOP
  $8799  54        .db $54
  $879A  80        .db $80
  $879B  86 86     STX $86
  $879D  87        .db $87
  $879E  CA        DEX
  $879F  BD 4C 89  LDA $894C,X
  $87A2  85 08     STA $08
  $87A4  BD 51 89  LDA $8951,X
  $87A7  85 09     STA $09
  $87A9  6C 08 00  JMP ($0008)
  $87AC  AD E1 04  LDA $04E1
  $87AF  D0 51     BNE $8802
  $87B1  A9 87     LDA #$87
  $87B3  8D 21 04  STA $0421
  $87B6  20 09 A2  JSR $A209
  $87B9  A5 4A     LDA $4A
  $87BB  85 01     STA $01
  $87BD  A9 03     LDA #$03
  $87BF  85 02     STA $02
  $87C1  20 4E C8  JSR $C84E
  $87C4  A6 04     LDX $04
  $87C6  A5 00     LDA $00
  $87C8  18        CLC
  $87C9  69 20     ADC #$20
  $87CB  85 01     STA $01
  $87CD  38        SEC
  $87CE  E9 40     SBC #$40
  $87D0  B0 02     BCS $87D4
  $87D2  A9 00     LDA #$00

L_87D4:
  $87D4  85 02     STA $02
  $87D6  A9 00     LDA #$00
  $87D8  8D 61 06  STA $0661
  $87DB  BD 93 88  LDA $8893,X
  $87DE  8D 41 06  STA $0641
  $87E1  B5 00     LDA $00,X
  $87E3  85 0B     STA $0B
  $87E5  BD 96 88  LDA $8896,X
  $87E8  85 0D     STA $0D
  $87EA  A9 00     LDA #$00
  $87EC  85 0A     STA $0A
  $87EE  85 0C     STA $0C
  $87F0  20 74 C8  JSR $C874
  $87F3  A5 0F     LDA $0F
  $87F5  8D 01 06  STA $0601
  $87F8  A5 0E     LDA $0E
  $87FA  8D 21 06  STA $0621
  $87FD  EE E1 04  INC $04E1
  $8800  E6 B2     INC $B2

L_8802:
  $8802  A9 08     LDA #$08
  $8804  85 01     STA $01
  $8806  A9 0C     LDA #$0C
  $8808  85 02     STA $02
  $880A  AD 41 06  LDA $0641
  $880D  08        PHP
  $880E  20 D4 A2  JSR $A2D4
  $8811  28        PLP
  $8812  10 12     BPL $8826
  $8814  A5 00     LDA $00
  $8816  F0 0E     BEQ $8826
  $8818  CE E1 04  DEC $04E1
  $881B  A5 B2     LDA $B2
  $881D  C9 03     CMP #$03
  $881F  D0 05     BNE $8826
  $8821  A2 01     LDX #$01
  $8823  4C 9E 88  JMP $889E

L_8826:
  $8826  AD A1 06  LDA $06A1
  $8829  D0 03     BNE $882E
  $882B  8D 81 06  STA $0681

L_882E:
  $882E  AD 41 06  LDA $0641
  $8831  08        PHP
  $8832  20 0E 89  JSR $890E
  $8835  28        PLP
  $8836  30 5A     BMI $8892
  $8838  AD 41 06  LDA $0641
  $883B  10 55     BPL $8892
  $883D  A5 B2     LDA $B2
  $883F  C9 02     CMP #$02
  $8841  D0 4F     BNE $8892
  $8843  A5 B1     LDA $B1
  $8845  C9 02     CMP #$02
  $8847  D0 49     BNE $8892
  $8849  A9 00     LDA #$00
  $884B  8D 81 06  STA $0681
  $884E  A9 01     LDA #$01
  $8850  8D A1 06  STA $06A1
  $8853  AD A0 04  LDA $04A0
  $8856  48        PHA
  $8857  38        SEC
  $8858  E9 18     SBC #$18
  $885A  8D A0 04  STA $04A0
  $885D  A9 03     LDA #$03
  $885F  85 02     STA $02

L_8861:
  $8861  A9 59     LDA #$59
  $8863  A2 01     LDX #$01
  $8865  20 52 A3  JSR $A352
  $8868  B0 24     BCS $888E
  $886A  98        TYA
  $886B  18        CLC
  $886C  69 10     ADC #$10
  $886E  AA        TAX
  $886F  85 2B     STA $2B
  $8871  A9 25     LDA #$25
  $8873  9D E0 04  STA $04E0,X
  $8876  A9 04     LDA #$04
  $8878  85 09     STA $09
  $887A  A9 00     LDA #$00
  $887C  85 08     STA $08
  $887E  20 8C A3  JSR $A38C
  $8881  18        CLC
  $8882  AD A0 04  LDA $04A0
  $8885  69 18     ADC #$18
  $8887  8D A0 04  STA $04A0
  $888A  C6 02     DEC $02
  $888C  D0 D3     BNE $8861

L_888E:
  $888E  68        PLA
  $888F  8D A0 04  STA $04A0

L_8892:
  $8892  60        RTS
  $8893  07        .db $07
  $8894  08        PHP
  $8895  04        .db $04
  $8896  38        SEC
  $8897  40        RTI
  $8898  20 20 09  JSR $0920
  $889B  A2 A2     LDX #$A2
  $889D  00        BRK

L_889E:
  $889E  A9 00     LDA #$00
  $88A0  8D E1 04  STA $04E1
  $88A3  85 B2     STA $B2
  $88A5  BD B4 88  LDA $88B4,X
  $88A8  85 B1     STA $B1
  $88AA  BD B6 88  LDA $88B6,X
  $88AD  20 0C A1  JSR $A10C
  $88B0  20 03 89  JSR $8903
  $88B3  60        RTS
  $88B4  02        .db $02
  $88B5  05 55     ORA $55
  $88B7  58        CLI
  $88B8  CE E1 04  DEC $04E1
  $88BB  F0 2A     BEQ $88E7
  $88BD  20 03 89  JSR $8903
  $88C0  60        RTS
  $88C1  AD E1 04  LDA $04E1
  $88C4  D0 14     BNE $88DA
  $88C6  A9 87     LDA #$87
  $88C8  8D 21 04  STA $0421
  $88CB  20 09 A2  JSR $A209
  $88CE  A9 02     LDA #$02
  $88D0  8D 01 06  STA $0601
  $88D3  A9 3E     LDA #$3E
  $88D5  85 B2     STA $B2
  $88D7  EE E1 04  INC $04E1

L_88DA:
  $88DA  C6 B2     DEC $B2
  $88DC  D0 05     BNE $88E3
  $88DE  A2 00     LDX #$00
  $88E0  20 9E 88  JSR $889E

L_88E3:
  $88E3  20 03 89  JSR $8903
  $88E6  60        RTS

L_88E7:
  $88E7  A9 00     LDA #$00
  $88E9  8D E1 04  STA $04E1
  $88EC  85 B2     STA $B2
  $88EE  A9 03     LDA #$03
  $88F0  85 B1     STA $B1
  $88F2  A9 56     LDA #$56
  $88F4  20 0C A1  JSR $A10C
  $88F7  A9 0B     LDA #$0B
  $88F9  85 01     STA $01
  $88FB  A9 0C     LDA #$0C
  $88FD  85 02     STA $02
  $88FF  20 2E A1  JSR $A12E
  $8902  60        RTS

L_8903:
  $8903  A9 08     LDA #$08
  $8905  85 01     STA $01
  $8907  A9 0C     LDA #$0C
  $8909  85 02     STA $02
  $890B  20 D4 A2  JSR $A2D4

L_890E:
  $890E  AD A8 05  LDA $05A8
  $8911  F0 06     BEQ $8919
  $8913  20 4F A1  JSR $A14F
  $8916  4C 4B 89  JMP $894B

L_8919:
  $8919  20 46 A1  JSR $A146
  $891C  A5 02     LDA $02
  $891E  F0 2B     BEQ $894B
  $8920  C9 01     CMP #$01
  $8922  D0 07     BNE $892B
  $8924  A9 12     LDA #$12
  $8926  8D A8 05  STA $05A8
  $8929  D0 20     BNE $894B

L_892B:
  $892B  A9 00     LDA #$00
  $892D  8D 01 06  STA $0601
  $8930  8D 21 06  STA $0621
  $8933  A9 FF     LDA #$FF
  $8935  8D 41 06  STA $0641
  $8938  A9 C0     LDA #$C0
  $893A  8D 61 06  STA $0661
  $893D  A9 57     LDA #$57
  $893F  20 0C A1  JSR $A10C
  $8942  A9 04     LDA #$04
  $8944  85 B1     STA $B1
  $8946  A9 3E     LDA #$3E
  $8948  8D E1 04  STA $04E1

L_894B:
  $894B  60        RTS
  $894C  D3        .db $D3
  $894D  AC 99 B8  LDY $B899
  $8950  C1 80     CMP ($80,X)
  $8952  87        .db $87
  $8953  88        DEY
  $8954  88        DEY
  $8955  88        DEY
  $8956  CA        DEX
  $8957  BD 16 8B  LDA $8B16,X
  $895A  85 08     STA $08
  $895C  BD 1B 8B  LDA $8B1B,X
  $895F  85 09     STA $09
  $8961  6C 08 00  JMP ($0008)
  $8964  AD 21 04  LDA $0421
  $8967  09 04     ORA #$04
  $8969  8D 21 04  STA $0421
  $896C  A9 06     LDA #$06
  $896E  8D 21 06  STA $0621
  $8971  A9 01     LDA #$01
  $8973  8D 01 06  STA $0601
  $8976  E6 B2     INC $B2
  $8978  A5 B2     LDA $B2
  $897A  C9 BB     CMP #$BB
  $897C  90 1C     BCC $899A
  $897E  A9 00     LDA #$00
  $8980  8D E1 04  STA $04E1
  $8983  A9 03     LDA #$03
  $8985  85 B1     STA $B1
  $8987  A9 5A     LDA #$5A
  $8989  20 0C A1  JSR $A10C
  $898C  A9 03     LDA #$03
  $898E  8D A1 06  STA $06A1
  $8991  20 E4 8A  JSR $8AE4
  $8994  A9 21     LDA #$21
  $8996  20 51 C0  JSR $C051
  $8999  60        RTS

L_899A:
  $899A  20 E4 8A  JSR $8AE4
  $899D  A5 03     LDA $03
  $899F  F0 14     BEQ $89B5
  $89A1  A5 B1     LDA $B1
  $89A3  C9 06     CMP #$06
  $89A5  F0 0E     BEQ $89B5
  $89A7  A9 00     LDA #$00
  $89A9  8D E1 04  STA $04E1
  $89AC  A9 05     LDA #$05
  $89AE  85 B1     STA $B1
  $89B0  A9 5D     LDA #$5D
  $89B2  20 0C A1  JSR $A10C

L_89B5:
  $89B5  60        RTS
  $89B6  A9 00     LDA #$00
  $89B8  8D 21 06  STA $0621
  $89BB  8D 01 06  STA $0601
  $89BE  AD A1 06  LDA $06A1
  $89C1  C9 07     CMP #$07
  $89C3  D0 43     BNE $8A08
  $89C5  A9 5F     LDA #$5F
  $89C7  8D 0F 04  STA $040F
  $89CA  A9 80     LDA #$80
  $89CC  8D 2F 04  STA $042F
  $89CF  8D 6F 04  STA $046F
  $89D2  8D AF 04  STA $04AF
  $89D5  AD 41 04  LDA $0441
  $89D8  8D 4F 04  STA $044F
  $89DB  A9 00     LDA #$00
  $89DD  8D 6F 06  STA $066F
  $89E0  8D 4F 06  STA $064F
  $89E3  8D 0F 06  STA $060F
  $89E6  8D 2F 06  STA $062F
  $89E9  8D 8F 06  STA $068F
  $89EC  8D AF 06  STA $06AF
  $89EF  A9 04     LDA #$04
  $89F1  85 AA     STA $AA
  $89F3  A9 20     LDA #$20
  $89F5  8D 66 03  STA $0366
  $89F8  A9 06     LDA #$06
  $89FA  8D E1 04  STA $04E1
  $89FD  A9 1F     LDA #$1F
  $89FF  85 B2     STA $B2
  $8A01  E6 B1     INC $B1
  $8A03  A9 5B     LDA #$5B
  $8A05  20 0C A1  JSR $A10C

L_8A08:
  $8A08  20 E4 8A  JSR $8AE4
  $8A0B  60        RTS
  $8A0C  A9 0F     LDA #$0F
  $8A0E  8D 66 03  STA $0366
  $8A11  AD A1 06  LDA $06A1
  $8A14  F0 F2     BEQ $8A08
  $8A16  C9 02     CMP #$02
  $8A18  D0 1B     BNE $8A35
  $8A1A  A9 02     LDA #$02
  $8A1C  85 B1     STA $B1
  $8A1E  A9 00     LDA #$00
  $8A20  85 AA     STA $AA
  $8A22  85 B2     STA $B2
  $8A24  8D E1 04  STA $04E1
  $8A27  4E 2F 04  LSR $042F
  $8A2A  A9 5C     LDA #$5C
  $8A2C  20 0C A1  JSR $A10C
  $8A2F  20 09 A2  JSR $A209
  $8A32  4C 08 8A  JMP $8A08

L_8A35:
  $8A35  20 09 A2  JSR $A209
  $8A38  A9 00     LDA #$00
  $8A3A  8D 81 06  STA $0681
  $8A3D  C6 B2     DEC $B2
  $8A3F  D0 C7     BNE $8A08
  $8A41  A9 06     LDA #$06
  $8A43  85 B2     STA $B2
  $8A45  AD A0 04  LDA $04A0
  $8A48  48        PHA
  $8A49  A5 4A     LDA $4A
  $8A4B  85 01     STA $01
  $8A4D  A9 50     LDA #$50
  $8A4F  85 02     STA $02
  $8A51  20 4E C8  JSR $C84E
  $8A54  38        SEC
  $8A55  AD A1 04  LDA $04A1
  $8A58  E9 28     SBC #$28
  $8A5A  18        CLC
  $8A5B  65 04     ADC $04
  $8A5D  8D A0 04  STA $04A0
  $8A60  A9 35     LDA #$35
  $8A62  A2 01     LDX #$01
  $8A64  20 52 A3  JSR $A352
  $8A67  B0 31     BCS $8A9A
  $8A69  18        CLC
  $8A6A  98        TYA
  $8A6B  69 10     ADC #$10
  $8A6D  AA        TAX
  $8A6E  86 2B     STX $2B
  $8A70  A9 08     LDA #$08
  $8A72  85 09     STA $09
  $8A74  A9 00     LDA #$00
  $8A76  85 08     STA $08
  $8A78  A0 00     LDY #$00
  $8A7A  AD 21 04  LDA $0421
  $8A7D  29 40     AND #$40
  $8A7F  48        PHA
  $8A80  D0 01     BNE $8A83
  $8A82  C8        INY

L_8A83:
  $8A83  18        CLC
  $8A84  BD 60 04  LDA $0460,X
  $8A87  79 AB 8A  ADC $8AAB,Y
  $8A8A  9D 60 04  STA $0460,X
  $8A8D  68        PLA
  $8A8E  A8        TAY
  $8A8F  A9 60     LDA #$60
  $8A91  85 00     STA $00
  $8A93  20 A3 A3  JSR $A3A3
  $8A96  A9 01     LDA #$01
  $8A98  85 2B     STA $2B

L_8A9A:
  $8A9A  68        PLA
  $8A9B  8D A0 04  STA $04A0
  $8A9E  A2 01     LDX #$01
  $8AA0  CE E1 04  DEC $04E1
  $8AA3  D0 03     BNE $8AA8
  $8AA5  EE A1 06  INC $06A1

L_8AA8:
  $8AA8  4C 08 8A  JMP $8A08
  $8AAB  08        PHP
  $8AAC  F8        SED
  $8AAD  AD E1 04  LDA $04E1
  $8AB0  D0 18     BNE $8ACA
  $8AB2  20 09 A2  JSR $A209
  $8AB5  A9 00     LDA #$00
  $8AB7  8D 61 06  STA $0661
  $8ABA  8D 01 06  STA $0601
  $8ABD  A9 04     LDA #$04
  $8ABF  8D 41 06  STA $0641
  $8AC2  A9 80     LDA #$80
  $8AC4  8D 21 06  STA $0621
  $8AC7  EE E1 04  INC $04E1

L_8ACA:
  $8ACA  20 E4 8A  JSR $8AE4
  $8ACD  D0 01     BNE $8AD0

L_8ACF:
  $8ACF  60        RTS

L_8AD0:
  $8AD0  A5 B1     LDA $B1
  $8AD2  C9 06     CMP #$06
  $8AD4  F0 F9     BEQ $8ACF
  $8AD6  A9 00     LDA #$00
  $8AD8  8D E1 04  STA $04E1
  $8ADB  A9 02     LDA #$02
  $8ADD  85 B1     STA $B1
  $8ADF  A9 5C     LDA #$5C
  $8AE1  20 0C A1  JSR $A10C

L_8AE4:
  $8AE4  AD A8 05  LDA $05A8
  $8AE7  F0 06     BEQ $8AEF
  $8AE9  20 4F A1  JSR $A14F
  $8AEC  4C FE 8A  JMP $8AFE

L_8AEF:
  $8AEF  20 46 A1  JSR $A146
  $8AF2  A5 02     LDA $02
  $8AF4  C9 01     CMP #$01
  $8AF6  D0 06     BNE $8AFE
  $8AF8  A9 12     LDA #$12
  $8AFA  8D A8 05  STA $05A8
  $8AFD  60        RTS

L_8AFE:
  $8AFE  A9 08     LDA #$08
  $8B00  85 01     STA $01
  $8B02  A9 0C     LDA #$0C
  $8B04  85 02     STA $02
  $8B06  AD 41 06  LDA $0641
  $8B09  08        PHP
  $8B0A  20 D4 A2  JSR $A2D4
  $8B0D  28        PLP
  $8B0E  10 03     BPL $8B13
  $8B10  A5 00     LDA $00
  $8B12  60        RTS

L_8B13:
  $8B13  A9 00     LDA #$00
  $8B15  60        RTS
  $8B16  D3        .db $D3
  $8B17  64        .db $64
  $8B18  B6 0C     LDX $0C,Y
  $8B1A  AD 80 89  LDA $8980
  $8B1D  89        .db $89
  $8B1E  8A        TXA
  $8B1F  8A        TXA
  $8B20  CA        DEX
  $8B21  BD BB 8C  LDA $8CBB,X
  $8B24  85 08     STA $08
  $8B26  BD BF 8C  LDA $8CBF,X
  $8B29  85 09     STA $09
  $8B2B  6C 08 00  JMP ($0008)
  $8B2E  A9 87     LDA #$87
  $8B30  8D 21 04  STA $0421
  $8B33  20 09 A2  JSR $A209
  $8B36  A5 27     LDA $27
  $8B38  29 02     AND #$02
  $8B3A  D0 06     BNE $8B42
  $8B3C  A5 B2     LDA $B2
  $8B3E  C9 BB     CMP #$BB
  $8B40  D0 13     BNE $8B55

L_8B42:
  $8B42  A5 4A     LDA $4A
  $8B44  85 01     STA $01
  $8B46  A9 03     LDA #$03
  $8B48  85 02     STA $02
  $8B4A  20 4E C8  JSR $C84E
  $8B4D  A6 04     LDX $04
  $8B4F  20 74 8B  JSR $8B74
  $8B52  4C 6E 8B  JMP $8B6E

L_8B55:
  $8B55  A5 00     LDA $00
  $8B57  C9 48     CMP #$48
  $8B59  B0 13     BCS $8B6E
  $8B5B  A9 87     LDA #$87
  $8B5D  AC 61 04  LDY $0461
  $8B60  C0 80     CPY #$80
  $8B62  B0 02     BCS $8B66
  $8B64  09 40     ORA #$40

L_8B66:
  $8B66  8D 21 04  STA $0421
  $8B69  A2 03     LDX #$03
  $8B6B  20 74 8B  JSR $8B74

L_8B6E:
  $8B6E  E6 B2     INC $B2
  $8B70  20 3E 8C  JSR $8C3E
  $8B73  60        RTS

L_8B74:
  $8B74  A9 65     LDA #$65
  $8B76  20 0C A1  JSR $A10C
  $8B79  A9 01     LDA #$01
  $8B7B  85 B2     STA $B2
  $8B7D  BD A1 8B  LDA $8BA1,X
  $8B80  8D 61 06  STA $0661
  $8B83  BD A5 8B  LDA $8BA5,X
  $8B86  8D 41 06  STA $0641
  $8B89  BD A9 8B  LDA $8BA9,X
  $8B8C  8D 21 06  STA $0621
  $8B8F  BD AD 8B  LDA $8BAD,X
  $8B92  8D 01 06  STA $0601
  $8B95  BD B1 8B  LDA $8BB1,X
  $8B98  85 B1     STA $B1
  $8B9A  AD 21 04  LDA $0421
  $8B9D  8D E1 04  STA $04E1
  $8BA0  60        RTS
  $8BA1  ED A8 00  SBC $00A8
  $8BA4  00        BRK
  $8BA5  06 05     ASL $05
  $8BA7  04        .db $04
  $8BA8  08        PHP
  $8BA9  00        BRK
  $8BAA  00        BRK
  $8BAB  00        BRK
  $8BAC  20 00 00  JSR $0000
  $8BAF  00        BRK
  $8BB0  02        .db $02
  $8BB1  03        .db $03
  $8BB2  03        .db $03
  $8BB3  03        .db $03
  $8BB4  04        .db $04
  $8BB5  AD E1 04  LDA $04E1
  $8BB8  8D 21 04  STA $0421
  $8BBB  20 3E 8C  JSR $8C3E
  $8BBE  A5 00     LDA $00
  $8BC0  48        PHA
  $8BC1  20 09 A2  JSR $A209
  $8BC4  68        PLA
  $8BC5  85 00     STA $00
  $8BC7  AD 41 06  LDA $0641
  $8BCA  10 3A     BPL $8C06
  $8BCC  C6 B2     DEC $B2
  $8BCE  D0 21     BNE $8BF1
  $8BD0  A0 12     LDY #$12
  $8BD2  A5 B1     LDA $B1
  $8BD4  C9 04     CMP #$04
  $8BD6  D0 02     BNE $8BDA
  $8BD8  A0 40     LDY #$40

L_8BDA:
  $8BDA  84 B2     STY $B2
  $8BDC  A9 00     LDA #$00
  $8BDE  8D 41 06  STA $0641
  $8BE1  8D 61 06  STA $0661
  $8BE4  AD 21 04  LDA $0421
  $8BE7  29 FB     AND #$FB
  $8BE9  8D 21 04  STA $0421
  $8BEC  A9 01     LDA #$01
  $8BEE  8D A1 06  STA $06A1

L_8BF1:
  $8BF1  A5 00     LDA $00
  $8BF3  F0 11     BEQ $8C06
  $8BF5  A9 00     LDA #$00
  $8BF7  85 B2     STA $B2
  $8BF9  C6 B1     DEC $B1
  $8BFB  8D 01 06  STA $0601
  $8BFE  8D 21 06  STA $0621
  $8C01  A9 64     LDA #$64
  $8C03  20 0C A1  JSR $A10C

L_8C06:
  $8C06  AD A1 06  LDA $06A1
  $8C09  D0 03     BNE $8C0E
  $8C0B  8D 81 06  STA $0681

L_8C0E:
  $8C0E  C9 02     CMP #$02
  $8C10  D0 2B     BNE $8C3D
  $8C12  AD 81 06  LDA $0681
  $8C15  D0 26     BNE $8C3D
  $8C17  A9 23     LDA #$23
  $8C19  20 51 C0  JSR $C051
  $8C1C  A9 5C     LDA #$5C
  $8C1E  A2 01     LDX #$01
  $8C20  20 52 A3  JSR $A352
  $8C23  18        CLC
  $8C24  98        TYA
  $8C25  69 10     ADC #$10
  $8C27  AA        TAX
  $8C28  86 2B     STX $2B
  $8C2A  A9 00     LDA #$00
  $8C2C  85 08     STA $08
  $8C2E  A9 04     LDA #$04
  $8C30  85 09     STA $09
  $8C32  20 8C A3  JSR $A38C
  $8C35  AD 21 04  LDA $0421
  $8C38  09 04     ORA #$04
  $8C3A  8D 21 04  STA $0421

L_8C3D:
  $8C3D  60        RTS

L_8C3E:
  $8C3E  A9 0F     LDA #$0F
  $8C40  8D 66 03  STA $0366
  $8C43  18        CLC
  $8C44  AD A7 05  LDA $05A7
  $8C47  69 01     ADC #$01
  $8C49  8D A7 05  STA $05A7
  $8C4C  AD A9 05  LDA $05A9
  $8C4F  69 00     ADC #$00
  $8C51  8D A9 05  STA $05A9
  $8C54  F0 3A     BEQ $8C90
  $8C56  AD A7 05  LDA $05A7
  $8C59  C9 77     CMP #$77
  $8C5B  D0 33     BNE $8C90
  $8C5D  A9 00     LDA #$00
  $8C5F  8D A7 05  STA $05A7
  $8C62  8D A9 05  STA $05A9
  $8C65  A5 2A     LDA $2A
  $8C67  C9 0C     CMP #$0C
  $8C69  F0 25     BEQ $8C90
  $8C6B  A9 30     LDA #$30
  $8C6D  8D 66 03  STA $0366
  $8C70  A2 00     LDX #$00
  $8C72  A0 00     LDY #$00
  $8C74  A5 45     LDA $45
  $8C76  49 40     EOR #$40
  $8C78  85 45     STA $45
  $8C7A  A5 46     LDA $46
  $8C7C  49 40     EOR #$40
  $8C7E  85 46     STA $46
  $8C80  F0 01     BEQ $8C83
  $8C82  E8        INX

L_8C83:
  $8C83  BD B5 8C  LDA $8CB5,X
  $8C86  99 7B 03  STA $037B,Y
  $8C89  E8        INX
  $8C8A  E8        INX
  $8C8B  C8        INY
  $8C8C  C0 03     CPY #$03
  $8C8E  D0 F3     BNE $8C83

L_8C90:
  $8C90  AD A8 05  LDA $05A8
  $8C93  F0 06     BEQ $8C9B
  $8C95  20 4F A1  JSR $A14F
  $8C98  4C A9 8C  JMP $8CA9

L_8C9B:
  $8C9B  20 46 A1  JSR $A146
  $8C9E  A5 02     LDA $02
  $8CA0  C9 01     CMP #$01
  $8CA2  D0 05     BNE $8CA9
  $8CA4  A9 12     LDA #$12
  $8CA6  8D A8 05  STA $05A8

L_8CA9:
  $8CA9  A9 07     LDA #$07
  $8CAB  85 01     STA $01
  $8CAD  A9 0C     LDA #$0C
  $8CAF  85 02     STA $02
  $8CB1  20 D4 A2  JSR $A2D4
  $8CB4  60        RTS
  $8CB5  10 10     BPL $8CC7
  $8CB7  10 15     BPL $8CCE
  $8CB9  15 10     ORA $10,X
  $8CBB  D3        .db $D3
  $8CBC  2E B5 B5  ROL $B5B5
  $8CBF  80        .db $80
  $8CC0  8B        .db $8B
  $8CC1  8B        .db $8B
  $8CC2  8B        .db $8B
  $8CC3  CA        DEX
  $8CC4  BD 08 8E  LDA $8E08,X

L_8CC7:
  $8CC7  85 08     STA $08
  $8CC9  BD 0C 8E  LDA $8E0C,X
  $8CCC  85 09     STA $09

L_8CCE:
  $8CCE  6C 08 00  JMP ($0008)
  $8CD1  AD E1 04  LDA $04E1
  $8CD4  09 83     ORA #$83
  $8CD6  8D 21 04  STA $0421
  $8CD9  A9 00     LDA #$00
  $8CDB  8D 61 06  STA $0661
  $8CDE  8D 41 06  STA $0641
  $8CE1  A9 47     LDA #$47
  $8CE3  8D 21 06  STA $0621
  $8CE6  A9 01     LDA #$01
  $8CE8  8D 01 06  STA $0601
  $8CEB  A9 6A     LDA #$6A
  $8CED  20 0C A1  JSR $A10C
  $8CF0  E6 B1     INC $B1
  $8CF2  20 F0 8D  JSR $8DF0
  $8CF5  60        RTS
  $8CF6  A5 27     LDA $27
  $8CF8  29 02     AND #$02
  $8CFA  D0 0A     BNE $8D06
  $8CFC  AD A7 05  LDA $05A7
  $8CFF  F0 57     BEQ $8D58
  $8D01  CE A7 05  DEC $05A7
  $8D04  D0 52     BNE $8D58

L_8D06:
  $8D06  A9 87     LDA #$87
  $8D08  8D 21 04  STA $0421
  $8D0B  20 09 A2  JSR $A209
  $8D0E  AD 21 04  LDA $0421
  $8D11  8D A9 05  STA $05A9
  $8D14  A9 ED     LDA #$ED
  $8D16  8D 61 06  STA $0661
  $8D19  A9 06     LDA #$06
  $8D1B  8D 41 06  STA $0641
  $8D1E  18        CLC
  $8D1F  A5 00     LDA $00
  $8D21  69 20     ADC #$20
  $8D23  85 0B     STA $0B
  $8D25  A5 4A     LDA $4A
  $8D27  29 01     AND #$01
  $8D29  F0 0B     BEQ $8D36
  $8D2B  38        SEC
  $8D2C  A5 0B     LDA $0B
  $8D2E  E9 40     SBC #$40
  $8D30  B0 02     BCS $8D34
  $8D32  A9 00     LDA #$00

L_8D34:
  $8D34  85 0B     STA $0B

L_8D36:
  $8D36  A9 37     LDA #$37
  $8D38  85 0D     STA $0D
  $8D3A  A9 00     LDA #$00
  $8D3C  85 0A     STA $0A
  $8D3E  85 0C     STA $0C
  $8D40  20 74 C8  JSR $C874
  $8D43  A5 0F     LDA $0F
  $8D45  8D 01 06  STA $0601
  $8D48  A5 0E     LDA $0E
  $8D4A  8D 21 06  STA $0621
  $8D4D  A9 6B     LDA #$6B
  $8D4F  20 0C A1  JSR $A10C
  $8D52  A9 04     LDA #$04
  $8D54  85 B1     STA $B1
  $8D56  D0 24     BNE $8D7C

L_8D58:
  $8D58  AE 61 04  LDX $0461
  $8D5B  AD 21 04  LDA $0421
  $8D5E  29 40     AND #$40
  $8D60  D0 06     BNE $8D68
  $8D62  E0 38     CPX #$38
  $8D64  B0 16     BCS $8D7C
  $8D66  90 04     BCC $8D6C

L_8D68:
  $8D68  E0 C8     CPX #$C8
  $8D6A  90 10     BCC $8D7C

L_8D6C:
  $8D6C  AD E1 04  LDA $04E1
  $8D6F  49 40     EOR #$40
  $8D71  8D E1 04  STA $04E1
  $8D74  AD 21 04  LDA $0421
  $8D77  49 40     EOR #$40
  $8D79  8D 21 04  STA $0421

L_8D7C:
  $8D7C  20 F0 8D  JSR $8DF0
  $8D7F  60        RTS
  $8D80  AD A9 05  LDA $05A9
  $8D83  8D 21 04  STA $0421
  $8D86  AD 41 06  LDA $0641
  $8D89  08        PHP
  $8D8A  20 F0 8D  JSR $8DF0
  $8D8D  A9 0B     LDA #$0B
  $8D8F  85 01     STA $01
  $8D91  A9 0C     LDA #$0C
  $8D93  85 02     STA $02
  $8D95  20 D4 A2  JSR $A2D4
  $8D98  28        PLP
  $8D99  30 0C     BMI $8DA7
  $8D9B  AD 41 06  LDA $0641
  $8D9E  10 44     BPL $8DE4
  $8DA0  A9 01     LDA #$01
  $8DA2  8D A1 06  STA $06A1
  $8DA5  D0 3D     BNE $8DE4

L_8DA7:
  $8DA7  A5 00     LDA $00
  $8DA9  F0 0B     BEQ $8DB6
  $8DAB  A9 02     LDA #$02
  $8DAD  85 B1     STA $B1
  $8DAF  A9 9C     LDA #$9C
  $8DB1  8D A7 05  STA $05A7
  $8DB4  D0 2E     BNE $8DE4

L_8DB6:
  $8DB6  AD A1 06  LDA $06A1
  $8DB9  C9 02     CMP #$02
  $8DBB  D0 27     BNE $8DE4
  $8DBD  AD 81 06  LDA $0681
  $8DC0  D0 22     BNE $8DE4
  $8DC2  A9 5E     LDA #$5E
  $8DC4  20 2D A2  JSR $A22D
  $8DC7  90 1B     BCC $8DE4
  $8DC9  A9 5E     LDA #$5E
  $8DCB  A2 01     LDX #$01
  $8DCD  20 52 A3  JSR $A352
  $8DD0  B0 12     BCS $8DE4
  $8DD2  18        CLC
  $8DD3  98        TYA
  $8DD4  69 10     ADC #$10
  $8DD6  AA        TAX
  $8DD7  86 2B     STX $2B
  $8DD9  A9 24     LDA #$24
  $8DDB  85 08     STA $08
  $8DDD  A9 06     LDA #$06
  $8DDF  85 09     STA $09
  $8DE1  20 8C A3  JSR $A38C

L_8DE4:
  $8DE4  AD A1 06  LDA $06A1
  $8DE7  D0 03     BNE $8DEC
  $8DE9  8D 81 06  STA $0681

L_8DEC:
  $8DEC  20 09 A2  JSR $A209
  $8DEF  60        RTS

L_8DF0:
  $8DF0  AD A8 05  LDA $05A8
  $8DF3  F0 04     BEQ $8DF9
  $8DF5  20 4F A1  JSR $A14F
  $8DF8  60        RTS

L_8DF9:
  $8DF9  20 46 A1  JSR $A146
  $8DFC  A5 02     LDA $02
  $8DFE  C9 01     CMP #$01
  $8E00  D0 05     BNE $8E07
  $8E02  A9 12     LDA #$12
  $8E04  8D A8 05  STA $05A8

L_8E07:
  $8E07  60        RTS
  $8E08  D3        .db $D3
  $8E09  D1 F6     CMP ($F6),Y
  $8E0B  80        .db $80
  $8E0C  80        .db $80
  $8E0D  8C 8C 8D  STY $8D8C
  $8E10  CA        DEX
  $8E11  BD 05 92  LDA $9205,X
  $8E14  85 08     STA $08
  $8E16  BD 0C 92  LDA $920C,X
  $8E19  85 09     STA $09
  $8E1B  6C 08 00  JMP ($0008)
  $8E1E  AD E1 04  LDA $04E1
  $8E21  D0 1B     BNE $8E3E
  $8E23  A9 09     LDA #$09
  $8E25  20 F1 C5  JSR $C5F1
  $8E28  E6 B2     INC $B2
  $8E2A  A5 B2     LDA $B2
  $8E2C  C9 40     CMP #$40
  $8E2E  F0 01     BEQ $8E31
  $8E30  60        RTS

L_8E31:
  $8E31  EE E1 04  INC $04E1
  $8E34  A9 00     LDA #$00
  $8E36  85 B2     STA $B2
  $8E38  A9 80     LDA #$80
  $8E3A  8D A7 05  STA $05A7
  $8E3D  60        RTS

L_8E3E:
  $8E3E  C9 01     CMP #$01
  $8E40  D0 34     BNE $8E76
  $8E42  A6 B2     LDX $B2
  $8E44  BD D9 8E  LDA $8ED9,X
  $8E47  8D B6 03  STA $03B6
  $8E4A  BD E8 8E  LDA $8EE8,X
  $8E4D  8D B7 03  STA $03B7
  $8E50  BD F7 8E  LDA $8EF7,X
  $8E53  85 47     STA $47
  $8E55  85 00     STA $00
  $8E57  A0 00     LDY #$00

L_8E59:
  $8E59  AD A7 05  LDA $05A7
  $8E5C  99 B8 03  STA $03B8,Y
  $8E5F  C8        INY
  $8E60  EE A7 05  INC $05A7
  $8E63  C6 00     DEC $00
  $8E65  D0 F2     BNE $8E59
  $8E67  E8        INX
  $8E68  86 B2     STX $B2
  $8E6A  E0 0F     CPX #$0F
  $8E6C  D0 6A     BNE $8ED8
  $8E6E  EE E1 04  INC $04E1
  $8E71  A9 00     LDA #$00
  $8E73  85 B2     STA $B2
  $8E75  60        RTS

L_8E76:
  $8E76  C9 02     CMP #$02
  $8E78  D0 36     BNE $8EB0
  $8E7A  A6 B2     LDX $B2
  $8E7C  E0 10     CPX #$10
  $8E7E  F0 1F     BEQ $8E9F
  $8E80  A9 23     LDA #$23
  $8E82  8D B6 03  STA $03B6
  $8E85  8A        TXA
  $8E86  0A        ASL
  $8E87  69 D0     ADC #$D0
  $8E89  8D B7 03  STA $03B7
  $8E8C  A0 00     LDY #$00

L_8E8E:
  $8E8E  BD 06 8F  LDA $8F06,X
  $8E91  99 B8 03  STA $03B8,Y
  $8E94  E8        INX
  $8E95  C8        INY
  $8E96  C0 04     CPY #$04
  $8E98  D0 F4     BNE $8E8E
  $8E9A  84 47     STY $47
  $8E9C  86 B2     STX $B2
  $8E9E  60        RTS

L_8E9F:
  $8E9F  EE E1 04  INC $04E1
  $8EA2  A9 23     LDA #$23
  $8EA4  8D B6 03  STA $03B6
  $8EA7  A9 E0     LDA #$E0
  $8EA9  8D B7 03  STA $03B7
  $8EAC  A9 1E     LDA #$1E
  $8EAE  85 B2     STA $B2

L_8EB0:
  $8EB0  A9 00     LDA #$00
  $8EB2  A2 1F     LDX #$1F

L_8EB4:
  $8EB4  9D B8 03  STA $03B8,X
  $8EB7  CA        DEX
  $8EB8  10 FA     BPL $8EB4
  $8EBA  18        CLC
  $8EBB  A9 20     LDA #$20
  $8EBD  85 47     STA $47
  $8EBF  6D B7 03  ADC $03B7
  $8EC2  8D B7 03  STA $03B7
  $8EC5  AD B6 03  LDA $03B6
  $8EC8  69 00     ADC #$00
  $8ECA  8D B6 03  STA $03B6
  $8ECD  C6 B2     DEC $B2
  $8ECF  D0 07     BNE $8ED8
  $8ED1  E6 B1     INC $B1
  $8ED3  A9 00     LDA #$00
  $8ED5  8D E1 04  STA $04E1

L_8ED8:
  $8ED8  60        RTS
  $8ED9  21 21     AND ($21,X)
  $8EDB  21 21     AND ($21,X)
  $8EDD  21 21     AND ($21,X)
  $8EDF  21 22     AND ($22,X)
  $8EE1  22        .db $22
  $8EE2  22        .db $22
  $8EE3  22        .db $22
  $8EE4  22        .db $22
  $8EE5  22        .db $22
  $8EE6  22        .db $22
  $8EE7  22        .db $22
  $8EE8  4B        .db $4B
  $8EE9  69 87     ADC #$87
  $8EEB  A6 C5     LDX $C5
  $8EED  E5 EE     SBC $EE
  $8EEF  04        .db $04
  $8EF0  24 44     BIT $44
  $8EF2  64        .db $64
  $8EF3  84 A4     STY $A4
  $8EF5  C5 E6     CMP $E6
  $8EF7  03        .db $03
  $8EF8  06 08     ASL $08
  $8EFA  0A        ASL
  $8EFB  0B        .db $0B
  $8EFC  05 02     ORA $02
  $8EFE  07        .db $07
  $8EFF  07        .db $07
  $8F00  08        PHP
  $8F01  08        PHP
  $8F02  08        PHP
  $8F03  08        PHP
  $8F04  07        .db $07
  $8F05  03        .db $03
  $8F06  FF        .db $FF
  $8F07  FF        .db $FF
  $8F08  FF        .db $FF
  $8F09  FF        .db $FF
  $8F0A  FF        .db $FF
  $8F0B  5F        .db $5F
  $8F0C  FF        .db $FF
  $8F0D  F3        .db $F3
  $8F0E  FF        .db $FF
  $8F0F  55 7F     EOR $7F,X
  $8F11  FF        .db $FF
  $8F12  FF        .db $FF
  $8F13  FF        .db $FF
  $8F14  FF        .db $FF
  $8F15  FF        .db $FF
  $8F16  AD E1 04  LDA $04E1
  $8F19  D0 1A     BNE $8F35
  $8F1B  A9 67     LDA #$67
  $8F1D  A2 01     LDX #$01
  $8F1F  20 52 A3  JSR $A352
  $8F22  A5 20     LDA $20
  $8F24  99 50 04  STA $0450,Y
  $8F27  A9 30     LDA #$30
  $8F29  99 70 04  STA $0470,Y
  $8F2C  A9 E0     LDA #$E0
  $8F2E  99 B0 04  STA $04B0,Y
  $8F31  EE E1 04  INC $04E1
  $8F34  60        RTS

L_8F35:
  $8F35  C9 02     CMP #$02
  $8F37  B0 01     BCS $8F3A
  $8F39  60        RTS

L_8F3A:
  $8F3A  D0 3D     BNE $8F79
  $8F3C  A2 0F     LDX #$0F

L_8F3E:
  $8F3E  BD 7A 8F  LDA $8F7A,X
  $8F41  9D 56 03  STA $0356,X
  $8F44  CA        DEX
  $8F45  10 F7     BPL $8F3E
  $8F47  20 51 A4  JSR $A451
  $8F4A  A9 03     LDA #$03
  $8F4C  85 B1     STA $B1
  $8F4E  A9 5D     LDA #$5D
  $8F50  85 B2     STA $B2
  $8F52  A9 65     LDA #$65
  $8F54  A2 01     LDX #$01
  $8F56  20 52 A3  JSR $A352
  $8F59  A9 40     LDA #$40
  $8F5B  99 70 04  STA $0470,Y
  $8F5E  A9 87     LDA #$87
  $8F60  99 B0 04  STA $04B0,Y
  $8F63  A9 66     LDA #$66
  $8F65  A2 01     LDX #$01
  $8F67  20 52 A3  JSR $A352
  $8F6A  A9 38     LDA #$38
  $8F6C  99 70 04  STA $0470,Y
  $8F6F  A9 BF     LDA #$BF
  $8F71  99 B0 04  STA $04B0,Y
  $8F74  A9 2C     LDA #$2C
  $8F76  20 51 C0  JSR $C051

L_8F79:
  $8F79  60        RTS
  $8F7A  0F        .db $0F
  $8F7B  30 29     BMI $8FA6
  $8F7D  19 0F 27  ORA $270F,Y
  $8F80  11 19     ORA ($19),Y
  $8F82  0F        .db $0F
  $8F83  11 29     ORA ($29),Y
  $8F85  19 0F 27  ORA $270F,Y
  $8F88  29 19     AND #$19
  $8F8A  A9 63     LDA #$63
  $8F8C  85 00     STA $00
  $8F8E  A0 0F     LDY #$0F

L_8F90:
  $8F90  20 31 A2  JSR $A231
  $8F93  B0 1D     BCS $8FB2
  $8F95  B9 30 04  LDA $0430,Y
  $8F98  29 04     AND #$04
  $8F9A  D0 13     BNE $8FAF
  $8F9C  B9 70 04  LDA $0470,Y
  $8F9F  C9 60     CMP #$60
  $8FA1  B0 0C     BCS $8FAF
  $8FA3  A9 C4     LDA #$C4
  $8FA5  99 30 04  STA $0430,Y
  $8FA8  A5 4A     LDA $4A
  $8FAA  29 03     AND #$03
  $8FAC  99 10 06  STA $0610,Y

L_8FAF:
  $8FAF  88        DEY
  $8FB0  10 DE     BPL $8F90

L_8FB2:
  $8FB2  20 C9 8F  JSR $8FC9
  $8FB5  C6 B2     DEC $B2
  $8FB7  D0 04     BNE $8FBD
  $8FB9  A9 5D     LDA #$5D
  $8FBB  85 B2     STA $B2

L_8FBD:
  $8FBD  20 65 91  JSR $9165
  $8FC0  AD A1 06  LDA $06A1
  $8FC3  D0 03     BNE $8FC8
  $8FC5  8D 81 06  STA $0681

L_8FC8:
  $8FC8  60        RTS

L_8FC9:
  $8FC9  AD E1 04  LDA $04E1
  $8FCC  D0 17     BNE $8FE5
  $8FCE  AD A1 04  LDA $04A1
  $8FD1  C9 53     CMP #$53
  $8FD3  90 10     BCC $8FE5

L_8FD5:
  $8FD5  A9 00     LDA #$00
  $8FD7  8D E1 04  STA $04E1
  $8FDA  A9 00     LDA #$00
  $8FDC  8D 41 06  STA $0641
  $8FDF  A9 80     LDA #$80
  $8FE1  8D 61 06  STA $0661
  $8FE4  60        RTS

L_8FE5:
  $8FE5  AD A1 04  LDA $04A1
  $8FE8  C9 73     CMP #$73
  $8FEA  B0 E9     BCS $8FD5
  $8FEC  A9 01     LDA #$01
  $8FEE  8D E1 04  STA $04E1
  $8FF1  A9 FF     LDA #$FF
  $8FF3  8D 41 06  STA $0641
  $8FF6  A9 80     LDA #$80
  $8FF8  8D 61 06  STA $0661
  $8FFB  60        RTS
  $8FFC  A9 63     LDA #$63
  $8FFE  85 00     STA $00
  $9000  A0 0F     LDY #$0F

L_9002:
  $9002  20 31 A2  JSR $A231
  $9005  B0 16     BCS $901D
  $9007  B9 30 04  LDA $0430,Y
  $900A  29 04     AND #$04
  $900C  D0 0C     BNE $901A
  $900E  B9 70 04  LDA $0470,Y
  $9011  C9 90     CMP #$90
  $9013  B0 05     BCS $901A
  $9015  A9 C4     LDA #$C4
  $9017  99 30 04  STA $0430,Y

L_901A:
  $901A  88        DEY
  $901B  10 E5     BPL $9002

L_901D:
  $901D  20 C9 8F  JSR $8FC9
  $9020  20 65 91  JSR $9165
  $9023  20 18 A1  JSR $A118
  $9026  AD C1 06  LDA $06C1
  $9029  C9 1C     CMP #$1C
  $902B  D0 07     BNE $9034
  $902D  A9 00     LDA #$00
  $902F  8D E1 04  STA $04E1
  $9032  E6 B1     INC $B1

L_9034:
  $9034  60        RTS

L_9035:
  $9035  A9 2C     LDA #$2C
  $9037  20 51 C0  JSR $C051
  $903A  A9 01     LDA #$01
  $903C  8D A1 06  STA $06A1
  $903F  A9 68     LDA #$68
  $9041  A2 01     LDX #$01
  $9043  20 52 A3  JSR $A352
  $9046  B0 1B     BCS $9063
  $9048  18        CLC
  $9049  B9 B0 04  LDA $04B0,Y
  $904C  69 10     ADC #$10
  $904E  99 B0 04  STA $04B0,Y
  $9051  A9 02     LDA #$02

L_9053:
  $9053  85 09     STA $09
  $9055  A9 00     LDA #$00
  $9057  85 08     STA $08
  $9059  98        TYA
  $905A  18        CLC
  $905B  69 10     ADC #$10
  $905D  AA        TAX
  $905E  86 2B     STX $2B
  $9060  20 8C A3  JSR $A38C

L_9063:
  $9063  60        RTS
  $9064  AD E1 04  LDA $04E1
  $9067  D0 08     BNE $9071
  $9069  A0 A0     LDY #$A0
  $906B  20 C5 90  JSR $90C5
  $906E  EE E1 04  INC $04E1

L_9071:
  $9071  20 0A 91  JSR $910A
  $9074  B0 07     BCS $907D
  $9076  AD 61 04  LDA $0461
  $9079  C9 A0     CMP #$A0
  $907B  90 07     BCC $9084

L_907D:
  $907D  A9 00     LDA #$00
  $907F  8D E1 04  STA $04E1
  $9082  E6 B1     INC $B1

L_9084:
  $9084  AD A1 06  LDA $06A1
  $9087  D0 03     BNE $908C
  $9089  8D 81 06  STA $0681

L_908C:
  $908C  AD 41 06  LDA $0641
  $908F  10 09     BPL $909A
  $9091  AD A1 04  LDA $04A1
  $9094  C9 A0     CMP #$A0
  $9096  90 1E     BCC $90B6
  $9098  B0 07     BCS $90A1

L_909A:
  $909A  AD A1 04  LDA $04A1
  $909D  C9 20     CMP #$20
  $909F  B0 15     BCS $90B6

L_90A1:
  $90A1  18        CLC
  $90A2  AD 61 06  LDA $0661
  $90A5  49 FF     EOR #$FF
  $90A7  69 01     ADC #$01
  $90A9  8D 61 06  STA $0661
  $90AC  AD 41 06  LDA $0641
  $90AF  49 FF     EOR #$FF
  $90B1  69 00     ADC #$00
  $90B3  8D 41 06  STA $0641

L_90B6:
  $90B6  AD A7 05  LDA $05A7
  $90B9  8D 21 04  STA $0421
  $90BC  20 65 91  JSR $9165
  $90BF  A9 83     LDA #$83
  $90C1  8D 21 04  STA $0421
  $90C4  60        RTS

L_90C5:
  $90C5  A9 00     LDA #$00
  $90C7  85 09     STA $09
  $90C9  A9 C4     LDA #$C4
  $90CB  85 08     STA $08
  $90CD  A2 01     LDX #$01
  $90CF  86 2B     STX $2B
  $90D1  AD 60 04  LDA $0460
  $90D4  48        PHA
  $90D5  8C 60 04  STY $0460
  $90D8  20 8C A3  JSR $A38C
  $90DB  A9 C3     LDA #$C3
  $90DD  8D A7 05  STA $05A7
  $90E0  68        PLA
  $90E1  8D 60 04  STA $0460
  $90E4  60        RTS
  $90E5  AD E1 04  LDA $04E1
  $90E8  D0 0D     BNE $90F7
  $90EA  A0 58     LDY #$58
  $90EC  20 C5 90  JSR $90C5
  $90EF  A9 83     LDA #$83
  $90F1  8D A7 05  STA $05A7
  $90F4  EE E1 04  INC $04E1

L_90F7:
  $90F7  AD 61 04  LDA $0461
  $90FA  C9 58     CMP #$58
  $90FC  F0 02     BEQ $9100
  $90FE  B0 07     BCS $9107

L_9100:
  $9100  A9 00     LDA #$00
  $9102  8D E1 04  STA $04E1
  $9105  C6 B1     DEC $B1

L_9107:
  $9107  4C 84 90  JMP $9084

L_910A:
  $910A  38        SEC
  $910B  AD A0 04  LDA $04A0
  $910E  ED A1 04  SBC $04A1
  $9111  B0 04     BCS $9117
  $9113  49 FF     EOR #$FF
  $9115  69 01     ADC #$01

L_9117:
  $9117  C9 04     CMP #$04
  $9119  B0 05     BCS $9120
  $911B  20 35 90  JSR $9035
  $911E  38        SEC
  $911F  60        RTS

L_9120:
  $9120  18        CLC
  $9121  60        RTS
  $9122  A5 B2     LDA $B2
  $9124  D0 08     BNE $912E
  $9126  A9 0F     LDA #$0F
  $9128  8D 66 03  STA $0366
  $912B  4C 8B A0  JMP $A08B

L_912E:
  $912E  20 82 93  JSR $9382
  $9131  A5 1C     LDA $1C
  $9133  29 0F     AND #$0F
  $9135  D0 2D     BNE $9164
  $9137  A2 0F     LDX #$0F

L_9139:
  $9139  38        SEC
  $913A  BD 56 03  LDA $0356,X
  $913D  E9 10     SBC #$10
  $913F  10 02     BPL $9143
  $9141  A9 0F     LDA #$0F

L_9143:
  $9143  9D 56 03  STA $0356,X
  $9146  CA        DEX
  $9147  10 F0     BPL $9139
  $9149  A2 07     LDX #$07

L_914B:
  $914B  38        SEC
  $914C  BD 6E 03  LDA $036E,X
  $914F  E9 10     SBC #$10
  $9151  10 02     BPL $9155
  $9153  A9 0F     LDA #$0F

L_9155:
  $9155  9D 6E 03  STA $036E,X
  $9158  CA        DEX
  $9159  10 F0     BPL $914B
  $915B  C6 B2     DEC $B2
  $915D  D0 05     BNE $9164
  $915F  A9 70     LDA #$70
  $9161  8D A7 05  STA $05A7

L_9164:
  $9164  60        RTS

L_9165:
  $9165  AD A0 04  LDA $04A0
  $9168  C9 B0     CMP #$B0
  $916A  90 08     BCC $9174
  $916C  A9 00     LDA #$00
  $916E  8D 61 06  STA $0661
  $9171  8D 41 06  STA $0641

L_9174:
  $9174  A9 0F     LDA #$0F
  $9176  8D 66 03  STA $0366
  $9179  20 9D A5  JSR $A59D
  $917C  90 1B     BCC $9199
  $917E  A9 0D     LDA #$0D
  $9180  85 B2     STA $B2
  $9182  A9 00     LDA #$00
  $9184  8D 61 06  STA $0661
  $9187  8D 41 06  STA $0641
  $918A  8D 21 06  STA $0621
  $918D  8D 01 06  STA $0601
  $9190  EE AA 05  INC $05AA
  $9193  A9 07     LDA #$07
  $9195  85 B1     STA $B1
  $9197  D0 0B     BNE $91A4

L_9199:
  $9199  A5 02     LDA $02
  $919B  C9 01     CMP #$01
  $919D  D0 05     BNE $91A4
  $919F  A9 30     LDA #$30
  $91A1  8D 66 03  STA $0366

L_91A4:
  $91A4  20 4F A1  JSR $A14F
  $91A7  38        SEC
  $91A8  A5 B5     LDA $B5
  $91AA  ED 61 06  SBC $0661
  $91AD  85 B5     STA $B5
  $91AF  A5 B6     LDA $B6
  $91B1  ED 41 06  SBC $0641
  $91B4  85 B6     STA $B6
  $91B6  F0 1A     BEQ $91D2
  $91B8  AC 41 06  LDY $0641
  $91BB  10 0C     BPL $91C9
  $91BD  C9 10     CMP #$10
  $91BF  B0 11     BCS $91D2
  $91C1  18        CLC
  $91C2  69 10     ADC #$10
  $91C4  85 B6     STA $B6
  $91C6  4C D2 91  JMP $91D2

L_91C9:
  $91C9  C9 11     CMP #$11
  $91CB  B0 05     BCS $91D2
  $91CD  38        SEC
  $91CE  E9 10     SBC #$10
  $91D0  85 B6     STA $B6

L_91D2:
  $91D2  AD 21 04  LDA $0421
  $91D5  29 40     AND #$40
  $91D7  F0 16     BEQ $91EF
  $91D9  18        CLC
  $91DA  A5 B7     LDA $B7
  $91DC  6D 21 06  ADC $0621
  $91DF  85 B7     STA $B7
  $91E1  A5 B8     LDA $B8
  $91E3  6D 01 06  ADC $0601
  $91E6  85 B8     STA $B8
  $91E8  A5 B9     LDA $B9
  $91EA  69 00     ADC #$00
  $91EC  85 B9     STA $B9
  $91EE  60        RTS

L_91EF:
  $91EF  38        SEC
  $91F0  A5 B7     LDA $B7
  $91F2  ED 21 06  SBC $0621
  $91F5  85 B7     STA $B7
  $91F7  A5 B8     LDA $B8
  $91F9  ED 01 06  SBC $0601
  $91FC  85 B8     STA $B8
  $91FE  A5 B9     LDA $B9
  $9200  E9 00     SBC #$00
  $9202  85 B9     STA $B9
  $9204  60        RTS
  $9205  1E 16 8A  ASL $8A16,X
  $9208  FC        .db $FC
  $9209  64        .db $64
  $920A  E5 22     SBC $22
  $920C  8E 8F 8F  STX $8F8F
  $920F  8F        .db $8F
  $9210  90 90     BCC $91A2
  $9212  91 CA     STA ($CA),Y
  $9214  BD 95 93  LDA $9395,X
  $9217  85 08     STA $08
  $9219  BD 98 93  LDA $9398,X
  $921C  85 09     STA $09
  $921E  6C 08 00  JMP ($0008)
  $9221  A5 B2     LDA $B2
  $9223  D0 07     BNE $922C
  $9225  E6 B2     INC $B2
  $9227  A9 0B     LDA #$0B
  $9229  20 51 C0  JSR $C051

L_922C:
  $922C  20 18 A1  JSR $A118
  $922F  AD C1 06  LDA $06C1
  $9232  C9 1C     CMP #$1C
  $9234  D0 0B     BNE $9241
  $9236  A9 6F     LDA #$6F
  $9238  8D E1 04  STA $04E1
  $923B  E6 B1     INC $B1
  $923D  A9 00     LDA #$00
  $923F  85 B2     STA $B2

L_9241:
  $9241  60        RTS

L_9242:
  $9242  4C DC 92  JMP $92DC
  $9245  CE E1 04  DEC $04E1
  $9248  D0 F8     BNE $9242
  $924A  A9 1F     LDA #$1F
  $924C  8D E1 04  STA $04E1
  $924F  A9 6A     LDA #$6A
  $9251  20 2D A2  JSR $A22D
  $9254  90 EC     BCC $9242
  $9256  A6 B2     LDX $B2
  $9258  BC DD 92  LDY $92DD,X
  $925B  A2 00     LDX #$00

L_925D:
  $925D  B9 3F 93  LDA $933F,Y
  $9260  95 08     STA $08,X
  $9262  C8        INY
  $9263  E8        INX
  $9264  E0 08     CPX #$08
  $9266  D0 F5     BNE $925D
  $9268  A5 B2     LDA $B2
  $926A  0A        ASL
  $926B  85 01     STA $01
  $926D  A2 00     LDX #$00

L_926F:
  $926F  86 02     STX $02
  $9271  A9 6A     LDA #$6A
  $9273  A2 01     LDX #$01
  $9275  20 52 A3  JSR $A352
  $9278  A6 01     LDX $01
  $927A  BD EB 92  LDA $92EB,X
  $927D  99 B0 04  STA $04B0,Y
  $9280  BD 07 93  LDA $9307,X
  $9283  99 70 04  STA $0470,Y
  $9286  BD 23 93  LDA $9323,X
  $9289  99 F0 04  STA $04F0,Y
  $928C  A6 02     LDX $02
  $928E  B5 08     LDA $08,X
  $9290  99 50 06  STA $0650,Y
  $9293  B5 0A     LDA $0A,X
  $9295  99 10 06  STA $0610,Y
  $9298  B5 0C     LDA $0C,X
  $929A  99 30 04  STA $0430,Y
  $929D  B5 0E     LDA $0E,X
  $929F  99 20 01  STA $0120,Y
  $92A2  E6 01     INC $01
  $92A4  E8        INX
  $92A5  E0 02     CPX #$02
  $92A7  D0 C6     BNE $926F
  $92A9  A5 B2     LDA $B2
  $92AB  0A        ASL
  $92AC  85 0C     STA $0C

L_92AE:
  $92AE  A6 0C     LDX $0C
  $92B0  AD 40 04  LDA $0440
  $92B3  85 09     STA $09
  $92B5  BD 07 93  LDA $9307,X
  $92B8  29 F0     AND #$F0
  $92BA  85 08     STA $08
  $92BC  BD EB 92  LDA $92EB,X
  $92BF  85 0A     STA $0A
  $92C1  20 EF C8  JSR $C8EF
  $92C4  A5 51     LDA $51
  $92C6  D0 06     BNE $92CE
  $92C8  E6 51     INC $51
  $92CA  E6 0C     INC $0C
  $92CC  D0 E0     BNE $92AE

L_92CE:
  $92CE  A9 82     LDA #$82
  $92D0  85 51     STA $51
  $92D2  E6 B2     INC $B2
  $92D4  A5 B2     LDA $B2
  $92D6  C9 0E     CMP #$0E
  $92D8  D0 02     BNE $92DC
  $92DA  E6 B1     INC $B1

L_92DC:
  $92DC  60        RTS
  $92DD  00        BRK
  $92DE  00        BRK
  $92DF  00        BRK
  $92E0  08        PHP
  $92E1  10 00     BPL $92E3

L_92E3:
  $92E3  00        BRK
  $92E4  10 08     BPL $92EE
  $92E6  00        BRK
  $92E7  10 10     BPL $92F9
  $92E9  00        BRK
  $92EA  10 57     BPL $9343
  $92EC  57        .db $57
  $92ED  87        .db $87

L_92EE:
  $92EE  87        .db $87
  $92EF  B7        .db $B7
  $92F0  B7        .db $B7
  $92F1  27        .db $27
  $92F2  C7        .db $C7
  $92F3  27        .db $27
  $92F4  C7        .db $C7
  $92F5  77        .db $77
  $92F6  77        .db $77
  $92F7  37        .db $37
  $92F8  37        .db $37

L_92F9:
  $92F9  27        .db $27
  $92FA  C7        .db $C7
  $92FB  27        .db $27
  $92FC  C7        .db $C7
  $92FD  A7        .db $A7
  $92FE  A7        .db $A7
  $92FF  27        .db $27
  $9300  C7        .db $C7
  $9301  27        .db $27
  $9302  C7        .db $C7
  $9303  97        .db $97
  $9304  97        .db $97
  $9305  27        .db $27
  $9306  C7        .db $C7
  $9307  28        PLP
  $9308  D8        CLD
  $9309  28        PLP
  $930A  D8        CLD
  $930B  28        PLP
  $930C  D8        CLD
  $930D  58        CLI
  $930E  68        PLA
  $930F  B8        CLV
  $9310  A8        TAY
  $9311  28        PLP
  $9312  D8        CLD
  $9313  28        PLP
  $9314  D8        CLD
  $9315  A8        TAY
  $9316  98        TYA
  $9317  38        SEC
  $9318  48        PHA
  $9319  28        PLP
  $931A  D8        CLD
  $931B  68        PLA
  $931C  58        CLI
  $931D  C8        INY
  $931E  B8        CLV
  $931F  28        PLP
  $9320  D8        CLD
  $9321  48        PHA
  $9322  38        SEC
  $9323  00        BRK
  $9324  00        BRK
  $9325  00        BRK
  $9326  00        BRK
  $9327  00        BRK
  $9328  00        BRK
  $9329  00        BRK
  $932A  00        BRK
  $932B  01 01     ORA ($01,X)
  $932D  01 01     ORA ($01,X)
  $932F  01 01     ORA ($01,X)
  $9331  01 01     ORA ($01,X)
  $9333  02        .db $02
  $9334  02        .db $02
  $9335  02        .db $02
  $9336  02        .db $02
  $9337  02        .db $02
  $9338  02        .db $02
  $9339  02        .db $02
  $933A  02        .db $02
  $933B  03        .db $03
  $933C  03        .db $03
  $933D  03        .db $03
  $933E  03        .db $03
  $933F  00        BRK
  $9340  00        BRK
  $9341  01 01     ORA ($01,X)

L_9343:
  $9343  CB        .db $CB
  $9344  8B        .db $8B
  $9345  50 50     BVC $9397
  $9347  FF        .db $FF
  $9348  01 00     ORA ($00,X)
  $934A  00        BRK
  $934B  CB        .db $CB
  $934C  8B        .db $8B
  $934D  50 50     BVC $939F
  $934F  FF        .db $FF
  $9350  01 00     ORA ($00,X)
  $9352  00        BRK
  $9353  8B        .db $8B
  $9354  CB        .db $CB
  $9355  50 50     BVC $93A7
  $9357  AD C1 06  LDA $06C1
  $935A  D0 0C     BNE $9368
  $935C  A9 BB     LDA #$BB
  $935E  85 B2     STA $B2
  $9360  EE AA 05  INC $05AA
  $9363  A9 FF     LDA #$FF
  $9365  20 51 C0  JSR $C051

L_9368:
  $9368  60        RTS
  $9369  A5 B2     LDA $B2
  $936B  F0 0D     BEQ $937A
  $936D  C6 B2     DEC $B2
  $936F  F0 04     BEQ $9375
  $9371  20 82 93  JSR $9382
  $9374  60        RTS

L_9375:
  $9375  A9 80     LDA #$80
  $9377  8D A7 05  STA $05A7

L_937A:
  $937A  A9 0F     LDA #$0F
  $937C  8D 66 03  STA $0366
  $937F  4C 8B A0  JMP $A08B

L_9382:
  $9382  A2 0F     LDX #$0F
  $9384  A5 1C     LDA $1C
  $9386  29 07     AND #$07
  $9388  D0 07     BNE $9391
  $938A  A9 2B     LDA #$2B
  $938C  20 51 C0  JSR $C051
  $938F  A2 30     LDX #$30

L_9391:
  $9391  8E 66 03  STX $0366
  $9394  60        RTS
  $9395  21 45     AND ($45,X)

L_9397:
  $9397  57        .db $57
  $9398  92        .db $92
  $9399  92        .db $92
  $939A  93        .db $93
  $939B  CA        DEX
  $939C  BD 62 96  LDA $9662,X

L_939F:
  $939F  85 08     STA $08
  $93A1  BD 68 96  LDA $9668,X
  $93A4  85 09     STA $09
  $93A6  6C 08 00  JMP ($0008)
  $93A9  20 18 A1  JSR $A118
  $93AC  AD E1 04  LDA $04E1
  $93AF  D0 25     BNE $93D6
  $93B1  A9 02     LDA #$02
  $93B3  8D 54 03  STA $0354
  $93B6  A9 04     LDA #$04
  $93B8  8D 55 03  STA $0355
  $93BB  A9 B2     LDA #$B2
  $93BD  8D A7 05  STA $05A7
  $93C0  A9 00     LDA #$00
  $93C2  8D A9 05  STA $05A9
  $93C5  A9 10     LDA #$10
  $93C7  8D B6 03  STA $03B6
  $93CA  A9 E0     LDA #$E0
  $93CC  8D B7 03  STA $03B7
  $93CF  A9 69     LDA #$69
  $93D1  85 B2     STA $B2
  $93D3  EE E1 04  INC $04E1

L_93D6:
  $93D6  AD E1 04  LDA $04E1
  $93D9  C9 01     CMP #$01
  $93DB  D0 13     BNE $93F0
  $93DD  A9 0B     LDA #$0B
  $93DF  20 F1 C5  JSR $C5F1
  $93E2  C6 B2     DEC $B2
  $93E4  F0 01     BEQ $93E7
  $93E6  60        RTS

L_93E7:
  $93E7  EE E1 04  INC $04E1
  $93EA  A9 10     LDA #$10
  $93EC  8D A7 05  STA $05A7
  $93EF  60        RTS

L_93F0:
  $93F0  C9 02     CMP #$02
  $93F2  D0 3C     BNE $9430
  $93F4  A6 B2     LDX $B2
  $93F6  E0 0B     CPX #$0B
  $93F8  F0 25     BEQ $941F
  $93FA  BD C0 A9  LDA $A9C0,X
  $93FD  8D B6 03  STA $03B6
  $9400  BD CB A9  LDA $A9CB,X
  $9403  8D B7 03  STA $03B7
  $9406  BD D6 A9  LDA $A9D6,X
  $9409  85 47     STA $47
  $940B  A0 00     LDY #$00

L_940D:
  $940D  AD A7 05  LDA $05A7
  $9410  99 B8 03  STA $03B8,Y
  $9413  EE A7 05  INC $05A7
  $9416  C8        INY
  $9417  C4 47     CPY $47
  $9419  D0 F2     BNE $940D
  $941B  E8        INX
  $941C  86 B2     STX $B2
  $941E  60        RTS

L_941F:
  $941F  A9 21     LDA #$21
  $9421  8D B6 03  STA $03B6
  $9424  A9 E0     LDA #$E0
  $9426  8D B7 03  STA $03B7
  $9429  A9 00     LDA #$00
  $942B  85 B2     STA $B2
  $942D  EE E1 04  INC $04E1

L_9430:
  $9430  AD E1 04  LDA $04E1
  $9433  C9 03     CMP #$03
  $9435  D0 3B     BNE $9472
  $9437  18        CLC
  $9438  A9 20     LDA #$20
  $943A  85 47     STA $47
  $943C  6D B7 03  ADC $03B7
  $943F  8D B7 03  STA $03B7
  $9442  AD B6 03  LDA $03B6
  $9445  69 00     ADC #$00
  $9447  8D B6 03  STA $03B6
  $944A  A6 B2     LDX $B2
  $944C  E0 B0     CPX #$B0
  $944E  F0 11     BEQ $9461
  $9450  A0 00     LDY #$00

L_9452:
  $9452  BD E1 A9  LDA $A9E1,X
  $9455  99 B8 03  STA $03B8,Y
  $9458  E8        INX
  $9459  C8        INY
  $945A  C0 16     CPY #$16
  $945C  D0 F4     BNE $9452
  $945E  86 B2     STX $B2
  $9460  60        RTS

L_9461:
  $9461  A9 23     LDA #$23
  $9463  8D B6 03  STA $03B6
  $9466  A9 C0     LDA #$C0
  $9468  8D B7 03  STA $03B7
  $946B  A9 00     LDA #$00
  $946D  85 B2     STA $B2
  $946F  EE E1 04  INC $04E1

L_9472:
  $9472  18        CLC
  $9473  AD B7 03  LDA $03B7
  $9476  69 08     ADC #$08
  $9478  8D B7 03  STA $03B7
  $947B  AD B6 03  LDA $03B6
  $947E  69 00     ADC #$00
  $9480  8D B6 03  STA $03B6
  $9483  A9 06     LDA #$06
  $9485  85 47     STA $47
  $9487  A6 B2     LDX $B2
  $9489  E0 1E     CPX #$1E
  $948B  F0 11     BEQ $949E
  $948D  A0 00     LDY #$00

L_948F:
  $948F  BD 91 AA  LDA $AA91,X
  $9492  99 B8 03  STA $03B8,Y
  $9495  E8        INX
  $9496  C8        INY
  $9497  C0 06     CPY #$06
  $9499  D0 F4     BNE $948F
  $949B  86 B2     STX $B2
  $949D  60        RTS

L_949E:
  $949E  A9 00     LDA #$00
  $94A0  85 47     STA $47
  $94A2  8D E1 04  STA $04E1
  $94A5  A9 8B     LDA #$8B
  $94A7  8D A7 05  STA $05A7
  $94AA  E6 B1     INC $B1
  $94AC  60        RTS
  $94AD  AD 21 04  LDA $0421
  $94B0  30 05     BMI $94B7
  $94B2  A9 FF     LDA #$FF
  $94B4  8D 61 04  STA $0461

L_94B7:
  $94B7  AE E1 04  LDX $04E1
  $94BA  A5 B8     LDA $B8
  $94BC  DD 0D 95  CMP $950D,X
  $94BF  D0 48     BNE $9509
  $94C1  E0 01     CPX #$01
  $94C3  D0 0D     BNE $94D2
  $94C5  A9 8B     LDA #$8B
  $94C7  8D 21 04  STA $0421
  $94CA  A5 B7     LDA $B7
  $94CC  8D 81 04  STA $0481
  $94CF  4C F8 94  JMP $94F8

L_94D2:
  $94D2  BD 15 95  LDA $9515,X
  $94D5  85 01     STA $01
  $94D7  BD 19 95  LDA $9519,X
  $94DA  85 02     STA $02
  $94DC  BD 11 95  LDA $9511,X
  $94DF  A2 01     LDX #$01
  $94E1  20 52 A3  JSR $A352
  $94E4  A5 01     LDA $01
  $94E6  99 B0 04  STA $04B0,Y
  $94E9  A9 FF     LDA #$FF
  $94EB  99 70 04  STA $0470,Y
  $94EE  A5 B7     LDA $B7
  $94F0  99 90 04  STA $0490,Y
  $94F3  A5 02     LDA $02
  $94F5  99 F0 06  STA $06F0,Y

L_94F8:
  $94F8  EE E1 04  INC $04E1
  $94FB  AD E1 04  LDA $04E1
  $94FE  C9 04     CMP #$04
  $9500  D0 07     BNE $9509
  $9502  A9 3F     LDA #$3F
  $9504  8D E1 04  STA $04E1
  $9507  E6 B1     INC $B1

L_9509:
  $9509  20 A4 91  JSR $91A4
  $950C  60        RTS
  $950D  D7        .db $D7
  $950E  C7        .db $C7
  $950F  A7        .db $A7
  $9510  8C 69 00  STY $0069
  $9513  63        .db $63
  $9514  67        .db $67
  $9515  7F        .db $7F
  $9516  00        BRK
  $9517  A8        TAY
  $9518  68        PLA
  $9519  09 00     ORA #$00
  $951B  14        .db $14
  $951C  06 A5     ASL $A5
  $951E  B8        CLV
  $951F  C9 30     CMP #$30
  $9521  D0 06     BNE $9529
  $9523  A9 7D     LDA #$7D
  $9525  85 B2     STA $B2
  $9527  E6 B1     INC $B1

L_9529:
  $9529  A9 8B     LDA #$8B

L_952B:
  $952B  8D A7 05  STA $05A7
  $952E  A9 60     LDA #$60
  $9530  8D 21 06  STA $0621
  $9533  20 63 95  JSR $9563
  $9536  60        RTS
  $9537  A5 B8     LDA $B8
  $9539  C9 80     CMP #$80
  $953B  D0 06     BNE $9543
  $953D  A9 7D     LDA #$7D
  $953F  85 B2     STA $B2
  $9541  E6 B1     INC $B1

L_9543:
  $9543  A9 CB     LDA #$CB
  $9545  D0 E4     BNE $952B
  $9547  A9 05     LDA #$05
  $9549  D0 02     BNE $954D
  $954B  A9 03     LDA #$03

L_954D:
  $954D  85 00     STA $00
  $954F  C6 B2     DEC $B2
  $9551  D0 04     BNE $9557
  $9553  A5 00     LDA $00
  $9555  85 B1     STA $B1

L_9557:
  $9557  A9 00     LDA #$00
  $9559  8D 01 06  STA $0601
  $955C  8D 21 06  STA $0621
  $955F  20 63 95  JSR $9563
  $9562  60        RTS

L_9563:
  $9563  CE E1 04  DEC $04E1
  $9566  F0 03     BEQ $956B
  $9568  4C 13 96  JMP $9613

L_956B:
  $956B  A9 3F     LDA #$3F
  $956D  8D E1 04  STA $04E1
  $9570  20 09 A2  JSR $A209
  $9573  A5 00     LDA $00
  $9575  C9 38     CMP #$38
  $9577  90 4D     BCC $95C6
  $9579  A9 69     LDA #$69
  $957B  20 2D A2  JSR $A22D
  $957E  A9 01     LDA #$01
  $9580  99 F0 04  STA $04F0,Y
  $9583  A9 02     LDA #$02
  $9585  85 02     STA $02
  $9587  A9 34     LDA #$34
  $9589  85 00     STA $00
  $958B  A0 0F     LDY #$0F

L_958D:
  $958D  20 31 A2  JSR $A231
  $9590  B0 07     BCS $9599
  $9592  C6 02     DEC $02
  $9594  F0 7D     BEQ $9613
  $9596  88        DEY
  $9597  10 F4     BPL $958D

L_9599:
  $9599  A9 34     LDA #$34
  $959B  A2 01     LDX #$01
  $959D  20 52 A3  JSR $A352
  $95A0  B0 71     BCS $9613
  $95A2  A9 87     LDA #$87
  $95A4  99 30 04  STA $0430,Y
  $95A7  18        CLC
  $95A8  B9 B0 04  LDA $04B0,Y
  $95AB  69 30     ADC #$30
  $95AD  99 B0 04  STA $04B0,Y
  $95B0  A9 C4     LDA #$C4
  $95B2  99 30 06  STA $0630,Y
  $95B5  A9 01     LDA #$01
  $95B7  99 10 06  STA $0610,Y
  $95BA  A9 02     LDA #$02
  $95BC  99 50 06  STA $0650,Y
  $95BF  A9 D4     LDA #$D4
  $95C1  99 70 06  STA $0670,Y
  $95C4  D0 4D     BNE $9613

L_95C6:
  $95C6  38        SEC
  $95C7  A5 00     LDA $00
  $95C9  E9 10     SBC #$10
  $95CB  B0 02     BCS $95CF
  $95CD  A9 00     LDA #$00

L_95CF:
  $95CF  85 08     STA $08
  $95D1  A9 00     LDA #$00
  $95D3  06 08     ASL $08
  $95D5  2A        ROL
  $95D6  06 08     ASL $08
  $95D8  2A        ROL
  $95D9  06 08     ASL $08
  $95DB  2A        ROL
  $95DC  85 09     STA $09
  $95DE  A9 69     LDA #$69
  $95E0  20 2D A2  JSR $A22D
  $95E3  A9 00     LDA #$00
  $95E5  99 F0 04  STA $04F0,Y
  $95E8  A9 35     LDA #$35
  $95EA  A2 01     LDX #$01
  $95EC  20 52 A3  JSR $A352
  $95EF  B0 22     BCS $9613
  $95F1  A9 85     LDA #$85
  $95F3  99 30 04  STA $0430,Y
  $95F6  18        CLC
  $95F7  B9 B0 04  LDA $04B0,Y
  $95FA  69 10     ADC #$10
  $95FC  99 B0 04  STA $04B0,Y
  $95FF  A9 04     LDA #$04
  $9601  99 50 06  STA $0650,Y
  $9604  A5 09     LDA $09
  $9606  99 10 06  STA $0610,Y
  $9609  A5 08     LDA $08
  $960B  99 30 06  STA $0630,Y
  $960E  A9 01     LDA #$01
  $9610  8D A1 06  STA $06A1

L_9613:
  $9613  AD A1 06  LDA $06A1
  $9616  D0 03     BNE $961B
  $9618  8D 81 06  STA $0681

L_961B:
  $961B  A9 0F     LDA #$0F
  $961D  8D 66 03  STA $0366
  $9620  20 9D A5  JSR $A59D
  $9623  90 23     BCC $9648

L_9625:
  $9625  A9 00     LDA #$00
  $9627  8D 54 03  STA $0354
  $962A  8D 55 03  STA $0355
  $962D  A9 0D     LDA #$0D
  $962F  85 B2     STA $B2
  $9631  A9 00     LDA #$00
  $9633  8D 61 06  STA $0661
  $9636  8D 41 06  STA $0641
  $9639  8D 21 06  STA $0621
  $963C  8D 01 06  STA $0601
  $963F  EE AA 05  INC $05AA
  $9642  A9 07     LDA #$07
  $9644  85 B1     STA $B1
  $9646  D0 0B     BNE $9653

L_9648:
  $9648  A5 02     LDA $02
  $964A  C9 01     CMP #$01
  $964C  D0 05     BNE $9653
  $964E  A9 30     LDA #$30
  $9650  8D 66 03  STA $0366

L_9653:
  $9653  AD A7 05  LDA $05A7
  $9656  8D 21 04  STA $0421
  $9659  20 A4 91  JSR $91A4
  $965C  A9 83     LDA #$83
  $965E  8D 21 04  STA $0421
  $9661  60        RTS
  $9662  A9 AD     LDA #$AD
  $9664  1D 47 37  ORA $3747,X

L_9667:
  $9667  4B        .db $4B
  $9668  93        .db $93
  $9669  94 95     STY $95,X
  $966B  95 95     STA $95,X
  $966D  95 CA     STA $CA,X
  $966F  BD BC 96  LDA $96BC,X
  $9672  85 08     STA $08
  $9674  BD BE 96  LDA $96BE,X
  $9677  85 09     STA $09
  $9679  6C 08 00  JMP ($0008)
  $967C  20 18 A1  JSR $A118
  $967F  AD C1 06  LDA $06C1
  $9682  C9 1C     CMP #$1C
  $9684  F0 01     BEQ $9687
  $9686  60        RTS

L_9687:
  $9687  A9 04     LDA #$04
  $9689  85 02     STA $02

L_968B:
  $968B  A9 6D     LDA #$6D
  $968D  A2 01     LDX #$01
  $968F  20 52 A3  JSR $A352
  $9692  A6 02     LDX $02
  $9694  BD AD 96  LDA $96AD,X
  $9697  99 70 04  STA $0470,Y
  $969A  BD B2 96  LDA $96B2,X
  $969D  99 B0 04  STA $04B0,Y
  $96A0  BD B7 96  LDA $96B7,X
  $96A3  99 30 04  STA $0430,Y
  $96A6  C6 02     DEC $02
  $96A8  10 E1     BPL $968B
  $96AA  E6 B1     INC $B1
  $96AC  60        RTS
  $96AD  14        .db $14
  $96AE  44        .db $44
  $96AF  AC EC EC  LDY $ECEC
  $96B2  60        RTS
  $96B3  30 40     BMI $96F5
  $96B5  70 B0     BVS $9667
  $96B7  C3        .db $C3
  $96B8  C3        .db $C3
  $96B9  83        .db $83
  $96BA  83        .db $83
  $96BB  83        .db $83
  $96BC  7C        .db $7C
  $96BD  57        .db $57
  $96BE  96 93     STX $93,Y
  $96C0  CA        DEX
  $96C1  BD 1C 9B  LDA $9B1C,X
  $96C4  85 08     STA $08
  $96C6  BD 23 9B  LDA $9B23,X
  $96C9  85 09     STA $09
  $96CB  6C 08 00  JMP ($0008)
  $96CE  A9 00     LDA #$00
  $96D0  8D 81 06  STA $0681
  $96D3  AD E1 04  LDA $04E1
  $96D6  D0 35     BNE $970D
  $96D8  A9 02     LDA #$02
  $96DA  8D 54 03  STA $0354
  $96DD  A9 04     LDA #$04
  $96DF  8D 55 03  STA $0355
  $96E2  A9 B0     LDA #$B0
  $96E4  8D A7 05  STA $05A7
  $96E7  A9 00     LDA #$00
  $96E9  8D A9 05  STA $05A9
  $96EC  8D 54 03  STA $0354
  $96EF  8D 55 03  STA $0355
  $96F2  A9 0F     LDA #$0F
  $96F4  A2 0B     LDX #$0B

L_96F6:
  $96F6  9D 5A 03  STA $035A,X
  $96F9  CA        DEX
  $96FA  10 FA     BPL $96F6
  $96FC  A9 15     LDA #$15
  $96FE  8D B6 03  STA $03B6
  $9701  A9 A0     LDA #$A0
  $9703  8D B7 03  STA $03B7
  $9706  A9 52     LDA #$52
  $9708  85 B2     STA $B2
  $970A  EE E1 04  INC $04E1

L_970D:
  $970D  AD E1 04  LDA $04E1
  $9710  C9 01     CMP #$01
  $9712  D0 1C     BNE $9730
  $9714  A9 08     LDA #$08
  $9716  20 F1 C5  JSR $C5F1
  $9719  C6 B2     DEC $B2
  $971B  F0 01     BEQ $971E
  $971D  60        RTS

L_971E:
  $971E  EE E1 04  INC $04E1
  $9721  A9 00     LDA #$00
  $9723  85 B2     STA $B2
  $9725  A9 27     LDA #$27
  $9727  8D B6 03  STA $03B6
  $972A  A9 CB     LDA #$CB
  $972C  8D B7 03  STA $03B7
  $972F  60        RTS

L_9730:
  $9730  C9 02     CMP #$02
  $9732  D0 17     BNE $974B
  $9734  A6 B2     LDX $B2
  $9736  E0 14     CPX #$14
  $9738  F0 04     BEQ $973E
  $973A  20 F8 97  JSR $97F8
  $973D  60        RTS

L_973E:
  $973E  EE E1 04  INC $04E1
  $9741  A9 00     LDA #$00
  $9743  85 B2     STA $B2
  $9745  A9 5C     LDA #$5C
  $9747  8D A7 05  STA $05A7
  $974A  60        RTS

L_974B:
  $974B  A6 B2     LDX $B2
  $974D  E0 0E     CPX #$0E
  $974F  B0 04     BCS $9755
  $9751  20 D4 97  JSR $97D4
  $9754  60        RTS

L_9755:
  $9755  E0 13     CPX #$13
  $9757  B0 1B     BCS $9774
  $9759  A5 1C     LDA $1C
  $975B  29 03     AND #$03
  $975D  D0 15     BNE $9774
  $975F  A9 04     LDA #$04
  $9761  A0 0B     LDY #$0B
  $9763  A2 0F     LDX #$0F
  $9765  20 9B 97  JSR $979B
  $9768  A9 18     LDA #$18
  $976A  A0 13     LDY #$13
  $976C  A2 1F     LDX #$1F
  $976E  20 9B 97  JSR $979B
  $9771  E6 B2     INC $B2
  $9773  60        RTS

L_9774:
  $9774  20 18 A1  JSR $A118
  $9777  AD C1 06  LDA $06C1
  $977A  C9 1C     CMP #$1C
  $977C  D0 1C     BNE $979A
  $977E  E6 B1     INC $B1
  $9780  A9 56     LDA #$56
  $9782  A2 01     LDX #$01
  $9784  20 52 A3  JSR $A352
  $9787  A9 AB     LDA #$AB
  $9789  99 30 04  STA $0430,Y
  $978C  A9 B0     LDA #$B0
  $978E  99 70 04  STA $0470,Y
  $9791  A9 80     LDA #$80
  $9793  99 B0 04  STA $04B0,Y
  $9796  A9 3E     LDA #$3E
  $9798  85 B2     STA $B2

L_979A:
  $979A  60        RTS

L_979B:
  $979B  85 00     STA $00

L_979D:
  $979D  BD 56 03  LDA $0356,X
  $97A0  C9 0F     CMP #$0F
  $97A2  D0 08     BNE $97AC
  $97A4  B9 C0 97  LDA $97C0,Y
  $97A7  29 0F     AND #$0F
  $97A9  4C B6 97  JMP $97B6

L_97AC:
  $97AC  18        CLC
  $97AD  69 10     ADC #$10
  $97AF  D9 C0 97  CMP $97C0,Y
  $97B2  F0 02     BEQ $97B6
  $97B4  B0 03     BCS $97B9

L_97B6:
  $97B6  9D 56 03  STA $0356,X

L_97B9:
  $97B9  CA        DEX
  $97BA  88        DEY
  $97BB  E4 00     CPX $00
  $97BD  D0 DE     BNE $979D
  $97BF  60        RTS
  $97C0  0F        .db $0F
  $97C1  15 17     ORA $17,X
  $97C3  35 0F     AND $0F,X
  $97C5  27        .db $27
  $97C6  17        .db $17
  $97C7  07        .db $07
  $97C8  0F        .db $0F
  $97C9  15 17     ORA $17,X
  $97CB  07        .db $07
  $97CC  0F        .db $0F
  $97CD  0F        .db $0F
  $97CE  11 2C     ORA ($2C),Y
  $97D0  0F        .db $0F
  $97D1  0F        .db $0F
  $97D2  25 15     AND $15

L_97D4:
  $97D4  BD 8C 9A  LDA $9A8C,X
  $97D7  8D B6 03  STA $03B6
  $97DA  BD A2 9A  LDA $9AA2,X
  $97DD  8D B7 03  STA $03B7
  $97E0  BD B8 9A  LDA $9AB8,X
  $97E3  85 47     STA $47
  $97E5  A0 00     LDY #$00

L_97E7:
  $97E7  AD A7 05  LDA $05A7
  $97EA  99 B8 03  STA $03B8,Y
  $97ED  EE A7 05  INC $05A7
  $97F0  C8        INY
  $97F1  C4 47     CPY $47
  $97F3  D0 F2     BNE $97E7
  $97F5  E6 B2     INC $B2
  $97F7  60        RTS

L_97F8:
  $97F8  A0 00     LDY #$00

L_97FA:
  $97FA  BD CE 9A  LDA $9ACE,X
  $97FD  99 B8 03  STA $03B8,Y
  $9800  E8        INX
  $9801  C8        INY
  $9802  C0 05     CPY #$05
  $9804  D0 F4     BNE $97FA
  $9806  84 47     STY $47
  $9808  86 B2     STX $B2
  $980A  18        CLC
  $980B  AD B7 03  LDA $03B7
  $980E  69 08     ADC #$08
  $9810  8D B7 03  STA $03B7
  $9813  60        RTS
  $9814  AD 61 04  LDA $0461
  $9817  C9 38     CMP #$38
  $9819  B0 02     BCS $981D
  $981B  E6 B1     INC $B1

L_981D:
  $981D  A9 83     LDA #$83

L_981F:
  $981F  8D 21 04  STA $0421
  $9822  8D A7 05  STA $05A7
  $9825  20 10 9A  JSR $9A10
  $9828  A9 83     LDA #$83
  $982A  8D 21 04  STA $0421
  $982D  C6 B2     DEC $B2
  $982F  D0 6B     BNE $989C
  $9831  A9 3E     LDA #$3E
  $9833  85 B2     STA $B2
  $9835  AD 61 04  LDA $0461
  $9838  48        PHA
  $9839  18        CLC
  $983A  69 28     ADC #$28
  $983C  8D 61 04  STA $0461
  $983F  20 09 A2  JSR $A209
  $9842  68        PLA
  $9843  8D 61 04  STA $0461
  $9846  A5 00     LDA $00
  $9848  85 0B     STA $0B
  $984A  A9 1A     LDA #$1A
  $984C  85 0D     STA $0D
  $984E  A9 00     LDA #$00
  $9850  85 0A     STA $0A
  $9852  85 0C     STA $0C
  $9854  20 74 C8  JSR $C874
  $9857  A9 6B     LDA #$6B
  $9859  A2 01     LDX #$01
  $985B  20 52 A3  JSR $A352
  $985E  B0 3C     BCS $989C
  $9860  18        CLC
  $9861  AD 61 04  LDA $0461
  $9864  69 28     ADC #$28
  $9866  99 70 04  STA $0470,Y
  $9869  18        CLC
  $986A  AD A1 04  LDA $04A1
  $986D  69 36     ADC #$36
  $986F  99 B0 04  STA $04B0,Y
  $9872  A5 0F     LDA $0F
  $9874  99 10 06  STA $0610,Y
  $9877  A5 0E     LDA $0E
  $9879  99 30 06  STA $0630,Y
  $987C  A5 B1     LDA $B1
  $987E  C9 04     CMP #$04
  $9880  90 1A     BCC $989C
  $9882  B9 30 04  LDA $0430,Y
  $9885  09 04     ORA #$04
  $9887  99 30 04  STA $0430,Y
  $988A  A9 00     LDA #$00
  $988C  99 50 06  STA $0650,Y
  $988F  99 70 06  STA $0670,Y
  $9892  A9 01     LDA #$01
  $9894  99 10 06  STA $0610,Y
  $9897  A9 1E     LDA #$1E
  $9899  99 30 06  STA $0630,Y

L_989C:
  $989C  A9 83     LDA #$83
  $989E  8D 21 04  STA $0421
  $98A1  60        RTS
  $98A2  AD 61 04  LDA $0461
  $98A5  C9 98     CMP #$98
  $98A7  90 02     BCC $98AB
  $98A9  C6 B1     DEC $B1

L_98AB:
  $98AB  A9 C3     LDA #$C3
  $98AD  4C 1F 98  JMP $981F
  $98B0  20 18 A1  JSR $A118
  $98B3  A9 00     LDA #$00
  $98B5  8D 81 06  STA $0681
  $98B8  8D A1 06  STA $06A1
  $98BB  CE AB 05  DEC $05AB
  $98BE  D0 41     BNE $9901
  $98C0  A9 0C     LDA #$0C
  $98C2  8D AB 05  STA $05AB
  $98C5  A5 4A     LDA $4A
  $98C7  85 01     STA $01
  $98C9  A9 18     LDA #$18
  $98CB  85 02     STA $02
  $98CD  20 4E C8  JSR $C84E
  $98D0  A5 04     LDA $04
  $98D2  85 08     STA $08
  $98D4  A5 4A     LDA $4A
  $98D6  85 01     STA $01
  $98D8  A9 30     LDA #$30
  $98DA  85 02     STA $02
  $98DC  20 4E C8  JSR $C84E
  $98DF  A5 04     LDA $04
  $98E1  85 09     STA $09
  $98E3  A9 6C     LDA #$6C
  $98E5  A2 01     LDX #$01
  $98E7  20 52 A3  JSR $A352
  $98EA  B0 15     BCS $9901
  $98EC  38        SEC
  $98ED  AD A1 04  LDA $04A1
  $98F0  E9 18     SBC #$18
  $98F2  18        CLC
  $98F3  65 09     ADC $09
  $98F5  99 B0 04  STA $04B0,Y
  $98F8  18        CLC
  $98F9  AD 61 04  LDA $0461
  $98FC  65 08     ADC $08
  $98FE  99 70 04  STA $0470,Y

L_9901:
  $9901  AD E1 04  LDA $04E1
  $9904  D0 16     BNE $991C
  $9906  A9 73     LDA #$73
  $9908  8D 01 04  STA $0401
  $990B  A9 27     LDA #$27
  $990D  8D B6 03  STA $03B6
  $9910  A9 CB     LDA #$CB
  $9912  8D B7 03  STA $03B7
  $9915  A9 14     LDA #$14
  $9917  85 B2     STA $B2
  $9919  EE E1 04  INC $04E1

L_991C:
  $991C  AD E1 04  LDA $04E1
  $991F  C9 02     CMP #$02
  $9921  B0 16     BCS $9939
  $9923  A6 B2     LDX $B2
  $9925  E0 28     CPX #$28
  $9927  F0 04     BEQ $992D
  $9929  20 F8 97  JSR $97F8
  $992C  60        RTS

L_992D:
  $992D  A9 0E     LDA #$0E
  $992F  85 B2     STA $B2
  $9931  A9 00     LDA #$00
  $9933  8D A9 05  STA $05A9
  $9936  EE E1 04  INC $04E1

L_9939:
  $9939  A6 B2     LDX $B2
  $993B  E0 16     CPX #$16
  $993D  B0 28     BCS $9967
  $993F  BD 8C 9A  LDA $9A8C,X
  $9942  8D B6 03  STA $03B6
  $9945  BD A2 9A  LDA $9AA2,X
  $9948  8D B7 03  STA $03B7
  $994B  BD B8 9A  LDA $9AB8,X
  $994E  85 47     STA $47
  $9950  A0 00     LDY #$00
  $9952  AE A9 05  LDX $05A9

L_9955:
  $9955  BD F6 9A  LDA $9AF6,X
  $9958  99 B8 03  STA $03B8,Y
  $995B  E8        INX
  $995C  C8        INY
  $995D  C4 47     CPY $47
  $995F  D0 F4     BNE $9955
  $9961  8E A9 05  STX $05A9
  $9964  E6 B2     INC $B2
  $9966  60        RTS

L_9967:
  $9967  AD C1 06  LDA $06C1
  $996A  C9 1C     CMP #$1C
  $996C  F0 01     BEQ $996F
  $996E  60        RTS

L_996F:
  $996F  E6 B1     INC $B1
  $9971  A9 3E     LDA #$3E
  $9973  85 B2     STA $B2
  $9975  A9 A3     LDA #$A3
  $9977  8D 21 06  STA $0621
  $997A  60        RTS
  $997B  AD E1 04  LDA $04E1
  $997E  F0 1C     BEQ $999C
  $9980  AD A0 04  LDA $04A0
  $9983  C9 E0     CMP #$E0
  $9985  B0 07     BCS $998E
  $9987  EE A0 04  INC $04A0
  $998A  EE A0 04  INC $04A0
  $998D  60        RTS

L_998E:
  $998E  A9 00     LDA #$00
  $9990  8D 20 04  STA $0420
  $9993  C6 B2     DEC $B2
  $9995  D0 04     BNE $999B
  $9997  A9 FF     LDA #$FF
  $9999  85 B1     STA $B1

L_999B:
  $999B  60        RTS

L_999C:
  $999C  20 82 93  JSR $9382
  $999F  AD A1 04  LDA $04A1
  $99A2  F0 16     BEQ $99BA
  $99A4  38        SEC
  $99A5  AD C1 04  LDA $04C1
  $99A8  E9 80     SBC #$80
  $99AA  8D C1 04  STA $04C1
  $99AD  AD A1 04  LDA $04A1
  $99B0  E9 00     SBC #$00
  $99B2  8D A1 04  STA $04A1
  $99B5  D0 03     BNE $99BA
  $99B7  8D 21 04  STA $0421

L_99BA:
  $99BA  A5 4A     LDA $4A
  $99BC  85 01     STA $01
  $99BE  A9 20     LDA #$20
  $99C0  85 02     STA $02
  $99C2  20 4E C8  JSR $C84E
  $99C5  A9 06     LDA #$06
  $99C7  A2 01     LDX #$01
  $99C9  20 52 A3  JSR $A352
  $99CC  B0 16     BCS $99E4
  $99CE  A5 4A     LDA $4A
  $99D0  0A        ASL
  $99D1  A5 4A     LDA $4A
  $99D3  2A        ROL
  $99D4  2A        ROL
  $99D5  2A        ROL
  $99D6  2A        ROL
  $99D7  09 08     ORA #$08
  $99D9  99 70 04  STA $0470,Y
  $99DC  18        CLC
  $99DD  A5 04     LDA $04
  $99DF  69 C8     ADC #$C8
  $99E1  99 B0 04  STA $04B0,Y

L_99E4:
  $99E4  E6 B2     INC $B2
  $99E6  A5 B2     LDA $B2
  $99E8  C9 FD     CMP #$FD
  $99EA  F0 01     BEQ $99ED
  $99EC  60        RTS

L_99ED:
  $99ED  A9 0F     LDA #$0F
  $99EF  A2 10     LDX #$10

L_99F1:
  $99F1  9D 56 03  STA $0356,X
  $99F4  CA        DEX
  $99F5  10 FA     BPL $99F1
  $99F7  EE E1 04  INC $04E1
  $99FA  A9 0B     LDA #$0B
  $99FC  85 2C     STA $2C
  $99FE  A9 00     LDA #$00
  $9A00  8D A0 06  STA $06A0
  $9A03  8D 80 06  STA $0680
  $9A06  A9 0C     LDA #$0C
  $9A08  8D 00 04  STA $0400
  $9A0B  A9 3E     LDA #$3E
  $9A0D  85 B2     STA $B2
  $9A0F  60        RTS

L_9A10:
  $9A10  A9 0F     LDA #$0F
  $9A12  8D 66 03  STA $0366
  $9A15  A5 B1     LDA $B1
  $9A17  C9 04     CMP #$04
  $9A19  B0 0C     BCS $9A27
  $9A1B  A5 A9     LDA $A9
  $9A1D  C9 02     CMP #$02
  $9A1F  F0 0C     BEQ $9A2D
  $9A21  C9 05     CMP #$05
  $9A23  F0 08     BEQ $9A2D
  $9A25  D0 0E     BNE $9A35

L_9A27:
  $9A27  A5 A9     LDA $A9
  $9A29  C9 01     CMP #$01
  $9A2B  D0 08     BNE $9A35

L_9A2D:
  $9A2D  AD 21 04  LDA $0421
  $9A30  09 08     ORA #$08
  $9A32  8D 21 04  STA $0421

L_9A35:
  $9A35  20 9D A5  JSR $A59D
  $9A38  90 43     BCC $9A7D
  $9A3A  A5 B1     LDA $B1
  $9A3C  C9 04     CMP #$04
  $9A3E  B0 16     BCS $9A56
  $9A40  A9 04     LDA #$04
  $9A42  85 B1     STA $B1
  $9A44  A9 0C     LDA #$0C
  $9A46  8D AB 05  STA $05AB
  $9A49  A9 00     LDA #$00
  $9A4B  8D 01 06  STA $0601
  $9A4E  8D 21 06  STA $0621
  $9A51  8D E1 04  STA $04E1
  $9A54  F0 32     BEQ $9A88

L_9A56:
  $9A56  A9 74     LDA #$74
  $9A58  20 0C A1  JSR $A10C
  $9A5B  18        CLC
  $9A5C  AD 61 04  LDA $0461
  $9A5F  69 28     ADC #$28
  $9A61  8D 61 04  STA $0461
  $9A64  A9 57     LDA #$57
  $9A66  8D A1 04  STA $04A1
  $9A69  A9 00     LDA #$00
  $9A6B  8D E1 04  STA $04E1
  $9A6E  A9 56     LDA #$56
  $9A70  20 2D A2  JSR $A22D
  $9A73  B0 05     BCS $9A7A
  $9A75  A9 00     LDA #$00
  $9A77  99 30 04  STA $0430,Y

L_9A7A:
  $9A7A  4C 25 96  JMP $9625

L_9A7D:
  $9A7D  A5 02     LDA $02
  $9A7F  C9 01     CMP #$01
  $9A81  D0 05     BNE $9A88

L_9A83:
  $9A83  A9 30     LDA #$30
  $9A85  8D 66 03  STA $0366

L_9A88:
  $9A88  20 A4 91  JSR $91A4
  $9A8B  60        RTS
  $9A8C  25 25     AND $25
  $9A8E  25 25     AND $25
  $9A90  25 25     AND $25
  $9A92  25 25     AND $25
  $9A94  26 26     ROL $26
  $9A96  26 26     ROL $26
  $9A98  26 26     ROL $26
  $9A9A  25 25     AND $25
  $9A9C  25 25     AND $25
  $9A9E  26 26     ROL $26
  $9AA0  26 26     ROL $26
  $9AA2  17        .db $17
  $9AA3  36 56     ROL $56,X
  $9AA5  71 90     ADC ($90),Y
  $9AA7  B0 D0     BCS $9A79
  $9AA9  F0 0E     BEQ $9AB9
  $9AAB  2E 4E 6E  ROL $6E4E
  $9AAE  93        .db $93
  $9AAF  B4 90     LDY $90,X
  $9AB1  B0 D0     BCS $9A83
  $9AB3  F0 0E     BEQ $9AC3
  $9AB5  2E 4E 6E  ROL $6E4E
  $9AB8  04        .db $04

L_9AB9:
  $9AB9  05 06     ORA $06
  $9ABB  0B        .db $0B
  $9ABC  0D 0D 0D  ORA $0D0D
  $9ABF  0D 0F 0E  ORA $0E0F
  $9AC2  0D 0C 04  ORA $040C
  $9AC5  02        .db $02
  $9AC6  04        .db $04
  $9AC7  04        .db $04
  $9AC8  04        .db $04
  $9AC9  04        .db $04
  $9ACA  06 07     ASL $07
  $9ACC  05 04     ORA $04
  $9ACE  FF        .db $FF
  $9ACF  AF        .db $AF
  $9AD0  FF        .db $FF
  $9AD1  BF        .db $BF
  $9AD2  FF        .db $FF
  $9AD3  FF        .db $FF
  $9AD4  FD FF FA  SBC $FAFF,X
  $9AD7  EE F7 BF  INC $BFF7
  $9ADA  AF        .db $AF
  $9ADB  FF        .db $FF
  $9ADC  FF        .db $FF
  $9ADD  FF        .db $FF
  $9ADE  FB        .db $FB
  $9ADF  FA        .db $FA
  $9AE0  FF        .db $FF
  $9AE1  FF        .db $FF
  $9AE2  FF        .db $FF
  $9AE3  AF        .db $AF
  $9AE4  FF        .db $FF
  $9AE5  BF        .db $BF
  $9AE6  FF        .db $FF
  $9AE7  FF        .db $FF
  $9AE8  EE FF FA  INC $FAFF
  $9AEB  EE FB BE  INC $BEFB
  $9AEE  AF        .db $AF
  $9AEF  FF        .db $FF
  $9AF0  FF        .db $FF
  $9AF1  FF        .db $FF
  $9AF2  FB        .db $FB
  $9AF3  FA        .db $FA
  $9AF4  FF        .db $FF
  $9AF5  FF        .db $FF
  $9AF6  00        BRK
  $9AF7  E6 E7     INC $E7
  $9AF9  E8        INX
  $9AFA  00        BRK
  $9AFB  00        BRK
  $9AFC  E9 EA     SBC #$EA
  $9AFE  00        BRK
  $9AFF  00        BRK
  $9B00  EB        .db $EB
  $9B01  EC ED EE  CPX $EEED
  $9B04  EF        .db $EF
  $9B05  F0 00     BEQ $9B07

L_9B07:
  $9B07  00        BRK
  $9B08  F1 F2     SBC ($F2),Y
  $9B0A  F3        .db $F3
  $9B0B  F4        .db $F4
  $9B0C  F5 F6     SBC $F6,X
  $9B0E  F7        .db $F7
  $9B0F  F8        SED
  $9B10  F9 FA FB  SBC $FBFA,Y
  $9B13  00        BRK
  $9B14  00        BRK
  $9B15  00        BRK
  $9B16  00        BRK
  $9B17  FC        .db $FC
  $9B18  00        BRK
  $9B19  00        BRK
  $9B1A  00        BRK
  $9B1B  00        BRK
  $9B1C  CE 14 A2  DEC $A214
  $9B1F  B0 14     BCS $9B35
  $9B21  A2 7B     LDX #$7B
  $9B23  96 98     STX $98,Y
  $9B25  98        TYA
  $9B26  98        TYA
  $9B27  98        TYA
  $9B28  98        TYA
  $9B29  99 CA BD  STA $BDCA,Y
  $9B2C  BD 9F 85  LDA $859F,X
  $9B2F  08        PHP
  $9B30  BD C8 9F  LDA $9FC8,X
  $9B33  85 09     STA $09

L_9B35:
  $9B35  6C 08 00  JMP ($0008)
  $9B38  AD E1 04  LDA $04E1
  $9B3B  D0 20     BNE $9B5D
  $9B3D  A0 0F     LDY #$0F
  $9B3F  A2 0E     LDX #$0E
  $9B41  20 E0 D3  JSR $D3E0
  $9B44  A9 08     LDA #$08
  $9B46  8D AE 04  STA $04AE
  $9B49  A9 B4     LDA #$B4
  $9B4B  8D 6E 04  STA $046E
  $9B4E  A9 7D     LDA #$7D
  $9B50  85 B2     STA $B2
  $9B52  A9 00     LDA #$00
  $9B54  8D 54 03  STA $0354
  $9B57  8D 55 03  STA $0355
  $9B5A  EE E1 04  INC $04E1

L_9B5D:
  $9B5D  AD E1 04  LDA $04E1
  $9B60  C9 02     CMP #$02
  $9B62  B0 31     BCS $9B95
  $9B64  AD 2E 04  LDA $042E
  $9B67  10 14     BPL $9B7D
  $9B69  AD AE 04  LDA $04AE
  $9B6C  C9 90     CMP #$90
  $9B6E  90 0C     BCC $9B7C
  $9B70  A2 83     LDX #$83
  $9B72  8E 21 04  STX $0421
  $9B75  C9 E0     CMP #$E0
  $9B77  90 03     BCC $9B7C
  $9B79  4E 2E 04  LSR $042E

L_9B7C:
  $9B7C  60        RTS

L_9B7D:
  $9B7D  C6 B2     DEC $B2
  $9B7F  D0 FB     BNE $9B7C
  $9B81  A2 02     LDX #$02

L_9B83:
  $9B83  BD 50 9C  LDA $9C50,X
  $9B86  9D 6F 03  STA $036F,X
  $9B89  CA        DEX
  $9B8A  10 F7     BPL $9B83
  $9B8C  EE E1 04  INC $04E1
  $9B8F  A9 76     LDA #$76
  $9B91  20 0C A1  JSR $A10C

L_9B94:
  $9B94  60        RTS

L_9B95:
  $9B95  D0 3E     BNE $9BD5
  $9B97  AD A1 06  LDA $06A1
  $9B9A  C9 03     CMP #$03
  $9B9C  D0 F6     BNE $9B94
  $9B9E  A9 00     LDA #$00
  $9BA0  8D 81 06  STA $0681
  $9BA3  A2 0A     LDX #$0A
  $9BA5  A5 B2     LDA $B2
  $9BA7  C9 7D     CMP #$7D
  $9BA9  90 02     BCC $9BAD
  $9BAB  A2 12     LDX #$12

L_9BAD:
  $9BAD  A5 B2     LDA $B2
  $9BAF  29 04     AND #$04
  $9BB1  F0 05     BEQ $9BB8
  $9BB3  8A        TXA
  $9BB4  18        CLC
  $9BB5  69 08     ADC #$08
  $9BB7  AA        TAX

L_9BB8:
  $9BB8  A0 07     LDY #$07

L_9BBA:
  $9BBA  BD 50 9C  LDA $9C50,X
  $9BBD  99 6E 03  STA $036E,Y
  $9BC0  CA        DEX
  $9BC1  88        DEY
  $9BC2  10 F6     BPL $9BBA
  $9BC4  E6 B2     INC $B2
  $9BC6  A5 B2     LDA $B2
  $9BC8  C9 FD     CMP #$FD
  $9BCA  D0 08     BNE $9BD4
  $9BCC  EE E1 04  INC $04E1
  $9BCF  A9 77     LDA #$77
  $9BD1  20 0C A1  JSR $A10C

L_9BD4:
  $9BD4  60        RTS

L_9BD5:
  $9BD5  AD 61 04  LDA $0461
  $9BD8  C9 D8     CMP #$D8
  $9BDA  F0 11     BEQ $9BED
  $9BDC  18        CLC
  $9BDD  AD 81 04  LDA $0481
  $9BE0  69 80     ADC #$80
  $9BE2  8D 81 04  STA $0481
  $9BE5  AD 61 04  LDA $0461
  $9BE8  69 00     ADC #$00
  $9BEA  8D 61 04  STA $0461

L_9BED:
  $9BED  20 18 A1  JSR $A118
  $9BF0  AD C1 06  LDA $06C1
  $9BF3  C9 1C     CMP #$1C
  $9BF5  D0 DD     BNE $9BD4
  $9BF7  E6 B1     INC $B1
  $9BF9  A9 0E     LDA #$0E
  $9BFB  85 B2     STA $B2
  $9BFD  A9 3E     LDA #$3E
  $9BFF  8D A7 05  STA $05A7
  $9C02  A9 00     LDA #$00
  $9C04  8D A9 05  STA $05A9
  $9C07  A9 30     LDA #$30
  $9C09  8D 5F 03  STA $035F
  $9C0C  A9 01     LDA #$01
  $9C0E  85 2B     STA $2B
  $9C10  A2 0C     LDX #$0C

L_9C12:
  $9C12  86 02     STX $02
  $9C14  A9 70     LDA #$70

L_9C16:
  $9C16  20 59 A3  JSR $A359
  $9C19  A6 02     LDX $02

L_9C1B:
  $9C1B  BD 36 9C  LDA $9C36,X
  $9C1E  9D B0 04  STA $04B0,X
  $9C21  BD 43 9C  LDA $9C43,X
  $9C24  48        PHA

L_9C25:
  $9C25  29 F0     AND #$F0
  $9C27  09 04     ORA #$04
  $9C29  9D 70 04  STA $0470,X
  $9C2C  68        PLA
  $9C2D  29 0F     AND #$0F
  $9C2F  9D B0 06  STA $06B0,X
  $9C32  CA        DEX
  $9C33  10 DD     BPL $9C12
  $9C35  60        RTS
  $9C36  34        .db $34
  $9C37  34        .db $34
  $9C38  64        .db $64
  $9C39  94 B4     STY $B4,X
  $9C3B  D4        .db $D4
  $9C3C  24 44     BIT $44
  $9C3E  54        .db $54
  $9C3F  74        .db $74
  $9C40  84 B4     STY $B4
  $9C42  C4 20     CPY $20
  $9C44  B0 D0     BCS $9C16
  $9C46  70 40     BVS $9C88
  $9C48  F0 D1     BEQ $9C1B
  $9C4A  51 01     EOR ($01),Y
  $9C4C  A1 31     LDA ($31,X)
  $9C4E  E1 11     SBC ($11,X)
  $9C50  30 38     BMI $9C8A
  $9C52  16 0F     ASL $0F,X
  $9C54  16 30     ASL $30,X
  $9C56  30 0F     BMI $9C67
  $9C58  16 38     ASL $38,X
  $9C5A  38        SEC
  $9C5B  0F        .db $0F
  $9C5C  16 38     ASL $38,X
  $9C5E  29 0F     AND #$0F
  $9C60  16 38     ASL $38,X
  $9C62  29 0F     AND #$0F
  $9C64  16 29     ASL $29,X
  $9C66  19 0F 16  ORA $160F,Y
  $9C69  29 19     AND #$19
  $9C6B  20 D8 9C  JSR $9CD8
  $9C6E  20 46 A1  JSR $A146
  $9C71  A2 0F     LDX #$0F
  $9C73  A5 02     LDA $02
  $9C75  C9 01     CMP #$01
  $9C77  D0 0F     BNE $9C88
  $9C79  AD AA 05  LDA $05AA
  $9C7C  F0 08     BEQ $9C86
  $9C7E  A9 00     LDA #$00
  $9C80  8D E1 04  STA $04E1
  $9C83  E6 B1     INC $B1
  $9C85  60        RTS

L_9C86:
  $9C86  A2 30     LDX #$30

L_9C88:
  $9C88  8E 66 03  STX $0366
  $9C8B  18        CLC
  $9C8C  A5 B7     LDA $B7
  $9C8E  69 60     ADC #$60
  $9C90  85 B7     STA $B7
  $9C92  A5 B8     LDA $B8
  $9C94  69 01     ADC #$01
  $9C96  85 B8     STA $B8
  $9C98  A5 B9     LDA $B9
  $9C9A  69 00     ADC #$00
  $9C9C  85 B9     STA $B9
  $9C9E  20 09 A2  JSR $A209
  $9CA1  CE A7 05  DEC $05A7
  $9CA4  D0 11     BNE $9CB7
  $9CA6  A9 3E     LDA #$3E
  $9CA8  8D A7 05  STA $05A7
  $9CAB  A9 6F     LDA #$6F
  $9CAD  20 52 A3  JSR $A352
  $9CB0  B0 05     BCS $9CB7
  $9CB2  A9 04     LDA #$04
  $9CB4  20 53 90  JSR $9053

L_9CB7:
  $9CB7  60        RTS
  $9CB8  B9 19 00  LDA $0019,Y
  $9CBB  E7        .db $E7
  $9CBC  47        .db $47
  $9CBD  E7        .db $E7
  $9CBE  00        BRK
  $9CBF  19 FE FF  ORA $FFFE,Y
  $9CC2  00        BRK
  $9CC3  00        BRK
  $9CC4  01 00     ORA ($00,X)
  $9CC6  00        BRK
  $9CC7  FF        .db $FF
  $9CC8  00        BRK
  $9CC9  E7        .db $E7
  $9CCA  47        .db $47
  $9CCB  E7        .db $E7
  $9CCC  00        BRK
  $9CCD  E7        .db $E7
  $9CCE  47        .db $47
  $9CCF  E7        .db $E7
  $9CD0  00        BRK
  $9CD1  00        BRK
  $9CD2  01 00     ORA ($00,X)
  $9CD4  00        BRK
  $9CD5  00        BRK
  $9CD6  01 00     ORA ($00,X)

L_9CD8:
  $9CD8  C6 B2     DEC $B2
  $9CDA  D0 07     BNE $9CE3
  $9CDC  EE A9 05  INC $05A9
  $9CDF  A9 1C     LDA #$1C
  $9CE1  85 B2     STA $B2

L_9CE3:
  $9CE3  AD A9 05  LDA $05A9
  $9CE6  48        PHA
  $9CE7  29 07     AND #$07
  $9CE9  AA        TAX
  $9CEA  BD B8 9C  LDA $9CB8,X
  $9CED  8D 61 06  STA $0661
  $9CF0  BD C0 9C  LDA $9CC0,X
  $9CF3  8D 41 06  STA $0641
  $9CF6  BD C8 9C  LDA $9CC8,X
  $9CF9  8D 21 06  STA $0621
  $9CFC  BD D0 9C  LDA $9CD0,X
  $9CFF  8D 01 06  STA $0601
  $9D02  A2 83     LDX #$83
  $9D04  68        PLA
  $9D05  29 08     AND #$08
  $9D07  F0 02     BEQ $9D0B
  $9D09  A2 C3     LDX #$C3

L_9D0B:
  $9D0B  8E 21 04  STX $0421
  $9D0E  60        RTS
  $9D0F  AE E1 04  LDX $04E1
  $9D12  D0 24     BNE $9D38
  $9D14  A9 E0     LDA #$E0
  $9D16  8D B7 03  STA $03B7
  $9D19  A9 0F     LDA #$0F
  $9D1B  8D B6 03  STA $03B6
  $9D1E  A9 00     LDA #$00
  $9D20  8D A9 05  STA $05A9
  $9D23  A9 94     LDA #$94
  $9D25  8D A7 05  STA $05A7
  $9D28  A9 80     LDA #$80
  $9D2A  85 B2     STA $B2
  $9D2C  EE E1 04  INC $04E1
  $9D2F  E8        INX
  $9D30  A9 FF     LDA #$FF
  $9D32  20 51 C0  JSR $C051
  $9D35  4E 21 04  LSR $0421

L_9D38:
  $9D38  CA        DEX
  $9D39  BD CB 9F  LDA $9FCB,X
  $9D3C  85 09     STA $09
  $9D3E  BD C0 9F  LDA $9FC0,X
  $9D41  85 08     STA $08
  $9D43  6C 08 00  JMP ($0008)

L_9D46:
  $9D46  A5 1C     LDA $1C
  $9D48  29 0F     AND #$0F
  $9D4A  D0 05     BNE $9D51
  $9D4C  A9 2B     LDA #$2B
  $9D4E  20 51 C0  JSR $C051

L_9D51:
  $9D51  A2 10     LDX #$10
  $9D53  A0 0F     LDY #$0F
  $9D55  A5 1C     LDA $1C
  $9D57  29 04     AND #$04
  $9D59  D0 02     BNE $9D5D
  $9D5B  A0 30     LDY #$30

L_9D5D:
  $9D5D  98        TYA

L_9D5E:
  $9D5E  9D 56 03  STA $0356,X
  $9D61  CA        DEX
  $9D62  10 FA     BPL $9D5E
  $9D64  60        RTS
  $9D65  20 46 9D  JSR $9D46
  $9D68  A5 B2     LDA $B2
  $9D6A  F0 08     BEQ $9D74
  $9D6C  A9 08     LDA #$08
  $9D6E  20 F1 C5  JSR $C5F1
  $9D71  C6 B2     DEC $B2
  $9D73  60        RTS

L_9D74:
  $9D74  EE E1 04  INC $04E1
  $9D77  A9 00     LDA #$00
  $9D79  85 FD     STA $FD
  $9D7B  A9 0F     LDA #$0F
  $9D7D  85 FE     STA $FE
  $9D7F  60        RTS
  $9D80  20 46 9D  JSR $9D46
  $9D83  A5 FD     LDA $FD
  $9D85  C9 60     CMP #$60
  $9D87  B0 04     BCS $9D8D
  $9D89  20 0C CB  JSR $CB0C
  $9D8C  60        RTS

L_9D8D:
  $9D8D  EE E1 04  INC $04E1
  $9D90  A9 00     LDA #$00
  $9D92  8D A7 05  STA $05A7
  $9D95  A9 8D     LDA #$8D
  $9D97  8D A9 05  STA $05A9
  $9D9A  A9 00     LDA #$00
  $9D9C  85 1A     STA $1A
  $9D9E  85 1B     STA $1B
  $9DA0  F0 0A     BEQ $9DAC
  $9DA2  20 46 9D  JSR $9D46
  $9DA5  AD A7 05  LDA $05A7
  $9DA8  29 3F     AND #$3F
  $9DAA  F0 1B     BEQ $9DC7

L_9DAC:
  $9DAC  A9 0C     LDA #$0C
  $9DAE  85 2A     STA $2A
  $9DB0  AD A7 05  LDA $05A7
  $9DB3  85 08     STA $08
  $9DB5  AD A9 05  LDA $05A9
  $9DB8  85 09     STA $09
  $9DBA  20 0B CA  JSR $CA0B
  $9DBD  A9 0D     LDA #$0D
  $9DBF  85 2A     STA $2A
  $9DC1  EE A7 05  INC $05A7
  $9DC4  E6 1A     INC $1A
  $9DC6  60        RTS

L_9DC7:
  $9DC7  EE E1 04  INC $04E1
  $9DCA  E6 20     INC $20
  $9DCC  EE 40 04  INC $0440
  $9DCF  EE 41 04  INC $0441
  $9DD2  A9 00     LDA #$00
  $9DD4  85 B8     STA $B8
  $9DD6  85 B9     STA $B9
  $9DD8  A2 10     LDX #$10

L_9DDA:
  $9DDA  BD 30 9E  LDA $9E30,X
  $9DDD  9D 56 03  STA $0356,X
  $9DE0  CA        DEX
  $9DE1  10 F7     BPL $9DDA
  $9DE3  A0 10     LDY #$10
  $9DE5  A2 0E     LDX #$0E
  $9DE7  20 E0 D3  JSR $D3E0
  $9DEA  A9 80     LDA #$80
  $9DEC  8D 2E 04  STA $042E
  $9DEF  A9 A7     LDA #$A7
  $9DF1  8D AE 04  STA $04AE
  $9DF4  A9 E0     LDA #$E0
  $9DF6  8D 6E 04  STA $046E
  $9DF9  A0 11     LDY #$11
  $9DFB  A2 0D     LDX #$0D
  $9DFD  20 E0 D3  JSR $D3E0
  $9E00  A9 80     LDA #$80
  $9E02  8D 6D 04  STA $046D
  $9E05  A9 37     LDA #$37
  $9E07  8D AD 04  STA $04AD
  $9E0A  A9 80     LDA #$80
  $9E0C  8D 21 04  STA $0421
  $9E0F  A9 80     LDA #$80
  $9E11  8D A1 04  STA $04A1
  $9E14  A9 D8     LDA #$D8
  $9E16  8D 61 04  STA $0461
  $9E19  A9 0E     LDA #$0E
  $9E1B  85 B2     STA $B2
  $9E1D  A9 00     LDA #$00
  $9E1F  8D A9 05  STA $05A9
  $9E22  8D AB 05  STA $05AB
  $9E25  A9 78     LDA #$78
  $9E27  20 0C A1  JSR $A10C
  $9E2A  A9 2A     LDA #$2A
  $9E2C  20 51 C0  JSR $C051
  $9E2F  60        RTS
  $9E30  0F        .db $0F
  $9E31  20 11 01  JSR $0111
  $9E34  0F        .db $0F
  $9E35  20 2C 1C  JSR $1C2C
  $9E38  0F        .db $0F
  $9E39  20 23 13  JSR $1323
  $9E3C  0F        .db $0F
  $9E3D  20 0F 0F  JSR $0F0F
  $9E40  0F        .db $0F
  $9E41  20 6D 9E  JSR $9E6D
  $9E44  AD A9 05  LDA $05A9
  $9E47  C9 24     CMP #$24
  $9E49  F0 09     BEQ $9E54
  $9E4B  20 D8 9C  JSR $9CD8
  $9E4E  86 03     STX $03
  $9E50  20 57 A1  JSR $A157
  $9E53  60        RTS

L_9E54:
  $9E54  A9 84     LDA #$84
  $9E56  8D 21 04  STA $0421
  $9E59  A9 00     LDA #$00
  $9E5B  85 B2     STA $B2
  $9E5D  8D 01 06  STA $0601
  $9E60  8D 21 06  STA $0621
  $9E63  8D 41 06  STA $0641
  $9E66  8D 61 06  STA $0661
  $9E69  EE E1 04  INC $04E1
  $9E6C  60        RTS

L_9E6D:
  $9E6D  A2 2C     LDX #$2C
  $9E6F  A5 1C     LDA $1C
  $9E71  29 04     AND #$04
  $9E73  D0 02     BNE $9E77
  $9E75  A2 00     LDX #$00

L_9E77:
  $9E77  8E 70 03  STX $0370
  $9E7A  60        RTS
  $9E7B  0F        .db $0F
  $9E7C  20 0F 0F  JSR $0F0F
  $9E7F  0F        .db $0F
  $9E80  20 0C 0F  JSR $0F0C
  $9E83  0F        .db $0F
  $9E84  20 1C 0C  JSR $0C1C
  $9E87  0F        .db $0F
  $9E88  20 11 0C  JSR $0C11
  $9E8B  0F        .db $0F
  $9E8C  20 11 01  JSR $0111
  $9E8F  20 6D 9E  JSR $9E6D
  $9E92  A9 80     LDA #$80
  $9E94  85 03     STA $03
  $9E96  20 57 A1  JSR $A157
  $9E99  A9 04     LDA #$04
  $9E9B  85 01     STA $01
  $9E9D  85 02     STA $02
  $9E9F  20 49 A2  JSR $A249
  $9EA2  A5 00     LDA $00
  $9EA4  F0 14     BEQ $9EBA
  $9EA6  A6 B2     LDX $B2
  $9EA8  E0 02     CPX #$02
  $9EAA  F0 0F     BEQ $9EBB
  $9EAC  BD EF 9E  LDA $9EEF,X
  $9EAF  8D 61 06  STA $0661
  $9EB2  BD F1 9E  LDA $9EF1,X
  $9EB5  8D 41 06  STA $0641
  $9EB8  E6 B2     INC $B2

L_9EBA:
  $9EBA  60        RTS

L_9EBB:
  $9EBB  4E 2E 04  LSR $042E
  $9EBE  A9 79     LDA #$79
  $9EC0  20 0C A1  JSR $A10C
  $9EC3  A9 A7     LDA #$A7
  $9EC5  8D A1 04  STA $04A1
  $9EC8  A9 E0     LDA #$E0
  $9ECA  8D 61 04  STA $0461
  $9ECD  A9 3E     LDA #$3E
  $9ECF  85 B2     STA $B2
  $9ED1  A9 00     LDA #$00
  $9ED3  8D A7 05  STA $05A7
  $9ED6  EE E1 04  INC $04E1
  $9ED9  4E 2D 04  LSR $042D
  $9EDC  A2 0F     LDX #$0F

L_9EDE:
  $9EDE  5E 30 04  LSR $0430,X
  $9EE1  CA        DEX
  $9EE2  10 FA     BPL $9EDE
  $9EE4  A9 30     LDA #$30
  $9EE6  8D 74 03  STA $0374
  $9EE9  A9 15     LDA #$15
  $9EEB  8D 75 03  STA $0375
  $9EEE  60        RTS
  $9EEF  76 00     ROR $00,X
  $9EF1  03        .db $03
  $9EF2  02        .db $02
  $9EF3  A5 B2     LDA $B2
  $9EF5  F0 1B     BEQ $9F12
  $9EF7  A5 1C     LDA $1C
  $9EF9  29 07     AND #$07
  $9EFB  D0 05     BNE $9F02
  $9EFD  A9 2B     LDA #$2B
  $9EFF  20 51 C0  JSR $C051

L_9F02:
  $9F02  A2 0F     LDX #$0F
  $9F04  A5 1C     LDA $1C
  $9F06  29 04     AND #$04
  $9F08  D0 02     BNE $9F0C
  $9F0A  A2 30     LDX #$30

L_9F0C:
  $9F0C  8E 66 03  STX $0366
  $9F0F  C6 B2     DEC $B2
  $9F11  60        RTS

L_9F12:
  $9F12  A9 0F     LDA #$0F
  $9F14  8D 66 03  STA $0366
  $9F17  EE A7 05  INC $05A7
  $9F1A  AD A7 05  LDA $05A7
  $9F1D  C9 41     CMP #$41
  $9F1F  F0 14     BEQ $9F35
  $9F21  4A        LSR
  $9F22  4A        LSR
  $9F23  29 1C     AND #$1C
  $9F25  AA        TAX
  $9F26  A0 00     LDY #$00

L_9F28:
  $9F28  BD 7B 9E  LDA $9E7B,X
  $9F2B  99 62 03  STA $0362,Y
  $9F2E  E8        INX
  $9F2F  C8        INY
  $9F30  C0 04     CPY #$04
  $9F32  D0 F4     BNE $9F28
  $9F34  60        RTS

L_9F35:
  $9F35  EE E1 04  INC $04E1
  $9F38  A9 7A     LDA #$7A
  $9F3A  20 0C A1  JSR $A10C
  $9F3D  A9 84     LDA #$84
  $9F3F  8D 21 04  STA $0421
  $9F42  A9 50     LDA #$50
  $9F44  8D 21 06  STA $0621
  $9F47  A9 00     LDA #$00
  $9F49  8D 01 06  STA $0601
  $9F4C  A9 53     LDA #$53
  $9F4E  8D 61 06  STA $0661
  $9F51  A9 06     LDA #$06
  $9F53  8D 41 06  STA $0641
  $9F56  60        RTS
  $9F57  A9 84     LDA #$84
  $9F59  85 03     STA $03
  $9F5B  20 57 A1  JSR $A157
  $9F5E  A9 0C     LDA #$0C
  $9F60  85 01     STA $01
  $9F62  85 02     STA $02
  $9F64  20 49 A2  JSR $A249
  $9F67  A5 00     LDA $00
  $9F69  D0 01     BNE $9F6C
  $9F6B  60        RTS

L_9F6C:
  $9F6C  AD 20 04  LDA $0420
  $9F6F  29 BF     AND #$BF
  $9F71  AE 60 04  LDX $0460
  $9F74  E0 B0     CPX #$B0
  $9F76  B0 02     BCS $9F7A
  $9F78  09 40     ORA #$40

L_9F7A:
  $9F7A  8D 20 04  STA $0420
  $9F7D  A9 7B     LDA #$7B
  $9F7F  20 0C A1  JSR $A10C
  $9F82  EE E1 04  INC $04E1
  $9F85  A9 FD     LDA #$FD
  $9F87  8D A7 05  STA $05A7
  $9F8A  A9 80     LDA #$80
  $9F8C  8D A9 05  STA $05A9
  $9F8F  A9 02     LDA #$02
  $9F91  8D AB 05  STA $05AB
  $9F94  A9 16     LDA #$16
  $9F96  20 51 C0  JSR $C051
  $9F99  60        RTS
  $9F9A  20 09 A2  JSR $A209
  $9F9D  AD A7 05  LDA $05A7
  $9FA0  F0 04     BEQ $9FA6
  $9FA2  CE A7 05  DEC $05A7
  $9FA5  60        RTS

L_9FA6:
  $9FA6  A9 00     LDA #$00
  $9FA8  8D A1 06  STA $06A1
  $9FAB  8D 81 06  STA $0681
  $9FAE  CE A9 05  DEC $05A9
  $9FB1  D0 09     BNE $9FBC
  $9FB3  CE AB 05  DEC $05AB
  $9FB6  D0 04     BNE $9FBC
  $9FB8  A9 FF     LDA #$FF
  $9FBA  85 B1     STA $B1

L_9FBC:
  $9FBC  60        RTS
  $9FBD  38        SEC
  $9FBE  6B        .db $6B
  $9FBF  0F        .db $0F
  $9FC0  65 80     ADC $80
  $9FC2  A2 41     LDX #$41
  $9FC4  8F        .db $8F
  $9FC5  F3        .db $F3
  $9FC6  57        .db $57
  $9FC7  9A        TXS
  $9FC8  9B        .db $9B
  $9FC9  9C        .db $9C
  $9FCA  9D 9D 9D  STA $9D9D,X
  $9FCD  9D 9E 9E  STA $9E9E,X
  $9FD0  9E        .db $9E
  $9FD1  9F        .db $9F
  $9FD2  9F        .db $9F

L_9FD3:
  $9FD3  38        SEC
  $9FD4  A5 B3     LDA $B3
  $9FD6  E9 08     SBC #$08
  $9FD8  90 0E     BCC $9FE8
  $9FDA  AA        TAX
  $9FDB  BD 00 A1  LDA $A100,X
  $9FDE  85 08     STA $08
  $9FE0  BD 06 A1  LDA $A106,X
  $9FE3  85 09     STA $09
  $9FE5  6C 08 00  JMP ($0008)

L_9FE8:
  $9FE8  A9 00     LDA #$00
  $9FEA  8D 81 06  STA $0681
  $9FED  AD A7 05  LDA $05A7
  $9FF0  C9 10     CMP #$10
  $9FF2  90 03     BCC $9FF7
  $9FF4  4C 8B A0  JMP $A08B

L_9FF7:
  $9FF7  29 01     AND #$01
  $9FF9  D0 3C     BNE $A037
  $9FFB  AD A7 05  LDA $05A7
  $9FFE  29 07     AND #$07
  $A000  85 02     STA $02
  $A002  A2 01     LDX #$01

L_A004:
  $A004  86 01     STX $01
  $A006  A9 60     LDA #$60
  $A008  20 59 A3  JSR $A359
  $A00B  A6 02     LDX $02
  $A00D  18        CLC
  $A00E  AD 61 04  LDA $0461
  $A011  7D E0 C1  ADC $C1E0,X
  $A014  99 70 04  STA $0470,Y
  $A017  AD 41 04  LDA $0441
  $A01A  7D E8 C1  ADC $C1E8,X
  $A01D  99 50 04  STA $0450,Y
  $A020  18        CLC
  $A021  AD A1 04  LDA $04A1
  $A024  7D D8 C1  ADC $C1D8,X
  $A027  99 B0 04  STA $04B0,Y
  $A02A  A9 01     LDA #$01
  $A02C  99 B0 06  STA $06B0,Y
  $A02F  E8        INX
  $A030  86 02     STX $02
  $A032  A6 01     LDX $01
  $A034  CA        DEX
  $A035  10 CD     BPL $A004

L_A037:
  $A037  EE A7 05  INC $05A7
  $A03A  AD A7 05  LDA $05A7
  $A03D  C9 10     CMP #$10
  $A03F  D0 49     BNE $A08A
  $A041  A2 1B     LDX #$1B
  $A043  AD 61 04  LDA $0461
  $A046  85 08     STA $08
  $A048  AD 41 04  LDA $0441
  $A04B  85 09     STA $09
  $A04D  AD A1 04  LDA $04A1
  $A050  85 0A     STA $0A
  $A052  A9 60     LDA #$60
  $A054  85 0B     STA $0B
  $A056  20 A8 C3  JSR $C3A8
  $A059  A9 41     LDA #$41
  $A05B  20 51 C0  JSR $C051
  $A05E  A9 FF     LDA #$FF
  $A060  20 51 C0  JSR $C051
  $A063  A5 2A     LDA $2A
  $A065  C9 0C     CMP #$0C
  $A067  D0 21     BNE $A08A
  $A069  A9 76     LDA #$76
  $A06B  A2 0E     LDX #$0E
  $A06D  20 59 A3  JSR $A359
  $A070  A9 02     LDA #$02
  $A072  8D 5E 06  STA $065E
  $A075  A9 85     LDA #$85
  $A077  8D 3E 04  STA $043E
  $A07A  EE FE 04  INC $04FE
  $A07D  A5 BC     LDA $BC
  $A07F  C9 FF     CMP #$FF
  $A081  F0 07     BEQ $A08A
  $A083  4E 21 04  LSR $0421
  $A086  A9 00     LDA #$00
  $A088  85 B1     STA $B1

L_A08A:
  $A08A  60        RTS

L_A08B:
  $A08B  4E 21 04  LSR $0421
  $A08E  AD A7 05  LDA $05A7
  $A091  C9 FD     CMP #$FD
  $A093  B0 04     BCS $A099
  $A095  EE A7 05  INC $05A7
  $A098  60        RTS

L_A099:
  $A099  D0 0E     BNE $A0A9
  $A09B  EE A7 05  INC $05A7
  $A09E  A9 FD     LDA #$FD
  $A0A0  8D A9 05  STA $05A9
  $A0A3  A9 15     LDA #$15
  $A0A5  20 51 C0  JSR $C051
  $A0A8  60        RTS

L_A0A9:
  $A0A9  C9 FE     CMP #$FE
  $A0AB  D0 0D     BNE $A0BA
  $A0AD  CE A9 05  DEC $05A9
  $A0B0  D0 4D     BNE $A0FF
  $A0B2  EE A7 05  INC $05A7
  $A0B5  A9 D0     LDA #$D0
  $A0B7  8D A9 05  STA $05A9

L_A0BA:
  $A0BA  AD A9 05  LDA $05A9
  $A0BD  C9 40     CMP #$40
  $A0BF  90 1B     BCC $A0DC
  $A0C1  D0 33     BNE $A0F6
  $A0C3  CE A9 05  DEC $05A9
  $A0C6  A9 26     LDA #$26
  $A0C8  8D 00 04  STA $0400
  $A0CB  A9 00     LDA #$00
  $A0CD  8D A0 06  STA $06A0
  $A0D0  8D 80 06  STA $0680
  $A0D3  A9 0B     LDA #$0B
  $A0D5  85 2C     STA $2C
  $A0D7  A9 3A     LDA #$3A
  $A0D9  20 51 C0  JSR $C051

L_A0DC:
  $A0DC  AD A0 06  LDA $06A0
  $A0DF  C9 03     CMP #$03
  $A0E1  D0 1C     BNE $A0FF
  $A0E3  AD 20 04  LDA $0420
  $A0E6  10 0E     BPL $A0F6
  $A0E8  38        SEC
  $A0E9  AD A0 04  LDA $04A0
  $A0EC  E9 08     SBC #$08
  $A0EE  8D A0 04  STA $04A0
  $A0F1  B0 0C     BCS $A0FF
  $A0F3  4E 20 04  LSR $0420

L_A0F6:
  $A0F6  CE A9 05  DEC $05A9
  $A0F9  D0 04     BNE $A0FF
  $A0FB  A9 FF     LDA #$FF
  $A0FD  85 B1     STA $B1

L_A0FF:
  $A0FF  60        RTS
  $A100  22        .db $22
  $A101  69 22     ADC #$22
  $A103  69 7B     ADC #$7B
  $A105  0F        .db $0F
  $A106  91 93     STA ($93),Y
  $A108  91 93     STA ($93),Y
  $A10A  99 9D 8D  STA $8D9D,Y
  $A10D  01 04     ORA ($04,X)
  $A10F  A9 00     LDA #$00
  $A111  8D 81 06  STA $0681
  $A114  8D A1 06  STA $06A1
  $A117  60        RTS

L_A118:
  $A118  A5 1C     LDA $1C
  $A11A  29 03     AND #$03
  $A11C  D0 0F     BNE $A12D
  $A11E  AD C1 06  LDA $06C1
  $A121  C9 1C     CMP #$1C
  $A123  F0 08     BEQ $A12D
  $A125  EE C1 06  INC $06C1
  $A128  A9 28     LDA #$28
  $A12A  20 51 C0  JSR $C051

L_A12D:
  $A12D  60        RTS

L_A12E:
  $A12E  AD 21 04  LDA $0421
  $A131  49 40     EOR #$40
  $A133  8D 21 04  STA $0421
  $A136  20 D4 A2  JSR $A2D4
  $A139  AD 21 04  LDA $0421
  $A13C  85 03     STA $03
  $A13E  49 40     EOR #$40
  $A140  8D 21 04  STA $0421
  $A143  4C 54 A1  JMP $A154

L_A146:
  $A146  20 9D A5  JSR $A59D
  $A149  90 04     BCC $A14F
  $A14B  EE AA 05  INC $05AA
  $A14E  60        RTS

L_A14F:
  $A14F  AD 21 04  LDA $0421
  $A152  85 03     STA $03

L_A154:
  $A154  20 2D A5  JSR $A52D

L_A157:
  $A157  38        SEC
  $A158  AD C1 04  LDA $04C1
  $A15B  ED 61 06  SBC $0661
  $A15E  8D C1 04  STA $04C1
  $A161  AD A1 04  LDA $04A1
  $A164  ED 41 06  SBC $0641
  $A167  8D A1 04  STA $04A1
  $A16A  C9 F0     CMP #$F0
  $A16C  90 05     BCC $A173
  $A16E  A9 F0     LDA #$F0
  $A170  8D A1 04  STA $04A1

L_A173:
  $A173  AD 21 04  LDA $0421
  $A176  29 04     AND #$04
  $A178  F0 11     BEQ $A18B
  $A17A  18        CLC
  $A17B  AD 61 06  LDA $0661
  $A17E  E5 30     SBC $30
  $A180  8D 61 06  STA $0661
  $A183  AD 41 06  LDA $0641
  $A186  E5 31     SBC $31
  $A188  8D 41 06  STA $0641

L_A18B:
  $A18B  A5 03     LDA $03
  $A18D  29 40     AND #$40
  $A18F  D0 3C     BNE $A1CD
  $A191  38        SEC
  $A192  AD 81 04  LDA $0481
  $A195  ED 21 06  SBC $0621
  $A198  8D 81 04  STA $0481
  $A19B  AD 61 04  LDA $0461
  $A19E  ED 01 06  SBC $0601
  $A1A1  8D 61 04  STA $0461
  $A1A4  AD 41 04  LDA $0441
  $A1A7  E9 00     SBC #$00
  $A1A9  8D 41 04  STA $0441
  $A1AC  38        SEC
  $A1AD  AD 61 04  LDA $0461
  $A1B0  E5 1F     SBC $1F
  $A1B2  85 08     STA $08
  $A1B4  AD 41 04  LDA $0441
  $A1B7  E5 20     SBC $20
  $A1B9  D0 06     BNE $A1C1
  $A1BB  A5 08     LDA $08
  $A1BD  C9 08     CMP #$08
  $A1BF  B0 46     BCS $A207

L_A1C1:
  $A1C1  A5 20     LDA $20
  $A1C3  8D 40 04  STA $0440
  $A1C6  A9 08     LDA #$08
  $A1C8  8D 61 04  STA $0461
  $A1CB  D0 3A     BNE $A207

L_A1CD:
  $A1CD  18        CLC
  $A1CE  AD 81 04  LDA $0481
  $A1D1  6D 21 06  ADC $0621
  $A1D4  8D 81 04  STA $0481
  $A1D7  AD 61 04  LDA $0461
  $A1DA  6D 01 06  ADC $0601
  $A1DD  8D 61 04  STA $0461
  $A1E0  AD 41 04  LDA $0441
  $A1E3  69 00     ADC #$00
  $A1E5  8D 41 04  STA $0441
  $A1E8  38        SEC
  $A1E9  AD 61 04  LDA $0461
  $A1EC  E5 1F     SBC $1F
  $A1EE  85 08     STA $08
  $A1F0  AD 41 04  LDA $0441
  $A1F3  E5 20     SBC $20
  $A1F5  D0 06     BNE $A1FD
  $A1F7  A5 08     LDA $08
  $A1F9  C9 F8     CMP #$F8
  $A1FB  90 0A     BCC $A207

L_A1FD:
  $A1FD  A5 20     LDA $20
  $A1FF  8D 41 04  STA $0441
  $A202  A9 F8     LDA #$F8
  $A204  8D 61 04  STA $0461

L_A207:
  $A207  18        CLC
  $A208  60        RTS

L_A209:
  $A209  AD 21 04  LDA $0421
  $A20C  29 BF     AND #$BF
  $A20E  8D 21 04  STA $0421
  $A211  38        SEC
  $A212  AD 61 04  LDA $0461
  $A215  ED 60 04  SBC $0460
  $A218  85 00     STA $00
  $A21A  B0 10     BCS $A22C
  $A21C  A5 00     LDA $00
  $A21E  49 FF     EOR #$FF
  $A220  69 01     ADC #$01
  $A222  85 00     STA $00
  $A224  A9 40     LDA #$40
  $A226  0D 21 04  ORA $0421
  $A229  8D 21 04  STA $0421

L_A22C:
  $A22C  60        RTS

L_A22D:
  $A22D  85 00     STA $00
  $A22F  A0 0F     LDY #$0F

L_A231:
  $A231  A5 00     LDA $00

L_A233:
  $A233  D9 10 04  CMP $0410,Y
  $A236  F0 05     BEQ $A23D
  $A238  88        DEY
  $A239  10 F8     BPL $A233
  $A23B  38        SEC
  $A23C  60        RTS

L_A23D:
  $A23D  B9 30 04  LDA $0430,Y
  $A240  30 05     BMI $A247
  $A242  88        DEY
  $A243  10 EC     BPL $A231
  $A245  38        SEC
  $A246  60        RTS

L_A247:
  $A247  18        CLC
  $A248  60        RTS

L_A249:
  $A249  A9 00     LDA #$00
  $A24B  85 0B     STA $0B
  $A24D  AD 41 06  LDA $0641
  $A250  08        PHP
  $A251  10 09     BPL $A25C
  $A253  18        CLC
  $A254  AD A1 04  LDA $04A1
  $A257  65 02     ADC $02
  $A259  4C 62 A2  JMP $A262

L_A25C:
  $A25C  38        SEC
  $A25D  AD A1 04  LDA $04A1
  $A260  E5 02     SBC $02

L_A262:
  $A262  85 0A     STA $0A
  $A264  18        CLC
  $A265  AD 61 04  LDA $0461
  $A268  65 01     ADC $01
  $A26A  85 08     STA $08
  $A26C  AD 41 04  LDA $0441
  $A26F  69 00     ADC #$00
  $A271  85 09     STA $09
  $A273  20 63 CC  JSR $CC63
  $A276  A4 00     LDY $00
  $A278  B9 49 A3  LDA $A349,Y
  $A27B  85 02     STA $02
  $A27D  38        SEC
  $A27E  AD 61 04  LDA $0461
  $A281  E5 01     SBC $01
  $A283  85 08     STA $08
  $A285  AD 41 04  LDA $0441
  $A288  E9 00     SBC #$00
  $A28A  85 09     STA $09
  $A28C  20 63 CC  JSR $CC63
  $A28F  A4 00     LDY $00
  $A291  B9 49 A3  LDA $A349,Y
  $A294  05 02     ORA $02
  $A296  85 00     STA $00
  $A298  F0 38     BEQ $A2D2
  $A29A  28        PLP
  $A29B  30 0D     BMI $A2AA
  $A29D  A5 0A     LDA $0A
  $A29F  29 0F     AND #$0F
  $A2A1  49 0F     EOR #$0F
  $A2A3  38        SEC
  $A2A4  6D A1 04  ADC $04A1
  $A2A7  4C B8 A2  JMP $A2B8

L_A2AA:
  $A2AA  AD A1 04  LDA $04A1
  $A2AD  48        PHA
  $A2AE  A5 0A     LDA $0A
  $A2B0  29 0F     AND #$0F
  $A2B2  85 02     STA $02
  $A2B4  68        PLA
  $A2B5  38        SEC
  $A2B6  E5 02     SBC $02

L_A2B8:
  $A2B8  8D A1 04  STA $04A1
  $A2BB  A9 00     LDA #$00
  $A2BD  8D C1 04  STA $04C1
  $A2C0  AD 21 04  LDA $0421
  $A2C3  29 04     AND #$04
  $A2C5  F0 0A     BEQ $A2D1
  $A2C7  A9 C0     LDA #$C0
  $A2C9  8D 61 06  STA $0661
  $A2CC  A9 FF     LDA #$FF
  $A2CE  8D 41 06  STA $0641

L_A2D1:
  $A2D1  60        RTS

L_A2D2:
  $A2D2  28        PLP
  $A2D3  60        RTS

L_A2D4:
  $A2D4  AD A1 04  LDA $04A1
  $A2D7  85 0A     STA $0A
  $A2D9  A9 00     LDA #$00
  $A2DB  85 0B     STA $0B
  $A2DD  AD 21 04  LDA $0421
  $A2E0  29 40     AND #$40
  $A2E2  08        PHP
  $A2E3  F0 10     BEQ $A2F5
  $A2E5  38        SEC
  $A2E6  AD 61 04  LDA $0461
  $A2E9  65 01     ADC $01
  $A2EB  85 08     STA $08
  $A2ED  AD 41 04  LDA $0441
  $A2F0  69 00     ADC #$00
  $A2F2  4C 02 A3  JMP $A302

L_A2F5:
  $A2F5  18        CLC
  $A2F6  AD 61 04  LDA $0461
  $A2F9  E5 01     SBC $01
  $A2FB  85 08     STA $08
  $A2FD  AD 41 04  LDA $0441
  $A300  E9 00     SBC #$00

L_A302:
  $A302  85 09     STA $09
  $A304  20 63 CC  JSR $CC63
  $A307  A4 00     LDY $00
  $A309  B9 49 A3  LDA $A349,Y
  $A30C  85 03     STA $03
  $A30E  F0 35     BEQ $A345
  $A310  28        PLP
  $A311  F0 1A     BEQ $A32D
  $A313  A5 08     LDA $08
  $A315  29 0F     AND #$0F
  $A317  85 00     STA $00
  $A319  38        SEC
  $A31A  AD 61 04  LDA $0461
  $A31D  E5 00     SBC $00
  $A31F  8D 61 04  STA $0461
  $A322  AD 41 04  LDA $0441
  $A325  E9 00     SBC #$00
  $A327  8D 41 04  STA $0441
  $A32A  4C 49 A2  JMP $A249

L_A32D:
  $A32D  A5 08     LDA $08
  $A32F  29 0F     AND #$0F
  $A331  49 0F     EOR #$0F
  $A333  38        SEC
  $A334  6D 61 04  ADC $0461
  $A337  8D 61 04  STA $0461
  $A33A  AD 41 04  LDA $0441
  $A33D  69 00     ADC #$00
  $A33F  8D 41 04  STA $0441
  $A342  4C 49 A2  JMP $A249

L_A345:
  $A345  28        PLP
  $A346  4C 49 A2  JMP $A249
  $A349  00        BRK
  $A34A  01 00     ORA ($00,X)
  $A34C  01 00     ORA ($00,X)
  $A34E  01 01     ORA ($01,X)
  $A350  01 01     ORA ($01,X)

L_A352:
  $A352  48        PHA
  $A353  20 43 DA  JSR $DA43
  $A356  B0 31     BCS $A389
  $A358  68        PLA

L_A359:
  $A359  20 7C D7  JSR $D77C
  $A35C  8A        TXA
  $A35D  A8        TAY
  $A35E  AD 21 04  LDA $0421
  $A361  29 40     AND #$40
  $A363  19 30 04  ORA $0430,Y
  $A366  99 30 04  STA $0430,Y
  $A369  AD 81 04  LDA $0481
  $A36C  99 90 04  STA $0490,Y
  $A36F  AD 61 04  LDA $0461
  $A372  99 70 04  STA $0470,Y
  $A375  AD 41 04  LDA $0441
  $A378  99 50 04  STA $0450,Y
  $A37B  AD C1 04  LDA $04C1
  $A37E  99 D0 04  STA $04D0,Y
  $A381  AD A1 04  LDA $04A1
  $A384  99 B0 04  STA $04B0,Y
  $A387  18        CLC
  $A388  60        RTS

L_A389:
  $A389  68        PLA
  $A38A  38        SEC
  $A38B  60        RTS

L_A38C:
  $A38C  A0 40     LDY #$40
  $A38E  38        SEC
  $A38F  AD 60 04  LDA $0460
  $A392  FD 60 04  SBC $0460,X
  $A395  85 00     STA $00
  $A397  B0 0A     BCS $A3A3
  $A399  A5 00     LDA $00
  $A39B  49 FF     EOR #$FF
  $A39D  69 01     ADC #$01
  $A39F  A0 00     LDY #$00
  $A3A1  85 00     STA $00

L_A3A3:
  $A3A3  BD 20 04  LDA $0420,X
  $A3A6  29 BF     AND #$BF
  $A3A8  9D 20 04  STA $0420,X
  $A3AB  98        TYA
  $A3AC  1D 20 04  ORA $0420,X
  $A3AF  9D 20 04  STA $0420,X
  $A3B2  38        SEC
  $A3B3  AD A0 04  LDA $04A0
  $A3B6  FD A0 04  SBC $04A0,X
  $A3B9  08        PHP
  $A3BA  B0 04     BCS $A3C0
  $A3BC  49 FF     EOR #$FF
  $A3BE  69 01     ADC #$01

L_A3C0:
  $A3C0  85 01     STA $01
  $A3C2  C5 00     CMP $00
  $A3C4  B0 3B     BCS $A401
  $A3C6  A5 09     LDA $09
  $A3C8  85 0D     STA $0D
  $A3CA  9D 00 06  STA $0600,X
  $A3CD  A5 08     LDA $08
  $A3CF  85 0C     STA $0C
  $A3D1  9D 20 06  STA $0620,X
  $A3D4  A5 00     LDA $00
  $A3D6  85 0B     STA $0B
  $A3D8  A9 00     LDA #$00
  $A3DA  85 0A     STA $0A
  $A3DC  20 74 C8  JSR $C874
  $A3DF  A5 0F     LDA $0F
  $A3E1  85 0D     STA $0D
  $A3E3  A5 0E     LDA $0E
  $A3E5  85 0C     STA $0C
  $A3E7  A5 01     LDA $01
  $A3E9  85 0B     STA $0B
  $A3EB  A9 00     LDA #$00
  $A3ED  85 0A     STA $0A
  $A3EF  20 74 C8  JSR $C874
  $A3F2  A6 2B     LDX $2B
  $A3F4  A5 0F     LDA $0F
  $A3F6  9D 40 06  STA $0640,X
  $A3F9  A5 0E     LDA $0E
  $A3FB  9D 60 06  STA $0660,X
  $A3FE  4C 39 A4  JMP $A439

L_A401:
  $A401  A5 09     LDA $09
  $A403  85 0D     STA $0D
  $A405  9D 40 06  STA $0640,X
  $A408  A5 08     LDA $08
  $A40A  85 0C     STA $0C
  $A40C  9D 60 06  STA $0660,X
  $A40F  A5 01     LDA $01
  $A411  85 0B     STA $0B
  $A413  A9 00     LDA #$00
  $A415  85 0A     STA $0A
  $A417  20 74 C8  JSR $C874
  $A41A  A5 0F     LDA $0F
  $A41C  85 0D     STA $0D
  $A41E  A5 0E     LDA $0E
  $A420  85 0C     STA $0C
  $A422  A5 00     LDA $00
  $A424  85 0B     STA $0B
  $A426  A9 00     LDA #$00
  $A428  85 0A     STA $0A
  $A42A  20 74 C8  JSR $C874
  $A42D  A6 2B     LDX $2B
  $A42F  A5 0F     LDA $0F
  $A431  9D 00 06  STA $0600,X
  $A434  A5 0E     LDA $0E
  $A436  9D 20 06  STA $0620,X

L_A439:
  $A439  28        PLP
  $A43A  90 14     BCC $A450
  $A43C  BD 60 06  LDA $0660,X
  $A43F  49 FF     EOR #$FF
  $A441  69 01     ADC #$01
  $A443  9D 60 06  STA $0660,X
  $A446  BD 40 06  LDA $0640,X
  $A449  49 FF     EOR #$FF
  $A44B  69 00     ADC #$00
  $A44D  9D 40 06  STA $0640,X

L_A450:
  $A450  60        RTS

L_A451:
  $A451  A6 B3     LDX $B3
  $A453  A5 20     LDA $20
  $A455  8D 41 04  STA $0441
  $A458  BD AF A4  LDA $A4AF,X
  $A45B  8D 21 04  STA $0421
  $A45E  BD BD A4  LDA $A4BD,X
  $A461  8D 61 04  STA $0461
  $A464  BD CB A4  LDA $A4CB,X
  $A467  8D A1 04  STA $04A1
  $A46A  BD D9 A4  LDA $A4D9,X
  $A46D  8D 01 04  STA $0401
  $A470  BD E7 A4  LDA $A4E7,X
  $A473  8D E1 06  STA $06E1
  $A476  BD F5 A4  LDA $A4F5,X
  $A479  8D 21 06  STA $0621
  $A47C  BD 03 A5  LDA $A503,X
  $A47F  8D 01 06  STA $0601
  $A482  BD 11 A5  LDA $A511,X
  $A485  8D 61 06  STA $0661
  $A488  BD 1F A5  LDA $A51F,X
  $A48B  8D 41 06  STA $0641
  $A48E  A9 00     LDA #$00
  $A490  8D C1 04  STA $04C1
  $A493  8D 81 04  STA $0481
  $A496  8D 81 06  STA $0681
  $A499  8D A1 06  STA $06A1
  $A49C  8D E1 04  STA $04E1
  $A49F  8D C1 06  STA $06C1
  $A4A2  8D A8 05  STA $05A8
  $A4A5  8D AA 05  STA $05AA
  $A4A8  85 B2     STA $B2
  $A4AA  A9 01     LDA #$01
  $A4AC  85 B1     STA $B1
  $A4AE  60        RTS
  $A4AF  83        .db $83
  $A4B0  83        .db $83
  $A4B1  83        .db $83
  $A4B2  83        .db $83
  $A4B3  83        .db $83
  $A4B4  83        .db $83
  $A4B5  83        .db $83
  $A4B6  83        .db $83
  $A4B7  8B        .db $8B
  $A4B8  00        BRK
  $A4B9  00        BRK
  $A4BA  00        BRK
  $A4BB  83        .db $83
  $A4BC  00        BRK
  $A4BD  C8        INY
  $A4BE  C8        INY
  $A4BF  C8        INY
  $A4C0  C8        INY
  $A4C1  C8        INY
  $A4C2  C8        INY
  $A4C3  C8        INY
  $A4C4  C8        INY
  $A4C5  70 C8     BVS $A48F
  $A4C7  FF        .db $FF
  $A4C8  C8        INY
  $A4C9  78        SEI
  $A4CA  B4 28     LDY $28,X
  $A4CC  28        PLP
  $A4CD  30 28     BMI $A4F7
  $A4CF  28        PLP
  $A4D0  28        PLP
  $A4D1  28        PLP
  $A4D2  28        PLP
  $A4D3  6B        .db $6B
  $A4D4  10 4B     BPL $A521
  $A4D6  10 77     BPL $A54F
  $A4D8  7C        .db $7C
  $A4D9  50 66     BVC $A541
  $A4DB  6C 60 54  JMP ($5460)
  $A4DE  5A        .db $5A
  $A4DF  63        .db $63
  $A4E0  69 70     ADC #$70
  $A4E2  50 71     BVC $A555
  $A4E4  50 72     BVC $A558
  $A4E6  75 01     ADC $01,X
  $A4E8  09 09     ORA #$09
  $A4EA  01 01     ORA ($01,X)
  $A4EC  01 01     ORA ($01,X)
  $A4EE  01 0D     ORA ($0D,X)
  $A4F0  01 01     ORA ($01,X)
  $A4F2  01 00     ORA ($00,X)
  $A4F4  01 00     ORA ($00,X)
  $A4F6  00        BRK

L_A4F7:
  $A4F7  00        BRK
  $A4F8  00        BRK
  $A4F9  00        BRK
  $A4FA  00        BRK
  $A4FB  00        BRK
  $A4FC  00        BRK
  $A4FD  00        BRK
  $A4FE  00        BRK
  $A4FF  60        RTS
  $A500  00        BRK
  $A501  C4 00     CPY $00
  $A503  00        BRK
  $A504  00        BRK
  $A505  00        BRK
  $A506  00        BRK
  $A507  00        BRK
  $A508  00        BRK
  $A509  00        BRK
  $A50A  00        BRK
  $A50B  00        BRK
  $A50C  00        BRK
  $A50D  00        BRK
  $A50E  00        BRK
  $A50F  00        BRK
  $A510  00        BRK
  $A511  00        BRK
  $A512  00        BRK
  $A513  00        BRK
  $A514  00        BRK
  $A515  00        BRK
  $A516  00        BRK
  $A517  00        BRK
  $A518  00        BRK
  $A519  00        BRK
  $A51A  00        BRK
  $A51B  00        BRK
  $A51C  00        BRK
  $A51D  00        BRK
  $A51E  00        BRK
  $A51F  F8        SED
  $A520  F8        SED

L_A521:
  $A521  F8        SED
  $A522  F8        SED
  $A523  F8        SED
  $A524  F8        SED
  $A525  F8        SED
  $A526  F8        SED
  $A527  00        BRK
  $A528  00        BRK
  $A529  00        BRK
  $A52A  00        BRK
  $A52B  00        BRK
  $A52C  00        BRK

L_A52D:
  $A52D  A9 00     LDA #$00
  $A52F  85 01     STA $01
  $A531  A5 2C     LDA $2C
  $A533  F0 67     BEQ $A59C
  $A535  A5 BD     LDA $BD
  $A537  D0 63     BNE $A59C
  $A539  A5 F9     LDA $F9
  $A53B  D0 5F     BNE $A59C
  $A53D  38        SEC
  $A53E  AD 60 04  LDA $0460

L_A541:
  $A541  ED 61 04  SBC $0461
  $A544  B0 04     BCS $A54A
  $A546  49 FF     EOR #$FF
  $A548  69 01     ADC #$01

L_A54A:
  $A54A  AC E1 06  LDY $06E1
  $A54D  D9 E4 D4  CMP $D4E4,Y
  $A550  B0 4A     BCS $A59C
  $A552  38        SEC
  $A553  AD A0 04  LDA $04A0
  $A556  ED A1 04  SBC $04A1
  $A559  B0 04     BCS $A55F
  $A55B  49 FF     EOR #$FF
  $A55D  69 01     ADC #$01

L_A55F:
  $A55F  D9 84 D5  CMP $D584,Y
  $A562  B0 38     BCS $A59C
  $A564  A5 4B     LDA $4B
  $A566  D0 34     BNE $A59C
  $A568  A4 B3     LDY $B3
  $A56A  38        SEC
  $A56B  AD C0 06  LDA $06C0
  $A56E  F9 B2 A9  SBC $A9B2,Y
  $A571  8D C0 06  STA $06C0
  $A574  F0 02     BEQ $A578
  $A576  B0 0A     BCS $A582

L_A578:
  $A578  A9 00     LDA #$00
  $A57A  85 2C     STA $2C
  $A57C  8D C0 06  STA $06C0
  $A57F  4C 0B C1  JMP $C10B

L_A582:
  $A582  AD 20 04  LDA $0420
  $A585  29 BF     AND #$BF
  $A587  8D 20 04  STA $0420
  $A58A  AD 21 04  LDA $0421
  $A58D  29 40     AND #$40
  $A58F  49 40     EOR #$40
  $A591  0D 20 04  ORA $0420
  $A594  8D 20 04  STA $0420
  $A597  20 32 D3  JSR $D332
  $A59A  E6 01     INC $01

L_A59C:
  $A59C  60        RTS

L_A59D:
  $A59D  A2 09     LDX #$09
  $A59F  A5 1C     LDA $1C
  $A5A1  29 01     AND #$01
  $A5A3  D0 01     BNE $A5A6
  $A5A5  CA        DEX

L_A5A6:
  $A5A6  BD 20 04  LDA $0420,X
  $A5A9  10 33     BPL $A5DE
  $A5AB  29 01     AND #$01
  $A5AD  F0 2F     BEQ $A5DE
  $A5AF  18        CLC
  $A5B0  BC 90 05  LDY $0590,X
  $A5B3  B9 DF D4  LDA $D4DF,Y
  $A5B6  6D E1 06  ADC $06E1
  $A5B9  A8        TAY
  $A5BA  38        SEC
  $A5BB  AD 61 04  LDA $0461
  $A5BE  FD E0 06  SBC $06E0,X
  $A5C1  B0 04     BCS $A5C7
  $A5C3  49 FF     EOR #$FF
  $A5C5  69 01     ADC #$01

L_A5C7:
  $A5C7  D9 E4 D4  CMP $D4E4,Y
  $A5CA  B0 12     BCS $A5DE
  $A5CC  38        SEC
  $A5CD  AD A1 04  LDA $04A1
  $A5D0  FD A0 04  SBC $04A0,X
  $A5D3  B0 04     BCS $A5D9
  $A5D5  49 FF     EOR #$FF
  $A5D7  69 01     ADC #$01

L_A5D9:
  $A5D9  D9 84 D5  CMP $D584,Y
  $A5DC  90 10     BCC $A5EE

L_A5DE:
  $A5DE  CA        DEX
  $A5DF  CA        DEX
  $A5E0  E0 02     CPX #$02
  $A5E2  B0 C2     BCS $A5A6
  $A5E4  A6 2B     LDX $2B
  $A5E6  A9 00     LDA #$00
  $A5E8  85 B4     STA $B4
  $A5EA  85 02     STA $02

L_A5EC:
  $A5EC  18        CLC
  $A5ED  60        RTS

L_A5EE:
  $A5EE  A5 B4     LDA $B4
  $A5F0  D0 FA     BNE $A5EC
  $A5F2  A4 A9     LDY $A9
  $A5F4  B9 30 A9  LDA $A930,Y
  $A5F7  85 08     STA $08
  $A5F9  B9 39 A9  LDA $A939,Y
  $A5FC  85 09     STA $09
  $A5FE  6C 08 00  JMP ($0008)
  $A601  AD 21 04  LDA $0421
  $A604  29 08     AND #$08
  $A606  D0 35     BNE $A63D
  $A608  A4 B3     LDY $B3
  $A60A  B9 42 A9  LDA $A942,Y
  $A60D  85 00     STA $00
  $A60F  F0 2C     BEQ $A63D
  $A611  08        PHP
  $A612  5E 20 04  LSR $0420,X
  $A615  28        PLP
  $A616  10 03     BPL $A61B
  $A618  4C 1B A9  JMP $A91B

L_A61B:
  $A61B  20 29 A9  JSR $A929
  $A61E  A9 2B     LDA #$2B
  $A620  20 51 C0  JSR $C051
  $A623  A9 01     LDA #$01
  $A625  85 02     STA $02
  $A627  E6 B4     INC $B4
  $A629  38        SEC
  $A62A  AD C1 06  LDA $06C1
  $A62D  E5 00     SBC $00
  $A62F  8D C1 06  STA $06C1
  $A632  F0 02     BEQ $A636
  $A634  B0 22     BCS $A658

L_A636:
  $A636  A9 00     LDA #$00
  $A638  8D C1 06  STA $06C1
  $A63B  38        SEC
  $A63C  60        RTS

L_A63D:
  $A63D  BD 20 04  LDA $0420,X
  $A640  49 40     EOR #$40
  $A642  29 FE     AND #$FE
  $A644  9D 20 04  STA $0420,X
  $A647  A9 05     LDA #$05
  $A649  9D 40 06  STA $0640,X
  $A64C  9D 00 06  STA $0600,X
  $A64F  A9 2D     LDA #$2D
  $A651  20 51 C0  JSR $C051
  $A654  A9 02     LDA #$02
  $A656  85 02     STA $02

L_A658:
  $A658  18        CLC
  $A659  60        RTS
  $A65A  A5 B3     LDA $B3
  $A65C  C9 00     CMP #$00
  $A65E  D0 03     BNE $A663
  $A660  4C 1B A9  JMP $A91B

L_A663:
  $A663  AD 21 04  LDA $0421
  $A666  29 08     AND #$08
  $A668  D0 4E     BNE $A6B8
  $A66A  A4 B3     LDY $B3
  $A66C  B9 50 A9  LDA $A950,Y
  $A66F  F0 47     BEQ $A6B8
  $A671  BD E0 04  LDA $04E0,X
  $A674  C9 02     CMP #$02
  $A676  90 12     BCC $A68A
  $A678  F0 05     BEQ $A67F
  $A67A  B9 50 A9  LDA $A950,Y
  $A67D  D0 0E     BNE $A68D

L_A67F:
  $A67F  18        CLC
  $A680  B9 42 A9  LDA $A942,Y
  $A683  0A        ASL
  $A684  79 42 A9  ADC $A942,Y
  $A687  4C 8D A6  JMP $A68D

L_A68A:
  $A68A  B9 42 A9  LDA $A942,Y

L_A68D:
  $A68D  85 00     STA $00
  $A68F  F0 27     BEQ $A6B8
  $A691  10 03     BPL $A696
  $A693  4C 1B A9  JMP $A91B

L_A696:
  $A696  20 29 A9  JSR $A929
  $A699  A9 2B     LDA #$2B
  $A69B  20 51 C0  JSR $C051
  $A69E  A9 01     LDA #$01
  $A6A0  85 02     STA $02
  $A6A2  E6 B4     INC $B4
  $A6A4  38        SEC
  $A6A5  AD C1 06  LDA $06C1
  $A6A8  E5 00     SBC $00
  $A6AA  8D C1 06  STA $06C1
  $A6AD  F0 02     BEQ $A6B1
  $A6AF  B0 16     BCS $A6C7

L_A6B1:
  $A6B1  A9 00     LDA #$00
  $A6B3  8D C1 06  STA $06C1
  $A6B6  38        SEC
  $A6B7  60        RTS

L_A6B8:
  $A6B8  A9 2D     LDA #$2D
  $A6BA  20 51 C0  JSR $C051
  $A6BD  A9 02     LDA #$02
  $A6BF  85 02     STA $02
  $A6C1  5E 20 04  LSR $0420,X
  $A6C4  4C CC A6  JMP $A6CC

L_A6C7:
  $A6C7  A9 00     LDA #$00
  $A6C9  9D 20 04  STA $0420,X

L_A6CC:
  $A6CC  18        CLC
  $A6CD  60        RTS
  $A6CE  AD 21 04  LDA $0421
  $A6D1  29 08     AND #$08
  $A6D3  D0 30     BNE $A705
  $A6D5  A4 B3     LDY $B3
  $A6D7  B9 5E A9  LDA $A95E,Y
  $A6DA  85 00     STA $00
  $A6DC  F0 27     BEQ $A705
  $A6DE  10 03     BPL $A6E3
  $A6E0  4C 1B A9  JMP $A91B

L_A6E3:
  $A6E3  20 29 A9  JSR $A929
  $A6E6  A9 2B     LDA #$2B
  $A6E8  20 51 C0  JSR $C051
  $A6EB  A9 01     LDA #$01
  $A6ED  85 02     STA $02
  $A6EF  E6 B4     INC $B4
  $A6F1  38        SEC
  $A6F2  AD C1 06  LDA $06C1
  $A6F5  E5 00     SBC $00
  $A6F7  8D C1 06  STA $06C1
  $A6FA  F0 02     BEQ $A6FE
  $A6FC  B0 C9     BCS $A6C7

L_A6FE:
  $A6FE  A9 00     LDA #$00
  $A700  8D C1 06  STA $06C1
  $A703  38        SEC
  $A704  60        RTS

L_A705:
  $A705  A9 2D     LDA #$2D
  $A707  20 51 C0  JSR $C051
  $A70A  A9 02     LDA #$02
  $A70C  85 02     STA $02
  $A70E  BD 20 04  LDA $0420,X
  $A711  29 FE     AND #$FE
  $A713  9D 20 04  STA $0420,X
  $A716  A9 3D     LDA #$3D
  $A718  9D 00 04  STA $0400,X
  $A71B  A9 00     LDA #$00
  $A71D  9D A0 06  STA $06A0,X
  $A720  9D 80 06  STA $0680,X
  $A723  18        CLC
  $A724  60        RTS
  $A725  AD 21 04  LDA $0421
  $A728  29 08     AND #$08
  $A72A  D0 30     BNE $A75C
  $A72C  A4 B3     LDY $B3
  $A72E  B9 6C A9  LDA $A96C,Y
  $A731  85 00     STA $00
  $A733  F0 27     BEQ $A75C
  $A735  10 03     BPL $A73A
  $A737  4C 1B A9  JMP $A91B

L_A73A:
  $A73A  20 29 A9  JSR $A929
  $A73D  A9 2B     LDA #$2B
  $A73F  20 51 C0  JSR $C051
  $A742  A9 01     LDA #$01
  $A744  85 02     STA $02
  $A746  E6 B4     INC $B4
  $A748  38        SEC
  $A749  AD C1 06  LDA $06C1
  $A74C  E5 00     SBC $00
  $A74E  8D C1 06  STA $06C1
  $A751  F0 02     BEQ $A755
  $A753  B0 2D     BCS $A782

L_A755:
  $A755  A9 00     LDA #$00
  $A757  8D C1 06  STA $06C1
  $A75A  38        SEC
  $A75B  60        RTS

L_A75C:
  $A75C  A9 2D     LDA #$2D
  $A75E  20 51 C0  JSR $C051
  $A761  A9 02     LDA #$02
  $A763  85 02     STA $02
  $A765  BD 20 04  LDA $0420,X
  $A768  29 F2     AND #$F2
  $A76A  9D 20 04  STA $0420,X
  $A76D  A9 3B     LDA #$3B
  $A76F  9D 00 04  STA $0400,X
  $A772  A9 00     LDA #$00
  $A774  9D A0 06  STA $06A0,X
  $A777  9D 80 06  STA $0680,X
  $A77A  9D E0 04  STA $04E0,X
  $A77D  9D C0 06  STA $06C0,X

L_A780:
  $A780  18        CLC
  $A781  60        RTS

L_A782:
  $A782  A9 00     LDA #$00
  $A784  9D 20 04  STA $0420,X
  $A787  F0 F7     BEQ $A780
  $A789  AD 21 04  LDA $0421
  $A78C  29 08     AND #$08
  $A78E  D0 30     BNE $A7C0
  $A790  A4 B3     LDY $B3
  $A792  B9 7A A9  LDA $A97A,Y
  $A795  85 00     STA $00
  $A797  F0 27     BEQ $A7C0
  $A799  10 03     BPL $A79E
  $A79B  4C 1B A9  JMP $A91B

L_A79E:
  $A79E  20 29 A9  JSR $A929
  $A7A1  A9 2B     LDA #$2B
  $A7A3  20 51 C0  JSR $C051
  $A7A6  A9 01     LDA #$01
  $A7A8  85 02     STA $02
  $A7AA  E6 B4     INC $B4
  $A7AC  38        SEC
  $A7AD  AD C1 06  LDA $06C1
  $A7B0  E5 00     SBC $00
  $A7B2  8D C1 06  STA $06C1
  $A7B5  F0 02     BEQ $A7B9
  $A7B7  B0 C9     BCS $A782

L_A7B9:
  $A7B9  A9 00     LDA #$00
  $A7BB  8D C1 06  STA $06C1
  $A7BE  38        SEC
  $A7BF  60        RTS

L_A7C0:
  $A7C0  A9 00     LDA #$00
  $A7C2  9D 00 06  STA $0600,X
  $A7C5  9D 20 06  STA $0620,X
  $A7C8  9D 60 06  STA $0660,X
  $A7CB  A9 04     LDA #$04
  $A7CD  9D 40 06  STA $0640,X
  $A7D0  A9 80     LDA #$80
  $A7D2  9D 20 04  STA $0420,X
  $A7D5  A9 2D     LDA #$2D
  $A7D7  20 51 C0  JSR $C051
  $A7DA  A9 02     LDA #$02
  $A7DC  85 02     STA $02
  $A7DE  18        CLC
  $A7DF  60        RTS
  $A7E0  AD 21 04  LDA $0421
  $A7E3  29 08     AND #$08
  $A7E5  D0 30     BNE $A817
  $A7E7  A4 B3     LDY $B3
  $A7E9  B9 88 A9  LDA $A988,Y
  $A7EC  85 00     STA $00
  $A7EE  F0 27     BEQ $A817
  $A7F0  10 03     BPL $A7F5
  $A7F2  4C 1B A9  JMP $A91B

L_A7F5:
  $A7F5  20 29 A9  JSR $A929
  $A7F8  A9 2B     LDA #$2B
  $A7FA  20 51 C0  JSR $C051
  $A7FD  A9 01     LDA #$01
  $A7FF  85 02     STA $02
  $A801  E6 B4     INC $B4
  $A803  38        SEC
  $A804  AD C1 06  LDA $06C1
  $A807  E5 00     SBC $00
  $A809  8D C1 06  STA $06C1
  $A80C  F0 02     BEQ $A810
  $A80E  B0 3D     BCS $A84D

L_A810:
  $A810  A9 00     LDA #$00
  $A812  8D C1 06  STA $06C1
  $A815  38        SEC
  $A816  60        RTS

L_A817:
  $A817  A9 3C     LDA #$3C
  $A819  9D 00 04  STA $0400,X
  $A81C  BD 20 04  LDA $0420,X
  $A81F  29 C0     AND #$C0
  $A821  49 40     EOR #$40
  $A823  09 04     ORA #$04
  $A825  9D 20 04  STA $0420,X
  $A828  A9 00     LDA #$00
  $A82A  9D A0 06  STA $06A0,X
  $A82D  9D 80 06  STA $0680,X
  $A830  9D 00 06  STA $0600,X
  $A833  9D 60 06  STA $0660,X
  $A836  A9 C0     LDA #$C0
  $A838  9D 20 06  STA $0620,X
  $A83B  A9 04     LDA #$04
  $A83D  9D 40 06  STA $0640,X
  $A840  A9 2D     LDA #$2D
  $A842  20 51 C0  JSR $C051
  $A845  A9 02     LDA #$02
  $A847  85 02     STA $02

L_A849:
  $A849  A6 2B     LDX $2B
  $A84B  18        CLC
  $A84C  60        RTS

L_A84D:
  $A84D  A9 00     LDA #$00
  $A84F  9D 20 04  STA $0420,X
  $A852  F0 F5     BEQ $A849
  $A854  AD 21 04  LDA $0421
  $A857  29 08     AND #$08
  $A859  D0 30     BNE $A88B
  $A85B  A4 B3     LDY $B3
  $A85D  B9 96 A9  LDA $A996,Y
  $A860  85 00     STA $00
  $A862  F0 27     BEQ $A88B
  $A864  10 03     BPL $A869
  $A866  4C 1B A9  JMP $A91B

L_A869:
  $A869  20 29 A9  JSR $A929
  $A86C  A9 2B     LDA #$2B
  $A86E  20 51 C0  JSR $C051
  $A871  A9 01     LDA #$01
  $A873  85 02     STA $02
  $A875  E6 B4     INC $B4
  $A877  38        SEC
  $A878  AD C1 06  LDA $06C1
  $A87B  E5 00     SBC $00
  $A87D  8D C1 06  STA $06C1
  $A880  F0 02     BEQ $A884
  $A882  B0 C9     BCS $A84D

L_A884:
  $A884  A9 00     LDA #$00
  $A886  8D C1 06  STA $06C1
  $A889  38        SEC
  $A88A  60        RTS

L_A88B:
  $A88B  BD 00 04  LDA $0400,X
  $A88E  C9 2F     CMP #$2F
  $A890  F0 22     BEQ $A8B4
  $A892  BD E0 04  LDA $04E0,X
  $A895  C9 02     CMP #$02
  $A897  F0 1B     BEQ $A8B4
  $A899  A9 05     LDA #$05
  $A89B  9D A0 06  STA $06A0,X
  $A89E  A9 00     LDA #$00
  $A8A0  9D 80 06  STA $0680,X
  $A8A3  A9 38     LDA #$38
  $A8A5  9D C0 06  STA $06C0,X
  $A8A8  FE E0 04  INC $04E0,X
  $A8AB  A9 2D     LDA #$2D
  $A8AD  20 51 C0  JSR $C051
  $A8B0  A9 01     LDA #$01
  $A8B2  85 02     STA $02

L_A8B4:
  $A8B4  18        CLC
  $A8B5  60        RTS
  $A8B6  AD 21 04  LDA $0421
  $A8B9  29 08     AND #$08
  $A8BB  D0 30     BNE $A8ED
  $A8BD  A4 B3     LDY $B3
  $A8BF  B9 A4 A9  LDA $A9A4,Y
  $A8C2  85 00     STA $00
  $A8C4  F0 27     BEQ $A8ED
  $A8C6  10 03     BPL $A8CB
  $A8C8  4C 1B A9  JMP $A91B

L_A8CB:
  $A8CB  20 29 A9  JSR $A929
  $A8CE  A9 2B     LDA #$2B
  $A8D0  20 51 C0  JSR $C051
  $A8D3  A9 01     LDA #$01
  $A8D5  85 02     STA $02
  $A8D7  E6 B4     INC $B4
  $A8D9  38        SEC
  $A8DA  AD C1 06  LDA $06C1
  $A8DD  E5 00     SBC $00
  $A8DF  8D C1 06  STA $06C1
  $A8E2  F0 02     BEQ $A8E6
  $A8E4  B0 2E     BCS $A914

L_A8E6:
  $A8E6  A9 00     LDA #$00
  $A8E8  8D C1 06  STA $06C1
  $A8EB  38        SEC
  $A8EC  60        RTS

L_A8ED:
  $A8ED  A9 03     LDA #$03
  $A8EF  9D 40 06  STA $0640,X
  $A8F2  A9 B2     LDA #$B2
  $A8F4  9D 60 06  STA $0660,X
  $A8F7  A9 01     LDA #$01
  $A8F9  9D 00 06  STA $0600,X
  $A8FC  A9 87     LDA #$87
  $A8FE  9D 20 06  STA $0620,X
  $A901  BD 20 04  LDA $0420,X
  $A904  29 F0     AND #$F0
  $A906  9D 20 04  STA $0420,X
  $A909  A9 2D     LDA #$2D
  $A90B  20 51 C0  JSR $C051
  $A90E  A9 02     LDA #$02
  $A910  85 02     STA $02

L_A912:
  $A912  18        CLC
  $A913  60        RTS

L_A914:
  $A914  A9 00     LDA #$00
  $A916  9D 20 04  STA $0420,X
  $A919  F0 F7     BEQ $A912

L_A91B:
  $A91B  A9 1C     LDA #$1C
  $A91D  8D C1 06  STA $06C1
  $A920  A9 00     LDA #$00
  $A922  85 02     STA $02
  $A924  5E 20 04  LSR $0420,X
  $A927  18        CLC
  $A928  60        RTS

L_A929:
  $A929  A5 CB     LDA $CB
  $A92B  D0 02     BNE $A92F
  $A92D  06 00     ASL $00

L_A92F:
  $A92F  60        RTS
  $A930  01 5A     ORA ($5A,X)
  $A932  CE 25 89  DEC $8925
  $A935  E0 1B     CPX #$1B
  $A937  B6 54     LDX $54,Y
  $A939  A6 A6     LDX $A6
  $A93B  A6 A7     LDX $A7
  $A93D  A7        .db $A7
  $A93E  A7        .db $A7
  $A93F  A9 A8     LDA #$A8
  $A941  A8        TAY
  $A942  02        .db $02
  $A943  02        .db $02
  $A944  01 01     ORA ($01,X)
  $A946  02        .db $02
  $A947  02        .db $02
  $A948  01 01     ORA ($01,X)
  $A94A  01 00     ORA ($00,X)
  $A94C  01 00     ORA ($00,X)
  $A94E  01 FF     ORA ($FF,X)
  $A950  FF        .db $FF
  $A951  06 0E     ASL $0E
  $A953  00        BRK
  $A954  0A        ASL
  $A955  06 04     ASL $04
  $A957  06 08     ASL $08
  $A959  00        BRK
  $A95A  08        PHP
  $A95B  00        BRK
  $A95C  0E FF 02  ASL $02FF
  $A95F  00        BRK
  $A960  04        .db $04
  $A961  00        BRK
  $A962  02        .db $02
  $A963  00        BRK
  $A964  00        BRK
  $A965  0A        ASL
  $A966  00        BRK
  $A967  00        BRK
  $A968  00        BRK
  $A969  00        BRK
  $A96A  01 FF     ORA ($FF,X)
  $A96C  00        BRK
  $A96D  08        PHP
  $A96E  FF        .db $FF
  $A96F  00        BRK
  $A970  00        BRK
  $A971  00        BRK
  $A972  00        BRK
  $A973  00        BRK
  $A974  00        BRK
  $A975  00        BRK
  $A976  00        BRK
  $A977  00        BRK
  $A978  00        BRK
  $A979  FF        .db $FF
  $A97A  06 00     ASL $00
  $A97C  00        BRK
  $A97D  FF        .db $FF
  $A97E  00        BRK
  $A97F  02        .db $02
  $A980  00        BRK
  $A981  01 00     ORA ($00,X)
  $A983  00        BRK
  $A984  01 00     ORA ($00,X)
  $A986  00        BRK
  $A987  01 02     ORA ($02,X)
  $A989  02        .db $02
  $A98A  00        BRK
  $A98B  02        .db $02
  $A98C  00        BRK
  $A98D  00        BRK
  $A98E  04        .db $04
  $A98F  01 01     ORA ($01,X)

L_A991:
  $A991  00        BRK
  $A992  02        .db $02
  $A993  00        BRK
  $A994  01 FF     ORA ($FF,X)
  $A996  FF        .db $FF
  $A997  00        BRK
  $A998  02        .db $02
  $A999  02        .db $02
  $A99A  04        .db $04
  $A99B  03        .db $03
  $A99C  00        BRK
  $A99D  00        BRK
  $A99E  01 00     ORA ($00,X)
  $A9A0  01 00     ORA ($00,X)
  $A9A2  04        .db $04
  $A9A3  FF        .db $FF
  $A9A4  01 00     ORA ($00,X)
  $A9A6  02        .db $02
  $A9A7  04        .db $04
  $A9A8  00        BRK
  $A9A9  04        .db $04
  $A9AA  0E 00 00  ASL $0000
  $A9AD  00        BRK
  $A9AE  00        BRK
  $A9AF  00        BRK
  $A9B0  01 FF     ORA ($FF,X)
  $A9B2  08        PHP
  $A9B3  08        PHP
  $A9B4  08        PHP
  $A9B5  04        .db $04
  $A9B6  04        .db $04
  $A9B7  04        .db $04
  $A9B8  06 04     ASL $04
  $A9BA  1C        .db $1C
  $A9BB  08        PHP
  $A9BC  04        .db $04
  $A9BD  08        PHP
  $A9BE  0A        ASL
  $A9BF  14        .db $14
  $A9C0  20 20 20  JSR $2020
  $A9C3  21 21     AND ($21,X)
  $A9C5  21 21     AND ($21,X)
  $A9C7  21 21     AND ($21,X)
  $A9C9  21 21     AND ($21,X)
  $A9CB  C7        .db $C7
  $A9CC  E6 EE     INC $EE
  $A9CE  06 26     ASL $26
  $A9D0  44        .db $44
  $A9D1  64        .db $64
  $A9D2  85 A5     STA $A5
  $A9D4  C5 E6     CMP $E6
  $A9D6  03        .db $03
  $A9D7  05 02     ORA $02
  $A9D9  0A        ASL
  $A9DA  0A        ASL
  $A9DB  0D 0F 0E  ORA $0E0F
  $A9DE  0E 0F 0E  ASL $0E0F
  $A9E1  00        BRK
  $A9E2  00        BRK
  $A9E3  00        BRK
  $A9E4  00        BRK
  $A9E5  00        BRK
  $A9E6  00        BRK
  $A9E7  83        .db $83
  $A9E8  84 85     STY $85
  $A9EA  86 87     STX $87
  $A9EC  88        DEY
  $A9ED  89        .db $89
  $A9EE  8A        TXA
  $A9EF  8B        .db $8B
  $A9F0  8C 8D 8D  STY $8D8D
  $A9F3  8D 8E 00  STA $008E
  $A9F6  00        BRK
  $A9F7  00        BRK
  $A9F8  00        BRK
  $A9F9  00        BRK
  $A9FA  00        BRK
  $A9FB  00        BRK
  $A9FC  00        BRK
  $A9FD  8F        .db $8F
  $A9FE  90 91     BCC $A991
  $AA00  92        .db $92
  $AA01  93        .db $93
  $AA02  94 95     STY $95,X
  $AA04  96 97     STX $97,Y
  $AA06  98        TYA
  $AA07  98        TYA
  $AA08  99 9A 9B  STA $9B9A,Y
  $AA0B  00        BRK
  $AA0C  00        BRK
  $AA0D  9C        .db $9C
  $AA0E  9D 9E 9F  STA $9F9E,X
  $AA11  A0 A1     LDY #$A1
  $AA13  A2 A3     LDX #$A3
  $AA15  A2 A3     LDX #$A3
  $AA17  A2 A3     LDX #$A3
  $AA19  A2 A3     LDX #$A3
  $AA1B  A2 A3     LDX #$A3
  $AA1D  A2 A4     LDX #$A4
  $AA1F  A5 A6     LDA $A6
  $AA21  A7        .db $A7
  $AA22  00        BRK
  $AA23  A8        TAY
  $AA24  A9 AA     LDA #$AA
  $AA26  AB        .db $AB
  $AA27  AC AD AE  LDY $AEAD
  $AA2A  AF        .db $AF
  $AA2B  AE AF AE  LDX $AEAF
  $AA2E  AF        .db $AF
  $AA2F  AE AF AE  LDX $AEAF
  $AA32  AF        .db $AF
  $AA33  AE B0 B1  LDX $B1B0
  $AA36  B2        .db $B2
  $AA37  B3        .db $B3
  $AA38  B4 B5     LDY $B5,X
  $AA3A  B6 B7     LDX $B7,Y
  $AA3C  B8        CLV

L_AA3D:
  $AA3D  B9 BA BB  LDA $BBBA,Y
  $AA40  BC BD BA  LDY $BABD,X
  $AA43  BB        .db $BB
  $AA44  BC BD BA  LDY $BABD,X
  $AA47  BB        .db $BB
  $AA48  BC BD BA  LDY $BABD,X
  $AA4B  BB        .db $BB
  $AA4C  BC BE BF  LDY $BFBE,X
  $AA4F  C0 C1     CPY #$C1
  $AA51  C2        .db $C2
  $AA52  C3        .db $C3
  $AA53  C4 C5     CPY $C5
  $AA55  C6 C7     DEC $C7
  $AA57  C8        INY
  $AA58  C5 C6     CMP $C6
  $AA5A  C7        .db $C7
  $AA5B  C8        INY
  $AA5C  C5 C6     CMP $C6
  $AA5E  C7        .db $C7
  $AA5F  C8        INY
  $AA60  C5 C6     CMP $C6
  $AA62  C7        .db $C7
  $AA63  C9 CA     CMP #$CA
  $AA65  CB        .db $CB
  $AA66  CC CD CE  CPY $CECD
  $AA69  CF        .db $CF
  $AA6A  D0 D1     BNE $AA3D
  $AA6C  D2        .db $D2
  $AA6D  D3        .db $D3
  $AA6E  D0 D1     BNE $AA41
  $AA70  D2        .db $D2
  $AA71  D3        .db $D3
  $AA72  D0 D1     BNE $AA45
  $AA74  D2        .db $D2
  $AA75  D3        .db $D3
  $AA76  D0 D1     BNE $AA49
  $AA78  D2        .db $D2
  $AA79  D4        .db $D4
  $AA7A  D5 D6     CMP $D6,X
  $AA7C  D7        .db $D7
  $AA7D  D8        CLD
  $AA7E  D9 DA DB  CMP $DBDA,Y
  $AA81  DC        .db $DC
  $AA82  DD DE DF  CMP $DFDE,X
  $AA85  DC        .db $DC
  $AA86  DD DE DF  CMP $DFDE,X
  $AA89  DC        .db $DC
  $AA8A  DD DE DF  CMP $DFDE,X
  $AA8D  DC        .db $DC
  $AA8E  DD E0 E1  CMP $E1E0,X
  $AA91  FF        .db $FF
  $AA92  3F        .db $3F
  $AA93  0F        .db $0F
  $AA94  FF        .db $FF
  $AA95  FF        .db $FF
  $AA96  FF        .db $FF
  $AA97  FF        .db $FF
  $AA98  33        .db $33
  $AA99  44        .db $44
  $AA9A  FD FF FF  SBC $FFFF,X
  $AA9D  FF        .db $FF
  $AA9E  7F        .db $7F
  $AA9F  D0 FF     BNE $AAA0
  $AAA1  FF        .db $FF
  $AAA2  FF        .db $FF
  $AAA3  FF        .db $FF
  $AAA4  F7        .db $F7
  $AAA5  F5 FF     SBC $FF,X
  $AAA7  FF        .db $FF
  $AAA8  FF        .db $FF
  $AAA9  AF        .db $AF
  $AAAA  AA        TAX
  $AAAB  AA        TAX
  $AAAC  AA        TAX
  $AAAD  AA        TAX
  $AAAE  AA        TAX
  $AAAF  FF        .db $FF
  $AAB0  FF        .db $FF
  $AAB1  FF        .db $FF
  $AAB2  FF        .db $FF
  $AAB3  FF        .db $FF
  $AAB4  FF        .db $FF
  $AAB5  FF        .db $FF
  $AAB6  FF        .db $FF
  $AAB7  FF        .db $FF
  $AAB8  FF        .db $FF
  $AAB9  FF        .db $FF
  $AABA  FF        .db $FF
  $AABB  FF        .db $FF
  $AABC  FF        .db $FF
  $AABD  FF        .db $FF
  $AABE  FF        .db $FF
  $AABF  FF        .db $FF
  $AAC0  FF        .db $FF
  $AAC1  FF        .db $FF
  $AAC2  FF        .db $FF
  $AAC3  FF        .db $FF
  $AAC4  FF        .db $FF
  $AAC5  FF        .db $FF
  $AAC6  FF        .db $FF
  $AAC7  FF        .db $FF
  $AAC8  FF        .db $FF
  $AAC9  FF        .db $FF
  $AACA  FF        .db $FF
  $AACB  FF        .db $FF
  $AACC  FF        .db $FF
  $AACD  FF        .db $FF
  $AACE  FF        .db $FF
  $AACF  FF        .db $FF
  $AAD0  FF        .db $FF
  $AAD1  FF        .db $FF
  $AAD2  FF        .db $FF
  $AAD3  FF        .db $FF
  $AAD4  FF        .db $FF
  $AAD5  FF        .db $FF
  $AAD6  FF        .db $FF
  $AAD7  FF        .db $FF
  $AAD8  FF        .db $FF
  $AAD9  FF        .db $FF
  $AADA  FF        .db $FF
  $AADB  FF        .db $FF
  $AADC  FF        .db $FF
  $AADD  FF        .db $FF
  $AADE  FF        .db $FF
  $AADF  FF        .db $FF
  $AAE0  FF        .db $FF
  $AAE1  FF        .db $FF
  $AAE2  FF        .db $FF
  $AAE3  FF        .db $FF
  $AAE4  FF        .db $FF
  $AAE5  FF        .db $FF
  $AAE6  FF        .db $FF
  $AAE7  FF        .db $FF
  $AAE8  FF        .db $FF
  $AAE9  FF        .db $FF
  $AAEA  FF        .db $FF
  $AAEB  FF        .db $FF
  $AAEC  FF        .db $FF
  $AAED  FF        .db $FF
  $AAEE  FF        .db $FF
  $AAEF  FF        .db $FF
  $AAF0  FF        .db $FF
  $AAF1  FF        .db $FF
  $AAF2  FF        .db $FF
  $AAF3  FF        .db $FF
  $AAF4  FF        .db $FF
  $AAF5  FF        .db $FF
  $AAF6  FF        .db $FF
  $AAF7  FF        .db $FF
  $AAF8  FF        .db $FF
  $AAF9  FF        .db $FF
  $AAFA  FF        .db $FF
  $AAFB  FF        .db $FF
  $AAFC  FF        .db $FF
  $AAFD  FF        .db $FF
  $AAFE  FF        .db $FF
  $AAFF  FF        .db $FF
  $AB00  FF        .db $FF
  $AB01  FF        .db $FF
  $AB02  FF        .db $FF
  $AB03  FF        .db $FF
  $AB04  FF        .db $FF
  $AB05  FF        .db $FF
  $AB06  FF        .db $FF
  $AB07  FF        .db $FF
  $AB08  FF        .db $FF
  $AB09  FF        .db $FF
  $AB0A  FF        .db $FF
  $AB0B  FF        .db $FF
  $AB0C  FF        .db $FF
  $AB0D  FF        .db $FF
  $AB0E  FF        .db $FF
  $AB0F  FF        .db $FF
  $AB10  FF        .db $FF
  $AB11  FF        .db $FF
  $AB12  FF        .db $FF
  $AB13  FF        .db $FF
  $AB14  FF        .db $FF
  $AB15  FF        .db $FF
  $AB16  FF        .db $FF
  $AB17  FF        .db $FF
  $AB18  FF        .db $FF
  $AB19  FF        .db $FF
  $AB1A  FF        .db $FF
  $AB1B  FF        .db $FF
  $AB1C  FF        .db $FF
  $AB1D  FF        .db $FF
  $AB1E  FF        .db $FF
  $AB1F  FF        .db $FF
  $AB20  FF        .db $FF
  $AB21  FF        .db $FF
  $AB22  FF        .db $FF
  $AB23  FF        .db $FF
  $AB24  FF        .db $FF
  $AB25  FF        .db $FF
  $AB26  FF        .db $FF
  $AB27  FF        .db $FF
  $AB28  FF        .db $FF
  $AB29  FF        .db $FF
  $AB2A  FF        .db $FF
  $AB2B  FF        .db $FF
  $AB2C  FF        .db $FF
  $AB2D  FF        .db $FF
  $AB2E  FF        .db $FF
  $AB2F  FF        .db $FF
  $AB30  FF        .db $FF
  $AB31  FF        .db $FF
  $AB32  FF        .db $FF
  $AB33  FF        .db $FF
  $AB34  FF        .db $FF
  $AB35  FF        .db $FF
  $AB36  FF        .db $FF
  $AB37  FF        .db $FF
  $AB38  FF        .db $FF
  $AB39  FF        .db $FF
  $AB3A  FF        .db $FF
  $AB3B  FF        .db $FF
  $AB3C  FF        .db $FF
  $AB3D  FF        .db $FF
  $AB3E  FF        .db $FF
  $AB3F  FF        .db $FF
  $AB40  FF        .db $FF
  $AB41  FF        .db $FF
  $AB42  FF        .db $FF
  $AB43  FF        .db $FF
  $AB44  FF        .db $FF
  $AB45  FF        .db $FF
  $AB46  FF        .db $FF
  $AB47  FF        .db $FF
  $AB48  FF        .db $FF
  $AB49  FF        .db $FF
  $AB4A  FF        .db $FF
  $AB4B  FF        .db $FF
  $AB4C  FF        .db $FF
  $AB4D  FF        .db $FF
  $AB4E  FF        .db $FF
  $AB4F  FF        .db $FF
  $AB50  FF        .db $FF
  $AB51  FF        .db $FF
  $AB52  FF        .db $FF
  $AB53  FF        .db $FF
  $AB54  FF        .db $FF
  $AB55  FF        .db $FF
  $AB56  FF        .db $FF
  $AB57  FF        .db $FF
  $AB58  FF        .db $FF
  $AB59  FF        .db $FF
  $AB5A  FF        .db $FF
  $AB5B  FF        .db $FF
  $AB5C  FF        .db $FF
  $AB5D  FF        .db $FF
  $AB5E  FF        .db $FF
  $AB5F  FF        .db $FF
  $AB60  FF        .db $FF
  $AB61  FF        .db $FF
  $AB62  FF        .db $FF
  $AB63  FF        .db $FF
  $AB64  FF        .db $FF
  $AB65  FF        .db $FF
  $AB66  FF        .db $FF
  $AB67  FF        .db $FF
  $AB68  FF        .db $FF
  $AB69  FF        .db $FF
  $AB6A  FF        .db $FF
  $AB6B  FF        .db $FF
  $AB6C  FF        .db $FF
  $AB6D  FF        .db $FF
  $AB6E  FF        .db $FF
  $AB6F  FF        .db $FF
  $AB70  FF        .db $FF
  $AB71  FF        .db $FF
  $AB72  FF        .db $FF
  $AB73  FF        .db $FF
  $AB74  FF        .db $FF
  $AB75  FF        .db $FF
  $AB76  FF        .db $FF
  $AB77  FF        .db $FF
  $AB78  FF        .db $FF
  $AB79  FF        .db $FF
  $AB7A  FF        .db $FF
  $AB7B  FF        .db $FF
  $AB7C  FF        .db $FF
  $AB7D  FF        .db $FF
  $AB7E  FF        .db $FF
  $AB7F  FF        .db $FF
  $AB80  FF        .db $FF
  $AB81  FF        .db $FF
  $AB82  FF        .db $FF
  $AB83  FF        .db $FF
  $AB84  FF        .db $FF
  $AB85  FF        .db $FF
  $AB86  FF        .db $FF
  $AB87  FF        .db $FF
  $AB88  FF        .db $FF
  $AB89  FF        .db $FF
  $AB8A  FF        .db $FF
  $AB8B  FF        .db $FF
  $AB8C  FF        .db $FF
  $AB8D  FF        .db $FF
  $AB8E  FF        .db $FF
  $AB8F  FF        .db $FF
  $AB90  FF        .db $FF
  $AB91  FF        .db $FF
  $AB92  FF        .db $FF
  $AB93  FF        .db $FF
  $AB94  FF        .db $FF
  $AB95  FF        .db $FF
  $AB96  FF        .db $FF
  $AB97  FF        .db $FF
  $AB98  FF        .db $FF
  $AB99  FF        .db $FF
  $AB9A  FF        .db $FF
  $AB9B  FF        .db $FF
  $AB9C  FF        .db $FF
  $AB9D  FF        .db $FF
  $AB9E  FF        .db $FF
  $AB9F  FF        .db $FF
  $ABA0  FF        .db $FF
  $ABA1  FF        .db $FF
  $ABA2  FF        .db $FF
  $ABA3  FF        .db $FF
  $ABA4  FF        .db $FF
  $ABA5  FF        .db $FF
  $ABA6  FF        .db $FF
  $ABA7  FF        .db $FF
  $ABA8  FF        .db $FF
  $ABA9  FF        .db $FF
  $ABAA  FF        .db $FF
  $ABAB  FF        .db $FF
  $ABAC  FF        .db $FF
  $ABAD  FF        .db $FF
  $ABAE  FF        .db $FF
  $ABAF  FF        .db $FF
  $ABB0  FF        .db $FF
  $ABB1  FF        .db $FF
  $ABB2  FF        .db $FF
  $ABB3  FF        .db $FF
  $ABB4  FF        .db $FF
  $ABB5  FF        .db $FF
  $ABB6  FF        .db $FF
  $ABB7  FF        .db $FF
  $ABB8  FF        .db $FF
  $ABB9  FF        .db $FF
  $ABBA  FF        .db $FF
  $ABBB  FF        .db $FF
  $ABBC  FF        .db $FF
  $ABBD  FF        .db $FF
  $ABBE  FF        .db $FF
  $ABBF  FF        .db $FF
  $ABC0  FF        .db $FF
  $ABC1  FF        .db $FF
  $ABC2  FF        .db $FF
  $ABC3  FF        .db $FF
  $ABC4  FF        .db $FF
  $ABC5  FF        .db $FF
  $ABC6  FF        .db $FF
  $ABC7  FF        .db $FF
  $ABC8  FF        .db $FF
  $ABC9  FF        .db $FF
  $ABCA  FF        .db $FF
  $ABCB  FF        .db $FF
  $ABCC  FF        .db $FF
  $ABCD  FF        .db $FF
  $ABCE  FF        .db $FF
  $ABCF  FF        .db $FF
  $ABD0  FF        .db $FF
  $ABD1  FF        .db $FF
  $ABD2  FF        .db $FF
  $ABD3  FF        .db $FF
  $ABD4  FF        .db $FF
  $ABD5  FF        .db $FF
  $ABD6  FF        .db $FF
  $ABD7  FF        .db $FF
  $ABD8  FF        .db $FF
  $ABD9  FF        .db $FF
  $ABDA  FF        .db $FF
  $ABDB  FF        .db $FF
  $ABDC  FF        .db $FF
  $ABDD  FF        .db $FF
  $ABDE  FF        .db $FF
  $ABDF  FF        .db $FF
  $ABE0  FF        .db $FF
  $ABE1  FF        .db $FF
  $ABE2  FF        .db $FF
  $ABE3  FF        .db $FF
  $ABE4  FF        .db $FF
  $ABE5  FF        .db $FF
  $ABE6  FF        .db $FF
  $ABE7  FF        .db $FF
  $ABE8  FF        .db $FF
  $ABE9  FF        .db $FF
  $ABEA  FF        .db $FF
  $ABEB  FF        .db $FF
  $ABEC  FF        .db $FF
  $ABED  FF        .db $FF
  $ABEE  FF        .db $FF
  $ABEF  FF        .db $FF
  $ABF0  FF        .db $FF
  $ABF1  FF        .db $FF
  $ABF2  FF        .db $FF
  $ABF3  FF        .db $FF
  $ABF4  FF        .db $FF
  $ABF5  FF        .db $FF
  $ABF6  FF        .db $FF
  $ABF7  FF        .db $FF
  $ABF8  FF        .db $FF
  $ABF9  FF        .db $FF
  $ABFA  FF        .db $FF
  $ABFB  FF        .db $FF
  $ABFC  FF        .db $FF
  $ABFD  FF        .db $FF
  $ABFE  FF        .db $FF
  $ABFF  FF        .db $FF
  $AC00  FF        .db $FF
  $AC01  FF        .db $FF
  $AC02  FF        .db $FF
  $AC03  FF        .db $FF
  $AC04  FF        .db $FF
  $AC05  FF        .db $FF
  $AC06  FF        .db $FF
  $AC07  FF        .db $FF
  $AC08  FF        .db $FF
  $AC09  FF        .db $FF
  $AC0A  FF        .db $FF
  $AC0B  FF        .db $FF
  $AC0C  FF        .db $FF
  $AC0D  FF        .db $FF
  $AC0E  FF        .db $FF
  $AC0F  FF        .db $FF
  $AC10  FF        .db $FF
  $AC11  FF        .db $FF
  $AC12  FF        .db $FF
  $AC13  FF        .db $FF
  $AC14  FF        .db $FF
  $AC15  FF        .db $FF
  $AC16  FF        .db $FF
  $AC17  FF        .db $FF
  $AC18  FF        .db $FF
  $AC19  FF        .db $FF
  $AC1A  FF        .db $FF
  $AC1B  FF        .db $FF
  $AC1C  FF        .db $FF
  $AC1D  FF        .db $FF
  $AC1E  FF        .db $FF
  $AC1F  FF        .db $FF
  $AC20  FF        .db $FF
  $AC21  FF        .db $FF
  $AC22  FF        .db $FF
  $AC23  FF        .db $FF
  $AC24  FF        .db $FF
  $AC25  FF        .db $FF
  $AC26  FF        .db $FF
  $AC27  FF        .db $FF
  $AC28  FF        .db $FF
  $AC29  FF        .db $FF
  $AC2A  FF        .db $FF
  $AC2B  FF        .db $FF
  $AC2C  FF        .db $FF
  $AC2D  FF        .db $FF
  $AC2E  FF        .db $FF
  $AC2F  FF        .db $FF
  $AC30  FF        .db $FF
  $AC31  FF        .db $FF
  $AC32  FF        .db $FF
  $AC33  FF        .db $FF
  $AC34  FF        .db $FF
  $AC35  FF        .db $FF
  $AC36  FF        .db $FF
  $AC37  FF        .db $FF
  $AC38  FF        .db $FF
  $AC39  FF        .db $FF
  $AC3A  FF        .db $FF
  $AC3B  FF        .db $FF
  $AC3C  FF        .db $FF
  $AC3D  FF        .db $FF
  $AC3E  FF        .db $FF
  $AC3F  FF        .db $FF
  $AC40  FF        .db $FF
  $AC41  FF        .db $FF
  $AC42  FF        .db $FF
  $AC43  FF        .db $FF
  $AC44  FF        .db $FF
  $AC45  FF        .db $FF
  $AC46  FF        .db $FF
  $AC47  FF        .db $FF
  $AC48  FF        .db $FF
  $AC49  FF        .db $FF
  $AC4A  FF        .db $FF
  $AC4B  FF        .db $FF
  $AC4C  FF        .db $FF
  $AC4D  FF        .db $FF
  $AC4E  FF        .db $FF
  $AC4F  FF        .db $FF
  $AC50  FF        .db $FF
  $AC51  FF        .db $FF
  $AC52  FF        .db $FF
  $AC53  FF        .db $FF
  $AC54  FF        .db $FF
  $AC55  FF        .db $FF
  $AC56  FF        .db $FF
  $AC57  FF        .db $FF
  $AC58  FF        .db $FF
  $AC59  FF        .db $FF
  $AC5A  FF        .db $FF
  $AC5B  FF        .db $FF
  $AC5C  FF        .db $FF
  $AC5D  FF        .db $FF
  $AC5E  FF        .db $FF
  $AC5F  FF        .db $FF
  $AC60  FF        .db $FF
  $AC61  FF        .db $FF
  $AC62  FF        .db $FF
  $AC63  FF        .db $FF
  $AC64  FF        .db $FF
  $AC65  FF        .db $FF
  $AC66  FF        .db $FF
  $AC67  FF        .db $FF
  $AC68  FF        .db $FF
  $AC69  FF        .db $FF
  $AC6A  FF        .db $FF
  $AC6B  FF        .db $FF
  $AC6C  FF        .db $FF
  $AC6D  FF        .db $FF
  $AC6E  FF        .db $FF
  $AC6F  FF        .db $FF
  $AC70  FF        .db $FF
  $AC71  FF        .db $FF
  $AC72  FF        .db $FF
  $AC73  FF        .db $FF
  $AC74  FF        .db $FF
  $AC75  FF        .db $FF
  $AC76  FF        .db $FF
  $AC77  FF        .db $FF
  $AC78  FF        .db $FF
  $AC79  FF        .db $FF
  $AC7A  FF        .db $FF
  $AC7B  FF        .db $FF
  $AC7C  FF        .db $FF
  $AC7D  FF        .db $FF
  $AC7E  FF        .db $FF
  $AC7F  FF        .db $FF
  $AC80  FF        .db $FF
  $AC81  FF        .db $FF
  $AC82  FF        .db $FF
  $AC83  FF        .db $FF
  $AC84  FF        .db $FF
  $AC85  FF        .db $FF
  $AC86  FF        .db $FF
  $AC87  FF        .db $FF
  $AC88  FF        .db $FF
  $AC89  FF        .db $FF
  $AC8A  FF        .db $FF
  $AC8B  FF        .db $FF
  $AC8C  FF        .db $FF
  $AC8D  FF        .db $FF
  $AC8E  FF        .db $FF
  $AC8F  FF        .db $FF
  $AC90  FF        .db $FF
  $AC91  FF        .db $FF
  $AC92  FF        .db $FF
  $AC93  FF        .db $FF
  $AC94  FF        .db $FF
  $AC95  FF        .db $FF
  $AC96  FF        .db $FF
  $AC97  FF        .db $FF
  $AC98  FF        .db $FF
  $AC99  FF        .db $FF
  $AC9A  FF        .db $FF
  $AC9B  FF        .db $FF
  $AC9C  FF        .db $FF
  $AC9D  FF        .db $FF
  $AC9E  FF        .db $FF
  $AC9F  FF        .db $FF
  $ACA0  FF        .db $FF
  $ACA1  FF        .db $FF
  $ACA2  FF        .db $FF
  $ACA3  FF        .db $FF
  $ACA4  FF        .db $FF
  $ACA5  FF        .db $FF
  $ACA6  FF        .db $FF
  $ACA7  FF        .db $FF
  $ACA8  FF        .db $FF
  $ACA9  FF        .db $FF
  $ACAA  FF        .db $FF
  $ACAB  FF        .db $FF
  $ACAC  FF        .db $FF
  $ACAD  FF        .db $FF
  $ACAE  FF        .db $FF
  $ACAF  FF        .db $FF
  $ACB0  FF        .db $FF
  $ACB1  FF        .db $FF
  $ACB2  FF        .db $FF
  $ACB3  FF        .db $FF
  $ACB4  FF        .db $FF
  $ACB5  FF        .db $FF
  $ACB6  FF        .db $FF
  $ACB7  FF        .db $FF
  $ACB8  FF        .db $FF
  $ACB9  FF        .db $FF
  $ACBA  FF        .db $FF
  $ACBB  FF        .db $FF
  $ACBC  FF        .db $FF
  $ACBD  FF        .db $FF
  $ACBE  FF        .db $FF
  $ACBF  FF        .db $FF
  $ACC0  FF        .db $FF
  $ACC1  FF        .db $FF
  $ACC2  FF        .db $FF
  $ACC3  FF        .db $FF
  $ACC4  FF        .db $FF
  $ACC5  FF        .db $FF
  $ACC6  FF        .db $FF
  $ACC7  FF        .db $FF
  $ACC8  FF        .db $FF
  $ACC9  FF        .db $FF
  $ACCA  FF        .db $FF
  $ACCB  FF        .db $FF
  $ACCC  FF        .db $FF
  $ACCD  FF        .db $FF
  $ACCE  FF        .db $FF
  $ACCF  FF        .db $FF
  $ACD0  FF        .db $FF
  $ACD1  FF        .db $FF
  $ACD2  FF        .db $FF
  $ACD3  FF        .db $FF
  $ACD4  FF        .db $FF
  $ACD5  FF        .db $FF
  $ACD6  FF        .db $FF
  $ACD7  FF        .db $FF
  $ACD8  FF        .db $FF
  $ACD9  FF        .db $FF
  $ACDA  FF        .db $FF
  $ACDB  FF        .db $FF
  $ACDC  FF        .db $FF
  $ACDD  FF        .db $FF
  $ACDE  FF        .db $FF
  $ACDF  FF        .db $FF
  $ACE0  FF        .db $FF
  $ACE1  FF        .db $FF
  $ACE2  FF        .db $FF
  $ACE3  FF        .db $FF
  $ACE4  FF        .db $FF
  $ACE5  FF        .db $FF
  $ACE6  FF        .db $FF
  $ACE7  FF        .db $FF
  $ACE8  FF        .db $FF
  $ACE9  FF        .db $FF
  $ACEA  FF        .db $FF
  $ACEB  FF        .db $FF
  $ACEC  FF        .db $FF
  $ACED  FF        .db $FF
  $ACEE  FF        .db $FF
  $ACEF  FF        .db $FF
  $ACF0  FF        .db $FF
  $ACF1  FF        .db $FF
  $ACF2  FF        .db $FF
  $ACF3  FF        .db $FF
  $ACF4  FF        .db $FF
  $ACF5  FF        .db $FF
  $ACF6  FF        .db $FF
  $ACF7  FF        .db $FF
  $ACF8  FF        .db $FF
  $ACF9  FF        .db $FF
  $ACFA  FF        .db $FF
  $ACFB  FF        .db $FF
  $ACFC  FF        .db $FF
  $ACFD  FF        .db $FF
  $ACFE  FF        .db $FF
  $ACFF  FF        .db $FF
  $AD00  FF        .db $FF
  $AD01  FF        .db $FF
  $AD02  FF        .db $FF
  $AD03  FF        .db $FF
  $AD04  FF        .db $FF
  $AD05  FF        .db $FF
  $AD06  FF        .db $FF
  $AD07  FF        .db $FF
  $AD08  FF        .db $FF
  $AD09  FF        .db $FF
  $AD0A  FF        .db $FF
  $AD0B  FF        .db $FF
  $AD0C  FF        .db $FF
  $AD0D  FF        .db $FF
  $AD0E  FF        .db $FF
  $AD0F  FF        .db $FF
  $AD10  FF        .db $FF
  $AD11  FF        .db $FF
  $AD12  FF        .db $FF
  $AD13  FF        .db $FF
  $AD14  FF        .db $FF
  $AD15  FF        .db $FF
  $AD16  FF        .db $FF
  $AD17  FF        .db $FF
  $AD18  FF        .db $FF
  $AD19  FF        .db $FF
  $AD1A  FF        .db $FF
  $AD1B  FF        .db $FF
  $AD1C  FF        .db $FF
  $AD1D  FF        .db $FF
  $AD1E  FF        .db $FF
  $AD1F  FF        .db $FF
  $AD20  FF        .db $FF
  $AD21  FF        .db $FF
  $AD22  FF        .db $FF
  $AD23  FF        .db $FF
  $AD24  FF        .db $FF
  $AD25  FF        .db $FF
  $AD26  FF        .db $FF
  $AD27  FF        .db $FF
  $AD28  FF        .db $FF
  $AD29  FF        .db $FF
  $AD2A  FF        .db $FF
  $AD2B  FF        .db $FF
  $AD2C  FF        .db $FF
  $AD2D  FF        .db $FF
  $AD2E  FF        .db $FF
  $AD2F  FF        .db $FF
  $AD30  FF        .db $FF
  $AD31  FF        .db $FF
  $AD32  FF        .db $FF
  $AD33  FF        .db $FF
  $AD34  FF        .db $FF
  $AD35  FF        .db $FF
  $AD36  FF        .db $FF
  $AD37  FF        .db $FF
  $AD38  FF        .db $FF
  $AD39  FF        .db $FF
  $AD3A  FF        .db $FF
  $AD3B  FF        .db $FF
  $AD3C  FF        .db $FF
  $AD3D  FF        .db $FF
  $AD3E  FF        .db $FF
  $AD3F  FF        .db $FF
  $AD40  FF        .db $FF
  $AD41  FF        .db $FF
  $AD42  FF        .db $FF
  $AD43  FF        .db $FF
  $AD44  FF        .db $FF
  $AD45  FF        .db $FF
  $AD46  FF        .db $FF
  $AD47  FF        .db $FF
  $AD48  FF        .db $FF
  $AD49  FF        .db $FF
  $AD4A  FF        .db $FF
  $AD4B  FF        .db $FF
  $AD4C  FF        .db $FF
  $AD4D  FF        .db $FF
  $AD4E  FF        .db $FF
  $AD4F  FF        .db $FF
  $AD50  FF        .db $FF
  $AD51  FF        .db $FF
  $AD52  FF        .db $FF
  $AD53  FF        .db $FF
  $AD54  FF        .db $FF
  $AD55  FF        .db $FF
  $AD56  FF        .db $FF
  $AD57  FF        .db $FF
  $AD58  FF        .db $FF
  $AD59  FF        .db $FF
  $AD5A  FF        .db $FF
  $AD5B  FF        .db $FF
  $AD5C  FF        .db $FF
  $AD5D  FF        .db $FF
  $AD5E  FF        .db $FF
  $AD5F  FF        .db $FF
  $AD60  FF        .db $FF
  $AD61  FF        .db $FF
  $AD62  FF        .db $FF
  $AD63  FF        .db $FF
  $AD64  FF        .db $FF
  $AD65  FF        .db $FF
  $AD66  FF        .db $FF
  $AD67  FF        .db $FF
  $AD68  FF        .db $FF
  $AD69  FF        .db $FF
  $AD6A  FF        .db $FF
  $AD6B  FF        .db $FF
  $AD6C  FF        .db $FF
  $AD6D  FF        .db $FF
  $AD6E  FF        .db $FF
  $AD6F  FF        .db $FF
  $AD70  FF        .db $FF
  $AD71  FF        .db $FF
  $AD72  FF        .db $FF
  $AD73  FF        .db $FF
  $AD74  FF        .db $FF
  $AD75  FF        .db $FF
  $AD76  FF        .db $FF
  $AD77  FF        .db $FF
  $AD78  FF        .db $FF
  $AD79  FF        .db $FF
  $AD7A  FF        .db $FF
  $AD7B  FF        .db $FF
  $AD7C  FF        .db $FF
  $AD7D  FF        .db $FF
  $AD7E  FF        .db $FF
  $AD7F  FF        .db $FF
  $AD80  FF        .db $FF
  $AD81  FF        .db $FF
  $AD82  FF        .db $FF
  $AD83  FF        .db $FF
  $AD84  FF        .db $FF
  $AD85  FF        .db $FF
  $AD86  FF        .db $FF
  $AD87  FF        .db $FF
  $AD88  FF        .db $FF
  $AD89  FF        .db $FF
  $AD8A  FF        .db $FF
  $AD8B  FF        .db $FF
  $AD8C  FF        .db $FF
  $AD8D  FF        .db $FF
  $AD8E  FF        .db $FF
  $AD8F  FF        .db $FF
  $AD90  FF        .db $FF
  $AD91  FF        .db $FF
  $AD92  FF        .db $FF
  $AD93  FF        .db $FF
  $AD94  FF        .db $FF
  $AD95  FF        .db $FF
  $AD96  FF        .db $FF
  $AD97  FF        .db $FF
  $AD98  FF        .db $FF
  $AD99  FF        .db $FF
  $AD9A  FF        .db $FF
  $AD9B  FF        .db $FF
  $AD9C  FF        .db $FF
  $AD9D  FF        .db $FF
  $AD9E  FF        .db $FF
  $AD9F  FF        .db $FF
  $ADA0  FF        .db $FF
  $ADA1  FF        .db $FF
  $ADA2  FF        .db $FF
  $ADA3  FF        .db $FF
  $ADA4  FF        .db $FF
  $ADA5  FF        .db $FF
  $ADA6  FF        .db $FF
  $ADA7  FF        .db $FF
  $ADA8  FF        .db $FF
  $ADA9  FF        .db $FF
  $ADAA  FF        .db $FF
  $ADAB  FF        .db $FF
  $ADAC  FF        .db $FF
  $ADAD  FF        .db $FF
  $ADAE  FF        .db $FF
  $ADAF  FF        .db $FF
  $ADB0  FF        .db $FF
  $ADB1  FF        .db $FF
  $ADB2  FF        .db $FF
  $ADB3  FF        .db $FF
  $ADB4  FF        .db $FF
  $ADB5  FF        .db $FF
  $ADB6  FF        .db $FF
  $ADB7  FF        .db $FF
  $ADB8  FF        .db $FF
  $ADB9  FF        .db $FF
  $ADBA  FF        .db $FF
  $ADBB  FF        .db $FF
  $ADBC  FF        .db $FF
  $ADBD  FF        .db $FF
  $ADBE  FF        .db $FF
  $ADBF  FF        .db $FF
  $ADC0  FF        .db $FF
  $ADC1  FF        .db $FF
  $ADC2  FF        .db $FF
  $ADC3  FF        .db $FF
  $ADC4  FF        .db $FF
  $ADC5  FF        .db $FF
  $ADC6  FF        .db $FF
  $ADC7  FF        .db $FF
  $ADC8  FF        .db $FF
  $ADC9  FF        .db $FF
  $ADCA  FF        .db $FF
  $ADCB  FF        .db $FF
  $ADCC  FF        .db $FF
  $ADCD  FF        .db $FF
  $ADCE  FF        .db $FF
  $ADCF  FF        .db $FF
  $ADD0  FF        .db $FF
  $ADD1  FF        .db $FF
  $ADD2  FF        .db $FF
  $ADD3  FF        .db $FF
  $ADD4  FF        .db $FF
  $ADD5  FF        .db $FF
  $ADD6  FF        .db $FF
  $ADD7  FF        .db $FF
  $ADD8  FF        .db $FF
  $ADD9  FF        .db $FF
  $ADDA  FF        .db $FF
  $ADDB  FF        .db $FF
  $ADDC  FF        .db $FF
  $ADDD  FF        .db $FF
  $ADDE  FF        .db $FF
  $ADDF  FF        .db $FF
  $ADE0  FF        .db $FF
  $ADE1  FF        .db $FF
  $ADE2  FF        .db $FF
  $ADE3  FF        .db $FF
  $ADE4  FF        .db $FF
  $ADE5  FF        .db $FF
  $ADE6  FF        .db $FF
  $ADE7  FF        .db $FF
  $ADE8  FF        .db $FF
  $ADE9  FF        .db $FF
  $ADEA  FF        .db $FF
  $ADEB  FF        .db $FF
  $ADEC  FF        .db $FF
  $ADED  FF        .db $FF
  $ADEE  FF        .db $FF
  $ADEF  FF        .db $FF
  $ADF0  FF        .db $FF
  $ADF1  FF        .db $FF
  $ADF2  FF        .db $FF
  $ADF3  FF        .db $FF
  $ADF4  FF        .db $FF
  $ADF5  FF        .db $FF
  $ADF6  FF        .db $FF
  $ADF7  FF        .db $FF
  $ADF8  FF        .db $FF
  $ADF9  FF        .db $FF
  $ADFA  FF        .db $FF
  $ADFB  FF        .db $FF
  $ADFC  FF        .db $FF
  $ADFD  FF        .db $FF
  $ADFE  FF        .db $FF
  $ADFF  FF        .db $FF
  $AE00  20 20 20  JSR $2020
  $AE03  20 20 20  JSR $2020
  $AE06  20 20 20  JSR $2020
  $AE09  20 20 20  JSR $2020
  $AE0C  20 20 20  JSR $2020
  $AE0F  20 20 20  JSR $2020
  $AE12  20 20 20  JSR $2020
  $AE15  20 20 20  JSR $2020
  $AE18  20 20 20  JSR $2020
  $AE1B  20 20 20  JSR $2020
  $AE1E  20 20 20  JSR $2020
  $AE21  20 20 20  JSR $2020
  $AE24  20 20 20  JSR $2020
  $AE27  20 20 20  JSR $2020
  $AE2A  20 20 20  JSR $2020
  $AE2D  20 20 20  JSR $2020
  $AE30  20 20 20  JSR $2020
  $AE33  20 20 20  JSR $2020
  $AE36  20 20 20  JSR $2020
  $AE39  20 20 20  JSR $2020
  $AE3C  20 20 20  JSR $2020
  $AE3F  20 21 21  JSR $2121
  $AE42  21 21     AND ($21,X)
  $AE44  21 21     AND ($21,X)
  $AE46  21 21     AND ($21,X)
  $AE48  21 20     AND ($20,X)
  $AE4A  10 12     BPL $AE5E
  $AE4C  05 13     ORA $13
  $AE4E  13        .db $13
  $AE4F  20 20 13  JSR $1320
  $AE52  14        .db $14
  $AE53  01 12     ORA ($12,X)
  $AE55  14        .db $14
  $AE56  20 21 21  JSR $2121
  $AE59  21 21     AND ($21,X)
  $AE5B  21 21     AND ($21,X)
  $AE5D  21 21     AND ($21,X)
  $AE5F  21 20     AND ($20,X)
  $AE61  20 20 20  JSR $2020
  $AE64  20 22 23  JSR $2322
  $AE67  23        .db $23
  $AE68  23        .db $23
  $AE69  23        .db $23
  $AE6A  24 20     BIT $20
  $AE6C  20 22 23  JSR $2322
  $AE6F  23        .db $23
  $AE70  23        .db $23
  $AE71  23        .db $23
  $AE72  24 20     BIT $20
  $AE74  20 22 23  JSR $2322
  $AE77  23        .db $23
  $AE78  23        .db $23
  $AE79  23        .db $23
  $AE7A  24 20     BIT $20
  $AE7C  20 20 20  JSR $2020
  $AE7F  20 20 20  JSR $2020
  $AE82  20 20 20  JSR $2020
  $AE85  25 30     AND $30
  $AE87  31 32     AND ($32),Y
  $AE89  33        .db $33
  $AE8A  2B        .db $2B
  $AE8B  20 20 25  JSR $2520
  $AE8E  40        RTI
  $AE8F  41 42     EOR ($42,X)
  $AE91  43        .db $43
  $AE92  2B        .db $2B
  $AE93  20 20 25  JSR $2520
  $AE96  50 51     BVC $AEE9
  $AE98  52        .db $52
  $AE99  53        .db $53
  $AE9A  2B        .db $2B
  $AE9B  20 20 20  JSR $2020
  $AE9E  20 20 2C  JSR $2C20
  $AEA1  2C 2C 2C  BIT $2C2C
  $AEA4  2C 26 34  BIT $3426
  $AEA7  35 36     AND $36,X
  $AEA9  37        .db $37
  $AEAA  2B        .db $2B
  $AEAB  2C 2C 26  BIT $262C
  $AEAE  44        .db $44
  $AEAF  45 46     EOR $46
  $AEB1  47        .db $47
  $AEB2  2B        .db $2B
  $AEB3  2C 2C 26  BIT $262C
  $AEB6  54        .db $54
  $AEB7  55 56     EOR $56,X
  $AEB9  57        .db $57
  $AEBA  2B        .db $2B
  $AEBB  2C 2C 2C  BIT $2C2C
  $AEBE  2C 2C 2D  BIT $2D2C
  $AEC1  2D 2D 2D  AND $2D2D
  $AEC4  2D 27 38  AND $3827
  $AEC7  39 3A 3B  AND $3B3A,Y
  $AECA  2B        .db $2B
  $AECB  2D 2D 27  AND $272D
  $AECE  48        PHA
  $AECF  49 4A     EOR #$4A
  $AED1  4B        .db $4B
  $AED2  2B        .db $2B
  $AED3  2D 2D 27  AND $272D
  $AED6  58        CLI
  $AED7  59 5A 5B  EOR $5B5A,Y
  $AEDA  2B        .db $2B
  $AEDB  2D 2D 2D  AND $2D2D
  $AEDE  2D 2D 20  AND $202D
  $AEE1  20 20 20  JSR $2020
  $AEE4  20 25 3C  JSR $3C25
  $AEE7  3D 3E 3F  AND $3F3E,X
  $AEEA  2B        .db $2B
  $AEEB  20 20 25  JSR $2520
  $AEEE  4C 4D 4E  JMP $4E4D
  $AEF1  4F        .db $4F
  $AEF2  2B        .db $2B
  $AEF3  20 20 25  JSR $2520
  $AEF6  5C        .db $5C
  $AEF7  5D 5E 5F  EOR $5F5E,X
  $AEFA  2B        .db $2B
  $AEFB  20 20 20  JSR $2020
  $AEFE  20 20 20  JSR $2020
  $AF01  20 20 20  JSR $2020
  $AF04  20 28 29  JSR $2928
  $AF07  29 29     AND #$29
  $AF09  29 2A     AND #$2A
  $AF0B  20 20 28  JSR $2820
  $AF0E  29 29     AND #$29
  $AF10  29 29     AND #$29
  $AF12  2A        ROL
  $AF13  20 20 28  JSR $2820
  $AF16  29 29     AND #$29
  $AF18  29 29     AND #$29
  $AF1A  2A        ROL
  $AF1B  20 20 20  JSR $2020
  $AF1E  20 20 20  JSR $2020
  $AF21  20 20 20  JSR $2020
  $AF24  20 02 15  JSR $1502
  $AF27  02        .db $02
  $AF28  02        .db $02
  $AF29  0C        .db $0C
  $AF2A  05 20     ORA $20
  $AF2C  20 20 01  JSR $0120
  $AF2F  09 12     ORA #$12
  $AF31  20 20 20  JSR $2020
  $AF34  20 11 15  JSR $1511
  $AF37  09 03     ORA #$03
  $AF39  0B        .db $0B
  $AF3A  20 20 20  JSR $2020
  $AF3D  20 20 20  JSR $2020
  $AF40  20 20 20  JSR $2020
  $AF43  20 20 20  JSR $2020
  $AF46  20 20 0D  JSR $0D20
  $AF49  01 0E     ORA ($0E,X)
  $AF4B  20 20 20  JSR $2020
  $AF4E  20 20 0D  JSR $0D20
  $AF51  01 0E     ORA ($0E,X)
  $AF53  20 20 20  JSR $2020
  $AF56  20 20 0D  JSR $0D20
  $AF59  01 0E     ORA ($0E,X)
  $AF5B  20 20 20  JSR $2020
  $AF5E  20 20 20  JSR $2020
  $AF61  20 20 20  JSR $2020
  $AF64  20 22 23  JSR $2322
  $AF67  23        .db $23
  $AF68  23        .db $23
  $AF69  23        .db $23
  $AF6A  24 20     BIT $20
  $AF6C  20 22 23  JSR $2322
  $AF6F  23        .db $23
  $AF70  23        .db $23
  $AF71  23        .db $23
  $AF72  24 20     BIT $20
  $AF74  20 22 23  JSR $2322
  $AF77  23        .db $23
  $AF78  23        .db $23
  $AF79  23        .db $23
  $AF7A  24 20     BIT $20
  $AF7C  20 20 20  JSR $2020
  $AF7F  20 20 20  JSR $2020
  $AF82  20 20 20  JSR $2020
  $AF85  25 60     AND $60
  $AF87  61 62     ADC ($62,X)
  $AF89  63        .db $63
  $AF8A  2B        .db $2B
  $AF8B  20 20 25  JSR $2520
  $AF8E  70 71     BVS $B001
  $AF90  72        .db $72
  $AF91  73        .db $73
  $AF92  2B        .db $2B
  $AF93  20 20 25  JSR $2520
  $AF96  80        .db $80
  $AF97  81 82     STA ($82,X)
  $AF99  83        .db $83
  $AF9A  2B        .db $2B
  $AF9B  20 20 20  JSR $2020
  $AF9E  20 20 2C  JSR $2C20
  $AFA1  2C 2C 2C  BIT $2C2C
  $AFA4  2C 26 64  BIT $6426
  $AFA7  65 66     ADC $66
  $AFA9  67        .db $67
  $AFAA  2B        .db $2B
  $AFAB  2C 2C 26  BIT $262C
  $AFAE  74        .db $74
  $AFAF  75 76     ADC $76,X
  $AFB1  77        .db $77
  $AFB2  2B        .db $2B
  $AFB3  2C 2C 26  BIT $262C
  $AFB6  84 85     STY $85
  $AFB8  86 87     STX $87
  $AFBA  2B        .db $2B
  $AFBB  2C 2C 2C  BIT $2C2C
  $AFBE  2C 2C 2D  BIT $2D2C
  $AFC1  2D 2D 2D  AND $2D2D
  $AFC4  2D 27 68  AND $6827
  $AFC7  69 6A     ADC #$6A
  $AFC9  6B        .db $6B
  $AFCA  2B        .db $2B
  $AFCB  2D 2D 27  AND $272D
  $AFCE  78        SEI
  $AFCF  79 7A 7B  ADC $7B7A,Y
  $AFD2  2B        .db $2B
  $AFD3  2D 2D 27  AND $272D
  $AFD6  88        DEY
  $AFD7  89        .db $89
  $AFD8  8A        TXA
  $AFD9  8B        .db $8B
  $AFDA  2B        .db $2B
  $AFDB  2D 2D 2D  AND $2D2D
  $AFDE  2D 2D 20  AND $202D
  $AFE1  20 20 20  JSR $2020
  $AFE4  20 25 6C  JSR $6C25
  $AFE7  6D 6E 6F  ADC $6F6E
  $AFEA  2B        .db $2B
  $AFEB  20 20 25  JSR $2520
  $AFEE  7C        .db $7C
  $AFEF  7D 7E 7F  ADC $7F7E,X
  $AFF2  2B        .db $2B
  $AFF3  20 20 25  JSR $2520
  $AFF6  8C 8D 8E  STY $8E8D
  $AFF9  8F        .db $8F
  $AFFA  2B        .db $2B
  $AFFB  20 20 20  JSR $2020
  $AFFE  20 20 20  JSR $2020

L_B001:
  $B001  20 20 20  JSR $2020
  $B004  20 28 29  JSR $2928
  $B007  29 29     AND #$29
  $B009  29 2A     AND #$2A
  $B00B  20 20 28  JSR $2820
  $B00E  29 29     AND #$29
  $B010  29 29     AND #$29
  $B012  2A        ROL
  $B013  20 20 28  JSR $2820
  $B016  29 29     AND #$29
  $B018  29 29     AND #$29
  $B01A  2A        ROL
  $B01B  20 20 20  JSR $2020
  $B01E  20 20 20  JSR $2020
  $B021  20 20 20  JSR $2020
  $B024  20 08 05  JSR $0508
  $B027  01 14     ORA ($14,X)
  $B029  20 20 20  JSR $2020
  $B02C  20 20 04  JSR $0420
  $B02F  1B        .db $1B
  $B030  20 20 20  JSR $2020
  $B033  20 20 17  JSR $1720
  $B036  0F        .db $0F
  $B037  0F        .db $0F
  $B038  04        .db $04
  $B039  20 20 20  JSR $2020
  $B03C  20 20 20  JSR $2020
  $B03F  20 20 20  JSR $2020
  $B042  20 20 20  JSR $2020
  $B045  20 20 20  JSR $2020
  $B048  0D 01 0E  ORA $0E01
  $B04B  20 20 20  JSR $2020
  $B04E  20 17 09  JSR $0917
  $B051  0C        .db $0C
  $B052  19 20 20  ORA $2020,Y
  $B055  20 20 20  JSR $2020
  $B058  0D 01 0E  ORA $0E01
  $B05B  20 20 20  JSR $2020
  $B05E  20 20 20  JSR $2020
  $B061  20 20 20  JSR $2020
  $B064  20 22 23  JSR $2322
  $B067  23        .db $23
  $B068  23        .db $23
  $B069  23        .db $23
  $B06A  24 20     BIT $20
  $B06C  20 22 23  JSR $2322
  $B06F  23        .db $23
  $B070  23        .db $23
  $B071  23        .db $23
  $B072  24 20     BIT $20
  $B074  20 22 23  JSR $2322
  $B077  23        .db $23
  $B078  23        .db $23
  $B079  23        .db $23
  $B07A  24 20     BIT $20
  $B07C  20 20 20  JSR $2020
  $B07F  20 20 20  JSR $2020
  $B082  20 20 20  JSR $2020
  $B085  25 90     AND $90
  $B087  91 92     STA ($92),Y
  $B089  93        .db $93
  $B08A  2B        .db $2B
  $B08B  20 20 25  JSR $2520
  $B08E  A0 A1     LDY #$A1
  $B090  A2 A3     LDX #$A3
  $B092  2B        .db $2B
  $B093  20 20 25  JSR $2520
  $B096  B0 B1     BCS $B049
  $B098  B2        .db $B2
  $B099  B3        .db $B3
  $B09A  2B        .db $2B
  $B09B  20 20 20  JSR $2020
  $B09E  20 20 2C  JSR $2C20
  $B0A1  2C 2C 2C  BIT $2C2C
  $B0A4  2C 26 94  BIT $9426
  $B0A7  95 96     STA $96,X
  $B0A9  97        .db $97
  $B0AA  2B        .db $2B
  $B0AB  2C 2C 26  BIT $262C
  $B0AE  A4 A5     LDY $A5
  $B0B0  A6 A7     LDX $A7
  $B0B2  2B        .db $2B
  $B0B3  2C 2C 26  BIT $262C
  $B0B6  B4 B5     LDY $B5,X
  $B0B8  B6 B7     LDX $B7,Y
  $B0BA  2B        .db $2B
  $B0BB  2C 2C 2C  BIT $2C2C
  $B0BE  2C 2C 2D  BIT $2D2C
  $B0C1  2D 2D 2D  AND $2D2D
  $B0C4  2D 27 98  AND $9827
  $B0C7  99 9A 9B  STA $9B9A,Y
  $B0CA  2B        .db $2B
  $B0CB  2D 2D 27  AND $272D
  $B0CE  A8        TAY
  $B0CF  A9 AA     LDA #$AA
  $B0D1  AB        .db $AB
  $B0D2  2B        .db $2B
  $B0D3  2D 2D 27  AND $272D
  $B0D6  B8        CLV
  $B0D7  B9 BA BB  LDA $BBBA,Y
  $B0DA  2B        .db $2B
  $B0DB  2D 2D 2D  AND $2D2D
  $B0DE  2D 2D 20  AND $202D
  $B0E1  20 20 20  JSR $2020
  $B0E4  20 25 9C  JSR $9C25
  $B0E7  9D 9E 9F  STA $9F9E,X
  $B0EA  2B        .db $2B
  $B0EB  20 20 25  JSR $2520
  $B0EE  AC AD AE  LDY $AEAD
  $B0F1  AF        .db $AF
  $B0F2  2B        .db $2B
  $B0F3  20 20 25  JSR $2520
  $B0F6  BC BD BE  LDY $BEBD,X
  $B0F9  BF        .db $BF
  $B0FA  2B        .db $2B
  $B0FB  20 20 20  JSR $2020
  $B0FE  20 20 20  JSR $2020
  $B101  20 20 20  JSR $2020
  $B104  20 28 29  JSR $2928
  $B107  29 29     AND #$29
  $B109  29 2A     AND #$2A
  $B10B  20 20 28  JSR $2820
  $B10E  29 29     AND #$29
  $B110  29 29     AND #$29
  $B112  2A        ROL
  $B113  20 20 28  JSR $2820
  $B116  29 29     AND #$29
  $B118  29 29     AND #$29
  $B11A  2A        ROL
  $B11B  20 20 20  JSR $2020
  $B11E  20 20 20  JSR $2020
  $B121  20 20 20  JSR $2020
  $B124  20 0D 05  JSR $050D
  $B127  14        .db $14
  $B128  01 0C     ORA ($0C,X)
  $B12A  20 20 20  JSR $2020
  $B12D  06 0C     ASL $0C
  $B12F  01 13     ORA ($13,X)
  $B131  08        PHP
  $B132  20 20 20  JSR $2020
  $B135  03        .db $03
  $B136  12        .db $12
  $B137  01 13     ORA ($13,X)
  $B139  08        PHP
  $B13A  20 20 20  JSR $2020
  $B13D  20 20 20  JSR $2020
  $B140  20 20 20  JSR $2020
  $B143  20 20 20  JSR $2020
  $B146  20 20 0D  JSR $0D20
  $B149  01 0E     ORA ($0E,X)
  $B14B  20 20 20  JSR $2020
  $B14E  20 20 0D  JSR $0D20
  $B151  01 0E     ORA ($0E,X)
  $B153  20 20 20  JSR $2020
  $B156  20 20 0D  JSR $0D20
  $B159  01 0E     ORA ($0E,X)
  $B15B  20 20 20  JSR $2020
  $B15E  20 20 20  JSR $2020
  $B161  20 20 20  JSR $2020
  $B164  20 20 20  JSR $2020
  $B167  20 20 20  JSR $2020
  $B16A  20 20 20  JSR $2020
  $B16D  20 20 20  JSR $2020
  $B170  20 20 20  JSR $2020
  $B173  20 20 20  JSR $2020
  $B176  20 20 20  JSR $2020
  $B179  20 20 20  JSR $2020
  $B17C  20 20 20  JSR $2020
  $B17F  20 21 21  JSR $2121
  $B182  21 21     AND ($21,X)
  $B184  21 21     AND ($21,X)
  $B186  21 21     AND ($21,X)
  $B188  21 21     AND ($21,X)
  $B18A  21 21     AND ($21,X)
  $B18C  21 21     AND ($21,X)
  $B18E  21 21     AND ($21,X)
  $B190  21 21     AND ($21,X)
  $B192  21 21     AND ($21,X)
  $B194  21 21     AND ($21,X)
  $B196  21 21     AND ($21,X)
  $B198  21 21     AND ($21,X)
  $B19A  21 21     AND ($21,X)
  $B19C  21 21     AND ($21,X)
  $B19E  21 21     AND ($21,X)
  $B1A0  20 20 20  JSR $2020
  $B1A3  20 20 20  JSR $2020
  $B1A6  20 20 20  JSR $2020
  $B1A9  20 20 20  JSR $2020
  $B1AC  20 20 20  JSR $2020
  $B1AF  20 20 20  JSR $2020
  $B1B2  20 20 20  JSR $2020
  $B1B5  20 20 20  JSR $2020
  $B1B8  20 20 20  JSR $2020
  $B1BB  20 20 20  JSR $2020
  $B1BE  20 20 00  JSR $0020
  $B1C1  00        BRK
  $B1C2  00        BRK
  $B1C3  00        BRK
  $B1C4  00        BRK
  $B1C5  00        BRK
  $B1C6  00        BRK
  $B1C7  00        BRK
  $B1C8  00        BRK
  $B1C9  44        .db $44
  $B1CA  11 00     ORA ($00),Y
  $B1CC  00        BRK
  $B1CD  CC 33 00  CPY $0033
  $B1D0  00        BRK
  $B1D1  00        BRK
  $B1D2  00        BRK
  $B1D3  00        BRK
  $B1D4  00        BRK
  $B1D5  00        BRK
  $B1D6  00        BRK
  $B1D7  00        BRK
  $B1D8  00        BRK
  $B1D9  CC 33 00  CPY $0033
  $B1DC  00        BRK
  $B1DD  88        DEY
  $B1DE  22        .db $22
  $B1DF  00        BRK
  $B1E0  00        BRK
  $B1E1  00        BRK
  $B1E2  00        BRK
  $B1E3  00        BRK
  $B1E4  00        BRK
  $B1E5  00        BRK
  $B1E6  00        BRK
  $B1E7  00        BRK
  $B1E8  00        BRK
  $B1E9  CC 30 00  CPY $0030
  $B1EC  00        BRK
  $B1ED  00        BRK
  $B1EE  33        .db $33
  $B1EF  00        BRK
  $B1F0  00        BRK
  $B1F1  00        BRK
  $B1F2  00        BRK
  $B1F3  00        BRK
  $B1F4  00        BRK
  $B1F5  00        BRK
  $B1F6  00        BRK
  $B1F7  00        BRK
  $B1F8  00        BRK
  $B1F9  00        BRK
  $B1FA  00        BRK
  $B1FB  00        BRK
  $B1FC  00        BRK
  $B1FD  00        BRK
  $B1FE  00        BRK
  $B1FF  00        BRK
  $B200  00        BRK
  $B201  00        BRK
  $B202  00        BRK
  $B203  00        BRK
  $B204  00        BRK
  $B205  00        BRK
  $B206  03        .db $03
  $B207  03        .db $03
  $B208  00        BRK
  $B209  00        BRK
  $B20A  00        BRK
  $B20B  00        BRK
  $B20C  00        BRK
  $B20D  03        .db $03
  $B20E  04        .db $04
  $B20F  04        .db $04
  $B210  00        BRK
  $B211  00        BRK
  $B212  00        BRK
  $B213  01 01     ORA ($01,X)
  $B215  02        .db $02
  $B216  02        .db $02
  $B217  04        .db $04
  $B218  00        BRK
  $B219  00        BRK
  $B21A  07        .db $07
  $B21B  38        SEC
  $B21C  C0 01     CPY #$01
  $B21E  01 03     ORA ($03,X)
  $B220  00        BRK
  $B221  00        BRK
  $B222  00        BRK
  $B223  20 10 08  JSR $0810
  $B226  04        .db $04

L_B227:
  $B227  02        .db $02
  $B228  00        BRK
  $B229  00        BRK
  $B22A  80        .db $80
  $B22B  C0 E0     CPY #$E0
  $B22D  F0 F8     BEQ $B227
  $B22F  FC        .db $FC
  $B230  00        BRK
  $B231  00        BRK
  $B232  00        BRK
  $B233  00        BRK
  $B234  00        BRK
  $B235  00        BRK
  $B236  00        BRK
  $B237  01 00     ORA ($00,X)
  $B239  00        BRK
  $B23A  00        BRK
  $B23B  00        BRK
  $B23C  00        BRK
  $B23D  00        BRK
  $B23E  00        BRK
  $B23F  00        BRK
  $B240  07        .db $07
  $B241  06 0C     ASL $0C
  $B243  00        BRK
  $B244  03        .db $03
  $B245  1F        .db $1F
  $B246  FC        .db $FC
  $B247  F1 08     SBC ($08),Y
  $B249  08        PHP
  $B24A  10 10     BPL $B25C
  $B24C  20 40 03  JSR $0340
  $B24F  0E 04 00  ASL $0004
  $B252  0E 7F FF  ASL $FF7F
  $B255  1F        .db $1F
  $B256  7E F0 03  ROR $03F0,X
  $B259  01 00     ORA ($00,X)
  $B25B  00        BRK

L_B25C:
  $B25C  00        BRK
  $B25D  E0 80     CPX #$80
  $B25F  00        BRK
  $B260  02        .db $02
  $B261  01 01     ORA ($01,X)
  $B263  C0 F0     CPY #$F0
  $B265  80        .db $80
  $B266  01 1E     ORA ($1E,X)
  $B268  FC        .db $FC
  $B269  FE 3E 0F  INC $0F3E,X
  $B26C  07        .db $07
  $B26D  03        .db $03
  $B26E  00        BRK
  $B26F  00        BRK
  $B270  00        BRK
  $B271  00        BRK
  $B272  00        BRK
  $B273  80        .db $80
  $B274  80        .db $80
  $B275  C0 C0     CPY #$C0
  $B277  C0 00     CPY #$00
  $B279  00        BRK
  $B27A  00        BRK
  $B27B  00        BRK
  $B27C  00        BRK
  $B27D  00        BRK
  $B27E  00        BRK
  $B27F  00        BRK
  $B280  00        BRK
  $B281  00        BRK
  $B282  00        BRK
  $B283  00        BRK
  $B284  00        BRK
  $B285  01 01     ORA ($01,X)
  $B287  03        .db $03

L_B288:
  $B288  00        BRK
  $B289  00        BRK
  $B28A  00        BRK
  $B28B  00        BRK
  $B28C  00        BRK
  $B28D  01 01     ORA ($01,X)
  $B28F  03        .db $03
  $B290  00        BRK
  $B291  00        BRK
  $B292  40        RTI
  $B293  C0 C0     CPY #$C0
  $B295  C0 C0     CPY #$C0
  $B297  C0 00     CPY #$00
  $B299  00        BRK
  $B29A  40        RTI
  $B29B  E0 E0     CPX #$E0
  $B29D  E0 E0     CPX #$E0
  $B29F  E0 03     CPX #$03
  $B2A1  07        .db $07
  $B2A2  0F        .db $0F
  $B2A3  0F        .db $0F
  $B2A4  1F        .db $1F
  $B2A5  1F        .db $1F
  $B2A6  3F        .db $3F
  $B2A7  3F        .db $3F
  $B2A8  00        BRK
  $B2A9  00        BRK
  $B2AA  00        BRK
  $B2AB  00        BRK
  $B2AC  01 03     ORA ($03,X)
  $B2AE  07        .db $07
  $B2AF  07        .db $07
  $B2B0  E1 C3     SBC ($C3,X)
  $B2B2  80        .db $80
  $B2B3  00        BRK
  $B2B4  80        .db $80
  $B2B5  C1 C2     CMP ($C2,X)
  $B2B7  D1 1E     CMP ($1E),Y
  $B2B9  3C        .db $3C
  $B2BA  7C        .db $7C
  $B2BB  F8        SED
  $B2BC  B8        CLV
  $B2BD  D8        CLD
  $B2BE  DD CE C0  CMP $C0CE,X
  $B2C1  03        .db $03
  $B2C2  0F        .db $0F
  $B2C3  3F        .db $3F
  $B2C4  FF        .db $FF
  $B2C5  FF        .db $FF
  $B2C6  70 C0     BVS $B288
  $B2C8  00        BRK
  $B2C9  00        BRK
  $B2CA  00        BRK
  $B2CB  00        BRK
  $B2CC  00        BRK
  $B2CD  00        BRK
  $B2CE  80        .db $80
  $B2CF  00        BRK
  $B2D0  FF        .db $FF
  $B2D1  FF        .db $FF
  $B2D2  FF        .db $FF
  $B2D3  FE FD FB  INC $FBFD,X
  $B2D6  FB        .db $FB
  $B2D7  36 00     ROL $00,X
  $B2D9  00        BRK
  $B2DA  00        BRK
  $B2DB  00        BRK
  $B2DC  01 03     ORA ($03,X)
  $B2DE  03        .db $03
  $B2DF  06 60     ASL $60
  $B2E1  20 8E 07  JSR $078E
  $B2E4  C3        .db $C3
  $B2E5  E1 60     SBC ($60,X)
  $B2E7  30 00     BMI $B2E9

L_B2E9:
  $B2E9  00        BRK
  $B2EA  00        BRK
  $B2EB  00        BRK
  $B2EC  C0 E0     CPY #$E0
  $B2EE  20 10 00  JSR $0010
  $B2F1  00        BRK
  $B2F2  00        BRK
  $B2F3  80        .db $80
  $B2F4  E0 E0     CPX #$E0
  $B2F6  F0 F0     BEQ $B2E8
  $B2F8  00        BRK
  $B2F9  00        BRK
  $B2FA  00        BRK
  $B2FB  80        .db $80
  $B2FC  60        RTS
  $B2FD  20 37 13  JSR $1337
  $B300  00        BRK
  $B301  00        BRK
  $B302  00        BRK
  $B303  00        BRK
  $B304  00        BRK
  $B305  00        BRK
  $B306  00        BRK
  $B307  00        BRK
  $B308  00        BRK
  $B309  00        BRK
  $B30A  00        BRK
  $B30B  00        BRK
  $B30C  00        BRK
  $B30D  00        BRK
  $B30E  80        .db $80
  $B30F  F0 00     BEQ $B311

L_B311:
  $B311  00        BRK
  $B312  00        BRK
  $B313  00        BRK
  $B314  00        BRK
  $B315  00        BRK
  $B316  00        BRK
  $B317  00        BRK
  $B318  00        BRK
  $B319  00        BRK
  $B31A  00        BRK
  $B31B  00        BRK
  $B31C  00        BRK
  $B31D  00        BRK
  $B31E  00        BRK
  $B31F  00        BRK
  $B320  03        .db $03
  $B321  07        .db $07
  $B322  07        .db $07
  $B323  0F        .db $0F
  $B324  0F        .db $0F
  $B325  1F        .db $1F
  $B326  1F        .db $1F
  $B327  3F        .db $3F
  $B328  03        .db $03
  $B329  07        .db $07

L_B32A:
  $B32A  07        .db $07
  $B32B  0F        .db $0F

L_B32C:
  $B32C  0F        .db $0F
  $B32D  1F        .db $1F

L_B32E:
  $B32E  1F        .db $1F
  $B32F  3F        .db $3F
  $B330  C0 C0     CPY #$C0
  $B332  C0 C0     CPY #$C0
  $B334  80        .db $80
  $B335  80        .db $80
  $B336  80        .db $80
  $B337  80        .db $80
  $B338  F0 F0     BEQ $B32A
  $B33A  F0 F0     BEQ $B32C
  $B33C  F0 F0     BEQ $B32E
  $B33E  F8        SED
  $B33F  F8        SED
  $B340  6F        .db $6F
  $B341  4F        .db $4F
  $B342  4F        .db $4F
  $B343  FF        .db $FF
  $B344  7E 7F 3F  ROR $3F7F,X
  $B347  3E 07 07  ROL $0707,X
  $B34A  07        .db $07
  $B34B  03        .db $03
  $B34C  80        .db $80
  $B34D  80        .db $80
  $B34E  C0 C0     CPY #$C0
  $B350  D1 D6     CMP ($D6),Y
  $B352  A4 A8     LDY $A8
  $B354  59 F3 E7  EOR $E7F3,Y
  $B357  E7        .db $E7
  $B358  CE C8 98  DEC $98C8
  $B35B  90 21     BCC $B37E
  $B35D  03        .db $03
  $B35E  07        .db $07
  $B35F  07        .db $07
  $B360  0E 3F 7F  ASL $7F3F
  $B363  FF        .db $FF
  $B364  FF        .db $FF
  $B365  FF        .db $FF
  $B366  FF        .db $FF
  $B367  FE 0E 3F  INC $3F0E,X
  $B36A  7F        .db $7F
  $B36B  FF        .db $FF
  $B36C  FF        .db $FF
  $B36D  FF        .db $FF
  $B36E  FF        .db $FF
  $B36F  FE 16 16  INC $1616,X
  $B372  86 A6     STX $A6
  $B374  B6 73     LDX $73,Y
  $B376  6B        .db $6B
  $B377  ED 06 06  SBC $0606
  $B37A  86 86     STX $86
  $B37C  86 03     STX $03

L_B37E:
  $B37E  03        .db $03
  $B37F  01 30     ORA ($30,X)
  $B381  30 30     BMI $B3B3
  $B383  31 31     AND ($31),Y
  $B385  61 E3     ADC ($E3,X)
  $B387  C3        .db $C3
  $B388  10 10     BPL $B39A
  $B38A  10 10     BPL $B39C
  $B38C  10 20     BPL $B3AE
  $B38E  E0 C0     CPX #$C0
  $B390  F8        SED
  $B391  F8        SED
  $B392  FC        .db $FC
  $B393  FC        .db $FC
  $B394  FC        .db $FC
  $B395  FC        .db $FC
  $B396  FC        .db $FC
  $B397  F8        SED
  $B398  19 18 1C  ORA $1C18,Y
  $B39B  1C        .db $1C

L_B39C:
  $B39C  1C        .db $1C
  $B39D  3C        .db $3C
  $B39E  3C        .db $3C
  $B39F  39 00 00  AND $0000,Y
  $B3A2  00        BRK
  $B3A3  20 00 00  JSR $0000
  $B3A6  01 83     ORA ($83,X)
  $B3A8  FE FF FF  INC $FFFF,X
  $B3AB  CE CC FC  DEC $FCCC

L_B3AE:
  $B3AE  F9 33 00  SBC $0033,Y
  $B3B1  00        BRK
  $B3B2  06 1E     ASL $1E
  $B3B4  7F        .db $7F
  $B3B5  FF        .db $FF
  $B3B6  FF        .db $FF
  $B3B7  FF        .db $FF
  $B3B8  00        BRK
  $B3B9  80        .db $80
  $B3BA  C6 1E     DEC $1E
  $B3BC  71 C0     ADC ($C0),Y
  $B3BE  80        .db $80
  $B3BF  80        .db $80
  $B3C0  3F        .db $3F
  $B3C1  1F        .db $1F
  $B3C2  8F        .db $8F
  $B3C3  86 40     STX $40

L_B3C5:
  $B3C5  A0 D8     LDY #$D8
  $B3C7  E0 3F     CPX #$3F
  $B3C9  3F        .db $3F
  $B3CA  BF        .db $BF
  $B3CB  DF        .db $DF
  $B3CC  67        .db $67
  $B3CD  B0 DF     BCS $B3AE
  $B3CF  E7        .db $E7
  $B3D0  00        BRK
  $B3D1  00        BRK
  $B3D2  00        BRK
  $B3D3  00        BRK
  $B3D4  00        BRK
  $B3D5  00        BRK
  $B3D6  00        BRK
  $B3D7  00        BRK
  $B3D8  F8        SED
  $B3D9  F8        SED
  $B3DA  F8        SED
  $B3DB  F0 E8     BEQ $B3C5
  $B3DD  1C        .db $1C
  $B3DE  FA        .db $FA
  $B3DF  F6 00     INC $00,X
  $B3E1  00        BRK
  $B3E2  00        BRK
  $B3E3  00        BRK
  $B3E4  00        BRK
  $B3E5  06 07     ASL $07
  $B3E7  07        .db $07
  $B3E8  00        BRK
  $B3E9  00        BRK
  $B3EA  00        BRK
  $B3EB  00        BRK
  $B3EC  00        BRK
  $B3ED  06 07     ASL $07
  $B3EF  07        .db $07
  $B3F0  00        BRK
  $B3F1  00        BRK
  $B3F2  00        BRK
  $B3F3  00        BRK
  $B3F4  00        BRK
  $B3F5  00        BRK
  $B3F6  00        BRK
  $B3F7  C0 00     CPY #$00
  $B3F9  00        BRK
  $B3FA  00        BRK
  $B3FB  00        BRK
  $B3FC  00        BRK
  $B3FD  00        BRK
  $B3FE  00        BRK
  $B3FF  C0 0E     CPY #$0E
  $B401  02        .db $02
  $B402  00        BRK
  $B403  38        SEC
  $B404  3C        .db $3C
  $B405  3E 38 18  ROL $1838,X
  $B408  70 44     BVS $B44E
  $B40A  02        .db $02
  $B40B  38        SEC
  $B40C  3C        .db $3C
  $B40D  3E 38 18  ROL $1838,X
  $B410  CF        .db $CF
  $B411  CF        .db $CF

L_B412:
  $B412  0F        .db $0F
  $B413  1F        .db $1F
  $B414  11 10     ORA ($10),Y
  $B416  10 40     BPL $B458
  $B418  0F        .db $0F
  $B419  0F        .db $0F
  $B41A  0F        .db $0F
  $B41B  1F        .db $1F
  $B41C  11 10     ORA ($10),Y
  $B41E  10 00     BPL $B420

L_B420:
  $B420  FE FD FD  INC $FDFD,X
  $B423  FB        .db $FB
  $B424  F7        .db $F7
  $B425  EA        NOP
  $B426  D0 20     BNE $B448
  $B428  FE FC FC  INC $FCFC,X
  $B42B  F8        SED
  $B42C  F0 E4     BEQ $B412
  $B42E  CC 18 C0  CPY $C018
  $B431  C0 80     CPY #$80
  $B433  80        .db $80
  $B434  00        BRK
  $B435  00        BRK
  $B436  00        BRK
  $B437  00        BRK
  $B438  00        BRK
  $B439  00        BRK
  $B43A  00        BRK
  $B43B  00        BRK
  $B43C  00        BRK
  $B43D  00        BRK
  $B43E  00        BRK
  $B43F  00        BRK
  $B440  07        .db $07
  $B441  07        .db $07
  $B442  0F        .db $0F
  $B443  0F        .db $0F
  $B444  1F        .db $1F
  $B445  1F        .db $1F

L_B446:
  $B446  3F        .db $3F
  $B447  3F        .db $3F

L_B448:
  $B448  00        BRK
  $B449  00        BRK
  $B44A  00        BRK
  $B44B  01 01     ORA ($01,X)
  $B44D  03        .db $03

L_B44E:
  $B44E  03        .db $03
  $B44F  07        .db $07
  $B450  F8        SED
  $B451  F8        SED
  $B452  F0 F2     BEQ $B446
  $B454  E0 C0     CPX #$C0
  $B456  80        .db $80
  $B457  00        BRK

L_B458:
  $B458  79 FB F2  ADC $F2FB,Y
  $B45B  F4        .db $F4
  $B45C  E4 CF     CPX $CF
  $B45E  8F        .db $8F
  $B45F  1F        .db $1F
  $B460  07        .db $07
  $B461  07        .db $07
  $B462  2F        .db $2F
  $B463  0F        .db $0F
  $B464  5F        .db $5F
  $B465  1F        .db $1F
  $B466  3F        .db $3F
  $B467  3F        .db $3F
  $B468  07        .db $07
  $B469  06 2E     ASL $2E
  $B46B  0C        .db $0C
  $B46C  5C        .db $5C
  $B46D  1C        .db $1C
  $B46E  3C        .db $3C
  $B46F  3F        .db $3F
  $B470  FF        .db $FF
  $B471  FF        .db $FF
  $B472  FF        .db $FF
  $B473  FF        .db $FF
  $B474  FF        .db $FF
  $B475  FF        .db $FF
  $B476  FF        .db $FF
  $B477  FF        .db $FF
  $B478  01 07     ORA ($07,X)
  $B47A  0F        .db $0F
  $B47B  1F        .db $1F
  $B47C  3F        .db $3F
  $B47D  7F        .db $7F
  $B47E  FF        .db $FF
  $B47F  FF        .db $FF
  $B480  F8        SED
  $B481  FC        .db $FC
  $B482  FC        .db $FC
  $B483  FC        .db $FC
  $B484  FC        .db $FC
  $B485  F8        SED
  $B486  F8        SED
  $B487  F8        SED
  $B488  F8        SED
  $B489  FF        .db $FF
  $B48A  FF        .db $FF
  $B48B  FF        .db $FF
  $B48C  FF        .db $FF
  $B48D  FF        .db $FF
  $B48E  FF        .db $FF
  $B48F  FF        .db $FF
  $B490  00        BRK
  $B491  C0 E0     CPY #$E0
  $B493  E0 E0     CPX #$E0
  $B495  C0 00     CPY #$00
  $B497  00        BRK
  $B498  0F        .db $0F
  $B499  FF        .db $FF
  $B49A  FF        .db $FF
  $B49B  FF        .db $FF
  $B49C  FF        .db $FF
  $B49D  FF        .db $FF
  $B49E  FF        .db $FF
  $B49F  FF        .db $FF
  $B4A0  00        BRK
  $B4A1  00        BRK
  $B4A2  00        BRK
  $B4A3  00        BRK
  $B4A4  00        BRK
  $B4A5  00        BRK
  $B4A6  00        BRK
  $B4A7  00        BRK
  $B4A8  00        BRK
  $B4A9  00        BRK
  $B4AA  80        .db $80
  $B4AB  80        .db $80
  $B4AC  C0 C0     CPY #$C0
  $B4AE  C0 C0     CPY #$C0
  $B4B0  03        .db $03
  $B4B1  03        .db $03
  $B4B2  03        .db $03
  $B4B3  03        .db $03
  $B4B4  01 01     ORA ($01,X)
  $B4B6  01 01     ORA ($01,X)
  $B4B8  03        .db $03
  $B4B9  03        .db $03
  $B4BA  03        .db $03
  $B4BB  03        .db $03
  $B4BC  01 01     ORA ($01,X)

L_B4BE:
  $B4BE  01 01     ORA ($01,X)
  $B4C0  F0 FC     BEQ $B4BE
  $B4C2  FE F9 F6  INC $F6F9,X
  $B4C5  E8        INX
  $B4C6  DC        .db $DC
  $B4C7  BE F0 FC  LDX $FCF0,Y
  $B4CA  FE F8 F0  INC $F0F8,X
  $B4CD  E0 C4     CPX #$C4
  $B4CF  8E 18 0C  STX $0C18
  $B4D2  00        BRK
  $B4D3  C3        .db $C3
  $B4D4  00        BRK

L_B4D5:
  $B4D5  00        BRK
  $B4D6  00        BRK
  $B4D7  00        BRK
  $B4D8  18        CLC
  $B4D9  0C        .db $0C
  $B4DA  00        BRK
  $B4DB  1C        .db $1C
  $B4DC  1F        .db $1F
  $B4DD  0F        .db $0F
  $B4DE  03        .db $03
  $B4DF  00        BRK
  $B4E0  70 5F     BVS $B541
  $B4E2  8E 00 01  STX $0100
  $B4E5  04        .db $04
  $B4E6  10 00     BPL $B4E8

L_B4E8:
  $B4E8  00        BRK
  $B4E9  20 71 FF  JSR $FF71
  $B4EC  FE F8 E0  INC $E0F8,X
  $B4EF  00        BRK
  $B4F0  C0 80     CPY #$80
  $B4F2  00        BRK
  $B4F3  00        BRK
  $B4F4  00        BRK
  $B4F5  00        BRK
  $B4F6  00        BRK
  $B4F7  00        BRK
  $B4F8  30 60     BMI $B55A
  $B4FA  C0 80     CPY #$80
  $B4FC  00        BRK
  $B4FD  00        BRK
  $B4FE  00        BRK
  $B4FF  00        BRK
  $B500  00        BRK
  $B501  00        BRK
  $B502  01 03     ORA ($03,X)
  $B504  07        .db $07
  $B505  00        BRK
  $B506  03        .db $03
  $B507  0F        .db $0F
  $B508  00        BRK
  $B509  00        BRK
  $B50A  00        BRK
  $B50B  00        BRK
  $B50C  01 00     ORA ($00,X)
  $B50E  00        BRK
  $B50F  00        BRK
  $B510  7E FC F8  ROR $F8FC,X
  $B513  F0 C0     BEQ $B4D5
  $B515  03        .db $03
  $B516  C7        .db $C7
  $B517  F7        .db $F7
  $B518  0E 1C 38  ASL $381C
  $B51B  F1 C0     SBC ($C0),Y
  $B51D  00        BRK
  $B51E  00        BRK
  $B51F  00        BRK
  $B520  00        BRK
  $B521  00        BRK
  $B522  00        BRK
  $B523  00        BRK
  $B524  00        BRK
  $B525  E0 F0     CPX #$F0
  $B527  F8        SED
  $B528  3E 7E FC  ROL $FC7E,X
  $B52B  FC        .db $FC
  $B52C  18        CLC
  $B52D  00        BRK
  $B52E  00        BRK
  $B52F  00        BRK
  $B530  1F        .db $1F
  $B531  1F        .db $1F
  $B532  1F        .db $1F
  $B533  0F        .db $0F
  $B534  0F        .db $0F
  $B535  07        .db $07
  $B536  03        .db $03
  $B537  01 3F     ORA ($3F,X)
  $B539  7F        .db $7F
  $B53A  7F        .db $7F
  $B53B  7F        .db $7F
  $B53C  FF        .db $FF
  $B53D  FF        .db $FF
  $B53E  FF        .db $FF
  $B53F  FF        .db $FF
  $B540  FF        .db $FF

L_B541:
  $B541  FF        .db $FF
  $B542  FF        .db $FF

L_B543:
  $B543  FF        .db $FF
  $B544  FF        .db $FF
  $B545  FF        .db $FF
  $B546  FF        .db $FF
  $B547  FE FF FF  INC $FFFF,X
  $B54A  FF        .db $FF
  $B54B  FF        .db $FF
  $B54C  FF        .db $FF
  $B54D  FF        .db $FF
  $B54E  FF        .db $FF
  $B54F  FF        .db $FF
  $B550  F8        SED
  $B551  F0 F0     BEQ $B543
  $B553  E0 C0     CPX #$C0
  $B555  80        .db $80
  $B556  00        BRK
  $B557  03        .db $03
  $B558  FF        .db $FF
  $B559  FF        .db $FF

L_B55A:
  $B55A  FF        .db $FF
  $B55B  FF        .db $FF
  $B55C  FF        .db $FF
  $B55D  FF        .db $FF
  $B55E  FC        .db $FC
  $B55F  F3        .db $F3
  $B560  00        BRK
  $B561  00        BRK
  $B562  00        BRK
  $B563  00        BRK
  $B564  00        BRK
  $B565  00        BRK
  $B566  FE FF FF  INC $FFFF,X
  $B569  FF        .db $FF
  $B56A  FF        .db $FF
  $B56B  FF        .db $FF
  $B56C  FF        .db $FF
  $B56D  01 FE     ORA ($FE,X)
  $B56F  FF        .db $FF
  $B570  1E 1E 1E  ASL $1E1E,X
  $B573  1C        .db $1C
  $B574  19 01 00  ORA $0001,Y

L_B577:
  $B577  00        BRK
  $B578  C1 C3     CMP ($C3,X)
  $B57A  D7        .db $D7
  $B57B  DF        .db $DF
  $B57C  9F        .db $9F
  $B57D  9F        .db $9F
  $B57E  01 00     ORA ($00,X)
  $B580  80        .db $80
  $B581  E0 F0     CPX #$F0
  $B583  F0 F2     BEQ $B577
  $B585  F3        .db $F3
  $B586  67        .db $67
  $B587  0F        .db $0F
  $B588  00        BRK
  $B589  00        BRK
  $B58A  00        BRK
  $B58B  1C        .db $1C
  $B58C  BC FC F8  LDY $F8FC,X
  $B58F  7C        .db $7C
  $B590  00        BRK
  $B591  00        BRK
  $B592  00        BRK
  $B593  00        BRK
  $B594  00        BRK
  $B595  00        BRK
  $B596  00        BRK
  $B597  00        BRK
  $B598  00        BRK
  $B599  00        BRK
  $B59A  00        BRK
  $B59B  00        BRK
  $B59C  00        BRK
  $B59D  00        BRK
  $B59E  80        .db $80
  $B59F  C0 BF     CPY #$BF
  $B5A1  7F        .db $7F
  $B5A2  7E FE FE  ROR $FEFE,X
  $B5A5  FC        .db $FC
  $B5A6  FC        .db $FC
  $B5A7  F8        SED
  $B5A8  9F        .db $9F
  $B5A9  1F        .db $1F
  $B5AA  0E 0E 1E  ASL $1E0E
  $B5AD  3C        .db $3C
  $B5AE  7C        .db $7C
  $B5AF  78        SEI
  $B5B0  00        BRK
  $B5B1  00        BRK
  $B5B2  00        BRK
  $B5B3  00        BRK
  $B5B4  00        BRK
  $B5B5  00        BRK
  $B5B6  00        BRK
  $B5B7  00        BRK
  $B5B8  00        BRK
  $B5B9  00        BRK
  $B5BA  00        BRK
  $B5BB  00        BRK
  $B5BC  00        BRK
  $B5BD  00        BRK
  $B5BE  00        BRK
  $B5BF  00        BRK

L_B5C0:
  $B5C0  00        BRK
  $B5C1  00        BRK
  $B5C2  00        BRK
  $B5C3  00        BRK
  $B5C4  00        BRK
  $B5C5  00        BRK
  $B5C6  00        BRK
  $B5C7  00        BRK
  $B5C8  00        BRK
  $B5C9  00        BRK
  $B5CA  00        BRK
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
  $B5D8  00        BRK
  $B5D9  00        BRK
  $B5DA  00        BRK
  $B5DB  00        BRK
  $B5DC  00        BRK
  $B5DD  00        BRK
  $B5DE  00        BRK
  $B5DF  00        BRK
  $B5E0  1E 38 30  ASL $3038,X
  $B5E3  71 63     ADC ($63),Y
  $B5E5  67        .db $67
  $B5E6  2F        .db $2F
  $B5E7  3E 01 07  ROL $0701,X
  $B5EA  0F        .db $0F
  $B5EB  0E 1C 18  ASL $181C
  $B5EE  10 01     BPL $B5F1
  $B5F0  39 0C 07  AND $070C,Y
  $B5F3  F7        .db $F7
  $B5F4  FF        .db $FF
  $B5F5  9F        .db $9F
  $B5F6  0F        .db $0F
  $B5F7  3F        .db $3F
  $B5F8  C0 F0     CPY #$F0
  $B5FA  F8        SED
  $B5FB  08        PHP
  $B5FC  00        BRK
  $B5FD  60        RTS
  $B5FE  F0 C0     BEQ $B5C0
  $B600  FC        .db $FC
  $B601  FE FE FF  INC $FFFE,X
  $B604  FF        .db $FF
  $B605  FF        .db $FF
  $B606  FF        .db $FF
  $B607  FF        .db $FF
  $B608  00        BRK
  $B609  00        BRK
  $B60A  00        BRK
  $B60B  00        BRK
  $B60C  00        BRK
  $B60D  00        BRK
  $B60E  00        BRK
  $B60F  00        BRK
  $B610  00        BRK
  $B611  00        BRK
  $B612  00        BRK
  $B613  3C        .db $3C
  $B614  1F        .db $1F
  $B615  8F        .db $8F
  $B616  8F        .db $8F
  $B617  87        .db $87
  $B618  FF        .db $FF
  $B619  FF        .db $FF
  $B61A  03        .db $03
  $B61B  7C        .db $7C
  $B61C  3F        .db $3F
  $B61D  3F        .db $3F
  $B61E  1F        .db $1F
  $B61F  1F        .db $1F
  $B620  38        SEC
  $B621  00        BRK
  $B622  00        BRK
  $B623  00        BRK
  $B624  C1 F9     CMP ($F9,X)
  $B626  FE FE FF  INC $FFFE,X
  $B629  FF        .db $FF
  $B62A  FF        .db $FF
  $B62B  3E C5 F9  ROL $F9C5,X
  $B62E  FE FF 0E  INC $0EFF,X
  $B631  39 67 DF  AND $DF67,Y
  $B634  BF        .db $BF
  $B635  7F        .db $7F
  $B636  FF        .db $FF
  $B637  3F        .db $3F
  $B638  CE B8 60  DEC $60B8
  $B63B  C0 80     CPY #$80
  $B63D  00        BRK
  $B63E  00        BRK
  $B63F  00        BRK
  $B640  01 FF     ORA ($FF,X)
  $B642  FF        .db $FF
  $B643  FF        .db $FF
  $B644  FF        .db $FF
  $B645  FF        .db $FF
  $B646  FF        .db $FF
  $B647  FF        .db $FF
  $B648  01 00     ORA ($00,X)
  $B64A  00        BRK
  $B64B  00        BRK
  $B64C  00        BRK
  $B64D  00        BRK
  $B64E  00        BRK
  $B64F  00        BRK
  $B650  00        BRK
  $B651  00        BRK
  $B652  80        .db $80
  $B653  80        .db $80
  $B654  C0 C0     CPY #$C0
  $B656  C0 E0     CPY #$E0
  $B658  00        BRK
  $B659  00        BRK
  $B65A  00        BRK
  $B65B  00        BRK
  $B65C  00        BRK
  $B65D  00        BRK
  $B65E  00        BRK
  $B65F  00        BRK
  $B660  1F        .db $1F
  $B661  0E 01 07  ASL $0701
  $B664  07        .db $07
  $B665  07        .db $07
  $B666  03        .db $03
  $B667  00        BRK
  $B668  3F        .db $3F
  $B669  1F        .db $1F
  $B66A  0E 0C 0E  ASL $0E0C
  $B66D  0F        .db $0F
  $B66E  0F        .db $0F
  $B66F  0F        .db $0F
  $B670  00        BRK
  $B671  40        RTI
  $B672  E0 E0     CPX #$E0
  $B674  E0 C0     CPX #$C0
  $B676  00        BRK
  $B677  40        RTI
  $B678  C0 A0     CPY #$A0
  $B67A  00        BRK
  $B67B  00        BRK
  $B67C  00        BRK
  $B67D  A0 E0     LDY #$E0
  $B67F  A0 F8     LDY #$F8
  $B681  F8        SED
  $B682  F8        SED
  $B683  F8        SED
  $B684  FC        .db $FC
  $B685  7C        .db $7C
  $B686  7E 7F F8  ROR $F87F,X
  $B689  F8        SED
  $B68A  F8        SED
  $B68B  F8        SED
  $B68C  FC        .db $FC
  $B68D  7C        .db $7C
  $B68E  7E 7F 00  ROR $007F,X
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
  $B6B0  01 01     ORA ($01,X)
  $B6B2  03        .db $03
  $B6B3  02        .db $02
  $B6B4  02        .db $02
  $B6B5  03        .db $03
  $B6B6  01 01     ORA ($01,X)
  $B6B8  00        BRK
  $B6B9  00        BRK
  $B6BA  00        BRK
  $B6BB  01 01     ORA ($01,X)
  $B6BD  00        BRK
  $B6BE  00        BRK
  $B6BF  00        BRK
  $B6C0  9C        .db $9C
  $B6C1  DC        .db $DC
  $B6C2  7C        .db $7C
  $B6C3  7C        .db $7C
  $B6C4  7D 7D 3D  ADC $3D7D,X
  $B6C7  BD 03 03  LDA $0303,X
  $B6CA  83        .db $83
  $B6CB  83        .db $83
  $B6CC  82        .db $82
  $B6CD  82        .db $82
  $B6CE  C2        .db $C2
  $B6CF  42        .db $42
  $B6D0  3F        .db $3F
  $B6D1  7F        .db $7F
  $B6D2  FF        .db $FF
  $B6D3  FF        .db $FF
  $B6D4  FF        .db $FF
  $B6D5  FF        .db $FF
  $B6D6  FF        .db $FF
  $B6D7  FF        .db $FF
  $B6D8  C0 80     CPY #$80
  $B6DA  00        BRK
  $B6DB  00        BRK
  $B6DC  00        BRK
  $B6DD  00        BRK
  $B6DE  00        BRK
  $B6DF  00        BRK
  $B6E0  FF        .db $FF
  $B6E1  FF        .db $FF
  $B6E2  FF        .db $FF
  $B6E3  FF        .db $FF
  $B6E4  FF        .db $FF
  $B6E5  FF        .db $FF
  $B6E6  FF        .db $FF
  $B6E7  FF        .db $FF
  $B6E8  00        BRK
  $B6E9  00        BRK
  $B6EA  00        BRK
  $B6EB  00        BRK
  $B6EC  00        BRK
  $B6ED  00        BRK
  $B6EE  00        BRK
  $B6EF  00        BRK
  $B6F0  87        .db $87
  $B6F1  87        .db $87
  $B6F2  87        .db $87
  $B6F3  87        .db $87
  $B6F4  83        .db $83
  $B6F5  03        .db $03
  $B6F6  01 00     ORA ($00,X)
  $B6F8  1F        .db $1F
  $B6F9  1F        .db $1F
  $B6FA  1F        .db $1F
  $B6FB  1F        .db $1F
  $B6FC  1F        .db $1F
  $B6FD  1F        .db $1F
  $B6FE  1F        .db $1F
  $B6FF  3F        .db $3F
  $B700  FF        .db $FF
  $B701  FF        .db $FF
  $B702  FF        .db $FF
  $B703  FF        .db $FF
  $B704  FF        .db $FF
  $B705  FF        .db $FF
  $B706  FF        .db $FF
  $B707  FF        .db $FF
  $B708  FF        .db $FF
  $B709  FF        .db $FF
  $B70A  FF        .db $FF
  $B70B  FF        .db $FF
  $B70C  FF        .db $FF
  $B70D  FF        .db $FF
  $B70E  FF        .db $FF
  $B70F  FF        .db $FF
  $B710  8F        .db $8F
  $B711  C3        .db $C3
  $B712  F1 F0     SBC ($F0),Y
  $B714  F8        SED
  $B715  FC        .db $FC
  $B716  FE FF C0  INC $C0FF,X
  $B719  F0 FC     BEQ $B717
  $B71B  FE FE FF  INC $FFFE,X
  $B71E  FF        .db $FF
  $B71F  FF        .db $FF
  $B720  FF        .db $FF
  $B721  FF        .db $FF
  $B722  FF        .db $FF
  $B723  FF        .db $FF
  $B724  7F        .db $7F

L_B725:
  $B725  3F        .db $3F
  $B726  1F        .db $1F

L_B727:
  $B727  1F        .db $1F
  $B728  00        BRK
  $B729  00        BRK
  $B72A  00        BRK
  $B72B  00        BRK
  $B72C  00        BRK
  $B72D  00        BRK
  $B72E  80        .db $80
  $B72F  C0 E0     CPY #$E0
  $B731  E0 F0     CPX #$F0
  $B733  F0 F0     BEQ $B725
  $B735  F0 F0     BEQ $B727
  $B737  F0 00     BEQ $B739

L_B739:
  $B739  00        BRK
  $B73A  00        BRK
  $B73B  00        BRK
  $B73C  00        BRK
  $B73D  00        BRK
  $B73E  00        BRK
  $B73F  00        BRK
  $B740  07        .db $07
  $B741  0F        .db $0F
  $B742  0F        .db $0F
  $B743  07        .db $07
  $B744  20 38 7E  JSR $7E38
  $B747  3C        .db $3C
  $B748  0C        .db $0C
  $B749  1C        .db $1C

L_B74A:
  $B74A  1E 3F 7F  ASL $7F3F,X
  $B74D  77        .db $77
  $B74E  F0 FA     BEQ $B74A
  $B750  C0 C0     CPY #$C0
  $B752  80        .db $80
  $B753  00        BRK
  $B754  00        BRK
  $B755  00        BRK
  $B756  00        BRK
  $B757  00        BRK
  $B758  00        BRK
  $B759  00        BRK
  $B75A  40        RTI
  $B75B  80        .db $80
  $B75C  80        .db $80
  $B75D  00        BRK
  $B75E  00        BRK
  $B75F  00        BRK
  $B760  3F        .db $3F
  $B761  3F        .db $3F
  $B762  1F        .db $1F
  $B763  0F        .db $0F
  $B764  07        .db $07
  $B765  03        .db $03
  $B766  00        BRK
  $B767  00        BRK
  $B768  3F        .db $3F
  $B769  3F        .db $3F
  $B76A  1F        .db $1F
  $B76B  0F        .db $0F
  $B76C  07        .db $07
  $B76D  03        .db $03
  $B76E  00        BRK
  $B76F  00        BRK
  $B770  00        BRK
  $B771  80        .db $80
  $B772  80        .db $80
  $B773  80        .db $80
  $B774  80        .db $80
  $B775  81 86     STA ($86,X)
  $B777  0C        .db $0C
  $B778  00        BRK
  $B779  8C 8F 9F  STY $9F8F
  $B77C  9F        .db $9F
  $B77D  BF        .db $BF
  $B77E  BE 3C 00  LDX $003C,Y
  $B781  00        BRK
  $B782  00        BRK
  $B783  03        .db $03
  $B784  3C        .db $3C
  $B785  C0 00     CPY #$00
  $B787  00        BRK
  $B788  00        BRK
  $B789  03        .db $03
  $B78A  0F        .db $0F
  $B78B  FF        .db $FF
  $B78C  FC        .db $FC
  $B78D  C0 00     CPY #$00
  $B78F  00        BRK
  $B790  00        BRK
  $B791  01 01     ORA ($01,X)
  $B793  F1 00     SBC ($00),Y
  $B795  00        BRK
  $B796  00        BRK
  $B797  00        BRK
  $B798  E0 F0     CPX #$F0
  $B79A  F0 F8     BEQ $B794
  $B79C  08        PHP
  $B79D  08        PHP
  $B79E  0C        .db $0C
  $B79F  0E FF 7F  ASL $7FFF
  $B7A2  FF        .db $FF
  $B7A3  FF        .db $FF
  $B7A4  FF        .db $FF
  $B7A5  FF        .db $FF
  $B7A6  7F        .db $7F
  $B7A7  3F        .db $3F
  $B7A8  00        BRK
  $B7A9  00        BRK
  $B7AA  00        BRK
  $B7AB  00        BRK
  $B7AC  00        BRK
  $B7AD  00        BRK
  $B7AE  00        BRK
  $B7AF  00        BRK
  $B7B0  FF        .db $FF
  $B7B1  FF        .db $FF
  $B7B2  FF        .db $FF
  $B7B3  FF        .db $FF
  $B7B4  FF        .db $FF
  $B7B5  FF        .db $FF
  $B7B6  FF        .db $FF
  $B7B7  FF        .db $FF
  $B7B8  00        BRK
  $B7B9  00        BRK
  $B7BA  00        BRK
  $B7BB  00        BRK
  $B7BC  00        BRK
  $B7BD  00        BRK
  $B7BE  00        BRK
  $B7BF  00        BRK
  $B7C0  FE FE FE  INC $FEFE,X
  $B7C3  FC        .db $FC
  $B7C4  FC        .db $FC
  $B7C5  F8        SED
  $B7C6  F8        SED
  $B7C7  F0 00     BEQ $B7C9

L_B7C9:
  $B7C9  00        BRK
  $B7CA  00        BRK
  $B7CB  00        BRK
  $B7CC  00        BRK
  $B7CD  00        BRK
  $B7CE  00        BRK
  $B7CF  01 00     ORA ($00,X)
  $B7D1  00        BRK
  $B7D2  00        BRK
  $B7D3  00        BRK
  $B7D4  00        BRK
  $B7D5  00        BRK
  $B7D6  00        BRK
  $B7D7  01 3F     ORA ($3F,X)
  $B7D9  3F        .db $3F
  $B7DA  7F        .db $7F
  $B7DB  7F        .db $7F
  $B7DC  7F        .db $7F
  $B7DD  FF        .db $FF
  $B7DE  FF        .db $FF
  $B7DF  FF        .db $FF
  $B7E0  1F        .db $1F
  $B7E1  01 01     ORA ($01,X)
  $B7E3  3C        .db $3C
  $B7E4  0E E7 31  ASL $31E7
  $B7E7  85 FF     STA $FF
  $B7E9  FF        .db $FF
  $B7EA  FF        .db $FF
  $B7EB  FF        .db $FF
  $B7EC  FF        .db $FF
  $B7ED  FF        .db $FF
  $B7EE  FF        .db $FF
  $B7EF  FF        .db $FF
  $B7F0  FF        .db $FF
  $B7F1  FF        .db $FF
  $B7F2  FC        .db $FC
  $B7F3  E0 7C     CPX #$7C
  $B7F5  FE FF FE  INC $FEFF,X
  $B7F8  FF        .db $FF
  $B7F9  FF        .db $FF
  $B7FA  FF        .db $FF
  $B7FB  FF        .db $FF
  $B7FC  FF        .db $FF
  $B7FD  FF        .db $FF
  $B7FE  FF        .db $FF
  $B7FF  FF        .db $FF
  $B800  0F        .db $0F
  $B801  87        .db $87

L_B802:
  $B802  07        .db $07
  $B803  03        .db $03

L_B804:
  $B804  03        .db $03

L_B805:
  $B805  81 81     STA ($81,X)
  $B807  01 C0     ORA ($C0,X)
  $B809  E0 F0     CPX #$F0
  $B80B  F0 F8     BEQ $B805
  $B80D  F8        SED
  $B80E  F8        SED
  $B80F  FC        .db $FC
  $B810  F0 F0     BEQ $B802
  $B812  F0 F0     BEQ $B804
  $B814  F0 E0     BEQ $B7F6
  $B816  E0 E0     CPX #$E0
  $B818  07        .db $07
  $B819  07        .db $07
  $B81A  07        .db $07
  $B81B  07        .db $07
  $B81C  07        .db $07
  $B81D  0F        .db $0F
  $B81E  0F        .db $0F
  $B81F  0F        .db $0F
  $B820  00        BRK
  $B821  00        BRK
  $B822  00        BRK
  $B823  31 36     AND ($36),Y
  $B825  76 71     ROR $71,X
  $B827  17        .db $17
  $B828  00        BRK
  $B829  FF        .db $FF
  $B82A  FF        .db $FF
  $B82B  71 76     ADC ($76),Y
  $B82D  76 71     ROR $71,X
  $B82F  17        .db $17
  $B830  00        BRK
  $B831  00        BRK
  $B832  00        BRK
  $B833  DF        .db $DF
  $B834  84 D7     STY $D7
  $B836  D7        .db $D7
  $B837  D4        .db $D4
  $B838  FF        .db $FF
  $B839  FF        .db $FF
  $B83A  F3        .db $F3
  $B83B  DF        .db $DF

L_B83C:
  $B83C  84 D7     STY $D7
  $B83E  D7        .db $D7
  $B83F  D4        .db $D4
  $B840  00        BRK
  $B841  00        BRK
  $B842  00        BRK
  $B843  C0 20     CPY #$20
  $B845  B0 78     BCS $B8BF
  $B847  B8        CLV
  $B848  C0 E0     CPY #$E0
  $B84A  F0 F0     BEQ $B83C
  $B84C  38        SEC
  $B84D  B8        CLV
  $B84E  7C        .db $7C
  $B84F  BC 0C 18  LDY $180C,X
  $B852  18        CLC
  $B853  18        CLC
  $B854  18        CLC
  $B855  18        CLC
  $B856  18        CLC
  $B857  18        CLC
  $B858  7C        .db $7C
  $B859  78        SEI
  $B85A  78        SEI
  $B85B  F8        SED
  $B85C  F8        SED
  $B85D  F8        SED
  $B85E  F8        SED
  $B85F  F8        SED
  $B860  00        BRK
  $B861  00        BRK
  $B862  00        BRK
  $B863  00        BRK
  $B864  00        BRK
  $B865  00        BRK
  $B866  00        BRK
  $B867  00        BRK
  $B868  00        BRK
  $B869  00        BRK
  $B86A  00        BRK
  $B86B  00        BRK
  $B86C  00        BRK
  $B86D  00        BRK
  $B86E  00        BRK
  $B86F  00        BRK
  $B870  00        BRK
  $B871  00        BRK
  $B872  00        BRK
  $B873  00        BRK
  $B874  00        BRK
  $B875  00        BRK
  $B876  00        BRK
  $B877  00        BRK
  $B878  0F        .db $0F
  $B879  0F        .db $0F
  $B87A  0F        .db $0F
  $B87B  07        .db $07
  $B87C  07        .db $07
  $B87D  07        .db $07
  $B87E  07        .db $07
  $B87F  03        .db $03
  $B880  1F        .db $1F
  $B881  0F        .db $0F
  $B882  03        .db $03
  $B883  00        BRK
  $B884  00        BRK
  $B885  00        BRK
  $B886  00        BRK
  $B887  00        BRK
  $B888  00        BRK
  $B889  00        BRK
  $B88A  80        .db $80

L_B88B:
  $B88B  C0 E0     CPY #$E0
  $B88D  F0 FC     BEQ $B88B
  $B88F  FF        .db $FF
  $B890  FF        .db $FF
  $B891  FF        .db $FF
  $B892  FF        .db $FF
  $B893  7E 00 00  ROR $0000,X
  $B896  00        BRK
  $B897  00        BRK
  $B898  00        BRK
  $B899  00        BRK
  $B89A  00        BRK
  $B89B  00        BRK
  $B89C  00        BRK
  $B89D  00        BRK
  $B89E  00        BRK
  $B89F  00        BRK
  $B8A0  E0 C0     CPX #$C0
  $B8A2  80        .db $80
  $B8A3  00        BRK
  $B8A4  03        .db $03
  $B8A5  7F        .db $7F
  $B8A6  7F        .db $7F
  $B8A7  7F        .db $7F
  $B8A8  01 03     ORA ($03,X)
  $B8AA  07        .db $07
  $B8AB  0F        .db $0F
  $B8AC  3F        .db $3F
  $B8AD  7F        .db $7F
  $B8AE  7F        .db $7F
  $B8AF  7F        .db $7F
  $B8B0  00        BRK
  $B8B1  00        BRK
  $B8B2  00        BRK
  $B8B3  01 03     ORA ($03,X)
  $B8B5  01 00     ORA ($00,X)
  $B8B7  80        .db $80
  $B8B8  F3        .db $F3
  $B8B9  E0 E0     CPX #$E0
  $B8BB  C0 C0     CPY #$C0
  $B8BD  80        .db $80
  $B8BE  80        .db $80

L_B8BF:
  $B8BF  E0 FC     CPX #$FC
  $B8C1  7E 0F 01  ROR $010F,X
  $B8C4  C0 F0     CPY #$F0
  $B8C6  7C        .db $7C
  $B8C7  1E FF FF  ASL $FFFF,X
  $B8CA  7F        .db $7F
  $B8CB  1F        .db $1F
  $B8CC  07        .db $07
  $B8CD  01 00     ORA ($00,X)
  $B8CF  00        BRK
  $B8D0  F0 00     BEQ $B8D2

L_B8D2:
  $B8D2  80        .db $80
  $B8D3  FC        .db $FC
  $B8D4  8A        TXA
  $B8D5  00        BRK
  $B8D6  00        BRK
  $B8D7  20 FF FF  JSR $FFFF
  $B8DA  FF        .db $FF
  $B8DB  FF        .db $FF
  $B8DC  FF        .db $FF
  $B8DD  FF        .db $FF
  $B8DE  7F        .db $7F

L_B8DF:
  $B8DF  3F        .db $3F
  $B8E0  01 01     ORA ($01,X)
  $B8E2  01 01     ORA ($01,X)
  $B8E4  01 03     ORA ($03,X)
  $B8E6  02        .db $02
  $B8E7  04        .db $04
  $B8E8  FC        .db $FC
  $B8E9  FC        .db $FC
  $B8EA  FC        .db $FC
  $B8EB  F8        SED
  $B8EC  F8        SED
  $B8ED  F0 F0     BEQ $B8DF
  $B8EF  E0 C1     CPX #$C1
  $B8F1  C1 C3     CMP ($C3,X)
  $B8F3  83        .db $83
  $B8F4  07        .db $07
  $B8F5  0F        .db $0F
  $B8F6  1F        .db $1F
  $B8F7  3F        .db $3F
  $B8F8  1F        .db $1F
  $B8F9  1E 1C 3C  ASL $3C1C,X
  $B8FC  78        SEI
  $B8FD  FF        .db $FF
  $B8FE  F0 FF     BEQ $B8FF
  $B900  FF        .db $FF
  $B901  FF        .db $FF
  $B902  FF        .db $FF
  $B903  FF        .db $FF
  $B904  FF        .db $FF
  $B905  FF        .db $FF
  $B906  FF        .db $FF
  $B907  FF        .db $FF
  $B908  FF        .db $FF
  $B909  00        BRK
  $B90A  00        BRK
  $B90B  00        BRK
  $B90C  00        BRK
  $B90D  FF        .db $FF
  $B90E  00        BRK
  $B90F  FF        .db $FF
  $B910  FF        .db $FF
  $B911  FF        .db $FF
  $B912  FF        .db $FF
  $B913  FF        .db $FF
  $B914  FF        .db $FF
  $B915  FF        .db $FF
  $B916  FF        .db $FF
  $B917  FF        .db $FF
  $B918  FF        .db $FF
  $B919  00        BRK
  $B91A  00        BRK
  $B91B  00        BRK
  $B91C  00        BRK
  $B91D  FF        .db $FF
  $B91E  00        BRK
  $B91F  FF        .db $FF
  $B920  F8        SED
  $B921  F8        SED
  $B922  FC        .db $FC
  $B923  FC        .db $FC
  $B924  FC        .db $FC
  $B925  FC        .db $FC
  $B926  FC        .db $FC
  $B927  FC        .db $FC
  $B928  FE 0E 06  INC $060E,X
  $B92B  07        .db $07
  $B92C  07        .db $07
  $B92D  FF        .db $FF
  $B92E  07        .db $07
  $B92F  FF        .db $FF
  $B930  18        CLC
  $B931  0C        .db $0C
  $B932  0C        .db $0C
  $B933  06 06     ASL $06
  $B935  03        .db $03
  $B936  01 00     ORA ($00,X)
  $B938  F8        SED
  $B939  FC        .db $FC
  $B93A  FC        .db $FC
  $B93B  FE 7E 7F  INC $7F7E,X
  $B93E  3F        .db $3F
  $B93F  3F        .db $3F
  $B940  00        BRK
  $B941  00        BRK
  $B942  00        BRK
  $B943  00        BRK
  $B944  00        BRK
  $B945  00        BRK
  $B946  80        .db $80
  $B947  FF        .db $FF
  $B948  00        BRK
  $B949  00        BRK
  $B94A  00        BRK
  $B94B  00        BRK
  $B94C  00        BRK
  $B94D  00        BRK
  $B94E  80        .db $80
  $B94F  FF        .db $FF
  $B950  00        BRK
  $B951  00        BRK
  $B952  00        BRK
  $B953  00        BRK
  $B954  01 07     ORA ($07,X)
  $B956  7F        .db $7F
  $B957  F8        SED
  $B958  03        .db $03
  $B959  03        .db $03
  $B95A  01 00     ORA ($00,X)

L_B95C:
  $B95C  01 07     ORA ($07,X)
  $B95E  7F        .db $7F
  $B95F  FF        .db $FF
  $B960  00        BRK
  $B961  00        BRK
  $B962  00        BRK
  $B963  00        BRK
  $B964  00        BRK
  $B965  00        BRK
  $B966  00        BRK
  $B967  00        BRK
  $B968  FF        .db $FF
  $B969  FF        .db $FF
  $B96A  FF        .db $FF
  $B96B  FF        .db $FF
  $B96C  FF        .db $FF
  $B96D  FF        .db $FF
  $B96E  FC        .db $FC
  $B96F  F0 00     BEQ $B971

L_B971:
  $B971  00        BRK
  $B972  00        BRK
  $B973  03        .db $03
  $B974  07        .db $07
  $B975  0F        .db $0F
  $B976  1F        .db $1F
  $B977  3F        .db $3F
  $B978  F8        SED
  $B979  F8        SED
  $B97A  F0 E0     BEQ $B95C
  $B97C  80        .db $80
  $B97D  00        BRK
  $B97E  00        BRK
  $B97F  00        BRK
  $B980  3F        .db $3F
  $B981  1F        .db $1F
  $B982  0F        .db $0F
  $B983  03        .db $03
  $B984  80        .db $80
  $B985  C0 E0     CPY #$E0
  $B987  E8        INX
  $B988  3F        .db $3F
  $B989  1F        .db $1F
  $B98A  0F        .db $0F
  $B98B  03        .db $03
  $B98C  00        BRK
  $B98D  00        BRK
  $B98E  00        BRK
  $B98F  08        PHP
  $B990  C8        INY
  $B991  F6 F7     INC $F7,X
  $B993  F9 FC 00  SBC $00FC,Y
  $B996  00        BRK
  $B997  00        BRK
  $B998  F8        SED
  $B999  FE FF FF  INC $FFFF,X
  $B99C  FF        .db $FF
  $B99D  3F        .db $3F
  $B99E  03        .db $03
  $B99F  00        BRK
  $B9A0  06 00     ASL $00
  $B9A2  00        BRK
  $B9A3  00        BRK
  $B9A4  00        BRK
  $B9A5  00        BRK
  $B9A6  00        BRK
  $B9A7  00        BRK
  $B9A8  00        BRK
  $B9A9  00        BRK
  $B9AA  80        .db $80
  $B9AB  F0 FF     BEQ $B9AC
  $B9AD  FF        .db $FF
  $B9AE  FE 00 00  INC $0000,X
  $B9B1  00        BRK
  $B9B2  00        BRK
  $B9B3  00        BRK
  $B9B4  00        BRK
  $B9B5  00        BRK
  $B9B6  00        BRK
  $B9B7  00        BRK
  $B9B8  3F        .db $3F
  $B9B9  7F        .db $7F
  $B9BA  7F        .db $7F
  $B9BB  FF        .db $FF
  $B9BC  FC        .db $FC
  $B9BD  E0 00     CPX #$00
  $B9BF  01 00     ORA ($00,X)
  $B9C1  00        BRK
  $B9C2  01 07     ORA ($07,X)
  $B9C4  0F        .db $0F
  $B9C5  1F        .db $1F
  $B9C6  3F        .db $3F

L_B9C7:
  $B9C7  FF        .db $FF
  $B9C8  E1 C3     SBC ($C3,X)
  $B9CA  87        .db $87
  $B9CB  0F        .db $0F
  $B9CC  1F        .db $1F
  $B9CD  3F        .db $3F
  $B9CE  FF        .db $FF
  $B9CF  FF        .db $FF
  $B9D0  FF        .db $FF
  $B9D1  FF        .db $FF
  $B9D2  FF        .db $FF
  $B9D3  FF        .db $FF
  $B9D4  FF        .db $FF
  $B9D5  FF        .db $FF
  $B9D6  FF        .db $FF
  $B9D7  FF        .db $FF
  $B9D8  FF        .db $FF
  $B9D9  00        BRK
  $B9DA  FF        .db $FF
  $B9DB  FF        .db $FF
  $B9DC  FF        .db $FF
  $B9DD  FF        .db $FF
  $B9DE  FF        .db $FF
  $B9DF  FF        .db $FF
  $B9E0  FC        .db $FC
  $B9E1  F8        SED
  $B9E2  F8        SED
  $B9E3  F8        SED
  $B9E4  F8        SED
  $B9E5  F0 E0     BEQ $B9C7
  $B9E7  80        .db $80
  $B9E8  FF        .db $FF
  $B9E9  0F        .db $0F
  $B9EA  FF        .db $FF
  $B9EB  FF        .db $FF
  $B9EC  FF        .db $FF
  $B9ED  FF        .db $FF
  $B9EE  FE FE 00  INC $00FE,X
  $B9F1  00        BRK
  $B9F2  00        BRK
  $B9F3  00        BRK
  $B9F4  00        BRK
  $B9F5  01 00     ORA ($00,X)
  $B9F7  00        BRK
  $B9F8  1F        .db $1F
  $B9F9  0F        .db $0F
  $B9FA  07        .db $07
  $B9FB  01 00     ORA ($00,X)
  $B9FD  00        BRK
  $B9FE  00        BRK
  $B9FF  00        BRK
  $BA00  7F        .db $7F
  $BA01  00        BRK
  $BA02  00        BRK
  $BA03  00        BRK
  $BA04  00        BRK
  $BA05  C0 FF     CPY #$FF
  $BA07  00        BRK
  $BA08  FF        .db $FF
  $BA09  FF        .db $FF
  $BA0A  FF        .db $FF
  $BA0B  FF        .db $FF
  $BA0C  00        BRK
  $BA0D  00        BRK
  $BA0E  00        BRK
  $BA0F  00        BRK
  $BA10  80        .db $80
  $BA11  00        BRK
  $BA12  00        BRK
  $BA13  00        BRK
  $BA14  01 0F     ORA ($0F,X)
  $BA16  FF        .db $FF
  $BA17  00        BRK
  $BA18  FF        .db $FF
  $BA19  FE F0 00  INC $00F0,X
  $BA1C  00        BRK
  $BA1D  00        BRK
  $BA1E  00        BRK
  $BA1F  00        BRK
  $BA20  00        BRK
  $BA21  01 07     ORA ($07,X)
  $BA23  3F        .db $3F
  $BA24  FF        .db $FF
  $BA25  FF        .db $FF
  $BA26  FF        .db $FF
  $BA27  00        BRK
  $BA28  C0 00     CPY #$00
  $BA2A  00        BRK
  $BA2B  00        BRK
  $BA2C  00        BRK
  $BA2D  00        BRK
  $BA2E  00        BRK
  $BA2F  00        BRK
  $BA30  FF        .db $FF
  $BA31  FF        .db $FF
  $BA32  FF        .db $FF
  $BA33  FE FC F8  INC $F8FC,X
  $BA36  F0 00     BEQ $BA38

L_BA38:
  $BA38  00        BRK
  $BA39  00        BRK
  $BA3A  00        BRK
  $BA3B  00        BRK
  $BA3C  00        BRK
  $BA3D  00        BRK
  $BA3E  02        .db $02
  $BA3F  00        BRK
  $BA40  C0 90     CPY #$90
  $BA42  00        BRK
  $BA43  18        CLC
  $BA44  C0 1A     CPY #$1A
  $BA46  00        BRK
  $BA47  00        BRK
  $BA48  02        .db $02
  $BA49  10 01     BPL $BA4C
  $BA4B  00        BRK

L_BA4C:
  $BA4C  C0 02     CPY #$02
  $BA4E  80        .db $80
  $BA4F  00        BRK
  $BA50  00        BRK
  $BA51  00        BRK
  $BA52  10 00     BPL $BA54

L_BA54:
  $BA54  39 02 38  AND $3802,Y
  $BA57  00        BRK
  $BA58  0C        .db $0C
  $BA59  00        BRK
  $BA5A  7A        .db $7A
  $BA5B  00        BRK
  $BA5C  29 82     AND #$82
  $BA5E  A9 00     LDA #$00
  $BA60  00        BRK
  $BA61  00        BRK
  $BA62  98        TYA
  $BA63  90 00     BCC $BA65

L_BA65:
  $BA65  30 20     BMI $BA87
  $BA67  00        BRK
  $BA68  00        BRK
  $BA69  00        BRK
  $BA6A  C6 CA     DEC $CA
  $BA6C  80        .db $80
  $BA6D  0C        .db $0C
  $BA6E  94 00     STY $00,X
  $BA70  00        BRK
  $BA71  1F        .db $1F
  $BA72  1F        .db $1F
  $BA73  00        BRK
  $BA74  00        BRK
  $BA75  00        BRK
  $BA76  00        BRK
  $BA77  00        BRK
  $BA78  07        .db $07
  $BA79  1F        .db $1F
  $BA7A  1F        .db $1F
  $BA7B  3F        .db $3F
  $BA7C  3F        .db $3F
  $BA7D  7F        .db $7F
  $BA7E  FF        .db $FF
  $BA7F  00        BRK
  $BA80  00        BRK
  $BA81  FF        .db $FF
  $BA82  FF        .db $FF
  $BA83  00        BRK
  $BA84  00        BRK
  $BA85  00        BRK
  $BA86  00        BRK

L_BA87:
  $BA87  00        BRK
  $BA88  FF        .db $FF
  $BA89  FF        .db $FF
  $BA8A  FF        .db $FF
  $BA8B  FF        .db $FF
  $BA8C  FF        .db $FF
  $BA8D  FF        .db $FF
  $BA8E  FF        .db $FF
  $BA8F  00        BRK
  $BA90  00        BRK
  $BA91  FF        .db $FF
  $BA92  FF        .db $FF
  $BA93  00        BRK
  $BA94  00        BRK
  $BA95  00        BRK
  $BA96  01 07     ORA ($07,X)
  $BA98  FF        .db $FF
  $BA99  FF        .db $FF
  $BA9A  FF        .db $FF
  $BA9B  FF        .db $FF
  $BA9C  FC        .db $FC
  $BA9D  F1 C7     SBC ($C7),Y
  $BA9F  3F        .db $3F
  $BAA0  01 DC     ORA ($DC,X)
  $BAA2  9F        .db $9F
  $BAA3  3F        .db $3F
  $BAA4  77        .db $77
  $BAA5  E7        .db $E7
  $BAA6  FF        .db $FF
  $BAA7  FF        .db $FF
  $BAA8  E1 DC     SBC ($DC,X)
  $BAAA  BF        .db $BF
  $BAAB  7F        .db $7F
  $BAAC  E7        .db $E7
  $BAAD  E7        .db $E7
  $BAAE  FF        .db $FF
  $BAAF  FF        .db $FF
  $BAB0  00        BRK
  $BAB1  00        BRK
  $BAB2  80        .db $80
  $BAB3  E0 B8     CPX #$B8
  $BAB5  3C        .db $3C
  $BAB6  FE FF FE  INC $FEFF,X
  $BAB9  7C        .db $7C
  $BABA  9C        .db $9C
  $BABB  E0 38     CPX #$38
  $BABD  3C        .db $3C
  $BABE  FE FF 00  INC $00FF,X
  $BAC1  00        BRK
  $BAC2  7F        .db $7F
  $BAC3  00        BRK
  $BAC4  0F        .db $0F
  $BAC5  08        PHP
  $BAC6  08        PHP
  $BAC7  08        PHP
  $BAC8  7F        .db $7F
  $BAC9  FF        .db $FF
  $BACA  FF        .db $FF
  $BACB  7F        .db $7F
  $BACC  3F        .db $3F
  $BACD  1E 1E 1E  ASL $1E1E,X
  $BAD0  00        BRK
  $BAD1  00        BRK
  $BAD2  FF        .db $FF
  $BAD3  00        BRK
  $BAD4  FF        .db $FF
  $BAD5  61 61     ADC ($61,X)
  $BAD7  61 FF     ADC ($FF,X)
  $BAD9  FF        .db $FF
  $BADA  FF        .db $FF
  $BADB  FF        .db $FF
  $BADC  FF        .db $FF
  $BADD  79 79 79  ADC $7979,Y
  $BAE0  00        BRK
  $BAE1  00        BRK
  $BAE2  FF        .db $FF
  $BAE3  00        BRK
  $BAE4  FF        .db $FF
  $BAE5  86 86     STX $86
  $BAE7  86 FF     STX $FF
  $BAE9  FF        .db $FF
  $BAEA  FF        .db $FF
  $BAEB  FF        .db $FF
  $BAEC  FF        .db $FF
  $BAED  E7        .db $E7
  $BAEE  E7        .db $E7
  $BAEF  E7        .db $E7
  $BAF0  00        BRK
  $BAF1  00        BRK
  $BAF2  FF        .db $FF
  $BAF3  00        BRK
  $BAF4  FF        .db $FF
  $BAF5  18        CLC
  $BAF6  18        CLC
  $BAF7  18        CLC
  $BAF8  FF        .db $FF
  $BAF9  FF        .db $FF
  $BAFA  FF        .db $FF
  $BAFB  FF        .db $FF
  $BAFC  FF        .db $FF
  $BAFD  9E        .db $9E
  $BAFE  9E        .db $9E
  $BAFF  9E        .db $9E
  $BB00  00        BRK
  $BB01  00        BRK
  $BB02  80        .db $80
  $BB03  00        BRK
  $BB04  F0 78     BEQ $BB7E
  $BB06  78        SEI
  $BB07  78        SEI
  $BB08  FF        .db $FF
  $BB09  FF        .db $FF
  $BB0A  FF        .db $FF
  $BB0B  FF        .db $FF
  $BB0C  FF        .db $FF
  $BB0D  7F        .db $7F
  $BB0E  7F        .db $7F
  $BB0F  7F        .db $7F
  $BB10  00        BRK
  $BB11  00        BRK
  $BB12  FF        .db $FF
  $BB13  FF        .db $FF
  $BB14  FF        .db $FF
  $BB15  E7        .db $E7
  $BB16  F3        .db $F3
  $BB17  E3        .db $E3
  $BB18  FF        .db $FF
  $BB19  FF        .db $FF
  $BB1A  FF        .db $FF
  $BB1B  FF        .db $FF
  $BB1C  FF        .db $FF
  $BB1D  FF        .db $FF
  $BB1E  E7        .db $E7
  $BB1F  E7        .db $E7
  $BB20  00        BRK
  $BB21  00        BRK
  $BB22  FF        .db $FF
  $BB23  FF        .db $FF
  $BB24  FF        .db $FF
  $BB25  FF        .db $FF
  $BB26  FF        .db $FF
  $BB27  FF        .db $FF
  $BB28  FF        .db $FF
  $BB29  FF        .db $FF
  $BB2A  FF        .db $FF
  $BB2B  FF        .db $FF
  $BB2C  FF        .db $FF
  $BB2D  FF        .db $FF
  $BB2E  FF        .db $FF
  $BB2F  FF        .db $FF
  $BB30  00        BRK
  $BB31  00        BRK
  $BB32  FF        .db $FF
  $BB33  FF        .db $FF
  $BB34  FF        .db $FF
  $BB35  E7        .db $E7
  $BB36  F3        .db $F3
  $BB37  E3        .db $E3
  $BB38  FF        .db $FF
  $BB39  FF        .db $FF
  $BB3A  FF        .db $FF
  $BB3B  FF        .db $FF
  $BB3C  FF        .db $FF
  $BB3D  FF        .db $FF
  $BB3E  E7        .db $E7
  $BB3F  E7        .db $E7
  $BB40  1E 70 C1  ASL $C170,X
  $BB43  8F        .db $8F
  $BB44  3F        .db $3F
  $BB45  7F        .db $7F
  $BB46  3F        .db $3F
  $BB47  0F        .db $0F
  $BB48  FE F1 CF  INC $CFF1,X
  $BB4B  BF        .db $BF
  $BB4C  7E 7F 7F  ROR $7F7F,X
  $BB4F  3F        .db $3F
  $BB50  00        BRK
  $BB51  00        BRK
  $BB52  FF        .db $FF
  $BB53  FF        .db $FF
  $BB54  FF        .db $FF
  $BB55  FF        .db $FF
  $BB56  FF        .db $FF
  $BB57  FF        .db $FF
  $BB58  00        BRK
  $BB59  FF        .db $FF
  $BB5A  FF        .db $FF
  $BB5B  01 03     ORA ($03,X)
  $BB5D  FF        .db $FF
  $BB5E  FF        .db $FF
  $BB5F  FF        .db $FF
  $BB60  00        BRK
  $BB61  00        BRK
  $BB62  FE FE FF  INC $FFFE,X
  $BB65  FF        .db $FF
  $BB66  FF        .db $FF
  $BB67  FF        .db $FF
  $BB68  00        BRK
  $BB69  FE FF FF  INC $FFFF,X
  $BB6C  FF        .db $FF
  $BB6D  FF        .db $FF
  $BB6E  FF        .db $FF
  $BB6F  FF        .db $FF
  $BB70  00        BRK
  $BB71  00        BRK
  $BB72  78        SEI
  $BB73  7C        .db $7C
  $BB74  3E 3E 3F  ROL $3F3E,X
  $BB77  3F        .db $3F
  $BB78  00        BRK
  $BB79  F8        SED
  $BB7A  04        .db $04
  $BB7B  02        .db $02
  $BB7C  81 81     STA ($81,X)

L_BB7E:
  $BB7E  80        .db $80
  $BB7F  80        .db $80
  $BB80  0F        .db $0F
  $BB81  0F        .db $0F
  $BB82  00        BRK
  $BB83  00        BRK
  $BB84  1F        .db $1F
  $BB85  3F        .db $3F
  $BB86  00        BRK
  $BB87  7F        .db $7F
  $BB88  1F        .db $1F
  $BB89  1F        .db $1F
  $BB8A  1F        .db $1F
  $BB8B  00        BRK
  $BB8C  3F        .db $3F
  $BB8D  7F        .db $7F
  $BB8E  7F        .db $7F
  $BB8F  FF        .db $FF
  $BB90  FF        .db $FF
  $BB91  FF        .db $FF
  $BB92  00        BRK
  $BB93  00        BRK
  $BB94  FF        .db $FF
  $BB95  FF        .db $FF
  $BB96  1F        .db $1F
  $BB97  81 FF     STA ($FF,X)
  $BB99  FF        .db $FF
  $BB9A  FF        .db $FF
  $BB9B  00        BRK
  $BB9C  FF        .db $FF
  $BB9D  FF        .db $FF
  $BB9E  FF        .db $FF
  $BB9F  FF        .db $FF
  $BBA0  FF        .db $FF
  $BBA1  FF        .db $FF
  $BBA2  00        BRK
  $BBA3  00        BRK
  $BBA4  FF        .db $FF
  $BBA5  FF        .db $FF
  $BBA6  E0 CF     CPX #$CF
  $BBA8  FF        .db $FF
  $BBA9  FF        .db $FF
  $BBAA  FF        .db $FF
  $BBAB  00        BRK
  $BBAC  FF        .db $FF
  $BBAD  FF        .db $FF
  $BBAE  FF        .db $FF
  $BBAF  FF        .db $FF
  $BBB0  FF        .db $FF
  $BBB1  FF        .db $FF
  $BBB2  00        BRK
  $BBB3  00        BRK
  $BBB4  FF        .db $FF
  $BBB5  FF        .db $FF
  $BBB6  00        BRK
  $BBB7  FC        .db $FC
  $BBB8  FF        .db $FF
  $BBB9  FF        .db $FF
  $BBBA  FF        .db $FF
  $BBBB  00        BRK
  $BBBC  FF        .db $FF
  $BBBD  FF        .db $FF
  $BBBE  FF        .db $FF
  $BBBF  FF        .db $FF
  $BBC0  F8        SED
  $BBC1  F8        SED
  $BBC2  00        BRK
  $BBC3  00        BRK
  $BBC4  FF        .db $FF
  $BBC5  E0 00     CPX #$00
  $BBC7  00        BRK
  $BBC8  FF        .db $FF
  $BBC9  FF        .db $FF
  $BBCA  FF        .db $FF
  $BBCB  07        .db $07
  $BBCC  FF        .db $FF
  $BBCD  FF        .db $FF
  $BBCE  FF        .db $FF
  $BBCF  FF        .db $FF
  $BBD0  E7        .db $E7
  $BBD1  FF        .db $FF
  $BBD2  FF        .db $FF
  $BBD3  00        BRK
  $BBD4  FF        .db $FF
  $BBD5  00        BRK
  $BBD6  00        BRK
  $BBD7  00        BRK
  $BBD8  FF        .db $FF
  $BBD9  FF        .db $FF
  $BBDA  FF        .db $FF
  $BBDB  FF        .db $FF
  $BBDC  FF        .db $FF
  $BBDD  FF        .db $FF
  $BBDE  FF        .db $FF
  $BBDF  FF        .db $FF
  $BBE0  FF        .db $FF
  $BBE1  FF        .db $FF
  $BBE2  FF        .db $FF
  $BBE3  00        BRK
  $BBE4  FF        .db $FF
  $BBE5  00        BRK
  $BBE6  00        BRK
  $BBE7  00        BRK
  $BBE8  FF        .db $FF
  $BBE9  FF        .db $FF
  $BBEA  FF        .db $FF
  $BBEB  FF        .db $FF
  $BBEC  FF        .db $FF
  $BBED  FF        .db $FF
  $BBEE  FF        .db $FF
  $BBEF  FF        .db $FF
  $BBF0  E7        .db $E7
  $BBF1  FF        .db $FF
  $BBF2  FF        .db $FF
  $BBF3  00        BRK
  $BBF4  FF        .db $FF
  $BBF5  00        BRK
  $BBF6  00        BRK
  $BBF7  00        BRK
  $BBF8  FF        .db $FF
  $BBF9  FF        .db $FF
  $BBFA  FF        .db $FF
  $BBFB  FF        .db $FF
  $BBFC  FF        .db $FF
  $BBFD  FF        .db $FF
  $BBFE  FF        .db $FF
  $BBFF  FF        .db $FF
  $BC00  01 00     ORA ($00,X)
  $BC02  00        BRK
  $BC03  00        BRK
  $BC04  C0 00     CPY #$00
  $BC06  00        BRK
  $BC07  00        BRK
  $BC08  4F        .db $4F
  $BC09  31 8E     AND ($8E),Y
  $BC0B  C1 F0     CMP ($F0,X)
  $BC0D  FE FF FF  INC $FFFF,X
  $BC10  FF        .db $FF
  $BC11  00        BRK
  $BC12  00        BRK
  $BC13  00        BRK
  $BC14  00        BRK
  $BC15  00        BRK
  $BC16  00        BRK
  $BC17  00        BRK
  $BC18  FF        .db $FF
  $BC19  FF        .db $FF
  $BC1A  00        BRK
  $BC1B  FF        .db $FF
  $BC1C  00        BRK
  $BC1D  00        BRK
  $BC1E  FF        .db $FF
  $BC1F  FF        .db $FF
  $BC20  FF        .db $FF
  $BC21  00        BRK
  $BC22  00        BRK
  $BC23  00        BRK
  $BC24  00        BRK
  $BC25  00        BRK
  $BC26  00        BRK
  $BC27  00        BRK
  $BC28  FF        .db $FF
  $BC29  FF        .db $FF
  $BC2A  00        BRK
  $BC2B  FF        .db $FF
  $BC2C  00        BRK
  $BC2D  00        BRK
  $BC2E  FF        .db $FF
  $BC2F  FF        .db $FF
  $BC30  3E 00 7C  ROL $7C00,X
  $BC33  00        BRK
  $BC34  01 03     ORA ($03,X)
  $BC36  0F        .db $0F
  $BC37  07        .db $07
  $BC38  81 BF     STA ($BF,X)
  $BC3A  03        .db $03
  $BC3B  7E FD 03  ROR $03FD,X
  $BC3E  FF        .db $FF
  $BC3F  FF        .db $FF
  $BC40  80        .db $80
  $BC41  80        .db $80
  $BC42  C0 C0     CPY #$C0
  $BC44  C0 E0     CPY #$E0
  $BC46  E0 E0     CPX #$E0
  $BC48  80        .db $80
  $BC49  80        .db $80
  $BC4A  C0 C0     CPY #$C0
  $BC4C  C0 E0     CPY #$E0
  $BC4E  E0 E0     CPX #$E0
  $BC50  7F        .db $7F
  $BC51  67        .db $67
  $BC52  73        .db $73
  $BC53  73        .db $73
  $BC54  43        .db $43
  $BC55  67        .db $67
  $BC56  7F        .db $7F
  $BC57  7F        .db $7F
  $BC58  FF        .db $FF
  $BC59  FF        .db $FF
  $BC5A  C7        .db $C7
  $BC5B  C7        .db $C7
  $BC5C  C7        .db $C7
  $BC5D  FF        .db $FF
  $BC5E  FF        .db $FF
  $BC5F  FF        .db $FF
  $BC60  00        BRK
  $BC61  00        BRK
  $BC62  04        .db $04
  $BC63  0E 0E 04  ASL $040E
  $BC66  00        BRK
  $BC67  80        .db $80
  $BC68  C3        .db $C3
  $BC69  81 00     STA ($00,X)
  $BC6B  00        BRK
  $BC6C  00        BRK
  $BC6D  00        BRK
  $BC6E  81 C3     STA ($C3,X)
  $BC70  DF        .db $DF
  $BC71  5C        .db $5C
  $BC72  5E 5E 78  LSR $785E,X
  $BC75  7C        .db $7C
  $BC76  7F        .db $7F
  $BC77  FF        .db $FF
  $BC78  FF        .db $FF
  $BC79  FF        .db $FF
  $BC7A  F8        SED
  $BC7B  F8        SED
  $BC7C  F8        SED
  $BC7D  FF        .db $FF
  $BC7E  FF        .db $FF
  $BC7F  FF        .db $FF
  $BC80  FC        .db $FC
  $BC81  FC        .db $FC
  $BC82  7C        .db $7C
  $BC83  7C        .db $7C
  $BC84  7C        .db $7C
  $BC85  FC        .db $FC
  $BC86  FC        .db $FC
  $BC87  FC        .db $FC
  $BC88  FF        .db $FF
  $BC89  FF        .db $FF
  $BC8A  FF        .db $FF
  $BC8B  FF        .db $FF
  $BC8C  FF        .db $FF
  $BC8D  FF        .db $FF
  $BC8E  FF        .db $FF
  $BC8F  FF        .db $FF
  $BC90  00        BRK
  $BC91  00        BRK
  $BC92  00        BRK
  $BC93  00        BRK
  $BC94  00        BRK
  $BC95  00        BRK
  $BC96  00        BRK
  $BC97  00        BRK
  $BC98  00        BRK
  $BC99  00        BRK
  $BC9A  00        BRK
  $BC9B  00        BRK
  $BC9C  00        BRK
  $BC9D  00        BRK
  $BC9E  00        BRK
  $BC9F  00        BRK
  $BCA0  00        BRK
  $BCA1  00        BRK
  $BCA2  00        BRK
  $BCA3  03        .db $03
  $BCA4  07        .db $07
  $BCA5  02        .db $02
  $BCA6  01 00     ORA ($00,X)
  $BCA8  00        BRK
  $BCA9  00        BRK
  $BCAA  00        BRK
  $BCAB  00        BRK
  $BCAC  00        BRK
  $BCAD  0C        .db $0C
  $BCAE  0C        .db $0C
  $BCAF  1B        .db $1B
  $BCB0  00        BRK
  $BCB1  3F        .db $3F
  $BCB2  F0 8F     BEQ $BC43
  $BCB4  7F        .db $7F
  $BCB5  FF        .db $FF
  $BCB6  FF        .db $FF
  $BCB7  FF        .db $FF
  $BCB8  00        BRK
  $BCB9  00        BRK
  $BCBA  00        BRK
  $BCBB  00        BRK
  $BCBC  00        BRK
  $BCBD  00        BRK
  $BCBE  00        BRK
  $BCBF  00        BRK
  $BCC0  00        BRK
  $BCC1  00        BRK
  $BCC2  00        BRK
  $BCC3  00        BRK
  $BCC4  00        BRK
  $BCC5  00        BRK
  $BCC6  00        BRK
  $BCC7  06 00     ASL $00
  $BCC9  E0 18     CPX #$18
  $BCCB  C6 E1     DEC $E1
  $BCCD  F8        SED
  $BCCE  FC        .db $FC
  $BCCF  F8        SED
  $BCD0  00        BRK
  $BCD1  00        BRK
  $BCD2  00        BRK
  $BCD3  00        BRK
  $BCD4  05 85     ORA $85
  $BCD6  80        .db $80
  $BCD7  45 00     EOR $00
  $BCD9  00        BRK
  $BCDA  00        BRK
  $BCDB  00        BRK
  $BCDC  05 05     ORA $05
  $BCDE  00        BRK
  $BCDF  05 03     ORA $03
  $BCE1  01 00     ORA ($00,X)
  $BCE3  00        BRK
  $BCE4  00        BRK
  $BCE5  80        .db $80
  $BCE6  80        .db $80
  $BCE7  40        RTI
  $BCE8  03        .db $03
  $BCE9  01 00     ORA ($00,X)
  $BCEB  00        BRK
  $BCEC  00        BRK
  $BCED  00        BRK
  $BCEE  00        BRK
  $BCEF  00        BRK
  $BCF0  E0 F0     CPX #$F0
  $BCF2  F0 70     BEQ $BD64
  $BCF4  38        SEC
  $BCF5  38        SEC
  $BCF6  18        CLC
  $BCF7  18        CLC
  $BCF8  E0 F0     CPX #$F0
  $BCFA  F0 70     BEQ $BD6C
  $BCFC  38        SEC
  $BCFD  38        SEC
  $BCFE  18        CLC
  $BCFF  18        CLC
  $BD00  7F        .db $7F
  $BD01  01 00     ORA ($00,X)
  $BD03  00        BRK
  $BD04  00        BRK
  $BD05  00        BRK
  $BD06  00        BRK
  $BD07  00        BRK
  $BD08  FF        .db $FF
  $BD09  FF        .db $FF
  $BD0A  7F        .db $7F
  $BD0B  03        .db $03
  $BD0C  01 01     ORA ($01,X)
  $BD0E  01 01     ORA ($01,X)
  $BD10  C1 FF     CMP ($FF,X)
  $BD12  FE FE FE  INC $FEFE,X
  $BD15  FE FE FE  INC $FEFE,X
  $BD18  FF        .db $FF
  $BD19  FF        .db $FF
  $BD1A  FF        .db $FF
  $BD1B  FF        .db $FF
  $BD1C  FF        .db $FF
  $BD1D  FF        .db $FF
  $BD1E  FF        .db $FF
  $BD1F  FF        .db $FF
  $BD20  FF        .db $FF
  $BD21  00        BRK
  $BD22  00        BRK
  $BD23  00        BRK
  $BD24  00        BRK
  $BD25  00        BRK
  $BD26  00        BRK
  $BD27  00        BRK

L_BD28:
  $BD28  FF        .db $FF
  $BD29  FF        .db $FF
  $BD2A  FF        .db $FF
  $BD2B  C0 C0     CPY #$C0
  $BD2D  80        .db $80
  $BD2E  80        .db $80
  $BD2F  80        .db $80
  $BD30  FC        .db $FC
  $BD31  00        BRK
  $BD32  00        BRK
  $BD33  00        BRK
  $BD34  00        BRK
  $BD35  00        BRK

L_BD36:
  $BD36  00        BRK
  $BD37  00        BRK
  $BD38  FE FE FC  INC $FCFE,X
  $BD3B  00        BRK
  $BD3C  00        BRK
  $BD3D  00        BRK
  $BD3E  00        BRK
  $BD3F  00        BRK
  $BD40  00        BRK
  $BD41  00        BRK
  $BD42  00        BRK
  $BD43  00        BRK
  $BD44  00        BRK
  $BD45  00        BRK
  $BD46  00        BRK
  $BD47  00        BRK
  $BD48  00        BRK
  $BD49  00        BRK
  $BD4A  00        BRK
  $BD4B  00        BRK
  $BD4C  00        BRK
  $BD4D  00        BRK
  $BD4E  00        BRK
  $BD4F  00        BRK
  $BD50  00        BRK
  $BD51  00        BRK
  $BD52  00        BRK
  $BD53  00        BRK
  $BD54  00        BRK
  $BD55  00        BRK
  $BD56  37        .db $37
  $BD57  37        .db $37
  $BD58  1B        .db $1B
  $BD59  37        .db $37
  $BD5A  37        .db $37
  $BD5B  37        .db $37
  $BD5C  37        .db $37
  $BD5D  37        .db $37
  $BD5E  00        BRK
  $BD5F  00        BRK
  $BD60  7F        .db $7F
  $BD61  38        SEC
  $BD62  13        .db $13
  $BD63  06 04     ASL $04
  $BD65  05 ED     ORA $ED
  $BD67  EC 80 C0  CPX $C080
  $BD6A  E0 F0     CPX #$F0

L_BD6C:
  $BD6C  E8        INX
  $BD6D  E9 01     SBC #$01
  $BD6F  00        BRK
  $BD70  0E 1F 0F  ASL $0F1F
  $BD73  27        .db $27
  $BD74  17        .db $17
  $BD75  97        .db $97
  $BD76  80        .db $80
  $BD77  00        BRK
  $BD78  F0 00     BEQ $BD7A

L_BD7A:
  $BD7A  C0 00     CPY #$00
  $BD7C  00        BRK
  $BD7D  80        .db $80
  $BD7E  97        .db $97
  $BD7F  17        .db $17
  $BD80  40        RTI
  $BD81  25 20     AND $20
  $BD83  20 20 20  JSR $2020
  $BD86  00        BRK
  $BD87  00        BRK
  $BD88  00        BRK
  $BD89  05 00     ORA $00
  $BD8B  00        BRK
  $BD8C  00        BRK
  $BD8D  00        BRK
  $BD8E  20 20 40  JSR $4020
  $BD91  20 20 20  JSR $2020
  $BD94  21 21     AND ($21,X)
  $BD96  01 01     ORA ($01,X)
  $BD98  00        BRK
  $BD99  01 01     ORA ($01,X)
  $BD9B  01 00     ORA ($00,X)
  $BD9D  00        BRK
  $BD9E  20 20 18  JSR $1820
  $BDA1  18        CLC
  $BDA2  18        CLC
  $BDA3  18        CLC
  $BDA4  90 90     BCC $BD36
  $BDA6  90 80     BCC $BD28
  $BDA8  18        CLC
  $BDA9  18        CLC
  $BDAA  98        TYA
  $BDAB  98        TYA
  $BDAC  10 10     BPL $BDBE
  $BDAE  10 00     BPL $BDB0

L_BDB0:
  $BDB0  40        RTI
  $BDB1  2A        ROL
  $BDB2  7F        .db $7F
  $BDB3  7F        .db $7F
  $BDB4  00        BRK
  $BDB5  00        BRK
  $BDB6  00        BRK
  $BDB7  3F        .db $3F
  $BDB8  00        BRK
  $BDB9  00        BRK
  $BDBA  00        BRK
  $BDBB  00        BRK
  $BDBC  7F        .db $7F
  $BDBD  3F        .db $3F

L_BDBE:
  $BDBE  3F        .db $3F
  $BDBF  00        BRK
  $BDC0  FE FE 7E  INC $7EFE,X
  $BDC3  7E 7E 7E  ROR $7E7E,X
  $BDC6  7E BE FE  ROR $FEBE,X
  $BDC9  FE 7E 7E  INC $7E7E,X
  $BDCC  7E 7E 7E  ROR $7E7E,X
  $BDCF  3E 2A 3F  ROL $3F2A,X
  $BDD2  3F        .db $3F
  $BDD3  3F        .db $3F
  $BDD4  00        BRK
  $BDD5  00        BRK
  $BDD6  00        BRK
  $BDD7  1F        .db $1F
  $BDD8  00        BRK
  $BDD9  00        BRK
  $BDDA  00        BRK
  $BDDB  00        BRK
  $BDDC  3F        .db $3F
  $BDDD  3F        .db $3F
  $BDDE  3F        .db $3F
  $BDDF  00        BRK
  $BDE0  AA        TAX
  $BDE1  FF        .db $FF
  $BDE2  FF        .db $FF
  $BDE3  FF        .db $FF
  $BDE4  00        BRK
  $BDE5  00        BRK
  $BDE6  00        BRK
  $BDE7  FF        .db $FF
  $BDE8  00        BRK
  $BDE9  00        BRK
  $BDEA  00        BRK
  $BDEB  00        BRK
  $BDEC  FF        .db $FF
  $BDED  FF        .db $FF
  $BDEE  FF        .db $FF
  $BDEF  00        BRK
  $BDF0  A0 E0     LDY #$E0
  $BDF2  E0 E0     CPX #$E0
  $BDF4  0C        .db $0C
  $BDF5  0C        .db $0C
  $BDF6  0E EC 0C  ASL $0CEC
  $BDF9  0C        .db $0C
  $BDFA  0C        .db $0C
  $BDFB  0C        .db $0C
  $BDFC  E0 E0     CPX #$E0
  $BDFE  E0 02     CPX #$02
  $BE00  37        .db $37
  $BE01  37        .db $37
  $BE02  37        .db $37
  $BE03  1B        .db $1B
  $BE04  1B        .db $1B
  $BE05  0D 0E 04  ORA $040E
  $BE08  00        BRK
  $BE09  00        BRK
  $BE0A  00        BRK
  $BE0B  00        BRK
  $BE0C  00        BRK
  $BE0D  00        BRK
  $BE0E  00        BRK
  $BE0F  03        .db $03
  $BE10  F2        .db $F2
  $BE11  F1 E0     SBC ($E0),Y
  $BE13  C0 80     CPY #$80
  $BE15  00        BRK
  $BE16  00        BRK
  $BE17  00        BRK
  $BE18  04        .db $04
  $BE19  02        .db $02
  $BE1A  18        CLC
  $BE1B  3F        .db $3F
  $BE1C  7F        .db $7F
  $BE1D  FF        .db $FF
  $BE1E  FF        .db $FF
  $BE1F  7F        .db $7F
  $BE20  20 C0 10  JSR $10C0
  $BE23  F8        SED
  $BE24  FC        .db $FC
  $BE25  FC        .db $FC
  $BE26  F9 E1 07  SBC $07E1,Y
  $BE29  0F        .db $0F
  $BE2A  0F        .db $0F
  $BE2B  06 02     ASL $02
  $BE2D  00        BRK
  $BE2E  00        BRK
  $BE2F  00        BRK
  $BE30  00        BRK
  $BE31  00        BRK
  $BE32  00        BRK
  $BE33  00        BRK
  $BE34  00        BRK
  $BE35  00        BRK
  $BE36  00        BRK
  $BE37  00        BRK
  $BE38  20 20 20  JSR $2020
  $BE3B  40        RTI
  $BE3C  40        RTI
  $BE3D  80        .db $80
  $BE3E  80        .db $80
  $BE3F  00        BRK
  $BE40  00        BRK
  $BE41  00        BRK
  $BE42  00        BRK
  $BE43  00        BRK
  $BE44  01 01     ORA ($01,X)
  $BE46  01 00     ORA ($00,X)
  $BE48  21 21     AND ($21,X)
  $BE4A  21 41     AND ($41,X)
  $BE4C  40        RTI
  $BE4D  80        .db $80
  $BE4E  80        .db $80
  $BE4F  01 00     ORA ($00,X)
  $BE51  00        BRK
  $BE52  00        BRK
  $BE53  00        BRK
  $BE54  80        .db $80
  $BE55  80        .db $80
  $BE56  80        .db $80
  $BE57  00        BRK
  $BE58  80        .db $80
  $BE59  80        .db $80
  $BE5A  80        .db $80
  $BE5B  80        .db $80
  $BE5C  00        BRK
  $BE5D  00        BRK
  $BE5E  00        BRK
  $BE5F  00        BRK
  $BE60  1F        .db $1F
  $BE61  1F        .db $1F
  $BE62  00        BRK
  $BE63  00        BRK
  $BE64  00        BRK
  $BE65  01 00     ORA ($00,X)
  $BE67  00        BRK
  $BE68  00        BRK
  $BE69  00        BRK
  $BE6A  0F        .db $0F
  $BE6B  07        .db $07
  $BE6C  03        .db $03
  $BE6D  00        BRK
  $BE6E  00        BRK
  $BE6F  00        BRK
  $BE70  BF        .db $BF
  $BE71  DF        .db $DF
  $BE72  1F        .db $1F
  $BE73  0F        .db $0F
  $BE74  07        .db $07
  $BE75  FB        .db $FB
  $BE76  7C        .db $7C
  $BE77  1F        .db $1F
  $BE78  3F        .db $3F
  $BE79  1F        .db $1F
  $BE7A  DF        .db $DF
  $BE7B  EF        .db $EF
  $BE7C  F7        .db $F7
  $BE7D  03        .db $03
  $BE7E  00        BRK
  $BE7F  00        BRK
  $BE80  1F        .db $1F
  $BE81  1F        .db $1F
  $BE82  00        BRK
  $BE83  80        .db $80
  $BE84  80        .db $80
  $BE85  C3        .db $C3
  $BE86  F1 00     SBC ($00),Y
  $BE88  00        BRK
  $BE89  00        BRK
  $BE8A  0F        .db $0F
  $BE8B  8F        .db $8F
  $BE8C  87        .db $87
  $BE8D  C0 F0     CPY #$F0
  $BE8F  00        BRK
  $BE90  FF        .db $FF
  $BE91  FF        .db $FF

L_BE92:
  $BE92  00        BRK
  $BE93  00        BRK
  $BE94  00        BRK
  $BE95  FF        .db $FF
  $BE96  FF        .db $FF
  $BE97  FF        .db $FF
  $BE98  00        BRK
  $BE99  00        BRK
  $BE9A  FF        .db $FF
  $BE9B  FF        .db $FF
  $BE9C  FF        .db $FF
  $BE9D  00        BRK
  $BE9E  00        BRK
  $BE9F  00        BRK
  $BEA0  F0 F0     BEQ $BE92
  $BEA2  00        BRK
  $BEA3  03        .db $03
  $BEA4  01 FE     ORA ($FE,X)
  $BEA6  FF        .db $FF
  $BEA7  FF        .db $FF
  $BEA8  06 06     ASL $06
  $BEAA  F3        .db $F3
  $BEAB  F8        SED
  $BEAC  FC        .db $FC
  $BEAD  00        BRK
  $BEAE  00        BRK
  $BEAF  00        BRK
  $BEB0  00        BRK
  $BEB1  00        BRK
  $BEB2  00        BRK
  $BEB3  80        .db $80
  $BEB4  80        .db $80
  $BEB5  80        .db $80
  $BEB6  0F        .db $0F
  $BEB7  DF        .db $DF
  $BEB8  03        .db $03
  $BEB9  00        BRK
  $BEBA  00        BRK
  $BEBB  00        BRK
  $BEBC  40        RTI
  $BEBD  70 30     BVS $BEEF
  $BEBF  00        BRK

L_BEC0:
  $BEC0  00        BRK
  $BEC1  00        BRK
  $BEC2  00        BRK
  $BEC3  00        BRK
  $BEC4  00        BRK
  $BEC5  00        BRK
  $BEC6  0F        .db $0F
  $BEC7  0F        .db $0F
  $BEC8  8F        .db $8F
  $BEC9  F0 3F     BEQ $BF0A
  $BECB  00        BRK
  $BECC  00        BRK
  $BECD  00        BRK
  $BECE  F0 F0     BEQ $BEC0

L_BED0:
  $BED0  C6 18     DEC $18
  $BED2  E0 00     CPX #$00
  $BED4  00        BRK
  $BED5  00        BRK
  $BED6  0F        .db $0F
  $BED7  0F        .db $0F
  $BED8  00        BRK
  $BED9  00        BRK
  $BEDA  00        BRK
  $BEDB  00        BRK
  $BEDC  00        BRK
  $BEDD  00        BRK
  $BEDE  F0 F0     BEQ $BED0

L_BEE0:
  $BEE0  00        BRK
  $BEE1  88        DEY
  $BEE2  00        BRK
  $BEE3  00        BRK
  $BEE4  00        BRK
  $BEE5  00        BRK
  $BEE6  0F        .db $0F
  $BEE7  0F        .db $0F
  $BEE8  00        BRK
  $BEE9  88        DEY
  $BEEA  00        BRK
  $BEEB  00        BRK
  $BEEC  00        BRK
  $BEED  00        BRK
  $BEEE  F0 F0     BEQ $BEE0

L_BEF0:
  $BEF0  00        BRK
  $BEF1  80        .db $80
  $BEF2  00        BRK
  $BEF3  00        BRK
  $BEF4  00        BRK
  $BEF5  00        BRK
  $BEF6  0F        .db $0F
  $BEF7  0F        .db $0F
  $BEF8  03        .db $03
  $BEF9  80        .db $80
  $BEFA  00        BRK
  $BEFB  00        BRK
  $BEFC  00        BRK
  $BEFD  00        BRK
  $BEFE  F0 F0     BEQ $BEF0
  $BF00  00        BRK
  $BF01  00        BRK
  $BF02  00        BRK
  $BF03  0E 1C 08  ASL $081C
  $BF06  00        BRK
  $BF07  00        BRK
  $BF08  03        .db $03
  $BF09  03        .db $03

L_BF0A:
  $BF0A  06 00     ASL $00
  $BF0C  00        BRK
  $BF0D  30 F0     BMI $BEFF
  $BF0F  C0 00     CPY #$00
  $BF11  00        BRK
  $BF12  00        BRK
  $BF13  00        BRK
  $BF14  00        BRK
  $BF15  00        BRK
  $BF16  00        BRK
  $BF17  00        BRK
  $BF18  00        BRK
  $BF19  00        BRK
  $BF1A  00        BRK
  $BF1B  00        BRK
  $BF1C  00        BRK
  $BF1D  00        BRK
  $BF1E  00        BRK
  $BF1F  00        BRK
  $BF20  00        BRK
  $BF21  00        BRK
  $BF22  00        BRK
  $BF23  00        BRK
  $BF24  00        BRK
  $BF25  00        BRK
  $BF26  00        BRK
  $BF27  00        BRK
  $BF28  00        BRK
  $BF29  00        BRK
  $BF2A  00        BRK
  $BF2B  00        BRK
  $BF2C  00        BRK
  $BF2D  00        BRK
  $BF2E  00        BRK
  $BF2F  00        BRK
  $BF30  00        BRK
  $BF31  00        BRK
  $BF32  00        BRK
  $BF33  00        BRK
  $BF34  00        BRK
  $BF35  00        BRK
  $BF36  00        BRK
  $BF37  00        BRK
  $BF38  00        BRK
  $BF39  00        BRK
  $BF3A  00        BRK
  $BF3B  00        BRK
  $BF3C  00        BRK
  $BF3D  00        BRK
  $BF3E  00        BRK
  $BF3F  00        BRK
  $BF40  00        BRK
  $BF41  00        BRK
  $BF42  00        BRK
  $BF43  00        BRK
  $BF44  00        BRK
  $BF45  00        BRK
  $BF46  00        BRK
  $BF47  00        BRK
  $BF48  00        BRK
  $BF49  00        BRK
  $BF4A  00        BRK
  $BF4B  00        BRK
  $BF4C  00        BRK
  $BF4D  00        BRK
  $BF4E  00        BRK
  $BF4F  00        BRK
  $BF50  00        BRK
  $BF51  00        BRK
  $BF52  00        BRK
  $BF53  00        BRK
  $BF54  00        BRK
  $BF55  00        BRK
  $BF56  00        BRK
  $BF57  00        BRK
  $BF58  00        BRK
  $BF59  00        BRK
  $BF5A  00        BRK
  $BF5B  00        BRK
  $BF5C  00        BRK
  $BF5D  00        BRK
  $BF5E  00        BRK
  $BF5F  00        BRK
  $BF60  00        BRK
  $BF61  00        BRK
  $BF62  00        BRK
  $BF63  00        BRK
  $BF64  00        BRK
  $BF65  00        BRK
  $BF66  00        BRK
  $BF67  00        BRK
  $BF68  00        BRK
  $BF69  00        BRK
  $BF6A  00        BRK
  $BF6B  00        BRK
  $BF6C  00        BRK
  $BF6D  00        BRK
  $BF6E  00        BRK
  $BF6F  00        BRK
  $BF70  00        BRK
  $BF71  00        BRK
  $BF72  00        BRK
  $BF73  00        BRK
  $BF74  00        BRK
  $BF75  00        BRK
  $BF76  00        BRK
  $BF77  00        BRK
  $BF78  00        BRK
  $BF79  00        BRK
  $BF7A  00        BRK
  $BF7B  00        BRK
  $BF7C  00        BRK
  $BF7D  00        BRK
  $BF7E  00        BRK
  $BF7F  00        BRK
  $BF80  00        BRK
  $BF81  00        BRK
  $BF82  00        BRK
  $BF83  00        BRK
  $BF84  00        BRK
  $BF85  00        BRK
  $BF86  00        BRK
  $BF87  00        BRK
  $BF88  00        BRK
  $BF89  00        BRK
  $BF8A  00        BRK
  $BF8B  00        BRK
  $BF8C  00        BRK
  $BF8D  00        BRK
  $BF8E  00        BRK
  $BF8F  00        BRK
  $BF90  00        BRK
  $BF91  00        BRK
  $BF92  00        BRK
  $BF93  00        BRK
  $BF94  00        BRK
  $BF95  00        BRK
  $BF96  00        BRK
  $BF97  00        BRK
  $BF98  00        BRK
  $BF99  00        BRK
  $BF9A  00        BRK
  $BF9B  00        BRK
  $BF9C  00        BRK
  $BF9D  00        BRK
  $BF9E  00        BRK
  $BF9F  00        BRK
  $BFA0  00        BRK
  $BFA1  00        BRK
  $BFA2  00        BRK
  $BFA3  00        BRK
  $BFA4  00        BRK
  $BFA5  00        BRK
  $BFA6  00        BRK
  $BFA7  00        BRK
  $BFA8  00        BRK
  $BFA9  00        BRK
  $BFAA  00        BRK
  $BFAB  00        BRK
  $BFAC  00        BRK
  $BFAD  00        BRK
  $BFAE  00        BRK
  $BFAF  00        BRK
  $BFB0  00        BRK
  $BFB1  00        BRK
  $BFB2  00        BRK
  $BFB3  00        BRK
  $BFB4  00        BRK
  $BFB5  00        BRK
  $BFB6  00        BRK
  $BFB7  00        BRK
  $BFB8  00        BRK
  $BFB9  00        BRK
  $BFBA  00        BRK
  $BFBB  00        BRK
  $BFBC  00        BRK
  $BFBD  00        BRK
  $BFBE  00        BRK
  $BFBF  00        BRK
  $BFC0  00        BRK
  $BFC1  00        BRK
  $BFC2  00        BRK
  $BFC3  00        BRK
  $BFC4  00        BRK
  $BFC5  00        BRK
  $BFC6  00        BRK
  $BFC7  00        BRK
  $BFC8  00        BRK
  $BFC9  00        BRK
  $BFCA  00        BRK
  $BFCB  00        BRK
  $BFCC  00        BRK
  $BFCD  00        BRK
  $BFCE  00        BRK
  $BFCF  00        BRK
  $BFD0  00        BRK
  $BFD1  00        BRK
  $BFD2  00        BRK
  $BFD3  00        BRK
  $BFD4  00        BRK
  $BFD5  00        BRK
  $BFD6  00        BRK
  $BFD7  00        BRK
  $BFD8  00        BRK
  $BFD9  00        BRK
  $BFDA  00        BRK
  $BFDB  00        BRK
  $BFDC  00        BRK
  $BFDD  00        BRK
  $BFDE  00        BRK
  $BFDF  00        BRK
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
  $BFFA  00        BRK
  $BFFB  00        BRK
  $BFFC  E0 BF     CPX #$BF
  $BFFE  E0 BF     CPX #$BF