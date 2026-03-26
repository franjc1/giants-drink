; Mega Man 2 — PRG Bank 2
; Base address: $8000
; Size: 16384 bytes

  $8000  01 01     ORA ($01,X)
  $8002  01 01     ORA ($01,X)
  $8004  00        BRK
  $8005  00        BRK
  $8006  00        BRK
  $8007  00        BRK
  $8008  6E 6E 6E  ROR $6E6E
  $800B  6E 6E 6E  ROR $6E6E
  $800E  6F        .db $6F
  $800F  6F        .db $6F
  $8010  6E 6E 2F  ROR $2F6E
  $8013  2F        .db $2F
  $8014  32        .db $32
  $8015  3E 31 3E  ROL $3E31,X
  $8018  31 3E     AND ($3E),Y
  $801A  31 3E     AND ($3E),Y
  $801C  31 3E     AND ($3E),Y
  $801E  33        .db $33
  $801F  3E 31 28  ROL $2831,X
  $8022  31 3E     AND ($3E),Y
  $8024  31 3E     AND ($3E),Y
  $8026  2E 32 2E  ROL $2E32
  $8029  2E 2E 2E  ROL $2E2E
  $802C  2E 2E 2F  ROL $2F2E
  $802F  2F        .db $2F
  $8030  32        .db $32
  $8031  3E 2E 32  ROL $322E,X
  $8034  2E 31 2E  ROL $2E31
  $8037  31 2E     AND ($2E),Y
  $8039  33        .db $33
  $803A  33        .db $33
  $803B  3E 2A 2A  ROL $2A2A,X
  $803E  00        BRK
  $803F  00        BRK
  $8040  2E 32 2E  ROL $2E32
  $8043  31 2E     AND ($2E),Y
  $8045  33        .db $33
  $8046  31 3E     AND ($3E),Y
  $8048  28        PLP
  $8049  28        PLP
  $804A  3D 00 3D  AND $3D00,X
  $804D  00        BRK
  $804E  3E 36 37  ROL $3736,X
  $8051  00        BRK
  $8052  36 00     ROL $00,X
  $8054  3E 3D 3E  ROL $3E3D,X
  $8057  3D 36 00  AND $0036,X
  $805A  3D 00 2A  AND $2A00,X
  $805D  2B        .db $2B
  $805E  2D 60 3E  AND $3E60
  $8061  3D 3E 37  AND $373E,X
  $8064  3D 2A 3D  AND $3D2A,X
  $8067  00        BRK
  $8068  28        PLP
  $8069  28        PLP
  $806A  3E 3D 3E  ROL $3E3D,X
  $806D  2A        ROL
  $806E  37        .db $37
  $806F  00        BRK
  $8070  3E 2A 3E  ROL $3E2A,X
  $8073  36 00     ROL $00,X
  $8075  2D 00 2D  AND $2D00
  $8078  2A        ROL
  $8079  2B        .db $2B
  $807A  00        BRK
  $807B  2D 28 28  AND $2828
  $807E  00        BRK
  $807F  2D 01 34  AND $3401
  $8082  34        .db $34
  $8083  2E 2C 2E  ROL $2E2C
  $8086  2C 2E 28  BIT $282E
  $8089  28        PLP
  $808A  3E 3E 35  ROL $353E,X
  $808D  2E 01 35  ROL $3501
  $8090  2C 2E 3F  BIT $3F2E
  $8093  2F        .db $2F
  $8094  3E 3E 3E  ROL $3E3E,X
  $8097  3E 2E 31  ROL $312E,X
  $809A  21 33     AND ($33,X)
  $809C  3E 37 3D  ROL $3D37,X
  $809F  00        BRK
  $80A0  00        BRK
  $80A1  2D 08 08  AND $0808
  $80A4  31 3E     AND ($3E),Y
  $80A6  59 59 78  EOR $7859,Y
  $80A9  78        SEI
  $80AA  59 59 79  EOR $7959,Y
  $80AD  79 21 21  ADC $2121,Y
  $80B0  21 21     AND ($21,X)
  $80B2  78        SEI
  $80B3  78        SEI
  $80B4  2B        .db $2B
  $80B5  60        RTS
  $80B6  2D 60 28  AND $2860
  $80B9  60        RTS
  $80BA  2D 60 2A  AND $2A60
  $80BD  2B        .db $2B
  $80BE  2D 60 6E  AND $6E60
  $80C1  6E 59 59  ROR $5959
  $80C4  3E 37 59  ROL $5937,X
  $80C7  59 58 58  EOR $5858,Y
  $80CA  79 79 79  ADC $7979,Y
  $80CD  58        CLI
  $80CE  21 60     AND ($60,X)
  $80D0  5A        .db $5A
  $80D1  01 01     ORA ($01,X)
  $80D3  01 82     ORA ($82,X)
  $80D5  00        BRK
  $80D6  5A        .db $5A
  $80D7  00        BRK
  $80D8  5A        .db $5A
  $80D9  00        BRK
  $80DA  5A        .db $5A
  $80DB  00        BRK
  $80DC  82        .db $82
  $80DD  82        .db $82
  $80DE  2E 2E 2E  ROL $2E2E
  $80E1  2E 59 59  ROL $5959
  $80E4  00        BRK
  $80E5  00        BRK
  $80E6  59 59 58  EOR $5859,Y
  $80E9  58        CLI
  $80EA  59 79 60  EOR $6079,Y
  $80ED  78        SEI
  $80EE  60        RTS
  $80EF  59 60 58  EOR $5860,Y
  $80F2  60        RTS
  $80F3  79 5B 5D  ADC $5D5B,Y
  $80F6  EF        .db $EF
  $80F7  60        RTS
  $80F8  5B        .db $5B
  $80F9  5D EF 81  EOR $81EF,X
  $80FC  00        BRK
  $80FD  00        BRK
  $80FE  00        BRK
  $80FF  00        BRK
  $8100  01 60     ORA ($60,X)
  $8102  01 60     ORA ($60,X)
  $8104  E8        INX
  $8105  60        RTS
  $8106  01 60     ORA ($60,X)
  $8108  82        .db $82
  $8109  82        .db $82
  $810A  59 59 01  EOR $0159,Y
  $810D  01 59     ORA ($59,X)
  $810F  59 21 21  EOR $2121,Y
  $8112  21 21     AND ($21,X)
  $8114  22        .db $22
  $8115  21 22     AND ($22,X)
  $8117  21 21     AND ($21,X)
  $8119  21 22     AND ($22,X)
  $811B  21 22     AND ($22,X)
  $811D  21 21     AND ($21,X)
  $811F  21 21     AND ($21,X)
  $8121  21 82     AND ($82,X)
  $8123  82        .db $82
  $8124  21 21     AND ($21,X)
  $8126  82        .db $82
  $8127  21 21     AND ($21,X)
  $8129  24 1D     BIT $1D
  $812B  25 1E     AND $1E
  $812D  26 1F     ROL $1F
  $812F  27        .db $27
  $8130  22        .db $22
  $8131  21 21     AND ($21,X)
  $8133  23        .db $23
  $8134  21 1B     AND ($1B,X)
  $8136  21 1C     AND ($1C,X)
  $8138  60        RTS
  $8139  58        CLI
  $813A  60        RTS
  $813B  59 58 58  EOR $5858,Y
  $813E  59 59 00  EOR $0059,Y
  $8141  00        BRK
  $8142  08        PHP
  $8143  08        PHP
  $8144  2E 31 49  ROL $4931
  $8147  49 47     EOR #$47
  $8149  4C 47 4D  JMP $4D47
  $814C  4E 4B 4F  LSR $4F4B
  $814F  4B        .db $4B
  $8150  22        .db $22
  $8151  21 08     AND ($08,X)
  $8153  08        PHP
  $8154  21 21     AND ($21,X)
  $8156  08        PHP
  $8157  08        PHP
  $8158  5A        .db $5A
  $8159  22        .db $22
  $815A  22        .db $22
  $815B  21 21     AND ($21,X)
  $815D  60        RTS
  $815E  21 60     AND ($60,X)
  $8160  82        .db $82
  $8161  82        .db $82
  $8162  22        .db $22
  $8163  21 22     AND ($22,X)
  $8165  21 59     AND ($59,X)
  $8167  59 58 58  EOR $5858,Y
  $816A  21 21     AND ($21,X)
  $816C  22        .db $22
  $816D  21 82     AND ($82,X)
  $816F  82        .db $82
  $8170  58        CLI
  $8171  58        CLI
  $8172  82        .db $82
  $8173  82        .db $82
  $8174  5A        .db $5A
  $8175  22        .db $22
  $8176  59 59 22  EOR $2259,Y
  $8179  21 5A     AND ($5A,X)
  $817B  22        .db $22
  $817C  58        CLI
  $817D  58        CLI
  $817E  5A        .db $5A
  $817F  22        .db $22
  $8180  69 01     ADC #$01
  $8182  69 01     ADC #$01
  $8184  21 21     AND ($21,X)
  $8186  00        BRK
  $8187  01 58     ORA ($58,X)
  $8189  5A        .db $5A
  $818A  22        .db $22
  $818B  21 21     AND ($21,X)
  $818D  21 59     AND ($59,X)
  $818F  59 21 82  EOR $8221,Y
  $8192  59 59 5A  EOR $5A59,Y
  $8195  22        .db $22
  $8196  5A        .db $5A
  $8197  22        .db $22
  $8198  5A        .db $5A
  $8199  01 59     ORA ($59,X)
  $819B  59 58 58  EOR $5858,Y
  $819E  59 59 35  EOR $3559,Y
  $81A1  36 38     ROL $38,X
  $81A3  37        .db $37
  $81A4  34        .db $34
  $81A5  36 2F     ROL $2F,X
  $81A7  37        .db $37
  $81A8  5A        .db $5A
  $81A9  22        .db $22
  $81AA  59 5A 82  EOR $825A,Y
  $81AD  60        RTS
  $81AE  21 60     AND ($60,X)
  $81B0  82        .db $82
  $81B1  82        .db $82
  $81B2  5A        .db $5A
  $81B3  22        .db $22
  $81B4  38        SEC
  $81B5  38        SEC
  $81B6  59 59 60  EOR $6059,Y
  $81B9  58        CLI
  $81BA  59 59 58  EOR $5859,Y
  $81BD  58        CLI
  $81BE  60        RTS
  $81BF  59 21 21  EOR $2121,Y
  $81C2  60        RTS
  $81C3  59 60 58  EOR $5860,Y
  $81C6  82        .db $82
  $81C7  82        .db $82
  $81C8  82        .db $82
  $81C9  82        .db $82
  $81CA  60        RTS
  $81CB  59 60 58  EOR $5860,Y
  $81CE  21 21     AND ($21,X)
  $81D0  58        CLI
  $81D1  5A        .db $5A
  $81D2  59 5A 58  EOR $585A,Y
  $81D5  5A        .db $5A
  $81D6  59 59 58  EOR $5859,Y
  $81D9  58        CLI
  $81DA  59 5A 58  EOR $585A,Y
  $81DD  5A        .db $5A
  $81DE  5A        .db $5A
  $81DF  22        .db $22
  $81E0  58        CLI
  $81E1  5A        .db $5A
  $81E2  5A        .db $5A
  $81E3  01 5A     ORA ($5A,X)
  $81E5  2E 2E 2E  ROL $2E2E
  $81E8  58        CLI
  $81E9  5A        .db $5A
  $81EA  82        .db $82
  $81EB  82        .db $82
  $81EC  82        .db $82
  $81ED  82        .db $82
  $81EE  59 5A 22  EOR $225A,Y
  $81F1  21 59     AND ($59,X)
  $81F3  5A        .db $5A
  $81F4  01 01     ORA ($01,X)
  $81F6  5A        .db $5A
  $81F7  01 21     ORA ($21,X)
  $81F9  60        RTS
  $81FA  21 21     AND ($21,X)
  $81FC  39 3A 37  AND $373A,Y
  $81FF  39 00 00  AND $0000,Y
  $8202  3A        .db $3A
  $8203  00        BRK
  $8204  3C        .db $3C
  $8205  3D 37 3F  AND $3F37,X
  $8208  3B        .db $3B
  $8209  2A        ROL
  $820A  39 3A 36  AND $363A,Y
  $820D  3D 39 3F  AND $3F39,X
  $8210  38        SEC
  $8211  35 38     AND $38,X
  $8213  37        .db $37
  $8214  00        BRK
  $8215  00        BRK
  $8216  59 59 00  EOR $0059,Y
  $8219  2D 59 59  AND $5959
  $821C  37        .db $37
  $821D  3A        .db $3A
  $821E  59 59 F0  EOR $F059,Y
  $8221  F1 33     SBC ($33),Y
  $8223  37        .db $37
  $8224  2D 60 2D  AND $2D60
  $8227  60        RTS
  $8228  01 2C     ORA ($2C,X)

L_822A:
  $822A  2C 38 2C  BIT $2C38
  $822D  38        SEC
  $822E  2C 38 2C  BIT $2C38
  $8231  38        SEC
  $8232  01 2C     ORA ($2C,X)
  $8234  01 2C     ORA ($2C,X)
  $8236  2C 2E 01  BIT $012E
  $8239  2C 01 2C  BIT $2C01
  $823C  01 2C     ORA ($2C,X)
  $823E  01 01     ORA ($01,X)
  $8240  38        SEC
  $8241  38        SEC
  $8242  2C 38 2C  BIT $2C38
  $8245  35 01     AND $01,X
  $8247  2C 38 35  BIT $3538
  $824A  38        SEC
  $824B  38        SEC
  $824C  34        .db $34
  $824D  35 2F     AND $2F,X
  $824F  38        SEC
  $8250  60        RTS
  $8251  5A        .db $5A
  $8252  60        RTS
  $8253  5A        .db $5A
  $8254  60        RTS
  $8255  58        CLI
  $8256  59 59 58  EOR $5859,Y
  $8259  58        CLI
  $825A  22        .db $22
  $825B  21 01     AND ($01,X)
  $825D  69 01     ADC #$01
  $825F  69 58     ADC #$58
  $8261  5A        .db $5A
  $8262  22        .db $22
  $8263  21 5A     AND ($5A,X)
  $8265  22        .db $22
  $8266  21 21     AND ($21,X)
  $8268  21 21     AND ($21,X)
  $826A  5A        .db $5A
  $826B  22        .db $22
  $826C  58        CLI
  $826D  58        CLI
  $826E  21 60     AND ($60,X)
  $8270  21 21     AND ($21,X)
  $8272  59 59 60  EOR $6059,Y
  $8275  58        CLI
  $8276  21 21     AND ($21,X)
  $8278  58        CLI
  $8279  5A        .db $5A
  $827A  21 21     AND ($21,X)
  $827C  3E 37 49  ROL $4937,X
  $827F  4A        LSR
  $8280  5B        .db $5B
  $8281  5D 00 00  EOR $0000,X
  $8284  5B        .db $5B
  $8285  5D 5A 5C  EOR $5C5A,X
  $8288  5B        .db $5B
  $8289  5F        .db $5F
  $828A  5A        .db $5A
  $828B  5C        .db $5C
  $828C  5B        .db $5B
  $828D  5D 2E 2D  EOR $2D2E,X
  $8290  5B        .db $5B
  $8291  5F        .db $5F
  $8292  2D 2D 59  AND $592D
  $8295  5D 2D 2D  EOR $2D2D,X
  $8298  5F        .db $5F
  $8299  2E 2D 2D  ROL $2D2D
  $829C  5B        .db $5B
  $829D  5F        .db $5F
  $829E  5A        .db $5A
  $829F  5E 2D 2D  LSR $2D2D,X
  $82A2  2D 2D 2D  AND $2D2D
  $82A5  2D 60 2E  AND $2E60
  $82A8  60        RTS
  $82A9  2E 2D 2D  ROL $2D2D
  $82AC  2D 2D 2D  AND $2D2D
  $82AF  60        RTS
  $82B0  2D 2D 2E  AND $2E2D
  $82B3  2D 2E 2D  AND $2D2E
  $82B6  2D 2D 2D  AND $2D2D
  $82B9  2D 5E 2E  AND $2E5E
  $82BC  2E 2D 2E  ROL $2E2D
  $82BF  2D 59 5D  AND $5D59
  $82C2  58        CLI
  $82C3  5C        .db $5C
  $82C4  5B        .db $5B
  $82C5  5D 58 5C  EOR $5C58,X
  $82C8  2D 59 2D  AND $2D59
  $82CB  58        CLI
  $82CC  5F        .db $5F
  $82CD  2E 5E 2E  ROL $2E5E
  $82D0  2E 2D 5A  ROL $5A2D
  $82D3  5C        .db $5C
  $82D4  2D 2D 2D  AND $2D2D
  $82D7  58        CLI
  $82D8  2D 2D 5A  AND $5A2D
  $82DB  5C        .db $5C
  $82DC  5F        .db $5F
  $82DD  2E 5A 5C  ROL $5C5A
  $82E0  2D 59 5A  AND $5A59
  $82E3  5C        .db $5C
  $82E4  2D 60 2D  AND $2D60
  $82E7  60        RTS
  $82E8  61 60     ADC ($60,X)
  $82EA  2D 60 61  AND $6160
  $82ED  61 2D     ADC ($2D,X)
  $82EF  2D 2D 61  AND $612D
  $82F2  2D 2D 60  AND $602D
  $82F5  81 60     STA ($60,X)
  $82F7  81 00     STA ($00,X)
  $82F9  7C        .db $7C
  $82FA  00        BRK
  $82FB  7C        .db $7C
  $82FC  7C        .db $7C
  $82FD  7C        .db $7C
  $82FE  7C        .db $7C
  $82FF  7C        .db $7C
  $8300  5B        .db $5B
  $8301  5D 5E 2E  EOR $2E5E,X
  $8304  5B        .db $5B
  $8305  5D 81 81  EOR $8181,X
  $8308  81 81     STA ($81,X)
  $830A  5A        .db $5A
  $830B  5C        .db $5C
  $830C  5B        .db $5B
  $830D  5D 2D 2D  EOR $2D2D,X
  $8310  5B        .db $5B
  $8311  5D A8 81  EOR $81A8,X
  $8314  A8        TAY
  $8315  81 A8     STA ($A8,X)
  $8317  81 2A     STA ($2A,X)
  $8319  2A        ROL
  $831A  2C 2C 2A  BIT $2A2C
  $831D  2A        ROL
  $831E  2B        .db $2B
  $831F  2B        .db $2B
  $8320  2D 60 5A  AND $5A60
  $8323  5E 81 59  LSR $5981,X
  $8326  5A        .db $5A
  $8327  5C        .db $5C
  $8328  2D 2D 00  AND $002D
  $832B  2D 5B 5D  AND $5D5B
  $832E  EF        .db $EF
  $832F  EF        .db $EF
  $8330  5B        .db $5B
  $8331  5D 61 61  EOR $6161,X
  $8334  81 EF     STA ($EF,X)
  $8336  81 EF     STA ($EF,X)
  $8338  81 81     STA ($81,X)
  $833A  81 81     STA ($81,X)
  $833C  61 61     ADC ($61,X)
  $833E  61 61     ADC ($61,X)
  $8340  61 61     ADC ($61,X)
  $8342  EF        .db $EF
  $8343  EF        .db $EF
  $8344  61 61     ADC ($61,X)
  $8346  81 A9     STA ($A9,X)
  $8348  61 61     ADC ($61,X)
  $834A  80        .db $80
  $834B  80        .db $80
  $834C  81 EF     STA ($EF,X)
  $834E  61 61     ADC ($61,X)
  $8350  81 A9     STA ($A9,X)
  $8352  61 61     ADC ($61,X)
  $8354  80        .db $80
  $8355  80        .db $80
  $8356  61 61     ADC ($61,X)
  $8358  61 61     ADC ($61,X)
  $835A  EF        .db $EF
  $835B  A9 61     LDA #$61
  $835D  61 81     ADC ($81,X)
  $835F  EF        .db $EF
  $8360  EF        .db $EF
  $8361  A9 EF     LDA #$EF
  $8363  A9 5F     LDA #$5F
  $8365  00        BRK
  $8366  5E 08 81  LSR $8108,X
  $8369  81 81     STA ($81,X)
  $836B  61 81     ADC ($81,X)
  $836D  81 81     STA ($81,X)
  $836F  EF        .db $EF
  $8370  81 EF     STA ($EF,X)
  $8372  81 81     STA ($81,X)
  $8374  81 A9     STA ($A9,X)
  $8376  81 A9     STA ($A9,X)
  $8378  A8        TAY
  $8379  81 58     STA ($58,X)
  $837B  5C        .db $5C
  $837C  5F        .db $5F
  $837D  81 5E     STA ($5E,X)
  $837F  81 5B     STA ($5B,X)
  $8381  5D 5A 5C  EOR $5C5A,X
  $8384  59 5D 58  EOR $585D,Y
  $8387  5C        .db $5C
  $8388  59 5D 81  EOR $815D,Y
  $838B  EF        .db $EF
  $838C  5B        .db $5B
  $838D  5D EF EF  EOR $EFEF,X
  $8390  EF        .db $EF
  $8391  EF        .db $EF
  $8392  5A        .db $5A
  $8393  5C        .db $5C
  $8394  5F        .db $5F
  $8395  EF        .db $EF
  $8396  5E EF 5F  LSR $5FEF,X
  $8399  EF        .db $EF
  $839A  EF        .db $EF
  $839B  EF        .db $EF
  $839C  31 33     AND ($33),Y
  $839E  32        .db $32
  $839F  34        .db $34
  $83A0  81 81     STA ($81,X)
  $83A2  5E 81 EF  LSR $EF81,X
  $83A5  81 5A     STA ($5A,X)
  $83A7  5C        .db $5C
  $83A8  5B        .db $5B
  $83A9  5D 5E EF  EOR $EF5E,X
  $83AC  5B        .db $5B
  $83AD  5F        .db $5F
  $83AE  EF        .db $EF
  $83AF  EF        .db $EF
  $83B0  59 5D 5A  EOR $5A5D,Y
  $83B3  5C        .db $5C
  $83B4  EF        .db $EF
  $83B5  EF        .db $EF
  $83B6  81 81     STA ($81,X)
  $83B8  81 81     STA ($81,X)
  $83BA  EF        .db $EF
  $83BB  EF        .db $EF
  $83BC  EF        .db $EF
  $83BD  81 EF     STA ($EF,X)
  $83BF  81 81     STA ($81,X)
  $83C1  81 EF     STA ($EF,X)
  $83C3  81 5B     STA ($5B,X)
  $83C5  5F        .db $5F
  $83C6  5A        .db $5A
  $83C7  5E 5B 5D  LSR $5D5B,X
  $83CA  81 EF     STA ($EF,X)
  $83CC  5B        .db $5B
  $83CD  5D 5A 5E  EOR $5E5A,X
  $83D0  EF        .db $EF
  $83D1  81 5E     STA ($5E,X)
  $83D3  EF        .db $EF
  $83D4  81 EF     STA ($EF,X)
  $83D6  EF        .db $EF
  $83D7  58        CLI
  $83D8  EF        .db $EF
  $83D9  59 81 EF  EOR $EF81,Y
  $83DC  EF        .db $EF
  $83DD  81 81     STA ($81,X)
  $83DF  81 81     STA ($81,X)
  $83E1  59 81 58  EOR $5881,Y
  $83E4  5B        .db $5B
  $83E5  5D 81 60  EOR $6081,X
  $83E8  81 60     STA ($60,X)
  $83EA  81 60     STA ($60,X)
  $83EC  81 81     STA ($81,X)
  $83EE  81 58     STA ($58,X)
  $83F0  EF        .db $EF
  $83F1  A9 61     LDA #$61
  $83F3  61 5B     ADC ($5B,X)
  $83F5  5D 00 00  EOR $0000,X
  $83F8  00        BRK
  $83F9  00        BRK
  $83FA  08        PHP
  $83FB  08        PHP
  $83FC  00        BRK
  $83FD  59 08 58  EOR $5808,Y
  $8400  00        BRK
  $8401  00        BRK
  $8402  00        BRK
  $8403  00        BRK
  $8404  00        BRK
  $8405  00        BRK
  $8406  00        BRK
  $8407  00        BRK
  $8408  10 00     BPL $840A

L_840A:
  $840A  00        BRK
  $840B  00        BRK
  $840C  00        BRK
  $840D  00        BRK
  $840E  00        BRK
  $840F  11 00     ORA ($00),Y
  $8411  00        BRK
  $8412  11 00     ORA ($00),Y
  $8414  00        BRK
  $8415  00        BRK
  $8416  00        BRK
  $8417  81 00     STA ($00,X)
  $8419  10 11     BPL $842C
  $841B  10 10     BPL $842D
  $841D  00        BRK
  $841E  01 11     ORA ($11,X)
  $8420  00        BRK
  $8421  00        BRK
  $8422  11 00     ORA ($00),Y
  $8424  00        BRK
  $8425  00        BRK
  $8426  00        BRK
  $8427  00        BRK
  $8428  88        DEY
  $8429  88        DEY
  $842A  AA        TAX
  $842B  AA        TAX

L_842C:
  $842C  AA        TAX

L_842D:
  $842D  A0 A1     LDY #$A1
  $842F  81 88     STA ($88,X)
  $8431  88        DEY
  $8432  AA        TAX
  $8433  AE 02 0A  LDX $0A02
  $8436  0A        ASL
  $8437  22        .db $22
  $8438  88        DEY
  $8439  88        DEY
  $843A  AA        TAX
  $843B  AA        TAX
  $843C  AA        TAX
  $843D  08        PHP
  $843E  88        DEY
  $843F  00        BRK
  $8440  A0 A1     LDY #$A1
  $8442  AA        TAX
  $8443  88        DEY
  $8444  FF        .db $FF
  $8445  FF        .db $FF
  $8446  FF        .db $FF
  $8447  FF        .db $FF
  $8448  BB        .db $BB
  $8449  FB        .db $FB
  $844A  FF        .db $FF
  $844B  FF        .db $FF
  $844C  FF        .db $FF
  $844D  FF        .db $FF
  $844E  AA        TAX
  $844F  AA        TAX
  $8450  88        DEY
  $8451  88        DEY
  $8452  AA        TAX
  $8453  AA        TAX
  $8454  BB        .db $BB
  $8455  BB        .db $BB
  $8456  FE AF EE  INC $EEAF,X
  $8459  BB        .db $BB
  $845A  EE BB AA  INC $AABB
  $845D  BA        TSX
  $845E  FB        .db $FB
  $845F  EA        NOP
  $8460  05 33     ORA $33
  $8462  EE BB AB  INC $ABBB
  $8465  FA        .db $FA
  $8466  8A        TXA
  $8467  AA        TAX
  $8468  00        BRK
  $8469  00        BRK
  $846A  BA        TSX
  $846B  AE EA 88  LDX $88EA
  $846E  AA        TAX
  $846F  AA        TAX
  $8470  BB        .db $BB
  $8471  AA        TAX
  $8472  AA        TAX
  $8473  EE AA AA  INC $AAAA
  $8476  AA        TAX
  $8477  EA        NOP
  $8478  2A        ROL
  $8479  02        .db $02
  $847A  AA        TAX
  $847B  AA        TAX
  $847C  BB        .db $BB
  $847D  08        PHP
  $847E  EF        .db $EF
  $847F  00        BRK
  $8480  00        BRK
  $8481  00        BRK
  $8482  10 00     BPL $8484

L_8484:
  $8484  00        BRK
  $8485  88        DEY
  $8486  88        DEY
  $8487  88        DEY
  $8488  00        BRK
  $8489  A0 00     LDY #$00
  $848B  00        BRK
  $848C  00        BRK
  $848D  00        BRK
  $848E  00        BRK
  $848F  00        BRK
  $8490  00        BRK
  $8491  00        BRK
  $8492  00        BRK
  $8493  00        BRK
  $8494  AA        TAX
  $8495  AA        TAX
  $8496  EE 50 EE  INC $EE50
  $8499  FE FB AE  INC $AEFB,X
  $849C  BB        .db $BB
  $849D  EE EE 88  INC $88EE
  $84A0  00        BRK
  $84A1  55 55     EOR $55,X
  $84A3  DD DD DD  CMP $DDDD,X
  $84A6  FD 55 FF  SBC $FF55,X
  $84A9  F7        .db $F7
  $84AA  FD 7F FF  SBC $FF7F,X
  $84AD  FF        .db $FF
  $84AE  F7        .db $F7
  $84AF  FF        .db $FF
  $84B0  55 55     EOR $55,X
  $84B2  5F        .db $5F
  $84B3  F5 77     SBC $77,X
  $84B5  7F        .db $7F
  $84B6  77        .db $77
  $84B7  75 57     ADC $57,X
  $84B9  5F        .db $5F
  $84BA  5D DD DF  EOR $DFDD,X
  $84BD  A0 0F     LDY #$0F
  $84BF  00        BRK
  $84C0  D5 88     CMP $88,X
  $84C2  22        .db $22
  $84C3  DD 88 AA  CMP $AA88,X
  $84C6  FF        .db $FF
  $84C7  FF        .db $FF
  $84C8  57        .db $57
  $84C9  02        .db $02
  $84CA  FF        .db $FF
  $84CB  88        DEY
  $84CC  00        BRK
  $84CD  AA        TAX
  $84CE  AA        TAX
  $84CF  00        BRK
  $84D0  88        DEY
  $84D1  88        DEY
  $84D2  88        DEY
  $84D3  22        .db $22
  $84D4  22        .db $22
  $84D5  22        .db $22
  $84D6  88        DEY
  $84D7  88        DEY
  $84D8  AA        TAX
  $84D9  45 2A     EOR $2A
  $84DB  AA        TAX
  $84DC  AA        TAX
  $84DD  AA        TAX
  $84DE  22        .db $22
  $84DF  A0 00     LDY #$00
  $84E1  00        BRK
  $84E2  88        DEY
  $84E3  88        DEY
  $84E4  22        .db $22
  $84E5  A0 A8     LDY #$A8
  $84E7  FF        .db $FF
  $84E8  A2 22     LDX #$22
  $84EA  80        .db $80
  $84EB  88        DEY
  $84EC  00        BRK
  $84ED  AA        TAX
  $84EE  AA        TAX
  $84EF  AA        TAX
  $84F0  AA        TAX
  $84F1  00        BRK
  $84F2  88        DEY
  $84F3  00        BRK
  $84F4  A2 2A     LDX #$2A
  $84F6  8A        TXA
  $84F7  AA        TAX
  $84F8  0A        ASL
  $84F9  08        PHP
  $84FA  0A        ASL
  $84FB  2A        ROL
  $84FC  22        .db $22
  $84FD  00        BRK
  $84FE  44        .db $44
  $84FF  54        .db $54
  $8500  02        .db $02
  $8501  02        .db $02
  $8502  02        .db $02
  $8503  0C        .db $0C
  $8504  18        CLC
  $8505  1D 4E 4F  ORA $4F4E,X
  $8508  02        .db $02
  $8509  02        .db $02
  $850A  02        .db $02
  $850B  0D 19 1E  ORA $1E19
  $850E  4E 4F 02  LSR $024F
  $8511  02        .db $02
  $8512  02        .db $02
  $8513  0D 12 1F  ORA $1F12
  $8516  4E 4F 02  LSR $024F
  $8519  03        .db $03
  $851A  03        .db $03
  $851B  0E 19 1E  ASL $1E19
  $851E  4E 4F 02  LSR $024F
  $8521  02        .db $02
  $8522  02        .db $02
  $8523  05 13     ORA $13
  $8525  1D 4E 4F  ORA $4F4E,X
  $8528  02        .db $02
  $8529  02        .db $02
  $852A  02        .db $02
  $852B  06 18     ASL $18
  $852D  1E 4E 4F  ASL $4F4E,X
  $8530  02        .db $02
  $8531  02        .db $02
  $8532  02        .db $02
  $8533  08        PHP
  $8534  12        .db $12
  $8535  1F        .db $1F
  $8536  4E 4F 02  LSR $024F
  $8539  02        .db $02
  $853A  0B        .db $0B
  $853B  07        .db $07
  $853C  19 1E 4E  ORA $4E1E,Y
  $853F  4F        .db $4F
  $8540  02        .db $02
  $8541  02        .db $02
  $8542  0A        ASL
  $8543  0C        .db $0C
  $8544  14        .db $14
  $8545  2D 4F 4F  AND $4F4F
  $8548  02        .db $02
  $8549  02        .db $02
  $854A  0A        ASL
  $854B  0D 12 2E  ORA $2E12
  $854E  4F        .db $4F
  $854F  4F        .db $4F
  $8550  02        .db $02
  $8551  02        .db $02
  $8552  03        .db $03
  $8553  0E 1B 1E  ASL $1E1B
  $8556  4E 4F 02  LSR $024F
  $8559  02        .db $02
  $855A  02        .db $02
  $855B  05 13     ORA $13
  $855D  1D 4E 4F  ORA $4F4E,X
  $8560  02        .db $02
  $8561  02        .db $02
  $8562  0A        ASL
  $8563  09 18     ORA #$18
  $8565  17        .db $17
  $8566  6E 4F 02  ROR $024F
  $8569  02        .db $02
  $856A  0A        ASL
  $856B  0D 12 2E  ORA $2E12
  $856E  4F        .db $4F
  $856F  4F        .db $4F
  $8570  03        .db $03
  $8571  0B        .db $0B
  $8572  0B        .db $0B
  $8573  0E 1B 2D  ASL $2D1B
  $8576  4F        .db $4F
  $8577  4F        .db $4F
  $8578  02        .db $02
  $8579  0A        ASL
  $857A  0D 18 1E  ORA $1E18
  $857D  4E 4F 4F  LSR $4F4F
  $8580  02        .db $02
  $8581  0A        ASL
  $8582  0D 12 1F  ORA $1F12
  $8585  4E 4F 4F  LSR $4F4F
  $8588  02        .db $02
  $8589  0A        ASL
  $858A  11 13     ORA ($13),Y
  $858C  1D 4E 4F  ORA $4F4E,X
  $858F  4F        .db $4F
  $8590  02        .db $02
  $8591  02        .db $02
  $8592  10 18     BPL $85AC
  $8594  1E 4E 4F  ASL $4F4E,X
  $8597  4F        .db $4F
  $8598  02        .db $02
  $8599  02        .db $02
  $859A  0D 1A 1F  ORA $1F1A
  $859D  4E 4F 4F  LSR $4F4F
  $85A0  03        .db $03
  $85A1  0A        ASL
  $85A2  0E 18 1E  ASL $1E18
  $85A5  4E 4F 4F  LSR $4F4F
  $85A8  02        .db $02
  $85A9  0D 25 19  ORA $1925

L_85AC:
  $85AC  1E 4E 4F  ASL $4F4E,X
  $85AF  4F        .db $4F
  $85B0  02        .db $02
  $85B1  02        .db $02
  $85B2  05 13     ORA $13
  $85B4  01 2D     ORA ($2D,X)
  $85B6  4F        .db $4F
  $85B7  4F        .db $4F
  $85B8  02        .db $02
  $85B9  02        .db $02
  $85BA  08        PHP
  $85BB  22        .db $22
  $85BC  12        .db $12
  $85BD  2E 4F 4F  ROL $4F4F
  $85C0  02        .db $02
  $85C1  03        .db $03
  $85C2  07        .db $07
  $85C3  25 1B     AND $1B
  $85C5  2D 4F 4F  AND $4F4F
  $85C8  02        .db $02
  $85C9  02        .db $02
  $85CA  0C        .db $0C
  $85CB  15 0F     ORA $0F,X
  $85CD  2D 4F 4F  AND $4F4F
  $85D0  02        .db $02
  $85D1  02        .db $02
  $85D2  02        .db $02
  $85D3  05 16     ORA $16
  $85D5  1D 4E 4F  ORA $4F4E,X
  $85D8  02        .db $02
  $85D9  02        .db $02
  $85DA  02        .db $02
  $85DB  08        PHP
  $85DC  12        .db $12
  $85DD  1F        .db $1F
  $85DE  4E 4F 02  LSR $024F
  $85E1  02        .db $02
  $85E2  02        .db $02
  $85E3  07        .db $07
  $85E4  19 1E 4E  ORA $4E1E,Y
  $85E7  4F        .db $4F
  $85E8  02        .db $02
  $85E9  02        .db $02
  $85EA  0A        ASL
  $85EB  0C        .db $0C
  $85EC  1C        .db $1C
  $85ED  1E 4E 4F  ASL $4F4E,X
  $85F0  02        .db $02
  $85F1  02        .db $02
  $85F2  0A        ASL
  $85F3  0D 1A 1F  ORA $1F1A
  $85F6  4E 4F 02  LSR $024F
  $85F9  02        .db $02
  $85FA  0B        .db $0B
  $85FB  0E 18 1E  ASL $1E18
  $85FE  4E 4F 02  LSR $024F
  $8601  02        .db $02
  $8602  0A        ASL
  $8603  09 19     ORA #$19
  $8605  1E 4E 4F  ASL $4F4E,X
  $8608  02        .db $02
  $8609  02        .db $02
  $860A  0A        ASL
  $860B  0D 12 1F  ORA $1F12
  $860E  4E 4F 02  LSR $024F
  $8611  02        .db $02
  $8612  0B        .db $0B
  $8613  0E 1C 1E  ASL $1E1C
  $8616  4E 4F 02  LSR $024F
  $8619  02        .db $02
  $861A  0A        ASL
  $861B  05 15     ORA $15
  $861D  1E 4E 4F  ASL $4F4E,X
  $8620  02        .db $02
  $8621  02        .db $02
  $8622  0A        ASL
  $8623  08        PHP
  $8624  1A        .db $1A
  $8625  1F        .db $1F
  $8626  4E 4F 30  LSR $304F
  $8629  30 38     BMI $8663
  $862B  29 31     AND #$31
  $862D  39 42 42  AND $4242,Y
  $8630  4F        .db $4F
  $8631  4F        .db $4F
  $8632  4F        .db $4F
  $8633  4F        .db $4F
  $8634  4F        .db $4F
  $8635  4F        .db $4F
  $8636  4F        .db $4F
  $8637  4F        .db $4F
  $8638  4F        .db $4F
  $8639  4F        .db $4F
  $863A  4F        .db $4F
  $863B  4F        .db $4F
  $863C  4F        .db $4F
  $863D  4F        .db $4F
  $863E  4F        .db $4F
  $863F  4F        .db $4F
  $8640  4F        .db $4F
  $8641  4F        .db $4F
  $8642  4F        .db $4F
  $8643  4F        .db $4F
  $8644  4F        .db $4F
  $8645  4F        .db $4F
  $8646  4F        .db $4F
  $8647  4F        .db $4F
  $8648  4F        .db $4F
  $8649  4F        .db $4F
  $864A  4F        .db $4F
  $864B  65 44     ADC $44
  $864D  44        .db $44
  $864E  48        PHA
  $864F  48        PHA
  $8650  4F        .db $4F
  $8651  4F        .db $4F
  $8652  4F        .db $4F
  $8653  6A        ROR
  $8654  46 44     LSR $44
  $8656  4E 4F 4F  LSR $4F4F
  $8659  4F        .db $4F
  $865A  76 62     ROR $62,X
  $865C  47        .db $47
  $865D  57        .db $57
  $865E  4F        .db $4F
  $865F  4F        .db $4F
  $8660  4F        .db $4F
  $8661  4F        .db $4F
  $8662  75 5E     ADC $5E,X
  $8664  44        .db $44
  $8665  44        .db $44
  $8666  4E 4F 42  LSR $424F
  $8669  6C 6B 65  JMP ($656B)
  $866C  44        .db $44
  $866D  57        .db $57
  $866E  4F        .db $4F
  $866F  4F        .db $4F
  $8670  4F        .db $4F
  $8671  65 44     ADC $44
  $8673  44        .db $44
  $8674  44        .db $44
  $8675  44        .db $44
  $8676  4E 4F 4F  LSR $4F4F
  $8679  4F        .db $4F
  $867A  4F        .db $4F
  $867B  4F        .db $4F
  $867C  4F        .db $4F
  $867D  4F        .db $4F
  $867E  4F        .db $4F
  $867F  4F        .db $4F
  $8680  4F        .db $4F
  $8681  4F        .db $4F
  $8682  4F        .db $4F
  $8683  4F        .db $4F
  $8684  4F        .db $4F
  $8685  4F        .db $4F
  $8686  4F        .db $4F
  $8687  4F        .db $4F
  $8688  48        PHA
  $8689  49 44     EOR #$44
  $868B  4E 4F 4F  LSR $4F4F
  $868E  4F        .db $4F
  $868F  4F        .db $4F
  $8690  76 56     ROR $56,X
  $8692  44        .db $44
  $8693  44        .db $44
  $8694  44        .db $44
  $8695  9D 6F 4F  STA $4F6F,X
  $8698  76 62     ROR $62,X
  $869A  47        .db $47
  $869B  44        .db $44
  $869C  44        .db $44
  $869D  44        .db $44
  $869E  4E 4F 4F  LSR $4F4F
  $86A1  76 56     ROR $56,X
  $86A3  44        .db $44
  $86A4  44        .db $44
  $86A5  44        .db $44
  $86A6  4E 4F 4F  LSR $4F4F
  $86A9  76 62     ROR $62,X
  $86AB  47        .db $47
  $86AC  44        .db $44
  $86AD  4E 4F 4F  LSR $4F4F
  $86B0  4F        .db $4F
  $86B1  5F        .db $5F
  $86B2  99 44 44  STA $4444,Y
  $86B5  4E 4F 4F  LSR $4F4F
  $86B8  4F        .db $4F
  $86B9  75 59     ADC $59,X
  $86BB  9A        TXS
  $86BC  44        .db $44
  $86BD  4E 4F 4F  LSR $4F4F
  $86C0  4F        .db $4F
  $86C1  4F        .db $4F
  $86C2  4F        .db $4F
  $86C3  74        .db $74
  $86C4  45 4E     EOR $4E
  $86C6  4F        .db $4F
  $86C7  4F        .db $4F
  $86C8  4F        .db $4F
  $86C9  4F        .db $4F
  $86CA  4F        .db $4F
  $86CB  74        .db $74
  $86CC  45 4E     EOR $4E
  $86CE  4F        .db $4F
  $86CF  4F        .db $4F
  $86D0  4F        .db $4F
  $86D1  4F        .db $4F
  $86D2  76 62     ROR $62,X
  $86D4  47        .db $47
  $86D5  4E 4F 4F  LSR $4F4F
  $86D8  4F        .db $4F
  $86D9  77        .db $77
  $86DA  47        .db $47
  $86DB  44        .db $44
  $86DC  44        .db $44
  $86DD  4E 4F 4F  LSR $4F4F

L_86E0:
  $86E0  4F        .db $4F
  $86E1  76 56     ROR $56,X
  $86E3  44        .db $44
  $86E4  44        .db $44
  $86E5  4E 4F 4F  LSR $4F4F
  $86E8  76 62     ROR $62,X
  $86EA  47        .db $47
  $86EB  44        .db $44
  $86EC  4E 4F 4F  LSR $4F4F
  $86EF  4F        .db $4F
  $86F0  76 56     ROR $56,X
  $86F2  44        .db $44
  $86F3  44        .db $44
  $86F4  4E 4F 4F  LSR $4F4F
  $86F7  4F        .db $4F
  $86F8  4F        .db $4F
  $86F9  75 7C     ADC $7C,X
  $86FB  46 44     LSR $44
  $86FD  44        .db $44
  $86FE  4E 4F 4F  LSR $4F4F
  $8701  4F        .db $4F
  $8702  76 62     ROR $62,X
  $8704  47        .db $47
  $8705  44        .db $44
  $8706  4E 4F 4F  LSR $4F4F
  $8709  4F        .db $4F
  $870A  65 44     ADC $44
  $870C  44        .db $44
  $870D  4E 4F 4F  LSR $4F4F
  $8710  4F        .db $4F
  $8711  4F        .db $4F
  $8712  74        .db $74
  $8713  45 4E     EOR $4E
  $8715  4F        .db $4F
  $8716  4F        .db $4F
  $8717  4F        .db $4F
  $8718  4F        .db $4F
  $8719  5F        .db $5F
  $871A  9E        .db $9E
  $871B  47        .db $47
  $871C  4E 4F 4F  LSR $4F4F
  $871F  4F        .db $4F
  $8720  4F        .db $4F
  $8721  6A        ROR
  $8722  46 44     LSR $44
  $8724  4E 4F 4F  LSR $4F4F
  $8727  4F        .db $4F
  $8728  74        .db $74
  $8729  45 44     EOR $44
  $872B  44        .db $44
  $872C  4E 4F 4F  LSR $4F4F
  $872F  4F        .db $4F
  $8730  77        .db $77
  $8731  47        .db $47
  $8732  44        .db $44
  $8733  4E 4F 4F  LSR $4F4F
  $8736  4F        .db $4F
  $8737  4F        .db $4F
  $8738  65 44     ADC $44
  $873A  44        .db $44
  $873B  4E 4F 4F  LSR $4F4F
  $873E  4F        .db $4F
  $873F  4F        .db $4F
  $8740  65 44     ADC $44
  $8742  44        .db $44
  $8743  4E 4F 4F  LSR $4F4F
  $8746  4F        .db $4F
  $8747  4F        .db $4F
  $8748  65 44     ADC $44
  $874A  44        .db $44
  $874B  4E 4F 4F  LSR $4F4F
  $874E  4F        .db $4F
  $874F  4F        .db $4F
  $8750  65 44     ADC $44
  $8752  44        .db $44
  $8753  4E 4F 4F  LSR $4F4F
  $8756  4F        .db $4F
  $8757  4F        .db $4F
  $8758  65 44     ADC $44
  $875A  44        .db $44
  $875B  4E 4F 4F  LSR $4F4F
  $875E  4F        .db $4F
  $875F  4F        .db $4F
  $8760  65 44     ADC $44
  $8762  44        .db $44
  $8763  4E 4F 4F  LSR $4F4F
  $8766  4F        .db $4F
  $8767  4F        .db $4F
  $8768  65 44     ADC $44
  $876A  44        .db $44
  $876B  4E 4F 4F  LSR $4F4F
  $876E  4F        .db $4F
  $876F  4F        .db $4F
  $8770  42        .db $42
  $8771  42        .db $42
  $8772  42        .db $42
  $8773  6E 4F 4F  ROR $4F4F
  $8776  4F        .db $4F
  $8777  4F        .db $4F
  $8778  4F        .db $4F
  $8779  4F        .db $4F
  $877A  4F        .db $4F
  $877B  4F        .db $4F
  $877C  4F        .db $4F
  $877D  4F        .db $4F
  $877E  4F        .db $4F
  $877F  4F        .db $4F
  $8780  4F        .db $4F
  $8781  4F        .db $4F
  $8782  4F        .db $4F
  $8783  4F        .db $4F
  $8784  4F        .db $4F
  $8785  4F        .db $4F
  $8786  4F        .db $4F
  $8787  4F        .db $4F
  $8788  5C        .db $5C
  $8789  5C        .db $5C
  $878A  5C        .db $5C
  $878B  5C        .db $5C
  $878C  5A        .db $5A
  $878D  9B        .db $9B
  $878E  4F        .db $4F
  $878F  4F        .db $4F
  $8790  4F        .db $4F
  $8791  74        .db $74
  $8792  45 44     EOR $44
  $8794  44        .db $44
  $8795  57        .db $57
  $8796  4F        .db $4F
  $8797  4F        .db $4F
  $8798  4F        .db $4F
  $8799  4F        .db $4F
  $879A  74        .db $74
  $879B  45 44     EOR $44
  $879D  57        .db $57
  $879E  4F        .db $4F
  $879F  4F        .db $4F
  $87A0  4F        .db $4F
  $87A1  4F        .db $4F
  $87A2  74        .db $74
  $87A3  45 44     EOR $44
  $87A5  44        .db $44
  $87A6  4E 4F 4F  LSR $4F4F
  $87A9  4F        .db $4F
  $87AA  4F        .db $4F
  $87AB  74        .db $74
  $87AC  45 44     EOR $44
  $87AE  4E 4F 4F  LSR $4F4F
  $87B1  4F        .db $4F
  $87B2  4F        .db $4F
  $87B3  75 59     ADC $59,X
  $87B5  9C        .db $9C
  $87B6  42        .db $42
  $87B7  42        .db $42
  $87B8  4F        .db $4F
  $87B9  4F        .db $4F
  $87BA  4F        .db $4F
  $87BB  4F        .db $4F
  $87BC  4F        .db $4F
  $87BD  4F        .db $4F
  $87BE  4F        .db $4F
  $87BF  4F        .db $4F
  $87C0  4F        .db $4F
  $87C1  4F        .db $4F
  $87C2  4F        .db $4F
  $87C3  4F        .db $4F
  $87C4  4F        .db $4F
  $87C5  4F        .db $4F
  $87C6  4F        .db $4F
  $87C7  4F        .db $4F
  $87C8  4F        .db $4F
  $87C9  4F        .db $4F
  $87CA  4F        .db $4F
  $87CB  76 96     ROR $96,X
  $87CD  5A        .db $5A
  $87CE  5C        .db $5C
  $87CF  5C        .db $5C
  $87D0  4F        .db $4F
  $87D1  4F        .db $4F
  $87D2  4F        .db $4F
  $87D3  74        .db $74
  $87D4  45 44     EOR $44
  $87D6  4E 4F 4F  LSR $4F4F
  $87D9  4F        .db $4F
  $87DA  4F        .db $4F
  $87DB  74        .db $74
  $87DC  45 44     EOR $44
  $87DE  4E 4F 4F  LSR $4F4F
  $87E1  4F        .db $4F
  $87E2  74        .db $74
  $87E3  45 44     EOR $44
  $87E5  4E 4F 4F  LSR $4F4F
  $87E8  4F        .db $4F
  $87E9  4F        .db $4F
  $87EA  74        .db $74
  $87EB  45 44     EOR $44
  $87ED  4E 4F 4F  LSR $4F4F
  $87F0  4F        .db $4F
  $87F1  4F        .db $4F
  $87F2  74        .db $74
  $87F3  45 4E     EOR $4E
  $87F5  4F        .db $4F
  $87F6  4F        .db $4F
  $87F7  4F        .db $4F
  $87F8  4F        .db $4F
  $87F9  4F        .db $4F
  $87FA  74        .db $74
  $87FB  45 4E     EOR $4E
  $87FD  4F        .db $4F
  $87FE  4F        .db $4F
  $87FF  4F        .db $4F
  $8800  4F        .db $4F
  $8801  76 34     ROR $34,X
  $8803  00        BRK
  $8804  60        RTS
  $8805  23        .db $23
  $8806  0A        ASL
  $8807  0A        ASL
  $8808  4F        .db $4F
  $8809  78        SEI
  $880A  00        BRK
  $880B  00        BRK
  $880C  60        RTS
  $880D  00        BRK
  $880E  21 0A     AND ($0A,X)
  $8810  74        .db $74
  $8811  00        BRK
  $8812  00        BRK
  $8813  00        BRK
  $8814  60        RTS
  $8815  20 0A 0A  JSR $0A0A
  $8818  74        .db $74
  $8819  00        BRK
  $881A  00        BRK
  $881B  00        BRK
  $881C  60        RTS
  $881D  21 0A     AND ($0A,X)
  $881F  0A        ASL
  $8820  00        BRK
  $8821  00        BRK
  $8822  00        BRK
  $8823  00        BRK
  $8824  20 0A 0A  JSR $0A0A
  $8827  0A        ASL
  $8828  00        BRK
  $8829  00        BRK
  $882A  00        BRK
  $882B  60        RTS
  $882C  21 0A     AND ($0A,X)
  $882E  0A        ASL
  $882F  0A        ASL
  $8830  00        BRK
  $8831  00        BRK
  $8832  00        BRK
  $8833  60        RTS
  $8834  23        .db $23
  $8835  0A        ASL
  $8836  0A        ASL
  $8837  0A        ASL
  $8838  00        BRK
  $8839  00        BRK
  $883A  00        BRK
  $883B  60        RTS
  $883C  00        BRK
  $883D  23        .db $23
  $883E  0A        ASL
  $883F  0A        ASL

L_8840:
  $8840  00        BRK
  $8841  00        BRK
  $8842  00        BRK
  $8843  60        RTS
  $8844  00        BRK
  $8845  00        BRK
  $8846  21 0A     AND ($0A,X)
  $8848  00        BRK
  $8849  00        BRK
  $884A  00        BRK
  $884B  60        RTS
  $884C  00        BRK
  $884D  00        BRK
  $884E  21 0A     AND ($0A,X)
  $8850  00        BRK
  $8851  00        BRK
  $8852  00        BRK
  $8853  00        BRK
  $8854  00        BRK
  $8855  60        RTS
  $8856  23        .db $23
  $8857  0A        ASL
  $8858  00        BRK
  $8859  00        BRK
  $885A  00        BRK
  $885B  00        BRK
  $885C  00        BRK
  $885D  60        RTS
  $885E  20 0A 00  JSR $000A
  $8861  00        BRK
  $8862  00        BRK
  $8863  00        BRK
  $8864  00        BRK
  $8865  60        RTS
  $8866  21 0A     AND ($0A,X)
  $8868  00        BRK
  $8869  00        BRK
  $886A  00        BRK
  $886B  00        BRK
  $886C  00        BRK
  $886D  60        RTS
  $886E  23        .db $23
  $886F  0A        ASL
  $8870  00        BRK
  $8871  00        BRK
  $8872  00        BRK
  $8873  00        BRK
  $8874  00        BRK
  $8875  60        RTS
  $8876  20 0A 00  JSR $000A
  $8879  00        BRK
  $887A  00        BRK
  $887B  00        BRK
  $887C  00        BRK
  $887D  60        RTS
  $887E  21 0A     AND ($0A,X)
  $8880  00        BRK
  $8881  00        BRK
  $8882  00        BRK
  $8883  00        BRK
  $8884  00        BRK
  $8885  20 0A 0A  JSR $0A0A
  $8888  00        BRK
  $8889  00        BRK
  $888A  00        BRK
  $888B  00        BRK
  $888C  60        RTS
  $888D  21 0A     AND ($0A,X)
  $888F  0B        .db $0B
  $8890  00        BRK
  $8891  00        BRK
  $8892  00        BRK
  $8893  00        BRK
  $8894  60        RTS
  $8895  23        .db $23
  $8896  0A        ASL
  $8897  0A        ASL
  $8898  00        BRK
  $8899  00        BRK
  $889A  00        BRK
  $889B  00        BRK
  $889C  60        RTS
  $889D  00        BRK
  $889E  23        .db $23
  $889F  0A        ASL
  $88A0  00        BRK
  $88A1  00        BRK
  $88A2  97        .db $97
  $88A3  00        BRK
  $88A4  00        BRK
  $88A5  00        BRK
  $88A6  00        BRK
  $88A7  21 00     AND ($00,X)
  $88A9  00        BRK
  $88AA  97        .db $97
  $88AB  00        BRK
  $88AC  00        BRK
  $88AD  00        BRK
  $88AE  00        BRK
  $88AF  21 00     AND ($00,X)
  $88B1  00        BRK
  $88B2  4E 66 43  LSR $4366
  $88B5  00        BRK
  $88B6  00        BRK
  $88B7  23        .db $23
  $88B8  00        BRK
  $88B9  00        BRK
  $88BA  4E 4F 4F  LSR $4F4F
  $88BD  4F        .db $4F
  $88BE  66 43     ROR $43
  $88C0  74        .db $74
  $88C1  45 4E     EOR $4E
  $88C3  4F        .db $4F
  $88C4  4F        .db $4F
  $88C5  4F        .db $4F
  $88C6  4F        .db $4F
  $88C7  4F        .db $4F
  $88C8  74        .db $74
  $88C9  45 4E     EOR $4E
  $88CB  4F        .db $4F
  $88CC  4F        .db $4F
  $88CD  4F        .db $4F
  $88CE  4F        .db $4F
  $88CF  4F        .db $4F
  $88D0  74        .db $74
  $88D1  45 4E     EOR $4E
  $88D3  4F        .db $4F
  $88D4  4F        .db $4F
  $88D5  4F        .db $4F
  $88D6  4F        .db $4F
  $88D7  4F        .db $4F
  $88D8  74        .db $74
  $88D9  45 4E     EOR $4E
  $88DB  4F        .db $4F
  $88DC  4F        .db $4F
  $88DD  4F        .db $4F
  $88DE  4F        .db $4F
  $88DF  4F        .db $4F
  $88E0  74        .db $74
  $88E1  45 4E     EOR $4E
  $88E3  4F        .db $4F
  $88E4  4F        .db $4F
  $88E5  4F        .db $4F
  $88E6  4F        .db $4F
  $88E7  4F        .db $4F
  $88E8  74        .db $74
  $88E9  45 4E     EOR $4E
  $88EB  4F        .db $4F
  $88EC  4F        .db $4F
  $88ED  4F        .db $4F
  $88EE  4F        .db $4F
  $88EF  4F        .db $4F
  $88F0  74        .db $74
  $88F1  45 71     EOR $71
  $88F3  5C        .db $5C
  $88F4  5C        .db $5C
  $88F5  5C        .db $5C
  $88F6  5C        .db $5C
  $88F7  5C        .db $5C
  $88F8  4F        .db $4F
  $88F9  4F        .db $4F
  $88FA  4F        .db $4F
  $88FB  4F        .db $4F
  $88FC  4F        .db $4F
  $88FD  4F        .db $4F
  $88FE  4F        .db $4F
  $88FF  4F        .db $4F
  $8900  4F        .db $4F
  $8901  4F        .db $4F
  $8902  4F        .db $4F
  $8903  4F        .db $4F
  $8904  4F        .db $4F
  $8905  4F        .db $4F
  $8906  4F        .db $4F
  $8907  4F        .db $4F
  $8908  4F        .db $4F
  $8909  74        .db $74
  $890A  45 44     EOR $44
  $890C  44        .db $44
  $890D  44        .db $44
  $890E  72        .db $72
  $890F  42        .db $42

L_8910:
  $8910  74        .db $74
  $8911  45 44     EOR $44
  $8913  44        .db $44
  $8914  44        .db $44
  $8915  44        .db $44
  $8916  4E 4F 74  LSR $744F
  $8919  45 44     EOR $44
  $891B  44        .db $44
  $891C  44        .db $44
  $891D  44        .db $44
  $891E  4E 4F 74  LSR $744F
  $8921  45 44     EOR $44
  $8923  44        .db $44
  $8924  44        .db $44
  $8925  44        .db $44
  $8926  4E 4F 74  LSR $744F
  $8929  45 44     EOR $44
  $892B  44        .db $44
  $892C  44        .db $44
  $892D  44        .db $44
  $892E  4E 4F 7A  LSR $7A4F
  $8931  5B        .db $5B
  $8932  48        PHA
  $8933  44        .db $44
  $8934  44        .db $44
  $8935  44        .db $44
  $8936  4E 4F 4F  LSR $4F4F
  $8939  4F        .db $4F
  $893A  4F        .db $4F
  $893B  4F        .db $4F
  $893C  4F        .db $4F
  $893D  4F        .db $4F
  $893E  4F        .db $4F
  $893F  4F        .db $4F
  $8940  4F        .db $4F
  $8941  4F        .db $4F
  $8942  4F        .db $4F
  $8943  4F        .db $4F
  $8944  4F        .db $4F
  $8945  4F        .db $4F
  $8946  4F        .db $4F
  $8947  4F        .db $4F
  $8948  7B        .db $7B
  $8949  58        CLI
  $894A  4E 4F 4F  LSR $4F4F
  $894D  4F        .db $4F
  $894E  4F        .db $4F
  $894F  4F        .db $4F
  $8950  74        .db $74
  $8951  45 7E     EOR $7E
  $8953  6F        .db $6F
  $8954  4F        .db $4F
  $8955  4F        .db $4F
  $8956  4F        .db $4F
  $8957  4F        .db $4F
  $8958  74        .db $74
  $8959  45 44     EOR $44
  $895B  7E 6F 4F  ROR $4F6F,X
  $895E  4F        .db $4F
  $895F  4F        .db $4F
  $8960  74        .db $74
  $8961  45 44     EOR $44
  $8963  44        .db $44
  $8964  7E 6F 4F  ROR $4F6F,X
  $8967  4F        .db $4F
  $8968  74        .db $74
  $8969  45 44     EOR $44
  $896B  44        .db $44
  $896C  44        .db $44
  $896D  7E 6F 4F  ROR $4F6F,X
  $8970  75 59     ADC $59,X
  $8972  63        .db $63
  $8973  63        .db $63
  $8974  63        .db $63
  $8975  63        .db $63
  $8976  42        .db $42
  $8977  42        .db $42
  $8978  4F        .db $4F
  $8979  4F        .db $4F
  $897A  4F        .db $4F
  $897B  4F        .db $4F
  $897C  4F        .db $4F
  $897D  4F        .db $4F
  $897E  4F        .db $4F
  $897F  4F        .db $4F
  $8980  4F        .db $4F
  $8981  4F        .db $4F
  $8982  4F        .db $4F
  $8983  4F        .db $4F
  $8984  4F        .db $4F
  $8985  4F        .db $4F
  $8986  4F        .db $4F
  $8987  4F        .db $4F
  $8988  74        .db $74
  $8989  45 44     EOR $44
  $898B  44        .db $44
  $898C  44        .db $44
  $898D  44        .db $44
  $898E  72        .db $72
  $898F  35 74     AND $74,X
  $8991  45 44     EOR $44
  $8993  44        .db $44
  $8994  44        .db $44
  $8995  70 6E     BVS $8A05
  $8997  36 74     ROL $74,X
  $8999  45 44     EOR $44
  $899B  44        .db $44
  $899C  44        .db $44
  $899D  4E 4F 36  LSR $364F
  $89A0  74        .db $74
  $89A1  45 44     EOR $44
  $89A3  44        .db $44
  $89A4  70 6E     BVS $8A14
  $89A6  4F        .db $4F
  $89A7  36 74     ROL $74,X
  $89A9  45 44     EOR $44
  $89AB  44        .db $44
  $89AC  4E 4F 4F  LSR $4F4F
  $89AF  36 42     ROL $42,X
  $89B1  42        .db $42
  $89B2  6E 4F 4F  ROR $4F4F
  $89B5  4F        .db $4F
  $89B6  4F        .db $4F
  $89B7  36 4F     ROL $4F,X
  $89B9  4F        .db $4F
  $89BA  4F        .db $4F
  $89BB  4F        .db $4F
  $89BC  4F        .db $4F
  $89BD  4F        .db $4F
  $89BE  4F        .db $4F
  $89BF  36 4F     ROL $4F,X
  $89C1  4F        .db $4F
  $89C2  4F        .db $4F
  $89C3  4F        .db $4F
  $89C4  4F        .db $4F
  $89C5  4F        .db $4F
  $89C6  4F        .db $4F
  $89C7  4F        .db $4F
  $89C8  37        .db $37
  $89C9  37        .db $37
  $89CA  0A        ASL
  $89CB  05 19     ORA $19
  $89CD  1E 4E 4F  ASL $4F4E,X
  $89D0  0A        ASL
  $89D1  0A        ASL
  $89D2  0A        ASL
  $89D3  08        PHP
  $89D4  12        .db $12
  $89D5  1F        .db $1F
  $89D6  4E 4F 0A  LSR $0A4F
  $89D9  0B        .db $0B
  $89DA  0B        .db $0B
  $89DB  07        .db $07
  $89DC  19 1E 4E  ORA $4E1E,Y
  $89DF  4F        .db $4F
  $89E0  0A        ASL
  $89E1  0A        ASL
  $89E2  0D 25 13  ORA $1325
  $89E5  1D 4E 4F  ORA $4F4E,X
  $89E8  0A        ASL
  $89E9  0A        ASL
  $89EA  0D 25 18  ORA $1825
  $89ED  1E 4E 4F  ASL $4F4E,X
  $89F0  0A        ASL
  $89F1  0A        ASL
  $89F2  0D 22 12  ORA $1222
  $89F5  1F        .db $1F
  $89F6  4E 4F 0A  LSR $0A4F
  $89F9  0A        ASL
  $89FA  0E 25 1B  ASL $1B25
  $89FD  1E 4E 4F  ASL $4F4E,X
  $8A00  0A        ASL
  $8A01  0A        ASL
  $8A02  0C        .db $0C
  $8A03  15 1D     ORA $1D,X

L_8A05:
  $8A05  4E 4F 4F  LSR $4F4F
  $8A08  0A        ASL
  $8A09  0A        ASL
  $8A0A  0D 1A 1F  ORA $1F1A
  $8A0D  4E 4F 4F  LSR $4F4F
  $8A10  0A        ASL
  $8A11  0B        .db $0B
  $8A12  0E 18 1E  ASL $1E18
  $8A15  4E 4F 4F  LSR $4F4F
  $8A18  0A        ASL
  $8A19  11 25     ORA ($25),Y
  $8A1B  1B        .db $1B
  $8A1C  1E 4E 4F  ASL $4F4E,X
  $8A1F  4F        .db $4F
  $8A20  0A        ASL
  $8A21  10 15     BPL $8A38
  $8A23  1D 4E 4F  ORA $4F4E,X
  $8A26  4F        .db $4F
  $8A27  4F        .db $4F
  $8A28  0A        ASL
  $8A29  0D 1A 1F  ORA $1F1A
  $8A2C  4E 4F 4F  LSR $4F4F
  $8A2F  4F        .db $4F
  $8A30  0A        ASL
  $8A31  11 18     ORA ($18),Y
  $8A33  1E 4E 4F  ASL $4F4E,X
  $8A36  4F        .db $4F
  $8A37  4F        .db $4F

L_8A38:
  $8A38  0A        ASL
  $8A39  0D 19 1E  ORA $1E19
  $8A3C  4E 4F 4F  LSR $4F4F
  $8A3F  4F        .db $4F
  $8A40  0A        ASL
  $8A41  0D 12 1F  ORA $1F12
  $8A44  4E 4F 4F  LSR $4F4F
  $8A47  4F        .db $4F
  $8A48  0A        ASL
  $8A49  11 13     ORA ($13),Y
  $8A4B  1D 4E 4F  ORA $4F4E,X
  $8A4E  4F        .db $4F
  $8A4F  4F        .db $4F
  $8A50  0A        ASL
  $8A51  10 18     BPL $8A6B
  $8A53  1E 4E 4F  ASL $4F4E,X
  $8A56  4F        .db $4F
  $8A57  4F        .db $4F
  $8A58  0A        ASL
  $8A59  0D 1A 1F  ORA $1F1A
  $8A5C  4E 4F 4F  LSR $4F4F
  $8A5F  4F        .db $4F
  $8A60  0B        .db $0B
  $8A61  0E 18 1E  ASL $1E18
  $8A64  4E 4F 4F  LSR $4F4F
  $8A67  4F        .db $4F
  $8A68  0D 25 1B  ORA $1B25

L_8A6B:
  $8A6B  1E 4E 4F  ASL $4F4E,X
  $8A6E  4F        .db $4F
  $8A6F  4F        .db $4F
  $8A70  51 9F     EOR ($9F),Y
  $8A72  01 1D     ORA ($1D,X)
  $8A74  4E 4F 4F  LSR $4F4F
  $8A77  4F        .db $4F
  $8A78  52        .db $52
  $8A79  53        .db $53
  $8A7A  50 28     BVC $8AA4
  $8A7C  4E 4F 4F  LSR $4F4F
  $8A7F  4F        .db $4F
  $8A80  4F        .db $4F
  $8A81  74        .db $74
  $8A82  45 44     EOR $44
  $8A84  4E 4F 4F  LSR $4F4F
  $8A87  4F        .db $4F
  $8A88  4F        .db $4F
  $8A89  74        .db $74
  $8A8A  45 44     EOR $44
  $8A8C  4E 4F 4F  LSR $4F4F
  $8A8F  4F        .db $4F
  $8A90  4F        .db $4F
  $8A91  74        .db $74
  $8A92  45 44     EOR $44
  $8A94  4E 4F 4F  LSR $4F4F
  $8A97  4F        .db $4F
  $8A98  4F        .db $4F
  $8A99  74        .db $74
  $8A9A  45 44     EOR $44
  $8A9C  4E 4F 4F  LSR $4F4F
  $8A9F  4F        .db $4F
  $8AA0  4F        .db $4F
  $8AA1  74        .db $74
  $8AA2  45 44     EOR $44

L_8AA4:
  $8AA4  4E 4F 4F  LSR $4F4F
  $8AA7  4F        .db $4F
  $8AA8  4F        .db $4F
  $8AA9  74        .db $74
  $8AAA  45 44     EOR $44
  $8AAC  4E 4F 4F  LSR $4F4F
  $8AAF  4F        .db $4F
  $8AB0  4F        .db $4F
  $8AB1  74        .db $74
  $8AB2  45 44     EOR $44
  $8AB4  4E 4F 4F  LSR $4F4F
  $8AB7  4F        .db $4F
  $8AB8  4F        .db $4F
  $8AB9  74        .db $74
  $8ABA  54        .db $54
  $8ABB  55 4E     EOR $4E,X
  $8ABD  4F        .db $4F
  $8ABE  4F        .db $4F
  $8ABF  4F        .db $4F
  $8AC0  4F        .db $4F
  $8AC1  77        .db $77
  $8AC2  47        .db $47
  $8AC3  44        .db $44
  $8AC4  73        .db $73
  $8AC5  5A        .db $5A
  $8AC6  6F        .db $6F
  $8AC7  4F        .db $4F
  $8AC8  75 7C     ADC $7C,X
  $8ACA  46 44     LSR $44
  $8ACC  44        .db $44
  $8ACD  44        .db $44
  $8ACE  4E 4F 4F  LSR $4F4F
  $8AD1  5F        .db $5F
  $8AD2  99 44 44  STA $4444,Y
  $8AD5  44        .db $44
  $8AD6  4E 4F 76  LSR $764F
  $8AD9  98        TYA
  $8ADA  47        .db $47
  $8ADB  44        .db $44
  $8ADC  44        .db $44
  $8ADD  44        .db $44
  $8ADE  4E 4F 76  LSR $764F
  $8AE1  98        TYA
  $8AE2  47        .db $47
  $8AE3  44        .db $44
  $8AE4  44        .db $44
  $8AE5  44        .db $44
  $8AE6  4E 4F 76  LSR $764F
  $8AE9  56 44     LSR $44,X
  $8AEB  44        .db $44
  $8AEC  44        .db $44
  $8AED  44        .db $44
  $8AEE  4E 4F 4F  LSR $4F4F
  $8AF1  6A        ROR
  $8AF2  46 44     LSR $44
  $8AF4  44        .db $44
  $8AF5  44        .db $44
  $8AF6  4E 4F 4F  LSR $4F4F
  $8AF9  4F        .db $4F
  $8AFA  5D 63 63  EOR $6363,X
  $8AFD  63        .db $63
  $8AFE  6E 4F A1  ROR $A14F
  $8B01  A1 A1     LDA ($A1,X)
  $8B03  A1 A1     LDA ($A1,X)
  $8B05  A1 A1     LDA ($A1,X)
  $8B07  A1 A1     LDA ($A1,X)
  $8B09  A1 A1     LDA ($A1,X)
  $8B0B  A1 A1     LDA ($A1,X)
  $8B0D  A1 A1     LDA ($A1,X)
  $8B0F  A1 A1     LDA ($A1,X)
  $8B11  A1 A1     LDA ($A1,X)
  $8B13  A1 A1     LDA ($A1,X)
  $8B15  A1 A1     LDA ($A1,X)
  $8B17  A1 A8     LDA ($A8,X)
  $8B19  A8        TAY
  $8B1A  A8        TAY
  $8B1B  A8        TAY
  $8B1C  A8        TAY
  $8B1D  A9 A8     LDA #$A8
  $8B1F  A8        TAY
  $8B20  A8        TAY
  $8B21  A8        TAY
  $8B22  A8        TAY
  $8B23  A8        TAY
  $8B24  A8        TAY
  $8B25  AA        TAX
  $8B26  A8        TAY
  $8B27  A8        TAY
  $8B28  A1 A1     LDA ($A1,X)
  $8B2A  A1 A1     LDA ($A1,X)
  $8B2C  A1 A1     LDA ($A1,X)
  $8B2E  A1 A1     LDA ($A1,X)
  $8B30  A1 A1     LDA ($A1,X)
  $8B32  A1 A1     LDA ($A1,X)
  $8B34  A1 A1     LDA ($A1,X)
  $8B36  A1 A1     LDA ($A1,X)
  $8B38  A1 A1     LDA ($A1,X)
  $8B3A  A1 A1     LDA ($A1,X)
  $8B3C  A1 A1     LDA ($A1,X)
  $8B3E  A1 A1     LDA ($A1,X)
  $8B40  A1 A1     LDA ($A1,X)
  $8B42  A1 A7     LDA ($A7,X)
  $8B44  A3        .db $A3
  $8B45  B1 A1     LDA ($A1),Y
  $8B47  A1 A1     LDA ($A1,X)
  $8B49  A1 A1     LDA ($A1,X)
  $8B4B  A7        .db $A7
  $8B4C  AF        .db $AF
  $8B4D  B0 A1     BCS $8AF0
  $8B4F  A1 A1     LDA ($A1,X)
  $8B51  A2 A3     LDX #$A3
  $8B53  A4 AD     LDY $AD
  $8B55  A5 A6     LDA $A6
  $8B57  A8        TAY
  $8B58  A8        TAY
  $8B59  A8        TAY
  $8B5A  A8        TAY
  $8B5B  A8        TAY
  $8B5C  A8        TAY
  $8B5D  A9 A8     LDA #$A8
  $8B5F  A8        TAY
  $8B60  A8        TAY
  $8B61  A8        TAY
  $8B62  AB        .db $AB
  $8B63  AC A8 A8  LDY $A8A8
  $8B66  A8        TAY
  $8B67  A8        TAY
  $8B68  B4 AE     LDY $AE,X
  $8B6A  B5 B6     LDA $B6,X
  $8B6C  AE A8 A8  LDX $A8A8
  $8B6F  A8        TAY
  $8B70  A1 B3     LDA ($B3,X)
  $8B72  B2        .db $B2
  $8B73  A1 A1     LDA ($A1,X)
  $8B75  A1 A1     LDA ($A1,X)
  $8B77  A1 A1     LDA ($A1,X)
  $8B79  B7        .db $B7
  $8B7A  B8        CLV
  $8B7B  A1 A1     LDA ($A1,X)
  $8B7D  A1 A1     LDA ($A1,X)
  $8B7F  A1 A1     LDA ($A1,X)
  $8B81  A1 A1     LDA ($A1,X)
  $8B83  A1 A1     LDA ($A1,X)
  $8B85  C0 C3     CPY #$C3
  $8B87  C3        .db $C3
  $8B88  A1 A1     LDA ($A1,X)
  $8B8A  C0 C3     CPY #$C3
  $8B8C  A6 A8     LDX $A8
  $8B8E  A8        TAY
  $8B8F  A8        TAY
  $8B90  A8        TAY
  $8B91  A8        TAY
  $8B92  AA        TAX
  $8B93  A8        TAY
  $8B94  A8        TAY
  $8B95  A8        TAY
  $8B96  A8        TAY
  $8B97  A8        TAY
  $8B98  A8        TAY
  $8B99  A8        TAY
  $8B9A  A8        TAY
  $8B9B  A8        TAY
  $8B9C  A8        TAY
  $8B9D  A8        TAY
  $8B9E  AB        .db $AB
  $8B9F  CA        DEX
  $8BA0  A8        TAY
  $8BA1  BC BB BB  LDY $BBBB,X
  $8BA4  AD BB BA  LDA $BABB
  $8BA7  01 A8     ORA ($A8,X)
  $8BA9  A8        TAY
  $8BAA  A8        TAY
  $8BAB  AB        .db $AB
  $8BAC  AC A8 B9  LDY $B9A8
  $8BAF  01 A2     ORA ($A2,X)
  $8BB1  B4 B6     LDY $B6,X
  $8BB3  C8        INY
  $8BB4  AF        .db $AF
  $8BB5  A8        TAY
  $8BB6  B9 01 A1  LDA $A101,Y
  $8BB9  A1 A1     LDA ($A1,X)
  $8BBB  A1 A1     LDA ($A1,X)
  $8BBD  A1 A7     LDA ($A7,X)
  $8BBF  01 C3     ORA ($C3,X)
  $8BC1  C3        .db $C3
  $8BC2  C4 CB     CPY $CB
  $8BC4  CB        .db $CB
  $8BC5  CC CC CC  CPY $CCCC
  $8BC8  A8        TAY
  $8BC9  A8        TAY
  $8BCA  C5 CE     CMP $CE
  $8BCC  CD D0 D1  CMP $D1D0
  $8BCF  D2        .db $D2
  $8BD0  A8        TAY
  $8BD1  A8        TAY
  $8BD2  C5 CE     CMP $CE
  $8BD4  CE D3 D4  DEC $D4D3
  $8BD7  D5 A8     CMP $A8,X
  $8BD9  A8        TAY
  $8BDA  C5 CE     CMP $CE
  $8BDC  CE D7 D6  DEC $D6D7
  $8BDF  D2        .db $D2
  $8BE0  C7        .db $C7
  $8BE1  C7        .db $C7
  $8BE2  C5 CE     CMP $CE
  $8BE4  CE CE D8  DEC $D8CE
  $8BE7  01 C7     ORA ($C7,X)
  $8BE9  E7        .db $E7
  $8BEA  C5 CE     CMP $CE
  $8BEC  CE D3 D4  DEC $D4D3
  $8BEF  D5 C6     CMP $C6,X
  $8BF1  C6 C5     DEC $C5
  $8BF3  CE CE CF  DEC $CFCE
  $8BF6  CF        .db $CF
  $8BF7  CF        .db $CF
  $8BF8  C6 C6     DEC $C6
  $8BFA  C5 CE     CMP $CE
  $8BFC  CE DC D8  DEC $D8DC
  $8BFF  01 C7     ORA ($C7,X)
  $8C01  C7        .db $C7
  $8C02  C5 CE     CMP $CE
  $8C04  CE DB D8  DEC $D8DB
  $8C07  01 C7     ORA ($C7,X)
  $8C09  E7        .db $E7
  $8C0A  C5 CE     CMP $CE
  $8C0C  CE D3 D4  DEC $D4D3
  $8C0F  D5 C7     CMP $C7,X
  $8C11  C7        .db $C7
  $8C12  C5 CE     CMP $CE
  $8C14  CE DC D8  DEC $D8DC
  $8C17  01 C7     ORA ($C7,X)
  $8C19  E7        .db $E7
  $8C1A  C5 CE     CMP $CE
  $8C1C  CE CE D8  DEC $D8CE
  $8C1F  01 C6     ORA ($C6,X)
  $8C21  C6 C5     DEC $C5
  $8C23  CE CE DA  DEC $DACE
  $8C26  FC        .db $FC
  $8C27  D5 C6     CMP $C6,X
  $8C29  C6 C5     DEC $C5
  $8C2B  CE CE CE  DEC $CECE
  $8C2E  D8        CLD
  $8C2F  01 C6     ORA ($C6,X)
  $8C31  C6 C5     DEC $C5
  $8C33  CE CE CD  DEC $CDCE
  $8C36  DD 01 E7  CMP $E701,X
  $8C39  C7        .db $C7
  $8C3A  C5 CE     CMP $CE
  $8C3C  CE CF CF  DEC $CFCF
  $8C3F  CF        .db $CF
  $8C40  C7        .db $C7
  $8C41  C7        .db $C7
  $8C42  C5 CE     CMP $CE
  $8C44  CE CE DD  DEC $DDCE
  $8C47  01 C6     ORA ($C6,X)
  $8C49  C6 C5     DEC $C5
  $8C4B  CE CE CE  DEC $CECE
  $8C4E  DD 01 C6  CMP $C601,X
  $8C51  C6 C5     DEC $C5
  $8C53  CE CE D3  DEC $D3CE
  $8C56  D4        .db $D4
  $8C57  D5 C7     CMP $C7,X
  $8C59  E7        .db $E7
  $8C5A  C5 CE     CMP $CE
  $8C5C  CE D7 D1  DEC $D1D7
  $8C5F  D2        .db $D2
  $8C60  C7        .db $C7
  $8C61  E7        .db $E7
  $8C62  C5 CE     CMP $CE
  $8C64  CE D3 D4  DEC $D4D3
  $8C67  D5 C7     CMP $C7,X
  $8C69  E7        .db $E7
  $8C6A  C5 CE     CMP $CE
  $8C6C  CE D7 D1  DEC $D1D7
  $8C6F  D2        .db $D2
  $8C70  C7        .db $C7
  $8C71  C7        .db $C7
  $8C72  C5 CE     CMP $CE
  $8C74  CE DB D8  DEC $D8DB
  $8C77  01 C7     ORA ($C7,X)
  $8C79  C7        .db $C7
  $8C7A  C5 CE     CMP $CE
  $8C7C  CE CF CF  DEC $CFCF
  $8C7F  CF        .db $CF
  $8C80  C6 C6     DEC $C6
  $8C82  C5 CE     CMP $CE
  $8C84  CE CE DD  DEC $DDCE
  $8C87  01 E7     ORA ($E7,X)
  $8C89  C7        .db $C7
  $8C8A  C5 CE     CMP $CE
  $8C8C  CE CE DD  DEC $DDCE
  $8C8F  01 C6     ORA ($C6,X)
  $8C91  C6 C5     DEC $C5
  $8C93  CE CE D3  DEC $D3CE
  $8C96  D4        .db $D4
  $8C97  D5 A1     CMP $A1,X
  $8C99  A1 DF     LDA ($DF,X)
  $8C9B  CE E1 E0  DEC $E0E1
  $8C9E  E0 E0     CPX #$E0
  $8CA0  A1 A1     LDA ($A1,X)
  $8CA2  E5 CE     SBC $CE
  $8CA4  E1 E0     SBC ($E0,X)
  $8CA6  E0 E0     CPX #$E0
  $8CA8  A1 A1     LDA ($A1,X)
  $8CAA  E5 CE     SBC $CE
  $8CAC  E1 E0     SBC ($E0,X)
  $8CAE  E0 E0     CPX #$E0
  $8CB0  A1 A1     LDA ($A1,X)
  $8CB2  E5 CE     SBC $CE
  $8CB4  E1 E0     SBC ($E0,X)
  $8CB6  E0 E0     CPX #$E0
  $8CB8  A1 A1     LDA ($A1,X)
  $8CBA  E5 CE     SBC $CE
  $8CBC  E1 E0     SBC ($E0,X)
  $8CBE  E0 E0     CPX #$E0
  $8CC0  A1 A1     LDA ($A1,X)
  $8CC2  E5 CE     SBC $CE
  $8CC4  E1 E0     SBC ($E0,X)
  $8CC6  E0 E0     CPX #$E0
  $8CC8  A1 A1     LDA ($A1,X)
  $8CCA  E5 CE     SBC $CE
  $8CCC  E1 E0     SBC ($E0,X)
  $8CCE  E0 E0     CPX #$E0
  $8CD0  A1 A1     LDA ($A1,X)
  $8CD2  E5 CE     SBC $CE
  $8CD4  E1 E0     SBC ($E0,X)
  $8CD6  E0 E0     CPX #$E0
  $8CD8  A7        .db $A7
  $8CD9  E3        .db $E3
  $8CDA  E6 CE     INC $CE
  $8CDC  E1 E0     SBC ($E0,X)
  $8CDE  E0 E0     CPX #$E0
  $8CE0  A7        .db $A7
  $8CE1  EF        .db $EF
  $8CE2  CE CE E2  DEC $E2CE
  $8CE5  E3        .db $E3
  $8CE6  E3        .db $E3
  $8CE7  E3        .db $E3
  $8CE8  A7        .db $A7
  $8CE9  EF        .db $EF
  $8CEA  CE CE CE  DEC $CECE
  $8CED  CE CE CE  DEC $CECE
  $8CF0  A7        .db $A7
  $8CF1  E4 E4     CPX $E4
  $8CF3  E4 E4     CPX $E4
  $8CF5  E4 E4     CPX $E4
  $8CF7  E4 A1     CPX $A1
  $8CF9  E0 E0     CPX #$E0
  $8CFB  E0 E0     CPX #$E0
  $8CFD  E0 E0     CPX #$E0
  $8CFF  E0 E0     CPX #$E0
  $8D01  E0 E0     CPX #$E0
  $8D03  E0 E0     CPX #$E0
  $8D05  E0 E0     CPX #$E0
  $8D07  E0 E0     CPX #$E0
  $8D09  E0 E0     CPX #$E0
  $8D0B  E0 E0     CPX #$E0
  $8D0D  E0 E0     CPX #$E0
  $8D0F  E0 E0     CPX #$E0
  $8D11  E0 E0     CPX #$E0
  $8D13  E0 E0     CPX #$E0
  $8D15  E0 E0     CPX #$E0
  $8D17  E0 E0     CPX #$E0
  $8D19  E0 E0     CPX #$E0
  $8D1B  E0 EA     CPX #$EA
  $8D1D  E3        .db $E3
  $8D1E  E3        .db $E3
  $8D1F  E3        .db $E3
  $8D20  E3        .db $E3
  $8D21  EB        .db $EB
  $8D22  ED ED F7  SBC $F7ED
  $8D25  CE CE CE  DEC $CECE
  $8D28  CE CE CE  DEC $CECE
  $8D2B  CE CE EE  DEC $EECE
  $8D2E  EE EE E4  INC $E4EE
  $8D31  E4 E4     CPX $E4
  $8D33  E4 E4     CPX $E4
  $8D35  EC E0 E0  CPX $E0E0
  $8D38  E0 E0     CPX #$E0
  $8D3A  E0 E0     CPX #$E0
  $8D3C  E0 E0     CPX #$E0
  $8D3E  E0 E0     CPX #$E0
  $8D40  E0 E0     CPX #$E0
  $8D42  E0 E0     CPX #$E0
  $8D44  E0 E0     CPX #$E0
  $8D46  E0 E0     CPX #$E0
  $8D48  E0 E0     CPX #$E0
  $8D4A  E0 E0     CPX #$E0
  $8D4C  E0 E0     CPX #$E0
  $8D4E  E0 E0     CPX #$E0
  $8D50  E0 E0     CPX #$E0
  $8D52  E0 E0     CPX #$E0
  $8D54  E0 E0     CPX #$E0
  $8D56  E0 E0     CPX #$E0
  $8D58  E3        .db $E3
  $8D59  E6 ED     INC $ED
  $8D5B  ED ED F6  SBC $F6ED
  $8D5E  E3        .db $E3
  $8D5F  E3        .db $E3
  $8D60  CE CE CE  DEC $CECE
  $8D63  CE CE CE  DEC $CECE
  $8D66  CE CE EE  DEC $EECE
  $8D69  EE F5 E4  INC $E4F5
  $8D6C  F4        .db $F4
  $8D6D  EE EE EE  INC $EEEE
  $8D70  E0 E0     CPX #$E0
  $8D72  E0 E0     CPX #$E0
  $8D74  E0 E0     CPX #$E0
  $8D76  E0 E0     CPX #$E0
  $8D78  E0 E0     CPX #$E0
  $8D7A  E0 E0     CPX #$E0
  $8D7C  E0 E0     CPX #$E0
  $8D7E  E0 E0     CPX #$E0
  $8D80  E0 E0     CPX #$E0
  $8D82  E0 E0     CPX #$E0
  $8D84  E0 E0     CPX #$E0
  $8D86  E0 E0     CPX #$E0
  $8D88  E0 E0     CPX #$E0
  $8D8A  E0 E0     CPX #$E0
  $8D8C  E0 E0     CPX #$E0
  $8D8E  E0 E0     CPX #$E0
  $8D90  E0 E0     CPX #$E0
  $8D92  E0 F3     CPX #$F3
  $8D94  F2        .db $F2
  $8D95  C1 F2     CMP ($F2,X)
  $8D97  C1 EB     CMP ($EB,X)
  $8D99  F7        .db $F7
  $8D9A  ED F7 CE  SBC $CEF7
  $8D9D  CE CE CE  DEC $CECE
  $8DA0  CE CE CE  DEC $CECE
  $8DA3  CE CE CE  DEC $CECE
  $8DA6  CE CE EE  DEC $EECE
  $8DA9  CE CE CE  DEC $CECE
  $8DAC  CE CE CE  DEC $CECE
  $8DAF  CE F1 E9  DEC $E9F1
  $8DB2  E4 E8     CPX $E8
  $8DB4  F0 DB     BEQ $8D91
  $8DB6  CE CE E0  DEC $E0CE
  $8DB9  E0 E0     CPX #$E0
  $8DBB  E0 E0     CPX #$E0
  $8DBD  E0 E0     CPX #$E0
  $8DBF  E0 E0     CPX #$E0
  $8DC1  E0 E0     CPX #$E0
  $8DC3  E0 E0     CPX #$E0
  $8DC5  E0 E0     CPX #$E0
  $8DC7  E0 E0     CPX #$E0
  $8DC9  E0 E0     CPX #$E0
  $8DCB  E0 E0     CPX #$E0
  $8DCD  E0 E0     CPX #$E0
  $8DCF  E0 C1     CPX #$C1
  $8DD1  F2        .db $F2
  $8DD2  E3        .db $E3
  $8DD3  3D 3E C1  AND $C13E,X
  $8DD6  C1 C1     CMP ($C1,X)
  $8DD8  CE CE CE  DEC $CECE
  $8DDB  FA        .db $FA
  $8DDC  EF        .db $EF
  $8DDD  FB        .db $FB
  $8DDE  C2        .db $C2
  $8DDF  C2        .db $C2
  $8DE0  CE CE BD  DEC $BDCE
  $8DE3  FA        .db $FA
  $8DE4  F7        .db $F7
  $8DE5  F8        SED
  $8DE6  E0 E0     CPX #$E0
  $8DE8  CE CE BD  DEC $BDCE
  $8DEB  CE FB C9  DEC $C9FB
  $8DEE  E0 E0     CPX #$E0
  $8DF0  EE FB E1  INC $E1FB
  $8DF3  E0 E0     CPX #$E0
  $8DF5  E0 E0     CPX #$E0
  $8DF7  E0 E0     CPX #$E0

L_8DF9:
  $8DF9  E0 E0     CPX #$E0
  $8DFB  E0 E0     CPX #$E0
  $8DFD  E0 E0     CPX #$E0
  $8DFF  E0 E0     CPX #$E0

L_8E01:
  $8E01  E0 E0     CPX #$E0
  $8E03  E0 E0     CPX #$E0
  $8E05  E0 E0     CPX #$E0
  $8E07  E0 E0     CPX #$E0

L_8E09:
  $8E09  E0 E0     CPX #$E0
  $8E0B  E0 E0     CPX #$E0
  $8E0D  E0 E0     CPX #$E0
  $8E0F  E0 C1     CPX #$C1

L_8E11:
  $8E11  C1 C1     CMP ($C1,X)
  $8E13  C1 C1     CMP ($C1,X)
  $8E15  E3        .db $E3
  $8E16  E1 E0     SBC ($E0,X)
  $8E18  C2        .db $C2

L_8E19:
  $8E19  C2        .db $C2
  $8E1A  C2        .db $C2
  $8E1B  C2        .db $C2
  $8E1C  C2        .db $C2
  $8E1D  CE E1 E0  DEC $E0E1
  $8E20  E0 F3     CPX #$F3
  $8E22  FD C4 C1  SBC $C1C4,X
  $8E25  CE E1 E0  DEC $E0E1
  $8E28  E0 F1     CPX #$F1
  $8E2A  01 DE     ORA ($DE,X)
  $8E2C  C2        .db $C2
  $8E2D  C2        .db $C2
  $8E2E  E1 E0     SBC ($E0,X)
  $8E30  A1 A7     LDA ($A7,X)
  $8E32  01 B0     ORA ($B0,X)
  $8E34  A1 A1     LDA ($A1,X)
  $8E36  A1 A1     LDA ($A1,X)
  $8E38  A1 A7     LDA ($A7,X)
  $8E3A  01 B0     ORA ($B0,X)
  $8E3C  A1 A1     LDA ($A1,X)
  $8E3E  A1 A1     LDA ($A1,X)
  $8E40  A1 A7     LDA ($A7,X)
  $8E42  01 01     ORA ($01,X)
  $8E44  01 01     ORA ($01,X)
  $8E46  B0 A1     BCS $8DE9
  $8E48  A1 A1     LDA ($A1,X)
  $8E4A  A1 A7     LDA ($A7,X)
  $8E4C  01 01     ORA ($01,X)
  $8E4E  B0 A1     BCS $8DF1
  $8E50  A1 A1     LDA ($A1,X)
  $8E52  A1 A7     LDA ($A7,X)
  $8E54  01 01     ORA ($01,X)
  $8E56  B0 A1     BCS $8DF9
  $8E58  A1 A1     LDA ($A1,X)
  $8E5A  A1 A7     LDA ($A7,X)
  $8E5C  01 01     ORA ($01,X)
  $8E5E  B0 A1     BCS $8E01
  $8E60  A1 A1     LDA ($A1,X)
  $8E62  A1 A7     LDA ($A7,X)
  $8E64  01 01     ORA ($01,X)
  $8E66  B0 A1     BCS $8E09
  $8E68  A1 A1     LDA ($A1,X)
  $8E6A  A1 A7     LDA ($A7,X)
  $8E6C  01 01     ORA ($01,X)
  $8E6E  B0 A1     BCS $8E11
  $8E70  A1 A1     LDA ($A1,X)
  $8E72  A1 A7     LDA ($A7,X)
  $8E74  01 01     ORA ($01,X)
  $8E76  B0 A1     BCS $8E19
  $8E78  A1 A1     LDA ($A1,X)
  $8E7A  A1 A7     LDA ($A7,X)
  $8E7C  01 01     ORA ($01,X)
  $8E7E  B0 A1     BCS $8E21
  $8E80  A1 A1     LDA ($A1,X)
  $8E82  A1 A7     LDA ($A7,X)
  $8E84  01 01     ORA ($01,X)
  $8E86  B0 A1     BCS $8E29
  $8E88  A1 A1     LDA ($A1,X)
  $8E8A  A1 A7     LDA ($A7,X)
  $8E8C  01 01     ORA ($01,X)
  $8E8E  B0 A1     BCS $8E31
  $8E90  A1 A1     LDA ($A1,X)
  $8E92  A1 A7     LDA ($A7,X)
  $8E94  01 01     ORA ($01,X)
  $8E96  B0 A1     BCS $8E39
  $8E98  A1 A1     LDA ($A1,X)
  $8E9A  A1 A7     LDA ($A7,X)
  $8E9C  01 01     ORA ($01,X)
  $8E9E  B0 A1     BCS $8E41
  $8EA0  A1 A1     LDA ($A1,X)
  $8EA2  A1 A7     LDA ($A7,X)
  $8EA4  01 01     ORA ($01,X)
  $8EA6  B0 A1     BCS $8E49
  $8EA8  A1 A1     LDA ($A1,X)
  $8EAA  A1 A7     LDA ($A7,X)
  $8EAC  01 01     ORA ($01,X)
  $8EAE  B0 A1     BCS $8E51
  $8EB0  A1 A1     LDA ($A1,X)
  $8EB2  A1 A7     LDA ($A7,X)
  $8EB4  01 01     ORA ($01,X)
  $8EB6  B0 A1     BCS $8E59
  $8EB8  A1 A1     LDA ($A1,X)
  $8EBA  A1 A7     LDA ($A7,X)
  $8EBC  FE FE B0  INC $B0FE,X
  $8EBF  A1 01     LDA ($01,X)
  $8EC1  01 01     ORA ($01,X)
  $8EC3  01 01     ORA ($01,X)
  $8EC5  01 BF     ORA ($BF,X)
  $8EC7  BF        .db $BF
  $8EC8  01 01     ORA ($01,X)
  $8ECA  01 01     ORA ($01,X)
  $8ECC  01 01     ORA ($01,X)
  $8ECE  BF        .db $BF
  $8ECF  BF        .db $BF
  $8ED0  01 01     ORA ($01,X)
  $8ED2  01 01     ORA ($01,X)
  $8ED4  01 01     ORA ($01,X)
  $8ED6  BF        .db $BF
  $8ED7  BF        .db $BF
  $8ED8  01 01     ORA ($01,X)
  $8EDA  01 01     ORA ($01,X)
  $8EDC  01 01     ORA ($01,X)
  $8EDE  BF        .db $BF
  $8EDF  BF        .db $BF
  $8EE0  01 01     ORA ($01,X)
  $8EE2  01 01     ORA ($01,X)
  $8EE4  01 01     ORA ($01,X)
  $8EE6  BF        .db $BF
  $8EE7  BF        .db $BF
  $8EE8  01 01     ORA ($01,X)
  $8EEA  01 01     ORA ($01,X)
  $8EEC  01 01     ORA ($01,X)
  $8EEE  BF        .db $BF
  $8EEF  BF        .db $BF
  $8EF0  01 01     ORA ($01,X)
  $8EF2  01 01     ORA ($01,X)
  $8EF4  01 01     ORA ($01,X)
  $8EF6  BF        .db $BF
  $8EF7  BF        .db $BF
  $8EF8  01 01     ORA ($01,X)
  $8EFA  01 01     ORA ($01,X)
  $8EFC  01 01     ORA ($01,X)
  $8EFE  BF        .db $BF
  $8EFF  BF        .db $BF
  $8F00  01 01     ORA ($01,X)
  $8F02  01 01     ORA ($01,X)
  $8F04  01 01     ORA ($01,X)
  $8F06  BF        .db $BF
  $8F07  BF        .db $BF
  $8F08  01 01     ORA ($01,X)
  $8F0A  01 01     ORA ($01,X)
  $8F0C  01 01     ORA ($01,X)
  $8F0E  BF        .db $BF
  $8F0F  BF        .db $BF
  $8F10  01 01     ORA ($01,X)
  $8F12  01 01     ORA ($01,X)
  $8F14  01 01     ORA ($01,X)
  $8F16  BF        .db $BF
  $8F17  BF        .db $BF
  $8F18  01 01     ORA ($01,X)
  $8F1A  01 01     ORA ($01,X)
  $8F1C  01 01     ORA ($01,X)
  $8F1E  BF        .db $BF
  $8F1F  BF        .db $BF
  $8F20  01 01     ORA ($01,X)
  $8F22  01 01     ORA ($01,X)
  $8F24  01 01     ORA ($01,X)
  $8F26  BF        .db $BF
  $8F27  BF        .db $BF
  $8F28  01 01     ORA ($01,X)
  $8F2A  01 01     ORA ($01,X)
  $8F2C  01 01     ORA ($01,X)
  $8F2E  BF        .db $BF
  $8F2F  BF        .db $BF
  $8F30  01 01     ORA ($01,X)
  $8F32  01 01     ORA ($01,X)
  $8F34  01 01     ORA ($01,X)
  $8F36  BF        .db $BF
  $8F37  BF        .db $BF
  $8F38  01 01     ORA ($01,X)
  $8F3A  01 01     ORA ($01,X)
  $8F3C  01 01     ORA ($01,X)
  $8F3E  BF        .db $BF
  $8F3F  BF        .db $BF
  $8F40  01 01     ORA ($01,X)
  $8F42  01 01     ORA ($01,X)
  $8F44  01 01     ORA ($01,X)
  $8F46  BF        .db $BF
  $8F47  BF        .db $BF
  $8F48  01 01     ORA ($01,X)
  $8F4A  01 01     ORA ($01,X)
  $8F4C  01 01     ORA ($01,X)
  $8F4E  BF        .db $BF
  $8F4F  BF        .db $BF
  $8F50  01 01     ORA ($01,X)
  $8F52  01 01     ORA ($01,X)
  $8F54  01 01     ORA ($01,X)
  $8F56  BF        .db $BF
  $8F57  BF        .db $BF
  $8F58  01 01     ORA ($01,X)
  $8F5A  01 01     ORA ($01,X)
  $8F5C  01 01     ORA ($01,X)
  $8F5E  BF        .db $BF
  $8F5F  BF        .db $BF
  $8F60  01 01     ORA ($01,X)
  $8F62  01 01     ORA ($01,X)
  $8F64  01 01     ORA ($01,X)
  $8F66  BF        .db $BF
  $8F67  BF        .db $BF
  $8F68  01 01     ORA ($01,X)
  $8F6A  01 01     ORA ($01,X)
  $8F6C  01 01     ORA ($01,X)
  $8F6E  BF        .db $BF
  $8F6F  BF        .db $BF
  $8F70  01 01     ORA ($01,X)
  $8F72  01 01     ORA ($01,X)
  $8F74  01 01     ORA ($01,X)
  $8F76  BF        .db $BF
  $8F77  BF        .db $BF
  $8F78  01 01     ORA ($01,X)
  $8F7A  01 01     ORA ($01,X)
  $8F7C  01 01     ORA ($01,X)
  $8F7E  BF        .db $BF
  $8F7F  BF        .db $BF
  $8F80  FF        .db $FF
  $8F81  FF        .db $FF
  $8F82  FF        .db $FF
  $8F83  FF        .db $FF
  $8F84  FF        .db $FF
  $8F85  FF        .db $FF
  $8F86  FF        .db $FF
  $8F87  FF        .db $FF
  $8F88  FF        .db $FF
  $8F89  FF        .db $FF
  $8F8A  FF        .db $FF
  $8F8B  FF        .db $FF
  $8F8C  FF        .db $FF
  $8F8D  FF        .db $FF
  $8F8E  FF        .db $FF
  $8F8F  FF        .db $FF
  $8F90  FF        .db $FF
  $8F91  FF        .db $FF
  $8F92  FF        .db $FF
  $8F93  FF        .db $FF
  $8F94  FF        .db $FF
  $8F95  FF        .db $FF
  $8F96  FF        .db $FF
  $8F97  FF        .db $FF
  $8F98  FF        .db $FF
  $8F99  FF        .db $FF
  $8F9A  FF        .db $FF
  $8F9B  FF        .db $FF
  $8F9C  FF        .db $FF
  $8F9D  FF        .db $FF
  $8F9E  FF        .db $FF
  $8F9F  FF        .db $FF
  $8FA0  FF        .db $FF
  $8FA1  FF        .db $FF
  $8FA2  FF        .db $FF
  $8FA3  FF        .db $FF
  $8FA4  FF        .db $FF
  $8FA5  FF        .db $FF
  $8FA6  FF        .db $FF
  $8FA7  FF        .db $FF
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

L_8FED:
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
  $9002  07        .db $07
  $9003  08        PHP
  $9004  13        .db $13
  $9005  16 10     ASL $10,X
  $9007  10 00     BPL $9009

L_9009:
  $9009  00        BRK
  $900A  00        BRK
  $900B  07        .db $07
  $900C  0E 0F 0F  ASL $0F0F
  $900F  0F        .db $0F
  $9010  01 03     ORA ($03,X)
  $9012  87        .db $87
  $9013  E8        INX
  $9014  1F        .db $1F
  $9015  CC 1D 39  CPY $391D
  $9018  00        BRK
  $9019  01 00     ORA ($00,X)
  $901B  07        .db $07
  $901C  E0 F0     CPX #$F0
  $901E  E0 C0     CPX #$C0
  $9020  F8        SED
  $9021  C6 81     DEC $81
  $9023  30 C8     BMI $8FED
  $9025  05 6D     ORA $6D
  $9027  65 00     ADC $00
  $9029  B8        CLV
  $902A  7E CF 07  ROR $07CF,X
  $902D  03        .db $03
  $902E  03        .db $03
  $902F  03        .db $03
  $9030  00        BRK
  $9031  00        BRK
  $9032  00        BRK
  $9033  87        .db $87
  $9034  BE CE DE  LDX $DECE,Y
  $9037  9F        .db $9F
  $9038  00        BRK
  $9039  00        BRK
  $903A  00        BRK
  $903B  00        BRK
  $903C  01 31     ORA ($31,X)
  $903E  21 60     AND ($60,X)
  $9040  00        BRK
  $9041  00        BRK
  $9042  F0 1C     BEQ $9060
  $9044  62        .db $62

L_9045:
  $9045  39 09 01  AND $0109,Y
  $9048  00        BRK
  $9049  00        BRK
  $904A  00        BRK
  $904B  E0 FC     CPX #$FC
  $904D  FE FE FE  INC $FEFE,X
  $9050  09 06     ORA #$06
  $9052  00        BRK

L_9053:
  $9053  00        BRK
  $9054  00        BRK
  $9055  00        BRK
  $9056  00        BRK
  $9057  00        BRK
  $9058  06 00     ASL $00
  $905A  00        BRK
  $905B  00        BRK
  $905C  00        BRK
  $905D  00        BRK
  $905E  00        BRK
  $905F  00        BRK

L_9060:
  $9060  30 F1     BMI $9053
  $9062  31 11     AND ($11),Y
  $9064  08        PHP
  $9065  0E 09 11  ASL $1109
  $9068  C0 00     CPY #$00
  $906A  00        BRK
  $906B  00        BRK
  $906C  00        BRK
  $906D  00        BRK
  $906E  06 0F     ASL $0F
  $9070  02        .db $02
  $9071  01 01     ORA ($01,X)
  $9073  02        .db $02
  $9074  04        .db $04
  $9075  38        SEC
  $9076  E0 F8     CPX #$F8
  $9078  01 00     ORA ($00,X)
  $907A  00        BRK
  $907B  01 03     ORA ($03,X)
  $907D  07        .db $07
  $907E  1F        .db $1F
  $907F  FF        .db $FF
  $9080  9F        .db $9F
  $9081  9F        .db $9F
  $9082  8F        .db $8F
  $9083  46 40     LSR $40
  $9085  21 1E     AND ($1E,X)
  $9087  00        BRK
  $9088  60        RTS
  $9089  60        RTS
  $908A  70 B9     BVS $9045
  $908C  BF        .db $BF
  $908D  DE E1 FF  DEC $FFE1,X
  $9090  C2        .db $C2
  $9091  D4        .db $D4
  $9092  38        SEC
  $9093  80        .db $80
  $9094  80        .db $80
  $9095  80        .db $80
  $9096  40        RTI
  $9097  20 3C 28  JSR $283C
  $909A  00        BRK
  $909B  00        BRK
  $909C  00        BRK
  $909D  00        BRK
  $909E  80        .db $80
  $909F  C0 13     CPY #$13
  $90A1  27        .db $27
  $90A2  27        .db $27
  $90A3  2F        .db $2F
  $90A4  2F        .db $2F
  $90A5  7F        .db $7F
  $90A6  FF        .db $FF
  $90A7  FF        .db $FF
  $90A8  0E 1C 1C  ASL $1C1C
  $90AB  18        CLC
  $90AC  18        CLC
  $90AD  08        PHP
  $90AE  08        PHP
  $90AF  09 FE     ORA #$FE
  $90B1  FF        .db $FF
  $90B2  FF        .db $FF
  $90B3  FF        .db $FF
  $90B4  FF        .db $FF
  $90B5  FF        .db $FF
  $90B6  9F        .db $9F
  $90B7  FF        .db $FF
  $90B8  07        .db $07
  $90B9  C1 E0     CMP ($E0,X)
  $90BB  60        RTS
  $90BC  00        BRK
  $90BD  60        RTS
  $90BE  6F        .db $6F
  $90BF  8F        .db $8F
  $90C0  00        BRK
  $90C1  00        BRK
  $90C2  80        .db $80
  $90C3  80        .db $80
  $90C4  C0 C1     CPY #$C1
  $90C6  C7        .db $C7
  $90C7  CF        .db $CF
  $90C8  FF        .db $FF
  $90C9  FF        .db $FF
  $90CA  FF        .db $FF
  $90CB  FF        .db $FF
  $90CC  7F        .db $7F
  $90CD  7E 78 70  ROR $7078,X
  $90D0  20 10 10  JSR $1010
  $90D3  10 10     BPL $90E5
  $90D5  E0 F0     CPX #$F0
  $90D7  88        DEY
  $90D8  C0 E0     CPY #$E0
  $90DA  E0 E0     CPX #$E0
  $90DC  E0 00     CPX #$00
  $90DE  00        BRK
  $90DF  70 00     BVS $90E1

L_90E1:
  $90E1  00        BRK
  $90E2  00        BRK
  $90E3  00        BRK
  $90E4  01 02     ORA ($02,X)
  $90E6  04        .db $04
  $90E7  07        .db $07
  $90E8  00        BRK
  $90E9  00        BRK
  $90EA  00        BRK
  $90EB  00        BRK
  $90EC  00        BRK
  $90ED  01 03     ORA ($03,X)
  $90EF  00        BRK
  $90F0  9F        .db $9F
  $90F1  AF        .db $AF
  $90F2  57        .db $57
  $90F3  63        .db $63
  $90F4  99 30 00  STA $0030,Y
  $90F7  FF        .db $FF
  $90F8  67        .db $67
  $90F9  75 3A     ADC $3A,X
  $90FB  1D 7E FF  ORA $FF7E,X
  $90FE  FF        .db $FF
  $90FF  00        BRK
  $9100  FF        .db $FF
  $9101  FF        .db $FF
  $9102  FF        .db $FF
  $9103  FF        .db $FF
  $9104  FC        .db $FC
  $9105  7F        .db $7F
  $9106  20 E0 86  JSR $86E0
  $9109  80        .db $80
  $910A  00        BRK
  $910B  83        .db $83
  $910C  7F        .db $7F
  $910D  80        .db $80

L_910E:
  $910E  C0 00     CPY #$00
  $9110  DE 9C B0  DEC $B09C,X
  $9113  20 30 E0  JSR $E030
  $9116  40        RTI
  $9117  7F        .db $7F
  $9118  61 E3     ADC ($E3,X)

L_911A:
  $911A  CF        .db $CF
  $911B  DF        .db $DF
  $911C  CF        .db $CF
  $911D  1F        .db $1F
  $911E  3F        .db $3F
  $911F  00        BRK
  $9120  28        PLP
  $9121  68        PLA
  $9122  D0 30     BNE $9154
  $9124  CC 32 01  CPY $0132
  $9127  FF        .db $FF
  $9128  F0 F0     BEQ $911A

L_912A:
  $912A  E0 C0     CPX #$C0
  $912C  F0 FC     BEQ $912A
  $912E  FE 00 00  INC $0000,X
  $9131  01 03     ORA ($03,X)
  $9133  07        .db $07
  $9134  08        PHP
  $9135  07        .db $07
  $9136  04        .db $04
  $9137  05 00     ORA $00
  $9139  00        BRK
  $913A  01 00     ORA ($00,X)
  $913C  07        .db $07
  $913D  00        BRK
  $913E  00        BRK
  $913F  00        BRK
  $9140  00        BRK
  $9141  F8        SED
  $9142  C6 81     DEC $81
  $9144  30 C8     BMI $910E
  $9146  05 6D     ORA $6D
  $9148  00        BRK
  $9149  00        BRK
  $914A  B8        CLV
  $914B  7E CF 07  ROR $07CF,X
  $914E  03        .db $03
  $914F  03        .db $03
  $9150  00        BRK
  $9151  00        BRK
  $9152  00        BRK
  $9153  00        BRK

L_9154:
  $9154  80        .db $80
  $9155  C0 B0     CPY #$B0
  $9157  8F        .db $8F
  $9158  00        BRK
  $9159  00        BRK
  $915A  00        BRK
  $915B  00        BRK
  $915C  00        BRK
  $915D  00        BRK
  $915E  40        RTI
  $915F  70 00     BVS $9161

L_9161:
  $9161  00        BRK
  $9162  00        BRK
  $9163  00        BRK
  $9164  00        BRK
  $9165  00        BRK
  $9166  00        BRK
  $9167  C0 00     CPY #$00
  $9169  00        BRK
  $916A  00        BRK
  $916B  00        BRK
  $916C  00        BRK
  $916D  00        BRK
  $916E  00        BRK
  $916F  00        BRK
  $9170  00        BRK
  $9171  00        BRK
  $9172  01 02     ORA ($02,X)
  $9174  05 07     ORA $07
  $9176  0A        ASL
  $9177  08        PHP
  $9178  00        BRK
  $9179  00        BRK

L_917A:
  $917A  00        BRK
  $917B  01 03     ORA ($03,X)
  $917D  03        .db $03
  $917E  07        .db $07
  $917F  07        .db $07
  $9180  19 70 F1  ORA $F170,Y
  $9183  71 31     ADC ($31),Y
  $9185  38        SEC
  $9186  3E 69 00  ROL $0069,X
  $9189  00        BRK
  $918A  00        BRK
  $918B  80        .db $80
  $918C  C0 C0     CPY #$C0
  $918E  C0 86     CPY #$86
  $9190  65 02     ADC $02
  $9192  01 01     ORA ($01,X)
  $9194  02        .db $02
  $9195  04        .db $04
  $9196  38        SEC
  $9197  F8        SED
  $9198  03        .db $03
  $9199  01 00     ORA ($00,X)
  $919B  00        BRK
  $919C  01 03     ORA ($03,X)
  $919E  07        .db $07
  $919F  3F        .db $3F
  $91A0  94 AB     STY $AB,X
  $91A2  A7        .db $A7
  $91A3  47        .db $47
  $91A4  47        .db $47
  $91A5  47        .db $47
  $91A6  47        .db $47
  $91A7  23        .db $23
  $91A8  6F        .db $6F
  $91A9  5C        .db $5C
  $91AA  58        CLI
  $91AB  B8        CLV
  $91AC  B8        CLV
  $91AD  B8        CLV
  $91AE  B8        CLV
  $91AF  DC        .db $DC

L_91B0:
  $91B0  F0 C8     BEQ $917A
  $91B2  B4 12     LDY $12,X
  $91B4  1A        .db $1A
  $91B5  89        .db $89
  $91B6  01 01     ORA ($01,X)
  $91B8  00        BRK
  $91B9  30 78     BMI $9233
  $91BB  FC        .db $FC
  $91BC  FC        .db $FC
  $91BD  7E FE FE  ROR $FEFE,X
  $91C0  08        PHP
  $91C1  04        .db $04
  $91C2  03        .db $03
  $91C3  00        BRK
  $91C4  00        BRK
  $91C5  00        BRK
  $91C6  00        BRK
  $91C7  00        BRK
  $91C8  07        .db $07
  $91C9  03        .db $03
  $91CA  00        BRK
  $91CB  00        BRK
  $91CC  00        BRK
  $91CD  00        BRK
  $91CE  00        BRK
  $91CF  00        BRK
  $91D0  33        .db $33
  $91D1  67        .db $67
  $91D2  A7        .db $A7
  $91D3  2F        .db $2F
  $91D4  2F        .db $2F
  $91D5  7F        .db $7F
  $91D6  FF        .db $FF
  $91D7  FF        .db $FF
  $91D8  CE 9C 1C  DEC $1C9C
  $91DB  1B        .db $1B
  $91DC  1B        .db $1B
  $91DD  0B        .db $0B
  $91DE  08        PHP
  $91DF  08        PHP
  $91E0  FE FF FF  INC $FFFF,X
  $91E3  FF        .db $FF
  $91E4  FF        .db $FF
  $91E5  9F        .db $9F
  $91E6  FF        .db $FF
  $91E7  FF        .db $FF
  $91E8  07        .db $07
  $91E9  01 04     ORA ($04,X)
  $91EB  0E 8E 6E  ASL $6E8E
  $91EE  60        RTS
  $91EF  00        BRK
  $91F0  1F        .db $1F
  $91F1  01 80     ORA ($80,X)
  $91F3  80        .db $80
  $91F4  C0 C1     CPY #$C1
  $91F6  C7        .db $C7
  $91F7  CF        .db $CF
  $91F8  E0 FE     CPX #$FE
  $91FA  FF        .db $FF
  $91FB  FF        .db $FF
  $91FC  7F        .db $7F
  $91FD  7E 78 70  ROR $7078,X
  $9200  01 82     ORA ($82,X)
  $9202  FC        .db $FC
  $9203  10 10     BPL $9215
  $9205  E0 F0     CPX #$F0
  $9207  88        DEY
  $9208  FE 7C 00  INC $007C,X
  $920B  E0 E0     CPX #$E0
  $920D  00        BRK
  $920E  00        BRK
  $920F  70 9F     BVS $91B0
  $9211  AF        .db $AF
  $9212  57        .db $57
  $9213  63        .db $63
  $9214  99 30 00  STA $0030,Y
  $9217  FF        .db $FF
  $9218  64        .db $64
  $9219  74        .db $74
  $921A  3A        .db $3A
  $921B  1D 7E FF  ORA $FF7E,X
  $921E  FF        .db $FF
  $921F  00        BRK
  $9220  FF        .db $FF
  $9221  FF        .db $FF
  $9222  FF        .db $FF
  $9223  FF        .db $FF
  $9224  FC        .db $FC
  $9225  7F        .db $7F
  $9226  20 E0 30  JSR $30E0
  $9229  38        SEC
  $922A  38        SEC
  $922B  83        .db $83
  $922C  7F        .db $7F
  $922D  80        .db $80
  $922E  C0 00     CPY #$00
  $9230  33        .db $33
  $9231  67        .db $67
  $9232  A7        .db $A7

L_9233:
  $9233  2F        .db $2F
  $9234  2F        .db $2F
  $9235  7F        .db $7F
  $9236  FF        .db $FF
  $9237  FF        .db $FF
  $9238  CE 9C 1C  DEC $1C9C
  $923B  18        CLC
  $923C  18        CLC
  $923D  08        PHP
  $923E  08        PHP
  $923F  09 00     ORA #$00
  $9241  00        BRK
  $9242  00        BRK
  $9243  00        BRK
  $9244  00        BRK
  $9245  00        BRK
  $9246  62        .db $62
  $9247  20 00 00  JSR $0000
  $924A  00        BRK
  $924B  00        BRK
  $924C  00        BRK
  $924D  0C        .db $0C
  $924E  FE A4 06  INC $06A4,X
  $9251  0F        .db $0F
  $9252  0E 0E 0E  ASL $0E0E
  $9255  07        .db $07
  $9256  01 00     ORA ($00,X)
  $9258  06 0F     ASL $0F
  $925A  0E 0E 0E  ASL $0E0E
  $925D  07        .db $07
  $925E  01 00     ORA ($00,X)
  $9260  98        TYA
  $9261  FC        .db $FC
  $9262  FE FE FC  INC $FCFE,X
  $9265  F8        SED
  $9266  C0 00     CPY #$00
  $9268  98        TYA
  $9269  FC        .db $FC
  $926A  FE FE FC  INC $FCFE,X
  $926D  F8        SED
  $926E  C0 00     CPY #$00
  $9270  00        BRK
  $9271  00        BRK
  $9272  00        BRK
  $9273  00        BRK
  $9274  00        BRK
  $9275  07        .db $07
  $9276  18        CLC
  $9277  2E 00 00  ROL $0000
  $927A  00        BRK
  $927B  00        BRK
  $927C  00        BRK
  $927D  00        BRK
  $927E  07        .db $07
  $927F  1F        .db $1F
  $9280  00        BRK
  $9281  00        BRK
  $9282  00        BRK
  $9283  00        BRK
  $9284  00        BRK
  $9285  E0 18     CPX #$18
  $9287  04        .db $04
  $9288  00        BRK
  $9289  00        BRK
  $928A  00        BRK
  $928B  00        BRK
  $928C  00        BRK
  $928D  00        BRK
  $928E  E0 F8     CPX #$F8
  $9290  2E 2C 42  ROL $422C
  $9293  77        .db $77
  $9294  42        .db $42
  $9295  40        RTI
  $9296  80        .db $80
  $9297  FF        .db $FF
  $9298  1F        .db $1F
  $9299  1F        .db $1F
  $929A  3D 08 3D  AND $3D08,X
  $929D  3F        .db $3F
  $929E  7F        .db $7F
  $929F  00        BRK
  $92A0  01 01     ORA ($01,X)
  $92A2  00        BRK
  $92A3  7F        .db $7F
  $92A4  00        BRK
  $92A5  00        BRK
  $92A6  00        BRK
  $92A7  FF        .db $FF
  $92A8  FE FE FF  INC $FFFE,X
  $92AB  80        .db $80
  $92AC  FF        .db $FF
  $92AD  FF        .db $FF
  $92AE  FF        .db $FF
  $92AF  00        BRK
  $92B0  00        BRK
  $92B1  00        BRK
  $92B2  80        .db $80
  $92B3  80        .db $80
  $92B4  80        .db $80
  $92B5  80        .db $80
  $92B6  40        RTI
  $92B7  C0 00     CPY #$00
  $92B9  00        BRK
  $92BA  00        BRK
  $92BB  00        BRK
  $92BC  00        BRK
  $92BD  00        BRK
  $92BE  80        .db $80
  $92BF  00        BRK
  $92C0  00        BRK
  $92C1  00        BRK
  $92C2  07        .db $07
  $92C3  18        CLC
  $92C4  2E 5C 58  ROL $585C
  $92C7  84 00     STY $00
  $92C9  00        BRK
  $92CA  00        BRK
  $92CB  07        .db $07
  $92CC  1F        .db $1F
  $92CD  3F        .db $3F
  $92CE  3F        .db $3F
  $92CF  7B        .db $7B
  $92D0  00        BRK
  $92D1  00        BRK
  $92D2  E0 18     CPX #$18
  $92D4  04        .db $04
  $92D5  02        .db $02
  $92D6  02        .db $02
  $92D7  01 00     ORA ($00,X)
  $92D9  00        BRK
  $92DA  00        BRK
  $92DB  E0 F8     CPX #$F8
  $92DD  FC        .db $FC
  $92DE  FC        .db $FC
  $92DF  FE 77 42  INC $4277,X
  $92E2  40        RTI
  $92E3  80        .db $80
  $92E4  FF        .db $FF
  $92E5  2B        .db $2B
  $92E6  40        RTI
  $92E7  7F        .db $7F
  $92E8  08        PHP
  $92E9  3D 3F 7F  AND $7F3F,X
  $92EC  00        BRK
  $92ED  1C        .db $1C

L_92EE:
  $92EE  3F        .db $3F
  $92EF  00        BRK
  $92F0  7F        .db $7F
  $92F1  00        BRK
  $92F2  00        BRK
  $92F3  00        BRK
  $92F4  FF        .db $FF
  $92F5  E6 C0     INC $C0
  $92F7  FF        .db $FF
  $92F8  80        .db $80
  $92F9  FF        .db $FF
  $92FA  FF        .db $FF
  $92FB  FF        .db $FF
  $92FC  00        BRK
  $92FD  1F        .db $1F
  $92FE  3F        .db $3F
  $92FF  00        BRK
  $9300  07        .db $07
  $9301  0C        .db $0C
  $9302  18        CLC
  $9303  30 60     BMI $9365
  $9305  00        BRK
  $9306  00        BRK
  $9307  00        BRK
  $9308  00        BRK
  $9309  03        .db $03
  $930A  07        .db $07
  $930B  0F        .db $0F
  $930C  1F        .db $1F
  $930D  3F        .db $3F
  $930E  1F        .db $1F
  $930F  0F        .db $0F
  $9310  C7        .db $C7
  $9311  FF        .db $FF
  $9312  3F        .db $3F
  $9313  3F        .db $3F
  $9314  7F        .db $7F
  $9315  7F        .db $7F
  $9316  FF        .db $FF
  $9317  FF        .db $FF
  $9318  00        BRK
  $9319  06 C8     ASL $C8
  $931B  C0 80     CPY #$80
  $931D  8C 1E 19  STY $191E
  $9320  E3        .db $E3
  $9321  FF        .db $FF
  $9322  FC        .db $FC
  $9323  FC        .db $FC
  $9324  FE FE FF  INC $FFFE,X
  $9327  FF        .db $FF
  $9328  00        BRK
  $9329  00        BRK
  $932A  03        .db $03
  $932B  03        .db $03
  $932C  01 31     ORA ($31,X)
  $932E  78        SEI
  $932F  98        TYA
  $9330  00        BRK
  $9331  01 03     ORA ($03,X)
  $9333  06 1C     ASL $1C
  $9335  30 00     BMI $9337

L_9337:
  $9337  00        BRK
  $9338  0F        .db $0F
  $9339  0E 1C 19  ASL $191C
  $933C  23        .db $23
  $933D  0F        .db $0F
  $933E  01 00     ORA ($00,X)
  $9340  FF        .db $FF
  $9341  FF        .db $FF
  $9342  7E 38 17  ROR $1738,X
  $9345  10 2F     BPL $9376
  $9347  61 19     ADC ($19,X)
  $9349  0E 80 C0  ASL $C080
  $934C  E0 E0     CPX #$E0
  $934E  D0 9E     BNE $92EE
  $9350  C1 81     CMP ($81,X)
  $9352  01 01     ORA ($01,X)
  $9354  00        BRK
  $9355  00        BRK
  $9356  00        BRK
  $9357  00        BRK
  $9358  3E 7E 06  ROL $067E,X
  $935B  02        .db $02
  $935C  00        BRK
  $935D  00        BRK
  $935E  00        BRK
  $935F  00        BRK
  $9360  00        BRK
  $9361  00        BRK
  $9362  00        BRK
  $9363  03        .db $03
  $9364  07        .db $07

L_9365:
  $9365  0F        .db $0F
  $9366  0F        .db $0F
  $9367  0F        .db $0F
  $9368  00        BRK
  $9369  00        BRK
  $936A  00        BRK
  $936B  00        BRK
  $936C  00        BRK
  $936D  00        BRK
  $936E  00        BRK
  $936F  00        BRK
  $9370  07        .db $07
  $9371  1F        .db $1F
  $9372  FF        .db $FF
  $9373  FF        .db $FF
  $9374  FF        .db $FF
  $9375  FF        .db $FF

L_9376:
  $9376  FF        .db $FF
  $9377  FF        .db $FF
  $9378  00        BRK
  $9379  06 08     ASL $08
  $937B  00        BRK
  $937C  00        BRK
  $937D  0C        .db $0C
  $937E  0E 19 E0  ASL $E019
  $9381  F8        SED
  $9382  FF        .db $FF
  $9383  FF        .db $FF
  $9384  FF        .db $FF
  $9385  FF        .db $FF
  $9386  FF        .db $FF
  $9387  FF        .db $FF
  $9388  00        BRK
  $9389  00        BRK
  $938A  00        BRK
  $938B  00        BRK
  $938C  00        BRK
  $938D  30 70     BMI $93FF
  $938F  98        TYA
  $9390  0F        .db $0F
  $9391  07        .db $07
  $9392  07        .db $07
  $9393  03        .db $03
  $9394  03        .db $03
  $9395  03        .db $03
  $9396  01 01     ORA ($01,X)
  $9398  00        BRK
  $9399  00        BRK
  $939A  00        BRK
  $939B  00        BRK
  $939C  00        BRK
  $939D  00        BRK
  $939E  00        BRK
  $939F  00        BRK
  $93A0  FF        .db $FF
  $93A1  BF        .db $BF
  $93A2  3E 38 37  ROL $3738,X
  $93A5  10 1F     BPL $93C6
  $93A7  11 19     ORA ($19),Y
  $93A9  4E C0 C0  LSR $C0C0
  $93AC  C0 E0     CPY #$E0
  $93AE  E0 6E     CPX #$6E
  $93B0  09 08     ORA #$08
  $93B2  00        BRK
  $93B3  00        BRK
  $93B4  00        BRK
  $93B5  00        BRK
  $93B6  00        BRK
  $93B7  00        BRK
  $93B8  36 11     ROL $11,X
  $93BA  00        BRK
  $93BB  00        BRK
  $93BC  00        BRK
  $93BD  00        BRK
  $93BE  00        BRK
  $93BF  00        BRK
  $93C0  00        BRK
  $93C1  00        BRK
  $93C2  00        BRK
  $93C3  00        BRK
  $93C4  00        BRK
  $93C5  00        BRK

L_93C6:
  $93C6  01 01     ORA ($01,X)
  $93C8  00        BRK
  $93C9  00        BRK
  $93CA  00        BRK
  $93CB  00        BRK
  $93CC  00        BRK
  $93CD  00        BRK
  $93CE  00        BRK
  $93CF  00        BRK
  $93D0  07        .db $07
  $93D1  1F        .db $1F
  $93D2  3F        .db $3F
  $93D3  3F        .db $3F
  $93D4  7F        .db $7F
  $93D5  FF        .db $FF
  $93D6  FF        .db $FF
  $93D7  FF        .db $FF
  $93D8  00        BRK
  $93D9  06 08     ASL $08
  $93DB  00        BRK
  $93DC  00        BRK
  $93DD  0C        .db $0C
  $93DE  0E 09 E0  ASL $E009
  $93E1  F8        SED
  $93E2  FC        .db $FC
  $93E3  FC        .db $FC
  $93E4  FE FF FF  INC $FFFF,X
  $93E7  FF        .db $FF
  $93E8  00        BRK
  $93E9  00        BRK
  $93EA  00        BRK
  $93EB  00        BRK
  $93EC  00        BRK
  $93ED  30 70     BMI $945F
  $93EF  90 01     BCC $93F2
  $93F1  01 01     ORA ($01,X)
  $93F3  00        BRK
  $93F4  00        BRK
  $93F5  00        BRK
  $93F6  00        BRK
  $93F7  00        BRK
  $93F8  00        BRK
  $93F9  00        BRK
  $93FA  00        BRK
  $93FB  00        BRK
  $93FC  00        BRK
  $93FD  00        BRK
  $93FE  00        BRK

L_93FF:
  $93FF  00        BRK
  $9400  FF        .db $FF
  $9401  FF        .db $FF
  $9402  FE F8 FF  INC $FFF8,X
  $9405  7C        .db $7C
  $9406  7F        .db $7F
  $9407  3C        .db $3C
  $9408  09 06     ORA #$06
  $940A  00        BRK
  $940B  00        BRK
  $940C  00        BRK
  $940D  00        BRK
  $940E  00        BRK
  $940F  03        .db $03
  $9410  1C        .db $1C
  $9411  06 02     ASL $02
  $9413  00        BRK
  $9414  00        BRK
  $9415  00        BRK
  $9416  00        BRK
  $9417  00        BRK
  $9418  03        .db $03
  $9419  00        BRK
  $941A  00        BRK
  $941B  00        BRK
  $941C  00        BRK
  $941D  00        BRK
  $941E  00        BRK
  $941F  00        BRK
  $9420  00        BRK
  $9421  08        PHP
  $9422  1C        .db $1C
  $9423  1F        .db $1F
  $9424  0F        .db $0F
  $9425  03        .db $03
  $9426  03        .db $03
  $9427  03        .db $03
  $9428  00        BRK
  $9429  00        BRK
  $942A  08        PHP
  $942B  0C        .db $0C
  $942C  03        .db $03
  $942D  00        BRK
  $942E  01 01     ORA ($01,X)
  $9430  07        .db $07
  $9431  1F        .db $1F
  $9432  3F        .db $3F
  $9433  7F        .db $7F
  $9434  7F        .db $7F
  $9435  FF        .db $FF
  $9436  FF        .db $FF
  $9437  FF        .db $FF
  $9438  00        BRK
  $9439  00        BRK
  $943A  07        .db $07
  $943B  0F        .db $0F
  $943C  1C        .db $1C
  $943D  18        CLC
  $943E  10 00     BPL $9440

L_9440:
  $9440  E0 F8     CPX #$F8
  $9442  FC        .db $FC
  $9443  FE FE FF  INC $FFFE,X
  $9446  FF        .db $FF
  $9447  FF        .db $FF
  $9448  00        BRK
  $9449  00        BRK
  $944A  00        BRK
  $944B  00        BRK
  $944C  00        BRK
  $944D  00        BRK
  $944E  00        BRK
  $944F  00        BRK
  $9450  00        BRK
  $9451  08        PHP
  $9452  1C        .db $1C
  $9453  1F        .db $1F
  $9454  0F        .db $0F
  $9455  03        .db $03
  $9456  07        .db $07
  $9457  1F        .db $1F
  $9458  00        BRK
  $9459  00        BRK
  $945A  08        PHP
  $945B  0C        .db $0C
  $945C  03        .db $03
  $945D  00        BRK
  $945E  01 01     ORA ($01,X)
  $9460  00        BRK
  $9461  00        BRK
  $9462  18        CLC
  $9463  7E 81 FF  ROR $FF81,X
  $9466  00        BRK
  $9467  00        BRK
  $9468  00        BRK
  $9469  00        BRK
  $946A  18        CLC
  $946B  7E 81 FF  ROR $FF81,X
  $946E  00        BRK
  $946F  00        BRK
  $9470  00        BRK
  $9471  00        BRK
  $9472  18        CLC
  $9473  7E 00 3C  ROR $3C00,X
  $9476  00        BRK
  $9477  00        BRK
  $9478  00        BRK
  $9479  00        BRK
  $947A  18        CLC
  $947B  7E 00 3C  ROR $3C00,X
  $947E  00        BRK
  $947F  00        BRK
  $9480  00        BRK
  $9481  00        BRK
  $9482  00        BRK
  $9483  00        BRK
  $9484  00        BRK
  $9485  00        BRK
  $9486  00        BRK
  $9487  00        BRK
  $9488  00        BRK
  $9489  00        BRK
  $948A  00        BRK
  $948B  00        BRK
  $948C  00        BRK
  $948D  00        BRK
  $948E  10 60     BPL $94F0
  $9490  00        BRK
  $9491  00        BRK
  $9492  00        BRK
  $9493  00        BRK
  $9494  00        BRK
  $9495  00        BRK
  $9496  00        BRK
  $9497  00        BRK
  $9498  04        .db $04
  $9499  08        PHP
  $949A  38        SEC
  $949B  31 61     AND ($61),Y
  $949D  C1 03     CMP ($03,X)
  $949F  01 00     ORA ($00,X)
  $94A1  00        BRK
  $94A2  00        BRK
  $94A3  00        BRK
  $94A4  00        BRK
  $94A5  00        BRK
  $94A6  00        BRK
  $94A7  00        BRK
  $94A8  00        BRK
  $94A9  00        BRK
  $94AA  A0 A0     LDY #$A0
  $94AC  60        RTS
  $94AD  40        RTI
  $94AE  C0 80     CPY #$80
  $94B0  00        BRK
  $94B1  00        BRK
  $94B2  00        BRK
  $94B3  00        BRK
  $94B4  00        BRK
  $94B5  00        BRK
  $94B6  00        BRK
  $94B7  00        BRK
  $94B8  00        BRK
  $94B9  00        BRK
  $94BA  00        BRK
  $94BB  00        BRK
  $94BC  00        BRK
  $94BD  00        BRK
  $94BE  00        BRK
  $94BF  00        BRK
  $94C0  00        BRK
  $94C1  FF        .db $FF
  $94C2  00        BRK
  $94C3  55 FF     EOR $FF,X
  $94C5  FF        .db $FF
  $94C6  FF        .db $FF
  $94C7  FF        .db $FF
  $94C8  00        BRK
  $94C9  FF        .db $FF
  $94CA  FF        .db $FF
  $94CB  AA        TAX
  $94CC  00        BRK
  $94CD  00        BRK
  $94CE  00        BRK
  $94CF  00        BRK
  $94D0  00        BRK
  $94D1  FF        .db $FF
  $94D2  00        BRK
  $94D3  55 FF     EOR $FF,X
  $94D5  FF        .db $FF
  $94D6  FF        .db $FF
  $94D7  FF        .db $FF
  $94D8  00        BRK
  $94D9  FF        .db $FF
  $94DA  FF        .db $FF
  $94DB  AA        TAX
  $94DC  00        BRK
  $94DD  00        BRK
  $94DE  00        BRK
  $94DF  00        BRK
  $94E0  FF        .db $FF
  $94E1  AA        TAX
  $94E2  00        BRK
  $94E3  00        BRK
  $94E4  AA        TAX
  $94E5  FF        .db $FF
  $94E6  FF        .db $FF
  $94E7  00        BRK
  $94E8  00        BRK
  $94E9  55 FF     EOR $FF,X
  $94EB  FF        .db $FF
  $94EC  FF        .db $FF
  $94ED  FF        .db $FF
  $94EE  FF        .db $FF
  $94EF  00        BRK

L_94F0:
  $94F0  FF        .db $FF
  $94F1  AA        TAX
  $94F2  00        BRK
  $94F3  00        BRK
  $94F4  AA        TAX
  $94F5  FF        .db $FF
  $94F6  FF        .db $FF
  $94F7  00        BRK
  $94F8  00        BRK
  $94F9  55 FF     EOR $FF,X
  $94FB  FF        .db $FF
  $94FC  FF        .db $FF
  $94FD  FF        .db $FF
  $94FE  FF        .db $FF
  $94FF  00        BRK
  $9500  00        BRK
  $9501  80        .db $80
  $9502  E0 F0     CPX #$F0
  $9504  F8        SED
  $9505  FC        .db $FC
  $9506  FC        .db $FC
  $9507  FE 00 00  INC $0000,X
  $950A  80        .db $80
  $950B  E0 F0     CPX #$F0
  $950D  F8        SED
  $950E  F8        SED
  $950F  FC        .db $FC
  $9510  3F        .db $3F
  $9511  3B        .db $3B
  $9512  3F        .db $3F
  $9513  1F        .db $1F
  $9514  17        .db $17
  $9515  17        .db $17
  $9516  17        .db $17
  $9517  2F        .db $2F
  $9518  17        .db $17
  $9519  17        .db $17
  $951A  13        .db $13
  $951B  08        PHP
  $951C  08        PHP
  $951D  08        PHP

L_951E:
  $951E  08        PHP
  $951F  10 FD     BPL $951E
  $9521  FE FF FF  INC $FFFF,X
  $9524  FF        .db $FF
  $9525  FF        .db $FF
  $9526  FE FE C3  INC $C3FE,X
  $9529  81 00     STA ($00,X)
  $952B  00        BRK
  $952C  00        BRK
  $952D  00        BRK
  $952E  01 01     ORA ($01,X)
  $9530  FE FE 7E  INC $7EFE,X
  $9533  64        .db $64
  $9534  62        .db $62
  $9535  4A        LSR
  $9536  DA        .db $DA
  $9537  94 FC     STY $FC,X
  $9539  FC        .db $FC
  $953A  FC        .db $FC

L_953B:
  $953B  F8        SED
  $953C  FC        .db $FC
  $953D  F4        .db $F4
  $953E  E4 E8     CPX $E8
  $9540  2F        .db $2F
  $9541  2F        .db $2F
  $9542  77        .db $77
  $9543  FF        .db $FF
  $9544  FF        .db $FF
  $9545  7F        .db $7F
  $9546  1F        .db $1F
  $9547  00        BRK
  $9548  10 10     BPL $955A
  $954A  08        PHP
  $954B  07        .db $07
  $954C  00        BRK
  $954D  00        BRK
  $954E  00        BRK
  $954F  00        BRK
  $9550  FD FD FD  SBC $FDFD,X
  $9553  FD FE FF  SBC $FFFE,X
  $9556  FF        .db $FF
  $9557  00        BRK
  $9558  03        .db $03
  $9559  03        .db $03

L_955A:
  $955A  7B        .db $7B
  $955B  83        .db $83
  $955C  01 00     ORA ($00,X)
  $955E  00        BRK
  $955F  00        BRK
  $9560  94 C8     STY $C8,X
  $9562  FE FF FF  INC $FFFF,X
  $9565  FE F8 00  INC $00F8,X
  $9568  E8        INX
  $9569  B0 D0     BCS $953B
  $956B  E0 C0     CPX #$C0
  $956D  00        BRK
  $956E  00        BRK
  $956F  00        BRK
  $9570  00        BRK
  $9571  00        BRK
  $9572  00        BRK
  $9573  00        BRK
  $9574  01 03     ORA ($03,X)
  $9576  05 0F     ORA $0F
  $9578  00        BRK
  $9579  00        BRK
  $957A  00        BRK
  $957B  00        BRK
  $957C  00        BRK
  $957D  01 02     ORA ($02,X)
  $957F  04        .db $04
  $9580  00        BRK
  $9581  00        BRK
  $9582  0F        .db $0F
  $9583  7F        .db $7F
  $9584  FF        .db $FF
  $9585  FF        .db $FF
  $9586  FF        .db $FF
  $9587  FF        .db $FF
  $9588  00        BRK
  $9589  00        BRK
  $958A  00        BRK
  $958B  0F        .db $0F
  $958C  3F        .db $3F
  $958D  7F        .db $7F
  $958E  7F        .db $7F
  $958F  FF        .db $FF
  $9590  00        BRK
  $9591  00        BRK

L_9592:
  $9592  F0 FE     BEQ $9592
  $9594  E7        .db $E7
  $9595  E3        .db $E3
  $9596  F3        .db $F3
  $9597  FF        .db $FF
  $9598  00        BRK
  $9599  00        BRK
  $959A  00        BRK
  $959B  C0 98     CPY #$98
  $959D  BD BD D9  LDA $D9BD,X
  $95A0  00        BRK
  $95A1  00        BRK
  $95A2  00        BRK
  $95A3  00        BRK
  $95A4  80        .db $80
  $95A5  C0 E0     CPY #$E0
  $95A7  E0 00     CPX #$00
  $95A9  00        BRK
  $95AA  00        BRK
  $95AB  00        BRK
  $95AC  00        BRK
  $95AD  80        .db $80
  $95AE  C0 C0     CPY #$C0
  $95B0  0F        .db $0F
  $95B1  1F        .db $1F
  $95B2  1F        .db $1F
  $95B3  1F        .db $1F
  $95B4  3F        .db $3F
  $95B5  3F        .db $3F
  $95B6  3F        .db $3F
  $95B7  3F        .db $3F
  $95B8  01 07     ORA ($07,X)
  $95BA  0F        .db $0F
  $95BB  0F        .db $0F
  $95BC  1F        .db $1F
  $95BD  1F        .db $1F
  $95BE  1F        .db $1F
  $95BF  1F        .db $1F
  $95C0  FF        .db $FF
  $95C1  FF        .db $FF
  $95C2  FF        .db $FF
  $95C3  FF        .db $FF
  $95C4  FF        .db $FF
  $95C5  FF        .db $FF
  $95C6  EF        .db $EF
  $95C7  C7        .db $C7
  $95C8  FF        .db $FF
  $95C9  FF        .db $FF
  $95CA  FF        .db $FF
  $95CB  FF        .db $FF
  $95CC  FF        .db $FF
  $95CD  83        .db $83
  $95CE  19 3D FF  ORA $FF3D,Y
  $95D1  FF        .db $FF
  $95D2  FF        .db $FF
  $95D3  FF        .db $FF
  $95D4  FF        .db $FF
  $95D5  FF        .db $FF
  $95D6  FF        .db $FF
  $95D7  FF        .db $FF
  $95D8  E3        .db $E3
  $95D9  FF        .db $FF

L_95DA:
  $95DA  FF        .db $FF
  $95DB  FF        .db $FF

L_95DC:
  $95DC  FF        .db $FF
  $95DD  FF        .db $FF
  $95DE  FF        .db $FF
  $95DF  FF        .db $FF
  $95E0  F0 F8     BEQ $95DA
  $95E2  F8        SED
  $95E3  F8        SED
  $95E4  FC        .db $FC
  $95E5  FC        .db $FC
  $95E6  FC        .db $FC
  $95E7  F4        .db $F4
  $95E8  E0 F0     CPX #$F0
  $95EA  F0 F0     BEQ $95DC
  $95EC  F8        SED
  $95ED  E0 C8     CPX #$C8
  $95EF  C8        INY
  $95F0  00        BRK
  $95F1  00        BRK
  $95F2  00        BRK
  $95F3  00        BRK
  $95F4  00        BRK
  $95F5  00        BRK
  $95F6  00        BRK
  $95F7  00        BRK
  $95F8  00        BRK
  $95F9  00        BRK
  $95FA  00        BRK
  $95FB  00        BRK
  $95FC  00        BRK
  $95FD  00        BRK
  $95FE  00        BRK
  $95FF  00        BRK
  $9600  07        .db $07
  $9601  1F        .db $1F
  $9602  1F        .db $1F
  $9603  35 15     AND $15,X
  $9605  0A        ASL
  $9606  00        BRK
  $9607  3F        .db $3F
  $9608  08        PHP
  $9609  00        BRK
  $960A  20 0A 2A  JSR $2A0A
  $960D  15 0F     ORA $0F,X
  $960F  03        .db $03
  $9610  8F        .db $8F
  $9611  FF        .db $FF
  $9612  FF        .db $FF
  $9613  FC        .db $FC
  $9614  F3        .db $F3
  $9615  C7        .db $C7
  $9616  1F        .db $1F
  $9617  FF        .db $FF
  $9618  50 00     BVC $961A

L_961A:
  $961A  00        BRK
  $961B  03        .db $03
  $961C  0F        .db $0F
  $961D  3F        .db $3F
  $961E  FC        .db $FC
  $961F  E0 80     CPX #$80
  $9621  E0 F8     CPX #$F8
  $9623  78        SEI
  $9624  3C        .db $3C
  $9625  9C        .db $9C
  $9626  18        CLC
  $9627  90 40     BCC $9669
  $9629  10 00     BPL $962B

L_962B:
  $962B  84 42     STY $42
  $962D  A2 87     LDX #$87
  $962F  4F        .db $4F
  $9630  0C        .db $0C
  $9631  08        PHP
  $9632  03        .db $03
  $9633  06 0D     ASL $0D
  $9635  0D 0D 1F  ORA $1F0D
  $9638  03        .db $03
  $9639  04        .db $04
  $963A  07        .db $07
  $963B  02        .db $02
  $963C  00        BRK
  $963D  04        .db $04
  $963E  06 03     ASL $03
  $9640  FF        .db $FF
  $9641  30 73     BMI $96B6
  $9643  AD 26 26  LDA $2626
  $9646  FD EF 38  SBC $38EF,X
  $9649  7C        .db $7C
  $964A  73        .db $73
  $964B  21 20     AND ($20,X)
  $964D  20 63 EE  JSR $EE63
  $9650  32        .db $32
  $9651  02        .db $02
  $9652  C6 C7     DEC $C7
  $9654  CE 9E 3A  DEC $3A9E
  $9657  F8        SED
  $9658  C9 31     CMP #$31
  $965A  C1 C1     CMP ($C1,X)
  $965C  C2        .db $C2
  $965D  82        .db $82
  $965E  02        .db $02

L_965F:
  $965F  00        BRK
  $9660  00        BRK
  $9661  00        BRK

L_9662:
  $9662  C0 40     CPY #$40
  $9664  40        RTI
  $9665  80        .db $80
  $9666  80        .db $80
  $9667  00        BRK
  $9668  F0 F8     BEQ $9662
  $966A  D8        CLD
  $966B  4C 4C 8C  JMP $8C4C
  $966E  8C 1C 3F  STY $3F1C
  $9671  7E 7F FF  ROR $FF7F,X
  $9674  FF        .db $FF
  $9675  FF        .db $FF
  $9676  FF        .db $FF
  $9677  7F        .db $7F
  $9678  00        BRK
  $9679  00        BRK
  $967A  80        .db $80
  $967B  00        BRK
  $967C  00        BRK
  $967D  00        BRK
  $967E  00        BRK
  $967F  80        .db $80
  $9680  9F        .db $9F
  $9681  F3        .db $F3
  $9682  07        .db $07
  $9683  FF        .db $FF
  $9684  1F        .db $1F
  $9685  3F        .db $3F
  $9686  FF        .db $FF

L_9687:
  $9687  FF        .db $FF
  $9688  80        .db $80
  $9689  00        BRK
  $968A  08        PHP
  $968B  00        BRK
  $968C  E0 C0     CPX #$C0
  $968E  00        BRK
  $968F  00        BRK
  $9690  E0 F0     CPX #$F0
  $9692  F8        SED
  $9693  E0 F0     CPX #$F0
  $9695  F0 F0     BEQ $9687
  $9697  E0 1C     CPX #$1C
  $9699  0E 07 1F  ASL $1F07
  $969C  0F        .db $0F
  $969D  0F        .db $0F
  $969E  0F        .db $0F
  $969F  1F        .db $1F
  $96A0  00        BRK
  $96A1  00        BRK
  $96A2  00        BRK
  $96A3  60        RTS
  $96A4  38        SEC
  $96A5  0C        .db $0C
  $96A6  08        PHP
  $96A7  02        .db $02
  $96A8  18        CLC
  $96A9  78        SEI
  $96AA  10 00     BPL $96AC

L_96AC:
  $96AC  80        .db $80
  $96AD  B0 B0     BCS $965F

L_96AF:
  $96AF  B0 7F     BCS $9730
  $96B1  3F        .db $3F
  $96B2  17        .db $17
  $96B3  45 60     EOR $60
  $96B5  F0 F8     BEQ $96AF
  $96B7  7E 00 40  ROR $4000,X
  $96BA  28        PLP
  $96BB  1A        .db $1A
  $96BC  87        .db $87
  $96BD  08        PHP
  $96BE  07        .db $07
  $96BF  81 FF     STA ($FF,X)
  $96C1  FF        .db $FF
  $96C2  FF        .db $FF
  $96C3  FF        .db $FF
  $96C4  FC        .db $FC
  $96C5  00        BRK
  $96C6  00        BRK
  $96C7  00        BRK
  $96C8  00        BRK
  $96C9  00        BRK
  $96CA  00        BRK
  $96CB  00        BRK
  $96CC  03        .db $03
  $96CD  FF        .db $FF
  $96CE  00        BRK
  $96CF  FF        .db $FF
  $96D0  E0 C0     CPX #$C0
  $96D2  00        BRK
  $96D3  00        BRK
  $96D4  00        BRK
  $96D5  00        BRK
  $96D6  1E 00 1F  ASL $1F00,X
  $96D9  3F        .db $3F
  $96DA  FE FD F3  INC $F3FD,X
  $96DD  8F        .db $8F
  $96DE  21 FF     AND ($FF,X)
  $96E0  0F        .db $0F
  $96E1  18        CLC
  $96E2  30 07     BMI $96EB
  $96E4  0F        .db $0F
  $96E5  03        .db $03
  $96E6  06 0E     ASL $0E
  $96E8  60        RTS
  $96E9  66 C9     ROR $C9

L_96EB:
  $96EB  E0 90     CPX #$90
  $96ED  AC 39 71  LDY $7139
  $96F0  00        BRK
  $96F1  00        BRK
  $96F2  00        BRK
  $96F3  00        BRK
  $96F4  00        BRK
  $96F5  00        BRK
  $96F6  00        BRK
  $96F7  00        BRK
  $96F8  00        BRK
  $96F9  00        BRK
  $96FA  00        BRK
  $96FB  10 08     BPL $9705
  $96FD  0C        .db $0C
  $96FE  04        .db $04
  $96FF  04        .db $04
  $9700  00        BRK
  $9701  01 06     ORA ($06,X)
  $9703  09 13     ORA #$13

L_9705:
  $9705  27        .db $27
  $9706  26 45     ROL $45
  $9708  00        BRK
  $9709  01 06     ORA ($06,X)
  $970B  09 13     ORA #$13
  $970D  27        .db $27
  $970E  26 44     ROL $44
  $9710  7E 81 00  ROR $0081,X
  $9713  C0 E6     CPY #$E6
  $9715  B7        .db $B7
  $9716  4D BF 7E  EOR $7EBF
  $9719  81 00     STA ($00,X)
  $971B  C0 E0     CPY #$E0
  $971D  82        .db $82
  $971E  32        .db $32

L_971F:
  $971F  40        RTI
  $9720  00        BRK
  $9721  80        .db $80
  $9722  60        RTS
  $9723  10 08     BPL $972D
  $9725  04        .db $04
  $9726  04        .db $04
  $9727  82        .db $82
  $9728  00        BRK
  $9729  80        .db $80
  $972A  60        RTS
  $972B  10 08     BPL $9735

L_972D:
  $972D  04        .db $04
  $972E  04        .db $04
  $972F  02        .db $02

L_9730:
  $9730  43        .db $43
  $9731  C2        .db $C2
  $9732  C2        .db $C2
  $9733  E1 72     SBC ($72,X)

L_9735:
  $9735  3F        .db $3F
  $9736  0F        .db $0F
  $9737  03        .db $03
  $9738  41 C1     EOR ($C1,X)
  $973A  C1 60     CMP ($60,X)
  $973C  31 0C     AND ($0C),Y
  $973E  03        .db $03
  $973F  00        BRK
  $9740  CB        .db $CB
  $9741  A2 87     LDX #$87
  $9743  CD 3F FD  CMP $FD3F
  $9746  FF        .db $FF
  $9747  FF        .db $FF
  $9748  85 25     STA $25
  $974A  00        BRK
  $974B  82        .db $82
  $974C  C8        INY
  $974D  02        .db $02
  $974E  FF        .db $FF
  $974F  00        BRK
  $9750  82        .db $82
  $9751  E3        .db $E3
  $9752  E3        .db $E3
  $9753  C7        .db $C7
  $9754  0E 3C F0  ASL $F03C
  $9757  C0 02     CPY #$02
  $9759  03        .db $03
  $975A  03        .db $03
  $975B  06 0C     ASL $0C
  $975D  30 C0     BMI $971F
  $975F  00        BRK
  $9760  00        BRK
  $9761  01 01     ORA ($01,X)
  $9763  01 02     ORA ($02,X)
  $9765  02        .db $02
  $9766  02        .db $02
  $9767  05 00     ORA $00
  $9769  00        BRK
  $976A  00        BRK
  $976B  00        BRK
  $976C  01 01     ORA ($01,X)
  $976E  01 03     ORA ($03,X)
  $9770  FF        .db $FF
  $9771  FF        .db $FF
  $9772  FF        .db $FF
  $9773  7E 7E E7  ROR $E77E,X
  $9776  42        .db $42
  $9777  00        BRK
  $9778  00        BRK
  $9779  18        CLC
  $977A  81 E7     STA ($E7,X)
  $977C  C3        .db $C3
  $977D  81 00     STA ($00,X)
  $977F  00        BRK
  $9780  06 00     ASL $00
  $9782  00        BRK
  $9783  00        BRK
  $9784  00        BRK
  $9785  00        BRK
  $9786  00        BRK
  $9787  00        BRK
  $9788  02        .db $02
  $9789  00        BRK
  $978A  00        BRK
  $978B  00        BRK
  $978C  00        BRK
  $978D  00        BRK
  $978E  00        BRK
  $978F  00        BRK
  $9790  07        .db $07
  $9791  0B        .db $0B
  $9792  0B        .db $0B
  $9793  16 14     ASL $14,X
  $9795  28        PLP
  $9796  30 00     BMI $9798

L_9798:
  $9798  00        BRK
  $9799  06 07     ASL $07
  $979B  0E 0C 18  ASL $180C
  $979E  10 00     BPL $97A0

L_97A0:
  $97A0  FF        .db $FF
  $97A1  C7        .db $C7
  $97A2  FF        .db $FF
  $97A3  CC 4C 4C  CPY $4C4C
  $97A6  68        PLA
  $97A7  68        PLA
  $97A8  81 7E     STA ($7E,X)
  $97AA  00        BRK
  $97AB  7C        .db $7C
  $97AC  3C        .db $3C
  $97AD  3C        .db $3C
  $97AE  38        SEC
  $97AF  38        SEC
  $97B0  E0 F0     CPX #$F0
  $97B2  B0 58     BCS $980C
  $97B4  28        PLP
  $97B5  14        .db $14
  $97B6  0C        .db $0C
  $97B7  00        BRK
  $97B8  00        BRK
  $97B9  60        RTS
  $97BA  E0 70     CPX #$70
  $97BC  30 18     BMI $97D6
  $97BE  08        PHP
  $97BF  00        BRK
  $97C0  28        PLP
  $97C1  20 30 30  JSR $3030
  $97C4  00        BRK
  $97C5  00        BRK
  $97C6  00        BRK
  $97C7  00        BRK
  $97C8  18        CLC
  $97C9  10 10     BPL $97DB
  $97CB  10 00     BPL $97CD

L_97CD:
  $97CD  00        BRK
  $97CE  00        BRK
  $97CF  00        BRK
  $97D0  00        BRK
  $97D1  00        BRK
  $97D2  00        BRK
  $97D3  00        BRK
  $97D4  00        BRK

L_97D5:
  $97D5  00        BRK

L_97D6:
  $97D6  00        BRK
  $97D7  00        BRK
  $97D8  30 58     BMI $9832
  $97DA  78        SEI

L_97DB:
  $97DB  30 00     BMI $97DD

L_97DD:
  $97DD  00        BRK

L_97DE:
  $97DE  00        BRK
  $97DF  00        BRK
  $97E0  30 58     BMI $983A
  $97E2  78        SEI
  $97E3  30 00     BMI $97E5

L_97E5:
  $97E5  00        BRK
  $97E6  00        BRK
  $97E7  00        BRK
  $97E8  30 58     BMI $9842
  $97EA  78        SEI
  $97EB  30 00     BMI $97ED

L_97ED:
  $97ED  00        BRK
  $97EE  00        BRK
  $97EF  00        BRK
  $97F0  00        BRK
  $97F1  00        BRK
  $97F2  00        BRK
  $97F3  00        BRK
  $97F4  00        BRK
  $97F5  00        BRK
  $97F6  00        BRK
  $97F7  00        BRK
  $97F8  00        BRK
  $97F9  00        BRK
  $97FA  00        BRK
  $97FB  00        BRK
  $97FC  00        BRK
  $97FD  00        BRK
  $97FE  00        BRK
  $97FF  00        BRK
  $9800  00        BRK
  $9801  00        BRK
  $9802  00        BRK
  $9803  00        BRK
  $9804  01 02     ORA ($02,X)
  $9806  02        .db $02
  $9807  04        .db $04
  $9808  00        BRK
  $9809  00        BRK
  $980A  00        BRK
  $980B  00        BRK

L_980C:
  $980C  00        BRK
  $980D  01 01     ORA ($01,X)
  $980F  03        .db $03
  $9810  00        BRK
  $9811  00        BRK
  $9812  00        BRK
  $9813  C6 29     DEC $29
  $9815  33        .db $33
  $9816  27        .db $27
  $9817  6F        .db $6F
  $9818  00        BRK
  $9819  00        BRK
  $981A  00        BRK
  $981B  00        BRK
  $981C  C6 CE     DEC $CE
  $981E  DE 9E 04  DEC $049E,X
  $9821  04        .db $04
  $9822  04        .db $04
  $9823  02        .db $02
  $9824  07        .db $07
  $9825  08        PHP
  $9826  13        .db $13
  $9827  34        .db $34
  $9828  03        .db $03
  $9829  03        .db $03
  $982A  03        .db $03
  $982B  01 00     ORA ($00,X)
  $982D  07        .db $07
  $982E  0C        .db $0C
  $982F  08        PHP
  $9830  6E 5E DC  ROR $DC5E
  $9833  DC        .db $DC
  $9834  D8        CLD
  $9835  70 20     BVS $9857
  $9837  90 9C     BCC $97D5
  $9839  BC 38 38  LDY $3838,X
  $983C  30 A0     BMI $97DE
  $983E  C0 60     CPY #$60
  $9840  28        PLP
  $9841  48        PHA

L_9842:
  $9842  56 56     LSR $56,X
  $9844  20 F8 FD  JSR $FDF8
  $9847  7E 00 00  ROR $0000,X
  $984A  00        BRK
  $984B  00        BRK
  $984C  08        PHP
  $984D  5F        .db $5F
  $984E  0E 38 51  ASL $5138
  $9851  56 58     LSR $58,X
  $9853  3C        .db $3C

L_9854:
  $9854  3E 7E BE  ROL $BE7E,X

L_9857:
  $9857  2C 20 21  BIT $2120
  $985A  27        .db $27
  $985B  4B        .db $4B
  $985C  DD 9D 0D  CMP $0D9D,X
  $985F  13        .db $13
  $9860  F8        SED
  $9861  06 79     ASL $79
  $9863  1C        .db $1C
  $9864  04        .db $04
  $9865  03        .db $03
  $9866  07        .db $07
  $9867  0F        .db $0F
  $9868  00        BRK
  $9869  F8        SED
  $986A  FE FF FF  INC $FFFF,X
  $986D  FC        .db $FC
  $986E  FB        .db $FB
  $986F  F7        .db $F7
  $9870  00        BRK
  $9871  00        BRK
  $9872  00        BRK
  $9873  80        .db $80
  $9874  80        .db $80
  $9875  C0 A0     CPY #$A0
  $9877  70 00     BVS $9879

L_9879:
  $9879  00        BRK
  $987A  00        BRK
  $987B  00        BRK
  $987C  00        BRK
  $987D  00        BRK
  $987E  C0 E0     CPY #$E0
  $9880  38        SEC
  $9881  00        BRK
  $9882  00        BRK
  $9883  01 03     ORA ($03,X)

L_9885:
  $9885  07        .db $07
  $9886  0B        .db $0B
  $9887  09 00     ORA #$00
  $9889  00        BRK
  $988A  00        BRK
  $988B  00        BRK
  $988C  00        BRK
  $988D  03        .db $03
  $988E  07        .db $07
  $988F  07        .db $07
  $9890  20 60 E0  JSR $E060
  $9893  F0 F0     BEQ $9885
  $9895  F8        SED
  $9896  F7        .db $F7
  $9897  D1 1F     CMP ($1F),Y
  $9899  1F        .db $1F
  $989A  5F        .db $5F
  $989B  CF        .db $CF
  $989C  0F        .db $0F
  $989D  C7        .db $C7
  $989E  A0 A0     LDY #$A0
  $98A0  08        PHP
  $98A1  0F        .db $0F

L_98A2:
  $98A2  0E 1D 7F  ASL $7F1D
  $98A5  FF        .db $FF
  $98A6  7E 3A F7  ROR $F73A,X
  $98A9  F0 F7     BEQ $98A2
  $98AB  EE 80 78  INC $7880
  $98AE  F4        .db $F4
  $98AF  F4        .db $F4
  $98B0  70 70     BVS $9922
  $98B2  D0 A0     BNE $9854
  $98B4  C0 00     CPY #$00
  $98B6  00        BRK
  $98B7  00        BRK
  $98B8  E0 E0     CPX #$E0
  $98BA  60        RTS
  $98BB  40        RTI
  $98BC  00        BRK
  $98BD  00        BRK
  $98BE  00        BRK
  $98BF  00        BRK
  $98C0  07        .db $07
  $98C1  00        BRK
  $98C2  00        BRK
  $98C3  01 06     ORA ($06,X)
  $98C5  08        PHP
  $98C6  1F        .db $1F
  $98C7  1F        .db $1F
  $98C8  00        BRK
  $98C9  00        BRK
  $98CA  00        BRK
  $98CB  00        BRK
  $98CC  01 07     ORA ($07,X)
  $98CE  0F        .db $0F
  $98CF  00        BRK
  $98D0  F8        SED
  $98D1  DC        .db $DC
  $98D2  6F        .db $6F
  $98D3  F5 3C     SBC $3C,X
  $98D5  01 FF     ORA ($FF,X)
  $98D7  FF        .db $FF
  $98D8  00        BRK
  $98D9  60        RTS
  $98DA  30 1B     BMI $98F7
  $98DC  C3        .db $C3
  $98DD  FE FD 00  INC $00FD,X

L_98E0:
  $98E0  FF        .db $FF
  $98E1  1B        .db $1B
  $98E2  0D BE C7  ORA $C7BE
  $98E5  00        BRK
  $98E6  FF        .db $FF
  $98E7  FF        .db $FF
  $98E8  00        BRK
  $98E9  0C        .db $0C
  $98EA  06 03     ASL $03
  $98EC  38        SEC
  $98ED  FF        .db $FF
  $98EE  FF        .db $FF
  $98EF  00        BRK
  $98F0  00        BRK
  $98F1  80        .db $80
  $98F2  E0 B0     CPX #$B0
  $98F4  AC 02 FF  LDY $FF02

L_98F7:
  $98F7  FF        .db $FF
  $98F8  00        BRK
  $98F9  00        BRK

L_98FA:
  $98FA  00        BRK
  $98FB  60        RTS
  $98FC  50 FC     BVC $98FA
  $98FE  FE 00 00  INC $0000,X
  $9901  00        BRK
  $9902  00        BRK
  $9903  00        BRK
  $9904  00        BRK
  $9905  00        BRK
  $9906  01 02     ORA ($02,X)
  $9908  00        BRK
  $9909  00        BRK
  $990A  00        BRK
  $990B  00        BRK
  $990C  00        BRK
  $990D  00        BRK
  $990E  00        BRK
  $990F  01 00     ORA ($00,X)
  $9911  00        BRK
  $9912  00        BRK
  $9913  00        BRK
  $9914  00        BRK
  $9915  C6 29     DEC $29

L_9917:
  $9917  33        .db $33
  $9918  00        BRK
  $9919  00        BRK
  $991A  00        BRK
  $991B  00        BRK
  $991C  00        BRK
  $991D  00        BRK
  $991E  C6 CE     DEC $CE
  $9920  02        .db $02
  $9921  04        .db $04

L_9922:
  $9922  04        .db $04
  $9923  04        .db $04
  $9924  04        .db $04
  $9925  02        .db $02
  $9926  07        .db $07
  $9927  08        PHP
  $9928  01 03     ORA ($03,X)
  $992A  03        .db $03
  $992B  03        .db $03
  $992C  03        .db $03
  $992D  01 00     ORA ($00,X)
  $992F  07        .db $07
  $9930  27        .db $27
  $9931  6F        .db $6F
  $9932  6E 5E DC  ROR $DC5E
  $9935  DC        .db $DC
  $9936  D8        CLD
  $9937  70 DE     BVS $9917
  $9939  9E        .db $9E
  $993A  9C        .db $9C
  $993B  BC 38 38  LDY $3838,X
  $993E  30 A0     BMI $98E0
  $9940  13        .db $13
  $9941  34        .db $34
  $9942  28        PLP
  $9943  48        PHA
  $9944  56 56     LSR $56,X
  $9946  20 B8 0C  JSR $0CB8
  $9949  08        PHP
  $994A  00        BRK
  $994B  00        BRK
  $994C  00        BRK
  $994D  00        BRK
  $994E  08        PHP
  $994F  1F        .db $1F
  $9950  20 90 51  JSR $5190
  $9953  56 58     LSR $58,X
  $9955  3C        .db $3C

L_9956:
  $9956  3E 7E C0  ROL $C07E,X
  $9959  60        RTS
  $995A  20 21 27  JSR $2721
  $995D  4B        .db $4B
  $995E  DD 9D 00  CMP $009D,X
  $9961  00        BRK
  $9962  F8        SED
  $9963  06 79     ASL $79
  $9965  1C        .db $1C
  $9966  04        .db $04
  $9967  03        .db $03
  $9968  00        BRK
  $9969  00        BRK
  $996A  00        BRK
  $996B  F8        SED
  $996C  FE FF FF  INC $FFFF,X
  $996F  FC        .db $FC
  $9970  00        BRK
  $9971  00        BRK
  $9972  00        BRK
  $9973  00        BRK
  $9974  00        BRK
  $9975  80        .db $80
  $9976  80        .db $80
  $9977  C0 00     CPY #$00
  $9979  00        BRK
  $997A  00        BRK
  $997B  00        BRK
  $997C  00        BRK
  $997D  00        BRK
  $997E  00        BRK
  $997F  00        BRK
  $9980  FD 7E 38  SBC $387E,X
  $9983  00        BRK
  $9984  00        BRK
  $9985  03        .db $03
  $9986  07        .db $07
  $9987  0B        .db $0B
  $9988  0E 38 00  ASL $0038
  $998B  00        BRK
  $998C  00        BRK
  $998D  00        BRK
  $998E  03        .db $03
  $998F  07        .db $07
  $9990  BE 2C 20  LDX $202C,Y
  $9993  60        RTS
  $9994  E0 F0     CPX #$F0
  $9996  F0 F9     BEQ $9991
  $9998  0D 13 1F  ORA $1F13
  $999B  1F        .db $1F

L_999C:
  $999C  5F        .db $5F
  $999D  0F        .db $0F
  $999E  CF        .db $CF
  $999F  A6 07     LDX $07
  $99A1  0F        .db $0F
  $99A2  08        PHP
  $99A3  0F        .db $0F
  $99A4  1E 7D FF  ASL $FF7D,X
  $99A7  7F        .db $7F
  $99A8  FB        .db $FB
  $99A9  F7        .db $F7
  $99AA  F7        .db $F7
  $99AB  F0 EF     BEQ $999C
  $99AD  82        .db $82
  $99AE  78        SEI
  $99AF  F4        .db $F4
  $99B0  A0 70     LDY #$70

L_99B2:
  $99B2  70 70     BVS $9A24
  $99B4  D0 A0     BNE $9956
  $99B6  C0 00     CPY #$00
  $99B8  C0 E0     CPY #$E0
  $99BA  E0 E0     CPX #$E0
  $99BC  60        RTS
  $99BD  40        RTI
  $99BE  00        BRK
  $99BF  00        BRK
  $99C0  09 0F     ORA #$0F
  $99C2  00        BRK
  $99C3  01 06     ORA ($06,X)
  $99C5  08        PHP
  $99C6  1F        .db $1F
  $99C7  1F        .db $1F
  $99C8  07        .db $07
  $99C9  00        BRK
  $99CA  00        BRK
  $99CB  00        BRK
  $99CC  01 07     ORA ($07,X)
  $99CE  0F        .db $0F
  $99CF  00        BRK
  $99D0  DF        .db $DF
  $99D1  F0 DF     BEQ $99B2
  $99D3  F5 3C     SBC $3C,X
  $99D5  01 FF     ORA ($FF,X)
  $99D7  FF        .db $FF
  $99D8  A0 00     LDY #$00
  $99DA  60        RTS
  $99DB  1B        .db $1B
  $99DC  C3        .db $C3
  $99DD  FE FD 00  INC $00FD,X
  $99E0  3A        .db $3A
  $99E1  FE 1B BE  INC $BE1B,X
  $99E4  C7        .db $C7
  $99E5  00        BRK
  $99E6  FF        .db $FF
  $99E7  FF        .db $FF
  $99E8  F4        .db $F4
  $99E9  00        BRK
  $99EA  0C        .db $0C
  $99EB  03        .db $03
  $99EC  38        SEC
  $99ED  FF        .db $FF
  $99EE  FF        .db $FF
  $99EF  00        BRK
  $99F0  00        BRK
  $99F1  00        BRK
  $99F2  E0 B0     CPX #$B0
  $99F4  AC 02 FF  LDY $FF02
  $99F7  FF        .db $FF
  $99F8  00        BRK
  $99F9  00        BRK

L_99FA:
  $99FA  00        BRK
  $99FB  60        RTS
  $99FC  50 FC     BVC $99FA
  $99FE  FE 00 00  INC $0000,X
  $9A01  00        BRK
  $9A02  01 02     ORA ($02,X)
  $9A04  07        .db $07

L_9A05:
  $9A05  08        PHP
  $9A06  13        .db $13
  $9A07  34        .db $34
  $9A08  00        BRK
  $9A09  00        BRK
  $9A0A  00        BRK
  $9A0B  01 00     ORA ($00,X)
  $9A0D  07        .db $07
  $9A0E  0C        .db $0C
  $9A0F  08        PHP
  $9A10  77        .db $77
  $9A11  8C 31 EF  STY $EF31
  $9A14  DF        .db $DF
  $9A15  7F        .db $7F
  $9A16  27        .db $27
  $9A17  90 00     BCC $9A19

L_9A19:
  $9A19  73        .db $73
  $9A1A  CF        .db $CF
  $9A1B  1F        .db $1F
  $9A1C  3F        .db $3F
  $9A1D  A7        .db $A7
  $9A1E  C0 60     CPY #$60
  $9A20  E0 10     CPX #$10
  $9A22  F8        SED
  $9A23  F0 E0     BEQ $9A05
  $9A25  C0 00     CPY #$00
  $9A27  00        BRK
  $9A28  00        BRK
  $9A29  E0 F0     CPX #$F0
  $9A2B  E0 C0     CPX #$C0
  $9A2D  00        BRK
  $9A2E  00        BRK
  $9A2F  00        BRK
  $9A30  38        SEC
  $9A31  00        BRK
  $9A32  00        BRK
  $9A33  00        BRK
  $9A34  00        BRK
  $9A35  00        BRK
  $9A36  00        BRK
  $9A37  00        BRK
  $9A38  00        BRK
  $9A39  00        BRK
  $9A3A  00        BRK
  $9A3B  00        BRK
  $9A3C  00        BRK
  $9A3D  00        BRK
  $9A3E  00        BRK
  $9A3F  00        BRK
  $9A40  20 20 20  JSR $2020
  $9A43  30 30     BMI $9A75

L_9A45:
  $9A45  78        SEI
  $9A46  6E CD 1F  ROR $1FCD
  $9A49  1F        .db $1F
  $9A4A  1F        .db $1F
  $9A4B  0F        .db $0F
  $9A4C  0F        .db $0F
  $9A4D  37        .db $37
  $9A4E  31 70     AND ($70),Y
  $9A50  0F        .db $0F
  $9A51  0E 08 07  ASL $0708
  $9A54  07        .db $07
  $9A55  0E 0D F9  ASL $F90D
  $9A58  F7        .db $F7
  $9A59  F7        .db $F7
  $9A5A  F7        .db $F7
  $9A5B  F8        SED
  $9A5C  FB        .db $FB
  $9A5D  F7        .db $F7
  $9A5E  F6 0E     INC $0E,X
  $9A60  70 70     BVS $9AD2
  $9A62  50 20     BVC $9A84
  $9A64  C0 C0     CPY #$C0
  $9A66  80        .db $80
  $9A67  80        .db $80
  $9A68  E0 E0     CPX #$E0
  $9A6A  E0 C0     CPX #$C0
  $9A6C  00        BRK
  $9A6D  00        BRK
  $9A6E  00        BRK
  $9A6F  00        BRK
  $9A70  3E 7F BF  ROL $BF7F,X
  $9A73  9D 7E 1B  STA $1B7E,X
  $9A76  1D 1D 00  ORA $001D,X
  $9A79  3C        .db $3C
  $9A7A  7A        .db $7A
  $9A7B  7A        .db $7A
  $9A7C  00        BRK
  $9A7D  0C        .db $0C
  $9A7E  06 06     ASL $06
  $9A80  07        .db $07
  $9A81  0F        .db $0F
  $9A82  17        .db $17
  $9A83  13        .db $13

L_9A84:
  $9A84  0F        .db $0F
  $9A85  C3        .db $C3
  $9A86  63        .db $63
  $9A87  53        .db $53
  $9A88  00        BRK
  $9A89  07        .db $07
  $9A8A  0F        .db $0F
  $9A8B  0F        .db $0F
  $9A8C  00        BRK
  $9A8D  01 C1     ORA ($C1,X)
  $9A8F  A0 C0     LDY #$C0
  $9A91  E0 E0     CPX #$E0
  $9A93  A0 C0     LDY #$C0
  $9A95  78        SEI
  $9A96  AC AA 00  LDY $00AA
  $9A99  80        .db $80
  $9A9A  40        RTI
  $9A9B  40        RTI
  $9A9C  00        BRK
  $9A9D  80        .db $80
  $9A9E  D8        CLD
  $9A9F  D4        .db $D4
  $9AA0  2F        .db $2F
  $9AA1  4E 40 80  LSR $8040
  $9AA4  81 87     STA ($87,X)

L_9AA6:
  $9AA6  FE 78 10  INC $1078,X
  $9AA9  31 3F     AND ($3F),Y
  $9AAB  7F        .db $7F
  $9AAC  7F        .db $7F

L_9AAD:
  $9AAD  7E 78 00  ROR $0078,X
  $9AB0  15 38     ORA $38,X
  $9AB2  68        PLA
  $9AB3  D0 90     BNE $9A45
  $9AB5  10 1F     BPL $9AD6
  $9AB7  0F        .db $0F
  $9AB8  E2        .db $E2
  $9AB9  E7        .db $E7
  $9ABA  C7        .db $C7
  $9ABB  8F        .db $8F
  $9ABC  0F        .db $0F
  $9ABD  0F        .db $0F
  $9ABE  0F        .db $0F
  $9ABF  00        BRK
  $9AC0  E2        .db $E2
  $9AC1  06 0C     ASL $0C
  $9AC3  18        CLC
  $9AC4  30 E0     BMI $9AA6
  $9AC6  C0 00     CPY #$00
  $9AC8  1C        .db $1C
  $9AC9  FC        .db $FC
  $9ACA  F8        SED
  $9ACB  F0 E0     BEQ $9AAD
  $9ACD  C0 00     CPY #$00
  $9ACF  00        BRK
  $9AD0  00        BRK
  $9AD1  00        BRK

L_9AD2:
  $9AD2  00        BRK
  $9AD3  00        BRK
  $9AD4  00        BRK
  $9AD5  00        BRK

L_9AD6:
  $9AD6  80        .db $80
  $9AD7  00        BRK
  $9AD8  06 2F     ASL $2F
  $9ADA  6F        .db $6F
  $9ADB  53        .db $53
  $9ADC  53        .db $53
  $9ADD  2E 80 00  ROL $0080
  $9AE0  0F        .db $0F
  $9AE1  11 21     ORA ($21),Y
  $9AE3  21 42     AND ($42,X)
  $9AE5  4C B0 C0  JMP $C0B0
  $9AE8  00        BRK
  $9AE9  0E 1E 1E  ASL $1E1E
  $9AEC  3C        .db $3C
  $9AED  30 40     BMI $9B2F
  $9AEF  00        BRK
  $9AF0  00        BRK
  $9AF1  00        BRK
  $9AF2  00        BRK
  $9AF3  10 38     BPL $9B2D
  $9AF5  78        SEI
  $9AF6  7C        .db $7C
  $9AF7  F8        SED
  $9AF8  00        BRK
  $9AF9  00        BRK
  $9AFA  00        BRK
  $9AFB  00        BRK
  $9AFC  10 20     BPL $9B1E
  $9AFE  38        SEC
  $9AFF  40        RTI
  $9B00  07        .db $07
  $9B01  0B        .db $0B
  $9B02  15 1D     ORA $1D,X
  $9B04  1F        .db $1F
  $9B05  1F        .db $1F
  $9B06  0F        .db $0F
  $9B07  17        .db $17
  $9B08  00        BRK
  $9B09  04        .db $04
  $9B0A  0E 02 08  ASL $0802
  $9B0D  08        PHP
  $9B0E  07        .db $07
  $9B0F  08        PHP
  $9B10  78        SEI
  $9B11  A4 43     LDY $43
  $9B13  3E FE FE  ROL $FEFE,X
  $9B16  FC        .db $FC
  $9B17  78        SEI
  $9B18  00        BRK
  $9B19  78        SEI
  $9B1A  FC        .db $FC
  $9B1B  C1 0D     CMP ($0D,X)
  $9B1D  8D 7B 87  STA $877B
  $9B20  00        BRK
  $9B21  00        BRK
  $9B22  00        BRK
  $9B23  C0 30     CPY #$30
  $9B25  08        PHP
  $9B26  C4 E2     CPY $E2
  $9B28  00        BRK
  $9B29  00        BRK
  $9B2A  00        BRK
  $9B2B  00        BRK
  $9B2C  C0 F0     CPY #$F0
  $9B2E  38        SEC

L_9B2F:
  $9B2F  5C        .db $5C
  $9B30  20 20 10  JSR $1020
  $9B33  0F        .db $0F
  $9B34  1F        .db $1F
  $9B35  3F        .db $3F

L_9B36:
  $9B36  5F        .db $5F
  $9B37  60        RTS
  $9B38  1F        .db $1F
  $9B39  1F        .db $1F
  $9B3A  0F        .db $0F
  $9B3B  00        BRK
  $9B3C  00        BRK
  $9B3D  00        BRK
  $9B3E  20 3F 03  JSR $033F
  $9B41  1F        .db $1F
  $9B42  FF        .db $FF
  $9B43  FE FD FB  INC $FBFD,X
  $9B46  E7        .db $E7
  $9B47  1F        .db $1F
  $9B48  FC        .db $FC
  $9B49  E0 00     CPX #$00
  $9B4B  01 03     ORA ($03,X)
  $9B4D  07        .db $07
  $9B4E  1F        .db $1F
  $9B4F  FF        .db $FF
  $9B50  A1 44     LDA ($44,X)
  $9B52  62        .db $62
  $9B53  E3        .db $E3
  $9B54  E1 F0     SBC ($F0,X)
  $9B56  F8        SED
  $9B57  FC        .db $FC
  $9B58  5E BF DF  LSR $DFBF,X
  $9B5B  DF        .db $DF
  $9B5C  DF        .db $DF
  $9B5D  DF        .db $DF
  $9B5E  DF        .db $DF
  $9B5F  DF        .db $DF
  $9B60  00        BRK
  $9B61  80        .db $80
  $9B62  40        RTI
  $9B63  40        RTI
  $9B64  20 20 10  JSR $1020
  $9B67  10 00     BPL $9B69

L_9B69:
  $9B69  00        BRK
  $9B6A  80        .db $80
  $9B6B  80        .db $80
  $9B6C  C0 C0     CPY #$C0
  $9B6E  E0 E0     CPX #$E0
  $9B70  FF        .db $FF
  $9B71  FF        .db $FF
  $9B72  FF        .db $FF
  $9B73  FF        .db $FF
  $9B74  7F        .db $7F
  $9B75  7F        .db $7F
  $9B76  3F        .db $3F
  $9B77  3F        .db $3F
  $9B78  7F        .db $7F
  $9B79  7F        .db $7F
  $9B7A  7F        .db $7F
  $9B7B  7F        .db $7F
  $9B7C  3F        .db $3F
  $9B7D  3F        .db $3F
  $9B7E  1F        .db $1F
  $9B7F  1F        .db $1F
  $9B80  FF        .db $FF
  $9B81  FF        .db $FF
  $9B82  FF        .db $FF
  $9B83  FF        .db $FF
  $9B84  FF        .db $FF
  $9B85  FF        .db $FF
  $9B86  FF        .db $FF
  $9B87  FF        .db $FF
  $9B88  FF        .db $FF
  $9B89  FF        .db $FF
  $9B8A  FF        .db $FF
  $9B8B  FF        .db $FF
  $9B8C  FF        .db $FF
  $9B8D  FF        .db $FF
  $9B8E  FF        .db $FF
  $9B8F  FE FC FE  INC $FEFC,X
  $9B92  FE FF FF  INC $FFFF,X
  $9B95  8E AE AE  STX $AEAE
  $9B98  DF        .db $DF
  $9B99  BF        .db $BF
  $9B9A  BF        .db $BF
  $9B9B  BE 8C 75  LDX $758C,Y
  $9B9E  55 55     EOR $55,X
  $9BA0  10 08     BPL $9BAA
  $9BA2  E8        INX
  $9BA3  98        TYA
  $9BA4  08        PHP
  $9BA5  74        .db $74
  $9BA6  74        .db $74
  $9BA7  74        .db $74
  $9BA8  E0 F0     CPX #$F0

L_9BAA:
  $9BAA  10 60     BPL $9C0C
  $9BAC  F0 88     BEQ $9B36
  $9BAE  C8        INY
  $9BAF  88        DEY
  $9BB0  1F        .db $1F
  $9BB1  0F        .db $0F
  $9BB2  07        .db $07
  $9BB3  03        .db $03
  $9BB4  03        .db $03
  $9BB5  1C        .db $1C
  $9BB6  20 3F 0F  JSR $0F3F
  $9BB9  07        .db $07
  $9BBA  01 00     ORA ($00,X)
  $9BBC  00        BRK
  $9BBD  03        .db $03
  $9BBE  1F        .db $1F
  $9BBF  00        BRK
  $9BC0  FF        .db $FF
  $9BC1  FF        .db $FF
  $9BC2  FF        .db $FF
  $9BC3  FF        .db $FF
  $9BC4  FF        .db $FF
  $9BC5  78        SEI
  $9BC6  C0 FF     CPY #$FF
  $9BC8  FE FD FB  INC $FBFD,X
  $9BCB  76 00     ROR $00,X
  $9BCD  87        .db $87
  $9BCE  3F        .db $3F
  $9BCF  00        BRK
  $9BD0  8E FF BF  STX $BFFF
  $9BD3  BF        .db $BF
  $9BD4  FF        .db $FF
  $9BD5  F9 30 FF  SBC $FF30,Y
  $9BD8  75 0C     ADC $0C,X
  $9BDA  5E 5F 38  LSR $385F,X
  $9BDD  07        .db $07
  $9BDE  CF        .db $CF
  $9BDF  00        BRK
  $9BE0  04        .db $04
  $9BE1  68        PLA
  $9BE2  D8        CLD
  $9BE3  F8        SED
  $9BE4  CC C2 01  CPY $01C2
  $9BE7  FF        .db $FF
  $9BE8  F8        SED
  $9BE9  90 20     BCC $9C0B
  $9BEB  80        .db $80
  $9BEC  30 FC     BMI $9BEA
  $9BEE  FE 00 1F  INC $1F00,X
  $9BF1  0F        .db $0F
  $9BF2  07        .db $07
  $9BF3  03        .db $03
  $9BF4  1C        .db $1C
  $9BF5  20 3F 00  JSR $003F
  $9BF8  0F        .db $0F
  $9BF9  07        .db $07
  $9BFA  01 00     ORA ($00,X)
  $9BFC  03        .db $03
  $9BFD  1F        .db $1F
  $9BFE  00        BRK
  $9BFF  00        BRK
  $9C00  FF        .db $FF
  $9C01  FF        .db $FF
  $9C02  FF        .db $FF
  $9C03  FF        .db $FF
  $9C04  78        SEI
  $9C05  C0 FF     CPY #$FF
  $9C07  00        BRK
  $9C08  FE FD FB  INC $FBFD,X

L_9C0B:
  $9C0B  70 87     BVS $9B94
  $9C0D  3F        .db $3F
  $9C0E  00        BRK
  $9C0F  00        BRK
  $9C10  8E FF BF  STX $BFFF
  $9C13  BF        .db $BF
  $9C14  F9 30 FF  SBC $FF30,Y
  $9C17  00        BRK
  $9C18  75 0C     ADC $0C,X
  $9C1A  5E 58 07  LSR $0758,X
  $9C1D  CF        .db $CF
  $9C1E  00        BRK
  $9C1F  00        BRK
  $9C20  04        .db $04
  $9C21  68        PLA
  $9C22  F8        SED
  $9C23  CC C2 01  CPY $01C2
  $9C26  FF        .db $FF
  $9C27  00        BRK
  $9C28  F8        SED

L_9C29:
  $9C29  90 00     BCC $9C2B

L_9C2B:
  $9C2B  30 FC     BMI $9C29
  $9C2D  FE 00 00  INC $0000,X
  $9C30  20 20 10  JSR $1020
  $9C33  0F        .db $0F
  $9C34  0F        .db $0F
  $9C35  0F        .db $0F
  $9C36  0F        .db $0F
  $9C37  1F        .db $1F
  $9C38  1F        .db $1F
  $9C39  1F        .db $1F
  $9C3A  0F        .db $0F
  $9C3B  00        BRK
  $9C3C  00        BRK
  $9C3D  00        BRK
  $9C3E  00        BRK
  $9C3F  00        BRK
  $9C40  03        .db $03
  $9C41  1F        .db $1F
  $9C42  FF        .db $FF
  $9C43  FF        .db $FF
  $9C44  FF        .db $FF
  $9C45  FF        .db $FF
  $9C46  FF        .db $FF
  $9C47  FF        .db $FF
  $9C48  FC        .db $FC
  $9C49  E0 00     CPX #$00
  $9C4B  00        BRK
  $9C4C  00        BRK
  $9C4D  00        BRK
  $9C4E  00        BRK
  $9C4F  00        BRK
  $9C50  A1 C4     LDA ($C4,X)
  $9C52  E2        .db $E2
  $9C53  A3        .db $A3
  $9C54  A1 B0     LDA ($B0,X)
  $9C56  78        SEI
  $9C57  7C        .db $7C
  $9C58  5E 3F 1F  LSR $1F3F,X
  $9C5B  5F        .db $5F
  $9C5C  5F        .db $5F
  $9C5D  5F        .db $5F
  $9C5E  DF        .db $DF
  $9C5F  DF        .db $DF
  $9C60  3F        .db $3F
  $9C61  7F        .db $7F
  $9C62  BF        .db $BF
  $9C63  BF        .db $BF
  $9C64  C0 FF     CPY #$FF
  $9C66  7F        .db $7F
  $9C67  7F        .db $7F
  $9C68  00        BRK
  $9C69  00        BRK
  $9C6A  40        RTI
  $9C6B  40        RTI
  $9C6C  7F        .db $7F
  $9C6D  7F        .db $7F
  $9C6E  3F        .db $3F
  $9C6F  3F        .db $3F
  $9C70  FE FD FB  INC $FBFD,X
  $9C73  E7        .db $E7
  $9C74  1F        .db $1F
  $9C75  FF        .db $FF
  $9C76  FF        .db $FF
  $9C77  FF        .db $FF
  $9C78  01 03     ORA ($03,X)
  $9C7A  07        .db $07
  $9C7B  1F        .db $1F
  $9C7C  FF        .db $FF
  $9C7D  FF        .db $FF
  $9C7E  FF        .db $FF
  $9C7F  FE FC FE  INC $FEFC,X
  $9C82  FE FF FF  INC $FFFF,X
  $9C85  8E AE AE  STX $AEAE
  $9C88  DF        .db $DF
  $9C89  BF        .db $BF
  $9C8A  BF        .db $BF
  $9C8B  BE 8C 75  LDX $758C,Y
  $9C8E  55 55     EOR $55,X
  $9C90  3F        .db $3F
  $9C91  1F        .db $1F
  $9C92  0F        .db $0F
  $9C93  07        .db $07
  $9C94  1D 20 3F  ORA $3F20,X
  $9C97  00        BRK
  $9C98  1F        .db $1F
  $9C99  0F        .db $0F
  $9C9A  07        .db $07
  $9C9B  01 02     ORA ($02,X)
  $9C9D  1F        .db $1F
  $9C9E  00        BRK
  $9C9F  00        BRK
  $9CA0  FF        .db $FF
  $9CA1  FF        .db $FF
  $9CA2  FF        .db $FF
  $9CA3  FF        .db $FF
  $9CA4  F8        SED
  $9CA5  C0 FF     CPY #$FF
  $9CA7  00        BRK
  $9CA8  FE FD FB  INC $FBFD,X
  $9CAB  F0 07     BEQ $9CB4
  $9CAD  3F        .db $3F
  $9CAE  00        BRK
  $9CAF  00        BRK
  $9CB0  20 20 10  JSR $1020
  $9CB3  0F        .db $0F

L_9CB4:
  $9CB4  07        .db $07
  $9CB5  07        .db $07
  $9CB6  07        .db $07
  $9CB7  07        .db $07
  $9CB8  1F        .db $1F
  $9CB9  1F        .db $1F
  $9CBA  0F        .db $0F
  $9CBB  00        BRK
  $9CBC  00        BRK
  $9CBD  00        BRK
  $9CBE  00        BRK
  $9CBF  00        BRK
  $9CC0  03        .db $03
  $9CC1  1F        .db $1F
  $9CC2  FF        .db $FF
  $9CC3  FF        .db $FF
  $9CC4  FF        .db $FF
  $9CC5  FF        .db $FF
  $9CC6  FF        .db $FF
  $9CC7  FF        .db $FF
  $9CC8  FC        .db $FC
  $9CC9  E0 00     CPX #$00
  $9CCB  00        BRK
  $9CCC  00        BRK
  $9CCD  00        BRK
  $9CCE  00        BRK
  $9CCF  00        BRK
  $9CD0  A1 C4     LDA ($C4,X)
  $9CD2  C2        .db $C2
  $9CD3  C3        .db $C3
  $9CD4  E1 D0     SBC ($D0,X)
  $9CD6  D8        CLD
  $9CD7  BC 5E 3F  LDY $3F5E,X
  $9CDA  3F        .db $3F
  $9CDB  3F        .db $3F
  $9CDC  1F        .db $1F
  $9CDD  2F        .db $2F
  $9CDE  2F        .db $2F
  $9CDF  6F        .db $6F
  $9CE0  0F        .db $0F
  $9CE1  0F        .db $0F
  $9CE2  0F        .db $0F
  $9CE3  1F        .db $1F
  $9CE4  1F        .db $1F
  $9CE5  3F        .db $3F
  $9CE6  7F        .db $7F
  $9CE7  FF        .db $FF
  $9CE8  00        BRK
  $9CE9  00        BRK
  $9CEA  00        BRK
  $9CEB  00        BRK
  $9CEC  00        BRK
  $9CED  00        BRK
  $9CEE  00        BRK
  $9CEF  00        BRK
  $9CF0  FF        .db $FF
  $9CF1  FF        .db $FF
  $9CF2  FF        .db $FF
  $9CF3  FE FE FD  INC $FDFE,X
  $9CF6  FB        .db $FB
  $9CF7  F7        .db $F7
  $9CF8  00        BRK
  $9CF9  00        BRK
  $9CFA  00        BRK
  $9CFB  01 01     ORA ($01,X)
  $9CFD  03        .db $03
  $9CFE  07        .db $07
  $9CFF  0F        .db $0F
  $9D00  BC 7E 7E  LDY $7E7E,X
  $9D03  FF        .db $FF
  $9D04  FF        .db $FF
  $9D05  8E AE AE  STX $AEAE
  $9D08  6F        .db $6F
  $9D09  EF        .db $EF
  $9D0A  DF        .db $DF
  $9D0B  DE 8C 75  DEC $758C,X
  $9D0E  55 55     EOR $55,X
  $9D10  BF        .db $BF
  $9D11  40        RTI
  $9D12  7F        .db $7F
  $9D13  3F        .db $3F
  $9D14  1F        .db $1F
  $9D15  1F        .db $1F
  $9D16  23        .db $23
  $9D17  3F        .db $3F
  $9D18  40        RTI
  $9D19  3F        .db $3F
  $9D1A  3F        .db $3F
  $9D1B  1F        .db $1F
  $9D1C  0F        .db $0F
  $9D1D  03        .db $03
  $9D1E  1C        .db $1C
  $9D1F  00        BRK
  $9D20  CF        .db $CF
  $9D21  3F        .db $3F
  $9D22  FF        .db $FF
  $9D23  FF        .db $FF
  $9D24  FF        .db $FF
  $9D25  F8        SED
  $9D26  E0 FF     CPX #$FF
  $9D28  3F        .db $3F
  $9D29  FF        .db $FF
  $9D2A  FE FC F8  INC $F8FC,X
  $9D2D  E7        .db $E7
  $9D2E  1F        .db $1F
  $9D2F  00        BRK
  $9D30  07        .db $07
  $9D31  0B        .db $0B
  $9D32  11 15     ORA ($15),Y
  $9D34  15 19     ORA $19,X
  $9D36  0F        .db $0F
  $9D37  17        .db $17
  $9D38  00        BRK
  $9D39  04        .db $04
  $9D3A  0E 0E 0E  ASL $0E0E
  $9D3D  06 00     ASL $00
  $9D3F  08        PHP
  $9D40  78        SEI
  $9D41  84 23     STY $23
  $9D43  62        .db $62
  $9D44  42        .db $42
  $9D45  8E FC 78  STX $78FC
  $9D48  00        BRK
  $9D49  78        SEI
  $9D4A  FC        .db $FC
  $9D4B  FD FD 71  SBC $71FD,X
  $9D4E  03        .db $03
  $9D4F  87        .db $87
  $9D50  18        CLC
  $9D51  34        .db $34
  $9D52  72        .db $72
  $9D53  82        .db $82
  $9D54  F1 F9     SBC ($F9),Y
  $9D56  7D 3E 00  ADC $003E,X
  $9D59  18        CLC
  $9D5A  1C        .db $1C
  $9D5B  7C        .db $7C
  $9D5C  0E 7E 36  ASL $367E
  $9D5F  00        BRK
  $9D60  18        CLC
  $9D61  34        .db $34
  $9D62  72        .db $72
  $9D63  82        .db $82
  $9D64  F9 79 7D  SBC $7D79,Y
  $9D67  3C        .db $3C
  $9D68  00        BRK
  $9D69  18        CLC
  $9D6A  1C        .db $1C
  $9D6B  7C        .db $7C
  $9D6C  06 0E     ASL $0E
  $9D6E  36 03     ROL $03,X
  $9D70  08        PHP
  $9D71  F4        .db $F4
  $9D72  4A        LSR
  $9D73  6A        ROR
  $9D74  44        .db $44
  $9D75  00        BRK
  $9D76  00        BRK
  $9D77  00        BRK
  $9D78  00        BRK
  $9D79  08        PHP
  $9D7A  04        .db $04
  $9D7B  04        .db $04
  $9D7C  00        BRK
  $9D7D  00        BRK
  $9D7E  00        BRK
  $9D7F  00        BRK
  $9D80  FF        .db $FF
  $9D81  81 BD     STA ($BD,X)
  $9D83  A5 A5     LDA $A5
  $9D85  BD 81 FF  LDA $FF81,X
  $9D88  FE FE FA  INC $FAFE,X
  $9D8B  FA        .db $FA
  $9D8C  FA        .db $FA
  $9D8D  C2        .db $C2
  $9D8E  FE 00 00  INC $0000,X
  $9D91  03        .db $03
  $9D92  01 00     ORA ($00,X)
  $9D94  00        BRK
  $9D95  00        BRK
  $9D96  00        BRK
  $9D97  00        BRK
  $9D98  FF        .db $FF
  $9D99  7F        .db $7F
  $9D9A  3F        .db $3F

L_9D9B:
  $9D9B  07        .db $07
  $9D9C  00        BRK
  $9D9D  00        BRK
  $9D9E  00        BRK
  $9D9F  00        BRK
  $9DA0  00        BRK
  $9DA1  F8        SED
  $9DA2  E0 00     CPX #$00
  $9DA4  00        BRK
  $9DA5  00        BRK
  $9DA6  00        BRK
  $9DA7  00        BRK
  $9DA8  FF        .db $FF
  $9DA9  FE FC E0  INC $E0FC,X
  $9DAC  00        BRK
  $9DAD  00        BRK
  $9DAE  00        BRK
  $9DAF  00        BRK
  $9DB0  00        BRK
  $9DB1  00        BRK
  $9DB2  03        .db $03
  $9DB3  01 00     ORA ($00,X)
  $9DB5  00        BRK
  $9DB6  00        BRK
  $9DB7  00        BRK
  $9DB8  7F        .db $7F
  $9DB9  3F        .db $3F
  $9DBA  0F        .db $0F
  $9DBB  03        .db $03
  $9DBC  01 00     ORA ($00,X)
  $9DBE  00        BRK
  $9DBF  00        BRK
  $9DC0  00        BRK
  $9DC1  03        .db $03
  $9DC2  01 01     ORA ($01,X)
  $9DC4  01 01     ORA ($01,X)
  $9DC6  03        .db $03
  $9DC7  03        .db $03
  $9DC8  1F        .db $1F
  $9DC9  0F        .db $0F
  $9DCA  03        .db $03
  $9DCB  01 01     ORA ($01,X)
  $9DCD  03        .db $03
  $9DCE  03        .db $03
  $9DCF  07        .db $07
  $9DD0  00        BRK
  $9DD1  C0 80     CPY #$80
  $9DD3  00        BRK
  $9DD4  00        BRK
  $9DD5  00        BRK
  $9DD6  00        BRK
  $9DD7  00        BRK
  $9DD8  F8        SED
  $9DD9  F0 C0     BEQ $9D9B

L_9DDB:
  $9DDB  80        .db $80
  $9DDC  80        .db $80
  $9DDD  C0 C0     CPY #$C0
  $9DDF  E0 03     CPX #$03
  $9DE1  01 00     ORA ($00,X)
  $9DE3  00        BRK
  $9DE4  00        BRK
  $9DE5  00        BRK
  $9DE6  00        BRK
  $9DE7  00        BRK
  $9DE8  07        .db $07
  $9DE9  03        .db $03
  $9DEA  01 00     ORA ($00,X)
  $9DEC  00        BRK
  $9DED  00        BRK
  $9DEE  00        BRK
  $9DEF  00        BRK
  $9DF0  00        BRK
  $9DF1  80        .db $80
  $9DF2  00        BRK
  $9DF3  00        BRK
  $9DF4  00        BRK
  $9DF5  00        BRK
  $9DF6  00        BRK
  $9DF7  00        BRK
  $9DF8  E0 C0     CPX #$C0
  $9DFA  80        .db $80
  $9DFB  00        BRK
  $9DFC  00        BRK
  $9DFD  00        BRK
  $9DFE  00        BRK
  $9DFF  00        BRK
  $9E00  00        BRK
  $9E01  00        BRK
  $9E02  00        BRK
  $9E03  00        BRK
  $9E04  01 02     ORA ($02,X)
  $9E06  04        .db $04
  $9E07  04        .db $04
  $9E08  00        BRK
  $9E09  00        BRK
  $9E0A  00        BRK
  $9E0B  00        BRK
  $9E0C  00        BRK
  $9E0D  01 03     ORA ($03,X)
  $9E0F  03        .db $03
  $9E10  30 48     BMI $9E5A
  $9E12  64        .db $64
  $9E13  A2 F2     LDX #$F2
  $9E15  09 05     ORA #$05
  $9E17  05 00     ORA $00
  $9E19  30 38     BMI $9E53
  $9E1B  7C        .db $7C
  $9E1C  0C        .db $0C
  $9E1D  86 02     STX $02
  $9E1F  02        .db $02
  $9E20  04        .db $04
  $9E21  02        .db $02
  $9E22  03        .db $03
  $9E23  05 05     ORA $05
  $9E25  04        .db $04

L_9E26:
  $9E26  07        .db $07
  $9E27  07        .db $07
  $9E28  03        .db $03
  $9E29  01 00     ORA ($00,X)
  $9E2B  03        .db $03
  $9E2C  03        .db $03
  $9E2D  03        .db $03
  $9E2E  00        BRK
  $9E2F  00        BRK
  $9E30  05 09     ORA $09
  $9E32  F1 1D     SBC ($1D),Y
  $9E34  9D 9D 9D  STA $9D9D,X
  $9E37  DD 02 86  CMP $8602,X
  $9E3A  0E E2 EA  ASL $EAE2
  $9E3D  E2        .db $E2
  $9E3E  6A        ROR
  $9E3F  22        .db $22
  $9E40  C0 C6     CPY #$C6
  $9E42  4F        .db $4F
  $9E43  C0 00     CPY #$00
  $9E45  C0 C0     CPY #$C0
  $9E47  4F        .db $4F
  $9E48  07        .db $07
  $9E49  8F        .db $8F
  $9E4A  9F        .db $9F
  $9E4B  07        .db $07
  $9E4C  00        BRK
  $9E4D  00        BRK
  $9E4E  8F        .db $8F
  $9E4F  9F        .db $9F
  $9E50  00        BRK
  $9E51  00        BRK
  $9E52  00        BRK

L_9E53:
  $9E53  00        BRK
  $9E54  00        BRK
  $9E55  00        BRK
  $9E56  00        BRK
  $9E57  00        BRK
  $9E58  00        BRK
  $9E59  F0 80     BEQ $9DDB
  $9E5B  00        BRK
  $9E5C  00        BRK
  $9E5D  00        BRK
  $9E5E  80        .db $80
  $9E5F  F0 03     BEQ $9E64
  $9E61  02        .db $02
  $9E62  02        .db $02
  $9E63  02        .db $02

L_9E64:
  $9E64  01 00     ORA ($00,X)
  $9E66  00        BRK
  $9E67  00        BRK
  $9E68  00        BRK
  $9E69  01 01     ORA ($01,X)
  $9E6B  01 00     ORA ($00,X)
  $9E6D  00        BRK
  $9E6E  00        BRK
  $9E6F  00        BRK
  $9E70  23        .db $23
  $9E71  DE C6 64  DEC $64C6,X
  $9E74  0E F9 D1  ASL $D1F9
  $9E77  99 DC E0  STA $E0DC,Y
  $9E7A  F8        SED
  $9E7B  F8        SED
  $9E7C  F0 06     BEQ $9E84
  $9E7E  3E 7E C0  ROL $C07E,X
  $9E81  00        BRK
  $9E82  00        BRK
  $9E83  00        BRK

L_9E84:
  $9E84  00        BRK
  $9E85  00        BRK
  $9E86  00        BRK
  $9E87  C0 07     CPY #$07
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  00        BRK
  $9E8C  00        BRK
  $9E8D  00        BRK
  $9E8E  00        BRK
  $9E8F  00        BRK
  $9E90  00        BRK
  $9E91  00        BRK
  $9E92  00        BRK
  $9E93  00        BRK
  $9E94  00        BRK
  $9E95  00        BRK
  $9E96  70 8E     BVS $9E26
  $9E98  00        BRK
  $9E99  00        BRK
  $9E9A  00        BRK
  $9E9B  00        BRK
  $9E9C  00        BRK
  $9E9D  00        BRK
  $9E9E  00        BRK
  $9E9F  70 43     BVS $9EE4
  $9EA1  3E 04 02  ROL $0204,X
  $9EA4  01 00     ORA ($00,X)
  $9EA6  00        BRK
  $9EA7  00        BRK
  $9EA8  3C        .db $3C
  $9EA9  01 03     ORA ($03,X)
  $9EAB  01 00     ORA ($00,X)
  $9EAD  00        BRK
  $9EAE  00        BRK
  $9EAF  00        BRK
  $9EB0  21 92     AND ($92,X)
  $9EB2  DC        .db $DC
  $9EB3  37        .db $37
  $9EB4  F3        .db $F3
  $9EB5  3C        .db $3C
  $9EB6  00        BRK
  $9EB7  00        BRK
  $9EB8  C0 E1     CPY #$E1
  $9EBA  E3        .db $E3
  $9EBB  CD 0C 00  CMP $000C
  $9EBE  00        BRK
  $9EBF  00        BRK
  $9EC0  07        .db $07
  $9EC1  1E 78 E0  ASL $E078,X
  $9EC4  80        .db $80
  $9EC5  00        BRK
  $9EC6  00        BRK
  $9EC7  00        BRK
  $9EC8  FE F8 E0  INC $E0F8,X
  $9ECB  80        .db $80
  $9ECC  00        BRK
  $9ECD  00        BRK
  $9ECE  00        BRK
  $9ECF  00        BRK
  $9ED0  C0 DC     CPY #$DC
  $9ED2  40        RTI
  $9ED3  C0 00     CPY #$00
  $9ED5  C0 FC     CPY #$FC
  $9ED7  40        RTI
  $9ED8  1C        .db $1C
  $9ED9  BF        .db $BF
  $9EDA  9E        .db $9E
  $9EDB  08        PHP
  $9EDC  00        BRK
  $9EDD  0C        .db $0C
  $9EDE  BE 9C C0  LDX $C09C,Y
  $9EE1  00        BRK
  $9EE2  00        BRK
  $9EE3  00        BRK

L_9EE4:
  $9EE4  00        BRK
  $9EE5  00        BRK
  $9EE6  00        BRK
  $9EE7  C0 00     CPY #$00
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
  $9EF5  0E 1F 3F  ASL $3F1F
  $9EF8  00        BRK
  $9EF9  00        BRK
  $9EFA  00        BRK
  $9EFB  00        BRK
  $9EFC  00        BRK
  $9EFD  0E 1F 3F  ASL $3F1F
  $9F00  00        BRK
  $9F01  00        BRK
  $9F02  00        BRK
  $9F03  00        BRK
  $9F04  00        BRK
  $9F05  00        BRK
  $9F06  00        BRK
  $9F07  80        .db $80
  $9F08  00        BRK
  $9F09  00        BRK
  $9F0A  00        BRK
  $9F0B  00        BRK
  $9F0C  00        BRK
  $9F0D  00        BRK
  $9F0E  00        BRK
  $9F0F  80        .db $80
  $9F10  FF        .db $FF
  $9F11  FF        .db $FF
  $9F12  7F        .db $7F
  $9F13  FF        .db $FF
  $9F14  1E FF FF  ASL $FFFF,X
  $9F17  7F        .db $7F
  $9F18  3F        .db $3F
  $9F19  BF        .db $BF
  $9F1A  BF        .db $BF
  $9F1B  3F        .db $3F
  $9F1C  1E 3F BF  ASL $BF3F,X
  $9F1F  BF        .db $BF
  $9F20  80        .db $80
  $9F21  80        .db $80
  $9F22  80        .db $80
  $9F23  00        BRK
  $9F24  00        BRK
  $9F25  00        BRK
  $9F26  80        .db $80
  $9F27  80        .db $80
  $9F28  80        .db $80
  $9F29  80        .db $80
  $9F2A  80        .db $80
  $9F2B  00        BRK
  $9F2C  00        BRK
  $9F2D  00        BRK
  $9F2E  80        .db $80
  $9F2F  80        .db $80
  $9F30  FF        .db $FF
  $9F31  3F        .db $3F
  $9F32  1F        .db $1F
  $9F33  0E 00 00  ASL $0000
  $9F36  00        BRK
  $9F37  C0 3F     CPY #$3F
  $9F39  3F        .db $3F
  $9F3A  1F        .db $1F
  $9F3B  0E 00 00  ASL $0000
  $9F3E  00        BRK

L_9F3F:
  $9F3F  00        BRK
  $9F40  80        .db $80
  $9F41  80        .db $80
  $9F42  00        BRK
  $9F43  00        BRK

L_9F44:
  $9F44  00        BRK
  $9F45  00        BRK
  $9F46  70 8E     BVS $9ED6
  $9F48  80        .db $80
  $9F49  80        .db $80
  $9F4A  00        BRK
  $9F4B  00        BRK
  $9F4C  00        BRK
  $9F4D  00        BRK
  $9F4E  00        BRK
  $9F4F  70 00     BVS $9F51

L_9F51:
  $9F51  00        BRK
  $9F52  00        BRK
  $9F53  00        BRK
  $9F54  00        BRK
  $9F55  00        BRK
  $9F56  03        .db $03
  $9F57  04        .db $04
  $9F58  00        BRK
  $9F59  00        BRK
  $9F5A  00        BRK
  $9F5B  00        BRK
  $9F5C  00        BRK
  $9F5D  00        BRK
  $9F5E  00        BRK
  $9F5F  03        .db $03
  $9F60  00        BRK
  $9F61  00        BRK
  $9F62  00        BRK
  $9F63  18        CLC
  $9F64  24 54     BIT $54
  $9F66  F4        .db $F4
  $9F67  34        .db $34
  $9F68  00        BRK
  $9F69  00        BRK
  $9F6A  00        BRK
  $9F6B  00        BRK
  $9F6C  18        CLC
  $9F6D  38        SEC
  $9F6E  38        SEC
  $9F6F  D8        CLD
  $9F70  08        PHP
  $9F71  08        PHP
  $9F72  0C        .db $0C
  $9F73  14        .db $14
  $9F74  2A        ROL
  $9F75  59 71 73  EOR $7371,Y
  $9F78  06 04     ASL $04
  $9F7A  00        BRK
  $9F7B  08        PHP
  $9F7C  1C        .db $1C
  $9F7D  3E 1E 0D  ROL $0D1E,X
  $9F80  34        .db $34
  $9F81  12        .db $12
  $9F82  12        .db $12
  $9F83  12        .db $12
  $9F84  22        .db $22
  $9F85  C4 CC     CPY $CC
  $9F87  CE 08 0C  DEC $0C08
  $9F8A  0C        .db $0C
  $9F8B  0C        .db $0C
  $9F8C  1C        .db $1C
  $9F8D  38        SEC
  $9F8E  B0 34     BCS $9FC4
  $9F90  77        .db $77
  $9F91  4B        .db $4B
  $9F92  A4 B7     LDY $B7
  $9F94  B1 47     LDA ($47),Y
  $9F96  3E 09 0A  ROL $0A09,X
  $9F99  34        .db $34
  $9F9A  7B        .db $7B
  $9F9B  78        SEI
  $9F9C  7E 38 01  ROR $0138,X
  $9F9F  07        .db $07
  $9FA0  94 28     STY $28,X
  $9FA2  F0 A0     BEQ $9F44
  $9FA4  40        RTI
  $9FA5  81 5E     STA ($5E,X)
  $9FA7  32        .db $32
  $9FA8  68        PLA
  $9FA9  C0 20     CPY #$20
  $9FAB  40        RTI
  $9FAC  00        BRK
  $9FAD  00        BRK
  $9FAE  81 CD     STA ($CD,X)
  $9FB0  0E 11 20  ASL $2011
  $9FB3  43        .db $43
  $9FB4  8F        .db $8F
  $9FB5  BC F0 80  LDY $80F0,X
  $9FB8  00        BRK
  $9FB9  0E 1F 3F  ASL $3F1F
  $9FBC  7C        .db $7C
  $9FBD  70 80     BVS $9F3F
  $9FBF  00        BRK
  $9FC0  00        BRK
  $9FC1  E0 E0     CPX #$E0
  $9FC3  C0 00     CPY #$00
  $9FC5  00        BRK
  $9FC6  00        BRK
  $9FC7  00        BRK
  $9FC8  00        BRK
  $9FC9  00        BRK
  $9FCA  C0 00     CPY #$00
  $9FCC  00        BRK
  $9FCD  00        BRK
  $9FCE  00        BRK
  $9FCF  00        BRK
  $9FD0  09 04     ORA #$04
  $9FD2  03        .db $03
  $9FD3  00        BRK
  $9FD4  00        BRK
  $9FD5  00        BRK
  $9FD6  00        BRK
  $9FD7  00        BRK
  $9FD8  07        .db $07
  $9FD9  03        .db $03
  $9FDA  00        BRK
  $9FDB  00        BRK
  $9FDC  00        BRK
  $9FDD  00        BRK
  $9FDE  00        BRK
  $9FDF  00        BRK
  $9FE0  AB        .db $AB
  $9FE1  62        .db $62
  $9FE2  9C        .db $9C
  $9FE3  00        BRK
  $9FE4  00        BRK
  $9FE5  00        BRK

L_9FE6:
  $9FE6  00        BRK
  $9FE7  00        BRK
  $9FE8  DC        .db $DC
  $9FE9  9C        .db $9C
  $9FEA  00        BRK
  $9FEB  00        BRK
  $9FEC  00        BRK
  $9FED  00        BRK
  $9FEE  00        BRK
  $9FEF  00        BRK
  $9FF0  00        BRK
  $9FF1  00        BRK

L_9FF2:
  $9FF2  30 30     BMI $A024
  $9FF4  00        BRK
  $9FF5  00        BRK
  $9FF6  00        BRK
  $9FF7  00        BRK
  $9FF8  70 F8     BVS $9FF2
  $9FFA  C8        INY
  $9FFB  C8        INY
  $9FFC  70 00     BVS $9FFE

L_9FFE:
  $9FFE  00        BRK
  $9FFF  00        BRK
  $A000  03        .db $03
  $A001  0F        .db $0F
  $A002  78        SEI
  $A003  E0 80     CPX #$80
  $A005  00        BRK

L_A006:
  $A006  00        BRK
  $A007  07        .db $07
  $A008  FF        .db $FF
  $A009  FF        .db $FF
  $A00A  FF        .db $FF
  $A00B  FF        .db $FF
  $A00C  FF        .db $FF
  $A00D  FF        .db $FF
  $A00E  FF        .db $FF
  $A00F  FF        .db $FF
  $A010  F8        SED
  $A011  01 3F     ORA ($3F,X)
  $A013  FF        .db $FF
  $A014  FF        .db $FF
  $A015  FF        .db $FF
  $A016  FC        .db $FC
  $A017  C0 FF     CPY #$FF
  $A019  FF        .db $FF
  $A01A  FF        .db $FF
  $A01B  FF        .db $FF
  $A01C  FF        .db $FF
  $A01D  FF        .db $FF
  $A01E  FF        .db $FF
  $A01F  FF        .db $FF
  $A020  F1 02     SBC ($02),Y
  $A022  04        .db $04
  $A023  04        .db $04

L_A024:
  $A024  08        PHP
  $A025  11 E7     ORA ($E7),Y
  $A027  1F        .db $1F
  $A028  FF        .db $FF

L_A029:
  $A029  FF        .db $FF
  $A02A  FF        .db $FF
  $A02B  FF        .db $FF
  $A02C  FF        .db $FF
  $A02D  FF        .db $FF
  $A02E  FF        .db $FF
  $A02F  FF        .db $FF
  $A030  7F        .db $7F
  $A031  FE FC FD  INC $FDFC,X
  $A034  F2        .db $F2
  $A035  8C 11 6E  STY $6E11
  $A038  FF        .db $FF
  $A039  FF        .db $FF
  $A03A  FF        .db $FF
  $A03B  FF        .db $FF
  $A03C  FF        .db $FF
  $A03D  FF        .db $FF
  $A03E  FF        .db $FF
  $A03F  FF        .db $FF
  $A040  83        .db $83
  $A041  07        .db $07
  $A042  1F        .db $1F
  $A043  3C        .db $3C
  $A044  70 C0     BVS $A006

L_A046:
  $A046  83        .db $83
  $A047  0C        .db $0C
  $A048  FF        .db $FF
  $A049  FF        .db $FF
  $A04A  FF        .db $FF
  $A04B  FF        .db $FF
  $A04C  FF        .db $FF
  $A04D  FF        .db $FF
  $A04E  FF        .db $FF
  $A04F  FF        .db $FF
  $A050  10 23     BPL $A075
  $A052  44        .db $44
  $A053  88        DEY
  $A054  31 C6     AND ($C6),Y
  $A056  38        SEC
  $A057  C1 FF     CMP ($FF,X)
  $A059  FF        .db $FF
  $A05A  FF        .db $FF
  $A05B  FF        .db $FF
  $A05C  FF        .db $FF
  $A05D  FF        .db $FF
  $A05E  FF        .db $FF
  $A05F  FF        .db $FF
  $A060  FC        .db $FC
  $A061  F0 83     BEQ $9FE6
  $A063  0C        .db $0C
  $A064  30 C3     BMI $A029
  $A066  0C        .db $0C
  $A067  30 FF     BMI $A068

L_A069:
  $A069  FF        .db $FF
  $A06A  FF        .db $FF
  $A06B  FF        .db $FF
  $A06C  FF        .db $FF
  $A06D  FF        .db $FF
  $A06E  FF        .db $FF
  $A06F  FF        .db $FF
  $A070  C1 03     CMP ($03,X)
  $A072  0C        .db $0C
  $A073  F1 07     SBC ($07),Y

L_A075:
  $A075  3F        .db $3F
  $A076  FF        .db $FF
  $A077  FF        .db $FF
  $A078  FF        .db $FF
  $A079  FF        .db $FF
  $A07A  FF        .db $FF
  $A07B  FF        .db $FF
  $A07C  FF        .db $FF
  $A07D  FF        .db $FF
  $A07E  FF        .db $FF
  $A07F  FF        .db $FF
  $A080  03        .db $03
  $A081  07        .db $07
  $A082  1F        .db $1F
  $A083  3C        .db $3C
  $A084  70 C0     BVS $A046
  $A086  83        .db $83
  $A087  0C        .db $0C
  $A088  FF        .db $FF
  $A089  FF        .db $FF
  $A08A  FF        .db $FF
  $A08B  FF        .db $FF
  $A08C  FF        .db $FF
  $A08D  FF        .db $FF
  $A08E  FF        .db $FF
  $A08F  FF        .db $FF
  $A090  C9 5B     CMP #$5B
  $A092  F7        .db $F7
  $A093  FD 77 7B  SBC $7B77,X
  $A096  33        .db $33
  $A097  00        BRK
  $A098  FF        .db $FF
  $A099  FF        .db $FF
  $A09A  FF        .db $FF
  $A09B  FF        .db $FF
  $A09C  77        .db $77
  $A09D  7B        .db $7B
  $A09E  33        .db $33
  $A09F  00        BRK
  $A0A0  FC        .db $FC
  $A0A1  F0 83     BEQ $A026
  $A0A3  0C        .db $0C
  $A0A4  30 C3     BMI $A069
  $A0A6  0C        .db $0C
  $A0A7  30 FF     BMI $A0A8
  $A0A9  FF        .db $FF
  $A0AA  FF        .db $FF
  $A0AB  FF        .db $FF
  $A0AC  FF        .db $FF
  $A0AD  FF        .db $FF
  $A0AE  FF        .db $FF
  $A0AF  FF        .db $FF
  $A0B0  C1 83     CMP ($83,X)
  $A0B2  5E 35 7E  LSR $7E35,X
  $A0B5  B5 CA     LDA $CA,X
  $A0B7  80        .db $80
  $A0B8  FF        .db $FF
  $A0B9  FF        .db $FF
  $A0BA  FF        .db $FF
  $A0BB  7F        .db $7F
  $A0BC  7E B5 CA  ROR $CAB5,X
  $A0BF  80        .db $80
  $A0C0  7F        .db $7F
  $A0C1  FF        .db $FF
  $A0C2  FC        .db $FC
  $A0C3  FB        .db $FB
  $A0C4  F7        .db $F7
  $A0C5  EF        .db $EF
  $A0C6  1F        .db $1F
  $A0C7  3F        .db $3F
  $A0C8  00        BRK
  $A0C9  00        BRK
  $A0CA  00        BRK
  $A0CB  00        BRK
  $A0CC  00        BRK
  $A0CD  00        BRK
  $A0CE  00        BRK
  $A0CF  00        BRK
  $A0D0  CF        .db $CF
  $A0D1  F0 60     BEQ $A133
  $A0D3  40        RTI
  $A0D4  80        .db $80
  $A0D5  80        .db $80
  $A0D6  80        .db $80
  $A0D7  00        BRK
  $A0D8  C0 F0     CPY #$F0
  $A0DA  EE DF BF  INC $BFDF
  $A0DD  BE BC 7C  LDX $7CBC,Y
  $A0E0  CF        .db $CF
  $A0E1  3E FE FD  ROL $FDFE,X
  $A0E4  FB        .db $FB
  $A0E5  FB        .db $FB
  $A0E6  E7        .db $E7
  $A0E7  DE 00 00  DEC $0000,X
  $A0EA  00        BRK
  $A0EB  00        BRK
  $A0EC  00        BRK
  $A0ED  00        BRK
  $A0EE  00        BRK
  $A0EF  00        BRK
  $A0F0  B8        CLV
  $A0F1  67        .db $67
  $A0F2  1C        .db $1C
  $A0F3  18        CLC
  $A0F4  0B        .db $0B
  $A0F5  07        .db $07
  $A0F6  03        .db $03
  $A0F7  03        .db $03
  $A0F8  00        BRK
  $A0F9  07        .db $07
  $A0FA  1F        .db $1F
  $A0FB  9F        .db $9F
  $A0FC  CF        .db $CF
  $A0FD  67        .db $67
  $A0FE  23        .db $23
  $A0FF  33        .db $33
  $A100  7F        .db $7F
  $A101  FF        .db $FF
  $A102  FC        .db $FC
  $A103  FB        .db $FB
  $A104  F7        .db $F7
  $A105  EF        .db $EF
  $A106  1F        .db $1F
  $A107  FF        .db $FF
  $A108  00        BRK
  $A109  00        BRK
  $A10A  00        BRK
  $A10B  00        BRK
  $A10C  00        BRK
  $A10D  00        BRK
  $A10E  00        BRK
  $A10F  00        BRK
  $A110  07        .db $07
  $A111  F8        SED
  $A112  60        RTS
  $A113  C0 80     CPY #$80
  $A115  80        .db $80
  $A116  00        BRK
  $A117  02        .db $02
  $A118  00        BRK
  $A119  F8        SED
  $A11A  E0 DF     CPX #$DF
  $A11C  BF        .db $BF
  $A11D  BC 78 7A  LDY $7A78,X
  $A120  CF        .db $CF
  $A121  3E FE FD  ROL $FDFE,X
  $A124  FB        .db $FB
  $A125  FB        .db $FB
  $A126  E7        .db $E7
  $A127  DE 00 00  DEC $0000,X
  $A12A  00        BRK
  $A12B  00        BRK
  $A12C  00        BRK
  $A12D  00        BRK
  $A12E  00        BRK
  $A12F  00        BRK
  $A130  BD 7B 67  LDA $677B,X

L_A133:
  $A133  1F        .db $1F
  $A134  3E 1D 1B  ROL $1B1D,X
  $A137  07        .db $07
  $A138  00        BRK
  $A139  00        BRK
  $A13A  00        BRK
  $A13B  00        BRK
  $A13C  80        .db $80
  $A13D  C0 40     CPY #$40
  $A13F  60        RTS
  $A140  7F        .db $7F
  $A141  7F        .db $7F
  $A142  7F        .db $7F
  $A143  7F        .db $7F
  $A144  7F        .db $7F
  $A145  7F        .db $7F
  $A146  7F        .db $7F
  $A147  7F        .db $7F
  $A148  7F        .db $7F
  $A149  7F        .db $7F
  $A14A  7F        .db $7F
  $A14B  7F        .db $7F
  $A14C  7F        .db $7F
  $A14D  7F        .db $7F
  $A14E  7F        .db $7F
  $A14F  7F        .db $7F
  $A150  7F        .db $7F
  $A151  BF        .db $BF
  $A152  BF        .db $BF
  $A153  BF        .db $BF
  $A154  5F        .db $5F
  $A155  CF        .db $CF
  $A156  8F        .db $8F
  $A157  07        .db $07
  $A158  7F        .db $7F
  $A159  3F        .db $3F
  $A15A  3F        .db $3F
  $A15B  3F        .db $3F

L_A15C:
  $A15C  1F        .db $1F
  $A15D  0F        .db $0F
  $A15E  0F        .db $0F
  $A15F  07        .db $07
  $A160  FF        .db $FF
  $A161  FF        .db $FF
  $A162  FF        .db $FF
  $A163  FF        .db $FF
  $A164  FF        .db $FF
  $A165  FF        .db $FF
  $A166  FF        .db $FF
  $A167  FF        .db $FF
  $A168  FF        .db $FF
  $A169  FF        .db $FF
  $A16A  FF        .db $FF
  $A16B  FF        .db $FF
  $A16C  FF        .db $FF
  $A16D  FF        .db $FF
  $A16E  FF        .db $FF
  $A16F  FF        .db $FF
  $A170  FF        .db $FF
  $A171  FF        .db $FF
  $A172  FF        .db $FF
  $A173  FF        .db $FF
  $A174  FF        .db $FF
  $A175  FF        .db $FF
  $A176  FF        .db $FF
  $A177  FF        .db $FF
  $A178  FF        .db $FF
  $A179  FF        .db $FF
  $A17A  FF        .db $FF
  $A17B  FF        .db $FF
  $A17C  FF        .db $FF
  $A17D  FF        .db $FF
  $A17E  FF        .db $FF
  $A17F  FF        .db $FF
  $A180  01 01     ORA ($01,X)
  $A182  01 01     ORA ($01,X)
  $A184  80        .db $80
  $A185  80        .db $80
  $A186  C0 C0     CPY #$C0
  $A188  7D 7D 7D  ADC $7D7D,X
  $A18B  7D BE BE  ADC $BEBE,X
  $A18E  DF        .db $DF
  $A18F  DF        .db $DF
  $A190  E0 F0     CPX #$F0
  $A192  F8        SED
  $A193  FF        .db $FF
  $A194  FF        .db $FF
  $A195  FE FC F0  INC $F0FC,X
  $A198  EF        .db $EF
  $A199  F7        .db $F7
  $A19A  F8        SED
  $A19B  FF        .db $FF
  $A19C  FF        .db $FF
  $A19D  FE FC F0  INC $F0FC,X
  $A1A0  03        .db $03
  $A1A1  01 01     ORA ($01,X)
  $A1A3  01 01     ORA ($01,X)
  $A1A5  01 13     ORA ($13,X)
  $A1A7  03        .db $03
  $A1A8  13        .db $13
  $A1A9  11 11     ORA ($11),Y
  $A1AB  11 11     ORA ($11),Y
  $A1AD  11 33     ORA ($33),Y
  $A1AF  E3        .db $E3
  $A1B0  07        .db $07
  $A1B1  30 60     BMI $A213
  $A1B3  C1 86     CMP ($86,X)
  $A1B5  05 0B     ORA $0B
  $A1B7  17        .db $17
  $A1B8  C7        .db $C7
  $A1B9  B0 60     BCS $A21B
  $A1BB  C0 80     CPY #$80
  $A1BD  00        BRK
  $A1BE  00        BRK
  $A1BF  00        BRK
  $A1C0  02        .db $02
  $A1C1  03        .db $03
  $A1C2  03        .db $03
  $A1C3  01 80     ORA ($80,X)
  $A1C5  80        .db $80
  $A1C6  C0 E0     CPY #$E0
  $A1C8  7A        .db $7A
  $A1C9  7B        .db $7B
  $A1CA  7B        .db $7B
  $A1CB  7D BC BE  ADC $BEBC,X
  $A1CE  DF        .db $DF
  $A1CF  EF        .db $EF
  $A1D0  C0 0F     CPY #$0F
  $A1D2  70 88     BVS $A15C
  $A1D4  78        SEI
  $A1D5  C6 BF     DEC $BF
  $A1D7  7F        .db $7F
  $A1D8  C0 0F     CPY #$0F
  $A1DA  07        .db $07
  $A1DB  03        .db $03
  $A1DC  01 00     ORA ($00,X)
  $A1DE  00        BRK
  $A1DF  00        BRK
  $A1E0  0F        .db $0F
  $A1E1  0E 0E 0D  ASL $0D0E
  $A1E4  0B        .db $0B
  $A1E5  2B        .db $2B
  $A1E6  47        .db $47
  $A1E7  B6 20     LDX $20,Y
  $A1E9  20 20 20  JSR $2020
  $A1EC  20 60 C0  JSR $C060
  $A1EF  B0 75     BCS $A266
  $A1F1  3B        .db $3B

L_A1F2:
  $A1F2  1B        .db $1B
  $A1F3  1B        .db $1B
  $A1F4  0C        .db $0C
  $A1F5  0D 05 86  ORA $8605
  $A1F8  70 F8     BVS $A1F2
  $A1FA  F8        SED
  $A1FB  F8        SED
  $A1FC  FC        .db $FC
  $A1FD  FC        .db $FC
  $A1FE  7C        .db $7C
  $A1FF  0E 00 FF  ASL $FF00
  $A202  FF        .db $FF
  $A203  04        .db $04
  $A204  FB        .db $FB
  $A205  00        BRK
  $A206  7F        .db $7F
  $A207  00        BRK
  $A208  FB        .db $FB
  $A209  04        .db $04
  $A20A  04        .db $04
  $A20B  FF        .db $FF
  $A20C  FB        .db $FB
  $A20D  00        BRK
  $A20E  00        BRK
  $A20F  7F        .db $7F
  $A210  00        BRK
  $A211  C7        .db $C7
  $A212  BC 30 67  LDY $6730,X
  $A215  CF        .db $CF
  $A216  94 A3     STY $A3,X
  $A218  00        BRK
  $A219  C7        .db $C7
  $A21A  FF        .db $FF

L_A21B:
  $A21B  FF        .db $FF
  $A21C  FF        .db $FF
  $A21D  FF        .db $FF
  $A21E  F7        .db $F7
  $A21F  EF        .db $EF
  $A220  38        SEC
  $A221  BB        .db $BB
  $A222  B9 38 BB  LDA $BB38,Y
  $A225  38        SEC
  $A226  BA        TSX
  $A227  02        .db $02
  $A228  83        .db $83
  $A229  00        BRK
  $A22A  02        .db $02
  $A22B  83        .db $83
  $A22C  83        .db $83
  $A22D  00        BRK
  $A22E  03        .db $03
  $A22F  BB        .db $BB
  $A230  00        BRK
  $A231  01 83     ORA ($83,X)
  $A233  BB        .db $BB
  $A234  BB        .db $BB
  $A235  47        .db $47
  $A236  FF        .db $FF
  $A237  FC        .db $FC
  $A238  38        SEC
  $A239  39 BB BB  AND $BBBB,Y
  $A23C  BB        .db $BB
  $A23D  C7        .db $C7
  $A23E  FF        .db $FF
  $A23F  FD 7F FF  SBC $FF7F,X
  $A242  FC        .db $FC
  $A243  FB        .db $FB
  $A244  F7        .db $F7
  $A245  EF        .db $EF
  $A246  1F        .db $1F
  $A247  FF        .db $FF
  $A248  00        BRK
  $A249  00        BRK
  $A24A  00        BRK
  $A24B  00        BRK
  $A24C  00        BRK
  $A24D  00        BRK
  $A24E  00        BRK
  $A24F  00        BRK
  $A250  FF        .db $FF
  $A251  FE F1 8F  INC $8FF1,X
  $A254  78        SEI
  $A255  C7        .db $C7
  $A256  BF        .db $BF
  $A257  7F        .db $7F
  $A258  00        BRK
  $A259  00        BRK
  $A25A  00        BRK
  $A25B  00        BRK
  $A25C  00        BRK
  $A25D  00        BRK
  $A25E  00        BRK
  $A25F  00        BRK
  $A260  CF        .db $CF
  $A261  3E FE FD  ROL $FDFE,X
  $A264  FB        .db $FB
  $A265  FB        .db $FB

L_A266:
  $A266  E7        .db $E7
  $A267  DE 00 00  DEC $0000,X
  $A26A  00        BRK
  $A26B  00        BRK
  $A26C  00        BRK
  $A26D  00        BRK
  $A26E  00        BRK
  $A26F  00        BRK
  $A270  BD 7B E7  LDA $E77B,X
  $A273  1F        .db $1F
  $A274  FE FD FB  INC $FBFD,X
  $A277  F7        .db $F7
  $A278  00        BRK
  $A279  00        BRK
  $A27A  00        BRK
  $A27B  00        BRK
  $A27C  00        BRK
  $A27D  00        BRK
  $A27E  00        BRK
  $A27F  00        BRK
  $A280  00        BRK
  $A281  00        BRK
  $A282  00        BRK
  $A283  00        BRK
  $A284  00        BRK
  $A285  00        BRK
  $A286  E0 FE     CPX #$FE
  $A288  00        BRK
  $A289  00        BRK
  $A28A  00        BRK
  $A28B  00        BRK
  $A28C  00        BRK
  $A28D  00        BRK
  $A28E  00        BRK
  $A28F  00        BRK
  $A290  FF        .db $FF
  $A291  FE F1 8F  INC $8FF1,X
  $A294  78        SEI
  $A295  C7        .db $C7
  $A296  BF        .db $BF
  $A297  7F        .db $7F
  $A298  00        BRK
  $A299  00        BRK
  $A29A  00        BRK
  $A29B  00        BRK
  $A29C  00        BRK
  $A29D  00        BRK
  $A29E  00        BRK
  $A29F  00        BRK
  $A2A0  00        BRK
  $A2A1  00        BRK
  $A2A2  00        BRK
  $A2A3  00        BRK
  $A2A4  00        BRK
  $A2A5  00        BRK
  $A2A6  06 1D     ASL $1D
  $A2A8  00        BRK
  $A2A9  00        BRK
  $A2AA  00        BRK
  $A2AB  00        BRK
  $A2AC  00        BRK
  $A2AD  00        BRK
  $A2AE  00        BRK
  $A2AF  00        BRK
  $A2B0  BD 7B E7  LDA $E77B,X
  $A2B3  1F        .db $1F
  $A2B4  FE FD FB  INC $FBFD,X
  $A2B7  F7        .db $F7
  $A2B8  00        BRK
  $A2B9  00        BRK
  $A2BA  00        BRK
  $A2BB  00        BRK
  $A2BC  00        BRK
  $A2BD  00        BRK
  $A2BE  00        BRK
  $A2BF  00        BRK
  $A2C0  7F        .db $7F
  $A2C1  FF        .db $FF
  $A2C2  FC        .db $FC
  $A2C3  FB        .db $FB
  $A2C4  F7        .db $F7
  $A2C5  EF        .db $EF
  $A2C6  1F        .db $1F
  $A2C7  FF        .db $FF
  $A2C8  00        BRK
  $A2C9  00        BRK
  $A2CA  00        BRK
  $A2CB  00        BRK
  $A2CC  00        BRK
  $A2CD  00        BRK
  $A2CE  00        BRK
  $A2CF  00        BRK
  $A2D0  FE F9 F7  INC $F7F9,X
  $A2D3  8F        .db $8F
  $A2D4  5F        .db $5F
  $A2D5  DF        .db $DF
  $A2D6  BF        .db $BF
  $A2D7  3F        .db $3F
  $A2D8  00        BRK
  $A2D9  01 07     ORA ($07,X)
  $A2DB  0F        .db $0F
  $A2DC  1F        .db $1F
  $A2DD  1F        .db $1F
  $A2DE  3F        .db $3F
  $A2DF  3F        .db $3F
  $A2E0  CF        .db $CF
  $A2E1  3E FE FD  ROL $FDFE,X
  $A2E4  FB        .db $FB
  $A2E5  FB        .db $FB
  $A2E6  E7        .db $E7
  $A2E7  80        .db $80
  $A2E8  00        BRK
  $A2E9  00        BRK
  $A2EA  00        BRK
  $A2EB  00        BRK
  $A2EC  00        BRK
  $A2ED  00        BRK
  $A2EE  00        BRK
  $A2EF  00        BRK
  $A2F0  7F        .db $7F
  $A2F1  F8        SED
  $A2F2  FC        .db $FC
  $A2F3  FF        .db $FF
  $A2F4  FF        .db $FF
  $A2F5  FF        .db $FF
  $A2F6  FF        .db $FF
  $A2F7  FF        .db $FF
  $A2F8  7F        .db $7F
  $A2F9  FF        .db $FF
  $A2FA  FF        .db $FF
  $A2FB  FF        .db $FF
  $A2FC  FF        .db $FF
  $A2FD  FF        .db $FF
  $A2FE  FF        .db $FF
  $A2FF  FF        .db $FF
  $A300  7F        .db $7F
  $A301  FF        .db $FF
  $A302  FC        .db $FC
  $A303  FB        .db $FB
  $A304  F7        .db $F7
  $A305  EF        .db $EF
  $A306  1F        .db $1F
  $A307  E1 00     SBC ($00,X)
  $A309  00        BRK
  $A30A  00        BRK
  $A30B  00        BRK
  $A30C  00        BRK
  $A30D  00        BRK
  $A30E  00        BRK
  $A30F  00        BRK

L_A310:
  $A310  9E        .db $9E
  $A311  47        .db $47
  $A312  83        .db $83
  $A313  1F        .db $1F
  $A314  7F        .db $7F
  $A315  FF        .db $FF
  $A316  FF        .db $FF
  $A317  00        BRK
  $A318  1E 7F FF  ASL $FF7F,X
  $A31B  FF        .db $FF
  $A31C  FF        .db $FF
  $A31D  FF        .db $FF
  $A31E  FF        .db $FF
  $A31F  00        BRK
  $A320  CF        .db $CF
  $A321  3E FE FC  ROL $FCFE,X
  $A324  F8        SED
  $A325  F9 E0 80  SBC $80E0,Y
  $A328  00        BRK
  $A329  00        BRK
  $A32A  00        BRK
  $A32B  00        BRK
  $A32C  00        BRK
  $A32D  03        .db $03
  $A32E  07        .db $07
  $A32F  1F        .db $1F
  $A330  00        BRK
  $A331  01 83     ORA ($83,X)
  $A333  C7        .db $C7
  $A334  C2        .db $C2
  $A335  D1 D9     CMP ($D9),Y
  $A337  01 7F     ORA ($7F,X)
  $A339  7F        .db $7F
  $A33A  BF        .db $BF
  $A33B  DF        .db $DF
  $A33C  C2        .db $C2
  $A33D  D8        CLD
  $A33E  D8        CLD
  $A33F  00        BRK
  $A340  03        .db $03
  $A341  08        PHP
  $A342  0C        .db $0C
  $A343  0D 0B 9B  ORA $9B0B
  $A346  D7        .db $D7
  $A347  CF        .db $CF
  $A348  23        .db $23
  $A349  38        SEC
  $A34A  7C        .db $7C
  $A34B  7C        .db $7C
  $A34C  38        SEC
  $A34D  98        TYA
  $A34E  D0 C0     BNE $A310
  $A350  DF        .db $DF
  $A351  DE B0 0C  DEC $0CB0,X
  $A354  78        SEI
  $A355  C0 B8     CPY #$B8
  $A357  78        SEI
  $A358  C0 C0     CPY #$C0
  $A35A  80        .db $80
  $A35B  00        BRK
  $A35C  00        BRK
  $A35D  00        BRK
  $A35E  00        BRK
  $A35F  00        BRK
  $A360  FF        .db $FF
  $A361  FF        .db $FF
  $A362  00        BRK
  $A363  FD FB FB  SBC $FBFB,X
  $A366  E7        .db $E7
  $A367  DE FF FF  DEC $FFFF,X
  $A36A  00        BRK
  $A36B  00        BRK
  $A36C  00        BRK
  $A36D  00        BRK
  $A36E  00        BRK
  $A36F  00        BRK
  $A370  80        .db $80
  $A371  00        BRK
  $A372  00        BRK
  $A373  00        BRK
  $A374  00        BRK
  $A375  00        BRK
  $A376  00        BRK
  $A377  00        BRK
  $A378  00        BRK
  $A379  00        BRK
  $A37A  00        BRK

L_A37B:
  $A37B  00        BRK
  $A37C  00        BRK
  $A37D  00        BRK
  $A37E  00        BRK
  $A37F  00        BRK
  $A380  C0 00     CPY #$00
  $A382  C0 C0     CPY #$C0
  $A384  80        .db $80
  $A385  80        .db $80
  $A386  00        BRK
  $A387  01 C0     ORA ($C0,X)
  $A389  00        BRK
  $A38A  00        BRK
  $A38B  00        BRK
  $A38C  00        BRK
  $A38D  00        BRK
  $A38E  00        BRK
  $A38F  00        BRK
  $A390  03        .db $03
  $A391  0E 11 0F  ASL $0F11
  $A394  18        CLC
  $A395  07        .db $07
  $A396  0F        .db $0F
  $A397  0F        .db $0F
  $A398  00        BRK
  $A399  00        BRK
  $A39A  00        BRK
  $A39B  00        BRK
  $A39C  00        BRK
  $A39D  00        BRK
  $A39E  00        BRK
  $A39F  00        BRK
  $A3A0  0F        .db $0F
  $A3A1  3E 3E 7D  ROL $7D3E,X
  $A3A4  7B        .db $7B
  $A3A5  FB        .db $FB
  $A3A6  E7        .db $E7
  $A3A7  DE 00 00  DEC $0000,X
  $A3AA  00        BRK
  $A3AB  00        BRK
  $A3AC  00        BRK
  $A3AD  00        BRK
  $A3AE  00        BRK
  $A3AF  00        BRK
  $A3B0  BD 7B E7  LDA $E77B,X
  $A3B3  1F        .db $1F
  $A3B4  FE FD FB  INC $FBFD,X
  $A3B7  F7        .db $F7
  $A3B8  00        BRK
  $A3B9  00        BRK
  $A3BA  00        BRK
  $A3BB  00        BRK
  $A3BC  00        BRK
  $A3BD  00        BRK
  $A3BE  00        BRK
  $A3BF  00        BRK
  $A3C0  7F        .db $7F
  $A3C1  FF        .db $FF
  $A3C2  FC        .db $FC
  $A3C3  FB        .db $FB
  $A3C4  F7        .db $F7
  $A3C5  EE 1E F8  INC $F81E
  $A3C8  00        BRK
  $A3C9  00        BRK
  $A3CA  00        BRK
  $A3CB  00        BRK
  $A3CC  00        BRK
  $A3CD  00        BRK
  $A3CE  00        BRK
  $A3CF  00        BRK
  $A3D0  E7        .db $E7
  $A3D1  D8        CLD
  $A3D2  B0 A7     BCS $A37B
  $A3D4  6F        .db $6F
  $A3D5  7F        .db $7F
  $A3D6  7F        .db $7F
  $A3D7  00        BRK
  $A3D8  07        .db $07
  $A3D9  1F        .db $1F
  $A3DA  3F        .db $3F
  $A3DB  3F        .db $3F
  $A3DC  7F        .db $7F
  $A3DD  7F        .db $7F
  $A3DE  7F        .db $7F
  $A3DF  00        BRK
  $A3E0  86 00     STX $00
  $A3E2  80        .db $80
  $A3E3  05 05     ORA $05
  $A3E5  05 0D     ORA $0D
  $A3E7  0A        ASL
  $A3E8  06 30     ASL $30
  $A3EA  38        SEC
  $A3EB  7C        .db $7C
  $A3EC  7C        .db $7C
  $A3ED  FC        .db $FC
  $A3EE  FC        .db $FC
  $A3EF  78        SEI
  $A3F0  99 ED 75  STA $75ED,Y
  $A3F3  F9 FC F8  SBC $F8FC,Y
  $A3F6  FA        .db $FA
  $A3F7  00        BRK
  $A3F8  98        TYA
  $A3F9  EC F4 F8  CPX $F8F4
  $A3FC  FC        .db $FC
  $A3FD  FA        .db $FA
  $A3FE  FA        .db $FA
  $A3FF  00        BRK
  $A400  00        BRK
  $A401  00        BRK
  $A402  00        BRK
  $A403  06 16     ASL $16
  $A405  16 16     ASL $16,X
  $A407  10 1B     BPL $A424
  $A409  5F        .db $5F
  $A40A  7F        .db $7F
  $A40B  79 69 69  ADC $6969,Y
  $A40E  69 69     ADC #$69
  $A410  16 10     ASL $10,X
  $A412  16 00     ASL $00,X
  $A414  13        .db $13
  $A415  53        .db $53
  $A416  00        BRK
  $A417  00        BRK
  $A418  68        PLA
  $A419  68        PLA
  $A41A  68        PLA
  $A41B  0F        .db $0F
  $A41C  48        PHA
  $A41D  08        PHP
  $A41E  5B        .db $5B
  $A41F  4B        .db $4B
  $A420  00        BRK
  $A421  00        BRK
  $A422  C0 E0     CPY #$E0

L_A424:
  $A424  00        BRK
  $A425  E0 00     CPX #$00
  $A427  00        BRK
  $A428  40        RTI
  $A429  E4 36     CPX $36
  $A42B  16 16     ASL $16,X
  $A42D  16 00     ASL $00,X
  $A42F  FE E8 E8  INC $E8E8,X
  $A432  E8        INX
  $A433  00        BRK
  $A434  30 30     BMI $A466
  $A436  00        BRK
  $A437  00        BRK
  $A438  16 16     ASL $16,X
  $A43A  16 E0     ASL $E0,X
  $A43C  8A        TXA
  $A43D  8A        TXA
  $A43E  BA        TSX
  $A43F  30 00     BMI $A441

L_A441:
  $A441  FA        .db $FA
  $A442  FA        .db $FA
  $A443  A8        TAY
  $A444  00        BRK
  $A445  00        BRK
  $A446  FF        .db $FF
  $A447  FF        .db $FF
  $A448  FF        .db $FF
  $A449  05 05     ORA $05
  $A44B  52        .db $52
  $A44C  FA        .db $FA
  $A44D  00        BRK
  $A44E  FF        .db $FF
  $A44F  FF        .db $FF
  $A450  FF        .db $FF
  $A451  FF        .db $FF
  $A452  FF        .db $FF
  $A453  FF        .db $FF
  $A454  FF        .db $FF
  $A455  FF        .db $FF
  $A456  FF        .db $FF
  $A457  FF        .db $FF
  $A458  FF        .db $FF
  $A459  FF        .db $FF
  $A45A  FF        .db $FF
  $A45B  FF        .db $FF
  $A45C  FF        .db $FF
  $A45D  FF        .db $FF
  $A45E  FF        .db $FF
  $A45F  FF        .db $FF
  $A460  00        BRK
  $A461  FF        .db $FF
  $A462  FF        .db $FF
  $A463  AA        TAX
  $A464  00        BRK
  $A465  00        BRK

L_A466:
  $A466  FF        .db $FF
  $A467  FF        .db $FF
  $A468  FF        .db $FF
  $A469  00        BRK
  $A46A  00        BRK
  $A46B  55 FF     EOR $FF,X
  $A46D  00        BRK
  $A46E  FF        .db $FF
  $A46F  FF        .db $FF
  $A470  FF        .db $FF
  $A471  FF        .db $FF
  $A472  FF        .db $FF
  $A473  FF        .db $FF
  $A474  FF        .db $FF
  $A475  FF        .db $FF
  $A476  FF        .db $FF
  $A477  FF        .db $FF
  $A478  FF        .db $FF
  $A479  FF        .db $FF
  $A47A  FF        .db $FF
  $A47B  FF        .db $FF
  $A47C  FF        .db $FF
  $A47D  FF        .db $FF
  $A47E  FF        .db $FF
  $A47F  FF        .db $FF
  $A480  00        BRK
  $A481  01 00     ORA ($00,X)
  $A483  01 00     ORA ($00,X)
  $A485  00        BRK
  $A486  00        BRK
  $A487  00        BRK
  $A488  07        .db $07
  $A489  02        .db $02
  $A48A  07        .db $07
  $A48B  02        .db $02
  $A48C  07        .db $07
  $A48D  00        BRK
  $A48E  05 00     ORA $00
  $A490  00        BRK
  $A491  01 00     ORA ($00,X)

L_A493:
  $A493  01 00     ORA ($00,X)

L_A495:
  $A495  01 00     ORA ($00,X)
  $A497  00        BRK
  $A498  03        .db $03
  $A499  06 03     ASL $03
  $A49B  06 03     ASL $03
  $A49D  06 03     ASL $03
  $A49F  06 00     ASL $00
  $A4A1  00        BRK

L_A4A2:
  $A4A2  00        BRK
  $A4A3  00        BRK

L_A4A4:
  $A4A4  00        BRK
  $A4A5  00        BRK

L_A4A6:
  $A4A6  00        BRK
  $A4A7  00        BRK
  $A4A8  E8        INX
  $A4A9  F0 E8     BEQ $A493
  $A4AB  F0 E8     BEQ $A495
  $A4AD  00        BRK
  $A4AE  E0 00     CPX #$00
  $A4B0  00        BRK
  $A4B1  00        BRK
  $A4B2  00        BRK
  $A4B3  00        BRK
  $A4B4  00        BRK
  $A4B5  00        BRK
  $A4B6  00        BRK
  $A4B7  00        BRK
  $A4B8  F0 E8     BEQ $A4A2
  $A4BA  F0 E8     BEQ $A4A4
  $A4BC  F0 E8     BEQ $A4A6
  $A4BE  B0 48     BCS $A508
  $A4C0  01 02     ORA ($02,X)
  $A4C2  02        .db $02
  $A4C3  04        .db $04
  $A4C4  08        PHP
  $A4C5  13        .db $13
  $A4C6  10 22     BPL $A4EA
  $A4C8  48        PHA
  $A4C9  25 14     AND $14
  $A4CB  0A        ASL
  $A4CC  85 48     STA $48
  $A4CE  6B        .db $6B
  $A4CF  55 24     EOR $24,X
  $A4D1  24 48     BIT $48
  $A4D3  20 10 89  JSR $8910
  $A4D6  4A        LSR
  $A4D7  00        BRK
  $A4D8  13        .db $13
  $A4D9  0B        .db $0B
  $A4DA  A6 46     LDX $46
  $A4DC  AB        .db $AB
  $A4DD  54        .db $54
  $A4DE  94 DE     STY $DE,X
  $A4E0  00        BRK
  $A4E1  20 40 88  JSR $8840
  $A4E4  08        PHP
  $A4E5  14        .db $14
  $A4E6  A4 44     LDY $44
  $A4E8  80        .db $80
  $A4E9  10 28     BPL $A513
  $A4EB  41 96     EOR ($96,X)
  $A4ED  A2 02     LDX #$02
  $A4EF  22        .db $22
  $A4F0  62        .db $62
  $A4F1  22        .db $22
  $A4F2  B2        .db $B2
  $A4F3  B2        .db $B2
  $A4F4  9A        TXS
  $A4F5  9A        TXS
  $A4F6  92        .db $92
  $A4F7  14        .db $14
  $A4F8  04        .db $04
  $A4F9  DC        .db $DC
  $A4FA  4D 4D 65  EOR $654D
  $A4FD  45 6D     EOR $6D
  $A4FF  EB        .db $EB
  $A500  EF        .db $EF
  $A501  F6 F7     INC $F7,X
  $A503  3E A2 34  ROL $34A2,X
  $A506  58        CLI
  $A507  8B        .db $8B

L_A508:
  $A508  FF        .db $FF
  $A509  FD BE D4  SBC $D4BE,X
  $A50C  D8        CLD
  $A50D  C1 83     CMP ($83,X)
  $A50F  B0 23     BCS $A534
  $A511  E7        .db $E7
  $A512  D4        .db $D4

L_A513:
  $A513  46 80     LSR $80
  $A515  20 01 0A  JSR $0A01
  $A518  54        .db $54
  $A519  58        CLI
  $A51A  2B        .db $2B
  $A51B  B0 57     BCS $A574
  $A51D  95 EA     STA $EA,X
  $A51F  D4        .db $D4
  $A520  F7        .db $F7
  $A521  FB        .db $FB
  $A522  6B        .db $6B
  $A523  67        .db $67
  $A524  ED 62 62  SBC $6262
  $A527  56 F7     LSR $F7,X
  $A529  F3        .db $F3
  $A52A  F3        .db $F3
  $A52B  F3        .db $F3
  $A52C  41 CB     EOR ($CB,X)
  $A52E  99 84 15  STA $1584,Y
  $A531  1C        .db $1C
  $A532  39 32 22  AND $2232,Y
  $A535  A5 02     LDA $02
  $A537  91 A7     STA ($A7),Y
  $A539  C3        .db $C3
  $A53A  84 C9     STY $C9
  $A53C  DD 4A 95  CMP $954A,X
  $A53F  2A        ROL
  $A540  00        BRK
  $A541  00        BRK
  $A542  00        BRK
  $A543  00        BRK
  $A544  01 40     ORA ($40,X)
  $A546  20 10 00  JSR $0010
  $A549  00        BRK
  $A54A  31 0A     AND ($0A),Y
  $A54C  02        .db $02
  $A54D  04        .db $04
  $A54E  04        .db $04
  $A54F  00        BRK
  $A550  08        PHP
  $A551  88        DEY
  $A552  44        .db $44
  $A553  24 52     BIT $52
  $A555  4A        LSR
  $A556  8A        TXA
  $A557  00        BRK
  $A558  02        .db $02
  $A559  21 A8     AND ($A8,X)
  $A55B  4A        LSR
  $A55C  24 95     BIT $95
  $A55E  55 FF     EOR $FF,X
  $A560  00        BRK
  $A561  00        BRK
  $A562  00        BRK
  $A563  00        BRK
  $A564  00        BRK
  $A565  80        .db $80
  $A566  48        PHA
  $A567  50 00     BVC $A569

L_A569:
  $A569  04        .db $04
  $A56A  08        PHP
  $A56B  08        PHP
  $A56C  10 10     BPL $A57E
  $A56E  01 02     ORA ($02,X)
  $A570  10 20     BPL $A592
  $A572  22        .db $22
  $A573  62        .db $62

L_A574:
  $A574  44        .db $44
  $A575  44        .db $44
  $A576  98        TYA
  $A577  80        .db $80
  $A578  44        .db $44
  $A579  14        .db $14
  $A57A  88        DEY
  $A57B  88        DEY
  $A57C  28        PLP
  $A57D  18        CLC

L_A57E:
  $A57E  42        .db $42
  $A57F  5A        .db $5A
  $A580  8A        TXA
  $A581  D1 40     CMP ($40),Y
  $A583  08        PHP
  $A584  CE A3 67  DEC $67A3
  $A587  E2        .db $E2
  $A588  54        .db $54
  $A589  0C        .db $0C
  $A58A  9B        .db $9B
  $A58B  D6 21     DEC $21,X
  $A58D  54        .db $54
  $A58E  90 1C     BCC $A5AC
  $A590  98        TYA
  $A591  16 36     ASL $36,X
  $A593  14        .db $14
  $A594  31 2A     AND ($2A),Y
  $A596  82        .db $82
  $A597  C1 24     CMP ($24,X)
  $A599  41 C8     EOR ($C8,X)
  $A59B  EA        NOP
  $A59C  46 85     LSR $85
  $A59E  19 3A C1  ORA $C13A,Y
  $A5A1  8D 8B 09  STA $098B
  $A5A4  90 08     BCC $A5AE
  $A5A6  19 50 1C  ORA $1C50,Y
  $A5A9  50 30     BVC $A5DB
  $A5AB  74        .db $74

L_A5AC:
  $A5AC  2B        .db $2B
  $A5AD  57        .db $57

L_A5AE:
  $A5AE  E2        .db $E2
  $A5AF  AD E7 CD  LDA $CDE7
  $A5B2  67        .db $67
  $A5B3  4E 84 80  LSR $8084
  $A5B6  28        PLP
  $A5B7  42        .db $42
  $A5B8  18        CLC
  $A5B9  12        .db $12
  $A5BA  98        TYA
  $A5BB  A0 53     LDY #$53
  $A5BD  35 43     AND $43,X
  $A5BF  94 0A     STY $0A,X
  $A5C1  D1 40     CMP ($40),Y
  $A5C3  08        PHP
  $A5C4  4A        LSR
  $A5C5  A0 24     LDY #$24
  $A5C7  40        RTI
  $A5C8  D5 2C     CMP $2C,X
  $A5CA  9B        .db $9B
  $A5CB  76 A1     ROR $A1,X
  $A5CD  57        .db $57
  $A5CE  99 AE 98  STA $98AE,Y
  $A5D1  14        .db $14
  $A5D2  25 10     AND $10
  $A5D4  20 2A 82  JSR $822A
  $A5D7  41 27     EOR ($27,X)
  $A5D9  41 DA     EOR ($DA,X)

L_A5DB:
  $A5DB  EE 57 C5  INC $C557
  $A5DE  59 BA 40  EOR $40BA,Y
  $A5E1  04        .db $04
  $A5E2  00        BRK
  $A5E3  09 10     ORA #$10
  $A5E5  00        BRK
  $A5E6  09 00     ORA #$00
  $A5E8  1C        .db $1C
  $A5E9  D9 BB 64  CMP $64BB,Y
  $A5EC  AB        .db $AB
  $A5ED  5E F2 AD  LSR $ADF2,X
  $A5F0  00        BRK
  $A5F1  48        PHA
  $A5F2  01 00     ORA ($00,X)
  $A5F4  00        BRK
  $A5F5  80        .db $80
  $A5F6  08        PHP
  $A5F7  42        .db $42
  $A5F8  FB        .db $FB
  $A5F9  96 FC     STX $FC,Y
  $A5FB  AE D7 34  LDX $34D7
  $A5FE  63        .db $63
  $A5FF  94 8A     STY $8A,X
  $A601  D1 40     CMP ($40),Y
  $A603  08        PHP
  $A604  C6 81     DEC $81
  $A606  22        .db $22
  $A607  40        RTI
  $A608  55 2C     EOR $2C,X
  $A60A  9B        .db $9B
  $A60B  F6 29     INC $29,X
  $A60D  76 9D     ROR $9D,X
  $A60F  BE 88 02  LDX $0288,Y
  $A612  20 14 21  JSR $2114
  $A615  00        BRK
  $A616  02        .db $02
  $A617  00        BRK
  $A618  35 55     AND $55,X
  $A61A  DF        .db $DF
  $A61B  EA        NOP
  $A61C  56 ED     LSR $ED,X
  $A61E  59 FB 40  EOR $40FB,Y
  $A621  80        .db $80
  $A622  88        DEY
  $A623  00        BRK
  $A624  90 00     BCC $A626

L_A626:
  $A626  09 00     ORA #$00
  $A628  9D 55 32  STA $3255,X
  $A62B  7D 2B 57  ADC $572B,X
  $A62E  F2        .db $F2
  $A62F  DD 20 04  CMP $0420,X
  $A632  00        BRK
  $A633  08        PHP
  $A634  04        .db $04
  $A635  00        BRK
  $A636  08        PHP
  $A637  02        .db $02
  $A638  D7        .db $D7
  $A639  59 FB A4  EOR $A4FB,Y
  $A63C  D3        .db $D3
  $A63D  B5 63     LDA $63,X
  $A63F  D4        .db $D4
  $A640  09 48     ORA #$48
  $A642  4C 56 80  JMP $8056
  $A645  23        .db $23
  $A646  04        .db $04
  $A647  52        .db $52
  $A648  52        .db $52
  $A649  05 A0     ORA $A0
  $A64B  89        .db $89
  $A64C  17        .db $17
  $A64D  88        DEY
  $A64E  69 A0     ADC #$A0
  $A650  10 28     BPL $A67A
  $A652  10 00     BPL $A654

L_A654:
  $A654  00        BRK
  $A655  00        BRK
  $A656  00        BRK
  $A657  00        BRK
  $A658  AA        TAX
  $A659  13        .db $13
  $A65A  48        PHA
  $A65B  56 23     LSR $23,X
  $A65D  2C 05 91  BIT $9105

L_A660:
  $A660  99 1D 33  STA $331D,Y
  $A663  3A        .db $3A
  $A664  2A        ROL
  $A665  11 08     ORA ($08),Y
  $A667  42        .db $42
  $A668  44        .db $44
  $A669  20 CC 41  JSR $41CC
  $A66C  91 AC     STA ($AC),Y
  $A66E  56 A5     LSR $A5,X
  $A670  24 C4     BIT $C4
  $A672  A0 20     LDY #$20
  $A674  90 08     BCC $A67E
  $A676  08        PHP
  $A677  00        BRK
  $A678  DB        .db $DB
  $A679  11 52     ORA ($52),Y
  $A67B  C6 2D     DEC $2D
  $A67D  D4        .db $D4

L_A67E:
  $A67E  92        .db $92
  $A67F  24 02     BIT $02
  $A681  0A        ASL
  $A682  28        PLP
  $A683  08        PHP
  $A684  12        .db $12
  $A685  04        .db $04
  $A686  18        CLC
  $A687  20 94 00  JSR $0094
  $A68A  02        .db $02
  $A68B  24 48     BIT $48
  $A68D  41 80     EOR ($80,X)
  $A68F  D2        .db $D2
  $A690  00        BRK
  $A691  00        BRK
  $A692  01 00     ORA ($00,X)
  $A694  00        BRK
  $A695  00        BRK
  $A696  00        BRK
  $A697  00        BRK
  $A698  61 AA     ADC ($AA,X)
  $A69A  4A        LSR
  $A69B  C4 D1     CPY $D1
  $A69D  9D 6B CA  STA $CA6B,X
  $A6A0  09 09     ORA #$09
  $A6A2  15 54     ORA $54,X
  $A6A4  40        RTI
  $A6A5  27        .db $27
  $A6A6  08        PHP
  $A6A7  62        .db $62
  $A6A8  90 B6     BCC $A660
  $A6AA  28        PLP
  $A6AB  8A        TXA
  $A6AC  97        .db $97
  $A6AD  40        RTI
  $A6AE  07        .db $07
  $A6AF  11 64     ORA ($64),Y
  $A6B1  80        .db $80
  $A6B2  00        BRK
  $A6B3  00        BRK
  $A6B4  00        BRK
  $A6B5  00        BRK
  $A6B6  00        BRK
  $A6B7  00        BRK
  $A6B8  01 28     ORA ($28,X)
  $A6BA  13        .db $13
  $A6BB  99 58 EA  STA $EA58,Y
  $A6BE  51 7B     EOR ($7B),Y
  $A6C0  19 48 20  ORA $2048,Y
  $A6C3  29 80     AND #$80
  $A6C5  15 40     ORA $40,X
  $A6C7  82        .db $82
  $A6C8  86 B2     STX $B2
  $A6CA  1E 44 56  ASL $5644,X
  $A6CD  60        RTS
  $A6CE  AA        TAX

L_A6CF:
  $A6CF  58        CLI
  $A6D0  04        .db $04
  $A6D1  52        .db $52
  $A6D2  02        .db $02
  $A6D3  00        BRK
  $A6D4  00        BRK
  $A6D5  00        BRK
  $A6D6  00        BRK
  $A6D7  00        BRK
  $A6D8  70 A0     BVS $A67A
  $A6DA  48        PHA
  $A6DB  40        RTI
  $A6DC  90 05     BCC $A6E3
  $A6DE  02        .db $02
  $A6DF  08        PHP
  $A6E0  00        BRK
  $A6E1  00        BRK
  $A6E2  C0 30     CPY #$30
  $A6E4  00        BRK
  $A6E5  84 80     STY $80
  $A6E7  00        BRK
  $A6E8  98        TYA
  $A6E9  A1 10     LDA ($10,X)
  $A6EB  4C 09 00  JMP $0009
  $A6EE  4B        .db $4B
  $A6EF  65 00     ADC $00
  $A6F1  00        BRK
  $A6F2  00        BRK
  $A6F3  00        BRK
  $A6F4  00        BRK
  $A6F5  00        BRK
  $A6F6  00        BRK
  $A6F7  00        BRK
  $A6F8  23        .db $23
  $A6F9  56 0B     LSR $0B,X
  $A6FB  91 58     STA ($58),Y
  $A6FD  6A        ROR
  $A6FE  51 3B     EOR ($3B),Y
  $A700  FF        .db $FF
  $A701  FF        .db $FF
  $A702  FF        .db $FF
  $A703  FF        .db $FF
  $A704  FF        .db $FF
  $A705  FF        .db $FF
  $A706  FF        .db $FF
  $A707  FF        .db $FF
  $A708  FF        .db $FF
  $A709  FF        .db $FF
  $A70A  FF        .db $FF
  $A70B  FF        .db $FF
  $A70C  FF        .db $FF
  $A70D  FF        .db $FF
  $A70E  FB        .db $FB
  $A70F  FB        .db $FB
  $A710  F7        .db $F7
  $A711  F7        .db $F7
  $A712  F3        .db $F3
  $A713  FC        .db $FC
  $A714  DC        .db $DC
  $A715  D7        .db $D7
  $A716  C1 A0     CMP ($A0,X)
  $A718  FB        .db $FB
  $A719  F9 FC FB  SBC $FBFC,Y
  $A71C  FB        .db $FB
  $A71D  FC        .db $FC
  $A71E  FC        .db $FC
  $A71F  D7        .db $D7
  $A720  FF        .db $FF
  $A721  FF        .db $FF
  $A722  FF        .db $FF
  $A723  FF        .db $FF
  $A724  EF        .db $EF
  $A725  FF        .db $FF
  $A726  DD C9 FF  CMP $FFC9,X
  $A729  FF        .db $FF
  $A72A  FF        .db $FF
  $A72B  FB        .db $FB
  $A72C  F9 E4 E4  SBC $E4E4,Y
  $A72F  F2        .db $F2
  $A730  83        .db $83
  $A731  B1 D1     LDA ($D1),Y
  $A733  90 08     BCC $A73D
  $A735  10 98     BPL $A6CF
  $A737  0A        ASL
  $A738  38        SEC
  $A739  0A        ASL
  $A73A  0C        .db $0C
  $A73B  2E D5 EA  ROL $EAD5
  $A73E  47        .db $47
  $A73F  B5 FF     LDA $FF,X
  $A741  FF        .db $FF
  $A742  FF        .db $FF
  $A743  3F        .db $3F
  $A744  3B        .db $3B
  $A745  EB        .db $EB
  $A746  83        .db $83
  $A747  05 FF     ORA $FF
  $A749  9F        .db $9F
  $A74A  DF        .db $DF
  $A74B  DF        .db $DF
  $A74C  DF        .db $DF
  $A74D  3F        .db $3F
  $A74E  3F        .db $3F
  $A74F  EB        .db $EB
  $A750  05 4A     ORA $4A
  $A752  E5 C6     SBC $C6
  $A754  94 A5     STY $A5,X
  $A756  24 88     BIT $88
  $A758  BA        TSX
  $A759  12        .db $12
  $A75A  14        .db $14
  $A75B  39 61 4A  AND $4A61,Y
  $A75E  DA        .db $DA
  $A75F  56 FF     LSR $FF,X
  $A761  FF        .db $FF
  $A762  FF        .db $FF
  $A763  FF        .db $FF
  $A764  FF        .db $FF
  $A765  FF        .db $FF
  $A766  FF        .db $FF
  $A767  BF        .db $BF
  $A768  FF        .db $FF
  $A769  FF        .db $FF
  $A76A  FF        .db $FF
  $A76B  FF        .db $FF
  $A76C  FF        .db $FF
  $A76D  FF        .db $FF
  $A76E  9F        .db $9F
  $A76F  7F        .db $7F
  $A770  BF        .db $BF
  $A771  BF        .db $BF
  $A772  7F        .db $7F
  $A773  FF        .db $FF
  $A774  F7        .db $F7
  $A775  FF        .db $FF
  $A776  BB        .db $BB
  $A777  93        .db $93
  $A778  7F        .db $7F
  $A779  7F        .db $7F
  $A77A  FF        .db $FF
  $A77B  DF        .db $DF
  $A77C  9F        .db $9F
  $A77D  27        .db $27
  $A77E  27        .db $27
  $A77F  4F        .db $4F
  $A780  00        BRK
  $A781  00        BRK
  $A782  00        BRK
  $A783  00        BRK
  $A784  00        BRK
  $A785  00        BRK
  $A786  00        BRK
  $A787  00        BRK
  $A788  20 42 11  JSR $1142
  $A78B  01 00     ORA ($00,X)
  $A78D  06 08     ASL $08
  $A78F  01 00     ORA ($00,X)
  $A791  00        BRK
  $A792  00        BRK
  $A793  00        BRK
  $A794  00        BRK
  $A795  00        BRK
  $A796  00        BRK
  $A797  00        BRK
  $A798  01 00     ORA ($00,X)
  $A79A  00        BRK
  $A79B  00        BRK
  $A79C  00        BRK
  $A79D  00        BRK
  $A79E  00        BRK
  $A79F  00        BRK
  $A7A0  00        BRK
  $A7A1  00        BRK
  $A7A2  00        BRK
  $A7A3  00        BRK
  $A7A4  00        BRK
  $A7A5  00        BRK

L_A7A6:
  $A7A6  00        BRK
  $A7A7  00        BRK
  $A7A8  D1 82     CMP ($82),Y
  $A7AA  4A        LSR
  $A7AB  21 24     AND ($24,X)
  $A7AD  46 94     LSR $94
  $A7AF  02        .db $02
  $A7B0  00        BRK
  $A7B1  00        BRK
  $A7B2  00        BRK
  $A7B3  00        BRK
  $A7B4  00        BRK
  $A7B5  00        BRK
  $A7B6  00        BRK
  $A7B7  00        BRK
  $A7B8  11 08     ORA ($08),Y
  $A7BA  00        BRK
  $A7BB  00        BRK
  $A7BC  00        BRK
  $A7BD  00        BRK
  $A7BE  00        BRK
  $A7BF  00        BRK
  $A7C0  00        BRK
  $A7C1  00        BRK
  $A7C2  00        BRK
  $A7C3  00        BRK
  $A7C4  00        BRK
  $A7C5  00        BRK
  $A7C6  00        BRK
  $A7C7  00        BRK
  $A7C8  8B        .db $8B
  $A7C9  41 56     EOR ($56,X)
  $A7CB  80        .db $80
  $A7CC  24 63     BIT $63
  $A7CE  29 45     AND #$45
  $A7D0  00        BRK
  $A7D1  00        BRK
  $A7D2  00        BRK
  $A7D3  00        BRK
  $A7D4  00        BRK
  $A7D5  00        BRK
  $A7D6  00        BRK
  $A7D7  00        BRK
  $A7D8  49 A4     EOR #$A4
  $A7DA  A2 20     LDX #$20
  $A7DC  02        .db $02
  $A7DD  00        BRK
  $A7DE  00        BRK
  $A7DF  00        BRK
  $A7E0  00        BRK
  $A7E1  00        BRK
  $A7E2  00        BRK
  $A7E3  00        BRK
  $A7E4  00        BRK
  $A7E5  00        BRK
  $A7E6  00        BRK
  $A7E7  00        BRK
  $A7E8  04        .db $04
  $A7E9  52        .db $52
  $A7EA  88        DEY
  $A7EB  88        DEY
  $A7EC  40        RTI
  $A7ED  20 00 C0  JSR $C000
  $A7F0  00        BRK
  $A7F1  00        BRK
  $A7F2  00        BRK
  $A7F3  00        BRK
  $A7F4  00        BRK
  $A7F5  00        BRK
  $A7F6  00        BRK
  $A7F7  00        BRK
  $A7F8  30 10     BMI $A80A
  $A7FA  10 00     BPL $A7FC

L_A7FC:
  $A7FC  00        BRK
  $A7FD  00        BRK
  $A7FE  00        BRK
  $A7FF  00        BRK
  $A800  BF        .db $BF
  $A801  DF        .db $DF
  $A802  BB        .db $BB
  $A803  7F        .db $7F
  $A804  6C 1A 3F  JMP ($3F1A)
  $A807  5E BF DF  LSR $DFBF,X

L_A80A:
  $A80A  BB        .db $BB
  $A80B  7F        .db $7F
  $A80C  6F        .db $6F
  $A80D  1F        .db $1F
  $A80E  3F        .db $3F
  $A80F  5F        .db $5F
  $A810  EA        NOP
  $A811  FB        .db $FB
  $A812  76 3E     ROR $3E,X
  $A814  ED 7E 3A  SBC $3A7E
  $A817  55 FF     EOR $FF,X
  $A819  FF        .db $FF
  $A81A  7F        .db $7F
  $A81B  3F        .db $3F
  $A81C  EF        .db $EF
  $A81D  7F        .db $7F
  $A81E  3F        .db $3F
  $A81F  5F        .db $5F
  $A820  FC        .db $FC
  $A821  F0 83     BEQ $A7A6
  $A823  4C 30 C3  JMP $C330
  $A826  8C 30 FF  STY $FF30
  $A829  FF        .db $FF
  $A82A  FF        .db $FF
  $A82B  FF        .db $FF
  $A82C  FF        .db $FF
  $A82D  FF        .db $FF
  $A82E  FF        .db $FF
  $A82F  FF        .db $FF
  $A830  81 43     STA ($43,X)
  $A832  0C        .db $0C
  $A833  F1 07     SBC ($07),Y
  $A835  3F        .db $3F
  $A836  FF        .db $FF
  $A837  FF        .db $FF
  $A838  FF        .db $FF
  $A839  FF        .db $FF
  $A83A  FF        .db $FF
  $A83B  FF        .db $FF
  $A83C  FF        .db $FF
  $A83D  FF        .db $FF

L_A83E:
  $A83E  FF        .db $FF
  $A83F  FF        .db $FF
  $A840  83        .db $83
  $A841  07        .db $07
  $A842  1F        .db $1F
  $A843  3C        .db $3C
  $A844  70 C0     BVS $A806
  $A846  83        .db $83
  $A847  0C        .db $0C
  $A848  FF        .db $FF
  $A849  FF        .db $FF
  $A84A  FF        .db $FF
  $A84B  FF        .db $FF
  $A84C  FF        .db $FF
  $A84D  FF        .db $FF
  $A84E  FF        .db $FF
  $A84F  FF        .db $FF
  $A850  10 23     BPL $A875
  $A852  44        .db $44
  $A853  88        DEY
  $A854  31 C6     AND ($C6),Y
  $A856  38        SEC
  $A857  C1 FF     CMP ($FF,X)
  $A859  FF        .db $FF
  $A85A  FF        .db $FF
  $A85B  FF        .db $FF
  $A85C  FF        .db $FF
  $A85D  FF        .db $FF
  $A85E  FF        .db $FF
  $A85F  FF        .db $FF
  $A860  FE FF DC  INC $DCFF,X
  $A863  AE 3C DE  LDX $DE3C
  $A866  2E BF FE  ROL $FEBF
  $A869  FF        .db $FF
  $A86A  FC        .db $FC
  $A86B  FE FC FE  INC $FEFC,X
  $A86E  FE FF EF  INC $EFFF,X
  $A871  5E 7C F6  LSR $F67C,X
  $A874  1D BA EC  ORA $ECBA,X
  $A877  F8        SED
  $A878  FF        .db $FF
  $A879  FE FC FE  INC $FEFC,X
  $A87C  FD FA EC  SBC $ECFA,X
  $A87F  F8        SED
  $A880  F3        .db $F3
  $A881  67        .db $67
  $A882  DF        .db $DF
  $A883  F8        SED
  $A884  70 B8     BVS $A83E
  $A886  77        .db $77
  $A887  6E FF 7F  ROR $7FFF
  $A88A  FF        .db $FF
  $A88B  FF        .db $FF
  $A88C  7F        .db $7F
  $A88D  FF        .db $FF
  $A88E  7F        .db $7F
  $A88F  7F        .db $7F
  $A890  BD 3F F7  LDA $F73F,X
  $A893  BF        .db $BF
  $A894  57        .db $57
  $A895  45 23     EOR $23
  $A897  00        BRK
  $A898  BF        .db $BF
  $A899  7F        .db $7F
  $A89A  FF        .db $FF
  $A89B  BF        .db $BF
  $A89C  57        .db $57
  $A89D  45 23     EOR $23
  $A89F  00        BRK
  $A8A0  EE D7 BD  INC $BDD7
  $A8A3  36 3F     ROL $3F,X
  $A8A5  DD 36 6C  CMP $6C36,X
  $A8A8  FE FF FD  INC $FDFF,X
  $A8AB  FE FF FD  INC $FDFF,X
  $A8AE  F6 FC     INC $FC,X
  $A8B0  DE B3 CE  DEC $CEB3,X
  $A8B3  7A        .db $7A
  $A8B4  A9 C1     LDA #$C1
  $A8B6  88        DEY
  $A8B7  80        .db $80
  $A8B8  FE B3 CE  INC $CEB3,X
  $A8BB  7A        .db $7A
  $A8BC  A9 C1     LDA #$C1
  $A8BE  88        DEY
  $A8BF  80        .db $80
  $A8C0  63        .db $63
  $A8C1  C7        .db $C7
  $A8C2  FF        .db $FF
  $A8C3  7C        .db $7C
  $A8C4  30 D0     BMI $A896

L_A8C6:
  $A8C6  E3        .db $E3
  $A8C7  EC 7F FF  CPX $FF7F
  $A8CA  FF        .db $FF
  $A8CB  7F        .db $7F
  $A8CC  3F        .db $3F
  $A8CD  FF        .db $FF
  $A8CE  FF        .db $FF
  $A8CF  FF        .db $FF
  $A8D0  50 F3     BVC $A8C5
  $A8D2  A4 48     LDY $48
  $A8D4  F1 46     SBC ($46),Y
  $A8D6  F8        SED
  $A8D7  61 7F     ADC ($7F,X)
  $A8D9  FF        .db $FF
  $A8DA  FF        .db $FF
  $A8DB  7F        .db $7F
  $A8DC  FF        .db $FF
  $A8DD  7F        .db $7F
  $A8DE  FF        .db $FF
  $A8DF  7F        .db $7F
  $A8E0  FB        .db $FB
  $A8E1  F6 83     INC $83,X
  $A8E3  0E 34 DE  ASL $DE34
  $A8E6  0F        .db $0F
  $A8E7  3F        .db $3F
  $A8E8  FF        .db $FF

L_A8E9:
  $A8E9  FE FF FE  INC $FEFF,X
  $A8EC  FC        .db $FC
  $A8ED  FE FF FF  INC $FFFF,X
  $A8F0  D6 1C     DEC $1C,X
  $A8F2  39 DF 2A  AND $2ADF,Y
  $A8F5  1F        .db $1F
  $A8F6  FC        .db $FC
  $A8F7  FF        .db $FF
  $A8F8  FE FC F9  INC $F9FC,X
  $A8FB  FF        .db $FF
  $A8FC  FE FF FC  INC $FCFF,X
  $A8FF  FF        .db $FF
  $A900  83        .db $83
  $A901  07        .db $07
  $A902  1F        .db $1F
  $A903  3C        .db $3C
  $A904  70 C0     BVS $A8C6
  $A906  83        .db $83
  $A907  0C        .db $0C
  $A908  FF        .db $FF
  $A909  FF        .db $FF
  $A90A  FF        .db $FF
  $A90B  FF        .db $FF
  $A90C  FF        .db $FF
  $A90D  FF        .db $FF
  $A90E  FF        .db $FF
  $A90F  FF        .db $FF
  $A910  10 A3     BPL $A8B5
  $A912  C4 88     CPY $88
  $A914  F1 C6     SBC ($C6),Y
  $A916  78        SEI
  $A917  C1 FF     CMP ($FF,X)
  $A919  FF        .db $FF
  $A91A  FF        .db $FF
  $A91B  FF        .db $FF
  $A91C  FF        .db $FF
  $A91D  FF        .db $FF
  $A91E  7F        .db $7F
  $A91F  FF        .db $FF
  $A920  FC        .db $FC
  $A921  F0 83     BEQ $A8A6
  $A923  0C        .db $0C
  $A924  30 C3     BMI $A8E9
  $A926  0C        .db $0C
  $A927  30 FF     BMI $A928
  $A929  FF        .db $FF
  $A92A  FF        .db $FF
  $A92B  FF        .db $FF
  $A92C  FF        .db $FF
  $A92D  FF        .db $FF
  $A92E  FF        .db $FF
  $A92F  FF        .db $FF
  $A930  C1 03     CMP ($03,X)
  $A932  0C        .db $0C
  $A933  F1 07     SBC ($07),Y
  $A935  3D FE FF  AND $FFFE,X
  $A938  FF        .db $FF
  $A939  FF        .db $FF
  $A93A  FF        .db $FF
  $A93B  FF        .db $FF
  $A93C  FF        .db $FF
  $A93D  FD FE FF  SBC $FFFE,X
  $A940  00        BRK
  $A941  00        BRK
  $A942  00        BRK
  $A943  00        BRK
  $A944  00        BRK
  $A945  00        BRK
  $A946  00        BRK
  $A947  00        BRK
  $A948  54        .db $54
  $A949  4A        LSR
  $A94A  8D 34 2A  STA $2A34
  $A94D  15 A4     ORA $A4,X
  $A94F  18        CLC
  $A950  00        BRK
  $A951  00        BRK
  $A952  00        BRK

L_A953:
  $A953  00        BRK
  $A954  00        BRK
  $A955  00        BRK
  $A956  00        BRK
  $A957  00        BRK
  $A958  45 92     EOR $92
  $A95A  12        .db $12
  $A95B  24 A1     BIT $A1
  $A95D  04        .db $04
  $A95E  40        RTI
  $A95F  08        PHP
  $A960  00        BRK
  $A961  00        BRK
  $A962  00        BRK
  $A963  00        BRK
  $A964  00        BRK
  $A965  00        BRK
  $A966  00        BRK
  $A967  00        BRK
  $A968  19 B5 3C  ORA $3CB5,Y
  $A96B  EA        NOP
  $A96C  55 55     EOR $55,X
  $A96E  1B        .db $1B
  $A96F  93        .db $93
  $A970  00        BRK
  $A971  00        BRK
  $A972  00        BRK
  $A973  00        BRK
  $A974  00        BRK
  $A975  00        BRK
  $A976  00        BRK
  $A977  00        BRK
  $A978  C5 6E     CMP $6E
  $A97A  26 42     ROL $42
  $A97C  52        .db $52
  $A97D  00        BRK
  $A97E  40        RTI
  $A97F  00        BRK
  $A980  00        BRK
  $A981  00        BRK
  $A982  00        BRK
  $A983  00        BRK
  $A984  00        BRK
  $A985  00        BRK
  $A986  00        BRK
  $A987  00        BRK
  $A988  54        .db $54
  $A989  4A        LSR
  $A98A  8D 34 AA  STA $AA34
  $A98D  15 B4     ORA $B4,X
  $A98F  D8        CLD
  $A990  00        BRK
  $A991  00        BRK
  $A992  00        BRK
  $A993  00        BRK
  $A994  00        BRK
  $A995  00        BRK
  $A996  00        BRK
  $A997  00        BRK
  $A998  55 AA     EOR $AA,X
  $A99A  46 64     LSR $64
  $A99C  D1 95     CMP ($95),Y
  $A99E  6B        .db $6B
  $A99F  D9 00 00  CMP $0000,Y
  $A9A2  00        BRK
  $A9A3  00        BRK
  $A9A4  00        BRK
  $A9A5  00        BRK
  $A9A6  00        BRK
  $A9A7  00        BRK
  $A9A8  19 B5 3C  ORA $3CB5,Y
  $A9AB  EA        NOP
  $A9AC  55 55     EOR $55,X
  $A9AE  3B        .db $3B
  $A9AF  93        .db $93
  $A9B0  00        BRK
  $A9B1  00        BRK
  $A9B2  00        BRK
  $A9B3  00        BRK
  $A9B4  00        BRK
  $A9B5  00        BRK
  $A9B6  00        BRK
  $A9B7  00        BRK
  $A9B8  E5 6E     SBC $6E
  $A9BA  1B        .db $1B
  $A9BB  89        .db $89
  $A9BC  58        CLI
  $A9BD  E2        .db $E2
  $A9BE  41 2B     EOR ($2B,X)
  $A9C0  EF        .db $EF
  $A9C1  B4 C7     LDY $C7,X
  $A9C3  6E 80 24  ROR $2480
  $A9C6  50 8B     BVC $A953
  $A9C8  FB        .db $FB
  $A9C9  FF        .db $FF
  $A9CA  AE C4 FA  LDX $FAC4
  $A9CD  D1 8B     CMP ($8B),Y
  $A9CF  B0 02     BCS $A9D3
  $A9D1  E7        .db $E7
  $A9D2  94 46     STY $46,X
  $A9D4  80        .db $80
  $A9D5  20 01 0A  JSR $0A01
  $A9D8  75 58     ADC $58,X
  $A9DA  6B        .db $6B
  $A9DB  B0 57     BCS $AA34
  $A9DD  95 EA     STA $EA,X
  $A9DF  D4        .db $D4
  $A9E0  37        .db $37
  $A9E1  B3        .db $B3
  $A9E2  23        .db $23
  $A9E3  63        .db $63
  $A9E4  E1 62     SBC ($62,X)
  $A9E6  62        .db $62
  $A9E7  56 B7     LSR $B7,X
  $A9E9  7B        .db $7B
  $A9EA  FB        .db $FB
  $A9EB  B7        .db $B7
  $A9EC  4D CB 99  EOR $99CB
  $A9EF  84 15     STY $15
  $A9F1  14        .db $14
  $A9F2  20 00 23  JSR $2300
  $A9F5  A5 00     LDA $00
  $A9F7  91 A7     STA ($A7),Y
  $A9F9  CB        .db $CB
  $A9FA  9D FB DD  STA $DDFB,X
  $A9FD  4A        LSR
  $A9FE  97        .db $97
  $A9FF  2A        ROL
  $AA00  90 00     BCC $AA02

L_AA02:
  $AA02  03        .db $03
  $AA03  1B        .db $1B
  $AA04  7F        .db $7F
  $AA05  7F        .db $7F
  $AA06  FF        .db $FF
  $AA07  FF        .db $FF
  $AA08  FF        .db $FF
  $AA09  FF        .db $FF
  $AA0A  FF        .db $FF
  $AA0B  FF        .db $FF
  $AA0C  FF        .db $FF
  $AA0D  FF        .db $FF
  $AA0E  FF        .db $FF
  $AA0F  FF        .db $FF
  $AA10  FF        .db $FF
  $AA11  FF        .db $FF
  $AA12  FF        .db $FF
  $AA13  FF        .db $FF
  $AA14  FF        .db $FF
  $AA15  FF        .db $FF
  $AA16  FF        .db $FF
  $AA17  FF        .db $FF
  $AA18  FF        .db $FF
  $AA19  FF        .db $FF
  $AA1A  FF        .db $FF
  $AA1B  FF        .db $FF
  $AA1C  FF        .db $FF
  $AA1D  FF        .db $FF
  $AA1E  FF        .db $FF
  $AA1F  FF        .db $FF
  $AA20  21 00     AND ($00,X)
  $AA22  30 7A     BMI $AA9E
  $AA24  FA        .db $FA
  $AA25  FE FF FF  INC $FFFF,X
  $AA28  FF        .db $FF
  $AA29  FF        .db $FF
  $AA2A  FF        .db $FF
  $AA2B  FF        .db $FF
  $AA2C  FF        .db $FF
  $AA2D  FF        .db $FF
  $AA2E  FF        .db $FF
  $AA2F  FF        .db $FF
  $AA30  FF        .db $FF
  $AA31  FF        .db $FF
  $AA32  FF        .db $FF
  $AA33  FF        .db $FF

L_AA34:
  $AA34  FF        .db $FF
  $AA35  FF        .db $FF
  $AA36  FF        .db $FF
  $AA37  FF        .db $FF
  $AA38  FF        .db $FF
  $AA39  FF        .db $FF
  $AA3A  FF        .db $FF
  $AA3B  FF        .db $FF
  $AA3C  FF        .db $FF
  $AA3D  FF        .db $FF
  $AA3E  FF        .db $FF
  $AA3F  FF        .db $FF
  $AA40  FF        .db $FF
  $AA41  FF        .db $FF
  $AA42  FF        .db $FF
  $AA43  FF        .db $FF
  $AA44  FF        .db $FF
  $AA45  FF        .db $FF
  $AA46  FF        .db $FF
  $AA47  FF        .db $FF
  $AA48  FF        .db $FF
  $AA49  FF        .db $FF
  $AA4A  FF        .db $FF
  $AA4B  FF        .db $FF
  $AA4C  FF        .db $FF
  $AA4D  FF        .db $FF
  $AA4E  FF        .db $FF
  $AA4F  FF        .db $FF
  $AA50  FF        .db $FF
  $AA51  BF        .db $BF
  $AA52  BF        .db $BF
  $AA53  3C        .db $3C
  $AA54  5C        .db $5C
  $AA55  0A        ASL
  $AA56  08        PHP
  $AA57  00        BRK
  $AA58  FF        .db $FF
  $AA59  BF        .db $BF
  $AA5A  BF        .db $BF
  $AA5B  3C        .db $3C
  $AA5C  5C        .db $5C
  $AA5D  0A        ASL
  $AA5E  08        PHP
  $AA5F  00        BRK
  $AA60  FF        .db $FF
  $AA61  FF        .db $FF
  $AA62  FF        .db $FF
  $AA63  FF        .db $FF
  $AA64  FF        .db $FF
  $AA65  FF        .db $FF
  $AA66  FF        .db $FF
  $AA67  FF        .db $FF
  $AA68  FF        .db $FF
  $AA69  FF        .db $FF
  $AA6A  FF        .db $FF
  $AA6B  FF        .db $FF
  $AA6C  FF        .db $FF
  $AA6D  FF        .db $FF
  $AA6E  FF        .db $FF
  $AA6F  FF        .db $FF
  $AA70  FD FF ED  SBC $EDFF,X
  $AA73  E4 A0     CPX $A0
  $AA75  08        PHP
  $AA76  00        BRK
  $AA77  80        .db $80
  $AA78  FD FF ED  SBC $EDFF,X
  $AA7B  E4 A0     CPX $A0
  $AA7D  08        PHP
  $AA7E  00        BRK
  $AA7F  80        .db $80
  $AA80  7F        .db $7F
  $AA81  DF        .db $DF
  $AA82  A7        .db $A7
  $AA83  C7        .db $C7
  $AA84  E7        .db $E7
  $AA85  E3        .db $E3
  $AA86  C3        .db $C3
  $AA87  C2        .db $C2
  $AA88  F8        SED
  $AA89  FF        .db $FF
  $AA8A  CF        .db $CF
  $AA8B  CF        .db $CF
  $AA8C  FF        .db $FF
  $AA8D  FF        .db $FF
  $AA8E  FF        .db $FF
  $AA8F  DE C2 C0  DEC $C0C2,X
  $AA92  80        .db $80
  $AA93  80        .db $80
  $AA94  A0 80     LDY #$80
  $AA96  00        BRK
  $AA97  00        BRK
  $AA98  7E 7F 7F  ROR $7F7F,X
  $AA9B  7F        .db $7F
  $AA9C  4F        .db $4F
  $AA9D  4F        .db $4F

L_AA9E:
  $AA9E  FF        .db $FF
  $AA9F  00        BRK
  $AAA0  FF        .db $FF
  $AAA1  FF        .db $FF
  $AAA2  FF        .db $FF
  $AAA3  FF        .db $FF
  $AAA4  F3        .db $F3
  $AAA5  F3        .db $F3
  $AAA6  B1 A0     LDA ($A0),Y
  $AAA8  14        .db $14
  $AAA9  FF        .db $FF
  $AAAA  FF        .db $FF
  $AAAB  FF        .db $FF
  $AAAC  FB        .db $FB
  $AAAD  F7        .db $F7
  $AAAE  BF        .db $BF
  $AAAF  EF        .db $EF
  $AAB0  20 00 00  JSR $0000
  $AAB3  00        BRK
  $AAB4  00        BRK
  $AAB5  00        BRK
  $AAB6  00        BRK
  $AAB7  00        BRK
  $AAB8  FF        .db $FF
  $AAB9  FF        .db $FF
  $AABA  FF        .db $FF
  $AABB  FF        .db $FF
  $AABC  FF        .db $FF
  $AABD  FF        .db $FF
  $AABE  FF        .db $FF
  $AABF  00        BRK
  $AAC0  FF        .db $FF
  $AAC1  FF        .db $FF
  $AAC2  FF        .db $FF
  $AAC3  FB        .db $FB
  $AAC4  BB        .db $BB
  $AAC5  31 11     AND ($11),Y
  $AAC7  01 30     ORA ($30,X)
  $AAC9  FF        .db $FF
  $AACA  FF        .db $FF
  $AACB  FB        .db $FB
  $AACC  FB        .db $FB
  $AACD  FF        .db $FF
  $AACE  F7        .db $F7
  $AACF  FF        .db $FF
  $AAD0  00        BRK
  $AAD1  00        BRK
  $AAD2  00        BRK
  $AAD3  00        BRK
  $AAD4  00        BRK
  $AAD5  00        BRK
  $AAD6  00        BRK
  $AAD7  00        BRK
  $AAD8  FF        .db $FF
  $AAD9  FF        .db $FF
  $AADA  FF        .db $FF
  $AADB  FF        .db $FF
  $AADC  FF        .db $FF
  $AADD  FF        .db $FF
  $AADE  FF        .db $FF
  $AADF  00        BRK
  $AAE0  FC        .db $FC
  $AAE1  F6 FA     INC $FA,X
  $AAE3  D2        .db $D2
  $AAE4  DE 9E 96  DEC $969E,X
  $AAE7  86 9E     STX $9E
  $AAE9  FE F2 F2  INC $F2F2,X
  $AAEC  DE BE BE  DEC $BEBE,X
  $AAEF  FE 84 80  INC $8084,X
  $AAF2  00        BRK
  $AAF3  00        BRK
  $AAF4  08        PHP
  $AAF5  00        BRK
  $AAF6  00        BRK
  $AAF7  00        BRK
  $AAF8  FC        .db $FC
  $AAF9  FE FE FE  INC $FEFE,X
  $AAFC  F2        .db $F2
  $AAFD  F2        .db $F2
  $AAFE  FE 00 E6  INC $E600,X
  $AB01  E4 E6     CPX $E6
  $AB03  E4 A6     CPX $A6
  $AB05  26 06     ROL $06
  $AB07  00        BRK
  $AB08  29 EB     AND #$EB
  $AB0A  E9 EB     SBC #$EB
  $AB0C  E9 EB     SBC #$EB
  $AB0E  EF        .db $EF
  $AB0F  E0 06     CPX #$06
  $AB11  0F        .db $0F
  $AB12  0F        .db $0F
  $AB13  0D 06 0C  ORA $0C06
  $AB16  06 04     ASL $04
  $AB18  EF        .db $EF
  $AB19  EF        .db $EF
  $AB1A  EF        .db $EF
  $AB1B  EF        .db $EF
  $AB1C  E9 EB     SBC #$EB
  $AB1E  E9 0B     SBC #$0B
  $AB20  3C        .db $3C
  $AB21  36 3A     ROL $3A,X
  $AB23  12        .db $12
  $AB24  1E 1E 16  ASL $161E,X
  $AB27  06 1E     ASL $1E
  $AB29  3E 32 32  ROL $3232,X
  $AB2C  1E 3E 3E  ASL $3E3E,X
  $AB2F  3E 04 00  ROL $0004,X
  $AB32  00        BRK
  $AB33  00        BRK
  $AB34  08        PHP
  $AB35  00        BRK
  $AB36  00        BRK
  $AB37  00        BRK
  $AB38  3C        .db $3C
  $AB39  3E 3E 3E  ROL $3E3E,X
  $AB3C  32        .db $32
  $AB3D  32        .db $32
  $AB3E  3E 00 18  ROL $1800,X
  $AB41  18        CLC
  $AB42  18        CLC
  $AB43  18        CLC
  $AB44  18        CLC
  $AB45  18        CLC
  $AB46  18        CLC
  $AB47  18        CLC
  $AB48  C3        .db $C3
  $AB49  C3        .db $C3
  $AB4A  C3        .db $C3
  $AB4B  C3        .db $C3
  $AB4C  C3        .db $C3
  $AB4D  C3        .db $C3
  $AB4E  C3        .db $C3
  $AB4F  C3        .db $C3
  $AB50  18        CLC
  $AB51  18        CLC
  $AB52  18        CLC
  $AB53  00        BRK
  $AB54  18        CLC
  $AB55  18        CLC
  $AB56  18        CLC
  $AB57  18        CLC
  $AB58  C3        .db $C3
  $AB59  C3        .db $C3
  $AB5A  C3        .db $C3
  $AB5B  C3        .db $C3
  $AB5C  DB        .db $DB
  $AB5D  D3        .db $D3
  $AB5E  C3        .db $C3
  $AB5F  C3        .db $C3
  $AB60  18        CLC
  $AB61  18        CLC
  $AB62  18        CLC
  $AB63  00        BRK
  $AB64  18        CLC
  $AB65  18        CLC
  $AB66  18        CLC
  $AB67  18        CLC
  $AB68  C3        .db $C3
  $AB69  C3        .db $C3
  $AB6A  C3        .db $C3
  $AB6B  C3        .db $C3
  $AB6C  DB        .db $DB
  $AB6D  D3        .db $D3
  $AB6E  C3        .db $C3
  $AB6F  C3        .db $C3
  $AB70  18        CLC
  $AB71  18        CLC
  $AB72  18        CLC
  $AB73  18        CLC
  $AB74  18        CLC
  $AB75  18        CLC
  $AB76  18        CLC
  $AB77  18        CLC
  $AB78  C3        .db $C3
  $AB79  C3        .db $C3
  $AB7A  C3        .db $C3
  $AB7B  C3        .db $C3
  $AB7C  C3        .db $C3
  $AB7D  C3        .db $C3
  $AB7E  C3        .db $C3
  $AB7F  C3        .db $C3
  $AB80  00        BRK
  $AB81  00        BRK
  $AB82  00        BRK
  $AB83  00        BRK
  $AB84  00        BRK
  $AB85  00        BRK
  $AB86  00        BRK
  $AB87  00        BRK
  $AB88  00        BRK
  $AB89  00        BRK
  $AB8A  00        BRK
  $AB8B  00        BRK
  $AB8C  00        BRK
  $AB8D  00        BRK
  $AB8E  00        BRK
  $AB8F  00        BRK
  $AB90  18        CLC
  $AB91  18        CLC
  $AB92  18        CLC
  $AB93  00        BRK
  $AB94  18        CLC
  $AB95  18        CLC
  $AB96  18        CLC
  $AB97  18        CLC
  $AB98  00        BRK
  $AB99  C3        .db $C3
  $AB9A  C3        .db $C3
  $AB9B  C3        .db $C3
  $AB9C  DB        .db $DB
  $AB9D  D3        .db $D3
  $AB9E  C3        .db $C3
  $AB9F  C3        .db $C3
  $ABA0  00        BRK
  $ABA1  00        BRK
  $ABA2  00        BRK
  $ABA3  00        BRK
  $ABA4  00        BRK
  $ABA5  00        BRK
  $ABA6  00        BRK
  $ABA7  00        BRK
  $ABA8  00        BRK
  $ABA9  00        BRK
  $ABAA  00        BRK

L_ABAB:
  $ABAB  00        BRK
  $ABAC  00        BRK
  $ABAD  00        BRK
  $ABAE  00        BRK
  $ABAF  00        BRK
  $ABB0  18        CLC
  $ABB1  18        CLC
  $ABB2  18        CLC
  $ABB3  18        CLC
  $ABB4  18        CLC
  $ABB5  18        CLC
  $ABB6  18        CLC
  $ABB7  18        CLC
  $ABB8  00        BRK
  $ABB9  C3        .db $C3
  $ABBA  C3        .db $C3
  $ABBB  C3        .db $C3
  $ABBC  C3        .db $C3
  $ABBD  C3        .db $C3
  $ABBE  C3        .db $C3
  $ABBF  C3        .db $C3
  $ABC0  FE BE DE  INC $DEBE,X
  $ABC3  E4 E0     CPX $E0
  $ABC5  F0 E4     BEQ $ABAB
  $ABC7  00        BRK
  $ABC8  FE BE DE  INC $DEBE,X
  $ABCB  E4 E0     CPX $E0
  $ABCD  F2        .db $F2
  $ABCE  E4 00     CPX $00
  $ABD0  E0 F0     CPX #$F0
  $ABD2  E0 E4     CPX #$E4
  $ABD4  DE BE FE  DEC $FEBE,X
  $ABD7  FF        .db $FF
  $ABD8  E0 F0     CPX #$F0
  $ABDA  E0 E4     CPX #$E4
  $ABDC  DE BE FE  DEC $FEBE,X
  $ABDF  FF        .db $FF
  $ABE0  FF        .db $FF
  $ABE1  FB        .db $FB
  $ABE2  F7        .db $F7
  $ABE3  4F        .db $4F
  $ABE4  0F        .db $0F
  $ABE5  1F        .db $1F
  $ABE6  0F        .db $0F
  $ABE7  01 FF     ORA ($FF,X)
  $ABE9  FB        .db $FB
  $ABEA  F7        .db $F7
  $ABEB  4F        .db $4F
  $ABEC  0F        .db $0F
  $ABED  1F        .db $1F
  $ABEE  0F        .db $0F
  $ABEF  01 0F     ORA ($0F,X)
  $ABF1  1F        .db $1F
  $ABF2  0F        .db $0F
  $ABF3  4F        .db $4F
  $ABF4  F7        .db $F7
  $ABF5  FB        .db $FB
  $ABF6  FF        .db $FF
  $ABF7  FF        .db $FF
  $ABF8  0F        .db $0F
  $ABF9  1F        .db $1F
  $ABFA  0F        .db $0F
  $ABFB  4F        .db $4F
  $ABFC  F7        .db $F7
  $ABFD  FB        .db $FB
  $ABFE  FF        .db $FF
  $ABFF  FF        .db $FF
  $AC00  FF        .db $FF
  $AC01  FF        .db $FF
  $AC02  FF        .db $FF
  $AC03  FF        .db $FF
  $AC04  00        BRK
  $AC05  00        BRK
  $AC06  00        BRK
  $AC07  00        BRK
  $AC08  FF        .db $FF
  $AC09  FF        .db $FF
  $AC0A  00        BRK
  $AC0B  FF        .db $FF
  $AC0C  FF        .db $FF
  $AC0D  FF        .db $FF
  $AC0E  FF        .db $FF
  $AC0F  FF        .db $FF
  $AC10  00        BRK
  $AC11  FF        .db $FF
  $AC12  FF        .db $FF
  $AC13  00        BRK
  $AC14  FF        .db $FF
  $AC15  00        BRK
  $AC16  00        BRK
  $AC17  FF        .db $FF
  $AC18  FF        .db $FF
  $AC19  00        BRK
  $AC1A  00        BRK
  $AC1B  00        BRK
  $AC1C  00        BRK
  $AC1D  FF        .db $FF
  $AC1E  FF        .db $FF
  $AC1F  00        BRK
  $AC20  FF        .db $FF

L_AC21:
  $AC21  FF        .db $FF
  $AC22  FF        .db $FF
  $AC23  FF        .db $FF
  $AC24  00        BRK
  $AC25  00        BRK
  $AC26  00        BRK
  $AC27  00        BRK
  $AC28  FF        .db $FF
  $AC29  FF        .db $FF
  $AC2A  00        BRK
  $AC2B  FF        .db $FF
  $AC2C  FF        .db $FF
  $AC2D  FF        .db $FF
  $AC2E  FF        .db $FF
  $AC2F  FF        .db $FF
  $AC30  00        BRK
  $AC31  FF        .db $FF
  $AC32  FF        .db $FF
  $AC33  00        BRK
  $AC34  FF        .db $FF
  $AC35  00        BRK
  $AC36  00        BRK
  $AC37  FF        .db $FF
  $AC38  FF        .db $FF
  $AC39  00        BRK
  $AC3A  00        BRK
  $AC3B  00        BRK
  $AC3C  00        BRK
  $AC3D  FF        .db $FF
  $AC3E  FF        .db $FF
  $AC3F  00        BRK
  $AC40  7F        .db $7F
  $AC41  DF        .db $DF
  $AC42  A7        .db $A7
  $AC43  C7        .db $C7
  $AC44  E7        .db $E7
  $AC45  E3        .db $E3
  $AC46  C3        .db $C3
  $AC47  C2        .db $C2
  $AC48  F8        SED
  $AC49  FF        .db $FF
  $AC4A  CF        .db $CF
  $AC4B  CF        .db $CF
  $AC4C  FF        .db $FF
  $AC4D  FF        .db $FF
  $AC4E  FF        .db $FF
  $AC4F  DE C2 C0  DEC $C0C2,X
  $AC52  80        .db $80
  $AC53  80        .db $80
  $AC54  A0 80     LDY #$80
  $AC56  00        BRK
  $AC57  0F        .db $0F
  $AC58  7E 7F 7E  ROR $7E7F,X
  $AC5B  7E 4D 4D  ROR $4D4D,X
  $AC5E  E0 00     CPX #$00
  $AC60  FF        .db $FF
  $AC61  FF        .db $FF
  $AC62  F8        SED
  $AC63  FB        .db $FB
  $AC64  F3        .db $F3
  $AC65  F3        .db $F3
  $AC66  B1 80     LDA ($80),Y
  $AC68  14        .db $14
  $AC69  FF        .db $FF
  $AC6A  F8        SED
  $AC6B  F8        SED
  $AC6C  F8        SED
  $AC6D  F0 B2     BEQ $AC21
  $AC6F  CC 07 1C  CPY $1C07
  $AC72  30 60     BMI $ACD4
  $AC74  60        RTS
  $AC75  43        .db $43
  $AC76  07        .db $07
  $AC77  07        .db $07
  $AC78  B8        CLV
  $AC79  63        .db $63
  $AC7A  CF        .db $CF
  $AC7B  9C        .db $9C
  $AC7C  93        .db $93
  $AC7D  B4 E8     LDY $E8,X
  $AC7F  68        PLA
  $AC80  FF        .db $FF
  $AC81  FF        .db $FF
  $AC82  3F        .db $3F
  $AC83  9B        .db $9B
  $AC84  9B        .db $9B
  $AC85  09 01     ORA #$01
  $AC87  01 30     ORA ($30,X)
  $AC89  FF        .db $FF
  $AC8A  3F        .db $3F
  $AC8B  1B        .db $1B
  $AC8C  1B        .db $1B
  $AC8D  8F        .db $8F
  $AC8E  8F        .db $8F
  $AC8F  63        .db $63
  $AC90  00        BRK
  $AC91  10 08     BPL $AC9B
  $AC93  00        BRK
  $AC94  00        BRK
  $AC95  80        .db $80
  $AC96  80        .db $80

L_AC97:
  $AC97  01 F9     ORA ($F9,X)
  $AC99  EC F6 7E  CPX $7EF6
  $AC9C  9F        .db $9F

L_AC9D:
  $AC9D  5F        .db $5F
  $AC9E  6E EC FC  ROR $FCEC
  $ACA1  F6 FA     INC $FA,X
  $ACA3  D2        .db $D2
  $ACA4  DE 9E 96  DEC $969E,X
  $ACA7  86 9E     STX $9E
  $ACA9  FE F2 F2  INC $F2F2,X
  $ACAC  DE BE BE  DEC $BEBE,X
  $ACAF  FE 84 80  INC $8084,X
  $ACB2  00        BRK
  $ACB3  00        BRK
  $ACB4  08        PHP
  $ACB5  00        BRK
  $ACB6  00        BRK
  $ACB7  E0 FC     CPX #$FC
  $ACB9  FE 7E 7E  INC $7E7E,X
  $ACBC  32        .db $32
  $ACBD  32        .db $32
  $ACBE  0E 00 6C  ASL $6C00
  $ACC1  C0 A0     CPY #$A0
  $ACC3  C8        INY
  $ACC4  EC FE FE  CPX $FEFE
  $ACC7  EA        NOP
  $ACC8  E3        .db $E3
  $ACC9  EF        .db $EF
  $ACCA  C0 C9     CPY #$C9
  $ACCC  FC        .db $FC
  $ACCD  FE FE FE  INC $FEFE,X
  $ACD0  CB        .db $CB
  $ACD1  C3        .db $C3
  $ACD2  81 81     STA ($81,X)

L_ACD4:
  $ACD4  A0 80     LDY #$80
  $ACD6  00        BRK
  $ACD7  00        BRK
  $ACD8  7F        .db $7F
  $ACD9  7F        .db $7F
  $ACDA  7F        .db $7F
  $ACDB  7F        .db $7F
  $ACDC  4F        .db $4F
  $ACDD  4F        .db $4F
  $ACDE  FF        .db $FF
  $ACDF  00        BRK
  $ACE0  06 00     ASL $00
  $ACE2  00        BRK
  $ACE3  00        BRK
  $ACE4  00        BRK
  $ACE5  00        BRK
  $ACE6  00        BRK
  $ACE7  80        .db $80
  $ACE8  69 6F     ADC #$6F
  $ACEA  F7        .db $F7
  $ACEB  F3        .db $F3
  $ACEC  FC        .db $FC
  $ACED  DF        .db $DF
  $ACEE  6F        .db $6F
  $ACEF  BC 43 72  LDY $7243,X
  $ACF2  38        SEC
  $ACF3  28        PLP
  $ACF4  00        BRK
  $ACF5  01 00     ORA ($00,X)
  $ACF7  00        BRK
  $ACF8  C8        INY
  $ACF9  F1 FB     SBC ($FB),Y
  $ACFB  FB        .db $FB
  $ACFC  F8        SED
  $ACFD  FF        .db $FF
  $ACFE  FF        .db $FF
  $ACFF  00        BRK
  $AD00  00        BRK
  $AD01  00        BRK
  $AD02  00        BRK
  $AD03  00        BRK
  $AD04  00        BRK
  $AD05  00        BRK
  $AD06  00        BRK
  $AD07  00        BRK
  $AD08  ED ED DE  SBC $DEED
  $AD0B  9F        .db $9F
  $AD0C  7F        .db $7F
  $AD0D  FA        .db $FA
  $AD0E  F6 7C     INC $7C,X
  $AD10  00        BRK
  $AD11  02        .db $02
  $AD12  02        .db $02
  $AD13  12        .db $12
  $AD14  12        .db $12
  $AD15  D0 80     BNE $AC97
  $AD17  00        BRK
  $AD18  B0 83     BCS $AC9D
  $AD1A  9F        .db $9F
  $AD1B  BF        .db $BF
  $AD1C  3F        .db $3F
  $AD1D  FF        .db $FF
  $AD1E  FF        .db $FF
  $AD1F  00        BRK
  $AD20  0C        .db $0C
  $AD21  06 0A     ASL $0A
  $AD23  02        .db $02
  $AD24  1E 1E 36  ASL $361E,X
  $AD27  66 EE     ROR $EE
  $AD29  EE 02 12  INC $1202
  $AD2C  1E 3E 7E  ASL $7E3E,X
  $AD2F  7E E4 C0  ROR $C0E4,X
  $AD32  C0 40     CPY #$40
  $AD34  08        PHP
  $AD35  00        BRK
  $AD36  00        BRK
  $AD37  00        BRK
  $AD38  FC        .db $FC
  $AD39  FE FE FE  INC $FEFE,X
  $AD3C  F2        .db $F2
  $AD3D  F2        .db $F2
  $AD3E  FE 00 82  INC $8200,X
  $AD41  02        .db $02
  $AD42  42        .db $42
  $AD43  22        .db $22
  $AD44  12        .db $12
  $AD45  0A        ASL
  $AD46  EF        .db $EF
  $AD47  0F        .db $0F
  $AD48  81 61     STA ($61,X)
  $AD4A  71 39     ADC ($39),Y
  $AD4C  1D 0D 03  ORA $030D,X
  $AD4F  E0 08     CPX #$08
  $AD51  E9 08     SBC #$08
  $AD53  09 08     ORA #$08
  $AD55  08        PHP
  $AD56  27        .db $27
  $AD57  44        .db $44
  $AD58  E7        .db $E7
  $AD59  E6 06     INC $06
  $AD5B  06 26     ASL $26
  $AD5D  67        .db $67
  $AD5E  EF        .db $EF
  $AD5F  CC 40 41  CPY $4140
  $AD62  42        .db $42
  $AD63  44        .db $44
  $AD64  48        PHA
  $AD65  40        RTI
  $AD66  FF        .db $FF
  $AD67  FF        .db $FF
  $AD68  C3        .db $C3
  $AD69  C7        .db $C7
  $AD6A  CE DC D8  DEC $D8DC
  $AD6D  C0 C0     CPY #$C0
  $AD6F  00        BRK
  $AD70  00        BRK
  $AD71  C0 00     CPY #$00
  $AD73  C0 00     CPY #$00
  $AD75  00        BRK
  $AD76  FF        .db $FF
  $AD77  3F        .db $3F
  $AD78  FF        .db $FF
  $AD79  30 30     BMI $ADAB
  $AD7B  30 30     BMI $ADAD
  $AD7D  FF        .db $FF
  $AD7E  FF        .db $FF
  $AD7F  3F        .db $3F
  $AD80  82        .db $82
  $AD81  02        .db $02
  $AD82  42        .db $42
  $AD83  22        .db $22
  $AD84  12        .db $12
  $AD85  0A        ASL
  $AD86  FF        .db $FF
  $AD87  FF        .db $FF
  $AD88  81 61     STA ($61,X)
  $AD8A  71 39     ADC ($39),Y
  $AD8C  1D 0D 03  ORA $030D,X
  $AD8F  00        BRK
  $AD90  00        BRK
  $AD91  03        .db $03
  $AD92  00        BRK
  $AD93  03        .db $03
  $AD94  00        BRK
  $AD95  00        BRK
  $AD96  FF        .db $FF
  $AD97  FC        .db $FC
  $AD98  FF        .db $FF
  $AD99  0C        .db $0C
  $AD9A  0C        .db $0C
  $AD9B  0C        .db $0C
  $AD9C  0C        .db $0C
  $AD9D  FF        .db $FF
  $AD9E  FF        .db $FF
  $AD9F  FC        .db $FC
  $ADA0  40        RTI
  $ADA1  41 42     EOR ($42,X)
  $ADA3  44        .db $44
  $ADA4  48        PHA
  $ADA5  40        RTI
  $ADA6  F7        .db $F7
  $ADA7  F0 C3     BEQ $AD6C
  $ADA9  C7        .db $C7
  $ADAA  CE DC D8  DEC $D8DC

L_ADAD:
  $ADAD  C0 C0     CPY #$C0
  $ADAF  07        .db $07
  $ADB0  00        BRK
  $ADB1  87        .db $87
  $ADB2  00        BRK
  $ADB3  80        .db $80
  $ADB4  00        BRK
  $ADB5  00        BRK
  $ADB6  F5 32     SBC $32,X
  $ADB8  F7        .db $F7
  $ADB9  77        .db $77
  $ADBA  70 70     BVS $AE2C
  $ADBC  74        .db $74
  $ADBD  F6 F7     INC $F7,X
  $ADBF  33        .db $33
  $ADC0  00        BRK
  $ADC1  00        BRK
  $ADC2  00        BRK
  $ADC3  00        BRK
  $ADC4  00        BRK
  $ADC5  00        BRK
  $ADC6  00        BRK
  $ADC7  00        BRK
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
  $ADD4  00        BRK
  $ADD5  00        BRK
  $ADD6  00        BRK
  $ADD7  00        BRK
  $ADD8  00        BRK
  $ADD9  00        BRK
  $ADDA  00        BRK
  $ADDB  00        BRK
  $ADDC  00        BRK
  $ADDD  00        BRK
  $ADDE  00        BRK
  $ADDF  00        BRK
  $ADE0  00        BRK
  $ADE1  00        BRK
  $ADE2  00        BRK
  $ADE3  00        BRK
  $ADE4  00        BRK
  $ADE5  00        BRK
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
  $ADF1  00        BRK
  $ADF2  00        BRK
  $ADF3  00        BRK
  $ADF4  00        BRK
  $ADF5  00        BRK
  $ADF6  00        BRK
  $ADF7  00        BRK
  $ADF8  00        BRK
  $ADF9  00        BRK
  $ADFA  00        BRK
  $ADFB  00        BRK
  $ADFC  00        BRK
  $ADFD  00        BRK
  $ADFE  00        BRK
  $ADFF  00        BRK
  $AE00  00        BRK
  $AE01  00        BRK
  $AE02  00        BRK
  $AE03  00        BRK
  $AE04  00        BRK
  $AE05  00        BRK
  $AE06  00        BRK
  $AE07  00        BRK
  $AE08  00        BRK
  $AE09  00        BRK
  $AE0A  00        BRK
  $AE0B  00        BRK
  $AE0C  00        BRK
  $AE0D  00        BRK
  $AE0E  00        BRK
  $AE0F  00        BRK
  $AE10  00        BRK
  $AE11  00        BRK
  $AE12  00        BRK
  $AE13  00        BRK
  $AE14  00        BRK
  $AE15  00        BRK
  $AE16  00        BRK
  $AE17  00        BRK
  $AE18  00        BRK
  $AE19  00        BRK
  $AE1A  00        BRK
  $AE1B  00        BRK
  $AE1C  00        BRK
  $AE1D  00        BRK
  $AE1E  00        BRK
  $AE1F  00        BRK
  $AE20  00        BRK
  $AE21  00        BRK
  $AE22  00        BRK
  $AE23  00        BRK
  $AE24  00        BRK
  $AE25  00        BRK
  $AE26  00        BRK
  $AE27  00        BRK
  $AE28  00        BRK
  $AE29  00        BRK
  $AE2A  00        BRK
  $AE2B  00        BRK

L_AE2C:
  $AE2C  00        BRK
  $AE2D  00        BRK
  $AE2E  00        BRK
  $AE2F  00        BRK
  $AE30  00        BRK
  $AE31  00        BRK
  $AE32  00        BRK
  $AE33  00        BRK
  $AE34  00        BRK
  $AE35  00        BRK
  $AE36  00        BRK
  $AE37  00        BRK
  $AE38  00        BRK
  $AE39  00        BRK
  $AE3A  00        BRK
  $AE3B  00        BRK
  $AE3C  00        BRK
  $AE3D  00        BRK
  $AE3E  00        BRK
  $AE3F  00        BRK
  $AE40  00        BRK
  $AE41  00        BRK
  $AE42  00        BRK
  $AE43  00        BRK
  $AE44  00        BRK
  $AE45  00        BRK
  $AE46  00        BRK
  $AE47  00        BRK
  $AE48  00        BRK
  $AE49  00        BRK
  $AE4A  00        BRK
  $AE4B  00        BRK
  $AE4C  00        BRK
  $AE4D  00        BRK
  $AE4E  00        BRK
  $AE4F  00        BRK
  $AE50  00        BRK
  $AE51  00        BRK
  $AE52  00        BRK
  $AE53  00        BRK
  $AE54  00        BRK
  $AE55  00        BRK
  $AE56  00        BRK
  $AE57  00        BRK
  $AE58  00        BRK
  $AE59  00        BRK
  $AE5A  00        BRK
  $AE5B  00        BRK
  $AE5C  00        BRK
  $AE5D  00        BRK
  $AE5E  00        BRK
  $AE5F  00        BRK
  $AE60  00        BRK
  $AE61  00        BRK
  $AE62  00        BRK
  $AE63  00        BRK
  $AE64  00        BRK
  $AE65  00        BRK
  $AE66  00        BRK
  $AE67  00        BRK
  $AE68  00        BRK
  $AE69  00        BRK
  $AE6A  00        BRK
  $AE6B  00        BRK
  $AE6C  00        BRK
  $AE6D  00        BRK
  $AE6E  00        BRK
  $AE6F  00        BRK
  $AE70  00        BRK
  $AE71  00        BRK
  $AE72  00        BRK
  $AE73  00        BRK
  $AE74  00        BRK
  $AE75  00        BRK
  $AE76  00        BRK
  $AE77  00        BRK
  $AE78  00        BRK
  $AE79  00        BRK
  $AE7A  00        BRK
  $AE7B  00        BRK
  $AE7C  00        BRK
  $AE7D  00        BRK
  $AE7E  00        BRK
  $AE7F  00        BRK
  $AE80  00        BRK
  $AE81  00        BRK
  $AE82  00        BRK
  $AE83  00        BRK
  $AE84  00        BRK
  $AE85  00        BRK
  $AE86  00        BRK
  $AE87  00        BRK
  $AE88  00        BRK
  $AE89  00        BRK
  $AE8A  00        BRK
  $AE8B  00        BRK
  $AE8C  00        BRK
  $AE8D  00        BRK
  $AE8E  00        BRK
  $AE8F  00        BRK
  $AE90  00        BRK
  $AE91  00        BRK
  $AE92  00        BRK
  $AE93  00        BRK
  $AE94  00        BRK
  $AE95  00        BRK
  $AE96  00        BRK
  $AE97  00        BRK
  $AE98  00        BRK
  $AE99  00        BRK
  $AE9A  00        BRK
  $AE9B  00        BRK
  $AE9C  00        BRK
  $AE9D  00        BRK
  $AE9E  00        BRK
  $AE9F  00        BRK
  $AEA0  00        BRK
  $AEA1  00        BRK
  $AEA2  00        BRK
  $AEA3  00        BRK
  $AEA4  00        BRK
  $AEA5  00        BRK
  $AEA6  00        BRK
  $AEA7  00        BRK
  $AEA8  00        BRK
  $AEA9  00        BRK
  $AEAA  00        BRK
  $AEAB  00        BRK
  $AEAC  00        BRK
  $AEAD  00        BRK
  $AEAE  00        BRK
  $AEAF  00        BRK
  $AEB0  00        BRK
  $AEB1  00        BRK
  $AEB2  00        BRK
  $AEB3  00        BRK
  $AEB4  00        BRK
  $AEB5  00        BRK
  $AEB6  00        BRK
  $AEB7  00        BRK
  $AEB8  00        BRK
  $AEB9  00        BRK
  $AEBA  00        BRK
  $AEBB  00        BRK
  $AEBC  00        BRK
  $AEBD  00        BRK
  $AEBE  00        BRK
  $AEBF  00        BRK
  $AEC0  00        BRK
  $AEC1  00        BRK
  $AEC2  00        BRK
  $AEC3  00        BRK
  $AEC4  00        BRK
  $AEC5  00        BRK
  $AEC6  00        BRK
  $AEC7  00        BRK
  $AEC8  00        BRK
  $AEC9  00        BRK
  $AECA  00        BRK
  $AECB  00        BRK
  $AECC  00        BRK
  $AECD  00        BRK
  $AECE  00        BRK
  $AECF  00        BRK
  $AED0  00        BRK
  $AED1  00        BRK
  $AED2  00        BRK
  $AED3  00        BRK
  $AED4  00        BRK
  $AED5  00        BRK
  $AED6  00        BRK
  $AED7  00        BRK
  $AED8  00        BRK
  $AED9  00        BRK
  $AEDA  00        BRK
  $AEDB  00        BRK
  $AEDC  00        BRK
  $AEDD  00        BRK
  $AEDE  00        BRK
  $AEDF  00        BRK
  $AEE0  00        BRK
  $AEE1  00        BRK
  $AEE2  00        BRK
  $AEE3  00        BRK
  $AEE4  00        BRK
  $AEE5  00        BRK
  $AEE6  00        BRK
  $AEE7  00        BRK
  $AEE8  00        BRK
  $AEE9  00        BRK
  $AEEA  00        BRK
  $AEEB  00        BRK
  $AEEC  00        BRK
  $AEED  00        BRK
  $AEEE  00        BRK
  $AEEF  00        BRK
  $AEF0  00        BRK
  $AEF1  00        BRK
  $AEF2  00        BRK
  $AEF3  00        BRK
  $AEF4  00        BRK
  $AEF5  00        BRK
  $AEF6  00        BRK
  $AEF7  00        BRK
  $AEF8  00        BRK
  $AEF9  00        BRK
  $AEFA  00        BRK
  $AEFB  00        BRK
  $AEFC  00        BRK
  $AEFD  00        BRK
  $AEFE  00        BRK
  $AEFF  00        BRK
  $AF00  00        BRK
  $AF01  00        BRK
  $AF02  00        BRK
  $AF03  00        BRK
  $AF04  00        BRK
  $AF05  00        BRK
  $AF06  00        BRK
  $AF07  00        BRK
  $AF08  00        BRK
  $AF09  00        BRK
  $AF0A  00        BRK
  $AF0B  00        BRK
  $AF0C  00        BRK
  $AF0D  00        BRK
  $AF0E  00        BRK
  $AF0F  00        BRK
  $AF10  00        BRK
  $AF11  00        BRK
  $AF12  00        BRK
  $AF13  00        BRK
  $AF14  00        BRK
  $AF15  00        BRK
  $AF16  00        BRK
  $AF17  00        BRK
  $AF18  00        BRK
  $AF19  00        BRK
  $AF1A  00        BRK
  $AF1B  00        BRK
  $AF1C  00        BRK
  $AF1D  00        BRK
  $AF1E  00        BRK
  $AF1F  00        BRK
  $AF20  00        BRK
  $AF21  00        BRK
  $AF22  00        BRK
  $AF23  00        BRK
  $AF24  00        BRK
  $AF25  00        BRK
  $AF26  00        BRK
  $AF27  00        BRK
  $AF28  00        BRK
  $AF29  00        BRK
  $AF2A  00        BRK
  $AF2B  00        BRK
  $AF2C  00        BRK
  $AF2D  00        BRK
  $AF2E  00        BRK
  $AF2F  00        BRK
  $AF30  00        BRK
  $AF31  00        BRK
  $AF32  00        BRK
  $AF33  00        BRK
  $AF34  00        BRK
  $AF35  00        BRK
  $AF36  00        BRK
  $AF37  00        BRK
  $AF38  00        BRK
  $AF39  00        BRK
  $AF3A  00        BRK
  $AF3B  00        BRK
  $AF3C  00        BRK
  $AF3D  00        BRK
  $AF3E  00        BRK
  $AF3F  00        BRK
  $AF40  00        BRK
  $AF41  00        BRK
  $AF42  00        BRK
  $AF43  00        BRK
  $AF44  00        BRK
  $AF45  00        BRK
  $AF46  00        BRK
  $AF47  00        BRK
  $AF48  00        BRK
  $AF49  00        BRK
  $AF4A  00        BRK
  $AF4B  00        BRK
  $AF4C  00        BRK
  $AF4D  00        BRK
  $AF4E  00        BRK
  $AF4F  00        BRK
  $AF50  00        BRK
  $AF51  00        BRK
  $AF52  00        BRK
  $AF53  00        BRK
  $AF54  00        BRK
  $AF55  00        BRK
  $AF56  00        BRK
  $AF57  00        BRK
  $AF58  00        BRK
  $AF59  00        BRK
  $AF5A  00        BRK
  $AF5B  00        BRK
  $AF5C  00        BRK
  $AF5D  00        BRK
  $AF5E  00        BRK
  $AF5F  00        BRK
  $AF60  00        BRK
  $AF61  00        BRK
  $AF62  00        BRK
  $AF63  00        BRK
  $AF64  00        BRK
  $AF65  00        BRK
  $AF66  00        BRK
  $AF67  00        BRK
  $AF68  00        BRK
  $AF69  00        BRK
  $AF6A  00        BRK
  $AF6B  00        BRK
  $AF6C  00        BRK
  $AF6D  00        BRK
  $AF6E  00        BRK
  $AF6F  00        BRK
  $AF70  00        BRK
  $AF71  00        BRK
  $AF72  00        BRK
  $AF73  00        BRK
  $AF74  00        BRK
  $AF75  00        BRK
  $AF76  00        BRK
  $AF77  00        BRK
  $AF78  00        BRK
  $AF79  00        BRK
  $AF7A  00        BRK
  $AF7B  00        BRK
  $AF7C  00        BRK
  $AF7D  00        BRK
  $AF7E  00        BRK
  $AF7F  00        BRK
  $AF80  00        BRK
  $AF81  00        BRK
  $AF82  00        BRK
  $AF83  00        BRK
  $AF84  00        BRK
  $AF85  00        BRK
  $AF86  00        BRK
  $AF87  00        BRK
  $AF88  00        BRK
  $AF89  00        BRK
  $AF8A  00        BRK
  $AF8B  00        BRK
  $AF8C  00        BRK
  $AF8D  00        BRK
  $AF8E  00        BRK
  $AF8F  00        BRK
  $AF90  00        BRK
  $AF91  00        BRK
  $AF92  00        BRK
  $AF93  00        BRK
  $AF94  00        BRK
  $AF95  00        BRK
  $AF96  00        BRK
  $AF97  00        BRK
  $AF98  00        BRK
  $AF99  00        BRK
  $AF9A  00        BRK
  $AF9B  00        BRK
  $AF9C  00        BRK
  $AF9D  00        BRK
  $AF9E  00        BRK
  $AF9F  00        BRK
  $AFA0  00        BRK
  $AFA1  00        BRK
  $AFA2  00        BRK
  $AFA3  00        BRK
  $AFA4  00        BRK
  $AFA5  00        BRK
  $AFA6  00        BRK
  $AFA7  00        BRK
  $AFA8  00        BRK
  $AFA9  00        BRK
  $AFAA  00        BRK
  $AFAB  00        BRK
  $AFAC  00        BRK
  $AFAD  00        BRK
  $AFAE  00        BRK
  $AFAF  00        BRK
  $AFB0  00        BRK
  $AFB1  00        BRK
  $AFB2  00        BRK
  $AFB3  00        BRK
  $AFB4  00        BRK
  $AFB5  00        BRK
  $AFB6  00        BRK
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
  $AFD1  00        BRK
  $AFD2  00        BRK
  $AFD3  00        BRK
  $AFD4  00        BRK
  $AFD5  00        BRK
  $AFD6  00        BRK
  $AFD7  00        BRK
  $AFD8  00        BRK
  $AFD9  00        BRK
  $AFDA  00        BRK
  $AFDB  00        BRK
  $AFDC  00        BRK
  $AFDD  00        BRK
  $AFDE  00        BRK
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
  $AFF1  00        BRK
  $AFF2  00        BRK
  $AFF3  00        BRK
  $AFF4  00        BRK
  $AFF5  00        BRK
  $AFF6  00        BRK
  $AFF7  00        BRK
  $AFF8  00        BRK
  $AFF9  00        BRK
  $AFFA  00        BRK
  $AFFB  00        BRK
  $AFFC  00        BRK
  $AFFD  00        BRK
  $AFFE  00        BRK
  $AFFF  00        BRK
  $B000  B3        .db $B3
  $B001  33        .db $33
  $B002  E3        .db $E3
  $B003  66 46     ROR $46
  $B005  46 C6     LSR $C6
  $B007  C7        .db $C7
  $B008  8F        .db $8F
  $B009  8F        .db $8F
  $B00A  9F        .db $9F
  $B00B  1E 3E 3F  ASL $3F3E,X
  $B00E  3F        .db $3F
  $B00F  3E 87 47  ROL $4787,X
  $B012  C7        .db $C7
  $B013  0F        .db $0F
  $B014  1C        .db $1C
  $B015  0C        .db $0C
  $B016  78        SEI
  $B017  FC        .db $FC
  $B018  7E BE BE  ROR $BEBE,X
  $B01B  7E 3D 0C  ROR $0C3D,X
  $B01E  80        .db $80
  $B01F  02        .db $02
  $B020  01 7D     ORA ($7D,X)
  $B022  4E CE DA  LSR $DACE
  $B025  DC        .db $DC
  $B026  9C        .db $9C
  $B027  9C        .db $9C
  $B028  00        BRK
  $B029  0E 3D 3D  ASL $3D3D
  $B02C  39 3B 7B  AND $7B3B,Y
  $B02F  7B        .db $7B

L_B030:
  $B030  10 10     BPL $B042
  $B032  09 0C     ORA #$0C
  $B034  88        DEY
  $B035  8D 8E 8E  STA $8E8E
  $B038  F7        .db $F7
  $B039  F3        .db $F3
  $B03A  FB        .db $FB
  $B03B  FC        .db $FC
  $B03C  79 7E FD  ADC $FD7E,Y
  $B03F  FD 9C 14  SBC $149C,X

L_B042:
  $B042  14        .db $14
  $B043  30 30     BMI $B075
  $B045  30 2E     BMI $B075
  $B047  49 73     EOR #$73
  $B049  FB        .db $FB
  $B04A  FB        .db $FB
  $B04B  F7        .db $F7
  $B04C  F3        .db $F3
  $B04D  F0 F2     BEQ $B041
  $B04F  D7        .db $D7
  $B050  49 4F     EOR #$4F
  $B052  8F        .db $8F
  $B053  1E 10 B0  ASL $B010,X
  $B056  70 50     BVS $B0A8
  $B058  D7        .db $D7
  $B059  CF        .db $CF
  $B05A  81 01     STA ($01,X)
  $B05C  2F        .db $2F
  $B05D  8F        .db $8F
  $B05E  CF        .db $CF
  $B05F  EF        .db $EF
  $B060  30 30     BMI $B092
  $B062  30 30     BMI $B094
  $B064  61 61     ADC ($61,X)
  $B066  82        .db $82
  $B067  86 8F     STX $8F
  $B069  8F        .db $8F
  $B06A  8F        .db $8F
  $B06B  0F        .db $0F
  $B06C  1F        .db $1F
  $B06D  1F        .db $1F
  $B06E  7E 7E 4C  ROR $4C7E,X
  $B071  96 64     STX $64,Y
  $B073  98        TYA
  $B074  D1 F1     CMP ($F1),Y
  $B076  F1 F3     SBC ($F3),Y
  $B078  BC F0 7B  LDY $7BF0,X
  $B07B  87        .db $87
  $B07C  EF        .db $EF
  $B07D  CF        .db $CF
  $B07E  CF        .db $CF
  $B07F  CF        .db $CF
  $B080  D1 C1     CMP ($C1),Y
  $B082  C1 81     CMP ($81,X)
  $B084  41 62     EOR ($62,X)
  $B086  E2        .db $E2
  $B087  42        .db $42
  $B088  2F        .db $2F
  $B089  3F        .db $3F
  $B08A  3F        .db $3F
  $B08B  7F        .db $7F
  $B08C  BF        .db $BF
  $B08D  9E        .db $9E
  $B08E  9E        .db $9E
  $B08F  BF        .db $BF
  $B090  43        .db $43
  $B091  83        .db $83

L_B092:
  $B092  87        .db $87
  $B093  84 84     STY $84
  $B095  44        .db $44
  $B096  04        .db $04
  $B097  00        BRK
  $B098  BE 7E 7E  LDX $7E7E,Y
  $B09B  7D 7D 3D  ADC $3D7D,X
  $B09E  7C        .db $7C
  $B09F  3C        .db $3C
  $B0A0  0A        ASL
  $B0A1  C2        .db $C2
  $B0A2  C7        .db $C7
  $B0A3  45 45     EOR $45
  $B0A5  47        .db $47
  $B0A6  87        .db $87
  $B0A7  8B        .db $8B

L_B0A8:
  $B0A8  79 B9 BC  ADC $BCB9,Y
  $B0AB  3E 3E BC  ROL $BC3E,X
  $B0AE  7C        .db $7C
  $B0AF  78        SEI
  $B0B0  8B        .db $8B
  $B0B1  8B        .db $8B
  $B0B2  12        .db $12
  $B0B3  1A        .db $1A
  $B0B4  1A        .db $1A

L_B0B5:
  $B0B5  1A        .db $1A
  $B0B6  3A        .db $3A
  $B0B7  71 7C     ADC ($7C),Y
  $B0B9  7C        .db $7C
  $B0BA  F5 FD     SBC $FD,X
  $B0BC  FD FD F9  SBC $F9FD,X
  $B0BF  72        .db $72
  $B0C0  58        CLI
  $B0C1  48        PHA
  $B0C2  08        PHP
  $B0C3  18        CLC
  $B0C4  04        .db $04
  $B0C5  0C        .db $0C
  $B0C6  18        CLC
  $B0C7  0B        .db $0B
  $B0C8  C7        .db $C7
  $B0C9  D7        .db $D7
  $B0CA  D7        .db $D7
  $B0CB  D7        .db $D7
  $B0CC  EB        .db $EB
  $B0CD  EB        .db $EB

L_B0CE:
  $B0CE  FF        .db $FF
  $B0CF  FB        .db $FB
  $B0D0  00        BRK
  $B0D1  03        .db $03
  $B0D2  06 14     ASL $14
  $B0D4  14        .db $14
  $B0D5  18        CLC
  $B0D6  18        CLC
  $B0D7  0C        .db $0C
  $B0D8  F0 F4     BEQ $B0CE
  $B0DA  F1 F3     SBC ($F3),Y
  $B0DC  FB        .db $FB
  $B0DD  F7        .db $F7
  $B0DE  F7        .db $F7
  $B0DF  E3        .db $E3
  $B0E0  72        .db $72
  $B0E1  72        .db $72
  $B0E2  63        .db $63
  $B0E3  62        .db $62
  $B0E4  62        .db $62
  $B0E5  61 C1     ADC ($C1,X)
  $B0E7  21 CF     AND ($CF,X)
  $B0E9  CF        .db $CF
  $B0EA  DF        .db $DF
  $B0EB  DE DE DF  DEC $DFDE,X
  $B0EE  FF        .db $FF
  $B0EF  1F        .db $1F
  $B0F0  21 63     AND ($63,X)
  $B0F2  63        .db $63
  $B0F3  42        .db $42
  $B0F4  C2        .db $C2
  $B0F5  C1 C1     CMP ($C1,X)

L_B0F7:
  $B0F7  A1 5F     LDA ($5F,X)
  $B0F9  1F        .db $1F
  $B0FA  1F        .db $1F
  $B0FB  3E BE BF  ROL $BFBE,X
  $B0FE  BF        .db $BF
  $B0FF  DF        .db $DF
  $B100  82        .db $82
  $B101  FF        .db $FF
  $B102  77        .db $77
  $B103  B0 B0     BCS $B0B5
  $B105  70 13     BVS $B11A
  $B107  73        .db $73
  $B108  FE E0 48  INC $48E0,X
  $B10B  8F        .db $8F
  $B10C  CF        .db $CF
  $B10D  4F        .db $4F
  $B10E  6C 4C 33  JMP ($334C)
  $B111  32        .db $32
  $B112  32        .db $32
  $B113  22        .db $22
  $B114  22        .db $22
  $B115  32        .db $32
  $B116  32        .db $32
  $B117  30 4C     BMI $B165
  $B119  4D 4D 5D  EOR $5D4D
  $B11C  5D 4D 4D  EOR $4D4D,X
  $B11F  4F        .db $4F
  $B120  3F        .db $3F
  $B121  FA        .db $FA
  $B122  E3        .db $E3
  $B123  E0 E1     CPX #$E1
  $B125  C1 E1     CMP ($E1,X)
  $B127  21 01     AND ($01,X)
  $B129  45 5F     EOR $5F
  $B12B  5F        .db $5F
  $B12C  5F        .db $5F
  $B12D  7F        .db $7F
  $B12E  7F        .db $7F
  $B12F  FF        .db $FF
  $B130  21 23     AND ($23,X)
  $B132  23        .db $23
  $B133  23        .db $23
  $B134  27        .db $27
  $B135  23        .db $23
  $B136  23        .db $23
  $B137  03        .db $03
  $B138  FF        .db $FF
  $B139  FF        .db $FF
  $B13A  FF        .db $FF
  $B13B  FF        .db $FF
  $B13C  FF        .db $FF
  $B13D  FF        .db $FF
  $B13E  FF        .db $FF
  $B13F  FF        .db $FF
  $B140  CF        .db $CF
  $B141  FF        .db $FF
  $B142  BF        .db $BF
  $B143  23        .db $23
  $B144  30 60     BMI $B1A6
  $B146  60        RTS
  $B147  60        RTS
  $B148  F0 C0     BEQ $B10A
  $B14A  80        .db $80
  $B14B  5C        .db $5C
  $B14C  4F        .db $4F
  $B14D  1F        .db $1F
  $B14E  1F        .db $1F
  $B14F  1F        .db $1F
  $B150  60        RTS
  $B151  20 30 B0  JSR $B030
  $B154  B0 A1     BCS $B0F7
  $B156  A1 A1     LDA ($A1,X)
  $B158  1F        .db $1F
  $B159  5F        .db $5F
  $B15A  4F        .db $4F
  $B15B  CF        .db $CF
  $B15C  8F        .db $8F
  $B15D  9F        .db $9F
  $B15E  9F        .db $9F
  $B15F  9F        .db $9F
  $B160  F1 FD     SBC ($FD),Y
  $B162  E1 01     SBC ($01,X)
  $B164  01 03     ORA ($03,X)
  $B166  63        .db $63
  $B167  62        .db $62
  $B168  0F        .db $0F
  $B169  03        .db $03
  $B16A  1F        .db $1F
  $B16B  FF        .db $FF
  $B16C  FF        .db $FF
  $B16D  FF        .db $FF
  $B16E  DF        .db $DF
  $B16F  DE E2 C1  DEC $C1E2,X
  $B172  C1 C1     CMP ($C1,X)
  $B174  81 81     STA ($81,X)
  $B176  81 01     STA ($01,X)
  $B178  9E        .db $9E
  $B179  BF        .db $BF
  $B17A  BF        .db $BF
  $B17B  BF        .db $BF
  $B17C  7F        .db $7F
  $B17D  7F        .db $7F
  $B17E  7F        .db $7F
  $B17F  FF        .db $FF
  $B180  7E 71 71  ROR $7171,X
  $B183  21 31     AND ($31,X)
  $B185  31 31     AND ($31),Y
  $B187  31 41     AND ($41),Y
  $B189  4F        .db $4F
  $B18A  4F        .db $4F
  $B18B  5F        .db $5F
  $B18C  4F        .db $4F
  $B18D  4F        .db $4F
  $B18E  4F        .db $4F
  $B18F  4F        .db $4F
  $B190  21 A1     AND ($A1,X)
  $B192  E0 E1     CPX #$E1
  $B194  E1 E1     SBC ($E1,X)
  $B196  E1 BD     SBC ($BD,X)
  $B198  5F        .db $5F
  $B199  DF        .db $DF
  $B19A  9F        .db $9F
  $B19B  9E        .db $9E
  $B19C  9E        .db $9E
  $B19D  9E        .db $9E
  $B19E  BE FC 39  LDX $39FC,Y
  $B1A1  FE C6 C6  INC $C6C6,X
  $B1A4  86 84     STX $84

L_B1A6:
  $B1A6  8C 8C C4  STY $C48C
  $B1A9  03        .db $03
  $B1AA  3F        .db $3F
  $B1AB  3D 7D 7B  AND $7B7D,X
  $B1AE  7B        .db $7B
  $B1AF  7B        .db $7B
  $B1B0  8C 8C 8C  STY $8C8C
  $B1B3  98        TYA
  $B1B4  98        TYA
  $B1B5  98        TYA
  $B1B6  18        CLC
  $B1B7  29 7B     AND #$7B
  $B1B9  7B        .db $7B
  $B1BA  7B        .db $7B
  $B1BB  77        .db $77
  $B1BC  77        .db $77
  $B1BD  77        .db $77
  $B1BE  F7        .db $F7
  $B1BF  EF        .db $EF
  $B1C0  20 E0 50  JSR $50E0
  $B1C3  50 50     BVC $B215
  $B1C5  50 41     BVC $B208
  $B1C7  43        .db $43
  $B1C8  9F        .db $9F
  $B1C9  5F        .db $5F
  $B1CA  CF        .db $CF
  $B1CB  CF        .db $CF
  $B1CC  CF        .db $CF
  $B1CD  CF        .db $CF
  $B1CE  DE DE 66  DEC $66DE,X
  $B1D1  EA        NOP
  $B1D2  E6 CE     INC $CE
  $B1D4  C8        INY
  $B1D5  C8        INY
  $B1D6  88        DEY
  $B1D7  08        PHP
  $B1D8  ED E9 E5  SBC $E5E9
  $B1DB  CD CF CF  CMP $CFCF
  $B1DE  8F        .db $8F
  $B1DF  0F        .db $0F
  $B1E0  02        .db $02
  $B1E1  03        .db $03
  $B1E2  03        .db $03
  $B1E3  33        .db $33
  $B1E4  39 31 31  AND $3131,Y
  $B1E7  61 FE     ADC ($FE,X)
  $B1E9  FF        .db $FF
  $B1EA  FF        .db $FF
  $B1EB  EF        .db $EF
  $B1EC  EF        .db $EF
  $B1ED  EF        .db $EF
  $B1EE  EF        .db $EF
  $B1EF  DF        .db $DF
  $B1F0  61 60     ADC ($60,X)
  $B1F2  61 63     ADC ($63,X)
  $B1F4  63        .db $63
  $B1F5  62        .db $62
  $B1F6  46 3C     LSR $3C
  $B1F8  DF        .db $DF
  $B1F9  DE DF DF  DEC $DFDF,X
  $B1FC  DF        .db $DF
  $B1FD  DE FE 7C  DEC $7CFE,X
  $B200  08        PHP
  $B201  08        PHP
  $B202  59 B3 B9  EOR $B9B3,Y

L_B205:
  $B205  BD 7D 7D  LDA $7D7D,X

L_B208:
  $B208  7B        .db $7B
  $B209  7B        .db $7B
  $B20A  7B        .db $7B
  $B20B  B3        .db $B3
  $B20C  B9 BD 7D  LDA $7DBD,Y
  $B20F  6D 7D 7B  ADC $7B7D
  $B212  7B        .db $7B
  $B213  4B        .db $4B
  $B214  4A        LSR

L_B215:
  $B215  08        PHP
  $B216  0A        ASL
  $B217  09 4C     ORA #$4C
  $B219  40        RTI
  $B21A  00        BRK
  $B21B  30 31     BMI $B24E
  $B21D  7B        .db $7B
  $B21E  7B        .db $7B
  $B21F  79 45 0D  ADC $0D45,Y
  $B222  1C        .db $1C
  $B223  9E        .db $9E
  $B224  DE EF EF  DEC $EFEF,X
  $B227  EF        .db $EF
  $B228  DF        .db $DF
  $B229  DF        .db $DF
  $B22A  DF        .db $DF
  $B22B  DF        .db $DF
  $B22C  DF        .db $DF
  $B22D  EB        .db $EB
  $B22E  EB        .db $EB
  $B22F  61 EF     ADC ($EF,X)
  $B231  CF        .db $CF
  $B232  DB        .db $DB
  $B233  40        RTI
  $B234  80        .db $80
  $B235  81 81     STA ($81,X)
  $B237  A1 60     LDA ($60,X)
  $B239  04        .db $04
  $B23A  04        .db $04
  $B23B  9F        .db $9F
  $B23C  BF        .db $BF
  $B23D  BF        .db $BF
  $B23E  BF        .db $BF
  $B23F  BF        .db $BF
  $B240  00        BRK
  $B241  00        BRK
  $B242  00        BRK
  $B243  00        BRK
  $B244  00        BRK
  $B245  00        BRK
  $B246  00        BRK
  $B247  01 00     ORA ($00,X)
  $B249  00        BRK
  $B24A  00        BRK
  $B24B  00        BRK
  $B24C  00        BRK
  $B24D  00        BRK

L_B24E:
  $B24E  00        BRK
  $B24F  31 04     AND ($04),Y
  $B251  02        .db $02
  $B252  00        BRK
  $B253  08        PHP
  $B254  08        PHP
  $B255  08        PHP
  $B256  0A        ASL
  $B257  09 7D     ORA #$7D
  $B259  7B        .db $7B
  $B25A  7B        .db $7B
  $B25B  7B        .db $7B
  $B25C  7B        .db $7B
  $B25D  7B        .db $7B
  $B25E  7B        .db $7B
  $B25F  79 00 00  ADC $0000,Y
  $B262  00        BRK
  $B263  00        BRK
  $B264  00        BRK
  $B265  00        BRK
  $B266  00        BRK
  $B267  40        RTI
  $B268  00        BRK
  $B269  00        BRK
  $B26A  00        BRK
  $B26B  00        BRK
  $B26C  00        BRK
  $B26D  00        BRK
  $B26E  00        BRK
  $B26F  C0 20     CPY #$20
  $B271  00        BRK
  $B272  41 40     EOR ($40,X)
  $B274  80        .db $80
  $B275  81 81     STA ($81,X)
  $B277  A1 E0     LDA ($E0,X)
  $B279  CE DF DF  DEC $DFDF
  $B27C  BF        .db $BF
  $B27D  BF        .db $BF
  $B27E  BF        .db $BF
  $B27F  BF        .db $BF
  $B280  08        PHP
  $B281  08        PHP
  $B282  58        CLI
  $B283  B0 80     BCS $B205
  $B285  84 44     STY $44
  $B287  44        .db $44
  $B288  7B        .db $7B
  $B289  7B        .db $7B
  $B28A  7B        .db $7B
  $B28B  B3        .db $B3
  $B28C  B9 BD 7D  LDA $7DBD,Y
  $B28F  7D 04 02  ADC $0204,X
  $B292  00        BRK
  $B293  08        PHP
  $B294  08        PHP
  $B295  08        PHP
  $B296  0A        ASL
  $B297  09 7D     ORA #$7D
  $B299  7B        .db $7B
  $B29A  7B        .db $7B
  $B29B  7B        .db $7B
  $B29C  7B        .db $7B
  $B29D  7B        .db $7B
  $B29E  7B        .db $7B
  $B29F  79 41 01  ADC $0141,Y
  $B2A2  00        BRK
  $B2A3  00        BRK
  $B2A4  00        BRK
  $B2A5  20 21 21  JSR $2121
  $B2A8  DF        .db $DF
  $B2A9  DF        .db $DF
  $B2AA  DF        .db $DF
  $B2AB  DF        .db $DF
  $B2AC  DF        .db $DF
  $B2AD  EF        .db $EF
  $B2AE  EF        .db $EF
  $B2AF  EF        .db $EF
  $B2B0  2F        .db $2F
  $B2B1  0E 41 40  ASL $4041
  $B2B4  80        .db $80
  $B2B5  81 81     STA ($81,X)
  $B2B7  A1 EF     LDA ($EF,X)
  $B2B9  CE DF DF  DEC $DFDF
  $B2BC  BF        .db $BF
  $B2BD  BF        .db $BF
  $B2BE  BF        .db $BF
  $B2BF  BF        .db $BF
  $B2C0  FF        .db $FF
  $B2C1  00        BRK
  $B2C2  FF        .db $FF
  $B2C3  FF        .db $FF
  $B2C4  00        BRK
  $B2C5  00        BRK
  $B2C6  FF        .db $FF
  $B2C7  00        BRK
  $B2C8  FF        .db $FF
  $B2C9  FF        .db $FF
  $B2CA  00        BRK
  $B2CB  00        BRK
  $B2CC  FF        .db $FF
  $B2CD  FF        .db $FF
  $B2CE  FF        .db $FF
  $B2CF  00        BRK
  $B2D0  FF        .db $FF
  $B2D1  00        BRK
  $B2D2  FF        .db $FF
  $B2D3  FF        .db $FF
  $B2D4  00        BRK
  $B2D5  00        BRK
  $B2D6  FF        .db $FF
  $B2D7  00        BRK
  $B2D8  FF        .db $FF
  $B2D9  FF        .db $FF
  $B2DA  00        BRK
  $B2DB  00        BRK
  $B2DC  FF        .db $FF
  $B2DD  FF        .db $FF
  $B2DE  FF        .db $FF
  $B2DF  00        BRK
  $B2E0  FF        .db $FF
  $B2E1  00        BRK
  $B2E2  FF        .db $FF
  $B2E3  FF        .db $FF
  $B2E4  00        BRK
  $B2E5  00        BRK
  $B2E6  FF        .db $FF
  $B2E7  00        BRK
  $B2E8  FF        .db $FF
  $B2E9  FF        .db $FF
  $B2EA  00        BRK
  $B2EB  00        BRK
  $B2EC  FF        .db $FF
  $B2ED  FF        .db $FF
  $B2EE  FF        .db $FF
  $B2EF  00        BRK
  $B2F0  FF        .db $FF
  $B2F1  00        BRK
  $B2F2  FF        .db $FF
  $B2F3  FF        .db $FF
  $B2F4  00        BRK
  $B2F5  00        BRK
  $B2F6  FF        .db $FF
  $B2F7  00        BRK
  $B2F8  FF        .db $FF
  $B2F9  FF        .db $FF
  $B2FA  00        BRK
  $B2FB  00        BRK
  $B2FC  FF        .db $FF
  $B2FD  FF        .db $FF
  $B2FE  FF        .db $FF
  $B2FF  00        BRK
  $B300  00        BRK
  $B301  00        BRK
  $B302  00        BRK
  $B303  00        BRK
  $B304  00        BRK
  $B305  00        BRK
  $B306  00        BRK
  $B307  01 00     ORA ($00,X)
  $B309  00        BRK
  $B30A  00        BRK
  $B30B  00        BRK
  $B30C  00        BRK
  $B30D  00        BRK
  $B30E  00        BRK
  $B30F  00        BRK
  $B310  00        BRK
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
  $B320  00        BRK
  $B321  00        BRK
  $B322  00        BRK
  $B323  00        BRK
  $B324  00        BRK
  $B325  00        BRK
  $B326  00        BRK
  $B327  00        BRK
  $B328  00        BRK
  $B329  00        BRK
  $B32A  00        BRK
  $B32B  00        BRK
  $B32C  00        BRK
  $B32D  00        BRK
  $B32E  00        BRK
  $B32F  00        BRK
  $B330  00        BRK
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
  $B345  00        BRK
  $B346  00        BRK
  $B347  00        BRK
  $B348  00        BRK
  $B349  00        BRK
  $B34A  00        BRK
  $B34B  00        BRK
  $B34C  00        BRK
  $B34D  00        BRK
  $B34E  00        BRK
  $B34F  00        BRK
  $B350  00        BRK
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
  $B35E  00        BRK
  $B35F  00        BRK
  $B360  00        BRK
  $B361  00        BRK
  $B362  00        BRK
  $B363  00        BRK
  $B364  00        BRK
  $B365  00        BRK
  $B366  00        BRK
  $B367  00        BRK
  $B368  00        BRK
  $B369  00        BRK
  $B36A  00        BRK
  $B36B  00        BRK
  $B36C  00        BRK
  $B36D  00        BRK
  $B36E  00        BRK
  $B36F  00        BRK
  $B370  00        BRK
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
  $B385  00        BRK
  $B386  00        BRK
  $B387  00        BRK
  $B388  00        BRK
  $B389  00        BRK
  $B38A  00        BRK
  $B38B  00        BRK
  $B38C  00        BRK
  $B38D  00        BRK
  $B38E  00        BRK
  $B38F  00        BRK
  $B390  00        BRK
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
  $B3A5  00        BRK
  $B3A6  00        BRK
  $B3A7  00        BRK
  $B3A8  00        BRK
  $B3A9  00        BRK
  $B3AA  00        BRK
  $B3AB  00        BRK
  $B3AC  00        BRK
  $B3AD  00        BRK
  $B3AE  00        BRK
  $B3AF  00        BRK
  $B3B0  00        BRK
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
  $B3C5  00        BRK
  $B3C6  00        BRK
  $B3C7  00        BRK
  $B3C8  00        BRK
  $B3C9  00        BRK
  $B3CA  00        BRK
  $B3CB  00        BRK
  $B3CC  00        BRK
  $B3CD  00        BRK
  $B3CE  00        BRK
  $B3CF  00        BRK
  $B3D0  00        BRK
  $B3D1  00        BRK
  $B3D2  00        BRK
  $B3D3  00        BRK
  $B3D4  00        BRK
  $B3D5  00        BRK
  $B3D6  00        BRK
  $B3D7  00        BRK
  $B3D8  00        BRK
  $B3D9  00        BRK
  $B3DA  00        BRK
  $B3DB  00        BRK
  $B3DC  00        BRK
  $B3DD  00        BRK
  $B3DE  00        BRK
  $B3DF  00        BRK

L_B3E0:
  $B3E0  00        BRK
  $B3E1  00        BRK
  $B3E2  00        BRK
  $B3E3  00        BRK
  $B3E4  00        BRK
  $B3E5  00        BRK
  $B3E6  00        BRK
  $B3E7  00        BRK
  $B3E8  00        BRK
  $B3E9  00        BRK
  $B3EA  00        BRK
  $B3EB  00        BRK
  $B3EC  00        BRK
  $B3ED  00        BRK
  $B3EE  00        BRK
  $B3EF  00        BRK
  $B3F0  00        BRK
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
  $B400  44        .db $44
  $B401  40        RTI
  $B402  20 20 20  JSR $2020
  $B405  80        .db $80
  $B406  80        .db $80
  $B407  44        .db $44
  $B408  40        RTI
  $B409  40        RTI
  $B40A  40        RTI
  $B40B  22        .db $22
  $B40C  20 00 40  JSR $4000
  $B40F  40        RTI
  $B410  40        RTI
  $B411  44        .db $44
  $B412  40        RTI
  $B413  40        RTI
  $B414  40        RTI
  $B415  40        RTI
  $B416  22        .db $22
  $B417  00        BRK
  $B418  00        BRK
  $B419  00        BRK
  $B41A  FF        .db $FF
  $B41B  FF        .db $FF
  $B41C  FF        .db $FF
  $B41D  FF        .db $FF
  $B41E  FF        .db $FF
  $B41F  FF        .db $FF
  $B420  FF        .db $FF
  $B421  FF        .db $FF
  $B422  FF        .db $FF
  $B423  FF        .db $FF
  $B424  FF        .db $FF
  $B425  FF        .db $FF
  $B426  FF        .db $FF
  $B427  FF        .db $FF
  $B428  FF        .db $FF
  $B429  FF        .db $FF
  $B42A  FF        .db $FF
  $B42B  FF        .db $FF
  $B42C  36 12     ROL $12,X
  $B42E  5A        .db $5A
  $B42F  5A        .db $5A
  $B430  5A        .db $5A
  $B431  12        .db $12
  $B432  12        .db $12
  $B433  24 36     BIT $36
  $B435  36 36     ROL $36,X
  $B437  48        PHA
  $B438  00        BRK
  $B439  6C 00 12  JMP ($1200)
  $B43C  90 A2     BCC $B3E0
  $B43E  00        BRK
  $B43F  12        .db $12
  $B440  5A        .db $5A
  $B441  5A        .db $5A
  $B442  00        BRK
  $B443  7E FF FF  ROR $FFFF,X
  $B446  FF        .db $FF
  $B447  FF        .db $FF
  $B448  FF        .db $FF
  $B449  FF        .db $FF
  $B44A  FF        .db $FF
  $B44B  FF        .db $FF
  $B44C  FF        .db $FF
  $B44D  FF        .db $FF
  $B44E  FF        .db $FF
  $B44F  FF        .db $FF
  $B450  FF        .db $FF
  $B451  FF        .db $FF
  $B452  FF        .db $FF
  $B453  FF        .db $FF
  $B454  FF        .db $FF
  $B455  FF        .db $FF
  $B456  FF        .db $FF
  $B457  FF        .db $FF
  $B458  FF        .db $FF
  $B459  FF        .db $FF
  $B45A  FF        .db $FF
  $B45B  FF        .db $FF
  $B45C  FF        .db $FF
  $B45D  FF        .db $FF
  $B45E  FF        .db $FF
  $B45F  FF        .db $FF
  $B460  98        TYA
  $B461  03        .db $03
  $B462  99 03 9A  STA $9A03,Y
  $B465  03        .db $03
  $B466  9B        .db $9B
  $B467  03        .db $03
  $B468  9F        .db $9F
  $B469  04        .db $04
  $B46A  9F        .db $9F
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  11 30     ORA ($30),Y
  $B46F  0F        .db $0F
  $B470  16 27     ASL $27,X
  $B472  93        .db $93
  $B473  02        .db $02
  $B474  93        .db $93
  $B475  02        .db $02
  $B476  93        .db $93
  $B477  02        .db $02
  $B478  94 02     STY $02,X
  $B47A  93        .db $93
  $B47B  02        .db $02
  $B47C  9F        .db $9F
  $B47D  03        .db $03
  $B47E  0F        .db $0F
  $B47F  16 30     ASL $30,X
  $B481  0F        .db $0F
  $B482  16 30     ASL $30,X
  $B484  98        TYA
  $B485  01 99     ORA ($99,X)
  $B487  01 9A     ORA ($9A,X)
  $B489  01 9B     ORA ($9B,X)
  $B48B  01 9C     ORA ($9C,X)
  $B48D  01 9F     ORA ($9F,X)
  $B48F  03        .db $03
  $B490  0F        .db $0F
  $B491  16 27     ASL $27,X
  $B493  0F        .db $0F
  $B494  11 31     ORA ($31),Y
  $B496  98        TYA
  $B497  02        .db $02
  $B498  99 02 9A  STA $9A02,Y
  $B49B  02        .db $02
  $B49C  94 02     STY $02,X
  $B49E  93        .db $93
  $B49F  02        .db $02
  $B4A0  9F        .db $9F
  $B4A1  03        .db $03
  $B4A2  0F        .db $0F
  $B4A3  15 30     ORA $30,X
  $B4A5  0F        .db $0F
  $B4A6  14        .db $14
  $B4A7  34        .db $34
  $B4A8  90 01     BCC $B4AB
  $B4AA  91 01     STA ($01),Y
  $B4AC  92        .db $92
  $B4AD  01 93     ORA ($93,X)
  $B4AF  01 91     ORA ($91,X)
  $B4B1  01 9F     ORA ($9F,X)
  $B4B3  03        .db $03
  $B4B4  0F        .db $0F
  $B4B5  16 27     ASL $27,X
  $B4B7  0F        .db $0F
  $B4B8  16 27     ASL $27,X
  $B4BA  98        TYA
  $B4BB  04        .db $04
  $B4BC  99 04 9A  STA $9A04,Y
  $B4BF  04        .db $04
  $B4C0  9B        .db $9B
  $B4C1  04        .db $04
  $B4C2  96 03     STX $03,Y
  $B4C4  96 03     STX $03,Y
  $B4C6  0F        .db $0F
  $B4C7  15 28     ORA $28,X
  $B4C9  0F        .db $0F
  $B4CA  12        .db $12
  $B4CB  2C AC 06  BIT $06AC
  $B4CE  AD 06 AE  LDA $AE06
  $B4D1  06 AF     ASL $AF
  $B4D3  06 B0     ASL $B0
  $B4D5  06 B1     ASL $B1
  $B4D7  06 0F     ASL $0F
  $B4D9  30 29     BMI $B504
  $B4DB  0F        .db $0F
  $B4DC  36 17     ROL $17,X
  $B4DE  AF        .db $AF
  $B4DF  07        .db $07
  $B4E0  B0 07     BCS $B4E9
  $B4E2  92        .db $92
  $B4E3  02        .db $02
  $B4E4  9A        TXS
  $B4E5  03        .db $03
  $B4E6  B1 07     LDA ($07),Y
  $B4E8  B1 06     LDA ($06),Y
  $B4EA  0F        .db $0F
  $B4EB  27        .db $27
  $B4EC  30 0F     BMI $B4FD
  $B4EE  37        .db $37
  $B4EF  27        .db $27
  $B4F0  9B        .db $9B
  $B4F1  03        .db $03
  $B4F2  9C        .db $9C
  $B4F3  03        .db $03
  $B4F4  9C        .db $9C
  $B4F5  03        .db $03
  $B4F6  9D 03 9E  STA $9E03,X
  $B4F9  03        .db $03
  $B4FA  9F        .db $9F
  $B4FB  03        .db $03
  $B4FC  0F        .db $0F

L_B4FD:
  $B4FD  16 27     ASL $27,X
  $B4FF  0F        .db $0F
  $B500  15 28     ORA $28,X
  $B502  94 04     STY $04,X

L_B504:
  $B504  95 04     STA $04,X
  $B506  96 04     STX $04,Y
  $B508  97        .db $97
  $B509  04        .db $04
  $B50A  9F        .db $9F
  $B50B  04        .db $04
  $B50C  9F        .db $9F
  $B50D  03        .db $03
  $B50E  0F        .db $0F
  $B50F  10 00     BPL $B511

L_B511:
  $B511  0F        .db $0F
  $B512  10 00     BPL $B514

L_B514:
  $B514  FF        .db $FF
  $B515  FF        .db $FF
  $B516  FF        .db $FF
  $B517  FF        .db $FF
  $B518  FF        .db $FF
  $B519  FF        .db $FF
  $B51A  FF        .db $FF
  $B51B  FF        .db $FF
  $B51C  FF        .db $FF
  $B51D  FF        .db $FF
  $B51E  FF        .db $FF
  $B51F  FF        .db $FF
  $B520  FF        .db $FF
  $B521  FF        .db $FF
  $B522  FF        .db $FF
  $B523  FF        .db $FF
  $B524  FF        .db $FF
  $B525  FF        .db $FF
  $B526  FF        .db $FF
  $B527  FF        .db $FF
  $B528  FF        .db $FF
  $B529  FF        .db $FF
  $B52A  FF        .db $FF
  $B52B  FF        .db $FF
  $B52C  FF        .db $FF
  $B52D  FF        .db $FF
  $B52E  FF        .db $FF
  $B52F  FF        .db $FF
  $B530  FF        .db $FF
  $B531  FF        .db $FF
  $B532  FF        .db $FF
  $B533  FF        .db $FF
  $B534  FF        .db $FF
  $B535  FF        .db $FF
  $B536  FF        .db $FF
  $B537  FF        .db $FF
  $B538  FF        .db $FF
  $B539  FF        .db $FF
  $B53A  FF        .db $FF
  $B53B  FF        .db $FF
  $B53C  FF        .db $FF
  $B53D  FF        .db $FF
  $B53E  FF        .db $FF
  $B53F  FF        .db $FF
  $B540  FF        .db $FF
  $B541  FF        .db $FF
  $B542  FF        .db $FF
  $B543  FF        .db $FF
  $B544  FF        .db $FF
  $B545  FF        .db $FF
  $B546  FF        .db $FF
  $B547  FF        .db $FF
  $B548  FF        .db $FF
  $B549  FF        .db $FF
  $B54A  FF        .db $FF
  $B54B  FF        .db $FF
  $B54C  FF        .db $FF
  $B54D  FF        .db $FF
  $B54E  FF        .db $FF
  $B54F  FF        .db $FF
  $B550  FF        .db $FF
  $B551  FF        .db $FF
  $B552  FF        .db $FF
  $B553  FF        .db $FF
  $B554  FF        .db $FF
  $B555  FF        .db $FF
  $B556  FF        .db $FF
  $B557  FF        .db $FF
  $B558  FF        .db $FF
  $B559  FF        .db $FF
  $B55A  FF        .db $FF
  $B55B  FF        .db $FF
  $B55C  FF        .db $FF
  $B55D  FF        .db $FF
  $B55E  FF        .db $FF
  $B55F  FF        .db $FF
  $B560  FF        .db $FF
  $B561  FF        .db $FF
  $B562  FF        .db $FF
  $B563  FF        .db $FF
  $B564  FF        .db $FF
  $B565  FF        .db $FF
  $B566  FF        .db $FF
  $B567  FF        .db $FF
  $B568  FF        .db $FF
  $B569  FF        .db $FF
  $B56A  FF        .db $FF
  $B56B  FF        .db $FF
  $B56C  FF        .db $FF
  $B56D  FF        .db $FF
  $B56E  FF        .db $FF
  $B56F  FF        .db $FF
  $B570  FF        .db $FF
  $B571  FF        .db $FF
  $B572  FF        .db $FF
  $B573  FF        .db $FF
  $B574  FF        .db $FF
  $B575  FF        .db $FF
  $B576  FF        .db $FF
  $B577  FF        .db $FF
  $B578  FF        .db $FF
  $B579  FF        .db $FF
  $B57A  FF        .db $FF
  $B57B  FF        .db $FF
  $B57C  FF        .db $FF
  $B57D  FF        .db $FF
  $B57E  FF        .db $FF
  $B57F  FF        .db $FF
  $B580  FF        .db $FF
  $B581  FF        .db $FF
  $B582  FF        .db $FF
  $B583  FF        .db $FF
  $B584  FF        .db $FF
  $B585  FF        .db $FF
  $B586  FF        .db $FF
  $B587  FF        .db $FF
  $B588  FF        .db $FF
  $B589  FF        .db $FF
  $B58A  FF        .db $FF
  $B58B  FF        .db $FF
  $B58C  FF        .db $FF
  $B58D  FF        .db $FF
  $B58E  FF        .db $FF
  $B58F  FF        .db $FF
  $B590  FF        .db $FF
  $B591  FF        .db $FF
  $B592  FF        .db $FF
  $B593  FF        .db $FF
  $B594  FF        .db $FF
  $B595  FF        .db $FF
  $B596  FF        .db $FF
  $B597  FF        .db $FF
  $B598  FF        .db $FF
  $B599  FF        .db $FF
  $B59A  FF        .db $FF
  $B59B  FF        .db $FF
  $B59C  FF        .db $FF
  $B59D  FF        .db $FF
  $B59E  FF        .db $FF
  $B59F  FF        .db $FF
  $B5A0  FF        .db $FF
  $B5A1  FF        .db $FF
  $B5A2  FF        .db $FF
  $B5A3  FF        .db $FF
  $B5A4  FF        .db $FF
  $B5A5  FF        .db $FF
  $B5A6  FF        .db $FF
  $B5A7  FF        .db $FF
  $B5A8  FF        .db $FF
  $B5A9  FF        .db $FF
  $B5AA  FF        .db $FF
  $B5AB  FF        .db $FF
  $B5AC  FF        .db $FF
  $B5AD  FF        .db $FF
  $B5AE  FF        .db $FF
  $B5AF  FF        .db $FF
  $B5B0  FF        .db $FF
  $B5B1  FF        .db $FF
  $B5B2  FF        .db $FF
  $B5B3  FF        .db $FF
  $B5B4  FF        .db $FF
  $B5B5  FF        .db $FF
  $B5B6  FF        .db $FF
  $B5B7  FF        .db $FF
  $B5B8  FF        .db $FF
  $B5B9  FF        .db $FF
  $B5BA  FF        .db $FF
  $B5BB  FF        .db $FF
  $B5BC  FF        .db $FF
  $B5BD  FF        .db $FF
  $B5BE  FF        .db $FF
  $B5BF  FF        .db $FF
  $B5C0  FF        .db $FF
  $B5C1  FF        .db $FF
  $B5C2  FF        .db $FF
  $B5C3  FF        .db $FF
  $B5C4  FF        .db $FF
  $B5C5  FF        .db $FF
  $B5C6  FF        .db $FF
  $B5C7  FF        .db $FF
  $B5C8  FF        .db $FF
  $B5C9  FF        .db $FF
  $B5CA  FF        .db $FF
  $B5CB  FF        .db $FF
  $B5CC  FF        .db $FF
  $B5CD  FF        .db $FF
  $B5CE  FF        .db $FF
  $B5CF  FF        .db $FF
  $B5D0  FF        .db $FF
  $B5D1  FF        .db $FF
  $B5D2  FF        .db $FF
  $B5D3  FF        .db $FF
  $B5D4  FF        .db $FF
  $B5D5  FF        .db $FF
  $B5D6  FF        .db $FF
  $B5D7  FF        .db $FF
  $B5D8  FF        .db $FF
  $B5D9  FF        .db $FF
  $B5DA  FF        .db $FF
  $B5DB  FF        .db $FF
  $B5DC  FF        .db $FF
  $B5DD  FF        .db $FF
  $B5DE  FF        .db $FF
  $B5DF  FF        .db $FF
  $B5E0  FF        .db $FF
  $B5E1  FF        .db $FF
  $B5E2  FF        .db $FF
  $B5E3  FF        .db $FF
  $B5E4  FF        .db $FF
  $B5E5  FF        .db $FF
  $B5E6  FF        .db $FF
  $B5E7  FF        .db $FF
  $B5E8  FF        .db $FF
  $B5E9  FF        .db $FF
  $B5EA  FF        .db $FF
  $B5EB  FF        .db $FF
  $B5EC  FF        .db $FF
  $B5ED  FF        .db $FF
  $B5EE  FF        .db $FF
  $B5EF  FF        .db $FF
  $B5F0  FF        .db $FF
  $B5F1  FF        .db $FF
  $B5F2  FF        .db $FF
  $B5F3  FF        .db $FF
  $B5F4  FF        .db $FF
  $B5F5  FF        .db $FF
  $B5F6  FF        .db $FF
  $B5F7  FF        .db $FF
  $B5F8  FF        .db $FF
  $B5F9  FF        .db $FF
  $B5FA  FF        .db $FF
  $B5FB  FF        .db $FF
  $B5FC  FF        .db $FF
  $B5FD  FF        .db $FF
  $B5FE  FF        .db $FF
  $B5FF  FF        .db $FF
  $B600  01 01     ORA ($01,X)
  $B602  01 01     ORA ($01,X)
  $B604  01 02     ORA ($02,X)
  $B606  02        .db $02
  $B607  02        .db $02
  $B608  03        .db $03
  $B609  03        .db $03
  $B60A  04        .db $04
  $B60B  04        .db $04
  $B60C  04        .db $04
  $B60D  05 05     ORA $05
  $B60F  05 06     ORA $06
  $B611  07        .db $07
  $B612  08        PHP
  $B613  0A        ASL
  $B614  0A        ASL
  $B615  0C        .db $0C
  $B616  0C        .db $0C
  $B617  0C        .db $0C
  $B618  0D 0D 0D  ORA $0D0D
  $B61B  0E 0E 10  ASL $100E
  $B61E  11 12     ORA ($12),Y
  $B620  13        .db $13
  $B621  14        .db $14
  $B622  14        .db $14
  $B623  15 1A     ORA $1A,X
  $B625  1D 1E 25  ORA $251E,X
  $B628  25 26     AND $26
  $B62A  23        .db $23
  $B62B  FF        .db $FF
  $B62C  FF        .db $FF
  $B62D  FF        .db $FF
  $B62E  FF        .db $FF
  $B62F  FF        .db $FF
  $B630  FF        .db $FF
  $B631  FF        .db $FF
  $B632  FF        .db $FF
  $B633  FF        .db $FF
  $B634  FF        .db $FF
  $B635  FF        .db $FF
  $B636  FF        .db $FF
  $B637  FF        .db $FF
  $B638  FF        .db $FF
  $B639  FF        .db $FF
  $B63A  FF        .db $FF
  $B63B  FF        .db $FF
  $B63C  FF        .db $FF
  $B63D  FF        .db $FF
  $B63E  FF        .db $FF
  $B63F  FF        .db $FF
  $B640  FF        .db $FF
  $B641  FF        .db $FF
  $B642  FF        .db $FF
  $B643  FF        .db $FF
  $B644  FF        .db $FF
  $B645  FF        .db $FF
  $B646  FF        .db $FF
  $B647  FF        .db $FF
  $B648  FF        .db $FF
  $B649  FF        .db $FF
  $B64A  FF        .db $FF
  $B64B  FF        .db $FF
  $B64C  FF        .db $FF
  $B64D  FF        .db $FF
  $B64E  FF        .db $FF
  $B64F  FF        .db $FF
  $B650  FF        .db $FF
  $B651  FF        .db $FF
  $B652  FF        .db $FF
  $B653  FF        .db $FF
  $B654  FF        .db $FF
  $B655  FF        .db $FF
  $B656  FF        .db $FF
  $B657  FF        .db $FF
  $B658  FF        .db $FF
  $B659  FF        .db $FF
  $B65A  FF        .db $FF
  $B65B  FF        .db $FF
  $B65C  FF        .db $FF
  $B65D  FF        .db $FF
  $B65E  FF        .db $FF
  $B65F  FF        .db $FF
  $B660  FF        .db $FF
  $B661  FF        .db $FF
  $B662  FF        .db $FF
  $B663  FF        .db $FF
  $B664  FF        .db $FF
  $B665  FF        .db $FF
  $B666  FF        .db $FF
  $B667  FF        .db $FF
  $B668  FF        .db $FF
  $B669  FF        .db $FF
  $B66A  FF        .db $FF
  $B66B  FF        .db $FF
  $B66C  FF        .db $FF
  $B66D  FF        .db $FF
  $B66E  FF        .db $FF
  $B66F  FF        .db $FF
  $B670  FF        .db $FF
  $B671  FF        .db $FF
  $B672  FF        .db $FF
  $B673  FF        .db $FF
  $B674  FF        .db $FF
  $B675  FF        .db $FF
  $B676  FF        .db $FF
  $B677  FF        .db $FF
  $B678  FF        .db $FF
  $B679  FF        .db $FF
  $B67A  FF        .db $FF
  $B67B  FF        .db $FF
  $B67C  FF        .db $FF
  $B67D  FF        .db $FF
  $B67E  FF        .db $FF
  $B67F  FF        .db $FF
  $B680  FF        .db $FF
  $B681  FF        .db $FF
  $B682  FF        .db $FF
  $B683  FF        .db $FF
  $B684  FF        .db $FF
  $B685  FF        .db $FF
  $B686  FF        .db $FF
  $B687  FF        .db $FF
  $B688  FF        .db $FF
  $B689  FF        .db $FF
  $B68A  FF        .db $FF
  $B68B  FF        .db $FF
  $B68C  FF        .db $FF
  $B68D  FF        .db $FF
  $B68E  FF        .db $FF
  $B68F  FF        .db $FF
  $B690  FF        .db $FF
  $B691  FF        .db $FF
  $B692  FF        .db $FF
  $B693  FF        .db $FF
  $B694  FF        .db $FF
  $B695  FF        .db $FF
  $B696  FF        .db $FF
  $B697  FF        .db $FF
  $B698  FF        .db $FF
  $B699  FF        .db $FF
  $B69A  FF        .db $FF
  $B69B  FF        .db $FF
  $B69C  FF        .db $FF
  $B69D  FF        .db $FF
  $B69E  FF        .db $FF
  $B69F  FF        .db $FF
  $B6A0  FF        .db $FF
  $B6A1  FF        .db $FF
  $B6A2  FF        .db $FF
  $B6A3  FF        .db $FF
  $B6A4  FF        .db $FF
  $B6A5  FF        .db $FF
  $B6A6  FF        .db $FF
  $B6A7  FF        .db $FF
  $B6A8  FF        .db $FF
  $B6A9  FF        .db $FF
  $B6AA  FF        .db $FF
  $B6AB  FF        .db $FF
  $B6AC  FF        .db $FF
  $B6AD  FF        .db $FF
  $B6AE  FF        .db $FF
  $B6AF  FF        .db $FF
  $B6B0  FF        .db $FF
  $B6B1  FF        .db $FF
  $B6B2  FF        .db $FF
  $B6B3  FF        .db $FF
  $B6B4  FF        .db $FF
  $B6B5  FF        .db $FF
  $B6B6  FF        .db $FF
  $B6B7  FF        .db $FF
  $B6B8  FF        .db $FF
  $B6B9  FF        .db $FF
  $B6BA  FF        .db $FF
  $B6BB  FF        .db $FF
  $B6BC  FF        .db $FF
  $B6BD  FF        .db $FF
  $B6BE  FF        .db $FF
  $B6BF  FF        .db $FF
  $B6C0  FF        .db $FF
  $B6C1  FF        .db $FF
  $B6C2  FF        .db $FF
  $B6C3  FF        .db $FF
  $B6C4  FF        .db $FF
  $B6C5  FF        .db $FF
  $B6C6  FF        .db $FF
  $B6C7  FF        .db $FF
  $B6C8  FF        .db $FF
  $B6C9  FF        .db $FF
  $B6CA  FF        .db $FF
  $B6CB  FF        .db $FF
  $B6CC  FF        .db $FF
  $B6CD  FF        .db $FF
  $B6CE  FF        .db $FF
  $B6CF  FF        .db $FF
  $B6D0  FF        .db $FF
  $B6D1  FF        .db $FF
  $B6D2  FF        .db $FF

L_B6D3:
  $B6D3  FF        .db $FF
  $B6D4  FF        .db $FF
  $B6D5  FF        .db $FF
  $B6D6  FF        .db $FF
  $B6D7  FF        .db $FF
  $B6D8  FF        .db $FF
  $B6D9  FF        .db $FF
  $B6DA  FF        .db $FF
  $B6DB  FF        .db $FF
  $B6DC  FF        .db $FF
  $B6DD  FF        .db $FF
  $B6DE  FF        .db $FF
  $B6DF  FF        .db $FF
  $B6E0  FF        .db $FF
  $B6E1  FF        .db $FF
  $B6E2  FF        .db $FF
  $B6E3  FF        .db $FF
  $B6E4  FF        .db $FF
  $B6E5  FF        .db $FF
  $B6E6  FF        .db $FF
  $B6E7  FF        .db $FF
  $B6E8  FF        .db $FF
  $B6E9  FF        .db $FF
  $B6EA  FF        .db $FF
  $B6EB  FF        .db $FF
  $B6EC  FF        .db $FF
  $B6ED  FF        .db $FF
  $B6EE  FF        .db $FF
  $B6EF  FF        .db $FF
  $B6F0  FF        .db $FF
  $B6F1  FF        .db $FF
  $B6F2  FF        .db $FF
  $B6F3  FF        .db $FF
  $B6F4  FF        .db $FF
  $B6F5  FF        .db $FF
  $B6F6  FF        .db $FF
  $B6F7  FF        .db $FF
  $B6F8  FF        .db $FF
  $B6F9  FF        .db $FF
  $B6FA  FF        .db $FF

L_B6FB:
  $B6FB  FF        .db $FF
  $B6FC  FF        .db $FF

L_B6FD:
  $B6FD  FF        .db $FF
  $B6FE  FF        .db $FF
  $B6FF  FF        .db $FF
  $B700  08        PHP
  $B701  48        PHA
  $B702  88        DEY
  $B703  F0 F8     BEQ $B6FD
  $B705  38        SEC
  $B706  88        DEY
  $B707  F0 48     BEQ $B751
  $B709  B8        CLV
  $B70A  18        CLC
  $B70B  80        .db $80
  $B70C  98        TYA

L_B70D:
  $B70D  38        SEC
  $B70E  60        RTS
  $B70F  80        .db $80
  $B710  AC AC CC  LDY $CCAC
  $B713  50 78     BVC $B78D
  $B715  30 70     BMI $B787
  $B717  F0 40     BEQ $B759
  $B719  B0 E0     BCS $B6FB
  $B71B  70 F0     BVS $B70D
  $B71D  48        PHA
  $B71E  C0 38     CPY #$38
  $B720  00        BRK
  $B721  10 B0     BPL $B6D3
  $B723  C0 BC     CPY #$BC
  $B725  20 20 2C  JSR $2C20
  $B728  CC 5C 80  CPY $805C
  $B72B  FF        .db $FF
  $B72C  FF        .db $FF
  $B72D  FF        .db $FF
  $B72E  FF        .db $FF
  $B72F  FF        .db $FF
  $B730  FF        .db $FF
  $B731  FF        .db $FF
  $B732  FF        .db $FF
  $B733  FF        .db $FF
  $B734  FF        .db $FF
  $B735  FF        .db $FF
  $B736  FF        .db $FF
  $B737  FF        .db $FF
  $B738  FF        .db $FF
  $B739  FF        .db $FF
  $B73A  FF        .db $FF
  $B73B  FF        .db $FF
  $B73C  FF        .db $FF
  $B73D  FF        .db $FF
  $B73E  FF        .db $FF
  $B73F  FF        .db $FF
  $B740  FF        .db $FF
  $B741  FF        .db $FF
  $B742  FF        .db $FF
  $B743  FF        .db $FF
  $B744  FF        .db $FF
  $B745  FF        .db $FF
  $B746  FF        .db $FF
  $B747  FF        .db $FF
  $B748  FF        .db $FF
  $B749  FF        .db $FF
  $B74A  FF        .db $FF
  $B74B  FF        .db $FF
  $B74C  FF        .db $FF
  $B74D  FF        .db $FF
  $B74E  FF        .db $FF
  $B74F  FF        .db $FF
  $B750  FF        .db $FF

L_B751:
  $B751  FF        .db $FF
  $B752  FF        .db $FF
  $B753  FF        .db $FF
  $B754  FF        .db $FF
  $B755  FF        .db $FF
  $B756  FF        .db $FF
  $B757  FF        .db $FF
  $B758  FF        .db $FF

L_B759:
  $B759  FF        .db $FF
  $B75A  FF        .db $FF
  $B75B  FF        .db $FF
  $B75C  FF        .db $FF
  $B75D  FF        .db $FF
  $B75E  FF        .db $FF
  $B75F  FF        .db $FF
  $B760  FF        .db $FF
  $B761  FF        .db $FF
  $B762  FF        .db $FF
  $B763  FF        .db $FF
  $B764  FF        .db $FF
  $B765  FF        .db $FF
  $B766  FF        .db $FF
  $B767  FF        .db $FF
  $B768  FF        .db $FF
  $B769  FF        .db $FF
  $B76A  FF        .db $FF
  $B76B  FF        .db $FF
  $B76C  FF        .db $FF
  $B76D  FF        .db $FF
  $B76E  FF        .db $FF
  $B76F  FF        .db $FF
  $B770  FF        .db $FF
  $B771  FF        .db $FF
  $B772  FF        .db $FF
  $B773  FF        .db $FF
  $B774  FF        .db $FF
  $B775  FF        .db $FF
  $B776  FF        .db $FF
  $B777  FF        .db $FF
  $B778  FF        .db $FF
  $B779  FF        .db $FF
  $B77A  FF        .db $FF
  $B77B  FF        .db $FF
  $B77C  FF        .db $FF
  $B77D  FF        .db $FF
  $B77E  FF        .db $FF
  $B77F  FF        .db $FF
  $B780  FF        .db $FF
  $B781  FF        .db $FF
  $B782  FF        .db $FF
  $B783  FF        .db $FF
  $B784  FF        .db $FF
  $B785  FF        .db $FF
  $B786  FF        .db $FF

L_B787:
  $B787  FF        .db $FF
  $B788  FF        .db $FF
  $B789  FF        .db $FF
  $B78A  FF        .db $FF
  $B78B  FF        .db $FF
  $B78C  FF        .db $FF

L_B78D:
  $B78D  FF        .db $FF
  $B78E  FF        .db $FF
  $B78F  FF        .db $FF
  $B790  FF        .db $FF
  $B791  FF        .db $FF
  $B792  FF        .db $FF
  $B793  FF        .db $FF
  $B794  FF        .db $FF
  $B795  FF        .db $FF
  $B796  FF        .db $FF
  $B797  FF        .db $FF
  $B798  FF        .db $FF
  $B799  FF        .db $FF
  $B79A  FF        .db $FF
  $B79B  FF        .db $FF
  $B79C  FF        .db $FF
  $B79D  FF        .db $FF
  $B79E  FF        .db $FF
  $B79F  FF        .db $FF
  $B7A0  FF        .db $FF
  $B7A1  FF        .db $FF
  $B7A2  FF        .db $FF
  $B7A3  FF        .db $FF
  $B7A4  FF        .db $FF
  $B7A5  FF        .db $FF
  $B7A6  FF        .db $FF
  $B7A7  FF        .db $FF
  $B7A8  FF        .db $FF
  $B7A9  FF        .db $FF
  $B7AA  FF        .db $FF
  $B7AB  FF        .db $FF
  $B7AC  FF        .db $FF
  $B7AD  FF        .db $FF
  $B7AE  FF        .db $FF
  $B7AF  FF        .db $FF
  $B7B0  FF        .db $FF
  $B7B1  FF        .db $FF
  $B7B2  FF        .db $FF
  $B7B3  FF        .db $FF
  $B7B4  FF        .db $FF
  $B7B5  FF        .db $FF
  $B7B6  FF        .db $FF
  $B7B7  FF        .db $FF
  $B7B8  FF        .db $FF
  $B7B9  FF        .db $FF
  $B7BA  FF        .db $FF
  $B7BB  FF        .db $FF
  $B7BC  FF        .db $FF
  $B7BD  FF        .db $FF
  $B7BE  FF        .db $FF
  $B7BF  FF        .db $FF
  $B7C0  FF        .db $FF
  $B7C1  FF        .db $FF
  $B7C2  FF        .db $FF
  $B7C3  FF        .db $FF
  $B7C4  FF        .db $FF
  $B7C5  FF        .db $FF
  $B7C6  FF        .db $FF
  $B7C7  FF        .db $FF
  $B7C8  FF        .db $FF
  $B7C9  FF        .db $FF
  $B7CA  FF        .db $FF
  $B7CB  FF        .db $FF
  $B7CC  FF        .db $FF
  $B7CD  FF        .db $FF
  $B7CE  FF        .db $FF

L_B7CF:
  $B7CF  FF        .db $FF
  $B7D0  FF        .db $FF
  $B7D1  FF        .db $FF
  $B7D2  FF        .db $FF
  $B7D3  FF        .db $FF
  $B7D4  FF        .db $FF
  $B7D5  FF        .db $FF
  $B7D6  FF        .db $FF
  $B7D7  FF        .db $FF
  $B7D8  FF        .db $FF
  $B7D9  FF        .db $FF
  $B7DA  FF        .db $FF
  $B7DB  FF        .db $FF
  $B7DC  FF        .db $FF
  $B7DD  FF        .db $FF
  $B7DE  FF        .db $FF
  $B7DF  FF        .db $FF
  $B7E0  FF        .db $FF
  $B7E1  FF        .db $FF
  $B7E2  FF        .db $FF
  $B7E3  FF        .db $FF
  $B7E4  FF        .db $FF
  $B7E5  FF        .db $FF
  $B7E6  FF        .db $FF
  $B7E7  FF        .db $FF
  $B7E8  FF        .db $FF
  $B7E9  FF        .db $FF
  $B7EA  FF        .db $FF
  $B7EB  FF        .db $FF
  $B7EC  FF        .db $FF
  $B7ED  FF        .db $FF
  $B7EE  FF        .db $FF
  $B7EF  FF        .db $FF
  $B7F0  FF        .db $FF
  $B7F1  FF        .db $FF
  $B7F2  FF        .db $FF
  $B7F3  FF        .db $FF
  $B7F4  FF        .db $FF
  $B7F5  FF        .db $FF
  $B7F6  FF        .db $FF
  $B7F7  FF        .db $FF
  $B7F8  FF        .db $FF
  $B7F9  FF        .db $FF
  $B7FA  FF        .db $FF
  $B7FB  FF        .db $FF
  $B7FC  FF        .db $FF
  $B7FD  FF        .db $FF
  $B7FE  FF        .db $FF
  $B7FF  FF        .db $FF
  $B800  48        PHA
  $B801  68        PLA
  $B802  48        PHA
  $B803  90 18     BCC $B81D
  $B805  18        CLC
  $B806  28        PLP
  $B807  A0 68     LDY #$68
  $B809  48        PHA
  $B80A  48        PHA
  $B80B  B0 48     BCS $B855
  $B80D  78        SEI
  $B80E  88        DEY
  $B80F  68        PLA
  $B810  08        PHP
  $B811  08        PHP
  $B812  08        PHP
  $B813  48        PHA
  $B814  68        PLA
  $B815  08        PHP
  $B816  E0 E0     CPX #$E0
  $B818  30 30     BMI $B84A
  $B81A  E0 E0     CPX #$E0
  $B81C  08        PHP

L_B81D:
  $B81D  B0 B0     BCS $B7CF
  $B81F  B0 08     BCS $B829
  $B821  08        PHP
  $B822  08        PHP
  $B823  08        PHP
  $B824  C4 E0     CPY $E0
  $B826  E0 B4     CPX #$B4
  $B828  B4 B4     LDY $B4,X
  $B82A  80        .db $80
  $B82B  FF        .db $FF
  $B82C  FF        .db $FF
  $B82D  FF        .db $FF
  $B82E  FF        .db $FF
  $B82F  FF        .db $FF
  $B830  FF        .db $FF
  $B831  FF        .db $FF
  $B832  FF        .db $FF
  $B833  FF        .db $FF
  $B834  FF        .db $FF
  $B835  FF        .db $FF
  $B836  FF        .db $FF
  $B837  FF        .db $FF
  $B838  FF        .db $FF
  $B839  FF        .db $FF
  $B83A  FF        .db $FF
  $B83B  FF        .db $FF
  $B83C  FF        .db $FF
  $B83D  FF        .db $FF
  $B83E  FF        .db $FF
  $B83F  FF        .db $FF
  $B840  FF        .db $FF
  $B841  FF        .db $FF
  $B842  FF        .db $FF
  $B843  FF        .db $FF
  $B844  FF        .db $FF
  $B845  FF        .db $FF
  $B846  FF        .db $FF
  $B847  FF        .db $FF
  $B848  FF        .db $FF
  $B849  FF        .db $FF

L_B84A:
  $B84A  FF        .db $FF
  $B84B  FF        .db $FF
  $B84C  FF        .db $FF
  $B84D  FF        .db $FF
  $B84E  FF        .db $FF
  $B84F  FF        .db $FF
  $B850  FF        .db $FF
  $B851  FF        .db $FF
  $B852  FF        .db $FF
  $B853  FF        .db $FF
  $B854  FF        .db $FF

L_B855:
  $B855  FF        .db $FF
  $B856  FF        .db $FF
  $B857  FF        .db $FF
  $B858  FF        .db $FF
  $B859  FF        .db $FF
  $B85A  FF        .db $FF
  $B85B  FF        .db $FF
  $B85C  FF        .db $FF
  $B85D  FF        .db $FF
  $B85E  FF        .db $FF
  $B85F  FF        .db $FF
  $B860  FF        .db $FF
  $B861  FF        .db $FF
  $B862  FF        .db $FF
  $B863  FF        .db $FF
  $B864  FF        .db $FF
  $B865  FF        .db $FF
  $B866  FF        .db $FF
  $B867  FF        .db $FF
  $B868  FF        .db $FF
  $B869  FF        .db $FF
  $B86A  FF        .db $FF
  $B86B  FF        .db $FF
  $B86C  FF        .db $FF
  $B86D  FF        .db $FF
  $B86E  FF        .db $FF
  $B86F  FF        .db $FF
  $B870  FF        .db $FF
  $B871  FF        .db $FF
  $B872  FF        .db $FF
  $B873  FF        .db $FF
  $B874  FF        .db $FF
  $B875  FF        .db $FF
  $B876  FF        .db $FF
  $B877  FF        .db $FF
  $B878  FF        .db $FF
  $B879  FF        .db $FF
  $B87A  FF        .db $FF
  $B87B  FF        .db $FF
  $B87C  FF        .db $FF
  $B87D  FF        .db $FF
  $B87E  FF        .db $FF
  $B87F  FF        .db $FF
  $B880  FF        .db $FF
  $B881  FF        .db $FF
  $B882  FF        .db $FF
  $B883  FF        .db $FF
  $B884  FF        .db $FF
  $B885  FF        .db $FF
  $B886  FF        .db $FF
  $B887  FF        .db $FF
  $B888  FF        .db $FF
  $B889  FF        .db $FF
  $B88A  FF        .db $FF
  $B88B  FF        .db $FF
  $B88C  FF        .db $FF
  $B88D  FF        .db $FF
  $B88E  FF        .db $FF
  $B88F  FF        .db $FF
  $B890  FF        .db $FF
  $B891  FF        .db $FF
  $B892  FF        .db $FF
  $B893  FF        .db $FF
  $B894  FF        .db $FF
  $B895  FF        .db $FF
  $B896  FF        .db $FF
  $B897  FF        .db $FF
  $B898  FF        .db $FF
  $B899  FF        .db $FF
  $B89A  FF        .db $FF
  $B89B  FF        .db $FF
  $B89C  FF        .db $FF
  $B89D  FF        .db $FF
  $B89E  FF        .db $FF
  $B89F  FF        .db $FF
  $B8A0  FF        .db $FF
  $B8A1  FF        .db $FF
  $B8A2  FF        .db $FF
  $B8A3  FF        .db $FF
  $B8A4  FF        .db $FF
  $B8A5  FF        .db $FF
  $B8A6  FF        .db $FF
  $B8A7  FF        .db $FF
  $B8A8  FF        .db $FF
  $B8A9  FF        .db $FF
  $B8AA  FF        .db $FF
  $B8AB  FF        .db $FF
  $B8AC  FF        .db $FF
  $B8AD  FF        .db $FF
  $B8AE  FF        .db $FF
  $B8AF  FF        .db $FF
  $B8B0  FF        .db $FF
  $B8B1  FF        .db $FF
  $B8B2  FF        .db $FF
  $B8B3  FF        .db $FF
  $B8B4  FF        .db $FF
  $B8B5  FF        .db $FF
  $B8B6  FF        .db $FF
  $B8B7  FF        .db $FF
  $B8B8  FF        .db $FF
  $B8B9  FF        .db $FF
  $B8BA  FF        .db $FF
  $B8BB  FF        .db $FF
  $B8BC  FF        .db $FF
  $B8BD  FF        .db $FF
  $B8BE  FF        .db $FF
  $B8BF  FF        .db $FF
  $B8C0  FF        .db $FF
  $B8C1  FF        .db $FF
  $B8C2  FF        .db $FF
  $B8C3  FF        .db $FF
  $B8C4  FF        .db $FF
  $B8C5  FF        .db $FF
  $B8C6  FF        .db $FF
  $B8C7  FF        .db $FF
  $B8C8  FF        .db $FF
  $B8C9  FF        .db $FF
  $B8CA  FF        .db $FF
  $B8CB  FF        .db $FF
  $B8CC  FF        .db $FF
  $B8CD  FF        .db $FF
  $B8CE  FF        .db $FF
  $B8CF  FF        .db $FF
  $B8D0  FF        .db $FF
  $B8D1  FF        .db $FF
  $B8D2  FF        .db $FF
  $B8D3  FF        .db $FF
  $B8D4  FF        .db $FF
  $B8D5  FF        .db $FF
  $B8D6  FF        .db $FF
  $B8D7  FF        .db $FF
  $B8D8  FF        .db $FF
  $B8D9  FF        .db $FF
  $B8DA  FF        .db $FF
  $B8DB  FF        .db $FF
  $B8DC  FF        .db $FF
  $B8DD  FF        .db $FF
  $B8DE  FF        .db $FF
  $B8DF  FF        .db $FF
  $B8E0  FF        .db $FF
  $B8E1  FF        .db $FF
  $B8E2  FF        .db $FF
  $B8E3  FF        .db $FF
  $B8E4  FF        .db $FF
  $B8E5  FF        .db $FF
  $B8E6  FF        .db $FF
  $B8E7  FF        .db $FF
  $B8E8  FF        .db $FF
  $B8E9  FF        .db $FF
  $B8EA  FF        .db $FF
  $B8EB  FF        .db $FF
  $B8EC  FF        .db $FF
  $B8ED  FF        .db $FF
  $B8EE  FF        .db $FF
  $B8EF  FF        .db $FF
  $B8F0  FF        .db $FF
  $B8F1  FF        .db $FF
  $B8F2  FF        .db $FF
  $B8F3  FF        .db $FF
  $B8F4  FF        .db $FF
  $B8F5  FF        .db $FF
  $B8F6  FF        .db $FF
  $B8F7  FF        .db $FF
  $B8F8  FF        .db $FF
  $B8F9  FF        .db $FF
  $B8FA  FF        .db $FF
  $B8FB  FF        .db $FF
  $B8FC  FF        .db $FF
  $B8FD  FF        .db $FF
  $B8FE  FF        .db $FF
  $B8FF  FF        .db $FF
  $B900  16 16     ASL $16,X
  $B902  16 17     ASL $17,X
  $B904  16 16     ASL $16,X
  $B906  16 17     ASL $17,X
  $B908  16 16     ASL $16,X
  $B90A  16 17     ASL $17,X
  $B90C  16 16     ASL $16,X
  $B90E  16 16     ASL $16,X
  $B910  1C        .db $1C
  $B911  1C        .db $1C
  $B912  1C        .db $1C
  $B913  16 16     ASL $16,X
  $B915  39 1D 1D  AND $1D1D,Y
  $B918  37        .db $37
  $B919  37        .db $37
  $B91A  1D 1D 39  ORA $391D,X
  $B91D  17        .db $17
  $B91E  17        .db $17
  $B91F  17        .db $17
  $B920  20 1E 1E  JSR $1E1E
  $B923  20 0A 71  JSR $710A
  $B926  71 4B     ADC ($4B),Y
  $B928  4B        .db $4B
  $B929  4B        .db $4B
  $B92A  56 FF     LSR $FF,X
  $B92C  FF        .db $FF
  $B92D  FF        .db $FF
  $B92E  FF        .db $FF
  $B92F  FF        .db $FF
  $B930  FF        .db $FF
  $B931  FF        .db $FF
  $B932  FF        .db $FF
  $B933  FF        .db $FF
  $B934  FF        .db $FF
  $B935  FF        .db $FF
  $B936  FF        .db $FF
  $B937  FF        .db $FF
  $B938  FF        .db $FF
  $B939  FF        .db $FF
  $B93A  FF        .db $FF
  $B93B  FF        .db $FF
  $B93C  FF        .db $FF
  $B93D  FF        .db $FF
  $B93E  FF        .db $FF
  $B93F  FF        .db $FF
  $B940  FF        .db $FF
  $B941  FF        .db $FF
  $B942  FF        .db $FF
  $B943  FF        .db $FF
  $B944  FF        .db $FF
  $B945  FF        .db $FF
  $B946  FF        .db $FF
  $B947  FF        .db $FF
  $B948  FF        .db $FF
  $B949  FF        .db $FF
  $B94A  FF        .db $FF
  $B94B  FF        .db $FF
  $B94C  FF        .db $FF
  $B94D  FF        .db $FF
  $B94E  FF        .db $FF
  $B94F  FF        .db $FF
  $B950  FF        .db $FF
  $B951  FF        .db $FF
  $B952  FF        .db $FF
  $B953  FF        .db $FF
  $B954  FF        .db $FF
  $B955  FF        .db $FF
  $B956  FF        .db $FF
  $B957  FF        .db $FF
  $B958  FF        .db $FF
  $B959  FF        .db $FF
  $B95A  FF        .db $FF
  $B95B  FF        .db $FF
  $B95C  FF        .db $FF
  $B95D  FF        .db $FF
  $B95E  FF        .db $FF
  $B95F  FF        .db $FF
  $B960  FF        .db $FF
  $B961  FF        .db $FF
  $B962  FF        .db $FF
  $B963  FF        .db $FF
  $B964  FF        .db $FF
  $B965  FF        .db $FF
  $B966  FF        .db $FF
  $B967  FF        .db $FF
  $B968  FF        .db $FF
  $B969  FF        .db $FF
  $B96A  FF        .db $FF
  $B96B  FF        .db $FF
  $B96C  FF        .db $FF
  $B96D  FF        .db $FF
  $B96E  FF        .db $FF
  $B96F  FF        .db $FF
  $B970  FF        .db $FF
  $B971  FF        .db $FF
  $B972  FF        .db $FF
  $B973  FF        .db $FF
  $B974  FF        .db $FF
  $B975  FF        .db $FF
  $B976  FF        .db $FF
  $B977  FF        .db $FF
  $B978  FF        .db $FF
  $B979  FF        .db $FF
  $B97A  FF        .db $FF
  $B97B  FF        .db $FF
  $B97C  FF        .db $FF
  $B97D  FF        .db $FF
  $B97E  FF        .db $FF
  $B97F  FF        .db $FF
  $B980  FF        .db $FF
  $B981  FF        .db $FF
  $B982  FF        .db $FF
  $B983  FF        .db $FF
  $B984  FF        .db $FF
  $B985  FF        .db $FF
  $B986  FF        .db $FF
  $B987  FF        .db $FF
  $B988  FF        .db $FF
  $B989  FF        .db $FF
  $B98A  FF        .db $FF
  $B98B  FF        .db $FF
  $B98C  FF        .db $FF
  $B98D  FF        .db $FF
  $B98E  FF        .db $FF
  $B98F  FF        .db $FF
  $B990  FF        .db $FF
  $B991  FF        .db $FF
  $B992  FF        .db $FF
  $B993  FF        .db $FF
  $B994  FF        .db $FF
  $B995  FF        .db $FF
  $B996  FF        .db $FF
  $B997  FF        .db $FF
  $B998  FF        .db $FF
  $B999  FF        .db $FF
  $B99A  FF        .db $FF
  $B99B  FF        .db $FF
  $B99C  FF        .db $FF
  $B99D  FF        .db $FF
  $B99E  FF        .db $FF
  $B99F  FF        .db $FF
  $B9A0  FF        .db $FF
  $B9A1  FF        .db $FF
  $B9A2  FF        .db $FF
  $B9A3  FF        .db $FF
  $B9A4  FF        .db $FF
  $B9A5  FF        .db $FF
  $B9A6  FF        .db $FF
  $B9A7  FF        .db $FF
  $B9A8  FF        .db $FF
  $B9A9  FF        .db $FF
  $B9AA  FF        .db $FF
  $B9AB  FF        .db $FF
  $B9AC  FF        .db $FF
  $B9AD  FF        .db $FF
  $B9AE  FF        .db $FF
  $B9AF  FF        .db $FF
  $B9B0  FF        .db $FF
  $B9B1  FF        .db $FF
  $B9B2  FF        .db $FF
  $B9B3  FF        .db $FF
  $B9B4  FF        .db $FF
  $B9B5  FF        .db $FF
  $B9B6  FF        .db $FF
  $B9B7  FF        .db $FF
  $B9B8  FF        .db $FF
  $B9B9  FF        .db $FF
  $B9BA  FF        .db $FF
  $B9BB  FF        .db $FF
  $B9BC  FF        .db $FF
  $B9BD  FF        .db $FF
  $B9BE  FF        .db $FF
  $B9BF  FF        .db $FF
  $B9C0  FF        .db $FF
  $B9C1  FF        .db $FF
  $B9C2  FF        .db $FF
  $B9C3  FF        .db $FF
  $B9C4  FF        .db $FF
  $B9C5  FF        .db $FF
  $B9C6  FF        .db $FF
  $B9C7  FF        .db $FF
  $B9C8  FF        .db $FF
  $B9C9  FF        .db $FF
  $B9CA  FF        .db $FF
  $B9CB  FF        .db $FF
  $B9CC  FF        .db $FF
  $B9CD  FF        .db $FF
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
  $B9D9  FF        .db $FF
  $B9DA  FF        .db $FF
  $B9DB  FF        .db $FF
  $B9DC  FF        .db $FF
  $B9DD  FF        .db $FF
  $B9DE  FF        .db $FF
  $B9DF  FF        .db $FF
  $B9E0  FF        .db $FF
  $B9E1  FF        .db $FF
  $B9E2  FF        .db $FF
  $B9E3  FF        .db $FF
  $B9E4  FF        .db $FF
  $B9E5  FF        .db $FF
  $B9E6  FF        .db $FF
  $B9E7  FF        .db $FF
  $B9E8  FF        .db $FF
  $B9E9  FF        .db $FF
  $B9EA  FF        .db $FF
  $B9EB  FF        .db $FF
  $B9EC  FF        .db $FF
  $B9ED  FF        .db $FF
  $B9EE  FF        .db $FF
  $B9EF  FF        .db $FF
  $B9F0  FF        .db $FF
  $B9F1  FF        .db $FF
  $B9F2  FF        .db $FF
  $B9F3  FF        .db $FF
  $B9F4  FF        .db $FF
  $B9F5  FF        .db $FF
  $B9F6  FF        .db $FF
  $B9F7  FF        .db $FF
  $B9F8  FF        .db $FF
  $B9F9  FF        .db $FF
  $B9FA  FF        .db $FF
  $B9FB  FF        .db $FF
  $B9FC  FF        .db $FF
  $B9FD  FF        .db $FF
  $B9FE  FF        .db $FF
  $B9FF  FF        .db $FF
  $BA00  06 06     ASL $06
  $BA02  07        .db $07
  $BA03  07        .db $07
  $BA04  08        PHP
  $BA05  08        PHP
  $BA06  15 15     ORA $15,X
  $BA08  16 16     ASL $16,X
  $BA0A  17        .db $17
  $BA0B  17        .db $17
  $BA0C  19 19 19  ORA $1919,Y
  $BA0F  19 19 19  ORA $1919,Y
  $BA12  1A        .db $1A
  $BA13  1A        .db $1A
  $BA14  FF        .db $FF
  $BA15  FF        .db $FF
  $BA16  FF        .db $FF
  $BA17  FF        .db $FF
  $BA18  FF        .db $FF
  $BA19  FF        .db $FF
  $BA1A  FF        .db $FF
  $BA1B  FF        .db $FF
  $BA1C  FF        .db $FF
  $BA1D  FF        .db $FF
  $BA1E  FF        .db $FF
  $BA1F  FF        .db $FF
  $BA20  FF        .db $FF
  $BA21  FF        .db $FF
  $BA22  FF        .db $FF
  $BA23  FF        .db $FF
  $BA24  FF        .db $FF
  $BA25  FF        .db $FF
  $BA26  FF        .db $FF
  $BA27  FF        .db $FF
  $BA28  FF        .db $FF
  $BA29  FF        .db $FF
  $BA2A  FF        .db $FF
  $BA2B  FF        .db $FF
  $BA2C  FF        .db $FF
  $BA2D  FF        .db $FF
  $BA2E  FF        .db $FF
  $BA2F  FF        .db $FF
  $BA30  FF        .db $FF
  $BA31  FF        .db $FF
  $BA32  FF        .db $FF
  $BA33  FF        .db $FF
  $BA34  FF        .db $FF
  $BA35  FF        .db $FF
  $BA36  FF        .db $FF
  $BA37  FF        .db $FF
  $BA38  FF        .db $FF
  $BA39  FF        .db $FF
  $BA3A  FF        .db $FF
  $BA3B  FF        .db $FF
  $BA3C  FF        .db $FF
  $BA3D  FF        .db $FF
  $BA3E  FF        .db $FF
  $BA3F  FF        .db $FF
  $BA40  B8        CLV
  $BA41  B8        CLV
  $BA42  B8        CLV
  $BA43  B8        CLV
  $BA44  D8        CLD
  $BA45  D8        CLD
  $BA46  F8        SED
  $BA47  F8        SED
  $BA48  F8        SED
  $BA49  F8        SED
  $BA4A  08        PHP
  $BA4B  08        PHP
  $BA4C  20 38 48  JSR $4838
  $BA4F  B8        CLV
  $BA50  C8        INY
  $BA51  E0 48     CPX #$48
  $BA53  C0 FF     CPY #$FF
  $BA55  FF        .db $FF
  $BA56  FF        .db $FF
  $BA57  FF        .db $FF
  $BA58  FF        .db $FF
  $BA59  FF        .db $FF
  $BA5A  FF        .db $FF
  $BA5B  FF        .db $FF
  $BA5C  FF        .db $FF
  $BA5D  FF        .db $FF
  $BA5E  FF        .db $FF
  $BA5F  FF        .db $FF
  $BA60  FF        .db $FF
  $BA61  FF        .db $FF
  $BA62  FF        .db $FF
  $BA63  FF        .db $FF
  $BA64  FF        .db $FF
  $BA65  FF        .db $FF
  $BA66  FF        .db $FF
  $BA67  FF        .db $FF
  $BA68  FF        .db $FF
  $BA69  FF        .db $FF
  $BA6A  FF        .db $FF
  $BA6B  FF        .db $FF
  $BA6C  FF        .db $FF
  $BA6D  FF        .db $FF
  $BA6E  FF        .db $FF
  $BA6F  FF        .db $FF
  $BA70  FF        .db $FF
  $BA71  FF        .db $FF
  $BA72  FF        .db $FF
  $BA73  FF        .db $FF
  $BA74  FF        .db $FF
  $BA75  FF        .db $FF
  $BA76  FF        .db $FF
  $BA77  FF        .db $FF
  $BA78  FF        .db $FF
  $BA79  FF        .db $FF
  $BA7A  FF        .db $FF
  $BA7B  FF        .db $FF
  $BA7C  FF        .db $FF
  $BA7D  FF        .db $FF
  $BA7E  FF        .db $FF
  $BA7F  FF        .db $FF
  $BA80  6F        .db $6F
  $BA81  8F        .db $8F
  $BA82  4F        .db $4F
  $BA83  6F        .db $6F
  $BA84  2F        .db $2F
  $BA85  4F        .db $4F
  $BA86  4F        .db $4F
  $BA87  6F        .db $6F
  $BA88  4F        .db $4F
  $BA89  6F        .db $6F
  $BA8A  4F        .db $4F
  $BA8B  6F        .db $6F
  $BA8C  9A        TXS
  $BA8D  8F        .db $8F
  $BA8E  8F        .db $8F
  $BA8F  3F        .db $3F
  $BA90  3F        .db $3F
  $BA91  48        PHA
  $BA92  3A        .db $3A
  $BA93  6A        ROR
  $BA94  FF        .db $FF
  $BA95  FF        .db $FF
  $BA96  FF        .db $FF
  $BA97  FF        .db $FF
  $BA98  FF        .db $FF
  $BA99  FF        .db $FF
  $BA9A  FF        .db $FF
  $BA9B  FF        .db $FF
  $BA9C  FF        .db $FF
  $BA9D  FF        .db $FF
  $BA9E  FF        .db $FF
  $BA9F  FF        .db $FF
  $BAA0  FF        .db $FF
  $BAA1  FF        .db $FF
  $BAA2  FF        .db $FF
  $BAA3  FF        .db $FF
  $BAA4  FF        .db $FF
  $BAA5  FF        .db $FF
  $BAA6  FF        .db $FF
  $BAA7  FF        .db $FF
  $BAA8  FF        .db $FF
  $BAA9  FF        .db $FF
  $BAAA  FF        .db $FF
  $BAAB  FF        .db $FF
  $BAAC  FF        .db $FF
  $BAAD  FF        .db $FF
  $BAAE  FF        .db $FF
  $BAAF  FF        .db $FF
  $BAB0  FF        .db $FF
  $BAB1  FF        .db $FF
  $BAB2  FF        .db $FF
  $BAB3  FF        .db $FF
  $BAB4  FF        .db $FF
  $BAB5  FF        .db $FF
  $BAB6  FF        .db $FF
  $BAB7  FF        .db $FF
  $BAB8  FF        .db $FF
  $BAB9  FF        .db $FF
  $BABA  FF        .db $FF
  $BABB  FF        .db $FF
  $BABC  FF        .db $FF
  $BABD  FF        .db $FF
  $BABE  FF        .db $FF
  $BABF  FF        .db $FF
  $BAC0  2E 2E 2E  ROL $2E2E
  $BAC3  2E 2E 2E  ROL $2E2E
  $BAC6  2F        .db $2F
  $BAC7  2F        .db $2F
  $BAC8  2F        .db $2F
  $BAC9  2F        .db $2F
  $BACA  2F        .db $2F
  $BACB  2F        .db $2F
  $BACC  78        SEI
  $BACD  2D 2D 2D  AND $2D2D
  $BAD0  2D 7A 78  AND $787A
  $BAD3  78        SEI
  $BAD4  FF        .db $FF
  $BAD5  FF        .db $FF
  $BAD6  FF        .db $FF
  $BAD7  FF        .db $FF
  $BAD8  FF        .db $FF
  $BAD9  FF        .db $FF
  $BADA  FF        .db $FF
  $BADB  FF        .db $FF
  $BADC  FF        .db $FF
  $BADD  FF        .db $FF
  $BADE  FF        .db $FF
  $BADF  FF        .db $FF
  $BAE0  FF        .db $FF
  $BAE1  FF        .db $FF
  $BAE2  FF        .db $FF
  $BAE3  FF        .db $FF
  $BAE4  FF        .db $FF
  $BAE5  FF        .db $FF
  $BAE6  FF        .db $FF
  $BAE7  FF        .db $FF
  $BAE8  FF        .db $FF
  $BAE9  FF        .db $FF
  $BAEA  FF        .db $FF
  $BAEB  FF        .db $FF
  $BAEC  FF        .db $FF
  $BAED  FF        .db $FF
  $BAEE  FF        .db $FF
  $BAEF  FF        .db $FF
  $BAF0  FF        .db $FF
  $BAF1  FF        .db $FF
  $BAF2  FF        .db $FF
  $BAF3  FF        .db $FF
  $BAF4  FF        .db $FF
  $BAF5  FF        .db $FF
  $BAF6  FF        .db $FF
  $BAF7  FF        .db $FF
  $BAF8  FF        .db $FF
  $BAF9  FF        .db $FF
  $BAFA  FF        .db $FF
  $BAFB  FF        .db $FF
  $BAFC  FF        .db $FF
  $BAFD  FF        .db $FF
  $BAFE  FF        .db $FF
  $BAFF  FF        .db $FF
  $BB00  B4 54     LDY $54,X
  $BB02  74        .db $74
  $BB03  94 84     STY $84,X
  $BB05  84 00     STY $00
  $BB07  09 16     ORA #$16
  $BB09  18        CLC
  $BB0A  22        .db $22
  $BB0B  22        .db $22
  $BB0C  00        BRK
  $BB0D  13        .db $13
  $BB0E  24 24     BIT $24
  $BB10  27        .db $27
  $BB11  27        .db $27
  $BB12  00        BRK
  $BB13  06 08     ASL $08
  $BB15  0C        .db $0C
  $BB16  14        .db $14
  $BB17  14        .db $14
  $BB18  84 87     STY $87
  $BB1A  8A        TXA
  $BB1B  8A        TXA
  $BB1C  8D 8D E0  STA $E08D
  $BB1F  20 60 E0  JSR $E060
  $BB22  60        RTS
  $BB23  60        RTS
  $BB24  85 87     STA $87
  $BB26  8A        TXA
  $BB27  8B        .db $8B
  $BB28  8D 8D 60  STA $608D
  $BB2B  A0 E0     LDY #$E0
  $BB2D  60        RTS
  $BB2E  E0 E0     CPX #$E0
  $BB30  00        BRK
  $BB31  05 0C     ORA $0C
  $BB33  0E 14 14  ASL $1414
  $BB36  00        BRK
  $BB37  09 16     ORA #$16
  $BB39  18        CLC
  $BB3A  22        .db $22
  $BB3B  22        .db $22
  $BB3C  04        .db $04
  $BB3D  09 16     ORA #$16
  $BB3F  18        CLC
  $BB40  22        .db $22
  $BB41  22        .db $22
  $BB42  FF        .db $FF
  $BB43  FF        .db $FF
  $BB44  FF        .db $FF
  $BB45  FF        .db $FF
  $BB46  FF        .db $FF
  $BB47  FF        .db $FF
  $BB48  FF        .db $FF
  $BB49  FF        .db $FF
  $BB4A  FF        .db $FF
  $BB4B  FF        .db $FF
  $BB4C  FF        .db $FF
  $BB4D  FF        .db $FF
  $BB4E  FF        .db $FF
  $BB4F  FF        .db $FF
  $BB50  FF        .db $FF
  $BB51  FF        .db $FF
  $BB52  FF        .db $FF
  $BB53  FF        .db $FF
  $BB54  FF        .db $FF
  $BB55  FF        .db $FF
  $BB56  FF        .db $FF
  $BB57  FF        .db $FF
  $BB58  FF        .db $FF
  $BB59  FF        .db $FF
  $BB5A  FF        .db $FF
  $BB5B  FF        .db $FF
  $BB5C  FF        .db $FF
  $BB5D  FF        .db $FF
  $BB5E  FF        .db $FF
  $BB5F  FF        .db $FF
  $BB60  FF        .db $FF
  $BB61  FF        .db $FF
  $BB62  FF        .db $FF
  $BB63  FF        .db $FF
  $BB64  FF        .db $FF
  $BB65  FF        .db $FF
  $BB66  FF        .db $FF
  $BB67  FF        .db $FF
  $BB68  FF        .db $FF
  $BB69  FF        .db $FF
  $BB6A  FF        .db $FF
  $BB6B  FF        .db $FF
  $BB6C  FF        .db $FF
  $BB6D  FF        .db $FF
  $BB6E  FF        .db $FF
  $BB6F  FF        .db $FF
  $BB70  FF        .db $FF
  $BB71  FF        .db $FF
  $BB72  FF        .db $FF
  $BB73  FF        .db $FF
  $BB74  FF        .db $FF
  $BB75  FF        .db $FF
  $BB76  FF        .db $FF
  $BB77  FF        .db $FF
  $BB78  FF        .db $FF
  $BB79  FF        .db $FF
  $BB7A  FF        .db $FF
  $BB7B  FF        .db $FF
  $BB7C  FF        .db $FF
  $BB7D  FF        .db $FF
  $BB7E  FF        .db $FF
  $BB7F  FF        .db $FF
  $BB80  FF        .db $FF
  $BB81  FF        .db $FF
  $BB82  FF        .db $FF
  $BB83  FF        .db $FF
  $BB84  FF        .db $FF
  $BB85  FF        .db $FF
  $BB86  FF        .db $FF
  $BB87  FF        .db $FF
  $BB88  FF        .db $FF
  $BB89  FF        .db $FF
  $BB8A  FF        .db $FF
  $BB8B  FF        .db $FF
  $BB8C  FF        .db $FF
  $BB8D  FF        .db $FF
  $BB8E  FF        .db $FF
  $BB8F  FF        .db $FF
  $BB90  FF        .db $FF
  $BB91  FF        .db $FF
  $BB92  FF        .db $FF
  $BB93  FF        .db $FF
  $BB94  FF        .db $FF
  $BB95  FF        .db $FF
  $BB96  FF        .db $FF
  $BB97  FF        .db $FF
  $BB98  FF        .db $FF
  $BB99  FF        .db $FF
  $BB9A  FF        .db $FF
  $BB9B  FF        .db $FF
  $BB9C  FF        .db $FF
  $BB9D  FF        .db $FF
  $BB9E  FF        .db $FF
  $BB9F  FF        .db $FF
  $BBA0  FF        .db $FF
  $BBA1  FF        .db $FF
  $BBA2  FF        .db $FF
  $BBA3  FF        .db $FF
  $BBA4  FF        .db $FF
  $BBA5  FF        .db $FF
  $BBA6  FF        .db $FF
  $BBA7  FF        .db $FF
  $BBA8  FF        .db $FF
  $BBA9  FF        .db $FF
  $BBAA  FF        .db $FF
  $BBAB  FF        .db $FF
  $BBAC  FF        .db $FF
  $BBAD  FF        .db $FF
  $BBAE  FF        .db $FF
  $BBAF  FF        .db $FF
  $BBB0  FF        .db $FF
  $BBB1  FF        .db $FF
  $BBB2  FF        .db $FF
  $BBB3  FF        .db $FF
  $BBB4  FF        .db $FF
  $BBB5  FF        .db $FF
  $BBB6  FF        .db $FF
  $BBB7  FF        .db $FF
  $BBB8  FF        .db $FF
  $BBB9  FF        .db $FF
  $BBBA  FF        .db $FF
  $BBBB  FF        .db $FF
  $BBBC  FF        .db $FF
  $BBBD  FF        .db $FF
  $BBBE  FF        .db $FF
  $BBBF  FF        .db $FF
  $BBC0  FF        .db $FF
  $BBC1  FF        .db $FF
  $BBC2  FF        .db $FF
  $BBC3  FF        .db $FF
  $BBC4  FF        .db $FF
  $BBC5  FF        .db $FF
  $BBC6  FF        .db $FF
  $BBC7  FF        .db $FF
  $BBC8  FF        .db $FF
  $BBC9  FF        .db $FF
  $BBCA  FF        .db $FF
  $BBCB  FF        .db $FF
  $BBCC  FF        .db $FF
  $BBCD  FF        .db $FF
  $BBCE  FF        .db $FF
  $BBCF  FF        .db $FF
  $BBD0  FF        .db $FF
  $BBD1  FF        .db $FF
  $BBD2  FF        .db $FF
  $BBD3  FF        .db $FF
  $BBD4  FF        .db $FF
  $BBD5  FF        .db $FF
  $BBD6  FF        .db $FF
  $BBD7  FF        .db $FF
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
  $BBE3  FF        .db $FF
  $BBE4  FF        .db $FF
  $BBE5  FF        .db $FF
  $BBE6  FF        .db $FF
  $BBE7  FF        .db $FF
  $BBE8  FF        .db $FF
  $BBE9  FF        .db $FF
  $BBEA  FF        .db $FF
  $BBEB  FF        .db $FF
  $BBEC  FF        .db $FF
  $BBED  FF        .db $FF
  $BBEE  FF        .db $FF
  $BBEF  FF        .db $FF
  $BBF0  FF        .db $FF
  $BBF1  FF        .db $FF
  $BBF2  FF        .db $FF
  $BBF3  FF        .db $FF
  $BBF4  FF        .db $FF
  $BBF5  FF        .db $FF
  $BBF6  FF        .db $FF
  $BBF7  FF        .db $FF
  $BBF8  FF        .db $FF
  $BBF9  FF        .db $FF
  $BBFA  FF        .db $FF
  $BBFB  FF        .db $FF
  $BBFC  FF        .db $FF
  $BBFD  FF        .db $FF
  $BBFE  FF        .db $FF
  $BBFF  FF        .db $FF
  $BC00  06 90     ASL $90
  $BC02  09 00     ORA #$00
  $BC04  84 01     STY $01
  $BC06  09 98     ORA #$98
  $BC08  05 00     ORA $00
  $BC0A  9F        .db $9F
  $BC0B  01 03     ORA ($03,X)
  $BC0D  80        .db $80
  $BC0E  06 09     ASL $09
  $BC10  A0 0A     LDY #$0A
  $BC12  02        .db $02
  $BC13  FF        .db $FF
  $BC14  FF        .db $FF
  $BC15  FF        .db $FF
  $BC16  FF        .db $FF
  $BC17  FF        .db $FF
  $BC18  FF        .db $FF
  $BC19  FF        .db $FF
  $BC1A  FF        .db $FF
  $BC1B  FF        .db $FF
  $BC1C  FF        .db $FF
  $BC1D  FF        .db $FF
  $BC1E  FF        .db $FF
  $BC1F  FF        .db $FF
  $BC20  FF        .db $FF
  $BC21  FF        .db $FF
  $BC22  FF        .db $FF
  $BC23  FF        .db $FF
  $BC24  FF        .db $FF
  $BC25  FF        .db $FF
  $BC26  FF        .db $FF
  $BC27  FF        .db $FF
  $BC28  FF        .db $FF
  $BC29  FF        .db $FF
  $BC2A  FF        .db $FF
  $BC2B  FF        .db $FF
  $BC2C  FF        .db $FF
  $BC2D  FF        .db $FF
  $BC2E  FF        .db $FF
  $BC2F  FF        .db $FF
  $BC30  FF        .db $FF
  $BC31  FF        .db $FF
  $BC32  FF        .db $FF
  $BC33  FF        .db $FF
  $BC34  FF        .db $FF
  $BC35  FF        .db $FF
  $BC36  FF        .db $FF
  $BC37  FF        .db $FF
  $BC38  FF        .db $FF
  $BC39  FF        .db $FF
  $BC3A  FF        .db $FF
  $BC3B  FF        .db $FF
  $BC3C  FF        .db $FF
  $BC3D  FF        .db $FF
  $BC3E  FF        .db $FF
  $BC3F  FF        .db $FF
  $BC40  FF        .db $FF
  $BC41  FF        .db $FF
  $BC42  FF        .db $FF
  $BC43  FF        .db $FF
  $BC44  FF        .db $FF
  $BC45  FF        .db $FF
  $BC46  FF        .db $FF
  $BC47  FF        .db $FF
  $BC48  FF        .db $FF
  $BC49  FF        .db $FF
  $BC4A  FF        .db $FF
  $BC4B  FF        .db $FF
  $BC4C  FF        .db $FF
  $BC4D  FF        .db $FF
  $BC4E  FF        .db $FF
  $BC4F  FF        .db $FF
  $BC50  FF        .db $FF
  $BC51  FF        .db $FF
  $BC52  FF        .db $FF
  $BC53  FF        .db $FF
  $BC54  FF        .db $FF
  $BC55  FF        .db $FF
  $BC56  FF        .db $FF
  $BC57  FF        .db $FF
  $BC58  FF        .db $FF
  $BC59  FF        .db $FF
  $BC5A  FF        .db $FF
  $BC5B  FF        .db $FF
  $BC5C  FF        .db $FF
  $BC5D  FF        .db $FF
  $BC5E  FF        .db $FF
  $BC5F  FF        .db $FF
  $BC60  FF        .db $FF
  $BC61  FF        .db $FF
  $BC62  FF        .db $FF
  $BC63  FF        .db $FF
  $BC64  FF        .db $FF
  $BC65  FF        .db $FF
  $BC66  FF        .db $FF
  $BC67  FF        .db $FF
  $BC68  FF        .db $FF
  $BC69  FF        .db $FF
  $BC6A  FF        .db $FF
  $BC6B  FF        .db $FF
  $BC6C  FF        .db $FF
  $BC6D  FF        .db $FF
  $BC6E  FF        .db $FF
  $BC6F  FF        .db $FF
  $BC70  FF        .db $FF
  $BC71  FF        .db $FF
  $BC72  FF        .db $FF
  $BC73  FF        .db $FF
  $BC74  FF        .db $FF
  $BC75  FF        .db $FF
  $BC76  FF        .db $FF
  $BC77  FF        .db $FF
  $BC78  FF        .db $FF
  $BC79  FF        .db $FF
  $BC7A  FF        .db $FF
  $BC7B  FF        .db $FF
  $BC7C  FF        .db $FF
  $BC7D  FF        .db $FF
  $BC7E  FF        .db $FF
  $BC7F  FF        .db $FF
  $BC80  FF        .db $FF
  $BC81  FF        .db $FF
  $BC82  FF        .db $FF
  $BC83  FF        .db $FF
  $BC84  FF        .db $FF
  $BC85  FF        .db $FF
  $BC86  FF        .db $FF
  $BC87  FF        .db $FF
  $BC88  FF        .db $FF
  $BC89  FF        .db $FF
  $BC8A  FF        .db $FF
  $BC8B  FF        .db $FF
  $BC8C  FF        .db $FF
  $BC8D  FF        .db $FF
  $BC8E  FF        .db $FF
  $BC8F  FF        .db $FF
  $BC90  FF        .db $FF
  $BC91  FF        .db $FF
  $BC92  FF        .db $FF
  $BC93  FF        .db $FF
  $BC94  FF        .db $FF
  $BC95  FF        .db $FF
  $BC96  FF        .db $FF
  $BC97  FF        .db $FF
  $BC98  FF        .db $FF
  $BC99  FF        .db $FF
  $BC9A  FF        .db $FF
  $BC9B  FF        .db $FF
  $BC9C  FF        .db $FF
  $BC9D  FF        .db $FF
  $BC9E  FF        .db $FF
  $BC9F  FF        .db $FF
  $BCA0  FF        .db $FF
  $BCA1  FF        .db $FF
  $BCA2  FF        .db $FF
  $BCA3  FF        .db $FF
  $BCA4  FF        .db $FF
  $BCA5  FF        .db $FF
  $BCA6  FF        .db $FF
  $BCA7  FF        .db $FF
  $BCA8  FF        .db $FF
  $BCA9  FF        .db $FF
  $BCAA  FF        .db $FF
  $BCAB  FF        .db $FF
  $BCAC  FF        .db $FF
  $BCAD  FF        .db $FF
  $BCAE  FF        .db $FF
  $BCAF  FF        .db $FF
  $BCB0  FF        .db $FF
  $BCB1  FF        .db $FF
  $BCB2  FF        .db $FF
  $BCB3  FF        .db $FF
  $BCB4  FF        .db $FF
  $BCB5  FF        .db $FF
  $BCB6  FF        .db $FF
  $BCB7  FF        .db $FF
  $BCB8  FF        .db $FF
  $BCB9  FF        .db $FF
  $BCBA  FF        .db $FF
  $BCBB  FF        .db $FF
  $BCBC  FF        .db $FF
  $BCBD  FF        .db $FF
  $BCBE  FF        .db $FF
  $BCBF  FF        .db $FF
  $BCC0  FF        .db $FF
  $BCC1  FF        .db $FF
  $BCC2  FF        .db $FF
  $BCC3  FF        .db $FF
  $BCC4  FF        .db $FF
  $BCC5  FF        .db $FF
  $BCC6  FF        .db $FF
  $BCC7  FF        .db $FF
  $BCC8  FF        .db $FF
  $BCC9  FF        .db $FF
  $BCCA  FF        .db $FF
  $BCCB  FF        .db $FF
  $BCCC  FF        .db $FF
  $BCCD  FF        .db $FF
  $BCCE  FF        .db $FF
  $BCCF  FF        .db $FF
  $BCD0  FF        .db $FF
  $BCD1  FF        .db $FF
  $BCD2  FF        .db $FF
  $BCD3  FF        .db $FF
  $BCD4  FF        .db $FF
  $BCD5  FF        .db $FF
  $BCD6  FF        .db $FF
  $BCD7  FF        .db $FF
  $BCD8  FF        .db $FF
  $BCD9  FF        .db $FF
  $BCDA  FF        .db $FF
  $BCDB  FF        .db $FF
  $BCDC  FF        .db $FF
  $BCDD  FF        .db $FF
  $BCDE  FF        .db $FF
  $BCDF  FF        .db $FF
  $BCE0  FF        .db $FF
  $BCE1  FF        .db $FF
  $BCE2  FF        .db $FF
  $BCE3  FF        .db $FF
  $BCE4  FF        .db $FF
  $BCE5  FF        .db $FF
  $BCE6  FF        .db $FF
  $BCE7  FF        .db $FF
  $BCE8  FF        .db $FF
  $BCE9  FF        .db $FF
  $BCEA  FF        .db $FF
  $BCEB  FF        .db $FF
  $BCEC  FF        .db $FF
  $BCED  FF        .db $FF
  $BCEE  FF        .db $FF
  $BCEF  FF        .db $FF
  $BCF0  FF        .db $FF
  $BCF1  FF        .db $FF
  $BCF2  FF        .db $FF
  $BCF3  FF        .db $FF
  $BCF4  FF        .db $FF
  $BCF5  FF        .db $FF
  $BCF6  FF        .db $FF
  $BCF7  FF        .db $FF
  $BCF8  FF        .db $FF
  $BCF9  FF        .db $FF
  $BCFA  FF        .db $FF
  $BCFB  FF        .db $FF
  $BCFC  FF        .db $FF
  $BCFD  FF        .db $FF
  $BCFE  FF        .db $FF
  $BCFF  FF        .db $FF
  $BD00  08        PHP
  $BD01  90 09     BCC $BD0C
  $BD03  00        BRK
  $BD04  84 01     STY $01
  $BD06  09 98     ORA #$98
  $BD08  05 00     ORA $00
  $BD0A  9F        .db $9F
  $BD0B  01 03     ORA ($03,X)
  $BD0D  80        .db $80
  $BD0E  06 09     ASL $09
  $BD10  AA        TAX
  $BD11  04        .db $04
  $BD12  01 AA     ORA ($AA,X)
  $BD14  05 02     ORA $02
  $BD16  AC 01 02  LDY $0201
  $BD19  FF        .db $FF
  $BD1A  FF        .db $FF
  $BD1B  FF        .db $FF
  $BD1C  FF        .db $FF
  $BD1D  FF        .db $FF
  $BD1E  FF        .db $FF
  $BD1F  FF        .db $FF
  $BD20  FF        .db $FF
  $BD21  FF        .db $FF
  $BD22  FF        .db $FF
  $BD23  FF        .db $FF
  $BD24  FF        .db $FF
  $BD25  FF        .db $FF
  $BD26  FF        .db $FF
  $BD27  FF        .db $FF
  $BD28  FF        .db $FF
  $BD29  FF        .db $FF
  $BD2A  FF        .db $FF
  $BD2B  FF        .db $FF
  $BD2C  FF        .db $FF
  $BD2D  FF        .db $FF
  $BD2E  FF        .db $FF
  $BD2F  FF        .db $FF
  $BD30  FF        .db $FF
  $BD31  FF        .db $FF
  $BD32  FF        .db $FF
  $BD33  FF        .db $FF
  $BD34  FF        .db $FF
  $BD35  FF        .db $FF
  $BD36  FF        .db $FF
  $BD37  FF        .db $FF
  $BD38  FF        .db $FF
  $BD39  FF        .db $FF
  $BD3A  FF        .db $FF
  $BD3B  FF        .db $FF
  $BD3C  FF        .db $FF
  $BD3D  FF        .db $FF
  $BD3E  FF        .db $FF
  $BD3F  FF        .db $FF
  $BD40  FF        .db $FF
  $BD41  FF        .db $FF
  $BD42  FF        .db $FF
  $BD43  FF        .db $FF
  $BD44  FF        .db $FF
  $BD45  FF        .db $FF
  $BD46  FF        .db $FF
  $BD47  FF        .db $FF
  $BD48  FF        .db $FF
  $BD49  FF        .db $FF
  $BD4A  FF        .db $FF
  $BD4B  FF        .db $FF
  $BD4C  FF        .db $FF
  $BD4D  FF        .db $FF
  $BD4E  FF        .db $FF
  $BD4F  FF        .db $FF
  $BD50  FF        .db $FF
  $BD51  FF        .db $FF
  $BD52  FF        .db $FF
  $BD53  FF        .db $FF
  $BD54  FF        .db $FF
  $BD55  FF        .db $FF
  $BD56  FF        .db $FF
  $BD57  FF        .db $FF
  $BD58  FF        .db $FF
  $BD59  FF        .db $FF
  $BD5A  FF        .db $FF
  $BD5B  FF        .db $FF
  $BD5C  FF        .db $FF
  $BD5D  FF        .db $FF
  $BD5E  FF        .db $FF
  $BD5F  FF        .db $FF
  $BD60  FF        .db $FF
  $BD61  FF        .db $FF
  $BD62  FF        .db $FF
  $BD63  FF        .db $FF
  $BD64  FF        .db $FF
  $BD65  FF        .db $FF
  $BD66  FF        .db $FF
  $BD67  FF        .db $FF
  $BD68  FF        .db $FF
  $BD69  FF        .db $FF
  $BD6A  FF        .db $FF
  $BD6B  FF        .db $FF
  $BD6C  FF        .db $FF
  $BD6D  FF        .db $FF
  $BD6E  FF        .db $FF
  $BD6F  FF        .db $FF
  $BD70  FF        .db $FF
  $BD71  FF        .db $FF
  $BD72  FF        .db $FF
  $BD73  FF        .db $FF
  $BD74  FF        .db $FF
  $BD75  FF        .db $FF
  $BD76  FF        .db $FF
  $BD77  FF        .db $FF
  $BD78  FF        .db $FF
  $BD79  FF        .db $FF
  $BD7A  FF        .db $FF
  $BD7B  FF        .db $FF
  $BD7C  FF        .db $FF
  $BD7D  FF        .db $FF
  $BD7E  FF        .db $FF
  $BD7F  FF        .db $FF
  $BD80  FF        .db $FF
  $BD81  FF        .db $FF
  $BD82  FF        .db $FF
  $BD83  FF        .db $FF
  $BD84  FF        .db $FF
  $BD85  FF        .db $FF
  $BD86  FF        .db $FF
  $BD87  FF        .db $FF
  $BD88  FF        .db $FF
  $BD89  FF        .db $FF
  $BD8A  FF        .db $FF
  $BD8B  FF        .db $FF
  $BD8C  FF        .db $FF
  $BD8D  FF        .db $FF
  $BD8E  FF        .db $FF
  $BD8F  FF        .db $FF
  $BD90  FF        .db $FF
  $BD91  FF        .db $FF
  $BD92  FF        .db $FF
  $BD93  FF        .db $FF
  $BD94  FF        .db $FF
  $BD95  FF        .db $FF
  $BD96  FF        .db $FF
  $BD97  FF        .db $FF
  $BD98  FF        .db $FF
  $BD99  FF        .db $FF
  $BD9A  FF        .db $FF
  $BD9B  FF        .db $FF
  $BD9C  FF        .db $FF
  $BD9D  FF        .db $FF
  $BD9E  FF        .db $FF
  $BD9F  FF        .db $FF
  $BDA0  FF        .db $FF
  $BDA1  FF        .db $FF
  $BDA2  FF        .db $FF
  $BDA3  FF        .db $FF
  $BDA4  FF        .db $FF
  $BDA5  FF        .db $FF
  $BDA6  FF        .db $FF
  $BDA7  FF        .db $FF
  $BDA8  FF        .db $FF
  $BDA9  FF        .db $FF
  $BDAA  FF        .db $FF
  $BDAB  FF        .db $FF
  $BDAC  FF        .db $FF
  $BDAD  FF        .db $FF
  $BDAE  FF        .db $FF
  $BDAF  FF        .db $FF
  $BDB0  FF        .db $FF
  $BDB1  FF        .db $FF
  $BDB2  FF        .db $FF
  $BDB3  FF        .db $FF
  $BDB4  FF        .db $FF
  $BDB5  FF        .db $FF
  $BDB6  FF        .db $FF
  $BDB7  FF        .db $FF
  $BDB8  FF        .db $FF
  $BDB9  FF        .db $FF
  $BDBA  FF        .db $FF
  $BDBB  FF        .db $FF
  $BDBC  FF        .db $FF
  $BDBD  FF        .db $FF
  $BDBE  FF        .db $FF
  $BDBF  FF        .db $FF
  $BDC0  FF        .db $FF
  $BDC1  FF        .db $FF
  $BDC2  FF        .db $FF
  $BDC3  FF        .db $FF
  $BDC4  FF        .db $FF
  $BDC5  FF        .db $FF
  $BDC6  FF        .db $FF
  $BDC7  FF        .db $FF
  $BDC8  FF        .db $FF
  $BDC9  FF        .db $FF
  $BDCA  FF        .db $FF
  $BDCB  FF        .db $FF
  $BDCC  FF        .db $FF
  $BDCD  FF        .db $FF
  $BDCE  FF        .db $FF
  $BDCF  FF        .db $FF
  $BDD0  FF        .db $FF
  $BDD1  FF        .db $FF
  $BDD2  FF        .db $FF
  $BDD3  FF        .db $FF
  $BDD4  FF        .db $FF
  $BDD5  FF        .db $FF
  $BDD6  FF        .db $FF
  $BDD7  FF        .db $FF
  $BDD8  FF        .db $FF
  $BDD9  FF        .db $FF
  $BDDA  FF        .db $FF
  $BDDB  FF        .db $FF
  $BDDC  FF        .db $FF
  $BDDD  FF        .db $FF
  $BDDE  FF        .db $FF
  $BDDF  FF        .db $FF
  $BDE0  FF        .db $FF
  $BDE1  FF        .db $FF
  $BDE2  FF        .db $FF
  $BDE3  FF        .db $FF
  $BDE4  FF        .db $FF
  $BDE5  FF        .db $FF
  $BDE6  FF        .db $FF
  $BDE7  FF        .db $FF
  $BDE8  FF        .db $FF
  $BDE9  FF        .db $FF
  $BDEA  FF        .db $FF
  $BDEB  FF        .db $FF
  $BDEC  FF        .db $FF
  $BDED  FF        .db $FF
  $BDEE  FF        .db $FF
  $BDEF  FF        .db $FF
  $BDF0  FF        .db $FF
  $BDF1  FF        .db $FF
  $BDF2  FF        .db $FF
  $BDF3  FF        .db $FF
  $BDF4  FF        .db $FF
  $BDF5  FF        .db $FF
  $BDF6  FF        .db $FF
  $BDF7  FF        .db $FF
  $BDF8  FF        .db $FF
  $BDF9  FF        .db $FF
  $BDFA  FF        .db $FF
  $BDFB  FF        .db $FF
  $BDFC  FF        .db $FF
  $BDFD  FF        .db $FF
  $BDFE  FF        .db $FF
  $BDFF  FF        .db $FF
  $BE00  00        BRK
  $BE01  00        BRK
  $BE02  0F        .db $0F
  $BE03  29 19     AND #$19
  $BE05  2C 0F 28  BIT $280F
  $BE08  18        CLC
  $BE09  2C 0F 27  BIT $270F
  $BE0C  17        .db $17
  $BE0D  07        .db $07
  $BE0E  0F        .db $0F
  $BE0F  08        PHP
  $BE10  2C 12 0F  BIT $0F12
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  0F        .db $0F
  $BE1D  0F        .db $0F
  $BE1E  0F        .db $0F
  $BE1F  0F        .db $0F
  $BE20  0F        .db $0F
  $BE21  0F        .db $0F
  $BE22  0F        .db $0F
  $BE23  25 15     AND $15
  $BE25  2C 0F 28  BIT $280F
  $BE28  18        CLC
  $BE29  2C 0F 27  BIT $270F
  $BE2C  17        .db $17
  $BE2D  07        .db $07
  $BE2E  0F        .db $0F
  $BE2F  08        PHP
  $BE30  2C 12 0F  BIT $0F12
  $BE33  26 16     ROL $16
  $BE35  2C 0F 28  BIT $280F
  $BE38  18        CLC
  $BE39  2C 0F 27  BIT $270F
  $BE3C  17        .db $17
  $BE3D  07        .db $07
  $BE3E  0F        .db $0F
  $BE3F  08        PHP
  $BE40  2C 12 FF  BIT $FF12
  $BE43  FF        .db $FF
  $BE44  FF        .db $FF
  $BE45  FF        .db $FF
  $BE46  FF        .db $FF
  $BE47  FF        .db $FF
  $BE48  FF        .db $FF
  $BE49  FF        .db $FF
  $BE4A  FF        .db $FF
  $BE4B  FF        .db $FF
  $BE4C  FF        .db $FF
  $BE4D  FF        .db $FF
  $BE4E  FF        .db $FF
  $BE4F  FF        .db $FF
  $BE50  FF        .db $FF
  $BE51  FF        .db $FF
  $BE52  FF        .db $FF
  $BE53  FF        .db $FF
  $BE54  FF        .db $FF
  $BE55  FF        .db $FF
  $BE56  FF        .db $FF
  $BE57  FF        .db $FF
  $BE58  FF        .db $FF
  $BE59  FF        .db $FF
  $BE5A  FF        .db $FF
  $BE5B  FF        .db $FF
  $BE5C  FF        .db $FF
  $BE5D  FF        .db $FF
  $BE5E  FF        .db $FF
  $BE5F  FF        .db $FF
  $BE60  FF        .db $FF
  $BE61  FF        .db $FF
  $BE62  FF        .db $FF
  $BE63  FF        .db $FF
  $BE64  FF        .db $FF
  $BE65  FF        .db $FF
  $BE66  FF        .db $FF
  $BE67  FF        .db $FF
  $BE68  FF        .db $FF
  $BE69  FF        .db $FF
  $BE6A  FF        .db $FF
  $BE6B  FF        .db $FF
  $BE6C  FF        .db $FF
  $BE6D  FF        .db $FF
  $BE6E  FF        .db $FF
  $BE6F  FF        .db $FF
  $BE70  FF        .db $FF
  $BE71  FF        .db $FF
  $BE72  FF        .db $FF
  $BE73  FF        .db $FF
  $BE74  FF        .db $FF
  $BE75  FF        .db $FF
  $BE76  FF        .db $FF
  $BE77  FF        .db $FF
  $BE78  FF        .db $FF
  $BE79  FF        .db $FF
  $BE7A  FF        .db $FF
  $BE7B  FF        .db $FF
  $BE7C  FF        .db $FF
  $BE7D  FF        .db $FF
  $BE7E  FF        .db $FF
  $BE7F  FF        .db $FF
  $BE80  FF        .db $FF
  $BE81  FF        .db $FF
  $BE82  FF        .db $FF
  $BE83  FF        .db $FF
  $BE84  FF        .db $FF
  $BE85  FF        .db $FF
  $BE86  FF        .db $FF
  $BE87  FF        .db $FF
  $BE88  FF        .db $FF
  $BE89  FF        .db $FF
  $BE8A  FF        .db $FF
  $BE8B  FF        .db $FF
  $BE8C  FF        .db $FF
  $BE8D  FF        .db $FF
  $BE8E  FF        .db $FF
  $BE8F  FF        .db $FF
  $BE90  FF        .db $FF
  $BE91  FF        .db $FF
  $BE92  FF        .db $FF
  $BE93  FF        .db $FF
  $BE94  FF        .db $FF
  $BE95  FF        .db $FF
  $BE96  FF        .db $FF
  $BE97  FF        .db $FF
  $BE98  FF        .db $FF
  $BE99  FF        .db $FF
  $BE9A  FF        .db $FF
  $BE9B  FF        .db $FF
  $BE9C  FF        .db $FF
  $BE9D  FF        .db $FF
  $BE9E  FF        .db $FF
  $BE9F  FF        .db $FF
  $BEA0  FF        .db $FF
  $BEA1  FF        .db $FF
  $BEA2  FF        .db $FF
  $BEA3  FF        .db $FF
  $BEA4  FF        .db $FF
  $BEA5  FF        .db $FF
  $BEA6  FF        .db $FF
  $BEA7  FF        .db $FF
  $BEA8  FF        .db $FF
  $BEA9  FF        .db $FF
  $BEAA  FF        .db $FF
  $BEAB  FF        .db $FF
  $BEAC  FF        .db $FF
  $BEAD  FF        .db $FF
  $BEAE  FF        .db $FF
  $BEAF  FF        .db $FF
  $BEB0  FF        .db $FF
  $BEB1  FF        .db $FF
  $BEB2  FF        .db $FF
  $BEB3  FF        .db $FF
  $BEB4  FF        .db $FF
  $BEB5  FF        .db $FF
  $BEB6  FF        .db $FF
  $BEB7  FF        .db $FF
  $BEB8  FF        .db $FF
  $BEB9  FF        .db $FF
  $BEBA  FF        .db $FF
  $BEBB  FF        .db $FF
  $BEBC  FF        .db $FF
  $BEBD  FF        .db $FF
  $BEBE  FF        .db $FF
  $BEBF  FF        .db $FF
  $BEC0  FF        .db $FF
  $BEC1  FF        .db $FF
  $BEC2  FF        .db $FF
  $BEC3  FF        .db $FF
  $BEC4  FF        .db $FF
  $BEC5  FF        .db $FF
  $BEC6  FF        .db $FF
  $BEC7  FF        .db $FF
  $BEC8  FF        .db $FF
  $BEC9  FF        .db $FF
  $BECA  FF        .db $FF
  $BECB  FF        .db $FF
  $BECC  FF        .db $FF
  $BECD  FF        .db $FF
  $BECE  FF        .db $FF
  $BECF  FF        .db $FF
  $BED0  FF        .db $FF
  $BED1  FF        .db $FF
  $BED2  FF        .db $FF
  $BED3  FF        .db $FF
  $BED4  FF        .db $FF
  $BED5  FF        .db $FF
  $BED6  FF        .db $FF
  $BED7  FF        .db $FF
  $BED8  FF        .db $FF
  $BED9  FF        .db $FF
  $BEDA  FF        .db $FF
  $BEDB  FF        .db $FF
  $BEDC  FF        .db $FF
  $BEDD  FF        .db $FF
  $BEDE  FF        .db $FF
  $BEDF  FF        .db $FF
  $BEE0  FF        .db $FF
  $BEE1  FF        .db $FF
  $BEE2  FF        .db $FF
  $BEE3  FF        .db $FF
  $BEE4  FF        .db $FF
  $BEE5  FF        .db $FF
  $BEE6  FF        .db $FF
  $BEE7  FF        .db $FF
  $BEE8  FF        .db $FF
  $BEE9  FF        .db $FF
  $BEEA  FF        .db $FF
  $BEEB  FF        .db $FF
  $BEEC  FF        .db $FF
  $BEED  FF        .db $FF
  $BEEE  FF        .db $FF
  $BEEF  FF        .db $FF
  $BEF0  FF        .db $FF
  $BEF1  FF        .db $FF
  $BEF2  FF        .db $FF
  $BEF3  FF        .db $FF
  $BEF4  FF        .db $FF
  $BEF5  FF        .db $FF
  $BEF6  FF        .db $FF
  $BEF7  FF        .db $FF
  $BEF8  FF        .db $FF
  $BEF9  FF        .db $FF
  $BEFA  FF        .db $FF
  $BEFB  FF        .db $FF
  $BEFC  FF        .db $FF
  $BEFD  FF        .db $FF
  $BEFE  FF        .db $FF
  $BEFF  FF        .db $FF
  $BF00  00        BRK
  $BF01  00        BRK
  $BF02  0F        .db $0F
  $BF03  28        PLP
  $BF04  17        .db $17
  $BF05  18        CLC
  $BF06  0F        .db $0F
  $BF07  29 18     AND #$18
  $BF09  07        .db $07
  $BF0A  0F        .db $0F
  $BF0B  0F        .db $0F
  $BF0C  28        PLP
  $BF0D  18        CLC
  $BF0E  0F        .db $0F
  $BF0F  0A        ASL
  $BF10  08        PHP
  $BF11  0B        .db $0B
  $BF12  0F        .db $0F
  $BF13  0F        .db $0F
  $BF14  2C 11 0F  BIT $0F11
  $BF17  0F        .db $0F
  $BF18  20 38 0F  JSR $0F38
  $BF1B  0F        .db $0F
  $BF1C  0F        .db $0F
  $BF1D  0F        .db $0F
  $BF1E  0F        .db $0F
  $BF1F  0F        .db $0F
  $BF20  0F        .db $0F
  $BF21  0F        .db $0F
  $BF22  0F        .db $0F
  $BF23  27        .db $27
  $BF24  37        .db $37
  $BF25  30 0F     BMI $BF36
  $BF27  27        .db $27
  $BF28  11 16     ORA ($16),Y
  $BF2A  0F        .db $0F
  $BF2B  00        BRK
  $BF2C  10 16     BPL $BF44
  $BF2E  0F        .db $0F
  $BF2F  27        .db $27
  $BF30  06 16     ASL $16
  $BF32  0F        .db $0F
  $BF33  27        .db $27
  $BF34  37        .db $37
  $BF35  30 0F     BMI $BF46
  $BF37  27        .db $27
  $BF38  11 16     ORA ($16),Y
  $BF3A  0F        .db $0F
  $BF3B  10 00     BPL $BF3D

L_BF3D:
  $BF3D  16 0F     ASL $0F,X
  $BF3F  27        .db $27
  $BF40  06 16     ASL $16
  $BF42  FF        .db $FF
  $BF43  FF        .db $FF

L_BF44:
  $BF44  FF        .db $FF
  $BF45  FF        .db $FF

L_BF46:
  $BF46  FF        .db $FF
  $BF47  FF        .db $FF
  $BF48  FF        .db $FF
  $BF49  FF        .db $FF
  $BF4A  FF        .db $FF
  $BF4B  FF        .db $FF
  $BF4C  FF        .db $FF
  $BF4D  FF        .db $FF
  $BF4E  FF        .db $FF
  $BF4F  FF        .db $FF
  $BF50  FF        .db $FF
  $BF51  FF        .db $FF
  $BF52  FF        .db $FF
  $BF53  FF        .db $FF
  $BF54  FF        .db $FF
  $BF55  FF        .db $FF
  $BF56  FF        .db $FF
  $BF57  FF        .db $FF
  $BF58  FF        .db $FF
  $BF59  FF        .db $FF
  $BF5A  FF        .db $FF
  $BF5B  FF        .db $FF
  $BF5C  FF        .db $FF
  $BF5D  FF        .db $FF
  $BF5E  FF        .db $FF
  $BF5F  FF        .db $FF
  $BF60  FF        .db $FF
  $BF61  FF        .db $FF
  $BF62  FF        .db $FF
  $BF63  FF        .db $FF
  $BF64  FF        .db $FF
  $BF65  FF        .db $FF
  $BF66  FF        .db $FF
  $BF67  FF        .db $FF
  $BF68  FF        .db $FF
  $BF69  FF        .db $FF
  $BF6A  FF        .db $FF
  $BF6B  FF        .db $FF
  $BF6C  FF        .db $FF
  $BF6D  FF        .db $FF
  $BF6E  FF        .db $FF
  $BF6F  FF        .db $FF
  $BF70  FF        .db $FF
  $BF71  FF        .db $FF
  $BF72  FF        .db $FF
  $BF73  FF        .db $FF
  $BF74  FF        .db $FF
  $BF75  FF        .db $FF
  $BF76  FF        .db $FF
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
  $BFFA  00        BRK
  $BFFB  00        BRK
  $BFFC  E0 BF     CPX #$BF
  $BFFE  E0 BF     CPX #$BF