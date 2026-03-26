; Mega Man 2 — PRG Bank 12
; Base address: $8000
; Size: 16384 bytes

  $8000  4C 35 82  JMP $8235
  $8003  C9 FC     CMP #$FC
  $8005  D0 03     BNE $800A
  $8007  4C 29 81  JMP $8129

L_800A:
  $800A  C9 FD     CMP #$FD
  $800C  D0 03     BNE $8011
  $800E  4C 2D 81  JMP $812D

L_8011:
  $8011  C9 FE     CMP #$FE
  $8013  D0 0B     BNE $8020
  $8015  A9 01     LDA #$01
  $8017  85 E4     STA $E4
  $8019  A9 00     LDA #$00
  $801B  85 EC     STA $EC
  $801D  4C 3A 81  JMP $813A

L_8020:
  $8020  C9 FF     CMP #$FF
  $8022  D0 0B     BNE $802F
  $8024  A9 01     LDA #$01
  $8026  85 E4     STA $E4
  $8028  A9 00     LDA #$00
  $802A  85 EC     STA $EC
  $802C  4C 8C 81  JMP $818C

L_802F:
  $802F  0A        ASL
  $8030  AA        TAX
  $8031  BD 50 8A  LDA $8A50,X
  $8034  85 E2     STA $E2
  $8036  BD 51 8A  LDA $8A51,X
  $8039  85 E3     STA $E3
  $803B  A0 00     LDY #$00
  $803D  B1 E2     LDA ($E2),Y
  $803F  AA        TAX
  $8040  29 0F     AND #$0F
  $8042  F0 77     BEQ $80BB
  $8044  A5 E0     LDA $E0
  $8046  29 0F     AND #$0F
  $8048  85 E5     STA $E5
  $804A  E4 E5     CPX $E5
  $804C  B0 01     BCS $804F
  $804E  60        RTS

L_804F:
  $804F  86 E5     STX $E5
  $8051  A5 E0     LDA $E0
  $8053  29 F0     AND #$F0
  $8055  05 E5     ORA $E5
  $8057  85 E0     STA $E0
  $8059  A9 01     LDA #$01
  $805B  85 E4     STA $E4
  $805D  A9 00     LDA #$00
  $805F  85 EC     STA $EC
  $8061  A9 00     LDA #$00
  $8063  85 E7     STA $E7
  $8065  85 E8     STA $E8
  $8067  A9 04     LDA #$04
  $8069  85 E5     STA $E5
  $806B  A9 01     LDA #$01

L_806D:
  $806D  18        CLC
  $806E  65 E2     ADC $E2
  $8070  85 E2     STA $E2
  $8072  A9 00     LDA #$00
  $8074  65 E3     ADC $E3
  $8076  85 E3     STA $E3
  $8078  A6 EC     LDX $EC
  $807A  A0 00     LDY #$00

L_807C:
  $807C  B1 E2     LDA ($E2),Y
  $807E  9D 00 05  STA $0500,X
  $8081  E8        INX
  $8082  C8        INY
  $8083  C0 02     CPY #$02
  $8085  D0 F5     BNE $807C
  $8087  A0 0E     LDY #$0E
  $8089  A9 00     LDA #$00

L_808B:
  $808B  9D 00 05  STA $0500,X
  $808E  E8        INX
  $808F  88        DEY
  $8090  D0 F9     BNE $808B
  $8092  A5 E1     LDA $E1
  $8094  4A        LSR
  $8095  B0 03     BCS $809A
  $8097  20 B2 81  JSR $81B2

L_809A:
  $809A  20 07 82  JSR $8207
  $809D  C6 E5     DEC $E5
  $809F  F0 05     BEQ $80A6
  $80A1  A9 02     LDA #$02
  $80A3  4C 6D 80  JMP $806D

L_80A6:
  $80A6  A0 02     LDY #$02
  $80A8  B1 E2     LDA ($E2),Y
  $80AA  8D 7C 05  STA $057C
  $80AD  C8        INY
  $80AE  B1 E2     LDA ($E2),Y
  $80B0  8D 7D 05  STA $057D
  $80B3  20 19 82  JSR $8219
  $80B6  A9 00     LDA #$00
  $80B8  85 E4     STA $E4
  $80BA  60        RTS

L_80BB:
  $80BB  A5 E0     LDA $E0
  $80BD  29 F0     AND #$F0
  $80BF  85 E5     STA $E5
  $80C1  E4 E5     CPX $E5
  $80C3  B0 01     BCS $80C6
  $80C5  60        RTS

L_80C6:
  $80C6  86 E5     STX $E5
  $80C8  A5 E0     LDA $E0
  $80CA  29 0F     AND #$0F
  $80CC  05 E5     ORA $E5
  $80CE  85 E0     STA $E0
  $80D0  A9 01     LDA #$01
  $80D2  85 E4     STA $E4
  $80D4  A9 00     LDA #$00
  $80D6  85 EC     STA $EC
  $80D8  A2 00     LDX #$00
  $80DA  A9 02     LDA #$02
  $80DC  18        CLC
  $80DD  65 E2     ADC $E2
  $80DF  85 F0     STA $F0
  $80E1  8A        TXA
  $80E2  65 E3     ADC $E3
  $80E4  85 F1     STA $F1
  $80E6  86 F2     STX $F2
  $80E8  86 F3     STX $F3
  $80EA  A0 01     LDY #$01
  $80EC  B1 E2     LDA ($E2),Y
  $80EE  29 0F     AND #$0F
  $80F0  AA        TAX
  $80F1  05 E1     ORA $E1
  $80F3  48        PHA
  $80F4  86 E1     STX $E1
  $80F6  A9 04     LDA #$04
  $80F8  85 E5     STA $E5
  $80FA  A9 02     LDA #$02
  $80FC  85 E6     STA $E6

L_80FE:
  $80FE  68        PLA
  $80FF  4A        LSR
  $8100  48        PHA
  $8101  90 0B     BCC $810E
  $8103  20 B2 81  JSR $81B2
  $8106  A5 E1     LDA $E1
  $8108  4A        LSR
  $8109  B0 03     BCS $810E
  $810B  20 6C 81  JSR $816C

L_810E:
  $810E  20 07 82  JSR $8207
  $8111  A9 04     LDA #$04
  $8113  18        CLC
  $8114  65 E6     ADC $E6
  $8116  85 E6     STA $E6
  $8118  C6 E5     DEC $E5
  $811A  D0 E2     BNE $80FE
  $811C  20 19 82  JSR $8219
  $811F  A5 E1     LDA $E1
  $8121  85 EF     STA $EF
  $8123  68        PLA
  $8124  A9 00     LDA #$00
  $8126  85 E4     STA $E4
  $8128  60        RTS

L_8129:
  $8129  C8        INY
  $812A  84 E7     STY $E7
  $812C  60        RTS

L_812D:
  $812D  84 E8     STY $E8
  $812F  A9 01     LDA #$01
  $8131  85 E9     STA $E9
  $8133  A5 EA     LDA $EA
  $8135  29 01     AND #$01
  $8137  85 EA     STA $EA
  $8139  60        RTS

L_813A:
  $813A  A5 E0     LDA $E0
  $813C  29 0F     AND #$0F
  $813E  85 E0     STA $E0
  $8140  A9 04     LDA #$04
  $8142  85 E5     STA $E5
  $8144  A9 02     LDA #$02
  $8146  85 E6     STA $E6

L_8148:
  $8148  A5 E1     LDA $E1
  $814A  4A        LSR
  $814B  90 06     BCC $8153
  $814D  20 B2 81  JSR $81B2
  $8150  20 6C 81  JSR $816C

L_8153:
  $8153  20 07 82  JSR $8207
  $8156  A9 04     LDA #$04
  $8158  18        CLC
  $8159  65 E6     ADC $E6
  $815B  85 E6     STA $E6
  $815D  C6 E5     DEC $E5
  $815F  D0 E7     BNE $8148
  $8161  A9 00     LDA #$00
  $8163  85 E1     STA $E1
  $8165  85 EF     STA $EF
  $8167  A9 00     LDA #$00
  $8169  85 E4     STA $E4
  $816B  60        RTS

L_816C:
  $816C  A5 EC     LDA $EC
  $816E  18        CLC
  $816F  69 0A     ADC #$0A
  $8171  AA        TAX
  $8172  BD 00 05  LDA $0500,X
  $8175  1D 01 05  ORA $0501,X
  $8178  D0 4A     BNE $81C4
  $817A  A4 E5     LDY $E5
  $817C  A6 E6     LDX $E6
  $817E  20 22 82  JSR $8222
  $8181  A6 EC     LDX $EC
  $8183  BD 00 05  LDA $0500,X
  $8186  1D 01 05  ORA $0501,X
  $8189  D0 39     BNE $81C4
  $818B  60        RTS

L_818C:
  $818C  A5 E0     LDA $E0
  $818E  29 F0     AND #$F0
  $8190  85 E0     STA $E0
  $8192  A9 00     LDA #$00
  $8194  85 E7     STA $E7
  $8196  85 E8     STA $E8
  $8198  A9 04     LDA #$04
  $819A  85 E5     STA $E5

L_819C:
  $819C  A9 00     LDA #$00
  $819E  A6 EC     LDX $EC
  $81A0  9D 00 05  STA $0500,X
  $81A3  9D 01 05  STA $0501,X
  $81A6  20 11 82  JSR $8211
  $81A9  C6 E5     DEC $E5
  $81AB  D0 EF     BNE $819C
  $81AD  A9 00     LDA #$00
  $81AF  85 E4     STA $E4
  $81B1  60        RTS

L_81B2:
  $81B2  A0 0F     LDY #$0F
  $81B4  A9 10     LDA #$10
  $81B6  18        CLC
  $81B7  65 EC     ADC $EC
  $81B9  AA        TAX
  $81BA  A9 00     LDA #$00

L_81BC:
  $81BC  9D 00 05  STA $0500,X
  $81BF  E8        INX
  $81C0  88        DEY
  $81C1  D0 F9     BNE $81BC
  $81C3  60        RTS

L_81C4:
  $81C4  A5 E5     LDA $E5
  $81C6  48        PHA
  $81C7  A5 E6     LDA $E6
  $81C9  48        PHA
  $81CA  AD 7C 05  LDA $057C
  $81CD  85 E5     STA $E5
  $81CF  AD 7D 05  LDA $057D
  $81D2  85 E6     STA $E6
  $81D4  A5 EC     LDA $EC
  $81D6  18        CLC
  $81D7  69 06     ADC #$06
  $81D9  AA        TAX
  $81DA  BD 00 05  LDA $0500,X
  $81DD  29 1F     AND #$1F
  $81DF  F0 09     BEQ $81EA
  $81E1  A8        TAY
  $81E2  A9 00     LDA #$00

L_81E4:
  $81E4  18        CLC
  $81E5  69 04     ADC #$04
  $81E7  88        DEY
  $81E8  D0 FA     BNE $81E4

L_81EA:
  $81EA  A8        TAY
  $81EB  8A        TXA
  $81EC  18        CLC
  $81ED  69 0E     ADC #$0E
  $81EF  AA        TAX
  $81F0  A9 04     LDA #$04

L_81F2:
  $81F2  48        PHA
  $81F3  B1 E5     LDA ($E5),Y
  $81F5  9D 00 05  STA $0500,X
  $81F8  C8        INY
  $81F9  E8        INX
  $81FA  68        PLA
  $81FB  38        SEC
  $81FC  E9 01     SBC #$01
  $81FE  D0 F2     BNE $81F2
  $8200  68        PLA
  $8201  85 E6     STA $E6
  $8203  68        PLA
  $8204  85 E5     STA $E5
  $8206  60        RTS

L_8207:
  $8207  46 E1     LSR $E1
  $8209  90 06     BCC $8211
  $820B  A5 E1     LDA $E1
  $820D  09 80     ORA #$80
  $820F  85 E1     STA $E1

L_8211:
  $8211  A9 1F     LDA #$1F
  $8213  18        CLC
  $8214  65 EC     ADC $EC
  $8216  85 EC     STA $EC
  $8218  60        RTS

L_8219:
  $8219  46 E1     LSR $E1
  $821B  46 E1     LSR $E1
  $821D  46 E1     LSR $E1
  $821F  46 E1     LSR $E1
  $8221  60        RTS

L_8222:
  $8222  C0 01     CPY #$01
  $8224  F0 09     BEQ $822F
  $8226  A9 00     LDA #$00
  $8228  9D 00 40  STA $4000,X
  $822B  9D 01 40  STA $4001,X
  $822E  60        RTS

L_822F:
  $822F  A9 07     LDA #$07
  $8231  8D 15 40  STA $4015
  $8234  60        RTS

L_8235:
  $8235  E6 EA     INC $EA
  $8237  A5 E4     LDA $E4
  $8239  F0 01     BEQ $823C
  $823B  60        RTS

L_823C:
  $823C  A2 00     LDX #$00
  $823E  A0 05     LDY #$05
  $8240  86 EC     STX $EC
  $8242  84 ED     STY $ED
  $8244  A9 00     LDA #$00
  $8246  85 EB     STA $EB
  $8248  A9 04     LDA #$04
  $824A  85 EE     STA $EE

L_824C:
  $824C  A9 01     LDA #$01
  $824E  A0 18     LDY #$18
  $8250  18        CLC
  $8251  71 EC     ADC ($EC),Y
  $8253  91 EC     STA ($EC),Y
  $8255  A9 01     LDA #$01
  $8257  A0 1D     LDY #$1D
  $8259  18        CLC
  $825A  71 EC     ADC ($EC),Y
  $825C  91 EC     STA ($EC),Y
  $825E  A5 EF     LDA $EF
  $8260  4A        LSR
  $8261  90 03     BCC $8266
  $8263  20 6D 85  JSR $856D

L_8266:
  $8266  A5 41     LDA $41
  $8268  4A        LSR
  $8269  90 03     BCC $826E
  $826B  4C 86 82  JMP $8286

L_826E:
  $826E  A0 00     LDY #$00
  $8270  B1 EC     LDA ($EC),Y
  $8272  C8        INY
  $8273  11 EC     ORA ($EC),Y
  $8275  F0 0F     BEQ $8286
  $8277  A9 01     LDA #$01
  $8279  A0 0E     LDY #$0E
  $827B  18        CLC
  $827C  71 EC     ADC ($EC),Y
  $827E  91 EC     STA ($EC),Y
  $8280  20 B4 86  JSR $86B4
  $8283  4C 94 82  JMP $8294

L_8286:
  $8286  A5 EF     LDA $EF
  $8288  4A        LSR
  $8289  B0 09     BCS $8294
  $828B  A6 EB     LDX $EB
  $828D  E8        INX
  $828E  E8        INX
  $828F  A4 EE     LDY $EE
  $8291  20 22 82  JSR $8222

L_8294:
  $8294  46 EF     LSR $EF
  $8296  90 06     BCC $829E
  $8298  A5 EF     LDA $EF
  $829A  09 80     ORA #$80
  $829C  85 EF     STA $EF

L_829E:
  $829E  C6 EE     DEC $EE
  $82A0  F0 17     BEQ $82B9
  $82A2  A9 04     LDA #$04
  $82A4  18        CLC
  $82A5  65 EB     ADC $EB
  $82A7  85 EB     STA $EB
  $82A9  A9 1F     LDA #$1F
  $82AB  18        CLC
  $82AC  65 EC     ADC $EC
  $82AE  85 EC     STA $EC
  $82B0  A9 00     LDA #$00
  $82B2  65 ED     ADC $ED
  $82B4  85 ED     STA $ED
  $82B6  4C 4C 82  JMP $824C

L_82B9:
  $82B9  A5 E8     LDA $E8
  $82BB  29 7F     AND #$7F
  $82BD  F0 1E     BEQ $82DD
  $82BF  C5 EA     CMP $EA
  $82C1  D0 1A     BNE $82DD
  $82C3  A5 EA     LDA $EA
  $82C5  29 01     AND #$01
  $82C7  85 EA     STA $EA
  $82C9  E6 E9     INC $E9
  $82CB  A9 10     LDA #$10
  $82CD  C5 E9     CMP $E9
  $82CF  D0 0C     BNE $82DD
  $82D1  A5 E8     LDA $E8
  $82D3  30 04     BMI $82D9
  $82D5  A9 00     LDA #$00
  $82D7  85 E8     STA $E8

L_82D9:
  $82D9  A9 0F     LDA #$0F
  $82DB  85 E9     STA $E9

L_82DD:
  $82DD  A5 F2     LDA $F2
  $82DF  F0 02     BEQ $82E3
  $82E1  C6 F2     DEC $F2

L_82E3:
  $82E3  46 EF     LSR $EF
  $82E5  46 EF     LSR $EF
  $82E7  46 EF     LSR $EF
  $82E9  46 EF     LSR $EF
  $82EB  60        RTS

L_82EC:
  $82EC  A0 0C     LDY #$0C
  $82EE  B1 EC     LDA ($EC),Y
  $82F0  A0 02     LDY #$02
  $82F2  C4 EE     CPY $EE
  $82F4  F0 02     BEQ $82F8
  $82F6  29 0F     AND #$0F

L_82F8:
  $82F8  85 F4     STA $F4
  $82FA  A5 E8     LDA $E8
  $82FC  29 7F     AND #$7F
  $82FE  F0 2B     BEQ $832B
  $8300  A5 E9     LDA $E9
  $8302  A0 02     LDY #$02
  $8304  C4 EE     CPY $EE
  $8306  D0 08     BNE $8310
  $8308  A2 0C     LDX #$0C

L_830A:
  $830A  18        CLC
  $830B  65 E9     ADC $E9
  $830D  CA        DEX
  $830E  D0 FA     BNE $830A

L_8310:
  $8310  A8        TAY
  $8311  A5 E8     LDA $E8
  $8313  30 0F     BMI $8324
  $8315  A2 FF     LDX #$FF

L_8317:
  $8317  E8        INX
  $8318  E4 F4     CPX $F4
  $831A  F0 0F     BEQ $832B
  $831C  88        DEY
  $831D  D0 F8     BNE $8317
  $831F  86 F4     STX $F4
  $8321  4C 2B 83  JMP $832B

L_8324:
  $8324  C6 F4     DEC $F4
  $8326  F0 03     BEQ $832B
  $8328  88        DEY
  $8329  D0 F9     BNE $8324

L_832B:
  $832B  A9 02     LDA #$02
  $832D  C5 EE     CMP $EE
  $832F  F0 4B     BEQ $837C
  $8331  A0 0D     LDY #$0D
  $8333  B1 EC     LDA ($EC),Y
  $8335  AA        TAX
  $8336  29 7F     AND #$7F
  $8338  F0 42     BEQ $837C
  $833A  C8        INY
  $833B  D1 EC     CMP ($EC),Y
  $833D  F0 08     BEQ $8347
  $833F  C8        INY
  $8340  B1 EC     LDA ($EC),Y
  $8342  29 0F     AND #$0F
  $8344  4C 6C 83  JMP $836C

L_8347:
  $8347  A9 00     LDA #$00
  $8349  91 EC     STA ($EC),Y
  $834B  C8        INY
  $834C  B1 EC     LDA ($EC),Y
  $834E  4A        LSR
  $834F  4A        LSR
  $8350  4A        LSR
  $8351  4A        LSR
  $8352  85 F5     STA $F5
  $8354  8A        TXA
  $8355  10 07     BPL $835E
  $8357  A9 00     LDA #$00
  $8359  38        SEC
  $835A  E5 F5     SBC $F5
  $835C  85 F5     STA $F5

L_835E:
  $835E  B1 EC     LDA ($EC),Y
  $8360  29 0F     AND #$0F
  $8362  18        CLC
  $8363  65 F5     ADC $F5
  $8365  10 05     BPL $836C
  $8367  A9 00     LDA #$00
  $8369  4C 72 83  JMP $8372

L_836C:
  $836C  C5 F4     CMP $F4
  $836E  90 02     BCC $8372
  $8370  A5 F4     LDA $F4

L_8372:
  $8372  85 F4     STA $F4
  $8374  B1 EC     LDA ($EC),Y
  $8376  29 F0     AND #$F0
  $8378  05 F4     ORA $F4
  $837A  91 EC     STA ($EC),Y

L_837C:
  $837C  A5 EF     LDA $EF
  $837E  4A        LSR
  $837F  B0 07     BCS $8388
  $8381  A9 0C     LDA #$0C
  $8383  85 F5     STA $F5
  $8385  4C 8F 83  JMP $838F

L_8388:
  $8388  A9 09     LDA #$09
  $838A  85 F5     STA $F5
  $838C  4C FE 83  JMP $83FE

L_838F:
  $838F  A0 16     LDY #$16
  $8391  B1 EC     LDA ($EC),Y
  $8393  29 7F     AND #$7F
  $8395  F0 3E     BEQ $83D5
  $8397  A0 1D     LDY #$1D
  $8399  D1 EC     CMP ($EC),Y
  $839B  F0 03     BEQ $83A0
  $839D  4C CB 83  JMP $83CB

L_83A0:
  $83A0  A9 00     LDA #$00
  $83A2  91 EC     STA ($EC),Y
  $83A4  A0 17     LDY #$17
  $83A6  B1 EC     LDA ($EC),Y

L_83A8:
  $83A8  A0 1E     LDY #$1E
  $83AA  18        CLC
  $83AB  71 EC     ADC ($EC),Y
  $83AD  F0 02     BEQ $83B1
  $83AF  10 07     BPL $83B8

L_83B1:
  $83B1  A9 01     LDA #$01
  $83B3  91 EC     STA ($EC),Y
  $83B5  4C C2 83  JMP $83C2

L_83B8:
  $83B8  91 EC     STA ($EC),Y
  $83BA  C9 10     CMP #$10
  $83BC  90 0D     BCC $83CB
  $83BE  A9 0F     LDA #$0F
  $83C0  91 EC     STA ($EC),Y

L_83C2:
  $83C2  A9 00     LDA #$00
  $83C4  A0 17     LDY #$17
  $83C6  38        SEC
  $83C7  F1 EC     SBC ($EC),Y
  $83C9  91 EC     STA ($EC),Y

L_83CB:
  $83CB  A0 1E     LDY #$1E
  $83CD  B1 EC     LDA ($EC),Y
  $83CF  C5 F4     CMP $F4
  $83D1  B0 02     BCS $83D5
  $83D3  85 F4     STA $F4

L_83D5:
  $83D5  A0 02     LDY #$02
  $83D7  C4 EE     CPY $EE
  $83D9  F0 0D     BEQ $83E8
  $83DB  A5 F5     LDA $F5
  $83DD  29 7F     AND #$7F
  $83DF  A8        TAY
  $83E0  B1 EC     LDA ($EC),Y
  $83E2  29 F0     AND #$F0
  $83E4  05 F4     ORA $F4
  $83E6  85 F4     STA $F4

L_83E8:
  $83E8  A6 EB     LDX $EB
  $83EA  A5 F4     LDA $F4
  $83EC  9D 00 40  STA $4000,X
  $83EF  A5 F5     LDA $F5
  $83F1  10 07     BPL $83FA
  $83F3  A9 90     LDA #$90
  $83F5  85 F5     STA $F5
  $83F7  4C FE 83  JMP $83FE

L_83FA:
  $83FA  A9 09     LDA #$09
  $83FC  85 F5     STA $F5

L_83FE:
  $83FE  A5 F5     LDA $F5
  $8400  29 7F     AND #$7F
  $8402  A8        TAY
  $8403  A2 00     LDX #$00
  $8405  B1 EC     LDA ($EC),Y
  $8407  F0 0F     BEQ $8418
  $8409  10 01     BPL $840C
  $840B  CA        DEX

L_840C:
  $840C  C8        INY
  $840D  18        CLC
  $840E  71 EC     ADC ($EC),Y
  $8410  91 EC     STA ($EC),Y
  $8412  8A        TXA
  $8413  C8        INY
  $8414  71 EC     ADC ($EC),Y
  $8416  91 EC     STA ($EC),Y

L_8418:
  $8418  A5 F5     LDA $F5
  $841A  30 06     BMI $8422
  $841C  A5 EF     LDA $EF
  $841E  4A        LSR
  $841F  90 01     BCC $8422
  $8421  60        RTS

L_8422:
  $8422  A0 14     LDY #$14
  $8424  B1 EC     LDA ($EC),Y
  $8426  29 7F     AND #$7F
  $8428  D0 03     BNE $842D
  $842A  4C A9 84  JMP $84A9

L_842D:
  $842D  A0 18     LDY #$18
  $842F  D1 EC     CMP ($EC),Y
  $8431  F0 03     BEQ $8436
  $8433  4C A9 84  JMP $84A9

L_8436:
  $8436  A9 00     LDA #$00
  $8438  91 EC     STA ($EC),Y
  $843A  AA        TAX
  $843B  A0 15     LDY #$15
  $843D  B1 EC     LDA ($EC),Y
  $843F  2A        ROL
  $8440  2A        ROL
  $8441  2A        ROL
  $8442  2A        ROL
  $8443  29 07     AND #$07
  $8445  85 F4     STA $F4
  $8447  A0 19     LDY #$19
  $8449  B1 EC     LDA ($EC),Y
  $844B  0A        ASL
  $844C  90 08     BCC $8456
  $844E  A9 00     LDA #$00
  $8450  38        SEC
  $8451  E5 F4     SBC $F4
  $8453  85 F4     STA $F4
  $8455  CA        DEX

L_8456:
  $8456  A5 F4     LDA $F4
  $8458  18        CLC
  $8459  A0 1A     LDY #$1A
  $845B  71 EC     ADC ($EC),Y
  $845D  91 EC     STA ($EC),Y
  $845F  C8        INY
  $8460  8A        TXA
  $8461  71 EC     ADC ($EC),Y
  $8463  91 EC     STA ($EC),Y
  $8465  A0 15     LDY #$15
  $8467  B1 EC     LDA ($EC),Y
  $8469  29 1F     AND #$1F
  $846B  85 F4     STA $F4
  $846D  A0 19     LDY #$19
  $846F  B1 EC     LDA ($EC),Y
  $8471  18        CLC
  $8472  69 01     ADC #$01
  $8474  91 EC     STA ($EC),Y
  $8476  29 7F     AND #$7F
  $8478  C5 F4     CMP $F4
  $847A  D0 2D     BNE $84A9
  $847C  B1 EC     LDA ($EC),Y
  $847E  29 80     AND #$80
  $8480  91 EC     STA ($EC),Y
  $8482  A0 14     LDY #$14
  $8484  B1 EC     LDA ($EC),Y
  $8486  0A        ASL
  $8487  B0 1A     BCS $84A3
  $8489  B1 EC     LDA ($EC),Y
  $848B  09 80     ORA #$80
  $848D  91 EC     STA ($EC),Y
  $848F  A0 19     LDY #$19
  $8491  B1 EC     LDA ($EC),Y
  $8493  10 07     BPL $849C
  $8495  29 7F     AND #$7F
  $8497  91 EC     STA ($EC),Y
  $8499  4C A9 84  JMP $84A9

L_849C:
  $849C  09 80     ORA #$80
  $849E  91 EC     STA ($EC),Y
  $84A0  4C A9 84  JMP $84A9

L_84A3:
  $84A3  B1 EC     LDA ($EC),Y
  $84A5  29 7F     AND #$7F
  $84A7  91 EC     STA ($EC),Y

L_84A9:
  $84A9  A5 F5     LDA $F5
  $84AB  29 7F     AND #$7F
  $84AD  85 F5     STA $F5
  $84AF  E6 F5     INC $F5
  $84B1  A0 1A     LDY #$1A
  $84B3  B1 EC     LDA ($EC),Y
  $84B5  A4 F5     LDY $F5
  $84B7  18        CLC
  $84B8  71 EC     ADC ($EC),Y
  $84BA  AA        TAX
  $84BB  A0 1B     LDY #$1B
  $84BD  B1 EC     LDA ($EC),Y
  $84BF  E6 F5     INC $F5
  $84C1  A4 F5     LDY $F5
  $84C3  71 EC     ADC ($EC),Y
  $84C5  A8        TAY
  $84C6  A9 01     LDA #$01
  $84C8  C5 EE     CMP $EE
  $84CA  D0 19     BNE $84E5
  $84CC  A9 0F     LDA #$0F
  $84CE  8D 15 40  STA $4015
  $84D1  8A        TXA
  $84D2  29 0F     AND #$0F
  $84D4  AA        TAX
  $84D5  E6 F5     INC $F5
  $84D7  A4 F5     LDY $F5
  $84D9  B1 EC     LDA ($EC),Y
  $84DB  29 80     AND #$80
  $84DD  85 F4     STA $F4
  $84DF  8A        TXA
  $84E0  05 F4     ORA $F4
  $84E2  AA        TAX
  $84E3  A0 00     LDY #$00

L_84E5:
  $84E5  8A        TXA
  $84E6  A6 EB     LDX $EB
  $84E8  E8        INX
  $84E9  E8        INX
  $84EA  9D 00 40  STA $4000,X
  $84ED  98        TYA
  $84EE  A0 1C     LDY #$1C
  $84F0  D1 EC     CMP ($EC),Y
  $84F2  D0 01     BNE $84F5
  $84F4  60        RTS

L_84F5:
  $84F5  91 EC     STA ($EC),Y
  $84F7  09 08     ORA #$08
  $84F9  9D 01 40  STA $4001,X
  $84FC  60        RTS

L_84FD:
  $84FD  A0 01     LDY #$01
  $84FF  C4 EE     CPY $EE
  $8501  D0 06     BNE $8509
  $8503  A9 07     LDA #$07
  $8505  8D 15 40  STA $4015
  $8508  60        RTS

L_8509:
  $8509  A9 00     LDA #$00
  $850B  A6 EB     LDX $EB
  $850D  E8        INX
  $850E  E8        INX
  $850F  9D 00 40  STA $4000,X
  $8512  9D 01 40  STA $4001,X
  $8515  60        RTS

L_8516:
  $8516  A0 14     LDY #$14
  $8518  B1 EC     LDA ($EC),Y
  $851A  29 7F     AND #$7F
  $851C  91 EC     STA ($EC),Y
  $851E  A0 16     LDY #$16
  $8520  B1 EC     LDA ($EC),Y
  $8522  0A        ASL
  $8523  90 10     BCC $8535
  $8525  A4 F4     LDY $F4
  $8527  B1 EC     LDA ($EC),Y
  $8529  A2 02     LDX #$02
  $852B  E4 EE     CPX $EE
  $852D  F0 02     BEQ $8531
  $852F  29 0F     AND #$0F

L_8531:
  $8531  A0 1E     LDY #$1E
  $8533  91 EC     STA ($EC),Y

L_8535:
  $8535  A2 06     LDX #$06
  $8537  A9 00     LDA #$00
  $8539  A0 18     LDY #$18

L_853B:
  $853B  91 EC     STA ($EC),Y
  $853D  C8        INY
  $853E  CA        DEX
  $853F  D0 FA     BNE $853B
  $8541  A9 FF     LDA #$FF
  $8543  A0 1C     LDY #$1C
  $8545  91 EC     STA ($EC),Y
  $8547  60        RTS

L_8548:
  $8548  A0 1C     LDY #$1C
  $854A  B1 EC     LDA ($EC),Y
  $854C  48        PHA
  $854D  20 16 85  JSR $8516
  $8550  68        PLA
  $8551  A0 1C     LDY #$1C
  $8553  91 EC     STA ($EC),Y
  $8555  60        RTS

L_8556:
  $8556  8A        TXA
  $8557  0A        ASL
  $8558  A8        TAY
  $8559  C8        INY
  $855A  68        PLA
  $855B  85 F4     STA $F4
  $855D  68        PLA
  $855E  85 F5     STA $F5
  $8560  B1 F4     LDA ($F4),Y
  $8562  AA        TAX
  $8563  C8        INY
  $8564  B1 F4     LDA ($F4),Y
  $8566  85 F5     STA $F5
  $8568  86 F4     STX $F4
  $856A  6C F4 00  JMP ($00F4)

L_856D:
  $856D  A5 F2     LDA $F2
  $856F  D0 03     BNE $8574
  $8571  4C 92 85  JMP $8592

L_8574:
  $8574  A0 11     LDY #$11
  $8576  B1 EC     LDA ($EC),Y
  $8578  C8        INY
  $8579  11 EC     ORA ($EC),Y
  $857B  D0 01     BNE $857E
  $857D  60        RTS

L_857E:
  $857E  C8        INY
  $857F  B1 EC     LDA ($EC),Y
  $8581  A0 02     LDY #$02
  $8583  C4 EE     CPY $EE
  $8585  F0 02     BEQ $8589
  $8587  29 0F     AND #$0F

L_8589:
  $8589  85 F4     STA $F4
  $858B  A9 93     LDA #$93
  $858D  85 F5     STA $F5
  $858F  4C 8F 83  JMP $838F

L_8592:
  $8592  20 A0 86  JSR $86A0
  $8595  0A        ASL
  $8596  B0 03     BCS $859B
  $8598  4C C2 85  JMP $85C2

L_859B:
  $859B  8A        TXA
  $859C  29 0F     AND #$0F
  $859E  C9 0F     CMP #$0F
  $85A0  D0 06     BNE $85A8
  $85A2  20 A0 86  JSR $86A0
  $85A5  4C 48 85  JMP $8548

L_85A8:
  $85A8  29 07     AND #$07
  $85AA  85 F4     STA $F4
  $85AC  20 A0 86  JSR $86A0
  $85AF  A0 11     LDY #$11
  $85B1  91 EC     STA ($EC),Y
  $85B3  C8        INY
  $85B4  A5 F4     LDA $F4
  $85B6  91 EC     STA ($EC),Y
  $85B8  A9 13     LDA #$13
  $85BA  85 F4     STA $F4
  $85BC  20 16 85  JSR $8516
  $85BF  4C FD 84  JMP $84FD

L_85C2:
  $85C2  20 56 85  JSR $8556
  $85C5  D3        .db $D3
  $85C6  85 DB     STA $DB
  $85C8  85 E5     STA $E5
  $85CA  85 F5     STA $F5
  $85CC  85 0F     STA $0F
  $85CE  86 40     STX $40
  $85D0  86 56     STX $56
  $85D2  86 20     STX $20
  $85D4  A0 86     LDY #$86
  $85D6  85 F2     STA $F2
  $85D8  4C 92 85  JMP $8592
  $85DB  20 A0 86  JSR $86A0
  $85DE  A0 10     LDY #$10
  $85E0  91 EC     STA ($EC),Y
  $85E2  4C 92 85  JMP $8592
  $85E5  20 A0 86  JSR $86A0
  $85E8  85 F4     STA $F4
  $85EA  A0 13     LDY #$13
  $85EC  B1 EC     LDA ($EC),Y
  $85EE  29 3F     AND #$3F
  $85F0  05 F4     ORA $F4
  $85F2  4C 08 86  JMP $8608
  $85F5  20 A0 86  JSR $86A0
  $85F8  A0 02     LDY #$02
  $85FA  C4 EE     CPY $EE
  $85FC  F0 0A     BEQ $8608
  $85FE  85 F4     STA $F4
  $8600  A0 13     LDY #$13
  $8602  B1 EC     LDA ($EC),Y
  $8604  29 C0     AND #$C0
  $8606  05 F4     ORA $F4

L_8608:
  $8608  A0 13     LDY #$13
  $860A  91 EC     STA ($EC),Y
  $860C  4C 92 85  JMP $8592
  $860F  20 A0 86  JSR $86A0
  $8612  8A        TXA
  $8613  F0 06     BEQ $861B
  $8615  E4 F3     CPX $F3
  $8617  F0 13     BEQ $862C
  $8619  E6 F3     INC $F3

L_861B:
  $861B  20 A0 86  JSR $86A0
  $861E  85 F4     STA $F4
  $8620  20 A0 86  JSR $86A0
  $8623  85 F1     STA $F1
  $8625  A5 F4     LDA $F4
  $8627  85 F0     STA $F0
  $8629  4C 92 85  JMP $8592

L_862C:
  $862C  A9 00     LDA #$00
  $862E  85 F3     STA $F3
  $8630  A9 02     LDA #$02
  $8632  18        CLC
  $8633  65 F0     ADC $F0
  $8635  85 F0     STA $F0
  $8637  A9 00     LDA #$00
  $8639  65 F1     ADC $F1
  $863B  85 F1     STA $F1
  $863D  4C 92 85  JMP $8592
  $8640  A9 14     LDA #$14
  $8642  85 F4     STA $F4

L_8644:
  $8644  20 A0 86  JSR $86A0
  $8647  A4 F4     LDY $F4
  $8649  91 EC     STA ($EC),Y
  $864B  E6 F4     INC $F4
  $864D  A4 F4     LDY $F4
  $864F  C0 18     CPY #$18
  $8651  D0 F1     BNE $8644
  $8653  4C 92 85  JMP $8592
  $8656  A5 F0     LDA $F0
  $8658  38        SEC
  $8659  E9 01     SBC #$01
  $865B  85 F0     STA $F0
  $865D  A5 F1     LDA $F1
  $865F  E9 00     SBC #$00
  $8661  85 F1     STA $F1
  $8663  A5 E0     LDA $E0
  $8665  29 0F     AND #$0F
  $8667  85 E0     STA $E0
  $8669  A9 00     LDA #$00
  $866B  85 E1     STA $E1
  $866D  A5 EF     LDA $EF
  $866F  29 FE     AND #$FE
  $8671  85 EF     STA $EF
  $8673  A0 0A     LDY #$0A
  $8675  B1 EC     LDA ($EC),Y
  $8677  C8        INY
  $8678  11 EC     ORA ($EC),Y
  $867A  D0 13     BNE $868F
  $867C  A6 EB     LDX $EB
  $867E  E8        INX
  $867F  E8        INX
  $8680  A4 EE     LDY $EE
  $8682  20 22 82  JSR $8222
  $8685  A0 00     LDY #$00
  $8687  B1 EC     LDA ($EC),Y
  $8689  C8        INY
  $868A  11 EC     ORA ($EC),Y
  $868C  D0 01     BNE $868F
  $868E  60        RTS

L_868F:
  $868F  A0 06     LDY #$06
  $8691  B1 EC     LDA ($EC),Y
  $8693  29 1F     AND #$1F
  $8695  AA        TAX
  $8696  20 E1 88  JSR $88E1
  $8699  A9 0C     LDA #$0C
  $869B  85 F4     STA $F4
  $869D  4C 16 85  JMP $8516

L_86A0:
  $86A0  A0 00     LDY #$00
  $86A2  B1 F0     LDA ($F0),Y
  $86A4  AA        TAX
  $86A5  A9 01     LDA #$01
  $86A7  18        CLC
  $86A8  65 F0     ADC $F0
  $86AA  85 F0     STA $F0
  $86AC  A9 00     LDA #$00
  $86AE  65 F1     ADC $F1
  $86B0  85 F1     STA $F1
  $86B2  8A        TXA
  $86B3  60        RTS

L_86B4:
  $86B4  A5 E7     LDA $E7
  $86B6  F0 0B     BEQ $86C3

L_86B8:
  $86B8  48        PHA
  $86B9  20 C3 86  JSR $86C3
  $86BC  68        PLA
  $86BD  38        SEC
  $86BE  E9 01     SBC #$01
  $86C0  D0 F6     BNE $86B8
  $86C2  60        RTS

L_86C3:
  $86C3  A0 05     LDY #$05
  $86C5  B1 EC     LDA ($EC),Y
  $86C7  0A        ASL
  $86C8  90 09     BCC $86D3
  $86CA  A5 EA     LDA $EA
  $86CC  29 01     AND #$01
  $86CE  F0 03     BEQ $86D3
  $86D0  20 D3 86  JSR $86D3

L_86D3:
  $86D3  A0 02     LDY #$02
  $86D5  B1 EC     LDA ($EC),Y
  $86D7  C8        INY
  $86D8  11 EC     ORA ($EC),Y
  $86DA  F0 22     BEQ $86FE
  $86DC  A2 FF     LDX #$FF
  $86DE  88        DEY
  $86DF  B1 EC     LDA ($EC),Y
  $86E1  38        SEC
  $86E2  E9 04     SBC #$04
  $86E4  91 EC     STA ($EC),Y
  $86E6  8A        TXA
  $86E7  C8        INY
  $86E8  71 EC     ADC ($EC),Y
  $86EA  91 EC     STA ($EC),Y
  $86EC  88        DEY
  $86ED  11 EC     ORA ($EC),Y
  $86EF  F0 0D     BEQ $86FE
  $86F1  A0 0A     LDY #$0A
  $86F3  B1 EC     LDA ($EC),Y
  $86F5  C8        INY
  $86F6  11 EC     ORA ($EC),Y
  $86F8  D0 01     BNE $86FB
  $86FA  60        RTS

L_86FB:
  $86FB  4C EC 82  JMP $82EC

L_86FE:
  $86FE  A0 05     LDY #$05
  $8700  B1 EC     LDA ($EC),Y
  $8702  29 7F     AND #$7F
  $8704  91 EC     STA ($EC),Y

L_8706:
  $8706  20 35 89  JSR $8935
  $8709  29 F0     AND #$F0
  $870B  D0 03     BNE $8710
  $870D  4C C0 87  JMP $87C0

L_8710:
  $8710  C9 20     CMP #$20
  $8712  D0 0B     BNE $871F
  $8714  8A        TXA
  $8715  29 07     AND #$07
  $8717  48        PHA
  $8718  20 06 87  JSR $8706
  $871B  68        PLA
  $871C  4C A2 87  JMP $87A2

L_871F:
  $871F  C9 30     CMP #$30
  $8721  D0 03     BNE $8726
  $8723  4C B5 87  JMP $87B5

L_8726:
  $8726  8A        TXA
  $8727  2A        ROL
  $8728  2A        ROL
  $8729  2A        ROL
  $872A  2A        ROL
  $872B  29 07     AND #$07
  $872D  A8        TAY
  $872E  B9 75 89  LDA $8975,Y
  $8731  20 54 89  JSR $8954

L_8734:
  $8734  A0 06     LDY #$06
  $8736  B1 EC     LDA ($EC),Y
  $8738  29 E0     AND #$E0
  $873A  F0 16     BEQ $8752
  $873C  38        SEC
  $873D  E9 20     SBC #$20
  $873F  85 F4     STA $F4
  $8741  B1 EC     LDA ($EC),Y
  $8743  29 1F     AND #$1F
  $8745  05 F4     ORA $F4
  $8747  91 EC     STA ($EC),Y
  $8749  A5 EF     LDA $EF
  $874B  4A        LSR
  $874C  90 01     BCC $874F
  $874E  60        RTS

L_874F:
  $874F  4C 48 85  JMP $8548

L_8752:
  $8752  8A        TXA
  $8753  29 1F     AND #$1F
  $8755  D0 04     BNE $875B
  $8757  AA        TAX
  $8758  4C 7D 87  JMP $877D

L_875B:
  $875B  A0 01     LDY #$01
  $875D  C4 EE     CPY $EE
  $875F  D0 05     BNE $8766
  $8761  A2 00     LDX #$00
  $8763  4C 7D 87  JMP $877D

L_8766:
  $8766  0A        ASL
  $8767  A0 07     LDY #$07
  $8769  18        CLC
  $876A  71 EC     ADC ($EC),Y
  $876C  85 F4     STA $F4
  $876E  A9 00     LDA #$00
  $8770  C8        INY
  $8771  71 EC     ADC ($EC),Y
  $8773  85 F5     STA $F5
  $8775  A0 01     LDY #$01
  $8777  B1 F4     LDA ($F4),Y
  $8779  AA        TAX
  $877A  88        DEY
  $877B  B1 F4     LDA ($F4),Y

L_877D:
  $877D  A0 0A     LDY #$0A
  $877F  91 EC     STA ($EC),Y
  $8781  C8        INY
  $8782  8A        TXA
  $8783  91 EC     STA ($EC),Y
  $8785  A0 0D     LDY #$0D
  $8787  B1 EC     LDA ($EC),Y
  $8789  85 F4     STA $F4
  $878B  29 7F     AND #$7F
  $878D  F0 03     BEQ $8792
  $878F  20 A9 88  JSR $88A9

L_8792:
  $8792  A5 EF     LDA $EF
  $8794  4A        LSR
  $8795  90 01     BCC $8798
  $8797  60        RTS

L_8798:
  $8798  A9 0C     LDA #$0C
  $879A  85 F4     STA $F4
  $879C  20 16 85  JSR $8516
  $879F  4C FD 84  JMP $84FD

L_87A2:
  $87A2  6A        ROR
  $87A3  6A        ROR
  $87A4  6A        ROR
  $87A5  6A        ROR
  $87A6  29 E0     AND #$E0
  $87A8  85 F4     STA $F4
  $87AA  A0 06     LDY #$06
  $87AC  B1 EC     LDA ($EC),Y
  $87AE  29 1F     AND #$1F
  $87B0  05 F4     ORA $F4
  $87B2  91 EC     STA ($EC),Y
  $87B4  60        RTS

L_87B5:
  $87B5  A9 80     LDA #$80
  $87B7  A0 05     LDY #$05
  $87B9  11 EC     ORA ($EC),Y
  $87BB  91 EC     STA ($EC),Y
  $87BD  4C 06 87  JMP $8706

L_87C0:
  $87C0  20 56 85  JSR $8556
  $87C3  D7        .db $D7
  $87C4  87        .db $87
  $87C5  E1 87     SBC ($87,X)
  $87C7  EB        .db $EB
  $87C8  87        .db $87
  $87C9  FB        .db $FB
  $87CA  87        .db $87
  $87CB  15 88     ORA $88,X
  $87CD  5D 88 7A  EOR $7A88,X
  $87D0  88        DEY
  $87D1  8D 88 C7  STA $C788
  $87D4  88        DEY
  $87D5  17        .db $17
  $87D6  89        .db $89
  $87D7  20 35 89  JSR $8935
  $87DA  A0 04     LDY #$04
  $87DC  91 EC     STA ($EC),Y
  $87DE  4C 06 87  JMP $8706
  $87E1  20 35 89  JSR $8935
  $87E4  A0 09     LDY #$09
  $87E6  91 EC     STA ($EC),Y
  $87E8  4C 06 87  JMP $8706
  $87EB  20 35 89  JSR $8935
  $87EE  85 F4     STA $F4
  $87F0  A0 0C     LDY #$0C
  $87F2  B1 EC     LDA ($EC),Y
  $87F4  29 3F     AND #$3F
  $87F6  05 F4     ORA $F4
  $87F8  4C 0E 88  JMP $880E
  $87FB  20 35 89  JSR $8935
  $87FE  A0 02     LDY #$02
  $8800  C4 EE     CPY $EE
  $8802  F0 0A     BEQ $880E
  $8804  85 F4     STA $F4
  $8806  A0 0C     LDY #$0C
  $8808  B1 EC     LDA ($EC),Y
  $880A  29 C0     AND #$C0
  $880C  05 F4     ORA $F4

L_880E:
  $880E  A0 0C     LDY #$0C
  $8810  91 EC     STA ($EC),Y
  $8812  4C 06 87  JMP $8706
  $8815  20 35 89  JSR $8935
  $8818  8A        TXA
  $8819  F0 16     BEQ $8831
  $881B  A0 05     LDY #$05
  $881D  B1 EC     LDA ($EC),Y
  $881F  29 7F     AND #$7F
  $8821  85 F4     STA $F4
  $8823  E4 F4     CPX $F4
  $8825  F0 1D     BEQ $8844
  $8827  E6 F4     INC $F4
  $8829  B1 EC     LDA ($EC),Y
  $882B  29 80     AND #$80
  $882D  05 F4     ORA $F4
  $882F  91 EC     STA ($EC),Y

L_8831:
  $8831  20 35 89  JSR $8935
  $8834  48        PHA
  $8835  20 35 89  JSR $8935
  $8838  68        PLA
  $8839  A0 00     LDY #$00
  $883B  91 EC     STA ($EC),Y
  $883D  C8        INY
  $883E  8A        TXA
  $883F  91 EC     STA ($EC),Y
  $8841  4C 06 87  JMP $8706

L_8844:
  $8844  B1 EC     LDA ($EC),Y
  $8846  29 80     AND #$80
  $8848  91 EC     STA ($EC),Y
  $884A  A0 00     LDY #$00
  $884C  A9 02     LDA #$02
  $884E  18        CLC
  $884F  71 EC     ADC ($EC),Y
  $8851  91 EC     STA ($EC),Y
  $8853  C8        INY
  $8854  A9 00     LDA #$00
  $8856  71 EC     ADC ($EC),Y
  $8858  91 EC     STA ($EC),Y
  $885A  4C 06 87  JMP $8706
  $885D  20 35 89  JSR $8935

L_8860:
  $8860  A2 85     LDX #$85
  $8862  A0 89     LDY #$89
  $8864  86 F4     STX $F4
  $8866  84 F5     STY $F5
  $8868  0A        ASL
  $8869  A0 07     LDY #$07
  $886B  18        CLC
  $886C  65 F4     ADC $F4
  $886E  91 EC     STA ($EC),Y
  $8870  A9 00     LDA #$00
  $8872  65 F5     ADC $F5
  $8874  C8        INY
  $8875  91 EC     STA ($EC),Y
  $8877  4C 06 87  JMP $8706
  $887A  20 35 89  JSR $8935
  $887D  2A        ROL
  $887E  2A        ROL
  $887F  2A        ROL
  $8880  2A        ROL
  $8881  29 07     AND #$07
  $8883  A8        TAY
  $8884  B9 7D 89  LDA $897D,Y
  $8887  20 54 89  JSR $8954
  $888A  4C 34 87  JMP $8734
  $888D  20 35 89  JSR $8935
  $8890  A0 0D     LDY #$0D
  $8892  91 EC     STA ($EC),Y
  $8894  48        PHA
  $8895  20 35 89  JSR $8935
  $8898  A0 0F     LDY #$0F
  $889A  91 EC     STA ($EC),Y
  $889C  68        PLA
  $889D  85 F4     STA $F4
  $889F  29 7F     AND #$7F
  $88A1  F0 03     BEQ $88A6
  $88A3  20 A9 88  JSR $88A9

L_88A6:
  $88A6  4C 06 87  JMP $8706

L_88A9:
  $88A9  A9 00     LDA #$00
  $88AB  A0 0E     LDY #$0E
  $88AD  91 EC     STA ($EC),Y
  $88AF  A5 F4     LDA $F4
  $88B1  10 05     BPL $88B8
  $88B3  A9 0F     LDA #$0F
  $88B5  4C BA 88  JMP $88BA

L_88B8:
  $88B8  A9 00     LDA #$00

L_88BA:
  $88BA  85 F4     STA $F4
  $88BC  A0 0F     LDY #$0F
  $88BE  B1 EC     LDA ($EC),Y
  $88C0  29 F0     AND #$F0
  $88C2  05 F4     ORA $F4
  $88C4  91 EC     STA ($EC),Y
  $88C6  60        RTS
  $88C7  20 35 89  JSR $8935
  $88CA  85 F4     STA $F4
  $88CC  A0 06     LDY #$06
  $88CE  B1 EC     LDA ($EC),Y
  $88D0  29 E0     AND #$E0
  $88D2  05 F4     ORA $F4
  $88D4  91 EC     STA ($EC),Y
  $88D6  A5 EF     LDA $EF
  $88D8  4A        LSR
  $88D9  B0 03     BCS $88DE
  $88DB  20 E1 88  JSR $88E1

L_88DE:
  $88DE  4C 06 87  JMP $8706

L_88E1:
  $88E1  8A        TXA
  $88E2  F0 08     BEQ $88EC
  $88E4  A9 00     LDA #$00

L_88E6:
  $88E6  18        CLC
  $88E7  69 04     ADC #$04
  $88E9  CA        DEX
  $88EA  D0 FA     BNE $88E6

L_88EC:
  $88EC  18        CLC
  $88ED  6D 7C 05  ADC $057C
  $88F0  85 F4     STA $F4
  $88F2  A9 00     LDA #$00
  $88F4  6D 7D 05  ADC $057D
  $88F7  85 F5     STA $F5
  $88F9  A2 00     LDX #$00
  $88FB  A0 14     LDY #$14

L_88FD:
  $88FD  A1 F4     LDA ($F4,X)
  $88FF  91 EC     STA ($EC),Y
  $8901  C8        INY
  $8902  C0 18     CPY #$18
  $8904  D0 01     BNE $8907
  $8906  60        RTS

L_8907:
  $8907  A9 01     LDA #$01
  $8909  18        CLC
  $890A  65 F4     ADC $F4
  $890C  85 F4     STA $F4
  $890E  A9 00     LDA #$00
  $8910  65 F5     ADC $F5
  $8912  85 F5     STA $F5
  $8914  4C FD 88  JMP $88FD
  $8917  A0 00     LDY #$00
  $8919  A9 00     LDA #$00
  $891B  91 EC     STA ($EC),Y
  $891D  C8        INY
  $891E  91 EC     STA ($EC),Y
  $8920  A5 E0     LDA $E0
  $8922  29 F0     AND #$F0
  $8924  85 E0     STA $E0
  $8926  A5 EF     LDA $EF
  $8928  4A        LSR
  $8929  90 01     BCC $892C
  $892B  60        RTS

L_892C:
  $892C  A6 EB     LDX $EB
  $892E  E8        INX
  $892F  E8        INX
  $8930  A4 EE     LDY $EE
  $8932  4C 22 82  JMP $8222

L_8935:
  $8935  A0 00     LDY #$00
  $8937  B1 EC     LDA ($EC),Y
  $8939  85 F4     STA $F4
  $893B  C8        INY
  $893C  B1 EC     LDA ($EC),Y
  $893E  85 F5     STA $F5
  $8940  88        DEY
  $8941  B1 F4     LDA ($F4),Y
  $8943  AA        TAX
  $8944  A9 01     LDA #$01
  $8946  18        CLC
  $8947  65 F4     ADC $F4
  $8949  91 EC     STA ($EC),Y
  $894B  A9 00     LDA #$00
  $894D  65 F5     ADC $F5
  $894F  C8        INY
  $8950  91 EC     STA ($EC),Y
  $8952  8A        TXA
  $8953  60        RTS

L_8954:
  $8954  85 F4     STA $F4
  $8956  A9 00     LDA #$00
  $8958  85 F5     STA $F5
  $895A  A0 04     LDY #$04
  $895C  B1 EC     LDA ($EC),Y
  $895E  A8        TAY
  $895F  A9 00     LDA #$00

L_8961:
  $8961  18        CLC
  $8962  65 F4     ADC $F4
  $8964  90 02     BCC $8968
  $8966  E6 F5     INC $F5

L_8968:
  $8968  88        DEY
  $8969  D0 F6     BNE $8961
  $896B  A0 02     LDY #$02
  $896D  91 EC     STA ($EC),Y
  $896F  C8        INY
  $8970  A5 F5     LDA $F5
  $8972  91 EC     STA ($EC),Y
  $8974  60        RTS
  $8975  00        BRK
  $8976  00        BRK
  $8977  02        .db $02
  $8978  04        .db $04
  $8979  08        PHP
  $897A  10 20     BPL $899C
  $897C  40        RTI
  $897D  00        BRK
  $897E  00        BRK
  $897F  03        .db $03
  $8980  06 0C     ASL $0C
  $8982  18        CLC
  $8983  30 60     BMI $89E5
  $8985  00        BRK
  $8986  00        BRK
  $8987  00        BRK
  $8988  00        BRK
  $8989  00        BRK
  $898A  00        BRK
  $898B  00        BRK
  $898C  00        BRK
  $898D  00        BRK
  $898E  00        BRK
  $898F  00        BRK
  $8990  00        BRK
  $8991  00        BRK
  $8992  00        BRK
  $8993  00        BRK
  $8994  00        BRK
  $8995  00        BRK
  $8996  00        BRK
  $8997  F2        .db $F2
  $8998  07        .db $07
  $8999  D6 07     DEC $07,X
  $899B  14        .db $14

L_899C:
  $899C  07        .db $07
  $899D  AE 06 4E  LDX $4E06
  $89A0  06 F3     ASL $F3
  $89A2  05 94     ORA $94
  $89A4  05 4D     ORA $4D
  $89A6  05 01     ORA $01
  $89A8  05 BB     ORA $BB
  $89AA  04        .db $04
  $89AB  75 04     ADC $04,X
  $89AD  36 04     ROL $04,X
  $89AF  F9 03 BF  SBC $BF03,Y
  $89B2  03        .db $03
  $89B3  8A        TXA
  $89B4  03        .db $03
  $89B5  57        .db $57
  $89B6  03        .db $03
  $89B7  27        .db $27
  $89B8  03        .db $03
  $89B9  FA        .db $FA
  $89BA  02        .db $02
  $89BB  CF        .db $CF
  $89BC  02        .db $02
  $89BD  A7        .db $A7
  $89BE  02        .db $02
  $89BF  81 02     STA ($02,X)
  $89C1  5D 02 3B  EOR $3B02,X
  $89C4  02        .db $02
  $89C5  1A        .db $1A
  $89C6  02        .db $02
  $89C7  FC        .db $FC
  $89C8  01 E0     ORA ($E0,X)
  $89CA  01 C5     ORA ($C5,X)
  $89CC  01 AB     ORA ($AB,X)
  $89CE  01 93     ORA ($93,X)
  $89D0  01 7D     ORA ($7D,X)
  $89D2  01 67     ORA ($67,X)
  $89D4  01 53     ORA ($53,X)
  $89D6  01 40     ORA ($40,X)
  $89D8  01 2E     ORA ($2E,X)
  $89DA  01 1D     ORA ($1D,X)
  $89DC  01 0D     ORA ($0D,X)

L_89DE:
  $89DE  01 FE     ORA ($FE,X)
  $89E0  00        BRK
  $89E1  F0 00     BEQ $89E3

L_89E3:
  $89E3  E2        .db $E2
  $89E4  00        BRK

L_89E5:
  $89E5  D5 00     CMP $00,X
  $89E7  C9 00     CMP #$00
  $89E9  BE 00 B3  LDX $B300,Y
  $89EC  00        BRK
  $89ED  A9 00     LDA #$00
  $89EF  A0 00     LDY #$00
  $89F1  97        .db $97
  $89F2  00        BRK
  $89F3  8E 00 86  STX $8600
  $89F6  00        BRK
  $89F7  7F        .db $7F
  $89F8  00        BRK
  $89F9  78        SEI
  $89FA  00        BRK
  $89FB  71 00     ADC ($00),Y
  $89FD  6A        ROR
  $89FE  00        BRK
  $89FF  64        .db $64
  $8A00  00        BRK
  $8A01  5F        .db $5F
  $8A02  00        BRK
  $8A03  59 00 54  EOR $5400,Y
  $8A06  00        BRK
  $8A07  50 00     BVC $8A09

L_8A09:
  $8A09  4B        .db $4B
  $8A0A  00        BRK
  $8A0B  47        .db $47
  $8A0C  00        BRK
  $8A0D  43        .db $43
  $8A0E  00        BRK
  $8A0F  3F        .db $3F
  $8A10  00        BRK
  $8A11  3C        .db $3C
  $8A12  00        BRK
  $8A13  38        SEC
  $8A14  00        BRK
  $8A15  35 00     AND $00,X
  $8A17  32        .db $32
  $8A18  00        BRK
  $8A19  2F        .db $2F
  $8A1A  00        BRK
  $8A1B  2C 00 2A  BIT $2A00
  $8A1E  00        BRK
  $8A1F  28        PLP
  $8A20  00        BRK
  $8A21  25 00     AND $00
  $8A23  23        .db $23
  $8A24  00        BRK
  $8A25  21 00     AND ($00,X)
  $8A27  1F        .db $1F
  $8A28  00        BRK
  $8A29  1E 00 1C  ASL $1C00,X
  $8A2C  00        BRK
  $8A2D  1A        .db $1A
  $8A2E  00        BRK
  $8A2F  19 00 17  ORA $1700,Y
  $8A32  00        BRK
  $8A33  16 00     ASL $00,X
  $8A35  15 00     ORA $00,X
  $8A37  14        .db $14
  $8A38  00        BRK
  $8A39  12        .db $12
  $8A3A  00        BRK
  $8A3B  11 00     ORA ($00),Y
  $8A3D  10 00     BPL $8A3F

L_8A3F:
  $8A3F  0F        .db $0F
  $8A40  00        BRK
  $8A41  0F        .db $0F
  $8A42  00        BRK
  $8A43  0E 00 FF  ASL $FF00
  $8A46  FF        .db $FF
  $8A47  FF        .db $FF
  $8A48  FF        .db $FF
  $8A49  FF        .db $FF
  $8A4A  FF        .db $FF
  $8A4B  FF        .db $FF
  $8A4C  FF        .db $FF
  $8A4D  FF        .db $FF
  $8A4E  FF        .db $FF
  $8A4F  FF        .db $FF
  $8A50  D6 8A     DEC $8A,X
  $8A52  1D 8E C8  ORA $C88E,X
  $8A55  90 87     BCC $89DE
  $8A57  94 98     STY $98,X
  $8A59  96 42     STX $42,Y
  $8A5B  9A        TXS
  $8A5C  48        PHA
  $8A5D  9E        .db $9E
  $8A5E  91 A1     STA ($A1),Y
  $8A60  A8        TAY
  $8A61  A4 60     LDY $60
  $8A63  A9 A0     LDA #$A0
  $8A65  AB        .db $AB
  $8A66  58        CLI
  $8A67  AC 14 AE  LDY $AE14
  $8A6A  F4        .db $F4
  $8A6B  AE B4 B1  LDX $B1B4
  $8A6E  57        .db $57
  $8A6F  B3        .db $B3
  $8A70  D5 B3     CMP $B3,X
  $8A72  A6 B4     LDX $B4
  $8A74  53        .db $53
  $8A75  B5 8E     LDA $8E,X
  $8A77  B5 DC     LDA $DC,X
  $8A79  B6 EA     LDX $EA,Y
  $8A7B  B9 52 BA  LDA $BA52,Y
  $8A7E  ED BA 57  SBC $57BA
  $8A81  B3        .db $B3
  $8A82  57        .db $57
  $8A83  B3        .db $B3
  $8A84  57        .db $57
  $8A85  B3        .db $B3
  $8A86  57        .db $57
  $8A87  B3        .db $B3
  $8A88  57        .db $57
  $8A89  B3        .db $B3
  $8A8A  57        .db $57
  $8A8B  B3        .db $B3
  $8A8C  57        .db $57
  $8A8D  B3        .db $B3
  $8A8E  57        .db $57
  $8A8F  B3        .db $B3
  $8A90  57        .db $57
  $8A91  B3        .db $B3
  $8A92  22        .db $22
  $8A93  BB        .db $BB
  $8A94  5B        .db $5B
  $8A95  BB        .db $BB
  $8A96  8E BB B6  STX $B6BB
  $8A99  BB        .db $BB
  $8A9A  C8        INY
  $8A9B  BB        .db $BB
  $8A9C  D5 BB     CMP $BB,X
  $8A9E  03        .db $03
  $8A9F  BC 2D BC  LDY $BC2D,X
  $8AA2  4C BC 62  JMP $62BC
  $8AA5  BC 9B BC  LDY $BC9B,X
  $8AA8  B5 BC     LDA $BC,X
  $8AAA  F1 BC     SBC ($BC),Y
  $8AAC  00        BRK
  $8AAD  BD 25 BD  LDA $BD25,X
  $8AB0  3D BD 5D  AND $5DBD,X
  $8AB3  BD 78 BD  LDA $BD78,X
  $8AB6  8F        .db $8F
  $8AB7  BD 98 BD  LDA $BD98,X
  $8ABA  B7        .db $B7
  $8ABB  BD CC BD  LDA $BDCC,X
  $8ABE  E1 BD     SBC ($BD,X)
  $8AC0  F6 BD     INC $BD,X
  $8AC2  15 BE     ORA $BE,X
  $8AC4  35 BE     AND $BE,X
  $8AC6  88        DEY
  $8AC7  BE A4 BE  LDX $BEA4,Y
  $8ACA  BC BE F3  LDY $F3BE,X
  $8ACD  BE 2A BF  LDX $BF2A,Y
  $8AD0  3B        .db $3B
  $8AD1  BF        .db $BF
  $8AD2  48        PHA
  $8AD3  BF        .db $BF
  $8AD4  8F        .db $8F

L_8AD5:
  $8AD5  BF        .db $BF
  $8AD6  0F        .db $0F
  $8AD7  E1 8A     SBC ($8A,X)
  $8AD9  F1 8B     SBC ($8B),Y
  $8ADB  A9 8C     LDA #$8C
  $8ADD  83        .db $83
  $8ADE  8D 15 8E  STA $8E15
  $8AE1  00        BRK
  $8AE2  06 03     ASL $03
  $8AE4  3D 07 86  AND $8607,X
  $8AE7  10 05     BPL $8AEE
  $8AE9  17        .db $17
  $8AEA  02        .db $02
  $8AEB  00        BRK
  $8AEC  A5 68     LDA $68

L_8AEE:
  $8AEE  60        RTS
  $8AEF  6C 60 06  JMP ($0660)
  $8AF2  8F        .db $8F
  $8AF3  06 8E     ASL $8E
  $8AF5  8A        TXA
  $8AF6  06 8D     ASL $8D
  $8AF8  06 8C     ASL $8C
  $8AFA  88        DEY
  $8AFB  6A        ROR
  $8AFC  60        RTS
  $8AFD  68        PLA
  $8AFE  60        RTS
  $8AFF  65 63     ADC $63
  $8B01  60        RTS
  $8B02  65 80     ADC $80
  $8B04  73        .db $73
  $8B05  73        .db $73
  $8B06  73        .db $73
  $8B07  74        .db $74
  $8B08  80        .db $80
  $8B09  73        .db $73
  $8B0A  73        .db $73
  $8B0B  73        .db $73
  $8B0C  74        .db $74
  $8B0D  06 A0     ASL $A0
  $8B0F  73        .db $73
  $8B10  73        .db $73
  $8B11  73        .db $73
  $8B12  74        .db $74
  $8B13  60        RTS
  $8B14  78        SEI
  $8B15  60        RTS
  $8B16  78        SEI
  $8B17  76 60     ROR $60,X
  $8B19  74        .db $74
  $8B1A  60        RTS
  $8B1B  93        .db $93
  $8B1C  04        .db $04
  $8B1D  02        .db $02
  $8B1E  EA        NOP
  $8B1F  8A        TXA
  $8B20  A5 68     LDA $68
  $8B22  60        RTS
  $8B23  6C 60 06  JMP ($0660)
  $8B26  8F        .db $8F
  $8B27  06 8E     ASL $8E
  $8B29  8A        TXA
  $8B2A  06 8D     ASL $8D
  $8B2C  06 8C     ASL $8C
  $8B2E  88        DEY
  $8B2F  6A        ROR
  $8B30  60        RTS
  $8B31  68        PLA
  $8B32  60        RTS
  $8B33  65 63     ADC $63
  $8B35  60        RTS
  $8B36  65 80     ADC $80
  $8B38  73        .db $73
  $8B39  73        .db $73
  $8B3A  73        .db $73
  $8B3B  74        .db $74
  $8B3C  04        .db $04
  $8B3D  01 37     ORA ($37,X)
  $8B3F  8B        .db $8B
  $8B40  A0 76     LDY #$76
  $8B42  76 60     ROR $60,X
  $8B44  76 60     ROR $60,X
  $8B46  76 60     ROR $60,X
  $8B48  76 B8     ROR $B8,X
  $8B4A  A0 05     LDY #$05
  $8B4C  23        .db $23
  $8B4D  02        .db $02
  $8B4E  40        RTI
  $8B4F  03        .db $03
  $8B50  3D 07 92  AND $9207,X
  $8B53  10 80     BPL $8AD5
  $8B55  85 8C     STA $8C
  $8B57  8A        TXA
  $8B58  AC 8A 88  LDY $888A
  $8B5B  8A        TXA
  $8B5C  8C 80 21  STY $2180
  $8B5F  A5 08     LDA $08
  $8B61  01 A5     ORA ($A5,X)
  $8B63  08        PHP
  $8B64  00        BRK
  $8B65  88        DEY
  $8B66  87        .db $87
  $8B67  80        .db $80
  $8B68  87        .db $87
  $8B69  80        .db $80
  $8B6A  87        .db $87
  $8B6B  85 83     STA $83
  $8B6D  21 85     AND ($85,X)
  $8B6F  C5 80     CMP $80
  $8B71  85 88     STA $88
  $8B73  8A        TXA
  $8B74  80        .db $80
  $8B75  85 8C     STA $8C
  $8B77  8A        TXA
  $8B78  AC 8A 88  LDY $888A
  $8B7B  8A        TXA
  $8B7C  8C 80 21  STY $2180
  $8B7F  A5 08     LDA $08
  $8B81  01 A5     ORA ($A5,X)
  $8B83  08        PHP
  $8B84  00        BRK
  $8B85  88        DEY
  $8B86  87        .db $87
  $8B87  80        .db $80
  $8B88  87        .db $87
  $8B89  80        .db $80
  $8B8A  88        DEY
  $8B8B  8A        TXA
  $8B8C  87        .db $87
  $8B8D  21 85     AND ($85,X)
  $8B8F  21 A5     AND ($A5,X)
  $8B91  08        PHP
  $8B92  01 A5     ORA ($A5,X)
  $8B94  08        PHP
  $8B95  00        BRK
  $8B96  80        .db $80
  $8B97  85 88     STA $88
  $8B99  8C 02 C0  STY $C002
  $8B9C  07        .db $07
  $8B9D  A2 10     LDX #$10
  $8B9F  21 CF     AND ($CF,X)
  $8BA1  08        PHP
  $8BA2  01 CF     ORA ($CF,X)
  $8BA4  08        PHP
  $8BA5  00        BRK
  $8BA6  21 AE     AND ($AE,X)
  $8BA8  08        PHP
  $8BA9  01 AE     ORA ($AE,X)
  $8BAB  08        PHP
  $8BAC  00        BRK
  $8BAD  21 AD     AND ($AD,X)
  $8BAF  08        PHP
  $8BB0  01 AD     ORA ($AD,X)
  $8BB2  08        PHP
  $8BB3  00        BRK
  $8BB4  02        .db $02
  $8BB5  80        .db $80
  $8BB6  88        DEY
  $8BB7  06 A5     ASL $A5
  $8BB9  80        .db $80
  $8BBA  85 88     STA $88
  $8BBC  8A        TXA
  $8BBD  8B        .db $8B
  $8BBE  8C 8B 8C  STY $8C8B
  $8BC1  8A        TXA
  $8BC2  88        DEY
  $8BC3  85 83     STA $83
  $8BC5  02        .db $02
  $8BC6  C0 21     CPY #$21
  $8BC8  CF        .db $CF
  $8BC9  08        PHP
  $8BCA  01 CF     ORA ($CF,X)
  $8BCC  08        PHP
  $8BCD  00        BRK
  $8BCE  21 AE     AND ($AE,X)
  $8BD0  08        PHP
  $8BD1  01 AE     ORA ($AE,X)
  $8BD3  08        PHP
  $8BD4  00        BRK
  $8BD5  21 AD     AND ($AD,X)
  $8BD7  08        PHP
  $8BD8  01 AD     ORA ($AD,X)
  $8BDA  08        PHP
  $8BDB  00        BRK
  $8BDC  02        .db $02
  $8BDD  80        .db $80
  $8BDE  88        DEY
  $8BDF  06 A5     ASL $A5
  $8BE1  80        .db $80
  $8BE2  85 88     STA $88
  $8BE4  8A        TXA
  $8BE5  91 8C     STA ($8C),Y
  $8BE7  8C 8C 90  STY $908C
  $8BEA  93        .db $93
  $8BEB  96 98     STX $98,Y
  $8BED  04        .db $04
  $8BEE  00        BRK
  $8BEF  4D 8B 00  EOR $008B
  $8BF2  06 02     ASL $02
  $8BF4  00        BRK
  $8BF5  05 17     ORA $17
  $8BF7  07        .db $07
  $8BF8  E0 10     CPX #$10
  $8BFA  03        .db $03
  $8BFB  38        SEC
  $8BFC  80        .db $80
  $8BFD  A5 68     LDA $68
  $8BFF  60        RTS
  $8C00  6C 60 06  JMP ($0660)
  $8C03  8F        .db $8F
  $8C04  06 8E     ASL $8E
  $8C06  8A        TXA
  $8C07  06 8D     ASL $8D
  $8C09  06 8C     ASL $8C
  $8C0B  88        DEY
  $8C0C  6A        ROR
  $8C0D  60        RTS
  $8C0E  68        PLA
  $8C0F  60        RTS
  $8C10  65 63     ADC $63
  $8C12  60        RTS
  $8C13  65 6F     ADC $6F
  $8C15  6F        .db $6F
  $8C16  6F        .db $6F
  $8C17  71 80     ADC ($80),Y
  $8C19  6F        .db $6F
  $8C1A  6F        .db $6F
  $8C1B  6F        .db $6F
  $8C1C  71 A0     ADC ($A0),Y
  $8C1E  80        .db $80
  $8C1F  6F        .db $6F
  $8C20  6F        .db $6F
  $8C21  6F        .db $6F
  $8C22  71 60     ADC ($60),Y
  $8C24  74        .db $74
  $8C25  60        RTS
  $8C26  74        .db $74
  $8C27  73        .db $73
  $8C28  60        RTS
  $8C29  71 60     ADC ($60),Y
  $8C2B  8F        .db $8F
  $8C2C  04        .db $04
  $8C2D  02        .db $02
  $8C2E  F7        .db $F7
  $8C2F  8B        .db $8B
  $8C30  80        .db $80
  $8C31  A5 68     LDA $68
  $8C33  60        RTS
  $8C34  6C 60 06  JMP ($0660)
  $8C37  8F        .db $8F
  $8C38  06 8E     ASL $8E
  $8C3A  8A        TXA
  $8C3B  06 8D     ASL $8D
  $8C3D  06 8C     ASL $8C
  $8C3F  88        DEY
  $8C40  6A        ROR
  $8C41  60        RTS
  $8C42  68        PLA
  $8C43  60        RTS
  $8C44  65 63     ADC $63
  $8C46  60        RTS
  $8C47  65 6F     ADC $6F
  $8C49  6F        .db $6F
  $8C4A  6F        .db $6F
  $8C4B  71 80     ADC ($80),Y
  $8C4D  6F        .db $6F
  $8C4E  6F        .db $6F
  $8C4F  6F        .db $6F
  $8C50  71 A0     ADC ($A0),Y
  $8C52  73        .db $73
  $8C53  73        .db $73
  $8C54  60        RTS
  $8C55  73        .db $73
  $8C56  60        RTS

L_8C57:
  $8C57  73        .db $73
  $8C58  60        RTS
  $8C59  73        .db $73
  $8C5A  B4 A0     LDY $A0,X
  $8C5C  05 23     ORA $23
  $8C5E  03        .db $03
  $8C5F  37        .db $37

L_8C60:
  $8C60  68        PLA
  $8C61  6A        ROR
  $8C62  60        RTS
  $8C63  68        PLA
  $8C64  60        RTS
  $8C65  68        PLA
  $8C66  6A        ROR
  $8C67  68        PLA
  $8C68  67        .db $67
  $8C69  68        PLA
  $8C6A  60        RTS
  $8C6B  67        .db $67
  $8C6C  60        RTS
  $8C6D  67        .db $67
  $8C6E  68        PLA
  $8C6F  67        .db $67
  $8C70  63        .db $63
  $8C71  65 60     ADC $60
  $8C73  65 60     ADC $60
  $8C75  63        .db $63
  $8C76  85 63     STA $63
  $8C78  65 60     ADC $60
  $8C7A  65 60     ADC $60
  $8C7C  63        .db $63
  $8C7D  85 04     STA $04
  $8C7F  03        .db $03
  $8C80  5E 8C 02  LSR $028C,X
  $8C83  C0 03     CPY #$03
  $8C85  3A        .db $3A
  $8C86  07        .db $07
  $8C87  A2 10     LDX #$10
  $8C89  EC CB CA  CPX $CACB
  $8C8C  07        .db $07

L_8C8D:
  $8C8D  86 10     STX $10
  $8C8F  02        .db $02
  $8C90  00        BRK
  $8C91  80        .db $80
  $8C92  88        DEY
  $8C93  8A        TXA
  $8C94  88        DEY
  $8C95  8C 88 80  STY $8088
  $8C98  88        DEY
  $8C99  8A        TXA
  $8C9A  88        DEY
  $8C9B  8C 88 80  STY $8088
  $8C9E  88        DEY
  $8C9F  87        .db $87
  $8CA0  88        DEY
  $8CA1  04        .db $04
  $8CA2  01 82     ORA ($82,X)
  $8CA4  8C 04 00  STY $0004
  $8CA7  5C        .db $5C
  $8CA8  8C 00 06  STY $0600
  $8CAB  03        .db $03
  $8CAC  25 05     AND $05
  $8CAE  23        .db $23
  $8CAF  03        .db $03
  $8CB0  30 A5     BMI $8C57
  $8CB2  68        PLA
  $8CB3  60        RTS
  $8CB4  6C 60 06  JMP ($0660)
  $8CB7  8F        .db $8F
  $8CB8  06 8E     ASL $8E
  $8CBA  8A        TXA
  $8CBB  06 8D     ASL $8D
  $8CBD  06 8C     ASL $8C
  $8CBF  88        DEY
  $8CC0  6A        ROR
  $8CC1  60        RTS
  $8CC2  68        PLA
  $8CC3  60        RTS
  $8CC4  65 63     ADC $63
  $8CC6  60        RTS
  $8CC7  85 60     STA $60
  $8CC9  85 65     STA $65
  $8CCB  60        RTS
  $8CCC  85 65     STA $65
  $8CCE  60        RTS
  $8CCF  85 65     STA $65
  $8CD1  60        RTS
  $8CD2  85 65     STA $65
  $8CD4  60        RTS
  $8CD5  85 67     STA $67
  $8CD7  60        RTS
  $8CD8  87        .db $87
  $8CD9  68        PLA
  $8CDA  60        RTS
  $8CDB  6C 60 A3  JMP ($A360)
  $8CDE  04        .db $04
  $8CDF  02        .db $02
  $8CE0  B1 8C     LDA ($8C),Y
  $8CE2  A5 68     LDA $68
  $8CE4  60        RTS
  $8CE5  6C 60 06  JMP ($0660)
  $8CE8  8F        .db $8F
  $8CE9  06 8E     ASL $8E
  $8CEB  8A        TXA
  $8CEC  06 8D     ASL $8D
  $8CEE  06 8C     ASL $8C
  $8CF0  88        DEY
  $8CF1  6A        ROR
  $8CF2  60        RTS
  $8CF3  68        PLA
  $8CF4  60        RTS
  $8CF5  65 63     ADC $63
  $8CF7  60        RTS
  $8CF8  85 60     STA $60
  $8CFA  85 65     STA $65
  $8CFC  60        RTS
  $8CFD  85 65     STA $65
  $8CFF  60        RTS
  $8D00  85 65     STA $65
  $8D02  60        RTS
  $8D03  85 63     STA $63
  $8D05  63        .db $63
  $8D06  60        RTS
  $8D07  63        .db $63
  $8D08  60        RTS
  $8D09  63        .db $63
  $8D0A  60        RTS
  $8D0B  63        .db $63
  $8D0C  65 01     ADC $01

L_8D0E:
  $8D0E  10 78     BPL $8D88
  $8D10  78        SEI
  $8D11  67        .db $67
  $8D12  66 65     ROR $65
  $8D14  64        .db $64
  $8D15  63        .db $63
  $8D16  05 23     ORA $23
  $8D18  03        .db $03
  $8D19  30 01     BMI $8D1C
  $8D1B  00        BRK

L_8D1C:
  $8D1C  85 85     STA $85
  $8D1E  80        .db $80
  $8D1F  85 65     STA $65
  $8D21  68        PLA
  $8D22  60        RTS
  $8D23  6C 60 68  JMP ($6860)
  $8D26  85 85     STA $85
  $8D28  85 80     STA $80
  $8D2A  85 65     STA $65
  $8D2C  68        PLA
  $8D2D  60        RTS
  $8D2E  6C 60 68  JMP ($6860)
  $8D31  85 83     STA $83
  $8D33  83        .db $83
  $8D34  80        .db $80
  $8D35  83        .db $83
  $8D36  63        .db $63
  $8D37  67        .db $67
  $8D38  60        RTS
  $8D39  6A        ROR
  $8D3A  60        RTS
  $8D3B  67        .db $67
  $8D3C  83        .db $83
  $8D3D  85 85     STA $85
  $8D3F  80        .db $80
  $8D40  85 65     STA $65
  $8D42  68        PLA
  $8D43  60        RTS
  $8D44  6C 60 68  JMP ($6860)
  $8D47  85 04     STA $04
  $8D49  01 16     ORA ($16,X)
  $8D4B  8D 01 00  STA $0001
  $8D4E  05 23     ORA $23
  $8D50  68        PLA
  $8D51  60        RTS
  $8D52  88        DEY
  $8D53  68        PLA
  $8D54  60        RTS
  $8D55  88        DEY
  $8D56  68        PLA
  $8D57  60        RTS
  $8D58  88        DEY
  $8D59  68        PLA
  $8D5A  60        RTS
  $8D5B  88        DEY
  $8D5C  67        .db $67
  $8D5D  60        RTS
  $8D5E  87        .db $87
  $8D5F  67        .db $67
  $8D60  60        RTS
  $8D61  87        .db $87
  $8D62  66 60     ROR $60
  $8D64  86 66     STX $66
  $8D66  60        RTS
  $8D67  86 80     STX $80
  $8D69  85 87     STA $87
  $8D6B  85 88     STA $88
  $8D6D  85 80     STA $80
  $8D6F  85 01     STA $01
  $8D71  10 9B     BPL $8D0E
  $8D73  9B        .db $9B
  $8D74  8B        .db $8B
  $8D75  8B        .db $8B
  $8D76  7D 7D 8B  ADC $8B7D,X
  $8D79  8A        TXA
  $8D7A  8A        TXA
  $8D7B  04        .db $04
  $8D7C  01 4C     ORA ($4C,X)
  $8D7E  8D 04 00  STA $0004
  $8D81  16 8D     ASL $8D,X
  $8D83  00        BRK
  $8D84  06 07     ASL $07
  $8D86  84 A0     STY $A0

L_8D88:
  $8D88  03        .db $03
  $8D89  3F        .db $3F
  $8D8A  01 05     ORA ($05,X)
  $8D8C  66 01     ROR $01
  $8D8E  00        BRK
  $8D8F  07        .db $07
  $8D90  82        .db $82
  $8D91  60        RTS
  $8D92  03        .db $03
  $8D93  36 64     ROL $64,X
  $8D95  64        .db $64
  $8D96  64        .db $64
  $8D97  04        .db $04
  $8D98  3B        .db $3B
  $8D99  85 8D     STA $8D
  $8D9B  07        .db $07
  $8D9C  81 10     STA ($10,X)
  $8D9E  03        .db $03
  $8D9F  39 01 12  AND $1201,Y
  $8DA2  66 66     ROR $66
  $8DA4  60        RTS
  $8DA5  66 60     ROR $60
  $8DA7  66 60     ROR $60
  $8DA9  66 63     ROR $63
  $8DAB  63        .db $63
  $8DAC  64        .db $64
  $8DAD  64        .db $64
  $8DAE  65 65     ADC $65
  $8DB0  66 66     ROR $66
  $8DB2  03        .db $03
  $8DB3  3E 01 10  ROL $1001,X
  $8DB6  07        .db $07
  $8DB7  82        .db $82
  $8DB8  A0 A4     LDY #$A4
  $8DBA  07        .db $07
  $8DBB  84 60     STY $60
  $8DBD  06 8D     ASL $8D
  $8DBF  07        .db $07
  $8DC0  82        .db $82
  $8DC1  A0 64     LDY #$64
  $8DC3  64        .db $64
  $8DC4  64        .db $64
  $8DC5  84 07     STY $07
  $8DC7  84 60     STY $60
  $8DC9  AD 04 07  LDA $0704
  $8DCC  B2        .db $B2
  $8DCD  8D 07 82  STA $8207
  $8DD0  A0 84     LDY #$84
  $8DD2  84 04     STY $04
  $8DD4  02        .db $02
  $8DD5  CE 8D 07  DEC $078D
  $8DD8  84 60     STY $60
  $8DDA  AD 07 82  LDA $8207
  $8DDD  A0 64     LDY #$64
  $8DDF  60        RTS
  $8DE0  84 07     STY $07
  $8DE2  84 60     STY $60
  $8DE4  AD 04 05  LDA $0504

L_8DE7:
  $8DE7  DB        .db $DB
  $8DE8  8D 07 82  STA $8207
  $8DEB  A0 84     LDY #$84
  $8DED  84 04     STY $04
  $8DEF  02        .db $02
  $8DF0  E9 8D     SBC #$8D
  $8DF2  07        .db $07
  $8DF3  84 60     STY $60
  $8DF5  AD 07 82  LDA $8207
  $8DF8  A0 84     LDY #$84
  $8DFA  84 07     STY $07
  $8DFC  84 60     STY $60
  $8DFE  AD 04 03  LDA $0304
  $8E01  F6 8D     INC $8D,X
  $8E03  07        .db $07
  $8E04  84 A0     STY $A0
  $8E06  03        .db $03
  $8E07  38        SEC
  $8E08  83        .db $83
  $8E09  83        .db $83
  $8E0A  84 84     STY $84
  $8E0C  65 65     ADC $65
  $8E0E  85 86     STA $86
  $8E10  86 04     STX $04
  $8E12  00        BRK
  $8E13  B2        .db $B2
  $8E14  8D 00 00  STA $0000
  $8E17  80        .db $80
  $8E18  00        BRK
  $8E19  02        .db $02
  $8E1A  62        .db $62
  $8E1B  80        .db $80
  $8E1C  00        BRK
  $8E1D  0F        .db $0F
  $8E1E  28        PLP
  $8E1F  8E E8 8E  STX $8EE8
  $8E22  9D 8F 79  STA $798F,X
  $8E25  90 C0     BCC $8DE7
  $8E27  90 00     BCC $8E29

L_8E29:
  $8E29  05 03     ORA $03
  $8E2B  3D 05 19  AND $1905,X
  $8E2E  02        .db $02
  $8E2F  80        .db $80
  $8E30  07        .db $07
  $8E31  84 70     STY $70
  $8E33  01 30     ORA ($30,X)
  $8E35  AB        .db $AB
  $8E36  AB        .db $AB
  $8E37  8B        .db $8B
  $8E38  8D AB 8B  STA $8BAB
  $8E3B  8B        .db $8B
  $8E3C  80        .db $80
  $8E3D  AB        .db $AB
  $8E3E  8B        .db $8B
  $8E3F  AB        .db $AB
  $8E40  04        .db $04
  $8E41  01 35     ORA ($35,X)
  $8E43  8E 01 00  STX $0001
  $8E46  02        .db $02
  $8E47  C0 07     CPY #$07
  $8E49  88        DEY
  $8E4A  10 77     BPL $8EC3
  $8E4C  76 75     ROR $75,X
  $8E4E  74        .db $74
  $8E4F  73        .db $73
  $8E50  72        .db $72
  $8E51  71 70     ADC ($70),Y
  $8E53  6F        .db $6F
  $8E54  6E 6D 6C  ROR $6C6D
  $8E57  6B        .db $6B
  $8E58  6A        ROR
  $8E59  96 80     STX $80,Y
  $8E5B  96 A0     STX $A0,Y
  $8E5D  96 80     STX $80,Y
  $8E5F  96 02     STX $02,Y
  $8E61  80        .db $80
  $8E62  05 25     ORA $25
  $8E64  03        .db $03
  $8E65  3C        .db $3C
  $8E66  22        .db $22
  $8E67  88        DEY
  $8E68  07        .db $07
  $8E69  90 10     BCC $8E7B
  $8E6B  A8        TAY
  $8E6C  08        PHP
  $8E6D  01 A8     ORA ($A8,X)
  $8E6F  08        PHP
  $8E70  00        BRK
  $8E71  88        DEY
  $8E72  87        .db $87
  $8E73  80        .db $80
  $8E74  88        DEY
  $8E75  80        .db $80
  $8E76  85 80     STA $80
  $8E78  85 88     STA $88
  $8E7A  80        .db $80

L_8E7B:
  $8E7B  AC 21 AA  LDY $AA21
  $8E7E  08        PHP
  $8E7F  01 AA     ORA ($AA,X)
  $8E81  08        PHP
  $8E82  00        BRK
  $8E83  AA        TAX
  $8E84  88        DEY
  $8E85  8C 80 CA  STY $CA80
  $8E88  8A        TXA
  $8E89  88        DEY
  $8E8A  06 CA     ASL $CA
  $8E8C  80        .db $80
  $8E8D  8A        TXA
  $8E8E  06 AC     ASL $AC
  $8E90  AA        TAX
  $8E91  A8        TAY
  $8E92  A7        .db $A7
  $8E93  87        .db $87
  $8E94  88        DEY
  $8E95  87        .db $87
  $8E96  C5 8A     CMP $8A
  $8E98  80        .db $80
  $8E99  8A        TXA
  $8E9A  A0 8A     LDY #$8A
  $8E9C  80        .db $80
  $8E9D  8A        TXA
  $8E9E  21 88     AND ($88,X)
  $8EA0  04        .db $04
  $8EA1  01 68     ORA ($68,X)
  $8EA3  8E 21 A8  STX $A821
  $8EA6  08        PHP
  $8EA7  01 A8     ORA ($A8,X)
  $8EA9  08        PHP
  $8EAA  00        BRK
  $8EAB  88        DEY
  $8EAC  87        .db $87
  $8EAD  80        .db $80
  $8EAE  88        DEY
  $8EAF  80        .db $80
  $8EB0  85 80     STA $80
  $8EB2  85 88     STA $88
  $8EB4  80        .db $80
  $8EB5  AC 06 CA  LDY $CA06
  $8EB8  80        .db $80
  $8EB9  88        DEY
  $8EBA  A3        .db $A3
  $8EBB  A5 A7     LDA $A7
  $8EBD  AA        TAX
  $8EBE  21 AB     AND ($AB,X)
  $8EC0  08        PHP
  $8EC1  01 AB     ORA ($AB,X)

L_8EC3:
  $8EC3  08        PHP
  $8EC4  00        BRK
  $8EC5  8B        .db $8B
  $8EC6  8A        TXA
  $8EC7  80        .db $80
  $8EC8  8B        .db $8B
  $8EC9  80        .db $80
  $8ECA  8B        .db $8B
  $8ECB  8B        .db $8B
  $8ECC  80        .db $80
  $8ECD  A8        TAY
  $8ECE  AB        .db $AB
  $8ECF  7D 7C 7B  ADC $7B7C,X
  $8ED2  7A        .db $7A
  $8ED3  79 78 77  ADC $7778,Y
  $8ED6  76 75     ROR $75,X
  $8ED8  74        .db $74
  $8ED9  73        .db $73
  $8EDA  72        .db $72
  $8EDB  71 70     ADC ($70),Y
  $8EDD  8C 80 8C  STY $8C80
  $8EE0  A0 8C     LDY #$8C
  $8EE2  80        .db $80
  $8EE3  8C 04 00  STY $0004
  $8EE6  60        RTS
  $8EE7  8E 00 05  STX $0500
  $8EEA  03        .db $03
  $8EEB  3A        .db $3A
  $8EEC  05 31     ORA $31
  $8EEE  02        .db $02
  $8EEF  80        .db $80
  $8EF0  07        .db $07
  $8EF1  81 20     STA ($20,X)
  $8EF3  01 10     ORA ($10,X)
  $8EF5  A0 A8     LDY #$A8
  $8EF7  04        .db $04
  $8EF8  07        .db $07
  $8EF9  F5 8E     SBC $8E,X
  $8EFB  01 00     ORA ($00,X)
  $8EFD  02        .db $02
  $8EFE  C0 05     CPY #$05
  $8F00  19 07 88  ORA $8807,Y
  $8F03  10 74     BPL $8F79
  $8F05  73        .db $73
  $8F06  72        .db $72
  $8F07  71 70     ADC ($70),Y
  $8F09  6F        .db $6F
  $8F0A  6E 6D 6C  ROR $6C6D
  $8F0D  6B        .db $6B
  $8F0E  6A        ROR
  $8F0F  69 68     ADC #$68
  $8F11  67        .db $67
  $8F12  93        .db $93
  $8F13  80        .db $80
  $8F14  93        .db $93
  $8F15  A0 93     LDY #$93
  $8F17  80        .db $80
  $8F18  93        .db $93
  $8F19  07        .db $07
  $8F1A  92        .db $92
  $8F1B  20 05 19  JSR $1905
  $8F1E  03        .db $03
  $8F1F  38        SEC
  $8F20  02        .db $02
  $8F21  80        .db $80
  $8F22  21 91     AND ($91,X)
  $8F24  D1 91     CMP ($91),Y
  $8F26  8F        .db $8F
  $8F27  80        .db $80
  $8F28  91 80     STA ($80),Y
  $8F2A  8C 80 8C  STY $8C80
  $8F2D  91 80     STA ($80),Y
  $8F2F  B4 D2     LDY $D2,X
  $8F31  B2        .db $B2
  $8F32  91 94     STA ($94),Y
  $8F34  80        .db $80
  $8F35  D2        .db $D2
  $8F36  92        .db $92
  $8F37  91 06     STA ($06),Y
  $8F39  D2        .db $D2
  $8F3A  80        .db $80
  $8F3B  92        .db $92
  $8F3C  06 B3     ASL $B3
  $8F3E  B3        .db $B3
  $8F3F  AC AC C0  LDY $C0AC
  $8F42  93        .db $93
  $8F43  94 93     STY $93,X
  $8F45  93        .db $93

L_8F46:
  $8F46  80        .db $80
  $8F47  93        .db $93
  $8F48  A0 93     LDY #$93
  $8F4A  80        .db $80
  $8F4B  93        .db $93
  $8F4C  04        .db $04
  $8F4D  01 19     ORA ($19,X)
  $8F4F  8F        .db $8F
  $8F50  80        .db $80
  $8F51  05 25     ORA $25
  $8F53  03        .db $03
  $8F54  38        SEC
  $8F55  02        .db $02
  $8F56  80        .db $80
  $8F57  07        .db $07
  $8F58  92        .db $92
  $8F59  10 08     BPL $8F63
  $8F5B  01 21     ORA ($21,X)
  $8F5D  88        DEY
  $8F5E  C8        INY
  $8F5F  88        DEY
  $8F60  87        .db $87
  $8F61  80        .db $80
  $8F62  88        DEY

L_8F63:
  $8F63  80        .db $80
  $8F64  85 80     STA $80
  $8F66  85 88     STA $88
  $8F68  80        .db $80
  $8F69  AC 06 CA  LDY $CA06
  $8F6C  80        .db $80
  $8F6D  88        DEY
  $8F6E  A3        .db $A3
  $8F6F  A5 A7     LDA $A7
  $8F71  AA        TAX
  $8F72  CB        .db $CB
  $8F73  8B        .db $8B
  $8F74  8A        TXA
  $8F75  80        .db $80
  $8F76  8B        .db $8B
  $8F77  80        .db $80
  $8F78  8B        .db $8B

L_8F79:
  $8F79  8B        .db $8B
  $8F7A  80        .db $80
  $8F7B  A8        TAY
  $8F7C  8B        .db $8B
  $8F7D  08        PHP
  $8F7E  00        BRK
  $8F7F  07        .db $07
  $8F80  88        DEY
  $8F81  10 03     BPL $8F86
  $8F83  3A        .db $3A
  $8F84  73        .db $73
  $8F85  72        .db $72

L_8F86:
  $8F86  71 70     ADC ($70),Y
  $8F88  6F        .db $6F
  $8F89  6E 6D 6C  ROR $6C6D
  $8F8C  6B        .db $6B
  $8F8D  6A        ROR
  $8F8E  69 68     ADC #$68
  $8F90  67        .db $67
  $8F91  66 87     ROR $87
  $8F93  80        .db $80
  $8F94  87        .db $87
  $8F95  A0 87     LDY #$87
  $8F97  80        .db $80
  $8F98  87        .db $87
  $8F99  04        .db $04
  $8F9A  00        BRK
  $8F9B  19 8F 00  ORA $008F,Y

L_8F9E:
  $8F9E  05 03     ORA $03
  $8FA0  15 05     ORA $05,X
  $8FA2  31 01     AND ($01),Y
  $8FA4  10 A0     BPL $8F46
  $8FA6  A7        .db $A7
  $8FA7  04        .db $04
  $8FA8  05 A5     ORA $A5
  $8FAA  8F        .db $8F
  $8FAB  91 71     STA ($71),Y
  $8FAD  71 8E     ADC ($8E),Y
  $8FAF  8E 8C 8C  STX $8C8C
  $8FB2  8A        TXA
  $8FB3  8A        TXA
  $8FB4  01 00     ORA ($00,X)
  $8FB6  05 25     ORA $25
  $8FB8  71 70     ADC ($70),Y
  $8FBA  6F        .db $6F
  $8FBB  6E 6D 6C  ROR $6C6D
  $8FBE  6B        .db $6B
  $8FBF  6A        ROR
  $8FC0  69 68     ADC #$68
  $8FC2  67        .db $67
  $8FC3  66 65     ROR $65
  $8FC5  64        .db $64
  $8FC6  83        .db $83
  $8FC7  80        .db $80
  $8FC8  83        .db $83
  $8FC9  80        .db $80
  $8FCA  01 10     ORA ($10,X)
  $8FCC  7D 7D 9D  ADC $9D7D,X
  $8FCF  9D 9D 01  STA $019D,X
  $8FD2  00        BRK
  $8FD3  21 85     AND ($85,X)
  $8FD5  85 65     STA $65
  $8FD7  65 04     ADC $04
  $8FD9  07        .db $07
  $8FDA  D5 8F     CMP $8F,X
  $8FDC  86 66     STX $66
  $8FDE  66 04     ROR $04
  $8FE0  06 DC     ASL $DC
  $8FE2  8F        .db $8F
  $8FE3  86 21     STX $21
  $8FE5  83        .db $83
  $8FE6  83        .db $83
  $8FE7  63        .db $63
  $8FE8  63        .db $63
  $8FE9  04        .db $04
  $8FEA  02        .db $02
  $8FEB  E6 8F     INC $8F
  $8FED  83        .db $83
  $8FEE  21 84     AND ($84,X)
  $8FF0  84 64     STY $64
  $8FF2  64        .db $64
  $8FF3  04        .db $04
  $8FF4  03        .db $03
  $8FF5  F0 8F     BEQ $8F86
  $8FF7  80        .db $80
  $8FF8  85 87     STA $87
  $8FFA  85 88     STA $88
  $8FFC  85 80     STA $80
  $8FFE  83        .db $83
  $8FFF  80        .db $80
  $9000  83        .db $83
  $9001  80        .db $80
  $9002  63        .db $63
  $9003  63        .db $63
  $9004  83        .db $83
  $9005  80        .db $80
  $9006  83        .db $83
  $9007  21 85     AND ($85,X)
  $9009  85 65     STA $65
  $900B  65 04     ADC $04
  $900D  07        .db $07
  $900E  09 90     ORA #$90
  $9010  86 66     STX $66
  $9012  66 04     ROR $04
  $9014  06 10     ASL $10
  $9016  90 86     BCC $8F9E
  $9018  21 83     AND ($83,X)
  $901A  83        .db $83
  $901B  63        .db $63
  $901C  63        .db $63
  $901D  04        .db $04
  $901E  02        .db $02
  $901F  1A        .db $1A
  $9020  90 83     BCC $8FA5
  $9022  21 84     AND ($84,X)
  $9024  84 64     STY $64
  $9026  64        .db $64
  $9027  04        .db $04
  $9028  03        .db $03
  $9029  24 90     BIT $90
  $902B  80        .db $80
  $902C  85 87     STA $87
  $902E  85 88     STA $88
  $9030  85 80     STA $80
  $9032  83        .db $83
  $9033  80        .db $80
  $9034  83        .db $83
  $9035  80        .db $80
  $9036  63        .db $63
  $9037  63        .db $63
  $9038  83        .db $83
  $9039  80        .db $80
  $903A  83        .db $83
  $903B  21 81     AND ($81,X)
  $903D  81 61     STA ($61,X)
  $903F  61 81     ADC ($81,X)
  $9041  81 04     STA ($04,X)
  $9043  03        .db $03
  $9044  3D 90 83  AND $8390,X
  $9047  63        .db $63
  $9048  63        .db $63
  $9049  83        .db $83
  $904A  83        .db $83
  $904B  04        .db $04
  $904C  03        .db $03
  $904D  46 90     LSR $90
  $904F  84 64     STY $64
  $9051  64        .db $64
  $9052  84 84     STY $84
  $9054  04        .db $04
  $9055  03        .db $03
  $9056  4F        .db $4F
  $9057  90 65     BCC $90BE
  $9059  65 65     ADC $65
  $905B  60        RTS
  $905C  65 60     ADC $60
  $905E  65 65     ADC $65
  $9060  60        RTS
  $9061  65 65     ADC $65
  $9063  60        RTS
  $9064  65 65     ADC $65
  $9066  84 80     STY $80
  $9068  84 80     STY $80
  $906A  01 10     ORA ($10,X)
  $906C  7D 7D 9D  ADC $9D7D,X
  $906F  9D 9D 01  STA $019D,X
  $9072  00        BRK
  $9073  21 85     AND ($85,X)
  $9075  04        .db $04
  $9076  00        BRK
  $9077  D5 8F     CMP $8F,X
  $9079  00        BRK
  $907A  05 01     ORA $01
  $907C  10 07     BPL $9085
  $907E  83        .db $83
  $907F  60        RTS
  $9080  03        .db $03
  $9081  3D A0 AC  AND $ACA0,X
  $9084  04        .db $04

L_9085:
  $9085  07        .db $07
  $9086  82        .db $82
  $9087  90 07     BCC $9090
  $9089  83        .db $83
  $908A  60        RTS
  $908B  01 FD     ORA ($FD,X)
  $908D  65 04     ADC $04
  $908F  03        .db $03

L_9090:
  $9090  8D 90 68  STA $6890
  $9093  04        .db $04
  $9094  03        .db $03
  $9095  92        .db $92
  $9096  90 6A     BCC $9102
  $9098  6A        ROR
  $9099  6A        ROR
  $909A  6C 6C 6C  JMP ($6C6C)
  $909D  01 10     ORA ($10,X)
  $909F  8C 80 8C  STY $8C80
  $90A2  A0 8C     LDY #$8C
  $90A4  80        .db $80
  $90A5  8C 8C 01  STY $018C
  $90A8  10 07     BPL $90B1
  $90AA  82        .db $82
  $90AB  A0 84     LDY #$84
  $90AD  64        .db $64
  $90AE  64        .db $64
  $90AF  07        .db $07
  $90B0  84 60     STY $60
  $90B2  8A        TXA
  $90B3  07        .db $07
  $90B4  82        .db $82
  $90B5  A0 64     LDY #$64
  $90B7  64        .db $64
  $90B8  04        .db $04
  $90B9  2B        .db $2B
  $90BA  A9 90     LDA #$90
  $90BC  04        .db $04
  $90BD  00        BRK

L_90BE:
  $90BE  88        DEY
  $90BF  90 00     BCC $90C1

L_90C1:
  $90C1  00        BRK
  $90C2  80        .db $80
  $90C3  00        BRK
  $90C4  02        .db $02
  $90C5  41 80     EOR ($80,X)
  $90C7  00        BRK
  $90C8  0F        .db $0F
  $90C9  D3        .db $D3
  $90CA  90 70     BCC $913C
  $90CC  92        .db $92
  $90CD  91 93     STA ($93),Y
  $90CF  30 94     BMI $9065
  $90D1  7F        .db $7F
  $90D2  94 00     STY $00,X
  $90D4  06 03     ASL $03
  $90D6  3C        .db $3C
  $90D7  07        .db $07
  $90D8  8A        TXA
  $90D9  10 02     BPL $90DD
  $90DB  40        RTI
  $90DC  05 17     ORA $17
  $90DE  88        DEY
  $90DF  A0 85     LDY #$85
  $90E1  A6 87     LDX $87
  $90E3  60        RTS
  $90E4  68        PLA
  $90E5  60        RTS
  $90E6  68        PLA
  $90E7  68        PLA
  $90E8  60        RTS
  $90E9  88        DEY
  $90EA  85 A6     STA $A6
  $90EC  87        .db $87
  $90ED  88        DEY
  $90EE  88        DEY
  $90EF  A0 85     LDY #$85
  $90F1  A6 87     LDX $87
  $90F3  60        RTS
  $90F4  68        PLA
  $90F5  60        RTS
  $90F6  68        PLA
  $90F7  68        PLA
  $90F8  60        RTS
  $90F9  88        DEY
  $90FA  85 86     STA $86
  $90FC  05 23     ORA $23
  $90FE  74        .db $74
  $90FF  60        RTS
  $9100  B4 05     LDY $05,X

L_9102:
  $9102  17        .db $17
  $9103  88        DEY
  $9104  A0 85     LDY #$85
  $9106  A6 87     LDX $87
  $9108  60        RTS
  $9109  68        PLA
  $910A  60        RTS
  $910B  68        PLA
  $910C  68        PLA
  $910D  60        RTS
  $910E  88        DEY
  $910F  85 05     STA $05
  $9111  23        .db $23
  $9112  74        .db $74
  $9113  74        .db $74
  $9114  60        RTS
  $9115  74        .db $74
  $9116  76 77     ROR $77,X
  $9118  76 74     ROR $74,X
  $911A  05 17     ORA $17
  $911C  88        DEY
  $911D  A0 85     LDY #$85
  $911F  A6 A7     LDX $A7
  $9121  05 23     ORA $23
  $9123  74        .db $74
  $9124  60        RTS
  $9125  04        .db $04
  $9126  04        .db $04
  $9127  21 91     AND ($91,X)
  $9129  60        RTS
  $912A  74        .db $74
  $912B  76 77     ROR $77,X
  $912D  76 74     ROR $74,X
  $912F  07        .db $07
  $9130  88        DEY
  $9131  10 6F     BPL $91A2
  $9133  A0 60     LDY #$60
  $9135  6F        .db $6F
  $9136  60        RTS
  $9137  B2        .db $B2
  $9138  91 60     STA ($60),Y
  $913A  6F        .db $6F
  $913B  60        RTS

L_913C:
  $913C  6F        .db $6F
  $913D  6F        .db $6F
  $913E  60        RTS
  $913F  6F        .db $6F
  $9140  60        RTS
  $9141  6F        .db $6F
  $9142  60        RTS
  $9143  B2        .db $B2
  $9144  91 90     STA ($90),Y
  $9146  6F        .db $6F
  $9147  A0 60     LDY #$60
  $9149  6F        .db $6F
  $914A  60        RTS
  $914B  B2        .db $B2
  $914C  91 60     STA ($60),Y
  $914E  6F        .db $6F
  $914F  60        RTS
  $9150  6F        .db $6F
  $9151  6F        .db $6F
  $9152  60        RTS
  $9153  6F        .db $6F
  $9154  60        RTS
  $9155  6F        .db $6F
  $9156  60        RTS
  $9157  80        .db $80
  $9158  74        .db $74
  $9159  60        RTS
  $915A  B4 04     LDY $04,X
  $915C  01 2F     ORA ($2F,X)
  $915E  91 07     STA ($07),Y
  $9160  90 10     BCC $9172
  $9162  03        .db $03
  $9163  3D 02 80  AND $8002,X
  $9166  8C 80 8C  STY $8C80
  $9169  60        RTS
  $916A  6C 6C 60  JMP ($606C)
  $916D  6C 60 6C  JMP ($6C60)
  $9170  6A        ROR
  $9171  68        PLA

L_9172:
  $9172  06 8A     ASL $8A
  $9174  A8        TAY
  $9175  A0 88     LDY #$88
  $9177  8A        TXA
  $9178  88        DEY
  $9179  8C 80 8C  STY $8C80
  $917C  60        RTS
  $917D  6C 8D 8C  JMP ($8C8D)

L_9180:
  $9180  80        .db $80
  $9181  22        .db $22
  $9182  AF        .db $AF
  $9183  08        PHP
  $9184  01 AF     ORA ($AF,X)
  $9186  01 06     ORA ($06,X)

L_9188:
  $9188  AF        .db $AF
  $9189  01 00     ORA ($00,X)
  $918B  08        PHP
  $918C  00        BRK
  $918D  74        .db $74
  $918E  60        RTS
  $918F  B4 8F     LDY $8F,X
  $9191  80        .db $80
  $9192  8F        .db $8F
  $9193  60        RTS
  $9194  6F        .db $6F
  $9195  6F        .db $6F
  $9196  60        RTS
  $9197  6F        .db $6F
  $9198  60        RTS
  $9199  6F        .db $6F
  $919A  6D 6C 06  ADC $066C
  $919D  8D AC A0  STA $A0AC
  $91A0  8C 8D 8C  STY $8C8D
  $91A3  8F        .db $8F
  $91A4  80        .db $80
  $91A5  8F        .db $8F
  $91A6  60        RTS
  $91A7  6F        .db $6F
  $91A8  91 8F     STA ($8F),Y
  $91AA  80        .db $80
  $91AB  22        .db $22
  $91AC  B2        .db $B2
  $91AD  08        PHP
  $91AE  01 B2     ORA ($B2,X)
  $91B0  01 06     ORA ($06,X)
  $91B2  B2        .db $B2
  $91B3  01 00     ORA ($00,X)
  $91B5  08        PHP
  $91B6  00        BRK
  $91B7  74        .db $74
  $91B8  60        RTS
  $91B9  B4 94     LDY $94,X
  $91BB  80        .db $80
  $91BC  94 60     STY $60,X
  $91BE  74        .db $74
  $91BF  74        .db $74
  $91C0  60        RTS
  $91C1  74        .db $74
  $91C2  60        RTS
  $91C3  74        .db $74
  $91C4  71 6F     ADC ($6F),Y
  $91C6  06 91     ASL $91
  $91C8  AF        .db $AF
  $91C9  A0 8F     LDY #$8F
  $91CB  91 8F     STA ($8F),Y
  $91CD  94 80     STY $80,X
  $91CF  94 60     STY $60,X
  $91D1  74        .db $74
  $91D2  96 94     STX $94,Y
  $91D4  80        .db $80
  $91D5  21 B7     AND ($B7,X)
  $91D7  B7        .db $B7
  $91D8  01 06     ORA ($06,X)
  $91DA  B7        .db $B7
  $91DB  01 00     ORA ($00,X)
  $91DD  08        PHP
  $91DE  00        BRK
  $91DF  74        .db $74
  $91E0  60        RTS
  $91E1  B4 05     LDY $05,X
  $91E3  2F        .db $2F
  $91E4  8C 80 8C  STY $8C80
  $91E7  60        RTS
  $91E8  6C 6C 60  JMP ($606C)
  $91EB  6C 60 6C  JMP ($6C60)
  $91EE  6A        ROR
  $91EF  68        PLA
  $91F0  06 8A     ASL $8A
  $91F2  A8        TAY
  $91F3  A0 88     LDY #$88
  $91F5  8A        TXA
  $91F6  88        DEY
  $91F7  8C 80 8C  STY $8C80
  $91FA  60        RTS
  $91FB  6C 8D 8C  JMP ($8C8D)
  $91FE  80        .db $80
  $91FF  22        .db $22
  $9200  AF        .db $AF
  $9201  08        PHP
  $9202  01 8F     ORA ($8F,X)
  $9204  AF        .db $AF
  $9205  08        PHP
  $9206  00        BRK
  $9207  68        PLA
  $9208  6C 6F 74  JMP ($746F)
  $920B  6C 6F 74  JMP ($746F)
  $920E  78        SEI
  $920F  05 23     ORA $23
  $9211  02        .db $02
  $9212  40        RTI
  $9213  03        .db $03
  $9214  3C        .db $3C
  $9215  6F        .db $6F
  $9216  A0 60     LDY #$60
  $9218  6F        .db $6F
  $9219  60        RTS
  $921A  B2        .db $B2
  $921B  91 60     STA ($60),Y
  $921D  6F        .db $6F
  $921E  60        RTS
  $921F  6F        .db $6F
  $9220  6F        .db $6F
  $9221  60        RTS
  $9222  6F        .db $6F
  $9223  60        RTS
  $9224  6F        .db $6F
  $9225  60        RTS
  $9226  B2        .db $B2
  $9227  91 90     STA ($90),Y
  $9229  6F        .db $6F
  $922A  A0 60     LDY #$60
  $922C  6F        .db $6F
  $922D  60        RTS
  $922E  B2        .db $B2
  $922F  91 60     STA ($60),Y
  $9231  6F        .db $6F
  $9232  60        RTS
  $9233  6F        .db $6F
  $9234  6F        .db $6F
  $9235  60        RTS
  $9236  6F        .db $6F
  $9237  60        RTS
  $9238  6F        .db $6F
  $9239  60        RTS
  $923A  80        .db $80
  $923B  74        .db $74
  $923C  60        RTS
  $923D  B4 04     LDY $04,X
  $923F  01 15     ORA ($15,X)
  $9241  92        .db $92
  $9242  B1 91     LDA ($91),Y
  $9244  60        RTS
  $9245  71 91     ADC ($91),Y
  $9247  AD 91 21  LDA $2191
  $924A  AF        .db $AF
  $924B  08        PHP
  $924C  01 AF     ORA ($AF,X)
  $924E  08        PHP
  $924F  00        BRK
  $9250  6D 60 6D  ADC $6D60
  $9253  60        RTS
  $9254  6D 8F 6F  ADC $6F8F
  $9257  04        .db $04
  $9258  02        .db $02
  $9259  42        .db $42
  $925A  92        .db $92
  $925B  B1 91     LDA ($91),Y
  $925D  60        RTS
  $925E  71 91     ADC ($91),Y
  $9260  B4 91     LDY $91,X
  $9262  6F        .db $6F
  $9263  6F        .db $6F
  $9264  60        RTS
  $9265  74        .db $74
  $9266  74        .db $74
  $9267  60        RTS
  $9268  78        SEI
  $9269  78        SEI
  $926A  C0 04     CPY #$04
  $926C  00        BRK
  $926D  2F        .db $2F
  $926E  91 09     STA ($09),Y
  $9270  00        BRK
  $9271  06 07     ASL $07
  $9273  8A        TXA
  $9274  10 02     BPL $9278
  $9276  40        RTI
  $9277  03        .db $03

L_9278:
  $9278  36 05     ROL $05,X
  $927A  17        .db $17
  $927B  60        RTS
  $927C  88        DEY
  $927D  A0 85     LDY #$85
  $927F  A6 87     LDX $87
  $9281  60        RTS
  $9282  68        PLA
  $9283  60        RTS
  $9284  68        PLA
  $9285  68        PLA
  $9286  60        RTS
  $9287  88        DEY
  $9288  85 A6     STA $A6
  $928A  87        .db $87
  $928B  88        DEY
  $928C  88        DEY
  $928D  A0 85     LDY #$85
  $928F  A6 87     LDX $87
  $9291  60        RTS
  $9292  68        PLA
  $9293  60        RTS
  $9294  68        PLA
  $9295  68        PLA
  $9296  60        RTS
  $9297  88        DEY
  $9298  85 66     STA $66
  $929A  7B        .db $7B
  $929B  60        RTS
  $929C  BB        .db $BB
  $929D  60        RTS
  $929E  88        DEY
  $929F  A0 85     LDY #$85
  $92A1  A6 87     LDX $87
  $92A3  60        RTS
  $92A4  68        PLA
  $92A5  60        RTS
  $92A6  68        PLA
  $92A7  68        PLA
  $92A8  60        RTS
  $92A9  88        DEY
  $92AA  65 05     ADC $05
  $92AC  23        .db $23
  $92AD  6F        .db $6F
  $92AE  6F        .db $6F
  $92AF  60        RTS
  $92B0  6F        .db $6F
  $92B1  73        .db $73
  $92B2  74        .db $74
  $92B3  73        .db $73
  $92B4  6F        .db $6F
  $92B5  05 17     ORA $17
  $92B7  60        RTS
  $92B8  88        DEY
  $92B9  A0 85     LDY #$85
  $92BB  A6 87     LDX $87
  $92BD  60        RTS
  $92BE  05 23     ORA $23
  $92C0  6F        .db $6F
  $92C1  60        RTS
  $92C2  04        .db $04
  $92C3  04        .db $04
  $92C4  C0 92     CPY #$92
  $92C6  60        RTS
  $92C7  6F        .db $6F
  $92C8  73        .db $73
  $92C9  74        .db $74
  $92CA  73        .db $73
  $92CB  6F        .db $6F
  $92CC  6C A0 60  JMP ($60A0)
  $92CF  6C 60 AF  JMP ($AF60)
  $92D2  8D 60 6C  STA $6C60
  $92D5  60        RTS
  $92D6  6C 6C 60  JMP ($606C)
  $92D9  6C 60 6C  JMP ($6C60)
  $92DC  60        RTS
  $92DD  AF        .db $AF
  $92DE  8D 8D 6C  STA $6C8D
  $92E1  A0 60     LDY #$60
  $92E3  6C 60 AF  JMP ($AF60)
  $92E6  8D 60 6C  STA $6C60
  $92E9  60        RTS
  $92EA  6C 6C 60  JMP ($606C)
  $92ED  6C 60 6C  JMP ($6C60)
  $92F0  60        RTS
  $92F1  80        .db $80
  $92F2  6F        .db $6F
  $92F3  60        RTS
  $92F4  AF        .db $AF
  $92F5  04        .db $04
  $92F6  01 CC     ORA ($CC,X)
  $92F8  92        .db $92
  $92F9  03        .db $03
  $92FA  37        .db $37
  $92FB  07        .db $07
  $92FC  8D 20 02  STA $0220
  $92FF  00        BRK
  $9300  8F        .db $8F
  $9301  8C 8F 6C  STY $6C8F
  $9304  6F        .db $6F
  $9305  60        RTS
  $9306  94 60     STY $60,X
  $9308  8F        .db $8F
  $9309  6C 6F 60  JMP ($606F)
  $930C  6F        .db $6F
  $930D  8C 8F 6C  STY $6C8F
  $9310  6F        .db $6F
  $9311  60        RTS
  $9312  74        .db $74
  $9313  6F        .db $6F
  $9314  6C 6F 6C  JMP ($6C6F)
  $9317  68        PLA
  $9318  63        .db $63
  $9319  8F        .db $8F
  $931A  8C 8F 6C  STY $6C8F
  $931D  6F        .db $6F
  $931E  60        RTS
  $931F  94 60     STY $60,X
  $9321  8F        .db $8F
  $9322  6C 6F 60  JMP ($606F)
  $9325  6F        .db $6F
  $9326  8C 8F 6C  STY $6C8F
  $9329  6F        .db $6F
  $932A  60        RTS
  $932B  74        .db $74
  $932C  07        .db $07
  $932D  85 10     STA $10
  $932F  03        .db $03
  $9330  3A        .db $3A
  $9331  02        .db $02
  $9332  40        RTI
  $9333  6F        .db $6F
  $9334  60        RTS
  $9335  AF        .db $AF
  $9336  04        .db $04
  $9337  03        .db $03
  $9338  F9 92 6C  SBC $6C92,Y
  $933B  A0 60     LDY #$60
  $933D  6C 60 AF  JMP ($AF60)
  $9340  8D 60 6C  STA $6C60
  $9343  60        RTS
  $9344  6C 6C 60  JMP ($606C)
  $9347  6C 60 6C  JMP ($6C60)
  $934A  60        RTS
  $934B  AF        .db $AF
  $934C  8D 8D 6C  STA $6C8D
  $934F  A0 60     LDY #$60
  $9351  6C 60 AF  JMP ($AF60)
  $9354  8D 60 6C  STA $6C60
  $9357  60        RTS
  $9358  6C 6C 60  JMP ($606C)
  $935B  6C 60 6C  JMP ($6C60)
  $935E  60        RTS
  $935F  80        .db $80
  $9360  6F        .db $6F
  $9361  60        RTS
  $9362  AF        .db $AF
  $9363  04        .db $04
  $9364  01 3A     ORA ($3A,X)
  $9366  93        .db $93
  $9367  AD 8D 60  LDA $608D
  $936A  6D 8D AA  ADC $AA8D
  $936D  8D 21 AC  STA $AC21
  $9370  AC 6A 60  LDY $606A
  $9373  6A        ROR
  $9374  60        RTS
  $9375  6A        ROR
  $9376  8C 6C 04  STY $046C
  $9379  02        .db $02
  $937A  67        .db $67
  $937B  93        .db $93
  $937C  AD 8D 60  LDA $608D
  $937F  6D 8D B1  ADC $B18D
  $9382  8D 6C 6C  STA $6C6C
  $9385  60        RTS
  $9386  6F        .db $6F
  $9387  6F        .db $6F
  $9388  60        RTS
  $9389  74        .db $74
  $938A  74        .db $74
  $938B  C0 04     CPY #$04
  $938D  00        BRK
  $938E  CC 92 09  CPY $0992
  $9391  00        BRK
  $9392  06 03     ASL $03
  $9394  25 05     AND $05
  $9396  23        .db $23
  $9397  88        DEY
  $9398  80        .db $80
  $9399  01 10     ORA ($10,X)
  $939B  94 01     STY $01,X
  $939D  00        BRK
  $939E  85 A6     STA $A6
  $93A0  87        .db $87
  $93A1  60        RTS
  $93A2  68        PLA
  $93A3  60        RTS
  $93A4  68        PLA
  $93A5  68        PLA
  $93A6  01 10     ORA ($10,X)
  $93A8  74        .db $74
  $93A9  94 01     STY $01,X
  $93AB  00        BRK
  $93AC  85 86     STA $86
  $93AE  92        .db $92
  $93AF  87        .db $87
  $93B0  93        .db $93
  $93B1  04        .db $04
  $93B2  02        .db $02
  $93B3  97        .db $97
  $93B4  93        .db $93
  $93B5  88        DEY
  $93B6  80        .db $80
  $93B7  01 10     ORA ($10,X)
  $93B9  94 01     STY $01,X
  $93BB  00        BRK
  $93BC  85 A6     STA $A6
  $93BE  87        .db $87
  $93BF  88        DEY
  $93C0  88        DEY
  $93C1  88        DEY
  $93C2  88        DEY
  $93C3  88        DEY
  $93C4  68        PLA
  $93C5  01 10     ORA ($10,X)
  $93C7  7D 7D 7D  ADC $7D7D,X
  $93CA  7A        .db $7A
  $93CB  7A        .db $7A
  $93CC  78        SEI
  $93CD  78        SEI
  $93CE  01 00     ORA ($00,X)
  $93D0  88        DEY
  $93D1  80        .db $80
  $93D2  01 10     ORA ($10,X)
  $93D4  94 01     STY $01,X
  $93D6  00        BRK
  $93D7  85 A6     STA $A6
  $93D9  87        .db $87
  $93DA  60        RTS

L_93DB:
  $93DB  68        PLA
  $93DC  60        RTS
  $93DD  68        PLA
  $93DE  68        PLA
  $93DF  01 10     ORA ($10,X)
  $93E1  74        .db $74
  $93E2  94 01     STY $01,X
  $93E4  00        BRK
  $93E5  85 86     STA $86
  $93E7  92        .db $92
  $93E8  87        .db $87
  $93E9  93        .db $93
  $93EA  04        .db $04
  $93EB  0F        .db $0F
  $93EC  CE 93 06  DEC $0693
  $93EF  86 06     STX $06
  $93F1  8A        TXA
  $93F2  8D 60 71  STA $7160
  $93F5  6D 6A 6D  ADC $6D6A
  $93F8  6A        ROR
  $93F9  66 65     ROR $65
  $93FB  06 88     ASL $88
  $93FD  06 8C     ASL $8C
  $93FF  8F        .db $8F
  $9400  66 60     ROR $60
  $9402  66 60     ROR $60
  $9404  66 88     ROR $88
  $9406  68        PLA
  $9407  04        .db $04
  $9408  02        .db $02
  $9409  EE 93 06  INC $0693
  $940C  86 06     STX $06
  $940E  8A        TXA
  $940F  8D 60 71  STA $7160
  $9412  6D 6A 6D  ADC $6D6A
  $9415  6A        ROR
  $9416  66 65     ROR $65
  $9418  68        PLA
  $9419  68        PLA
  $941A  60        RTS
  $941B  6C 6C 60  JMP ($606C)
  $941E  6F        .db $6F
  $941F  6F        .db $6F
  $9420  01 10     ORA ($10,X)
  $9422  60        RTS
  $9423  7D 7D 7D  ADC $7D7D,X
  $9426  7A        .db $7A
  $9427  7A        .db $7A
  $9428  78        SEI
  $9429  78        SEI
  $942A  01 00     ORA ($00,X)
  $942C  04        .db $04
  $942D  00        BRK
  $942E  CE 93 00  DEC $0093
  $9431  06 03     ASL $03
  $9433  3A        .db $3A
  $9434  07        .db $07
  $9435  83        .db $83
  $9436  F0 A3     BEQ $93DB
  $9438  07        .db $07
  $9439  83        .db $83
  $943A  40        RTI
  $943B  A5 04     LDA $04
  $943D  0D 34 94  ORA $9434
  $9440  85 85     STA $85
  $9442  85 85     STA $85
  $9444  01 15     ORA ($15,X)
  $9446  A0 A5     LDY #$A5
  $9448  A0 A5     LDY #$A5
  $944A  A0 A5     LDY #$A5
  $944C  A0 A5     LDY #$A5
  $944E  A0 A5     LDY #$A5
  $9450  A0 A5     LDY #$A5
  $9452  A0 A5     LDY #$A5
  $9454  A0 A5     LDY #$A5
  $9456  80        .db $80
  $9457  85 A5     STA $A5
  $9459  04        .db $04
  $945A  07        .db $07
  $945B  48        PHA
  $945C  94 A0     STY $A0,X
  $945E  A5 A0     LDA $A0
  $9460  A5 A0     LDA $A0
  $9462  A5 85     LDA $85
  $9464  85 65     STA $65
  $9466  65 60     ADC $60

L_9468:
  $9468  65 04     ADC $04
  $946A  02        .db $02
  $946B  5D 94 A0  EOR $A094,X
  $946E  A5 A0     LDA $A0
  $9470  A5 63     LDA $63
  $9472  63        .db $63
  $9473  60        RTS
  $9474  64        .db $64
  $9475  64        .db $64
  $9476  60        RTS
  $9477  65 65     ADC $65
  $9479  A0 A5     LDY #$A5
  $947B  04        .db $04
  $947C  00        BRK
  $947D  48        PHA
  $947E  94 00     STY $00,X
  $9480  00        BRK
  $9481  80        .db $80
  $9482  00        BRK
  $9483  01 62     ORA ($62,X)
  $9485  80        .db $80
  $9486  00        BRK
  $9487  0F        .db $0F
  $9488  92        .db $92
  $9489  94 64     STY $64,X
  $948B  95 1C     STA $1C,X
  $948D  96 71     STX $71,Y
  $948F  96 98     STX $98,Y
  $9491  96 00     STX $00,Y
  $9493  06 02     ASL $02
  $9495  00        BRK
  $9496  03        .db $03
  $9497  38        SEC
  $9498  05 15     ORA $15
  $949A  07        .db $07
  $949B  84 60     STY $60
  $949D  65 65     ADC $65
  $949F  71 65     ADC ($65),Y
  $94A1  6F        .db $6F
  $94A2  70 65     BVS $9509
  $94A4  71 65     ADC ($65),Y
  $94A6  6C 65 6B  JMP ($6B65)
  $94A9  65 6A     ADC $6A
  $94AB  69 68     ADC #$68
  $94AD  65 65     ADC $65
  $94AF  6F        .db $6F
  $94B0  65 6D     ADC $6D
  $94B2  6E 65 6F  ROR $6F65
  $94B5  65 6A     ADC $6A
  $94B7  65 69     ADC $69
  $94B9  65 68     ADC $68
  $94BB  67        .db $67
  $94BC  66 04     ROR $04
  $94BE  02        .db $02
  $94BF  9D 94 65  STA $6594,X
  $94C2  65 71     ADC $71
  $94C4  65 6F     ADC $6F
  $94C6  70 65     BVS $952D
  $94C8  71 65     ADC ($65),Y
  $94CA  6C 65 6B  JMP ($6B65)
  $94CD  65 6A     ADC $6A
  $94CF  69 68     ADC #$68
  $94D1  6F        .db $6F
  $94D2  6F        .db $6F
  $94D3  60        RTS
  $94D4  6C 71 71  JMP ($7171)
  $94D7  60        RTS
  $94D8  6C 6C 6F  JMP ($6F6C)
  $94DB  6C 71 A0  JMP ($A071)
  $94DE  03        .db $03
  $94DF  3A        .db $3A
  $94E0  07        .db $07
  $94E1  02        .db $02
  $94E2  A0 05     LDY #$05
  $94E4  21 02     AND ($02,X)
  $94E6  40        RTI
  $94E7  21 AC     AND ($AC,X)
  $94E9  AC 6C 60  LDY $606C
  $94EC  6C 60 6C  JMP ($6C60)
  $94EF  6A        ROR
  $94F0  68        PLA
  $94F1  21 AA     AND ($AA,X)
  $94F3  AA        TAX
  $94F4  6A        ROR
  $94F5  6A        ROR
  $94F6  60        RTS
  $94F7  6C 60 6A  JMP ($6A60)
  $94FA  67        .db $67
  $94FB  60        RTS
  $94FC  88        DEY
  $94FD  02        .db $02
  $94FE  80        .db $80
  $94FF  65 68     ADC $68
  $9501  6C 71 60  JMP ($6071)
  $9504  6C 60 6A  JMP ($6A60)
  $9507  6C 60 6A  JMP ($6A60)
  $950A  60        RTS
  $950B  63        .db $63
  $950C  65 67     ADC $67
  $950E  71 60     ADC ($60),Y
  $9510  71 73     ADC ($73),Y
  $9512  74        .db $74
  $9513  78        SEI
  $9514  60        RTS
  $9515  71 60     ADC ($60),Y
  $9517  6C 6F 71  JMP ($716F)
  $951A  74        .db $74
  $951B  73        .db $73
  $951C  71 6F     ADC ($6F),Y
  $951E  02        .db $02
  $951F  40        RTI
  $9520  21 AC     AND ($AC,X)
  $9522  AC 6C 60  LDY $606C
  $9525  6C 60 6C  JMP ($6C60)
  $9528  6A        ROR
  $9529  68        PLA
  $952A  21 AA     AND ($AA,X)
  $952C  AA        TAX

L_952D:
  $952D  6A        ROR
  $952E  6A        ROR
  $952F  60        RTS
  $9530  6C 60 6A  JMP ($6A60)
  $9533  67        .db $67
  $9534  60        RTS
  $9535  88        DEY
  $9536  02        .db $02
  $9537  80        .db $80
  $9538  65 68     ADC $68
  $953A  6C 71 60  JMP ($6071)
  $953D  6C 60 6A  JMP ($6A60)
  $9540  6C 60 6A  JMP ($6A60)
  $9543  60        RTS
  $9544  63        .db $63
  $9545  65 67     ADC $67
  $9547  02        .db $02
  $9548  80        .db $80
  $9549  73        .db $73
  $954A  73        .db $73
  $954B  60        RTS
  $954C  71 74     ADC ($74),Y
  $954E  74        .db $74
  $954F  60        RTS
  $9550  71 71     ADC ($71),Y
  $9552  73        .db $73
  $9553  71 74     ADC ($74),Y
  $9555  80        .db $80
  $9556  60        RTS
  $9557  05 15     ORA $15
  $9559  02        .db $02
  $955A  00        BRK
  $955B  07        .db $07
  $955C  84 60     STY $60
  $955E  21 6C     AND ($6C,X)
  $9560  04        .db $04
  $9561  00        BRK
  $9562  94 94     STY $94,X
  $9564  00        BRK
  $9565  06 07     ASL $07
  $9567  84 60     STY $60
  $9569  02        .db $02
  $956A  80        .db $80
  $956B  03        .db $03
  $956C  37        .db $37
  $956D  05 13     ORA $13
  $956F  01 25     ORA ($25,X)
  $9571  6C 6C 9D  JMP ($9D6C)
  $9574  6C 9D 6C  JMP ($6C9D)
  $9577  60        RTS
  $9578  7D 9A 7D  ADC $7D9A,X
  $957B  7C        .db $7C
  $957C  7A        .db $7A
  $957D  78        SEI
  $957E  04        .db $04
  $957F  06 6F     ASL $6F
  $9581  95 7D     STA $7D,X
  $9583  7D 60 7C  ADC $7C60,X
  $9586  7C        .db $7C
  $9587  7C        .db $7C
  $9588  60        RTS
  $9589  7A        .db $7A
  $958A  7D 7C 7A  ADC $7A7C,X
  $958D  78        SEI
  $958E  60        RTS
  $958F  7C        .db $7C
  $9590  7C        .db $7C
  $9591  60        RTS
  $9592  01 00     ORA ($00,X)
  $9594  05 21     ORA $21
  $9596  03        .db $03
  $9597  36 07     ROL $07,X
  $9599  02        .db $02
  $959A  A0 02     LDY #$02
  $959C  40        RTI
  $959D  21 A8     AND ($A8,X)
  $959F  A8        TAY
  $95A0  68        PLA
  $95A1  60        RTS
  $95A2  68        PLA
  $95A3  60        RTS
  $95A4  68        PLA
  $95A5  67        .db $67
  $95A6  65 21     ADC $21
  $95A8  A7        .db $A7
  $95A9  A7        .db $A7
  $95AA  67        .db $67
  $95AB  67        .db $67
  $95AC  60        RTS
  $95AD  68        PLA
  $95AE  60        RTS
  $95AF  67        .db $67
  $95B0  63        .db $63
  $95B1  60        RTS
  $95B2  85 02     STA $02
  $95B4  80        .db $80
  $95B5  03        .db $03
  $95B6  36 60     ROL $60,X
  $95B8  65 68     ADC $68
  $95BA  6C 71 60  JMP ($6071)
  $95BD  6C 60 6A  JMP ($6A60)
  $95C0  6C 60 6A  JMP ($6A60)
  $95C3  60        RTS
  $95C4  63        .db $63
  $95C5  65 67     ADC $67
  $95C7  71 60     ADC ($60),Y
  $95C9  71 73     ADC ($73),Y
  $95CB  74        .db $74
  $95CC  78        SEI
  $95CD  60        RTS
  $95CE  71 60     ADC ($60),Y
  $95D0  6C 6F 71  JMP ($716F)
  $95D3  74        .db $74
  $95D4  73        .db $73
  $95D5  71 02     ADC ($02),Y
  $95D7  40        RTI
  $95D8  21 A8     AND ($A8,X)
  $95DA  A8        TAY
  $95DB  68        PLA
  $95DC  60        RTS
  $95DD  68        PLA
  $95DE  60        RTS
  $95DF  68        PLA
  $95E0  67        .db $67
  $95E1  65 21     ADC $21
  $95E3  A7        .db $A7
  $95E4  A7        .db $A7
  $95E5  67        .db $67
  $95E6  67        .db $67
  $95E7  60        RTS
  $95E8  68        PLA
  $95E9  60        RTS
  $95EA  67        .db $67
  $95EB  63        .db $63
  $95EC  60        RTS
  $95ED  85 02     STA $02
  $95EF  80        .db $80
  $95F0  60        RTS
  $95F1  03        .db $03
  $95F2  36 65     ROL $65,X
  $95F4  68        PLA
  $95F5  6C 71 60  JMP ($6071)
  $95F8  6C 60 6A  JMP ($6A60)
  $95FB  6C 60 6A  JMP ($6A60)
  $95FE  60        RTS
  $95FF  63        .db $63
  $9600  65 03     ADC $03
  $9602  3A        .db $3A
  $9603  02        .db $02
  $9604  80        .db $80
  $9605  6F        .db $6F
  $9606  6F        .db $6F
  $9607  60        RTS
  $9608  6C 71 71  JMP ($7171)
  $960B  60        RTS
  $960C  6C 6C 6F  JMP ($6F6C)
  $960F  6C 71 A0  JMP ($A071)
  $9612  05 15     ORA $15
  $9614  03        .db $03
  $9615  38        SEC
  $9616  02        .db $02
  $9617  40        RTI
  $9618  04        .db $04
  $9619  00        BRK
  $961A  66 95     ROR $95
  $961C  00        BRK
  $961D  06 03     ASL $03
  $961F  1A        .db $1A
  $9620  05 21     ORA $21
  $9622  65 65     ADC $65
  $9624  71 65     ADC ($65),Y
  $9626  6F        .db $6F
  $9627  70 65     BVS $968E
  $9629  71 65     ADC ($65),Y
  $962B  6C 65 6B  JMP ($6B65)
  $962E  65 6A     ADC $6A
  $9630  69 68     ADC #$68
  $9632  65 65     ADC $65
  $9634  6F        .db $6F
  $9635  65 6D     ADC $6D

L_9637:
  $9637  6E 65 6F  ROR $6F65
  $963A  65 6A     ADC $6A
  $963C  65 69     ADC $69
  $963E  65 68     ADC $68
  $9640  67        .db $67
  $9641  66 04     ROR $04
  $9643  02        .db $02
  $9644  22        .db $22
  $9645  96 65     STX $65,Y
  $9647  65 71     ADC $71
  $9649  65 6F     ADC $6F
  $964B  70 65     BVS $96B2
  $964D  71 65     ADC ($65),Y
  $964F  6C 65 6B  JMP ($6B65)
  $9652  65 6A     ADC $6A
  $9654  69 68     ADC #$68
  $9656  6F        .db $6F
  $9657  6F        .db $6F
  $9658  60        RTS
  $9659  6C 71 71  JMP ($7171)
  $965C  60        RTS
  $965D  6C 6C 6F  JMP ($6F6C)
  $9660  6C 71 01  JMP ($0171)
  $9663  10 60     BPL $96C5
  $9665  7D 7A 01  ADC $017A,X
  $9668  00        BRK
  $9669  21 65     AND ($65,X)
  $966B  03        .db $03
  $966C  30 04     BMI $9672
  $966E  00        BRK
  $966F  22        .db $22
  $9670  96 00     STX $00,Y

L_9672:
  $9672  06 03     ASL $03
  $9674  3F        .db $3F
  $9675  07        .db $07
  $9676  83        .db $83
  $9677  A0 62     LDY #$62
  $9679  03        .db $03
  $967A  3A        .db $3A
  $967B  07        .db $07
  $967C  82        .db $82
  $967D  A0 62     LDY #$62
  $967F  62        .db $62
  $9680  62        .db $62
  $9681  04        .db $04
  $9682  1B        .db $1B
  $9683  73        .db $73
  $9684  96 07     STX $07,Y
  $9686  83        .db $83
  $9687  A0 6A     LDY #$6A
  $9689  8A        TXA
  $968A  6A        ROR
  $968B  6A        ROR
  $968C  8A        TXA
  $968D  6A        ROR

L_968E:
  $968E  6A        ROR
  $968F  6A        ROR
  $9690  6A        ROR
  $9691  8A        TXA
  $9692  6A        ROR
  $9693  8A        TXA
  $9694  04        .db $04
  $9695  00        BRK
  $9696  73        .db $73
  $9697  96 0F     STX $0F,Y
  $9699  A3        .db $A3
  $969A  96 CF     STX $CF,Y
  $969C  97        .db $97
  $969D  F0 98     BEQ $9637
  $969F  17        .db $17
  $96A0  9A        TXS
  $96A1  3A        .db $3A
  $96A2  9A        TXS
  $96A3  00        BRK
  $96A4  05 03     ORA $03
  $96A6  3C        .db $3C
  $96A7  02        .db $02
  $96A8  00        BRK
  $96A9  05 1D     ORA $1D
  $96AB  07        .db $07
  $96AC  92        .db $92
  $96AD  10 AC     BPL $965B
  $96AF  8F        .db $8F
  $96B0  AE AD AC  LDX $ACAD
  $96B3  AF        .db $AF

L_96B4:
  $96B4  AE AD 80  LDX $80AD
  $96B7  21 AC     AND ($AC,X)
  $96B9  08        PHP
  $96BA  01 AC     ORA ($AC,X)
  $96BC  08        PHP
  $96BD  00        BRK
  $96BE  8C 8A 88  STY $888A
  $96C1  A7        .db $A7
  $96C2  88        DEY
  $96C3  8A        TXA
  $96C4  A3        .db $A3

L_96C5:
  $96C5  85 87     STA $87
  $96C7  85 A0     STA $A0
  $96C9  8F        .db $8F
  $96CA  AE AD AC  LDX $ACAD
  $96CD  AF        .db $AF
  $96CE  AE AD 80  LDX $80AD
  $96D1  21 AC     AND ($AC,X)
  $96D3  08        PHP
  $96D4  01 AC     ORA ($AC,X)
  $96D6  08        PHP
  $96D7  00        BRK
  $96D8  8C 8A 88  STY $888A
  $96DB  A7        .db $A7
  $96DC  88        DEY
  $96DD  8A        TXA
  $96DE  A3        .db $A3
  $96DF  85 87     STA $87
  $96E1  85 02     STA $02
  $96E3  80        .db $80
  $96E4  07        .db $07
  $96E5  84 10     STY $10
  $96E7  80        .db $80
  $96E8  85 87     STA $87
  $96EA  85 88     STA $88
  $96EC  85 8A     STA $8A
  $96EE  85 07     STA $07
  $96F0  90 10     BCC $9702
  $96F2  02        .db $02
  $96F3  C0 05     CPY #$05
  $96F5  29 87     AND #$87
  $96F7  87        .db $87
  $96F8  87        .db $87
  $96F9  87        .db $87
  $96FA  87        .db $87
  $96FB  87        .db $87
  $96FC  80        .db $80
  $96FD  05 1D     ORA $1D
  $96FF  07        .db $07
  $9700  92        .db $92
  $9701  10 21     BPL $9724
  $9703  B1 08     LDA ($08),Y
  $9705  01 B1     ORA ($B1,X)
  $9707  08        PHP
  $9708  00        BRK
  $9709  8C 8F 91  STY $918F
  $970C  80        .db $80
  $970D  91 80     STA ($80),Y
  $970F  B1 8C     LDA ($8C),Y
  $9711  AF        .db $AF
  $9712  B0 06     BCS $971A
  $9714  B1 AF     LDA ($AF),Y
  $9716  06 B1     ASL $B1
  $9718  D8        CLD
  $9719  91 B0     STA ($B0),Y
  $971B  CF        .db $CF
  $971C  8A        TXA
  $971D  8C 8F 80  STY $808F
  $9720  8F        .db $8F
  $9721  80        .db $80
  $9722  8F        .db $8F
  $9723  8D 8F 80  STA $808F
  $9726  93        .db $93
  $9727  91 8F     STA ($8F),Y
  $9729  06 AF     ASL $AF
  $972B  AA        TAX
  $972C  06 AC     ASL $AC
  $972E  80        .db $80
  $972F  8F        .db $8F
  $9730  AF        .db $AF
  $9731  8F        .db $8F
  $9732  90 80     BCC $96B4
  $9734  B1 8F     LDA ($8F),Y
  $9736  8C 91 93  STY $9391
  $9739  91 94     STA ($94),Y
  $973B  96 05     STX $05,Y
  $973D  29 6B     AND #$6B
  $973F  8C 8F 6C  STY $6C8F
  $9742  6F        .db $6F
  $9743  70 71     BVS $97B6
  $9745  74        .db $74
  $9746  73        .db $73
  $9747  71 6F     ADC ($6F),Y
  $9749  70 71     BVS $97BC
  $974B  6F        .db $6F
  $974C  06 AC     ASL $AC
  $974E  06 AA     ASL $AA
  $9750  A8        TAY
  $9751  80        .db $80
  $9752  06 A7     ASL $A7
  $9754  A5 A3     LDA $A3
  $9756  69 21     ADC #$21
  $9758  6A        ROR
  $9759  AA        TAX
  $975A  6E 21 6F  ROR $6F21
  $975D  AF        .db $AF
  $975E  75 22     ADC $22,X
  $9760  76 B6     ROR $B6,X
  $9762  08        PHP
  $9763  01 B6     ORA ($B6,X)
  $9765  08        PHP
  $9766  00        BRK
  $9767  B3        .db $B3
  $9768  92        .db $92
  $9769  91 8F     STA ($8F),Y
  $976B  6D 6C 6D  ADC $6D6C
  $976E  6F        .db $6F
  $976F  71 6F     ADC ($6F),Y
  $9771  71 73     ADC ($73),Y
  $9773  74        .db $74
  $9774  73        .db $73
  $9775  74        .db $74
  $9776  76 78     ROR $78,X
  $9778  76 78     ROR $78,X
  $977A  79 01 01  ADC $0101,Y
  $977D  DE 01 00  DEC $0001,X
  $9780  05 1D     ORA $1D
  $9782  94 93     STY $93,X
  $9784  80        .db $80
  $9785  07        .db $07
  $9786  92        .db $92
  $9787  10 02     BPL $978B
  $9789  80        .db $80
  $978A  91 80     STA ($80),Y
  $978C  91 91     STA ($91),Y
  $978E  8F        .db $8F
  $978F  B1 A0     LDA ($A0),Y
  $9791  91 80     STA ($80),Y
  $9793  91 8F     STA ($8F),Y
  $9795  91 94     STA ($94),Y
  $9797  80        .db $80
  $9798  98        TYA
  $9799  80        .db $80
  $979A  21 B6     AND ($B6,X)
  $979C  08        PHP
  $979D  01 D6     ORA ($D6,X)
  $979F  08        PHP
  $97A0  00        BRK
  $97A1  80        .db $80
  $97A2  BB        .db $BB
  $97A3  B9 B8 96  LDA $96B8,Y
  $97A6  91 80     STA ($80),Y
  $97A8  91 91     STA ($91),Y
  $97AA  8F        .db $8F
  $97AB  B1 A0     LDA ($A0),Y
  $97AD  91 80     STA ($80),Y
  $97AF  91 8F     STA ($8F),Y
  $97B1  91 94     STA ($94),Y
  $97B3  80        .db $80
  $97B4  98        TYA
  $97B5  80        .db $80

L_97B6:
  $97B6  21 B6     AND ($B6,X)
  $97B8  96 96     STX $96,Y
  $97BA  93        .db $93
  $97BB  80        .db $80

L_97BC:
  $97BC  22        .db $22
  $97BD  B8        CLV
  $97BE  08        PHP
  $97BF  01 B8     ORA ($B8,X)
  $97C1  98        TYA
  $97C2  08        PHP
  $97C3  00        BRK
  $97C4  03        .db $03
  $97C5  3E 02 00  ROL $0002,X
  $97C8  8C A8 8A  STY $8AA8
  $97CB  04        .db $04
  $97CC  00        BRK
  $97CD  A5 96     LDA $96
  $97CF  00        BRK
  $97D0  05 03     ORA $03
  $97D2  3C        .db $3C
  $97D3  02        .db $02
  $97D4  00        BRK
  $97D5  05 1D     ORA $1D
  $97D7  07        .db $07
  $97D8  92        .db $92
  $97D9  10 A8     BPL $9783
  $97DB  8C AB AA  STY $AAAB
  $97DE  A8        TAY
  $97DF  AC AB AA  LDY $AAAB
  $97E2  80        .db $80
  $97E3  C8        INY
  $97E4  88        DEY
  $97E5  87        .db $87
  $97E6  85 A3     STA $A3
  $97E8  85 87     STA $87
  $97EA  05 11     ORA $11
  $97EC  AC 8C 8F  LDY $8F8C
  $97EF  8C 05 1D  STY $1D05
  $97F2  A0 8C     LDY #$8C
  $97F4  AB        .db $AB
  $97F5  AA        TAX
  $97F6  A8        TAY
  $97F7  AC AB AA  LDY $AAAB
  $97FA  80        .db $80
  $97FB  C8        INY
  $97FC  88        DEY
  $97FD  87        .db $87
  $97FE  85 A3     STA $A3
  $9800  85 87     STA $87
  $9802  05 11     ORA $11
  $9804  AC 8C 8F  LDY $8F8C
  $9807  8C 05 1D  STY $1D05
  $980A  03        .db $03
  $980B  38        SEC
  $980C  02        .db $02
  $980D  80        .db $80
  $980E  07        .db $07
  $980F  84 10     STY $10
  $9811  60        RTS
  $9812  80        .db $80
  $9813  85 87     STA $87
  $9815  85 88     STA $88
  $9817  85 8A     STA $8A
  $9819  65 07     ADC $07
  $981B  90 10     BCC $982D
  $981D  02        .db $02
  $981E  C0 03     CPY #$03
  $9820  3C        .db $3C
  $9821  05 29     ORA $29
  $9823  83        .db $83
  $9824  83        .db $83
  $9825  83        .db $83
  $9826  83        .db $83
  $9827  83        .db $83
  $9828  84 80     STY $80
  $982A  05 1D     ORA $1D
  $982C  07        .db $07

L_982D:
  $982D  92        .db $92
  $982E  10 03     BPL $9833
  $9830  38        SEC
  $9831  80        .db $80
  $9832  D1 8C     CMP ($8C),Y
  $9834  8F        .db $8F
  $9835  91 80     STA ($80),Y
  $9837  91 80     STA ($80),Y
  $9839  B1 8C     LDA ($8C),Y
  $983B  AF        .db $AF
  $983C  B0 06     BCS $9844
  $983E  B1 AF     LDA ($AF),Y
  $9840  06 B1     ASL $B1
  $9842  D8        CLD
  $9843  91 B0     STA ($B0),Y
  $9845  CF        .db $CF
  $9846  8A        TXA
  $9847  8C 8F 80  STY $808F
  $984A  8F        .db $8F
  $984B  80        .db $80
  $984C  8F        .db $8F
  $984D  8D 8F 80  STA $808F
  $9850  93        .db $93
  $9851  91 8F     STA ($8F),Y
  $9853  06 AF     ASL $AF
  $9855  AA        TAX
  $9856  06 AC     ASL $AC
  $9858  80        .db $80
  $9859  8F        .db $8F
  $985A  8F        .db $8F
  $985B  93        .db $93
  $985C  93        .db $93
  $985D  80        .db $80
  $985E  B4 80     LDY $80,X
  $9860  8F        .db $8F
  $9861  8C 91 93  STY $9391
  $9864  91 94     STA ($94),Y
  $9866  96 05     STX $05,Y
  $9868  29 6B     AND #$6B
  $986A  8C 8F 6C  STY $6C8F
  $986D  6F        .db $6F
  $986E  70 71     BVS $98E1
  $9870  74        .db $74
  $9871  73        .db $73
  $9872  71 6F     ADC ($6F),Y
  $9874  70 71     BVS $98E7
  $9876  6F        .db $6F
  $9877  06 AC     ASL $AC
  $9879  06 AA     ASL $AA
  $987B  A8        TAY
  $987C  80        .db $80
  $987D  06 A7     ASL $A7
  $987F  A5 A3     LDA $A3
  $9881  69 21     ADC #$21
  $9883  6A        ROR
  $9884  AA        TAX
  $9885  6E 21 6F  ROR $6F21
  $9888  AF        .db $AF
  $9889  75 22     ADC $22,X
  $988B  76 D6     ROR $D6,X
  $988D  B3        .db $B3
  $988E  92        .db $92
  $988F  91 8F     STA ($8F),Y
  $9891  6D 6C 6D  ADC $6D6C
  $9894  6F        .db $6F
  $9895  71 6F     ADC ($6F),Y
  $9897  71 73     ADC ($73),Y
  $9899  74        .db $74
  $989A  73        .db $73
  $989B  74        .db $74
  $989C  76 78     ROR $78,X
  $989E  76 78     ROR $78,X
  $98A0  79 01 01  ADC $0101,Y
  $98A3  DE 01 00  DEC $0001,X
  $98A6  05 1D     ORA $1D

L_98A8:
  $98A8  94 93     STY $93,X
  $98AA  07        .db $07
  $98AB  92        .db $92
  $98AC  10 02     BPL $98B0
  $98AE  80        .db $80
  $98AF  8D 80 8D  STA $8D80
  $98B2  8D 8C AD  STA $AD8C
  $98B5  A0 8D     LDY #$8D
  $98B7  80        .db $80
  $98B8  8D 8C 8D  STA $8D8C
  $98BB  8F        .db $8F
  $98BC  80        .db $80
  $98BD  94 80     STY $80,X
  $98BF  02        .db $02
  $98C0  00        BRK
  $98C1  80        .db $80
  $98C2  93        .db $93
  $98C3  93        .db $93
  $98C4  93        .db $93
  $98C5  B4 80     LDY $80,X

L_98C7:
  $98C7  02        .db $02
  $98C8  80        .db $80
  $98C9  06 80     ASL $80
  $98CB  BB        .db $BB
  $98CC  B9 06 98  LDA $9806,Y
  $98CF  8D 80 8D  STA $8D80
  $98D2  8D 8C AD  STA $AD8C
  $98D5  A0 8D     LDY #$8D
  $98D7  80        .db $80
  $98D8  8D 8C 8D  STA $8D8C
  $98DB  8F        .db $8F
  $98DC  80        .db $80
  $98DD  94 80     STY $80,X
  $98DF  93        .db $93
  $98E0  93        .db $93

L_98E1:
  $98E1  93        .db $93
  $98E2  80        .db $80
  $98E3  96 93     STX $93,Y
  $98E5  80        .db $80
  $98E6  D8        CLD

L_98E7:
  $98E7  03        .db $03
  $98E8  3E 87 A5  ROL $A587,X
  $98EB  87        .db $87
  $98EC  04        .db $04
  $98ED  00        BRK
  $98EE  D1 97     CMP ($97),Y
  $98F0  00        BRK
  $98F1  05 03     ORA $03
  $98F3  31 05     AND ($05),Y
  $98F5  1D 91 80  ORA $8091,X
  $98F8  01 10     ORA ($10,X)
  $98FA  9D 01 00  STA $0001,X
  $98FD  8C 8F 91  STY $918F
  $9900  01 10     ORA ($10,X)
  $9902  9D 01 00  STA $0001,X
  $9905  91 80     STA ($80),Y
  $9907  91 01     STA ($01),Y
  $9909  10 9D     BPL $98A8
  $990B  01 00     ORA ($00,X)
  $990D  8C 83 8F  STY $8F83
  $9910  01 10     ORA ($10,X)
  $9912  9D 01 00  STA $0001,X
  $9915  91 8D     STA ($8D),Y
  $9917  80        .db $80
  $9918  01 10     ORA ($10,X)
  $991A  9D 01 00  STA $0001,X
  $991D  8D 88 8D  STA $8D88
  $9920  01 10     ORA ($10,X)
  $9922  9D 01 00  STA $0001,X
  $9925  AC 8C 01  LDY $018C
  $9928  10 9D     BPL $98C7
  $992A  01 00     ORA ($00,X)
  $992C  AF        .db $AF
  $992D  8F        .db $8F
  $992E  01 10     ORA ($10,X)
  $9930  9D 01 00  STA $0001,X
  $9933  21 91     AND ($91,X)
  $9935  04        .db $04

L_9936:
  $9936  01 F6     ORA ($F6,X)
  $9938  98        TYA
  $9939  91 80     STA ($80),Y
  $993B  01 10     ORA ($10,X)
  $993D  B8        CLV
  $993E  81 81     STA ($81,X)
  $9940  B8        CLV
  $9941  01 00     ORA ($00,X)
  $9943  8D 8D 8D  STA $8D8D
  $9946  8D 8D 8F  STA $8F8D
  $9949  80        .db $80
  $994A  21 91     AND ($91,X)
  $994C  91 80     STA ($80),Y
  $994E  01 10     ORA ($10,X)
  $9950  9D 01 00  STA $0001,X
  $9953  8C 8F 91  STY $918F

L_9956:
  $9956  01 10     ORA ($10,X)
  $9958  9D 01 00  STA $0001,X
  $995B  91 80     STA ($80),Y
  $995D  91 01     STA ($01),Y
  $995F  10 9D     BPL $98FE
  $9961  01 00     ORA ($00,X)
  $9963  8C 83 90  STY $9083
  $9966  01 10     ORA ($10,X)
  $9968  9D 01 00  STA $0001,X
  $996B  90 91     BCC $98FE
  $996D  80        .db $80
  $996E  01 10     ORA ($10,X)
  $9970  9D 01 00  STA $0001,X
  $9973  8C 8F 91  STY $918F
  $9976  01 10     ORA ($10,X)
  $9978  9D 01 00  STA $0001,X
  $997B  91 80     STA ($80),Y
  $997D  91 01     STA ($01),Y
  $997F  10 9D     BPL $991E

L_9981:
  $9981  01 00     ORA ($00,X)
  $9983  8C 83 90  STY $9083
  $9986  01 10     ORA ($10,X)
  $9988  9D 01 00  STA $0001,X
  $998B  90 8F     BCC $991C
  $998D  80        .db $80
  $998E  01 10     ORA ($10,X)
  $9990  9D 01 00  STA $0001,X
  $9993  8A        TXA
  $9994  8D 8F 01  STA $018F
  $9997  10 9D     BPL $9936
  $9999  01 00     ORA ($00,X)
  $999B  8F        .db $8F
  $999C  80        .db $80
  $999D  8F        .db $8F
  $999E  01 10     ORA ($10,X)
  $99A0  9D 01 00  STA $0001,X
  $99A3  8A        TXA
  $99A4  81 8D     STA ($8D,X)
  $99A6  01 10     ORA ($10,X)
  $99A8  9D 01 00  STA $0001,X
  $99AB  8E 8F 80  STX $808F
  $99AE  01 10     ORA ($10,X)
  $99B0  9D 01 00  STA $0001,X
  $99B3  8A        TXA
  $99B4  8D 8F 01  STA $018F
  $99B7  10 9D     BPL $9956
  $99B9  01 00     ORA ($00,X)
  $99BB  8F        .db $8F
  $99BC  80        .db $80
  $99BD  8F        .db $8F
  $99BE  01 10     ORA ($10,X)
  $99C0  9D 01 00  STA $0001,X
  $99C3  8A        TXA
  $99C4  01 10     ORA ($10,X)
  $99C6  9D BD 9D  STA $9DBD,X
  $99C9  01 00     ORA ($00,X)
  $99CB  04        .db $04
  $99CC  01 4C     ORA ($4C,X)
  $99CE  99 80 8D  STA $8D80,Y
  $99D1  01 10     ORA ($10,X)
  $99D3  9D 01 00  STA $0001,X
  $99D6  94 8D     STY $8D,X
  $99D8  01 10     ORA ($10,X)
  $99DA  7F        .db $7F
  $99DB  7F        .db $7F
  $99DC  BD 01 00  LDA $0001,X
  $99DF  8D 80 01  STA $0180
  $99E2  10 9D     BPL $9981
  $99E4  01 00     ORA ($00,X)
  $99E6  88        DEY
  $99E7  8D 91 01  STA $0191
  $99EA  10 9D     BPL $9989
  $99EC  01 00     ORA ($00,X)
  $99EE  8F        .db $8F
  $99EF  80        .db $80
  $99F0  8F        .db $8F
  $99F1  01 10     ORA ($10,X)
  $99F3  9D 01 00  STA $0001,X
  $99F6  96 8F     STX $8F,Y
  $99F8  01 10     ORA ($10,X)
  $99FA  7F        .db $7F
  $99FB  7F        .db $7F
  $99FC  BD 01 00  LDA $0001,X
  $99FF  8F        .db $8F
  $9A00  8F        .db $8F
  $9A01  01 10     ORA ($10,X)
  $9A03  9D 01 00  STA $0001,X
  $9A06  8F        .db $8F
  $9A07  80        .db $80
  $9A08  8F        .db $8F
  $9A09  01 10     ORA ($10,X)
  $9A0B  9D 01 00  STA $0001,X
  $9A0E  8D 04 01  STA $0104
  $9A11  CF        .db $CF
  $9A12  99 04 00  STA $0004,Y
  $9A15  F4        .db $F4
  $9A16  98        TYA
  $9A17  00        BRK
  $9A18  05 07     ORA $07
  $9A1A  82        .db $82
  $9A1B  60        RTS
  $9A1C  03        .db $03
  $9A1D  38        SEC
  $9A1E  85 85     STA $85
  $9A20  07        .db $07
  $9A21  84 40     STY $40
  $9A23  8A        TXA
  $9A24  07        .db $07
  $9A25  82        .db $82
  $9A26  60        RTS
  $9A27  03        .db $03
  $9A28  36 85     ROL $85,X
  $9A2A  85 85     STA $85
  $9A2C  07        .db $07
  $9A2D  84 40     STY $40
  $9A2F  8A        TXA
  $9A30  03        .db $03
  $9A31  3D 07 83  AND $8307,X
  $9A34  40        RTI
  $9A35  85 04     STA $04
  $9A37  00        BRK
  $9A38  19 9A 00  ORA $009A,Y
  $9A3B  00        BRK
  $9A3C  80        .db $80
  $9A3D  00        BRK
  $9A3E  01 82     ORA ($82,X)
  $9A40  80        .db $80
  $9A41  00        BRK
  $9A42  0F        .db $0F
  $9A43  4D 9A 2E  EOR $2E9A
  $9A46  9B        .db $9B
  $9A47  5A        .db $5A
  $9A48  9C        .db $9C
  $9A49  58        CLI
  $9A4A  9D 40 9E  STA $9E40,X
  $9A4D  00        BRK
  $9A4E  06 03     ASL $03
  $9A50  3C        .db $3C
  $9A51  02        .db $02
  $9A52  C0 07     CPY #$07
  $9A54  8A        TXA
  $9A55  10 05     BPL $9A5C
  $9A57  1D 21 A5  ORA $A521,X
  $9A5A  08        PHP
  $9A5B  01 D5     ORA ($D5,X)
  $9A5D  08        PHP
  $9A5E  00        BRK
  $9A5F  65 6C     ADC $6C
  $9A61  60        RTS
  $9A62  6A        ROR
  $9A63  60        RTS
  $9A64  06 88     ASL $88
  $9A66  8A        TXA
  $9A67  68        PLA
  $9A68  21 65     AND ($65,X)
  $9A6A  A5 63     LDA $63
  $9A6C  63        .db $63
  $9A6D  60        RTS
  $9A6E  22        .db $22
  $9A6F  65 85     ADC $85
  $9A71  08        PHP
  $9A72  01 A5     ORA ($A5,X)
  $9A74  08        PHP
  $9A75  00        BRK
  $9A76  67        .db $67
  $9A77  60        RTS
  $9A78  88        DEY
  $9A79  60        RTS
  $9A7A  21 65     AND ($65,X)
  $9A7C  A5 B4     LDA $B4
  $9A7E  B6 74     LDX $74,Y
  $9A80  60        RTS
  $9A81  74        .db $74
  $9A82  60        RTS
  $9A83  B6 04     LDX $04,Y
  $9A85  01 4F     ORA ($4F,X)
  $9A87  9A        TXS
  $9A88  71 71     ADC ($71),Y
  $9A8A  6F        .db $6F
  $9A8B  60        RTS
  $9A8C  71 60     ADC ($60),Y
  $9A8E  6F        .db $6F
  $9A8F  60        RTS
  $9A90  B1 8C     LDA ($8C),Y
  $9A92  8F        .db $8F
  $9A93  80        .db $80
  $9A94  21 B1     AND ($B1,X)
  $9A96  08        PHP
  $9A97  01 B1     ORA ($B1,X)
  $9A99  08        PHP
  $9A9A  00        BRK
  $9A9B  80        .db $80
  $9A9C  71 06     ADC ($06),Y
  $9A9E  98        TYA
  $9A9F  B6 80     LDX $80,Y
  $9AA1  94 93     STY $93,X
  $9AA3  60        RTS
  $9AA4  21 74     AND ($74,X)
  $9AA6  94 93     STY $93,X
  $9AA8  21 B1     AND ($B1,X)
  $9AAA  08        PHP
  $9AAB  01 B1     ORA ($B1,X)
  $9AAD  08        PHP
  $9AAE  00        BRK
  $9AAF  80        .db $80
  $9AB0  8C 8F 90  STY $908F
  $9AB3  71 71     ADC ($71),Y
  $9AB5  6F        .db $6F
  $9AB6  60        RTS
  $9AB7  71 60     ADC ($60),Y
  $9AB9  6F        .db $6F
  $9ABA  60        RTS
  $9ABB  B1 8C     LDA ($8C),Y
  $9ABD  8F        .db $8F
  $9ABE  80        .db $80
  $9ABF  21 B1     AND ($B1,X)
  $9AC1  08        PHP
  $9AC2  01 B1     ORA ($B1,X)
  $9AC4  08        PHP
  $9AC5  00        BRK
  $9AC6  80        .db $80
  $9AC7  71 06     ADC ($06),Y
  $9AC9  98        TYA
  $9ACA  B6 80     LDX $80,Y
  $9ACC  94 93     STY $93,X
  $9ACE  60        RTS
  $9ACF  21 74     AND ($74,X)
  $9AD1  94 93     STY $93,X
  $9AD3  80        .db $80
  $9AD4  74        .db $74
  $9AD5  60        RTS
  $9AD6  93        .db $93
  $9AD7  60        RTS
  $9AD8  74        .db $74
  $9AD9  A0 71     LDY #$71
  $9ADB  06 98     ASL $98
  $9ADD  B6 B4     LDX $B4,Y
  $9ADF  B3        .db $B3
  $9AE0  74        .db $74
  $9AE1  06 96     ASL $96
  $9AE3  71 60     ADC ($60),Y
  $9AE5  71 60     ADC ($60),Y
  $9AE7  71 06     ADC ($06),Y
  $9AE9  8F        .db $8F
  $9AEA  B1 71     LDA ($71),Y
  $9AEC  06 98     ASL $98
  $9AEE  B6 B4     LDX $B4,Y
  $9AF0  B3        .db $B3
  $9AF1  74        .db $74
  $9AF2  76 60     ROR $60,X
  $9AF4  78        SEI
  $9AF5  60        RTS
  $9AF6  98        TYA
  $9AF7  60        RTS
  $9AF8  78        SEI
  $9AF9  76 74     ROR $74,X
  $9AFB  76 74     ROR $74,X
  $9AFD  73        .db $73
  $9AFE  74        .db $74
  $9AFF  73        .db $73
  $9B00  71 73     ADC ($73),Y
  $9B02  71 6F     ADC ($6F),Y
  $9B04  B6 B4     LDX $B4,Y
  $9B06  B3        .db $B3
  $9B07  74        .db $74
  $9B08  06 96     ASL $96
  $9B0A  71 60     ADC ($60),Y
  $9B0C  71 60     ADC ($60),Y
  $9B0E  71 06     ADC ($06),Y
  $9B10  8F        .db $8F
  $9B11  B1 71     LDA ($71),Y
  $9B13  06 98     ASL $98
  $9B15  B6 B4     LDX $B4,Y
  $9B17  B3        .db $B3
  $9B18  74        .db $74
  $9B19  76 60     ROR $60,X
  $9B1B  78        SEI
  $9B1C  60        RTS
  $9B1D  78        SEI
  $9B1E  78        SEI
  $9B1F  60        RTS
  $9B20  78        SEI
  $9B21  60        RTS
  $9B22  78        SEI
  $9B23  60        RTS
  $9B24  06 98     ASL $98
  $9B26  6C 6C 06  JMP ($066C)
  $9B29  8F        .db $8F
  $9B2A  04        .db $04
  $9B2B  00        BRK
  $9B2C  4F        .db $4F
  $9B2D  9A        TXS
  $9B2E  00        BRK
  $9B2F  06 03     ASL $03
  $9B31  3A        .db $3A
  $9B32  05 29     ORA $29
  $9B34  02        .db $02
  $9B35  00        BRK
  $9B36  07        .db $07
  $9B37  86 10     STX $10
  $9B39  65 68     ADC $68
  $9B3B  6C 60 65  JMP ($6560)
  $9B3E  80        .db $80
  $9B3F  65 67     ADC $67
  $9B41  68        PLA
  $9B42  67        .db $67
  $9B43  65 60     ADC $60
  $9B45  65 63     ADC $63
  $9B47  21 65     AND ($65,X)
  $9B49  04        .db $04
  $9B4A  02        .db $02
  $9B4B  30 9B     BMI $9AE8
  $9B4D  03        .db $03
  $9B4E  3C        .db $3C
  $9B4F  02        .db $02
  $9B50  C0 07     CPY #$07
  $9B52  8A        TXA
  $9B53  10 05     BPL $9B5A
  $9B55  1D A5 A7  ORA $A7A5,X
  $9B58  65 60     ADC $60

L_9B5A:
  $9B5A  65 60     ADC $60
  $9B5C  A7        .db $A7
  $9B5D  05 29     ORA $29
  $9B5F  03        .db $03
  $9B60  3A        .db $3A
  $9B61  02        .db $02
  $9B62  00        BRK
  $9B63  07        .db $07
  $9B64  86 10     STX $10
  $9B66  65 68     ADC $68
  $9B68  6C 60 65  JMP ($6560)
  $9B6B  80        .db $80
  $9B6C  65 67     ADC $67
  $9B6E  68        PLA
  $9B6F  67        .db $67
  $9B70  65 60     ADC $60
  $9B72  65 63     ADC $63
  $9B74  21 65     AND ($65,X)
  $9B76  04        .db $04
  $9B77  02        .db $02
  $9B78  5D 9B 03  EOR $039B,X
  $9B7B  3C        .db $3C
  $9B7C  02        .db $02
  $9B7D  C0 07     CPY #$07
  $9B7F  8A        TXA
  $9B80  10 05     BPL $9B87
  $9B82  1D A5 A7  ORA $A7A5,X
  $9B85  65 60     ADC $60

L_9B87:
  $9B87  65 60     ADC $60
  $9B89  A7        .db $A7
  $9B8A  05 29     ORA $29
  $9B8C  03        .db $03
  $9B8D  38        SEC
  $9B8E  02        .db $02
  $9B8F  00        BRK
  $9B90  07        .db $07
  $9B91  86 10     STX $10
  $9B93  65 65     ADC $65
  $9B95  65 60     ADC $60
  $9B97  65 80     ADC $80
  $9B99  65 67     ADC $67
  $9B9B  68        PLA
  $9B9C  67        .db $67
  $9B9D  65 60     ADC $60
  $9B9F  65 63     ADC $63
  $9BA1  21 65     AND ($65,X)
  $9BA3  04        .db $04
  $9BA4  01 8A     ORA ($8A,X)
  $9BA6  9B        .db $9B
  $9BA7  03        .db $03
  $9BA8  3C        .db $3C
  $9BA9  02        .db $02
  $9BAA  C0 07     CPY #$07
  $9BAC  8A        TXA
  $9BAD  10 05     BPL $9BB4
  $9BAF  1D B1 80  ORA $80B1,X
  $9BB2  91 8A     STA ($8A),Y

L_9BB4:
  $9BB4  60        RTS
  $9BB5  21 8C     AND ($8C,X)
  $9BB7  6C 8A B4  JMP ($B48A)
  $9BBA  93        .db $93
  $9BBB  60        RTS
  $9BBC  74        .db $74
  $9BBD  60        RTS
  $9BBE  06 94     ASL $94
  $9BC0  93        .db $93
  $9BC1  93        .db $93
  $9BC2  05 29     ORA $29
  $9BC4  03        .db $03
  $9BC5  38        SEC
  $9BC6  02        .db $02
  $9BC7  00        BRK
  $9BC8  07        .db $07
  $9BC9  86 10     STX $10
  $9BCB  65 65     ADC $65
  $9BCD  65 60     ADC $60
  $9BCF  65 80     ADC $80
  $9BD1  65 67     ADC $67
  $9BD3  68        PLA
  $9BD4  67        .db $67
  $9BD5  65 60     ADC $60
  $9BD7  65 63     ADC $63
  $9BD9  21 65     AND ($65,X)
  $9BDB  04        .db $04
  $9BDC  01 C2     ORA ($C2,X)
  $9BDE  9B        .db $9B
  $9BDF  03        .db $03
  $9BE0  3C        .db $3C
  $9BE1  02        .db $02
  $9BE2  C0 07     CPY #$07
  $9BE4  8A        TXA
  $9BE5  10 05     BPL $9BEC
  $9BE7  1D B1 80  ORA $80B1,X
  $9BEA  91 8A     STA ($8A),Y

L_9BEC:
  $9BEC  60        RTS
  $9BED  21 8C     AND ($8C,X)
  $9BEF  6C 8A 74  JMP ($748A)
  $9BF2  60        RTS
  $9BF3  74        .db $74
  $9BF4  60        RTS

L_9BF5:
  $9BF5  83        .db $83
  $9BF6  63        .db $63
  $9BF7  02        .db $02
  $9BF8  00        BRK
  $9BF9  01 44     ORA ($44,X)
  $9BFB  08        PHP
  $9BFC  01 21     ORA ($21,X)
  $9BFE  7F        .db $7F
  $9BFF  DF        .db $DF
  $9C00  01 00     ORA ($00,X)
  $9C02  08        PHP
  $9C03  00        BRK
  $9C04  03        .db $03
  $9C05  39 80 B6  AND $B680,Y
  $9C08  B4 B3     LDY $B3,X
  $9C0A  74        .db $74
  $9C0B  76 74     ROR $74,X
  $9C0D  60        RTS
  $9C0E  74        .db $74
  $9C0F  60        RTS
  $9C10  74        .db $74
  $9C11  06 93     ASL $93
  $9C13  B4 80     LDY $80,X
  $9C15  71 06     ADC ($06),Y
  $9C17  98        TYA
  $9C18  B6 B4     LDX $B4,Y
  $9C1A  B3        .db $B3
  $9C1B  74        .db $74
  $9C1C  76 60     ROR $60,X
  $9C1E  78        SEI
  $9C1F  60        RTS
  $9C20  98        TYA
  $9C21  60        RTS
  $9C22  78        SEI
  $9C23  76 74     ROR $74,X
  $9C25  76 74     ROR $74,X
  $9C27  73        .db $73
  $9C28  74        .db $74
  $9C29  73        .db $73
  $9C2A  71 73     ADC ($73),Y
  $9C2C  71 6F     ADC ($6F),Y
  $9C2E  B6 B4     LDX $B4,Y
  $9C30  B3        .db $B3
  $9C31  74        .db $74
  $9C32  76 74     ROR $74,X
  $9C34  60        RTS
  $9C35  74        .db $74
  $9C36  60        RTS
  $9C37  74        .db $74
  $9C38  06 93     ASL $93
  $9C3A  B4 80     LDY $80,X
  $9C3C  71 06     ADC ($06),Y
  $9C3E  98        TYA
  $9C3F  B6 B4     LDX $B4,Y
  $9C41  93        .db $93
  $9C42  74        .db $74
  $9C43  76 60     ROR $60,X
  $9C45  73        .db $73
  $9C46  60        RTS
  $9C47  73        .db $73
  $9C48  73        .db $73
  $9C49  60        RTS
  $9C4A  73        .db $73
  $9C4B  60        RTS
  $9C4C  73        .db $73
  $9C4D  60        RTS
  $9C4E  06 93     ASL $93
  $9C50  6C 6C 06  JMP ($066C)
  $9C53  8F        .db $8F
  $9C54  08        PHP
  $9C55  00        BRK
  $9C56  04        .db $04
  $9C57  00        BRK
  $9C58  30 9B     BMI $9BF5
  $9C5A  00        BRK
  $9C5B  06 03     ASL $03
  $9C5D  50 05     BVC $9C64
  $9C5F  1D 71 60  ORA $6071,X
  $9C62  71 60     ADC ($60),Y

L_9C64:
  $9C64  AF        .db $AF
  $9C65  91 60     STA ($60),Y
  $9C67  71 94     ADC ($94),Y
  $9C69  98        TYA
  $9C6A  71 60     ADC ($60),Y
  $9C6C  71 60     ADC ($60),Y
  $9C6E  AF        .db $AF
  $9C6F  91 60     STA ($60),Y
  $9C71  71 91     ADC ($91),Y
  $9C73  8F        .db $8F
  $9C74  6D 60 6D  ADC $6D60
  $9C77  60        RTS
  $9C78  AC 8D 60  LDY $608D
  $9C7B  6D 8D 8C  ADC $8C8D
  $9C7E  AD AF 6D  LDA $6DAF
  $9C81  60        RTS
  $9C82  6D 60 AF  ADC $AF60
  $9C85  04        .db $04
  $9C86  01 60     ORA ($60,X)
  $9C88  9C        .db $9C
  $9C89  71 60     ADC ($60),Y
  $9C8B  71 60     ADC ($60),Y
  $9C8D  AF        .db $AF
  $9C8E  91 60     STA ($60),Y
  $9C90  71 94     ADC ($94),Y
  $9C92  98        TYA
  $9C93  76 60     ROR $60,X
  $9C95  76 60     ROR $60,X
  $9C97  B4 96     LDY $96,X
  $9C99  60        RTS
  $9C9A  76 91     ROR $91,X
  $9C9C  8F        .db $8F
  $9C9D  8D A0 8D  STA $8DA0
  $9CA0  8F        .db $8F
  $9CA1  60        RTS
  $9CA2  6F        .db $6F
  $9CA3  8F        .db $8F
  $9CA4  8F        .db $8F
  $9CA5  B1 8F     LDA ($8F),Y
  $9CA7  60        RTS
  $9CA8  71 60     ADC ($60),Y
  $9CAA  06 91     ASL $91
  $9CAC  8F        .db $8F
  $9CAD  90 71     BCC $9D20
  $9CAF  60        RTS
  $9CB0  71 60     ADC ($60),Y
  $9CB2  AF        .db $AF
  $9CB3  91 60     STA ($60),Y
  $9CB5  71 94     ADC ($94),Y
  $9CB7  98        TYA
  $9CB8  76 60     ROR $60,X
  $9CBA  76 60     ROR $60,X
  $9CBC  B4 96     LDY $96,X
  $9CBE  60        RTS
  $9CBF  76 91     ROR $91,X
  $9CC1  8F        .db $8F
  $9CC2  8D A0 8D  STA $8DA0
  $9CC5  8F        .db $8F
  $9CC6  60        RTS
  $9CC7  6F        .db $6F
  $9CC8  8F        .db $8F
  $9CC9  8F        .db $8F
  $9CCA  71 60     ADC ($60),Y
  $9CCC  71 60     ADC ($60),Y
  $9CCE  8F        .db $8F
  $9CCF  6F        .db $6F

L_9CD0:
  $9CD0  71 01     ADC ($01),Y
  $9CD2  10 60     BPL $9D34
  $9CD4  7A        .db $7A
  $9CD5  7A        .db $7A
  $9CD6  7A        .db $7A
  $9CD7  78        SEI
  $9CD8  78        SEI
  $9CD9  76 76     ROR $76,X
  $9CDB  01 00     ORA ($00,X)
  $9CDD  05 29     ORA $29
  $9CDF  6A        ROR
  $9CE0  6A        ROR

L_9CE1:
  $9CE1  68        PLA
  $9CE2  60        RTS
  $9CE3  6A        ROR
  $9CE4  60        RTS
  $9CE5  68        PLA
  $9CE6  6A        ROR
  $9CE7  60        RTS
  $9CE8  6A        ROR
  $9CE9  8A        TXA
  $9CEA  8A        TXA
  $9CEB  68        PLA
  $9CEC  67        .db $67
  $9CED  68        PLA
  $9CEE  60        RTS
  $9CEF  68        PLA
  $9CF0  60        RTS
  $9CF1  68        PLA
  $9CF2  67        .db $67
  $9CF3  60        RTS
  $9CF4  67        .db $67
  $9CF5  88        DEY
  $9CF6  60        RTS
  $9CF7  68        PLA
  $9CF8  8A        TXA
  $9CF9  8C 6A 6A  STY $6A6A
  $9CFC  68        PLA
  $9CFD  60        RTS
  $9CFE  6A        ROR
  $9CFF  60        RTS
  $9D00  68        PLA
  $9D01  6A        ROR
  $9D02  60        RTS
  $9D03  6A        ROR
  $9D04  8A        TXA
  $9D05  8A        TXA
  $9D06  68        PLA
  $9D07  6C 60 8C  JMP ($8C60)
  $9D0A  6C 01 10  JMP ($1001)
  $9D0D  6B        .db $6B
  $9D0E  6B        .db $6B
  $9D0F  6B        .db $6B
  $9D10  6B        .db $6B
  $9D11  69 69     ADC #$69
  $9D13  69 69     ADC #$69
  $9D15  67        .db $67
  $9D16  67        .db $67

L_9D17:
  $9D17  67        .db $67
  $9D18  67        .db $67
  $9D19  01 00     ORA ($00,X)
  $9D1B  6A        ROR
  $9D1C  6A        ROR
  $9D1D  68        PLA
  $9D1E  60        RTS
  $9D1F  6A        ROR

L_9D20:
  $9D20  60        RTS
  $9D21  68        PLA
  $9D22  6A        ROR
  $9D23  60        RTS
  $9D24  6A        ROR
  $9D25  8A        TXA
  $9D26  8A        TXA
  $9D27  68        PLA
  $9D28  67        .db $67
  $9D29  68        PLA
  $9D2A  60        RTS
  $9D2B  68        PLA
  $9D2C  60        RTS
  $9D2D  68        PLA
  $9D2E  67        .db $67
  $9D2F  60        RTS
  $9D30  67        .db $67
  $9D31  88        DEY
  $9D32  60        RTS
  $9D33  68        PLA

L_9D34:
  $9D34  8A        TXA
  $9D35  8C 6A 6A  STY $6A6A
  $9D38  68        PLA
  $9D39  60        RTS
  $9D3A  6A        ROR
  $9D3B  60        RTS
  $9D3C  68        PLA

L_9D3D:
  $9D3D  6A        ROR
  $9D3E  60        RTS
  $9D3F  6A        ROR
  $9D40  8A        TXA
  $9D41  8A        TXA
  $9D42  68        PLA
  $9D43  6C 05 1D  JMP ($1D05)
  $9D46  60        RTS
  $9D47  70 70     BVS $9DB9
  $9D49  60        RTS
  $9D4A  70 60     BVS $9DAC
  $9D4C  70 60     BVS $9DAE
  $9D4E  70 80     BVS $9CD0
  $9D50  6C 6C 06  JMP ($066C)
  $9D53  8C 04 00  STY $0004
  $9D56  60        RTS
  $9D57  9C        .db $9C
  $9D58  00        BRK
  $9D59  06 07     ASL $07

L_9D5B:
  $9D5B  82        .db $82
  $9D5C  90 83     BCC $9CE1
  $9D5E  83        .db $83
  $9D5F  07        .db $07
  $9D60  84 50     STY $50
  $9D62  01 FF     ORA ($FF,X)
  $9D64  8D 01 00  STA $0001
  $9D67  07        .db $07
  $9D68  82        .db $82
  $9D69  90 63     BCC $9DCE
  $9D6B  63        .db $63

L_9D6C:
  $9D6C  63        .db $63
  $9D6D  63        .db $63
  $9D6E  83        .db $83
  $9D6F  07        .db $07
  $9D70  84 50     STY $50
  $9D72  01 FF     ORA ($FF,X)
  $9D74  8D 01 00  STA $0001
  $9D77  07        .db $07
  $9D78  82        .db $82
  $9D79  90 63     BCC $9DDE
  $9D7B  63        .db $63
  $9D7C  04        .db $04
  $9D7D  06 5A     ASL $5A
  $9D7F  9D 07 84  STA $8407,X
  $9D82  50 01     BVC $9D85
  $9D84  FF        .db $FF

L_9D85:
  $9D85  8D 80 8D  STA $8D80
  $9D88  80        .db $80
  $9D89  6D 60 6D  ADC $6D60
  $9D8C  60        RTS

L_9D8D:
  $9D8D  AD 01 00  LDA $0001
  $9D90  07        .db $07
  $9D91  82        .db $82
  $9D92  90 83     BCC $9D17
  $9D94  83        .db $83
  $9D95  07        .db $07
  $9D96  84 50     STY $50
  $9D98  01 FF     ORA ($FF,X)
  $9D9A  8D 01 00  STA $0001
  $9D9D  07        .db $07
  $9D9E  82        .db $82
  $9D9F  90 63     BCC $9E04
  $9DA1  63        .db $63
  $9DA2  63        .db $63
  $9DA3  63        .db $63
  $9DA4  83        .db $83
  $9DA5  07        .db $07
  $9DA6  84 50     STY $50
  $9DA8  01 FF     ORA ($FF,X)
  $9DAA  8D 01 00  STA $0001
  $9DAD  07        .db $07

L_9DAE:
  $9DAE  82        .db $82
  $9DAF  90 63     BCC $9E14
  $9DB1  63        .db $63
  $9DB2  04        .db $04
  $9DB3  06 90     ASL $90
  $9DB5  9D 07 82  STA $8207,X
  $9DB8  90 83     BCC $9D3D
  $9DBA  07        .db $07
  $9DBB  84 50     STY $50
  $9DBD  01 FF     ORA ($FF,X)
  $9DBF  8D 01 00  STA $0001
  $9DC2  07        .db $07
  $9DC3  82        .db $82
  $9DC4  90 63     BCC $9E29
  $9DC6  63        .db $63
  $9DC7  07        .db $07
  $9DC8  84 50     STY $50
  $9DCA  01 FF     ORA ($FF,X)
  $9DCC  6D 01 00  ADC $0001
  $9DCF  07        .db $07
  $9DD0  82        .db $82
  $9DD1  90 63     BCC $9E36
  $9DD3  C0 07     CPY #$07
  $9DD5  82        .db $82
  $9DD6  90 83     BCC $9D5B
  $9DD8  83        .db $83
  $9DD9  07        .db $07
  $9DDA  84 50     STY $50
  $9DDC  01 FF     ORA ($FF,X)

L_9DDE:
  $9DDE  8D 01 00  STA $0001
  $9DE1  07        .db $07
  $9DE2  82        .db $82
  $9DE3  90 63     BCC $9E48
  $9DE5  63        .db $63
  $9DE6  63        .db $63
  $9DE7  63        .db $63
  $9DE8  83        .db $83
  $9DE9  07        .db $07
  $9DEA  84 50     STY $50
  $9DEC  01 FF     ORA ($FF,X)
  $9DEE  8D 01 00  STA $0001
  $9DF1  07        .db $07
  $9DF2  82        .db $82
  $9DF3  90 63     BCC $9E58
  $9DF5  63        .db $63
  $9DF6  04        .db $04
  $9DF7  02        .db $02
  $9DF8  D4        .db $D4
  $9DF9  9D 07 84  STA $8407,X
  $9DFC  50 01     BVC $9DFF
  $9DFE  FF        .db $FF

L_9DFF:
  $9DFF  60        RTS
  $9E00  8D 60 AD  STA $AD60
  $9E03  C0 01     CPY #$01
  $9E05  00        BRK
  $9E06  07        .db $07
  $9E07  82        .db $82
  $9E08  90 83     BCC $9D8D
  $9E0A  83        .db $83
  $9E0B  07        .db $07
  $9E0C  84 50     STY $50
  $9E0E  01 FF     ORA ($FF,X)
  $9E10  8D 01 00  STA $0001
  $9E13  07        .db $07

L_9E14:
  $9E14  82        .db $82
  $9E15  90 63     BCC $9E7A
  $9E17  63        .db $63
  $9E18  63        .db $63
  $9E19  63        .db $63
  $9E1A  83        .db $83
  $9E1B  07        .db $07
  $9E1C  84 50     STY $50
  $9E1E  01 FF     ORA ($FF,X)
  $9E20  8D 01 00  STA $0001
  $9E23  07        .db $07
  $9E24  82        .db $82
  $9E25  90 63     BCC $9E8A
  $9E27  63        .db $63
  $9E28  04        .db $04

L_9E29:
  $9E29  02        .db $02
  $9E2A  06 9E     ASL $9E
  $9E2C  07        .db $07
  $9E2D  84 50     STY $50
  $9E2F  01 FF     ORA ($FF,X)
  $9E31  60        RTS
  $9E32  6D 8D 6D  ADC $6D8D
  $9E35  60        RTS

L_9E36:
  $9E36  6D 60 AD  ADC $AD60
  $9E39  A0 01     LDY #$01
  $9E3B  00        BRK
  $9E3C  04        .db $04
  $9E3D  00        BRK
  $9E3E  5A        .db $5A
  $9E3F  9D 00 00  STA $0000,X
  $9E42  80        .db $80
  $9E43  00        BRK
  $9E44  01 62     ORA ($62,X)
  $9E46  80        .db $80
  $9E47  00        BRK

L_9E48:
  $9E48  0F        .db $0F
  $9E49  53        .db $53
  $9E4A  9E        .db $9E
  $9E4B  2B        .db $2B
  $9E4C  9F        .db $9F
  $9E4D  1D A0 14  ORA $14A0,X
  $9E50  A1 89     LDA ($89,X)
  $9E52  A1 00     LDA ($00,X)
  $9E54  06 03     ASL $03
  $9E56  3C        .db $3C
  $9E57  02        .db $02

L_9E58:
  $9E58  C0 07     CPY #$07
  $9E5A  8A        TXA
  $9E5B  20 05 1F  JSR $1F05
  $9E5E  8C 71 68  STY $6871
  $9E61  60        RTS
  $9E62  71 60     ADC ($60),Y
  $9E64  65 60     ADC $60
  $9E66  71 60     ADC ($60),Y
  $9E68  6C 88 91  JMP ($9188)
  $9E6B  04        .db $04
  $9E6C  01 5E     ORA ($5E,X)
  $9E6E  9E        .db $9E
  $9E6F  8A        TXA
  $9E70  6F        .db $6F
  $9E71  67        .db $67
  $9E72  60        RTS
  $9E73  6F        .db $6F
  $9E74  60        RTS
  $9E75  63        .db $63
  $9E76  60        RTS
  $9E77  6F        .db $6F
  $9E78  60        RTS
  $9E79  6A        ROR

L_9E7A:
  $9E7A  87        .db $87
  $9E7B  8F        .db $8F
  $9E7C  04        .db $04
  $9E7D  01 6F     ORA ($6F,X)
  $9E7F  9E        .db $9E
  $9E80  8C 71 68  STY $6871
  $9E83  60        RTS
  $9E84  71 60     ADC ($60),Y
  $9E86  65 60     ADC $60
  $9E88  71 60     ADC ($60),Y

L_9E8A:
  $9E8A  6C 88 91  JMP ($9188)
  $9E8D  04        .db $04
  $9E8E  01 80     ORA ($80,X)
  $9E90  9E        .db $9E
  $9E91  8A        TXA
  $9E92  6F        .db $6F
  $9E93  67        .db $67
  $9E94  60        RTS
  $9E95  6F        .db $6F
  $9E96  60        RTS
  $9E97  63        .db $63
  $9E98  60        RTS
  $9E99  6F        .db $6F
  $9E9A  60        RTS
  $9E9B  6A        ROR
  $9E9C  87        .db $87
  $9E9D  8F        .db $8F
  $9E9E  63        .db $63
  $9E9F  65 67     ADC $67
  $9EA1  6A        ROR
  $9EA2  60        RTS
  $9EA3  6F        .db $6F
  $9EA4  73        .db $73
  $9EA5  76 A0     ROR $A0,X
  $9EA7  07        .db $07
  $9EA8  92        .db $92
  $9EA9  10 03     BPL $9EAE
  $9EAB  3E 83 84  ROL $8483,X

L_9EAE:
  $9EAE  21 C5     AND ($C5,X)
  $9EB0  08        PHP
  $9EB1  01 E5     ORA ($E5,X)
  $9EB3  08        PHP
  $9EB4  00        BRK
  $9EB5  06 87     ASL $87
  $9EB7  06 88     ASL $88
  $9EB9  8A        TXA
  $9EBA  06 87     ASL $87
  $9EBC  06 88     ASL $88
  $9EBE  87        .db $87
  $9EBF  06 A5     ASL $A5
  $9EC1  85 67     STA $67

L_9EC3:
  $9EC3  65 06     ADC $06
  $9EC5  A3        .db $A3
  $9EC6  A3        .db $A3
  $9EC7  A4 21     LDY $21
  $9EC9  C5 08     CMP $08
  $9ECB  01 E5     ORA ($E5,X)
  $9ECD  08        PHP
  $9ECE  00        BRK

L_9ECF:
  $9ECF  06 87     ASL $87
  $9ED1  06 88     ASL $88
  $9ED3  8A        TXA
  $9ED4  21 AC     AND ($AC,X)
  $9ED6  08        PHP
  $9ED7  01 AC     ORA ($AC,X)
  $9ED9  08        PHP
  $9EDA  00        BRK
  $9EDB  78        SEI
  $9EDC  76 74     ROR $74,X
  $9EDE  76 74     ROR $74,X
  $9EE0  73        .db $73
  $9EE1  74        .db $74
  $9EE2  73        .db $73
  $9EE3  71 73     ADC ($73),Y
  $9EE5  71 6F     ADC ($6F),Y
  $9EE7  71 6F     ADC ($6F),Y
  $9EE9  6D 6F 6D  ADC $6D6F
  $9EEC  6C 6D 6C  JMP ($6C6D)
  $9EEF  6A        ROR
  $9EF0  6C 6A 68  JMP ($686A)
  $9EF3  07        .db $07
  $9EF4  AF        .db $AF
  $9EF5  10 CC     BPL $9EC3
  $9EF7  06 8C     ASL $8C
  $9EF9  06 8D     ASL $8D
  $9EFB  91 CF     STA ($CF),Y
  $9EFD  AC AF D0  LDY $D0AF
  $9F00  06 90     ASL $90
  $9F02  06 93     ASL $93
  $9F04  96 D4     STX $D4,Y
  $9F06  94 93     STY $93,X
  $9F08  91 8F     STA ($8F),Y
  $9F0A  CD 8D 8C  CMP $8C8D
  $9F0D  AA        TAX
  $9F0E  CF        .db $CF
  $9F0F  8F        .db $8F
  $9F10  8D AC 71  STA $71AC
  $9F13  76 71     ROR $71,X
  $9F15  6D 04 03  ADC $0304
  $9F18  12        .db $12
  $9F19  9F        .db $9F
  $9F1A  07        .db $07
  $9F1B  87        .db $87
  $9F1C  70 B1     BVS $9ECF
  $9F1E  91 60     STA ($60),Y
  $9F20  71 60     ADC ($60),Y
  $9F22  71 91     ADC ($91),Y
  $9F24  91 74     STA ($74),Y
  $9F26  75 04     ADC $04,X
  $9F28  00        BRK
  $9F29  55 9E     EOR $9E,X
  $9F2B  00        BRK
  $9F2C  06 03     ASL $03
  $9F2E  38        SEC
  $9F2F  02        .db $02
  $9F30  C0 06     CPY #$06
  $9F32  60        RTS
  $9F33  05 1F     ORA $1F
  $9F35  07        .db $07
  $9F36  90 10     BCC $9F48
  $9F38  8C 71 68  STY $6871
  $9F3B  60        RTS
  $9F3C  71 60     ADC ($60),Y
  $9F3E  65 60     ADC $60
  $9F40  71 60     ADC ($60),Y
  $9F42  6C 88 91  JMP ($9188)
  $9F45  04        .db $04
  $9F46  01 38     ORA ($38,X)

L_9F48:
  $9F48  9F        .db $9F
  $9F49  8A        TXA
  $9F4A  6F        .db $6F
  $9F4B  67        .db $67
  $9F4C  60        RTS
  $9F4D  6F        .db $6F
  $9F4E  60        RTS
  $9F4F  63        .db $63
  $9F50  60        RTS
  $9F51  6F        .db $6F
  $9F52  60        RTS
  $9F53  6A        ROR
  $9F54  87        .db $87
  $9F55  8F        .db $8F
  $9F56  04        .db $04
  $9F57  01 49     ORA ($49,X)
  $9F59  9F        .db $9F
  $9F5A  8C 71 68  STY $6871
  $9F5D  60        RTS
  $9F5E  71 60     ADC ($60),Y
  $9F60  65 60     ADC $60
  $9F62  71 60     ADC ($60),Y
  $9F64  6C 88 91  JMP ($9188)
  $9F67  04        .db $04
  $9F68  01 5A     ORA ($5A,X)
  $9F6A  9F        .db $9F
  $9F6B  8A        TXA
  $9F6C  6F        .db $6F
  $9F6D  67        .db $67
  $9F6E  60        RTS
  $9F6F  6F        .db $6F
  $9F70  60        RTS
  $9F71  63        .db $63
  $9F72  60        RTS
  $9F73  6F        .db $6F
  $9F74  60        RTS
  $9F75  6A        ROR
  $9F76  87        .db $87
  $9F77  8F        .db $8F
  $9F78  63        .db $63
  $9F79  65 67     ADC $67
  $9F7B  6A        ROR
  $9F7C  60        RTS
  $9F7D  6F        .db $6F
  $9F7E  73        .db $73
  $9F7F  76 A0     ROR $A0,X
  $9F81  80        .db $80
  $9F82  40        RTI
  $9F83  03        .db $03
  $9F84  39 07 92  AND $9207,Y
  $9F87  10 02     BPL $9F8B
  $9F89  00        BRK
  $9F8A  8C 71 68  STY $6871
  $9F8D  60        RTS
  $9F8E  71 60     ADC ($60),Y
  $9F90  65 60     ADC $60
  $9F92  71 60     ADC ($60),Y
  $9F94  6C 88 91  JMP ($9188)
  $9F97  04        .db $04
  $9F98  01 8A     ORA ($8A,X)
  $9F9A  9F        .db $9F
  $9F9B  8A        TXA
  $9F9C  6F        .db $6F
  $9F9D  67        .db $67
  $9F9E  60        RTS
  $9F9F  6F        .db $6F
  $9FA0  60        RTS
  $9FA1  63        .db $63
  $9FA2  60        RTS
  $9FA3  6F        .db $6F
  $9FA4  60        RTS
  $9FA5  6A        ROR
  $9FA6  87        .db $87
  $9FA7  8F        .db $8F
  $9FA8  04        .db $04
  $9FA9  01 9B     ORA ($9B,X)
  $9FAB  9F        .db $9F
  $9FAC  8C 71 68  STY $6871
  $9FAF  60        RTS
  $9FB0  71 60     ADC ($60),Y
  $9FB2  65 60     ADC $60
  $9FB4  71 60     ADC ($60),Y
  $9FB6  6C 88 91  JMP ($9188)
  $9FB9  04        .db $04
  $9FBA  01 AC     ORA ($AC,X)
  $9FBC  9F        .db $9F

L_9FBD:
  $9FBD  60        RTS
  $9FBE  6F        .db $6F
  $9FBF  60        RTS
  $9FC0  6A        ROR
  $9FC1  87        .db $87
  $9FC2  8F        .db $8F
  $9FC3  02        .db $02
  $9FC4  C0 07     CPY #$07
  $9FC6  8F        .db $8F
  $9FC7  10 60     BPL $A029
  $9FC9  78        SEI
  $9FCA  76 74     ROR $74,X
  $9FCC  76 74     ROR $74,X
  $9FCE  73        .db $73
  $9FCF  74        .db $74
  $9FD0  73        .db $73
  $9FD1  71 73     ADC ($73),Y
  $9FD3  71 6F     ADC ($6F),Y
  $9FD5  71 6F     ADC ($6F),Y
  $9FD7  6D 6F 6D  ADC $6D6F
  $9FDA  6C 6D 6C  JMP ($6C6D)
  $9FDD  6A        ROR
  $9FDE  6C 6A 05  JMP ($056A)
  $9FE1  1F        .db $1F
  $9FE2  07        .db $07
  $9FE3  AF        .db $AF
  $9FE4  10 03     BPL $9FE9
  $9FE6  3A        .db $3A
  $9FE7  C8        INY
  $9FE8  06 88     ASL $88
  $9FEA  06 8A     ASL $8A
  $9FEC  8C C7 A7  STY $A7C7
  $9FEF  AC CC 06  LDY $06CC
  $9FF2  8C 06 90  STY $9006
  $9FF5  93        .db $93
  $9FF6  D1 91     CMP ($91),Y
  $9FF8  60        RTS
  $9FF9  93        .db $93
  $9FFA  91 6F     STA ($6F),Y
  $9FFC  CA        DEX
  $9FFD  8A        TXA
  $9FFE  88        DEY
  $9FFF  A6 CC     LDX $CC
  $A001  8C 8A A8  STY $A88A
  $A004  6D 71 6D  ADC $6D71
  $A007  6A        ROR
  $A008  04        .db $04
  $A009  03        .db $03
  $A00A  04        .db $04
  $A00B  A0 07     LDY #$07
  $A00D  87        .db $87
  $A00E  70 AD     BVS $9FBD
  $A010  8D 60 6D  STA $6D60
  $A013  60        RTS
  $A014  6D 8D 8D  ADC $8D8D
  $A017  6C 6D 04  JMP ($046D)
  $A01A  00        BRK
  $A01B  2D 9F 00  AND $009F
  $A01E  06 03     ASL $03
  $A020  28        PLP
  $A021  05 1F     ORA $1F
  $A023  91 8C     STA ($8C),Y
  $A025  71 60     ADC ($60),Y
  $A027  71 71     ADC ($71),Y

L_A029:
  $A029  60        RTS
  $A02A  91 6C     STA ($6C),Y
  $A02C  8C 8F 04  STY $048F
  $A02F  01 23     ORA ($23,X)
  $A031  A0 8F     LDY #$8F
  $A033  8A        TXA
  $A034  6F        .db $6F
  $A035  60        RTS
  $A036  6F        .db $6F
  $A037  6F        .db $6F
  $A038  60        RTS
  $A039  8F        .db $8F
  $A03A  6A        ROR
  $A03B  8A        TXA
  $A03C  8F        .db $8F
  $A03D  04        .db $04
  $A03E  01 32     ORA ($32,X)
  $A040  A0 91     LDY #$91
  $A042  8C 71 60  STY $6071
  $A045  71 71     ADC ($71),Y
  $A047  60        RTS
  $A048  91 6C     STA ($6C),Y
  $A04A  8C 8F 04  STY $048F
  $A04D  01 41     ORA ($41,X)
  $A04F  A0 8F     LDY #$8F
  $A051  8A        TXA
  $A052  6F        .db $6F
  $A053  60        RTS
  $A054  6F        .db $6F
  $A055  6F        .db $6F
  $A056  60        RTS
  $A057  8F        .db $8F
  $A058  6A        ROR
  $A059  8A        TXA
  $A05A  8F        .db $8F
  $A05B  01 12     ORA ($12,X)
  $A05D  78        SEI
  $A05E  78        SEI
  $A05F  78        SEI
  $A060  78        SEI
  $A061  60        RTS
  $A062  75 75     ADC $75,X
  $A064  75 60     ADC $60,X
  $A066  7D 7D 7D  ADC $7D7D,X
  $A069  7B        .db $7B
  $A06A  7B        .db $7B
  $A06B  7C        .db $7C
  $A06C  7C        .db $7C
  $A06D  01 00     ORA ($00,X)
  $A06F  91 8C     STA ($8C),Y

L_A071:
  $A071  71 60     ADC ($60),Y
  $A073  71 71     ADC ($71),Y
  $A075  60        RTS
  $A076  91 6C     STA ($6C),Y
  $A078  8C 8F 04  STY $048F
  $A07B  01 6F     ORA ($6F,X)
  $A07D  A0 8F     LDY #$8F
  $A07F  8A        TXA
  $A080  6F        .db $6F
  $A081  60        RTS
  $A082  6F        .db $6F
  $A083  6F        .db $6F
  $A084  60        RTS
  $A085  8F        .db $8F
  $A086  6A        ROR
  $A087  8A        TXA
  $A088  8F        .db $8F
  $A089  04        .db $04
  $A08A  01 7E     ORA ($7E,X)
  $A08C  A0 91     LDY #$91
  $A08E  8C 71 60  STY $6071
  $A091  71 71     ADC ($71),Y
  $A093  60        RTS
  $A094  91 6C     STA ($6C),Y
  $A096  8C 8F 04  STY $048F
  $A099  01 8D     ORA ($8D,X)
  $A09B  A0 8F     LDY #$8F
  $A09D  8A        TXA
  $A09E  6F        .db $6F
  $A09F  60        RTS
  $A0A0  6F        .db $6F
  $A0A1  6F        .db $6F
  $A0A2  60        RTS
  $A0A3  8F        .db $8F
  $A0A4  6A        ROR
  $A0A5  8A        TXA
  $A0A6  8F        .db $8F
  $A0A7  04        .db $04
  $A0A8  01 9C     ORA ($9C,X)
  $A0AA  A0 8D     LDY #$8D
  $A0AC  60        RTS
  $A0AD  6D 91 74  ADC $7491
  $A0B0  71 60     ADC ($60),Y
  $A0B2  6D 74 71  ADC $7174
  $A0B5  99 74 71  STA $7174,Y
  $A0B8  8F        .db $8F
  $A0B9  60        RTS
  $A0BA  6F        .db $6F
  $A0BB  93        .db $93
  $A0BC  76 73     ROR $73,X
  $A0BE  60        RTS
  $A0BF  6F        .db $6F
  $A0C0  76 73     ROR $73,X
  $A0C2  9B        .db $9B
  $A0C3  76 73     ROR $73,X
  $A0C5  90 60     BCC $A127
  $A0C7  70 93     BVS $A05C
  $A0C9  78        SEI
  $A0CA  73        .db $73
  $A0CB  60        RTS
  $A0CC  70 78     BVS $A146
  $A0CE  73        .db $73
  $A0CF  9C        .db $9C
  $A0D0  78        SEI
  $A0D1  73        .db $73
  $A0D2  91 60     STA ($60),Y
  $A0D4  71 94     ADC ($94),Y
  $A0D6  78        SEI
  $A0D7  74        .db $74
  $A0D8  60        RTS
  $A0D9  71 78     ADC ($78),Y
  $A0DB  74        .db $74
  $A0DC  9D 78 74  STA $7478,X
  $A0DF  86 60     STX $60
  $A0E1  66 8A     ROR $8A
  $A0E3  6D 6A 60  ADC $606A
  $A0E6  6D 6A 66  ADC $666A
  $A0E9  92        .db $92
  $A0EA  6D 6A 88  ADC $886A
  $A0ED  60        RTS
  $A0EE  68        PLA
  $A0EF  8C 6F 6C  STY $6C6F
  $A0F2  60        RTS
  $A0F3  6F        .db $6F
  $A0F4  6C 68 94  JMP ($9468)
  $A0F7  6F        .db $6F
  $A0F8  6C 8A 60  JMP ($608A)
  $A0FB  6A        ROR
  $A0FC  8D 71 6D  STA $6D71
  $A0FF  60        RTS
  $A100  71 6D     ADC ($6D),Y
  $A102  6A        ROR
  $A103  96 71     STX $71,Y
  $A105  6D AA 8A  ADC $8AAA
  $A108  60        RTS
  $A109  6A        ROR
  $A10A  60        RTS
  $A10B  6A        ROR
  $A10C  8A        TXA
  $A10D  8A        TXA
  $A10E  6F        .db $6F
  $A10F  70 04     BVS $A115
  $A111  00        BRK
  $A112  23        .db $23
  $A113  A0 00     LDY #$00

L_A115:
  $A115  06 07     ASL $07
  $A117  84 A0     STY $A0
  $A119  03        .db $03
  $A11A  3F        .db $3F
  $A11B  02        .db $02
  $A11C  80        .db $80
  $A11D  03        .db $03
  $A11E  3A        .db $3A
  $A11F  64        .db $64
  $A120  64        .db $64
  $A121  60        RTS
  $A122  64        .db $64
  $A123  02        .db $02
  $A124  00        BRK
  $A125  01 33     ORA ($33,X)

L_A127:
  $A127  03        .db $03
  $A128  3F        .db $3F
  $A129  88        DEY
  $A12A  01 00     ORA ($00,X)
  $A12C  02        .db $02
  $A12D  80        .db $80
  $A12E  03        .db $03
  $A12F  3A        .db $3A
  $A130  64        .db $64
  $A131  64        .db $64
  $A132  60        RTS
  $A133  64        .db $64
  $A134  64        .db $64
  $A135  02        .db $02
  $A136  00        BRK
  $A137  01 33     ORA ($33,X)
  $A139  03        .db $03
  $A13A  3F        .db $3F
  $A13B  68        PLA
  $A13C  88        DEY
  $A13D  01 00     ORA ($00,X)
  $A13F  02        .db $02
  $A140  80        .db $80
  $A141  03        .db $03
  $A142  3A        .db $3A
  $A143  64        .db $64
  $A144  64        .db $64
  $A145  04        .db $04

L_A146:
  $A146  06 1D     ASL $1D
  $A148  A1 E0     LDA ($E0,X)
  $A14A  03        .db $03
  $A14B  3A        .db $3A
  $A14C  64        .db $64
  $A14D  64        .db $64
  $A14E  60        RTS
  $A14F  64        .db $64
  $A150  02        .db $02
  $A151  00        BRK
  $A152  01 33     ORA ($33,X)
  $A154  03        .db $03
  $A155  3F        .db $3F
  $A156  88        DEY
  $A157  01 00     ORA ($00,X)
  $A159  02        .db $02
  $A15A  80        .db $80
  $A15B  03        .db $03
  $A15C  3A        .db $3A
  $A15D  64        .db $64
  $A15E  64        .db $64
  $A15F  60        RTS
  $A160  64        .db $64
  $A161  64        .db $64
  $A162  02        .db $02
  $A163  00        BRK
  $A164  01 33     ORA ($33,X)
  $A166  03        .db $03
  $A167  3F        .db $3F
  $A168  68        PLA
  $A169  88        DEY
  $A16A  01 00     ORA ($00,X)
  $A16C  02        .db $02

L_A16D:
  $A16D  80        .db $80
  $A16E  03        .db $03
  $A16F  3A        .db $3A
  $A170  64        .db $64
  $A171  64        .db $64
  $A172  04        .db $04
  $A173  0E 4A A1  ASL $A14A
  $A176  01 33     ORA ($33,X)
  $A178  68        PLA
  $A179  60        RTS
  $A17A  80        .db $80
  $A17B  88        DEY
  $A17C  60        RTS
  $A17D  68        PLA
  $A17E  60        RTS
  $A17F  68        PLA
  $A180  68        PLA
  $A181  60        RTS
  $A182  68        PLA
  $A183  60        RTS
  $A184  80        .db $80
  $A185  04        .db $04
  $A186  00        BRK
  $A187  1D A1 00  ORA $00A1,X
  $A18A  00        BRK
  $A18B  80        .db $80
  $A18C  00        BRK
  $A18D  01 62     ORA ($62,X)
  $A18F  80        .db $80
  $A190  00        BRK
  $A191  0F        .db $0F
  $A192  9C        .db $9C
  $A193  A1 BA     LDA ($BA,X)
  $A195  A2 A7     LDX #$A7
  $A197  A3        .db $A3
  $A198  53        .db $53
  $A199  A4 A0     LDY $A0
  $A19B  A4 00     LDY $00
  $A19D  05 02     ORA $02
  $A19F  00        BRK
  $A1A0  05 13     ORA $13
  $A1A2  03        .db $03
  $A1A3  3D 07 92  AND $9207,X
  $A1A6  10 CC     BPL $A174
  $A1A8  AD 8F EC  LDA $EC8F
  $A1AB  80        .db $80
  $A1AC  CA        DEX
  $A1AD  AA        TAX

L_A1AE:
  $A1AE  8C 82 02  STY $0282
  $A1B1  C0 05     CPY #$05
  $A1B3  1F        .db $1F
  $A1B4  98        TYA

L_A1B5:
  $A1B5  98        TYA
  $A1B6  01 25     ORA ($25,X)
  $A1B8  96 80     STX $80,Y
  $A1BA  01 00     ORA ($00,X)
  $A1BC  98        TYA

L_A1BD:
  $A1BD  98        TYA
  $A1BE  01 25     ORA ($25,X)
  $A1C0  96 80     STX $80,Y
  $A1C2  01 00     ORA ($00,X)
  $A1C4  04        .db $04
  $A1C5  01 9E     ORA ($9E,X)
  $A1C7  A1 02     LDA ($02,X)
  $A1C9  80        .db $80
  $A1CA  05 13     ORA $13
  $A1CC  B1 01     LDA ($01),Y
  $A1CE  10 9D     BPL $A16D
  $A1D0  01 00     ORA ($00,X)
  $A1D2  91 80     STA ($80),Y
  $A1D4  8F        .db $8F
  $A1D5  01 10     ORA ($10,X)
  $A1D7  9D 01 00  STA $0001,X
  $A1DA  91 04     STA ($04),Y
  $A1DC  01 CA     ORA ($CA,X)
  $A1DE  A1 B3     LDA ($B3,X)
  $A1E0  01 10     ORA ($10,X)
  $A1E2  9D 01 00  STA $0001,X
  $A1E5  93        .db $93
  $A1E6  80        .db $80
  $A1E7  91 01     STA ($01),Y
  $A1E9  10 9D     BPL $A188
  $A1EB  01 00     ORA ($00,X)
  $A1ED  93        .db $93
  $A1EE  04        .db $04
  $A1EF  01 DF     ORA ($DF,X)
  $A1F1  A1 B1     LDA ($B1,X)
  $A1F3  01 10     ORA ($10,X)
  $A1F5  9D 01 00  STA $0001,X
  $A1F8  91 80     STA ($80),Y
  $A1FA  8F        .db $8F
  $A1FB  01 10     ORA ($10,X)
  $A1FD  9D 01 00  STA $0001,X
  $A200  91 04     STA ($04),Y
  $A202  01 F2     ORA ($F2,X)
  $A204  A1 B3     LDA ($B3,X)
  $A206  01 10     ORA ($10,X)
  $A208  9D 01 00  STA $0001,X
  $A20B  93        .db $93
  $A20C  80        .db $80
  $A20D  91 01     STA ($01),Y
  $A20F  10 9D     BPL $A1AE
  $A211  01 00     ORA ($00,X)
  $A213  93        .db $93
  $A214  B0 01     BCS $A217
  $A216  10 9D     BPL $A1B5
  $A218  01 00     ORA ($00,X)
  $A21A  93        .db $93
  $A21B  80        .db $80
  $A21C  90 01     BCC $A21F
  $A21E  10 9D     BPL $A1BD
  $A220  01 00     ORA ($00,X)
  $A222  93        .db $93
  $A223  02        .db $02
  $A224  C0 03     CPY #$03
  $A226  3D 07 92  AND $9207,X
  $A229  10 05     BPL $A230
  $A22B  1F        .db $1F
  $A22C  21 B4     AND ($B4,X)
  $A22E  08        PHP
  $A22F  01 B4     ORA ($B4,X)
  $A231  08        PHP
  $A232  00        BRK
  $A233  94 96     STY $96,X
  $A235  80        .db $80
  $A236  98        TYA
  $A237  80        .db $80
  $A238  96 80     STX $80,Y
  $A23A  94 80     STY $80,X
  $A23C  94 B6     STY $B6,X
  $A23E  93        .db $93
  $A23F  94 80     STY $80,X
  $A241  93        .db $93
  $A242  80        .db $80
  $A243  91 80     STA ($80),Y
  $A245  21 8F     AND ($8F,X)
  $A247  08        PHP
  $A248  01 AF     ORA ($AF,X)
  $A24A  80        .db $80
  $A24B  06 BB     ASL $BB
  $A24D  08        PHP
  $A24E  00        BRK
  $A24F  B9 21 B8  LDA $B821,Y
  $A252  08        PHP
  $A253  01 B8     ORA ($B8,X)
  $A255  08        PHP
  $A256  00        BRK
  $A257  98        TYA
  $A258  96 94     STX $94,Y
  $A25A  9B        .db $9B
  $A25B  80        .db $80
  $A25C  99 80 06  STA $0680,Y
  $A25F  B8        CLV
  $A260  9D 21 9C  STA $9C21,X
  $A263  08        PHP
  $A264  01 DC     ORA ($DC,X)
  $A266  08        PHP
  $A267  00        BRK
  $A268  05 2B     ORA $2B
  $A26A  80        .db $80
  $A26B  8C 90 21  STY $2190
  $A26E  93        .db $93
  $A26F  08        PHP
  $A270  01 F3     ORA ($F3,X)
  $A272  08        PHP
  $A273  00        BRK
  $A274  05 1F     ORA $1F
  $A276  AC 80 8A  LDY $8A80
  $A279  21 8A     AND ($8A,X)
  $A27B  08        PHP
  $A27C  01 AA     ORA ($AA,X)
  $A27E  08        PHP
  $A27F  00        BRK
  $A280  88        DEY
  $A281  80        .db $80
  $A282  8A        TXA
  $A283  21 8A     AND ($8A,X)
  $A285  08        PHP
  $A286  01 AA     ORA ($AA,X)
  $A288  08        PHP
  $A289  00        BRK
  $A28A  85 88     STA $88
  $A28C  8A        TXA
  $A28D  AC 8A AF  LDY $AF8A
  $A290  AD AC AA  LDA $AAAC
  $A293  A8        TAY
  $A294  A7        .db $A7
  $A295  80        .db $80
  $A296  AC 80 8A  LDY $8A80
  $A299  21 8A     AND ($8A,X)
  $A29B  08        PHP
  $A29C  01 AA     ORA ($AA,X)
  $A29E  08        PHP
  $A29F  00        BRK
  $A2A0  88        DEY
  $A2A1  80        .db $80
  $A2A2  8A        TXA
  $A2A3  21 8A     AND ($8A,X)
  $A2A5  08        PHP
  $A2A6  01 AA     ORA ($AA,X)
  $A2A8  08        PHP
  $A2A9  00        BRK
  $A2AA  85 88     STA $88
  $A2AC  8A        TXA
  $A2AD  AC 8A AF  LDY $AF8A
  $A2B0  AD AC B0  LDA $B0AC
  $A2B3  B3        .db $B3
  $A2B4  B6 98     LDX $98,Y
  $A2B6  04        .db $04
  $A2B7  00        BRK
  $A2B8  C8        INY
  $A2B9  A1 00     LDA ($00,X)
  $A2BB  05 03     ORA $03
  $A2BD  37        .db $37
  $A2BE  02        .db $02
  $A2BF  80        .db $80
  $A2C0  05 13     ORA $13
  $A2C2  07        .db $07
  $A2C3  92        .db $92
  $A2C4  20 60 88  JSR $8860
  $A2C7  98        TYA
  $A2C8  94 88     STY $88,X
  $A2CA  98        TYA
  $A2CB  91 94     STA ($94),Y
  $A2CD  8D 98 94  STA $9498
  $A2D0  88        DEY
  $A2D1  94 98     STY $98,X
  $A2D3  88        DEY
  $A2D4  94 98     STY $98,X
  $A2D6  87        .db $87
  $A2D7  96 93     STX $93,Y
  $A2D9  87        .db $87
  $A2DA  96 8F     STX $8F,Y
  $A2DC  93        .db $93
  $A2DD  6C 02 C0  JMP ($C002)
  $A2E0  03        .db $03
  $A2E1  3D 05 1F  AND $1F05,X
  $A2E4  93        .db $93
  $A2E5  93        .db $93
  $A2E6  A0 93     LDY #$93
  $A2E8  93        .db $93
  $A2E9  A0 04     LDY #$04
  $A2EB  01 BC     ORA ($BC,X)
  $A2ED  A2 01     LDX #$01
  $A2EF  00        BRK
  $A2F0  03        .db $03
  $A2F1  38        SEC
  $A2F2  02        .db $02
  $A2F3  80        .db $80
  $A2F4  05 13     ORA $13
  $A2F6  60        RTS
  $A2F7  88        DEY
  $A2F8  98        TYA
  $A2F9  94 88     STY $88,X
  $A2FB  98        TYA
  $A2FC  91 94     STA ($94),Y
  $A2FE  8D 98 94  STA $9498
  $A301  88        DEY
  $A302  94 98     STY $98,X
  $A304  88        DEY
  $A305  94 98     STY $98,X
  $A307  87        .db $87
  $A308  96 93     STX $93,Y
  $A30A  87        .db $87
  $A30B  96 8F     STX $8F,Y
  $A30D  93        .db $93
  $A30E  8C 96 93  STY $9396
  $A311  87        .db $87
  $A312  93        .db $93
  $A313  96 87     STX $87,Y
  $A315  93        .db $93
  $A316  96 88     STX $88,Y
  $A318  98        TYA
  $A319  94 88     STY $88,X
  $A31B  98        TYA
  $A31C  91 94     STA ($94),Y
  $A31E  8D 98 94  STA $9498
  $A321  88        DEY
  $A322  94 98     STY $98,X
  $A324  88        DEY
  $A325  94 98     STY $98,X
  $A327  87        .db $87
  $A328  96 93     STX $93,Y
  $A32A  87        .db $87
  $A32B  96 8F     STX $8F,Y
  $A32D  93        .db $93
  $A32E  8C 96 93  STY $9396
  $A331  87        .db $87
  $A332  93        .db $93
  $A333  96 87     STX $87,Y
  $A335  93        .db $93
  $A336  76 02     ROR $02,X
  $A338  C0 03     CPY #$03
  $A33A  38        SEC
  $A33B  07        .db $07
  $A33C  92        .db $92
  $A33D  10 05     BPL $A344
  $A33F  1F        .db $1F
  $A340  06 80     ASL $80
  $A342  D4        .db $D4
  $A343  94 96     STY $96,X
  $A345  80        .db $80
  $A346  98        TYA
  $A347  80        .db $80
  $A348  96 80     STX $80,Y
  $A34A  94 80     STY $80,X
  $A34C  94 B6     STY $B6,X
  $A34E  93        .db $93
  $A34F  94 80     STY $80,X
  $A351  93        .db $93
  $A352  80        .db $80
  $A353  91 80     STA ($80),Y
  $A355  21 8F     AND ($8F,X)
  $A357  AF        .db $AF
  $A358  80        .db $80
  $A359  06 BB     ASL $BB
  $A35B  B9 D8 98  LDA $98D8,Y
  $A35E  96 94     STX $94,Y

L_A360:
  $A360  9B        .db $9B
  $A361  80        .db $80
  $A362  99 80 06  STA $0680,Y
  $A365  B8        CLV
  $A366  9D 21 9C  STA $9C21,X
  $A369  DC        .db $DC
  $A36A  05 2B     ORA $2B
  $A36C  80        .db $80
  $A36D  8C 70 F3  STY $F370
  $A370  05 1F     ORA $1F
  $A372  A8        TAY
  $A373  80        .db $80
  $A374  87        .db $87
  $A375  06 A7     ASL $A7
  $A377  85 80     STA $80
  $A379  87        .db $87
  $A37A  06 A7     ASL $A7
  $A37C  81 85     STA ($85,X)
  $A37E  87        .db $87
  $A37F  79 74 71  ADC $7174,Y
  $A382  7D 79 74  ADC $7479,X
  $A385  71 7D     ADC ($7D),Y
  $A387  79 74 71  ADC $7174,Y
  $A38A  7D 79 74  ADC $7479,X
  $A38D  71 7D     ADC ($7D),Y
  $A38F  78        SEI
  $A390  73        .db $73
  $A391  70 6C     BVS $A3FF
  $A393  78        SEI
  $A394  73        .db $73
  $A395  70 6C     BVS $A403
  $A397  78        SEI
  $A398  73        .db $73
  $A399  70 6C     BVS $A407
  $A39B  78        SEI
  $A39C  73        .db $73
  $A39D  70 6C     BVS $A40B
  $A39F  04        .db $04
  $A3A0  01 70     ORA ($70,X)
  $A3A2  A3        .db $A3
  $A3A3  04        .db $04
  $A3A4  00        BRK
  $A3A5  EE A2 00  INC $00A2
  $A3A8  05 03     ORA $03
  $A3AA  35 05     AND $05,X
  $A3AC  1F        .db $1F
  $A3AD  88        DEY
  $A3AE  98        TYA
  $A3AF  94 88     STY $88,X
  $A3B1  98        TYA
  $A3B2  91 94     STA ($94),Y
  $A3B4  8D 98 94  STA $9498
  $A3B7  88        DEY
  $A3B8  94 98     STY $98,X
  $A3BA  88        DEY
  $A3BB  94 98     STY $98,X
  $A3BD  87        .db $87
  $A3BE  96 93     STX $93,Y
  $A3C0  87        .db $87
  $A3C1  96 8F     STX $8F,Y
  $A3C3  93        .db $93
  $A3C4  8C 96 93  STY $9396
  $A3C7  87        .db $87
  $A3C8  93        .db $93
  $A3C9  96 87     STX $87,Y
  $A3CB  93        .db $93
  $A3CC  96 88     STX $88,Y
  $A3CE  98        TYA
  $A3CF  94 88     STY $88,X
  $A3D1  98        TYA
  $A3D2  91 94     STA ($94),Y
  $A3D4  8D 98 94  STA $9498
  $A3D7  88        DEY
  $A3D8  94 98     STY $98,X
  $A3DA  88        DEY
  $A3DB  94 98     STY $98,X
  $A3DD  87        .db $87
  $A3DE  96 93     STX $93,Y
  $A3E0  87        .db $87

L_A3E1:
  $A3E1  96 8F     STX $8F,Y
  $A3E3  93        .db $93
  $A3E4  8C 96 93  STY $9396
  $A3E7  87        .db $87
  $A3E8  93        .db $93
  $A3E9  01 10     ORA ($10,X)
  $A3EB  7D 7D 7D  ADC $7D7D,X
  $A3EE  7D 7A 7A  ADC $7A7A,X
  $A3F1  77        .db $77
  $A3F2  77        .db $77
  $A3F3  01 00     ORA ($00,X)
  $A3F5  88        DEY

L_A3F6:
  $A3F6  98        TYA
  $A3F7  94 88     STY $88,X
  $A3F9  98        TYA
  $A3FA  91 94     STA ($94),Y
  $A3FC  8D 98 94  STA $9498

L_A3FF:
  $A3FF  88        DEY
  $A400  94 98     STY $98,X
  $A402  88        DEY

L_A403:
  $A403  94 98     STY $98,X
  $A405  87        .db $87
  $A406  96 93     STX $93,Y
  $A408  87        .db $87
  $A409  96 8F     STX $8F,Y

L_A40B:
  $A40B  93        .db $93
  $A40C  8C 96 93  STY $9396
  $A40F  87        .db $87
  $A410  93        .db $93
  $A411  96 87     STX $87,Y
  $A413  93        .db $93
  $A414  96 04     STX $04,Y
  $A416  03        .db $03
  $A417  F5 A3     SBC $A3,X
  $A419  91 94     STA ($94),Y
  $A41B  93        .db $93
  $A41C  91 AF     STA ($AF),Y
  $A41E  80        .db $80

L_A41F:
  $A41F  8D 80 8F  STA $8F80
  $A422  AF        .db $AF
  $A423  80        .db $80
  $A424  8D 91 93  STA $9391
  $A427  8D 04 07  STA $0704
  $A42A  27        .db $27
  $A42B  A4 90     LDY $90
  $A42D  04        .db $04
  $A42E  07        .db $07
  $A42F  2C A4 91  BIT $91A4
  $A432  94 93     STY $93,X
  $A434  91 AF     STA ($AF),Y
  $A436  80        .db $80
  $A437  8D 80 8F  STA $8F80
  $A43A  AF        .db $AF
  $A43B  80        .db $80
  $A43C  8D 91 93  STA $9391
  $A43F  8D 91 94  STA $9491
  $A442  8D 91 94  STA $9491
  $A445  8D 91 93  STA $9391
  $A448  8C 90 93  STY $9390
  $A44B  8C 90 93  STY $9390
  $A44E  98        TYA
  $A44F  04        .db $04
  $A450  00        BRK
  $A451  F5 A3     SBC $A3,X
  $A453  00        BRK
  $A454  05 07     ORA $07
  $A456  88        DEY
  $A457  10 03     BPL $A45C
  $A459  38        SEC
  $A45A  07        .db $07
  $A45B  82        .db $82

L_A45C:
  $A45C  70 83     BVS $A3E1
  $A45E  04        .db $04
  $A45F  17        .db $17
  $A460  5A        .db $5A
  $A461  A4 07     LDY $07
  $A463  84 40     STY $40
  $A465  01 FF     ORA ($FF,X)
  $A467  8B        .db $8B
  $A468  8B        .db $8B
  $A469  A0 8B     LDY #$8B
  $A46B  8B        .db $8B
  $A46C  A0 01     LDY #$01
  $A46E  00        BRK
  $A46F  07        .db $07
  $A470  82        .db $82
  $A471  70 83     BVS $A3F6
  $A473  04        .db $04
  $A474  17        .db $17
  $A475  6F        .db $6F
  $A476  A4 07     LDY $07
  $A478  84 40     STY $40
  $A47A  01 FF     ORA ($FF,X)
  $A47C  8B        .db $8B
  $A47D  8B        .db $8B
  $A47E  A0 6B     LDY #$6B
  $A480  6B        .db $6B
  $A481  6B        .db $6B
  $A482  6B        .db $6B
  $A483  6B        .db $6B
  $A484  6B        .db $6B
  $A485  6A        ROR
  $A486  6A        ROR
  $A487  01 00     ORA ($00,X)
  $A489  03        .db $03
  $A48A  3D 07 82  AND $8207,X
  $A48D  70 83     BVS $A412
  $A48F  83        .db $83
  $A490  07        .db $07
  $A491  84 40     STY $40
  $A493  01 FF     ORA ($FF,X)
  $A495  8B        .db $8B
  $A496  01 00     ORA ($00,X)
  $A498  07        .db $07
  $A499  82        .db $82
  $A49A  70 83     BVS $A41F
  $A49C  04        .db $04
  $A49D  00        BRK
  $A49E  89        .db $89
  $A49F  A4 00     LDY $00
  $A4A1  00        BRK
  $A4A2  80        .db $80
  $A4A3  00        BRK
  $A4A4  02        .db $02
  $A4A5  62        .db $62
  $A4A6  80        .db $80
  $A4A7  00        BRK
  $A4A8  0F        .db $0F
  $A4A9  B3        .db $B3
  $A4AA  A4 41     LDY $41
  $A4AC  A6 C0     LDX $C0
  $A4AE  A7        .db $A7
  $A4AF  40        RTI
  $A4B0  A9 58     LDA #$58
  $A4B2  A9 00     LDA #$00
  $A4B4  05 03     ORA $03
  $A4B6  3E 02 40  ROL $4002,X
  $A4B9  05 20     ORA $20
  $A4BB  07        .db $07
  $A4BC  84 10     STY $10
  $A4BE  85 68     STA $68
  $A4C0  68        PLA
  $A4C1  88        DEY
  $A4C2  68        PLA
  $A4C3  68        PLA
  $A4C4  88        DEY
  $A4C5  85 80     STA $80
  $A4C7  65 65     ADC $65
  $A4C9  88        DEY
  $A4CA  68        PLA
  $A4CB  68        PLA
  $A4CC  88        DEY
  $A4CD  85 80     STA $80
  $A4CF  8C 8A 8C  STY $8C8A
  $A4D2  80        .db $80
  $A4D3  68        PLA
  $A4D4  68        PLA
  $A4D5  88        DEY
  $A4D6  68        PLA
  $A4D7  68        PLA
  $A4D8  88        DEY
  $A4D9  85 80     STA $80
  $A4DB  8C 80 8A  STY $8A80
  $A4DE  80        .db $80
  $A4DF  88        DEY
  $A4E0  80        .db $80
  $A4E1  8A        TXA
  $A4E2  A0 80     LDY #$80
  $A4E4  6A        ROR
  $A4E5  6A        ROR
  $A4E6  8A        TXA
  $A4E7  6A        ROR
  $A4E8  6A        ROR
  $A4E9  8A        TXA
  $A4EA  87        .db $87
  $A4EB  80        .db $80
  $A4EC  8C 80 8A  STY $8A80
  $A4EF  80        .db $80
  $A4F0  88        DEY
  $A4F1  80        .db $80
  $A4F2  87        .db $87
  $A4F3  80        .db $80
  $A4F4  85 80     STA $80
  $A4F6  85 8C     STA $8C
  $A4F8  8F        .db $8F
  $A4F9  06 AE     ASL $AE
  $A4FB  85 80     STA $80
  $A4FD  85 8C     STA $8C
  $A4FF  8F        .db $8F
  $A500  8E 80 93  STX $9380
  $A503  94 80     STY $80,X

L_A505:
  $A505  68        PLA
  $A506  68        PLA
  $A507  88        DEY
  $A508  68        PLA
  $A509  68        PLA
  $A50A  88        DEY
  $A50B  85 80     STA $80
  $A50D  65 65     ADC $65
  $A50F  88        DEY
  $A510  68        PLA
  $A511  68        PLA
  $A512  88        DEY
  $A513  85 80     STA $80
  $A515  8C 8A 8C  STY $8C8A
  $A518  80        .db $80
  $A519  68        PLA
  $A51A  68        PLA
  $A51B  88        DEY
  $A51C  68        PLA
  $A51D  68        PLA
  $A51E  88        DEY
  $A51F  85 80     STA $80
  $A521  8C 80 8A  STY $8A80
  $A524  80        .db $80
  $A525  88        DEY
  $A526  80        .db $80
  $A527  8A        TXA
  $A528  A0 80     LDY #$80
  $A52A  6A        ROR
  $A52B  6A        ROR
  $A52C  8A        TXA
  $A52D  6A        ROR
  $A52E  6A        ROR
  $A52F  8A        TXA
  $A530  87        .db $87
  $A531  80        .db $80
  $A532  8C 80 8A  STY $8A80
  $A535  80        .db $80
  $A536  88        DEY
  $A537  80        .db $80
  $A538  87        .db $87
  $A539  80        .db $80
  $A53A  85 80     STA $80
  $A53C  85 8C     STA $8C
  $A53E  8F        .db $8F
  $A53F  06 AE     ASL $AE
  $A541  85 80     STA $80
  $A543  85 8C     STA $8C
  $A545  8F        .db $8F
  $A546  8E 80 8F  STX $8F80
  $A549  07        .db $07
  $A54A  90 10     BCC $A55C
  $A54C  02        .db $02
  $A54D  80        .db $80
  $A54E  22        .db $22
  $A54F  91 B1     STA ($B1),Y
  $A551  D1 8F     CMP ($8F),Y
  $A553  B4 B1     LDY $B1,X
  $A555  AF        .db $AF
  $A556  B1 80     LDA ($80),Y
  $A558  CF        .db $CF
  $A559  8F        .db $8F
  $A55A  06 B1     ASL $B1

L_A55C:
  $A55C  8C 8D 8C  STY $8C8D
  $A55F  88        DEY
  $A560  80        .db $80
  $A561  88        DEY
  $A562  8C 8F 06  STY $068F
  $A565  D1 8F     CMP ($8F),Y
  $A567  B4 B1     LDY $B1,X
  $A569  AF        .db $AF
  $A56A  B1 21     LDA ($21),Y
  $A56C  8F        .db $8F
  $A56D  CF        .db $CF
  $A56E  8F        .db $8F
  $A56F  8C 8F 90  STY $908F
  $A572  80        .db $80
  $A573  90 90     BCC $A505
  $A575  93        .db $93
  $A576  D8        CLD
  $A577  07        .db $07
  $A578  95 30     STA $30,X
  $A57A  02        .db $02
  $A57B  00        BRK
  $A57C  03        .db $03
  $A57D  3F        .db $3F
  $A57E  05 14     ORA $14
  $A580  08        PHP
  $A581  01 06     ORA ($06,X)
  $A583  CC 8A AF  CPY $AF8A
  $A586  AD AC AD  LDA $ADAC
  $A589  22        .db $22
  $A58A  8C CC AC  STY $ACCC
  $A58D  8A        TXA
  $A58E  AF        .db $AF
  $A58F  AD AC AD  LDA $ADAC
  $A592  21 88     AND ($88,X)
  $A594  C8        INY
  $A595  88        DEY
  $A596  8A        TXA
  $A597  8C E7 08  STY $08E7
  $A59A  00        BRK
  $A59B  05 20     ORA $20
  $A59D  02        .db $02
  $A59E  80        .db $80
  $A59F  85 80     STA $80
  $A5A1  85 8C     STA $8C
  $A5A3  8F        .db $8F
  $A5A4  06 AE     ASL $AE
  $A5A6  85 80     STA $80
  $A5A8  85 8C     STA $8C
  $A5AA  8F        .db $8F
  $A5AB  8E 80 8F  STX $8F80
  $A5AE  08        PHP
  $A5AF  01 02     ORA ($02,X)
  $A5B1  C0 21     CPY #$21
  $A5B3  91 D1     STA ($D1),Y
  $A5B5  B1 8F     LDA ($8F),Y
  $A5B7  91 80     STA ($80),Y
  $A5B9  06 B4     ASL $B4
  $A5BB  98        TYA
  $A5BC  96 94     STX $94,Y
  $A5BE  93        .db $93
  $A5BF  D1 B1     CMP ($B1),Y
  $A5C1  8F        .db $8F
  $A5C2  91 80     STA ($80),Y
  $A5C4  06 B4     ASL $B4
  $A5C6  94 96     STY $96,X
  $A5C8  B4 D3     LDY $D3,X
  $A5CA  93        .db $93
  $A5CB  91 8F     STA ($8F),Y
  $A5CD  06 B8     ASL $B8
  $A5CF  B6 B4     LDX $B4,Y
  $A5D1  B3        .db $B3
  $A5D2  93        .db $93
  $A5D3  94 93     STY $93,X
  $A5D5  D1 85     CMP ($85),Y
  $A5D7  80        .db $80
  $A5D8  85 8C     STA $8C
  $A5DA  8F        .db $8F
  $A5DB  8E 80 8F  STX $8F80
  $A5DE  08        PHP
  $A5DF  00        BRK
  $A5E0  02        .db $02
  $A5E1  80        .db $80
  $A5E2  22        .db $22
  $A5E3  91 B1     STA ($B1),Y
  $A5E5  D1 8F     CMP ($8F),Y
  $A5E7  B4 B1     LDY $B1,X
  $A5E9  AF        .db $AF
  $A5EA  B1 80     LDA ($80),Y
  $A5EC  CF        .db $CF
  $A5ED  8F        .db $8F
  $A5EE  06 B1     ASL $B1
  $A5F0  8C 8D 8C  STY $8C8D
  $A5F3  88        DEY
  $A5F4  80        .db $80
  $A5F5  88        DEY
  $A5F6  8C 8F 06  STY $068F
  $A5F9  D1 8F     CMP ($8F),Y
  $A5FB  B4 B1     LDY $B1,X
  $A5FD  AF        .db $AF
  $A5FE  B1 21     LDA ($21),Y
  $A600  8F        .db $8F
  $A601  CF        .db $CF
  $A602  8F        .db $8F
  $A603  8C 8F 90  STY $908F
  $A606  80        .db $80
  $A607  90 90     BCC $A599
  $A609  93        .db $93
  $A60A  06 B8     ASL $B8
  $A60C  05 14     ORA $14
  $A60E  02        .db $02
  $A60F  40        RTI
  $A610  94 80     STY $80,X
  $A612  94 94     STY $94,X
  $A614  93        .db $93
  $A615  B4 9D     LDY $9D,X
  $A617  BB        .db $BB
  $A618  B9 B8 B6  LDA $B6B8,Y
  $A61B  96 80     STX $80,Y
  $A61D  98        TYA
  $A61E  98        TYA
  $A61F  80        .db $80
  $A620  98        TYA
  $A621  A0 96     LDY #$96
  $A623  80        .db $80
  $A624  98        TYA
  $A625  98        TYA
  $A626  80        .db $80
  $A627  98        TYA
  $A628  80        .db $80
  $A629  96 94     STX $94,Y
  $A62B  80        .db $80
  $A62C  94 94     STY $94,X
  $A62E  93        .db $93
  $A62F  B4 9D     LDY $9D,X
  $A631  BB        .db $BB
  $A632  B9 B8 B6  LDA $B6B8,Y
  $A635  80        .db $80
  $A636  93        .db $93
  $A637  94 93     STY $93,X
  $A639  21 91     AND ($91,X)
  $A63B  D1 E0     CMP ($E0),Y
  $A63D  04        .db $04
  $A63E  00        BRK
  $A63F  B5 A4     LDA $A4,X
  $A641  00        BRK
  $A642  05 02     ORA $02
  $A644  40        RTI
  $A645  05 14     ORA $14
  $A647  07        .db $07
  $A648  84 10     STY $10
  $A64A  03        .db $03
  $A64B  3A        .db $3A
  $A64C  80        .db $80
  $A64D  71 71     ADC ($71),Y
  $A64F  91 71     STA ($71),Y
  $A651  71 91     ADC ($91),Y
  $A653  8C 80 6C  STY $6C80
  $A656  6C 91 71  JMP ($7191)
  $A659  71 91     ADC ($91),Y
  $A65B  8C 80 94  STY $9480
  $A65E  93        .db $93
  $A65F  94 80     STY $80,X
  $A661  71 71     ADC ($71),Y
  $A663  91 71     STA ($71),Y
  $A665  71 91     ADC ($91),Y
  $A667  8C 80 94  STY $9480
  $A66A  80        .db $80
  $A66B  93        .db $93
  $A66C  80        .db $80
  $A66D  91 80     STA ($80),Y
  $A66F  93        .db $93
  $A670  A0 80     LDY #$80
  $A672  73        .db $73
  $A673  73        .db $73
  $A674  93        .db $93
  $A675  73        .db $73
  $A676  73        .db $73
  $A677  93        .db $93
  $A678  8F        .db $8F
  $A679  80        .db $80
  $A67A  94 80     STY $80,X
  $A67C  93        .db $93
  $A67D  80        .db $80
  $A67E  91 80     STA ($80),Y
  $A680  8F        .db $8F
  $A681  05 20     ORA $20
  $A683  A0 85     LDY #$85
  $A685  80        .db $80
  $A686  85 8C     STA $8C
  $A688  8F        .db $8F
  $A689  06 AE     ASL $AE
  $A68B  85 80     STA $80
  $A68D  85 8C     STA $8C
  $A68F  8F        .db $8F
  $A690  8E 8F 91  STX $918F
  $A693  04        .db $04
  $A694  01 43     ORA ($43,X)
  $A696  A6 07     LDX $07
  $A698  92        .db $92
  $A699  10 02     BPL $A69D
  $A69B  80        .db $80
  $A69C  60        RTS

L_A69D:
  $A69D  22        .db $22
  $A69E  91 B1     STA ($B1),Y
  $A6A0  D1 8F     CMP ($8F),Y
  $A6A2  B4 B1     LDY $B1,X
  $A6A4  AF        .db $AF
  $A6A5  B1 80     LDA ($80),Y
  $A6A7  CF        .db $CF
  $A6A8  8F        .db $8F
  $A6A9  06 B1     ASL $B1
  $A6AB  8C 8D 8C  STY $8C8D
  $A6AE  88        DEY
  $A6AF  80        .db $80
  $A6B0  88        DEY
  $A6B1  8C 8F 06  STY $068F
  $A6B4  D1 8F     CMP ($8F),Y
  $A6B6  B4 B1     LDY $B1,X
  $A6B8  AF        .db $AF
  $A6B9  B1 21     LDA ($21),Y
  $A6BB  8F        .db $8F
  $A6BC  CF        .db $CF
  $A6BD  8F        .db $8F
  $A6BE  8C 8F 90  STY $908F
  $A6C1  80        .db $80
  $A6C2  90 90     BCC $A654
  $A6C4  93        .db $93
  $A6C5  22        .db $22
  $A6C6  B8        CLV
  $A6C7  68        PLA
  $A6C8  02        .db $02
  $A6C9  00        BRK
  $A6CA  85 68     STA $68
  $A6CC  68        PLA
  $A6CD  88        DEY
  $A6CE  68        PLA
  $A6CF  68        PLA
  $A6D0  88        DEY
  $A6D1  85 80     STA $80
  $A6D3  65 65     ADC $65
  $A6D5  88        DEY
  $A6D6  68        PLA
  $A6D7  68        PLA
  $A6D8  88        DEY
  $A6D9  85 80     STA $80
  $A6DB  8C 8A 8C  STY $8C8A
  $A6DE  80        .db $80
  $A6DF  68        PLA
  $A6E0  68        PLA
  $A6E1  88        DEY
  $A6E2  68        PLA
  $A6E3  68        PLA
  $A6E4  88        DEY
  $A6E5  85 80     STA $80
  $A6E7  8C 80 8A  STY $8A80
  $A6EA  80        .db $80
  $A6EB  88        DEY
  $A6EC  80        .db $80
  $A6ED  8A        TXA
  $A6EE  A0 80     LDY #$80
  $A6F0  6A        ROR
  $A6F1  6A        ROR
  $A6F2  8A        TXA
  $A6F3  6A        ROR
  $A6F4  6A        ROR
  $A6F5  8A        TXA
  $A6F6  87        .db $87
  $A6F7  80        .db $80
  $A6F8  8C 80 8A  STY $8A80
  $A6FB  80        .db $80
  $A6FC  88        DEY
  $A6FD  80        .db $80
  $A6FE  87        .db $87
  $A6FF  02        .db $02
  $A700  80        .db $80
  $A701  A0 85     LDY #$85
  $A703  80        .db $80
  $A704  85 8C     STA $8C
  $A706  8F        .db $8F
  $A707  06 AE     ASL $AE
  $A709  85 80     STA $80
  $A70B  85 8C     STA $8C
  $A70D  8F        .db $8F
  $A70E  8E 96 98  STX $9896
  $A711  02        .db $02
  $A712  00        BRK
  $A713  80        .db $80

L_A714:
  $A714  68        PLA
  $A715  68        PLA
  $A716  88        DEY
  $A717  68        PLA
  $A718  68        PLA
  $A719  88        DEY
  $A71A  85 80     STA $80
  $A71C  65 65     ADC $65
  $A71E  88        DEY
  $A71F  68        PLA
  $A720  68        PLA
  $A721  88        DEY
  $A722  85 80     STA $80
  $A724  8C 8A 8C  STY $8C8A
  $A727  80        .db $80
  $A728  68        PLA
  $A729  68        PLA
  $A72A  88        DEY
  $A72B  68        PLA
  $A72C  68        PLA
  $A72D  88        DEY
  $A72E  85 80     STA $80
  $A730  8C 80 8A  STY $8A80
  $A733  80        .db $80
  $A734  88        DEY
  $A735  80        .db $80
  $A736  8A        TXA
  $A737  A0 80     LDY #$80
  $A739  6A        ROR
  $A73A  6A        ROR
  $A73B  8A        TXA
  $A73C  6A        ROR
  $A73D  6A        ROR
  $A73E  8A        TXA
  $A73F  87        .db $87
  $A740  80        .db $80
  $A741  8C 80 8A  STY $8A80
  $A744  80        .db $80
  $A745  88        DEY
  $A746  80        .db $80
  $A747  87        .db $87
  $A748  02        .db $02
  $A749  80        .db $80
  $A74A  80        .db $80
  $A74B  85 80     STA $80
  $A74D  85 8C     STA $8C
  $A74F  8F        .db $8F
  $A750  CE 85 80  DEC $8085
  $A753  85 8C     STA $8C
  $A755  8F        .db $8F
  $A756  8E 96 98  STX $9896
  $A759  07        .db $07
  $A75A  8A        TXA
  $A75B  10 60     BPL $A7BD
  $A75D  22        .db $22
  $A75E  91 B1     STA ($B1),Y
  $A760  D1 8F     CMP ($8F),Y
  $A762  B4 B1     LDY $B1,X
  $A764  AF        .db $AF
  $A765  B1 80     LDA ($80),Y
  $A767  CF        .db $CF
  $A768  8F        .db $8F
  $A769  06 B1     ASL $B1
  $A76B  8C 8D 8C  STY $8C8D
  $A76E  88        DEY
  $A76F  80        .db $80
  $A770  88        DEY
  $A771  8C 8F 06  STY $068F
  $A774  D1 8F     CMP ($8F),Y
  $A776  B4 B1     LDY $B1,X
  $A778  AF        .db $AF
  $A779  B1 21     LDA ($21),Y
  $A77B  8F        .db $8F
  $A77C  CF        .db $CF
  $A77D  8F        .db $8F
  $A77E  8C 8F 90  STY $908F
  $A781  80        .db $80
  $A782  90 90     BCC $A714
  $A784  93        .db $93
  $A785  06 80     ASL $80
  $A787  05 14     ORA $14
  $A789  02        .db $02
  $A78A  40        RTI
  $A78B  08        PHP
  $A78C  01 91     ORA ($91,X)
  $A78E  80        .db $80
  $A78F  91 91     STA ($91),Y
  $A791  8F        .db $8F
  $A792  B1 99     LDA ($99),Y
  $A794  B6 B6     LDX $B6,Y
  $A796  B4 B3     LDY $B3,X
  $A798  93        .db $93
  $A799  80        .db $80
  $A79A  94 94     STY $94,X
  $A79C  80        .db $80
  $A79D  94 A0     STY $A0,X
  $A79F  93        .db $93
  $A7A0  80        .db $80
  $A7A1  94 94     STY $94,X
  $A7A3  80        .db $80
  $A7A4  94 80     STY $80,X
  $A7A6  93        .db $93
  $A7A7  91 80     STA ($80),Y
  $A7A9  91 91     STA ($91),Y
  $A7AB  8F        .db $8F
  $A7AC  B1 99     LDA ($99),Y
  $A7AE  B6 B6     LDX $B6,Y
  $A7B0  B4 B3     LDY $B3,X
  $A7B2  80        .db $80
  $A7B3  8F        .db $8F
  $A7B4  91 8F     STA ($8F),Y
  $A7B6  21 8C     AND ($8C,X)
  $A7B8  CC E0 08  CPY $08E0
  $A7BB  00        BRK
  $A7BC  04        .db $04

L_A7BD:
  $A7BD  00        BRK
  $A7BE  43        .db $43
  $A7BF  A6 00     LDX $00
  $A7C1  05 03     ORA $03
  $A7C3  41 05     EOR ($05,X)
  $A7C5  2C 85 65  BIT $6585
  $A7C8  65 04     ADC $04
  $A7CA  07        .db $07
  $A7CB  C6 A7     DEC $A7
  $A7CD  81 61     STA ($61,X)
  $A7CF  61 04     ADC ($04,X)
  $A7D1  07        .db $07
  $A7D2  CD A7 83  CMP $83A7
  $A7D5  63        .db $63
  $A7D6  63        .db $63
  $A7D7  04        .db $04
  $A7D8  07        .db $07
  $A7D9  D4        .db $D4
  $A7DA  A7        .db $A7
  $A7DB  85 65     STA $65
  $A7DD  65 04     ADC $04
  $A7DF  06 DB     ASL $DB
  $A7E1  A7        .db $A7
  $A7E2  83        .db $83
  $A7E3  21 85     AND ($85,X)
  $A7E5  85 65     STA $65
  $A7E7  65 04     ADC $04
  $A7E9  07        .db $07
  $A7EA  E5 A7     SBC $A7
  $A7EC  81 61     STA ($61,X)
  $A7EE  61 04     ADC ($04,X)
  $A7F0  07        .db $07
  $A7F1  EC A7 83  CPX $83A7
  $A7F4  63        .db $63
  $A7F5  63        .db $63
  $A7F6  04        .db $04
  $A7F7  07        .db $07
  $A7F8  F3        .db $F3
  $A7F9  A7        .db $A7
  $A7FA  85 65     STA $65
  $A7FC  65 04     ADC $04
  $A7FE  06 FA     ASL $FA
  $A800  A7        .db $A7
  $A801  83        .db $83
  $A802  21 85     AND ($85,X)
  $A804  86 66     STX $66
  $A806  66 86     ROR $86
  $A808  66 66     ROR $66
  $A80A  86 6D     STX $6D
  $A80C  6D 6A 6A  ADC $6A6A
  $A80F  8A        TXA
  $A810  80        .db $80
  $A811  66 66     ROR $66
  $A813  8A        TXA
  $A814  66 66     ROR $66
  $A816  91 6A     STA ($6A),Y
  $A818  6A        ROR
  $A819  8D 66 66  STA $6666
  $A81C  85 65     STA $65
  $A81E  65 85     ADC $85
  $A820  65 65     ADC $65
  $A822  85 6C     STA $6C
  $A824  6C 68 68  JMP ($6868)
  $A827  8F        .db $8F
  $A828  80        .db $80
  $A829  65 65     ADC $65
  $A82B  88        DEY
  $A82C  65 65     ADC $65
  $A82E  8F        .db $8F
  $A82F  68        PLA
  $A830  68        PLA
  $A831  8C 65 65  STY $6565
  $A834  86 66     STX $66
  $A836  66 86     ROR $86
  $A838  66 66     ROR $66
  $A83A  86 6D     STX $6D
  $A83C  6D 6A 6A  ADC $6A6A
  $A83F  8A        TXA
  $A840  80        .db $80
  $A841  66 66     ROR $66
  $A843  8A        TXA
  $A844  66 66     ROR $66
  $A846  91 6A     STA ($6A),Y
  $A848  6A        ROR
  $A849  8D 66 66  STA $6666
  $A84C  83        .db $83
  $A84D  63        .db $63
  $A84E  63        .db $63
  $A84F  04        .db $04
  $A850  02        .db $02
  $A851  4C A8 83  JMP $83A8
  $A854  84 80     STY $80
  $A856  84 84     STY $84
  $A858  84 A4     STY $A4
  $A85A  A0 85     LDY #$85
  $A85C  65 65     ADC $65
  $A85E  04        .db $04
  $A85F  07        .db $07
  $A860  5B        .db $5B
  $A861  A8        TAY
  $A862  81 61     STA ($61,X)
  $A864  61 04     ADC ($04,X)
  $A866  07        .db $07
  $A867  62        .db $62
  $A868  A8        TAY
  $A869  83        .db $83
  $A86A  63        .db $63
  $A86B  63        .db $63
  $A86C  04        .db $04
  $A86D  07        .db $07
  $A86E  69 A8     ADC #$A8
  $A870  85 65     STA $65
  $A872  65 04     ADC $04
  $A874  06 70     ASL $70
  $A876  A8        TAY
  $A877  83        .db $83
  $A878  21 85     AND ($85,X)
  $A87A  85 65     STA $65
  $A87C  65 04     ADC $04
  $A87E  07        .db $07
  $A87F  7A        .db $7A
  $A880  A8        TAY
  $A881  81 61     STA ($61,X)
  $A883  61 04     ADC ($04,X)
  $A885  07        .db $07
  $A886  81 A8     STA ($A8,X)
  $A888  83        .db $83
  $A889  63        .db $63
  $A88A  63        .db $63
  $A88B  04        .db $04
  $A88C  07        .db $07
  $A88D  88        DEY
  $A88E  A8        TAY
  $A88F  85 65     STA $65
  $A891  65 04     ADC $04
  $A893  06 8F     ASL $8F
  $A895  A8        TAY
  $A896  83        .db $83
  $A897  21 85     AND ($85,X)
  $A899  86 66     STX $66
  $A89B  66 86     ROR $86
  $A89D  66 66     ROR $66
  $A89F  86 6D     STX $6D
  $A8A1  6D 6A 6A  ADC $6A6A
  $A8A4  8A        TXA
  $A8A5  80        .db $80
  $A8A6  66 66     ROR $66
  $A8A8  8A        TXA
  $A8A9  66 66     ROR $66
  $A8AB  91 6A     STA ($6A),Y
  $A8AD  6A        ROR
  $A8AE  8D 66 66  STA $6666
  $A8B1  85 65     STA $65
  $A8B3  65 85     ADC $85
  $A8B5  65 65     ADC $65
  $A8B7  85 6C     STA $6C
  $A8B9  6C 68 68  JMP ($6868)
  $A8BC  8F        .db $8F
  $A8BD  80        .db $80
  $A8BE  65 65     ADC $65
  $A8C0  88        DEY
  $A8C1  65 65     ADC $65
  $A8C3  8F        .db $8F
  $A8C4  68        PLA
  $A8C5  68        PLA
  $A8C6  8C 65 65  STY $6565
  $A8C9  86 66     STX $66
  $A8CB  66 86     ROR $86
  $A8CD  66 66     ROR $66
  $A8CF  86 6D     STX $6D
  $A8D1  6D 6A 6A  ADC $6A6A
  $A8D4  8A        TXA
  $A8D5  80        .db $80
  $A8D6  66 66     ROR $66
  $A8D8  8A        TXA
  $A8D9  66 66     ROR $66
  $A8DB  91 6A     STA ($6A),Y
  $A8DD  6A        ROR
  $A8DE  8D 66 66  STA $6666
  $A8E1  83        .db $83
  $A8E2  63        .db $63
  $A8E3  63        .db $63
  $A8E4  04        .db $04
  $A8E5  02        .db $02
  $A8E6  E1 A8     SBC ($A8,X)
  $A8E8  83        .db $83
  $A8E9  84 80     STY $80
  $A8EB  84 84     STY $84
  $A8ED  84 A4     STY $A4
  $A8EF  80        .db $80
  $A8F0  A1 61     LDA ($61,X)
  $A8F2  61 81     ADC ($81,X)
  $A8F4  61 61     ADC ($61,X)
  $A8F6  81 61     STA ($61,X)
  $A8F8  61 81     ADC ($81,X)
  $A8FA  A3        .db $A3
  $A8FB  63        .db $63
  $A8FC  63        .db $63
  $A8FD  83        .db $83
  $A8FE  63        .db $63
  $A8FF  63        .db $63
  $A900  83        .db $83
  $A901  63        .db $63
  $A902  63        .db $63
  $A903  83        .db $83
  $A904  05 20     ORA $20
  $A906  A5 91     LDA $91
  $A908  87        .db $87
  $A909  93        .db $93
  $A90A  88        DEY
  $A90B  94 87     STY $87,X
  $A90D  04        .db $04
  $A90E  01 04     ORA ($04,X)
  $A910  A9 05     LDA #$05
  $A912  2C A1 61  BIT $61A1
  $A915  61 81     ADC ($81,X)
  $A917  61 61     ADC ($61,X)
  $A919  81 61     STA ($61,X)
  $A91B  61 81     ADC ($81,X)
  $A91D  A3        .db $A3
  $A91E  63        .db $63
  $A91F  63        .db $63
  $A920  83        .db $83
  $A921  63        .db $63
  $A922  63        .db $63
  $A923  83        .db $83
  $A924  63        .db $63
  $A925  63        .db $63
  $A926  A4 A5     LDY $A5
  $A928  01 10     ORA ($10,X)
  $A92A  6D 6D 6C  ADC $6C6D
  $A92D  6C 6A 6A  JMP ($6A6A)
  $A930  68        PLA
  $A931  68        PLA
  $A932  01 00     ORA ($00,X)
  $A934  83        .db $83
  $A935  85 80     STA $80
  $A937  83        .db $83
  $A938  A5 83     LDA $83
  $A93A  84 A5     STY $A5
  $A93C  04        .db $04
  $A93D  00        BRK
  $A93E  C4 A7     CPY $A7
  $A940  00        BRK
  $A941  05 03     ORA $03
  $A943  3F        .db $3F
  $A944  07        .db $07
  $A945  82        .db $82
  $A946  A0 62     LDY #$62
  $A948  60        RTS
  $A949  62        .db $62
  $A94A  62        .db $62
  $A94B  07        .db $07
  $A94C  83        .db $83
  $A94D  40        RTI
  $A94E  87        .db $87
  $A94F  07        .db $07
  $A950  82        .db $82
  $A951  A0 62     LDY #$62
  $A953  62        .db $62
  $A954  04        .db $04
  $A955  00        BRK
  $A956  44        .db $44
  $A957  A9 00     LDA #$00
  $A959  00        BRK
  $A95A  80        .db $80
  $A95B  00        BRK
  $A95C  01 41     ORA ($41,X)
  $A95E  80        .db $80
  $A95F  00        BRK
  $A960  0F        .db $0F
  $A961  6B        .db $6B
  $A962  A9 47     LDA #$47
  $A964  AA        TAX
  $A965  A9 AA     LDA #$AA
  $A967  87        .db $87
  $A968  AB        .db $AB
  $A969  98        TYA
  $A96A  AB        .db $AB
  $A96B  00        BRK
  $A96C  06 03     ASL $03
  $A96E  3C        .db $3C
  $A96F  02        .db $02
  $A970  00        BRK
  $A971  05 22     ORA $22
  $A973  07        .db $07
  $A974  A0 10     LDY #$10
  $A976  08        PHP
  $A977  01 E5     ORA ($E5,X)
  $A979  08        PHP
  $A97A  00        BRK
  $A97B  21 CC     AND ($CC,X)
  $A97D  08        PHP
  $A97E  01 CC     ORA ($CC,X)
  $A980  08        PHP
  $A981  00        BRK
  $A982  21 C7     AND ($C7,X)
  $A984  08        PHP
  $A985  01 C7     ORA ($C7,X)
  $A987  08        PHP
  $A988  00        BRK
  $A989  21 C8     AND ($C8,X)
  $A98B  08        PHP
  $A98C  01 C8     ORA ($C8,X)
  $A98E  08        PHP
  $A98F  00        BRK
  $A990  21 C6     AND ($C6,X)
  $A992  08        PHP
  $A993  01 C6     ORA ($C6,X)
  $A995  08        PHP
  $A996  00        BRK
  $A997  21 CD     AND ($CD,X)
  $A999  08        PHP
  $A99A  01 CD     ORA ($CD,X)
  $A99C  08        PHP
  $A99D  00        BRK
  $A99E  21 C8     AND ($C8,X)
  $A9A0  08        PHP
  $A9A1  01 C8     ORA ($C8,X)
  $A9A3  08        PHP
  $A9A4  00        BRK
  $A9A5  21 C9     AND ($C9,X)
  $A9A7  08        PHP
  $A9A8  01 C9     ORA ($C9,X)
  $A9AA  08        PHP
  $A9AB  00        BRK
  $A9AC  21 C7     AND ($C7,X)
  $A9AE  08        PHP
  $A9AF  01 C7     ORA ($C7,X)
  $A9B1  08        PHP
  $A9B2  00        BRK
  $A9B3  21 CE     AND ($CE,X)
  $A9B5  08        PHP
  $A9B6  01 CE     ORA ($CE,X)
  $A9B8  08        PHP
  $A9B9  00        BRK
  $A9BA  21 C9     AND ($C9,X)
  $A9BC  08        PHP
  $A9BD  01 C9     ORA ($C9,X)
  $A9BF  08        PHP
  $A9C0  00        BRK
  $A9C1  21 CA     AND ($CA,X)
  $A9C3  08        PHP
  $A9C4  01 CA     ORA ($CA,X)
  $A9C6  08        PHP
  $A9C7  00        BRK
  $A9C8  21 C8     AND ($C8,X)
  $A9CA  08        PHP
  $A9CB  01 C8     ORA ($C8,X)
  $A9CD  08        PHP
  $A9CE  00        BRK
  $A9CF  21 CF     AND ($CF,X)
  $A9D1  08        PHP
  $A9D2  01 CF     ORA ($CF,X)
  $A9D4  08        PHP
  $A9D5  00        BRK
  $A9D6  21 CA     AND ($CA,X)
  $A9D8  08        PHP
  $A9D9  01 CA     ORA ($CA,X)
  $A9DB  08        PHP
  $A9DC  00        BRK
  $A9DD  21 CB     AND ($CB,X)
  $A9DF  08        PHP
  $A9E0  01 CB     ORA ($CB,X)
  $A9E2  08        PHP
  $A9E3  00        BRK
  $A9E4  21 C9     AND ($C9,X)
  $A9E6  08        PHP
  $A9E7  01 C9     ORA ($C9,X)
  $A9E9  08        PHP
  $A9EA  00        BRK
  $A9EB  21 D0     AND ($D0,X)
  $A9ED  08        PHP
  $A9EE  01 D0     ORA ($D0,X)
  $A9F0  08        PHP
  $A9F1  00        BRK
  $A9F2  21 CB     AND ($CB,X)
  $A9F4  08        PHP
  $A9F5  01 CB     ORA ($CB,X)
  $A9F7  08        PHP
  $A9F8  00        BRK
  $A9F9  21 CC     AND ($CC,X)
  $A9FB  08        PHP
  $A9FC  01 CC     ORA ($CC,X)
  $A9FE  05 27     ORA $27
  $AA00  08        PHP
  $AA01  00        BRK
  $AA02  04        .db $04
  $AA03  01 76     ORA ($76,X)
  $AA05  A9 05     LDA #$05
  $AA07  22        .db $22
  $AA08  21 CF     AND ($CF,X)
  $AA0A  08        PHP
  $AA0B  01 CF     ORA ($CF,X)
  $AA0D  08        PHP
  $AA0E  00        BRK
  $AA0F  21 D6     AND ($D6,X)
  $AA11  08        PHP
  $AA12  01 D6     ORA ($D6,X)
  $AA14  08        PHP
  $AA15  00        BRK
  $AA16  21 D1     AND ($D1,X)
  $AA18  08        PHP
  $AA19  01 D1     ORA ($D1,X)
  $AA1B  08        PHP
  $AA1C  00        BRK
  $AA1D  21 D2     AND ($D2,X)
  $AA1F  08        PHP
  $AA20  01 D2     ORA ($D2,X)
  $AA22  08        PHP
  $AA23  00        BRK
  $AA24  21 D0     AND ($D0,X)
  $AA26  08        PHP
  $AA27  01 D0     ORA ($D0,X)
  $AA29  08        PHP
  $AA2A  00        BRK
  $AA2B  21 D7     AND ($D7,X)
  $AA2D  08        PHP
  $AA2E  01 D7     ORA ($D7,X)
  $AA30  08        PHP
  $AA31  00        BRK
  $AA32  21 D2     AND ($D2,X)
  $AA34  08        PHP
  $AA35  01 D2     ORA ($D2,X)
  $AA37  08        PHP
  $AA38  00        BRK
  $AA39  D3        .db $D3
  $AA3A  08        PHP
  $AA3B  01 01     ORA ($01,X)
  $AA3D  05 D3     ORA $D3
  $AA3F  01 00     ORA ($00,X)
  $AA41  08        PHP
  $AA42  00        BRK
  $AA43  04        .db $04
  $AA44  00        BRK
  $AA45  76 A9     ROR $A9,X
  $AA47  00        BRK
  $AA48  06 07     ASL $07
  $AA4A  A0 10     LDY #$10
  $AA4C  02        .db $02
  $AA4D  00        BRK
  $AA4E  05 22     ORA $22
  $AA50  03        .db $03
  $AA51  39 05 22  AND $2205,Y
  $AA54  E5 E8     SBC $E8
  $AA56  E3        .db $E3
  $AA57  21 C5     AND ($C5,X)
  $AA59  08        PHP
  $AA5A  01 C5     ORA ($C5,X)
  $AA5C  08        PHP
  $AA5D  00        BRK
  $AA5E  E1 E9     SBC ($E9,X)
  $AA60  E4 21     CPX $21
  $AA62  C6 08     DEC $08
  $AA64  01 C6     ORA ($C6,X)
  $AA66  08        PHP
  $AA67  00        BRK
  $AA68  E2        .db $E2
  $AA69  EA        NOP
  $AA6A  E5 21     SBC $21
  $AA6C  C7        .db $C7
  $AA6D  08        PHP
  $AA6E  01 C7     ORA ($C7,X)
  $AA70  08        PHP
  $AA71  00        BRK
  $AA72  E3        .db $E3
  $AA73  EB        .db $EB
  $AA74  E6 21     INC $21
  $AA76  C8        INY
  $AA77  08        PHP
  $AA78  01 C8     ORA ($C8,X)
  $AA7A  08        PHP
  $AA7B  00        BRK
  $AA7C  E4 EC     CPX $EC
  $AA7E  E7        .db $E7
  $AA7F  21 C9     AND ($C9,X)
  $AA81  08        PHP
  $AA82  01 C9     ORA ($C9,X)
  $AA84  08        PHP
  $AA85  00        BRK
  $AA86  E5 ED     SBC $ED
  $AA88  E8        INX
  $AA89  21 CA     AND ($CA,X)
  $AA8B  08        PHP
  $AA8C  01 C9     ORA ($C9,X)
  $AA8E  08        PHP
  $AA8F  00        BRK
  $AA90  05 27     ORA $27
  $AA92  04        .db $04
  $AA93  01 5E     ORA ($5E,X)
  $AA95  AA        TAX
  $AA96  05 22     ORA $22
  $AA98  EB        .db $EB
  $AA99  F3        .db $F3
  $AA9A  EE D0 08  INC $08D0
  $AA9D  01 01     ORA ($01,X)
  $AA9F  05 D0     ORA $D0
  $AAA1  01 00     ORA ($00,X)
  $AAA3  08        PHP
  $AAA4  00        BRK
  $AAA5  04        .db $04
  $AAA6  00        BRK
  $AAA7  52        .db $52
  $AAA8  AA        TAX
  $AAA9  00        BRK
  $AAAA  06 03     ASL $03
  $AAAC  35 05     AND $05,X
  $AAAE  22        .db $22
  $AAAF  65 65     ADC $65
  $AAB1  60        RTS
  $AAB2  65 65     ADC $65
  $AAB4  63        .db $63
  $AAB5  65 65     ADC $65
  $AAB7  80        .db $80
  $AAB8  85 88     STA $88
  $AABA  8C 04 03  STY $0304
  $AABD  AF        .db $AF
  $AABE  AA        TAX
  $AABF  66 66     ROR $66
  $AAC1  60        RTS
  $AAC2  66 66     ROR $66
  $AAC4  64        .db $64
  $AAC5  66 66     ROR $66
  $AAC7  80        .db $80
  $AAC8  86 89     STX $89
  $AACA  8D 04 03  STA $0304
  $AACD  BF        .db $BF
  $AACE  AA        TAX
  $AACF  67        .db $67
  $AAD0  67        .db $67
  $AAD1  60        RTS
  $AAD2  67        .db $67
  $AAD3  67        .db $67
  $AAD4  65 67     ADC $67
  $AAD6  67        .db $67
  $AAD7  80        .db $80
  $AAD8  87        .db $87
  $AAD9  8A        TXA
  $AADA  8E 04 03  STX $0304
  $AADD  CF        .db $CF
  $AADE  AA        TAX
  $AADF  68        PLA
  $AAE0  68        PLA
  $AAE1  60        RTS
  $AAE2  68        PLA
  $AAE3  68        PLA
  $AAE4  66 68     ROR $68
  $AAE6  68        PLA
  $AAE7  80        .db $80
  $AAE8  88        DEY
  $AAE9  8B        .db $8B
  $AAEA  8F        .db $8F
  $AAEB  04        .db $04
  $AAEC  03        .db $03
  $AAED  DF        .db $DF
  $AAEE  AA        TAX
  $AAEF  69 69     ADC #$69
  $AAF1  60        RTS
  $AAF2  69 69     ADC #$69
  $AAF4  67        .db $67
  $AAF5  69 69     ADC #$69
  $AAF7  80        .db $80
  $AAF8  89        .db $89
  $AAF9  8C 90 04  STY $0490
  $AAFC  03        .db $03

L_AAFD:
  $AAFD  EF        .db $EF
  $AAFE  AA        TAX
  $AAFF  6A        ROR
  $AB00  6A        ROR
  $AB01  60        RTS
  $AB02  6A        ROR
  $AB03  6A        ROR
  $AB04  68        PLA
  $AB05  6A        ROR
  $AB06  6A        ROR
  $AB07  80        .db $80
  $AB08  8A        TXA
  $AB09  8D 91 04  STA $0491
  $AB0C  03        .db $03
  $AB0D  FF        .db $FF
  $AB0E  AA        TAX
  $AB0F  6B        .db $6B
  $AB10  6B        .db $6B
  $AB11  60        RTS
  $AB12  6B        .db $6B
  $AB13  6B        .db $6B
  $AB14  69 6B     ADC #$6B
  $AB16  6B        .db $6B
  $AB17  80        .db $80
  $AB18  8B        .db $8B
  $AB19  8E 92 04  STX $0492
  $AB1C  03        .db $03
  $AB1D  0F        .db $0F
  $AB1E  AB        .db $AB
  $AB1F  6C 6C 60  JMP ($606C)
  $AB22  6C 6C 6A  JMP ($6A6C)
  $AB25  6C 6C 80  JMP ($806C)
  $AB28  8C 8F 93  STY $938F
  $AB2B  04        .db $04
  $AB2C  03        .db $03
  $AB2D  1F        .db $1F
  $AB2E  AB        .db $AB
  $AB2F  6D 6D 60  ADC $606D
  $AB32  6D 6D 6B  ADC $6B6D
  $AB35  6D 6D 80  ADC $806D
  $AB38  8D 90 94  STA $9490
  $AB3B  04        .db $04
  $AB3C  03        .db $03
  $AB3D  2F        .db $2F
  $AB3E  AB        .db $AB
  $AB3F  6E 6E 60  ROR $606E
  $AB42  6E 6E 6C  ROR $6C6E
  $AB45  6E 6E 80  ROR $806E
  $AB48  8E 91 95  STX $9591
  $AB4B  04        .db $04
  $AB4C  03        .db $03
  $AB4D  3F        .db $3F
  $AB4E  AB        .db $AB
  $AB4F  6F        .db $6F
  $AB50  6F        .db $6F
  $AB51  60        RTS
  $AB52  6F        .db $6F
  $AB53  6F        .db $6F
  $AB54  6D 6F 6F  ADC $6F6F

L_AB57:
  $AB57  80        .db $80
  $AB58  8F        .db $8F
  $AB59  92        .db $92
  $AB5A  96 04     STX $04,Y
  $AB5C  03        .db $03
  $AB5D  4F        .db $4F
  $AB5E  AB        .db $AB
  $AB5F  70 70     BVS $ABD1
  $AB61  60        RTS
  $AB62  70 70     BVS $ABD4
  $AB64  6E 70 70  ROR $7070
  $AB67  80        .db $80
  $AB68  90 93     BCC $AAFD
  $AB6A  97        .db $97
  $AB6B  04        .db $04
  $AB6C  02        .db $02

L_AB6D:
  $AB6D  5F        .db $5F
  $AB6E  AB        .db $AB
  $AB6F  70 70     BVS $ABE1
  $AB71  60        RTS
  $AB72  70 70     BVS $ABE4
  $AB74  6E 70 70  ROR $7070
  $AB77  01 10     ORA ($10,X)
  $AB79  60        RTS
  $AB7A  7D 7D 7C  ADC $7C7D,X
  $AB7D  7C        .db $7C
  $AB7E  7A        .db $7A
  $AB7F  7A        .db $7A
  $AB80  7A        .db $7A
  $AB81  01 00     ORA ($00,X)
  $AB83  04        .db $04
  $AB84  00        BRK
  $AB85  AF        .db $AF
  $AB86  AA        TAX
  $AB87  00        BRK
  $AB88  06 03     ASL $03
  $AB8A  3F        .db $3F
  $AB8B  07        .db $07
  $AB8C  83        .db $83

L_AB8D:
  $AB8D  A0 62     LDY #$62
  $AB8F  62        .db $62
  $AB90  07        .db $07
  $AB91  82        .db $82
  $AB92  20 82 04  JSR $0482
  $AB95  00        BRK
  $AB96  8B        .db $8B
  $AB97  AB        .db $AB
  $AB98  00        BRK
  $AB99  00        BRK
  $AB9A  80        .db $80
  $AB9B  00        BRK
  $AB9C  02        .db $02
  $AB9D  62        .db $62
  $AB9E  80        .db $80
  $AB9F  00        BRK
  $ABA0  0F        .db $0F
  $ABA1  AB        .db $AB
  $ABA2  AB        .db $AB
  $ABA3  ED AB 20  SBC $20AB
  $ABA6  AC 00 00  LDY $0000
  $ABA9  50 AC     BVC $AB57
  $ABAB  00        BRK
  $ABAC  06 02     ASL $02
  $ABAE  00        BRK
  $ABAF  03        .db $03
  $ABB0  3A        .db $3A
  $ABB1  07        .db $07
  $ABB2  02        .db $02
  $ABB3  A0 05     LDY #$05
  $ABB5  23        .db $23
  $ABB6  6D 6D 6D  ADC $6D6D
  $ABB9  60        RTS
  $ABBA  6D 8B 21  ADC $218B
  $ABBD  6D CD 6F  ADC $6FCD
  $ABC0  6F        .db $6F
  $ABC1  6F        .db $6F
  $ABC2  60        RTS
  $ABC3  6F        .db $6F
  $ABC4  8D 21 6F  STA $6F21
  $ABC7  CF        .db $CF
  $ABC8  70 70     BVS $AC3A
  $ABCA  60        RTS
  $ABCB  70 A0     BVS $AB6D
  $ABCD  73        .db $73
  $ABCE  73        .db $73
  $ABCF  60        RTS
  $ABD0  73        .db $73

L_ABD1:
  $ABD1  A0 60     LDY #$60
  $ABD3  74        .db $74

L_ABD4:
  $ABD4  60        RTS
  $ABD5  21 72     AND ($72,X)
  $ABD7  72        .db $72
  $ABD8  70 72     BVS $AC4C
  $ABDA  73        .db $73
  $ABDB  07        .db $07
  $ABDC  82        .db $82
  $ABDD  80        .db $80
  $ABDE  54        .db $54
  $ABDF  55 54     EOR $54,X

L_ABE1:
  $ABE1  55 54     EOR $54,X
  $ABE3  55 21     EOR $21,X
  $ABE5  54        .db $54
  $ABE6  08        PHP
  $ABE7  01 07     ORA ($07,X)
  $ABE9  02        .db $02
  $ABEA  A0 B4     LDY #$B4
  $ABEC  09 00     ORA #$00
  $ABEE  06 02     ASL $02
  $ABF0  40        RTI
  $ABF1  03        .db $03
  $ABF2  3A        .db $3A
  $ABF3  05 17     ORA $17
  $ABF5  07        .db $07
  $ABF6  02        .db $02
  $ABF7  A0 70     LDY #$70
  $ABF9  70 70     BVS $AC6B
  $ABFB  60        RTS
  $ABFC  70 8F     BVS $AB8D
  $ABFE  21 70     AND ($70,X)
  $AC00  D0 72     BNE $AC74
  $AC02  72        .db $72
  $AC03  72        .db $72
  $AC04  60        RTS
  $AC05  72        .db $72
  $AC06  90 21     BCC $AC29
  $AC08  72        .db $72
  $AC09  D2        .db $D2
  $AC0A  74        .db $74
  $AC0B  74        .db $74
  $AC0C  60        RTS
  $AC0D  74        .db $74
  $AC0E  A0 76     LDY #$76
  $AC10  76 60     ROR $60,X
  $AC12  76 A0     ROR $A0,X
  $AC14  60        RTS
  $AC15  78        SEI
  $AC16  60        RTS
  $AC17  75 75     ADC $75,X
  $AC19  74        .db $74
  $AC1A  75 75     ADC $75,X
  $AC1C  08        PHP
  $AC1D  01 DB     ORA ($DB,X)
  $AC1F  09 00     ORA #$00
  $AC21  06 03     ASL $03
  $AC23  81 05     STA ($05,X)
  $AC25  23        .db $23
  $AC26  CD 60 6D  CMP $6D60

L_AC29:
  $AC29  6D 6D 6D  ADC $6D6D
  $AC2C  06 8C     ASL $8C
  $AC2E  CB        .db $CB
  $AC2F  60        RTS
  $AC30  6B        .db $6B
  $AC31  6B        .db $6B
  $AC32  6B        .db $6B
  $AC33  6B        .db $6B
  $AC34  06 8A     ASL $8A
  $AC36  69 69     ADC #$69
  $AC38  60        RTS
  $AC39  69 01     ADC #$01
  $AC3B  10 60     BPL $AC9D
  $AC3D  7D 9D 01  ADC $019D,X
  $AC40  00        BRK
  $AC41  6F        .db $6F
  $AC42  6F        .db $6F
  $AC43  60        RTS
  $AC44  6F        .db $6F
  $AC45  01 10     ORA ($10,X)
  $AC47  60        RTS
  $AC48  7D 9D 01  ADC $019D,X
  $AC4B  00        BRK

L_AC4C:
  $AC4C  08        PHP
  $AC4D  01 E8     ORA ($E8,X)
  $AC4F  09 00     ORA #$00
  $AC51  00        BRK
  $AC52  80        .db $80
  $AC53  00        BRK
  $AC54  01 62     ORA ($62,X)
  $AC56  80        .db $80
  $AC57  00        BRK
  $AC58  0F        .db $0F
  $AC59  63        .db $63
  $AC5A  AC FA AC  LDY $ACFA
  $AC5D  81 AD     STA ($AD,X)
  $AC5F  C7        .db $C7
  $AC60  AD 0C AE  LDA $AE0C
  $AC63  00        BRK
  $AC64  06 03     ASL $03
  $AC66  3C        .db $3C
  $AC67  02        .db $02
  $AC68  C0 05     CPY #$05
  $AC6A  13        .db $13

L_AC6B:
  $AC6B  07        .db $07
  $AC6C  E0 10     CPX #$10
  $AC6E  08        PHP
  $AC6F  01 E8     ORA ($E8,X)
  $AC71  EB        .db $EB
  $AC72  EE D1 6E  INC $6ED1
  $AC75  71 74     ADC ($74),Y
  $AC77  71 74     ADC ($74),Y
  $AC79  71 74     ADC ($74),Y
  $AC7B  77        .db $77
  $AC7C  08        PHP
  $AC7D  00        BRK
  $AC7E  07        .db $07
  $AC7F  86 20     STX $20
  $AC81  05 1F     ORA $1F
  $AC83  02        .db $02
  $AC84  C0 71     CPY #$71
  $AC86  71 60     ADC ($60),Y
  $AC88  71 60     ADC ($60),Y
  $AC8A  71 71     ADC ($71),Y
  $AC8C  80        .db $80
  $AC8D  71 71     ADC ($71),Y
  $AC8F  60        RTS
  $AC90  71 60     ADC ($60),Y
  $AC92  71 71     ADC ($71),Y
  $AC94  07        .db $07
  $AC95  83        .db $83
  $AC96  20 91 60  JSR $6091
  $AC99  71 A0     ADC ($A0),Y
  $AC9B  98        TYA
  $AC9C  60        RTS

L_AC9D:
  $AC9D  78        SEI
  $AC9E  96 98     STX $98,Y
  $ACA0  07        .db $07
  $ACA1  86 20     STX $20
  $ACA3  6F        .db $6F
  $ACA4  6F        .db $6F
  $ACA5  60        RTS

L_ACA6:
  $ACA6  6F        .db $6F
  $ACA7  60        RTS
  $ACA8  6F        .db $6F
  $ACA9  6F        .db $6F
  $ACAA  80        .db $80
  $ACAB  6F        .db $6F
  $ACAC  6F        .db $6F
  $ACAD  60        RTS
  $ACAE  6F        .db $6F
  $ACAF  60        RTS
  $ACB0  6F        .db $6F
  $ACB1  6F        .db $6F
  $ACB2  07        .db $07
  $ACB3  83        .db $83
  $ACB4  20 8F 60  JSR $608F
  $ACB7  6F        .db $6F
  $ACB8  A0 98     LDY #$98
  $ACBA  60        RTS
  $ACBB  78        SEI
  $ACBC  96 98     STX $98,Y
  $ACBE  07        .db $07
  $ACBF  86 20     STX $20
  $ACC1  6E 6E 60  ROR $606E
  $ACC4  6E 60 6E  ROR $6E60
  $ACC7  6E 80 6E  ROR $6E80
  $ACCA  6E 60 6E  ROR $6E60
  $ACCD  60        RTS
  $ACCE  6E 6E 07  ROR $076E
  $ACD1  83        .db $83
  $ACD2  20 8E 60  JSR $608E
  $ACD5  6E A0 98  ROR $98A0
  $ACD8  60        RTS
  $ACD9  78        SEI
  $ACDA  96 98     STX $98,Y
  $ACDC  07        .db $07
  $ACDD  86 20     STX $20
  $ACDF  6A        ROR
  $ACE0  6A        ROR
  $ACE1  60        RTS
  $ACE2  6A        ROR
  $ACE3  60        RTS
  $ACE4  6A        ROR
  $ACE5  6A        ROR
  $ACE6  80        .db $80
  $ACE7  6A        ROR
  $ACE8  6A        ROR
  $ACE9  60        RTS
  $ACEA  6A        ROR
  $ACEB  60        RTS
  $ACEC  6A        ROR
  $ACED  6A        ROR
  $ACEE  08        PHP
  $ACEF  01 AC     ORA ($AC,X)
  $ACF1  B0 B3     BCS $ACA6
  $ACF3  B8        CLV
  $ACF4  08        PHP
  $ACF5  00        BRK
  $ACF6  04        .db $04
  $ACF7  00        BRK
  $ACF8  7E AC 00  ROR $00AC,X
  $ACFB  06 03     ASL $03
  $ACFD  3B        .db $3B
  $ACFE  02        .db $02
  $ACFF  00        BRK
  $AD00  07        .db $07
  $AD01  8A        TXA
  $AD02  10 05     BPL $AD09
  $AD04  1F        .db $1F
  $AD05  A5 60     LDA $60
  $AD07  6E 6B 68  ROR $686B
  $AD0A  C5 A8     CMP $A8
  $AD0C  60        RTS
  $AD0D  71 6E     ADC ($6E),Y
  $AD0F  6B        .db $6B
  $AD10  C8        INY
  $AD11  AB        .db $AB
  $AD12  60        RTS
  $AD13  74        .db $74
  $AD14  71 6E     ADC ($6E),Y
  $AD16  CB        .db $CB
  $AD17  AE 60 77  LDX $7760
  $AD1A  74        .db $74
  $AD1B  6E D1 05  ROR $05D1
  $AD1E  1F        .db $1F
  $AD1F  02        .db $02
  $AD20  C0 07     CPY #$07
  $AD22  86 20     STX $20
  $AD24  6C 6C 60  JMP ($606C)
  $AD27  6C 60 6C  JMP ($6C60)
  $AD2A  6C 80 6C  JMP ($6C80)
  $AD2D  6C 60 6C  JMP ($6C60)
  $AD30  60        RTS
  $AD31  6C 6C 07  JMP ($076C)
  $AD34  83        .db $83
  $AD35  20 8C 60  JSR $608C
  $AD38  6C A0 94  JMP ($94A0)
  $AD3B  60        RTS
  $AD3C  74        .db $74
  $AD3D  93        .db $93
  $AD3E  94 04     STY $04,X
  $AD40  01 1D     ORA ($1D,X)
  $AD42  AD 02 C0  LDA $C002
  $AD45  07        .db $07
  $AD46  86 20     STX $20
  $AD48  6A        ROR
  $AD49  6A        ROR
  $AD4A  60        RTS
  $AD4B  6A        ROR
  $AD4C  60        RTS
  $AD4D  6A        ROR
  $AD4E  6A        ROR
  $AD4F  80        .db $80
  $AD50  6A        ROR
  $AD51  6A        ROR
  $AD52  60        RTS
  $AD53  6A        ROR
  $AD54  60        RTS
  $AD55  6A        ROR
  $AD56  6A        ROR
  $AD57  07        .db $07
  $AD58  83        .db $83
  $AD59  20 8A 60  JSR $608A
  $AD5C  6A        ROR
  $AD5D  A0 94     LDY #$94
  $AD5F  60        RTS
  $AD60  74        .db $74
  $AD61  93        .db $93
  $AD62  94 07     STY $07,X
  $AD64  86 20     STX $20
  $AD66  67        .db $67
  $AD67  67        .db $67
  $AD68  60        RTS
  $AD69  67        .db $67
  $AD6A  60        RTS
  $AD6B  67        .db $67
  $AD6C  67        .db $67
  $AD6D  80        .db $80
  $AD6E  67        .db $67
  $AD6F  67        .db $67
  $AD70  60        RTS
  $AD71  67        .db $67
  $AD72  60        RTS
  $AD73  67        .db $67

L_AD74:
  $AD74  67        .db $67
  $AD75  08        PHP
  $AD76  01 A7     ORA ($A7,X)
  $AD78  AC B0 B3  LDY $B3B0
  $AD7B  08        PHP
  $AD7C  00        BRK
  $AD7D  04        .db $04
  $AD7E  00        BRK
  $AD7F  1D AD 00  ORA $00AD,X
  $AD82  06 03     ASL $03
  $AD84  30 05     BMI $AD8B
  $AD86  1F        .db $1F
  $AD87  71 71     ADC ($71),Y
  $AD89  71 6F     ADC ($6F),Y

L_AD8B:
  $AD8B  04        .db $04
  $AD8C  0D 87 AD  ORA $AD87
  $AD8F  03        .db $03
  $AD90  20 01 15  JSR $1501
  $AD93  6C 6C 6A  JMP ($6A6C)
  $AD96  6A        ROR
  $AD97  68        PLA
  $AD98  68        PLA
  $AD99  66 66     ROR $66
  $AD9B  03        .db $03
  $AD9C  50 01     BVC $AD9F
  $AD9E  00        BRK

L_AD9F:
  $AD9F  03        .db $03
  $ADA0  40        RTI
  $ADA1  71 71     ADC ($71),Y
  $ADA3  60        RTS
  $ADA4  71 94     ADC ($94),Y
  $ADA6  76 71     ROR $71,X
  $ADA8  60        RTS
  $ADA9  6F        .db $6F
  $ADAA  71 70     ADC ($70),Y
  $ADAC  8A        TXA
  $ADAD  6B        .db $6B
  $ADAE  6C 04 06  JMP ($0604)
  $ADB1  9F        .db $9F
  $ADB2  AD 6C 6C  LDA $6C6C
  $ADB5  78        SEI
  $ADB6  60        RTS
  $ADB7  76 78     ROR $78,X
  $ADB9  60        RTS
  $ADBA  6C 60 6C  JMP ($6C60)
  $ADBD  78        SEI
  $ADBE  60        RTS
  $ADBF  76 78     ROR $78,X
  $ADC1  74        .db $74
  $ADC2  73        .db $73
  $ADC3  04        .db $04
  $ADC4  00        BRK
  $ADC5  9F        .db $9F
  $ADC6  AD 00 06  LDA $0600
  $ADC9  07        .db $07
  $ADCA  88        DEY
  $ADCB  10 03     BPL $ADD0
  $ADCD  3F        .db $3F
  $ADCE  07        .db $07
  $ADCF  82        .db $82

L_ADD0:
  $ADD0  F0 A2     BEQ $AD74
  $ADD2  A2 A2     LDX #$A2
  $ADD4  07        .db $07
  $ADD5  84 10     STY $10
  $ADD7  A7        .db $A7
  $ADD8  04        .db $04
  $ADD9  01 CE     ORA ($CE,X)
  $ADDB  AD 07 82  LDA $8207
  $ADDE  A0 83     LDY #$83
  $ADE0  83        .db $83
  $ADE1  07        .db $07
  $ADE2  84 40     STY $40
  $ADE4  87        .db $87
  $ADE5  07        .db $07
  $ADE6  82        .db $82
  $ADE7  A0 83     LDY #$83
  $ADE9  04        .db $04
  $ADEA  02        .db $02
  $ADEB  DC        .db $DC
  $ADEC  AD 07 84  LDA $8407
  $ADEF  40        RTI
  $ADF0  66 66     ROR $66
  $ADF2  66 66     ROR $66
  $ADF4  67        .db $67
  $ADF5  67        .db $67
  $ADF6  67        .db $67
  $ADF7  67        .db $67
  $ADF8  07        .db $07
  $ADF9  83        .db $83
  $ADFA  D0 62     BNE $AE5E
  $ADFC  62        .db $62
  $ADFD  60        RTS
  $ADFE  62        .db $62
  $ADFF  07        .db $07
  $AE00  84 40     STY $40
  $AE02  87        .db $87
  $AE03  07        .db $07
  $AE04  82        .db $82
  $AE05  A0 62     LDY #$62
  $AE07  62        .db $62
  $AE08  04        .db $04
  $AE09  00        BRK
  $AE0A  F8        SED
  $AE0B  AD 00 00  LDA $0000
  $AE0E  80        .db $80
  $AE0F  00        BRK
  $AE10  01 62     ORA ($62,X)
  $AE12  80        .db $80
  $AE13  00        BRK
  $AE14  0F        .db $0F
  $AE15  1F        .db $1F
  $AE16  AE 68 AE  LDX $AE68
  $AE19  9C        .db $9C
  $AE1A  AE D7 AE  LDX $AED7
  $AE1D  F4        .db $F4
  $AE1E  AE 00 05  LDX $0500
  $AE21  03        .db $03
  $AE22  39 05 11  AND $1105,Y
  $AE25  07        .db $07
  $AE26  83        .db $83
  $AE27  50 02     BVC $AE2B
  $AE29  80        .db $80
  $AE2A  05 11     ORA $11
  $AE2C  01 15     ORA ($15,X)
  $AE2E  9D 9A 80  STA $809A,X
  $AE31  97        .db $97
  $AE32  80        .db $80
  $AE33  74        .db $74
  $AE34  74        .db $74
  $AE35  94 91     STY $91,X
  $AE37  05 1D     ORA $1D
  $AE39  01 00     ORA ($00,X)
  $AE3B  03        .db $03
  $AE3C  3B        .db $3B
  $AE3D  07        .db $07
  $AE3E  86 10     STX $10
  $AE40  02        .db $02
  $AE41  00        BRK
  $AE42  85 88     STA $88
  $AE44  8C 85 88  STY $8885
  $AE47  8F        .db $8F
  $AE48  85 88     STA $88

L_AE4A:
  $AE4A  8E 85 88  STX $8885
  $AE4D  8D 85 88  STA $8885
  $AE50  8B        .db $8B
  $AE51  8C 02 40  STY $4002
  $AE54  85 88     STA $88
  $AE56  8C 85 88  STY $8885
  $AE59  8F        .db $8F
  $AE5A  85 88     STA $88
  $AE5C  8E 85 88  STX $8885
  $AE5F  8D 85 88  STA $8885
  $AE62  8B        .db $8B
  $AE63  8C 04 00  STY $0004
  $AE66  3B        .db $3B
  $AE67  AE 00 05  LDX $0500
  $AE6A  05 1D     ORA $1D
  $AE6C  E0 07     CPX #$07
  $AE6E  86 10     STX $10
  $AE70  03        .db $03
  $AE71  37        .db $37
  $AE72  02        .db $02
  $AE73  00        BRK
  $AE74  80        .db $80
  $AE75  85 88     STA $88
  $AE77  8C 85 88  STY $8885
  $AE7A  8F        .db $8F
  $AE7B  85 88     STA $88
  $AE7D  8E 85 88  STX $8885
  $AE80  8D 85 88  STA $8885
  $AE83  8B        .db $8B
  $AE84  02        .db $02
  $AE85  40        RTI
  $AE86  03        .db $03
  $AE87  39 88 8C  AND $8C88,Y
  $AE8A  91 88     STA ($88),Y
  $AE8C  8C 93 88  STY $8893
  $AE8F  8C 92 88  STY $8892
  $AE92  8C 91 88  STY $8891
  $AE95  8C 8E 8F  STY $8F8E

L_AE98:
  $AE98  04        .db $04
  $AE99  00        BRK
  $AE9A  70 AE     BVS $AE4A
  $AE9C  00        BRK
  $AE9D  05 03     ORA $03
  $AE9F  30 05     BMI $AEA6
  $AEA1  1D 01 0F  ORA $0F01,X
  $AEA4  9D 9A 80  STA $809A,X
  $AEA7  97        .db $97
  $AEA8  80        .db $80
  $AEA9  74        .db $74
  $AEAA  74        .db $74
  $AEAB  94 90     STY $90,X
  $AEAD  03        .db $03
  $AEAE  31 85     AND ($85),Y
  $AEB0  83        .db $83
  $AEB1  01 10     ORA ($10,X)
  $AEB3  9A        TXS
  $AEB4  01 00     ORA ($00,X)
  $AEB6  85 80     STA $80
  $AEB8  88        DEY
  $AEB9  01 10     ORA ($10,X)
  $AEBB  9A        TXS
  $AEBC  05 11     ORA $11
  $AEBE  01 00     ORA ($00,X)
  $AEC0  91 8C     STA ($8C),Y
  $AEC2  98        TYA
  $AEC3  05 1D     ORA $1D
  $AEC5  01 10     ORA ($10,X)
  $AEC7  9A        TXS
  $AEC8  01 00     ORA ($00,X)
  $AECA  8B        .db $8B
  $AECB  8A        TXA
  $AECC  88        DEY
  $AECD  01 10     ORA ($10,X)
  $AECF  9A        TXS
  $AED0  01 00     ORA ($00,X)
  $AED2  83        .db $83
  $AED3  04        .db $04
  $AED4  00        BRK
  $AED5  AD AE 00  LDA $00AE
  $AED8  05 07     ORA $07
  $AEDA  83        .db $83
  $AEDB  40        RTI
  $AEDC  03        .db $03
  $AEDD  3F        .db $3F
  $AEDE  C0 A0     CPY #$A0
  $AEE0  87        .db $87
  $AEE1  87        .db $87
  $AEE2  07        .db $07
  $AEE3  82        .db $82
  $AEE4  F0 82     BEQ $AE68
  $AEE6  82        .db $82
  $AEE7  82        .db $82
  $AEE8  82        .db $82
  $AEE9  82        .db $82
  $AEEA  82        .db $82
  $AEEB  82        .db $82
  $AEEC  07        .db $07
  $AEED  84 90     STY $90
  $AEEF  82        .db $82
  $AEF0  04        .db $04
  $AEF1  00        BRK
  $AEF2  E2        .db $E2
  $AEF3  AE 0F FF  LDX $FF0F
  $AEF6  AE F9 AF  LDX $AFF9
  $AEF9  EC B0 80  CPX $80B0
  $AEFC  B1 AC     LDA ($AC),Y
  $AEFE  B1 00     LDA ($00),Y
  $AF00  05 03     ORA $03
  $AF02  3C        .db $3C
  $AF03  02        .db $02
  $AF04  00        BRK
  $AF05  05 23     ORA $23
  $AF07  07        .db $07
  $AF08  9A        TXS
  $AF09  10 8D     BPL $AE98
  $AF0B  6D 6D 8D  ADC $8D6D
  $AF0E  6D 6D 8D  ADC $8D6D
  $AF11  8F        .db $8F
  $AF12  80        .db $80
  $AF13  21 CB     AND ($CB,X)
  $AF15  08        PHP
  $AF16  01 CB     ORA ($CB,X)
  $AF18  08        PHP
  $AF19  00        BRK
  $AF1A  8B        .db $8B
  $AF1B  89        .db $89

L_AF1C:
  $AF1C  69 69     ADC #$69
  $AF1E  89        .db $89
  $AF1F  86 80     STX $80

L_AF21:
  $AF21  86 80     STX $80
  $AF23  C8        INY
  $AF24  88        DEY

L_AF25:
  $AF25  89        .db $89
  $AF26  8B        .db $8B
  $AF27  A0 8D     LDY #$8D
  $AF29  6D 6D 8D  ADC $8D6D

L_AF2C:
  $AF2C  6D 6D 8D  ADC $8D6D
  $AF2F  8F        .db $8F

L_AF30:
  $AF30  80        .db $80
  $AF31  21 CB     AND ($CB,X)
  $AF33  08        PHP
  $AF34  01 CB     ORA ($CB,X)

L_AF36:
  $AF36  08        PHP
  $AF37  00        BRK
  $AF38  8B        .db $8B
  $AF39  A9 89     LDA #$89

L_AF3B:
  $AF3B  8B        .db $8B
  $AF3C  80        .db $80
  $AF3D  8B        .db $8B
  $AF3E  80        .db $80

L_AF3F:
  $AF3F  21 8D     AND ($8D,X)
  $AF41  08        PHP
  $AF42  01 CD     ORA ($CD,X)
  $AF44  08        PHP
  $AF45  00        BRK

L_AF46:
  $AF46  02        .db $02
  $AF47  80        .db $80
  $AF48  07        .db $07
  $AF49  83        .db $83
  $AF4A  70 05     BVS $AF51
  $AF4C  2F        .db $2F
  $AF4D  74        .db $74
  $AF4E  72        .db $72
  $AF4F  70 72     BVS $AFC3

L_AF51:
  $AF51  70 6F     BVS $AFC2
  $AF53  6E 6D 04  ROR $046D
  $AF56  01 01     ORA ($01,X)
  $AF58  AF        .db $AF
  $AF59  07        .db $07
  $AF5A  84 10     STY $10
  $AF5C  05 23     ORA $23
  $AF5E  02        .db $02
  $AF5F  C0 8D     CPY #$8D
  $AF61  8D 88 85  STA $8588
  $AF64  91 8D     STA ($8D),Y
  $AF66  88        DEY
  $AF67  B4 92     LDY $92,X
  $AF69  91 8F     STA ($8F),Y
  $AF6B  91 AD     STA ($AD),Y
  $AF6D  80        .db $80
  $AF6E  8B        .db $8B
  $AF6F  8B        .db $8B
  $AF70  8A        TXA
  $AF71  86 AF     STX $AF
  $AF73  8B        .db $8B
  $AF74  88        DEY
  $AF75  6B        .db $6B
  $AF76  6B        .db $6B
  $AF77  66 6F     ROR $6F
  $AF79  6B        .db $6B
  $AF7A  72        .db $72
  $AF7B  6F        .db $6F
  $AF7C  77        .db $77
  $AF7D  92        .db $92
  $AF7E  AB        .db $AB
  $AF7F  80        .db $80
  $AF80  8A        TXA
  $AF81  6A        ROR
  $AF82  6D 6A 65  ADC $656A
  $AF85  81 04     STA ($04,X)
  $AF87  01 81     ORA ($81,X)
  $AF89  AF        .db $AF
  $AF8A  6A        ROR
  $AF8B  6D 75 76  ADC $7675
  $AF8E  75 76     ADC $76,X
  $AF90  75 76     ADC $76,X
  $AF92  71 6D     ADC ($6D),Y
  $AF94  80        .db $80
  $AF95  02        .db $02
  $AF96  C0 AA     CPY #$AA
  $AF98  80        .db $80
  $AF99  30 81     BMI $AF1C
  $AF9B  30 84     BMI $AF21
  $AF9D  30 89     BMI $AF28
  $AF9F  30 84     BMI $AF25
  $AFA1  30 89     BMI $AF2C
  $AFA3  30 8D     BMI $AF32
  $AFA5  30 89     BMI $AF30
  $AFA7  30 8D     BMI $AF36
  $AFA9  30 90     BMI $AF3B
  $AFAB  30 8D     BMI $AF3A
  $AFAD  30 90     BMI $AF3F
  $AFAF  30 95     BMI $AF46
  $AFB1  89        .db $89
  $AFB2  89        .db $89
  $AFB3  89        .db $89
  $AFB4  89        .db $89
  $AFB5  80        .db $80
  $AFB6  AB        .db $AB
  $AFB7  80        .db $80
  $AFB8  07        .db $07
  $AFB9  9A        TXS
  $AFBA  10 02     BPL $AFBE
  $AFBC  00        BRK
  $AFBD  8D 6D 6D  STA $6D6D
  $AFC0  8D 6D 6D  STA $6D6D

L_AFC3:
  $AFC3  8D 8F 80  STA $808F
  $AFC6  21 CB     AND ($CB,X)
  $AFC8  08        PHP
  $AFC9  01 CB     ORA ($CB,X)
  $AFCB  08        PHP
  $AFCC  00        BRK
  $AFCD  8B        .db $8B
  $AFCE  89        .db $89
  $AFCF  69 69     ADC #$69
  $AFD1  89        .db $89
  $AFD2  86 80     STX $80
  $AFD4  86 80     STX $80
  $AFD6  C8        INY
  $AFD7  88        DEY
  $AFD8  89        .db $89
  $AFD9  8B        .db $8B
  $AFDA  A0 8D     LDY #$8D
  $AFDC  6D 6D 8D  ADC $8D6D
  $AFDF  6D 6D 8D  ADC $8D6D
  $AFE2  8F        .db $8F
  $AFE3  80        .db $80
  $AFE4  21 CB     AND ($CB,X)
  $AFE6  CB        .db $CB
  $AFE7  80        .db $80
  $AFE8  88        DEY
  $AFE9  88        DEY
  $AFEA  8A        TXA
  $AFEB  8D 80 88  STA $8880
  $AFEE  8A        TXA
  $AFEF  8D 80 88  STA $8880
  $AFF2  8A        TXA
  $AFF3  8D 80 94  STA $9480
  $AFF6  96 99     STX $99,Y
  $AFF8  09 00     ORA #$00
  $AFFA  05 03     ORA $03
  $AFFC  3C        .db $3C
  $AFFD  02        .db $02
  $AFFE  00        BRK
  $AFFF  05 23     ORA $23
  $B001  07        .db $07
  $B002  9A        TXS
  $B003  10 88     BPL $AF8D
  $B005  68        PLA
  $B006  68        PLA
  $B007  88        DEY
  $B008  68        PLA
  $B009  68        PLA
  $B00A  88        DEY
  $B00B  88        DEY
  $B00C  80        .db $80
  $B00D  E6 88     INC $88
  $B00F  84 64     STY $64
  $B011  64        .db $64
  $B012  84 83     STY $83
  $B014  80        .db $80
  $B015  83        .db $83
  $B016  80        .db $80
  $B017  C5 85     CMP $85
  $B019  84 86     STY $86
  $B01B  A0 88     LDY #$88
  $B01D  68        PLA
  $B01E  68        PLA
  $B01F  88        DEY
  $B020  68        PLA

L_B021:
  $B021  68        PLA
  $B022  88        DEY
  $B023  88        DEY
  $B024  80        .db $80

L_B025:
  $B025  E6 88     INC $88

L_B027:
  $B027  A4 84     LDY $84
  $B029  86 80     STX $80

L_B02B:
  $B02B  86 80     STX $80
  $B02D  21 88     AND ($88,X)

L_B02F:
  $B02F  C8        INY

L_B030:
  $B030  02        .db $02
  $B031  80        .db $80
  $B032  03        .db $03
  $B033  36 05     ROL $05,X
  $B035  2F        .db $2F
  $B036  07        .db $07
  $B037  83        .db $83

L_B038:
  $B038  70 60     BVS $B09A
  $B03A  74        .db $74

L_B03B:
  $B03B  72        .db $72
  $B03C  70 72     BVS $B0B0
  $B03E  70 6F     BVS $B0AF
  $B040  6E 04 01  ROR $0104
  $B043  FB        .db $FB
  $B044  AF        .db $AF

L_B045:
  $B045  07        .db $07
  $B046  84 10     STY $10
  $B048  05 23     ORA $23
  $B04A  03        .db $03
  $B04B  3C        .db $3C
  $B04C  02        .db $02
  $B04D  C0 88     CPY #$88
  $B04F  03        .db $03
  $B050  37        .db $37
  $B051  80        .db $80
  $B052  8D 88 85  STA $8588
  $B055  91 8D     STA ($8D),Y
  $B057  88        DEY
  $B058  B4 92     LDY $92,X
  $B05A  91 8F     STA ($8F),Y
  $B05C  03        .db $03
  $B05D  3C        .db $3C
  $B05E  A8        TAY
  $B05F  80        .db $80
  $B060  86 03     STX $03
  $B062  37        .db $37
  $B063  80        .db $80
  $B064  8B        .db $8B
  $B065  8A        TXA
  $B066  86 AF     STX $AF
  $B068  8B        .db $8B
  $B069  88        DEY
  $B06A  6B        .db $6B
  $B06B  6B        .db $6B
  $B06C  66 6F     ROR $6F
  $B06E  6B        .db $6B
  $B06F  72        .db $72
  $B070  6F        .db $6F
  $B071  77        .db $77
  $B072  03        .db $03
  $B073  3C        .db $3C
  $B074  A6 80     LDX $80
  $B076  85 03     STA $03
  $B078  37        .db $37
  $B079  60        RTS
  $B07A  6A        ROR
  $B07B  6D 6A 65  ADC $656A
  $B07E  81 04     STA ($04,X)
  $B080  01 7A     ORA ($7A,X)
  $B082  B0 6A     BCS $B0EE
  $B084  6D 75 76  ADC $7675
  $B087  75 76     ADC $76,X
  $B089  75 76     ADC $76,X
  $B08B  71 6D     ADC ($6D),Y
  $B08D  60        RTS
  $B08E  03        .db $03
  $B08F  3C        .db $3C
  $B090  02        .db $02
  $B091  C0 A5     CPY #$A5
  $B093  80        .db $80
  $B094  30 84     BMI $B01A
  $B096  30 89     BMI $B021
  $B098  30 8D     BMI $B027

L_B09A:
  $B09A  30 89     BMI $B025
  $B09C  30 8D     BMI $B02B
  $B09E  30 90     BMI $B030
  $B0A0  30 8D     BMI $B02F
  $B0A2  30 90     BMI $B034
  $B0A4  30 95     BMI $B03B
  $B0A6  30 90     BMI $B038
  $B0A8  30 95     BMI $B03F
  $B0AA  30 99     BMI $B045
  $B0AC  84 84     STY $84
  $B0AE  84 84     STY $84

L_B0B0:
  $B0B0  80        .db $80
  $B0B1  A6 80     LDX $80
  $B0B3  07        .db $07
  $B0B4  9A        TXS
  $B0B5  10 02     BPL $B0B9
  $B0B7  00        BRK
  $B0B8  88        DEY

L_B0B9:
  $B0B9  68        PLA
  $B0BA  68        PLA
  $B0BB  88        DEY
  $B0BC  68        PLA
  $B0BD  68        PLA
  $B0BE  88        DEY
  $B0BF  88        DEY
  $B0C0  80        .db $80
  $B0C1  E6 88     INC $88
  $B0C3  84 64     STY $64
  $B0C5  64        .db $64
  $B0C6  84 83     STY $83
  $B0C8  80        .db $80
  $B0C9  83        .db $83
  $B0CA  80        .db $80
  $B0CB  C5 85     CMP $85
  $B0CD  84 86     STY $86
  $B0CF  A0 88     LDY #$88
  $B0D1  68        PLA
  $B0D2  68        PLA
  $B0D3  88        DEY
  $B0D4  68        PLA
  $B0D5  68        PLA
  $B0D6  88        DEY
  $B0D7  88        DEY
  $B0D8  80        .db $80
  $B0D9  E6 80     INC $80
  $B0DB  85 85     STA $85
  $B0DD  86 88     STX $88
  $B0DF  80        .db $80
  $B0E0  85 86     STA $86
  $B0E2  88        DEY
  $B0E3  80        .db $80
  $B0E4  85 86     STA $86
  $B0E6  88        DEY
  $B0E7  80        .db $80
  $B0E8  91 92     STA ($92),Y
  $B0EA  94 09     STY $09,X
  $B0EC  00        BRK
  $B0ED  05 03     ORA $03
  $B0EF  30 05     BMI $B0F6
  $B0F1  23        .db $23
  $B0F2  8D 6D 6D  STA $6D6D
  $B0F5  04        .db $04

L_B0F6:
  $B0F6  1D F2 B0  ORA $B0F2,X
  $B0F9  8D 88 8A  STA $8A88
  $B0FC  8D 8D 6D  STA $6D8D
  $B0FF  6D 04 1D  ADC $1D04
  $B102  FD B0 8D  SBC $8DB0,X
  $B105  88        DEY
  $B106  8A        TXA
  $B107  8D 03 30  STA $3003
  $B10A  A5 01     LDA $01
  $B10C  14        .db $14
  $B10D  9D 80 8D  STA $8D80,X
  $B110  8D 9D 80  STA $809D
  $B113  8D 8D 9D  STA $9D8D
  $B116  8D 80 01  STA $0180
  $B119  00        BRK
  $B11A  85 01     STA $01
  $B11C  14        .db $14
  $B11D  9D 9D 01  STA $019D,X
  $B120  00        BRK
  $B121  A3        .db $A3
  $B122  01 14     ORA ($14,X)
  $B124  9D 80 8D  STA $8D80,X
  $B127  8D 9D 80  STA $809D
  $B12A  8D 8D 9D  STA $9D8D
  $B12D  8D 80 01  STA $0180
  $B130  00        BRK
  $B131  83        .db $83
  $B132  01 14     ORA ($14,X)
  $B134  9D 9D 01  STA $019D,X
  $B137  00        BRK
  $B138  81 80     STA ($80,X)
  $B13A  01 14     ORA ($14,X)
  $B13C  9D 80 8D  STA $8D80,X
  $B13F  8D 9D 80  STA $809D
  $B142  8D 8D 9D  STA $9D8D
  $B145  8D 80 01  STA $0180
  $B148  00        BRK
  $B149  81 01     STA ($01,X)
  $B14B  14        .db $14
  $B14C  9D 9D 01  STA $019D,X
  $B14F  00        BRK
  $B150  81 80     STA ($80,X)
  $B152  01 14     ORA ($14,X)
  $B154  9D 80 87  STA $8780,X
  $B157  87        .db $87
  $B158  BD 7D 7D  LDA $7D7D,X
  $B15B  9D 7B 7B  STA $7B7B,X
  $B15E  9B        .db $9B
  $B15F  79 79 99  ADC $9979,Y
  $B162  7D 7D 7B  ADC $7B7D,X
  $B165  78        SEI
  $B166  01 00     ORA ($00,X)
  $B168  8D 6D 6D  STA $6D6D
  $B16B  04        .db $04
  $B16C  17        .db $17
  $B16D  68        PLA
  $B16E  B1 8D     LDA ($8D),Y
  $B170  8D 8F 91  STA $918F
  $B173  80        .db $80
  $B174  8D 8F 91  STA $918F
  $B177  80        .db $80
  $B178  8D 8F 91  STA $918F
  $B17B  80        .db $80
  $B17C  8D 8F 91  STA $918F
  $B17F  09 00     ORA #$00
  $B181  05 07     ORA $07
  $B183  82        .db $82
  $B184  A0 03     LDY #$03
  $B186  3F        .db $3F
  $B187  82        .db $82
  $B188  62        .db $62
  $B189  62        .db $62
  $B18A  07        .db $07
  $B18B  84 80     STY $80
  $B18D  01 FE     ORA ($FE,X)
  $B18F  8D 01 00  STA $0001
  $B192  07        .db $07
  $B193  82        .db $82
  $B194  A0 62     LDY #$62
  $B196  62        .db $62
  $B197  04        .db $04
  $B198  3B        .db $3B
  $B199  87        .db $87
  $B19A  B1 83     LDA ($83),Y
  $B19C  83        .db $83
  $B19D  83        .db $83
  $B19E  83        .db $83
  $B19F  80        .db $80
  $B1A0  83        .db $83
  $B1A1  83        .db $83
  $B1A2  83        .db $83
  $B1A3  80        .db $80
  $B1A4  83        .db $83
  $B1A5  83        .db $83
  $B1A6  83        .db $83
  $B1A7  80        .db $80
  $B1A8  83        .db $83
  $B1A9  83        .db $83
  $B1AA  83        .db $83
  $B1AB  09 00     ORA #$00
  $B1AD  00        BRK
  $B1AE  80        .db $80
  $B1AF  00        BRK
  $B1B0  02        .db $02
  $B1B1  62        .db $62
  $B1B2  80        .db $80
  $B1B3  00        BRK
  $B1B4  0F        .db $0F

L_B1B5:
  $B1B5  BF        .db $BF
  $B1B6  B1 3D     LDA ($3D),Y
  $B1B8  B2        .db $B2
  $B1B9  B9 B2 1D  LDA $1DB2,Y
  $B1BC  B3        .db $B3
  $B1BD  53        .db $53
  $B1BE  B3        .db $B3
  $B1BF  00        BRK
  $B1C0  08        PHP
  $B1C1  05 20     ORA $20
  $B1C3  02        .db $02
  $B1C4  80        .db $80
  $B1C5  03        .db $03
  $B1C6  3E 07 DF  ROL $DF07,X
  $B1C9  40        RTI
  $B1CA  08        PHP
  $B1CB  00        BRK
  $B1CC  21 AE     AND ($AE,X)
  $B1CE  06 CE     ASL $CE
  $B1D0  21 CF     AND ($CF,X)
  $B1D2  8F        .db $8F
  $B1D3  06 B1     ASL $B1

L_B1D5:
  $B1D5  04        .db $04
  $B1D6  01 C1     ORA ($C1,X)
  $B1D8  B1 AE     LDA ($AE),Y
  $B1DA  B1 B8     LDA ($B8),Y
  $B1DC  95 96     STA $96,X
  $B1DE  A0 80     LDY #$80
  $B1E0  96 95     STX $95,Y
  $B1E2  93        .db $93
  $B1E3  91 93     STA ($93),Y
  $B1E5  80        .db $80
  $B1E6  8E 8C 8A  STX $8A8C
  $B1E9  80        .db $80
  $B1EA  8A        TXA
  $B1EB  89        .db $89
  $B1EC  8A        TXA
  $B1ED  21 B1     AND ($B1,X)
  $B1EF  06 D1     ASL $D1
  $B1F1  06 B3     ASL $B3
  $B1F3  06 B1     ASL $B1
  $B1F5  AF        .db $AF
  $B1F6  06 B5     ASL $B5
  $B1F8  06 B3     ASL $B3
  $B1FA  B1 06     LDA ($06),Y
  $B1FC  B5 06     LDA $06,X
  $B1FE  B3        .db $B3
  $B1FF  B2        .db $B2
  $B200  06 B6     ASL $B6
  $B202  06 B5     ASL $B5
  $B204  B3        .db $B3
  $B205  00        BRK
  $B206  07        .db $07
  $B207  D6 02     DEC $02,X
  $B209  C0 80     CPY #$80
  $B20B  8D 8F 91  STA $918F
  $B20E  21 B2     AND ($B2,X)
  $B210  B2        .db $B2
  $B211  92        .db $92
  $B212  B1 92     LDA ($92),Y

L_B214:
  $B214  22        .db $22
  $B215  AF        .db $AF
  $B216  8F        .db $8F
  $B217  AF        .db $AF
  $B218  8F        .db $8F
  $B219  8C 8F B4  STY $B48F
  $B21C  B2        .db $B2
  $B21D  B1 AF     LDA ($AF),Y
  $B21F  00        BRK

L_B220:
  $B220  06 B0     ASL $B0
  $B222  80        .db $80
  $B223  90 90     BCC $B1B5
  $B225  AF        .db $AF
  $B226  90 AD     BCC $B1D5
  $B228  80        .db $80
  $B229  8D 8D AF  STA $AF8D
  $B22C  90 F2     BCC $B220
  $B22E  05 38     ORA $38
  $B230  01 01     ORA ($01,X)
  $B232  02        .db $02
  $B233  00        BRK
  $B234  03        .db $03
  $B235  3F        .db $3F
  $B236  07        .db $07
  $B237  AF        .db $AF
  $B238  10 21     BPL $B25B
  $B23A  F9 F9 09  SBC $09F9,Y
  $B23D  00        BRK
  $B23E  08        PHP
  $B23F  02        .db $02
  $B240  C0 03     CPY #$03
  $B242  3A        .db $3A
  $B243  07        .db $07
  $B244  8A        TXA
  $B245  30 05     BMI $B24C
  $B247  20 80 91  JSR $9180
  $B24A  96 98     STX $98,Y

L_B24C:
  $B24C  DA        .db $DA
  $B24D  80        .db $80
  $B24E  92        .db $92
  $B24F  96 98     STX $98,Y
  $B251  DB        .db $DB
  $B252  04        .db $04
  $B253  01 48     ORA ($48,X)
  $B255  B2        .db $B2
  $B256  96 91     STX $91,Y
  $B258  96 9A     STX $9A,Y
  $B25A  95 91     STA $91,X
  $B25C  95 98     STA $98,X
  $B25E  93        .db $93
  $B25F  8E 93 96  STX $9693
  $B262  91 8C     STA ($8C),Y
  $B264  91 96     STA ($96),Y
  $B266  90 8C     BCC $B1F4
  $B268  90 93     BCC $B1FD
  $B26A  04        .db $04
  $B26B  01 66     ORA ($66,X)
  $B26D  B2        .db $B2
  $B26E  D1 91     CMP ($91),Y
  $B270  06 B0     ASL $B0
  $B272  8F        .db $8F
  $B273  8A        TXA
  $B274  8F        .db $8F
  $B275  91 D3     STA ($D3),Y
  $B277  91 8C     STA ($8C),Y
  $B279  91 93     STA ($93),Y
  $B27B  D5 92     CMP $92,X
  $B27D  8E 92 93  STX $9392
  $B280  D5 93     CMP $93,X
  $B282  8E 93 95  STX $9593
  $B285  D6 00     DEC $00,X
  $B287  07        .db $07
  $B288  02        .db $02
  $B289  80        .db $80
  $B28A  07        .db $07
  $B28B  83        .db $83
  $B28C  30 86     BMI $B214
  $B28E  8A        TXA
  $B28F  8D 82 04  STA $0482
  $B292  03        .db $03
  $B293  8D B2 88  STA $88B2
  $B296  8C 8F 94  STY $948F
  $B299  04        .db $04
  $B29A  03        .db $03
  $B29B  95 B2     STA $B2,X
  $B29D  00        BRK
  $B29E  06 89     ASL $89
  $B2A0  8D 90 95  STA $9590
  $B2A3  04        .db $04
  $B2A4  03        .db $03
  $B2A5  9F        .db $9F
  $B2A6  B2        .db $B2

L_B2A7:
  $B2A7  E0 05     CPX #$05
  $B2A9  38        SEC
  $B2AA  02        .db $02
  $B2AB  00        BRK
  $B2AC  03        .db $03
  $B2AD  3F        .db $3F
  $B2AE  01 01     ORA ($01,X)
  $B2B0  07        .db $07
  $B2B1  AF        .db $AF
  $B2B2  10 21     BPL $B2D5
  $B2B4  F4        .db $F4
  $B2B5  F4        .db $F4
  $B2B6  01 00     ORA ($00,X)
  $B2B8  09 00     ORA #$00
  $B2BA  08        PHP
  $B2BB  03        .db $03
  $B2BC  81 05     STA ($05,X)
  $B2BE  20 06 AA  JSR $AA06
  $B2C1  8A        TXA
  $B2C2  AA        TAX
  $B2C3  A0 04     LDY #$04
  $B2C5  03        .db $03
  $B2C6  BB        .db $BB
  $B2C7  B2        .db $B2
  $B2C8  CA        DEX
  $B2C9  C9 C7     CMP #$C7
  $B2CB  C5 C4     CMP $C4
  $B2CD  C7        .db $C7
  $B2CE  06 A5     ASL $A5
  $B2D0  85 A5     STA $A5
  $B2D2  A0 06     LDY #$06
  $B2D4  C3        .db $C3

L_B2D5:
  $B2D5  A4 E5     LDY $E5
  $B2D7  06 C2     ASL $C2
  $B2D9  A6 E7     LDX $E7
  $B2DB  03        .db $03
  $B2DC  50 00     BVC $B2DE

L_B2DE:
  $B2DE  07        .db $07
  $B2DF  86 86     STX $86
  $B2E1  80        .db $80
  $B2E2  86 86     STX $86
  $B2E4  81 86     STA ($86,X)
  $B2E6  8A        TXA
  $B2E7  04        .db $04
  $B2E8  01 DF     ORA ($DF,X)
  $B2EA  B2        .db $B2
  $B2EB  88        DEY
  $B2EC  88        DEY
  $B2ED  80        .db $80
  $B2EE  88        DEY
  $B2EF  88        DEY
  $B2F0  83        .db $83
  $B2F1  88        DEY
  $B2F2  8C 04 01  STY $0104
  $B2F5  EB        .db $EB
  $B2F6  B2        .db $B2
  $B2F7  00        BRK
  $B2F8  06 89     ASL $89
  $B2FA  89        .db $89
  $B2FB  80        .db $80
  $B2FC  89        .db $89
  $B2FD  89        .db $89
  $B2FE  84 89     STY $89
  $B300  8D 04 01  STA $0104
  $B303  F9 B2 01  SBC $01B2,Y
  $B306  15 30     ORA $30,X
  $B308  9D 04 02  STA $0204,X
  $B30B  07        .db $07
  $B30C  B3        .db $B3
  $B30D  30 98     BMI $B2A7
  $B30F  04        .db $04
  $B310  08        PHP
  $B311  0D B3 03  ORA $03B3
  $B314  8F        .db $8F
  $B315  05 38     ORA $38
  $B317  01 01     ORA ($01,X)
  $B319  21 F5     AND ($F5,X)
  $B31B  F5 09     SBC $09,X
  $B31D  00        BRK
  $B31E  08        PHP
  $B31F  03        .db $03
  $B320  3C        .db $3C
  $B321  07        .db $07
  $B322  81 10     STA ($10,X)
  $B324  06 C0     ASL $C0
  $B326  85 80     STA $80
  $B328  04        .db $04
  $B329  0B        .db $0B
  $B32A  24 B3     BIT $B3
  $B32C  00        BRK
  $B32D  07        .db $07
  $B32E  07        .db $07
  $B32F  82        .db $82
  $B330  C0 82     CPY #$82
  $B332  82        .db $82
  $B333  82        .db $82
  $B334  82        .db $82
  $B335  82        .db $82
  $B336  82        .db $82
  $B337  07        .db $07
  $B338  83        .db $83
  $B339  40        RTI
  $B33A  A7        .db $A7
  $B33B  04        .db $04
  $B33C  03        .db $03
  $B33D  2E B3 00  ROL $00B3
  $B340  06 07     ASL $07
  $B342  82        .db $82
  $B343  C0 82     CPY #$82
  $B345  82        .db $82
  $B346  82        .db $82
  $B347  82        .db $82
  $B348  82        .db $82
  $B349  82        .db $82
  $B34A  07        .db $07
  $B34B  83        .db $83
  $B34C  40        RTI
  $B34D  A7        .db $A7
  $B34E  04        .db $04
  $B34F  02        .db $02
  $B350  41 B3     EOR ($B3,X)
  $B352  09 02     ORA #$02
  $B354  22        .db $22
  $B355  80        .db $80
  $B356  00        BRK
  $B357  0F        .db $0F
  $B358  62        .db $62
  $B359  B3        .db $B3
  $B35A  80        .db $80
  $B35B  B3        .db $B3
  $B35C  9E        .db $9E
  $B35D  B3        .db $B3
  $B35E  C3        .db $C3
  $B35F  B3        .db $B3
  $B360  D1 B3     CMP ($B3),Y
  $B362  00        BRK
  $B363  06 03     ASL $03
  $B365  3F        .db $3F
  $B366  02        .db $02
  $B367  00        BRK
  $B368  05 27     ORA $27
  $B36A  07        .db $07
  $B36B  AF        .db $AF
  $B36C  10 6C     BPL $B3DA
  $B36E  6C 60 6C  JMP ($6C60)
  $B371  60        RTS
  $B372  6C 60 6C  JMP ($6C60)
  $B375  A0 6D     LDY #$6D
  $B377  6F        .db $6F
  $B378  60        RTS
  $B379  22        .db $22
  $B37A  71 B1     ADC ($B1),Y
  $B37C  08        PHP
  $B37D  00        BRK
  $B37E  D1 09     CMP ($09),Y
  $B380  00        BRK

L_B381:
  $B381  06 02     ASL $02
  $B383  40        RTI
  $B384  05 27     ORA $27
  $B386  03        .db $03
  $B387  3F        .db $3F
  $B388  07        .db $07
  $B389  AF        .db $AF
  $B38A  10 69     BPL $B3F5

L_B38C:
  $B38C  69 60     ADC #$60

L_B38E:
  $B38E  69 60     ADC #$60

L_B390:
  $B390  69 60     ADC #$60
  $B392  69 A0     ADC #$A0

L_B394:
  $B394  6A        ROR
  $B395  6C 60 22  JMP ($2260)

L_B398:
  $B398  6E AE 08  ROR $08AE

L_B39B:
  $B39B  00        BRK
  $B39C  CE 09 00  DEC $0009

L_B39F:
  $B39F  06 03     ASL $03
  $B3A1  30 05     BMI $B3A8

L_B3A3:
  $B3A3  27        .db $27
  $B3A4  65 65     ADC $65
  $B3A6  60        RTS

L_B3A7:
  $B3A7  65 60     ADC $60

L_B3A9:
  $B3A9  65 60     ADC $60

L_B3AB:
  $B3AB  85 01     STA $01
  $B3AD  10 7D     BPL $B42C
  $B3AF  98        TYA
  $B3B0  01 00     ORA ($00,X)

L_B3B2:
  $B3B2  66 88     ROR $88
  $B3B4  03        .db $03
  $B3B5  7F        .db $7F
  $B3B6  21 6A     AND ($6A,X)

L_B3B8:
  $B3B8  21 8A     AND ($8A,X)
  $B3BA  AA        TAX
  $B3BB  03        .db $03
  $B3BC  30 01     BMI $B3BF
  $B3BE  10 7D     BPL $B43D
  $B3C0  7B        .db $7B
  $B3C1  B7        .db $B7
  $B3C2  09 00     ORA #$00

L_B3C4:
  $B3C4  06 07     ASL $07
  $B3C6  83        .db $83
  $B3C7  F0 03     BEQ $B3CC
  $B3C9  3F        .db $3F

L_B3CA:
  $B3CA  80        .db $80
  $B3CB  60        RTS

L_B3CC:
  $B3CC  82        .db $82
  $B3CD  82        .db $82

L_B3CE:
  $B3CE  82        .db $82
  $B3CF  E0 09     CPX #$09
  $B3D1  01 62     ORA ($62,X)
  $B3D3  80        .db $80
  $B3D4  00        BRK
  $B3D5  0F        .db $0F
  $B3D6  E0 B3     CPX #$B3
  $B3D8  23        .db $23
  $B3D9  B4 4F     LDY $4F,X
  $B3DB  B4 81     LDY $81,X
  $B3DD  B4 9E     LDY $9E,X

L_B3DF:
  $B3DF  B4 00     LDY $00,X

L_B3E1:
  $B3E1  06 03     ASL $03
  $B3E3  3E 02 C0  ROL $C002,X
  $B3E6  05 27     ORA $27
  $B3E8  07        .db $07
  $B3E9  01 70     ORA ($70,X)
  $B3EB  B1 B1     LDA ($B1),Y
  $B3ED  30 AF     BMI $B39E

L_B3EF:
  $B3EF  AF        .db $AF
  $B3F0  30 8F     BMI $B381
  $B3F2  30 AF     BMI $B3A3
  $B3F4  30 8F     BMI $B385
  $B3F6  30 A0     BMI $B398
  $B3F8  08        PHP
  $B3F9  01 AD     ORA ($AD,X)
  $B3FB  08        PHP
  $B3FC  00        BRK

L_B3FD:
  $B3FD  30 8D     BMI $B38C

L_B3FF:
  $B3FF  30 8D     BMI $B38E
  $B401  30 8D     BMI $B390
  $B403  30 8F     BMI $B394
  $B405  B1 B1     LDA ($B1),Y

L_B407:
  $B407  30 AF     BMI $B3B8
  $B409  AF        .db $AF
  $B40A  30 8F     BMI $B39B

L_B40C:
  $B40C  30 AF     BMI $B3BD

L_B40E:
  $B40E  30 8F     BMI $B39F

L_B410:
  $B410  30 A0     BMI $B3B2
  $B412  08        PHP
  $B413  01 AE     ORA ($AE,X)

L_B415:
  $B415  08        PHP

L_B416:
  $B416  00        BRK
  $B417  30 8E     BMI $B3A7
  $B419  30 8E     BMI $B3A9
  $B41B  30 8E     BMI $B3AB
  $B41D  30 8F     BMI $B3AE
  $B41F  04        .db $04
  $B420  00        BRK
  $B421  E2        .db $E2
  $B422  B3        .db $B3
  $B423  00        BRK
  $B424  06 02     ASL $02
  $B426  40        RTI
  $B427  05 27     ORA $27
  $B429  07        .db $07
  $B42A  01 80     ORA ($80,X)

L_B42C:
  $B42C  03        .db $03
  $B42D  3A        .db $3A
  $B42E  07        .db $07
  $B42F  01 80     ORA ($80,X)
  $B431  AA        TAX
  $B432  AA        TAX
  $B433  30 A9     BMI $B3DE
  $B435  A9 30     LDA #$30
  $B437  89        .db $89
  $B438  30 A8     BMI $B3E2
  $B43A  30 88     BMI $B3C4
  $B43C  30 A0     BMI $B3DE
  $B43E  08        PHP
  $B43F  01 A5     ORA ($A5,X)
  $B441  08        PHP
  $B442  00        BRK
  $B443  30 85     BMI $B3CA
  $B445  30 85     BMI $B3CC
  $B447  30 85     BMI $B3CE
  $B449  30 8C     BMI $B3D7
  $B44B  04        .db $04
  $B44C  00        BRK
  $B44D  25 B4     AND $B4
  $B44F  00        BRK
  $B450  06 03     ASL $03
  $B452  55 05     EOR $05,X
  $B454  27        .db $27
  $B455  30 A6     BMI $B3FD
  $B457  30 86     BMI $B3DF
  $B459  30 86     BMI $B3E1
  $B45B  30 92     BMI $B3EF
  $B45D  30 86     BMI $B3E5
  $B45F  04        .db $04
  $B460  01 55     ORA ($55,X)
  $B462  B4 30     LDY $30,X
  $B464  A5 30     LDA $30
  $B466  85 30     STA $30
  $B468  85 30     STA $30
  $B46A  91 30     STA ($30),Y
  $B46C  85 30     STA $30
  $B46E  8A        TXA
  $B46F  30 96     BMI $B407
  $B471  30 8A     BMI $B3FD
  $B473  30 8A     BMI $B3FF
  $B475  01 10     ORA ($10,X)
  $B477  30 9D     BMI $B416
  $B479  30 9A     BMI $B415
  $B47B  01 00     ORA ($00,X)
  $B47D  04        .db $04
  $B47E  00        BRK
  $B47F  55 B4     EOR $B4,X
  $B481  00        BRK
  $B482  06 03     ASL $03
  $B484  3F        .db $3F
  $B485  07        .db $07
  $B486  82        .db $82
  $B487  80        .db $80
  $B488  30 82     BMI $B40C

L_B48A:
  $B48A  30 82     BMI $B40E
  $B48C  30 82     BMI $B410
  $B48E  07        .db $07
  $B48F  85 40     STA $40
  $B491  30 87     BMI $B41A
  $B493  07        .db $07
  $B494  82        .db $82
  $B495  80        .db $80
  $B496  30 82     BMI $B41A
  $B498  30 82     BMI $B41C
  $B49A  04        .db $04
  $B49B  00        BRK
  $B49C  88        DEY
  $B49D  B4 00     LDY $00,X
  $B49F  00        BRK

L_B4A0:
  $B4A0  80        .db $80
  $B4A1  00        BRK
  $B4A2  01 62     ORA ($62,X)
  $B4A4  80        .db $80
  $B4A5  00        BRK
  $B4A6  0F        .db $0F
  $B4A7  B1 B4     LDA ($B4),Y
  $B4A9  E0 B4     CPX #$B4
  $B4AB  08        PHP
  $B4AC  B5 2A     LDA $2A,X
  $B4AE  B5 4B     LDA $4B,X
  $B4B0  B5 00     LDA $00,X
  $B4B2  06 03     ASL $03
  $B4B4  3E 02 C0  ROL $C002,X
  $B4B7  05 27     ORA $27
  $B4B9  07        .db $07
  $B4BA  A2 20     LDX #$20
  $B4BC  80        .db $80
  $B4BD  A0 85     LDY #$85
  $B4BF  8B        .db $8B
  $B4C0  8A        TXA
  $B4C1  88        DEY
  $B4C2  85 80     STA $80
  $B4C4  88        DEY
  $B4C5  83        .db $83
  $B4C6  80        .db $80
  $B4C7  84 80     STY $80
  $B4C9  85 80     STA $80
  $B4CB  88        DEY
  $B4CC  87        .db $87
  $B4CD  86 85     STX $85
  $B4CF  8B        .db $8B
  $B4D0  8A        TXA
  $B4D1  88        DEY
  $B4D2  85 88     STA $88
  $B4D4  8B        .db $8B
  $B4D5  21 AE     AND ($AE,X)
  $B4D7  08        PHP
  $B4D8  01 CE     ORA ($CE,X)
  $B4DA  08        PHP
  $B4DB  00        BRK
  $B4DC  8A        TXA
  $B4DD  80        .db $80
  $B4DE  8C 09 00  STY $0009
  $B4E1  06 06     ASL $06
  $B4E3  A0 02     LDY #$02
  $B4E5  80        .db $80
  $B4E6  05 1B     ORA $1B
  $B4E8  07        .db $07
  $B4E9  01 60     ORA ($60,X)
  $B4EB  03        .db $03
  $B4EC  37        .db $37
  $B4ED  01 FF     ORA ($FF,X)
  $B4EF  B1 AE     LDA ($AE),Y
  $B4F1  B0 AD     BCS $B4A0
  $B4F3  AF        .db $AF
  $B4F4  AC AE AB  LDY $ABAE
  $B4F7  B1 AE     LDA ($AE),Y
  $B4F9  B0 AD     BCS $B4A8
  $B4FB  AF        .db $AF
  $B4FC  01 00     ORA ($00,X)
  $B4FE  08        PHP
  $B4FF  00        BRK
  $B500  02        .db $02
  $B501  40        RTI
  $B502  A5 80     LDA $80
  $B504  93        .db $93
  $B505  80        .db $80
  $B506  94 09     STY $09,X
  $B508  00        BRK
  $B509  06 03     ASL $03
  $B50B  50 05     BVC $B512
  $B50D  27        .db $27
  $B50E  01 10     ORA ($10,X)
  $B510  65 65     ADC $65

L_B512:
  $B512  BD 01 00  LDA $0001,X
  $B515  85 83     STA $83
  $B517  85 83     STA $83
  $B519  85 80     STA $80
  $B51B  85 82     STA $82
  $B51D  80        .db $80
  $B51E  82        .db $82
  $B51F  82        .db $82
  $B520  82        .db $82
  $B521  80        .db $80
  $B522  83        .db $83
  $B523  80        .db $80
  $B524  85 04     STA $04
  $B526  01 15     ORA ($15,X)
  $B528  B5 09     LDA $09,X
  $B52A  00        BRK
  $B52B  06 03     ASL $03
  $B52D  36 80     ROL $80,X
  $B52F  A7        .db $A7
  $B530  03        .db $03
  $B531  3A        .db $3A
  $B532  07        .db $07
  $B533  82        .db $82
  $B534  80        .db $80
  $B535  83        .db $83
  $B536  83        .db $83
  $B537  07        .db $07
  $B538  84 70     STY $70
  $B53A  87        .db $87
  $B53B  07        .db $07
  $B53C  82        .db $82
  $B53D  80        .db $80
  $B53E  83        .db $83
  $B53F  04        .db $04
  $B540  06 30     ASL $30
  $B542  B5 07     LDA $07,X
  $B544  84 70     STY $70
  $B546  80        .db $80
  $B547  87        .db $87
  $B548  80        .db $80
  $B549  87        .db $87
  $B54A  09 00     ORA #$00
  $B54C  00        BRK
  $B54D  80        .db $80
  $B54E  00        BRK
  $B54F  01 62     ORA ($62,X)
  $B551  80        .db $80
  $B552  00        BRK
  $B553  0F        .db $0F
  $B554  5E B5 72  LSR $72B5,X
  $B557  B5 00     LDA $00,X
  $B559  00        BRK
  $B55A  00        BRK
  $B55B  00        BRK
  $B55C  86 B5     STX $B5
  $B55E  00        BRK
  $B55F  08        PHP
  $B560  03        .db $03
  $B561  3F        .db $3F
  $B562  02        .db $02
  $B563  40        RTI
  $B564  07        .db $07
  $B565  FF        .db $FF
  $B566  10 01     BPL $B569
  $B568  FF        .db $FF

L_B569:
  $B569  05 2F     ORA $2F
  $B56B  08        PHP
  $B56C  01 95     ORA ($95,X)
  $B56E  04        .db $04
  $B56F  00        BRK
  $B570  60        RTS
  $B571  B5 00     LDA $00,X
  $B573  08        PHP
  $B574  03        .db $03
  $B575  3A        .db $3A
  $B576  02        .db $02
  $B577  40        RTI
  $B578  07        .db $07
  $B579  FF        .db $FF
  $B57A  10 01     BPL $B57D
  $B57C  FF        .db $FF

L_B57D:
  $B57D  05 2F     ORA $2F
  $B57F  08        PHP
  $B580  01 96     ORA ($96,X)
  $B582  04        .db $04
  $B583  00        BRK
  $B584  74        .db $74
  $B585  B5 00     LDA $00,X
  $B587  00        BRK
  $B588  80        .db $80
  $B589  00        BRK
  $B58A  00        BRK
  $B58B  22        .db $22
  $B58C  80        .db $80
  $B58D  00        BRK
  $B58E  0F        .db $0F
  $B58F  99 B5 36  STA $36B5,Y
  $B592  B6 48     LDX $48,Y
  $B594  B6 C4     LDX $C4,Y
  $B596  B6 D8     LDX $D8,Y
  $B598  B6 00     LDX $00,Y
  $B59A  08        PHP
  $B59B  05 20     ORA $20
  $B59D  02        .db $02
  $B59E  C0 03     CPY #$03
  $B5A0  3A        .db $3A
  $B5A1  07        .db $07
  $B5A2  DF        .db $DF
  $B5A3  40        RTI
  $B5A4  08        PHP
  $B5A5  00        BRK
  $B5A6  21 CC     AND ($CC,X)
  $B5A8  8C 85 88  STY $8885
  $B5AB  8C AF 8D  STY $8DAF
  $B5AE  AC 06 AA  LDY $AA06
  $B5B1  04        .db $04
  $B5B2  03        .db $03
  $B5B3  A6 B5     LDX $B5
  $B5B5  02        .db $02
  $B5B6  40        RTI
  $B5B7  CD 06 8D  CMP $8D06
  $B5BA  06 8F     ASL $8F
  $B5BC  91 06     STA ($06),Y
  $B5BE  AC 8C 8D  LDY $8D8C
  $B5C1  06 AF     ASL $AF
  $B5C3  D4        .db $D4
  $B5C4  94 92     STY $92,X
  $B5C6  91 8F     STA ($8F),Y
  $B5C8  06 AE     ASL $AE
  $B5CA  8E 8F 06  STX $068F
  $B5CD  B1 8D     LDA ($8D),Y
  $B5CF  8C 8D 8F  STY $8F8D
  $B5D2  A0 99     LDY #$99
  $B5D4  98        TYA
  $B5D5  99 9B A0  STA $A09B,Y
  $B5D8  06 86     ASL $86
  $B5DA  06 8A     ASL $8A
  $B5DC  8D D1 06  STA $06D1
  $B5DF  91 06     STA ($06),Y
  $B5E1  92        .db $92
  $B5E2  91 CF     STA ($CF),Y
  $B5E4  8F        .db $8F
  $B5E5  06 B1     ASL $B1
  $B5E7  02        .db $02
  $B5E8  00        BRK
  $B5E9  CD 06 8C  CMP $8C06
  $B5EC  06 8D     ASL $8D
  $B5EE  8F        .db $8F
  $B5EF  CD 06 8C  CMP $8C06
  $B5F2  06 8D     ASL $8D
  $B5F4  91 21     STA ($21),Y
  $B5F6  96 D6     STX $D6,Y
  $B5F8  91 71     STA ($71),Y
  $B5FA  6F        .db $6F
  $B5FB  8D AF 91  STA $91AF
  $B5FE  06 AA     ASL $AA
  $B600  8A        TXA
  $B601  8C 06 AD  STY $AD06
  $B604  05 14     ORA $14
  $B606  96 92     STX $92,Y
  $B608  8D 96 99  STA $9996
  $B60B  94 B8     STY $B8,X
  $B60D  BE 9D BB  LDX $BB9D,Y
  $B610  07        .db $07
  $B611  01 40     ORA ($40,X)
  $B613  05 20     ORA $20
  $B615  22        .db $22
  $B616  ED CD 8D  SBC $8DCD
  $B619  90 8F     BCC $B5AA
  $B61B  21 8D     AND ($8D,X)
  $B61D  04        .db $04
  $B61E  01 15     ORA ($15,X)
  $B620  B6 00     LDX $00,Y
  $B622  09 ED     ORA #$ED
  $B624  00        BRK
  $B625  0A        ASL
  $B626  06 A9     ASL $A9
  $B628  89        .db $89
  $B629  00        BRK
  $B62A  0B        .db $0B
  $B62B  89        .db $89
  $B62C  06 AB     ASL $AB
  $B62E  22        .db $22
  $B62F  E8        INX
  $B630  07        .db $07
  $B631  9F        .db $9F
  $B632  10 E8     BPL $B61C
  $B634  E8        INX
  $B635  09 00     ORA #$00
  $B637  08        PHP
  $B638  02        .db $02
  $B639  C0 03     CPY #$03
  $B63B  35 07     AND $07,X
  $B63D  DF        .db $DF
  $B63E  40        RTI
  $B63F  05 20     ORA $20
  $B641  06 80     ASL $80
  $B643  04        .db $04
  $B644  00        BRK
  $B645  A6 B5     LDX $B5
  $B647  09 00     ORA #$00
  $B649  08        PHP
  $B64A  03        .db $03
  $B64B  81 05     STA ($05,X)
  $B64D  20 06 AD  JSR $AD06
  $B650  8D CD 06  STA $06CD
  $B653  AD 8D CD  LDA $CD8D
  $B656  04        .db $04
  $B657  01 4E     ORA ($4E,X)
  $B659  B6 06     LDX $06,Y
  $B65B  AA        TAX
  $B65C  8A        TXA
  $B65D  CA        DEX
  $B65E  06 AA     ASL $AA
  $B660  8A        TXA
  $B661  CA        DEX
  $B662  04        .db $04
  $B663  01 5A     ORA ($5A,X)
  $B665  B6 06     LDX $06,Y
  $B667  A6 86     LDX $86
  $B669  C6 06     DEC $06
  $B66B  A8        TAY
  $B66C  88        DEY
  $B66D  C8        INY
  $B66E  06 A1     ASL $A1
  $B670  81 C1     STA ($C1,X)
  $B672  06 AA     ASL $AA
  $B674  8A        TXA
  $B675  CA        DEX
  $B676  06 A6     ASL $A6
  $B678  86 C6     STX $C6
  $B67A  04        .db $04
  $B67B  01 76     ORA ($76,X)
  $B67D  B6 06     LDX $06,Y

L_B67F:
  $B67F  A3        .db $A3
  $B680  83        .db $83
  $B681  C3        .db $C3
  $B682  06 A8     ASL $A8
  $B684  88        DEY
  $B685  88        DEY
  $B686  06 A9     ASL $A9
  $B688  06 AA     ASL $AA
  $B68A  8A        TXA
  $B68B  CA        DEX
  $B68C  06 A9     ASL $A9
  $B68E  89        .db $89
  $B68F  C9 06     CMP #$06
  $B691  A8        TAY
  $B692  88        DEY
  $B693  C8        INY
  $B694  06 A7     ASL $A7
  $B696  87        .db $87
  $B697  C7        .db $C7
  $B698  06 A6     ASL $A6
  $B69A  86 C6     STX $C6
  $B69C  06 A8     ASL $A8
  $B69E  88        DEY
  $B69F  C8        INY
  $B6A0  06 AB     ASL $AB
  $B6A2  8B        .db $8B
  $B6A3  CB        .db $CB
  $B6A4  04        .db $04
  $B6A5  01 A0     ORA ($A0,X)
  $B6A7  B6 06     LDX $06,Y
  $B6A9  AA        TAX
  $B6AA  8A        TXA
  $B6AB  CA        DEX
  $B6AC  04        .db $04
  $B6AD  01 A8     ORA ($A8,X)
  $B6AF  B6 00     LDX $00,Y
  $B6B1  09 06     ORA #$06
  $B6B3  A9 89     LDA #$89
  $B6B5  C9 00     CMP #$00
  $B6B7  0A        ASL
  $B6B8  06 A6     ASL $A6
  $B6BA  86 00     STX $00
  $B6BC  0B        .db $0B
  $B6BD  86 06     STX $06
  $B6BF  A8        TAY
  $B6C0  21 E1     AND ($E1,X)
  $B6C2  A1 09     LDA ($09,X)
  $B6C4  00        BRK
  $B6C5  08        PHP
  $B6C6  03        .db $03
  $B6C7  3C        .db $3C
  $B6C8  07        .db $07
  $B6C9  81 10     STA ($10,X)
  $B6CB  06 D0     ASL $D0
  $B6CD  A8        TAY
  $B6CE  04        .db $04
  $B6CF  19 CB B6  ORA $B6CB,Y
  $B6D2  00        BRK
  $B6D3  09 06     ORA #$06
  $B6D5  D0 A8     BNE $B67F
  $B6D7  09 02     ORA #$02
  $B6D9  22        .db $22
  $B6DA  80        .db $80
  $B6DB  00        BRK
  $B6DC  0F        .db $0F
  $B6DD  E7        .db $E7
  $B6DE  B6 E5     LDX $E5,Y
  $B6E0  B7        .db $B7
  $B6E1  DE B8 B6  DEC $B6B8,X
  $B6E4  B9 E2 B9  LDA $B9E2,Y
  $B6E7  00        BRK
  $B6E8  05 03     ORA $03
  $B6EA  3C        .db $3C
  $B6EB  05 23     ORA $23
  $B6ED  07        .db $07
  $B6EE  9A        TXS
  $B6EF  10 E0     BPL $B6D1
  $B6F1  63        .db $63
  $B6F2  66 6B     ROR $6B
  $B6F4  6F        .db $6F
  $B6F5  66 6B     ROR $6B
  $B6F7  6F        .db $6F
  $B6F8  72        .db $72
  $B6F9  6B        .db $6B
  $B6FA  6F        .db $6F
  $B6FB  72        .db $72
  $B6FC  77        .db $77
  $B6FD  6F        .db $6F
  $B6FE  72        .db $72
  $B6FF  77        .db $77
  $B700  7B        .db $7B
  $B701  A8        TAY
  $B702  E0 C0     CPX #$C0
  $B704  94 94     STY $94,X
  $B706  E0 C0     CPX #$C0
  $B708  88        DEY
  $B709  06 A7     ASL $A7
  $B70B  A6 E0     LDX $E0
  $B70D  A0 80     LDY #$80
  $B70F  90 90     BCC $B6A1
  $B711  92        .db $92
  $B712  E0 C0     CPX #$C0
  $B714  A6 A7     LDX $A7
  $B716  04        .db $04
  $B717  01 01     ORA ($01,X)
  $B719  B7        .db $B7
  $B71A  A8        TAY
  $B71B  A0 E0     LDY #$E0
  $B71D  E0 E0     CPX #$E0
  $B71F  05 17     ORA $17
  $B721  80        .db $80
  $B722  86 87     STX $87
  $B724  88        DEY
  $B725  8B        .db $8B
  $B726  6D 6D 80  ADC $806D
  $B729  6B        .db $6B
  $B72A  6B        .db $6B
  $B72B  8D 80 8B  STA $8B80
  $B72E  6D 6D 80  ADC $806D
  $B731  68        PLA
  $B732  68        PLA
  $B733  8B        .db $8B
  $B734  6D 6D 90  ADC $906D
  $B737  6F        .db $6F
  $B738  6F        .db $6F
  $B739  8D 6B 6B  STA $6B6B
  $B73C  8B        .db $8B
  $B73D  6D 6D 80  ADC $806D
  $B740  6B        .db $6B
  $B741  6B        .db $6B
  $B742  8D 80 8B  STA $8B80
  $B745  6D 6D 80  ADC $806D
  $B748  66 66     ROR $66
  $B74A  80        .db $80
  $B74B  66 66     ROR $66
  $B74D  86 67     STX $67
  $B74F  67        .db $67
  $B750  88        DEY
  $B751  6B        .db $6B
  $B752  6B        .db $6B
  $B753  04        .db $04
  $B754  01 25     ORA ($25,X)
  $B756  B7        .db $B7
  $B757  05 23     ORA $23
  $B759  02        .db $02
  $B75A  C0 C9     CPY #$C9
  $B75C  89        .db $89
  $B75D  8D 80 8D  STA $8D80
  $B760  70 6D     BVS $B7CF
  $B762  69 6D     ADC #$6D
  $B764  70 6D     BVS $B7D3
  $B766  70 75     BVS $B7DD
  $B768  D0 CB     BNE $B735
  $B76A  8B        .db $8B
  $B76B  8F        .db $8F
  $B76C  80        .db $80
  $B76D  06 B7     ASL $B7
  $B76F  B5 B4     LDA $B4,X
  $B771  B2        .db $B2
  $B772  C9 89     CMP #$89
  $B774  8D 80 8D  STA $8D80
  $B777  70 6D     BVS $B7E6
  $B779  69 6D     ADC #$6D
  $B77B  70 6D     BVS $B7EA
  $B77D  70 75     BVS $B7F4
  $B77F  D0 CB     BNE $B74C
  $B781  06 8B     ASL $8B
  $B783  06 88     ASL $88
  $B785  8B        .db $8B
  $B786  CC 03 38  CPY $3803
  $B789  70 73     BVS $B7FE
  $B78B  78        SEI
  $B78C  70 73     BVS $B801
  $B78E  78        SEI
  $B78F  7C        .db $7C
  $B790  78        SEI
  $B791  02        .db $02
  $B792  00        BRK
  $B793  8D 6D 6D  STA $6D6D
  $B796  8D 6D 6D  STA $6D6D
  $B799  8D 8F 80  STA $808F
  $B79C  EB        .db $EB
  $B79D  8B        .db $8B
  $B79E  89        .db $89
  $B79F  69 69     ADC #$69
  $B7A1  89        .db $89
  $B7A2  86 80     STX $80
  $B7A4  86 80     STX $80
  $B7A6  C8        INY
  $B7A7  88        DEY
  $B7A8  89        .db $89
  $B7A9  8B        .db $8B
  $B7AA  A0 8D     LDY #$8D
  $B7AC  6D 6D 8D  ADC $8D6D
  $B7AF  6D 6D 8D  ADC $8D6D
  $B7B2  8F        .db $8F
  $B7B3  80        .db $80
  $B7B4  EB        .db $EB
  $B7B5  8B        .db $8B
  $B7B6  85 85     STA $85
  $B7B8  86 88     STX $88
  $B7BA  80        .db $80
  $B7BB  85 86     STA $86
  $B7BD  88        DEY
  $B7BE  80        .db $80
  $B7BF  85 86     STA $86
  $B7C1  88        DEY
  $B7C2  80        .db $80
  $B7C3  03        .db $03
  $B7C4  3F        .db $3F
  $B7C5  85 86     STA $86
  $B7C7  21 88     AND ($88,X)
  $B7C9  E8        INX
  $B7CA  94 94     STY $94,X
  $B7CC  03        .db $03
  $B7CD  3C        .db $3C
  $B7CE  06 80     ASL $80
  $B7D0  94 94     STY $94,X
  $B7D2  03        .db $03

L_B7D3:
  $B7D3  38        SEC
  $B7D4  06 80     ASL $80
  $B7D6  94 94     STY $94,X
  $B7D8  03        .db $03
  $B7D9  35 06     AND $06,X
  $B7DB  80        .db $80
  $B7DC  94 94     STY $94,X
  $B7DE  03        .db $03
  $B7DF  33        .db $33
  $B7E0  06 80     ASL $80
  $B7E2  94 94     STY $94,X
  $B7E4  09 00     ORA #$00

L_B7E6:
  $B7E6  05 03     ORA $03
  $B7E8  3C        .db $3C
  $B7E9  05 23     ORA $23
  $B7EB  07        .db $07
  $B7EC  9A        TXS
  $B7ED  10 E0     BPL $B7CF
  $B7EF  66 6B     ROR $6B
  $B7F1  6F        .db $6F
  $B7F2  66 6B     ROR $6B

L_B7F4:
  $B7F4  6F        .db $6F
  $B7F5  72        .db $72
  $B7F6  6B        .db $6B
  $B7F7  6F        .db $6F
  $B7F8  72        .db $72
  $B7F9  77        .db $77
  $B7FA  6F        .db $6F
  $B7FB  72        .db $72
  $B7FC  77        .db $77
  $B7FD  7B        .db $7B

L_B7FE:
  $B7FE  7E A5 E0  ROR $E0A5,X

L_B801:
  $B801  C0 91     CPY #$91
  $B803  91 E0     STA ($E0),Y
  $B805  C0 85     CPY #$85
  $B807  06 A4     ASL $A4
  $B809  A3        .db $A3
  $B80A  E0 A0     CPX #$A0
  $B80C  80        .db $80
  $B80D  8D 8D 8F  STA $8F8D
  $B810  E0 C0     CPX #$C0
  $B812  A3        .db $A3
  $B813  A4 04     LDY $04

L_B815:
  $B815  01 FF     ORA ($FF,X)
  $B817  B7        .db $B7
  $B818  A5 A0     LDA $A0
  $B81A  E0 E0     CPX #$E0
  $B81C  E0 80     CPX #$80
  $B81E  86 87     STX $87
  $B820  88        DEY
  $B821  8B        .db $8B
  $B822  6D 6D 80  ADC $806D
  $B825  6B        .db $6B
  $B826  6B        .db $6B
  $B827  8D 80 8B  STA $8B80
  $B82A  6D 6D 80  ADC $806D
  $B82D  68        PLA
  $B82E  68        PLA
  $B82F  8B        .db $8B
  $B830  6D 6D 90  ADC $906D
  $B833  6F        .db $6F
  $B834  6F        .db $6F
  $B835  8D 6B 6B  STA $6B6B
  $B838  8B        .db $8B
  $B839  6D 6D 80  ADC $806D
  $B83C  6B        .db $6B
  $B83D  6B        .db $6B
  $B83E  8D 80 8B  STA $8B80
  $B841  6D 6D 80  ADC $806D
  $B844  66 66     ROR $66
  $B846  80        .db $80
  $B847  66 66     ROR $66
  $B849  86 67     STX $67
  $B84B  67        .db $67
  $B84C  88        DEY
  $B84D  6B        .db $6B
  $B84E  6B        .db $6B
  $B84F  04        .db $04
  $B850  01 21     ORA ($21,X)
  $B852  B8        CLV
  $B853  61 64     ADC ($64,X)
  $B855  69 6D     ADC #$6D
  $B857  04        .db $04
  $B858  07        .db $07
  $B859  53        .db $53
  $B85A  B8        CLV
  $B85B  63        .db $63
  $B85C  66 6B     ROR $6B
  $B85E  6F        .db $6F
  $B85F  04        .db $04
  $B860  07        .db $07
  $B861  5B        .db $5B
  $B862  B8        CLV
  $B863  61 64     ADC ($64,X)
  $B865  69 6D     ADC #$6D
  $B867  04        .db $04
  $B868  07        .db $07
  $B869  63        .db $63
  $B86A  B8        CLV
  $B86B  63        .db $63
  $B86C  66 6B     ROR $6B
  $B86E  6F        .db $6F
  $B86F  73        .db $73
  $B870  6F        .db $6F
  $B871  6B        .db $6B
  $B872  66 04     ROR $04
  $B874  01 6B     ORA ($6B,X)
  $B876  B8        CLV
  $B877  64        .db $64
  $B878  67        .db $67
  $B879  6C 70 67  JMP ($6770)
  $B87C  6C 70 73  JMP ($7370)
  $B87F  6C 70 73  JMP ($7370)
  $B882  78        SEI
  $B883  70 73     BVS $B8F8
  $B885  78        SEI
  $B886  7C        .db $7C
  $B887  02        .db $02
  $B888  00        BRK
  $B889  07        .db $07
  $B88A  9A        TXS
  $B88B  10 88     BPL $B815
  $B88D  68        PLA
  $B88E  68        PLA
  $B88F  88        DEY
  $B890  68        PLA
  $B891  68        PLA
  $B892  88        DEY
  $B893  88        DEY
  $B894  80        .db $80
  $B895  E6 88     INC $88
  $B897  84 64     STY $64
  $B899  64        .db $64
  $B89A  84 83     STY $83
  $B89C  80        .db $80
  $B89D  83        .db $83
  $B89E  80        .db $80
  $B89F  C5 85     CMP $85
  $B8A1  84 86     STY $86
  $B8A3  A0 88     LDY #$88
  $B8A5  68        PLA
  $B8A6  68        PLA
  $B8A7  88        DEY
  $B8A8  68        PLA
  $B8A9  68        PLA
  $B8AA  88        DEY

L_B8AB:
  $B8AB  88        DEY
  $B8AC  80        .db $80
  $B8AD  E6 88     INC $88
  $B8AF  88        DEY
  $B8B0  88        DEY
  $B8B1  8A        TXA
  $B8B2  8D 80 88  STA $8880
  $B8B5  8A        TXA
  $B8B6  8D 80 88  STA $8880
  $B8B9  8A        TXA
  $B8BA  8D 80 03  STA $0380
  $B8BD  3F        .db $3F

L_B8BE:
  $B8BE  88        DEY
  $B8BF  8A        TXA
  $B8C0  21 8D     AND ($8D,X)
  $B8C2  ED 99 99  SBC $9999
  $B8C5  03        .db $03
  $B8C6  3C        .db $3C
  $B8C7  06 80     ASL $80
  $B8C9  99 99 03  STA $0399,Y
  $B8CC  38        SEC
  $B8CD  06 80     ASL $80
  $B8CF  99 99 03  STA $0399,Y
  $B8D2  35 06     AND $06,X
  $B8D4  80        .db $80
  $B8D5  99 99 03  STA $0399,Y
  $B8D8  32        .db $32
  $B8D9  06 80     ASL $80
  $B8DB  99 99 09  STA $0999,Y
  $B8DE  00        BRK
  $B8DF  05 03     ORA $03
  $B8E1  30 05     BMI $B8E8
  $B8E3  23        .db $23
  $B8E4  01 10     ORA ($10,X)
  $B8E6  A0 9D     LDY #$9D

L_B8E8:
  $B8E8  9A        TXS
  $B8E9  80        .db $80
  $B8EA  9A        TXS
  $B8EB  B8        CLV
  $B8EC  7D 7D 7D  ADC $7D7D,X
  $B8EF  60        RTS
  $B8F0  7A        .db $7A
  $B8F1  7A        .db $7A
  $B8F2  7A        .db $7A
  $B8F3  60        RTS
  $B8F4  77        .db $77
  $B8F5  77        .db $77
  $B8F6  77        .db $77
  $B8F7  60        RTS

L_B8F8:
  $B8F8  7D 7A 78  ADC $787A,X
  $B8FB  75 01     ADC $01,X
  $B8FD  00        BRK
  $B8FE  8B        .db $8B
  $B8FF  8D 80 8D  STA $8D80

L_B902:
  $B902  A0 8B     LDY #$8B
  $B904  8D 80 8D  STA $8D80
  $B907  80        .db $80
  $B908  8B        .db $8B
  $B909  8D 90 01  STA $0190
  $B90C  10 9D     BPL $B8AB
  $B90E  9D 01 00  STA $0001,X
  $B911  8B        .db $8B
  $B912  8D 80 8D  STA $8D80
  $B915  A0 8B     LDY #$8B
  $B917  8D 80 8D  STA $8D80
  $B91A  80        .db $80
  $B91B  8B        .db $8B
  $B91C  8D 90 01  STA $0190
  $B91F  10 9D     BPL $B8BE
  $B921  9D 01 00  STA $0001,X
  $B924  86 8B     STX $8B
  $B926  80        .db $80
  $B927  8B        .db $8B
  $B928  A0 86     LDY #$86
  $B92A  8B        .db $8B
  $B92B  80        .db $80
  $B92C  8B        .db $8B
  $B92D  80        .db $80
  $B92E  86 8B     STX $8B

L_B930:
  $B930  8F        .db $8F
  $B931  01 10     ORA ($10,X)
  $B933  9D 9D 01  STA $019D,X
  $B936  00        BRK
  $B937  86 8B     STX $8B
  $B939  80        .db $80
  $B93A  8B        .db $8B
  $B93B  A0 86     LDY #$86
  $B93D  8B        .db $8B
  $B93E  80        .db $80
  $B93F  8B        .db $8B
  $B940  80        .db $80
  $B941  86 01     STX $01
  $B943  10 BD     BPL $B902
  $B945  BD 04 01  LDA $0104,X
  $B948  FC        .db $FC
  $B949  B8        CLV
  $B94A  8D 80 9D  STA $9D80
  $B94D  8D 80 8D  STA $8D80

L_B950:
  $B950  9D 80 8D  STA $8D80,X
  $B953  80        .db $80
  $B954  9D 8D 6D  STA $6D8D,X
  $B957  6D 6D 6D  ADC $6D6D
  $B95A  9D 8D 04  STA $048D,X
  $B95D  05 4A     ORA $4A
  $B95F  B9 01 00  LDA $0001,Y
  $B962  89        .db $89
  $B963  69 69     ADC #$69
  $B965  04        .db $04
  $B966  07        .db $07
  $B967  62        .db $62
  $B968  B9 8B 6B  LDA $6B8B,Y
  $B96B  6B        .db $6B
  $B96C  04        .db $04
  $B96D  07        .db $07
  $B96E  69 B9     ADC #$B9
  $B970  89        .db $89
  $B971  69 69     ADC #$69
  $B973  04        .db $04
  $B974  07        .db $07
  $B975  70 B9     BVS $B930
  $B977  8B        .db $8B
  $B978  6B        .db $6B
  $B979  6B        .db $6B
  $B97A  04        .db $04
  $B97B  03        .db $03
  $B97C  77        .db $77
  $B97D  B9 8C 6C  LDA $6C8C,Y
  $B980  6C 8C 6C  JMP ($6C8C)
  $B983  6C 01 15  JMP ($1501)
  $B986  7D 7D 7D  ADC $7D7D,X
  $B989  7D 7A 7A  ADC $7A7A,X
  $B98C  7A        .db $7A
  $B98D  7A        .db $7A
  $B98E  01 00     ORA ($00,X)
  $B990  8D 6D 6D  STA $6D6D
  $B993  04        .db $04
  $B994  17        .db $17
  $B995  90 B9     BCC $B950
  $B997  81 81     STA ($81,X)
  $B999  81 85     STA ($85,X)
  $B99B  80        .db $80
  $B99C  81 81     STA ($81,X)
  $B99E  85 80     STA $80
  $B9A0  81 81     STA ($81,X)
  $B9A2  85 80     STA $80
  $B9A4  81 81     STA ($81,X)
  $B9A6  85 01     STA $01
  $B9A8  10 7D     BPL $BA27
  $B9AA  7A        .db $7A
  $B9AB  78        SEI
  $B9AC  04        .db $04
  $B9AD  04        .db $04
  $B9AE  A7        .db $A7
  $B9AF  B9 75 01  LDA $0175,Y
  $B9B2  00        BRK
  $B9B3  85 85     STA $85
  $B9B5  09 00     ORA #$00
  $B9B7  05 07     ORA $07
  $B9B9  82        .db $82
  $B9BA  A0 03     LDY #$03
  $B9BC  3F        .db $3F
  $B9BD  82        .db $82
  $B9BE  62        .db $62
  $B9BF  62        .db $62
  $B9C0  07        .db $07
  $B9C1  84 80     STY $80
  $B9C3  01 FE     ORA ($FE,X)
  $B9C5  8D 01 00  STA $0001
  $B9C8  07        .db $07
  $B9C9  82        .db $82
  $B9CA  A0 62     LDY #$62
  $B9CC  62        .db $62
  $B9CD  04        .db $04
  $B9CE  57        .db $57
  $B9CF  BD B9 83  LDA $83B9,X
  $B9D2  83        .db $83
  $B9D3  83        .db $83
  $B9D4  83        .db $83
  $B9D5  80        .db $80
  $B9D6  83        .db $83
  $B9D7  83        .db $83
  $B9D8  83        .db $83
  $B9D9  80        .db $80
  $B9DA  83        .db $83
  $B9DB  83        .db $83
  $B9DC  83        .db $83
  $B9DD  80        .db $80
  $B9DE  83        .db $83

L_B9DF:
  $B9DF  83        .db $83
  $B9E0  83        .db $83
  $B9E1  09 00     ORA #$00
  $B9E3  00        BRK
  $B9E4  80        .db $80
  $B9E5  00        BRK
  $B9E6  01 62     ORA ($62,X)
  $B9E8  80        .db $80
  $B9E9  00        BRK
  $B9EA  0F        .db $0F
  $B9EB  F5 B9     SBC $B9,X
  $B9ED  0E BA 27  ASL $27BA
  $B9F0  BA        TSX
  $B9F1  00        BRK
  $B9F2  00        BRK
  $B9F3  4E BA 00  LSR $00BA
  $B9F6  06 03     ASL $03

L_B9F8:
  $B9F8  3F        .db $3F
  $B9F9  05 27     ORA $27
  $B9FB  07        .db $07
  $B9FC  89        .db $89

L_B9FD:
  $B9FD  10 E0     BPL $B9DF
  $B9FF  6A        ROR
  $BA00  6A        ROR
  $BA01  80        .db $80
  $BA02  6C 6C 80  JMP ($806C)
  $BA05  6D 6D 80  ADC $806D
  $BA08  6F        .db $6F
  $BA09  6D 6F 06  ADC $066F
  $BA0C  F1 09     SBC ($09),Y
  $BA0E  00        BRK
  $BA0F  06 03     ASL $03

L_BA11:
  $BA11  3F        .db $3F
  $BA12  05 27     ORA $27
  $BA14  07        .db $07

L_BA15:
  $BA15  89        .db $89

L_BA16:
  $BA16  10 E0     BPL $B9F8

L_BA18:
  $BA18  66 66     ROR $66
  $BA1A  80        .db $80
  $BA1B  68        PLA
  $BA1C  68        PLA

L_BA1D:
  $BA1D  80        .db $80
  $BA1E  6A        ROR
  $BA1F  6A        ROR
  $BA20  80        .db $80
  $BA21  6C 6A 6C  JMP ($6C6A)
  $BA24  06 ED     ASL $ED
  $BA26  09 00     ORA #$00
  $BA28  06 03     ASL $03
  $BA2A  30 05     BMI $BA31
  $BA2C  27        .db $27
  $BA2D  01 10     ORA ($10,X)
  $BA2F  9D 9D 7D  STA $7D9D,X
  $BA32  7A        .db $7A
  $BA33  60        RTS

L_BA34:
  $BA34  98        TYA
  $BA35  98        TYA
  $BA36  78        SEI
  $BA37  76 60     ROR $60,X
  $BA39  73        .db $73
  $BA3A  60        RTS

L_BA3B:
  $BA3B  01 00     ORA ($00,X)

L_BA3D:
  $BA3D  03        .db $03
  $BA3E  81 63     STA ($63,X)

L_BA40:
  $BA40  63        .db $63
  $BA41  80        .db $80
  $BA42  65 65     ADC $65
  $BA44  80        .db $80

L_BA45:
  $BA45  66 66     ROR $66
  $BA47  80        .db $80
  $BA48  68        PLA

L_BA49:
  $BA49  66 68     ROR $68
  $BA4B  06 E8     ASL $E8

L_BA4D:
  $BA4D  09 00     ORA #$00
  $BA4F  00        BRK
  $BA50  80        .db $80
  $BA51  00        BRK

L_BA52:
  $BA52  0F        .db $0F
  $BA53  5D BA 90  EOR $90BA,X
  $BA56  BA        TSX
  $BA57  C3        .db $C3
  $BA58  BA        TSX
  $BA59  DA        .db $DA
  $BA5A  BA        TSX
  $BA5B  E9 BA     SBC #$BA
  $BA5D  00        BRK
  $BA5E  06 03     ASL $03
  $BA60  3F        .db $3F
  $BA61  02        .db $02
  $BA62  00        BRK
  $BA63  05 23     ORA $23
  $BA65  07        .db $07
  $BA66  AF        .db $AF
  $BA67  10 06     BPL $BA6F
  $BA69  CD 30 8D  CMP $8D30
  $BA6C  30 8C     BMI $B9FA
  $BA6E  30 8D     BMI $B9FD
  $BA70  06 CF     ASL $CF
  $BA72  30 8F     BMI $BA03
  $BA74  30 8D     BMI $BA03
  $BA76  30 8F     BMI $BA07
  $BA78  06 D1     ASL $D1
  $BA7A  30 91     BMI $BA0D
  $BA7C  30 8F     BMI $BA0D
  $BA7E  30 91     BMI $BA11
  $BA80  D2        .db $D2
  $BA81  30 92     BMI $BA15
  $BA83  30 91     BMI $BA16
  $BA85  30 92     BMI $BA19
  $BA87  30 8F     BMI $BA18
  $BA89  30 92     BMI $BA1D
  $BA8B  30 96     BMI $BA23
  $BA8D  06 F4     ASL $F4
  $BA8F  09 00     ORA #$00
  $BA91  06 02     ASL $02
  $BA93  40        RTI
  $BA94  05 23     ORA $23
  $BA96  03        .db $03
  $BA97  3F        .db $3F
  $BA98  07        .db $07
  $BA99  AF        .db $AF
  $BA9A  10 06     BPL $BAA2
  $BA9C  C8        INY
  $BA9D  30 88     BMI $BA27
  $BA9F  30 88     BMI $BA29
  $BAA1  30 91     BMI $BA34
  $BAA3  06 D4     ASL $D4
  $BAA5  30 94     BMI $BA3B
  $BAA7  30 92     BMI $BA3B
  $BAA9  30 91     BMI $BA3C
  $BAAB  06 CD     ASL $CD
  $BAAD  30 8D     BMI $BA3C
  $BAAF  30 8C     BMI $BA3D
  $BAB1  30 8D     BMI $BA40
  $BAB3  CF        .db $CF
  $BAB4  30 8F     BMI $BA45
  $BAB6  30 8D     BMI $BA45
  $BAB8  30 8F     BMI $BA49
  $BABA  30 8A     BMI $BA46
  $BABC  30 8F     BMI $BA4D
  $BABE  30 92     BMI $BA52
  $BAC0  06 F1     ASL $F1
  $BAC2  09 00     ORA #$00
  $BAC4  06 03     ASL $03
  $BAC6  50 05     BVC $BACD
  $BAC8  2F        .db $2F
  $BAC9  81 81     STA ($81,X)
  $BACB  81 61     STA ($61,X)

L_BACD:
  $BACD  61 60     ADC ($60,X)
  $BACF  81 61     STA ($61,X)
  $BAD1  81 81     STA ($81,X)
  $BAD3  04        .db $04
  $BAD4  03        .db $03
  $BAD5  C9 BA     CMP #$BA
  $BAD7  06 E1     ASL $E1
  $BAD9  09 00     ORA #$00
  $BADB  06 07     ASL $07
  $BADD  83        .db $83
  $BADE  F0 03     BEQ $BAE3
  $BAE0  3F        .db $3F
  $BAE1  63        .db $63
  $BAE2  63        .db $63

L_BAE3:
  $BAE3  83        .db $83
  $BAE4  04        .db $04
  $BAE5  0F        .db $0F
  $BAE6  DC        .db $DC
  $BAE7  BA        TSX
  $BAE8  09 01     ORA #$01
  $BAEA  62        .db $62
  $BAEB  80        .db $80
  $BAEC  00        BRK
  $BAED  0F        .db $0F
  $BAEE  00        BRK
  $BAEF  00        BRK
  $BAF0  00        BRK
  $BAF1  00        BRK
  $BAF2  F8        SED
  $BAF3  BA        TSX
  $BAF4  13        .db $13
  $BAF5  BB        .db $BB
  $BAF6  22        .db $22
  $BAF7  BB        .db $BB
  $BAF8  00        BRK
  $BAF9  05 03     ORA $03
  $BAFB  30 05     BMI $BB02
  $BAFD  23        .db $23
  $BAFE  01 10     ORA ($10,X)
  $BB00  8D 80 BD  STA $BD80
  $BB03  80        .db $80
  $BB04  6D 6D BD  ADC $BD6D
  $BB07  8D 80 BD  STA $BD80
  $BB0A  6D 6D 6D  ADC $6D6D
  $BB0D  6D BD 04  ADC $04BD
  $BB10  00        BRK
  $BB11  FE BA 00  INC $00BA,X
  $BB14  05 03     ORA $03
  $BB16  3F        .db $3F
  $BB17  07        .db $07
  $BB18  82        .db $82
  $BB19  30 01     BMI $BB1C
  $BB1B  FF        .db $FF

L_BB1C:
  $BB1C  A0 AB     LDY #$AB
  $BB1E  04        .db $04
  $BB1F  00        BRK
  $BB20  1C        .db $1C
  $BB21  BB        .db $BB
  $BB22  50 0A     BVC $BB2E
  $BB24  02        .db $02
  $BB25  00        BRK
  $BB26  03        .db $03
  $BB27  3F        .db $3F
  $BB28  83        .db $83
  $BB29  8A        TXA
  $BB2A  00        BRK
  $BB2B  06 03     ASL $03
  $BB2D  3F        .db $3F

L_BB2E:
  $BB2E  80        .db $80
  $BB2F  0A        ASL
  $BB30  80        .db $80
  $BB31  35 00     AND $00,X
  $BB33  09 02     ORA #$02
  $BB35  80        .db $80
  $BB36  01 FF     ORA ($FF,X)
  $BB38  80        .db $80
  $BB39  05 03     ORA $03
  $BB3B  3F        .db $3F
  $BB3C  8F        .db $8F
  $BB3D  FF        .db $FF
  $BB3E  00        BRK
  $BB3F  09 03     ORA #$03
  $BB41  3A        .db $3A
  $BB42  80        .db $80
  $BB43  05 03     ORA $03
  $BB45  3A        .db $3A
  $BB46  01 00     ORA ($00,X)
  $BB48  8F        .db $8F
  $BB49  FF        .db $FF
  $BB4A  00        BRK
  $BB4B  09 03     ORA #$03
  $BB4D  36 80     ROL $80,X
  $BB4F  04        .db $04
  $BB50  03        .db $03
  $BB51  37        .db $37
  $BB52  8F        .db $8F
  $BB53  FF        .db $FF
  $BB54  00        BRK
  $BB55  09 03     ORA #$03
  $BB57  33        .db $33
  $BB58  80        .db $80
  $BB59  03        .db $03
  $BB5A  06 A0     ASL $A0
  $BB5C  0F        .db $0F
  $BB5D  02        .db $02
  $BB5E  80        .db $80
  $BB5F  01 20     ORA ($20,X)
  $BB61  03        .db $03
  $BB62  3F        .db $3F
  $BB63  80        .db $80
  $BB64  86 02     STX $02
  $BB66  00        BRK
  $BB67  01 20     ORA ($20,X)
  $BB69  03        .db $03
  $BB6A  3F        .db $3F
  $BB6B  81 0D     STA ($0D,X)
  $BB6D  03        .db $03
  $BB6E  7F        .db $7F
  $BB6F  01 20     ORA ($20,X)
  $BB71  81 AB     STA ($AB,X)
  $BB73  00        BRK
  $BB74  0A        ASL
  $BB75  03        .db $03
  $BB76  3A        .db $3A
  $BB77  02        .db $02
  $BB78  80        .db $80
  $BB79  80        .db $80
  $BB7A  0A        ASL
  $BB7B  01 15     ORA ($15,X)
  $BB7D  80        .db $80
  $BB7E  64        .db $64
  $BB7F  01 15     ORA ($15,X)
  $BB81  80        .db $80
  $BB82  C9 01     CMP #$01
  $BB84  15 82     ORA $82,X
  $BB86  FA        .db $FA
  $BB87  00        BRK
  $BB88  3A        .db $3A
  $BB89  02        .db $02
  $BB8A  00        BRK
  $BB8B  80        .db $80
  $BB8C  08        PHP
  $BB8D  06 30     ASL $30
  $BB8F  0A        ASL
  $BB90  02        .db $02
  $BB91  00        BRK
  $BB92  03        .db $03
  $BB93  3F        .db $3F
  $BB94  81 AB     STA ($AB,X)
  $BB96  00        BRK
  $BB97  03        .db $03
  $BB98  02        .db $02
  $BB99  80        .db $80
  $BB9A  03        .db $03
  $BB9B  3F        .db $3F
  $BB9C  80        .db $80
  $BB9D  0A        ASL
  $BB9E  04        .db $04
  $BB9F  01 90     ORA ($90,X)
  $BBA1  BB        .db $BB
  $BBA2  03        .db $03
  $BBA3  38        SEC
  $BBA4  02        .db $02
  $BBA5  C0 01     CPY #$01
  $BBA7  FF        .db $FF
  $BBA8  80        .db $80
  $BBA9  3F        .db $3F
  $BBAA  00        BRK
  $BBAB  10 02     BPL $BBAF
  $BBAD  80        .db $80
  $BBAE  05 00     ORA $00
  $BBB0  00        BRK
  $BBB1  84 01     STY $01
  $BBB3  80        .db $80
  $BBB4  07        .db $07
  $BBB5  06 30     ASL $30
  $BBB7  02        .db $02
  $BBB8  00        BRK
  $BBB9  10 02     BPL $BBBD
  $BBBB  40        RTI
  $BBBC  03        .db $03

L_BBBD:
  $BBBD  3F        .db $3F
  $BBBE  05 02     ORA $02
  $BBC0  44        .db $44
  $BBC1  80        .db $80
  $BBC2  00        BRK
  $BBC3  01 E0     ORA ($E0,X)
  $BBC5  81 0D     STA ($0D,X)
  $BBC7  06 50     ASL $50
  $BBC9  02        .db $02
  $BBCA  00        BRK
  $BBCB  08        PHP
  $BBCC  02        .db $02
  $BBCD  40        RTI
  $BBCE  03        .db $03
  $BBCF  3F        .db $3F
  $BBD0  01 0F     ORA ($0F,X)
  $BBD2  80        .db $80
  $BBD3  64        .db $64
  $BBD4  06 D0     ASL $D0
  $BBD6  0A        ASL
  $BBD7  02        .db $02
  $BBD8  C0 03     CPY #$03
  $BBDA  3F        .db $3F
  $BBDB  05 02     ORA $02
  $BBDD  A3        .db $A3
  $BBDE  80        .db $80
  $BBDF  07        .db $07
  $BBE0  01 5F     ORA ($5F,X)
  $BBE2  80        .db $80
  $BBE3  71 00     ADC ($00),Y
  $BBE5  05 05     ORA $05
  $BBE7  01 43     ORA ($43,X)
  $BBE9  80        .db $80
  $BBEA  07        .db $07
  $BBEB  01 5F     ORA ($5F,X)
  $BBED  03        .db $03
  $BBEE  3F        .db $3F
  $BBEF  80        .db $80
  $BBF0  0A        ASL
  $BBF1  03        .db $03
  $BBF2  38        SEC
  $BBF3  80        .db $80
  $BBF4  64        .db $64
  $BBF5  00        BRK
  $BBF6  0D 05 01  ORA $0105
  $BBF9  43        .db $43
  $BBFA  80        .db $80
  $BBFB  07        .db $07
  $BBFC  01 F1     ORA ($F1,X)
  $BBFE  02        .db $02
  $BBFF  80        .db $80
  $BC00  80        .db $80
  $BC01  05 06     ORA $06
  $BC03  E0 0A     CPX #$0A
  $BC05  01 35     ORA ($35,X)
  $BC07  02        .db $02
  $BC08  00        BRK
  $BC09  03        .db $03
  $BC0A  3F        .db $3F
  $BC0B  80        .db $80
  $BC0C  A9 00     LDA #$00
  $BC0E  06 03     ASL $03
  $BC10  37        .db $37
  $BC11  80        .db $80
  $BC12  03        .db $03
  $BC13  01 FC     ORA ($FC,X)
  $BC15  05 01     ORA $01
  $BC17  42        .db $42
  $BC18  80        .db $80
  $BC19  00        BRK
  $BC1A  8F        .db $8F
  $BC1B  FF        .db $FF
  $BC1C  00        BRK
  $BC1D  20 03 3A  JSR $3A03
  $BC20  80        .db $80
  $BC21  04        .db $04
  $BC22  01 F9     ORA ($F9,X)
  $BC24  8F        .db $8F
  $BC25  FF        .db $FF
  $BC26  00        BRK
  $BC27  20 03 3A  JSR $3A03
  $BC2A  80        .db $80
  $BC2B  04        .db $04
  $BC2C  06 C0     ASL $C0
  $BC2E  03        .db $03
  $BC2F  05 01     ORA $01
  $BC31  41 80     EOR ($80,X)
  $BC33  00        BRK
  $BC34  03        .db $03
  $BC35  3F        .db $3F
  $BC36  02        .db $02
  $BC37  40        RTI
  $BC38  80        .db $80
  $BC39  6A        ROR
  $BC3A  00        BRK
  $BC3B  04        .db $04
  $BC3C  02        .db $02
  $BC3D  40        RTI
  $BC3E  05 01     ORA $01
  $BC40  41 80     EOR ($80,X)
  $BC42  00        BRK
  $BC43  03        .db $03
  $BC44  3F        .db $3F
  $BC45  80        .db $80
  $BC46  54        .db $54
  $BC47  04        .db $04
  $BC48  02        .db $02
  $BC49  2F        .db $2F
  $BC4A  BC 06 20  LDY $2006,X
  $BC4D  02        .db $02
  $BC4E  00        BRK
  $BC4F  04        .db $04
  $BC50  02        .db $02
  $BC51  40        RTI
  $BC52  01 8B     ORA ($8B,X)
  $BC54  03        .db $03
  $BC55  3F        .db $3F
  $BC56  05 01     ORA $01
  $BC58  46 82     LSR $82
  $BC5A  01 80     ORA ($80,X)
  $BC5C  3F        .db $3F
  $BC5D  04        .db $04
  $BC5E  01 4E     ORA ($4E,X)
  $BC60  BC 06 F0  LDY $F006,X
  $BC63  0B        .db $0B
  $BC64  03        .db $03
  $BC65  3F        .db $3F
  $BC66  81 AB     STA ($AB,X)
  $BC68  02        .db $02
  $BC69  C0 01     CPY #$01
  $BC6B  F2        .db $F2
  $BC6C  03        .db $03
  $BC6D  3F        .db $3F
  $BC6E  87        .db $87
  $BC6F  F2        .db $F2
  $BC70  00        BRK
  $BC71  1F        .db $1F
  $BC72  03        .db $03
  $BC73  3F        .db $3F
  $BC74  02        .db $02
  $BC75  80        .db $80
  $BC76  80        .db $80
  $BC77  04        .db $04
  $BC78  04        .db $04
  $BC79  0D 64 BC  ORA $BC64
  $BC7C  01 01     ORA ($01,X)
  $BC7E  80        .db $80
  $BC7F  11 02     ORA ($02),Y
  $BC81  00        BRK
  $BC82  01 01     ORA ($01,X)
  $BC84  80        .db $80
  $BC85  15 00     ORA $00,X
  $BC87  7F        .db $7F
  $BC88  02        .db $02
  $BC89  80        .db $80
  $BC8A  03        .db $03
  $BC8B  34        .db $34
  $BC8C  80        .db $80
  $BC8D  0A        ASL
  $BC8E  8F        .db $8F
  $BC8F  FF        .db $FF
  $BC90  8F        .db $8F
  $BC91  FF        .db $FF
  $BC92  00        BRK
  $BC93  1F        .db $1F
  $BC94  80        .db $80
  $BC95  0A        ASL
  $BC96  04        .db $04
  $BC97  0C        .db $0C
  $BC98  8E BC 06  STX $06BC
  $BC9B  80        .db $80
  $BC9C  0A        ASL
  $BC9D  02        .db $02
  $BC9E  40        RTI
  $BC9F  03        .db $03
  $BCA0  3F        .db $3F
  $BCA1  05 00     ORA $00
  $BCA3  05 86     ORA $86
  $BCA5  07        .db $07
  $BCA6  01 40     ORA ($40,X)
  $BCA8  80        .db $80
  $BCA9  0E 00 15  ASL $1500
  $BCAC  02        .db $02
  $BCAD  80        .db $80
  $BCAE  01 4F     ORA ($4F,X)
  $BCB0  03        .db $03
  $BCB1  3F        .db $3F
  $BCB2  80        .db $80
  $BCB3  0F        .db $0F
  $BCB4  06 C0     ASL $C0
  $BCB6  0A        ASL
  $BCB7  02        .db $02
  $BCB8  C0 01     CPY #$01
  $BCBA  05 03     ORA $03
  $BCBC  3F        .db $3F
  $BCBD  83        .db $83
  $BCBE  F9 00 02  SBC $0200,Y
  $BCC1  03        .db $03
  $BCC2  3F        .db $3F
  $BCC3  80        .db $80
  $BCC4  0E 04 01  ASL $0104
  $BCC7  B7        .db $B7
  $BCC8  BC 02 00  LDY $0002,X
  $BCCB  05 01     ORA $01
  $BCCD  43        .db $43
  $BCCE  80        .db $80
  $BCCF  00        BRK
  $BCD0  01 14     ORA ($14,X)
  $BCD2  82        .db $82
  $BCD3  81 00     STA ($00,X)

L_BCD5:
  $BCD5  03        .db $03
  $BCD6  80        .db $80
  $BCD7  0C        .db $0C
  $BCD8  01 CA     ORA ($CA,X)
  $BCDA  8F        .db $8F
  $BCDB  FF        .db $FF
  $BCDC  00        BRK
  $BCDD  0C        .db $0C
  $BCDE  80        .db $80
  $BCDF  0C        .db $0C
  $BCE0  01 04     ORA ($04,X)
  $BCE2  8F        .db $8F
  $BCE3  FF        .db $FF
  $BCE4  00        BRK
  $BCE5  12        .db $12
  $BCE6  80        .db $80
  $BCE7  0A        ASL
  $BCE8  01 FE     ORA ($FE,X)
  $BCEA  8F        .db $8F
  $BCEB  FF        .db $FF
  $BCEC  00        BRK
  $BCED  12        .db $12
  $BCEE  80        .db $80
  $BCEF  09 06     ORA #$06
  $BCF1  80        .db $80
  $BCF2  06 03     ASL $03
  $BCF4  3F        .db $3F
  $BCF5  01 81     ORA ($81,X)
  $BCF7  80        .db $80
  $BCF8  1E 00 04  ASL $0400,X
  $BCFB  03        .db $03
  $BCFC  3F        .db $3F
  $BCFD  80        .db $80
  $BCFE  0F        .db $0F
  $BCFF  06 70     ASL $70
  $BD01  0A        ASL
  $BD02  02        .db $02
  $BD03  80        .db $80
  $BD04  03        .db $03
  $BD05  3F        .db $3F
  $BD06  01 EF     ORA ($EF,X)
  $BD08  80        .db $80
  $BD09  38        SEC
  $BD0A  00        BRK
  $BD0B  04        .db $04
  $BD0C  02        .db $02
  $BD0D  80        .db $80
  $BD0E  03        .db $03
  $BD0F  3F        .db $3F
  $BD10  01 FF     ORA ($FF,X)
  $BD12  80        .db $80
  $BD13  08        PHP
  $BD14  01 F9     ORA ($F9,X)
  $BD16  80        .db $80
  $BD17  25 00     AND $00
  $BD19  04        .db $04
  $BD1A  80        .db $80
  $BD1B  05 01     ORA $01
  $BD1D  EF        .db $EF
  $BD1E  80        .db $80
  $BD1F  38        SEC
  $BD20  00        BRK
  $BD21  04        .db $04
  $BD22  80        .db $80
  $BD23  0A        ASL
  $BD24  06 E0     ASL $E0
  $BD26  02        .db $02
  $BD27  00        BRK
  $BD28  05 03     ORA $03
  $BD2A  3F        .db $3F
  $BD2B  02        .db $02
  $BD2C  C0 80     CPY #$80
  $BD2E  86 00     STX $00
  $BD30  08        PHP
  $BD31  03        .db $03
  $BD32  3F        .db $3F
  $BD33  05 00     ORA $00
  $BD35  E0 80     CPX #$80
  $BD37  00        BRK
  $BD38  02        .db $02
  $BD39  40        RTI
  $BD3A  80        .db $80
  $BD3B  C9 06     CMP #$06
  $BD3D  E0 0A     CPX #$0A
  $BD3F  02        .db $02
  $BD40  C0 01     CPY #$01
  $BD42  25 05     AND $05
  $BD44  01 62     ORA ($62,X)
  $BD46  82        .db $82
  $BD47  04        .db $04
  $BD48  03        .db $03
  $BD49  3F        .db $3F
  $BD4A  80        .db $80
  $BD4B  4D 00 04  EOR $0400
  $BD4E  03        .db $03
  $BD4F  35 80     AND $80,X
  $BD51  05 01     ORA $01
  $BD53  F0 80     BEQ $BCD5
  $BD55  4D 00 05  EOR $0500
  $BD58  03        .db $03
  $BD59  33        .db $33
  $BD5A  80        .db $80
  $BD5B  05 06     ORA $06
  $BD5D  30 0A     BMI $BD69
  $BD5F  02        .db $02
  $BD60  00        BRK
  $BD61  03        .db $03
  $BD62  37        .db $37
  $BD63  01 FF     ORA ($FF,X)
  $BD65  80        .db $80
  $BD66  8E 00 02  STX $0200

L_BD69:
  $BD69  03        .db $03
  $BD6A  3C        .db $3C
  $BD6B  80        .db $80
  $BD6C  03        .db $03
  $BD6D  03        .db $03
  $BD6E  38        SEC
  $BD6F  80        .db $80
  $BD70  47        .db $47
  $BD71  00        BRK
  $BD72  06 03     ASL $03
  $BD74  3F        .db $3F
  $BD75  80        .db $80
  $BD76  04        .db $04
  $BD77  06 E0     ASL $E0
  $BD79  02        .db $02
  $BD7A  00        BRK
  $BD7B  05 03     ORA $03
  $BD7D  3F        .db $3F
  $BD7E  02        .db $02
  $BD7F  80        .db $80
  $BD80  80        .db $80
  $BD81  FE 00 05  INC $0500,X
  $BD84  81 53     STA ($53,X)
  $BD86  00        BRK
  $BD87  05 81     ORA $81
  $BD89  93        .db $93
  $BD8A  00        BRK
  $BD8B  05 80     ORA $80
  $BD8D  7F        .db $7F
  $BD8E  06 E0     ASL $E0
  $BD90  08        PHP
  $BD91  00        BRK
  $BD92  07        .db $07
  $BD93  03        .db $03
  $BD94  3F        .db $3F
  $BD95  80        .db $80
  $BD96  0F        .db $0F
  $BD97  06 80     ASL $80
  $BD99  0A        ASL
  $BD9A  02        .db $02
  $BD9B  80        .db $80
  $BD9C  03        .db $03
  $BD9D  3F        .db $3F
  $BD9E  05 03     ORA $03
  $BDA0  85 81     STA $81
  $BDA2  02        .db $02
  $BDA3  01 B1     ORA ($B1,X)
  $BDA5  80        .db $80
  $BDA6  B3        .db $B3
  $BDA7  00        BRK
  $BDA8  06 02     ASL $02
  $BDAA  80        .db $80
  $BDAB  05 03     ORA $03
  $BDAD  85 81     STA $81
  $BDAF  02        .db $02
  $BDB0  80        .db $80
  $BDB1  09 04     ORA #$04
  $BDB3  1E 9A BD  ASL $BD9A,X
  $BDB6  06 30     ASL $30
  $BDB8  0A        ASL
  $BDB9  02        .db $02
  $BDBA  40        RTI
  $BDBB  03        .db $03
  $BDBC  3F        .db $3F
  $BDBD  01 F6     ORA ($F6,X)
  $BDBF  80        .db $80
  $BDC0  6A        ROR
  $BDC1  00        BRK
  $BDC2  03        .db $03
  $BDC3  03        .db $03
  $BDC4  34        .db $34
  $BDC5  80        .db $80
  $BDC6  08        PHP
  $BDC7  04        .db $04
  $BDC8  02        .db $02
  $BDC9  B9 BD 06  LDA $06BD,Y
  $BDCC  30 0A     BMI $BDD8
  $BDCE  02        .db $02
  $BDCF  40        RTI
  $BDD0  03        .db $03
  $BDD1  3F        .db $3F
  $BDD2  01 F6     ORA ($F6,X)
  $BDD4  80        .db $80
  $BDD5  64        .db $64
  $BDD6  00        BRK
  $BDD7  03        .db $03

L_BDD8:
  $BDD8  03        .db $03
  $BDD9  38        SEC
  $BDDA  80        .db $80
  $BDDB  0A        ASL
  $BDDC  04        .db $04
  $BDDD  02        .db $02
  $BDDE  CE BD 06  DEC $06BD
  $BDE1  30 0A     BMI $BDED
  $BDE3  02        .db $02
  $BDE4  40        RTI
  $BDE5  03        .db $03
  $BDE6  3F        .db $3F
  $BDE7  01 F1     ORA ($F1,X)
  $BDE9  80        .db $80
  $BDEA  5F        .db $5F
  $BDEB  00        BRK
  $BDEC  03        .db $03

L_BDED:
  $BDED  03        .db $03
  $BDEE  38        SEC
  $BDEF  80        .db $80
  $BDF0  0E 04 03  ASL $0304
  $BDF3  E3        .db $E3
  $BDF4  BD 06 30  LDA $3006,X
  $BDF7  0A        ASL
  $BDF8  02        .db $02
  $BDF9  C0 03     CPY #$03
  $BDFB  3F        .db $3F
  $BDFC  86 4E     STX $4E
  $BDFE  00        BRK
  $BDFF  03        .db $03
  $BE00  02        .db $02
  $BE01  80        .db $80
  $BE02  03        .db $03
  $BE03  3F        .db $3F
  $BE04  80        .db $80
  $BE05  0B        .db $0B
  $BE06  01 02     ORA ($02,X)
  $BE08  86 4E     STX $4E
  $BE0A  00        BRK
  $BE0B  04        .db $04
  $BE0C  02        .db $02
  $BE0D  00        BRK
  $BE0E  80        .db $80
  $BE0F  0F        .db $0F
  $BE10  04        .db $04
  $BE11  0A        ASL
  $BE12  06 BE     ASL $BE
  $BE14  06 60     ASL $60
  $BE16  0E 02 C0  ASL $C002
  $BE19  01 B1     ORA ($B1,X)
  $BE1B  03        .db $03
  $BE1C  3F        .db $3F
  $BE1D  05 02     ORA $02
  $BE1F  A7        .db $A7
  $BE20  82        .db $82
  $BE21  05 81     ORA $81
  $BE23  FC        .db $FC
  $BE24  01 81     ORA ($81,X)
  $BE26  03        .db $03
  $BE27  81 81     STA ($81,X)
  $BE29  AB        .db $AB
  $BE2A  00        BRK
  $BE2B  04        .db $04
  $BE2C  02        .db $02
  $BE2D  80        .db $80
  $BE2E  80        .db $80
  $BE2F  0D 04 01  ORA $0104
  $BE32  17        .db $17
  $BE33  BE 06 F0  LDX $F006,Y
  $BE36  03        .db $03
  $BE37  01 C1     ORA ($C1,X)
  $BE39  03        .db $03
  $BE3A  3F        .db $3F
  $BE3B  80        .db $80
  $BE3C  1A        .db $1A
  $BE3D  00        BRK
  $BE3E  03        .db $03
  $BE3F  01 C1     ORA ($C1,X)
  $BE41  03        .db $03
  $BE42  3F        .db $3F
  $BE43  80        .db $80
  $BE44  1E 04 01  ASL $0104,X
  $BE47  37        .db $37
  $BE48  BE 02 80  LDX $8002,Y
  $BE4B  03        .db $03
  $BE4C  3F        .db $3F
  $BE4D  81 AB     STA ($AB,X)
  $BE4F  00        BRK
  $BE50  08        PHP
  $BE51  03        .db $03
  $BE52  3F        .db $3F
  $BE53  80        .db $80
  $BE54  F0 03     BEQ $BE59
  $BE56  3C        .db $3C
  $BE57  81 AB     STA ($AB,X)

L_BE59:
  $BE59  00        BRK
  $BE5A  08        PHP
  $BE5B  03        .db $03
  $BE5C  3C        .db $3C
  $BE5D  80        .db $80
  $BE5E  F0 03     BEQ $BE63
  $BE60  39 81 AB  AND $AB81,Y

L_BE63:
  $BE63  00        BRK
  $BE64  08        PHP
  $BE65  03        .db $03
  $BE66  39 80 F0  AND $F080,Y
  $BE69  03        .db $03
  $BE6A  36 81     ROL $81,X
  $BE6C  AB        .db $AB
  $BE6D  00        BRK
  $BE6E  08        PHP
  $BE6F  03        .db $03
  $BE70  36 80     ROL $80,X
  $BE72  F0 03     BEQ $BE77
  $BE74  34        .db $34
  $BE75  81 AB     STA ($AB,X)

L_BE77:
  $BE77  00        BRK
  $BE78  08        PHP
  $BE79  03        .db $03
  $BE7A  34        .db $34
  $BE7B  80        .db $80
  $BE7C  F0 03     BEQ $BE81
  $BE7E  32        .db $32
  $BE7F  81 AB     STA ($AB,X)

L_BE81:
  $BE81  00        BRK
  $BE82  08        PHP
  $BE83  03        .db $03
  $BE84  33        .db $33
  $BE85  80        .db $80
  $BE86  F0 06     BEQ $BE8E
  $BE88  80        .db $80
  $BE89  0A        ASL
  $BE8A  01 60     ORA ($60,X)
  $BE8C  05 01     ORA $01

L_BE8E:
  $BE8E  21 82     AND ($82,X)
  $BE90  05 03     ORA $03
  $BE92  39 81 FC  AND $FC81,Y
  $BE95  00        BRK
  $BE96  06 03     ASL $03
  $BE98  3F        .db $3F
  $BE99  80        .db $80
  $BE9A  07        .db $07
  $BE9B  01 30     ORA ($30,X)
  $BE9D  80        .db $80
  $BE9E  38        SEC
  $BE9F  00        BRK
  $BEA0  17        .db $17
  $BEA1  80        .db $80
  $BEA2  03        .db $03
  $BEA3  06 60     ASL $60
  $BEA5  0A        ASL
  $BEA6  02        .db $02
  $BEA7  80        .db $80
  $BEA8  03        .db $03
  $BEA9  3F        .db $3F
  $BEAA  01 FE     ORA ($FE,X)
  $BEAC  81 FC     STA ($FC,X)
  $BEAE  00        BRK
  $BEAF  30 03     BMI $BEB4
  $BEB1  3F        .db $3F
  $BEB2  05 04     ORA $04

L_BEB4:
  $BEB4  43        .db $43
  $BEB5  80        .db $80
  $BEB6  00        BRK
  $BEB7  01 FE     ORA ($FE,X)
  $BEB9  80        .db $80
  $BEBA  0A        ASL
  $BEBB  06 D0     ASL $D0
  $BEBD  02        .db $02
  $BEBE  00        BRK
  $BEBF  03        .db $03
  $BEC0  02        .db $02
  $BEC1  80        .db $80
  $BEC2  01 C1     ORA ($C1,X)
  $BEC4  03        .db $03
  $BEC5  3F        .db $3F
  $BEC6  80        .db $80
  $BEC7  1F        .db $1F
  $BEC8  04        .db $04
  $BEC9  01 BE     ORA ($BE,X)
  $BECB  BE 00 08  LDX $0800,Y
  $BECE  01 F8     ORA ($F8,X)
  $BED0  03        .db $03
  $BED1  3F        .db $3F
  $BED2  80        .db $80
  $BED3  3F        .db $3F
  $BED4  00        BRK
  $BED5  08        PHP
  $BED6  03        .db $03
  $BED7  3C        .db $3C
  $BED8  80        .db $80
  $BED9  3F        .db $3F
  $BEDA  00        BRK
  $BEDB  08        PHP
  $BEDC  03        .db $03
  $BEDD  3A        .db $3A
  $BEDE  80        .db $80
  $BEDF  3F        .db $3F
  $BEE0  00        BRK
  $BEE1  08        PHP
  $BEE2  03        .db $03
  $BEE3  36 80     ROL $80,X
  $BEE5  3F        .db $3F
  $BEE6  00        BRK
  $BEE7  08        PHP
  $BEE8  03        .db $03
  $BEE9  34        .db $34
  $BEEA  80        .db $80
  $BEEB  3F        .db $3F
  $BEEC  00        BRK
  $BEED  08        PHP
  $BEEE  03        .db $03
  $BEEF  33        .db $33
  $BEF0  80        .db $80
  $BEF1  3C        .db $3C
  $BEF2  06 D0     ASL $D0
  $BEF4  01 00     ORA ($00,X)
  $BEF6  03        .db $03
  $BEF7  02        .db $02
  $BEF8  80        .db $80
  $BEF9  01 C1     ORA ($C1,X)
  $BEFB  03        .db $03
  $BEFC  3F        .db $3F
  $BEFD  80        .db $80
  $BEFE  1F        .db $1F
  $BEFF  04        .db $04
  $BF00  01 F5     ORA ($F5,X)
  $BF02  BE 00 08  LDX $0800,Y
  $BF05  01 F8     ORA ($F8,X)
  $BF07  03        .db $03
  $BF08  3F        .db $3F
  $BF09  80        .db $80
  $BF0A  3F        .db $3F
  $BF0B  00        BRK
  $BF0C  08        PHP
  $BF0D  03        .db $03
  $BF0E  3C        .db $3C
  $BF0F  80        .db $80
  $BF10  3F        .db $3F
  $BF11  00        BRK
  $BF12  08        PHP
  $BF13  03        .db $03
  $BF14  3A        .db $3A
  $BF15  80        .db $80
  $BF16  3F        .db $3F
  $BF17  00        BRK
  $BF18  08        PHP
  $BF19  03        .db $03
  $BF1A  36 80     ROL $80,X
  $BF1C  3F        .db $3F
  $BF1D  00        BRK
  $BF1E  08        PHP
  $BF1F  03        .db $03
  $BF20  34        .db $34
  $BF21  80        .db $80
  $BF22  3F        .db $3F
  $BF23  00        BRK
  $BF24  08        PHP
  $BF25  03        .db $03
  $BF26  33        .db $33
  $BF27  80        .db $80
  $BF28  3F        .db $3F
  $BF29  06 40     ASL $40
  $BF2B  0A        ASL
  $BF2C  02        .db $02
  $BF2D  00        BRK
  $BF2E  01 F1     ORA ($F1,X)
  $BF30  03        .db $03
  $BF31  3E 81 7D  ROL $7D81,X
  $BF34  00        BRK
  $BF35  1D 03 3A  ORA $3A03,X
  $BF38  80        .db $80
  $BF39  06 06     ASL $06
  $BF3B  E0 08     CPX #$08
  $BF3D  00        BRK
  $BF3E  04        .db $04
  $BF3F  03        .db $03
  $BF40  36 80     ROL $80,X
  $BF42  04        .db $04
  $BF43  04        .db $04
  $BF44  02        .db $02
  $BF45  3D BF 06  AND $06BF,X
  $BF48  F0 03     BEQ $BF4D
  $BF4A  02        .db $02
  $BF4B  80        .db $80
  $BF4C  01 2F     ORA ($2F,X)
  $BF4E  03        .db $03
  $BF4F  3F        .db $3F
  $BF50  80        .db $80
  $BF51  35 00     AND $00,X
  $BF53  10 02     BPL $BF57
  $BF55  00        BRK
  $BF56  01 2F     ORA ($2F,X)
  $BF58  03        .db $03
  $BF59  3F        .db $3F
  $BF5A  80        .db $80
  $BF5B  3C        .db $3C
  $BF5C  03        .db $03
  $BF5D  3C        .db $3C
  $BF5E  80        .db $80
  $BF5F  35 00     AND $00,X
  $BF61  10 03     BPL $BF66
  $BF63  3C        .db $3C
  $BF64  80        .db $80
  $BF65  3C        .db $3C

L_BF66:
  $BF66  03        .db $03
  $BF67  39 80 35  AND $3580,Y
  $BF6A  00        BRK
  $BF6B  10 03     BPL $BF70
  $BF6D  39 80 3C  AND $3C80,Y

L_BF70:
  $BF70  03        .db $03
  $BF71  36 80     ROL $80,X
  $BF73  35 00     AND $00,X
  $BF75  10 03     BPL $BF7A
  $BF77  36 80     ROL $80,X
  $BF79  3C        .db $3C

L_BF7A:
  $BF7A  03        .db $03
  $BF7B  34        .db $34
  $BF7C  80        .db $80
  $BF7D  35 00     AND $00,X
  $BF7F  10 03     BPL $BF84
  $BF81  34        .db $34
  $BF82  80        .db $80
  $BF83  3C        .db $3C

L_BF84:
  $BF84  03        .db $03
  $BF85  32        .db $32
  $BF86  80        .db $80
  $BF87  35 00     AND $00,X
  $BF89  10 03     BPL $BF8E
  $BF8B  32        .db $32
  $BF8C  80        .db $80
  $BF8D  3C        .db $3C

L_BF8E:
  $BF8E  06 F0     ASL $F0
  $BF90  02        .db $02
  $BF91  00        BRK
  $BF92  03        .db $03
  $BF93  02        .db $02
  $BF94  C0 03     CPY #$03
  $BF96  3F        .db $3F
  $BF97  80        .db $80
  $BF98  64        .db $64
  $BF99  00        BRK
  $BF9A  03        .db $03
  $BF9B  80        .db $80
  $BF9C  59 00 03  EOR $0300,Y
  $BF9F  80        .db $80
  $BFA0  50 00     BVC $BFA2

L_BFA2:
  $BFA2  03        .db $03
  $BFA3  80        .db $80
  $BFA4  4B        .db $4B
  $BFA5  00        BRK
  $BFA6  03        .db $03
  $BFA7  80        .db $80
  $BFA8  43        .db $43
  $BFA9  00        BRK
  $BFAA  03        .db $03
  $BFAB  80        .db $80
  $BFAC  3C        .db $3C
  $BFAD  00        BRK
  $BFAE  03        .db $03
  $BFAF  80        .db $80
  $BFB0  35 00     AND $00,X
  $BFB2  03        .db $03
  $BFB3  80        .db $80
  $BFB4  32        .db $32
  $BFB5  00        BRK
  $BFB6  03        .db $03
  $BFB7  03        .db $03
  $BFB8  38        SEC
  $BFB9  80        .db $80
  $BFBA  64        .db $64
  $BFBB  00        BRK
  $BFBC  03        .db $03
  $BFBD  80        .db $80
  $BFBE  59 00 03  EOR $0300,Y
  $BFC1  80        .db $80
  $BFC2  50 00     BVC $BFC4

L_BFC4:
  $BFC4  03        .db $03
  $BFC5  80        .db $80
  $BFC6  4B        .db $4B
  $BFC7  00        BRK
  $BFC8  03        .db $03
  $BFC9  80        .db $80
  $BFCA  43        .db $43
  $BFCB  00        BRK
  $BFCC  03        .db $03
  $BFCD  80        .db $80
  $BFCE  3C        .db $3C
  $BFCF  00        BRK
  $BFD0  03        .db $03
  $BFD1  80        .db $80
  $BFD2  35 00     AND $00,X
  $BFD4  03        .db $03
  $BFD5  80        .db $80
  $BFD6  32        .db $32
  $BFD7  06 00     ASL $00
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