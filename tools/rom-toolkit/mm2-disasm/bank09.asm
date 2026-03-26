; Mega Man 2 — PRG Bank 9
; Base address: $8000
; Size: 16384 bytes


L_8000:
  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  00        BRK
  $8005  00        BRK
  $8006  00        BRK
  $8007  00        BRK
  $8008  00        BRK
  $8009  00        BRK
  $800A  00        BRK
  $800B  00        BRK
  $800C  00        BRK
  $800D  00        BRK
  $800E  00        BRK
  $800F  00        BRK
  $8010  00        BRK
  $8011  00        BRK
  $8012  00        BRK
  $8013  00        BRK
  $8014  00        BRK
  $8015  00        BRK
  $8016  00        BRK
  $8017  00        BRK
  $8018  00        BRK
  $8019  00        BRK
  $801A  00        BRK
  $801B  00        BRK
  $801C  00        BRK
  $801D  00        BRK
  $801E  00        BRK
  $801F  00        BRK
  $8020  00        BRK

L_8021:
  $8021  00        BRK
  $8022  00        BRK
  $8023  00        BRK
  $8024  00        BRK
  $8025  00        BRK
  $8026  00        BRK
  $8027  00        BRK
  $8028  00        BRK
  $8029  00        BRK
  $802A  00        BRK
  $802B  00        BRK
  $802C  00        BRK
  $802D  00        BRK
  $802E  00        BRK
  $802F  00        BRK
  $8030  00        BRK
  $8031  00        BRK
  $8032  00        BRK
  $8033  00        BRK
  $8034  00        BRK
  $8035  00        BRK
  $8036  00        BRK
  $8037  00        BRK
  $8038  00        BRK
  $8039  00        BRK
  $803A  00        BRK
  $803B  00        BRK
  $803C  00        BRK
  $803D  00        BRK
  $803E  00        BRK
  $803F  00        BRK

L_8040:
  $8040  FF        .db $FF
  $8041  FF        .db $FF
  $8042  FF        .db $FF
  $8043  FF        .db $FF
  $8044  FF        .db $FF
  $8045  FF        .db $FF
  $8046  FF        .db $FF
  $8047  FF        .db $FF
  $8048  FF        .db $FF
  $8049  FF        .db $FF
  $804A  FF        .db $FF
  $804B  FF        .db $FF
  $804C  FF        .db $FF
  $804D  FF        .db $FF
  $804E  FF        .db $FF
  $804F  FF        .db $FF
  $8050  FF        .db $FF
  $8051  FF        .db $FF
  $8052  FF        .db $FF
  $8053  FF        .db $FF
  $8054  FF        .db $FF
  $8055  FF        .db $FF
  $8056  FF        .db $FF
  $8057  FF        .db $FF
  $8058  FF        .db $FF
  $8059  FF        .db $FF
  $805A  FF        .db $FF
  $805B  FF        .db $FF
  $805C  FF        .db $FF
  $805D  FF        .db $FF
  $805E  FF        .db $FF
  $805F  FF        .db $FF
  $8060  FF        .db $FF
  $8061  FF        .db $FF
  $8062  FF        .db $FF
  $8063  FF        .db $FF
  $8064  FF        .db $FF
  $8065  FF        .db $FF
  $8066  FF        .db $FF
  $8067  FF        .db $FF
  $8068  FF        .db $FF
  $8069  FF        .db $FF
  $806A  FF        .db $FF
  $806B  FF        .db $FF
  $806C  FF        .db $FF
  $806D  FF        .db $FF
  $806E  FF        .db $FF
  $806F  FF        .db $FF
  $8070  FF        .db $FF
  $8071  FF        .db $FF
  $8072  FF        .db $FF
  $8073  FF        .db $FF
  $8074  FF        .db $FF
  $8075  FF        .db $FF
  $8076  FF        .db $FF
  $8077  FF        .db $FF
  $8078  FF        .db $FF
  $8079  FF        .db $FF
  $807A  FF        .db $FF
  $807B  FF        .db $FF
  $807C  FF        .db $FF
  $807D  FF        .db $FF
  $807E  FF        .db $FF
  $807F  FF        .db $FF
  $8080  00        BRK
  $8081  00        BRK
  $8082  7C        .db $7C
  $8083  7D 00 7D  ADC $7D00,X
  $8086  00        BRK
  $8087  00        BRK
  $8088  00        BRK
  $8089  00        BRK
  $808A  01 02     ORA ($02,X)
  $808C  7F        .db $7F
  $808D  7D 00 00  ADC $0000,X
  $8090  00        BRK
  $8091  00        BRK
  $8092  7C        .db $7C
  $8093  7D 00 7D  ADC $7D00,X
  $8096  00        BRK
  $8097  00        BRK
  $8098  00        BRK
  $8099  00        BRK
  $809A  01 02     ORA ($02,X)
  $809C  7F        .db $7F
  $809D  7D 00 00  ADC $0000,X
  $80A0  00        BRK
  $80A1  00        BRK
  $80A2  3E BE 00  ROL $00BE,X
  $80A5  BE 00 00  LDX $0000,Y
  $80A8  00        BRK
  $80A9  00        BRK
  $80AA  80        .db $80
  $80AB  40        RTI
  $80AC  FE BE 00  INC $00BE,X
  $80AF  00        BRK
  $80B0  00        BRK
  $80B1  00        BRK
  $80B2  3E BE 00  ROL $00BE,X
  $80B5  BE 00 00  LDX $0000,Y
  $80B8  00        BRK
  $80B9  00        BRK
  $80BA  80        .db $80
  $80BB  40        RTI
  $80BC  FE BE 00  INC $00BE,X
  $80BF  00        BRK
  $80C0  00        BRK
  $80C1  00        BRK
  $80C2  7C        .db $7C
  $80C3  7D 00 00  ADC $0000,X
  $80C6  00        BRK
  $80C7  00        BRK
  $80C8  03        .db $03
  $80C9  00        BRK
  $80CA  7D 7F 7F  ADC $7F7F,X
  $80CD  7D 00 03  ADC $0300,X
  $80D0  00        BRK
  $80D1  00        BRK
  $80D2  7C        .db $7C
  $80D3  7D 00 00  ADC $0000,X
  $80D6  00        BRK
  $80D7  00        BRK
  $80D8  03        .db $03
  $80D9  00        BRK
  $80DA  7D 7F 7F  ADC $7F7F,X
  $80DD  7D 00 03  ADC $0300,X

L_80E0:
  $80E0  00        BRK
  $80E1  00        BRK
  $80E2  3E BE 00  ROL $00BE,X
  $80E5  00        BRK
  $80E6  00        BRK
  $80E7  00        BRK
  $80E8  C0 00     CPY #$00
  $80EA  BE FE FE  LDX $FEFE,Y
  $80ED  BE 00 C0  LDX $C000,Y
  $80F0  00        BRK
  $80F1  00        BRK
  $80F2  3E BE 00  ROL $00BE,X
  $80F5  00        BRK
  $80F6  00        BRK
  $80F7  00        BRK
  $80F8  C0 00     CPY #$00
  $80FA  BE FE FE  LDX $FEFE,Y
  $80FD  BE 00 C0  LDX $C000,Y
  $8100  01 41     ORA ($41,X)
  $8102  21 1B     AND ($1B,X)
  $8104  1F        .db $1F
  $8105  0F        .db $0F
  $8106  1B        .db $1B
  $8107  FF        .db $FF
  $8108  01 41     ORA ($41,X)
  $810A  21 1B     AND ($1B,X)
  $810C  1F        .db $1F
  $810D  0D 1F FF  ORA $FF1F
  $8110  1F        .db $1F
  $8111  0F        .db $0F
  $8112  1F        .db $1F
  $8113  1B        .db $1B
  $8114  21 41     AND ($41,X)
  $8116  01 00     ORA ($00,X)
  $8118  1F        .db $1F
  $8119  0F        .db $0F

L_811A:
  $811A  1F        .db $1F
  $811B  1B        .db $1B
  $811C  21 41     AND ($41,X)
  $811E  01 00     ORA ($00,X)
  $8120  00        BRK
  $8121  04        .db $04
  $8122  08        PHP
  $8123  B0 F0     BCS $8115
  $8125  E0 F0     CPX #$F0
  $8127  FE 00 04  INC $0400,X
  $812A  08        PHP
  $812B  B0 F0     BCS $811D
  $812D  E0 F0     CPX #$F0
  $812F  FE F0 E0  INC $E0F0,X
  $8132  F0 B0     BEQ $80E4
  $8134  08        PHP
  $8135  04        .db $04
  $8136  00        BRK
  $8137  00        BRK
  $8138  F0 E0     BEQ $811A
  $813A  F0 B0     BEQ $80EC
  $813C  08        PHP
  $813D  04        .db $04
  $813E  00        BRK
  $813F  00        BRK
  $8140  FD CE CE  SBC $CECE,X
  $8143  87        .db $87
  $8144  E7        .db $E7
  $8145  87        .db $87
  $8146  85 80     STA $80
  $8148  3D 4E 4E  AND $4E4E,X
  $814B  87        .db $87
  $814C  07        .db $07
  $814D  87        .db $87
  $814E  87        .db $87
  $814F  80        .db $80
  $8150  87        .db $87
  $8151  87        .db $87
  $8152  85 84     STA $84
  $8154  E4 C8     CPX $C8
  $8156  C8        INY
  $8157  F0 87     BEQ $80E0
  $8159  87        .db $87
  $815A  87        .db $87
  $815B  87        .db $87
  $815C  07        .db $07
  $815D  4E 4E 3D  LSR $3D4E
  $8160  57        .db $57
  $8161  00        BRK
  $8162  F9 7C 01  SBC $017C,Y
  $8165  7D 7C 7C  ADC $7C7C,X
  $8168  F0 03     BEQ $816D
  $816A  FB        .db $FB
  $816B  7C        .db $7C
  $816C  01 7D     ORA ($7D,X)
  $816E  7D 7C 55  ADC $557C,X

L_8171:
  $8171  00        BRK
  $8172  7C        .db $7C
  $8173  54        .db $54
  $8174  00        BRK
  $8175  00        BRK
  $8176  00        BRK
  $8177  07        .db $07
  $8178  7D 01 7D  ADC $7D01,X
  $817B  7C        .db $7C
  $817C  7D 03 F8  ADC $F803,X
  $817F  50 F0     BVC $8171
  $8181  07        .db $07
  $8182  00        BRK
  $8183  07        .db $07
  $8184  00        BRK
  $8185  13        .db $13
  $8186  16 14     ASL $14,X
  $8188  00        BRK
  $8189  F4        .db $F4
  $818A  F0 F4     BEQ $8180
  $818C  C0 D0     CPY #$D0
  $818E  C1 C3     CMP ($C3,X)
  $8190  04        .db $04
  $8191  10 30     BPL $81C3
  $8193  07        .db $07

L_8194:
  $8194  00        BRK
  $8195  07        .db $07
  $8196  00        BRK
  $8197  F7        .db $F7
  $8198  D3        .db $D3
  $8199  D3        .db $D3
  $819A  C0 F4     CPY #$F4
  $819C  F0 F4     BEQ $8192
  $819E  F0 F4     BEQ $8194
  $81A0  3F        .db $3F
  $81A1  60        RTS
  $81A2  20 60 04  JSR $0460
  $81A5  94 14     STY $14,X
  $81A7  14        .db $14
  $81A8  00        BRK
  $81A9  DF        .db $DF
  $81AA  1F        .db $1F
  $81AB  DF        .db $DF
  $81AC  03        .db $03
  $81AD  13        .db $13
  $81AE  C3        .db $C3
  $81AF  C3        .db $C3
  $81B0  04        .db $04
  $81B1  14        .db $14
  $81B2  3C        .db $3C
  $81B3  60        RTS
  $81B4  20 60 20  JSR $2060
  $81B7  7F        .db $7F
  $81B8  D3        .db $D3
  $81B9  93        .db $93
  $81BA  03        .db $03
  $81BB  DF        .db $DF
  $81BC  1F        .db $1F
  $81BD  DF        .db $DF
  $81BE  1F        .db $1F
  $81BF  FF        .db $FF

L_81C0:
  $81C0  F0 07     BEQ $81C9
  $81C2  00        BRK

L_81C3:
  $81C3  07        .db $07
  $81C4  00        BRK
  $81C5  13        .db $13
  $81C6  16 14     ASL $14,X
  $81C8  00        BRK

L_81C9:
  $81C9  F4        .db $F4
  $81CA  F0 F4     BEQ $81C0
  $81CC  C0 D0     CPY #$D0
  $81CE  C1 C3     CMP ($C3,X)
  $81D0  04        .db $04
  $81D1  10 00     BPL $81D3

L_81D3:
  $81D3  FF        .db $FF
  $81D4  88        DEY
  $81D5  88        DEY
  $81D6  88        DEY
  $81D7  88        DEY
  $81D8  D3        .db $D3
  $81D9  D3        .db $D3
  $81DA  00        BRK
  $81DB  00        BRK
  $81DC  00        BRK
  $81DD  33        .db $33
  $81DE  11 00     ORA ($00),Y
  $81E0  3F        .db $3F
  $81E1  60        RTS
  $81E2  20 60 04  JSR $0460
  $81E5  94 14     STY $14,X
  $81E7  14        .db $14
  $81E8  00        BRK
  $81E9  DF        .db $DF
  $81EA  1F        .db $1F
  $81EB  DF        .db $DF
  $81EC  03        .db $03
  $81ED  13        .db $13
  $81EE  C3        .db $C3
  $81EF  C3        .db $C3
  $81F0  04        .db $04
  $81F1  14        .db $14
  $81F2  00        BRK
  $81F3  FF        .db $FF
  $81F4  88        DEY
  $81F5  88        DEY
  $81F6  88        DEY
  $81F7  88        DEY
  $81F8  D3        .db $D3
  $81F9  93        .db $93
  $81FA  00        BRK
  $81FB  00        BRK
  $81FC  00        BRK
  $81FD  33        .db $33
  $81FE  11 00     ORA ($00),Y
  $8200  00        BRK
  $8201  FF        .db $FF
  $8202  04        .db $04
  $8203  FF        .db $FF
  $8204  00        BRK
  $8205  FF        .db $FF
  $8206  04        .db $04
  $8207  FF        .db $FF
  $8208  00        BRK
  $8209  00        BRK
  $820A  FC        .db $FC
  $820B  FF        .db $FF
  $820C  00        BRK
  $820D  00        BRK
  $820E  FC        .db $FC
  $820F  FF        .db $FF
  $8210  00        BRK
  $8211  FF        .db $FF
  $8212  04        .db $04
  $8213  FF        .db $FF
  $8214  00        BRK
  $8215  FF        .db $FF
  $8216  04        .db $04
  $8217  FF        .db $FF
  $8218  00        BRK
  $8219  00        BRK
  $821A  FC        .db $FC
  $821B  FF        .db $FF
  $821C  00        BRK
  $821D  00        BRK
  $821E  FC        .db $FC
  $821F  FF        .db $FF
  $8220  00        BRK

L_8221:
  $8221  FE 02 FE  INC $FE02,X
  $8224  00        BRK
  $8225  FE 02 FE  INC $FE02,X
  $8228  00        BRK
  $8229  02        .db $02
  $822A  7E FE 00  ROR $00FE,X
  $822D  02        .db $02
  $822E  7E FE 00  ROR $00FE,X
  $8231  FE 02 FE  INC $FE02,X
  $8234  00        BRK
  $8235  FE 02 FE  INC $FE02,X
  $8238  00        BRK
  $8239  02        .db $02
  $823A  7E FE 00  ROR $00FE,X
  $823D  02        .db $02
  $823E  7E FE BC  ROR $BCFE,X
  $8241  BC A0 BC  LDY $BCA0,X
  $8244  BC BC A0  LDY $A0BC,X
  $8247  BC C3 C3  LDY $C3C3,X
  $824A  E1 C3     SBC ($C3,X)
  $824C  C3        .db $C3
  $824D  C3        .db $C3
  $824E  E1 C3     SBC ($C3,X)
  $8250  BC BC A0  LDY $A0BC,X
  $8253  AD A0 AD  LDA $ADA0
  $8256  A0 BC     LDY #$BC
  $8258  C3        .db $C3
  $8259  C3        .db $C3
  $825A  E0 F3     CPX #$F3
  $825C  E0 F3     CPX #$F3
  $825E  E0 C3     CPX #$C3
  $8260  00        BRK
  $8261  60        RTS
  $8262  60        RTS
  $8263  60        RTS
  $8264  00        BRK
  $8265  60        RTS
  $8266  60        RTS
  $8267  60        RTS
  $8268  06 10     ASL $10
  $826A  16 16     ASL $16,X
  $826C  06 10     ASL $10
  $826E  16 16     ASL $16,X
  $8270  00        BRK
  $8271  60        RTS
  $8272  60        RTS
  $8273  E0 E0     CPX #$E0
  $8275  E0 60     CPX #$60
  $8277  60        RTS
  $8278  06 10     ASL $10
  $827A  16 16     ASL $16,X
  $827C  16 16     ASL $16,X
  $827E  16 16     ASL $16,X

L_8280:
  $8280  BC BC A0  LDY $A0BC,X
  $8283  BC BC BC  LDY $BCBC,X
  $8286  BC BF C3  LDY $C3BF,X
  $8289  C3        .db $C3
  $828A  E1 C3     SBC ($C3,X)
  $828C  C3        .db $C3
  $828D  C3        .db $C3
  $828E  C3        .db $C3
  $828F  C0 A3     CPY #$A3
  $8291  99 99 81  STA $8199,Y
  $8294  80        .db $80
  $8295  80        .db $80
  $8296  C0 7F     CPY #$7F
  $8298  C0 C4     CPY #$C4
  $829A  C4 DC     CPY $DC
  $829C  E3        .db $E3
  $829D  FF        .db $FF
  $829E  FF        .db $FF
  $829F  7F        .db $7F
  $82A0  00        BRK
  $82A1  60        RTS
  $82A2  60        RTS
  $82A3  60        RTS
  $82A4  60        RTS
  $82A5  60        RTS
  $82A6  00        BRK
  $82A7  00        BRK
  $82A8  06 10     ASL $10
  $82AA  16 16     ASL $16,X
  $82AC  16 17     ASL $17,X
  $82AE  00        BRK
  $82AF  FF        .db $FF
  $82B0  F7        .db $F7
  $82B1  F7        .db $F7
  $82B2  F7        .db $F7
  $82B3  F7        .db $F7
  $82B4  00        BRK
  $82B5  00        BRK
  $82B6  00        BRK
  $82B7  FF        .db $FF
  $82B8  00        BRK
  $82B9  00        BRK
  $82BA  00        BRK
  $82BB  00        BRK
  $82BC  F7        .db $F7
  $82BD  FF        .db $FF
  $82BE  FF        .db $FF
  $82BF  FF        .db $FF
  $82C0  00        BRK
  $82C1  88        DEY
  $82C2  88        DEY
  $82C3  FF        .db $FF
  $82C4  00        BRK
  $82C5  00        BRK
  $82C6  00        BRK
  $82C7  00        BRK
  $82C8  00        BRK
  $82C9  88        DEY
  $82CA  88        DEY
  $82CB  FF        .db $FF
  $82CC  00        BRK
  $82CD  FF        .db $FF

L_82CE:
  $82CE  70 07     BVS $82D7
  $82D0  07        .db $07
  $82D1  57        .db $57
  $82D2  57        .db $57
  $82D3  07        .db $07
  $82D4  50 F8     BVC $82CE
  $82D6  00        BRK

L_82D7:
  $82D7  FF        .db $FF
  $82D8  50 00     BVC $82DA

L_82DA:
  $82DA  00        BRK
  $82DB  50 57     BVC $8334
  $82DD  07        .db $07
  $82DE  FF        .db $FF
  $82DF  FF        .db $FF
  $82E0  00        BRK
  $82E1  88        DEY
  $82E2  88        DEY
  $82E3  FF        .db $FF
  $82E4  00        BRK
  $82E5  00        BRK
  $82E6  00        BRK
  $82E7  00        BRK
  $82E8  00        BRK
  $82E9  88        DEY
  $82EA  88        DEY
  $82EB  FF        .db $FF
  $82EC  00        BRK
  $82ED  FF        .db $FF
  $82EE  00        BRK
  $82EF  FF        .db $FF
  $82F0  77        .db $77
  $82F1  77        .db $77
  $82F2  77        .db $77
  $82F3  77        .db $77
  $82F4  00        BRK
  $82F5  00        BRK
  $82F6  00        BRK
  $82F7  FF        .db $FF
  $82F8  00        BRK
  $82F9  00        BRK
  $82FA  00        BRK
  $82FB  00        BRK
  $82FC  77        .db $77
  $82FD  77        .db $77
  $82FE  FF        .db $FF
  $82FF  FF        .db $FF
  $8300  00        BRK
  $8301  FF        .db $FF
  $8302  FF        .db $FF
  $8303  FF        .db $FF
  $8304  FF        .db $FF
  $8305  FD FD FD  SBC $FDFD,X
  $8308  00        BRK
  $8309  FF        .db $FF
  $830A  FF        .db $FF
  $830B  83        .db $83
  $830C  82        .db $82
  $830D  80        .db $80
  $830E  80        .db $80
  $830F  80        .db $80
  $8310  FD FC FC  SBC $FCFC,X
  $8313  FC        .db $FC
  $8314  FD FD FF  SBC $FFFD,X
  $8317  FF        .db $FF
  $8318  80        .db $80
  $8319  80        .db $80
  $831A  80        .db $80
  $831B  80        .db $80
  $831C  80        .db $80
  $831D  80        .db $80
  $831E  80        .db $80
  $831F  80        .db $80
  $8320  00        BRK
  $8321  FF        .db $FF
  $8322  E0 80     CPX #$80
  $8324  E0 BF     CPX #$BF
  $8326  FF        .db $FF
  $8327  FF        .db $FF
  $8328  00        BRK
  $8329  FF        .db $FF
  $832A  FF        .db $FF
  $832B  FF        .db $FF
  $832C  1F        .db $1F
  $832D  4A        LSR
  $832E  49 49     EOR #$49

L_8330:
  $8330  FF        .db $FF
  $8331  FF        .db $FF
  $8332  FF        .db $FF
  $8333  FF        .db $FF

L_8334:
  $8334  FF        .db $FF
  $8335  FF        .db $FF
  $8336  FF        .db $FF
  $8337  FF        .db $FF
  $8338  19 FF 0F  ORA $0FFF,Y
  $833B  0F        .db $0F
  $833C  07        .db $07
  $833D  06 02     ASL $02
  $833F  00        BRK
  $8340  00        BRK
  $8341  FF        .db $FF
  $8342  07        .db $07
  $8343  03        .db $03
  $8344  07        .db $07
  $8345  FF        .db $FF
  $8346  FF        .db $FF
  $8347  FF        .db $FF
  $8348  00        BRK
  $8349  FF        .db $FF
  $834A  FF        .db $FF
  $834B  FC        .db $FC
  $834C  F8        SED
  $834D  78        SEI
  $834E  F0 E0     BEQ $8330
  $8350  FF        .db $FF
  $8351  FF        .db $FF
  $8352  FF        .db $FF
  $8353  FE FE FC  INC $FCFE,X
  $8356  F8        SED
  $8357  F8        SED
  $8358  60        RTS
  $8359  C0 80     CPY #$80
  $835B  80        .db $80
  $835C  00        BRK
  $835D  00        BRK
  $835E  00        BRK
  $835F  00        BRK
  $8360  00        BRK
  $8361  FF        .db $FF
  $8362  FF        .db $FF
  $8363  FF        .db $FF
  $8364  FF        .db $FF
  $8365  E1 E3     SBC ($E3,X)
  $8367  C3        .db $C3
  $8368  00        BRK
  $8369  FF        .db $FF
  $836A  FF        .db $FF
  $836B  07        .db $07
  $836C  0F        .db $0F
  $836D  01 03     ORA ($03,X)
  $836F  03        .db $03
  $8370  87        .db $87
  $8371  87        .db $87
  $8372  07        .db $07
  $8373  03        .db $03
  $8374  23        .db $23
  $8375  23        .db $23
  $8376  63        .db $63
  $8377  E3        .db $E3
  $8378  07        .db $07
  $8379  0F        .db $0F
  $837A  0F        .db $0F
  $837B  1F        .db $1F
  $837C  3F        .db $3F
  $837D  3F        .db $3F
  $837E  7F        .db $7F
  $837F  FF        .db $FF
  $8380  FF        .db $FF
  $8381  FF        .db $FF
  $8382  FE FE FC  INC $FCFE,X
  $8385  FC        .db $FC
  $8386  C1 C1     CMP ($C1,X)
  $8388  80        .db $80
  $8389  80        .db $80

L_838A:
  $838A  80        .db $80
  $838B  80        .db $80
  $838C  80        .db $80
  $838D  80        .db $80
  $838E  C1 C1     CMP ($C1,X)
  $8390  F0 F8     BEQ $838A
  $8392  FC        .db $FC
  $8393  FE FF EF  INC $EFFF,X
  $8396  CF        .db $CF
  $8397  FF        .db $FF
  $8398  FF        .db $FF
  $8399  FF        .db $FF
  $839A  FF        .db $FF
  $839B  FF        .db $FF
  $839C  FF        .db $FF
  $839D  CF        .db $CF
  $839E  CF        .db $CF
  $839F  FF        .db $FF

L_83A0:
  $83A0  7F        .db $7F
  $83A1  7F        .db $7F
  $83A2  7F        .db $7F

L_83A3:
  $83A3  7F        .db $7F
  $83A4  FF        .db $FF
  $83A5  FF        .db $FF
  $83A6  FF        .db $FF
  $83A7  FE 00 00  INC $0000,X
  $83AA  40        RTI
  $83AB  40        RTI
  $83AC  E0 E0     CPX #$E0
  $83AE  F0 F0     BEQ $83A0
  $83B0  FE 7C 1E  INC $1E7C,X
  $83B3  00        BRK
  $83B4  80        .db $80
  $83B5  E0 FF     CPX #$FF
  $83B7  FF        .db $FF
  $83B8  F8        SED
  $83B9  F8        SED
  $83BA  FE FE FF  INC $FFFE,X
  $83BD  FF        .db $FF
  $83BE  FF        .db $FF
  $83BF  FF        .db $FF
  $83C0  F0 E1     BEQ $83A3
  $83C2  E3        .db $E3
  $83C3  C3        .db $C3
  $83C4  87        .db $87
  $83C5  8F        .db $8F
  $83C6  0F        .db $0F
  $83C7  1F        .db $1F
  $83C8  00        BRK
  $83C9  01 03     ORA ($03,X)
  $83CB  03        .db $03
  $83CC  07        .db $07
  $83CD  0F        .db $0F
  $83CE  0F        .db $0F
  $83CF  1F        .db $1F
  $83D0  3F        .db $3F
  $83D1  3E 78 00  ROL $0078,X
  $83D4  01 07     ORA ($07,X)
  $83D6  FF        .db $FF
  $83D7  FF        .db $FF
  $83D8  3F        .db $3F
  $83D9  3F        .db $3F
  $83DA  7F        .db $7F
  $83DB  FF        .db $FF
  $83DC  FF        .db $FF
  $83DD  FF        .db $FF
  $83DE  FF        .db $FF
  $83DF  FF        .db $FF
  $83E0  E3        .db $E3
  $83E1  E3        .db $E3
  $83E2  E3        .db $E3
  $83E3  E3        .db $E3
  $83E4  E3        .db $E3
  $83E5  C7        .db $C7
  $83E6  C7        .db $C7
  $83E7  8F        .db $8F
  $83E8  FF        .db $FF
  $83E9  FF        .db $FF
  $83EA  FF        .db $FF
  $83EB  FF        .db $FF
  $83EC  FF        .db $FF
  $83ED  FF        .db $FF
  $83EE  FF        .db $FF
  $83EF  FF        .db $FF
  $83F0  0F        .db $0F
  $83F1  1F        .db $1F
  $83F2  3F        .db $3F
  $83F3  7F        .db $7F
  $83F4  FF        .db $FF
  $83F5  FD F9 FF  SBC $FFF9,X
  $83F8  FF        .db $FF
  $83F9  FF        .db $FF
  $83FA  FF        .db $FF
  $83FB  FF        .db $FF
  $83FC  FF        .db $FF
  $83FD  F9 F9 FF  SBC $FFF9,Y
  $8400  00        BRK
  $8401  7E 7C 78  ROR $787C,X
  $8404  70 60     BVS $8466
  $8406  40        RTI
  $8407  00        BRK
  $8408  00        BRK
  $8409  00        BRK
  $840A  02        .db $02
  $840B  06 0E     ASL $0E
  $840D  1E 3E 00  ASL $003E,X
  $8410  FF        .db $FF
  $8411  FF        .db $FF
  $8412  FF        .db $FF
  $8413  FF        .db $FF
  $8414  FF        .db $FF
  $8415  FF        .db $FF
  $8416  FF        .db $FF
  $8417  FF        .db $FF
  $8418  FF        .db $FF
  $8419  FF        .db $FF
  $841A  FF        .db $FF
  $841B  FF        .db $FF
  $841C  FF        .db $FF
  $841D  FF        .db $FF
  $841E  FF        .db $FF
  $841F  FF        .db $FF
  $8420  00        BRK
  $8421  00        BRK
  $8422  00        BRK
  $8423  00        BRK
  $8424  00        BRK
  $8425  00        BRK
  $8426  00        BRK
  $8427  00        BRK
  $8428  00        BRK
  $8429  00        BRK
  $842A  00        BRK
  $842B  00        BRK
  $842C  00        BRK
  $842D  00        BRK
  $842E  00        BRK
  $842F  00        BRK
  $8430  00        BRK
  $8431  00        BRK
  $8432  00        BRK
  $8433  00        BRK
  $8434  00        BRK
  $8435  00        BRK
  $8436  00        BRK
  $8437  00        BRK
  $8438  00        BRK
  $8439  00        BRK
  $843A  00        BRK
  $843B  00        BRK
  $843C  00        BRK
  $843D  00        BRK
  $843E  00        BRK
  $843F  00        BRK
  $8440  00        BRK
  $8441  00        BRK
  $8442  00        BRK
  $8443  00        BRK
  $8444  00        BRK
  $8445  00        BRK
  $8446  00        BRK
  $8447  00        BRK
  $8448  00        BRK
  $8449  00        BRK
  $844A  00        BRK
  $844B  00        BRK
  $844C  00        BRK
  $844D  00        BRK
  $844E  00        BRK
  $844F  00        BRK
  $8450  00        BRK
  $8451  00        BRK
  $8452  00        BRK
  $8453  00        BRK
  $8454  00        BRK
  $8455  00        BRK
  $8456  00        BRK
  $8457  00        BRK
  $8458  00        BRK
  $8459  00        BRK
  $845A  00        BRK
  $845B  00        BRK
  $845C  00        BRK
  $845D  00        BRK
  $845E  00        BRK
  $845F  00        BRK
  $8460  00        BRK
  $8461  00        BRK
  $8462  00        BRK
  $8463  00        BRK
  $8464  00        BRK
  $8465  00        BRK

L_8466:
  $8466  00        BRK
  $8467  00        BRK
  $8468  00        BRK
  $8469  FC        .db $FC
  $846A  C6 C6     DEC $C6
  $846C  C6 FC     DEC $FC
  $846E  CC C6 00  CPY $00C6
  $8471  00        BRK
  $8472  00        BRK
  $8473  00        BRK
  $8474  00        BRK
  $8475  00        BRK
  $8476  00        BRK
  $8477  00        BRK
  $8478  00        BRK
  $8479  FE C0 C0  INC $C0C0,X
  $847C  FC        .db $FC
  $847D  C0 C0     CPY #$C0
  $847F  FE 00 00  INC $0000,X
  $8482  00        BRK
  $8483  00        BRK
  $8484  00        BRK
  $8485  00        BRK
  $8486  00        BRK
  $8487  00        BRK
  $8488  00        BRK
  $8489  7C        .db $7C
  $848A  C6 C6     DEC $C6
  $848C  C6 FE     DEC $FE
  $848E  C6 C6     DEC $C6
  $8490  00        BRK
  $8491  00        BRK
  $8492  00        BRK
  $8493  00        BRK
  $8494  00        BRK
  $8495  00        BRK
  $8496  00        BRK
  $8497  00        BRK
  $8498  00        BRK
  $8499  FC        .db $FC
  $849A  C6 C6     DEC $C6
  $849C  C6 C6     DEC $C6
  $849E  C6 FC     DEC $FC
  $84A0  00        BRK
  $84A1  00        BRK
  $84A2  00        BRK
  $84A3  00        BRK
  $84A4  00        BRK
  $84A5  00        BRK
  $84A6  00        BRK
  $84A7  00        BRK
  $84A8  00        BRK
  $84A9  CC CC CC  CPY $CCCC
  $84AC  78        SEI
  $84AD  30 30     BMI $84DF
  $84AF  30 00     BMI $84B1

L_84B1:
  $84B1  00        BRK
  $84B2  00        BRK
  $84B3  00        BRK
  $84B4  00        BRK
  $84B5  00        BRK
  $84B6  00        BRK
  $84B7  00        BRK
  $84B8  00        BRK
  $84B9  00        BRK
  $84BA  00        BRK
  $84BB  00        BRK
  $84BC  00        BRK
  $84BD  00        BRK
  $84BE  00        BRK
  $84BF  00        BRK
  $84C0  00        BRK
  $84C1  00        BRK
  $84C2  00        BRK
  $84C3  00        BRK
  $84C4  00        BRK
  $84C5  00        BRK
  $84C6  00        BRK
  $84C7  00        BRK
  $84C8  00        BRK
  $84C9  00        BRK
  $84CA  00        BRK
  $84CB  00        BRK
  $84CC  00        BRK
  $84CD  00        BRK
  $84CE  00        BRK
  $84CF  00        BRK
  $84D0  00        BRK
  $84D1  00        BRK
  $84D2  00        BRK
  $84D3  00        BRK
  $84D4  00        BRK
  $84D5  00        BRK
  $84D6  00        BRK
  $84D7  00        BRK
  $84D8  00        BRK
  $84D9  00        BRK
  $84DA  00        BRK
  $84DB  00        BRK
  $84DC  00        BRK
  $84DD  00        BRK
  $84DE  00        BRK

L_84DF:
  $84DF  00        BRK
  $84E0  00        BRK
  $84E1  00        BRK
  $84E2  00        BRK
  $84E3  00        BRK
  $84E4  00        BRK
  $84E5  00        BRK
  $84E6  00        BRK
  $84E7  00        BRK
  $84E8  00        BRK
  $84E9  00        BRK
  $84EA  00        BRK
  $84EB  00        BRK
  $84EC  00        BRK
  $84ED  00        BRK
  $84EE  00        BRK
  $84EF  00        BRK
  $84F0  00        BRK
  $84F1  00        BRK
  $84F2  00        BRK
  $84F3  00        BRK
  $84F4  00        BRK
  $84F5  00        BRK
  $84F6  00        BRK
  $84F7  00        BRK
  $84F8  00        BRK
  $84F9  00        BRK
  $84FA  00        BRK
  $84FB  00        BRK
  $84FC  00        BRK
  $84FD  00        BRK
  $84FE  00        BRK
  $84FF  00        BRK
  $8500  00        BRK
  $8501  00        BRK
  $8502  00        BRK
  $8503  00        BRK
  $8504  00        BRK
  $8505  00        BRK
  $8506  00        BRK
  $8507  00        BRK
  $8508  00        BRK
  $8509  00        BRK
  $850A  00        BRK
  $850B  00        BRK
  $850C  00        BRK
  $850D  00        BRK
  $850E  00        BRK
  $850F  00        BRK
  $8510  00        BRK
  $8511  00        BRK
  $8512  00        BRK
  $8513  00        BRK
  $8514  00        BRK
  $8515  00        BRK
  $8516  00        BRK
  $8517  00        BRK
  $8518  00        BRK
  $8519  00        BRK
  $851A  00        BRK
  $851B  00        BRK
  $851C  00        BRK
  $851D  00        BRK
  $851E  00        BRK
  $851F  00        BRK
  $8520  00        BRK
  $8521  00        BRK
  $8522  00        BRK
  $8523  00        BRK
  $8524  00        BRK
  $8525  00        BRK
  $8526  00        BRK
  $8527  00        BRK
  $8528  00        BRK
  $8529  00        BRK
  $852A  00        BRK
  $852B  00        BRK
  $852C  00        BRK
  $852D  00        BRK
  $852E  00        BRK
  $852F  00        BRK
  $8530  00        BRK
  $8531  00        BRK
  $8532  00        BRK
  $8533  00        BRK
  $8534  00        BRK
  $8535  00        BRK
  $8536  00        BRK
  $8537  00        BRK
  $8538  00        BRK
  $8539  00        BRK
  $853A  00        BRK
  $853B  00        BRK
  $853C  00        BRK
  $853D  00        BRK
  $853E  00        BRK
  $853F  00        BRK
  $8540  00        BRK
  $8541  00        BRK
  $8542  00        BRK
  $8543  00        BRK
  $8544  00        BRK
  $8545  00        BRK
  $8546  00        BRK
  $8547  00        BRK
  $8548  00        BRK
  $8549  00        BRK
  $854A  00        BRK
  $854B  00        BRK
  $854C  00        BRK
  $854D  00        BRK
  $854E  00        BRK
  $854F  00        BRK
  $8550  00        BRK
  $8551  00        BRK
  $8552  00        BRK
  $8553  00        BRK
  $8554  00        BRK
  $8555  00        BRK
  $8556  00        BRK
  $8557  00        BRK
  $8558  00        BRK
  $8559  00        BRK
  $855A  00        BRK
  $855B  00        BRK
  $855C  00        BRK
  $855D  00        BRK
  $855E  00        BRK
  $855F  00        BRK
  $8560  00        BRK
  $8561  00        BRK
  $8562  00        BRK
  $8563  00        BRK
  $8564  00        BRK
  $8565  00        BRK
  $8566  00        BRK
  $8567  00        BRK
  $8568  00        BRK
  $8569  00        BRK
  $856A  00        BRK
  $856B  00        BRK
  $856C  00        BRK
  $856D  00        BRK
  $856E  00        BRK
  $856F  00        BRK
  $8570  00        BRK
  $8571  00        BRK
  $8572  00        BRK
  $8573  00        BRK
  $8574  00        BRK
  $8575  00        BRK
  $8576  00        BRK
  $8577  00        BRK
  $8578  00        BRK
  $8579  00        BRK
  $857A  00        BRK
  $857B  00        BRK
  $857C  00        BRK
  $857D  00        BRK
  $857E  00        BRK
  $857F  00        BRK
  $8580  00        BRK
  $8581  00        BRK
  $8582  00        BRK
  $8583  00        BRK
  $8584  00        BRK
  $8585  00        BRK
  $8586  00        BRK
  $8587  00        BRK
  $8588  00        BRK
  $8589  00        BRK
  $858A  00        BRK
  $858B  00        BRK
  $858C  00        BRK
  $858D  00        BRK
  $858E  00        BRK
  $858F  00        BRK
  $8590  00        BRK
  $8591  00        BRK
  $8592  00        BRK
  $8593  00        BRK
  $8594  00        BRK
  $8595  00        BRK
  $8596  00        BRK
  $8597  00        BRK
  $8598  00        BRK
  $8599  00        BRK
  $859A  00        BRK
  $859B  00        BRK
  $859C  00        BRK
  $859D  00        BRK
  $859E  00        BRK
  $859F  00        BRK
  $85A0  00        BRK
  $85A1  00        BRK
  $85A2  00        BRK
  $85A3  00        BRK
  $85A4  00        BRK
  $85A5  00        BRK
  $85A6  00        BRK
  $85A7  00        BRK
  $85A8  00        BRK
  $85A9  00        BRK
  $85AA  00        BRK
  $85AB  00        BRK
  $85AC  00        BRK
  $85AD  00        BRK
  $85AE  00        BRK
  $85AF  00        BRK
  $85B0  00        BRK
  $85B1  00        BRK
  $85B2  00        BRK
  $85B3  00        BRK
  $85B4  00        BRK
  $85B5  00        BRK
  $85B6  00        BRK
  $85B7  00        BRK
  $85B8  00        BRK
  $85B9  00        BRK
  $85BA  00        BRK
  $85BB  00        BRK
  $85BC  00        BRK
  $85BD  00        BRK
  $85BE  00        BRK
  $85BF  00        BRK
  $85C0  00        BRK
  $85C1  00        BRK
  $85C2  00        BRK
  $85C3  00        BRK
  $85C4  00        BRK
  $85C5  00        BRK
  $85C6  00        BRK
  $85C7  00        BRK
  $85C8  00        BRK
  $85C9  00        BRK
  $85CA  00        BRK
  $85CB  00        BRK
  $85CC  00        BRK
  $85CD  00        BRK
  $85CE  00        BRK
  $85CF  00        BRK
  $85D0  00        BRK
  $85D1  00        BRK
  $85D2  00        BRK
  $85D3  00        BRK
  $85D4  00        BRK
  $85D5  00        BRK
  $85D6  00        BRK
  $85D7  00        BRK
  $85D8  00        BRK
  $85D9  00        BRK
  $85DA  00        BRK
  $85DB  00        BRK
  $85DC  00        BRK
  $85DD  00        BRK
  $85DE  00        BRK
  $85DF  00        BRK
  $85E0  00        BRK
  $85E1  00        BRK
  $85E2  00        BRK
  $85E3  00        BRK
  $85E4  00        BRK
  $85E5  00        BRK
  $85E6  00        BRK
  $85E7  00        BRK
  $85E8  00        BRK
  $85E9  00        BRK
  $85EA  00        BRK
  $85EB  00        BRK
  $85EC  00        BRK
  $85ED  00        BRK
  $85EE  00        BRK
  $85EF  00        BRK
  $85F0  00        BRK
  $85F1  00        BRK
  $85F2  00        BRK
  $85F3  00        BRK
  $85F4  00        BRK
  $85F5  00        BRK
  $85F6  00        BRK
  $85F7  00        BRK
  $85F8  00        BRK
  $85F9  00        BRK
  $85FA  00        BRK
  $85FB  00        BRK
  $85FC  00        BRK
  $85FD  00        BRK
  $85FE  00        BRK
  $85FF  00        BRK
  $8600  4C 0C 86  JMP $860C
  $8603  4C 37 86  JMP $8637
  $8606  4C 78 86  JMP $8678
  $8609  4C 81 86  JMP $8681

L_860C:
  $860C  A4 01     LDY $01
  $860E  B9 00 87  LDA $8700,Y
  $8611  85 08     STA $08
  $8613  B9 08 87  LDA $8708,Y
  $8616  85 09     STA $09
  $8618  A0 00     LDY #$00
  $861A  B1 08     LDA ($08),Y
  $861C  85 02     STA $02
  $861E  C8        INY
  $861F  A2 00     LDX #$00

L_8621:
  $8621  A9 04     LDA #$04
  $8623  85 01     STA $01

L_8625:
  $8625  B1 08     LDA ($08),Y
  $8627  9D 00 02  STA $0200,X
  $862A  C8        INY
  $862B  E8        INX
  $862C  C6 01     DEC $01
  $862E  D0 F5     BNE $8625
  $8630  C6 02     DEC $02
  $8632  D0 ED     BNE $8621
  $8634  86 00     STX $00
  $8636  60        RTS

L_8637:
  $8637  A5 1C     LDA $1C
  $8639  29 03     AND #$03
  $863B  D0 3A     BNE $8677
  $863D  AE A0 06  LDX $06A0
  $8640  AD 80 06  LDA $0680
  $8643  A8        TAY
  $8644  DD D8 8A  CMP $8AD8,X
  $8647  F0 15     BEQ $865E
  $8649  18        CLC
  $864A  7D C8 8A  ADC $8AC8,X
  $864D  AA        TAX
  $864E  BD E8 8A  LDA $8AE8,X
  $8651  8D B8 03  STA $03B8
  $8654  E6 47     INC $47
  $8656  EE B7 03  INC $03B7
  $8659  EE 80 06  INC $0680
  $865C  D0 19     BNE $8677

L_865E:
  $865E  AD A0 06  LDA $06A0
  $8661  29 01     AND #$01
  $8663  D0 12     BNE $8677
  $8665  EE A0 06  INC $06A0
  $8668  A9 00     LDA #$00
  $866A  8D 80 06  STA $0680
  $866D  A9 25     LDA #$25
  $866F  8D B6 03  STA $03B6
  $8672  A9 CC     LDA #$CC
  $8674  8D B7 03  STA $03B7

L_8677:
  $8677  60        RTS

L_8678:
  $8678  A9 8C     LDA #$8C
  $867A  85 DF     STA $DF
  $867C  A9 95     LDA #$95
  $867E  85 DE     STA $DE
  $8680  60        RTS

L_8681:
  $8681  18        CLC
  $8682  A5 21     LDA $21
  $8684  69 78     ADC #$78
  $8686  85 21     STA $21
  $8688  A5 22     LDA $22
  $868A  69 00     ADC #$00
  $868C  C9 F0     CMP #$F0
  $868E  90 02     BCC $8692
  $8690  A9 00     LDA #$00

L_8692:
  $8692  85 22     STA $22
  $8694  29 07     AND #$07
  $8696  D0 16     BNE $86AE
  $8698  38        SEC
  $8699  A5 22     LDA $22
  $869B  85 01     STA $01
  $869D  20 EB 86  JSR $86EB
  $86A0  A2 20     LDX #$20
  $86A2  86 47     STX $47
  $86A4  CA        DEX
  $86A5  A9 00     LDA #$00

L_86A7:
  $86A7  9D B8 03  STA $03B8,X
  $86AA  CA        DEX
  $86AB  10 FA     BPL $86A7
  $86AD  60        RTS

L_86AE:
  $86AE  AE A0 06  LDX $06A0
  $86B1  A5 22     LDA $22
  $86B3  DD E0 8B  CMP $8BE0,X
  $86B6  D0 32     BNE $86EA
  $86B8  A5 22     LDA $22
  $86BA  29 F8     AND #$F8
  $86BC  85 01     STA $01

L_86BE:
  $86BE  20 EB 86  JSR $86EB
  $86C1  BD 1D 8C  LDA $8C1D,X
  $86C4  8D B7 03  STA $03B7
  $86C7  BD 59 8C  LDA $8C59,X
  $86CA  85 47     STA $47
  $86CC  A0 00     LDY #$00
  $86CE  A2 00     LDX #$00

L_86D0:
  $86D0  B1 DE     LDA ($DE),Y
  $86D2  9D B8 03  STA $03B8,X
  $86D5  18        CLC

L_86D6:
  $86D6  A5 DE     LDA $DE
  $86D8  69 01     ADC #$01
  $86DA  85 DE     STA $DE
  $86DC  A5 DF     LDA $DF
  $86DE  69 00     ADC #$00
  $86E0  85 DF     STA $DF
  $86E2  E8        INX
  $86E3  E4 47     CPX $47
  $86E5  D0 E9     BNE $86D0
  $86E7  EE A0 06  INC $06A0

L_86EA:
  $86EA  60        RTS

L_86EB:
  $86EB  A9 08     LDA #$08
  $86ED  85 00     STA $00
  $86EF  A5 01     LDA $01
  $86F1  0A        ASL
  $86F2  26 00     ROL $00
  $86F4  0A        ASL
  $86F5  26 00     ROL $00
  $86F7  8D B7 03  STA $03B7
  $86FA  A5 00     LDA $00
  $86FC  8D B6 03  STA $03B6
  $86FF  60        RTS
  $8700  10 9D     BPL $869F
  $8702  26 B3     ROL $B3
  $8704  3C        .db $3C
  $8705  C9 EE     CMP #$EE
  $8707  7B        .db $7B
  $8708  87        .db $87
  $8709  87        .db $87
  $870A  88        DEY
  $870B  88        DEY
  $870C  89        .db $89
  $870D  89        .db $89
  $870E  89        .db $89
  $870F  8A        TXA
  $8710  23        .db $23
  $8711  80        .db $80
  $8712  50 00     BVC $8714

L_8714:
  $8714  C0 80     CPY #$80
  $8716  51 00     EOR ($00),Y
  $8718  C8        INY
  $8719  80        .db $80
  $871A  52        .db $52
  $871B  00        BRK
  $871C  D0 88     BNE $86A6

L_871E:
  $871E  53        .db $53
  $871F  00        BRK
  $8720  B8        CLV
  $8721  88        DEY
  $8722  54        .db $54
  $8723  00        BRK
  $8724  C0 88     CPY #$88
  $8726  55 00     EOR $00,X
  $8728  C8        INY
  $8729  88        DEY
  $872A  56 00     LSR $00,X
  $872C  D0 90     BNE $86BE
  $872E  57        .db $57
  $872F  00        BRK
  $8730  B8        CLV
  $8731  90 58     BCC $878B
  $8733  00        BRK
  $8734  C0 90     CPY #$90

L_8736:
  $8736  59 00 C8  EOR $C800,Y
  $8739  90 5A     BCC $8795
  $873B  00        BRK
  $873C  D0 98     BNE $86D6
  $873E  5B        .db $5B
  $873F  00        BRK
  $8740  B8        CLV
  $8741  98        TYA
  $8742  5C        .db $5C
  $8743  00        BRK
  $8744  C0 98     CPY #$98
  $8746  5D 00 C8  EOR $C800,X
  $8749  98        TYA
  $874A  5E 00 D0  LSR $D000,X
  $874D  A0 5F     LDY #$5F
  $874F  00        BRK
  $8750  B8        CLV
  $8751  A0 60     LDY #$60
  $8753  00        BRK
  $8754  C0 A0     CPY #$A0
  $8756  61 00     ADC ($00,X)
  $8758  C8        INY
  $8759  A0 62     LDY #$62
  $875B  00        BRK
  $875C  D0 A8     BNE $8706
  $875E  63        .db $63

L_875F:
  $875F  00        BRK
  $8760  B8        CLV
  $8761  A8        TAY
  $8762  64        .db $64
  $8763  00        BRK
  $8764  C0 A8     CPY #$A8
  $8766  65 00     ADC $00
  $8768  C8        INY
  $8769  A8        TAY
  $876A  66 00     ROR $00
  $876C  D0 B0     BNE $871E
  $876E  67        .db $67
  $876F  00        BRK
  $8770  B8        CLV
  $8771  B0 68     BCS $87DB
  $8773  00        BRK
  $8774  C0 B0     CPY #$B0
  $8776  69 00     ADC #$00
  $8778  C8        INY
  $8779  B0 6A     BCS $87E5
  $877B  00        BRK
  $877C  D0 B8     BNE $8736
  $877E  6B        .db $6B
  $877F  02        .db $02
  $8780  B8        CLV
  $8781  B8        CLV
  $8782  6C 02 C0  JMP ($C002)
  $8785  B8        CLV
  $8786  6D 02 C8  ADC $C802
  $8789  B8        CLV
  $878A  6E 02 D0  ROR $D002
  $878D  89        .db $89
  $878E  A0 01     LDY #$01
  $8790  C1 89     CMP ($89,X)
  $8792  A0 41     LDY #$41
  $8794  C9 91     CMP #$91
  $8796  A1 01     LDA ($01,X)
  $8798  C1 91     CMP ($91,X)
  $879A  A2 01     LDX #$01
  $879C  C9 22     CMP #$22
  $879E  80        .db $80

L_879F:
  $879F  77        .db $77
  $87A0  00        BRK
  $87A1  C0 80     CPY #$80
  $87A3  78        SEI
  $87A4  00        BRK
  $87A5  C8        INY
  $87A6  88        DEY

L_87A7:
  $87A7  79 00 B8  ADC $B800,Y
  $87AA  88        DEY
  $87AB  7A        .db $7A
  $87AC  00        BRK
  $87AD  C0 88     CPY #$88
  $87AF  7A        .db $7A
  $87B0  40        RTI
  $87B1  C8        INY
  $87B2  88        DEY
  $87B3  79 40 D0  ADC $D040,Y
  $87B6  90 7B     BCC $8833
  $87B8  00        BRK
  $87B9  B8        CLV
  $87BA  90 7C     BCC $8838
  $87BC  00        BRK
  $87BD  C0 90     CPY #$90

L_87BF:
  $87BF  7C        .db $7C
  $87C0  40        RTI

L_87C1:
  $87C1  C8        INY
  $87C2  90 7B     BCC $883F
  $87C4  40        RTI
  $87C5  D0 98     BNE $875F
  $87C7  7D 00 B8  ADC $B800,X
  $87CA  98        TYA
  $87CB  7E 00 C0  ROR $C000,X
  $87CE  98        TYA
  $87CF  7F        .db $7F
  $87D0  00        BRK
  $87D1  C8        INY
  $87D2  98        TYA
  $87D3  7D 40 D0  ADC $D040,X
  $87D6  A0 83     LDY #$83
  $87D8  00        BRK
  $87D9  B8        CLV
  $87DA  A0 84     LDY #$84
  $87DC  00        BRK
  $87DD  C0 A0     CPY #$A0
  $87DF  85 00     STA $00
  $87E1  C8        INY
  $87E2  A0 83     LDY #$83
  $87E4  40        RTI

L_87E5:
  $87E5  D0 A8     BNE $878F
  $87E7  86 00     STX $00
  $87E9  B8        CLV
  $87EA  A8        TAY
  $87EB  87        .db $87

L_87EC:
  $87EC  00        BRK
  $87ED  C0 A8     CPY #$A8
  $87EF  88        DEY
  $87F0  00        BRK
  $87F1  C8        INY
  $87F2  A8        TAY
  $87F3  89        .db $89
  $87F4  00        BRK
  $87F5  D0 B0     BNE $87A7
  $87F7  8A        TXA
  $87F8  00        BRK
  $87F9  B8        CLV
  $87FA  B0 8B     BCS $8787
  $87FC  00        BRK
  $87FD  C0 B0     CPY #$B0
  $87FF  8C 00 C8  STY $C800
  $8802  B0 8D     BCS $8791

L_8804:
  $8804  00        BRK
  $8805  D0 B8     BNE $87BF
  $8807  8E 02 B8  STX $B802
  $880A  B8        CLV
  $880B  8F        .db $8F
  $880C  02        .db $02
  $880D  C0 B8     CPY #$B8
  $880F  9D 02 C8  STA $C802,X
  $8812  B8        CLV
  $8813  9E        .db $9E
  $8814  02        .db $02
  $8815  D0 88     BNE $879F
  $8817  A0 01     LDY #$01
  $8819  C0 88     CPY #$88
  $881B  A0 41     LDY #$41
  $881D  C8        INY
  $881E  90 A1     BCC $87C1
  $8820  01 C0     ORA ($C0,X)
  $8822  90 A2     BCC $87C6
  $8824  01 C8     ORA ($C8,X)
  $8826  23        .db $23
  $8827  80        .db $80
  $8828  50 00     BVC $882A

L_882A:
  $882A  BE 80 51  LDX $5180,Y

L_882D:
  $882D  00        BRK
  $882E  C6 80     DEC $80
  $8830  52        .db $52
  $8831  00        BRK
  $8832  CE 88 53  DEC $5388
  $8835  00        BRK
  $8836  B6 88     LDX $88,Y

L_8838:
  $8838  54        .db $54
  $8839  00        BRK
  $883A  BE 88 55  LDX $5588,Y
  $883D  00        BRK
  $883E  C6 88     DEC $88

L_8840:
  $8840  56 00     LSR $00,X
  $8842  CE 90 5A  DEC $5A90
  $8845  40        RTI
  $8846  B8        CLV
  $8847  90 59     BCC $88A2
  $8849  40        RTI
  $884A  C0 90     CPY #$90

L_884C:
  $884C  58        CLI
  $884D  40        RTI
  $884E  C8        INY
  $884F  90 57     BCC $88A8
  $8851  40        RTI
  $8852  D0 98     BNE $87EC
  $8854  5E 40 B8  LSR $B840,X
  $8857  98        TYA
  $8858  5D 40 C0  EOR $C040,X
  $885B  98        TYA
  $885C  5C        .db $5C
  $885D  40        RTI
  $885E  C8        INY
  $885F  98        TYA
  $8860  5B        .db $5B
  $8861  40        RTI
  $8862  D0 A0     BNE $8804
  $8864  62        .db $62
  $8865  40        RTI
  $8866  B8        CLV
  $8867  A0 61     LDY #$61
  $8869  40        RTI
  $886A  C0 A0     CPY #$A0
  $886C  60        RTS
  $886D  40        RTI
  $886E  C8        INY
  $886F  A0 5F     LDY #$5F
  $8871  40        RTI
  $8872  D0 A8     BNE $881C
  $8874  66 40     ROR $40
  $8876  B8        CLV
  $8877  A8        TAY
  $8878  65 40     ADC $40
  $887A  C0 A8     CPY #$A8
  $887C  64        .db $64
  $887D  40        RTI
  $887E  C8        INY
  $887F  A8        TAY
  $8880  63        .db $63
  $8881  40        RTI
  $8882  D0 B0     BNE $8834
  $8884  6A        ROR
  $8885  40        RTI
  $8886  B8        CLV
  $8887  B0 69     BCS $88F2
  $8889  40        RTI
  $888A  C0 B0     CPY #$B0
  $888C  68        PLA
  $888D  40        RTI
  $888E  C8        INY
  $888F  B0 67     BCS $88F8
  $8891  40        RTI
  $8892  D0 B8     BNE $884C
  $8894  A3        .db $A3
  $8895  02        .db $02
  $8896  B8        CLV
  $8897  B8        CLV
  $8898  A4 02     LDY $02
  $889A  C0 B8     CPY #$B8
  $889C  A5 02     LDA $02

L_889E:
  $889E  C8        INY
  $889F  B8        CLV
  $88A0  A6 02     LDX $02

L_88A2:
  $88A2  D0 89     BNE $882D

L_88A4:
  $88A4  A0 01     LDY #$01
  $88A6  BF        .db $BF
  $88A7  89        .db $89

L_88A8:
  $88A8  A0 41     LDY #$41
  $88AA  C7        .db $C7
  $88AB  91 A1     STA ($A1),Y
  $88AD  01 BF     ORA ($BF,X)
  $88AF  91 A2     STA ($A2),Y
  $88B1  01 C7     ORA ($C7,X)
  $88B3  22        .db $22
  $88B4  80        .db $80

L_88B5:
  $88B5  77        .db $77
  $88B6  00        BRK
  $88B7  C0 80     CPY #$80
  $88B9  78        SEI
  $88BA  00        BRK
  $88BB  C8        INY
  $88BC  88        DEY

L_88BD:
  $88BD  79 00 B8  ADC $B800,Y
  $88C0  88        DEY
  $88C1  7A        .db $7A
  $88C2  00        BRK
  $88C3  C0 88     CPY #$88
  $88C5  7A        .db $7A
  $88C6  40        RTI
  $88C7  C8        INY
  $88C8  88        DEY
  $88C9  79 40 D0  ADC $D040,Y
  $88CC  90 7B     BCC $8949
  $88CE  00        BRK
  $88CF  B8        CLV
  $88D0  90 7C     BCC $894E

L_88D2:
  $88D2  00        BRK
  $88D3  C0 90     CPY #$90

L_88D5:
  $88D5  7C        .db $7C
  $88D6  40        RTI

L_88D7:
  $88D7  C8        INY
  $88D8  90 7B     BCC $8955
  $88DA  40        RTI
  $88DB  D0 98     BNE $8875
  $88DD  7D 00 B8  ADC $B800,X
  $88E0  98        TYA
  $88E1  7F        .db $7F
  $88E2  40        RTI
  $88E3  C0 98     CPY #$98
  $88E5  7E 40 C8  ROR $C840,X
  $88E8  98        TYA
  $88E9  7D 40 D0  ADC $D040,X
  $88EC  A0 83     LDY #$83
  $88EE  00        BRK
  $88EF  B8        CLV
  $88F0  A0 85     LDY #$85

L_88F2:
  $88F2  40        RTI
  $88F3  C0 A0     CPY #$A0
  $88F5  84 40     STY $40
  $88F7  C8        INY

L_88F8:
  $88F8  A0 83     LDY #$83
  $88FA  40        RTI
  $88FB  D0 A8     BNE $88A5
  $88FD  89        .db $89
  $88FE  40        RTI
  $88FF  B8        CLV
  $8900  A8        TAY
  $8901  88        DEY

L_8902:
  $8902  40        RTI
  $8903  C0 A8     CPY #$A8
  $8905  87        .db $87
  $8906  40        RTI
  $8907  C8        INY
  $8908  A8        TAY
  $8909  86 40     STX $40
  $890B  D0 B0     BNE $88BD
  $890D  8D 40 B8  STA $B840
  $8910  B0 8C     BCS $889E
  $8912  40        RTI
  $8913  C0 B0     CPY #$B0
  $8915  8B        .db $8B
  $8916  40        RTI
  $8917  C8        INY
  $8918  B0 8A     BCS $88A4

L_891A:
  $891A  40        RTI
  $891B  D0 B8     BNE $88D5
  $891D  A7        .db $A7

L_891E:
  $891E  02        .db $02
  $891F  B8        CLV
  $8920  B8        CLV
  $8921  A8        TAY
  $8922  02        .db $02
  $8923  C0 B8     CPY #$B8
  $8925  A9 02     LDA #$02
  $8927  C8        INY
  $8928  B8        CLV
  $8929  AA        TAX
  $892A  02        .db $02
  $892B  D0 88     BNE $88B5
  $892D  A0 01     LDY #$01
  $892F  C0 88     CPY #$88
  $8931  A0 41     LDY #$41
  $8933  C8        INY
  $8934  90 A1     BCC $88D7
  $8936  01 C0     ORA ($C0,X)
  $8938  90 A2     BCC $88DC
  $893A  01 C8     ORA ($C8,X)
  $893C  23        .db $23
  $893D  80        .db $80
  $893E  B5 00     LDA $00,X
  $8940  C0 80     CPY #$80

L_8942:
  $8942  B6 00     LDX $00,Y
  $8944  C8        INY
  $8945  80        .db $80
  $8946  B7        .db $B7
  $8947  00        BRK
  $8948  D0 88     BNE $88D2

L_894A:
  $894A  B8        CLV
  $894B  00        BRK
  $894C  B8        CLV
  $894D  88        DEY

L_894E:
  $894E  B9 00 C0  LDA $C000,Y
  $8951  88        DEY
  $8952  BA        TSX
  $8953  00        BRK
  $8954  C8        INY

L_8955:
  $8955  88        DEY
  $8956  BB        .db $BB
  $8957  00        BRK
  $8958  D0 90     BNE $88EA
  $895A  BE 00 B8  LDX $B800,Y
  $895D  90 BF     BCC $891E
  $895F  00        BRK
  $8960  C0 90     CPY #$90

L_8962:
  $8962  BC 00 C8  LDY $C800,X
  $8965  90 BD     BCC $8924
  $8967  00        BRK
  $8968  D0 98     BNE $8902
  $896A  CB        .db $CB
  $896B  00        BRK
  $896C  B8        CLV
  $896D  98        TYA
  $896E  CC 00 C0  CPY $C000
  $8971  98        TYA
  $8972  CC 40 C8  CPY $C840

L_8975:
  $8975  98        TYA
  $8976  CB        .db $CB
  $8977  40        RTI
  $8978  D0 A0     BNE $891A

L_897A:
  $897A  CD 00 B8  CMP $B800
  $897D  A0 CE     LDY #$CE
  $897F  00        BRK
  $8980  C0 A0     CPY #$A0
  $8982  CE 40 C8  DEC $C840
  $8985  A0 CD     LDY #$CD
  $8987  40        RTI
  $8988  D0 A8     BNE $8932
  $898A  CF        .db $CF
  $898B  00        BRK
  $898C  B8        CLV
  $898D  A8        TAY
  $898E  D9 00 C0  CMP $C000,Y
  $8991  A8        TAY
  $8992  D9 40 C8  CMP $C840,Y
  $8995  A8        TAY
  $8996  CF        .db $CF
  $8997  40        RTI
  $8998  D0 B0     BNE $894A
  $899A  DA        .db $DA
  $899B  00        BRK
  $899C  B8        CLV
  $899D  B0 DB     BCS $897A
  $899F  00        BRK
  $89A0  C0 B0     CPY #$B0
  $89A2  DB        .db $DB
  $89A3  40        RTI
  $89A4  C8        INY
  $89A5  B0 DA     BCS $8981
  $89A7  40        RTI
  $89A8  D0 B8     BNE $8962
  $89AA  DC        .db $DC
  $89AB  02        .db $02
  $89AC  B8        CLV
  $89AD  B8        CLV
  $89AE  DD 02 C0  CMP $C002,X
  $89B1  B8        CLV
  $89B2  DD 42 C8  CMP $C842,X
  $89B5  B8        CLV
  $89B6  DC        .db $DC
  $89B7  42        .db $42
  $89B8  D0 88     BNE $8942
  $89BA  AB        .db $AB
  $89BB  01 BF     ORA ($BF,X)
  $89BD  88        DEY

L_89BE:
  $89BE  AC 01 C7  LDY $C701
  $89C1  90 AD     BCC $8970
  $89C3  01 BF     ORA ($BF,X)
  $89C5  90 AE     BCC $8975
  $89C7  01 C7     ORA ($C7,X)
  $89C9  09 A8     ORA #$A8
  $89CB  DE 00 B8  DEC $B800,X
  $89CE  A8        TAY
  $89CF  DF        .db $DF
  $89D0  00        BRK
  $89D1  C0 A8     CPY #$A8
  $89D3  E0 00     CPX #$00
  $89D5  C8        INY
  $89D6  B0 E1     BCS $89B9
  $89D8  00        BRK
  $89D9  B8        CLV
  $89DA  B0 E2     BCS $89BE
  $89DC  00        BRK
  $89DD  C0 B0     CPY #$B0
  $89DF  E3        .db $E3
  $89E0  00        BRK
  $89E1  C8        INY
  $89E2  B8        CLV
  $89E3  E4 02     CPX $02
  $89E5  B8        CLV
  $89E6  B8        CLV
  $89E7  E5 02     SBC $02
  $89E9  C0 B8     CPY #$B8
  $89EB  E6 02     INC $02
  $89ED  C8        INY
  $89EE  23        .db $23
  $89EF  34        .db $34
  $89F0  80        .db $80
  $89F1  00        BRK
  $89F2  3F        .db $3F
  $89F3  34        .db $34
  $89F4  81 00     STA ($00,X)
  $89F6  47        .db $47
  $89F7  34        .db $34
  $89F8  82        .db $82
  $89F9  00        BRK
  $89FA  4F        .db $4F
  $89FB  3C        .db $3C
  $89FC  83        .db $83
  $89FD  00        BRK
  $89FE  37        .db $37
  $89FF  3C        .db $3C
  $8A00  84 00     STY $00
  $8A02  3F        .db $3F
  $8A03  3C        .db $3C
  $8A04  85 00     STA $00
  $8A06  47        .db $47
  $8A07  3C        .db $3C
  $8A08  86 00     STX $00
  $8A0A  4F        .db $4F
  $8A0B  44        .db $44
  $8A0C  B9 00 37  LDA $3700,Y
  $8A0F  44        .db $44
  $8A10  BA        TSX
  $8A11  00        BRK
  $8A12  3F        .db $3F
  $8A13  44        .db $44
  $8A14  89        .db $89
  $8A15  00        BRK
  $8A16  47        .db $47
  $8A17  44        .db $44
  $8A18  BB        .db $BB
  $8A19  00        BRK
  $8A1A  4F        .db $4F
  $8A1B  4C 9B 00  JMP $009B
  $8A1E  38        SEC
  $8A1F  4C BC 00  JMP $00BC
  $8A22  40        RTI
  $8A23  4C BC 40  JMP $40BC
  $8A26  48        PHA
  $8A27  4C 9B 40  JMP $409B
  $8A2A  50 54     BVC $8A80
  $8A2C  9D 00 38  STA $3800,X
  $8A2F  54        .db $54
  $8A30  9E        .db $9E
  $8A31  00        BRK
  $8A32  40        RTI
  $8A33  54        .db $54
  $8A34  9E        .db $9E
  $8A35  40        RTI
  $8A36  48        PHA
  $8A37  54        .db $54
  $8A38  9D 40 50  STA $5040,X
  $8A3B  5C        .db $5C
  $8A3C  9F        .db $9F
  $8A3D  00        BRK
  $8A3E  38        SEC
  $8A3F  5C        .db $5C
  $8A40  A9 00     LDA #$00
  $8A42  40        RTI
  $8A43  5C        .db $5C
  $8A44  A9 40     LDA #$40
  $8A46  48        PHA
  $8A47  5C        .db $5C
  $8A48  9F        .db $9F
  $8A49  40        RTI
  $8A4A  50 64     BVC $8AB0
  $8A4C  AA        TAX
  $8A4D  00        BRK
  $8A4E  38        SEC
  $8A4F  64        .db $64
  $8A50  AB        .db $AB
  $8A51  00        BRK
  $8A52  40        RTI
  $8A53  64        .db $64
  $8A54  AB        .db $AB
  $8A55  40        RTI
  $8A56  48        PHA
  $8A57  64        .db $64
  $8A58  AA        TAX
  $8A59  40        RTI
  $8A5A  50 6C     BVC $8AC8
  $8A5C  AC 02 38  LDY $3802
  $8A5F  6C AD 02  JMP ($02AD)
  $8A62  40        RTI
  $8A63  6C AD 42  JMP ($42AD)

L_8A66:
  $8A66  48        PHA
  $8A67  6C AC 42  JMP ($42AC)
  $8A6A  50 3D     BVC $8AA9
  $8A6C  BD 01 40  LDA $4001,X
  $8A6F  3D BD 41  AND $41BD,X
  $8A72  48        PHA
  $8A73  45 BE     EOR $BE
  $8A75  01 40     ORA ($40,X)
  $8A77  45 BF     EOR $BF
  $8A79  01 48     ORA ($48,X)
  $8A7B  13        .db $13
  $8A7C  40        RTI
  $8A7D  C0 03     CPY #$03
  $8A7F  3B        .db $3B

L_8A80:
  $8A80  40        RTI
  $8A81  C1 03     CMP ($03,X)
  $8A83  43        .db $43
  $8A84  40        RTI
  $8A85  C2        .db $C2
  $8A86  03        .db $03
  $8A87  4B        .db $4B
  $8A88  48        PHA
  $8A89  C3        .db $C3
  $8A8A  03        .db $03
  $8A8B  38        SEC
  $8A8C  48        PHA
  $8A8D  C4 03     CPY $03
  $8A8F  40        RTI
  $8A90  48        PHA
  $8A91  C5 03     CMP $03
  $8A93  48        PHA
  $8A94  48        PHA
  $8A95  C6 03     DEC $03
  $8A97  50 50     BVC $8AE9
  $8A99  C7        .db $C7
  $8A9A  03        .db $03
  $8A9B  38        SEC
  $8A9C  50 C8     BVC $8A66
  $8A9E  03        .db $03
  $8A9F  40        RTI
  $8AA0  50 C9     BVC $8A6B
  $8AA2  03        .db $03
  $8AA3  48        PHA
  $8AA4  50 CA     BVC $8A70
  $8AA6  03        .db $03
  $8AA7  50 58     BVC $8B01

L_8AA9:
  $8AA9  CB        .db $CB
  $8AAA  03        .db $03
  $8AAB  38        SEC
  $8AAC  58        CLI
  $8AAD  CC 03 40  CPY $4003

L_8AB0:
  $8AB0  58        CLI
  $8AB1  CD 03 48  CMP $4803
  $8AB4  58        CLI
  $8AB5  CE 03 50  DEC $5003
  $8AB8  41 CF     EOR ($CF,X)
  $8ABA  01 48     ORA ($48,X)
  $8ABC  49 D8     EOR #$D8
  $8ABE  01 40     ORA ($40,X)
  $8AC0  49 D9     EOR #$D9
  $8AC2  01 48     ORA ($48,X)
  $8AC4  49 DA     EOR #$DA
  $8AC6  01 50     ORA ($50,X)

L_8AC8:
  $8AC8  00        BRK
  $8AC9  10 1E     BPL $8AE9
  $8ACB  2C 3A 4B  BIT $4B3A
  $8ACE  59 69 7B  EOR $7B69,Y
  $8AD1  8B        .db $8B
  $8AD2  98        TYA
  $8AD3  A8        TAY
  $8AD4  B7        .db $B7
  $8AD5  C6 D7     DEC $D7
  $8AD7  E6 10     INC $10
  $8AD9  0E 0E 0E  ASL $0E0E
  $8ADC  11 0E     ORA ($0E),Y
  $8ADE  10 12     BPL $8AF2
  $8AE0  10 0D     BPL $8AEF
  $8AE2  10 0F     BPL $8AF3
  $8AE4  0F        .db $0F
  $8AE5  11 0F     ORA ($0F),Y
  $8AE7  12        .db $12
  $8AE8  0E 0F 1C  ASL $1C0F
  $8AEB  30 30     BMI $8B1D
  $8AED  39 20 20  AND $2020,Y
  $8AF0  0D 05 14  ORA $1405

L_8AF3:
  $8AF3  01 0C     ORA ($0C,X)
  $8AF5  0D 01 0E  ORA $0E01
  $8AF8  0D 01 13  ORA $1301
  $8AFB  01 0E     ORA ($0E,X)
  $8AFD  0F        .db $0F
  $8AFE  12        .db $12
  $8AFF  09 20     ORA #$20

L_8B01:
  $8B01  13        .db $13
  $8B02  01 14     ORA ($14,X)
  $8B04  0F        .db $0F
  $8B05  15 0E     ORA $0E,X
  $8B07  0F        .db $0F
  $8B08  1C        .db $1C
  $8B09  30 31     BMI $8B3C
  $8B0B  30 20     BMI $8B2D
  $8B0D  20 01 09  JSR $0901
  $8B10  12        .db $12
  $8B11  0D 01 0E  ORA $0E01
  $8B14  19 0F 15  ORA $150F,Y
  $8B17  0A        ASL
  $8B18  09 20     ORA #$20
  $8B1A  0B        .db $0B
  $8B1B  01 0E     ORA ($0E,X)

L_8B1D:
  $8B1D  01 1A     ORA ($1A,X)
  $8B1F  01 17     ORA ($17,X)
  $8B21  01 0E     ORA ($0E,X)
  $8B23  0F        .db $0F
  $8B24  1C        .db $1C
  $8B25  30 31     BMI $8B58
  $8B27  31 20     AND ($20),Y
  $8B29  20 02 15  JSR $1502
  $8B2C  02        .db $02

L_8B2D:
  $8B2D  02        .db $02
  $8B2E  0C        .db $0C
  $8B2F  05 0D     ORA $0D
  $8B31  01 0E     ORA ($0E,X)
  $8B33  14        .db $14
  $8B34  01 0B     ORA ($0B,X)
  $8B36  01 13     ORA ($13,X)
  $8B38  08        PHP
  $8B39  09 20     ORA #$20
  $8B3B  14        .db $14

L_8B3C:
  $8B3C  01 0E     ORA ($0E,X)
  $8B3E  01 0B     ORA ($0B,X)
  $8B40  01 0E     ORA ($0E,X)
  $8B42  0F        .db $0F
  $8B43  1C        .db $1C
  $8B44  30 31     BMI $8B77
  $8B46  32        .db $32
  $8B47  20 20 11  JSR $1120
  $8B4A  15 09     ORA $09,X
  $8B4C  03        .db $03
  $8B4D  0B        .db $0B
  $8B4E  0D 01 0E  ORA $0E01
  $8B51  08        PHP
  $8B52  09 12     ORA #$12
  $8B54  0F        .db $0F
  $8B55  06 15     ASL $15
  $8B57  0D 09 20  ORA $2009
  $8B5A  0D 09 1A  ORA $1A09
  $8B5D  0F        .db $0F
  $8B5E  07        .db $07
  $8B5F  15 03     ORA $03,X
  $8B61  08        PHP
  $8B62  09 0E     ORA #$0E
  $8B64  0F        .db $0F
  $8B65  1C        .db $1C
  $8B66  30 31     BMI $8B99
  $8B68  33        .db $33
  $8B69  20 20 03  JSR $0320
  $8B6C  12        .db $12
  $8B6D  01 13     ORA ($13,X)
  $8B6F  08        PHP
  $8B70  0D 01 0E  ORA $0E01
  $8B73  01 0B     ORA ($0B,X)
  $8B75  09 12     ORA #$12

L_8B77:
  $8B77  01 20     ORA ($20,X)
  $8B79  19 0F 13  ORA $130F,Y
  $8B7C  08        PHP
  $8B7D  09 04     ORA #$04
  $8B7F  01 0E     ORA ($0E,X)
  $8B81  0F        .db $0F
  $8B82  1C        .db $1C
  $8B83  30 31     BMI $8BB6
  $8B85  34        .db $34
  $8B86  20 20 06  JSR $0620
  $8B89  0C        .db $0C
  $8B8A  01 13     ORA ($13,X)
  $8B8C  08        PHP
  $8B8D  0D 01 0E  ORA $0E01
  $8B90  14        .db $14
  $8B91  0F        .db $0F
  $8B92  0D 0F 0F  ORA $0F0F
  $8B95  20 19 01  JSR $0119
  $8B98  0D 01 07  ORA $0701
  $8B9B  15 03     ORA $03,X
  $8B9D  08        PHP
  $8B9E  09 0E     ORA #$0E
  $8BA0  0F        .db $0F
  $8BA1  1C        .db $1C
  $8BA2  30 31     BMI $8BD5
  $8BA4  35 20     AND $20,X
  $8BA6  20 08 05  JSR $0508
  $8BA9  01 14     ORA ($14,X)
  $8BAB  0D 01 0E  ORA $0E01
  $8BAE  14        .db $14
  $8BAF  0F        .db $0F
  $8BB0  13        .db $13
  $8BB1  08        PHP
  $8BB2  09 19     ORA #$19
  $8BB4  15 0B     ORA $0B,X

L_8BB6:
  $8BB6  09 20     ORA #$20
  $8BB8  0B        .db $0B
  $8BB9  01 14     ORA ($14,X)
  $8BBB  01 0F     ORA ($0F,X)
  $8BBD  0B        .db $0B
  $8BBE  01 0E     ORA ($0E,X)
  $8BC0  0F        .db $0F
  $8BC1  1C        .db $1C
  $8BC2  30 31     BMI $8BF5
  $8BC4  36 20     ROL $20,X
  $8BC6  20 17 0F  JSR $0F17
  $8BC9  0F        .db $0F
  $8BCA  04        .db $04
  $8BCB  0D 01 0E  ORA $0E01
  $8BCE  0D 01 13  ORA $1301
  $8BD1  01 0B     ORA ($0B,X)
  $8BD3  01 14     ORA ($14,X)

L_8BD5:
  $8BD5  13        .db $13
  $8BD6  15 20     ORA $20,X
  $8BD8  09 03     ORA #$03
  $8BDA  08        PHP
  $8BDB  09 0B     ORA #$0B
  $8BDD  01 17     ORA ($17,X)
  $8BDF  01 24     ORA ($24,X)
  $8BE1  4C 5C 6C  JMP $6C5C
  $8BE4  7C        .db $7C
  $8BE5  8C 9C 04  STY $049C
  $8BE8  2C 3C 4C  BIT $4C3C
  $8BEB  A4 CC     LDY $CC
  $8BED  34        .db $34
  $8BEE  5C        .db $5C
  $8BEF  C4 0C     CPY $0C
  $8BF1  1C        .db $1C
  $8BF2  2C 3C 4C  BIT $4C3C

L_8BF5:
  $8BF5  5C        .db $5C
  $8BF6  6C 7C 8C  JMP ($8C7C)
  $8BF9  9C        .db $9C
  $8BFA  AC BC CC  LDY $CCBC
  $8BFD  DC        .db $DC
  $8BFE  EC 0C 1C  CPX $1C0C
  $8C01  2C 3C 4C  BIT $4C3C
  $8C04  5C        .db $5C
  $8C05  6C 7C 8C  JMP ($8C7C)
  $8C08  9C        .db $9C
  $8C09  AC BC CC  LDY $CCBC
  $8C0C  DC        .db $DC
  $8C0D  EC 0C 1C  CPX $1C0C
  $8C10  2C 3C 4C  BIT $4C3C
  $8C13  5C        .db $5C
  $8C14  6C 7C 8C  JMP ($8C7C)
  $8C17  9C        .db $9C
  $8C18  AC EC 64  LDY $64EC
  $8C1B  74        .db $74
  $8C1C  01 87     ORA ($87,X)
  $8C1E  2B        .db $2B
  $8C1F  6C AC EC  JMP ($ECAC)
  $8C22  2B        .db $2B
  $8C23  6E 08 AA  ROR $AA08
  $8C26  EA        NOP
  $8C27  28        PLP
  $8C28  8B        .db $8B
  $8C29  2D CC 6E  AND $6ECC
  $8C2C  08        PHP
  $8C2D  27        .db $27
  $8C2E  68        PLA
  $8C2F  A9 E8     LDA #$E8
  $8C31  27        .db $27
  $8C32  67        .db $67
  $8C33  A7        .db $A7
  $8C34  E7        .db $E7
  $8C35  2C 67 A7  BIT $A767
  $8C38  E7        .db $E7
  $8C39  2C 69 AA  BIT $AA69
  $8C3C  28        PLP
  $8C3D  69 A8     ADC #$A8
  $8C3F  E9 2A     SBC #$2A
  $8C41  68        PLA
  $8C42  A9 E7     LDA #$E7
  $8C44  29 69     AND #$69
  $8C46  AB        .db $AB
  $8C47  E7        .db $E7
  $8C48  28        PLP
  $8C49  66 AA     ROR $AA
  $8C4B  27        .db $27
  $8C4C  67        .db $67
  $8C4D  AA        TAX
  $8C4E  E9 2A     SBC #$2A
  $8C50  66 A6     ROR $A6
  $8C52  E6 26     INC $26
  $8C54  68        PLA
  $8C55  AB        .db $AB
  $8C56  A5 8A     LDA $8A
  $8C58  CA        DEX
  $8C59  12        .db $12
  $8C5A  09 08     ORA #$08
  $8C5C  07        .db $07
  $8C5D  08        PHP
  $8C5E  0A        ASL
  $8C5F  03        .db $03
  $8C60  10 0C     BPL $8C6E
  $8C62  0C        .db $0C
  $8C63  10 0A     BPL $8C6F
  $8C65  06 07     ASL $07
  $8C67  03        .db $03
  $8C68  0E 10 0D  ASL $0D10
  $8C6B  0F        .db $0F
  $8C6C  0D 12 10  ORA $1012

L_8C6F:
  $8C6F  0E 0F 0C  ASL $0C0F
  $8C72  0F        .db $0F
  $8C73  0E 0F 09  ASL $090F
  $8C76  0D 0C 0F  ORA $0F0C
  $8C79  0F        .db $0F
  $8C7A  10 0C     BPL $8C88

L_8C7C:
  $8C7C  0C        .db $0C
  $8C7D  0D 0D 11  ORA $110D
  $8C80  10 0F     BPL $8C91
  $8C82  0B        .db $0B
  $8C83  10 0D     BPL $8C92
  $8C85  0F        .db $0F
  $8C86  0E 0F 0D  ASL $0D0F
  $8C89  0E 0C 0E  ASL $0E0C
  $8C8C  10 10     BPL $8C9E
  $8C8E  15 0F     ORA $0F,X
  $8C90  0C        .db $0C

L_8C91:
  $8C91  08        PHP

L_8C92:
  $8C92  18        CLC
  $8C93  0C        .db $0C
  $8C94  0D 03 08  ORA $0803
  $8C97  01 12     ORA ($12,X)
  $8C99  01 03     ORA ($03,X)
  $8C9B  14        .db $14
  $8C9C  05 12     ORA $12

L_8C9E:
  $8C9E  20 04 05  JSR $0504
  $8CA1  13        .db $13
  $8CA2  09 07     ORA #$07
  $8CA4  0E 05 12  ASL $1205
  $8CA7  19 01 13  ORA $1301,Y
  $8CAA  15 0B     ORA $0B,X
  $8CAC  09 03     ORA #$03
  $8CAE  08        PHP
  $8CAF  09 09     ORA #$09
  $8CB1  0E 01 06  ASL $0601
  $8CB4  0B        .db $0B
  $8CB5  09 0E     ORA #$0E
  $8CB7  07        .db $07
  $8CB8  14        .db $14
  $8CB9  0F        .db $0F
  $8CBA  0D 20 10  ORA $1020
  $8CBD  0F        .db $0F
  $8CBE  0E 0E 01  ASL $010E
  $8CC1  07        .db $07
  $8CC2  09 0E     ORA #$0E
  $8CC4  05 0B     ORA $0B
  $8CC6  0F        .db $0F
  $8CC7  32        .db $32
  $8CC8  0D 30 33  ORA $3330
  $8CCB  03        .db $03
  $8CCC  0D 20 0D  ORA $0D20
  $8CCF  01 0E     ORA ($0E,X)
  $8CD1  01 1C     ORA ($1C,X)
  $8CD3  0B        .db $0B
  $8CD4  13        .db $13
  $8CD5  0F        .db $0F
  $8CD6  15 0E     ORA $0E,X
  $8CD8  04        .db $04
  $8CD9  20 10 12  JSR $1210
  $8CDC  0F        .db $0F
  $8CDD  07        .db $07
  $8CDE  12        .db $12
  $8CDF  01 0D     ORA ($0D,X)
  $8CE1  0D 05 12  ORA $1205
  $8CE4  0F        .db $0F
  $8CE5  07        .db $07
  $8CE6  05 12     ORA $12
  $8CE8  05 14     ORA $14
  $8CEA  13        .db $13
  $8CEB  15 20     ORA $20,X
  $8CED  0B        .db $0B
  $8CEE  15 0E     ORA $0E,X
  $8CF0  0D 01 0E  ORA $0E01
  $8CF3  01 0D     ORA ($0D,X)
  $8CF5  09 20     ORA #$20
  $8CF7  09 05     ORA #$05
  $8CF9  14        .db $14
  $8CFA  05 0C     ORA $0C
  $8CFC  19 15 15  ORA $1515,Y
  $8CFF  0B        .db $0B
  $8D00  09 03     ORA #$03
  $8D02  08        PHP
  $8D03  01 0E     ORA ($0E,X)
  $8D05  1E 13 20  ASL $2013,X
  $8D08  10 01     BPL $8D0B
  $8D0A  10 01     BPL $8D0D
  $8D0C  10 12     BPL $8D20
  $8D0E  0F        .db $0F
  $8D0F  07        .db $07
  $8D10  12        .db $12
  $8D11  01 0D     ORA ($0D,X)
  $8D13  0D 05 12  ORA $1205
  $8D16  08        PHP
  $8D17  1C        .db $1C
  $8D18  0D 1C 04  ORA $041C
  $8D1B  1C        .db $1C
  $8D1C  10 0C     BPL $8D2A
  $8D1E  01 0E     ORA ($0E,X)

L_8D20:
  $8D20  0E 05 12  ASL $1205
  $8D23  01 1C     ORA ($1C,X)
  $8D25  0B        .db $0B
  $8D26  13        .db $13
  $8D27  10 05     BPL $8D2E
  $8D29  03        .db $03

L_8D2A:
  $8D2A  09 01     ORA #$01
  $8D2C  0C        .db $0C
  $8D2D  20 14 08  JSR $0814
  $8D30  01 0E     ORA ($0E,X)
  $8D32  0B        .db $0B
  $8D33  13        .db $13
  $8D34  08        PHP
  $8D35  09 12     ORA #$12
  $8D37  0F        .db $0F
  $8D38  19 15 0B  ORA $0B15,Y
  $8D3B  09 20     ORA #$20
  $8D3D  0D 01 05  ORA $0501
  $8D40  14        .db $14
  $8D41  01 0E     ORA ($0E,X)
  $8D43  09 14     ORA #$14
  $8D45  01 14     ORA ($14,X)
  $8D47  13        .db $13
  $8D48  15 19     ORA $19,X
  $8D4A  01 20     ORA ($20,X)
  $8D4C  0B        .db $0B
  $8D4D  01 13     ORA ($13,X)
  $8D4F  01 09     ORA ($09,X)
  $8D51  0D 01 0D  ORA $0D01
  $8D54  0F        .db $0F
  $8D55  12        .db $12
  $8D56  15 20     ORA $20,X
  $8D58  01 13     ORA ($13,X)
  $8D5A  0F        .db $0F
  $8D5B  13        .db $13
  $8D5C  08        PHP
  $8D5D  09 0E     ORA #$0E
  $8D5F  01 0A     ORA ($0A,X)
  $8D61  15 0E     ORA $0E,X
  $8D63  09 03     ORA #$03
  $8D65  08        PHP
  $8D66  09 20     ORA #$20
  $8D68  0B        .db $0B
  $8D69  01 0E     ORA ($0E,X)
  $8D6B  04        .db $04
  $8D6C  01 0D     ORA ($0D,X)
  $8D6E  01 13     ORA ($13,X)
  $8D70  01 08     ORA ($08,X)
  $8D72  09 12     ORA #$12
  $8D74  0F        .db $0F
  $8D75  20 14 01  JSR $0114
  $8D78  0B        .db $0B
  $8D79  01 08     ORA ($08,X)
  $8D7B  01 13     ORA ($13,X)
  $8D7D  08        PHP
  $8D7E  09 01     ORA #$01
  $8D80  0B        .db $0B
  $8D81  09 0D     ORA #$0D
  $8D83  09 14     ORA #$14
  $8D85  13        .db $13
  $8D86  15 20     ORA $20,X
  $8D88  14        .db $14
  $8D89  13        .db $13
  $8D8A  15 02     ORA $02,X
  $8D8C  01 14     ORA ($14,X)
  $8D8E  01 19     ORA ($19,X)
  $8D90  0F        .db $0F
  $8D91  13        .db $13
  $8D92  08        PHP
  $8D93  09 01     ORA #$01
  $8D95  0B        .db $0B
  $8D96  09 20     ORA #$20
  $8D98  07        .db $07
  $8D99  0F        .db $0F
  $8D9A  14        .db $14
  $8D9B  0F        .db $0F
  $8D9C  15 0B     ORA $0B,X
  $8D9E  01 1A     ORA ($1A,X)
  $8DA0  15 0E     ORA $0E,X
  $8DA2  01 12     ORA ($12,X)
  $8DA4  09 20     ORA #$20
  $8DA6  13        .db $13
  $8DA7  15 1A     ORA $1A,X
  $8DA9  15 0B     ORA $0B,X
  $8DAB  09 19     ORA #$19
  $8DAD  15 15     ORA $15,X
  $8DAF  20 19 01  JSR $0119
  $8DB2  0D 01 1A  ORA $1A01
  $8DB5  01 0B     ORA ($0B,X)
  $8DB7  09 14     ORA #$14
  $8DB9  0F        .db $0F
  $8DBA  0D 0F 08  ORA $080F
  $8DBD  09 12     ORA #$12
  $8DBF  0F        .db $0F
  $8DC0  20 08 0F  JSR $0F08
  $8DC3  13        .db $13
  $8DC4  0F        .db $0F
  $8DC5  19 01 19  ORA $1901,Y
  $8DC8  0F        .db $0F
  $8DC9  13        .db $13
  $8DCA  08        PHP
  $8DCB  09 01     ORA #$01
  $8DCD  0B        .db $0B
  $8DCE  09 20     ORA #$20
  $8DD0  0E 01 0E  ASL $0E01
  $8DD3  0B        .db $0B
  $8DD4  09 19     ORA #$19
  $8DD6  01 13     ORA ($13,X)
  $8DD8  15 08     ORA $08,X
  $8DDA  09 14     ORA #$14
  $8DDC  0F        .db $0F
  $8DDD  20 13 01  JSR $0113
  $8DE0  13        .db $13
  $8DE1  01 0B     ORA ($0B,X)
  $8DE3  09 0A     ORA #$0A
  $8DE5  15 0E     ORA $0E,X
  $8DE7  20 0B 01  JSR $010B
  $8DEA  14        .db $14
  $8DEB  0F        .db $0F
  $8DEC  15 13     ORA $13,X
  $8DEE  05 09     ORA $09
  $8DF0  0B        .db $0B
  $8DF1  0F        .db $0F
  $8DF2  15 20     ORA $20,X
  $8DF4  0A        ASL
  $8DF5  0F        .db $0F
  $8DF6  15 07     ORA $07,X
  $8DF8  01 0E     ORA ($0E,X)
  $8DFA  0B        .db $0B
  $8DFB  05 0E     ORA $0E
  $8DFD  0A        ASL
  $8DFE  09 20     ORA #$20
  $8E00  0B        .db $0B
  $8E01  09 0E     ORA #$0E
  $8E03  0F        .db $0F
  $8E04  15 05     ORA $05,X
  $8E06  14        .db $14
  $8E07  01 0B     ORA ($0B,X)
  $8E09  01 13     ORA ($13,X)
  $8E0B  08        PHP
  $8E0C  09 20     ORA #$20
  $8E0E  15 0D     ORA $0D,X
  $8E10  05 1A     ORA $1A
  $8E12  01 17     ORA ($17,X)
  $8E14  01 0B     ORA ($0B,X)
  $8E16  01 1A     ORA ($1A,X)
  $8E18  15 19     ORA $19,X
  $8E1A  01 20     ORA ($20,X)
  $8E1C  17        .db $17
  $8E1D  01 0B     ORA ($0B,X)
  $8E1F  01 1A     ORA ($1A,X)
  $8E21  15 0B     ORA $0B,X
  $8E23  09 0D     ORA #$0D
  $8E25  01 13     ORA ($13,X)
  $8E27  01 13     ORA ($13,X)
  $8E29  08        PHP
  $8E2A  09 20     ORA #$20
  $8E2C  19 01 0D  ORA $0D01,Y
  $8E2F  01 15     ORA ($15,X)
  $8E31  03        .db $03
  $8E32  08        PHP
  $8E33  09 0D     ORA #$0D
  $8E35  01 0B     ORA ($0B,X)
  $8E37  0F        .db $0F
  $8E38  14        .db $14
  $8E39  0F        .db $0F
  $8E3A  20 0F 07  JSR $070F
  $8E3D  0F        .db $0F
  $8E3E  0D 01 13  ORA $1301
  $8E41  05 09     ORA $09
  $8E43  0A        ASL
  $8E44  09 20     ORA #$20
  $8E46  14        .db $14
  $8E47  01 0E     ORA ($0E,X)
  $8E49  01 0B     ORA ($0B,X)
  $8E4B  01 08     ORA ($08,X)
  $8E4D  09 04     ORA #$04
  $8E4F  05 01     ORA $01
  $8E51  0B        .db $0B
  $8E52  09 20     ORA #$20
  $8E54  0B        .db $0B
  $8E55  01 17     ORA ($17,X)
  $8E57  01 09     ORA ($09,X)
  $8E59  12        .db $12
  $8E5A  19 0F 15  ORA $150F,Y
  $8E5D  0A        ASL
  $8E5E  09 20     ORA #$20
  $8E60  19 01 13  ORA $1301,Y
  $8E63  15 04     ORA $04,X
  $8E65  01 14     ORA ($14,X)
  $8E67  01 0B     ORA ($0B,X)
  $8E69  01 19     ORA ($19,X)
  $8E6B  15 0B     ORA $0B,X
  $8E6D  09 20     ORA #$20
  $8E6F  17        .db $17
  $8E70  01 0B     ORA ($0B,X)
  $8E72  09 13     ORA #$13
  $8E74  01 0B     ORA ($0B,X)
  $8E76  01 14     ORA ($14,X)
  $8E78  01 0B     ORA ($0B,X)
  $8E7A  15 0D     ORA $0D,X
  $8E7C  09 20     ORA #$20
  $8E7E  19 0F 13  ORA $130F,Y
  $8E81  08        PHP
  $8E82  09 0E     ORA #$0E
  $8E84  01 07     ORA ($07,X)
  $8E86  01 19     ORA ($19,X)
  $8E88  01 13     ORA ($13,X)
  $8E8A  15 14     ORA $14,X
  $8E8C  0F        .db $0F
  $8E8D  20 0E 01  JSR $010E
  $8E90  0B        .db $0B
  $8E91  01 0D     ORA ($0D,X)
  $8E93  15 12     ORA $12,X
  $8E95  01 13     ORA ($13,X)
  $8E97  08        PHP
  $8E98  09 0E     ORA #$0E
  $8E9A  20 09 05  JSR $0509
  $8E9D  0E 01 0B  ASL $0B01
  $8EA0  01 08     ORA ($08,X)
  $8EA2  09 12     ORA #$12
  $8EA4  0F        .db $0F
  $8EA5  06 15     ASL $15
  $8EA7  0D 09 20  ORA $2009
  $8EAA  0D 0F 12  ORA $120F
  $8EAD  09 09     ORA #$09
  $8EAF  17        .db $17
  $8EB0  01 14     ORA ($14,X)
  $8EB2  05 14     ORA $14
  $8EB4  13        .db $13
  $8EB5  15 19     ORA $19,X
  $8EB7  01 20     ORA ($20,X)
  $8EB9  0D 09 15  ORA $1509
  $8EBC  12        .db $12
  $8EBD  01 0D     ORA ($0D,X)
  $8EBF  09 03     ORA #$03
  $8EC1  08        PHP
  $8EC2  09 0E     ORA #$0E
  $8EC4  01 12     ORA ($12,X)
  $8EC6  09 20     ORA #$20
  $8EC8  13        .db $13
  $8EC9  01 14     ORA ($14,X)
  $8ECB  0F        .db $0F
  $8ECC  15 19     ORA $19,X
  $8ECE  15 0B     ORA $0B,X
  $8ED0  09 0F     ORA #$0F
  $8ED2  20 08 01  JSR $0108
  $8ED5  13        .db $13
  $8ED6  05 07     ORA $07
  $8ED8  01 17     ORA ($17,X)
  $8EDA  01 08     ORA ($08,X)
  $8EDC  09 12     ORA #$12
  $8EDE  0F        .db $0F
  $8EDF  19 15 0B  ORA $0B15,Y
  $8EE2  09 20     ORA #$20
  $8EE4  14        .db $14
  $8EE5  01 0E     ORA ($0E,X)
  $8EE7  0E 01 09  ASL $0901
  $8EEA  0D 09 03  ORA $0309
  $8EED  08        PHP
  $8EEE  09 01     ORA #$01
  $8EF0  0B        .db $0B
  $8EF1  09 20     ORA #$20
  $8EF3  08        PHP
  $8EF4  01 0D     ORA ($0D,X)
  $8EF6  01 14     ORA ($14,X)
  $8EF8  01 0B     ORA ($0B,X)
  $8EFA  05 0F     ORA $0F
  $8EFC  20 0D 0F  JSR $0F0D
  $8EFF  12        .db $12
  $8F00  09 0D     ORA #$0D
  $8F02  0F        .db $0F
  $8F03  14        .db $14
  $8F04  0F        .db $0F
  $8F05  0D 01 13  ORA $1301
  $8F08  01 0B     ORA ($0B,X)
  $8F0A  09 20     ORA #$20
  $8F0C  13        .db $13
  $8F0D  01 14     ORA ($14,X)
  $8F0F  0F        .db $0F
  $8F10  15 19     ORA $19,X
  $8F12  0F        .db $0F
  $8F13  15 0A     ORA $0A,X
  $8F15  09 20     ORA #$20
  $8F17  0D 09 19  ORA $1909
  $8F1A  01 0D     ORA ($0D,X)
  $8F1C  0F        .db $0F
  $8F1D  14        .db $14
  $8F1E  0F        .db $0F
  $8F1F  13        .db $13
  $8F20  08        PHP
  $8F21  09 07     ORA #$07
  $8F23  05 08     ORA $08
  $8F25  09 13     ORA #$13
  $8F27  01 20     ORA ($20,X)
  $8F29  09 09     ORA #$09
  $8F2B  0E 15 0D  ASL $0D15
  $8F2E  01 19     ORA ($19,X)
  $8F30  0F        .db $0F
  $8F31  13        .db $13
  $8F32  08        PHP
  $8F33  09 14     ORA #$14
  $8F35  0F        .db $0F
  $8F36  0D 0F 20  ORA $200F
  $8F39  0B        .db $0B
  $8F3A  0F        .db $0F
  $8F3B  04        .db $04
  $8F3C  01 0D     ORA ($0D,X)
  $8F3E  01 14     ORA ($14,X)
  $8F40  01 0B     ORA ($0B,X)
  $8F42  05 14     ORA $14
  $8F44  13        .db $13
  $8F45  15 07     ORA $07,X
  $8F47  15 20     ORA $20,X
  $8F49  17        .db $17
  $8F4A  01 0B     ORA ($0B,X)
  $8F4C  01 02     ORA ($02,X)
  $8F4E  01 19     ORA ($19,X)
  $8F50  01 13     ORA ($13,X)
  $8F52  08        PHP
  $8F53  09 14     ORA #$14
  $8F55  0F        .db $0F
  $8F56  13        .db $13
  $8F57  08        PHP
  $8F58  09 14     ORA #$14
  $8F5A  05 12     ORA $12
  $8F5C  15 20     ORA $20,X
  $8F5E  0F        .db $0F
  $8F5F  07        .db $07
  $8F60  15 12     ORA $12,X
  $8F62  01 14     ORA ($14,X)
  $8F64  01 0B     ORA ($0B,X)
  $8F66  05 13     ORA $13
  $8F68  08        PHP
  $8F69  09 20     ORA #$20
  $8F6B  01 12     ORA ($12,X)
  $8F6D  01 09     ORA ($09,X)
  $8F6F  06 09     ASL $09
  $8F71  13        .db $13
  $8F72  08        PHP
  $8F73  20 0D 01  JSR $010D
  $8F76  0E 14 08  ASL $0814
  $8F79  01 0E     ORA ($0E,X)
  $8F7B  0B        .db $0B
  $8F7C  20 19 0F  JSR $0F19
  $8F7F  15 20     ORA $20,X
  $8F81  06 0F     ASL $0F
  $8F83  12        .db $12
  $8F84  20 10 0C  JSR $0C10
  $8F87  01 19     ORA ($19,X)
  $8F89  09 0E     ORA #$0E
  $8F8B  07        .db $07
  $8F8C  1C        .db $1C
  $8F8D  1C        .db $1C
  $8F8E  1C        .db $1C
  $8F8F  10 12     BPL $8FA3
  $8F91  05 13     ORA $13
  $8F93  05 0E     ORA $0E
  $8F95  14        .db $14
  $8F96  05 04     ORA $04
  $8F98  20 02 19  JSR $1902
  $8F9B  03        .db $03
  $8F9C  01 10     ORA ($10,X)
  $8F9E  03        .db $03

L_8F9F:
  $8F9F  0F        .db $0F
  $8FA0  0D 20 15  ORA $1520

L_8FA3:
  $8FA3  1C        .db $1C
  $8FA4  13        .db $13
  $8FA5  1C        .db $1C
  $8FA6  01 1C     ORA ($1C,X)
  $8FA8  FF        .db $FF
  $8FA9  FF        .db $FF
  $8FAA  FF        .db $FF
  $8FAB  FF        .db $FF
  $8FAC  FF        .db $FF
  $8FAD  FF        .db $FF
  $8FAE  FF        .db $FF
  $8FAF  FF        .db $FF
  $8FB0  FF        .db $FF
  $8FB1  FF        .db $FF
  $8FB2  FF        .db $FF
  $8FB3  FF        .db $FF
  $8FB4  FF        .db $FF
  $8FB5  FF        .db $FF
  $8FB6  FF        .db $FF
  $8FB7  FF        .db $FF
  $8FB8  FF        .db $FF
  $8FB9  FF        .db $FF
  $8FBA  FF        .db $FF
  $8FBB  FF        .db $FF
  $8FBC  FF        .db $FF
  $8FBD  FF        .db $FF
  $8FBE  FF        .db $FF
  $8FBF  FF        .db $FF
  $8FC0  FF        .db $FF
  $8FC1  FF        .db $FF
  $8FC2  FF        .db $FF
  $8FC3  FF        .db $FF
  $8FC4  FF        .db $FF
  $8FC5  FF        .db $FF
  $8FC6  FF        .db $FF
  $8FC7  FF        .db $FF
  $8FC8  FF        .db $FF
  $8FC9  FF        .db $FF
  $8FCA  FF        .db $FF
  $8FCB  FF        .db $FF
  $8FCC  FF        .db $FF
  $8FCD  FF        .db $FF
  $8FCE  FF        .db $FF
  $8FCF  FF        .db $FF
  $8FD0  FF        .db $FF
  $8FD1  FF        .db $FF
  $8FD2  FF        .db $FF
  $8FD3  FF        .db $FF
  $8FD4  FF        .db $FF
  $8FD5  FF        .db $FF
  $8FD6  FF        .db $FF
  $8FD7  FF        .db $FF
  $8FD8  FF        .db $FF
  $8FD9  FF        .db $FF
  $8FDA  FF        .db $FF
  $8FDB  FF        .db $FF
  $8FDC  FF        .db $FF
  $8FDD  FF        .db $FF
  $8FDE  FF        .db $FF
  $8FDF  FF        .db $FF
  $8FE0  FF        .db $FF
  $8FE1  FF        .db $FF
  $8FE2  FF        .db $FF
  $8FE3  FF        .db $FF
  $8FE4  FF        .db $FF
  $8FE5  FF        .db $FF
  $8FE6  FF        .db $FF
  $8FE7  FF        .db $FF
  $8FE8  FF        .db $FF
  $8FE9  FF        .db $FF
  $8FEA  FF        .db $FF
  $8FEB  FF        .db $FF
  $8FEC  FF        .db $FF
  $8FED  FF        .db $FF
  $8FEE  FF        .db $FF
  $8FEF  FF        .db $FF
  $8FF0  FF        .db $FF
  $8FF1  FF        .db $FF
  $8FF2  FF        .db $FF
  $8FF3  FF        .db $FF
  $8FF4  FF        .db $FF
  $8FF5  FF        .db $FF
  $8FF6  FF        .db $FF
  $8FF7  FF        .db $FF
  $8FF8  FF        .db $FF
  $8FF9  FF        .db $FF
  $8FFA  FF        .db $FF
  $8FFB  FF        .db $FF
  $8FFC  FF        .db $FF
  $8FFD  FF        .db $FF
  $8FFE  FF        .db $FF
  $8FFF  FF        .db $FF
  $9000  00        BRK
  $9001  00        BRK
  $9002  00        BRK
  $9003  00        BRK
  $9004  00        BRK
  $9005  00        BRK
  $9006  00        BRK
  $9007  00        BRK
  $9008  00        BRK
  $9009  00        BRK
  $900A  00        BRK
  $900B  00        BRK
  $900C  00        BRK
  $900D  00        BRK
  $900E  00        BRK
  $900F  00        BRK
  $9010  00        BRK
  $9011  00        BRK
  $9012  00        BRK
  $9013  00        BRK
  $9014  18        CLC
  $9015  18        CLC
  $9016  00        BRK
  $9017  00        BRK
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  1C        .db $1C
  $901C  26 26     ROL $26
  $901E  3E 1C 00  ROL $001C,X
  $9021  00        BRK
  $9022  00        BRK
  $9023  00        BRK
  $9024  00        BRK
  $9025  07        .db $07
  $9026  38        SEC
  $9027  C0 00     CPY #$00
  $9029  00        BRK
  $902A  00        BRK
  $902B  00        BRK
  $902C  00        BRK
  $902D  00        BRK
  $902E  07        .db $07
  $902F  3F        .db $3F
  $9030  00        BRK
  $9031  00        BRK
  $9032  00        BRK
  $9033  00        BRK
  $9034  F8        SED
  $9035  04        .db $04
  $9036  04        .db $04
  $9037  04        .db $04
  $9038  00        BRK
  $9039  00        BRK
  $903A  00        BRK
  $903B  00        BRK
  $903C  00        BRK
  $903D  F8        SED
  $903E  FA        .db $FA
  $903F  FA        .db $FA
  $9040  00        BRK
  $9041  03        .db $03
  $9042  07        .db $07
  $9043  07        .db $07
  $9044  0F        .db $0F
  $9045  1F        .db $1F
  $9046  1F        .db $1F
  $9047  3F        .db $3F
  $9048  00        BRK
  $9049  03        .db $03
  $904A  07        .db $07
  $904B  07        .db $07
  $904C  0D 19 13  ORA $1319
  $904F  33        .db $33
  $9050  00        BRK
  $9051  C0 E0     CPY #$E0
  $9053  E0 F0     CPX #$F0
  $9055  F8        SED
  $9056  F8        SED
  $9057  FC        .db $FC
  $9058  00        BRK
  $9059  C0 E0     CPY #$E0
  $905B  E0 F0     CPX #$F0
  $905D  F8        SED
  $905E  F8        SED
  $905F  FC        .db $FC
  $9060  FF        .db $FF
  $9061  FF        .db $FF
  $9062  FF        .db $FF
  $9063  FF        .db $FF
  $9064  FF        .db $FF
  $9065  FF        .db $FF
  $9066  FF        .db $FF
  $9067  FF        .db $FF
  $9068  00        BRK
  $9069  00        BRK
  $906A  00        BRK
  $906B  00        BRK
  $906C  00        BRK
  $906D  00        BRK
  $906E  00        BRK
  $906F  00        BRK
  $9070  00        BRK
  $9071  00        BRK
  $9072  00        BRK
  $9073  00        BRK
  $9074  03        .db $03
  $9075  04        .db $04
  $9076  02        .db $02
  $9077  02        .db $02
  $9078  00        BRK
  $9079  00        BRK
  $907A  00        BRK
  $907B  00        BRK
  $907C  03        .db $03
  $907D  07        .db $07
  $907E  05 05     ORA $05
  $9080  00        BRK
  $9081  04        .db $04
  $9082  20 80 82  JSR $8280
  $9085  80        .db $80
  $9086  8F        .db $8F
  $9087  8B        .db $8B
  $9088  00        BRK
  $9089  07        .db $07
  $908A  3F        .db $3F
  $908B  FF        .db $FF
  $908C  7E 79 68  ROR $6879,X
  $908F  57        .db $57
  $9090  FF        .db $FF
  $9091  00        BRK
  $9092  06 4C     ASL $4C
  $9094  4F        .db $4F
  $9095  F8        SED
  $9096  7F        .db $7F
  $9097  00        BRK
  $9098  FF        .db $FF
  $9099  FF        .db $FF
  $909A  FE CF 70  INC $70CF,X
  $909D  07        .db $07
  $909E  FF        .db $FF
  $909F  00        BRK
  $90A0  FF        .db $FF
  $90A1  01 00     ORA ($00,X)
  $90A3  FE FF 00  INC $00FF,X
  $90A6  0F        .db $0F
  $90A7  F1 FF     SBC ($FF),Y
  $90A9  FF        .db $FF
  $90AA  00        BRK
  $90AB  01 00     ORA ($00,X)
  $90AD  FF        .db $FF
  $90AE  0F        .db $0F
  $90AF  F1 A0     SBC ($A0),Y
  $90B1  F8        SED
  $90B2  3C        .db $3C
  $90B3  07        .db $07
  $90B4  E0 F0     CPX #$F0
  $90B6  82        .db $82
  $90B7  E5 A1     SBC $A1
  $90B9  F9 3C C7  SBC $C73C,Y
  $90BC  18        CLC
  $90BD  09 F3     ORA #$F3
  $90BF  E6 02     INC $02
  $90C1  09 17     ORA #$17
  $90C3  4F        .db $4F
  $90C4  BF        .db $BF
  $90C5  7F        .db $7F
  $90C6  FF        .db $FF
  $90C7  FF        .db $FF
  $90C8  83        .db $83
  $90C9  8E 98 70  STX $7098
  $90CC  C0 80     CPY #$80
  $90CE  00        BRK

L_90CF:
  $90CF  00        BRK
  $90D0  60        RTS
  $90D1  F0 78     BEQ $914B
  $90D3  3C        .db $3C
  $90D4  1E 0F 07  ASL $070F,X
  $90D7  06 60     ASL $60
  $90D9  D0 68     BNE $9143
  $90DB  34        .db $34
  $90DC  1A        .db $1A
  $90DD  0E 06 01  ASL $0106
  $90E0  FF        .db $FF
  $90E1  FF        .db $FF
  $90E2  FF        .db $FF
  $90E3  FF        .db $FF
  $90E4  FF        .db $FF
  $90E5  F7        .db $F7
  $90E6  FD F0 00  SBC $00F0,X
  $90E9  00        BRK
  $90EA  00        BRK
  $90EB  00        BRK
  $90EC  00        BRK
  $90ED  08        PHP
  $90EE  02        .db $02
  $90EF  0F        .db $0F
  $90F0  F7        .db $F7
  $90F1  FD F6 DA  SBC $DAF6,X
  $90F4  74        .db $74
  $90F5  D8        CLD
  $90F6  60        RTS
  $90F7  00        BRK
  $90F8  08        PHP
  $90F9  02        .db $02
  $90FA  09 25     ORA #$25
  $90FC  8B        .db $8B
  $90FD  27        .db $27
  $90FE  9F        .db $9F
  $90FF  FF        .db $FF
  $9100  03        .db $03
  $9101  02        .db $02
  $9102  01 00     ORA ($00,X)
  $9104  00        BRK
  $9105  00        BRK
  $9106  01 02     ORA ($02,X)
  $9108  02        .db $02
  $9109  03        .db $03
  $910A  01 00     ORA ($00,X)
  $910C  00        BRK
  $910D  00        BRK
  $910E  00        BRK
  $910F  01 01     ORA ($01,X)
  $9111  84 48     STY $48
  $9113  A0 50     LDY #$50
  $9115  88        DEY
  $9116  25 12     AND $12
  $9118  00        BRK
  $9119  03        .db $03
  $911A  87        .db $87
  $911B  CF        .db $CF
  $911C  67        .db $67
  $911D  33        .db $33
  $911E  B9 DC 00  LDA $00DC,Y
  $9121  00        BRK
  $9122  00        BRK
  $9123  40        RTI
  $9124  20 30 1F  JSR $1F30
  $9127  9E        .db $9E
  $9128  FF        .db $FF
  $9129  FF        .db $FF
  $912A  FF        .db $FF
  $912B  FF        .db $FF
  $912C  FF        .db $FF
  $912D  FF        .db $FF
  $912E  FF        .db $FF
  $912F  FE 04 08  INC $0804,X
  $9132  08        PHP
  $9133  10 12     BPL $9147
  $9135  62        .db $62
  $9136  C2        .db $C2
  $9137  C0 FA     CPY #$FA
  $9139  F6 F6     INC $F6,X
  $913B  EE EE DE  INC $DEEE
  $913E  BE BC 3F  LDX $3FBC,Y
  $9141  7F        .db $7F
  $9142  7F        .db $7F

L_9143:
  $9143  FF        .db $FF
  $9144  FF        .db $FF
  $9145  F0 8F     BEQ $90D6

L_9147:
  $9147  7F        .db $7F
  $9148  23        .db $23
  $9149  67        .db $67
  $914A  7F        .db $7F

L_914B:
  $914B  FF        .db $FF
  $914C  FF        .db $FF
  $914D  F0 80     BEQ $90CF
  $914F  00        BRK
  $9150  FC        .db $FC
  $9151  FE FE FF  INC $FFFE,X
  $9154  FF        .db $FF
  $9155  1F        .db $1F
  $9156  E3        .db $E3
  $9157  FC        .db $FC
  $9158  FC        .db $FC
  $9159  FE FE FF  INC $FFFE,X
  $915C  FF        .db $FF
  $915D  1F        .db $1F
  $915E  03        .db $03
  $915F  00        BRK
  $9160  01 02     ORA ($02,X)
  $9162  04        .db $04
  $9163  08        PHP
  $9164  10 23     BPL $9189
  $9166  78        SEI
  $9167  01 01     ORA ($01,X)
  $9169  03        .db $03
  $916A  07        .db $07
  $916B  0F        .db $0F
  $916C  1F        .db $1F
  $916D  3F        .db $3F
  $916E  78        SEI
  $916F  00        BRK
  $9170  02        .db $02
  $9171  1C        .db $1C
  $9172  16 72     ASL $72,X
  $9174  32        .db $32
  $9175  01 21     ORA ($21,X)
  $9177  05 05     ORA $05
  $9179  1F        .db $1F
  $917A  2F        .db $2F
  $917B  4F        .db $4F
  $917C  4F        .db $4F
  $917D  7D 5D 7D  ADC $7D5D,X
  $9180  A0 9F     LDY #$9F
  $9182  80        .db $80
  $9183  80        .db $80
  $9184  80        .db $80
  $9185  82        .db $82
  $9186  8F        .db $8F
  $9187  8B        .db $8B
  $9188  60        RTS

L_9189:
  $9189  7F        .db $7F
  $918A  7F        .db $7F
  $918B  7F        .db $7F
  $918C  7E 7B 68  ROR $687B,X
  $918F  57        .db $57
  $9190  EF        .db $EF
  $9191  6F        .db $6F
  $9192  EF        .db $EF
  $9193  F7        .db $F7
  $9194  67        .db $67
  $9195  EF        .db $EF
  $9196  3E D3 2D  ROL $2DD3,X
  $9199  29 89     AND #$89
  $919B  B4 64     LDY $64,X
  $919D  CD 1C D3  CMP $D31C
  $91A0  FF        .db $FF
  $91A1  FF        .db $FF
  $91A2  F6 F4     INC $F4,X
  $91A4  6A        ROR
  $91A5  4E 53 A2  LSR $A253
  $91A8  39 73 72  AND $7273,Y
  $91AB  F4        .db $F4
  $91AC  6A        ROR
  $91AD  4E 53 A2  LSR $A253
  $91B0  4B        .db $4B
  $91B1  13        .db $13
  $91B2  04        .db $04
  $91B3  20 03 07  JSR $0703
  $91B6  5F        .db $5F
  $91B7  3F        .db $3F
  $91B8  4C 1C 1B  JMP $1B1C
  $91BB  BF        .db $BF
  $91BC  3C        .db $3C
  $91BD  28        PLP
  $91BE  40        RTI
  $91BF  00        BRK
  $91C0  FF        .db $FF
  $91C1  FF        .db $FF
  $91C2  7F        .db $7F
  $91C3  DF        .db $DF
  $91C4  F7        .db $F7
  $91C5  FF        .db $FF
  $91C6  FD FF 00  SBC $00FF,X
  $91C9  00        BRK
  $91CA  80        .db $80
  $91CB  20 08 00  JSR $0008
  $91CE  02        .db $02
  $91CF  00        BRK
  $91D0  FF        .db $FF
  $91D1  FC        .db $FC
  $91D2  FB        .db $FB
  $91D3  F7        .db $F7
  $91D4  CF        .db $CF
  $91D5  9D BB 77  STA $77BB,X
  $91D8  00        BRK
  $91D9  03        .db $03
  $91DA  04        .db $04
  $91DB  08        PHP
  $91DC  30 63     BMI $9241
  $91DE  47        .db $47
  $91DF  8F        .db $8F
  $91E0  0F        .db $0F
  $91E1  FF        .db $FF
  $91E2  FF        .db $FF
  $91E3  C0 3F     CPY #$3F
  $91E5  FF        .db $FF
  $91E6  FF        .db $FF
  $91E7  F8        SED
  $91E8  F0 00     BEQ $91EA

L_91EA:
  $91EA  00        BRK
  $91EB  3F        .db $3F
  $91EC  FF        .db $FF
  $91ED  FF        .db $FF
  $91EE  FF        .db $FF
  $91EF  F8        SED
  $91F0  FF        .db $FF
  $91F1  FF        .db $FF
  $91F2  0F        .db $0F
  $91F3  01 E0     ORA ($E0,X)
  $91F5  FE FF 0F  INC $0FFF,X
  $91F8  00        BRK
  $91F9  00        BRK

L_91FA:
  $91FA  F0 FE     BEQ $91FA
  $91FC  FF        .db $FF
  $91FD  FF        .db $FF
  $91FE  FF        .db $FF
  $91FF  0F        .db $0F
  $9200  00        BRK
  $9201  04        .db $04
  $9202  08        PHP
  $9203  00        BRK
  $9204  11 30     ORA ($30),Y
  $9206  30 78     BMI $9280
  $9208  03        .db $03
  $9209  03        .db $03
  $920A  07        .db $07
  $920B  0F        .db $0F
  $920C  0F        .db $0F
  $920D  1F        .db $1F
  $920E  1F        .db $1F
  $920F  1F        .db $1F
  $9210  29 14     AND #$14
  $9212  16 0B     ASL $0B,X
  $9214  0B        .db $0B
  $9215  85 65     STA $65
  $9217  3C        .db $3C
  $9218  EE F7 F7  INC $F7F7
  $921B  FB        .db $FB
  $921C  FB        .db $FB
  $921D  FD FD FC  SBC $FCFD,X
  $9220  18        CLC
  $9221  81 42     STA ($42,X)
  $9223  04        .db $04
  $9224  C8        INY
  $9225  90 20     BCC $9247
  $9227  80        .db $80
  $9228  18        CLC
  $9229  40        RTI
  $922A  B1 E3     LDA ($E3),Y
  $922C  C7        .db $C7
  $922D  8F        .db $8F

L_922E:
  $922E  1F        .db $1F
  $922F  7F        .db $7F
  $9230  84 04     STY $04
  $9232  08        PHP
  $9233  08        PHP
  $9234  10 50     BPL $9286
  $9236  60        RTS
  $9237  60        RTS
  $9238  7C        .db $7C
  $9239  FC        .db $FC
  $923A  F8        SED
  $923B  F8        SED
  $923C  F0 F0     BEQ $922E
  $923E  E0 F0     CPX #$F0
  $9240  00        BRK

L_9241:
  $9241  00        BRK
  $9242  00        BRK
  $9243  06 0A     ASL $0A
  $9245  12        .db $12
  $9246  06 00     ASL $00
  $9248  00        BRK
  $9249  02        .db $02
  $924A  06 0A     ASL $0A
  $924C  16 2E     ASL $2E,X
  $924E  3E 01 BF  ROL $BF01,X
  $9251  BF        .db $BF
  $9252  BF        .db $BF
  $9253  BF        .db $BF
  $9254  BF        .db $BF
  $9255  81 11     STA ($11,X)
  $9257  71 C0     ADC ($C0),Y
  $9259  C0 C0     CPY #$C0
  $925B  C0 C0     CPY #$C0
  $925D  82        .db $82
  $925E  6A        ROR
  $925F  8A        TXA
  $9260  F9 F9 F9  SBC $F9F9,Y
  $9263  F1 F3     SBC ($F3),Y
  $9265  F3        .db $F3
  $9266  E3        .db $E3
  $9267  E7        .db $E7
  $9268  07        .db $07
  $9269  07        .db $07
  $926A  07        .db $07
  $926B  0F        .db $0F
  $926C  0F        .db $0F
  $926D  0F        .db $0F
  $926E  1F        .db $1F
  $926F  1F        .db $1F
  $9270  33        .db $33
  $9271  27        .db $27
  $9272  07        .db $07
  $9273  20 1F E7  JSR $E71F
  $9276  C3        .db $C3
  $9277  43        .db $43
  $9278  3C        .db $3C
  $9279  38        SEC
  $927A  38        SEC
  $927B  20 20 97  JSR $9720
  $927E  A4 4C     LDY $4C

L_9280:
  $9280  44        .db $44
  $9281  2A        ROL
  $9282  14        .db $14
  $9283  0A        ASL
  $9284  02        .db $02
  $9285  0A        ASL

L_9286:
  $9286  0A        ASL
  $9287  0A        ASL
  $9288  7D 3B 17  ADC $173B,X
  $928B  0D 0D 05  ORA $050D
  $928E  05 05     ORA $05
  $9290  A0 9F     LDY #$9F
  $9292  80        .db $80
  $9293  80        .db $80
  $9294  80        .db $80
  $9295  82        .db $82
  $9296  8E 8B 60  STX $608B
  $9299  7F        .db $7F
  $929A  7F        .db $7F
  $929B  7F        .db $7F
  $929C  7E 7B 69  ROR $697B,X
  $929F  57        .db $57
  $92A0  C3        .db $C3
  $92A1  83        .db $83
  $92A2  00        BRK
  $92A3  32        .db $32
  $92A4  32        .db $32
  $92A5  32        .db $32

L_92A6:
  $92A6  00        BRK
  $92A7  2C FF FF  BIT $FFFF
  $92AA  C0 AE     CPY #$AE
  $92AC  0E 8E 80  ASL $808E
  $92AF  3C        .db $3C
  $92B0  F8        SED
  $92B1  F0 01     BEQ $92B4
  $92B3  E3        .db $E3

L_92B4:
  $92B4  87        .db $87
  $92B5  4E 1D 1F  LSR $1F1D
  $92B8  F8        SED
  $92B9  F0 02     BEQ $92BD
  $92BB  94 E8     STY $E8,X

L_92BD:
  $92BD  51 03     EOR ($03),Y
  $92BF  23        .db $23
  $92C0  7C        .db $7C
  $92C1  E7        .db $E7
  $92C2  9E        .db $9E
  $92C3  78        SEI
  $92C4  F0 E0     BEQ $92A6
  $92C6  C0 80     CPY #$80
  $92C8  83        .db $83
  $92C9  1F        .db $1F
  $92CA  7E F8 F0  ROR $F0F8,X
  $92CD  E0 C0     CPX #$C0
  $92CF  80        .db $80
  $92D0  7E 9F 0D  ROR $0D9F,X
  $92D3  0F        .db $0F
  $92D4  0F        .db $0F
  $92D5  0F        .db $0F
  $92D6  0F        .db $0F
  $92D7  1F        .db $1F
  $92D8  81 A0     STA ($A0,X)
  $92DA  12        .db $12
  $92DB  00        BRK
  $92DC  00        BRK
  $92DD  00        BRK
  $92DE  00        BRK
  $92DF  10 FF     BPL $92E0
  $92E1  EF        .db $EF
  $92E2  EF        .db $EF
  $92E3  DF        .db $DF
  $92E4  FF        .db $FF
  $92E5  FF        .db $FF
  $92E6  DF        .db $DF
  $92E7  FF        .db $FF
  $92E8  0F        .db $0F
  $92E9  1F        .db $1F
  $92EA  1F        .db $1F
  $92EB  3F        .db $3F
  $92EC  1F        .db $1F
  $92ED  1F        .db $1F
  $92EE  3F        .db $3F
  $92EF  1F        .db $1F
  $92F0  E0 C0     CPX #$C0
  $92F2  C0 80     CPY #$80
  $92F4  80        .db $80
  $92F5  80        .db $80
  $92F6  80        .db $80
  $92F7  80        .db $80
  $92F8  E0 C0     CPX #$C0
  $92FA  C0 80     CPY #$80
  $92FC  80        .db $80
  $92FD  80        .db $80
  $92FE  80        .db $80
  $92FF  80        .db $80
  $9300  7C        .db $7C
  $9301  47        .db $47
  $9302  83        .db $83
  $9303  C7        .db $C7
  $9304  FF        .db $FF
  $9305  8F        .db $8F
  $9306  7F        .db $7F
  $9307  1F        .db $1F
  $9308  3F        .db $3F
  $9309  3F        .db $3F
  $930A  7F        .db $7F
  $930B  7F        .db $7F
  $930C  7F        .db $7F
  $930D  78        SEI
  $930E  07        .db $07
  $930F  1F        .db $1F
  $9310  19 06 C8  ORA $C806,Y
  $9313  FE C3 C3  INC $C3C3,X
  $9316  FF        .db $FF
  $9317  FC        .db $FC
  $9318  F8        SED
  $9319  E1 C7     SBC ($C7,X)
  $931B  CF        .db $CF
  $931C  3F        .db $3F
  $931D  FF        .db $FF
  $931E  FF        .db $FF
  $931F  FC        .db $FC
  $9320  00        BRK
  $9321  01 03     ORA ($03,X)
  $9323  1E F9 E0  ASL $E0F9,X

L_9326:
  $9326  86 02     STX $02
  $9328  FF        .db $FF
  $9329  FF        .db $FF
  $932A  FF        .db $FF
  $932B  FE F9 E2  INC $E2F9,X
  $932E  87        .db $87
  $932F  03        .db $03
  $9330  C0 82     CPY #$82
  $9332  02        .db $02
  $9333  40        RTI
  $9334  20 80 40  JSR $4080
  $9337  00        BRK
  $9338  CE 85 45  DEC $4585
  $933B  A3        .db $A3
  $933C  C1 FD     CMP ($FD,X)
  $933E  49 29     EOR #$29
  $9340  00        BRK
  $9341  00        BRK
  $9342  01 01     ORA ($01,X)
  $9344  01 00     ORA ($00,X)
  $9346  00        BRK
  $9347  00        BRK
  $9348  01 01     ORA ($01,X)
  $934A  02        .db $02
  $934B  02        .db $02
  $934C  02        .db $02
  $934D  07        .db $07
  $934E  04        .db $04
  $934F  00        BRK
  $9350  F2        .db $F2
  $9351  F4        .db $F4
  $9352  E4 ED     CPX $ED
  $9354  D0 4F     BNE $93A5
  $9356  3F        .db $3F
  $9357  7F        .db $7F
  $9358  0B        .db $0B
  $9359  0D 1D 1D  ORA $1D1D
  $935C  30 C8     BMI $9326
  $935E  20 80 C7  JSR $C780
  $9361  9F        .db $9F
  $9362  F8        SED
  $9363  86 7F     STX $7F
  $9365  FF        .db $FF
  $9366  FF        .db $FF
  $9367  FF        .db $FF
  $9368  3F        .db $3F
  $9369  7F        .db $7F
  $936A  F8        SED
  $936B  87        .db $87
  $936C  40        RTI
  $936D  00        BRK
  $936E  00        BRK
  $936F  00        BRK
  $9370  17        .db $17
  $9371  40        RTI
  $9372  07        .db $07
  $9373  08        PHP
  $9374  F9 FE FF  SBC $FFFE,Y
  $9377  FF        .db $FF
  $9378  18        CLC
  $9379  60        RTS
  $937A  00        BRK
  $937B  F8        SED
  $937C  07        .db $07
  $937D  01 00     ORA ($00,X)
  $937F  00        BRK
  $9380  0A        ASL
  $9381  0A        ASL
  $9382  0A        ASL
  $9383  0A        ASL
  $9384  0A        ASL
  $9385  0A        ASL
  $9386  08        PHP
  $9387  00        BRK
  $9388  05 05     ORA $05
  $938A  05 05     ORA $05
  $938C  05 05     ORA $05
  $938E  06 08     ASL $08
  $9390  A0 9D     LDY #$9D
  $9392  81 80     STA ($80,X)
  $9394  83        .db $83
  $9395  0C        .db $0C
  $9396  38        SEC
  $9397  C8        INY
  $9398  60        RTS
  $9399  7D 7D 78  ADC $787D,X
  $939C  60        RTS
  $939D  80        .db $80
  $939E  00        BRK
  $939F  00        BRK
  $93A0  C2        .db $C2
  $93A1  4C 38 C8  JMP $C838
  $93A4  88        DEY

L_93A5:
  $93A5  88        DEY
  $93A6  88        DEY
  $93A7  B8        CLV
  $93A8  B1 80     LDA ($80),Y
  $93AA  00        BRK
  $93AB  00        BRK
  $93AC  00        BRK
  $93AD  00        BRK
  $93AE  00        BRK
  $93AF  38        SEC
  $93B0  3B        .db $3B
  $93B1  FF        .db $FF
  $93B2  77        .db $77
  $93B3  F7        .db $F7
  $93B4  E7        .db $E7
  $93B5  F7        .db $F7
  $93B6  E7        .db $E7
  $93B7  77        .db $77
  $93B8  47        .db $47
  $93B9  87        .db $87
  $93BA  8F        .db $8F
  $93BB  0F        .db $0F
  $93BC  1F        .db $1F
  $93BD  0F        .db $0F
  $93BE  1F        .db $1F
  $93BF  8F        .db $8F
  $93C0  00        BRK
  $93C1  00        BRK
  $93C2  00        BRK
  $93C3  00        BRK
  $93C4  00        BRK
  $93C5  B8        CLV
  $93C6  BE 8F 00  LDX $008F,Y
  $93C9  00        BRK
  $93CA  00        BRK
  $93CB  00        BRK
  $93CC  00        BRK
  $93CD  00        BRK
  $93CE  00        BRK
  $93CF  30 0F     BMI $93E0
  $93D1  1F        .db $1F
  $93D2  3F        .db $3F
  $93D3  1F        .db $1F
  $93D4  3F        .db $3F
  $93D5  3F        .db $3F
  $93D6  7F        .db $7F
  $93D7  FD 10 00  SBC $0010,X
  $93DA  20 20 00  JSR $0020
  $93DD  48        PHA
  $93DE  9C        .db $9C
  $93DF  3C        .db $3C

L_93E0:
  $93E0  EF        .db $EF
  $93E1  FF        .db $FF
  $93E2  E7        .db $E7
  $93E3  F7        .db $F7
  $93E4  FB        .db $FB
  $93E5  F5 FD     SBC $FD,X
  $93E7  FD 1F 0F  SBC $0F1F,X
  $93EA  1F        .db $1F
  $93EB  0F        .db $0F
  $93EC  07        .db $07
  $93ED  0B        .db $0B
  $93EE  03        .db $03
  $93EF  02        .db $02
  $93F0  80        .db $80
  $93F1  80        .db $80
  $93F2  C0 C0     CPY #$C0
  $93F4  E0 F0     CPX #$F0
  $93F6  F8        SED
  $93F7  FC        .db $FC
  $93F8  80        .db $80
  $93F9  80        .db $80
  $93FA  C0 C0     CPY #$C0
  $93FC  E0 F0     CPX #$F0
  $93FE  F8        SED
  $93FF  FC        .db $FC
  $9400  00        BRK
  $9401  02        .db $02
  $9402  00        BRK
  $9403  10 00     BPL $9405

L_9405:
  $9405  00        BRK
  $9406  00        BRK
  $9407  70 00     BVS $9409

L_9409:
  $9409  03        .db $03
  $940A  0F        .db $0F
  $940B  1F        .db $1F
  $940C  1F        .db $1F
  $940D  1F        .db $1F
  $940E  1F        .db $1F
  $940F  7F        .db $7F
  $9410  00        BRK
  $9411  09 04     ORA #$04
  $9413  06 06     ASL $06
  $9415  06 06     ASL $06
  $9417  06 06     ASL $06
  $9419  F9 FC FE  SBC $FEFC,Y
  $941C  FE FE FE  INC $FEFE,X
  $941F  FE 0F 83  INC $830F,X
  $9422  C6 78     DEC $78
  $9424  63        .db $63
  $9425  0C        .db $0C
  $9426  78        SEI
  $9427  C8        INY
  $9428  79 FF FE  ADC $FEFF,Y
  $942B  78        SEI
  $942C  60        RTS
  $942D  00        BRK
  $942E  00        BRK
  $942F  00        BRK
  $9430  83        .db $83
  $9431  8C 38 C8  STY $C838
  $9434  88        DEY
  $9435  88        DEY
  $9436  83        .db $83
  $9437  8C 80 80  STY $8080
  $943A  00        BRK
  $943B  00        BRK
  $943C  00        BRK
  $943D  00        BRK
  $943E  03        .db $03
  $943F  0F        .db $0F
  $9440  88        DEY
  $9441  88        DEY
  $9442  80        .db $80
  $9443  80        .db $80
  $9444  20 E0 60  JSR $60E0
  $9447  60        RTS
  $9448  00        BRK
  $9449  03        .db $03
  $944A  0F        .db $0F
  $944B  0E 2F EE  ASL $EE2F
  $944E  EF        .db $EF
  $944F  EE 08 04  INC $0408
  $9452  04        .db $04
  $9453  04        .db $04
  $9454  06 06     ASL $06
  $9456  06 07     ASL $07
  $9458  F8        SED
  $9459  FC        .db $FC
  $945A  9C        .db $9C
  $945B  7C        .db $7C
  $945C  9E        .db $9E
  $945D  7E 9E 7F  ROR $7F9E,X
  $9460  67        .db $67
  $9461  73        .db $73
  $9462  79 3C 3F  ADC $3F3C,Y
  $9465  7F        .db $7F
  $9466  1F        .db $1F
  $9467  20 9F 8F  JSR $8F9F
  $946A  87        .db $87
  $946B  43        .db $43
  $946C  40        RTI
  $946D  40        RTI
  $946E  20 3E 83  JSR $833E
  $9471  FF        .db $FF
  $9472  FF        .db $FF
  $9473  0D FB E3  ORA $E3FB
  $9476  83        .db $83
  $9477  04        .db $04
  $9478  82        .db $82
  $9479  FC        .db $FC
  $947A  F9 F3 07  SBC $07F3,Y
  $947D  13        .db $13
  $947E  43        .db $43
  $947F  3C        .db $3C
  $9480  F8        SED
  $9481  F0 E0     BEQ $9463
  $9483  C0 C0     CPY #$C0
  $9485  80        .db $80
  $9486  81 02     STA ($02,X)
  $9488  79 F0 E0  ADC $E0F0,Y
  $948B  C0 C0     CPY #$C0
  $948D  80        .db $80
  $948E  81 03     STA ($03,X)
  $9490  FE FF 60  INC $60FF,X
  $9493  0F        .db $0F
  $9494  E0 00     CPX #$00
  $9496  00        BRK
  $9497  00        BRK
  $9498  01 00     ORA ($00,X)
  $949A  90 0F     BCC $94AB
  $949C  FF        .db $FF
  $949D  FF        .db $FF
  $949E  FF        .db $FF
  $949F  FF        .db $FF
  $94A0  BE 0F 73  LDX $730F,Y
  $94A3  0C        .db $0C
  $94A4  03        .db $03
  $94A5  00        BRK
  $94A6  00        BRK
  $94A7  00        BRK
  $94A8  3E 8F 73  ROL $738F,X

L_94AB:
  $94AB  FC        .db $FC
  $94AC  FF        .db $FF
  $94AD  FF        .db $FF
  $94AE  FF        .db $FF
  $94AF  FF        .db $FF
  $94B0  00        BRK
  $94B1  80        .db $80

L_94B2:
  $94B2  C0 F0     CPY #$F0
  $94B4  3D C3 3C  AND $3CC3,X
  $94B7  00        BRK
  $94B8  00        BRK
  $94B9  80        .db $80
  $94BA  C0 F0     CPY #$F0
  $94BC  3D C3 FF  AND $FFC3,X
  $94BF  FF        .db $FF
  $94C0  E8        INX
  $94C1  50 10     BVC $94D3
  $94C3  10 B0     BPL $9475
  $94C5  68        PLA
  $94C6  10 20     BPL $94E8
  $94C8  8F        .db $8F
  $94C9  B7        .db $B7
  $94CA  F7        .db $F7
  $94CB  F7        .db $F7
  $94CC  F7        .db $F7
  $94CD  6F        .db $6F
  $94CE  1F        .db $1F
  $94CF  3F        .db $3F
  $94D0  06 06     ASL $06
  $94D2  0E 0E 0E  ASL $0E0E
  $94D5  1E 1C 38  ASL $381C,X

L_94D8:
  $94D8  FE FE FE  INC $FEFE,X
  $94DB  FE FE FE  INC $FEFE,X
  $94DE  FC        .db $FC
  $94DF  F8        SED
  $94E0  88        DEY
  $94E1  88        DEY
  $94E2  83        .db $83
  $94E3  8C 38 F8  STY $F838
  $94E6  08        PHP
  $94E7  C8        INY

L_94E8:
  $94E8  00        BRK
  $94E9  00        BRK
  $94EA  03        .db $03
  $94EB  0F        .db $0F
  $94EC  3F        .db $3F
  $94ED  FF        .db $FF
  $94EE  0F        .db $0F
  $94EF  8F        .db $8F
  $94F0  30 C0     BMI $94B2
  $94F2  00        BRK
  $94F3  00        BRK
  $94F4  00        BRK
  $94F5  00        BRK
  $94F6  00        BRK
  $94F7  00        BRK
  $94F8  3F        .db $3F
  $94F9  FF        .db $FF
  $94FA  FF        .db $FF
  $94FB  FF        .db $FF
  $94FC  FF        .db $FF
  $94FD  FF        .db $FF
  $94FE  FF        .db $FF
  $94FF  FF        .db $FF
  $9500  60        RTS
  $9501  60        RTS
  $9502  60        RTS
  $9503  60        RTS
  $9504  60        RTS
  $9505  61 60     ADC ($60,X)
  $9507  C8        INY
  $9508  EF        .db $EF
  $9509  EE EF EF  INC $EFEF
  $950C  EF        .db $EF
  $950D  EF        .db $EF
  $950E  EC C8 0E  CPX $0EC8
  $9511  0E 1C 30  ASL $301C
  $9514  C3        .db $C3
  $9515  0C        .db $0C
  $9516  30 C0     BMI $94D8
  $9518  9E        .db $9E
  $9519  7E FC F0  ROR $F0FC,X
  $951C  C0 00     CPY #$00
  $951E  00        BRK
  $951F  00        BRK
  $9520  10 06     BPL $9528
  $9522  30 C0     BMI $94E4
  $9524  00        BRK
  $9525  00        BRK
  $9526  00        BRK
  $9527  00        BRK

L_9528:
  $9528  11 09     ORA ($09),Y
  $952A  0F        .db $0F
  $952B  3F        .db $3F
  $952C  1F        .db $1F
  $952D  1F        .db $1F
  $952E  1F        .db $1F
  $952F  FF        .db $FF
  $9530  00        BRK
  $9531  00        BRK
  $9532  00        BRK
  $9533  00        BRK
  $9534  00        BRK
  $9535  00        BRK
  $9536  00        BRK
  $9537  00        BRK
  $9538  FF        .db $FF
  $9539  FF        .db $FF
  $953A  FF        .db $FF
  $953B  FF        .db $FF
  $953C  FF        .db $FF
  $953D  FF        .db $FF
  $953E  FF        .db $FF
  $953F  FF        .db $FF
  $9540  00        BRK
  $9541  00        BRK
  $9542  00        BRK
  $9543  00        BRK
  $9544  00        BRK
  $9545  00        BRK
  $9546  00        BRK
  $9547  00        BRK
  $9548  FF        .db $FF
  $9549  FF        .db $FF
  $954A  FF        .db $FF
  $954B  F1 8F     SBC ($8F),Y
  $954D  71 41     ADC ($41),Y
  $954F  41 00     EOR ($00,X)
  $9551  00        BRK
  $9552  00        BRK
  $9553  00        BRK
  $9554  00        BRK
  $9555  00        BRK
  $9556  00        BRK
  $9557  00        BRK
  $9558  FF        .db $FF
  $9559  FE F1 F6  INC $F6F1,X
  $955C  F4        .db $F4
  $955D  F4        .db $F4
  $955E  F4        .db $F4
  $955F  F4        .db $F4
  $9560  00        BRK
  $9561  00        BRK
  $9562  00        BRK
  $9563  00        BRK
  $9564  00        BRK
  $9565  00        BRK
  $9566  00        BRK
  $9567  00        BRK
  $9568  FF        .db $FF
  $9569  1F        .db $1F
  $956A  DF        .db $DF
  $956B  1F        .db $1F
  $956C  1F        .db $1F
  $956D  1F        .db $1F
  $956E  1F        .db $1F
  $956F  1F        .db $1F
  $9570  00        BRK
  $9571  00        BRK
  $9572  00        BRK
  $9573  40        RTI
  $9574  00        BRK
  $9575  00        BRK
  $9576  01 00     ORA ($00,X)
  $9578  3F        .db $3F
  $9579  3F        .db $3F
  $957A  3F        .db $3F
  $957B  7F        .db $7F
  $957C  7F        .db $7F
  $957D  7F        .db $7F
  $957E  7F        .db $7F
  $957F  7F        .db $7F
  $9580  62        .db $62
  $9581  88        DEY
  $9582  B8        CLV
  $9583  A8        TAY
  $9584  A8        TAY
  $9585  A8        TAY
  $9586  A8        TAY
  $9587  A8        TAY
  $9588  E3        .db $E3
  $9589  8F        .db $8F
  $958A  BF        .db $BF
  $958B  BF        .db $BF
  $958C  BF        .db $BF

L_958D:
  $958D  BF        .db $BF
  $958E  BF        .db $BF
  $958F  BF        .db $BF
  $9590  48        PHA
  $9591  48        PHA
  $9592  4C 4C 4E  JMP $4E4C
  $9595  4F        .db $4F
  $9596  48        PHA
  $9597  42        .db $42
  $9598  8F        .db $8F
  $9599  8F        .db $8F
  $959A  8F        .db $8F
  $959B  8F        .db $8F
  $959C  8F        .db $8F
  $959D  8F        .db $8F
  $959E  88        DEY
  $959F  84 00     STY $00
  $95A1  00        BRK
  $95A2  01 01     ORA ($01,X)
  $95A4  01 81     ORA ($81,X)
  $95A6  03        .db $03
  $95A7  02        .db $02
  $95A8  FF        .db $FF
  $95A9  FF        .db $FF
  $95AA  FF        .db $FF
  $95AB  FF        .db $FF
  $95AC  FF        .db $FF
  $95AD  FF        .db $FF
  $95AE  7F        .db $7F
  $95AF  7E 03 0C  ROR $0C03,X
  $95B2  08        PHP
  $95B3  08        PHP
  $95B4  10 10     BPL $95C6
  $95B6  10 10     BPL $95C8
  $95B8  00        BRK
  $95B9  10 14     BPL $95CF
  $95BB  34        .db $34
  $95BC  2F        .db $2F
  $95BD  2F        .db $2F
  $95BE  2C 6C 00  BIT $006C
  $95C1  00        BRK
  $95C2  00        BRK
  $95C3  00        BRK
  $95C4  00        BRK
  $95C5  00        BRK

L_95C6:
  $95C6  00        BRK
  $95C7  00        BRK

L_95C8:
  $95C8  03        .db $03
  $95C9  0F        .db $0F
  $95CA  3C        .db $3C
  $95CB  F0 C0     BEQ $958D
  $95CD  03        .db $03
  $95CE  0F        .db $0F

L_95CF:
  $95CF  3F        .db $3F
  $95D0  00        BRK
  $95D1  00        BRK
  $95D2  00        BRK
  $95D3  00        BRK
  $95D4  00        BRK
  $95D5  00        BRK
  $95D6  00        BRK
  $95D7  20 FF 1F  JSR $1FFF
  $95DA  1F        .db $1F
  $95DB  1F        .db $1F
  $95DC  FF        .db $FF
  $95DD  FF        .db $FF
  $95DE  FF        .db $FF
  $95DF  E1 00     SBC ($00,X)
  $95E1  00        BRK
  $95E2  00        BRK
  $95E3  00        BRK
  $95E4  00        BRK
  $95E5  00        BRK
  $95E6  00        BRK
  $95E7  00        BRK
  $95E8  41 41     EOR ($41,X)
  $95EA  41 41     EOR ($41,X)
  $95EC  41 41     EOR ($41,X)
  $95EE  41 41     EOR ($41,X)
  $95F0  00        BRK
  $95F1  00        BRK
  $95F2  00        BRK
  $95F3  00        BRK
  $95F4  00        BRK
  $95F5  00        BRK
  $95F6  00        BRK
  $95F7  00        BRK
  $95F8  F4        .db $F4
  $95F9  F4        .db $F4
  $95FA  F4        .db $F4
  $95FB  F4        .db $F4
  $95FC  F4        .db $F4
  $95FD  F4        .db $F4
  $95FE  F4        .db $F4
  $95FF  F4        .db $F4
  $9600  00        BRK
  $9601  00        BRK
  $9602  00        BRK
  $9603  00        BRK
  $9604  00        BRK
  $9605  00        BRK
  $9606  00        BRK
  $9607  00        BRK
  $9608  1F        .db $1F
  $9609  1F        .db $1F
  $960A  1F        .db $1F
  $960B  1F        .db $1F
  $960C  1F        .db $1F
  $960D  1F        .db $1F
  $960E  1F        .db $1F
  $960F  1F        .db $1F
  $9610  00        BRK
  $9611  00        BRK
  $9612  00        BRK
  $9613  00        BRK
  $9614  00        BRK
  $9615  11 11     ORA ($11),Y
  $9617  03        .db $03
  $9618  00        BRK
  $9619  07        .db $07
  $961A  0F        .db $0F
  $961B  0F        .db $0F
  $961C  0F        .db $0F
  $961D  1F        .db $1F
  $961E  1F        .db $1F
  $961F  1F        .db $1F
  $9620  00        BRK
  $9621  40        RTI
  $9622  62        .db $62
  $9623  E0 E3     CPX #$E3
  $9625  CC 30 40  CPY $4030
  $9628  00        BRK
  $9629  C0 E0     CPY #$E0
  $962B  E2        .db $E2
  $962C  E3        .db $E3
  $962D  CF        .db $CF
  $962E  3F        .db $3F
  $962F  7F        .db $7F
  $9630  23        .db $23
  $9631  0F        .db $0F
  $9632  3E C6 06  ROL $06C6,X
  $9635  06 04     ASL $04
  $9637  04        .db $04
  $9638  03        .db $03
  $9639  2F        .db $2F
  $963A  3E FE FE  ROL $FEFE,X
  $963D  FE FC FC  INC $FCFC,X
  $9640  01 81     ORA ($81,X)
  $9642  01 01     ORA ($01,X)
  $9644  01 01     ORA ($01,X)
  $9646  02        .db $02
  $9647  02        .db $02
  $9648  7F        .db $7F
  $9649  FF        .db $FF
  $964A  FF        .db $FF
  $964B  FF        .db $FF
  $964C  FF        .db $FF
  $964D  FF        .db $FF
  $964E  FE FE A0  INC $A0FE,X
  $9651  28        PLP
  $9652  40        RTI
  $9653  50 40     BVC $9695
  $9655  40        RTI
  $9656  00        BRK
  $9657  40        RTI
  $9658  BF        .db $BF
  $9659  3F        .db $3F
  $965A  7F        .db $7F
  $965B  7F        .db $7F
  $965C  7E 78 61  ROR $6178,X
  $965F  67        .db $67
  $9660  42        .db $42
  $9661  02        .db $02
  $9662  02        .db $02
  $9663  00        BRK
  $9664  02        .db $02
  $9665  00        BRK
  $9666  00        BRK
  $9667  00        BRK
  $9668  9C        .db $9C
  $9669  FC        .db $FC
  $966A  E4 86     CPX $86
  $966C  1C        .db $1C
  $966D  7E FE FE  ROR $FEFE,X
  $9670  02        .db $02
  $9671  02        .db $02
  $9672  00        BRK
  $9673  04        .db $04
  $9674  04        .db $04
  $9675  04        .db $04
  $9676  08        PHP
  $9677  08        PHP
  $9678  7E 7E 7C  ROR $7C7E,X
  $967B  7C        .db $7C
  $967C  7C        .db $7C
  $967D  7C        .db $7C
  $967E  78        SEI
  $967F  78        SEI
  $9680  20 20 20  JSR $2020
  $9683  20 40 40  JSR $4040
  $9686  42        .db $42
  $9687  00        BRK
  $9688  5C        .db $5C
  $9689  5F        .db $5F
  $968A  5F        .db $5F
  $968B  5F        .db $5F
  $968C  BF        .db $BF
  $968D  BF        .db $BF
  $968E  83        .db $83
  $968F  80        .db $80
  $9690  01 08     ORA ($08,X)
  $9692  03        .db $03
  $9693  07        .db $07
  $9694  13        .db $13

L_9695:
  $9695  18        CLC
  $9696  30 30     BMI $96C8
  $9698  FF        .db $FF
  $9699  F8        SED
  $969A  C3        .db $C3
  $969B  C7        .db $C7
  $969C  D3        .db $D3
  $969D  98        TYA
  $969E  B0 30     BCS $96D0
  $96A0  0C        .db $0C
  $96A1  7C        .db $7C
  $96A2  FC        .db $FC
  $96A3  E0 00     CPX #$00
  $96A5  01 01     ORA ($01,X)
  $96A7  01 0D     ORA ($0D,X)
  $96A9  7D FD E1  ADC $E1FD,X
  $96AC  01 01     ORA ($01,X)
  $96AE  01 01     ORA ($01,X)
  $96B0  00        BRK
  $96B1  00        BRK
  $96B2  00        BRK
  $96B3  00        BRK
  $96B4  00        BRK
  $96B5  00        BRK
  $96B6  C0 FF     CPY #$FF
  $96B8  FF        .db $FF
  $96B9  FF        .db $FF
  $96BA  FF        .db $FF
  $96BB  FF        .db $FF
  $96BC  FF        .db $FF
  $96BD  FF        .db $FF
  $96BE  FF        .db $FF
  $96BF  FF        .db $FF
  $96C0  00        BRK
  $96C1  00        BRK
  $96C2  00        BRK
  $96C3  00        BRK
  $96C4  00        BRK
  $96C5  00        BRK
  $96C6  3B        .db $3B
  $96C7  C1 FF     CMP ($FF,X)
  $96C9  FF        .db $FF
  $96CA  FF        .db $FF
  $96CB  FF        .db $FF
  $96CC  FF        .db $FF
  $96CD  FF        .db $FF
  $96CE  FB        .db $FB
  $96CF  C1 00     CMP ($00,X)
  $96D1  00        BRK
  $96D2  00        BRK
  $96D3  00        BRK
  $96D4  00        BRK
  $96D5  40        RTI
  $96D6  41 41     EOR ($41,X)
  $96D8  41 41     EOR ($41,X)
  $96DA  41 41     EOR ($41,X)
  $96DC  41 41     EOR ($41,X)
  $96DE  41 41     EOR ($41,X)
  $96E0  00        BRK
  $96E1  00        BRK
  $96E2  00        BRK
  $96E3  00        BRK
  $96E4  00        BRK
  $96E5  00        BRK
  $96E6  00        BRK
  $96E7  E0 F4     CPX #$F4
  $96E9  F4        .db $F4
  $96EA  F4        .db $F4
  $96EB  F4        .db $F4
  $96EC  F4        .db $F4
  $96ED  F4        .db $F4
  $96EE  F4        .db $F4
  $96EF  F4        .db $F4
  $96F0  00        BRK
  $96F1  00        BRK
  $96F2  00        BRK
  $96F3  00        BRK
  $96F4  00        BRK
  $96F5  00        BRK
  $96F6  10 1E     BPL $9716
  $96F8  1F        .db $1F
  $96F9  1F        .db $1F
  $96FA  1F        .db $1F
  $96FB  1F        .db $1F
  $96FC  1F        .db $1F
  $96FD  1F        .db $1F
  $96FE  1F        .db $1F
  $96FF  1F        .db $1F
  $9700  02        .db $02
  $9701  06 26     ASL $26
  $9703  26 04     ROL $04
  $9705  05 0D     ORA $0D
  $9707  4C 1E 1E  JMP $1E1E
  $970A  3E 3E 3C  ROL $3C3E,X
  $970D  3D 3D 7D  AND $7D3D,X
  $9710  00        BRK
  $9711  00        BRK
  $9712  00        BRK
  $9713  00        BRK
  $9714  00        BRK
  $9715  00        BRK

L_9716:
  $9716  00        BRK
  $9717  00        BRK
  $9718  F8        SED
  $9719  F8        SED
  $971A  F8        SED
  $971B  F8        SED
  $971C  F9 F9 F1  SBC $F1F9,Y
  $971F  F1 00     SBC ($00),Y
  $9721  00        BRK
  $9722  00        BRK
  $9723  00        BRK
  $9724  00        BRK
  $9725  00        BRK
  $9726  00        BRK
  $9727  00        BRK
  $9728  FC        .db $FC
  $9729  FC        .db $FC
  $972A  FC        .db $FC
  $972B  FC        .db $FC
  $972C  F9 F9 F9  SBC $F9F9,Y
  $972F  F9 00 00  SBC $0000,Y
  $9732  00        BRK
  $9733  00        BRK
  $9734  00        BRK
  $9735  00        BRK
  $9736  00        BRK
  $9737  00        BRK
  $9738  FF        .db $FF
  $9739  FF        .db $FF
  $973A  FE F9 E6  INC $E6F9,X
  $973D  F9 E7 FF  SBC $FFE7,Y
  $9740  00        BRK
  $9741  00        BRK
  $9742  00        BRK
  $9743  00        BRK
  $9744  00        BRK
  $9745  00        BRK
  $9746  03        .db $03
  $9747  07        .db $07
  $9748  E6 9E     INC $9E
  $974A  66 9E     ROR $9E
  $974C  7E FC F3  ROR $F3FC,X
  $974F  06 00     ASL $00
  $9751  01 03     ORA ($03,X)
  $9753  03        .db $03
  $9754  19 3F 7F  ORA $7F3F,Y
  $9757  7F        .db $7F
  $9758  70 71     BVS $97CB
  $975A  73        .db $73
  $975B  63        .db $63
  $975C  59 37 63  EOR $6337,Y
  $975F  46 39     LSR $39
  $9761  FD FE FF  SBC $FFFE,X
  $9764  FF        .db $FF
  $9765  FC        .db $FC
  $9766  F8        SED
  $9767  F0 39     BEQ $97A2
  $9769  BD 86 87  LDA $8786,X
  $976C  07        .db $07
  $976D  1C        .db $1C
  $976E  1B        .db $1B
  $976F  37        .db $37
  $9770  80        .db $80
  $9771  E0 C0     CPX #$C0
  $9773  00        BRK
  $9774  03        .db $03
  $9775  0F        .db $0F
  $9776  1F        .db $1F
  $9777  3F        .db $3F
  $9778  80        .db $80
  $9779  E0 C6     CPX #$C6
  $977B  18        CLC
  $977C  33        .db $33
  $977D  EE 98 20  INC $2098
  $9780  1F        .db $1F
  $9781  7F        .db $7F
  $9782  FE FD BD  INC $BDFD,X
  $9785  BB        .db $BB
  $9786  DB        .db $DB
  $9787  DF        .db $DF
  $9788  18        CLC
  $9789  61 82     ADC ($82,X)
  $978B  41 05     EOR ($05,X)
  $978D  23        .db $23
  $978E  43        .db $43
  $978F  5F        .db $5F
  $9790  F8        SED
  $9791  8F        .db $8F
  $9792  7F        .db $7F
  $9793  FF        .db $FF
  $9794  FF        .db $FF
  $9795  FF        .db $FF
  $9796  FF        .db $FF
  $9797  FF        .db $FF
  $9798  F8        SED
  $9799  8F        .db $8F
  $979A  79 C7 86  ADC $86C7,Y
  $979D  0E 1C 38  ASL $381C
  $97A0  48        PHA
  $97A1  0A        ASL

L_97A2:
  $97A2  1A        .db $1A
  $97A3  9A        TXS
  $97A4  92        .db $92
  $97A5  B6 F6     LDX $F6,Y
  $97A7  F3        .db $F3
  $97A8  79 7B 7B  ADC $7B7B,Y
  $97AB  FB        .db $FB
  $97AC  F3        .db $F3
  $97AD  F7        .db $F7
  $97AE  F7        .db $F7

L_97AF:
  $97AF  F3        .db $F3
  $97B0  00        BRK
  $97B1  00        BRK
  $97B2  00        BRK
  $97B3  00        BRK
  $97B4  00        BRK
  $97B5  00        BRK
  $97B6  00        BRK
  $97B7  07        .db $07
  $97B8  FF        .db $FF
  $97B9  FF        .db $FF
  $97BA  FF        .db $FF
  $97BB  FF        .db $FF
  $97BC  FF        .db $FF
  $97BD  FC        .db $FC
  $97BE  F8        SED
  $97BF  F6 00     INC $00,X
  $97C1  00        BRK
  $97C2  00        BRK
  $97C3  00        BRK
  $97C4  0F        .db $0F
  $97C5  3F        .db $3F
  $97C6  FF        .db $FF
  $97C7  FF        .db $FF
  $97C8  F1 E1     SBC ($E1),Y
  $97CA  E0 C0     CPX #$C0
  $97CC  0B        .db $0B
  $97CD  30 E0     BMI $97AF
  $97CF  03        .db $03
  $97D0  00        BRK
  $97D1  00        BRK
  $97D2  00        BRK
  $97D3  00        BRK
  $97D4  C0 E7     CPY #$E7
  $97D6  E7        .db $E7
  $97D7  FB        .db $FB
  $97D8  F1 F1     SBC ($F1),Y
  $97DA  31 00     AND ($00),Y
  $97DC  C0 E0     CPY #$E0
  $97DE  E4 FA     CPX $FA
  $97E0  00        BRK
  $97E1  06 1F     ASL $1F
  $97E3  3F        .db $3F
  $97E4  DF        .db $DF
  $97E5  EF        .db $EF
  $97E6  F7        .db $F7
  $97E7  FB        .db $FB
  $97E8  F8        SED
  $97E9  C2        .db $C2
  $97EA  01 01     ORA ($01,X)
  $97EC  C1 E0     CMP ($E0,X)
  $97EE  70 39     BVS $9829
  $97F0  3F        .db $3F
  $97F1  DF        .db $DF
  $97F2  EF        .db $EF
  $97F3  EE 6C 78  INC $786C
  $97F6  60        RTS
  $97F7  00        BRK
  $97F8  24 54     BIT $54
  $97FA  64        .db $64
  $97FB  AA        TAX
  $97FC  08        PHP
  $97FD  29 23     AND #$23
  $97FF  0F        .db $0F
  $9800  E0 C0     CPX #$C0
  $9802  81 03     STA ($03,X)
  $9804  07        .db $07
  $9805  07        .db $07
  $9806  0F        .db $0F
  $9807  3F        .db $3F
  $9808  6E 5C B9  ROR $B95C
  $980B  7B        .db $7B
  $980C  F7        .db $F7
  $980D  E7        .db $E7
  $980E  CF        .db $CF
  $980F  B3        .db $B3
  $9810  01 02     ORA ($02,X)
  $9812  04        .db $04
  $9813  08        PHP
  $9814  10 20     BPL $9836
  $9816  40        RTI
  $9817  80        .db $80
  $9818  01 03     ORA ($03,X)
  $981A  07        .db $07
  $981B  0F        .db $0F
  $981C  1F        .db $1F

L_981D:
  $981D  3F        .db $3F
  $981E  7F        .db $7F
  $981F  FF        .db $FF
  $9820  80        .db $80
  $9821  C0 E0     CPY #$E0
  $9823  70 F8     BVS $981D

L_9825:
  $9825  7C        .db $7C
  $9826  FE 3F 80  INC $803F,X

L_9829:
  $9829  C0 E0     CPY #$E0
  $982B  F0 F8     BEQ $9825
  $982D  FC        .db $FC
  $982E  FE FF 7F  INC $7FFF,X
  $9831  0F        .db $0F
  $9832  FF        .db $FF
  $9833  00        BRK
  $9834  3F        .db $3F
  $9835  00        BRK

L_9836:
  $9836  1F        .db $1F
  $9837  00        BRK
  $9838  FF        .db $FF
  $9839  FF        .db $FF
  $983A  FF        .db $FF
  $983B  FF        .db $FF
  $983C  FF        .db $FF
  $983D  FF        .db $FF
  $983E  FF        .db $FF
  $983F  FF        .db $FF
  $9840  0B        .db $0B
  $9841  0E 1E 1F  ASL $1F1E
  $9844  1F        .db $1F
  $9845  1F        .db $1F
  $9846  0F        .db $0F
  $9847  03        .db $03
  $9848  0F        .db $0F
  $9849  11 21     ORA ($21),Y
  $984B  20 20 20  JSR $2020
  $984E  10 0C     BPL $985C
  $9850  38        SEC
  $9851  38        SEC
  $9852  7C        .db $7C
  $9853  FC        .db $FC
  $9854  FC        .db $FC

L_9855:
  $9855  FC        .db $FC
  $9856  F8        SED
  $9857  F0 38     BEQ $9891
  $9859  C4 82     CPY $82
  $985B  02        .db $02

L_985C:
  $985C  02        .db $02
  $985D  02        .db $02
  $985E  04        .db $04
  $985F  08        PHP
  $9860  00        BRK
  $9861  00        BRK
  $9862  00        BRK
  $9863  07        .db $07
  $9864  78        SEI
  $9865  83        .db $83
  $9866  3F        .db $3F
  $9867  FF        .db $FF
  $9868  FF        .db $FF
  $9869  FF        .db $FF
  $986A  FF        .db $FF
  $986B  FF        .db $FF
  $986C  F8        SED
  $986D  80        .db $80
  $986E  00        BRK
  $986F  00        BRK
  $9870  01 00     ORA ($00,X)
  $9872  0F        .db $0F
  $9873  F0 00     BEQ $9875

L_9875:
  $9875  FF        .db $FF
  $9876  FF        .db $FF
  $9877  FF        .db $FF
  $9878  FF        .db $FF
  $9879  FF        .db $FF
  $987A  FF        .db $FF
  $987B  FF        .db $FF
  $987C  00        BRK
  $987D  00        BRK
  $987E  00        BRK
  $987F  00        BRK
  $9880  FF        .db $FF
  $9881  00        BRK
  $9882  FF        .db $FF
  $9883  00        BRK
  $9884  00        BRK

L_9885:
  $9885  F0 FE     BEQ $9885
  $9887  FF        .db $FF
  $9888  FF        .db $FF
  $9889  FF        .db $FF
  $988A  FF        .db $FF
  $988B  FF        .db $FF
  $988C  00        BRK
  $988D  00        BRK
  $988E  00        BRK
  $988F  00        BRK
  $9890  FF        .db $FF

L_9891:
  $9891  0D F7 01  ORA $01F7
  $9894  FA        .db $FA
  $9895  07        .db $07
  $9896  00        BRK
  $9897  F0 FF     BEQ $9898
  $9899  FD F7 FD  SBC $FDF7,X
  $989C  FA        .db $FA
  $989D  07        .db $07
  $989E  00        BRK
  $989F  00        BRK
  $98A0  87        .db $87
  $98A1  C7        .db $C7
  $98A2  A7        .db $A7
  $98A3  53        .db $53
  $98A4  A9 D4     LDA #$D4
  $98A6  6A        ROR
  $98A7  07        .db $07
  $98A8  80        .db $80
  $98A9  C0 A0     CPY #$A0
  $98AB  50 A8     BVC $9855
  $98AD  D4        .db $D4
  $98AE  6A        ROR
  $98AF  07        .db $07
  $98B0  07        .db $07
  $98B1  07        .db $07
  $98B2  07        .db $07
  $98B3  07        .db $07
  $98B4  07        .db $07
  $98B5  07        .db $07
  $98B6  07        .db $07
  $98B7  07        .db $07
  $98B8  00        BRK
  $98B9  00        BRK
  $98BA  00        BRK
  $98BB  00        BRK
  $98BC  00        BRK
  $98BD  00        BRK
  $98BE  00        BRK
  $98BF  00        BRK
  $98C0  F0 D0     BEQ $9892
  $98C2  F3        .db $F3
  $98C3  D3        .db $D3
  $98C4  D3        .db $D3
  $98C5  D3        .db $D3
  $98C6  D3        .db $D3
  $98C7  D3        .db $D3
  $98C8  00        BRK
  $98C9  00        BRK
  $98CA  00        BRK
  $98CB  00        BRK
  $98CC  00        BRK
  $98CD  00        BRK
  $98CE  00        BRK
  $98CF  00        BRK
  $98D0  D3        .db $D3
  $98D1  D3        .db $D3
  $98D2  D3        .db $D3
  $98D3  D3        .db $D3
  $98D4  D3        .db $D3
  $98D5  D3        .db $D3
  $98D6  53        .db $53
  $98D7  13        .db $13
  $98D8  00        BRK
  $98D9  00        BRK
  $98DA  00        BRK
  $98DB  00        BRK
  $98DC  00        BRK
  $98DD  00        BRK
  $98DE  00        BRK
  $98DF  00        BRK
  $98E0  13        .db $13
  $98E1  13        .db $13

L_98E2:
  $98E2  13        .db $13
  $98E3  53        .db $53
  $98E4  13        .db $13
  $98E5  53        .db $53
  $98E6  53        .db $53
  $98E7  53        .db $53
  $98E8  00        BRK
  $98E9  00        BRK
  $98EA  00        BRK
  $98EB  00        BRK
  $98EC  00        BRK
  $98ED  00        BRK
  $98EE  00        BRK
  $98EF  00        BRK
  $98F0  53        .db $53
  $98F1  53        .db $53
  $98F2  53        .db $53
  $98F3  53        .db $53
  $98F4  53        .db $53
  $98F5  53        .db $53
  $98F6  53        .db $53
  $98F7  53        .db $53
  $98F8  00        BRK
  $98F9  00        BRK
  $98FA  00        BRK
  $98FB  00        BRK
  $98FC  00        BRK
  $98FD  00        BRK
  $98FE  00        BRK
  $98FF  00        BRK
  $9900  53        .db $53
  $9901  53        .db $53

L_9902:
  $9902  53        .db $53
  $9903  53        .db $53

L_9904:
  $9904  53        .db $53
  $9905  00        BRK

L_9906:
  $9906  F5 F4     SBC $F4,X

L_9908:
  $9908  00        BRK
  $9909  00        BRK
  $990A  00        BRK
  $990B  00        BRK
  $990C  00        BRK
  $990D  00        BRK
  $990E  0B        .db $0B
  $990F  0B        .db $0B
  $9910  D3        .db $D3
  $9911  D3        .db $D3

L_9912:
  $9912  D3        .db $D3
  $9913  D3        .db $D3

L_9914:
  $9914  D3        .db $D3
  $9915  D3        .db $D3

L_9916:
  $9916  D3        .db $D3
  $9917  D3        .db $D3

L_9918:
  $9918  00        BRK
  $9919  00        BRK
  $991A  00        BRK
  $991B  00        BRK
  $991C  00        BRK
  $991D  00        BRK
  $991E  00        BRK
  $991F  00        BRK
  $9920  D3        .db $D3
  $9921  D3        .db $D3
  $9922  D3        .db $D3
  $9923  D3        .db $D3
  $9924  D3        .db $D3
  $9925  D3        .db $D3
  $9926  13        .db $13
  $9927  A3        .db $A3
  $9928  00        BRK
  $9929  00        BRK
  $992A  00        BRK
  $992B  00        BRK
  $992C  00        BRK
  $992D  00        BRK
  $992E  00        BRK
  $992F  60        RTS
  $9930  F0 D0     BEQ $9902
  $9932  F0 D0     BEQ $9904
  $9934  D0 D0     BNE $9906
  $9936  D0 D0     BNE $9908
  $9938  00        BRK
  $9939  00        BRK
  $993A  00        BRK
  $993B  00        BRK
  $993C  00        BRK
  $993D  00        BRK
  $993E  00        BRK
  $993F  00        BRK
  $9940  D0 D0     BNE $9912
  $9942  D0 D0     BNE $9914
  $9944  D0 D0     BNE $9916
  $9946  D0 D0     BNE $9918
  $9948  00        BRK
  $9949  00        BRK
  $994A  00        BRK
  $994B  00        BRK
  $994C  00        BRK
  $994D  00        BRK
  $994E  00        BRK
  $994F  00        BRK
  $9950  50 90     BVC $98E2
  $9952  60        RTS
  $9953  50 5C     BVC $99B1
  $9955  5E 5E 5E  LSR $5E5E,X
  $9958  00        BRK
  $9959  80        .db $80
  $995A  E0 F0     CPX #$F0
  $995C  FC        .db $FC
  $995D  FE FE FE  INC $FEFE,X
  $9960  FE E0 80  INC $80E0,X
  $9963  7F        .db $7F
  $9964  04        .db $04
  $9965  F8        SED
  $9966  FF        .db $FF
  $9967  FF        .db $FF
  $9968  01 1F     ORA ($1F,X)
  $996A  00        BRK
  $996B  00        BRK
  $996C  07        .db $07
  $996D  F8        SED
  $996E  0F        .db $0F
  $996F  00        BRK
  $9970  01 00     ORA ($00,X)
  $9972  00        BRK
  $9973  FC        .db $FC
  $9974  3F        .db $3F
  $9975  63        .db $63
  $9976  86 F8     STX $F8
  $9978  FF        .db $FF
  $9979  FF        .db $FF
  $997A  00        BRK
  $997B  03        .db $03
  $997C  C0 7C     CPY #$7C
  $997E  87        .db $87
  $997F  78        SEI
  $9980  00        BRK
  $9981  40        RTI
  $9982  00        BRK
  $9983  C0 8C     CPY #$8C
  $9985  F0 0D     BEQ $9994
  $9987  C1 00     CMP ($00,X)
  $9989  C0 00     CPY #$00
  $998B  C0 7C     CPY #$7C
  $998D  0E F3 FF  ASL $FFF3
  $9990  FF        .db $FF
  $9991  7F        .db $7F
  $9992  BF        .db $BF
  $9993  3F        .db $3F

L_9994:
  $9994  C7        .db $C7
  $9995  38        SEC
  $9996  0F        .db $0F
  $9997  83        .db $83
  $9998  00        BRK
  $9999  00        BRK
  $999A  00        BRK
  $999B  00        BRK
  $999C  C0 F8     CPY #$F8
  $999E  FF        .db $FF
  $999F  7F        .db $7F
  $99A0  FF        .db $FF
  $99A1  FF        .db $FF
  $99A2  FF        .db $FF
  $99A3  FF        .db $FF
  $99A4  FF        .db $FF
  $99A5  FF        .db $FF
  $99A6  1F        .db $1F
  $99A7  87        .db $87
  $99A8  00        BRK
  $99A9  00        BRK
  $99AA  00        BRK
  $99AB  00        BRK
  $99AC  00        BRK
  $99AD  00        BRK
  $99AE  20 88 36  JSR $3688

L_99B1:
  $99B1  68        PLA
  $99B2  00        BRK
  $99B3  C0 8C     CPY #$8C
  $99B5  F0 0D     BEQ $99C4
  $99B7  C1 3E     CMP ($3E,X)
  $99B9  E8        INX
  $99BA  00        BRK
  $99BB  C0 7C     CPY #$7C
  $99BD  0E F3 FF  ASL $FFF3
  $99C0  20 40 00  JSR $0040
  $99C3  A0 00     LDY #$00
  $99C5  80        .db $80
  $99C6  00        BRK
  $99C7  00        BRK
  $99C8  DF        .db $DF
  $99C9  BF        .db $BF
  $99CA  FF        .db $FF
  $99CB  5F        .db $5F
  $99CC  FF        .db $FF
  $99CD  7F        .db $7F
  $99CE  FF        .db $FF
  $99CF  FF        .db $FF
  $99D0  E1 78     SBC ($78,X)
  $99D2  B8        CLV
  $99D3  3C        .db $3C
  $99D4  0E 55 0E  ASL $0E55
  $99D7  A5 E2     LDA $E2
  $99D9  F8        SED
  $99DA  F8        SED
  $99DB  FC        .db $FC
  $99DC  FE FD FE  INC $FEFD,X
  $99DF  FD FF 7C  SBC $7CFF,X
  $99E2  20 07 02  JSR $0207
  $99E5  00        BRK
  $99E6  00        BRK
  $99E7  00        BRK
  $99E8  00        BRK
  $99E9  83        .db $83
  $99EA  40        RTI
  $99EB  28        PLP
  $99EC  03        .db $03
  $99ED  00        BRK
  $99EE  00        BRK
  $99EF  00        BRK
  $99F0  00        BRK
  $99F1  00        BRK
  $99F2  00        BRK
  $99F3  FC        .db $FC
  $99F4  3E 60 02  ROL $0260,X
  $99F7  21 FF     AND ($FF,X)
  $99F9  FF        .db $FF
  $99FA  00        BRK
  $99FB  03        .db $03
  $99FC  C1 78     CMP ($78,X)
  $99FE  03        .db $03
  $99FF  3E 36 4C  ROL $4C36,X
  $9A02  F0 3E     BEQ $9A42
  $9A04  40        RTI
  $9A05  00        BRK
  $9A06  5F        .db $5F
  $9A07  5F        .db $5F
  $9A08  3E CC F0  ROL $F0CC,X
  $9A0B  3E C0 00  ROL $00C0,X
  $9A0E  A0 A0     LDY #$A0
  $9A10  86 F1     STX $F1
  $9A12  F8        SED
  $9A13  FE 7F 7F  INC $7F7F,X
  $9A16  9F        .db $9F
  $9A17  CF        .db $CF
  $9A18  67        .db $67
  $9A19  09 06     ORA #$06
  $9A1B  01 80     ORA ($80,X)
  $9A1D  80        .db $80
  $9A1E  E0 F0     CPX #$F0
  $9A20  56 8F     LSR $8F,X
  $9A22  FA        .db $FA
  $9A23  7D 36 98  ADC $9836,X
  $9A26  8E CC FE  STX $FECC
  $9A29  FF        .db $FF
  $9A2A  FA        .db $FA
  $9A2B  7D B6 58  ADC $58B6,X
  $9A2E  6E 2C 00  ROR $002C
  $9A31  01 05     ORA ($05,X)
  $9A33  1D 1D 1D  ORA $1D1D,X
  $9A36  1D 1D 00  ORA $001D,X
  $9A39  01 07     ORA ($07,X)
  $9A3B  1F        .db $1F
  $9A3C  1F        .db $1F
  $9A3D  1F        .db $1F
  $9A3E  1F        .db $1F
  $9A3F  1F        .db $1F
  $9A40  05 04     ORA $04

L_9A42:
  $9A42  00        BRK
  $9A43  01 01     ORA ($01,X)
  $9A45  05 05     ORA $05
  $9A47  05 FA     ORA $FA
  $9A49  FB        .db $FB
  $9A4A  F8        SED
  $9A4B  E1 86     SBC ($86,X)
  $9A4D  9A        TXS
  $9A4E  FA        .db $FA
  $9A4F  FA        .db $FA
  $9A50  5F        .db $5F
  $9A51  00        BRK
  $9A52  00        BRK
  $9A53  5F        .db $5F
  $9A54  5F        .db $5F
  $9A55  5F        .db $5F
  $9A56  5F        .db $5F
  $9A57  5F        .db $5F
  $9A58  A0 00     LDY #$00
  $9A5A  00        BRK
  $9A5B  A0 A0     LDY #$A0
  $9A5D  A0 A0     LDY #$A0
  $9A5F  A0 F4     LDY #$F4
  $9A61  74        .db $74
  $9A62  74        .db $74
  $9A63  F4        .db $F4
  $9A64  F4        .db $F4
  $9A65  F4        .db $F4
  $9A66  F4        .db $F4
  $9A67  F4        .db $F4
  $9A68  0B        .db $0B
  $9A69  0B        .db $0B
  $9A6A  0B        .db $0B
  $9A6B  0B        .db $0B
  $9A6C  0B        .db $0B
  $9A6D  0B        .db $0B
  $9A6E  0B        .db $0B
  $9A6F  0B        .db $0B
  $9A70  84 81     STY $81
  $9A72  81 81     STA ($81,X)
  $9A74  81 81     STA ($81,X)
  $9A76  81 81     STA ($81,X)
  $9A78  7C        .db $7C
  $9A79  7F        .db $7F
  $9A7A  7F        .db $7F
  $9A7B  7F        .db $7F
  $9A7C  7F        .db $7F
  $9A7D  7F        .db $7F
  $9A7E  7F        .db $7F
  $9A7F  7F        .db $7F
  $9A80  10 10     BPL $9A92
  $9A82  10 10     BPL $9A94
  $9A84  10 10     BPL $9A96
  $9A86  10 10     BPL $9A98
  $9A88  30 30     BMI $9ABA
  $9A8A  30 30     BMI $9ABC
  $9A8C  30 30     BMI $9ABE
  $9A8E  30 30     BMI $9AC0
  $9A90  10 10     BPL $9AA2

L_9A92:
  $9A92  10 10     BPL $9AA4

L_9A94:
  $9A94  18        CLC
  $9A95  18        CLC

L_9A96:
  $9A96  18        CLC
  $9A97  18        CLC

L_9A98:
  $9A98  30 30     BMI $9ACA
  $9A9A  30 30     BMI $9ACC
  $9A9C  78        SEI
  $9A9D  78        SEI
  $9A9E  78        SEI
  $9A9F  78        SEI
  $9AA0  08        PHP
  $9AA1  08        PHP

L_9AA2:
  $9AA2  0C        .db $0C
  $9AA3  0C        .db $0C

L_9AA4:
  $9AA4  0C        .db $0C
  $9AA5  4C 4C 4C  JMP $4C4C
  $9AA8  78        SEI
  $9AA9  78        SEI
  $9AAA  FC        .db $FC
  $9AAB  FC        .db $FC
  $9AAC  FC        .db $FC
  $9AAD  BC BC BC  LDY $BCBC,X
  $9AB0  00        BRK
  $9AB1  00        BRK
  $9AB2  00        BRK
  $9AB3  00        BRK
  $9AB4  00        BRK
  $9AB5  01 01     ORA ($01,X)
  $9AB7  01 01     ORA ($01,X)
  $9AB9  01 03     ORA ($03,X)
  $9ABB  03        .db $03

L_9ABC:
  $9ABC  03        .db $03
  $9ABD  06 06     ASL $06
  $9ABF  0E 4E 4E  ASL $4E4E
  $9AC2  8F        .db $8F
  $9AC3  8F        .db $8F
  $9AC4  87        .db $87
  $9AC5  87        .db $87
  $9AC6  87        .db $87

L_9AC7:
  $9AC7  87        .db $87
  $9AC8  BE BE 7F  LDX $7FBE,Y
  $9ACB  7F        .db $7F

L_9ACC:
  $9ACC  7F        .db $7F
  $9ACD  7F        .db $7F
  $9ACE  7F        .db $7F

L_9ACF:
  $9ACF  7F        .db $7F
  $9AD0  00        BRK
  $9AD1  00        BRK
  $9AD2  00        BRK
  $9AD3  00        BRK
  $9AD4  00        BRK
  $9AD5  80        .db $80
  $9AD6  80        .db $80
  $9AD7  C0 00     CPY #$00
  $9AD9  00        BRK
  $9ADA  00        BRK
  $9ADB  00        BRK
  $9ADC  00        BRK
  $9ADD  80        .db $80
  $9ADE  80        .db $80
  $9ADF  C0 03     CPY #$03
  $9AE1  02        .db $02
  $9AE2  01 00     ORA ($00,X)
  $9AE4  0B        .db $0B
  $9AE5  3D 0E 03  AND $030E,X
  $9AE8  0C        .db $0C
  $9AE9  1D 1F 30  ORA $301F,X
  $9AEC  4B        .db $4B
  $9AED  3D 0E 03  AND $030E,X
  $9AF0  03        .db $03
  $9AF1  01 03     ORA ($03,X)
  $9AF3  B4 B7     LDY $B7,X
  $9AF5  B6 95     LDX $95,Y
  $9AF7  49 FF     EOR #$FF
  $9AF9  FF        .db $FF
  $9AFA  03        .db $03
  $9AFB  B4 B7     LDY $B7,X
  $9AFD  B6 95     LDX $95,Y
  $9AFF  49 C0     EOR #$C0
  $9B01  E0 E0     CPX #$E0
  $9B03  30 48     BMI $9B4D
  $9B05  F0 C0     BEQ $9AC7
  $9B07  00        BRK
  $9B08  C0 E0     CPY #$E0
  $9B0A  E0 30     CPX #$30
  $9B0C  48        PHA
  $9B0D  F0 C0     BEQ $9ACF
  $9B0F  00        BRK
  $9B10  E7        .db $E7
  $9B11  73        .db $73
  $9B12  39 19 1C  AND $1C19,Y
  $9B15  0C        .db $0C
  $9B16  0C        .db $0C
  $9B17  04        .db $04
  $9B18  F8        SED
  $9B19  7C        .db $7C
  $9B1A  3E 1E 1F  ROL $1F1E,X
  $9B1D  0F        .db $0F
  $9B1E  0F        .db $0F
  $9B1F  07        .db $07
  $9B20  C6 E6     DEC $E6
  $9B22  E3        .db $E3
  $9B23  F3        .db $F3
  $9B24  F1 F1     SBC ($F1),Y
  $9B26  F1 E1     SBC ($E1),Y
  $9B28  36 16     ROL $16,X
  $9B2A  1B        .db $1B
  $9B2B  0B        .db $0B
  $9B2C  0D 0D 0D  ORA $0D0D
  $9B2F  1D 1D 1D  ORA $1D1D,X
  $9B32  1D 1D 1D  ORA $1D1D,X
  $9B35  1D 1D 1D  ORA $1D1D,X
  $9B38  1F        .db $1F
  $9B39  1F        .db $1F
  $9B3A  1F        .db $1F
  $9B3B  1F        .db $1F
  $9B3C  1F        .db $1F
  $9B3D  1F        .db $1F
  $9B3E  1F        .db $1F

L_9B3F:
  $9B3F  1F        .db $1F
  $9B40  FF        .db $FF
  $9B41  FF        .db $FF
  $9B42  00        BRK
  $9B43  FF        .db $FF
  $9B44  00        BRK
  $9B45  FF        .db $FF
  $9B46  00        BRK
  $9B47  FF        .db $FF
  $9B48  FF        .db $FF
  $9B49  00        BRK
  $9B4A  FF        .db $FF
  $9B4B  FF        .db $FF
  $9B4C  00        BRK

L_9B4D:
  $9B4D  00        BRK
  $9B4E  FF        .db $FF
  $9B4F  FF        .db $FF
  $9B50  D8        CLD
  $9B51  F2        .db $F2
  $9B52  30 EB     BMI $9B3F
  $9B54  02        .db $02
  $9B55  F0 1B     BEQ $9B72
  $9B57  E0 E0     CPX #$E0
  $9B59  03        .db $03
  $9B5A  C3        .db $C3
  $9B5B  F3        .db $F3
  $9B5C  03        .db $03
  $9B5D  0B        .db $0B
  $9B5E  E3        .db $E3
  $9B5F  F8        SED
  $9B60  8E 81 78  STX $7881
  $9B63  FF        .db $FF
  $9B64  F9 70 4B  SBC $4B70,Y
  $9B67  E4 9E     CPX $9E
  $9B69  FF        .db $FF
  $9B6A  87        .db $87
  $9B6B  03        .db $03
  $9B6C  07        .db $07
  $9B6D  8F        .db $8F
  $9B6E  BB        .db $BB
  $9B6F  E4 81     CPX $81
  $9B71  81 81     STA ($81,X)
  $9B73  81 81     STA ($81,X)
  $9B75  81 81     STA ($81,X)
  $9B77  81 7F     STA ($7F,X)
  $9B79  7F        .db $7F
  $9B7A  7F        .db $7F
  $9B7B  7F        .db $7F
  $9B7C  7F        .db $7F
  $9B7D  7F        .db $7F
  $9B7E  7F        .db $7F
  $9B7F  7F        .db $7F
  $9B80  5E 5E 5E  LSR $5E5E,X
  $9B83  1E 0E 02  ASL $020E,X
  $9B86  02        .db $02
  $9B87  02        .db $02
  $9B88  FE FE FE  INC $FEFE,X
  $9B8B  FE 3E 0E  INC $0E3E,X
  $9B8E  06 06     ASL $06
  $9B90  19 02 00  ORA $0002,Y
  $9B93  03        .db $03
  $9B94  02        .db $02
  $9B95  00        BRK
  $9B96  03        .db $03
  $9B97  C1 19     CMP ($19,X)
  $9B99  03        .db $03
  $9B9A  03        .db $03
  $9B9B  03        .db $03
  $9B9C  03        .db $03
  $9B9D  03        .db $03
  $9B9E  03        .db $03
  $9B9F  01 00     ORA ($00,X)
  $9BA1  00        BRK
  $9BA2  02        .db $02
  $9BA3  00        BRK
  $9BA4  02        .db $02
  $9BA5  00        BRK
  $9BA6  02        .db $02
  $9BA7  2C 00 00  BIT $0000
  $9BAA  06 00     ASL $00
  $9BAC  06 00     ASL $00
  $9BAE  2A        ROL
  $9BAF  2C 04 00  BIT $0004
  $9BB2  01 01     ORA ($01,X)
  $9BB4  01 01     ORA ($01,X)
  $9BB6  03        .db $03
  $9BB7  03        .db $03
  $9BB8  07        .db $07
  $9BB9  03        .db $03
  $9BBA  02        .db $02
  $9BBB  02        .db $02
  $9BBC  02        .db $02
  $9BBD  02        .db $02
  $9BBE  04        .db $04
  $9BBF  04        .db $04
  $9BC0  E3        .db $E3
  $9BC1  E3        .db $E3
  $9BC2  C7        .db $C7
  $9BC3  C7        .db $C7
  $9BC4  C7        .db $C7
  $9BC5  8E 8D 0E  STX $0E8D
  $9BC8  1B        .db $1B
  $9BC9  1B        .db $1B
  $9BCA  37        .db $37
  $9BCB  37        .db $37
  $9BCC  37        .db $37
  $9BCD  6E 6D EE  ROR $EE6D
  $9BD0  19 1A 1A  ORA $1A1A,Y
  $9BD3  1A        .db $1A
  $9BD4  3A        .db $3A
  $9BD5  3A        .db $3A
  $9BD6  3A        .db $3A
  $9BD7  3A        .db $3A
  $9BD8  1F        .db $1F
  $9BD9  1F        .db $1F
  $9BDA  1F        .db $1F
  $9BDB  1F        .db $1F
  $9BDC  3F        .db $3F
  $9BDD  3F        .db $3F
  $9BDE  3F        .db $3F
  $9BDF  3F        .db $3F
  $9BE0  07        .db $07
  $9BE1  1F        .db $1F
  $9BE2  F8        SED
  $9BE3  E0 E2     CPX #$E2
  $9BE5  ED 85 85  SBC $8585
  $9BE8  FF        .db $FF
  $9BE9  FF        .db $FF
  $9BEA  F8        SED
  $9BEB  E0 E3     CPX #$E3
  $9BED  EA        NOP
  $9BEE  FA        .db $FA
  $9BEF  FA        .db $FA
  $9BF0  5F        .db $5F
  $9BF1  5F        .db $5F
  $9BF2  5F        .db $5F
  $9BF3  5F        .db $5F
  $9BF4  5F        .db $5F
  $9BF5  5F        .db $5F
  $9BF6  5F        .db $5F
  $9BF7  5F        .db $5F
  $9BF8  A0 A0     LDY #$A0
  $9BFA  A0 A0     LDY #$A0
  $9BFC  A0 A0     LDY #$A0
  $9BFE  A0 A0     LDY #$A0
  $9C00  03        .db $03
  $9C01  10 3E     BPL $9C41
  $9C03  07        .db $07
  $9C04  FF        .db $FF
  $9C05  01 1F     ORA ($1F,X)
  $9C07  00        BRK
  $9C08  0C        .db $0C
  $9C09  11 3E     ORA ($3E),Y
  $9C0B  7F        .db $7F
  $9C0C  FF        .db $FF
  $9C0D  FF        .db $FF
  $9C0E  FF        .db $FF
  $9C0F  FF        .db $FF
  $9C10  1E 1C 18  ASL $181C,X
  $9C13  E0 FE     CPX #$FE
  $9C15  FF        .db $FF
  $9C16  FF        .db $FF
  $9C17  FE FE FC  INC $FCFE,X
  $9C1A  18        CLC
  $9C1B  E0 FE     CPX #$FE
  $9C1D  FF        .db $FF
  $9C1E  FF        .db $FF
  $9C1F  FE 3A 3A  INC $3A3A,X
  $9C22  3A        .db $3A
  $9C23  3A        .db $3A
  $9C24  3A        .db $3A
  $9C25  9A        TXS
  $9C26  3E 82 3F  ROL $3F82,X
  $9C29  3F        .db $3F
  $9C2A  3F        .db $3F
  $9C2B  3F        .db $3F
  $9C2C  3F        .db $3F
  $9C2D  9F        .db $9F
  $9C2E  3E FC 85  ROL $85FC,X
  $9C31  85 85     STA $85
  $9C33  85 85     STA $85
  $9C35  85 85     STA $85
  $9C37  85 FA     STA $FA
  $9C39  FA        .db $FA
  $9C3A  FA        .db $FA
  $9C3B  FA        .db $FA
  $9C3C  FA        .db $FA
  $9C3D  FA        .db $FA
  $9C3E  FA        .db $FA
  $9C3F  FA        .db $FA
  $9C40  02        .db $02

L_9C41:
  $9C41  02        .db $02
  $9C42  02        .db $02
  $9C43  02        .db $02
  $9C44  42        .db $42
  $9C45  52        .db $52
  $9C46  5E 5E 06  LSR $065E,X
  $9C49  06 06     ASL $06
  $9C4B  06 C6     ASL $C6
  $9C4D  F6 FE     INC $FE,X
  $9C4F  FE 00 00  INC $0000,X
  $9C52  00        BRK
  $9C53  C0 30     CPY #$30
  $9C55  2C 23 22  BIT $2223
  $9C58  00        BRK
  $9C59  00        BRK
  $9C5A  00        BRK
  $9C5B  00        BRK
  $9C5C  00        BRK
  $9C5D  00        BRK
  $9C5E  00        BRK
  $9C5F  00        BRK
  $9C60  81 81     STA ($81,X)
  $9C62  81 80     STA ($80,X)
  $9C64  82        .db $82
  $9C65  82        .db $82
  $9C66  82        .db $82
  $9C67  82        .db $82
  $9C68  7F        .db $7F
  $9C69  7F        .db $7F
  $9C6A  7F        .db $7F
  $9C6B  78        SEI
  $9C6C  79 79 79  ADC $7979,Y
  $9C6F  79 5E 5E  ADC $5E5E,Y
  $9C72  5E 1E 22  LSR $221E,X
  $9C75  0C        .db $0C
  $9C76  07        .db $07
  $9C77  05 FE     ORA $FE
  $9C79  FE FE 1E  INC $1EFE,X
  $9C7C  E2        .db $E2
  $9C7D  FC        .db $FC
  $9C7E  FF        .db $FF
  $9C7F  DF        .db $DF
  $9C80  22        .db $22
  $9C81  42        .db $42
  $9C82  72        .db $72
  $9C83  78        SEI
  $9C84  7A        .db $7A
  $9C85  7A        .db $7A
  $9C86  3A        .db $3A
  $9C87  3A        .db $3A
  $9C88  00        BRK
  $9C89  40        RTI
  $9C8A  70 7C     BVS $9D08
  $9C8C  7F        .db $7F
  $9C8D  7F        .db $7F
  $9C8E  3F        .db $3F
  $9C8F  3F        .db $3F
  $9C90  30 2C     BMI $9CBE
  $9C92  22        .db $22
  $9C93  22        .db $22
  $9C94  22        .db $22
  $9C95  02        .db $02
  $9C96  02        .db $02
  $9C97  00        BRK
  $9C98  00        BRK
  $9C99  00        BRK
  $9C9A  00        BRK
  $9C9B  00        BRK
  $9C9C  00        BRK
  $9C9D  C0 F0     CPY #$F0
  $9C9F  FC        .db $FC
  $9CA0  FC        .db $FC
  $9CA1  7C        .db $7C
  $9CA2  7C        .db $7C
  $9CA3  7C        .db $7C
  $9CA4  3C        .db $3C
  $9CA5  3C        .db $3C
  $9CA6  3C        .db $3C
  $9CA7  1C        .db $1C
  $9CA8  FC        .db $FC
  $9CA9  FC        .db $FC
  $9CAA  FC        .db $FC
  $9CAB  FC        .db $FC
  $9CAC  FC        .db $FC
  $9CAD  FC        .db $FC
  $9CAE  FC        .db $FC
  $9CAF  FC        .db $FC
  $9CB0  82        .db $82
  $9CB1  AA        TAX
  $9CB2  82        .db $82
  $9CB3  82        .db $82
  $9CB4  82        .db $82
  $9CB5  82        .db $82
  $9CB6  82        .db $82
  $9CB7  82        .db $82
  $9CB8  C4 EC     CPY $EC
  $9CBA  FC        .db $FC
  $9CBB  C4 FC     CPY $FC
  $9CBD  C4 FC     CPY $FC
  $9CBF  FC        .db $FC
  $9CC0  82        .db $82
  $9CC1  82        .db $82
  $9CC2  82        .db $82
  $9CC3  82        .db $82
  $9CC4  82        .db $82
  $9CC5  82        .db $82
  $9CC6  82        .db $82
  $9CC7  82        .db $82
  $9CC8  79 79 79  ADC $7979,Y
  $9CCB  79 79 79  ADC $7979,Y
  $9CCE  79 79 05  ADC $0579,Y
  $9CD1  05 05     ORA $05
  $9CD3  05 05     ORA $05
  $9CD5  05 05     ORA $05
  $9CD7  05 C7     ORA $C7
  $9CD9  EF        .db $EF
  $9CDA  FF        .db $FF
  $9CDB  FF        .db $FF
  $9CDC  C7        .db $C7
  $9CDD  FF        .db $FF
  $9CDE  C7        .db $C7
  $9CDF  FF        .db $FF
  $9CE0  05 05     ORA $05
  $9CE2  05 05     ORA $05
  $9CE4  05 05     ORA $05
  $9CE6  05 05     ORA $05
  $9CE8  FF        .db $FF
  $9CE9  FF        .db $FF
  $9CEA  FF        .db $FF
  $9CEB  FF        .db $FF
  $9CEC  FF        .db $FF
  $9CED  FF        .db $FF
  $9CEE  FF        .db $FF
  $9CEF  FF        .db $FF
  $9CF0  3A        .db $3A
  $9CF1  3A        .db $3A
  $9CF2  3A        .db $3A
  $9CF3  3A        .db $3A
  $9CF4  3A        .db $3A
  $9CF5  3A        .db $3A
  $9CF6  3A        .db $3A
  $9CF7  0F        .db $0F
  $9CF8  3F        .db $3F
  $9CF9  3F        .db $3F
  $9CFA  3F        .db $3F
  $9CFB  3F        .db $3F
  $9CFC  3F        .db $3F
  $9CFD  3F        .db $3F
  $9CFE  3F        .db $3F
  $9CFF  0F        .db $0F
  $9D00  02        .db $02
  $9D01  02        .db $02
  $9D02  02        .db $02
  $9D03  02        .db $02
  $9D04  02        .db $02
  $9D05  02        .db $02
  $9D06  02        .db $02
  $9D07  02        .db $02

L_9D08:
  $9D08  FE FE FE  INC $FEFE,X
  $9D0B  FE FE FE  INC $FEFE,X
  $9D0E  FE FE 5C  INC $5CFE,X
  $9D11  5C        .db $5C
  $9D12  5C        .db $5C
  $9D13  5C        .db $5C
  $9D14  5C        .db $5C
  $9D15  5C        .db $5C
  $9D16  5C        .db $5C
  $9D17  5C        .db $5C
  $9D18  FC        .db $FC
  $9D19  FC        .db $FC
  $9D1A  FC        .db $FC
  $9D1B  FC        .db $FC
  $9D1C  FC        .db $FC
  $9D1D  FC        .db $FC
  $9D1E  FC        .db $FC
  $9D1F  FC        .db $FC
  $9D20  00        BRK
  $9D21  00        BRK
  $9D22  00        BRK
  $9D23  00        BRK
  $9D24  00        BRK
  $9D25  00        BRK
  $9D26  6C 83 FF  JMP ($FF83)
  $9D29  FF        .db $FF
  $9D2A  FF        .db $FF
  $9D2B  FF        .db $FF
  $9D2C  FF        .db $FF
  $9D2D  FF        .db $FF
  $9D2E  EF        .db $EF
  $9D2F  83        .db $83
  $9D30  8A        TXA
  $9D31  8A        TXA
  $9D32  8A        TXA
  $9D33  8A        TXA
  $9D34  8A        TXA
  $9D35  FA        .db $FA
  $9D36  8A        TXA
  $9D37  FA        .db $FA
  $9D38  F4        .db $F4
  $9D39  F4        .db $F4
  $9D3A  F4        .db $F4
  $9D3B  F4        .db $F4
  $9D3C  F4        .db $F4
  $9D3D  F4        .db $F4
  $9D3E  F4        .db $F4
  $9D3F  F4        .db $F4
  $9D40  00        BRK
  $9D41  7E 7E 7A  ROR $7A7E,X
  $9D44  72        .db $72
  $9D45  62        .db $62
  $9D46  42        .db $42
  $9D47  7E 00 02  ROR $0200,X
  $9D4A  06 0E     ASL $0E
  $9D4C  1E 3E 7E  ASL $7E3E,X
  $9D4F  7E 23 28  ROR $2823,X
  $9D52  2A        ROL
  $9D53  2A        ROL
  $9D54  2A        ROL
  $9D55  2A        ROL
  $9D56  2A        ROL
  $9D57  2A        ROL
  $9D58  33        .db $33
  $9D59  3C        .db $3C
  $9D5A  3F        .db $3F
  $9D5B  3F        .db $3F
  $9D5C  3F        .db $3F
  $9D5D  3F        .db $3F
  $9D5E  3F        .db $3F
  $9D5F  3F        .db $3F
  $9D60  C2        .db $C2
  $9D61  F2        .db $F2
  $9D62  3E 0E 02  ROL $020E,X
  $9D65  00        BRK
  $9D66  01 00     ORA ($00,X)
  $9D68  FE FE 3E  INC $3EFE,X
  $9D6B  CE F2 FC  DEC $FCF2
  $9D6E  FF        .db $FF
  $9D6F  FF        .db $FF
  $9D70  0F        .db $0F
  $9D71  18        CLC
  $9D72  78        SEI
  $9D73  78        SEI
  $9D74  78        SEI
  $9D75  78        SEI
  $9D76  38        SEC
  $9D77  58        CLI
  $9D78  10 7F     BPL $9DF9
  $9D7A  7F        .db $7F
  $9D7B  7F        .db $7F
  $9D7C  7F        .db $7F
  $9D7D  7F        .db $7F
  $9D7E  3F        .db $3F
  $9D7F  DF        .db $DF
  $9D80  C0 38     CPY #$38
  $9D82  04        .db $04
  $9D83  02        .db $02
  $9D84  01 00     ORA ($00,X)
  $9D86  00        BRK
  $9D87  00        BRK
  $9D88  20 C4 FA  JSR $FAC4
  $9D8B  FD FF FF  SBC $FFFF,X
  $9D8E  FF        .db $FF
  $9D8F  FF        .db $FF
  $9D90  2A        ROL
  $9D91  2A        ROL
  $9D92  2A        ROL
  $9D93  2A        ROL
  $9D94  2A        ROL
  $9D95  2A        ROL
  $9D96  2A        ROL
  $9D97  2A        ROL
  $9D98  3F        .db $3F
  $9D99  3F        .db $3F
  $9D9A  3F        .db $3F
  $9D9B  3F        .db $3F
  $9D9C  3F        .db $3F
  $9D9D  3F        .db $3F
  $9D9E  3F        .db $3F

L_9D9F:
  $9D9F  3F        .db $3F
  $9DA0  08        PHP
  $9DA1  08        PHP
  $9DA2  08        PHP
  $9DA3  08        PHP
  $9DA4  08        PHP
  $9DA5  08        PHP
  $9DA6  00        BRK
  $9DA7  08        PHP
  $9DA8  CF        .db $CF
  $9DA9  CF        .db $CF
  $9DAA  CE CE CE  DEC $CECE
  $9DAD  CE CE CE  DEC $CECE
  $9DB0  00        BRK
  $9DB1  00        BRK
  $9DB2  80        .db $80
  $9DB3  00        BRK
  $9DB4  00        BRK
  $9DB5  00        BRK
  $9DB6  00        BRK
  $9DB7  00        BRK
  $9DB8  FF        .db $FF
  $9DB9  FF        .db $FF
  $9DBA  FF        .db $FF
  $9DBB  3F        .db $3F
  $9DBC  FF        .db $FF
  $9DBD  3F        .db $3F
  $9DBE  FF        .db $FF
  $9DBF  3F        .db $3F
  $9DC0  00        BRK
  $9DC1  30 7C     BMI $9E3F
  $9DC3  FC        .db $FC
  $9DC4  BE BB DB  LDX $DBBB,Y
  $9DC7  DF        .db $DF
  $9DC8  03        .db $03
  $9DC9  31 5C     AND ($5C),Y
  $9DCB  C4 06     CPY $06
  $9DCD  23        .db $23
  $9DCE  43        .db $43
  $9DCF  5F        .db $5F
  $9DD0  00        BRK
  $9DD1  00        BRK
  $9DD2  00        BRK
  $9DD3  18        CLC
  $9DD4  7F        .db $7F
  $9DD5  FF        .db $FF
  $9DD6  FF        .db $FF
  $9DD7  FF        .db $FF
  $9DD8  FB        .db $FB
  $9DD9  FB        .db $FB
  $9DDA  82        .db $82
  $9DDB  18        CLC
  $9DDC  6F        .db $6F
  $9DDD  73        .db $73
  $9DDE  71 39     ADC ($39),Y
  $9DE0  00        BRK
  $9DE1  00        BRK
  $9DE2  00        BRK
  $9DE3  00        BRK
  $9DE4  00        BRK
  $9DE5  B0 B8     BCS $9D9F
  $9DE7  BC CE CE  LDY $CECE,X
  $9DEA  CE CE 07  DEC $07CE
  $9DED  B1 B8     LDA ($B8),Y
  $9DEF  BC 00 00  LDY $0000,X
  $9DF2  00        BRK
  $9DF3  00        BRK
  $9DF4  00        BRK
  $9DF5  00        BRK
  $9DF6  00        BRK
  $9DF7  00        BRK
  $9DF8  FF        .db $FF

L_9DF9:
  $9DF9  3F        .db $3F
  $9DFA  FF        .db $FF
  $9DFB  3F        .db $3F
  $9DFC  BF        .db $BF
  $9DFD  FF        .db $FF
  $9DFE  7F        .db $7F
  $9DFF  3C        .db $3C
  $9E00  80        .db $80
  $9E01  C3        .db $C3
  $9E02  C7        .db $C7
  $9E03  EF        .db $EF
  $9E04  EF        .db $EF
  $9E05  F7        .db $F7
  $9E06  F7        .db $F7
  $9E07  FB        .db $FB
  $9E08  98        TYA
  $9E09  D0 44     BNE $9E4F
  $9E0B  2C 2C 36  BIT $362C
  $9E0E  16 1B     ASL $1B,X
  $9E10  00        BRK
  $9E11  E0 F9     CPX #$F9
  $9E13  FC        .db $FC
  $9E14  FE BA DB  INC $DBBA,X
  $9E17  DF        .db $DF
  $9E18  00        BRK
  $9E19  E0 88     CPX #$88
  $9E1B  44        .db $44
  $9E1C  66 22     ROR $22
  $9E1E  53        .db $53
  $9E1F  5F        .db $5F
  $9E20  6C BB 0A  JMP ($0ABB)
  $9E23  34        .db $34
  $9E24  41 2A     EOR ($2A,X)
  $9E26  28        PLP
  $9E27  92        .db $92
  $9E28  6C BB 0A  JMP ($0ABB)
  $9E2B  34        .db $34
  $9E2C  41 2A     EOR ($2A,X)
  $9E2E  28        PLP
  $9E2F  92        .db $92
  $9E30  48        PHA
  $9E31  48        PHA
  $9E32  08        PHP
  $9E33  20 20 00  JSR $0020
  $9E36  00        BRK
  $9E37  00        BRK
  $9E38  48        PHA
  $9E39  48        PHA
  $9E3A  08        PHP
  $9E3B  20 20 00  JSR $0020
  $9E3E  00        BRK

L_9E3F:
  $9E3F  00        BRK
  $9E40  40        RTI
  $9E41  48        PHA
  $9E42  08        PHP
  $9E43  00        BRK
  $9E44  20 00 10  JSR $1000
  $9E47  00        BRK
  $9E48  40        RTI
  $9E49  48        PHA
  $9E4A  08        PHP
  $9E4B  00        BRK
  $9E4C  20 00 10  JSR $1000

L_9E4F:
  $9E4F  00        BRK
  $9E50  6C BB 0A  JMP ($0ABB)
  $9E53  24 41     BIT $41
  $9E55  02        .db $02
  $9E56  08        PHP
  $9E57  82        .db $82
  $9E58  6C BB 0A  JMP ($0ABB)
  $9E5B  24 41     BIT $41
  $9E5D  02        .db $02
  $9E5E  08        PHP
  $9E5F  82        .db $82
  $9E60  EF        .db $EF
  $9E61  7F        .db $7F
  $9E62  ED B7 76  SBC $76B7
  $9E65  ED 3E D3  SBC $D33E
  $9E68  EF        .db $EF
  $9E69  7F        .db $7F
  $9E6A  ED B7 76  SBC $76B7
  $9E6D  ED 3E D3  SBC $D33E
  $9E70  FF        .db $FF
  $9E71  FF        .db $FF
  $9E72  F6 B5     INC $B5,X
  $9E74  EA        NOP
  $9E75  4F        .db $4F
  $9E76  D2        .db $D2
  $9E77  A5 FF     LDA $FF
  $9E79  FF        .db $FF
  $9E7A  F6 B5     INC $B5,X
  $9E7C  EA        NOP
  $9E7D  4F        .db $4F
  $9E7E  D2        .db $D2
  $9E7F  A5 FF     LDA $FF
  $9E81  FF        .db $FF
  $9E82  FF        .db $FF
  $9E83  FF        .db $FF
  $9E84  FF        .db $FF
  $9E85  FF        .db $FF
  $9E86  FF        .db $FF
  $9E87  FF        .db $FF
  $9E88  FF        .db $FF
  $9E89  FF        .db $FF
  $9E8A  FF        .db $FF
  $9E8B  FF        .db $FF
  $9E8C  FF        .db $FF
  $9E8D  FF        .db $FF
  $9E8E  FF        .db $FF
  $9E8F  FF        .db $FF
  $9E90  00        BRK
  $9E91  00        BRK
  $9E92  C0 F0     CPY #$F0
  $9E94  F8        SED
  $9E95  78        SEI
  $9E96  7C        .db $7C
  $9E97  04        .db $04
  $9E98  00        BRK
  $9E99  00        BRK
  $9E9A  C0 10     CPY #$10
  $9E9C  98        TYA
  $9E9D  48        PHA
  $9E9E  74        .db $74
  $9E9F  04        .db $04
  $9EA0  00        BRK
  $9EA1  00        BRK
  $9EA2  00        BRK
  $9EA3  00        BRK
  $9EA4  00        BRK
  $9EA5  00        BRK
  $9EA6  00        BRK
  $9EA7  00        BRK
  $9EA8  00        BRK
  $9EA9  00        BRK
  $9EAA  20 30 30  JSR $3030
  $9EAD  30 30     BMI $9EDF
  $9EAF  10 00     BPL $9EB1

L_9EB1:
  $9EB1  00        BRK
  $9EB2  00        BRK
  $9EB3  00        BRK
  $9EB4  00        BRK
  $9EB5  00        BRK
  $9EB6  00        BRK
  $9EB7  00        BRK
  $9EB8  00        BRK
  $9EB9  00        BRK
  $9EBA  00        BRK
  $9EBB  00        BRK
  $9EBC  00        BRK
  $9EBD  00        BRK
  $9EBE  00        BRK
  $9EBF  00        BRK
  $9EC0  00        BRK
  $9EC1  00        BRK
  $9EC2  00        BRK
  $9EC3  00        BRK
  $9EC4  00        BRK
  $9EC5  00        BRK
  $9EC6  00        BRK
  $9EC7  00        BRK
  $9EC8  00        BRK
  $9EC9  00        BRK
  $9ECA  00        BRK
  $9ECB  00        BRK
  $9ECC  00        BRK
  $9ECD  00        BRK
  $9ECE  00        BRK
  $9ECF  00        BRK
  $9ED0  00        BRK
  $9ED1  00        BRK
  $9ED2  00        BRK
  $9ED3  00        BRK
  $9ED4  00        BRK
  $9ED5  00        BRK
  $9ED6  00        BRK
  $9ED7  00        BRK
  $9ED8  00        BRK
  $9ED9  00        BRK
  $9EDA  00        BRK
  $9EDB  00        BRK
  $9EDC  00        BRK
  $9EDD  00        BRK
  $9EDE  00        BRK

L_9EDF:
  $9EDF  00        BRK
  $9EE0  00        BRK
  $9EE1  00        BRK
  $9EE2  00        BRK
  $9EE3  00        BRK
  $9EE4  00        BRK
  $9EE5  00        BRK
  $9EE6  00        BRK
  $9EE7  00        BRK
  $9EE8  00        BRK
  $9EE9  00        BRK
  $9EEA  00        BRK
  $9EEB  00        BRK
  $9EEC  00        BRK
  $9EED  00        BRK
  $9EEE  00        BRK
  $9EEF  00        BRK
  $9EF0  00        BRK
  $9EF1  00        BRK
  $9EF2  00        BRK
  $9EF3  00        BRK
  $9EF4  00        BRK
  $9EF5  00        BRK
  $9EF6  00        BRK
  $9EF7  00        BRK
  $9EF8  00        BRK
  $9EF9  00        BRK
  $9EFA  00        BRK
  $9EFB  00        BRK
  $9EFC  00        BRK
  $9EFD  00        BRK
  $9EFE  00        BRK
  $9EFF  00        BRK
  $9F00  00        BRK
  $9F01  7C        .db $7C
  $9F02  C6 CE     DEC $CE
  $9F04  D6 E6     DEC $E6,X
  $9F06  C6 7C     DEC $7C
  $9F08  FF        .db $FF
  $9F09  83        .db $83
  $9F0A  39 31 29  AND $2931,Y
  $9F0D  19 39 83  ORA $8339,Y
  $9F10  00        BRK
  $9F11  38        SEC
  $9F12  78        SEI
  $9F13  38        SEC
  $9F14  38        SEC
  $9F15  38        SEC
  $9F16  38        SEC
  $9F17  38        SEC
  $9F18  FF        .db $FF
  $9F19  C7        .db $C7
  $9F1A  87        .db $87
  $9F1B  C7        .db $C7
  $9F1C  C7        .db $C7
  $9F1D  C7        .db $C7
  $9F1E  C7        .db $C7
  $9F1F  C7        .db $C7
  $9F20  00        BRK
  $9F21  7C        .db $7C
  $9F22  C6 06     DEC $06
  $9F24  3C        .db $3C
  $9F25  60        RTS
  $9F26  C0 FE     CPY #$FE
  $9F28  FF        .db $FF
  $9F29  83        .db $83
  $9F2A  39 F9 C3  AND $C3F9,Y
  $9F2D  9F        .db $9F
  $9F2E  3F        .db $3F
  $9F2F  01 00     ORA ($00,X)
  $9F31  7C        .db $7C
  $9F32  C6 06     DEC $06
  $9F34  3C        .db $3C
  $9F35  06 C6     ASL $C6
  $9F37  7C        .db $7C
  $9F38  FF        .db $FF
  $9F39  83        .db $83
  $9F3A  39 F9 C3  AND $C3F9,Y
  $9F3D  F9 39 83  SBC $8339,Y
  $9F40  00        BRK
  $9F41  CC CC CC  CPY $CCCC
  $9F44  CC FE 0C  CPY $0CFE
  $9F47  0C        .db $0C
  $9F48  FF        .db $FF
  $9F49  33        .db $33
  $9F4A  33        .db $33
  $9F4B  33        .db $33
  $9F4C  33        .db $33
  $9F4D  01 F3     ORA ($F3,X)
  $9F4F  F3        .db $F3
  $9F50  00        BRK
  $9F51  FE C0 FC  INC $FCC0,X
  $9F54  06 06     ASL $06
  $9F56  C6 7C     DEC $7C
  $9F58  FF        .db $FF
  $9F59  01 3F     ORA ($3F,X)
  $9F5B  03        .db $03
  $9F5C  F9 F9 39  SBC $39F9,Y
  $9F5F  83        .db $83
  $9F60  00        BRK
  $9F61  7C        .db $7C
  $9F62  C6 C0     DEC $C0
  $9F64  FC        .db $FC
  $9F65  C6 C6     DEC $C6
  $9F67  7C        .db $7C
  $9F68  FF        .db $FF
  $9F69  83        .db $83
  $9F6A  39 3F 03  AND $033F,Y
  $9F6D  39 39 83  AND $8339,Y
  $9F70  00        BRK
  $9F71  FE 06 0C  INC $0C06,X
  $9F74  18        CLC
  $9F75  38        SEC
  $9F76  38        SEC
  $9F77  38        SEC
  $9F78  FF        .db $FF
  $9F79  01 F9     ORA ($F9,X)
  $9F7B  F3        .db $F3
  $9F7C  E7        .db $E7
  $9F7D  C7        .db $C7
  $9F7E  C7        .db $C7
  $9F7F  C7        .db $C7
  $9F80  00        BRK
  $9F81  7C        .db $7C
  $9F82  C6 C6     DEC $C6
  $9F84  7C        .db $7C
  $9F85  C6 C6     DEC $C6
  $9F87  7C        .db $7C
  $9F88  FF        .db $FF
  $9F89  83        .db $83
  $9F8A  39 39 83  AND $8339,Y
  $9F8D  39 39 83  AND $8339,Y
  $9F90  00        BRK
  $9F91  7C        .db $7C
  $9F92  C6 C6     DEC $C6
  $9F94  7E 06 C6  ROR $C606,X
  $9F97  7C        .db $7C
  $9F98  FF        .db $FF
  $9F99  83        .db $83
  $9F9A  39 39 81  AND $8139,Y
  $9F9D  F9 39 83  SBC $8339,Y
  $9FA0  00        BRK
  $9FA1  00        BRK
  $9FA2  00        BRK
  $9FA3  00        BRK
  $9FA4  00        BRK
  $9FA5  00        BRK
  $9FA6  00        BRK
  $9FA7  00        BRK
  $9FA8  00        BRK
  $9FA9  00        BRK
  $9FAA  00        BRK
  $9FAB  00        BRK
  $9FAC  00        BRK
  $9FAD  00        BRK
  $9FAE  00        BRK
  $9FAF  00        BRK
  $9FB0  00        BRK
  $9FB1  00        BRK
  $9FB2  00        BRK
  $9FB3  00        BRK
  $9FB4  00        BRK
  $9FB5  00        BRK
  $9FB6  00        BRK
  $9FB7  00        BRK
  $9FB8  00        BRK
  $9FB9  00        BRK
  $9FBA  00        BRK
  $9FBB  00        BRK
  $9FBC  00        BRK
  $9FBD  00        BRK
  $9FBE  00        BRK
  $9FBF  00        BRK
  $9FC0  00        BRK
  $9FC1  00        BRK
  $9FC2  00        BRK
  $9FC3  00        BRK
  $9FC4  00        BRK
  $9FC5  00        BRK
  $9FC6  00        BRK
  $9FC7  00        BRK
  $9FC8  00        BRK
  $9FC9  00        BRK
  $9FCA  00        BRK
  $9FCB  00        BRK
  $9FCC  00        BRK
  $9FCD  00        BRK
  $9FCE  00        BRK
  $9FCF  00        BRK
  $9FD0  00        BRK
  $9FD1  00        BRK
  $9FD2  00        BRK
  $9FD3  00        BRK
  $9FD4  00        BRK
  $9FD5  00        BRK
  $9FD6  00        BRK
  $9FD7  00        BRK
  $9FD8  00        BRK
  $9FD9  00        BRK
  $9FDA  00        BRK
  $9FDB  00        BRK
  $9FDC  00        BRK
  $9FDD  00        BRK
  $9FDE  00        BRK
  $9FDF  00        BRK
  $9FE0  00        BRK
  $9FE1  00        BRK
  $9FE2  00        BRK
  $9FE3  00        BRK
  $9FE4  00        BRK
  $9FE5  00        BRK
  $9FE6  00        BRK
  $9FE7  00        BRK
  $9FE8  00        BRK
  $9FE9  00        BRK
  $9FEA  00        BRK
  $9FEB  00        BRK
  $9FEC  00        BRK
  $9FED  00        BRK
  $9FEE  00        BRK
  $9FEF  00        BRK
  $9FF0  00        BRK
  $9FF1  00        BRK
  $9FF2  00        BRK
  $9FF3  00        BRK
  $9FF4  00        BRK
  $9FF5  00        BRK
  $9FF6  00        BRK
  $9FF7  00        BRK
  $9FF8  00        BRK
  $9FF9  00        BRK
  $9FFA  00        BRK
  $9FFB  00        BRK
  $9FFC  00        BRK
  $9FFD  00        BRK
  $9FFE  00        BRK
  $9FFF  00        BRK
  $A000  00        BRK
  $A001  00        BRK
  $A002  00        BRK
  $A003  00        BRK
  $A004  00        BRK
  $A005  00        BRK
  $A006  00        BRK
  $A007  00        BRK
  $A008  00        BRK
  $A009  00        BRK
  $A00A  00        BRK
  $A00B  00        BRK
  $A00C  00        BRK
  $A00D  00        BRK
  $A00E  00        BRK
  $A00F  00        BRK
  $A010  00        BRK
  $A011  00        BRK
  $A012  00        BRK
  $A013  00        BRK
  $A014  00        BRK
  $A015  00        BRK
  $A016  00        BRK
  $A017  00        BRK
  $A018  00        BRK
  $A019  00        BRK
  $A01A  00        BRK
  $A01B  00        BRK
  $A01C  00        BRK
  $A01D  00        BRK
  $A01E  00        BRK
  $A01F  00        BRK
  $A020  00        BRK
  $A021  00        BRK
  $A022  00        BRK
  $A023  00        BRK
  $A024  00        BRK
  $A025  00        BRK
  $A026  00        BRK
  $A027  00        BRK
  $A028  00        BRK
  $A029  00        BRK
  $A02A  00        BRK
  $A02B  00        BRK
  $A02C  00        BRK
  $A02D  00        BRK
  $A02E  00        BRK
  $A02F  00        BRK
  $A030  00        BRK
  $A031  00        BRK
  $A032  00        BRK
  $A033  00        BRK
  $A034  00        BRK
  $A035  00        BRK
  $A036  00        BRK
  $A037  00        BRK
  $A038  00        BRK
  $A039  00        BRK
  $A03A  00        BRK
  $A03B  00        BRK
  $A03C  00        BRK
  $A03D  00        BRK
  $A03E  00        BRK
  $A03F  00        BRK
  $A040  40        RTI
  $A041  44        .db $44
  $A042  40        RTI
  $A043  40        RTI
  $A044  40        RTI
  $A045  44        .db $44
  $A046  44        .db $44
  $A047  40        RTI
  $A048  33        .db $33
  $A049  37        .db $37
  $A04A  33        .db $33
  $A04B  33        .db $33
  $A04C  33        .db $33
  $A04D  37        .db $37
  $A04E  37        .db $37
  $A04F  33        .db $33
  $A050  40        RTI
  $A051  40        RTI
  $A052  44        .db $44
  $A053  40        RTI
  $A054  40        RTI
  $A055  44        .db $44
  $A056  40        RTI
  $A057  40        RTI
  $A058  33        .db $33
  $A059  33        .db $33
  $A05A  37        .db $37
  $A05B  33        .db $33
  $A05C  33        .db $33
  $A05D  37        .db $37
  $A05E  33        .db $33
  $A05F  33        .db $33
  $A060  4A        LSR
  $A061  0A        ASL
  $A062  0E 4C 08  ASL $084C
  $A065  0E 4E 4C  ASL $4C4E
  $A068  70 34     BVS $A09E
  $A06A  30 70     BMI $A0DC
  $A06C  32        .db $32
  $A06D  30 70     BMI $A0DF
  $A06F  70 0A     BVS $A07B
  $A071  0A        ASL
  $A072  4E 0C 0A  LSR $0A0C
  $A075  4A        LSR
  $A076  0E 4E 30  ASL $304E
  $A079  34        .db $34
  $A07A  70 30     BVS $A0AC
  $A07C  30 74     BMI $A0F2
  $A07E  30 70     BMI $A0F0
  $A080  FF        .db $FF
  $A081  00        BRK
  $A082  00        BRK
  $A083  00        BRK
  $A084  00        BRK
  $A085  FF        .db $FF
  $A086  00        BRK
  $A087  00        BRK
  $A088  FF        .db $FF
  $A089  00        BRK
  $A08A  00        BRK
  $A08B  00        BRK
  $A08C  00        BRK
  $A08D  FF        .db $FF
  $A08E  00        BRK
  $A08F  00        BRK
  $A090  00        BRK
  $A091  FF        .db $FF
  $A092  00        BRK
  $A093  00        BRK
  $A094  FF        .db $FF
  $A095  00        BRK
  $A096  FF        .db $FF
  $A097  FF        .db $FF
  $A098  00        BRK
  $A099  FF        .db $FF
  $A09A  00        BRK
  $A09B  00        BRK
  $A09C  FF        .db $FF
  $A09D  00        BRK

L_A09E:
  $A09E  FF        .db $FF
  $A09F  FF        .db $FF
  $A0A0  FF        .db $FF
  $A0A1  00        BRK
  $A0A2  00        BRK
  $A0A3  00        BRK
  $A0A4  00        BRK
  $A0A5  FF        .db $FF
  $A0A6  00        BRK
  $A0A7  00        BRK
  $A0A8  FF        .db $FF
  $A0A9  00        BRK
  $A0AA  00        BRK
  $A0AB  00        BRK

L_A0AC:
  $A0AC  00        BRK
  $A0AD  FF        .db $FF
  $A0AE  00        BRK
  $A0AF  00        BRK
  $A0B0  00        BRK
  $A0B1  FF        .db $FF
  $A0B2  00        BRK
  $A0B3  00        BRK
  $A0B4  FF        .db $FF
  $A0B5  00        BRK
  $A0B6  FF        .db $FF
  $A0B7  FF        .db $FF
  $A0B8  00        BRK
  $A0B9  FF        .db $FF
  $A0BA  00        BRK
  $A0BB  00        BRK
  $A0BC  FF        .db $FF
  $A0BD  00        BRK
  $A0BE  FF        .db $FF
  $A0BF  FF        .db $FF
  $A0C0  00        BRK
  $A0C1  FF        .db $FF
  $A0C2  FF        .db $FF
  $A0C3  FF        .db $FF
  $A0C4  00        BRK
  $A0C5  FF        .db $FF
  $A0C6  FF        .db $FF
  $A0C7  FF        .db $FF
  $A0C8  00        BRK
  $A0C9  FF        .db $FF
  $A0CA  FF        .db $FF
  $A0CB  FF        .db $FF
  $A0CC  00        BRK
  $A0CD  FF        .db $FF
  $A0CE  FF        .db $FF
  $A0CF  FF        .db $FF
  $A0D0  FF        .db $FF
  $A0D1  FF        .db $FF
  $A0D2  FF        .db $FF
  $A0D3  FF        .db $FF
  $A0D4  FF        .db $FF
  $A0D5  FF        .db $FF
  $A0D6  FF        .db $FF
  $A0D7  00        BRK
  $A0D8  FF        .db $FF
  $A0D9  FF        .db $FF
  $A0DA  FF        .db $FF
  $A0DB  FF        .db $FF

L_A0DC:
  $A0DC  FF        .db $FF
  $A0DD  FF        .db $FF
  $A0DE  FF        .db $FF

L_A0DF:
  $A0DF  FF        .db $FF
  $A0E0  00        BRK
  $A0E1  FF        .db $FF
  $A0E2  FF        .db $FF
  $A0E3  FF        .db $FF
  $A0E4  00        BRK
  $A0E5  FF        .db $FF
  $A0E6  FF        .db $FF
  $A0E7  FF        .db $FF
  $A0E8  00        BRK
  $A0E9  FF        .db $FF
  $A0EA  FF        .db $FF
  $A0EB  FF        .db $FF
  $A0EC  00        BRK
  $A0ED  FF        .db $FF
  $A0EE  FF        .db $FF
  $A0EF  FF        .db $FF

L_A0F0:
  $A0F0  FF        .db $FF
  $A0F1  FF        .db $FF

L_A0F2:
  $A0F2  FF        .db $FF
  $A0F3  FF        .db $FF
  $A0F4  FF        .db $FF
  $A0F5  FF        .db $FF
  $A0F6  FF        .db $FF
  $A0F7  00        BRK
  $A0F8  FF        .db $FF
  $A0F9  FF        .db $FF
  $A0FA  FF        .db $FF
  $A0FB  FF        .db $FF
  $A0FC  FF        .db $FF
  $A0FD  FF        .db $FF
  $A0FE  FF        .db $FF
  $A0FF  FF        .db $FF
  $A100  00        BRK
  $A101  FF        .db $FF
  $A102  FF        .db $FF
  $A103  FF        .db $FF
  $A104  00        BRK
  $A105  FF        .db $FF
  $A106  FF        .db $FF
  $A107  FF        .db $FF
  $A108  00        BRK
  $A109  FF        .db $FF
  $A10A  FF        .db $FF
  $A10B  FF        .db $FF
  $A10C  00        BRK
  $A10D  FF        .db $FF
  $A10E  FF        .db $FF
  $A10F  FF        .db $FF
  $A110  FF        .db $FF
  $A111  FF        .db $FF
  $A112  FF        .db $FF
  $A113  FF        .db $FF
  $A114  FE F9 E7  INC $E7F9,X
  $A117  9F        .db $9F
  $A118  FF        .db $FF
  $A119  FF        .db $FF
  $A11A  FF        .db $FF
  $A11B  FF        .db $FF
  $A11C  FE F9 E7  INC $E7F9,X
  $A11F  9F        .db $9F
  $A120  00        BRK
  $A121  FF        .db $FF
  $A122  FF        .db $FF
  $A123  FF        .db $FF
  $A124  00        BRK
  $A125  FF        .db $FF
  $A126  FF        .db $FF
  $A127  FF        .db $FF
  $A128  00        BRK
  $A129  FF        .db $FF
  $A12A  FF        .db $FF
  $A12B  FF        .db $FF
  $A12C  00        BRK
  $A12D  FF        .db $FF
  $A12E  FF        .db $FF
  $A12F  FF        .db $FF
  $A130  FF        .db $FF
  $A131  FF        .db $FF
  $A132  FE 08 63  INC $6308,X
  $A135  F1 FC     SBC ($FC),Y
  $A137  FF        .db $FF
  $A138  FF        .db $FF
  $A139  FF        .db $FF
  $A13A  FE 08 63  INC $6308,X
  $A13D  F1 FC     SBC ($FC),Y
  $A13F  FF        .db $FF
  $A140  00        BRK
  $A141  FF        .db $FF
  $A142  FF        .db $FF
  $A143  FF        .db $FF
  $A144  00        BRK
  $A145  FF        .db $FF
  $A146  FF        .db $FF
  $A147  FF        .db $FF
  $A148  00        BRK
  $A149  FF        .db $FF
  $A14A  FF        .db $FF
  $A14B  FF        .db $FF
  $A14C  00        BRK
  $A14D  FF        .db $FF
  $A14E  FF        .db $FF
  $A14F  FF        .db $FF
  $A150  FF        .db $FF
  $A151  C7        .db $C7
  $A152  39 FE FF  AND $FFFE,Y
  $A155  FF        .db $FF
  $A156  FF        .db $FF
  $A157  7F        .db $7F
  $A158  FF        .db $FF
  $A159  C7        .db $C7
  $A15A  39 FE FF  AND $FFFE,Y
  $A15D  FF        .db $FF
  $A15E  FF        .db $FF
  $A15F  7F        .db $7F
  $A160  00        BRK
  $A161  FF        .db $FF
  $A162  FF        .db $FF
  $A163  FF        .db $FF
  $A164  00        BRK
  $A165  FF        .db $FF
  $A166  FF        .db $FF
  $A167  FF        .db $FF
  $A168  00        BRK
  $A169  FF        .db $FF
  $A16A  FF        .db $FF
  $A16B  FF        .db $FF
  $A16C  00        BRK
  $A16D  FF        .db $FF
  $A16E  FF        .db $FF
  $A16F  FF        .db $FF
  $A170  FF        .db $FF
  $A171  FF        .db $FF
  $A172  FF        .db $FF
  $A173  FF        .db $FF
  $A174  3F        .db $3F
  $A175  CF        .db $CF
  $A176  F7        .db $F7
  $A177  F9 FF FF  SBC $FFFF,Y
  $A17A  FF        .db $FF
  $A17B  FF        .db $FF
  $A17C  3F        .db $3F
  $A17D  CF        .db $CF
  $A17E  F7        .db $F7
  $A17F  F9 7F 9F  SBC $9F7F,Y
  $A182  E4 F9     CPX $F9
  $A184  B6 FB     LDX $FB,Y
  $A186  9D CA 7F  STA $7FCA,X
  $A189  9F        .db $9F
  $A18A  E7        .db $E7
  $A18B  F9 B6 FB  SBC $FBB6,Y
  $A18E  9D CA 4C  STA $4CCA,X
  $A191  44        .db $44
  $A192  22        .db $22
  $A193  01 10     ORA ($10,X)
  $A195  01 07     ORA ($07,X)
  $A197  3C        .db $3C
  $A198  4C 44 22  JMP $2244
  $A19B  01 10     ORA ($10,X)
  $A19D  01 07     ORA ($07,X)
  $A19F  3C        .db $3C
  $A1A0  FF        .db $FF
  $A1A1  FF        .db $FF
  $A1A2  00        BRK
  $A1A3  FF        .db $FF
  $A1A4  40        RTI
  $A1A5  90 64     BCC $A20B
  $A1A7  29 FF     AND #$FF
  $A1A9  FF        .db $FF
  $A1AA  FF        .db $FF
  $A1AB  FF        .db $FF
  $A1AC  7F        .db $7F
  $A1AD  9F        .db $9F
  $A1AE  67        .db $67
  $A1AF  29 86     AND #$86
  $A1B1  60        RTS
  $A1B2  03        .db $03
  $A1B3  0D 73 E4  ORA $E473
  $A1B6  09 10     ORA #$10
  $A1B8  86 60     STX $60
  $A1BA  03        .db $03
  $A1BB  0D 73 E4  ORA $E473
  $A1BE  09 10     ORA #$10
  $A1C0  FF        .db $FF
  $A1C1  FF        .db $FF
  $A1C2  00        BRK
  $A1C3  FF        .db $FF
  $A1C4  02        .db $02
  $A1C5  09 27     ORA #$27
  $A1C7  9F        .db $9F
  $A1C8  FF        .db $FF
  $A1C9  FF        .db $FF
  $A1CA  FF        .db $FF
  $A1CB  FF        .db $FF
  $A1CC  FE F9 E7  INC $E7F9,X
  $A1CF  9F        .db $9F
  $A1D0  7F        .db $7F
  $A1D1  F4        .db $F4
  $A1D2  CF        .db $CF
  $A1D3  9D 24 48  STA $4824,X
  $A1D6  12        .db $12
  $A1D7  00        BRK
  $A1D8  7F        .db $7F
  $A1D9  F4        .db $F4
  $A1DA  CF        .db $CF
  $A1DB  9D 24 48  STA $4824,X
  $A1DE  12        .db $12
  $A1DF  00        BRK
  $A1E0  FE F9 27  INC $27F9,X
  $A1E3  9F        .db $9F
  $A1E4  7F        .db $7F
  $A1E5  FD FB BF  SBC $BFFB,X
  $A1E8  FE F9 E7  INC $E7F9,X
  $A1EB  9F        .db $9F
  $A1EC  7F        .db $7F
  $A1ED  FD FB BF  SBC $BFFB,X
  $A1F0  77        .db $77
  $A1F1  CC A9 3B  CPY $3BA9
  $A1F4  62        .db $62
  $A1F5  84 08     STY $08
  $A1F7  00        BRK
  $A1F8  77        .db $77
  $A1F9  CC A9 3B  CPY $3BA9
  $A1FC  62        .db $62
  $A1FD  84 08     STY $08
  $A1FF  00        BRK
  $A200  7F        .db $7F
  $A201  B7        .db $B7
  $A202  FF        .db $FF
  $A203  EF        .db $EF
  $A204  EF        .db $EF
  $A205  DA        .db $DA
  $A206  D7        .db $D7
  $A207  B5 7F     LDA $7F,X
  $A209  B7        .db $B7
  $A20A  FF        .db $FF

L_A20B:
  $A20B  EF        .db $EF
  $A20C  EF        .db $EF
  $A20D  DA        .db $DA
  $A20E  D7        .db $D7
  $A20F  B5 2D     LDA $2D,X
  $A211  AA        TAX
  $A212  59 10 33  EOR $3310,Y
  $A215  21 44     AND ($44,X)
  $A217  08        PHP
  $A218  2D AA 59  AND $59AA
  $A21B  10 33     BPL $A250
  $A21D  21 44     AND ($44,X)
  $A21F  08        PHP
  $A220  FE FF 7F  INC $7FFF,X
  $A223  FF        .db $FF
  $A224  FF        .db $FF
  $A225  FB        .db $FB
  $A226  6D 55 FE  ADC $FE55
  $A229  FF        .db $FF
  $A22A  7F        .db $7F
  $A22B  FF        .db $FF
  $A22C  FF        .db $FF
  $A22D  FB        .db $FB
  $A22E  6D 55 3F  ADC $3F55
  $A231  AE DB 8B  LDX $8BDB
  $A234  12        .db $12
  $A235  24 44     BIT $44
  $A237  08        PHP
  $A238  3F        .db $3F
  $A239  AE DB 8B  LDX $8BDB
  $A23C  12        .db $12
  $A23D  24 44     BIT $44
  $A23F  08        PHP
  $A240  00        BRK
  $A241  04        .db $04
  $A242  00        BRK
  $A243  04        .db $04
  $A244  04        .db $04
  $A245  04        .db $04
  $A246  00        BRK
  $A247  3F        .db $3F
  $A248  00        BRK
  $A249  04        .db $04
  $A24A  00        BRK
  $A24B  00        BRK
  $A24C  00        BRK
  $A24D  00        BRK
  $A24E  00        BRK
  $A24F  00        BRK

L_A250:
  $A250  21 3F     AND ($3F,X)
  $A252  41 7F     EOR ($7F,X)
  $A254  41 7F     EOR ($7F,X)
  $A256  41 7F     EOR ($7F,X)
  $A258  0C        .db $0C
  $A259  00        BRK
  $A25A  18        CLC
  $A25B  00        BRK
  $A25C  0C        .db $0C
  $A25D  00        BRK
  $A25E  18        CLC
  $A25F  00        BRK
  $A260  00        BRK
  $A261  49 7F     EOR #$7F
  $A263  41 7F     EOR ($7F,X)
  $A265  40        RTI
  $A266  7F        .db $7F
  $A267  40        RTI
  $A268  00        BRK
  $A269  00        BRK
  $A26A  00        BRK
  $A26B  00        BRK
  $A26C  00        BRK
  $A26D  00        BRK
  $A26E  00        BRK
  $A26F  00        BRK
  $A270  70 47     BVS $A2B9
  $A272  72        .db $72
  $A273  47        .db $47
  $A274  72        .db $72
  $A275  47        .db $47
  $A276  72        .db $72
  $A277  07        .db $07
  $A278  00        BRK
  $A279  00        BRK
  $A27A  02        .db $02
  $A27B  00        BRK
  $A27C  02        .db $02
  $A27D  00        BRK
  $A27E  02        .db $02
  $A27F  00        BRK
  $A280  80        .db $80
  $A281  20 00 3E  JSR $3E00
  $A284  22        .db $22
  $A285  3E 20 3C  ROL $3C20,X
  $A288  04        .db $04
  $A289  00        BRK
  $A28A  00        BRK
  $A28B  00        BRK
  $A28C  1C        .db $1C
  $A28D  00        BRK
  $A28E  1C        .db $1C
  $A28F  00        BRK
  $A290  23        .db $23
  $A291  3A        .db $3A
  $A292  23        .db $23
  $A293  3A        .db $3A
  $A294  23        .db $23
  $A295  3A        .db $3A
  $A296  03        .db $03
  $A297  00        BRK
  $A298  18        CLC
  $A299  01 18     ORA ($18,X)
  $A29B  01 18     ORA ($18,X)
  $A29D  01 00     ORA ($00,X)
  $A29F  00        BRK
  $A2A0  21 00     AND ($00,X)
  $A2A2  7E 52 7E  ROR $7E52,X
  $A2A5  52        .db $52
  $A2A6  7E 02 00  ROR $0002,X
  $A2A9  00        BRK
  $A2AA  00        BRK
  $A2AB  10 00     BPL $A2AD

L_A2AD:
  $A2AD  10 00     BPL $A2AF

L_A2AF:
  $A2AF  00        BRK
  $A2B0  DE 42 DE  DEC $DE42,X
  $A2B3  42        .db $42
  $A2B4  DE 42 DC  DEC $DC42,X
  $A2B7  10 00     BPL $A2B9

L_A2B9:
  $A2B9  00        BRK
  $A2BA  00        BRK
  $A2BB  00        BRK
  $A2BC  00        BRK
  $A2BD  00        BRK
  $A2BE  00        BRK
  $A2BF  00        BRK
  $A2C0  00        BRK
  $A2C1  00        BRK
  $A2C2  00        BRK
  $A2C3  00        BRK
  $A2C4  00        BRK
  $A2C5  0C        .db $0C
  $A2C6  00        BRK
  $A2C7  0C        .db $0C
  $A2C8  00        BRK
  $A2C9  00        BRK
  $A2CA  00        BRK
  $A2CB  0C        .db $0C
  $A2CC  00        BRK
  $A2CD  00        BRK
  $A2CE  00        BRK
  $A2CF  00        BRK
  $A2D0  00        BRK
  $A2D1  0C        .db $0C
  $A2D2  60        RTS
  $A2D3  6C 60 6C  JMP ($6C60)
  $A2D6  40        RTI
  $A2D7  00        BRK
  $A2D8  60        RTS
  $A2D9  00        BRK
  $A2DA  00        BRK
  $A2DB  00        BRK
  $A2DC  00        BRK
  $A2DD  00        BRK
  $A2DE  00        BRK
  $A2DF  00        BRK
  $A2E0  00        BRK
  $A2E1  00        BRK
  $A2E2  C0 C0     CPY #$C0
  $A2E4  40        RTI
  $A2E5  C0 40     CPY #$40
  $A2E7  C0 C0     CPY #$C0
  $A2E9  00        BRK
  $A2EA  00        BRK
  $A2EB  00        BRK
  $A2EC  80        .db $80
  $A2ED  00        BRK
  $A2EE  80        .db $80
  $A2EF  0C        .db $0C
  $A2F0  40        RTI
  $A2F1  CC 4C CC  CPY $CC4C
  $A2F4  CC CC CC  CPY $CCCC
  $A2F7  88        DEY
  $A2F8  80        .db $80
  $A2F9  00        BRK
  $A2FA  80        .db $80
  $A2FB  00        BRK
  $A2FC  00        BRK
  $A2FD  00        BRK
  $A2FE  00        BRK
  $A2FF  00        BRK
  $A300  00        BRK
  $A301  00        BRK
  $A302  7F        .db $7F
  $A303  FF        .db $FF
  $A304  83        .db $83
  $A305  81 A3     STA ($A3,X)
  $A307  81 00     STA ($00,X)
  $A309  00        BRK
  $A30A  00        BRK
  $A30B  00        BRK
  $A30C  7C        .db $7C
  $A30D  00        BRK
  $A30E  7C        .db $7C
  $A30F  00        BRK
  $A310  8B        .db $8B
  $A311  81 83     STA ($83,X)
  $A313  81 93     STA ($93,X)
  $A315  81 83     STA ($83,X)
  $A317  81 7C     STA ($7C,X)
  $A319  00        BRK
  $A31A  7C        .db $7C
  $A31B  00        BRK
  $A31C  7C        .db $7C
  $A31D  00        BRK
  $A31E  7C        .db $7C
  $A31F  00        BRK
  $A320  00        BRK
  $A321  00        BRK
  $A322  80        .db $80
  $A323  80        .db $80
  $A324  88        DEY
  $A325  80        .db $80
  $A326  80        .db $80
  $A327  80        .db $80
  $A328  00        BRK
  $A329  00        BRK
  $A32A  00        BRK
  $A32B  00        BRK
  $A32C  08        PHP
  $A32D  00        BRK
  $A32E  08        PHP
  $A32F  00        BRK
  $A330  80        .db $80
  $A331  80        .db $80
  $A332  80        .db $80
  $A333  80        .db $80
  $A334  94 94     STY $94,X
  $A336  94 80     STY $80,X
  $A338  08        PHP
  $A339  00        BRK
  $A33A  08        PHP
  $A33B  00        BRK
  $A33C  08        PHP
  $A33D  08        PHP
  $A33E  08        PHP
  $A33F  00        BRK
  $A340  A3        .db $A3
  $A341  81 8B     STA ($8B,X)
  $A343  81 83     STA ($83,X)
  $A345  81 8B     STA ($8B,X)
  $A347  81 7C     STA ($7C,X)
  $A349  00        BRK
  $A34A  7C        .db $7C
  $A34B  00        BRK
  $A34C  7C        .db $7C
  $A34D  00        BRK
  $A34E  7C        .db $7C
  $A34F  00        BRK
  $A350  C3        .db $C3
  $A351  81 83     STA ($83,X)
  $A353  81 83     STA ($83,X)
  $A355  81 93     STA ($93,X)
  $A357  81 7C     STA ($7C,X)
  $A359  00        BRK
  $A35A  7C        .db $7C
  $A35B  00        BRK
  $A35C  7C        .db $7C
  $A35D  00        BRK
  $A35E  7C        .db $7C
  $A35F  00        BRK
  $A360  94 80     STY $80,X
  $A362  94 80     STY $80,X
  $A364  94 80     STY $80,X
  $A366  94 94     STY $94,X
  $A368  08        PHP
  $A369  00        BRK
  $A36A  08        PHP
  $A36B  00        BRK
  $A36C  08        PHP
  $A36D  00        BRK
  $A36E  08        PHP
  $A36F  08        PHP
  $A370  94 94     STY $94,X
  $A372  94 94     STY $94,X
  $A374  94 94     STY $94,X
  $A376  94 80     STY $80,X
  $A378  08        PHP
  $A379  08        PHP
  $A37A  08        PHP
  $A37B  08        PHP
  $A37C  08        PHP
  $A37D  08        PHP
  $A37E  08        PHP
  $A37F  00        BRK
  $A380  3F        .db $3F
  $A381  7F        .db $7F
  $A382  C8        INY
  $A383  80        .db $80
  $A384  80        .db $80
  $A385  FF        .db $FF
  $A386  80        .db $80
  $A387  80        .db $80
  $A388  00        BRK
  $A389  00        BRK
  $A38A  7F        .db $7F
  $A38B  7F        .db $7F
  $A38C  7F        .db $7F
  $A38D  00        BRK
  $A38E  00        BRK
  $A38F  7F        .db $7F
  $A390  80        .db $80
  $A391  A2 FF     LDX #$FF
  $A393  80        .db $80
  $A394  80        .db $80
  $A395  80        .db $80
  $A396  8F        .db $8F
  $A397  9F        .db $9F
  $A398  00        BRK
  $A399  7F        .db $7F
  $A39A  00        BRK
  $A39B  00        BRK

L_A39C:
  $A39C  7F        .db $7F
  $A39D  00        BRK
  $A39E  60        RTS
  $A39F  00        BRK
  $A3A0  FC        .db $FC
  $A3A1  FC        .db $FC
  $A3A2  9C        .db $9C
  $A3A3  0C        .db $0C
  $A3A4  0C        .db $0C
  $A3A5  FC        .db $FC
  $A3A6  0C        .db $0C
  $A3A7  0C        .db $0C
  $A3A8  00        BRK
  $A3A9  00        BRK
  $A3AA  F0 F0     BEQ $A39C
  $A3AC  F0 00     BEQ $A3AE

L_A3AE:
  $A3AE  00        BRK
  $A3AF  F0 0C     BEQ $A3BD
  $A3B1  2C FC 0C  BIT $0CFC
  $A3B4  0C        .db $0C
  $A3B5  0C        .db $0C
  $A3B6  0C        .db $0C
  $A3B7  0C        .db $0C
  $A3B8  00        BRK
  $A3B9  F0 00     BEQ $A3BB

L_A3BB:
  $A3BB  00        BRK
  $A3BC  F0 00     BEQ $A3BE

L_A3BE:
  $A3BE  70 00     BVS $A3C0

L_A3C0:
  $A3C0  DF        .db $DF
  $A3C1  C3        .db $C3
  $A3C2  93        .db $93
  $A3C3  93        .db $93
  $A3C4  93        .db $93
  $A3C5  83        .db $83
  $A3C6  9B        .db $9B
  $A3C7  C3        .db $C3
  $A3C8  4C 00 0C  JMP $0C00
  $A3CB  4C 0C 40  JMP $400C
  $A3CE  0C        .db $0C
  $A3CF  40        RTI
  $A3D0  D3        .db $D3
  $A3D1  83        .db $83
  $A3D2  9B        .db $9B
  $A3D3  93        .db $93
  $A3D4  D3        .db $D3
  $A3D5  93        .db $93
  $A3D6  83        .db $83
  $A3D7  D3        .db $D3
  $A3D8  0C        .db $0C
  $A3D9  00        BRK
  $A3DA  4C 0C 4C  JMP $4C0C
  $A3DD  0C        .db $0C
  $A3DE  40        RTI
  $A3DF  0C        .db $0C
  $A3E0  1C        .db $1C
  $A3E1  7C        .db $7C
  $A3E2  0C        .db $0C
  $A3E3  0C        .db $0C
  $A3E4  0C        .db $0C
  $A3E5  0C        .db $0C
  $A3E6  0C        .db $0C
  $A3E7  1C        .db $1C
  $A3E8  70 00     BVS $A3EA

L_A3EA:
  $A3EA  00        BRK
  $A3EB  70 00     BVS $A3ED

L_A3ED:
  $A3ED  70 00     BVS $A3EF

L_A3EF:
  $A3EF  70 7C     BVS $A46D
  $A3F1  0C        .db $0C
  $A3F2  0C        .db $0C
  $A3F3  0C        .db $0C
  $A3F4  1C        .db $1C
  $A3F5  0C        .db $0C
  $A3F6  0C        .db $0C
  $A3F7  7C        .db $7C
  $A3F8  00        BRK
  $A3F9  00        BRK
  $A3FA  70 00     BVS $A3FC

L_A3FC:
  $A3FC  70 00     BVS $A3FE

L_A3FE:
  $A3FE  70 00     BVS $A400

L_A400:
  $A400  08        PHP
  $A401  01 44     ORA ($44,X)
  $A403  00        BRK
  $A404  23        .db $23
  $A405  0F        .db $0F
  $A406  3F        .db $3F
  $A407  FF        .db $FF
  $A408  00        BRK
  $A409  00        BRK
  $A40A  10 00     BPL $A40C

L_A40C:
  $A40C  80        .db $80
  $A40D  00        BRK
  $A40E  00        BRK
  $A40F  00        BRK
  $A410  E0 80     CPX #$80
  $A412  FF        .db $FF
  $A413  00        BRK
  $A414  24 FF     BIT $FF
  $A416  80        .db $80
  $A417  FF        .db $FF
  $A418  7F        .db $7F
  $A419  7F        .db $7F
  $A41A  00        BRK
  $A41B  00        BRK
  $A41C  04        .db $04
  $A41D  00        BRK
  $A41E  7F        .db $7F
  $A41F  00        BRK
  $A420  40        RTI
  $A421  04        .db $04
  $A422  01 00     ORA ($00,X)
  $A424  FF        .db $FF
  $A425  FF        .db $FF
  $A426  FF        .db $FF
  $A427  FF        .db $FF
  $A428  01 00     ORA ($00,X)
  $A42A  20 00 00  JSR $0000
  $A42D  00        BRK
  $A42E  00        BRK
  $A42F  00        BRK

L_A430:
  $A430  00        BRK
  $A431  00        BRK
  $A432  FF        .db $FF
  $A433  00        BRK
  $A434  59 FF 00  EOR $00FF,Y
  $A437  FF        .db $FF
  $A438  FF        .db $FF
  $A439  FF        .db $FF
  $A43A  00        BRK

L_A43B:
  $A43B  00        BRK
  $A43C  41 00     EOR ($00,X)
  $A43E  FF        .db $FF
  $A43F  00        BRK
  $A440  20 02 00  JSR $0002
  $A443  00        BRK
  $A444  FF        .db $FF
  $A445  FF        .db $FF
  $A446  FF        .db $FF
  $A447  FF        .db $FF
  $A448  00        BRK
  $A449  00        BRK
  $A44A  20 00 00  JSR $0000
  $A44D  00        BRK
  $A44E  00        BRK
  $A44F  00        BRK
  $A450  06 01     ASL $01
  $A452  FF        .db $FF
  $A453  00        BRK
  $A454  44        .db $44
  $A455  FF        .db $FF
  $A456  01 FF     ORA ($FF,X)
  $A458  FF        .db $FF
  $A459  FE 00 00  INC $0000,X
  $A45C  40        RTI
  $A45D  00        BRK
  $A45E  FE 00 10  INC $1000,X
  $A461  04        .db $04
  $A462  00        BRK
  $A463  00        BRK
  $A464  FC        .db $FC
  $A465  F0 C4     BEQ $A42B
  $A467  14        .db $14
  $A468  00        BRK
  $A469  00        BRK
  $A46A  40        RTI
  $A46B  00        BRK
  $A46C  00        BRK

L_A46D:
  $A46D  0C        .db $0C
  $A46E  30 C0     BMI $A430
  $A470  54        .db $54
  $A471  54        .db $54
  $A472  54        .db $54
  $A473  54        .db $54
  $A474  5C        .db $5C
  $A475  70 C4     BVS $A43B
  $A477  14        .db $14
  $A478  00        BRK
  $A479  00        BRK
  $A47A  00        BRK
  $A47B  00        BRK
  $A47C  00        BRK
  $A47D  00        BRK
  $A47E  00        BRK
  $A47F  00        BRK
  $A480  00        BRK
  $A481  21 FF     AND ($FF,X)
  $A483  80        .db $80
  $A484  FF        .db $FF
  $A485  00        BRK
  $A486  24 FF     BIT $FF
  $A488  00        BRK
  $A489  01 00     ORA ($00,X)
  $A48B  7F        .db $7F
  $A48C  00        BRK
  $A48D  00        BRK
  $A48E  04        .db $04
  $A48F  00        BRK
  $A490  80        .db $80
  $A491  FF        .db $FF
  $A492  00        BRK
  $A493  24 FF     BIT $FF
  $A495  80        .db $80
  $A496  FF        .db $FF
  $A497  FF        .db $FF
  $A498  7F        .db $7F
  $A499  00        BRK
  $A49A  00        BRK
  $A49B  04        .db $04
  $A49C  00        BRK
  $A49D  7F        .db $7F
  $A49E  00        BRK
  $A49F  00        BRK
  $A4A0  00        BRK
  $A4A1  58        CLI
  $A4A2  FF        .db $FF
  $A4A3  00        BRK
  $A4A4  FF        .db $FF
  $A4A5  00        BRK
  $A4A6  59 FF 00  EOR $00FF,Y
  $A4A9  40        RTI
  $A4AA  00        BRK
  $A4AB  FF        .db $FF
  $A4AC  00        BRK
  $A4AD  00        BRK
  $A4AE  41 00     EOR ($00,X)
  $A4B0  00        BRK
  $A4B1  FF        .db $FF
  $A4B2  00        BRK
  $A4B3  59 FF 00  EOR $00FF,Y
  $A4B6  FF        .db $FF
  $A4B7  FF        .db $FF
  $A4B8  FF        .db $FF
  $A4B9  00        BRK
  $A4BA  00        BRK
  $A4BB  41 00     EOR ($00,X)
  $A4BD  FF        .db $FF
  $A4BE  00        BRK
  $A4BF  00        BRK
  $A4C0  00        BRK
  $A4C1  3F        .db $3F
  $A4C2  7F        .db $7F
  $A4C3  40        RTI
  $A4C4  40        RTI
  $A4C5  40        RTI
  $A4C6  40        RTI
  $A4C7  44        .db $44
  $A4C8  00        BRK
  $A4C9  00        BRK
  $A4CA  40        RTI
  $A4CB  3F        .db $3F
  $A4CC  3F        .db $3F
  $A4CD  33        .db $33
  $A4CE  33        .db $33
  $A4CF  37        .db $37
  $A4D0  40        RTI
  $A4D1  40        RTI
  $A4D2  44        .db $44
  $A4D3  44        .db $44
  $A4D4  40        RTI
  $A4D5  40        RTI
  $A4D6  44        .db $44
  $A4D7  40        RTI
  $A4D8  33        .db $33
  $A4D9  33        .db $33
  $A4DA  37        .db $37
  $A4DB  37        .db $37
  $A4DC  33        .db $33

L_A4DD:
  $A4DD  33        .db $33
  $A4DE  37        .db $37
  $A4DF  33        .db $33
  $A4E0  00        BRK
  $A4E1  FE FE 0C  INC $0CFE,X
  $A4E4  0A        ASL
  $A4E5  02        .db $02
  $A4E6  0E 0C 00  ASL $000C
  $A4E9  00        BRK
  $A4EA  08        PHP
  $A4EB  F0 F0     BEQ $A4DD
  $A4ED  34        .db $34
  $A4EE  30 30     BMI $A520
  $A4F0  48        PHA
  $A4F1  0E 0E 4C  ASL $4C0E
  $A4F4  0A        ASL
  $A4F5  0A        ASL
  $A4F6  0E 4C 72  ASL $724C
  $A4F9  30 30     BMI $A52B
  $A4FB  70 30     BVS $A52D
  $A4FD  34        .db $34
  $A4FE  30 70     BMI $A570
  $A500  00        BRK
  $A501  54        .db $54
  $A502  FF        .db $FF
  $A503  01 FF     ORA ($FF,X)
  $A505  00        BRK
  $A506  14        .db $14
  $A507  FF        .db $FF
  $A508  00        BRK
  $A509  50 00     BVC $A50B

L_A50B:
  $A50B  FE 00 00  INC $0000,X
  $A50E  10 00     BPL $A510

L_A510:
  $A510  01 FF     ORA ($FF,X)
  $A512  00        BRK
  $A513  44        .db $44
  $A514  FF        .db $FF
  $A515  01 FF     ORA ($FF,X)
  $A517  FF        .db $FF
  $A518  FE 00 00  INC $0000,X
  $A51B  40        RTI
  $A51C  00        BRK
  $A51D  FE 00 00  INC $0000,X

L_A520:
  $A520  54        .db $54
  $A521  5C        .db $5C
  $A522  70 C4     BVS $A4E8
  $A524  14        .db $14
  $A525  54        .db $54
  $A526  5C        .db $5C
  $A527  70 00     BVS $A529

L_A529:
  $A529  00        BRK
  $A52A  00        BRK

L_A52B:
  $A52B  00        BRK
  $A52C  00        BRK

L_A52D:
  $A52D  00        BRK
  $A52E  00        BRK
  $A52F  00        BRK
  $A530  C4 14     CPY $14
  $A532  54        .db $54
  $A533  5C        .db $5C
  $A534  70 C4     BVS $A4FA
  $A536  14        .db $14
  $A537  54        .db $54
  $A538  00        BRK
  $A539  00        BRK
  $A53A  00        BRK
  $A53B  00        BRK
  $A53C  00        BRK
  $A53D  00        BRK
  $A53E  00        BRK
  $A53F  00        BRK
  $A540  00        BRK
  $A541  10 00     BPL $A543

L_A543:
  $A543  02        .db $02
  $A544  00        BRK
  $A545  00        BRK
  $A546  00        BRK
  $A547  00        BRK
  $A548  00        BRK
  $A549  42        .db $42
  $A54A  00        BRK
  $A54B  00        BRK
  $A54C  00        BRK
  $A54D  00        BRK
  $A54E  00        BRK
  $A54F  00        BRK
  $A550  00        BRK
  $A551  00        BRK
  $A552  00        BRK
  $A553  00        BRK
  $A554  00        BRK
  $A555  00        BRK
  $A556  00        BRK
  $A557  00        BRK
  $A558  00        BRK
  $A559  00        BRK
  $A55A  00        BRK
  $A55B  00        BRK
  $A55C  00        BRK
  $A55D  00        BRK
  $A55E  00        BRK
  $A55F  00        BRK
  $A560  02        .db $02
  $A561  00        BRK
  $A562  40        RTI
  $A563  04        .db $04
  $A564  00        BRK
  $A565  00        BRK
  $A566  00        BRK
  $A567  00        BRK
  $A568  00        BRK
  $A569  10 00     BPL $A56B

L_A56B:
  $A56B  00        BRK
  $A56C  00        BRK
  $A56D  00        BRK
  $A56E  00        BRK
  $A56F  00        BRK

L_A570:
  $A570  00        BRK
  $A571  00        BRK
  $A572  00        BRK
  $A573  00        BRK
  $A574  00        BRK
  $A575  00        BRK
  $A576  00        BRK
  $A577  00        BRK
  $A578  00        BRK
  $A579  00        BRK
  $A57A  00        BRK
  $A57B  00        BRK
  $A57C  00        BRK
  $A57D  00        BRK
  $A57E  00        BRK
  $A57F  00        BRK
  $A580  20 21 80  JSR $8021
  $A583  00        BRK
  $A584  00        BRK
  $A585  02        .db $02
  $A586  00        BRK
  $A587  00        BRK
  $A588  88        DEY
  $A589  20 08 00  JSR $0008
  $A58C  20 00 00  JSR $0000
  $A58F  00        BRK
  $A590  00        BRK
  $A591  00        BRK
  $A592  00        BRK
  $A593  00        BRK
  $A594  00        BRK
  $A595  00        BRK
  $A596  00        BRK
  $A597  00        BRK
  $A598  00        BRK
  $A599  00        BRK
  $A59A  00        BRK
  $A59B  00        BRK
  $A59C  00        BRK
  $A59D  00        BRK
  $A59E  00        BRK
  $A59F  00        BRK
  $A5A0  44        .db $44
  $A5A1  00        BRK
  $A5A2  41 00     EOR ($00,X)
  $A5A4  00        BRK
  $A5A5  10 00     BPL $A5A7

L_A5A7:
  $A5A7  00        BRK
  $A5A8  40        RTI
  $A5A9  10 01     BPL $A5AC
  $A5AB  00        BRK

L_A5AC:
  $A5AC  00        BRK
  $A5AD  00        BRK
  $A5AE  00        BRK
  $A5AF  00        BRK
  $A5B0  00        BRK
  $A5B1  00        BRK
  $A5B2  00        BRK
  $A5B3  00        BRK
  $A5B4  00        BRK
  $A5B5  00        BRK
  $A5B6  00        BRK
  $A5B7  00        BRK
  $A5B8  00        BRK
  $A5B9  00        BRK
  $A5BA  00        BRK
  $A5BB  00        BRK
  $A5BC  00        BRK
  $A5BD  00        BRK
  $A5BE  00        BRK
  $A5BF  00        BRK
  $A5C0  20 21 82  JSR $8221
  $A5C3  00        BRK
  $A5C4  00        BRK
  $A5C5  02        .db $02
  $A5C6  00        BRK
  $A5C7  00        BRK
  $A5C8  88        DEY
  $A5C9  20 0A 00  JSR $000A
  $A5CC  20 00 00  JSR $0000
  $A5CF  01 00     ORA ($00,X)
  $A5D1  00        BRK
  $A5D2  02        .db $02
  $A5D3  20 00 10  JSR $1000
  $A5D6  04        .db $04
  $A5D7  40        RTI
  $A5D8  08        PHP
  $A5D9  00        BRK
  $A5DA  00        BRK
  $A5DB  00        BRK
  $A5DC  00        BRK
  $A5DD  00        BRK
  $A5DE  00        BRK
  $A5DF  00        BRK
  $A5E0  44        .db $44
  $A5E1  00        BRK
  $A5E2  41 00     EOR ($00,X)
  $A5E4  04        .db $04
  $A5E5  50 00     BVC $A5E7

L_A5E7:
  $A5E7  10 40     BPL $A629
  $A5E9  10 01     BPL $A5EC
  $A5EB  00        BRK

L_A5EC:
  $A5EC  00        BRK
  $A5ED  00        BRK
  $A5EE  00        BRK
  $A5EF  02        .db $02
  $A5F0  00        BRK
  $A5F1  00        BRK
  $A5F2  00        BRK
  $A5F3  00        BRK
  $A5F4  42        .db $42
  $A5F5  00        BRK

L_A5F6:
  $A5F6  08        PHP
  $A5F7  00        BRK
  $A5F8  00        BRK
  $A5F9  00        BRK
  $A5FA  20 00 00  JSR $0000
  $A5FD  00        BRK
  $A5FE  00        BRK
  $A5FF  00        BRK
  $A600  10 7E     BPL $A680
  $A602  10 1E     BPL $A622
  $A604  35 55     AND $55,X
  $A606  49 3A     EOR #$3A
  $A608  00        BRK
  $A609  00        BRK
  $A60A  00        BRK
  $A60B  00        BRK
  $A60C  00        BRK
  $A60D  00        BRK
  $A60E  00        BRK
  $A60F  00        BRK
  $A610  B5 74     LDA $74,X
  $A612  7F        .db $7F
  $A613  74        .db $74
  $A614  25 F2     AND $F2
  $A616  26 29     ROL $29
  $A618  00        BRK
  $A619  00        BRK
  $A61A  00        BRK
  $A61B  00        BRK
  $A61C  00        BRK
  $A61D  00        BRK
  $A61E  00        BRK
  $A61F  00        BRK
  $A620  10 12     BPL $A634

L_A622:
  $A622  79 15 24  ADC $2415,Y
  $A625  24 44     BIT $44
  $A627  08        PHP
  $A628  00        BRK

L_A629:
  $A629  00        BRK
  $A62A  00        BRK
  $A62B  00        BRK
  $A62C  00        BRK
  $A62D  00        BRK
  $A62E  00        BRK
  $A62F  00        BRK
  $A630  38        SEC
  $A631  00        BRK
  $A632  7E 04 0C  ROR $0C04,X
  $A635  18        CLC
  $A636  29 4E     AND #$4E
  $A638  00        BRK
  $A639  00        BRK
  $A63A  00        BRK
  $A63B  00        BRK
  $A63C  00        BRK
  $A63D  00        BRK
  $A63E  00        BRK
  $A63F  00        BRK
  $A640  00        BRK
  $A641  20 20 20  JSR $2020
  $A644  20 22 22  JSR $2222
  $A647  1C        .db $1C
  $A648  00        BRK
  $A649  00        BRK
  $A64A  00        BRK
  $A64B  00        BRK
  $A64C  00        BRK
  $A64D  00        BRK
  $A64E  00        BRK
  $A64F  00        BRK
  $A650  04        .db $04
  $A651  08        PHP
  $A652  10 20     BPL $A674
  $A654  20 10 08  JSR $0810
  $A657  04        .db $04
  $A658  00        BRK
  $A659  00        BRK
  $A65A  00        BRK
  $A65B  00        BRK
  $A65C  00        BRK
  $A65D  00        BRK
  $A65E  00        BRK
  $A65F  00        BRK
  $A660  10 10     BPL $A672
  $A662  7C        .db $7C
  $A663  20 4E 40  JSR $404E
  $A666  90 8E     BCC $A5F6
  $A668  00        BRK
  $A669  00        BRK
  $A66A  00        BRK
  $A66B  00        BRK
  $A66C  00        BRK
  $A66D  00        BRK
  $A66E  00        BRK
  $A66F  00        BRK
  $A670  10 08     BPL $A67A

L_A672:
  $A672  7F        .db $7F
  $A673  04        .db $04

L_A674:
  $A674  02        .db $02
  $A675  46 40     LSR $40
  $A677  3C        .db $3C
  $A678  00        BRK
  $A679  00        BRK

L_A67A:
  $A67A  00        BRK
  $A67B  00        BRK
  $A67C  00        BRK
  $A67D  00        BRK
  $A67E  00        BRK
  $A67F  00        BRK

L_A680:
  $A680  00        BRK
  $A681  4E 40 40  LSR $4040
  $A684  40        RTI
  $A685  40        RTI
  $A686  48        PHA
  $A687  26 00     ROL $00
  $A689  00        BRK
  $A68A  00        BRK
  $A68B  00        BRK
  $A68C  00        BRK
  $A68D  00        BRK
  $A68E  00        BRK
  $A68F  00        BRK
  $A690  00        BRK
  $A691  7F        .db $7F
  $A692  04        .db $04
  $A693  08        PHP
  $A694  10 10     BPL $A6A6
  $A696  08        PHP
  $A697  06 00     ASL $00
  $A699  00        BRK
  $A69A  00        BRK
  $A69B  00        BRK
  $A69C  00        BRK
  $A69D  00        BRK
  $A69E  00        BRK
  $A69F  00        BRK
  $A6A0  00        BRK
  $A6A1  38        SEC
  $A6A2  54        .db $54
  $A6A3  92        .db $92
  $A6A4  92        .db $92
  $A6A5  92        .db $92

L_A6A6:
  $A6A6  A2 44     LDX #$44
  $A6A8  00        BRK
  $A6A9  00        BRK
  $A6AA  00        BRK
  $A6AB  00        BRK
  $A6AC  00        BRK
  $A6AD  00        BRK
  $A6AE  00        BRK
  $A6AF  00        BRK
  $A6B0  02        .db $02
  $A6B1  4F        .db $4F
  $A6B2  42        .db $42
  $A6B3  42        .db $42
  $A6B4  4E 53 52  LSR $5253
  $A6B7  2C 00 00  BIT $0000
  $A6BA  00        BRK
  $A6BB  00        BRK
  $A6BC  00        BRK
  $A6BD  00        BRK
  $A6BE  00        BRK
  $A6BF  00        BRK
  $A6C0  38        SEC
  $A6C1  48        PHA
  $A6C2  0A        ASL
  $A6C3  0A        ASL
  $A6C4  3F        .db $3F
  $A6C5  4A        LSR
  $A6C6  4A        LSR
  $A6C7  30 00     BMI $A6C9

L_A6C9:
  $A6C9  00        BRK
  $A6CA  00        BRK
  $A6CB  00        BRK
  $A6CC  00        BRK
  $A6CD  00        BRK
  $A6CE  00        BRK
  $A6CF  00        BRK
  $A6D0  00        BRK
  $A6D1  00        BRK
  $A6D2  10 28     BPL $A6FC
  $A6D4  44        .db $44
  $A6D5  02        .db $02
  $A6D6  01 00     ORA ($00,X)
  $A6D8  00        BRK
  $A6D9  00        BRK
  $A6DA  00        BRK
  $A6DB  00        BRK
  $A6DC  00        BRK
  $A6DD  00        BRK
  $A6DE  00        BRK
  $A6DF  00        BRK
  $A6E0  04        .db $04
  $A6E1  07        .db $07
  $A6E2  04        .db $04
  $A6E3  04        .db $04
  $A6E4  1C        .db $1C
  $A6E5  26 25     ROL $25
  $A6E7  18        CLC
  $A6E8  00        BRK
  $A6E9  00        BRK
  $A6EA  00        BRK
  $A6EB  00        BRK
  $A6EC  00        BRK
  $A6ED  00        BRK
  $A6EE  00        BRK
  $A6EF  00        BRK
  $A6F0  10 7C     BPL $A76E
  $A6F2  11 10     ORA ($10),Y
  $A6F4  30 51     BMI $A747
  $A6F6  51 3E     EOR ($3E),Y
  $A6F8  00        BRK
  $A6F9  00        BRK
  $A6FA  00        BRK
  $A6FB  00        BRK

L_A6FC:
  $A6FC  00        BRK
  $A6FD  00        BRK
  $A6FE  00        BRK
  $A6FF  00        BRK
  $A700  18        CLC
  $A701  04        .db $04
  $A702  20 26 39  JSR $3926
  $A705  21 02     AND ($02,X)
  $A707  0C        .db $0C
  $A708  00        BRK
  $A709  00        BRK
  $A70A  00        BRK
  $A70B  00        BRK
  $A70C  00        BRK
  $A70D  00        BRK
  $A70E  00        BRK
  $A70F  00        BRK
  $A710  00        BRK
  $A711  22        .db $22
  $A712  22        .db $22
  $A713  22        .db $22
  $A714  12        .db $12
  $A715  02        .db $02
  $A716  04        .db $04
  $A717  18        CLC
  $A718  00        BRK
  $A719  00        BRK
  $A71A  00        BRK
  $A71B  00        BRK
  $A71C  00        BRK
  $A71D  00        BRK
  $A71E  00        BRK
  $A71F  00        BRK
  $A720  3E 0C 1E  ROL $1E0C,X
  $A723  21 41     AND ($41,X)
  $A725  1D 25 1E  ORA $1E25,X
  $A728  00        BRK
  $A729  00        BRK
  $A72A  00        BRK
  $A72B  00        BRK
  $A72C  00        BRK
  $A72D  00        BRK
  $A72E  00        BRK
  $A72F  00        BRK
  $A730  10 10     BPL $A742
  $A732  76 19     ROR $19,X
  $A734  11 32     ORA ($32),Y
  $A736  52        .db $52
  $A737  11 00     ORA ($00),Y
  $A739  00        BRK
  $A73A  00        BRK
  $A73B  00        BRK
  $A73C  00        BRK
  $A73D  00        BRK
  $A73E  00        BRK
  $A73F  00        BRK
  $A740  00        BRK
  $A741  00        BRK

L_A742:
  $A742  00        BRK
  $A743  54        .db $54
  $A744  54        .db $54
  $A745  04        .db $04
  $A746  08        PHP

L_A747:
  $A747  10 00     BPL $A749

L_A749:
  $A749  00        BRK
  $A74A  00        BRK
  $A74B  00        BRK
  $A74C  00        BRK
  $A74D  00        BRK
  $A74E  00        BRK
  $A74F  00        BRK
  $A750  00        BRK
  $A751  00        BRK
  $A752  00        BRK

L_A753:
  $A753  1C        .db $1C
  $A754  62        .db $62
  $A755  02        .db $02
  $A756  04        .db $04
  $A757  08        PHP
  $A758  00        BRK
  $A759  00        BRK
  $A75A  00        BRK
  $A75B  00        BRK
  $A75C  00        BRK
  $A75D  00        BRK
  $A75E  00        BRK
  $A75F  00        BRK
  $A760  00        BRK
  $A761  1E 12 22  ASL $2212,X
  $A764  04        .db $04
  $A765  04        .db $04
  $A766  08        PHP
  $A767  30 00     BMI $A769

L_A769:
  $A769  00        BRK
  $A76A  00        BRK
  $A76B  00        BRK
  $A76C  00        BRK
  $A76D  00        BRK

L_A76E:
  $A76E  00        BRK
  $A76F  00        BRK
  $A770  00        BRK
  $A771  FE 82 82  INC $8282,X
  $A774  82        .db $82
  $A775  82        .db $82
  $A776  FC        .db $FC
  $A777  00        BRK
  $A778  00        BRK
  $A779  00        BRK
  $A77A  00        BRK
  $A77B  00        BRK
  $A77C  00        BRK
  $A77D  00        BRK
  $A77E  00        BRK
  $A77F  00        BRK
  $A780  00        BRK
  $A781  61 31     ADC ($31,X)
  $A783  01 02     ORA ($02,X)
  $A785  02        .db $02
  $A786  4C 30 00  JMP $0030
  $A789  00        BRK
  $A78A  00        BRK
  $A78B  00        BRK
  $A78C  00        BRK
  $A78D  00        BRK
  $A78E  00        BRK
  $A78F  00        BRK
  $A790  00        BRK
  $A791  00        BRK
  $A792  7F        .db $7F
  $A793  01 02     ORA ($02,X)
  $A795  14        .db $14
  $A796  08        PHP
  $A797  08        PHP
  $A798  00        BRK
  $A799  00        BRK
  $A79A  00        BRK
  $A79B  00        BRK
  $A79C  00        BRK
  $A79D  00        BRK
  $A79E  00        BRK
  $A79F  00        BRK
  $A7A0  00        BRK
  $A7A1  03        .db $03
  $A7A2  06 0C     ASL $0C
  $A7A4  3C        .db $3C
  $A7A5  04        .db $04
  $A7A6  04        .db $04
  $A7A7  04        .db $04
  $A7A8  00        BRK
  $A7A9  00        BRK
  $A7AA  00        BRK
  $A7AB  00        BRK
  $A7AC  00        BRK
  $A7AD  00        BRK
  $A7AE  00        BRK
  $A7AF  00        BRK
  $A7B0  00        BRK
  $A7B1  00        BRK
  $A7B2  00        BRK
  $A7B3  00        BRK
  $A7B4  30 48     BMI $A7FE
  $A7B6  48        PHA
  $A7B7  30 00     BMI $A7B9

L_A7B9:
  $A7B9  00        BRK
  $A7BA  00        BRK
  $A7BB  00        BRK
  $A7BC  00        BRK
  $A7BD  00        BRK
  $A7BE  00        BRK
  $A7BF  00        BRK
  $A7C0  60        RTS
  $A7C1  90 90     BCC $A753
  $A7C3  60        RTS
  $A7C4  00        BRK
  $A7C5  00        BRK
  $A7C6  00        BRK
  $A7C7  00        BRK
  $A7C8  00        BRK
  $A7C9  00        BRK
  $A7CA  00        BRK
  $A7CB  00        BRK
  $A7CC  00        BRK
  $A7CD  00        BRK
  $A7CE  00        BRK
  $A7CF  00        BRK
  $A7D0  00        BRK
  $A7D1  7F        .db $7F
  $A7D2  41 41     EOR ($41,X)
  $A7D4  01 02     ORA ($02,X)
  $A7D6  04        .db $04
  $A7D7  38        SEC
  $A7D8  00        BRK
  $A7D9  00        BRK
  $A7DA  00        BRK
  $A7DB  00        BRK
  $A7DC  00        BRK
  $A7DD  00        BRK
  $A7DE  00        BRK
  $A7DF  00        BRK
  $A7E0  50 50     BVC $A832
  $A7E2  00        BRK
  $A7E3  00        BRK
  $A7E4  00        BRK
  $A7E5  00        BRK
  $A7E6  00        BRK
  $A7E7  00        BRK
  $A7E8  00        BRK
  $A7E9  00        BRK
  $A7EA  00        BRK
  $A7EB  00        BRK
  $A7EC  00        BRK
  $A7ED  00        BRK
  $A7EE  00        BRK
  $A7EF  00        BRK
  $A7F0  00        BRK
  $A7F1  22        .db $22
  $A7F2  22        .db $22
  $A7F3  22        .db $22
  $A7F4  22        .db $22
  $A7F5  02        .db $02
  $A7F6  04        .db $04
  $A7F7  18        CLC
  $A7F8  00        BRK
  $A7F9  00        BRK
  $A7FA  00        BRK
  $A7FB  00        BRK
  $A7FC  00        BRK
  $A7FD  00        BRK

L_A7FE:
  $A7FE  00        BRK
  $A7FF  00        BRK
  $A800  00        BRK
  $A801  00        BRK
  $A802  00        BRK
  $A803  00        BRK
  $A804  7C        .db $7C
  $A805  00        BRK
  $A806  00        BRK
  $A807  00        BRK
  $A808  00        BRK
  $A809  00        BRK
  $A80A  00        BRK
  $A80B  00        BRK
  $A80C  00        BRK
  $A80D  00        BRK
  $A80E  00        BRK
  $A80F  00        BRK
  $A810  7C        .db $7C
  $A811  10 7C     BPL $A88F
  $A813  54        .db $54
  $A814  7C        .db $7C
  $A815  FE 44 44  INC $4444,X
  $A818  00        BRK
  $A819  00        BRK
  $A81A  00        BRK
  $A81B  00        BRK
  $A81C  00        BRK
  $A81D  00        BRK
  $A81E  00        BRK
  $A81F  00        BRK
  $A820  FE 10 54  INC $5410,X
  $A823  38        SEC

L_A824:
  $A824  FE 10 10  INC $1010,X
  $A827  10 00     BPL $A829

L_A829:
  $A829  00        BRK
  $A82A  00        BRK
  $A82B  00        BRK
  $A82C  00        BRK
  $A82D  00        BRK
  $A82E  00        BRK
  $A82F  00        BRK
  $A830  0A        ASL
  $A831  9F        .db $9F

L_A832:
  $A832  04        .db $04
  $A833  DF        .db $DF
  $A834  46 99     LSR $99
  $A836  C0 3F     CPY #$3F
  $A838  00        BRK
  $A839  00        BRK
  $A83A  00        BRK
  $A83B  00        BRK
  $A83C  00        BRK
  $A83D  00        BRK
  $A83E  00        BRK
  $A83F  00        BRK
  $A840  14        .db $14
  $A841  9E        .db $9E
  $A842  24 DF     BIT $DF
  $A844  40        RTI
  $A845  8E CA 3F  STX $3FCA
  $A848  00        BRK
  $A849  00        BRK
  $A84A  00        BRK
  $A84B  00        BRK
  $A84C  00        BRK
  $A84D  00        BRK
  $A84E  00        BRK
  $A84F  00        BRK
  $A850  28        PLP
  $A851  48        PHA
  $A852  FE 5C 6A  INC $6A5C,X
  $A855  49 5C     EOR #$5C
  $A857  48        PHA
  $A858  00        BRK
  $A859  00        BRK
  $A85A  00        BRK
  $A85B  00        BRK
  $A85C  00        BRK
  $A85D  00        BRK

L_A85E:
  $A85E  00        BRK
  $A85F  00        BRK
  $A860  00        BRK
  $A861  1E 00 3F  ASL $3F00,X
  $A864  01 01     ORA ($01,X)
  $A866  02        .db $02
  $A867  1C        .db $1C
  $A868  00        BRK
  $A869  00        BRK
  $A86A  00        BRK
  $A86B  00        BRK
  $A86C  00        BRK
  $A86D  00        BRK
  $A86E  00        BRK
  $A86F  00        BRK
  $A870  10 10     BPL $A882
  $A872  10 18     BPL $A88C
  $A874  14        .db $14
  $A875  12        .db $12
  $A876  10 10     BPL $A888
  $A878  00        BRK
  $A879  00        BRK
  $A87A  00        BRK
  $A87B  00        BRK
  $A87C  00        BRK
  $A87D  00        BRK
  $A87E  00        BRK
  $A87F  00        BRK
  $A880  48        PHA
  $A881  48        PHA

L_A882:
  $A882  7E 88 3E  ROR $3E88,X
  $A885  08        PHP
  $A886  08        PHP
  $A887  7E 00 00  ROR $0000,X
  $A88A  00        BRK
  $A88B  00        BRK

L_A88C:
  $A88C  00        BRK
  $A88D  00        BRK
  $A88E  00        BRK

L_A88F:
  $A88F  00        BRK
  $A890  10 92     BPL $A824
  $A892  92        .db $92
  $A893  FE 10 92  INC $9210,X
  $A896  92        .db $92
  $A897  FE 00 00  INC $0000,X
  $A89A  00        BRK
  $A89B  00        BRK
  $A89C  00        BRK
  $A89D  00        BRK
  $A89E  00        BRK
  $A89F  00        BRK
  $A8A0  00        BRK
  $A8A1  7F        .db $7F
  $A8A2  02        .db $02
  $A8A3  04        .db $04
  $A8A4  08        PHP
  $A8A5  14        .db $14
  $A8A6  22        .db $22
  $A8A7  41 00     EOR ($00,X)
  $A8A9  00        BRK
  $A8AA  00        BRK
  $A8AB  00        BRK
  $A8AC  00        BRK
  $A8AD  00        BRK
  $A8AE  00        BRK
  $A8AF  00        BRK
  $A8B0  00        BRK
  $A8B1  24 24     BIT $24
  $A8B3  24 42     BIT $42
  $A8B5  42        .db $42
  $A8B6  81 00     STA ($00,X)
  $A8B8  00        BRK
  $A8B9  00        BRK
  $A8BA  00        BRK
  $A8BB  00        BRK
  $A8BC  00        BRK
  $A8BD  00        BRK
  $A8BE  00        BRK
  $A8BF  00        BRK
  $A8C0  08        PHP
  $A8C1  08        PHP
  $A8C2  7F        .db $7F
  $A8C3  08        PHP
  $A8C4  2A        ROL
  $A8C5  49 49     EOR #$49
  $A8C7  08        PHP
  $A8C8  00        BRK
  $A8C9  00        BRK
  $A8CA  00        BRK
  $A8CB  00        BRK
  $A8CC  00        BRK
  $A8CD  00        BRK
  $A8CE  00        BRK
  $A8CF  00        BRK
  $A8D0  10 10     BPL $A8E2
  $A8D2  FE 10 10  INC $1010,X
  $A8D5  10 20     BPL $A8F7
  $A8D7  C0 00     CPY #$00
  $A8D9  00        BRK
  $A8DA  00        BRK
  $A8DB  00        BRK
  $A8DC  00        BRK
  $A8DD  00        BRK
  $A8DE  00        BRK
  $A8DF  00        BRK
  $A8E0  00        BRK
  $A8E1  42        .db $42

L_A8E2:
  $A8E2  42        .db $42
  $A8E3  22        .db $22
  $A8E4  04        .db $04
  $A8E5  04        .db $04
  $A8E6  08        PHP
  $A8E7  30 00     BMI $A8E9

L_A8E9:
  $A8E9  00        BRK
  $A8EA  00        BRK
  $A8EB  00        BRK
  $A8EC  00        BRK
  $A8ED  00        BRK
  $A8EE  00        BRK
  $A8EF  00        BRK
  $A8F0  FE 10 10  INC $1010,X
  $A8F3  7C        .db $7C
  $A8F4  10 10     BPL $A906
  $A8F6  28        PLP

L_A8F7:
  $A8F7  C7        .db $C7
  $A8F8  00        BRK
  $A8F9  00        BRK
  $A8FA  00        BRK
  $A8FB  00        BRK
  $A8FC  00        BRK
  $A8FD  00        BRK
  $A8FE  00        BRK
  $A8FF  00        BRK
  $A900  08        PHP
  $A901  7E 08 0C  ROR $0C08,X
  $A904  18        CLC
  $A905  28        PLP

L_A906:
  $A906  48        PHA
  $A907  08        PHP
  $A908  00        BRK
  $A909  00        BRK
  $A90A  00        BRK
  $A90B  00        BRK
  $A90C  00        BRK
  $A90D  00        BRK
  $A90E  00        BRK
  $A90F  00        BRK
  $A910  22        .db $22
  $A911  EA        NOP
  $A912  22        .db $22
  $A913  FA        .db $FA
  $A914  62        .db $62
  $A915  BF        .db $BF
  $A916  22        .db $22
  $A917  22        .db $22
  $A918  00        BRK
  $A919  00        BRK
  $A91A  00        BRK
  $A91B  00        BRK
  $A91C  00        BRK
  $A91D  00        BRK
  $A91E  00        BRK
  $A91F  00        BRK
  $A920  52        .db $52
  $A921  7E 81 BD  ROR $BD81,X
  $A924  08        PHP
  $A925  7E 08 18  ROR $1808,X
  $A928  00        BRK
  $A929  00        BRK
  $A92A  00        BRK
  $A92B  00        BRK
  $A92C  00        BRK
  $A92D  00        BRK
  $A92E  00        BRK
  $A92F  00        BRK
  $A930  3E 08 7E  ROL $7E08,X
  $A933  10 3E     BPL $A973
  $A935  56 1A     LSR $1A,X
  $A937  1E 00 00  ASL $0000,X
  $A93A  00        BRK
  $A93B  00        BRK
  $A93C  00        BRK
  $A93D  00        BRK
  $A93E  00        BRK
  $A93F  00        BRK
  $A940  54        .db $54
  $A941  54        .db $54
  $A942  FE 54 54  INC $5454,X
  $A945  5C        .db $5C
  $A946  40        RTI
  $A947  3E 00 00  ROL $0000,X
  $A94A  00        BRK
  $A94B  00        BRK
  $A94C  00        BRK
  $A94D  00        BRK
  $A94E  00        BRK
  $A94F  00        BRK
  $A950  7C        .db $7C
  $A951  54        .db $54
  $A952  7C        .db $7C
  $A953  54        .db $54
  $A954  38        SEC
  $A955  6C AA 28  JMP ($28AA)
  $A958  00        BRK
  $A959  00        BRK
  $A95A  00        BRK
  $A95B  00        BRK
  $A95C  00        BRK
  $A95D  00        BRK
  $A95E  00        BRK
  $A95F  00        BRK
  $A960  20 5E A8  JSR $A85E
  $A963  48        PHA
  $A964  CE 68 58  DEC $5868
  $A967  7E 00 00  ROR $0000,X
  $A96A  00        BRK
  $A96B  00        BRK
  $A96C  00        BRK
  $A96D  00        BRK
  $A96E  00        BRK
  $A96F  00        BRK
  $A970  EF        .db $EF
  $A971  A9 EB     LDA #$EB

L_A973:
  $A973  A8        TAY
  $A974  EF        .db $EF
  $A975  AD AA AD  LDA $ADAA
  $A978  00        BRK
  $A979  00        BRK
  $A97A  00        BRK
  $A97B  00        BRK
  $A97C  00        BRK
  $A97D  00        BRK
  $A97E  00        BRK
  $A97F  00        BRK
  $A980  67        .db $67
  $A981  55 67     EOR $67,X
  $A983  55 57     EOR $57,X
  $A985  65 45     ADC $45
  $A987  4F        .db $4F
  $A988  00        BRK
  $A989  00        BRK
  $A98A  00        BRK
  $A98B  00        BRK
  $A98C  00        BRK
  $A98D  00        BRK
  $A98E  00        BRK
  $A98F  00        BRK
  $A990  00        BRK
  $A991  08        PHP
  $A992  08        PHP
  $A993  0E 28 28  ASL $2828
  $A996  28        PLP
  $A997  7F        .db $7F
  $A998  00        BRK
  $A999  00        BRK
  $A99A  00        BRK
  $A99B  00        BRK
  $A99C  00        BRK
  $A99D  00        BRK
  $A99E  00        BRK
  $A99F  00        BRK
  $A9A0  EE A2 E4  INC $E4A2
  $A9A3  5F        .db $5F
  $A9A4  E6 44     INC $44
  $A9A6  64        .db $64
  $A9A7  CC 00 00  CPY $0000
  $A9AA  00        BRK
  $A9AB  00        BRK
  $A9AC  00        BRK
  $A9AD  00        BRK
  $A9AE  00        BRK
  $A9AF  00        BRK
  $A9B0  27        .db $27
  $A9B1  F5 47     SBC $47,X
  $A9B3  75 00     ADC $00,X
  $A9B5  3E 08 7F  ROL $7F08,X
  $A9B8  00        BRK
  $A9B9  00        BRK
  $A9BA  00        BRK
  $A9BB  00        BRK
  $A9BC  00        BRK
  $A9BD  00        BRK
  $A9BE  00        BRK
  $A9BF  00        BRK
  $A9C0  30 E0     BMI $A9A2
  $A9C2  2F        .db $2F
  $A9C3  F9 69 A9  SBC $A969,Y
  $A9C6  2F        .db $2F
  $A9C7  20 00 00  JSR $0000
  $A9CA  00        BRK
  $A9CB  00        BRK
  $A9CC  00        BRK
  $A9CD  00        BRK
  $A9CE  00        BRK
  $A9CF  00        BRK
  $A9D0  4C ED 5E  JMP $5EED
  $A9D3  4C 7E CD  JMP $CD7E
  $A9D6  4C 73 00  JMP $0073
  $A9D9  00        BRK
  $A9DA  00        BRK
  $A9DB  00        BRK
  $A9DC  00        BRK
  $A9DD  00        BRK
  $A9DE  00        BRK
  $A9DF  00        BRK
  $A9E0  40        RTI
  $A9E1  7C        .db $7C
  $A9E2  90 7C     BCC $AA60

L_A9E4:
  $A9E4  50 FE     BVC $A9E4
  $A9E6  10 10     BPL $A9F8
  $A9E8  00        BRK
  $A9E9  00        BRK
  $A9EA  00        BRK
  $A9EB  00        BRK
  $A9EC  00        BRK
  $A9ED  00        BRK
  $A9EE  00        BRK
  $A9EF  00        BRK
  $A9F0  22        .db $22
  $A9F1  FC        .db $FC
  $A9F2  57        .db $57
  $A9F3  FA        .db $FA
  $A9F4  2A        ROL
  $A9F5  FA        .db $FA
  $A9F6  6A        ROR
  $A9F7  AA        TAX

L_A9F8:
  $A9F8  00        BRK
  $A9F9  00        BRK
  $A9FA  00        BRK
  $A9FB  00        BRK
  $A9FC  00        BRK
  $A9FD  00        BRK
  $A9FE  00        BRK
  $A9FF  00        BRK
  $AA00  00        BRK
  $AA01  7C        .db $7C
  $AA02  C6 C6     DEC $C6
  $AA04  C6 C6     DEC $C6
  $AA06  C6 7C     DEC $7C
  $AA08  00        BRK
  $AA09  00        BRK
  $AA0A  00        BRK
  $AA0B  00        BRK
  $AA0C  00        BRK
  $AA0D  00        BRK
  $AA0E  00        BRK
  $AA0F  00        BRK
  $AA10  00        BRK
  $AA11  7C        .db $7C
  $AA12  C6 C6     DEC $C6
  $AA14  7C        .db $7C
  $AA15  C6 C6     DEC $C6
  $AA17  7C        .db $7C
  $AA18  00        BRK
  $AA19  00        BRK
  $AA1A  00        BRK
  $AA1B  00        BRK
  $AA1C  00        BRK
  $AA1D  00        BRK
  $AA1E  00        BRK
  $AA1F  00        BRK
  $AA20  00        BRK
  $AA21  7C        .db $7C
  $AA22  C6 06     DEC $06
  $AA24  3C        .db $3C
  $AA25  60        RTS
  $AA26  C0 FE     CPY #$FE
  $AA28  00        BRK
  $AA29  00        BRK
  $AA2A  00        BRK
  $AA2B  00        BRK
  $AA2C  00        BRK
  $AA2D  00        BRK
  $AA2E  00        BRK
  $AA2F  00        BRK
  $AA30  00        BRK
  $AA31  38        SEC
  $AA32  44        .db $44
  $AA33  BA        TSX
  $AA34  A2 BA     LDX #$BA
  $AA36  44        .db $44
  $AA37  38        SEC
  $AA38  00        BRK
  $AA39  00        BRK
  $AA3A  00        BRK
  $AA3B  00        BRK
  $AA3C  00        BRK
  $AA3D  00        BRK
  $AA3E  00        BRK
  $AA3F  00        BRK
  $AA40  00        BRK
  $AA41  00        BRK
  $AA42  3E 08 08  ROL $0808,X
  $AA45  08        PHP
  $AA46  08        PHP
  $AA47  00        BRK
  $AA48  00        BRK
  $AA49  00        BRK
  $AA4A  00        BRK
  $AA4B  00        BRK
  $AA4C  00        BRK
  $AA4D  00        BRK
  $AA4E  00        BRK
  $AA4F  00        BRK
  $AA50  00        BRK
  $AA51  7C        .db $7C
  $AA52  C6 C6     DEC $C6
  $AA54  7E 06 C6  ROR $C606,X
  $AA57  7C        .db $7C
  $AA58  00        BRK
  $AA59  00        BRK
  $AA5A  00        BRK
  $AA5B  00        BRK
  $AA5C  00        BRK
  $AA5D  00        BRK
  $AA5E  00        BRK
  $AA5F  00        BRK

L_AA60:
  $AA60  00        BRK
  $AA61  00        BRK
  $AA62  88        DEY
  $AA63  D8        CLD
  $AA64  A8        TAY
  $AA65  88        DEY
  $AA66  88        DEY
  $AA67  00        BRK
  $AA68  00        BRK
  $AA69  00        BRK
  $AA6A  00        BRK
  $AA6B  00        BRK
  $AA6C  00        BRK
  $AA6D  00        BRK
  $AA6E  00        BRK
  $AA6F  00        BRK
  $AA70  00        BRK
  $AA71  1C        .db $1C
  $AA72  3C        .db $3C
  $AA73  1C        .db $1C
  $AA74  1C        .db $1C
  $AA75  1C        .db $1C
  $AA76  1C        .db $1C
  $AA77  1C        .db $1C
  $AA78  00        BRK
  $AA79  00        BRK
  $AA7A  00        BRK
  $AA7B  00        BRK
  $AA7C  00        BRK
  $AA7D  00        BRK
  $AA7E  00        BRK
  $AA7F  00        BRK
  $AA80  10 7C     BPL $AAFE
  $AA82  20 26 78  JSR $7826
  $AA85  14        .db $14
  $AA86  20 3E 00  JSR $003E
  $AA89  00        BRK
  $AA8A  00        BRK
  $AA8B  00        BRK
  $AA8C  00        BRK
  $AA8D  00        BRK
  $AA8E  00        BRK
  $AA8F  00        BRK
  $AA90  78        SEI
  $AA91  10 22     BPL $AAB5
  $AA93  43        .db $43
  $AA94  42        .db $42
  $AA95  42        .db $42
  $AA96  44        .db $44
  $AA97  38        SEC
  $AA98  00        BRK
  $AA99  00        BRK
  $AA9A  00        BRK
  $AA9B  00        BRK
  $AA9C  00        BRK
  $AA9D  00        BRK
  $AA9E  00        BRK
  $AA9F  00        BRK
  $AAA0  00        BRK
  $AAA1  00        BRK
  $AAA2  42        .db $42
  $AAA3  41 41     EOR ($41,X)
  $AAA5  41 48     EOR ($48,X)
  $AAA7  30 00     BMI $AAA9

L_AAA9:
  $AAA9  00        BRK
  $AAAA  00        BRK
  $AAAB  00        BRK
  $AAAC  00        BRK
  $AAAD  00        BRK
  $AAAE  00        BRK
  $AAAF  00        BRK
  $AAB0  00        BRK
  $AAB1  00        BRK
  $AAB2  00        BRK
  $AAB3  00        BRK
  $AAB4  00        BRK

L_AAB5:
  $AAB5  20 10 10  JSR $1010
  $AAB8  00        BRK
  $AAB9  00        BRK
  $AABA  00        BRK
  $AABB  00        BRK
  $AABC  00        BRK
  $AABD  00        BRK
  $AABE  00        BRK
  $AABF  00        BRK
  $AAC0  00        BRK
  $AAC1  1F        .db $1F
  $AAC2  3F        .db $3F
  $AAC3  3F        .db $3F
  $AAC4  7F        .db $7F
  $AAC5  01 3D     ORA ($3D,X)
  $AAC7  7D 3F 20  ADC $203F,X
  $AACA  40        RTI
  $AACB  40        RTI
  $AACC  80        .db $80
  $AACD  FE 3E 7E  INC $7E3E,X
  $AAD0  00        BRK
  $AAD1  FF        .db $FF
  $AAD2  FF        .db $FF
  $AAD3  FF        .db $FF
  $AAD4  FF        .db $FF
  $AAD5  F0 F7     BEQ $AACE
  $AAD7  F7        .db $F7
  $AAD8  FF        .db $FF
  $AAD9  00        BRK
  $AADA  00        BRK
  $AADB  00        BRK
  $AADC  00        BRK
  $AADD  0F        .db $0F
  $AADE  0F        .db $0F

L_AADF:
  $AADF  0F        .db $0F
  $AAE0  00        BRK
  $AAE1  FF        .db $FF
  $AAE2  FF        .db $FF
  $AAE3  FF        .db $FF
  $AAE4  FF        .db $FF
  $AAE5  0F        .db $0F
  $AAE6  EF        .db $EF
  $AAE7  EF        .db $EF
  $AAE8  FF        .db $FF
  $AAE9  00        BRK
  $AAEA  00        BRK
  $AAEB  00        BRK
  $AAEC  00        BRK
  $AAED  F0 F0     BEQ $AADF
  $AAEF  F0 00     BEQ $AAF1

L_AAF1:
  $AAF1  F8        SED
  $AAF2  FC        .db $FC
  $AAF3  FC        .db $FC
  $AAF4  FE 80 BC  INC $BC80,X
  $AAF7  BE FC 04  LDX $04FC,Y
  $AAFA  02        .db $02
  $AAFB  02        .db $02
  $AAFC  01 7F     ORA ($7F,X)

L_AAFE:
  $AAFE  7C        .db $7C
  $AAFF  7E 01 01  ROR $0101,X
  $AB02  03        .db $03
  $AB03  03        .db $03
  $AB04  03        .db $03
  $AB05  03        .db $03
  $AB06  07        .db $07
  $AB07  07        .db $07
  $AB08  02        .db $02
  $AB09  02        .db $02
  $AB0A  04        .db $04
  $AB0B  04        .db $04
  $AB0C  04        .db $04
  $AB0D  04        .db $04
  $AB0E  08        PHP
  $AB0F  08        PHP
  $AB10  E8        INX
  $AB11  E8        INX
  $AB12  E8        INX
  $AB13  E8        INX
  $AB14  E8        INX
  $AB15  E8        INX
  $AB16  E8        INX
  $AB17  D0 18     BNE $AB31
  $AB19  18        CLC
  $AB1A  18        CLC
  $AB1B  18        CLC
  $AB1C  18        CLC
  $AB1D  18        CLC
  $AB1E  18        CLC
  $AB1F  30 17     BMI $AB38
  $AB21  17        .db $17
  $AB22  17        .db $17
  $AB23  17        .db $17
  $AB24  17        .db $17
  $AB25  17        .db $17
  $AB26  17        .db $17
  $AB27  0B        .db $0B
  $AB28  18        CLC
  $AB29  18        CLC
  $AB2A  18        CLC
  $AB2B  18        CLC
  $AB2C  18        CLC
  $AB2D  18        CLC
  $AB2E  18        CLC
  $AB2F  0C        .db $0C
  $AB30  80        .db $80

L_AB31:
  $AB31  80        .db $80

L_AB32:
  $AB32  C0 C0     CPY #$C0

L_AB34:
  $AB34  C0 C0     CPY #$C0

L_AB36:
  $AB36  E0 E0     CPX #$E0

L_AB38:
  $AB38  40        RTI
  $AB39  40        RTI
  $AB3A  20 20 20  JSR $2020
  $AB3D  20 10 10  JSR $1010
  $AB40  00        BRK
  $AB41  00        BRK
  $AB42  00        BRK
  $AB43  00        BRK
  $AB44  00        BRK
  $AB45  00        BRK
  $AB46  00        BRK
  $AB47  0F        .db $0F
  $AB48  00        BRK
  $AB49  00        BRK
  $AB4A  00        BRK
  $AB4B  00        BRK
  $AB4C  00        BRK
  $AB4D  00        BRK
  $AB4E  1F        .db $1F
  $AB4F  10 07     BPL $AB58
  $AB51  07        .db $07
  $AB52  0F        .db $0F
  $AB53  0F        .db $0F
  $AB54  0F        .db $0F
  $AB55  1F        .db $1F
  $AB56  1F        .db $1F
  $AB57  FF        .db $FF

L_AB58:
  $AB58  08        PHP
  $AB59  08        PHP
  $AB5A  10 10     BPL $AB6C
  $AB5C  10 20     BPL $AB7E
  $AB5E  E0 00     CPX #$00
  $AB60  D0 D0     BNE $AB32
  $AB62  D0 D0     BNE $AB34
  $AB64  D0 D0     BNE $AB36
  $AB66  C0 FF     CPY #$FF
  $AB68  30 30     BMI $AB9A
  $AB6A  30 30     BMI $AB9C

L_AB6C:
  $AB6C  30 30     BMI $AB9E
  $AB6E  3F        .db $3F
  $AB6F  00        BRK
  $AB70  0B        .db $0B
  $AB71  0B        .db $0B
  $AB72  0B        .db $0B
  $AB73  0B        .db $0B

L_AB74:
  $AB74  0B        .db $0B
  $AB75  0B        .db $0B
  $AB76  03        .db $03
  $AB77  FF        .db $FF
  $AB78  0C        .db $0C
  $AB79  0C        .db $0C
  $AB7A  0C        .db $0C
  $AB7B  0C        .db $0C
  $AB7C  0C        .db $0C
  $AB7D  0C        .db $0C

L_AB7E:
  $AB7E  FC        .db $FC
  $AB7F  00        BRK
  $AB80  E0 E0     CPX #$E0
  $AB82  F0 F0     BEQ $AB74
  $AB84  F0 F8     BEQ $AB7E
  $AB86  F8        SED
  $AB87  FF        .db $FF
  $AB88  10 10     BPL $AB9A
  $AB8A  08        PHP
  $AB8B  08        PHP
  $AB8C  08        PHP
  $AB8D  04        .db $04
  $AB8E  07        .db $07
  $AB8F  00        BRK
  $AB90  00        BRK
  $AB91  00        BRK
  $AB92  00        BRK
  $AB93  00        BRK
  $AB94  00        BRK
  $AB95  00        BRK
  $AB96  00        BRK
  $AB97  F0 00     BEQ $AB99

L_AB99:
  $AB99  00        BRK

L_AB9A:
  $AB9A  00        BRK
  $AB9B  00        BRK

L_AB9C:
  $AB9C  00        BRK
  $AB9D  00        BRK

L_AB9E:
  $AB9E  F8        SED
  $AB9F  08        PHP
  $ABA0  1F        .db $1F
  $ABA1  1F        .db $1F
  $ABA2  3F        .db $3F
  $ABA3  3F        .db $3F
  $ABA4  7F        .db $7F
  $ABA5  00        BRK
  $ABA6  3F        .db $3F
  $ABA7  7F        .db $7F
  $ABA8  20 20 40  JSR $4020
  $ABAB  40        RTI
  $ABAC  80        .db $80
  $ABAD  FF        .db $FF
  $ABAE  3F        .db $3F
  $ABAF  7F        .db $7F
  $ABB0  FF        .db $FF
  $ABB1  FF        .db $FF
  $ABB2  FF        .db $FF
  $ABB3  FF        .db $FF
  $ABB4  FF        .db $FF
  $ABB5  00        BRK
  $ABB6  FF        .db $FF
  $ABB7  FF        .db $FF
  $ABB8  00        BRK
  $ABB9  00        BRK
  $ABBA  00        BRK
  $ABBB  00        BRK
  $ABBC  00        BRK
  $ABBD  FF        .db $FF
  $ABBE  FF        .db $FF
  $ABBF  FF        .db $FF
  $ABC0  F8        SED
  $ABC1  F8        SED
  $ABC2  FC        .db $FC
  $ABC3  FC        .db $FC
  $ABC4  FE 00 FC  INC $FC00,X
  $ABC7  FE 04 04  INC $0404,X
  $ABCA  02        .db $02
  $ABCB  02        .db $02
  $ABCC  01 FF     ORA ($FF,X)
  $ABCE  FC        .db $FC
  $ABCF  FE 00 00  INC $0000,X
  $ABD2  00        BRK
  $ABD3  00        BRK
  $ABD4  00        BRK
  $ABD5  00        BRK
  $ABD6  00        BRK
  $ABD7  00        BRK
  $ABD8  00        BRK
  $ABD9  00        BRK
  $ABDA  00        BRK
  $ABDB  00        BRK
  $ABDC  00        BRK
  $ABDD  00        BRK
  $ABDE  00        BRK
  $ABDF  00        BRK
  $ABE0  00        BRK
  $ABE1  00        BRK
  $ABE2  00        BRK
  $ABE3  00        BRK
  $ABE4  00        BRK
  $ABE5  00        BRK
  $ABE6  00        BRK
  $ABE7  00        BRK
  $ABE8  00        BRK
  $ABE9  00        BRK
  $ABEA  00        BRK
  $ABEB  00        BRK
  $ABEC  00        BRK
  $ABED  00        BRK
  $ABEE  00        BRK
  $ABEF  00        BRK
  $ABF0  00        BRK
  $ABF1  00        BRK
  $ABF2  00        BRK
  $ABF3  00        BRK
  $ABF4  00        BRK
  $ABF5  00        BRK
  $ABF6  00        BRK
  $ABF7  00        BRK
  $ABF8  00        BRK
  $ABF9  00        BRK
  $ABFA  00        BRK
  $ABFB  00        BRK
  $ABFC  00        BRK
  $ABFD  00        BRK
  $ABFE  00        BRK
  $ABFF  00        BRK
  $AC00  00        BRK
  $AC01  00        BRK
  $AC02  00        BRK
  $AC03  00        BRK
  $AC04  00        BRK
  $AC05  00        BRK
  $AC06  00        BRK
  $AC07  00        BRK
  $AC08  00        BRK
  $AC09  00        BRK
  $AC0A  00        BRK
  $AC0B  00        BRK
  $AC0C  00        BRK
  $AC0D  00        BRK
  $AC0E  00        BRK
  $AC0F  00        BRK
  $AC10  00        BRK
  $AC11  7C        .db $7C
  $AC12  C6 C6     DEC $C6
  $AC14  C6 FE     DEC $FE
  $AC16  C6 C6     DEC $C6
  $AC18  00        BRK
  $AC19  00        BRK
  $AC1A  00        BRK
  $AC1B  00        BRK
  $AC1C  00        BRK
  $AC1D  00        BRK
  $AC1E  00        BRK
  $AC1F  00        BRK
  $AC20  00        BRK
  $AC21  FC        .db $FC
  $AC22  C6 C6     DEC $C6
  $AC24  FC        .db $FC
  $AC25  C6 C6     DEC $C6
  $AC27  FC        .db $FC
  $AC28  00        BRK
  $AC29  00        BRK
  $AC2A  00        BRK
  $AC2B  00        BRK
  $AC2C  00        BRK
  $AC2D  00        BRK
  $AC2E  00        BRK
  $AC2F  00        BRK
  $AC30  00        BRK
  $AC31  7C        .db $7C
  $AC32  C6 C0     DEC $C0
  $AC34  C0 C0     CPY #$C0
  $AC36  C6 7C     DEC $7C
  $AC38  00        BRK
  $AC39  00        BRK
  $AC3A  00        BRK
  $AC3B  00        BRK
  $AC3C  00        BRK
  $AC3D  00        BRK
  $AC3E  00        BRK
  $AC3F  00        BRK
  $AC40  00        BRK
  $AC41  FC        .db $FC
  $AC42  C6 C6     DEC $C6
  $AC44  C6 C6     DEC $C6
  $AC46  C6 FC     DEC $FC
  $AC48  00        BRK
  $AC49  00        BRK
  $AC4A  00        BRK
  $AC4B  00        BRK
  $AC4C  00        BRK
  $AC4D  00        BRK
  $AC4E  00        BRK
  $AC4F  00        BRK
  $AC50  00        BRK
  $AC51  FE C0 C0  INC $C0C0,X
  $AC54  FC        .db $FC
  $AC55  C0 C0     CPY #$C0
  $AC57  FE 00 00  INC $0000,X
  $AC5A  00        BRK
  $AC5B  00        BRK
  $AC5C  00        BRK
  $AC5D  00        BRK
  $AC5E  00        BRK
  $AC5F  00        BRK
  $AC60  00        BRK
  $AC61  FE C0 C0  INC $C0C0,X
  $AC64  FC        .db $FC
  $AC65  C0 C0     CPY #$C0
  $AC67  C0 00     CPY #$00
  $AC69  00        BRK
  $AC6A  00        BRK
  $AC6B  00        BRK
  $AC6C  00        BRK
  $AC6D  00        BRK
  $AC6E  00        BRK
  $AC6F  00        BRK
  $AC70  00        BRK
  $AC71  7C        .db $7C
  $AC72  C6 C0     DEC $C0
  $AC74  DE C6 C6  DEC $C6C6,X
  $AC77  7C        .db $7C
  $AC78  00        BRK
  $AC79  00        BRK
  $AC7A  00        BRK
  $AC7B  00        BRK
  $AC7C  00        BRK
  $AC7D  00        BRK
  $AC7E  00        BRK

L_AC7F:
  $AC7F  00        BRK
  $AC80  00        BRK
  $AC81  C6 C6     DEC $C6
  $AC83  C6 FE     DEC $FE
  $AC85  C6 C6     DEC $C6
  $AC87  C6 00     DEC $00
  $AC89  00        BRK
  $AC8A  00        BRK
  $AC8B  00        BRK
  $AC8C  00        BRK
  $AC8D  00        BRK
  $AC8E  00        BRK
  $AC8F  00        BRK
  $AC90  00        BRK
  $AC91  30 30     BMI $ACC3
  $AC93  30 30     BMI $ACC5

L_AC95:
  $AC95  30 30     BMI $ACC7
  $AC97  30 00     BMI $AC99

L_AC99:
  $AC99  00        BRK
  $AC9A  00        BRK
  $AC9B  00        BRK
  $AC9C  00        BRK
  $AC9D  00        BRK
  $AC9E  00        BRK
  $AC9F  00        BRK
  $ACA0  00        BRK
  $ACA1  0C        .db $0C
  $ACA2  0C        .db $0C
  $ACA3  0C        .db $0C
  $ACA4  0C        .db $0C
  $ACA5  6C 6C 38  JMP ($386C)
  $ACA8  00        BRK
  $ACA9  00        BRK
  $ACAA  00        BRK
  $ACAB  00        BRK
  $ACAC  00        BRK
  $ACAD  00        BRK
  $ACAE  00        BRK
  $ACAF  00        BRK
  $ACB0  00        BRK
  $ACB1  C4 C8     CPY $C8
  $ACB3  D0 E0     BNE $AC95
  $ACB5  D0 C8     BNE $AC7F
  $ACB7  C4 00     CPY $00
  $ACB9  00        BRK
  $ACBA  00        BRK
  $ACBB  00        BRK
  $ACBC  00        BRK
  $ACBD  00        BRK
  $ACBE  00        BRK
  $ACBF  00        BRK
  $ACC0  00        BRK
  $ACC1  60        RTS
  $ACC2  60        RTS

L_ACC3:
  $ACC3  60        RTS
  $ACC4  60        RTS

L_ACC5:
  $ACC5  60        RTS
  $ACC6  60        RTS

L_ACC7:
  $ACC7  7E 00 00  ROR $0000,X
  $ACCA  00        BRK
  $ACCB  00        BRK
  $ACCC  00        BRK
  $ACCD  00        BRK
  $ACCE  00        BRK
  $ACCF  00        BRK
  $ACD0  00        BRK
  $ACD1  C6 EE     DEC $EE
  $ACD3  FE D6 C6  INC $C6D6,X
  $ACD6  C6 C6     DEC $C6
  $ACD8  00        BRK
  $ACD9  00        BRK
  $ACDA  00        BRK
  $ACDB  00        BRK
  $ACDC  00        BRK
  $ACDD  00        BRK
  $ACDE  00        BRK
  $ACDF  00        BRK
  $ACE0  00        BRK
  $ACE1  C6 E6     DEC $E6
  $ACE3  F6 DE     INC $DE,X
  $ACE5  CE C6 C6  DEC $C6C6
  $ACE8  00        BRK
  $ACE9  00        BRK
  $ACEA  00        BRK
  $ACEB  00        BRK
  $ACEC  00        BRK
  $ACED  00        BRK
  $ACEE  00        BRK
  $ACEF  00        BRK
  $ACF0  00        BRK
  $ACF1  7C        .db $7C
  $ACF2  C6 C6     DEC $C6
  $ACF4  C6 C6     DEC $C6
  $ACF6  C6 7C     DEC $7C
  $ACF8  00        BRK
  $ACF9  00        BRK
  $ACFA  00        BRK
  $ACFB  00        BRK
  $ACFC  00        BRK
  $ACFD  00        BRK
  $ACFE  00        BRK
  $ACFF  00        BRK
  $AD00  00        BRK
  $AD01  FC        .db $FC
  $AD02  C6 C6     DEC $C6
  $AD04  C6 FC     DEC $FC
  $AD06  C0 C0     CPY #$C0
  $AD08  00        BRK
  $AD09  00        BRK
  $AD0A  00        BRK
  $AD0B  00        BRK
  $AD0C  00        BRK
  $AD0D  00        BRK
  $AD0E  00        BRK
  $AD0F  00        BRK
  $AD10  00        BRK
  $AD11  7C        .db $7C
  $AD12  C6 C6     DEC $C6
  $AD14  C6 DE     DEC $DE
  $AD16  CE 7C 00  DEC $007C
  $AD19  00        BRK
  $AD1A  00        BRK
  $AD1B  00        BRK
  $AD1C  00        BRK
  $AD1D  00        BRK
  $AD1E  00        BRK
  $AD1F  00        BRK
  $AD20  00        BRK
  $AD21  FC        .db $FC
  $AD22  C6 C6     DEC $C6
  $AD24  C6 FC     DEC $FC
  $AD26  CC C6 00  CPY $00C6
  $AD29  00        BRK
  $AD2A  00        BRK
  $AD2B  00        BRK
  $AD2C  00        BRK
  $AD2D  00        BRK
  $AD2E  00        BRK
  $AD2F  00        BRK
  $AD30  00        BRK
  $AD31  7C        .db $7C
  $AD32  C6 C0     DEC $C0
  $AD34  7C        .db $7C
  $AD35  06 C6     ASL $C6
  $AD37  7C        .db $7C
  $AD38  00        BRK
  $AD39  00        BRK
  $AD3A  00        BRK
  $AD3B  00        BRK
  $AD3C  00        BRK
  $AD3D  00        BRK
  $AD3E  00        BRK
  $AD3F  00        BRK
  $AD40  00        BRK
  $AD41  FC        .db $FC
  $AD42  30 30     BMI $AD74
  $AD44  30 30     BMI $AD76
  $AD46  30 30     BMI $AD78
  $AD48  00        BRK
  $AD49  00        BRK
  $AD4A  00        BRK
  $AD4B  00        BRK
  $AD4C  00        BRK
  $AD4D  00        BRK
  $AD4E  00        BRK
  $AD4F  00        BRK
  $AD50  00        BRK
  $AD51  C6 C6     DEC $C6
  $AD53  C6 C6     DEC $C6
  $AD55  C6 C6     DEC $C6
  $AD57  7C        .db $7C
  $AD58  00        BRK
  $AD59  00        BRK
  $AD5A  00        BRK
  $AD5B  00        BRK
  $AD5C  00        BRK
  $AD5D  00        BRK
  $AD5E  00        BRK
  $AD5F  00        BRK
  $AD60  00        BRK
  $AD61  C6 C6     DEC $C6
  $AD63  C6 C6     DEC $C6
  $AD65  6C 38 10  JMP ($1038)
  $AD68  00        BRK
  $AD69  00        BRK
  $AD6A  00        BRK
  $AD6B  00        BRK
  $AD6C  00        BRK
  $AD6D  00        BRK
  $AD6E  00        BRK
  $AD6F  00        BRK
  $AD70  00        BRK
  $AD71  C6 C6     DEC $C6
  $AD73  C6 D6     DEC $D6
  $AD75  FE EE C6  INC $C6EE,X

L_AD78:
  $AD78  00        BRK
  $AD79  00        BRK
  $AD7A  00        BRK
  $AD7B  00        BRK
  $AD7C  00        BRK
  $AD7D  00        BRK
  $AD7E  00        BRK
  $AD7F  00        BRK
  $AD80  00        BRK
  $AD81  CC CC 78  CPY $78CC
  $AD84  30 78     BMI $ADFE
  $AD86  CC CC 00  CPY $00CC
  $AD89  00        BRK
  $AD8A  00        BRK
  $AD8B  00        BRK
  $AD8C  00        BRK
  $AD8D  00        BRK
  $AD8E  00        BRK
  $AD8F  00        BRK
  $AD90  00        BRK
  $AD91  CC CC CC  CPY $CCCC
  $AD94  78        SEI
  $AD95  30 30     BMI $ADC7
  $AD97  30 00     BMI $AD99

L_AD99:
  $AD99  00        BRK
  $AD9A  00        BRK
  $AD9B  00        BRK
  $AD9C  00        BRK
  $AD9D  00        BRK
  $AD9E  00        BRK
  $AD9F  00        BRK
  $ADA0  00        BRK
  $ADA1  FC        .db $FC
  $ADA2  8C 18 30  STY $3018
  $ADA5  60        RTS
  $ADA6  C4 FC     CPY $FC
  $ADA8  00        BRK
  $ADA9  00        BRK
  $ADAA  00        BRK
  $ADAB  00        BRK
  $ADAC  00        BRK
  $ADAD  00        BRK
  $ADAE  00        BRK
  $ADAF  00        BRK
  $ADB0  00        BRK
  $ADB1  00        BRK
  $ADB2  00        BRK
  $ADB3  00        BRK
  $ADB4  58        CLI
  $ADB5  60        RTS
  $ADB6  60        RTS
  $ADB7  62        .db $62
  $ADB8  00        BRK
  $ADB9  00        BRK
  $ADBA  00        BRK
  $ADBB  00        BRK
  $ADBC  00        BRK
  $ADBD  00        BRK
  $ADBE  00        BRK
  $ADBF  00        BRK
  $ADC0  00        BRK
  $ADC1  00        BRK
  $ADC2  00        BRK
  $ADC3  00        BRK
  $ADC4  00        BRK
  $ADC5  00        BRK
  $ADC6  60        RTS

L_ADC7:
  $ADC7  60        RTS
  $ADC8  00        BRK
  $ADC9  00        BRK
  $ADCA  00        BRK
  $ADCB  00        BRK
  $ADCC  00        BRK
  $ADCD  00        BRK
  $ADCE  00        BRK
  $ADCF  00        BRK
  $ADD0  00        BRK
  $ADD1  00        BRK
  $ADD2  00        BRK
  $ADD3  00        BRK
  $ADD4  60        RTS
  $ADD5  60        RTS
  $ADD6  20 40 00  JSR $0040
  $ADD9  00        BRK
  $ADDA  00        BRK
  $ADDB  00        BRK
  $ADDC  00        BRK
  $ADDD  00        BRK
  $ADDE  00        BRK
  $ADDF  00        BRK
  $ADE0  00        BRK
  $ADE1  18        CLC
  $ADE2  18        CLC
  $ADE3  08        PHP
  $ADE4  10 00     BPL $ADE6

L_ADE6:
  $ADE6  00        BRK
  $ADE7  00        BRK
  $ADE8  00        BRK
  $ADE9  00        BRK
  $ADEA  00        BRK
  $ADEB  00        BRK
  $ADEC  00        BRK
  $ADED  00        BRK
  $ADEE  00        BRK
  $ADEF  00        BRK
  $ADF0  00        BRK
  $ADF1  0C        .db $0C
  $ADF2  0C        .db $0C
  $ADF3  1C        .db $1C
  $ADF4  18        CLC
  $ADF5  10 00     BPL $ADF7

L_ADF7:
  $ADF7  30 00     BMI $ADF9

L_ADF9:
  $ADF9  00        BRK
  $ADFA  00        BRK

L_ADFB:
  $ADFB  00        BRK
  $ADFC  00        BRK

L_ADFD:
  $ADFD  00        BRK

L_ADFE:
  $ADFE  00        BRK

L_ADFF:
  $ADFF  00        BRK
  $AE00  52        .db $52
  $AE01  52        .db $52
  $AE02  52        .db $52
  $AE03  52        .db $52
  $AE04  52        .db $52
  $AE05  52        .db $52
  $AE06  52        .db $52
  $AE07  52        .db $52
  $AE08  2F        .db $2F
  $AE09  2F        .db $2F
  $AE0A  2F        .db $2F
  $AE0B  2F        .db $2F

L_AE0C:
  $AE0C  2F        .db $2F
  $AE0D  2F        .db $2F

L_AE0E:
  $AE0E  2F        .db $2F
  $AE0F  2F        .db $2F

L_AE10:
  $AE10  52        .db $52
  $AE11  52        .db $52
  $AE12  52        .db $52
  $AE13  52        .db $52
  $AE14  52        .db $52
  $AE15  52        .db $52
  $AE16  52        .db $52
  $AE17  52        .db $52
  $AE18  2F        .db $2F
  $AE19  2F        .db $2F
  $AE1A  2F        .db $2F
  $AE1B  2F        .db $2F
  $AE1C  2F        .db $2F
  $AE1D  2F        .db $2F
  $AE1E  2F        .db $2F
  $AE1F  2F        .db $2F
  $AE20  2E 2E 2E  ROL $2E2E
  $AE23  2E 2E 2E  ROL $2E2E
  $AE26  2E 2E D0  ROL $D02E
  $AE29  D0 D0     BNE $ADFB
  $AE2B  D0 D0     BNE $ADFD
  $AE2D  D0 D0     BNE $ADFF
  $AE2F  D0 2E     BNE $AE5F
  $AE31  2E 2E 2E  ROL $2E2E
  $AE34  2E 2E 2E  ROL $2E2E
  $AE37  2E D0 D0  ROL $D0D0
  $AE3A  D0 D0     BNE $AE0C
  $AE3C  D0 D0     BNE $AE0E
  $AE3E  D0 D0     BNE $AE10
  $AE40  80        .db $80
  $AE41  80        .db $80
  $AE42  80        .db $80
  $AE43  80        .db $80
  $AE44  80        .db $80
  $AE45  80        .db $80
  $AE46  80        .db $80
  $AE47  80        .db $80
  $AE48  FF        .db $FF
  $AE49  FF        .db $FF
  $AE4A  FF        .db $FF
  $AE4B  FF        .db $FF
  $AE4C  FF        .db $FF
  $AE4D  FF        .db $FF
  $AE4E  FF        .db $FF
  $AE4F  FF        .db $FF
  $AE50  80        .db $80
  $AE51  80        .db $80
  $AE52  80        .db $80
  $AE53  80        .db $80
  $AE54  80        .db $80
  $AE55  80        .db $80
  $AE56  80        .db $80
  $AE57  80        .db $80
  $AE58  FF        .db $FF
  $AE59  FF        .db $FF
  $AE5A  FF        .db $FF
  $AE5B  FF        .db $FF
  $AE5C  FF        .db $FF
  $AE5D  FF        .db $FF
  $AE5E  FF        .db $FF

L_AE5F:
  $AE5F  FF        .db $FF
  $AE60  00        BRK
  $AE61  00        BRK
  $AE62  00        BRK
  $AE63  00        BRK
  $AE64  00        BRK
  $AE65  00        BRK
  $AE66  00        BRK
  $AE67  00        BRK
  $AE68  FF        .db $FF
  $AE69  FF        .db $FF
  $AE6A  FF        .db $FF
  $AE6B  FF        .db $FF
  $AE6C  FF        .db $FF
  $AE6D  FF        .db $FF
  $AE6E  FF        .db $FF
  $AE6F  FF        .db $FF
  $AE70  00        BRK
  $AE71  00        BRK
  $AE72  00        BRK
  $AE73  00        BRK
  $AE74  00        BRK
  $AE75  00        BRK
  $AE76  00        BRK
  $AE77  00        BRK
  $AE78  FF        .db $FF
  $AE79  FF        .db $FF
  $AE7A  FF        .db $FF
  $AE7B  FF        .db $FF
  $AE7C  FF        .db $FF
  $AE7D  FF        .db $FF
  $AE7E  FF        .db $FF
  $AE7F  FF        .db $FF
  $AE80  C2        .db $C2
  $AE81  C2        .db $C2
  $AE82  C2        .db $C2
  $AE83  C2        .db $C2
  $AE84  C2        .db $C2
  $AE85  C2        .db $C2
  $AE86  C2        .db $C2
  $AE87  C2        .db $C2
  $AE88  00        BRK
  $AE89  00        BRK
  $AE8A  00        BRK
  $AE8B  00        BRK
  $AE8C  00        BRK
  $AE8D  00        BRK
  $AE8E  00        BRK
  $AE8F  00        BRK
  $AE90  C2        .db $C2
  $AE91  C2        .db $C2
  $AE92  C2        .db $C2
  $AE93  C2        .db $C2
  $AE94  C2        .db $C2
  $AE95  C2        .db $C2
  $AE96  C2        .db $C2
  $AE97  C2        .db $C2
  $AE98  00        BRK
  $AE99  00        BRK
  $AE9A  00        BRK
  $AE9B  00        BRK
  $AE9C  00        BRK
  $AE9D  00        BRK
  $AE9E  00        BRK
  $AE9F  00        BRK
  $AEA0  10 10     BPL $AEB2
  $AEA2  10 10     BPL $AEB4
  $AEA4  10 10     BPL $AEB6
  $AEA6  10 10     BPL $AEB8
  $AEA8  00        BRK
  $AEA9  00        BRK
  $AEAA  00        BRK
  $AEAB  00        BRK
  $AEAC  00        BRK
  $AEAD  00        BRK
  $AEAE  00        BRK
  $AEAF  00        BRK
  $AEB0  10 10     BPL $AEC2

L_AEB2:
  $AEB2  10 10     BPL $AEC4

L_AEB4:
  $AEB4  10 10     BPL $AEC6

L_AEB6:
  $AEB6  10 10     BPL $AEC8

L_AEB8:
  $AEB8  00        BRK
  $AEB9  00        BRK
  $AEBA  00        BRK
  $AEBB  00        BRK
  $AEBC  00        BRK
  $AEBD  00        BRK
  $AEBE  00        BRK
  $AEBF  00        BRK
  $AEC0  FF        .db $FF
  $AEC1  00        BRK

L_AEC2:
  $AEC2  00        BRK
  $AEC3  18        CLC

L_AEC4:
  $AEC4  18        CLC
  $AEC5  FF        .db $FF

L_AEC6:
  $AEC6  FF        .db $FF
  $AEC7  00        BRK

L_AEC8:
  $AEC8  FF        .db $FF
  $AEC9  FF        .db $FF
  $AECA  FF        .db $FF
  $AECB  00        BRK

L_AECC:
  $AECC  00        BRK
  $AECD  00        BRK
  $AECE  FF        .db $FF
  $AECF  FF        .db $FF
  $AED0  00        BRK
  $AED1  00        BRK
  $AED2  00        BRK
  $AED3  00        BRK
  $AED4  00        BRK
  $AED5  FF        .db $FF
  $AED6  FF        .db $FF
  $AED7  FF        .db $FF
  $AED8  FF        .db $FF
  $AED9  FF        .db $FF
  $AEDA  FF        .db $FF
  $AEDB  FF        .db $FF
  $AEDC  FF        .db $FF
  $AEDD  00        BRK
  $AEDE  00        BRK
  $AEDF  00        BRK
  $AEE0  00        BRK
  $AEE1  52        .db $52
  $AEE2  52        .db $52
  $AEE3  52        .db $52
  $AEE4  00        BRK
  $AEE5  15 15     ORA $15,X
  $AEE7  52        .db $52
  $AEE8  00        BRK
  $AEE9  2F        .db $2F
  $AEEA  2F        .db $2F
  $AEEB  2F        .db $2F
  $AEEC  00        BRK
  $AEED  00        BRK
  $AEEE  00        BRK
  $AEEF  2F        .db $2F
  $AEF0  00        BRK
  $AEF1  2E 2E 2E  ROL $2E2E
  $AEF4  00        BRK
  $AEF5  50 50     BVC $AF47
  $AEF7  2E 00 D0  ROL $D000
  $AEFA  D0 D0     BNE $AECC
  $AEFC  00        BRK
  $AEFD  00        BRK
  $AEFE  00        BRK
  $AEFF  D0 1F     BNE $AF20
  $AF01  20 40 80  JSR $8040
  $AF04  80        .db $80
  $AF05  80        .db $80
  $AF06  80        .db $80
  $AF07  80        .db $80
  $AF08  3F        .db $3F
  $AF09  7F        .db $7F
  $AF0A  FF        .db $FF
  $AF0B  FF        .db $FF
  $AF0C  FF        .db $FF
  $AF0D  FF        .db $FF
  $AF0E  FF        .db $FF
  $AF0F  FF        .db $FF
  $AF10  80        .db $80
  $AF11  80        .db $80
  $AF12  80        .db $80
  $AF13  80        .db $80
  $AF14  80        .db $80
  $AF15  80        .db $80
  $AF16  80        .db $80
  $AF17  80        .db $80
  $AF18  FF        .db $FF
  $AF19  FF        .db $FF
  $AF1A  FF        .db $FF
  $AF1B  FF        .db $FF
  $AF1C  FF        .db $FF
  $AF1D  FF        .db $FF
  $AF1E  FF        .db $FF
  $AF1F  FF        .db $FF

L_AF20:
  $AF20  FF        .db $FF
  $AF21  00        BRK
  $AF22  00        BRK
  $AF23  00        BRK
  $AF24  00        BRK
  $AF25  00        BRK
  $AF26  00        BRK
  $AF27  00        BRK
  $AF28  FF        .db $FF
  $AF29  FF        .db $FF
  $AF2A  FF        .db $FF
  $AF2B  FF        .db $FF
  $AF2C  FF        .db $FF
  $AF2D  FF        .db $FF
  $AF2E  FF        .db $FF
  $AF2F  FF        .db $FF
  $AF30  00        BRK
  $AF31  00        BRK
  $AF32  00        BRK
  $AF33  00        BRK
  $AF34  00        BRK
  $AF35  00        BRK
  $AF36  00        BRK
  $AF37  00        BRK
  $AF38  FF        .db $FF
  $AF39  FF        .db $FF
  $AF3A  FF        .db $FF
  $AF3B  FF        .db $FF
  $AF3C  FF        .db $FF
  $AF3D  FF        .db $FF
  $AF3E  FF        .db $FF
  $AF3F  FF        .db $FF
  $AF40  00        BRK
  $AF41  3F        .db $3F
  $AF42  20 20 20  JSR $2020
  $AF45  23        .db $23
  $AF46  23        .db $23

L_AF47:
  $AF47  23        .db $23
  $AF48  00        BRK
  $AF49  00        BRK
  $AF4A  1F        .db $1F
  $AF4B  1F        .db $1F
  $AF4C  1F        .db $1F
  $AF4D  1F        .db $1F
  $AF4E  1F        .db $1F
  $AF4F  1C        .db $1C
  $AF50  20 20 20  JSR $2020
  $AF53  20 20 20  JSR $2020
  $AF56  20 20 1F  JSR $1F20
  $AF59  1F        .db $1F
  $AF5A  11 1F     ORA ($1F),Y
  $AF5C  11 1F     ORA ($1F),Y
  $AF5E  11 1F     ORA ($1F),Y
  $AF60  00        BRK
  $AF61  FE 02 02  INC $0202,X
  $AF64  02        .db $02
  $AF65  E2        .db $E2
  $AF66  E2        .db $E2
  $AF67  E2        .db $E2
  $AF68  00        BRK
  $AF69  00        BRK
  $AF6A  FC        .db $FC
  $AF6B  FC        .db $FC
  $AF6C  FC        .db $FC
  $AF6D  DC        .db $DC
  $AF6E  DC        .db $DC
  $AF6F  1C        .db $1C
  $AF70  02        .db $02
  $AF71  12        .db $12
  $AF72  0A        ASL
  $AF73  02        .db $02
  $AF74  02        .db $02
  $AF75  02        .db $02
  $AF76  02        .db $02
  $AF77  02        .db $02
  $AF78  FC        .db $FC
  $AF79  F4        .db $F4
  $AF7A  E4 FC     CPX $FC
  $AF7C  FC        .db $FC
  $AF7D  FC        .db $FC
  $AF7E  FC        .db $FC
  $AF7F  FC        .db $FC
  $AF80  A0 01     LDY #$01
  $AF82  80        .db $80
  $AF83  00        BRK
  $AF84  00        BRK
  $AF85  00        BRK
  $AF86  00        BRK
  $AF87  02        .db $02
  $AF88  88        DEY
  $AF89  20 08 00  JSR $0008
  $AF8C  21 00     AND ($00,X)
  $AF8E  00        BRK
  $AF8F  00        BRK
  $AF90  00        BRK
  $AF91  01 00     ORA ($00,X)
  $AF93  00        BRK
  $AF94  00        BRK
  $AF95  00        BRK
  $AF96  88        DEY
  $AF97  20 00 00  JSR $0000
  $AF9A  00        BRK
  $AF9B  04        .db $04
  $AF9C  00        BRK
  $AF9D  00        BRK
  $AF9E  00        BRK
  $AF9F  00        BRK
  $AFA0  45 00     EOR $00
  $AFA2  40        RTI
  $AFA3  14        .db $14
  $AFA4  02        .db $02
  $AFA5  50 00     BVC $AFA7

L_AFA7:
  $AFA7  00        BRK
  $AFA8  40        RTI
  $AFA9  10 01     BPL $AFAC
  $AFAB  04        .db $04

L_AFAC:
  $AFAC  08        PHP
  $AFAD  00        BRK
  $AFAE  00        BRK
  $AFAF  80        .db $80
  $AFB0  00        BRK
  $AFB1  00        BRK
  $AFB2  00        BRK
  $AFB3  00        BRK
  $AFB4  00        BRK
  $AFB5  80        .db $80
  $AFB6  12        .db $12
  $AFB7  00        BRK
  $AFB8  00        BRK
  $AFB9  00        BRK
  $AFBA  00        BRK
  $AFBB  00        BRK
  $AFBC  00        BRK
  $AFBD  00        BRK
  $AFBE  00        BRK
  $AFBF  00        BRK
  $AFC0  00        BRK
  $AFC1  00        BRK
  $AFC2  00        BRK
  $AFC3  00        BRK
  $AFC4  00        BRK
  $AFC5  00        BRK
  $AFC6  00        BRK
  $AFC7  00        BRK
  $AFC8  00        BRK
  $AFC9  00        BRK
  $AFCA  00        BRK
  $AFCB  00        BRK
  $AFCC  00        BRK
  $AFCD  00        BRK
  $AFCE  00        BRK
  $AFCF  00        BRK
  $AFD0  00        BRK
  $AFD1  40        RTI
  $AFD2  00        BRK
  $AFD3  00        BRK
  $AFD4  04        .db $04
  $AFD5  00        BRK
  $AFD6  00        BRK
  $AFD7  42        .db $42
  $AFD8  00        BRK
  $AFD9  00        BRK
  $AFDA  00        BRK
  $AFDB  20 00 80  JSR $8000
  $AFDE  08        PHP
  $AFDF  00        BRK
  $AFE0  00        BRK
  $AFE1  00        BRK
  $AFE2  00        BRK
  $AFE3  00        BRK
  $AFE4  00        BRK
  $AFE5  00        BRK
  $AFE6  00        BRK
  $AFE7  00        BRK
  $AFE8  00        BRK
  $AFE9  00        BRK
  $AFEA  00        BRK
  $AFEB  00        BRK
  $AFEC  00        BRK
  $AFED  00        BRK
  $AFEE  00        BRK
  $AFEF  00        BRK
  $AFF0  00        BRK
  $AFF1  01 00     ORA ($00,X)
  $AFF3  00        BRK
  $AFF4  10 01     BPL $AFF7
  $AFF6  04        .db $04

L_AFF7:
  $AFF7  00        BRK
  $AFF8  00        BRK
  $AFF9  00        BRK
  $AFFA  00        BRK
  $AFFB  82        .db $82
  $AFFC  00        BRK
  $AFFD  00        BRK
  $AFFE  40        RTI
  $AFFF  00        BRK
  $B000  00        BRK
  $B001  00        BRK
  $B002  00        BRK
  $B003  00        BRK
  $B004  00        BRK
  $B005  00        BRK
  $B006  00        BRK
  $B007  00        BRK
  $B008  00        BRK
  $B009  00        BRK
  $B00A  00        BRK
  $B00B  00        BRK
  $B00C  00        BRK
  $B00D  00        BRK
  $B00E  00        BRK
  $B00F  00        BRK
  $B010  7C        .db $7C
  $B011  FC        .db $FC
  $B012  FC        .db $FC
  $B013  FC        .db $FC
  $B014  FC        .db $FC
  $B015  00        BRK
  $B016  FC        .db $FC
  $B017  00        BRK
  $B018  7C        .db $7C
  $B019  02        .db $02
  $B01A  FE 02 02  INC $0202,X
  $B01D  FE 02 FE  INC $FE02,X
  $B020  00        BRK
  $B021  00        BRK
  $B022  00        BRK
  $B023  00        BRK
  $B024  01 00     ORA ($00,X)
  $B026  07        .db $07
  $B027  00        BRK
  $B028  00        BRK
  $B029  00        BRK
  $B02A  00        BRK
  $B02B  01 06     ORA ($06,X)
  $B02D  0F        .db $0F
  $B02E  38        SEC
  $B02F  FF        .db $FF
  $B030  07        .db $07
  $B031  0F        .db $0F
  $B032  3F        .db $3F
  $B033  FF        .db $FF

L_B034:
  $B034  FF        .db $FF

L_B035:
  $B035  00        BRK
  $B036  FF        .db $FF
  $B037  00        BRK
  $B038  0F        .db $0F
  $B039  30 FF     BMI $B03A
  $B03B  00        BRK
  $B03C  00        BRK
  $B03D  FF        .db $FF
  $B03E  00        BRK
  $B03F  FF        .db $FF
  $B040  C0 C0     CPY #$C0
  $B042  C1 C3     CMP ($C3,X)
  $B044  83        .db $83
  $B045  00        BRK
  $B046  07        .db $07
  $B047  00        BRK
  $B048  C0 23     CPY #$23
  $B04A  E3        .db $E3
  $B04B  24 44     BIT $44
  $B04D  CF        .db $CF
  $B04E  88        DEY
  $B04F  9F        .db $9F
  $B050  7F        .db $7F
  $B051  FF        .db $FF
  $B052  F0 E0     BEQ $B034
  $B054  E0 00     CPX #$00
  $B056  C0 00     CPY #$00
  $B058  FF        .db $FF
  $B059  00        BRK
  $B05A  FF        .db $FF
  $B05B  10 10     BPL $B06D
  $B05D  E0 20     CPX #$20
  $B05F  FF        .db $FF
  $B060  E0 E0     CPX #$E0
  $B062  01 01     ORA ($01,X)

L_B064:
  $B064  03        .db $03
  $B065  00        BRK
  $B066  03        .db $03
  $B067  00        BRK
  $B068  F0 11     BEQ $B07B
  $B06A  F3        .db $F3
  $B06B  02        .db $02
  $B06C  04        .db $04

L_B06D:
  $B06D  07        .db $07
  $B06E  04        .db $04
  $B06F  F7        .db $F7
  $B070  7F        .db $7F
  $B071  FF        .db $FF
  $B072  F0 F0     BEQ $B064
  $B074  F0 00     BEQ $B076

L_B076:
  $B076  F8        SED
  $B077  00        BRK
  $B078  FF        .db $FF
  $B079  00        BRK
  $B07A  FF        .db $FF

L_B07B:
  $B07B  08        PHP
  $B07C  08        PHP
  $B07D  FC        .db $FC
  $B07E  04        .db $04
  $B07F  FD E0 F0  SBC $F0E0,X
  $B082  00        BRK
  $B083  00        BRK
  $B084  00        BRK
  $B085  00        BRK
  $B086  00        BRK
  $B087  01 F0     ORA ($F0,X)
  $B089  08        PHP
  $B08A  FC        .db $FC
  $B08B  00        BRK
  $B08C  00        BRK
  $B08D  00        BRK
  $B08E  00        BRK
  $B08F  FF        .db $FF
  $B090  1F        .db $1F
  $B091  1F        .db $1F
  $B092  1F        .db $1F
  $B093  1F        .db $1F
  $B094  0F        .db $0F
  $B095  00        BRK
  $B096  07        .db $07
  $B097  00        BRK
  $B098  1F        .db $1F
  $B099  20 3F 20  JSR $203F
  $B09C  10 1F     BPL $B0BD
  $B09E  18        CLC
  $B09F  0F        .db $0F
  $B0A0  FE FF FF  INC $FFFF,X
  $B0A3  8F        .db $8F
  $B0A4  07        .db $07
  $B0A5  00        BRK
  $B0A6  81 00     STA ($00,X)
  $B0A8  FF        .db $FF
  $B0A9  00        BRK
  $B0AA  FF        .db $FF
  $B0AB  70 88     BVS $B035
  $B0AD  87        .db $87
  $B0AE  42        .db $42
  $B0AF  C1 00     CMP ($00,X)
  $B0B1  00        BRK
  $B0B2  C0 E0     CPY #$E0
  $B0B4  F0 00     BEQ $B0B6

L_B0B6:
  $B0B6  FC        .db $FC
  $B0B7  00        BRK
  $B0B8  00        BRK
  $B0B9  C0 E0     CPY #$E0
  $B0BB  10 08     BPL $B0C5

L_B0BD:
  $B0BD  FC        .db $FC

L_B0BE:
  $B0BE  02        .db $02
  $B0BF  FF        .db $FF
  $B0C0  00        BRK
  $B0C1  00        BRK
  $B0C2  01 03     ORA ($03,X)
  $B0C4  07        .db $07

L_B0C5:
  $B0C5  0F        .db $0F
  $B0C6  00        BRK
  $B0C7  3E 00 01  ROL $0100,X
  $B0CA  03        .db $03
  $B0CB  04        .db $04
  $B0CC  0F        .db $0F
  $B0CD  10 3F     BPL $B10E
  $B0CF  41 45     EOR ($45,X)
  $B0D1  F9 F1 E1  SBC $E1F1,Y
  $B0D4  C1 81     CMP ($81,X)
  $B0D6  04        .db $04
  $B0D7  0D FF FF  ORA $FFFF
  $B0DA  FB        .db $FB
  $B0DB  12        .db $12
  $B0DC  E3        .db $E3
  $B0DD  42        .db $42
  $B0DE  87        .db $87
  $B0DF  0E 04 FF  ASL $FF04
  $B0E2  FF        .db $FF
  $B0E3  FF        .db $FF
  $B0E4  FE FD 03  INC $03FD,X
  $B0E7  EF        .db $EF
  $B0E8  FF        .db $FF
  $B0E9  FF        .db $FF
  $B0EA  FF        .db $FF
  $B0EB  00        BRK
  $B0EC  FF        .db $FF
  $B0ED  03        .db $03
  $B0EE  FF        .db $FF
  $B0EF  1F        .db $1F
  $B0F0  92        .db $92
  $B0F1  E7        .db $E7
  $B0F2  C7        .db $C7
  $B0F3  07        .db $07
  $B0F4  8F        .db $8F
  $B0F5  8F        .db $8F
  $B0F6  80        .db $80
  $B0F7  9F        .db $9F
  $B0F8  FF        .db $FF
  $B0F9  FF        .db $FF
  $B0FA  6F        .db $6F
  $B0FB  C8        INY
  $B0FC  9F        .db $9F
  $B0FD  90 BF     BCC $B0BE
  $B0FF  A0 02     LDY #$02
  $B101  FE FD FD  INC $FDFD,X
  $B104  FB        .db $FB
  $B105  FB        .db $FB
  $B106  07        .db $07
  $B107  F7        .db $F7
  $B108  FF        .db $FF
  $B109  FF        .db $FF
  $B10A  FF        .db $FF
  $B10B  03        .db $03
  $B10C  FF        .db $FF
  $B10D  07        .db $07

L_B10E:
  $B10E  FF        .db $FF
  $B10F  0F        .db $0F
  $B110  08        PHP
  $B111  EF        .db $EF
  $B112  DF        .db $DF
  $B113  DF        .db $DF
  $B114  BF        .db $BF
  $B115  BF        .db $BF
  $B116  80        .db $80
  $B117  7F        .db $7F
  $B118  1F        .db $1F
  $B119  FF        .db $FF
  $B11A  FF        .db $FF
  $B11B  E0 FF     CPX #$FF
  $B11D  C0 FF     CPY #$FF
  $B11F  80        .db $80
  $B120  00        BRK
  $B121  FF        .db $FF
  $B122  C0 BF     CPY #$BF
  $B124  BF        .db $BF
  $B125  78        SEI
  $B126  70 7F     BVS $B1A7
  $B128  FF        .db $FF
  $B129  FF        .db $FF
  $B12A  FF        .db $FF
  $B12B  7F        .db $7F
  $B12C  FF        .db $FF
  $B12D  F8        SED
  $B12E  F0 FF     BEQ $B12F
  $B130  22        .db $22
  $B131  EB        .db $EB
  $B132  0B        .db $0B
  $B133  EB        .db $EB
  $B134  EB        .db $EB
  $B135  0B        .db $0B
  $B136  08        PHP
  $B137  EB        .db $EB
  $B138  F7        .db $F7
  $B139  FF        .db $FF
  $B13A  FF        .db $FF
  $B13B  EC EF 0C  CPX $0CEF
  $B13E  0F        .db $0F
  $B13F  EC 08 FA  CPX $FA08
  $B142  FD FD FD  SBC $FDFD,X
  $B145  FE 00 FE  INC $FE00,X
  $B148  FD FF FF  SBC $FFFF,X
  $B14B  03        .db $03
  $B14C  FF        .db $FF
  $B14D  01 FF     ORA ($FF,X)
  $B14F  01 82     ORA ($82,X)
  $B151  FF        .db $FF
  $B152  3F        .db $3F
  $B153  DF        .db $DF
  $B154  DF        .db $DF
  $B155  EF        .db $EF
  $B156  E0 F7     CPX #$F7
  $B158  FF        .db $FF
  $B159  FF        .db $FF
  $B15A  FF        .db $FF
  $B15B  E0 FF     CPX #$FF
  $B15D  F0 FF     BEQ $B15E
  $B15F  F8        SED
  $B160  F4        .db $F4
  $B161  7B        .db $7B
  $B162  BB        .db $BB
  $B163  BD DD EE  LDA $EEDD,X
  $B166  0E F7 FF  ASL $FFF7
  $B169  FF        .db $FF
  $B16A  FF        .db $FF
  $B16B  7E FF 1F  ROR $1FFF,X
  $B16E  FF        .db $FF
  $B16F  0F        .db $0F
  $B170  58        CLI
  $B171  DE EF E0  DEC $E0EF,X
  $B174  FF        .db $FF
  $B175  FF        .db $FF
  $B176  00        BRK
  $B177  7B        .db $7B
  $B178  F9 FE FF  SBC $FFFE,Y
  $B17B  1F        .db $1F
  $B17C  FF        .db $FF
  $B17D  00        BRK
  $B17E  FF        .db $FF
  $B17F  87        .db $87
  $B180  81 7F     STA ($7F,X)
  $B182  3F        .db $3F
  $B183  3F        .db $3F
  $B184  FF        .db $FF
  $B185  FF        .db $FF
  $B186  00        BRK
  $B187  FB        .db $FB
  $B188  FF        .db $FF
  $B189  FF        .db $FF
  $B18A  7F        .db $7F
  $B18B  C0 FF     CPY #$FF
  $B18D  00        BRK

L_B18E:
  $B18E  FF        .db $FF
  $B18F  FC        .db $FC
  $B190  00        BRK
  $B191  80        .db $80
  $B192  C0 E0     CPY #$E0
  $B194  F0 F8     BEQ $B18E
  $B196  00        BRK
  $B197  FE 80 C0  INC $C080,X
  $B19A  E0 10     CPX #$10
  $B19C  F8        SED
  $B19D  04        .db $04

L_B19E:
  $B19E  FE 01 00  INC $0001,X
  $B1A1  00        BRK
  $B1A2  00        BRK
  $B1A3  00        BRK
  $B1A4  00        BRK
  $B1A5  00        BRK
  $B1A6  00        BRK

L_B1A7:
  $B1A7  00        BRK
  $B1A8  00        BRK
  $B1A9  01 03     ORA ($03,X)
  $B1AB  07        .db $07
  $B1AC  0F        .db $0F
  $B1AD  00        BRK
  $B1AE  00        BRK

L_B1AF:
  $B1AF  7F        .db $7F
  $B1B0  7C        .db $7C
  $B1B1  00        BRK
  $B1B2  00        BRK
  $B1B3  00        BRK
  $B1B4  01 03     ORA ($03,X)
  $B1B6  07        .db $07
  $B1B7  03        .db $03
  $B1B8  82        .db $82
  $B1B9  FC        .db $FC
  $B1BA  F8        SED
  $B1BB  F0 E1     BEQ $B19E
  $B1BD  03        .db $03
  $B1BE  07        .db $07
  $B1BF  FF        .db $FF
  $B1C0  1D 3C 7C  ORA $7C3C,X
  $B1C3  FC        .db $FC
  $B1C4  F8        SED
  $B1C5  F0 E0     BEQ $B1A7
  $B1C7  C0 1E     CPY #$1E
  $B1C9  3F        .db $3F
  $B1CA  7F        .db $7F
  $B1CB  FC        .db $FC
  $B1CC  F8        SED
  $B1CD  F0 E0     BEQ $B1AF
  $B1CF  C0 9F     CPY #$9F
  $B1D1  7F        .db $7F
  $B1D2  FF        .db $FF
  $B1D3  FE FE FF  INC $FFFE,X
  $B1D6  FE FC 7F  INC $7FFC,X
  $B1D9  FF        .db $FF
  $B1DA  FF        .db $FF
  $B1DB  FF        .db $FF
  $B1DC  FF        .db $FF
  $B1DD  FF        .db $FF
  $B1DE  FE FC BF  INC $BFFC,X
  $B1E1  00        BRK
  $B1E2  00        BRK
  $B1E3  00        BRK
  $B1E4  00        BRK
  $B1E5  8F        .db $8F
  $B1E6  0F        .db $0F
  $B1E7  00        BRK
  $B1E8  C0 FF     CPY #$FF
  $B1EA  FF        .db $FF
  $B1EB  FF        .db $FF
  $B1EC  FF        .db $FF
  $B1ED  8F        .db $8F
  $B1EE  0F        .db $0F
  $B1EF  FF        .db $FF
  $B1F0  F7        .db $F7
  $B1F1  0F        .db $0F
  $B1F2  0E 1E 1E  ASL $1E1E
  $B1F5  FE FC 00  INC $00FC,X
  $B1F8  0F        .db $0F
  $B1F9  FF        .db $FF
  $B1FA  FF        .db $FF
  $B1FB  FF        .db $FF
  $B1FC  FF        .db $FF
  $B1FD  FE FC FC  INC $FCFC,X
  $B200  7E 00 00  ROR $0000,X
  $B203  00        BRK
  $B204  00        BRK
  $B205  3F        .db $3F
  $B206  3F        .db $3F
  $B207  7F        .db $7F
  $B208  81 FF     STA ($FF,X)
  $B20A  FF        .db $FF
  $B20B  FF        .db $FF
  $B20C  FF        .db $FF
  $B20D  3F        .db $3F
  $B20E  3F        .db $3F
  $B20F  7F        .db $7F
  $B210  FF        .db $FF
  $B211  00        BRK
  $B212  00        BRK
  $B213  00        BRK
  $B214  00        BRK
  $B215  C0 C0     CPY #$C0
  $B217  00        BRK
  $B218  FF        .db $FF
  $B219  FF        .db $FF
  $B21A  FF        .db $FF
  $B21B  FF        .db $FF
  $B21C  FF        .db $FF
  $B21D  C0 C0     CPY #$C0
  $B21F  FF        .db $FF
  $B220  E5 04     SBC $04
  $B222  06 03     ASL $03
  $B224  03        .db $03
  $B225  03        .db $03
  $B226  03        .db $03
  $B227  00        BRK
  $B228  E6 F7     INC $F7
  $B22A  F7        .db $F7
  $B22B  F3        .db $F3
  $B22C  F3        .db $F3
  $B22D  03        .db $03
  $B22E  03        .db $03
  $B22F  FF        .db $FF
  $B230  FE 00 00  INC $0000,X
  $B233  00        BRK
  $B234  C0 FE     CPY #$FE
  $B236  FE 3F 01  INC $013F,X
  $B239  FF        .db $FF
  $B23A  FF        .db $FF
  $B23B  FF        .db $FF
  $B23C  FF        .db $FF
  $B23D  FE FE FF  INC $FFFE,X
  $B240  F7        .db $F7
  $B241  60        RTS
  $B242  00        BRK
  $B243  00        BRK
  $B244  00        BRK
  $B245  3F        .db $3F
  $B246  3F        .db $3F
  $B247  30 78     BMI $B2C1
  $B249  BF        .db $BF
  $B24A  FF        .db $FF
  $B24B  FF        .db $FF
  $B24C  FF        .db $FF
  $B24D  3F        .db $3F
  $B24E  3F        .db $3F
  $B24F  3F        .db $3F
  $B250  F7        .db $F7
  $B251  03        .db $03
  $B252  01 00     ORA ($00,X)
  $B254  00        BRK
  $B255  C7        .db $C7
  $B256  E7        .db $E7
  $B257  00        BRK
  $B258  0F        .db $0F
  $B259  FF        .db $FF
  $B25A  FF        .db $FF
  $B25B  FF        .db $FF
  $B25C  FF        .db $FF
  $B25D  C7        .db $C7
  $B25E  E7        .db $E7
  $B25F  FF        .db $FF
  $B260  7B        .db $7B
  $B261  81 81     STA ($81,X)
  $B263  C0 C0     CPY #$C0
  $B265  FF        .db $FF
  $B266  FF        .db $FF
  $B267  3C        .db $3C
  $B268  87        .db $87
  $B269  FF        .db $FF
  $B26A  FF        .db $FF
  $B26B  FF        .db $FF
  $B26C  FF        .db $FF
  $B26D  FF        .db $FF
  $B26E  FF        .db $FF
  $B26F  FC        .db $FC
  $B270  FD FE FF  SBC $FFFE,X
  $B273  FF        .db $FF
  $B274  7F        .db $7F
  $B275  FF        .db $FF
  $B276  FF        .db $FF
  $B277  3F        .db $3F

L_B278:
  $B278  FE FF FF  INC $FFFF,X
  $B27B  FF        .db $FF
  $B27C  FF        .db $FF
  $B27D  FF        .db $FF
  $B27E  FF        .db $FF
  $B27F  3F        .db $3F
  $B280  FF        .db $FF
  $B281  00        BRK
  $B282  00        BRK
  $B283  80        .db $80
  $B284  C0 E0     CPY #$E0
  $B286  F0 F0     BEQ $B278
  $B288  00        BRK
  $B289  FF        .db $FF
  $B28A  FF        .db $FF
  $B28B  FF        .db $FF
  $B28C  FF        .db $FF
  $B28D  E0 F0     CPX #$F0
  $B28F  FF        .db $FF
  $B290  00        BRK
  $B291  00        BRK
  $B292  00        BRK
  $B293  00        BRK
  $B294  00        BRK

L_B295:
  $B295  00        BRK
  $B296  00        BRK
  $B297  00        BRK
  $B298  80        .db $80
  $B299  C0 E0     CPY #$E0
  $B29B  F0 F8     BEQ $B295
  $B29D  00        BRK
  $B29E  00        BRK
  $B29F  FF        .db $FF
  $B2A0  00        BRK
  $B2A1  00        BRK
  $B2A2  00        BRK
  $B2A3  00        BRK
  $B2A4  00        BRK
  $B2A5  00        BRK
  $B2A6  00        BRK
  $B2A7  00        BRK
  $B2A8  01 03     ORA ($03,X)
  $B2AA  07        .db $07
  $B2AB  0F        .db $0F
  $B2AC  1F        .db $1F
  $B2AD  3F        .db $3F
  $B2AE  7F        .db $7F
  $B2AF  FF        .db $FF
  $B2B0  00        BRK
  $B2B1  00        BRK
  $B2B2  00        BRK
  $B2B3  00        BRK
  $B2B4  00        BRK
  $B2B5  00        BRK
  $B2B6  00        BRK
  $B2B7  00        BRK
  $B2B8  FF        .db $FF
  $B2B9  FF        .db $FF
  $B2BA  FF        .db $FF
  $B2BB  FF        .db $FF
  $B2BC  FF        .db $FF
  $B2BD  FF        .db $FF
  $B2BE  FF        .db $FF
  $B2BF  FF        .db $FF
  $B2C0  03        .db $03

L_B2C1:
  $B2C1  03        .db $03

L_B2C2:
  $B2C2  02        .db $02
  $B2C3  00        BRK
  $B2C4  00        BRK
  $B2C5  00        BRK
  $B2C6  00        BRK
  $B2C7  03        .db $03
  $B2C8  FF        .db $FF
  $B2C9  FF        .db $FF
  $B2CA  FE FC FC  INC $FCFC,X
  $B2CD  FC        .db $FC
  $B2CE  FC        .db $FC
  $B2CF  FF        .db $FF
  $B2D0  80        .db $80
  $B2D1  00        BRK
  $B2D2  00        BRK
  $B2D3  00        BRK
  $B2D4  00        BRK
  $B2D5  00        BRK
  $B2D6  00        BRK
  $B2D7  C0 80     CPY #$80
  $B2D9  00        BRK
  $B2DA  00        BRK
  $B2DB  00        BRK
  $B2DC  00        BRK
  $B2DD  01 03     ORA ($03,X)
  $B2DF  CF        .db $CF
  $B2E0  F0 E0     BEQ $B2C2
  $B2E2  80        .db $80
  $B2E3  00        BRK
  $B2E4  00        BRK
  $B2E5  00        BRK
  $B2E6  00        BRK
  $B2E7  00        BRK
  $B2E8  F3        .db $F3
  $B2E9  E7        .db $E7
  $B2EA  9F        .db $9F
  $B2EB  3F        .db $3F
  $B2EC  FF        .db $FF
  $B2ED  FF        .db $FF
  $B2EE  FF        .db $FF

L_B2EF:
  $B2EF  FF        .db $FF
  $B2F0  00        BRK
  $B2F1  00        BRK
  $B2F2  00        BRK
  $B2F3  00        BRK
  $B2F4  00        BRK
  $B2F5  00        BRK
  $B2F6  00        BRK
  $B2F7  00        BRK
  $B2F8  FF        .db $FF
  $B2F9  FF        .db $FF
  $B2FA  FF        .db $FF
  $B2FB  FF        .db $FF
  $B2FC  FF        .db $FF

L_B2FD:
  $B2FD  FF        .db $FF
  $B2FE  FF        .db $FF
  $B2FF  FF        .db $FF
  $B300  00        BRK
  $B301  00        BRK
  $B302  00        BRK
  $B303  00        BRK
  $B304  00        BRK
  $B305  00        BRK
  $B306  00        BRK
  $B307  1C        .db $1C
  $B308  FC        .db $FC
  $B309  F8        SED
  $B30A  F8        SED
  $B30B  F0 F0     BEQ $B2FD
  $B30D  F0 E0     BEQ $B2EF
  $B30F  FC        .db $FC
  $B310  7E 7E FC  ROR $FC7E,X
  $B313  FC        .db $FC
  $B314  F8        SED
  $B315  00        BRK
  $B316  00        BRK
  $B317  00        BRK
  $B318  7F        .db $7F
  $B319  7F        .db $7F
  $B31A  FF        .db $FF
  $B31B  FF        .db $FF
  $B31C  FF        .db $FF
  $B31D  07        .db $07
  $B31E  0F        .db $0F
  $B31F  1F        .db $1F
  $B320  00        BRK
  $B321  00        BRK
  $B322  00        BRK
  $B323  00        BRK
  $B324  00        BRK
  $B325  00        BRK
  $B326  00        BRK
  $B327  00        BRK
  $B328  FF        .db $FF
  $B329  FF        .db $FF
  $B32A  FF        .db $FF
  $B32B  FF        .db $FF
  $B32C  FF        .db $FF
  $B32D  FF        .db $FF
  $B32E  FF        .db $FF
  $B32F  FF        .db $FF
  $B330  00        BRK
  $B331  00        BRK
  $B332  00        BRK
  $B333  00        BRK
  $B334  00        BRK
  $B335  00        BRK
  $B336  00        BRK
  $B337  C0 FF     CPY #$FF
  $B339  FF        .db $FF
  $B33A  FF        .db $FF
  $B33B  FF        .db $FF
  $B33C  FF        .db $FF
  $B33D  FF        .db $FF
  $B33E  FF        .db $FF
  $B33F  FF        .db $FF
  $B340  1F        .db $1F
  $B341  0F        .db $0F
  $B342  0F        .db $0F
  $B343  07        .db $07
  $B344  07        .db $07
  $B345  00        BRK
  $B346  00        BRK
  $B347  00        BRK
  $B348  FF        .db $FF
  $B349  FF        .db $FF
  $B34A  FF        .db $FF
  $B34B  FF        .db $FF
  $B34C  FF        .db $FF
  $B34D  FC        .db $FC
  $B34E  FC        .db $FC
  $B34F  FE 18 F8  INC $F818,X
  $B352  F8        SED
  $B353  FC        .db $FC
  $B354  FC        .db $FC
  $B355  00        BRK
  $B356  1C        .db $1C
  $B357  1E 1F FF  ASL $FF1F,X
  $B35A  FF        .db $FF
  $B35B  FF        .db $FF
  $B35C  FF        .db $FF
  $B35D  03        .db $03
  $B35E  1F        .db $1F
  $B35F  1F        .db $1F
  $B360  00        BRK
  $B361  00        BRK
  $B362  00        BRK
  $B363  00        BRK
  $B364  00        BRK
  $B365  00        BRK
  $B366  00        BRK
  $B367  00        BRK
  $B368  FF        .db $FF
  $B369  FF        .db $FF
  $B36A  FF        .db $FF
  $B36B  FF        .db $FF
  $B36C  FF        .db $FF
  $B36D  FF        .db $FF
  $B36E  FF        .db $FF
  $B36F  FF        .db $FF
  $B370  0E 03 00  ASL $0003
  $B373  00        BRK
  $B374  00        BRK
  $B375  00        BRK
  $B376  00        BRK
  $B377  00        BRK
  $B378  FE FF FF  INC $FFFF,X
  $B37B  FF        .db $FF
  $B37C  FF        .db $FF
  $B37D  FF        .db $FF
  $B37E  FF        .db $FF
  $B37F  FF        .db $FF
  $B380  1F        .db $1F
  $B381  0F        .db $0F
  $B382  07        .db $07
  $B383  07        .db $07
  $B384  00        BRK
  $B385  00        BRK
  $B386  00        BRK
  $B387  00        BRK
  $B388  1F        .db $1F
  $B389  0F        .db $0F

L_B38A:
  $B38A  07        .db $07
  $B38B  C7        .db $C7
  $B38C  F0 FC     BEQ $B38A
  $B38E  FF        .db $FF
  $B38F  FF        .db $FF
  $B390  F0 F8     BEQ $B38A
  $B392  FC        .db $FC
  $B393  FE 00 00  INC $0000,X
  $B396  FF        .db $FF
  $B397  3F        .db $3F
  $B398  FF        .db $FF
  $B399  FF        .db $FF
  $B39A  FF        .db $FF
  $B39B  FF        .db $FF
  $B39C  00        BRK
  $B39D  00        BRK
  $B39E  FF        .db $FF
  $B39F  FF        .db $FF
  $B3A0  00        BRK
  $B3A1  00        BRK
  $B3A2  00        BRK
  $B3A3  00        BRK
  $B3A4  00        BRK
  $B3A5  00        BRK
  $B3A6  C0 E0     CPY #$E0
  $B3A8  FF        .db $FF
  $B3A9  FF        .db $FF
  $B3AA  FF        .db $FF
  $B3AB  FF        .db $FF
  $B3AC  FF        .db $FF
  $B3AD  7F        .db $7F
  $B3AE  FF        .db $FF
  $B3AF  FF        .db $FF
  $B3B0  00        BRK
  $B3B1  00        BRK
  $B3B2  00        BRK
  $B3B3  00        BRK
  $B3B4  00        BRK

L_B3B5:
  $B3B5  00        BRK
  $B3B6  00        BRK
  $B3B7  00        BRK
  $B3B8  80        .db $80
  $B3B9  C0 E0     CPY #$E0
  $B3BB  F0 F8     BEQ $B3B5
  $B3BD  FC        .db $FC
  $B3BE  FE FF 00  INC $00FF,X
  $B3C1  00        BRK
  $B3C2  00        BRK
  $B3C3  00        BRK
  $B3C4  0C        .db $0C
  $B3C5  1F        .db $1F
  $B3C6  3F        .db $3F
  $B3C7  7E 01 03  ROR $0301,X
  $B3CA  07        .db $07
  $B3CB  0F        .db $0F
  $B3CC  1B        .db $1B
  $B3CD  3F        .db $3F
  $B3CE  7F        .db $7F
  $B3CF  81 00     STA ($00,X)
  $B3D1  00        BRK
  $B3D2  00        BRK
  $B3D3  00        BRK
  $B3D4  C1 83     CMP ($83,X)
  $B3D6  07        .db $07
  $B3D7  0F        .db $0F
  $B3D8  FE FC F8  INC $F8FC,X
  $B3DB  F0 61     BEQ $B43E
  $B3DD  C3        .db $C3
  $B3DE  87        .db $87
  $B3DF  0F        .db $0F
  $B3E0  00        BRK
  $B3E1  00        BRK
  $B3E2  00        BRK
  $B3E3  40        RTI
  $B3E4  60        RTS
  $B3E5  7F        .db $7F
  $B3E6  7F        .db $7F
  $B3E7  7F        .db $7F
  $B3E8  FF        .db $FF
  $B3E9  FF        .db $FF
  $B3EA  FF        .db $FF
  $B3EB  FF        .db $FF
  $B3EC  FF        .db $FF
  $B3ED  FF        .db $FF
  $B3EE  FF        .db $FF
  $B3EF  80        .db $80
  $B3F0  03        .db $03
  $B3F1  03        .db $03
  $B3F2  02        .db $02
  $B3F3  00        BRK
  $B3F4  00        BRK
  $B3F5  FF        .db $FF
  $B3F6  FF        .db $FF
  $B3F7  FF        .db $FF
  $B3F8  FF        .db $FF
  $B3F9  FF        .db $FF
  $B3FA  FF        .db $FF
  $B3FB  FF        .db $FF
  $B3FC  FF        .db $FF
  $B3FD  FF        .db $FF
  $B3FE  FF        .db $FF
  $B3FF  00        BRK
  $B400  C0 80     CPY #$80
  $B402  00        BRK
  $B403  00        BRK
  $B404  18        CLC
  $B405  F1 E3     SBC ($E3),Y
  $B407  8F        .db $8F
  $B408  DF        .db $DF
  $B409  FF        .db $FF
  $B40A  FF        .db $FF
  $B40B  FF        .db $FF
  $B40C  FE FD F3  INC $F3FD,X
  $B40F  6F        .db $6F
  $B410  00        BRK
  $B411  00        BRK
  $B412  00        BRK
  $B413  00        BRK
  $B414  50 BF     BVC $B3D5
  $B416  BF        .db $BF
  $B417  7F        .db $7F

L_B418:
  $B418  FF        .db $FF
  $B419  FF        .db $FF
  $B41A  FF        .db $FF
  $B41B  BF        .db $BF
  $B41C  7F        .db $7F
  $B41D  DF        .db $DF
  $B41E  FF        .db $FF
  $B41F  80        .db $80
  $B420  00        BRK
  $B421  00        BRK
  $B422  00        BRK
  $B423  00        BRK
  $B424  01 FF     ORA ($FF,X)
  $B426  FF        .db $FF
  $B427  FE FF FF  INC $FFFF,X
  $B42A  FF        .db $FF
  $B42B  FF        .db $FF
  $B42C  FF        .db $FF
  $B42D  FF        .db $FF

L_B42E:
  $B42E  FF        .db $FF
  $B42F  01 1C     ORA ($1C,X)
  $B431  38        SEC
  $B432  38        SEC
  $B433  38        SEC
  $B434  70 70     BVS $B4A6
  $B436  70 E0     BVS $B418
  $B438  FC        .db $FC
  $B439  F8        SED
  $B43A  F8        SED
  $B43B  F8        SED
  $B43C  F0 F0     BEQ $B42E

L_B43E:
  $B43E  F1 E1     SBC ($E1),Y
  $B440  00        BRK
  $B441  00        BRK
  $B442  00        BRK
  $B443  00        BRK
  $B444  20 7F FF  JSR $FF7F
  $B447  FF        .db $FF
  $B448  1F        .db $1F
  $B449  3F        .db $3F
  $B44A  3F        .db $3F
  $B44B  7F        .db $7F
  $B44C  FF        .db $FF
  $B44D  FF        .db $FF
  $B44E  FF        .db $FF
  $B44F  00        BRK
  $B450  00        BRK
  $B451  01 01     ORA ($01,X)
  $B453  03        .db $03
  $B454  17        .db $17
  $B455  F7        .db $F7
  $B456  FF        .db $FF
  $B457  EE FF FF  INC $FFFF
  $B45A  FF        .db $FF
  $B45B  FF        .db $FF
  $B45C  FF        .db $FF
  $B45D  FF        .db $FF
  $B45E  EF        .db $EF
  $B45F  1E C0 E0  ASL $E0C0,X
  $B462  E0 F0     CPX #$F0
  $B464  FB        .db $FB
  $B465  3B        .db $3B
  $B466  3F        .db $3F
  $B467  1D FF FF  ORA $FFFF,X
  $B46A  FF        .db $FF
  $B46B  FF        .db $FF
  $B46C  FE 3F 3D  INC $3D3F,X
  $B46F  1E 00 00  ASL $0000,X
  $B472  00        BRK
  $B473  00        BRK
  $B474  00        BRK
  $B475  FF        .db $FF
  $B476  FF        .db $FF
  $B477  FF        .db $FF
  $B478  FF        .db $FF
  $B479  FF        .db $FF
  $B47A  FF        .db $FF
  $B47B  FF        .db $FF
  $B47C  FF        .db $FF
  $B47D  FF        .db $FF
  $B47E  FF        .db $FF
  $B47F  00        BRK
  $B480  0E 0E 0F  ASL $0F0E
  $B483  07        .db $07
  $B484  87        .db $87
  $B485  87        .db $87
  $B486  C3        .db $C3
  $B487  E3        .db $E3
  $B488  0F        .db $0F
  $B489  0F        .db $0F
  $B48A  8F        .db $8F
  $B48B  87        .db $87
  $B48C  C7        .db $C7
  $B48D  C7        .db $C7
  $B48E  E3        .db $E3
  $B48F  13        .db $13
  $B490  00        BRK
  $B491  00        BRK
  $B492  00        BRK
  $B493  00        BRK
  $B494  A0 BF     LDY #$BF
  $B496  BF        .db $BF
  $B497  DF        .db $DF
  $B498  FF        .db $FF
  $B499  FF        .db $FF
  $B49A  FF        .db $FF
  $B49B  FF        .db $FF
  $B49C  FF        .db $FF
  $B49D  FF        .db $FF
  $B49E  FF        .db $FF
  $B49F  E0 00     CPX #$00
  $B4A1  00        BRK
  $B4A2  01 01     ORA ($01,X)
  $B4A4  02        .db $02
  $B4A5  FE FF FF  INC $FFFF,X
  $B4A8  FF        .db $FF
  $B4A9  FF        .db $FF
  $B4AA  FF        .db $FF
  $B4AB  FF        .db $FF
  $B4AC  FF        .db $FF
  $B4AD  FF        .db $FF
  $B4AE  FF        .db $FF
  $B4AF  00        BRK
  $B4B0  00        BRK
  $B4B1  00        BRK
  $B4B2  80        .db $80
  $B4B3  E0 FC     CPX #$FC
  $B4B5  FF        .db $FF
  $B4B6  7F        .db $7F
  $B4B7  7F        .db $7F
  $B4B8  FF        .db $FF
  $B4B9  FF        .db $FF
  $B4BA  FF        .db $FF
  $B4BB  FF        .db $FF
  $B4BC  FF        .db $FF
  $B4BD  FF        .db $FF
  $B4BE  FF        .db $FF
  $B4BF  FF        .db $FF
  $B4C0  0F        .db $0F
  $B4C1  03        .db $03
  $B4C2  00        BRK
  $B4C3  00        BRK
  $B4C4  60        RTS
  $B4C5  3F        .db $3F
  $B4C6  CF        .db $CF
  $B4C7  F3        .db $F3
  $B4C8  FF        .db $FF
  $B4C9  FF        .db $FF

L_B4CA:
  $B4CA  FF        .db $FF
  $B4CB  FF        .db $FF
  $B4CC  DF        .db $DF
  $B4CD  FF        .db $FF
  $B4CE  FF        .db $FF
  $B4CF  FC        .db $FC
  $B4D0  F0 F8     BEQ $B4CA
  $B4D2  7C        .db $7C
  $B4D3  1E 4F F3  ASL $F34F,X
  $B4D6  FC        .db $FC
  $B4D7  FF        .db $FF
  $B4D8  FF        .db $FF
  $B4D9  FF        .db $FF
  $B4DA  FF        .db $FF
  $B4DB  FF        .db $FF
  $B4DC  FF        .db $FF
  $B4DD  FF        .db $FF
  $B4DE  FB        .db $FB
  $B4DF  00        BRK
  $B4E0  00        BRK
  $B4E1  00        BRK
  $B4E2  00        BRK
  $B4E3  00        BRK
  $B4E4  80        .db $80
  $B4E5  7F        .db $7F
  $B4E6  7F        .db $7F
  $B4E7  FF        .db $FF
  $B4E8  FF        .db $FF
  $B4E9  FF        .db $FF
  $B4EA  FF        .db $FF
  $B4EB  FF        .db $FF
  $B4EC  FF        .db $FF
  $B4ED  FF        .db $FF

L_B4EE:
  $B4EE  FF        .db $FF
  $B4EF  00        BRK
  $B4F0  00        BRK
  $B4F1  00        BRK
  $B4F2  00        BRK
  $B4F3  00        BRK
  $B4F4  10 F8     BPL $B4EE
  $B4F6  FC        .db $FC
  $B4F7  FE 80 C0  INC $C080,X
  $B4FA  E0 F0     CPX #$F0
  $B4FC  F8        SED
  $B4FD  FC        .db $FC
  $B4FE  FE 01 00  INC $0001,X
  $B501  01 03     ORA ($03,X)
  $B503  00        BRK
  $B504  0F        .db $0F
  $B505  00        BRK
  $B506  00        BRK
  $B507  00        BRK
  $B508  01 02     ORA ($02,X)
  $B50A  04        .db $04
  $B50B  0F        .db $0F
  $B50C  10 3F     BPL $B54D
  $B50E  7F        .db $7F
  $B50F  FF        .db $FF
  $B510  FC        .db $FC
  $B511  F8        SED
  $B512  F0 00     BEQ $B514

L_B514:
  $B514  C1 03     CMP ($03,X)
  $B516  07        .db $07
  $B517  0F        .db $0F
  $B518  FE 04 08  INC $0804,X
  $B51B  F0 21     BEQ $B53E
  $B51D  C3        .db $C3
  $B51E  87        .db $87
  $B51F  0F        .db $0F
  $B520  1F        .db $1F
  $B521  3F        .db $3F
  $B522  7F        .db $7F
  $B523  FF        .db $FF
  $B524  FF        .db $FF
  $B525  FE FC F8  INC $F8FC,X
  $B528  1F        .db $1F
  $B529  3F        .db $3F
  $B52A  7F        .db $7F
  $B52B  FF        .db $FF
  $B52C  FF        .db $FF
  $B52D  FE FC F8  INC $F8FC,X
  $B530  7F        .db $7F
  $B531  7F        .db $7F
  $B532  7F        .db $7F
  $B533  00        BRK
  $B534  7F        .db $7F
  $B535  00        BRK
  $B536  01 07     ORA ($07,X)
  $B538  FF        .db $FF
  $B539  80        .db $80
  $B53A  80        .db $80
  $B53B  FF        .db $FF
  $B53C  80        .db $80
  $B53D  FF        .db $FF

L_B53E:
  $B53E  FF        .db $FF
  $B53F  FF        .db $FF
  $B540  FE F8 E3  INC $E3F8,X
  $B543  0F        .db $0F
  $B544  1F        .db $1F
  $B545  7F        .db $7F
  $B546  FF        .db $FF
  $B547  FF        .db $FF
  $B548  FF        .db $FF
  $B549  07        .db $07
  $B54A  1F        .db $1F
  $B54B  FF        .db $FF
  $B54C  FF        .db $FF

L_B54D:
  $B54D  FF        .db $FF
  $B54E  FF        .db $FF
  $B54F  FF        .db $FF
  $B550  1F        .db $1F
  $B551  FE FE FC  INC $FCFE,X
  $B554  FD F0 E0  SBC $E0F0,X
  $B557  80        .db $80
  $B558  9F        .db $9F
  $B559  FF        .db $FF
  $B55A  FF        .db $FF
  $B55B  FF        .db $FF
  $B55C  FE F7 E7  INC $E7F7,X
  $B55F  8F        .db $8F
  $B560  7F        .db $7F
  $B561  FF        .db $FF
  $B562  FF        .db $FF
  $B563  00        BRK
  $B564  FF        .db $FF
  $B565  00        BRK
  $B566  00        BRK
  $B567  00        BRK
  $B568  FF        .db $FF
  $B569  00        BRK
  $B56A  00        BRK
  $B56B  FF        .db $FF
  $B56C  00        BRK
  $B56D  FF        .db $FF
  $B56E  FF        .db $FF
  $B56F  FF        .db $FF
  $B570  FE FE FD  INC $FDFE,X
  $B573  01 FD     ORA ($FD,X)
  $B575  03        .db $03
  $B576  03        .db $03
  $B577  03        .db $03
  $B578  FF        .db $FF
  $B579  01 03     ORA ($03,X)
  $B57B  FF        .db $FF
  $B57C  03        .db $03
  $B57D  FF        .db $FF
  $B57E  FF        .db $FF
  $B57F  FF        .db $FF
  $B580  E1 E1     SBC ($E1,X)
  $B582  C3        .db $C3
  $B583  C0 C7     CPY #$C7
  $B585  80        .db $80
  $B586  80        .db $80
  $B587  80        .db $80
  $B588  E3        .db $E3
  $B589  E2        .db $E2
  $B58A  C4 CF     CPY $CF
  $B58C  C8        INY
  $B58D  9F        .db $9F
  $B58E  BF        .db $BF
  $B58F  BF        .db $BF
  $B590  FF        .db $FF
  $B591  FF        .db $FF
  $B592  FF        .db $FF
  $B593  00        BRK
  $B594  FF        .db $FF
  $B595  00        BRK
  $B596  00        BRK
  $B597  00        BRK
  $B598  FF        .db $FF
  $B599  00        BRK
  $B59A  00        BRK
  $B59B  FF        .db $FF
  $B59C  00        BRK
  $B59D  FF        .db $FF
  $B59E  FF        .db $FF
  $B59F  FF        .db $FF
  $B5A0  F0 FF     BEQ $B5A1
  $B5A2  FF        .db $FF
  $B5A3  00        BRK
  $B5A4  FF        .db $FF
  $B5A5  00        BRK
  $B5A6  7F        .db $7F
  $B5A7  FF        .db $FF
  $B5A8  EF        .db $EF
  $B5A9  00        BRK
  $B5AA  00        BRK
  $B5AB  FF        .db $FF
  $B5AC  00        BRK
  $B5AD  FF        .db $FF
  $B5AE  FF        .db $FF
  $B5AF  FF        .db $FF
  $B5B0  03        .db $03
  $B5B1  FF        .db $FF
  $B5B2  FF        .db $FF
  $B5B3  00        BRK
  $B5B4  FF        .db $FF
  $B5B5  00        BRK
  $B5B6  FF        .db $FF
  $B5B7  FF        .db $FF
  $B5B8  FD 00 00  SBC $0000,X
  $B5BB  FF        .db $FF
  $B5BC  00        BRK
  $B5BD  FF        .db $FF
  $B5BE  FF        .db $FF
  $B5BF  FF        .db $FF
  $B5C0  FF        .db $FF
  $B5C1  FF        .db $FF
  $B5C2  FF        .db $FF
  $B5C3  00        BRK
  $B5C4  FF        .db $FF
  $B5C5  00        BRK
  $B5C6  80        .db $80
  $B5C7  C0 FF     CPY #$FF
  $B5C9  00        BRK
  $B5CA  00        BRK
  $B5CB  FF        .db $FF
  $B5CC  00        BRK
  $B5CD  FF        .db $FF
  $B5CE  FF        .db $FF
  $B5CF  FF        .db $FF
  $B5D0  E3        .db $E3
  $B5D1  F1 F1     SBC ($F1),Y
  $B5D3  01 FC     ORA ($FC,X)
  $B5D5  00        BRK
  $B5D6  00        BRK
  $B5D7  00        BRK
  $B5D8  F3        .db $F3
  $B5D9  09 0D     ORA #$0D
  $B5DB  FD 02 FE  SBC $FE02,X
  $B5DE  FF        .db $FF
  $B5DF  FF        .db $FF
  $B5E0  DF        .db $DF
  $B5E1  DF        .db $DF
  $B5E2  DF        .db $DF
  $B5E3  E0 EF     CPX #$EF
  $B5E5  E0 F0     CPX #$F0
  $B5E7  70 FF     BVS $B5E8
  $B5E9  E0 E0     CPX #$E0
  $B5EB  FF        .db $FF
  $B5EC  F0 FF     BEQ $B5ED
  $B5EE  FF        .db $FF
  $B5EF  FF        .db $FF
  $B5F0  FF        .db $FF
  $B5F1  FF        .db $FF
  $B5F2  FF        .db $FF
  $B5F3  00        BRK
  $B5F4  FF        .db $FF
  $B5F5  00        BRK
  $B5F6  00        BRK
  $B5F7  00        BRK
  $B5F8  FF        .db $FF
  $B5F9  00        BRK
  $B5FA  00        BRK
  $B5FB  FF        .db $FF
  $B5FC  00        BRK
  $B5FD  FF        .db $FF

L_B5FE:
  $B5FE  FF        .db $FF
  $B5FF  FF        .db $FF
  $B600  BF        .db $BF
  $B601  BF        .db $BF
  $B602  CF        .db $CF
  $B603  03        .db $03
  $B604  E0 00     CPX #$00
  $B606  00        BRK
  $B607  00        BRK
  $B608  FF        .db $FF
  $B609  7F        .db $7F
  $B60A  2F        .db $2F
  $B60B  E3        .db $E3
  $B60C  10 F0     BPL $B5FE
  $B60E  F8        SED
  $B60F  F8        SED
  $B610  FC        .db $FC
  $B611  FF        .db $FF
  $B612  FF        .db $FF
  $B613  FF        .db $FF
  $B614  FF        .db $FF
  $B615  3F        .db $3F
  $B616  07        .db $07
  $B617  01 FF     ORA ($FF,X)
  $B619  FF        .db $FF
  $B61A  FF        .db $FF
  $B61B  FF        .db $FF
  $B61C  FF        .db $FF
  $B61D  3F        .db $3F
  $B61E  07        .db $07
  $B61F  01 FF     ORA ($FF,X)

L_B621:
  $B621  3F        .db $3F
  $B622  CF        .db $CF
  $B623  F0 FC     BEQ $B621
  $B625  FF        .db $FF
  $B626  FF        .db $FF
  $B627  FF        .db $FF
  $B628  FF        .db $FF
  $B629  C0 F0     CPY #$F0
  $B62B  FF        .db $FF
  $B62C  FF        .db $FF
  $B62D  FF        .db $FF
  $B62E  FF        .db $FF
  $B62F  FF        .db $FF
  $B630  FF        .db $FF
  $B631  FF        .db $FF
  $B632  FF        .db $FF
  $B633  00        BRK
  $B634  FF        .db $FF
  $B635  00        BRK
  $B636  C0 F0     CPY #$F0
  $B638  FF        .db $FF
  $B639  00        BRK
  $B63A  00        BRK
  $B63B  FF        .db $FF
  $B63C  00        BRK
  $B63D  FF        .db $FF
  $B63E  FF        .db $FF
  $B63F  FF        .db $FF
  $B640  FF        .db $FF
  $B641  FF        .db $FF
  $B642  FF        .db $FF
  $B643  00        BRK
  $B644  FF        .db $FF
  $B645  00        BRK
  $B646  00        BRK
  $B647  00        BRK
  $B648  FF        .db $FF
  $B649  00        BRK
  $B64A  00        BRK
  $B64B  FF        .db $FF
  $B64C  00        BRK
  $B64D  FF        .db $FF
  $B64E  FF        .db $FF
  $B64F  FF        .db $FF
  $B650  00        BRK
  $B651  80        .db $80
  $B652  C0 00     CPY #$00
  $B654  F0 00     BEQ $B656

L_B656:
  $B656  00        BRK
  $B657  00        BRK
  $B658  80        .db $80
  $B659  40        RTI
  $B65A  20 F0 08  JSR $08F0
  $B65D  FC        .db $FC
  $B65E  FE FF 00  INC $00FF,X
  $B661  00        BRK
  $B662  00        BRK
  $B663  00        BRK
  $B664  00        BRK
  $B665  00        BRK
  $B666  00        BRK
  $B667  00        BRK
  $B668  01 03     ORA ($03,X)
  $B66A  07        .db $07
  $B66B  00        BRK
  $B66C  00        BRK
  $B66D  00        BRK
  $B66E  00        BRK
  $B66F  00        BRK
  $B670  00        BRK
  $B671  00        BRK

L_B672:
  $B672  00        BRK
  $B673  00        BRK
  $B674  01 03     ORA ($03,X)
  $B676  07        .db $07
  $B677  00        BRK
  $B678  FE FC F8  INC $F8FC,X
  $B67B  00        BRK
  $B67C  01 03     ORA ($03,X)
  $B67E  07        .db $07
  $B67F  00        BRK
  $B680  1F        .db $1F
  $B681  3F        .db $3F
  $B682  7F        .db $7F
  $B683  FF        .db $FF
  $B684  FF        .db $FF
  $B685  FE FC 00  INC $00FC,X
  $B688  1F        .db $1F
  $B689  3F        .db $3F
  $B68A  7F        .db $7F
  $B68B  FF        .db $FF
  $B68C  FF        .db $FF
  $B68D  FE FC 00  INC $00FC,X
  $B690  F0 E0     BEQ $B672
  $B692  C0 80     CPY #$80
  $B694  00        BRK
  $B695  00        BRK
  $B696  00        BRK
  $B697  00        BRK
  $B698  F0 E0     BEQ $B67A
  $B69A  C0 80     CPY #$80
  $B69C  00        BRK
  $B69D  00        BRK
  $B69E  00        BRK
  $B69F  00        BRK
  $B6A0  0F        .db $0F
  $B6A1  0F        .db $0F
  $B6A2  0F        .db $0F
  $B6A3  0F        .db $0F
  $B6A4  0F        .db $0F
  $B6A5  06 00     ASL $00
  $B6A7  00        BRK
  $B6A8  6F        .db $6F
  $B6A9  0F        .db $0F
  $B6AA  0F        .db $0F
  $B6AB  0F        .db $0F
  $B6AC  0F        .db $0F
  $B6AD  06 00     ASL $00
  $B6AF  00        BRK
  $B6B0  FE FC F0  INC $F0FC,X
  $B6B3  C0 80     CPY #$80
  $B6B5  00        BRK
  $B6B6  00        BRK
  $B6B7  00        BRK
  $B6B8  FE FC F0  INC $F0FC,X
  $B6BB  C0 80     CPY #$80
  $B6BD  00        BRK
  $B6BE  00        BRK
  $B6BF  00        BRK
  $B6C0  80        .db $80
  $B6C1  00        BRK
  $B6C2  00        BRK
  $B6C3  00        BRK
  $B6C4  00        BRK
  $B6C5  00        BRK
  $B6C6  00        BRK
  $B6C7  00        BRK
  $B6C8  8F        .db $8F
  $B6C9  1F        .db $1F
  $B6CA  1F        .db $1F
  $B6CB  00        BRK
  $B6CC  00        BRK
  $B6CD  00        BRK
  $B6CE  00        BRK
  $B6CF  00        BRK
  $B6D0  00        BRK
  $B6D1  00        BRK
  $B6D2  00        BRK
  $B6D3  7F        .db $7F
  $B6D4  7F        .db $7F
  $B6D5  FF        .db $FF
  $B6D6  FF        .db $FF
  $B6D7  00        BRK
  $B6D8  FF        .db $FF
  $B6D9  FF        .db $FF
  $B6DA  FF        .db $FF
  $B6DB  7F        .db $7F
  $B6DC  7F        .db $7F
  $B6DD  FF        .db $FF
  $B6DE  FF        .db $FF
  $B6DF  00        BRK
  $B6E0  07        .db $07
  $B6E1  07        .db $07
  $B6E2  07        .db $07
  $B6E3  FE FE FE  INC $FEFE,X
  $B6E6  FC        .db $FC
  $B6E7  00        BRK
  $B6E8  FB        .db $FB
  $B6E9  FF        .db $FF
  $B6EA  FF        .db $FF
  $B6EB  FE FE FE  INC $FEFE,X
  $B6EE  FC        .db $FC
  $B6EF  00        BRK
  $B6F0  00        BRK
  $B6F1  00        BRK
  $B6F2  00        BRK
  $B6F3  07        .db $07
  $B6F4  0F        .db $0F
  $B6F5  1F        .db $1F
  $B6F6  1F        .db $1F
  $B6F7  00        BRK
  $B6F8  7F        .db $7F
  $B6F9  7F        .db $7F
  $B6FA  FF        .db $FF
  $B6FB  07        .db $07
  $B6FC  0F        .db $0F
  $B6FD  1F        .db $1F
  $B6FE  1F        .db $1F
  $B6FF  00        BRK
  $B700  00        BRK
  $B701  01 01     ORA ($01,X)
  $B703  FF        .db $FF
  $B704  FF        .db $FF
  $B705  FF        .db $FF
  $B706  FF        .db $FF
  $B707  00        BRK
  $B708  FF        .db $FF
  $B709  FF        .db $FF
  $B70A  FF        .db $FF
  $B70B  FF        .db $FF
  $B70C  FF        .db $FF
  $B70D  FF        .db $FF
  $B70E  FF        .db $FF
  $B70F  00        BRK
  $B710  FF        .db $FF
  $B711  FF        .db $FF
  $B712  FF        .db $FF
  $B713  C0 80     CPY #$80
  $B715  80        .db $80
  $B716  00        BRK
  $B717  00        BRK
  $B718  FF        .db $FF
  $B719  FF        .db $FF
  $B71A  FF        .db $FF
  $B71B  C0 80     CPY #$80
  $B71D  80        .db $80
  $B71E  00        BRK
  $B71F  00        BRK
  $B720  FF        .db $FF
  $B721  FF        .db $FF
  $B722  FF        .db $FF
  $B723  00        BRK
  $B724  00        BRK
  $B725  00        BRK
  $B726  00        BRK
  $B727  00        BRK
  $B728  FF        .db $FF
  $B729  FF        .db $FF
  $B72A  FF        .db $FF
  $B72B  00        BRK
  $B72C  00        BRK
  $B72D  00        BRK
  $B72E  00        BRK
  $B72F  00        BRK
  $B730  C0 E0     CPY #$E0
  $B732  E0 FF     CPX #$FF
  $B734  7F        .db $7F
  $B735  7F        .db $7F
  $B736  3F        .db $3F
  $B737  00        BRK
  $B738  FF        .db $FF
  $B739  FF        .db $FF
  $B73A  FF        .db $FF
  $B73B  FF        .db $FF
  $B73C  7F        .db $7F
  $B73D  7F        .db $7F
  $B73E  3F        .db $3F
  $B73F  00        BRK
  $B740  00        BRK
  $B741  00        BRK
  $B742  00        BRK
  $B743  FC        .db $FC
  $B744  FE FF FF  INC $FFFF,X
  $B747  00        BRK
  $B748  FF        .db $FF
  $B749  FF        .db $FF
  $B74A  FF        .db $FF
  $B74B  FC        .db $FC
  $B74C  FE FF FF  INC $FFFF,X
  $B74F  00        BRK
  $B750  70 38     BVS $B78A
  $B752  38        SEC
  $B753  3F        .db $3F
  $B754  3F        .db $3F
  $B755  3F        .db $3F
  $B756  1F        .db $1F
  $B757  00        BRK
  $B758  FF        .db $FF
  $B759  FF        .db $FF
  $B75A  FF        .db $FF
  $B75B  3F        .db $3F
  $B75C  3F        .db $3F
  $B75D  3F        .db $3F
  $B75E  1F        .db $1F
  $B75F  00        BRK
  $B760  00        BRK
  $B761  00        BRK
  $B762  00        BRK
  $B763  FF        .db $FF
  $B764  FF        .db $FF
  $B765  FF        .db $FF
  $B766  FF        .db $FF
  $B767  00        BRK
  $B768  FF        .db $FF
  $B769  FF        .db $FF
  $B76A  FF        .db $FF
  $B76B  FF        .db $FF
  $B76C  FF        .db $FF
  $B76D  FF        .db $FF
  $B76E  FF        .db $FF
  $B76F  00        BRK
  $B770  00        BRK
  $B771  00        BRK
  $B772  00        BRK
  $B773  C0 C0     CPY #$C0
  $B775  E0 E0     CPX #$E0
  $B777  00        BRK
  $B778  FC        .db $FC
  $B779  FC        .db $FC
  $B77A  FE C0 C0  INC $C0C0,X
  $B77D  E0 E0     CPX #$E0
  $B77F  00        BRK
  $B780  01 00     ORA ($00,X)
  $B782  00        BRK
  $B783  00        BRK
  $B784  00        BRK
  $B785  00        BRK
  $B786  00        BRK
  $B787  00        BRK
  $B788  01 00     ORA ($00,X)

L_B78A:
  $B78A  00        BRK
  $B78B  00        BRK
  $B78C  00        BRK
  $B78D  00        BRK
  $B78E  00        BRK
  $B78F  00        BRK
  $B790  7F        .db $7F
  $B791  0F        .db $0F
  $B792  03        .db $03
  $B793  00        BRK
  $B794  00        BRK
  $B795  00        BRK
  $B796  00        BRK
  $B797  00        BRK
  $B798  7F        .db $7F
  $B799  0F        .db $0F
  $B79A  03        .db $03
  $B79B  00        BRK
  $B79C  00        BRK
  $B79D  00        BRK
  $B79E  00        BRK
  $B79F  00        BRK
  $B7A0  FC        .db $FC
  $B7A1  FF        .db $FF
  $B7A2  FF        .db $FF
  $B7A3  FF        .db $FF
  $B7A4  3F        .db $3F
  $B7A5  0F        .db $0F
  $B7A6  03        .db $03
  $B7A7  00        BRK
  $B7A8  FF        .db $FF
  $B7A9  FF        .db $FF
  $B7AA  FF        .db $FF
  $B7AB  FF        .db $FF
  $B7AC  3F        .db $3F
  $B7AD  0F        .db $0F
  $B7AE  03        .db $03
  $B7AF  00        BRK
  $B7B0  00        BRK
  $B7B1  00        BRK
  $B7B2  C0 FF     CPY #$FF
  $B7B4  FF        .db $FF
  $B7B5  FF        .db $FF
  $B7B6  FF        .db $FF
  $B7B7  00        BRK
  $B7B8  FF        .db $FF
  $B7B9  FF        .db $FF
  $B7BA  FF        .db $FF
  $B7BB  FF        .db $FF
  $B7BC  FF        .db $FF

L_B7BD:
  $B7BD  FF        .db $FF
  $B7BE  FF        .db $FF
  $B7BF  00        BRK
  $B7C0  00        BRK
  $B7C1  00        BRK
  $B7C2  00        BRK
  $B7C3  F0 F8     BEQ $B7BD

L_B7C5:
  $B7C5  FC        .db $FC
  $B7C6  FE 00 FF  INC $FF00,X
  $B7C9  FF        .db $FF
  $B7CA  FF        .db $FF
  $B7CB  F0 F8     BEQ $B7C5
  $B7CD  FC        .db $FC
  $B7CE  FE 00 00  INC $0000,X
  $B7D1  00        BRK
  $B7D2  00        BRK
  $B7D3  00        BRK
  $B7D4  00        BRK
  $B7D5  00        BRK
  $B7D6  00        BRK
  $B7D7  00        BRK
  $B7D8  80        .db $80
  $B7D9  C0 E0     CPY #$E0
  $B7DB  00        BRK
  $B7DC  00        BRK
  $B7DD  00        BRK
  $B7DE  00        BRK
  $B7DF  00        BRK
  $B7E0  00        BRK
  $B7E1  00        BRK
  $B7E2  01 03     ORA ($03,X)
  $B7E4  07        .db $07
  $B7E5  00        BRK
  $B7E6  1F        .db $1F
  $B7E7  00        BRK
  $B7E8  00        BRK

L_B7E9:
  $B7E9  01 02     ORA ($02,X)
  $B7EB  04        .db $04
  $B7EC  08        PHP
  $B7ED  1F        .db $1F
  $B7EE  20 7F 00  JSR $007F
  $B7F1  00        BRK
  $B7F2  00        BRK
  $B7F3  00        BRK
  $B7F4  00        BRK
  $B7F5  00        BRK
  $B7F6  00        BRK
  $B7F7  00        BRK
  $B7F8  00        BRK
  $B7F9  7E 42 42  ROR $4242,X
  $B7FC  42        .db $42
  $B7FD  42        .db $42
  $B7FE  7E 00 20  ROR $2000,X
  $B801  10 18     BPL $B81B
  $B803  0C        .db $0C
  $B804  0E 07 07  ASL $0707
  $B807  03        .db $03
  $B808  00        BRK
  $B809  00        BRK
  $B80A  00        BRK
  $B80B  00        BRK
  $B80C  08        PHP
  $B80D  00        BRK
  $B80E  06 00     ASL $00
  $B810  00        BRK
  $B811  00        BRK
  $B812  00        BRK
  $B813  00        BRK
  $B814  00        BRK
  $B815  00        BRK
  $B816  80        .db $80
  $B817  C0 00     CPY #$00
  $B819  00        BRK
  $B81A  00        BRK

L_B81B:
  $B81B  00        BRK
  $B81C  00        BRK
  $B81D  00        BRK
  $B81E  00        BRK
  $B81F  00        BRK
  $B820  00        BRK
  $B821  40        RTI
  $B822  40        RTI
  $B823  60        RTS
  $B824  60        RTS
  $B825  70 70     BVS $B897
  $B827  78        SEI
  $B828  00        BRK
  $B829  00        BRK
  $B82A  00        BRK
  $B82B  40        RTI
  $B82C  00        BRK
  $B82D  40        RTI
  $B82E  00        BRK
  $B82F  40        RTI
  $B830  00        BRK
  $B831  00        BRK
  $B832  00        BRK
  $B833  00        BRK
  $B834  00        BRK
  $B835  00        BRK
  $B836  01 08     ORA ($08,X)
  $B838  00        BRK
  $B839  00        BRK
  $B83A  00        BRK
  $B83B  00        BRK
  $B83C  00        BRK
  $B83D  00        BRK
  $B83E  01 0F     ORA ($0F,X)
  $B840  00        BRK
  $B841  00        BRK
  $B842  00        BRK
  $B843  00        BRK
  $B844  00        BRK
  $B845  30 00     BMI $B847

L_B847:
  $B847  04        .db $04
  $B848  00        BRK
  $B849  00        BRK
  $B84A  00        BRK
  $B84B  00        BRK
  $B84C  00        BRK
  $B84D  3F        .db $3F
  $B84E  FF        .db $FF
  $B84F  FF        .db $FF
  $B850  03        .db $03
  $B851  01 01     ORA ($01,X)
  $B853  00        BRK
  $B854  00        BRK
  $B855  30 06     BMI $B85D
  $B857  10 03     BPL $B85C
  $B859  01 01     ORA ($01,X)
  $B85B  00        BRK

L_B85C:
  $B85C  00        BRK

L_B85D:
  $B85D  F0 FE     BEQ $B85D
  $B85F  FF        .db $FF
  $B860  E0 F0     CPX #$F0
  $B862  F8        SED
  $B863  FC        .db $FC
  $B864  FE 79 60  INC $6079,X
  $B867  10 80     BPL $B7E9
  $B869  00        BRK
  $B86A  00        BRK
  $B86B  C0 80     CPY #$80
  $B86D  41 67     EOR ($67,X)
  $B86F  1F        .db $1F
  $B870  78        SEI
  $B871  7C        .db $7C
  $B872  7C        .db $7C
  $B873  7E 70 40  ROR $4070,X
  $B876  88        DEY
  $B877  58        CLI
  $B878  60        RTS
  $B879  40        RTI
  $B87A  60        RTS
  $B87B  40        RTI
  $B87C  40        RTI
  $B87D  4F        .db $4F
  $B87E  8F        .db $8F
  $B87F  DF        .db $DF
  $B880  00        BRK
  $B881  00        BRK
  $B882  00        BRK
  $B883  00        BRK
  $B884  00        BRK
  $B885  00        BRK
  $B886  00        BRK
  $B887  00        BRK
  $B888  00        BRK
  $B889  00        BRK
  $B88A  00        BRK
  $B88B  00        BRK
  $B88C  00        BRK
  $B88D  00        BRK
  $B88E  80        .db $80
  $B88F  C0 00     CPY #$00
  $B891  00        BRK
  $B892  00        BRK
  $B893  00        BRK
  $B894  00        BRK
  $B895  00        BRK
  $B896  00        BRK

L_B897:
  $B897  01 00     ORA ($00,X)
  $B899  00        BRK
  $B89A  00        BRK
  $B89B  00        BRK
  $B89C  00        BRK
  $B89D  00        BRK
  $B89E  00        BRK
  $B89F  01 00     ORA ($00,X)
  $B8A1  00        BRK
  $B8A2  02        .db $02
  $B8A3  08        PHP
  $B8A4  20 40 88  JSR $8840
  $B8A7  08        PHP
  $B8A8  00        BRK
  $B8A9  00        BRK
  $B8AA  03        .db $03
  $B8AB  0F        .db $0F
  $B8AC  3F        .db $3F
  $B8AD  7F        .db $7F
  $B8AE  FF        .db $FF
  $B8AF  FF        .db $FF
  $B8B0  20 80 08  JSR $0880
  $B8B3  08        PHP
  $B8B4  08        PHP
  $B8B5  08        PHP
  $B8B6  08        PHP
  $B8B7  04        .db $04
  $B8B8  3F        .db $3F
  $B8B9  FF        .db $FF
  $B8BA  FF        .db $FF
  $B8BB  FF        .db $FF
  $B8BC  FF        .db $FF
  $B8BD  FF        .db $FF
  $B8BE  FF        .db $FF
  $B8BF  FF        .db $FF
  $B8C0  08        PHP
  $B8C1  08        PHP
  $B8C2  08        PHP
  $B8C3  08        PHP
  $B8C4  08        PHP
  $B8C5  08        PHP
  $B8C6  08        PHP
  $B8C7  0C        .db $0C
  $B8C8  FF        .db $FF
  $B8C9  FF        .db $FF
  $B8CA  FF        .db $FF
  $B8CB  FF        .db $FF
  $B8CC  FF        .db $FF
  $B8CD  FF        .db $FF
  $B8CE  FF        .db $FF
  $B8CF  FF        .db $FF
  $B8D0  11 03     ORA ($03),Y
  $B8D2  00        BRK
  $B8D3  00        BRK
  $B8D4  39 5E DF  AND $DF5E,Y
  $B8D7  DF        .db $DF
  $B8D8  FF        .db $FF
  $B8D9  C3        .db $C3
  $B8DA  BC 87 81  LDY $8187,X
  $B8DD  C0 C0     CPY #$C0
  $B8DF  C0 B0     CPY #$B0
  $B8E1  30 38     BMI $B91B
  $B8E3  3C        .db $3C
  $B8E4  0E 44 A3  ASL $A344
  $B8E7  D1 BF     CMP ($BF),Y
  $B8E9  3F        .db $3F
  $B8EA  3F        .db $3F
  $B8EB  3F        .db $3F
  $B8EC  CF        .db $CF
  $B8ED  77        .db $77
  $B8EE  3B        .db $3B
  $B8EF  1D 03 01  ORA $0103,X
  $B8F2  00        BRK
  $B8F3  00        BRK
  $B8F4  00        BRK
  $B8F5  00        BRK
  $B8F6  07        .db $07
  $B8F7  8F        .db $8F
  $B8F8  E3        .db $E3
  $B8F9  FF        .db $FF
  $B8FA  FF        .db $FF
  $B8FB  FF        .db $FF
  $B8FC  FF        .db $FF
  $B8FD  F8        SED
  $B8FE  F7        .db $F7
  $B8FF  EF        .db $EF
  $B900  00        BRK
  $B901  80        .db $80
  $B902  00        BRK
  $B903  00        BRK
  $B904  00        BRK
  $B905  00        BRK
  $B906  80        .db $80
  $B907  C3        .db $C3

L_B908:
  $B908  C0 E0     CPY #$E0
  $B90A  F0 FC     BEQ $B908
  $B90C  FE 7F BC  INC $BC7F,X
  $B90F  DB        .db $DB
  $B910  00        BRK
  $B911  00        BRK
  $B912  00        BRK
  $B913  00        BRK
  $B914  00        BRK
  $B915  00        BRK
  $B916  00        BRK
  $B917  01 00     ORA ($00,X)
  $B919  00        BRK
  $B91A  00        BRK

L_B91B:
  $B91B  00        BRK
  $B91C  00        BRK
  $B91D  00        BRK
  $B91E  00        BRK
  $B91F  01 02     ORA ($02,X)
  $B921  04        .db $04
  $B922  08        PHP
  $B923  19 31 31  ORA $3131,Y
  $B926  70 70     BVS $B998
  $B928  03        .db $03
  $B929  07        .db $07
  $B92A  0F        .db $0F
  $B92B  1F        .db $1F
  $B92C  3F        .db $3F
  $B92D  3F        .db $3F
  $B92E  7F        .db $7F
  $B92F  7F        .db $7F
  $B930  08        PHP
  $B931  04        .db $04
  $B932  04        .db $04
  $B933  02        .db $02
  $B934  02        .db $02
  $B935  01 81     ORA ($81,X)

L_B937:
  $B937  80        .db $80
  $B938  FF        .db $FF
  $B939  FF        .db $FF
  $B93A  FF        .db $FF
  $B93B  FF        .db $FF
  $B93C  FF        .db $FF
  $B93D  FF        .db $FF
  $B93E  FF        .db $FF

L_B93F:
  $B93F  FF        .db $FF
  $B940  04        .db $04
  $B941  06 03     ASL $03
  $B943  01 00     ORA ($00,X)
  $B945  00        BRK
  $B946  81 E7     STA ($E7,X)
  $B948  FF        .db $FF
  $B949  FF        .db $FF
  $B94A  FF        .db $FF
  $B94B  FF        .db $FF
  $B94C  FF        .db $FF
  $B94D  FF        .db $FF
  $B94E  FF        .db $FF
  $B94F  FF        .db $FF
  $B950  07        .db $07
  $B951  07        .db $07
  $B952  0F        .db $0F
  $B953  FF        .db $FF
  $B954  FC        .db $FC
  $B955  F0 E0     BEQ $B937
  $B957  C0 FF     CPY #$FF
  $B959  FF        .db $FF
  $B95A  FF        .db $FF
  $B95B  FF        .db $FF
  $B95C  FC        .db $FC
  $B95D  F0 E0     BEQ $B93F
  $B95F  C0 DF     CPY #$DF
  $B961  3C        .db $3C
  $B962  73        .db $73
  $B963  40        RTI
  $B964  0F        .db $0F
  $B965  3F        .db $3F
  $B966  0F        .db $0F
  $B967  07        .db $07
  $B968  C0 03     CPY #$03
  $B96A  0F        .db $0F
  $B96B  30 40     BMI $B9AD
  $B96D  00        BRK
  $B96E  00        BRK
  $B96F  00        BRK
  $B970  01 73     ORA ($73,X)
  $B972  01 F4     ORA ($F4,X)
  $B974  EC D1 81  CPX $81D1
  $B977  00        BRK
  $B978  FD F3 09  SBC $09F3,X
  $B97B  0C        .db $0C
  $B97C  1D 33 43  ORA $4333,X
  $B97F  81 03     STA ($03,X)
  $B981  A0 A0     LDY #$A0
  $B983  20 00 10  JSR $1000
  $B986  18        CLC
  $B987  08        PHP
  $B988  EF        .db $EF
  $B989  EF        .db $EF
  $B98A  EF        .db $EF
  $B98B  3F        .db $3F
  $B98C  9F        .db $9F
  $B98D  5F        .db $5F
  $B98E  5F        .db $5F
  $B98F  8F        .db $8F
  $B990  E7        .db $E7
  $B991  E7        .db $E7
  $B992  F7        .db $F7
  $B993  FF        .db $FF
  $B994  C9 C9     CMP #$C9
  $B996  FF        .db $FF
  $B997  E7        .db $E7

L_B998:
  $B998  E7        .db $E7
  $B999  E6 34     INC $34
  $B99B  18        CLC
  $B99C  00        BRK
  $B99D  00        BRK
  $B99E  08        PHP
  $B99F  1F        .db $1F
  $B9A0  80        .db $80
  $B9A1  80        .db $80
  $B9A2  C0 C0     CPY #$C0
  $B9A4  C0 C0     CPY #$C0
  $B9A6  C0 80     CPY #$80
  $B9A8  00        BRK
  $B9A9  00        BRK
  $B9AA  00        BRK
  $B9AB  00        BRK
  $B9AC  00        BRK

L_B9AD:
  $B9AD  40        RTI
  $B9AE  40        RTI
  $B9AF  E0 00     CPX #$00
  $B9B1  00        BRK
  $B9B2  00        BRK
  $B9B3  00        BRK
  $B9B4  00        BRK
  $B9B5  00        BRK
  $B9B6  00        BRK
  $B9B7  01 00     ORA ($00,X)
  $B9B9  01 01     ORA ($01,X)
  $B9BB  03        .db $03
  $B9BC  03        .db $03
  $B9BD  03        .db $03
  $B9BE  02        .db $02
  $B9BF  01 03     ORA ($03,X)
  $B9C1  07        .db $07
  $B9C2  0F        .db $0F
  $B9C3  1F        .db $1F
  $B9C4  3F        .db $3F
  $B9C5  7F        .db $7F
  $B9C6  FF        .db $FF
  $B9C7  FF        .db $FF
  $B9C8  7B        .db $7B
  $B9C9  F7        .db $F7
  $B9CA  EF        .db $EF
  $B9CB  DF        .db $DF
  $B9CC  BF        .db $BF
  $B9CD  7F        .db $7F
  $B9CE  FF        .db $FF
  $B9CF  FF        .db $FF
  $B9D0  BF        .db $BF
  $B9D1  BF        .db $BF
  $B9D2  BF        .db $BF
  $B9D3  DF        .db $DF
  $B9D4  DF        .db $DF
  $B9D5  EF        .db $EF
  $B9D6  EF        .db $EF
  $B9D7  F7        .db $F7
  $B9D8  BF        .db $BF
  $B9D9  BF        .db $BF
  $B9DA  BF        .db $BF
  $B9DB  DF        .db $DF
  $B9DC  DF        .db $DF
  $B9DD  EF        .db $EF
  $B9DE  EF        .db $EF
  $B9DF  F7        .db $F7
  $B9E0  40        RTI
  $B9E1  40        RTI
  $B9E2  20 30 18  JSR $1830
  $B9E5  0E 07 01  ASL $0107
  $B9E8  FF        .db $FF
  $B9E9  FF        .db $FF
  $B9EA  FF        .db $FF
  $B9EB  FF        .db $FF
  $B9EC  FF        .db $FF
  $B9ED  FF        .db $FF
  $B9EE  FF        .db $FF
  $B9EF  FF        .db $FF
  $B9F0  3F        .db $3F
  $B9F1  0F        .db $0F
  $B9F2  07        .db $07
  $B9F3  07        .db $07
  $B9F4  06 1E     ASL $1E
  $B9F6  FE FC FF  INC $FFFC,X
  $B9F9  FF        .db $FF
  $B9FA  FF        .db $FF
  $B9FB  FF        .db $FF
  $B9FC  FE FE FE  INC $FEFE,X
  $B9FF  FC        .db $FC
  $BA00  80        .db $80
  $BA01  80        .db $80
  $BA02  00        BRK
  $BA03  00        BRK
  $BA04  00        BRK
  $BA05  00        BRK
  $BA06  00        BRK
  $BA07  00        BRK
  $BA08  80        .db $80
  $BA09  80        .db $80
  $BA0A  00        BRK
  $BA0B  00        BRK
  $BA0C  00        BRK
  $BA0D  00        BRK
  $BA0E  00        BRK
  $BA0F  00        BRK
  $BA10  02        .db $02
  $BA11  00        BRK
  $BA12  00        BRK
  $BA13  00        BRK
  $BA14  00        BRK
  $BA15  00        BRK
  $BA16  00        BRK
  $BA17  00        BRK
  $BA18  01 02     ORA ($02,X)
  $BA1A  00        BRK
  $BA1B  00        BRK
  $BA1C  00        BRK
  $BA1D  00        BRK
  $BA1E  00        BRK
  $BA1F  00        BRK
  $BA20  00        BRK
  $BA21  00        BRK
  $BA22  00        BRK
  $BA23  00        BRK
  $BA24  00        BRK
  $BA25  00        BRK
  $BA26  00        BRK
  $BA27  00        BRK
  $BA28  00        BRK
  $BA29  00        BRK
  $BA2A  00        BRK
  $BA2B  00        BRK
  $BA2C  00        BRK
  $BA2D  00        BRK
  $BA2E  00        BRK
  $BA2F  00        BRK
  $BA30  04        .db $04
  $BA31  02        .db $02
  $BA32  01 00     ORA ($00,X)
  $BA34  00        BRK
  $BA35  00        BRK
  $BA36  00        BRK
  $BA37  00        BRK
  $BA38  07        .db $07
  $BA39  03        .db $03
  $BA3A  01 00     ORA ($00,X)
  $BA3C  00        BRK
  $BA3D  00        BRK
  $BA3E  00        BRK
  $BA3F  00        BRK
  $BA40  01 00     ORA ($00,X)
  $BA42  80        .db $80
  $BA43  80        .db $80
  $BA44  40        RTI
  $BA45  20 10 0C  JSR $0C10
  $BA48  FF        .db $FF
  $BA49  FF        .db $FF
  $BA4A  FF        .db $FF
  $BA4B  FF        .db $FF
  $BA4C  7F        .db $7F
  $BA4D  3F        .db $3F
  $BA4E  1F        .db $1F
  $BA4F  0F        .db $0F
  $BA50  80        .db $80
  $BA51  C0 40     CPY #$40
  $BA53  00        BRK
  $BA54  1E 79 04  ASL $0479,X
  $BA57  20 F0 F0  JSR $F0F0
  $BA5A  F8        SED
  $BA5B  F8        SED
  $BA5C  FE FF FD  INC $FDFF,X
  $BA5F  3B        .db $3B
  $BA60  03        .db $03
  $BA61  07        .db $07
  $BA62  0F        .db $0F
  $BA63  1F        .db $1F
  $BA64  1F        .db $1F
  $BA65  3F        .db $3F
  $BA66  3F        .db $3F
  $BA67  7F        .db $7F
  $BA68  03        .db $03
  $BA69  07        .db $07
  $BA6A  0F        .db $0F
  $BA6B  1F        .db $1F
  $BA6C  1F        .db $1F
  $BA6D  3F        .db $3F

L_BA6E:
  $BA6E  3F        .db $3F
  $BA6F  7F        .db $7F
  $BA70  FF        .db $FF
  $BA71  F8        SED

L_BA72:
  $BA72  E0 C0     CPX #$C0
  $BA74  80        .db $80
  $BA75  80        .db $80
  $BA76  00        BRK
  $BA77  00        BRK
  $BA78  FF        .db $FF
  $BA79  F8        SED
  $BA7A  E3        .db $E3
  $BA7B  CF        .db $CF
  $BA7C  9F        .db $9F
  $BA7D  9F        .db $9F

L_BA7E:
  $BA7E  3F        .db $3F
  $BA7F  3F        .db $3F
  $BA80  FA        .db $FA
  $BA81  7D 1E 0F  ADC $0F1E,X
  $BA84  07        .db $07
  $BA85  07        .db $07
  $BA86  03        .db $03
  $BA87  03        .db $03
  $BA88  FB        .db $FB
  $BA89  79 90 E0  ADC $E090,Y
  $BA8C  F0 F0     BEQ $BA7E
  $BA8E  F8        SED
  $BA8F  F8        SED
  $BA90  00        BRK
  $BA91  00        BRK
  $BA92  80        .db $80
  $BA93  60        RTS
  $BA94  B8        CLV
  $BA95  C7        .db $C7
  $BA96  F8        SED
  $BA97  FF        .db $FF
  $BA98  FF        .db $FF
  $BA99  FF        .db $FF
  $BA9A  FF        .db $FF
  $BA9B  7F        .db $7F
  $BA9C  3F        .db $3F
  $BA9D  07        .db $07
  $BA9E  00        BRK
  $BA9F  00        BRK
  $BAA0  3C        .db $3C
  $BAA1  1C        .db $1C
  $BAA2  18        CLC
  $BAA3  18        CLC
  $BAA4  30 CC     BMI $BA72
  $BAA6  1E FF FC  ASL $FCFF,X
  $BAA9  FC        .db $FC
  $BAAA  F8        SED
  $BAAB  F8        SED
  $BAAC  F0 C0     BEQ $BA6E
  $BAAE  00        BRK
  $BAAF  00        BRK
  $BAB0  07        .db $07
  $BAB1  01 00     ORA ($00,X)
  $BAB3  00        BRK
  $BAB4  00        BRK
  $BAB5  00        BRK
  $BAB6  00        BRK
  $BAB7  00        BRK
  $BAB8  07        .db $07
  $BAB9  01 00     ORA ($00,X)
  $BABB  00        BRK
  $BABC  00        BRK
  $BABD  00        BRK
  $BABE  00        BRK
  $BABF  00        BRK
  $BAC0  01 86     ORA ($86,X)
  $BAC2  78        SEI
  $BAC3  00        BRK
  $BAC4  00        BRK
  $BAC5  00        BRK
  $BAC6  00        BRK
  $BAC7  00        BRK
  $BAC8  DF        .db $DF
  $BAC9  FE 78 00  INC $0078,X
  $BACC  00        BRK
  $BACD  00        BRK
  $BACE  00        BRK
  $BACF  00        BRK
  $BAD0  00        BRK
  $BAD1  00        BRK
  $BAD2  00        BRK
  $BAD3  01 01     ORA ($01,X)
  $BAD5  03        .db $03
  $BAD6  03        .db $03
  $BAD7  03        .db $03
  $BAD8  00        BRK
  $BAD9  00        BRK
  $BADA  00        BRK
  $BADB  01 01     ORA ($01,X)
  $BADD  03        .db $03
  $BADE  03        .db $03
  $BADF  03        .db $03
  $BAE0  7F        .db $7F
  $BAE1  FF        .db $FF
  $BAE2  FF        .db $FF
  $BAE3  FF        .db $FF
  $BAE4  FF        .db $FF
  $BAE5  FF        .db $FF
  $BAE6  FF        .db $FF
  $BAE7  C0 7F     CPY #$7F
  $BAE9  FF        .db $FF
  $BAEA  FF        .db $FF
  $BAEB  FF        .db $FF
  $BAEC  FF        .db $FF
  $BAED  FF        .db $FF
  $BAEE  FF        .db $FF
  $BAEF  C0 00     CPY #$00
  $BAF1  00        BRK
  $BAF2  80        .db $80
  $BAF3  80        .db $80
  $BAF4  C0 E1     CPY #$E1
  $BAF6  F9 1C 3F  SBC $3F1C,Y
  $BAF9  3F        .db $3F
  $BAFA  9E        .db $9E
  $BAFB  9C        .db $9C
  $BAFC  CC E0 F0  CPY $F0E0
  $BAFF  00        BRK
  $BB00  03        .db $03
  $BB01  03        .db $03
  $BB02  39 7C FC  AND $FC7C,Y
  $BB05  F9 F3 E3  SBC $E3F3,Y
  $BB08  C0 00     CPY #$00
  $BB0A  00        BRK
  $BB0B  00        BRK
  $BB0C  00        BRK
  $BB0D  01 03     ORA ($03,X)
  $BB0F  03        .db $03
  $BB10  FF        .db $FF
  $BB11  FF        .db $FF
  $BB12  C1 3E     CMP ($3E,X)
  $BB14  C0 80     CPY #$80
  $BB16  00        BRK
  $BB17  00        BRK
  $BB18  00        BRK
  $BB19  00        BRK
  $BB1A  00        BRK
  $BB1B  3E FE FF  ROL $FFFE,X
  $BB1E  FF        .db $FF
  $BB1F  FF        .db $FF
  $BB20  FF        .db $FF
  $BB21  FF        .db $FF
  $BB22  FF        .db $FF
  $BB23  0F        .db $0F
  $BB24  03        .db $03
  $BB25  01 00     ORA ($00,X)
  $BB27  00        BRK
  $BB28  00        BRK
  $BB29  00        BRK

L_BB2A:
  $BB2A  00        BRK
  $BB2B  00        BRK
  $BB2C  F0 FC     BEQ $BB2A
  $BB2E  FE FF 00  INC $00FF,X
  $BB31  80        .db $80
  $BB32  C0 C0     CPY #$C0
  $BB34  E0 E0     CPX #$E0
  $BB36  F0 70     BEQ $BBA8
  $BB38  00        BRK
  $BB39  38        SEC
  $BB3A  1E 1E 0F  ASL $0F1E,X
  $BB3D  0F        .db $0F
  $BB3E  06 02     ASL $02
  $BB40  07        .db $07
  $BB41  04        .db $04
  $BB42  00        BRK
  $BB43  00        BRK
  $BB44  00        BRK
  $BB45  00        BRK
  $BB46  00        BRK
  $BB47  00        BRK
  $BB48  07        .db $07
  $BB49  04        .db $04
  $BB4A  03        .db $03
  $BB4B  07        .db $07
  $BB4C  0F        .db $0F
  $BB4D  0F        .db $0F
  $BB4E  1F        .db $1F
  $BB4F  1F        .db $1F
  $BB50  00        BRK
  $BB51  00        BRK
  $BB52  00        BRK
  $BB53  00        BRK
  $BB54  00        BRK
  $BB55  00        BRK
  $BB56  00        BRK
  $BB57  00        BRK
  $BB58  3F        .db $3F
  $BB59  FF        .db $FF
  $BB5A  FF        .db $FF
  $BB5B  FF        .db $FF
  $BB5C  FF        .db $FF
  $BB5D  FF        .db $FF
  $BB5E  FF        .db $FF
  $BB5F  FF        .db $FF
  $BB60  06 01     ASL $01
  $BB62  00        BRK
  $BB63  00        BRK
  $BB64  00        BRK
  $BB65  00        BRK
  $BB66  00        BRK
  $BB67  00        BRK
  $BB68  C0 F0     CPY #$F0
  $BB6A  FC        .db $FC
  $BB6B  FE FF FF  INC $FFFF,X
  $BB6E  FF        .db $FF
  $BB6F  FF        .db $FF
  $BB70  E3        .db $E3
  $BB71  67        .db $67
  $BB72  87        .db $87
  $BB73  47        .db $47
  $BB74  33        .db $33
  $BB75  1C        .db $1C
  $BB76  1F        .db $1F
  $BB77  0F        .db $0F
  $BB78  03        .db $03
  $BB79  07        .db $07
  $BB7A  07        .db $07
  $BB7B  07        .db $07
  $BB7C  03        .db $03
  $BB7D  80        .db $80
  $BB7E  80        .db $80
  $BB7F  C0 00     CPY #$00
  $BB81  00        BRK
  $BB82  00        BRK
  $BB83  80        .db $80
  $BB84  D8        CLD
  $BB85  F0 0F     BEQ $BB96
  $BB87  FF        .db $FF
  $BB88  FF        .db $FF
  $BB89  FB        .db $FB
  $BB8A  FB        .db $FB
  $BB8B  FB        .db $FB
  $BB8C  F9 F0 00  SBC $00F0,Y
  $BB8F  00        BRK
  $BB90  00        BRK
  $BB91  00        BRK
  $BB92  00        BRK
  $BB93  00        BRK
  $BB94  00        BRK
  $BB95  00        BRK

L_BB96:
  $BB96  07        .db $07
  $BB97  C7        .db $C7
  $BB98  FD FC FE  SBC $FEFC,X
  $BB9B  FE FE F0  INC $F0FE,X
  $BB9E  30 00     BMI $BBA0

L_BBA0:
  $BBA0  78        SEI
  $BBA1  F8        SED
  $BBA2  F8        SED
  $BBA3  FC        .db $FC
  $BBA4  FC        .db $FC
  $BBA5  FC        .db $FC
  $BBA6  FC        .db $FC
  $BBA7  FC        .db $FC

L_BBA8:
  $BBA8  00        BRK
  $BBA9  00        BRK
  $BBAA  00        BRK
  $BBAB  00        BRK
  $BBAC  00        BRK
  $BBAD  00        BRK
  $BBAE  00        BRK
  $BBAF  00        BRK
  $BBB0  00        BRK
  $BBB1  00        BRK
  $BBB2  00        BRK
  $BBB3  00        BRK
  $BBB4  00        BRK
  $BBB5  00        BRK
  $BBB6  00        BRK
  $BBB7  00        BRK
  $BBB8  1E 3C 38  ASL $383C,X
  $BBBB  38        SEC
  $BBBC  38        SEC
  $BBBD  38        SEC
  $BBBE  38        SEC
  $BBBF  18        CLC
  $BBC0  00        BRK
  $BBC1  00        BRK
  $BBC2  00        BRK
  $BBC3  20 70 70  JSR $7070
  $BBC6  70 20     BVS $BBE8
  $BBC8  1F        .db $1F
  $BBC9  0F        .db $0F
  $BBCA  07        .db $07
  $BBCB  27        .db $27
  $BBCC  77        .db $77
  $BBCD  77        .db $77
  $BBCE  77        .db $77
  $BBCF  27        .db $27
  $BBD0  00        BRK
  $BBD1  00        BRK
  $BBD2  00        BRK
  $BBD3  00        BRK
  $BBD4  00        BRK
  $BBD5  00        BRK
  $BBD6  00        BRK
  $BBD7  00        BRK
  $BBD8  FF        .db $FF
  $BBD9  FF        .db $FF
  $BBDA  FF        .db $FF
  $BBDB  FF        .db $FF
  $BBDC  FF        .db $FF
  $BBDD  FF        .db $FF

L_BBDE:
  $BBDE  FF        .db $FF
  $BBDF  FF        .db $FF

L_BBE0:
  $BBE0  0F        .db $0F
  $BBE1  07        .db $07
  $BBE2  07        .db $07
  $BBE3  03        .db $03
  $BBE4  03        .db $03
  $BBE5  03        .db $03
  $BBE6  03        .db $03
  $BBE7  03        .db $03

L_BBE8:
  $BBE8  C0 E0     CPY #$E0
  $BBEA  E0 E0     CPX #$E0
  $BBEC  F0 F0     BEQ $BBDE
  $BBEE  F0 F0     BEQ $BBE0
  $BBF0  FF        .db $FF
  $BBF1  FF        .db $FF
  $BBF2  FF        .db $FF
  $BBF3  FF        .db $FF
  $BBF4  FF        .db $FF
  $BBF5  FF        .db $FF
  $BBF6  FF        .db $FF
  $BBF7  FF        .db $FF
  $BBF8  00        BRK
  $BBF9  00        BRK
  $BBFA  00        BRK
  $BBFB  00        BRK
  $BBFC  00        BRK
  $BBFD  00        BRK
  $BBFE  00        BRK
  $BBFF  00        BRK
  $BC00  FF        .db $FF
  $BC01  FF        .db $FF
  $BC02  FF        .db $FF
  $BC03  FF        .db $FF
  $BC04  FF        .db $FF
  $BC05  FF        .db $FF
  $BC06  FF        .db $FF
  $BC07  FF        .db $FF
  $BC08  00        BRK
  $BC09  00        BRK
  $BC0A  00        BRK
  $BC0B  00        BRK
  $BC0C  00        BRK
  $BC0D  00        BRK
  $BC0E  00        BRK
  $BC0F  00        BRK
  $BC10  FC        .db $FC
  $BC11  FC        .db $FC
  $BC12  FC        .db $FC
  $BC13  FC        .db $FC
  $BC14  F8        SED
  $BC15  F8        SED
  $BC16  F8        SED
  $BC17  F0 00     BEQ $BC19

L_BC19:
  $BC19  00        BRK
  $BC1A  00        BRK
  $BC1B  01 01     ORA ($01,X)
  $BC1D  01 03     ORA ($03,X)
  $BC1F  03        .db $03
  $BC20  00        BRK
  $BC21  00        BRK
  $BC22  00        BRK
  $BC23  00        BRK
  $BC24  00        BRK
  $BC25  00        BRK
  $BC26  00        BRK
  $BC27  00        BRK
  $BC28  80        .db $80
  $BC29  C0 C0     CPY #$C0
  $BC2B  C0 E0     CPY #$E0
  $BC2D  E0 E0     CPX #$E0
  $BC2F  E0 00     CPX #$00
  $BC31  00        BRK
  $BC32  00        BRK
  $BC33  00        BRK
  $BC34  10 10     BPL $BC46
  $BC36  18        CLC
  $BC37  1C        .db $1C
  $BC38  1C        .db $1C
  $BC39  1E 0F 0F  ASL $0F0F,X
  $BC3C  17        .db $17
  $BC3D  17        .db $17
  $BC3E  1B        .db $1B
  $BC3F  1D 00 00  ORA $0000,X
  $BC42  00        BRK
  $BC43  00        BRK
  $BC44  00        BRK
  $BC45  00        BRK

L_BC46:
  $BC46  00        BRK
  $BC47  00        BRK
  $BC48  0F        .db $0F
  $BC49  1F        .db $1F

L_BC4A:
  $BC4A  FF        .db $FF
  $BC4B  FF        .db $FF
  $BC4C  FF        .db $FF
  $BC4D  FF        .db $FF
  $BC4E  FC        .db $FC
  $BC4F  F0 00     BEQ $BC51

L_BC51:
  $BC51  00        BRK
  $BC52  00        BRK
  $BC53  00        BRK
  $BC54  00        BRK
  $BC55  00        BRK
  $BC56  30 F8     BMI $BC50
  $BC58  FF        .db $FF
  $BC59  FF        .db $FF
  $BC5A  FF        .db $FF
  $BC5B  FF        .db $FF
  $BC5C  87        .db $87
  $BC5D  03        .db $03
  $BC5E  01 01     ORA ($01,X)
  $BC60  03        .db $03
  $BC61  03        .db $03
  $BC62  07        .db $07
  $BC63  07        .db $07
  $BC64  0F        .db $0F
  $BC65  0F        .db $0F
  $BC66  1F        .db $1F
  $BC67  3F        .db $3F
  $BC68  F0 E0     BEQ $BC4A
  $BC6A  E0 E0     CPX #$E0
  $BC6C  C0 C0     CPY #$C0
  $BC6E  80        .db $80
  $BC6F  00        BRK
  $BC70  FF        .db $FF
  $BC71  FF        .db $FF

L_BC72:
  $BC72  FF        .db $FF
  $BC73  FF        .db $FF
  $BC74  FF        .db $FF
  $BC75  FF        .db $FF
  $BC76  FF        .db $FF
  $BC77  FF        .db $FF
  $BC78  00        BRK
  $BC79  00        BRK
  $BC7A  00        BRK
  $BC7B  00        BRK
  $BC7C  00        BRK
  $BC7D  00        BRK
  $BC7E  00        BRK
  $BC7F  00        BRK
  $BC80  FF        .db $FF
  $BC81  FF        .db $FF
  $BC82  FF        .db $FF
  $BC83  FF        .db $FF
  $BC84  FF        .db $FF
  $BC85  FF        .db $FF
  $BC86  FE FC 00  INC $00FC,X
  $BC89  00        BRK
  $BC8A  00        BRK
  $BC8B  00        BRK
  $BC8C  00        BRK
  $BC8D  00        BRK
  $BC8E  00        BRK
  $BC8F  00        BRK
  $BC90  F0 E0     BEQ $BC72
  $BC92  E0 C0     CPX #$C0
  $BC94  80        .db $80
  $BC95  00        BRK
  $BC96  00        BRK
  $BC97  00        BRK
  $BC98  07        .db $07
  $BC99  07        .db $07
  $BC9A  0F        .db $0F
  $BC9B  0F        .db $0F
  $BC9C  1F        .db $1F
  $BC9D  3F        .db $3F
  $BC9E  7E 38 00  ROR $0038,X
  $BCA1  00        BRK
  $BCA2  00        BRK
  $BCA3  00        BRK
  $BCA4  00        BRK
  $BCA5  00        BRK
  $BCA6  00        BRK
  $BCA7  00        BRK
  $BCA8  E0 C0     CPX #$C0
  $BCAA  C0 80     CPY #$80
  $BCAC  80        .db $80
  $BCAD  00        BRK
  $BCAE  00        BRK
  $BCAF  00        BRK
  $BCB0  0E 0F 0F  ASL $0F0F
  $BCB3  0F        .db $0F
  $BCB4  07        .db $07
  $BCB5  07        .db $07
  $BCB6  07        .db $07
  $BCB7  03        .db $03
  $BCB8  0E 0F 0F  ASL $0F0F
  $BCBB  0F        .db $0F
  $BCBC  07        .db $07
  $BCBD  07        .db $07
  $BCBE  07        .db $07
  $BCBF  03        .db $03
  $BCC0  01 03     ORA ($03,X)
  $BCC2  C7        .db $C7

L_BCC3:
  $BCC3  F0 FE     BEQ $BCC3
  $BCC5  FF        .db $FF
  $BCC6  FF        .db $FF
  $BCC7  F1 00     SBC ($00),Y
  $BCC9  00        BRK
  $BCCA  C0 F0     CPY #$F0
  $BCCC  FE FF FF  INC $FFFF,X
  $BCCF  FF        .db $FF
  $BCD0  C0 80     CPY #$80
  $BCD2  00        BRK
  $BCD3  00        BRK
  $BCD4  02        .db $02
  $BCD5  41 A1     EOR ($A1,X)
  $BCD7  D0 00     BNE $BCD9

L_BCD9:
  $BCD9  3C        .db $3C
  $BCDA  7E FF FB  ROR $FBFF,X
  $BCDD  7D BD DE  ADC $DEBD,X
  $BCE0  FF        .db $FF
  $BCE1  FF        .db $FF
  $BCE2  FF        .db $FF
  $BCE3  7F        .db $7F
  $BCE4  3F        .db $3F
  $BCE5  0F        .db $0F
  $BCE6  80        .db $80
  $BCE7  C0 00     CPY #$00
  $BCE9  00        BRK
  $BCEA  00        BRK
  $BCEB  00        BRK
  $BCEC  80        .db $80
  $BCED  C0 F0     CPY #$F0
  $BCEF  FC        .db $FC
  $BCF0  FF        .db $FF
  $BCF1  FF        .db $FF
  $BCF2  FF        .db $FF
  $BCF3  FE F8 80  INC $80F8,X
  $BCF6  00        BRK
  $BCF7  00        BRK
  $BCF8  00        BRK
  $BCF9  00        BRK
  $BCFA  00        BRK
  $BCFB  00        BRK
  $BCFC  00        BRK
  $BCFD  00        BRK
  $BCFE  00        BRK
  $BCFF  00        BRK
  $BD00  F8        SED
  $BD01  E0 80     CPX #$80
  $BD03  00        BRK
  $BD04  60        RTS
  $BD05  18        CLC
  $BD06  04        .db $04
  $BD07  01 00     ORA ($00,X)
  $BD09  00        BRK
  $BD0A  00        BRK
  $BD0B  03        .db $03
  $BD0C  7F        .db $7F
  $BD0D  1F        .db $1F
  $BD0E  07        .db $07
  $BD0F  01 00     ORA ($00,X)
  $BD11  00        BRK
  $BD12  00        BRK
  $BD13  40        RTI
  $BD14  20 10 0C  JSR $0C10
  $BD17  03        .db $03
  $BD18  00        BRK
  $BD19  00        BRK
  $BD1A  40        RTI
  $BD1B  E0 B0     CPX #$B0
  $BD1D  DC        .db $DC
  $BD1E  EF        .db $EF
  $BD1F  F3        .db $F3
  $BD20  00        BRK
  $BD21  00        BRK
  $BD22  00        BRK
  $BD23  00        BRK
  $BD24  00        BRK
  $BD25  00        BRK
  $BD26  00        BRK
  $BD27  80        .db $80
  $BD28  00        BRK
  $BD29  00        BRK
  $BD2A  00        BRK
  $BD2B  00        BRK
  $BD2C  00        BRK
  $BD2D  00        BRK
  $BD2E  00        BRK
  $BD2F  E0 01     CPX #$01
  $BD31  01 00     ORA ($00,X)
  $BD33  00        BRK
  $BD34  00        BRK
  $BD35  00        BRK
  $BD36  00        BRK
  $BD37  00        BRK
  $BD38  01 01     ORA ($01,X)
  $BD3A  00        BRK
  $BD3B  00        BRK
  $BD3C  00        BRK
  $BD3D  00        BRK
  $BD3E  00        BRK
  $BD3F  00        BRK
  $BD40  E0 E0     CPX #$E0
  $BD42  E0 F0     CPX #$F0
  $BD44  7C        .db $7C
  $BD45  3F        .db $3F
  $BD46  1C        .db $1C
  $BD47  18        CLC
  $BD48  FF        .db $FF
  $BD49  FF        .db $FF
  $BD4A  FF        .db $FF
  $BD4B  FF        .db $FF
  $BD4C  7F        .db $7F
  $BD4D  3F        .db $3F
  $BD4E  1F        .db $1F
  $BD4F  1F        .db $1F
  $BD50  68        PLA
  $BD51  28        PLP
  $BD52  34        .db $34
  $BD53  14        .db $14
  $BD54  EA        NOP
  $BD55  8B        .db $8B
  $BD56  0D 05 EF  ORA $EF05
  $BD59  EF        .db $EF
  $BD5A  F7        .db $F7
  $BD5B  F7        .db $F7
  $BD5C  FB        .db $FB
  $BD5D  FB        .db $FB
  $BD5E  FD FD 00  SBC $00FD,X
  $BD61  30 18     BMI $BD7B
  $BD63  06 03     ASL $03
  $BD65  00        BRK
  $BD66  00        BRK
  $BD67  80        .db $80
  $BD68  7F        .db $7F
  $BD69  BF        .db $BF
  $BD6A  DF        .db $DF
  $BD6B  E7        .db $E7
  $BD6C  FB        .db $FB
  $BD6D  FC        .db $FC
  $BD6E  FF        .db $FF
  $BD6F  FF        .db $FF
  $BD70  00        BRK
  $BD71  00        BRK
  $BD72  00        BRK
  $BD73  00        BRK
  $BD74  00        BRK
  $BD75  C0 72     CPY #$72
  $BD77  37        .db $37
  $BD78  00        BRK
  $BD79  C0 F0     CPY #$F0

L_BD7B:
  $BD7B  FC        .db $FC
  $BD7C  FE F8 70  INC $70F8,X
  $BD7F  B0 00     BCS $BD81

L_BD81:
  $BD81  00        BRK
  $BD82  00        BRK
  $BD83  00        BRK
  $BD84  00        BRK
  $BD85  00        BRK
  $BD86  00        BRK
  $BD87  00        BRK
  $BD88  00        BRK
  $BD89  00        BRK
  $BD8A  00        BRK
  $BD8B  00        BRK
  $BD8C  00        BRK
  $BD8D  00        BRK
  $BD8E  00        BRK
  $BD8F  00        BRK
  $BD90  C0 60     CPY #$60
  $BD92  20 30 18  JSR $1830
  $BD95  08        PHP
  $BD96  06 03     ASL $03
  $BD98  FC        .db $FC
  $BD99  7F        .db $7F
  $BD9A  3F        .db $3F
  $BD9B  3F        .db $3F
  $BD9C  1F        .db $1F
  $BD9D  0F        .db $0F
  $BD9E  07        .db $07
  $BD9F  03        .db $03
  $BDA0  60        RTS
  $BDA1  10 0C     BPL $BDAF
  $BDA3  0E 76 7B  ASL $7B76
  $BDA6  79 7C 78  ADC $787C,Y
  $BDA9  9C        .db $9C
  $BDAA  C0 80     CPY #$80
  $BDAC  00        BRK
  $BDAD  00        BRK
  $BDAE  00        BRK

L_BDAF:
  $BDAF  00        BRK
  $BDB0  0C        .db $0C
  $BDB1  0E 06 03  ASL $0306
  $BDB4  03        .db $03
  $BDB5  01 01     ORA ($01,X)
  $BDB7  00        BRK
  $BDB8  0F        .db $0F
  $BDB9  0F        .db $0F
  $BDBA  07        .db $07
  $BDBB  03        .db $03
  $BDBC  03        .db $03
  $BDBD  01 01     ORA ($01,X)
  $BDBF  00        BRK
  $BDC0  06 02     ASL $02
  $BDC2  07        .db $07
  $BDC3  8F        .db $8F
  $BDC4  F1 C0     SBC ($C0),Y
  $BDC6  80        .db $80
  $BDC7  C0 FE     CPY #$FE
  $BDC9  FE FF FF  INC $FFFF,X
  $BDCC  FF        .db $FF
  $BDCD  FF        .db $FF
  $BDCE  FF        .db $FF
  $BDCF  FF        .db $FF
  $BDD0  80        .db $80
  $BDD1  C1 43     CMP ($43,X)
  $BDD3  62        .db $62
  $BDD4  B6 DE     LDX $DE,Y
  $BDD6  E6 38     INC $38
  $BDD8  FF        .db $FF
  $BDD9  FF        .db $FF
  $BDDA  7F        .db $7F
  $BDDB  7E BE DE  ROR $DEBE,X
  $BDDE  E6 F8     INC $F8
  $BDE0  07        .db $07
  $BDE1  C7        .db $C7
  $BDE2  03        .db $03
  $BDE3  E1 F0     SBC ($F0,X)
  $BDE5  F0 F8     BEQ $BDDF
  $BDE7  78        SEI
  $BDE8  C0 E0     CPY #$E0
  $BDEA  10 00     BPL $BDEC

L_BDEC:
  $BDEC  00        BRK
  $BDED  00        BRK
  $BDEE  00        BRK
  $BDEF  00        BRK
  $BDF0  00        BRK
  $BDF1  80        .db $80
  $BDF2  80        .db $80
  $BDF3  80        .db $80
  $BDF4  80        .db $80
  $BDF5  00        BRK
  $BDF6  00        BRK
  $BDF7  00        BRK
  $BDF8  00        BRK
  $BDF9  00        BRK
  $BDFA  00        BRK
  $BDFB  00        BRK
  $BDFC  00        BRK
  $BDFD  00        BRK
  $BDFE  00        BRK
  $BDFF  00        BRK
  $BE00  00        BRK
  $BE01  00        BRK
  $BE02  00        BRK
  $BE03  00        BRK
  $BE04  00        BRK
  $BE05  00        BRK
  $BE06  00        BRK
  $BE07  00        BRK
  $BE08  00        BRK
  $BE09  00        BRK
  $BE0A  00        BRK
  $BE0B  00        BRK
  $BE0C  00        BRK
  $BE0D  00        BRK
  $BE0E  00        BRK
  $BE0F  00        BRK
  $BE10  1C        .db $1C
  $BE11  00        BRK
  $BE12  00        BRK
  $BE13  00        BRK
  $BE14  00        BRK
  $BE15  00        BRK
  $BE16  00        BRK
  $BE17  00        BRK
  $BE18  00        BRK
  $BE19  00        BRK
  $BE1A  00        BRK
  $BE1B  00        BRK
  $BE1C  00        BRK
  $BE1D  00        BRK
  $BE1E  00        BRK
  $BE1F  00        BRK
  $BE20  C0 40     CPY #$40
  $BE22  60        RTS
  $BE23  30 3F     BMI $BE64
  $BE25  30 10     BMI $BE37
  $BE27  10 FF     BPL $BE28
  $BE29  7F        .db $7F
  $BE2A  7F        .db $7F
  $BE2B  3F        .db $3F
  $BE2C  3F        .db $3F
  $BE2D  3F        .db $3F
  $BE2E  1F        .db $1F
  $BE2F  1F        .db $1F
  $BE30  1F        .db $1F
  $BE31  0F        .db $0F
  $BE32  27        .db $27
  $BE33  C1 01     CMP ($01,X)
  $BE35  01 03     ORA ($03,X)

L_BE37:
  $BE37  02        .db $02
  $BE38  FF        .db $FF
  $BE39  FF        .db $FF
  $BE3A  FF        .db $FF
  $BE3B  FF        .db $FF
  $BE3C  FF        .db $FF
  $BE3D  FF        .db $FF
  $BE3E  FF        .db $FF
  $BE3F  FE 38 18  INC $1838,X
  $BE42  00        BRK
  $BE43  00        BRK
  $BE44  00        BRK
  $BE45  00        BRK
  $BE46  00        BRK
  $BE47  00        BRK
  $BE48  00        BRK
  $BE49  00        BRK
  $BE4A  00        BRK
  $BE4B  00        BRK
  $BE4C  00        BRK
  $BE4D  00        BRK
  $BE4E  00        BRK
  $BE4F  00        BRK
  $BE50  00        BRK
  $BE51  00        BRK
  $BE52  00        BRK
  $BE53  00        BRK
  $BE54  00        BRK
  $BE55  00        BRK
  $BE56  00        BRK
  $BE57  00        BRK
  $BE58  00        BRK
  $BE59  00        BRK
  $BE5A  00        BRK
  $BE5B  00        BRK
  $BE5C  00        BRK
  $BE5D  00        BRK
  $BE5E  00        BRK
  $BE5F  00        BRK
  $BE60  00        BRK
  $BE61  00        BRK
  $BE62  00        BRK
  $BE63  00        BRK

L_BE64:
  $BE64  00        BRK
  $BE65  00        BRK
  $BE66  00        BRK
  $BE67  00        BRK
  $BE68  00        BRK
  $BE69  00        BRK
  $BE6A  00        BRK
  $BE6B  00        BRK
  $BE6C  00        BRK
  $BE6D  00        BRK
  $BE6E  00        BRK
  $BE6F  00        BRK
  $BE70  00        BRK
  $BE71  00        BRK
  $BE72  00        BRK
  $BE73  00        BRK
  $BE74  00        BRK
  $BE75  00        BRK
  $BE76  00        BRK
  $BE77  00        BRK
  $BE78  00        BRK
  $BE79  00        BRK
  $BE7A  00        BRK
  $BE7B  00        BRK
  $BE7C  00        BRK
  $BE7D  00        BRK
  $BE7E  00        BRK
  $BE7F  00        BRK
  $BE80  00        BRK
  $BE81  00        BRK
  $BE82  00        BRK
  $BE83  00        BRK
  $BE84  00        BRK
  $BE85  00        BRK
  $BE86  00        BRK
  $BE87  00        BRK
  $BE88  00        BRK
  $BE89  00        BRK
  $BE8A  00        BRK
  $BE8B  00        BRK
  $BE8C  00        BRK
  $BE8D  00        BRK
  $BE8E  00        BRK
  $BE8F  00        BRK
  $BE90  00        BRK
  $BE91  00        BRK
  $BE92  00        BRK
  $BE93  00        BRK
  $BE94  00        BRK
  $BE95  00        BRK
  $BE96  00        BRK
  $BE97  00        BRK
  $BE98  00        BRK
  $BE99  00        BRK
  $BE9A  00        BRK
  $BE9B  00        BRK
  $BE9C  00        BRK
  $BE9D  00        BRK
  $BE9E  00        BRK
  $BE9F  00        BRK
  $BEA0  00        BRK
  $BEA1  00        BRK
  $BEA2  00        BRK
  $BEA3  00        BRK
  $BEA4  00        BRK
  $BEA5  00        BRK
  $BEA6  00        BRK
  $BEA7  00        BRK
  $BEA8  00        BRK
  $BEA9  00        BRK
  $BEAA  00        BRK
  $BEAB  00        BRK
  $BEAC  00        BRK
  $BEAD  00        BRK
  $BEAE  00        BRK
  $BEAF  00        BRK
  $BEB0  00        BRK
  $BEB1  00        BRK
  $BEB2  00        BRK
  $BEB3  00        BRK
  $BEB4  00        BRK
  $BEB5  00        BRK
  $BEB6  00        BRK
  $BEB7  00        BRK
  $BEB8  00        BRK
  $BEB9  00        BRK
  $BEBA  00        BRK
  $BEBB  00        BRK
  $BEBC  00        BRK
  $BEBD  00        BRK
  $BEBE  00        BRK
  $BEBF  00        BRK
  $BEC0  00        BRK
  $BEC1  00        BRK
  $BEC2  00        BRK
  $BEC3  00        BRK
  $BEC4  00        BRK
  $BEC5  00        BRK
  $BEC6  00        BRK
  $BEC7  00        BRK
  $BEC8  00        BRK
  $BEC9  00        BRK
  $BECA  00        BRK
  $BECB  00        BRK
  $BECC  00        BRK
  $BECD  00        BRK
  $BECE  00        BRK
  $BECF  00        BRK
  $BED0  00        BRK
  $BED1  00        BRK
  $BED2  00        BRK
  $BED3  00        BRK
  $BED4  00        BRK
  $BED5  00        BRK
  $BED6  00        BRK
  $BED7  00        BRK
  $BED8  00        BRK
  $BED9  00        BRK
  $BEDA  00        BRK
  $BEDB  00        BRK
  $BEDC  00        BRK
  $BEDD  00        BRK
  $BEDE  00        BRK
  $BEDF  00        BRK
  $BEE0  00        BRK
  $BEE1  00        BRK
  $BEE2  00        BRK
  $BEE3  00        BRK
  $BEE4  00        BRK
  $BEE5  00        BRK
  $BEE6  00        BRK
  $BEE7  00        BRK
  $BEE8  00        BRK
  $BEE9  00        BRK
  $BEEA  00        BRK
  $BEEB  00        BRK
  $BEEC  00        BRK
  $BEED  00        BRK
  $BEEE  00        BRK
  $BEEF  00        BRK
  $BEF0  00        BRK
  $BEF1  00        BRK
  $BEF2  00        BRK
  $BEF3  00        BRK
  $BEF4  00        BRK
  $BEF5  00        BRK
  $BEF6  00        BRK
  $BEF7  00        BRK
  $BEF8  00        BRK
  $BEF9  00        BRK
  $BEFA  00        BRK
  $BEFB  00        BRK
  $BEFC  00        BRK
  $BEFD  00        BRK
  $BEFE  00        BRK
  $BEFF  00        BRK
  $BF00  00        BRK
  $BF01  00        BRK
  $BF02  00        BRK
  $BF03  00        BRK
  $BF04  00        BRK
  $BF05  00        BRK
  $BF06  00        BRK
  $BF07  00        BRK
  $BF08  00        BRK
  $BF09  00        BRK
  $BF0A  00        BRK
  $BF0B  00        BRK
  $BF0C  00        BRK
  $BF0D  00        BRK
  $BF0E  00        BRK
  $BF0F  00        BRK
  $BF10  00        BRK
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