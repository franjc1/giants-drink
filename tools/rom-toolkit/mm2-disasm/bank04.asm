; Mega Man 2 — PRG Bank 4
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  69 69     ADC #$69
  $8006  68        PLA
  $8007  68        PLA
  $8008  6A        ROR
  $8009  6A        ROR
  $800A  69 69     ADC #$69
  $800C  71 69     ADC ($69),Y
  $800E  66 68     ROR $68
  $8010  65 6A     ADC $6A
  $8012  71 69     ADC ($69),Y
  $8014  69 69     ADC #$69
  $8016  70 69     BVS $8081
  $8018  72        .db $72
  $8019  69 69     ADC #$69
  $801B  69 33     ADC #$33
  $801D  65 33     ADC $33
  $801F  71 69     ADC ($69),Y
  $8021  69 69     ADC #$69
  $8023  69 77     ADC #$77
  $8025  77        .db $77
  $8026  68        PLA
  $8027  68        PLA
  $8028  6A        ROR
  $8029  6A        ROR
  $802A  77        .db $77
  $802B  77        .db $77
  $802C  71 77     ADC ($77),Y
  $802E  66 68     ROR $68
  $8030  65 6A     ADC $6A
  $8032  71 77     ADC ($77),Y
  $8034  77        .db $77
  $8035  77        .db $77
  $8036  70 69     BVS $80A1
  $8038  72        .db $72
  $8039  69 77     ADC #$77
  $803B  77        .db $77
  $803C  62        .db $62
  $803D  6D 69 61  ADC $6169

L_8040:
  $8040  71 69     ADC ($69),Y
  $8042  71 69     ADC ($69),Y
  $8044  6F        .db $6F
  $8045  77        .db $77
  $8046  68        PLA
  $8047  68        PLA
  $8048  6A        ROR
  $8049  6A        ROR
  $804A  6F        .db $6F
  $804B  77        .db $77
  $804C  69 61     ADC #$61
  $804E  68        PLA
  $804F  6E 6A 6D  ROR $6D6A
  $8052  69 61     ADC #$61
  $8054  69 69     ADC #$69
  $8056  69 60     ADC #$60
  $8058  69 62     ADC #$62
  $805A  69 69     ADC #$69
  $805C  69 69     ADC #$69
  $805E  70 60     BVS $80C0
  $8060  71 69     ADC ($69),Y
  $8062  71 77     ADC ($77),Y
  $8064  77        .db $77
  $8065  77        .db $77
  $8066  69 69     ADC #$69
  $8068  69 69     ADC #$69
  $806A  77        .db $77
  $806B  77        .db $77
  $806C  77        .db $77
  $806D  61 68     ADC ($68,X)
  $806F  6E 6A 6D  ROR $6D6A
  $8072  77        .db $77
  $8073  61 67     ADC ($67,X)
  $8075  69 67     ADC #$67
  $8077  60        RTS
  $8078  67        .db $67
  $8079  62        .db $62
  $807A  67        .db $67
  $807B  69 71     ADC #$71
  $807D  61 71     ADC ($71,X)
  $807F  61 71     ADC ($71,X)

L_8081:
  $8081  77        .db $77
  $8082  71 69     ADC ($69),Y
  $8084  6F        .db $6F
  $8085  77        .db $77
  $8086  67        .db $67
  $8087  69 67     ADC #$67
  $8089  69 6F     ADC #$6F
  $808B  77        .db $77
  $808C  67        .db $67
  $808D  61 68     ADC ($68,X)
  $808F  6E 6A 6D  ROR $6D6A
  $8092  67        .db $67
  $8093  61 77     ADC ($77,X)
  $8095  77        .db $77
  $8096  69 60     ADC #$60
  $8098  69 62     ADC #$62
  $809A  77        .db $77
  $809B  77        .db $77
  $809C  71 61     ADC ($61),Y
  $809E  66 6E     ROR $6E
  $80A0  69 61     ADC #$61
  $80A2  69 61     ADC #$61
  $80A4  67        .db $67
  $80A5  61 67     ADC ($67,X)
  $80A7  61 69     ADC ($69,X)
  $80A9  61 77     ADC ($77,X)
  $80AB  61 6F     ADC ($6F,X)
  $80AD  61 68     ADC ($68,X)
  $80AF  6E 6A 6D  ROR $6D6A
  $80B2  6F        .db $6F
  $80B3  61 6F     ADC ($6F,X)
  $80B5  77        .db $77
  $80B6  67        .db $67
  $80B7  60        RTS
  $80B8  67        .db $67
  $80B9  62        .db $62
  $80BA  6F        .db $6F
  $80BB  77        .db $77
  $80BC  71 34     ADC ($34),Y
  $80BE  71 34     ADC ($34),Y

L_80C0:
  $80C0  77        .db $77
  $80C1  61 69     ADC ($69,X)
  $80C3  61 6F     ADC ($6F,X)
  $80C5  61 67     ADC ($67,X)
  $80C7  61 67     ADC ($67,X)
  $80C9  61 6F     ADC ($6F,X)
  $80CB  61 67     ADC ($67,X)
  $80CD  69 67     ADC #$67
  $80CF  69 68     ADC #$68
  $80D1  68        PLA
  $80D2  34        .db $34
  $80D3  33        .db $33
  $80D4  65 6A     ADC $6A
  $80D6  66 68     ROR $68
  $80D8  71 77     ADC ($77),Y
  $80DA  66 70     ROR $70
  $80DC  65 6D     ADC $6D
  $80DE  71 61     ADC ($61),Y
  $80E0  69 60     ADC #$60
  $80E2  68        PLA
  $80E3  6E 67 69  ROR $6967
  $80E6  68        PLA
  $80E7  68        PLA
  $80E8  6A        ROR
  $80E9  6A        ROR
  $80EA  67        .db $67
  $80EB  69 69     ADC #$69
  $80ED  67        .db $67
  $80EE  69 67     ADC #$67
  $80F0  68        PLA
  $80F1  6E 33 33  ROR $3333
  $80F4  6A        ROR
  $80F5  6A        ROR
  $80F6  70 69     BVS $8161
  $80F8  33        .db $33
  $80F9  71 33     ADC ($33),Y
  $80FB  71 33     ADC ($33),Y
  $80FD  71 33     ADC ($33),Y
  $80FF  66 34     ROR $34
  $8101  71 34     ADC ($34),Y
  $8103  71 34     ADC ($34),Y
  $8105  71 34     ADC ($34),Y
  $8107  66 34     ROR $34
  $8109  65 34     ADC $34
  $810B  71 6A     ADC ($6A),Y
  $810D  72        .db $72
  $810E  67        .db $67
  $810F  69 33     ADC #$33
  $8111  59 33 71  EOR $7133,Y
  $8114  6A        ROR
  $8115  6A        ROR
  $8116  68        PLA
  $8117  68        PLA
  $8118  34        .db $34
  $8119  59 34 71  EOR $7134,Y
  $811C  68        PLA
  $811D  68        PLA
  $811E  33        .db $33
  $811F  33        .db $33
  $8120  61 34     ADC ($34,X)
  $8122  61 34     ADC ($34,X)
  $8124  61 34     ADC ($34,X)
  $8126  6E 34 6D  ROR $6D34
  $8129  34        .db $34
  $812A  61 34     ADC ($34,X)
  $812C  65 6D     ADC $6D
  $812E  66 6E     ROR $6E
  $8130  34        .db $34
  $8131  65 34     ADC $34
  $8133  66 6A     ROR $6A
  $8135  6D 68 6E  ADC $6E68
  $8138  33        .db $33
  $8139  66 33     ROR $33
  $813B  33        .db $33
  $813C  6E 34 33  ROR $3334
  $813F  33        .db $33
  $8140  33        .db $33
  $8141  71 33     ADC ($33),Y
  $8143  5A        .db $5A
  $8144  6A        ROR
  $8145  6A        ROR
  $8146  68        PLA
  $8147  70 6A     BVS $81B3
  $8149  6A        ROR
  $814A  67        .db $67
  $814B  60        RTS
  $814C  66 6E     ROR $6E
  $814E  33        .db $33
  $814F  33        .db $33
  $8150  6D 34 5B  ADC $5B34
  $8153  34        .db $34
  $8154  65 6A     ADC $6A
  $8156  72        .db $72
  $8157  69 33     ADC #$33
  $8159  33        .db $33
  $815A  33        .db $33
  $815B  65 33     ADC $33
  $815D  33        .db $33
  $815E  6A        ROR
  $815F  6A        ROR
  $8160  71 34     ADC ($34),Y
  $8162  5A        .db $5A
  $8163  34        .db $34
  $8164  67        .db $67
  $8165  61 67     ADC ($67,X)
  $8167  62        .db $62
  $8168  6D 34 6E  ADC $6E34
  $816B  34        .db $34
  $816C  69 62     ADC #$62
  $816E  60        RTS
  $816F  68        PLA
  $8170  34        .db $34
  $8171  33        .db $33
  $8172  6A        ROR
  $8173  6D 33 33  ADC $3333
  $8176  6A        ROR
  $8177  6D 6A 6D  ADC $6D6A
  $817A  69 62     ADC #$62
  $817C  34        .db $34
  $817D  33        .db $33
  $817E  6A        ROR
  $817F  6A        ROR
  $8180  23        .db $23
  $8181  2B        .db $2B
  $8182  24 2C     BIT $2C
  $8184  33        .db $33
  $8185  33        .db $33
  $8186  23        .db $23
  $8187  2B        .db $2B
  $8188  24 2C     BIT $2C
  $818A  33        .db $33
  $818B  33        .db $33
  $818C  36 33     ROL $33,X
  $818E  36 35     ROL $35,X
  $8190  58        CLI
  $8191  34        .db $34
  $8192  58        CLI
  $8193  34        .db $34
  $8194  5A        .db $5A
  $8195  34        .db $34
  $8196  33        .db $33
  $8197  33        .db $33
  $8198  33        .db $33
  $8199  58        CLI
  $819A  33        .db $33
  $819B  58        CLI
  $819C  33        .db $33
  $819D  33        .db $33
  $819E  59 34 35  EOR $3534,Y
  $81A1  35 35     AND $35,X
  $81A3  35 35     AND $35,X
  $81A5  35 33     AND $33,X
  $81A7  35 35     AND $35,X
  $81A9  33        .db $33
  $81AA  35 35     AND $35,X
  $81AC  34        .db $34
  $81AD  33        .db $33
  $81AE  34        .db $34
  $81AF  33        .db $33
  $81B0  34        .db $34
  $81B1  33        .db $33
  $81B2  33        .db $33

L_81B3:
  $81B3  33        .db $33
  $81B4  33        .db $33
  $81B5  33        .db $33
  $81B6  34        .db $34
  $81B7  33        .db $33
  $81B8  33        .db $33
  $81B9  33        .db $33
  $81BA  65 6D     ADC $6D
  $81BC  71 69     ADC ($69),Y
  $81BE  71 60     ADC ($60),Y
  $81C0  33        .db $33
  $81C1  33        .db $33
  $81C2  33        .db $33
  $81C3  33        .db $33
  $81C4  1C        .db $1C
  $81C5  33        .db $33
  $81C6  33        .db $33
  $81C7  1C        .db $1C
  $81C8  33        .db $33
  $81C9  1C        .db $1C
  $81CA  1C        .db $1C
  $81CB  33        .db $33
  $81CC  1C        .db $1C
  $81CD  1C        .db $1C
  $81CE  1C        .db $1C
  $81CF  1C        .db $1C
  $81D0  33        .db $33
  $81D1  1C        .db $1C
  $81D2  1C        .db $1C
  $81D3  1C        .db $1C
  $81D4  1C        .db $1C
  $81D5  1C        .db $1C
  $81D6  1C        .db $1C
  $81D7  33        .db $33
  $81D8  36 35     ROL $35,X
  $81DA  36 33     ROL $33,X
  $81DC  33        .db $33
  $81DD  35 35     AND $35,X
  $81DF  35 59     AND $59,X
  $81E1  34        .db $34
  $81E2  71 34     ADC ($34),Y
  $81E4  72        .db $72
  $81E5  69 70     ADC #$70
  $81E7  69 33     ADC #$33
  $81E9  65 33     ADC $33
  $81EB  66 68     ROR $68
  $81ED  68        PLA
  $81EE  49 49     EOR #$49
  $81F0  47        .db $47
  $81F1  4C 47 4D  JMP $4D47
  $81F4  4E 4B 4F  LSR $4F4B
  $81F7  4B        .db $4B
  $81F8  08        PHP
  $81F9  08        PHP
  $81FA  08        PHP
  $81FB  08        PHP
  $81FC  34        .db $34
  $81FD  33        .db $33
  $81FE  08        PHP
  $81FF  08        PHP
  $8200  66 68     ROR $68
  $8202  33        .db $33
  $8203  33        .db $33
  $8204  71 69     ADC ($69),Y
  $8206  72        .db $72
  $8207  69 70     ADC #$70
  $8209  69 71     ADC #$71
  $820B  69 69     ADC #$69
  $820D  61 69     ADC ($69,X)
  $820F  62        .db $62
  $8210  69 60     ADC #$60
  $8212  69 61     ADC #$61
  $8214  68        PLA
  $8215  6E 34 33  ROR $3334
  $8218  68        PLA
  $8219  68        PLA
  $821A  49 4A     EOR #$4A
  $821C  33        .db $33
  $821D  33        .db $33
  $821E  08        PHP
  $821F  08        PHP
  $8220  35 35     AND $35,X

L_8222:
  $8222  35 33     AND $33,X
  $8224  36 35     ROL $35,X
  $8226  36 35     ROL $35,X
  $8228  71 6A     ADC ($6A),Y
  $822A  71 69     ADC ($69),Y
  $822C  33        .db $33
  $822D  33        .db $33
  $822E  5E 34 33  LSR $3334,X
  $8231  33        .db $33
  $8232  33        .db $33
  $8233  5F        .db $5F
  $8234  33        .db $33
  $8235  5A        .db $5A
  $8236  33        .db $33
  $8237  33        .db $33
  $8238  33        .db $33
  $8239  33        .db $33
  $823A  6D 34 62  ADC $6234
  $823D  6D 77 61  ADC $6177
  $8240  4A        LSR
  $8241  52        .db $52
  $8242  00        BRK
  $8243  00        BRK
  $8244  33        .db $33
  $8245  33        .db $33
  $8246  33        .db $33
  $8247  65 33     ADC $33
  $8249  71 65     ADC ($65),Y
  $824B  72        .db $72
  $824C  66 70     ROR $70
  $824E  33        .db $33
  $824F  71 33     ADC ($33),Y
  $8251  66 33     ROR $33
  $8253  33        .db $33
  $8254  00        BRK
  $8255  00        BRK
  $8256  00        BRK
  $8257  00        BRK
  $8258  C5 C5     CMP $C5
  $825A  48        PHA
  $825B  50 C5     BVC $8222
  $825D  C5 16     CMP $16
  $825F  17        .db $17
  $8260  29 30     AND #$30
  $8262  2A        ROL
  $8263  30 2B     BMI $8290
  $8265  30 2C     BMI $8293
  $8267  30 2D     BMI $8296
  $8269  30 2E     BMI $8299
  $826B  30 2F     BMI $829C
  $826D  30 30     BMI $829F
  $826F  30 30     BMI $82A1
  $8271  30 30     BMI $82A3
  $8273  30 17     BMI $828C
  $8275  C5 17     CMP $17
  $8277  4E 38 3A  LSR $3A38
  $827A  39 3B 17  AND $173B,Y
  $827D  AE 17 AE  LDX $AE17
  $8280  01 0D     ORA ($0D,X)
  $8282  02        .db $02
  $8283  0E 03 0F  ASL $0F03
  $8286  04        .db $04
  $8287  11 05     ORA ($05),Y
  $8289  12        .db $12
  $828A  06 13     ASL $13

L_828C:
  $828C  07        .db $07
  $828D  14        .db $14
  $828E  08        PHP
  $828F  15 09     ORA $09,X
  $8291  16 0A     ASL $0A,X

L_8293:
  $8293  17        .db $17
  $8294  0B        .db $0B
  $8295  18        CLC

L_8296:
  $8296  0C        .db $0C
  $8297  19 1A 37  ORA $371A,Y
  $829A  1B        .db $1B
  $829B  26 1C     ROL $1C
  $829D  27        .db $27
  $829E  1D 28 1E  ORA $1E28,X

L_82A1:
  $82A1  29 1F     AND #$1F

L_82A3:
  $82A3  2A        ROL
  $82A4  20 2B 21  JSR $212B
  $82A7  2C 22 2D  BIT $2D22
  $82AA  23        .db $23
  $82AB  2E 24 2F  ROL $2F24
  $82AE  25 37     AND $37
  $82B0  37        .db $37
  $82B1  37        .db $37
  $82B2  37        .db $37
  $82B3  37        .db $37
  $82B4  37        .db $37
  $82B5  37        .db $37
  $82B6  30 37     BMI $82EF
  $82B8  31 37     AND ($37),Y
  $82BA  32        .db $32
  $82BB  37        .db $37
  $82BC  33        .db $33
  $82BD  37        .db $37
  $82BE  34        .db $34
  $82BF  37        .db $37
  $82C0  35 37     AND $37,X
  $82C2  37        .db $37
  $82C3  37        .db $37
  $82C4  78        SEI
  $82C5  7A        .db $7A
  $82C6  79 7B 40  ADC $407B,Y
  $82C9  40        RTI
  $82CA  36 37     ROL $37,X
  $82CC  40        RTI
  $82CD  40        RTI
  $82CE  37        .db $37
  $82CF  37        .db $37
  $82D0  40        RTI
  $82D1  78        SEI
  $82D2  37        .db $37
  $82D3  79 37 78  ADC $7837,Y
  $82D6  37        .db $37
  $82D7  79 7A 78  ADC $787A,Y
  $82DA  7B        .db $7B
  $82DB  79 36 37  ADC $3736,Y
  $82DE  40        RTI
  $82DF  40        RTI
  $82E0  37        .db $37
  $82E1  37        .db $37
  $82E2  40        RTI
  $82E3  40        RTI
  $82E4  37        .db $37
  $82E5  37        .db $37
  $82E6  37        .db $37
  $82E7  7C        .db $7C
  $82E8  37        .db $37
  $82E9  7D 40 40  ADC $4040,X
  $82EC  37        .db $37
  $82ED  78        SEI
  $82EE  7E 79 7F  ROR $7F79,X
  $82F1  78        SEI
  $82F2  40        RTI
  $82F3  79 00 00  ADC $0000,Y
  $82F6  00        BRK
  $82F7  00        BRK
  $82F8  00        BRK
  $82F9  00        BRK
  $82FA  00        BRK
  $82FB  00        BRK
  $82FC  00        BRK
  $82FD  00        BRK
  $82FE  00        BRK
  $82FF  00        BRK
  $8300  5E 5E 6C  LSR $6C5E,X
  $8303  6A        ROR
  $8304  6C 6B 64  JMP ($646B)
  $8307  6C 64 6C  JMP ($6C64)
  $830A  64        .db $64
  $830B  6C 54 54  JMP ($5454)
  $830E  54        .db $54
  $830F  54        .db $54
  $8310  00        BRK
  $8311  00        BRK
  $8312  00        BRK
  $8313  00        BRK
  $8314  64        .db $64
  $8315  6C 5E 5E  JMP ($5E5E)
  $8318  64        .db $64
  $8319  6C 6C 6A  JMP ($6A6C)
  $831C  6C 6B 5E  JMP ($5E6B)
  $831F  5E 5E 5E  LSR $5E5E,X
  $8322  60        RTS
  $8323  00        BRK
  $8324  61 00     ADC ($00,X)
  $8326  30 38     BMI $8360
  $8328  31 39     AND ($39),Y
  $832A  32        .db $32
  $832B  3A        .db $3A
  $832C  33        .db $33
  $832D  3B        .db $3B
  $832E  1A        .db $1A
  $832F  1C        .db $1C
  $8330  1B        .db $1B
  $8331  1D 30 38  ORA $3830,X
  $8334  25 2D     AND $2D
  $8336  5E 5E 33  LSR $335E,X
  $8339  3B        .db $3B
  $833A  60        RTS
  $833B  00        BRK
  $833C  61 00     ADC ($00,X)
  $833E  5E 5E 5E  LSR $5E5E,X
  $8341  5E 00 68  LSR $6800,X
  $8344  00        BRK
  $8345  69 34     ADC #$34
  $8347  3C        .db $3C
  $8348  35 3D     AND $3D,X
  $834A  36 3E     ROL $3E,X
  $834C  37        .db $37
  $834D  3F        .db $3F
  $834E  1A        .db $1A
  $834F  1C        .db $1C
  $8350  1B        .db $1B
  $8351  1D 34 3C  ORA $3C34,X
  $8354  2D 2D 5E  AND $5E2D
  $8357  5E 37 3F  LSR $3F37,X
  $835A  00        BRK
  $835B  68        PLA
  $835C  00        BRK
  $835D  69 5E     ADC #$5E
  $835F  5E 25 2D  LSR $2D25,X
  $8362  25 2D     AND $2D
  $8364  61 00     ADC ($00,X)
  $8366  26 2E     ROL $2E
  $8368  27        .db $27
  $8369  2F        .db $2F
  $836A  1F        .db $1F
  $836B  59 1F 1F  EOR $1F1F,Y
  $836E  1A        .db $1A
  $836F  1C        .db $1C
  $8370  1B        .db $1B
  $8371  1D 1F 1F  ORA $1F1F,X
  $8374  1F        .db $1F
  $8375  59 26 2E  EOR $2E26,Y
  $8378  27        .db $27
  $8379  2F        .db $2F
  $837A  60        RTS
  $837B  00        BRK
  $837C  00        BRK
  $837D  00        BRK
  $837E  00        BRK
  $837F  00        BRK
  $8380  2D 2D 2D  AND $2D2D
  $8383  2D 00 69  AND $6900
  $8386  30 38     BMI $83C0
  $8388  5E 5E 2D  LSR $2D5E,X
  $838B  0D 2D 0E  ORA $0E2D
  $838E  2D 2D 5E  AND $5E2D
  $8391  5E 00 00  LSR $0000,X
  $8394  00        BRK
  $8395  00        BRK
  $8396  2D 2D 33  AND $332D
  $8399  3B        .db $3B
  $839A  00        BRK
  $839B  68        PLA
  $839C  5E 5E 68  LSR $685E,X
  $839F  6A        ROR
  $83A0  69 6B     ADC #$6B
  $83A2  64        .db $64
  $83A3  6C 61 00  JMP ($0061)
  $83A6  59 3C 5E  EOR $5E3C,Y
  $83A9  5E 64 6C  LSR $6C64,X
  $83AC  62        .db $62
  $83AD  00        BRK
  $83AE  63        .db $63
  $83AF  00        BRK
  $83B0  33        .db $33
  $83B1  3B        .db $3B
  $83B2  60        RTS
  $83B3  00        BRK
  $83B4  61 00     ADC ($00,X)
  $83B6  30 38     BMI $83F0
  $83B8  59 3F 60  EOR $603F,Y
  $83BB  00        BRK
  $83BC  5E 5E 25  LSR $255E,X
  $83BF  2D 5E 5E  AND $5E5E
  $83C2  2D 2D 00  AND $002D
  $83C5  69 1F     ADC #$1F
  $83C7  64        .db $64
  $83C8  1F        .db $1F
  $83C9  64        .db $64
  $83CA  1F        .db $1F
  $83CB  64        .db $64
  $83CC  00        BRK
  $83CD  68        PLA
  $83CE  00        BRK
  $83CF  69 37     ADC #$37
  $83D1  3F        .db $3F
  $83D2  00        BRK
  $83D3  68        PLA
  $83D4  00        BRK
  $83D5  69 34     ADC #$34
  $83D7  3C        .db $3C
  $83D8  1F        .db $1F
  $83D9  64        .db $64
  $83DA  00        BRK
  $83DB  68        PLA
  $83DC  2B        .db $2B
  $83DD  2B        .db $2B
  $83DE  2D 2D 5E  AND $5E2D
  $83E1  5E 6A 64  LSR $646A,X
  $83E4  6B        .db $6B
  $83E5  64        .db $64
  $83E6  6C 64 6C  JMP ($6C64)
  $83E9  64        .db $64
  $83EA  6C 64 6A  JMP ($6A64)
  $83ED  64        .db $64
  $83EE  6B        .db $6B
  $83EF  64        .db $64

L_83F0:
  $83F0  00        BRK
  $83F1  00        BRK
  $83F2  00        BRK
  $83F3  00        BRK
  $83F4  00        BRK
  $83F5  00        BRK
  $83F6  00        BRK
  $83F7  00        BRK
  $83F8  6C 64 6A  JMP ($6A64)
  $83FB  64        .db $64
  $83FC  6B        .db $6B
  $83FD  64        .db $64
  $83FE  5E 5E 00  LSR $005E,X
  $8401  00        BRK
  $8402  00        BRK
  $8403  00        BRK
  $8404  00        BRK
  $8405  00        BRK
  $8406  00        BRK
  $8407  05 00     ORA $00
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
  $842F  50 00     BVC $8431

L_8431:
  $8431  00        BRK
  $8432  00        BRK
  $8433  00        BRK
  $8434  44        .db $44
  $8435  00        BRK
  $8436  00        BRK
  $8437  00        BRK
  $8438  00        BRK
  $8439  00        BRK
  $843A  00        BRK
  $843B  00        BRK
  $843C  44        .db $44
  $843D  00        BRK
  $843E  05 05     ORA $05
  $8440  05 05     ORA $05
  $8442  05 00     ORA $00
  $8444  05 00     ORA $00
  $8446  05 44     ORA $44
  $8448  50 50     BVC $849A
  $844A  50 00     BVC $844C

L_844C:
  $844C  05 00     ORA $00
  $844E  45 54     EOR $54
  $8450  05 00     ORA $00
  $8452  00        BRK
  $8453  44        .db $44
  $8454  50 00     BVC $8456

L_8456:
  $8456  15 11     ORA $11,X
  $8458  50 00     BVC $845A

L_845A:
  $845A  50 00     BVC $845C

L_845C:
  $845C  11 11     ORA ($11),Y
  $845E  00        BRK
  $845F  11 AA     ORA ($AA),Y
  $8461  99 66 AA  STA $AA66,Y
  $8464  5F        .db $5F
  $8465  54        .db $54
  $8466  F5 51     SBC $51,X
  $8468  AA        TAX
  $8469  AA        TAX
  $846A  AA        TAX
  $846B  55 55     EOR $55,X
  $846D  55 11     EOR $11,X
  $846F  00        BRK
  $8470  55 55     EOR $55,X
  $8472  55 55     EOR $55,X
  $8474  55 55     EOR $55,X
  $8476  AA        TAX
  $8477  AA        TAX
  $8478  50 00     BVC $847A

L_847A:
  $847A  05 00     ORA $00
  $847C  00        BRK
  $847D  00        BRK
  $847E  00        BRK
  $847F  11 44     ORA ($44),Y
  $8481  00        BRK
  $8482  00        BRK

L_8483:
  $8483  00        BRK
  $8484  00        BRK
  $8485  44        .db $44
  $8486  00        BRK
  $8487  11 AA     ORA ($AA),Y
  $8489  AA        TAX
  $848A  00        BRK
  $848B  51 15     EOR ($15),Y
  $848D  45 51     EOR $51
  $848F  00        BRK
  $8490  33        .db $33
  $8491  15 01     ORA $01,X
  $8493  04        .db $04
  $8494  45 00     EOR $00
  $8496  CC 88 0A  CPY $0A88
  $8499  0A        ASL

L_849A:
  $849A  0A        ASL
  $849B  0A        ASL
  $849C  00        BRK
  $849D  CA        DEX
  $849E  00        BRK
  $849F  0A        ASL
  $84A0  CC FF FF  CPY $FFFF
  $84A3  FF        .db $FF
  $84A4  FF        .db $FF
  $84A5  33        .db $33
  $84A6  00        BRK
  $84A7  CF        .db $CF
  $84A8  FF        .db $FF
  $84A9  FF        .db $FF
  $84AA  3F        .db $3F
  $84AB  00        BRK
  $84AC  00        BRK
  $84AD  00        BRK
  $84AE  00        BRK
  $84AF  00        BRK
  $84B0  00        BRK
  $84B1  55 11     EOR $11,X
  $84B3  11 51     ORA ($51),Y
  $84B5  50 55     BVC $850C
  $84B7  44        .db $44
  $84B8  44        .db $44
  $84B9  80        .db $80
  $84BA  64        .db $64
  $84BB  58        CLI
  $84BC  56 00     LSR $00,X
  $84BE  00        BRK
  $84BF  00        BRK
  $84C0  40        RTI
  $84C1  10 00     BPL $84C3

L_84C3:
  $84C3  00        BRK
  $84C4  00        BRK
  $84C5  00        BRK
  $84C6  40        RTI
  $84C7  10 04     BPL $84CD
  $84C9  CD FF BB  CMP $BBFF
  $84CC  EE 22 37  INC $3722
  $84CF  01 40     ORA ($40,X)
  $84D1  DC        .db $DC
  $84D2  FF        .db $FF
  $84D3  BB        .db $BB
  $84D4  EE 22 73  INC $7322
  $84D7  10 AA     BPL $8483
  $84D9  89        .db $89
  $84DA  2A        ROL
  $84DB  AA        TAX
  $84DC  AA        TAX
  $84DD  8A        TXA
  $84DE  26 00     ROL $00
  $84E0  AA        TAX
  $84E1  DC        .db $DC
  $84E2  88        DEY
  $84E3  AA        TAX
  $84E4  00        BRK
  $84E5  88        DEY
  $84E6  73        .db $73
  $84E7  44        .db $44
  $84E8  11 C1     ORA ($C1),Y
  $84EA  00        BRK
  $84EB  05 37     ORA $37
  $84ED  CD 34 88  CMP $8834
  $84F0  88        DEY
  $84F1  18        CLC
  $84F2  0A        ASL
  $84F3  50 73     BVC $8568
  $84F5  DC        .db $DC
  $84F6  42        .db $42
  $84F7  99 04 01  STA $0104,Y
  $84FA  00        BRK
  $84FB  05 00     ORA $00
  $84FD  00        BRK
  $84FE  04        .db $04
  $84FF  01 09     ORA ($09,X)
  $8501  11 09     ORA ($09),Y
  $8503  0D 21 19  ORA $1921
  $8506  21 21     AND ($21,X)
  $8508  72        .db $72
  $8509  74        .db $74
  $850A  69 03     ADC #$03

L_850C:
  $850C  39 05 33  AND $3305,Y
  $850F  33        .db $33
  $8510  60        RTS
  $8511  60        RTS
  $8512  70 69     BVS $857D
  $8514  68        PLA
  $8515  18        CLC
  $8516  22        .db $22
  $8517  22        .db $22
  $8518  72        .db $72
  $8519  60        RTS
  $851A  60        RTS
  $851B  70 69     BVS $8586
  $851D  10 33     BPL $8552
  $851F  33        .db $33
  $8520  75 71     ADC $71,X
  $8522  72        .db $72
  $8523  70 71     BVS $8596
  $8525  0B        .db $0B
  $8526  11 11     ORA ($11),Y
  $8528  6A        ROR
  $8529  72        .db $72
  $852A  61 71     ADC ($71,X)
  $852C  72        .db $72
  $852D  70 70     BVS $859F
  $852F  70 68     BVS $8599
  $8531  6A        ROR
  $8532  62        .db $62
  $8533  72        .db $72
  $8534  75 0C     ADC $0C,X
  $8536  12        .db $12
  $8537  0A        ASL
  $8538  0A        ASL
  $8539  12        .db $12
  $853A  0A        ASL
  $853B  12        .db $12
  $853C  0A        ASL
  $853D  0E 22 1A  ASL $1A22
  $8540  19 19 19  ORA $1919,Y
  $8543  19 25 09  ORA $0925,Y
  $8546  09 09     ORA #$09
  $8548  08        PHP
  $8549  15 38     ORA $38,X
  $854B  34        .db $34
  $854C  3C        .db $3C
  $854D  6C 72 71  JMP ($7172)
  $8550  1A        .db $1A
  $8551  2A        ROL

L_8552:
  $8552  6B        .db $6B
  $8553  71 72     ADC ($72),Y
  $8555  71 0C     ADC ($0C),Y
  $8557  12        .db $12
  $8558  08        PHP
  $8559  5B        .db $5B
  $855A  5A        .db $5A
  $855B  70 35     BVS $8592
  $855D  3D 06 33  AND $3306,X
  $8560  09 49     ORA #$49
  $8562  73        .db $73
  $8563  71 72     ADC ($72),Y
  $8565  10 08     BPL $856F
  $8567  33        .db $33

L_8568:
  $8568  71 72     ADC ($72),Y
  $856A  70 0C     BVS $8578
  $856C  12        .db $12
  $856D  0E 1A 22  ASL $221A
  $8570  0A        ASL
  $8571  0A        ASL
  $8572  12        .db $12
  $8573  0E 22 1A  ASL $1A22
  $8576  1A        .db $1A
  $8577  22        .db $22

L_8578:
  $8578  1A        .db $1A
  $8579  1A        .db $1A
  $857A  22        .db $22
  $857B  1A        .db $1A
  $857C  22        .db $22

L_857D:
  $857D  1A        .db $1A
  $857E  1A        .db $1A
  $857F  22        .db $22
  $8580  09 09     ORA #$09
  $8582  0D 19 19  ORA $1919
  $8585  21 19     AND ($19,X)
  $8587  21 70     AND ($70,X)
  $8589  71 36     ADC ($36),Y
  $858B  19 25 11  ORA $1125,Y
  $858E  09 11     ORA #$11
  $8590  2C 6B 3E  BIT $3E6B
  $8593  08        PHP
  $8594  28        PLP
  $8595  6B        .db $6B

L_8596:
  $8596  60        RTS
  $8597  70 29     BVS $85C2

L_8599:
  $8599  6B        .db $6B
  $859A  3F        .db $3F
  $859B  17        .db $17
  $859C  13        .db $13
  $859D  6B        .db $6B
  $859E  60        RTS

L_859F:
  $859F  70 1E     BVS $85BF
  $85A1  4A        LSR
  $85A2  70 1F     BVS $85C3
  $85A4  6B        .db $6B
  $85A5  61 61     ADC ($61,X)
  $85A7  70 22     BVS $85CB
  $85A9  8F        .db $8F
  $85AA  6B        .db $6B
  $85AB  27        .db $27
  $85AC  6B        .db $6B
  $85AD  62        .db $62
  $85AE  62        .db $62
  $85AF  70 22     BVS $85D3
  $85B1  2A        ROL
  $85B2  6B        .db $6B
  $85B3  71 72     ADC ($72),Y
  $85B5  0C        .db $0C
  $85B6  12        .db $12
  $85B7  0A        ASL
  $85B8  22        .db $22
  $85B9  26 12     ROL $12
  $85BB  0A        ASL
  $85BC  0A        ASL
  $85BD  0E 22 1A  ASL $1A22
  $85C0  21 30     AND ($30,X)

L_85C2:
  $85C2  40        RTI

L_85C3:
  $85C3  48        PHA
  $85C4  10 33     BPL $85F9
  $85C6  33        .db $33
  $85C7  08        PHP
  $85C8  11 1B     ORA ($1B),Y
  $85CA  41 49     EOR ($49,X)
  $85CC  0B        .db $0B
  $85CD  11 11     ORA ($11),Y
  $85CF  09 71     ORA #$71
  $85D1  72        .db $72
  $85D2  73        .db $73

L_85D3:
  $85D3  70 72     BVS $8647
  $85D5  70 71     BVS $8648
  $85D7  70 60     BVS $8639
  $85D9  60        RTS
  $85DA  70 71     BVS $864D
  $85DC  72        .db $72
  $85DD  70 04     BVS $85E3
  $85DF  3A        .db $3A
  $85E0  70 71     BVS $8653
  $85E2  72        .db $72

L_85E3:
  $85E3  70 71     BVS $8656
  $85E5  0C        .db $0C
  $85E6  0E 22 73  ASL $7322
  $85E9  72        .db $72
  $85EA  71 70     ADC ($70),Y
  $85EC  0C        .db $0C
  $85ED  0E 1A 22  ASL $221A
  $85F0  12        .db $12
  $85F1  2C 42 4A  BIT $4A42
  $85F4  10 08     BPL $85FE
  $85F6  08        PHP
  $85F7  33        .db $33
  $85F8  22        .db $22

L_85F9:
  $85F9  32        .db $32
  $85FA  40        RTI
  $85FB  48        PHA
  $85FC  18        CLC
  $85FD  1A        .db $1A

L_85FE:
  $85FE  1A        .db $1A
  $85FF  22        .db $22
  $8600  2D 09 49  AND $4909
  $8603  27        .db $27
  $8604  41 13     EOR ($13,X)
  $8606  41 01     EOR ($01,X)
  $8608  23        .db $23
  $8609  6B        .db $6B
  $860A  71 72     ADC ($72),Y
  $860C  75 72     ADC $72,X
  $860E  70 70     BVS $8680
  $8610  70 60     BVS $8672
  $8612  70 60     BVS $8674
  $8614  70 4B     BVS $8661
  $8616  4C 45 14  JMP $1445
  $8619  6B        .db $6B
  $861A  70 60     BVS $867C
  $861C  70 70     BVS $868E
  $861E  71 72     ADC ($72),Y
  $8620  2A        ROL
  $8621  6B        .db $6B
  $8622  72        .db $72
  $8623  71 70     ADC ($70),Y
  $8625  72        .db $72
  $8626  73        .db $73
  $8627  71 2A     ADC ($2A),Y
  $8629  6B        .db $6B
  $862A  71 72     ADC ($72),Y
  $862C  70 70     BVS $869E
  $862E  71 70     ADC ($70),Y
  $8630  16 02     ASL $02,X
  $8632  4A        LSR
  $8633  37        .db $37
  $8634  42        .db $42
  $8635  14        .db $14
  $8636  42        .db $42
  $8637  12        .db $12
  $8638  1A        .db $1A

L_8639:
  $8639  1A        .db $1A
  $863A  48        PHA
  $863B  1F        .db $1F
  $863C  40        RTI
  $863D  28        PLP
  $863E  40        RTI
  $863F  33        .db $33
  $8640  01 13     ORA ($13,X)
  $8642  41 13     EOR ($13,X)
  $8644  41 01     EOR ($01,X)
  $8646  11 01     ORA ($01),Y

L_8648:
  $8648  70 70     BVS $86BA
  $864A  70 72     BVS $86BE
  $864C  71 70     ADC ($70),Y
  $864E  70 70     BVS $86C0
  $8650  45 4D     EOR $4D
  $8652  42        .db $42

L_8653:
  $8653  1C        .db $1C
  $8654  6B        .db $6B
  $8655  07        .db $07

L_8656:
  $8656  51 3A     EOR ($3A),Y
  $8658  70 70     BVS $86CA
  $865A  4E 47 4F  LSR $4F47
  $865D  3E 40 22  ROL $2240,X
  $8660  60        RTS

L_8661:
  $8661  60        RTS
  $8662  8C 57 8B  STY $8B57
  $8665  50 41     BVC $86A8
  $8667  11 70     ORA ($70),Y
  $8669  60        RTS
  $866A  70 70     BVS $86DC
  $866C  70 70     BVS $86DE
  $866E  70 70     BVS $86E0
  $8670  12        .db $12
  $8671  2C 46 42  BIT $4246

L_8674:
  $8674  02        .db $02
  $8675  24 42     BIT $42
  $8677  02        .db $02
  $8678  33        .db $33
  $8679  29 40     AND #$40
  $867B  40        RTI

L_867C:
  $867C  19 31 40  ORA $4031,Y
  $867F  08        PHP

L_8680:
  $8680  01 11     ORA ($11,X)
  $8682  01 01     ORA ($01,X)
  $8684  11 11     ORA ($11),Y
  $8686  01 01     ORA ($01,X)
  $8688  70 70     BVS $86FA
  $868A  70 70     BVS $86FC
  $868C  70 70     BVS $86FE

L_868E:
  $868E  60        RTS
  $868F  70 02     BVS $8693
  $8691  52        .db $52
  $8692  45 45     EOR $45
  $8694  45 54     EOR $54
  $8696  56 57     LSR $57,X
  $8698  1A        .db $1A
  $8699  32        .db $32
  $869A  6B        .db $6B
  $869B  70 70     BVS $870D
  $869D  2F        .db $2F

L_869E:
  $869E  3E 21 09  ROL $0921,X
  $86A1  2B        .db $2B
  $86A2  6B        .db $6B
  $86A3  37        .db $37
  $86A4  6B        .db $6B
  $86A5  58        CLI
  $86A6  3E 33 70  ROL $7033,X
  $86A9  70 70     BVS $871B
  $86AB  53        .db $53
  $86AC  6C 70 3E  JMP ($3E70)
  $86AF  22        .db $22
  $86B0  02        .db $02
  $86B1  5E 5F 57  LSR $575F,X
  $86B4  57        .db $57
  $86B5  55 43     EOR $43,X
  $86B7  33        .db $33
  $86B8  19 19 21  ORA $2119,Y
  $86BB  19 19 21  ORA $2119,Y

L_86BE:
  $86BE  19 19 11  ORA $1119,Y
  $86C1  09 09     ORA #$09
  $86C3  11 09     ORA ($09),Y
  $86C5  11 0D     ORA ($0D),Y
  $86C7  21 60     AND ($60,X)
  $86C9  60        RTS

L_86CA:
  $86CA  70 60     BVS $872C
  $86CC  71 77     ADC ($77),Y
  $86CE  18        CLC
  $86CF  22        .db $22
  $86D0  5D 6D 71  EOR $716D,X
  $86D3  72        .db $72
  $86D4  77        .db $77
  $86D5  68        PLA
  $86D6  20 21 30  JSR $3021
  $86D9  6B        .db $6B
  $86DA  60        RTS
  $86DB  70 71     BVS $874E
  $86DD  69 18     ADC #$18
  $86DF  22        .db $22

L_86E0:
  $86E0  28        PLP
  $86E1  6B        .db $6B
  $86E2  60        RTS
  $86E3  70 75     BVS $875A
  $86E5  72        .db $72
  $86E6  10 33     BPL $871B
  $86E8  2A        ROL
  $86E9  6B        .db $6B
  $86EA  72        .db $72
  $86EB  73        .db $73
  $86EC  70 77     BVS $8765
  $86EE  18        CLC
  $86EF  22        .db $22
  $86F0  28        PLP
  $86F1  63        .db $63
  $86F2  77        .db $77
  $86F3  6A        ROR
  $86F4  77        .db $77
  $86F5  88        DEY
  $86F6  10 33     BPL $872B
  $86F8  30 76     BMI $8770

L_86FA:
  $86FA  70 69     BVS $8765

L_86FC:
  $86FC  88        DEY
  $86FD  74        .db $74

L_86FE:
  $86FE  10 33     BPL $8733
  $8700  32        .db $32
  $8701  6B        .db $6B
  $8702  70 74     BVS $8778
  $8704  70 04     BVS $870A
  $8706  06 08     ASL $08
  $8708  29 6B     AND #$6B

L_870A:
  $870A  60        RTS
  $870B  70 71     BVS $877E

L_870D:
  $870D  20 19 19  JSR $1919
  $8710  31 6B     AND ($6B),Y
  $8712  72        .db $72
  $8713  71 04     ADC ($04),Y
  $8715  06 08     ASL $08
  $8717  08        PHP
  $8718  29 6B     AND #$6B
  $871A  70 72     BVS $878E
  $871C  0B        .db $0B
  $871D  0D 19 19  ORA $1919
  $8720  32        .db $32
  $8721  6B        .db $6B
  $8722  60        RTS
  $8723  70 70     BVS $8795
  $8725  0B        .db $0B
  $8726  0D 19 59  ORA $5919
  $8729  5C        .db $5C
  $872A  6D 70 70  ADC $7070
  $872D  70 10     BVS $873F
  $872F  08        PHP
  $8730  21 30     AND ($30,X)
  $8732  6B        .db $6B

L_8733:
  $8733  60        RTS
  $8734  70 71     BVS $87A7
  $8736  20 19 33  JSR $3319
  $8739  28        PLP
  $873A  6B        .db $6B
  $873B  60        RTS
  $873C  70 72     BVS $87B0
  $873E  10 08     BPL $8748
  $8740  22        .db $22
  $8741  2A        ROL
  $8742  63        .db $63
  $8743  71 70     ADC ($70),Y
  $8745  0C        .db $0C
  $8746  0E 1A 33  ASL $331A
  $8749  28        PLP
  $874A  76 6A     ROR $6A,X
  $874C  77        .db $77
  $874D  20 19 19  JSR $1919
  $8750  21 30     AND ($30,X)
  $8752  6B        .db $6B
  $8753  69 0C     ADC #$0C
  $8755  0E 1A 1A  ASL $1A1A
  $8758  33        .db $33
  $8759  28        PLP

L_875A:
  $875A  6B        .db $6B
  $875B  70 03     BVS $8760
  $875D  05 08     ORA $08
  $875F  08        PHP

L_8760:
  $8760  22        .db $22
  $8761  2A        ROL
  $8762  6B        .db $6B
  $8763  72        .db $72
  $8764  71 18     ADC ($18),Y
  $8766  1A        .db $1A
  $8767  1A        .db $1A
  $8768  21 30     AND ($30,X)
  $876A  6B        .db $6B
  $876B  60        RTS
  $876C  70 03     BVS $8771
  $876E  05 08     ORA $08

L_8770:
  $8770  33        .db $33

L_8771:
  $8771  28        PLP
  $8772  6B        .db $6B
  $8773  60        RTS
  $8774  60        RTS
  $8775  70 18     BVS $878F
  $8777  1A        .db $1A

L_8778:
  $8778  22        .db $22
  $8779  2A        ROL
  $877A  6B        .db $6B
  $877B  71 72     ADC ($72),Y
  $877D  70 10     BVS $878F
  $877F  08        PHP
  $8780  33        .db $33
  $8781  16 24     ASL $24,X
  $8783  6B        .db $6B
  $8784  70 0C     BVS $8792
  $8786  0E 1A 21  ASL $211A
  $8789  19 31 6B  ORA $6B31,Y
  $878C  70 10     BVS $879E

L_878E:
  $878E  08        PHP

L_878F:
  $878F  08        PHP
  $8790  33        .db $33
  $8791  08        PHP

L_8792:
  $8792  29 6B     AND #$6B
  $8794  70 18     BVS $87AE
  $8796  1A        .db $1A
  $8797  1A        .db $1A
  $8798  22        .db $22
  $8799  1A        .db $1A
  $879A  32        .db $32
  $879B  6B        .db $6B
  $879C  70 20     BVS $87BE

L_879E:
  $879E  19 19 21  ORA $2119,Y
  $87A1  19 31 6B  ORA $6B31,Y
  $87A4  70 10     BVS $87B6
  $87A6  08        PHP

L_87A7:
  $87A7  08        PHP
  $87A8  21 19     AND ($19,X)
  $87AA  31 6B     AND ($6B),Y
  $87AC  70 10     BVS $87BE

L_87AE:
  $87AE  08        PHP
  $87AF  08        PHP

L_87B0:
  $87B0  33        .db $33
  $87B1  08        PHP
  $87B2  29 6B     AND #$6B
  $87B4  0C        .db $0C
  $87B5  0E 1A 1A  ASL $1A1A
  $87B8  22        .db $22
  $87B9  1A        .db $1A
  $87BA  32        .db $32
  $87BB  6B        .db $6B
  $87BC  10 08     BPL $87C6

L_87BE:
  $87BE  08        PHP
  $87BF  08        PHP
  $87C0  33        .db $33
  $87C1  08        PHP
  $87C2  29 6B     AND #$6B
  $87C4  10 08     BPL $87CE

L_87C6:
  $87C6  08        PHP
  $87C7  48        PHA
  $87C8  22        .db $22
  $87C9  1A        .db $1A
  $87CA  32        .db $32
  $87CB  6B        .db $6B
  $87CC  18        CLC
  $87CD  1A        .db $1A

L_87CE:
  $87CE  1A        .db $1A
  $87CF  48        PHA
  $87D0  33        .db $33
  $87D1  08        PHP
  $87D2  29 6B     AND #$6B
  $87D4  20 19 19  JSR $1919
  $87D7  48        PHA
  $87D8  21 19     AND ($19,X)
  $87DA  31 6B     AND ($6B),Y
  $87DC  10 08     BPL $87E6
  $87DE  08        PHP
  $87DF  48        PHA
  $87E0  22        .db $22
  $87E1  1A        .db $1A
  $87E2  32        .db $32
  $87E3  6B        .db $6B
  $87E4  0B        .db $0B
  $87E5  09 09     ORA #$09
  $87E7  49 33     EOR #$33
  $87E9  08        PHP
  $87EA  29 6B     AND #$6B
  $87EC  70 70     BVS $885E
  $87EE  70 70     BVS $8860
  $87F0  22        .db $22
  $87F1  1A        .db $1A
  $87F2  2E 12 0A  ROL $0A12
  $87F5  12        .db $12
  $87F6  0A        ASL
  $87F7  4A        LSR
  $87F8  33        .db $33
  $87F9  08        PHP
  $87FA  33        .db $33
  $87FB  33        .db $33
  $87FC  08        PHP
  $87FD  33        .db $33
  $87FE  08        PHP
  $87FF  48        PHA
  $8800  6B        .db $6B
  $8801  70 70     BVS $8873
  $8803  72        .db $72
  $8804  3E 6B 70  ROL $706B,X
  $8807  73        .db $73
  $8808  6B        .db $6B
  $8809  70 70     BVS $887B
  $880B  70 3E     BVS $884B
  $880D  6B        .db $6B
  $880E  70 70     BVS $8880
  $8810  6B        .db $6B
  $8811  70 70     BVS $8883
  $8813  70 3E     BVS $8853
  $8815  6B        .db $6B
  $8816  70 70     BVS $8888
  $8818  6B        .db $6B
  $8819  70 70     BVS $888B
  $881B  67        .db $67
  $881C  8D 6C 78  STA $786C
  $881F  70 6B     BVS $888C
  $8821  70 70     BVS $8893
  $8823  65 67     ADC $67
  $8825  70 58     BVS $887F
  $8827  70 70     BVS $8899
  $8829  70 67     BVS $8892
  $882B  70 2F     BVS $885C
  $882D  70 70     BVS $889F
  $882F  71 6B     ADC ($6B),Y
  $8831  70 2F     BVS $8862
  $8833  70 2F     BVS $8864
  $8835  72        .db $72
  $8836  71 72     ADC ($72),Y
  $8838  6B        .db $6B
  $8839  70 2F     BVS $886A
  $883B  70 2F     BVS $886C
  $883D  73        .db $73
  $883E  73        .db $73
  $883F  73        .db $73
  $8840  73        .db $73
  $8841  73        .db $73
  $8842  2F        .db $2F
  $8843  75 72     ADC $72,X
  $8845  70 70     BVS $88B7
  $8847  70 75     BVS $88BE
  $8849  72        .db $72
  $884A  2F        .db $2F

L_884B:
  $884B  70 70     BVS $88BD
  $884D  70 70     BVS $88BF
  $884F  70 71     BVS $88C2
  $8851  72        .db $72
  $8852  58        CLI

L_8853:
  $8853  70 70     BVS $88C5
  $8855  78        SEI
  $8856  70 70     BVS $88C8
  $8858  70 70     BVS $88CA
  $885A  70 44     BVS $88A0

L_885C:
  $885C  6B        .db $6B
  $885D  2F        .db $2F

L_885E:
  $885E  70 70     BVS $88D0

L_8860:
  $8860  70 70     BVS $88D2

L_8862:
  $8862  70 50     BVS $88B4

L_8864:
  $8864  6B        .db $6B
  $8865  2F        .db $2F
  $8866  70 70     BVS $88D8
  $8868  70 70     BVS $88DA

L_886A:
  $886A  78        SEI
  $886B  70 70     BVS $88DD
  $886D  58        CLI
  $886E  70 70     BVS $88E0
  $8870  70 75     BVS $88E7
  $8872  2F        .db $2F

L_8873:
  $8873  70 70     BVS $88E5
  $8875  70 71     BVS $88E8
  $8877  72        .db $72
  $8878  75 72     ADC $72,X
  $887A  2F        .db $2F

L_887B:
  $887B  71 70     ADC ($70),Y
  $887D  72        .db $72
  $887E  74        .db $74

L_887F:
  $887F  73        .db $73

L_8880:
  $8880  70 70     BVS $88F2
  $8882  2F        .db $2F

L_8883:
  $8883  70 70     BVS $88F5
  $8885  70 71     BVS $88F8
  $8887  72        .db $72

L_8888:
  $8888  70 70     BVS $88FA
  $888A  2F        .db $2F

L_888B:
  $888B  70 70     BVS $88FD
  $888D  70 70     BVS $88FF
  $888F  70 70     BVS $8901
  $8891  70 58     BVS $88EB

L_8893:
  $8893  70 70     BVS $8905
  $8895  70 0C     BVS $88A3
  $8897  4A        LSR
  $8898  70 70     BVS $890A
  $889A  70 70     BVS $890C
  $889C  70 70     BVS $890E
  $889E  10 48     BPL $88E8

L_88A0:
  $88A0  70 70     BVS $8912
  $88A2  70 70     BVS $8914
  $88A4  70 70     BVS $8916
  $88A6  18        CLC
  $88A7  48        PHA
  $88A8  70 70     BVS $891A
  $88AA  78        SEI
  $88AB  70 70     BVS $891D
  $88AD  71 10     ADC ($10),Y
  $88AF  48        PHA
  $88B0  71 70     ADC ($70),Y
  $88B2  2F        .db $2F
  $88B3  70 71     BVS $8926
  $88B5  74        .db $74
  $88B6  10 48     BPL $8900
  $88B8  75 72     ADC $72,X
  $88BA  2F        .db $2F
  $88BB  70 72     BVS $892F

L_88BD:
  $88BD  75 18     ADC $18,X

L_88BF:
  $88BF  48        PHA
  $88C0  71 70     ADC ($70),Y

L_88C2:
  $88C2  3E 40 40  ROL $4040,X

L_88C5:
  $88C5  6B        .db $6B
  $88C6  70 70     BVS $8938

L_88C8:
  $88C8  70 70     BVS $893A

L_88CA:
  $88CA  50 40     BVC $890C
  $88CC  40        RTI
  $88CD  6B        .db $6B
  $88CE  70 70     BVS $8940

L_88D0:
  $88D0  6B        .db $6B
  $88D1  70 70     BVS $8943
  $88D3  50 40     BVC $8915
  $88D5  6B        .db $6B
  $88D6  70 70     BVS $8948

L_88D8:
  $88D8  6B        .db $6B
  $88D9  70 70     BVS $894B
  $88DB  70 3E     BVS $891B

L_88DD:
  $88DD  6B        .db $6B
  $88DE  70 70     BVS $8950

L_88E0:
  $88E0  6B        .db $6B
  $88E1  70 70     BVS $8953
  $88E3  70 50     BVS $8935

L_88E5:
  $88E5  6B        .db $6B
  $88E6  0C        .db $0C

L_88E7:
  $88E7  0A        ASL

L_88E8:
  $88E8  6B        .db $6B
  $88E9  70 70     BVS $895B

L_88EB:
  $88EB  71 70     ADC ($70),Y
  $88ED  70 18     BVS $8907
  $88EF  1A        .db $1A
  $88F0  6B        .db $6B
  $88F1  70 72     BVS $8965
  $88F3  71 72     ADC ($72),Y

L_88F5:
  $88F5  71 20     ADC ($20),Y
  $88F7  19 6B 70  ORA $706B,Y

L_88FA:
  $88FA  71 73     ADC ($73),Y
  $88FC  73        .db $73

L_88FD:
  $88FD  74        .db $74
  $88FE  10 08     BPL $8908

L_8900:
  $8900  71 72     ADC ($72),Y
  $8902  70 74     BVS $8978
  $8904  70 72     BVS $8978
  $8906  70 70     BVS $8978

L_8908:
  $8908  70 70     BVS $897A

L_890A:
  $890A  70 70     BVS $897C

L_890C:
  $890C  70 71     BVS $897F

L_890E:
  $890E  70 70     BVS $8980
  $8910  70 70     BVS $8982

L_8912:
  $8912  71 70     ADC ($70),Y

L_8914:
  $8914  72        .db $72

L_8915:
  $8915  75 70     ADC $70,X
  $8917  71 70     ADC ($70),Y
  $8919  70 70     BVS $898B

L_891B:
  $891B  44        .db $44
  $891C  6B        .db $6B

L_891D:
  $891D  70 78     BVS $8997
  $891F  72        .db $72
  $8920  12        .db $12
  $8921  0A        ASL
  $8922  2C 40 3A  BIT $3A40
  $8925  4A        LSR

L_8926:
  $8926  8A        TXA
  $8927  4A        LSR
  $8928  22        .db $22
  $8929  1A        .db $1A
  $892A  32        .db $32
  $892B  40        RTI
  $892C  21 48     AND ($48,X)
  $892E  10 48     BPL $8978
  $8930  21 19     AND ($19,X)
  $8932  31 40     AND ($40),Y
  $8934  22        .db $22

L_8935:
  $8935  48        PHA
  $8936  10 48     BPL $8980

L_8938:
  $8938  33        .db $33
  $8939  08        PHP

L_893A:
  $893A  29 40     AND #$40
  $893C  33        .db $33
  $893D  48        PHA
  $893E  10 48     BPL $8988

L_8940:
  $8940  75 70     ADC $70,X
  $8942  3E 48 70  ROL $7048,X
  $8945  70 71     BVS $89B8
  $8947  75 72     ADC $72,X
  $8949  71 3E     ADC ($3E),Y

L_894B:
  $894B  48        PHA
  $894C  70 71     BVS $89BF
  $894E  72        .db $72
  $894F  70 71     BVS $89C2
  $8951  72        .db $72
  $8952  3E 48 70  ROL $7048,X
  $8955  70 70     BVS $89C7
  $8957  72        .db $72
  $8958  70 70     BVS $89CA
  $895A  3F        .db $3F

L_895B:
  $895B  49 56     EOR #$56
  $895D  8E 70 70  STX $7070
  $8960  6B        .db $6B
  $8961  70 70     BVS $89D3
  $8963  70 3E     BVS $89A3

L_8965:
  $8965  48        PHA
  $8966  70 70     BVS $89D8
  $8968  6B        .db $6B
  $8969  70 71     BVS $89DC
  $896B  70 3E     BVS $89AB
  $896D  48        PHA
  $896E  70 70     BVS $89E0
  $8970  6B        .db $6B
  $8971  70 70     BVS $89E3
  $8973  70 3E     BVS $89B3
  $8975  48        PHA
  $8976  72        .db $72
  $8977  71 6B     ADC ($6B),Y
  $8979  70 70     BVS $89EB
  $897B  70 3E     BVS $89BB
  $897D  48        PHA
  $897E  71 72     ADC ($72),Y

L_8980:
  $8980  71 72     ADC ($72),Y

L_8982:
  $8982  1F        .db $1F
  $8983  6B        .db $6B
  $8984  6F        .db $6F
  $8985  01 39     ORA ($39,X)
  $8987  01 70     ORA ($70,X)
  $8989  71 1F     ADC ($1F),Y

L_898B:
  $898B  6B        .db $6B
  $898C  1F        .db $1F
  $898D  6B        .db $6B
  $898E  70 70     BVS $8A00
  $8990  70 71     BVS $8A03
  $8992  1F        .db $1F
  $8993  6B        .db $6B
  $8994  1F        .db $1F
  $8995  6B        .db $6B
  $8996  0C        .db $0C

L_8997:
  $8997  12        .db $12
  $8998  71 75     ADC ($75),Y
  $899A  27        .db $27
  $899B  6B        .db $6B
  $899C  27        .db $27
  $899D  6B        .db $6B
  $899E  10 33     BPL $89D3
  $89A0  70 70     BVS $8A12
  $89A2  70 70     BVS $8A14
  $89A4  70 70     BVS $8A16
  $89A6  18        CLC
  $89A7  22        .db $22
  $89A8  70 70     BVS $8A1A
  $89AA  70 70     BVS $8A1C
  $89AC  70 70     BVS $8A1E
  $89AE  10 33     BPL $89E3
  $89B0  71 71     ADC ($71),Y
  $89B2  6E 6D 6E  ROR $6E6D
  $89B5  6D 20 21  ADC $2120

L_89B8:
  $89B8  71 72     ADC ($72),Y
  $89BA  1F        .db $1F

L_89BB:
  $89BB  6B        .db $6B
  $89BC  1F        .db $1F
  $89BD  6B        .db $6B
  $89BE  10 33     BPL $89F3
  $89C0  01 39     ORA ($39,X)

L_89C2:
  $89C2  01 01     ORA ($01,X)
  $89C4  39 01 05  AND $0501,Y

L_89C7:
  $89C7  08        PHP
  $89C8  70 70     BVS $8A3A

L_89CA:
  $89CA  71 70     ADC ($70),Y
  $89CC  72        .db $72
  $89CD  70 10     BVS $89DF
  $89CF  08        PHP
  $89D0  0A        ASL
  $89D1  2C 6B 60  BIT $606B
  $89D4  70 70     BVS $8A46
  $89D6  18        CLC
  $89D7  1A        .db $1A

L_89D8:
  $89D8  08        PHP
  $89D9  29 6B     AND #$6B
  $89DB  71 60     ADC ($60),Y
  $89DD  70 10     BVS $89EF

L_89DF:
  $89DF  08        PHP

L_89E0:
  $89E0  1A        .db $1A
  $89E1  32        .db $32
  $89E2  6B        .db $6B

L_89E3:
  $89E3  60        RTS
  $89E4  70 70     BVS $8A56
  $89E6  20 19 08  JSR $0819
  $89E9  29 6B     AND #$6B

L_89EB:
  $89EB  72        .db $72
  $89EC  71 77     ADC ($77),Y
  $89EE  20 19 19  JSR $1919
  $89F1  31 89     AND ($89),Y

L_89F3:
  $89F3  68        PLA
  $89F4  68        PLA
  $89F5  68        PLA
  $89F6  10 08     BPL $8A00
  $89F8  08        PHP
  $89F9  29 6B     AND #$6B
  $89FB  60        RTS
  $89FC  70 69     BVS $8A67
  $89FE  20 19 08  JSR $0819
  $8A01  29 6B     AND #$6B

L_8A03:
  $8A03  60        RTS
  $8A04  60        RTS
  $8A05  70 20     BVS $8A27
  $8A07  19 19 31  ORA $3119,Y
  $8A0A  6B        .db $6B
  $8A0B  60        RTS
  $8A0C  70 70     BVS $8A7E
  $8A0E  18        CLC
  $8A0F  1A        .db $1A
  $8A10  08        PHP
  $8A11  29 6B     AND #$6B
  $8A13  70 71     BVS $8A86
  $8A15  7A        .db $7A

L_8A16:
  $8A16  79 08 19  ADC $1908,Y
  $8A19  31 6B     AND ($6B),Y
  $8A1B  71 72     ADC ($72),Y
  $8A1D  73        .db $73

L_8A1E:
  $8A1E  18        CLC
  $8A1F  1A        .db $1A
  $8A20  19 31 6B  ORA $6B31,Y
  $8A23  71 71     ADC ($71),Y
  $8A25  72        .db $72
  $8A26  10 08     BPL $8A30
  $8A28  08        PHP
  $8A29  1E 14 6B  ASL $6B14,X
  $8A2C  70 7A     BVS $8AA8
  $8A2E  79 08 19  ADC $1908,Y
  $8A31  21 30     AND ($30,X)
  $8A33  63        .db $63
  $8A34  72        .db $72
  $8A35  71 18     ADC ($18),Y
  $8A37  1A        .db $1A
  $8A38  08        PHP
  $8A39  33        .db $33

L_8A3A:
  $8A3A  28        PLP
  $8A3B  89        .db $89
  $8A3C  68        PLA
  $8A3D  68        PLA
  $8A3E  20 19 08  JSR $0819
  $8A41  33        .db $33
  $8A42  28        PLP
  $8A43  76 70     ROR $70,X
  $8A45  7A        .db $7A

L_8A46:
  $8A46  79 08 19  ADC $1908,Y
  $8A49  21 30     AND ($30,X)
  $8A4B  6B        .db $6B
  $8A4C  71 72     ADC ($72),Y
  $8A4E  18        CLC
  $8A4F  1A        .db $1A
  $8A50  19 21 30  ORA $3021,Y
  $8A53  6B        .db $6B
  $8A54  72        .db $72
  $8A55  71 20     ADC ($20),Y
  $8A57  19 08 33  ORA $3308,Y
  $8A5A  28        PLP
  $8A5B  6B        .db $6B
  $8A5C  70 04     BVS $8A62
  $8A5E  06 08     ASL $08
  $8A60  1A        .db $1A
  $8A61  22        .db $22

L_8A62:
  $8A62  2A        ROL
  $8A63  6B        .db $6B
  $8A64  72        .db $72
  $8A65  20 19 19  JSR $1919
  $8A68  08        PHP
  $8A69  33        .db $33
  $8A6A  28        PLP
  $8A6B  6B        .db $6B
  $8A6C  71 10     ADC ($10),Y
  $8A6E  08        PHP
  $8A6F  08        PHP
  $8A70  7B        .db $7B
  $8A71  86 85     STX $85
  $8A73  6C 0C 0E  JMP ($0E0C)
  $8A76  1A        .db $1A
  $8A77  1A        .db $1A
  $8A78  7C        .db $7C
  $8A79  7D 7F 87  ADC $877F,X
  $8A7C  10 08     BPL $8A86

L_8A7E:
  $8A7E  08        PHP
  $8A7F  08        PHP
  $8A80  00        BRK
  $8A81  1F        .db $1F
  $8A82  6B        .db $6B
  $8A83  70 1F     BVS $8AA4
  $8A85  00        BRK

L_8A86:
  $8A86  00        BRK
  $8A87  00        BRK
  $8A88  00        BRK
  $8A89  1F        .db $1F
  $8A8A  6B        .db $6B
  $8A8B  70 1F     BVS $8AAC
  $8A8D  00        BRK
  $8A8E  00        BRK
  $8A8F  00        BRK
  $8A90  00        BRK
  $8A91  1F        .db $1F
  $8A92  6B        .db $6B
  $8A93  70 1F     BVS $8AB4
  $8A95  00        BRK
  $8A96  00        BRK
  $8A97  00        BRK
  $8A98  00        BRK
  $8A99  1F        .db $1F
  $8A9A  6B        .db $6B
  $8A9B  70 1F     BVS $8ABC
  $8A9D  00        BRK
  $8A9E  00        BRK
  $8A9F  00        BRK
  $8AA0  00        BRK
  $8AA1  1F        .db $1F
  $8AA2  6B        .db $6B
  $8AA3  70 1F     BVS $8AC4
  $8AA5  00        BRK
  $8AA6  00        BRK
  $8AA7  00        BRK

L_8AA8:
  $8AA8  00        BRK
  $8AA9  1F        .db $1F
  $8AAA  6B        .db $6B
  $8AAB  70 1F     BVS $8ACC
  $8AAD  00        BRK
  $8AAE  00        BRK
  $8AAF  00        BRK
  $8AB0  00        BRK
  $8AB1  1F        .db $1F
  $8AB2  6B        .db $6B
  $8AB3  70 1F     BVS $8AD4
  $8AB5  00        BRK
  $8AB6  00        BRK
  $8AB7  00        BRK
  $8AB8  00        BRK
  $8AB9  1F        .db $1F
  $8ABA  7F        .db $7F
  $8ABB  87        .db $87

L_8ABC:
  $8ABC  1F        .db $1F
  $8ABD  00        BRK
  $8ABE  00        BRK
  $8ABF  00        BRK
  $8AC0  47        .db $47
  $8AC1  3C        .db $3C
  $8AC2  6C 71 80  JMP ($8071)
  $8AC5  47        .db $47
  $8AC6  82        .db $82
  $8AC7  08        PHP
  $8AC8  71 72     ADC ($72),Y
  $8ACA  71 72     ADC ($72),Y

L_8ACC:
  $8ACC  71 91     ADC ($91),Y

L_8ACE:
  $8ACE  81 08     STA ($08,X)
  $8AD0  72        .db $72
  $8AD1  71 72     ADC ($72),Y
  $8AD3  71 72     ADC ($72),Y
  $8AD5  92        .db $92
  $8AD6  08        PHP
  $8AD7  08        PHP
  $8AD8  71 72     ADC ($72),Y
  $8ADA  71 72     ADC ($72),Y
  $8ADC  71 93     ADC ($93),Y
  $8ADE  08        PHP
  $8ADF  08        PHP
  $8AE0  72        .db $72
  $8AE1  71 72     ADC ($72),Y
  $8AE3  71 72     ADC ($72),Y
  $8AE5  92        .db $92
  $8AE6  08        PHP
  $8AE7  08        PHP
  $8AE8  71 72     ADC ($72),Y
  $8AEA  71 72     ADC ($72),Y
  $8AEC  71 93     ADC ($93),Y
  $8AEE  08        PHP
  $8AEF  08        PHP
  $8AF0  72        .db $72
  $8AF1  71 72     ADC ($72),Y
  $8AF3  71 72     ADC ($72),Y
  $8AF5  94 82     STY $82,X
  $8AF7  08        PHP
  $8AF8  57        .db $57
  $8AF9  57        .db $57
  $8AFA  57        .db $57
  $8AFB  57        .db $57
  $8AFC  57        .db $57
  $8AFD  57        .db $57
  $8AFE  81 08     STA ($08,X)

L_8B00:
  $8B00  C0 C8     CPY #$C8
  $8B02  D0 C8     BNE $8ACC
  $8B04  D0 C8     BNE $8ACE
  $8B06  D0 F8     BNE $8B00
  $8B08  C1 C9     CMP ($C9,X)
  $8B0A  D1 D9     CMP ($D9),Y
  $8B0C  E1 E9     SBC ($E9,X)
  $8B0E  F1 F9     SBC ($F9),Y
  $8B10  C2        .db $C2
  $8B11  CA        DEX
  $8B12  D2        .db $D2
  $8B13  DA        .db $DA
  $8B14  CA        DEX
  $8B15  D2        .db $D2
  $8B16  F2        .db $F2
  $8B17  FA        .db $FA
  $8B18  C2        .db $C2
  $8B19  CB        .db $CB
  $8B1A  D3        .db $D3
  $8B1B  DB        .db $DB
  $8B1C  CB        .db $CB
  $8B1D  EB        .db $EB
  $8B1E  F3        .db $F3
  $8B1F  FB        .db $FB
  $8B20  C2        .db $C2
  $8B21  CC D4 DC  CPY $DCD4
  $8B24  CC EB F3  CPY $F3EB
  $8B27  FB        .db $FB
  $8B28  C2        .db $C2
  $8B29  CA        DEX
  $8B2A  D2        .db $D2
  $8B2B  DD CA D2  CMP $D2CA,X

L_8B2E:
  $8B2E  F2        .db $F2
  $8B2F  FA        .db $FA
  $8B30  C6 CE     DEC $CE
  $8B32  D6 DE     DEC $DE,X

L_8B34:
  $8B34  E6 EE     INC $EE
  $8B36  F6 FE     INC $FE,X
  $8B38  C7        .db $C7
  $8B39  CF        .db $CF
  $8B3A  D7        .db $D7
  $8B3B  CF        .db $CF
  $8B3C  D7        .db $D7
  $8B3D  CF        .db $CF
  $8B3E  D7        .db $D7
  $8B3F  FF        .db $FF
  $8B40  EA        NOP
  $8B41  EF        .db $EF
  $8B42  F0 F0     BEQ $8B34
  $8B44  E2        .db $E2
  $8B45  F0 E7     BEQ $8B2E
  $8B47  EA        NOP
  $8B48  C2        .db $C2
  $8B49  D8        CLD
  $8B4A  E0 E0     CPX #$E0

L_8B4C:
  $8B4C  E3        .db $E3
  $8B4D  E0 E8     CPX #$E8
  $8B4F  C2        .db $C2
  $8B50  C2        .db $C2
  $8B51  D8        CLD
  $8B52  E0 E0     CPX #$E0
  $8B54  E0 E0     CPX #$E0
  $8B56  C2        .db $C2
  $8B57  C2        .db $C2
  $8B58  C2        .db $C2
  $8B59  D8        CLD
  $8B5A  E0 E0     CPX #$E0
  $8B5C  E0 E0     CPX #$E0
  $8B5E  C2        .db $C2
  $8B5F  C2        .db $C2
  $8B60  C2        .db $C2
  $8B61  D8        CLD
  $8B62  E0 E0     CPX #$E0
  $8B64  E0 E0     CPX #$E0
  $8B66  C2        .db $C2
  $8B67  C2        .db $C2
  $8B68  C2        .db $C2
  $8B69  D8        CLD
  $8B6A  E0 E0     CPX #$E0
  $8B6C  E0 E0     CPX #$E0
  $8B6E  C2        .db $C2
  $8B6F  C2        .db $C2
  $8B70  C2        .db $C2
  $8B71  D8        CLD
  $8B72  E0 E0     CPX #$E0
  $8B74  E0 E0     CPX #$E0
  $8B76  C2        .db $C2
  $8B77  C2        .db $C2
  $8B78  C5 CD     CMP $CD
  $8B7A  D5 D5     CMP $D5,X
  $8B7C  D5 D5     CMP $D5,X
  $8B7E  C5 C5     CMP $C5

L_8B80:
  $8B80  C0 C8     CPY #$C8
  $8B82  D0 C8     BNE $8B4C
  $8B84  D0 C8     BNE $8B4E
  $8B86  D0 F8     BNE $8B80
  $8B88  C1 C9     CMP ($C9,X)
  $8B8A  D1 D9     CMP ($D9),Y
  $8B8C  E1 E9     SBC ($E9,X)
  $8B8E  F1 F9     SBC ($F9),Y
  $8B90  C2        .db $C2
  $8B91  CA        DEX
  $8B92  D2        .db $D2
  $8B93  DA        .db $DA
  $8B94  CA        DEX
  $8B95  D2        .db $D2
  $8B96  F2        .db $F2
  $8B97  FA        .db $FA
  $8B98  C2        .db $C2
  $8B99  CB        .db $CB
  $8B9A  D3        .db $D3
  $8B9B  DB        .db $DB
  $8B9C  CB        .db $CB
  $8B9D  EB        .db $EB
  $8B9E  F3        .db $F3
  $8B9F  FB        .db $FB
  $8BA0  C2        .db $C2
  $8BA1  CC D4 DC  CPY $DCD4
  $8BA4  CC EB F3  CPY $F3EB
  $8BA7  FB        .db $FB
  $8BA8  C2        .db $C2
  $8BA9  CA        DEX
  $8BAA  D2        .db $D2
  $8BAB  DD CA D2  CMP $D2CA,X

L_8BAE:
  $8BAE  F2        .db $F2
  $8BAF  FA        .db $FA
  $8BB0  C6 CE     DEC $CE
  $8BB2  D6 DE     DEC $DE,X

L_8BB4:
  $8BB4  E6 EE     INC $EE
  $8BB6  F6 FE     INC $FE,X
  $8BB8  C7        .db $C7
  $8BB9  CF        .db $CF
  $8BBA  D7        .db $D7
  $8BBB  CF        .db $CF
  $8BBC  D7        .db $D7
  $8BBD  CF        .db $CF
  $8BBE  D7        .db $D7
  $8BBF  FF        .db $FF
  $8BC0  EA        NOP
  $8BC1  EF        .db $EF
  $8BC2  F0 F0     BEQ $8BB4
  $8BC4  E2        .db $E2
  $8BC5  F0 E7     BEQ $8BAE
  $8BC7  EA        NOP
  $8BC8  C2        .db $C2
  $8BC9  D8        CLD
  $8BCA  E0 E0     CPX #$E0

L_8BCC:
  $8BCC  E3        .db $E3
  $8BCD  E0 E8     CPX #$E8
  $8BCF  C2        .db $C2
  $8BD0  C2        .db $C2
  $8BD1  D8        CLD
  $8BD2  E0 E0     CPX #$E0
  $8BD4  E0 E0     CPX #$E0
  $8BD6  C2        .db $C2
  $8BD7  C2        .db $C2
  $8BD8  C2        .db $C2
  $8BD9  D8        CLD
  $8BDA  E0 E0     CPX #$E0
  $8BDC  E0 E0     CPX #$E0
  $8BDE  C2        .db $C2
  $8BDF  C2        .db $C2
  $8BE0  C2        .db $C2
  $8BE1  D8        CLD
  $8BE2  E0 E0     CPX #$E0
  $8BE4  E0 E0     CPX #$E0
  $8BE6  C2        .db $C2
  $8BE7  C2        .db $C2
  $8BE8  C2        .db $C2
  $8BE9  D8        CLD
  $8BEA  E0 E0     CPX #$E0
  $8BEC  E0 E0     CPX #$E0
  $8BEE  C2        .db $C2
  $8BEF  C2        .db $C2
  $8BF0  C2        .db $C2
  $8BF1  D8        CLD
  $8BF2  E0 E0     CPX #$E0
  $8BF4  E0 E0     CPX #$E0
  $8BF6  C2        .db $C2
  $8BF7  C2        .db $C2
  $8BF8  C5 CD     CMP $CD
  $8BFA  D5 D5     CMP $D5,X
  $8BFC  D5 D5     CMP $D5,X
  $8BFE  C5 C5     CMP $C5

L_8C00:
  $8C00  C0 C8     CPY #$C8
  $8C02  D0 C8     BNE $8BCC
  $8C04  D0 C8     BNE $8BCE
  $8C06  D0 F8     BNE $8C00
  $8C08  C1 C9     CMP ($C9,X)
  $8C0A  D1 D9     CMP ($D9),Y
  $8C0C  E1 E9     SBC ($E9,X)
  $8C0E  F1 F9     SBC ($F9),Y
  $8C10  C2        .db $C2
  $8C11  CA        DEX
  $8C12  D2        .db $D2
  $8C13  DA        .db $DA
  $8C14  CA        DEX
  $8C15  D2        .db $D2
  $8C16  F2        .db $F2
  $8C17  FA        .db $FA
  $8C18  C2        .db $C2
  $8C19  CB        .db $CB
  $8C1A  D3        .db $D3
  $8C1B  DB        .db $DB
  $8C1C  CB        .db $CB
  $8C1D  EB        .db $EB
  $8C1E  F3        .db $F3
  $8C1F  FB        .db $FB
  $8C20  C2        .db $C2
  $8C21  CC D4 DC  CPY $DCD4
  $8C24  CC EB F3  CPY $F3EB
  $8C27  FB        .db $FB
  $8C28  C2        .db $C2
  $8C29  CA        DEX
  $8C2A  D2        .db $D2
  $8C2B  DD CA D2  CMP $D2CA,X

L_8C2E:
  $8C2E  F2        .db $F2
  $8C2F  FA        .db $FA
  $8C30  C6 CE     DEC $CE
  $8C32  D6 DE     DEC $DE,X

L_8C34:
  $8C34  E6 EE     INC $EE
  $8C36  F6 FE     INC $FE,X
  $8C38  C7        .db $C7
  $8C39  CF        .db $CF
  $8C3A  D7        .db $D7
  $8C3B  CF        .db $CF
  $8C3C  D7        .db $D7
  $8C3D  CF        .db $CF
  $8C3E  D7        .db $D7
  $8C3F  FF        .db $FF
  $8C40  EA        NOP
  $8C41  EF        .db $EF
  $8C42  F0 F0     BEQ $8C34
  $8C44  E2        .db $E2
  $8C45  F0 E7     BEQ $8C2E
  $8C47  EA        NOP
  $8C48  C2        .db $C2
  $8C49  D8        CLD
  $8C4A  E0 E0     CPX #$E0

L_8C4C:
  $8C4C  E3        .db $E3
  $8C4D  E0 E8     CPX #$E8
  $8C4F  C2        .db $C2
  $8C50  C2        .db $C2
  $8C51  D8        CLD
  $8C52  E0 E0     CPX #$E0
  $8C54  E0 E0     CPX #$E0
  $8C56  C2        .db $C2
  $8C57  C2        .db $C2
  $8C58  C2        .db $C2
  $8C59  D8        CLD
  $8C5A  E0 E0     CPX #$E0
  $8C5C  E0 E0     CPX #$E0
  $8C5E  C2        .db $C2
  $8C5F  C2        .db $C2
  $8C60  C2        .db $C2
  $8C61  D8        CLD
  $8C62  E0 E0     CPX #$E0
  $8C64  E0 E0     CPX #$E0
  $8C66  C2        .db $C2
  $8C67  C2        .db $C2
  $8C68  C2        .db $C2
  $8C69  D8        CLD
  $8C6A  E0 E0     CPX #$E0
  $8C6C  E0 E0     CPX #$E0
  $8C6E  C2        .db $C2
  $8C6F  C2        .db $C2
  $8C70  C2        .db $C2
  $8C71  D8        CLD
  $8C72  E0 E0     CPX #$E0
  $8C74  E0 E0     CPX #$E0
  $8C76  C2        .db $C2
  $8C77  C2        .db $C2
  $8C78  C5 CD     CMP $CD
  $8C7A  D5 D5     CMP $D5,X
  $8C7C  D5 D5     CMP $D5,X
  $8C7E  C5 C5     CMP $C5

L_8C80:
  $8C80  C0 C8     CPY #$C8
  $8C82  D0 C8     BNE $8C4C
  $8C84  D0 C8     BNE $8C4E
  $8C86  D0 F8     BNE $8C80
  $8C88  C1 C9     CMP ($C9,X)
  $8C8A  D1 D9     CMP ($D9),Y
  $8C8C  E1 E9     SBC ($E9,X)
  $8C8E  F1 F9     SBC ($F9),Y
  $8C90  C2        .db $C2
  $8C91  CA        DEX
  $8C92  D2        .db $D2
  $8C93  DA        .db $DA
  $8C94  CA        DEX
  $8C95  D2        .db $D2
  $8C96  F2        .db $F2
  $8C97  FA        .db $FA
  $8C98  C2        .db $C2
  $8C99  CB        .db $CB
  $8C9A  D3        .db $D3
  $8C9B  DB        .db $DB
  $8C9C  CB        .db $CB
  $8C9D  EB        .db $EB
  $8C9E  F3        .db $F3
  $8C9F  FB        .db $FB
  $8CA0  C2        .db $C2
  $8CA1  CC D4 DC  CPY $DCD4
  $8CA4  CC EB F3  CPY $F3EB
  $8CA7  FB        .db $FB
  $8CA8  C2        .db $C2
  $8CA9  CA        DEX
  $8CAA  D2        .db $D2
  $8CAB  DD CA D2  CMP $D2CA,X

L_8CAE:
  $8CAE  F2        .db $F2
  $8CAF  FA        .db $FA
  $8CB0  C6 CE     DEC $CE
  $8CB2  D6 DE     DEC $DE,X

L_8CB4:
  $8CB4  E6 EE     INC $EE
  $8CB6  F6 FE     INC $FE,X
  $8CB8  C7        .db $C7
  $8CB9  CF        .db $CF
  $8CBA  D7        .db $D7
  $8CBB  CF        .db $CF
  $8CBC  D7        .db $D7
  $8CBD  CF        .db $CF
  $8CBE  D7        .db $D7
  $8CBF  FF        .db $FF
  $8CC0  EA        NOP
  $8CC1  EF        .db $EF
  $8CC2  F0 F0     BEQ $8CB4
  $8CC4  E2        .db $E2
  $8CC5  F0 E7     BEQ $8CAE
  $8CC7  EA        NOP
  $8CC8  C2        .db $C2
  $8CC9  D8        CLD
  $8CCA  E0 E0     CPX #$E0
  $8CCC  E3        .db $E3
  $8CCD  E0 E8     CPX #$E8
  $8CCF  C2        .db $C2
  $8CD0  C2        .db $C2
  $8CD1  D8        CLD
  $8CD2  E0 E0     CPX #$E0
  $8CD4  E0 E0     CPX #$E0
  $8CD6  C2        .db $C2
  $8CD7  C2        .db $C2
  $8CD8  C2        .db $C2

L_8CD9:
  $8CD9  D8        CLD
  $8CDA  E0 E0     CPX #$E0
  $8CDC  E0 E0     CPX #$E0
  $8CDE  C2        .db $C2
  $8CDF  C2        .db $C2
  $8CE0  C2        .db $C2
  $8CE1  D8        CLD
  $8CE2  E0 E0     CPX #$E0
  $8CE4  E0 E0     CPX #$E0
  $8CE6  C2        .db $C2
  $8CE7  C2        .db $C2
  $8CE8  C2        .db $C2
  $8CE9  D8        CLD
  $8CEA  E0 E0     CPX #$E0
  $8CEC  E0 E0     CPX #$E0
  $8CEE  C2        .db $C2
  $8CEF  C2        .db $C2
  $8CF0  C2        .db $C2
  $8CF1  D8        CLD
  $8CF2  E0 E0     CPX #$E0
  $8CF4  E0 E0     CPX #$E0
  $8CF6  C2        .db $C2
  $8CF7  C2        .db $C2
  $8CF8  C5 CD     CMP $CD
  $8CFA  D5 D5     CMP $D5,X
  $8CFC  D5 D5     CMP $D5,X
  $8CFE  C5 C5     CMP $C5
  $8D00  B1 B2     LDA ($B2),Y
  $8D02  B3        .db $B3
  $8D03  B3        .db $B3
  $8D04  B3        .db $B3
  $8D05  B3        .db $B3
  $8D06  B4 B6     LDY $B6,X
  $8D08  B1 A0     LDA ($A0),Y
  $8D0A  A6 AC     LDX $AC
  $8D0C  AC AC B5  LDY $B5AC
  $8D0F  B6 B1     LDX $B1,Y
  $8D11  A1 A7     LDA ($A7,X)
  $8D13  AD AC AC  LDA $ACAC
  $8D16  B5 B6     LDA $B6,X
  $8D18  B1 A2     LDA ($A2),Y
  $8D1A  A8        TAY
  $8D1B  AE AC AC  LDX $ACAC
  $8D1E  B5 B6     LDA $B6,X
  $8D20  B1 A3     LDA ($A3),Y
  $8D22  A9 AF     LDA #$AF
  $8D24  AC AC B5  LDY $B5AC
  $8D27  B6 B1     LDX $B1,Y
  $8D29  A4 AA     LDY $AA
  $8D2B  B0 AC     BCS $8CD9
  $8D2D  AC B5 B6  LDY $B6B5
  $8D30  B1 A5     LDA ($A5),Y
  $8D32  AB        .db $AB
  $8D33  AC AC B9  LDY $B9AC
  $8D36  BB        .db $BB
  $8D37  B6 B1     LDX $B1,Y
  $8D39  B7        .db $B7
  $8D3A  B8        CLV
  $8D3B  B8        CLV
  $8D3C  B8        CLV
  $8D3D  BA        TSX
  $8D3E  BC B6 EA  LDY $EAB6,X
  $8D41  EF        .db $EF
  $8D42  F0 F0     BEQ $8D34
  $8D44  E2        .db $E2
  $8D45  F0 E7     BEQ $8D2E
  $8D47  EA        NOP
  $8D48  C2        .db $C2
  $8D49  D8        CLD
  $8D4A  E0 E0     CPX #$E0

L_8D4C:
  $8D4C  E3        .db $E3
  $8D4D  E0 E8     CPX #$E8
  $8D4F  C2        .db $C2
  $8D50  C2        .db $C2
  $8D51  D8        CLD
  $8D52  E0 E0     CPX #$E0
  $8D54  E0 E0     CPX #$E0
  $8D56  C2        .db $C2
  $8D57  C2        .db $C2
  $8D58  C2        .db $C2
  $8D59  D8        CLD
  $8D5A  E0 E0     CPX #$E0
  $8D5C  E0 E0     CPX #$E0
  $8D5E  C2        .db $C2
  $8D5F  C2        .db $C2
  $8D60  C2        .db $C2
  $8D61  D8        CLD
  $8D62  E0 E0     CPX #$E0
  $8D64  E0 E0     CPX #$E0
  $8D66  C2        .db $C2
  $8D67  C2        .db $C2
  $8D68  C2        .db $C2
  $8D69  D8        CLD
  $8D6A  E0 E0     CPX #$E0
  $8D6C  E0 E0     CPX #$E0
  $8D6E  C2        .db $C2
  $8D6F  C2        .db $C2
  $8D70  C2        .db $C2
  $8D71  D8        CLD
  $8D72  E0 E0     CPX #$E0
  $8D74  E0 E0     CPX #$E0
  $8D76  C2        .db $C2
  $8D77  C2        .db $C2
  $8D78  C5 CD     CMP $CD
  $8D7A  D5 D5     CMP $D5,X
  $8D7C  D5 D5     CMP $D5,X
  $8D7E  C5 C5     CMP $C5

L_8D80:
  $8D80  C0 C8     CPY #$C8
  $8D82  D0 C8     BNE $8D4C
  $8D84  D0 C8     BNE $8D4E
  $8D86  D0 F8     BNE $8D80
  $8D88  C1 C9     CMP ($C9,X)
  $8D8A  D1 D9     CMP ($D9),Y
  $8D8C  E1 E9     SBC ($E9,X)
  $8D8E  F1 F9     SBC ($F9),Y
  $8D90  C2        .db $C2
  $8D91  CA        DEX
  $8D92  D2        .db $D2
  $8D93  DA        .db $DA
  $8D94  CA        DEX
  $8D95  D2        .db $D2
  $8D96  F2        .db $F2
  $8D97  FA        .db $FA
  $8D98  C2        .db $C2
  $8D99  CB        .db $CB
  $8D9A  D3        .db $D3
  $8D9B  DB        .db $DB
  $8D9C  CB        .db $CB
  $8D9D  EB        .db $EB
  $8D9E  F3        .db $F3
  $8D9F  FB        .db $FB
  $8DA0  C2        .db $C2
  $8DA1  CC D4 DC  CPY $DCD4
  $8DA4  CC EB F3  CPY $F3EB
  $8DA7  FB        .db $FB
  $8DA8  C2        .db $C2
  $8DA9  CA        DEX
  $8DAA  D2        .db $D2
  $8DAB  DD CA D2  CMP $D2CA,X

L_8DAE:
  $8DAE  F2        .db $F2
  $8DAF  FA        .db $FA
  $8DB0  C6 CE     DEC $CE
  $8DB2  D6 DE     DEC $DE,X

L_8DB4:
  $8DB4  E6 EE     INC $EE
  $8DB6  F6 FE     INC $FE,X
  $8DB8  C7        .db $C7
  $8DB9  CF        .db $CF
  $8DBA  D7        .db $D7
  $8DBB  CF        .db $CF
  $8DBC  D7        .db $D7
  $8DBD  CF        .db $CF
  $8DBE  D7        .db $D7
  $8DBF  FF        .db $FF
  $8DC0  EA        NOP
  $8DC1  EF        .db $EF
  $8DC2  F0 F0     BEQ $8DB4
  $8DC4  E2        .db $E2
  $8DC5  F0 E7     BEQ $8DAE
  $8DC7  EA        NOP
  $8DC8  C2        .db $C2
  $8DC9  D8        CLD
  $8DCA  E0 E0     CPX #$E0

L_8DCC:
  $8DCC  E3        .db $E3
  $8DCD  E0 E8     CPX #$E8
  $8DCF  C2        .db $C2
  $8DD0  C2        .db $C2
  $8DD1  D8        CLD
  $8DD2  E0 E0     CPX #$E0
  $8DD4  E0 E0     CPX #$E0
  $8DD6  C2        .db $C2
  $8DD7  C2        .db $C2
  $8DD8  C2        .db $C2
  $8DD9  D8        CLD
  $8DDA  E0 E0     CPX #$E0
  $8DDC  E0 E0     CPX #$E0
  $8DDE  C2        .db $C2
  $8DDF  C2        .db $C2
  $8DE0  C2        .db $C2
  $8DE1  D8        CLD
  $8DE2  E0 E0     CPX #$E0
  $8DE4  E0 E0     CPX #$E0
  $8DE6  C2        .db $C2
  $8DE7  C2        .db $C2
  $8DE8  C2        .db $C2
  $8DE9  D8        CLD
  $8DEA  E0 E0     CPX #$E0
  $8DEC  E0 E0     CPX #$E0
  $8DEE  C2        .db $C2
  $8DEF  C2        .db $C2
  $8DF0  C2        .db $C2
  $8DF1  D8        CLD
  $8DF2  E0 E0     CPX #$E0
  $8DF4  E0 E0     CPX #$E0
  $8DF6  C2        .db $C2
  $8DF7  C2        .db $C2
  $8DF8  C5 CD     CMP $CD
  $8DFA  D5 D5     CMP $D5,X
  $8DFC  D5 D5     CMP $D5,X
  $8DFE  C5 C5     CMP $C5

L_8E00:
  $8E00  C0 C8     CPY #$C8
  $8E02  D0 C8     BNE $8DCC
  $8E04  D0 C8     BNE $8DCE
  $8E06  D0 F8     BNE $8E00
  $8E08  C1 C9     CMP ($C9,X)
  $8E0A  D1 D9     CMP ($D9),Y
  $8E0C  E1 E9     SBC ($E9,X)
  $8E0E  F1 F9     SBC ($F9),Y
  $8E10  C2        .db $C2
  $8E11  CA        DEX
  $8E12  D2        .db $D2
  $8E13  DA        .db $DA
  $8E14  CA        DEX
  $8E15  D2        .db $D2
  $8E16  F2        .db $F2
  $8E17  FA        .db $FA
  $8E18  C2        .db $C2
  $8E19  CB        .db $CB
  $8E1A  D3        .db $D3
  $8E1B  DB        .db $DB
  $8E1C  CB        .db $CB
  $8E1D  EB        .db $EB
  $8E1E  F3        .db $F3
  $8E1F  FB        .db $FB
  $8E20  C2        .db $C2
  $8E21  CC D4 DC  CPY $DCD4
  $8E24  CC EB F3  CPY $F3EB
  $8E27  FB        .db $FB
  $8E28  C2        .db $C2
  $8E29  CA        DEX
  $8E2A  D2        .db $D2
  $8E2B  DD CA D2  CMP $D2CA,X

L_8E2E:
  $8E2E  F2        .db $F2
  $8E2F  FA        .db $FA
  $8E30  C6 CE     DEC $CE
  $8E32  D6 DE     DEC $DE,X

L_8E34:
  $8E34  E6 EE     INC $EE
  $8E36  F6 FE     INC $FE,X
  $8E38  C7        .db $C7
  $8E39  CF        .db $CF
  $8E3A  D7        .db $D7
  $8E3B  CF        .db $CF
  $8E3C  D7        .db $D7
  $8E3D  CF        .db $CF
  $8E3E  D7        .db $D7
  $8E3F  FF        .db $FF
  $8E40  EA        NOP
  $8E41  EF        .db $EF
  $8E42  F0 F0     BEQ $8E34
  $8E44  E2        .db $E2
  $8E45  F0 E7     BEQ $8E2E
  $8E47  EA        NOP
  $8E48  C2        .db $C2
  $8E49  D8        CLD
  $8E4A  E0 E0     CPX #$E0

L_8E4C:
  $8E4C  E3        .db $E3
  $8E4D  E0 E8     CPX #$E8
  $8E4F  C2        .db $C2
  $8E50  C2        .db $C2
  $8E51  D8        CLD
  $8E52  E0 E0     CPX #$E0
  $8E54  E0 E0     CPX #$E0
  $8E56  C2        .db $C2
  $8E57  C2        .db $C2
  $8E58  C2        .db $C2
  $8E59  D8        CLD
  $8E5A  E0 E0     CPX #$E0
  $8E5C  E0 E0     CPX #$E0
  $8E5E  C2        .db $C2
  $8E5F  C2        .db $C2
  $8E60  C2        .db $C2
  $8E61  D8        CLD
  $8E62  E0 E0     CPX #$E0
  $8E64  E0 E0     CPX #$E0
  $8E66  C2        .db $C2
  $8E67  C2        .db $C2
  $8E68  C2        .db $C2
  $8E69  D8        CLD
  $8E6A  E0 E0     CPX #$E0
  $8E6C  E0 E0     CPX #$E0
  $8E6E  C2        .db $C2
  $8E6F  C2        .db $C2
  $8E70  C2        .db $C2
  $8E71  D8        CLD
  $8E72  E0 E0     CPX #$E0
  $8E74  E0 E0     CPX #$E0
  $8E76  C2        .db $C2
  $8E77  C2        .db $C2
  $8E78  C5 CD     CMP $CD
  $8E7A  D5 D5     CMP $D5,X
  $8E7C  D5 D5     CMP $D5,X
  $8E7E  C5 C5     CMP $C5

L_8E80:
  $8E80  C0 C8     CPY #$C8
  $8E82  D0 C8     BNE $8E4C
  $8E84  D0 C8     BNE $8E4E
  $8E86  D0 F8     BNE $8E80
  $8E88  C1 C9     CMP ($C9,X)
  $8E8A  D1 D9     CMP ($D9),Y
  $8E8C  E1 E9     SBC ($E9,X)
  $8E8E  F1 F9     SBC ($F9),Y
  $8E90  C2        .db $C2
  $8E91  CA        DEX
  $8E92  D2        .db $D2
  $8E93  DA        .db $DA
  $8E94  CA        DEX
  $8E95  D2        .db $D2
  $8E96  F2        .db $F2
  $8E97  FA        .db $FA
  $8E98  C2        .db $C2
  $8E99  CB        .db $CB
  $8E9A  D3        .db $D3
  $8E9B  DB        .db $DB
  $8E9C  CB        .db $CB
  $8E9D  EB        .db $EB
  $8E9E  F3        .db $F3
  $8E9F  FB        .db $FB
  $8EA0  C2        .db $C2
  $8EA1  CC D4 DC  CPY $DCD4
  $8EA4  CC EB F3  CPY $F3EB
  $8EA7  FB        .db $FB
  $8EA8  C2        .db $C2
  $8EA9  CA        DEX
  $8EAA  D2        .db $D2
  $8EAB  DD CA D2  CMP $D2CA,X

L_8EAE:
  $8EAE  F2        .db $F2
  $8EAF  FA        .db $FA
  $8EB0  C6 CE     DEC $CE
  $8EB2  D6 DE     DEC $DE,X

L_8EB4:
  $8EB4  E6 EE     INC $EE
  $8EB6  F6 FE     INC $FE,X
  $8EB8  C7        .db $C7
  $8EB9  CF        .db $CF
  $8EBA  D7        .db $D7
  $8EBB  CF        .db $CF
  $8EBC  D7        .db $D7
  $8EBD  CF        .db $CF
  $8EBE  D7        .db $D7
  $8EBF  FF        .db $FF
  $8EC0  EA        NOP
  $8EC1  EF        .db $EF
  $8EC2  F0 F0     BEQ $8EB4
  $8EC4  E2        .db $E2
  $8EC5  F0 E7     BEQ $8EAE
  $8EC7  EA        NOP
  $8EC8  C2        .db $C2
  $8EC9  D8        CLD
  $8ECA  E0 E0     CPX #$E0

L_8ECC:
  $8ECC  E3        .db $E3
  $8ECD  E0 E8     CPX #$E8
  $8ECF  C2        .db $C2
  $8ED0  C2        .db $C2
  $8ED1  D8        CLD
  $8ED2  E0 E0     CPX #$E0
  $8ED4  E0 E0     CPX #$E0
  $8ED6  C2        .db $C2
  $8ED7  C2        .db $C2
  $8ED8  C2        .db $C2
  $8ED9  D8        CLD
  $8EDA  E0 E0     CPX #$E0
  $8EDC  E0 E0     CPX #$E0
  $8EDE  C2        .db $C2
  $8EDF  C2        .db $C2
  $8EE0  C2        .db $C2
  $8EE1  D8        CLD
  $8EE2  E0 E0     CPX #$E0
  $8EE4  E0 E0     CPX #$E0
  $8EE6  C2        .db $C2
  $8EE7  C2        .db $C2
  $8EE8  C2        .db $C2
  $8EE9  D8        CLD
  $8EEA  E0 E0     CPX #$E0
  $8EEC  E0 E0     CPX #$E0
  $8EEE  C2        .db $C2
  $8EEF  C2        .db $C2
  $8EF0  C2        .db $C2
  $8EF1  D8        CLD
  $8EF2  E0 E0     CPX #$E0
  $8EF4  E0 E0     CPX #$E0
  $8EF6  C2        .db $C2
  $8EF7  C2        .db $C2
  $8EF8  C5 CD     CMP $CD
  $8EFA  D5 D5     CMP $D5,X
  $8EFC  D5 D5     CMP $D5,X
  $8EFE  C5 C5     CMP $C5

L_8F00:
  $8F00  C0 C8     CPY #$C8
  $8F02  D0 C8     BNE $8ECC
  $8F04  D0 C8     BNE $8ECE
  $8F06  D0 F8     BNE $8F00
  $8F08  C1 C9     CMP ($C9,X)
  $8F0A  D1 D9     CMP ($D9),Y
  $8F0C  E1 E9     SBC ($E9,X)
  $8F0E  F1 F9     SBC ($F9),Y
  $8F10  C2        .db $C2
  $8F11  CA        DEX
  $8F12  D2        .db $D2
  $8F13  DA        .db $DA
  $8F14  CA        DEX
  $8F15  D2        .db $D2
  $8F16  F2        .db $F2
  $8F17  FA        .db $FA
  $8F18  C6 EC     DEC $EC
  $8F1A  F4        .db $F4
  $8F1B  DB        .db $DB
  $8F1C  CB        .db $CB
  $8F1D  EB        .db $EB
  $8F1E  F3        .db $F3
  $8F1F  FB        .db $FB
  $8F20  C1 ED     CMP ($ED,X)
  $8F22  F5 DC     SBC $DC,X
  $8F24  CC EB F3  CPY $F3EB
  $8F27  FB        .db $FB
  $8F28  C2        .db $C2
  $8F29  CA        DEX
  $8F2A  D2        .db $D2
  $8F2B  DD CA D2  CMP $D2CA,X
  $8F2E  F2        .db $F2
  $8F2F  FA        .db $FA
  $8F30  C6 CE     DEC $CE
  $8F32  D6 DE     DEC $DE,X
  $8F34  E6 EE     INC $EE
  $8F36  F6 FE     INC $FE,X
  $8F38  C7        .db $C7
  $8F39  CF        .db $CF
  $8F3A  D7        .db $D7
  $8F3B  CF        .db $CF
  $8F3C  D7        .db $D7
  $8F3D  CF        .db $CF
  $8F3E  D7        .db $D7
  $8F3F  FF        .db $FF
  $8F40  00        BRK
  $8F41  00        BRK
  $8F42  00        BRK
  $8F43  00        BRK
  $8F44  00        BRK
  $8F45  00        BRK
  $8F46  C3        .db $C3
  $8F47  C3        .db $C3
  $8F48  00        BRK
  $8F49  00        BRK
  $8F4A  00        BRK
  $8F4B  00        BRK
  $8F4C  00        BRK
  $8F4D  00        BRK
  $8F4E  C3        .db $C3
  $8F4F  C3        .db $C3
  $8F50  00        BRK
  $8F51  00        BRK
  $8F52  00        BRK
  $8F53  00        BRK
  $8F54  00        BRK
  $8F55  00        BRK
  $8F56  C3        .db $C3
  $8F57  C3        .db $C3
  $8F58  00        BRK
  $8F59  00        BRK
  $8F5A  00        BRK
  $8F5B  00        BRK
  $8F5C  00        BRK
  $8F5D  00        BRK
  $8F5E  C3        .db $C3
  $8F5F  C3        .db $C3
  $8F60  00        BRK
  $8F61  00        BRK
  $8F62  00        BRK
  $8F63  00        BRK
  $8F64  00        BRK
  $8F65  00        BRK
  $8F66  C3        .db $C3
  $8F67  C3        .db $C3
  $8F68  00        BRK
  $8F69  00        BRK
  $8F6A  00        BRK
  $8F6B  00        BRK
  $8F6C  00        BRK
  $8F6D  00        BRK
  $8F6E  C3        .db $C3
  $8F6F  C3        .db $C3
  $8F70  00        BRK
  $8F71  00        BRK
  $8F72  00        BRK
  $8F73  00        BRK
  $8F74  00        BRK
  $8F75  00        BRK
  $8F76  C3        .db $C3
  $8F77  C3        .db $C3
  $8F78  00        BRK
  $8F79  00        BRK
  $8F7A  00        BRK
  $8F7B  00        BRK
  $8F7C  00        BRK
  $8F7D  00        BRK
  $8F7E  C3        .db $C3
  $8F7F  C3        .db $C3
  $8F80  00        BRK
  $8F81  00        BRK
  $8F82  00        BRK
  $8F83  00        BRK
  $8F84  00        BRK
  $8F85  00        BRK
  $8F86  C3        .db $C3
  $8F87  C3        .db $C3
  $8F88  00        BRK
  $8F89  00        BRK
  $8F8A  00        BRK
  $8F8B  00        BRK
  $8F8C  00        BRK
  $8F8D  00        BRK
  $8F8E  C3        .db $C3
  $8F8F  C3        .db $C3
  $8F90  00        BRK
  $8F91  00        BRK
  $8F92  00        BRK
  $8F93  00        BRK
  $8F94  00        BRK
  $8F95  00        BRK
  $8F96  C3        .db $C3
  $8F97  C3        .db $C3
  $8F98  00        BRK

L_8F99:
  $8F99  00        BRK
  $8F9A  00        BRK
  $8F9B  00        BRK
  $8F9C  00        BRK
  $8F9D  00        BRK
  $8F9E  C3        .db $C3
  $8F9F  C3        .db $C3
  $8FA0  00        BRK
  $8FA1  00        BRK
  $8FA2  00        BRK
  $8FA3  00        BRK
  $8FA4  00        BRK
  $8FA5  00        BRK
  $8FA6  C3        .db $C3
  $8FA7  C3        .db $C3
  $8FA8  00        BRK
  $8FA9  00        BRK
  $8FAA  00        BRK
  $8FAB  00        BRK
  $8FAC  00        BRK
  $8FAD  00        BRK
  $8FAE  C3        .db $C3
  $8FAF  C3        .db $C3
  $8FB0  00        BRK
  $8FB1  00        BRK
  $8FB2  00        BRK
  $8FB3  00        BRK
  $8FB4  00        BRK
  $8FB5  00        BRK
  $8FB6  C3        .db $C3
  $8FB7  C3        .db $C3
  $8FB8  00        BRK
  $8FB9  00        BRK
  $8FBA  00        BRK
  $8FBB  00        BRK
  $8FBC  00        BRK
  $8FBD  00        BRK
  $8FBE  C3        .db $C3
  $8FBF  C3        .db $C3
  $8FC0  B1 B2     LDA ($B2),Y
  $8FC2  B3        .db $B3
  $8FC3  B3        .db $B3
  $8FC4  B3        .db $B3
  $8FC5  B3        .db $B3
  $8FC6  B4 B6     LDY $B6,X
  $8FC8  B1 A0     LDA ($A0),Y
  $8FCA  A6 AC     LDX $AC
  $8FCC  AC AC B5  LDY $B5AC
  $8FCF  B6 B1     LDX $B1,Y
  $8FD1  A1 A7     LDA ($A7,X)
  $8FD3  AD AC AC  LDA $ACAC
  $8FD6  B5 B6     LDA $B6,X
  $8FD8  B1 A2     LDA ($A2),Y
  $8FDA  A8        TAY
  $8FDB  AE AC AC  LDX $ACAC
  $8FDE  B5 B6     LDA $B6,X
  $8FE0  B1 A3     LDA ($A3),Y
  $8FE2  A9 AF     LDA #$AF
  $8FE4  AC AC B5  LDY $B5AC
  $8FE7  B6 B1     LDX $B1,Y
  $8FE9  A4 AA     LDY $AA
  $8FEB  B0 AC     BCS $8F99
  $8FED  AC B5 B6  LDY $B6B5
  $8FF0  B1 A5     LDA ($A5),Y
  $8FF2  AB        .db $AB
  $8FF3  AC AC B9  LDY $B9AC
  $8FF6  BB        .db $BB
  $8FF7  B6 B1     LDX $B1,Y
  $8FF9  B7        .db $B7
  $8FFA  B8        CLV
  $8FFB  B8        CLV
  $8FFC  B8        CLV
  $8FFD  BA        TSX
  $8FFE  BC B6 00  LDY $00B6,X
  $9001  00        BRK
  $9002  00        BRK
  $9003  00        BRK
  $9004  00        BRK
  $9005  20 20 10  JSR $1020
  $9008  00        BRK
  $9009  00        BRK
  $900A  00        BRK
  $900B  00        BRK
  $900C  00        BRK
  $900D  40        RTI
  $900E  40        RTI
  $900F  E0 00     CPX #$00
  $9011  0E 31 43  ASL $4331
  $9014  44        .db $44
  $9015  84 87     STY $87
  $9017  BC 00 00  LDY $0000,X
  $901A  0E 3C 3B  ASL $3B3C
  $901D  7B        .db $7B
  $901E  78        SEI
  $901F  43        .db $43

L_9020:
  $9020  00        BRK
  $9021  00        BRK
  $9022  00        BRK
  $9023  00        BRK
  $9024  83        .db $83
  $9025  45 4B     EOR $4B
  $9027  57        .db $57
  $9028  00        BRK
  $9029  00        BRK
  $902A  00        BRK
  $902B  00        BRK
  $902C  00        BRK
  $902D  82        .db $82
  $902E  84 88     STY $88
  $9030  04        .db $04
  $9031  00        BRK
  $9032  49 1B     EOR #$1B
  $9034  1F        .db $1F
  $9035  1F        .db $1F
  $9036  9F        .db $9F
  $9037  CF        .db $CF
  $9038  19 1F BF  ORA $BF1F,Y
  $903B  FF        .db $FF
  $903C  FF        .db $FF
  $903D  FF        .db $FF
  $903E  7F        .db $7F
  $903F  3F        .db $3F
  $9040  A4 94     LDY $94
  $9042  C2        .db $C2
  $9043  C3        .db $C3
  $9044  F8        SED
  $9045  F9 F1 E3  SBC $E3F1,Y
  $9048  C8        INY
  $9049  E9 FC     SBC #$FC
  $904B  FC        .db $FC
  $904C  FF        .db $FF
  $904D  FE FE FC  INC $FCFE,X
  $9050  00        BRK
  $9051  00        BRK
  $9052  00        BRK
  $9053  00        BRK
  $9054  C0 20     CPY #$20
  $9056  D0 C8     BNE $9020
  $9058  00        BRK
  $9059  00        BRK
  $905A  00        BRK
  $905B  00        BRK
  $905C  00        BRK
  $905D  C0 20     CPY #$20
  $905F  30 48     BMI $90A9
  $9061  21 1F     AND ($1F,X)
  $9063  0F        .db $0F
  $9064  07        .db $07
  $9065  07        .db $07
  $9066  02        .db $02
  $9067  01 37     ORA ($37,X)
  $9069  1E 00 06  ASL $0600,X
  $906C  03        .db $03
  $906D  03        .db $03
  $906E  01 00     ORA ($00,X)
  $9070  53        .db $53
  $9071  91 12     STA ($12),Y
  $9073  3F        .db $3F
  $9074  7F        .db $7F
  $9075  FF        .db $FF
  $9076  77        .db $77
  $9077  23        .db $23
  $9078  8C 0E 0D  STY $0D0E
  $907B  14        .db $14
  $907C  34        .db $34
  $907D  72        .db $72
  $907E  E2        .db $E2
  $907F  C1 E7     CMP ($E7,X)
  $9081  FF        .db $FF
  $9082  00        BRK
  $9083  F1 CA     SBC ($CA),Y
  $9085  84 B1     STY $B1
  $9087  B1 1F     LDA ($1F),Y
  $9089  00        BRK
  $908A  FF        .db $FF
  $908B  0E 04 00  ASL $0004
  $908E  00        BRK
  $908F  00        BRK
  $9090  FF        .db $FF
  $9091  F8        SED
  $9092  03        .db $03
  $9093  FF        .db $FF
  $9094  1F        .db $1F

L_9095:
  $9095  0F        .db $0F
  $9096  8E 8C E0  STX $E08C
  $9099  07        .db $07
  $909A  FC        .db $FC
  $909B  00        BRK
  $909C  00        BRK
  $909D  00        BRK
  $909E  01 03     ORA ($03,X)
  $90A0  08        PHP
  $90A1  18        CLC
  $90A2  34        .db $34
  $90A3  62        .db $62
  $90A4  E2        .db $E2
  $90A5  E2        .db $E2
  $90A6  3E 1E F0  ROL $F01E,X

L_90A9:
  $90A9  E0 C8     CPX #$C8
  $90AB  9C        .db $9C
  $90AC  9C        .db $9C
  $90AD  1C        .db $1C
  $90AE  C4 EC     CPY $EC
  $90B0  C1 00     CMP ($00,X)
  $90B2  00        BRK
  $90B3  00        BRK
  $90B4  00        BRK
  $90B5  00        BRK
  $90B6  00        BRK
  $90B7  01 00     ORA ($00,X)
  $90B9  00        BRK
  $90BA  00        BRK
  $90BB  00        BRK
  $90BC  00        BRK
  $90BD  00        BRK
  $90BE  00        BRK
  $90BF  00        BRK
  $90C0  C6 FF     DEC $FF
  $90C2  4F        .db $4F
  $90C3  30 1F     BMI $90E4
  $90C5  7A        .db $7A
  $90C6  FF        .db $FF
  $90C7  F8        SED
  $90C8  80        .db $80
  $90C9  46 3F     LSR $3F
  $90CB  0F        .db $0F
  $90CC  00        BRK
  $90CD  17        .db $17
  $90CE  78        SEI
  $90CF  C0 1F     CPY #$1F
  $90D1  FC        .db $FC
  $90D2  04        .db $04
  $90D3  3C        .db $3C
  $90D4  F2        .db $F2
  $90D5  79 FE 1D  ADC $1DFE,Y
  $90D8  00        BRK
  $90D9  0B        .db $0B
  $90DA  FB        .db $FB
  $90DB  C3        .db $C3
  $90DC  01 B0     ORA ($B0,X)
  $90DE  18        CLC
  $90DF  0E 1F 0F  ASL $0F1F
  $90E2  0D 1D 3E  ORA $3E1D
  $90E5  C0 00     CPY #$00
  $90E7  00        BRK
  $90E8  E6 F2     INC $F2
  $90EA  FA        .db $FA
  $90EB  EE C0 00  INC $00C0
  $90EE  00        BRK
  $90EF  00        BRK
  $90F0  02        .db $02
  $90F1  04        .db $04
  $90F2  04        .db $04
  $90F3  0F        .db $0F
  $90F4  3F        .db $3F
  $90F5  7F        .db $7F
  $90F6  FF        .db $FF
  $90F7  FF        .db $FF
  $90F8  01 03     ORA ($03,X)
  $90FA  03        .db $03
  $90FB  00        BRK
  $90FC  0F        .db $0F
  $90FD  3F        .db $3F
  $90FE  7F        .db $7F

L_90FF:
  $90FF  00        BRK
  $9100  20 20 10  JSR $1020
  $9103  10 90     BPL $9095
  $9105  F0 F8     BEQ $90FF
  $9107  F8        SED
  $9108  C0 C0     CPY #$C0
  $910A  E0 E0     CPX #$E0
  $910C  60        RTS
  $910D  80        .db $80
  $910E  F0 00     BEQ $9110

L_9110:
  $9110  08        PHP
  $9111  10 10     BPL $9123
  $9113  10 0B     BPL $9120
  $9115  0F        .db $0F
  $9116  1F        .db $1F
  $9117  1F        .db $1F
  $9118  07        .db $07
  $9119  0F        .db $0F
  $911A  0F        .db $0F
  $911B  0F        .db $0F
  $911C  04        .db $04
  $911D  03        .db $03
  $911E  0F        .db $0F
  $911F  00        BRK

L_9120:
  $9120  80        .db $80

L_9121:
  $9121  40        RTI
  $9122  40        RTI

L_9123:
  $9123  F0 FC     BEQ $9121
  $9125  FE FF FF  INC $FFFF,X
  $9128  00        BRK
  $9129  80        .db $80

L_912A:
  $912A  80        .db $80
  $912B  00        BRK
  $912C  F0 FC     BEQ $912A
  $912E  FE 00 00  INC $0000,X
  $9131  00        BRK
  $9132  00        BRK
  $9133  03        .db $03
  $9134  C3        .db $C3
  $9135  8F        .db $8F
  $9136  CF        .db $CF
  $9137  C7        .db $C7
  $9138  01 0B     ORA ($0B,X)
  $913A  0B        .db $0B
  $913B  3F        .db $3F
  $913C  3F        .db $3F
  $913D  7F        .db $7F
  $913E  3F        .db $3F
  $913F  3F        .db $3F
  $9140  00        BRK
  $9141  08        PHP
  $9142  8C 82 A7  STY $A782
  $9145  E3        .db $E3
  $9146  A7        .db $A7
  $9147  C7        .db $C7
  $9148  20 F0 F0  JSR $F0F0
  $914B  FC        .db $FC
  $914C  F8        SED
  $914D  FC        .db $FC
  $914E  F8        SED
  $914F  F8        SED
  $9150  E3        .db $E3
  $9151  FF        .db $FF
  $9152  00        BRK
  $9153  F1 CA     SBC ($CA),Y
  $9155  84 B1     STY $B1
  $9157  B1 1F     LDA ($1F),Y
  $9159  00        BRK
  $915A  FF        .db $FF
  $915B  0E 04 00  ASL $0004
  $915E  00        BRK
  $915F  00        BRK
  $9160  1F        .db $1F
  $9161  F8        SED
  $9162  03        .db $03
  $9163  FF        .db $FF
  $9164  1F        .db $1F
  $9165  0F        .db $0F
  $9166  8E 8C E0  STX $E08C
  $9169  07        .db $07
  $916A  FC        .db $FC
  $916B  00        BRK
  $916C  00        BRK
  $916D  00        BRK
  $916E  01 03     ORA ($03,X)
  $9170  00        BRK
  $9171  00        BRK
  $9172  00        BRK
  $9173  00        BRK
  $9174  00        BRK
  $9175  00        BRK
  $9176  00        BRK
  $9177  00        BRK
  $9178  00        BRK
  $9179  00        BRK
  $917A  00        BRK
  $917B  31 7B     AND ($7B),Y
  $917D  4E 4E 39  LSR $394E
  $9180  00        BRK
  $9181  00        BRK
  $9182  00        BRK
  $9183  00        BRK
  $9184  00        BRK
  $9185  00        BRK
  $9186  00        BRK
  $9187  00        BRK
  $9188  00        BRK
  $9189  00        BRK
  $918A  00        BRK
  $918B  E0 F0     CPX #$F0
  $918D  70 70     BVS $91FF
  $918F  E0 00     CPX #$00
  $9191  00        BRK
  $9192  00        BRK
  $9193  00        BRK
  $9194  04        .db $04
  $9195  44        .db $44
  $9196  42        .db $42
  $9197  21 00     AND ($00,X)
  $9199  00        BRK
  $919A  00        BRK
  $919B  00        BRK
  $919C  08        PHP
  $919D  88        DEY
  $919E  8C C6 01  STY $01C6
  $91A1  00        BRK
  $91A2  25 25     AND $25
  $91A4  03        .db $03
  $91A5  07        .db $07
  $91A6  27        .db $27
  $91A7  2F        .db $2F
  $91A8  2E 0F 4F  ROL $4F0F
  $91AB  5F        .db $5F
  $91AC  7F        .db $7F
  $91AD  7F        .db $7F
  $91AE  FF        .db $FF
  $91AF  FF        .db $FF
  $91B0  0B        .db $0B
  $91B1  07        .db $07

L_91B2:
  $91B2  07        .db $07
  $91B3  C6 CE     DEC $CE
  $91B5  CC D8 13  CPY $13D8
  $91B8  F0 F8     BEQ $91B2
  $91BA  F8        SED
  $91BB  F9 F1 F3  SBC $F3F1,Y
  $91BE  E7        .db $E7
  $91BF  ED C0 20  SBC $20C0
  $91C2  3C        .db $3C
  $91C3  32        .db $32
  $91C4  61 E1     ADC ($E1,X)
  $91C6  E7        .db $E7
  $91C7  EF        .db $EF
  $91C8  00        BRK
  $91C9  C0 E0     CPY #$E0
  $91CB  EC DE DE  CPX $DEDE
  $91CE  D8        CLD
  $91CF  D6 00     DEC $00,X
  $91D1  00        BRK
  $91D2  00        BRK
  $91D3  01 03     ORA ($03,X)
  $91D5  06 0D     ASL $0D
  $91D7  1D 00 00  ORA $0000,X
  $91DA  00        BRK
  $91DB  00        BRK
  $91DC  00        BRK
  $91DD  01 02     ORA ($02,X)
  $91DF  0A        ASL
  $91E0  2F        .db $2F
  $91E1  1F        .db $1F
  $91E2  0F        .db $0F
  $91E3  9F        .db $9F
  $91E4  C7        .db $C7
  $91E5  FE F8 F0  INC $F0F8,X
  $91E8  FF        .db $FF
  $91E9  FF        .db $FF
  $91EA  FE 7C 38  INC $387C,X
  $91ED  01 07     ORA ($07,X)
  $91EF  0F        .db $0F
  $91F0  F7        .db $F7
  $91F1  E7        .db $E7
  $91F2  CF        .db $CF
  $91F3  9F        .db $9F
  $91F4  23        .db $23

L_91F5:
  $91F5  41 41     EOR ($41,X)
  $91F7  B1 89     LDA ($89),Y
  $91F9  18        CLC
  $91FA  30 60     BMI $925C

L_91FC:
  $91FC  C0 80     CPY #$80
  $91FE  80        .db $80

L_91FF:
  $91FF  00        BRK
  $9200  FE FA F9  INC $F9FA,X
  $9203  F9 F1 D1  SBC $D1F1,Y
  $9206  D2        .db $D2
  $9207  A4 E3     LDY $E3
  $9209  F1 F0     SBC ($F0),Y
  $920B  F0 60     BEQ $926D
  $920D  60        RTS
  $920E  61 43     ADC ($43,X)
  $9210  80        .db $80
  $9211  40        RTI
  $9212  E0 F0     CPX #$F0
  $9214  F0 10     BEQ $9226
  $9216  08        PHP
  $9217  04        .db $04

L_9218:
  $9218  00        BRK
  $9219  80        .db $80
  $921A  C0 E0     CPY #$E0
  $921C  E0 E0     CPX #$E0
  $921E  F0 F8     BEQ $9218
  $9220  00        BRK
  $9221  00        BRK
  $9222  00        BRK
  $9223  00        BRK
  $9224  00        BRK
  $9225  01 02     ORA ($02,X)
  $9227  04        .db $04
  $9228  00        BRK
  $9229  00        BRK

L_922A:
  $922A  00        BRK
  $922B  00        BRK
  $922C  00        BRK
  $922D  00        BRK
  $922E  01 03     ORA ($03,X)

L_9230:
  $9230  3D 7C 9A  AND $9A7C,X
  $9233  D1 E0     CMP ($E0),Y
  $9235  F0 08     BEQ $923F
  $9237  08        PHP
  $9238  1A        .db $1A
  $9239  3B        .db $3B
  $923A  71 60     ADC ($60),Y
  $923C  40        RTI
  $923D  40        RTI
  $923E  F0 F0     BEQ $9230
  $9240  CF        .db $CF
  $9241  19 39 FC  ORA $FC39,Y
  $9244  7F        .db $7F
  $9245  1F        .db $1F
  $9246  03        .db $03
  $9247  07        .db $07
  $9248  30 E0     BMI $922A
  $924A  C0 60     CPY #$60
  $924C  1C        .db $1C
  $924D  03        .db $03
  $924E  00        BRK
  $924F  03        .db $03
  $9250  31 82     AND ($82),Y
  $9252  BC 71 E3  LDY $E371,X
  $9255  8C FA FF  STY $FFFA
  $9258  00        BRK
  $9259  01 03     ORA ($03,X)
  $925B  3E 3C F3  ROL $F33C,X
  $925E  07        .db $07
  $925F  C0 24     CPY #$24
  $9261  44        .db $44
  $9262  C2        .db $C2
  $9263  C2        .db $C2
  $9264  61 70     ADC ($70,X)
  $9266  F8        SED
  $9267  3E C3 83  ROL $83C3,X
  $926A  01 01     ORA ($01,X)
  $926C  80        .db $80

L_926D:
  $926D  A0 30     LDY #$30
  $926F  18        CLC
  $9270  04        .db $04
  $9271  04        .db $04
  $9272  08        PHP
  $9273  70 80     BVS $91F5
  $9275  00        BRK
  $9276  00        BRK
  $9277  00        BRK
  $9278  F8        SED
  $9279  F8        SED
  $927A  F0 80     BEQ $91FC
  $927C  00        BRK
  $927D  00        BRK
  $927E  00        BRK
  $927F  00        BRK
  $9280  08        PHP
  $9281  08        PHP
  $9282  08        PHP
  $9283  05 05     ORA $05
  $9285  03        .db $03
  $9286  00        BRK
  $9287  00        BRK
  $9288  07        .db $07
  $9289  07        .db $07
  $928A  07        .db $07
  $928B  02        .db $02
  $928C  02        .db $02
  $928D  00        BRK
  $928E  00        BRK
  $928F  00        BRK
  $9290  04        .db $04
  $9291  14        .db $14
  $9292  34        .db $34
  $9293  38        SEC
  $9294  40        RTI
  $9295  40        RTI
  $9296  80        .db $80
  $9297  00        BRK
  $9298  F8        SED
  $9299  E8        INX
  $929A  C8        INY
  $929B  C0 80     CPY #$80
  $929D  80        .db $80
  $929E  00        BRK
  $929F  00        BRK
  $92A0  0F        .db $0F
  $92A1  08        PHP
  $92A2  08        PHP
  $92A3  0F        .db $0F
  $92A4  3F        .db $3F
  $92A5  7F        .db $7F
  $92A6  FF        .db $FF
  $92A7  FF        .db $FF
  $92A8  06 07     ASL $07
  $92AA  07        .db $07
  $92AB  00        BRK
  $92AC  0F        .db $0F
  $92AD  3F        .db $3F
  $92AE  7F        .db $7F

L_92AF:
  $92AF  00        BRK
  $92B0  E0 40     CPX #$40
  $92B2  20 10 90  JSR $9010
  $92B5  F0 F8     BEQ $92AF
  $92B7  F8        SED
  $92B8  00        BRK
  $92B9  80        .db $80
  $92BA  C0 E0     CPY #$E0
  $92BC  60        RTS
  $92BD  80        .db $80
  $92BE  F0 00     BEQ $92C0

L_92C0:
  $92C0  19 20 20  ORA $2020,Y
  $92C3  20 13 0F  JSR $0F13
  $92C6  1F        .db $1F
  $92C7  1F        .db $1F
  $92C8  06 1F     ASL $1F
  $92CA  1F        .db $1F
  $92CB  1F        .db $1F
  $92CC  0C        .db $0C
  $92CD  03        .db $03
  $92CE  0F        .db $0F
  $92CF  00        BRK
  $92D0  80        .db $80

L_92D1:
  $92D1  C0 40     CPY #$40
  $92D3  F0 FC     BEQ $92D1
  $92D5  FE FF FF  INC $FFFF,X
  $92D8  00        BRK
  $92D9  00        BRK

L_92DA:
  $92DA  80        .db $80
  $92DB  00        BRK
  $92DC  F0 FC     BEQ $92DA
  $92DE  FE 00 00  INC $0000,X
  $92E1  00        BRK
  $92E2  01 02     ORA ($02,X)
  $92E4  04        .db $04
  $92E5  09 09     ORA #$09
  $92E7  08        PHP
  $92E8  00        BRK
  $92E9  00        BRK
  $92EA  00        BRK
  $92EB  01 03     ORA ($03,X)
  $92ED  06 06     ASL $06
  $92EF  07        .db $07
  $92F0  02        .db $02
  $92F1  00        BRK
  $92F2  E0 18     CPX #$18
  $92F4  08        PHP
  $92F5  81 C1     STA ($C1,X)
  $92F7  0D 05 0F  ORA $0F05
  $92FA  0F        .db $0F
  $92FB  E7        .db $E7
  $92FC  F7        .db $F7
  $92FD  7F        .db $7F
  $92FE  3F        .db $3F
  $92FF  FF        .db $FF
  $9300  03        .db $03
  $9301  77        .db $77
  $9302  4F        .db $4F
  $9303  06 0E     ASL $0E

L_9305:
  $9305  AC 18 93  LDY $9318
  $9308  00        BRK
  $9309  80        .db $80
  $930A  B0 F9     BCS $9305
  $930C  F1 F3     SBC ($F3),Y
  $930E  E7        .db $E7
  $930F  ED 09 0F  SBC $0F09
  $9312  1F        .db $1F
  $9313  3F        .db $3F
  $9314  4F        .db $4F
  $9315  5B        .db $5B
  $9316  7D 3D 06  ADC $063D,X
  $9319  04        .db $04
  $931A  0E 1C 30  ASL $301C
  $931D  30 32     BMI $9351
  $931F  1A        .db $1A
  $9320  86 04     STX $04
  $9322  C3        .db $C3
  $9323  83        .db $83
  $9324  C7        .db $C7
  $9325  FE F8 F0  INC $F0F8,X
  $9328  7F        .db $7F
  $9329  FF        .db $FF
  $932A  3E 7C 38  ROL $387C,X
  $932D  01 07     ORA ($07,X)
  $932F  0F        .db $0F
  $9330  1D 0C 02  ORA $020C,X
  $9333  01 00     ORA ($00,X)
  $9335  00        BRK
  $9336  00        BRK
  $9337  00        BRK
  $9338  0A        ASL
  $9339  03        .db $03
  $933A  01 00     ORA ($00,X)
  $933C  00        BRK
  $933D  00        BRK
  $933E  00        BRK
  $933F  00        BRK
  $9340  00        BRK
  $9341  00        BRK
  $9342  00        BRK
  $9343  00        BRK
  $9344  00        BRK
  $9345  00        BRK
  $9346  00        BRK
  $9347  00        BRK
  $9348  01 0C     ORA ($0C,X)
  $934A  0C        .db $0C
  $934B  07        .db $07
  $934C  00        BRK
  $934D  00        BRK
  $934E  00        BRK
  $934F  00        BRK
  $9350  00        BRK

L_9351:
  $9351  00        BRK
  $9352  00        BRK
  $9353  00        BRK
  $9354  00        BRK
  $9355  00        BRK
  $9356  00        BRK
  $9357  00        BRK
  $9358  00        BRK
  $9359  38        SEC
  $935A  7C        .db $7C
  $935B  7C        .db $7C
  $935C  9C        .db $9C
  $935D  9C        .db $9C
  $935E  F8        SED
  $935F  80        .db $80
  $9360  03        .db $03
  $9361  0D 12 17  ORA $1712
  $9364  2E 46 43  ROL $4346
  $9367  BF        .db $BF
  $9368  00        BRK

L_9369:
  $9369  02        .db $02
  $936A  0C        .db $0C
  $936B  0C        .db $0C
  $936C  17        .db $17
  $936D  3F        .db $3F
  $936E  3F        .db $3F
  $936F  4F        .db $4F
  $9370  30 48     BMI $93BA
  $9372  C8        INY
  $9373  0C        .db $0C
  $9374  12        .db $12

L_9375:
  $9375  A4 F6     LDY $F6
  $9377  FA        .db $FA
  $9378  00        BRK
  $9379  30 30     BMI $93AB
  $937B  F0 EC     BEQ $9369
  $937D  F8        SED
  $937E  F8        SED
  $937F  C4 BF     CPY $BF
  $9381  97        .db $97
  $9382  93        .db $93
  $9383  9F        .db $9F
  $9384  4F        .db $4F
  $9385  23        .db $23
  $9386  18        CLC
  $9387  07        .db $07
  $9388  47        .db $47
  $9389  6B        .db $6B
  $938A  6C 73 3F  JMP ($3F73)
  $938D  1F        .db $1F
  $938E  07        .db $07
  $938F  00        BRK
  $9390  F9 B1 31  SBC $31B1,Y
  $9393  F2        .db $F2
  $9394  E2        .db $E2
  $9395  C4 18     CPY $18
  $9397  E0 8E     CPX #$8E
  $9399  4E CE 1C  LSR $1CCE
  $939C  FC        .db $FC
  $939D  F8        SED
  $939E  E0 00     CPX #$00
  $93A0  00        BRK
  $93A1  03        .db $03
  $93A2  04        .db $04
  $93A3  16 2A     ASL $2A,X
  $93A5  22        .db $22
  $93A6  22        .db $22
  $93A7  7A        .db $7A
  $93A8  00        BRK
  $93A9  00        BRK
  $93AA  03        .db $03

L_93AB:
  $93AB  01 15     ORA ($15,X)
  $93AD  1F        .db $1F
  $93AE  1F        .db $1F
  $93AF  0F        .db $0F
  $93B0  00        BRK
  $93B1  80        .db $80
  $93B2  50 68     BVC $941C
  $93B4  44        .db $44
  $93B5  04        .db $04
  $93B6  C2        .db $C2
  $93B7  FA        .db $FA
  $93B8  00        BRK
  $93B9  00        BRK

L_93BA:
  $93BA  80        .db $80
  $93BB  90 B8     BCC $9375
  $93BD  F8        SED
  $93BE  FC        .db $FC
  $93BF  C4 7F     CPY $7F
  $93C1  57        .db $57
  $93C2  53        .db $53
  $93C3  4F        .db $4F
  $93C4  27        .db $27
  $93C5  13        .db $13
  $93C6  08        PHP
  $93C7  07        .db $07
  $93C8  07        .db $07
  $93C9  2B        .db $2B
  $93CA  2C 33 1F  BIT $1F33
  $93CD  0F        .db $0F
  $93CE  07        .db $07
  $93CF  00        BRK
  $93D0  F2        .db $F2
  $93D1  B2        .db $B2
  $93D2  32        .db $32
  $93D3  E4 C4     CPX $C4
  $93D5  88        DEY
  $93D6  30 C0     BMI $9398
  $93D8  8C 4C CC  STY $CC4C
  $93DB  18        CLC
  $93DC  F8        SED
  $93DD  F0 C0     BEQ $939F
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
  $93F9  F2        .db $F2
  $93FA  17        .db $17
  $93FB  52        .db $52
  $93FC  72        .db $72
  $93FD  47        .db $47
  $93FE  42        .db $42
  $93FF  42        .db $42
  $9400  03        .db $03
  $9401  0D 3D 7D  ORA $7D3D
  $9404  FD FD FD  SBC $FDFD,X
  $9407  FD 00 02  SBC $0200,X
  $940A  0E 3E 7E  ASL $7E3E
  $940D  FE FE FE  INC $FEFE,X
  $9410  0F        .db $0F
  $9411  1F        .db $1F
  $9412  1F        .db $1F
  $9413  3E 3C 78  ROL $783C,X
  $9416  78        SEI
  $9417  F8        SED
  $9418  07        .db $07
  $9419  0F        .db $0F
  $941A  0F        .db $0F
  $941B  1E 1C 38  ASL $381C,X
  $941E  38        SEC
  $941F  78        SEI
  $9420  FD FD FD  SBC $FDFD,X
  $9423  1D 0D 05  ORA $050D,X
  $9426  05 05     ORA $05
  $9428  FE FE FE  INC $FEFE,X
  $942B  1E 0E 06  ASL $060E,X
  $942E  06 06     ASL $06
  $9430  BF        .db $BF
  $9431  BF        .db $BF
  $9432  BF        .db $BF
  $9433  BF        .db $BF
  $9434  BF        .db $BF
  $9435  BF        .db $BF
  $9436  BF        .db $BF
  $9437  BF        .db $BF
  $9438  7F        .db $7F
  $9439  7F        .db $7F

L_943A:
  $943A  7F        .db $7F
  $943B  7F        .db $7F
  $943C  7F        .db $7F
  $943D  7F        .db $7F
  $943E  7F        .db $7F
  $943F  7F        .db $7F
  $9440  F0 F8     BEQ $943A
  $9442  F8        SED
  $9443  FC        .db $FC

L_9444:
  $9444  FC        .db $FC
  $9445  FE FE FF  INC $FFFE,X
  $9448  E0 F0     CPX #$F0
  $944A  F0 F8     BEQ $9444
  $944C  F8        SED
  $944D  FC        .db $FC
  $944E  FC        .db $FC
  $944F  FE 00 00  INC $0000,X
  $9452  01 01     ORA ($01,X)
  $9454  01 01     ORA ($01,X)
  $9456  03        .db $03
  $9457  03        .db $03
  $9458  00        BRK
  $9459  00        BRK
  $945A  00        BRK
  $945B  00        BRK
  $945C  00        BRK
  $945D  00        BRK
  $945E  01 01     ORA ($01,X)
  $9460  F8        SED
  $9461  FC        .db $FC
  $9462  FE FF FF  INC $FFFF,X
  $9465  FF        .db $FF
  $9466  FF        .db $FF
  $9467  FF        .db $FF
  $9468  78        SEI
  $9469  7C        .db $7C
  $946A  FE FF FF  INC $FFFF,X
  $946D  FF        .db $FF
  $946E  FF        .db $FF
  $946F  FF        .db $FF
  $9470  05 0D     ORA $0D
  $9472  1D FD FF  ORA $FFFD,X
  $9475  FE FE FF  INC $FFFE,X
  $9478  06 0E     ASL $0E
  $947A  1E FE FD  ASL $FDFE,X
  $947D  FB        .db $FB
  $947E  FB        .db $FB
  $947F  FD BF BF  SBC $BFBF,X
  $9482  BF        .db $BF
  $9483  BF        .db $BF
  $9484  FF        .db $FF
  $9485  7F        .db $7F
  $9486  7F        .db $7F
  $9487  FF        .db $FF
  $9488  7F        .db $7F
  $9489  7F        .db $7F
  $948A  7F        .db $7F
  $948B  7F        .db $7F
  $948C  BF        .db $BF
  $948D  DF        .db $DF
  $948E  DF        .db $DF
  $948F  BF        .db $BF
  $9490  FF        .db $FF
  $9491  FF        .db $FF
  $9492  FF        .db $FF
  $9493  FF        .db $FF
  $9494  FF        .db $FF
  $9495  FF        .db $FF
  $9496  FF        .db $FF
  $9497  FF        .db $FF
  $9498  FE FE FF  INC $FFFE,X
  $949B  FF        .db $FF
  $949C  FF        .db $FF
  $949D  FF        .db $FF
  $949E  FF        .db $FF
  $949F  FF        .db $FF
  $94A0  03        .db $03
  $94A1  07        .db $07
  $94A2  0B        .db $0B
  $94A3  13        .db $13
  $94A4  23        .db $23
  $94A5  43        .db $43
  $94A6  81 81     STA ($81,X)
  $94A8  01 01     ORA ($01,X)
  $94AA  05 0D     ORA $0D
  $94AC  1D 3D 7E  ORA $7E3D,X
  $94AF  7E DF 9F  ROR $9FDF,X
  $94B2  8F        .db $8F
  $94B3  8F        .db $8F
  $94B4  8F        .db $8F
  $94B5  CF        .db $CF
  $94B6  E7        .db $E7
  $94B7  F7        .db $F7
  $94B8  FF        .db $FF
  $94B9  FF        .db $FF
  $94BA  FF        .db $FF
  $94BB  FF        .db $FF
  $94BC  FF        .db $FF
  $94BD  FF        .db $FF
  $94BE  FF        .db $FF
  $94BF  FF        .db $FF
  $94C0  FF        .db $FF
  $94C1  FF        .db $FF
  $94C2  FF        .db $FF
  $94C3  FF        .db $FF
  $94C4  FE FC FC  INC $FCFC,X
  $94C7  F8        SED
  $94C8  FE 3F C7  INC $C73F,X
  $94CB  F8        SED
  $94CC  FD FB FB  SBC $FBFB,X
  $94CF  F7        .db $F7
  $94D0  FF        .db $FF
  $94D1  FF        .db $FF
  $94D2  FF        .db $FF
  $94D3  FF        .db $FF
  $94D4  FF        .db $FF
  $94D5  FF        .db $FF
  $94D6  FF        .db $FF
  $94D7  FF        .db $FF
  $94D8  FF        .db $FF
  $94D9  FF        .db $FF
  $94DA  FF        .db $FF
  $94DB  FF        .db $FF
  $94DC  FF        .db $FF
  $94DD  FF        .db $FF
  $94DE  FF        .db $FF
  $94DF  FF        .db $FF
  $94E0  C0 C0     CPY #$C0
  $94E2  C0 C0     CPY #$C0
  $94E4  C0 C0     CPY #$C0
  $94E6  80        .db $80
  $94E7  80        .db $80
  $94E8  80        .db $80
  $94E9  80        .db $80
  $94EA  80        .db $80
  $94EB  80        .db $80
  $94EC  80        .db $80
  $94ED  80        .db $80
  $94EE  00        BRK
  $94EF  00        BRK
  $94F0  81 81     STA ($81,X)
  $94F2  81 41     STA ($41,X)
  $94F4  40        RTI
  $94F5  40        RTI
  $94F6  40        RTI
  $94F7  20 7E 7E  JSR $7E7E
  $94FA  7E 3E 3F  ROR $3F3E,X
  $94FD  3F        .db $3F
  $94FE  3F        .db $3F
  $94FF  1F        .db $1F
  $9500  FF        .db $FF
  $9501  FF        .db $FF
  $9502  FF        .db $FF

L_9503:
  $9503  FF        .db $FF
  $9504  FF        .db $FF
  $9505  FF        .db $FF
  $9506  FF        .db $FF
  $9507  7F        .db $7F
  $9508  FF        .db $FF
  $9509  FF        .db $FF
  $950A  FF        .db $FF
  $950B  FF        .db $FF
  $950C  7F        .db $7F
  $950D  7F        .db $7F
  $950E  7F        .db $7F
  $950F  BF        .db $BF
  $9510  F8        SED
  $9511  F0 F0     BEQ $9503
  $9513  E0 E0     CPX #$E0
  $9515  F8        SED
  $9516  FF        .db $FF
  $9517  FF        .db $FF
  $9518  F7        .db $F7
  $9519  EF        .db $EF
  $951A  EF        .db $EF
  $951B  DF        .db $DF
  $951C  DF        .db $DF
  $951D  E7        .db $E7
  $951E  F8        SED
  $951F  FF        .db $FF
  $9520  FF        .db $FF
  $9521  FF        .db $FF
  $9522  FF        .db $FF
  $9523  FF        .db $FF
  $9524  FF        .db $FF
  $9525  FF        .db $FF
  $9526  FF        .db $FF
  $9527  FE FF FF  INC $FFFF,X
  $952A  FF        .db $FF
  $952B  FF        .db $FF
  $952C  FE FE FE  INC $FEFE,X
  $952F  FC        .db $FC
  $9530  80        .db $80
  $9531  80        .db $80
  $9532  80        .db $80
  $9533  80        .db $80
  $9534  00        BRK
  $9535  00        BRK
  $9536  00        BRK
  $9537  00        BRK
  $9538  00        BRK
  $9539  00        BRK
  $953A  00        BRK
  $953B  00        BRK
  $953C  00        BRK
  $953D  00        BRK
  $953E  00        BRK
  $953F  00        BRK
  $9540  20 10 10  JSR $1010
  $9543  08        PHP
  $9544  04        .db $04
  $9545  02        .db $02
  $9546  01 00     ORA ($00,X)
  $9548  1F        .db $1F
  $9549  0F        .db $0F
  $954A  0F        .db $0F
  $954B  07        .db $07
  $954C  03        .db $03
  $954D  01 00     ORA ($00,X)
  $954F  00        BRK
  $9550  7F        .db $7F
  $9551  3F        .db $3F
  $9552  3F        .db $3F
  $9553  1F        .db $1F
  $9554  1F        .db $1F
  $9555  0F        .db $0F
  $9556  07        .db $07
  $9557  83        .db $83
  $9558  BF        .db $BF
  $9559  DF        .db $DF
  $955A  DF        .db $DF
  $955B  EF        .db $EF
  $955C  EF        .db $EF
  $955D  F7        .db $F7
  $955E  FB        .db $FB
  $955F  7D FF FC  ADC $FCFF,X
  $9562  FC        .db $FC
  $9563  F8        SED
  $9564  F8        SED
  $9565  F8        SED
  $9566  E9 C6     SBC #$C6
  $9568  FC        .db $FC
  $9569  FB        .db $FB
  $956A  FB        .db $FB
  $956B  F7        .db $F7
  $956C  F7        .db $F7
  $956D  E7        .db $E7
  $956E  C6 80     DEC $80
  $9570  00        BRK
  $9571  80        .db $80
  $9572  40        RTI
  $9573  40        RTI
  $9574  40        RTI
  $9575  80        .db $80
  $9576  00        BRK
  $9577  00        BRK
  $9578  00        BRK
  $9579  00        BRK
  $957A  80        .db $80
  $957B  80        .db $80
  $957C  80        .db $80
  $957D  00        BRK
  $957E  00        BRK
  $957F  00        BRK
  $9580  43        .db $43
  $9581  23        .db $23
  $9582  11 09     ORA ($09),Y

L_9584:
  $9584  05 03     ORA $03
  $9586  01 01     ORA ($01,X)
  $9588  3D 1D 0E  AND $0E1D,X
  $958B  06 02     ASL $02
  $958D  00        BRK
  $958E  00        BRK
  $958F  00        BRK
  $9590  FF        .db $FF
  $9591  FF        .db $FF
  $9592  FF        .db $FF
  $9593  FF        .db $FF
  $9594  FF        .db $FF
  $9595  FF        .db $FF
  $9596  FF        .db $FF
  $9597  9E        .db $9E
  $9598  FF        .db $FF
  $9599  FF        .db $FF
  $959A  FF        .db $FF
  $959B  FF        .db $FF
  $959C  FF        .db $FF
  $959D  0F        .db $0F
  $959E  F6 F0     INC $F0,X
  $95A0  FF        .db $FF
  $95A1  FF        .db $FF
  $95A2  FE FC F0  INC $F0FC,X
  $95A5  C0 80     CPY #$80
  $95A7  00        BRK
  $95A8  FF        .db $FF
  $95A9  FE FC F0  INC $F0FC,X
  $95AC  C0 80     CPY #$80
  $95AE  00        BRK
  $95AF  00        BRK
  $95B0  00        BRK
  $95B1  00        BRK
  $95B2  00        BRK
  $95B3  00        BRK
  $95B4  03        .db $03
  $95B5  0C        .db $0C
  $95B6  30 20     BMI $95D8
  $95B8  00        BRK
  $95B9  00        BRK
  $95BA  00        BRK
  $95BB  00        BRK
  $95BC  00        BRK
  $95BD  03        .db $03
  $95BE  0F        .db $0F
  $95BF  1F        .db $1F
  $95C0  03        .db $03
  $95C1  0C        .db $0C
  $95C2  30 C0     BMI $9584
  $95C4  00        BRK
  $95C5  00        BRK
  $95C6  00        BRK
  $95C7  00        BRK

L_95C8:
  $95C8  00        BRK
  $95C9  03        .db $03
  $95CA  0F        .db $0F
  $95CB  3F        .db $3F

L_95CC:
  $95CC  FF        .db $FF
  $95CD  FF        .db $FF

L_95CE:
  $95CE  FF        .db $FF
  $95CF  FF        .db $FF

L_95D0:
  $95D0  F8        SED
  $95D1  F8        SED
  $95D2  08        PHP
  $95D3  08        PHP
  $95D4  08        PHP
  $95D5  08        PHP
  $95D6  08        PHP
  $95D7  08        PHP

L_95D8:
  $95D8  F0 00     BEQ $95DA

L_95DA:
  $95DA  F0 F0     BEQ $95CC
  $95DC  F0 F0     BEQ $95CE
  $95DE  F0 F0     BEQ $95D0
  $95E0  20 1E 01  JSR $011E
  $95E3  00        BRK
  $95E4  00        BRK
  $95E5  00        BRK
  $95E6  00        BRK
  $95E7  00        BRK
  $95E8  1F        .db $1F
  $95E9  01 00     ORA ($00,X)
  $95EB  00        BRK
  $95EC  00        BRK
  $95ED  00        BRK
  $95EE  00        BRK
  $95EF  00        BRK
  $95F0  00        BRK
  $95F1  00        BRK
  $95F2  C0 3C     CPY #$3C
  $95F4  02        .db $02
  $95F5  01 00     ORA ($00,X)
  $95F7  00        BRK
  $95F8  FF        .db $FF
  $95F9  FF        .db $FF

L_95FA:
  $95FA  3F        .db $3F
  $95FB  03        .db $03

L_95FC:
  $95FC  01 00     ORA ($00,X)
  $95FE  00        BRK
  $95FF  00        BRK
  $9600  08        PHP
  $9601  08        PHP
  $9602  08        PHP
  $9603  08        PHP
  $9604  08        PHP
  $9605  88        DEY
  $9606  68        PLA
  $9607  18        CLC
  $9608  F0 F0     BEQ $95FA
  $960A  F0 F0     BEQ $95FC
  $960C  F0 70     BEQ $967E
  $960E  10 00     BPL $9610

L_9610:
  $9610  00        BRK
  $9611  00        BRK
  $9612  00        BRK
  $9613  06 0D     ASL $0D
  $9615  1D 3E 3E  ORA $3E3E,X
  $9618  00        BRK
  $9619  00        BRK
  $961A  00        BRK
  $961B  00        BRK
  $961C  06 0E     ASL $0E
  $961E  1F        .db $1F
  $961F  1F        .db $1F
  $9620  00        BRK
  $9621  00        BRK
  $9622  00        BRK
  $9623  00        BRK
  $9624  F8        SED
  $9625  08        PHP
  $9626  90 A0     BCC $95C8
  $9628  00        BRK
  $9629  00        BRK
  $962A  00        BRK
  $962B  00        BRK
  $962C  00        BRK
  $962D  F0 60     BEQ $968F

L_962F:
  $962F  40        RTI
  $9630  00        BRK
  $9631  00        BRK
  $9632  00        BRK
  $9633  00        BRK
  $9634  01 01     ORA ($01,X)
  $9636  03        .db $03
  $9637  03        .db $03
  $9638  00        BRK
  $9639  00        BRK
  $963A  00        BRK
  $963B  00        BRK
  $963C  00        BRK
  $963D  00        BRK
  $963E  01 01     ORA ($01,X)
  $9640  7F        .db $7F
  $9641  7F        .db $7F
  $9642  FF        .db $FF
  $9643  FF        .db $FF
  $9644  FF        .db $FF
  $9645  F0 E0     BEQ $9627
  $9647  C0 3F     CPY #$3F
  $9649  3F        .db $3F
  $964A  7F        .db $7F
  $964B  7F        .db $7F
  $964C  FF        .db $FF
  $964D  F0 E0     BEQ $962F
  $964F  C0 40     CPY #$40
  $9651  40        RTI
  $9652  BE A2 D4  LDX $D4A2,Y
  $9655  D8        CLD
  $9656  68        PLA
  $9657  28        PLP
  $9658  80        .db $80
  $9659  80        .db $80
  $965A  C0 DC     CPY #$DC
  $965C  E8        INX
  $965D  E0 70     CPX #$70
  $965F  30 06     BMI $9667
  $9661  02        .db $02
  $9662  7D 45 2B  ADC $2B45,X
  $9665  1B        .db $1B
  $9666  17        .db $17

L_9667:
  $9667  17        .db $17
  $9668  01 01     ORA ($01,X)
  $966A  03        .db $03
  $966B  3B        .db $3B
  $966C  17        .db $17
  $966D  07        .db $07
  $966E  0F        .db $0F
  $966F  0F        .db $0F
  $9670  FE FE FF  INC $FFFE,X
  $9673  FF        .db $FF
  $9674  FF        .db $FF
  $9675  FF        .db $FF
  $9676  FF        .db $FF
  $9677  FF        .db $FF
  $9678  FC        .db $FC
  $9679  FC        .db $FC
  $967A  FE FE FF  INC $FFFE,X
  $967D  FF        .db $FF

L_967E:
  $967E  FF        .db $FF
  $967F  FF        .db $FF
  $9680  03        .db $03
  $9681  03        .db $03
  $9682  07        .db $07
  $9683  07        .db $07
  $9684  07        .db $07
  $9685  07        .db $07
  $9686  07        .db $07
  $9687  07        .db $07
  $9688  01 01     ORA ($01,X)
  $968A  03        .db $03
  $968B  03        .db $03
  $968C  03        .db $03
  $968D  03        .db $03
  $968E  03        .db $03

L_968F:
  $968F  03        .db $03
  $9690  C0 C0     CPY #$C0
  $9692  C0 E0     CPY #$E0
  $9694  F0 FF     BEQ $9695
  $9696  FF        .db $FF
  $9697  FF        .db $FF
  $9698  C0 C0     CPY #$C0
  $969A  C0 E0     CPY #$E0
  $969C  F0 FF     BEQ $969D
  $969E  FF        .db $FF
  $969F  FF        .db $FF
  $96A0  34        .db $34
  $96A1  36 3B     ROL $3B,X
  $96A3  7F        .db $7F
  $96A4  FF        .db $FF
  $96A5  FE FE FF  INC $FFFE,X
  $96A8  38        SEC
  $96A9  38        SEC
  $96AA  3C        .db $3C
  $96AB  7C        .db $7C
  $96AC  FD FB FB  SBC $FBFB,X
  $96AF  FD 2F 6F  SBC $6F2F,X
  $96B2  DF        .db $DF
  $96B3  FF        .db $FF
  $96B4  FF        .db $FF
  $96B5  7F        .db $7F
  $96B6  7F        .db $7F
  $96B7  FF        .db $FF
  $96B8  1F        .db $1F
  $96B9  1F        .db $1F
  $96BA  3F        .db $3F
  $96BB  3F        .db $3F
  $96BC  BF        .db $BF
  $96BD  DF        .db $DF
  $96BE  DF        .db $DF
  $96BF  BF        .db $BF
  $96C0  7F        .db $7F
  $96C1  3F        .db $3F
  $96C2  3F        .db $3F
  $96C3  1F        .db $1F
  $96C4  1F        .db $1F
  $96C5  0F        .db $0F
  $96C6  07        .db $07
  $96C7  C3        .db $C3
  $96C8  BF        .db $BF
  $96C9  DF        .db $DF
  $96CA  DF        .db $DF
  $96CB  EF        .db $EF
  $96CC  EF        .db $EF
  $96CD  F7        .db $F7
  $96CE  FB        .db $FB
  $96CF  3D FF FC  AND $FCFF,X
  $96D2  FC        .db $FC
  $96D3  F8        SED
  $96D4  F8        SED
  $96D5  F8        SED
  $96D6  E9 E6     SBC #$E6
  $96D8  FC        .db $FC
  $96D9  FB        .db $FB
  $96DA  FB        .db $FB
  $96DB  F7        .db $F7
  $96DC  F7        .db $F7
  $96DD  E7        .db $E7
  $96DE  C6 C0     DEC $C0
  $96E0  31 0C     AND ($0C),Y
  $96E2  03        .db $03
  $96E3  00        BRK
  $96E4  00        BRK
  $96E5  00        BRK
  $96E6  00        BRK
  $96E7  00        BRK
  $96E8  0E 03 00  ASL $0003
  $96EB  00        BRK
  $96EC  00        BRK
  $96ED  00        BRK
  $96EE  00        BRK
  $96EF  00        BRK
  $96F0  FF        .db $FF
  $96F1  FF        .db $FF
  $96F2  7F        .db $7F
  $96F3  FF        .db $FF
  $96F4  0F        .db $0F
  $96F5  03        .db $03
  $96F6  01 00     ORA ($00,X)
  $96F8  FF        .db $FF
  $96F9  7F        .db $7F
  $96FA  BF        .db $BF
  $96FB  0F        .db $0F
  $96FC  03        .db $03
  $96FD  01 00     ORA ($00,X)
  $96FF  00        BRK
  $9700  C0 C0     CPY #$C0
  $9702  80        .db $80
  $9703  80        .db $80
  $9704  80        .db $80
  $9705  00        BRK
  $9706  80        .db $80
  $9707  80        .db $80
  $9708  80        .db $80
  $9709  80        .db $80
  $970A  00        BRK
  $970B  00        BRK
  $970C  00        BRK
  $970D  00        BRK
  $970E  00        BRK
  $970F  00        BRK
  $9710  00        BRK
  $9711  00        BRK
  $9712  00        BRK
  $9713  00        BRK

L_9714:
  $9714  00        BRK
  $9715  01 03     ORA ($03,X)
  $9717  07        .db $07
  $9718  00        BRK
  $9719  00        BRK
  $971A  00        BRK
  $971B  00        BRK
  $971C  00        BRK
  $971D  00        BRK
  $971E  01 03     ORA ($03,X)
  $9720  00        BRK
  $9721  18        CLC
  $9722  3C        .db $3C
  $9723  3C        .db $3C
  $9724  18        CLC
  $9725  00        BRK
  $9726  00        BRK
  $9727  00        BRK
  $9728  3C        .db $3C
  $9729  66 C3     ROR $C3
  $972B  C3        .db $C3
  $972C  E7        .db $E7
  $972D  FF        .db $FF
  $972E  7E 3C 01  ROR $013C,X
  $9731  41 21     EOR ($21,X)
  $9733  1B        .db $1B
  $9734  1F        .db $1F

L_9735:
  $9735  0D 1F FF  ORA $FF1F
  $9738  00        BRK
  $9739  00        BRK
  $973A  00        BRK
  $973B  00        BRK
  $973C  00        BRK
  $973D  02        .db $02
  $973E  04        .db $04
  $973F  00        BRK
  $9740  00        BRK
  $9741  04        .db $04

L_9742:
  $9742  08        PHP
  $9743  B0 F0     BCS $9735
  $9745  E0 F0     CPX #$F0
  $9747  FE 00 00  INC $0000,X
  $974A  00        BRK
  $974B  00        BRK
  $974C  00        BRK
  $974D  00        BRK
  $974E  00        BRK
  $974F  00        BRK
  $9750  1F        .db $1F
  $9751  0F        .db $0F
  $9752  1F        .db $1F
  $9753  1B        .db $1B
  $9754  21 41     AND ($41,X)
  $9756  01 00     ORA ($00,X)
  $9758  00        BRK
  $9759  00        BRK
  $975A  00        BRK
  $975B  00        BRK
  $975C  00        BRK
  $975D  00        BRK
  $975E  00        BRK
  $975F  00        BRK
  $9760  F0 E0     BEQ $9742
  $9762  F0 B0     BEQ $9714
  $9764  08        PHP
  $9765  04        .db $04
  $9766  00        BRK
  $9767  00        BRK
  $9768  00        BRK
  $9769  00        BRK
  $976A  00        BRK
  $976B  00        BRK
  $976C  00        BRK
  $976D  00        BRK
  $976E  00        BRK
  $976F  00        BRK
  $9770  00        BRK
  $9771  03        .db $03
  $9772  01 0D     ORA ($0D,X)
  $9774  3C        .db $3C
  $9775  64        .db $64
  $9776  C7        .db $C7
  $9777  CD 00 02  CMP $0200
  $977A  02        .db $02
  $977B  0E 3F 7C  ASL $7C3F
  $977E  FF        .db $FF
  $977F  FE 00 C0  INC $C000,X
  $9782  80        .db $80
  $9783  B0 3C     BCS $97C1
  $9785  3E FF BF  ROL $BFFF,X
  $9788  00        BRK

L_9789:
  $9789  40        RTI
  $978A  40        RTI
  $978B  70 FC     BVS $9789
  $978D  3E FF 7F  ROL $7FFF,X
  $9790  01 01     ORA ($01,X)
  $9792  01 01     ORA ($01,X)
  $9794  01 01     ORA ($01,X)
  $9796  01 01     ORA ($01,X)
  $9798  01 01     ORA ($01,X)
  $979A  01 01     ORA ($01,X)
  $979C  03        .db $03
  $979D  03        .db $03
  $979E  03        .db $03
  $979F  03        .db $03
  $97A0  FD FC FC  SBC $FCFC,X
  $97A3  C7        .db $C7
  $97A4  83        .db $83
  $97A5  81 01     STA ($01,X)
  $97A7  00        BRK
  $97A8  FE FF FC  INC $FCFF,X
  $97AB  C7        .db $C7
  $97AC  83        .db $83
  $97AD  81 01     STA ($01,X)
  $97AF  00        BRK
  $97B0  00        BRK
  $97B1  00        BRK
  $97B2  00        BRK
  $97B3  00        BRK
  $97B4  00        BRK
  $97B5  00        BRK
  $97B6  00        BRK
  $97B7  00        BRK
  $97B8  01 01     ORA ($01,X)
  $97BA  00        BRK
  $97BB  00        BRK
  $97BC  00        BRK
  $97BD  01 03     ORA ($03,X)
  $97BF  07        .db $07
  $97C0  00        BRK

L_97C1:
  $97C1  00        BRK
  $97C2  00        BRK
  $97C3  00        BRK
  $97C4  00        BRK
  $97C5  00        BRK
  $97C6  00        BRK
  $97C7  00        BRK
  $97C8  00        BRK
  $97C9  00        BRK
  $97CA  80        .db $80
  $97CB  00        BRK
  $97CC  C0 C0     CPY #$C0
  $97CE  E0 F0     CPX #$F0
  $97D0  00        BRK
  $97D1  00        BRK
  $97D2  00        BRK
  $97D3  30 30     BMI $9805
  $97D5  68        PLA
  $97D6  4C DE 07  JMP $07DE
  $97D9  0F        .db $0F
  $97DA  0F        .db $0F
  $97DB  37        .db $37
  $97DC  37        .db $37

L_97DD:
  $97DD  7A        .db $7A
  $97DE  7C        .db $7C
  $97DF  FE 00 00  INC $0000,X
  $97E2  00        BRK
  $97E3  00        BRK
  $97E4  00        BRK
  $97E5  00        BRK
  $97E6  00        BRK
  $97E7  40        RTI
  $97E8  FE FF 7F  INC $7FFF,X
  $97EB  7F        .db $7F
  $97EC  7F        .db $7F
  $97ED  7F        .db $7F
  $97EE  3F        .db $3F
  $97EF  4F        .db $4F
  $97F0  00        BRK
  $97F1  00        BRK
  $97F2  00        BRK
  $97F3  00        BRK
  $97F4  00        BRK
  $97F5  00        BRK
  $97F6  01 03     ORA ($03,X)
  $97F8  7F        .db $7F
  $97F9  FF        .db $FF
  $97FA  FE FE FE  INC $FEFE,X
  $97FD  FE FD F3  INC $F3FD,X
  $9800  00        BRK
  $9801  00        BRK
  $9802  00        BRK
  $9803  00        BRK
  $9804  00        BRK

L_9805:
  $9805  00        BRK
  $9806  00        BRK
  $9807  E0 00     CPX #$00
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
  $9813  00        BRK
  $9814  00        BRK
  $9815  18        CLC
  $9816  64        .db $64
  $9817  9C        .db $9C
  $9818  00        BRK
  $9819  00        BRK
  $981A  00        BRK
  $981B  00        BRK
  $981C  00        BRK
  $981D  00        BRK
  $981E  18        CLC
  $981F  60        RTS
  $9820  01 02     ORA ($02,X)
  $9822  05 04     ORA $04
  $9824  09 0B     ORA #$0B
  $9826  0F        .db $0F
  $9827  0B        .db $0B
  $9828  00        BRK
  $9829  01 03     ORA ($03,X)
  $982B  03        .db $03
  $982C  06 04     ASL $04
  $982E  01 07     ORA ($07,X)
  $9830  11 D1     ORA ($D1),Y
  $9832  12        .db $12
  $9833  7E C2 02  ROR $02C2,X
  $9836  C1 00     CMP ($00,X)
  $9838  E0 E0     CPX #$E0
  $983A  E1 81     SBC ($81,X)
  $983C  3D FD FE  AND $FEFD,X
  $983F  FF        .db $FF
  $9840  3C        .db $3C
  $9841  7C        .db $7C
  $9842  7C        .db $7C
  $9843  78        SEI
  $9844  78        SEI
  $9845  70 68     BVS $98AF
  $9847  C4 C8     CPY $C8
  $9849  88        DEY
  $984A  98        TYA
  $984B  90 90     BCC $97DD
  $984D  80        .db $80
  $984E  90 38     BCC $9888
  $9850  16 24     ASL $24,X
  $9852  21 43     AND ($43,X)
  $9854  46 3F     LSR $3F
  $9856  23        .db $23
  $9857  40        RTI
  $9858  0F        .db $0F
  $9859  1F        .db $1F
  $985A  1E 3C 39  ASL $393C,X
  $985D  00        BRK
  $985E  1C        .db $1C
  $985F  3F        .db $3F
  $9860  78        SEI
  $9861  CC 84 04  CPY $0484
  $9864  05 89     ORA $89
  $9866  83        .db $83
  $9867  0F        .db $0F
  $9868  87        .db $87
  $9869  03        .db $03
  $986A  03        .db $03
  $986B  03        .db $03
  $986C  82        .db $82
  $986D  06 1C     ASL $1C
  $986F  F0 04     BEQ $9875
  $9871  02        .db $02
  $9872  02        .db $02
  $9873  E3        .db $E3
  $9874  B7        .db $B7

L_9875:
  $9875  57        .db $57
  $9876  5D 39 F8  EOR $F839,X
  $9879  FC        .db $FC
  $987A  FC        .db $FC
  $987B  1C        .db $1C
  $987C  48        PHA
  $987D  E8        INX
  $987E  E2        .db $E2
  $987F  C6 03     DEC $03
  $9881  07        .db $07
  $9882  07        .db $07
  $9883  07        .db $07
  $9884  04        .db $04
  $9885  03        .db $03
  $9886  00        BRK
  $9887  00        BRK

L_9888:
  $9888  00        BRK
  $9889  02        .db $02
  $988A  00        BRK
  $988B  00        BRK
  $988C  03        .db $03
  $988D  00        BRK
  $988E  00        BRK
  $988F  00        BRK
  $9890  80        .db $80
  $9891  E0 C1     CPX #$C1
  $9893  87        .db $87
  $9894  1F        .db $1F
  $9895  FB        .db $FB
  $9896  DB        .db $DB
  $9897  0B        .db $0B
  $9898  7F        .db $7F
  $9899  1F        .db $1F
  $989A  3E 78 E0  ROL $E078,X
  $989D  04        .db $04
  $989E  8C 44 38  STY $3844
  $98A1  77        .db $77
  $98A2  FF        .db $FF
  $98A3  FF        .db $FF
  $98A4  FE FE FD  INC $FDFE,X
  $98A7  FD C7 8F  SBC $8FC7,X
  $98AA  0F        .db $0F
  $98AB  0F        .db $0F
  $98AC  0F        .db $0F
  $98AD  0F        .db $0F
  $98AE  0E 1E F1  ASL $F11E
  $98B1  62        .db $62
  $98B2  62        .db $62
  $98B3  44        .db $44
  $98B4  58        CLI

L_98B5:
  $98B5  E0 80     CPX #$80
  $98B7  00        BRK
  $98B8  0E 9C 9C  ASL $9C9C
  $98BB  B8        CLV

L_98BC:
  $98BC  A0 00     LDY #$00
  $98BE  00        BRK
  $98BF  00        BRK
  $98C0  0F        .db $0F
  $98C1  1F        .db $1F
  $98C2  1F        .db $1F
  $98C3  7F        .db $7F
  $98C4  BF        .db $BF
  $98C5  BF        .db $BF
  $98C6  5D 3E 00  EOR $003E,X
  $98C9  00        BRK
  $98CA  00        BRK
  $98CB  24 41     BIT $41
  $98CD  7F        .db $7F
  $98CE  3E 00 FA  ROL $FA00,X
  $98D1  F4        .db $F4
  $98D2  E8        INX
  $98D3  D0 E0     BNE $98B5
  $98D5  C0 80     CPY #$80
  $98D7  00        BRK
  $98D8  3C        .db $3C
  $98D9  38        SEC
  $98DA  70 E0     BVS $98BC
  $98DC  80        .db $80
  $98DD  00        BRK
  $98DE  00        BRK
  $98DF  00        BRK
  $98E0  3F        .db $3F
  $98E1  7F        .db $7F
  $98E2  FF        .db $FF
  $98E3  FF        .db $FF
  $98E4  FB        .db $FB
  $98E5  FF        .db $FF
  $98E6  FF        .db $FF
  $98E7  FF        .db $FF
  $98E8  C0 83     CPY #$83
  $98EA  07        .db $07
  $98EB  07        .db $07
  $98EC  07        .db $07
  $98ED  03        .db $03
  $98EE  03        .db $03
  $98EF  03        .db $03
  $98F0  F1 62     SBC ($62),Y
  $98F2  A2 A4     LDX #$A4
  $98F4  B8        CLV
  $98F5  A0 40     LDY #$40
  $98F7  80        .db $80
  $98F8  0E 9C DC  ASL $DC9C
  $98FB  D8        CLD
  $98FC  C0 C0     CPY #$C0
  $98FE  80        .db $80
  $98FF  00        BRK
  $9900  0F        .db $0F
  $9901  07        .db $07
  $9902  07        .db $07
  $9903  07        .db $07
  $9904  0F        .db $0F
  $9905  0F        .db $0F
  $9906  1F        .db $1F
  $9907  2F        .db $2F
  $9908  00        BRK
  $9909  00        BRK
  $990A  00        BRK
  $990B  00        BRK
  $990C  00        BRK
  $990D  00        BRK
  $990E  09 10     ORA #$10
  $9910  FD FE FA  SBC $FAFE,X
  $9913  FC        .db $FC
  $9914  F4        .db $F4
  $9915  F8        SED
  $9916  E8        INX
  $9917  F0 06     BEQ $991F
  $9919  04        .db $04
  $991A  0C        .db $0C
  $991B  08        PHP
  $991C  18        CLC
  $991D  10 30     BPL $994F

L_991F:
  $991F  60        RTS
  $9920  2F        .db $2F
  $9921  17        .db $17
  $9922  0F        .db $0F
  $9923  00        BRK
  $9924  00        BRK
  $9925  00        BRK
  $9926  00        BRK

L_9927:
  $9927  00        BRK
  $9928  1F        .db $1F
  $9929  0F        .db $0F
  $992A  00        BRK
  $992B  00        BRK
  $992C  00        BRK
  $992D  00        BRK
  $992E  00        BRK
  $992F  00        BRK
  $9930  A0 40     LDY #$40
  $9932  80        .db $80
  $9933  00        BRK
  $9934  00        BRK
  $9935  00        BRK
  $9936  00        BRK
  $9937  00        BRK
  $9938  C0 80     CPY #$80
  $993A  00        BRK
  $993B  00        BRK
  $993C  00        BRK
  $993D  00        BRK
  $993E  00        BRK
  $993F  00        BRK
  $9940  1F        .db $1F
  $9941  20 58 5C  JSR $5C58
  $9944  BC BC BC  LDY $BCBC,X
  $9947  98        TYA
  $9948  00        BRK
  $9949  1F        .db $1F
  $994A  27        .db $27
  $994B  23        .db $23
  $994C  43        .db $43
  $994D  43        .db $43
  $994E  43        .db $43

L_994F:
  $994F  67        .db $67
  $9950  00        BRK
  $9951  E0 1C     CPX #$1C
  $9953  E2        .db $E2
  $9954  79 0C 00  ADC $000C,Y
  $9957  00        BRK
  $9958  00        BRK
  $9959  00        BRK
  $995A  E0 FC     CPX #$FC
  $995C  FE FF FF  INC $FFFF,X
  $995F  FF        .db $FF
  $9960  00        BRK
  $9961  00        BRK
  $9962  00        BRK
  $9963  00        BRK
  $9964  00        BRK
  $9965  80        .db $80
  $9966  40        RTI
  $9967  40        RTI
  $9968  00        BRK
  $9969  00        BRK
  $996A  00        BRK
  $996B  00        BRK
  $996C  00        BRK
  $996D  00        BRK
  $996E  80        .db $80
  $996F  80        .db $80
  $9970  40        RTI
  $9971  20 1F 00  JSR $001F
  $9974  00        BRK
  $9975  00        BRK
  $9976  00        BRK
  $9977  00        BRK
  $9978  3F        .db $3F
  $9979  1F        .db $1F
  $997A  00        BRK
  $997B  00        BRK
  $997C  00        BRK
  $997D  00        BRK
  $997E  00        BRK
  $997F  00        BRK
  $9980  00        BRK
  $9981  00        BRK
  $9982  FF        .db $FF
  $9983  01 00     ORA ($00,X)

L_9985:
  $9985  00        BRK
  $9986  00        BRK
  $9987  00        BRK
  $9988  FF        .db $FF
  $9989  FF        .db $FF
  $998A  00        BRK
  $998B  00        BRK
  $998C  00        BRK
  $998D  00        BRK
  $998E  00        BRK
  $998F  00        BRK
  $9990  40        RTI
  $9991  A0 50     LDY #$50
  $9993  10 F0     BPL $9985
  $9995  B0 90     BCS $9927
  $9997  E0 80     CPX #$80
  $9999  40        RTI
  $999A  E0 E0     CPX #$E0
  $999C  00        BRK
  $999D  60        RTS
  $999E  60        RTS
  $999F  00        BRK
  $99A0  B0 20     BCS $99C2
  $99A2  00        BRK
  $99A3  00        BRK
  $99A4  00        BRK
  $99A5  00        BRK
  $99A6  00        BRK
  $99A7  00        BRK
  $99A8  60        RTS
  $99A9  40        RTI
  $99AA  00        BRK
  $99AB  00        BRK
  $99AC  00        BRK
  $99AD  00        BRK
  $99AE  00        BRK
  $99AF  00        BRK
  $99B0  00        BRK
  $99B1  00        BRK
  $99B2  00        BRK
  $99B3  00        BRK
  $99B4  0F        .db $0F
  $99B5  10 2E     BPL $99E5
  $99B7  5E 00 00  LSR $0000,X
  $99BA  00        BRK
  $99BB  00        BRK
  $99BC  00        BRK
  $99BD  0F        .db $0F
  $99BE  11 21     ORA ($21),Y
  $99C0  00        BRK
  $99C1  00        BRK

L_99C2:
  $99C2  00        BRK
  $99C3  00        BRK
  $99C4  00        BRK
  $99C5  80        .db $80
  $99C6  40        RTI
  $99C7  40        RTI
  $99C8  00        BRK
  $99C9  00        BRK
  $99CA  00        BRK
  $99CB  00        BRK
  $99CC  00        BRK
  $99CD  00        BRK
  $99CE  80        .db $80
  $99CF  80        .db $80
  $99D0  BE BC B8  LDX $B8BC,Y
  $99D3  40        RTI
  $99D4  20 10 08  JSR $0810
  $99D7  04        .db $04
  $99D8  41 43     EOR ($43,X)
  $99DA  47        .db $47
  $99DB  3F        .db $3F
  $99DC  1F        .db $1F
  $99DD  0F        .db $0F

L_99DE:
  $99DE  07        .db $07
  $99DF  03        .db $03
  $99E0  20 A0 D0  JSR $D0A0
  $99E3  70 68     BVS $9A4D

L_99E5:
  $99E5  38        SEC
  $99E6  14        .db $14
  $99E7  04        .db $04
  $99E8  C0 C0     CPY #$C0
  $99EA  E0 E0     CPX #$E0
  $99EC  F0 F0     BEQ $99DE
  $99EE  F8        SED
  $99EF  F8        SED
  $99F0  02        .db $02
  $99F1  01 00     ORA ($00,X)
  $99F3  00        BRK
  $99F4  00        BRK
  $99F5  00        BRK
  $99F6  00        BRK

L_99F7:
  $99F7  00        BRK
  $99F8  01 00     ORA ($00,X)
  $99FA  00        BRK
  $99FB  00        BRK
  $99FC  00        BRK
  $99FD  00        BRK
  $99FE  00        BRK
  $99FF  00        BRK
  $9A00  00        BRK
  $9A01  00        BRK
  $9A02  02        .db $02
  $9A03  02        .db $02
  $9A04  01 01     ORA ($01,X)
  $9A06  00        BRK
  $9A07  00        BRK
  $9A08  00        BRK
  $9A09  00        BRK
  $9A0A  00        BRK
  $9A0B  01 00     ORA ($00,X)
  $9A0D  00        BRK
  $9A0E  00        BRK
  $9A0F  00        BRK
  $9A10  06 02     ASL $02
  $9A12  12        .db $12
  $9A13  FA        .db $FA
  $9A14  F9 F9 F9  SBC $F9F9,Y
  $9A17  F9 00 0C  SBC $0C00,Y
  $9A1A  1C        .db $1C
  $9A1B  FC        .db $FC
  $9A1C  FE FE 7E  INC $7EFE,X
  $9A1F  7E 00 00  ROR $0000,X
  $9A22  00        BRK
  $9A23  00        BRK
  $9A24  01 07     ORA ($07,X)
  $9A26  0B        .db $0B
  $9A27  F7        .db $F7
  $9A28  00        BRK
  $9A29  00        BRK
  $9A2A  00        BRK
  $9A2B  00        BRK
  $9A2C  00        BRK
  $9A2D  01 07     ORA ($07,X)
  $9A2F  0F        .db $0F
  $9A30  F1 E1     SBC ($E1),Y
  $9A32  F2        .db $F2
  $9A33  B2        .db $B2
  $9A34  FA        .db $FA
  $9A35  E6 E4     INC $E4
  $9A37  C8        INY
  $9A38  7E 1E 0C  ROR $0C1E,X
  $9A3B  4C E4 F8  JMP $F8E4
  $9A3E  F8        SED
  $9A3F  F0 03     BEQ $9A44
  $9A41  05 0B     ORA $0B
  $9A43  17        .db $17

L_9A44:
  $9A44  14        .db $14
  $9A45  20 20 3F  JSR $3F20
  $9A48  00        BRK
  $9A49  03        .db $03
  $9A4A  07        .db $07
  $9A4B  0F        .db $0F
  $9A4C  0F        .db $0F

L_9A4D:
  $9A4D  1F        .db $1F
  $9A4E  1F        .db $1F
  $9A4F  00        BRK
  $9A50  0F        .db $0F
  $9A51  C6 E3     DEC $E3
  $9A53  01 00     ORA ($00,X)
  $9A55  00        BRK
  $9A56  00        BRK
  $9A57  FF        .db $FF
  $9A58  F7        .db $F7
  $9A59  FB        .db $FB
  $9A5A  FC        .db $FC
  $9A5B  FE FF FF  INC $FFFF,X
  $9A5E  FF        .db $FF
  $9A5F  00        BRK
  $9A60  90 30     BCC $9A92
  $9A62  20 E0 90  JSR $90E0
  $9A65  B0 90     BCS $99F7
  $9A67  E0 E0     CPX #$E0
  $9A69  C0 C0     CPY #$C0
  $9A6B  00        BRK
  $9A6C  60        RTS
  $9A6D  60        RTS
  $9A6E  60        RTS
  $9A6F  00        BRK
  $9A70  00        BRK
  $9A71  00        BRK

L_9A72:
  $9A72  00        BRK
  $9A73  00        BRK
  $9A74  00        BRK
  $9A75  00        BRK
  $9A76  10 30     BPL $9AA8
  $9A78  00        BRK
  $9A79  00        BRK
  $9A7A  00        BRK
  $9A7B  00        BRK
  $9A7C  00        BRK
  $9A7D  00        BRK
  $9A7E  00        BRK
  $9A7F  00        BRK
  $9A80  00        BRK
  $9A81  00        BRK
  $9A82  01 03     ORA ($03,X)
  $9A84  03        .db $03
  $9A85  03        .db $03
  $9A86  01 01     ORA ($01,X)
  $9A88  00        BRK
  $9A89  00        BRK
  $9A8A  00        BRK
  $9A8B  03        .db $03
  $9A8C  01 01     ORA ($01,X)
  $9A8E  00        BRK
  $9A8F  00        BRK
  $9A90  68        PLA
  $9A91  C8        INY

L_9A92:
  $9A92  E4 F4     CPX $F4
  $9A94  F4        .db $F4
  $9A95  FA        .db $FA
  $9A96  FA        .db $FA
  $9A97  6A        ROR
  $9A98  10 30     BPL $9ACA
  $9A9A  78        SEI
  $9A9B  F8        SED
  $9A9C  F8        SED

L_9A9D:
  $9A9D  FC        .db $FC
  $9A9E  FC        .db $FC
  $9A9F  9C        .db $9C
  $9AA0  00        BRK
  $9AA1  00        BRK
  $9AA2  00        BRK
  $9AA3  01 03     ORA ($03,X)
  $9AA5  07        .db $07
  $9AA6  7F        .db $7F
  $9AA7  87        .db $87

L_9AA8:
  $9AA8  00        BRK
  $9AA9  00        BRK
  $9AAA  00        BRK
  $9AAB  00        BRK
  $9AAC  01 03     ORA ($03,X)
  $9AAE  07        .db $07
  $9AAF  7B        .db $7B

L_9AB0:
  $9AB0  F9 FD ED  SBC $EDFD,Y
  $9AB3  F6 F2     INC $F2,X
  $9AB5  E4 E8     CPX $E8
  $9AB7  E8        INX
  $9AB8  06 02     ASL $02
  $9ABA  72        .db $72
  $9ABB  F8        SED
  $9ABC  FC        .db $FC
  $9ABD  F8        SED
  $9ABE  F0 F0     BEQ $9AB0
  $9AC0  01 02     ORA ($02,X)
  $9AC2  05 0B     ORA $0B
  $9AC4  0A        ASL
  $9AC5  10 10     BPL $9AD7
  $9AC7  1F        .db $1F
  $9AC8  00        BRK
  $9AC9  01 03     ORA ($03,X)
  $9ACB  07        .db $07
  $9ACC  07        .db $07
  $9ACD  0F        .db $0F
  $9ACE  0F        .db $0F
  $9ACF  00        BRK
  $9AD0  E3        .db $E3
  $9AD1  F1 80     SBC ($80),Y
  $9AD3  00        BRK
  $9AD4  00        BRK
  $9AD5  00        BRK
  $9AD6  FF        .db $FF

L_9AD7:
  $9AD7  00        BRK
  $9AD8  FD FE FF  SBC $FFFE,X
  $9ADB  FF        .db $FF
  $9ADC  FF        .db $FF
  $9ADD  FF        .db $FF
  $9ADE  00        BRK
  $9ADF  00        BRK
  $9AE0  D0 90     BNE $9A72
  $9AE2  F0 48     BEQ $9B2C
  $9AE4  58        CLI
  $9AE5  48        PHA
  $9AE6  F0 00     BEQ $9AE8

L_9AE8:
  $9AE8  E0 60     CPX #$60
  $9AEA  00        BRK
  $9AEB  B0 B0     BCS $9A9D
  $9AED  B0 00     BCS $9AEF

L_9AEF:
  $9AEF  00        BRK
  $9AF0  00        BRK
  $9AF1  00        BRK
  $9AF2  00        BRK
  $9AF3  06 05     ASL $05
  $9AF5  06 07     ASL $07
  $9AF7  0F        .db $0F
  $9AF8  00        BRK
  $9AF9  00        BRK
  $9AFA  00        BRK
  $9AFB  00        BRK
  $9AFC  02        .db $02
  $9AFD  03        .db $03
  $9AFE  03        .db $03
  $9AFF  07        .db $07
  $9B00  00        BRK
  $9B01  00        BRK
  $9B02  00        BRK
  $9B03  00        BRK
  $9B04  80        .db $80
  $9B05  40        RTI
  $9B06  20 A0 00  JSR $00A0
  $9B09  00        BRK
  $9B0A  00        BRK
  $9B0B  00        BRK
  $9B0C  00        BRK
  $9B0D  80        .db $80
  $9B0E  C0 C0     CPY #$C0
  $9B10  1F        .db $1F
  $9B11  3F        .db $3F
  $9B12  7F        .db $7F
  $9B13  0F        .db $0F
  $9B14  03        .db $03
  $9B15  01 01     ORA ($01,X)
  $9B17  02        .db $02
  $9B18  07        .db $07
  $9B19  0F        .db $0F
  $9B1A  0F        .db $0F
  $9B1B  02        .db $02
  $9B1C  00        BRK
  $9B1D  00        BRK
  $9B1E  00        BRK
  $9B1F  01 D0     ORA ($D0,X)
  $9B21  D0 08     BNE $9B2B
  $9B23  C8        INY
  $9B24  38        SEC
  $9B25  F8        SED
  $9B26  E8        INX
  $9B27  E8        INX
  $9B28  E0 E0     CPX #$E0
  $9B2A  F0 30     BEQ $9B5C

L_9B2C:
  $9B2C  C0 E0     CPY #$E0
  $9B2E  F0 F0     BEQ $9B20
  $9B30  02        .db $02
  $9B31  03        .db $03
  $9B32  0C        .db $0C
  $9B33  10 27     BPL $9B5C
  $9B35  2C 5C 58  BIT $585C
  $9B38  01 00     ORA ($00,X)
  $9B3A  03        .db $03
  $9B3B  0F        .db $0F
  $9B3C  1F        .db $1F
  $9B3D  1F        .db $1F
  $9B3E  3F        .db $3F
  $9B3F  3F        .db $3F

L_9B40:
  $9B40  EC CA 76  CPX $76CA
  $9B43  2A        ROL
  $9B44  1C        .db $1C
  $9B45  04        .db $04
  $9B46  08        PHP
  $9B47  08        PHP
  $9B48  F0 34     BEQ $9B7E
  $9B4A  88        DEY
  $9B4B  DC        .db $DC
  $9B4C  E0 F8     CPX #$F8
  $9B4E  F0 F0     BEQ $9B40
  $9B50  58        CLI
  $9B51  50 40     BVC $9B93
  $9B53  20 21 1E  JSR $1E21
  $9B56  00        BRK
  $9B57  00        BRK
  $9B58  3F        .db $3F
  $9B59  3F        .db $3F
  $9B5A  3F        .db $3F
  $9B5B  1F        .db $1F

L_9B5C:
  $9B5C  1E 00 00  ASL $0000,X
  $9B5F  00        BRK
  $9B60  10 10     BPL $9B72
  $9B62  20 40 80  JSR $8040
  $9B65  00        BRK
  $9B66  00        BRK
  $9B67  00        BRK
  $9B68  E0 E0     CPX #$E0
  $9B6A  C0 80     CPY #$80
  $9B6C  00        BRK
  $9B6D  00        BRK
  $9B6E  00        BRK
  $9B6F  00        BRK
  $9B70  04        .db $04
  $9B71  04        .db $04

L_9B72:
  $9B72  CC 7A 2A  CPY $2A7A
  $9B75  32        .db $32
  $9B76  3C        .db $3C
  $9B77  54        .db $54
  $9B78  F8        SED
  $9B79  F8        SED
  $9B7A  30 04     BMI $9B80
  $9B7C  1C        .db $1C
  $9B7D  0C        .db $0C

L_9B7E:
  $9B7E  00        BRK
  $9B7F  38        SEC

L_9B80:
  $9B80  E8        INX
  $9B81  D0 60     BNE $9BE3
  $9B83  00        BRK
  $9B84  00        BRK
  $9B85  00        BRK
  $9B86  00        BRK
  $9B87  00        BRK
  $9B88  10 60     BPL $9BEA
  $9B8A  00        BRK
  $9B8B  00        BRK
  $9B8C  00        BRK
  $9B8D  00        BRK
  $9B8E  00        BRK
  $9B8F  00        BRK
  $9B90  00        BRK
  $9B91  00        BRK
  $9B92  00        BRK

L_9B93:
  $9B93  00        BRK
  $9B94  00        BRK
  $9B95  00        BRK
  $9B96  00        BRK
  $9B97  00        BRK
  $9B98  00        BRK
  $9B99  30 78     BMI $9C13
  $9B9B  F8        SED
  $9B9C  78        SEI
  $9B9D  70 60     BVS $9BFF
  $9B9F  00        BRK
  $9BA0  00        BRK
  $9BA1  00        BRK
  $9BA2  01 02     ORA ($02,X)
  $9BA4  02        .db $02
  $9BA5  04        .db $04
  $9BA6  04        .db $04
  $9BA7  07        .db $07
  $9BA8  00        BRK
  $9BA9  00        BRK
  $9BAA  00        BRK
  $9BAB  01 01     ORA ($01,X)
  $9BAD  03        .db $03
  $9BAE  03        .db $03
  $9BAF  00        BRK
  $9BB0  00        BRK
  $9BB1  01 05     ORA ($05,X)
  $9BB3  0F        .db $0F
  $9BB4  27        .db $27
  $9BB5  1F        .db $1F
  $9BB6  1F        .db $1F
  $9BB7  7F        .db $7F
  $9BB8  07        .db $07
  $9BB9  1F        .db $1F
  $9BBA  3F        .db $3F
  $9BBB  7F        .db $7F
  $9BBC  7F        .db $7F
  $9BBD  FF        .db $FF
  $9BBE  FF        .db $FF
  $9BBF  FF        .db $FF
  $9BC0  00        BRK
  $9BC1  00        BRK
  $9BC2  00        BRK
  $9BC3  00        BRK
  $9BC4  02        .db $02
  $9BC5  03        .db $03
  $9BC6  0F        .db $0F
  $9BC7  07        .db $07
  $9BC8  00        BRK
  $9BC9  00        BRK
  $9BCA  03        .db $03
  $9BCB  1F        .db $1F
  $9BCC  1F        .db $1F
  $9BCD  1F        .db $1F
  $9BCE  3F        .db $3F
  $9BCF  3F        .db $3F
  $9BD0  08        PHP
  $9BD1  00        BRK
  $9BD2  00        BRK
  $9BD3  41 00     EOR ($00,X)
  $9BD5  00        BRK
  $9BD6  00        BRK
  $9BD7  08        PHP
  $9BD8  08        PHP
  $9BD9  00        BRK
  $9BDA  00        BRK
  $9BDB  41 00     EOR ($00,X)
  $9BDD  00        BRK
  $9BDE  00        BRK
  $9BDF  08        PHP
  $9BE0  00        BRK
  $9BE1  00        BRK
  $9BE2  00        BRK

L_9BE3:
  $9BE3  00        BRK
  $9BE4  00        BRK
  $9BE5  00        BRK
  $9BE6  00        BRK
  $9BE7  00        BRK
  $9BE8  00        BRK
  $9BE9  00        BRK

L_9BEA:
  $9BEA  00        BRK
  $9BEB  00        BRK
  $9BEC  00        BRK
  $9BED  00        BRK
  $9BEE  00        BRK
  $9BEF  00        BRK
  $9BF0  00        BRK
  $9BF1  00        BRK
  $9BF2  00        BRK
  $9BF3  00        BRK
  $9BF4  00        BRK
  $9BF5  00        BRK
  $9BF6  00        BRK
  $9BF7  00        BRK
  $9BF8  00        BRK
  $9BF9  00        BRK
  $9BFA  00        BRK
  $9BFB  00        BRK
  $9BFC  00        BRK
  $9BFD  00        BRK
  $9BFE  00        BRK

L_9BFF:
  $9BFF  00        BRK
  $9C00  00        BRK
  $9C01  00        BRK
  $9C02  00        BRK
  $9C03  00        BRK
  $9C04  01 18     ORA ($18,X)
  $9C06  39 30 00  AND $0030,Y
  $9C09  00        BRK
  $9C0A  00        BRK
  $9C0B  1F        .db $1F
  $9C0C  20 58 B6  JSR $B658
  $9C0F  AF        .db $AF
  $9C10  06 3F     ASL $3F
  $9C12  F3        .db $F3

L_9C13:
  $9C13  C8        INY
  $9C14  7F        .db $7F
  $9C15  80        .db $80
  $9C16  00        BRK
  $9C17  80        .db $80
  $9C18  00        BRK
  $9C19  06 3F     ASL $3F
  $9C1B  77        .db $77
  $9C1C  80        .db $80
  $9C1D  40        RTI
  $9C1E  20 20 E0  JSR $E020
  $9C21  78        SEI

L_9C22:
  $9C22  BE BF 96  LDX $96BF,Y
  $9C25  63        .db $63
  $9C26  1A        .db $1A
  $9C27  05 00     ORA $00
  $9C29  E0 70     CPX #$70
  $9C2B  76 6F     ROR $6F,X
  $9C2D  1E 05 03  ASL $0305,X
  $9C30  00        BRK
  $9C31  00        BRK
  $9C32  00        BRK
  $9C33  00        BRK
  $9C34  80        .db $80
  $9C35  40        RTI
  $9C36  E0 E0     CPX #$E0
  $9C38  00        BRK
  $9C39  00        BRK
  $9C3A  00        BRK
  $9C3B  00        BRK
  $9C3C  00        BRK
  $9C3D  80        .db $80
  $9C3E  C0 C0     CPY #$C0
  $9C40  0C        .db $0C
  $9C41  0C        .db $0C
  $9C42  11 0E     ORA ($0E),Y
  $9C44  00        BRK
  $9C45  00        BRK
  $9C46  00        BRK
  $9C47  00        BRK
  $9C48  9F        .db $9F
  $9C49  9F        .db $9F
  $9C4A  8E 40 20  STX $2040
  $9C4D  1F        .db $1F
  $9C4E  00        BRK
  $9C4F  00        BRK
  $9C50  80        .db $80
  $9C51  80        .db $80
  $9C52  00        BRK
  $9C53  00        BRK
  $9C54  00        BRK
  $9C55  00        BRK
  $9C56  00        BRK
  $9C57  00        BRK
  $9C58  20 20 20  JSR $2020
  $9C5B  40        RTI

L_9C5C:
  $9C5C  80        .db $80
  $9C5D  00        BRK
  $9C5E  00        BRK
  $9C5F  00        BRK
  $9C60  05 03     ORA $03
  $9C62  02        .db $02
  $9C63  02        .db $02
  $9C64  01 01     ORA ($01,X)

L_9C66:
  $9C66  01 01     ORA ($01,X)
  $9C68  03        .db $03
  $9C69  00        BRK
  $9C6A  01 01     ORA ($01,X)

L_9C6C:
  $9C6C  00        BRK
  $9C6D  00        BRK
  $9C6E  00        BRK
  $9C6F  00        BRK
  $9C70  D0 B0     BNE $9C22
  $9C72  78        SEI
  $9C73  F8        SED
  $9C74  F8        SED
  $9C75  E4 0C     CPX $0C
  $9C77  7C        .db $7C
  $9C78  A0 60     LDY #$60
  $9C7A  F0 F0     BEQ $9C6C
  $9C7C  E0 18     CPX #$18
  $9C7E  F8        SED
  $9C7F  F8        SED
  $9C80  00        BRK
  $9C81  00        BRK
  $9C82  00        BRK
  $9C83  00        BRK
  $9C84  01 18     ORA ($18,X)
  $9C86  3F        .db $3F
  $9C87  3F        .db $3F
  $9C88  00        BRK
  $9C89  00        BRK
  $9C8A  00        BRK
  $9C8B  1F        .db $1F
  $9C8C  20 58 B6  JSR $B658
  $9C8F  AF        .db $AF
  $9C90  1F        .db $1F
  $9C91  1F        .db $1F
  $9C92  1F        .db $1F
  $9C93  0E 00 00  ASL $0000
  $9C96  00        BRK
  $9C97  00        BRK
  $9C98  9F        .db $9F
  $9C99  9F        .db $9F
  $9C9A  8E 40 20  STX $2040
  $9C9D  1F        .db $1F
  $9C9E  00        BRK
  $9C9F  00        BRK
  $9CA0  3C        .db $3C
  $9CA1  42        .db $42
  $9CA2  B1 B1     LDA ($B1),Y
  $9CA4  81 81     STA ($81,X)
  $9CA6  42        .db $42
  $9CA7  3C        .db $3C
  $9CA8  00        BRK
  $9CA9  3C        .db $3C
  $9CAA  7E 7E 7E  ROR $7E7E,X
  $9CAD  7E 3C 00  ROR $003C,X
  $9CB0  00        BRK
  $9CB1  03        .db $03
  $9CB2  0F        .db $0F
  $9CB3  1C        .db $1C
  $9CB4  39 E3 47  AND $47E3,Y
  $9CB7  CF        .db $CF
  $9CB8  00        BRK
  $9CB9  00        BRK
  $9CBA  03        .db $03
  $9CBB  0F        .db $0F
  $9CBC  1E 3C F8  ASL $F83C,X
  $9CBF  73        .db $73
  $9CC0  FE FF 3F  INC $3FFF,X
  $9CC3  FF        .db $FF
  $9CC4  FF        .db $FF
  $9CC5  FF        .db $FF
  $9CC6  FF        .db $FF
  $9CC7  83        .db $83
  $9CC8  00        BRK
  $9CC9  FC        .db $FC
  $9CCA  C0 00     CPY #$00
  $9CCC  00        BRK
  $9CCD  00        BRK
  $9CCE  7E FC 00  ROR $00FC,X
  $9CD1  C0 C0     CPY #$C0
  $9CD3  80        .db $80
  $9CD4  00        BRK
  $9CD5  00        BRK
  $9CD6  80        .db $80
  $9CD7  F0 00     BEQ $9CD9

L_9CD9:
  $9CD9  00        BRK
  $9CDA  00        BRK
  $9CDB  00        BRK
  $9CDC  00        BRK
  $9CDD  00        BRK
  $9CDE  00        BRK
  $9CDF  00        BRK
  $9CE0  9C        .db $9C
  $9CE1  90 83     BCC $9C66
  $9CE3  8F        .db $8F
  $9CE4  C0 70     CPY #$70
  $9CE6  FF        .db $FF
  $9CE7  FF        .db $FF
  $9CE8  FF        .db $FF
  $9CE9  FF        .db $FF
  $9CEA  FC        .db $FC
  $9CEB  7F        .db $7F
  $9CEC  3F        .db $3F
  $9CED  8F        .db $8F
  $9CEE  00        BRK
  $9CEF  00        BRK
  $9CF0  3F        .db $3F
  $9CF1  FF        .db $FF
  $9CF2  FF        .db $FF
  $9CF3  FF        .db $FF
  $9CF4  0F        .db $0F
  $9CF5  7F        .db $7F
  $9CF6  FF        .db $FF
  $9CF7  FF        .db $FF
  $9CF8  C0 00     CPY #$00
  $9CFA  00        BRK
  $9CFB  FE F0 80  INC $80F0,X
  $9CFE  00        BRK
  $9CFF  00        BRK

L_9D00:
  $9D00  F0 E0     BEQ $9CE2
  $9D02  C0 C0     CPY #$C0
  $9D04  C0 E0     CPY #$E0
  $9D06  F0 F8     BEQ $9D00
  $9D08  00        BRK
  $9D09  00        BRK
  $9D0A  00        BRK
  $9D0B  00        BRK
  $9D0C  00        BRK
  $9D0D  00        BRK
  $9D0E  00        BRK
  $9D0F  00        BRK
  $9D10  00        BRK
  $9D11  00        BRK
  $9D12  00        BRK
  $9D13  03        .db $03
  $9D14  0F        .db $0F
  $9D15  7C        .db $7C
  $9D16  73        .db $73
  $9D17  61 00     ADC ($00,X)
  $9D19  00        BRK
  $9D1A  00        BRK
  $9D1B  00        BRK
  $9D1C  03        .db $03
  $9D1D  0F        .db $0F
  $9D1E  1C        .db $1C
  $9D1F  3E 00 07  ROL $0700,X
  $9D22  7F        .db $7F
  $9D23  FF        .db $FF
  $9D24  9F        .db $9F
  $9D25  FF        .db $FF

L_9D26:
  $9D26  FF        .db $FF
  $9D27  FF        .db $FF
  $9D28  00        BRK
  $9D29  00        BRK
  $9D2A  07        .db $07
  $9D2B  78        SEI
  $9D2C  E0 00     CPX #$00
  $9D2E  00        BRK
  $9D2F  00        BRK
  $9D30  00        BRK
  $9D31  F8        SED
  $9D32  FC        .db $FC
  $9D33  F8        SED
  $9D34  F0 F0     BEQ $9D26
  $9D36  F8        SED
  $9D37  FC        .db $FC
  $9D38  00        BRK
  $9D39  00        BRK
  $9D3A  F0 00     BEQ $9D3C

L_9D3C:
  $9D3C  00        BRK
  $9D3D  00        BRK
  $9D3E  00        BRK
  $9D3F  00        BRK
  $9D40  61 40     ADC ($40,X)
  $9D42  40        RTI
  $9D43  03        .db $03
  $9D44  41 61     EOR ($61,X)
  $9D46  78        SEI
  $9D47  7F        .db $7F
  $9D48  7F        .db $7F
  $9D49  7F        .db $7F
  $9D4A  7F        .db $7F
  $9D4B  7C        .db $7C
  $9D4C  3E 1F 07  ROL $071F,X
  $9D4F  00        BRK
  $9D50  FF        .db $FF
  $9D51  00        BRK
  $9D52  1F        .db $1F
  $9D53  FF        .db $FF
  $9D54  FF        .db $FF
  $9D55  FF        .db $FF
  $9D56  3F        .db $3F
  $9D57  FF        .db $FF
  $9D58  FF        .db $FF
  $9D59  FF        .db $FF
  $9D5A  E0 00     CPX #$00
  $9D5C  00        BRK
  $9D5D  C0 FF     CPY #$FF
  $9D5F  00        BRK
  $9D60  FF        .db $FF
  $9D61  1F        .db $1F
  $9D62  FE FC FC  INC $FCFC,X
  $9D65  FE FF F8  INC $F8FF,X
  $9D68  FC        .db $FC
  $9D69  E0 00     CPX #$00
  $9D6B  00        BRK
  $9D6C  00        BRK
  $9D6D  00        BRK
  $9D6E  F0 00     BEQ $9D70

L_9D70:
  $9D70  00        BRK
  $9D71  00        BRK
  $9D72  00        BRK
  $9D73  15 15     ORA $15,X
  $9D75  00        BRK
  $9D76  00        BRK
  $9D77  00        BRK
  $9D78  00        BRK
  $9D79  00        BRK
  $9D7A  15 15     ORA $15,X
  $9D7C  15 15     ORA $15,X
  $9D7E  00        BRK
  $9D7F  00        BRK
  $9D80  00        BRK
  $9D81  00        BRK
  $9D82  00        BRK
  $9D83  00        BRK
  $9D84  00        BRK
  $9D85  00        BRK
  $9D86  00        BRK
  $9D87  00        BRK
  $9D88  00        BRK
  $9D89  00        BRK
  $9D8A  15 15     ORA $15,X
  $9D8C  15 15     ORA $15,X
  $9D8E  00        BRK
  $9D8F  00        BRK
  $9D90  04        .db $04
  $9D91  1C        .db $1C
  $9D92  1E 3E 3C  ASL $3C3E,X
  $9D95  38        SEC
  $9D96  18        CLC
  $9D97  10 04     BPL $9D9D
  $9D99  1C        .db $1C
  $9D9A  1E 3E 3C  ASL $3C3E,X

L_9D9D:
  $9D9D  38        SEC
  $9D9E  18        CLC
  $9D9F  10 08     BPL $9DA9
  $9DA1  0C        .db $0C
  $9DA2  1C        .db $1C
  $9DA3  1C        .db $1C
  $9DA4  1C        .db $1C
  $9DA5  18        CLC
  $9DA6  08        PHP
  $9DA7  08        PHP
  $9DA8  08        PHP

L_9DA9:
  $9DA9  0C        .db $0C
  $9DAA  1C        .db $1C
  $9DAB  1C        .db $1C
  $9DAC  1C        .db $1C
  $9DAD  18        CLC
  $9DAE  08        PHP
  $9DAF  08        PHP
  $9DB0  08        PHP
  $9DB1  08        PHP
  $9DB2  08        PHP
  $9DB3  08        PHP
  $9DB4  08        PHP
  $9DB5  08        PHP
  $9DB6  08        PHP
  $9DB7  08        PHP
  $9DB8  08        PHP
  $9DB9  08        PHP
  $9DBA  08        PHP
  $9DBB  08        PHP
  $9DBC  08        PHP
  $9DBD  08        PHP
  $9DBE  08        PHP
  $9DBF  08        PHP
  $9DC0  08        PHP
  $9DC1  1C        .db $1C
  $9DC2  3E 3E 3E  ROL $3E3E,X
  $9DC5  1C        .db $1C
  $9DC6  08        PHP
  $9DC7  00        BRK
  $9DC8  08        PHP
  $9DC9  1C        .db $1C
  $9DCA  3E 3E 3E  ROL $3E3E,X
  $9DCD  1C        .db $1C
  $9DCE  08        PHP
  $9DCF  00        BRK
  $9DD0  00        BRK
  $9DD1  08        PHP
  $9DD2  1C        .db $1C
  $9DD3  3E 1C 08  ROL $081C,X
  $9DD6  00        BRK
  $9DD7  00        BRK
  $9DD8  00        BRK
  $9DD9  08        PHP
  $9DDA  1C        .db $1C
  $9DDB  3E 1C 08  ROL $081C,X
  $9DDE  00        BRK
  $9DDF  00        BRK
  $9DE0  00        BRK
  $9DE1  00        BRK
  $9DE2  08        PHP
  $9DE3  1C        .db $1C
  $9DE4  08        PHP
  $9DE5  00        BRK
  $9DE6  00        BRK
  $9DE7  00        BRK
  $9DE8  00        BRK
  $9DE9  00        BRK
  $9DEA  08        PHP
  $9DEB  1C        .db $1C
  $9DEC  08        PHP
  $9DED  00        BRK
  $9DEE  00        BRK
  $9DEF  00        BRK
  $9DF0  08        PHP
  $9DF1  08        PHP
  $9DF2  1C        .db $1C
  $9DF3  7F        .db $7F
  $9DF4  1C        .db $1C
  $9DF5  08        PHP
  $9DF6  08        PHP
  $9DF7  08        PHP
  $9DF8  08        PHP
  $9DF9  08        PHP
  $9DFA  1C        .db $1C
  $9DFB  7F        .db $7F
  $9DFC  1C        .db $1C
  $9DFD  08        PHP
  $9DFE  08        PHP
  $9DFF  08        PHP
  $9E00  34        .db $34
  $9E01  3C        .db $3C
  $9E02  6A        ROR
  $9E03  7A        .db $7A
  $9E04  5A        .db $5A
  $9E05  5A        .db $5A
  $9E06  24 34     BIT $34
  $9E08  18        CLC
  $9E09  18        CLC
  $9E0A  34        .db $34
  $9E0B  24 24     BIT $24
  $9E0D  24 18     BIT $18
  $9E0F  18        CLC
  $9E10  07        .db $07
  $9E11  0F        .db $0F
  $9E12  1A        .db $1A
  $9E13  15 3E     ORA $3E,X
  $9E15  2A        ROL
  $9E16  7F        .db $7F
  $9E17  87        .db $87
  $9E18  01 05     ORA ($05,X)
  $9E1A  0D 08 00  ORA $0008
  $9E1D  1C        .db $1C
  $9E1E  00        BRK
  $9E1F  7F        .db $7F
  $9E20  60        RTS
  $9E21  70 58     BVS $9E7B
  $9E23  A8        TAY
  $9E24  7C        .db $7C
  $9E25  54        .db $54
  $9E26  FE E1 80  INC $80E1,X
  $9E29  A0 B0     LDY #$B0
  $9E2B  10 00     BPL $9E2D

L_9E2D:
  $9E2D  38        SEC
  $9E2E  00        BRK
  $9E2F  FE 0C 1B  INC $1B0C,X
  $9E32  14        .db $14
  $9E33  14        .db $14
  $9E34  7F        .db $7F
  $9E35  C2        .db $C2
  $9E36  C2        .db $C2
  $9E37  C2        .db $C2
  $9E38  07        .db $07
  $9E39  0C        .db $0C
  $9E3A  08        PHP
  $9E3B  08        PHP
  $9E3C  00        BRK
  $9E3D  3F        .db $3F
  $9E3E  3F        .db $3F
  $9E3F  3F        .db $3F
  $9E40  B7        .db $B7
  $9E41  B7        .db $B7
  $9E42  87        .db $87

L_9E43:
  $9E43  FF        .db $FF
  $9E44  FF        .db $FF
  $9E45  FF        .db $FF
  $9E46  FF        .db $FF
  $9E47  FC        .db $FC
  $9E48  6F        .db $6F
  $9E49  4F        .db $4F
  $9E4A  7F        .db $7F
  $9E4B  00        BRK
  $9E4C  00        BRK
  $9E4D  FF        .db $FF
  $9E4E  F0 F3     BEQ $9E43
  $9E50  82        .db $82
  $9E51  FF        .db $FF
  $9E52  30 38     BMI $9E8C
  $9E54  18        CLC
  $9E55  18        CLC
  $9E56  08        PHP
  $9E57  08        PHP
  $9E58  7F        .db $7F
  $9E59  00        BRK
  $9E5A  3E 3E 1C  ROL $1C3E,X
  $9E5D  1C        .db $1C
  $9E5E  08        PHP
  $9E5F  08        PHP
  $9E60  FF        .db $FF
  $9E61  FF        .db $FF
  $9E62  30 38     BMI $9E9C
  $9E64  18        CLC
  $9E65  18        CLC
  $9E66  08        PHP
  $9E67  08        PHP
  $9E68  FF        .db $FF
  $9E69  00        BRK
  $9E6A  3E 3E 1C  ROL $1C3E,X
  $9E6D  1C        .db $1C
  $9E6E  08        PHP
  $9E6F  08        PHP
  $9E70  FF        .db $FF
  $9E71  FF        .db $FF
  $9E72  60        RTS
  $9E73  70 30     BVS $9EA5
  $9E75  30 10     BMI $9E87
  $9E77  10 FF     BPL $9E78
  $9E79  00        BRK
  $9E7A  7C        .db $7C

L_9E7B:
  $9E7B  7C        .db $7C
  $9E7C  38        SEC
  $9E7D  38        SEC
  $9E7E  10 10     BPL $9E90
  $9E80  41 FF     EOR ($FF,X)
  $9E82  60        RTS
  $9E83  70 30     BVS $9EB5
  $9E85  30 10     BMI $9E97

L_9E87:
  $9E87  10 FE     BPL $9E87
  $9E89  00        BRK
  $9E8A  7C        .db $7C
  $9E8B  7C        .db $7C

L_9E8C:
  $9E8C  38        SEC
  $9E8D  38        SEC
  $9E8E  10 10     BPL $9EA0

L_9E90:
  $9E90  0F        .db $0F
  $9E91  11 1F     ORA ($1F),Y
  $9E93  27        .db $27
  $9E94  40        RTI
  $9E95  FF        .db $FF
  $9E96  B7        .db $B7

L_9E97:
  $9E97  FF        .db $FF
  $9E98  00        BRK
  $9E99  0F        .db $0F
  $9E9A  00        BRK

L_9E9B:
  $9E9B  1F        .db $1F

L_9E9C:
  $9E9C  3F        .db $3F
  $9E9D  00        BRK
  $9E9E  5B        .db $5B
  $9E9F  00        BRK

L_9EA0:
  $9EA0  00        BRK
  $9EA1  00        BRK
  $9EA2  00        BRK
  $9EA3  00        BRK
  $9EA4  00        BRK

L_9EA5:
  $9EA5  3C        .db $3C
  $9EA6  5A        .db $5A
  $9EA7  5A        .db $5A
  $9EA8  00        BRK
  $9EA9  00        BRK
  $9EAA  00        BRK
  $9EAB  00        BRK
  $9EAC  00        BRK
  $9EAD  00        BRK
  $9EAE  3C        .db $3C
  $9EAF  3C        .db $3C
  $9EB0  1F        .db $1F
  $9EB1  2D 2D 4E  AND $4E2D
  $9EB4  5A        .db $5A

L_9EB5:
  $9EB5  DA        .db $DA
  $9EB6  B4 FC     LDY $FC,X
  $9EB8  00        BRK
  $9EB9  1E 1E 3C  ASL $3C1E,X
  $9EBC  3C        .db $3C
  $9EBD  3C        .db $3C
  $9EBE  78        SEI
  $9EBF  00        BRK
  $9EC0  FC        .db $FC
  $9EC1  B4 B4     LDY $B4,X
  $9EC3  BA        TSX
  $9EC4  5A        .db $5A
  $9EC5  5D 2D 2D  EOR $2D2D,X
  $9EC8  00        BRK
  $9EC9  78        SEI
  $9ECA  78        SEI
  $9ECB  7C        .db $7C
  $9ECC  3C        .db $3C
  $9ECD  3E 1E 1E  ROL $1E1E,X
  $9ED0  00        BRK
  $9ED1  00        BRK
  $9ED2  00        BRK
  $9ED3  01 02     ORA ($02,X)
  $9ED5  02        .db $02
  $9ED6  05 07     ORA $07

L_9ED8:
  $9ED8  00        BRK
  $9ED9  00        BRK
  $9EDA  00        BRK
  $9EDB  00        BRK
  $9EDC  01 01     ORA ($01,X)
  $9EDE  03        .db $03
  $9EDF  00        BRK
  $9EE0  2D 4D 99  AND $994D
  $9EE3  32        .db $32
  $9EE4  64        .db $64
  $9EE5  C8        INY
  $9EE6  90 F0     BCC $9ED8
  $9EE8  1E 3E 7E  ASL $7E3E,X
  $9EEB  FC        .db $FC
  $9EEC  F8        SED
  $9EED  F0 E0     BEQ $9ECF
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
  $9F01  00        BRK
  $9F02  00        BRK
  $9F03  00        BRK
  $9F04  00        BRK
  $9F05  00        BRK
  $9F06  00        BRK
  $9F07  00        BRK
  $9F08  7F        .db $7F
  $9F09  0B        .db $0B
  $9F0A  01 01     ORA ($01,X)
  $9F0C  00        BRK
  $9F0D  00        BRK
  $9F0E  00        BRK
  $9F0F  00        BRK
  $9F10  00        BRK
  $9F11  00        BRK
  $9F12  00        BRK
  $9F13  00        BRK
  $9F14  00        BRK
  $9F15  00        BRK
  $9F16  00        BRK
  $9F17  00        BRK
  $9F18  FC        .db $FC
  $9F19  B0 80     BCS $9E9B
  $9F1B  00        BRK
  $9F1C  00        BRK
  $9F1D  00        BRK
  $9F1E  00        BRK
  $9F1F  00        BRK
  $9F20  00        BRK
  $9F21  00        BRK
  $9F22  00        BRK
  $9F23  00        BRK
  $9F24  00        BRK
  $9F25  00        BRK
  $9F26  00        BRK
  $9F27  00        BRK
  $9F28  00        BRK
  $9F29  00        BRK
  $9F2A  00        BRK
  $9F2B  04        .db $04
  $9F2C  84 07     STY $07
  $9F2E  74        .db $74
  $9F2F  3F        .db $3F
  $9F30  00        BRK
  $9F31  00        BRK
  $9F32  00        BRK
  $9F33  00        BRK
  $9F34  00        BRK
  $9F35  00        BRK
  $9F36  00        BRK
  $9F37  00        BRK
  $9F38  00        BRK
  $9F39  00        BRK
  $9F3A  00        BRK
  $9F3B  18        CLC
  $9F3C  10 71     BPL $9FAF
  $9F3E  F8        SED
  $9F3F  C0 00     CPY #$00
  $9F41  00        BRK
  $9F42  00        BRK
  $9F43  00        BRK
  $9F44  00        BRK
  $9F45  00        BRK
  $9F46  00        BRK
  $9F47  00        BRK
  $9F48  00        BRK
  $9F49  00        BRK
  $9F4A  00        BRK
  $9F4B  00        BRK
  $9F4C  09 01     ORA #$01
  $9F4E  03        .db $03
  $9F4F  07        .db $07
  $9F50  00        BRK
  $9F51  00        BRK
  $9F52  00        BRK
  $9F53  00        BRK
  $9F54  00        BRK
  $9F55  00        BRK
  $9F56  00        BRK
  $9F57  00        BRK
  $9F58  80        .db $80
  $9F59  00        BRK
  $9F5A  80        .db $80
  $9F5B  80        .db $80
  $9F5C  80        .db $80
  $9F5D  C0 E4     CPY #$E4
  $9F5F  D0 00     BNE $9F61

L_9F61:
  $9F61  00        BRK
  $9F62  00        BRK
  $9F63  00        BRK
  $9F64  00        BRK
  $9F65  00        BRK
  $9F66  00        BRK
  $9F67  00        BRK
  $9F68  FF        .db $FF
  $9F69  77        .db $77
  $9F6A  41 0F     EOR ($0F,X)
  $9F6C  2D 05 07  AND $0705
  $9F6F  03        .db $03
  $9F70  00        BRK
  $9F71  00        BRK
  $9F72  00        BRK
  $9F73  00        BRK
  $9F74  00        BRK
  $9F75  00        BRK
  $9F76  00        BRK
  $9F77  00        BRK
  $9F78  FF        .db $FF
  $9F79  37        .db $37
  $9F7A  F4        .db $F4
  $9F7B  C0 E0     CPY #$E0
  $9F7D  C4 C4     CPY $C4
  $9F7F  80        .db $80
  $9F80  00        BRK
  $9F81  00        BRK
  $9F82  00        BRK
  $9F83  00        BRK
  $9F84  00        BRK
  $9F85  00        BRK
  $9F86  00        BRK
  $9F87  00        BRK
  $9F88  03        .db $03
  $9F89  09 01     ORA #$01
  $9F8B  01 01     ORA ($01,X)
  $9F8D  01 00     ORA ($00,X)
  $9F8F  00        BRK
  $9F90  00        BRK
  $9F91  00        BRK
  $9F92  00        BRK
  $9F93  00        BRK
  $9F94  00        BRK
  $9F95  00        BRK
  $9F96  00        BRK
  $9F97  00        BRK
  $9F98  A0 80     LDY #$80
  $9F9A  80        .db $80
  $9F9B  40        RTI
  $9F9C  80        .db $80
  $9F9D  80        .db $80
  $9F9E  00        BRK
  $9F9F  80        .db $80
  $9FA0  00        BRK
  $9FA1  00        BRK
  $9FA2  00        BRK
  $9FA3  00        BRK
  $9FA4  00        BRK
  $9FA5  00        BRK
  $9FA6  00        BRK
  $9FA7  00        BRK
  $9FA8  00        BRK
  $9FA9  01 01     ORA ($01,X)
  $9FAB  00        BRK
  $9FAC  00        BRK
  $9FAD  00        BRK
  $9FAE  00        BRK

L_9FAF:
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
  $9FBE  01 07     ORA ($07,X)
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
  $9FCE  80        .db $80
  $9FCF  E0 00     CPX #$00
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
  $9FDC  80        .db $80
  $9FDD  00        BRK
  $9FDE  40        RTI
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
  $9FEB  01 04     ORA ($04,X)
  $9FED  01 00     ORA ($00,X)
  $9FEF  01 00     ORA ($00,X)
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
  $9FFB  20 00 40  JSR $4000
  $9FFE  00        BRK
  $9FFF  00        BRK
  $A000  FF        .db $FF
  $A001  FF        .db $FF
  $A002  01 C0     ORA ($C0,X)
  $A004  CD CD DF  CMP $DFCD
  $A007  DF        .db $DF
  $A008  FF        .db $FF
  $A009  FF        .db $FF
  $A00A  01 C0     ORA ($C0,X)
  $A00C  CD CD DF  CMP $DFCD
  $A00F  DF        .db $DF
  $A010  C1 CC     CMP ($CC,X)
  $A012  CD C1 DF  CMP $DFC1
  $A015  C1 FF     CMP ($FF,X)
  $A017  00        BRK
  $A018  C1 CC     CMP ($CC,X)
  $A01A  CD C1 DF  CMP $DFC1
  $A01D  C1 FF     CMP ($FF,X)
  $A01F  00        BRK
  $A020  FF        .db $FF
  $A021  FF        .db $FF
  $A022  80        .db $80
  $A023  05 B5     ORA $B5
  $A025  B5 FF     LDA $FF,X
  $A027  FF        .db $FF
  $A028  FF        .db $FF
  $A029  FF        .db $FF
  $A02A  80        .db $80
  $A02B  05 B5     ORA $B5
  $A02D  B5 FF     LDA $FF,X
  $A02F  FF        .db $FF
  $A030  81 35     STA ($35,X)
  $A032  B5 85     LDA $85,X
  $A034  BD 81 FF  LDA $FF81,X
  $A037  00        BRK
  $A038  81 35     STA ($35,X)
  $A03A  B5 85     LDA $85,X
  $A03C  BD 81 FF  LDA $FF81,X
  $A03F  00        BRK
  $A040  7F        .db $7F
  $A041  FF        .db $FF
  $A042  C0 B1     CPY #$B1
  $A044  81 82     STA ($82,X)
  $A046  80        .db $80
  $A047  82        .db $82
  $A048  7F        .db $7F
  $A049  C0 BF     CPY #$BF
  $A04B  C7        .db $C7
  $A04C  C7        .db $C7
  $A04D  FE C0 DE  INC $DEC0,X
  $A050  02        .db $02
  $A051  82        .db $82
  $A052  99 80 98  STA $9880,Y
  $A055  C0 60     CPY #$60
  $A057  3F        .db $3F
  $A058  1E FE E3  ASL $E3FE,X
  $A05B  E3        .db $E3
  $A05C  E3        .db $E3
  $A05D  E3        .db $E3
  $A05E  7F        .db $7F
  $A05F  3F        .db $3F
  $A060  FF        .db $FF
  $A061  FF        .db $FF
  $A062  D0 FF     BNE $A063
  $A064  00        BRK
  $A065  24 24     BIT $24
  $A067  24 FF     BIT $FF
  $A069  50 7F     BVC $A0EA
  $A06B  FF        .db $FF
  $A06C  00        BRK
  $A06D  36 36     ROL $36,X
  $A06F  36 00     ROL $00,X
  $A071  FD 00 40  SBC $4000,X
  $A074  7F        .db $7F
  $A075  40        RTI
  $A076  7F        .db $7F
  $A077  C0 00     CPY #$00
  $A079  FD 1D C0  SBC $C01D,X
  $A07C  FF        .db $FF
  $A07D  FF        .db $FF
  $A07E  FF        .db $FF
  $A07F  C0 FF     CPY #$FF
  $A081  FF        .db $FF
  $A082  0B        .db $0B
  $A083  FF        .db $FF
  $A084  00        BRK
  $A085  49 49     EOR #$49
  $A087  49 FF     EOR #$FF
  $A089  0A        ASL
  $A08A  FE FF 00  INC $00FF,X
  $A08D  6D 6D 6D  ADC $6D6D
  $A090  00        BRK
  $A091  BF        .db $BF
  $A092  00        BRK
  $A093  02        .db $02
  $A094  FE 02 FE  INC $FE02,X
  $A097  03        .db $03
  $A098  00        BRK
  $A099  BF        .db $BF
  $A09A  B8        CLV
  $A09B  03        .db $03
  $A09C  FF        .db $FF
  $A09D  FF        .db $FF
  $A09E  FF        .db $FF
  $A09F  03        .db $03
  $A0A0  FE FF 03  INC $03FF,X
  $A0A3  99 81 41  STA $4181,Y
  $A0A6  01 41     ORA ($41,X)
  $A0A8  FE 03 FD  INC $FD03,X
  $A0AB  E3        .db $E3
  $A0AC  E3        .db $E3
  $A0AD  7F        .db $7F
  $A0AE  03        .db $03
  $A0AF  7B        .db $7B
  $A0B0  40        RTI
  $A0B1  41 B1     EOR ($B1,X)
  $A0B3  01 31     ORA ($31,X)
  $A0B5  03        .db $03
  $A0B6  06 FC     ASL $FC
  $A0B8  78        SEI
  $A0B9  7F        .db $7F
  $A0BA  C7        .db $C7
  $A0BB  C7        .db $C7
  $A0BC  C7        .db $C7
  $A0BD  C7        .db $C7
  $A0BE  FE FC 52  INC $52FC,X
  $A0C1  D2        .db $D2
  $A0C2  12        .db $12
  $A0C3  E2        .db $E2
  $A0C4  0A        ASL
  $A0C5  02        .db $02
  $A0C6  FC        .db $FC
  $A0C7  00        BRK
  $A0C8  76 F6     ROR $F6,X
  $A0CA  F6 E6     INC $E6,X
  $A0CC  0E FE FC  ASL $FCFE
  $A0CF  00        BRK
  $A0D0  00        BRK
  $A0D1  BF        .db $BF
  $A0D2  00        BRK
  $A0D3  00        BRK
  $A0D4  FF        .db $FF
  $A0D5  00        BRK
  $A0D6  FF        .db $FF
  $A0D7  00        BRK
  $A0D8  00        BRK
  $A0D9  BF        .db $BF
  $A0DA  BF        .db $BF
  $A0DB  00        BRK
  $A0DC  FF        .db $FF
  $A0DD  FF        .db $FF
  $A0DE  FF        .db $FF
  $A0DF  00        BRK
  $A0E0  EB        .db $EB
  $A0E1  0B        .db $0B
  $A0E2  08        PHP
  $A0E3  E7        .db $E7
  $A0E4  00        BRK
  $A0E5  36 A4     ROL $A4,X
  $A0E7  64        .db $64
  $A0E8  ED EC 0F  SBC $0FEC
  $A0EB  E7        .db $E7
  $A0EC  E0 36     CPX #$36
  $A0EE  B6 F6     LDX $F6,Y
  $A0F0  00        BRK
  $A0F1  DF        .db $DF
  $A0F2  10 00     BPL $A0F4

L_A0F4:
  $A0F4  FF        .db $FF
  $A0F5  00        BRK
  $A0F6  FF        .db $FF
  $A0F7  00        BRK
  $A0F8  00        BRK
  $A0F9  DF        .db $DF
  $A0FA  DF        .db $DF
  $A0FB  00        BRK
  $A0FC  FF        .db $FF
  $A0FD  FF        .db $FF
  $A0FE  FF        .db $FF
  $A0FF  00        BRK
  $A100  9F        .db $9F
  $A101  80        .db $80
  $A102  9F        .db $9F
  $A103  C0 FF     CPY #$FF
  $A105  DF        .db $DF
  $A106  9F        .db $9F
  $A107  FF        .db $FF
  $A108  9F        .db $9F
  $A109  80        .db $80
  $A10A  9F        .db $9F
  $A10B  C0 FF     CPY #$FF
  $A10D  DF        .db $DF
  $A10E  9F        .db $9F
  $A10F  FF        .db $FF
  $A110  C0 80     CPY #$80
  $A112  9F        .db $9F
  $A113  88        DEY
  $A114  9F        .db $9F
  $A115  88        DEY
  $A116  9F        .db $9F
  $A117  80        .db $80
  $A118  C0 80     CPY #$80
  $A11A  9F        .db $9F
  $A11B  88        DEY
  $A11C  9F        .db $9F
  $A11D  88        DEY
  $A11E  9F        .db $9F
  $A11F  80        .db $80

L_A120:
  $A120  FD 11 FD  SBC $FD11,X
  $A123  03        .db $03
  $A124  FF        .db $FF
  $A125  FE FC FF  INC $FFFC,X
  $A128  FD 11 FD  SBC $FD11,X
  $A12B  03        .db $03
  $A12C  FF        .db $FF
  $A12D  FE FC FF  INC $FFFC,X
  $A130  03        .db $03
  $A131  01 FD     ORA ($FD,X)
  $A133  01 FD     ORA ($FD,X)
  $A135  01 FD     ORA ($FD,X)
  $A137  01 03     ORA ($03,X)
  $A139  01 FD     ORA ($FD,X)
  $A13B  01 FD     ORA ($FD,X)
  $A13D  01 FD     ORA ($FD,X)
  $A13F  01 00     ORA ($00,X)

L_A141:
  $A141  FF        .db $FF
  $A142  00        BRK
  $A143  55 FF     EOR $FF,X
  $A145  FF        .db $FF
  $A146  FF        .db $FF
  $A147  FF        .db $FF
  $A148  00        BRK
  $A149  FF        .db $FF
  $A14A  FF        .db $FF
  $A14B  AA        TAX
  $A14C  00        BRK
  $A14D  00        BRK
  $A14E  00        BRK
  $A14F  00        BRK
  $A150  FF        .db $FF
  $A151  AA        TAX

L_A152:
  $A152  00        BRK
  $A153  00        BRK
  $A154  AA        TAX
  $A155  FF        .db $FF
  $A156  FF        .db $FF
  $A157  00        BRK
  $A158  00        BRK
  $A159  55 FF     EOR $FF,X
  $A15B  FF        .db $FF
  $A15C  FF        .db $FF
  $A15D  FF        .db $FF
  $A15E  FF        .db $FF
  $A15F  00        BRK
  $A160  00        BRK
  $A161  FF        .db $FF
  $A162  00        BRK
  $A163  55 FF     EOR $FF,X

L_A165:
  $A165  FF        .db $FF
  $A166  FF        .db $FF
  $A167  FF        .db $FF
  $A168  00        BRK
  $A169  FF        .db $FF
  $A16A  FF        .db $FF
  $A16B  AA        TAX
  $A16C  00        BRK
  $A16D  00        BRK
  $A16E  00        BRK
  $A16F  00        BRK

L_A170:
  $A170  FF        .db $FF
  $A171  AA        TAX
  $A172  00        BRK
  $A173  00        BRK
  $A174  AA        TAX

L_A175:
  $A175  FF        .db $FF
  $A176  FF        .db $FF
  $A177  00        BRK

L_A178:
  $A178  00        BRK
  $A179  55 FF     EOR $FF,X
  $A17B  FF        .db $FF
  $A17C  FF        .db $FF
  $A17D  FF        .db $FF
  $A17E  FF        .db $FF
  $A17F  00        BRK
  $A180  D0 D0     BNE $A152
  $A182  D7        .db $D7
  $A183  D0 F0     BNE $A175

L_A185:
  $A185  D7        .db $D7
  $A186  F0 F0     BEQ $A178
  $A188  B0 B7     BCS $A141
  $A18A  B7        .db $B7
  $A18B  B0 F7     BCS $A184
  $A18D  B7        .db $B7
  $A18E  F0 90     BEQ $A120
  $A190  D8        CLD
  $A191  C5 C0     CMP $C0
  $A193  D0 D0     BNE $A165

L_A195:
  $A195  C0 E0     CPY #$E0
  $A197  7F        .db $7F
  $A198  B8        CLV
  $A199  BD BD A5  LDA $A5BD,X
  $A19C  A5 A4     LDA $A4
  $A19E  DF        .db $DF
  $A19F  7F        .db $7F
  $A1A0  4A        LSR
  $A1A1  0A        ASL
  $A1A2  4A        LSR

L_A1A3:
  $A1A3  4A        LSR
  $A1A4  4A        LSR
  $A1A5  4A        LSR

L_A1A6:
  $A1A6  5F        .db $5F
  $A1A7  41 6E     EOR ($6E,X)
  $A1A9  0E 6E 6E  ASL $6E6E
  $A1AC  6E 4E 5F  ROR $5F4E
  $A1AF  5F        .db $5F
  $A1B0  21 C1     AND ($C1,X)
  $A1B2  29 29     AND #$29
  $A1B4  01 03     ORA ($03,X)
  $A1B6  06 7C     ASL $7C
  $A1B8  3F        .db $3F
  $A1B9  FF        .db $FF
  $A1BA  C3        .db $C3
  $A1BB  C3        .db $C3
  $A1BC  C3        .db $C3
  $A1BD  7F        .db $7F
  $A1BE  7E 7C 7F  ROR $7F7C,X
  $A1C1  E0 D0     CPX #$D0
  $A1C3  D0 C0     BNE $A185
  $A1C5  C0 C5     CPY #$C5
  $A1C7  D8        CLD
  $A1C8  7F        .db $7F
  $A1C9  DF        .db $DF
  $A1CA  A4 A5     LDY $A5
  $A1CC  A5 BD     LDA $BD
  $A1CE  BD B8 F7  LDA $F7B8,X
  $A1D1  F0 D0     BEQ $A1A3
  $A1D3  F7        .db $F7
  $A1D4  D0 D0     BNE $A1A6
  $A1D6  D7        .db $D7
  $A1D7  D0 97     BNE $A170
  $A1D9  F0 B7     BEQ $A192
  $A1DB  F7        .db $F7
  $A1DC  B0 B7     BCS $A195
  $A1DE  B7        .db $B7
  $A1DF  B0 7C     BCS $A25D
  $A1E1  06 03     ASL $03
  $A1E3  29 29     AND #$29
  $A1E5  01 C1     ORA ($C1,X)
  $A1E7  21 7C     AND ($7C,X)
  $A1E9  7E 7F C3  ROR $C37F,X
  $A1EC  C3        .db $C3
  $A1ED  C3        .db $C3
  $A1EE  FF        .db $FF
  $A1EF  3F        .db $3F
  $A1F0  41 5F     EOR ($5F,X)
  $A1F2  4A        LSR
  $A1F3  4A        LSR
  $A1F4  4A        LSR
  $A1F5  4A        LSR
  $A1F6  0A        ASL
  $A1F7  4A        LSR
  $A1F8  5F        .db $5F
  $A1F9  5F        .db $5F
  $A1FA  4E 6E 6E  LSR $6E6E
  $A1FD  6E 0E 6E  ROR $6E0E
  $A200  40        RTI
  $A201  1F        .db $1F
  $A202  20 51 42  JSR $4251
  $A205  44        .db $44
  $A206  48        PHA
  $A207  51 C0     EOR ($C0),Y
  $A209  9F        .db $9F
  $A20A  3F        .db $3F
  $A20B  67        .db $67
  $A20C  66 7C     ROR $7C
  $A20E  79 73 53  ADC $5373,Y
  $A211  52        .db $52
  $A212  52        .db $52
  $A213  52        .db $52
  $A214  52        .db $52
  $A215  52        .db $52
  $A216  52        .db $52
  $A217  52        .db $52
  $A218  77        .db $77
  $A219  76 76     ROR $76,X
  $A21B  76 76     ROR $76,X
  $A21D  76 76     ROR $76,X
  $A21F  76 00     ROR $00,X
  $A221  FF        .db $FF
  $A222  00        BRK
  $A223  FF        .db $FF
  $A224  00        BRK
  $A225  00        BRK
  $A226  FF        .db $FF
  $A227  80        .db $80
  $A228  00        BRK
  $A229  FF        .db $FF
  $A22A  FF        .db $FF
  $A22B  FF        .db $FF
  $A22C  00        BRK
  $A22D  FF        .db $FF
  $A22E  FF        .db $FF
  $A22F  80        .db $80
  $A230  21 21     AND ($21,X)
  $A232  D3        .db $D3
  $A233  20 03 04  JSR $0403
  $A236  29 EB     AND #$EB
  $A238  3B        .db $3B
  $A239  3B        .db $3B
  $A23A  DB        .db $DB
  $A23B  E0 E3     CPX #$E3
  $A23D  07        .db $07
  $A23E  EE ED 01  INC $01ED
  $A241  FB        .db $FB
  $A242  03        .db $03
  $A243  FA        .db $FA
  $A244  00        BRK
  $A245  03        .db $03
  $A246  BF        .db $BF

L_A247:
  $A247  03        .db $03
  $A248  01 FA     ORA ($FA,X)
  $A24A  FA        .db $FA
  $A24B  FA        .db $FA
  $A24C  01 BE     ORA ($BE,X)
  $A24E  BE 02 4B  LDX $4B02,Y
  $A251  4B        .db $4B
  $A252  6F        .db $6F
  $A253  03        .db $03
  $A254  FD FF 00  SBC $00FF,X
  $A257  FF        .db $FF
  $A258  6E 6E 6E  ROR $6E6E
  $A25B  02        .db $02
  $A25C  FE 00 FF  INC $FF00,X
  $A25F  FF        .db $FF
  $A260  80        .db $80
  $A261  D7        .db $D7
  $A262  40        RTI
  $A263  57        .db $57
  $A264  80        .db $80
  $A265  50 5F     BVC $A2C6
  $A267  40        RTI
  $A268  80        .db $80
  $A269  57        .db $57
  $A26A  D7        .db $D7
  $A26B  57        .db $57
  $A26C  80        .db $80
  $A26D  DF        .db $DF
  $A26E  DF        .db $DF
  $A26F  C0 44     CPY #$44
  $A271  44        .db $44
  $A272  56 40     LSR $40,X
  $A274  3F        .db $3F
  $A275  FF        .db $FF
  $A276  00        BRK
  $A277  FF        .db $FF
  $A278  D6 D6     DEC $D6,X
  $A27A  D6 C0     DEC $C0,X
  $A27C  FF        .db $FF
  $A27D  00        BRK
  $A27E  FF        .db $FF
  $A27F  FF        .db $FF
  $A280  00        BRK
  $A281  FF        .db $FF
  $A282  00        BRK
  $A283  FF        .db $FF
  $A284  00        BRK
  $A285  00        BRK
  $A286  FF        .db $FF
  $A287  01 00     ORA ($00,X)
  $A289  FF        .db $FF
  $A28A  FF        .db $FF
  $A28B  FF        .db $FF
  $A28C  00        BRK
  $A28D  FF        .db $FF
  $A28E  FF        .db $FF
  $A28F  01 44     ORA ($44,X)
  $A291  44        .db $44
  $A292  DB        .db $DB
  $A293  04        .db $04

L_A294:
  $A294  C7        .db $C7
  $A295  20 94 D7  JSR $D794
  $A298  DC        .db $DC
  $A299  DC        .db $DC
  $A29A  DB        .db $DB
  $A29B  07        .db $07
  $A29C  C7        .db $C7
  $A29D  E0 77     CPX #$77
  $A29F  B7        .db $B7
  $A2A0  02        .db $02
  $A2A1  F8        SED
  $A2A2  04        .db $04
  $A2A3  92        .db $92
  $A2A4  42        .db $42
  $A2A5  22        .db $22
  $A2A6  12        .db $12
  $A2A7  8A        TXA
  $A2A8  03        .db $03
  $A2A9  F9 FC E6  SBC $E6FC,Y
  $A2AC  66 3E     ROR $3E
  $A2AE  9E        .db $9E
  $A2AF  CE CA 4A  DEC $4ACA
  $A2B2  4A        LSR
  $A2B3  4A        LSR
  $A2B4  4A        LSR
  $A2B5  4A        LSR
  $A2B6  4A        LSR
  $A2B7  4A        LSR
  $A2B8  EE 6E 6E  INC $6E6E
  $A2BB  6E 6E 6E  ROR $6E6E
  $A2BE  6E 6E 9F  ROR $9F6E
  $A2C1  80        .db $80
  $A2C2  9C        .db $9C
  $A2C3  80        .db $80
  $A2C4  90 81     BCC $A247

L_A2C6:
  $A2C6  83        .db $83
  $A2C7  B7        .db $B7
  $A2C8  9F        .db $9F
  $A2C9  80        .db $80
  $A2CA  9D 83 97  STA $9783,X
  $A2CD  8F        .db $8F
  $A2CE  9F        .db $9F
  $A2CF  BF        .db $BF
  $A2D0  9F        .db $9F
  $A2D1  8F        .db $8F
  $A2D2  8F        .db $8F
  $A2D3  80        .db $80
  $A2D4  85 80     STA $80
  $A2D6  05 E0     ORA $E0
  $A2D8  BF        .db $BF
  $A2D9  BF        .db $BF
  $A2DA  BF        .db $BF
  $A2DB  B0 B7     BCS $A294
  $A2DD  B0 07     BCS $A2E6
  $A2DF  E0 FD     CPX #$FD
  $A2E1  01 01     ORA ($01,X)
  $A2E3  01 F9     ORA ($F9,X)
  $A2E5  F9 F9 99  SBC $99F9,Y
  $A2E8  FD 01 F9  SBC $F901,X
  $A2EB  F9 F9 F9  SBC $F9F9,Y
  $A2EE  F9 D9 98  SBC $98D9,Y
  $A2F1  E7        .db $E7
  $A2F2  DC        .db $DC
  $A2F3  B0 20     BCS $A315
  $A2F5  66 4F     ROR $4F
  $A2F7  4F        .db $4F
  $A2F8  98        TYA
  $A2F9  E7        .db $E7
  $A2FA  DF        .db $DF
  $A2FB  BF        .db $BF
  $A2FC  3F        .db $3F
  $A2FD  79 70 70  ADC $7070,Y
  $A300  9F        .db $9F
  $A301  80        .db $80
  $A302  80        .db $80
  $A303  81 9E     STA ($9E,X)
  $A305  93        .db $93
  $A306  93        .db $93
  $A307  9E        .db $9E
  $A308  9F        .db $9F
  $A309  80        .db $80
  $A30A  9F        .db $9F
  $A30B  9F        .db $9F
  $A30C  9E        .db $9E
  $A30D  9B        .db $9B
  $A30E  93        .db $93
  $A30F  9F        .db $9F
  $A310  1E E7 7B  ASL $7BE7,X
  $A313  1D 0C 0E  ORA $0E0C,X
  $A316  06 06     ASL $06
  $A318  1E E7 FB  ASL $FBE7,X
  $A31B  FD FC FE  SBC $FEFC,X
  $A31E  FE FE FD  INC $FDFE,X
  $A321  01 BD     ORA ($BD,X)
  $A323  C1 ED     CMP ($ED,X)
  $A325  71 B9     ADC ($B9),Y
  $A327  5D FD 01  EOR $01FD,X
  $A32A  BD C1 ED  LDA $EDC1,X
  $A32D  71 B9     ADC ($B9),Y
  $A32F  5D 69 F1  EOR $F169,X
  $A332  F1 01     SBC ($01),Y
  $A334  A1 01     LDA ($01,X)
  $A336  A0 07     LDY #$07
  $A338  69 F1     ADC #$F1
  $A33A  F1 01     SBC ($01),Y
  $A33C  E1 01     SBC ($01,X)
  $A33E  E0 07     CPX #$07
  $A340  20 3F E0  JSR $E03F
  $A343  40        RTI
  $A344  4C 4C 40  JMP $404C
  $A347  40        RTI
  $A348  3F        .db $3F
  $A349  40        RTI
  $A34A  9F        .db $9F
  $A34B  BF        .db $BF
  $A34C  B1 B1     LDA ($B1),Y
  $A34E  B1 BF     LDA ($BF),Y
  $A350  40        RTI
  $A351  41 40     EOR ($40,X)
  $A353  AE 00 22  LDX $2200
  $A356  22        .db $22
  $A357  00        BRK
  $A358  BF        .db $BF
  $A359  BF        .db $BF
  $A35A  BE FE 00  LDX $00FE,Y
  $A35D  8A        TXA
  $A35E  8A        TXA
  $A35F  00        BRK
  $A360  10 E0     BPL $A342
  $A362  16 00     ASL $00,X
  $A364  10 10     BPL $A376
  $A366  16 60     ASL $60,X
  $A368  F6 10     INC $10,X
  $A36A  F0 F0     BEQ $A35C
  $A36C  F6 F0     INC $F0,X
  $A36E  F6 E0     INC $E0,X
  $A370  80        .db $80
  $A371  3F        .db $3F
  $A372  40        RTI
  $A373  40        RTI
  $A374  47        .db $47
  $A375  48        PHA

L_A376:
  $A376  49 4A     EOR #$4A
  $A378  80        .db $80
  $A379  3F        .db $3F
  $A37A  5F        .db $5F
  $A37B  60        RTS
  $A37C  67        .db $67
  $A37D  6B        .db $6B
  $A37E  6D 6E 08  ADC $086E
  $A381  07        .db $07
  $A382  68        PLA
  $A383  00        BRK
  $A384  08        PHP
  $A385  08        PHP
  $A386  68        PLA
  $A387  06 6F     ASL $6F
  $A389  08        PHP
  $A38A  0F        .db $0F
  $A38B  0F        .db $0F
  $A38C  6F        .db $6F
  $A38D  0F        .db $0F
  $A38E  6F        .db $6F
  $A38F  07        .db $07
  $A390  01 FC     ORA ($FC,X)
  $A392  02        .db $02
  $A393  02        .db $02
  $A394  E2        .db $E2
  $A395  12        .db $12
  $A396  92        .db $92
  $A397  52        .db $52
  $A398  01 FC     ORA ($FC,X)
  $A39A  FA        .db $FA
  $A39B  06 E6     ASL $E6
  $A39D  D6 B6     DEC $B6,X
  $A39F  76 04     ROR $04,X
  $A3A1  FC        .db $FC
  $A3A2  07        .db $07
  $A3A3  02        .db $02
  $A3A4  62        .db $62
  $A3A5  62        .db $62
  $A3A6  02        .db $02
  $A3A7  02        .db $02
  $A3A8  FC        .db $FC
  $A3A9  02        .db $02
  $A3AA  F9 FD 8D  SBC $8DFD,Y
  $A3AD  8D 8D FD  STA $FD8D
  $A3B0  02        .db $02
  $A3B1  82        .db $82
  $A3B2  02        .db $02
  $A3B3  75 00     ADC $00,X
  $A3B5  44        .db $44
  $A3B6  44        .db $44
  $A3B7  00        BRK
  $A3B8  FD FD 7D  SBC $7DFD,X
  $A3BB  7F        .db $7F
  $A3BC  00        BRK
  $A3BD  51 51     EOR ($51),Y
  $A3BF  00        BRK
  $A3C0  08        PHP
  $A3C1  05 7D     ORA $7D
  $A3C3  40        RTI
  $A3C4  40        RTI
  $A3C5  40        RTI
  $A3C6  FF        .db $FF
  $A3C7  FF        .db $FF
  $A3C8  F8        SED
  $A3C9  FD FD C0  SBC $C0FD,X
  $A3CC  DF        .db $DF
  $A3CD  DF        .db $DF
  $A3CE  FF        .db $FF
  $A3CF  00        BRK
  $A3D0  00        BRK
  $A3D1  FF        .db $FF
  $A3D2  00        BRK
  $A3D3  10 10     BPL $A3E5
  $A3D5  10 10     BPL $A3E7
  $A3D7  17        .db $17
  $A3D8  FF        .db $FF
  $A3D9  FF        .db $FF
  $A3DA  00        BRK
  $A3DB  F4        .db $F4
  $A3DC  F7        .db $F7
  $A3DD  F4        .db $F4
  $A3DE  F7        .db $F7
  $A3DF  F7        .db $F7
  $A3E0  08        PHP
  $A3E1  F0 00     BEQ $A3E3

L_A3E3:
  $A3E3  00        BRK
  $A3E4  40        RTI

L_A3E5:
  $A3E5  40        RTI
  $A3E6  FF        .db $FF

L_A3E7:
  $A3E7  FF        .db $FF
  $A3E8  0F        .db $0F
  $A3E9  FF        .db $FF
  $A3EA  FD 19 DF  SBC $DF19,X
  $A3ED  DF        .db $DF
  $A3EE  FF        .db $FF
  $A3EF  00        BRK
  $A3F0  00        BRK
  $A3F1  FF        .db $FF
  $A3F2  00        BRK
  $A3F3  02        .db $02
  $A3F4  02        .db $02
  $A3F5  02        .db $02
  $A3F6  3E E0 FF  ROL $FFE0,X
  $A3F9  FF        .db $FF
  $A3FA  00        BRK
  $A3FB  7E 7E 7E  ROR $7E7E,X
  $A3FE  FE E0 52  INC $52E0,X
  $A401  50 52     BVC $A455
  $A403  52        .db $52
  $A404  52        .db $52
  $A405  02        .db $02
  $A406  77        .db $77
  $A407  E7        .db $E7
  $A408  76 70     ROR $70,X
  $A40A  76 76     ROR $76,X
  $A40C  76 06     ROR $06,X
  $A40E  77        .db $77
  $A40F  88        DEY
  $A410  C8        INY
  $A411  77        .db $77
  $A412  00        BRK
  $A413  56 02     LSR $02,X
  $A415  52        .db $52
  $A416  52        .db $52
  $A417  52        .db $52
  $A418  AF        .db $AF
  $A419  77        .db $77
  $A41A  00        BRK
  $A41B  76 06     ROR $06,X
  $A41D  76 76     ROR $76,X
  $A41F  76 0B     ROR $0B,X
  $A421  EB        .db $EB
  $A422  2B        .db $2B
  $A423  0B        .db $0B
  $A424  EB        .db $EB
  $A425  2B        .db $2B
  $A426  F3        .db $F3
  $A427  FF        .db $FF
  $A428  0D ED ED  ORA $EDED
  $A42B  0D ED ED  ORA $EDED
  $A42E  FD 01 03  SBC $0301,X
  $A431  F3        .db $F3
  $A432  0B        .db $0B
  $A433  2B        .db $2B
  $A434  0B        .db $0B
  $A435  EB        .db $EB
  $A436  2B        .db $2B
  $A437  0B        .db $0B
  $A438  FD FD 0D  SBC $0DFD,X
  $A43B  ED 0D ED  SBC $ED0D
  $A43E  ED 0D 08  SBC $080D

L_A441:
  $A441  05 7D     ORA $7D
  $A443  40        RTI

L_A444:
  $A444  40        RTI
  $A445  40        RTI
  $A446  C0 00     CPY #$00
  $A448  F8        SED
  $A449  FD FD C0  SBC $C0FD,X
  $A44C  DF        .db $DF
  $A44D  DF        .db $DF
  $A44E  DF        .db $DF
  $A44F  1F        .db $1F
  $A450  1F        .db $1F
  $A451  10 10     BPL $A463

L_A453:
  $A453  10 10     BPL $A465

L_A455:
  $A455  10 10     BPL $A467
  $A457  17        .db $17

L_A458:
  $A458  FF        .db $FF
  $A459  F0 F7     BEQ $A452
  $A45B  F4        .db $F4

L_A45C:
  $A45C  F7        .db $F7
  $A45D  F4        .db $F4
  $A45E  F7        .db $F7
  $A45F  F7        .db $F7
  $A460  08        PHP
  $A461  F0 00     BEQ $A463

L_A463:
  $A463  00        BRK
  $A464  40        RTI

L_A465:
  $A465  40        RTI
  $A466  5F        .db $5F

L_A467:
  $A467  40        RTI

L_A468:
  $A468  0F        .db $0F
  $A469  FF        .db $FF
  $A46A  FD 19 DF  SBC $DF19,X

L_A46D:
  $A46D  DF        .db $DF
  $A46E  DF        .db $DF
  $A46F  C0 C2     CPY #$C2
  $A471  02        .db $02
  $A472  02        .db $02
  $A473  02        .db $02
  $A474  02        .db $02
  $A475  02        .db $02
  $A476  3E E0 DE  ROL $DEE0,X
  $A479  1E 7E 7E  ASL $7E7E,X
  $A47C  7E 7E FE  ROR $FE7E,X
  $A47F  E0 D0     CPX #$D0
  $A481  D7        .db $D7
  $A482  D4        .db $D4
  $A483  D0 D7     BNE $A45C
  $A485  D4        .db $D4
  $A486  EF        .db $EF
  $A487  FF        .db $FF
  $A488  B0 B7     BCS $A441
  $A48A  B7        .db $B7
  $A48B  B0 B7     BCS $A444
  $A48D  B7        .db $B7

L_A48E:
  $A48E  9F        .db $9F
  $A48F  80        .db $80
  $A490  C0 CF     CPY #$CF
  $A492  D0 D4     BNE $A468
  $A494  D0 D7     BNE $A46D
  $A496  D4        .db $D4
  $A497  D0 BF     BNE $A458
  $A499  BF        .db $BF
  $A49A  B0 B7     BCS $A453
  $A49C  B0 B7     BCS $A455
  $A49E  B7        .db $B7
  $A49F  B0 4A     BCS $A4EB
  $A4A1  0A        ASL
  $A4A2  4A        LSR
  $A4A3  4A        LSR
  $A4A4  4A        LSR
  $A4A5  40        RTI
  $A4A6  EE E7 6E  INC $6EE7
  $A4A9  0E 6E 6E  ASL $6E6E
  $A4AC  6E 60 EE  ROR $EE60
  $A4AF  11 13     ORA ($13),Y
  $A4B1  EE 00 6A  INC $6A00
  $A4B4  40        RTI
  $A4B5  4A        LSR
  $A4B6  4A        LSR
  $A4B7  4A        LSR
  $A4B8  F5 EE     SBC $EE,X
  $A4BA  00        BRK
  $A4BB  6E 60 6E  ROR $6E60
  $A4BE  6E 6E 65  ROR $656E
  $A4C1  00        BRK
  $A4C2  85 80     STA $80
  $A4C4  85 80     STA $80
  $A4C6  9F        .db $9F
  $A4C7  AE 67 00  LDX $0067
  $A4CA  B7        .db $B7
  $A4CB  B0 B7     BCS $A484
  $A4CD  B0 BF     BCS $A48E
  $A4CF  AF        .db $AF
  $A4D0  86 83     STX $83
  $A4D2  91 80     STA ($80),Y
  $A4D4  9C        .db $9C
  $A4D5  80        .db $80
  $A4D6  9F        .db $9F
  $A4D7  80        .db $80
  $A4D8  86 83     STX $83
  $A4DA  91 80     STA ($80),Y
  $A4DC  9C        .db $9C
  $A4DD  80        .db $80
  $A4DE  9F        .db $9F
  $A4DF  80        .db $80
  $A4E0  46 60     LSR $60
  $A4E2  60        RTS
  $A4E3  30 3C     BMI $A521
  $A4E5  1F        .db $1F
  $A4E6  C7        .db $C7
  $A4E7  30 79     BMI $A562
  $A4E9  7F        .db $7F
  $A4EA  7F        .db $7F

L_A4EB:
  $A4EB  3F        .db $3F
  $A4EC  3F        .db $3F
  $A4ED  1F        .db $1F
  $A4EE  C7        .db $C7
  $A4EF  B0 39     BCS $A52A
  $A4F1  19 19 F9  ORA $F919,Y
  $A4F4  01 01     ORA ($01,X)
  $A4F6  FD 01 39  SBC $3901,X
  $A4F9  D9 19 F9  CMP $F919,Y
  $A4FC  01 01     ORA ($01,X)
  $A4FE  FD 01 06  SBC $0601,X
  $A501  0E 0E 1C  ASL $1C0E
  $A504  7C        .db $7C
  $A505  F8        SED
  $A506  E3        .db $E3
  $A507  0F        .db $0F
  $A508  FE FE FE  INC $FEFE,X
  $A50B  FC        .db $FC
  $A50C  FC        .db $FC
  $A50D  F8        SED
  $A50E  E3        .db $E3
  $A50F  0F        .db $0F
  $A510  98        TYA
  $A511  98        TYA
  $A512  9F        .db $9F
  $A513  9F        .db $9F
  $A514  80        .db $80
  $A515  80        .db $80
  $A516  9F        .db $9F
  $A517  80        .db $80
  $A518  9E        .db $9E
  $A519  98        TYA
  $A51A  9F        .db $9F
  $A51B  9F        .db $9F
  $A51C  80        .db $80
  $A51D  80        .db $80
  $A51E  9F        .db $9F
  $A51F  80        .db $80
  $A520  A7        .db $A7

L_A521:
  $A521  00        BRK
  $A522  A1 01     LDA ($01,X)
  $A524  A1 01     LDA ($01,X)
  $A526  F1 F1     SBC ($F1),Y
  $A528  E7        .db $E7
  $A529  00        BRK

L_A52A:
  $A52A  E1 01     SBC ($01,X)
  $A52C  E1 01     SBC ($01,X)
  $A52E  F1 F1     SBC ($F1),Y
  $A530  E1 C1     SBC ($C1,X)
  $A532  8D 01 3D  STA $3D01
  $A535  01 FD     ORA ($FD,X)
  $A537  01 E1     ORA ($E1,X)
  $A539  C1 8D     CMP ($8D,X)
  $A53B  01 3D     ORA ($3D,X)
  $A53D  01 FD     ORA ($FD,X)
  $A53F  01 00     ORA ($00,X)
  $A541  22        .db $22
  $A542  22        .db $22
  $A543  00        BRK
  $A544  AE 40 41  LDX $4140
  $A547  40        RTI
  $A548  00        BRK
  $A549  8A        TXA
  $A54A  8A        TXA
  $A54B  00        BRK
  $A54C  FE BE BF  INC $BFBE,X
  $A54F  BF        .db $BF
  $A550  40        RTI
  $A551  4C 4C 40  JMP $404C
  $A554  00        BRK
  $A555  80        .db $80
  $A556  7F        .db $7F
  $A557  3F        .db $3F
  $A558  BF        .db $BF
  $A559  B1 B1     LDA ($B1),Y
  $A55B  B1 FF     LDA ($FF),Y
  $A55D  FF        .db $FF
  $A55E  7F        .db $7F
  $A55F  3F        .db $3F
  $A560  4A        LSR
  $A561  49 48     EOR #$48
  $A563  47        .db $47
  $A564  40        RTI
  $A565  40        RTI
  $A566  3F        .db $3F

L_A567:
  $A567  80        .db $80
  $A568  6E 6D 6B  ROR $6B6D
  $A56B  67        .db $67
  $A56C  60        RTS

L_A56D:
  $A56D  5F        .db $5F
  $A56E  3F        .db $3F
  $A56F  80        .db $80
  $A570  60        RTS
  $A571  10 10     BPL $A583
  $A573  16 00     ASL $00,X
  $A575  10 F0     BPL $A567
  $A577  F6 E0     INC $E0,X
  $A579  F6 F0     INC $F0,X
  $A57B  F0 F0     BEQ $A56D
  $A57D  F6 F0     INC $F0,X
  $A57F  F6 52     INC $52,X
  $A581  92        .db $92
  $A582  12        .db $12

L_A583:
  $A583  E2        .db $E2
  $A584  02        .db $02
  $A585  02        .db $02
  $A586  FC        .db $FC
  $A587  01 76     ORA ($76,X)
  $A589  B6 D6     LDX $D6,Y
  $A58B  E6 06     INC $06
  $A58D  FA        .db $FA
  $A58E  FC        .db $FC
  $A58F  01 06     ORA ($06,X)
  $A591  08        PHP
  $A592  08        PHP
  $A593  68        PLA
  $A594  00        BRK
  $A595  08        PHP
  $A596  0F        .db $0F
  $A597  6F        .db $6F
  $A598  07        .db $07
  $A599  6F        .db $6F
  $A59A  0F        .db $0F
  $A59B  0F        .db $0F
  $A59C  0F        .db $0F
  $A59D  6F        .db $6F
  $A59E  0F        .db $0F
  $A59F  6F        .db $6F
  $A5A0  00        BRK
  $A5A1  44        .db $44
  $A5A2  44        .db $44
  $A5A3  00        BRK
  $A5A4  75 02     ADC $02,X
  $A5A6  82        .db $82
  $A5A7  02        .db $02
  $A5A8  00        BRK
  $A5A9  51 51     EOR ($51),Y
  $A5AB  00        BRK
  $A5AC  7F        .db $7F
  $A5AD  7D FD FD  ADC $FDFD,X
  $A5B0  02        .db $02
  $A5B1  62        .db $62
  $A5B2  62        .db $62
  $A5B3  02        .db $02
  $A5B4  00        BRK
  $A5B5  01 FE     ORA ($FE,X)
  $A5B7  FC        .db $FC
  $A5B8  FD 8D 8D  SBC $8D8D,X
  $A5BB  8D FF FF  STA $FFFF
  $A5BE  FE FC 0B  INC $0BFC,X
  $A5C1  07        .db $07
  $A5C2  7F        .db $7F
  $A5C3  43        .db $43
  $A5C4  43        .db $43
  $A5C5  43        .db $43
  $A5C6  FF        .db $FF
  $A5C7  FF        .db $FF
  $A5C8  FA        .db $FA
  $A5C9  FE FE C2  INC $C2FE,X
  $A5CC  DE DE FE  DEC $FEDE,X
  $A5CF  00        BRK
  $A5D0  01 FD     ORA ($FD,X)
  $A5D2  03        .db $03
  $A5D3  13        .db $13
  $A5D4  13        .db $13
  $A5D5  13        .db $13
  $A5D6  13        .db $13
  $A5D7  17        .db $17
  $A5D8  FE FE 02  INC $02FE,X
  $A5DB  F6 F6     INC $F6,X
  $A5DD  F6 F6     INC $F6,X
  $A5DF  F6 48     INC $48,X
  $A5E1  50 40     BVC $A623
  $A5E3  40        RTI
  $A5E4  40        RTI
  $A5E5  40        RTI
  $A5E6  7F        .db $7F
  $A5E7  FF        .db $FF
  $A5E8  CF        .db $CF
  $A5E9  DF        .db $DF
  $A5EA  DD D9 DF  CMP $DFD9,X
  $A5ED  DF        .db $DF
  $A5EE  FF        .db $FF
  $A5EF  00        BRK
  $A5F0  00        BRK
  $A5F1  3F        .db $3F
  $A5F2  40        RTI
  $A5F3  42        .db $42

L_A5F4:
  $A5F4  42        .db $42
  $A5F5  42        .db $42
  $A5F6  5E 40 FF  LSR $FF40,X
  $A5F9  FF        .db $FF
  $A5FA  C0 DE     CPY #$DE
  $A5FC  DE DE DE  DEC $DEDE,X
  $A5FF  C0 52     CPY #$52
  $A601  52        .db $52
  $A602  52        .db $52
  $A603  52        .db $52
  $A604  52        .db $52
  $A605  52        .db $52
  $A606  52        .db $52
  $A607  53        .db $53
  $A608  76 76     ROR $76,X
  $A60A  76 76     ROR $76,X
  $A60C  76 76     ROR $76,X
  $A60E  76 77     ROR $77,X
  $A610  51 48     EOR ($48),Y
  $A612  44        .db $44
  $A613  52        .db $52
  $A614  41 20     EOR ($20,X)
  $A616  9F        .db $9F
  $A617  00        BRK
  $A618  73        .db $73
  $A619  79 7C 66  ADC $667C,Y
  $A61C  67        .db $67
  $A61D  3F        .db $3F
  $A61E  9F        .db $9F
  $A61F  C0 2B     CPY #$2B
  $A621  E9 04     SBC #$04

L_A623:
  $A623  03        .db $03
  $A624  20 D3 21  JSR $21D3
  $A627  21 ED     AND ($ED,X)
  $A629  EE 07 E3  INC $E307
  $A62C  E0 DB     CPX #$DB
  $A62E  3B        .db $3B
  $A62F  3B        .db $3B
  $A630  80        .db $80
  $A631  FF        .db $FF
  $A632  00        BRK
  $A633  00        BRK
  $A634  FF        .db $FF
  $A635  00        BRK
  $A636  FF        .db $FF
  $A637  00        BRK
  $A638  80        .db $80
  $A639  FF        .db $FF
  $A63A  FF        .db $FF
  $A63B  00        BRK
  $A63C  FF        .db $FF
  $A63D  FF        .db $FF
  $A63E  FF        .db $FF
  $A63F  00        BRK
  $A640  FF        .db $FF
  $A641  FF        .db $FF
  $A642  01 FD     ORA ($FD,X)
  $A644  03        .db $03
  $A645  6F        .db $6F
  $A646  4B        .db $4B
  $A647  4B        .db $4B
  $A648  FF        .db $FF
  $A649  00        BRK
  $A64A  FE FE 02  INC $02FE,X
  $A64D  6E 6E 6E  ROR $6E6E
  $A650  03        .db $03
  $A651  BF        .db $BF
  $A652  03        .db $03
  $A653  00        BRK
  $A654  FA        .db $FA
  $A655  03        .db $03
  $A656  FB        .db $FB
  $A657  01 02     ORA ($02,X)
  $A659  BE BE 01  LDX $01BE,Y
  $A65C  FA        .db $FA
  $A65D  FA        .db $FA
  $A65E  FA        .db $FA
  $A65F  01 FF     ORA ($FF,X)
  $A661  FF        .db $FF
  $A662  00        BRK
  $A663  3F        .db $3F
  $A664  40        RTI
  $A665  56 44     LSR $44,X
  $A667  44        .db $44
  $A668  FF        .db $FF
  $A669  00        BRK
  $A66A  FF        .db $FF
  $A66B  FF        .db $FF
  $A66C  C0 D6     CPY #$D6
  $A66E  D6 D6     DEC $D6,X
  $A670  40        RTI
  $A671  5F        .db $5F
  $A672  50 80     BVC $A5F4
  $A674  57        .db $57
  $A675  C0 57     CPY #$57
  $A677  80        .db $80
  $A678  C0 DF     CPY #$DF
  $A67A  DF        .db $DF
  $A67B  80        .db $80
  $A67C  57        .db $57
  $A67D  57        .db $57
  $A67E  D7        .db $D7
  $A67F  80        .db $80
  $A680  D4        .db $D4
  $A681  97        .db $97
  $A682  20 C4 04  JSR $04C4
  $A685  DB        .db $DB
  $A686  44        .db $44
  $A687  44        .db $44
  $A688  B7        .db $B7
  $A689  77        .db $77
  $A68A  E0 C7     CPX #$C7
  $A68C  07        .db $07
  $A68D  DB        .db $DB
  $A68E  DC        .db $DC
  $A68F  DC        .db $DC
  $A690  01 FF     ORA ($FF,X)
  $A692  00        BRK
  $A693  00        BRK
  $A694  FF        .db $FF
  $A695  00        BRK
  $A696  FF        .db $FF
  $A697  00        BRK
  $A698  01 FF     ORA ($FF,X)
  $A69A  FF        .db $FF
  $A69B  00        BRK
  $A69C  FF        .db $FF
  $A69D  FF        .db $FF
  $A69E  FF        .db $FF
  $A69F  00        BRK
  $A6A0  4A        LSR
  $A6A1  4A        LSR
  $A6A2  4A        LSR
  $A6A3  4A        LSR
  $A6A4  4A        LSR
  $A6A5  4A        LSR
  $A6A6  4A        LSR
  $A6A7  CA        DEX
  $A6A8  6E 6E 6E  ROR $6E6E
  $A6AB  6E 6E 6E  ROR $6E6E
  $A6AE  6E EE 8A  ROR $8AEE
  $A6B1  12        .db $12
  $A6B2  22        .db $22
  $A6B3  52        .db $52
  $A6B4  82        .db $82
  $A6B5  04        .db $04
  $A6B6  F9 00 CE  SBC $CE00,Y
  $A6B9  9E        .db $9E
  $A6BA  3E 66 E6  ROL $E666,X
  $A6BD  FC        .db $FC
  $A6BE  F9 03 9F  SBC $9F03,Y
  $A6C1  80        .db $80
  $A6C2  9F        .db $9F
  $A6C3  80        .db $80
  $A6C4  9F        .db $9F
  $A6C5  80        .db $80
  $A6C6  9F        .db $9F
  $A6C7  80        .db $80
  $A6C8  9F        .db $9F
  $A6C9  80        .db $80
  $A6CA  9F        .db $9F
  $A6CB  80        .db $80
  $A6CC  9F        .db $9F
  $A6CD  80        .db $80
  $A6CE  9F        .db $9F
  $A6CF  80        .db $80
  $A6D0  9F        .db $9F
  $A6D1  80        .db $80
  $A6D2  9F        .db $9F
  $A6D3  80        .db $80
  $A6D4  9F        .db $9F
  $A6D5  80        .db $80
  $A6D6  9F        .db $9F
  $A6D7  80        .db $80
  $A6D8  9F        .db $9F
  $A6D9  80        .db $80
  $A6DA  9F        .db $9F
  $A6DB  80        .db $80
  $A6DC  9F        .db $9F
  $A6DD  80        .db $80
  $A6DE  9F        .db $9F
  $A6DF  80        .db $80
  $A6E0  FD 41 FD  SBC $FD41,X
  $A6E3  41 FD     EOR ($FD,X)
  $A6E5  41 FD     EOR ($FD,X)
  $A6E7  41 FD     EOR ($FD,X)
  $A6E9  41 FD     EOR ($FD,X)
  $A6EB  41 FD     EOR ($FD,X)
  $A6ED  41 FD     EOR ($FD,X)
  $A6EF  41 FD     EOR ($FD,X)
  $A6F1  01 FD     ORA ($FD,X)
  $A6F3  01 FD     ORA ($FD,X)
  $A6F5  01 FD     ORA ($FD,X)
  $A6F7  01 FD     ORA ($FD,X)
  $A6F9  01 FD     ORA ($FD,X)
  $A6FB  01 FD     ORA ($FD,X)
  $A6FD  01 FD     ORA ($FD,X)
  $A6FF  01 00     ORA ($00,X)
  $A701  00        BRK
  $A702  00        BRK
  $A703  00        BRK
  $A704  00        BRK
  $A705  00        BRK
  $A706  00        BRK
  $A707  00        BRK
  $A708  00        BRK
  $A709  00        BRK
  $A70A  00        BRK

L_A70B:
  $A70B  00        BRK
  $A70C  00        BRK
  $A70D  00        BRK
  $A70E  00        BRK
  $A70F  00        BRK
  $A710  9F        .db $9F
  $A711  80        .db $80
  $A712  9F        .db $9F

L_A713:
  $A713  80        .db $80
  $A714  9F        .db $9F
  $A715  80        .db $80
  $A716  9F        .db $9F
  $A717  80        .db $80
  $A718  9F        .db $9F
  $A719  80        .db $80
  $A71A  9F        .db $9F
  $A71B  80        .db $80
  $A71C  9F        .db $9F
  $A71D  80        .db $80
  $A71E  9F        .db $9F
  $A71F  80        .db $80
  $A720  00        BRK
  $A721  00        BRK
  $A722  00        BRK
  $A723  00        BRK
  $A724  00        BRK
  $A725  00        BRK
  $A726  00        BRK
  $A727  00        BRK
  $A728  00        BRK
  $A729  00        BRK
  $A72A  00        BRK
  $A72B  00        BRK
  $A72C  00        BRK
  $A72D  00        BRK
  $A72E  00        BRK
  $A72F  00        BRK
  $A730  FD 01 FD  SBC $FD01,X
  $A733  01 FD     ORA ($FD,X)
  $A735  01 FD     ORA ($FD,X)
  $A737  01 FD     ORA ($FD,X)
  $A739  01 FD     ORA ($FD,X)
  $A73B  01 FD     ORA ($FD,X)
  $A73D  01 FD     ORA ($FD,X)
  $A73F  01 FF     ORA ($FF,X)
  $A741  FF        .db $FF
  $A742  E3        .db $E3
  $A743  E3        .db $E3
  $A744  E3        .db $E3
  $A745  E3        .db $E3
  $A746  FF        .db $FF
  $A747  FF        .db $FF
  $A748  FF        .db $FF
  $A749  FF        .db $FF
  $A74A  FB        .db $FB

L_A74B:
  $A74B  E3        .db $E3
  $A74C  FB        .db $FB
  $A74D  E3        .db $E3
  $A74E  FF        .db $FF
  $A74F  FF        .db $FF
  $A750  00        BRK
  $A751  F7        .db $F7
  $A752  30 B7     BMI $A70B
  $A754  B7        .db $B7
  $A755  B7        .db $B7
  $A756  B7        .db $B7
  $A757  80        .db $80
  $A758  00        BRK
  $A759  F7        .db $F7
  $A75A  30 B7     BMI $A713
  $A75C  B7        .db $B7
  $A75D  B7        .db $B7
  $A75E  B7        .db $B7
  $A75F  80        .db $80
  $A760  DD C1 DD  CMP $DDC1,X
  $A763  DD DD DD  CMP $DDDD,X
  $A766  DD DD DD  CMP $DDDD,X
  $A769  C1 DD     CMP ($DD,X)
  $A76B  DD DD DD  CMP $DDDD,X
  $A76E  DD DD 1C  CMP $1CDD,X
  $A771  FD 00 FF  SBC $FF00,X
  $A774  FF        .db $FF
  $A775  F3        .db $F3
  $A776  F3        .db $F3
  $A777  1F        .db $1F
  $A778  1C        .db $1C
  $A779  FD 00 FF  SBC $FF00,X
  $A77C  FF        .db $FF
  $A77D  FB        .db $FB
  $A77E  F3        .db $F3
  $A77F  1F        .db $1F
  $A780  00        BRK
  $A781  00        BRK
  $A782  00        BRK
  $A783  00        BRK
  $A784  00        BRK
  $A785  00        BRK
  $A786  00        BRK
  $A787  FF        .db $FF
  $A788  00        BRK
  $A789  00        BRK
  $A78A  00        BRK
  $A78B  00        BRK
  $A78C  00        BRK
  $A78D  00        BRK
  $A78E  00        BRK
  $A78F  FF        .db $FF
  $A790  00        BRK
  $A791  F7        .db $F7
  $A792  30 B7     BMI $A74B
  $A794  B7        .db $B7
  $A795  B7        .db $B7
  $A796  B7        .db $B7
  $A797  80        .db $80
  $A798  00        BRK
  $A799  F7        .db $F7
  $A79A  30 B7     BMI $A753
  $A79C  B7        .db $B7
  $A79D  B7        .db $B7
  $A79E  B7        .db $B7
  $A79F  80        .db $80
  $A7A0  00        BRK
  $A7A1  00        BRK
  $A7A2  00        BRK
  $A7A3  00        BRK
  $A7A4  00        BRK
  $A7A5  00        BRK
  $A7A6  00        BRK
  $A7A7  DD 00 00  CMP $0000,X
  $A7AA  00        BRK
  $A7AB  00        BRK
  $A7AC  00        BRK
  $A7AD  00        BRK
  $A7AE  00        BRK
  $A7AF  DD 1C FD  CMP $FD1C,X
  $A7B2  00        BRK
  $A7B3  FF        .db $FF
  $A7B4  FF        .db $FF
  $A7B5  F3        .db $F3
  $A7B6  F3        .db $F3
  $A7B7  1F        .db $1F
  $A7B8  1C        .db $1C
  $A7B9  FD 00 FF  SBC $FF00,X
  $A7BC  FF        .db $FF
  $A7BD  FB        .db $FB
  $A7BE  F3        .db $F3
  $A7BF  1F        .db $1F
  $A7C0  0B        .db $0B
  $A7C1  07        .db $07
  $A7C2  7F        .db $7F
  $A7C3  43        .db $43
  $A7C4  43        .db $43
  $A7C5  43        .db $43
  $A7C6  C3        .db $C3
  $A7C7  03        .db $03
  $A7C8  FA        .db $FA
  $A7C9  FE FE C2  INC $C2FE,X
  $A7CC  DE DE DE  DEC $DEDE,X
  $A7CF  1E 1F 13  ASL $131F,X
  $A7D2  13        .db $13
  $A7D3  13        .db $13
  $A7D4  13        .db $13
  $A7D5  13        .db $13
  $A7D6  13        .db $13
  $A7D7  17        .db $17
  $A7D8  FE F2 F6  INC $F6F2,X
  $A7DB  F6 F6     INC $F6,X
  $A7DD  F6 F6     INC $F6,X
  $A7DF  F6 48     INC $48,X
  $A7E1  50 40     BVC $A823
  $A7E3  40        RTI
  $A7E4  40        RTI
  $A7E5  40        RTI
  $A7E6  5F        .db $5F
  $A7E7  40        RTI
  $A7E8  CF        .db $CF
  $A7E9  DF        .db $DF
  $A7EA  DD D9 DF  CMP $DFD9,X
  $A7ED  DF        .db $DF
  $A7EE  DF        .db $DF
  $A7EF  C0 42     CPY #$42
  $A7F1  42        .db $42
  $A7F2  42        .db $42
  $A7F3  42        .db $42
  $A7F4  42        .db $42
  $A7F5  42        .db $42
  $A7F6  5E 40 DE  LSR $DE40,X
  $A7F9  DE DE DE  DEC $DEDE,X
  $A7FC  DE DE DE  DEC $DEDE,X
  $A7FF  C0 00     CPY #$00
  $A801  00        BRK
  $A802  00        BRK
  $A803  00        BRK
  $A804  00        BRK
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
  $A810  00        BRK
  $A811  00        BRK
  $A812  00        BRK
  $A813  00        BRK
  $A814  00        BRK
  $A815  00        BRK
  $A816  00        BRK
  $A817  00        BRK
  $A818  00        BRK
  $A819  00        BRK
  $A81A  00        BRK
  $A81B  00        BRK
  $A81C  00        BRK
  $A81D  00        BRK
  $A81E  00        BRK
  $A81F  00        BRK
  $A820  00        BRK
  $A821  00        BRK
  $A822  00        BRK

L_A823:
  $A823  00        BRK
  $A824  00        BRK
  $A825  00        BRK
  $A826  00        BRK
  $A827  00        BRK
  $A828  00        BRK
  $A829  00        BRK
  $A82A  00        BRK
  $A82B  00        BRK
  $A82C  00        BRK
  $A82D  00        BRK
  $A82E  00        BRK
  $A82F  00        BRK
  $A830  00        BRK
  $A831  00        BRK
  $A832  00        BRK
  $A833  00        BRK
  $A834  00        BRK
  $A835  00        BRK
  $A836  00        BRK
  $A837  00        BRK
  $A838  00        BRK
  $A839  00        BRK
  $A83A  00        BRK
  $A83B  00        BRK
  $A83C  00        BRK
  $A83D  00        BRK
  $A83E  00        BRK
  $A83F  00        BRK
  $A840  00        BRK
  $A841  00        BRK
  $A842  00        BRK
  $A843  00        BRK
  $A844  00        BRK
  $A845  00        BRK
  $A846  00        BRK
  $A847  00        BRK
  $A848  00        BRK
  $A849  00        BRK
  $A84A  00        BRK
  $A84B  00        BRK
  $A84C  00        BRK
  $A84D  00        BRK
  $A84E  00        BRK
  $A84F  00        BRK
  $A850  00        BRK
  $A851  00        BRK
  $A852  00        BRK
  $A853  00        BRK
  $A854  00        BRK
  $A855  00        BRK
  $A856  00        BRK
  $A857  00        BRK
  $A858  00        BRK
  $A859  00        BRK
  $A85A  00        BRK
  $A85B  00        BRK
  $A85C  00        BRK
  $A85D  00        BRK
  $A85E  00        BRK
  $A85F  00        BRK
  $A860  00        BRK
  $A861  00        BRK
  $A862  00        BRK
  $A863  00        BRK
  $A864  00        BRK
  $A865  00        BRK
  $A866  00        BRK
  $A867  00        BRK
  $A868  00        BRK
  $A869  00        BRK
  $A86A  00        BRK
  $A86B  00        BRK
  $A86C  00        BRK
  $A86D  00        BRK
  $A86E  00        BRK
  $A86F  00        BRK
  $A870  00        BRK
  $A871  00        BRK
  $A872  00        BRK
  $A873  00        BRK
  $A874  00        BRK
  $A875  00        BRK
  $A876  00        BRK
  $A877  00        BRK
  $A878  00        BRK
  $A879  00        BRK
  $A87A  00        BRK
  $A87B  00        BRK
  $A87C  00        BRK
  $A87D  00        BRK
  $A87E  00        BRK
  $A87F  00        BRK
  $A880  00        BRK
  $A881  00        BRK
  $A882  00        BRK
  $A883  00        BRK
  $A884  00        BRK
  $A885  00        BRK
  $A886  00        BRK
  $A887  00        BRK
  $A888  00        BRK
  $A889  00        BRK
  $A88A  00        BRK
  $A88B  00        BRK
  $A88C  00        BRK
  $A88D  00        BRK
  $A88E  00        BRK
  $A88F  00        BRK
  $A890  00        BRK
  $A891  00        BRK
  $A892  00        BRK
  $A893  00        BRK
  $A894  00        BRK
  $A895  00        BRK
  $A896  00        BRK
  $A897  00        BRK
  $A898  00        BRK
  $A899  00        BRK
  $A89A  00        BRK
  $A89B  00        BRK
  $A89C  00        BRK
  $A89D  00        BRK
  $A89E  00        BRK
  $A89F  00        BRK
  $A8A0  00        BRK
  $A8A1  00        BRK
  $A8A2  00        BRK
  $A8A3  00        BRK
  $A8A4  00        BRK
  $A8A5  00        BRK
  $A8A6  00        BRK
  $A8A7  00        BRK
  $A8A8  00        BRK
  $A8A9  00        BRK
  $A8AA  00        BRK
  $A8AB  00        BRK
  $A8AC  00        BRK
  $A8AD  00        BRK
  $A8AE  00        BRK
  $A8AF  00        BRK
  $A8B0  00        BRK
  $A8B1  00        BRK
  $A8B2  00        BRK
  $A8B3  00        BRK
  $A8B4  00        BRK
  $A8B5  00        BRK
  $A8B6  00        BRK
  $A8B7  00        BRK
  $A8B8  00        BRK
  $A8B9  00        BRK
  $A8BA  00        BRK
  $A8BB  00        BRK
  $A8BC  00        BRK
  $A8BD  00        BRK
  $A8BE  00        BRK
  $A8BF  00        BRK
  $A8C0  00        BRK
  $A8C1  00        BRK
  $A8C2  00        BRK
  $A8C3  00        BRK
  $A8C4  00        BRK
  $A8C5  00        BRK
  $A8C6  00        BRK
  $A8C7  00        BRK
  $A8C8  00        BRK
  $A8C9  00        BRK
  $A8CA  00        BRK
  $A8CB  00        BRK
  $A8CC  00        BRK
  $A8CD  00        BRK
  $A8CE  00        BRK
  $A8CF  00        BRK
  $A8D0  00        BRK
  $A8D1  00        BRK
  $A8D2  00        BRK
  $A8D3  00        BRK
  $A8D4  00        BRK
  $A8D5  00        BRK
  $A8D6  00        BRK
  $A8D7  00        BRK
  $A8D8  00        BRK
  $A8D9  00        BRK
  $A8DA  00        BRK
  $A8DB  00        BRK
  $A8DC  00        BRK
  $A8DD  00        BRK
  $A8DE  00        BRK
  $A8DF  00        BRK
  $A8E0  00        BRK
  $A8E1  00        BRK
  $A8E2  00        BRK
  $A8E3  00        BRK
  $A8E4  00        BRK
  $A8E5  00        BRK
  $A8E6  00        BRK
  $A8E7  00        BRK
  $A8E8  00        BRK
  $A8E9  00        BRK
  $A8EA  00        BRK
  $A8EB  00        BRK
  $A8EC  00        BRK
  $A8ED  00        BRK
  $A8EE  00        BRK
  $A8EF  00        BRK
  $A8F0  00        BRK
  $A8F1  00        BRK
  $A8F2  00        BRK
  $A8F3  00        BRK
  $A8F4  00        BRK
  $A8F5  00        BRK
  $A8F6  00        BRK
  $A8F7  00        BRK
  $A8F8  00        BRK
  $A8F9  00        BRK
  $A8FA  00        BRK
  $A8FB  00        BRK
  $A8FC  00        BRK
  $A8FD  00        BRK
  $A8FE  00        BRK
  $A8FF  00        BRK
  $A900  00        BRK
  $A901  00        BRK
  $A902  00        BRK
  $A903  00        BRK
  $A904  00        BRK
  $A905  00        BRK
  $A906  00        BRK
  $A907  00        BRK
  $A908  00        BRK
  $A909  00        BRK
  $A90A  00        BRK
  $A90B  00        BRK
  $A90C  00        BRK
  $A90D  00        BRK
  $A90E  00        BRK
  $A90F  00        BRK
  $A910  00        BRK
  $A911  00        BRK
  $A912  00        BRK
  $A913  00        BRK
  $A914  00        BRK
  $A915  00        BRK
  $A916  00        BRK
  $A917  00        BRK
  $A918  00        BRK
  $A919  00        BRK
  $A91A  00        BRK
  $A91B  00        BRK
  $A91C  00        BRK
  $A91D  00        BRK
  $A91E  00        BRK
  $A91F  00        BRK
  $A920  00        BRK
  $A921  00        BRK
  $A922  00        BRK
  $A923  00        BRK
  $A924  00        BRK
  $A925  00        BRK
  $A926  00        BRK
  $A927  00        BRK
  $A928  00        BRK
  $A929  00        BRK
  $A92A  00        BRK
  $A92B  00        BRK
  $A92C  00        BRK
  $A92D  00        BRK
  $A92E  00        BRK
  $A92F  00        BRK
  $A930  00        BRK
  $A931  00        BRK
  $A932  00        BRK
  $A933  00        BRK
  $A934  00        BRK
  $A935  00        BRK
  $A936  00        BRK
  $A937  00        BRK
  $A938  00        BRK
  $A939  00        BRK
  $A93A  00        BRK
  $A93B  00        BRK
  $A93C  00        BRK
  $A93D  00        BRK
  $A93E  00        BRK
  $A93F  00        BRK
  $A940  00        BRK
  $A941  00        BRK
  $A942  00        BRK
  $A943  00        BRK
  $A944  00        BRK
  $A945  00        BRK
  $A946  00        BRK
  $A947  00        BRK
  $A948  00        BRK
  $A949  00        BRK
  $A94A  00        BRK
  $A94B  00        BRK
  $A94C  00        BRK
  $A94D  00        BRK
  $A94E  00        BRK
  $A94F  00        BRK
  $A950  00        BRK
  $A951  00        BRK
  $A952  00        BRK
  $A953  00        BRK
  $A954  00        BRK
  $A955  00        BRK
  $A956  00        BRK
  $A957  00        BRK
  $A958  00        BRK
  $A959  00        BRK
  $A95A  00        BRK
  $A95B  00        BRK
  $A95C  00        BRK
  $A95D  00        BRK
  $A95E  00        BRK
  $A95F  00        BRK
  $A960  00        BRK
  $A961  00        BRK
  $A962  00        BRK
  $A963  00        BRK
  $A964  00        BRK
  $A965  00        BRK
  $A966  00        BRK
  $A967  00        BRK
  $A968  00        BRK
  $A969  00        BRK
  $A96A  00        BRK
  $A96B  00        BRK
  $A96C  00        BRK
  $A96D  00        BRK
  $A96E  00        BRK
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
  $A979  00        BRK
  $A97A  00        BRK
  $A97B  00        BRK
  $A97C  00        BRK
  $A97D  00        BRK
  $A97E  00        BRK
  $A97F  00        BRK
  $A980  00        BRK
  $A981  00        BRK
  $A982  00        BRK
  $A983  00        BRK
  $A984  00        BRK
  $A985  00        BRK
  $A986  00        BRK
  $A987  00        BRK
  $A988  00        BRK
  $A989  00        BRK
  $A98A  00        BRK
  $A98B  00        BRK
  $A98C  00        BRK
  $A98D  00        BRK
  $A98E  00        BRK
  $A98F  00        BRK
  $A990  00        BRK
  $A991  00        BRK
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
  $A9A6  00        BRK
  $A9A7  00        BRK
  $A9A8  00        BRK
  $A9A9  00        BRK
  $A9AA  00        BRK
  $A9AB  00        BRK
  $A9AC  00        BRK
  $A9AD  00        BRK
  $A9AE  00        BRK
  $A9AF  00        BRK
  $A9B0  00        BRK
  $A9B1  00        BRK
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
  $AA01  FF        .db $FF
  $AA02  FF        .db $FF
  $AA03  00        BRK
  $AA04  00        BRK
  $AA05  FF        .db $FF
  $AA06  FF        .db $FF
  $AA07  00        BRK
  $AA08  FF        .db $FF
  $AA09  00        BRK
  $AA0A  00        BRK
  $AA0B  FF        .db $FF
  $AA0C  FF        .db $FF
  $AA0D  FF        .db $FF
  $AA0E  FF        .db $FF
  $AA0F  00        BRK
  $AA10  00        BRK
  $AA11  FF        .db $FF
  $AA12  FF        .db $FF
  $AA13  00        BRK
  $AA14  00        BRK
  $AA15  FF        .db $FF
  $AA16  FF        .db $FF
  $AA17  00        BRK
  $AA18  FF        .db $FF
  $AA19  00        BRK
  $AA1A  00        BRK
  $AA1B  FF        .db $FF
  $AA1C  FF        .db $FF
  $AA1D  FF        .db $FF
  $AA1E  FF        .db $FF

L_AA1F:
  $AA1F  00        BRK
  $AA20  00        BRK
  $AA21  FF        .db $FF
  $AA22  FF        .db $FF
  $AA23  00        BRK
  $AA24  00        BRK
  $AA25  FF        .db $FF
  $AA26  FF        .db $FF
  $AA27  00        BRK
  $AA28  FF        .db $FF
  $AA29  00        BRK
  $AA2A  00        BRK
  $AA2B  FF        .db $FF
  $AA2C  FF        .db $FF
  $AA2D  FF        .db $FF
  $AA2E  FF        .db $FF
  $AA2F  00        BRK
  $AA30  00        BRK
  $AA31  FF        .db $FF
  $AA32  FF        .db $FF
  $AA33  00        BRK
  $AA34  00        BRK
  $AA35  FF        .db $FF
  $AA36  FF        .db $FF
  $AA37  00        BRK
  $AA38  FF        .db $FF
  $AA39  00        BRK
  $AA3A  00        BRK
  $AA3B  FF        .db $FF
  $AA3C  FF        .db $FF
  $AA3D  FF        .db $FF
  $AA3E  FF        .db $FF
  $AA3F  00        BRK
  $AA40  FF        .db $FF
  $AA41  FF        .db $FF
  $AA42  FF        .db $FF
  $AA43  FF        .db $FF
  $AA44  80        .db $80
  $AA45  B1 A2     LDA ($A2),Y
  $AA47  A2 00     LDX #$00
  $AA49  00        BRK
  $AA4A  FF        .db $FF
  $AA4B  00        BRK
  $AA4C  7F        .db $7F
  $AA4D  46 55     LSR $55
  $AA4F  55 A0     EOR $A0,X
  $AA51  A0 A0     LDY #$A0
  $AA53  A0 A0     LDY #$A0
  $AA55  80        .db $80
  $AA56  83        .db $83
  $AA57  FC        .db $FC
  $AA58  56 57     LSR $57,X
  $AA5A  57        .db $57
  $AA5B  57        .db $57
  $AA5C  57        .db $57
  $AA5D  47        .db $47
  $AA5E  7F        .db $7F
  $AA5F  FC        .db $FC
  $AA60  FF        .db $FF
  $AA61  FF        .db $FF
  $AA62  FF        .db $FF
  $AA63  FF        .db $FF
  $AA64  01 F9     ORA ($F9,X)
  $AA66  01 01     ORA ($01,X)
  $AA68  01 01     ORA ($01,X)
  $AA6A  FF        .db $FF
  $AA6B  01 FF     ORA ($FF,X)
  $AA6D  07        .db $07
  $AA6E  FB        .db $FB
  $AA6F  FB        .db $FB
  $AA70  01 01     ORA ($01,X)
  $AA72  01 01     ORA ($01,X)
  $AA74  01 01     ORA ($01,X)
  $AA76  C1 3F     CMP ($3F,X)
  $AA78  07        .db $07
  $AA79  FF        .db $FF
  $AA7A  FF        .db $FF
  $AA7B  E3        .db $E3
  $AA7C  FF        .db $FF
  $AA7D  E3        .db $E3
  $AA7E  FF        .db $FF
  $AA7F  3F        .db $3F
  $AA80  00        BRK
  $AA81  07        .db $07
  $AA82  08        PHP
  $AA83  4B        .db $4B
  $AA84  4B        .db $4B
  $AA85  4A        LSR
  $AA86  4B        .db $4B
  $AA87  0A        ASL
  $AA88  FF        .db $FF
  $AA89  F8        SED
  $AA8A  F0 93     BEQ $AA1F
  $AA8C  93        .db $93
  $AA8D  92        .db $92
  $AA8E  93        .db $93
  $AA8F  92        .db $92
  $AA90  0B        .db $0B
  $AA91  0B        .db $0B
  $AA92  0B        .db $0B
  $AA93  0B        .db $0B
  $AA94  0B        .db $0B
  $AA95  4B        .db $4B
  $AA96  4B        .db $4B
  $AA97  4A        LSR
  $AA98  F3        .db $F3
  $AA99  F3        .db $F3
  $AA9A  F3        .db $F3
  $AA9B  F3        .db $F3
  $AA9C  F3        .db $F3
  $AA9D  93        .db $93
  $AA9E  93        .db $93
  $AA9F  92        .db $92
  $AAA0  00        BRK
  $AAA1  FF        .db $FF
  $AAA2  00        BRK
  $AAA3  FF        .db $FF
  $AAA4  7F        .db $7F
  $AAA5  3C        .db $3C
  $AAA6  7B        .db $7B
  $AAA7  37        .db $37
  $AAA8  FF        .db $FF
  $AAA9  00        BRK
  $AAAA  00        BRK
  $AAAB  FF        .db $FF
  $AAAC  7F        .db $7F
  $AAAD  3C        .db $3C
  $AAAE  7B        .db $7B
  $AAAF  37        .db $37
  $AAB0  77        .db $77
  $AAB1  77        .db $77
  $AAB2  77        .db $77
  $AAB3  76 79     ROR $79,X
  $AAB5  64        .db $64
  $AAB6  1F        .db $1F
  $AAB7  00        BRK
  $AAB8  77        .db $77
  $AAB9  77        .db $77
  $AABA  77        .db $77
  $AABB  76 79     ROR $79,X
  $AABD  64        .db $64
  $AABE  1F        .db $1F
  $AABF  00        BRK
  $AAC0  00        BRK
  $AAC1  FF        .db $FF
  $AAC2  00        BRK
  $AAC3  FF        .db $FF
  $AAC4  FE 3F DF  INC $DF3F,X
  $AAC7  EF        .db $EF
  $AAC8  FF        .db $FF
  $AAC9  00        BRK
  $AACA  00        BRK
  $AACB  FF        .db $FF
  $AACC  FE 3F DF  INC $DF3F,X
  $AACF  EF        .db $EF
  $AAD0  E9 E7     SBC #$E7
  $AAD2  8F        .db $8F
  $AAD3  6F        .db $6F
  $AAD4  DF        .db $DF
  $AAD5  3F        .db $3F
  $AAD6  F6 00     INC $00,X
  $AAD8  E9 E7     SBC #$E7
  $AADA  8F        .db $8F
  $AADB  6F        .db $6F
  $AADC  DF        .db $DF
  $AADD  3F        .db $3F
  $AADE  F6 00     INC $00,X
  $AAE0  00        BRK
  $AAE1  F0 08     BEQ $AAEB
  $AAE3  E8        INX
  $AAE4  28        PLP
  $AAE5  A8        TAY
  $AAE6  A8        TAY
  $AAE7  E8        INX
  $AAE8  FF        .db $FF
  $AAE9  07        .db $07
  $AAEA  03        .db $03

L_AAEB:
  $AAEB  E3        .db $E3
  $AAEC  23        .db $23
  $AAED  A1 A1     LDA ($A1,X)
  $AAEF  E1 E8     SBC ($E8,X)
  $AAF1  E8        INX
  $AAF2  E8        INX
  $AAF3  E8        INX
  $AAF4  E8        INX
  $AAF5  E8        INX
  $AAF6  E8        INX
  $AAF7  28        PLP
  $AAF8  E1 E3     SBC ($E3,X)
  $AAFA  E3        .db $E3
  $AAFB  E3        .db $E3

L_AAFC:
  $AAFC  E3        .db $E3
  $AAFD  E1 E1     SBC ($E1,X)
  $AAFF  21 4B     AND ($4B,X)
  $AB01  0B        .db $0B
  $AB02  08        PHP
  $AB03  07        .db $07
  $AB04  00        BRK
  $AB05  00        BRK
  $AB06  02        .db $02
  $AB07  44        .db $44
  $AB08  93        .db $93
  $AB09  93        .db $93
  $AB0A  F0 F0     BEQ $AAFC
  $AB0C  F8        SED
  $AB0D  FF        .db $FF
  $AB0E  FC        .db $FC
  $AB0F  99 48 48  STA $4848,Y
  $AB12  48        PHA
  $AB13  08        PHP
  $AB14  08        PHP
  $AB15  04        .db $04
  $AB16  02        .db $02
  $AB17  00        BRK
  $AB18  93        .db $93
  $AB19  93        .db $93
  $AB1A  93        .db $93
  $AB1B  93        .db $93
  $AB1C  F3        .db $F3
  $AB1D  F9 FC FF  SBC $FFFC,Y
  $AB20  7F        .db $7F
  $AB21  FF        .db $FF
  $AB22  00        BRK
  $AB23  FF        .db $FF
  $AB24  00        BRK
  $AB25  00        BRK
  $AB26  00        BRK
  $AB27  28        PLP
  $AB28  7F        .db $7F
  $AB29  FF        .db $FF
  $AB2A  00        BRK
  $AB2B  00        BRK
  $AB2C  00        BRK
  $AB2D  FF        .db $FF
  $AB2E  FF        .db $FF
  $AB2F  A8        TAY
  $AB30  28        PLP
  $AB31  00        BRK
  $AB32  00        BRK
  $AB33  2A        ROL
  $AB34  2A        ROL
  $AB35  00        BRK
  $AB36  00        BRK
  $AB37  00        BRK
  $AB38  A8        TAY
  $AB39  FF        .db $FF
  $AB3A  FF        .db $FF
  $AB3B  AA        TAX
  $AB3C  AA        TAX
  $AB3D  FF        .db $FF
  $AB3E  FF        .db $FF
  $AB3F  FF        .db $FF
  $AB40  F6 FF     INC $FF,X
  $AB42  00        BRK
  $AB43  FF        .db $FF
  $AB44  00        BRK
  $AB45  00        BRK
  $AB46  20 00 F6  JSR $F600
  $AB49  FF        .db $FF
  $AB4A  00        BRK
  $AB4B  00        BRK
  $AB4C  00        BRK
  $AB4D  FF        .db $FF
  $AB4E  CF        .db $CF
  $AB4F  78        SEI
  $AB50  07        .db $07
  $AB51  0F        .db $0F
  $AB52  0C        .db $0C
  $AB53  0F        .db $0F
  $AB54  07        .db $07
  $AB55  00        BRK

L_AB56:
  $AB56  20 00 70  JSR $7000
  $AB59  E0 E0     CPX #$E0
  $AB5B  60        RTS
  $AB5C  70 F8     BVS $AB56
  $AB5E  CF        .db $CF
  $AB5F  FF        .db $FF
  $AB60  E8        INX
  $AB61  E8        INX
  $AB62  08        PHP
  $AB63  F0 00     BEQ $AB65

L_AB65:
  $AB65  00        BRK
  $AB66  20 10 E1  JSR $E110
  $AB69  E3        .db $E3
  $AB6A  03        .db $03
  $AB6B  03        .db $03
  $AB6C  07        .db $07
  $AB6D  FF        .db $FF
  $AB6E  CF        .db $CF
  $AB6F  E7        .db $E7
  $AB70  08        PHP
  $AB71  88        DEY
  $AB72  08        PHP
  $AB73  88        DEY
  $AB74  08        PHP
  $AB75  10 20     BPL $AB97
  $AB77  00        BRK
  $AB78  73        .db $73
  $AB79  33        .db $33
  $AB7A  33        .db $33
  $AB7B  33        .db $33
  $AB7C  73        .db $73
  $AB7D  E7        .db $E7
  $AB7E  CF        .db $CF
  $AB7F  FF        .db $FF
  $AB80  D7        .db $D7
  $AB81  F4        .db $F4
  $AB82  D4        .db $D4
  $AB83  D4        .db $D4
  $AB84  D4        .db $D4
  $AB85  F4        .db $F4
  $AB86  D7        .db $D7
  $AB87  D0 30     BNE $ABB9
  $AB89  F3        .db $F3
  $AB8A  33        .db $33
  $AB8B  33        .db $33
  $AB8C  33        .db $33
  $AB8D  F3        .db $F3

L_AB8E:
  $AB8E  37        .db $37
  $AB8F  30 D7     BMI $AB68
  $AB91  F4        .db $F4
  $AB92  D4        .db $D4
  $AB93  D4        .db $D4
  $AB94  D4        .db $D4
  $AB95  F4        .db $F4
  $AB96  D7        .db $D7

L_AB97:
  $AB97  D0 30     BNE $ABC9
  $AB99  F3        .db $F3
  $AB9A  33        .db $33
  $AB9B  33        .db $33
  $AB9C  33        .db $33
  $AB9D  F3        .db $F3
  $AB9E  37        .db $37
  $AB9F  30 ED     BMI $AB8E
  $ABA1  0F        .db $0F
  $ABA2  0D 0D 0D  ORA $0D0D
  $ABA5  0F        .db $0F
  $ABA6  ED 0D 03  SBC $030D
  $ABA9  EF        .db $EF
  $ABAA  E3        .db $E3
  $ABAB  E3        .db $E3
  $ABAC  E3        .db $E3
  $ABAD  EF        .db $EF
  $ABAE  E3        .db $E3
  $ABAF  03        .db $03
  $ABB0  ED 0F 0D  SBC $0D0F
  $ABB3  0D 0D 0F  ORA $0F0D
  $ABB6  ED 0D 03  SBC $030D

L_ABB9:
  $ABB9  EF        .db $EF
  $ABBA  E3        .db $E3
  $ABBB  E3        .db $E3
  $ABBC  E3        .db $E3
  $ABBD  EF        .db $EF
  $ABBE  E3        .db $E3
  $ABBF  03        .db $03
  $ABC0  0C        .db $0C
  $ABC1  00        BRK
  $ABC2  3F        .db $3F
  $ABC3  39 3A B7  AND $B73A,Y

L_ABC6:
  $ABC6  B7        .db $B7
  $ABC7  2F        .db $2F
  $ABC8  E1 80     SBC ($80,X)
  $ABCA  BF        .db $BF
  $ABCB  B9 3A 37  LDA $373A,Y
  $ABCE  37        .db $37
  $ABCF  2F        .db $2F
  $ABD0  3F        .db $3F
  $ABD1  00        BRK
  $ABD2  0C        .db $0C
  $ABD3  00        BRK
  $ABD4  00        BRK
  $ABD5  57        .db $57
  $ABD6  00        BRK
  $ABD7  00        BRK
  $ABD8  BF        .db $BF
  $ABD9  80        .db $80
  $ABDA  E1 FF     SBC ($FF,X)
  $ABDC  00        BRK
  $ABDD  00        BRK
  $ABDE  57        .db $57
  $ABDF  00        BRK
  $ABE0  30 00     BMI $ABE2

L_ABE2:
  $ABE2  FC        .db $FC
  $ABE3  F4        .db $F4
  $ABE4  EC 6D 5D  CPX $5D6D
  $ABE7  9C        .db $9C
  $ABE8  87        .db $87
  $ABE9  01 FD     ORA ($FD,X)
  $ABEB  F5 EC     SBC $EC,X
  $ABED  6C 5C 9C  JMP ($9C5C)
  $ABF0  FC        .db $FC
  $ABF1  00        BRK
  $ABF2  30 00     BMI $ABF4

L_ABF4:
  $ABF4  00        BRK
  $ABF5  EA        NOP
  $ABF6  00        BRK
  $ABF7  00        BRK
  $ABF8  FD 01 87  SBC $8701,X
  $ABFB  FF        .db $FF
  $ABFC  00        BRK
  $ABFD  00        BRK
  $ABFE  EA        NOP
  $ABFF  00        BRK
  $AC00  00        BRK
  $AC01  33        .db $33
  $AC02  00        BRK
  $AC03  33        .db $33
  $AC04  00        BRK
  $AC05  33        .db $33
  $AC06  00        BRK
  $AC07  33        .db $33
  $AC08  00        BRK
  $AC09  55 00     EOR $00,X
  $AC0B  55 00     EOR $00,X
  $AC0D  55 00     EOR $00,X
  $AC0F  55 00     EOR $00,X
  $AC11  DD DD D9  CMP $D9DD,X
  $AC14  D1 DD     CMP ($DD),Y
  $AC16  DD DD 00  CMP $00DD,X
  $AC19  E2        .db $E2
  $AC1A  E2        .db $E2
  $AC1B  E2        .db $E2
  $AC1C  E2        .db $E2
  $AC1D  E2        .db $E2
  $AC1E  E2        .db $E2
  $AC1F  E2        .db $E2
  $AC20  03        .db $03
  $AC21  00        BRK
  $AC22  03        .db $03
  $AC23  00        BRK
  $AC24  5D 5D 5D  EOR $5D5D,X
  $AC27  5D 04 00  EOR $0004,X
  $AC2A  04        .db $04
  $AC2B  00        BRK
  $AC2C  62        .db $62
  $AC2D  62        .db $62
  $AC2E  62        .db $62
  $AC2F  62        .db $62
  $AC30  00        BRK
  $AC31  91 90     STA ($90),Y
  $AC33  90 91     BCC $ABC6
  $AC35  80        .db $80
  $AC36  87        .db $87
  $AC37  00        BRK
  $AC38  00        BRK
  $AC39  6E 60 60  ROR $6060
  $AC3C  6E 60 04  ROR $0460
  $AC3F  00        BRK
  $AC40  20 00 20  JSR $2000
  $AC43  00        BRK
  $AC44  56 56     LSR $56,X

L_AC46:
  $AC46  56 56     LSR $56,X
  $AC48  E0 00     CPX #$00
  $AC4A  E0 00     CPX #$00
  $AC4C  FE FE FE  INC $FEFE,X
  $AC4F  FE 00 11  INC $1100,X
  $AC52  01 01     ORA ($01,X)
  $AC54  11 01     ORA ($01),Y
  $AC56  21 00     AND ($00,X)
  $AC58  00        BRK
  $AC59  FF        .db $FF
  $AC5A  0F        .db $0F
  $AC5B  0F        .db $0F
  $AC5C  FF        .db $FF
  $AC5D  07        .db $07
  $AC5E  E1 00     SBC ($00,X)
  $AC60  00        BRK
  $AC61  66 00     ROR $00
  $AC63  66 00     ROR $00
  $AC65  66 00     ROR $00
  $AC67  66 00     ROR $00
  $AC69  AA        TAX
  $AC6A  00        BRK
  $AC6B  AA        TAX
  $AC6C  00        BRK
  $AC6D  AA        TAX
  $AC6E  00        BRK
  $AC6F  AA        TAX
  $AC70  00        BRK
  $AC71  2E 2E 2E  ROL $2E2E
  $AC74  0E 2E 2E  ASL $2E2E
  $AC77  2E 00 FE  ROL $FE00
  $AC7A  FE CE CE  INC $CECE,X
  $AC7D  FE FE FE  INC $FEFE,X
  $AC80  00        BRK
  $AC81  C1 DD     CMP ($DD,X)
  $AC83  DD DD DC  CMP $DCDD,X
  $AC86  00        BRK
  $AC87  0A        ASL
  $AC88  00        BRK
  $AC89  E0 E2     CPX #$E2
  $AC8B  E2        .db $E2
  $AC8C  E2        .db $E2
  $AC8D  E2        .db $E2
  $AC8E  00        BRK
  $AC8F  16 00     ASL $00,X
  $AC91  DD DD D9  CMP $D9DD,X
  $AC94  D1 DD     CMP ($DD),Y
  $AC96  DD DD 00  CMP $00DD,X
  $AC99  E2        .db $E2
  $AC9A  E2        .db $E2
  $AC9B  E2        .db $E2
  $AC9C  E2        .db $E2
  $AC9D  E2        .db $E2
  $AC9E  E2        .db $E2
  $AC9F  E2        .db $E2
  $ACA0  00        BRK
  $ACA1  91 91     STA ($91),Y
  $ACA3  91 80     STA ($80),Y
  $ACA5  34        .db $34
  $ACA6  B4 B4     LDY $B4,X
  $ACA8  00        BRK
  $ACA9  6E 6E 6E  ROR $6E6E
  $ACAC  00        BRK
  $ACAD  0B        .db $0B
  $ACAE  CB        .db $CB
  $ACAF  CB        .db $CB
  $ACB0  00        BRK
  $ACB1  91 90     STA ($90),Y
  $ACB3  90 91     BCC $AC46
  $ACB5  80        .db $80
  $ACB6  87        .db $87
  $ACB7  00        BRK
  $ACB8  00        BRK
  $ACB9  6E 60 60  ROR $6060
  $ACBC  6E 60 04  ROR $0460
  $ACBF  00        BRK
  $ACC0  00        BRK
  $ACC1  11 11     ORA ($11),Y
  $ACC3  11 01     ORA ($01),Y
  $ACC5  A8        TAY
  $ACC6  AE AE 00  LDX $00AE
  $ACC9  FF        .db $FF
  $ACCA  FF        .db $FF
  $ACCB  FF        .db $FF
  $ACCC  03        .db $03
  $ACCD  F8        SED
  $ACCE  FE FE 00  INC $00FE,X
  $ACD1  11 01     ORA ($01),Y
  $ACD3  01 11     ORA ($11,X)
  $ACD5  01 41     ORA ($41,X)
  $ACD7  00        BRK
  $ACD8  00        BRK
  $ACD9  FF        .db $FF
  $ACDA  0F        .db $0F
  $ACDB  0F        .db $0F
  $ACDC  FF        .db $FF
  $ACDD  07        .db $07
  $ACDE  C1 00     CMP ($00,X)
  $ACE0  00        BRK
  $ACE1  06 2E     ASL $2E
  $ACE3  2E 2E 2E  ROL $2E2E
  $ACE6  00        BRK
  $ACE7  28        PLP
  $ACE8  00        BRK
  $ACE9  86 FE     STX $FE
  $ACEB  FE FE FE  INC $FEFE,X
  $ACEE  00        BRK
  $ACEF  58        CLI
  $ACF0  00        BRK
  $ACF1  2E 2E 2E  ROL $2E2E
  $ACF4  0E 2E 2E  ASL $2E2E
  $ACF7  2E 00 FE  ROL $FE00
  $ACFA  FE CE CE  INC $CECE,X
  $ACFD  FE FE FE  INC $FEFE,X
  $AD00  FF        .db $FF
  $AD01  FF        .db $FF
  $AD02  FF        .db $FF
  $AD03  FF        .db $FF
  $AD04  00        BRK
  $AD05  3C        .db $3C
  $AD06  38        SEC
  $AD07  20 00 00  JSR $0000
  $AD0A  FF        .db $FF
  $AD0B  00        BRK
  $AD0C  FF        .db $FF
  $AD0D  C3        .db $C3
  $AD0E  C3        .db $C3
  $AD0F  DB        .db $DB
  $AD10  20 20 20  JSR $2020
  $AD13  20 20 20  JSR $2020
  $AD16  20 20 DB  JSR $DB20
  $AD19  DB        .db $DB
  $AD1A  DB        .db $DB
  $AD1B  DB        .db $DB
  $AD1C  DB        .db $DB
  $AD1D  DB        .db $DB
  $AD1E  DB        .db $DB
  $AD1F  DB        .db $DB
  $AD20  FF        .db $FF
  $AD21  FF        .db $FF
  $AD22  FF        .db $FF
  $AD23  FF        .db $FF
  $AD24  00        BRK
  $AD25  3C        .db $3C

L_AD26:
  $AD26  38        SEC
  $AD27  20 00 00  JSR $0000
  $AD2A  FF        .db $FF
  $AD2B  00        BRK
  $AD2C  FF        .db $FF
  $AD2D  C3        .db $C3

L_AD2E:
  $AD2E  C3        .db $C3
  $AD2F  DB        .db $DB
  $AD30  20 20 20  JSR $2020
  $AD33  20 20 20  JSR $2020
  $AD36  20 20 DB  JSR $DB20
  $AD39  DB        .db $DB
  $AD3A  DB        .db $DB
  $AD3B  DB        .db $DB
  $AD3C  DB        .db $DB
  $AD3D  DB        .db $DB
  $AD3E  DB        .db $DB
  $AD3F  DB        .db $DB
  $AD40  00        BRK
  $AD41  61 31     ADC ($31,X)
  $AD43  19 09 01  ORA $0109,Y
  $AD46  FE 03 00  INC $0003,X
  $AD49  63        .db $63
  $AD4A  33        .db $33
  $AD4B  1B        .db $1B
  $AD4C  0B        .db $0B
  $AD4D  03        .db $03
  $AD4E  FD FC 02  SBC $02FC,X
  $AD51  FE 02 1E  INC $1E02,X
  $AD54  0A        ASL
  $AD55  12        .db $12
  $AD56  22        .db $22
  $AD57  42        .db $42
  $AD58  FC        .db $FC
  $AD59  FD 01 1D  SBC $1D01,X
  $AD5C  39 71 E1  AND $E171,Y
  $AD5F  C1 00     CMP ($00,X)
  $AD61  C6 CC     DEC $CC
  $AD63  D8        CLD
  $AD64  D0 C0     BNE $AD26
  $AD66  5F        .db $5F
  $AD67  40        RTI
  $AD68  00        BRK
  $AD69  C6 CC     DEC $CC
  $AD6B  D8        CLD
  $AD6C  D0 C0     BNE $AD2E
  $AD6E  DF        .db $DF
  $AD6F  5F        .db $5F
  $AD70  40        RTI
  $AD71  5F        .db $5F
  $AD72  40        RTI
  $AD73  58        CLI
  $AD74  50 48     BVC $ADBE
  $AD76  45 42     EOR $42
  $AD78  5F        .db $5F
  $AD79  DF        .db $DF
  $AD7A  C0 D8     CPY #$D8
  $AD7C  DC        .db $DC
  $AD7D  CE C7 C3  DEC $C3C7
  $AD80  FF        .db $FF
  $AD81  FF        .db $FF
  $AD82  C0 C7     CPY #$C7
  $AD84  C8        INY
  $AD85  D7        .db $D7
  $AD86  D7        .db $D7
  $AD87  D7        .db $D7
  $AD88  00        BRK
  $AD89  00        BRK
  $AD8A  3F        .db $3F
  $AD8B  38        SEC
  $AD8C  30 27     BMI $ADB5
  $AD8E  27        .db $27
  $AD8F  27        .db $27
  $AD90  C8        INY
  $AD91  C7        .db $C7
  $AD92  C0 C0     CPY #$C0
  $AD94  80        .db $80
  $AD95  B0 B0     BCS $AD47
  $AD97  A1 30     LDA ($30,X)
  $AD99  38        SEC

L_AD9A:
  $AD9A  3F        .db $3F
  $AD9B  3F        .db $3F
  $AD9C  07        .db $07
  $AD9D  06 06     ASL $06
  $AD9F  0C        .db $0C
  $ADA0  FF        .db $FF
  $ADA1  FF        .db $FF
  $ADA2  00        BRK
  $ADA3  18        CLC
  $ADA4  80        .db $80
  $ADA5  58        CLI
  $ADA6  40        RTI
  $ADA7  40        RTI
  $ADA8  00        BRK
  $ADA9  00        BRK
  $ADAA  FF        .db $FF
  $ADAB  E3        .db $E3
  $ADAC  63        .db $63
  $ADAD  23        .db $23
  $ADAE  23        .db $23
  $ADAF  3C        .db $3C
  $ADB0  83        .db $83
  $ADB1  0C        .db $0C
  $ADB2  13        .db $13
  $ADB3  2F        .db $2F
  $ADB4  5B        .db $5B

L_ADB5:
  $ADB5  B9 BA 79  LDA $79BA,Y
  $ADB8  70 E0     BVS $AD9A
  $ADBA  C3        .db $C3
  $ADBB  8F        .db $8F
  $ADBC  1B        .db $1B
  $ADBD  39 3A 79  AND $793A,Y
  $ADC0  FF        .db $FF
  $ADC1  FF        .db $FF
  $ADC2  00        BRK
  $ADC3  C0 00     CPY #$00
  $ADC5  00        BRK
  $ADC6  00        BRK
  $ADC7  00        BRK
  $ADC8  00        BRK
  $ADC9  00        BRK
  $ADCA  FF        .db $FF
  $ADCB  18        CLC
  $ADCC  1F        .db $1F
  $ADCD  F8        SED
  $ADCE  FF        .db $FF
  $ADCF  0E F0 0C  ASL $0CF0
  $ADD2  F2        .db $F2
  $ADD3  FD DE DB  SBC $DBDE,X
  $ADD6  BB        .db $BB
  $ADD7  B7        .db $B7
  $ADD8  03        .db $03
  $ADD9  01 F0     ORA ($F0,X)
  $ADDB  FC        .db $FC
  $ADDC  DE DB BB  DEC $BBDB,X
  $ADDF  B7        .db $B7
  $ADE0  FE FC 00  INC $00FC,X
  $ADE3  00        BRK
  $ADE4  00        BRK
  $ADE5  00        BRK
  $ADE6  00        BRK
  $ADE7  00        BRK
  $ADE8  00        BRK
  $ADE9  00        BRK
  $ADEA  FC        .db $FC
  $ADEB  0C        .db $0C
  $ADEC  FC        .db $FC
  $ADED  0C        .db $0C
  $ADEE  FC        .db $FC
  $ADEF  0C        .db $0C
  $ADF0  00        BRK
  $ADF1  00        BRK
  $ADF2  00        BRK
  $ADF3  00        BRK
  $ADF4  80        .db $80
  $ADF5  40        RTI
  $ADF6  40        RTI
  $ADF7  A0 FC     LDY #$FC
  $ADF9  8C FC 7C  STY $7CFC
  $ADFC  30 16     BMI $AE14
  $ADFE  16 8A     ASL $8A,X
  $AE00  DD DD DD  CMP $DDDD,X
  $AE03  D9 D1 DD  CMP $DDD1,Y
  $AE06  DD DD E2  CMP $E2DD,X
  $AE09  E2        .db $E2
  $AE0A  E2        .db $E2
  $AE0B  E2        .db $E2
  $AE0C  E2        .db $E2
  $AE0D  E2        .db $E2
  $AE0E  E2        .db $E2
  $AE0F  E2        .db $E2
  $AE10  00        BRK
  $AE11  33        .db $33
  $AE12  00        BRK
  $AE13  33        .db $33

L_AE14:
  $AE14  00        BRK
  $AE15  33        .db $33
  $AE16  00        BRK
  $AE17  33        .db $33
  $AE18  00        BRK
  $AE19  55 00     EOR $00,X
  $AE1B  55 00     EOR $00,X
  $AE1D  55 00     EOR $00,X
  $AE1F  55 00     EOR $00,X
  $AE21  87        .db $87
  $AE22  80        .db $80
  $AE23  91 91     STA ($91),Y
  $AE25  91 91     STA ($91),Y
  $AE27  91 00     STA ($00),Y
  $AE29  04        .db $04
  $AE2A  60        RTS
  $AE2B  6E 6E 6E  ROR $6E6E
  $AE2E  6E 6E 00  ROR $006E
  $AE31  5D 5D 5D  EOR $5D5D,X
  $AE34  5D 00 03  EOR $0300,X
  $AE37  00        BRK
  $AE38  00        BRK
  $AE39  62        .db $62
  $AE3A  62        .db $62
  $AE3B  62        .db $62
  $AE3C  62        .db $62
  $AE3D  00        BRK
  $AE3E  04        .db $04
  $AE3F  00        BRK
  $AE40  00        BRK
  $AE41  21 01     AND ($01,X)
  $AE43  11 11     ORA ($11),Y
  $AE45  11 11     ORA ($11),Y
  $AE47  11 00     ORA ($00),Y
  $AE49  E1 07     SBC ($07,X)
  $AE4B  FF        .db $FF
  $AE4C  FF        .db $FF
  $AE4D  FF        .db $FF
  $AE4E  FF        .db $FF
  $AE4F  FF        .db $FF
  $AE50  00        BRK
  $AE51  56 56     LSR $56,X
  $AE53  56 56     LSR $56,X
  $AE55  00        BRK
  $AE56  20 00 00  JSR $0000
  $AE59  FE FE FE  INC $FEFE,X
  $AE5C  FE 00 E0  INC $E000,X
  $AE5F  00        BRK
  $AE60  2E 2E 2E  ROL $2E2E
  $AE63  2E 0E 2E  ROL $2E0E
  $AE66  2E 2E FE  ROL $FE2E
  $AE69  FE FE CE  INC $CEFE,X
  $AE6C  CE FE FE  DEC $FEFE
  $AE6F  FE 00 66  INC $6600,X
  $AE72  00        BRK
  $AE73  66 00     ROR $00
  $AE75  66 00     ROR $00
  $AE77  66 00     ROR $00
  $AE79  AA        TAX
  $AE7A  00        BRK
  $AE7B  AA        TAX
  $AE7C  00        BRK
  $AE7D  AA        TAX
  $AE7E  00        BRK
  $AE7F  AA        TAX
  $AE80  00        BRK
  $AE81  33        .db $33
  $AE82  00        BRK
  $AE83  33        .db $33
  $AE84  00        BRK
  $AE85  33        .db $33
  $AE86  00        BRK
  $AE87  33        .db $33
  $AE88  00        BRK
  $AE89  55 00     EOR $00,X
  $AE8B  55 00     EOR $00,X
  $AE8D  55 00     EOR $00,X
  $AE8F  55 00     EOR $00,X
  $AE91  33        .db $33
  $AE92  00        BRK
  $AE93  33        .db $33
  $AE94  00        BRK
  $AE95  33        .db $33
  $AE96  00        BRK
  $AE97  33        .db $33
  $AE98  00        BRK
  $AE99  55 00     EOR $00,X
  $AE9B  55 00     EOR $00,X
  $AE9D  55 00     EOR $00,X
  $AE9F  55 03     EOR $03,X
  $AEA1  00        BRK
  $AEA2  03        .db $03
  $AEA3  00        BRK
  $AEA4  03        .db $03
  $AEA5  00        BRK
  $AEA6  03        .db $03
  $AEA7  00        BRK
  $AEA8  04        .db $04
  $AEA9  00        BRK
  $AEAA  04        .db $04
  $AEAB  00        BRK
  $AEAC  04        .db $04
  $AEAD  00        BRK
  $AEAE  04        .db $04
  $AEAF  00        BRK
  $AEB0  03        .db $03
  $AEB1  00        BRK
  $AEB2  03        .db $03
  $AEB3  00        BRK
  $AEB4  03        .db $03
  $AEB5  00        BRK
  $AEB6  03        .db $03
  $AEB7  00        BRK
  $AEB8  04        .db $04
  $AEB9  00        BRK
  $AEBA  04        .db $04
  $AEBB  00        BRK
  $AEBC  04        .db $04
  $AEBD  00        BRK
  $AEBE  04        .db $04
  $AEBF  00        BRK
  $AEC0  20 00 20  JSR $2000
  $AEC3  00        BRK
  $AEC4  20 00 20  JSR $2000
  $AEC7  00        BRK
  $AEC8  E0 00     CPX #$00
  $AECA  E0 00     CPX #$00
  $AECC  E0 00     CPX #$00
  $AECE  E0 00     CPX #$00
  $AED0  20 00 20  JSR $2000
  $AED3  00        BRK
  $AED4  20 00 20  JSR $2000
  $AED7  00        BRK
  $AED8  E0 00     CPX #$00
  $AEDA  E0 00     CPX #$00
  $AEDC  E0 00     CPX #$00
  $AEDE  E0 00     CPX #$00
  $AEE0  00        BRK
  $AEE1  66 00     ROR $00
  $AEE3  66 00     ROR $00
  $AEE5  66 00     ROR $00
  $AEE7  66 00     ROR $00
  $AEE9  AA        TAX
  $AEEA  00        BRK
  $AEEB  AA        TAX
  $AEEC  00        BRK
  $AEED  AA        TAX
  $AEEE  00        BRK
  $AEEF  AA        TAX
  $AEF0  00        BRK
  $AEF1  66 00     ROR $00
  $AEF3  66 00     ROR $00
  $AEF5  66 00     ROR $00
  $AEF7  66 00     ROR $00
  $AEF9  AA        TAX
  $AEFA  00        BRK
  $AEFB  AA        TAX
  $AEFC  00        BRK
  $AEFD  AA        TAX
  $AEFE  00        BRK
  $AEFF  AA        TAX
  $AF00  20 20 20  JSR $2020
  $AF03  20 20 20  JSR $2020
  $AF06  20 20 DB  JSR $DB20
  $AF09  DB        .db $DB
  $AF0A  DB        .db $DB
  $AF0B  DB        .db $DB
  $AF0C  DB        .db $DB
  $AF0D  DB        .db $DB
  $AF0E  DB        .db $DB
  $AF0F  DB        .db $DB
  $AF10  20 20 00  JSR $0020
  $AF13  00        BRK
  $AF14  00        BRK
  $AF15  00        BRK
  $AF16  FF        .db $FF
  $AF17  FF        .db $FF
  $AF18  DB        .db $DB
  $AF19  C3        .db $C3
  $AF1A  C3        .db $C3
  $AF1B  FF        .db $FF
  $AF1C  FF        .db $FF
  $AF1D  00        BRK
  $AF1E  FF        .db $FF
  $AF1F  FF        .db $FF
  $AF20  20 20 20  JSR $2020
  $AF23  20 20 20  JSR $2020
  $AF26  20 20 DB  JSR $DB20
  $AF29  DB        .db $DB
  $AF2A  DB        .db $DB
  $AF2B  DB        .db $DB
  $AF2C  DB        .db $DB
  $AF2D  DB        .db $DB
  $AF2E  DB        .db $DB
  $AF2F  DB        .db $DB
  $AF30  20 20 00  JSR $0020
  $AF33  00        BRK
  $AF34  00        BRK
  $AF35  00        BRK
  $AF36  FF        .db $FF
  $AF37  FF        .db $FF
  $AF38  DB        .db $DB
  $AF39  C3        .db $C3
  $AF3A  C3        .db $C3
  $AF3B  FF        .db $FF
  $AF3C  FF        .db $FF
  $AF3D  00        BRK
  $AF3E  FF        .db $FF
  $AF3F  FF        .db $FF
  $AF40  82        .db $82
  $AF41  02        .db $02
  $AF42  42        .db $42
  $AF43  22        .db $22
  $AF44  12        .db $12
  $AF45  0A        ASL
  $AF46  FE 03 81  INC $8103,X
  $AF49  61 71     ADC ($71,X)
  $AF4B  39 1D 0D  AND $0D1D,Y
  $AF4E  01 FC     ORA ($FC,X)
  $AF50  02        .db $02
  $AF51  FE 02 1E  INC $1E02,X
  $AF54  0A        ASL
  $AF55  12        .db $12
  $AF56  22        .db $22
  $AF57  42        .db $42
  $AF58  FC        .db $FC
  $AF59  FD 01 1D  SBC $1D01,X
  $AF5C  39 71 E1  AND $E171,Y
  $AF5F  C1 40     CMP ($40,X)
  $AF61  41 42     EOR ($42,X)
  $AF63  44        .db $44
  $AF64  48        PHA
  $AF65  40        RTI
  $AF66  5F        .db $5F
  $AF67  40        RTI
  $AF68  C3        .db $C3
  $AF69  C7        .db $C7
  $AF6A  CE DC D8  DEC $D8DC
  $AF6D  C0 C0     CPY #$C0
  $AF6F  5F        .db $5F
  $AF70  40        RTI
  $AF71  5F        .db $5F
  $AF72  40        RTI
  $AF73  58        CLI
  $AF74  50 48     BVC $AFBE
  $AF76  45 42     EOR $42
  $AF78  5F        .db $5F
  $AF79  DF        .db $DF
  $AF7A  C0 D8     CPY #$D8
  $AF7C  DC        .db $DC
  $AF7D  CE C7 C3  DEC $C3C7
  $AF80  A1 A1     LDA ($A1,X)
  $AF82  A1 A1     LDA ($A1,X)
  $AF84  A1 B0     LDA ($B0,X)
  $AF86  B0 80     BCS $AF08
  $AF88  0C        .db $0C
  $AF89  0C        .db $0C
  $AF8A  0C        .db $0C
  $AF8B  0C        .db $0C
  $AF8C  0C        .db $0C
  $AF8D  06 06     ASL $06
  $AF8F  07        .db $07
  $AF90  C0 C0     CPY #$C0
  $AF92  D8        CLD
  $AF93  C0 C3     CPY #$C3
  $AF95  C0 C0     CPY #$C0
  $AF97  80        .db $80
  $AF98  3F        .db $3F
  $AF99  24 24     BIT $24
  $AF9B  24 24     BIT $24
  $AF9D  24 3F     BIT $3F
  $AF9F  00        BRK
  $AFA0  7B        .db $7B
  $AFA1  7F        .db $7F
  $AFA2  40        RTI
  $AFA3  72        .db $72
  $AFA4  7C        .db $7C
  $AFA5  BD BB 5B  LDA $5BBB,X
  $AFA8  7B        .db $7B
  $AFA9  7F        .db $7F
  $AFAA  40        RTI
  $AFAB  72        .db $72
  $AFAC  7C        .db $7C
  $AFAD  3D 3B 1B  AND $1B3B,X
  $AFB0  2F        .db $2F
  $AFB1  13        .db $13
  $AFB2  0C        .db $0C
  $AFB3  03        .db $03
  $AFB4  00        BRK
  $AFB5  00        BRK
  $AFB6  00        BRK
  $AFB7  00        BRK
  $AFB8  8F        .db $8F
  $AFB9  C3        .db $C3
  $AFBA  E0 F0     CPX #$F0
  $AFBC  FC        .db $FC
  $AFBD  FF        .db $FF

L_AFBE:
  $AFBE  FF        .db $FF
  $AFBF  00        BRK
  $AFC0  77        .db $77
  $AFC1  6F        .db $6F
  $AFC2  00        BRK
  $AFC3  DF        .db $DF
  $AFC4  DF        .db $DF
  $AFC5  3F        .db $3F
  $AFC6  8F        .db $8F
  $AFC7  72        .db $72
  $AFC8  77        .db $77
  $AFC9  6F        .db $6F
  $AFCA  00        BRK
  $AFCB  DF        .db $DF
  $AFCC  DF        .db $DF
  $AFCD  3F        .db $3F
  $AFCE  8F        .db $8F
  $AFCF  72        .db $72
  $AFD0  7D F2 0C  ADC $0CF2,X
  $AFD3  F0 01     BEQ $AFD6
  $AFD5  00        BRK

L_AFD6:
  $AFD6  00        BRK
  $AFD7  00        BRK
  $AFD8  7C        .db $7C
  $AFD9  F0 01     BEQ $AFDC
  $AFDB  03        .db $03

L_AFDC:
  $AFDC  0E FE FF  ASL $FFFE
  $AFDF  00        BRK
  $AFE0  A0 A0     LDY #$A0
  $AFE2  A0 A0     LDY #$A0
  $AFE4  A0 40     LDY #$40
  $AFE6  40        RTI
  $AFE7  80        .db $80
  $AFE8  8A        TXA
  $AFE9  8A        TXA
  $AFEA  8A        TXA
  $AFEB  8A        TXA
  $AFEC  8A        TXA
  $AFED  16 16     ASL $16,X
  $AFEF  30 00     BMI $AFF1

L_AFF1:
  $AFF1  20 00 00  JSR $0000
  $AFF4  20 00 00  JSR $0000
  $AFF7  00        BRK
  $AFF8  7C        .db $7C
  $AFF9  CC CC FC  CPY $FCCC
  $AFFC  4C 4C FC  JMP $FC4C
  $AFFF  00        BRK
  $B000  00        BRK
  $B001  3F        .db $3F
  $B002  7F        .db $7F
  $B003  60        RTS
  $B004  6F        .db $6F
  $B005  6F        .db $6F
  $B006  6F        .db $6F
  $B007  6F        .db $6F
  $B008  00        BRK
  $B009  00        BRK
  $B00A  00        BRK
  $B00B  00        BRK
  $B00C  00        BRK
  $B00D  00        BRK
  $B00E  00        BRK
  $B00F  00        BRK
  $B010  6C 6F 6F  JMP ($6F6F)
  $B013  6F        .db $6F
  $B014  6F        .db $6F
  $B015  6F        .db $6F
  $B016  6F        .db $6F
  $B017  6F        .db $6F
  $B018  00        BRK
  $B019  00        BRK
  $B01A  00        BRK
  $B01B  00        BRK
  $B01C  00        BRK
  $B01D  00        BRK
  $B01E  00        BRK
  $B01F  00        BRK
  $B020  00        BRK
  $B021  FF        .db $FF
  $B022  FF        .db $FF
  $B023  00        BRK
  $B024  FF        .db $FF
  $B025  FF        .db $FF
  $B026  7F        .db $7F
  $B027  7F        .db $7F
  $B028  00        BRK
  $B029  00        BRK
  $B02A  00        BRK
  $B02B  00        BRK
  $B02C  00        BRK
  $B02D  00        BRK
  $B02E  00        BRK
  $B02F  00        BRK
  $B030  00        BRK
  $B031  7F        .db $7F
  $B032  7F        .db $7F
  $B033  7F        .db $7F
  $B034  7F        .db $7F
  $B035  7F        .db $7F
  $B036  7F        .db $7F
  $B037  7F        .db $7F
  $B038  00        BRK
  $B039  00        BRK
  $B03A  00        BRK
  $B03B  00        BRK
  $B03C  00        BRK
  $B03D  00        BRK
  $B03E  00        BRK
  $B03F  00        BRK
  $B040  00        BRK
  $B041  FF        .db $FF
  $B042  FF        .db $FF
  $B043  00        BRK
  $B044  FF        .db $FF
  $B045  FF        .db $FF
  $B046  7F        .db $7F
  $B047  7F        .db $7F
  $B048  00        BRK
  $B049  00        BRK
  $B04A  00        BRK
  $B04B  00        BRK
  $B04C  40        RTI
  $B04D  40        RTI
  $B04E  40        RTI
  $B04F  40        RTI
  $B050  40        RTI
  $B051  7F        .db $7F
  $B052  7F        .db $7F
  $B053  7F        .db $7F
  $B054  7F        .db $7F
  $B055  7F        .db $7F
  $B056  7F        .db $7F
  $B057  40        RTI
  $B058  40        RTI
  $B059  40        RTI
  $B05A  40        RTI
  $B05B  40        RTI
  $B05C  40        RTI
  $B05D  40        RTI
  $B05E  40        RTI
  $B05F  7F        .db $7F
  $B060  00        BRK
  $B061  FF        .db $FF
  $B062  FF        .db $FF
  $B063  00        BRK
  $B064  FF        .db $FF
  $B065  FF        .db $FF
  $B066  7F        .db $7F
  $B067  7F        .db $7F
  $B068  00        BRK
  $B069  00        BRK
  $B06A  00        BRK
  $B06B  00        BRK
  $B06C  00        BRK
  $B06D  00        BRK
  $B06E  00        BRK
  $B06F  00        BRK
  $B070  00        BRK
  $B071  7F        .db $7F
  $B072  7F        .db $7F
  $B073  7F        .db $7F
  $B074  7F        .db $7F
  $B075  7F        .db $7F
  $B076  7F        .db $7F
  $B077  7F        .db $7F
  $B078  00        BRK
  $B079  00        BRK
  $B07A  00        BRK
  $B07B  00        BRK
  $B07C  00        BRK
  $B07D  00        BRK
  $B07E  00        BRK
  $B07F  00        BRK
  $B080  00        BRK
  $B081  FF        .db $FF
  $B082  FF        .db $FF
  $B083  00        BRK
  $B084  FF        .db $FF
  $B085  FF        .db $FF
  $B086  7F        .db $7F
  $B087  7F        .db $7F
  $B088  00        BRK
  $B089  00        BRK
  $B08A  00        BRK
  $B08B  00        BRK
  $B08C  00        BRK
  $B08D  00        BRK
  $B08E  00        BRK
  $B08F  00        BRK
  $B090  00        BRK
  $B091  7F        .db $7F
  $B092  7F        .db $7F
  $B093  7F        .db $7F
  $B094  7F        .db $7F
  $B095  7F        .db $7F
  $B096  7F        .db $7F
  $B097  7F        .db $7F
  $B098  00        BRK
  $B099  00        BRK
  $B09A  00        BRK
  $B09B  01 02     ORA ($02,X)
  $B09D  04        .db $04
  $B09E  08        PHP
  $B09F  08        PHP
  $B0A0  00        BRK
  $B0A1  FF        .db $FF
  $B0A2  FF        .db $FF
  $B0A3  00        BRK
  $B0A4  FF        .db $FF
  $B0A5  FF        .db $FF
  $B0A6  7F        .db $7F
  $B0A7  7F        .db $7F
  $B0A8  00        BRK
  $B0A9  00        BRK
  $B0AA  00        BRK
  $B0AB  00        BRK
  $B0AC  00        BRK
  $B0AD  00        BRK
  $B0AE  00        BRK
  $B0AF  00        BRK
  $B0B0  00        BRK
  $B0B1  7F        .db $7F
  $B0B2  FF        .db $FF
  $B0B3  7F        .db $7F
  $B0B4  7F        .db $7F
  $B0B5  7F        .db $7F
  $B0B6  7F        .db $7F
  $B0B7  7F        .db $7F
  $B0B8  00        BRK
  $B0B9  3F        .db $3F
  $B0BA  C0 00     CPY #$00
  $B0BC  00        BRK
  $B0BD  00        BRK
  $B0BE  00        BRK
  $B0BF  00        BRK
  $B0C0  00        BRK
  $B0C1  FF        .db $FF
  $B0C2  FF        .db $FF
  $B0C3  00        BRK
  $B0C4  FF        .db $FF
  $B0C5  FF        .db $FF
  $B0C6  7F        .db $7F
  $B0C7  7F        .db $7F
  $B0C8  00        BRK
  $B0C9  00        BRK
  $B0CA  00        BRK
  $B0CB  00        BRK
  $B0CC  00        BRK
  $B0CD  00        BRK
  $B0CE  00        BRK
  $B0CF  00        BRK
  $B0D0  00        BRK
  $B0D1  7D FB 77  ADC $77FB,X
  $B0D4  7F        .db $7F
  $B0D5  5F        .db $5F
  $B0D6  3F        .db $3F
  $B0D7  7F        .db $7F
  $B0D8  01 02     ORA ($02,X)
  $B0DA  C4 28     CPY $28
  $B0DC  00        BRK
  $B0DD  28        PLP
  $B0DE  44        .db $44
  $B0DF  84 00     STY $00
  $B0E1  FC        .db $FC
  $B0E2  FE 06 F6  INC $F606,X
  $B0E5  F6 76     INC $76,X
  $B0E7  76 00     ROR $00,X
  $B0E9  00        BRK
  $B0EA  00        BRK
  $B0EB  00        BRK
  $B0EC  00        BRK
  $B0ED  00        BRK
  $B0EE  00        BRK
  $B0EF  80        .db $80
  $B0F0  16 76     ASL $76,X
  $B0F2  76 76     ROR $76,X
  $B0F4  76 76     ROR $76,X
  $B0F6  76 76     ROR $76,X
  $B0F8  00        BRK
  $B0F9  00        BRK
  $B0FA  00        BRK
  $B0FB  00        BRK
  $B0FC  00        BRK
  $B0FD  00        BRK
  $B0FE  00        BRK
  $B0FF  00        BRK
  $B100  6C 6F 6F  JMP ($6F6F)
  $B103  6F        .db $6F
  $B104  6F        .db $6F
  $B105  6F        .db $6F
  $B106  6F        .db $6F
  $B107  6F        .db $6F
  $B108  00        BRK
  $B109  00        BRK
  $B10A  00        BRK
  $B10B  00        BRK
  $B10C  00        BRK
  $B10D  00        BRK
  $B10E  00        BRK
  $B10F  00        BRK
  $B110  6C 6F 6F  JMP ($6F6F)
  $B113  6F        .db $6F
  $B114  6F        .db $6F
  $B115  6F        .db $6F
  $B116  6F        .db $6F
  $B117  6F        .db $6F
  $B118  00        BRK
  $B119  00        BRK
  $B11A  00        BRK
  $B11B  07        .db $07
  $B11C  00        BRK
  $B11D  00        BRK
  $B11E  00        BRK
  $B11F  00        BRK
  $B120  00        BRK
  $B121  5F        .db $5F
  $B122  5F        .db $5F
  $B123  3F        .db $3F
  $B124  3F        .db $3F
  $B125  3F        .db $3F
  $B126  3F        .db $3F
  $B127  3F        .db $3F
  $B128  20 20 20  JSR $2020
  $B12B  40        RTI
  $B12C  40        RTI
  $B12D  40        RTI
  $B12E  40        RTI
  $B12F  40        RTI
  $B130  00        BRK
  $B131  3F        .db $3F
  $B132  3F        .db $3F
  $B133  DF        .db $DF
  $B134  7F        .db $7F
  $B135  5F        .db $5F
  $B136  6F        .db $6F
  $B137  6F        .db $6F
  $B138  40        RTI
  $B139  40        RTI
  $B13A  40        RTI
  $B13B  A0 58     LDY #$58
  $B13D  27        .db $27

L_B13E:
  $B13E  10 10     BPL $B150
  $B140  40        RTI
  $B141  7F        .db $7F
  $B142  7F        .db $7F
  $B143  7F        .db $7F
  $B144  7F        .db $7F
  $B145  7F        .db $7F
  $B146  7F        .db $7F
  $B147  7F        .db $7F
  $B148  40        RTI
  $B149  40        RTI
  $B14A  40        RTI
  $B14B  40        RTI
  $B14C  40        RTI
  $B14D  40        RTI
  $B14E  40        RTI
  $B14F  40        RTI

L_B150:
  $B150  40        RTI
  $B151  7D 7B 77  ADC $777B,X
  $B154  6F        .db $6F
  $B155  DF        .db $DF
  $B156  7F        .db $7F
  $B157  7F        .db $7F
  $B158  41 42     EOR ($42,X)
  $B15A  44        .db $44
  $B15B  48        PHA
  $B15C  50 E0     BVC $B13E
  $B15E  38        SEC
  $B15F  C7        .db $C7
  $B160  0A        ASL
  $B161  7F        .db $7F
  $B162  7F        .db $7F
  $B163  77        .db $77
  $B164  6F        .db $6F
  $B165  5F        .db $5F
  $B166  3F        .db $3F
  $B167  7F        .db $7F
  $B168  0B        .db $0B
  $B169  0A        ASL
  $B16A  0C        .db $0C
  $B16B  08        PHP
  $B16C  1E 24 44  ASL $4424,X
  $B16F  84 00     STY $00
  $B171  7F        .db $7F
  $B172  7F        .db $7F
  $B173  7F        .db $7F
  $B174  7F        .db $7F
  $B175  7F        .db $7F
  $B176  7F        .db $7F
  $B177  FF        .db $FF
  $B178  00        BRK
  $B179  00        BRK
  $B17A  00        BRK
  $B17B  00        BRK
  $B17C  00        BRK
  $B17D  00        BRK
  $B17E  00        BRK
  $B17F  80        .db $80
  $B180  CA        DEX
  $B181  FE FF 7F  INC $7FFF,X
  $B184  FF        .db $FF
  $B185  FF        .db $FF
  $B186  FF        .db $FF
  $B187  FF        .db $FF
  $B188  CB        .db $CB
  $B189  8B        .db $8B
  $B18A  A5 00     LDA $00
  $B18C  D3        .db $D3
  $B18D  D3        .db $D3
  $B18E  92        .db $92
  $B18F  DB        .db $DB
  $B190  00        BRK
  $B191  FF        .db $FF
  $B192  FF        .db $FF
  $B193  7E FE 7E  ROR $7EFE,X
  $B196  7D 7D 00  ADC $007D,X
  $B199  EA        NOP
  $B19A  CA        DEX
  $B19B  25 E5     AND $E5
  $B19D  01 03     ORA ($03,X)
  $B19F  03        .db $03
  $B1A0  A9 FF     LDA #$FF
  $B1A2  7F        .db $7F
  $B1A3  7F        .db $7F
  $B1A4  7F        .db $7F
  $B1A5  7F        .db $7F
  $B1A6  7F        .db $7F
  $B1A7  7F        .db $7F
  $B1A8  A9 A8     LDA #$A8
  $B1AA  2C 80 F7  BIT $F780
  $B1AD  D5 F5     CMP $F5,X
  $B1AF  C7        .db $C7
  $B1B0  00        BRK
  $B1B1  FF        .db $FF
  $B1B2  FF        .db $FF
  $B1B3  7F        .db $7F
  $B1B4  FF        .db $FF
  $B1B5  7F        .db $7F
  $B1B6  FF        .db $FF
  $B1B7  FF        .db $FF
  $B1B8  80        .db $80
  $B1B9  EE C4 24  INC $24C4
  $B1BC  E4 00     CPX $00
  $B1BE  C1 9A     CMP ($9A,X)
  $B1C0  40        RTI
  $B1C1  FF        .db $FF
  $B1C2  FF        .db $FF
  $B1C3  7F        .db $7F
  $B1C4  7F        .db $7F
  $B1C5  7F        .db $7F
  $B1C6  7F        .db $7F
  $B1C7  7F        .db $7F
  $B1C8  40        RTI
  $B1C9  80        .db $80
  $B1CA  80        .db $80
  $B1CB  00        BRK
  $B1CC  77        .db $77
  $B1CD  52        .db $52
  $B1CE  62        .db $62
  $B1CF  52        .db $52
  $B1D0  00        BRK
  $B1D1  FF        .db $FF
  $B1D2  FF        .db $FF
  $B1D3  FF        .db $FF
  $B1D4  FF        .db $FF
  $B1D5  7F        .db $7F
  $B1D6  FF        .db $FF
  $B1D7  7F        .db $7F
  $B1D8  00        BRK
  $B1D9  D1 DB     CMP ($DB),Y
  $B1DB  95 D1     STA $D1,X
  $B1DD  00        BRK
  $B1DE  CE 31 16  DEC $1631
  $B1E1  76 76     ROR $76,X
  $B1E3  76 76     ROR $76,X
  $B1E5  76 76     ROR $76,X
  $B1E7  76 00     ROR $00,X
  $B1E9  00        BRK
  $B1EA  00        BRK
  $B1EB  00        BRK
  $B1EC  00        BRK
  $B1ED  00        BRK
  $B1EE  00        BRK
  $B1EF  00        BRK
  $B1F0  16 76     ASL $76,X
  $B1F2  76 76     ROR $76,X
  $B1F4  76 76     ROR $76,X
  $B1F6  76 76     ROR $76,X
  $B1F8  00        BRK
  $B1F9  00        BRK
  $B1FA  00        BRK
  $B1FB  00        BRK
  $B1FC  00        BRK
  $B1FD  00        BRK
  $B1FE  00        BRK
  $B1FF  00        BRK
  $B200  6C 6F 6F  JMP ($6F6F)
  $B203  6F        .db $6F
  $B204  6F        .db $6F
  $B205  6F        .db $6F
  $B206  6F        .db $6F
  $B207  6F        .db $6F
  $B208  00        BRK
  $B209  00        BRK
  $B20A  00        BRK
  $B20B  00        BRK
  $B20C  00        BRK
  $B20D  00        BRK
  $B20E  00        BRK
  $B20F  00        BRK
  $B210  6C 6F 6F  JMP ($6F6F)
  $B213  6F        .db $6F
  $B214  6F        .db $6F
  $B215  6F        .db $6F
  $B216  6F        .db $6F
  $B217  6F        .db $6F
  $B218  00        BRK
  $B219  00        BRK
  $B21A  00        BRK
  $B21B  00        BRK
  $B21C  00        BRK
  $B21D  00        BRK
  $B21E  00        BRK
  $B21F  00        BRK
  $B220  00        BRK
  $B221  7E 7D 7D  ROR $7D7D,X
  $B224  7B        .db $7B
  $B225  7B        .db $7B
  $B226  7B        .db $7B
  $B227  7B        .db $7B
  $B228  00        BRK
  $B229  01 02     ORA ($02,X)
  $B22B  02        .db $02
  $B22C  04        .db $04
  $B22D  04        .db $04
  $B22E  04        .db $04
  $B22F  04        .db $04
  $B230  00        BRK
  $B231  7B        .db $7B
  $B232  7C        .db $7C
  $B233  7D 7A 77  ADC $777A,X
  $B236  6F        .db $6F
  $B237  6F        .db $6F
  $B238  04        .db $04
  $B239  04        .db $04
  $B23A  03        .db $03
  $B23B  02        .db $02
  $B23C  05 08     ORA $08
  $B23E  10 10     BPL $B250
  $B240  40        RTI
  $B241  7F        .db $7F
  $B242  7F        .db $7F
  $B243  7F        .db $7F
  $B244  7F        .db $7F
  $B245  7F        .db $7F
  $B246  7F        .db $7F
  $B247  78        SEI
  $B248  80        .db $80
  $B249  40        RTI
  $B24A  40        RTI
  $B24B  40        RTI
  $B24C  40        RTI
  $B24D  40        RTI
  $B24E  40        RTI
  $B24F  47        .db $47

L_B250:
  $B250  40        RTI
  $B251  7F        .db $7F
  $B252  7F        .db $7F
  $B253  7F        .db $7F
  $B254  7F        .db $7F
  $B255  7F        .db $7F
  $B256  40        RTI
  $B257  7F        .db $7F
  $B258  78        SEI
  $B259  80        .db $80
  $B25A  40        RTI
  $B25B  40        RTI
  $B25C  40        RTI
  $B25D  80        .db $80
  $B25E  7F        .db $7F
  $B25F  40        RTI
  $B260  00        BRK
  $B261  5F        .db $5F
  $B262  6F        .db $6F
  $B263  6F        .db $6F
  $B264  77        .db $77
  $B265  77        .db $77
  $B266  77        .db $77
  $B267  07        .db $07
  $B268  C0 20     CPY #$20
  $B26A  10 10     BPL $B27C
  $B26C  08        PHP
  $B26D  08        PHP
  $B26E  08        PHP
  $B26F  F8        SED
  $B270  00        BRK
  $B271  77        .db $77
  $B272  6F        .db $6F
  $B273  6F        .db $6F
  $B274  5F        .db $5F
  $B275  3F        .db $3F
  $B276  7F        .db $7F
  $B277  7F        .db $7F
  $B278  0F        .db $0F
  $B279  08        PHP
  $B27A  10 10     BPL $B28C

L_B27C:
  $B27C  20 C0 00  JSR $00C0
  $B27F  0C        .db $0C
  $B280  10 7F     BPL $B301
  $B282  7F        .db $7F
  $B283  7F        .db $7F
  $B284  7F        .db $7F
  $B285  7F        .db $7F
  $B286  7F        .db $7F
  $B287  7F        .db $7F
  $B288  10 10     BPL $B29A
  $B28A  10 10     BPL $B29C

L_B28C:
  $B28C  10 10     BPL $B29E
  $B28E  08        PHP
  $B28F  08        PHP
  $B290  04        .db $04
  $B291  3D 5B 67  AND $675B,X
  $B294  67        .db $67
  $B295  5B        .db $5B
  $B296  3D 7D 05  AND $057D,X
  $B299  C2        .db $C2

L_B29A:
  $B29A  25 18     AND $18

L_B29C:
  $B29C  18        CLC
  $B29D  24 42     BIT $42
  $B29F  8A        TXA
  $B2A0  00        BRK
  $B2A1  7D 7B 77  ADC $777B,X
  $B2A4  6F        .db $6F
  $B2A5  5F        .db $5F
  $B2A6  3F        .db $3F
  $B2A7  7F        .db $7F
  $B2A8  01 02     ORA ($02,X)
  $B2AA  04        .db $04
  $B2AB  08        PHP
  $B2AC  10 20     BPL $B2CE
  $B2AE  40        RTI
  $B2AF  80        .db $80
  $B2B0  00        BRK
  $B2B1  7F        .db $7F
  $B2B2  7F        .db $7F
  $B2B3  FF        .db $FF
  $B2B4  7F        .db $7F
  $B2B5  7F        .db $7F
  $B2B6  7F        .db $7F
  $B2B7  FF        .db $FF
  $B2B8  00        BRK
  $B2B9  00        BRK
  $B2BA  00        BRK
  $B2BB  C0 3F     CPY #$3F
  $B2BD  00        BRK
  $B2BE  00        BRK
  $B2BF  A9 02     LDA #$02
  $B2C1  7F        .db $7F
  $B2C2  7F        .db $7F
  $B2C3  7F        .db $7F
  $B2C4  7F        .db $7F
  $B2C5  7F        .db $7F
  $B2C6  7F        .db $7F
  $B2C7  7F        .db $7F
  $B2C8  02        .db $02
  $B2C9  02        .db $02
  $B2CA  02        .db $02
  $B2CB  02        .db $02
  $B2CC  02        .db $02
  $B2CD  02        .db $02

L_B2CE:
  $B2CE  04        .db $04
  $B2CF  04        .db $04
  $B2D0  08        PHP
  $B2D1  7F        .db $7F
  $B2D2  7F        .db $7F
  $B2D3  FF        .db $FF
  $B2D4  7F        .db $7F
  $B2D5  7F        .db $7F
  $B2D6  7F        .db $7F
  $B2D7  7F        .db $7F
  $B2D8  08        PHP
  $B2D9  10 20     BPL $B2FB
  $B2DB  C0 00     CPY #$00
  $B2DD  00        BRK
  $B2DE  00        BRK
  $B2DF  40        RTI
  $B2E0  16 76     ASL $76,X
  $B2E2  76 76     ROR $76,X
  $B2E4  76 76     ROR $76,X
  $B2E6  76 76     ROR $76,X
  $B2E8  00        BRK
  $B2E9  00        BRK
  $B2EA  00        BRK
  $B2EB  00        BRK
  $B2EC  00        BRK
  $B2ED  00        BRK
  $B2EE  00        BRK
  $B2EF  00        BRK
  $B2F0  16 76     ASL $76,X
  $B2F2  76 76     ROR $76,X
  $B2F4  76 76     ROR $76,X
  $B2F6  76 76     ROR $76,X
  $B2F8  00        BRK
  $B2F9  00        BRK
  $B2FA  00        BRK

L_B2FB:
  $B2FB  00        BRK
  $B2FC  00        BRK
  $B2FD  00        BRK
  $B2FE  00        BRK
  $B2FF  00        BRK
  $B300  6C 6F 6F  JMP ($6F6F)
  $B303  6F        .db $6F
  $B304  6F        .db $6F
  $B305  6F        .db $6F
  $B306  6F        .db $6F
  $B307  6F        .db $6F
  $B308  00        BRK
  $B309  00        BRK
  $B30A  00        BRK
  $B30B  00        BRK
  $B30C  00        BRK
  $B30D  00        BRK
  $B30E  00        BRK
  $B30F  00        BRK
  $B310  6C 6F 6F  JMP ($6F6F)
  $B313  6F        .db $6F
  $B314  60        RTS
  $B315  7F        .db $7F
  $B316  3F        .db $3F
  $B317  00        BRK
  $B318  01 00     ORA ($00,X)
  $B31A  00        BRK
  $B31B  00        BRK
  $B31C  00        BRK
  $B31D  00        BRK
  $B31E  00        BRK
  $B31F  00        BRK
  $B320  00        BRK
  $B321  79 79 76  ADC $7679,Y
  $B324  6F        .db $6F
  $B325  5F        .db $5F
  $B326  3F        .db $3F
  $B327  7F        .db $7F
  $B328  09 06     ORA #$06
  $B32A  06 09     ASL $09
  $B32C  10 20     BPL $B34E
  $B32E  40        RTI
  $B32F  80        .db $80
  $B330  00        BRK
  $B331  7F        .db $7F
  $B332  7F        .db $7F
  $B333  FF        .db $FF
  $B334  00        BRK
  $B335  FF        .db $FF
  $B336  FF        .db $FF
  $B337  00        BRK
  $B338  00        BRK
  $B339  00        BRK
  $B33A  00        BRK
  $B33B  00        BRK
  $B33C  00        BRK
  $B33D  00        BRK
  $B33E  00        BRK
  $B33F  00        BRK
  $B340  40        RTI
  $B341  7F        .db $7F
  $B342  7F        .db $7F
  $B343  7F        .db $7F
  $B344  7F        .db $7F
  $B345  47        .db $47
  $B346  78        SEI
  $B347  7F        .db $7F
  $B348  40        RTI
  $B349  40        RTI
  $B34A  40        RTI
  $B34B  40        RTI
  $B34C  80        .db $80
  $B34D  78        SEI

L_B34E:
  $B34E  47        .db $47
  $B34F  40        RTI
  $B350  40        RTI
  $B351  7F        .db $7F
  $B352  7F        .db $7F
  $B353  FF        .db $FF
  $B354  00        BRK
  $B355  FF        .db $FF
  $B356  FF        .db $FF
  $B357  00        BRK
  $B358  40        RTI
  $B359  40        RTI
  $B35A  00        BRK
  $B35B  00        BRK
  $B35C  00        BRK
  $B35D  00        BRK
  $B35E  00        BRK
  $B35F  00        BRK
  $B360  78        SEI
  $B361  7F        .db $7F
  $B362  7F        .db $7F
  $B363  7F        .db $7F
  $B364  7F        .db $7F
  $B365  78        SEI
  $B366  07        .db $07
  $B367  7F        .db $7F
  $B368  78        SEI
  $B369  07        .db $07
  $B36A  00        BRK
  $B36B  00        BRK
  $B36C  00        BRK
  $B36D  07        .db $07
  $B36E  F8        SED
  $B36F  00        BRK
  $B370  00        BRK
  $B371  7F        .db $7F
  $B372  7F        .db $7F
  $B373  FF        .db $FF
  $B374  00        BRK
  $B375  FF        .db $FF
  $B376  FF        .db $FF
  $B377  00        BRK
  $B378  00        BRK
  $B379  00        BRK
  $B37A  00        BRK
  $B37B  00        BRK
  $B37C  00        BRK
  $B37D  00        BRK
  $B37E  00        BRK
  $B37F  00        BRK
  $B380  01 F7     ORA ($F7,X)
  $B382  6F        .db $6F
  $B383  5F        .db $5F
  $B384  3F        .db $3F
  $B385  7F        .db $7F
  $B386  7F        .db $7F
  $B387  7F        .db $7F
  $B388  05 89     ORA $89
  $B38A  78        SEI
  $B38B  27        .db $27
  $B38C  C0 00     CPY #$00
  $B38E  00        BRK
  $B38F  00        BRK
  $B390  00        BRK
  $B391  7F        .db $7F
  $B392  7F        .db $7F
  $B393  FF        .db $FF
  $B394  00        BRK
  $B395  FF        .db $FF
  $B396  FF        .db $FF
  $B397  00        BRK
  $B398  00        BRK
  $B399  00        BRK
  $B39A  00        BRK
  $B39B  00        BRK
  $B39C  00        BRK
  $B39D  00        BRK
  $B39E  00        BRK
  $B39F  00        BRK
  $B3A0  02        .db $02
  $B3A1  FF        .db $FF
  $B3A2  7F        .db $7F
  $B3A3  FF        .db $FF
  $B3A4  7F        .db $7F
  $B3A5  7F        .db $7F
  $B3A6  7F        .db $7F
  $B3A7  7F        .db $7F
  $B3A8  02        .db $02
  $B3A9  D9 00 80  CMP $8000,Y
  $B3AC  78        SEI
  $B3AD  07        .db $07
  $B3AE  00        BRK
  $B3AF  00        BRK
  $B3B0  00        BRK
  $B3B1  7F        .db $7F
  $B3B2  7F        .db $7F
  $B3B3  FF        .db $FF
  $B3B4  00        BRK
  $B3B5  FF        .db $FF
  $B3B6  FF        .db $FF
  $B3B7  00        BRK
  $B3B8  00        BRK
  $B3B9  00        BRK
  $B3BA  00        BRK
  $B3BB  00        BRK
  $B3BC  00        BRK
  $B3BD  00        BRK
  $B3BE  00        BRK
  $B3BF  00        BRK
  $B3C0  31 FF     AND ($FF),Y
  $B3C2  7F        .db $7F
  $B3C3  7F        .db $7F
  $B3C4  7F        .db $7F
  $B3C5  FF        .db $FF
  $B3C6  7F        .db $7F
  $B3C7  7F        .db $7F
  $B3C8  31 CE     AND ($CE),Y
  $B3CA  00        BRK
  $B3CB  00        BRK
  $B3CC  00        BRK
  $B3CD  80        .db $80
  $B3CE  78        SEI
  $B3CF  00        BRK
  $B3D0  00        BRK
  $B3D1  7F        .db $7F
  $B3D2  7F        .db $7F
  $B3D3  FF        .db $FF
  $B3D4  00        BRK
  $B3D5  FF        .db $FF
  $B3D6  FF        .db $FF
  $B3D7  00        BRK
  $B3D8  00        BRK
  $B3D9  00        BRK
  $B3DA  00        BRK
  $B3DB  00        BRK
  $B3DC  00        BRK
  $B3DD  00        BRK
  $B3DE  00        BRK
  $B3DF  00        BRK
  $B3E0  16 76     ASL $76,X
  $B3E2  76 76     ROR $76,X
  $B3E4  76 76     ROR $76,X
  $B3E6  76 76     ROR $76,X
  $B3E8  00        BRK
  $B3E9  00        BRK
  $B3EA  00        BRK
  $B3EB  00        BRK
  $B3EC  00        BRK
  $B3ED  00        BRK
  $B3EE  00        BRK
  $B3EF  00        BRK
  $B3F0  16 76     ASL $76,X
  $B3F2  76 F6     ROR $F6,X
  $B3F4  06 FE     ASL $FE
  $B3F6  FC        .db $FC
  $B3F7  00        BRK
  $B3F8  00        BRK
  $B3F9  00        BRK
  $B3FA  00        BRK
  $B3FB  00        BRK
  $B3FC  00        BRK
  $B3FD  00        BRK
  $B3FE  00        BRK
  $B3FF  00        BRK
  $B400  40        RTI
  $B401  40        RTI
  $B402  40        RTI
  $B403  40        RTI
  $B404  40        RTI
  $B405  40        RTI
  $B406  40        RTI
  $B407  44        .db $44
  $B408  40        RTI
  $B409  40        RTI
  $B40A  40        RTI
  $B40B  40        RTI
  $B40C  40        RTI
  $B40D  40        RTI
  $B40E  40        RTI
  $B40F  22        .db $22
  $B410  20 00 00  JSR $0000
  $B413  00        BRK
  $B414  00        BRK
  $B415  00        BRK
  $B416  00        BRK
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
  $B42D  5A        .db $5A
  $B42E  5A        .db $5A
  $B42F  36 36     ROL $36,X
  $B431  36 00     ROL $00,X
  $B433  12        .db $12
  $B434  36 36     ROL $36,X
  $B436  36 36     ROL $36,X
  $B438  36 36     ROL $36,X
  $B43A  36 24     ROL $24,X
  $B43C  12        .db $12
  $B43D  48        PHA
  $B43E  00        BRK
  $B43F  12        .db $12
  $B440  6C 7E FF  JMP ($FF7E)
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
  $B460  90 02     BCC $B464
  $B462  90 02     BCC $B466

L_B464:
  $B464  90 02     BCC $B468

L_B466:
  $B466  94 02     STY $02,X

L_B468:
  $B468  93        .db $93
  $B469  02        .db $02
  $B46A  9F        .db $9F
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  25 25     AND $25
  $B46F  0F        .db $0F
  $B470  15 28     ORA $28,X
  $B472  90 04     BCC $B478
  $B474  91 04     STA ($04),Y
  $B476  92        .db $92
  $B477  04        .db $04

L_B478:
  $B478  9E        .db $9E
  $B479  04        .db $04
  $B47A  93        .db $93
  $B47B  04        .db $04
  $B47C  9F        .db $9F
  $B47D  03        .db $03
  $B47E  0F        .db $0F
  $B47F  11 3C     ORA ($3C),Y
  $B481  0F        .db $0F
  $B482  15 27     ORA $27,X
  $B484  91 03     STA ($03),Y
  $B486  92        .db $92
  $B487  03        .db $03
  $B488  93        .db $93
  $B489  03        .db $03
  $B48A  94 03     STY $03,X
  $B48C  95 03     STA $03,X
  $B48E  9F        .db $9F
  $B48F  03        .db $03
  $B490  0F        .db $0F
  $B491  26 30     ROL $30
  $B493  0F        .db $0F
  $B494  14        .db $14
  $B495  34        .db $34
  $B496  94 02     STY $02,X
  $B498  94 02     STY $02,X
  $B49A  94 02     STY $02,X
  $B49C  94 02     STY $02,X
  $B49E  94 02     STY $02,X
  $B4A0  9F        .db $9F
  $B4A1  03        .db $03
  $B4A2  0F        .db $0F
  $B4A3  11 30     ORA ($30),Y
  $B4A5  37        .db $37
  $B4A6  27        .db $27
  $B4A7  07        .db $07
  $B4A8  90 07     BCC $B4B1
  $B4AA  91 07     STA ($07),Y
  $B4AC  92        .db $92
  $B4AD  07        .db $07
  $B4AE  93        .db $93
  $B4AF  07        .db $07
  $B4B0  94 07     STY $07,X
  $B4B2  95 07     STA $07,X
  $B4B4  0F        .db $0F
  $B4B5  30 28     BMI $B4DF
  $B4B7  0F        .db $0F
  $B4B8  28        PLP
  $B4B9  15 90     ORA $90,X
  $B4BB  02        .db $02
  $B4BC  91 02     STA ($02),Y
  $B4BE  92        .db $92
  $B4BF  02        .db $02
  $B4C0  9E        .db $9E
  $B4C1  04        .db $04
  $B4C2  9C        .db $9C
  $B4C3  01 96     ORA ($96,X)
  $B4C5  03        .db $03
  $B4C6  0F        .db $0F
  $B4C7  15 27     ORA $27,X
  $B4C9  0F        .db $0F
  $B4CA  11 3C     ORA ($3C),Y
  $B4CC  AA        TAX
  $B4CD  04        .db $04
  $B4CE  AB        .db $AB
  $B4CF  04        .db $04
  $B4D0  AC 04 AD  LDY $AD04
  $B4D3  04        .db $04
  $B4D4  AE 04 AF  LDX $AF04
  $B4D7  04        .db $04
  $B4D8  30 32     BMI $B50C
  $B4DA  22        .db $22
  $B4DB  19 09 21  ORA $2109,Y
  $B4DE  94 05     STY $05,X
  $B4E0  95 05     STA $05,X
  $B4E2  96 05     STX $05,Y
  $B4E4  94 06     STY $06,X
  $B4E6  95 06     STA $06,X
  $B4E8  95 04     STA $04,X
  $B4EA  0F        .db $0F
  $B4EB  0F        .db $0F
  $B4EC  0F        .db $0F
  $B4ED  0F        .db $0F
  $B4EE  0F        .db $0F
  $B4EF  0F        .db $0F
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

L_B50C:
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
  $B600  01 01     ORA ($01,X)
  $B602  03        .db $03
  $B603  03        .db $03
  $B604  04        .db $04
  $B605  05 05     ORA $05
  $B607  08        PHP
  $B608  08        PHP
  $B609  09 0A     ORA #$0A
  $B60B  0A        ASL
  $B60C  0B        .db $0B
  $B60D  0C        .db $0C
  $B60E  0D 0E 0F  ORA $0F0E
  $B611  10 11     BPL $B624
  $B613  12        .db $12
  $B614  13        .db $13
  $B615  14        .db $14
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
  $B621  FF        .db $FF
  $B622  FF        .db $FF
  $B623  FF        .db $FF

L_B624:
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

L_B658:
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

L_B692:
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
  $B6FB  FF        .db $FF
  $B6FC  FF        .db $FF
  $B6FD  FF        .db $FF
  $B6FE  FF        .db $FF
  $B6FF  FF        .db $FF
  $B700  50 90     BVC $B692
  $B702  68        PLA
  $B703  80        .db $80
  $B704  80        .db $80
  $B705  80        .db $80
  $B706  98        TYA
  $B707  00        BRK
  $B708  60        RTS
  $B709  10 10     BPL $B71B
  $B70B  60        RTS
  $B70C  80        .db $80
  $B70D  80        .db $80
  $B70E  80        .db $80
  $B70F  80        .db $80
  $B710  80        .db $80
  $B711  80        .db $80
  $B712  80        .db $80
  $B713  80        .db $80
  $B714  F8        SED
  $B715  E8        INX
  $B716  FF        .db $FF
  $B717  FF        .db $FF
  $B718  FF        .db $FF
  $B719  FF        .db $FF
  $B71A  FF        .db $FF

L_B71B:
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

L_B79A:
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
  $B800  BC 9C B8  LDY $B89C,X
  $B803  80        .db $80
  $B804  80        .db $80
  $B805  80        .db $80
  $B806  A8        TAY
  $B807  08        PHP
  $B808  70 90     BVS $B79A
  $B80A  90 08     BCC $B814
  $B80C  08        PHP
  $B80D  80        .db $80
  $B80E  80        .db $80
  $B80F  80        .db $80
  $B810  80        .db $80
  $B811  80        .db $80
  $B812  80        .db $80
  $B813  80        .db $80

L_B814:
  $B814  A4 A4     LDY $A4
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
  $B900  50 50     BVC $B952
  $B902  46 14     LSR $14
  $B904  14        .db $14
  $B905  14        .db $14
  $B906  46 25     LSR $25
  $B908  23        .db $23
  $B909  23        .db $23
  $B90A  23        .db $23
  $B90B  25 27     AND $27
  $B90D  14        .db $14
  $B90E  14        .db $14
  $B90F  14        .db $14
  $B910  14        .db $14
  $B911  14        .db $14
  $B912  14        .db $14
  $B913  14        .db $14
  $B914  4E 4E FF  LSR $FF4E
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
  $BA00  00        BRK
  $BA01  06 06     ASL $06
  $BA03  06 0E     ASL $0E
  $BA05  10 10     BPL $BA17
  $BA07  12        .db $12
  $BA08  15 15     ORA $15,X
  $BA0A  16 16     ASL $16,X
  $BA0C  17        .db $17
  $BA0D  17        .db $17
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
  $BA40  30 70     BMI $BAB2
  $BA42  90 C0     BCC $BA04
  $BA44  B8        CLV
  $BA45  70 70     BVS $BAB7
  $BA47  68        PLA
  $BA48  F8        SED
  $BA49  F8        SED
  $BA4A  F8        SED
  $BA4B  F8        SED
  $BA4C  08        PHP
  $BA4D  08        PHP
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
  $BA80  58        CLI
  $BA81  98        TYA
  $BA82  58        CLI
  $BA83  9A        TXS
  $BA84  B8        CLV
  $BA85  68        PLA
  $BA86  B8        CLV
  $BA87  78        SEI
  $BA88  4F        .db $4F
  $BA89  6F        .db $6F
  $BA8A  4F        .db $4F
  $BA8B  6F        .db $6F
  $BA8C  4F        .db $4F
  $BA8D  6F        .db $6F
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

L_BAB2:
  $BAB2  FF        .db $FF
  $BAB3  FF        .db $FF
  $BAB4  FF        .db $FF
  $BAB5  FF        .db $FF
  $BAB6  FF        .db $FF

L_BAB7:
  $BAB7  FF        .db $FF
  $BAB8  FF        .db $FF
  $BAB9  FF        .db $FF
  $BABA  FF        .db $FF
  $BABB  FF        .db $FF
  $BABC  FF        .db $FF
  $BABD  FF        .db $FF
  $BABE  FF        .db $FF
  $BABF  FF        .db $FF
  $BAC0  7B        .db $7B
  $BAC1  7A        .db $7A
  $BAC2  7B        .db $7B
  $BAC3  78        SEI
  $BAC4  78        SEI
  $BAC5  76 7B     ROR $7B,X
  $BAC7  78        SEI
  $BAC8  2F        .db $2F
  $BAC9  2F        .db $2F
  $BACA  2F        .db $2F
  $BACB  2F        .db $2F
  $BACC  2F        .db $2F
  $BACD  2F        .db $2F
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
  $BB00  94 B4     STY $B4,X
  $BB02  74        .db $74
  $BB03  94 94     STY $94,X
  $BB05  94 00     STY $00,X
  $BB07  07        .db $07
  $BB08  16 18     ASL $18,X
  $BB0A  28        PLP
  $BB0B  28        PLP
  $BB0C  00        BRK
  $BB0D  07        .db $07
  $BB0E  16 16     ASL $16,X
  $BB10  16 16     ASL $16,X
  $BB12  00        BRK
  $BB13  04        .db $04
  $BB14  0A        ASL
  $BB15  0E 0E 0E  ASL $0E0E
  $BB18  84 86     STY $86
  $BB1A  8A        TXA
  $BB1B  8A        TXA
  $BB1C  8E 8E E0  STX $E08E
  $BB1F  A0 60     LDY #$60
  $BB21  E0 E0     CPX #$E0
  $BB23  E0 85     CPX #$85
  $BB25  87        .db $87
  $BB26  8A        TXA
  $BB27  8B        .db $8B
  $BB28  8F        .db $8F
  $BB29  8F        .db $8F
  $BB2A  60        RTS
  $BB2B  20 E0 60  JSR $60E0
  $BB2E  60        RTS
  $BB2F  60        RTS
  $BB30  00        BRK
  $BB31  07        .db $07
  $BB32  10 12     BPL $BB46
  $BB34  12        .db $12
  $BB35  12        .db $12
  $BB36  00        BRK
  $BB37  07        .db $07
  $BB38  16 18     ASL $18,X
  $BB3A  28        PLP
  $BB3B  28        PLP
  $BB3C  00        BRK
  $BB3D  0B        .db $0B
  $BB3E  16 18     ASL $18,X
  $BB40  28        PLP
  $BB41  28        PLP
  $BB42  FF        .db $FF
  $BB43  FF        .db $FF
  $BB44  FF        .db $FF
  $BB45  FF        .db $FF

L_BB46:
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
  $BC12  04        .db $04
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
  $BD00  09 90     ORA #$90
  $BD02  09 00     ORA #$00
  $BD04  84 01     STY $01
  $BD06  09 98     ORA #$98
  $BD08  05 00     ORA $00
  $BD0A  9F        .db $9F
  $BD0B  01 03     ORA ($03,X)
  $BD0D  80        .db $80
  $BD0E  02        .db $02
  $BD0F  09 AC     ORA #$AC
  $BD11  02        .db $02
  $BD12  02        .db $02
  $BD13  84 01     STY $01
  $BD15  09 AA     ORA #$AA
  $BD17  01 04     ORA ($04,X)
  $BD19  AA        TAX
  $BD1A  0A        ASL
  $BD1B  04        .db $04
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
  $BE03  2C 10 1C  BIT $1C10
  $BE06  0F        .db $0F
  $BE07  37        .db $37
  $BE08  27        .db $27
  $BE09  07        .db $07
  $BE0A  0F        .db $0F
  $BE0B  28        PLP
  $BE0C  16 07     ASL $07,X
  $BE0E  0F        .db $0F
  $BE0F  28        PLP
  $BE10  0F        .db $0F
  $BE11  2C 0F 0F  BIT $0F0F
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
  $BE23  2C 10 1C  BIT $1C10
  $BE26  0F        .db $0F
  $BE27  27        .db $27
  $BE28  27        .db $27
  $BE29  07        .db $07
  $BE2A  0F        .db $0F
  $BE2B  28        PLP
  $BE2C  16 07     ASL $07,X
  $BE2E  0F        .db $0F
  $BE2F  28        PLP
  $BE30  0F        .db $0F
  $BE31  2C 0F 2C  BIT $2C0F
  $BE34  10 1C     BPL $BE52
  $BE36  0F        .db $0F
  $BE37  37        .db $37
  $BE38  27        .db $27
  $BE39  07        .db $07
  $BE3A  0F        .db $0F
  $BE3B  28        PLP
  $BE3C  16 07     ASL $07,X
  $BE3E  0F        .db $0F
  $BE3F  0F        .db $0F
  $BE40  28        PLP
  $BE41  2C 0F 0F  BIT $0F0F
  $BE44  0F        .db $0F
  $BE45  0F        .db $0F
  $BE46  0F        .db $0F
  $BE47  0F        .db $0F
  $BE48  0F        .db $0F
  $BE49  0F        .db $0F
  $BE4A  0F        .db $0F
  $BE4B  0F        .db $0F
  $BE4C  0F        .db $0F
  $BE4D  0F        .db $0F
  $BE4E  0F        .db $0F
  $BE4F  0F        .db $0F
  $BE50  0F        .db $0F
  $BE51  0F        .db $0F

L_BE52:
  $BE52  0F        .db $0F
  $BE53  0F        .db $0F
  $BE54  0F        .db $0F
  $BE55  0F        .db $0F
  $BE56  0F        .db $0F
  $BE57  0F        .db $0F
  $BE58  0F        .db $0F
  $BE59  0F        .db $0F
  $BE5A  0F        .db $0F
  $BE5B  0F        .db $0F
  $BE5C  0F        .db $0F
  $BE5D  0F        .db $0F
  $BE5E  0F        .db $0F
  $BE5F  0F        .db $0F
  $BE60  0F        .db $0F
  $BE61  0F        .db $0F
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
  $BF00  04        .db $04
  $BF01  06 0F     ASL $0F
  $BF03  30 32     BMI $BF37
  $BF05  22        .db $22
  $BF06  0F        .db $0F
  $BF07  37        .db $37
  $BF08  27        .db $27
  $BF09  17        .db $17
  $BF0A  0F        .db $0F
  $BF0B  19 09 21  ORA $2109,Y
  $BF0E  0F        .db $0F
  $BF0F  01 01     ORA ($01,X)
  $BF11  01 0F     ORA ($0F,X)
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
  $BF23  30 32     BMI $BF57
  $BF25  22        .db $22
  $BF26  0F        .db $0F
  $BF27  37        .db $37
  $BF28  27        .db $27
  $BF29  17        .db $17
  $BF2A  0F        .db $0F
  $BF2B  19 09 21  ORA $2109,Y
  $BF2E  0F        .db $0F
  $BF2F  01 01     ORA ($01,X)
  $BF31  01 0F     ORA ($0F,X)
  $BF33  30 32     BMI $BF67
  $BF35  22        .db $22
  $BF36  0F        .db $0F

L_BF37:
  $BF37  37        .db $37
  $BF38  27        .db $27
  $BF39  17        .db $17
  $BF3A  0F        .db $0F
  $BF3B  19 09 21  ORA $2109,Y
  $BF3E  0F        .db $0F
  $BF3F  01 21     ORA ($21,X)
  $BF41  01 0F     ORA ($0F,X)
  $BF43  30 32     BMI $BF77
  $BF45  22        .db $22
  $BF46  0F        .db $0F
  $BF47  37        .db $37
  $BF48  27        .db $27
  $BF49  17        .db $17
  $BF4A  0F        .db $0F
  $BF4B  19 09 21  ORA $2109,Y
  $BF4E  0F        .db $0F
  $BF4F  01 01     ORA ($01,X)
  $BF51  21 0F     AND ($0F,X)
  $BF53  30 32     BMI $BF87
  $BF55  22        .db $22
  $BF56  0F        .db $0F

L_BF57:
  $BF57  37        .db $37
  $BF58  27        .db $27
  $BF59  17        .db $17
  $BF5A  0F        .db $0F
  $BF5B  19 09 21  ORA $2109,Y
  $BF5E  0F        .db $0F
  $BF5F  01 21     ORA ($21,X)
  $BF61  21 FF     AND ($FF,X)
  $BF63  FF        .db $FF
  $BF64  FF        .db $FF
  $BF65  FF        .db $FF
  $BF66  FF        .db $FF

L_BF67:
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

L_BF77:
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

L_BF87:
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