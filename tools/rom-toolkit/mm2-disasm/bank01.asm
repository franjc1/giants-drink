; Mega Man 2 — PRG Bank 1
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  00        BRK
  $8005  00        BRK
  $8006  7D 00 7D  ADC $7D00,X
  $8009  00        BRK
  $800A  7D 00 7D  ADC $7D00,X
  $800D  00        BRK
  $800E  00        BRK
  $800F  00        BRK
  $8010  00        BRK
  $8011  00        BRK
  $8012  49 49     EOR #$49
  $8014  47        .db $47
  $8015  4C 47 4D  JMP $4D47
  $8018  4E 4B 4F  LSR $4F4B
  $801B  4B        .db $4B
  $801C  00        BRK
  $801D  00        BRK
  $801E  08        PHP
  $801F  08        PHP
  $8020  7D 7D 7D  ADC $7D7D,X
  $8023  7D 3F 3E  ADC $3E3F,X
  $8026  08        PHP
  $8027  08        PHP
  $8028  00        BRK
  $8029  00        BRK
  $802A  08        PHP
  $802B  08        PHP
  $802C  7D 7D 3F  ADC $3F7D,X
  $802F  3E 7D 7D  ROL $7D7D,X
  $8032  00        BRK
  $8033  00        BRK
  $8034  3F        .db $3F
  $8035  3E 7D 7D  ROL $7D7D,X
  $8038  00        BRK
  $8039  00        BRK
  $803A  7D 7D 01  ADC $017D,X
  $803D  01 41     ORA ($41,X)
  $803F  41 01     EOR ($01,X)
  $8041  36 41     ROL $41,X
  $8043  7E 00 58  ROR $5800,X
  $8046  00        BRK
  $8047  59 00 5A  EOR $5A00,Y
  $804A  00        BRK
  $804B  5B        .db $5B
  $804C  00        BRK
  $804D  5C        .db $5C
  $804E  00        BRK
  $804F  00        BRK
  $8050  60        RTS
  $8051  68        PLA
  $8052  61 69     ADC ($69,X)
  $8054  62        .db $62
  $8055  6A        ROR
  $8056  63        .db $63
  $8057  6B        .db $6B
  $8058  64        .db $64
  $8059  6C 00 00  JMP ($0000)
  $805C  70 78     BVS $80D6
  $805E  71 79     ADC ($79),Y
  $8060  72        .db $72
  $8061  7A        .db $7A
  $8062  73        .db $73
  $8063  7B        .db $7B
  $8064  74        .db $74
  $8065  7C        .db $7C
  $8066  00        BRK
  $8067  00        BRK
  $8068  00        BRK
  $8069  00        BRK
  $806A  00        BRK
  $806B  58        CLI
  $806C  00        BRK
  $806D  59 00 5A  EOR $5A00,Y
  $8070  00        BRK
  $8071  5B        .db $5B
  $8072  00        BRK
  $8073  5C        .db $5C
  $8074  00        BRK
  $8075  00        BRK
  $8076  60        RTS
  $8077  68        PLA
  $8078  61 69     ADC ($69,X)
  $807A  62        .db $62
  $807B  6A        ROR
  $807C  63        .db $63
  $807D  6B        .db $6B
  $807E  64        .db $64
  $807F  6C 00 00  JMP ($0000)
  $8082  70 78     BVS $80FC
  $8084  71 79     ADC ($79),Y
  $8086  72        .db $72
  $8087  7A        .db $7A
  $8088  73        .db $73
  $8089  7B        .db $7B
  $808A  74        .db $74
  $808B  7C        .db $7C
  $808C  01 01     ORA ($01,X)
  $808E  01 01     ORA ($01,X)
  $8090  01 26     ORA ($26,X)
  $8092  26 00     ROL $00
  $8094  00        BRK
  $8095  00        BRK
  $8096  25 00     AND $00
  $8098  01 25     ORA ($25,X)
  $809A  01 01     ORA ($01,X)
  $809C  00        BRK
  $809D  2D 2D 01  AND $012D
  $80A0  01 26     ORA ($26,X)
  $80A2  01 25     ORA ($25,X)
  $80A4  01 35     ORA ($35,X)
  $80A6  01 36     ORA ($36,X)
  $80A8  2E 01 2F  ROL $2F01
  $80AB  01 00     ORA ($00,X)
  $80AD  27        .db $27
  $80AE  00        BRK
  $80AF  2D 00 27  AND $2700
  $80B2  00        BRK
  $80B3  00        BRK
  $80B4  01 01     ORA ($01,X)
  $80B6  27        .db $27
  $80B7  01 00     ORA ($00,X)
  $80B9  27        .db $27
  $80BA  00        BRK
  $80BB  00        BRK
  $80BC  00        BRK
  $80BD  00        BRK
  $80BE  00        BRK
  $80BF  2D 2D 01  AND $012D
  $80C2  01 01     ORA ($01,X)
  $80C4  26 00     ROL $00
  $80C6  00        BRK
  $80C7  00        BRK
  $80C8  01 01     ORA ($01,X)
  $80CA  01 26     ORA ($26,X)
  $80CC  00        BRK
  $80CD  2E 00 2F  ROL $2F00
  $80D0  27        .db $27
  $80D1  01 2D     ORA ($2D,X)
  $80D3  01 27     ORA ($27,X)
  $80D5  01 00     ORA ($00,X)
  $80D7  27        .db $27
  $80D8  26 00     ROL $00
  $80DA  25 00     AND $00
  $80DC  25 00     AND $00
  $80DE  01 25     ORA ($25,X)
  $80E0  00        BRK
  $80E1  00        BRK
  $80E2  25 2D     AND $2D
  $80E4  35 00     AND $00,X
  $80E6  36 00     ROL $00,X
  $80E8  26 27     ROL $27
  $80EA  00        BRK
  $80EB  00        BRK
  $80EC  00        BRK
  $80ED  00        BRK
  $80EE  2D 25 7D  AND $7D25
  $80F1  2D 5E 01  AND $015E
  $80F4  41 01     EOR ($01,X)
  $80F6  41 01     EOR ($01,X)
  $80F8  25 2D     AND $2D
  $80FA  01 01     ORA ($01,X)

L_80FC:
  $80FC  5F        .db $5F
  $80FD  01 7D     ORA ($7D,X)
  $80FF  27        .db $27
  $8100  5F        .db $5F
  $8101  26 7D     ROL $7D
  $8103  00        BRK
  $8104  27        .db $27
  $8105  26 00     ROL $00
  $8107  00        BRK
  $8108  01 01     ORA ($01,X)
  $810A  26 27     ROL $27
  $810C  41 26     EOR ($26,X)
  $810E  41 25     EOR ($25,X)
  $8110  7D 00 5E  ADC $5E00,X
  $8113  25 5E     AND $5E
  $8115  25 41     AND $41
  $8117  01 41     ORA ($41,X)
  $8119  01 01     ORA ($01,X)
  $811B  01 2E     ORA ($2E,X)
  $811D  01 2F     ORA ($2F,X)
  $811F  26 5E     ROL $5E
  $8121  01 41     ORA ($41,X)
  $8123  01 01     ORA ($01,X)
  $8125  01 27     ORA ($27,X)
  $8127  26 41     ROL $41
  $8129  01 27     ORA ($27,X)
  $812B  26 01     ROL $01
  $812D  01 41     ORA ($41,X)
  $812F  01 7D     ORA ($7D,X)
  $8131  00        BRK
  $8132  7D 2D 00  ADC $002D,X
  $8135  00        BRK
  $8136  7D 7D 5D  ADC $5D7D,X
  $8139  00        BRK
  $813A  7D 00 01  ADC $0100,X
  $813D  01 41     ORA ($41,X)
  $813F  26 5D     ROL $5D
  $8141  7D 00 00  ADC $0000,X
  $8144  00        BRK
  $8145  00        BRK
  $8146  25 2D     AND $2D
  $8148  7D 27 7D  ADC $7D27,X
  $814B  00        BRK
  $814C  01 01     ORA ($01,X)
  $814E  5F        .db $5F
  $814F  01 01     ORA ($01,X)
  $8151  01 01     ORA ($01,X)
  $8153  26 3F     ROL $3F
  $8155  3E 3E 3E  ROL $3E3E,X
  $8158  7D 7D 00  ADC $007D,X
  $815B  00        BRK
  $815C  5D 00 77  EOR $7700,X
  $815F  00        BRK
  $8160  7D 00 5D  ADC $5D00,X
  $8163  00        BRK
  $8164  77        .db $77
  $8165  00        BRK
  $8166  7D 00 00  ADC $0000,X
  $8169  27        .db $27
  $816A  00        BRK
  $816B  2E 00 2F  ROL $2F00
  $816E  00        BRK
  $816F  2D 00 00  AND $0000
  $8172  00        BRK
  $8173  2E 00 2F  ROL $2F00
  $8176  00        BRK
  $8177  00        BRK
  $8178  27        .db $27
  $8179  01 2E     ORA ($2E,X)
  $817B  01 2F     ORA ($2F,X)
  $817D  01 2D     ORA ($2D,X)
  $817F  01 26     ORA ($26,X)
  $8181  00        BRK
  $8182  35 00     AND $00,X
  $8184  36 00     ROL $00,X
  $8186  25 00     AND $00
  $8188  00        BRK
  $8189  00        BRK
  $818A  35 00     AND $00,X
  $818C  36 00     ROL $00,X
  $818E  00        BRK
  $818F  00        BRK
  $8190  01 26     ORA ($26,X)
  $8192  01 35     ORA ($35,X)
  $8194  01 36     ORA ($36,X)
  $8196  01 25     ORA ($25,X)
  $8198  25 00     AND $00
  $819A  01 35     ORA ($35,X)
  $819C  01 36     ORA ($36,X)
  $819E  26 00     ROL $00
  $81A0  00        BRK
  $81A1  2D 2E 01  AND $012E
  $81A4  2F        .db $2F
  $81A5  01 00     ORA ($00,X)
  $81A7  27        .db $27
  $81A8  00        BRK
  $81A9  00        BRK
  $81AA  58        CLI
  $81AB  60        RTS
  $81AC  59 61 5A  EOR $5A61,Y
  $81AF  62        .db $62
  $81B0  5B        .db $5B
  $81B1  63        .db $63
  $81B2  5C        .db $5C
  $81B3  64        .db $64
  $81B4  00        BRK
  $81B5  00        BRK
  $81B6  58        CLI
  $81B7  60        RTS
  $81B8  59 61 5A  EOR $5A61,Y
  $81BB  62        .db $62
  $81BC  5B        .db $5B
  $81BD  63        .db $63
  $81BE  5C        .db $5C
  $81BF  64        .db $64
  $81C0  58        CLI
  $81C1  60        RTS
  $81C2  59 61 5A  EOR $5A61,Y
  $81C5  62        .db $62
  $81C6  5B        .db $5B
  $81C7  63        .db $63
  $81C8  00        BRK
  $81C9  00        BRK
  $81CA  68        PLA
  $81CB  70 69     BVS $8236
  $81CD  71 6A     ADC ($6A),Y
  $81CF  72        .db $72
  $81D0  6B        .db $6B
  $81D1  73        .db $73
  $81D2  6C 74 00  JMP ($0074)
  $81D5  00        BRK
  $81D6  68        PLA
  $81D7  70 69     BVS $8242
  $81D9  71 6A     ADC ($6A),Y
  $81DB  72        .db $72
  $81DC  6B        .db $6B
  $81DD  73        .db $73
  $81DE  6C 74 68  JMP ($6874)
  $81E1  70 69     BVS $824C
  $81E3  71 6A     ADC ($6A),Y
  $81E5  72        .db $72
  $81E6  6B        .db $6B
  $81E7  73        .db $73
  $81E8  00        BRK
  $81E9  00        BRK
  $81EA  78        SEI
  $81EB  00        BRK
  $81EC  79 00 7A  ADC $7A00,Y
  $81EF  00        BRK
  $81F0  7B        .db $7B
  $81F1  00        BRK
  $81F2  7C        .db $7C
  $81F3  00        BRK
  $81F4  00        BRK
  $81F5  00        BRK
  $81F6  78        SEI
  $81F7  00        BRK
  $81F8  79 00 7A  ADC $7A00,Y
  $81FB  00        BRK
  $81FC  7B        .db $7B
  $81FD  00        BRK
  $81FE  7C        .db $7C
  $81FF  00        BRK
  $8200  78        SEI
  $8201  00        BRK
  $8202  79 00 7A  ADC $7A00,Y
  $8205  00        BRK
  $8206  7B        .db $7B
  $8207  00        BRK
  $8208  7C        .db $7C
  $8209  00        BRK
  $820A  00        BRK
  $820B  00        BRK
  $820C  5C        .db $5C
  $820D  64        .db $64
  $820E  00        BRK
  $820F  00        BRK
  $8210  6C 74 00  JMP ($0074)
  $8213  00        BRK
  $8214  58        CLI
  $8215  60        RTS
  $8216  59 61 5A  EOR $5A61,Y
  $8219  62        .db $62
  $821A  5B        .db $5B
  $821B  63        .db $63
  $821C  5C        .db $5C
  $821D  64        .db $64
  $821E  00        BRK
  $821F  00        BRK
  $8220  68        PLA
  $8221  70 69     BVS $828C
  $8223  71 6A     ADC ($6A),Y
  $8225  72        .db $72
  $8226  6B        .db $6B
  $8227  73        .db $73
  $8228  6C 74 00  JMP ($0074)
  $822B  00        BRK
  $822C  78        SEI
  $822D  00        BRK
  $822E  79 00 7A  ADC $7A00,Y
  $8231  00        BRK
  $8232  7B        .db $7B
  $8233  00        BRK
  $8234  7C        .db $7C
  $8235  00        BRK

L_8236:
  $8236  00        BRK
  $8237  00        BRK
  $8238  00        BRK
  $8239  00        BRK
  $823A  00        BRK
  $823B  7D 00 00  ADC $0000,X
  $823E  49 4A     EOR #$4A
  $8240  5A        .db $5A
  $8241  5C        .db $5C

L_8242:
  $8242  5B        .db $5B
  $8243  5D 24 24  EOR $2424,X
  $8246  24 24     BIT $24
  $8248  24 58     BIT $58
  $824A  24 59     BIT $59

L_824C:
  $824C  58        CLI
  $824D  5C        .db $5C
  $824E  59 5D 24  EOR $245D,Y
  $8251  22        .db $22
  $8252  24 22     BIT $22
  $8254  E3        .db $E3
  $8255  00        BRK
  $8256  E3        .db $E3
  $8257  00        BRK
  $8258  68        PLA
  $8259  70 69     BVS $82C4
  $825B  71 6A     ADC ($6A),Y
  $825D  72        .db $72
  $825E  6B        .db $6B
  $825F  73        .db $73
  $8260  24 24     BIT $24
  $8262  5A        .db $5A
  $8263  5C        .db $5C
  $8264  5B        .db $5B
  $8265  5D 5A 5C  EOR $5C5A,X
  $8268  24 24     BIT $24
  $826A  5E 25 5F  LSR $5F25,X
  $826D  25 5E     AND $5E
  $826F  25 5B     AND $5B
  $8271  5D 24 24  EOR $2424,X
  $8274  5B        .db $5B
  $8275  5D 82 82  EOR $8282,X
  $8278  6C 74 6D  JMP ($6D74)
  $827B  75 6E     ADC $6E,X
  $827D  76 6F     ROR $6F,X
  $827F  77        .db $77
  $8280  5C        .db $5C
  $8281  5A        .db $5A
  $8282  5D 5B 60  EOR $605B,X
  $8285  25 60     AND $60
  $8287  25 24     AND $24
  $8289  60        RTS
  $828A  24 60     BIT $60

L_828C:
  $828C  61 61     ADC ($61,X)
  $828E  82        .db $82
  $828F  82        .db $82
  $8290  5F        .db $5F
  $8291  25 82     AND $82
  $8293  82        .db $82
  $8294  5B        .db $5B
  $8295  5D 68 70  EOR $7068,X
  $8298  69 71     ADC #$71
  $829A  6A        ROR
  $829B  72        .db $72
  $829C  6B        .db $6B
  $829D  73        .db $73
  $829E  5A        .db $5A
  $829F  5C        .db $5C
  $82A0  24 60     BIT $60
  $82A2  24 82     BIT $82
  $82A4  24 61     BIT $61
  $82A6  24 82     BIT $82
  $82A8  25 24     AND $24
  $82AA  25 24     AND $24
  $82AC  25 24     AND $24
  $82AE  82        .db $82
  $82AF  24 24     BIT $24
  $82B1  60        RTS
  $82B2  82        .db $82
  $82B3  60        RTS
  $82B4  5B        .db $5B
  $82B5  5D 6C 74  EOR $746C,X
  $82B8  6D 75 6E  ADC $6E75
  $82BB  76 6F     ROR $6F,X
  $82BD  77        .db $77
  $82BE  5A        .db $5A
  $82BF  5C        .db $5C
  $82C0  24 24     BIT $24
  $82C2  82        .db $82
  $82C3  82        .db $82

L_82C4:
  $82C4  60        RTS
  $82C5  25 82     AND $82
  $82C7  82        .db $82
  $82C8  24 24     BIT $24
  $82CA  24 82     BIT $82
  $82CC  24 82     BIT $82
  $82CE  24 24     BIT $24
  $82D0  82        .db $82
  $82D1  82        .db $82
  $82D2  24 24     BIT $24
  $82D4  24 82     BIT $82
  $82D6  24 61     BIT $61
  $82D8  82        .db $82
  $82D9  60        RTS
  $82DA  24 60     BIT $60
  $82DC  82        .db $82
  $82DD  82        .db $82
  $82DE  61 61     ADC ($61,X)
  $82E0  25 24     AND $24
  $82E2  82        .db $82
  $82E3  82        .db $82
  $82E4  24 60     BIT $60
  $82E6  24 61     BIT $61
  $82E8  82        .db $82
  $82E9  82        .db $82
  $82EA  25 24     AND $24
  $82EC  25 24     AND $24
  $82EE  61 61     ADC ($61,X)
  $82F0  82        .db $82
  $82F1  82        .db $82
  $82F2  60        RTS
  $82F3  25 60     AND $60
  $82F5  25 61     AND $61
  $82F7  61 82     ADC ($82,X)
  $82F9  82        .db $82
  $82FA  24 60     BIT $60
  $82FC  24 60     BIT $60
  $82FE  61 61     ADC ($61,X)
  $8300  5E 25 5F  LSR $5F25,X
  $8303  25 61     AND $61
  $8305  61 24     ADC ($24,X)
  $8307  24 24     BIT $24
  $8309  24 61     BIT $61
  $830B  61 24     ADC ($24,X)
  $830D  24 24     BIT $24
  $830F  60        RTS
  $8310  24 24     BIT $24
  $8312  25 24     AND $24
  $8314  24 60     BIT $60
  $8316  24 24     BIT $24
  $8318  25 24     AND $24
  $831A  24 24     BIT $24
  $831C  00        BRK
  $831D  59 00 00  EOR $0000,Y
  $8320  5D 5B 24  EOR $245B,X
  $8323  24 67     BIT $67
  $8325  66 5C     ROR $5C
  $8327  5E 67 5F  LSR $5F67,X
  $832A  5C        .db $5C
  $832B  5A        .db $5A
  $832C  61 61     ADC ($61,X)
  $832E  58        CLI
  $832F  5A        .db $5A
  $8330  61 61     ADC ($61,X)
  $8332  5C        .db $5C
  $8333  5A        .db $5A
  $8334  59 66 00  EOR $0066,Y
  $8337  59 5D 66  EOR $665D,Y
  $833A  58        CLI
  $833B  5A        .db $5A
  $833C  59 5B 5C  EOR $5C5B,Y
  $833F  5A        .db $5A
  $8340  5D 5B 5C  EOR $5C5B,X
  $8343  5A        .db $5A
  $8344  5D 5B 00  EOR $005B,X
  $8347  00        BRK
  $8348  00        BRK
  $8349  00        BRK
  $834A  5C        .db $5C
  $834B  5A        .db $5A
  $834C  5D 5B 58  EOR $585B,X
  $834F  5A        .db $5A
  $8350  59 5B 58  EOR $585B,Y
  $8353  5A        .db $5A
  $8354  00        BRK
  $8355  00        BRK
  $8356  5C        .db $5C
  $8357  5E 5D 5F  LSR $5F5D,X
  $835A  5C        .db $5C
  $835B  5E 5D 5F  LSR $5F5D,X
  $835E  00        BRK
  $835F  00        BRK
  $8360  5F        .db $5F
  $8361  00        BRK
  $8362  5F        .db $5F
  $8363  00        BRK
  $8364  59 5B 82  EOR $825B,Y
  $8367  82        .db $82
  $8368  5D 5B 82  EOR $825B,X
  $836B  82        .db $82
  $836C  5F        .db $5F
  $836D  00        BRK
  $836E  82        .db $82
  $836F  82        .db $82
  $8370  5C        .db $5C
  $8371  5E 5D 5F  LSR $5F5D,X
  $8374  5D 5B 5C  EOR $5C5B,X
  $8377  68        PLA
  $8378  5D 69 5C  EOR $5C69,X
  $837B  6A        ROR
  $837C  5D 6B 5C  EOR $5C6B,X
  $837F  5A        .db $5A
  $8380  5B        .db $5B
  $8381  5D 00 00  EOR $0000,X
  $8384  5B        .db $5B
  $8385  5D 5E 00  EOR $005E,X
  $8388  60        RTS
  $8389  00        BRK
  $838A  00        BRK
  $838B  00        BRK
  $838C  00        BRK
  $838D  00        BRK
  $838E  00        BRK
  $838F  60        RTS
  $8390  5E 00 5D  LSR $5D00,X
  $8393  5A        .db $5A
  $8394  5D 5B 70  EOR $705B,X
  $8397  6C 71 6D  JMP ($6D71)
  $839A  72        .db $72
  $839B  6E 73 6F  ROR $6F73
  $839E  5C        .db $5C
  $839F  5A        .db $5A
  $83A0  5F        .db $5F
  $83A1  00        BRK
  $83A2  00        BRK
  $83A3  00        BRK
  $83A4  5B        .db $5B
  $83A5  5F        .db $5F
  $83A6  00        BRK
  $83A7  00        BRK
  $83A8  00        BRK
  $83A9  60        RTS
  $83AA  00        BRK
  $83AB  60        RTS
  $83AC  67        .db $67
  $83AD  5F        .db $5F
  $83AE  00        BRK
  $83AF  00        BRK
  $83B0  00        BRK
  $83B1  00        BRK
  $83B2  5E 00 5D  LSR $5D00,X
  $83B5  5B        .db $5B
  $83B6  74        .db $74
  $83B7  5A        .db $5A
  $83B8  75 5B     ADC $5B,X
  $83BA  76 5A     ROR $5A,X
  $83BC  77        .db $77
  $83BD  5B        .db $5B
  $83BE  5C        .db $5C
  $83BF  5A        .db $5A
  $83C0  22        .db $22
  $83C1  E3        .db $E3
  $83C2  22        .db $22
  $83C3  E3        .db $E3
  $83C4  61 61     ADC ($61,X)
  $83C6  00        BRK
  $83C7  00        BRK
  $83C8  00        BRK
  $83C9  00        BRK
  $83CA  61 61     ADC ($61,X)
  $83CC  00        BRK
  $83CD  22        .db $22
  $83CE  00        BRK
  $83CF  22        .db $22
  $83D0  5D 66 5C  EOR $5C66,X
  $83D3  5A        .db $5A
  $83D4  67        .db $67
  $83D5  5B        .db $5B
  $83D6  5C        .db $5C
  $83D7  5A        .db $5A
  $83D8  59 66 58  EOR $5866,Y
  $83DB  5A        .db $5A
  $83DC  67        .db $67
  $83DD  66 5C     ROR $5C
  $83DF  5A        .db $5A
  $83E0  67        .db $67
  $83E1  5F        .db $5F
  $83E2  5C        .db $5C
  $83E3  5E 78 00  LSR $0078,X
  $83E6  78        SEI
  $83E7  00        BRK
  $83E8  78        SEI
  $83E9  78        SEI

L_83EA:
  $83EA  00        BRK
  $83EB  00        BRK
  $83EC  00        BRK
  $83ED  00        BRK
  $83EE  78        SEI
  $83EF  78        SEI
  $83F0  78        SEI
  $83F1  78        SEI
  $83F2  78        SEI
  $83F3  00        BRK
  $83F4  78        SEI
  $83F5  00        BRK
  $83F6  78        SEI
  $83F7  78        SEI
  $83F8  78        SEI
  $83F9  00        BRK
  $83FA  00        BRK
  $83FB  00        BRK
  $83FC  00        BRK
  $83FD  00        BRK
  $83FE  78        SEI
  $83FF  00        BRK
  $8400  00        BRK
  $8401  04        .db $04
  $8402  05 01     ORA $01
  $8404  44        .db $44
  $8405  55 55     EOR $55,X
  $8407  55 55     EOR $55,X
  $8409  66 44     ROR $44
  $840B  99 11 66  STA $6611,Y
  $840E  44        .db $44
  $840F  00        BRK
  $8410  40        RTI
  $8411  A0 A0     LDY #$A0
  $8413  20 AA AA  JSR $AAAA
  $8416  22        .db $22
  $8417  AA        TAX
  $8418  AA        TAX
  $8419  22        .db $22
  $841A  C0 F0     CPY #$F0
  $841C  F0 CC     BEQ $83EA
  $841E  FF        .db $FF
  $841F  FF        .db $FF
  $8420  CC FF FF  CPY $FFFF
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
  $843C  05 00     ORA $00
  $843E  00        BRK
  $843F  05 05     ORA $05
  $8441  00        BRK
  $8442  00        BRK
  $8443  00        BRK
  $8444  05 01     ORA $01
  $8446  00        BRK
  $8447  00        BRK
  $8448  01 00     ORA ($00,X)
  $844A  00        BRK
  $844B  00        BRK
  $844C  05 44     ORA $44
  $844E  05 00     ORA $00
  $8450  11 00     ORA ($00),Y
  $8452  05 04     ORA $04
  $8454  00        BRK
  $8455  AA        TAX
  $8456  11 05     ORA ($05),Y
  $8458  05 05     ORA $05
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
  $8466  00        BRK
  $8467  00        BRK
  $8468  00        BRK
  $8469  00        BRK
  $846A  CC FF FF  CPY $FFFF
  $846D  88        DEY
  $846E  AA        TAX
  $846F  AA        TAX
  $8470  FF        .db $FF
  $8471  FF        .db $FF

L_8472:
  $8472  CC FF FF  CPY $FFFF
  $8475  88        DEY
  $8476  AA        TAX
  $8477  AA        TAX
  $8478  FF        .db $FF
  $8479  FF        .db $FF
  $847A  0C        .db $0C
  $847B  0F        .db $0F
  $847C  0F        .db $0F
  $847D  08        PHP
  $847E  0A        ASL
  $847F  0A        ASL
  $8480  0F        .db $0F
  $8481  0F        .db $0F
  $8482  03        .db $03
  $8483  33        .db $33
  $8484  33        .db $33
  $8485  AA        TAX
  $8486  AA        TAX
  $8487  22        .db $22
  $8488  AA        TAX
  $8489  AA        TAX
  $848A  22        .db $22
  $848B  0A        ASL
  $848C  0A        ASL
  $848D  02        .db $02
  $848E  40        RTI
  $848F  44        .db $44
  $8490  00        BRK
  $8491  55 05     EOR $05,X
  $8493  00        BRK
  $8494  05 00     ORA $00
  $8496  FF        .db $FF
  $8497  FF        .db $FF
  $8498  11 00     ORA ($00),Y
  $849A  51 50     EOR ($50),Y
  $849C  44        .db $44
  $849D  00        BRK
  $849E  FF        .db $FF
  $849F  FF        .db $FF
  $84A0  00        BRK
  $84A1  50 05     BVC $84A8
  $84A3  00        BRK
  $84A4  10 CC     BPL $8472
  $84A6  FF        .db $FF
  $84A7  33        .db $33

L_84A8:
  $84A8  05 05     ORA $05
  $84AA  55 51     EOR $51,X
  $84AC  01 CC     ORA ($CC,X)
  $84AE  FF        .db $FF
  $84AF  33        .db $33
  $84B0  11 10     ORA ($10),Y
  $84B2  15 45     ORA $45,X
  $84B4  44        .db $44
  $84B5  05 04     ORA $04
  $84B7  00        BRK
  $84B8  11 05     ORA ($05),Y
  $84BA  44        .db $44
  $84BB  11 40     ORA ($40),Y
  $84BD  10 04     BPL $84C3
  $84BF  01 50     ORA ($50,X)
  $84C1  44        .db $44
  $84C2  11 15     ORA ($15),Y
  $84C4  55 45     EOR $45,X
  $84C6  55 00     EOR $00,X
  $84C8  44        .db $44
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
  $84DD  C0 F0     CPY #$F0
  $84DF  30 00     BMI $84E1

L_84E1:
  $84E1  00        BRK
  $84E2  00        BRK
  $84E3  00        BRK
  $84E4  00        BRK
  $84E5  CC FF 33  CPY $33FF
  $84E8  00        BRK
  $84E9  00        BRK
  $84EA  00        BRK
  $84EB  00        BRK
  $84EC  00        BRK
  $84ED  0C        .db $0C
  $84EE  0F        .db $0F
  $84EF  03        .db $03
  $84F0  00        BRK
  $84F1  00        BRK
  $84F2  00        BRK
  $84F3  00        BRK
  $84F4  00        BRK
  $84F5  00        BRK
  $84F6  00        BRK
  $84F7  00        BRK
  $84F8  00        BRK
  $84F9  AA        TAX
  $84FA  AA        TAX
  $84FB  AA        TAX
  $84FC  AA        TAX
  $84FD  AA        TAX
  $84FE  AA        TAX
  $84FF  AA        TAX
  $8500  23        .db $23
  $8501  28        PLP
  $8502  00        BRK
  $8503  00        BRK
  $8504  02        .db $02
  $8505  2A        ROL
  $8506  23        .db $23
  $8507  23        .db $23
  $8508  23        .db $23
  $8509  24 00     BIT $00
  $850B  00        BRK
  $850C  57        .db $57
  $850D  2B        .db $2B
  $850E  23        .db $23
  $850F  23        .db $23
  $8510  23        .db $23
  $8511  39 00 00  AND $0000,Y
  $8514  02        .db $02
  $8515  2C 2D 23  BIT $232D
  $8518  24 00     BIT $00
  $851A  00        BRK
  $851B  00        BRK
  $851C  02        .db $02
  $851D  00        BRK
  $851E  5A        .db $5A
  $851F  23        .db $23
  $8520  00        BRK
  $8521  00        BRK
  $8522  00        BRK
  $8523  00        BRK
  $8524  57        .db $57
  $8525  00        BRK
  $8526  5B        .db $5B
  $8527  23        .db $23
  $8528  25 00     AND $00
  $852A  00        BRK
  $852B  00        BRK
  $852C  02        .db $02
  $852D  00        BRK
  $852E  2A        ROL
  $852F  23        .db $23
  $8530  26 25     ROL $25
  $8532  00        BRK
  $8533  00        BRK
  $8534  02        .db $02
  $8535  00        BRK
  $8536  5A        .db $5A
  $8537  23        .db $23
  $8538  23        .db $23
  $8539  29 00     AND #$00
  $853B  00        BRK
  $853C  57        .db $57
  $853D  00        BRK
  $853E  5D 2D 23  EOR $232D,X
  $8541  29 00     AND #$00
  $8543  00        BRK
  $8544  00        BRK
  $8545  00        BRK
  $8546  00        BRK
  $8547  2C 23 60  BIT $6023
  $854A  00        BRK
  $854B  11 14     ORA ($14),Y
  $854D  17        .db $17
  $854E  00        BRK
  $854F  00        BRK
  $8550  32        .db $32
  $8551  63        .db $63
  $8552  00        BRK
  $8553  12        .db $12
  $8554  15 18     ORA $18,X
  $8556  00        BRK
  $8557  00        BRK
  $8558  31 00     AND ($00),Y
  $855A  00        BRK
  $855B  13        .db $13
  $855C  16 19     ASL $19,X
  $855E  00        BRK
  $855F  00        BRK
  $8560  00        BRK
  $8561  00        BRK
  $8562  00        BRK
  $8563  01 00     ORA ($00,X)
  $8565  00        BRK
  $8566  00        BRK
  $8567  33        .db $33
  $8568  00        BRK
  $8569  00        BRK
  $856A  00        BRK
  $856B  03        .db $03
  $856C  00        BRK
  $856D  00        BRK
  $856E  00        BRK
  $856F  27        .db $27
  $8570  25 00     AND $00
  $8572  00        BRK
  $8573  00        BRK
  $8574  6A        ROR
  $8575  72        .db $72
  $8576  7A        .db $7A
  $8577  34        .db $34
  $8578  26 25     ROL $25
  $857A  00        BRK
  $857B  00        BRK
  $857C  6B        .db $6B
  $857D  73        .db $73
  $857E  7B        .db $7B
  $857F  35 23     AND $23,X
  $8581  29 00     AND #$00
  $8583  00        BRK
  $8584  6C 74 7C  JMP ($7C74)
  $8587  00        BRK
  $8588  23        .db $23
  $8589  29 00     AND #$00
  $858B  00        BRK
  $858C  00        BRK
  $858D  00        BRK
  $858E  00        BRK
  $858F  00        BRK
  $8590  23        .db $23
  $8591  29 00     AND #$00
  $8593  03        .db $03
  $8594  00        BRK
  $8595  00        BRK
  $8596  00        BRK
  $8597  00        BRK
  $8598  32        .db $32
  $8599  31 6D     AND ($6D),Y
  $859B  75 7D     ADC $7D,X
  $859D  00        BRK
  $859E  00        BRK
  $859F  27        .db $27
  $85A0  29 00     AND #$00
  $85A2  6E 76 7E  ROR $7E76
  $85A5  00        BRK
  $85A6  33        .db $33
  $85A7  23        .db $23
  $85A8  31 00     AND ($00),Y
  $85AA  6F        .db $6F
  $85AB  77        .db $77
  $85AC  7F        .db $7F
  $85AD  00        BRK
  $85AE  33        .db $33
  $85AF  23        .db $23
  $85B0  00        BRK
  $85B1  00        BRK
  $85B2  00        BRK
  $85B3  00        BRK
  $85B4  00        BRK
  $85B5  00        BRK
  $85B6  00        BRK
  $85B7  34        .db $34
  $85B8  00        BRK
  $85B9  00        BRK
  $85BA  8E 00 00  STX $0000
  $85BD  00        BRK
  $85BE  27        .db $27
  $85BF  23        .db $23
  $85C0  00        BRK
  $85C1  00        BRK
  $85C2  00        BRK
  $85C3  00        BRK
  $85C4  00        BRK
  $85C5  00        BRK
  $85C6  34        .db $34
  $85C7  23        .db $23
  $85C8  00        BRK
  $85C9  00        BRK
  $85CA  00        BRK
  $85CB  70 78     BVS $8645
  $85CD  80        .db $80
  $85CE  34        .db $34
  $85CF  23        .db $23
  $85D0  25 00     AND $00
  $85D2  00        BRK
  $85D3  71 79     ADC ($79),Y
  $85D5  81 35     STA ($35,X)
  $85D7  23        .db $23
  $85D8  26 25     ROL $25
  $85DA  00        BRK
  $85DB  83        .db $83
  $85DC  84 82     STY $82
  $85DE  00        BRK
  $85DF  35 23     AND $23,X
  $85E1  36 00     ROL $00,X
  $85E3  01 00     ORA ($00,X)
  $85E5  00        BRK
  $85E6  00        BRK
  $85E7  00        BRK
  $85E8  23        .db $23
  $85E9  29 00     AND #$00
  $85EB  00        BRK
  $85EC  00        BRK
  $85ED  00        BRK
  $85EE  00        BRK
  $85EF  00        BRK
  $85F0  23        .db $23
  $85F1  29 00     AND #$00
  $85F3  85 88     STA $88
  $85F5  8B        .db $8B
  $85F6  00        BRK
  $85F7  00        BRK
  $85F8  23        .db $23
  $85F9  36 00     ROL $00,X
  $85FB  86 89     STX $89
  $85FD  8C 00 00  STY $0000
  $8600  23        .db $23
  $8601  36 00     ROL $00,X
  $8603  87        .db $87
  $8604  8A        TXA
  $8605  8D 00 00  STA $0000
  $8608  32        .db $32
  $8609  31 00     AND ($00),Y
  $860B  01 00     ORA ($00,X)
  $860D  00        BRK
  $860E  00        BRK
  $860F  00        BRK
  $8610  31 00     AND ($00),Y
  $8612  00        BRK
  $8613  02        .db $02
  $8614  00        BRK
  $8615  00        BRK
  $8616  00        BRK
  $8617  27        .db $27
  $8618  00        BRK
  $8619  00        BRK
  $861A  00        BRK
  $861B  00        BRK
  $861C  00        BRK
  $861D  00        BRK
  $861E  27        .db $27
  $861F  23        .db $23
  $8620  00        BRK
  $8621  00        BRK
  $8622  00        BRK
  $8623  00        BRK
  $8624  00        BRK
  $8625  00        BRK
  $8626  34        .db $34
  $8627  23        .db $23
  $8628  00        BRK
  $8629  00        BRK
  $862A  00        BRK
  $862B  00        BRK
  $862C  00        BRK
  $862D  00        BRK
  $862E  34        .db $34
  $862F  23        .db $23
  $8630  00        BRK
  $8631  00        BRK
  $8632  00        BRK
  $8633  00        BRK
  $8634  00        BRK
  $8635  00        BRK
  $8636  35 23     AND $23,X
  $8638  00        BRK
  $8639  00        BRK
  $863A  00        BRK
  $863B  00        BRK
  $863C  00        BRK
  $863D  00        BRK
  $863E  00        BRK
  $863F  35 00     AND $00,X
  $8641  00        BRK
  $8642  00        BRK
  $8643  00        BRK
  $8644  00        BRK

L_8645:
  $8645  00        BRK
  $8646  00        BRK
  $8647  00        BRK
  $8648  00        BRK
  $8649  00        BRK
  $864A  00        BRK
  $864B  00        BRK
  $864C  00        BRK
  $864D  00        BRK
  $864E  00        BRK
  $864F  2F        .db $2F
  $8650  00        BRK
  $8651  00        BRK
  $8652  00        BRK
  $8653  00        BRK
  $8654  00        BRK
  $8655  2F        .db $2F
  $8656  38        SEC
  $8657  30 00     BMI $8659

L_8659:
  $8659  00        BRK
  $865A  00        BRK
  $865B  00        BRK
  $865C  00        BRK
  $865D  2A        ROL
  $865E  23        .db $23
  $865F  23        .db $23
  $8660  00        BRK
  $8661  00        BRK
  $8662  00        BRK
  $8663  00        BRK
  $8664  2F        .db $2F
  $8665  30 23     BMI $868A
  $8667  23        .db $23
  $8668  00        BRK
  $8669  00        BRK
  $866A  00        BRK
  $866B  00        BRK
  $866C  2B        .db $2B
  $866D  23        .db $23
  $866E  23        .db $23
  $866F  23        .db $23
  $8670  00        BRK
  $8671  00        BRK
  $8672  00        BRK
  $8673  5C        .db $5C
  $8674  30 23     BMI $8699
  $8676  23        .db $23
  $8677  23        .db $23
  $8678  00        BRK
  $8679  00        BRK
  $867A  00        BRK
  $867B  5D 2D 23  EOR $232D,X
  $867E  23        .db $23
  $867F  23        .db $23
  $8680  00        BRK
  $8681  00        BRK
  $8682  00        BRK
  $8683  00        BRK
  $8684  2A        ROL
  $8685  23        .db $23
  $8686  23        .db $23
  $8687  23        .db $23
  $8688  00        BRK
  $8689  00        BRK

L_868A:
  $868A  00        BRK
  $868B  00        BRK
  $868C  2C 2D 23  BIT $232D
  $868F  23        .db $23
  $8690  00        BRK
  $8691  00        BRK
  $8692  00        BRK
  $8693  00        BRK
  $8694  00        BRK
  $8695  2A        ROL
  $8696  23        .db $23
  $8697  23        .db $23
  $8698  00        BRK

L_8699:
  $8699  00        BRK
  $869A  00        BRK
  $869B  00        BRK
  $869C  00        BRK
  $869D  2C 2D 23  BIT $232D
  $86A0  37        .db $37
  $86A1  00        BRK
  $86A2  00        BRK
  $86A3  00        BRK
  $86A4  00        BRK
  $86A5  00        BRK
  $86A6  2C 3A 28  BIT $283A
  $86A9  00        BRK
  $86AA  00        BRK
  $86AB  00        BRK
  $86AC  00        BRK
  $86AD  00        BRK
  $86AE  00        BRK
  $86AF  00        BRK
  $86B0  23        .db $23
  $86B1  66 00     ROR $00
  $86B3  00        BRK
  $86B4  00        BRK
  $86B5  00        BRK
  $86B6  00        BRK
  $86B7  3B        .db $3B
  $86B8  23        .db $23
  $86B9  65 00     ADC $00
  $86BB  00        BRK
  $86BC  00        BRK
  $86BD  00        BRK
  $86BE  33        .db $33
  $86BF  23        .db $23
  $86C0  23        .db $23
  $86C1  24 00     BIT $00
  $86C3  00        BRK
  $86C4  57        .db $57
  $86C5  00        BRK
  $86C6  00        BRK
  $86C7  34        .db $34
  $86C8  28        PLP
  $86C9  00        BRK
  $86CA  00        BRK
  $86CB  00        BRK
  $86CC  02        .db $02
  $86CD  00        BRK
  $86CE  33        .db $33
  $86CF  23        .db $23
  $86D0  24 00     BIT $00
  $86D2  00        BRK
  $86D3  00        BRK
  $86D4  02        .db $02
  $86D5  00        BRK
  $86D6  33        .db $33
  $86D7  23        .db $23
  $86D8  00        BRK
  $86D9  00        BRK
  $86DA  00        BRK
  $86DB  00        BRK
  $86DC  57        .db $57
  $86DD  00        BRK
  $86DE  27        .db $27
  $86DF  23        .db $23
  $86E0  00        BRK
  $86E1  00        BRK
  $86E2  00        BRK
  $86E3  00        BRK
  $86E4  02        .db $02
  $86E5  33        .db $33
  $86E6  23        .db $23
  $86E7  23        .db $23
  $86E8  00        BRK
  $86E9  00        BRK
  $86EA  00        BRK
  $86EB  00        BRK
  $86EC  3C        .db $3C
  $86ED  3E 23 23  ROL $2323,X
  $86F0  00        BRK
  $86F1  00        BRK
  $86F2  00        BRK
  $86F3  68        PLA
  $86F4  3D 23 23  AND $2323,X
  $86F7  23        .db $23
  $86F8  00        BRK
  $86F9  00        BRK
  $86FA  00        BRK
  $86FB  5F        .db $5F
  $86FC  3D 23 23  AND $2323,X
  $86FF  23        .db $23
  $8700  00        BRK
  $8701  00        BRK
  $8702  00        BRK
  $8703  35 3D     AND $3D,X
  $8705  23        .db $23
  $8706  23        .db $23
  $8707  23        .db $23
  $8708  00        BRK
  $8709  00        BRK
  $870A  00        BRK
  $870B  00        BRK
  $870C  3F        .db $3F
  $870D  23        .db $23
  $870E  23        .db $23
  $870F  23        .db $23
  $8710  00        BRK
  $8711  00        BRK
  $8712  00        BRK
  $8713  00        BRK
  $8714  57        .db $57
  $8715  5E 23 23  LSR $2323,X
  $8718  37        .db $37
  $8719  00        BRK
  $871A  00        BRK
  $871B  00        BRK
  $871C  02        .db $02
  $871D  69 23     ADC #$23
  $871F  23        .db $23
  $8720  23        .db $23
  $8721  66 00     ROR $00
  $8723  00        BRK
  $8724  02        .db $02
  $8725  33        .db $33
  $8726  23        .db $23
  $8727  23        .db $23
  $8728  23        .db $23
  $8729  65 00     ADC $00
  $872B  00        BRK
  $872C  57        .db $57
  $872D  00        BRK
  $872E  35 23     AND $23,X
  $8730  23        .db $23
  $8731  23        .db $23
  $8732  39 00 02  AND $0200,Y
  $8735  00        BRK
  $8736  33        .db $33
  $8737  23        .db $23
  $8738  23        .db $23
  $8739  23        .db $23
  $873A  37        .db $37
  $873B  00        BRK
  $873C  02        .db $02
  $873D  00        BRK
  $873E  00        BRK
  $873F  34        .db $34
  $8740  23        .db $23
  $8741  23        .db $23
  $8742  24 00     BIT $00
  $8744  57        .db $57
  $8745  00        BRK
  $8746  00        BRK
  $8747  35 23     AND $23,X
  $8749  23        .db $23
  $874A  39 00 02  AND $0200,Y
  $874D  00        BRK
  $874E  00        BRK
  $874F  2F        .db $2F
  $8750  23        .db $23
  $8751  28        PLP
  $8752  00        BRK
  $8753  00        BRK
  $8754  02        .db $02
  $8755  00        BRK
  $8756  2F        .db $2F
  $8757  30 23     BMI $877C
  $8759  24 00     BIT $00
  $875B  00        BRK
  $875C  57        .db $57
  $875D  00        BRK
  $875E  2A        ROL
  $875F  23        .db $23
  $8760  24 00     BIT $00
  $8762  00        BRK
  $8763  00        BRK
  $8764  02        .db $02
  $8765  2F        .db $2F
  $8766  30 23     BMI $878B
  $8768  00        BRK
  $8769  00        BRK
  $876A  00        BRK
  $876B  2F        .db $2F
  $876C  45 30     EOR $30
  $876E  23        .db $23
  $876F  23        .db $23
  $8770  00        BRK
  $8771  00        BRK
  $8772  00        BRK
  $8773  2A        ROL
  $8774  46 23     LSR $23
  $8776  23        .db $23
  $8777  23        .db $23
  $8778  00        BRK
  $8779  00        BRK
  $877A  2F        .db $2F
  $877B  30 23     BMI $87A0
  $877D  23        .db $23
  $877E  23        .db $23
  $877F  23        .db $23
  $8780  49 31     EOR #$31
  $8782  00        BRK
  $8783  00        BRK
  $8784  33        .db $33
  $8785  23        .db $23
  $8786  23        .db $23
  $8787  23        .db $23
  $8788  00        BRK
  $8789  00        BRK
  $878A  00        BRK

L_878B:
  $878B  01 00     ORA ($00,X)
  $878D  35 4B     AND $4B,X
  $878F  23        .db $23
  $8790  37        .db $37
  $8791  00        BRK
  $8792  00        BRK
  $8793  00        BRK
  $8794  00        BRK
  $8795  00        BRK
  $8796  3F        .db $3F
  $8797  24 23     BIT $23
  $8799  39 00 03  AND $0300,Y
  $879C  00        BRK
  $879D  56 02     LSR $02,X
  $879F  00        BRK

L_87A0:
  $87A0  23        .db $23
  $87A1  37        .db $37
  $87A2  00        BRK
  $87A3  01 00     ORA ($00,X)
  $87A5  00        BRK
  $87A6  02        .db $02
  $87A7  00        BRK
  $87A8  23        .db $23
  $87A9  28        PLP
  $87AA  00        BRK
  $87AB  00        BRK
  $87AC  00        BRK
  $87AD  4D 02 2F  EOR $2F02
  $87B0  23        .db $23
  $87B1  23        .db $23
  $87B2  39 02 00  AND $0002,Y
  $87B5  2F        .db $2F
  $87B6  45 30     EOR $30
  $87B8  23        .db $23
  $87B9  23        .db $23
  $87BA  39 02 5C  AND $5C02,Y
  $87BD  30 3D     BMI $87FC
  $87BF  23        .db $23
  $87C0  32        .db $32
  $87C1  31 00     AND ($00),Y
  $87C3  27        .db $27
  $87C4  3D 23 23  AND $2323,X
  $87C7  23        .db $23
  $87C8  29 00     AND #$00
  $87CA  33        .db $33
  $87CB  23        .db $23
  $87CC  3D 23 23  AND $2323,X
  $87CF  23        .db $23
  $87D0  31 00     AND ($00),Y
  $87D2  00        BRK
  $87D3  35 3D     AND $3D,X
  $87D5  23        .db $23
  $87D6  23        .db $23
  $87D7  23        .db $23
  $87D8  00        BRK
  $87D9  00        BRK
  $87DA  00        BRK
  $87DB  68        PLA
  $87DC  3D 23 23  AND $2323,X
  $87DF  23        .db $23
  $87E0  00        BRK
  $87E1  00        BRK
  $87E2  00        BRK
  $87E3  69 3D     ADC #$3D
  $87E5  23        .db $23
  $87E6  23        .db $23
  $87E7  23        .db $23
  $87E8  00        BRK
  $87E9  00        BRK
  $87EA  00        BRK
  $87EB  68        PLA
  $87EC  3D 23 23  AND $2323,X
  $87EF  23        .db $23
  $87F0  37        .db $37
  $87F1  00        BRK
  $87F2  00        BRK
  $87F3  69 3D     ADC #$3D
  $87F5  23        .db $23
  $87F6  23        .db $23
  $87F7  23        .db $23
  $87F8  23        .db $23
  $87F9  39 00 00  AND $0000,Y

L_87FC:
  $87FC  3F        .db $3F
  $87FD  23        .db $23
  $87FE  23        .db $23
  $87FF  23        .db $23
  $8800  23        .db $23
  $8801  39 00 00  AND $0000,Y
  $8804  00        BRK
  $8805  35 23     AND $23,X
  $8807  23        .db $23
  $8808  24 00     BIT $00
  $880A  00        BRK
  $880B  11 14     ORA ($14),Y
  $880D  17        .db $17
  $880E  5E 23 00  LSR $0023,X
  $8811  00        BRK
  $8812  00        BRK
  $8813  12        .db $12
  $8814  15 18     ORA $18,X
  $8816  69 23     ADC #$23
  $8818  00        BRK
  $8819  00        BRK
  $881A  00        BRK
  $881B  13        .db $13
  $881C  16 19     ASL $19,X
  $881E  33        .db $33
  $881F  23        .db $23
  $8820  00        BRK
  $8821  00        BRK
  $8822  1A        .db $1A
  $8823  1D 20 00  ORA $0020,X
  $8826  00        BRK
  $8827  5E 00 00  LSR $0000,X
  $882A  1B        .db $1B
  $882B  1E 21 00  ASL $0021,X
  $882E  00        BRK
  $882F  69 00     ADC #$00
  $8831  00        BRK
  $8832  1C        .db $1C
  $8833  1F        .db $1F
  $8834  22        .db $22
  $8835  00        BRK
  $8836  00        BRK
  $8837  00        BRK
  $8838  00        BRK
  $8839  00        BRK
  $883A  00        BRK
  $883B  00        BRK
  $883C  00        BRK
  $883D  00        BRK
  $883E  00        BRK
  $883F  00        BRK
  $8840  00        BRK
  $8841  00        BRK
  $8842  00        BRK
  $8843  00        BRK
  $8844  00        BRK
  $8845  00        BRK
  $8846  00        BRK
  $8847  00        BRK
  $8848  25 00     AND $00
  $884A  00        BRK
  $884B  00        BRK
  $884C  58        CLI
  $884D  00        BRK
  $884E  00        BRK
  $884F  00        BRK
  $8850  26 25     ROL $25
  $8852  00        BRK
  $8853  00        BRK
  $8854  59 00 00  EOR $0000,Y
  $8857  00        BRK
  $8858  23        .db $23
  $8859  29 00     AND #$00
  $885B  00        BRK
  $885C  00        BRK
  $885D  00        BRK
  $885E  00        BRK
  $885F  00        BRK
  $8860  23        .db $23
  $8861  29 00     AND #$00
  $8863  00        BRK
  $8864  58        CLI
  $8865  00        BRK
  $8866  00        BRK
  $8867  00        BRK
  $8868  23        .db $23
  $8869  29 00     AND #$00
  $886B  00        BRK
  $886C  59 00 00  EOR $0000,Y
  $886F  27        .db $27
  $8870  32        .db $32
  $8871  31 00     AND ($00),Y
  $8873  00        BRK
  $8874  03        .db $03
  $8875  00        BRK
  $8876  27        .db $27
  $8877  23        .db $23
  $8878  31 00     AND ($00),Y
  $887A  00        BRK
  $887B  00        BRK
  $887C  01 33     ORA ($33,X)
  $887E  23        .db $23
  $887F  23        .db $23
  $8880  25 00     AND $00
  $8882  00        BRK
  $8883  00        BRK
  $8884  02        .db $02
  $8885  33        .db $33
  $8886  23        .db $23
  $8887  23        .db $23
  $8888  29 00     AND #$00
  $888A  00        BRK
  $888B  00        BRK
  $888C  57        .db $57
  $888D  00        BRK
  $888E  34        .db $34
  $888F  23        .db $23
  $8890  29 00     AND #$00
  $8892  00        BRK
  $8893  00        BRK
  $8894  02        .db $02
  $8895  00        BRK
  $8896  34        .db $34
  $8897  23        .db $23
  $8898  29 00     AND #$00
  $889A  00        BRK
  $889B  58        CLI
  $889C  00        BRK
  $889D  00        BRK
  $889E  35 23     AND $23,X
  $88A0  31 00     AND ($00),Y
  $88A2  00        BRK
  $88A3  59 00 00  EOR $0000,Y
  $88A6  33        .db $33
  $88A7  23        .db $23
  $88A8  00        BRK
  $88A9  00        BRK
  $88AA  58        CLI
  $88AB  00        BRK
  $88AC  00        BRK
  $88AD  00        BRK
  $88AE  00        BRK
  $88AF  34        .db $34
  $88B0  00        BRK
  $88B1  00        BRK
  $88B2  59 00 00  EOR $0000,Y
  $88B5  00        BRK
  $88B6  00        BRK
  $88B7  35 00     AND $00,X
  $88B9  00        BRK
  $88BA  00        BRK
  $88BB  00        BRK
  $88BC  02        .db $02
  $88BD  00        BRK
  $88BE  00        BRK
  $88BF  00        BRK
  $88C0  25 00     AND $00
  $88C2  00        BRK
  $88C3  00        BRK
  $88C4  57        .db $57
  $88C5  00        BRK
  $88C6  00        BRK
  $88C7  00        BRK
  $88C8  26 62     ROL $62
  $88CA  00        BRK
  $88CB  00        BRK
  $88CC  02        .db $02
  $88CD  00        BRK
  $88CE  00        BRK
  $88CF  00        BRK
  $88D0  23        .db $23
  $88D1  61 00     ADC ($00,X)
  $88D3  00        BRK
  $88D4  00        BRK
  $88D5  00        BRK
  $88D6  00        BRK
  $88D7  00        BRK
  $88D8  23        .db $23
  $88D9  26 62     ROL $62
  $88DB  00        BRK
  $88DC  58        CLI
  $88DD  00        BRK
  $88DE  00        BRK
  $88DF  00        BRK
  $88E0  23        .db $23
  $88E1  23        .db $23
  $88E2  61 00     ADC ($00,X)
  $88E4  59 00 00  EOR $0000,Y
  $88E7  2F        .db $2F
  $88E8  23        .db $23
  $88E9  23        .db $23
  $88EA  36 00     ROL $00,X
  $88EC  00        BRK
  $88ED  00        BRK
  $88EE  2F        .db $2F
  $88EF  30 23     BMI $8914
  $88F1  32        .db $32
  $88F2  31 00     AND ($00),Y
  $88F4  58        CLI
  $88F5  00        BRK
  $88F6  2B        .db $2B
  $88F7  23        .db $23
  $88F8  23        .db $23
  $88F9  29 00     AND #$00
  $88FB  00        BRK
  $88FC  59 00 2A  EOR $2A00,Y
  $88FF  23        .db $23
  $8900  23        .db $23
  $8901  29 00     AND #$00
  $8903  00        BRK
  $8904  00        BRK
  $8905  00        BRK
  $8906  2A        ROL
  $8907  23        .db $23
  $8908  23        .db $23
  $8909  26 62     ROL $62
  $890B  00        BRK
  $890C  03        .db $03
  $890D  00        BRK
  $890E  2A        ROL
  $890F  23        .db $23
  $8910  23        .db $23
  $8911  32        .db $32
  $8912  63        .db $63
  $8913  00        BRK

L_8914:
  $8914  01 00     ORA ($00,X)
  $8916  2E 2D 23  ROL $232D
  $8919  29 00     AND #$00
  $891B  00        BRK
  $891C  57        .db $57
  $891D  00        BRK
  $891E  2F        .db $2F
  $891F  30 23     BMI $8944
  $8921  29 00     AND #$00
  $8923  00        BRK
  $8924  03        .db $03
  $8925  00        BRK
  $8926  2A        ROL
  $8927  23        .db $23
  $8928  32        .db $32
  $8929  31 00     AND ($00),Y
  $892B  00        BRK
  $892C  01 2F     ORA ($2F,X)
  $892E  30 23     BMI $8953
  $8930  31 00     AND ($00),Y
  $8932  00        BRK
  $8933  01 03     ORA ($03,X)
  $8935  2E 2D 23  ROL $232D
  $8938  00        BRK
  $8939  00        BRK
  $893A  00        BRK
  $893B  57        .db $57
  $893C  00        BRK
  $893D  00        BRK
  $893E  2A        ROL
  $893F  23        .db $23
  $8940  00        BRK
  $8941  00        BRK
  $8942  01 03     ORA ($03,X)

L_8944:
  $8944  00        BRK
  $8945  00        BRK
  $8946  2E 2D 00  ROL $002D
  $8949  00        BRK
  $894A  57        .db $57
  $894B  00        BRK
  $894C  00        BRK
  $894D  00        BRK
  $894E  00        BRK
  $894F  2E 00 00  ROL $0000
  $8952  02        .db $02

L_8953:
  $8953  00        BRK
  $8954  00        BRK
  $8955  00        BRK
  $8956  00        BRK
  $8957  00        BRK
  $8958  00        BRK
  $8959  00        BRK
  $895A  57        .db $57
  $895B  00        BRK
  $895C  00        BRK
  $895D  00        BRK
  $895E  00        BRK
  $895F  00        BRK
  $8960  00        BRK
  $8961  00        BRK
  $8962  00        BRK
  $8963  00        BRK
  $8964  00        BRK
  $8965  00        BRK
  $8966  00        BRK
  $8967  00        BRK
  $8968  00        BRK
  $8969  00        BRK
  $896A  00        BRK
  $896B  00        BRK
  $896C  57        .db $57
  $896D  00        BRK
  $896E  00        BRK
  $896F  00        BRK
  $8970  00        BRK
  $8971  00        BRK
  $8972  00        BRK
  $8973  00        BRK
  $8974  02        .db $02
  $8975  00        BRK
  $8976  00        BRK
  $8977  00        BRK
  $8978  00        BRK
  $8979  00        BRK
  $897A  00        BRK
  $897B  00        BRK
  $897C  57        .db $57
  $897D  00        BRK
  $897E  00        BRK
  $897F  00        BRK
  $8980  00        BRK
  $8981  00        BRK
  $8982  00        BRK
  $8983  01 00     ORA ($00,X)
  $8985  00        BRK
  $8986  00        BRK
  $8987  00        BRK
  $8988  00        BRK
  $8989  00        BRK
  $898A  00        BRK
  $898B  57        .db $57
  $898C  00        BRK
  $898D  00        BRK
  $898E  00        BRK
  $898F  00        BRK
  $8990  00        BRK
  $8991  00        BRK
  $8992  00        BRK
  $8993  03        .db $03
  $8994  00        BRK
  $8995  00        BRK
  $8996  00        BRK
  $8997  00        BRK
  $8998  00        BRK
  $8999  00        BRK
  $899A  58        CLI
  $899B  00        BRK
  $899C  00        BRK
  $899D  00        BRK
  $899E  00        BRK
  $899F  00        BRK
  $89A0  00        BRK
  $89A1  00        BRK
  $89A2  59 00 00  EOR $0000,Y
  $89A5  00        BRK
  $89A6  00        BRK
  $89A7  00        BRK
  $89A8  00        BRK
  $89A9  00        BRK
  $89AA  00        BRK
  $89AB  00        BRK
  $89AC  00        BRK
  $89AD  00        BRK
  $89AE  00        BRK
  $89AF  00        BRK
  $89B0  00        BRK
  $89B1  00        BRK
  $89B2  58        CLI
  $89B3  00        BRK
  $89B4  00        BRK
  $89B5  00        BRK
  $89B6  00        BRK
  $89B7  00        BRK
  $89B8  00        BRK
  $89B9  00        BRK
  $89BA  59 00 00  EOR $0000,Y
  $89BD  00        BRK
  $89BE  00        BRK
  $89BF  00        BRK
  $89C0  00        BRK
  $89C1  00        BRK
  $89C2  00        BRK
  $89C3  00        BRK
  $89C4  02        .db $02
  $89C5  00        BRK
  $89C6  00        BRK
  $89C7  00        BRK
  $89C8  00        BRK
  $89C9  00        BRK
  $89CA  00        BRK
  $89CB  00        BRK
  $89CC  02        .db $02
  $89CD  00        BRK
  $89CE  00        BRK
  $89CF  00        BRK
  $89D0  00        BRK
  $89D1  00        BRK
  $89D2  00        BRK
  $89D3  00        BRK
  $89D4  02        .db $02
  $89D5  00        BRK
  $89D6  00        BRK
  $89D7  00        BRK
  $89D8  00        BRK
  $89D9  00        BRK
  $89DA  00        BRK
  $89DB  00        BRK
  $89DC  02        .db $02
  $89DD  00        BRK
  $89DE  00        BRK
  $89DF  00        BRK
  $89E0  00        BRK
  $89E1  00        BRK
  $89E2  00        BRK
  $89E3  00        BRK
  $89E4  02        .db $02
  $89E5  00        BRK
  $89E6  00        BRK
  $89E7  00        BRK
  $89E8  00        BRK
  $89E9  00        BRK
  $89EA  00        BRK
  $89EB  00        BRK
  $89EC  02        .db $02
  $89ED  00        BRK
  $89EE  00        BRK
  $89EF  00        BRK
  $89F0  04        .db $04
  $89F1  8F        .db $8F
  $89F2  00        BRK
  $89F3  00        BRK
  $89F4  02        .db $02
  $89F5  00        BRK
  $89F6  00        BRK
  $89F7  00        BRK
  $89F8  05 06     ORA $06
  $89FA  07        .db $07
  $89FB  07        .db $07
  $89FC  02        .db $02
  $89FD  00        BRK
  $89FE  00        BRK
  $89FF  00        BRK
  $8A00  00        BRK
  $8A01  08        PHP
  $8A02  00        BRK
  $8A03  00        BRK
  $8A04  08        PHP
  $8A05  00        BRK
  $8A06  00        BRK
  $8A07  00        BRK
  $8A08  00        BRK
  $8A09  08        PHP
  $8A0A  00        BRK
  $8A0B  00        BRK
  $8A0C  08        PHP
  $8A0D  00        BRK
  $8A0E  00        BRK
  $8A0F  00        BRK
  $8A10  00        BRK
  $8A11  08        PHP

L_8A12:
  $8A12  00        BRK
  $8A13  00        BRK

L_8A14:
  $8A14  08        PHP
  $8A15  00        BRK

L_8A16:
  $8A16  00        BRK
  $8A17  00        BRK

L_8A18:
  $8A18  00        BRK
  $8A19  08        PHP

L_8A1A:
  $8A1A  00        BRK
  $8A1B  00        BRK

L_8A1C:
  $8A1C  08        PHP
  $8A1D  00        BRK

L_8A1E:
  $8A1E  00        BRK
  $8A1F  00        BRK

L_8A20:
  $8A20  00        BRK
  $8A21  08        PHP
  $8A22  00        BRK
  $8A23  00        BRK
  $8A24  08        PHP

L_8A25:
  $8A25  00        BRK
  $8A26  00        BRK
  $8A27  00        BRK
  $8A28  00        BRK
  $8A29  08        PHP

L_8A2A:
  $8A2A  00        BRK
  $8A2B  00        BRK
  $8A2C  08        PHP

L_8A2D:
  $8A2D  00        BRK
  $8A2E  00        BRK
  $8A2F  00        BRK
  $8A30  00        BRK
  $8A31  08        PHP

L_8A32:
  $8A32  00        BRK
  $8A33  00        BRK
  $8A34  08        PHP

L_8A35:
  $8A35  00        BRK
  $8A36  00        BRK

L_8A37:
  $8A37  00        BRK
  $8A38  00        BRK
  $8A39  08        PHP

L_8A3A:
  $8A3A  0A        ASL
  $8A3B  0A        ASL
  $8A3C  08        PHP

L_8A3D:
  $8A3D  00        BRK
  $8A3E  00        BRK
  $8A3F  00        BRK
  $8A40  0C        .db $0C
  $8A41  0C        .db $0C

L_8A42:
  $8A42  00        BRK
  $8A43  00        BRK
  $8A44  0C        .db $0C

L_8A45:
  $8A45  0C        .db $0C
  $8A46  08        PHP
  $8A47  08        PHP
  $8A48  37        .db $37
  $8A49  00        BRK

L_8A4A:
  $8A4A  00        BRK
  $8A4B  00        BRK
  $8A4C  00        BRK
  $8A4D  00        BRK

L_8A4E:
  $8A4E  08        PHP
  $8A4F  08        PHP

L_8A50:
  $8A50  23        .db $23
  $8A51  66 00     ROR $00
  $8A53  00        BRK
  $8A54  00        BRK
  $8A55  00        BRK
  $8A56  08        PHP
  $8A57  08        PHP
  $8A58  23        .db $23
  $8A59  65 00     ADC $00
  $8A5B  00        BRK

L_8A5C:
  $8A5C  00        BRK
  $8A5D  00        BRK
  $8A5E  08        PHP
  $8A5F  08        PHP
  $8A60  23        .db $23
  $8A61  23        .db $23

L_8A62:
  $8A62  39 00 00  AND $0000,Y

L_8A65:
  $8A65  00        BRK
  $8A66  08        PHP

L_8A67:
  $8A67  08        PHP
  $8A68  23        .db $23
  $8A69  28        PLP

L_8A6A:
  $8A6A  00        BRK
  $8A6B  00        BRK
  $8A6C  00        BRK
  $8A6D  00        BRK
  $8A6E  08        PHP

L_8A6F:
  $8A6F  08        PHP
  $8A70  23        .db $23
  $8A71  23        .db $23

L_8A72:
  $8A72  66 00     ROR $00
  $8A74  00        BRK
  $8A75  00        BRK
  $8A76  08        PHP

L_8A77:
  $8A77  08        PHP
  $8A78  0F        .db $0F
  $8A79  0F        .db $0F

L_8A7A:
  $8A7A  10 0E     BPL $8A8A
  $8A7C  0E 0E 08  ASL $080E
  $8A7F  08        PHP

L_8A80:
  $8A80  90 90     BCC $8A12
  $8A82  90 90     BCC $8A14
  $8A84  90 90     BCC $8A16
  $8A86  90 90     BCC $8A18

L_8A88:
  $8A88  90 90     BCC $8A1A

L_8A8A:
  $8A8A  90 90     BCC $8A1C
  $8A8C  90 90     BCC $8A1E
  $8A8E  90 90     BCC $8A20

L_8A90:
  $8A90  91 91     STA ($91),Y
  $8A92  92        .db $92
  $8A93  90 90     BCC $8A25
  $8A95  96 9E     STX $9E,Y
  $8A97  90 91     BCC $8A2A
  $8A99  91 92     STA ($92),Y
  $8A9B  90 90     BCC $8A2D
  $8A9D  97        .db $97
  $8A9E  9F        .db $9F
  $8A9F  90 91     BCC $8A32
  $8AA1  91 92     STA ($92),Y
  $8AA3  90 90     BCC $8A35
  $8AA5  90 90     BCC $8A37
  $8AA7  90 91     BCC $8A3A
  $8AA9  91 92     STA ($92),Y
  $8AAB  90 90     BCC $8A3D
  $8AAD  96 9E     STX $9E,Y
  $8AAF  90 91     BCC $8A42
  $8AB1  91 92     STA ($92),Y
  $8AB3  90 90     BCC $8A45
  $8AB5  97        .db $97
  $8AB6  9F        .db $9F
  $8AB7  90 91     BCC $8A4A
  $8AB9  91 91     STA ($91),Y
  $8ABB  93        .db $93
  $8ABC  90 90     BCC $8A4E
  $8ABE  90 90     BCC $8A50
  $8AC0  91 91     STA ($91),Y
  $8AC2  91 92     STA ($92),Y
  $8AC4  90 96     BCC $8A5C
  $8AC6  9E        .db $9E
  $8AC7  90 91     BCC $8A5A
  $8AC9  91 91     STA ($91),Y
  $8ACB  92        .db $92
  $8ACC  90 97     BCC $8A65
  $8ACE  9F        .db $9F
  $8ACF  90 91     BCC $8A62
  $8AD1  91 91     STA ($91),Y
  $8AD3  91 93     STA ($93),Y
  $8AD5  90 90     BCC $8A67
  $8AD7  90 91     BCC $8A6A
  $8AD9  91 91     STA ($91),Y
  $8ADB  91 93     STA ($93),Y
  $8ADD  90 90     BCC $8A6F
  $8ADF  90 91     BCC $8A72
  $8AE1  91 91     STA ($91),Y
  $8AE3  91 92     STA ($92),Y
  $8AE5  90 90     BCC $8A77
  $8AE7  90 91     BCC $8A7A
  $8AE9  91 91     STA ($91),Y
  $8AEB  91 91     STA ($91),Y
  $8AED  93        .db $93
  $8AEE  90 90     BCC $8A80
  $8AF0  91 91     STA ($91),Y
  $8AF2  91 91     STA ($91),Y
  $8AF4  91 93     STA ($93),Y
  $8AF6  90 90     BCC $8A88
  $8AF8  91 91     STA ($91),Y
  $8AFA  91 91     STA ($91),Y
  $8AFC  91 92     STA ($92),Y
  $8AFE  90 90     BCC $8A90
  $8B00  91 91     STA ($91),Y
  $8B02  91 91     STA ($91),Y
  $8B04  91 92     STA ($92),Y
  $8B06  90 90     BCC $8A98
  $8B08  91 91     STA ($91),Y
  $8B0A  91 91     STA ($91),Y
  $8B0C  91 91     STA ($91),Y
  $8B0E  93        .db $93
  $8B0F  90 91     BCC $8AA2
  $8B11  91 91     STA ($91),Y
  $8B13  91 91     STA ($91),Y
  $8B15  91 93     STA ($93),Y
  $8B17  90 91     BCC $8AAA
  $8B19  91 91     STA ($91),Y
  $8B1B  91 91     STA ($91),Y
  $8B1D  91 94     STA ($94),Y
  $8B1F  95 91     STA $91,X
  $8B21  91 91     STA ($91),Y
  $8B23  91 91     STA ($91),Y
  $8B25  91 94     STA ($94),Y
  $8B27  95 91     STA $91,X
  $8B29  91 91     STA ($91),Y
  $8B2B  91 91     STA ($91),Y
  $8B2D  91 94     STA ($94),Y
  $8B2F  95 91     STA $91,X
  $8B31  91 91     STA ($91),Y
  $8B33  91 91     STA ($91),Y
  $8B35  91 94     STA ($94),Y
  $8B37  95 98     STA $98,X
  $8B39  98        TYA
  $8B3A  98        TYA
  $8B3B  98        TYA
  $8B3C  9A        TXS
  $8B3D  91 94     STA ($94),Y
  $8B3F  95 99     STA $99,X
  $8B41  99 99 99  STA $9999,Y
  $8B44  9B        .db $9B
  $8B45  91 94     STA ($94),Y
  $8B47  95 99     STA $99,X
  $8B49  A5 AD     LDA $AD
  $8B4B  99 9B 91  STA $919B,Y
  $8B4E  94 95     STY $95,X
  $8B50  99 A6 AE  STA $AEA6,Y
  $8B53  99 9B 91  STA $919B,Y
  $8B56  94 95     STY $95,X
  $8B58  99 A7 AF  STA $AFA7,Y
  $8B5B  99 9B 91  STA $919B,Y
  $8B5E  94 95     STY $95,X
  $8B60  99 A5 AD  STA $ADA5,Y
  $8B63  99 9B 91  STA $919B,Y
  $8B66  94 95     STY $95,X
  $8B68  99 A6 AE  STA $AEA6,Y
  $8B6B  99 9B 91  STA $919B,Y
  $8B6E  94 95     STY $95,X
  $8B70  99 A7 AF  STA $AFA7,Y
  $8B73  99 9B 91  STA $919B,Y
  $8B76  94 95     STY $95,X
  $8B78  99 A5 AD  STA $ADA5,Y
  $8B7B  99 9B 91  STA $919B,Y
  $8B7E  94 95     STY $95,X
  $8B80  99 A6 AE  STA $AEA6,Y
  $8B83  9B        .db $9B
  $8B84  91 91     STA ($91),Y
  $8B86  94 95     STY $95,X
  $8B88  99 A7 AF  STA $AFA7,Y
  $8B8B  9B        .db $9B
  $8B8C  91 91     STA ($91),Y
  $8B8E  94 95     STY $95,X
  $8B90  99 A5 AD  STA $ADA5,Y
  $8B93  9B        .db $9B

L_8B94:
  $8B94  91 91     STA ($91),Y

L_8B96:
  $8B96  94 95     STY $95,X

L_8B98:
  $8B98  99 A6 AE  STA $AEA6,Y
  $8B9B  9B        .db $9B
  $8B9C  91 91     STA ($91),Y
  $8B9E  94 95     STY $95,X
  $8BA0  99 A7 AF  STA $AFA7,Y
  $8BA3  9B        .db $9B
  $8BA4  91 91     STA ($91),Y
  $8BA6  94 95     STY $95,X
  $8BA8  99 99 99  STA $9999,Y
  $8BAB  9B        .db $9B
  $8BAC  91 91     STA ($91),Y
  $8BAE  94 95     STY $95,X
  $8BB0  99 99 99  STA $9999,Y
  $8BB3  9B        .db $9B
  $8BB4  91 91     STA ($91),Y
  $8BB6  94 95     STY $95,X
  $8BB8  9C        .db $9C

L_8BB9:
  $8BB9  9C        .db $9C
  $8BBA  9D A4 91  STA $91A4,X
  $8BBD  91 94     STA ($94),Y
  $8BBF  95 91     STA $91,X
  $8BC1  91 93     STA ($93),Y
  $8BC3  9B        .db $9B
  $8BC4  91 91     STA ($91),Y
  $8BC6  94 95     STY $95,X
  $8BC8  91 91     STA ($91),Y

L_8BCA:
  $8BCA  93        .db $93
  $8BCB  9B        .db $9B

L_8BCC:
  $8BCC  91 91     STA ($91),Y

L_8BCE:
  $8BCE  94 95     STY $95,X

L_8BD0:
  $8BD0  91 93     STA ($93),Y
  $8BD2  90 9B     BCC $8B6F
  $8BD4  91 91     STA ($91),Y
  $8BD6  94 95     STY $95,X
  $8BD8  91 A1     STA ($A1),Y
  $8BDA  A8        TAY
  $8BDB  AB        .db $AB
  $8BDC  91 91     STA ($91),Y
  $8BDE  94 95     STY $95,X
  $8BE0  91 A1     STA ($A1),Y
  $8BE2  A2 AA     LDX #$AA
  $8BE4  91 91     STA ($91),Y
  $8BE6  94 95     STY $95,X
  $8BE8  91 A1     STA ($A1),Y
  $8BEA  A9 A3     LDA #$A3
  $8BEC  A3        .db $A3
  $8BED  A3        .db $A3
  $8BEE  A3        .db $A3
  $8BEF  A3        .db $A3
  $8BF0  91 A3     STA ($A3),Y
  $8BF2  A3        .db $A3
  $8BF3  A3        .db $A3
  $8BF4  A3        .db $A3
  $8BF5  A3        .db $A3
  $8BF6  A3        .db $A3
  $8BF7  A3        .db $A3
  $8BF8  A0 A0     LDY #$A0
  $8BFA  A0 A0     LDY #$A0
  $8BFC  A0 A0     LDY #$A0
  $8BFE  A0 A0     LDY #$A0

L_8C00:
  $8C00  90 90     BCC $8B92
  $8C02  90 90     BCC $8B94
  $8C04  90 90     BCC $8B96
  $8C06  90 90     BCC $8B98
  $8C08  A1 91     LDA ($91,X)
  $8C0A  B2        .db $B2
  $8C0B  B0 AC     BCS $8BB9
  $8C0D  AA        TAX
  $8C0E  B5 B7     LDA $B7,X
  $8C10  A1 91     LDA ($91,X)

L_8C12:
  $8C12  A2 AA     LDX #$AA

L_8C14:
  $8C14  A2 AA     LDX #$AA
  $8C16  A2 AA     LDX #$AA
  $8C18  A1 91     LDA ($91,X)
  $8C1A  A2 AA     LDX #$AA
  $8C1C  A2 AA     LDX #$AA
  $8C1E  A2 AA     LDX #$AA
  $8C20  A1 91     LDA ($91,X)
  $8C22  A2 AA     LDX #$AA
  $8C24  A2 AA     LDX #$AA
  $8C26  A2 AA     LDX #$AA
  $8C28  B1 B0     LDA ($B0),Y
  $8C2A  AC AA B3  LDY $B3AA
  $8C2D  B4 B6     LDY $B6,X
  $8C2F  AA        TAX
  $8C30  A3        .db $A3
  $8C31  A3        .db $A3
  $8C32  A3        .db $A3
  $8C33  A3        .db $A3
  $8C34  A3        .db $A3
  $8C35  A3        .db $A3
  $8C36  A3        .db $A3
  $8C37  A3        .db $A3
  $8C38  90 90     BCC $8BCA
  $8C3A  90 90     BCC $8BCC
  $8C3C  90 90     BCC $8BCE
  $8C3E  90 90     BCC $8BD0
  $8C40  A0 A0     LDY #$A0
  $8C42  A0 A0     LDY #$A0
  $8C44  A0 A0     LDY #$A0

L_8C46:
  $8C46  A0 A0     LDY #$A0
  $8C48  B7        .db $B7
  $8C49  B7        .db $B7

L_8C4A:
  $8C4A  B7        .db $B7
  $8C4B  B7        .db $B7

L_8C4C:
  $8C4C  BA        TSX
  $8C4D  BC BE BA  LDY $BABE,X
  $8C50  91 B2     STA ($B2),Y
  $8C52  B0 AC     BCS $8C00
  $8C54  AA        TAX
  $8C55  A1 A2     LDA ($A2,X)
  $8C57  AA        TAX
  $8C58  91 A2     STA ($A2),Y
  $8C5A  AA        TAX
  $8C5B  A2 AA     LDX #$AA
  $8C5D  A1 A2     LDA ($A2,X)
  $8C5F  AA        TAX
  $8C60  91 A2     STA ($A2),Y
  $8C62  AA        TAX
  $8C63  A2 AA     LDX #$AA
  $8C65  A1 A2     LDA ($A2,X)
  $8C67  AA        TAX
  $8C68  91 A2     STA ($A2),Y
  $8C6A  AA        TAX
  $8C6B  B9 BB BD  LDA $BDBB,Y
  $8C6E  BF        .db $BF
  $8C6F  AA        TAX
  $8C70  B8        CLV
  $8C71  AC AA B3  LDY $B3AA
  $8C74  B4 B4     LDY $B4,X
  $8C76  B4 B4     LDY $B4,X
  $8C78  A0 A0     LDY #$A0
  $8C7A  A0 A0     LDY #$A0
  $8C7C  A0 A0     LDY #$A0

L_8C7E:
  $8C7E  A0 A0     LDY #$A0
  $8C80  90 90     BCC $8C12
  $8C82  90 90     BCC $8C14
  $8C84  90 C0     BCC $8C46
  $8C86  94 95     STY $95,X
  $8C88  91 91     STA ($91),Y
  $8C8A  91 91     STA ($91),Y
  $8C8C  91 91     STA ($91),Y
  $8C8E  94 95     STY $95,X
  $8C90  91 91     STA ($91),Y

L_8C92:
  $8C92  91 91     STA ($91),Y

L_8C94:
  $8C94  91 91     STA ($91),Y

L_8C96:
  $8C96  C1 C1     CMP ($C1,X)

L_8C98:
  $8C98  91 91     STA ($91),Y

L_8C9A:
  $8C9A  91 91     STA ($91),Y

L_8C9C:
  $8C9C  91 91     STA ($91),Y

L_8C9E:
  $8C9E  C2        .db $C2
  $8C9F  C2        .db $C2

L_8CA0:
  $8CA0  91 91     STA ($91),Y
  $8CA2  91 91     STA ($91),Y
  $8CA4  91 91     STA ($91),Y
  $8CA6  94 95     STY $95,X

L_8CA8:
  $8CA8  91 91     STA ($91),Y
  $8CAA  91 91     STA ($91),Y
  $8CAC  91 91     STA ($91),Y
  $8CAE  94 95     STY $95,X

L_8CB0:
  $8CB0  91 91     STA ($91),Y

L_8CB2:
  $8CB2  91 C5     STA ($C5),Y
  $8CB4  C6 91     DEC $91
  $8CB6  94 95     STY $95,X

L_8CB8:
  $8CB8  90 90     BCC $8C4A

L_8CBA:
  $8CBA  90 90     BCC $8C4C
  $8CBC  90 C0     BCC $8C7E
  $8CBE  94 95     STY $95,X
  $8CC0  D0 D0     BNE $8C92
  $8CC2  D0 D0     BNE $8C94
  $8CC4  D0 D0     BNE $8C96
  $8CC6  D0 D0     BNE $8C98
  $8CC8  D0 D0     BNE $8C9A
  $8CCA  D0 D0     BNE $8C9C
  $8CCC  D0 D0     BNE $8C9E
  $8CCE  D0 D0     BNE $8CA0
  $8CD0  D1 D1     CMP ($D1),Y
  $8CD2  D1 D1     CMP ($D1),Y
  $8CD4  D1 D3     CMP ($D3),Y
  $8CD6  D0 D0     BNE $8CA8
  $8CD8  D2        .db $D2
  $8CD9  D2        .db $D2

L_8CDA:
  $8CDA  D2        .db $D2
  $8CDB  D5 00     CMP $00,X
  $8CDD  D4        .db $D4
  $8CDE  D0 D0     BNE $8CB0

L_8CE0:
  $8CE0  D0 D0     BNE $8CB2

L_8CE2:
  $8CE2  D0 D6     BNE $8CBA
  $8CE4  00        BRK
  $8CE5  D4        .db $D4
  $8CE6  D0 D0     BNE $8CB8

L_8CE8:
  $8CE8  F7        .db $F7
  $8CE9  F7        .db $F7

L_8CEA:
  $8CEA  F7        .db $F7
  $8CEB  F8        SED
  $8CEC  00        BRK
  $8CED  F6 F7     INC $F7,X
  $8CEF  F7        .db $F7
  $8CF0  F7        .db $F7
  $8CF1  F7        .db $F7
  $8CF2  F7        .db $F7
  $8CF3  F8        SED
  $8CF4  00        BRK
  $8CF5  F6 F7     INC $F7,X
  $8CF7  F7        .db $F7
  $8CF8  F7        .db $F7
  $8CF9  F7        .db $F7
  $8CFA  F7        .db $F7
  $8CFB  F8        SED
  $8CFC  00        BRK
  $8CFD  F6 F7     INC $F7,X
  $8CFF  F7        .db $F7
  $8D00  F7        .db $F7
  $8D01  F7        .db $F7
  $8D02  F7        .db $F7
  $8D03  F8        SED
  $8D04  00        BRK
  $8D05  F6 F7     INC $F7,X
  $8D07  F7        .db $F7
  $8D08  D0 D0     BNE $8CDA

L_8D0A:
  $8D0A  D0 D6     BNE $8CE2
  $8D0C  00        BRK
  $8D0D  D4        .db $D4
  $8D0E  D0 D0     BNE $8CE0

L_8D10:
  $8D10  D0 D0     BNE $8CE2

L_8D12:
  $8D12  D0 D6     BNE $8CEA
  $8D14  00        BRK
  $8D15  D4        .db $D4
  $8D16  D0 D0     BNE $8CE8

L_8D18:
  $8D18  F7        .db $F7
  $8D19  F7        .db $F7

L_8D1A:
  $8D1A  F7        .db $F7
  $8D1B  F8        SED
  $8D1C  00        BRK
  $8D1D  F6 F7     INC $F7,X
  $8D1F  F7        .db $F7
  $8D20  F7        .db $F7
  $8D21  F7        .db $F7
  $8D22  F7        .db $F7
  $8D23  F8        SED
  $8D24  00        BRK
  $8D25  F6 F7     INC $F7,X
  $8D27  F7        .db $F7
  $8D28  F7        .db $F7
  $8D29  F7        .db $F7
  $8D2A  F7        .db $F7
  $8D2B  F8        SED
  $8D2C  00        BRK
  $8D2D  F6 F7     INC $F7,X
  $8D2F  F7        .db $F7
  $8D30  F7        .db $F7
  $8D31  F7        .db $F7
  $8D32  F7        .db $F7
  $8D33  F8        SED
  $8D34  00        BRK
  $8D35  F6 F7     INC $F7,X
  $8D37  F7        .db $F7
  $8D38  D0 D0     BNE $8D0A

L_8D3A:
  $8D3A  D0 D6     BNE $8D12
  $8D3C  00        BRK
  $8D3D  D4        .db $D4
  $8D3E  D0 D0     BNE $8D10

L_8D40:
  $8D40  D0 D0     BNE $8D12

L_8D42:
  $8D42  D0 D6     BNE $8D1A
  $8D44  00        BRK
  $8D45  D4        .db $D4
  $8D46  D0 D0     BNE $8D18

L_8D48:
  $8D48  F7        .db $F7
  $8D49  F7        .db $F7

L_8D4A:
  $8D4A  F7        .db $F7
  $8D4B  F8        SED
  $8D4C  00        BRK
  $8D4D  F6 F7     INC $F7,X
  $8D4F  F7        .db $F7
  $8D50  F7        .db $F7
  $8D51  F7        .db $F7
  $8D52  F7        .db $F7
  $8D53  F8        SED
  $8D54  00        BRK
  $8D55  F6 F7     INC $F7,X
  $8D57  F7        .db $F7
  $8D58  F7        .db $F7
  $8D59  F7        .db $F7
  $8D5A  F7        .db $F7
  $8D5B  F8        SED
  $8D5C  00        BRK
  $8D5D  F6 F7     INC $F7,X
  $8D5F  F7        .db $F7
  $8D60  F7        .db $F7
  $8D61  F7        .db $F7
  $8D62  F7        .db $F7
  $8D63  F8        SED
  $8D64  00        BRK
  $8D65  F6 F7     INC $F7,X
  $8D67  F7        .db $F7
  $8D68  D0 D0     BNE $8D3A
  $8D6A  D0 D6     BNE $8D42
  $8D6C  00        BRK
  $8D6D  D4        .db $D4
  $8D6E  D0 D0     BNE $8D40
  $8D70  D0 D0     BNE $8D42
  $8D72  D0 D6     BNE $8D4A
  $8D74  00        BRK
  $8D75  D4        .db $D4
  $8D76  D0 D0     BNE $8D48
  $8D78  F7        .db $F7
  $8D79  F7        .db $F7
  $8D7A  F7        .db $F7
  $8D7B  F8        SED
  $8D7C  00        BRK

L_8D7D:
  $8D7D  F6 F7     INC $F7,X

L_8D7F:
  $8D7F  F7        .db $F7
  $8D80  F7        .db $F7
  $8D81  F7        .db $F7
  $8D82  F7        .db $F7
  $8D83  F8        SED
  $8D84  00        BRK
  $8D85  F6 F7     INC $F7,X
  $8D87  F7        .db $F7
  $8D88  F7        .db $F7
  $8D89  F7        .db $F7
  $8D8A  C9 EB     CMP #$EB
  $8D8C  00        BRK
  $8D8D  CD F7 F7  CMP $F7F7
  $8D90  F7        .db $F7
  $8D91  F7        .db $F7

L_8D92:
  $8D92  CA        DEX
  $8D93  D5 00     CMP $00,X
  $8D95  C7        .db $C7
  $8D96  CE F7 D1  DEC $D1F7
  $8D99  D1 D1     CMP ($D1),Y

L_8D9B:
  $8D9B  D7        .db $D7
  $8D9C  00        BRK
  $8D9D  00        BRK
  $8D9E  D4        .db $D4
  $8D9F  D0 00     BNE $8DA1

L_8DA1:
  $8DA1  00        BRK
  $8DA2  CB        .db $CB
  $8DA3  CC CC CC  CPY $CCCC
  $8DA6  CF        .db $CF
  $8DA7  D0 00     BNE $8DA9

L_8DA9:
  $8DA9  00        BRK
  $8DAA  D4        .db $D4
  $8DAB  D0 D0     BNE $8D7D
  $8DAD  D0 D0     BNE $8D7F
  $8DAF  D0 00     BNE $8DB1

L_8DB1:
  $8DB1  00        BRK
  $8DB2  D4        .db $D4
  $8DB3  D0 DD     BNE $8D92
  $8DB5  E5 ED     SBC $ED
  $8DB7  D0 00     BNE $8DB9

L_8DB9:
  $8DB9  00        BRK
  $8DBA  D4        .db $D4
  $8DBB  D0 DE     BNE $8D9B
  $8DBD  E6 EE     INC $EE
  $8DBF  D0 00     BNE $8DC1

L_8DC1:
  $8DC1  00        BRK

L_8DC2:
  $8DC2  D4        .db $D4
  $8DC3  D0 DF     BNE $8DA4
  $8DC5  E7        .db $E7
  $8DC6  EF        .db $EF
  $8DC7  D0 00     BNE $8DC9

L_8DC9:
  $8DC9  00        BRK
  $8DCA  D4        .db $D4

L_8DCB:
  $8DCB  DD E5 ED  CMP $EDE5,X
  $8DCE  D0 D0     BNE $8DA0

L_8DD0:
  $8DD0  00        BRK
  $8DD1  00        BRK
  $8DD2  D4        .db $D4
  $8DD3  DE E6 EE  DEC $EEE6,X
  $8DD6  D0 D0     BNE $8DA8

L_8DD8:
  $8DD8  00        BRK
  $8DD9  00        BRK
  $8DDA  D4        .db $D4
  $8DDB  DF        .db $DF
  $8DDC  E7        .db $E7
  $8DDD  EF        .db $EF
  $8DDE  D0 D0     BNE $8DB0

L_8DE0:
  $8DE0  00        BRK
  $8DE1  00        BRK
  $8DE2  D4        .db $D4
  $8DE3  D0 DD     BNE $8DC2

L_8DE5:
  $8DE5  E5 ED     SBC $ED

L_8DE7:
  $8DE7  D0 00     BNE $8DE9

L_8DE9:
  $8DE9  00        BRK
  $8DEA  D4        .db $D4
  $8DEB  D0 DE     BNE $8DCB

L_8DED:
  $8DED  E6 EE     INC $EE
  $8DEF  D0 00     BNE $8DF1

L_8DF1:
  $8DF1  00        BRK
  $8DF2  D4        .db $D4
  $8DF3  D0 DF     BNE $8DD4
  $8DF5  E7        .db $E7
  $8DF6  EF        .db $EF
  $8DF7  D0 00     BNE $8DF9

L_8DF9:
  $8DF9  00        BRK
  $8DFA  D4        .db $D4
  $8DFB  DD E5 ED  CMP $EDE5,X
  $8DFE  D0 D0     BNE $8DD0
  $8E00  00        BRK
  $8E01  00        BRK
  $8E02  D4        .db $D4
  $8E03  DE E6 EE  DEC $EEE6,X
  $8E06  D0 D0     BNE $8DD8
  $8E08  00        BRK

L_8E09:
  $8E09  00        BRK

L_8E0A:
  $8E0A  D4        .db $D4
  $8E0B  DF        .db $DF

L_8E0C:
  $8E0C  E7        .db $E7
  $8E0D  EF        .db $EF

L_8E0E:
  $8E0E  D0 D0     BNE $8DE0

L_8E10:
  $8E10  00        BRK

L_8E11:
  $8E11  00        BRK
  $8E12  D4        .db $D4
  $8E13  D0 D0     BNE $8DE5
  $8E15  D0 D0     BNE $8DE7
  $8E17  D8        CLD
  $8E18  00        BRK

L_8E19:
  $8E19  00        BRK
  $8E1A  D4        .db $D4
  $8E1B  D0 D0     BNE $8DED
  $8E1D  D6 00     DEC $00,X
  $8E1F  00        BRK
  $8E20  00        BRK
  $8E21  00        BRK
  $8E22  D9 DA DA  CMP $DADA,Y
  $8E25  DB        .db $DB
  $8E26  00        BRK
  $8E27  00        BRK
  $8E28  A0 A0     LDY #$A0
  $8E2A  A0 A0     LDY #$A0
  $8E2C  A0 DC     LDY #$DC
  $8E2E  00        BRK
  $8E2F  00        BRK
  $8E30  A0 A0     LDY #$A0
  $8E32  A0 A0     LDY #$A0
  $8E34  A0 A0     LDY #$A0
  $8E36  E4 EC     CPX $EC
  $8E38  A0 A0     LDY #$A0
  $8E3A  A0 A0     LDY #$A0
  $8E3C  A0 A0     LDY #$A0
  $8E3E  A0 A0     LDY #$A0
  $8E40  99 99 99  STA $9999,Y
  $8E43  99 90 90  STA $9090,Y
  $8E46  90 90     BCC $8DD8
  $8E48  99 99 E1  STA $E199,Y
  $8E4B  E9 00     SBC #$00
  $8E4D  00        BRK
  $8E4E  F0 A1     BEQ $8DF1
  $8E50  E0 E8     CPX #$E8
  $8E52  00        BRK
  $8E53  00        BRK
  $8E54  00        BRK
  $8E55  00        BRK
  $8E56  00        BRK
  $8E57  00        BRK
  $8E58  00        BRK
  $8E59  00        BRK
  $8E5A  00        BRK
  $8E5B  00        BRK
  $8E5C  00        BRK
  $8E5D  00        BRK
  $8E5E  E2        .db $E2
  $8E5F  00        BRK
  $8E60  00        BRK
  $8E61  E3        .db $E3
  $8E62  00        BRK
  $8E63  00        BRK
  $8E64  00        BRK
  $8E65  00        BRK
  $8E66  F0 A1     BEQ $8E09
  $8E68  00        BRK
  $8E69  00        BRK
  $8E6A  00        BRK
  $8E6B  00        BRK
  $8E6C  00        BRK
  $8E6D  E2        .db $E2
  $8E6E  F0 A1     BEQ $8E11
  $8E70  00        BRK
  $8E71  00        BRK
  $8E72  00        BRK
  $8E73  00        BRK
  $8E74  00        BRK
  $8E75  00        BRK
  $8E76  F0 A1     BEQ $8E19
  $8E78  90 90     BCC $8E0A
  $8E7A  90 90     BCC $8E0C
  $8E7C  90 90     BCC $8E0E
  $8E7E  90 90     BCC $8E10
  $8E80  A0 A0     LDY #$A0
  $8E82  A0 A0     LDY #$A0
  $8E84  A0 A0     LDY #$A0
  $8E86  A0 A0     LDY #$A0
  $8E88  00        BRK
  $8E89  00        BRK
  $8E8A  00        BRK
  $8E8B  00        BRK
  $8E8C  00        BRK
  $8E8D  00        BRK
  $8E8E  F3        .db $F3
  $8E8F  95 00     STA $00,X
  $8E91  00        BRK
  $8E92  00        BRK
  $8E93  E2        .db $E2
  $8E94  00        BRK
  $8E95  00        BRK
  $8E96  F3        .db $F3
  $8E97  95 00     STA $00,X
  $8E99  00        BRK
  $8E9A  00        BRK
  $8E9B  00        BRK
  $8E9C  00        BRK
  $8E9D  00        BRK
  $8E9E  F1 F1     SBC ($F1),Y
  $8EA0  00        BRK
  $8EA1  00        BRK
  $8EA2  00        BRK
  $8EA3  00        BRK
  $8EA4  00        BRK
  $8EA5  00        BRK
  $8EA6  F2        .db $F2
  $8EA7  F2        .db $F2
  $8EA8  00        BRK
  $8EA9  00        BRK
  $8EAA  00        BRK
  $8EAB  00        BRK
  $8EAC  00        BRK
  $8EAD  00        BRK
  $8EAE  F3        .db $F3
  $8EAF  95 00     STA $00,X
  $8EB1  00        BRK
  $8EB2  EA        NOP
  $8EB3  00        BRK
  $8EB4  00        BRK
  $8EB5  00        BRK
  $8EB6  F3        .db $F3
  $8EB7  95 A0     STA $A0,X
  $8EB9  A0 A0     LDY #$A0
  $8EBB  A0 A0     LDY #$A0
  $8EBD  A0 A0     LDY #$A0
  $8EBF  A0 F9     LDY #$F9
  $8EC1  00        BRK
  $8EC2  00        BRK
  $8EC3  00        BRK
  $8EC4  00        BRK
  $8EC5  00        BRK
  $8EC6  00        BRK
  $8EC7  00        BRK
  $8EC8  F9 FC FA  SBC $FAFC,Y
  $8ECB  FA        .db $FA
  $8ECC  FA        .db $FA
  $8ECD  FA        .db $FA
  $8ECE  F9 00 F9  SBC $F900,Y
  $8ED1  F9 00 00  SBC $0000,Y
  $8ED4  00        BRK
  $8ED5  00        BRK
  $8ED6  F9 00 FA  SBC $FA00,Y
  $8ED9  FE 00 00  INC $0000,X
  $8EDC  00        BRK
  $8EDD  00        BRK
  $8EDE  F9 00 FB  SBC $FB00,Y
  $8EE1  FF        .db $FF
  $8EE2  00        BRK
  $8EE3  00        BRK
  $8EE4  00        BRK
  $8EE5  00        BRK
  $8EE6  F9 00 F9  SBC $F900,Y
  $8EE9  F9 00 00  SBC $0000,Y
  $8EEC  00        BRK
  $8EED  00        BRK
  $8EEE  F9 00 F9  SBC $F900,Y
  $8EF1  FD FB FB  SBC $FBFB,X
  $8EF4  FB        .db $FB
  $8EF5  FB        .db $FB
  $8EF6  F9 00 F9  SBC $F900,Y
  $8EF9  00        BRK
  $8EFA  00        BRK
  $8EFB  00        BRK
  $8EFC  00        BRK
  $8EFD  00        BRK
  $8EFE  00        BRK
  $8EFF  00        BRK
  $8F00  F9 00 00  SBC $0000,Y
  $8F03  00        BRK
  $8F04  00        BRK
  $8F05  00        BRK
  $8F06  00        BRK
  $8F07  00        BRK
  $8F08  F9 FC FA  SBC $FAFC,Y
  $8F0B  FA        .db $FA
  $8F0C  FA        .db $FA
  $8F0D  FA        .db $FA
  $8F0E  F9 00 F9  SBC $F900,Y
  $8F11  F9 00 00  SBC $0000,Y
  $8F14  00        BRK
  $8F15  00        BRK
  $8F16  F9 00 FA  SBC $FA00,Y
  $8F19  FE 00 00  INC $0000,X
  $8F1C  00        BRK
  $8F1D  00        BRK
  $8F1E  F9 00 FB  SBC $FB00,Y
  $8F21  FF        .db $FF
  $8F22  00        BRK
  $8F23  00        BRK
  $8F24  00        BRK
  $8F25  00        BRK
  $8F26  F9 00 F9  SBC $F900,Y
  $8F29  F9 00 00  SBC $0000,Y
  $8F2C  00        BRK
  $8F2D  00        BRK
  $8F2E  F9 00 F9  SBC $F900,Y
  $8F31  FD FB FB  SBC $FBFB,X
  $8F34  FB        .db $FB
  $8F35  FB        .db $FB
  $8F36  F9 00 F9  SBC $F900,Y
  $8F39  00        BRK
  $8F3A  00        BRK
  $8F3B  00        BRK
  $8F3C  00        BRK
  $8F3D  00        BRK
  $8F3E  00        BRK
  $8F3F  00        BRK
  $8F40  F9 00 00  SBC $0000,Y
  $8F43  00        BRK
  $8F44  00        BRK
  $8F45  00        BRK
  $8F46  00        BRK
  $8F47  00        BRK
  $8F48  F9 FC FA  SBC $FAFC,Y
  $8F4B  FA        .db $FA
  $8F4C  FA        .db $FA
  $8F4D  FA        .db $FA
  $8F4E  F9 00 F9  SBC $F900,Y
  $8F51  F9 00 00  SBC $0000,Y
  $8F54  00        BRK
  $8F55  00        BRK
  $8F56  F9 00 FA  SBC $FA00,Y
  $8F59  FE 00 00  INC $0000,X
  $8F5C  00        BRK
  $8F5D  00        BRK
  $8F5E  F9 00 FB  SBC $FB00,Y
  $8F61  FF        .db $FF
  $8F62  00        BRK
  $8F63  00        BRK
  $8F64  00        BRK
  $8F65  00        BRK
  $8F66  F9 00 F9  SBC $F900,Y
  $8F69  F9 00 00  SBC $0000,Y
  $8F6C  00        BRK
  $8F6D  00        BRK
  $8F6E  F9 00 F9  SBC $F900,Y
  $8F71  FD FB FB  SBC $FBFB,X
  $8F74  FB        .db $FB
  $8F75  FB        .db $FB
  $8F76  F9 00 F9  SBC $F900,Y
  $8F79  00        BRK
  $8F7A  00        BRK
  $8F7B  00        BRK
  $8F7C  00        BRK
  $8F7D  00        BRK
  $8F7E  00        BRK
  $8F7F  00        BRK
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

L_8FA5:
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
  $9004  01 02     ORA ($02,X)
  $9006  05 04     ORA $04
  $9008  00        BRK
  $9009  00        BRK
  $900A  00        BRK
  $900B  00        BRK
  $900C  00        BRK
  $900D  01 03     ORA ($03,X)
  $900F  03        .db $03
  $9010  00        BRK
  $9011  00        BRK
  $9012  00        BRK
  $9013  70 90     BVS $8FA5
  $9015  9C        .db $9C
  $9016  24 02     BIT $02
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  00        BRK
  $901C  60        RTS
  $901D  E0 D8     CPX #$D8
  $901F  FC        .db $FC
  $9020  08        PHP
  $9021  0B        .db $0B
  $9022  07        .db $07
  $9023  0F        .db $0F
  $9024  17        .db $17
  $9025  17        .db $17
  $9026  17        .db $17
  $9027  1C        .db $1C
  $9028  07        .db $07
  $9029  04        .db $04
  $902A  03        .db $03
  $902B  07        .db $07
  $902C  02        .db $02
  $902D  02        .db $02
  $902E  00        BRK
  $902F  00        BRK
  $9030  F6 F9     INC $F9,X
  $9032  FD 9F 0E  SBC $0E9F,X
  $9035  81 86     STA ($86,X)
  $9037  02        .db $02
  $9038  08        PHP
  $9039  F6 9A     INC $9A,X
  $903B  18        CLC
  $903C  00        BRK
  $903D  1E 3F 3F  ASL $3F3F,X
  $9040  00        BRK
  $9041  00        BRK
  $9042  00        BRK
  $9043  00        BRK
  $9044  01 01     ORA ($01,X)
  $9046  82        .db $82
  $9047  82        .db $82
  $9048  00        BRK
  $9049  00        BRK
  $904A  00        BRK
  $904B  00        BRK
  $904C  00        BRK
  $904D  00        BRK
  $904E  01 01     ORA ($01,X)
  $9050  00        BRK
  $9051  00        BRK
  $9052  78        SEI
  $9053  84 1E     STY $1E
  $9055  3E 7F 7F  ROL $7F7F,X
  $9058  00        BRK
  $9059  00        BRK
  $905A  00        BRK
  $905B  78        SEI
  $905C  FC        .db $FC
  $905D  FC        .db $FC
  $905E  FE F8 28  INC $28F8,X
  $9061  2B        .db $2B
  $9062  1C        .db $1C
  $9063  00        BRK
  $9064  00        BRK
  $9065  00        BRK
  $9066  00        BRK
  $9067  00        BRK
  $9068  10 10     BPL $907A
  $906A  00        BRK
  $906B  00        BRK
  $906C  00        BRK
  $906D  00        BRK
  $906E  00        BRK
  $906F  00        BRK
  $9070  80        .db $80
  $9071  F1 FE     SBC ($FE),Y
  $9073  F0 79     BEQ $90EE
  $9075  7E 3E 3F  ROR $3F3E,X
  $9078  7F        .db $7F
  $9079  2E 60 60  ROL $6060
  $907C  30 31     BMI $90AF
  $907E  19 1E 82  ORA $821E,Y
  $9081  02        .db $02
  $9082  7E 83 3C  ROR $3C83,X
  $9085  70 43     BVS $90CA
  $9087  06 01     ASL $01
  $9089  01 01     ORA ($01,X)
  $908B  7C        .db $7C
  $908C  FF        .db $FF
  $908D  FF        .db $FF
  $908E  FC        .db $FC
  $908F  F9 78 FC  SBC $FC78,Y

L_9092:
  $9092  FC        .db $FC
  $9093  F8        SED
  $9094  F0 70     BEQ $9106
  $9096  F8        SED
  $9097  34        .db $34
  $9098  F0 F8     BEQ $9092
  $909A  F8        SED
  $909B  E0 60     CPX #$60
  $909D  A0 00     LDY #$00
  $909F  D8        CLD
  $90A0  1F        .db $1F
  $90A1  0F        .db $0F
  $90A2  07        .db $07
  $90A3  04        .db $04
  $90A4  03        .db $03
  $90A5  03        .db $03
  $90A6  01 00     ORA ($00,X)
  $90A8  0F        .db $0F
  $90A9  07        .db $07
  $90AA  00        BRK
  $90AB  03        .db $03
  $90AC  01 00     ORA ($00,X)
  $90AE  00        BRK

L_90AF:
  $90AF  00        BRK
  $90B0  8D 8F 9B  STA $9B8F
  $90B3  3B        .db $3B
  $90B4  FB        .db $FB
  $90B5  FD FF 7F  SBC $7FFF,X
  $90B8  73        .db $73
  $90B9  73        .db $73
  $90BA  66 E6     ROR $E6
  $90BC  E7        .db $E7
  $90BD  E3        .db $E3
  $90BE  00        BRK
  $90BF  0C        .db $0C
  $90C0  D4        .db $D4
  $90C1  F4        .db $F4
  $90C2  F8        SED
  $90C3  E0 E0     CPX #$E0
  $90C5  C0 C6     CPY #$C6
  $90C7  CA        DEX
  $90C8  E8        INX
  $90C9  28        PLP

L_90CA:
  $90CA  20 40 C0  JSR $C040
  $90CD  80        .db $80
  $90CE  00        BRK
  $90CF  84 01     STY $01
  $90D1  06 08     ASL $08
  $90D3  0B        .db $0B
  $90D4  0E 01 00  ASL $0001
  $90D7  00        BRK
  $90D8  00        BRK
  $90D9  01 07     ORA ($07,X)
  $90DB  04        .db $04
  $90DC  01 00     ORA ($00,X)
  $90DE  00        BRK
  $90DF  00        BRK
  $90E0  E5 1B     SBC $1B
  $90E2  E1 06     SBC ($06,X)
  $90E4  39 C0 00  AND $00C0,Y
  $90E7  00        BRK
  $90E8  00        BRK
  $90E9  E5 1E     SBC $1E
  $90EB  F9 C0 00  SBC $00C0,Y

L_90EE:
  $90EE  00        BRK
  $90EF  00        BRK
  $90F0  E5 F8     SBC $F8
  $90F2  C0 40     CPY #$40
  $90F4  20 C0 00  JSR $00C0
  $90F7  00        BRK
  $90F8  38        SEC
  $90F9  E0 00     CPX #$00
  $90FB  80        .db $80
  $90FC  C0 00     CPY #$00
  $90FE  00        BRK
  $90FF  00        BRK
  $9100  F9 FD 5E  SBC $5EFD,Y
  $9103  3E 05 06  ROL $0605,X

L_9106:
  $9106  02        .db $02
  $9107  01 C6     ORA ($C6,X)
  $9109  7A        .db $7A
  $910A  39 01 02  AND $0201,Y
  $910D  01 01     ORA ($01,X)
  $910F  00        BRK
  $9110  00        BRK
  $9111  00        BRK
  $9112  80        .db $80
  $9113  40        RTI
  $9114  20 90 D0  JSR $D090
  $9117  E0 00     CPX #$00
  $9119  00        BRK
  $911A  00        BRK
  $911B  80        .db $80
  $911C  C0 60     CPY #$60
  $911E  20 00 00  JSR $0000
  $9121  00        BRK
  $9122  00        BRK
  $9123  00        BRK
  $9124  00        BRK
  $9125  01 01     ORA ($01,X)
  $9127  00        BRK
  $9128  00        BRK
  $9129  00        BRK
  $912A  00        BRK
  $912B  00        BRK
  $912C  00        BRK
  $912D  00        BRK
  $912E  00        BRK
  $912F  00        BRK
  $9130  0E 32 53  ASL $5332
  $9133  A4 80     LDY $80
  $9135  1E 7F FF  ASL $FF7F,X
  $9138  00        BRK
  $9139  0C        .db $0C
  $913A  3C        .db $3C
  $913B  7B        .db $7B
  $913C  7F        .db $7F
  $913D  E1 9E     SBC ($9E,X)
  $913F  73        .db $73
  $9140  00        BRK
  $9141  00        BRK
  $9142  80        .db $80
  $9143  80        .db $80
  $9144  40        RTI
  $9145  C0 20     CPY #$20
  $9147  A0 00     LDY #$00
  $9149  00        BRK
  $914A  00        BRK
  $914B  00        BRK
  $914C  80        .db $80
  $914D  00        BRK
  $914E  C0 40     CPY #$40
  $9150  00        BRK
  $9151  00        BRK
  $9152  00        BRK
  $9153  00        BRK
  $9154  00        BRK
  $9155  00        BRK
  $9156  00        BRK
  $9157  78        SEI
  $9158  00        BRK
  $9159  00        BRK
  $915A  00        BRK
  $915B  00        BRK
  $915C  00        BRK
  $915D  00        BRK
  $915E  00        BRK
  $915F  00        BRK
  $9160  01 02     ORA ($02,X)
  $9162  02        .db $02
  $9163  02        .db $02
  $9164  03        .db $03
  $9165  05 05     ORA $05
  $9167  03        .db $03
  $9168  00        BRK
  $9169  00        BRK
  $916A  00        BRK
  $916B  00        BRK
  $916C  00        BRK
  $916D  02        .db $02
  $916E  02        .db $02
  $916F  00        BRK
  $9170  F3        .db $F3
  $9171  E1 F0     SBC ($F0,X)
  $9173  F0 80     BEQ $90F5
  $9175  10 7A     BPL $91F1
  $9177  BD E3 40  LDA $40E3,X
  $917A  43        .db $43
  $917B  07        .db $07
  $917C  07        .db $07
  $917D  0F        .db $0F
  $917E  05 08     ORA $08
  $9180  E0 C1     CPX #$C1
  $9182  21 D2     AND ($D2,X)
  $9184  52        .db $52
  $9185  12        .db $12
  $9186  22        .db $22
  $9187  FE 00 00  INC $0000,X
  $918A  C0 E1     CPY #$E1
  $918C  E1 E1     SBC ($E1,X)
  $918E  C1 01     CMP ($01,X)
  $9190  84 1E     STY $1E
  $9192  3E 7F 7F  ROL $7F7F,X
  $9195  78        SEI
  $9196  FC        .db $FC
  $9197  FC        .db $FC
  $9198  78        SEI
  $9199  FC        .db $FC
  $919A  FC        .db $FC
  $919B  FE F8 F0  INC $F0F8,X
  $919E  F8        SED
  $919F  F8        SED
  $91A0  3C        .db $3C
  $91A1  3D 3E 3E  AND $3E3E,X
  $91A4  1F        .db $1F
  $91A5  1F        .db $1F
  $91A6  0F        .db $0F
  $91A7  07        .db $07
  $91A8  18        CLC
  $91A9  18        CLC
  $91AA  19 19 0C  ORA $0C19,Y
  $91AD  0E 06 00  ASL $0006
  $91B0  C3        .db $C3
  $91B1  3C        .db $3C
  $91B2  70 43     BVS $91F7
  $91B4  04        .db $04
  $91B5  8B        .db $8B
  $91B6  8B        .db $8B
  $91B7  8B        .db $8B
  $91B8  3C        .db $3C
  $91B9  FF        .db $FF
  $91BA  FF        .db $FF
  $91BB  FC        .db $FC
  $91BC  FB        .db $FB
  $91BD  77        .db $77
  $91BE  76 76     ROR $76,X
  $91C0  F8        SED
  $91C1  F0 70     BEQ $9233
  $91C3  B8        CLV
  $91C4  F4        .db $F4
  $91C5  F4        .db $F4
  $91C6  E4 F8     CPX $F8
  $91C8  E0 60     CPX #$60
  $91CA  A0 40     LDY #$40
  $91CC  98        TYA
  $91CD  D8        CLD
  $91CE  58        CLI
  $91CF  40        RTI
  $91D0  04        .db $04
  $91D1  03        .db $03
  $91D2  01 00     ORA ($00,X)
  $91D4  00        BRK
  $91D5  00        BRK
  $91D6  00        BRK
  $91D7  00        BRK
  $91D8  03        .db $03
  $91D9  01 00     ORA ($00,X)
  $91DB  00        BRK

L_91DC:
  $91DC  00        BRK
  $91DD  00        BRK
  $91DE  00        BRK

L_91DF:
  $91DF  00        BRK
  $91E0  3B        .db $3B
  $91E1  FB        .db $FB
  $91E2  FD FF 7B  SBC $7BFF,X
  $91E5  39 3D 1F  AND $1F3D,Y
  $91E8  F6 F7     INC $F7,X
  $91EA  F3        .db $F3
  $91EB  00        BRK
  $91EC  01 10     ORA ($10,X)
  $91EE  08        PHP
  $91EF  08        PHP
  $91F0  E0 E0     CPX #$E0
  $91F2  C0 C0     CPY #$C0
  $91F4  C0 C0     CPY #$C0
  $91F6  A0 20     LDY #$20
  $91F8  40        RTI
  $91F9  C0 80     CPY #$80
  $91FB  00        BRK
  $91FC  80        .db $80
  $91FD  80        .db $80
  $91FE  C0 C0     CPY #$C0
  $9200  00        BRK
  $9201  00        BRK
  $9202  00        BRK
  $9203  00        BRK
  $9204  01 02     ORA ($02,X)
  $9206  04        .db $04
  $9207  07        .db $07
  $9208  00        BRK
  $9209  00        BRK
  $920A  00        BRK
  $920B  00        BRK
  $920C  00        BRK
  $920D  01 03     ORA ($03,X)
  $920F  00        BRK
  $9210  1F        .db $1F
  $9211  0F        .db $0F
  $9212  0F        .db $0F
  $9213  50 C7     BVC $91DC
  $9215  0E 3C D8  ASL $D83C
  $9218  01 03     ORA ($03,X)
  $921A  00        BRK
  $921B  0F        .db $0F
  $921C  38        SEC
  $921D  F0 C0     BEQ $91DF
  $921F  00        BRK
  $9220  E0 C0     CPX #$C0
  $9222  80        .db $80
  $9223  40        RTI
  $9224  80        .db $80
  $9225  00        BRK
  $9226  00        BRK
  $9227  00        BRK
  $9228  80        .db $80
  $9229  00        BRK

L_922A:
  $922A  00        BRK
  $922B  80        .db $80
  $922C  00        BRK
  $922D  00        BRK
  $922E  00        BRK
  $922F  00        BRK
  $9230  00        BRK
  $9231  00        BRK
  $9232  00        BRK

L_9233:
  $9233  03        .db $03
  $9234  0C        .db $0C
  $9235  14        .db $14
  $9236  29 20     AND #$20
  $9238  00        BRK
  $9239  00        BRK
  $923A  00        BRK

L_923B:
  $923B  00        BRK
  $923C  03        .db $03
  $923D  0F        .db $0F
  $923E  1E 1F 00  ASL $001F,X
  $9241  00        BRK
  $9242  00        BRK
  $9243  80        .db $80
  $9244  80        .db $80
  $9245  E0 20     CPX #$20
  $9247  10 00     BPL $9249

L_9249:
  $9249  00        BRK
  $924A  00        BRK
  $924B  00        BRK
  $924C  00        BRK
  $924D  00        BRK
  $924E  C0 E0     CPY #$E0
  $9250  47        .db $47
  $9251  5F        .db $5F
  $9252  3F        .db $3F
  $9253  7C        .db $7C
  $9254  B8        CLV
  $9255  BC BC E0  LDY $E0BC,X
  $9258  38        SEC
  $9259  27        .db $27
  $925A  1C        .db $1C
  $925B  38        SEC
  $925C  10 10     BPL $926E
  $925E  01 01     ORA ($01,X)
  $9260  B0 C8     BCS $922A
  $9262  E8        INX
  $9263  F8        SED
  $9264  71 09     ADC ($09),Y
  $9266  36 16     ROL $16,X

L_9268:
  $9268  40        RTI
  $9269  B0 D0     BCS $923B
  $926B  C0 00     CPY #$00
  $926D  F0 F9     BEQ $9268
  $926F  F9 00 00  SBC $0000,Y
  $9272  78        SEI
  $9273  84 1E     STY $1E
  $9275  3E 7F 7F  ROL $7F7F,X
  $9278  00        BRK
  $9279  00        BRK
  $927A  00        BRK
  $927B  78        SEI
  $927C  FC        .db $FC
  $927D  FC        .db $FC
  $927E  FE F8 01  INC $01F8,X
  $9281  01 00     ORA ($00,X)
  $9283  00        BRK
  $9284  00        BRK
  $9285  00        BRK
  $9286  00        BRK
  $9287  00        BRK
  $9288  00        BRK
  $9289  00        BRK
  $928A  00        BRK
  $928B  00        BRK
  $928C  00        BRK
  $928D  00        BRK
  $928E  00        BRK
  $928F  00        BRK
  $9290  44        .db $44
  $9291  5E EF 07  LSR $07EF,X
  $9294  0F        .db $0F
  $9295  0F        .db $0F
  $9296  0F        .db $0F
  $9297  0F        .db $0F
  $9298  83        .db $83
  $9299  81 02     STA ($02,X)
  $929B  03        .db $03
  $929C  06 06     ASL $06
  $929E  06 07     ASL $07
  $92A0  06 8A     ASL $8A
  $92A2  FF        .db $FF
  $92A3  C3        .db $C3
  $92A4  3C        .db $3C
  $92A5  70 4F     BVS $92F6
  $92A7  88        DEY
  $92A8  F9 71 00  SBC $0071,Y
  $92AB  3C        .db $3C
  $92AC  FF        .db $FF
  $92AD  FF        .db $FF
  $92AE  F0 77     BEQ $9327
  $92B0  78        SEI
  $92B1  FC        .db $FC

L_92B2:
  $92B2  FC        .db $FC
  $92B3  F8        SED
  $92B4  F0 70     BEQ $9326
  $92B6  B8        CLV
  $92B7  F4        .db $F4
  $92B8  F0 F8     BEQ $92B2
  $92BA  F8        SED
  $92BB  E0 60     CPX #$60
  $92BD  A0 40     LDY #$40
  $92BF  18        CLC
  $92C0  0F        .db $0F
  $92C1  07        .db $07
  $92C2  07        .db $07
  $92C3  04        .db $04
  $92C4  03        .db $03
  $92C5  03        .db $03
  $92C6  03        .db $03
  $92C7  C7        .db $C7
  $92C8  07        .db $07
  $92C9  02        .db $02
  $92CA  00        BRK
  $92CB  03        .db $03
  $92CC  01 00     ORA ($00,X)

L_92CE:
  $92CE  00        BRK
  $92CF  03        .db $03
  $92D0  9B        .db $9B
  $92D1  97        .db $97
  $92D2  97        .db $97
  $92D3  33        .db $33
  $92D4  F9 FD FF  SBC $FFFD,Y
  $92D7  80        .db $80
  $92D8  67        .db $67
  $92D9  6E 6E EF  ROR $EF6E
  $92DC  F7        .db $F7
  $92DD  F3        .db $F3
  $92DE  00        BRK
  $92DF  00        BRK
  $92E0  F4        .db $F4
  $92E1  E4 F8     CPX $F8
  $92E3  F0 F0     BEQ $92D5
  $92E5  F8        SED
  $92E6  FF        .db $FF
  $92E7  39 98 58  AND $5898,Y
  $92EA  20 20 E0  JSR $E020
  $92ED  D0 38     BNE $9327
  $92EF  0F        .db $0F
  $92F0  00        BRK
  $92F1  00        BRK
  $92F2  00        BRK
  $92F3  00        BRK
  $92F4  00        BRK
  $92F5  C0 A0     CPY #$A0
  $92F7  A0 00     LDY #$00
  $92F9  00        BRK
  $92FA  00        BRK
  $92FB  00        BRK
  $92FC  00        BRK
  $92FD  00        BRK
  $92FE  40        RTI
  $92FF  40        RTI
  $9300  3F        .db $3F
  $9301  41 9E     EOR ($9E,X)
  $9303  F0 27     BEQ $932C
  $9305  1C        .db $1C
  $9306  00        BRK
  $9307  00        BRK
  $9308  00        BRK
  $9309  3E 61 0F  ROL $0F61,X
  $930C  18        CLC
  $930D  00        BRK
  $930E  00        BRK
  $930F  00        BRK
  $9310  F9 7E B8  SBC $B87E,Y
  $9313  50 20     BVC $9335
  $9315  00        BRK
  $9316  00        BRK
  $9317  00        BRK
  $9318  46 B8     LSR $B8
  $931A  40        RTI
  $931B  20 00 00  JSR $0000
  $931E  00        BRK
  $931F  00        BRK
  $9320  0F        .db $0F
  $9321  03        .db $03
  $9322  01 00     ORA ($00,X)
  $9324  00        BRK
  $9325  00        BRK

L_9326:
  $9326  00        BRK

L_9327:
  $9327  00        BRK
  $9328  03        .db $03
  $9329  00        BRK
  $932A  00        BRK
  $932B  00        BRK

L_932C:
  $932C  00        BRK
  $932D  00        BRK
  $932E  00        BRK
  $932F  00        BRK
  $9330  B0 9C     BCS $92CE
  $9332  06 91     ASL $91
  $9334  49 26     EOR #$26
  $9336  11 0E     ORA ($0E),Y
  $9338  40        RTI
  $9339  60        RTS
  $933A  F8        SED
  $933B  6E 36 18  ROR $1836
  $933E  0E 00 00  ASL $0000
  $9341  00        BRK
  $9342  00        BRK
  $9343  00        BRK
  $9344  30 70     BMI $93B6
  $9346  40        RTI
  $9347  00        BRK
  $9348  06 8F     ASL $8F
  $934A  86 84     STX $84
  $934C  3C        .db $3C
  $934D  70 40     BVS $938F
  $934F  00        BRK
  $9350  00        BRK
  $9351  00        BRK
  $9352  00        BRK
  $9353  00        BRK
  $9354  00        BRK
  $9355  01 03     ORA ($03,X)
  $9357  07        .db $07
  $9358  00        BRK
  $9359  00        BRK
  $935A  00        BRK
  $935B  00        BRK
  $935C  00        BRK
  $935D  00        BRK
  $935E  01 03     ORA ($03,X)
  $9360  3F        .db $3F
  $9361  4B        .db $4B
  $9362  9B        .db $9B
  $9363  9B        .db $9B
  $9364  8B        .db $8B
  $9365  7F        .db $7F
  $9366  7F        .db $7F
  $9367  7F        .db $7F
  $9368  00        BRK
  $9369  3F        .db $3F
  $936A  6F        .db $6F
  $936B  67        .db $67
  $936C  7F        .db $7F
  $936D  00        BRK
  $936E  1C        .db $1C
  $936F  32        .db $32
  $9370  3F        .db $3F
  $9371  4B        .db $4B
  $9372  93        .db $93
  $9373  9B        .db $9B
  $9374  8B        .db $8B
  $9375  7F        .db $7F
  $9376  7F        .db $7F
  $9377  7F        .db $7F
  $9378  00        BRK
  $9379  3F        .db $3F
  $937A  6F        .db $6F
  $937B  67        .db $67
  $937C  7F        .db $7F
  $937D  00        BRK
  $937E  47        .db $47
  $937F  29 FC     AND #$FC
  $9381  D2        .db $D2
  $9382  C9 D9     CMP #$D9
  $9384  D1 FE     CMP ($FE),Y
  $9386  FE FE 00  INC $00FE,X
  $9389  FC        .db $FC
  $938A  F6 E6     INC $E6,X
  $938C  FE 00 00  INC $0000,X

L_938F:
  $938F  80        .db $80
  $9390  3F        .db $3F
  $9391  4B        .db $4B
  $9392  9B        .db $9B
  $9393  9B        .db $9B
  $9394  8B        .db $8B
  $9395  7F        .db $7F
  $9396  7F        .db $7F
  $9397  7F        .db $7F
  $9398  00        BRK
  $9399  3F        .db $3F
  $939A  6F        .db $6F
  $939B  67        .db $67
  $939C  7F        .db $7F

L_939D:
  $939D  00        BRK
  $939E  60        RTS
  $939F  30 FC     BMI $939D
  $93A1  D2        .db $D2
  $93A2  D9 D9 D1  CMP $D1D9,Y
  $93A5  FE FE FE  INC $FEFE,X
  $93A8  00        BRK
  $93A9  FC        .db $FC
  $93AA  F6 E6     INC $E6,X
  $93AC  FE 00 00  INC $0000,X
  $93AF  00        BRK
  $93B0  3F        .db $3F
  $93B1  4B        .db $4B
  $93B2  93        .db $93
  $93B3  9B        .db $9B
  $93B4  8B        .db $8B
  $93B5  7F        .db $7F

L_93B6:
  $93B6  7F        .db $7F
  $93B7  7F        .db $7F
  $93B8  00        BRK
  $93B9  3F        .db $3F
  $93BA  6F        .db $6F
  $93BB  67        .db $67
  $93BC  7F        .db $7F
  $93BD  00        BRK
  $93BE  00        BRK
  $93BF  00        BRK
  $93C0  00        BRK
  $93C1  00        BRK
  $93C2  00        BRK
  $93C3  00        BRK
  $93C4  00        BRK
  $93C5  00        BRK
  $93C6  00        BRK
  $93C7  00        BRK
  $93C8  00        BRK
  $93C9  00        BRK
  $93CA  00        BRK
  $93CB  00        BRK
  $93CC  00        BRK
  $93CD  00        BRK
  $93CE  00        BRK
  $93CF  00        BRK
  $93D0  00        BRK
  $93D1  00        BRK
  $93D2  00        BRK
  $93D3  00        BRK
  $93D4  00        BRK
  $93D5  00        BRK
  $93D6  00        BRK
  $93D7  00        BRK
  $93D8  00        BRK
  $93D9  00        BRK
  $93DA  00        BRK
  $93DB  00        BRK
  $93DC  00        BRK
  $93DD  00        BRK
  $93DE  00        BRK
  $93DF  00        BRK
  $93E0  00        BRK
  $93E1  00        BRK
  $93E2  00        BRK
  $93E3  00        BRK
  $93E4  00        BRK
  $93E5  00        BRK
  $93E6  00        BRK
  $93E7  00        BRK
  $93E8  00        BRK
  $93E9  00        BRK
  $93EA  00        BRK
  $93EB  00        BRK
  $93EC  00        BRK
  $93ED  00        BRK
  $93EE  00        BRK
  $93EF  00        BRK
  $93F0  00        BRK
  $93F1  00        BRK
  $93F2  00        BRK
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
  $93FF  00        BRK
  $9400  00        BRK
  $9401  00        BRK
  $9402  00        BRK
  $9403  00        BRK
  $9404  FF        .db $FF
  $9405  FF        .db $FF
  $9406  00        BRK
  $9407  00        BRK
  $9408  00        BRK
  $9409  00        BRK
  $940A  00        BRK
  $940B  00        BRK
  $940C  FF        .db $FF
  $940D  00        BRK
  $940E  00        BRK
  $940F  00        BRK
  $9410  00        BRK
  $9411  00        BRK
  $9412  18        CLC
  $9413  34        .db $34
  $9414  FF        .db $FF
  $9415  FF        .db $FF
  $9416  08        PHP
  $9417  08        PHP
  $9418  00        BRK
  $9419  00        BRK
  $941A  00        BRK
  $941B  18        CLC
  $941C  C3        .db $C3
  $941D  00        BRK
  $941E  10 10     BPL $9430

L_9420:
  $9420  0F        .db $0F
  $9421  3E 40 40  ROL $4040,X
  $9424  A3        .db $A3
  $9425  B6 B6     LDX $B6,Y
  $9427  80        .db $80
  $9428  00        BRK
  $9429  0F        .db $0F
  $942A  3F        .db $3F
  $942B  1C        .db $1C
  $942C  08        PHP
  $942D  00        BRK
  $942E  00        BRK
  $942F  48        PHA

L_9430:
  $9430  80        .db $80
  $9431  40        RTI
  $9432  20 90 18  JSR $1890
  $9435  18        CLC
  $9436  18        CLC
  $9437  10 00     BPL $9439

L_9439:
  $9439  80        .db $80
  $943A  C0 60     CPY #$60
  $943C  70 70     BVS $94AE
  $943E  70 E0     BVS $9420
  $9440  00        BRK
  $9441  00        BRK
  $9442  00        BRK
  $9443  00        BRK
  $9444  60        RTS
  $9445  50 78     BVC $94BF
  $9447  C4 00     CPY $00
  $9449  00        BRK
  $944A  00        BRK
  $944B  00        BRK
  $944C  00        BRK
  $944D  20 00 38  JSR $3800
  $9450  41 4F     EOR ($4F,X)
  $9452  38        SEC
  $9453  1F        .db $1F
  $9454  20 4C 5A  JSR $5A4C
  $9457  72        .db $72
  $9458  3E 30 07  ROL $0730,X
  $945B  00        BRK
  $945C  1F        .db $1F
  $945D  33        .db $33
  $945E  2D 0D 1C  AND $1C0D
  $9461  3A        .db $3A
  $9462  F1 B1     SBC ($B1),Y
  $9464  11 1B     ORA ($1B),Y
  $9466  3C        .db $3C
  $9467  F8        SED
  $9468  E0 C4     CPX #$C4
  $946A  0E 4E EE  ASL $EE4E
  $946D  E4 C0     CPX $C0
  $946F  00        BRK
  $9470  82        .db $82
  $9471  62        .db $62
  $9472  42        .db $42
  $9473  C2        .db $C2
  $9474  E4 F8     CPX $F8
  $9476  D0 10     BNE $9488
  $9478  7C        .db $7C
  $9479  1C        .db $1C
  $947A  3C        .db $3C
  $947B  3C        .db $3C
  $947C  D8        CLD
  $947D  C0 00     CPY #$00
  $947F  00        BRK
  $9480  01 00     ORA ($00,X)
  $9482  00        BRK
  $9483  00        BRK
  $9484  00        BRK
  $9485  00        BRK
  $9486  00        BRK
  $9487  00        BRK

L_9488:
  $9488  00        BRK
  $9489  00        BRK
  $948A  00        BRK
  $948B  00        BRK
  $948C  00        BRK
  $948D  00        BRK
  $948E  00        BRK
  $948F  00        BRK
  $9490  FF        .db $FF
  $9491  FE 41 7F  INC $7F41,X
  $9494  81 7E     STA ($7E,X)
  $9496  42        .db $42
  $9497  3C        .db $3C
  $9498  00        BRK
  $9499  00        BRK
  $949A  3E 00 7E  ROL $7E00,X
  $949D  00        BRK
  $949E  3C        .db $3C
  $949F  00        BRK
  $94A0  00        BRK
  $94A1  00        BRK
  $94A2  81 C2     STA ($C2,X)
  $94A4  3C        .db $3C
  $94A5  00        BRK
  $94A6  00        BRK
  $94A7  00        BRK
  $94A8  01 01     ORA ($01,X)
  $94AA  42        .db $42
  $94AB  3C        .db $3C
  $94AC  00        BRK
  $94AD  00        BRK

L_94AE:
  $94AE  00        BRK
  $94AF  00        BRK
  $94B0  00        BRK
  $94B1  01 06     ORA ($06,X)
  $94B3  18        CLC
  $94B4  23        .db $23
  $94B5  40        RTI
  $94B6  FF        .db $FF
  $94B7  FF        .db $FF
  $94B8  00        BRK
  $94B9  00        BRK
  $94BA  01 07     ORA ($07,X)
  $94BC  1F        .db $1F
  $94BD  3F        .db $3F
  $94BE  7F        .db $7F

L_94BF:
  $94BF  00        BRK
  $94C0  7E B9 FF  ROR $FFB9,X
  $94C3  00        BRK
  $94C4  80        .db $80
  $94C5  00        BRK
  $94C6  FF        .db $FF
  $94C7  FF        .db $FF
  $94C8  00        BRK
  $94C9  7E 00 FF  ROR $FF00,X
  $94CC  FF        .db $FF
  $94CD  FF        .db $FF
  $94CE  FF        .db $FF
  $94CF  00        BRK
  $94D0  00        BRK

L_94D1:
  $94D1  80        .db $80
  $94D2  60        RTS
  $94D3  18        CLC
  $94D4  04        .db $04
  $94D5  02        .db $02
  $94D6  FF        .db $FF
  $94D7  FF        .db $FF
  $94D8  00        BRK
  $94D9  00        BRK
  $94DA  80        .db $80
  $94DB  E0 F8     CPX #$F8
  $94DD  FC        .db $FC
  $94DE  FE 00 80  INC $8000,X
  $94E1  40        RTI
  $94E2  20 90 18  JSR $1890
  $94E5  18        CLC
  $94E6  1B        .db $1B
  $94E7  12        .db $12
  $94E8  00        BRK
  $94E9  80        .db $80
  $94EA  C0 60     CPY #$60
  $94EC  70 70     BVS $955E
  $94EE  70 E1     BVS $94D1
  $94F0  1F        .db $1F
  $94F1  3E F4 B3  ROL $B3F4,X
  $94F4  12        .db $12
  $94F5  1A        .db $1A
  $94F6  3F        .db $3F
  $94F7  FF        .db $FF
  $94F8  E0 C1     CPX #$C1
  $94FA  0B        .db $0B
  $94FB  4C ED E5  JMP $E5ED
  $94FE  C2        .db $C2
  $94FF  03        .db $03
  $9500  C0 20     CPY #$20
  $9502  10 10     BPL $9514
  $9504  10 10     BPL $9516
  $9506  20 C0 00  JSR $00C0
  $9509  C0 E0     CPY #$E0
  $950B  E0 E0     CPX #$E0
  $950D  E0 C0     CPX #$C0
  $950F  00        BRK
  $9510  00        BRK
  $9511  00        BRK
  $9512  9A        TXS
  $9513  02        .db $02

L_9514:
  $9514  84 48     STY $48

L_9516:
  $9516  30 00     BMI $9518

L_9518:
  $9518  00        BRK
  $9519  00        BRK
  $951A  04        .db $04
  $951B  84 48     STY $48
  $951D  30 00     BMI $951F

L_951F:
  $951F  00        BRK

L_9520:
  $9520  00        BRK
  $9521  00        BRK
  $9522  18        CLC
  $9523  34        .db $34
  $9524  FC        .db $FC
  $9525  FC        .db $FC
  $9526  08        PHP
  $9527  08        PHP
  $9528  00        BRK
  $9529  00        BRK
  $952A  00        BRK
  $952B  18        CLC
  $952C  C0 00     CPY #$00
  $952E  10 10     BPL $9540
  $9530  80        .db $80
  $9531  40        RTI
  $9532  20 90 18  JSR $1890
  $9535  18        CLC
  $9536  18        CLC
  $9537  10 00     BPL $9539

L_9539:
  $9539  80        .db $80
  $953A  C0 60     CPY #$60
  $953C  70 70     BVS $95AE
  $953E  70 E0     BVS $9520

L_9540:
  $9540  03        .db $03
  $9541  06 09     ASL $09
  $9543  0B        .db $0B
  $9544  09 09     ORA #$09
  $9546  05 0F     ORA $0F
  $9548  00        BRK
  $9549  01 06     ORA ($06,X)
  $954B  04        .db $04
  $954C  06 02     ASL $02
  $954E  02        .db $02
  $954F  04        .db $04
  $9550  80        .db $80
  $9551  60        RTS
  $9552  20 20 20  JSR $2020
  $9555  20 E0 C0  JSR $C0E0
  $9558  00        BRK
  $9559  80        .db $80
  $955A  C0 C0     CPY #$C0
  $955C  C0 C0     CPY #$C0

L_955E:
  $955E  00        BRK
  $955F  00        BRK
  $9560  1C        .db $1C
  $9561  3A        .db $3A
  $9562  F1 B0     SBC ($B0),Y
  $9564  11 1A     ORA ($1A),Y
  $9566  34        .db $34
  $9567  E8        INX
  $9568  E0 C4     CPX #$C4
  $956A  0E 4E EC  ASL $EC4E
  $956D  E0 C0     CPX #$C0
  $956F  00        BRK
  $9570  1E 8C 68  ASL $688C,X
  $9573  F0 00     BEQ $9575

L_9575:
  $9575  00        BRK
  $9576  00        BRK
  $9577  00        BRK
  $9578  04        .db $04
  $9579  30 50     BMI $95CB
  $957B  00        BRK
  $957C  00        BRK
  $957D  00        BRK
  $957E  00        BRK
  $957F  00        BRK
  $9580  FF        .db $FF
  $9581  FE FE 81  INC $81FE,X
  $9584  7E 42 3C  ROR $3C42,X
  $9587  3C        .db $3C
  $9588  00        BRK
  $9589  00        BRK
  $958A  00        BRK
  $958B  7E 00 3C  ROR $3C00,X
  $958E  00        BRK
  $958F  00        BRK
  $9590  00        BRK
  $9591  00        BRK
  $9592  18        CLC
  $9593  2C 3F 3F  BIT $3F3F
  $9596  08        PHP
  $9597  08        PHP
  $9598  00        BRK
  $9599  00        BRK
  $959A  00        BRK
  $959B  18        CLC
  $959C  03        .db $03
  $959D  00        BRK
  $959E  10 10     BPL $95B0
  $95A0  00        BRK
  $95A1  00        BRK
  $95A2  00        BRK
  $95A3  00        BRK
  $95A4  00        BRK
  $95A5  00        BRK
  $95A6  00        BRK
  $95A7  00        BRK
  $95A8  00        BRK
  $95A9  00        BRK
  $95AA  00        BRK
  $95AB  46 A9     LSR $A9
  $95AD  93        .db $93

L_95AE:
  $95AE  93        .db $93
  $95AF  6E 00 00  ROR $0000
  $95B2  00        BRK
  $95B3  00        BRK
  $95B4  00        BRK
  $95B5  00        BRK
  $95B6  00        BRK
  $95B7  00        BRK
  $95B8  00        BRK
  $95B9  00        BRK
  $95BA  00        BRK
  $95BB  00        BRK
  $95BC  00        BRK
  $95BD  04        .db $04
  $95BE  08        PHP
  $95BF  10 00     BPL $95C1

L_95C1:
  $95C1  00        BRK
  $95C2  00        BRK
  $95C3  00        BRK
  $95C4  00        BRK
  $95C5  00        BRK
  $95C6  00        BRK
  $95C7  00        BRK
  $95C8  01 02     ORA ($02,X)
  $95CA  04        .db $04

L_95CB:
  $95CB  08        PHP
  $95CC  10 20     BPL $95EE
  $95CE  40        RTI
  $95CF  80        .db $80
  $95D0  00        BRK
  $95D1  00        BRK
  $95D2  00        BRK
  $95D3  00        BRK
  $95D4  00        BRK
  $95D5  00        BRK
  $95D6  00        BRK
  $95D7  00        BRK
  $95D8  00        BRK
  $95D9  00        BRK
  $95DA  00        BRK
  $95DB  00        BRK
  $95DC  00        BRK
  $95DD  00        BRK
  $95DE  00        BRK
  $95DF  00        BRK
  $95E0  00        BRK
  $95E1  00        BRK
  $95E2  00        BRK
  $95E3  00        BRK
  $95E4  00        BRK
  $95E5  00        BRK
  $95E6  00        BRK
  $95E7  00        BRK
  $95E8  00        BRK
  $95E9  F2        .db $F2

L_95EA:
  $95EA  17        .db $17
  $95EB  52        .db $52
  $95EC  72        .db $72
  $95ED  47        .db $47

L_95EE:
  $95EE  42        .db $42
  $95EF  42        .db $42
  $95F0  00        BRK
  $95F1  00        BRK
  $95F2  00        BRK
  $95F3  00        BRK
  $95F4  00        BRK
  $95F5  00        BRK
  $95F6  00        BRK
  $95F7  00        BRK
  $95F8  00        BRK
  $95F9  F2        .db $F2
  $95FA  17        .db $17
  $95FB  52        .db $52
  $95FC  72        .db $72
  $95FD  47        .db $47
  $95FE  42        .db $42
  $95FF  42        .db $42
  $9600  00        BRK
  $9601  00        BRK
  $9602  30 78     BMI $967C
  $9604  FC        .db $FC
  $9605  FC        .db $FC
  $9606  F8        SED
  $9607  64        .db $64
  $9608  00        BRK
  $9609  00        BRK
  $960A  00        BRK
  $960B  30 78     BMI $9685
  $960D  78        SEI
  $960E  70 18     BVS $9628
  $9610  01 01     ORA ($01,X)
  $9612  02        .db $02
  $9613  07        .db $07
  $9614  0E 19 70  ASL $7019
  $9617  96 00     STX $00,Y
  $9619  00        BRK
  $961A  01 03     ORA ($03,X)
  $961C  01 00     ORA ($00,X)
  $961E  00        BRK
  $961F  60        RTS
  $9620  30 C8     BMI $95EA
  $9622  1C        .db $1C
  $9623  E2        .db $E2
  $9624  E2        .db $E2
  $9625  1E 0F CF  ASL $CF0F,X

L_9628:
  $9628  E0 F0     CPX #$F0
  $962A  F8        SED
  $962B  FC        .db $FC
  $962C  1C        .db $1C
  $962D  00        BRK
  $962E  06 06     ASL $06
  $9630  00        BRK
  $9631  00        BRK
  $9632  00        BRK
  $9633  00        BRK
  $9634  00        BRK
  $9635  38        SEC
  $9636  54        .db $54
  $9637  44        .db $44
  $9638  00        BRK
  $9639  00        BRK
  $963A  00        BRK
  $963B  00        BRK
  $963C  00        BRK
  $963D  00        BRK
  $963E  28        PLP
  $963F  38        SEC
  $9640  96 88     STX $88,Y
  $9642  4F        .db $4F
  $9643  3E 07 1E  ROL $1E07,X
  $9646  7F        .db $7F
  $9647  9F        .db $9F
  $9648  60        RTS
  $9649  70 38     BVS $9683
  $964B  00        BRK

L_964C:
  $964C  00        BRK
  $964D  01 1C     ORA ($1C,X)
  $964F  60        RTS
  $9650  CE 1E F9  DEC $F91E
  $9653  F3        .db $F3
  $9654  E1 01     SBC ($01,X)
  $9656  02        .db $02
  $9657  FC        .db $FC
  $9658  04        .db $04
  $9659  00        BRK
  $965A  06 0D     ASL $0D
  $965C  1E FE FC  ASL $FCFE,X
  $965F  00        BRK
  $9660  44        .db $44
  $9661  84 88     STY $88
  $9663  90 E0     BCC $9645
  $9665  00        BRK
  $9666  00        BRK
  $9667  00        BRK
  $9668  38        SEC
  $9669  78        SEI

L_966A:
  $966A  70 E0     BVS $964C
  $966C  00        BRK
  $966D  00        BRK
  $966E  00        BRK
  $966F  00        BRK
  $9670  07        .db $07
  $9671  04        .db $04
  $9672  04        .db $04
  $9673  02        .db $02
  $9674  01 00     ORA ($00,X)
  $9676  00        BRK
  $9677  00        BRK
  $9678  00        BRK
  $9679  03        .db $03
  $967A  03        .db $03
  $967B  01 00     ORA ($00,X)
  $967D  00        BRK
  $967E  00        BRK
  $967F  00        BRK
  $9680  89        .db $89
  $9681  10 10     BPL $9693

L_9683:
  $9683  20 C0 00  JSR $00C0
  $9686  01 01     ORA ($01,X)
  $9688  70 E0     BVS $966A
  $968A  E0 C0     CPX #$C0
  $968C  00        BRK
  $968D  00        BRK
  $968E  00        BRK
  $968F  00        BRK
  $9690  F8        SED
  $9691  3C        .db $3C
  $9692  32        .db $32

L_9693:
  $9693  42        .db $42
  $9694  86 8E     STX $8E
  $9696  01 FF     ORA ($FF,X)
  $9698  30 18     BMI $96B2
  $969A  0C        .db $0C
  $969B  3C        .db $3C
  $969C  78        SEI

L_969D:
  $969D  70 FE     BVS $969D
  $969F  00        BRK
  $96A0  00        BRK
  $96A1  00        BRK
  $96A2  00        BRK
  $96A3  30 78     BMI $971D
  $96A5  FC        .db $FC
  $96A6  7C        .db $7C
  $96A7  98        TYA
  $96A8  00        BRK
  $96A9  00        BRK
  $96AA  00        BRK
  $96AB  00        BRK
  $96AC  30 78     BMI $9726
  $96AE  38        SEC
  $96AF  60        RTS
  $96B0  03        .db $03
  $96B1  04        .db $04

L_96B2:
  $96B2  0F        .db $0F
  $96B3  10 3B     BPL $96F0
  $96B5  64        .db $64
  $96B6  5B        .db $5B
  $96B7  5B        .db $5B
  $96B8  00        BRK
  $96B9  03        .db $03
  $96BA  07        .db $07
  $96BB  0F        .db $0F
  $96BC  04        .db $04
  $96BD  00        BRK
  $96BE  00        BRK

L_96BF:
  $96BF  00        BRK
  $96C0  D0 31     BNE $96F3
  $96C2  92        .db $92
  $96C3  69 9A     ADC #$9A
  $96C5  7A        .db $7A
  $96C6  3E 3F E0  ROL $E03F,X
  $96C9  E0 E1     CPX #$E1
  $96CB  F0 71     BEQ $973E
  $96CD  01 19     ORA ($19,X)
  $96CF  1B        .db $1B
  $96D0  C0 A0     CPY #$A0
  $96D2  10 10     BPL $96E4
  $96D4  20 40 40  JSR $4040
  $96D7  80        .db $80
  $96D8  00        BRK
  $96D9  40        RTI
  $96DA  E0 E0     CPX #$E0
  $96DC  C0 80     CPY #$80
  $96DE  80        .db $80
  $96DF  00        BRK
  $96E0  00        BRK
  $96E1  07        .db $07
  $96E2  08        PHP
  $96E3  09 08     ORA #$08
  $96E5  06 01     ASL $01
  $96E7  00        BRK
  $96E8  00        BRK
  $96E9  00        BRK
  $96EA  07        .db $07
  $96EB  06 07     ASL $07
  $96ED  01 00     ORA ($00,X)

L_96EF:
  $96EF  00        BRK

L_96F0:
  $96F0  40        RTI
  $96F1  20 9F 7B  JSR $7B9F
  $96F4  7F        .db $7F
  $96F5  30 C8     BMI $96BF
  $96F7  07        .db $07
  $96F8  00        BRK
  $96F9  00        BRK

L_96FA:
  $96FA  00        BRK
  $96FB  80        .db $80
  $96FC  A0 CF     LDY #$CF
  $96FE  07        .db $07
  $96FF  00        BRK
  $9700  3F        .db $3F
  $9701  7E E4 C4  ROR $C4E4,X
  $9704  84 08     STY $08
  $9706  1F        .db $1F
  $9707  FC        .db $FC
  $9708  16 04     ASL $04,X
  $970A  18        CLC
  $970B  38        SEC
  $970C  78        SEI
  $970D  F0 E0     BEQ $96EF
  $970F  0F        .db $0F
  $9710  1F        .db $1F
  $9711  2F        .db $2F
  $9712  46 42     LSR $42
  $9714  31 40     AND ($40),Y
  $9716  80        .db $80
  $9717  FF        .db $FF
  $9718  04        .db $04
  $9719  1E 3C 3C  ASL $3C3C,X
  $971C  0E 3F 7F  ASL $7F3F
  $971F  00        BRK
  $9720  FC        .db $FC
  $9721  C4 02     CPY $02
  $9723  02        .db $02
  $9724  01 80     ORA ($80,X)

L_9726:
  $9726  80        .db $80
  $9727  80        .db $80
  $9728  03        .db $03
  $9729  03        .db $03
  $972A  01 01     ORA ($01,X)
  $972C  00        BRK
  $972D  00        BRK
  $972E  00        BRK
  $972F  00        BRK
  $9730  30 C8     BMI $96FA
  $9732  08        PHP
  $9733  08        PHP
  $9734  10 10     BPL $9746
  $9736  20 C0 00  JSR $00C0
  $9739  30 F0     BMI $972B
  $973B  F0 E0     BEQ $971D
  $973D  E0 C0     CPX #$C0
  $973F  00        BRK
  $9740  00        BRK
  $9741  00        BRK
  $9742  00        BRK
  $9743  06 0F     ASL $0F
  $9745  18        CLC

L_9746:
  $9746  18        CLC
  $9747  08        PHP
  $9748  00        BRK
  $9749  00        BRK
  $974A  00        BRK
  $974B  00        BRK
  $974C  06 0F     ASL $0F
  $974E  0F        .db $0F
  $974F  07        .db $07
  $9750  03        .db $03
  $9751  77        .db $77
  $9752  FC        .db $FC
  $9753  C0 07     CPY #$07
  $9755  1F        .db $1F
  $9756  7F        .db $7F
  $9757  F8        SED
  $9758  00        BRK
  $9759  03        .db $03
  $975A  73        .db $73
  $975B  7F        .db $7F
  $975C  F8        SED
  $975D  E0 87     CPX #$87
  $975F  1F        .db $1F
  $9760  31 73     AND ($73),Y
  $9762  63        .db $63
  $9763  67        .db $67
  $9764  27        .db $27
  $9765  6E CE CE  ROR $CECE
  $9768  0E 3C 3C  ASL $3C3C
  $976B  39 19 13  AND $1319,Y
  $976E  73        .db $73
  $976F  73        .db $73
  $9770  E1 81     SBC ($81,X)
  $9772  B0 31     BCS $97A5
  $9774  07        .db $07
  $9775  0E 0C D8  ASL $D80C
  $9778  7E FE CF  ROR $CFFE,X
  $977B  CE F8 F0  DEC $F0F8
  $977E  F0 20     BEQ $97A0
  $9780  00        BRK
  $9781  00        BRK
  $9782  00        BRK
  $9783  01 03     ORA ($03,X)
  $9785  02        .db $02
  $9786  0E 18 00  ASL $0018
  $9789  00        BRK
  $978A  00        BRK
  $978B  00        BRK
  $978C  01 01     ORA ($01,X)
  $978E  01 0F     ORA ($0F,X)
  $9790  0E 1F D8  ASL $D81F
  $9793  F0 07     BEQ $979C
  $9795  1F        .db $1F
  $9796  7F        .db $7F
  $9797  F8        SED
  $9798  00        BRK
  $9799  0E 0F CF  ASL $CF0F

L_979C:
  $979C  F8        SED
  $979D  E0 87     CPX #$87
  $979F  1F        .db $1F

L_97A0:
  $97A0  31 33     AND ($33),Y
  $97A2  13        .db $13
  $97A3  77        .db $77
  $97A4  E7        .db $E7

L_97A5:
  $97A5  CE CE 4E  DEC $4ECE
  $97A8  1E 1C 0C  ASL $0C1C,X
  $97AB  09 79     ORA #$79
  $97AD  73        .db $73
  $97AE  73        .db $73
  $97AF  33        .db $33
  $97B0  EC 8C 80  CPX $808C
  $97B3  03        .db $03
  $97B4  0F        .db $0F
  $97B5  CC D8 18  CPY $18D8
  $97B8  73        .db $73
  $97B9  F3        .db $F3
  $97BA  FF        .db $FF
  $97BB  FC        .db $FC
  $97BC  F0 30     BEQ $97EE
  $97BE  20 E0 67  JSR $67E0
  $97C1  61 01     ADC ($01,X)
  $97C3  C0 F6     CPY #$F6
  $97C5  36 18     ROL $18,X
  $97C7  18        CLC
  $97C8  9E        .db $9E
  $97C9  9F        .db $9F
  $97CA  FF        .db $FF
  $97CB  3F        .db $3F
  $97CC  09 09     ORA #$09
  $97CE  07        .db $07
  $97CF  07        .db $07
  $97D0  00        BRK
  $97D1  00        BRK
  $97D2  00        BRK
  $97D3  00        BRK
  $97D4  00        BRK
  $97D5  00        BRK
  $97D6  00        BRK
  $97D7  00        BRK
  $97D8  6E FF 93  ROR $93FF
  $97DB  93        .db $93
  $97DC  7E 00 10  ROR $1000,X
  $97DF  00        BRK
  $97E0  00        BRK
  $97E1  00        BRK
  $97E2  00        BRK
  $97E3  00        BRK
  $97E4  00        BRK
  $97E5  00        BRK
  $97E6  00        BRK
  $97E7  00        BRK
  $97E8  6E 93 93  ROR $9393
  $97EB  FF        .db $FF
  $97EC  7E 00 10  ROR $1000,X
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
  $97F9  F2        .db $F2
  $97FA  17        .db $17
  $97FB  52        .db $52
  $97FC  72        .db $72
  $97FD  47        .db $47
  $97FE  42        .db $42
  $97FF  42        .db $42
  $9800  00        BRK
  $9801  00        BRK
  $9802  00        BRK
  $9803  1B        .db $1B
  $9804  3F        .db $3F
  $9805  3F        .db $3F
  $9806  1F        .db $1F

L_9807:
  $9807  1F        .db $1F
  $9808  00        BRK
  $9809  00        BRK
  $980A  00        BRK
  $980B  00        BRK
  $980C  13        .db $13
  $980D  1F        .db $1F
  $980E  0F        .db $0F
  $980F  07        .db $07
  $9810  00        BRK

L_9811:
  $9811  00        BRK
  $9812  00        BRK
  $9813  C0 E0     CPY #$E0
  $9815  F0 F0     BEQ $9807
  $9817  F0 00     BEQ $9819

L_9819:
  $9819  00        BRK
  $981A  00        BRK
  $981B  00        BRK
  $981C  C0 E0     CPY #$E0
  $981E  E0 E0     CPX #$E0
  $9820  2F        .db $2F
  $9821  21 48     AND ($48,X)
  $9823  99 91 92  STA $9291,Y
  $9826  C4 E8     CPY $E8
  $9828  11 1E     ORA ($1E),Y
  $982A  3F        .db $3F
  $982B  7E 7E 7C  ROR $7C7E,X
  $982E  38        SEC
  $982F  D0 E0     BNE $9811
  $9831  C0 80     CPY #$80
  $9833  00        BRK
  $9834  00        BRK
  $9835  00        BRK
  $9836  00        BRK
  $9837  00        BRK
  $9838  C0 80     CPY #$80
  $983A  00        BRK
  $983B  00        BRK
  $983C  00        BRK
  $983D  00        BRK

L_983E:
  $983E  00        BRK
  $983F  00        BRK
  $9840  03        .db $03
  $9841  03        .db $03
  $9842  07        .db $07
  $9843  07        .db $07
  $9844  07        .db $07
  $9845  09 11     ORA #$11
  $9847  11 01     ORA ($01),Y
  $9849  01 03     ORA ($03,X)
  $984B  02        .db $02
  $984C  00        BRK
  $984D  06 0E     ASL $0E
  $984F  0E FF E0  ASL $E0FF
  $9852  B0 67     BCS $98BB
  $9854  4F        .db $4F
  $9855  13        .db $13
  $9856  F9 99 E0  SBC $E099,Y
  $9859  9F        .db $9F
  $985A  7F        .db $7F
  $985B  F8        SED
  $985C  F0 E0     BEQ $983E
  $985E  00        BRK
  $985F  00        BRK
  $9860  00        BRK
  $9861  00        BRK
  $9862  00        BRK
  $9863  1B        .db $1B
  $9864  3F        .db $3F
  $9865  3F        .db $3F
  $9866  1F        .db $1F

L_9867:
  $9867  1F        .db $1F
  $9868  00        BRK
  $9869  00        BRK
  $986A  00        BRK
  $986B  00        BRK
  $986C  13        .db $13
  $986D  1F        .db $1F
  $986E  0F        .db $0F
  $986F  0F        .db $0F
  $9870  00        BRK
  $9871  00        BRK
  $9872  00        BRK
  $9873  C0 E0     CPY #$E0
  $9875  F0 F0     BEQ $9867
  $9877  F0 00     BEQ $9879

L_9879:
  $9879  00        BRK
  $987A  00        BRK
  $987B  00        BRK
  $987C  C0 E0     CPY #$E0
  $987E  E0 00     CPX #$00
  $9880  0F        .db $0F
  $9881  06 04     ASL $04
  $9883  02        .db $02
  $9884  02        .db $02
  $9885  01 00     ORA ($00,X)
  $9887  00        BRK
  $9888  06 01     ASL $01
  $988A  03        .db $03
  $988B  01 01     ORA ($01,X)
  $988D  00        BRK
  $988E  00        BRK
  $988F  00        BRK
  $9890  10 10     BPL $98A2
  $9892  88        DEY
  $9893  C8        INY
  $9894  64        .db $64
  $9895  24 8C     BIT $8C
  $9897  7E E0 E0  ROR $E0E0,X
  $989A  F0 F0     BEQ $988C
  $989C  F8        SED
  $989D  F8        SED

L_989E:
  $989E  70 0C     BVS $98AC
  $98A0  3F        .db $3F
  $98A1  3F        .db $3F

L_98A2:
  $98A2  1F        .db $1F
  $98A3  1F        .db $1F
  $98A4  0F        .db $0F
  $98A5  09 11     ORA #$11
  $98A7  11 1E     ORA ($1E),Y
  $98A9  1F        .db $1F
  $98AA  0F        .db $0F
  $98AB  0E 00 06  ASL $0600
  $98AE  0E 0E 1F  ASL $1F0E
  $98B1  E0 B0     CPX #$B0
  $98B3  67        .db $67
  $98B4  4F        .db $4F
  $98B5  13        .db $13

L_98B6:
  $98B6  F9 99 00  SBC $0099,Y
  $98B9  1F        .db $1F
  $98BA  7F        .db $7F

L_98BB:
  $98BB  F8        SED
  $98BC  F0 E0     BEQ $989E
  $98BE  00        BRK
  $98BF  00        BRK
  $98C0  1B        .db $1B
  $98C1  3F        .db $3F
  $98C2  3F        .db $3F
  $98C3  1F        .db $1F

L_98C4:
  $98C4  1F        .db $1F
  $98C5  0F        .db $0F
  $98C6  08        PHP
  $98C7  10 00     BPL $98C9

L_98C9:
  $98C9  13        .db $13
  $98CA  1F        .db $1F
  $98CB  0F        .db $0F
  $98CC  0F        .db $0F
  $98CD  00        BRK
  $98CE  07        .db $07
  $98CF  0F        .db $0F
  $98D0  C0 E0     CPY #$E0
  $98D2  F0 F0     BEQ $98C4
  $98D4  F0 E0     BEQ $98B6
  $98D6  60        RTS
  $98D7  20 00 C0  JSR $C000
  $98DA  E0 E0     CPX #$E0
  $98DC  E0 00     CPX #$00
  $98DE  80        .db $80
  $98DF  C0 14     CPY #$14
  $98E1  16 16     ASL $16,X
  $98E3  12        .db $12
  $98E4  10 08     BPL $98EE
  $98E6  0F        .db $0F
  $98E7  0F        .db $0F
  $98E8  0F        .db $0F
  $98E9  0F        .db $0F
  $98EA  0F        .db $0F
  $98EB  0F        .db $0F
  $98EC  0F        .db $0F
  $98ED  07        .db $07

L_98EE:
  $98EE  00        BRK
  $98EF  07        .db $07
  $98F0  20 20 20  JSR $2020
  $98F3  20 40 C0  JSR $C040
  $98F6  C0 C0     CPY #$C0
  $98F8  C0 C0     CPY #$C0
  $98FA  C0 C0     CPY #$C0
  $98FC  80        .db $80
  $98FD  00        BRK

L_98FE:
  $98FE  80        .db $80
  $98FF  80        .db $80
  $9900  0F        .db $0F
  $9901  0F        .db $0F
  $9902  0F        .db $0F
  $9903  0F        .db $0F
  $9904  0F        .db $0F
  $9905  09 11     ORA #$11
  $9907  11 07     ORA ($07),Y
  $9909  07        .db $07
  $990A  07        .db $07
  $990B  06 00     ASL $00
  $990D  06 0E     ASL $0E
  $990F  0E DF E0  ASL $E0DF
  $9912  B0 67     BCS $997B
  $9914  4F        .db $4F
  $9915  13        .db $13
  $9916  F9 99 80  SBC $8099,Y
  $9919  9F        .db $9F
  $991A  7F        .db $7F
  $991B  F8        SED
  $991C  F0 E0     BEQ $98FE
  $991E  00        BRK
  $991F  00        BRK
  $9920  00        BRK
  $9921  C0 20     CPY #$20
  $9923  10 B0     BPL $98D5
  $9925  B8        CLV
  $9926  B8        CLV
  $9927  98        TYA
  $9928  00        BRK
  $9929  00        BRK
  $992A  C0 E0     CPY #$E0
  $992C  40        RTI
  $992D  50 50     BVC $997F
  $992F  60        RTS
  $9930  26 2C     ROL $2C
  $9932  1F        .db $1F
  $9933  1C        .db $1C
  $9934  3E 3F 3F  ROL $3F3F,X
  $9937  1F        .db $1F
  $9938  18        CLC
  $9939  10 08     BPL $9943
  $993B  08        PHP
  $993C  1C        .db $1C
  $993D  1E 1F 0E  ASL $0E1F,X
  $9940  C6 02     DEC $02
  $9942  FA        .db $FA

L_9943:
  $9943  03        .db $03
  $9944  0F        .db $0F
  $9945  FF        .db $FF
  $9946  FF        .db $FF
  $9947  FF        .db $FF
  $9948  01 01     ORA ($01,X)
  $994A  01 00     ORA ($00,X)
  $994C  02        .db $02
  $994D  0F        .db $0F
  $994E  FF        .db $FF
  $994F  FF        .db $FF
  $9950  7C        .db $7C
  $9951  42        .db $42
  $9952  8D 85 C1  STA $C185
  $9955  C1 E2     CMP ($E2,X)
  $9957  FE 80 BC  INC $BC80,X
  $995A  7E 7E 3E  ROR $3E7E,X
  $995D  3E 1C 00  ROL $001C,X
  $9960  01 02     ORA ($02,X)
  $9962  E4 F8     CPX $F8
  $9964  FC        .db $FC
  $9965  FC        .db $FC
  $9966  FC        .db $FC
  $9967  7C        .db $7C
  $9968  00        BRK
  $9969  01 03     ORA ($03,X)
  $996B  67        .db $67
  $996C  33        .db $33
  $996D  1B        .db $1B
  $996E  1B        .db $1B
  $996F  0B        .db $0B
  $9970  CF        .db $CF
  $9971  7F        .db $7F
  $9972  7F        .db $7F
  $9973  3F        .db $3F
  $9974  3F        .db $3F
  $9975  3F        .db $3F
  $9976  43        .db $43
  $9977  80        .db $80
  $9978  01 87     ORA ($87,X)
  $997A  87        .db $87

L_997B:
  $997B  C3        .db $C3
  $997C  C0 C0     CPY #$C0
  $997E  80        .db $80

L_997F:
  $997F  00        BRK
  $9980  FF        .db $FF
  $9981  FF        .db $FF
  $9982  FE FC FB  INC $FBFC,X
  $9985  FE FE FE  INC $FEFE,X
  $9988  7F        .db $7F
  $9989  3E 81 FB  ROL $FB81,X
  $998C  F4        .db $F4
  $998D  00        BRK
  $998E  00        BRK
  $998F  00        BRK
  $9990  9F        .db $9F
  $9991  3F        .db $3F
  $9992  5F        .db $5F
  $9993  BF        .db $BF
  $9994  43        .db $43
  $9995  51 B3     EOR ($B3),Y
  $9997  A2 6E     LDX #$6E
  $9999  CE 8E 02  DEC $028E
  $999C  3C        .db $3C
  $999D  3E 7C 7C  ROL $7C7C,X
  $99A0  7C        .db $7C
  $99A1  3F        .db $3F
  $99A2  1E 0C 00  ASL $000C,X
  $99A5  00        BRK
  $99A6  00        BRK
  $99A7  00        BRK

L_99A8:
  $99A8  0B        .db $0B
  $99A9  04        .db $04
  $99AA  04        .db $04
  $99AB  00        BRK
  $99AC  00        BRK
  $99AD  00        BRK
  $99AE  00        BRK

L_99AF:
  $99AF  00        BRK
  $99B0  80        .db $80
  $99B1  00        BRK
  $99B2  03        .db $03
  $99B3  06 06     ASL $06
  $99B5  06 0F     ASL $0F
  $99B7  0F        .db $0F
  $99B8  00        BRK
  $99B9  00        BRK
  $99BA  00        BRK
  $99BB  03        .db $03
  $99BC  03        .db $03
  $99BD  03        .db $03
  $99BE  06 07     ASL $07
  $99C0  7F        .db $7F
  $99C1  7F        .db $7F
  $99C2  FF        .db $FF
  $99C3  39 09 08  AND $0809,Y
  $99C6  10 E0     BPL $99A8
  $99C8  00        BRK
  $99C9  01 01     ORA ($01,X)
  $99CB  C0 F0     CPY #$F0
  $99CD  F0 E0     BEQ $99AF
  $99CF  00        BRK
  $99D0  C4 FC     CPY $FC
  $99D2  FC        .db $FC
  $99D3  FC        .db $FC
  $99D4  F8        SED
  $99D5  C0 00     CPY #$00
  $99D7  00        BRK
  $99D8  F8        SED
  $99D9  F8        SED
  $99DA  F8        SED
  $99DB  F8        SED
  $99DC  C0 00     CPY #$00
  $99DE  00        BRK
  $99DF  00        BRK
  $99E0  0F        .db $0F
  $99E1  0E 00 00  ASL $0000
  $99E4  00        BRK
  $99E5  00        BRK
  $99E6  00        BRK
  $99E7  00        BRK
  $99E8  06 00     ASL $00
  $99EA  00        BRK
  $99EB  00        BRK
  $99EC  00        BRK
  $99ED  00        BRK
  $99EE  00        BRK
  $99EF  00        BRK
  $99F0  00        BRK
  $99F1  00        BRK
  $99F2  00        BRK
  $99F3  40        RTI
  $99F4  FF        .db $FF
  $99F5  01 FF     ORA ($FF,X)
  $99F7  7C        .db $7C
  $99F8  06 03     ASL $03
  $99FA  33        .db $33
  $99FB  4E FF 01  LSR $01FF
  $99FE  FF        .db $FF
  $99FF  7C        .db $7C
  $9A00  00        BRK
  $9A01  00        BRK
  $9A02  00        BRK
  $9A03  0E 7F 7F  ASL $7F7F
  $9A06  3F        .db $3F
  $9A07  7F        .db $7F
  $9A08  00        BRK
  $9A09  00        BRK
  $9A0A  00        BRK
  $9A0B  00        BRK
  $9A0C  0E 32 0A  ASL $0A32
  $9A0F  0F        .db $0F
  $9A10  00        BRK
  $9A11  00        BRK
  $9A12  00        BRK
  $9A13  00        BRK
  $9A14  80        .db $80
  $9A15  C0 C0     CPY #$C0
  $9A17  C0 00     CPY #$00
  $9A19  00        BRK
  $9A1A  00        BRK
  $9A1B  00        BRK
  $9A1C  00        BRK
  $9A1D  80        .db $80
  $9A1E  80        .db $80
  $9A1F  80        .db $80
  $9A20  00        BRK
  $9A21  00        BRK
  $9A22  0F        .db $0F
  $9A23  30 58     BMI $9A7D
  $9A25  B3        .db $B3
  $9A26  A7        .db $A7
  $9A27  89        .db $89
  $9A28  00        BRK
  $9A29  00        BRK
  $9A2A  00        BRK
  $9A2B  0F        .db $0F
  $9A2C  3F        .db $3F
  $9A2D  7C        .db $7C
  $9A2E  78        SEI
  $9A2F  70 7F     BVS $9AB0
  $9A31  3F        .db $3F
  $9A32  9F        .db $9F
  $9A33  6F        .db $6F
  $9A34  14        .db $14
  $9A35  8C DE DE  STY $DEDE
  $9A38  33        .db $33
  $9A39  1B        .db $1B
  $9A3A  0F        .db $0F
  $9A3B  80        .db $80
  $9A3C  E3        .db $E3
  $9A3D  73        .db $73
  $9A3E  29 29     AND #$29
  $9A40  C0 E0     CPY #$E0
  $9A42  90 50     BCC $9A94
  $9A44  68        PLA
  $9A45  28        PLP
  $9A46  28        PLP
  $9A47  08        PHP
  $9A48  80        .db $80
  $9A49  00        BRK
  $9A4A  60        RTS
  $9A4B  E0 F0     CPX #$F0
  $9A4D  F0 F0     BEQ $9A3F
  $9A4F  F0 1F     BEQ $9A70
  $9A51  1F        .db $1F
  $9A52  3F        .db $3F
  $9A53  3F        .db $3F
  $9A54  1F        .db $1F
  $9A55  1F        .db $1F
  $9A56  0F        .db $0F
  $9A57  07        .db $07
  $9A58  00        BRK
  $9A59  0B        .db $0B
  $9A5A  05 1C     ORA $1C
  $9A5C  06 0F     ASL $0F
  $9A5E  07        .db $07
  $9A5F  00        BRK
  $9A60  00        BRK
  $9A61  01 82     ORA ($82,X)
  $9A63  E5 D4     SBC $D4
  $9A65  CC C6 B3  CPY $B3C6
  $9A68  00        BRK
  $9A69  00        BRK
  $9A6A  01 82     ORA ($82,X)
  $9A6C  A3        .db $A3
  $9A6D  B3        .db $B3
  $9A6E  B9 7C FC  LDA $FC7C,Y
  $9A71  CC B1 0E  CPY $0EB1

L_9A74:
  $9A74  86 FC     STX $FC
  $9A76  83        .db $83
  $9A77  FF        .db $FF
  $9A78  00        BRK
  $9A79  00        BRK
  $9A7A  00        BRK
  $9A7B  00        BRK
  $9A7C  00        BRK

L_9A7D:
  $9A7D  00        BRK
  $9A7E  00        BRK
  $9A7F  83        .db $83
  $9A80  DF        .db $DF
  $9A81  CF        .db $CF
  $9A82  9B        .db $9B
  $9A83  9B        .db $9B
  $9A84  B9 F8 FF  LDA $FFF8,Y
  $9A87  FA        .db $FA
  $9A88  20 31 65  JSR $6531
  $9A8B  65 46     ADC $46
  $9A8D  17        .db $17
  $9A8E  B8        CLV
  $9A8F  FD 08 F0  SBC $F008,X
  $9A92  F0 E0     BEQ $9A74

L_9A94:
  $9A94  C0 40     CPY #$40
  $9A96  80        .db $80
  $9A97  80        .db $80
  $9A98  F0 00     BEQ $9A9A

L_9A9A:
  $9A9A  E0 C0     CPX #$C0
  $9A9C  00        BRK
  $9A9D  80        .db $80
  $9A9E  00        BRK
  $9A9F  00        BRK
  $9AA0  1B        .db $1B
  $9AA1  83        .db $83
  $9AA2  67        .db $67
  $9AA3  1C        .db $1C
  $9AA4  00        BRK
  $9AA5  00        BRK
  $9AA6  00        BRK
  $9AA7  00        BRK
  $9AA8  FC        .db $FC
  $9AA9  7C        .db $7C
  $9AAA  1C        .db $1C
  $9AAB  00        BRK
  $9AAC  00        BRK
  $9AAD  00        BRK
  $9AAE  00        BRK
  $9AAF  00        BRK

L_9AB0:
  $9AB0  FF        .db $FF
  $9AB1  FF        .db $FF
  $9AB2  FF        .db $FF
  $9AB3  FF        .db $FF
  $9AB4  7F        .db $7F
  $9AB5  1F        .db $1F
  $9AB6  3F        .db $3F
  $9AB7  7F        .db $7F
  $9AB8  FF        .db $FF
  $9AB9  FB        .db $FB
  $9ABA  FD 7E 07  SBC $077E,X
  $9ABD  0F        .db $0F
  $9ABE  03        .db $03
  $9ABF  00        BRK
  $9AC0  F9 FD FE  SBC $FEFD,Y
  $9AC3  FE FF FF  INC $FFFF,X
  $9AC6  FF        .db $FF
  $9AC7  FF        .db $FF
  $9AC8  F6 F6     INC $F6,X
  $9ACA  CC 38 F8  CPY $F838
  $9ACD  E0 C0     CPX #$C0
  $9ACF  00        BRK
  $9AD0  00        BRK
  $9AD1  00        BRK
  $9AD2  00        BRK
  $9AD3  00        BRK
  $9AD4  00        BRK
  $9AD5  80        .db $80
  $9AD6  C0 F0     CPY #$F0
  $9AD8  00        BRK
  $9AD9  00        BRK
  $9ADA  00        BRK
  $9ADB  00        BRK
  $9ADC  00        BRK
  $9ADD  00        BRK
  $9ADE  00        BRK
  $9ADF  00        BRK
  $9AE0  4F        .db $4F
  $9AE1  43        .db $43
  $9AE2  40        RTI
  $9AE3  20 38 7E  JSR $7E38
  $9AE6  FF        .db $FF
  $9AE7  FF        .db $FF
  $9AE8  30 3C     BMI $9B26
  $9AEA  3F        .db $3F
  $9AEB  1F        .db $1F
  $9AEC  07        .db $07
  $9AED  3F        .db $3F
  $9AEE  7F        .db $7F
  $9AEF  00        BRK
  $9AF0  87        .db $87
  $9AF1  01 80     ORA ($80,X)
  $9AF3  40        RTI
  $9AF4  40        RTI
  $9AF5  40        RTI
  $9AF6  E0 E0     CPX #$E0
  $9AF8  00        BRK
  $9AF9  00        BRK
  $9AFA  00        BRK
  $9AFB  80        .db $80
  $9AFC  80        .db $80
  $9AFD  80        .db $80
  $9AFE  C0 00     CPY #$00
  $9B00  C4 82     CPY $82
  $9B02  81 81     STA ($81,X)
  $9B04  43        .db $43
  $9B05  47        .db $47
  $9B06  7F        .db $7F
  $9B07  3F        .db $3F

L_9B08:
  $9B08  38        SEC
  $9B09  7C        .db $7C
  $9B0A  7E 7E 3F  ROR $3F7E,X
  $9B0D  3F        .db $3F
  $9B0E  3F        .db $3F
  $9B0F  00        BRK
  $9B10  00        BRK
  $9B11  00        BRK
  $9B12  00        BRK
  $9B13  00        BRK
  $9B14  C0 E0     CPY #$E0
  $9B16  F0 F0     BEQ $9B08
  $9B18  00        BRK
  $9B19  00        BRK
  $9B1A  00        BRK
  $9B1B  00        BRK
  $9B1C  00        BRK
  $9B1D  C0 E0     CPY #$E0
  $9B1F  00        BRK
  $9B20  FF        .db $FF
  $9B21  FF        .db $FF
  $9B22  FF        .db $FF
  $9B23  FF        .db $FF
  $9B24  7F        .db $7F
  $9B25  3F        .db $3F

L_9B26:
  $9B26  0F        .db $0F
  $9B27  07        .db $07
  $9B28  FF        .db $FF
  $9B29  FB        .db $FB
  $9B2A  FD 7E 07  SBC $077E,X
  $9B2D  0F        .db $0F
  $9B2E  03        .db $03
  $9B2F  00        BRK
  $9B30  F9 FD FF  SBC $FFFD,Y
  $9B33  FF        .db $FF
  $9B34  FF        .db $FF
  $9B35  FF        .db $FF
  $9B36  FF        .db $FF
  $9B37  FC        .db $FC
  $9B38  F6 F6     INC $F6,X
  $9B3A  CC 38 F8  CPY $F838
  $9B3D  E0 C0     CPX #$C0
  $9B3F  00        BRK
  $9B40  00        BRK
  $9B41  00        BRK
  $9B42  E0 F8     CPX #$F8
  $9B44  FC        .db $FC
  $9B45  F4        .db $F4
  $9B46  E2        .db $E2
  $9B47  42        .db $42

L_9B48:
  $9B48  00        BRK
  $9B49  00        BRK
  $9B4A  00        BRK
  $9B4B  00        BRK
  $9B4C  00        BRK
  $9B4D  08        PHP
  $9B4E  1C        .db $1C
  $9B4F  3C        .db $3C
  $9B50  1F        .db $1F
  $9B51  1F        .db $1F
  $9B52  3F        .db $3F
  $9B53  3F        .db $3F
  $9B54  3C        .db $3C
  $9B55  20 10 08  JSR $0810
  $9B58  00        BRK
  $9B59  00        BRK
  $9B5A  00        BRK
  $9B5B  00        BRK
  $9B5C  03        .db $03
  $9B5D  1F        .db $1F
  $9B5E  0F        .db $0F
  $9B5F  07        .db $07
  $9B60  E0 81     CPX #$81
  $9B62  01 03     ORA ($03,X)
  $9B64  81 40     STA ($40,X)
  $9B66  20 60 00  JSR $0060
  $9B69  00        BRK
  $9B6A  00        BRK
  $9B6B  01 00     ORA ($00,X)
  $9B6D  80        .db $80
  $9B6E  C0 C0     CPY #$C0
  $9B70  84 04     STY $04
  $9B72  0C        .db $0C
  $9B73  3E FF FF  ROL $FFFF,X
  $9B76  3E 00 78  ROL $7800,X
  $9B79  F8        SED
  $9B7A  F0 CC     BEQ $9B48
  $9B7C  FE 3E 00  INC $003E,X
  $9B7F  00        BRK
  $9B80  7E FC FC  ROR $FCFC,X
  $9B83  F8        SED
  $9B84  70 00     BVS $9B86

L_9B86:
  $9B86  00        BRK
  $9B87  00        BRK
  $9B88  0C        .db $0C
  $9B89  78        SEI
  $9B8A  78        SEI
  $9B8B  70 00     BVS $9B8D

L_9B8D:
  $9B8D  00        BRK
  $9B8E  00        BRK
  $9B8F  00        BRK
  $9B90  00        BRK
  $9B91  00        BRK
  $9B92  00        BRK
  $9B93  40        RTI
  $9B94  F1 01     SBC ($01),Y

L_9B96:
  $9B96  03        .db $03
  $9B97  7C        .db $7C
  $9B98  06 03     ASL $03
  $9B9A  33        .db $33
  $9B9B  4E F1 79  LSR $79F1
  $9B9E  03        .db $03
  $9B9F  7C        .db $7C
  $9BA0  1B        .db $1B
  $9BA1  3F        .db $3F
  $9BA2  3F        .db $3F
  $9BA3  1F        .db $1F

L_9BA4:
  $9BA4  1F        .db $1F
  $9BA5  08        PHP
  $9BA6  16 2C     ASL $2C,X
  $9BA8  00        BRK
  $9BA9  13        .db $13
  $9BAA  1F        .db $1F
  $9BAB  0F        .db $0F
  $9BAC  00        BRK
  $9BAD  07        .db $07
  $9BAE  0F        .db $0F
  $9BAF  1F        .db $1F
  $9BB0  C0 E0     CPY #$E0
  $9BB2  F0 F0     BEQ $9BA4
  $9BB4  F0 E0     BEQ $9B96
  $9BB6  60        RTS
  $9BB7  20 00 C0  JSR $C000
  $9BBA  E0 E0     CPX #$E0
  $9BBC  E0 40     CPX #$40

L_9BBE:
  $9BBE  80        .db $80
  $9BBF  C0 48     CPY #$48
  $9BC1  80        .db $80
  $9BC2  80        .db $80
  $9BC3  F3        .db $F3
  $9BC4  FF        .db $FF
  $9BC5  79 71 31  ADC $3171,Y
  $9BC8  3F        .db $3F
  $9BC9  7F        .db $7F
  $9BCA  7F        .db $7F
  $9BCB  0C        .db $0C
  $9BCC  70 36     BVS $9C04
  $9BCE  2E 0E 5F  ROL $5F0E
  $9BD1  60        RTS
  $9BD2  B0 67     BCS $9C3B
  $9BD4  4F        .db $4F
  $9BD5  13        .db $13
  $9BD6  F9 99 80  SBC $8099,Y
  $9BD9  9F        .db $9F
  $9BDA  7F        .db $7F
  $9BDB  F8        SED
  $9BDC  F0 E0     BEQ $9BBE
  $9BDE  00        BRK
  $9BDF  00        BRK
  $9BE0  00        BRK
  $9BE1  00        BRK
  $9BE2  00        BRK
  $9BE3  00        BRK
  $9BE4  00        BRK
  $9BE5  00        BRK
  $9BE6  00        BRK
  $9BE7  00        BRK
  $9BE8  00        BRK
  $9BE9  00        BRK
  $9BEA  00        BRK
  $9BEB  00        BRK
  $9BEC  00        BRK
  $9BED  00        BRK
  $9BEE  00        BRK
  $9BEF  00        BRK
  $9BF0  1F        .db $1F
  $9BF1  07        .db $07
  $9BF2  00        BRK
  $9BF3  00        BRK
  $9BF4  00        BRK
  $9BF5  00        BRK
  $9BF6  00        BRK
  $9BF7  00        BRK
  $9BF8  07        .db $07
  $9BF9  00        BRK
  $9BFA  00        BRK
  $9BFB  00        BRK
  $9BFC  00        BRK
  $9BFD  00        BRK
  $9BFE  00        BRK
  $9BFF  00        BRK
  $9C00  00        BRK
  $9C01  01 03     ORA ($03,X)
  $9C03  0F        .db $0F

L_9C04:
  $9C04  30 40     BMI $9C46
  $9C06  80        .db $80
  $9C07  30 00     BMI $9C09

L_9C09:
  $9C09  00        BRK
  $9C0A  01 00     ORA ($00,X)
  $9C0C  0F        .db $0F
  $9C0D  3F        .db $3F
  $9C0E  63        .db $63
  $9C0F  C3        .db $C3
  $9C10  FE 84 3F  INC $3F84,X
  $9C13  FF        .db $FF
  $9C14  7F        .db $7F
  $9C15  7E FF FF  ROR $FFFF,X

L_9C18:
  $9C18  00        BRK
  $9C19  F8        SED
  $9C1A  C0 1E     CPY #$1E
  $9C1C  BE B8 7E  LDX $7EB8,Y
  $9C1F  78        SEI
  $9C20  B1 81     LDA ($81),Y
  $9C22  01 83     ORA ($83,X)
  $9C24  7F        .db $7F
  $9C25  3F        .db $3F
  $9C26  1E 0E 02  ASL $020E,X
  $9C29  06 CE     ASL $CE
  $9C2B  7F        .db $7F
  $9C2C  3F        .db $3F
  $9C2D  1C        .db $1C
  $9C2E  05 01     ORA $01
  $9C30  FE FE FE  INC $FEFE,X
  $9C33  FE FA FC  INC $FCFA,X
  $9C36  F0 E0     BEQ $9C18

L_9C38:
  $9C38  FC        .db $FC
  $9C39  F0 00     BEQ $9C3B

L_9C3B:
  $9C3B  F4        .db $F4
  $9C3C  F4        .db $F4
  $9C3D  70 60     BVS $9C9F
  $9C3F  00        BRK
  $9C40  FE 84 08  INC $0884,X
  $9C43  FC        .db $FC
  $9C44  1E 7F FF  ASL $FF7F,X
  $9C47  FF        .db $FF
  $9C48  00        BRK
  $9C49  F8        SED
  $9C4A  F0 00     BEQ $9C4C

L_9C4C:
  $9C4C  E0 9E     CPX #$9E
  $9C4E  3C        .db $3C
  $9C4F  7E FE FE  ROR $FEFE,X
  $9C52  FE FE FA  INC $FAFE,X
  $9C55  FC        .db $FC

L_9C56:
  $9C56  F0 E0     BEQ $9C38

L_9C58:
  $9C58  70 FC     BVS $9C56
  $9C5A  78        SEI
  $9C5B  84 F4     STY $F4
  $9C5D  70 60     BVS $9CBF
  $9C5F  00        BRK
  $9C60  B1 81     LDA ($81),Y
  $9C62  01 83     ORA ($83,X)
  $9C64  7F        .db $7F
  $9C65  3E 1E 07  ROL $071E,X
  $9C68  02        .db $02
  $9C69  06 CE     ASL $CE
  $9C6B  7F        .db $7F
  $9C6C  3C        .db $3C
  $9C6D  1D 05 00  ORA $0005,X
  $9C70  FE FE FE  INC $FEFE,X
  $9C73  FE FA FC  INC $FCFA,X

L_9C76:
  $9C76  F0 E0     BEQ $9C58
  $9C78  70 FC     BVS $9C76
  $9C7A  78        SEI
  $9C7B  84 74     STY $74
  $9C7D  70 60     BVS $9CDF
  $9C7F  00        BRK
  $9C80  0F        .db $0F
  $9C81  30 40     BMI $9CC3
  $9C83  80        .db $80
  $9C84  80        .db $80
  $9C85  80        .db $80
  $9C86  C3        .db $C3
  $9C87  7F        .db $7F
  $9C88  00        BRK
  $9C89  0F        .db $0F
  $9C8A  3F        .db $3F
  $9C8B  7F        .db $7F
  $9C8C  7F        .db $7F

L_9C8D:
  $9C8D  7F        .db $7F
  $9C8E  7F        .db $7F

L_9C8F:
  $9C8F  3F        .db $3F
  $9C90  C0 E0     CPY #$E0
  $9C92  F0 78     BEQ $9D0C
  $9C94  78        SEI
  $9C95  78        SEI
  $9C96  F8        SED
  $9C97  F0 00     BEQ $9C99

L_9C99:
  $9C99  C0 E0     CPY #$E0
  $9C9B  F0 F0     BEQ $9C8D
  $9C9D  F0 F0     BEQ $9C8F

L_9C9F:
  $9C9F  E0 3F     CPX #$3F
  $9CA1  0F        .db $0F
  $9CA2  00        BRK
  $9CA3  00        BRK
  $9CA4  00        BRK
  $9CA5  00        BRK
  $9CA6  00        BRK
  $9CA7  00        BRK
  $9CA8  0F        .db $0F
  $9CA9  00        BRK
  $9CAA  00        BRK
  $9CAB  00        BRK
  $9CAC  00        BRK
  $9CAD  00        BRK
  $9CAE  00        BRK
  $9CAF  00        BRK
  $9CB0  E0 80     CPX #$80
  $9CB2  00        BRK
  $9CB3  00        BRK
  $9CB4  00        BRK
  $9CB5  00        BRK
  $9CB6  00        BRK
  $9CB7  00        BRK
  $9CB8  80        .db $80
  $9CB9  00        BRK
  $9CBA  00        BRK
  $9CBB  00        BRK
  $9CBC  00        BRK
  $9CBD  00        BRK
  $9CBE  00        BRK

L_9CBF:
  $9CBF  00        BRK
  $9CC0  00        BRK
  $9CC1  40        RTI
  $9CC2  C0 C0     CPY #$C0
  $9CC4  C0 00     CPY #$00
  $9CC6  00        BRK
  $9CC7  00        BRK
  $9CC8  07        .db $07
  $9CC9  03        .db $03
  $9CCA  53        .db $53
  $9CCB  DE 0C 00  DEC $000C,X
  $9CCE  00        BRK
  $9CCF  00        BRK
  $9CD0  0E 3A 43  ASL $433A
  $9CD3  E7        .db $E7
  $9CD4  EE 8F 7E  INC $7E8F
  $9CD7  3C        .db $3C
  $9CD8  00        BRK
  $9CD9  0C        .db $0C
  $9CDA  3C        .db $3C
  $9CDB  7B        .db $7B
  $9CDC  B7        .db $B7
  $9CDD  76 38     ROR $38,X

L_9CDF:
  $9CDF  00        BRK
  $9CE0  0E 3A 46  ASL $463A
  $9CE3  E1 E7     SBC ($E7,X)
  $9CE5  8F        .db $8F

L_9CE6:
  $9CE6  7F        .db $7F
  $9CE7  3E 00 0C  ROL $0C00,X
  $9CEA  38        SEC
  $9CEB  7E B8 76  ROR $76B8,X
  $9CEE  3A        .db $3A
  $9CEF  00        BRK
  $9CF0  00        BRK
  $9CF1  00        BRK
  $9CF2  00        BRK
  $9CF3  07        .db $07
  $9CF4  19 22 42  ORA $4222,Y
  $9CF7  41 00     EOR ($00,X)
  $9CF9  00        BRK
  $9CFA  00        BRK
  $9CFB  00        BRK
  $9CFC  06 1C     ASL $1C
  $9CFE  3C        .db $3C
  $9CFF  3E 01 21  ROL $2101,X
  $9D02  41 00     EOR ($00,X)
  $9D04  B0 E0     BCS $9CE6
  $9D06  C0 00     CPY #$00
  $9D08  00        BRK
  $9D09  3C        .db $3C
  $9D0A  7F        .db $7F
  $9D0B  7F        .db $7F

L_9D0C:
  $9D0C  FF        .db $FF
  $9D0D  FF        .db $FF
  $9D0E  FF        .db $FF
  $9D0F  7F        .db $7F
  $9D10  FF        .db $FF
  $9D11  E1 C0     SBC ($C0,X)
  $9D13  C0 C0     CPY #$C0
  $9D15  70 00     BVS $9D17

L_9D17:
  $9D17  00        BRK
  $9D18  00        BRK
  $9D19  3F        .db $3F
  $9D1A  7F        .db $7F
  $9D1B  FF        .db $FF
  $9D1C  FF        .db $FF
  $9D1D  FF        .db $FF
  $9D1E  FF        .db $FF
  $9D1F  FF        .db $FF
  $9D20  FF        .db $FF
  $9D21  FF        .db $FF
  $9D22  6F        .db $6F
  $9D23  41 41     EOR ($41,X)
  $9D25  00        BRK
  $9D26  00        BRK
  $9D27  00        BRK
  $9D28  00        BRK
  $9D29  00        BRK
  $9D2A  B9 FF FF  LDA $FFFF,Y
  $9D2D  FF        .db $FF
  $9D2E  FF        .db $FF
  $9D2F  FF        .db $FF
  $9D30  00        BRK
  $9D31  00        BRK
  $9D32  00        BRK
  $9D33  11 8A     ORA ($8A),Y
  $9D35  04        .db $04
  $9D36  01 02     ORA ($02,X)
  $9D38  00        BRK
  $9D39  00        BRK
  $9D3A  C0 F1     CPY #$F1
  $9D3C  FB        .db $FB
  $9D3D  FF        .db $FF
  $9D3E  FF        .db $FF
  $9D3F  FE 00 00  INC $0000,X
  $9D42  43        .db $43
  $9D43  64        .db $64
  $9D44  3C        .db $3C
  $9D45  1E 01 00  ASL $0001,X
  $9D48  7F        .db $7F
  $9D49  7F        .db $7F
  $9D4A  7F        .db $7F
  $9D4B  7F        .db $7F
  $9D4C  3F        .db $3F
  $9D4D  1F        .db $1F
  $9D4E  01 00     ORA ($00,X)
  $9D50  00        BRK
  $9D51  00        BRK
  $9D52  1C        .db $1C
  $9D53  30 30     BMI $9D85
  $9D55  1C        .db $1C
  $9D56  3F        .db $3F
  $9D57  7F        .db $7F
  $9D58  FF        .db $FF
  $9D59  FF        .db $FF
  $9D5A  FF        .db $FF
  $9D5B  FF        .db $FF
  $9D5C  FF        .db $FF
  $9D5D  FF        .db $FF

L_9D5E:
  $9D5E  F9 00 00  SBC $0000,Y
  $9D61  0E 11 30  ASL $3011
  $9D64  30 78     BMI $9DDE
  $9D66  FF        .db $FF
  $9D67  F8        SED
  $9D68  FF        .db $FF
  $9D69  FF        .db $FF
  $9D6A  FF        .db $FF
  $9D6B  FF        .db $FF
  $9D6C  FF        .db $FF
  $9D6D  FF        .db $FF
  $9D6E  E7        .db $E7
  $9D6F  00        BRK
  $9D70  02        .db $02
  $9D71  14        .db $14
  $9D72  1C        .db $1C
  $9D73  18        CLC
  $9D74  30 60     BMI $9DD6
  $9D76  80        .db $80
  $9D77  00        BRK
  $9D78  FE FC FC  INC $FCFC,X
  $9D7B  F8        SED
  $9D7C  F0 E0     BEQ $9D5E
  $9D7E  80        .db $80
  $9D7F  00        BRK
  $9D80  2F        .db $2F
  $9D81  3F        .db $3F
  $9D82  02        .db $02
  $9D83  FF        .db $FF
  $9D84  FF        .db $FF

L_9D85:
  $9D85  01 00     ORA ($00,X)
  $9D87  00        BRK
  $9D88  1F        .db $1F
  $9D89  00        BRK
  $9D8A  01 FD     ORA ($FD,X)
  $9D8C  01 00     ORA ($00,X)
  $9D8E  00        BRK
  $9D8F  00        BRK
  $9D90  04        .db $04
  $9D91  FC        .db $FC
  $9D92  40        RTI
  $9D93  40        RTI
  $9D94  40        RTI
  $9D95  80        .db $80
  $9D96  00        BRK
  $9D97  00        BRK
  $9D98  F8        SED
  $9D99  00        BRK
  $9D9A  80        .db $80
  $9D9B  80        .db $80
  $9D9C  80        .db $80
  $9D9D  00        BRK
  $9D9E  00        BRK
  $9D9F  00        BRK
  $9DA0  2F        .db $2F
  $9DA1  3F        .db $3F
  $9DA2  02        .db $02
  $9DA3  02        .db $02
  $9DA4  02        .db $02
  $9DA5  01 00     ORA ($00,X)
  $9DA7  00        BRK
  $9DA8  1F        .db $1F
  $9DA9  00        BRK
  $9DAA  01 01     ORA ($01,X)
  $9DAC  01 00     ORA ($00,X)
  $9DAE  00        BRK
  $9DAF  00        BRK
  $9DB0  04        .db $04
  $9DB1  FC        .db $FC
  $9DB2  40        RTI
  $9DB3  FF        .db $FF
  $9DB4  FF        .db $FF
  $9DB5  80        .db $80
  $9DB6  00        BRK
  $9DB7  00        BRK
  $9DB8  F8        SED
  $9DB9  00        BRK
  $9DBA  80        .db $80
  $9DBB  BF        .db $BF
  $9DBC  80        .db $80
  $9DBD  00        BRK
  $9DBE  00        BRK
  $9DBF  00        BRK
  $9DC0  01 03     ORA ($03,X)
  $9DC2  07        .db $07
  $9DC3  0F        .db $0F
  $9DC4  1F        .db $1F
  $9DC5  3D 78 E0  AND $E078,X
  $9DC8  01 03     ORA ($03,X)
  $9DCA  07        .db $07
  $9DCB  0F        .db $0F
  $9DCC  1C        .db $1C
  $9DCD  38        SEC
  $9DCE  60        RTS
  $9DCF  80        .db $80
  $9DD0  00        BRK
  $9DD1  00        BRK
  $9DD2  00        BRK
  $9DD3  00        BRK
  $9DD4  00        BRK
  $9DD5  03        .db $03

L_9DD6:
  $9DD6  07        .db $07
  $9DD7  8F        .db $8F
  $9DD8  00        BRK
  $9DD9  00        BRK
  $9DDA  00        BRK
  $9DDB  00        BRK
  $9DDC  00        BRK
  $9DDD  02        .db $02

L_9DDE:
  $9DDE  06 0E     ASL $0E
  $9DE0  9F        .db $9F
  $9DE1  BF        .db $BF
  $9DE2  FF        .db $FF
  $9DE3  FE F8 E0  INC $E0F8,X
  $9DE6  80        .db $80
  $9DE7  00        BRK
  $9DE8  1E 3E FE  ASL $FE3E,X
  $9DEB  F8        SED
  $9DEC  E0 80     CPX #$80
  $9DEE  00        BRK
  $9DEF  00        BRK
  $9DF0  00        BRK
  $9DF1  00        BRK
  $9DF2  00        BRK
  $9DF3  00        BRK
  $9DF4  00        BRK
  $9DF5  00        BRK
  $9DF6  91 7F     STA ($7F),Y
  $9DF8  00        BRK
  $9DF9  00        BRK
  $9DFA  47        .db $47
  $9DFB  EF        .db $EF
  $9DFC  93        .db $93
  $9DFD  93        .db $93
  $9DFE  FF        .db $FF
  $9DFF  7F        .db $7F
  $9E00  00        BRK
  $9E01  00        BRK
  $9E02  00        BRK
  $9E03  01 03     ORA ($03,X)
  $9E05  07        .db $07
  $9E06  0F        .db $0F
  $9E07  1F        .db $1F
  $9E08  00        BRK
  $9E09  00        BRK
  $9E0A  00        BRK
  $9E0B  01 03     ORA ($03,X)
  $9E0D  07        .db $07
  $9E0E  0F        .db $0F
  $9E0F  1C        .db $1C
  $9E10  03        .db $03
  $9E11  07        .db $07
  $9E12  8F        .db $8F
  $9E13  9F        .db $9F
  $9E14  BF        .db $BF
  $9E15  FF        .db $FF
  $9E16  FF        .db $FF
  $9E17  FD 02 06  SBC $0602,X
  $9E1A  0E 1E 38  ASL $381E
  $9E1D  F5 4D     SBC $4D,X
  $9E1F  38        SEC
  $9E20  00        BRK
  $9E21  00        BRK
  $9E22  00        BRK
  $9E23  00        BRK
  $9E24  07        .db $07
  $9E25  98        TYA
  $9E26  E6 CC     INC $CC
  $9E28  00        BRK
  $9E29  00        BRK
  $9E2A  00        BRK
  $9E2B  00        BRK
  $9E2C  00        BRK
  $9E2D  07        .db $07
  $9E2E  9F        .db $9F

L_9E2F:
  $9E2F  FF        .db $FF
  $9E30  00        BRK
  $9E31  00        BRK
  $9E32  00        BRK
  $9E33  00        BRK
  $9E34  98        TYA
  $9E35  78        SEI
  $9E36  38        SEC
  $9E37  78        SEI
  $9E38  00        BRK
  $9E39  00        BRK
  $9E3A  00        BRK
  $9E3B  00        BRK
  $9E3C  00        BRK
  $9E3D  90 F0     BCC $9E2F
  $9E3F  F0 3D     BEQ $9E7E
  $9E41  79 E1 81  ADC $81E1,Y
  $9E44  01 00     ORA ($00,X)
  $9E46  00        BRK
  $9E47  00        BRK
  $9E48  38        SEC
  $9E49  60        RTS
  $9E4A  80        .db $80
  $9E4B  00        BRK
  $9E4C  00        BRK
  $9E4D  00        BRK

L_9E4E:
  $9E4E  00        BRK
  $9E4F  00        BRK
  $9E50  9D 04 45  STA $4504,X
  $9E53  4F        .db $4F
  $9E54  4E 9E 9D  LSR $9D9E
  $9E57  7D 60 F8  ADC $F860,X
  $9E5A  F8        SED
  $9E5B  F0 F1     BEQ $9E4E
  $9E5D  61 62     ADC ($62,X)
  $9E5F  02        .db $02
  $9E60  EB        .db $EB
  $9E61  D4        .db $D4
  $9E62  88        DEY
  $9E63  B6 B6     LDX $B6,Y
  $9E65  80        .db $80
  $9E66  C0 FF     CPY #$FF
  $9E68  9C        .db $9C
  $9E69  08        PHP
  $9E6A  00        BRK
  $9E6B  00        BRK
  $9E6C  00        BRK
  $9E6D  00        BRK
  $9E6E  00        BRK
  $9E6F  80        .db $80
  $9E70  B8        CLV
  $9E71  48        PHA
  $9E72  67        .db $67
  $9E73  6D 6D 7F  ADC $7F6D
  $9E76  7B        .db $7B
  $9E77  F3        .db $F3
  $9E78  60        RTS
  $9E79  30 58     BMI $9ED3
  $9E7B  5B        .db $5B
  $9E7C  5B        .db $5B
  $9E7D  02        .db $02

L_9E7E:
  $9E7E  26 6E     ROL $6E
  $9E80  00        BRK
  $9E81  00        BRK
  $9E82  00        BRK
  $9E83  C0 F0     CPY #$F0
  $9E85  FC        .db $FC
  $9E86  E2        .db $E2
  $9E87  C6 00     DEC $00
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  00        BRK
  $9E8C  00        BRK
  $9E8D  00        BRK
  $9E8E  1C        .db $1C
  $9E8F  3C        .db $3C
  $9E90  1D 02 01  ORA $0102,X
  $9E93  00        BRK
  $9E94  00        BRK
  $9E95  00        BRK
  $9E96  00        BRK
  $9E97  00        BRK
  $9E98  02        .db $02
  $9E99  01 00     ORA ($00,X)
  $9E9B  00        BRK
  $9E9C  00        BRK
  $9E9D  00        BRK
  $9E9E  00        BRK
  $9E9F  00        BRK
  $9EA0  FF        .db $FF
  $9EA1  FF        .db $FF
  $9EA2  7F        .db $7F
  $9EA3  80        .db $80
  $9EA4  7F        .db $7F
  $9EA5  2E 2E 2E  ROL $2E2E
  $9EA8  FF        .db $FF
  $9EA9  7F        .db $7F
  $9EAA  80        .db $80
  $9EAB  7F        .db $7F
  $9EAC  00        BRK
  $9EAD  1F        .db $1F
  $9EAE  1F        .db $1F
  $9EAF  1F        .db $1F
  $9EB0  E3        .db $E3
  $9EB1  C2        .db $C2
  $9EB2  05 0B     ORA $0B
  $9EB4  F3        .db $F3
  $9EB5  33        .db $33
  $9EB6  31 30     AND ($30),Y
  $9EB8  DE 3C F8  DEC $F83C,X
  $9EBB  F1 01     SBC ($01),Y
  $9EBD  C1 C0     CMP ($C0,X)
  $9EBF  C0 4E     CPY #$4E
  $9EC1  9A        TXS
  $9EC2  E2        .db $E2
  $9EC3  F4        .db $F4
  $9EC4  F8        SED
  $9EC5  F8        SED
  $9EC6  F0 00     BEQ $9EC8

L_9EC8:
  $9EC8  3C        .db $3C
  $9EC9  7C        .db $7C
  $9ECA  DC        .db $DC
  $9ECB  E8        INX
  $9ECC  F0 70     BEQ $9F3E
  $9ECE  00        BRK
  $9ECF  00        BRK
  $9ED0  00        BRK
  $9ED1  00        BRK
  $9ED2  00        BRK

L_9ED3:
  $9ED3  00        BRK
  $9ED4  00        BRK
  $9ED5  01 03     ORA ($03,X)
  $9ED7  07        .db $07
  $9ED8  00        BRK
  $9ED9  00        BRK
  $9EDA  00        BRK
  $9EDB  00        BRK
  $9EDC  00        BRK
  $9EDD  01 03     ORA ($03,X)
  $9EDF  07        .db $07
  $9EE0  00        BRK
  $9EE1  00        BRK
  $9EE2  03        .db $03
  $9EE3  07        .db $07
  $9EE4  8F        .db $8F
  $9EE5  9F        .db $9F
  $9EE6  BF        .db $BF
  $9EE7  FF        .db $FF
  $9EE8  00        BRK
  $9EE9  00        BRK
  $9EEA  02        .db $02
  $9EEB  06 0E     ASL $0E
  $9EED  1E 38 F5  ASL $F538,X
  $9EF0  00        BRK
  $9EF1  00        BRK
  $9EF2  00        BRK
  $9EF3  00        BRK
  $9EF4  00        BRK
  $9EF5  00        BRK
  $9EF6  07        .db $07
  $9EF7  98        TYA
  $9EF8  00        BRK
  $9EF9  00        BRK
  $9EFA  00        BRK
  $9EFB  00        BRK
  $9EFC  00        BRK
  $9EFD  00        BRK
  $9EFE  00        BRK
  $9EFF  07        .db $07
  $9F00  00        BRK
  $9F01  00        BRK
  $9F02  00        BRK
  $9F03  00        BRK
  $9F04  00        BRK
  $9F05  00        BRK
  $9F06  98        TYA
  $9F07  78        SEI
  $9F08  00        BRK
  $9F09  00        BRK
  $9F0A  00        BRK
  $9F0B  00        BRK
  $9F0C  00        BRK
  $9F0D  00        BRK
  $9F0E  00        BRK
  $9F0F  90 0F     BCC $9F20
  $9F11  1F        .db $1F
  $9F12  3D 79 E1  AND $E179,X
  $9F15  81 01     STA ($01,X)
  $9F17  00        BRK
  $9F18  0F        .db $0F
  $9F19  1C        .db $1C
  $9F1A  38        SEC
  $9F1B  60        RTS
  $9F1C  80        .db $80
  $9F1D  00        BRK
  $9F1E  00        BRK
  $9F1F  00        BRK

L_9F20:
  $9F20  FF        .db $FF
  $9F21  FD 9D 04  SBC $049D,X
  $9F24  45 4F     EOR $4F
  $9F26  4E 9E 4D  LSR $4D9E
  $9F29  38        SEC
  $9F2A  60        RTS
  $9F2B  F8        SED
  $9F2C  F8        SED
  $9F2D  F0 F1     BEQ $9F20
  $9F2F  61 E6     ADC ($E6,X)
  $9F31  CC EB D4  CPY $D4EB
  $9F34  88        DEY
  $9F35  B6 B6     LDX $B6,Y
  $9F37  80        .db $80
  $9F38  9F        .db $9F
  $9F39  FF        .db $FF

L_9F3A:
  $9F3A  9C        .db $9C
  $9F3B  08        PHP
  $9F3C  00        BRK
  $9F3D  00        BRK

L_9F3E:
  $9F3E  00        BRK
  $9F3F  00        BRK
  $9F40  38        SEC
  $9F41  78        SEI
  $9F42  B8        CLV
  $9F43  48        PHA
  $9F44  67        .db $67
  $9F45  6D 6D 7F  ADC $7F6D
  $9F48  F0 F0     BEQ $9F3A
  $9F4A  60        RTS
  $9F4B  30 58     BMI $9FA5
  $9F4D  5B        .db $5B
  $9F4E  5B        .db $5B
  $9F4F  02        .db $02
  $9F50  00        BRK
  $9F51  00        BRK
  $9F52  00        BRK
  $9F53  00        BRK
  $9F54  C0 F0     CPY #$F0
  $9F56  FC        .db $FC
  $9F57  E2        .db $E2
  $9F58  00        BRK
  $9F59  00        BRK
  $9F5A  00        BRK
  $9F5B  00        BRK
  $9F5C  00        BRK
  $9F5D  00        BRK
  $9F5E  00        BRK
  $9F5F  1C        .db $1C
  $9F60  9D 7D 1D  STA $1D7D,X
  $9F63  02        .db $02
  $9F64  01 00     ORA ($00,X)
  $9F66  00        BRK
  $9F67  00        BRK
  $9F68  62        .db $62
  $9F69  02        .db $02
  $9F6A  02        .db $02
  $9F6B  01 00     ORA ($00,X)
  $9F6D  00        BRK
  $9F6E  00        BRK
  $9F6F  00        BRK
  $9F70  C0 FF     CPY #$FF
  $9F72  FF        .db $FF
  $9F73  FF        .db $FF
  $9F74  7F        .db $7F
  $9F75  80        .db $80
  $9F76  7F        .db $7F
  $9F77  2E 00 80  ROL $8000
  $9F7A  FF        .db $FF
  $9F7B  7F        .db $7F
  $9F7C  80        .db $80
  $9F7D  7F        .db $7F
  $9F7E  00        BRK
  $9F7F  1F        .db $1F
  $9F80  7B        .db $7B
  $9F81  F3        .db $F3
  $9F82  E3        .db $E3
  $9F83  C2        .db $C2
  $9F84  05 0B     ORA $0B
  $9F86  F3        .db $F3
  $9F87  33        .db $33
  $9F88  26 6E     ROL $6E
  $9F8A  DE 3C F8  DEC $F83C,X
  $9F8D  F1 01     SBC ($01),Y
  $9F8F  C1 C6     CMP ($C6,X)
  $9F91  4E 9A E2  LSR $E29A
  $9F94  F4        .db $F4
  $9F95  F8        SED
  $9F96  F8        SED
  $9F97  F0 3C     BEQ $9FD5
  $9F99  3C        .db $3C
  $9F9A  7C        .db $7C
  $9F9B  DC        .db $DC
  $9F9C  E8        INX
  $9F9D  F0 70     BEQ $A00F
  $9F9F  00        BRK
  $9FA0  00        BRK
  $9FA1  00        BRK
  $9FA2  00        BRK
  $9FA3  00        BRK
  $9FA4  00        BRK

L_9FA5:
  $9FA5  00        BRK
  $9FA6  03        .db $03
  $9FA7  03        .db $03
  $9FA8  00        BRK
  $9FA9  00        BRK
  $9FAA  00        BRK
  $9FAB  00        BRK
  $9FAC  00        BRK
  $9FAD  00        BRK
  $9FAE  00        BRK
  $9FAF  01 00     ORA ($00,X)
  $9FB1  00        BRK
  $9FB2  00        BRK
  $9FB3  00        BRK
  $9FB4  00        BRK
  $9FB5  00        BRK
  $9FB6  07        .db $07
  $9FB7  98        TYA
  $9FB8  00        BRK

L_9FB9:
  $9FB9  00        BRK

L_9FBA:
  $9FBA  00        BRK
  $9FBB  00        BRK
  $9FBC  00        BRK
  $9FBD  00        BRK
  $9FBE  00        BRK
  $9FBF  07        .db $07
  $9FC0  03        .db $03
  $9FC1  01 01     ORA ($01,X)
  $9FC3  00        BRK
  $9FC4  01 03     ORA ($03,X)
  $9FC6  06 0E     ASL $0E
  $9FC8  01 00     ORA ($00,X)
  $9FCA  00        BRK
  $9FCB  00        BRK
  $9FCC  00        BRK
  $9FCD  00        BRK
  $9FCE  01 01     ORA ($01,X)
  $9FD0  01 01     ORA ($01,X)
  $9FD2  03        .db $03

L_9FD3:
  $9FD3  07        .db $07
  $9FD4  0F        .db $0F

L_9FD5:
  $9FD5  0F        .db $0F
  $9FD6  0F        .db $0F
  $9FD7  07        .db $07
  $9FD8  00        BRK
  $9FD9  00        BRK
  $9FDA  00        BRK
  $9FDB  03        .db $03
  $9FDC  07        .db $07
  $9FDD  07        .db $07
  $9FDE  07        .db $07
  $9FDF  00        BRK
  $9FE0  0D 1D 3D  ORA $3D1D
  $9FE3  4E A5 64  LSR $64A5
  $9FE6  44        .db $44
  $9FE7  C8        INY
  $9FE8  02        .db $02
  $9FE9  02        .db $02
  $9FEA  02        .db $02
  $9FEB  31 78     AND ($78),Y
  $9FED  F8        SED
  $9FEE  F8        SED
  $9FEF  30 C8     BMI $9FB9
  $9FF1  F0 E0     BEQ $9FD3
  $9FF3  E0 40     CPX #$40
  $9FF5  00        BRK
  $9FF6  00        BRK
  $9FF7  00        BRK
  $9FF8  B0 C0     BCS $9FBA
  $9FFA  40        RTI
  $9FFB  40        RTI
  $9FFC  00        BRK
  $9FFD  00        BRK
  $9FFE  00        BRK
  $9FFF  00        BRK
  $A000  FF        .db $FF
  $A001  C3        .db $C3
  $A002  FF        .db $FF
  $A003  7F        .db $7F
  $A004  65 65     ADC $65
  $A006  65 65     ADC $65
  $A008  FF        .db $FF
  $A009  FC        .db $FC
  $A00A  FF        .db $FF

L_A00B:
  $A00B  7F        .db $7F
  $A00C  7A        .db $7A
  $A00D  7A        .db $7A
  $A00E  7A        .db $7A

L_A00F:
  $A00F  7A        .db $7A
  $A010  67        .db $67
  $A011  67        .db $67
  $A012  6B        .db $6B
  $A013  77        .db $77
  $A014  77        .db $77
  $A015  77        .db $77
  $A016  73        .db $73
  $A017  69 7B     ADC #$7B
  $A019  7C        .db $7C
  $A01A  78        SEI
  $A01B  70 70     BVS $A08D
  $A01D  70 70     BVS $A08F
  $A01F  60        RTS
  $A020  FF        .db $FF
  $A021  F8        SED
  $A022  FF        .db $FF
  $A023  FF        .db $FF
  $A024  C3        .db $C3
  $A025  CF        .db $CF
  $A026  F7        .db $F7
  $A027  EF        .db $EF
  $A028  FF        .db $FF
  $A029  07        .db $07
  $A02A  FF        .db $FF
  $A02B  FF        .db $FF
  $A02C  3F        .db $3F
  $A02D  3D 30 E0  AND $E030,X
  $A030  CF        .db $CF
  $A031  CF        .db $CF
  $A032  C7        .db $C7
  $A033  F7        .db $F7
  $A034  FF        .db $FF
  $A035  FF        .db $FF
  $A036  FF        .db $FF
  $A037  FF        .db $FF
  $A038  40        RTI
  $A039  40        RTI
  $A03A  00        BRK
  $A03B  00        BRK
  $A03C  00        BRK
  $A03D  00        BRK
  $A03E  00        BRK
  $A03F  00        BRK
  $A040  FF        .db $FF
  $A041  FF        .db $FF
  $A042  DF        .db $DF
  $A043  BF        .db $BF
  $A044  BF        .db $BF
  $A045  7F        .db $7F
  $A046  7F        .db $7F
  $A047  FF        .db $FF
  $A048  FF        .db $FF
  $A049  F0 C0     BEQ $A00B
  $A04B  80        .db $80
  $A04C  80        .db $80
  $A04D  00        BRK
  $A04E  00        BRK
  $A04F  00        BRK
  $A050  FF        .db $FF
  $A051  FF        .db $FF
  $A052  FF        .db $FF
  $A053  FF        .db $FF
  $A054  FB        .db $FB
  $A055  FB        .db $FB
  $A056  F9 FC 00  SBC $00FC,Y
  $A059  00        BRK
  $A05A  00        BRK
  $A05B  00        BRK
  $A05C  00        BRK
  $A05D  00        BRK
  $A05E  00        BRK
  $A05F  00        BRK
  $A060  9F        .db $9F
  $A061  F6 EF     INC $EF,X
  $A063  EF        .db $EF
  $A064  FF        .db $FF
  $A065  FF        .db $FF
  $A066  FF        .db $FF
  $A067  FF        .db $FF
  $A068  9F        .db $9F
  $A069  F0 20     BEQ $A08B
  $A06B  00        BRK
  $A06C  00        BRK
  $A06D  00        BRK
  $A06E  00        BRK
  $A06F  00        BRK
  $A070  FF        .db $FF
  $A071  FF        .db $FF
  $A072  FF        .db $FF
  $A073  FF        .db $FF
  $A074  FF        .db $FF
  $A075  FF        .db $FF
  $A076  FF        .db $FF
  $A077  FE 00 00  INC $0000,X
  $A07A  00        BRK
  $A07B  00        BRK
  $A07C  00        BRK
  $A07D  00        BRK
  $A07E  00        BRK
  $A07F  00        BRK
  $A080  1F        .db $1F
  $A081  FF        .db $FF
  $A082  FF        .db $FF
  $A083  FF        .db $FF
  $A084  FF        .db $FF
  $A085  FF        .db $FF
  $A086  FF        .db $FF
  $A087  FF        .db $FF
  $A088  1F        .db $1F
  $A089  E0 C0     CPX #$C0

L_A08B:
  $A08B  80        .db $80
  $A08C  00        BRK

L_A08D:
  $A08D  00        BRK
  $A08E  00        BRK

L_A08F:
  $A08F  00        BRK
  $A090  FF        .db $FF
  $A091  FF        .db $FF
  $A092  FF        .db $FF
  $A093  FF        .db $FF
  $A094  FF        .db $FF
  $A095  7F        .db $7F
  $A096  7F        .db $7F
  $A097  7F        .db $7F
  $A098  00        BRK
  $A099  00        BRK
  $A09A  00        BRK
  $A09B  00        BRK
  $A09C  00        BRK
  $A09D  00        BRK
  $A09E  00        BRK
  $A09F  00        BRK
  $A0A0  E7        .db $E7
  $A0A1  BD EB F7  LDA $F7EB,X
  $A0A4  F3        .db $F3
  $A0A5  F7        .db $F7
  $A0A6  FF        .db $FF
  $A0A7  FF        .db $FF
  $A0A8  E7        .db $E7
  $A0A9  3C        .db $3C
  $A0AA  08        PHP
  $A0AB  04        .db $04
  $A0AC  00        BRK
  $A0AD  00        BRK
  $A0AE  00        BRK
  $A0AF  00        BRK
  $A0B0  FF        .db $FF
  $A0B1  FF        .db $FF
  $A0B2  FF        .db $FF
  $A0B3  FF        .db $FF
  $A0B4  FF        .db $FF
  $A0B5  FF        .db $FF
  $A0B6  FB        .db $FB
  $A0B7  F3        .db $F3
  $A0B8  00        BRK
  $A0B9  00        BRK
  $A0BA  00        BRK
  $A0BB  00        BRK
  $A0BC  00        BRK
  $A0BD  00        BRK
  $A0BE  00        BRK
  $A0BF  00        BRK
  $A0C0  F9 EF F7  SBC $F7EF,Y
  $A0C3  F7        .db $F7
  $A0C4  FF        .db $FF
  $A0C5  FF        .db $FF
  $A0C6  FF        .db $FF
  $A0C7  FF        .db $FF
  $A0C8  F9 0F 04  SBC $040F,Y
  $A0CB  00        BRK
  $A0CC  00        BRK
  $A0CD  00        BRK
  $A0CE  00        BRK
  $A0CF  00        BRK
  $A0D0  FF        .db $FF
  $A0D1  FF        .db $FF
  $A0D2  FF        .db $FF
  $A0D3  FF        .db $FF
  $A0D4  FF        .db $FF
  $A0D5  FF        .db $FF
  $A0D6  FF        .db $FF
  $A0D7  FF        .db $FF
  $A0D8  00        BRK
  $A0D9  00        BRK
  $A0DA  00        BRK
  $A0DB  00        BRK
  $A0DC  00        BRK
  $A0DD  00        BRK
  $A0DE  00        BRK
  $A0DF  00        BRK
  $A0E0  FF        .db $FF
  $A0E1  FF        .db $FF
  $A0E2  FB        .db $FB
  $A0E3  FD FD FE  SBC $FEFD,X
  $A0E6  FE FF FF  INC $FFFF,X
  $A0E9  0F        .db $0F
  $A0EA  03        .db $03
  $A0EB  01 01     ORA ($01,X)
  $A0ED  00        BRK
  $A0EE  00        BRK
  $A0EF  00        BRK
  $A0F0  FF        .db $FF
  $A0F1  FF        .db $FF
  $A0F2  FF        .db $FF
  $A0F3  FF        .db $FF
  $A0F4  DF        .db $DF
  $A0F5  DF        .db $DF
  $A0F6  9F        .db $9F
  $A0F7  3F        .db $3F
  $A0F8  00        BRK
  $A0F9  00        BRK
  $A0FA  00        BRK
  $A0FB  00        BRK
  $A0FC  00        BRK
  $A0FD  00        BRK
  $A0FE  00        BRK
  $A0FF  00        BRK
  $A100  FF        .db $FF
  $A101  1F        .db $1F
  $A102  FF        .db $FF
  $A103  FF        .db $FF
  $A104  C3        .db $C3
  $A105  F3        .db $F3
  $A106  EF        .db $EF
  $A107  F7        .db $F7
  $A108  FF        .db $FF
  $A109  E0 FF     CPX #$FF
  $A10B  FF        .db $FF
  $A10C  FC        .db $FC
  $A10D  BC 0C 07  LDY $070C,X
  $A110  F3        .db $F3
  $A111  F3        .db $F3
  $A112  E3        .db $E3
  $A113  EF        .db $EF
  $A114  FF        .db $FF
  $A115  FF        .db $FF
  $A116  FF        .db $FF
  $A117  FF        .db $FF
  $A118  02        .db $02
  $A119  02        .db $02
  $A11A  00        BRK
  $A11B  00        BRK
  $A11C  00        BRK
  $A11D  00        BRK
  $A11E  00        BRK
  $A11F  00        BRK
  $A120  FF        .db $FF
  $A121  C3        .db $C3
  $A122  FF        .db $FF
  $A123  FE A6 A6  INC $A6A6,X
  $A126  A6 A6     LDX $A6
  $A128  FF        .db $FF
  $A129  3F        .db $3F
  $A12A  FF        .db $FF
  $A12B  FE 5E 5E  INC $5E5E,X
  $A12E  5E 5E E6  LSR $E65E,X
  $A131  E6 D6     INC $D6
  $A133  EE EE EE  INC $EEEE
  $A136  CE 96 DE  DEC $DE96
  $A139  3E 1E 0E  ROL $0E1E,X
  $A13C  0E 0E 0E  ASL $0E0E
  $A13F  06 FF     ASL $FF
  $A141  FF        .db $FF
  $A142  FF        .db $FF
  $A143  D3        .db $D3
  $A144  E1 F9     SBC ($F9,X)
  $A146  C0 C0     CPY #$C0
  $A148  01 FF     ORA ($FF,X)
  $A14A  FF        .db $FF
  $A14B  5F        .db $5F
  $A14C  FF        .db $FF
  $A14D  7F        .db $7F
  $A14E  FF        .db $FF
  $A14F  7F        .db $7F
  $A150  FC        .db $FC
  $A151  E0 E0     CPX #$E0
  $A153  DE E2 F4  DEC $F4E2,X
  $A156  F9 FF FF  SBC $FFFF,Y
  $A159  7F        .db $7F
  $A15A  FF        .db $FF
  $A15B  5F        .db $5F
  $A15C  E3        .db $E3
  $A15D  07        .db $07
  $A15E  FF        .db $FF
  $A15F  FF        .db $FF
  $A160  CF        .db $CF
  $A161  BF        .db $BF
  $A162  9F        .db $9F
  $A163  8F        .db $8F
  $A164  7E 7F FF  ROR $FF7F,X
  $A167  FF        .db $FF
  $A168  CF        .db $CF
  $A169  FF        .db $FF
  $A16A  FF        .db $FF
  $A16B  FE 7F 47  INC $477F,X
  $A16E  83        .db $83
  $A16F  8D FF BE  STA $BEFF
  $A172  80        .db $80
  $A173  80        .db $80
  $A174  CF        .db $CF
  $A175  D8        CLD
  $A176  E0 3F     CPX #$3F
  $A178  8D C1 FF  STA $FFC1
  $A17B  FF        .db $FF
  $A17C  FF        .db $FF
  $A17D  FF        .db $FF
  $A17E  FF        .db $FF
  $A17F  3F        .db $3F
  $A180  FF        .db $FF
  $A181  FF        .db $FF
  $A182  FF        .db $FF
  $A183  FF        .db $FF
  $A184  C6 CC     DEC $CC
  $A186  DB        .db $DB
  $A187  F7        .db $F7
  $A188  A0 FF     LDY #$FF
  $A18A  FF        .db $FF

L_A18B:
  $A18B  40        RTI
  $A18C  C0 40     CPY #$40
  $A18E  E0 40     CPX #$40
  $A190  EF        .db $EF
  $A191  CF        .db $CF
  $A192  EF        .db $EF
  $A193  DF        .db $DF
  $A194  BF        .db $BF
  $A195  7F        .db $7F
  $A196  7F        .db $7F
  $A197  7F        .db $7F
  $A198  C0 60     CPY #$60
  $A19A  E0 40     CPX #$40
  $A19C  80        .db $80
  $A19D  00        BRK
  $A19E  00        BRK
  $A19F  00        BRK
  $A1A0  FC        .db $FC
  $A1A1  F3        .db $F3
  $A1A2  EF        .db $EF
  $A1A3  DF        .db $DF
  $A1A4  3F        .db $3F
  $A1A5  FF        .db $FF
  $A1A6  FF        .db $FF
  $A1A7  FF        .db $FF
  $A1A8  00        BRK
  $A1A9  F0 E0     BEQ $A18B
  $A1AB  00        BRK
  $A1AC  00        BRK
  $A1AD  00        BRK
  $A1AE  00        BRK
  $A1AF  00        BRK
  $A1B0  FF        .db $FF
  $A1B1  FF        .db $FF
  $A1B2  FF        .db $FF
  $A1B3  FF        .db $FF
  $A1B4  FF        .db $FF
  $A1B5  FF        .db $FF
  $A1B6  FF        .db $FF
  $A1B7  FF        .db $FF
  $A1B8  00        BRK
  $A1B9  00        BRK
  $A1BA  00        BRK
  $A1BB  00        BRK
  $A1BC  00        BRK
  $A1BD  00        BRK
  $A1BE  00        BRK
  $A1BF  00        BRK
  $A1C0  7F        .db $7F
  $A1C1  8F        .db $8F
  $A1C2  F7        .db $F7
  $A1C3  FB        .db $FB
  $A1C4  FC        .db $FC
  $A1C5  FC        .db $FC
  $A1C6  FC        .db $FC
  $A1C7  FB        .db $FB
  $A1C8  20 0F 07  JSR $070F
  $A1CB  00        BRK
  $A1CC  00        BRK
  $A1CD  00        BRK
  $A1CE  00        BRK
  $A1CF  00        BRK
  $A1D0  FF        .db $FF
  $A1D1  FF        .db $FF
  $A1D2  FF        .db $FF
  $A1D3  FF        .db $FF
  $A1D4  FF        .db $FF
  $A1D5  FF        .db $FF
  $A1D6  FF        .db $FF
  $A1D7  FF        .db $FF
  $A1D8  00        BRK
  $A1D9  00        BRK
  $A1DA  00        BRK
  $A1DB  00        BRK
  $A1DC  00        BRK
  $A1DD  00        BRK
  $A1DE  00        BRK
  $A1DF  00        BRK
  $A1E0  FF        .db $FF
  $A1E1  FF        .db $FF
  $A1E2  FF        .db $FF
  $A1E3  FF        .db $FF
  $A1E4  3B        .db $3B
  $A1E5  73        .db $73
  $A1E6  23        .db $23
  $A1E7  DF        .db $DF
  $A1E8  00        BRK
  $A1E9  FF        .db $FF
  $A1EA  FF        .db $FF
  $A1EB  04        .db $04
  $A1EC  03        .db $03
  $A1ED  00        BRK
  $A1EE  1F        .db $1F
  $A1EF  1C        .db $1C
  $A1F0  E3        .db $E3
  $A1F1  F7        .db $F7
  $A1F2  F7        .db $F7
  $A1F3  F3        .db $F3
  $A1F4  F1 FD     SBC ($FD),Y
  $A1F6  FE FE 03  INC $03FE,X
  $A1F9  00        BRK
  $A1FA  07        .db $07
  $A1FB  00        BRK
  $A1FC  01 00     ORA ($00,X)
  $A1FE  00        BRK
  $A1FF  00        BRK
  $A200  5F        .db $5F
  $A201  9F        .db $9F
  $A202  9F        .db $9F
  $A203  8F        .db $8F
  $A204  47        .db $47
  $A205  60        RTS
  $A206  71 7F     ADC ($7F),Y
  $A208  40        RTI
  $A209  80        .db $80
  $A20A  80        .db $80
  $A20B  80        .db $80
  $A20C  40        RTI
  $A20D  60        RTS
  $A20E  70 40     BVS $A250
  $A210  FF        .db $FF
  $A211  BF        .db $BF
  $A212  BF        .db $BF
  $A213  BF        .db $BF
  $A214  9F        .db $9F
  $A215  47        .db $47
  $A216  70 3F     BVS $A257
  $A218  80        .db $80
  $A219  80        .db $80
  $A21A  80        .db $80
  $A21B  80        .db $80
  $A21C  80        .db $80
  $A21D  40        RTI
  $A21E  70 3F     BVS $A25F
  $A220  F7        .db $F7
  $A221  F7        .db $F7
  $A222  E3        .db $E3
  $A223  E0 F8     CPX #$F8
  $A225  FF        .db $FF
  $A226  F1 E7     SBC ($E7),Y
  $A228  00        BRK
  $A229  00        BRK
  $A22A  00        BRK
  $A22B  00        BRK
  $A22C  18        CLC
  $A22D  3F        .db $3F
  $A22E  7F        .db $7F
  $A22F  7F        .db $7F
  $A230  EF        .db $EF
  $A231  CF        .db $CF
  $A232  DF        .db $DF
  $A233  DF        .db $DF
  $A234  FF        .db $FF
  $A235  7C        .db $7C
  $A236  38        SEC
  $A237  31 7F     AND ($7F),Y
  $A239  7F        .db $7F
  $A23A  7F        .db $7F
  $A23B  7F        .db $7F
  $A23C  3F        .db $3F
  $A23D  3C        .db $3C
  $A23E  38        SEC

L_A23F:
  $A23F  30 FE     BMI $A23F
  $A241  FF        .db $FF
  $A242  FE F8 30  INC $30F8,X
  $A245  FE FF FF  INC $FFFF,X
  $A248  02        .db $02
  $A249  03        .db $03
  $A24A  07        .db $07
  $A24B  0F        .db $0F
  $A24C  3F        .db $3F
  $A24D  FF        .db $FF
  $A24E  FF        .db $FF
  $A24F  FF        .db $FF

L_A250:
  $A250  FF        .db $FF
  $A251  FF        .db $FF
  $A252  FF        .db $FF
  $A253  FF        .db $FF
  $A254  0F        .db $0F
  $A255  7F        .db $7F
  $A256  FF        .db $FF

L_A257:
  $A257  FF        .db $FF
  $A258  FF        .db $FF
  $A259  FF        .db $FF
  $A25A  FF        .db $FF
  $A25B  FF        .db $FF
  $A25C  0F        .db $0F
  $A25D  03        .db $03
  $A25E  00        BRK

L_A25F:
  $A25F  00        BRK
  $A260  3F        .db $3F
  $A261  8F        .db $8F
  $A262  FC        .db $FC
  $A263  00        BRK
  $A264  00        BRK
  $A265  00        BRK
  $A266  80        .db $80
  $A267  E0 03     CPX #$03
  $A269  8F        .db $8F

L_A26A:
  $A26A  FF        .db $FF
  $A26B  FF        .db $FF
  $A26C  FF        .db $FF
  $A26D  FF        .db $FF
  $A26E  FF        .db $FF
  $A26F  FF        .db $FF
  $A270  F0 F8     BEQ $A26A
  $A272  FC        .db $FC
  $A273  FC        .db $FC
  $A274  FE FF FF  INC $FFFF,X
  $A277  FF        .db $FF
  $A278  FF        .db $FF
  $A279  FF        .db $FF
  $A27A  FF        .db $FF
  $A27B  FF        .db $FF
  $A27C  FF        .db $FF
  $A27D  FF        .db $FF
  $A27E  FF        .db $FF
  $A27F  7F        .db $7F
  $A280  3F        .db $3F
  $A281  BF        .db $BF
  $A282  9F        .db $9F
  $A283  CF        .db $CF
  $A284  60        RTS
  $A285  38        SEC
  $A286  0F        .db $0F
  $A287  00        BRK
  $A288  00        BRK
  $A289  80        .db $80
  $A28A  80        .db $80
  $A28B  C0 E0     CPY #$E0
  $A28D  F8        SED
  $A28E  FF        .db $FF
  $A28F  FF        .db $FF
  $A290  00        BRK
  $A291  03        .db $03
  $A292  04        .db $04
  $A293  08        PHP
  $A294  18        CLC
  $A295  18        CLC
  $A296  18        CLC
  $A297  9C        .db $9C
  $A298  FF        .db $FF
  $A299  FF        .db $FF
  $A29A  FC        .db $FC
  $A29B  F8        SED
  $A29C  F8        SED
  $A29D  F8        SED
  $A29E  F8        SED
  $A29F  FC        .db $FC
  $A2A0  F3        .db $F3
  $A2A1  F1 E1     SBC ($E1),Y
  $A2A3  C8        INY
  $A2A4  1C        .db $1C
  $A2A5  36 E1     ROL $E1,X
  $A2A7  00        BRK
  $A2A8  00        BRK
  $A2A9  00        BRK
  $A2AA  00        BRK
  $A2AB  08        PHP
  $A2AC  1C        .db $1C
  $A2AD  3E FF FF  ROL $FFFF,X
  $A2B0  00        BRK
  $A2B1  C0 20     CPY #$20
  $A2B3  10 18     BPL $A2CD
  $A2B5  18        CLC
  $A2B6  18        CLC
  $A2B7  39 FF FF  AND $FFFF,Y
  $A2BA  3F        .db $3F
  $A2BB  1F        .db $1F
  $A2BC  1F        .db $1F
  $A2BD  1F        .db $1F

L_A2BE:
  $A2BE  1F        .db $1F
  $A2BF  3F        .db $3F
  $A2C0  FF        .db $FF
  $A2C1  FE FC F1  INC $F1FC,X
  $A2C4  06 0C     ASL $0C
  $A2C6  F1 07     SBC ($07),Y
  $A2C8  00        BRK
  $A2C9  00        BRK
  $A2CA  00        BRK
  $A2CB  01 07     ORA ($07,X)

L_A2CD:
  $A2CD  0F        .db $0F
  $A2CE  FF        .db $FF
  $A2CF  FF        .db $FF
  $A2D0  0F        .db $0F
  $A2D1  1F        .db $1F
  $A2D2  3F        .db $3F
  $A2D3  3F        .db $3F
  $A2D4  7F        .db $7F
  $A2D5  FF        .db $FF
  $A2D6  FF        .db $FF
  $A2D7  FF        .db $FF
  $A2D8  FF        .db $FF
  $A2D9  FF        .db $FF
  $A2DA  FF        .db $FF
  $A2DB  FF        .db $FF
  $A2DC  FF        .db $FF
  $A2DD  FF        .db $FF
  $A2DE  FF        .db $FF
  $A2DF  FE 7F FF  INC $FF7F,X
  $A2E2  7F        .db $7F
  $A2E3  1F        .db $1F
  $A2E4  0C        .db $0C
  $A2E5  7F        .db $7F
  $A2E6  FF        .db $FF
  $A2E7  FF        .db $FF
  $A2E8  40        RTI

L_A2E9:
  $A2E9  C0 E0     CPY #$E0
  $A2EB  F0 FC     BEQ $A2E9
  $A2ED  FF        .db $FF
  $A2EE  FF        .db $FF
  $A2EF  FF        .db $FF
  $A2F0  FF        .db $FF
  $A2F1  FF        .db $FF
  $A2F2  FF        .db $FF
  $A2F3  FF        .db $FF

L_A2F4:
  $A2F4  F0 FE     BEQ $A2F4
  $A2F6  FF        .db $FF
  $A2F7  FF        .db $FF
  $A2F8  FF        .db $FF
  $A2F9  FF        .db $FF
  $A2FA  FF        .db $FF
  $A2FB  FF        .db $FF
  $A2FC  F0 C0     BEQ $A2BE
  $A2FE  00        BRK
  $A2FF  00        BRK
  $A300  EF        .db $EF
  $A301  EF        .db $EF
  $A302  C7        .db $C7
  $A303  07        .db $07
  $A304  1F        .db $1F
  $A305  FF        .db $FF
  $A306  8F        .db $8F
  $A307  E7        .db $E7
  $A308  00        BRK
  $A309  00        BRK
  $A30A  00        BRK
  $A30B  00        BRK
  $A30C  18        CLC
  $A30D  FC        .db $FC
  $A30E  FE FE F7  INC $F7FE,X
  $A311  F3        .db $F3
  $A312  FB        .db $FB
  $A313  FB        .db $FB
  $A314  FF        .db $FF
  $A315  3E 1C 8C  ROL $8C1C,X
  $A318  FE FE FE  INC $FEFE,X
  $A31B  FE FC 3C  INC $3CFC,X
  $A31E  1C        .db $1C
  $A31F  0C        .db $0C
  $A320  FA        .db $FA
  $A321  F9 F9 F1  SBC $F1F9,Y
  $A324  E2        .db $E2
  $A325  06 8E     ASL $8E
  $A327  FE 02 01  INC $0102,X
  $A32A  01 01     ORA ($01,X)
  $A32C  02        .db $02
  $A32D  06 0E     ASL $0E
  $A32F  02        .db $02
  $A330  FF        .db $FF
  $A331  FD FD FD  SBC $FDFD,X
  $A334  F9 E2 0E  SBC $0EE2,Y
  $A337  FC        .db $FC
  $A338  01 01     ORA ($01,X)
  $A33A  01 01     ORA ($01,X)
  $A33C  01 02     ORA ($02,X)
  $A33E  0E FC 7F  ASL $7FFC
  $A341  7F        .db $7F
  $A342  3F        .db $3F
  $A343  BF        .db $BF
  $A344  BF        .db $BF
  $A345  5F        .db $5F
  $A346  67        .db $67
  $A347  38        SEC
  $A348  FF        .db $FF
  $A349  FF        .db $FF
  $A34A  FF        .db $FF
  $A34B  7F        .db $7F
  $A34C  7F        .db $7F
  $A34D  3F        .db $3F
  $A34E  1F        .db $1F
  $A34F  07        .db $07
  $A350  3F        .db $3F
  $A351  1F        .db $1F
  $A352  0F        .db $0F
  $A353  03        .db $03
  $A354  00        BRK
  $A355  00        BRK
  $A356  00        BRK
  $A357  00        BRK
  $A358  00        BRK
  $A359  00        BRK
  $A35A  00        BRK
  $A35B  00        BRK
  $A35C  00        BRK
  $A35D  00        BRK
  $A35E  00        BRK
  $A35F  00        BRK

L_A360:
  $A360  FF        .db $FF
  $A361  FF        .db $FF
  $A362  FF        .db $FF
  $A363  FF        .db $FF
  $A364  FF        .db $FF
  $A365  FF        .db $FF
  $A366  DF        .db $DF
  $A367  1F        .db $1F
  $A368  FF        .db $FF
  $A369  FF        .db $FF
  $A36A  FF        .db $FF
  $A36B  FF        .db $FF
  $A36C  FF        .db $FF
  $A36D  FF        .db $FF
  $A36E  FF        .db $FF
  $A36F  FF        .db $FF
  $A370  1F        .db $1F
  $A371  1F        .db $1F
  $A372  1F        .db $1F
  $A373  8F        .db $8F
  $A374  8F        .db $8F
  $A375  47        .db $47
  $A376  31 0C     AND ($0C),Y
  $A378  FF        .db $FF
  $A379  FF        .db $FF
  $A37A  FF        .db $FF
  $A37B  7F        .db $7F
  $A37C  7F        .db $7F
  $A37D  3F        .db $3F
  $A37E  0F        .db $0F
  $A37F  03        .db $03
  $A380  FF        .db $FF
  $A381  FF        .db $FF
  $A382  FF        .db $FF
  $A383  FF        .db $FF
  $A384  FF        .db $FF
  $A385  F7        .db $F7
  $A386  FB        .db $FB
  $A387  F8        SED
  $A388  FF        .db $FF
  $A389  FF        .db $FF
  $A38A  FF        .db $FF
  $A38B  FF        .db $FF
  $A38C  FF        .db $FF
  $A38D  FF        .db $FF
  $A38E  FF        .db $FF
  $A38F  FF        .db $FF
  $A390  F8        SED
  $A391  F8        SED
  $A392  F8        SED
  $A393  F1 F1     SBC ($F1),Y
  $A395  E3        .db $E3
  $A396  8E 30 FF  STX $FF30
  $A399  FF        .db $FF
  $A39A  FF        .db $FF
  $A39B  FE FE FC  INC $FCFE,X
  $A39E  F0 C0     BEQ $A360
  $A3A0  FE FE FD  INC $FDFE,X
  $A3A3  FD FD FA  SBC $FAFD,X
  $A3A6  E6 1C     INC $1C
  $A3A8  FF        .db $FF
  $A3A9  FF        .db $FF
  $A3AA  FE FE FE  INC $FEFE,X
  $A3AD  FC        .db $FC
  $A3AE  F8        SED
  $A3AF  E0 F8     CPX #$F8
  $A3B1  E0 E0     CPX #$E0
  $A3B3  C0 C0     CPY #$C0
  $A3B5  80        .db $80
  $A3B6  00        BRK
  $A3B7  00        BRK
  $A3B8  00        BRK
  $A3B9  00        BRK
  $A3BA  00        BRK
  $A3BB  00        BRK
  $A3BC  00        BRK
  $A3BD  00        BRK
  $A3BE  00        BRK
  $A3BF  00        BRK
  $A3C0  E0 38     CPX #$38
  $A3C2  CC F7 F5  CPY $F5F7
  $A3C5  F3        .db $F3
  $A3C6  F7        .db $F7
  $A3C7  FF        .db $FF
  $A3C8  00        BRK
  $A3C9  C0 F0     CPY #$F0
  $A3CB  F8        SED
  $A3CC  FB        .db $FB
  $A3CD  FF        .db $FF
  $A3CE  FF        .db $FF
  $A3CF  FF        .db $FF
  $A3D0  FF        .db $FF
  $A3D1  FF        .db $FF
  $A3D2  FF        .db $FF
  $A3D3  FF        .db $FF
  $A3D4  FF        .db $FF
  $A3D5  FF        .db $FF
  $A3D6  FF        .db $FF
  $A3D7  FF        .db $FF
  $A3D8  FF        .db $FF
  $A3D9  FF        .db $FF
  $A3DA  FF        .db $FF
  $A3DB  FF        .db $FF
  $A3DC  FF        .db $FF
  $A3DD  FF        .db $FF
  $A3DE  FF        .db $FF
  $A3DF  FF        .db $FF

L_A3E0:
  $A3E0  00        BRK
  $A3E1  00        BRK
  $A3E2  00        BRK
  $A3E3  C0 B0     CPY #$B0

L_A3E5:
  $A3E5  D8        CLD
  $A3E6  C8        INY
  $A3E7  EC 00 00  CPX $0000
  $A3EA  00        BRK
  $A3EB  00        BRK
  $A3EC  C0 E0     CPY #$E0
  $A3EE  F0 F0     BEQ $A3E0
  $A3F0  EC CC DC  CPX $DCCC
  $A3F3  92        .db $92
  $A3F4  FD FD FE  SBC $FEFD,X
  $A3F7  FE F0 F0  INC $F0F0,X
  $A3FA  E0 FC     CPX #$FC
  $A3FC  FE FE FF  INC $FFFE,X
  $A3FF  FF        .db $FF
  $A400  1F        .db $1F
  $A401  3F        .db $3F
  $A402  7F        .db $7F
  $A403  F0 E0     BEQ $A3E5
  $A405  A1 B3     LDA ($B3,X)
  $A407  FF        .db $FF
  $A408  1F        .db $1F
  $A409  3F        .db $3F

L_A40A:
  $A40A  7F        .db $7F
  $A40B  FF        .db $FF
  $A40C  FF        .db $FF
  $A40D  FE EC A0  INC $A0EC,X
  $A410  FF        .db $FF
  $A411  FF        .db $FF
  $A412  FF        .db $FF
  $A413  FF        .db $FF
  $A414  FF        .db $FF
  $A415  EF        .db $EF
  $A416  EF        .db $EF
  $A417  EF        .db $EF
  $A418  A0 A0     LDY #$A0
  $A41A  A0 A0     LDY #$A0
  $A41C  A0 B1     LDY #$B1
  $A41E  B1 B1     LDA ($B1),Y
  $A420  F3        .db $F3
  $A421  E3        .db $E3
  $A422  E7        .db $E7
  $A423  A7        .db $A7
  $A424  E7        .db $E7
  $A425  A7        .db $A7
  $A426  E7        .db $E7
  $A427  B7        .db $B7
  $A428  F0 E0     BEQ $A40A
  $A42A  E0 E0     CPX #$E0
  $A42C  E0 E0     CPX #$E0
  $A42E  E0 F0     CPX #$F0
  $A430  F7        .db $F7
  $A431  B3        .db $B3
  $A432  FB        .db $FB

L_A433:
  $A433  CD 8C 86  CMP $868C
  $A436  03        .db $03
  $A437  01 F0     ORA ($F0,X)
  $A439  F0 F8     BEQ $A433
  $A43B  FC        .db $FC
  $A43C  FC        .db $FC
  $A43D  FE FF FF  INC $FFFF,X
  $A440  FF        .db $FF
  $A441  FF        .db $FF
  $A442  FF        .db $FF
  $A443  FF        .db $FF
  $A444  FF        .db $FF
  $A445  FF        .db $FF
  $A446  FF        .db $FF
  $A447  FF        .db $FF
  $A448  00        BRK
  $A449  00        BRK
  $A44A  00        BRK
  $A44B  00        BRK
  $A44C  00        BRK
  $A44D  00        BRK
  $A44E  00        BRK
  $A44F  00        BRK
  $A450  FF        .db $FF
  $A451  FF        .db $FF
  $A452  FF        .db $FF
  $A453  FF        .db $FF
  $A454  FF        .db $FF
  $A455  FF        .db $FF
  $A456  3F        .db $3F
  $A457  DF        .db $DF
  $A458  00        BRK
  $A459  00        BRK
  $A45A  00        BRK
  $A45B  00        BRK
  $A45C  00        BRK
  $A45D  00        BRK
  $A45E  00        BRK
  $A45F  C0 FF     CPY #$FF
  $A461  FF        .db $FF
  $A462  FF        .db $FF
  $A463  FF        .db $FF
  $A464  FF        .db $FF
  $A465  FF        .db $FF
  $A466  FF        .db $FF
  $A467  FF        .db $FF
  $A468  3F        .db $3F
  $A469  1F        .db $1F
  $A46A  0F        .db $0F
  $A46B  07        .db $07
  $A46C  03        .db $03
  $A46D  01 00     ORA ($00,X)
  $A46F  1E FF FF  ASL $FFFF,X
  $A472  FF        .db $FF
  $A473  FF        .db $FF
  $A474  FF        .db $FF
  $A475  FF        .db $FF
  $A476  FF        .db $FF
  $A477  FF        .db $FF
  $A478  3F        .db $3F
  $A479  67        .db $67
  $A47A  67        .db $67
  $A47B  7F        .db $7F
  $A47C  7F        .db $7F
  $A47D  3F        .db $3F
  $A47E  1E 00 9F  ASL $9F00,X
  $A481  CF        .db $CF
  $A482  C7        .db $C7
  $A483  C0 E0     CPY #$E0
  $A485  E0 E0     CPX #$E0
  $A487  F0 FF     BEQ $A488
  $A489  FF        .db $FF

L_A48A:
  $A48A  FF        .db $FF
  $A48B  FF        .db $FF
  $A48C  FF        .db $FF
  $A48D  FF        .db $FF
  $A48E  FF        .db $FF
  $A48F  7F        .db $7F
  $A490  F0 F8     BEQ $A48A
  $A492  F8        SED
  $A493  F9 FD FF  SBC $FFFD,Y
  $A496  F3        .db $F3
  $A497  F0 3F     BEQ $A4D8
  $A499  BF        .db $BF
  $A49A  BF        .db $BF
  $A49B  9F        .db $9F
  $A49C  9F        .db $9F
  $A49D  1F        .db $1F
  $A49E  3F        .db $3F
  $A49F  3F        .db $3F
  $A4A0  F9 F3 E3  SBC $E3F3,Y
  $A4A3  03        .db $03
  $A4A4  07        .db $07
  $A4A5  07        .db $07
  $A4A6  07        .db $07
  $A4A7  0F        .db $0F
  $A4A8  FF        .db $FF
  $A4A9  FF        .db $FF
  $A4AA  FF        .db $FF
  $A4AB  FF        .db $FF

L_A4AC:
  $A4AC  FF        .db $FF
  $A4AD  FF        .db $FF
  $A4AE  FF        .db $FF
  $A4AF  FE 0F 1F  INC $1F0F,X
  $A4B2  1F        .db $1F
  $A4B3  9F        .db $9F
  $A4B4  BF        .db $BF
  $A4B5  FF        .db $FF
  $A4B6  CF        .db $CF
  $A4B7  0F        .db $0F
  $A4B8  FC        .db $FC
  $A4B9  FD FD F9  SBC $F9FD,X
  $A4BC  F9 F8 FC  SBC $FCF8,Y
  $A4BF  FC        .db $FC
  $A4C0  FF        .db $FF
  $A4C1  FF        .db $FF
  $A4C2  FF        .db $FF
  $A4C3  FF        .db $FF
  $A4C4  FF        .db $FF
  $A4C5  FF        .db $FF
  $A4C6  FF        .db $FF
  $A4C7  FF        .db $FF
  $A4C8  FC        .db $FC
  $A4C9  F8        SED
  $A4CA  F0 E0     BEQ $A4AC
  $A4CC  C0 80     CPY #$80
  $A4CE  00        BRK
  $A4CF  78        SEI
  $A4D0  FF        .db $FF
  $A4D1  FF        .db $FF
  $A4D2  FF        .db $FF
  $A4D3  FF        .db $FF
  $A4D4  FF        .db $FF
  $A4D5  FF        .db $FF
  $A4D6  FF        .db $FF
  $A4D7  FF        .db $FF

L_A4D8:
  $A4D8  FC        .db $FC
  $A4D9  9E        .db $9E
  $A4DA  9E        .db $9E
  $A4DB  FE FE FC  INC $FCFE,X
  $A4DE  78        SEI
  $A4DF  00        BRK
  $A4E0  FF        .db $FF
  $A4E1  FF        .db $FF
  $A4E2  FF        .db $FF
  $A4E3  FF        .db $FF
  $A4E4  FF        .db $FF
  $A4E5  FF        .db $FF
  $A4E6  FF        .db $FF
  $A4E7  FF        .db $FF
  $A4E8  00        BRK
  $A4E9  00        BRK
  $A4EA  00        BRK
  $A4EB  00        BRK
  $A4EC  00        BRK
  $A4ED  00        BRK
  $A4EE  00        BRK
  $A4EF  00        BRK
  $A4F0  FF        .db $FF
  $A4F1  FF        .db $FF
  $A4F2  FF        .db $FF
  $A4F3  FF        .db $FF
  $A4F4  FF        .db $FF
  $A4F5  FF        .db $FF
  $A4F6  FC        .db $FC
  $A4F7  FB        .db $FB
  $A4F8  00        BRK
  $A4F9  00        BRK
  $A4FA  00        BRK
  $A4FB  00        BRK
  $A4FC  00        BRK
  $A4FD  00        BRK
  $A4FE  00        BRK
  $A4FF  03        .db $03
  $A500  CF        .db $CF
  $A501  C7        .db $C7
  $A502  E7        .db $E7
  $A503  E5 E7     SBC $E7
  $A505  E5 E7     SBC $E7
  $A507  ED 0F 07  SBC $070F
  $A50A  07        .db $07
  $A50B  07        .db $07
  $A50C  07        .db $07
  $A50D  07        .db $07
  $A50E  07        .db $07
  $A50F  0F        .db $0F
  $A510  EF        .db $EF
  $A511  CD DF B7  CMP $B7DF
  $A514  33        .db $33
  $A515  63        .db $63
  $A516  C1 81     CMP ($81,X)
  $A518  0F        .db $0F
  $A519  0F        .db $0F
  $A51A  1F        .db $1F
  $A51B  3F        .db $3F
  $A51C  3F        .db $3F
  $A51D  7F        .db $7F
  $A51E  FF        .db $FF
  $A51F  FF        .db $FF
  $A520  F8        SED
  $A521  FC        .db $FC
  $A522  FE 0F 07  INC $070F,X
  $A525  85 CD     STA $CD
  $A527  FF        .db $FF
  $A528  F8        SED
  $A529  FC        .db $FC
  $A52A  FE FF FF  INC $FFFF,X
  $A52D  7F        .db $7F
  $A52E  37        .db $37
  $A52F  05 FF     ORA $FF
  $A531  FF        .db $FF
  $A532  FF        .db $FF
  $A533  FF        .db $FF
  $A534  FF        .db $FF
  $A535  F7        .db $F7
  $A536  F7        .db $F7
  $A537  F7        .db $F7
  $A538  05 05     ORA $05
  $A53A  05 05     ORA $05
  $A53C  05 8D     ORA $8D
  $A53E  8D 8D 00  STA $008D
  $A541  00        BRK
  $A542  00        BRK
  $A543  00        BRK
  $A544  01 01     ORA ($01,X)
  $A546  07        .db $07
  $A547  1F        .db $1F
  $A548  00        BRK
  $A549  00        BRK
  $A54A  00        BRK
  $A54B  00        BRK
  $A54C  00        BRK
  $A54D  00        BRK
  $A54E  00        BRK
  $A54F  00        BRK
  $A550  38        SEC
  $A551  67        .db $67
  $A552  5F        .db $5F
  $A553  BF        .db $BF
  $A554  BF        .db $BF
  $A555  BF        .db $BF
  $A556  7F        .db $7F
  $A557  7F        .db $7F
  $A558  07        .db $07
  $A559  1F        .db $1F
  $A55A  3F        .db $3F
  $A55B  7F        .db $7F
  $A55C  7F        .db $7F
  $A55D  7F        .db $7F
  $A55E  FF        .db $FF
  $A55F  FF        .db $FF
  $A560  0F        .db $0F
  $A561  30 4F     BMI $A5B2
  $A563  9F        .db $9F
  $A564  9F        .db $9F
  $A565  3F        .db $3F
  $A566  3F        .db $3F
  $A567  3F        .db $3F
  $A568  00        BRK
  $A569  0F        .db $0F
  $A56A  3F        .db $3F
  $A56B  7F        .db $7F
  $A56C  7F        .db $7F
  $A56D  FF        .db $FF
  $A56E  FF        .db $FF
  $A56F  FF        .db $FF
  $A570  BF        .db $BF
  $A571  3F        .db $3F
  $A572  BF        .db $BF
  $A573  FF        .db $FF
  $A574  FF        .db $FF
  $A575  FF        .db $FF
  $A576  FF        .db $FF
  $A577  FF        .db $FF
  $A578  7F        .db $7F
  $A579  FF        .db $FF
  $A57A  FF        .db $FF
  $A57B  FF        .db $FF
  $A57C  FF        .db $FF
  $A57D  FF        .db $FF
  $A57E  FF        .db $FF
  $A57F  FF        .db $FF
  $A580  00        BRK
  $A581  00        BRK
  $A582  00        BRK
  $A583  00        BRK
  $A584  00        BRK
  $A585  00        BRK
  $A586  00        BRK
  $A587  07        .db $07
  $A588  00        BRK
  $A589  00        BRK
  $A58A  00        BRK
  $A58B  00        BRK
  $A58C  00        BRK
  $A58D  00        BRK
  $A58E  00        BRK
  $A58F  00        BRK
  $A590  1F        .db $1F
  $A591  38        SEC
  $A592  60        RTS
  $A593  47        .db $47
  $A594  9F        .db $9F
  $A595  3F        .db $3F
  $A596  7F        .db $7F
  $A597  7F        .db $7F
  $A598  00        BRK
  $A599  07        .db $07
  $A59A  1F        .db $1F
  $A59B  3F        .db $3F
  $A59C  7F        .db $7F
  $A59D  FF        .db $FF
  $A59E  FF        .db $FF
  $A59F  FF        .db $FF
  $A5A0  00        BRK
  $A5A1  00        BRK
  $A5A2  00        BRK
  $A5A3  00        BRK
  $A5A4  00        BRK
  $A5A5  03        .db $03
  $A5A6  0E 98 00  ASL $0098
  $A5A9  00        BRK
  $A5AA  00        BRK
  $A5AB  00        BRK
  $A5AC  00        BRK
  $A5AD  00        BRK
  $A5AE  01 07     ORA ($07,X)
  $A5B0  F1 23     SBC ($23),Y

L_A5B2:
  $A5B2  07        .db $07
  $A5B3  C7        .db $C7
  $A5B4  F7        .db $F7
  $A5B5  FF        .db $FF

L_A5B6:
  $A5B6  FF        .db $FF
  $A5B7  FF        .db $FF
  $A5B8  0F        .db $0F
  $A5B9  DF        .db $DF
  $A5BA  FF        .db $FF
  $A5BB  FF        .db $FF
  $A5BC  FF        .db $FF
  $A5BD  FF        .db $FF
  $A5BE  FF        .db $FF
  $A5BF  FF        .db $FF
  $A5C0  00        BRK
  $A5C1  00        BRK
  $A5C2  00        BRK
  $A5C3  00        BRK
  $A5C4  F8        SED
  $A5C5  FE 07 F0  INC $F007,X
  $A5C8  00        BRK
  $A5C9  00        BRK

L_A5CA:
  $A5CA  00        BRK
  $A5CB  00        BRK
  $A5CC  00        BRK
  $A5CD  00        BRK
  $A5CE  F8        SED
  $A5CF  FF        .db $FF
  $A5D0  FF        .db $FF
  $A5D1  FF        .db $FF
  $A5D2  FF        .db $FF
  $A5D3  FF        .db $FF
  $A5D4  FF        .db $FF
  $A5D5  FF        .db $FF
  $A5D6  FF        .db $FF
  $A5D7  FF        .db $FF
  $A5D8  FF        .db $FF
  $A5D9  FF        .db $FF
  $A5DA  FF        .db $FF
  $A5DB  FF        .db $FF
  $A5DC  FF        .db $FF
  $A5DD  FF        .db $FF
  $A5DE  FF        .db $FF
  $A5DF  FF        .db $FF
  $A5E0  00        BRK
  $A5E1  00        BRK
  $A5E2  00        BRK
  $A5E3  00        BRK
  $A5E4  00        BRK
  $A5E5  00        BRK
  $A5E6  80        .db $80
  $A5E7  E0 00     CPX #$00
  $A5E9  00        BRK
  $A5EA  00        BRK
  $A5EB  00        BRK
  $A5EC  00        BRK
  $A5ED  00        BRK
  $A5EE  00        BRK
  $A5EF  00        BRK
  $A5F0  30 D8     BMI $A5CA
  $A5F2  EC F4 FA  CPX $FAF4
  $A5F5  FA        .db $FA
  $A5F6  FD FD C0  SBC $C0FD,X
  $A5F9  E0 F0     CPX #$F0
  $A5FB  F8        SED
  $A5FC  FC        .db $FC
  $A5FD  FC        .db $FC
  $A5FE  FE FE EE  INC $EEFE,X
  $A601  A6 E2     LDX $E2
  $A603  FE BE AF  INC $AFBE,X
  $A606  E3        .db $E3
  $A607  F1 B3     SBC ($B3),Y
  $A609  FB        .db $FB
  $A60A  FF        .db $FF
  $A60B  FF        .db $FF
  $A60C  FF        .db $FF
  $A60D  FF        .db $FF
  $A60E  FF        .db $FF
  $A60F  FF        .db $FF
  $A610  7F        .db $7F
  $A611  3F        .db $3F
  $A612  1F        .db $1F
  $A613  07        .db $07
  $A614  00        BRK
  $A615  01 06     ORA ($06,X)
  $A617  18        CLC
  $A618  7F        .db $7F
  $A619  3F        .db $3F
  $A61A  1F        .db $1F
  $A61B  07        .db $07
  $A61C  00        BRK
  $A61D  01 07     ORA ($07,X)
  $A61F  1F        .db $1F
  $A620  30 78     BMI $A69A
  $A622  78        SEI
  $A623  78        SEI
  $A624  3C        .db $3C
  $A625  3E 1F 07  ROL $071F,X
  $A628  CF        .db $CF
  $A629  87        .db $87
  $A62A  87        .db $87
  $A62B  87        .db $87
  $A62C  C3        .db $C3
  $A62D  C1 E0     CMP ($E0,X)
  $A62F  F8        SED
  $A630  80        .db $80
  $A631  C0 E7     CPY #$E7
  $A633  FC        .db $FC
  $A634  F0 80     BEQ $A5B6
  $A636  38        SEC
  $A637  F0 FF     BEQ $A638
  $A639  FF        .db $FF
  $A63A  FF        .db $FF
  $A63B  FF        .db $FF
  $A63C  FF        .db $FF
  $A63D  FF        .db $FF
  $A63E  C7        .db $C7
  $A63F  0F        .db $0F
  $A640  E7        .db $E7
  $A641  78        SEI
  $A642  3E 0F 03  ROL $030F,X
  $A645  00        BRK
  $A646  00        BRK
  $A647  80        .db $80
  $A648  E0 F8     CPX #$F8
  $A64A  FE FF FF  INC $FFFF,X
  $A64D  FF        .db $FF
  $A64E  FF        .db $FF
  $A64F  7F        .db $7F
  $A650  00        BRK
  $A651  00        BRK
  $A652  00        BRK
  $A653  00        BRK
  $A654  00        BRK
  $A655  00        BRK
  $A656  00        BRK
  $A657  00        BRK
  $A658  FF        .db $FF
  $A659  FF        .db $FF
  $A65A  FF        .db $FF
  $A65B  FF        .db $FF
  $A65C  FF        .db $FF
  $A65D  FF        .db $FF
  $A65E  FF        .db $FF
  $A65F  FF        .db $FF
  $A660  FF        .db $FF
  $A661  FF        .db $FF
  $A662  03        .db $03
  $A663  FE FC 78  INC $78FC,X
  $A666  10 31     BPL $A699
  $A668  00        BRK
  $A669  00        BRK
  $A66A  03        .db $03
  $A66B  FF        .db $FF
  $A66C  FF        .db $FF
  $A66D  FF        .db $FF
  $A66E  FF        .db $FF
  $A66F  FF        .db $FF
  $A670  27        .db $27
  $A671  2F        .db $2F
  $A672  3F        .db $3F
  $A673  3F        .db $3F
  $A674  1F        .db $1F
  $A675  1F        .db $1F
  $A676  0F        .db $0F
  $A677  07        .db $07
  $A678  FE F8 F0  INC $F0F8,X
  $A67B  F1 F0     SBC ($F0),Y
  $A67D  F8        SED
  $A67E  FE FF E0  INC $E0FF,X
  $A681  CE 9E 3C  DEC $3C9E
  $A684  38        SEC
  $A685  00        BRK
  $A686  00        BRK
  $A687  FF        .db $FF
  $A688  7F        .db $7F
  $A689  F1 E1     SBC ($E1),Y
  $A68B  C3        .db $C3

L_A68C:
  $A68C  C7        .db $C7
  $A68D  FF        .db $FF
  $A68E  FF        .db $FF
  $A68F  FF        .db $FF
  $A690  FF        .db $FF
  $A691  FF        .db $FF
  $A692  F0 F8     BEQ $A68C
  $A694  FF        .db $FF
  $A695  FF        .db $FF
  $A696  FF        .db $FF
  $A697  FF        .db $FF
  $A698  00        BRK

L_A699:
  $A699  7F        .db $7F

L_A69A:
  $A69A  FF        .db $FF
  $A69B  FF        .db $FF
  $A69C  FF        .db $FF
  $A69D  7F        .db $7F
  $A69E  00        BRK
  $A69F  FF        .db $FF
  $A6A0  07        .db $07
  $A6A1  03        .db $03
  $A6A2  01 00     ORA ($00,X)
  $A6A4  00        BRK
  $A6A5  00        BRK
  $A6A6  00        BRK
  $A6A7  FF        .db $FF
  $A6A8  FE FF FF  INC $FFFF,X
  $A6AB  FF        .db $FF
  $A6AC  FF        .db $FF
  $A6AD  FF        .db $FF
  $A6AE  FF        .db $FF
  $A6AF  FF        .db $FF
  $A6B0  FF        .db $FF
  $A6B1  FF        .db $FF
  $A6B2  1F        .db $1F
  $A6B3  3F        .db $3F
  $A6B4  FF        .db $FF
  $A6B5  FF        .db $FF
  $A6B6  FF        .db $FF
  $A6B7  FF        .db $FF
  $A6B8  00        BRK
  $A6B9  FE FF FF  INC $FFFF,X
  $A6BC  FF        .db $FF
  $A6BD  FE 00 FF  INC $FF00,X
  $A6C0  FF        .db $FF
  $A6C1  FF        .db $FF
  $A6C2  C0 7F     CPY #$7F
  $A6C4  3F        .db $3F
  $A6C5  1F        .db $1F
  $A6C6  0E 8E 00  ASL $008E
  $A6C9  00        BRK
  $A6CA  C0 FF     CPY #$FF
  $A6CC  FF        .db $FF
  $A6CD  FF        .db $FF
  $A6CE  FF        .db $FF
  $A6CF  FF        .db $FF
  $A6D0  E7        .db $E7
  $A6D1  F7        .db $F7
  $A6D2  FF        .db $FF
  $A6D3  FF        .db $FF
  $A6D4  FF        .db $FF
  $A6D5  FE FC F0  INC $F0FC,X
  $A6D8  7F        .db $7F
  $A6D9  1F        .db $1F
  $A6DA  0F        .db $0F
  $A6DB  8F        .db $8F
  $A6DC  0F        .db $0F
  $A6DD  1F        .db $1F
  $A6DE  7F        .db $7F
  $A6DF  FF        .db $FF
  $A6E0  E7        .db $E7
  $A6E1  1E 7C F0  ASL $F07C,X
  $A6E4  C0 00     CPY #$00
  $A6E6  00        BRK
  $A6E7  00        BRK
  $A6E8  07        .db $07
  $A6E9  1F        .db $1F
  $A6EA  7F        .db $7F
  $A6EB  FF        .db $FF
  $A6EC  FF        .db $FF
  $A6ED  FF        .db $FF
  $A6EE  FF        .db $FF
  $A6EF  FF        .db $FF
  $A6F0  00        BRK
  $A6F1  00        BRK
  $A6F2  00        BRK
  $A6F3  00        BRK
  $A6F4  00        BRK
  $A6F5  00        BRK
  $A6F6  00        BRK
  $A6F7  00        BRK
  $A6F8  FF        .db $FF
  $A6F9  FF        .db $FF
  $A6FA  FF        .db $FF
  $A6FB  FF        .db $FF
  $A6FC  FF        .db $FF
  $A6FD  FF        .db $FF
  $A6FE  FF        .db $FF
  $A6FF  FF        .db $FF
  $A700  01 01     ORA ($01,X)
  $A702  01 03     ORA ($03,X)
  $A704  03        .db $03
  $A705  03        .db $03
  $A706  07        .db $07
  $A707  0F        .db $0F
  $A708  FF        .db $FF
  $A709  FF        .db $FF
  $A70A  FF        .db $FF
  $A70B  FF        .db $FF
  $A70C  FF        .db $FF
  $A70D  FF        .db $FF
  $A70E  FF        .db $FF
  $A70F  FF        .db $FF
  $A710  1F        .db $1F
  $A711  7F        .db $7F
  $A712  FF        .db $FF
  $A713  3F        .db $3F
  $A714  0F        .db $0F
  $A715  03        .db $03
  $A716  00        BRK
  $A717  00        BRK
  $A718  FF        .db $FF
  $A719  FF        .db $FF
  $A71A  FF        .db $FF
  $A71B  FF        .db $FF
  $A71C  FF        .db $FF
  $A71D  FF        .db $FF
  $A71E  FF        .db $FF
  $A71F  FF        .db $FF
  $A720  F7        .db $F7
  $A721  E5 C7     SBC $C7
  $A723  FF        .db $FF
  $A724  FD F5 C7  SBC $C7F5,X
  $A727  8F        .db $8F
  $A728  CD DF FF  CMP $FFDF
  $A72B  FF        .db $FF
  $A72C  FF        .db $FF
  $A72D  FF        .db $FF
  $A72E  FF        .db $FF
  $A72F  FF        .db $FF
  $A730  FE FC F0  INC $F0FC,X
  $A733  C0 00     CPY #$00
  $A735  80        .db $80
  $A736  E0 78     CPX #$78
  $A738  FE FC F0  INC $F0FC,X
  $A73B  C0 00     CPY #$00
  $A73D  80        .db $80
  $A73E  E0 F8     CPX #$F8
  $A740  7F        .db $7F
  $A741  7F        .db $7F
  $A742  3F        .db $3F
  $A743  9F        .db $9F
  $A744  47        .db $47
  $A745  60        RTS
  $A746  38        SEC
  $A747  1F        .db $1F
  $A748  FF        .db $FF
  $A749  FF        .db $FF
  $A74A  FF        .db $FF
  $A74B  7F        .db $7F
  $A74C  3F        .db $3F
  $A74D  1F        .db $1F
  $A74E  07        .db $07
  $A74F  00        BRK
  $A750  07        .db $07
  $A751  00        BRK
  $A752  00        BRK
  $A753  00        BRK
  $A754  00        BRK
  $A755  00        BRK
  $A756  00        BRK
  $A757  00        BRK
  $A758  00        BRK
  $A759  00        BRK
  $A75A  00        BRK
  $A75B  00        BRK
  $A75C  00        BRK
  $A75D  00        BRK
  $A75E  00        BRK
  $A75F  00        BRK
  $A760  FF        .db $FF
  $A761  FF        .db $FF
  $A762  FF        .db $FF
  $A763  F7        .db $F7
  $A764  C7        .db $C7
  $A765  07        .db $07
  $A766  23        .db $23
  $A767  F1 FF     SBC ($FF),Y
  $A769  FF        .db $FF
  $A76A  FF        .db $FF
  $A76B  FF        .db $FF
  $A76C  FF        .db $FF
  $A76D  FF        .db $FF
  $A76E  DF        .db $DF
  $A76F  0F        .db $0F
  $A770  98        TYA
  $A771  0E 03 00  ASL $0003
  $A774  00        BRK
  $A775  00        BRK
  $A776  00        BRK
  $A777  00        BRK
  $A778  07        .db $07
  $A779  01 00     ORA ($00,X)
  $A77B  00        BRK
  $A77C  00        BRK
  $A77D  00        BRK
  $A77E  00        BRK
  $A77F  00        BRK
  $A780  FF        .db $FF
  $A781  FF        .db $FF
  $A782  FF        .db $FF
  $A783  FF        .db $FF
  $A784  FF        .db $FF
  $A785  FF        .db $FF
  $A786  FF        .db $FF
  $A787  FF        .db $FF
  $A788  FF        .db $FF
  $A789  FF        .db $FF
  $A78A  FF        .db $FF
  $A78B  FF        .db $FF
  $A78C  FF        .db $FF
  $A78D  FF        .db $FF
  $A78E  FF        .db $FF

L_A78F:
  $A78F  FF        .db $FF
  $A790  F0 07     BEQ $A799
  $A792  FE F8 00  INC $00F8,X
  $A795  00        BRK
  $A796  00        BRK
  $A797  00        BRK
  $A798  FF        .db $FF

L_A799:
  $A799  F8        SED
  $A79A  00        BRK
  $A79B  00        BRK
  $A79C  00        BRK
  $A79D  00        BRK
  $A79E  00        BRK
  $A79F  00        BRK
  $A7A0  FD FD FA  SBC $FAFD,X
  $A7A3  FA        .db $FA
  $A7A4  F4        .db $F4
  $A7A5  EC D8 30  CPX $30D8
  $A7A8  FE FE FC  INC $FCFE,X
  $A7AB  FC        .db $FC
  $A7AC  F8        SED
  $A7AD  F0 E0     BEQ $A78F
  $A7AF  C0 E0     CPY #$E0
  $A7B1  80        .db $80
  $A7B2  00        BRK
  $A7B3  00        BRK
  $A7B4  00        BRK
  $A7B5  00        BRK
  $A7B6  00        BRK
  $A7B7  00        BRK
  $A7B8  00        BRK
  $A7B9  00        BRK
  $A7BA  00        BRK
  $A7BB  00        BRK
  $A7BC  00        BRK
  $A7BD  00        BRK
  $A7BE  00        BRK
  $A7BF  00        BRK
  $A7C0  F3        .db $F3
  $A7C1  FD F9 71  SBC $71F9,X
  $A7C4  7E FE FF  ROR $FFFE,X
  $A7C7  FF        .db $FF
  $A7C8  F3        .db $F3
  $A7C9  FF        .db $FF
  $A7CA  FF        .db $FF
  $A7CB  FF        .db $FF
  $A7CC  FE E2 C1  INC $C1E2,X
  $A7CF  B1 FF     LDA ($FF),Y
  $A7D1  7D 01 01  ADC $0101,X
  $A7D4  F3        .db $F3
  $A7D5  1B        .db $1B
  $A7D6  07        .db $07
  $A7D7  FC        .db $FC
  $A7D8  B1 83     LDA ($83),Y
  $A7DA  FF        .db $FF
  $A7DB  FF        .db $FF
  $A7DC  FF        .db $FF
  $A7DD  FF        .db $FF
  $A7DE  FF        .db $FF
  $A7DF  FC        .db $FC
  $A7E0  7F        .db $7F
  $A7E1  FF        .db $FF
  $A7E2  FF        .db $FF
  $A7E3  C7        .db $C7
  $A7E4  83        .db $83
  $A7E5  9F        .db $9F
  $A7E6  03        .db $03
  $A7E7  03        .db $03
  $A7E8  00        BRK
  $A7E9  FF        .db $FF
  $A7EA  FF        .db $FF
  $A7EB  FE FF FE  INC $FEFF,X
  $A7EE  FF        .db $FF
  $A7EF  FE 3F 07  INC $073F,X
  $A7F2  07        .db $07
  $A7F3  7B        .db $7B
  $A7F4  47        .db $47
  $A7F5  2F        .db $2F
  $A7F6  9F        .db $9F
  $A7F7  FE FF FE  INC $FEFF,X
  $A7FA  FF        .db $FF
  $A7FB  FA        .db $FA
  $A7FC  C7        .db $C7
  $A7FD  E0 FF     CPX #$FF
  $A7FF  FE 21 43  INC $4321,X
  $A802  43        .db $43
  $A803  81 80     STA ($80,X)
  $A805  C0 FF     CPY #$FF
  $A807  7F        .db $7F
  $A808  3E 7C 7C  ROL $7C7C,X
  $A80B  FE FF FF  INC $FFFF,X
  $A80E  FF        .db $FF
  $A80F  7F        .db $7F
  $A810  7F        .db $7F
  $A811  20 18 07  JSR $0718
  $A814  00        BRK
  $A815  00        BRK
  $A816  00        BRK
  $A817  00        BRK
  $A818  40        RTI
  $A819  3F        .db $3F
  $A81A  1F        .db $1F
  $A81B  07        .db $07
  $A81C  00        BRK
  $A81D  00        BRK
  $A81E  00        BRK
  $A81F  00        BRK
  $A820  E0 C0     CPX #$C0
  $A822  80        .db $80
  $A823  80        .db $80
  $A824  00        BRK
  $A825  00        BRK
  $A826  FF        .db $FF
  $A827  FF        .db $FF
  $A828  1F        .db $1F
  $A829  3F        .db $3F
  $A82A  7F        .db $7F
  $A82B  7F        .db $7F
  $A82C  FF        .db $FF
  $A82D  FF        .db $FF
  $A82E  FF        .db $FF
  $A82F  FF        .db $FF
  $A830  FF        .db $FF
  $A831  00        BRK
  $A832  00        BRK
  $A833  00        BRK
  $A834  F0 0F     BEQ $A845
  $A836  00        BRK
  $A837  00        BRK
  $A838  00        BRK
  $A839  FF        .db $FF
  $A83A  FF        .db $FF
  $A83B  FF        .db $FF
  $A83C  FF        .db $FF
  $A83D  0F        .db $0F
  $A83E  00        BRK
  $A83F  00        BRK
  $A840  00        BRK
  $A841  00        BRK
  $A842  00        BRK
  $A843  00        BRK
  $A844  00        BRK

L_A845:
  $A845  00        BRK
  $A846  FF        .db $FF
  $A847  FF        .db $FF
  $A848  FF        .db $FF
  $A849  FF        .db $FF
  $A84A  FF        .db $FF
  $A84B  FF        .db $FF
  $A84C  FF        .db $FF
  $A84D  FF        .db $FF
  $A84E  FF        .db $FF
  $A84F  FF        .db $FF
  $A850  FF        .db $FF
  $A851  00        BRK
  $A852  00        BRK
  $A853  00        BRK
  $A854  00        BRK
  $A855  E0 1F     CPX #$1F
  $A857  00        BRK
  $A858  00        BRK
  $A859  FF        .db $FF
  $A85A  FF        .db $FF
  $A85B  FF        .db $FF
  $A85C  FF        .db $FF
  $A85D  FF        .db $FF
  $A85E  1F        .db $1F
  $A85F  00        BRK
  $A860  00        BRK
  $A861  00        BRK
  $A862  00        BRK
  $A863  00        BRK
  $A864  00        BRK
  $A865  00        BRK
  $A866  FF        .db $FF
  $A867  FF        .db $FF
  $A868  FF        .db $FF
  $A869  FF        .db $FF
  $A86A  FF        .db $FF
  $A86B  FF        .db $FF
  $A86C  FF        .db $FF
  $A86D  FF        .db $FF
  $A86E  FF        .db $FF
  $A86F  FF        .db $FF
  $A870  FF        .db $FF
  $A871  00        BRK
  $A872  00        BRK
  $A873  00        BRK
  $A874  00        BRK
  $A875  00        BRK
  $A876  F0 0F     BEQ $A887
  $A878  00        BRK
  $A879  FF        .db $FF
  $A87A  FF        .db $FF
  $A87B  FF        .db $FF
  $A87C  FF        .db $FF
  $A87D  FF        .db $FF
  $A87E  FF        .db $FF
  $A87F  0F        .db $0F
  $A880  7F        .db $7F
  $A881  00        BRK
  $A882  00        BRK
  $A883  00        BRK
  $A884  00        BRK
  $A885  00        BRK
  $A886  FF        .db $FF

L_A887:
  $A887  FF        .db $FF
  $A888  FF        .db $FF
  $A889  FF        .db $FF
  $A88A  FF        .db $FF
  $A88B  FF        .db $FF
  $A88C  FF        .db $FF
  $A88D  FF        .db $FF
  $A88E  FF        .db $FF
  $A88F  FF        .db $FF
  $A890  FF        .db $FF
  $A891  00        BRK
  $A892  00        BRK
  $A893  00        BRK
  $A894  00        BRK
  $A895  00        BRK
  $A896  00        BRK
  $A897  FF        .db $FF
  $A898  00        BRK
  $A899  FF        .db $FF
  $A89A  FF        .db $FF
  $A89B  FF        .db $FF
  $A89C  FF        .db $FF
  $A89D  FF        .db $FF
  $A89E  FF        .db $FF
  $A89F  FF        .db $FF
  $A8A0  FF        .db $FF
  $A8A1  00        BRK
  $A8A2  00        BRK
  $A8A3  00        BRK
  $A8A4  00        BRK
  $A8A5  00        BRK
  $A8A6  FF        .db $FF
  $A8A7  FF        .db $FF
  $A8A8  FF        .db $FF
  $A8A9  FF        .db $FF
  $A8AA  FF        .db $FF
  $A8AB  FF        .db $FF
  $A8AC  FF        .db $FF
  $A8AD  FF        .db $FF
  $A8AE  FF        .db $FF
  $A8AF  FF        .db $FF
  $A8B0  FF        .db $FF
  $A8B1  00        BRK
  $A8B2  00        BRK
  $A8B3  00        BRK
  $A8B4  00        BRK
  $A8B5  00        BRK
  $A8B6  00        BRK
  $A8B7  FF        .db $FF
  $A8B8  00        BRK
  $A8B9  FF        .db $FF
  $A8BA  FF        .db $FF
  $A8BB  FF        .db $FF
  $A8BC  FF        .db $FF
  $A8BD  FF        .db $FF
  $A8BE  FF        .db $FF
  $A8BF  FF        .db $FF
  $A8C0  80        .db $80
  $A8C1  00        BRK
  $A8C2  00        BRK
  $A8C3  00        BRK
  $A8C4  00        BRK
  $A8C5  00        BRK
  $A8C6  FF        .db $FF
  $A8C7  FF        .db $FF
  $A8C8  FF        .db $FF
  $A8C9  FF        .db $FF
  $A8CA  FF        .db $FF
  $A8CB  FF        .db $FF
  $A8CC  FF        .db $FF
  $A8CD  FF        .db $FF
  $A8CE  FF        .db $FF
  $A8CF  FF        .db $FF
  $A8D0  FF        .db $FF
  $A8D1  00        BRK
  $A8D2  00        BRK
  $A8D3  00        BRK
  $A8D4  00        BRK
  $A8D5  00        BRK
  $A8D6  0F        .db $0F
  $A8D7  F0 00     BEQ $A8D9

L_A8D9:
  $A8D9  FF        .db $FF
  $A8DA  FF        .db $FF
  $A8DB  FF        .db $FF
  $A8DC  FF        .db $FF
  $A8DD  FF        .db $FF
  $A8DE  FF        .db $FF
  $A8DF  F0 00     BEQ $A8E1

L_A8E1:
  $A8E1  00        BRK
  $A8E2  00        BRK
  $A8E3  00        BRK
  $A8E4  00        BRK
  $A8E5  00        BRK
  $A8E6  FF        .db $FF
  $A8E7  FF        .db $FF
  $A8E8  FF        .db $FF
  $A8E9  FF        .db $FF
  $A8EA  FF        .db $FF
  $A8EB  FF        .db $FF
  $A8EC  FF        .db $FF
  $A8ED  FF        .db $FF
  $A8EE  FF        .db $FF
  $A8EF  FF        .db $FF
  $A8F0  FF        .db $FF
  $A8F1  00        BRK
  $A8F2  00        BRK
  $A8F3  00        BRK
  $A8F4  00        BRK
  $A8F5  07        .db $07
  $A8F6  F8        SED
  $A8F7  00        BRK
  $A8F8  00        BRK
  $A8F9  FF        .db $FF
  $A8FA  FF        .db $FF
  $A8FB  FF        .db $FF
  $A8FC  FF        .db $FF
  $A8FD  FF        .db $FF
  $A8FE  F8        SED
  $A8FF  00        BRK
  $A900  00        BRK
  $A901  00        BRK
  $A902  00        BRK
  $A903  00        BRK
  $A904  00        BRK
  $A905  00        BRK
  $A906  FF        .db $FF
  $A907  FF        .db $FF
  $A908  FF        .db $FF
  $A909  FF        .db $FF
  $A90A  FF        .db $FF
  $A90B  FF        .db $FF
  $A90C  FF        .db $FF
  $A90D  FF        .db $FF
  $A90E  FF        .db $FF
  $A90F  FF        .db $FF
  $A910  FF        .db $FF
  $A911  00        BRK
  $A912  00        BRK
  $A913  00        BRK
  $A914  0F        .db $0F
  $A915  F0 00     BEQ $A917

L_A917:
  $A917  00        BRK
  $A918  00        BRK
  $A919  FF        .db $FF
  $A91A  FF        .db $FF
  $A91B  FF        .db $FF
  $A91C  FF        .db $FF
  $A91D  F0 00     BEQ $A91F

L_A91F:
  $A91F  00        BRK
  $A920  1C        .db $1C
  $A921  0E 06 07  ASL $0706
  $A924  07        .db $07
  $A925  0F        .db $0F
  $A926  FF        .db $FF
  $A927  FE FC FE  INC $FEFC,X
  $A92A  FE FF FF  INC $FFFF,X
  $A92D  FF        .db $FF
  $A92E  FF        .db $FF
  $A92F  FE FE 1C  INC $1CFE,X
  $A932  38        SEC
  $A933  E0 00     CPX #$00
  $A935  00        BRK
  $A936  00        BRK
  $A937  00        BRK
  $A938  0E FC F8  ASL $F8FC
  $A93B  E0 00     CPX #$00
  $A93D  00        BRK
  $A93E  00        BRK
  $A93F  00        BRK
  $A940  FF        .db $FF
  $A941  FF        .db $FF
  $A942  FF        .db $FF
  $A943  FF        .db $FF
  $A944  C6 CC     DEC $CC
  $A946  D8        CLD
  $A947  FF        .db $FF
  $A948  A0 FF     LDY #$FF
  $A94A  FF        .db $FF
  $A94B  40        RTI
  $A94C  C0 40     CPY #$40
  $A94E  E7        .db $E7
  $A94F  4E E3 C7  LSR $C7E3
  $A952  FF        .db $FF
  $A953  DC        .db $DC
  $A954  FF        .db $FF
  $A955  FF        .db $FF
  $A956  FF        .db $FF
  $A957  FF        .db $FF
  $A958  C0 78     CPY #$78
  $A95A  F1 40     SBC ($40),Y
  $A95C  FF        .db $FF
  $A95D  00        BRK
  $A95E  FF        .db $FF
  $A95F  FF        .db $FF
  $A960  FF        .db $FF
  $A961  FF        .db $FF
  $A962  FF        .db $FF
  $A963  FF        .db $FF
  $A964  3B        .db $3B
  $A965  73        .db $73
  $A966  E3        .db $E3
  $A967  FF        .db $FF
  $A968  00        BRK
  $A969  FF        .db $FF
  $A96A  FF        .db $FF
  $A96B  04        .db $04
  $A96C  03        .db $03
  $A96D  00        BRK
  $A96E  1F        .db $1F
  $A96F  3C        .db $3C
  $A970  83        .db $83
  $A971  07        .db $07
  $A972  FF        .db $FF
  $A973  13        .db $13
  $A974  FF        .db $FF
  $A975  FF        .db $FF
  $A976  FF        .db $FF
  $A977  FF        .db $FF
  $A978  03        .db $03
  $A979  F8        SED
  $A97A  F7        .db $F7
  $A97B  00        BRK
  $A97C  FF        .db $FF
  $A97D  28        PLP
  $A97E  FF        .db $FF
  $A97F  FF        .db $FF
  $A980  FF        .db $FF
  $A981  7F        .db $7F
  $A982  7F        .db $7F
  $A983  37        .db $37
  $A984  8F        .db $8F
  $A985  CF        .db $CF
  $A986  CF        .db $CF
  $A987  EF        .db $EF
  $A988  00        BRK
  $A989  00        BRK
  $A98A  00        BRK
  $A98B  00        BRK
  $A98C  80        .db $80
  $A98D  40        RTI
  $A98E  E0 40     CPX #$40
  $A990  EF        .db $EF
  $A991  C7        .db $C7
  $A992  F3        .db $F3
  $A993  D8        CLD
  $A994  FF        .db $FF
  $A995  FF        .db $FF
  $A996  FF        .db $FF
  $A997  FF        .db $FF
  $A998  C0 60     CPY #$60
  $A99A  F0 40     BEQ $A9DC
  $A99C  FF        .db $FF
  $A99D  00        BRK
  $A99E  FF        .db $FF
  $A99F  FF        .db $FF
  $A9A0  FF        .db $FF
  $A9A1  FF        .db $FF
  $A9A2  FF        .db $FF
  $A9A3  FF        .db $FF
  $A9A4  FF        .db $FF
  $A9A5  FF        .db $FF
  $A9A6  FF        .db $FF
  $A9A7  FF        .db $FF
  $A9A8  00        BRK
  $A9A9  00        BRK
  $A9AA  00        BRK
  $A9AB  00        BRK
  $A9AC  00        BRK
  $A9AD  00        BRK
  $A9AE  00        BRK
  $A9AF  00        BRK
  $A9B0  FF        .db $FF
  $A9B1  FF        .db $FF
  $A9B2  DF        .db $DF
  $A9B3  3F        .db $3F
  $A9B4  3F        .db $3F
  $A9B5  9F        .db $9F
  $A9B6  E7        .db $E7
  $A9B7  F8        SED
  $A9B8  00        BRK
  $A9B9  00        BRK

L_A9BA:
  $A9BA  00        BRK
  $A9BB  00        BRK

L_A9BC:
  $A9BC  00        BRK
  $A9BD  00        BRK

L_A9BE:
  $A9BE  E0 F8     CPX #$F8
  $A9C0  00        BRK
  $A9C1  00        BRK
  $A9C2  00        BRK
  $A9C3  00        BRK
  $A9C4  00        BRK
  $A9C5  00        BRK
  $A9C6  00        BRK
  $A9C7  00        BRK
  $A9C8  00        BRK
  $A9C9  00        BRK
  $A9CA  00        BRK
  $A9CB  00        BRK
  $A9CC  00        BRK
  $A9CD  00        BRK
  $A9CE  00        BRK
  $A9CF  00        BRK
  $A9D0  00        BRK
  $A9D1  00        BRK
  $A9D2  00        BRK
  $A9D3  00        BRK
  $A9D4  00        BRK
  $A9D5  00        BRK
  $A9D6  00        BRK
  $A9D7  00        BRK
  $A9D8  00        BRK
  $A9D9  00        BRK
  $A9DA  00        BRK
  $A9DB  00        BRK

L_A9DC:
  $A9DC  00        BRK
  $A9DD  00        BRK
  $A9DE  00        BRK
  $A9DF  00        BRK
  $A9E0  00        BRK
  $A9E1  00        BRK
  $A9E2  00        BRK
  $A9E3  00        BRK
  $A9E4  00        BRK
  $A9E5  00        BRK
  $A9E6  00        BRK
  $A9E7  00        BRK
  $A9E8  00        BRK
  $A9E9  00        BRK
  $A9EA  00        BRK
  $A9EB  00        BRK
  $A9EC  00        BRK
  $A9ED  00        BRK
  $A9EE  00        BRK
  $A9EF  00        BRK
  $A9F0  00        BRK
  $A9F1  00        BRK

L_A9F2:
  $A9F2  00        BRK
  $A9F3  00        BRK
  $A9F4  00        BRK
  $A9F5  00        BRK
  $A9F6  00        BRK
  $A9F7  00        BRK
  $A9F8  00        BRK
  $A9F9  00        BRK
  $A9FA  00        BRK
  $A9FB  00        BRK
  $A9FC  00        BRK
  $A9FD  00        BRK
  $A9FE  00        BRK
  $A9FF  00        BRK
  $AA00  00        BRK
  $AA01  FF        .db $FF
  $AA02  FF        .db $FF
  $AA03  98        TYA
  $AA04  BA        TSX
  $AA05  F8        SED
  $AA06  00        BRK
  $AA07  00        BRK
  $AA08  FF        .db $FF
  $AA09  00        BRK
  $AA0A  70 00     BVS $AA0C

L_AA0C:
  $AA0C  02        .db $02
  $AA0D  02        .db $02
  $AA0E  FA        .db $FA
  $AA0F  02        .db $02
  $AA10  70 A8     BVS $A9BA
  $AA12  70 A8     BVS $A9BC
  $AA14  70 A8     BVS $A9BE
  $AA16  70 00     BVS $AA18

L_AA18:
  $AA18  8A        TXA
  $AA19  DA        .db $DA
  $AA1A  8A        TXA
  $AA1B  DA        .db $DA
  $AA1C  8A        TXA
  $AA1D  DA        .db $DA
  $AA1E  8A        TXA
  $AA1F  02        .db $02
  $AA20  01 BF     ORA ($BF,X)
  $AA22  BF        .db $BF
  $AA23  3F        .db $3F
  $AA24  FF        .db $FF
  $AA25  FF        .db $FF
  $AA26  10 00     BPL $AA28

L_AA28:
  $AA28  BF        .db $BF
  $AA29  01 01     ORA ($01,X)
  $AA2B  31 10     AND ($10),Y
  $AA2D  10 FF     BPL $AA2E
  $AA2F  00        BRK
  $AA30  FF        .db $FF
  $AA31  FF        .db $FF
  $AA32  9F        .db $9F
  $AA33  9F        .db $9F
  $AA34  9F        .db $9F
  $AA35  98        TYA
  $AA36  F8        SED
  $AA37  18        CLC
  $AA38  00        BRK
  $AA39  00        BRK
  $AA3A  7F        .db $7F
  $AA3B  70 70     BVS $AAAD
  $AA3D  77        .db $77
  $AA3E  F7        .db $F7
  $AA3F  17        .db $17
  $AA40  00        BRK
  $AA41  F7        .db $F7
  $AA42  F7        .db $F7
  $AA43  F7        .db $F7
  $AA44  80        .db $80
  $AA45  A7        .db $A7
  $AA46  37        .db $37
  $AA47  20 F7 00  JSR $00F7
  $AA4A  00        BRK
  $AA4B  F0 07     BEQ $AA54
  $AA4D  17        .db $17
  $AA4E  B0 17     BCS $AA67
  $AA50  B0 A0     BCS $A9F2
  $AA52  FE F8 F8  INC $F8F8,X
  $AA55  18        CLC
  $AA56  18        CLC
  $AA57  1F        .db $1F
  $AA58  37        .db $37
  $AA59  10 F8     BPL $AA53
  $AA5B  0F        .db $0F
  $AA5C  1E FF FE  ASL $FEFF,X
  $AA5F  FF        .db $FF
  $AA60  20 FE FE  JSR $FEFE
  $AA63  FE 3E FE  INC $FE3E,X
  $AA66  FE 00 FE  INC $FE00,X
  $AA69  20 2C 20  JSR $202C
  $AA6C  EC E0 00  CPX $00E0
  $AA6F  FE 00 00  INC $0000,X
  $AA72  07        .db $07
  $AA73  F1 01     SBC ($01),Y
  $AA75  F1 01     SBC ($01),Y
  $AA77  FF        .db $FF
  $AA78  FE 00 01  INC $0100,X
  $AA7B  0F        .db $0F
  $AA7C  07        .db $07
  $AA7D  0F        .db $0F
  $AA7E  07        .db $07
  $AA7F  FF        .db $FF
  $AA80  FF        .db $FF
  $AA81  FF        .db $FF
  $AA82  FF        .db $FF
  $AA83  CD CD FD  CMP $FDCD
  $AA86  FD CD FF  SBC $FFCD,X
  $AA89  09 09     ORA #$09
  $AA8B  3B        .db $3B
  $AA8C  3B        .db $3B
  $AA8D  3B        .db $3B
  $AA8E  0B        .db $0B
  $AA8F  3B        .db $3B
  $AA90  FD FD CD  SBC $CDFD,X
  $AA93  CD FF FF  CMP $FFFF
  $AA96  00        BRK
  $AA97  FF        .db $FF
  $AA98  3B        .db $3B
  $AA99  0B        .db $0B
  $AA9A  3B        .db $3B
  $AA9B  3B        .db $3B
  $AA9C  FF        .db $FF
  $AA9D  FF        .db $FF
  $AA9E  00        BRK
  $AA9F  FF        .db $FF
  $AAA0  0C        .db $0C
  $AAA1  04        .db $04
  $AAA2  77        .db $77
  $AAA3  77        .db $77
  $AAA4  00        BRK
  $AAA5  40        RTI
  $AAA6  40        RTI
  $AAA7  40        RTI
  $AAA8  7B        .db $7B
  $AAA9  73        .db $73

L_AAAA:
  $AAAA  77        .db $77
  $AAAB  77        .db $77
  $AAAC  00        BRK

L_AAAD:
  $AAAD  7F        .db $7F
  $AAAE  7F        .db $7F
  $AAAF  7F        .db $7F
  $AAB0  40        RTI
  $AAB1  40        RTI
  $AAB2  40        RTI
  $AAB3  40        RTI
  $AAB4  40        RTI
  $AAB5  40        RTI

L_AAB6:
  $AAB6  40        RTI
  $AAB7  C0 7F     CPY #$7F
  $AAB9  7F        .db $7F
  $AABA  7F        .db $7F
  $AABB  7F        .db $7F
  $AABC  7F        .db $7F
  $AABD  7F        .db $7F
  $AABE  7F        .db $7F
  $AABF  FF        .db $FF
  $AAC0  17        .db $17
  $AAC1  10 F3     BPL $AAB6
  $AAC3  F0 00     BEQ $AAC5

L_AAC5:
  $AAC5  FF        .db $FF
  $AAC6  FF        .db $FF
  $AAC7  C3        .db $C3
  $AAC8  F8        SED
  $AAC9  FF        .db $FF
  $AACA  FF        .db $FF
  $AACB  FF        .db $FF
  $AACC  0F        .db $0F
  $AACD  00        BRK
  $AACE  02        .db $02
  $AACF  3E CB A3  ROL $A3CB,X
  $AAD2  A3        .db $A3
  $AAD3  AB        .db $AB
  $AAD4  C3        .db $C3
  $AAD5  C3        .db $C3
  $AAD6  C3        .db $C3
  $AAD7  C0 36     CPY #$36
  $AAD9  16 1E     ASL $1E,X
  $AADB  16 36     ASL $36,X
  $AADD  3F        .db $3F
  $AADE  3C        .db $3C
  $AADF  3F        .db $3F
  $AAE0  FF        .db $FF
  $AAE1  03        .db $03
  $AAE2  03        .db $03
  $AAE3  2B        .db $2B
  $AAE4  03        .db $03
  $AAE5  FE FE 76  INC $76FE,X
  $AAE8  03        .db $03
  $AAE9  FF        .db $FF
  $AAEA  FF        .db $FF
  $AAEB  FF        .db $FF
  $AAEC  FF        .db $FF
  $AAED  02        .db $02
  $AAEE  06 FE     ASL $FE
  $AAF0  76 06     ROR $06,X
  $AAF2  76 76     ROR $76,X
  $AAF4  06 FE     ASL $FE
  $AAF6  FE 36 8E  INC $8E36,X
  $AAF9  FE FE 8E  INC $8EFE,X
  $AAFC  FE FE 26  INC $26FE,X
  $AAFF  EE A0 CA  INC $CAA0
  $AB02  CE C8 CE  DEC $CEC8
  $AB05  C8        INY
  $AB06  CE DF 60  DEC $60DF
  $AB09  2E 2E 26  ROL $262E
  $AB0C  AE A6 AE  LDX $AEA6
  $AB0F  20 C0 C0  JSR $C0C0
  $AB12  C0 CA     CPY #$CA
  $AB14  CE C8 CE  DEC $CEC8
  $AB17  C8        INY
  $AB18  3F        .db $3F
  $AB19  3F        .db $3F
  $AB1A  20 AE AE  JSR $AEAE
  $AB1D  A6 2E     LDX $2E
  $AB1F  26 80     ROL $80
  $AB21  80        .db $80
  $AB22  80        .db $80
  $AB23  B2        .db $B2
  $AB24  80        .db $80
  $AB25  B8        CLV
  $AB26  80        .db $80
  $AB27  AE 7F 7F  LDX $7F7F
  $AB2A  7F        .db $7F
  $AB2B  7F        .db $7F
  $AB2C  7F        .db $7F
  $AB2D  7F        .db $7F
  $AB2E  7F        .db $7F
  $AB2F  7F        .db $7F
  $AB30  00        BRK
  $AB31  00        BRK
  $AB32  FF        .db $FF
  $AB33  FF        .db $FF
  $AB34  EC CD ED  CPX $EDCD
  $AB37  CC FF FF  CPY $FFFF
  $AB3A  00        BRK
  $AB3B  08        PHP
  $AB3C  3B        .db $3B
  $AB3D  3B        .db $3B
  $AB3E  3B        .db $3B
  $AB3F  3B        .db $3B
  $AB40  AA        TAX
  $AB41  A0 AC     LDY #$AC
  $AB43  C0 C1     CPY #$C1
  $AB45  C3        .db $C3
  $AB46  FF        .db $FF
  $AB47  FF        .db $FF
  $AB48  1F        .db $1F
  $AB49  1F        .db $1F

L_AB4A:
  $AB4A  1F        .db $1F
  $AB4B  3F        .db $3F
  $AB4C  3F        .db $3F
  $AB4D  3E 7F FF  ROL $FF7F,X
  $AB50  00        BRK
  $AB51  7F        .db $7F
  $AB52  F8        SED
  $AB53  F7        .db $F7
  $AB54  14        .db $14
  $AB55  54        .db $54
  $AB56  54        .db $54
  $AB57  17        .db $17
  $AB58  00        BRK
  $AB59  FF        .db $FF
  $AB5A  08        PHP
  $AB5B  1C        .db $1C
  $AB5C  FF        .db $FF
  $AB5D  FF        .db $FF
  $AB5E  FF        .db $FF
  $AB5F  FF        .db $FF
  $AB60  36 36     ROL $36,X
  $AB62  66 C6     ROR $C6
  $AB64  86 06     STX $06
  $AB66  FE FE EE  INC $EEFE,X
  $AB69  EE DE BE  INC $BEDE
  $AB6C  7E FE FE  ROR $FEFE,X
  $AB6F  FE 00 FF  INC $FF00,X
  $AB72  02        .db $02
  $AB73  FA        .db $FA
  $AB74  02        .db $02
  $AB75  02        .db $02
  $AB76  03        .db $03
  $AB77  FB        .db $FB
  $AB78  00        BRK
  $AB79  FF        .db $FF
  $AB7A  02        .db $02
  $AB7B  02        .db $02
  $AB7C  1A        .db $1A
  $AB7D  BA        TSX
  $AB7E  FB        .db $FB
  $AB7F  FB        .db $FB
  $AB80  CE C8 C3  DEC $C3C8
  $AB83  E4 08     CPX $08
  $AB85  E0 FF     CPX #$FF
  $AB87  80        .db $80
  $AB88  2E 26 2E  ROL $2E26
  $AB8B  EF        .db $EF
  $AB8C  EF        .db $EF
  $AB8D  E0 80     CPX #$80

L_AB8F:
  $AB8F  FF        .db $FF
  $AB90  BF        .db $BF
  $AB91  B0 B7     BCS $AB4A
  $AB93  B1 B7     LDA ($B7),Y
  $AB95  B1 37     LDA ($37),Y
  $AB97  00        BRK
  $AB98  FF        .db $FF
  $AB99  FF        .db $FF
  $AB9A  FF        .db $FF
  $AB9B  F9 FF F9  SBC $F9FF,Y
  $AB9E  7F        .db $7F
  $AB9F  00        BRK
  $ABA0  FF        .db $FF
  $ABA1  00        BRK
  $ABA2  FF        .db $FF
  $ABA3  AA        TAX
  $ABA4  AA        TAX
  $ABA5  00        BRK
  $ABA6  DF        .db $DF
  $ABA7  10 FF     BPL $ABA8
  $ABA9  00        BRK
  $ABAA  AA        TAX
  $ABAB  FF        .db $FF
  $ABAC  FF        .db $FF
  $ABAD  00        BRK
  $ABAE  10 DF     BPL $AB8F
  $ABB0  DF        .db $DF
  $ABB1  50 50     BVC $AC03
  $ABB3  5F        .db $5F
  $ABB4  50 50     BVC $AC06
  $ABB6  4F        .db $4F
  $ABB7  00        BRK
  $ABB8  DF        .db $DF
  $ABB9  50 5F     BVC $AC1A
  $ABBB  5F        .db $5F
  $ABBC  50 5F     BVC $AC1D
  $ABBE  4F        .db $4F
  $ABBF  00        BRK
  $ABC0  F3        .db $F3
  $ABC1  00        BRK
  $ABC2  E1 A1     SBC ($A1,X)
  $ABC4  AE 00 FF  LDX $FF00
  $ABC7  00        BRK
  $ABC8  FC        .db $FC
  $ABC9  0F        .db $0F
  $ABCA  AF        .db $AF
  $ABCB  EF        .db $EF
  $ABCC  EE 00 00  INC $0000
  $ABCF  FF        .db $FF
  $ABD0  FF        .db $FF
  $ABD1  09 0F     ORA #$0F
  $ABD3  F9 0F 09  SBC $090F,Y
  $ABD6  FF        .db $FF
  $ABD7  00        BRK
  $ABD8  FF        .db $FF
  $ABD9  0D FF FD  ORA $FDFF
  $ABDC  0F        .db $0F
  $ABDD  FD FF 00  SBC $00FF,X
  $ABE0  FF        .db $FF
  $ABE1  03        .db $03
  $ABE2  53        .db $53
  $ABE3  53        .db $53
  $ABE4  0F        .db $0F
  $ABE5  40        RTI
  $ABE6  5D 41 03  EOR $0341,X
  $ABE9  FF        .db $FF
  $ABEA  FF        .db $FF
  $ABEB  FF        .db $FF
  $ABEC  0F        .db $0F
  $ABED  40        RTI
  $ABEE  41 5D     EOR ($5D,X)
  $ABF0  5D 41 5D  EOR $5D41,X
  $ABF3  41 5D     EOR ($5D,X)
  $ABF5  41 1C     EOR ($1C,X)
  $ABF7  00        BRK
  $ABF8  5D 5D 5D  EOR $5D5D,X
  $ABFB  5D 5D 5D  EOR $5D5D,X
  $ABFE  1C        .db $1C
  $ABFF  00        BRK
  $AC00  E0 EA     CPX #$EA
  $AC02  EA        NOP

L_AC03:
  $AC03  00        BRK
  $AC04  0A        ASL
  $AC05  00        BRK

L_AC06:
  $AC06  1F        .db $1F
  $AC07  00        BRK
  $AC08  40        RTI
  $AC09  40        RTI
  $AC0A  40        RTI
  $AC0B  EA        NOP
  $AC0C  EA        NOP
  $AC0D  E0 E0     CPX #$E0
  $AC0F  FF        .db $FF
  $AC10  FF        .db $FF
  $AC11  00        BRK
  $AC12  EF        .db $EF
  $AC13  00        BRK
  $AC14  00        BRK
  $AC15  EF        .db $EF
  $AC16  EF        .db $EF
  $AC17  00        BRK
  $AC18  FF        .db $FF
  $AC19  00        BRK

L_AC1A:
  $AC1A  EF        .db $EF
  $AC1B  EC EF EF  CPX $EFEF
  $AC1E  EF        .db $EF
  $AC1F  00        BRK
  $AC20  07        .db $07
  $AC21  D7        .db $D7
  $AC22  D7        .db $D7
  $AC23  00        BRK
  $AC24  D0 00     BNE $AC26

L_AC26:
  $AC26  F8        SED
  $AC27  00        BRK
  $AC28  02        .db $02
  $AC29  02        .db $02
  $AC2A  02        .db $02
  $AC2B  D7        .db $D7
  $AC2C  D7        .db $D7
  $AC2D  07        .db $07
  $AC2E  07        .db $07
  $AC2F  FF        .db $FF
  $AC30  FF        .db $FF
  $AC31  00        BRK
  $AC32  F7        .db $F7
  $AC33  00        BRK
  $AC34  00        BRK
  $AC35  F7        .db $F7
  $AC36  F7        .db $F7
  $AC37  00        BRK
  $AC38  FF        .db $FF
  $AC39  00        BRK
  $AC3A  F7        .db $F7
  $AC3B  37        .db $37
  $AC3C  F7        .db $F7
  $AC3D  F7        .db $F7
  $AC3E  F7        .db $F7
  $AC3F  00        BRK
  $AC40  C2        .db $C2
  $AC41  CA        DEX
  $AC42  CB        .db $CB
  $AC43  C8        INY
  $AC44  CA        DEX
  $AC45  C1 C9     CMP ($C9,X)
  $AC47  C3        .db $C3
  $AC48  32        .db $32
  $AC49  39 F8 3B  AND $3BF8,Y
  $AC4C  3A        .db $3A
  $AC4D  F0 32     BEQ $AC81
  $AC4F  3B        .db $3B
  $AC50  C1 C3     CMP ($C3,X)
  $AC52  C1 C3     CMP ($C3,X)
  $AC54  C1 C3     CMP ($C3,X)
  $AC56  C1 C3     CMP ($C3,X)
  $AC58  3A        .db $3A
  $AC59  3B        .db $3B
  $AC5A  FA        .db $FA
  $AC5B  3B        .db $3B
  $AC5C  3A        .db $3A
  $AC5D  FB        .db $FB
  $AC5E  3A        .db $3A
  $AC5F  3A        .db $3A
  $AC60  96 B6     STX $B6,Y
  $AC62  B0 36     BCS $AC9A
  $AC64  B6 10     LDX $10,Y
  $AC66  26 A6     ROL $A6
  $AC68  8E 2E 28  STX $282E
  $AC6B  AE AE 08  LDX $08AE
  $AC6E  9E        .db $9E
  $AC6F  9E        .db $9E
  $AC70  26 A6     ROL $A6
  $AC72  20 A6 26  JSR $26A6
  $AC75  A0 26     LDY #$26
  $AC77  A6 9E     LDX $9E
  $AC79  9E        .db $9E
  $AC7A  98        TYA
  $AC7B  9E        .db $9E
  $AC7C  9E        .db $9E
  $AC7D  98        TYA
  $AC7E  9E        .db $9E
  $AC7F  9E        .db $9E
  $AC80  00        BRK

L_AC81:
  $AC81  08        PHP
  $AC82  08        PHP
  $AC83  00        BRK
  $AC84  00        BRK
  $AC85  08        PHP
  $AC86  0C        .db $0C
  $AC87  0C        .db $0C
  $AC88  00        BRK
  $AC89  08        PHP
  $AC8A  08        PHP
  $AC8B  08        PHP
  $AC8C  08        PHP
  $AC8D  00        BRK
  $AC8E  04        .db $04
  $AC8F  04        .db $04
  $AC90  1C        .db $1C
  $AC91  1C        .db $1C
  $AC92  1C        .db $1C
  $AC93  18        CLC
  $AC94  18        CLC
  $AC95  18        CLC
  $AC96  18        CLC
  $AC97  18        CLC
  $AC98  14        .db $14
  $AC99  14        .db $14

L_AC9A:
  $AC9A  14        .db $14
  $AC9B  14        .db $14
  $AC9C  14        .db $14
  $AC9D  14        .db $14
  $AC9E  14        .db $14
  $AC9F  14        .db $14
  $ACA0  00        BRK
  $ACA1  00        BRK
  $ACA2  00        BRK
  $ACA3  08        PHP
  $ACA4  08        PHP
  $ACA5  00        BRK
  $ACA6  00        BRK
  $ACA7  08        PHP
  $ACA8  00        BRK
  $ACA9  00        BRK
  $ACAA  00        BRK
  $ACAB  08        PHP
  $ACAC  08        PHP
  $ACAD  08        PHP
  $ACAE  08        PHP
  $ACAF  00        BRK
  $ACB0  0C        .db $0C
  $ACB1  0C        .db $0C
  $ACB2  1C        .db $1C
  $ACB3  1C        .db $1C
  $ACB4  1C        .db $1C
  $ACB5  18        CLC
  $ACB6  18        CLC
  $ACB7  18        CLC
  $ACB8  04        .db $04
  $ACB9  04        .db $04
  $ACBA  14        .db $14
  $ACBB  14        .db $14
  $ACBC  14        .db $14
  $ACBD  14        .db $14
  $ACBE  14        .db $14
  $ACBF  14        .db $14
  $ACC0  18        CLC
  $ACC1  0A        ASL
  $ACC2  0A        ASL
  $ACC3  0A        ASL
  $ACC4  0E 0E 0C  ASL $0C0E
  $ACC7  0C        .db $0C
  $ACC8  14        .db $14
  $ACC9  16 16     ASL $16,X
  $ACCB  16 12     ASL $12,X
  $ACCD  12        .db $12
  $ACCE  12        .db $12
  $ACCF  12        .db $12
  $ACD0  0C        .db $0C
  $ACD1  0C        .db $0C
  $ACD2  0C        .db $0C
  $ACD3  2C 2D 2D  BIT $2D2D
  $ACD6  2D 2D 12  AND $122D
  $ACD9  12        .db $12
  $ACDA  12        .db $12
  $ACDB  32        .db $32
  $ACDC  33        .db $33
  $ACDD  33        .db $33
  $ACDE  33        .db $33
  $ACDF  33        .db $33
  $ACE0  18        CLC
  $ACE1  18        CLC
  $ACE2  18        CLC
  $ACE3  0A        ASL
  $ACE4  0A        ASL
  $ACE5  0A        ASL
  $ACE6  0E 0E 14  ASL $140E
  $ACE9  14        .db $14
  $ACEA  14        .db $14
  $ACEB  16 16     ASL $16,X
  $ACED  16 12     ASL $12,X
  $ACEF  12        .db $12
  $ACF0  0C        .db $0C
  $ACF1  0C        .db $0C
  $ACF2  0C        .db $0C
  $ACF3  0C        .db $0C
  $ACF4  0C        .db $0C
  $ACF5  2C 2D 2D  BIT $2D2D
  $ACF8  12        .db $12
  $ACF9  12        .db $12
  $ACFA  12        .db $12
  $ACFB  12        .db $12
  $ACFC  12        .db $12
  $ACFD  32        .db $32
  $ACFE  33        .db $33
  $ACFF  33        .db $33
  $AD00  00        BRK
  $AD01  00        BRK
  $AD02  00        BRK
  $AD03  00        BRK
  $AD04  00        BRK
  $AD05  00        BRK
  $AD06  00        BRK
  $AD07  00        BRK
  $AD08  E8        INX
  $AD09  28        PLP
  $AD0A  28        PLP
  $AD0B  2F        .db $2F
  $AD0C  70 60     BVS $AD6E
  $AD0E  70 00     BVS $AD10

L_AD10:
  $AD10  00        BRK
  $AD11  00        BRK
  $AD12  00        BRK
  $AD13  00        BRK
  $AD14  00        BRK
  $AD15  00        BRK
  $AD16  00        BRK
  $AD17  00        BRK
  $AD18  E0 0E     CPX #$0E
  $AD1A  7E 4A 40  ROR $404A,X
  $AD1D  C0 0F     CPY #$0F
  $AD1F  08        PHP
  $AD20  00        BRK
  $AD21  00        BRK
  $AD22  00        BRK
  $AD23  00        BRK
  $AD24  00        BRK
  $AD25  00        BRK
  $AD26  00        BRK
  $AD27  00        BRK
  $AD28  FF        .db $FF
  $AD29  80        .db $80
  $AD2A  80        .db $80
  $AD2B  F0 17     BEQ $AD44
  $AD2D  91 91     STA ($91),Y
  $AD2F  BD 00 00  LDA $0000,X
  $AD32  00        BRK
  $AD33  00        BRK
  $AD34  00        BRK
  $AD35  00        BRK
  $AD36  00        BRK
  $AD37  00        BRK
  $AD38  B9 BC B8  LDA $B8BC,Y
  $AD3B  3C        .db $3C
  $AD3C  00        BRK
  $AD3D  17        .db $17
  $AD3E  F0 00     BEQ $AD40

L_AD40:
  $AD40  00        BRK
  $AD41  00        BRK
  $AD42  00        BRK
  $AD43  00        BRK

L_AD44:
  $AD44  00        BRK
  $AD45  00        BRK
  $AD46  00        BRK
  $AD47  00        BRK
  $AD48  00        BRK
  $AD49  00        BRK
  $AD4A  00        BRK
  $AD4B  00        BRK
  $AD4C  00        BRK
  $AD4D  00        BRK
  $AD4E  00        BRK
  $AD4F  00        BRK
  $AD50  00        BRK
  $AD51  00        BRK
  $AD52  00        BRK
  $AD53  00        BRK
  $AD54  00        BRK
  $AD55  00        BRK
  $AD56  00        BRK
  $AD57  00        BRK
  $AD58  E0 0E     CPX #$0E
  $AD5A  7E 4A 40  ROR $404A,X
  $AD5D  C0 0F     CPY #$0F
  $AD5F  08        PHP
  $AD60  00        BRK
  $AD61  00        BRK
  $AD62  00        BRK
  $AD63  00        BRK
  $AD64  00        BRK
  $AD65  00        BRK
  $AD66  00        BRK
  $AD67  00        BRK
  $AD68  00        BRK
  $AD69  00        BRK
  $AD6A  00        BRK
  $AD6B  00        BRK
  $AD6C  00        BRK
  $AD6D  00        BRK

L_AD6E:
  $AD6E  00        BRK
  $AD6F  3C        .db $3C
  $AD70  00        BRK
  $AD71  00        BRK
  $AD72  00        BRK
  $AD73  00        BRK
  $AD74  00        BRK
  $AD75  00        BRK

L_AD76:
  $AD76  00        BRK
  $AD77  00        BRK
  $AD78  39 BC B8  AND $B8BC,Y
  $AD7B  3C        .db $3C
  $AD7C  00        BRK
  $AD7D  17        .db $17
  $AD7E  F0 00     BEQ $AD80

L_AD80:
  $AD80  17        .db $17
  $AD81  10 F3     BPL $AD76
  $AD83  F0 00     BEQ $AD85

L_AD85:
  $AD85  00        BRK
  $AD86  00        BRK
  $AD87  00        BRK
  $AD88  F8        SED
  $AD89  FF        .db $FF
  $AD8A  FF        .db $FF
  $AD8B  FF        .db $FF
  $AD8C  0F        .db $0F
  $AD8D  FF        .db $FF
  $AD8E  FF        .db $FF
  $AD8F  FF        .db $FF
  $AD90  00        BRK
  $AD91  00        BRK
  $AD92  00        BRK
  $AD93  00        BRK
  $AD94  00        BRK
  $AD95  00        BRK
  $AD96  00        BRK
  $AD97  00        BRK
  $AD98  FF        .db $FF
  $AD99  FF        .db $FF
  $AD9A  FF        .db $FF
  $AD9B  FF        .db $FF
  $AD9C  FF        .db $FF
  $AD9D  FF        .db $FF
  $AD9E  FF        .db $FF
  $AD9F  FF        .db $FF
  $ADA0  FF        .db $FF
  $ADA1  03        .db $03
  $ADA2  03        .db $03
  $ADA3  2B        .db $2B
  $ADA4  03        .db $03
  $ADA5  03        .db $03
  $ADA6  03        .db $03
  $ADA7  03        .db $03
  $ADA8  03        .db $03
  $ADA9  FF        .db $FF
  $ADAA  FF        .db $FF
  $ADAB  FF        .db $FF
  $ADAC  FF        .db $FF
  $ADAD  FF        .db $FF
  $ADAE  FF        .db $FF
  $ADAF  FF        .db $FF
  $ADB0  03        .db $03
  $ADB1  03        .db $03
  $ADB2  03        .db $03
  $ADB3  03        .db $03
  $ADB4  03        .db $03
  $ADB5  03        .db $03
  $ADB6  03        .db $03
  $ADB7  03        .db $03
  $ADB8  FF        .db $FF
  $ADB9  FF        .db $FF
  $ADBA  FF        .db $FF
  $ADBB  FF        .db $FF
  $ADBC  FF        .db $FF
  $ADBD  FF        .db $FF
  $ADBE  FF        .db $FF
  $ADBF  FF        .db $FF
  $ADC0  00        BRK
  $ADC1  00        BRK
  $ADC2  00        BRK
  $ADC3  00        BRK
  $ADC4  00        BRK
  $ADC5  00        BRK
  $ADC6  00        BRK
  $ADC7  00        BRK
  $ADC8  FF        .db $FF
  $ADC9  FF        .db $FF
  $ADCA  FF        .db $FF
  $ADCB  FF        .db $FF
  $ADCC  FF        .db $FF
  $ADCD  FF        .db $FF
  $ADCE  FF        .db $FF
  $ADCF  FF        .db $FF
  $ADD0  00        BRK
  $ADD1  00        BRK
  $ADD2  F7        .db $F7
  $ADD3  F7        .db $F7
  $ADD4  14        .db $14
  $ADD5  54        .db $54
  $ADD6  54        .db $54
  $ADD7  17        .db $17
  $ADD8  FF        .db $FF
  $ADD9  FF        .db $FF
  $ADDA  0F        .db $0F
  $ADDB  1C        .db $1C
  $ADDC  FF        .db $FF
  $ADDD  FF        .db $FF
  $ADDE  FF        .db $FF
  $ADDF  FF        .db $FF
  $ADE0  03        .db $03
  $ADE1  03        .db $03
  $ADE2  03        .db $03
  $ADE3  03        .db $03
  $ADE4  03        .db $03
  $ADE5  E3        .db $E3
  $ADE6  03        .db $03
  $ADE7  E3        .db $E3
  $ADE8  FF        .db $FF
  $ADE9  FF        .db $FF
  $ADEA  FF        .db $FF
  $ADEB  FF        .db $FF
  $ADEC  FF        .db $FF
  $ADED  FF        .db $FF
  $ADEE  FF        .db $FF
  $ADEF  FF        .db $FF
  $ADF0  43        .db $43
  $ADF1  03        .db $03
  $ADF2  FE FA 02  INC $02FA,X
  $ADF5  02        .db $02
  $ADF6  03        .db $03

L_ADF7:
  $ADF7  FB        .db $FB
  $ADF8  FF        .db $FF
  $ADF9  FF        .db $FF
  $ADFA  FE 02 1A  INC $1A02,X
  $ADFD  BA        TSX
  $ADFE  FB        .db $FB
  $ADFF  FB        .db $FB
  $AE00  00        BRK
  $AE01  00        BRK
  $AE02  00        BRK

L_AE03:
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
  $AE1E  01 01     ORA ($01,X)
  $AE20  00        BRK
  $AE21  00        BRK
  $AE22  00        BRK
  $AE23  00        BRK
  $AE24  00        BRK
  $AE25  01 03     ORA ($03,X)
  $AE27  06 00     ASL $00
  $AE29  00        BRK
  $AE2A  00        BRK
  $AE2B  00        BRK
  $AE2C  00        BRK
  $AE2D  00        BRK
  $AE2E  00        BRK
  $AE2F  00        BRK
  $AE30  03        .db $03
  $AE31  03        .db $03
  $AE32  01 00     ORA ($00,X)
  $AE34  00        BRK
  $AE35  00        BRK
  $AE36  00        BRK
  $AE37  00        BRK
  $AE38  0C        .db $0C
  $AE39  1C        .db $1C
  $AE3A  3E 77 63  ROL $6377,X
  $AE3D  C5 8E     CMP $8E
  $AE3F  9F        .db $9F
  $AE40  00        BRK
  $AE41  01 0F     ORA ($0F,X)
  $AE43  38        SEC
  $AE44  E0 C3     CPX #$C3
  $AE46  0F        .db $0F
  $AE47  3F        .db $3F
  $AE48  00        BRK
  $AE49  00        BRK
  $AE4A  00        BRK
  $AE4B  00        BRK
  $AE4C  00        BRK
  $AE4D  00        BRK
  $AE4E  00        BRK
  $AE4F  00        BRK
  $AE50  7F        .db $7F
  $AE51  BC D3 EF  LDY $EFD3,X
  $AE54  7E 39 37  ROR $3739,X
  $AE57  0F        .db $0F
  $AE58  00        BRK
  $AE59  00        BRK
  $AE5A  00        BRK
  $AE5B  00        BRK
  $AE5C  80        .db $80
  $AE5D  C0 C0     CPY #$C0
  $AE5F  60        RTS
  $AE60  00        BRK
  $AE61  FF        .db $FF
  $AE62  83        .db $83
  $AE63  03        .db $03
  $AE64  7B        .db $7B
  $AE65  FB        .db $FB
  $AE66  FB        .db $FB
  $AE67  C3        .db $C3
  $AE68  00        BRK
  $AE69  00        BRK
  $AE6A  00        BRK
  $AE6B  00        BRK
  $AE6C  00        BRK
  $AE6D  00        BRK
  $AE6E  00        BRK
  $AE6F  00        BRK
  $AE70  1F        .db $1F
  $AE71  FF        .db $FF
  $AE72  F0 8F     BEQ $AE03
  $AE74  7F        .db $7F
  $AE75  F0 80     BEQ $ADF7
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
  $AE81  FF        .db $FF
  $AE82  C1 C0     CMP ($C0,X)
  $AE84  DE DF DF  DEC $DFDF,X
  $AE87  C3        .db $C3
  $AE88  00        BRK
  $AE89  FF        .db $FF
  $AE8A  C1 C0     CMP ($C0,X)
  $AE8C  DE DF DF  DEC $DFDF,X
  $AE8F  C3        .db $C3
  $AE90  F8        SED
  $AE91  FF        .db $FF
  $AE92  0F        .db $0F
  $AE93  F1 FE     SBC ($FE),Y
  $AE95  0F        .db $0F
  $AE96  01 00     ORA ($00,X)
  $AE98  F8        SED
  $AE99  FF        .db $FF
  $AE9A  0F        .db $0F
  $AE9B  F1 FE     SBC ($FE),Y
  $AE9D  0F        .db $0F
  $AE9E  01 00     ORA ($00,X)
  $AEA0  00        BRK
  $AEA1  80        .db $80
  $AEA2  F0 1C     BEQ $AEC0
  $AEA4  0F        .db $0F
  $AEA5  E3        .db $E3
  $AEA6  F8        SED
  $AEA7  FC        .db $FC
  $AEA8  00        BRK
  $AEA9  80        .db $80
  $AEAA  F0 1C     BEQ $AEC8
  $AEAC  0F        .db $0F
  $AEAD  E3        .db $E3

L_AEAE:
  $AEAE  F8        SED
  $AEAF  FC        .db $FC
  $AEB0  FE 3C C9  INC $C93C,X
  $AEB3  E3        .db $E3
  $AEB4  76 9C     ROR $9C,X
  $AEB6  EC F0 FE  CPX $FEF0
  $AEB9  3C        .db $3C
  $AEBA  C9 E3     CMP #$E3
  $AEBC  77        .db $77
  $AEBD  9F        .db $9F
  $AEBE  EF        .db $EF
  $AEBF  F6 00     INC $00,X
  $AEC1  00        BRK
  $AEC2  00        BRK
  $AEC3  00        BRK
  $AEC4  00        BRK
  $AEC5  80        .db $80
  $AEC6  C0 60     CPY #$60

L_AEC8:
  $AEC8  00        BRK
  $AEC9  00        BRK
  $AECA  00        BRK
  $AECB  00        BRK
  $AECC  00        BRK
  $AECD  80        .db $80
  $AECE  C0 60     CPY #$60
  $AED0  C0 C0     CPY #$C0

L_AED2:
  $AED2  80        .db $80
  $AED3  00        BRK
  $AED4  00        BRK
  $AED5  00        BRK
  $AED6  00        BRK
  $AED7  00        BRK
  $AED8  F0 F8     BEQ $AED2
  $AEDA  FC        .db $FC
  $AEDB  EE C6 A3  INC $A3C6
  $AEDE  73        .db $73
  $AEDF  F9 00 00  SBC $0000,Y
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

L_AEFE:
  $AEFE  80        .db $80
  $AEFF  80        .db $80
  $AF00  13        .db $13
  $AF01  13        .db $13
  $AF02  13        .db $13
  $AF03  13        .db $13
  $AF04  1B        .db $1B
  $AF05  19 19 09  ORA $0919,Y
  $AF08  13        .db $13
  $AF09  13        .db $13
  $AF0A  13        .db $13
  $AF0B  13        .db $13
  $AF0C  1B        .db $1B
  $AF0D  19 19 09  ORA $0919,Y
  $AF10  0D 0C 0C  ORA $0C0C
  $AF13  06 06     ASL $06
  $AF15  07        .db $07
  $AF16  03        .db $03
  $AF17  03        .db $03
  $AF18  0D 0C 0C  ORA $0C0C
  $AF1B  06 06     ASL $06
  $AF1D  07        .db $07
  $AF1E  03        .db $03
  $AF1F  02        .db $02
  $AF20  B6 B6     LDX $B6,Y
  $AF22  B6 D6     LDX $D6,Y
  $AF24  DA        .db $DA
  $AF25  DB        .db $DB
  $AF26  DB        .db $DB
  $AF27  EB        .db $EB
  $AF28  B6 B6     LDX $B6,Y
  $AF2A  B6 D6     LDX $D6,Y
  $AF2C  DA        .db $DA
  $AF2D  DB        .db $DB
  $AF2E  DB        .db $DB
  $AF2F  EB        .db $EB
  $AF30  ED E5 CE  SBC $CEE5
  $AF33  1E 7F FB  ASL $FB7F,X
  $AF36  F5 CE     SBC $CE,X
  $AF38  ED E5 CE  SBC $CEE5
  $AF3B  18        CLC
  $AF3C  70 C0     BVS $AEFE
  $AF3E  80        .db $80
  $AF3F  00        BRK
  $AF40  1D 1F 00  ORA $001F,X
  $AF43  06 06     ASL $06
  $AF45  03        .db $03
  $AF46  03        .db $03
  $AF47  01 1B     ORA ($1B,X)
  $AF49  1F        .db $1F
  $AF4A  0F        .db $0F
  $AF4B  0D 0D 0E  ORA $0E0D
  $AF4E  06 07     ASL $07
  $AF50  80        .db $80
  $AF51  80        .db $80
  $AF52  C0 C0     CPY #$C0
  $AF54  60        RTS
  $AF55  70 B8     BVS $AF0F
  $AF57  DC        .db $DC
  $AF58  83        .db $83
  $AF59  03        .db $03
  $AF5A  01 00     ORA ($00,X)

L_AF5C:
  $AF5C  00        BRK
  $AF5D  00        BRK
  $AF5E  00        BRK
  $AF5F  00        BRK
  $AF60  E8        INX
  $AF61  80        .db $80
  $AF62  00        BRK
  $AF63  07        .db $07
  $AF64  09 0E     ORA #$0E
  $AF66  9F        .db $9F
  $AF67  3F        .db $3F
  $AF68  E8        INX
  $AF69  E8        INX
  $AF6A  EC F0 F0  CPX $F0F0
  $AF6D  F0 60     BEQ $AFCF
  $AF6F  C0 7F     CPY #$7F
  $AF71  5F        .db $5F
  $AF72  E7        .db $E7
  $AF73  F9 3F 0F  SBC $0F3F,Y
  $AF76  00        BRK
  $AF77  00        BRK
  $AF78  80        .db $80
  $AF79  B8        CLV
  $AF7A  1E 06 00  ASL $0006,X
  $AF7D  00        BRK
  $AF7E  00        BRK
  $AF7F  00        BRK

L_AF80:
  $AF80  17        .db $17
  $AF81  01 00     ORA ($00,X)
  $AF83  E0 90     CPX #$90
  $AF85  70 F9     BVS $AF80
  $AF87  FC        .db $FC
  $AF88  00        BRK
  $AF89  16 37     ASL $37,X
  $AF8B  EF        .db $EF
  $AF8C  9F        .db $9F
  $AF8D  7F        .db $7F
  $AF8E  FE FF FE  INC $FEFF,X
  $AF91  E6 9F     INC $9F
  $AF93  FF        .db $FF
  $AF94  FC        .db $FC
  $AF95  F0 00     BEQ $AF97

L_AF97:
  $AF97  00        BRK
  $AF98  FF        .db $FF
  $AF99  FB        .db $FB
  $AF9A  E7        .db $E7
  $AF9B  9F        .db $9F
  $AF9C  FC        .db $FC
  $AF9D  F0 00     BEQ $AF9F

L_AF9F:
  $AF9F  00        BRK
  $AFA0  D8        CLD
  $AFA1  F8        SED

L_AFA2:
  $AFA2  00        BRK
  $AFA3  60        RTS
  $AFA4  60        RTS
  $AFA5  C0 C0     CPY #$C0
  $AFA7  80        .db $80
  $AFA8  60        RTS
  $AFA9  00        BRK
  $AFAA  F0 B0     BEQ $AF5C
  $AFAC  B0 70     BCS $B01E
  $AFAE  60        RTS
  $AFAF  E0 01     CPX #$01
  $AFB1  01 03     ORA ($03,X)
  $AFB3  03        .db $03
  $AFB4  06 0E     ASL $0E
  $AFB6  1D 3B C0  ORA $C03B,X
  $AFB9  C1 83     CMP ($83,X)
  $AFBB  03        .db $03
  $AFBC  06 0E     ASL $0E
  $AFBE  1D 3B 6D  ORA $6D3B,X
  $AFC1  6D 6D 6D  ADC $6D6D
  $AFC4  5B        .db $5B
  $AFC5  DB        .db $DB
  $AFC6  DB        .db $DB
  $AFC7  D3        .db $D3
  $AFC8  00        BRK
  $AFC9  00        BRK
  $AFCA  00        BRK
  $AFCB  00        BRK
  $AFCC  00        BRK
  $AFCD  00        BRK
  $AFCE  00        BRK

L_AFCF:
  $AFCF  00        BRK
  $AFD0  B7        .db $B7
  $AFD1  B7        .db $B7
  $AFD2  71 7C     ADC ($7C),Y
  $AFD4  FE DF AF  INC $AFDF,X
  $AFD7  B7        .db $B7
  $AFD8  00        BRK
  $AFD9  00        BRK
  $AFDA  00        BRK
  $AFDB  60        RTS
  $AFDC  F0 DC     BEQ $AFBA
  $AFDE  AE B7 C8  LDX $C8B7
  $AFE1  C8        INY
  $AFE2  C8        INY
  $AFE3  C8        INY
  $AFE4  98        TYA
  $AFE5  98        TYA
  $AFE6  98        TYA
  $AFE7  90 00     BCC $AFE9

L_AFE9:
  $AFE9  00        BRK
  $AFEA  00        BRK
  $AFEB  00        BRK
  $AFEC  00        BRK
  $AFED  00        BRK
  $AFEE  00        BRK
  $AFEF  00        BRK
  $AFF0  B0 B0     BCS $AFA2
  $AFF2  30 60     BMI $B054
  $AFF4  60        RTS
  $AFF5  E0 C0     CPX #$C0
  $AFF7  C0 00     CPY #$00
  $AFF9  00        BRK
  $AFFA  00        BRK
  $AFFB  00        BRK
  $AFFC  00        BRK
  $AFFD  00        BRK
  $AFFE  00        BRK
  $AFFF  80        .db $80
  $B000  00        BRK
  $B001  00        BRK

L_B002:
  $B002  00        BRK
  $B003  00        BRK
  $B004  00        BRK
  $B005  00        BRK
  $B006  00        BRK
  $B007  00        BRK
  $B008  03        .db $03
  $B009  03        .db $03
  $B00A  06 06     ASL $06
  $B00C  06 0C     ASL $0C
  $B00E  0C        .db $0C
  $B00F  0C        .db $0C
  $B010  00        BRK
  $B011  00        BRK
  $B012  00        BRK
  $B013  1C        .db $1C
  $B014  1F        .db $1F
  $B015  19 10 13  ORA $1310,Y
  $B018  08        PHP
  $B019  1F        .db $1F
  $B01A  1F        .db $1F
  $B01B  1F        .db $1F
  $B01C  1F        .db $1F
  $B01D  19 10 13  ORA $1310,Y
  $B020  00        BRK
  $B021  00        BRK
  $B022  00        BRK
  $B023  00        BRK
  $B024  00        BRK
  $B025  00        BRK
  $B026  00        BRK
  $B027  00        BRK
  $B028  1E 3D 3B  ASL $3B3D,X
  $B02B  7B        .db $7B

L_B02C:
  $B02C  76 76     ROR $76,X
  $B02E  ED ED 00  SBC $00ED
  $B031  00        BRK
  $B032  00        BRK
  $B033  00        BRK
  $B034  F0 F6     BEQ $B02C
  $B036  36 B6     ROL $B6,X
  $B038  5B        .db $5B
  $B039  1B        .db $1B
  $B03A  FB        .db $FB
  $B03B  FA        .db $FA
  $B03C  F6 F6     INC $F6,X
  $B03E  36 B6     ROL $B6,X
  $B040  0C        .db $0C
  $B041  00        BRK
  $B042  00        BRK
  $B043  00        BRK
  $B044  00        BRK
  $B045  01 03     ORA ($03,X)
  $B047  03        .db $03
  $B048  D0 B8     BNE $B002
  $B04A  70 60     BVS $B0AC
  $B04C  C0 C0     CPY #$C0
  $B04E  80        .db $80
  $B04F  80        .db $80
  $B050  06 07     ASL $07
  $B052  0F        .db $0F
  $B053  0F        .db $0F

L_B054:
  $B054  0F        .db $0F
  $B055  0D 1D 1D  ORA $1D1D
  $B058  01 00     ORA ($00,X)
  $B05A  0E 0F 0D  ASL $0D0F
  $B05D  0B        .db $0B
  $B05E  1B        .db $1B
  $B05F  1B        .db $1B
  $B060  00        BRK
  $B061  00        BRK
  $B062  00        BRK
  $B063  37        .db $37
  $B064  F3        .db $F3
  $B065  D0 B8     BNE $B01F
  $B067  78        SEI
  $B068  00        BRK
  $B069  00        BRK
  $B06A  0F        .db $0F
  $B06B  0F        .db $0F
  $B06C  0C        .db $0C
  $B06D  2F        .db $2F
  $B06E  67        .db $67
  $B06F  C7        .db $C7
  $B070  F8        SED
  $B071  FC        .db $FC
  $B072  FC        .db $FC
  $B073  F8        SED
  $B074  F6 EC     INC $EC,X
  $B076  E8        INX
  $B077  E8        INX
  $B078  87        .db $87
  $B079  83        .db $83
  $B07A  02        .db $02
  $B07B  01 C1     ORA ($C1,X)
  $B07D  E0 E8     CPX #$E8
  $B07F  E8        INX
  $B080  00        BRK
  $B081  00        BRK
  $B082  00        BRK
  $B083  EC CF 0F  CPX $0FCF

L_B086:
  $B086  1B        .db $1B
  $B087  1D 00 00  ORA $0000,X
  $B08A  F0 FC     BEQ $B088
  $B08C  3F        .db $3F
  $B08D  FB        .db $FB
  $B08E  FD FE 1E  SBC $1EFE,X
  $B091  3E 3F 1F  ROL $1F3F,X
  $B094  6F        .db $6F
  $B095  37        .db $37
  $B096  17        .db $17
  $B097  17        .db $17
  $B098  FF        .db $FF
  $B099  FF        .db $FF
  $B09A  7F        .db $7F
  $B09B  9F        .db $9F
  $B09C  EC 30 00  CPX $0030
  $B09F  00        BRK
  $B0A0  30 00     BMI $B0A2

L_B0A2:
  $B0A2  00        BRK
  $B0A3  00        BRK

L_B0A4:
  $B0A4  00        BRK
  $B0A5  80        .db $80
  $B0A6  C0 C0     CPY #$C0
  $B0A8  3B        .db $3B
  $B0A9  1D 0E 06  ORA $060E,X

L_B0AC:
  $B0AC  03        .db $03
  $B0AD  83        .db $83
  $B0AE  C1 C1     CMP ($C1,X)
  $B0B0  E0 E0     CPX #$E0
  $B0B2  F0 F0     BEQ $B0A4
  $B0B4  B0 D0     BCS $B086
  $B0B6  D8        CLD
  $B0B7  D8        CLD
  $B0B8  60        RTS
  $B0B9  E0 80     CPX #$80
  $B0BB  00        BRK
  $B0BC  40        RTI
  $B0BD  60        RTS
  $B0BE  60        RTS
  $B0BF  60        RTS
  $B0C0  00        BRK
  $B0C1  00        BRK
  $B0C2  00        BRK
  $B0C3  00        BRK
  $B0C4  00        BRK
  $B0C5  00        BRK
  $B0C6  00        BRK
  $B0C7  00        BRK
  $B0C8  7C        .db $7C
  $B0C9  BC DE CE  LDY $CEDE,X
  $B0CC  6F        .db $6F
  $B0CD  67        .db $67
  $B0CE  B7        .db $B7
  $B0CF  B7        .db $B7
  $B0D0  00        BRK
  $B0D1  00        BRK
  $B0D2  00        BRK
  $B0D3  00        BRK
  $B0D4  0F        .db $0F
  $B0D5  6F        .db $6F
  $B0D6  6C 6D DB  JMP ($DB6D)
  $B0D9  D8        CLD
  $B0DA  D9 5F 60  CMP $605F,Y
  $B0DD  00        BRK
  $B0DE  00        BRK
  $B0DF  00        BRK
  $B0E0  00        BRK
  $B0E1  00        BRK
  $B0E2  00        BRK
  $B0E3  00        BRK
  $B0E4  00        BRK
  $B0E5  00        BRK
  $B0E6  00        BRK
  $B0E7  00        BRK
  $B0E8  C0 C0     CPY #$C0
  $B0EA  60        RTS
  $B0EB  60        RTS
  $B0EC  20 30 B0  JSR $B030
  $B0EF  B0 00     BCS $B0F1

L_B0F1:
  $B0F1  00        BRK
  $B0F2  00        BRK
  $B0F3  38        SEC
  $B0F4  F8        SED
  $B0F5  F8        SED
  $B0F6  08        PHP
  $B0F7  C8        INY
  $B0F8  10 78     BPL $B172
  $B0FA  F8        SED
  $B0FB  C0 00     CPY #$00
  $B0FD  00        BRK
  $B0FE  00        BRK
  $B0FF  00        BRK
  $B100  01 01     ORA ($01,X)
  $B102  00        BRK
  $B103  00        BRK
  $B104  00        BRK
  $B105  00        BRK
  $B106  00        BRK
  $B107  00        BRK
  $B108  00        BRK
  $B109  00        BRK
  $B10A  00        BRK
  $B10B  00        BRK
  $B10C  00        BRK
  $B10D  00        BRK
  $B10E  00        BRK
  $B10F  00        BRK
  $B110  00        BRK
  $B111  00        BRK
  $B112  00        BRK
  $B113  00        BRK
  $B114  00        BRK
  $B115  00        BRK
  $B116  00        BRK
  $B117  00        BRK
  $B118  00        BRK
  $B119  00        BRK
  $B11A  00        BRK
  $B11B  00        BRK
  $B11C  00        BRK
  $B11D  00        BRK
  $B11E  00        BRK
  $B11F  00        BRK
  $B120  9F        .db $9F
  $B121  9F        .db $9F
  $B122  CF        .db $CF
  $B123  4F        .db $4F
  $B124  67        .db $67
  $B125  33        .db $33
  $B126  19 0C 00  ORA $000C,Y
  $B129  00        BRK
  $B12A  00        BRK
  $B12B  00        BRK
  $B12C  00        BRK
  $B12D  00        BRK
  $B12E  00        BRK
  $B12F  00        BRK
  $B130  06 03     ASL $03
  $B132  01 00     ORA ($00,X)
  $B134  00        BRK
  $B135  00        BRK
  $B136  00        BRK
  $B137  00        BRK
  $B138  00        BRK
  $B139  00        BRK
  $B13A  00        BRK
  $B13B  00        BRK
  $B13C  00        BRK
  $B13D  00        BRK
  $B13E  00        BRK

L_B13F:
  $B13F  00        BRK
  $B140  6F        .db $6F
  $B141  37        .db $37
  $B142  99 CE E7  STA $E7CE,Y
  $B145  F9 FD 7B  SBC $7BFD,Y
  $B148  00        BRK
  $B149  00        BRK
  $B14A  00        BRK
  $B14B  00        BRK
  $B14C  00        BRK
  $B14D  00        BRK
  $B14E  00        BRK
  $B14F  00        BRK
  $B150  3B        .db $3B
  $B151  12        .db $12
  $B152  C6 F6     DEC $F6
  $B154  3C        .db $3C
  $B155  0C        .db $0C
  $B156  00        BRK
  $B157  00        BRK
  $B158  00        BRK
  $B159  01 01     ORA ($01,X)
  $B15B  01 03     ORA ($03,X)
  $B15D  03        .db $03
  $B15E  01 00     ORA ($00,X)
  $B160  00        BRK
  $B161  80        .db $80
  $B162  C0 00     CPY #$00
  $B164  80        .db $80
  $B165  80        .db $80
  $B166  00        BRK
  $B167  00        BRK
  $B168  00        BRK
  $B169  00        BRK
  $B16A  30 7F     BMI $B1EB
  $B16C  0F        .db $0F
  $B16D  70 FF     BVS $B16E
  $B16F  C7        .db $C7
  $B170  00        BRK
  $B171  00        BRK

L_B172:
  $B172  00        BRK
  $B173  00        BRK
  $B174  00        BRK
  $B175  00        BRK
  $B176  00        BRK
  $B177  00        BRK
  $B178  D8        CLD
  $B179  DF        .db $DF
  $B17A  BF        .db $BF
  $B17B  8F        .db $8F
  $B17C  00        BRK
  $B17D  E0 FF     CPX #$FF
  $B17F  00        BRK
  $B180  00        BRK
  $B181  01 03     ORA ($03,X)
  $B183  00        BRK
  $B184  01 01     ORA ($01,X)
  $B186  00        BRK
  $B187  00        BRK
  $B188  00        BRK
  $B189  01 0F     ORA ($0F,X)
  $B18B  FE F1 0F  INC $0FF1,X
  $B18E  FF        .db $FF
  $B18F  E3        .db $E3
  $B190  00        BRK
  $B191  00        BRK
  $B192  00        BRK
  $B193  00        BRK
  $B194  00        BRK
  $B195  00        BRK
  $B196  00        BRK
  $B197  00        BRK
  $B198  1B        .db $1B
  $B199  F9 FD F9  SBC $F9FD,Y
  $B19C  00        BRK
  $B19D  03        .db $03
  $B19E  FF        .db $FF
  $B19F  00        BRK
  $B1A0  F7        .db $F7
  $B1A1  EE 9D 73  INC $739D
  $B1A4  EF        .db $EF
  $B1A5  9F        .db $9F
  $B1A6  DF        .db $DF
  $B1A7  DF        .db $DF
  $B1A8  F7        .db $F7
  $B1A9  EE 9D 73  INC $739D
  $B1AC  EF        .db $EF
  $B1AD  9F        .db $9F
  $B1AE  DF        .db $DF
  $B1AF  DF        .db $DF
  $B1B0  EC 60 63  CPX $6360
  $B1B3  7F        .db $7F
  $B1B4  3C        .db $3C
  $B1B5  30 00     BMI $B1B7

L_B1B7:
  $B1B7  00        BRK
  $B1B8  EC E0 E3  CPX $E3E0
  $B1BB  FF        .db $FF
  $B1BC  FC        .db $FC
  $B1BD  F0 80     BEQ $B13F
  $B1BF  00        BRK
  $B1C0  79 F9 F3  ADC $F3F9,Y
  $B1C3  F6 E6     INC $E6,X
  $B1C5  CC 98 30  CPY $3098
  $B1C8  79 F9 F3  ADC $F3F9,Y
  $B1CB  F6 E6     INC $E6,X
  $B1CD  CC 98 30  CPY $3098
  $B1D0  60        RTS
  $B1D1  C0 80     CPY #$80
  $B1D3  00        BRK
  $B1D4  00        BRK
  $B1D5  00        BRK
  $B1D6  00        BRK
  $B1D7  00        BRK
  $B1D8  60        RTS
  $B1D9  C0 80     CPY #$80
  $B1DB  00        BRK
  $B1DC  00        BRK
  $B1DD  00        BRK
  $B1DE  00        BRK
  $B1DF  00        BRK
  $B1E0  80        .db $80
  $B1E1  80        .db $80
  $B1E2  00        BRK
  $B1E3  00        BRK
  $B1E4  00        BRK
  $B1E5  00        BRK
  $B1E6  00        BRK
  $B1E7  00        BRK
  $B1E8  80        .db $80
  $B1E9  80        .db $80
  $B1EA  00        BRK

L_B1EB:
  $B1EB  00        BRK
  $B1EC  00        BRK
  $B1ED  00        BRK
  $B1EE  00        BRK
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
  $B200  7F        .db $7F
  $B201  FF        .db $FF
  $B202  C0 D2     CPY #$D2
  $B204  C0 FF     CPY #$FF
  $B206  C0 C9     CPY #$C9
  $B208  00        BRK
  $B209  00        BRK
  $B20A  3F        .db $3F
  $B20B  24 24     BIT $24
  $B20D  3F        .db $3F
  $B20E  00        BRK
  $B20F  09 FF     ORA #$FF
  $B211  C0 C0     CPY #$C0
  $B213  FF        .db $FF
  $B214  C0 FF     CPY #$FF
  $B216  7F        .db $7F
  $B217  00        BRK
  $B218  00        BRK
  $B219  3F        .db $3F
  $B21A  3F        .db $3F
  $B21B  3F        .db $3F
  $B21C  00        BRK
  $B21D  7F        .db $7F
  $B21E  7F        .db $7F
  $B21F  00        BRK
  $B220  FE FF 0B  INC $0BFF,X
  $B223  4B        .db $4B
  $B224  0B        .db $0B
  $B225  FB        .db $FB
  $B226  03        .db $03
  $B227  23        .db $23
  $B228  00        BRK
  $B229  03        .db $03
  $B22A  FB        .db $FB
  $B22B  9B        .db $9B
  $B22C  9B        .db $9B
  $B22D  FB        .db $FB
  $B22E  03        .db $03
  $B22F  23        .db $23
  $B230  F3        .db $F3
  $B231  0B        .db $0B
  $B232  0B        .db $0B
  $B233  FB        .db $FB
  $B234  03        .db $03
  $B235  FF        .db $FF
  $B236  FE 00 0B  INC $0B00,X
  $B239  FB        .db $FB
  $B23A  FB        .db $FB
  $B23B  FB        .db $FB
  $B23C  03        .db $03
  $B23D  FF        .db $FF
  $B23E  FE 00 FF  INC $FF00,X
  $B241  C0 90     CPY #$90
  $B243  06 90     ASL $90
  $B245  10 80     BPL $B1C7
  $B247  00        BRK
  $B248  FF        .db $FF
  $B249  C0 D6     CPY #$D6
  $B24B  00        BRK
  $B24C  D6 00     DEC $00,X
  $B24E  C0 00     CPY #$00
  $B250  90 10     BCC $B262
  $B252  90 00     BCC $B254

L_B254:
  $B254  80        .db $80
  $B255  C0 FF     CPY #$FF
  $B257  00        BRK
  $B258  D0 06     BNE $B260
  $B25A  D0 0A     BNE $B266
  $B25C  C0 C0     CPY #$C0
  $B25E  FF        .db $FF
  $B25F  00        BRK

L_B260:
  $B260  FE 00 02  INC $0200,X
  $B263  52        .db $52
  $B264  02        .db $02
  $B265  02        .db $02

L_B266:
  $B266  00        BRK
  $B267  00        BRK
  $B268  FE 00 52  INC $5200,X
  $B26B  52        .db $52
  $B26C  02        .db $02
  $B26D  02        .db $02
  $B26E  00        BRK
  $B26F  00        BRK
  $B270  00        BRK
  $B271  02        .db $02
  $B272  02        .db $02
  $B273  7E 02 00  ROR $0002,X
  $B276  FE 00 02  INC $0200,X
  $B279  02        .db $02
  $B27A  72        .db $72
  $B27B  2E 02 00  ROL $0002
  $B27E  FE 00 00  INC $0000,X
  $B281  00        BRK
  $B282  00        BRK
  $B283  00        BRK
  $B284  00        BRK
  $B285  00        BRK
  $B286  00        BRK
  $B287  00        BRK
  $B288  00        BRK
  $B289  00        BRK
  $B28A  00        BRK
  $B28B  00        BRK
  $B28C  00        BRK
  $B28D  00        BRK
  $B28E  00        BRK
  $B28F  00        BRK
  $B290  00        BRK
  $B291  00        BRK
  $B292  00        BRK
  $B293  00        BRK
  $B294  00        BRK
  $B295  00        BRK
  $B296  00        BRK
  $B297  00        BRK
  $B298  00        BRK
  $B299  00        BRK
  $B29A  00        BRK
  $B29B  00        BRK
  $B29C  00        BRK
  $B29D  00        BRK
  $B29E  00        BRK
  $B29F  00        BRK
  $B2A0  00        BRK
  $B2A1  00        BRK
  $B2A2  00        BRK
  $B2A3  00        BRK
  $B2A4  00        BRK
  $B2A5  00        BRK
  $B2A6  00        BRK
  $B2A7  00        BRK
  $B2A8  00        BRK
  $B2A9  00        BRK
  $B2AA  00        BRK
  $B2AB  00        BRK
  $B2AC  00        BRK
  $B2AD  00        BRK
  $B2AE  00        BRK
  $B2AF  00        BRK
  $B2B0  00        BRK
  $B2B1  00        BRK
  $B2B2  00        BRK
  $B2B3  00        BRK
  $B2B4  00        BRK
  $B2B5  00        BRK
  $B2B6  00        BRK
  $B2B7  00        BRK
  $B2B8  00        BRK
  $B2B9  00        BRK
  $B2BA  00        BRK
  $B2BB  00        BRK
  $B2BC  00        BRK
  $B2BD  00        BRK
  $B2BE  00        BRK
  $B2BF  00        BRK
  $B2C0  00        BRK
  $B2C1  00        BRK
  $B2C2  00        BRK
  $B2C3  00        BRK
  $B2C4  00        BRK
  $B2C5  00        BRK
  $B2C6  00        BRK
  $B2C7  00        BRK
  $B2C8  00        BRK
  $B2C9  00        BRK
  $B2CA  00        BRK
  $B2CB  00        BRK
  $B2CC  00        BRK
  $B2CD  00        BRK
  $B2CE  00        BRK
  $B2CF  00        BRK
  $B2D0  00        BRK
  $B2D1  00        BRK
  $B2D2  00        BRK
  $B2D3  00        BRK
  $B2D4  00        BRK
  $B2D5  00        BRK
  $B2D6  00        BRK
  $B2D7  00        BRK
  $B2D8  00        BRK
  $B2D9  00        BRK
  $B2DA  00        BRK
  $B2DB  00        BRK
  $B2DC  00        BRK
  $B2DD  00        BRK
  $B2DE  00        BRK
  $B2DF  00        BRK
  $B2E0  00        BRK
  $B2E1  00        BRK
  $B2E2  00        BRK
  $B2E3  00        BRK
  $B2E4  00        BRK
  $B2E5  00        BRK
  $B2E6  00        BRK
  $B2E7  00        BRK
  $B2E8  00        BRK
  $B2E9  00        BRK
  $B2EA  00        BRK
  $B2EB  00        BRK
  $B2EC  00        BRK
  $B2ED  00        BRK
  $B2EE  00        BRK
  $B2EF  00        BRK
  $B2F0  00        BRK
  $B2F1  00        BRK
  $B2F2  00        BRK
  $B2F3  00        BRK
  $B2F4  00        BRK
  $B2F5  00        BRK
  $B2F6  00        BRK
  $B2F7  00        BRK
  $B2F8  00        BRK
  $B2F9  00        BRK
  $B2FA  00        BRK
  $B2FB  00        BRK
  $B2FC  00        BRK
  $B2FD  00        BRK
  $B2FE  00        BRK
  $B2FF  00        BRK
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
  $B400  49 40     EOR #$40
  $B402  28        PLP
  $B403  20 00 45  JSR $4500
  $B406  40        RTI
  $B407  40        RTI
  $B408  40        RTI
  $B409  45 40     EOR $40
  $B40B  40        RTI
  $B40C  00        BRK
  $B40D  00        BRK
  $B40E  00        BRK
  $B40F  FF        .db $FF
  $B410  FF        .db $FF
  $B411  FF        .db $FF
  $B412  FF        .db $FF
  $B413  FF        .db $FF
  $B414  FF        .db $FF
  $B415  FF        .db $FF
  $B416  FF        .db $FF
  $B417  FF        .db $FF
  $B418  FF        .db $FF
  $B419  FF        .db $FF
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
  $B42C  00        BRK
  $B42D  24 12     BIT $12
  $B42F  36 36     ROL $36,X
  $B431  48        PHA
  $B432  24 5A     BIT $5A
  $B434  12        .db $12
  $B435  6C 24 12  JMP ($1224)
  $B438  7E 00 24  ROR $2400,X
  $B43B  12        .db $12
  $B43C  7E FF FF  ROR $FFFF,X
  $B43F  FF        .db $FF
  $B440  FF        .db $FF
  $B441  FF        .db $FF
  $B442  FF        .db $FF
  $B443  FF        .db $FF
  $B444  FF        .db $FF
  $B445  FF        .db $FF
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
  $B460  9D 01 9E  STA $9E01,X
  $B463  01 9F     ORA ($9F,X)
  $B465  01 9A     ORA ($9A,X)
  $B467  03        .db $03
  $B468  9C        .db $9C
  $B469  01 96     ORA ($96,X)
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  27        .db $27
  $B46E  30 0F     BMI $B47F
  $B470  16 27     ASL $27,X
  $B472  90 02     BCC $B476
  $B474  91 02     STA ($02),Y

L_B476:
  $B476  92        .db $92
  $B477  02        .db $02
  $B478  9A        TXS
  $B479  03        .db $03
  $B47A  9C        .db $9C
  $B47B  01 96     ORA ($96,X)
  $B47D  03        .db $03
  $B47E  0F        .db $0F

L_B47F:
  $B47F  27        .db $27
  $B480  30 0F     BMI $B491
  $B482  11 31     ORA ($31),Y
  $B484  90 02     BCC $B488
  $B486  91 02     STA ($02),Y

L_B488:
  $B488  92        .db $92
  $B489  02        .db $02
  $B48A  9E        .db $9E
  $B48B  04        .db $04
  $B48C  9C        .db $9C
  $B48D  01 96     ORA ($96,X)
  $B48F  03        .db $03
  $B490  0F        .db $0F

L_B491:
  $B491  15 27     ORA $27,X
  $B493  0F        .db $0F
  $B494  11 3C     ORA ($3C),Y
  $B496  AB        .db $AB
  $B497  05 AC     ORA $AC
  $B499  05 AD     ORA $AD
  $B49B  05 AA     ORA $AA
  $B49D  06 AB     ASL $AB
  $B49F  06 AC     ASL $AC
  $B4A1  06 0F     ASL $0F
  $B4A3  30 11     BMI $B4B6
  $B4A5  0F        .db $0F
  $B4A6  28        PLP
  $B4A7  11 94     ORA ($94),Y
  $B4A9  01 95     ORA ($95,X)
  $B4AB  01 96     ORA ($96,X)
  $B4AD  01 97     ORA ($97,X)
  $B4AF  03        .db $03
  $B4B0  93        .db $93
  $B4B1  01 9F     ORA ($9F,X)
  $B4B3  03        .db $03
  $B4B4  0F        .db $0F
  $B4B5  11 30     ORA ($30),Y
  $B4B7  0F        .db $0F
  $B4B8  29 37     AND #$37
  $B4BA  98        TYA
  $B4BB  03        .db $03
  $B4BC  99 03 9A  STA $9A03,Y
  $B4BF  03        .db $03
  $B4C0  9B        .db $9B
  $B4C1  03        .db $03
  $B4C2  9C        .db $9C
  $B4C3  03        .db $03
  $B4C4  9F        .db $9F
  $B4C5  03        .db $03
  $B4C6  0F        .db $0F
  $B4C7  11 30     ORA ($30),Y
  $B4C9  0F        .db $0F
  $B4CA  16 27     ASL $27,X
  $B4CC  90 03     BCC $B4D1
  $B4CE  90 03     BCC $B4D3
  $B4D0  90 03     BCC $B4D5
  $B4D2  9E        .db $9E

L_B4D3:
  $B4D3  04        .db $04
  $B4D4  90 03     BCC $B4D9
  $B4D6  9F        .db $9F
  $B4D7  03        .db $03
  $B4D8  0F        .db $0F

L_B4D9:
  $B4D9  00        BRK
  $B4DA  30 0F     BMI $B4EB
  $B4DC  15 27     ORA $27,X
  $B4DE  9D 05 9E  STA $9E05,X
  $B4E1  05 9F     ORA $9F
  $B4E3  05 9E     ORA $9E
  $B4E5  04        .db $04
  $B4E6  90 03     BCC $B4EB
  $B4E8  9F        .db $9F
  $B4E9  03        .db $03
  $B4EA  24 15     BIT $15
  $B4EC  05 0F     ORA $0F
  $B4EE  30 27     BMI $B517
  $B4F0  FF        .db $FF
  $B4F1  FF        .db $FF
  $B4F2  FF        .db $FF
  $B4F3  FF        .db $FF
  $B4F4  FF        .db $FF
  $B4F5  FF        .db $FF
  $B4F6  FF        .db $FF
  $B4F7  FF        .db $FF
  $B4F8  FF        .db $FF
  $B4F9  FF        .db $FF
  $B4FA  FF        .db $FF
  $B4FB  FF        .db $FF
  $B4FC  FF        .db $FF
  $B4FD  FF        .db $FF
  $B4FE  FF        .db $FF
  $B4FF  FF        .db $FF
  $B500  FF        .db $FF
  $B501  FF        .db $FF
  $B502  FF        .db $FF
  $B503  FF        .db $FF
  $B504  FF        .db $FF
  $B505  FF        .db $FF
  $B506  FF        .db $FF
  $B507  FF        .db $FF
  $B508  FF        .db $FF
  $B509  FF        .db $FF
  $B50A  FF        .db $FF
  $B50B  FF        .db $FF
  $B50C  FF        .db $FF
  $B50D  FF        .db $FF
  $B50E  FF        .db $FF
  $B50F  FF        .db $FF
  $B510  FF        .db $FF
  $B511  FF        .db $FF
  $B512  FF        .db $FF
  $B513  FF        .db $FF
  $B514  FF        .db $FF
  $B515  FF        .db $FF
  $B516  FF        .db $FF

L_B517:
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
  $B602  02        .db $02
  $B603  03        .db $03
  $B604  03        .db $03
  $B605  04        .db $04
  $B606  05 06     ORA $06
  $B608  06 06     ASL $06
  $B60A  06 07     ASL $07
  $B60C  0A        ASL
  $B60D  0A        ASL
  $B60E  0C        .db $0C
  $B60F  0C        .db $0C
  $B610  0E 0E 0F  ASL $0F0E
  $B613  10 11     BPL $B626
  $B615  12        .db $12
  $B616  13        .db $13
  $B617  17        .db $17
  $B618  17        .db $17
  $B619  18        CLC
  $B61A  1D 1D 1F  ORA $1F1D,X
  $B61D  20 20 22  JSR $2220
  $B620  22        .db $22
  $B621  22        .db $22
  $B622  23        .db $23
  $B623  23        .db $23
  $B624  23        .db $23
  $B625  FF        .db $FF

L_B626:
  $B626  FF        .db $FF
  $B627  FF        .db $FF
  $B628  FF        .db $FF
  $B629  FF        .db $FF
  $B62A  FF        .db $FF
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

L_B69C:
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

L_B6B9:
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
  $B6D3  FF        .db $FF
  $B6D4  FF        .db $FF
  $B6D5  FF        .db $FF
  $B6D6  FF        .db $FF

L_B6D7:
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
  $B6FB  FF        .db $FF
  $B6FC  FF        .db $FF
  $B6FD  FF        .db $FF
  $B6FE  FF        .db $FF
  $B6FF  FF        .db $FF
  $B700  48        PHA
  $B701  F8        SED
  $B702  98        TYA
  $B703  48        PHA

L_B704:
  $B704  E8        INX

L_B705:
  $B705  C0 60     CPY #$60
  $B707  00        BRK
  $B708  40        RTI
  $B709  80        .db $80
  $B70A  D0 90     BNE $B69C
  $B70C  38        SEC
  $B70D  B8        CLV
  $B70E  48        PHA
  $B70F  B8        CLV
  $B710  00        BRK
  $B711  80        .db $80
  $B712  10 F0     BPL $B704
  $B714  60        RTS
  $B715  B0 C0     BCS $B6D7
  $B717  10 A0     BPL $B6B9
  $B719  10 74     BPL $B78F
  $B71B  9C        .db $9C
  $B71C  50 60     BVC $B77E
  $B71E  F0 00     BEQ $B720

L_B720:
  $B720  40        RTI
  $B721  90 30     BCC $B753
  $B723  B0 E0     BCS $B705
  $B725  FF        .db $FF
  $B726  FF        .db $FF
  $B727  FF        .db $FF
  $B728  FF        .db $FF
  $B729  FF        .db $FF
  $B72A  FF        .db $FF
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
  $B751  FF        .db $FF
  $B752  FF        .db $FF

L_B753:
  $B753  FF        .db $FF
  $B754  FF        .db $FF
  $B755  FF        .db $FF
  $B756  FF        .db $FF
  $B757  FF        .db $FF
  $B758  FF        .db $FF
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

L_B77E:
  $B77E  FF        .db $FF
  $B77F  FF        .db $FF
  $B780  FF        .db $FF
  $B781  FF        .db $FF
  $B782  FF        .db $FF
  $B783  FF        .db $FF
  $B784  FF        .db $FF
  $B785  FF        .db $FF
  $B786  FF        .db $FF
  $B787  FF        .db $FF
  $B788  FF        .db $FF
  $B789  FF        .db $FF
  $B78A  FF        .db $FF
  $B78B  FF        .db $FF
  $B78C  FF        .db $FF
  $B78D  FF        .db $FF
  $B78E  FF        .db $FF

L_B78F:
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
  $B800  9B        .db $9B
  $B801  AB        .db $AB
  $B802  6B        .db $6B
  $B803  8B        .db $8B
  $B804  8B        .db $8B
  $B805  20 60 38  JSR $3860
  $B808  40        RTI
  $B809  08        PHP
  $B80A  40        RTI
  $B80B  30 5C     BMI $B869
  $B80D  9C        .db $9C
  $B80E  9B        .db $9B
  $B80F  7B        .db $7B
  $B810  08        PHP
  $B811  50 30     BVC $B843
  $B813  50 30     BVC $B845
  $B815  30 08     BMI $B81F
  $B817  10 10     BPL $B829
  $B819  10 24     BPL $B83F
  $B81B  64        .db $64
  $B81C  80        .db $80
  $B81D  80        .db $80
  $B81E  80        .db $80

L_B81F:
  $B81F  80        .db $80
  $B820  6C 0C 0C  JMP ($0C0C)
  $B823  0C        .db $0C
  $B824  0C        .db $0C
  $B825  FF        .db $FF
  $B826  FF        .db $FF
  $B827  FF        .db $FF
  $B828  FF        .db $FF

L_B829:
  $B829  FF        .db $FF
  $B82A  FF        .db $FF
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

L_B83F:
  $B83F  FF        .db $FF
  $B840  FF        .db $FF
  $B841  FF        .db $FF
  $B842  FF        .db $FF

L_B843:
  $B843  FF        .db $FF
  $B844  FF        .db $FF

L_B845:
  $B845  FF        .db $FF
  $B846  FF        .db $FF
  $B847  FF        .db $FF
  $B848  FF        .db $FF
  $B849  FF        .db $FF
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

L_B869:
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
  $B900  40        RTI
  $B901  41 40     EOR ($40,X)
  $B903  41 40     EOR ($40,X)
  $B905  3E 3E 3E  ROL $3E3E,X
  $B908  3E 39 3E  ROL $3E39,X
  $B90B  37        .db $37
  $B90C  50 50     BVC $B95E
  $B90E  40        RTI
  $B90F  41 39     EOR ($39,X)
  $B911  36 37     ROL $37,X
  $B913  36 36     ROL $36,X
  $B915  37        .db $37
  $B916  39 2B 2B  AND $2B2B,Y
  $B919  2B        .db $2B
  $B91A  4C 4B 4A  JMP $4A4B
  $B91D  47        .db $47
  $B91E  47        .db $47
  $B91F  4A        LSR
  $B920  30 30     BMI $B952
  $B922  30 30     BMI $B954
  $B924  30 FF     BMI $B925
  $B926  FF        .db $FF
  $B927  FF        .db $FF
  $B928  FF        .db $FF
  $B929  FF        .db $FF
  $B92A  FF        .db $FF
  $B92B  FF        .db $FF
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

L_B952:
  $B952  FF        .db $FF
  $B953  FF        .db $FF

L_B954:
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

L_B95E:
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
  $BA00  02        .db $02
  $BA01  03        .db $03
  $BA02  03        .db $03
  $BA03  0A        ASL
  $BA04  0A        ASL
  $BA05  13        .db $13
  $BA06  13        .db $13
  $BA07  14        .db $14
  $BA08  14        .db $14
  $BA09  15 15     ORA $15,X
  $BA0B  16 18     ASL $18,X
  $BA0D  1B        .db $1B
  $BA0E  1B        .db $1B
  $BA0F  1B        .db $1B
  $BA10  1B        .db $1B
  $BA11  1C        .db $1C
  $BA12  1C        .db $1C
  $BA13  1C        .db $1C
  $BA14  1C        .db $1C
  $BA15  1C        .db $1C
  $BA16  1C        .db $1C
  $BA17  1C        .db $1C
  $BA18  1C        .db $1C
  $BA19  1C        .db $1C
  $BA1A  1C        .db $1C
  $BA1B  1D 1D 1D  ORA $1D1D,X
  $BA1E  1D 26 FF  ORA $FF26,X
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
  $BA40  6E 1E BE  ROR $BE1E
  $BA43  80        .db $80
  $BA44  80        .db $80
  $BA45  F8        SED
  $BA46  F8        SED
  $BA47  F8        SED
  $BA48  F8        SED
  $BA49  08        PHP
  $BA4A  08        PHP
  $BA4B  50 58     BVC $BAA5
  $BA4D  48        PHA
  $BA4E  68        PLA
  $BA4F  88        DEY
  $BA50  A8        TAY
  $BA51  58        CLI
  $BA52  54        .db $54
  $BA53  54        .db $54
  $BA54  64        .db $64
  $BA55  6C 74 84  JMP ($8474)
  $BA58  84 94     STY $94
  $BA5A  9C        .db $9C
  $BA5B  58        CLI
  $BA5C  58        CLI
  $BA5D  A0 A0     LDY #$A0
  $BA5F  D0 FF     BNE $BA60
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
  $BA80  08        PHP
  $BA81  08        PHP
  $BA82  08        PHP
  $BA83  08        PHP
  $BA84  08        PHP
  $BA85  4F        .db $4F
  $BA86  6F        .db $6F
  $BA87  4F        .db $4F
  $BA88  6F        .db $6F
  $BA89  4F        .db $4F
  $BA8A  6F        .db $6F
  $BA8B  4A        LSR
  $BA8C  BA        TSX
  $BA8D  0F        .db $0F
  $BA8E  0F        .db $0F
  $BA8F  0F        .db $0F
  $BA90  48        PHA
  $BA91  48        PHA
  $BA92  8C CC CC  STY $CCCC
  $BA95  8C CC 8C  STY $8CCC
  $BA98  CC CC 8C  CPY $8CCC
  $BA9B  8F        .db $8F
  $BA9C  BF        .db $BF
  $BA9D  98        TYA
  $BA9E  C8        INY
  $BA9F  48        PHA
  $BAA0  FF        .db $FF
  $BAA1  FF        .db $FF
  $BAA2  FF        .db $FF
  $BAA3  FF        .db $FF
  $BAA4  FF        .db $FF

L_BAA5:
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
  $BAC0  42        .db $42
  $BAC1  43        .db $43
  $BAC2  42        .db $42
  $BAC3  42        .db $42
  $BAC4  43        .db $43
  $BAC5  2F        .db $2F
  $BAC6  2F        .db $2F
  $BAC7  2F        .db $2F
  $BAC8  2F        .db $2F
  $BAC9  2F        .db $2F
  $BACA  2F        .db $2F
  $BACB  78        SEI
  $BACC  78        SEI
  $BACD  57        .db $57
  $BACE  57        .db $57
  $BACF  57        .db $57
  $BAD0  7A        .db $7A
  $BAD1  7B        .db $7B
  $BAD2  79 79 79  ADC $7979,Y
  $BAD5  79 79 79  ADC $7979,Y
  $BAD8  79 79 79  ADC $7979,Y
  $BADB  57        .db $57
  $BADC  57        .db $57
  $BADD  7B        .db $7B
  $BADE  7A        .db $7A
  $BADF  76 FF     ROR $FF,X
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
  $BB00  74        .db $74
  $BB01  B4 74     LDY $74,X
  $BB03  44        .db $44
  $BB04  94 94     STY $94,X
  $BB06  00        BRK
  $BB07  0A        ASL
  $BB08  14        .db $14
  $BB09  16 1F     ASL $1F,X
  $BB0B  1F        .db $1F
  $BB0C  00        BRK
  $BB0D  0C        .db $0C
  $BB0E  17        .db $17
  $BB0F  17        .db $17
  $BB10  1C        .db $1C
  $BB11  1C        .db $1C
  $BB12  00        BRK
  $BB13  03        .db $03
  $BB14  07        .db $07
  $BB15  0B        .db $0B
  $BB16  1F        .db $1F
  $BB17  1F        .db $1F
  $BB18  84 87     STY $87
  $BB1A  89        .db $89
  $BB1B  8A        TXA
  $BB1C  8C 8C E0  STY $E08C
  $BB1F  60        RTS
  $BB20  E0 60     CPX #$60
  $BB22  A0 A0     LDY #$A0
  $BB24  85 87     STA $87
  $BB26  8A        TXA
  $BB27  8A        TXA
  $BB28  8D 8D 60  STA $608D
  $BB2B  E0 60     CPX #$60
  $BB2D  E0 20     CPX #$20
  $BB2F  20 00 01  JSR $0100
  $BB32  03        .db $03
  $BB33  05 09     ORA $09
  $BB35  09 00     ORA #$00
  $BB37  0A        ASL
  $BB38  14        .db $14
  $BB39  16 1F     ASL $1F,X
  $BB3B  1F        .db $1F
  $BB3C  09 0A     ORA #$0A
  $BB3E  14        .db $14
  $BB3F  1B        .db $1B
  $BB40  24 24     BIT $24
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
  $BC00  08        PHP
  $BC01  90 09     BCC $BC0C
  $BC03  00        BRK
  $BC04  84 01     STY $01
  $BC06  09 9D     ORA #$9D
  $BC08  03        .db $03
  $BC09  01 9A     ORA ($9A,X)
  $BC0B  01 03     ORA ($03,X)
  $BC0D  9C        .db $9C
  $BC0E  01 01     ORA ($01,X)
  $BC10  96 01     STX $01,Y
  $BC12  03        .db $03
  $BC13  80        .db $80
  $BC14  06 09     ASL $09
  $BC16  A0 0A     LDY #$0A
  $BC18  01 FF     ORA ($FF,X)
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
  $BD06  09 9D     ORA #$9D
  $BD08  03        .db $03
  $BD09  01 9A     ORA ($9A,X)
  $BD0B  01 03     ORA ($03,X)
  $BD0D  9C        .db $9C
  $BD0E  01 01     ORA ($01,X)
  $BD10  96 01     STX $01,Y
  $BD12  03        .db $03
  $BD13  80        .db $80
  $BD14  06 09     ASL $09
  $BD16  AA        TAX
  $BD17  0A        ASL
  $BD18  01 FF     ORA ($FF,X)
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
  $BE00  04        .db $04
  $BE01  10 21     BPL $BE24
  $BE03  21 31     AND ($31,X)
  $BE05  30 0F     BMI $BE16
  $BE07  30 15     BMI $BE1E
  $BE09  0F        .db $0F
  $BE0A  0F        .db $0F
  $BE0B  21 21     AND ($21,X)
  $BE0D  21 0F     AND ($0F,X)
  $BE0F  21 21     AND ($21,X)
  $BE11  21 21     AND ($21,X)
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  27        .db $27
  $BE1D  30 0F     BMI $BE2E
  $BE1F  0F        .db $0F
  $BE20  15 27     ORA $27,X
  $BE22  21 21     AND ($21,X)

L_BE24:
  $BE24  31 30     AND ($30),Y
  $BE26  0F        .db $0F
  $BE27  30 15     BMI $BE3E
  $BE29  0F        .db $0F
  $BE2A  0F        .db $0F
  $BE2B  21 21     AND ($21,X)
  $BE2D  21 0F     AND ($0F,X)
  $BE2F  21 21     AND ($21,X)
  $BE31  21 21     AND ($21,X)
  $BE33  31 30     AND ($30),Y
  $BE35  30 0F     BMI $BE46
  $BE37  30 15     BMI $BE4E
  $BE39  0F        .db $0F
  $BE3A  0F        .db $0F
  $BE3B  21 21     AND ($21,X)
  $BE3D  21 0F     AND ($0F,X)
  $BE3F  21 21     AND ($21,X)
  $BE41  21 21     AND ($21,X)
  $BE43  30 30     BMI $BE75
  $BE45  30 0F     BMI $BE56
  $BE47  30 15     BMI $BE5E
  $BE49  0F        .db $0F
  $BE4A  0F        .db $0F
  $BE4B  21 21     AND ($21,X)
  $BE4D  21 0F     AND ($0F,X)
  $BE4F  21 21     AND ($21,X)
  $BE51  21 21     AND ($21,X)
  $BE53  31 30     AND ($30),Y
  $BE55  30 0F     BMI $BE66
  $BE57  30 15     BMI $BE6E
  $BE59  0F        .db $0F
  $BE5A  0F        .db $0F
  $BE5B  21 21     AND ($21,X)
  $BE5D  21 0F     AND ($0F,X)
  $BE5F  21 21     AND ($21,X)
  $BE61  21 FF     AND ($FF,X)
  $BE63  FF        .db $FF
  $BE64  FF        .db $FF
  $BE65  FF        .db $FF

L_BE66:
  $BE66  FF        .db $FF
  $BE67  FF        .db $FF
  $BE68  FF        .db $FF
  $BE69  FF        .db $FF
  $BE6A  FF        .db $FF
  $BE6B  FF        .db $FF
  $BE6C  FF        .db $FF
  $BE6D  FF        .db $FF

L_BE6E:
  $BE6E  FF        .db $FF
  $BE6F  FF        .db $FF
  $BE70  FF        .db $FF
  $BE71  FF        .db $FF
  $BE72  FF        .db $FF
  $BE73  FF        .db $FF
  $BE74  FF        .db $FF

L_BE75:
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
  $BF00  03        .db $03
  $BF01  04        .db $04
  $BF02  0F        .db $0F
  $BF03  10 18     BPL $BF1D
  $BF05  08        PHP
  $BF06  0F        .db $0F
  $BF07  0F        .db $0F
  $BF08  08        PHP
  $BF09  0F        .db $0F
  $BF0A  0F        .db $0F
  $BF0B  34        .db $34
  $BF0C  15 05     ORA $05,X
  $BF0E  0F        .db $0F
  $BF0F  31 31     AND ($31),Y
  $BF11  0F        .db $0F
  $BF12  0F        .db $0F
  $BF13  0F        .db $0F
  $BF14  2C 11 0F  BIT $0F11
  $BF17  0F        .db $0F
  $BF18  20 38 0F  JSR $0F38
  $BF1B  0F        .db $0F
  $BF1C  27        .db $27

L_BF1D:
  $BF1D  30 0F     BMI $BF2E
  $BF1F  0F        .db $0F
  $BF20  15 27     ORA $27,X
  $BF22  0F        .db $0F
  $BF23  10 18     BPL $BF3D
  $BF25  08        PHP
  $BF26  0F        .db $0F
  $BF27  0F        .db $0F
  $BF28  08        PHP
  $BF29  0F        .db $0F
  $BF2A  0F        .db $0F
  $BF2B  34        .db $34
  $BF2C  15 05     ORA $05,X

L_BF2E:
  $BF2E  0F        .db $0F
  $BF2F  31 31     AND ($31),Y
  $BF31  0F        .db $0F
  $BF32  0F        .db $0F
  $BF33  10 18     BPL $BF4D
  $BF35  08        PHP
  $BF36  0F        .db $0F
  $BF37  0F        .db $0F
  $BF38  08        PHP
  $BF39  0F        .db $0F
  $BF3A  0F        .db $0F
  $BF3B  34        .db $34
  $BF3C  15 05     ORA $05,X
  $BF3E  0F        .db $0F
  $BF3F  0F        .db $0F
  $BF40  31 31     AND ($31),Y
  $BF42  0F        .db $0F
  $BF43  10 18     BPL $BF5D
  $BF45  08        PHP
  $BF46  0F        .db $0F
  $BF47  0F        .db $0F
  $BF48  08        PHP
  $BF49  0F        .db $0F
  $BF4A  0F        .db $0F
  $BF4B  34        .db $34
  $BF4C  15 05     ORA $05,X
  $BF4E  0F        .db $0F
  $BF4F  31 0F     AND ($0F),Y
  $BF51  31 0F     AND ($0F),Y
  $BF53  10 18     BPL $BF6D
  $BF55  08        PHP
  $BF56  0F        .db $0F
  $BF57  0F        .db $0F
  $BF58  08        PHP
  $BF59  0F        .db $0F
  $BF5A  0F        .db $0F
  $BF5B  34        .db $34
  $BF5C  15 05     ORA $05,X
  $BF5E  0F        .db $0F
  $BF5F  31 31     AND ($31),Y
  $BF61  0F        .db $0F
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

L_BF6D:
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