; Mega Man 2 — PRG Bank 6
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  00        BRK
  $8005  00        BRK
  $8006  00        BRK
  $8007  00        BRK
  $8008  61 61     ADC ($61,X)
  $800A  62        .db $62
  $800B  62        .db $62
  $800C  00        BRK
  $800D  00        BRK
  $800E  61 61     ADC ($61,X)
  $8010  62        .db $62
  $8011  62        .db $62
  $8012  00        BRK
  $8013  00        BRK
  $8014  00        BRK
  $8015  59 00 5B  EOR $5B00,Y
  $8018  58        CLI
  $8019  5C        .db $5C
  $801A  59 61 5B  EOR $5B61,Y
  $801D  62        .db $62
  $801E  5C        .db $5C
  $801F  58        CLI
  $8020  60        RTS
  $8021  68        PLA
  $8022  60        RTS
  $8023  68        PLA
  $8024  5C        .db $5C
  $8025  00        BRK
  $8026  61 61     ADC ($61,X)
  $8028  59 00 5B  EOR $5B00,Y
  $802B  00        BRK
  $802C  00        BRK
  $802D  58        CLI
  $802E  61 59     ADC ($59,X)
  $8030  62        .db $62
  $8031  5B        .db $5B
  $8032  00        BRK
  $8033  5C        .db $5C
  $8034  61 59     ADC ($59,X)
  $8036  62        .db $62
  $8037  5B        .db $5B
  $8038  58        CLI
  $8039  00        BRK
  $803A  59 61 5B  EOR $5B61,Y
  $803D  62        .db $62
  $803E  5C        .db $5C
  $803F  00        BRK
  $8040  79 79 79  ADC $7979,Y
  $8043  79 58 58  ADC $5858,Y
  $8046  59 59 5B  EOR $5B59,Y
  $8049  5B        .db $5B
  $804A  5C        .db $5C
  $804B  5C        .db $5C
  $804C  5C        .db $5C
  $804D  58        CLI
  $804E  61 59     ADC ($59,X)
  $8050  62        .db $62
  $8051  5B        .db $5B
  $8052  58        CLI
  $8053  5C        .db $5C
  $8054  59 61 5B  EOR $5B61,Y
  $8057  62        .db $62
  $8058  69 71     ADC #$71
  $805A  69 71     ADC #$71
  $805C  00        BRK
  $805D  5B        .db $5B
  $805E  00        BRK
  $805F  5C        .db $5C
  $8060  70 78     BVS $80DA
  $8062  70 78     BVS $80DC
  $8064  58        CLI
  $8065  00        BRK
  $8066  59 00 5B  EOR $5B00,Y
  $8069  00        BRK
  $806A  5C        .db $5C
  $806B  00        BRK
  $806C  5C        .db $5C
  $806D  58        CLI
  $806E  00        BRK
  $806F  59 00 5B  EOR $5B00,Y
  $8072  58        CLI
  $8073  5C        .db $5C
  $8074  5C        .db $5C
  $8075  00        BRK
  $8076  00        BRK
  $8077  00        BRK
  $8078  00        BRK
  $8079  69 00     ADC #$00
  $807B  69 71     ADC #$71
  $807D  00        BRK
  $807E  71 00     ADC ($00),Y
  $8080  00        BRK
  $8081  9F        .db $9F
  $8082  00        BRK
  $8083  9E        .db $9E
  $8084  00        BRK
  $8085  9E        .db $9E
  $8086  00        BRK
  $8087  9E        .db $9E
  $8088  00        BRK
  $8089  9E        .db $9E
  $808A  00        BRK
  $808B  9F        .db $9F
  $808C  00        BRK
  $808D  DD 00 DE  CMP $DE00,X
  $8090  00        BRK
  $8091  DE 00 DE  DEC $DE00,X
  $8094  00        BRK
  $8095  DE 00 DD  DEC $DD00,X
  $8098  DD 00 DE  CMP $DE00,X
  $809B  00        BRK
  $809C  DE 00 DE  DEC $DE00,X
  $809F  00        BRK
  $80A0  DE 00 DD  DEC $DD00,X
  $80A3  00        BRK
  $80A4  00        BRK
  $80A5  00        BRK
  $80A6  00        BRK
  $80A7  DD 00 DD  CMP $DD00,X
  $80AA  00        BRK
  $80AB  00        BRK
  $80AC  9F        .db $9F
  $80AD  6A        ROR
  $80AE  9E        .db $9E
  $80AF  7A        .db $7A
  $80B0  9E        .db $9E
  $80B1  7B        .db $7B
  $80B2  9E        .db $9E
  $80B3  6B        .db $6B
  $80B4  9E        .db $9E
  $80B5  6A        ROR
  $80B6  9E        .db $9E
  $80B7  7A        .db $7A
  $80B8  9E        .db $9E
  $80B9  7B        .db $7B
  $80BA  9F        .db $9F
  $80BB  6B        .db $6B
  $80BC  00        BRK
  $80BD  00        BRK
  $80BE  00        BRK
  $80BF  00        BRK
  $80C0  72        .db $72
  $80C1  7A        .db $7A
  $80C2  73        .db $73
  $80C3  7B        .db $7B
  $80C4  7A        .db $7A
  $80C5  72        .db $72
  $80C6  7B        .db $7B
  $80C7  73        .db $73
  $80C8  7A        .db $7A
  $80C9  00        BRK
  $80CA  7B        .db $7B
  $80CB  00        BRK
  $80CC  00        BRK
  $80CD  72        .db $72
  $80CE  00        BRK
  $80CF  73        .db $73
  $80D0  72        .db $72
  $80D1  59 73 5B  EOR $5B73,Y
  $80D4  6B        .db $6B
  $80D5  5C        .db $5C
  $80D6  6A        ROR
  $80D7  6A        ROR
  $80D8  6B        .db $6B
  $80D9  6B        .db $6B

L_80DA:
  $80DA  72        .db $72
  $80DB  7A        .db $7A

L_80DC:
  $80DC  73        .db $73
  $80DD  7B        .db $7B
  $80DE  6A        ROR
  $80DF  6A        ROR
  $80E0  00        BRK
  $80E1  00        BRK
  $80E2  6A        ROR
  $80E3  6A        ROR
  $80E4  5C        .db $5C
  $80E5  00        BRK
  $80E6  6A        ROR
  $80E7  58        CLI
  $80E8  00        BRK
  $80E9  00        BRK
  $80EA  00        BRK
  $80EB  6A        ROR
  $80EC  00        BRK
  $80ED  6B        .db $6B
  $80EE  00        BRK
  $80EF  00        BRK
  $80F0  6B        .db $6B
  $80F1  6B        .db $6B
  $80F2  00        BRK
  $80F3  00        BRK
  $80F4  6B        .db $6B
  $80F5  6B        .db $6B
  $80F6  6A        ROR
  $80F7  6A        ROR
  $80F8  6A        ROR
  $80F9  6A        ROR
  $80FA  72        .db $72
  $80FB  7A        .db $7A
  $80FC  73        .db $73
  $80FD  7B        .db $7B
  $80FE  6B        .db $6B
  $80FF  6B        .db $6B
  $8100  00        BRK
  $8101  00        BRK
  $8102  9F        .db $9F
  $8103  6A        ROR
  $8104  9E        .db $9E
  $8105  7A        .db $7A
  $8106  9E        .db $9E
  $8107  7B        .db $7B
  $8108  9E        .db $9E
  $8109  7A        .db $7A
  $810A  9F        .db $9F
  $810B  7B        .db $7B
  $810C  9F        .db $9F
  $810D  58        CLI
  $810E  9E        .db $9E
  $810F  59 9E 5B  EOR $5B9E,Y
  $8112  9E        .db $9E
  $8113  5C        .db $5C
  $8114  9E        .db $9E
  $8115  58        CLI
  $8116  9E        .db $9E
  $8117  59 9E 5B  EOR $5B9E,Y
  $811A  9F        .db $9F
  $811B  5C        .db $5C
  $811C  00        BRK
  $811D  00        BRK
  $811E  00        BRK
  $811F  00        BRK
  $8120  00        BRK
  $8121  DD 6A 6A  CMP $6A6A,X
  $8124  DD 6A DE  CMP $DE6A,X
  $8127  72        .db $72
  $8128  DE 73 DE  DEC $DE73,X
  $812B  6B        .db $6B
  $812C  DE 6A DE  DEC $DE6A,X
  $812F  7A        .db $7A
  $8130  DE 7B DE  DEC $DE7B,X
  $8133  7A        .db $7A
  $8134  DE 7B DD  DEC $DD7B,X
  $8137  6B        .db $6B
  $8138  DE 7B DE  DEC $DE7B,X
  $813B  6B        .db $6B
  $813C  00        BRK
  $813D  3E 00 3E  ROL $3E00,X
  $8140  73        .db $73
  $8141  7B        .db $7B
  $8142  72        .db $72
  $8143  7A        .db $7A
  $8144  58        CLI
  $8145  6A        ROR
  $8146  59 7A 5A  EOR $5A7A,Y
  $8149  7B        .db $7B
  $814A  5A        .db $5A
  $814B  7A        .db $7A
  $814C  5B        .db $5B
  $814D  7B        .db $7B
  $814E  5C        .db $5C
  $814F  6B        .db $6B
  $8150  60        RTS
  $8151  68        PLA
  $8152  72        .db $72
  $8153  7A        .db $7A
  $8154  73        .db $73
  $8155  7B        .db $7B
  $8156  60        RTS
  $8157  68        PLA
  $8158  72        .db $72
  $8159  58        CLI
  $815A  73        .db $73
  $815B  59 72 5B  EOR $5B72,Y
  $815E  73        .db $73
  $815F  5C        .db $5C
  $8160  6A        ROR
  $8161  58        CLI
  $8162  72        .db $72
  $8163  59 73 5B  EOR $5B73,Y
  $8166  6B        .db $6B
  $8167  5C        .db $5C
  $8168  79 79 72  ADC $7279,Y
  $816B  7A        .db $7A
  $816C  73        .db $73
  $816D  7B        .db $7B
  $816E  79 79 70  ADC $7079,Y
  $8171  78        SEI
  $8172  72        .db $72
  $8173  7A        .db $7A
  $8174  73        .db $73
  $8175  7B        .db $7B
  $8176  70 78     BVS $81F0
  $8178  6A        ROR
  $8179  58        CLI
  $817A  61 59     ADC ($59,X)
  $817C  62        .db $62
  $817D  5B        .db $5B
  $817E  68        PLA
  $817F  5C        .db $5C
  $8180  72        .db $72
  $8181  7A        .db $7A
  $8182  73        .db $73
  $8183  58        CLI
  $8184  72        .db $72
  $8185  59 73 5B  EOR $5B73,Y
  $8188  58        CLI
  $8189  59 5C 7B  EOR $7B5C,Y
  $818C  5B        .db $5B
  $818D  7A        .db $7A
  $818E  5C        .db $5C
  $818F  7B        .db $7B
  $8190  72        .db $72
  $8191  5A        .db $5A
  $8192  58        CLI
  $8193  5B        .db $5B
  $8194  59 7A 5B  EOR $5B7A,Y
  $8197  7B        .db $7B
  $8198  5C        .db $5C
  $8199  6A        ROR
  $819A  72        .db $72
  $819B  7A        .db $7A
  $819C  6A        ROR
  $819D  6A        ROR
  $819E  7A        .db $7A
  $819F  61 72     ADC ($72,X)
  $81A1  7A        .db $7A
  $81A2  58        CLI
  $81A3  7B        .db $7B
  $81A4  59 7A 5B  EOR $5B7A,Y
  $81A7  7B        .db $7B
  $81A8  5C        .db $5C
  $81A9  7A        .db $7A
  $81AA  73        .db $73
  $81AB  7B        .db $7B
  $81AC  58        CLI
  $81AD  6A        ROR
  $81AE  59 61 5B  EOR $5B61,Y
  $81B1  62        .db $62
  $81B2  5C        .db $5C
  $81B3  6B        .db $6B
  $81B4  6A        ROR
  $81B5  6A        ROR
  $81B6  61 72     ADC ($72,X)
  $81B8  62        .db $62
  $81B9  73        .db $73
  $81BA  6B        .db $6B
  $81BB  6B        .db $6B
  $81BC  7B        .db $7B
  $81BD  62        .db $62
  $81BE  6B        .db $6B
  $81BF  6B        .db $6B
  $81C0  6A        ROR
  $81C1  6A        ROR
  $81C2  7A        .db $7A
  $81C3  72        .db $72
  $81C4  7B        .db $7B
  $81C5  73        .db $73
  $81C6  7A        .db $7A
  $81C7  72        .db $72
  $81C8  7B        .db $7B
  $81C9  73        .db $73
  $81CA  6B        .db $6B
  $81CB  6B        .db $6B
  $81CC  6A        ROR
  $81CD  00        BRK
  $81CE  7A        .db $7A
  $81CF  00        BRK
  $81D0  7B        .db $7B
  $81D1  00        BRK
  $81D2  7A        .db $7A
  $81D3  00        BRK
  $81D4  7B        .db $7B
  $81D5  00        BRK
  $81D6  6B        .db $6B
  $81D7  00        BRK
  $81D8  7B        .db $7B
  $81D9  73        .db $73
  $81DA  7A        .db $7A
  $81DB  6B        .db $6B
  $81DC  58        CLI
  $81DD  7B        .db $7B
  $81DE  59 6B 00  EOR $006B,Y
  $81E1  60        RTS
  $81E2  00        BRK
  $81E3  60        RTS
  $81E4  68        PLA
  $81E5  79 68 79  ADC $7968,Y
  $81E8  79 70 78  ADC $7870,Y
  $81EB  60        RTS
  $81EC  78        SEI
  $81ED  69 68     ADC #$68
  $81EF  79 00 60  ADC $6000,Y
  $81F2  00        BRK
  $81F3  00        BRK
  $81F4  68        PLA
  $81F5  70 69     BVS $8260
  $81F7  71 79     ADC ($79),Y
  $81F9  79 70 78  ADC $7870,Y
  $81FC  70 78     BVS $8276
  $81FE  60        RTS
  $81FF  68        PLA
  $8200  26 2E     ROL $2E
  $8202  27        .db $27
  $8203  2F        .db $2F
  $8204  00        BRK
  $8205  2D 25 00  AND $0025
  $8208  00        BRK
  $8209  00        BRK
  $820A  00        BRK
  $820B  2D 2D 00  AND $002D
  $820E  2E 2D 2F  ROL $2F2D
  $8211  00        BRK
  $8212  25 00     AND $00
  $8214  00        BRK
  $8215  27        .db $27
  $8216  26 2E     ROL $2E
  $8218  00        BRK
  $8219  26 00     ROL $00
  $821B  27        .db $27
  $821C  00        BRK
  $821D  25 00     AND $00
  $821F  00        BRK
  $8220  59 00 5B  EOR $5B00,Y
  $8223  26 00     ROL $00
  $8225  9E        .db $9E
  $8226  25 9E     AND $9E
  $8228  26 9E     ROL $9E
  $822A  27        .db $27
  $822B  9E        .db $9E
  $822C  2E 9E 2F  ROL $2F9E
  $822F  9E        .db $9E
  $8230  2D 9E 00  AND $009E
  $8233  9E        .db $9E
  $8234  27        .db $27
  $8235  58        CLI
  $8236  61 59     ADC ($59,X)
  $8238  00        BRK
  $8239  59 2E 5A  EOR $5A2E,Y
  $823C  5B        .db $5B
  $823D  62        .db $62
  $823E  5C        .db $5C
  $823F  2E 00 26  ROL $2600
  $8242  2E 27 2F  ROL $2F27
  $8245  2D 00 00  AND $0000
  $8248  27        .db $27
  $8249  2F        .db $2F
  $824A  25 00     AND $00
  $824C  DE 2E DE  DEC $DE2E,X
  $824F  2F        .db $2F
  $8250  58        CLI
  $8251  2F        .db $2F
  $8252  59 25 26  EOR $2625,Y
  $8255  2E 58 2F  ROL $2F58
  $8258  00        BRK
  $8259  2D 26 2E  AND $2E26
  $825C  27        .db $27
  $825D  58        CLI
  $825E  00        BRK
  $825F  59 2E 2D  EOR $2D2E,Y
  $8262  2F        .db $2F
  $8263  00        BRK
  $8264  25 00     AND $00
  $8266  00        BRK
  $8267  00        BRK
  $8268  2D 25 00  AND $0025
  $826B  00        BRK
  $826C  00        BRK
  $826D  00        BRK
  $826E  2D 00 2E  AND $2E00
  $8271  00        BRK
  $8272  2F        .db $2F
  $8273  00        BRK
  $8274  00        BRK
  $8275  25 00     AND $00
  $8277  2D 00 00  AND $0000
  $827A  26 2E     ROL $2E
  $827C  2E 2D 2F  ROL $2F2D
  $827F  25 3E     AND $3E
  $8281  00        BRK
  $8282  3E 00 00  ROL $0000,X
  $8285  3D 00 3D  AND $3D00,X
  $8288  2E 00 2F  ROL $2F00
  $828B  2D 2D 26  AND $262D
  $828E  00        BRK
  $828F  27        .db $27
  $8290  00        BRK
  $8291  26 25     ROL $25
  $8293  27        .db $27
  $8294  2D 00 00  AND $0000
  $8297  00        BRK
  $8298  9F        .db $9F
  $8299  00        BRK
  $829A  9E        .db $9E
  $829B  2D 9E 2E  AND $2E9E
  $829E  9F        .db $9F
  $829F  2F        .db $2F
  $82A0  2C 34 35  BIT $3534
  $82A3  36 3C     ROL $3C,X
  $82A5  00        BRK
  $82A6  37        .db $37
  $82A7  00        BRK
  $82A8  2C 34 6A  BIT $6A34
  $82AB  6A        ROR
  $82AC  3C        .db $3C
  $82AD  00        BRK
  $82AE  6A        ROR
  $82AF  6A        ROR
  $82B0  6B        .db $6B
  $82B1  6B        .db $6B
  $82B2  35 36     AND $36,X
  $82B4  6B        .db $6B
  $82B5  6B        .db $6B
  $82B6  37        .db $37
  $82B7  00        BRK
  $82B8  00        BRK
  $82B9  2D 00 25  AND $2500
  $82BC  25 00     AND $00
  $82BE  00        BRK
  $82BF  00        BRK
  $82C0  27        .db $27
  $82C1  2F        .db $2F
  $82C2  25 2D     AND $2D
  $82C4  3E 00 3D  ROL $3D00,X
  $82C7  00        BRK
  $82C8  3D 00 3E  AND $3E00,X
  $82CB  00        BRK
  $82CC  00        BRK
  $82CD  00        BRK
  $82CE  25 00     AND $00
  $82D0  25 00     AND $00
  $82D2  2D 25 00  AND $0025
  $82D5  DE 26 DE  DEC $DE26,X
  $82D8  27        .db $27
  $82D9  DE 2D DE  DEC $DE2D,X
  $82DC  25 DE     AND $DE
  $82DE  00        BRK
  $82DF  DE 5B 25  DEC $255B,X
  $82E2  5C        .db $5C
  $82E3  00        BRK
  $82E4  58        CLI
  $82E5  00        BRK
  $82E6  59 25 5B  EOR $5B25,Y
  $82E9  2E 5C 2F  ROL $2F5C
  $82EC  25 5C     AND $5C
  $82EE  2E 00 2F  ROL $2F00
  $82F1  00        BRK
  $82F2  58        CLI
  $82F3  00        BRK
  $82F4  27        .db $27
  $82F5  60        RTS
  $82F6  00        BRK
  $82F7  60        RTS
  $82F8  00        BRK
  $82F9  00        BRK
  $82FA  00        BRK
  $82FB  26 26     ROL $26
  $82FD  2E 78 2F  ROL $2F78
  $8300  60        RTS
  $8301  68        PLA
  $8302  00        BRK
  $8303  69 70     ADC #$70
  $8305  78        SEI
  $8306  71 00     ADC ($00),Y
  $8308  69 71     ADC #$71
  $830A  79 79 71  ADC $7179,Y
  $830D  00        BRK
  $830E  79 70 78  ADC $7870,Y
  $8311  00        BRK
  $8312  00        BRK
  $8313  00        BRK
  $8314  00        BRK
  $8315  00        BRK
  $8316  70 78     BVS $8390
  $8318  71 00     ADC ($00),Y
  $831A  71 60     ADC ($60),Y
  $831C  68        PLA
  $831D  70 68     BVS $8387
  $831F  70 78     BVS $8399
  $8321  00        BRK
  $8322  78        SEI
  $8323  00        BRK
  $8324  58        CLI
  $8325  00        BRK
  $8326  5C        .db $5C
  $8327  00        BRK
  $8328  69 71     ADC #$71
  $832A  61 61     ADC ($61,X)
  $832C  6B        .db $6B
  $832D  6B        .db $6B
  $832E  58        CLI
  $832F  00        BRK
  $8330  5C        .db $5C
  $8331  00        BRK
  $8332  58        CLI
  $8333  00        BRK
  $8334  3F        .db $3F
  $8335  00        BRK
  $8336  00        BRK
  $8337  00        BRK
  $8338  00        BRK
  $8339  3F        .db $3F
  $833A  00        BRK
  $833B  00        BRK
  $833C  00        BRK
  $833D  00        BRK
  $833E  3F        .db $3F
  $833F  00        BRK
  $8340  00        BRK
  $8341  00        BRK
  $8342  49 49     EOR #$49
  $8344  47        .db $47
  $8345  4C 47 4D  JMP $4D47
  $8348  4E 4B 4F  LSR $4F4B
  $834B  4B        .db $4B
  $834C  00        BRK
  $834D  00        BRK
  $834E  08        PHP
  $834F  08        PHP
  $8350  23        .db $23
  $8351  23        .db $23
  $8352  23        .db $23
  $8353  23        .db $23
  $8354  24 23     BIT $23
  $8356  24 23     BIT $23
  $8358  24 23     BIT $23
  $835A  08        PHP
  $835B  08        PHP
  $835C  23        .db $23
  $835D  23        .db $23
  $835E  08        PHP
  $835F  08        PHP
  $8360  6A        ROR
  $8361  6A        ROR
  $8362  24 23     BIT $23
  $8364  6A        ROR
  $8365  6A        ROR
  $8366  23        .db $23
  $8367  23        .db $23
  $8368  24 23     BIT $23
  $836A  23        .db $23
  $836B  23        .db $23
  $836C  24 23     BIT $23
  $836E  6B        .db $6B
  $836F  6B        .db $6B
  $8370  23        .db $23
  $8371  23        .db $23
  $8372  6B        .db $6B
  $8373  6B        .db $6B
  $8374  6A        ROR
  $8375  6A        ROR
  $8376  DD 7A DD  CMP $DD7A,X
  $8379  7B        .db $7B
  $837A  6B        .db $6B
  $837B  6B        .db $6B
  $837C  00        BRK
  $837D  00        BRK
  $837E  00        BRK
  $837F  00        BRK
  $8380  DE 6A DD  DEC $DD6A,X
  $8383  72        .db $72
  $8384  00        BRK
  $8385  73        .db $73
  $8386  00        BRK

L_8387:
  $8387  72        .db $72
  $8388  9F        .db $9F
  $8389  73        .db $73
  $838A  9E        .db $9E
  $838B  6B        .db $6B
  $838C  DE 72 DD  DEC $DD72,X
  $838F  73        .db $73

L_8390:
  $8390  9F        .db $9F
  $8391  72        .db $72
  $8392  9E        .db $9E
  $8393  73        .db $73
  $8394  9E        .db $9E
  $8395  72        .db $72
  $8396  9F        .db $9F
  $8397  73        .db $73
  $8398  6B        .db $6B

L_8399:
  $8399  00        BRK
  $839A  6A        ROR
  $839B  00        BRK
  $839C  6B        .db $6B
  $839D  00        BRK
  $839E  6A        ROR
  $839F  6A        ROR
  $83A0  9E        .db $9E
  $83A1  6A        ROR
  $83A2  9F        .db $9F
  $83A3  72        .db $72
  $83A4  DD 73 DE  CMP $DE73,X
  $83A7  6B        .db $6B
  $83A8  00        BRK
  $83A9  00        BRK
  $83AA  49 4A     EOR #$4A
  $83AC  00        BRK
  $83AD  00        BRK
  $83AE  00        BRK
  $83AF  00        BRK
  $83B0  00        BRK
  $83B1  00        BRK
  $83B2  00        BRK
  $83B3  00        BRK
  $83B4  00        BRK
  $83B5  00        BRK
  $83B6  00        BRK
  $83B7  00        BRK
  $83B8  00        BRK
  $83B9  00        BRK
  $83BA  00        BRK
  $83BB  00        BRK
  $83BC  00        BRK
  $83BD  00        BRK
  $83BE  00        BRK
  $83BF  00        BRK
  $83C0  00        BRK
  $83C1  6B        .db $6B

L_83C2:
  $83C2  00        BRK
  $83C3  6B        .db $6B
  $83C4  00        BRK

L_83C5:
  $83C5  AE 00 00  LDX $0000
  $83C8  00        BRK
  $83C9  00        BRK
  $83CA  6B        .db $6B
  $83CB  00        BRK
  $83CC  00        BRK
  $83CD  00        BRK
  $83CE  00        BRK
  $83CF  4F        .db $4F
  $83D0  00        BRK
  $83D1  4F        .db $4F
  $83D2  00        BRK
  $83D3  4F        .db $4F
  $83D4  00        BRK
  $83D5  00        BRK
  $83D6  4F        .db $4F
  $83D7  4F        .db $4F
  $83D8  00        BRK
  $83D9  4F        .db $4F
  $83DA  4F        .db $4F
  $83DB  4F        .db $4F
  $83DC  22        .db $22
  $83DD  22        .db $22
  $83DE  4F        .db $4F
  $83DF  4F        .db $4F
  $83E0  22        .db $22
  $83E1  4F        .db $4F
  $83E2  4F        .db $4F
  $83E3  4F        .db $4F
  $83E4  70 72     BVS $8458
  $83E6  71 73     ADC ($73),Y
  $83E8  3F        .db $3F
  $83E9  00        BRK
  $83EA  3F        .db $3F
  $83EB  00        BRK
  $83EC  74        .db $74
  $83ED  75 76     ADC $76,X
  $83EF  77        .db $77
  $83F0  4A        LSR
  $83F1  52        .db $52
  $83F2  17        .db $17
  $83F3  17        .db $17
  $83F4  BF        .db $BF
  $83F5  16 17     ASL $17,X
  $83F7  17        .db $17
  $83F8  17        .db $17
  $83F9  17        .db $17
  $83FA  C5 C5     CMP $C5
  $83FC  BF        .db $BF
  $83FD  16 BF     ASL $BF,X
  $83FF  16 00     ASL $00,X
  $8401  00        BRK
  $8402  00        BRK
  $8403  00        BRK
  $8404  00        BRK
  $8405  00        BRK
  $8406  00        BRK
  $8407  00        BRK
  $8408  00        BRK
  $8409  00        BRK
  $840A  00        BRK
  $840B  00        BRK
  $840C  00        BRK
  $840D  00        BRK
  $840E  00        BRK
  $840F  00        BRK
  $8410  00        BRK
  $8411  00        BRK
  $8412  00        BRK
  $8413  00        BRK
  $8414  00        BRK
  $8415  00        BRK
  $8416  00        BRK
  $8417  00        BRK
  $8418  00        BRK
  $8419  00        BRK
  $841A  00        BRK
  $841B  00        BRK
  $841C  00        BRK
  $841D  00        BRK
  $841E  00        BRK
  $841F  00        BRK
  $8420  90 A0     BCC $83C2
  $8422  60        RTS
  $8423  90 A0     BCC $83C5
  $8425  60        RTS
  $8426  09 0A     ORA #$0A
  $8428  06 40     ASL $40
  $842A  10 09     BPL $8435
  $842C  0A        ASL
  $842D  0A        ASL
  $842E  06 00     ASL $00
  $8430  00        BRK
  $8431  00        BRK
  $8432  00        BRK
  $8433  00        BRK
  $8434  00        BRK

L_8435:
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
  $8440  04        .db $04
  $8441  0A        ASL
  $8442  06 09     ASL $09
  $8444  0A        ASL
  $8445  0A        ASL
  $8446  06 00     ASL $00
  $8448  10 09     BPL $8453
  $844A  0A        ASL
  $844B  0A        ASL
  $844C  0A        ASL
  $844D  06 0A     ASL $0A
  $844F  F0 00     BEQ $8451

L_8451:
  $8451  00        BRK
  $8452  00        BRK

L_8453:
  $8453  00        BRK
  $8454  00        BRK
  $8455  00        BRK
  $8456  00        BRK
  $8457  00        BRK

L_8458:
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
  $8466  00        BRK
  $8467  00        BRK
  $8468  00        BRK
  $8469  00        BRK
  $846A  00        BRK

L_846B:
  $846B  00        BRK
  $846C  00        BRK
  $846D  00        BRK
  $846E  00        BRK
  $846F  00        BRK
  $8470  00        BRK
  $8471  00        BRK

L_8472:
  $8472  00        BRK
  $8473  00        BRK
  $8474  00        BRK
  $8475  00        BRK
  $8476  00        BRK
  $8477  00        BRK
  $8478  00        BRK
  $8479  00        BRK

L_847A:
  $847A  00        BRK
  $847B  00        BRK
  $847C  00        BRK
  $847D  00        BRK
  $847E  00        BRK
  $847F  00        BRK
  $8480  FF        .db $FF
  $8481  3C        .db $3C
  $8482  C0 CF     CPY #$CF
  $8484  0F        .db $0F
  $8485  FC        .db $FC
  $8486  F0 30     BEQ $84B8
  $8488  C0 AC     CPY #$AC
  $848A  AF        .db $AF
  $848B  AF        .db $AF
  $848C  A3        .db $A3
  $848D  03        .db $03
  $848E  0C        .db $0C
  $848F  C0 FC     CPY #$FC
  $8491  33        .db $33
  $8492  3F        .db $3F
  $8493  FA        .db $FA
  $8494  F0 F3     BEQ $8489
  $8496  FC        .db $FC
  $8497  03        .db $03
  $8498  3F        .db $3F
  $8499  03        .db $03
  $849A  33        .db $33
  $849B  0C        .db $0C
  $849C  0F        .db $0F

L_849D:
  $849D  F0 CC     BEQ $846B
  $849F  FF        .db $FF
  $84A0  0F        .db $0F
  $84A1  F0 CF     BEQ $8472
  $84A3  F3        .db $F3
  $84A4  FC        .db $FC
  $84A5  03        .db $03
  $84A6  C9 F6     CMP #$F6
  $84A8  FF        .db $FF
  $84A9  0F        .db $0F
  $84AA  33        .db $33
  $84AB  03        .db $03
  $84AC  CC 0C F0  CPY $F00C
  $84AF  03        .db $03
  $84B0  FF        .db $FF
  $84B1  0F        .db $0F
  $84B2  0F        .db $0F
  $84B3  0C        .db $0C
  $84B4  CF        .db $CF
  $84B5  AC AF A3  LDY $A3AF

L_84B8:
  $84B8  30 C0     BMI $847A
  $84BA  F0 0F     BEQ $84CB
  $84BC  03        .db $03
  $84BD  03        .db $03
  $84BE  C0 F3     CPY #$F3
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

L_84CB:
  $84CB  00        BRK
  $84CC  00        BRK
  $84CD  01 10     ORA ($10,X)
  $84CF  04        .db $04
  $84D0  00        BRK
  $84D1  00        BRK
  $84D2  00        BRK
  $84D3  00        BRK
  $84D4  FF        .db $FF
  $84D5  FF        .db $FF
  $84D6  33        .db $33
  $84D7  33        .db $33
  $84D8  CC CC FF  CPY $FFCC
  $84DB  33        .db $33
  $84DC  33        .db $33
  $84DD  04        .db $04
  $84DE  01 00     ORA ($00,X)
  $84E0  06 00     ASL $00
  $84E2  09 06     ORA #$06
  $84E4  09 06     ORA #$06
  $84E6  00        BRK
  $84E7  00        BRK
  $84E8  06 09     ASL $09
  $84EA  00        BRK
  $84EB  00        BRK
  $84EC  00        BRK
  $84ED  00        BRK
  $84EE  00        BRK
  $84EF  00        BRK
  $84F0  00        BRK
  $84F1  00        BRK
  $84F2  00        BRK
  $84F3  C0 F0     CPY #$F0
  $84F5  CC FC CC  CPY $CCFC
  $84F8  FC        .db $FC
  $84F9  00        BRK
  $84FA  00        BRK
  $84FB  00        BRK
  $84FC  BB        .db $BB
  $84FD  A8        TAY
  $84FE  22        .db $22
  $84FF  A0 02     LDY #$02
  $8501  02        .db $02
  $8502  88        DEY
  $8503  90 98     BCC $849D
  $8505  20 05 0D  JSR $0D05
  $8508  03        .db $03
  $8509  0B        .db $0B
  $850A  13        .db $13
  $850B  91 99     STA ($99),Y
  $850D  21 06     AND ($06,X)
  $850F  06 04     ASL $04
  $8511  0C        .db $0C

L_8512:
  $8512  0C        .db $0C
  $8513  00        BRK
  $8514  81 89     STA ($89,X)
  $8516  07        .db $07
  $8517  07        .db $07
  $8518  00        BRK
  $8519  00        BRK
  $851A  00        BRK
  $851B  82        .db $82
  $851C  80        .db $80
  $851D  89        .db $89
  $851E  8E 0D 0B  STX $0B0D
  $8521  0B        .db $0B
  $8522  00        BRK
  $8523  4F        .db $4F
  $8524  81 8A     STA ($8A,X)
  $8526  06 06     ASL $06
  $8528  0C        .db $0C
  $8529  0C        .db $0C
  $852A  83        .db $83
  $852B  4F        .db $4F
  $852C  00        BRK
  $852D  8A        TXA
  $852E  8F        .db $8F
  $852F  0F        .db $0F
  $8530  00        BRK
  $8531  85 84     STA $84
  $8533  A1 86     LDA ($86,X)
  $8535  8B        .db $8B
  $8536  92        .db $92
  $8537  00        BRK
  $8538  0B        .db $0B
  $8539  8D 0B A1  STA $A10B
  $853C  87        .db $87
  $853D  8C 0E 0E  STY $0E0E
  $8540  14        .db $14
  $8541  14        .db $14
  $8542  0C        .db $0C
  $8543  A1 00     LDA ($00,X)
  $8545  22        .db $22
  $8546  0F        .db $0F
  $8547  0F        .db $0F
  $8548  15 0A     ORA $0A,X
  $854A  9E        .db $9E
  $854B  80        .db $80
  $854C  00        BRK
  $854D  00        BRK
  $854E  96 9B     STX $9B,Y
  $8550  13        .db $13
  $8551  09 94     ORA #$94
  $8553  9A        TXS
  $8554  9B        .db $9B
  $8555  23        .db $23
  $8556  97        .db $97
  $8557  0B        .db $0B
  $8558  0C        .db $0C
  $8559  04        .db $04
  $855A  1A        .db $1A
  $855B  00        BRK
  $855C  00        BRK
  $855D  24 1C     BIT $1C
  $855F  14        .db $14
  $8560  0B        .db $0B
  $8561  86 A2     STX $A2
  $8563  00        BRK
  $8564  00        BRK
  $8565  24 15     BIT $15
  $8567  15 0C     ORA $0C,X
  $8569  95 A3     STA $A3,X
  $856B  9C        .db $9C
  $856C  26 24     ROL $24
  $856E  1B        .db $1B
  $856F  13        .db $13
  $8570  02        .db $02
  $8571  0A        ASL
  $8572  00        BRK
  $8573  00        BRK
  $8574  27        .db $27
  $8575  24 17     BIT $17
  $8577  0C        .db $0C
  $8578  00        BRK
  $8579  1D 00 9D  ORA $9D00,X
  $857C  93        .db $93
  $857D  25 A8     AND $A8
  $857F  A9 3E     LDA #$3E
  $8581  3E 9C A4  ROL $A49C,X
  $8584  27        .db $27
  $8585  01 A8     ORA ($A8,X)
  $8587  A9 50     LDA #$50
  $8589  50 87     BVC $8512
  $858B  A5 27     LDA $27
  $858D  01 A8     ORA ($A8,X)
  $858F  A9 3F     LDA #$3F
  $8591  3F        .db $3F
  $8592  00        BRK
  $8593  00        BRK
  $8594  E0 70     CPX #$70
  $8596  70 70     BVS $8608
  $8598  31 32     AND ($32),Y
  $859A  00        BRK
  $859B  00        BRK
  $859C  E1 71     SBC ($71,X)
  $859E  71 71     ADC ($71),Y
  $85A0  3F        .db $3F
  $85A1  3E 00 00  ROL $0000,X
  $85A4  E2        .db $E2
  $85A5  72        .db $72
  $85A6  72        .db $72
  $85A7  72        .db $72
  $85A8  3F        .db $3F
  $85A9  3F        .db $3F
  $85AA  00        BRK
  $85AB  00        BRK
  $85AC  E8        INX
  $85AD  70 70     BVS $861F
  $85AF  70 31     BVS $85E2
  $85B1  32        .db $32
  $85B2  00        BRK
  $85B3  00        BRK
  $85B4  E1 71     SBC ($71,X)
  $85B6  71 71     ADC ($71),Y
  $85B8  3D 3D 00  AND $003D,X
  $85BB  00        BRK
  $85BC  E9 72     SBC #$72
  $85BE  72        .db $72
  $85BF  72        .db $72
  $85C0  3D E6 00  AND $00E6,X
  $85C3  00        BRK
  $85C4  E3        .db $E3
  $85C5  31 31     AND ($31),Y
  $85C7  31 30     AND ($30),Y
  $85C9  00        BRK
  $85CA  00        BRK
  $85CB  00        BRK
  $85CC  33        .db $33
  $85CD  31 31     AND ($31),Y
  $85CF  31 3D     AND ($3D),Y
  $85D1  E6 00     INC $00
  $85D3  00        BRK
  $85D4  3D 3D 3D  AND $3D3D,X
  $85D7  3D 30 00  AND $0030,X
  $85DA  00        BRK
  $85DB  00        BRK
  $85DC  33        .db $33
  $85DD  31 31     AND ($31),Y
  $85DF  31 3D     AND ($3D),Y
  $85E1  E7        .db $E7

L_85E2:
  $85E2  00        BRK
  $85E3  00        BRK
  $85E4  3D 3D 3D  AND $3D3D,X
  $85E7  3D 31 32  AND $3231,X
  $85EA  00        BRK
  $85EB  00        BRK
  $85EC  33        .db $33
  $85ED  31 31     AND ($31),Y
  $85EF  31 3E     AND ($3E),Y
  $85F1  3E 00 00  ROL $0000,X
  $85F4  E4 31     CPX $31
  $85F6  31 31     AND ($31),Y
  $85F8  3F        .db $3F
  $85F9  3F        .db $3F
  $85FA  00        BRK
  $85FB  00        BRK
  $85FC  E5 31     SBC $31
  $85FE  31 31     AND ($31),Y
  $8600  3E 3E 00  ROL $003E,X
  $8603  00        BRK
  $8604  00        BRK
  $8605  00        BRK
  $8606  00        BRK
  $8607  00        BRK

L_8608:
  $8608  50 50     BVC $865A
  $860A  00        BRK
  $860B  00        BRK
  $860C  00        BRK
  $860D  00        BRK
  $860E  3E 3E 50  ROL $503E,X
  $8611  50 00     BVC $8613

L_8613:
  $8613  00        BRK
  $8614  00        BRK
  $8615  00        BRK
  $8616  50 50     BVC $8668
  $8618  3F        .db $3F
  $8619  3F        .db $3F
  $861A  00        BRK
  $861B  00        BRK
  $861C  00        BRK
  $861D  00        BRK
  $861E  50 50     BVC $8670
  $8620  3E 3E 3E  ROL $3E3E,X
  $8623  00        BRK
  $8624  00        BRK
  $8625  00        BRK
  $8626  3F        .db $3F
  $8627  3F        .db $3F
  $8628  3F        .db $3F
  $8629  3F        .db $3F
  $862A  3F        .db $3F
  $862B  00        BRK
  $862C  00        BRK
  $862D  00        BRK
  $862E  3E 3E 3E  ROL $3E3E,X
  $8631  3E 00 00  ROL $0000,X
  $8634  00        BRK
  $8635  00        BRK
  $8636  50 50     BVC $8688
  $8638  3F        .db $3F
  $8639  3F        .db $3F
  $863A  00        BRK
  $863B  00        BRK
  $863C  00        BRK
  $863D  00        BRK
  $863E  3F        .db $3F
  $863F  3F        .db $3F
  $8640  3E 3E 3E  ROL $3E3E,X
  $8643  00        BRK
  $8644  00        BRK
  $8645  3E 3E 3E  ROL $3E3E,X
  $8648  3F        .db $3F
  $8649  3F        .db $3F
  $864A  3F        .db $3F
  $864B  00        BRK
  $864C  00        BRK
  $864D  50 50     BVC $869F
  $864F  50 3E     BVC $868F
  $8651  3E 00 00  ROL $0000,X
  $8654  00        BRK
  $8655  3F        .db $3F
  $8656  3F        .db $3F
  $8657  3F        .db $3F
  $8658  3F        .db $3F
  $8659  3F        .db $3F

L_865A:
  $865A  00        BRK
  $865B  00        BRK
  $865C  00        BRK
  $865D  00        BRK
  $865E  3E 3E 3E  ROL $3E3E,X
  $8661  3E 3E 00  ROL $003E,X
  $8664  00        BRK
  $8665  00        BRK
  $8666  50 50     BVC $86B8

L_8668:
  $8668  3F        .db $3F
  $8669  3F        .db $3F
  $866A  3F        .db $3F
  $866B  00        BRK
  $866C  00        BRK
  $866D  00        BRK
  $866E  3F        .db $3F
  $866F  3F        .db $3F

L_8670:
  $8670  3E 3E 00  ROL $003E,X
  $8673  00        BRK
  $8674  00        BRK
  $8675  30 30     BMI $86A7
  $8677  30 3F     BMI $86B8
  $8679  3F        .db $3F
  $867A  00        BRK
  $867B  00        BRK
  $867C  30 30     BMI $86AE
  $867E  30 30     BMI $86B0
  $8680  3E 3E 00  ROL $003E,X
  $8683  00        BRK
  $8684  2B        .db $2B
  $8685  3E 3E 3E  ROL $3E3E,X

L_8688:
  $8688  3F        .db $3F
  $8689  3F        .db $3F
  $868A  00        BRK
  $868B  00        BRK
  $868C  2C 3F 3F  BIT $3F3F

L_868F:
  $868F  3F        .db $3F
  $8690  3E 3E 00  ROL $003E,X
  $8693  00        BRK
  $8694  2D 3E 3E  AND $3E3E
  $8697  3E 3F 3F  ROL $3F3F,X
  $869A  00        BRK
  $869B  00        BRK
  $869C  2C 3F 3F  BIT $3F3F

L_869F:
  $869F  3F        .db $3F
  $86A0  3E 3E 00  ROL $003E,X
  $86A3  00        BRK
  $86A4  2D 3E 3E  AND $3E3E

L_86A7:
  $86A7  3E 3F 3F  ROL $3F3F,X
  $86AA  00        BRK
  $86AB  00        BRK
  $86AC  2C 3F 3F  BIT $3F3F
  $86AF  3F        .db $3F

L_86B0:
  $86B0  3E 3E 00  ROL $003E,X
  $86B3  00        BRK
  $86B4  2D 3E 3E  AND $3E3E
  $86B7  3E 3F 3F  ROL $3F3F,X
  $86BA  00        BRK
  $86BB  00        BRK
  $86BC  2E 3F 3F  ROL $3F3F
  $86BF  3F        .db $3F
  $86C0  3E 3E 00  ROL $003E,X
  $86C3  00        BRK
  $86C4  00        BRK
  $86C5  23        .db $23
  $86C6  3E 3E 3F  ROL $3F3E,X
  $86C9  3F        .db $3F
  $86CA  00        BRK
  $86CB  00        BRK
  $86CC  00        BRK
  $86CD  24 3F     BIT $3F
  $86CF  3F        .db $3F
  $86D0  70 70     BVS $8742
  $86D2  70 70     BVS $8744
  $86D4  73        .db $73
  $86D5  24 3E     BIT $3E

L_86D7:
  $86D7  3E 72 72  ROL $7272,X
  $86DA  72        .db $72
  $86DB  72        .db $72
  $86DC  75 24     ADC $24,X
  $86DE  50 50     BVC $8730
  $86E0  70 70     BVS $8752
  $86E2  70 70     BVS $8754
  $86E4  73        .db $73
  $86E5  24 3F     BIT $3F
  $86E7  3F        .db $3F
  $86E8  72        .db $72
  $86E9  72        .db $72
  $86EA  72        .db $72
  $86EB  72        .db $72
  $86EC  75 24     ADC $24,X
  $86EE  3E 3E 70  ROL $703E,X
  $86F1  70 70     BVS $8763
  $86F3  70 73     BVS $8768
  $86F5  24 50     BIT $50
  $86F7  50 72     BVC $876B
  $86F9  72        .db $72
  $86FA  72        .db $72
  $86FB  72        .db $72
  $86FC  75 24     ADC $24,X
  $86FE  3F        .db $3F
  $86FF  3F        .db $3F
  $8700  00        BRK
  $8701  B0 96     BCS $8699
  $8703  B4 00     LDY $00,X
  $8705  24 3E     BIT $3E
  $8707  3E 00 82  ROL $8200,X
  $870A  B0 00     BCS $870C

L_870C:
  $870C  00        BRK
  $870D  25 3F     AND $3F
  $870F  3F        .db $3F
  $8710  96 80     STX $80,Y
  $8712  00        BRK
  $8713  00        BRK
  $8714  20 00 00  JSR $0000
  $8717  A0 B0     LDY #$B0
  $8719  4F        .db $4F
  $871A  00        BRK
  $871B  00        BRK
  $871C  22        .db $22
  $871D  00        BRK
  $871E  A8        TAY
  $871F  A9 4F     LDA #$4F
  $8721  4F        .db $4F
  $8722  00        BRK
  $8723  29 00     AND #$00
  $8725  9E        .db $9E
  $8726  A8        TAY
  $8727  A9 A1     LDA #$A1
  $8729  A1 00     LDA ($00,X)
  $872B  24 00     BIT $00
  $872D  B0 A8     BCS $86D7
  $872F  A9 A1     LDA #$A1
  $8731  A1 00     LDA ($00,X)
  $8733  2A        ROL
  $8734  A3        .db $A3
  $8735  9C        .db $9C
  $8736  A8        TAY
  $8737  A9 A1     LDA #$A1
  $8739  A1 00     LDA ($00,X)
  $873B  00        BRK
  $873C  00        BRK
  $873D  00        BRK
  $873E  00        BRK
  $873F  A0 4F     LDY #$4F
  $8741  4F        .db $4F

L_8742:
  $8742  00        BRK
  $8743  00        BRK

L_8744:
  $8744  00        BRK
  $8745  49 3E     EOR #$3E
  $8747  3E 80 9E  ROL $9E80,X
  $874A  20 00 00  JSR $0000
  $874D  4A        LSR
  $874E  3F        .db $3F
  $874F  3F        .db $3F
  $8750  87        .db $87
  $8751  B0 21     BCS $8774
  $8753  00        BRK

L_8754:
  $8754  9D 93 00  STA $0093,X
  $8757  00        BRK
  $8758  9E        .db $9E
  $8759  AF        .db $AF
  $875A  21 00     AND ($00,X)
  $875C  A4 4B     LDY $4B
  $875E  3E 3E 92  ROL $923E,X
  $8761  00        BRK
  $8762  21 00     AND ($00,X)
  $8764  80        .db $80
  $8765  4C 50 50  JMP $5050

L_8768:
  $8768  3E 00 21  ROL $2100,X

L_876B:
  $876B  00        BRK
  $876C  00        BRK
  $876D  4D 3F 3F  EOR $3F3F
  $8770  50 00     BVC $8772

L_8772:
  $8772  22        .db $22
  $8773  00        BRK

L_8774:
  $8774  00        BRK
  $8775  00        BRK
  $8776  00        BRK
  $8777  00        BRK
  $8778  50 3E     BVC $87B8
  $877A  3E 3E 3E  ROL $3E3E,X
  $877D  3E 3E 3E  ROL $3E3E,X
  $8780  71 71     ADC ($71),Y
  $8782  71 76     ADC ($76),Y
  $8784  72        .db $72
  $8785  72        .db $72
  $8786  72        .db $72
  $8787  72        .db $72
  $8788  72        .db $72
  $8789  72        .db $72
  $878A  72        .db $72
  $878B  75 00     ADC $00,X
  $878D  92        .db $92
  $878E  A3        .db $A3
  $878F  9C        .db $9C
  $8790  96 9E     STX $9E,Y
  $8792  B3        .db $B3
  $8793  00        BRK
  $8794  23        .db $23
  $8795  0E 0E 0E  ASL $0E0E
  $8798  70 70     BVS $880A
  $879A  70 73     BVS $880F
  $879C  24 0F     BIT $0F
  $879E  0F        .db $0F
  $879F  0F        .db $0F
  $87A0  71 71     ADC ($71),Y
  $87A2  71 74     ADC ($74),Y
  $87A4  24 0E     BIT $0E
  $87A6  11 03     ORA ($03),Y
  $87A8  72        .db $72
  $87A9  72        .db $72
  $87AA  72        .db $72
  $87AB  75 24     ADC $24,X
  $87AD  0F        .db $0F
  $87AE  12        .db $12
  $87AF  04        .db $04
  $87B0  00        BRK
  $87B1  B3        .db $B3
  $87B2  B4 9E     LDY $9E,X
  $87B4  25 11     AND $11
  $87B6  03        .db $03
  $87B7  0E 70 70  ASL $7070
  $87BA  70 70     BVS $882C
  $87BC  70 12     BVS $87D0
  $87BE  04        .db $04
  $87BF  0F        .db $0F
  $87C0  3F        .db $3F
  $87C1  3F        .db $3F
  $87C2  3F        .db $3F
  $87C3  3F        .db $3F
  $87C4  3F        .db $3F
  $87C5  3F        .db $3F
  $87C6  0E 0E 00  ASL $000E
  $87C9  92        .db $92
  $87CA  9A        TXS
  $87CB  9B        .db $9B
  $87CC  92        .db $92
  $87CD  23        .db $23
  $87CE  07        .db $07
  $87CF  07        .db $07

L_87D0:
  $87D0  0E 11 0B  ASL $0B11
  $87D3  19 00 B5  ORA $B500,Y
  $87D6  05 0D     ORA $0D
  $87D8  0F        .db $0F
  $87D9  12        .db $12
  $87DA  0C        .db $0C
  $87DB  1A        .db $1A
  $87DC  81 B6     STA ($B6,X)
  $87DE  BB        .db $BB
  $87DF  06 0B     ASL $0B
  $87E1  0B        .db $0B
  $87E2  03        .db $03
  $87E3  19 AE B7  ORA $B7AE,Y
  $87E6  BC 0F 0C  LDY $0C0F,X
  $87E9  0C        .db $0C
  $87EA  04        .db $04
  $87EB  1A        .db $1A
  $87EC  80        .db $80
  $87ED  B5 15     LDA $15,X
  $87EF  02        .db $02
  $87F0  0E 0B 0B  ASL $0B0B
  $87F3  B9 9E B6  LDA $B69E,Y
  $87F6  1B        .db $1B
  $87F7  03        .db $03
  $87F8  0F        .db $0F
  $87F9  0C        .db $0C
  $87FA  0C        .db $0C
  $87FB  BA        TSX
  $87FC  92        .db $92
  $87FD  24 1C     BIT $1C
  $87FF  14        .db $14
  $8800  0E 0E 11  ASL $110E
  $8803  19 00 24  ORA $2400,Y
  $8806  15 15     ORA $15,X
  $8808  0F        .db $0F
  $8809  8F        .db $8F

L_880A:
  $880A  12        .db $12
  $880B  1A        .db $1A
  $880C  00        BRK
  $880D  24 1B     BIT $1B

L_880F:
  $880F  09 00     ORA #$00
  $8811  92        .db $92
  $8812  9B        .db $9B
  $8813  00        BRK
  $8814  00        BRK
  $8815  24 1C     BIT $1C
  $8817  04        .db $04
  $8818  00        BRK
  $8819  9D 80 00  STA $0080,X
  $881C  00        BRK
  $881D  24 15     BIT $15
  $881F  02        .db $02
  $8820  00        BRK
  $8821  9B        .db $9B
  $8822  B4 00     LDY $00,X
  $8824  00        BRK
  $8825  25 1D     AND $1D
  $8827  A0 00     LDY #$00
  $8829  80        .db $80
  $882A  00        BRK
  $882B  00        BRK

L_882C:
  $882C  23        .db $23
  $882D  00        BRK
  $882E  00        BRK
  $882F  A0 00     LDY #$00
  $8831  00        BRK
  $8832  00        BRK
  $8833  00        BRK
  $8834  25 00     AND $00
  $8836  A8        TAY
  $8837  A9 00     LDA #$00
  $8839  00        BRK
  $883A  00        BRK

L_883B:
  $883B  20 83 00  JSR $0083
  $883E  A8        TAY
  $883F  A9 00     LDA #$00
  $8841  00        BRK
  $8842  00        BRK
  $8843  22        .db $22
  $8844  84 00     STY $00
  $8846  A8        TAY
  $8847  A9 00     LDA #$00
  $8849  00        BRK
  $884A  23        .db $23
  $884B  80        .db $80
  $884C  B4 00     LDY $00,X
  $884E  A8        TAY
  $884F  A9 00     LDA #$00
  $8851  00        BRK
  $8852  25 00     AND $00
  $8854  00        BRK
  $8855  00        BRK
  $8856  A8        TAY
  $8857  A9 A4     LDA #$A4
  $8859  A2 00     LDX #$00
  $885B  00        BRK
  $885C  00        BRK
  $885D  00        BRK
  $885E  00        BRK
  $885F  A0 4F     LDY #$4F
  $8861  80        .db $80
  $8862  B3        .db $B3
  $8863  00        BRK
  $8864  00        BRK
  $8865  29 00     AND #$00
  $8867  A0 4F     LDY #$4F
  $8869  A3        .db $A3
  $886A  A2 00     LDX #$00
  $886C  00        BRK
  $886D  24 00     BIT $00
  $886F  A0 A1     LDY #$A1
  $8871  A1 00     LDA ($00,X)
  $8873  00        BRK
  $8874  00        BRK
  $8875  24 A2     BIT $A2
  $8877  A0 A1     LDY #$A1
  $8879  A1 00     LDA ($00,X)
  $887B  00        BRK
  $887C  9E        .db $9E
  $887D  B7        .db $B7
  $887E  83        .db $83
  $887F  A0 4F     LDY #$4F
  $8881  4F        .db $4F
  $8882  00        BRK
  $8883  00        BRK
  $8884  B0 B5     BCS $883B
  $8886  84 A0     STY $A0
  $8888  87        .db $87
  $8889  80        .db $80
  $888A  00        BRK
  $888B  00        BRK
  $888C  00        BRK
  $888D  B6 A8     LDX $A8,Y
  $888F  A9 A4     LDA #$A4
  $8891  98        TYA
  $8892  00        BRK
  $8893  00        BRK
  $8894  00        BRK
  $8895  24 A8     BIT $A8
  $8897  A9 00     LDA #$00
  $8899  00        BRK
  $889A  00        BRK
  $889B  00        BRK
  $889C  00        BRK
  $889D  25 A8     AND $A8
  $889F  A9 00     LDA #$00
  $88A1  00        BRK
  $88A2  00        BRK
  $88A3  00        BRK
  $88A4  00        BRK
  $88A5  00        BRK
  $88A6  00        BRK
  $88A7  A0 00     LDY #$00
  $88A9  00        BRK
  $88AA  00        BRK
  $88AB  00        BRK
  $88AC  00        BRK
  $88AD  00        BRK
  $88AE  08        PHP
  $88AF  18        CLC
  $88B0  00        BRK
  $88B1  80        .db $80
  $88B2  B3        .db $B3
  $88B3  00        BRK
  $88B4  00        BRK
  $88B5  00        BRK
  $88B6  0E 03 4F  ASL $4F03
  $88B9  9A        TXS
  $88BA  80        .db $80
  $88BB  00        BRK
  $88BC  00        BRK
  $88BD  00        BRK
  $88BE  0F        .db $0F
  $88BF  04        .db $04
  $88C0  4F        .db $4F
  $88C1  4F        .db $4F
  $88C2  A3        .db $A3
  $88C3  9C        .db $9C
  $88C4  00        BRK
  $88C5  78        SEI
  $88C6  79 7A A1  ADC $A17A,Y
  $88C9  A1 00     LDA ($00,X)
  $88CB  00        BRK
  $88CC  00        BRK
  $88CD  00        BRK
  $88CE  16 7C     ASL $7C,X
  $88D0  A1 A1     LDA ($A1,X)
  $88D2  00        BRK
  $88D3  00        BRK
  $88D4  00        BRK
  $88D5  08        PHP
  $88D6  7E 7F 4F  ROR $4F7F,X
  $88D9  4F        .db $4F
  $88DA  00        BRK
  $88DB  82        .db $82
  $88DC  96 1E     STX $1E,Y
  $88DE  1F        .db $1F
  $88DF  C0 00     CPY #$00
  $88E1  00        BRK
  $88E2  82        .db $82
  $88E3  80        .db $80
  $88E4  BD 79 7A  LDA $7A79,X
  $88E7  7B        .db $7B
  $88E8  00        BRK
  $88E9  00        BRK
  $88EA  BE 83 B3  LDX $B383,Y
  $88ED  16 7C     ASL $7C,X
  $88EF  7D 00 00  ADC $0000,X
  $88F2  85 84     STA $84
  $88F4  08        PHP
  $88F5  7E 7F C2  ROR $C27F,X
  $88F8  00        BRK
  $88F9  00        BRK
  $88FA  92        .db $92
  $88FB  81 1E     STA ($1E,X)
  $88FD  1F        .db $1F
  $88FE  C0 C1     CPY #$C1
  $8900  00        BRK
  $8901  00        BRK
  $8902  00        BRK
  $8903  78        SEI
  $8904  79 7A 7B  ADC $7B7A,Y
  $8907  C3        .db $C3
  $8908  00        BRK
  $8909  00        BRK
  $890A  A4 9C     LDY $9C
  $890C  16 7C     ASL $7C,X
  $890E  7D C4 00  ADC $00C4,X
  $8911  80        .db $80
  $8912  B4 08     LDY $08,X
  $8914  7E 7F C2  ROR $C27F,X
  $8917  C5 4F     CMP $4F
  $8919  9A        TXS
  $891A  80        .db $80
  $891B  1E C6 C2  ASL $C2C6,X
  $891E  BF        .db $BF
  $891F  00        BRK
  $8920  A1 00     LDA ($00,X)
  $8922  78        SEI
  $8923  C7        .db $C7
  $8924  C8        INY
  $8925  00        BRK
  $8926  0E 03 A1  ASL $A103
  $8929  00        BRK
  $892A  00        BRK
  $892B  16 C9     ASL $C9,X
  $892D  A4 0F     LDY $0F
  $892F  04        .db $04
  $8930  4F        .db $4F
  $8931  00        BRK
  $8932  11 CA     ORA ($CA),Y
  $8934  B9 A5 0E  LDA $0EA5,Y
  $8937  03        .db $03
  $8938  00        BRK
  $8939  00        BRK
  $893A  12        .db $12
  $893B  04        .db $04
  $893C  BA        TSX
  $893D  00        BRK
  $893E  0F        .db $0F
  $893F  04        .db $04
  $8940  00        BRK
  $8941  00        BRK
  $8942  00        BRK
  $8943  00        BRK
  $8944  00        BRK
  $8945  00        BRK
  $8946  A8        TAY
  $8947  A9 00     LDA #$00
  $8949  A4 A2     LDY $A2
  $894B  00        BRK
  $894C  00        BRK
  $894D  00        BRK
  $894E  A8        TAY
  $894F  A9 00     LDA #$00
  $8951  80        .db $80
  $8952  B4 A3     LDY $A3,X
  $8954  A2 00     LDX #$00
  $8956  AA        TAX
  $8957  AB        .db $AB
  $8958  00        BRK
  $8959  4F        .db $4F
  $895A  00        BRK
  $895B  80        .db $80
  $895C  4F        .db $4F
  $895D  00        BRK
  $895E  30 30     BMI $8990
  $8960  80        .db $80
  $8961  A1 00     LDA ($00,X)
  $8963  00        BRK
  $8964  A1 00     LDA ($00,X)
  $8966  CB        .db $CB
  $8967  CB        .db $CB
  $8968  80        .db $80
  $8969  A1 00     LDA ($00,X)
  $896B  00        BRK
  $896C  A1 A4     LDA ($A4,X)
  $896E  15 15     ORA $15,X
  $8970  98        TYA
  $8971  4F        .db $4F
  $8972  00        BRK
  $8973  00        BRK
  $8974  86 98     STX $98
  $8976  CC CC 00  CPY $00CC
  $8979  81 00     STA ($00,X)
  $897B  4F        .db $4F
  $897C  AF        .db $AF
  $897D  00        BRK
  $897E  15 15     ORA $15,X
  $8980  86 98     STX $98
  $8982  B4 A1     LDY $A1,X
  $8984  00        BRK
  $8985  0E 13 09  ASL $0913
  $8988  00        BRK
  $8989  A3        .db $A3
  $898A  9C        .db $9C
  $898B  A1 A4     LDA ($A4,X)
  $898D  8F        .db $8F
  $898E  0C        .db $0C
  $898F  04        .db $04

L_8990:
  $8990  00        BRK
  $8991  A1 00     LDA ($00,X)
  $8993  A1 00     LDA ($00,X)
  $8995  11 0B     ORA ($0B),Y
  $8997  0E 00 A1  ASL $A100
  $899A  96 4F     STX $4F,Y
  $899C  81 12     STA ($12,X)
  $899E  0C        .db $0C
  $899F  0F        .db $0F
  $89A0  00        BRK
  $89A1  80        .db $80
  $89A2  92        .db $92
  $89A3  4F        .db $4F
  $89A4  A3        .db $A3
  $89A5  0E 0E 0E  ASL $0E0E
  $89A8  00        BRK
  $89A9  00        BRK
  $89AA  00        BRK
  $89AB  82        .db $82
  $89AC  9A        TXS
  $89AD  0F        .db $0F
  $89AE  0F        .db $0F
  $89AF  0F        .db $0F
  $89B0  00        BRK
  $89B1  00        BRK
  $89B2  00        BRK
  $89B3  B4 80     LDY $80,X
  $89B5  11 0B     ORA ($0B),Y
  $89B7  03        .db $03
  $89B8  00        BRK
  $89B9  00        BRK
  $89BA  00        BRK
  $89BB  00        BRK
  $89BC  00        BRK
  $89BD  12        .db $12
  $89BE  0C        .db $0C
  $89BF  04        .db $04
  $89C0  00        BRK
  $89C1  00        BRK
  $89C2  00        BRK
  $89C3  BE 0E 0B  LDX $0B0E,Y
  $89C6  0B        .db $0B
  $89C7  03        .db $03
  $89C8  00        BRK
  $89C9  00        BRK
  $89CA  00        BRK
  $89CB  85 8F     STA $8F
  $89CD  0C        .db $0C
  $89CE  0C        .db $0C
  $89CF  04        .db $04
  $89D0  00        BRK
  $89D1  00        BRK
  $89D2  00        BRK
  $89D3  B0 11     BCS $89E6
  $89D5  0B        .db $0B
  $89D6  0E 0E 00  ASL $000E
  $89D9  00        BRK
  $89DA  A3        .db $A3
  $89DB  A2 12     LDX #$12
  $89DD  0C        .db $0C
  $89DE  0F        .db $0F
  $89DF  0F        .db $0F
  $89E0  00        BRK
  $89E1  00        BRK
  $89E2  00        BRK
  $89E3  86 3E     STX $3E
  $89E5  3E 3E 3E  ROL $3E3E,X
  $89E8  00        BRK
  $89E9  00        BRK
  $89EA  00        BRK
  $89EB  00        BRK
  $89EC  3F        .db $3F
  $89ED  3F        .db $3F
  $89EE  3F        .db $3F
  $89EF  3F        .db $3F
  $89F0  D0 EA     BNE $89DC
  $89F2  00        BRK
  $89F3  00        BRK
  $89F4  3E 3E 3E  ROL $3E3E,X
  $89F7  3E D1 D2  ROL $D2D1,X
  $89FA  D3        .db $D3
  $89FB  D3        .db $D3
  $89FC  3F        .db $3F
  $89FD  3F        .db $3F
  $89FE  3F        .db $3F
  $89FF  3F        .db $3F
  $8A00  A4 3E     LDY $3E
  $8A02  D5 D4     CMP $D4,X
  $8A04  3E 98 B1  ROL $B198,X
  $8A07  00        BRK
  $8A08  80        .db $80
  $8A09  3F        .db $3F
  $8A0A  D5 D4     CMP $D4,X
  $8A0C  3F        .db $3F
  $8A0D  80        .db $80
  $8A0E  B2        .db $B2
  $8A0F  00        BRK
  $8A10  00        BRK
  $8A11  3E D5 D4  ROL $D4D5,X
  $8A14  3E AE 80  ROL $80AE,X
  $8A17  00        BRK
  $8A18  00        BRK
  $8A19  3F        .db $3F
  $8A1A  D5 D4     CMP $D4,X
  $8A1C  3F        .db $3F
  $8A1D  A4 A2     LDY $A2
  $8A1F  00        BRK
  $8A20  80        .db $80
  $8A21  3E D5 D4  ROL $D4D5,X
  $8A24  3E 00 AF  ROL $AF00,X
  $8A27  A0 A2     LDY #$A2
  $8A29  3F        .db $3F
  $8A2A  D5 D4     CMP $D4,X
  $8A2C  3F        .db $3F
  $8A2D  B3        .db $B3
  $8A2E  A8        TAY
  $8A2F  A9 90     LDA #$90
  $8A31  3E D5 D4  ROL $D4D5,X
  $8A34  3E 98 A8  ROL $A898,X
  $8A37  A9 91     LDA #$91
  $8A39  3F        .db $3F
  $8A3A  D6 D7     DEC $D7,X
  $8A3C  3F        .db $3F
  $8A3D  96 A8     STX $A8,Y
  $8A3F  A9 3E     LDA #$3E
  $8A41  D8        CLD
  $8A42  DA        .db $DA
  $8A43  D4        .db $D4
  $8A44  D9 D9 DD  CMP $DDD9,Y
  $8A47  3E 3F D5  ROL $D53F,X
  $8A4A  85 91     STA $91
  $8A4C  A4 D4     LDY $D4
  $8A4E  4E 3F 3E  LSR $3E3F
  $8A51  D5 B0     CMP $B0,X
  $8A53  96 80     STX $80,Y
  $8A55  D4        .db $D4
  $8A56  4B        .db $4B
  $8A57  3E 3F D5  ROL $D53F,X
  $8A5A  4F        .db $4F
  $8A5B  92        .db $92
  $8A5C  96 D4     STX $D4,Y
  $8A5E  4E 3F 3E  LSR $3E3F
  $8A61  D5 A1     CMP $A1,X
  $8A63  00        BRK
  $8A64  92        .db $92
  $8A65  D4        .db $D4
  $8A66  4B        .db $4B
  $8A67  3E 3F D5  ROL $D53F,X
  $8A6A  A4 A2     LDY $A2
  $8A6C  A8        TAY
  $8A6D  D4        .db $D4
  $8A6E  4E 3F 3E  LSR $3E3F
  $8A71  D5 96     CMP $96,X
  $8A73  B3        .db $B3
  $8A74  A8        TAY
  $8A75  D4        .db $D4
  $8A76  4B        .db $4B
  $8A77  3E 3F DB  ROL $DB3F,X
  $8A7A  DC        .db $DC
  $8A7B  DC        .db $DC
  $8A7C  DC        .db $DC
  $8A7D  DC        .db $DC
  $8A7E  DE 3F 00  DEC $003F,X
  $8A81  00        BRK
  $8A82  01 03     ORA ($03,X)
  $8A84  04        .db $04
  $8A85  02        .db $02
  $8A86  00        BRK
  $8A87  00        BRK
  $8A88  00        BRK
  $8A89  00        BRK
  $8A8A  01 03     ORA ($03,X)
  $8A8C  04        .db $04
  $8A8D  02        .db $02
  $8A8E  00        BRK
  $8A8F  00        BRK
  $8A90  00        BRK
  $8A91  00        BRK
  $8A92  01 03     ORA ($03,X)
  $8A94  04        .db $04
  $8A95  02        .db $02
  $8A96  00        BRK
  $8A97  00        BRK
  $8A98  00        BRK
  $8A99  00        BRK
  $8A9A  01 03     ORA ($03,X)
  $8A9C  04        .db $04
  $8A9D  02        .db $02
  $8A9E  00        BRK
  $8A9F  00        BRK
  $8AA0  00        BRK
  $8AA1  00        BRK
  $8AA2  01 03     ORA ($03,X)
  $8AA4  04        .db $04
  $8AA5  02        .db $02
  $8AA6  00        BRK
  $8AA7  00        BRK
  $8AA8  00        BRK
  $8AA9  00        BRK
  $8AAA  01 03     ORA ($03,X)
  $8AAC  04        .db $04
  $8AAD  02        .db $02
  $8AAE  00        BRK
  $8AAF  00        BRK
  $8AB0  00        BRK
  $8AB1  00        BRK
  $8AB2  01 03     ORA ($03,X)
  $8AB4  04        .db $04
  $8AB5  02        .db $02
  $8AB6  00        BRK
  $8AB7  00        BRK
  $8AB8  00        BRK
  $8AB9  00        BRK
  $8ABA  01 33     ORA ($33,X)
  $8ABC  34        .db $34
  $8ABD  02        .db $02
  $8ABE  00        BRK
  $8ABF  00        BRK
  $8AC0  01 0C     ORA ($0C,X)
  $8AC2  0C        .db $0C
  $8AC3  03        .db $03
  $8AC4  17        .db $17
  $8AC5  36 23     ROL $23,X
  $8AC7  01 01     ORA ($01,X)
  $8AC9  03        .db $03
  $8ACA  03        .db $03
  $8ACB  03        .db $03
  $8ACC  03        .db $03
  $8ACD  04        .db $04
  $8ACE  02        .db $02
  $8ACF  01 01     ORA ($01,X)
  $8AD1  03        .db $03
  $8AD2  03        .db $03
  $8AD3  03        .db $03
  $8AD4  03        .db $03
  $8AD5  04        .db $04
  $8AD6  02        .db $02
  $8AD7  01 01     ORA ($01,X)
  $8AD9  03        .db $03
  $8ADA  03        .db $03
  $8ADB  03        .db $03
  $8ADC  03        .db $03
  $8ADD  04        .db $04
  $8ADE  02        .db $02
  $8ADF  01 01     ORA ($01,X)
  $8AE1  03        .db $03
  $8AE2  03        .db $03
  $8AE3  03        .db $03
  $8AE4  03        .db $03
  $8AE5  04        .db $04
  $8AE6  02        .db $02
  $8AE7  01 01     ORA ($01,X)
  $8AE9  03        .db $03
  $8AEA  03        .db $03
  $8AEB  03        .db $03
  $8AEC  03        .db $03
  $8AED  04        .db $04
  $8AEE  02        .db $02
  $8AEF  01 01     ORA ($01,X)
  $8AF1  03        .db $03
  $8AF2  03        .db $03
  $8AF3  03        .db $03
  $8AF4  03        .db $03
  $8AF5  04        .db $04
  $8AF6  02        .db $02
  $8AF7  01 01     ORA ($01,X)
  $8AF9  0B        .db $0B
  $8AFA  0B        .db $0B
  $8AFB  0B        .db $0B
  $8AFC  0B        .db $0B
  $8AFD  2A        ROL
  $8AFE  22        .db $22
  $8AFF  01 85     ORA ($85,X)
  $8B01  85 85     STA $85
  $8B03  85 85     STA $85
  $8B05  85 85     STA $85
  $8B07  84 A5     STY $A5
  $8B09  A6 8D     LDX $8D
  $8B0B  8D 8D 8D  STA $8D8D
  $8B0E  A9 86     LDA #$86
  $8B10  8B        .db $8B
  $8B11  BF        .db $BF
  $8B12  8D 8D 8D  STA $8D8D
  $8B15  8D 9F 84  STA $849F
  $8B18  86 BF     STX $BF
  $8B1A  8D 8D 8D  STA $8D8D
  $8B1D  8D 9F 86  STA $869F
  $8B20  84 BF     STY $BF
  $8B22  8D 8D 8D  STA $8D8D
  $8B25  8D 9F 87  STA $879F
  $8B28  86 BF     STX $BF
  $8B2A  8D 8D 8D  STA $8D8D
  $8B2D  8D 9F 84  STA $849F
  $8B30  88        DEY
  $8B31  BF        .db $BF
  $8B32  8D 8D 8D  STA $8D8D
  $8B35  8D 9F 8B  STA $8B9F
  $8B38  89        .db $89
  $8B39  BF        .db $BF
  $8B3A  8D 8D 8D  STA $8D8D
  $8B3D  8D 9F 86  STA $869F
  $8B40  84 BF     STY $BF
  $8B42  8D 8D 8D  STA $8D8D
  $8B45  8D 9F 84  STA $849F
  $8B48  86 BF     STX $BF
  $8B4A  8D 8D 8D  STA $8D8D
  $8B4D  8D 9F 86  STA $869F
  $8B50  87        .db $87
  $8B51  BF        .db $BF
  $8B52  8D 8D 8D  STA $8D8D
  $8B55  8D 9F 84  STA $849F
  $8B58  84 BF     STY $BF
  $8B5A  8D 8D 8D  STA $8D8D
  $8B5D  8D 9F 86  STA $869F
  $8B60  BC BD 8D  LDY $8DBD,X
  $8B63  8D 8D 8D  STA $8D8D
  $8B66  9F        .db $9F
  $8B67  87        .db $87
  $8B68  84 8C     STY $8C
  $8B6A  8D 8D 8D  STA $8D8D
  $8B6D  8D A9 84  STA $84A9
  $8B70  94 9B     STY $9B,X
  $8B72  BE BE BE  LDX $BEBE,Y
  $8B75  BE A9 8B  LDX $8BA9,Y
  $8B78  85 85     STA $85
  $8B7A  85 85     STA $85
  $8B7C  85 85     STA $85
  $8B7E  85 86     STA $86
  $8B80  85 85     STA $85
  $8B82  85 85     STA $85
  $8B84  85 85     STA $85
  $8B86  85 84     STA $84
  $8B88  96 97     STX $97,Y
  $8B8A  8D 8D 8D  STA $8D8D
  $8B8D  8D 99 8B  STA $8B99
  $8B90  86 8C     STX $8C
  $8B92  8D 8D 8D  STA $8D8D
  $8B95  8D 99 86  STA $8699
  $8B98  85 85     STA $85
  $8B9A  85 85     STA $85
  $8B9C  85 8C     STA $8C
  $8B9E  99 84 84  STA $8484,Y
  $8BA1  8C 8D 8D  STY $8D8D
  $8BA4  8D 8D A3  STA $A38D
  $8BA7  90 8B     BCC $8B34
  $8BA9  8C A9 85  STY $85A9
  $8BAC  85 85     STA $85
  $8BAE  85 84     STA $84
  $8BB0  86 8C     STX $8C
  $8BB2  8D 8D 8D  STA $8D8D
  $8BB5  8D 9A 94  STA $949A
  $8BB8  85 85     STA $85
  $8BBA  85 85     STA $85
  $8BBC  85 85     STA $85
  $8BBE  85 85     STA $85
  $8BC0  87        .db $87
  $8BC1  80        .db $80
  $8BC2  80        .db $80
  $8BC3  80        .db $80
  $8BC4  80        .db $80
  $8BC5  A7        .db $A7
  $8BC6  84 85     STY $85
  $8BC8  84 80     STY $80
  $8BCA  80        .db $80
  $8BCB  80        .db $80
  $8BCC  80        .db $80
  $8BCD  AD 8B 84  LDA $848B
  $8BD0  8B        .db $8B
  $8BD1  80        .db $80
  $8BD2  80        .db $80
  $8BD3  80        .db $80
  $8BD4  80        .db $80
  $8BD5  AD 8B 86  LDA $868B
  $8BD8  86 80     STX $80
  $8BDA  80        .db $80
  $8BDB  80        .db $80
  $8BDC  80        .db $80
  $8BDD  A8        TAY
  $8BDE  86 88     STX $88
  $8BE0  84 80     STY $80
  $8BE2  80        .db $80
  $8BE3  80        .db $80
  $8BE4  80        .db $80
  $8BE5  A7        .db $A7
  $8BE6  87        .db $87
  $8BE7  8A        TXA
  $8BE8  86 80     STX $80
  $8BEA  80        .db $80
  $8BEB  80        .db $80
  $8BEC  80        .db $80
  $8BED  A8        TAY
  $8BEE  85 89     STA $89
  $8BF0  87        .db $87
  $8BF1  80        .db $80
  $8BF2  80        .db $80
  $8BF3  80        .db $80
  $8BF4  80        .db $80
  $8BF5  A7        .db $A7
  $8BF6  88        DEY
  $8BF7  84 85     STY $85
  $8BF9  8F        .db $8F
  $8BFA  8F        .db $8F
  $8BFB  8F        .db $8F
  $8BFC  8F        .db $8F
  $8BFD  AF        .db $AF
  $8BFE  89        .db $89
  $8BFF  86 01     STX $01
  $8C01  01 01     ORA ($01,X)
  $8C03  01 01     ORA ($01,X)
  $8C05  01 02     ORA ($02,X)
  $8C07  03        .db $03
  $8C08  01 01     ORA ($01,X)
  $8C0A  01 01     ORA ($01,X)
  $8C0C  01 01     ORA ($01,X)
  $8C0E  02        .db $02
  $8C0F  03        .db $03
  $8C10  01 01     ORA ($01,X)
  $8C12  01 01     ORA ($01,X)
  $8C14  01 01     ORA ($01,X)
  $8C16  02        .db $02
  $8C17  03        .db $03
  $8C18  01 01     ORA ($01,X)
  $8C1A  01 01     ORA ($01,X)
  $8C1C  01 01     ORA ($01,X)
  $8C1E  02        .db $02
  $8C1F  03        .db $03
  $8C20  01 01     ORA ($01,X)
  $8C22  01 01     ORA ($01,X)
  $8C24  01 01     ORA ($01,X)
  $8C26  02        .db $02
  $8C27  03        .db $03
  $8C28  01 01     ORA ($01,X)
  $8C2A  01 01     ORA ($01,X)
  $8C2C  01 02     ORA ($02,X)
  $8C2E  03        .db $03
  $8C2F  03        .db $03
  $8C30  56 56     LSR $56,X
  $8C32  56 01     LSR $01,X
  $8C34  01 02     ORA ($02,X)
  $8C36  03        .db $03
  $8C37  03        .db $03
  $8C38  57        .db $57
  $8C39  57        .db $57
  $8C3A  67        .db $67
  $8C3B  58        CLI
  $8C3C  58        CLI
  $8C3D  02        .db $02
  $8C3E  03        .db $03
  $8C3F  03        .db $03
  $8C40  00        BRK
  $8C41  00        BRK
  $8C42  59 5A 5B  EOR $5B5A,Y
  $8C45  59 00 00  EOR $0000,Y
  $8C48  00        BRK
  $8C49  00        BRK
  $8C4A  59 5A 5B  EOR $5B5A,Y
  $8C4D  59 00 00  EOR $0000,Y
  $8C50  00        BRK
  $8C51  00        BRK
  $8C52  59 5A 5B  EOR $5B5A,Y
  $8C55  59 00 00  EOR $0000,Y
  $8C58  00        BRK
  $8C59  00        BRK
  $8C5A  59 5A 5B  EOR $5B5A,Y
  $8C5D  59 00 00  EOR $0000,Y
  $8C60  00        BRK
  $8C61  00        BRK
  $8C62  59 5A 5B  EOR $5B5A,Y
  $8C65  59 00 00  EOR $0000,Y
  $8C68  00        BRK
  $8C69  00        BRK
  $8C6A  59 5A 5B  EOR $5B5A,Y
  $8C6D  59 00 00  EOR $0000,Y
  $8C70  00        BRK
  $8C71  00        BRK
  $8C72  59 5A 5B  EOR $5B5A,Y
  $8C75  59 00 00  EOR $0000,Y
  $8C78  00        BRK
  $8C79  00        BRK
  $8C7A  59 5A 5B  EOR $5B5A,Y
  $8C7D  59 00 00  EOR $0000,Y
  $8C80  00        BRK
  $8C81  00        BRK
  $8C82  59 5A 5B  EOR $5B5A,Y
  $8C85  59 00 00  EOR $0000,Y
  $8C88  00        BRK
  $8C89  00        BRK
  $8C8A  59 5A 5B  EOR $5B5A,Y
  $8C8D  59 00 00  EOR $0000,Y
  $8C90  00        BRK
  $8C91  00        BRK
  $8C92  59 5A 5B  EOR $5B5A,Y
  $8C95  59 00 00  EOR $0000,Y
  $8C98  00        BRK
  $8C99  00        BRK
  $8C9A  59 5A 5B  EOR $5B5A,Y
  $8C9D  59 00 00  EOR $0000,Y
  $8CA0  00        BRK
  $8CA1  00        BRK
  $8CA2  59 5A 5B  EOR $5B5A,Y
  $8CA5  59 00 00  EOR $0000,Y
  $8CA8  00        BRK
  $8CA9  00        BRK
  $8CAA  59 5A 5B  EOR $5B5A,Y
  $8CAD  59 00 00  EOR $0000,Y
  $8CB0  00        BRK
  $8CB1  00        BRK
  $8CB2  59 5A 5B  EOR $5B5A,Y
  $8CB5  59 00 00  EOR $0000,Y
  $8CB8  00        BRK
  $8CB9  00        BRK
  $8CBA  59 5C 5D  EOR $5D5C,Y
  $8CBD  59 00 00  EOR $0000,Y
  $8CC0  03        .db $03
  $8CC1  5E 5F 60  LSR $605F,X
  $8CC4  5B        .db $5B
  $8CC5  02        .db $02
  $8CC6  03        .db $03
  $8CC7  03        .db $03
  $8CC8  03        .db $03
  $8CC9  5A        .db $5A
  $8CCA  5B        .db $5B
  $8CCB  5B        .db $5B
  $8CCC  5B        .db $5B
  $8CCD  0F        .db $0F
  $8CCE  02        .db $02
  $8CCF  03        .db $03
  $8CD0  03        .db $03
  $8CD1  5A        .db $5A
  $8CD2  5B        .db $5B
  $8CD3  5B        .db $5B
  $8CD4  5B        .db $5B
  $8CD5  0F        .db $0F
  $8CD6  02        .db $02
  $8CD7  03        .db $03
  $8CD8  03        .db $03
  $8CD9  5A        .db $5A
  $8CDA  5B        .db $5B
  $8CDB  5B        .db $5B
  $8CDC  5B        .db $5B
  $8CDD  5B        .db $5B
  $8CDE  02        .db $02
  $8CDF  03        .db $03
  $8CE0  03        .db $03
  $8CE1  5A        .db $5A
  $8CE2  5B        .db $5B
  $8CE3  5B        .db $5B
  $8CE4  5B        .db $5B
  $8CE5  5B        .db $5B
  $8CE6  02        .db $02
  $8CE7  03        .db $03
  $8CE8  03        .db $03
  $8CE9  5A        .db $5A
  $8CEA  5B        .db $5B
  $8CEB  5B        .db $5B
  $8CEC  5B        .db $5B
  $8CED  5B        .db $5B
  $8CEE  02        .db $02
  $8CEF  03        .db $03
  $8CF0  03        .db $03
  $8CF1  5A        .db $5A
  $8CF2  5B        .db $5B
  $8CF3  5B        .db $5B
  $8CF4  5B        .db $5B
  $8CF5  5B        .db $5B
  $8CF6  02        .db $02
  $8CF7  03        .db $03
  $8CF8  03        .db $03
  $8CF9  61 62     ADC ($62,X)
  $8CFB  62        .db $62
  $8CFC  62        .db $62
  $8CFD  62        .db $62
  $8CFE  63        .db $63
  $8CFF  03        .db $03
  $8D00  81 81     STA ($81,X)
  $8D02  81 81     STA ($81,X)
  $8D04  81 A4     STA ($A4,X)
  $8D06  82        .db $82
  $8D07  82        .db $82
  $8D08  81 81     STA ($81,X)
  $8D0A  81 81     STA ($81,X)
  $8D0C  81 A4     STA ($A4,X)
  $8D0E  82        .db $82
  $8D0F  82        .db $82
  $8D10  81 81     STA ($81,X)
  $8D12  81 81     STA ($81,X)
  $8D14  81 A4     STA ($A4,X)
  $8D16  82        .db $82
  $8D17  82        .db $82
  $8D18  81 81     STA ($81,X)
  $8D1A  81 81     STA ($81,X)
  $8D1C  81 A4     STA ($A4,X)
  $8D1E  82        .db $82
  $8D1F  82        .db $82
  $8D20  81 81     STA ($81,X)
  $8D22  81 81     STA ($81,X)
  $8D24  81 A4     STA ($A4,X)
  $8D26  82        .db $82
  $8D27  82        .db $82
  $8D28  81 81     STA ($81,X)
  $8D2A  81 81     STA ($81,X)
  $8D2C  81 A4     STA ($A4,X)
  $8D2E  82        .db $82
  $8D2F  82        .db $82
  $8D30  81 81     STA ($81,X)
  $8D32  81 81     STA ($81,X)
  $8D34  81 A4     STA ($A4,X)
  $8D36  82        .db $82
  $8D37  82        .db $82
  $8D38  81 81     STA ($81,X)
  $8D3A  81 81     STA ($81,X)
  $8D3C  81 A4     STA ($A4,X)
  $8D3E  82        .db $82
  $8D3F  82        .db $82
  $8D40  81 81     STA ($81,X)
  $8D42  81 81     STA ($81,X)
  $8D44  81 A4     STA ($A4,X)
  $8D46  82        .db $82
  $8D47  82        .db $82
  $8D48  81 81     STA ($81,X)
  $8D4A  81 81     STA ($81,X)
  $8D4C  81 A4     STA ($A4,X)
  $8D4E  82        .db $82
  $8D4F  82        .db $82
  $8D50  81 81     STA ($81,X)
  $8D52  81 81     STA ($81,X)
  $8D54  81 82     STA ($82,X)
  $8D56  82        .db $82
  $8D57  82        .db $82
  $8D58  81 81     STA ($81,X)
  $8D5A  81 81     STA ($81,X)
  $8D5C  82        .db $82
  $8D5D  82        .db $82
  $8D5E  82        .db $82
  $8D5F  82        .db $82
  $8D60  81 81     STA ($81,X)
  $8D62  81 81     STA ($81,X)
  $8D64  82        .db $82
  $8D65  82        .db $82
  $8D66  82        .db $82
  $8D67  82        .db $82
  $8D68  81 81     STA ($81,X)
  $8D6A  81 81     STA ($81,X)
  $8D6C  81 82     STA ($82,X)
  $8D6E  82        .db $82
  $8D6F  82        .db $82
  $8D70  81 81     STA ($81,X)
  $8D72  81 81     STA ($81,X)
  $8D74  81 A4     STA ($A4,X)
  $8D76  82        .db $82
  $8D77  82        .db $82
  $8D78  81 81     STA ($81,X)
  $8D7A  81 81     STA ($81,X)
  $8D7C  81 A4     STA ($A4,X)
  $8D7E  82        .db $82
  $8D7F  82        .db $82
  $8D80  81 81     STA ($81,X)
  $8D82  81 81     STA ($81,X)
  $8D84  81 A4     STA ($A4,X)
  $8D86  82        .db $82
  $8D87  82        .db $82
  $8D88  81 81     STA ($81,X)
  $8D8A  81 81     STA ($81,X)
  $8D8C  81 A4     STA ($A4,X)
  $8D8E  82        .db $82
  $8D8F  82        .db $82
  $8D90  81 81     STA ($81,X)
  $8D92  81 81     STA ($81,X)
  $8D94  81 A4     STA ($A4,X)
  $8D96  82        .db $82
  $8D97  82        .db $82
  $8D98  81 81     STA ($81,X)
  $8D9A  81 81     STA ($81,X)
  $8D9C  81 A4     STA ($A4,X)
  $8D9E  82        .db $82

L_8D9F:
  $8D9F  82        .db $82
  $8DA0  81 81     STA ($81,X)
  $8DA2  81 81     STA ($81,X)
  $8DA4  81 A4     STA ($A4,X)
  $8DA6  82        .db $82
  $8DA7  82        .db $82
  $8DA8  85 85     STA $85
  $8DAA  85 85     STA $85
  $8DAC  9E        .db $9E
  $8DAD  9E        .db $9E
  $8DAE  A9 8B     LDA #$8B
  $8DB0  88        DEY
  $8DB1  85 84     STA $84
  $8DB3  88        DEY
  $8DB4  9E        .db $9E
  $8DB5  A9 87     LDA #$87
  $8DB7  86 89     STX $89
  $8DB9  87        .db $87
  $8DBA  86 89     STX $89
  $8DBC  9E        .db $9E
  $8DBD  9E        .db $9E
  $8DBE  A9 85     LDA #$85
  $8DC0  84 87     STY $87
  $8DC2  84 87     STY $87
  $8DC4  8C 8D A7  STY $A78D
  $8DC7  84 86     STY $86
  $8DC9  84 86     STY $86
  $8DCB  84 8C     STY $8C
  $8DCD  8D A8 86  STA $86A8
  $8DD0  88        DEY
  $8DD1  8B        .db $8B
  $8DD2  85 86     STA $86
  $8DD4  8C A9 84  STY $84A9
  $8DD7  84 89     STY $89
  $8DD9  86 84     STX $84
  $8DDB  8E AA 8F  STX $8FAA
  $8DDE  86 8B     STX $8B
  $8DE0  84 84     STY $84
  $8DE2  90 91     BCC $8D75
  $8DE4  AB        .db $AB
  $8DE5  86 88     STX $88
  $8DE7  86 8B     STX $8B
  $8DE9  93        .db $93
  $8DEA  92        .db $92
  $8DEB  A9 84     LDA #$84
  $8DED  88        DEY
  $8DEE  89        .db $89
  $8DEF  88        DEY
  $8DF0  94 95     STY $95,X
  $8DF2  AA        TAX
  $8DF3  8F        .db $8F
  $8DF4  8B        .db $8B
  $8DF5  89        .db $89
  $8DF6  84 89     STY $89
  $8DF8  85 85     STA $85
  $8DFA  89        .db $89
  $8DFB  86 86     STX $86
  $8DFD  85 86     STA $86
  $8DFF  85 85     STA $85
  $8E01  85 85     STA $85
  $8E03  85 85     STA $85
  $8E05  85 85     STA $85
  $8E07  84 96     STY $96
  $8E09  96 97     STX $97,Y
  $8E0B  70 92     BVS $8D9F
  $8E0D  8D 73 8B  STA $8B73
  $8E10  86 8B     STX $8B
  $8E12  8C 8D 71  STY $718D
  $8E15  A5 74     LDA $74
  $8E17  86 88     STX $88
  $8E19  86 84     STX $84
  $8E1B  8C 7E BC  STY $BC7E
  $8E1E  75 87     ADC $87,X
  $8E20  89        .db $89
  $8E21  8C 86 8C  STY $8C86
  $8E24  8D 71 74  STA $7471
  $8E27  85 85     STA $85
  $8E29  72        .db $72
  $8E2A  A6 A5     LDX $A5
  $8E2C  A6 8D     LDX $8D
  $8E2E  76 84     ROR $84,X
  $8E30  87        .db $87
  $8E31  86 8C     STX $8C
  $8E33  94 9B     STY $9B,X
  $8E35  7F        .db $7F
  $8E36  94 94     STY $94,X
  $8E38  85 85     STA $85
  $8E3A  85 85     STA $85
  $8E3C  85 85     STA $85
  $8E3E  85 85     STA $85
  $8E40  88        DEY
  $8E41  84 87     STY $87
  $8E43  85 85     STA $85
  $8E45  85 85     STA $85
  $8E47  85 89     STA $89
  $8E49  8B        .db $8B
  $8E4A  85 8C     STA $8C
  $8E4C  8D 8D AC  STA $AC8D
  $8E4F  96 84     STX $84,Y
  $8E51  86 88     STX $88
  $8E53  8C 8D 8D  STY $8D8D
  $8E56  AD 86 86  LDA $8686
  $8E59  87        .db $87
  $8E5A  8A        TXA
  $8E5B  8C 8D 8D  STY $8D8D
  $8E5E  AD 87 87  LDA $8787
  $8E61  84 89     STY $89
  $8E63  8C 8D 8D  STY $8D8D
  $8E66  A8        TAY
  $8E67  85 84     STA $84
  $8E69  86 84     STX $84
  $8E6B  8C 8D 8D  STY $8D8D
  $8E6E  A7        .db $A7
  $8E6F  88        DEY
  $8E70  8B        .db $8B
  $8E71  87        .db $87
  $8E72  86 8C     STX $8C
  $8E74  8D 8D A8  STA $A88D
  $8E77  8A        TXA
  $8E78  86 85     STX $85
  $8E7A  87        .db $87
  $8E7B  8C 8D A9  STY $A98D
  $8E7E  85 89     STA $89
  $8E80  87        .db $87
  $8E81  8C A7 8C  STY $8CA7
  $8E84  8D 8D A9  STA $A98D
  $8E87  84 84     STY $84
  $8E89  8C A8 8C  STY $8CA8
  $8E8C  8D 9E A7  STA $A79E
  $8E8F  8B        .db $8B
  $8E90  86 8C     STX $8C
  $8E92  A9 8C     LDA #$8C
  $8E94  A9 9E     LDA #$9E
  $8E96  AD 86 84  LDA $8486
  $8E99  8C A7 8C  STY $8CA7
  $8E9C  A9 9E     LDA #$9E
  $8E9E  A8        TAY
  $8E9F  85 86     STA $86
  $8EA1  9E        .db $9E
  $8EA2  AD 8C A7  LDA $A78C
  $8EA5  8C A9 87  STY $87A9
  $8EA8  88        DEY
  $8EA9  9E        .db $9E
  $8EAA  A8        TAY
  $8EAB  8C AD 8C  STY $8CAD
  $8EAE  A7        .db $A7
  $8EAF  84 89     STY $89
  $8EB1  8C 8D 8D  STY $8D8D
  $8EB4  A8        TAY
  $8EB5  8C AE 94  STY $94AE
  $8EB8  85 85     STA $85
  $8EBA  85 85     STA $85
  $8EBC  85 85     STA $85
  $8EBE  85 85     STA $85
  $8EC0  85 85     STA $85
  $8EC2  85 85     STA $85
  $8EC4  85 85     STA $85
  $8EC6  85 85     STA $85
  $8EC8  8C 8D 8D  STY $8D8D
  $8ECB  8D 77 78  STA $7877
  $8ECE  9D 96 8C  STA $8C96,X
  $8ED1  99 8C 8D  STA $8D8C,Y
  $8ED4  9F        .db $9F
  $8ED5  79 99 8B  ADC $8B99,Y
  $8ED8  8C 99 8C  STY $8C99
  $8EDB  8D 7A 78  STA $787A
  $8EDE  99 8B 8C  STA $8C8B,Y
  $8EE1  99 8C 8D  STA $8D8C,Y
  $8EE4  7B        .db $7B
  $8EE5  79 99 86  ADC $8699,Y
  $8EE8  8C 99 8C  STY $8C99
  $8EEB  8D 9F 78  STA $789F
  $8EEE  99 87 8C  STA $8C87,Y
  $8EF1  99 8C 8D  STA $8D8C,Y
  $8EF4  7C        .db $7C
  $8EF5  7D 99 88  ADC $8899,X
  $8EF8  85 85     STA $85
  $8EFA  85 85     STA $85
  $8EFC  85 85     STA $85
  $8EFE  85 89     STA $89
  $8F00  85 85     STA $85
  $8F02  85 85     STA $85
  $8F04  85 85     STA $85
  $8F06  85 84     STA $84
  $8F08  A5 A6     LDA $A6
  $8F0A  8D 8D 8D  STA $8D8D
  $8F0D  8D A9 86  STA $86A9
  $8F10  8B        .db $8B
  $8F11  BF        .db $BF
  $8F12  8D 8D 8D  STA $8D8D
  $8F15  8D 9F 84  STA $849F
  $8F18  86 BF     STX $BF
  $8F1A  8D 8D 8D  STA $8D8D
  $8F1D  8D 9F 86  STA $869F
  $8F20  84 BF     STY $BF
  $8F22  8D 8D 8D  STA $8D8D
  $8F25  8D 9F 87  STA $879F
  $8F28  86 BF     STX $BF
  $8F2A  8D 8D 8D  STA $8D8D
  $8F2D  8D 9F 84  STA $849F
  $8F30  88        DEY
  $8F31  BF        .db $BF
  $8F32  8D 8D 8D  STA $8D8D
  $8F35  8D 9F 8B  STA $8B9F
  $8F38  89        .db $89
  $8F39  BF        .db $BF
  $8F3A  8D 8D 8D  STA $8D8D
  $8F3D  8D 9F 86  STA $869F
  $8F40  84 BF     STY $BF
  $8F42  8D 8D 8D  STA $8D8D
  $8F45  8D 9F 84  STA $849F
  $8F48  86 BF     STX $BF
  $8F4A  8D 8D 8D  STA $8D8D
  $8F4D  8D 9F 86  STA $869F
  $8F50  87        .db $87
  $8F51  BF        .db $BF
  $8F52  8D 8D 8D  STA $8D8D
  $8F55  8D 9F 84  STA $849F
  $8F58  84 BF     STY $BF
  $8F5A  8D 8D 8D  STA $8D8D
  $8F5D  8D 9F 86  STA $869F
  $8F60  BC BD 8D  LDY $8DBD,X
  $8F63  8D 8D 8D  STA $8D8D
  $8F66  9F        .db $9F
  $8F67  87        .db $87
  $8F68  84 8C     STY $8C
  $8F6A  8D 8D 8D  STA $8D8D
  $8F6D  8D A9 84  STA $84A9
  $8F70  94 9B     STY $9B,X
  $8F72  BE BE BE  LDX $BEBE,Y
  $8F75  BE A9 8B  LDX $8BA9,Y
  $8F78  85 85     STA $85
  $8F7A  85 85     STA $85
  $8F7C  85 85     STA $85
  $8F7E  85 86     STA $86
  $8F80  85 85     STA $85
  $8F82  85 85     STA $85
  $8F84  85 85     STA $85
  $8F86  85 84     STA $84
  $8F88  96 97     STX $97,Y
  $8F8A  8D 8D 8D  STA $8D8D
  $8F8D  8D 99 8B  STA $8B99
  $8F90  86 8C     STX $8C
  $8F92  8D 8D 8D  STA $8D8D
  $8F95  8D 99 86  STA $8699
  $8F98  85 85     STA $85
  $8F9A  85 85     STA $85
  $8F9C  85 8C     STA $8C
  $8F9E  99 84 84  STA $8484,Y
  $8FA1  8C 8D 8D  STY $8D8D
  $8FA4  8D 8D A3  STA $A38D
  $8FA7  90 8B     BCC $8F34
  $8FA9  8C A9 85  STY $85A9
  $8FAC  85 85     STA $85
  $8FAE  85 84     STA $84
  $8FB0  86 8C     STX $8C
  $8FB2  8D 8D 8D  STA $8D8D
  $8FB5  8D 9A 94  STA $949A
  $8FB8  85 85     STA $85
  $8FBA  85 85     STA $85
  $8FBC  85 85     STA $85
  $8FBE  85 85     STA $85
  $8FC0  87        .db $87
  $8FC1  80        .db $80
  $8FC2  80        .db $80
  $8FC3  80        .db $80
  $8FC4  80        .db $80
  $8FC5  A7        .db $A7
  $8FC6  84 85     STY $85
  $8FC8  84 80     STY $80
  $8FCA  80        .db $80
  $8FCB  80        .db $80
  $8FCC  80        .db $80
  $8FCD  AD 8B 84  LDA $848B
  $8FD0  8B        .db $8B
  $8FD1  80        .db $80
  $8FD2  80        .db $80
  $8FD3  80        .db $80
  $8FD4  80        .db $80
  $8FD5  AD 8B 86  LDA $868B
  $8FD8  86 80     STX $80
  $8FDA  80        .db $80
  $8FDB  80        .db $80
  $8FDC  80        .db $80
  $8FDD  A8        TAY
  $8FDE  86 88     STX $88
  $8FE0  84 80     STY $80
  $8FE2  80        .db $80
  $8FE3  80        .db $80
  $8FE4  80        .db $80
  $8FE5  A7        .db $A7
  $8FE6  87        .db $87
  $8FE7  8A        TXA
  $8FE8  86 80     STX $80
  $8FEA  80        .db $80
  $8FEB  80        .db $80
  $8FEC  80        .db $80
  $8FED  A8        TAY
  $8FEE  85 89     STA $89
  $8FF0  87        .db $87
  $8FF1  80        .db $80
  $8FF2  80        .db $80
  $8FF3  80        .db $80
  $8FF4  80        .db $80
  $8FF5  A7        .db $A7
  $8FF6  88        DEY
  $8FF7  84 85     STY $85
  $8FF9  8F        .db $8F
  $8FFA  8F        .db $8F
  $8FFB  8F        .db $8F
  $8FFC  8F        .db $8F
  $8FFD  AF        .db $AF
  $8FFE  89        .db $89
  $8FFF  86 00     STX $00
  $9001  02        .db $02
  $9002  07        .db $07
  $9003  07        .db $07
  $9004  03        .db $03
  $9005  07        .db $07

L_9006:
  $9006  06 02     ASL $02

L_9008:
  $9008  00        BRK
  $9009  00        BRK
  $900A  00        BRK
  $900B  00        BRK
  $900C  00        BRK
  $900D  00        BRK
  $900E  01 01     ORA ($01,X)
  $9010  3C        .db $3C
  $9011  FF        .db $FF
  $9012  FF        .db $FF
  $9013  FF        .db $FF
  $9014  FF        .db $FF
  $9015  FF        .db $FF
  $9016  C7        .db $C7
  $9017  F3        .db $F3
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  00        BRK
  $901C  00        BRK
  $901D  48        PHA
  $901E  FC        .db $FC
  $901F  4C 00 00  JMP $0000
  $9022  E0 C0     CPX #$C0
  $9024  F0 E0     BEQ $9006
  $9026  F0 E0     BEQ $9008
  $9028  00        BRK
  $9029  00        BRK
  $902A  00        BRK
  $902B  00        BRK
  $902C  00        BRK
  $902D  80        .db $80
  $902E  80        .db $80
  $902F  80        .db $80
  $9030  02        .db $02
  $9031  02        .db $02
  $9032  07        .db $07
  $9033  0C        .db $0C
  $9034  0E 1E 1F  ASL $1F1E
  $9037  1F        .db $1F
  $9038  00        BRK
  $9039  00        BRK
  $903A  00        BRK
  $903B  07        .db $07
  $903C  07        .db $07
  $903D  0F        .db $0F
  $903E  0C        .db $0C
  $903F  0E 00 00  ASL $0000
  $9042  01 82     ORA ($82,X)
  $9044  7C        .db $7C
  $9045  80        .db $80
  $9046  80        .db $80
  $9047  80        .db $80
  $9048  00        BRK
  $9049  00        BRK
  $904A  00        BRK
  $904B  01 83     ORA ($83,X)
  $904D  7F        .db $7F
  $904E  7F        .db $7F
  $904F  7F        .db $7F
  $9050  C0 C0     CPY #$C0
  $9052  30 18     BMI $906C
  $9054  38        SEC
  $9055  BC FC FC  LDY $FCFC,X
  $9058  00        BRK
  $9059  00        BRK
  $905A  C0 F0     CPY #$F0
  $905C  F0 78     BEQ $90D6
  $905E  18        CLC
  $905F  38        SEC
  $9060  1F        .db $1F
  $9061  0E 01 03  ASL $0301
  $9064  07        .db $07
  $9065  1F        .db $1F
  $9066  3F        .db $3F
  $9067  3F        .db $3F
  $9068  0E 00 00  ASL $0000
  $906B  01 01     ORA ($01,X)
  $906D  07        .db $07
  $906E  1F        .db $1F
  $906F  00        BRK
  $9070  FF        .db $FF
  $9071  FF        .db $FF
  $9072  1E 08 D5  ASL $D508,X
  $9075  E3        .db $E3
  $9076  E3        .db $E3
  $9077  E3        .db $E3
  $9078  7F        .db $7F
  $9079  7F        .db $7F
  $907A  FF        .db $FF
  $907B  F7        .db $F7
  $907C  E3        .db $E3
  $907D  C1 C1     CMP ($C1,X)
  $907F  00        BRK
  $9080  FC        .db $FC
  $9081  B8        CLV
  $9082  40        RTI
  $9083  E0 F0     CPX #$F0
  $9085  FC        .db $FC
  $9086  FE FE 38  INC $38FE,X
  $9089  00        BRK
  $908A  80        .db $80

L_908B:
  $908B  C0 C0     CPY #$C0
  $908D  F0 FC     BEQ $908B
  $908F  00        BRK
  $9090  00        BRK
  $9091  01 03     ORA ($03,X)
  $9093  03        .db $03
  $9094  07        .db $07
  $9095  07        .db $07
  $9096  02        .db $02

L_9097:
  $9097  02        .db $02
  $9098  00        BRK
  $9099  00        BRK
  $909A  00        BRK
  $909B  00        BRK
  $909C  00        BRK
  $909D  00        BRK
  $909E  01 01     ORA ($01,X)
  $90A0  1E FF FF  ASL $FFFF,X
  $90A3  FF        .db $FF
  $90A4  FF        .db $FF
  $90A5  FF        .db $FF
  $90A6  C7        .db $C7
  $90A7  F3        .db $F3
  $90A8  00        BRK
  $90A9  00        BRK
  $90AA  00        BRK
  $90AB  00        BRK
  $90AC  00        BRK
  $90AD  48        PHA
  $90AE  FC        .db $FC
  $90AF  4C 00 E0  JMP $E000
  $90B2  C0 F0     CPY #$F0
  $90B4  F8        SED
  $90B5  F0 E0     BEQ $9097
  $90B7  E0 00     CPX #$00
  $90B9  00        BRK
  $90BA  00        BRK
  $90BB  00        BRK
  $90BC  00        BRK
  $90BD  80        .db $80
  $90BE  80        .db $80
  $90BF  80        .db $80
  $90C0  00        BRK
  $90C1  02        .db $02
  $90C2  07        .db $07
  $90C3  07        .db $07
  $90C4  03        .db $03
  $90C5  07        .db $07
  $90C6  07        .db $07
  $90C7  03        .db $03
  $90C8  00        BRK
  $90C9  00        BRK
  $90CA  00        BRK
  $90CB  00        BRK
  $90CC  00        BRK
  $90CD  00        BRK
  $90CE  01 01     ORA ($01,X)
  $90D0  24 CF     BIT $CF
  $90D2  FF        .db $FF
  $90D3  FF        .db $FF
  $90D4  FF        .db $FF
  $90D5  FF        .db $FF

L_90D6:
  $90D6  FF        .db $FF
  $90D7  FF        .db $FF
  $90D8  00        BRK
  $90D9  00        BRK
  $90DA  00        BRK
  $90DB  00        BRK
  $90DC  00        BRK
  $90DD  08        PHP
  $90DE  FC        .db $FC
  $90DF  FC        .db $FC
  $90E0  3C        .db $3C
  $90E1  CF        .db $CF
  $90E2  9F        .db $9F
  $90E3  FF        .db $FF
  $90E4  3F        .db $3F
  $90E5  FF        .db $FF
  $90E6  FF        .db $FF
  $90E7  FF        .db $FF
  $90E8  00        BRK
  $90E9  00        BRK
  $90EA  00        BRK
  $90EB  00        BRK
  $90EC  00        BRK
  $90ED  08        PHP
  $90EE  FC        .db $FC
  $90EF  FC        .db $FC
  $90F0  01 02     ORA ($02,X)
  $90F2  04        .db $04
  $90F3  09 07     ORA #$07

L_90F5:
  $90F5  07        .db $07

L_90F6:
  $90F6  06 02     ASL $02

L_90F8:
  $90F8  00        BRK
  $90F9  00        BRK
  $90FA  00        BRK
  $90FB  00        BRK
  $90FC  00        BRK
  $90FD  00        BRK
  $90FE  01 01     ORA ($01,X)
  $9100  FF        .db $FF
  $9101  48        PHA
  $9102  90 F1     BCC $90F5
  $9104  3F        .db $3F
  $9105  FF        .db $FF
  $9106  C7        .db $C7
  $9107  F3        .db $F3
  $9108  00        BRK
  $9109  00        BRK
  $910A  00        BRK
  $910B  00        BRK
  $910C  00        BRK
  $910D  08        PHP
  $910E  FC        .db $FC
  $910F  4C 80 C0  JMP $C080
  $9112  E0 C0     CPX #$C0
  $9114  F0 E0     BEQ $90F6
  $9116  F0 E0     BEQ $90F8
  $9118  00        BRK
  $9119  00        BRK
  $911A  00        BRK
  $911B  00        BRK
  $911C  00        BRK
  $911D  80        .db $80
  $911E  80        .db $80
  $911F  80        .db $80
  $9120  00        BRK
  $9121  00        BRK
  $9122  00        BRK
  $9123  01 03     ORA ($03,X)
  $9125  03        .db $03
  $9126  02        .db $02
  $9127  02        .db $02
  $9128  00        BRK
  $9129  00        BRK
  $912A  00        BRK
  $912B  00        BRK
  $912C  01 01     ORA ($01,X)
  $912E  00        BRK
  $912F  00        BRK
  $9130  38        SEC
  $9131  4F        .db $4F
  $9132  9F        .db $9F
  $9133  FF        .db $FF
  $9134  3F        .db $3F
  $9135  FF        .db $FF
  $9136  C3        .db $C3
  $9137  01 00     ORA ($00,X)
  $9139  30 6F     BMI $91AA
  $913B  1F        .db $1F
  $913C  D1 20     CMP ($20),Y
  $913E  C0 00     CPY #$00
  $9140  00        BRK
  $9141  00        BRK
  $9142  80        .db $80
  $9143  C0 C0     CPY #$C0
  $9145  A0 A0     LDY #$A0
  $9147  A0 00     LDY #$00
  $9149  00        BRK
  $914A  00        BRK
  $914B  80        .db $80
  $914C  80        .db $80
  $914D  C0 C0     CPY #$C0
  $914F  C0 01     CPY #$01
  $9151  01 01     ORA ($01,X)
  $9153  82        .db $82
  $9154  7C        .db $7C
  $9155  80        .db $80
  $9156  80        .db $80
  $9157  80        .db $80
  $9158  00        BRK
  $9159  00        BRK
  $915A  00        BRK
  $915B  01 83     ORA ($83,X)
  $915D  7F        .db $7F
  $915E  7F        .db $7F
  $915F  7F        .db $7F
  $9160  38        SEC
  $9161  4E 9F FF  LSR $FF9F
  $9164  3F        .db $3F
  $9165  FF        .db $FF
  $9166  C3        .db $C3
  $9167  01 00     ORA ($00,X)
  $9169  30 6E     BMI $91D9
  $916B  1F        .db $1F
  $916C  DF        .db $DF
  $916D  3F        .db $3F
  $916E  C3        .db $C3
  $916F  01 00     ORA ($00,X)
  $9171  00        BRK
  $9172  00        BRK
  $9173  80        .db $80
  $9174  80        .db $80
  $9175  40        RTI
  $9176  40        RTI
  $9177  40        RTI
  $9178  00        BRK
  $9179  00        BRK
  $917A  00        BRK
  $917B  00        BRK
  $917C  00        BRK
  $917D  80        .db $80
  $917E  80        .db $80
  $917F  80        .db $80
  $9180  01 01     ORA ($01,X)
  $9182  03        .db $03
  $9183  82        .db $82
  $9184  7C        .db $7C
  $9185  80        .db $80
  $9186  80        .db $80
  $9187  80        .db $80
  $9188  01 01     ORA ($01,X)
  $918A  02        .db $02
  $918B  01 83     ORA ($83,X)
  $918D  7F        .db $7F
  $918E  7F        .db $7F
  $918F  7F        .db $7F
  $9190  80        .db $80
  $9191  C0 30     CPY #$30
  $9193  18        CLC
  $9194  38        SEC
  $9195  BC FC FC  LDY $FCFC,X
  $9198  00        BRK
  $9199  00        BRK
  $919A  C0 F0     CPY #$F0
  $919C  F0 78     BEQ $9216
  $919E  18        CLC
  $919F  38        SEC
  $91A0  38        SEC
  $91A1  4E 9F FF  LSR $FF9F
  $91A4  3F        .db $3F
  $91A5  FE C0 00  INC $00C0,X
  $91A8  00        BRK
  $91A9  30 6E     BMI $9219
  $91AB  1F        .db $1F
  $91AC  DF        .db $DF
  $91AD  3F        .db $3F
  $91AE  C3        .db $C3
  $91AF  01 00     ORA ($00,X)
  $91B1  00        BRK
  $91B2  01 82     ORA ($82,X)
  $91B4  7C        .db $7C
  $91B5  80        .db $80
  $91B6  80        .db $80
  $91B7  80        .db $80
  $91B8  01 01     ORA ($01,X)
  $91BA  02        .db $02
  $91BB  01 83     ORA ($83,X)
  $91BD  7F        .db $7F
  $91BE  7F        .db $7F
  $91BF  7F        .db $7F
  $91C0  00        BRK
  $91C1  00        BRK
  $91C2  00        BRK
  $91C3  01 02     ORA ($02,X)
  $91C5  02        .db $02
  $91C6  02        .db $02
  $91C7  02        .db $02
  $91C8  00        BRK
  $91C9  00        BRK
  $91CA  00        BRK
  $91CB  00        BRK
  $91CC  01 01     ORA ($01,X)
  $91CE  00        BRK
  $91CF  00        BRK
  $91D0  38        SEC
  $91D1  46 81     LSR $81
  $91D3  00        BRK
  $91D4  00        BRK
  $91D5  00        BRK
  $91D6  00        BRK
  $91D7  00        BRK
  $91D8  00        BRK

L_91D9:
  $91D9  38        SEC
  $91DA  7E FF FF  ROR $FFFF,X
  $91DD  FF        .db $FF
  $91DE  C3        .db $C3
  $91DF  01 38     ORA ($38,X)
  $91E1  4E 9F 3F  LSR $3F9F
  $91E4  3F        .db $3F
  $91E5  7F        .db $7F
  $91E6  03        .db $03
  $91E7  01 00     ORA ($00,X)
  $91E9  30 6E     BMI $9259
  $91EB  DF        .db $DF
  $91EC  DF        .db $DF
  $91ED  BF        .db $BF
  $91EE  C3        .db $C3
  $91EF  01 00     ORA ($00,X)
  $91F1  01 00     ORA ($00,X)
  $91F3  00        BRK
  $91F4  00        BRK
  $91F5  00        BRK
  $91F6  00        BRK
  $91F7  00        BRK
  $91F8  01 01     ORA ($01,X)
  $91FA  00        BRK
  $91FB  00        BRK
  $91FC  00        BRK
  $91FD  00        BRK
  $91FE  00        BRK
  $91FF  00        BRK
  $9200  F3        .db $F3
  $9201  47        .db $47
  $9202  FE 7C 00  INC $007C,X
  $9205  00        BRK
  $9206  00        BRK
  $9207  00        BRK
  $9208  4F        .db $4F
  $9209  FF        .db $FF
  $920A  86 7C     STX $7C
  $920C  00        BRK
  $920D  00        BRK
  $920E  00        BRK
  $920F  00        BRK
  $9210  00        BRK
  $9211  00        BRK
  $9212  00        BRK
  $9213  00        BRK
  $9214  00        BRK
  $9215  00        BRK

L_9216:
  $9216  00        BRK
  $9217  00        BRK
  $9218  18        CLC

L_9219:
  $9219  30 00     BMI $921B

L_921B:
  $921B  00        BRK
  $921C  00        BRK
  $921D  00        BRK
  $921E  00        BRK
  $921F  00        BRK
  $9220  00        BRK
  $9221  00        BRK
  $9222  00        BRK
  $9223  00        BRK
  $9224  00        BRK
  $9225  00        BRK
  $9226  00        BRK
  $9227  00        BRK
  $9228  00        BRK
  $9229  30 60     BMI $928B
  $922B  00        BRK
  $922C  C0 00     CPY #$00
  $922E  00        BRK
  $922F  00        BRK
  $9230  01 01     ORA ($01,X)
  $9232  00        BRK
  $9233  00        BRK
  $9234  00        BRK
  $9235  00        BRK
  $9236  00        BRK
  $9237  00        BRK
  $9238  00        BRK
  $9239  01 00     ORA ($00,X)
  $923B  00        BRK
  $923C  00        BRK
  $923D  00        BRK
  $923E  00        BRK
  $923F  00        BRK
  $9240  FF        .db $FF
  $9241  FF        .db $FF
  $9242  FE 7C 00  INC $007C,X
  $9245  00        BRK
  $9246  00        BRK
  $9247  00        BRK
  $9248  47        .db $47
  $9249  FF        .db $FF
  $924A  86 7C     STX $7C
  $924C  00        BRK
  $924D  00        BRK
  $924E  00        BRK
  $924F  00        BRK
  $9250  00        BRK
  $9251  01 03     ORA ($03,X)
  $9253  06 00     ASL $00
  $9255  00        BRK
  $9256  00        BRK
  $9257  00        BRK
  $9258  00        BRK

L_9259:
  $9259  01 03     ORA ($03,X)
  $925B  06 00     ASL $00
  $925D  00        BRK
  $925E  00        BRK
  $925F  00        BRK
  $9260  00        BRK
  $9261  87        .db $87
  $9262  0F        .db $0F
  $9263  0E 00 00  ASL $0000
  $9266  00        BRK
  $9267  00        BRK
  $9268  00        BRK
  $9269  B7        .db $B7
  $926A  6F        .db $6F
  $926B  0E C0 00  ASL $00C0
  $926E  00        BRK
  $926F  00        BRK
  $9270  02        .db $02
  $9271  79 79 A3  ADC $A379,Y
  $9274  7F        .db $7F
  $9275  3E 00 00  ROL $0000,X
  $9278  9E        .db $9E
  $9279  A7        .db $A7
  $927A  A7        .db $A7
  $927B  FF        .db $FF
  $927C  43        .db $43
  $927D  3E 00 00  ROL $0000,X
  $9280  02        .db $02
  $9281  79 79 A3  ADC $A379,Y
  $9284  7E 3E 00  ROR $003E,X
  $9287  00        BRK
  $9288  9E        .db $9E
  $9289  A7        .db $A7
  $928A  A7        .db $A7

L_928B:
  $928B  FF        .db $FF
  $928C  42        .db $42
  $928D  3E 00 00  ROL $0000,X
  $9290  00        BRK
  $9291  00        BRK
  $9292  00        BRK
  $9293  00        BRK
  $9294  00        BRK
  $9295  00        BRK
  $9296  00        BRK
  $9297  00        BRK
  $9298  00        BRK
  $9299  00        BRK
  $929A  00        BRK
  $929B  00        BRK
  $929C  00        BRK
  $929D  00        BRK
  $929E  00        BRK
  $929F  00        BRK
  $92A0  5A        .db $5A
  $92A1  5A        .db $5A
  $92A2  5A        .db $5A
  $92A3  49 41     EOR #$41
  $92A5  4B        .db $4B
  $92A6  5B        .db $5B
  $92A7  7B        .db $7B
  $92A8  3C        .db $3C
  $92A9  3C        .db $3C
  $92AA  3C        .db $3C
  $92AB  3E 3E 3E  ROL $3E3E,X
  $92AE  3E 3E 5E  ROL $5E3E,X
  $92B1  3E 1C 04  ROL $041C,X
  $92B4  03        .db $03
  $92B5  06 0E     ASL $0E
  $92B7  07        .db $07
  $92B8  3F        .db $3F
  $92B9  1F        .db $1F
  $92BA  07        .db $07
  $92BB  03        .db $03
  $92BC  01 03     ORA ($03,X)
  $92BE  07        .db $07
  $92BF  00        BRK
  $92C0  00        BRK
  $92C1  00        BRK
  $92C2  00        BRK
  $92C3  00        BRK
  $92C4  00        BRK
  $92C5  00        BRK
  $92C6  3F        .db $3F
  $92C7  7F        .db $7F
  $92C8  00        BRK
  $92C9  00        BRK
  $92CA  00        BRK
  $92CB  00        BRK
  $92CC  00        BRK
  $92CD  00        BRK
  $92CE  00        BRK
  $92CF  3F        .db $3F
  $92D0  00        BRK
  $92D1  00        BRK
  $92D2  00        BRK
  $92D3  00        BRK
  $92D4  7E C1 5F  ROR $5FC1,X
  $92D7  70 00     BVS $92D9

L_92D9:
  $92D9  00        BRK
  $92DA  00        BRK
  $92DB  00        BRK
  $92DC  00        BRK
  $92DD  7E FF FF  ROR $FFFF,X
  $92E0  3F        .db $3F
  $92E1  7F        .db $7F
  $92E2  5A        .db $5A
  $92E3  48        PHA
  $92E4  49 DF     EOR #$DF
  $92E6  DD FF FF  CMP $FFFF,X
  $92E9  FF        .db $FF
  $92EA  FF        .db $FF
  $92EB  FF        .db $FF
  $92EC  FF        .db $FF
  $92ED  FF        .db $FF
  $92EE  FF        .db $FF
  $92EF  00        BRK
  $92F0  00        BRK
  $92F1  00        BRK
  $92F2  00        BRK
  $92F3  00        BRK
  $92F4  00        BRK
  $92F5  7C        .db $7C
  $92F6  82        .db $82
  $92F7  7F        .db $7F
  $92F8  00        BRK
  $92F9  00        BRK
  $92FA  00        BRK
  $92FB  00        BRK
  $92FC  00        BRK
  $92FD  00        BRK
  $92FE  7C        .db $7C
  $92FF  FE 1F 1F  INC $1F1F,X
  $9302  18        CLC
  $9303  18        CLC
  $9304  18        CLC
  $9305  1C        .db $1C
  $9306  1D 1F 1F  ORA $1F1F,X
  $9309  1F        .db $1F
  $930A  1F        .db $1F
  $930B  1F        .db $1F
  $930C  1F        .db $1F
  $930D  1B        .db $1B
  $930E  1A        .db $1A
  $930F  18        CLC
  $9310  FE FE FE  INC $FEFE,X
  $9313  36 6E     ROL $6E,X
  $9315  DE 96 26  DEC $2696,X
  $9318  FE FE 06  INC $06FE,X
  $931B  CE 96 26  DEC $2696
  $931E  6E DE 1E  ROR $1EDE
  $9321  1C        .db $1C
  $9322  19 1A 1C  ORA $1C1A,Y
  $9325  18        CLC
  $9326  18        CLC
  $9327  18        CLC
  $9328  19 1B 1E  ORA $1E1B,Y
  $932B  1D 1B 1F  ORA $1F1B,X
  $932E  1F        .db $1F
  $932F  1F        .db $1F
  $9330  46 8E     LSR $8E
  $9332  06 0E     ASL $0E
  $9334  0E 0E 0E  ASL $0E0E
  $9337  4E BE 76  LSR $76BE
  $933A  FE F6 F6  INC $F6F6,X
  $933D  F6 F6     INC $F6,X
  $933F  B6 1C     LDX $1C,Y
  $9341  1D 1E 1C  ORA $1C1E,X
  $9344  18        CLC
  $9345  1C        .db $1C
  $9346  1F        .db $1F
  $9347  1F        .db $1F
  $9348  1B        .db $1B
  $9349  1A        .db $1A
  $934A  19 1B 1F  ORA $1F1B,Y
  $934D  1B        .db $1B
  $934E  1F        .db $1F
  $934F  1F        .db $1F
  $9350  9E        .db $9E
  $9351  1E 1E 36  ASL $361E,X
  $9354  6E DE FE  ROR $FEDE
  $9357  FE 66 E6  INC $E666,X
  $935A  E6 CE     INC $CE
  $935C  96 26     STX $26,Y
  $935E  FE FE 0F  INC $0FFE,X
  $9361  1F        .db $1F
  $9362  3F        .db $3F
  $9363  3D 53 53  AND $5353,X
  $9366  53        .db $53
  $9367  53        .db $53
  $9368  00        BRK
  $9369  00        BRK
  $936A  00        BRK
  $936B  7E 3C 3C  ROR $3C3C,X
  $936E  3C        .db $3C
  $936F  3C        .db $3C
  $9370  53        .db $53
  $9371  53        .db $53
  $9372  53        .db $53
  $9373  53        .db $53
  $9374  53        .db $53
  $9375  53        .db $53
  $9376  53        .db $53
  $9377  53        .db $53
  $9378  3C        .db $3C
  $9379  3C        .db $3C
  $937A  3C        .db $3C
  $937B  3C        .db $3C
  $937C  3C        .db $3C
  $937D  3C        .db $3C
  $937E  3C        .db $3C
  $937F  3C        .db $3C
  $9380  53        .db $53
  $9381  53        .db $53
  $9382  33        .db $33
  $9383  13        .db $13
  $9384  0B        .db $0B
  $9385  07        .db $07
  $9386  03        .db $03
  $9387  01 3C     ORA ($3C,X)
  $9389  3C        .db $3C
  $938A  1C        .db $1C
  $938B  0C        .db $0C
  $938C  04        .db $04
  $938D  00        BRK
  $938E  00        BRK
  $938F  00        BRK
  $9390  F8        SED
  $9391  00        BRK
  $9392  F8        SED
  $9393  00        BRK
  $9394  00        BRK
  $9395  00        BRK
  $9396  00        BRK
  $9397  00        BRK
  $9398  04        .db $04
  $9399  FC        .db $FC
  $939A  04        .db $04
  $939B  F8        SED
  $939C  00        BRK
  $939D  00        BRK
  $939E  00        BRK
  $939F  00        BRK
  $93A0  7F        .db $7F
  $93A1  00        BRK
  $93A2  3E 00 00  ROL $0000,X
  $93A5  00        BRK
  $93A6  00        BRK

L_93A7:
  $93A7  00        BRK
  $93A8  80        .db $80
  $93A9  FF        .db $FF
  $93AA  41 7F     EOR ($7F,X)
  $93AC  00        BRK
  $93AD  00        BRK
  $93AE  00        BRK
  $93AF  00        BRK
  $93B0  00        BRK
  $93B1  00        BRK
  $93B2  00        BRK
  $93B3  00        BRK
  $93B4  00        BRK

L_93B5:
  $93B5  00        BRK
  $93B6  00        BRK
  $93B7  00        BRK
  $93B8  80        .db $80
  $93B9  80        .db $80

L_93BA:
  $93BA  00        BRK
  $93BB  00        BRK
  $93BC  00        BRK
  $93BD  00        BRK
  $93BE  00        BRK
  $93BF  00        BRK

L_93C0:
  $93C0  00        BRK
  $93C1  F8        SED
  $93C2  F8        SED
  $93C3  F0 F0     BEQ $93B5
  $93C5  F0 E0     BEQ $93A7
  $93C7  E0 FC     CPX #$FC
  $93C9  FC        .db $FC
  $93CA  FC        .db $FC
  $93CB  F8        SED
  $93CC  F8        SED
  $93CD  F8        SED
  $93CE  F0 F0     BEQ $93C0
  $93D0  E0 C0     CPX #$C0
  $93D2  C0 C0     CPY #$C0
  $93D4  00        BRK
  $93D5  80        .db $80
  $93D6  00        BRK
  $93D7  00        BRK
  $93D8  F0 E0     BEQ $93BA
  $93DA  E0 E0     CPX #$E0
  $93DC  C0 C0     CPY #$C0
  $93DE  C0 80     CPY #$80
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
  $93EB  10 00     BPL $93ED

L_93ED:
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
  $9401  01 01     ORA ($01,X)
  $9403  03        .db $03
  $9404  03        .db $03
  $9405  03        .db $03
  $9406  03        .db $03
  $9407  07        .db $07
  $9408  01 06     ORA ($06,X)
  $940A  0F        .db $0F
  $940B  05 1C     ORA $1C
  $940D  0C        .db $0C
  $940E  1D 0B FC  ORA $FC0B,X
  $9411  FE FC FC  INC $FCFC,X
  $9414  FD FD FF  SBC $FFFD,X
  $9417  FF        .db $FF
  $9418  7D FF FF  ADC $FFFF,X

L_941B:
  $941B  FF        .db $FF
  $941C  C2        .db $C2
  $941D  8E C7 7F  STX $7FC7
  $9420  00        BRK
  $9421  00        BRK
  $9422  00        BRK
  $9423  00        BRK
  $9424  80        .db $80
  $9425  C0 C0     CPY #$C0

L_9427:
  $9427  C0 C0     CPY #$C0
  $9429  F0 FC     BEQ $9427
  $942B  F0 7C     BEQ $94A9
  $942D  BE B0 BC  LDX $BCB0,Y
  $9430  03        .db $03
  $9431  02        .db $02
  $9432  01 03     ORA ($03,X)
  $9434  03        .db $03
  $9435  05 04     ORA $04
  $9437  08        PHP
  $9438  04        .db $04
  $9439  01 00     ORA ($00,X)
  $943B  01 01     ORA ($01,X)
  $943D  02        .db $02
  $943E  03        .db $03
  $943F  07        .db $07
  $9440  1F        .db $1F
  $9441  0F        .db $0F
  $9442  EF        .db $EF
  $9443  FE FC F8  INC $F8FC,X
  $9446  40        RTI
  $9447  80        .db $80
  $9448  EE F6 14  INC $14F6
  $944B  E9 73     SBC #$73

L_944D:
  $944D  07        .db $07
  $944E  BF        .db $BF
  $944F  7F        .db $7F
  $9450  80        .db $80
  $9451  C0 30     CPY #$30
  $9453  08        PHP
  $9454  08        PHP
  $9455  44        .db $44
  $9456  E4 84     CPX $84
  $9458  78        SEI
  $9459  10 C0     BPL $941B
  $945B  F0 F0     BEQ $944D
  $945D  B8        CLV
  $945E  18        CLC
  $945F  78        SEI
  $9460  00        BRK
  $9461  01 01     ORA ($01,X)
  $9463  03        .db $03
  $9464  01 03     ORA ($03,X)
  $9466  03        .db $03
  $9467  07        .db $07
  $9468  01 06     ORA ($06,X)
  $946A  0F        .db $0F
  $946B  04        .db $04
  $946C  1E 0C 1D  ASL $1D0C,X
  $946F  0B        .db $0B
  $9470  FC        .db $FC
  $9471  FE FC FC  INC $FCFC,X
  $9474  FD FD FF  SBC $FFFD,X
  $9477  FF        .db $FF
  $9478  7D FF FF  ADC $FFFF,X
  $947B  E3        .db $E3
  $947C  86 CE     STX $CE
  $947E  C7        .db $C7
  $947F  7F        .db $7F
  $9480  00        BRK
  $9481  00        BRK
  $9482  00        BRK
  $9483  00        BRK
  $9484  00        BRK
  $9485  01 0F     ORA ($0F,X)
  $9487  3E 00 00  ROL $0000,X
  $948A  00        BRK
  $948B  00        BRK
  $948C  00        BRK
  $948D  00        BRK
  $948E  01 0F     ORA ($0F,X)
  $9490  00        BRK
  $9491  00        BRK
  $9492  00        BRK
  $9493  00        BRK
  $9494  3F        .db $3F
  $9495  C7        .db $C7
  $9496  FF        .db $FF
  $9497  00        BRK
  $9498  00        BRK
  $9499  00        BRK
  $949A  00        BRK
  $949B  00        BRK
  $949C  00        BRK
  $949D  3F        .db $3F
  $949E  FF        .db $FF
  $949F  FF        .db $FF
  $94A0  00        BRK
  $94A1  01 03     ORA ($03,X)
  $94A3  07        .db $07
  $94A4  0F        .db $0F
  $94A5  08        PHP
  $94A6  11 17     ORA ($17),Y
  $94A8  00        BRK

L_94A9:
  $94A9  00        BRK
  $94AA  01 03     ORA ($03,X)
  $94AC  07        .db $07
  $94AD  07        .db $07
  $94AE  0F        .db $0F
  $94AF  0F        .db $0F
  $94B0  F8        SED
  $94B1  E0 C0     CPX #$C0
  $94B3  C0 FF     CPY #$FF
  $94B5  00        BRK
  $94B6  80        .db $80
  $94B7  00        BRK
  $94B8  3F        .db $3F
  $94B9  FF        .db $FF
  $94BA  FF        .db $FF
  $94BB  FF        .db $FF
  $94BC  FF        .db $FF
  $94BD  FF        .db $FF
  $94BE  FF        .db $FF
  $94BF  FF        .db $FF
  $94C0  07        .db $07
  $94C1  03        .db $03
  $94C2  03        .db $03
  $94C3  0F        .db $0F
  $94C4  FF        .db $FF
  $94C5  00        BRK
  $94C6  00        BRK
  $94C7  00        BRK
  $94C8  FF        .db $FF
  $94C9  FF        .db $FF
  $94CA  FF        .db $FF
  $94CB  FF        .db $FF
  $94CC  FF        .db $FF
  $94CD  FF        .db $FF
  $94CE  FF        .db $FF
  $94CF  FF        .db $FF
  $94D0  2E 2F 7F  ROL $7F2F
  $94D3  7F        .db $7F
  $94D4  7F        .db $7F
  $94D5  7F        .db $7F
  $94D6  BF        .db $BF
  $94D7  BF        .db $BF
  $94D8  1F        .db $1F
  $94D9  1E 2D 0D  ASL $0D2D,X
  $94DC  3C        .db $3C
  $94DD  3C        .db $3C
  $94DE  7E 7F F0  ROR $F07F,X
  $94E1  E8        INX
  $94E2  E4 84     CPX $84
  $94E4  0C        .db $0C
  $94E5  FC        .db $FC
  $94E6  F8        SED
  $94E7  C0 0F     CPY #$0F
  $94E9  F7        .db $F7
  $94EA  FB        .db $FB
  $94EB  FB        .db $FB
  $94EC  F3        .db $F3
  $94ED  03        .db $03
  $94EE  07        .db $07
  $94EF  FF        .db $FF
  $94F0  03        .db $03
  $94F1  07        .db $07
  $94F2  CF        .db $CF
  $94F3  CB        .db $CB
  $94F4  0C        .db $0C
  $94F5  0F        .db $0F
  $94F6  07        .db $07

L_94F7:
  $94F7  00        BRK
  $94F8  FC        .db $FC
  $94F9  FB        .db $FB
  $94FA  B7        .db $B7
  $94FB  37        .db $37
  $94FC  F3        .db $F3
  $94FD  F0 F8     BEQ $94F7
  $94FF  FF        .db $FF
  $9500  7F        .db $7F
  $9501  7F        .db $7F
  $9502  7F        .db $7F
  $9503  38        SEC
  $9504  3C        .db $3C
  $9505  3E 1E 1F  ROL $1F1E,X
  $9508  00        BRK
  $9509  3F        .db $3F
  $950A  00        BRK
  $950B  1F        .db $1F
  $950C  03        .db $03
  $950D  03        .db $03

L_950E:
  $950E  0F        .db $0F
  $950F  00        BRK
  $9510  FF        .db $FF
  $9511  FF        .db $FF
  $9512  FF        .db $FF
  $9513  3F        .db $3F
  $9514  3F        .db $3F
  $9515  3F        .db $3F
  $9516  1F        .db $1F
  $9517  FF        .db $FF
  $9518  00        BRK
  $9519  FF        .db $FF
  $951A  00        BRK
  $951B  FF        .db $FF
  $951C  F0 F0     BEQ $950E
  $951E  FF        .db $FF
  $951F  00        BRK
  $9520  FF        .db $FF
  $9521  FF        .db $FF
  $9522  FF        .db $FF
  $9523  E0 FB     CPX #$FB
  $9525  FB        .db $FB
  $9526  FC        .db $FC
  $9527  FF        .db $FF
  $9528  00        BRK
  $9529  FF        .db $FF
  $952A  00        BRK
  $952B  FF        .db $FF
  $952C  FC        .db $FC
  $952D  FC        .db $FC
  $952E  FF        .db $FF
  $952F  00        BRK
  $9530  0F        .db $0F
  $9531  07        .db $07
  $9532  07        .db $07
  $9533  07        .db $07
  $9534  05 03     ORA $03
  $9536  00        BRK
  $9537  00        BRK
  $9538  07        .db $07
  $9539  00        BRK
  $953A  00        BRK
  $953B  02        .db $02
  $953C  02        .db $02
  $953D  00        BRK
  $953E  00        BRK
  $953F  00        BRK
  $9540  E3        .db $E3
  $9541  F9 FF FF  SBC $FFFF,Y
  $9544  2F        .db $2F
  $9545  FF        .db $FF
  $9546  00        BRK
  $9547  00        BRK
  $9548  FF        .db $FF
  $9549  1F        .db $1F
  $954A  07        .db $07
  $954B  D3        .db $D3
  $954C  DD 00 00  CMP $0000,X
  $954F  00        BRK
  $9550  F8        SED
  $9551  F8        SED
  $9552  FC        .db $FC
  $9553  7E 1E E6  ROR $E61E,X
  $9556  70 0F     BVS $9567
  $9558  FF        .db $FF
  $9559  FF        .db $FF
  $955A  FF        .db $FF
  $955B  FF        .db $FF
  $955C  FF        .db $FF
  $955D  7F        .db $7F
  $955E  0F        .db $0F
  $955F  00        BRK
  $9560  7F        .db $7F
  $9561  7F        .db $7F
  $9562  7F        .db $7F
  $9563  38        SEC
  $9564  3F        .db $3F
  $9565  3F        .db $3F
  $9566  1E 1F 00  ASL $001F,X
  $9569  3F        .db $3F
  $956A  00        BRK
  $956B  1F        .db $1F
  $956C  18        CLC
  $956D  18        CLC
  $956E  0F        .db $0F
  $956F  00        BRK
  $9570  FF        .db $FF
  $9571  FF        .db $FF
  $9572  FF        .db $FF
  $9573  3F        .db $3F
  $9574  BF        .db $BF
  $9575  BF        .db $BF
  $9576  1F        .db $1F
  $9577  FF        .db $FF
  $9578  00        BRK
  $9579  FF        .db $FF
  $957A  00        BRK
  $957B  FF        .db $FF
  $957C  7E 7E FF  ROR $FF7E,X
  $957F  00        BRK
  $9580  FF        .db $FF
  $9581  FF        .db $FF
  $9582  FF        .db $FF
  $9583  E0 F8     CPX #$F8
  $9585  F8        SED
  $9586  FC        .db $FC
  $9587  FF        .db $FF
  $9588  00        BRK
  $9589  FF        .db $FF
  $958A  00        BRK
  $958B  FF        .db $FF
  $958C  1F        .db $1F
  $958D  1F        .db $1F
  $958E  FF        .db $FF
  $958F  00        BRK
  $9590  FF        .db $FF
  $9591  FF        .db $FF
  $9592  FF        .db $FF
  $9593  07        .db $07
  $9594  7F        .db $7F
  $9595  7F        .db $7F
  $9596  3F        .db $3F
  $9597  FF        .db $FF
  $9598  00        BRK
  $9599  FF        .db $FF
  $959A  00        BRK
  $959B  FF        .db $FF
  $959C  87        .db $87
  $959D  87        .db $87
  $959E  FF        .db $FF
  $959F  00        BRK
  $95A0  FF        .db $FF
  $95A1  FF        .db $FF
  $95A2  FF        .db $FF
  $95A3  FC        .db $FC
  $95A4  FE FE F8  INC $F8FE,X
  $95A7  FF        .db $FF
  $95A8  00        BRK
  $95A9  FF        .db $FF
  $95AA  00        BRK
  $95AB  FF        .db $FF
  $95AC  E1 E1     SBC ($E1,X)
  $95AE  FF        .db $FF
  $95AF  00        BRK
  $95B0  FE FE FE  INC $FEFE,X
  $95B3  1C        .db $1C
  $95B4  3C        .db $3C
  $95B5  7C        .db $7C
  $95B6  78        SEI
  $95B7  F8        SED
  $95B8  00        BRK
  $95B9  FC        .db $FC
  $95BA  00        BRK
  $95BB  F8        SED
  $95BC  F8        SED
  $95BD  F8        SED
  $95BE  F0 00     BEQ $95C0

L_95C0:
  $95C0  00        BRK
  $95C1  00        BRK
  $95C2  00        BRK
  $95C3  00        BRK
  $95C4  01 07     ORA ($07,X)
  $95C6  0F        .db $0F
  $95C7  1F        .db $1F
  $95C8  00        BRK
  $95C9  00        BRK
  $95CA  00        BRK
  $95CB  00        BRK
  $95CC  00        BRK
  $95CD  01 07     ORA ($07,X)
  $95CF  0F        .db $0F
  $95D0  00        BRK
  $95D1  00        BRK
  $95D2  0F        .db $0F
  $95D3  7F        .db $7F
  $95D4  E1 83     SBC ($83,X)
  $95D6  01 FF     ORA ($FF,X)
  $95D8  00        BRK
  $95D9  00        BRK
  $95DA  00        BRK
  $95DB  0F        .db $0F
  $95DC  7F        .db $7F
  $95DD  FF        .db $FF
  $95DE  FF        .db $FF
  $95DF  FF        .db $FF
  $95E0  20 28 7F  JSR $7F28
  $95E3  7F        .db $7F
  $95E4  FE F0 FF  INC $FFF0,X
  $95E7  FE 1F 1F  INC $1F1F,X
  $95EA  30 27     BMI $9613
  $95EC  2F        .db $2F
  $95ED  6F        .db $6F
  $95EE  60        RTS
  $95EF  7F        .db $7F
  $95F0  00        BRK
  $95F1  00        BRK
  $95F2  03        .db $03
  $95F3  B7        .db $B7
  $95F4  B5 84     LDA $84,X
  $95F6  03        .db $03
  $95F7  00        BRK
  $95F8  FF        .db $FF
  $95F9  FF        .db $FF
  $95FA  FC        .db $FC
  $95FB  6B        .db $6B
  $95FC  4B        .db $4B
  $95FD  7B        .db $7B
  $95FE  FC        .db $FC
  $95FF  FF        .db $FF
  $9600  FF        .db $FF
  $9601  FF        .db $FF
  $9602  C0 73     CPY #$73
  $9604  79 3F 1F  ADC $1F3F,Y
  $9607  17        .db $17
  $9608  00        BRK
  $9609  7F        .db $7F
  $960A  7F        .db $7F
  $960B  0E 1F 0F  ASL $0F1F
  $960E  00        BRK
  $960F  0A        ASL
  $9610  FF        .db $FF
  $9611  FF        .db $FF
  $9612  F0 FF     BEQ $9613
  $9614  F8        SED
  $9615  FF        .db $FF
  $9616  BC CE 00  LDY $00CE,X
  $9619  FF        .db $FF
  $961A  FF        .db $FF
  $961B  1C        .db $1C
  $961C  FF        .db $FF
  $961D  00        BRK
  $961E  FF        .db $FF
  $961F  3F        .db $3F
  $9620  14        .db $14
  $9621  0F        .db $0F
  $9622  00        BRK
  $9623  00        BRK
  $9624  00        BRK
  $9625  00        BRK
  $9626  00        BRK
  $9627  00        BRK
  $9628  0B        .db $0B
  $9629  00        BRK
  $962A  00        BRK
  $962B  00        BRK
  $962C  00        BRK
  $962D  00        BRK
  $962E  00        BRK
  $962F  00        BRK
  $9630  FA        .db $FA
  $9631  FF        .db $FF
  $9632  00        BRK
  $9633  00        BRK
  $9634  00        BRK
  $9635  00        BRK
  $9636  00        BRK
  $9637  00        BRK
  $9638  C7        .db $C7
  $9639  00        BRK
  $963A  00        BRK
  $963B  00        BRK
  $963C  00        BRK
  $963D  00        BRK
  $963E  00        BRK
  $963F  00        BRK
  $9640  00        BRK
  $9641  07        .db $07
  $9642  1F        .db $1F
  $9643  3C        .db $3C
  $9644  5F        .db $5F
  $9645  6B        .db $6B
  $9646  FB        .db $FB
  $9647  E0 00     CPX #$00
  $9649  00        BRK
  $964A  07        .db $07
  $964B  1F        .db $1F
  $964C  3F        .db $3F
  $964D  35 44     AND $44,X
  $964F  7F        .db $7F
  $9650  FF        .db $FF
  $9651  CC 5F 76  CPY $765F
  $9654  4E 7F 00  LSR $007F
  $9657  00        BRK
  $9658  00        BRK
  $9659  7F        .db $7F
  $965A  32        .db $32
  $965B  0F        .db $0F
  $965C  33        .db $33
  $965D  00        BRK
  $965E  00        BRK
  $965F  00        BRK
  $9660  00        BRK
  $9661  00        BRK
  $9662  00        BRK
  $9663  00        BRK
  $9664  3C        .db $3C
  $9665  7E DB C3  ROR $C3DB,X
  $9668  00        BRK
  $9669  00        BRK
  $966A  00        BRK
  $966B  00        BRK
  $966C  00        BRK
  $966D  3C        .db $3C
  $966E  66 7E     ROR $7E
  $9670  FF        .db $FF
  $9671  E7        .db $E7
  $9672  7E 00 00  ROR $0000,X
  $9675  00        BRK
  $9676  00        BRK
  $9677  00        BRK
  $9678  00        BRK
  $9679  7E 18 00  ROR $0018,X
  $967C  00        BRK
  $967D  00        BRK
  $967E  00        BRK
  $967F  00        BRK
  $9680  00        BRK
  $9681  00        BRK
  $9682  18        CLC
  $9683  24 3C     BIT $3C
  $9685  00        BRK
  $9686  00        BRK
  $9687  00        BRK
  $9688  00        BRK
  $9689  00        BRK
  $968A  00        BRK
  $968B  18        CLC
  $968C  18        CLC
  $968D  00        BRK
  $968E  00        BRK
  $968F  00        BRK
  $9690  00        BRK
  $9691  00        BRK
  $9692  00        BRK
  $9693  00        BRK
  $9694  00        BRK
  $9695  0C        .db $0C
  $9696  1A        .db $1A
  $9697  12        .db $12
  $9698  00        BRK
  $9699  00        BRK
  $969A  00        BRK
  $969B  00        BRK
  $969C  00        BRK
  $969D  00        BRK
  $969E  0C        .db $0C
  $969F  0C        .db $0C
  $96A0  04        .db $04
  $96A1  3C        .db $3C
  $96A2  6C FC F6  JMP ($F6FC)
  $96A5  F6 EF     INC $EF,X
  $96A7  EB        .db $EB
  $96A8  08        PHP
  $96A9  00        BRK
  $96AA  30 00     BMI $96AC

L_96AC:
  $96AC  48        PHA
  $96AD  08        PHP
  $96AE  58        CLI
  $96AF  5C        .db $5C
  $96B0  00        BRK
  $96B1  00        BRK
  $96B2  00        BRK
  $96B3  02        .db $02
  $96B4  03        .db $03
  $96B5  00        BRK
  $96B6  04        .db $04
  $96B7  04        .db $04

L_96B8:
  $96B8  00        BRK
  $96B9  00        BRK
  $96BA  00        BRK
  $96BB  00        BRK
  $96BC  00        BRK
  $96BD  00        BRK
  $96BE  1C        .db $1C
  $96BF  1D 00 00  ORA $0000,X
  $96C2  00        BRK
  $96C3  40        RTI
  $96C4  70 41     BVS $9707
  $96C6  83        .db $83
  $96C7  86 00     STX $00
  $96C9  00        BRK
  $96CA  00        BRK
  $96CB  03        .db $03
  $96CC  07        .db $07
  $96CD  0F        .db $0F
  $96CE  9F        .db $9F
  $96CF  BE 00 00  LDX $0000,Y
  $96D2  00        BRK
  $96D3  60        RTS
  $96D4  C0 80     CPY #$80
  $96D6  00        BRK
  $96D7  00        BRK
  $96D8  00        BRK
  $96D9  00        BRK
  $96DA  00        BRK
  $96DB  E0 C0     CPX #$C0
  $96DD  80        .db $80
  $96DE  00        BRK
  $96DF  00        BRK
  $96E0  04        .db $04
  $96E1  00        BRK
  $96E2  00        BRK
  $96E3  0C        .db $0C
  $96E4  18        CLC
  $96E5  09 04     ORA #$04
  $96E7  03        .db $03
  $96E8  1F        .db $1F
  $96E9  3F        .db $3F
  $96EA  3F        .db $3F
  $96EB  7D 79 01  ADC $0179,X
  $96EE  00        BRK
  $96EF  00        BRK
  $96F0  8C 1A 32  STY $321A
  $96F3  64        .db $64
  $96F4  C4 88     CPY $88
  $96F6  30 C0     BMI $96B8
  $96F8  FC        .db $FC
  $96F9  F8        SED
  $96FA  F0 E0     BEQ $96DC
  $96FC  C0 80     CPY #$80
  $96FE  00        BRK
  $96FF  00        BRK
  $9700  00        BRK
  $9701  00        BRK
  $9702  0F        .db $0F
  $9703  1F        .db $1F
  $9704  3F        .db $3F
  $9705  3F        .db $3F
  $9706  3C        .db $3C

L_9707:
  $9707  3C        .db $3C
  $9708  00        BRK
  $9709  00        BRK
  $970A  00        BRK
  $970B  0F        .db $0F
  $970C  1F        .db $1F
  $970D  1C        .db $1C
  $970E  18        CLC
  $970F  18        CLC
  $9710  00        BRK
  $9711  00        BRK
  $9712  FF        .db $FF
  $9713  FF        .db $FF
  $9714  FF        .db $FF
  $9715  FF        .db $FF
  $9716  00        BRK
  $9717  00        BRK
  $9718  00        BRK
  $9719  00        BRK
  $971A  00        BRK
  $971B  FF        .db $FF
  $971C  FF        .db $FF
  $971D  00        BRK
  $971E  00        BRK
  $971F  00        BRK
  $9720  3C        .db $3C
  $9721  3C        .db $3C
  $9722  3C        .db $3C
  $9723  3C        .db $3C
  $9724  3C        .db $3C
  $9725  3C        .db $3C
  $9726  3C        .db $3C
  $9727  3C        .db $3C
  $9728  18        CLC
  $9729  18        CLC
  $972A  18        CLC
  $972B  18        CLC
  $972C  18        CLC
  $972D  18        CLC
  $972E  18        CLC
  $972F  18        CLC
  $9730  3C        .db $3C
  $9731  42        .db $42
  $9732  99 B1 A1  STA $A1B1,Y
  $9735  81 42     STA ($42,X)
  $9737  3C        .db $3C
  $9738  00        BRK
  $9739  3C        .db $3C

L_973A:
  $973A  7E 7E 7E  ROR $7E7E,X
  $973D  7E 3C 00  ROR $003C,X
  $9740  3C        .db $3C
  $9741  42        .db $42
  $9742  99 B1 A1  STA $A1B1,Y
  $9745  81 42     STA ($42,X)
  $9747  3C        .db $3C
  $9748  00        BRK
  $9749  3C        .db $3C
  $974A  7E 7E 7E  ROR $7E7E,X
  $974D  7E 3C 00  ROR $003C,X
  $9750  07        .db $07
  $9751  1F        .db $1F
  $9752  3F        .db $3F
  $9753  3F        .db $3F
  $9754  7F        .db $7F
  $9755  7F        .db $7F
  $9756  FF        .db $FF
  $9757  FF        .db $FF
  $9758  00        BRK
  $9759  07        .db $07
  $975A  1F        .db $1F
  $975B  1F        .db $1F
  $975C  3F        .db $3F
  $975D  3F        .db $3F
  $975E  61 41     ADC ($41,X)
  $9760  FF        .db $FF
  $9761  FF        .db $FF
  $9762  7F        .db $7F
  $9763  3F        .db $3F
  $9764  1F        .db $1F
  $9765  1F        .db $1F
  $9766  1F        .db $1F
  $9767  0F        .db $0F
  $9768  41 41     EOR ($41,X)
  $976A  23        .db $23
  $976B  1E 0E 0F  ASL $0F0E,X
  $976E  0D 00 07  ORA $0700
  $9771  1F        .db $1F
  $9772  3F        .db $3F
  $9773  3F        .db $3F
  $9774  7F        .db $7F
  $9775  7F        .db $7F
  $9776  FF        .db $FF
  $9777  F3        .db $F3
  $9778  00        BRK
  $9779  07        .db $07
  $977A  1F        .db $1F
  $977B  1F        .db $1F
  $977C  3F        .db $3F
  $977D  3F        .db $3F
  $977E  61 4D     ADC ($4D,X)
  $9780  F3        .db $F3
  $9781  FF        .db $FF
  $9782  7F        .db $7F
  $9783  3F        .db $3F
  $9784  1F        .db $1F
  $9785  1F        .db $1F
  $9786  1F        .db $1F
  $9787  0F        .db $0F
  $9788  4D 41 23  EOR $2341
  $978B  1E 0E 0F  ASL $0F0E,X
  $978E  0D 00 05  ORA $0500
  $9791  18        CLC
  $9792  20 40 40  JSR $4040
  $9795  80        .db $80
  $9796  80        .db $80
  $9797  80        .db $80
  $9798  0D 1D 38  ORA $381D
  $979B  65 ED     ADC $ED
  $979D  DD DD DD  CMP $DDDD,X
  $97A0  90 98     BCC $973A
  $97A2  9C        .db $9C
  $97A3  4D 45 20  EOR $2045
  $97A6  18        CLC
  $97A7  05 CD     ORA $CD
  $97A9  C5 C1     CMP $C1
  $97AB  E0 60     CPX #$60
  $97AD  38        SEC
  $97AE  1D 0D 05  ORA $050D,X
  $97B1  18        CLC
  $97B2  20 40 40  JSR $4040
  $97B5  80        .db $80
  $97B6  8D 9D 0D  STA $0D9D
  $97B9  1D 38 65  ORA $6538,X
  $97BC  ED DD D0  SBC $D0DD
  $97BF  C0 05     CPY #$05
  $97C1  18        CLC
  $97C2  20 45 4D  JSR $4D45
  $97C5  9D 9D 9D  STA $9D9D,X
  $97C8  0D 1D 38  ORA $381D
  $97CB  60        RTS
  $97CC  E0 C0     CPX #$C0
  $97CE  C0 C0     CPY #$C0
  $97D0  3C        .db $3C
  $97D1  7E FF FF  ROR $FFFF,X
  $97D4  FF        .db $FF
  $97D5  FF        .db $FF
  $97D6  7E 3C 00  ROR $003C,X
  $97D9  00        BRK
  $97DA  00        BRK
  $97DB  00        BRK
  $97DC  00        BRK
  $97DD  00        BRK
  $97DE  00        BRK
  $97DF  00        BRK
  $97E0  00        BRK
  $97E1  00        BRK
  $97E2  00        BRK
  $97E3  00        BRK
  $97E4  00        BRK
  $97E5  00        BRK
  $97E6  00        BRK
  $97E7  00        BRK
  $97E8  00        BRK
  $97E9  00        BRK
  $97EA  00        BRK
  $97EB  00        BRK
  $97EC  00        BRK
  $97ED  00        BRK
  $97EE  00        BRK
  $97EF  00        BRK
  $97F0  01 7F     ORA ($7F,X)
  $97F2  47        .db $47
  $97F3  5F        .db $5F
  $97F4  5F        .db $5F
  $97F5  7F        .db $7F
  $97F6  7F        .db $7F
  $97F7  FF        .db $FF
  $97F8  FE FE FA  INC $FAFE,X
  $97FB  FA        .db $FA
  $97FC  FA        .db $FA
  $97FD  C2        .db $C2
  $97FE  FE 00 00  INC $0000,X
  $9801  00        BRK
  $9802  00        BRK
  $9803  00        BRK
  $9804  00        BRK
  $9805  00        BRK
  $9806  00        BRK
  $9807  7F        .db $7F
  $9808  00        BRK
  $9809  00        BRK
  $980A  00        BRK
  $980B  00        BRK
  $980C  00        BRK
  $980D  00        BRK
  $980E  00        BRK
  $980F  00        BRK
  $9810  00        BRK
  $9811  00        BRK
  $9812  00        BRK
  $9813  1C        .db $1C
  $9814  3E 7E 7E  ROL $7E7E,X
  $9817  7E 00 00  ROR $0000,X
  $981A  00        BRK
  $981B  00        BRK
  $981C  1C        .db $1C
  $981D  3C        .db $3C
  $981E  3C        .db $3C
  $981F  30 20     BMI $9841
  $9821  40        RTI
  $9822  7F        .db $7F
  $9823  3F        .db $3F
  $9824  1E 19 2E  ASL $2E19,X
  $9827  44        .db $44
  $9828  1F        .db $1F
  $9829  3F        .db $3F
  $982A  00        BRK
  $982B  00        BRK
  $982C  01 06     ORA ($06,X)
  $982E  11 3B     ORA ($3B),Y
  $9830  20 50 E8  JSR $E850
  $9833  F4        .db $F4
  $9834  7A        .db $7A
  $9835  FD 7F 3E  SBC $3E7F,X
  $9838  C0 E0     CPY #$E0
  $983A  70 38     BVS $9874
  $983C  9C        .db $9C
  $983D  4E A6 D0  LSR $D0A6

L_9840:
  $9840  00        BRK

L_9841:
  $9841  00        BRK
  $9842  00        BRK
  $9843  00        BRK
  $9844  00        BRK
  $9845  00        BRK
  $9846  70 F8     BVS $9840
  $9848  00        BRK
  $9849  00        BRK
  $984A  00        BRK
  $984B  00        BRK
  $984C  00        BRK
  $984D  00        BRK
  $984E  00        BRK
  $984F  70 3F     BVS $9890
  $9851  3F        .db $3F
  $9852  1F        .db $1F
  $9853  0F        .db $0F
  $9854  07        .db $07
  $9855  01 00     ORA ($00,X)
  $9857  00        BRK
  $9858  1E 1E 0C  ASL $0C1E,X
  $985B  00        BRK
  $985C  00        BRK
  $985D  00        BRK
  $985E  00        BRK
  $985F  00        BRK
  $9860  7F        .db $7F
  $9861  DB        .db $DB
  $9862  20 CC CC  JSR $CCCC
  $9865  E0 5F     CPX #$5F
  $9867  40        RTI
  $9868  00        BRK
  $9869  00        BRK
  $986A  C0 80     CPY #$80
  $986C  80        .db $80
  $986D  40        RTI
  $986E  20 3F FD  JSR $FD3F
  $9871  3F        .db $3F
  $9872  38        SEC
  $9873  37        .db $37

L_9874:
  $9874  6F        .db $6F
  $9875  DF        .db $DF
  $9876  3F        .db $3F
  $9877  7E 12 10  ROR $1012,X
  $987A  07        .db $07
  $987B  0F        .db $0F
  $987C  1F        .db $1F
  $987D  3E F8 FC  ROL $FCF8,X
  $9880  F8        SED
  $9881  FC        .db $FC
  $9882  FC        .db $FC
  $9883  FC        .db $FC
  $9884  FC        .db $FC
  $9885  F8        SED
  $9886  F0 00     BEQ $9888

L_9888:
  $9888  70 78     BVS $9902
  $988A  78        SEI
  $988B  08        PHP
  $988C  30 00     BMI $988E

L_988E:
  $988E  00        BRK
  $988F  00        BRK

L_9890:
  $9890  00        BRK
  $9891  00        BRK
  $9892  01 03     ORA ($03,X)
  $9894  0F        .db $0F
  $9895  3F        .db $3F
  $9896  7F        .db $7F
  $9897  7F        .db $7F
  $9898  00        BRK
  $9899  00        BRK
  $989A  00        BRK

L_989B:
  $989B  00        BRK
  $989C  03        .db $03
  $989D  0F        .db $0F
  $989E  3F        .db $3F
  $989F  00        BRK
  $98A0  4C DA DE  JMP $DEDA
  $98A3  CC E0 DF  CPY $DFE0
  $98A6  C0 C0     CPY #$C0
  $98A8  33        .db $33
  $98A9  2D 2D 33  AND $332D
  $98AC  1F        .db $1F
  $98AD  00        BRK
  $98AE  80        .db $80
  $98AF  00        BRK
  $98B0  7E 7F 7F  ROR $7F7F,X
  $98B3  3F        .db $3F
  $98B4  DF        .db $DF
  $98B5  0F        .db $0F
  $98B6  1F        .db $1F
  $98B7  1F        .db $1F

L_98B8:
  $98B8  F8        SED
  $98B9  F0 E0     BEQ $989B
  $98BB  C3        .db $C3
  $98BC  07        .db $07
  $98BD  07        .db $07
  $98BE  0F        .db $0F
  $98BF  00        BRK
  $98C0  00        BRK
  $98C1  00        BRK
  $98C2  80        .db $80
  $98C3  80        .db $80
  $98C4  C0 E0     CPY #$E0
  $98C6  F0 F0     BEQ $98B8
  $98C8  00        BRK
  $98C9  00        BRK
  $98CA  00        BRK
  $98CB  00        BRK
  $98CC  80        .db $80
  $98CD  00        BRK
  $98CE  E0 00     CPX #$00
  $98D0  00        BRK
  $98D1  00        BRK
  $98D2  00        BRK
  $98D3  00        BRK
  $98D4  00        BRK
  $98D5  00        BRK

L_98D6:
  $98D6  60        RTS
  $98D7  F0 00     BEQ $98D9

L_98D9:
  $98D9  00        BRK
  $98DA  00        BRK
  $98DB  00        BRK
  $98DC  00        BRK
  $98DD  00        BRK
  $98DE  00        BRK
  $98DF  60        RTS
  $98E0  07        .db $07
  $98E1  0F        .db $0F
  $98E2  1F        .db $1F
  $98E3  1F        .db $1F
  $98E4  3C        .db $3C
  $98E5  38        SEC
  $98E6  38        SEC
  $98E7  3F        .db $3F
  $98E8  03        .db $03
  $98E9  07        .db $07
  $98EA  0D 0C 1B  ORA $1B0C
  $98ED  07        .db $07
  $98EE  07        .db $07
  $98EF  00        BRK
  $98F0  E1 E1     SBC ($E1,X)
  $98F2  C0 FF     CPY #$FF
  $98F4  00        BRK
  $98F5  07        .db $07
  $98F6  07        .db $07
  $98F7  FF        .db $FF
  $98F8  C0 C0     CPY #$C0
  $98FA  80        .db $80
  $98FB  00        BRK
  $98FC  FF        .db $FF
  $98FD  FF        .db $FF
  $98FE  FF        .db $FF
  $98FF  00        BRK
  $9900  F8        SED
  $9901  FC        .db $FC

L_9902:
  $9902  FE 7F DF  INC $DF7F,X
  $9905  2F        .db $2F
  $9906  FF        .db $FF
  $9907  FF        .db $FF
  $9908  F0 F8     BEQ $9902
  $990A  6C 1E 0C  JMP ($0C1E)
  $990D  C0 C0     CPY #$C0
  $990F  20 1D 0E  JSR $0E1D
  $9912  04        .db $04
  $9913  04        .db $04
  $9914  02        .db $02

L_9915:
  $9915  05 04     ORA $04
  $9917  04        .db $04
  $9918  00        BRK
  $9919  00        BRK
  $991A  00        BRK
  $991B  00        BRK

L_991C:
  $991C  00        BRK
  $991D  02        .db $02
  $991E  03        .db $03
  $991F  03        .db $03
  $9920  B3        .db $B3
  $9921  03        .db $03
  $9922  C3        .db $C3
  $9923  C6 0D     DEC $0D
  $9925  FB        .db $FB
  $9926  07        .db $07
  $9927  C7        .db $C7
  $9928  01 00     ORA ($00,X)
  $992A  00        BRK
  $992B  01 03     ORA ($03,X)
  $992D  07        .db $07
  $992E  FF        .db $FF
  $992F  3F        .db $3F
  $9930  FE BE FC  INC $FCBE,X
  $9933  F0 E0     BEQ $9915
  $9935  E0 E0     CPX #$E0
  $9937  E0 20     CPX #$20
  $9939  60        RTS
  $993A  F0 E0     BEQ $991C
  $993C  80        .db $80
  $993D  C0 C0     CPY #$C0
  $993F  80        .db $80
  $9940  0D 0D 1C  ORA $1C0D
  $9943  1E 1F 7F  ASL $7F1F,X
  $9946  FF        .db $FF
  $9947  FF        .db $FF
  $9948  02        .db $02
  $9949  02        .db $02
  $994A  03        .db $03
  $994B  09 0C     ORA #$0C
  $994D  1E 7F 00  ASL $007F,X
  $9950  A7        .db $A7
  $9951  E7        .db $E7
  $9952  C2        .db $C2
  $9953  0C        .db $0C
  $9954  F0 80     BEQ $98D6
  $9956  81 81     STA ($81,X)
  $9958  DF        .db $DF
  $9959  DE 3C F0  DEC $F03C,X
  $995C  00        BRK
  $995D  00        BRK
  $995E  00        BRK
  $995F  00        BRK
  $9960  F0 F8     BEQ $995A
  $9962  FC        .db $FC
  $9963  7C        .db $7C
  $9964  FC        .db $FC
  $9965  FE FF FF  INC $FFFF,X
  $9968  00        BRK
  $9969  00        BRK
  $996A  18        CLC
  $996B  38        SEC
  $996C  60        RTS
  $996D  7C        .db $7C
  $996E  FE 00 00  INC $0000,X
  $9971  00        BRK
  $9972  00        BRK
  $9973  00        BRK
  $9974  01 02     ORA ($02,X)
  $9976  04        .db $04
  $9977  08        PHP
  $9978  00        BRK
  $9979  00        BRK
  $997A  00        BRK
  $997B  00        BRK
  $997C  00        BRK
  $997D  01 03     ORA ($03,X)
  $997F  07        .db $07
  $9980  00        BRK
  $9981  00        BRK
  $9982  00        BRK
  $9983  00        BRK
  $9984  F8        SED
  $9985  04        .db $04
  $9986  0A        ASL
  $9987  16 00     ASL $00,X
  $9989  00        BRK
  $998A  00        BRK
  $998B  00        BRK
  $998C  00        BRK
  $998D  F8        SED
  $998E  F4        .db $F4
  $998F  EC 00 38  CPX $3800
  $9992  7C        .db $7C
  $9993  FD FF FF  SBC $FFFF,X
  $9996  7F        .db $7F
  $9997  3F        .db $3F
  $9998  00        BRK
  $9999  00        BRK
  $999A  38        SEC
  $999B  78        SEI
  $999C  78        SEI
  $999D  64        .db $64
  $999E  3C        .db $3C
  $999F  18        CLC
  $99A0  10 20     BPL $99C2
  $99A2  DF        .db $DF

L_99A3:
  $99A3  40        RTI
  $99A4  C0 C0     CPY #$C0
  $99A6  FF        .db $FF
  $99A7  FF        .db $FF
  $99A8  0F        .db $0F
  $99A9  1F        .db $1F
  $99AA  20 BF BF  JSR $BFBF
  $99AD  BF        .db $BF
  $99AE  40        RTI
  $99AF  00        BRK
  $99B0  2E 5D 3F  ROL $3F5D
  $99B3  78        SEI
  $99B4  77        .db $77
  $99B5  EF        .db $EF
  $99B6  DF        .db $DF
  $99B7  3F        .db $3F
  $99B8  DC        .db $DC
  $99B9  BA        TSX
  $99BA  F0 E7     BEQ $99A3
  $99BC  CF        .db $CF
  $99BD  1E 3E F8  ASL $F83E,X
  $99C0  1E 00 01  ASL $0100,X
  $99C3  01 03     ORA ($03,X)
  $99C5  07        .db $07
  $99C6  0F        .db $0F
  $99C7  0F        .db $0F
  $99C8  00        BRK
  $99C9  00        BRK
  $99CA  00        BRK
  $99CB  00        BRK
  $99CC  01 00     ORA ($00,X)
  $99CE  07        .db $07
  $99CF  00        BRK
  $99D0  40        RTI
  $99D1  CC DA DE  CPY $DEDA
  $99D4  CC E0 FF  CPY $FFE0
  $99D7  F0 3F     BEQ $9A18
  $99D9  33        .db $33
  $99DA  2D AD B3  AND $B3AD
  $99DD  DF        .db $DF
  $99DE  E0 00     CPX #$00
  $99E0  7E 7F 7F  ROR $7F7F,X
  $99E3  7F        .db $7F
  $99E4  2F        .db $2F
  $99E5  CF        .db $CF
  $99E6  1F        .db $1F
  $99E7  1F        .db $1F

L_99E8:
  $99E8  FC        .db $FC
  $99E9  F8        SED
  $99EA  F0 E1     BEQ $99CD
  $99EC  C3        .db $C3
  $99ED  07        .db $07
  $99EE  0F        .db $0F
  $99EF  00        BRK
  $99F0  78        SEI
  $99F1  80        .db $80
  $99F2  C0 E0     CPY #$E0
  $99F4  E0 E0     CPX #$E0
  $99F6  F0 F0     BEQ $99E8
  $99F8  00        BRK
  $99F9  00        BRK
  $99FA  00        BRK
  $99FB  C0 C0     CPY #$C0
  $99FD  00        BRK
  $99FE  E0 00     CPX #$00
  $9A00  00        BRK
  $9A01  00        BRK
  $9A02  11 CF     ORA ($CF),Y
  $9A04  CE 7C 00  DEC $007C
  $9A07  00        BRK
  $9A08  00        BRK
  $9A09  93        .db $93
  $9A0A  7F        .db $7F
  $9A0B  CF        .db $CF
  $9A0C  CE 7C 00  DEC $007C
  $9A0F  00        BRK
  $9A10  00        BRK
  $9A11  00        BRK
  $9A12  00        BRK
  $9A13  00        BRK
  $9A14  00        BRK
  $9A15  11 11     ORA ($11),Y
  $9A17  25 00     AND $00
  $9A19  00        BRK
  $9A1A  00        BRK
  $9A1B  00        BRK
  $9A1C  00        BRK
  $9A1D  19 19 37  ORA $3719,Y
  $9A20  00        BRK
  $9A21  10 10     BPL $9A33
  $9A23  49 91     EOR #$91
  $9A25  22        .db $22
  $9A26  00        BRK
  $9A27  1F        .db $1F
  $9A28  00        BRK
  $9A29  18        CLC
  $9A2A  1C        .db $1C
  $9A2B  6F        .db $6F
  $9A2C  FF        .db $FF
  $9A2D  F9 C0 80  SBC $80C0,Y
  $9A30  00        BRK
  $9A31  04        .db $04
  $9A32  88        DEY

L_9A33:
  $9A33  08        PHP
  $9A34  08        PHP
  $9A35  10 00     BPL $9A37

L_9A37:
  $9A37  C0 00     CPY #$00
  $9A39  06 CC     ASL $CC
  $9A3B  8C CE FE  STY $FECE
  $9A3E  3F        .db $3F
  $9A3F  0F        .db $0F
  $9A40  00        BRK
  $9A41  20 40 40  JSR $4040
  $9A44  00        BRK
  $9A45  84 84     STY $84
  $9A47  48        PHA
  $9A48  00        BRK
  $9A49  30 60     BMI $9AAB
  $9A4B  60        RTS
  $9A4C  00        BRK
  $9A4D  C6 C6     DEC $C6
  $9A4F  6C 28 48  JMP ($4828)
  $9A52  88        DEY
  $9A53  9C        .db $9C
  $9A54  BE FE FE  LDX $FEFE,Y
  $9A57  FE 3F 6E  INC $6E3F,X
  $9A5A  EC E0 DC  CPX $DCE0
  $9A5D  BC BC B0  LDY $B0BC,X
  $9A60  20 50 E8  JSR $E850
  $9A63  F4        .db $F4
  $9A64  7A        .db $7A
  $9A65  FD 7F 3E  SBC $3E7F,X
  $9A68  C7        .db $C7
  $9A69  E5 71     SBC $71
  $9A6B  38        SEC
  $9A6C  9C        .db $9C
  $9A6D  4E A6 D0  LSR $D0A6
  $9A70  44        .db $44
  $9A71  44        .db $44
  $9A72  22        .db $22
  $9A73  04        .db $04
  $9A74  04        .db $04
  $9A75  04        .db $04
  $9A76  76 FA     ROR $FA,X
  $9A78  76 FF     ROR $FF,X
  $9A7A  FB        .db $FB
  $9A7B  FE FE 7C  INC $7CFE,X
  $9A7E  0E 76 BF  ASL $BF76
  $9A81  7F        .db $7F
  $9A82  3F        .db $3F
  $9A83  2F        .db $2F
  $9A84  27        .db $27
  $9A85  11 10     ORA ($10),Y
  $9A87  10 DE     BPL $9A67
  $9A89  5E 2C 30  LSR $302C,X
  $9A8C  38        SEC
  $9A8D  1E 1E 1C  ASL $1C1E,X
  $9A90  FA        .db $FA
  $9A91  FD FD FD  SBC $FDFD,X
  $9A94  FD F9 F2  SBC $F2F9,X
  $9A97  02        .db $02
  $9A98  76 7B     ROR $7B,X
  $9A9A  7B        .db $7B
  $9A9B  0B        .db $0B
  $9A9C  33        .db $33
  $9A9D  07        .db $07
  $9A9E  0E FE 20  ASL $20FE
  $9AA1  20 41 43  JSR $4341
  $9AA4  4F        .db $4F
  $9AA5  3F        .db $3F
  $9AA6  7F        .db $7F
  $9AA7  7F        .db $7F
  $9AA8  3C        .db $3C
  $9AA9  3E 7E 7C  ROL $7C7E,X
  $9AAC  73        .db $73
  $9AAD  0F        .db $0F
  $9AAE  3F        .db $3F
  $9AAF  00        BRK
  $9AB0  4C 5A DE  JMP $DE5A
  $9AB3  CC E0 DF  CPY $DFE0
  $9AB6  E0 F9     CPX #$F9
  $9AB8  33        .db $33
  $9AB9  2D 2D 33  AND $332D
  $9ABC  1F        .db $1F
  $9ABD  20 BF 3F  JSR $3FBF
  $9AC0  7E 7F 7F  ROR $7F7F,X
  $9AC3  3F        .db $3F
  $9AC4  DF        .db $DF
  $9AC5  0F        .db $0F
  $9AC6  3F        .db $3F
  $9AC7  FF        .db $FF

L_9AC8:
  $9AC8  F9 F0 E0  SBC $E0F0,Y
  $9ACB  C3        .db $C3
  $9ACC  27        .db $27
  $9ACD  F7        .db $F7
  $9ACE  EF        .db $EF
  $9ACF  E0 02     CPX #$02
  $9AD1  04        .db $04
  $9AD2  84 84     STY $84
  $9AD4  C8        INY
  $9AD5  E8        INX
  $9AD6  F0 F0     BEQ $9AC8
  $9AD8  FE FC 7C  INC $7CFC,X
  $9ADB  7C        .db $7C
  $9ADC  B8        CLV
  $9ADD  18        CLC
  $9ADE  E0 00     CPX #$00
  $9AE0  00        BRK
  $9AE1  00        BRK
  $9AE2  04        .db $04
  $9AE3  04        .db $04
  $9AE4  22        .db $22
  $9AE5  22        .db $22
  $9AE6  12        .db $12
  $9AE7  11 00     ORA ($00),Y
  $9AE9  00        BRK
  $9AEA  06 06     ASL $06
  $9AEC  33        .db $33
  $9AED  33        .db $33
  $9AEE  1B        .db $1B
  $9AEF  19 01 09  ORA $0901,Y
  $9AF2  10 20     BPL $9B14
  $9AF4  20 40 40  JSR $4040
  $9AF7  1F        .db $1F
  $9AF8  01 0D     ORA ($0D,X)
  $9AFA  1C        .db $1C
  $9AFB  38        SEC
  $9AFC  3E FF F7  ROL $F7FF,X
  $9AFF  C0 01     CPY #$01
  $9B01  00        BRK
  $9B02  04        .db $04
  $9B03  44        .db $44
  $9B04  48        PHA
  $9B05  08        PHP
  $9B06  00        BRK
  $9B07  C0 81     CPY #$81
  $9B09  80        .db $80
  $9B0A  06 66     ASL $66
  $9B0C  7C        .db $7C
  $9B0D  FC        .db $FC
  $9B0E  FC        .db $FC
  $9B0F  3E 00 08  ROL $0800,X
  $9B12  10 10     BPL $9B24

L_9B14:
  $9B14  00        BRK
  $9B15  50 40     BVC $9B57
  $9B17  80        .db $80
  $9B18  80        .db $80
  $9B19  0C        .db $0C
  $9B1A  18        CLC

L_9B1B:
  $9B1B  18        CLC
  $9B1C  00        BRK
  $9B1D  78        SEI
  $9B1E  60        RTS
  $9B1F  C0 25     CPY #$25
  $9B21  24 14     BIT $14
  $9B23  1C        .db $1C

L_9B24:
  $9B24  3E 7E 7E  ROL $7E7E,X
  $9B27  7E 36 3E  ROR $3E36,X
  $9B2A  1F        .db $1F
  $9B2B  02        .db $02
  $9B2C  1C        .db $1C
  $9B2D  3C        .db $3C
  $9B2E  3C        .db $3C
  $9B2F  30 20     BMI $9B51
  $9B31  50 E8     BVC $9B1B
  $9B33  F4        .db $F4
  $9B34  7A        .db $7A
  $9B35  FD 7F 3E  SBC $3E7F,X
  $9B38  D7        .db $D7
  $9B39  E3        .db $E3
  $9B3A  70 38     BVS $9B74
  $9B3C  9C        .db $9C
  $9B3D  4E A6 D0  LSR $D0A6
  $9B40  90 10     BCC $9B52
  $9B42  00        BRK
  $9B43  04        .db $04
  $9B44  02        .db $02
  $9B45  01 71     ORA ($71,X)
  $9B47  F9 F8 F8  SBC $F8F8,Y
  $9B4A  F8        SED
  $9B4B  FC        .db $FC
  $9B4C  7E 7F 0F  ROR $0F7F,X
  $9B4F  77        .db $77
  $9B50  3F        .db $3F

L_9B51:
  $9B51  3F        .db $3F

L_9B52:
  $9B52  3F        .db $3F
  $9B53  4F        .db $4F
  $9B54  47        .db $47
  $9B55  41 40     EOR ($40,X)

L_9B57:
  $9B57  20 1E 1E  JSR $1E1E
  $9B5A  2C 70 78  BIT $7870
  $9B5D  7E 7E 3F  ROR $3F7E,X
  $9B60  FE FC FC  INC $FCFC,X
  $9B63  FC        .db $FC
  $9B64  FC        .db $FC
  $9B65  FC        .db $FC
  $9B66  F4        .db $F4
  $9B67  02        .db $02
  $9B68  76 78     ROR $78,X
  $9B6A  78        SEI
  $9B6B  08        PHP
  $9B6C  30 04     BMI $9B72
  $9B6E  0C        .db $0C
  $9B6F  7E 20 10  ROR $1020,X

L_9B72:
  $9B72  11 0B     ORA ($0B),Y

L_9B74:
  $9B74  0F        .db $0F
  $9B75  3F        .db $3F
  $9B76  7F        .db $7F
  $9B77  7F        .db $7F
  $9B78  3F        .db $3F
  $9B79  1F        .db $1F
  $9B7A  1E 0C 03  ASL $030C,X
  $9B7D  0F        .db $0F
  $9B7E  3F        .db $3F
  $9B7F  00        BRK
  $9B80  4C DA DE  JMP $DEDA
  $9B83  CC E0 DF  CPY $DFE0
  $9B86  C0 DF     CPY #$DF
  $9B88  B3        .db $B3
  $9B89  2D 2D 33  AND $332D
  $9B8C  1F        .db $1F
  $9B8D  20 BF 1F  JSR $1FBF
  $9B90  7E 7F 7F  ROR $7F7F,X
  $9B93  3F        .db $3F
  $9B94  DF        .db $DF
  $9B95  0F        .db $0F
  $9B96  1F        .db $1F
  $9B97  DF        .db $DF
  $9B98  F8        SED
  $9B99  F0 E0     BEQ $9B7B
  $9B9B  C3        .db $C3

L_9B9C:
  $9B9C  27        .db $27
  $9B9D  F7        .db $F7
  $9B9E  EF        .db $EF
  $9B9F  C0 01     CPY #$01
  $9BA1  01 81     ORA ($81,X)
  $9BA3  81 C2     STA ($C2,X)
  $9BA5  E4 F0     CPX $F0
  $9BA7  F0 7F     BEQ $9C28
  $9BA9  FF        .db $FF
  $9BAA  7F        .db $7F
  $9BAB  7F        .db $7F
  $9BAC  BE 1C E0  LDX $E01C,Y
  $9BAF  00        BRK
  $9BB0  00        BRK
  $9BB1  00        BRK
  $9BB2  11 0E     ORA ($0E),Y
  $9BB4  00        BRK
  $9BB5  00        BRK
  $9BB6  00        BRK
  $9BB7  00        BRK
  $9BB8  00        BRK
  $9BB9  93        .db $93
  $9BBA  3F        .db $3F
  $9BBB  0E 00 00  ASL $0000
  $9BBE  00        BRK
  $9BBF  00        BRK
  $9BC0  3F        .db $3F
  $9BC1  40        RTI
  $9BC2  80        .db $80
  $9BC3  FF        .db $FF
  $9BC4  7F        .db $7F
  $9BC5  3C        .db $3C
  $9BC6  33        .db $33
  $9BC7  5C        .db $5C
  $9BC8  00        BRK
  $9BC9  3F        .db $3F
  $9BCA  7F        .db $7F
  $9BCB  00        BRK
  $9BCC  00        BRK
  $9BCD  03        .db $03
  $9BCE  0C        .db $0C
  $9BCF  23        .db $23
  $9BD0  80        .db $80
  $9BD1  40        RTI
  $9BD2  A0 D0     LDY #$D0
  $9BD4  E8        INX
  $9BD5  F4        .db $F4
  $9BD6  FA        .db $FA
  $9BD7  FE 00 80  INC $8000,X
  $9BDA  C0 E0     CPY #$E0
  $9BDC  70 38     BVS $9C16
  $9BDE  9C        .db $9C
  $9BDF  4C 04 03  JMP $0304
  $9BE2  0D 12 3C  ORA $3C12
  $9BE5  7C        .db $7C
  $9BE6  7E F5 03  ROR $03F5,X
  $9BE9  00        BRK
  $9BEA  00        BRK
  $9BEB  0C        .db $0C
  $9BEC  08        PHP
  $9BED  08        PHP
  $9BEE  04        .db $04
  $9BEF  42        .db $42
  $9BF0  18        CLC
  $9BF1  18        CLC
  $9BF2  3C        .db $3C
  $9BF3  7E C3 81  ROR $81C3,X
  $9BF6  81 42     STA ($42,X)
  $9BF8  18        CLC
  $9BF9  18        CLC
  $9BFA  3C        .db $3C
  $9BFB  7E FF FF  ROR $FFFF,X
  $9BFE  FF        .db $FF
  $9BFF  7E 43 FF  ROR $FF43,X
  $9C02  B3        .db $B3
  $9C03  07        .db $07
  $9C04  C3        .db $C3
  $9C05  C6 0D     DEC $0D
  $9C07  F3        .db $F3
  $9C08  BD 01 01  LDA $0101,X
  $9C0B  00        BRK
  $9C0C  00        BRK
  $9C0D  01 03     ORA ($03,X)
  $9C0F  0F        .db $0F
  $9C10  E0 D0     CPX #$D0
  $9C12  F0 88     BEQ $9B9C
  $9C14  7C        .db $7C
  $9C15  FE FE FF  INC $FFFE,X
  $9C18  00        BRK
  $9C19  20 00 70  JSR $7000
  $9C1C  F0 F0     BEQ $9C0E
  $9C1E  E0 82     CPX #$82
  $9C20  FC        .db $FC
  $9C21  FC        .db $FC
  $9C22  FD FD 7C  SBC $7CFD,X
  $9C25  3E 0F 07  ROL $070F,X

L_9C28:
  $9C28  73        .db $73
  $9C29  73        .db $73
  $9C2A  7A        .db $7A
  $9C2B  7A        .db $7A
  $9C2C  33        .db $33
  $9C2D  01 06     ORA ($06,X)
  $9C2F  03        .db $03
  $9C30  07        .db $07
  $9C31  C7        .db $C7
  $9C32  A7        .db $A7
  $9C33  E7        .db $E7
  $9C34  C2        .db $C2
  $9C35  0D F3 C1  ORA $C1F3
  $9C38  FF        .db $FF
  $9C39  3F        .db $3F
  $9C3A  DF        .db $DF
  $9C3B  DE 3C F0  DEC $F03C,X
  $9C3E  01 80     ORA ($80,X)

L_9C40:
  $9C40  FF        .db $FF
  $9C41  FF        .db $FF
  $9C42  FF        .db $FF
  $9C43  FF        .db $FF
  $9C44  FE FC F0  INC $F0FC,X
  $9C47  F8        SED
  $9C48  CE 8E 1E  DEC $1E8E
  $9C4B  1E 1C 60  ASL $601C,X
  $9C4E  E0 F0     CPX #$F0
  $9C50  3F        .db $3F
  $9C51  3E 7C F8  ROL $F87C,X
  $9C54  F0 00     BEQ $9C56

L_9C56:
  $9C56  00        BRK
  $9C57  00        BRK
  $9C58  1E 1C 38  ASL $381C,X
  $9C5B  70 00     BVS $9C5D

L_9C5D:
  $9C5D  00        BRK
  $9C5E  00        BRK
  $9C5F  00        BRK
  $9C60  F8        SED
  $9C61  78        SEI
  $9C62  3C        .db $3C
  $9C63  18        CLC
  $9C64  00        BRK
  $9C65  00        BRK
  $9C66  00        BRK
  $9C67  00        BRK
  $9C68  70 30     BVS $9C9A
  $9C6A  18        CLC
  $9C6B  00        BRK
  $9C6C  00        BRK
  $9C6D  00        BRK
  $9C6E  00        BRK
  $9C6F  00        BRK
  $9C70  24 66     BIT $66
  $9C72  46 46     LSR $46
  $9C74  42        .db $42
  $9C75  42        .db $42
  $9C76  42        .db $42
  $9C77  24 3C     BIT $3C
  $9C79  7E 7E 7E  ROR $7E7E,X
  $9C7C  7E 7E 7E  ROR $7E7E,X
  $9C7F  3C        .db $3C
  $9C80  7E FF F7  ROR $F7FF,X
  $9C83  E7        .db $E7
  $9C84  66 66     ROR $66
  $9C86  24 00     BIT $00
  $9C88  7E FF FF  ROR $FFFF,X
  $9C8B  FF        .db $FF
  $9C8C  7E 7E 3C  ROR $3C7E,X
  $9C8F  18        CLC
  $9C90  01 01     ORA ($01,X)
  $9C92  00        BRK
  $9C93  01 07     ORA ($07,X)
  $9C95  0F        .db $0F
  $9C96  1F        .db $1F
  $9C97  1F        .db $1F
  $9C98  00        BRK
  $9C99  00        BRK

L_9C9A:
  $9C9A  00        BRK
  $9C9B  00        BRK
  $9C9C  00        BRK
  $9C9D  07        .db $07
  $9C9E  0E 0E FF  ASL $FF0E
  $9CA1  6C 80 30  JMP ($3080)
  $9CA4  31 83     AND ($83),Y
  $9CA6  7C        .db $7C
  $9CA7  01 00     ORA ($00,X)
  $9CA9  00        BRK
  $9CAA  00        BRK
  $9CAB  00        BRK
  $9CAC  00        BRK
  $9CAD  00        BRK
  $9CAE  83        .db $83
  $9CAF  FF        .db $FF
  $9CB0  F4        .db $F4
  $9CB1  FC        .db $FC
  $9CB2  E4 DE     CPX $DE
  $9CB4  BE 7F FF  LDX $FF7F,Y
  $9CB7  FF        .db $FF
  $9CB8  48        PHA
  $9CB9  40        RTI
  $9CBA  18        CLC
  $9CBB  20 40 9C  JSR $9C40
  $9CBE  BC BE 00  LDY $00BE,X
  $9CC1  00        BRK
  $9CC2  00        BRK
  $9CC3  00        BRK
  $9CC4  00        BRK
  $9CC5  03        .db $03
  $9CC6  07        .db $07
  $9CC7  07        .db $07
  $9CC8  00        BRK
  $9CC9  00        BRK
  $9CCA  00        BRK
  $9CCB  00        BRK
  $9CCC  00        BRK
  $9CCD  00        BRK

L_9CCE:
  $9CCE  03        .db $03
  $9CCF  00        BRK
  $9CD0  0F        .db $0F
  $9CD1  07        .db $07
  $9CD2  1F        .db $1F
  $9CD3  3F        .db $3F
  $9CD4  FF        .db $FF
  $9CD5  FC        .db $FC
  $9CD6  FC        .db $FC
  $9CD7  FC        .db $FC
  $9CD8  06 00     ASL $00
  $9CDA  00        BRK
  $9CDB  00        BRK
  $9CDC  30 F0     BMI $9CCE
  $9CDE  F8        SED
  $9CDF  00        BRK
  $9CE0  31 69     AND ($69),Y
  $9CE2  79 31 83  ADC $8331,Y
  $9CE5  7C        .db $7C
  $9CE6  01 01     ORA ($01,X)
  $9CE8  CF        .db $CF
  $9CE9  B7        .db $B7
  $9CEA  B7        .db $B7
  $9CEB  CE 7C 00  DEC $007C
  $9CEE  00        BRK
  $9CEF  00        BRK
  $9CF0  FF        .db $FF
  $9CF1  FE FC F8  INC $F8FC,X
  $9CF4  FC        .db $FC
  $9CF5  FE FF FF  INC $FFFF,X
  $9CF8  9E        .db $9E
  $9CF9  84 00     STY $00
  $9CFB  30 78     BMI $9D75

L_9CFD:
  $9CFD  70 FE     BVS $9CFD
  $9CFF  00        BRK
  $9D00  00        BRK
  $9D01  00        BRK
  $9D02  00        BRK
  $9D03  00        BRK
  $9D04  0F        .db $0F
  $9D05  10 1F     BPL $9D26
  $9D07  0F        .db $0F
  $9D08  00        BRK
  $9D09  00        BRK
  $9D0A  00        BRK
  $9D0B  00        BRK
  $9D0C  00        BRK
  $9D0D  0F        .db $0F
  $9D0E  00        BRK
  $9D0F  00        BRK
  $9D10  00        BRK
  $9D11  00        BRK
  $9D12  00        BRK
  $9D13  00        BRK
  $9D14  E0 10     CPX #$10
  $9D16  E8        INX
  $9D17  F8        SED
  $9D18  00        BRK
  $9D19  00        BRK
  $9D1A  00        BRK
  $9D1B  00        BRK
  $9D1C  00        BRK
  $9D1D  E0 30     CPX #$30
  $9D1F  30 03     BMI $9D24
  $9D21  03        .db $03
  $9D22  03        .db $03
  $9D23  07        .db $07

L_9D24:
  $9D24  1C        .db $1C
  $9D25  33        .db $33

L_9D26:
  $9D26  5C        .db $5C
  $9D27  88        DEY
  $9D28  00        BRK
  $9D29  00        BRK
  $9D2A  00        BRK
  $9D2B  00        BRK
  $9D2C  03        .db $03
  $9D2D  0C        .db $0C
  $9D2E  23        .db $23
  $9D2F  77        .db $77
  $9D30  FE FE FE  INC $FEFE,X
  $9D33  FE FE FE  INC $FEFE,X
  $9D36  FE 7C 0C  INC $0C7C,X
  $9D39  04        .db $04
  $9D3A  04        .db $04
  $9D3B  04        .db $04
  $9D3C  04        .db $04
  $9D3D  84 44     STY $44
  $9D3F  A0 00     LDY #$00
  $9D41  60        RTS
  $9D42  F0 FF     BEQ $9D43
  $9D44  FF        .db $FF
  $9D45  7F        .db $7F
  $9D46  7F        .db $7F
  $9D47  30 00     BMI $9D49

L_9D49:
  $9D49  00        BRK
  $9D4A  60        RTS
  $9D4B  70 7E     BVS $9DCB
  $9D4D  3C        .db $3C
  $9D4E  30 00     BMI $9D50

L_9D50:
  $9D50  FF        .db $FF
  $9D51  B6 60     LDX $60,Y
  $9D53  F8        SED
  $9D54  FF        .db $FF
  $9D55  FF        .db $FF
  $9D56  FF        .db $FF
  $9D57  FF        .db $FF
  $9D58  00        BRK
  $9D59  00        BRK
  $9D5A  00        BRK
  $9D5B  30 30     BMI $9D8D
  $9D5D  3C        .db $3C
  $9D5E  1E 16 F8  ASL $F816,X
  $9D61  7C        .db $7C
  $9D62  78        SEI
  $9D63  CC FC FC  CPY $FCFC
  $9D66  F8        SED
  $9D67  F8        SED
  $9D68  24 20     BIT $20
  $9D6A  00        BRK
  $9D6B  78        SEI
  $9D6C  18        CLC
  $9D6D  18        CLC
  $9D6E  10 30     BPL $9DA0
  $9D70  0E 1E 1E  ASL $1E1E
  $9D73  0E 0F 1F  ASL $1F0F
  $9D76  3F        .db $3F
  $9D77  3F        .db $3F

L_9D78:
  $9D78  01 09     ORA ($09,X)
  $9D7A  0D 05 02  ORA $0205
  $9D7D  07        .db $07
  $9D7E  1F        .db $1F
  $9D7F  00        BRK
  $9D80  FF        .db $FF
  $9D81  D3        .db $D3
  $9D82  F3        .db $F3
  $9D83  61 07     ADC ($07,X)
  $9D85  F8        SED
  $9D86  F0 F0     BEQ $9D78
  $9D88  03        .db $03
  $9D89  6F        .db $6F
  $9D8A  6F        .db $6F
  $9D8B  9E        .db $9E
  $9D8C  F8        SED

L_9D8D:
  $9D8D  00        BRK
  $9D8E  E0 00     CPX #$00
  $9D90  E0 F8     CPX #$F8
  $9D92  FC        .db $FC
  $9D93  FF        .db $FF
  $9D94  FF        .db $FF
  $9D95  3F        .db $3F
  $9D96  1F        .db $1F
  $9D97  1F        .db $1F
  $9D98  C0 80     CPY #$80
  $9D9A  00        BRK
  $9D9B  0C        .db $0C
  $9D9C  1F        .db $1F
  $9D9D  1F        .db $1F
  $9D9E  0F        .db $0F
  $9D9F  00        BRK

L_9DA0:
  $9DA0  00        BRK
  $9DA1  00        BRK
  $9DA2  00        BRK
  $9DA3  00        BRK
  $9DA4  80        .db $80
  $9DA5  E0 F0     CPX #$F0
  $9DA7  F0 00     BEQ $9DA9

L_9DA9:
  $9DA9  00        BRK
  $9DAA  00        BRK
  $9DAB  00        BRK
  $9DAC  00        BRK
  $9DAD  80        .db $80
  $9DAE  E0 00     CPX #$00
  $9DB0  3E 63 41  ROL $4163,X
  $9DB3  C0 80     CPY #$80
  $9DB5  80        .db $80
  $9DB6  00        BRK
  $9DB7  00        BRK
  $9DB8  3E 7F 7F  ROL $7F7F,X
  $9DBB  FF        .db $FF
  $9DBC  FF        .db $FF
  $9DBD  FF        .db $FF
  $9DBE  FF        .db $FF
  $9DBF  FF        .db $FF
  $9DC0  00        BRK
  $9DC1  80        .db $80
  $9DC2  C0 E0     CPY #$E0
  $9DC4  70 1C     BVS $9DE2
  $9DC6  03        .db $03
  $9DC7  00        BRK
  $9DC8  00        BRK
  $9DC9  80        .db $80

L_9DCA:
  $9DCA  C0 E0     CPY #$E0
  $9DCC  F0 FC     BEQ $9DCA
  $9DCE  FF        .db $FF
  $9DCF  FF        .db $FF
  $9DD0  00        BRK
  $9DD1  00        BRK
  $9DD2  00        BRK
  $9DD3  00        BRK
  $9DD4  1F        .db $1F
  $9DD5  61 C0     ADC ($C0,X)
  $9DD7  00        BRK
  $9DD8  00        BRK
  $9DD9  00        BRK
  $9DDA  00        BRK
  $9DDB  00        BRK
  $9DDC  1F        .db $1F
  $9DDD  7F        .db $7F
  $9DDE  FF        .db $FF
  $9DDF  FF        .db $FF
  $9DE0  00        BRK
  $9DE1  00        BRK

L_9DE2:
  $9DE2  00        BRK
  $9DE3  00        BRK
  $9DE4  80        .db $80
  $9DE5  E0 7F     CPX #$7F
  $9DE7  00        BRK
  $9DE8  00        BRK
  $9DE9  00        BRK
  $9DEA  00        BRK
  $9DEB  00        BRK
  $9DEC  80        .db $80
  $9DED  E0 FF     CPX #$FF
  $9DEF  FF        .db $FF
  $9DF0  00        BRK
  $9DF1  00        BRK
  $9DF2  00        BRK
  $9DF3  0F        .db $0F
  $9DF4  3F        .db $3F
  $9DF5  60        RTS
  $9DF6  80        .db $80
  $9DF7  00        BRK
  $9DF8  00        BRK
  $9DF9  00        BRK
  $9DFA  00        BRK
  $9DFB  0F        .db $0F
  $9DFC  3F        .db $3F
  $9DFD  7F        .db $7F
  $9DFE  FF        .db $FF
  $9DFF  FF        .db $FF
  $9E00  00        BRK
  $9E01  00        BRK
  $9E02  00        BRK
  $9E03  00        BRK
  $9E04  00        BRK
  $9E05  00        BRK
  $9E06  1C        .db $1C
  $9E07  42        .db $42
  $9E08  00        BRK
  $9E09  00        BRK
  $9E0A  00        BRK
  $9E0B  00        BRK
  $9E0C  00        BRK
  $9E0D  00        BRK
  $9E0E  00        BRK
  $9E0F  30 02     BMI $9E13
  $9E11  07        .db $07
  $9E12  0D 0F 0B  ORA $0B0F
  $9E15  39 48 88  AND $8848,Y
  $9E18  01 03     ORA ($03,X)
  $9E1A  06 04     ASL $04
  $9E1C  03        .db $03
  $9E1D  01 30     ORA ($30,X)
  $9E1F  70 0C     BVS $9E2D
  $9E21  FE FE CD  INC $CDFE,X
  $9E24  8D 0D 0D  STA $0D0D
  $9E27  0F        .db $0F
  $9E28  00        BRK
  $9E29  0C        .db $0C
  $9E2A  FC        .db $FC
  $9E2B  C6 86     DEC $86

L_9E2D:
  $9E2D  06 06     ASL $06
  $9E2F  04        .db $04
  $9E30  00        BRK
  $9E31  00        BRK
  $9E32  00        BRK
  $9E33  00        BRK
  $9E34  00        BRK
  $9E35  E0 10     CPX #$10
  $9E37  08        PHP
  $9E38  00        BRK
  $9E39  00        BRK
  $9E3A  00        BRK
  $9E3B  00        BRK
  $9E3C  00        BRK
  $9E3D  00        BRK
  $9E3E  E0 F0     CPX #$F0
  $9E40  E1 BD     SBC ($BD,X)
  $9E42  53        .db $53
  $9E43  71 40     ADC ($40),Y
  $9E45  44        .db $44
  $9E46  22        .db $22
  $9E47  11 00     ORA ($00),Y
  $9E49  40        RTI
  $9E4A  2C 0E 3F  BIT $3F0E
  $9E4D  3B        .db $3B
  $9E4E  1D 0E 60  ORA $600E,X
  $9E51  F0 F1     BEQ $9E44
  $9E53  DF        .db $DF
  $9E54  EE D0 DF  INC $DFD0
  $9E57  BF        .db $BF
  $9E58  C0 50     CPY #$50
  $9E5A  21 2E     AND ($2E,X)
  $9E5C  11 0F     ORA ($0F),Y
  $9E5E  00        BRK
  $9E5F  07        .db $07
  $9E60  3E 7F EF  ROL $EF7F,X
  $9E63  84 08     STY $08
  $9E65  39 F9 FD  AND $FDF9,Y

L_9E68:
  $9E68  37        .db $37
  $9E69  6E 94 78  ROR $7894
  $9E6C  F0 C0     BEQ $9E2E

L_9E6E:
  $9E6E  30 E0     BMI $9E50
  $9E70  60        RTS
  $9E71  F0 F8     BEQ $9E6B
  $9E73  F8        SED
  $9E74  F8        SED
  $9E75  F8        SED
  $9E76  F0 F0     BEQ $9E68
  $9E78  80        .db $80
  $9E79  00        BRK
  $9E7A  30 70     BMI $9EEC
  $9E7C  30 F0     BMI $9E6E
  $9E7E  E0 E0     CPX #$E0
  $9E80  0F        .db $0F
  $9E81  00        BRK
  $9E82  01 01     ORA ($01,X)
  $9E84  03        .db $03
  $9E85  07        .db $07

L_9E86:
  $9E86  0F        .db $0F
  $9E87  0F        .db $0F
  $9E88  00        BRK
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  00        BRK
  $9E8C  00        BRK
  $9E8D  03        .db $03
  $9E8E  07        .db $07
  $9E8F  00        BRK

L_9E90:
  $9E90  7F        .db $7F
  $9E91  BF        .db $BF
  $9E92  18        CLC
  $9E93  08        PHP
  $9E94  F0 F0     BEQ $9E86
  $9E96  F8        SED
  $9E97  F8        SED
  $9E98  03        .db $03
  $9E99  40        RTI
  $9E9A  E0 F0     CPX #$F0
  $9E9C  60        RTS
  $9E9D  E0 F0     CPX #$F0
  $9E9F  00        BRK
  $9EA0  FE FD 18  INC $18FD,X
  $9EA3  08        PHP
  $9EA4  07        .db $07
  $9EA5  07        .db $07
  $9EA6  07        .db $07
  $9EA7  07        .db $07
  $9EA8  C0 02     CPY #$02
  $9EAA  07        .db $07
  $9EAB  07        .db $07
  $9EAC  03        .db $03
  $9EAD  01 03     ORA ($03,X)
  $9EAF  00        BRK
  $9EB0  E0 00     CPX #$00
  $9EB2  80        .db $80
  $9EB3  40        RTI
  $9EB4  E0 F8     CPX #$F8
  $9EB6  FC        .db $FC
  $9EB7  FC        .db $FC
  $9EB8  00        BRK
  $9EB9  00        BRK
  $9EBA  00        BRK
  $9EBB  80        .db $80
  $9EBC  C0 E0     CPY #$E0
  $9EBE  F8        SED
  $9EBF  00        BRK
  $9EC0  00        BRK
  $9EC1  00        BRK
  $9EC2  00        BRK
  $9EC3  C0 BC     CPY #$BC
  $9EC5  52        .db $52
  $9EC6  71 41     ADC ($41),Y
  $9EC8  00        BRK
  $9EC9  00        BRK
  $9ECA  00        BRK
  $9ECB  00        BRK
  $9ECC  40        RTI
  $9ECD  2C 0E 3E  BIT $3E0E
  $9ED0  22        .db $22
  $9ED1  11 08     ORA ($08),Y
  $9ED3  07        .db $07
  $9ED4  01 00     ORA ($00,X)
  $9ED6  00        BRK
  $9ED7  00        BRK
  $9ED8  1D 0E 07  ORA $070E,X
  $9EDB  00        BRK
  $9EDC  00        BRK
  $9EDD  00        BRK
  $9EDE  00        BRK
  $9EDF  00        BRK
  $9EE0  42        .db $42
  $9EE1  47        .db $47
  $9EE2  ED FF EB  SBC $EBFF
  $9EE5  C9 48     CMP #$48
  $9EE7  28        PLP
  $9EE8  81 83     STA ($83,X)
  $9EEA  06 04     ASL $04

L_9EEC:
  $9EEC  13        .db $13
  $9EED  31 30     AND ($30),Y
  $9EEF  10 0C     BPL $9EFD
  $9EF1  FE FE CD  INC $CDFE,X
  $9EF4  8D 0D 0D  STA $0D0D
  $9EF7  0E 00 0C  ASL $0C00
  $9EFA  FC        .db $FC
  $9EFB  C6 86     DEC $86

L_9EFD:
  $9EFD  06 06     ASL $06
  $9EFF  05 70     ORA $70
  $9F01  F8        SED
  $9F02  FC        .db $FC
  $9F03  FC        .db $FC
  $9F04  7E 7E 7E  ROR $7E7E,X
  $9F07  7E 00 70  ROR $7000,X
  $9F0A  78        SEI
  $9F0B  78        SEI
  $9F0C  98        TYA
  $9F0D  B8        CLV
  $9F0E  90 80     BCC $9E90
  $9F10  38        SEC
  $9F11  3C        .db $3C
  $9F12  1C        .db $1C
  $9F13  17        .db $17
  $9F14  0B        .db $0B
  $9F15  04        .db $04
  $9F16  07        .db $07
  $9F17  0F        .db $0F
  $9F18  10 14     BPL $9F2E
  $9F1A  08        PHP
  $9F1B  0B        .db $0B
  $9F1C  04        .db $04
  $9F1D  03        .db $03
  $9F1E  00        BRK
  $9F1F  01 0F     ORA ($0F,X)
  $9F21  1F        .db $1F
  $9F22  7B        .db $7B
  $9F23  E1 82     SBC ($82,X)
  $9F25  0E FF FF  ASL $FFFF
  $9F28  0D 1B 65  ORA $651B
  $9F2B  9E        .db $9E
  $9F2C  7C        .db $7C
  $9F2D  F0 0C     BEQ $9F3B
  $9F2F  F8        SED
  $9F30  FC        .db $FC
  $9F31  F8        SED
  $9F32  E0 00     CPX #$00
  $9F34  00        BRK
  $9F35  00        BRK
  $9F36  00        BRK
  $9F37  80        .db $80
  $9F38  00        BRK
  $9F39  00        BRK
  $9F3A  00        BRK

L_9F3B:
  $9F3B  00        BRK
  $9F3C  00        BRK
  $9F3D  00        BRK
  $9F3E  00        BRK
  $9F3F  00        BRK
  $9F40  00        BRK
  $9F41  00        BRK
  $9F42  00        BRK
  $9F43  00        BRK
  $9F44  01 07     ORA ($07,X)
  $9F46  0F        .db $0F
  $9F47  0F        .db $0F
  $9F48  00        BRK
  $9F49  00        BRK
  $9F4A  00        BRK
  $9F4B  00        BRK
  $9F4C  00        BRK
  $9F4D  01 07     ORA ($07,X)

L_9F4F:
  $9F4F  00        BRK
  $9F50  1F        .db $1F
  $9F51  2F        .db $2F
  $9F52  46 84     LSR $84
  $9F54  FC        .db $FC
  $9F55  F8        SED
  $9F56  F8        SED
  $9F57  F8        SED
  $9F58  00        BRK
  $9F59  10 38     BPL $9F93
  $9F5B  78        SEI
  $9F5C  F8        SED
  $9F5D  F0 F0     BEQ $9F4F
  $9F5F  00        BRK
  $9F60  FF        .db $FF
  $9F61  FF        .db $FF
  $9F62  02        .db $02
  $9F63  01 01     ORA ($01,X)
  $9F65  01 03     ORA ($03,X)
  $9F67  03        .db $03
  $9F68  F0 00     BEQ $9F6A

L_9F6A:
  $9F6A  01 00     ORA ($00,X)
  $9F6C  00        BRK
  $9F6D  00        BRK
  $9F6E  01 00     ORA ($00,X)
  $9F70  C0 20     CPY #$20

L_9F72:
  $9F72  10 10     BPL $9F84
  $9F74  F0 FC     BEQ $9F72
  $9F76  FE FE 00  INC $00FE,X
  $9F79  C0 E0     CPY #$E0

L_9F7B:
  $9F7B  E0 E0     CPX #$E0
  $9F7D  F0 FC     BEQ $9F7B
  $9F7F  00        BRK
  $9F80  00        BRK
  $9F81  00        BRK
  $9F82  00        BRK
  $9F83  07        .db $07

L_9F84:
  $9F84  05 0D     ORA $0D
  $9F86  17        .db $17
  $9F87  18        CLC
  $9F88  00        BRK
  $9F89  00        BRK
  $9F8A  00        BRK
  $9F8B  00        BRK
  $9F8C  02        .db $02
  $9F8D  02        .db $02
  $9F8E  08        PHP
  $9F8F  07        .db $07
  $9F90  00        BRK
  $9F91  01 02     ORA ($02,X)

L_9F93:
  $9F93  07        .db $07
  $9F94  0D BF 4B  ORA $4BBF
  $9F97  C9 00     CMP #$00
  $9F99  00        BRK
  $9F9A  01 03     ORA ($03,X)
  $9F9C  06 04     ASL $04
  $9F9E  B3        .db $B3
  $9F9F  31 70     AND ($70),Y
  $9FA1  08        PHP
  $9FA2  0C        .db $0C
  $9FA3  FE FE CD  INC $CDFE,X
  $9FA6  8D 0D 00  STA $000D
  $9FA9  C0 00     CPY #$00
  $9FAB  0C        .db $0C
  $9FAC  FC        .db $FC
  $9FAD  C6 86     DEC $86
  $9FAF  06 00     ASL $00
  $9FB1  00        BRK
  $9FB2  00        BRK
  $9FB3  00        BRK
  $9FB4  00        BRK
  $9FB5  E0 38     CPX #$38
  $9FB7  3C        .db $3C
  $9FB8  00        BRK
  $9FB9  00        BRK
  $9FBA  00        BRK
  $9FBB  00        BRK
  $9FBC  00        BRK
  $9FBD  00        BRK
  $9FBE  C0 C0     CPY #$C0
  $9FC0  12        .db $12
  $9FC1  1A        .db $1A
  $9FC2  12        .db $12
  $9FC3  08        PHP
  $9FC4  07        .db $07
  $9FC5  03        .db $03
  $9FC6  00        BRK
  $9FC7  00        BRK
  $9FC8  0D 05 0D  ORA $0D05
  $9FCB  07        .db $07
  $9FCC  00        BRK
  $9FCD  00        BRK
  $9FCE  00        BRK
  $9FCF  00        BRK
  $9FD0  68        PLA
  $9FD1  E8        INX
  $9FD2  78        SEI
  $9FD3  FC        .db $FC
  $9FD4  FC        .db $FC
  $9FD5  97        .db $97
  $9FD6  0B        .db $0B
  $9FD7  0C        .db $0C
  $9FD8  90 10     BCC $9FEA
  $9FDA  90 14     BCC $9FF0
  $9FDC  08        PHP
  $9FDD  0B        .db $0B
  $9FDE  04        .db $04
  $9FDF  03        .db $03
  $9FE0  0D 0F 0F  ORA $0F0F
  $9FE3  1F        .db $1F
  $9FE4  7B        .db $7B

L_9FE5:
  $9FE5  E2        .db $E2
  $9FE6  87        .db $87
  $9FE7  1F        .db $1F
  $9FE8  06 05     ASL $05

L_9FEA:
  $9FEA  0D 1A 66  ORA $661A
  $9FED  9C        .db $9C
  $9FEE  7A        .db $7A
  $9FEF  E4 7C     CPX $7C
  $9FF1  FE 9E 1F  INC $1F9E,X

L_9FF4:
  $9FF4  1F        .db $1F
  $9FF5  3F        .db $3F
  $9FF6  3F        .db $3F
  $9FF7  BE 80 00  LDX $0080,Y
  $9FFA  04        .db $04
  $9FFB  0E 06 1E  ASL $1E06
  $9FFE  1E 1C 5B  ASL $5B1C,X
  $A001  52        .db $52
  $A002  52        .db $52
  $A003  52        .db $52
  $A004  52        .db $52
  $A005  52        .db $52
  $A006  52        .db $52
  $A007  52        .db $52
  $A008  00        BRK
  $A009  09 09     ORA #$09
  $A00B  09 09     ORA #$09
  $A00D  09 09     ORA #$09
  $A00F  09 52     ORA #$52
  $A011  52        .db $52
  $A012  52        .db $52
  $A013  52        .db $52
  $A014  52        .db $52
  $A015  52        .db $52
  $A016  52        .db $52
  $A017  00        BRK
  $A018  09 09     ORA #$09
  $A01A  09 09     ORA #$09
  $A01C  09 09     ORA #$09
  $A01E  09 00     ORA #$00
  $A020  1C        .db $1C
  $A021  59 59 18  EOR $1859,Y
  $A024  18        CLC
  $A025  18        CLC
  $A026  79 79 00  ADC $0079,Y
  $A029  24 24     BIT $24
  $A02B  65 04     ADC $04
  $A02D  65 65     ADC $65
  $A02F  65 79     ADC $79
  $A031  79 79 18  ADC $1879,Y
  $A034  79 79 18  ADC $1879,Y
  $A037  00        BRK
  $A038  65 65     ADC $65
  $A03A  65 04     ADC $04
  $A03C  65 65     ADC $65
  $A03E  04        .db $04
  $A03F  00        BRK
  $A040  70 66     BVS $A0A8
  $A042  66 60     ROR $60
  $A044  60        RTS
  $A045  60        RTS
  $A046  E7        .db $E7
  $A047  E7        .db $E7

L_A048:
  $A048  00        BRK
  $A049  91 91     STA ($91),Y
  $A04B  97        .db $97
  $A04C  10 97     BPL $9FE5
  $A04E  97        .db $97
  $A04F  97        .db $97
  $A050  E7        .db $E7
  $A051  E7        .db $E7
  $A052  E7        .db $E7
  $A053  60        RTS
  $A054  E7        .db $E7
  $A055  E7        .db $E7
  $A056  60        RTS
  $A057  00        BRK
  $A058  97        .db $97
  $A059  97        .db $97
  $A05A  97        .db $97
  $A05B  10 97     BPL $9FF4
  $A05D  97        .db $97
  $A05E  10 00     BPL $A060

L_A060:
  $A060  F0 E6     BEQ $A048
  $A062  E6 E0     INC $E0
  $A064  E0 E0     CPX #$E0
  $A066  E7        .db $E7
  $A067  E7        .db $E7

L_A068:
  $A068  00        BRK
  $A069  11 11     ORA ($11),Y
  $A06B  17        .db $17
  $A06C  10 17     BPL $A085
  $A06E  17        .db $17
  $A06F  17        .db $17
  $A070  E7        .db $E7
  $A071  E7        .db $E7
  $A072  E7        .db $E7
  $A073  E0 E7     CPX #$E7
  $A075  E7        .db $E7
  $A076  E0 00     CPX #$00
  $A078  17        .db $17
  $A079  17        .db $17
  $A07A  17        .db $17
  $A07B  10 17     BPL $A094
  $A07D  17        .db $17
  $A07E  10 00     BPL $A080

L_A080:
  $A080  F0 C6     BEQ $A048
  $A082  C6 C0     DEC $C0
  $A084  C0 C0     CPY #$C0
  $A086  C7        .db $C7
  $A087  C7        .db $C7
  $A088  00        BRK
  $A089  31 31     AND ($31),Y
  $A08B  37        .db $37
  $A08C  30 37     BMI $A0C5
  $A08E  37        .db $37
  $A08F  37        .db $37
  $A090  C7        .db $C7
  $A091  C7        .db $C7
  $A092  C7        .db $C7
  $A093  C0 C7     CPY #$C7
  $A095  C7        .db $C7
  $A096  C0 00     CPY #$00
  $A098  37        .db $37
  $A099  37        .db $37
  $A09A  37        .db $37
  $A09B  30 37     BMI $A0D4
  $A09D  37        .db $37
  $A09E  30 00     BMI $A0A0

L_A0A0:
  $A0A0  F0 C6     BEQ $A068
  $A0A2  C6 C0     DEC $C0
  $A0A4  C0 C0     CPY #$C0
  $A0A6  C7        .db $C7
  $A0A7  C7        .db $C7

L_A0A8:
  $A0A8  00        BRK
  $A0A9  31 31     AND ($31),Y
  $A0AB  37        .db $37
  $A0AC  30 37     BMI $A0E5
  $A0AE  37        .db $37
  $A0AF  37        .db $37
  $A0B0  C7        .db $C7
  $A0B1  C7        .db $C7
  $A0B2  C7        .db $C7
  $A0B3  C0 C7     CPY #$C7
  $A0B5  C7        .db $C7
  $A0B6  C0 00     CPY #$00
  $A0B8  37        .db $37
  $A0B9  37        .db $37
  $A0BA  37        .db $37
  $A0BB  30 37     BMI $A0F4
  $A0BD  37        .db $37
  $A0BE  30 00     BMI $A0C0

L_A0C0:
  $A0C0  F0 86     BEQ $A048
  $A0C2  86 80     STX $80
  $A0C4  80        .db $80

L_A0C5:
  $A0C5  80        .db $80
  $A0C6  87        .db $87
  $A0C7  87        .db $87
  $A0C8  00        BRK
  $A0C9  71 71     ADC ($71),Y
  $A0CB  77        .db $77
  $A0CC  70 77     BVS $A145
  $A0CE  77        .db $77
  $A0CF  77        .db $77
  $A0D0  87        .db $87
  $A0D1  87        .db $87
  $A0D2  87        .db $87
  $A0D3  80        .db $80

L_A0D4:
  $A0D4  87        .db $87
  $A0D5  87        .db $87
  $A0D6  80        .db $80
  $A0D7  00        BRK
  $A0D8  77        .db $77
  $A0D9  77        .db $77
  $A0DA  77        .db $77
  $A0DB  70 77     BVS $A154
  $A0DD  77        .db $77
  $A0DE  70 00     BVS $A0E0

L_A0E0:
  $A0E0  E1 8D     SBC ($8D,X)
  $A0E2  8D 81 81  STA $8181

L_A0E5:
  $A0E5  81 8F     STA ($8F,X)
  $A0E7  8F        .db $8F
  $A0E8  00        BRK
  $A0E9  62        .db $62
  $A0EA  62        .db $62
  $A0EB  6E 60 6E  ROR $6E60
  $A0EE  6E 6E 8F  ROR $8F6E
  $A0F1  8F        .db $8F
  $A0F2  8F        .db $8F
  $A0F3  81 8F     STA ($8F,X)
  $A0F5  8F        .db $8F
  $A0F6  81 00     STA ($00,X)
  $A0F8  6E 6E 6E  ROR $6E6E
  $A0FB  60        RTS
  $A0FC  6E 6E 60  ROR $606E
  $A0FF  00        BRK
  $A100  C6 14     DEC $14
  $A102  14        .db $14
  $A103  04        .db $04
  $A104  04        .db $04
  $A105  04        .db $04
  $A106  1C        .db $1C
  $A107  1C        .db $1C
  $A108  00        BRK
  $A109  CA        DEX
  $A10A  CA        DEX
  $A10B  DA        .db $DA
  $A10C  C2        .db $C2
  $A10D  DA        .db $DA
  $A10E  DA        .db $DA
  $A10F  DA        .db $DA
  $A110  1C        .db $1C
  $A111  1C        .db $1C
  $A112  1C        .db $1C
  $A113  04        .db $04
  $A114  1C        .db $1C
  $A115  1C        .db $1C
  $A116  04        .db $04
  $A117  00        BRK
  $A118  DA        .db $DA
  $A119  DA        .db $DA
  $A11A  DA        .db $DA
  $A11B  C2        .db $C2
  $A11C  DA        .db $DA
  $A11D  DA        .db $DA
  $A11E  C2        .db $C2
  $A11F  00        BRK
  $A120  00        BRK
  $A121  00        BRK
  $A122  00        BRK
  $A123  00        BRK
  $A124  00        BRK
  $A125  00        BRK
  $A126  80        .db $80
  $A127  80        .db $80
  $A128  6A        ROR
  $A129  EA        NOP
  $A12A  EA        NOP
  $A12B  EA        NOP
  $A12C  6A        ROR
  $A12D  EA        NOP
  $A12E  EA        NOP
  $A12F  EA        NOP
  $A130  80        .db $80
  $A131  80        .db $80
  $A132  80        .db $80
  $A133  00        BRK
  $A134  80        .db $80
  $A135  80        .db $80
  $A136  00        BRK
  $A137  00        BRK
  $A138  EA        NOP
  $A139  EA        NOP
  $A13A  EA        NOP
  $A13B  6A        ROR
  $A13C  EA        NOP
  $A13D  EA        NOP
  $A13E  6A        ROR
  $A13F  00        BRK
  $A140  FF        .db $FF
  $A141  FF        .db $FF
  $A142  00        BRK
  $A143  FF        .db $FF
  $A144  FF        .db $FF

L_A145:
  $A145  FF        .db $FF
  $A146  FF        .db $FF
  $A147  FF        .db $FF
  $A148  00        BRK
  $A149  00        BRK
  $A14A  00        BRK
  $A14B  02        .db $02
  $A14C  06 0E     ASL $0E
  $A14E  1E 3E FF  ASL $FF3E,X
  $A151  FF        .db $FF
  $A152  FF        .db $FF
  $A153  FF        .db $FF

L_A154:
  $A154  00        BRK
  $A155  FF        .db $FF
  $A156  FF        .db $FF
  $A157  00        BRK
  $A158  1E 0E 06  ASL $060E,X
  $A15B  02        .db $02
  $A15C  00        BRK
  $A15D  00        BRK
  $A15E  00        BRK
  $A15F  00        BRK
  $A160  FF        .db $FF
  $A161  FF        .db $FF
  $A162  00        BRK
  $A163  BE 9E 8E  LDX $8E9E,Y
  $A166  86 82     STX $82
  $A168  00        BRK
  $A169  00        BRK
  $A16A  00        BRK
  $A16B  40        RTI
  $A16C  60        RTS
  $A16D  70 78     BVS $A1E7
  $A16F  7C        .db $7C
  $A170  86 8E     STX $8E
  $A172  9E        .db $9E
  $A173  BE 00 FF  LDX $FF00,Y
  $A176  FF        .db $FF
  $A177  00        BRK
  $A178  78        SEI
  $A179  70 60     BVS $A1DB
  $A17B  40        RTI
  $A17C  00        BRK
  $A17D  00        BRK
  $A17E  00        BRK
  $A17F  00        BRK
  $A180  FF        .db $FF
  $A181  FF        .db $FF
  $A182  00        BRK
  $A183  0E 0E 0E  ASL $0E0E
  $A186  0E 0E 00  ASL $000E
  $A189  00        BRK
  $A18A  00        BRK
  $A18B  EE EE EE  INC $EEEE
  $A18E  EE EE 0E  INC $0EEE
  $A191  0E 0E 0E  ASL $0E0E
  $A194  00        BRK
  $A195  FF        .db $FF
  $A196  FF        .db $FF
  $A197  00        BRK
  $A198  EE EE EE  INC $EEEE
  $A19B  EE 00 00  INC $0000
  $A19E  00        BRK
  $A19F  00        BRK
  $A1A0  FF        .db $FF
  $A1A1  FF        .db $FF
  $A1A2  00        BRK
  $A1A3  0E 0E 0E  ASL $0E0E
  $A1A6  0E 0E 00  ASL $000E
  $A1A9  00        BRK
  $A1AA  00        BRK
  $A1AB  EE EE EE  INC $EEEE
  $A1AE  EE EE 0E  INC $0EEE
  $A1B1  0E 0E 0E  ASL $0E0E
  $A1B4  00        BRK
  $A1B5  FF        .db $FF
  $A1B6  FF        .db $FF
  $A1B7  00        BRK
  $A1B8  EE EE EE  INC $EEEE
  $A1BB  EE 00 00  INC $0000
  $A1BE  00        BRK
  $A1BF  00        BRK
  $A1C0  FF        .db $FF
  $A1C1  FF        .db $FF
  $A1C2  00        BRK
  $A1C3  FD F9 F1  SBC $F1F9,X
  $A1C6  E1 C1     SBC ($C1,X)
  $A1C8  00        BRK
  $A1C9  00        BRK
  $A1CA  00        BRK
  $A1CB  02        .db $02
  $A1CC  06 0E     ASL $0E
  $A1CE  1E 3E E1  ASL $E13E,X
  $A1D1  F1 F9     SBC ($F9),Y
  $A1D3  FD 00 FF  SBC $FF00,X
  $A1D6  FF        .db $FF
  $A1D7  00        BRK
  $A1D8  1E 0E 06  ASL $060E,X

L_A1DB:
  $A1DB  02        .db $02
  $A1DC  00        BRK
  $A1DD  00        BRK
  $A1DE  00        BRK
  $A1DF  00        BRK
  $A1E0  FF        .db $FF
  $A1E1  FF        .db $FF
  $A1E2  00        BRK
  $A1E3  FE FE FE  INC $FEFE,X
  $A1E6  FE FE 00  INC $00FE,X
  $A1E9  00        BRK
  $A1EA  00        BRK
  $A1EB  40        RTI
  $A1EC  60        RTS
  $A1ED  70 78     BVS $A267
  $A1EF  7C        .db $7C
  $A1F0  FE FE FE  INC $FEFE,X
  $A1F3  FE 00 FF  INC $FF00,X
  $A1F6  FF        .db $FF
  $A1F7  00        BRK
  $A1F8  78        SEI
  $A1F9  70 60     BVS $A25B
  $A1FB  40        RTI
  $A1FC  00        BRK
  $A1FD  00        BRK
  $A1FE  00        BRK
  $A1FF  00        BRK
  $A200  00        BRK
  $A201  FF        .db $FF
  $A202  00        BRK
  $A203  FF        .db $FF
  $A204  80        .db $80
  $A205  00        BRK
  $A206  FF        .db $FF
  $A207  80        .db $80
  $A208  00        BRK
  $A209  00        BRK
  $A20A  00        BRK
  $A20B  00        BRK
  $A20C  7F        .db $7F
  $A20D  00        BRK
  $A20E  00        BRK
  $A20F  7F        .db $7F
  $A210  00        BRK
  $A211  63        .db $63
  $A212  03        .db $03
  $A213  FF        .db $FF
  $A214  FF        .db $FF
  $A215  80        .db $80
  $A216  00        BRK
  $A217  63        .db $63
  $A218  00        BRK
  $A219  17        .db $17
  $A21A  77        .db $77
  $A21B  00        BRK
  $A21C  00        BRK
  $A21D  7F        .db $7F
  $A21E  00        BRK
  $A21F  17        .db $17
  $A220  00        BRK
  $A221  FE 00 FE  INC $FE00,X
  $A224  00        BRK
  $A225  00        BRK
  $A226  FE 00 00  INC $0000,X
  $A229  00        BRK
  $A22A  00        BRK
  $A22B  00        BRK
  $A22C  FE 00 00  INC $0000,X
  $A22F  FE 00 EC  INC $EC00,X
  $A232  EC FE FE  CPX $FEFE
  $A235  00        BRK
  $A236  00        BRK
  $A237  EC 00 EC  CPX $EC00
  $A23A  EC 00 00  CPX $0000
  $A23D  FE 00 EC  INC $EC00,X
  $A240  2D 2F 3B  AND $3B2F
  $A243  6B        .db $6B
  $A244  AA        TAX
  $A245  A9 A5     LDA #$A5
  $A247  8D 2C 28  STA $282C
  $A24A  24 14     BIT $14
  $A24C  D4        .db $D4
  $A24D  D1 C5     CMP ($C5),Y
  $A24F  8D 2D 2F  STA $2F2D
  $A252  3B        .db $3B
  $A253  6B        .db $6B
  $A254  AA        TAX
  $A255  A9 A5     LDA #$A5
  $A257  8D 2C 28  STA $282C
  $A25A  24 14     BIT $14
  $A25C  D4        .db $D4
  $A25D  D1 C5     CMP ($C5),Y
  $A25F  8D DA DA  STA $DADA
  $A262  D8        CLD
  $A263  C7        .db $C7
  $A264  3F        .db $3F
  $A265  FF        .db $FF
  $A266  FF        .db $FF

L_A267:
  $A267  FA        .db $FA
  $A268  25 25     AND $25
  $A26A  20 07 3F  JSR $3F07
  $A26D  FF        .db $FF
  $A26E  F8        SED
  $A26F  C5 DA     CMP $DA
  $A271  DA        .db $DA
  $A272  D8        CLD
  $A273  C7        .db $C7
  $A274  3F        .db $3F
  $A275  FF        .db $FF
  $A276  FF        .db $FF
  $A277  F8        SED
  $A278  25 25     AND $25
  $A27A  20 07 3F  JSR $3F07
  $A27D  FF        .db $FF
  $A27E  F8        SED
  $A27F  C7        .db $C7
  $A280  82        .db $82
  $A281  1A        .db $1A
  $A282  FA        .db $FA
  $A283  FB        .db $FB
  $A284  FD E1 81  SBC $81E1,X
  $A287  80        .db $80
  $A288  62        .db $62
  $A289  1A        .db $1A
  $A28A  FA        .db $FA
  $A28B  F8        SED
  $A28C  E3        .db $E3
  $A28D  1F        .db $1F
  $A28E  7F        .db $7F
  $A28F  7C        .db $7C
  $A290  82        .db $82
  $A291  1A        .db $1A
  $A292  FA        .db $FA
  $A293  FB        .db $FB
  $A294  FD E1 01  SBC $01E1,X
  $A297  00        BRK
  $A298  62        .db $62
  $A299  1A        .db $1A
  $A29A  FA        .db $FA
  $A29B  F8        SED
  $A29C  E3        .db $E3
  $A29D  1F        .db $1F
  $A29E  FF        .db $FF
  $A29F  FC        .db $FC
  $A2A0  C7        .db $C7
  $A2A1  DB        .db $DB
  $A2A2  EB        .db $EB
  $A2A3  AA        TAX
  $A2A4  28        PLP
  $A2A5  24 04     BIT $04
  $A2A7  45 C3     EOR $C3
  $A2A9  C7        .db $C7
  $A2AA  9F        .db $9F
  $A2AB  7E F8 E4  ROR $E4F8,X
  $A2AE  84 45     STY $45
  $A2B0  C7        .db $C7
  $A2B1  DB        .db $DB
  $A2B2  EB        .db $EB
  $A2B3  AA        TAX
  $A2B4  28        PLP
  $A2B5  24 04     BIT $04
  $A2B7  45 C3     EOR $C3
  $A2B9  C7        .db $C7
  $A2BA  9F        .db $9F
  $A2BB  7E F8 E4  ROR $E4F8,X
  $A2BE  84 45     STY $45
  $A2C0  BF        .db $BF
  $A2C1  BF        .db $BF
  $A2C2  BF        .db $BF
  $A2C3  BF        .db $BF
  $A2C4  BF        .db $BF
  $A2C5  BF        .db $BF
  $A2C6  BE BE 00  LDX $00BE,Y
  $A2C9  00        BRK
  $A2CA  00        BRK
  $A2CB  00        BRK
  $A2CC  00        BRK
  $A2CD  00        BRK
  $A2CE  00        BRK
  $A2CF  00        BRK
  $A2D0  3E 3E FE  ROL $FE3E,X
  $A2D3  00        BRK
  $A2D4  FF        .db $FF
  $A2D5  80        .db $80
  $A2D6  80        .db $80
  $A2D7  BF        .db $BF
  $A2D8  00        BRK
  $A2D9  00        BRK
  $A2DA  00        BRK
  $A2DB  00        BRK
  $A2DC  00        BRK
  $A2DD  00        BRK
  $A2DE  00        BRK
  $A2DF  00        BRK
  $A2E0  FE FE FE  INC $FEFE,X
  $A2E3  FE FE FE  INC $FEFE,X
  $A2E6  00        BRK
  $A2E7  FF        .db $FF
  $A2E8  00        BRK
  $A2E9  00        BRK
  $A2EA  00        BRK
  $A2EB  00        BRK
  $A2EC  00        BRK

L_A2ED:
  $A2ED  00        BRK
  $A2EE  00        BRK
  $A2EF  00        BRK
  $A2F0  80        .db $80
  $A2F1  80        .db $80
  $A2F2  BF        .db $BF
  $A2F3  BE BE 3E  LDX $3EBE,Y
  $A2F6  3E FE 00  ROL $00FE,X
  $A2F9  00        BRK
  $A2FA  00        BRK
  $A2FB  00        BRK
  $A2FC  00        BRK
  $A2FD  00        BRK
  $A2FE  00        BRK
  $A2FF  00        BRK
  $A300  00        BRK
  $A301  00        BRK
  $A302  00        BRK
  $A303  00        BRK
  $A304  00        BRK
  $A305  00        BRK
  $A306  80        .db $80
  $A307  80        .db $80
  $A308  00        BRK
  $A309  00        BRK
  $A30A  00        BRK
  $A30B  00        BRK
  $A30C  00        BRK
  $A30D  00        BRK
  $A30E  00        BRK
  $A30F  00        BRK
  $A310  3E 3E FE  ROL $FE3E,X
  $A313  00        BRK
  $A314  FF        .db $FF
  $A315  80        .db $80
  $A316  80        .db $80
  $A317  BF        .db $BF
  $A318  00        BRK
  $A319  00        BRK
  $A31A  00        BRK
  $A31B  00        BRK
  $A31C  00        BRK
  $A31D  00        BRK
  $A31E  00        BRK
  $A31F  00        BRK
  $A320  00        BRK
  $A321  00        BRK
  $A322  00        BRK
  $A323  00        BRK
  $A324  00        BRK
  $A325  00        BRK
  $A326  00        BRK
  $A327  FF        .db $FF
  $A328  00        BRK
  $A329  00        BRK
  $A32A  00        BRK
  $A32B  00        BRK
  $A32C  00        BRK
  $A32D  00        BRK
  $A32E  00        BRK
  $A32F  00        BRK
  $A330  80        .db $80
  $A331  80        .db $80
  $A332  BF        .db $BF
  $A333  BE BE 3E  LDX $3EBE,Y
  $A336  3E FE 00  ROL $00FE,X
  $A339  00        BRK
  $A33A  00        BRK
  $A33B  00        BRK
  $A33C  00        BRK
  $A33D  00        BRK
  $A33E  00        BRK
  $A33F  00        BRK
  $A340  08        PHP
  $A341  1C        .db $1C
  $A342  0F        .db $0F
  $A343  0F        .db $0F
  $A344  9C        .db $9C
  $A345  FB        .db $FB
  $A346  77        .db $77
  $A347  36 0B     ROL $0B,X
  $A349  1F        .db $1F
  $A34A  28        PLP
  $A34B  70 A0     BVS $A2ED
  $A34D  C0 40     CPY #$40
  $A34F  C0 36     CPY #$36
  $A351  77        .db $77
  $A352  FB        .db $FB
  $A353  1C        .db $1C
  $A354  0F        .db $0F
  $A355  0F        .db $0F
  $A356  1C        .db $1C
  $A357  08        PHP
  $A358  C0 40     CPY #$40
  $A35A  C0 20     CPY #$20
  $A35C  70 28     BVS $A386
  $A35E  1F        .db $1F
  $A35F  0B        .db $0B
  $A360  C0 C0     CPY #$C0

L_A362:
  $A362  E4 FE     CPX $FE
  $A364  1C        .db $1C
  $A365  CC E4 67  CPY $67E4
  $A368  D0 F8     BNE $A362
  $A36A  14        .db $14
  $A36B  0E 04 03  ASL $0304
  $A36E  02        .db $02
  $A36F  03        .db $03
  $A370  67        .db $67
  $A371  E4 CC     CPX $CC
  $A373  1C        .db $1C
  $A374  FE E4 C0  INC $C0E4,X
  $A377  C0 03     CPY #$03
  $A379  02        .db $02
  $A37A  03        .db $03
  $A37B  04        .db $04
  $A37C  0E 14 F8  ASL $F814
  $A37F  D0 00     BNE $A381

L_A381:
  $A381  00        BRK
  $A382  01 01     ORA ($01,X)
  $A384  00        BRK
  $A385  00        BRK

L_A386:
  $A386  01 02     ORA ($02,X)
  $A388  00        BRK
  $A389  00        BRK
  $A38A  01 01     ORA ($01,X)
  $A38C  0C        .db $0C
  $A38D  1E 1E 0D  ASL $0D1E,X
  $A390  65 7F     ADC $7F
  $A392  FF        .db $FF
  $A393  FF        .db $FF
  $A394  3E 0E 16  ROL $160E,X
  $A397  16 62     ASL $62,X
  $A399  74        .db $74
  $A39A  F4        .db $F4
  $A39B  E8        INX
  $A39C  28        PLP
  $A39D  00        BRK
  $A39E  E8        INX
  $A39F  E8        INX
  $A3A0  00        BRK
  $A3A1  C0 E0     CPY #$E0
  $A3A3  E3        .db $E3
  $A3A4  FF        .db $FF
  $A3A5  7F        .db $7F

L_A3A6:
  $A3A6  F8        SED
  $A3A7  E7        .db $E7
  $A3A8  07        .db $07
  $A3A9  CF        .db $CF
  $A3AA  EF        .db $EF
  $A3AB  EC B0 C0  CPX $C0B0
  $A3AE  80        .db $80
  $A3AF  00        BRK
  $A3B0  DF        .db $DF
  $A3B1  BF        .db $BF
  $A3B2  7F        .db $7F
  $A3B3  7F        .db $7F
  $A3B4  FF        .db $FF
  $A3B5  FE FC FD  INC $FDFC,X
  $A3B8  00        BRK
  $A3B9  00        BRK
  $A3BA  00        BRK
  $A3BB  00        BRK
  $A3BC  00        BRK
  $A3BD  00        BRK
  $A3BE  00        BRK
  $A3BF  00        BRK
  $A3C0  78        SEI
  $A3C1  78        SEI
  $A3C2  78        SEI
  $A3C3  F8        SED
  $A3C4  FC        .db $FC
  $A3C5  FF        .db $FF
  $A3C6  07        .db $07
  $A3C7  F1 78     SBC ($78),Y
  $A3C9  7B        .db $7B
  $A3CA  7B        .db $7B
  $A3CB  0F        .db $0F
  $A3CC  03        .db $03
  $A3CD  00        BRK
  $A3CE  00        BRK
  $A3CF  00        BRK
  $A3D0  FC        .db $FC
  $A3D1  FE FF FF  INC $FFFF,X
  $A3D4  FF        .db $FF
  $A3D5  1F        .db $1F
  $A3D6  CF        .db $CF
  $A3D7  2F        .db $2F
  $A3D8  00        BRK
  $A3D9  00        BRK
  $A3DA  00        BRK
  $A3DB  00        BRK
  $A3DC  00        BRK
  $A3DD  00        BRK
  $A3DE  00        BRK
  $A3DF  00        BRK
  $A3E0  00        BRK
  $A3E1  00        BRK
  $A3E2  00        BRK
  $A3E3  00        BRK
  $A3E4  10 38     BPL $A41E
  $A3E6  FC        .db $FC
  $A3E7  F8        SED
  $A3E8  00        BRK
  $A3E9  00        BRK
  $A3EA  C0 C0     CPY #$C0
  $A3EC  90 B8     BCC $A3A6
  $A3EE  7C        .db $7C
  $A3EF  38        SEC
  $A3F0  F0 60     BEQ $A452
  $A3F2  30 30     BMI $A424
  $A3F4  98        TYA
  $A3F5  98        TYA
  $A3F6  9F        .db $9F
  $A3F7  9F        .db $9F
  $A3F8  10 06     BPL $A400
  $A3FA  0F        .db $0F
  $A3FB  0F        .db $0F
  $A3FC  07        .db $07
  $A3FD  00        BRK
  $A3FE  07        .db $07
  $A3FF  07        .db $07

L_A400:
  $A400  03        .db $03
  $A401  FF        .db $FF
  $A402  FF        .db $FF
  $A403  80        .db $80
  $A404  00        BRK
  $A405  63        .db $63
  $A406  63        .db $63
  $A407  03        .db $03
  $A408  77        .db $77
  $A409  00        BRK
  $A40A  00        BRK
  $A40B  7F        .db $7F
  $A40C  00        BRK
  $A40D  17        .db $17
  $A40E  17        .db $17
  $A40F  77        .db $77
  $A410  FF        .db $FF
  $A411  FF        .db $FF
  $A412  FF        .db $FF
  $A413  80        .db $80
  $A414  00        BRK
  $A415  63        .db $63
  $A416  63        .db $63
  $A417  03        .db $03
  $A418  00        BRK
  $A419  00        BRK
  $A41A  00        BRK
  $A41B  7F        .db $7F
  $A41C  00        BRK
  $A41D  17        .db $17

L_A41E:
  $A41E  17        .db $17
  $A41F  77        .db $77
  $A420  EC FE FE  CPX $FEFE
  $A423  00        BRK

L_A424:
  $A424  00        BRK
  $A425  EC EC EC  CPX $ECEC
  $A428  EC 00 00  CPX $0000
  $A42B  FE 00 EC  INC $EC00,X
  $A42E  EC EC FE  CPX $FEEC
  $A431  FE FE 00  INC $00FE,X
  $A434  00        BRK
  $A435  EC EC EC  CPX $ECEC
  $A438  00        BRK
  $A439  00        BRK
  $A43A  00        BRK
  $A43B  FE 00 EC  INC $EC00,X
  $A43E  EC EC 0F  CPX $0FEC

L_A441:
  $A441  10 FE     BPL $A441
  $A443  20 FD C3  JSR $C3FD
  $A446  78        SEI
  $A447  F7        .db $F7
  $A448  0F        .db $0F
  $A449  0E E0 1C  ASL $1CE0
  $A44C  C1 BB     CMP ($BB,X)
  $A44E  00        BRK
  $A44F  07        .db $07
  $A450  F7        .db $F7
  $A451  F7        .db $F7

L_A452:
  $A452  0F        .db $0F
  $A453  EF        .db $EF
  $A454  EF        .db $EF
  $A455  1E DF 1E  ASL $1EDF,X
  $A458  07        .db $07
  $A459  07        .db $07
  $A45A  EE 0E 0E  INC $0E0E
  $A45D  DD 1C DD  CMP $DD1C,X
  $A460  0F        .db $0F

L_A461:
  $A461  10 FE     BPL $A461
  $A463  20 FD C3  JSR $C3FD
  $A466  78        SEI
  $A467  F7        .db $F7
  $A468  0F        .db $0F
  $A469  0E E0 1C  ASL $1CE0
  $A46C  C1 BB     CMP ($BB,X)
  $A46E  00        BRK
  $A46F  07        .db $07
  $A470  F7        .db $F7
  $A471  F7        .db $F7
  $A472  0F        .db $0F
  $A473  EF        .db $EF
  $A474  EF        .db $EF
  $A475  1E DE 1E  ASL $1EDE,X
  $A478  07        .db $07
  $A479  07        .db $07
  $A47A  EE 0E 0E  INC $0E0E
  $A47D  DD 1D DD  CMP $DD1D,X
  $A480  E7        .db $E7
  $A481  E0 E4     CPX #$E4
  $A483  C4 C3     CPY $C3
  $A485  85 A5     STA $A5
  $A487  A0 88     LDY #$88
  $A489  8F        .db $8F
  $A48A  8F        .db $8F
  $A48B  AF        .db $AF
  $A48C  AB        .db $AB
  $A48D  ED CA C0  SBC $C0CA
  $A490  E7        .db $E7
  $A491  C0 80     CPY #$80
  $A493  A4 A2     LDY $A2
  $A495  E5 E1     SBC $E1
  $A497  E0 88     CPX #$88
  $A499  AF        .db $AF
  $A49A  EF        .db $EF
  $A49B  CF        .db $CF
  $A49C  CB        .db $CB
  $A49D  8D 8E 80  STA $808E
  $A4A0  FF        .db $FF
  $A4A1  1F        .db $1F
  $A4A2  07        .db $07
  $A4A3  07        .db $07
  $A4A4  07        .db $07
  $A4A5  FF        .db $FF
  $A4A6  FF        .db $FF
  $A4A7  01 01     ORA ($01,X)
  $A4A9  E1 F9     SBC ($F9,X)
  $A4AB  F9 FD FD  SBC $FDFD,Y
  $A4AE  01 01     ORA ($01,X)
  $A4B0  FF        .db $FF
  $A4B1  5F        .db $5F
  $A4B2  07        .db $07
  $A4B3  07        .db $07
  $A4B4  07        .db $07
  $A4B5  FF        .db $FF
  $A4B6  FF        .db $FF
  $A4B7  01 01     ORA ($01,X)
  $A4B9  A1 F9     LDA ($F9,X)
  $A4BB  F9 FD FD  SBC $FDFD,Y
  $A4BE  01 01     ORA ($01,X)
  $A4C0  FF        .db $FF
  $A4C1  F8        SED
  $A4C2  E0 E0     CPX #$E0
  $A4C4  E0 FF     CPX #$FF
  $A4C6  FF        .db $FF
  $A4C7  80        .db $80
  $A4C8  80        .db $80
  $A4C9  87        .db $87
  $A4CA  9F        .db $9F
  $A4CB  9F        .db $9F
  $A4CC  BF        .db $BF
  $A4CD  BF        .db $BF
  $A4CE  80        .db $80
  $A4CF  80        .db $80
  $A4D0  FF        .db $FF
  $A4D1  FA        .db $FA
  $A4D2  E0 E0     CPX #$E0
  $A4D4  E0 FF     CPX #$FF
  $A4D6  FF        .db $FF
  $A4D7  80        .db $80
  $A4D8  80        .db $80
  $A4D9  85 9F     STA $9F
  $A4DB  9F        .db $9F
  $A4DC  BF        .db $BF
  $A4DD  BF        .db $BF
  $A4DE  80        .db $80
  $A4DF  80        .db $80
  $A4E0  E7        .db $E7
  $A4E1  07        .db $07
  $A4E2  27        .db $27
  $A4E3  27        .db $27
  $A4E4  C7        .db $C7
  $A4E5  A5 A5     LDA $A5
  $A4E7  03        .db $03
  $A4E8  11 F1     ORA ($F1),Y
  $A4EA  F1 F1     SBC ($F1),Y
  $A4EC  D1 B3     CMP ($B3),Y
  $A4EE  53        .db $53
  $A4EF  05 E7     ORA $E7
  $A4F1  05 01     ORA $01
  $A4F3  23        .db $23
  $A4F4  43        .db $43
  $A4F5  A7        .db $A7
  $A4F6  87        .db $87
  $A4F7  07        .db $07
  $A4F8  11 F3     ORA ($F3),Y
  $A4FA  F7        .db $F7
  $A4FB  F5 D5     SBC $D5,X
  $A4FD  B1 71     LDA ($71),Y
  $A4FF  01 00     ORA ($00,X)
  $A501  00        BRK
  $A502  00        BRK
  $A503  00        BRK
  $A504  00        BRK
  $A505  00        BRK
  $A506  00        BRK
  $A507  00        BRK
  $A508  00        BRK
  $A509  2F        .db $2F
  $A50A  00        BRK
  $A50B  2F        .db $2F
  $A50C  2F        .db $2F
  $A50D  2F        .db $2F
  $A50E  2E 2E 00  ROL $002E
  $A511  00        BRK
  $A512  00        BRK
  $A513  00        BRK
  $A514  00        BRK
  $A515  00        BRK
  $A516  2F        .db $2F
  $A517  00        BRK
  $A518  2F        .db $2F
  $A519  28        PLP
  $A51A  23        .db $23
  $A51B  03        .db $03
  $A51C  03        .db $03
  $A51D  03        .db $03
  $A51E  2C 03 00  BIT $0003
  $A521  00        BRK
  $A522  00        BRK
  $A523  00        BRK
  $A524  00        BRK
  $A525  00        BRK
  $A526  00        BRK
  $A527  00        BRK
  $A528  00        BRK
  $A529  F4        .db $F4
  $A52A  00        BRK
  $A52B  F4        .db $F4
  $A52C  F4        .db $F4
  $A52D  F4        .db $F4
  $A52E  74        .db $74
  $A52F  74        .db $74
  $A530  00        BRK
  $A531  00        BRK
  $A532  00        BRK
  $A533  00        BRK
  $A534  00        BRK
  $A535  00        BRK
  $A536  F4        .db $F4
  $A537  00        BRK
  $A538  F4        .db $F4
  $A539  14        .db $14
  $A53A  44        .db $44
  $A53B  40        RTI
  $A53C  40        RTI
  $A53D  40        RTI
  $A53E  B4 40     LDY $40,X
  $A540  33        .db $33
  $A541  33        .db $33
  $A542  1F        .db $1F
  $A543  31 EE     AND ($EE),Y
  $A545  EA        NOP
  $A546  2E 31 3F  ROL $3F31
  $A549  7F        .db $7F
  $A54A  E0 40     CPX #$40
  $A54C  C0 C0     CPY #$C0
  $A54E  C0 C0     CPY #$C0
  $A550  7F        .db $7F
  $A551  66 06     ROR $06
  $A553  00        BRK
  $A554  00        BRK
  $A555  00        BRK
  $A556  00        BRK
  $A557  00        BRK
  $A558  60        RTS
  $A559  7F        .db $7F
  $A55A  1F        .db $1F
  $A55B  00        BRK
  $A55C  00        BRK
  $A55D  00        BRK
  $A55E  00        BRK
  $A55F  00        BRK
  $A560  00        BRK
  $A561  00        BRK
  $A562  00        BRK
  $A563  E0 E0     CPX #$E0
  $A565  80        .db $80
  $A566  80        .db $80
  $A567  C0 00     CPY #$00
  $A569  C0 C0     CPY #$C0
  $A56B  60        RTS
  $A56C  60        RTS
  $A56D  60        RTS
  $A56E  60        RTS
  $A56F  40        RTI
  $A570  E0 4C     CPX #$4C
  $A572  0C        .db $0C
  $A573  74        .db $74
  $A574  6B        .db $6B
  $A575  17        .db $17
  $A576  18        CLC
  $A577  18        CLC
  $A578  E0 DC     CPX #$DC
  $A57A  BA        TSX
  $A57B  43        .db $43
  $A57C  63        .db $63
  $A57D  61 2E     ADC ($2E,X)
  $A57F  1C        .db $1C
  $A580  16 16     ASL $16,X
  $A582  0E 3E FF  ASL $FF3E
  $A585  FF        .db $FF
  $A586  7F        .db $7F
  $A587  65 E8     ADC $E8
  $A589  E8        INX
  $A58A  00        BRK
  $A58B  28        PLP
  $A58C  E8        INX
  $A58D  F4        .db $F4
  $A58E  74        .db $74
  $A58F  62        .db $62
  $A590  02        .db $02
  $A591  01 00     ORA ($00,X)
  $A593  00        BRK
  $A594  01 01     ORA ($01,X)
  $A596  00        BRK
  $A597  00        BRK
  $A598  0D 1E 1E  ORA $1E1E
  $A59B  0C        .db $0C
  $A59C  01 01     ORA ($01,X)
  $A59E  00        BRK
  $A59F  00        BRK
  $A5A0  FD FC FE  SBC $FEFC,X
  $A5A3  FF        .db $FF
  $A5A4  7F        .db $7F
  $A5A5  7F        .db $7F
  $A5A6  BF        .db $BF
  $A5A7  DF        .db $DF
  $A5A8  00        BRK
  $A5A9  00        BRK
  $A5AA  00        BRK
  $A5AB  00        BRK
  $A5AC  00        BRK
  $A5AD  00        BRK
  $A5AE  00        BRK
  $A5AF  00        BRK
  $A5B0  E7        .db $E7
  $A5B1  F8        SED
  $A5B2  7F        .db $7F
  $A5B3  FF        .db $FF
  $A5B4  E3        .db $E3
  $A5B5  E0 C0     CPX #$C0
  $A5B7  00        BRK
  $A5B8  00        BRK
  $A5B9  80        .db $80
  $A5BA  C0 A0     CPY #$A0
  $A5BC  CC EF CF  CPY $CFEF
  $A5BF  07        .db $07
  $A5C0  2F        .db $2F
  $A5C1  CF        .db $CF
  $A5C2  1F        .db $1F
  $A5C3  FF        .db $FF
  $A5C4  FF        .db $FF
  $A5C5  FF        .db $FF
  $A5C6  FE FC 00  INC $00FC,X
  $A5C9  00        BRK
  $A5CA  00        BRK
  $A5CB  00        BRK
  $A5CC  00        BRK
  $A5CD  00        BRK
  $A5CE  00        BRK
  $A5CF  00        BRK
  $A5D0  F1 07     SBC ($07),Y
  $A5D2  FF        .db $FF
  $A5D3  FC        .db $FC
  $A5D4  F8        SED
  $A5D5  78        SEI
  $A5D6  78        SEI
  $A5D7  78        SEI
  $A5D8  00        BRK
  $A5D9  00        BRK
  $A5DA  00        BRK
  $A5DB  03        .db $03
  $A5DC  0F        .db $0F
  $A5DD  7B        .db $7B
  $A5DE  7B        .db $7B
  $A5DF  78        SEI
  $A5E0  9F        .db $9F
  $A5E1  9F        .db $9F
  $A5E2  98        TYA
  $A5E3  98        TYA
  $A5E4  30 30     BMI $A616
  $A5E6  60        RTS
  $A5E7  F0 07     BEQ $A5F0
  $A5E9  07        .db $07
  $A5EA  00        BRK
  $A5EB  07        .db $07
  $A5EC  0F        .db $0F
  $A5ED  0F        .db $0F
  $A5EE  06 10     ASL $10

L_A5F0:
  $A5F0  F8        SED
  $A5F1  FC        .db $FC
  $A5F2  38        SEC
  $A5F3  10 00     BPL $A5F5

L_A5F5:
  $A5F5  00        BRK
  $A5F6  00        BRK
  $A5F7  00        BRK
  $A5F8  38        SEC
  $A5F9  7C        .db $7C
  $A5FA  B8        CLV
  $A5FB  90 C0     BCC $A5BD
  $A5FD  C0 00     CPY #$00
  $A5FF  00        BRK
  $A600  FF        .db $FF
  $A601  80        .db $80
  $A602  80        .db $80
  $A603  80        .db $80
  $A604  00        BRK
  $A605  63        .db $63
  $A606  63        .db $63
  $A607  03        .db $03
  $A608  00        BRK
  $A609  7F        .db $7F
  $A60A  7F        .db $7F
  $A60B  7F        .db $7F
  $A60C  00        BRK
  $A60D  17        .db $17
  $A60E  17        .db $17
  $A60F  77        .db $77
  $A610  FF        .db $FF
  $A611  80        .db $80
  $A612  80        .db $80
  $A613  00        BRK
  $A614  63        .db $63
  $A615  63        .db $63

L_A616:
  $A616  03        .db $03
  $A617  FF        .db $FF
  $A618  00        BRK
  $A619  7F        .db $7F
  $A61A  7F        .db $7F
  $A61B  00        BRK
  $A61C  17        .db $17
  $A61D  17        .db $17
  $A61E  77        .db $77
  $A61F  00        BRK
  $A620  FE 00 00  INC $0000,X
  $A623  00        BRK
  $A624  00        BRK
  $A625  EC EC EC  CPX $ECEC
  $A628  00        BRK
  $A629  FE FE FE  INC $FEFE,X
  $A62C  00        BRK
  $A62D  EC EC EC  CPX $ECEC
  $A630  FE 00 00  INC $0000,X
  $A633  00        BRK
  $A634  EC EC EC  CPX $ECEC
  $A637  FE 00 FE  INC $FE00,X
  $A63A  FE 00 EC  INC $EC00,X
  $A63D  EC EC 00  CPX $00EC
  $A640  BF        .db $BF

L_A641:
  $A641  3C        .db $3C
  $A642  3C        .db $3C
  $A643  78        SEI
  $A644  78        SEI
  $A645  08        PHP
  $A646  F0 1E     BEQ $A666
  $A648  38        SEC
  $A649  BB        .db $BB
  $A64A  BB        .db $BB
  $A64B  77        .db $77
  $A64C  77        .db $77
  $A64D  07        .db $07
  $A64E  EE 0E F0  INC $F00E
  $A651  E1 3C     SBC ($3C,X)
  $A653  40        RTI
  $A654  78        SEI
  $A655  87        .db $87
  $A656  F0 E1     BEQ $A639
  $A658  EE DD 1C  INC $1CDD
  $A65B  38        SEC
  $A65C  38        SEC
  $A65D  77        .db $77
  $A65E  F0 E1     BEQ $A641
  $A660  BC 3C 3C  LDY $3C3C,X
  $A663  78        SEI
  $A664  78        SEI
  $A665  08        PHP

L_A666:
  $A666  F0 1E     BEQ $A686
  $A668  3B        .db $3B
  $A669  BB        .db $BB
  $A66A  BB        .db $BB
  $A66B  77        .db $77
  $A66C  77        .db $77
  $A66D  07        .db $07
  $A66E  EE 0E F0  INC $F00E
  $A671  E1 3C     SBC ($3C,X)
  $A673  40        RTI
  $A674  78        SEI
  $A675  87        .db $87
  $A676  F0 E1     BEQ $A659
  $A678  EE DD 1C  INC $1CDD
  $A67B  38        SEC
  $A67C  38        SEC
  $A67D  77        .db $77
  $A67E  F0 E1     BEQ $A661
  $A680  FF        .db $FF
  $A681  FF        .db $FF
  $A682  FF        .db $FF
  $A683  FF        .db $FF
  $A684  FF        .db $FF
  $A685  F8        SED

L_A686:
  $A686  F9 FA 04  SBC $04FA,Y
  $A689  04        .db $04
  $A68A  04        .db $04
  $A68B  04        .db $04
  $A68C  04        .db $04

L_A68D:
  $A68D  00        BRK
  $A68E  01 03     ORA ($03,X)
  $A690  F9 F9 F9  SBC $F9F9,Y
  $A693  F9 F9 F9  SBC $F9F9,Y
  $A696  E1 C9     SBC ($C9,X)
  $A698  02        .db $02
  $A699  02        .db $02
  $A69A  02        .db $02
  $A69B  02        .db $02
  $A69C  02        .db $02
  $A69D  02        .db $02
  $A69E  1A        .db $1A
  $A69F  32        .db $32
  $A6A0  FF        .db $FF
  $A6A1  FE F0 C7  INC $C7F0,X
  $A6A4  9F        .db $9F
  $A6A5  00        BRK
  $A6A6  00        BRK
  $A6A7  FF        .db $FF
  $A6A8  00        BRK
  $A6A9  01 0F     ORA ($0F,X)
  $A6AB  38        SEC
  $A6AC  60        RTS
  $A6AD  00        BRK
  $A6AE  FF        .db $FF
  $A6AF  00        BRK
  $A6B0  FF        .db $FF
  $A6B1  FC        .db $FC
  $A6B2  F8        SED
  $A6B3  F3        .db $F3
  $A6B4  E6 DC     INC $DC
  $A6B6  D8        CLD
  $A6B7  98        TYA
  $A6B8  00        BRK
  $A6B9  03        .db $03
  $A6BA  07        .db $07
  $A6BB  0C        .db $0C
  $A6BC  19 23 27  ORA $2723,Y
  $A6BF  67        .db $67
  $A6C0  0F        .db $0F
  $A6C1  3C        .db $3C
  $A6C2  F3        .db $F3
  $A6C3  EC D0 00  CPX $00D0
  $A6C6  01 F8     ORA ($F8,X)
  $A6C8  F0 C3     BEQ $A68D
  $A6CA  0C        .db $0C
  $A6CB  13        .db $13
  $A6CC  2F        .db $2F
  $A6CD  00        BRK
  $A6CE  FF        .db $FF
  $A6CF  07        .db $07
  $A6D0  E0 C0     CPX #$C0
  $A6D2  80        .db $80
  $A6D3  87        .db $87
  $A6D4  07        .db $07
  $A6D5  0C        .db $0C
  $A6D6  0C        .db $0C
  $A6D7  1C        .db $1C
  $A6D8  1F        .db $1F
  $A6D9  3F        .db $3F
  $A6DA  7F        .db $7F
  $A6DB  7F        .db $7F
  $A6DC  FF        .db $FF
  $A6DD  FF        .db $FF
  $A6DE  FF        .db $FF
  $A6DF  FF        .db $FF
  $A6E0  FF        .db $FF
  $A6E1  7F        .db $7F
  $A6E2  FD 79 73  SBC $7379,X
  $A6E5  33        .db $33
  $A6E6  27        .db $27
  $A6E7  8F        .db $8F
  $A6E8  41 C1     EOR ($C1,X)
  $A6EA  43        .db $43
  $A6EB  C7        .db $C7
  $A6EC  CD 0D 19  CMP $190D
  $A6EF  B1 1D     LDA ($1D),Y
  $A6F1  19 31 31  ORA $3131,Y
  $A6F4  21 A1     AND ($A1,X)
  $A6F6  81 81     STA ($81,X)
  $A6F8  A3        .db $A3
  $A6F9  A7        .db $A7
  $A6FA  8F        .db $8F
  $A6FB  8F        .db $8F
  $A6FC  9F        .db $9F
  $A6FD  1F        .db $1F
  $A6FE  3F        .db $3F
  $A6FF  3F        .db $3F
  $A700  2F        .db $2F
  $A701  2F        .db $2F
  $A702  2F        .db $2F
  $A703  2E 2E 2F  ROL $2F2E
  $A706  28        PLP
  $A707  23        .db $23
  $A708  2C 2C 2C  BIT $2C2C
  $A70B  2D 2D 2C  AND $2C2D
  $A70E  2B        .db $2B
  $A70F  20 03 03  JSR $0303
  $A712  03        .db $03
  $A713  03        .db $03
  $A714  03        .db $03
  $A715  03        .db $03
  $A716  03        .db $03
  $A717  03        .db $03
  $A718  00        BRK
  $A719  00        BRK
  $A71A  00        BRK
  $A71B  00        BRK
  $A71C  00        BRK
  $A71D  00        BRK
  $A71E  00        BRK
  $A71F  03        .db $03
  $A720  F4        .db $F4
  $A721  F4        .db $F4
  $A722  F4        .db $F4
  $A723  74        .db $74
  $A724  74        .db $74
  $A725  F4        .db $F4
  $A726  14        .db $14
  $A727  44        .db $44
  $A728  B4 B4     LDY $B4,X
  $A72A  B4 34     LDY $34,X
  $A72C  34        .db $34
  $A72D  B4 54     LDY $54,X
  $A72F  04        .db $04
  $A730  40        RTI
  $A731  40        RTI
  $A732  40        RTI
  $A733  40        RTI
  $A734  40        RTI
  $A735  40        RTI
  $A736  40        RTI
  $A737  40        RTI
  $A738  00        BRK
  $A739  00        BRK
  $A73A  00        BRK
  $A73B  00        BRK
  $A73C  00        BRK
  $A73D  00        BRK
  $A73E  00        BRK
  $A73F  40        RTI
  $A740  00        BRK
  $A741  2F        .db $2F
  $A742  00        BRK
  $A743  2F        .db $2F
  $A744  2F        .db $2F
  $A745  2F        .db $2F
  $A746  2E 2E 00  ROL $002E
  $A749  2F        .db $2F
  $A74A  00        BRK
  $A74B  2F        .db $2F
  $A74C  2F        .db $2F
  $A74D  2F        .db $2F
  $A74E  2E 2E 2F  ROL $2F2E
  $A751  28        PLP
  $A752  23        .db $23
  $A753  03        .db $03
  $A754  03        .db $03
  $A755  03        .db $03
  $A756  03        .db $03
  $A757  03        .db $03
  $A758  2F        .db $2F
  $A759  28        PLP
  $A75A  23        .db $23
  $A75B  03        .db $03
  $A75C  03        .db $03
  $A75D  03        .db $03
  $A75E  2C 03 00  BIT $0003
  $A761  F4        .db $F4
  $A762  00        BRK
  $A763  F4        .db $F4
  $A764  F4        .db $F4
  $A765  F4        .db $F4
  $A766  74        .db $74
  $A767  74        .db $74
  $A768  00        BRK
  $A769  F4        .db $F4
  $A76A  00        BRK
  $A76B  F4        .db $F4
  $A76C  F4        .db $F4
  $A76D  F4        .db $F4
  $A76E  74        .db $74
  $A76F  74        .db $74
  $A770  F4        .db $F4
  $A771  14        .db $14
  $A772  44        .db $44
  $A773  40        RTI
  $A774  40        RTI
  $A775  40        RTI
  $A776  40        RTI
  $A777  40        RTI
  $A778  F4        .db $F4
  $A779  14        .db $14
  $A77A  44        .db $44
  $A77B  40        RTI
  $A77C  40        RTI
  $A77D  40        RTI
  $A77E  B4 40     LDY $40,X
  $A780  03        .db $03
  $A781  03        .db $03
  $A782  03        .db $03
  $A783  03        .db $03
  $A784  03        .db $03
  $A785  03        .db $03
  $A786  03        .db $03
  $A787  03        .db $03
  $A788  2C 2C 2C  BIT $2C2C
  $A78B  2D 2D 2C  AND $2C2D
  $A78E  2B        .db $2B
  $A78F  20 03 03  JSR $0303
  $A792  03        .db $03
  $A793  03        .db $03
  $A794  03        .db $03
  $A795  03        .db $03
  $A796  03        .db $03
  $A797  00        BRK
  $A798  00        BRK
  $A799  00        BRK
  $A79A  00        BRK
  $A79B  00        BRK
  $A79C  00        BRK
  $A79D  00        BRK
  $A79E  00        BRK
  $A79F  03        .db $03
  $A7A0  40        RTI
  $A7A1  40        RTI
  $A7A2  40        RTI
  $A7A3  40        RTI
  $A7A4  40        RTI
  $A7A5  40        RTI
  $A7A6  40        RTI
  $A7A7  40        RTI
  $A7A8  B4 B4     LDY $B4,X
  $A7AA  B4 34     LDY $34,X
  $A7AC  34        .db $34
  $A7AD  B4 54     LDY $54,X
  $A7AF  04        .db $04
  $A7B0  40        RTI
  $A7B1  40        RTI
  $A7B2  40        RTI
  $A7B3  40        RTI
  $A7B4  40        RTI
  $A7B5  40        RTI
  $A7B6  40        RTI
  $A7B7  00        BRK
  $A7B8  00        BRK
  $A7B9  00        BRK
  $A7BA  00        BRK
  $A7BB  00        BRK
  $A7BC  00        BRK
  $A7BD  00        BRK
  $A7BE  00        BRK
  $A7BF  40        RTI
  $A7C0  07        .db $07
  $A7C1  70 77     BVS $A83A
  $A7C3  07        .db $07
  $A7C4  70 77     BVS $A83D
  $A7C6  70 70     BVS $A838
  $A7C8  04        .db $04
  $A7C9  03        .db $03
  $A7CA  74        .db $74
  $A7CB  74        .db $74
  $A7CC  03        .db $03
  $A7CD  04        .db $04
  $A7CE  03        .db $03
  $A7CF  03        .db $03
  $A7D0  70 00     BVS $A7D2

L_A7D2:
  $A7D2  70 70     BVS $A844
  $A7D4  00        BRK
  $A7D5  70 70     BVS $A847
  $A7D7  00        BRK
  $A7D8  00        BRK
  $A7D9  77        .db $77
  $A7DA  70 07     BVS $A7E3
  $A7DC  77        .db $77
  $A7DD  70 07     BVS $A7E6
  $A7DF  00        BRK
  $A7E0  E0 0E     CPX #$0E
  $A7E2  E0 EE     CPX #$EE
  $A7E4  0E EE 0E  ASL $0EEE
  $A7E7  0E A0 40  ASL $40A0
  $A7EA  AE AE 40  LDX $40AE
  $A7ED  A0 40     LDY #$40
  $A7EF  40        RTI
  $A7F0  0E 0E 00  ASL $000E
  $A7F3  0E 0E 00  ASL $000E
  $A7F6  0E 00 00  ASL $0000
  $A7F9  EE 0E E0  INC $E00E
  $A7FC  EE 0E E0  INC $E00E
  $A7FF  00        BRK
  $A800  80        .db $80
  $A801  80        .db $80
  $A802  00        BRK
  $A803  63        .db $63
  $A804  03        .db $03
  $A805  FF        .db $FF
  $A806  80        .db $80
  $A807  00        BRK
  $A808  7F        .db $7F
  $A809  7F        .db $7F
  $A80A  00        BRK
  $A80B  17        .db $17
  $A80C  77        .db $77
  $A80D  00        BRK
  $A80E  7F        .db $7F
  $A80F  00        BRK
  $A810  03        .db $03
  $A811  00        BRK
  $A812  00        BRK
  $A813  00        BRK
  $A814  00        BRK
  $A815  00        BRK
  $A816  00        BRK
  $A817  00        BRK
  $A818  77        .db $77
  $A819  FF        .db $FF
  $A81A  FF        .db $FF
  $A81B  00        BRK
  $A81C  FF        .db $FF
  $A81D  00        BRK
  $A81E  FF        .db $FF
  $A81F  00        BRK
  $A820  00        BRK
  $A821  00        BRK
  $A822  00        BRK
  $A823  EC EC FE  CPX $FEEC
  $A826  00        BRK
  $A827  00        BRK
  $A828  FE FE 00  INC $00FE,X
  $A82B  EC EC 00  CPX $00EC
  $A82E  FE 00 EC  INC $EC00,X
  $A831  00        BRK
  $A832  00        BRK
  $A833  00        BRK
  $A834  00        BRK
  $A835  00        BRK
  $A836  00        BRK
  $A837  00        BRK

L_A838:
  $A838  EC FE FE  CPX $FEFE
  $A83B  00        BRK
  $A83C  FE 00 FE  INC $FE00,X
  $A83F  00        BRK
  $A840  FF        .db $FF
  $A841  FF        .db $FF
  $A842  80        .db $80
  $A843  80        .db $80

L_A844:
  $A844  00        BRK
  $A845  63        .db $63
  $A846  63        .db $63

L_A847:
  $A847  03        .db $03
  $A848  00        BRK
  $A849  00        BRK
  $A84A  7F        .db $7F
  $A84B  7F        .db $7F
  $A84C  00        BRK
  $A84D  17        .db $17
  $A84E  17        .db $17
  $A84F  77        .db $77
  $A850  FF        .db $FF
  $A851  FF        .db $FF
  $A852  80        .db $80
  $A853  80        .db $80
  $A854  00        BRK
  $A855  63        .db $63
  $A856  63        .db $63
  $A857  03        .db $03
  $A858  00        BRK
  $A859  00        BRK
  $A85A  7F        .db $7F
  $A85B  7F        .db $7F
  $A85C  00        BRK
  $A85D  17        .db $17
  $A85E  17        .db $17
  $A85F  77        .db $77
  $A860  FE FE 00  INC $00FE,X
  $A863  00        BRK
  $A864  00        BRK
  $A865  EC EC EC  CPX $ECEC
  $A868  00        BRK
  $A869  00        BRK
  $A86A  FE FE 00  INC $00FE,X
  $A86D  EC EC EC  CPX $ECEC
  $A870  FE FE 00  INC $00FE,X
  $A873  00        BRK
  $A874  00        BRK
  $A875  EC EC EC  CPX $ECEC
  $A878  00        BRK
  $A879  00        BRK
  $A87A  FE FE 00  INC $00FE,X
  $A87D  EC EC EC  CPX $ECEC
  $A880  99 B1 61  STA $61B1,Y
  $A883  49 99     EOR #$99
  $A885  39 71 62  AND $6271,Y
  $A888  62        .db $62
  $A889  4A        LSR
  $A88A  9A        TXS
  $A88B  B2        .db $B2
  $A88C  62        .db $62
  $A88D  C2        .db $C2
  $A88E  8A        TXA
  $A88F  9B        .db $9B
  $A890  C1 80     CMP ($80,X)
  $A892  87        .db $87
  $A893  8F        .db $8F
  $A894  1F        .db $1F
  $A895  BF        .db $BF
  $A896  FF        .db $FF
  $A897  F8        SED
  $A898  39 78 7C  AND $7C78,Y
  $A89B  74        .db $74
  $A89C  E4 44     CPX $44
  $A89E  04        .db $04
  $A89F  00        BRK
  $A8A0  98        TYA
  $A8A1  10 10     BPL $A8B3
  $A8A3  30 3F     BMI $A8E4
  $A8A5  F8        SED
  $A8A6  E0 EF     CPX #$EF
  $A8A8  67        .db $67
  $A8A9  EF        .db $EF
  $A8AA  EF        .db $EF
  $A8AB  CF        .db $CF
  $A8AC  CF        .db $CF
  $A8AD  3F        .db $3F
  $A8AE  7F        .db $7F
  $A8AF  1F        .db $1F
  $A8B0  80        .db $80
  $A8B1  00        BRK
  $A8B2  FF        .db $FF

L_A8B3:
  $A8B3  FE F0 87  INC $87F0,X
  $A8B6  3F        .db $3F
  $A8B7  00        BRK
  $A8B8  FF        .db $FF
  $A8B9  00        BRK
  $A8BA  00        BRK
  $A8BB  01 0F     ORA ($0F,X)
  $A8BD  78        SEI
  $A8BE  C0 00     CPY #$00
  $A8C0  13        .db $13
  $A8C1  33        .db $33
  $A8C2  63        .db $63
  $A8C3  45 DD     EOR $DD
  $A8C5  19 E3 FF  ORA $FFE3,Y
  $A8C8  FF        .db $FF
  $A8C9  FF        .db $FF
  $A8CA  FF        .db $FF
  $A8CB  FD FD F9  SBC $F9FD,X
  $A8CE  E3        .db $E3
  $A8CF  FE E5 00  INC $00E5,X
  $A8D2  7E 43 87  ROR $8743,X
  $A8D5  BE E7 00  LDX $00E7,Y
  $A8D8  1B        .db $1B
  $A8D9  00        BRK
  $A8DA  81 BF     STA ($BF,X)
  $A8DC  7F        .db $7F
  $A8DD  FF        .db $FF
  $A8DE  18        CLC
  $A8DF  00        BRK
  $A8E0  23        .db $23
  $A8E1  87        .db $87
  $A8E2  A7        .db $A7
  $A8E3  2F        .db $2F

L_A8E4:
  $A8E4  BD 39 33  LDA $3339,X
  $A8E7  A7        .db $A7
  $A8E8  9D 39 19  STA $1939,X
  $A8EB  91 03     STA ($03),Y
  $A8ED  87        .db $87
  $A8EE  8D 99 2F  STA $2F99
  $A8F1  1F        .db $1F
  $A8F2  DF        .db $DF
  $A8F3  FF        .db $FF
  $A8F4  FF        .db $FF
  $A8F5  FF        .db $FF
  $A8F6  FF        .db $FF
  $A8F7  3F        .db $3F
  $A8F8  11 21     ORA ($21),Y
  $A8FA  61 41     ADC ($41,X)
  $A8FC  41 41     EOR ($41,X)
  $A8FE  41 01     EOR ($01,X)
  $A900  03        .db $03
  $A901  73        .db $73
  $A902  03        .db $03
  $A903  73        .db $73
  $A904  73        .db $73
  $A905  73        .db $73
  $A906  73        .db $73
  $A907  73        .db $73
  $A908  04        .db $04
  $A909  03        .db $03
  $A90A  74        .db $74
  $A90B  74        .db $74
  $A90C  03        .db $03
  $A90D  04        .db $04
  $A90E  03        .db $03
  $A90F  03        .db $03
  $A910  70 77     BVS $A989
  $A912  00        BRK
  $A913  77        .db $77
  $A914  77        .db $77
  $A915  00        BRK
  $A916  77        .db $77
  $A917  00        BRK
  $A918  00        BRK
  $A919  77        .db $77
  $A91A  70 07     BVS $A923
  $A91C  77        .db $77
  $A91D  70 07     BVS $A926
  $A91F  00        BRK
  $A920  40        RTI
  $A921  4E 4E 40  LSR $404E
  $A924  4E 4E 4E  LSR $4E4E
  $A927  4E A0 40  LSR $40A0
  $A92A  AE AE 40  LDX $40AE
  $A92D  A0 40     LDY #$40
  $A92F  40        RTI
  $A930  0E E0 0E  ASL $0EE0
  $A933  EE E0 0E  INC $0EE0
  $A936  EE 00 00  INC $0000
  $A939  EE 0E E0  INC $E00E
  $A93C  EE 0E E0  INC $E00E
  $A93F  00        BRK
  $A940  00        BRK
  $A941  1C        .db $1C
  $A942  C0 DC     CPY #$DC
  $A944  DC        .db $DC
  $A945  1C        .db $1C
  $A946  1C        .db $1C
  $A947  1C        .db $1C
  $A948  00        BRK
  $A949  00        BRK
  $A94A  DD DD C1  CMP $C1DD,X
  $A94D  00        BRK
  $A94E  00        BRK
  $A94F  00        BRK
  $A950  1C        .db $1C
  $A951  1C        .db $1C
  $A952  00        BRK
  $A953  1D 1D 01  ORA $011D,X
  $A956  1C        .db $1C
  $A957  00        BRK
  $A958  00        BRK
  $A959  1C        .db $1C
  $A95A  1C        .db $1C
  $A95B  C1 DD     CMP ($DD,X)
  $A95D  DD 00 00  CMP $0000,X
  $A960  00        BRK
  $A961  38        SEC
  $A962  3B        .db $3B
  $A963  03        .db $03
  $A964  3B        .db $3B
  $A965  38        SEC
  $A966  38        SEC
  $A967  38        SEC
  $A968  00        BRK
  $A969  00        BRK
  $A96A  BB        .db $BB
  $A96B  BB        .db $BB
  $A96C  83        .db $83
  $A96D  00        BRK
  $A96E  00        BRK
  $A96F  00        BRK
  $A970  38        SEC
  $A971  00        BRK
  $A972  38        SEC
  $A973  B8        CLV
  $A974  80        .db $80
  $A975  B8        CLV
  $A976  38        SEC
  $A977  00        BRK
  $A978  00        BRK
  $A979  38        SEC
  $A97A  38        SEC
  $A97B  83        .db $83
  $A97C  BB        .db $BB
  $A97D  BB        .db $BB
  $A97E  00        BRK
  $A97F  00        BRK
  $A980  00        BRK
  $A981  00        BRK
  $A982  00        BRK
  $A983  00        BRK
  $A984  00        BRK
  $A985  00        BRK
  $A986  FF        .db $FF
  $A987  FF        .db $FF
  $A988  00        BRK

L_A989:
  $A989  00        BRK
  $A98A  00        BRK
  $A98B  00        BRK
  $A98C  00        BRK
  $A98D  00        BRK
  $A98E  00        BRK
  $A98F  00        BRK
  $A990  00        BRK
  $A991  FF        .db $FF
  $A992  00        BRK
  $A993  00        BRK
  $A994  00        BRK
  $A995  00        BRK
  $A996  00        BRK
  $A997  00        BRK
  $A998  00        BRK
  $A999  00        BRK
  $A99A  00        BRK
  $A99B  00        BRK
  $A99C  00        BRK
  $A99D  00        BRK
  $A99E  00        BRK
  $A99F  00        BRK
  $A9A0  00        BRK
  $A9A1  00        BRK
  $A9A2  00        BRK
  $A9A3  00        BRK
  $A9A4  00        BRK
  $A9A5  00        BRK
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
  $A9B0  00        BRK
  $A9B1  FF        .db $FF
  $A9B2  00        BRK
  $A9B3  00        BRK
  $A9B4  00        BRK
  $A9B5  00        BRK
  $A9B6  00        BRK
  $A9B7  00        BRK
  $A9B8  00        BRK
  $A9B9  00        BRK
  $A9BA  00        BRK
  $A9BB  00        BRK
  $A9BC  00        BRK
  $A9BD  00        BRK
  $A9BE  00        BRK
  $A9BF  00        BRK
  $A9C0  00        BRK
  $A9C1  00        BRK
  $A9C2  00        BRK
  $A9C3  00        BRK
  $A9C4  00        BRK
  $A9C5  00        BRK
  $A9C6  00        BRK
  $A9C7  00        BRK
  $A9C8  00        BRK

L_A9C9:
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
  $AA01  00        BRK
  $AA02  00        BRK
  $AA03  00        BRK
  $AA04  78        SEI
  $AA05  FC        .db $FC
  $AA06  FE FE 00  INC $00FE,X
  $AA09  00        BRK
  $AA0A  00        BRK
  $AA0B  00        BRK
  $AA0C  00        BRK
  $AA0D  78        SEI
  $AA0E  FC        .db $FC
  $AA0F  F8        SED
  $AA10  1F        .db $1F
  $AA11  3F        .db $3F
  $AA12  3F        .db $3F
  $AA13  3F        .db $3F
  $AA14  1F        .db $1F
  $AA15  1F        .db $1F
  $AA16  3F        .db $3F
  $AA17  FF        .db $FF
  $AA18  0E 1F 1F  ASL $1F1F
  $AA1B  1E 0F 0D  ASL $0D0F,X
  $AA1E  06 03     ASL $03
  $AA20  9C        .db $9C
  $AA21  BE B6 C9  LDX $C9B6,Y
  $AA24  E0 DF     CPX #$DF
  $AA26  B3        .db $B3
  $AA27  B3        .db $B3
  $AA28  9C        .db $9C
  $AA29  88        DEY
  $AA2A  80        .db $80
  $AA2B  C9 7F     CMP #$7F
  $AA2D  E0 CC     CPX #$CC
  $AA2F  CC 7F 7F  CPY $7F7F
  $AA32  FF        .db $FF
  $AA33  FE FC 3C  INC $3CFC,X
  $AA36  DC        .db $DC
  $AA37  DE 7F 7F  DEC $7F7F,X
  $AA3A  EE DD F3  INC $F3DD
  $AA3D  EB        .db $EB
  $AA3E  3B        .db $3B
  $AA3F  39 F8 FC  AND $FCF8,Y
  $AA42  FE 4E 06  INC $064E,X

L_AA45:
  $AA45  04        .db $04
  $AA46  08        PHP
  $AA47  10 80     BPL $A9C9
  $AA49  00        BRK
  $AA4A  00        BRK
  $AA4B  B0 F8     BCS $AA45
  $AA4D  F8        SED
  $AA4E  F0 E0     BEQ $AA30
  $AA50  1F        .db $1F
  $AA51  38        SEC
  $AA52  3C        .db $3C
  $AA53  3C        .db $3C
  $AA54  38        SEC
  $AA55  1F        .db $1F
  $AA56  00        BRK
  $AA57  00        BRK
  $AA58  00        BRK
  $AA59  07        .db $07
  $AA5A  0B        .db $0B
  $AA5B  0B        .db $0B
  $AA5C  07        .db $07
  $AA5D  00        BRK
  $AA5E  00        BRK
  $AA5F  00        BRK
  $AA60  FF        .db $FF
  $AA61  5F        .db $5F
  $AA62  5F        .db $5F
  $AA63  FB        .db $FB
  $AA64  F1 00     SBC ($00),Y
  $AA66  00        BRK
  $AA67  01 23     ORA ($23,X)
  $AA69  F3        .db $F3
  $AA6A  F1 21     SBC ($21),Y
  $AA6C  00        BRK
  $AA6D  00        BRK

L_AA6E:
  $AA6E  00        BRK
  $AA6F  00        BRK
  $AA70  7F        .db $7F
  $AA71  77        .db $77
  $AA72  6E AE BF  ROR $BFAE
  $AA75  DF        .db $DF
  $AA76  E0 FF     CPX #$FF
  $AA78  80        .db $80
  $AA79  8C 9D D1  STY $D19D
  $AA7C  C0 60     CPY #$60
  $AA7E  3F        .db $3F
  $AA7F  0F        .db $0F
  $AA80  EE EF 6C  INC $6CEF
  $AA83  5C        .db $5C
  $AA84  D8        CLD
  $AA85  3C        .db $3C
  $AA86  FC        .db $FC
  $AA87  FE 1D 1C  INC $1C1D,X
  $AA8A  98        TYA
  $AA8B  B8        CLV
  $AA8C  30 E0     BMI $AA6E
  $AA8E  C0 00     CPY #$00
  $AA90  60        RTS
  $AA91  80        .db $80
  $AA92  00        BRK
  $AA93  00        BRK
  $AA94  00        BRK
  $AA95  00        BRK
  $AA96  00        BRK
  $AA97  00        BRK
  $AA98  80        .db $80
  $AA99  00        BRK
  $AA9A  00        BRK
  $AA9B  00        BRK
  $AA9C  00        BRK
  $AA9D  00        BRK
  $AA9E  00        BRK
  $AA9F  00        BRK
  $AAA0  03        .db $03
  $AAA1  02        .db $02
  $AAA2  02        .db $02
  $AAA3  01 03     ORA ($03,X)
  $AAA5  04        .db $04
  $AAA6  08        PHP
  $AAA7  0F        .db $0F
  $AAA8  00        BRK
  $AAA9  01 01     ORA ($01,X)
  $AAAB  00        BRK
  $AAAC  00        BRK
  $AAAD  03        .db $03
  $AAAE  07        .db $07
  $AAAF  00        BRK
  $AAB0  FF        .db $FF
  $AAB1  70 10     BVS $AAC3
  $AAB3  08        PHP
  $AAB4  08        PHP
  $AAB5  04        .db $04

L_AAB6:
  $AAB6  04        .db $04
  $AAB7  FC        .db $FC
  $AAB8  00        BRK
  $AAB9  80        .db $80
  $AABA  E0 F0     CPX #$F0
  $AABC  F0 F8     BEQ $AAB6
  $AABE  F8        SED
  $AABF  00        BRK
  $AAC0  FF        .db $FF
  $AAC1  1E 0C 04  ASL $040C,X
  $AAC4  04        .db $04
  $AAC5  02        .db $02
  $AAC6  02        .db $02
  $AAC7  03        .db $03
  $AAC8  00        BRK
  $AAC9  01 03     ORA ($03,X)
  $AACB  03        .db $03
  $AACC  03        .db $03
  $AACD  01 01     ORA ($01,X)
  $AACF  00        BRK
  $AAD0  80        .db $80
  $AAD1  40        RTI
  $AAD2  20 10 18  JSR $1810
  $AAD5  06 01     ASL $01
  $AAD7  FF        .db $FF
  $AAD8  00        BRK
  $AAD9  80        .db $80
  $AADA  C0 E0     CPY #$E0
  $AADC  E0 F8     CPX #$F8
  $AADE  FE 00 00  INC $0000,X
  $AAE1  00        BRK
  $AAE2  00        BRK
  $AAE3  00        BRK
  $AAE4  00        BRK
  $AAE5  00        BRK
  $AAE6  00        BRK
  $AAE7  00        BRK
  $AAE8  00        BRK
  $AAE9  00        BRK
  $AAEA  20 03 C7  JSR $C703
  $AAED  83        .db $83
  $AAEE  92        .db $92
  $AAEF  6C 00 00  JMP ($0000)
  $AAF2  00        BRK
  $AAF3  00        BRK
  $AAF4  00        BRK

L_AAF5:
  $AAF5  00        BRK
  $AAF6  00        BRK
  $AAF7  00        BRK
  $AAF8  00        BRK
  $AAF9  00        BRK
  $AAFA  00        BRK
  $AAFB  00        BRK
  $AAFC  00        BRK

L_AAFD:
  $AAFD  00        BRK
  $AAFE  00        BRK
  $AAFF  00        BRK
  $AB00  00        BRK
  $AB01  0F        .db $0F
  $AB02  0F        .db $0F
  $AB03  19 1B 24  ORA $241B,Y
  $AB06  13        .db $13
  $AB07  09 00     ORA #$00
  $AB09  0F        .db $0F
  $AB0A  1F        .db $1F
  $AB0B  3F        .db $3F
  $AB0C  3F        .db $3F
  $AB0D  3F        .db $3F
  $AB0E  1F        .db $1F
  $AB0F  0F        .db $0F
  $AB10  00        BRK
  $AB11  80        .db $80
  $AB12  E0 F8     CPX #$F8
  $AB14  FC        .db $FC
  $AB15  7C        .db $7C
  $AB16  FC        .db $FC
  $AB17  FC        .db $FC
  $AB18  00        BRK
  $AB19  80        .db $80
  $AB1A  E0 F8     CPX #$F8
  $AB1C  FC        .db $FC
  $AB1D  FC        .db $FC
  $AB1E  FC        .db $FC
  $AB1F  FC        .db $FC
  $AB20  2F        .db $2F
  $AB21  10 0F     BPL $AB32
  $AB23  13        .db $13
  $AB24  0F        .db $0F
  $AB25  07        .db $07
  $AB26  18        CLC
  $AB27  10 3F     BPL $AB68

L_AB29:
  $AB29  3F        .db $3F
  $AB2A  1F        .db $1F
  $AB2B  1F        .db $1F
  $AB2C  1F        .db $1F
  $AB2D  0F        .db $0F
  $AB2E  18        CLC
  $AB2F  10 F8     BPL $AB29
  $AB31  E0 F0     CPX #$F0
  $AB33  F0 C0     BEQ $AAF5
  $AB35  80        .db $80
  $AB36  00        BRK
  $AB37  00        BRK
  $AB38  F8        SED
  $AB39  E0 F0     CPX #$F0
  $AB3B  F0 C0     BEQ $AAFD
  $AB3D  80        .db $80
  $AB3E  00        BRK
  $AB3F  00        BRK
  $AB40  04        .db $04
  $AB41  0B        .db $0B
  $AB42  1E 3F 1F  ASL $1F3F,X
  $AB45  0B        .db $0B
  $AB46  14        .db $14
  $AB47  1E 07 0F  ASL $0F07,X
  $AB4A  1F        .db $1F
  $AB4B  3F        .db $3F
  $AB4C  1F        .db $1F
  $AB4D  0F        .db $0F
  $AB4E  17        .db $17
  $AB4F  1F        .db $1F
  $AB50  00        BRK
  $AB51  F0 2C     BEQ $AB7F
  $AB53  77        .db $77
  $AB54  E7        .db $E7
  $AB55  8F        .db $8F
  $AB56  1E 7E F0  ASL $F07E,X
  $AB59  FC        .db $FC
  $AB5A  FE FF FF  INC $FFFF,X
  $AB5D  FF        .db $FF
  $AB5E  FE FE 08  INC $08FE,X
  $AB61  0F        .db $0F
  $AB62  08        PHP
  $AB63  1D 1E 18  ORA $181E,X
  $AB66  10 20     BPL $AB88

L_AB68:
  $AB68  0F        .db $0F
  $AB69  0F        .db $0F
  $AB6A  0F        .db $0F
  $AB6B  1F        .db $1F
  $AB6C  1F        .db $1F
  $AB6D  1E 18 20  ASL $2018,X
  $AB70  0C        .db $0C
  $AB71  78        SEI
  $AB72  60        RTS
  $AB73  E0 C0     CPX #$C0
  $AB75  00        BRK

L_AB76:
  $AB76  00        BRK
  $AB77  00        BRK
  $AB78  FC        .db $FC
  $AB79  F8        SED
  $AB7A  E0 E0     CPX #$E0
  $AB7C  C0 00     CPY #$00
  $AB7E  00        BRK

L_AB7F:
  $AB7F  00        BRK
  $AB80  00        BRK
  $AB81  01 03     ORA ($03,X)
  $AB83  07        .db $07
  $AB84  07        .db $07
  $AB85  07        .db $07
  $AB86  07        .db $07
  $AB87  03        .db $03

L_AB88:
  $AB88  00        BRK
  $AB89  01 03     ORA ($03,X)
  $AB8B  07        .db $07
  $AB8C  07        .db $07
  $AB8D  07        .db $07
  $AB8E  07        .db $07
  $AB8F  03        .db $03
  $AB90  70 F8     BVS $AB8A
  $AB92  FC        .db $FC
  $AB93  FC        .db $FC
  $AB94  FA        .db $FA
  $AB95  FA        .db $FA
  $AB96  E2        .db $E2
  $AB97  8C 70 F8  STY $F870
  $AB9A  FC        .db $FC
  $AB9B  FE FF FF  INC $FFFF,X
  $AB9E  FF        .db $FF
  $AB9F  FF        .db $FF
  $ABA0  0F        .db $0F
  $ABA1  0F        .db $0F
  $ABA2  07        .db $07
  $ABA3  07        .db $07
  $ABA4  07        .db $07
  $ABA5  07        .db $07
  $ABA6  04        .db $04
  $ABA7  0C        .db $0C
  $ABA8  0F        .db $0F
  $ABA9  0F        .db $0F
  $ABAA  07        .db $07
  $ABAB  07        .db $07
  $ABAC  07        .db $07
  $ABAD  07        .db $07
  $ABAE  07        .db $07
  $ABAF  0C        .db $0C
  $ABB0  F0 C4     BEQ $AB76
  $ABB2  F8        SED
  $ABB3  80        .db $80
  $ABB4  E0 00     CPX #$00
  $ABB6  00        BRK
  $ABB7  00        BRK
  $ABB8  FE FC FC  INC $FCFC,X
  $ABBB  F8        SED
  $ABBC  E0 C0     CPX #$C0
  $ABBE  00        BRK
  $ABBF  00        BRK
  $ABC0  00        BRK
  $ABC1  00        BRK
  $ABC2  00        BRK
  $ABC3  00        BRK
  $ABC4  00        BRK
  $ABC5  00        BRK
  $ABC6  00        BRK
  $ABC7  00        BRK
  $ABC8  00        BRK
  $ABC9  00        BRK
  $ABCA  00        BRK
  $ABCB  00        BRK
  $ABCC  00        BRK
  $ABCD  00        BRK
  $ABCE  00        BRK
  $ABCF  00        BRK
  $ABD0  00        BRK
  $ABD1  00        BRK
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
  $AC01  0F        .db $0F
  $AC02  30 40     BMI $AC44
  $AC04  E0 DF     CPX #$DF
  $AC06  FD CF 00  SBC $00CF,X
  $AC09  00        BRK
  $AC0A  0F        .db $0F
  $AC0B  3F        .db $3F
  $AC0C  7F        .db $7F
  $AC0D  7F        .db $7F
  $AC0E  7F        .db $7F
  $AC0F  4F        .db $4F
  $AC10  00        BRK
  $AC11  C0 30     CPY #$30
  $AC13  08        PHP
  $AC14  1D FE FF  ORA $FFFE,X
  $AC17  3B        .db $3B
  $AC18  00        BRK
  $AC19  00        BRK
  $AC1A  C0 F0     CPY #$F0
  $AC1C  F8        SED
  $AC1D  F9 FB 3F  SBC $3FFB,Y
  $AC20  00        BRK
  $AC21  00        BRK
  $AC22  00        BRK
  $AC23  00        BRK
  $AC24  C0 40     CPY #$40
  $AC26  40        RTI
  $AC27  80        .db $80
  $AC28  00        BRK
  $AC29  00        BRK
  $AC2A  00        BRK
  $AC2B  00        BRK
  $AC2C  00        BRK
  $AC2D  80        .db $80

L_AC2E:
  $AC2E  80        .db $80
  $AC2F  00        BRK
  $AC30  01 07     ORA ($07,X)
  $AC32  0E 1E 3E  ASL $3E1E
  $AC35  3E 5E 5E  ROL $5E5E,X
  $AC38  00        BRK
  $AC39  00        BRK
  $AC3A  01 01     ORA ($01,X)
  $AC3C  01 01     ORA ($01,X)
  $AC3E  31 39     AND ($39),Y
  $AC40  E6 D5     INC $D5
  $AC42  DB        .db $DB
  $AC43  DB        .db $DB

L_AC44:
  $AC44  C0 6F     CPY #$6F
  $AC46  B0 3F     BCS $AC87
  $AC48  46 44     LSR $44
  $AC4A  44        .db $44
  $AC4B  44        .db $44
  $AC4C  64        .db $64
  $AC4D  B0 DF     BCS $AC2E
  $AC4F  E7        .db $E7
  $AC50  DF        .db $DF
  $AC51  9F        .db $9F
  $AC52  1F        .db $1F
  $AC53  1F        .db $1F
  $AC54  1F        .db $1F
  $AC55  BF        .db $BF
  $AC56  7F        .db $7F
  $AC57  FF        .db $FF
  $AC58  3E 3D 3B  ROL $3B3D,X
  $AC5B  3B        .db $3B

L_AC5C:
  $AC5C  7B        .db $7B
  $AC5D  77        .db $77
  $AC5E  EF        .db $EF
  $AC5F  9F        .db $9F
  $AC60  E0 F0     CPX #$F0
  $AC62  F0 F8     BEQ $AC5C
  $AC64  FC        .db $FC
  $AC65  FC        .db $FC
  $AC66  FA        .db $FA
  $AC67  FA        .db $FA
  $AC68  00        BRK
  $AC69  00        BRK
  $AC6A  00        BRK
  $AC6B  80        .db $80
  $AC6C  80        .db $80
  $AC6D  80        .db $80
  $AC6E  8C 9C AA  STY $AA9C
  $AC71  9A        TXS
  $AC72  BE DE 7E  LDX $7EDE,Y
  $AC75  39 03 07  AND $0703,Y
  $AC78  71 71     ADC ($71),Y
  $AC7A  79 79 39  ADC $3979,Y
  $AC7D  00        BRK
  $AC7E  00        BRK
  $AC7F  00        BRK
  $AC80  CF        .db $CF
  $AC81  0B        .db $0B
  $AC82  57        .db $57
  $AC83  35 DB     AND $DB,X
  $AC85  56 D3     LSR $D3,X

L_AC87:
  $AC87  FD F0 FF  SBC $FFF0,X
  $AC8A  FF        .db $FF
  $AC8B  FF        .db $FF
  $AC8C  FF        .db $FF
  $AC8D  FF        .db $FF
  $AC8E  3F        .db $3F
  $AC8F  07        .db $07
  $AC90  FF        .db $FF
  $AC91  BF        .db $BF
  $AC92  FF        .db $FF
  $AC93  FF        .db $FF
  $AC94  DF        .db $DF
  $AC95  FF        .db $FF
  $AC96  FF        .db $FF
  $AC97  FF        .db $FF
  $AC98  7F        .db $7F
  $AC99  FF        .db $FF

L_AC9A:
  $AC9A  FF        .db $FF
  $AC9B  FF        .db $FF
  $AC9C  FF        .db $FF
  $AC9D  FF        .db $FF
  $AC9E  FC        .db $FC
  $AC9F  E0 D5     CPX #$D5
  $ACA1  D9 FD FB  CMP $FBFD,Y
  $ACA4  FE 9C C0  INC $C09C,X
  $ACA7  E0 8E     CPX #$8E
  $ACA9  8E 9E 9E  STX $9E9E
  $ACAC  9C        .db $9C
  $ACAD  00        BRK
  $ACAE  00        BRK
  $ACAF  00        BRK
  $ACB0  0F        .db $0F
  $ACB1  13        .db $13
  $ACB2  27        .db $27
  $ACB3  2B        .db $2B
  $ACB4  3F        .db $3F
  $ACB5  45 9F     EOR $9F
  $ACB7  FF        .db $FF
  $ACB8  00        BRK
  $ACB9  0C        .db $0C
  $ACBA  1E 1F 0F  ASL $0F1F,X
  $ACBD  3F        .db $3F
  $ACBE  7F        .db $7F
  $ACBF  00        BRK
  $ACC0  FF        .db $FF
  $ACC1  FF        .db $FF
  $ACC2  F8        SED
  $ACC3  E0 C0     CPX #$C0
  $ACC5  C0 C0     CPY #$C0
  $ACC7  C0 00     CPY #$00
  $ACC9  00        BRK
  $ACCA  00        BRK
  $ACCB  00        BRK
  $ACCC  00        BRK
  $ACCD  80        .db $80
  $ACCE  80        .db $80
  $ACCF  00        BRK
  $ACD0  F0 C8     BEQ $AC9A
  $ACD2  E4 F4     CPX $F4
  $ACD4  DC        .db $DC
  $ACD5  E2        .db $E2
  $ACD6  F9 FF 00  SBC $00FF,Y
  $ACD9  30 78     BMI $AD53
  $ACDB  F8        SED
  $ACDC  F0 FC     BEQ $ACDA
  $ACDE  FE 00 00  INC $0000,X
  $ACE1  00        BRK
  $ACE2  0F        .db $0F
  $ACE3  30 40     BMI $AD25
  $ACE5  E0 DF     CPX #$DF
  $ACE7  FD 00 00  SBC $0000,X
  $ACEA  00        BRK
  $ACEB  0F        .db $0F
  $ACEC  3F        .db $3F
  $ACED  7F        .db $7F
  $ACEE  7F        .db $7F
  $ACEF  7F        .db $7F
  $ACF0  00        BRK
  $ACF1  00        BRK
  $ACF2  C0 30     CPY #$30
  $ACF4  08        PHP
  $ACF5  1D FE FF  ORA $FFFE,X
  $ACF8  00        BRK
  $ACF9  00        BRK
  $ACFA  00        BRK
  $ACFB  C0 F0     CPY #$F0
  $ACFD  F8        SED
  $ACFE  F9 FB 00  SBC $00FB,Y
  $AD01  00        BRK
  $AD02  00        BRK
  $AD03  00        BRK
  $AD04  00        BRK
  $AD05  80        .db $80
  $AD06  40        RTI
  $AD07  40        RTI
  $AD08  00        BRK
  $AD09  00        BRK
  $AD0A  00        BRK
  $AD0B  00        BRK
  $AD0C  00        BRK
  $AD0D  00        BRK
  $AD0E  80        .db $80
  $AD0F  80        .db $80
  $AD10  1C        .db $1C
  $AD11  73        .db $73
  $AD12  F9 FD FD  SBC $FDFD,Y
  $AD15  FF        .db $FF
  $AD16  7F        .db $7F
  $AD17  1F        .db $1F
  $AD18  00        BRK
  $AD19  1C        .db $1C
  $AD1A  3E 3E 3E  ROL $3E3E,X
  $AD1D  1A        .db $1A
  $AD1E  00        BRK
  $AD1F  00        BRK
  $AD20  CF        .db $CF
  $AD21  E6 D5     INC $D5
  $AD23  DB        .db $DB
  $AD24  DB        .db $DB

L_AD25:
  $AD25  C0 67     CPY #$67

L_AD27:
  $AD27  37        .db $37
  $AD28  4F        .db $4F
  $AD29  46 44     LSR $44
  $AD2B  44        .db $44
  $AD2C  44        .db $44
  $AD2D  64        .db $64
  $AD2E  B8        CLV
  $AD2F  D8        CLD
  $AD30  3B        .db $3B
  $AD31  DF        .db $DF
  $AD32  9F        .db $9F
  $AD33  1F        .db $1F
  $AD34  1F        .db $1F
  $AD35  1F        .db $1F
  $AD36  3F        .db $3F
  $AD37  79 3F 3E  ADC $3E3F,Y
  $AD3A  3C        .db $3C
  $AD3B  38        SEC
  $AD3C  38        SEC
  $AD3D  7A        .db $7A

L_AD3E:
  $AD3E  F0 E7     BEQ $AD27
  $AD40  80        .db $80
  $AD41  80        .db $80
  $AD42  E0 F0     CPX #$F0
  $AD44  F0 F8     BEQ $AD3E
  $AD46  F8        SED
  $AD47  B8        CLV
  $AD48  00        BRK
  $AD49  00        BRK
  $AD4A  00        BRK
  $AD4B  00        BRK
  $AD4C  00        BRK
  $AD4D  00        BRK
  $AD4E  00        BRK
  $AD4F  40        RTI
  $AD50  53        .db $53
  $AD51  45 59     EOR $59

L_AD53:
  $AD53  41 4A     EOR ($4A,X)
  $AD55  46 5B     LSR $5B
  $AD57  EA        NOP
  $AD58  3C        .db $3C
  $AD59  3F        .db $3F
  $AD5A  3F        .db $3F
  $AD5B  3F        .db $3F
  $AD5C  3F        .db $3F
  $AD5D  3F        .db $3F
  $AD5E  3F        .db $3F
  $AD5F  1F        .db $1F
  $AD60  FE FF DF  INC $DFFF,X
  $AD63  77        .db $77
  $AD64  FF        .db $FF
  $AD65  BF        .db $BF
  $AD66  7B        .db $7B
  $AD67  DF        .db $DF
  $AD68  F1 0D     SBC ($0D),Y
  $AD6A  FD FE FF  SBC $FFFE,X
  $AD6D  FF        .db $FF
  $AD6E  FF        .db $FF

L_AD6F:
  $AD6F  FF        .db $FF
  $AD70  CF        .db $CF
  $AD71  BE FC F8  LDX $F8FC,Y
  $AD74  F8        SED
  $AD75  F8        SED
  $AD76  F8        SED
  $AD77  FC        .db $FC
  $AD78  FC        .db $FC
  $AD79  FC        .db $FC
  $AD7A  F8        SED
  $AD7B  E0 10     CPX #$10
  $AD7D  F0 F0     BEQ $AD6F
  $AD7F  E0 1F     CPX #$1F
  $AD81  3F        .db $3F
  $AD82  27        .db $27
  $AD83  5F        .db $5F
  $AD84  7B        .db $7B
  $AD85  77        .db $77
  $AD86  9F        .db $9F
  $AD87  FF        .db $FF
  $AD88  00        BRK
  $AD89  00        BRK
  $AD8A  1C        .db $1C
  $AD8B  3E 3F 0F  ROL $0F3F,X
  $AD8E  7F        .db $7F
  $AD8F  00        BRK
  $AD90  D3        .db $D3
  $AD91  FD FF C0  SBC $C0FF,X
  $AD94  80        .db $80
  $AD95  C0 C0     CPY #$C0
  $AD97  C0 3F     CPY #$3F
  $AD99  07        .db $07
  $AD9A  00        BRK
  $AD9B  00        BRK
  $AD9C  00        BRK
  $AD9D  80        .db $80
  $AD9E  80        .db $80
  $AD9F  00        BRK
  $ADA0  FF        .db $FF
  $ADA1  FF        .db $FF
  $ADA2  FF        .db $FF
  $ADA3  03        .db $03
  $ADA4  01 03     ORA ($03,X)
  $ADA6  03        .db $03
  $ADA7  03        .db $03
  $ADA8  FC        .db $FC
  $ADA9  E0 00     CPX #$00
  $ADAB  00        BRK
  $ADAC  00        BRK
  $ADAD  00        BRK
  $ADAE  01 00     ORA ($00,X)
  $ADB0  F0 F8     BEQ $ADAA
  $ADB2  E4 F2     CPX $F2
  $ADB4  FA        .db $FA
  $ADB5  E6 F9     INC $F9
  $ADB7  FF        .db $FF
  $ADB8  00        BRK
  $ADB9  00        BRK

L_ADBA:
  $ADBA  38        SEC
  $ADBB  7C        .db $7C
  $ADBC  FC        .db $FC
  $ADBD  F8        SED
  $ADBE  FE 00 00  INC $0000,X
  $ADC1  00        BRK
  $ADC2  03        .db $03
  $ADC3  0F        .db $0F
  $ADC4  1F        .db $1F
  $ADC5  1F        .db $1F
  $ADC6  3F        .db $3F
  $ADC7  3C        .db $3C
  $ADC8  00        BRK
  $ADC9  00        BRK
  $ADCA  00        BRK
  $ADCB  00        BRK
  $ADCC  00        BRK
  $ADCD  00        BRK
  $ADCE  00        BRK
  $ADCF  03        .db $03
  $ADD0  CF        .db $CF
  $ADD1  E6 D5     INC $D5
  $ADD3  DB        .db $DB
  $ADD4  DB        .db $DB
  $ADD5  C0 E7     CPY #$E7
  $ADD7  F7        .db $F7
  $ADD8  4F        .db $4F
  $ADD9  46 44     LSR $44
  $ADDB  44        .db $44
  $ADDC  44        .db $44
  $ADDD  64        .db $64
  $ADDE  38        SEC
  $ADDF  18        CLC
  $ADE0  3B        .db $3B
  $ADE1  DF        .db $DF
  $ADE2  9F        .db $9F
  $ADE3  1F        .db $1F
  $ADE4  1F        .db $1F
  $ADE5  1F        .db $1F
  $ADE6  3F        .db $3F
  $ADE7  7F        .db $7F
  $ADE8  3F        .db $3F
  $ADE9  3E 3C 38  ROL $383C,X
  $ADEC  38        SEC
  $ADED  7B        .db $7B
  $ADEE  F7        .db $F7
  $ADEF  EF        .db $EF
  $ADF0  F0 C8     BEQ $ADBA
  $ADF2  B4 CA     LDY $CA,X
  $ADF4  F6 FF     INC $FF,X
  $ADF6  FF        .db $FF
  $ADF7  FF        .db $FF
  $ADF8  00        BRK
  $ADF9  30 78     BMI $AE73
  $ADFB  7C        .db $7C
  $ADFC  7C        .db $7C
  $ADFD  5C        .db $5C
  $ADFE  98        TYA
  $ADFF  80        .db $80
  $AE00  3F        .db $3F
  $AE01  1F        .db $1F
  $AE02  1F        .db $1F
  $AE03  0F        .db $0F
  $AE04  03        .db $03
  $AE05  02        .db $02
  $AE06  06 0F     ASL $0F
  $AE08  06 06     ASL $06
  $AE0A  03        .db $03
  $AE0B  01 00     ORA ($00,X)
  $AE0D  01 01     ORA ($01,X)
  $AE0F  00        BRK
  $AE10  9F        .db $9F
  $AE11  5F        .db $5F
  $AE12  F6 F3     INC $F3,X
  $AE14  FF        .db $FF
  $AE15  F5 DB     SBC $DB,X
  $AE17  56 E7     LSR $E7,X
  $AE19  E8        INX
  $AE1A  EF        .db $EF
  $AE1B  EF        .db $EF
  $AE1C  EF        .db $EF
  $AE1D  1F        .db $1F
  $AE1E  FF        .db $FF
  $AE1F  FF        .db $FF
  $AE20  FF        .db $FF
  $AE21  FF        .db $FF
  $AE22  FF        .db $FF
  $AE23  BF        .db $BF
  $AE24  FF        .db $FF
  $AE25  FF        .db $FF
  $AE26  DF        .db $DF
  $AE27  FF        .db $FF
  $AE28  9F        .db $9F
  $AE29  7F        .db $7F
  $AE2A  FF        .db $FF
  $AE2B  FF        .db $FF
  $AE2C  FF        .db $FF
  $AE2D  FF        .db $FF
  $AE2E  FF        .db $FF
  $AE2F  FF        .db $FF
  $AE30  FF        .db $FF
  $AE31  FE DC C0  INC $C0DC,X
  $AE34  C0 C0     CPY #$C0
  $AE36  C0 E0     CPY #$E0
  $AE38  80        .db $80
  $AE39  80        .db $80
  $AE3A  80        .db $80
  $AE3B  80        .db $80
  $AE3C  80        .db $80
  $AE3D  80        .db $80
  $AE3E  80        .db $80

L_AE3F:
  $AE3F  00        BRK
  $AE40  00        BRK
  $AE41  00        BRK
  $AE42  01 07     ORA ($07,X)
  $AE44  0E 1E 3E  ASL $3E1E
  $AE47  3E 00 00  ROL $0000,X
  $AE4A  00        BRK
  $AE4B  00        BRK
  $AE4C  01 01     ORA ($01,X)
  $AE4E  01 01     ORA ($01,X)
  $AE50  CF        .db $CF
  $AE51  E6 D5     INC $D5
  $AE53  DB        .db $DB
  $AE54  DB        .db $DB
  $AE55  C0 6F     CPY #$6F
  $AE57  30 4F     BMI $AEA8
  $AE59  46 44     LSR $44
  $AE5B  44        .db $44
  $AE5C  44        .db $44
  $AE5D  64        .db $64
  $AE5E  B0 DF     BCS $AE3F
  $AE60  3B        .db $3B
  $AE61  DF        .db $DF
  $AE62  9F        .db $9F
  $AE63  1F        .db $1F
  $AE64  1F        .db $1F
  $AE65  1F        .db $1F
  $AE66  BF        .db $BF
  $AE67  7F        .db $7F
  $AE68  3F        .db $3F
  $AE69  3E 3D 3B  ROL $3B3D,X
  $AE6C  3B        .db $3B
  $AE6D  7B        .db $7B

L_AE6E:
  $AE6E  77        .db $77
  $AE6F  EF        .db $EF
  $AE70  80        .db $80
  $AE71  80        .db $80
  $AE72  E0 F0     CPX #$F0
  $AE74  F0 F8     BEQ $AE6E
  $AE76  FC        .db $FC
  $AE77  FC        .db $FC
  $AE78  00        BRK
  $AE79  00        BRK
  $AE7A  00        BRK
  $AE7B  00        BRK
  $AE7C  00        BRK
  $AE7D  80        .db $80
  $AE7E  80        .db $80
  $AE7F  80        .db $80
  $AE80  5E 5E AA  LSR $AA5E,X
  $AE83  9A        TXS
  $AE84  BE DE 7E  LDX $7EDE,Y
  $AE87  3F        .db $3F
  $AE88  31 39     AND ($39),Y
  $AE8A  71 71     ADC ($71),Y
  $AE8C  79 79 39  ADC $3979,Y
  $AE8F  00        BRK
  $AE90  9F        .db $9F
  $AE91  2F        .db $2F
  $AE92  CE 0B 57  DEC $570B
  $AE95  35 DB     AND $DB,X
  $AE97  56 E7     LSR $E7,X
  $AE99  F8        SED
  $AE9A  FF        .db $FF
  $AE9B  FF        .db $FF
  $AE9C  FF        .db $FF
  $AE9D  FF        .db $FF
  $AE9E  FF        .db $FF
  $AE9F  FF        .db $FF
  $AEA0  FA        .db $FA
  $AEA1  FA        .db $FA
  $AEA2  D5 D9     CMP $D9,X
  $AEA4  FD FB FE  SBC $FEFB,X
  $AEA7  FC        .db $FC

L_AEA8:
  $AEA8  8C 9C 8E  STY $8E9C
  $AEAB  8E 9E 9E  STX $9E9E
  $AEAE  9C        .db $9C
  $AEAF  00        BRK
  $AEB0  00        BRK
  $AEB1  00        BRK
  $AEB2  00        BRK
  $AEB3  00        BRK
  $AEB4  00        BRK
  $AEB5  00        BRK
  $AEB6  07        .db $07
  $AEB7  1F        .db $1F
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
  $AEC4  80        .db $80
  $AEC5  40        RTI
  $AEC6  60        RTS

L_AEC7:
  $AEC7  F8        SED
  $AEC8  00        BRK
  $AEC9  00        BRK
  $AECA  00        BRK
  $AECB  00        BRK
  $AECC  00        BRK
  $AECD  80        .db $80

L_AECE:
  $AECE  80        .db $80
  $AECF  00        BRK
  $AED0  3F        .db $3F
  $AED1  5E 5E AE  LSR $AE5E,X
  $AED4  9A        TXS
  $AED5  BE DE 7E  LDX $7EDE,Y
  $AED8  00        BRK
  $AED9  31 39     AND ($39),Y
  $AEDB  71 71     ADC ($71),Y
  $AEDD  79 79 39  ADC $3979,Y
  $AEE0  E6 D5     INC $D5
  $AEE2  DB        .db $DB
  $AEE3  DB        .db $DB
  $AEE4  C0 EF     CPY #$EF
  $AEE6  30 DF     BMI $AEC7
  $AEE8  46 44     LSR $44
  $AEEA  44        .db $44
  $AEEB  44        .db $44
  $AEEC  64        .db $64
  $AEED  B0 DF     BCS $AECE
  $AEEF  E7        .db $E7
  $AEF0  FC        .db $FC
  $AEF1  FA        .db $FA
  $AEF2  FA        .db $FA
  $AEF3  F5 D9     SBC $D9,X
  $AEF5  FD FB FE  SBC $FEFB,X
  $AEF8  00        BRK
  $AEF9  0C        .db $0C
  $AEFA  9C        .db $9C
  $AEFB  8E 8E 9E  STX $9E8E
  $AEFE  9E        .db $9E
  $AEFF  9C        .db $9C
  $AF00  3A        .db $3A
  $AF01  02        .db $02
  $AF02  02        .db $02
  $AF03  06 0F     ASL $0F
  $AF05  1F        .db $1F
  $AF06  13        .db $13
  $AF07  27        .db $27
  $AF08  01 01     ORA ($01,X)
  $AF0A  01 01     ORA ($01,X)
  $AF0C  00        BRK
  $AF0D  00        BRK
  $AF0E  0C        .db $0C
  $AF0F  1E 0F 57  ASL $570F,X
  $AF12  35 DB     AND $DB,X
  $AF14  56 D3     LSR $D3,X
  $AF16  FD FF F0  SBC $F0FF,X
  $AF19  FF        .db $FF
  $AF1A  FF        .db $FF
  $AF1B  FF        .db $FF
  $AF1C  FF        .db $FF
  $AF1D  3F        .db $3F
  $AF1E  07        .db $07
  $AF1F  00        BRK
  $AF20  BF        .db $BF
  $AF21  FF        .db $FF
  $AF22  FF        .db $FF
  $AF23  DF        .db $DF
  $AF24  FF        .db $FF
  $AF25  FF        .db $FF
  $AF26  FF        .db $FF
  $AF27  FF        .db $FF
  $AF28  7F        .db $7F
  $AF29  FF        .db $FF
  $AF2A  FF        .db $FF
  $AF2B  FF        .db $FF
  $AF2C  FF        .db $FF
  $AF2D  FC        .db $FC
  $AF2E  E0 00     CPX #$00
  $AF30  DC        .db $DC
  $AF31  C0 C0     CPY #$C0
  $AF33  E0 F0     CPX #$F0
  $AF35  F8        SED
  $AF36  C8        INY
  $AF37  E4 80     CPX $80
  $AF39  80        .db $80
  $AF3A  80        .db $80
  $AF3B  80        .db $80
  $AF3C  00        BRK
  $AF3D  00        BRK
  $AF3E  30 78     BMI $AFB8
  $AF40  2B        .db $2B
  $AF41  3F        .db $3F
  $AF42  25 5F     AND $5F
  $AF44  7E 78 00  ROR $0078,X
  $AF47  00        BRK
  $AF48  1F        .db $1F
  $AF49  07        .db $07
  $AF4A  1F        .db $1F
  $AF4B  3E 38 00  ROL $0038,X
  $AF4E  00        BRK
  $AF4F  00        BRK
  $AF50  C0 C0     CPY #$C0
  $AF52  C0 80     CPY #$80
  $AF54  00        BRK
  $AF55  00        BRK
  $AF56  00        BRK
  $AF57  00        BRK
  $AF58  00        BRK
  $AF59  80        .db $80
  $AF5A  80        .db $80
  $AF5B  00        BRK
  $AF5C  00        BRK
  $AF5D  00        BRK
  $AF5E  00        BRK
  $AF5F  00        BRK
  $AF60  F4        .db $F4
  $AF61  FC        .db $FC
  $AF62  E4 FA     CPX $FA
  $AF64  7E 0E 00  ROR $000E,X
  $AF67  00        BRK
  $AF68  F8        SED
  $AF69  E0 F8     CPX #$F8
  $AF6B  7C        .db $7C
  $AF6C  0C        .db $0C
  $AF6D  00        BRK
  $AF6E  00        BRK
  $AF6F  00        BRK
  $AF70  00        BRK
  $AF71  00        BRK
  $AF72  00        BRK
  $AF73  00        BRK
  $AF74  00        BRK
  $AF75  07        .db $07
  $AF76  18        CLC
  $AF77  20 00 00  JSR $0000
  $AF7A  00        BRK
  $AF7B  00        BRK
  $AF7C  00        BRK
  $AF7D  00        BRK
  $AF7E  07        .db $07
  $AF7F  1F        .db $1F
  $AF80  00        BRK
  $AF81  00        BRK
  $AF82  00        BRK
  $AF83  00        BRK
  $AF84  00        BRK
  $AF85  01 07     ORA ($07,X)
  $AF87  0F        .db $0F
  $AF88  00        BRK
  $AF89  00        BRK
  $AF8A  00        BRK
  $AF8B  00        BRK
  $AF8C  00        BRK
  $AF8D  00        BRK
  $AF8E  00        BRK
  $AF8F  00        BRK
  $AF90  70 6F     BVS $B001
  $AF92  7E 67 73  ROR $7367,X
  $AF95  EA        NOP
  $AF96  ED ED 3F  SBC $3FED
  $AF99  3F        .db $3F
  $AF9A  3F        .db $3F
  $AF9B  27        .db $27
  $AF9C  23        .db $23
  $AF9D  22        .db $22
  $AF9E  22        .db $22
  $AF9F  22        .db $22
  $AFA0  0E FF FF  ASL $FFFF
  $AFA3  9D 6F CF  STA $CF6F,X
  $AFA6  8F        .db $8F
  $AFA7  8F        .db $8F
  $AFA8  FC        .db $FC
  $AFA9  FC        .db $FC
  $AFAA  FD 9F 1F  SBC $1F9F,X
  $AFAD  1E 1C 1C  ASL $1C1C,X
  $AFB0  C0 20     CPY #$20
  $AFB2  A0 C0     LDY #$C0
  $AFB4  C0 F0     CPY #$F0
  $AFB6  F8        SED
  $AFB7  F8        SED

L_AFB8:
  $AFB8  00        BRK
  $AFB9  C0 C0     CPY #$C0
  $AFBB  80        .db $80
  $AFBC  00        BRK
  $AFBD  00        BRK
  $AFBE  00        BRK
  $AFBF  00        BRK
  $AFC0  0F        .db $0F
  $AFC1  1F        .db $1F
  $AFC2  1E 1F 0F  ASL $0F1F,X
  $AFC5  0F        .db $0F
  $AFC6  07        .db $07
  $AFC7  03        .db $03
  $AFC8  00        BRK
  $AFC9  00        BRK
  $AFCA  01 03     ORA ($03,X)
  $AFCC  03        .db $03
  $AFCD  01 00     ORA ($00,X)
  $AFCF  00        BRK
  $AFD0  E0 F7     CPX #$F7
  $AFD2  78        SEI
  $AFD3  CF        .db $CF
  $AFD4  AF        .db $AF
  $AFD5  FB        .db $FB
  $AFD6  F9 FF 32  SBC $32FF,Y
  $AFD9  18        CLC
  $AFDA  8F        .db $8F
  $AFDB  73        .db $73
  $AFDC  74        .db $74
  $AFDD  F7        .db $F7

L_AFDE:
  $AFDE  F7        .db $F7
  $AFDF  77        .db $77
  $AFE0  0F        .db $0F
  $AFE1  DF        .db $DF
  $AFE2  3C        .db $3C
  $AFE3  FB        .db $FB
  $AFE4  FE 7F DF  INC $DF7F,X
  $AFE7  FF        .db $FF
  $AFE8  3D 38 F3  AND $F338,X
  $AFEB  C7        .db $C7
  $AFEC  37        .db $37
  $AFED  F7        .db $F7
  $AFEE  FB        .db $FB
  $AFEF  FC        .db $FC
  $AFF0  FC        .db $FC
  $AFF1  FC        .db $FC
  $AFF2  DC        .db $DC
  $AFF3  3C        .db $3C
  $AFF4  F8        SED
  $AFF5  F0 E0     BEQ $AFD7
  $AFF7  F0 00     BEQ $AFF9

L_AFF9:
  $AFF9  00        BRK
  $AFFA  A0 F0     LDY #$F0
  $AFFC  F0 E0     BEQ $AFDE
  $AFFE  80        .db $80
  $AFFF  40        RTI
  $B000  07        .db $07

L_B001:
  $B001  0F        .db $0F
  $B002  0B        .db $0B
  $B003  17        .db $17
  $B004  14        .db $14
  $B005  0D 13 1F  ORA $1F13
  $B008  00        BRK
  $B009  00        BRK
  $B00A  06 0F     ASL $0F
  $B00C  0F        .db $0F
  $B00D  03        .db $03
  $B00E  0F        .db $0F
  $B00F  00        BRK
  $B010  7A        .db $7A
  $B011  6D AB E9  ADC $E9AB
  $B014  FE F3 F8  INC $F8F3,X
  $B017  F8        SED
  $B018  8F        .db $8F
  $B019  FF        .db $FF
  $B01A  7F        .db $7F
  $B01B  9F        .db $9F
  $B01C  C3        .db $C3
  $B01D  E0 F0     CPX #$F0
  $B01F  00        BRK
  $B020  FF        .db $FF
  $B021  EF        .db $EF
  $B022  7F        .db $7F
  $B023  FF        .db $FF
  $B024  FF        .db $FF
  $B025  F1 03     SBC ($03),Y
  $B027  03        .db $03
  $B028  FF        .db $FF
  $B029  FF        .db $FF
  $B02A  FF        .db $FF
  $B02B  FE F0 00  INC $00F0,X
  $B02E  01 00     ORA ($00,X)
  $B030  F8        SED
  $B031  FC        .db $FC
  $B032  E4 F2     CPX $F2
  $B034  FA        .db $FA
  $B035  E6 F9     INC $F9
  $B037  FF        .db $FF
  $B038  C0 C0     CPY #$C0
  $B03A  B8        CLV
  $B03B  7C        .db $7C

L_B03C:
  $B03C  FC        .db $FC
  $B03D  F8        SED
  $B03E  FE 00 03  INC $0300,X
  $B041  04        .db $04
  $B042  0B        .db $0B
  $B043  0F        .db $0F
  $B044  0F        .db $0F
  $B045  07        .db $07
  $B046  03        .db $03
  $B047  01 00     ORA ($00,X)
  $B049  03        .db $03
  $B04A  07        .db $07
  $B04B  07        .db $07
  $B04C  07        .db $07
  $B04D  03        .db $03
  $B04E  01 00     ORA ($00,X)
  $B050  00        BRK
  $B051  B0 48     BCS $B09B
  $B053  B0 71     BCS $B0C6
  $B055  F3        .db $F3
  $B056  F3        .db $F3
  $B057  FB        .db $FB
  $B058  00        BRK
  $B059  00        BRK
  $B05A  B0 E0     BCS $B03C
  $B05C  E0 E1     CPX #$E1
  $B05E  C1 C1     CMP ($C1,X)
  $B060  00        BRK
  $B061  00        BRK
  $B062  3F        .db $3F
  $B063  C0 00     CPY #$00
  $B065  80        .db $80
  $B066  7F        .db $7F
  $B067  F7        .db $F7
  $B068  00        BRK
  $B069  00        BRK
  $B06A  00        BRK
  $B06B  3F        .db $3F
  $B06C  FF        .db $FF
  $B06D  FF        .db $FF
  $B06E  FF        .db $FF
  $B06F  FF        .db $FF
  $B070  00        BRK
  $B071  00        BRK
  $B072  00        BRK
  $B073  C1 20     CMP ($20,X)
  $B075  77        .db $77
  $B076  F9 FD 00  SBC $00FD,Y
  $B079  00        BRK
  $B07A  00        BRK
  $B07B  00        BRK
  $B07C  C0 E0     CPY #$E0
  $B07E  E6 EE     INC $EE
  $B080  0E 13 EF  ASL $EF13
  $B083  3F        .db $3F
  $B084  CF        .db $CF
  $B085  EE 7C 7C  INC $7C7C
  $B088  00        BRK
  $B089  0E 1E DE  ASL $DE1E
  $B08C  7E 7C 38  ROR $387C,X
  $B08F  18        CLC
  $B090  FF        .db $FF
  $B091  FF        .db $FF
  $B092  7F        .db $7F
  $B093  7F        .db $7F
  $B094  3F        .db $3F
  $B095  1F        .db $1F
  $B096  0D 05 01  ORA $0105
  $B099  01 01     ORA ($01,X)

L_B09B:
  $B09B  01 01     ORA ($01,X)
  $B09D  01 02     ORA ($02,X)
  $B09F  03        .db $03
  $B0A0  3C        .db $3C
  $B0A1  9B        .db $9B
  $B0A2  56 6C     LSR $6C,X
  $B0A4  6C 00 9C  JMP ($9C00)
  $B0A7  DD 3C 18  CMP $183C,X
  $B0AA  10 10     BPL $B0BC
  $B0AC  10 91     BPL $B03F
  $B0AE  E3        .db $E3
  $B0AF  63        .db $63
  $B0B0  EE 7F 7F  INC $7F7F
  $B0B3  7F        .db $7F
  $B0B4  7F        .db $7F

L_B0B5:
  $B0B5  7F        .db $7F
  $B0B6  FF        .db $FF
  $B0B7  FF        .db $FF
  $B0B8  FC        .db $FC
  $B0B9  FA        .db $FA
  $B0BA  F6 EF     INC $EF,X

L_B0BC:
  $B0BC  EF        .db $EF
  $B0BD  EF        .db $EF
  $B0BE  DF        .db $DF
  $B0BF  BF        .db $BF
  $B0C0  F8        SED
  $B0C1  F8        SED
  $B0C2  F8        SED
  $B0C3  F0 F0     BEQ $B0B5
  $B0C5  E0 C0     CPX #$C0
  $B0C7  C0 00     CPY #$00
  $B0C9  00        BRK
  $B0CA  00        BRK
  $B0CB  00        BRK
  $B0CC  00        BRK
  $B0CD  00        BRK
  $B0CE  00        BRK
  $B0CF  00        BRK
  $B0D0  08        PHP
  $B0D1  0B        .db $0B
  $B0D2  08        PHP
  $B0D3  09 08     ORA #$08
  $B0D5  0B        .db $0B
  $B0D6  0D 1F 07  ORA $071F
  $B0D9  07        .db $07
  $B0DA  07        .db $07
  $B0DB  07        .db $07

L_B0DC:
  $B0DC  07        .db $07
  $B0DD  07        .db $07
  $B0DE  03        .db $03
  $B0DF  00        BRK
  $B0E0  FF        .db $FF
  $B0E1  3F        .db $3F
  $B0E2  2E 5F D7  ROL $D75F
  $B0E5  6F        .db $6F
  $B0E6  5B        .db $5B
  $B0E7  4F        .db $4F
  $B0E8  3C        .db $3C
  $B0E9  C3        .db $C3
  $B0EA  FF        .db $FF
  $B0EB  FF        .db $FF
  $B0EC  FF        .db $FF
  $B0ED  FF        .db $FF
  $B0EE  FF        .db $FF
  $B0EF  FF        .db $FF
  $B0F0  FF        .db $FF
  $B0F1  FF        .db $FF
  $B0F2  FF        .db $FF
  $B0F3  FF        .db $FF
  $B0F4  FF        .db $FF
  $B0F5  7F        .db $7F
  $B0F6  FF        .db $FF
  $B0F7  FF        .db $FF
  $B0F8  FE FE FE  INC $FEFE,X
  $B0FB  FE FE FE  INC $FEFE,X
  $B0FE  FC        .db $FC
  $B0FF  F0 1F     BEQ $B120
  $B101  3F        .db $3F
  $B102  27        .db $27
  $B103  4F        .db $4F
  $B104  5B        .db $5B
  $B105  77        .db $77
  $B106  9F        .db $9F
  $B107  FF        .db $FF
  $B108  00        BRK
  $B109  00        BRK
  $B10A  1C        .db $1C
  $B10B  3E 3F 1F  ROL $1F3F,X
  $B10E  7F        .db $7F
  $B10F  00        BRK
  $B110  F3        .db $F3
  $B111  FF        .db $FF
  $B112  FF        .db $FF
  $B113  C0 80     CPY #$80
  $B115  C0 C0     CPY #$C0
  $B117  C0 0F     CPY #$0F
  $B119  00        BRK
  $B11A  00        BRK
  $B11B  00        BRK
  $B11C  00        BRK
  $B11D  80        .db $80
  $B11E  80        .db $80
  $B11F  00        BRK

L_B120:
  $B120  FF        .db $FF
  $B121  FF        .db $FF
  $B122  FF        .db $FF
  $B123  3F        .db $3F
  $B124  0F        .db $0F
  $B125  07        .db $07
  $B126  03        .db $03
  $B127  03        .db $03
  $B128  C0 00     CPY #$00
  $B12A  00        BRK
  $B12B  01 01     ORA ($01,X)
  $B12D  03        .db $03
  $B12E  01 00     ORA ($00,X)
  $B130  C0 E0     CPY #$E0
  $B132  D0 A8     BNE $B0DC
  $B134  CC F6 F3  CPY $F3F6
  $B137  FF        .db $FF
  $B138  00        BRK
  $B139  40        RTI

L_B13A:
  $B13A  E0 F0     CPX #$F0
  $B13C  F0 FC     BEQ $B13A
  $B13E  FE 00 C3  INC $C300,X
  $B141  64        .db $64
  $B142  28        PLP
  $B143  00        BRK
  $B144  00        BRK
  $B145  00        BRK
  $B146  00        BRK
  $B147  00        BRK
  $B148  C3        .db $C3
  $B149  64        .db $64
  $B14A  A9 83     LDA #$83
  $B14C  83        .db $83
  $B14D  6E 00 00  ROR $0000
  $B150  60        RTS
  $B151  7C        .db $7C
  $B152  7F        .db $7F
  $B153  7F        .db $7F
  $B154  7F        .db $7F
  $B155  7F        .db $7F
  $B156  7F        .db $7F
  $B157  3F        .db $3F
  $B158  00        BRK
  $B159  20 3C 2F  JSR $2F3C
  $B15C  37        .db $37
  $B15D  30 35     BMI $B194
  $B15F  14        .db $14
  $B160  00        BRK
  $B161  00        BRK
  $B162  80        .db $80
  $B163  E0 F0     CPX #$F0
  $B165  F8        SED
  $B166  FC        .db $FC
  $B167  FC        .db $FC
  $B168  00        BRK
  $B169  00        BRK
  $B16A  00        BRK
  $B16B  80        .db $80
  $B16C  20 F0 C8  JSR $C8F0
  $B16F  38        SEC
  $B170  3F        .db $3F
  $B171  1F        .db $1F
  $B172  1F        .db $1F
  $B173  0F        .db $0F
  $B174  07        .db $07
  $B175  03        .db $03
  $B176  00        BRK
  $B177  00        BRK
  $B178  1D 0F 0D  ORA $0D0F,X
  $B17B  07        .db $07
  $B17C  03        .db $03
  $B17D  00        BRK
  $B17E  00        BRK
  $B17F  00        BRK
  $B180  FE FE FE  INC $FEFE,X
  $B183  FF        .db $FF
  $B184  FF        .db $FF
  $B185  FF        .db $FF
  $B186  7E 00 7C  ROR $7C00,X
  $B189  14        .db $14
  $B18A  5C        .db $5C
  $B18B  66 BA     ROR $BA
  $B18D  7E 00 00  ROR $0000,X
  $B190  00        BRK
  $B191  10 3E     BPL $B1D1
  $B193  3F        .db $3F

L_B194:
  $B194  3F        .db $3F
  $B195  3F        .db $3F
  $B196  3F        .db $3F
  $B197  1F        .db $1F
  $B198  00        BRK
  $B199  00        BRK
  $B19A  10 16     BPL $B1B2
  $B19C  13        .db $13
  $B19D  14        .db $14
  $B19E  16 0B     ASL $0B,X
  $B1A0  00        BRK
  $B1A1  00        BRK
  $B1A2  00        BRK
  $B1A3  80        .db $80
  $B1A4  E0 F8     CPX #$F8
  $B1A6  FC        .db $FC
  $B1A7  FF        .db $FF
  $B1A8  00        BRK
  $B1A9  00        BRK
  $B1AA  00        BRK
  $B1AB  00        BRK
  $B1AC  80        .db $80
  $B1AD  60        RTS
  $B1AE  F0 28     BEQ $B1D8
  $B1B0  1F        .db $1F
  $B1B1  0F        .db $0F

L_B1B2:
  $B1B2  0F        .db $0F
  $B1B3  07        .db $07
  $B1B4  03        .db $03
  $B1B5  00        BRK
  $B1B6  00        BRK
  $B1B7  00        BRK
  $B1B8  0E 07 06  ASL $0607
  $B1BB  01 00     ORA ($00,X)
  $B1BD  00        BRK
  $B1BE  00        BRK
  $B1BF  00        BRK
  $B1C0  FF        .db $FF
  $B1C1  FF        .db $FF
  $B1C2  FE FC F0  INC $F0FC,X
  $B1C5  00        BRK
  $B1C6  00        BRK
  $B1C7  00        BRK
  $B1C8  D6 EE     DEC $EE,X
  $B1CA  1C        .db $1C
  $B1CB  F0 00     BEQ $B1CD

L_B1CD:
  $B1CD  00        BRK
  $B1CE  00        BRK
  $B1CF  00        BRK
  $B1D0  00        BRK

L_B1D1:
  $B1D1  40        RTI
  $B1D2  F8        SED
  $B1D3  FF        .db $FF
  $B1D4  7F        .db $7F
  $B1D5  3F        .db $3F
  $B1D6  1F        .db $1F
  $B1D7  03        .db $03

L_B1D8:
  $B1D8  00        BRK
  $B1D9  00        BRK
  $B1DA  40        RTI
  $B1DB  78        SEI
  $B1DC  2F        .db $2F
  $B1DD  1D 03 00  ORA $0003,X
  $B1E0  00        BRK
  $B1E1  00        BRK
  $B1E2  00        BRK
  $B1E3  00        BRK
  $B1E4  00        BRK
  $B1E5  00        BRK
  $B1E6  00        BRK
  $B1E7  00        BRK
  $B1E8  00        BRK
  $B1E9  00        BRK
  $B1EA  00        BRK
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
  $B200  00        BRK
  $B201  00        BRK
  $B202  01 00     ORA ($00,X)
  $B204  06 1E     ASL $1E
  $B206  32        .db $32
  $B207  63        .db $63
  $B208  00        BRK
  $B209  00        BRK
  $B20A  01 01     ORA ($01,X)
  $B20C  07        .db $07
  $B20D  1F        .db $1F
  $B20E  3E 7F 00  ROL $007F,X
  $B211  00        BRK
  $B212  E0 C0     CPX #$C0
  $B214  D8        CLD
  $B215  1E 1F FF  ASL $FF1F,X
  $B218  00        BRK
  $B219  00        BRK
  $B21A  20 20 38  JSR $3820
  $B21D  FE 1F FF  INC $FF1F,X
  $B220  00        BRK
  $B221  00        BRK
  $B222  00        BRK
  $B223  00        BRK
  $B224  00        BRK
  $B225  00        BRK
  $B226  00        BRK
  $B227  80        .db $80
  $B228  00        BRK
  $B229  00        BRK
  $B22A  00        BRK
  $B22B  00        BRK
  $B22C  00        BRK
  $B22D  00        BRK
  $B22E  00        BRK
  $B22F  80        .db $80
  $B230  00        BRK
  $B231  00        BRK
  $B232  00        BRK
  $B233  00        BRK
  $B234  00        BRK
  $B235  00        BRK
  $B236  00        BRK
  $B237  00        BRK
  $B238  00        BRK
  $B239  00        BRK
  $B23A  00        BRK
  $B23B  00        BRK
  $B23C  00        BRK
  $B23D  01 01     ORA ($01,X)
  $B23F  01 66     ORA ($66,X)
  $B241  FE FE FE  INC $FEFE,X
  $B244  E3        .db $E3
  $B245  C1 C0     CMP ($C0,X)
  $B247  80        .db $80
  $B248  7F        .db $7F
  $B249  FF        .db $FF
  $B24A  FF        .db $FF
  $B24B  FE E3 C1  INC $C1E3,X
  $B24E  C0 80     CPY #$80
  $B250  DF        .db $DF
  $B251  DF        .db $DF
  $B252  1F        .db $1F
  $B253  1F        .db $1F
  $B254  F1 E0     SBC ($E0),Y
  $B256  C0 C0     CPY #$C0
  $B258  3F        .db $3F
  $B259  3F        .db $3F
  $B25A  FF        .db $FF
  $B25B  1F        .db $1F
  $B25C  F1 E0     SBC ($E0),Y
  $B25E  C0 C0     CPY #$C0
  $B260  80        .db $80
  $B261  C0 C0     CPY #$C0
  $B263  C0 C0     CPY #$C0
  $B265  C0 C0     CPY #$C0
  $B267  40        RTI
  $B268  80        .db $80
  $B269  C0 C0     CPY #$C0
  $B26B  C0 C0     CPY #$C0
  $B26D  E0 E0     CPX #$E0
  $B26F  60        RTS
  $B270  00        BRK
  $B271  00        BRK
  $B272  00        BRK
  $B273  00        BRK
  $B274  00        BRK
  $B275  00        BRK
  $B276  00        BRK
  $B277  00        BRK
  $B278  01 00     ORA ($00,X)
  $B27A  00        BRK
  $B27B  00        BRK
  $B27C  00        BRK
  $B27D  00        BRK
  $B27E  00        BRK
  $B27F  01 80     ORA ($80,X)
  $B281  00        BRK
  $B282  00        BRK
  $B283  00        BRK
  $B284  00        BRK
  $B285  00        BRK
  $B286  00        BRK
  $B287  00        BRK
  $B288  80        .db $80
  $B289  80        .db $80
  $B28A  80        .db $80
  $B28B  40        RTI
  $B28C  00        BRK
  $B28D  40        RTI
  $B28E  E0 F0     CPX #$F0
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
  $B29E  01 03     ORA ($03,X)
  $B2A0  40        RTI
  $B2A1  00        BRK
  $B2A2  00        BRK
  $B2A3  00        BRK

L_B2A4:
  $B2A4  00        BRK
  $B2A5  00        BRK
  $B2A6  00        BRK
  $B2A7  00        BRK
  $B2A8  60        RTS
  $B2A9  40        RTI
  $B2AA  40        RTI
  $B2AB  80        .db $80
  $B2AC  00        BRK
  $B2AD  80        .db $80
  $B2AE  C0 E0     CPY #$E0
  $B2B0  00        BRK
  $B2B1  00        BRK
  $B2B2  00        BRK
  $B2B3  00        BRK
  $B2B4  0F        .db $0F
  $B2B5  1B        .db $1B
  $B2B6  17        .db $17
  $B2B7  37        .db $37
  $B2B8  03        .db $03
  $B2B9  03        .db $03
  $B2BA  07        .db $07
  $B2BB  00        BRK
  $B2BC  0F        .db $0F
  $B2BD  1F        .db $1F
  $B2BE  1F        .db $1F
  $B2BF  3F        .db $3F
  $B2C0  00        BRK
  $B2C1  00        BRK
  $B2C2  00        BRK
  $B2C3  00        BRK
  $B2C4  80        .db $80
  $B2C5  C0 C0     CPY #$C0
  $B2C7  C0 BC     CPY #$BC
  $B2C9  DF        .db $DF
  $B2CA  DF        .db $DF
  $B2CB  5F        .db $5F
  $B2CC  9F        .db $9F
  $B2CD  FF        .db $FF
  $B2CE  DF        .db $DF
  $B2CF  CF        .db $CF
  $B2D0  00        BRK
  $B2D1  00        BRK
  $B2D2  00        BRK
  $B2D3  00        BRK
  $B2D4  00        BRK
  $B2D5  00        BRK
  $B2D6  00        BRK
  $B2D7  00        BRK
  $B2D8  0F        .db $0F
  $B2D9  3F        .db $3F
  $B2DA  FF        .db $FF
  $B2DB  FF        .db $FF
  $B2DC  FF        .db $FF
  $B2DD  FF        .db $FF
  $B2DE  FE FE 00  INC $00FE,X
  $B2E1  00        BRK
  $B2E2  00        BRK
  $B2E3  08        PHP
  $B2E4  08        PHP
  $B2E5  1C        .db $1C
  $B2E6  74        .db $74
  $B2E7  74        .db $74
  $B2E8  E0 B0     CPX #$B0
  $B2EA  B0 B8     BCS $B2A4
  $B2EC  68        PLA
  $B2ED  1C        .db $1C
  $B2EE  7C        .db $7C
  $B2EF  7C        .db $7C
  $B2F0  2F        .db $2F
  $B2F1  2F        .db $2F
  $B2F2  4F        .db $4F
  $B2F3  7F        .db $7F
  $B2F4  4F        .db $4F
  $B2F5  4E 6F 3F  LSR $3F6F
  $B2F8  3F        .db $3F
  $B2F9  3F        .db $3F
  $B2FA  7F        .db $7F
  $B2FB  7F        .db $7F
  $B2FC  7F        .db $7F
  $B2FD  7E 7F 3F  ROR $3F7F,X
  $B300  D0 58     BNE $B35A
  $B302  9F        .db $9F
  $B303  DF        .db $DF
  $B304  EF        .db $EF
  $B305  63        .db $63
  $B306  61 C0     ADC ($C0,X)
  $B308  D3        .db $D3
  $B309  58        CLI
  $B30A  9F        .db $9F
  $B30B  DF        .db $DF
  $B30C  EF        .db $EF
  $B30D  73        .db $73
  $B30E  7D DE 01  ADC $01DE,X
  $B311  07        .db $07
  $B312  FF        .db $FF
  $B313  FE F8 F0  INC $F0F8,X
  $B316  E0 00     CPX #$00
  $B318  F9 07 FF  SBC $FF07,Y
  $B31B  FE F9 F7  INC $F7F9,X
  $B31E  EF        .db $EF
  $B31F  1F        .db $1F
  $B320  3E 5E 7E  ROL $7E5E,X
  $B323  36 26     ROL $26,X
  $B325  1C        .db $1C
  $B326  00        BRK
  $B327  00        BRK
  $B328  3E 5E 7E  ROL $7E5E,X
  $B32B  36 26     ROL $26,X
  $B32D  1C        .db $1C
  $B32E  80        .db $80
  $B32F  80        .db $80
  $B330  1B        .db $1B
  $B331  00        BRK
  $B332  00        BRK
  $B333  00        BRK
  $B334  00        BRK
  $B335  00        BRK
  $B336  00        BRK
  $B337  00        BRK
  $B338  1B        .db $1B
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
  $B344  81 C3     STA ($C3,X)
  $B346  FF        .db $FF
  $B347  BF        .db $BF
  $B348  3F        .db $3F
  $B349  7F        .db $7F
  $B34A  7F        .db $7F
  $B34B  7E BD C3  ROR $C3BD,X
  $B34E  FF        .db $FF
  $B34F  FF        .db $FF
  $B350  00        BRK
  $B351  00        BRK
  $B352  00        BRK
  $B353  00        BRK
  $B354  00        BRK
  $B355  87        .db $87
  $B356  9F        .db $9F
  $B357  BC BF 3F  LDY $3FBF,X

L_B35A:
  $B35A  3F        .db $3F
  $B35B  3F        .db $3F
  $B35C  18        CLC
  $B35D  87        .db $87
  $B35E  9F        .db $9F
  $B35F  BF        .db $BF
  $B360  00        BRK
  $B361  00        BRK
  $B362  00        BRK
  $B363  00        BRK
  $B364  00        BRK
  $B365  80        .db $80
  $B366  80        .db $80
  $B367  C0 80     CPY #$80
  $B369  80        .db $80
  $B36A  80        .db $80
  $B36B  80        .db $80
  $B36C  00        BRK
  $B36D  80        .db $80
  $B36E  80        .db $80
  $B36F  C0 00     CPY #$00
  $B371  00        BRK
  $B372  00        BRK
  $B373  00        BRK
  $B374  00        BRK
  $B375  01 01     ORA ($01,X)
  $B377  01 00     ORA ($00,X)
  $B379  00        BRK
  $B37A  00        BRK
  $B37B  00        BRK
  $B37C  00        BRK
  $B37D  01 01     ORA ($01,X)
  $B37F  01 BF     ORA ($BF,X)
  $B381  7F        .db $7F
  $B382  7F        .db $7F
  $B383  9E        .db $9E
  $B384  FE 7D FD  INC $FD7D,X
  $B387  FD FF 7F  SBC $7FFF,X
  $B38A  7F        .db $7F
  $B38B  9E        .db $9E
  $B38C  FE FD FD  INC $FDFD,X
  $B38F  FD BE 7F  SBC $7FBE,X
  $B392  7F        .db $7F
  $B393  FF        .db $FF
  $B394  FF        .db $FF
  $B395  FE FE FC  INC $FCFE,X
  $B398  BF        .db $BF
  $B399  7F        .db $7F
  $B39A  7F        .db $7F
  $B39B  FF        .db $FF
  $B39C  FF        .db $FF
  $B39D  FF        .db $FF
  $B39E  FF        .db $FF
  $B39F  FF        .db $FF
  $B3A0  40        RTI
  $B3A1  40        RTI
  $B3A2  40        RTI
  $B3A3  40        RTI
  $B3A4  40        RTI
  $B3A5  40        RTI
  $B3A6  40        RTI
  $B3A7  40        RTI
  $B3A8  C0 C0     CPY #$C0
  $B3AA  C0 C0     CPY #$C0
  $B3AC  C0 C0     CPY #$C0
  $B3AE  C0 C0     CPY #$C0
  $B3B0  00        BRK
  $B3B1  7F        .db $7F
  $B3B2  FF        .db $FF
  $B3B3  FF        .db $FF
  $B3B4  00        BRK
  $B3B5  7F        .db $7F
  $B3B6  1F        .db $1F
  $B3B7  01 00     ORA ($00,X)
  $B3B9  00        BRK
  $B3BA  00        BRK
  $B3BB  00        BRK
  $B3BC  00        BRK
  $B3BD  00        BRK
  $B3BE  00        BRK
  $B3BF  00        BRK
  $B3C0  FB        .db $FB
  $B3C1  03        .db $03
  $B3C2  F7        .db $F7
  $B3C3  F6 03     INC $03,X
  $B3C5  FB        .db $FB
  $B3C6  FD FE FB  SBC $FBFE,X
  $B3C9  03        .db $03
  $B3CA  07        .db $07
  $B3CB  06 03     ASL $03
  $B3CD  03        .db $03
  $B3CE  01 00     ORA ($00,X)
  $B3D0  FF        .db $FF
  $B3D1  C0 3F     CPY #$3F
  $B3D3  F8        SED
  $B3D4  FE FF FF  INC $FFFF,X
  $B3D7  7F        .db $7F
  $B3D8  FF        .db $FF
  $B3D9  C0 3F     CPY #$3F
  $B3DB  FF        .db $FF
  $B3DC  FF        .db $FF
  $B3DD  FF        .db $FF
  $B3DE  FF        .db $FF

L_B3DF:
  $B3DF  7F        .db $7F
  $B3E0  80        .db $80
  $B3E1  9E        .db $9E
  $B3E2  3F        .db $3F
  $B3E3  5F        .db $5F
  $B3E4  20 D6 F0  JSR $F0D6
  $B3E7  E0 80     CPX #$80
  $B3E9  80        .db $80
  $B3EA  00        BRK
  $B3EB  C0 E0     CPY #$E0
  $B3ED  F0 F0     BEQ $B3DF
  $B3EF  E0 00     CPX #$00
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
  $B403  20 00 00  JSR $0000
  $B406  00        BRK
  $B407  FF        .db $FF
  $B408  FF        .db $FF
  $B409  FF        .db $FF
  $B40A  FF        .db $FF
  $B40B  FF        .db $FF
  $B40C  FF        .db $FF
  $B40D  FF        .db $FF
  $B40E  FF        .db $FF
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
  $B42D  00        BRK
  $B42E  12        .db $12
  $B42F  12        .db $12
  $B430  24 FF     BIT $FF
  $B432  FF        .db $FF
  $B433  FF        .db $FF
  $B434  FF        .db $FF
  $B435  FF        .db $FF
  $B436  FF        .db $FF
  $B437  FF        .db $FF
  $B438  FF        .db $FF
  $B439  FF        .db $FF
  $B43A  FF        .db $FF
  $B43B  FF        .db $FF
  $B43C  FF        .db $FF
  $B43D  FF        .db $FF
  $B43E  FF        .db $FF
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
  $B460  90 03     BCC $B465
  $B462  90 03     BCC $B467
  $B464  90 03     BCC $B469
  $B466  9E        .db $9E

L_B467:
  $B467  04        .db $04
  $B468  90 03     BCC $B46D
  $B46A  9F        .db $9F
  $B46B  03        .db $03
  $B46C  0F        .db $0F

L_B46D:
  $B46D  00        BRK
  $B46E  30 0F     BMI $B47F
  $B470  15 27     ORA $27,X
  $B472  96 01     STX $01,Y
  $B474  97        .db $97
  $B475  01 98     ORA ($98,X)
  $B477  01 9E     ORA ($9E,X)
  $B479  03        .db $03
  $B47A  9E        .db $9E
  $B47B  03        .db $03
  $B47C  9F        .db $9F
  $B47D  03        .db $03
  $B47E  0F        .db $0F

L_B47F:
  $B47F  00        BRK
  $B480  30 0F     BMI $B491
  $B482  25 34     AND $34
  $B484  B0 03     BCS $B489
  $B486  B1 03     LDA ($03),Y
  $B488  B2        .db $B2

L_B489:
  $B489  03        .db $03
  $B48A  B3        .db $B3
  $B48B  03        .db $03
  $B48C  AA        TAX
  $B48D  05 AB     ORA $AB
  $B48F  05 0F     ORA $0F

L_B491:
  $B491  30 15     BMI $B4A8
  $B493  0F        .db $0F
  $B494  28        PLP
  $B495  15 FF     ORA $FF,X
  $B497  FF        .db $FF
  $B498  FF        .db $FF
  $B499  FF        .db $FF
  $B49A  FF        .db $FF
  $B49B  FF        .db $FF
  $B49C  FF        .db $FF
  $B49D  FF        .db $FF
  $B49E  FF        .db $FF
  $B49F  FF        .db $FF
  $B4A0  FF        .db $FF
  $B4A1  FF        .db $FF
  $B4A2  FF        .db $FF
  $B4A3  FF        .db $FF
  $B4A4  FF        .db $FF
  $B4A5  FF        .db $FF
  $B4A6  FF        .db $FF
  $B4A7  FF        .db $FF

L_B4A8:
  $B4A8  FF        .db $FF
  $B4A9  FF        .db $FF
  $B4AA  FF        .db $FF
  $B4AB  FF        .db $FF
  $B4AC  FF        .db $FF
  $B4AD  FF        .db $FF
  $B4AE  FF        .db $FF
  $B4AF  FF        .db $FF
  $B4B0  FF        .db $FF
  $B4B1  FF        .db $FF
  $B4B2  FF        .db $FF
  $B4B3  FF        .db $FF
  $B4B4  FF        .db $FF
  $B4B5  FF        .db $FF
  $B4B6  FF        .db $FF
  $B4B7  FF        .db $FF
  $B4B8  FF        .db $FF
  $B4B9  FF        .db $FF
  $B4BA  FF        .db $FF
  $B4BB  FF        .db $FF
  $B4BC  FF        .db $FF
  $B4BD  FF        .db $FF
  $B4BE  FF        .db $FF
  $B4BF  FF        .db $FF
  $B4C0  FF        .db $FF
  $B4C1  FF        .db $FF
  $B4C2  FF        .db $FF
  $B4C3  FF        .db $FF
  $B4C4  FF        .db $FF
  $B4C5  FF        .db $FF
  $B4C6  FF        .db $FF
  $B4C7  FF        .db $FF
  $B4C8  FF        .db $FF
  $B4C9  FF        .db $FF
  $B4CA  FF        .db $FF
  $B4CB  FF        .db $FF
  $B4CC  FF        .db $FF
  $B4CD  FF        .db $FF
  $B4CE  FF        .db $FF
  $B4CF  FF        .db $FF
  $B4D0  FF        .db $FF
  $B4D1  FF        .db $FF
  $B4D2  FF        .db $FF
  $B4D3  FF        .db $FF
  $B4D4  FF        .db $FF
  $B4D5  FF        .db $FF
  $B4D6  FF        .db $FF
  $B4D7  FF        .db $FF
  $B4D8  FF        .db $FF
  $B4D9  FF        .db $FF
  $B4DA  FF        .db $FF
  $B4DB  FF        .db $FF
  $B4DC  FF        .db $FF
  $B4DD  FF        .db $FF
  $B4DE  FF        .db $FF
  $B4DF  FF        .db $FF
  $B4E0  FF        .db $FF
  $B4E1  FF        .db $FF
  $B4E2  FF        .db $FF
  $B4E3  FF        .db $FF
  $B4E4  FF        .db $FF
  $B4E5  FF        .db $FF
  $B4E6  FF        .db $FF
  $B4E7  FF        .db $FF
  $B4E8  FF        .db $FF
  $B4E9  FF        .db $FF
  $B4EA  FF        .db $FF
  $B4EB  FF        .db $FF
  $B4EC  FF        .db $FF
  $B4ED  FF        .db $FF
  $B4EE  FF        .db $FF
  $B4EF  FF        .db $FF
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
  $B600  02        .db $02
  $B601  02        .db $02
  $B602  03        .db $03
  $B603  03        .db $03
  $B604  03        .db $03
  $B605  03        .db $03
  $B606  04        .db $04
  $B607  05 07     ORA $07
  $B609  0C        .db $0C
  $B60A  0C        .db $0C
  $B60B  0D 0E 0F  ORA $0F0E
  $B60E  0F        .db $0F
  $B60F  10 10     BPL $B621
  $B611  11 12     ORA ($12),Y
  $B613  12        .db $12
  $B614  13        .db $13
  $B615  13        .db $13
  $B616  FF        .db $FF
  $B617  FF        .db $FF
  $B618  FF        .db $FF
  $B619  FF        .db $FF
  $B61A  FF        .db $FF
  $B61B  FF        .db $FF
  $B61C  FF        .db $FF
  $B61D  FF        .db $FF
  $B61E  FF        .db $FF
  $B61F  FF        .db $FF
  $B620  FF        .db $FF

L_B621:
  $B621  FF        .db $FF
  $B622  FF        .db $FF
  $B623  FF        .db $FF
  $B624  FF        .db $FF
  $B625  FF        .db $FF
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

L_B6D2:
  $B6D2  FF        .db $FF
  $B6D3  FF        .db $FF
  $B6D4  FF        .db $FF
  $B6D5  FF        .db $FF

L_B6D6:
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
  $B6FB  FF        .db $FF
  $B6FC  FF        .db $FF
  $B6FD  FF        .db $FF
  $B6FE  FF        .db $FF
  $B6FF  FF        .db $FF
  $B700  70 D0     BVS $B6D2
  $B702  30 70     BMI $B774
  $B704  B0 D0     BCS $B6D6
  $B706  E0 F0     CPX #$F0
  $B708  00        BRK
  $B709  60        RTS
  $B70A  C8        INY
  $B70B  E0 60     CPX #$60
  $B70D  10 58     BPL $B767
  $B70F  18        CLC
  $B710  F8        SED
  $B711  B8        CLV
  $B712  38        SEC
  $B713  A8        TAY
  $B714  38        SEC
  $B715  98        TYA
  $B716  FF        .db $FF
  $B717  FF        .db $FF
  $B718  FF        .db $FF
  $B719  FF        .db $FF
  $B71A  FF        .db $FF
  $B71B  FF        .db $FF
  $B71C  FF        .db $FF
  $B71D  FF        .db $FF
  $B71E  FF        .db $FF
  $B71F  FF        .db $FF
  $B720  FF        .db $FF
  $B721  FF        .db $FF
  $B722  FF        .db $FF
  $B723  FF        .db $FF
  $B724  FF        .db $FF
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

L_B767:
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

L_B774:
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
  $B787  FF        .db $FF
  $B788  FF        .db $FF
  $B789  FF        .db $FF
  $B78A  FF        .db $FF
  $B78B  FF        .db $FF
  $B78C  FF        .db $FF
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
  $B800  38        SEC
  $B801  38        SEC
  $B802  28        PLP
  $B803  28        PLP
  $B804  38        SEC
  $B805  08        PHP
  $B806  08        PHP
  $B807  08        PHP
  $B808  08        PHP
  $B809  40        RTI
  $B80A  48        PHA
  $B80B  58        CLI
  $B80C  48        PHA
  $B80D  38        SEC
  $B80E  78        SEI
  $B80F  48        PHA
  $B810  18        CLC
  $B811  B8        CLV
  $B812  98        TYA
  $B813  98        TYA
  $B814  88        DEY
  $B815  88        DEY
  $B816  FF        .db $FF
  $B817  FF        .db $FF
  $B818  FF        .db $FF
  $B819  FF        .db $FF
  $B81A  FF        .db $FF
  $B81B  FF        .db $FF
  $B81C  FF        .db $FF
  $B81D  FF        .db $FF
  $B81E  FF        .db $FF
  $B81F  FF        .db $FF
  $B820  FF        .db $FF
  $B821  FF        .db $FF
  $B822  FF        .db $FF
  $B823  FF        .db $FF
  $B824  FF        .db $FF
  $B825  FF        .db $FF
  $B826  FF        .db $FF
  $B827  FF        .db $FF
  $B828  FF        .db $FF
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
  $B900  30 30     BMI $B932
  $B902  30 30     BMI $B934
  $B904  30 4A     BMI $B950
  $B906  47        .db $47
  $B907  47        .db $47
  $B908  4A        LSR
  $B909  29 29     AND #$29
  $B90B  29 29     AND #$29
  $B90D  29 31     AND #$31
  $B90F  31 31     AND ($31),Y
  $B911  46 46     LSR $46
  $B913  46 46     LSR $46
  $B915  46 FF     LSR $FF
  $B917  FF        .db $FF
  $B918  FF        .db $FF
  $B919  FF        .db $FF
  $B91A  FF        .db $FF
  $B91B  FF        .db $FF
  $B91C  FF        .db $FF
  $B91D  FF        .db $FF
  $B91E  FF        .db $FF
  $B91F  FF        .db $FF
  $B920  FF        .db $FF
  $B921  FF        .db $FF
  $B922  FF        .db $FF
  $B923  FF        .db $FF
  $B924  FF        .db $FF
  $B925  FF        .db $FF
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

L_B932:
  $B932  FF        .db $FF
  $B933  FF        .db $FF

L_B934:
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

L_B950:
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
  $BA00  01 09     ORA ($09,X)
  $BA02  10 13     BPL $BA17
  $BA04  13        .db $13
  $BA05  14        .db $14
  $BA06  14        .db $14
  $BA07  15 15     ORA $15,X
  $BA09  FF        .db $FF
  $BA0A  FF        .db $FF
  $BA0B  FF        .db $FF
  $BA0C  FF        .db $FF
  $BA0D  FF        .db $FF
  $BA0E  FF        .db $FF
  $BA0F  FF        .db $FF
  $BA10  FF        .db $FF
  $BA11  FF        .db $FF
  $BA12  FF        .db $FF
  $BA13  FF        .db $FF
  $BA14  FF        .db $FF
  $BA15  FF        .db $FF
  $BA16  FF        .db $FF

L_BA17:
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
  $BA40  F8        SED
  $BA41  D8        CLD
  $BA42  98        TYA
  $BA43  F8        SED
  $BA44  F8        SED
  $BA45  F8        SED
  $BA46  F8        SED
  $BA47  08        PHP
  $BA48  08        PHP
  $BA49  FF        .db $FF
  $BA4A  FF        .db $FF
  $BA4B  FF        .db $FF
  $BA4C  FF        .db $FF
  $BA4D  FF        .db $FF
  $BA4E  FF        .db $FF
  $BA4F  FF        .db $FF
  $BA50  FF        .db $FF
  $BA51  FF        .db $FF
  $BA52  FF        .db $FF
  $BA53  FF        .db $FF
  $BA54  FF        .db $FF
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
  $BA80  A8        TAY
  $BA81  48        PHA
  $BA82  B8        CLV
  $BA83  4F        .db $4F
  $BA84  6F        .db $6F
  $BA85  4F        .db $4F
  $BA86  6F        .db $6F
  $BA87  4F        .db $4F
  $BA88  6F        .db $6F
  $BA89  FF        .db $FF
  $BA8A  FF        .db $FF
  $BA8B  FF        .db $FF
  $BA8C  FF        .db $FF
  $BA8D  FF        .db $FF
  $BA8E  FF        .db $FF
  $BA8F  FF        .db $FF
  $BA90  FF        .db $FF
  $BA91  FF        .db $FF
  $BA92  FF        .db $FF
  $BA93  FF        .db $FF
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
  $BAC0  7A        .db $7A
  $BAC1  7B        .db $7B
  $BAC2  7A        .db $7A
  $BAC3  2F        .db $2F
  $BAC4  2F        .db $2F
  $BAC5  2F        .db $2F
  $BAC6  2F        .db $2F
  $BAC7  2F        .db $2F
  $BAC8  2F        .db $2F
  $BAC9  FF        .db $FF
  $BACA  FF        .db $FF
  $BACB  FF        .db $FF
  $BACC  FF        .db $FF
  $BACD  FF        .db $FF
  $BACE  FF        .db $FF
  $BACF  FF        .db $FF
  $BAD0  FF        .db $FF
  $BAD1  FF        .db $FF
  $BAD2  FF        .db $FF
  $BAD3  FF        .db $FF
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
  $BB00  A4 A4     LDY $A4
  $BB02  74        .db $74
  $BB03  A4 A4     LDY $A4
  $BB05  A4 00     LDY $00
  $BB07  0B        .db $0B
  $BB08  14        .db $14
  $BB09  FF        .db $FF
  $BB0A  00        BRK
  $BB0B  00        BRK
  $BB0C  00        BRK
  $BB0D  09 16     ORA #$16
  $BB0F  16 16     ASL $16,X
  $BB11  16 00     ASL $00,X
  $BB13  02        .db $02
  $BB14  05 09     ORA $09
  $BB16  09 09     ORA #$09
  $BB18  84 87     STY $87
  $BB1A  89        .db $89
  $BB1B  84 84     STY $84
  $BB1D  84 E0     STY $E0
  $BB1F  A0 E0     LDY #$E0
  $BB21  E0 E0     CPX #$E0
  $BB23  E0 85     CPX #$85
  $BB25  88        DEY
  $BB26  8A        TXA
  $BB27  85 85     STA $85
  $BB29  85 60     STA $60
  $BB2B  20 60 60  JSR $6060
  $BB2E  60        RTS
  $BB2F  60        RTS
  $BB30  00        BRK
  $BB31  02        .db $02
  $BB32  03        .db $03
  $BB33  00        BRK
  $BB34  00        BRK
  $BB35  00        BRK
  $BB36  00        BRK
  $BB37  0B        .db $0B
  $BB38  14        .db $14
  $BB39  00        BRK
  $BB3A  00        BRK
  $BB3B  00        BRK
  $BB3C  09 13     ORA #$13
  $BB3E  14        .db $14
  $BB3F  00        BRK
  $BB40  00        BRK
  $BB41  00        BRK
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
  $BC00  07        .db $07
  $BC01  90 09     BCC $BC0C
  $BC03  00        BRK
  $BC04  84 01     STY $01
  $BC06  09 9B     ORA #$9B
  $BC08  04        .db $04
  $BC09  04        .db $04
  $BC0A  90 01     BCC $BC0D

L_BC0C:
  $BC0C  03        .db $03

L_BC0D:
  $BC0D  9F        .db $9F
  $BC0E  01 03     ORA ($03,X)
  $BC10  80        .db $80
  $BC11  06 09     ASL $09
  $BC13  A0 0A     LDY #$0A
  $BC15  06 FF     ASL $FF
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
  $BD00  FF        .db $FF
  $BD01  FF        .db $FF
  $BD02  FF        .db $FF
  $BD03  FF        .db $FF
  $BD04  FF        .db $FF
  $BD05  FF        .db $FF
  $BD06  FF        .db $FF
  $BD07  FF        .db $FF
  $BD08  FF        .db $FF
  $BD09  FF        .db $FF
  $BD0A  FF        .db $FF
  $BD0B  FF        .db $FF
  $BD0C  FF        .db $FF
  $BD0D  FF        .db $FF
  $BD0E  FF        .db $FF
  $BD0F  FF        .db $FF
  $BD10  FF        .db $FF
  $BD11  FF        .db $FF
  $BD12  FF        .db $FF
  $BD13  FF        .db $FF
  $BD14  FF        .db $FF
  $BD15  FF        .db $FF
  $BD16  FF        .db $FF
  $BD17  FF        .db $FF
  $BD18  FF        .db $FF
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
  $BE00  04        .db $04
  $BE01  03        .db $03
  $BE02  0F        .db $0F
  $BE03  38        SEC
  $BE04  2A        ROL
  $BE05  17        .db $17
  $BE06  0F        .db $0F
  $BE07  10 10     BPL $BE19
  $BE09  15 0F     ORA $0F,X
  $BE0B  10 05     BPL $BE12
  $BE0D  27        .db $27
  $BE0E  0F        .db $0F
  $BE0F  07        .db $07
  $BE10  07        .db $07
  $BE11  0F        .db $0F

L_BE12:
  $BE12  0F        .db $0F
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  00        BRK
  $BE1D  30 0F     BMI $BE2E
  $BE1F  0F        .db $0F
  $BE20  15 27     ORA $27,X
  $BE22  0F        .db $0F
  $BE23  38        SEC
  $BE24  2A        ROL
  $BE25  17        .db $17
  $BE26  0F        .db $0F
  $BE27  10 10     BPL $BE39
  $BE29  15 0F     ORA $0F,X
  $BE2B  10 27     BPL $BE54
  $BE2D  05 0F     ORA $0F
  $BE2F  07        .db $07
  $BE30  07        .db $07
  $BE31  0F        .db $0F
  $BE32  0F        .db $0F
  $BE33  38        SEC
  $BE34  2A        ROL
  $BE35  17        .db $17
  $BE36  0F        .db $0F
  $BE37  10 10     BPL $BE49

L_BE39:
  $BE39  10 0F     BPL $BE4A
  $BE3B  10 05     BPL $BE42
  $BE3D  27        .db $27
  $BE3E  0F        .db $0F
  $BE3F  07        .db $07
  $BE40  07        .db $07
  $BE41  0F        .db $0F

L_BE42:
  $BE42  0F        .db $0F
  $BE43  38        SEC
  $BE44  2A        ROL
  $BE45  17        .db $17
  $BE46  0F        .db $0F
  $BE47  10 10     BPL $BE59

L_BE49:
  $BE49  10 0F     BPL $BE5A
  $BE4B  10 27     BPL $BE74
  $BE4D  05 0F     ORA $0F
  $BE4F  07        .db $07
  $BE50  0F        .db $0F
  $BE51  07        .db $07
  $BE52  0F        .db $0F
  $BE53  38        SEC

L_BE54:
  $BE54  2A        ROL
  $BE55  17        .db $17
  $BE56  0F        .db $0F
  $BE57  10 10     BPL $BE69

L_BE59:
  $BE59  10 0F     BPL $BE6A
  $BE5B  10 05     BPL $BE62
  $BE5D  27        .db $27
  $BE5E  0F        .db $0F
  $BE5F  07        .db $07
  $BE60  0F        .db $0F
  $BE61  07        .db $07

L_BE62:
  $BE62  FF        .db $FF
  $BE63  FF        .db $FF
  $BE64  FF        .db $FF
  $BE65  FF        .db $FF
  $BE66  FF        .db $FF
  $BE67  FF        .db $FF
  $BE68  FF        .db $FF

L_BE69:
  $BE69  FF        .db $FF

L_BE6A:
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

L_BE74:
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
  $BF00  FF        .db $FF
  $BF01  FF        .db $FF
  $BF02  FF        .db $FF
  $BF03  FF        .db $FF
  $BF04  FF        .db $FF
  $BF05  FF        .db $FF
  $BF06  FF        .db $FF
  $BF07  FF        .db $FF
  $BF08  FF        .db $FF
  $BF09  FF        .db $FF
  $BF0A  FF        .db $FF
  $BF0B  FF        .db $FF
  $BF0C  FF        .db $FF
  $BF0D  FF        .db $FF
  $BF0E  FF        .db $FF
  $BF0F  FF        .db $FF
  $BF10  FF        .db $FF
  $BF11  FF        .db $FF
  $BF12  FF        .db $FF
  $BF13  FF        .db $FF
  $BF14  FF        .db $FF
  $BF15  FF        .db $FF
  $BF16  FF        .db $FF
  $BF17  FF        .db $FF
  $BF18  FF        .db $FF
  $BF19  FF        .db $FF
  $BF1A  FF        .db $FF
  $BF1B  FF        .db $FF
  $BF1C  FF        .db $FF
  $BF1D  FF        .db $FF
  $BF1E  FF        .db $FF
  $BF1F  FF        .db $FF
  $BF20  FF        .db $FF
  $BF21  FF        .db $FF
  $BF22  FF        .db $FF
  $BF23  FF        .db $FF
  $BF24  FF        .db $FF
  $BF25  FF        .db $FF
  $BF26  FF        .db $FF
  $BF27  FF        .db $FF
  $BF28  FF        .db $FF
  $BF29  FF        .db $FF
  $BF2A  FF        .db $FF
  $BF2B  FF        .db $FF
  $BF2C  FF        .db $FF
  $BF2D  FF        .db $FF
  $BF2E  FF        .db $FF
  $BF2F  FF        .db $FF
  $BF30  FF        .db $FF
  $BF31  FF        .db $FF
  $BF32  FF        .db $FF
  $BF33  FF        .db $FF
  $BF34  FF        .db $FF
  $BF35  FF        .db $FF
  $BF36  FF        .db $FF
  $BF37  FF        .db $FF
  $BF38  FF        .db $FF
  $BF39  FF        .db $FF
  $BF3A  FF        .db $FF
  $BF3B  FF        .db $FF
  $BF3C  FF        .db $FF
  $BF3D  FF        .db $FF
  $BF3E  FF        .db $FF
  $BF3F  FF        .db $FF
  $BF40  FF        .db $FF
  $BF41  FF        .db $FF
  $BF42  FF        .db $FF
  $BF43  FF        .db $FF
  $BF44  FF        .db $FF
  $BF45  FF        .db $FF
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

L_BFBF:
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