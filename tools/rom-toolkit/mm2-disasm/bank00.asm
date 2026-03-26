; Mega Man 2 — PRG Bank 0
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  58        CLI
  $8005  60        RTS
  $8006  58        CLI
  $8007  60        RTS
  $8008  60        RTS
  $8009  60        RTS
  $800A  60        RTS
  $800B  60        RTS
  $800C  60        RTS
  $800D  68        PLA
  $800E  60        RTS
  $800F  68        PLA
  $8010  00        BRK
  $8011  21 00     AND ($00,X)
  $8013  21 22     AND ($22,X)
  $8015  23        .db $23
  $8016  22        .db $22
  $8017  23        .db $23
  $8018  24 25     BIT $25
  $801A  24 25     BIT $25
  $801C  25 25     AND $25
  $801E  25 25     AND $25
  $8020  26 27     ROL $27
  $8022  26 27     ROL $27
  $8024  29 2A     AND #$2A
  $8026  29 2A     AND #$2A
  $8028  2B        .db $2B
  $8029  00        BRK
  $802A  2B        .db $2B
  $802B  00        BRK
  $802C  31 58     AND ($58),Y
  $802E  31 58     AND ($58),Y
  $8030  31 5B     AND ($5B),Y
  $8032  31 5B     AND ($5B),Y
  $8034  5C        .db $5C
  $8035  5D 5C 5D  EOR $5D5C,X
  $8038  2C DF 2D  BIT $2DDF
  $803B  DF        .db $DF
  $803C  29 32     AND #$32
  $803E  29 32     AND #$32
  $8040  29 39     AND #$39
  $8042  31 5E     AND ($5E),Y
  $8044  31 5E     AND ($5E),Y
  $8046  31 5E     AND ($5E),Y
  $8048  31 5B     AND ($5B),Y
  $804A  31 5E     AND ($5E),Y
  $804C  31 5E     AND ($5E),Y
  $804E  31 5B     AND ($5B),Y
  $8050  5C        .db $5C
  $8051  5D 2D DF  EOR $DF2D,X
  $8054  2C DF 5C  BIT $5CDF
  $8057  5D 24 33  EOR $3324,X
  $805A  24 25     BIT $25
  $805C  25 33     AND $33
  $805E  25 25     AND $25
  $8060  33        .db $33
  $8061  25 24     AND $24
  $8063  25 33     AND $33
  $8065  25 25     AND $25
  $8067  25 25     AND $25
  $8069  25 25     AND $25
  $806B  35 26     AND $26,X
  $806D  27        .db $27
  $806E  36 5A     ROL $5A,X
  $8070  36 5A     ROL $5A,X
  $8072  26 27     ROL $27
  $8074  26 27     ROL $27
  $8076  5A        .db $5A
  $8077  5A        .db $5A
  $8078  26 27     ROL $27
  $807A  26 33     ROL $33
  $807C  22        .db $22
  $807D  33        .db $33
  $807E  22        .db $22
  $807F  23        .db $23
  $8080  29 39     AND #$39
  $8082  31 5B     AND ($5B),Y
  $8084  31 5B     AND ($5B),Y
  $8086  29 39     AND #$39
  $8088  29 39     AND #$39
  $808A  5A        .db $5A
  $808B  5A        .db $5A
  $808C  5A        .db $5A
  $808D  5A        .db $5A
  $808E  29 39     AND #$39
  $8090  29 39     AND #$39
  $8092  31 5A     AND ($5A),Y
  $8094  31 5A     AND ($5A),Y
  $8096  29 39     AND #$39
  $8098  25 35     AND $35
  $809A  25 25     AND $25
  $809C  26 27     ROL $27
  $809E  26 37     ROL $37
  $80A0  5A        .db $5A
  $80A1  5A        .db $5A
  $80A2  26 27     ROL $27
  $80A4  26 37     ROL $37
  $80A6  26 27     ROL $27
  $80A8  2E 2F 2B  ROL $2B2F
  $80AB  00        BRK
  $80AC  30 00     BMI $80AE

L_80AE:
  $80AE  00        BRK
  $80AF  00        BRK
  $80B0  5A        .db $5A
  $80B1  27        .db $27
  $80B2  26 27     ROL $27
  $80B4  29 32     AND #$32
  $80B6  29 2A     AND #$2A
  $80B8  5F        .db $5F
  $80B9  00        BRK
  $80BA  5F        .db $5F
  $80BB  00        BRK
  $80BC  5F        .db $5F
  $80BD  58        CLI
  $80BE  5F        .db $5F
  $80BF  58        CLI
  $80C0  5D 58 82  EOR $8258,X
  $80C3  82        .db $82
  $80C4  60        RTS
  $80C5  60        RTS
  $80C6  82        .db $82
  $80C7  82        .db $82
  $80C8  34        .db $34
  $80C9  59 34 59  EOR $5934,Y
  $80CC  24 35     BIT $35
  $80CE  24 35     BIT $35
  $80D0  25 35     AND $35
  $80D2  25 35     AND $35
  $80D4  59 25 59  EOR $5925,Y
  $80D7  25 58     AND $58
  $80D9  60        RTS
  $80DA  58        CLI
  $80DB  60        RTS
  $80DC  59 27 59  EOR $5927,Y
  $80DF  27        .db $27
  $80E0  26 37     ROL $37
  $80E2  26 37     ROL $37
  $80E4  5B        .db $5B
  $80E5  5C        .db $5C
  $80E6  5B        .db $5B
  $80E7  5C        .db $5C
  $80E8  5D 00 5D  EOR $5D00,X
  $80EB  00        BRK
  $80EC  22        .db $22
  $80ED  23        .db $23
  $80EE  22        .db $22
  $80EF  38        SEC
  $80F0  82        .db $82
  $80F1  82        .db $82
  $80F2  58        CLI
  $80F3  60        RTS
  $80F4  82        .db $82
  $80F5  82        .db $82
  $80F6  60        RTS
  $80F7  60        RTS
  $80F8  29 2A     AND #$2A
  $80FA  5A        .db $5A
  $80FB  2A        ROL
  $80FC  5A        .db $5A
  $80FD  2A        ROL
  $80FE  29 2A     AND #$2A
  $8100  2B        .db $2B
  $8101  58        CLI
  $8102  2B        .db $2B
  $8103  58        CLI
  $8104  00        BRK
  $8105  21 82     AND ($82,X)
  $8107  82        .db $82
  $8108  22        .db $22
  $8109  23        .db $23
  $810A  82        .db $82
  $810B  82        .db $82
  $810C  24 25     BIT $25
  $810E  82        .db $82
  $810F  82        .db $82
  $8110  25 25     AND $25
  $8112  82        .db $82
  $8113  82        .db $82
  $8114  26 27     ROL $27
  $8116  82        .db $82
  $8117  82        .db $82
  $8118  82        .db $82
  $8119  82        .db $82
  $811A  60        RTS
  $811B  68        PLA
  $811C  24 25     BIT $25
  $811E  24 33     BIT $33
  $8120  24 25     BIT $25
  $8122  33        .db $33
  $8123  25 24     AND $24
  $8125  25 34     AND $34
  $8127  5A        .db $5A
  $8128  25 25     AND $25
  $812A  5A        .db $5A
  $812B  5A        .db $5A
  $812C  07        .db $07
  $812D  07        .db $07
  $812E  26 27     ROL $27
  $8130  26 27     ROL $27
  $8132  07        .db $07
  $8133  07        .db $07
  $8134  07        .db $07
  $8135  07        .db $07
  $8136  29 2A     AND #$2A
  $8138  29 2A     AND #$2A
  $813A  29 32     AND #$32
  $813C  29 32     AND #$32
  $813E  07        .db $07
  $813F  07        .db $07
  $8140  58        CLI
  $8141  60        RTS
  $8142  2B        .db $2B
  $8143  00        BRK
  $8144  60        RTS
  $8145  60        RTS
  $8146  00        BRK
  $8147  00        BRK
  $8148  2B        .db $2B
  $8149  00        BRK
  $814A  58        CLI
  $814B  60        RTS
  $814C  00        BRK
  $814D  00        BRK
  $814E  60        RTS
  $814F  68        PLA
  $8150  25 25     AND $25
  $8152  25 33     AND $33
  $8154  33        .db $33
  $8155  27        .db $27
  $8156  26 27     ROL $27
  $8158  07        .db $07
  $8159  07        .db $07
  $815A  29 32     AND #$32
  $815C  29 32     AND #$32
  $815E  29 2A     AND #$2A
  $8160  26 37     ROL $37
  $8162  26 37     ROL $37
  $8164  36 59     ROL $59,X
  $8166  36 59     ROL $59,X
  $8168  58        CLI
  $8169  68        PLA
  $816A  58        CLI
  $816B  68        PLA
  $816C  31 5E     AND ($5E),Y
  $816E  29 39     AND #$39
  $8170  29 39     AND #$39
  $8172  31 5B     AND ($5B),Y
  $8174  58        CLI
  $8175  60        RTS
  $8176  82        .db $82
  $8177  82        .db $82
  $8178  68        PLA
  $8179  5B        .db $5B
  $817A  68        PLA
  $817B  5B        .db $5B
  $817C  68        PLA
  $817D  5B        .db $5B
  $817E  82        .db $82
  $817F  82        .db $82
  $8180  5C        .db $5C
  $8181  5D 82 82  EOR $8282,X
  $8184  68        PLA
  $8185  5E 68 5E  LSR $5E68,X
  $8188  58        CLI
  $8189  60        RTS
  $818A  24 25     BIT $25
  $818C  60        RTS
  $818D  60        RTS
  $818E  25 25     AND $25
  $8190  60        RTS
  $8191  60        RTS
  $8192  26 27     ROL $27
  $8194  68        PLA
  $8195  5B        .db $5B
  $8196  29 82     AND #$82
  $8198  60        RTS
  $8199  60        RTS
  $819A  82        .db $82
  $819B  23        .db $23
  $819C  31 5E     AND ($5E),Y
  $819E  82        .db $82
  $819F  5E 60 60  LSR $6060,X
  $81A2  26 37     ROL $37
  $81A4  60        RTS
  $81A5  60        RTS
  $81A6  58        CLI
  $81A7  60        RTS
  $81A8  68        PLA
  $81A9  23        .db $23
  $81AA  68        PLA
  $81AB  23        .db $23
  $81AC  00        BRK
  $81AD  21 49     AND ($49,X)
  $81AF  49 22     EOR #$22
  $81B1  23        .db $23
  $81B2  49 49     EOR #$49
  $81B4  24 25     BIT $25
  $81B6  49 4A     EOR #$4A
  $81B8  47        .db $47
  $81B9  4C 47 4D  JMP $4D47
  $81BC  4E 4B 4F  LSR $4F4B
  $81BF  4B        .db $4B
  $81C0  29 39     AND #$39
  $81C2  29 39     AND #$39
  $81C4  25 25     AND $25
  $81C6  08        PHP
  $81C7  08        PHP
  $81C8  26 37     ROL $37
  $81CA  08        PHP
  $81CB  08        PHP
  $81CC  60        RTS
  $81CD  60        RTS
  $81CE  60        RTS
  $81CF  68        PLA
  $81D0  60        RTS
  $81D1  68        PLA
  $81D2  60        RTS
  $81D3  60        RTS
  $81D4  60        RTS
  $81D5  60        RTS
  $81D6  22        .db $22
  $81D7  23        .db $23
  $81D8  60        RTS
  $81D9  68        PLA
  $81DA  24 25     BIT $25
  $81DC  58        CLI
  $81DD  60        RTS
  $81DE  29 32     AND #$32
  $81E0  22        .db $22
  $81E1  23        .db $23
  $81E2  60        RTS
  $81E3  60        RTS
  $81E4  24 25     BIT $25
  $81E6  60        RTS
  $81E7  60        RTS
  $81E8  25 25     AND $25
  $81EA  60        RTS
  $81EB  60        RTS
  $81EC  26 27     ROL $27
  $81EE  60        RTS
  $81EF  60        RTS
  $81F0  29 32     AND #$32
  $81F2  60        RTS
  $81F3  60        RTS
  $81F4  5B        .db $5B
  $81F5  5C        .db $5C
  $81F6  5E 2D 5E  LSR $5E2D,X
  $81F9  2C 5B 5C  BIT $5C5B
  $81FC  5E 2C 5E  LSR $5E2C,X
  $81FF  2D 5D 00  AND $005D
  $8202  5F        .db $5F
  $8203  00        BRK
  $8204  5F        .db $5F
  $8205  00        BRK
  $8206  5D 00 5A  EOR $5A00,X
  $8209  25 25     AND $25
  $820B  25 5A     AND $5A
  $820D  2A        ROL
  $820E  29 2A     AND #$2A
  $8210  36 5A     ROL $5A,X
  $8212  26 27     ROL $27
  $8214  24 35     BIT $35
  $8216  24 25     BIT $25
  $8218  26 27     ROL $27
  $821A  36 5A     ROL $5A,X
  $821C  31 5A     AND ($5A),Y
  $821E  29 2A     AND #$2A

L_8220:
  $8220  60        RTS
  $8221  60        RTS
  $8222  24 25     BIT $25
  $8224  29 39     AND #$39
  $8226  29 2A     AND #$2A
  $8228  68        PLA
  $8229  5E 68 5E  LSR $5E68,X
  $822C  60        RTS
  $822D  68        PLA
  $822E  82        .db $82
  $822F  82        .db $82
  $8230  2C 5F 2D  BIT $2D5F
  $8233  5F        .db $5F
  $8234  46 46     LSR $46
  $8236  46 46     LSR $46
  $8238  29 32     AND #$32
  $823A  5A        .db $5A
  $823B  5A        .db $5A
  $823C  5A        .db $5A
  $823D  5A        .db $5A
  $823E  29 2A     AND #$2A
  $8240  00        BRK
  $8241  00        BRK
  $8242  00        BRK
  $8243  00        BRK
  $8244  01 01     ORA ($01,X)
  $8246  01 01     ORA ($01,X)
  $8248  63        .db $63
  $8249  65 64     ADC $64
  $824B  66 65     ROR $65
  $824D  65 66     ADC $66
  $824F  66 01     ROR $01
  $8251  63        .db $63
  $8252  01 64     ORA ($64,X)
  $8254  60        RTS
  $8255  60        RTS
  $8256  61 67     ADC ($67,X)
  $8258  60        RTS
  $8259  60        RTS
  $825A  7C        .db $7C
  $825B  7C        .db $7C
  $825C  61 7C     ADC ($7C,X)
  $825E  61 7C     ADC ($7C,X)
  $8260  7C        .db $7C
  $8261  7C        .db $7C
  $8262  7C        .db $7C
  $8263  7C        .db $7C
  $8264  01 01     ORA ($01,X)
  $8266  30 38     BMI $82A0
  $8268  31 39     AND ($39),Y
  $826A  32        .db $32
  $826B  3A        .db $3A
  $826C  01 3B     ORA ($3B,X)
  $826E  01 01     ORA ($01,X)
  $8270  01 29     ORA ($29,X)
  $8272  01 2A     ORA ($2A,X)
  $8274  61 7C     ADC ($7C,X)
  $8276  62        .db $62
  $8277  62        .db $62
  $8278  7C        .db $7C
  $8279  7C        .db $7C
  $827A  62        .db $62
  $827B  62        .db $62
  $827C  1B        .db $1B
  $827D  1B        .db $1B
  $827E  1B        .db $1B
  $827F  1B        .db $1B
  $8280  1E 1D 1E  ASL $1E1D,X
  $8283  1D 1D 1D  ORA $1D1D,X
  $8286  1D 1D 1D  ORA $1D1D,X
  $8289  1D 28 28  ORA $2828,X
  $828C  01 1E     ORA ($1E,X)
  $828E  01 1E     ORA ($1E,X)
  $8290  1D 28 1D  ORA $1D28,X
  $8293  1D 1D 63  ORA $631D,X
  $8296  1D 64 1D  ORA $1D64,X
  $8299  1D 1D 28  ORA $281D,X
  $829C  1D 63 28  ORA $2863,X
  $829F  64        .db $64

L_82A0:
  $82A0  3D 3D 3D  AND $3D3D,X
  $82A3  3D 28 63  AND $6328,X
  $82A6  1D 64 7C  ORA $7C64,X
  $82A9  7C        .db $7C
  $82AA  4C 4E 4D  JMP $4D4E
  $82AD  4F        .db $4F
  $82AE  7C        .db $7C
  $82AF  7C        .db $7C
  $82B0  01 01     ORA ($01,X)
  $82B2  6C 01 01  JMP ($0101)
  $82B5  01 6E     ORA ($6E,X)
  $82B7  77        .db $77
  $82B8  6F        .db $6F
  $82B9  73        .db $73
  $82BA  73        .db $73
  $82BB  74        .db $74
  $82BC  73        .db $73
  $82BD  73        .db $73
  $82BE  74        .db $74
  $82BF  74        .db $74
  $82C0  73        .db $73
  $82C1  73        .db $73
  $82C2  74        .db $74
  $82C3  3E 6D 3E  ROL $3E6D,X
  $82C6  3D 3D 74  AND $743D,X
  $82C9  74        .db $74
  $82CA  74        .db $74
  $82CB  74        .db $74
  $82CC  74        .db $74
  $82CD  3E 74 3E  ROL $3E74,X
  $82D0  3F        .db $3F
  $82D1  3D 3F 3F  AND $3F3F,X
  $82D4  74        .db $74
  $82D5  73        .db $73
  $82D6  74        .db $74
  $82D7  74        .db $74
  $82D8  3E 3D 3E  ROL $3E3D,X
  $82DB  3D 75 75  AND $7575,X
  $82DE  3D 3D 75  AND $753D,X
  $82E1  75 3F     ADC $3F,X
  $82E3  3D 3E 3F  AND $3F3E,X
  $82E6  3D 3D 75  AND $753D,X
  $82E9  75 3E     ADC $3E,X
  $82EB  3F        .db $3F
  $82EC  73        .db $73
  $82ED  73        .db $73
  $82EE  82        .db $82
  $82EF  82        .db $82
  $82F0  73        .db $73
  $82F1  73        .db $73
  $82F2  82        .db $82
  $82F3  3D 3D 3F  AND $3F3D,X
  $82F6  3D 3D 6F  AND $6F3D,X
  $82F9  73        .db $73
  $82FA  3D 74 3D  AND $3D74,X
  $82FD  74        .db $74
  $82FE  3F        .db $3F
  $82FF  75 73     ADC $73,X
  $8301  3E 74 3E  ROL $3E74,X
  $8304  74        .db $74
  $8305  3E 74 3E  ROL $3E74,X
  $8308  75 3E     ADC $3E,X
  $830A  82        .db $82
  $830B  3D 3D 82  AND $823D,X
  $830E  3D 73 3D  AND $3D73,X
  $8311  74        .db $74
  $8312  3F        .db $3F
  $8313  74        .db $74
  $8314  3D 74 3F  AND $3F74,X
  $8317  75 82     ADC $82,X
  $8319  82        .db $82
  $831A  73        .db $73
  $831B  73        .db $73
  $831C  74        .db $74
  $831D  74        .db $74
  $831E  75 75     ADC $75,X
  $8320  82        .db $82
  $8321  82        .db $82
  $8322  3E 3D 3E  ROL $3E3D,X
  $8325  3F        .db $3F
  $8326  3E 3D 75  ROL $753D,X
  $8329  75 82     ADC $82,X
  $832B  82        .db $82
  $832C  01 01     ORA ($01,X)
  $832E  6B        .db $6B
  $832F  6C 73 6D  JMP ($6D73)
  $8332  3E 3F 01  ROL $013F,X
  $8335  01 01     ORA ($01,X)
  $8337  6E 3E 6F  ROR $6F3E
  $833A  3D 3D 01  AND $013D,X
  $833D  01 77     ORA ($77,X)
  $833F  01 01     ORA ($01,X)
  $8341  01 82     ORA ($82,X)
  $8343  82        .db $82
  $8344  01 01     ORA ($01,X)
  $8346  82        .db $82
  $8347  01 60     ORA ($60,X)
  $8349  60        RTS
  $834A  58        CLI
  $834B  7C        .db $7C
  $834C  60        RTS
  $834D  60        RTS
  $834E  61 7C     ADC ($7C,X)
  $8350  60        RTS
  $8351  01 58     ORA ($58,X)
  $8353  01 59     ORA ($59,X)
  $8355  7C        .db $7C
  $8356  59 7C 59  EOR $597C,Y
  $8359  01 59     ORA ($59,X)
  $835B  01 5A     ORA ($5A,X)
  $835D  01 7C     ORA ($7C,X)
  $835F  01 5A     ORA ($5A,X)
  $8361  7C        .db $7C
  $8362  7C        .db $7C
  $8363  7C        .db $7C
  $8364  58        CLI
  $8365  60        RTS
  $8366  59 7C 58  EOR $587C,Y
  $8369  7C        .db $7C
  $836A  59 7C 01  EOR $017C,Y
  $836D  01 01     ORA ($01,X)
  $836F  6B        .db $6B
  $8370  60        RTS
  $8371  60        RTS
  $8372  7C        .db $7C
  $8373  61 7C     ADC ($7C,X)
  $8375  61 7C     ADC ($7C,X)
  $8377  61 7C     ADC ($7C,X)
  $8379  61 62     ADC ($62,X)
  $837B  62        .db $62
  $837C  5A        .db $5A
  $837D  7C        .db $7C
  $837E  62        .db $62
  $837F  62        .db $62
  $8380  00        BRK
  $8381  00        BRK
  $8382  76 00     ROR $00,X
  $8384  76 00     ROR $00,X
  $8386  76 00     ROR $00,X
  $8388  00        BRK
  $8389  76 00     ROR $00,X
  $838B  00        BRK
  $838C  1F        .db $1F
  $838D  01 27     ORA ($27,X)
  $838F  01 1B     ORA ($1B,X)
  $8391  27        .db $27
  $8392  1B        .db $1B
  $8393  1B        .db $1B
  $8394  1F        .db $1F
  $8395  1B        .db $1B
  $8396  27        .db $27
  $8397  1B        .db $1B
  $8398  1B        .db $1B
  $8399  1B        .db $1B
  $839A  1B        .db $1B
  $839B  1F        .db $1F
  $839C  1B        .db $1B
  $839D  01 1B     ORA ($1B,X)
  $839F  01 1B     ORA ($1B,X)
  $83A1  27        .db $27
  $83A2  1F        .db $1F
  $83A3  1B        .db $1B
  $83A4  01 1B     ORA ($1B,X)
  $83A6  27        .db $27
  $83A7  1F        .db $1F
  $83A8  27        .db $27
  $83A9  01 1B     ORA ($1B,X)
  $83AB  01 1F     ORA ($1F,X)
  $83AD  01 01     ORA ($01,X)
  $83AF  01 27     ORA ($27,X)
  $83B1  01 1F     ORA ($1F,X)
  $83B3  01 1B     ORA ($1B,X)
  $83B5  1B        .db $1B
  $83B6  1B        .db $1B
  $83B7  1B        .db $1B
  $83B8  1B        .db $1B
  $83B9  01 1F     ORA ($1F,X)
  $83BB  01 1B     ORA ($1B,X)
  $83BD  01 1B     ORA ($1B,X)
  $83BF  27        .db $27
  $83C0  1B        .db $1B
  $83C1  1B        .db $1B
  $83C2  1F        .db $1F
  $83C3  1B        .db $1B
  $83C4  01 1B     ORA ($1B,X)
  $83C6  01 1F     ORA ($1F,X)
  $83C8  01 01     ORA ($01,X)
  $83CA  27        .db $27
  $83CB  01 27     ORA ($27,X)
  $83CD  1B        .db $1B
  $83CE  1B        .db $1B
  $83CF  1B        .db $1B
  $83D0  1B        .db $1B
  $83D1  27        .db $27
  $83D2  1B        .db $1B
  $83D3  1F        .db $1F
  $83D4  27        .db $27
  $83D5  01 1B     ORA ($1B,X)
  $83D7  27        .db $27
  $83D8  1F        .db $1F
  $83D9  1B        .db $1B
  $83DA  01 1F     ORA ($1F,X)
  $83DC  01 1F     ORA ($1F,X)
  $83DE  01 01     ORA ($01,X)
  $83E0  5A        .db $5A
  $83E1  5A        .db $5A
  $83E2  29 32     AND #$32
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
  $8404  A0 AA     LDY #$AA
  $8406  AA        TAX
  $8407  AA        TAX
  $8408  AA        TAX
  $8409  AA        TAX
  $840A  0A        ASL
  $840B  0A        ASL
  $840C  5A        .db $5A
  $840D  55 5F     EOR $5F,X
  $840F  AA        TAX
  $8410  6A        ROR
  $8411  5A        .db $5A
  $8412  5A        .db $5A
  $8413  5A        .db $5A
  $8414  5D 57 AA  EOR $AA57,X
  $8417  AA        TAX
  $8418  AA        TAX
  $8419  AA        TAX
  $841A  AA        TAX
  $841B  2A        ROL
  $841C  8A        TXA
  $841D  22        .db $22
  $841E  AA        TAX
  $841F  AA        TAX
  $8420  6A        ROR
  $8421  9A        TXS
  $8422  22        .db $22
  $8423  88        DEY
  $8424  2A        ROL
  $8425  8A        TXA
  $8426  AA        TAX
  $8427  AA        TAX
  $8428  88        DEY
  $8429  AA        TAX
  $842A  FB        .db $FB
  $842B  0F        .db $0F
  $842C  A8        TAY
  $842D  AA        TAX
  $842E  05 05     ORA $05
  $8430  01 00     ORA ($00,X)
  $8432  0A        ASL
  $8433  AA        TAX
  $8434  AA        TAX
  $8435  A0 00     LDY #$00
  $8437  A0 AA     LDY #$AA
  $8439  55 05     EOR $05,X
  $843B  AA        TAX
  $843C  00        BRK
  $843D  00        BRK
  $843E  A2 A8     LDX #$A8
  $8440  0A        ASL
  $8441  20 22 22  JSR $2222
  $8444  22        .db $22
  $8445  22        .db $22
  $8446  00        BRK
  $8447  AA        TAX
  $8448  AA        TAX
  $8449  2A        ROL
  $844A  22        .db $22
  $844B  88        DEY
  $844C  22        .db $22
  $844D  88        DEY
  $844E  AA        TAX
  $844F  22        .db $22
  $8450  08        PHP
  $8451  00        BRK
  $8452  02        .db $02
  $8453  00        BRK
  $8454  AA        TAX
  $8455  AA        TAX
  $8456  88        DEY
  $8457  AA        TAX

L_8458:
  $8458  AA        TAX
  $8459  0A        ASL
  $845A  00        BRK
  $845B  9A        TXS
  $845C  6A        ROR
  $845D  00        BRK
  $845E  50 10     BVC $8470
  $8460  11 50     ORA ($50),Y
  $8462  88        DEY
  $8463  88        DEY
  $8464  88        DEY
  $8465  18        CLC
  $8466  80        .db $80
  $8467  52        .db $52
  $8468  88        DEY
  $8469  00        BRK
  $846A  A0 20     LDY #$20
  $846C  22        .db $22
  $846D  22        .db $22
  $846E  00        BRK
  $846F  00        BRK

L_8470:
  $8470  AA        TAX
  $8471  22        .db $22
  $8472  22        .db $22
  $8473  00        BRK
  $8474  00        BRK
  $8475  88        DEY
  $8476  88        DEY
  $8477  88        DEY
  $8478  22        .db $22
  $8479  22        .db $22
  $847A  22        .db $22
  $847B  22        .db $22
  $847C  22        .db $22
  $847D  D5 75     CMP $75,X
  $847F  F5 05     SBC $05,X
  $8481  05 A8     ORA $A8
  $8483  A8        TAY
  $8484  8A        TXA
  $8485  AA        TAX
  $8486  2A        ROL
  $8487  8A        TXA
  $8488  88        DEY
  $8489  AA        TAX
  $848A  50 00     BVC $848C

L_848C:
  $848C  5F        .db $5F
  $848D  00        BRK
  $848E  22        .db $22
  $848F  88        DEY
  $8490  00        BRK
  $8491  00        BRK
  $8492  AA        TAX
  $8493  AA        TAX
  $8494  A0 00     LDY #$00
  $8496  00        BRK
  $8497  00        BRK
  $8498  00        BRK
  $8499  00        BRK
  $849A  00        BRK
  $849B  00        BRK
  $849C  05 00     ORA $00
  $849E  00        BRK
  $849F  55 FF     EOR $FF,X
  $84A1  FF        .db $FF
  $84A2  FF        .db $FF
  $84A3  F0 FF     BEQ $84A4
  $84A5  AF        .db $AF
  $84A6  FF        .db $FF
  $84A7  AF        .db $AF
  $84A8  FF        .db $FF
  $84A9  AF        .db $AF
  $84AA  00        BRK
  $84AB  00        BRK
  $84AC  00        BRK
  $84AD  00        BRK
  $84AE  A8        TAY
  $84AF  AA        TAX
  $84B0  EA        NOP
  $84B1  FC        .db $FC
  $84B2  AA        TAX
  $84B3  FA        .db $FA
  $84B4  FF        .db $FF
  $84B5  AA        TAX
  $84B6  FF        .db $FF
  $84B7  EE EE FF  INC $FFEE
  $84BA  EE 22 E2  INC $E222
  $84BD  FF        .db $FF
  $84BE  AC AF FA  LDY $FAAF
  $84C1  FA        .db $FA
  $84C2  F2        .db $F2
  $84C3  8F        .db $8F
  $84C4  AF        .db $AF
  $84C5  AF        .db $AF
  $84C6  88        DEY
  $84C7  AA        TAX
  $84C8  CC FF 22  CPY $22FF
  $84CB  00        BRK
  $84CC  CE 00 CF  DEC $CF00
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
  $84DF  00        BRK
  $84E0  00        BRK
  $84E1  00        BRK
  $84E2  00        BRK
  $84E3  55 55     EOR $55,X
  $84E5  55 55     EOR $55,X
  $84E7  55 55     EOR $55,X
  $84E9  55 55     EOR $55,X
  $84EB  55 55     EOR $55,X
  $84ED  55 55     EOR $55,X
  $84EF  55 55     EOR $55,X
  $84F1  55 55     EOR $55,X
  $84F3  55 55     EOR $55,X
  $84F5  55 55     EOR $55,X
  $84F7  55 88     EOR $88,X
  $84F9  77        .db $77
  $84FA  77        .db $77
  $84FB  77        .db $77
  $84FC  77        .db $77
  $84FD  77        .db $77
  $84FE  77        .db $77
  $84FF  77        .db $77
  $8500  02        .db $02
  $8501  02        .db $02
  $8502  02        .db $02
  $8503  02        .db $02
  $8504  02        .db $02
  $8505  8A        TXA
  $8506  0E 01 04  ASL $0401
  $8509  05 06     ORA $06
  $850B  07        .db $07
  $850C  08        PHP
  $850D  0C        .db $0C
  $850E  0D 01 04  ORA $0401
  $8511  05 06     ORA $06
  $8513  07        .db $07
  $8514  08        PHP
  $8515  11 0E     ORA ($0E),Y
  $8517  01 04     ORA ($04,X)
  $8519  05 06     ORA $06
  $851B  07        .db $07
  $851C  08        PHP
  $851D  11 0E     ORA ($0E),Y
  $851F  00        BRK

L_8520:
  $8520  04        .db $04
  $8521  05 06     ORA $06
  $8523  07        .db $07
  $8524  08        PHP
  $8525  0C        .db $0C
  $8526  0D 00 03  ORA $0300
  $8529  05 06     ORA $06
  $852B  07        .db $07
  $852C  08        PHP
  $852D  11 0E     ORA ($0E),Y
  $852F  00        BRK
  $8530  03        .db $03
  $8531  05 06     ORA $06
  $8533  07        .db $07
  $8534  08        PHP
  $8535  0C        .db $0C
  $8536  0D 00 03  ORA $0300
  $8539  05 06     ORA $06
  $853B  07        .db $07
  $853C  08        PHP
  $853D  11 0E     ORA ($0E),Y
  $853F  00        BRK
  $8540  03        .db $03
  $8541  05 06     ORA $06
  $8543  07        .db $07
  $8544  08        PHP
  $8545  70 0E     BVS $8555
  $8547  00        BRK
  $8548  03        .db $03
  $8549  05 06     ORA $06
  $854B  07        .db $07
  $854C  08        PHP
  $854D  10 0E     BPL $855D
  $854F  00        BRK
  $8550  03        .db $03
  $8551  05 06     ORA $06
  $8553  07        .db $07
  $8554  08        PHP

L_8555:
  $8555  12        .db $12
  $8556  14        .db $14
  $8557  00        BRK
  $8558  04        .db $04
  $8559  05 06     ORA $06
  $855B  07        .db $07
  $855C  08        PHP

L_855D:
  $855D  11 0E     ORA ($0E),Y
  $855F  00        BRK
  $8560  03        .db $03
  $8561  05 06     ORA $06
  $8563  07        .db $07
  $8564  08        PHP
  $8565  70 0E     BVS $8575
  $8567  00        BRK
  $8568  03        .db $03
  $8569  05 06     ORA $06
  $856B  07        .db $07
  $856C  08        PHP
  $856D  10 0E     BPL $857D
  $856F  00        BRK
  $8570  03        .db $03
  $8571  05 06     ORA $06
  $8573  07        .db $07
  $8574  08        PHP

L_8575:
  $8575  13        .db $13
  $8576  15 00     ORA $00,X
  $8578  04        .db $04
  $8579  05 06     ORA $06
  $857B  07        .db $07
  $857C  08        PHP

L_857D:
  $857D  12        .db $12
  $857E  14        .db $14
  $857F  00        BRK
  $8580  03        .db $03
  $8581  05 06     ORA $06
  $8583  07        .db $07
  $8584  08        PHP
  $8585  70 0E     BVS $8595
  $8587  00        BRK
  $8588  03        .db $03
  $8589  05 06     ORA $06
  $858B  07        .db $07
  $858C  08        PHP
  $858D  10 0E     BPL $859D
  $858F  00        BRK
  $8590  03        .db $03
  $8591  05 06     ORA $06
  $8593  07        .db $07
  $8594  08        PHP

L_8595:
  $8595  0C        .db $0C
  $8596  0D 00 03  ORA $0300
  $8599  05 06     ORA $06
  $859B  07        .db $07
  $859C  08        PHP

L_859D:
  $859D  11 0E     ORA ($0E),Y
  $859F  00        BRK
  $85A0  04        .db $04
  $85A1  05 06     ORA $06
  $85A3  07        .db $07
  $85A4  08        PHP
  $85A5  13        .db $13
  $85A6  15 00     ORA $00,X
  $85A8  03        .db $03
  $85A9  05 16     ORA $16
  $85AB  07        .db $07
  $85AC  08        PHP
  $85AD  11 0E     ORA ($0E),Y
  $85AF  00        BRK
  $85B0  03        .db $03
  $85B1  05 06     ORA $06
  $85B3  07        .db $07
  $85B4  08        PHP
  $85B5  13        .db $13
  $85B6  15 00     ORA $00,X
  $85B8  03        .db $03
  $85B9  05 06     ORA $06
  $85BB  17        .db $17
  $85BC  08        PHP
  $85BD  5B        .db $5B
  $85BE  0E 00 03  ASL $0300
  $85C1  05 06     ORA $06
  $85C3  07        .db $07
  $85C4  08        PHP
  $85C5  20 15 00  JSR $0015
  $85C8  03        .db $03
  $85C9  05 06     ORA $06
  $85CB  07        .db $07
  $85CC  08        PHP
  $85CD  21 14     AND ($14,X)
  $85CF  00        BRK
  $85D0  03        .db $03
  $85D1  05 18     ORA $18
  $85D3  07        .db $07
  $85D4  1B        .db $1B
  $85D5  22        .db $22
  $85D6  0E 00 03  ASL $0300
  $85D9  05 06     ORA $06
  $85DB  07        .db $07
  $85DC  1C        .db $1C
  $85DD  23        .db $23
  $85DE  0E 00 03  ASL $0300
  $85E1  05 06     ORA $06
  $85E3  19 08 24  ORA $2408,Y
  $85E6  0E 00 03  ASL $0300
  $85E9  05 06     ORA $06
  $85EB  1A        .db $1A
  $85EC  1D 22 0E  ORA $0E22,X
  $85EF  00        BRK
  $85F0  03        .db $03
  $85F1  05 06     ORA $06
  $85F3  07        .db $07
  $85F4  1E 25 0E  ASL $0E25,X
  $85F7  00        BRK
  $85F8  03        .db $03
  $85F9  05 06     ORA $06
  $85FB  1A        .db $1A
  $85FC  1D 22 0E  ORA $0E22,X
  $85FF  00        BRK
  $8600  03        .db $03
  $8601  05 06     ORA $06
  $8603  07        .db $07
  $8604  08        PHP
  $8605  70 0E     BVS $8615
  $8607  00        BRK
  $8608  03        .db $03
  $8609  05 16     ORA $16
  $860B  07        .db $07
  $860C  27        .db $27
  $860D  22        .db $22
  $860E  0E 00 03  ASL $0300
  $8611  05 06     ORA $06
  $8613  07        .db $07
  $8614  08        PHP

L_8615:
  $8615  70 0E     BVS $8625
  $8617  00        BRK
  $8618  03        .db $03
  $8619  05 06     ORA $06
  $861B  26 28     ROL $28
  $861D  23        .db $23
  $861E  0E 00 03  ASL $0300
  $8621  05 16     ORA $16
  $8623  07        .db $07
  $8624  08        PHP

L_8625:
  $8625  70 0E     BVS $8635
  $8627  00        BRK
  $8628  03        .db $03
  $8629  05 06     ORA $06
  $862B  07        .db $07
  $862C  29 23     AND #$23
  $862E  0E 00 03  ASL $0300
  $8631  05 06     ORA $06
  $8633  07        .db $07
  $8634  27        .db $27

L_8635:
  $8635  22        .db $22
  $8636  0E 00 03  ASL $0300
  $8639  1F        .db $1F
  $863A  06 07     ASL $07
  $863C  08        PHP
  $863D  70 0E     BVS $864D
  $863F  00        BRK
  $8640  03        .db $03
  $8641  05 06     ORA $06
  $8643  07        .db $07
  $8644  29 23     AND #$23
  $8646  0E 00 03  ASL $0300
  $8649  05 06     ORA $06
  $864B  07        .db $07
  $864C  27        .db $27

L_864D:
  $864D  22        .db $22
  $864E  0E 00 03  ASL $0300
  $8651  05 16     ORA $16
  $8653  07        .db $07
  $8654  08        PHP
  $8655  70 0E     BVS $8665
  $8657  00        BRK
  $8658  03        .db $03
  $8659  05 06     ORA $06
  $865B  07        .db $07
  $865C  29 23     AND #$23
  $865E  0E 00 03  ASL $0300
  $8661  05 06     ORA $06
  $8663  07        .db $07
  $8664  27        .db $27

L_8665:
  $8665  22        .db $22
  $8666  0E 00 03  ASL $0300
  $8669  05 06     ORA $06
  $866B  07        .db $07
  $866C  08        PHP
  $866D  70 0E     BVS $867D
  $866F  00        BRK
  $8670  03        .db $03
  $8671  05 16     ORA $16
  $8673  07        .db $07
  $8674  27        .db $27
  $8675  22        .db $22
  $8676  0E 00 03  ASL $0300
  $8679  05 06     ORA $06
  $867B  07        .db $07
  $867C  08        PHP

L_867D:
  $867D  89        .db $89
  $867E  2A        ROL
  $867F  2B        .db $2B
  $8680  04        .db $04
  $8681  05 06     ORA $06
  $8683  07        .db $07
  $8684  29 83     AND #$83
  $8686  0A        ASL
  $8687  00        BRK
  $8688  04        .db $04
  $8689  05 06     ORA $06
  $868B  07        .db $07
  $868C  86 09     STX $09
  $868E  0A        ASL
  $868F  00        BRK
  $8690  04        .db $04
  $8691  05 85     ORA $85
  $8693  82        .db $82
  $8694  08        PHP
  $8695  09 0A     ORA #$0A
  $8697  00        BRK
  $8698  04        .db $04
  $8699  05 06     ORA $06
  $869B  07        .db $07
  $869C  08        PHP
  $869D  09 0A     ORA #$0A
  $869F  00        BRK
  $86A0  04        .db $04
  $86A1  05 06     ORA $06
  $86A3  07        .db $07
  $86A4  08        PHP
  $86A5  87        .db $87
  $86A6  0A        ASL
  $86A7  00        BRK
  $86A8  04        .db $04
  $86A9  05 06     ORA $06
  $86AB  07        .db $07
  $86AC  84 09     STY $09
  $86AE  0A        ASL
  $86AF  00        BRK
  $86B0  04        .db $04
  $86B1  05 06     ORA $06
  $86B3  07        .db $07
  $86B4  08        PHP
  $86B5  09 0A     ORA #$0A
  $86B7  00        BRK
  $86B8  04        .db $04
  $86B9  05 06     ORA $06
  $86BB  07        .db $07
  $86BC  08        PHP
  $86BD  0F        .db $0F
  $86BE  2E 00 03  ROL $0300
  $86C1  05 06     ORA $06
  $86C3  34        .db $34
  $86C4  37        .db $37
  $86C5  0F        .db $0F
  $86C6  2F        .db $2F
  $86C7  02        .db $02
  $86C8  03        .db $03
  $86C9  05 32     ORA $32
  $86CB  34        .db $34
  $86CC  37        .db $37
  $86CD  0F        .db $0F
  $86CE  2E 00 03  ROL $0300
  $86D1  05 32     ORA $32
  $86D3  07        .db $07
  $86D4  08        PHP
  $86D5  0F        .db $0F
  $86D6  2E 00 03  ROL $0300
  $86D9  05 06     ORA $06
  $86DB  07        .db $07
  $86DC  38        SEC
  $86DD  39 3A 00  AND $003A,Y
  $86E0  03        .db $03
  $86E1  05 33     ORA $33
  $86E3  35 38     AND $38,X
  $86E5  39 3A 00  AND $003A,Y
  $86E8  03        .db $03
  $86E9  05 33     ORA $33
  $86EB  36 03     ROL $03,X
  $86ED  39 3A 00  AND $003A,Y
  $86F0  03        .db $03
  $86F1  05 06     ORA $06
  $86F3  07        .db $07
  $86F4  08        PHP
  $86F5  2D 30 31  AND $3130
  $86F8  02        .db $02
  $86F9  02        .db $02
  $86FA  02        .db $02
  $86FB  02        .db $02
  $86FC  02        .db $02
  $86FD  02        .db $02
  $86FE  02        .db $02
  $86FF  02        .db $02
  $8700  02        .db $02
  $8701  02        .db $02
  $8702  02        .db $02
  $8703  02        .db $02
  $8704  02        .db $02
  $8705  02        .db $02
  $8706  02        .db $02
  $8707  02        .db $02
  $8708  04        .db $04
  $8709  3B        .db $3B
  $870A  3C        .db $3C
  $870B  3D 3D 3D  AND $3D3D,X
  $870E  3D 3D 04  AND $043D,X
  $8711  05 06     ORA $06
  $8713  07        .db $07
  $8714  27        .db $27
  $8715  3E 40 02  ROL $0240,X
  $8718  04        .db $04
  $8719  05 06     ORA $06
  $871B  07        .db $07
  $871C  08        PHP
  $871D  09 40     ORA #$40
  $871F  02        .db $02
  $8720  04        .db $04
  $8721  05 06     ORA $06
  $8723  07        .db $07
  $8724  29 3F     AND #$3F
  $8726  40        RTI
  $8727  02        .db $02
  $8728  04        .db $04
  $8729  05 06     ORA $06
  $872B  07        .db $07
  $872C  27        .db $27
  $872D  3E 40 02  ROL $0240,X
  $8730  8B        .db $8B
  $8731  42        .db $42
  $8732  43        .db $43
  $8733  44        .db $44
  $8734  45 3E     EOR $3E
  $8736  40        RTI
  $8737  02        .db $02
  $8738  02        .db $02
  $8739  02        .db $02
  $873A  02        .db $02
  $873B  02        .db $02
  $873C  02        .db $02
  $873D  02        .db $02
  $873E  02        .db $02
  $873F  02        .db $02
  $8740  02        .db $02
  $8741  02        .db $02
  $8742  02        .db $02
  $8743  02        .db $02
  $8744  02        .db $02
  $8745  02        .db $02
  $8746  02        .db $02
  $8747  02        .db $02
  $8748  46 05     LSR $05
  $874A  06 07     ASL $07
  $874C  08        PHP
  $874D  0F        .db $0F
  $874E  01 02     ORA ($02,X)
  $8750  03        .db $03
  $8751  05 06     ORA $06
  $8753  07        .db $07
  $8754  08        PHP
  $8755  0F        .db $0F
  $8756  01 02     ORA ($02,X)
  $8758  03        .db $03
  $8759  05 06     ORA $06
  $875B  07        .db $07
  $875C  08        PHP
  $875D  0F        .db $0F
  $875E  01 02     ORA ($02,X)
  $8760  03        .db $03
  $8761  05 06     ORA $06
  $8763  07        .db $07
  $8764  08        PHP
  $8765  0F        .db $0F
  $8766  01 02     ORA ($02,X)
  $8768  03        .db $03
  $8769  05 47     ORA $47
  $876B  07        .db $07
  $876C  08        PHP
  $876D  0F        .db $0F
  $876E  01 02     ORA ($02,X)
  $8770  03        .db $03
  $8771  05 06     ORA $06
  $8773  07        .db $07
  $8774  08        PHP
  $8775  0F        .db $0F
  $8776  01 02     ORA ($02,X)
  $8778  03        .db $03
  $8779  05 06     ORA $06
  $877B  17        .db $17
  $877C  08        PHP
  $877D  0F        .db $0F
  $877E  01 02     ORA ($02,X)
  $8780  03        .db $03
  $8781  05 06     ORA $06
  $8783  07        .db $07
  $8784  08        PHP
  $8785  0F        .db $0F
  $8786  01 02     ORA ($02,X)
  $8788  03        .db $03
  $8789  05 06     ORA $06
  $878B  07        .db $07
  $878C  08        PHP
  $878D  0F        .db $0F
  $878E  01 02     ORA ($02,X)
  $8790  03        .db $03
  $8791  05 48     ORA $48
  $8793  26 28     ROL $28
  $8795  8F        .db $8F
  $8796  50 51     BVC $87E9
  $8798  03        .db $03
  $8799  05 06     ORA $06
  $879B  07        .db $07
  $879C  08        PHP
  $879D  4E 52 53  LSR $5352
  $87A0  03        .db $03
  $87A1  05 06     ORA $06
  $87A3  07        .db $07
  $87A4  08        PHP
  $87A5  0F        .db $0F
  $87A6  01 02     ORA ($02,X)
  $87A8  03        .db $03
  $87A9  05 49     ORA $49
  $87AB  4A        LSR
  $87AC  1D 8E 01  ORA $018E,X
  $87AF  02        .db $02
  $87B0  03        .db $03
  $87B1  05 06     ORA $06
  $87B3  07        .db $07
  $87B4  08        PHP
  $87B5  09 0A     ORA #$0A
  $87B7  00        BRK
  $87B8  03        .db $03
  $87B9  05 06     ORA $06
  $87BB  07        .db $07
  $87BC  08        PHP
  $87BD  0F        .db $0F
  $87BE  01 02     ORA ($02,X)
  $87C0  03        .db $03
  $87C1  05 06     ORA $06
  $87C3  07        .db $07
  $87C4  55 0F     EOR $0F,X
  $87C6  01 02     ORA ($02,X)
  $87C8  03        .db $03
  $87C9  05 06     ORA $06
  $87CB  54        .db $54
  $87CC  08        PHP
  $87CD  0F        .db $0F
  $87CE  01 02     ORA ($02,X)
  $87D0  03        .db $03
  $87D1  05 06     ORA $06
  $87D3  07        .db $07
  $87D4  08        PHP
  $87D5  0F        .db $0F
  $87D6  01 02     ORA ($02,X)
  $87D8  03        .db $03
  $87D9  05 18     ORA $18
  $87DB  07        .db $07
  $87DC  08        PHP
  $87DD  0F        .db $0F
  $87DE  01 02     ORA ($02,X)
  $87E0  03        .db $03
  $87E1  05 06     ORA $06
  $87E3  07        .db $07
  $87E4  08        PHP
  $87E5  09 0A     ORA #$0A
  $87E7  00        BRK
  $87E8  03        .db $03

L_87E9:
  $87E9  05 06     ORA $06
  $87EB  1A        .db $1A
  $87EC  1D 0F 01  ORA $010F,X
  $87EF  02        .db $02
  $87F0  03        .db $03
  $87F1  05 48     ORA $48
  $87F3  07        .db $07
  $87F4  08        PHP
  $87F5  0F        .db $0F
  $87F6  01 02     ORA ($02,X)
  $87F8  03        .db $03
  $87F9  05 06     ORA $06
  $87FB  07        .db $07
  $87FC  08        PHP
  $87FD  0F        .db $0F
  $87FE  01 02     ORA ($02,X)
  $8800  03        .db $03
  $8801  05 06     ORA $06
  $8803  07        .db $07
  $8804  08        PHP
  $8805  0F        .db $0F
  $8806  01 02     ORA ($02,X)
  $8808  03        .db $03
  $8809  05 06     ORA $06
  $880B  07        .db $07
  $880C  08        PHP
  $880D  09 0A     ORA #$0A
  $880F  00        BRK
  $8810  03        .db $03
  $8811  05 49     ORA $49
  $8813  4A        LSR
  $8814  08        PHP
  $8815  8E 01 02  STX $0201
  $8818  03        .db $03
  $8819  05 06     ORA $06
  $881B  07        .db $07
  $881C  08        PHP
  $881D  0F        .db $0F
  $881E  01 02     ORA ($02,X)
  $8820  03        .db $03
  $8821  05 48     ORA $48
  $8823  07        .db $07
  $8824  08        PHP
  $8825  0F        .db $0F
  $8826  01 02     ORA ($02,X)
  $8828  03        .db $03
  $8829  05 06     ORA $06
  $882B  07        .db $07
  $882C  08        PHP
  $882D  57        .db $57
  $882E  50 51     BVC $8881
  $8830  03        .db $03
  $8831  05 06     ORA $06
  $8833  07        .db $07
  $8834  08        PHP
  $8835  09 0A     ORA #$0A
  $8837  00        BRK
  $8838  03        .db $03
  $8839  05 06     ORA $06
  $883B  26 28     ROL $28
  $883D  0F        .db $0F
  $883E  01 02     ORA ($02,X)
  $8840  03        .db $03
  $8841  05 06     ORA $06
  $8843  07        .db $07
  $8844  08        PHP
  $8845  0F        .db $0F
  $8846  01 02     ORA ($02,X)
  $8848  03        .db $03
  $8849  05 06     ORA $06
  $884B  07        .db $07
  $884C  08        PHP
  $884D  09 0A     ORA #$0A
  $884F  00        BRK
  $8850  03        .db $03
  $8851  05 06     ORA $06
  $8853  07        .db $07
  $8854  08        PHP
  $8855  0F        .db $0F
  $8856  01 02     ORA ($02,X)
  $8858  03        .db $03
  $8859  05 06     ORA $06
  $885B  07        .db $07
  $885C  08        PHP
  $885D  0F        .db $0F
  $885E  01 02     ORA ($02,X)
  $8860  03        .db $03
  $8861  05 06     ORA $06
  $8863  07        .db $07
  $8864  08        PHP
  $8865  09 0A     ORA #$0A
  $8867  00        BRK
  $8868  03        .db $03
  $8869  05 06     ORA $06
  $886B  07        .db $07
  $886C  08        PHP
  $886D  0F        .db $0F
  $886E  01 02     ORA ($02,X)
  $8870  03        .db $03
  $8871  05 06     ORA $06
  $8873  07        .db $07
  $8874  08        PHP
  $8875  0F        .db $0F
  $8876  01 02     ORA ($02,X)
  $8878  03        .db $03
  $8879  05 06     ORA $06
  $887B  07        .db $07
  $887C  08        PHP
  $887D  0F        .db $0F
  $887E  01 02     ORA ($02,X)
  $8880  04        .db $04

L_8881:
  $8881  05 06     ORA $06
  $8883  07        .db $07
  $8884  08        PHP
  $8885  0F        .db $0F
  $8886  01 02     ORA ($02,X)
  $8888  04        .db $04
  $8889  05 06     ORA $06
  $888B  07        .db $07
  $888C  59 0F 01  EOR $010F,Y
  $888F  02        .db $02
  $8890  04        .db $04
  $8891  05 06     ORA $06
  $8893  07        .db $07
  $8894  59 0F 01  EOR $010F,Y
  $8897  02        .db $02
  $8898  04        .db $04
  $8899  05 06     ORA $06
  $889B  34        .db $34
  $889C  5A        .db $5A
  $889D  0F        .db $0F
  $889E  01 02     ORA ($02,X)
  $88A0  04        .db $04
  $88A1  05 06     ORA $06
  $88A3  34        .db $34
  $88A4  5A        .db $5A
  $88A5  0F        .db $0F
  $88A6  01 02     ORA ($02,X)
  $88A8  04        .db $04
  $88A9  05 06     ORA $06
  $88AB  34        .db $34
  $88AC  5A        .db $5A
  $88AD  0F        .db $0F
  $88AE  01 02     ORA ($02,X)
  $88B0  04        .db $04
  $88B1  05 06     ORA $06
  $88B3  07        .db $07
  $88B4  08        PHP
  $88B5  0F        .db $0F
  $88B6  01 02     ORA ($02,X)
  $88B8  04        .db $04
  $88B9  05 06     ORA $06
  $88BB  07        .db $07
  $88BC  08        PHP
  $88BD  0F        .db $0F
  $88BE  01 02     ORA ($02,X)
  $88C0  04        .db $04
  $88C1  05 06     ORA $06
  $88C3  07        .db $07
  $88C4  08        PHP
  $88C5  0F        .db $0F
  $88C6  01 02     ORA ($02,X)
  $88C8  04        .db $04
  $88C9  05 06     ORA $06
  $88CB  07        .db $07
  $88CC  08        PHP
  $88CD  0F        .db $0F
  $88CE  01 02     ORA ($02,X)
  $88D0  04        .db $04
  $88D1  05 06     ORA $06
  $88D3  07        .db $07
  $88D4  08        PHP
  $88D5  0F        .db $0F
  $88D6  01 02     ORA ($02,X)
  $88D8  04        .db $04
  $88D9  05 06     ORA $06
  $88DB  07        .db $07
  $88DC  08        PHP
  $88DD  0F        .db $0F
  $88DE  01 02     ORA ($02,X)
  $88E0  04        .db $04
  $88E1  05 06     ORA $06
  $88E3  07        .db $07
  $88E4  08        PHP
  $88E5  0F        .db $0F
  $88E6  01 02     ORA ($02,X)
  $88E8  04        .db $04
  $88E9  05 06     ORA $06
  $88EB  07        .db $07
  $88EC  08        PHP
  $88ED  0F        .db $0F
  $88EE  01 02     ORA ($02,X)
  $88F0  04        .db $04
  $88F1  05 06     ORA $06
  $88F3  07        .db $07
  $88F4  08        PHP
  $88F5  0F        .db $0F
  $88F6  01 02     ORA ($02,X)
  $88F8  04        .db $04
  $88F9  05 06     ORA $06
  $88FB  07        .db $07
  $88FC  08        PHP
  $88FD  21 14     AND ($14,X)
  $88FF  00        BRK
  $8900  04        .db $04
  $8901  05 06     ORA $06
  $8903  07        .db $07
  $8904  08        PHP
  $8905  70 0E     BVS $8915
  $8907  00        BRK
  $8908  04        .db $04
  $8909  05 06     ORA $06
  $890B  07        .db $07
  $890C  08        PHP
  $890D  70 0E     BVS $891D
  $890F  00        BRK
  $8910  04        .db $04
  $8911  05 06     ORA $06
  $8913  07        .db $07
  $8914  08        PHP

L_8915:
  $8915  70 0E     BVS $8925
  $8917  00        BRK
  $8918  04        .db $04
  $8919  05 06     ORA $06
  $891B  07        .db $07
  $891C  08        PHP

L_891D:
  $891D  70 0E     BVS $892D
  $891F  00        BRK
  $8920  04        .db $04
  $8921  05 06     ORA $06
  $8923  07        .db $07
  $8924  08        PHP

L_8925:
  $8925  70 0E     BVS $8935
  $8927  00        BRK
  $8928  04        .db $04
  $8929  05 06     ORA $06
  $892B  07        .db $07
  $892C  08        PHP

L_892D:
  $892D  70 0E     BVS $893D
  $892F  00        BRK
  $8930  04        .db $04
  $8931  05 06     ORA $06
  $8933  07        .db $07
  $8934  08        PHP

L_8935:
  $8935  70 0E     BVS $8945
  $8937  00        BRK
  $8938  04        .db $04
  $8939  05 06     ORA $06
  $893B  07        .db $07
  $893C  08        PHP

L_893D:
  $893D  70 0E     BVS $894D
  $893F  00        BRK
  $8940  04        .db $04
  $8941  05 06     ORA $06
  $8943  07        .db $07
  $8944  08        PHP

L_8945:
  $8945  70 0E     BVS $8955
  $8947  00        BRK
  $8948  04        .db $04
  $8949  05 06     ORA $06
  $894B  07        .db $07
  $894C  08        PHP

L_894D:
  $894D  70 0E     BVS $895D
  $894F  00        BRK
  $8950  04        .db $04
  $8951  05 06     ORA $06
  $8953  07        .db $07
  $8954  08        PHP

L_8955:
  $8955  70 0E     BVS $8965
  $8957  00        BRK
  $8958  04        .db $04
  $8959  05 06     ORA $06
  $895B  07        .db $07
  $895C  08        PHP

L_895D:
  $895D  70 0E     BVS $896D
  $895F  00        BRK
  $8960  04        .db $04
  $8961  05 06     ORA $06
  $8963  07        .db $07
  $8964  08        PHP

L_8965:
  $8965  70 0E     BVS $8975
  $8967  00        BRK
  $8968  04        .db $04
  $8969  05 06     ORA $06
  $896B  07        .db $07
  $896C  08        PHP

L_896D:
  $896D  5C        .db $5C
  $896E  15 00     ORA $00,X
  $8970  04        .db $04
  $8971  05 06     ORA $06
  $8973  07        .db $07
  $8974  08        PHP

L_8975:
  $8975  89        .db $89
  $8976  2A        ROL
  $8977  2B        .db $2B
  $8978  04        .db $04
  $8979  05 06     ORA $06
  $897B  07        .db $07
  $897C  08        PHP
  $897D  09 0A     ORA #$0A
  $897F  00        BRK
  $8980  04        .db $04
  $8981  05 06     ORA $06
  $8983  07        .db $07
  $8984  08        PHP
  $8985  09 0A     ORA #$0A
  $8987  00        BRK
  $8988  04        .db $04
  $8989  05 06     ORA $06
  $898B  07        .db $07
  $898C  08        PHP
  $898D  09 0A     ORA #$0A
  $898F  00        BRK
  $8990  04        .db $04
  $8991  05 06     ORA $06
  $8993  07        .db $07
  $8994  08        PHP
  $8995  09 0A     ORA #$0A
  $8997  00        BRK
  $8998  04        .db $04
  $8999  05 06     ORA $06
  $899B  07        .db $07
  $899C  08        PHP
  $899D  09 0A     ORA #$0A
  $899F  00        BRK
  $89A0  04        .db $04
  $89A1  05 06     ORA $06
  $89A3  07        .db $07
  $89A4  08        PHP
  $89A5  09 0A     ORA #$0A
  $89A7  00        BRK
  $89A8  04        .db $04
  $89A9  05 06     ORA $06
  $89AB  07        .db $07
  $89AC  08        PHP
  $89AD  09 0A     ORA #$0A
  $89AF  00        BRK
  $89B0  04        .db $04
  $89B1  05 06     ORA $06
  $89B3  07        .db $07
  $89B4  08        PHP
  $89B5  09 0A     ORA #$0A
  $89B7  00        BRK
  $89B8  04        .db $04
  $89B9  05 06     ORA $06
  $89BB  07        .db $07
  $89BC  08        PHP
  $89BD  09 0A     ORA #$0A
  $89BF  00        BRK
  $89C0  04        .db $04
  $89C1  05 06     ORA $06
  $89C3  07        .db $07
  $89C4  08        PHP
  $89C5  0F        .db $0F
  $89C6  01 02     ORA ($02,X)
  $89C8  04        .db $04
  $89C9  05 06     ORA $06
  $89CB  07        .db $07
  $89CC  08        PHP
  $89CD  0F        .db $0F
  $89CE  01 02     ORA ($02,X)
  $89D0  04        .db $04
  $89D1  05 06     ORA $06
  $89D3  07        .db $07
  $89D4  08        PHP
  $89D5  0F        .db $0F
  $89D6  01 02     ORA ($02,X)
  $89D8  04        .db $04
  $89D9  05 06     ORA $06
  $89DB  07        .db $07
  $89DC  08        PHP
  $89DD  0F        .db $0F
  $89DE  01 02     ORA ($02,X)
  $89E0  04        .db $04
  $89E1  05 06     ORA $06
  $89E3  07        .db $07
  $89E4  08        PHP
  $89E5  0F        .db $0F
  $89E6  01 02     ORA ($02,X)
  $89E8  04        .db $04
  $89E9  05 06     ORA $06
  $89EB  07        .db $07
  $89EC  08        PHP
  $89ED  0F        .db $0F
  $89EE  01 02     ORA ($02,X)
  $89F0  04        .db $04
  $89F1  05 06     ORA $06
  $89F3  07        .db $07
  $89F4  08        PHP
  $89F5  2D 5D 31  AND $315D
  $89F8  02        .db $02
  $89F9  02        .db $02
  $89FA  02        .db $02
  $89FB  02        .db $02
  $89FC  02        .db $02
  $89FD  02        .db $02
  $89FE  02        .db $02
  $89FF  02        .db $02
  $8A00  5E 0D 01  LSR $010D,X
  $8A03  02        .db $02
  $8A04  02        .db $02
  $8A05  61 8C     ADC ($8C,X)
  $8A07  01 61     ORA ($61,X)
  $8A09  8C 62 63  STY $6362
  $8A0C  64        .db $64
  $8A0D  65 60     ADC $60
  $8A0F  5D 61 8C  EOR $8C61,X
  $8A12  06 07     ASL $07
  $8A14  08        PHP
  $8A15  0C        .db $0C
  $8A16  0D 01 5E  ORA $5E01
  $8A19  0D 06 07  ORA $0706
  $8A1C  08        PHP
  $8A1D  11 8C     ORA ($8C),Y
  $8A1F  01 5E     ORA ($5E,X)
  $8A21  0D 06 07  ORA $0706
  $8A24  08        PHP
  $8A25  12        .db $12
  $8A26  14        .db $14
  $8A27  00        BRK
  $8A28  61 8C     ADC ($8C,X)
  $8A2A  06 07     ASL $07
  $8A2C  08        PHP
  $8A2D  11 8C     ORA ($8C),Y
  $8A2F  00        BRK
  $8A30  5F        .db $5F
  $8A31  60        RTS
  $8A32  43        .db $43
  $8A33  44        .db $44
  $8A34  45 67     EOR $67
  $8A36  8C 00 5E  STY $5E00
  $8A39  0D 01 02  ORA $0201
  $8A3C  02        .db $02
  $8A3D  5E 0D 00  LSR $000D,X
  $8A40  02        .db $02
  $8A41  02        .db $02
  $8A42  02        .db $02
  $8A43  02        .db $02
  $8A44  02        .db $02
  $8A45  02        .db $02
  $8A46  02        .db $02
  $8A47  02        .db $02
  $8A48  31 66     AND ($66),Y
  $8A4A  88        DEY
  $8A4B  63        .db $63
  $8A4C  68        PLA
  $8A4D  69 02     ADC #$02
  $8A4F  02        .db $02
  $8A50  02        .db $02
  $8A51  6A        ROR
  $8A52  06 07     ASL $07
  $8A54  58        CLI
  $8A55  01 02     ORA ($02,X)
  $8A57  02        .db $02
  $8A58  02        .db $02
  $8A59  6A        ROR
  $8A5A  06 07     ASL $07
  $8A5C  58        CLI
  $8A5D  01 02     ORA ($02,X)
  $8A5F  02        .db $02
  $8A60  04        .db $04
  $8A61  05 06     ORA $06
  $8A63  07        .db $07
  $8A64  58        CLI
  $8A65  01 02     ORA ($02,X)
  $8A67  02        .db $02
  $8A68  04        .db $04
  $8A69  05 06     ORA $06
  $8A6B  07        .db $07
  $8A6C  58        CLI
  $8A6D  01 02     ORA ($02,X)
  $8A6F  02        .db $02
  $8A70  6B        .db $6B
  $8A71  6C 6D 07  JMP ($076D)
  $8A74  58        CLI
  $8A75  01 02     ORA ($02,X)
  $8A77  02        .db $02
  $8A78  8D 6E 6F  STA $6F6E
  $8A7B  71 72     ADC ($72),Y
  $8A7D  01 02     ORA ($02,X)
  $8A7F  02        .db $02
  $8A80  00        BRK
  $8A81  00        BRK
  $8A82  5A        .db $5A
  $8A83  07        .db $07
  $8A84  58        CLI
  $8A85  5A        .db $5A
  $8A86  00        BRK
  $8A87  00        BRK
  $8A88  00        BRK
  $8A89  00        BRK
  $8A8A  5A        .db $5A
  $8A8B  07        .db $07
  $8A8C  58        CLI
  $8A8D  5A        .db $5A
  $8A8E  00        BRK
  $8A8F  00        BRK
  $8A90  00        BRK
  $8A91  00        BRK
  $8A92  5A        .db $5A
  $8A93  07        .db $07
  $8A94  58        CLI
  $8A95  5A        .db $5A
  $8A96  00        BRK
  $8A97  00        BRK
  $8A98  00        BRK
  $8A99  00        BRK
  $8A9A  5A        .db $5A
  $8A9B  07        .db $07
  $8A9C  58        CLI
  $8A9D  5A        .db $5A
  $8A9E  00        BRK
  $8A9F  00        BRK
  $8AA0  00        BRK
  $8AA1  00        BRK
  $8AA2  5A        .db $5A
  $8AA3  07        .db $07
  $8AA4  58        CLI
  $8AA5  5A        .db $5A
  $8AA6  00        BRK
  $8AA7  00        BRK
  $8AA8  00        BRK
  $8AA9  00        BRK
  $8AAA  5A        .db $5A
  $8AAB  07        .db $07
  $8AAC  58        CLI
  $8AAD  5A        .db $5A
  $8AAE  00        BRK
  $8AAF  00        BRK
  $8AB0  00        BRK
  $8AB1  00        BRK
  $8AB2  5A        .db $5A
  $8AB3  07        .db $07
  $8AB4  58        CLI
  $8AB5  5A        .db $5A
  $8AB6  00        BRK
  $8AB7  00        BRK
  $8AB8  00        BRK
  $8AB9  00        BRK
  $8ABA  5A        .db $5A
  $8ABB  71 72     ADC ($72),Y
  $8ABD  5A        .db $5A
  $8ABE  00        BRK
  $8ABF  00        BRK
  $8AC0  73        .db $73
  $8AC1  75 76     ADC $76,X
  $8AC3  07        .db $07
  $8AC4  29 77     AND #$77
  $8AC6  7D 80 03  ADC $0380,X
  $8AC9  05 06     ORA $06
  $8ACB  07        .db $07
  $8ACC  08        PHP
  $8ACD  0F        .db $0F
  $8ACE  7E 81 03  ROR $0381,X
  $8AD1  05 06     ORA $06
  $8AD3  07        .db $07
  $8AD4  08        PHP
  $8AD5  0F        .db $0F
  $8AD6  7D 80 03  ADC $0380,X
  $8AD9  05 06     ORA $06
  $8ADB  07        .db $07
  $8ADC  08        PHP
  $8ADD  0F        .db $0F
  $8ADE  7F        .db $7F
  $8ADF  2E 03 05  ROL $0503
  $8AE2  06 07     ASL $07
  $8AE4  08        PHP
  $8AE5  0F        .db $0F
  $8AE6  7F        .db $7F
  $8AE7  2E 03 05  ROL $0503
  $8AEA  06 07     ASL $07
  $8AEC  08        PHP
  $8AED  0F        .db $0F
  $8AEE  7E 81 03  ROR $0381,X
  $8AF1  05 06     ORA $06
  $8AF3  07        .db $07
  $8AF4  08        PHP
  $8AF5  0F        .db $0F
  $8AF6  7D 80 74  ADC $7480,X
  $8AF9  78        SEI
  $8AFA  79 7A 7B  ADC $7B7A,Y
  $8AFD  7C        .db $7C
  $8AFE  7E 81 E3  ROR $E381,X
  $8B01  EA        NOP
  $8B02  91 91     STA ($91),Y
  $8B04  91 91     STA ($91),Y
  $8B06  92        .db $92
  $8B07  93        .db $93
  $8B08  E4 EB     CPX $EB
  $8B0A  91 91     STA ($91),Y
  $8B0C  91 91     STA ($91),Y
  $8B0E  92        .db $92
  $8B0F  93        .db $93
  $8B10  E5 91     SBC $91
  $8B12  91 91     STA ($91),Y
  $8B14  91 91     STA ($91),Y
  $8B16  92        .db $92
  $8B17  93        .db $93
  $8B18  E6 91     INC $91
  $8B1A  91 91     STA ($91),Y
  $8B1C  91 91     STA ($91),Y
  $8B1E  92        .db $92
  $8B1F  93        .db $93
  $8B20  E7        .db $E7
  $8B21  EC 91 91  CPX $9191
  $8B24  91 91     STA ($91),Y
  $8B26  92        .db $92
  $8B27  93        .db $93
  $8B28  E8        INX
  $8B29  91 91     STA ($91),Y
  $8B2B  91 91     STA ($91),Y
  $8B2D  91 92     STA ($92),Y
  $8B2F  93        .db $93
  $8B30  E9 91     SBC #$91
  $8B32  91 91     STA ($91),Y
  $8B34  91 91     STA ($91),Y
  $8B36  92        .db $92
  $8B37  93        .db $93
  $8B38  E4 91     CPX $91
  $8B3A  91 91     STA ($91),Y
  $8B3C  91 91     STA ($91),Y
  $8B3E  92        .db $92
  $8B3F  93        .db $93
  $8B40  ED 91 91  SBC $9191
  $8B43  91 91     STA ($91),Y
  $8B45  94 93     STY $93,X
  $8B47  93        .db $93
  $8B48  E6 91     INC $91
  $8B4A  91 91     STA ($91),Y
  $8B4C  91 94     STA ($94),Y
  $8B4E  93        .db $93
  $8B4F  93        .db $93
  $8B50  EE 91 91  INC $9191
  $8B53  91 91     STA ($91),Y
  $8B55  92        .db $92
  $8B56  93        .db $93
  $8B57  93        .db $93
  $8B58  EA        NOP
  $8B59  EC 91 91  CPX $9191
  $8B5C  91 92     STA ($92),Y
  $8B5E  93        .db $93
  $8B5F  93        .db $93
  $8B60  EF        .db $EF
  $8B61  91 91     STA ($91),Y
  $8B63  91 91     STA ($91),Y
  $8B65  94 93     STY $93,X
  $8B67  93        .db $93
  $8B68  F0 91     BEQ $8AFB
  $8B6A  91 91     STA ($91),Y
  $8B6C  91 94     STA ($94),Y
  $8B6E  93        .db $93
  $8B6F  93        .db $93
  $8B70  F1 F2     SBC ($F2),Y
  $8B72  91 91     STA ($91),Y
  $8B74  91 91     STA ($91),Y
  $8B76  92        .db $92
  $8B77  93        .db $93
  $8B78  EA        NOP
  $8B79  EE 91 91  INC $9191
  $8B7C  91 91     STA ($91),Y
  $8B7E  92        .db $92
  $8B7F  93        .db $93
  $8B80  E3        .db $E3
  $8B81  EA        NOP
  $8B82  91 91     STA ($91),Y
  $8B84  91 94     STA ($94),Y
  $8B86  93        .db $93
  $8B87  93        .db $93
  $8B88  E4 EB     CPX $EB
  $8B8A  91 91     STA ($91),Y
  $8B8C  91 94     STA ($94),Y
  $8B8E  93        .db $93
  $8B8F  93        .db $93
  $8B90  E5 91     SBC $91
  $8B92  91 91     STA ($91),Y
  $8B94  91 91     STA ($91),Y
  $8B96  92        .db $92
  $8B97  93        .db $93
  $8B98  E6 91     INC $91
  $8B9A  91 91     STA ($91),Y
  $8B9C  91 91     STA ($91),Y
  $8B9E  92        .db $92
  $8B9F  93        .db $93
  $8BA0  E7        .db $E7
  $8BA1  EC 91 91  CPX $9191
  $8BA4  91 94     STA ($94),Y
  $8BA6  93        .db $93
  $8BA7  93        .db $93
  $8BA8  E8        INX
  $8BA9  91 91     STA ($91),Y
  $8BAB  91 91     STA ($91),Y
  $8BAD  94 93     STY $93,X
  $8BAF  93        .db $93
  $8BB0  E9 91     SBC #$91
  $8BB2  91 91     STA ($91),Y
  $8BB4  91 92     STA ($92),Y
  $8BB6  93        .db $93
  $8BB7  93        .db $93
  $8BB8  E4 91     CPX $91
  $8BBA  91 91     STA ($91),Y
  $8BBC  91 92     STA ($92),Y
  $8BBE  93        .db $93
  $8BBF  93        .db $93
  $8BC0  ED 91 91  SBC $9191
  $8BC3  91 91     STA ($91),Y
  $8BC5  94 93     STY $93,X
  $8BC7  93        .db $93
  $8BC8  E6 91     INC $91
  $8BCA  91 91     STA ($91),Y
  $8BCC  91 94     STA ($94),Y
  $8BCE  93        .db $93
  $8BCF  93        .db $93
  $8BD0  EE 91 91  INC $9191
  $8BD3  91 91     STA ($91),Y
  $8BD5  91 92     STA ($92),Y
  $8BD7  93        .db $93
  $8BD8  EA        NOP
  $8BD9  EC 91 91  CPX $9191
  $8BDC  91 91     STA ($91),Y
  $8BDE  92        .db $92
  $8BDF  93        .db $93
  $8BE0  EF        .db $EF
  $8BE1  91 91     STA ($91),Y
  $8BE3  91 91     STA ($91),Y
  $8BE5  91 92     STA ($92),Y
  $8BE7  93        .db $93
  $8BE8  F0 91     BEQ $8B7B
  $8BEA  91 91     STA ($91),Y
  $8BEC  91 91     STA ($91),Y
  $8BEE  92        .db $92
  $8BEF  93        .db $93
  $8BF0  F1 F2     SBC ($F2),Y
  $8BF2  91 91     STA ($91),Y
  $8BF4  91 91     STA ($91),Y
  $8BF6  92        .db $92
  $8BF7  93        .db $93
  $8BF8  EA        NOP
  $8BF9  EE 91 91  INC $9191
  $8BFC  91 91     STA ($91),Y

L_8BFE:
  $8BFE  92        .db $92
  $8BFF  93        .db $93
  $8C00  E7        .db $E7
  $8C01  EC 91 91  CPX $9191
  $8C04  91 91     STA ($91),Y
  $8C06  92        .db $92
  $8C07  93        .db $93
  $8C08  E4 91     CPX $91
  $8C0A  91 91     STA ($91),Y
  $8C0C  91 91     STA ($91),Y
  $8C0E  92        .db $92
  $8C0F  93        .db $93
  $8C10  F0 EC     BEQ $8BFE
  $8C12  91 91     STA ($91),Y
  $8C14  91 91     STA ($91),Y
  $8C16  92        .db $92
  $8C17  93        .db $93
  $8C18  F3        .db $F3
  $8C19  91 91     STA ($91),Y
  $8C1B  91 91     STA ($91),Y
  $8C1D  91 92     STA ($92),Y
  $8C1F  93        .db $93
  $8C20  E6 91     INC $91
  $8C22  91 D3     STA ($D3),Y
  $8C24  96 96     STX $96,Y
  $8C26  93        .db $93
  $8C27  93        .db $93
  $8C28  E7        .db $E7
  $8C29  91 99     STA ($99),Y
  $8C2B  97        .db $97
  $8C2C  AA        TAX
  $8C2D  98        TYA
  $8C2E  93        .db $93
  $8C2F  93        .db $93
  $8C30  F4        .db $F4
  $8C31  9C        .db $9C
  $8C32  9A        TXS
  $8C33  97        .db $97
  $8C34  AB        .db $AB
  $8C35  98        TYA
  $8C36  93        .db $93
  $8C37  93        .db $93
  $8C38  EE 91 9B  INC $9B91
  $8C3B  9D 9E 9E  STA $9E9E,X
  $8C3E  93        .db $93
  $8C3F  93        .db $93
  $8C40  F5 EA     SBC $EA,X
  $8C42  91 91     STA ($91),Y
  $8C44  A0 A1     LDY #$A1
  $8C46  92        .db $92
  $8C47  93        .db $93
  $8C48  ED E7 91  SBC $91E7
  $8C4B  91 A0     STA ($A0),Y
  $8C4D  A2 92     LDX #$92
  $8C4F  93        .db $93
  $8C50  ED EE 91  SBC $91EE
  $8C53  91 A0     STA ($A0),Y
  $8C55  A4 92     LDY $92
  $8C57  93        .db $93
  $8C58  ED 91 91  SBC $9191
  $8C5B  91 A0     STA ($A0),Y
  $8C5D  A1 92     LDA ($92,X)
  $8C5F  93        .db $93
  $8C60  F0 91     BEQ $8BF3
  $8C62  91 91     STA ($91),Y
  $8C64  A0 A5     LDY #$A5
  $8C66  93        .db $93
  $8C67  93        .db $93
  $8C68  E9 F2     SBC #$F2
  $8C6A  91 91     STA ($91),Y
  $8C6C  A0 A5     LDY #$A5
  $8C6E  93        .db $93
  $8C6F  93        .db $93
  $8C70  EF        .db $EF
  $8C71  EE 91 91  INC $9191
  $8C74  A0 A6     LDY #$A6
  $8C76  92        .db $92
  $8C77  93        .db $93
  $8C78  E6 91     INC $91
  $8C7A  91 91     STA ($91),Y
  $8C7C  A0 A4     LDY #$A4
  $8C7E  92        .db $92
  $8C7F  93        .db $93
  $8C80  E3        .db $E3
  $8C81  EA        NOP
  $8C82  91 91     STA ($91),Y
  $8C84  A0 A7     LDY #$A7
  $8C86  93        .db $93
  $8C87  93        .db $93
  $8C88  E4 EB     CPX $EB
  $8C8A  91 91     STA ($91),Y
  $8C8C  A0 A5     LDY #$A5
  $8C8E  93        .db $93
  $8C8F  93        .db $93
  $8C90  E5 91     SBC $91
  $8C92  91 91     STA ($91),Y
  $8C94  A0 92     LDY #$92
  $8C96  93        .db $93
  $8C97  93        .db $93
  $8C98  E6 91     INC $91
  $8C9A  91 91     STA ($91),Y
  $8C9C  A0 92     LDY #$92
  $8C9E  93        .db $93
  $8C9F  93        .db $93
  $8CA0  E7        .db $E7
  $8CA1  EC 91 91  CPX $9191
  $8CA4  A0 A5     LDY #$A5
  $8CA6  93        .db $93
  $8CA7  93        .db $93
  $8CA8  E8        INX
  $8CA9  91 91     STA ($91),Y
  $8CAB  91 A0     STA ($A0),Y
  $8CAD  A9 93     LDA #$93
  $8CAF  93        .db $93
  $8CB0  E9 91     SBC #$91
  $8CB2  91 91     STA ($91),Y
  $8CB4  A0 92     LDY #$92
  $8CB6  93        .db $93
  $8CB7  93        .db $93
  $8CB8  E7        .db $E7
  $8CB9  91 91     STA ($91),Y
  $8CBB  91 A0     STA ($A0),Y
  $8CBD  92        .db $92

L_8CBE:
  $8CBE  93        .db $93
  $8CBF  93        .db $93
  $8CC0  E7        .db $E7
  $8CC1  EC 91 91  CPX $9191
  $8CC4  A0 A2     LDY #$A2
  $8CC6  92        .db $92
  $8CC7  93        .db $93
  $8CC8  E4 91     CPX $91
  $8CCA  91 91     STA ($91),Y
  $8CCC  A0 A4     LDY #$A4
  $8CCE  92        .db $92
  $8CCF  93        .db $93
  $8CD0  F0 EC     BEQ $8CBE
  $8CD2  91 91     STA ($91),Y
  $8CD4  A0 A4     LDY #$A4
  $8CD6  92        .db $92
  $8CD7  93        .db $93
  $8CD8  F3        .db $F3
  $8CD9  91 91     STA ($91),Y
  $8CDB  D3        .db $D3
  $8CDC  96 96     STX $96,Y
  $8CDE  93        .db $93
  $8CDF  93        .db $93
  $8CE0  E6 91     INC $91
  $8CE2  99 97 AA  STA $AA97,Y
  $8CE5  98        TYA
  $8CE6  93        .db $93
  $8CE7  93        .db $93
  $8CE8  E7        .db $E7
  $8CE9  9C        .db $9C
  $8CEA  9A        TXS
  $8CEB  97        .db $97
  $8CEC  AB        .db $AB
  $8CED  98        TYA
  $8CEE  93        .db $93
  $8CEF  93        .db $93
  $8CF0  F4        .db $F4
  $8CF1  91 9B     STA ($9B),Y
  $8CF3  9D 9E 9E  STA $9E9E,X
  $8CF6  93        .db $93
  $8CF7  93        .db $93
  $8CF8  EE 91 91  INC $9191
  $8CFB  91 A0     STA ($A0),Y
  $8CFD  A4 92     LDY $92
  $8CFF  93        .db $93
  $8D00  F5 DB     SBC $DB,X
  $8D02  AC AD A0  LDY $A0AD
  $8D05  A1 92     LDA ($92,X)
  $8D07  93        .db $93
  $8D08  AF        .db $AF
  $8D09  B0 B1     BCS $8CBC
  $8D0B  AE AF B6  LDX $B6AF
  $8D0E  92        .db $92
  $8D0F  93        .db $93
  $8D10  B2        .db $B2
  $8D11  B3        .db $B3
  $8D12  B4 B2     LDY $B2,X
  $8D14  B2        .db $B2
  $8D15  B6 92     LDX $92,Y
  $8D17  93        .db $93
  $8D18  B2        .db $B2
  $8D19  B5 B6     LDA $B6,X
  $8D1B  B2        .db $B2
  $8D1C  B2        .db $B2
  $8D1D  B6 92     LDX $92,Y
  $8D1F  93        .db $93
  $8D20  B7        .db $B7
  $8D21  B8        CLV
  $8D22  B9 B2 BA  LDA $BAB2,Y
  $8D25  B9 92 93  LDA $9392,Y
  $8D28  BB        .db $BB
  $8D29  BC B9 B8  LDY $B8B9,X
  $8D2C  B9 BD 92  LDA $92BD,Y
  $8D2F  93        .db $93
  $8D30  AF        .db $AF
  $8D31  AF        .db $AF
  $8D32  AF        .db $AF
  $8D33  AF        .db $AF
  $8D34  AF        .db $AF
  $8D35  AF        .db $AF
  $8D36  93        .db $93
  $8D37  93        .db $93
  $8D38  B2        .db $B2
  $8D39  B2        .db $B2
  $8D3A  B2        .db $B2
  $8D3B  B2        .db $B2
  $8D3C  B2        .db $B2
  $8D3D  B2        .db $B2
  $8D3E  93        .db $93
  $8D3F  93        .db $93
  $8D40  91 DB     STA ($DB),Y
  $8D42  AC AD 91  LDY $91AD
  $8D45  91 91     STA ($91),Y
  $8D47  91 AF     STA ($AF),Y
  $8D49  B0 B1     BCS $8CFC
  $8D4B  BE AF AF  LDX $AFAF,Y
  $8D4E  AF        .db $AF
  $8D4F  AF        .db $AF
  $8D50  B2        .db $B2
  $8D51  B3        .db $B3
  $8D52  B4 BF     LDY $BF,X
  $8D54  C7        .db $C7
  $8D55  C7        .db $C7
  $8D56  B2        .db $B2
  $8D57  B2        .db $B2
  $8D58  B2        .db $B2
  $8D59  B5 C0     LDA $C0,X
  $8D5B  C3        .db $C3
  $8D5C  C6 C8     DEC $C8
  $8D5E  B2        .db $B2
  $8D5F  B2        .db $B2
  $8D60  B2        .db $B2
  $8D61  B2        .db $B2
  $8D62  C1 C4     CMP ($C4,X)
  $8D64  B2        .db $B2
  $8D65  C9 CA     CMP #$CA
  $8D67  CA        DEX
  $8D68  CA        DEX
  $8D69  CA        DEX
  $8D6A  C2        .db $C2
  $8D6B  C5 C7     CMP $C7
  $8D6D  B6 BB     LDX $BB,Y
  $8D6F  BB        .db $BB
  $8D70  AF        .db $AF
  $8D71  AF        .db $AF
  $8D72  AF        .db $AF
  $8D73  AF        .db $AF
  $8D74  AF        .db $AF
  $8D75  AF        .db $AF
  $8D76  AF        .db $AF
  $8D77  AF        .db $AF
  $8D78  B2        .db $B2
  $8D79  B2        .db $B2
  $8D7A  B2        .db $B2
  $8D7B  B2        .db $B2
  $8D7C  B2        .db $B2
  $8D7D  B2        .db $B2
  $8D7E  B2        .db $B2
  $8D7F  B2        .db $B2
  $8D80  91 91     STA ($91),Y
  $8D82  CB        .db $CB
  $8D83  CD CF 91  CMP $91CF
  $8D86  91 91     STA ($91),Y
  $8D88  AF        .db $AF
  $8D89  AF        .db $AF
  $8D8A  CC CE AF  CPY $AFCE
  $8D8D  AF        .db $AF
  $8D8E  AF        .db $AF
  $8D8F  AF        .db $AF
  $8D90  CA        DEX
  $8D91  CA        DEX
  $8D92  B9 BD B2  LDA $B2BD,Y
  $8D95  B2        .db $B2
  $8D96  B2        .db $B2
  $8D97  B2        .db $B2
  $8D98  AF        .db $AF
  $8D99  AF        .db $AF
  $8D9A  AF        .db $AF
  $8D9B  C9 B2     CMP #$B2
  $8D9D  B2        .db $B2
  $8D9E  B2        .db $B2
  $8D9F  B2        .db $B2
  $8DA0  B2        .db $B2
  $8DA1  B2        .db $B2
  $8DA2  B2        .db $B2
  $8DA3  B6 B2     LDX $B2,Y
  $8DA5  B2        .db $B2
  $8DA6  B2        .db $B2
  $8DA7  B2        .db $B2
  $8DA8  C7        .db $C7
  $8DA9  C7        .db $C7
  $8DAA  C7        .db $C7
  $8DAB  B6 CA     LDX $CA,Y
  $8DAD  CA        DEX
  $8DAE  CA        DEX
  $8DAF  CA        DEX
  $8DB0  AF        .db $AF
  $8DB1  AF        .db $AF
  $8DB2  AF        .db $AF
  $8DB3  AF        .db $AF
  $8DB4  AF        .db $AF
  $8DB5  AF        .db $AF
  $8DB6  AF        .db $AF
  $8DB7  AF        .db $AF
  $8DB8  B2        .db $B2
  $8DB9  B2        .db $B2
  $8DBA  B2        .db $B2
  $8DBB  B2        .db $B2
  $8DBC  B2        .db $B2
  $8DBD  B2        .db $B2
  $8DBE  B2        .db $B2
  $8DBF  B2        .db $B2
  $8DC0  91 91     STA ($91),Y

L_8DC2:
  $8DC2  91 91     STA ($91),Y

L_8DC4:
  $8DC4  91 91     STA ($91),Y
  $8DC6  B2        .db $B2
  $8DC7  B2        .db $B2
  $8DC8  91 91     STA ($91),Y
  $8DCA  91 91     STA ($91),Y
  $8DCC  91 91     STA ($91),Y
  $8DCE  B2        .db $B2
  $8DCF  B2        .db $B2
  $8DD0  91 91     STA ($91),Y
  $8DD2  91 91     STA ($91),Y
  $8DD4  91 91     STA ($91),Y
  $8DD6  CA        DEX
  $8DD7  CA        DEX
  $8DD8  91 91     STA ($91),Y

L_8DDA:
  $8DDA  91 91     STA ($91),Y
  $8DDC  91 91     STA ($91),Y
  $8DDE  AF        .db $AF
  $8DDF  AF        .db $AF
  $8DE0  91 91     STA ($91),Y
  $8DE2  91 91     STA ($91),Y
  $8DE4  91 91     STA ($91),Y
  $8DE6  B2        .db $B2
  $8DE7  B2        .db $B2
  $8DE8  91 91     STA ($91),Y
  $8DEA  91 91     STA ($91),Y
  $8DEC  91 91     STA ($91),Y
  $8DEE  C7        .db $C7
  $8DEF  C7        .db $C7
  $8DF0  D0 D0     BNE $8DC2
  $8DF2  D0 D0     BNE $8DC4
  $8DF4  D1 91     CMP ($91),Y
  $8DF6  AF        .db $AF
  $8DF7  AF        .db $AF
  $8DF8  D2        .db $D2
  $8DF9  D2        .db $D2
  $8DFA  D2        .db $D2
  $8DFB  D2        .db $D2
  $8DFC  D2        .db $D2
  $8DFD  D2        .db $D2
  $8DFE  B2        .db $B2
  $8DFF  B2        .db $B2
  $8E00  91 91     STA ($91),Y
  $8E02  91 91     STA ($91),Y
  $8E04  91 91     STA ($91),Y
  $8E06  91 91     STA ($91),Y

L_8E08:
  $8E08  D0 D0     BNE $8DDA
  $8E0A  91 91     STA ($91),Y
  $8E0C  91 91     STA ($91),Y
  $8E0E  91 91     STA ($91),Y
  $8E10  D2        .db $D2
  $8E11  D4        .db $D4
  $8E12  91 91     STA ($91),Y
  $8E14  91 91     STA ($91),Y
  $8E16  91 91     STA ($91),Y
  $8E18  D5 D6     CMP $D6,X

L_8E1A:
  $8E1A  91 91     STA ($91),Y

L_8E1C:
  $8E1C  91 91     STA ($91),Y

L_8E1E:
  $8E1E  91 91     STA ($91),Y

L_8E20:
  $8E20  D5 D6     CMP $D6,X
  $8E22  91 91     STA ($91),Y
  $8E24  91 91     STA ($91),Y
  $8E26  91 91     STA ($91),Y
  $8E28  D5 D6     CMP $D6,X
  $8E2A  91 91     STA ($91),Y
  $8E2C  91 91     STA ($91),Y
  $8E2E  91 91     STA ($91),Y
  $8E30  D5 D7     CMP $D7,X
  $8E32  91 91     STA ($91),Y
  $8E34  91 91     STA ($91),Y
  $8E36  D0 D0     BNE $8E08
  $8E38  D8        CLD
  $8E39  D9 D2 D2  CMP $D2D2,Y
  $8E3C  D2        .db $D2
  $8E3D  D2        .db $D2
  $8E3E  D2        .db $D2
  $8E3F  D2        .db $D2
  $8E40  91 91     STA ($91),Y
  $8E42  91 91     STA ($91),Y
  $8E44  91 91     STA ($91),Y
  $8E46  91 91     STA ($91),Y
  $8E48  D0 D0     BNE $8E1A
  $8E4A  D0 D0     BNE $8E1C
  $8E4C  D0 D0     BNE $8E1E
  $8E4E  D0 D0     BNE $8E20
  $8E50  D2        .db $D2
  $8E51  D2        .db $D2
  $8E52  D2        .db $D2
  $8E53  D2        .db $D2
  $8E54  D2        .db $D2
  $8E55  D2        .db $D2
  $8E56  D2        .db $D2
  $8E57  D2        .db $D2
  $8E58  D5 D5     CMP $D5,X
  $8E5A  D5 D5     CMP $D5,X
  $8E5C  D5 D5     CMP $D5,X
  $8E5E  D5 D5     CMP $D5,X

L_8E60:
  $8E60  D5 D5     CMP $D5,X
  $8E62  D5 D5     CMP $D5,X
  $8E64  D5 D5     CMP $D5,X
  $8E66  D5 D5     CMP $D5,X
  $8E68  D8        CLD
  $8E69  D5 D5     CMP $D5,X
  $8E6B  D8        CLD
  $8E6C  D8        CLD
  $8E6D  D5 D5     CMP $D5,X
  $8E6F  D8        CLD
  $8E70  DA        .db $DA
  $8E71  D8        CLD
  $8E72  D8        CLD
  $8E73  DA        .db $DA
  $8E74  DA        .db $DA
  $8E75  D5 D8     CMP $D8,X
  $8E77  DA        .db $DA
  $8E78  D5 DA     CMP $DA,X

L_8E7A:
  $8E7A  DA        .db $DA
  $8E7B  D5 D5     CMP $D5,X
  $8E7D  D8        CLD

L_8E7E:
  $8E7E  DA        .db $DA
  $8E7F  D5 E3     CMP $E3,X
  $8E81  EA        NOP
  $8E82  91 91     STA ($91),Y
  $8E84  91 91     STA ($91),Y
  $8E86  91 91     STA ($91),Y
  $8E88  E4 EF     CPX $EF
  $8E8A  91 91     STA ($91),Y
  $8E8C  91 91     STA ($91),Y
  $8E8E  D0 D0     BNE $8E60
  $8E90  ED F6 91  SBC $91F6
  $8E93  91 91     STA ($91),Y
  $8E95  91 D2     STA ($D2),Y
  $8E97  D2        .db $D2

L_8E98:
  $8E98  ED 91 91  SBC $9191
  $8E9B  91 91     STA ($91),Y
  $8E9D  91 D5     STA ($D5),Y
  $8E9F  D5 F0     CMP $F0,X
  $8EA1  EA        NOP
  $8EA2  91 91     STA ($91),Y
  $8EA4  91 91     STA ($91),Y
  $8EA6  D8        CLD
  $8EA7  D5 F3     CMP $F3,X
  $8EA9  E8        INX

L_8EAA:
  $8EAA  91 91     STA ($91),Y

L_8EAC:
  $8EAC  91 91     STA ($91),Y

L_8EAE:
  $8EAE  DA        .db $DA
  $8EAF  D5 E6     CMP $E6,X
  $8EB1  F7        .db $F7
  $8EB2  91 91     STA ($91),Y
  $8EB4  91 91     STA ($91),Y
  $8EB6  D5 D8     CMP $D8,X
  $8EB8  96 96     STX $96,Y

L_8EBA:
  $8EBA  96 96     STX $96,Y

L_8EBC:
  $8EBC  DC        .db $DC
  $8EBD  91 D8     STA ($D8),Y
  $8EBF  DA        .db $DA

L_8EC0:
  $8EC0  98        TYA
  $8EC1  98        TYA

L_8EC2:
  $8EC2  98        TYA
  $8EC3  98        TYA

L_8EC4:
  $8EC4  DD B6 DA  CMP $DAB6,X
  $8EC7  D5 9E     CMP $9E,X
  $8EC9  9E        .db $9E

L_8ECA:
  $8ECA  9E        .db $9E
  $8ECB  9E        .db $9E

L_8ECC:
  $8ECC  DE C9 D5  DEC $D5C9,X
  $8ECF  D5 A8     CMP $A8,X
  $8ED1  A8        TAY

L_8ED2:
  $8ED2  A8        TAY
  $8ED3  B4 A8     LDY $A8,X
  $8ED5  A8        TAY

L_8ED6:
  $8ED6  D8        CLD
  $8ED7  D5 A8     CMP $A8,X
  $8ED9  A8        TAY

L_8EDA:
  $8EDA  B4 A8     LDY $A8,X

L_8EDC:
  $8EDC  A8        TAY
  $8EDD  A8        TAY

L_8EDE:
  $8EDE  DA        .db $DA
  $8EDF  D5 A8     CMP $A8,X
  $8EE1  A8        TAY

L_8EE2:
  $8EE2  A8        TAY
  $8EE3  A8        TAY

L_8EE4:
  $8EE4  A8        TAY
  $8EE5  BD D5 D8  LDA $D8D5,X
  $8EE8  90 90     BCC $8E7A

L_8EEA:
  $8EEA  90 90     BCC $8E7C

L_8EEC:
  $8EEC  90 90     BCC $8E7E

L_8EEE:
  $8EEE  D5 DA     CMP $DA,X

L_8EF0:
  $8EF0  A8        TAY
  $8EF1  BD A8 A8  LDA $A8A8,X

L_8EF4:
  $8EF4  A8        TAY
  $8EF5  A8        TAY
  $8EF6  D5 D5     CMP $D5,X

L_8EF8:
  $8EF8  A8        TAY
  $8EF9  A8        TAY

L_8EFA:
  $8EFA  A8        TAY
  $8EFB  A8        TAY

L_8EFC:
  $8EFC  B4 A8     LDY $A8,X
  $8EFE  DF        .db $DF
  $8EFF  DF        .db $DF

L_8F00:
  $8F00  90 90     BCC $8E92

L_8F02:
  $8F02  90 90     BCC $8E94

L_8F04:
  $8F04  90 90     BCC $8E96

L_8F06:
  $8F06  90 90     BCC $8E98

L_8F08:
  $8F08  90 90     BCC $8E9A

L_8F0A:
  $8F0A  90 90     BCC $8E9C

L_8F0C:
  $8F0C  90 90     BCC $8E9E
  $8F0E  E0 90     CPX #$90
  $8F10  A8        TAY

L_8F11:
  $8F11  B4 A8     LDY $A8,X

L_8F13:
  $8F13  BD A8 A8  LDA $A8A8,X
  $8F16  E1 90     SBC ($90,X)
  $8F18  90 90     BCC $8EAA
  $8F1A  90 90     BCC $8EAC
  $8F1C  90 90     BCC $8EAE
  $8F1E  E1 90     SBC ($90,X)
  $8F20  A8        TAY

L_8F21:
  $8F21  A8        TAY
  $8F22  A8        TAY

L_8F23:
  $8F23  B4 BD     LDY $BD,X

L_8F25:
  $8F25  A8        TAY
  $8F26  E1 90     SBC ($90,X)
  $8F28  90 90     BCC $8EBA
  $8F2A  90 90     BCC $8EBC
  $8F2C  90 90     BCC $8EBE
  $8F2E  90 90     BCC $8EC0
  $8F30  90 90     BCC $8EC2
  $8F32  90 90     BCC $8EC4
  $8F34  90 90     BCC $8EC6
  $8F36  E0 90     CPX #$90
  $8F38  90 90     BCC $8ECA
  $8F3A  90 90     BCC $8ECC
  $8F3C  90 90     BCC $8ECE
  $8F3E  E1 90     SBC ($90,X)
  $8F40  90 90     BCC $8ED2
  $8F42  90 90     BCC $8ED4
  $8F44  90 90     BCC $8ED6
  $8F46  E1 90     SBC ($90,X)

L_8F48:
  $8F48  90 90     BCC $8EDA
  $8F4A  90 90     BCC $8EDC
  $8F4C  90 90     BCC $8EDE

L_8F4E:
  $8F4E  E1 90     SBC ($90,X)
  $8F50  90 90     BCC $8EE2
  $8F52  90 90     BCC $8EE4
  $8F54  90 90     BCC $8EE6
  $8F56  E1 90     SBC ($90,X)
  $8F58  90 90     BCC $8EEA
  $8F5A  90 90     BCC $8EEC
  $8F5C  90 90     BCC $8EEE
  $8F5E  90 90     BCC $8EF0
  $8F60  90 90     BCC $8EF2
  $8F62  90 90     BCC $8EF4
  $8F64  90 E2     BCC $8F48
  $8F66  90 90     BCC $8EF8
  $8F68  90 90     BCC $8EFA
  $8F6A  90 90     BCC $8EFC
  $8F6C  90 E0     BCC $8F4E
  $8F6E  90 90     BCC $8F00
  $8F70  90 90     BCC $8F02
  $8F72  90 90     BCC $8F04
  $8F74  90 90     BCC $8F06
  $8F76  90 90     BCC $8F08
  $8F78  90 90     BCC $8F0A
  $8F7A  90 90     BCC $8F0C
  $8F7C  E2        .db $E2

L_8F7D:
  $8F7D  90 90     BCC $8F0F

L_8F7F:
  $8F7F  90 90     BCC $8F11

L_8F81:
  $8F81  90 90     BCC $8F13

L_8F83:
  $8F83  90 90     BCC $8F15

L_8F85:
  $8F85  90 90     BCC $8F17

L_8F87:
  $8F87  90 90     BCC $8F19

L_8F89:
  $8F89  90 90     BCC $8F1B

L_8F8B:
  $8F8B  90 90     BCC $8F1D

L_8F8D:
  $8F8D  90 90     BCC $8F1F

L_8F8F:
  $8F8F  90 90     BCC $8F21
  $8F91  90 90     BCC $8F23
  $8F93  90 90     BCC $8F25
  $8F95  90 90     BCC $8F27
  $8F97  90 90     BCC $8F29
  $8F99  90 90     BCC $8F2B
  $8F9B  90 90     BCC $8F2D
  $8F9D  90 90     BCC $8F2F
  $8F9F  90 90     BCC $8F31
  $8FA1  90 90     BCC $8F33
  $8FA3  90 90     BCC $8F35
  $8FA5  90 90     BCC $8F37
  $8FA7  90 90     BCC $8F39
  $8FA9  90 90     BCC $8F3B
  $8FAB  90 90     BCC $8F3D
  $8FAD  90 90     BCC $8F3F
  $8FAF  90 90     BCC $8F41
  $8FB1  90 90     BCC $8F43
  $8FB3  90 90     BCC $8F45
  $8FB5  90 90     BCC $8F47
  $8FB7  90 90     BCC $8F49
  $8FB9  90 90     BCC $8F4B
  $8FBB  90 90     BCC $8F4D
  $8FBD  90 90     BCC $8F4F
  $8FBF  90 90     BCC $8F51
  $8FC1  90 90     BCC $8F53
  $8FC3  90 90     BCC $8F55
  $8FC5  90 90     BCC $8F57
  $8FC7  90 90     BCC $8F59
  $8FC9  90 90     BCC $8F5B
  $8FCB  90 90     BCC $8F5D
  $8FCD  90 90     BCC $8F5F
  $8FCF  90 90     BCC $8F61
  $8FD1  90 90     BCC $8F63
  $8FD3  90 90     BCC $8F65
  $8FD5  90 90     BCC $8F67
  $8FD7  90 90     BCC $8F69
  $8FD9  90 90     BCC $8F6B
  $8FDB  90 90     BCC $8F6D
  $8FDD  90 90     BCC $8F6F
  $8FDF  90 90     BCC $8F71
  $8FE1  90 90     BCC $8F73
  $8FE3  90 90     BCC $8F75
  $8FE5  90 90     BCC $8F77
  $8FE7  90 90     BCC $8F79
  $8FE9  90 90     BCC $8F7B
  $8FEB  90 90     BCC $8F7D
  $8FED  90 90     BCC $8F7F
  $8FEF  90 90     BCC $8F81
  $8FF1  90 90     BCC $8F83
  $8FF3  90 90     BCC $8F85
  $8FF5  90 90     BCC $8F87
  $8FF7  90 90     BCC $8F89
  $8FF9  90 90     BCC $8F8B
  $8FFB  90 90     BCC $8F8D
  $8FFD  90 90     BCC $8F8F
  $8FFF  90 02     BCC $9003
  $9001  79 79 A3  ADC $A379,Y
  $9004  7E 3E 00  ROR $003E,X
  $9007  00        BRK
  $9008  9E        .db $9E
  $9009  A7        .db $A7
  $900A  A7        .db $A7
  $900B  FF        .db $FF
  $900C  42        .db $42
  $900D  3E 00 00  ROL $0000,X
  $9010  00        BRK
  $9011  00        BRK
  $9012  03        .db $03
  $9013  04        .db $04
  $9014  09 1F     ORA #$1F
  $9016  33        .db $33
  $9017  3F        .db $3F
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  03        .db $03
  $901C  06 01     ASL $01
  $901E  1D 13 00  ORA $0013,X
  $9021  00        BRK
  $9022  80        .db $80
  $9023  E0 F0     CPX #$F0
  $9025  F8        SED
  $9026  F8        SED
  $9027  F7        .db $F7

L_9028:
  $9028  00        BRK
  $9029  00        BRK
  $902A  00        BRK
  $902B  00        BRK
  $902C  E0 F0     CPX #$F0
  $902E  F0 F8     BEQ $9028
  $9030  1F        .db $1F
  $9031  0E 01 01  ASL $0101
  $9034  01 07     ORA ($07,X)
  $9036  0F        .db $0F
  $9037  0F        .db $0F
  $9038  0E 00 00  ASL $0000
  $903B  00        BRK
  $903C  00        BRK
  $903D  01 07     ORA ($07,X)
  $903F  00        BRK
  $9040  FF        .db $FF
  $9041  FF        .db $FF
  $9042  1E 88 FD  ASL $FD88,X
  $9045  FB        .db $FB
  $9046  FB        .db $FB
  $9047  FB        .db $FB
  $9048  7F        .db $7F
  $9049  7F        .db $7F
  $904A  FF        .db $FF
  $904B  F7        .db $F7
  $904C  E3        .db $E3
  $904D  F1 F1     SBC ($F1),Y
  $904F  00        BRK
  $9050  00        BRK
  $9051  00        BRK
  $9052  80        .db $80
  $9053  E0 F0     CPX #$F0
  $9055  F8        SED
  $9056  F8        SED
  $9057  F4        .db $F4

L_9058:
  $9058  00        BRK
  $9059  00        BRK
  $905A  00        BRK
  $905B  00        BRK
  $905C  E0 F0     CPX #$F0
  $905E  F0 F8     BEQ $9058
  $9060  00        BRK
  $9061  80        .db $80
  $9062  40        RTI
  $9063  40        RTI
  $9064  80        .db $80
  $9065  80        .db $80
  $9066  00        BRK
  $9067  00        BRK
  $9068  00        BRK
  $9069  00        BRK
  $906A  80        .db $80
  $906B  80        .db $80
  $906C  00        BRK
  $906D  00        BRK
  $906E  00        BRK
  $906F  00        BRK
  $9070  03        .db $03
  $9071  04        .db $04
  $9072  09 1F     ORA #$1F
  $9074  33        .db $33
  $9075  3F        .db $3F
  $9076  2C 20 00  BIT $0020
  $9079  03        .db $03
  $907A  06 01     ASL $01
  $907C  1D 13 0C  ORA $0C13,X
  $907F  00        BRK
  $9080  80        .db $80
  $9081  E0 F0     CPX #$F0
  $9083  F8        SED
  $9084  F8        SED
  $9085  F4        .db $F4

L_9086:
  $9086  34        .db $34
  $9087  16 00     ASL $00,X
  $9089  00        BRK
  $908A  E0 F0     CPX #$F0
  $908C  F0 F8     BEQ $9086
  $908E  38        SEC
  $908F  18        CLC
  $9090  00        BRK
  $9091  00        BRK
  $9092  00        BRK
  $9093  01 03     ORA ($03,X)
  $9095  03        .db $03
  $9096  02        .db $02
  $9097  02        .db $02
  $9098  00        BRK
  $9099  00        BRK
  $909A  00        BRK
  $909B  00        BRK
  $909C  01 01     ORA ($01,X)
  $909E  00        BRK
  $909F  00        BRK
  $90A0  38        SEC
  $90A1  4E 9F FF  LSR $FF9F
  $90A4  3F        .db $3F
  $90A5  FF        .db $FF
  $90A6  C3        .db $C3
  $90A7  01 00     ORA ($00,X)
  $90A9  30 6E     BMI $9119
  $90AB  1F        .db $1F
  $90AC  DF        .db $DF
  $90AD  3F        .db $3F
  $90AE  C3        .db $C3
  $90AF  01 00     ORA ($00,X)
  $90B1  00        BRK
  $90B2  00        BRK
  $90B3  80        .db $80
  $90B4  80        .db $80
  $90B5  40        RTI
  $90B6  40        RTI
  $90B7  40        RTI
  $90B8  00        BRK
  $90B9  00        BRK
  $90BA  00        BRK
  $90BB  00        BRK
  $90BC  00        BRK
  $90BD  80        .db $80
  $90BE  80        .db $80
  $90BF  80        .db $80
  $90C0  03        .db $03
  $90C1  04        .db $04
  $90C2  09 1F     ORA #$1F
  $90C4  33        .db $33
  $90C5  3F        .db $3F
  $90C6  EC 20 00  CPX $0020
  $90C9  03        .db $03
  $90CA  06 01     ASL $01
  $90CC  1D 13 0C  ORA $0C13,X
  $90CF  C0 80     CPY #$80
  $90D1  E0 F0     CPX #$F0
  $90D3  F8        SED
  $90D4  F8        SED
  $90D5  F4        .db $F4

L_90D6:
  $90D6  37        .db $37
  $90D7  14        .db $14
  $90D8  00        BRK
  $90D9  00        BRK
  $90DA  E0 F0     CPX #$F0
  $90DC  F0 F8     BEQ $90D6
  $90DE  38        SEC
  $90DF  1B        .db $1B
  $90E0  FC        .db $FC
  $90E1  FE 7E 1C  INC $1C7E,X
  $90E4  00        BRK
  $90E5  00        BRK
  $90E6  00        BRK
  $90E7  00        BRK
  $90E8  78        SEI
  $90E9  7C        .db $7C
  $90EA  1C        .db $1C
  $90EB  00        BRK
  $90EC  00        BRK
  $90ED  00        BRK
  $90EE  00        BRK
  $90EF  00        BRK
  $90F0  00        BRK
  $90F1  1E 7F A3  ASL $A37F,X
  $90F4  FF        .db $FF
  $90F5  7F        .db $7F
  $90F6  1E 00 00  ASL $0000,X
  $90F9  00        BRK
  $90FA  0E 5E 5E  ASL $5E5E
  $90FD  0E 00 00  ASL $0000
  $9100  00        BRK
  $9101  00        BRK
  $9102  03        .db $03
  $9103  07        .db $07
  $9104  07        .db $07
  $9105  07        .db $07
  $9106  03        .db $03
  $9107  01 00     ORA ($00,X)
  $9109  00        BRK
  $910A  00        BRK
  $910B  03        .db $03
  $910C  03        .db $03
  $910D  03        .db $03
  $910E  01 00     ORA ($00,X)
  $9110  2C 20 A0  BIT $A020
  $9113  E0 D0     CPX #$D0
  $9115  E8        INX
  $9116  C7        .db $C7

L_9117:
  $9117  E4 0C     CPX $0C

L_9119:
  $9119  00        BRK
  $911A  00        BRK
  $911B  80        .db $80
  $911C  80        .db $80
  $911D  90 F8     BCC $9117
  $911F  FB        .db $FB
  $9120  34        .db $34
  $9121  14        .db $14
  $9122  19 19 32  ORA $3219,Y
  $9125  22        .db $22
  $9126  C6 1E     DEC $1E
  $9128  3B        .db $3B
  $9129  1B        .db $1B
  $912A  16 16     ASL $16,X

L_912C:
  $912C  2C 1C 3C  BIT $3C1C
  $912F  FC        .db $FC
  $9130  C0 E0     CPY #$E0
  $9132  F0 F8     BEQ $912C
  $9134  F8        SED
  $9135  F8        SED
  $9136  70 C0     BVS $90F8
  $9138  00        BRK
  $9139  40        RTI
  $913A  E0 F0     CPX #$F0
  $913C  70 70     BVS $91AE
  $913E  00        BRK
  $913F  00        BRK
  $9140  2C 20 20  BIT $2020
  $9143  20 10 38  JSR $3810
  $9146  7F        .db $7F
  $9147  7F        .db $7F

L_9148:
  $9148  0C        .db $0C
  $9149  00        BRK
  $914A  00        BRK
  $914B  00        BRK
  $914C  00        BRK
  $914D  00        BRK
  $914E  38        SEC
  $914F  3F        .db $3F
  $9150  34        .db $34
  $9151  17        .db $17
  $9152  18        CLC
  $9153  11 09     ORA ($09),Y
  $9155  87        .db $87

L_9156:
  $9156  05 36     ORA $36
  $9158  38        SEC
  $9159  18        CLC
  $915A  17        .db $17
  $915B  0F        .db $0F
  $915C  37        .db $37
  $915D  F8        SED
  $915E  F8        SED
  $915F  EC 00 00  CPX $0000
  $9162  C0 E0     CPY #$E0
  $9164  F0 F0     BEQ $9156
  $9166  F0 E0     BEQ $9148
  $9168  00        BRK
  $9169  00        BRK
  $916A  00        BRK
  $916B  C0 E0     CPY #$E0
  $916D  E0 E0     CPX #$E0
  $916F  00        BRK
  $9170  20 20 10  JSR $1020
  $9173  08        PHP
  $9174  0F        .db $0F
  $9175  1C        .db $1C
  $9176  1E 0F 00  ASL $000F,X
  $9179  00        BRK
  $917A  00        BRK
  $917B  00        BRK
  $917C  00        BRK
  $917D  0B        .db $0B
  $917E  0D 00 19  ORA $1900
  $9181  18        CLC
  $9182  30 24     BMI $91A8
  $9184  CF        .db $CF
  $9185  3F        .db $3F
  $9186  7F        .db $7F
  $9187  FE 16 17  INC $1716,X
  $918A  2F        .db $2F
  $918B  1B        .db $1B
  $918C  37        .db $37
  $918D  CF        .db $CF
  $918E  B6 BC     LDX $BC,Y
  $9190  02        .db $02
  $9191  02        .db $02
  $9192  07        .db $07
  $9193  0C        .db $0C
  $9194  0E 1E 1F  ASL $1F1E
  $9197  1F        .db $1F
  $9198  00        BRK
  $9199  00        BRK
  $919A  00        BRK
  $919B  07        .db $07
  $919C  07        .db $07
  $919D  0F        .db $0F
  $919E  0C        .db $0C
  $919F  0E 01 01  ASL $0101
  $91A2  03        .db $03
  $91A3  82        .db $82
  $91A4  7C        .db $7C
  $91A5  80        .db $80
  $91A6  80        .db $80
  $91A7  80        .db $80

L_91A8:
  $91A8  01 01     ORA ($01,X)
  $91AA  02        .db $02
  $91AB  01 83     ORA ($83,X)
  $91AD  7F        .db $7F

L_91AE:
  $91AE  7F        .db $7F
  $91AF  7F        .db $7F
  $91B0  80        .db $80
  $91B1  C0 30     CPY #$30
  $91B3  18        CLC
  $91B4  38        SEC
  $91B5  BC FC FC  LDY $FCFC,X
  $91B8  00        BRK
  $91B9  00        BRK
  $91BA  C0 F0     CPY #$F0
  $91BC  F0 78     BEQ $9236
  $91BE  18        CLC
  $91BF  38        SEC
  $91C0  20 20 D0  JSR $D020
  $91C3  28        PLP
  $91C4  20 10 10  JSR $1010
  $91C7  70 C0     BVS $9189
  $91C9  C0 20     CPY #$20
  $91CB  10 18     BPL $91E5
  $91CD  0F        .db $0F
  $91CE  0F        .db $0F

L_91CF:
  $91CF  0F        .db $0F
  $91D0  18        CLC
  $91D1  18        CLC
  $91D2  33        .db $33
  $91D3  24 44     BIT $44
  $91D5  08        PHP
  $91D6  08        PHP
  $91D7  08        PHP
  $91D8  17        .db $17
  $91D9  17        .db $17
  $91DA  2C 18 38  BIT $3818
  $91DD  F0 F0     BEQ $91CF
  $91DF  F0 C0     BEQ $91A1
  $91E1  E0 F0     CPX #$F0
  $91E3  F8        SED
  $91E4  F8        SED

L_91E5:
  $91E5  F8        SED
  $91E6  70 00     BVS $91E8

L_91E8:
  $91E8  00        BRK
  $91E9  C0 E0     CPY #$E0
  $91EB  F0 70     BEQ $925D
  $91ED  70 00     BVS $91EF

L_91EF:
  $91EF  00        BRK
  $91F0  00        BRK
  $91F1  00        BRK
  $91F2  00        BRK
  $91F3  00        BRK
  $91F4  00        BRK
  $91F5  7C        .db $7C
  $91F6  82        .db $82
  $91F7  7F        .db $7F
  $91F8  00        BRK
  $91F9  00        BRK
  $91FA  00        BRK
  $91FB  00        BRK
  $91FC  00        BRK
  $91FD  00        BRK
  $91FE  7C        .db $7C
  $91FF  FE 9E FF  INC $FF9E,X
  $9202  FF        .db $FF
  $9203  FF        .db $FF
  $9204  7E 3E 00  ROR $003E,X
  $9207  00        BRK
  $9208  9E        .db $9E
  $9209  FF        .db $FF
  $920A  21 FF     AND ($FF,X)
  $920C  42        .db $42
  $920D  3E 00 00  ROL $0000,X
  $9210  EA        NOP
  $9211  71 02     ADC ($02),Y
  $9213  06 07     ASL $07
  $9215  0F        .db $0F
  $9216  1F        .db $1F
  $9217  1F        .db $1F

L_9218:
  $9218  71 00     ADC ($00),Y
  $921A  01 03     ORA ($03,X)
  $921C  03        .db $03
  $921D  01 0F     ORA ($0F,X)
  $921F  00        BRK
  $9220  FF        .db $FF
  $9221  1F        .db $1F
  $9222  1D 31 E9  ORA $E931,X
  $9225  E7        .db $E7
  $9226  F0 F0     BEQ $9218
  $9228  FC        .db $FC
  $9229  F9 F3 CF  SBC $CFF3,Y
  $922C  C7        .db $C7
  $922D  C0 E0     CPY #$E0
  $922F  00        BRK
  $9230  E0 F0     CPX #$F0
  $9232  F8        SED
  $9233  F8        SED
  $9234  F0 00     BEQ $9236

L_9236:
  $9236  00        BRK
  $9237  00        BRK
  $9238  C0 E0     CPY #$E0
  $923A  F0 B0     BEQ $91EC
  $923C  00        BRK
  $923D  00        BRK
  $923E  00        BRK
  $923F  00        BRK
  $9240  7F        .db $7F
  $9241  3F        .db $3F
  $9242  04        .db $04
  $9243  0E 0F 1F  ASL $1F0F
  $9246  3F        .db $3F
  $9247  3F        .db $3F
  $9248  3F        .db $3F
  $9249  00        BRK
  $924A  03        .db $03
  $924B  07        .db $07
  $924C  07        .db $07
  $924D  03        .db $03
  $924E  1F        .db $1F
  $924F  00        BRK
  $9250  6F        .db $6F
  $9251  FD 78 38  SBC $3878,X
  $9254  C5 C3     CMP $C3
  $9256  E0 E0     CPX #$E0
  $9258  DC        .db $DC
  $9259  3E FF C7  ROL $C7FF,X
  $925C  83        .db $83

L_925D:
  $925D  80        .db $80
  $925E  C0 00     CPY #$00
  $9260  F0 F8     BEQ $925A
  $9262  FC        .db $FC

L_9263:
  $9263  FC        .db $FC
  $9264  F8        SED
  $9265  80        .db $80
  $9266  00        BRK
  $9267  00        BRK
  $9268  60        RTS
  $9269  F0 F8     BEQ $9263
  $926B  D8        CLD
  $926C  80        .db $80
  $926D  00        BRK
  $926E  00        BRK
  $926F  00        BRK
  $9270  02        .db $02
  $9271  02        .db $02
  $9272  01 00     ORA ($00,X)
  $9274  00        BRK
  $9275  00        BRK
  $9276  00        BRK
  $9277  00        BRK
  $9278  01 01     ORA ($01,X)
  $927A  00        BRK
  $927B  00        BRK
  $927C  00        BRK
  $927D  00        BRK
  $927E  00        BRK
  $927F  00        BRK
  $9280  FC        .db $FC
  $9281  98        TYA
  $9282  8C FE 7F  STY $7FFE
  $9285  7F        .db $7F
  $9286  FE FC 58  INC $58FC,X
  $9289  60        RTS
  $928A  70 7C     BVS $9308
  $928C  3E 0E 7C  ROL $7C0E,X
  $928F  00        BRK
  $9290  1F        .db $1F
  $9291  0E 01 03  ASL $0301
  $9294  07        .db $07
  $9295  1F        .db $1F
  $9296  3F        .db $3F
  $9297  3F        .db $3F
  $9298  0E 00 00  ASL $0000
  $929B  01 01     ORA ($01,X)
  $929D  07        .db $07
  $929E  1F        .db $1F
  $929F  00        BRK
  $92A0  FF        .db $FF
  $92A1  FF        .db $FF
  $92A2  1E 08 D5  ASL $D508,X
  $92A5  E3        .db $E3
  $92A6  E3        .db $E3
  $92A7  E3        .db $E3
  $92A8  7F        .db $7F
  $92A9  7F        .db $7F
  $92AA  FF        .db $FF
  $92AB  F7        .db $F7
  $92AC  E3        .db $E3

L_92AD:
  $92AD  C1 C1     CMP ($C1,X)
  $92AF  00        BRK
  $92B0  FC        .db $FC
  $92B1  B8        CLV
  $92B2  40        RTI
  $92B3  E0 F0     CPX #$F0
  $92B5  FC        .db $FC

L_92B6:
  $92B6  FE FE 38  INC $38FE,X
  $92B9  00        BRK
  $92BA  80        .db $80

L_92BB:
  $92BB  C0 C0     CPY #$C0
  $92BD  F0 FC     BEQ $92BB
  $92BF  00        BRK

L_92C0:
  $92C0  8F        .db $8F
  $92C1  C7        .db $C7
  $92C2  E3        .db $E3
  $92C3  FF        .db $FF
  $92C4  F0 F0     BEQ $92B6
  $92C6  F1 C3     SBC ($C3),Y
  $92C8  7F        .db $7F

L_92C9:
  $92C9  FF        .db $FF
  $92CA  FF        .db $FF

L_92CB:
  $92CB  F0 E0     BEQ $92AD
  $92CD  E0 C0     CPX #$C0
  $92CF  01 F8     ORA ($F8,X)
  $92D1  F8        SED
  $92D2  C8        INY
  $92D3  04        .db $04
  $92D4  8C FC F8  STY $F8FC
  $92D7  F0 F0     BEQ $92C9
  $92D9  F0 F0     BEQ $92CB
  $92DB  F8        SED
  $92DC  78        SEI
  $92DD  78        SEI
  $92DE  F0 E0     BEQ $92C0
  $92E0  9E        .db $9E
  $92E1  FF        .db $FF
  $92E2  FF        .db $FF
  $92E3  FF        .db $FF
  $92E4  7E 3E 3C  ROR $3C3E,X
  $92E7  00        BRK
  $92E8  9E        .db $9E
  $92E9  FF        .db $FF
  $92EA  23        .db $23
  $92EB  FF        .db $FF
  $92EC  46 02     LSR $02
  $92EE  04        .db $04
  $92EF  00        BRK
  $92F0  02        .db $02
  $92F1  79 79 A3  ADC $A379,Y
  $92F4  7E 3E 3C  ROR $3C3E,X
  $92F7  00        BRK
  $92F8  9E        .db $9E
  $92F9  A7        .db $A7
  $92FA  A7        .db $A7
  $92FB  FF        .db $FF
  $92FC  46 02     LSR $02
  $92FE  04        .db $04
  $92FF  00        BRK
  $9300  06 0F     ASL $0F
  $9302  1F        .db $1F
  $9303  1F        .db $1F
  $9304  0F        .db $0F
  $9305  07        .db $07
  $9306  03        .db $03
  $9307  01 00     ORA ($00,X)
  $9309  06 0F     ASL $0F
  $930B  0E 06 03  ASL $0306
  $930E  01 00     ORA ($00,X)
  $9310  03        .db $03
  $9311  04        .db $04
  $9312  09 9F     ORA #$9F
  $9314  B3        .db $B3
  $9315  FF        .db $FF
  $9316  EC A0 00  CPX $00A0
  $9319  03        .db $03
  $931A  06 01     ASL $01
  $931C  1D 93 CC  ORA $CC93,X
  $931F  C0 80     CPY #$80
  $9321  E0 F0     CPX #$F0
  $9323  F9 F9 F7  SBC $F7F9,Y
  $9326  37        .db $37

L_9327:
  $9327  17        .db $17
  $9328  00        BRK
  $9329  00        BRK
  $932A  E0 F0     CPX #$F0
  $932C  F0 F9     BEQ $9327
  $932E  3B        .db $3B
  $932F  1B        .db $1B
  $9330  5A        .db $5A
  $9331  5A        .db $5A
  $9332  5A        .db $5A
  $9333  49 41     EOR #$41
  $9335  4B        .db $4B
  $9336  5B        .db $5B
  $9337  7B        .db $7B
  $9338  3C        .db $3C
  $9339  3C        .db $3C
  $933A  3C        .db $3C
  $933B  3E 3E 3E  ROL $3E3E,X
  $933E  3E 3E 5E  ROL $5E3E,X
  $9341  3E 1C 04  ROL $041C,X
  $9344  03        .db $03
  $9345  06 0E     ASL $0E
  $9347  07        .db $07
  $9348  3F        .db $3F
  $9349  1F        .db $1F
  $934A  07        .db $07
  $934B  03        .db $03
  $934C  01 03     ORA ($03,X)
  $934E  07        .db $07
  $934F  00        BRK
  $9350  00        BRK
  $9351  00        BRK
  $9352  00        BRK
  $9353  00        BRK
  $9354  00        BRK
  $9355  00        BRK
  $9356  3F        .db $3F
  $9357  7F        .db $7F
  $9358  00        BRK
  $9359  00        BRK
  $935A  00        BRK
  $935B  00        BRK
  $935C  00        BRK
  $935D  00        BRK
  $935E  00        BRK
  $935F  3F        .db $3F
  $9360  00        BRK
  $9361  00        BRK
  $9362  00        BRK
  $9363  00        BRK
  $9364  7E C1 5F  ROR $5FC1,X
  $9367  70 00     BVS $9369

L_9369:
  $9369  00        BRK
  $936A  00        BRK
  $936B  00        BRK

L_936C:
  $936C  00        BRK
  $936D  7E FF FF  ROR $FFFF,X
  $9370  3F        .db $3F
  $9371  7F        .db $7F
  $9372  5A        .db $5A
  $9373  48        PHA
  $9374  49 DF     EOR #$DF
  $9376  DD FF FF  CMP $FFFF,X
  $9379  FF        .db $FF
  $937A  FF        .db $FF
  $937B  FF        .db $FF
  $937C  FF        .db $FF
  $937D  FF        .db $FF
  $937E  FF        .db $FF
  $937F  00        BRK
  $9380  38        SEC
  $9381  38        SEC
  $9382  78        SEI
  $9383  F0 E0     BEQ $9365
  $9385  00        BRK
  $9386  00        BRK
  $9387  00        BRK
  $9388  E0 F0     CPX #$F0
  $938A  F0 E0     BEQ $936C
  $938C  00        BRK
  $938D  00        BRK
  $938E  00        BRK
  $938F  00        BRK
  $9390  00        BRK
  $9391  00        BRK
  $9392  01 01     ORA ($01,X)
  $9394  01 07     ORA ($07,X)
  $9396  0F        .db $0F
  $9397  0F        .db $0F
  $9398  00        BRK
  $9399  00        BRK
  $939A  00        BRK
  $939B  00        BRK
  $939C  00        BRK
  $939D  01 07     ORA ($07,X)
  $939F  00        BRK
  $93A0  2C 20 E0  BIT $E020
  $93A3  20 10 38  JSR $3810
  $93A6  FF        .db $FF
  $93A7  7F        .db $7F
  $93A8  0C        .db $0C
  $93A9  00        BRK
  $93AA  00        BRK
  $93AB  C0 E0     CPY #$E0
  $93AD  C0 38     CPY #$38
  $93AF  3F        .db $3F
  $93B0  34        .db $34
  $93B1  14        .db $14
  $93B2  18        CLC
  $93B3  10 08     BPL $93BD
  $93B5  84 04     STY $04
  $93B7  36 38     ROL $38,X
  $93B9  18        CLC
  $93BA  10 00     BPL $93BC

L_93BC:
  $93BC  30 F8     BMI $93B6
  $93BE  F8        SED
  $93BF  EC 00 00  CPX $0000
  $93C2  7E 7E 00  ROR $007E,X
  $93C5  00        BRK
  $93C6  00        BRK
  $93C7  00        BRK
  $93C8  00        BRK
  $93C9  00        BRK
  $93CA  7E 7E 00  ROR $007E,X
  $93CD  00        BRK
  $93CE  00        BRK
  $93CF  00        BRK
  $93D0  00        BRK
  $93D1  00        BRK
  $93D2  00        BRK
  $93D3  18        CLC
  $93D4  18        CLC
  $93D5  00        BRK
  $93D6  00        BRK
  $93D7  00        BRK
  $93D8  00        BRK

L_93D9:
  $93D9  00        BRK
  $93DA  00        BRK
  $93DB  18        CLC
  $93DC  18        CLC
  $93DD  00        BRK
  $93DE  00        BRK
  $93DF  00        BRK
  $93E0  38        SEC
  $93E1  7C        .db $7C
  $93E2  7F        .db $7F
  $93E3  FC        .db $FC
  $93E4  FC        .db $FC
  $93E5  FC        .db $FC
  $93E6  BC BC 00  LDY $00BC,X
  $93E9  38        SEC
  $93EA  38        SEC
  $93EB  73        .db $73
  $93EC  6F        .db $6F
  $93ED  7F        .db $7F
  $93EE  5F        .db $5F

L_93EF:
  $93EF  5F        .db $5F

L_93F0:
  $93F0  00        BRK
  $93F1  00        BRK
  $93F2  00        BRK
  $93F3  E0 F0     CPX #$F0
  $93F5  F0 F8     BEQ $93EF
  $93F7  E8        INX
  $93F8  00        BRK
  $93F9  00        BRK
  $93FA  00        BRK
  $93FB  00        BRK
  $93FC  C0 E0     CPY #$E0
  $93FE  F0 F0     BEQ $93F0
  $9400  F8        SED
  $9401  F8        SED
  $9402  F8        SED
  $9403  F8        SED
  $9404  F8        SED
  $9405  70 00     BVS $9407

L_9407:
  $9407  00        BRK
  $9408  70 70     BVS $947A
  $940A  70 70     BVS $947C
  $940C  70 00     BVS $940E

L_940E:
  $940E  00        BRK
  $940F  00        BRK
  $9410  20 A0 50  JSR $50A0
  $9413  28        PLP
  $9414  20 10 10  JSR $1010
  $9417  70 C0     BVS $93D9
  $9419  40        RTI
  $941A  20 10 18  JSR $1810
  $941D  0F        .db $0F
  $941E  0F        .db $0F

L_941F:
  $941F  0F        .db $0F
  $9420  1B        .db $1B
  $9421  19 32 24  ORA $2432,Y
  $9424  44        .db $44
  $9425  08        PHP
  $9426  08        PHP
  $9427  08        PHP
  $9428  17        .db $17
  $9429  16 2C     ASL $2C,X
  $942B  18        CLC
  $942C  38        SEC
  $942D  F0 F0     BEQ $941F
  $942F  F0 20     BEQ $9451
  $9431  E0 30     CPX #$30
  $9433  08        PHP
  $9434  07        .db $07
  $9435  F8        SED

L_9436:
  $9436  04        .db $04
  $9437  02        .db $02
  $9438  00        BRK
  $9439  00        BRK
  $943A  C0 F0     CPY #$F0
  $943C  F8        SED
  $943D  07        .db $07
  $943E  03        .db $03
  $943F  01 18     ORA ($18,X)
  $9441  18        CLC
  $9442  32        .db $32
  $9443  27        .db $27

L_9444:
  $9444  CF        .db $CF
  $9445  0F        .db $0F
  $9446  07        .db $07
  $9447  0F        .db $0F
  $9448  17        .db $17
  $9449  17        .db $17
  $944A  2D 1A 36  AND $361A
  $944D  F7        .db $F7
  $944E  FB        .db $FB
  $944F  FC        .db $FC
  $9450  C0 20     CPY #$20
  $9452  30 F0     BMI $9444
  $9454  F0 E0     BEQ $9436
  $9456  C0 80     CPY #$80
  $9458  00        BRK
  $9459  C0 E0     CPY #$E0
  $945B  E0 E0     CPX #$E0
  $945D  C0 80     CPY #$80
  $945F  00        BRK
  $9460  07        .db $07
  $9461  18        CLC
  $9462  27        .db $27
  $9463  4F        .db $4F
  $9464  5F        .db $5F
  $9465  BC B8 B9  LDY $B9B8,X
  $9468  00        BRK
  $9469  07        .db $07
  $946A  18        CLC
  $946B  30 23     BMI $9490
  $946D  47        .db $47
  $946E  4F        .db $4F
  $946F  4F        .db $4F
  $9470  E0 18     CPX #$18
  $9472  E4 F2     CPX $F2
  $9474  FA        .db $FA
  $9475  FD FD FD  SBC $FDFD,X
  $9478  00        BRK
  $9479  E0 18     CPX #$18
  $947B  0C        .db $0C

L_947C:
  $947C  C4 E2     CPY $E2
  $947E  F2        .db $F2
  $947F  F2        .db $F2
  $9480  3C        .db $3C
  $9481  7E FF FF  ROR $FFFF,X
  $9484  FF        .db $FF
  $9485  FF        .db $FF
  $9486  7E 3C 00  ROR $003C,X
  $9489  00        BRK
  $948A  00        BRK
  $948B  00        BRK
  $948C  00        BRK
  $948D  00        BRK
  $948E  00        BRK
  $948F  00        BRK

L_9490:
  $9490  00        BRK
  $9491  00        BRK
  $9492  01 03     ORA ($03,X)
  $9494  07        .db $07
  $9495  1F        .db $1F
  $9496  3F        .db $3F
  $9497  3F        .db $3F
  $9498  00        BRK
  $9499  00        BRK
  $949A  00        BRK
  $949B  01 01     ORA ($01,X)
  $949D  07        .db $07
  $949E  1F        .db $1F
  $949F  00        BRK
  $94A0  2C 20 E0  BIT $E020
  $94A3  20 10 08  JSR $0810
  $94A6  FF        .db $FF
  $94A7  04        .db $04
  $94A8  0C        .db $0C
  $94A9  00        BRK
  $94AA  00        BRK
  $94AB  C0 E0     CPY #$E0
  $94AD  F0 08     BEQ $94B7
  $94AF  03        .db $03
  $94B0  02        .db $02
  $94B1  01 02     ORA ($02,X)
  $94B3  06 07     ASL $07
  $94B5  0F        .db $0F
  $94B6  1F        .db $1F

L_94B7:
  $94B7  1F        .db $1F
  $94B8  01 00     ORA ($00,X)
  $94BA  01 03     ORA ($03,X)
  $94BC  03        .db $03
  $94BD  01 0F     ORA ($0F,X)
  $94BF  00        BRK
  $94C0  FF        .db $FF
  $94C1  F4        .db $F4
  $94C2  7F        .db $7F
  $94C3  68        PLA
  $94C4  68        PLA
  $94C5  68        PLA
  $94C6  68        PLA
  $94C7  68        PLA
  $94C8  00        BRK
  $94C9  7F        .db $7F

L_94CA:
  $94CA  00        BRK
  $94CB  3F        .db $3F
  $94CC  3F        .db $3F
  $94CD  3F        .db $3F
  $94CE  3F        .db $3F
  $94CF  3F        .db $3F
  $94D0  F0 F8     BEQ $94CA
  $94D2  FC        .db $FC

L_94D3:
  $94D3  FC        .db $FC
  $94D4  F8        SED
  $94D5  80        .db $80
  $94D6  00        BRK
  $94D7  00        BRK
  $94D8  60        RTS

L_94D9:
  $94D9  F0 F8     BEQ $94D3
  $94DB  D8        CLD
  $94DC  80        .db $80
  $94DD  00        BRK
  $94DE  00        BRK
  $94DF  00        BRK
  $94E0  BC BF 5F  LDY $5FBF,X
  $94E3  4F        .db $4F
  $94E4  27        .db $27
  $94E5  10 30     BPL $9517
  $94E7  4C 5F 5F  JMP $5F5F
  $94EA  2F        .db $2F
  $94EB  37        .db $37
  $94EC  18        CLC
  $94ED  0F        .db $0F
  $94EE  0F        .db $0F
  $94EF  3F        .db $3F
  $94F0  EE EF FF  INC $FFEF
  $94F3  E7        .db $E7
  $94F4  C3        .db $C3
  $94F5  01 11     ORA ($11,X)
  $94F7  19 F0 F6  ORA $F6F0,Y
  $94FA  E6 DE     INC $DE
  $94FC  3E FE EE  ROL $EEFE,X
  $94FF  E6 00     INC $00
  $9501  01 01     ORA ($01,X)
  $9503  01 03     ORA ($03,X)
  $9505  07        .db $07

L_9506:
  $9506  07        .db $07
  $9507  03        .db $03
  $9508  00        BRK
  $9509  00        BRK
  $950A  00        BRK
  $950B  00        BRK
  $950C  01 03     ORA ($03,X)

L_950E:
  $950E  03        .db $03
  $950F  00        BRK
  $9510  8F        .db $8F
  $9511  C7        .db $C7
  $9512  E3        .db $E3
  $9513  FF        .db $FF
  $9514  F0 F0     BEQ $9506
  $9516  F0 C1     BEQ $94D9
  $9518  7F        .db $7F
  $9519  FF        .db $FF

L_951A:
  $951A  FF        .db $FF
  $951B  F0 E0     BEQ $94FD
  $951D  E0 C0     CPX #$C0
  $951F  00        BRK

L_9520:
  $9520  F8        SED
  $9521  F8        SED
  $9522  C8        INY
  $9523  08        PHP
  $9524  88        DEY
  $9525  C8        INY
  $9526  F8        SED
  $9527  F8        SED
  $9528  F0 F0     BEQ $951A
  $952A  F0 F0     BEQ $951C
  $952C  70 70     BVS $959E
  $952E  70 F0     BVS $9520
  $9530  03        .db $03
  $9531  02        .db $02
  $9532  04        .db $04
  $9533  0E 0F 1F  ASL $1F0F
  $9536  3F        .db $3F
  $9537  3F        .db $3F
  $9538  01 01     ORA ($01,X)
  $953A  03        .db $03
  $953B  07        .db $07
  $953C  07        .db $07
  $953D  03        .db $03
  $953E  1F        .db $1F
  $953F  00        BRK
  $9540  FE FD 78  INC $78FD,X
  $9543  30 C9     BMI $950E
  $9545  C7        .db $C7
  $9546  E3        .db $E3
  $9547  E3        .db $E3
  $9548  FC        .db $FC
  $9549  FE FF CF  INC $CFFF,X
  $954C  87        .db $87
  $954D  83        .db $83
  $954E  C1 00     CMP ($00,X)
  $9550  00        BRK
  $9551  00        BRK
  $9552  80        .db $80
  $9553  C0 F0     CPY #$F0
  $9555  FC        .db $FC
  $9556  FE FE 00  INC $00FE,X
  $9559  00        BRK
  $955A  00        BRK
  $955B  80        .db $80
  $955C  C0 F0     CPY #$F0
  $955E  FC        .db $FC
  $955F  00        BRK
  $9560  07        .db $07
  $9561  1F        .db $1F
  $9562  3F        .db $3F
  $9563  7F        .db $7F
  $9564  7F        .db $7F
  $9565  FF        .db $FF
  $9566  FF        .db $FF
  $9567  FF        .db $FF
  $9568  00        BRK
  $9569  07        .db $07
  $956A  18        CLC
  $956B  30 20     BMI $958D
  $956D  40        RTI
  $956E  40        RTI
  $956F  40        RTI
  $9570  3C        .db $3C
  $9571  7E E7 CF  ROR $CFE7,X
  $9574  DF        .db $DF
  $9575  FF        .db $FF
  $9576  7E 3C 00  ROR $003C,X
  $9579  3C        .db $3C
  $957A  7E 7E 7E  ROR $7E7E,X
  $957D  7E 3C 00  ROR $003C,X
  $9580  3C        .db $3C
  $9581  42        .db $42
  $9582  FF        .db $FF
  $9583  EF        .db $EF
  $9584  FF        .db $FF
  $9585  FF        .db $FF
  $9586  42        .db $42
  $9587  3C        .db $3C
  $9588  00        BRK
  $9589  3C        .db $3C
  $958A  00        BRK
  $958B  5A        .db $5A
  $958C  5A        .db $5A

L_958D:
  $958D  00        BRK
  $958E  3C        .db $3C
  $958F  00        BRK
  $9590  E0 20     CPX #$20
  $9592  10 08     BPL $959C
  $9594  FF        .db $FF
  $9595  04        .db $04
  $9596  02        .db $02
  $9597  03        .db $03
  $9598  00        BRK
  $9599  C0 E0     CPY #$E0
  $959B  F0 00     BEQ $959D

L_959D:
  $959D  03        .db $03

L_959E:
  $959E  01 00     ORA ($00,X)
  $95A0  FF        .db $FF
  $95A1  F4        .db $F4
  $95A2  7F        .db $7F
  $95A3  68        PLA
  $95A4  6F        .db $6F
  $95A5  6F        .db $6F
  $95A6  6E 6F 00  ROR $006F
  $95A9  7F        .db $7F
  $95AA  00        BRK
  $95AB  3F        .db $3F
  $95AC  30 30     BMI $95DE
  $95AE  31 30     AND ($30),Y
  $95B0  FF        .db $FF
  $95B1  2F        .db $2F
  $95B2  FE 16 F6  INC $F616,X
  $95B5  F6 16     INC $16,X
  $95B7  F6 00     INC $00,X
  $95B9  FE 00 FC  INC $FC00,X
  $95BC  0C        .db $0C
  $95BD  0C        .db $0C
  $95BE  FC        .db $FC
  $95BF  1C        .db $1C
  $95C0  EC A0 A0  CPX $A0A0
  $95C3  A0 50     LDY #$50
  $95C5  48        PHA
  $95C6  27        .db $27
  $95C7  14        .db $14
  $95C8  4C 40 40  JMP $4040
  $95CB  40        RTI
  $95CC  20 30 18  JSR $1830
  $95CF  0B        .db $0B
  $95D0  FC        .db $FC
  $95D1  FC        .db $FC
  $95D2  7C        .db $7C
  $95D3  3C        .db $3C
  $95D4  18        CLC
  $95D5  00        BRK
  $95D6  00        BRK
  $95D7  00        BRK
  $95D8  78        SEI
  $95D9  78        SEI
  $95DA  38        SEC
  $95DB  18        CLC
  $95DC  00        BRK
  $95DD  00        BRK

L_95DE:
  $95DE  00        BRK
  $95DF  00        BRK
  $95E0  8F        .db $8F
  $95E1  87        .db $87
  $95E2  FF        .db $FF
  $95E3  7F        .db $7F
  $95E4  3F        .db $3F
  $95E5  3E 3C 18  ROL $183C,X
  $95E8  77        .db $77
  $95E9  7B        .db $7B

L_95EA:
  $95EA  7D 3E 1E  ADC $1E3E,X
  $95ED  1C        .db $1C
  $95EE  18        CLC
  $95EF  00        BRK
  $95F0  FE F8 E8  INC $E8F8,X
  $95F3  88        DEY
  $95F4  8C 9C 7C  STY $7C9C
  $95F7  FC        .db $FC
  $95F8  F0 F0     BEQ $95EA
  $95FA  F0 70     BEQ $966C
  $95FC  78        SEI
  $95FD  78        SEI
  $95FE  38        SEC
  $95FF  78        SEI
  $9600  01 06     ORA ($06,X)
  $9602  0F        .db $0F
  $9603  30 40     BMI $9645
  $9605  C0 F7     CPY #$F7
  $9607  FF        .db $FF
  $9608  00        BRK
  $9609  01 07     ORA ($07,X)
  $960B  0F        .db $0F
  $960C  3F        .db $3F
  $960D  7F        .db $7F
  $960E  7F        .db $7F
  $960F  6F        .db $6F
  $9610  FF        .db $FF
  $9611  7F        .db $7F
  $9612  3F        .db $3F
  $9613  27        .db $27
  $9614  21 21     AND ($21,X)
  $9616  22        .db $22
  $9617  3E 4F 1F  ROL $1F4F,X
  $961A  1F        .db $1F
  $961B  1F        .db $1F
  $961C  1E 1E 1C  ASL $1C1E,X
  $961F  1C        .db $1C
  $9620  FF        .db $FF
  $9621  E2        .db $E2
  $9622  C3        .db $C3
  $9623  8F        .db $8F
  $9624  FF        .db $FF
  $9625  3F        .db $3F
  $9626  3F        .db $3F
  $9627  3F        .db $3F
  $9628  F2        .db $F2
  $9629  FC        .db $FC
  $962A  FE F6 0E  INC $0EF6,X
  $962D  1C        .db $1C
  $962E  1E 00 3E  ASL $3E00,X
  $9631  3F        .db $3F
  $9632  3F        .db $3F
  $9633  1F        .db $1F
  $9634  1F        .db $1F
  $9635  0E 00 00  ASL $0000
  $9638  1C        .db $1C
  $9639  1E 1E 0E  ASL $0E1E,X
  $963C  0E 00 00  ASL $0000
  $963F  00        BRK
  $9640  38        SEC
  $9641  7C        .db $7C
  $9642  7F        .db $7F
  $9643  3F        .db $3F
  $9644  3F        .db $3F

L_9645:
  $9645  3F        .db $3F
  $9646  7F        .db $7F
  $9647  30 00     BMI $9649

L_9649:
  $9649  28        PLP
  $964A  30 1E     BMI $966A
  $964C  1E 1E 30  ASL $301E,X
  $964F  00        BRK
  $9650  00        BRK
  $9651  00        BRK
  $9652  1F        .db $1F
  $9653  20 5F 7F  JSR $7F5F
  $9656  FC        .db $FC
  $9657  BC 00 00  LDY $0000,X
  $965A  00        BRK
  $965B  1F        .db $1F
  $965C  20 03 67  JSR $6703
  $965F  67        .db $67
  $9660  00        BRK
  $9661  00        BRK
  $9662  F8        SED
  $9663  04        .db $04
  $9664  FA        .db $FA
  $9665  FE FF FD  INC $FDFF,X
  $9668  00        BRK
  $9669  00        BRK

L_966A:
  $966A  00        BRK
  $966B  F8        SED

L_966C:
  $966C  04        .db $04
  $966D  C0 E6     CPY #$E6
  $966F  E6 00     INC $00
  $9671  00        BRK
  $9672  1F        .db $1F
  $9673  3F        .db $3F
  $9674  7F        .db $7F
  $9675  7C        .db $7C
  $9676  F8        SED
  $9677  B8        CLV
  $9678  00        BRK
  $9679  00        BRK
  $967A  00        BRK
  $967B  1F        .db $1F
  $967C  20 03 67  JSR $6703
  $967F  67        .db $67
  $9680  3C        .db $3C
  $9681  7E FF E7  ROR $E7FF,X
  $9684  E7        .db $E7
  $9685  FF        .db $FF
  $9686  7E 3C 00  ROR $003C,X
  $9689  3C        .db $3C
  $968A  00        BRK
  $968B  5A        .db $5A
  $968C  5A        .db $5A
  $968D  00        BRK
  $968E  3C        .db $3C
  $968F  00        BRK
  $9690  00        BRK
  $9691  3C        .db $3C
  $9692  7E CF DF  ROR $DFCF,X
  $9695  7E 3C 00  ROR $003C,X
  $9698  00        BRK
  $9699  00        BRK
  $969A  3C        .db $3C
  $969B  7E 7E 3C  ROR $3C7E,X
  $969E  00        BRK
  $969F  00        BRK
  $96A0  3C        .db $3C
  $96A1  7E E7 C3  ROR $C3E7,X
  $96A4  C3        .db $C3
  $96A5  E7        .db $E7
  $96A6  7E 3C 00  ROR $003C,X
  $96A9  3C        .db $3C
  $96AA  7E 7E 7E  ROR $7E7E,X
  $96AD  7E 3C 00  ROR $003C,X
  $96B0  00        BRK
  $96B1  00        BRK
  $96B2  0F        .db $0F
  $96B3  10 20     BPL $96D5
  $96B5  60        RTS
  $96B6  E0 A0     CPX #$A0
  $96B8  00        BRK
  $96B9  00        BRK
  $96BA  00        BRK
  $96BB  0F        .db $0F
  $96BC  1F        .db $1F
  $96BD  1F        .db $1F
  $96BE  5F        .db $5F
  $96BF  5F        .db $5F
  $96C0  E0 20     CPX #$20
  $96C2  10 08     BPL $96CC
  $96C4  E0 10     CPX #$10
  $96C6  10 70     BPL $9738
  $96C8  00        BRK
  $96C9  C0 E0     CPY #$E0
  $96CB  F0 18     BEQ $96E5
  $96CD  0F        .db $0F
  $96CE  0F        .db $0F
  $96CF  0F        .db $0F
  $96D0  00        BRK
  $96D1  03        .db $03
  $96D2  0C        .db $0C
  $96D3  17        .db $17
  $96D4  2F        .db $2F

L_96D5:
  $96D5  3F        .db $3F
  $96D6  30 20     BMI $96F8
  $96D8  00        BRK
  $96D9  00        BRK
  $96DA  03        .db $03
  $96DB  0F        .db $0F
  $96DC  1F        .db $1F
  $96DD  1F        .db $1F
  $96DE  10 00     BPL $96E0

L_96E0:
  $96E0  1C        .db $1C
  $96E1  FE 1E EF  INC $EF1E,X
  $96E4  FF        .db $FF

L_96E5:
  $96E5  FF        .db $FF
  $96E6  DD 0D 00  CMP $000D,X
  $96E9  1C        .db $1C
  $96EA  EC F6 FA  CPX $FAF6
  $96ED  FA        .db $FA
  $96EE  FA        .db $FA
  $96EF  7A        .db $7A
  $96F0  1F        .db $1F
  $96F1  1F        .db $1F
  $96F2  17        .db $17
  $96F3  11 31     ORA ($31),Y
  $96F5  39 3E 3F  AND $3F3E,Y

L_96F8:
  $96F8  0F        .db $0F
  $96F9  0F        .db $0F
  $96FA  0F        .db $0F
  $96FB  0E 1E 1E  ASL $1E1E
  $96FE  1C        .db $1C
  $96FF  1E 20 20  ASL $2020,X
  $9702  30 48     BMI $974C
  $9704  87        .db $87
  $9705  00        BRK
  $9706  9C        .db $9C
  $9707  E2        .db $E2
  $9708  00        BRK
  $9709  00        BRK
  $970A  00        BRK
  $970B  30 78     BMI $9785
  $970D  FF        .db $FF
  $970E  E3        .db $E3
  $970F  C1 E3     CMP ($E3,X)
  $9711  C2        .db $C2
  $9712  C4 CE     CPY $CE
  $9714  8F        .db $8F
  $9715  1F        .db $1F
  $9716  3F        .db $3F
  $9717  3F        .db $3F
  $9718  C1 81     CMP ($81,X)
  $971A  83        .db $83
  $971B  87        .db $87
  $971C  07        .db $07
  $971D  03        .db $03
  $971E  1F        .db $1F
  $971F  00        BRK
  $9720  00        BRK
  $9721  00        BRK
  $9722  00        BRK
  $9723  00        BRK
  $9724  00        BRK
  $9725  01 03     ORA ($03,X)
  $9727  03        .db $03
  $9728  00        BRK
  $9729  00        BRK
  $972A  00        BRK
  $972B  00        BRK
  $972C  00        BRK
  $972D  00        BRK
  $972E  01 01     ORA ($01,X)
  $9730  07        .db $07
  $9731  07        .db $07
  $9732  0F        .db $0F
  $9733  0F        .db $0F
  $9734  0E 04 00  ASL $0004
  $9737  00        BRK

L_9738:
  $9738  03        .db $03
  $9739  03        .db $03
  $973A  07        .db $07
  $973B  06 04     ASL $04
  $973D  00        BRK
  $973E  00        BRK
  $973F  00        BRK
  $9740  00        BRK
  $9741  00        BRK
  $9742  00        BRK
  $9743  00        BRK
  $9744  00        BRK
  $9745  00        BRK
  $9746  00        BRK
  $9747  00        BRK
  $9748  00        BRK
  $9749  00        BRK
  $974A  50 14     BVC $9760

L_974C:
  $974C  54        .db $54
  $974D  6C 3C 38  JMP ($383C)
  $9750  00        BRK
  $9751  00        BRK
  $9752  00        BRK
  $9753  00        BRK
  $9754  00        BRK
  $9755  00        BRK
  $9756  00        BRK
  $9757  00        BRK
  $9758  00        BRK
  $9759  50 14     BVC $976F
  $975B  50 2C     BVC $9789
  $975D  10 00     BPL $975F

L_975F:
  $975F  00        BRK

L_9760:
  $9760  00        BRK
  $9761  00        BRK
  $9762  00        BRK
  $9763  00        BRK
  $9764  00        BRK
  $9765  00        BRK
  $9766  00        BRK
  $9767  00        BRK
  $9768  50 04     BVC $976E
  $976A  00        BRK
  $976B  20 00 00  JSR $0000

L_976E:
  $976E  00        BRK

L_976F:
  $976F  00        BRK
  $9770  00        BRK
  $9771  00        BRK
  $9772  00        BRK
  $9773  00        BRK
  $9774  00        BRK
  $9775  00        BRK
  $9776  00        BRK
  $9777  00        BRK
  $9778  00        BRK
  $9779  00        BRK
  $977A  11 19     ORA ($19),Y
  $977C  1D 1F FF  ORA $FF1F,X
  $977F  7F        .db $7F
  $9780  00        BRK
  $9781  00        BRK
  $9782  00        BRK
  $9783  00        BRK
  $9784  00        BRK

L_9785:
  $9785  00        BRK
  $9786  00        BRK
  $9787  00        BRK
  $9788  3F        .db $3F

L_9789:
  $9789  1F        .db $1F
  $978A  3F        .db $3F
  $978B  1F        .db $1F
  $978C  3F        .db $3F
  $978D  FF        .db $FF
  $978E  3F        .db $3F
  $978F  1F        .db $1F
  $9790  00        BRK
  $9791  00        BRK
  $9792  00        BRK
  $9793  00        BRK
  $9794  00        BRK
  $9795  00        BRK
  $9796  00        BRK
  $9797  00        BRK
  $9798  07        .db $07
  $9799  0F        .db $0F
  $979A  0F        .db $0F
  $979B  1F        .db $1F
  $979C  3B        .db $3B
  $979D  61 01     ADC ($01,X)
  $979F  00        BRK
  $97A0  00        BRK
  $97A1  00        BRK
  $97A2  00        BRK
  $97A3  00        BRK
  $97A4  00        BRK
  $97A5  00        BRK
  $97A6  00        BRK
  $97A7  00        BRK
  $97A8  81 C1     STA ($C1,X)
  $97AA  E3        .db $E3
  $97AB  F7        .db $F7
  $97AC  FF        .db $FF
  $97AD  FF        .db $FF
  $97AE  FF        .db $FF
  $97AF  FF        .db $FF
  $97B0  00        BRK
  $97B1  00        BRK
  $97B2  00        BRK
  $97B3  00        BRK
  $97B4  00        BRK
  $97B5  00        BRK
  $97B6  00        BRK
  $97B7  00        BRK
  $97B8  FF        .db $FF
  $97B9  FF        .db $FF
  $97BA  FF        .db $FF
  $97BB  FF        .db $FF
  $97BC  FF        .db $FF
  $97BD  FF        .db $FF
  $97BE  FF        .db $FF
  $97BF  FF        .db $FF
  $97C0  08        PHP
  $97C1  E4 E4     CPX $E4
  $97C3  8C F8 30  STY $30F8
  $97C6  00        BRK
  $97C7  00        BRK
  $97C8  78        SEI
  $97C9  9C        .db $9C
  $97CA  9C        .db $9C
  $97CB  FC        .db $FC
  $97CC  08        PHP
  $97CD  30 00     BMI $97CF

L_97CF:
  $97CF  00        BRK
  $97D0  20 E0 00  JSR $00E0
  $97D3  01 00     ORA ($00,X)
  $97D5  E0 10     CPX #$10
  $97D7  10 00     BPL $97D9

L_97D9:
  $97D9  00        BRK
  $97DA  E0 F9     CPX #$F9
  $97DC  FF        .db $FF
  $97DD  1F        .db $1F
  $97DE  0F        .db $0F
  $97DF  0F        .db $0F
  $97E0  0D 5D FA  ORA $FA5D
  $97E3  F2        .db $F2
  $97E4  04        .db $04
  $97E5  08        PHP
  $97E6  0C        .db $0C
  $97E7  32        .db $32
  $97E8  7A        .db $7A
  $97E9  7A        .db $7A
  $97EA  F4        .db $F4
  $97EB  EC F8 F0  CPX $F0F8
  $97EE  F0 FC     BEQ $97EC
  $97F0  60        RTS
  $97F1  F0 7F     BEQ $9872
  $97F3  7E 7E 7E  ROR $7E7E,X
  $97F6  3F        .db $3F
  $97F7  00        BRK
  $97F8  00        BRK
  $97F9  60        RTS
  $97FA  30 3F     BMI $983B
  $97FC  3F        .db $3F
  $97FD  3F        .db $3F
  $97FE  00        BRK
  $97FF  00        BRK
  $9800  00        BRK
  $9801  00        BRK
  $9802  00        BRK
  $9803  00        BRK
  $9804  00        BRK
  $9805  00        BRK
  $9806  00        BRK
  $9807  00        BRK
  $9808  00        BRK
  $9809  03        .db $03
  $980A  0F        .db $0F
  $980B  1E 38 30  ASL $3038,X
  $980E  70 60     BVS $9870
  $9810  00        BRK
  $9811  00        BRK
  $9812  00        BRK
  $9813  00        BRK
  $9814  00        BRK
  $9815  00        BRK
  $9816  00        BRK
  $9817  00        BRK
  $9818  FF        .db $FF
  $9819  FF        .db $FF
  $981A  81 00     STA ($00,X)
  $981C  00        BRK
  $981D  00        BRK
  $981E  00        BRK
  $981F  00        BRK
  $9820  00        BRK
  $9821  00        BRK
  $9822  00        BRK
  $9823  00        BRK
  $9824  00        BRK
  $9825  00        BRK
  $9826  00        BRK
  $9827  00        BRK
  $9828  E0 C0     CPX #$C0
  $982A  C0 C0     CPY #$C0
  $982C  C0 C0     CPY #$C0
  $982E  C0 E0     CPY #$E0
  $9830  00        BRK
  $9831  00        BRK
  $9832  00        BRK
  $9833  00        BRK
  $9834  00        BRK
  $9835  00        BRK
  $9836  00        BRK
  $9837  00        BRK
  $9838  07        .db $07
  $9839  1F        .db $1F
  $983A  3F        .db $3F

L_983B:
  $983B  7F        .db $7F
  $983C  7F        .db $7F
  $983D  FF        .db $FF
  $983E  FF        .db $FF
  $983F  FF        .db $FF
  $9840  00        BRK
  $9841  00        BRK
  $9842  03        .db $03
  $9843  0F        .db $0F

L_9844:
  $9844  1C        .db $1C
  $9845  18        CLC
  $9846  30 30     BMI $9878
  $9848  00        BRK
  $9849  00        BRK
  $984A  03        .db $03
  $984B  0F        .db $0F
  $984C  1F        .db $1F
  $984D  1F        .db $1F
  $984E  3F        .db $3F
  $984F  3F        .db $3F
  $9850  00        BRK
  $9851  00        BRK
  $9852  00        BRK
  $9853  03        .db $03
  $9854  0F        .db $0F
  $9855  0F        .db $0F
  $9856  1E 1C 00  ASL $001C,X
  $9859  00        BRK
  $985A  00        BRK
  $985B  03        .db $03
  $985C  0F        .db $0F
  $985D  0F        .db $0F
  $985E  1F        .db $1F
  $985F  1F        .db $1F
  $9860  00        BRK
  $9861  00        BRK
  $9862  18        CLC
  $9863  3C        .db $3C
  $9864  3C        .db $3C
  $9865  18        CLC
  $9866  00        BRK
  $9867  00        BRK
  $9868  00        BRK
  $9869  00        BRK
  $986A  18        CLC
  $986B  3C        .db $3C
  $986C  3C        .db $3C
  $986D  18        CLC
  $986E  00        BRK
  $986F  00        BRK

L_9870:
  $9870  E7        .db $E7
  $9871  FF        .db $FF

L_9872:
  $9872  E7        .db $E7
  $9873  FF        .db $FF
  $9874  E7        .db $E7
  $9875  FF        .db $FF
  $9876  E7        .db $E7
  $9877  FF        .db $FF

L_9878:
  $9878  7E 00 7E  ROR $7E00,X
  $987B  00        BRK
  $987C  7E 00 7E  ROR $7E00,X
  $987F  00        BRK
  $9880  FF        .db $FF
  $9881  FF        .db $FF
  $9882  E7        .db $E7
  $9883  FF        .db $FF
  $9884  E7        .db $E7
  $9885  FF        .db $FF
  $9886  E7        .db $E7
  $9887  FF        .db $FF
  $9888  00        BRK
  $9889  00        BRK
  $988A  7E 00 7E  ROR $7E00,X
  $988D  00        BRK
  $988E  7E 00 FF  ROR $FF00,X
  $9891  FF        .db $FF
  $9892  FF        .db $FF
  $9893  FF        .db $FF
  $9894  E7        .db $E7
  $9895  FF        .db $FF
  $9896  E7        .db $E7
  $9897  FF        .db $FF
  $9898  00        BRK
  $9899  00        BRK
  $989A  00        BRK
  $989B  00        BRK
  $989C  7E 00 7E  ROR $7E00,X
  $989F  00        BRK
  $98A0  FF        .db $FF
  $98A1  FF        .db $FF
  $98A2  FF        .db $FF
  $98A3  FF        .db $FF
  $98A4  FF        .db $FF
  $98A5  FF        .db $FF
  $98A6  E7        .db $E7
  $98A7  FF        .db $FF
  $98A8  00        BRK
  $98A9  00        BRK
  $98AA  00        BRK
  $98AB  00        BRK
  $98AC  00        BRK
  $98AD  00        BRK
  $98AE  7E 00 FF  ROR $FF00,X
  $98B1  FF        .db $FF
  $98B2  FF        .db $FF
  $98B3  FF        .db $FF
  $98B4  FF        .db $FF
  $98B5  FF        .db $FF
  $98B6  FF        .db $FF
  $98B7  FF        .db $FF
  $98B8  00        BRK
  $98B9  00        BRK
  $98BA  00        BRK
  $98BB  00        BRK
  $98BC  00        BRK
  $98BD  00        BRK
  $98BE  00        BRK
  $98BF  00        BRK
  $98C0  00        BRK
  $98C1  00        BRK
  $98C2  00        BRK
  $98C3  00        BRK
  $98C4  00        BRK
  $98C5  00        BRK
  $98C6  00        BRK
  $98C7  00        BRK
  $98C8  00        BRK
  $98C9  00        BRK
  $98CA  0C        .db $0C
  $98CB  12        .db $12
  $98CC  12        .db $12
  $98CD  0C        .db $0C
  $98CE  00        BRK
  $98CF  00        BRK
  $98D0  00        BRK
  $98D1  03        .db $03
  $98D2  0E 1E 3E  ASL $3E1E
  $98D5  7F        .db $7F
  $98D6  7E 7E 00  ROR $007E,X
  $98D9  00        BRK
  $98DA  01 0F     ORA ($0F,X)
  $98DC  1F        .db $1F
  $98DD  3E 3F 3F  ROL $3F3F,X
  $98E0  B3        .db $B3
  $98E1  A1 A6     LDA ($A6,X)
  $98E3  B6 7F     LDX $7F,Y
  $98E5  3F        .db $3F
  $98E6  1F        .db $1F
  $98E7  0F        .db $0F
  $98E8  4C 5E 59  JMP $595E
  $98EB  59 1F 18  EOR $181F,Y
  $98EE  0C        .db $0C
  $98EF  03        .db $03
  $98F0  00        BRK
  $98F1  00        BRK
  $98F2  00        BRK
  $98F3  00        BRK
  $98F4  00        BRK
  $98F5  00        BRK
  $98F6  00        BRK
  $98F7  00        BRK
  $98F8  00        BRK
  $98F9  00        BRK
  $98FA  00        BRK
  $98FB  00        BRK
  $98FC  00        BRK
  $98FD  00        BRK
  $98FE  00        BRK
  $98FF  00        BRK
  $9900  FF        .db $FF
  $9901  FF        .db $FF
  $9902  FF        .db $FF
  $9903  AA        TAX
  $9904  AA        TAX
  $9905  FF        .db $FF
  $9906  FF        .db $FF
  $9907  FF        .db $FF
  $9908  00        BRK
  $9909  55 55     EOR $55,X
  $990B  55 55     EOR $55,X
  $990D  55 55     EOR $55,X
  $990F  00        BRK
  $9910  FF        .db $FF
  $9911  FF        .db $FF
  $9912  FF        .db $FF
  $9913  AB        .db $AB
  $9914  AB        .db $AB
  $9915  FF        .db $FF
  $9916  FF        .db $FF
  $9917  FF        .db $FF
  $9918  00        BRK
  $9919  54        .db $54
  $991A  54        .db $54
  $991B  54        .db $54
  $991C  54        .db $54
  $991D  54        .db $54
  $991E  54        .db $54
  $991F  00        BRK
  $9920  FF        .db $FF
  $9921  FF        .db $FF
  $9922  FF        .db $FF
  $9923  AF        .db $AF
  $9924  AF        .db $AF
  $9925  FF        .db $FF
  $9926  FF        .db $FF
  $9927  FF        .db $FF
  $9928  00        BRK
  $9929  50 50     BVC $997B
  $992B  50 50     BVC $997D
  $992D  50 50     BVC $997F
  $992F  00        BRK
  $9930  FF        .db $FF
  $9931  FF        .db $FF
  $9932  FF        .db $FF
  $9933  BF        .db $BF
  $9934  BF        .db $BF
  $9935  FF        .db $FF
  $9936  FF        .db $FF
  $9937  FF        .db $FF
  $9938  00        BRK
  $9939  40        RTI
  $993A  40        RTI
  $993B  40        RTI
  $993C  40        RTI
  $993D  40        RTI
  $993E  40        RTI
  $993F  00        BRK
  $9940  FF        .db $FF
  $9941  FF        .db $FF
  $9942  FF        .db $FF
  $9943  FF        .db $FF
  $9944  FF        .db $FF
  $9945  FF        .db $FF
  $9946  FF        .db $FF
  $9947  FF        .db $FF
  $9948  00        BRK
  $9949  00        BRK
  $994A  00        BRK
  $994B  00        BRK
  $994C  00        BRK
  $994D  00        BRK
  $994E  00        BRK
  $994F  00        BRK
  $9950  21 01     AND ($01,X)
  $9952  01 21     ORA ($21,X)
  $9954  31 29     AND ($29),Y
  $9956  21 E7     AND ($E7,X)
  $9958  C6 E6     DEC $E6
  $995A  F6 DE     INC $DE,X
  $995C  CE C6 C6  DEC $C6C6
  $995F  00        BRK
  $9960  00        BRK
  $9961  3E 20 00  ROL $0020,X
  $9964  3C        .db $3C
  $9965  20 00 FE  JSR $FE00
  $9968  FE C0 C0  INC $C0C0,X
  $996B  FC        .db $FC
  $996C  C0 C0     CPY #$C0
  $996E  FE 00 22  INC $2200,X
  $9971  23        .db $23
  $9972  84 48     STY $48
  $9974  00        BRK
  $9975  32        .db $32
  $9976  22        .db $22
  $9977  CE CD CC  DEC $CCCD
  $997A  78        SEI

L_997B:
  $997B  30 78     BMI $99F5

L_997D:
  $997D  CC CC 00  CPY $00CC
  $9980  00        BRK
  $9981  98        TYA
  $9982  10 10     BPL $9994
  $9984  10 10     BPL $9996
  $9986  10 70     BPL $99F8
  $9988  F8        SED
  $9989  60        RTS
  $998A  60        RTS
  $998B  60        RTS
  $998C  60        RTS
  $998D  60        RTS
  $998E  60        RTS
  $998F  00        BRK
  $9990  21 21     AND ($21,X)
  $9992  21 21     AND ($21,X)

L_9994:
  $9994  01 11     ORA ($11,X)

L_9996:
  $9996  21 C7     AND ($C7,X)
  $9998  C6 C6     DEC $C6
  $999A  C6 D6     DEC $D6
  $999C  FE EE C6  INC $C6EE,X
  $999F  00        BRK
  $99A0  00        BRK
  $99A1  3E 20 00  ROL $0020,X
  $99A4  3C        .db $3C
  $99A5  20 20 E0  JSR $E020
  $99A8  FE C0 C0  INC $C0C0,X
  $99AB  FC        .db $FC
  $99AC  C0 C0     CPY #$C0
  $99AE  C0 00     CPY #$00
  $99B0  02        .db $02
  $99B1  39 21 21  AND $2121,Y
  $99B4  01 39     ORA ($39,X)
  $99B6  21 E7     AND ($E7,X)
  $99B8  7C        .db $7C
  $99B9  C6 C6     DEC $C6
  $99BB  C6 FE     DEC $FE
  $99BD  C6 C6     DEC $C6
  $99BF  00        BRK
  $99C0  02        .db $02
  $99C1  39 21 21  AND $2121,Y
  $99C4  21 31     AND ($31,X)
  $99C6  82        .db $82
  $99C7  7C        .db $7C
  $99C8  7C        .db $7C
  $99C9  C6 C6     DEC $C6
  $99CB  C6 DE     DEC $DE
  $99CD  CE 7C 00  DEC $007C
  $99D0  02        .db $02
  $99D1  39 21 02  AND $0221,Y
  $99D4  39 21 02  AND $0221,Y
  $99D7  FC        .db $FC
  $99D8  FC        .db $FC
  $99D9  C6 C6     DEC $C6
  $99DB  FC        .db $FC
  $99DC  C6 C6     DEC $C6
  $99DE  FC        .db $FC
  $99DF  00        BRK
  $99E0  01 01     ORA ($01,X)
  $99E2  01 29     ORA ($29,X)
  $99E4  31 21     AND ($21),Y
  $99E6  21 E7     AND ($E7,X)
  $99E8  C6 EE     DEC $EE
  $99EA  FE D6 C6  INC $C6D6,X
  $99ED  C6 C6     DEC $C6
  $99EF  00        BRK
  $99F0  21 21     AND ($21,X)
  $99F2  21 01     AND ($01,X)
  $99F4  39 21 21  AND $2121,Y
  $99F7  E7        .db $E7

L_99F8:
  $99F8  C6 C6     DEC $C6
  $99FA  C6 FE     DEC $FE
  $99FC  C6 C6     DEC $C6
  $99FE  C6 00     DEC $00
  $9A00  00        BRK
  $9A01  38        SEC
  $9A02  26 20     ROL $20
  $9A04  20 20 82  JSR $8220
  $9A07  7C        .db $7C
  $9A08  7C        .db $7C
  $9A09  C6 C0     DEC $C0
  $9A0B  C0 C0     CPY #$C0
  $9A0D  C6 7C     DEC $7C

L_9A0F:
  $9A0F  00        BRK
  $9A10  00        BRK
  $9A11  00        BRK
  $9A12  00        BRK
  $9A13  00        BRK
  $9A14  01 F2     ORA ($F2,X)
  $9A16  04        .db $04
  $9A17  08        PHP
  $9A18  08        PHP
  $9A19  0C        .db $0C
  $9A1A  FE FF FE  INC $FEFF,X
  $9A1D  0C        .db $0C
  $9A1E  08        PHP
  $9A1F  00        BRK
  $9A20  00        BRK
  $9A21  00        BRK
  $9A22  00        BRK
  $9A23  00        BRK

L_9A24:
  $9A24  00        BRK
  $9A25  00        BRK
  $9A26  00        BRK
  $9A27  00        BRK
  $9A28  C0 E0     CPY #$E0
  $9A2A  F0 F8     BEQ $9A24
  $9A2C  F8        SED
  $9A2D  F0 E0     BEQ $9A0F
  $9A2F  C0 3C     CPY #$3C
  $9A31  7E E7 CF  ROR $CFE7,X
  $9A34  DF        .db $DF
  $9A35  FF        .db $FF
  $9A36  7E 3C 00  ROR $003C,X
  $9A39  3C        .db $3C
  $9A3A  7E 7E 7E  ROR $7E7E,X
  $9A3D  7E 3C 00  ROR $003C,X
  $9A40  02        .db $02
  $9A41  39 21 21  AND $2121,Y
  $9A44  21 21     AND ($21,X)
  $9A46  83        .db $83
  $9A47  7E 7C C6  ROR $C67C,X
  $9A4A  C6 C6     DEC $C6
  $9A4C  C6 C6     DEC $C6
  $9A4E  7C        .db $7C
  $9A4F  00        BRK
  $9A50  04        .db $04
  $9A51  04        .db $04
  $9A52  44        .db $44
  $9A53  04        .db $04
  $9A54  04        .db $04
  $9A55  04        .db $04
  $9A56  04        .db $04
  $9A57  3C        .db $3C
  $9A58  38        SEC
  $9A59  78        SEI
  $9A5A  38        SEC
  $9A5B  38        SEC
  $9A5C  38        SEC
  $9A5D  38        SEC
  $9A5E  38        SEC
  $9A5F  00        BRK
  $9A60  00        BRK
  $9A61  39 C1 03  AND $03C1,Y
  $9A64  1E 20 01  ASL $0120,X
  $9A67  FF        .db $FF
  $9A68  7C        .db $7C
  $9A69  C6 06     DEC $06
  $9A6B  3C        .db $3C
  $9A6C  60        RTS
  $9A6D  C0 FE     CPY #$FE
  $9A6F  00        BRK
  $9A70  02        .db $02
  $9A71  39 C1 02  AND $02C1,Y
  $9A74  39 01 83  AND $8301,Y
  $9A77  7E 7C C6  ROR $C67C,X
  $9A7A  06 3C     ASL $3C
  $9A7C  06 C6     ASL $C6
  $9A7E  7C        .db $7C
  $9A7F  00        BRK
  $9A80  22        .db $22
  $9A81  22        .db $22
  $9A82  22        .db $22
  $9A83  22        .db $22
  $9A84  01 F3     ORA ($F3,X)
  $9A86  02        .db $02
  $9A87  0E CC CC  ASL $CCCC
  $9A8A  CC CC FE  CPY $FECC
  $9A8D  0C        .db $0C
  $9A8E  0C        .db $0C
  $9A8F  00        BRK
  $9A90  01 3F     ORA ($3F,X)
  $9A92  02        .db $02
  $9A93  F9 01 21  SBC $2101,Y
  $9A96  83        .db $83
  $9A97  7E FE C0  ROR $C0FE,X
  $9A9A  FC        .db $FC
  $9A9B  06 06     ASL $06
  $9A9D  C6 7C     DEC $7C
  $9A9F  00        BRK
  $9AA0  02        .db $02
  $9AA1  39 20 02  AND $0220,Y
  $9AA4  39 21 83  AND $8321,Y
  $9AA7  7E 7C C6  ROR $C67C,X
  $9AAA  C0 FC     CPY #$FC
  $9AAC  C6 C6     DEC $C6
  $9AAE  7C        .db $7C
  $9AAF  00        BRK
  $9AB0  01 F9     ORA ($F9,X)
  $9AB2  02        .db $02
  $9AB3  04        .db $04
  $9AB4  04        .db $04
  $9AB5  04        .db $04
  $9AB6  04        .db $04
  $9AB7  3C        .db $3C
  $9AB8  FE 06 0C  INC $0C06,X
  $9ABB  18        CLC
  $9ABC  38        SEC
  $9ABD  38        SEC
  $9ABE  38        SEC
  $9ABF  00        BRK
  $9AC0  02        .db $02
  $9AC1  39 21 82  AND $8221,Y
  $9AC4  39 21 83  AND $8321,Y
  $9AC7  7E 7C C6  ROR $C67C,X
  $9ACA  C6 7C     DEC $7C
  $9ACC  C6 C6     DEC $C6
  $9ACE  7C        .db $7C
  $9ACF  00        BRK
  $9AD0  02        .db $02
  $9AD1  39 21 81  AND $8121,Y
  $9AD4  79 21 83  ADC $8321,Y
  $9AD7  7E 7C C6  ROR $C67C,X
  $9ADA  C6 7E     DEC $7E
  $9ADC  06 C6     ASL $C6
  $9ADE  7C        .db $7C
  $9ADF  00        BRK
  $9AE0  00        BRK
  $9AE1  04        .db $04
  $9AE2  04        .db $04
  $9AE3  1C        .db $1C
  $9AE4  00        BRK
  $9AE5  04        .db $04
  $9AE6  04        .db $04
  $9AE7  1C        .db $1C
  $9AE8  00        BRK
  $9AE9  18        CLC
  $9AEA  18        CLC
  $9AEB  00        BRK
  $9AEC  00        BRK
  $9AED  18        CLC
  $9AEE  18        CLC
  $9AEF  00        BRK
  $9AF0  02        .db $02
  $9AF1  39 21 21  AND $2121,Y
  $9AF4  02        .db $02
  $9AF5  3C        .db $3C
  $9AF6  20 E0 FC  JSR $FCE0
  $9AF9  C6 C6     DEC $C6
  $9AFB  C6 FC     DEC $FC
  $9AFD  C0 C0     CPY #$C0
  $9AFF  00        BRK
  $9B00  FF        .db $FF
  $9B01  C3        .db $C3
  $9B02  7F        .db $7F
  $9B03  3F        .db $3F
  $9B04  1F        .db $1F
  $9B05  07        .db $07
  $9B06  01 00     ORA ($00,X)
  $9B08  00        BRK
  $9B09  3C        .db $3C
  $9B0A  00        BRK
  $9B0B  00        BRK
  $9B0C  00        BRK
  $9B0D  00        BRK
  $9B0E  00        BRK
  $9B0F  00        BRK
  $9B10  FF        .db $FF
  $9B11  E1 2F     SBC ($2F,X)
  $9B13  33        .db $33
  $9B14  FD E1 FF  SBC $FFE1,X
  $9B17  3F        .db $3F
  $9B18  00        BRK
  $9B19  FF        .db $FF
  $9B1A  F1 ED     SBC ($ED),Y
  $9B1C  E3        .db $E3
  $9B1D  FF        .db $FF
  $9B1E  3F        .db $3F
  $9B1F  00        BRK
  $9B20  FE FF C6  INC $C6FF,X
  $9B23  BE FE FF  LDX $FFFE,Y
  $9B26  FC        .db $FC
  $9B27  F8        SED
  $9B28  00        BRK
  $9B29  80        .db $80
  $9B2A  3D 7D 3D  AND $3D7D,X
  $9B2D  80        .db $80
  $9B2E  F8        SED
  $9B2F  00        BRK
  $9B30  00        BRK
  $9B31  B8        CLV
  $9B32  CC 83 CE  CPY $CE83
  $9B35  B8        CLV
  $9B36  00        BRK
  $9B37  00        BRK
  $9B38  00        BRK
  $9B39  38        SEC
  $9B3A  7C        .db $7C
  $9B3B  7F        .db $7F

L_9B3C:
  $9B3C  7E 38 00  ROR $0038,X
  $9B3F  00        BRK
  $9B40  00        BRK
  $9B41  80        .db $80
  $9B42  B0 F8     BCS $9B3C
  $9B44  B0 80     BCS $9AC6
  $9B46  00        BRK
  $9B47  00        BRK
  $9B48  00        BRK
  $9B49  00        BRK
  $9B4A  30 78     BMI $9BC4
  $9B4C  30 00     BMI $9B4E

L_9B4E:
  $9B4E  00        BRK
  $9B4F  00        BRK
  $9B50  7F        .db $7F
  $9B51  7A        .db $7A
  $9B52  7A        .db $7A
  $9B53  7A        .db $7A
  $9B54  7A        .db $7A
  $9B55  3F        .db $3F
  $9B56  1F        .db $1F
  $9B57  0F        .db $0F
  $9B58  00        BRK
  $9B59  3F        .db $3F
  $9B5A  3F        .db $3F
  $9B5B  3F        .db $3F
  $9B5C  3F        .db $3F
  $9B5D  00        BRK
  $9B5E  07        .db $07
  $9B5F  00        BRK
  $9B60  FF        .db $FF
  $9B61  77        .db $77
  $9B62  73        .db $73
  $9B63  77        .db $77
  $9B64  77        .db $77
  $9B65  FF        .db $FF
  $9B66  81 FF     STA ($FF,X)
  $9B68  00        BRK
  $9B69  88        DEY
  $9B6A  8C 88 88  STY $8888
  $9B6D  00        BRK
  $9B6E  FF        .db $FF
  $9B6F  00        BRK
  $9B70  0F        .db $0F
  $9B71  0F        .db $0F
  $9B72  0B        .db $0B
  $9B73  FF        .db $FF
  $9B74  06 00     ASL $00
  $9B76  00        BRK
  $9B77  00        BRK
  $9B78  00        BRK
  $9B79  06 F6     ASL $F6
  $9B7B  06 00     ASL $00
  $9B7D  00        BRK
  $9B7E  00        BRK
  $9B7F  00        BRK
  $9B80  37        .db $37
  $9B81  4F        .db $4F
  $9B82  77        .db $77
  $9B83  37        .db $37
  $9B84  57        .db $57
  $9B85  76 37     ROR $37,X
  $9B87  5F        .db $5F
  $9B88  00        BRK
  $9B89  31 18     AND ($18),Y
  $9B8B  1B        .db $1B
  $9B8C  3B        .db $3B
  $9B8D  1B        .db $1B
  $9B8E  1A        .db $1A
  $9B8F  33        .db $33
  $9B90  FF        .db $FF
  $9B91  C3        .db $C3
  $9B92  FF        .db $FF
  $9B93  E3        .db $E3
  $9B94  EF        .db $EF
  $9B95  F7        .db $F7
  $9B96  EF        .db $EF
  $9B97  E3        .db $E3
  $9B98  00        BRK
  $9B99  FF        .db $FF
  $9B9A  00        BRK
  $9B9B  9D 91 08  STA $0891,X
  $9B9E  10 9D     BPL $9B3D
  $9BA0  37        .db $37
  $9BA1  03        .db $03
  $9BA2  01 00     ORA ($00,X)
  $9BA4  00        BRK
  $9BA5  00        BRK
  $9BA6  00        BRK
  $9BA7  00        BRK
  $9BA8  03        .db $03
  $9BA9  01 00     ORA ($00,X)
  $9BAB  00        BRK
  $9BAC  00        BRK
  $9BAD  00        BRK
  $9BAE  00        BRK
  $9BAF  00        BRK
  $9BB0  FF        .db $FF
  $9BB1  FF        .db $FF
  $9BB2  FF        .db $FF
  $9BB3  7C        .db $7C
  $9BB4  00        BRK
  $9BB5  00        BRK

L_9BB6:
  $9BB6  00        BRK
  $9BB7  00        BRK
  $9BB8  C3        .db $C3
  $9BB9  FF        .db $FF
  $9BBA  7C        .db $7C
  $9BBB  00        BRK
  $9BBC  00        BRK
  $9BBD  00        BRK
  $9BBE  00        BRK
  $9BBF  00        BRK
  $9BC0  07        .db $07
  $9BC1  07        .db $07
  $9BC2  37        .db $37
  $9BC3  4F        .db $4F

L_9BC4:
  $9BC4  77        .db $77
  $9BC5  36 57     ROL $57,X
  $9BC7  77        .db $77
  $9BC8  00        BRK
  $9BC9  01 00     ORA ($00,X)
  $9BCB  33        .db $33
  $9BCC  1B        .db $1B
  $9BCD  1B        .db $1B
  $9BCE  3A        .db $3A
  $9BCF  1B        .db $1B
  $9BD0  37        .db $37
  $9BD1  5B        .db $5B
  $9BD2  31 00     AND ($00),Y
  $9BD4  00        BRK
  $9BD5  00        BRK
  $9BD6  00        BRK
  $9BD7  00        BRK
  $9BD8  1B        .db $1B
  $9BD9  31 00     AND ($00),Y
  $9BDB  00        BRK
  $9BDC  00        BRK
  $9BDD  00        BRK
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
  $9BE9  0E 1E 38  ASL $381E
  $9BEC  70 60     BVS $9C4E
  $9BEE  60        RTS
  $9BEF  00        BRK
  $9BF0  3C        .db $3C
  $9BF1  4E 8F 9F  LSR $9F8F
  $9BF4  FF        .db $FF
  $9BF5  FF        .db $FF
  $9BF6  7E 3C 3C  ROR $3C3C,X
  $9BF9  7E FF FF  ROR $FFFF,X
  $9BFC  FF        .db $FF
  $9BFD  FF        .db $FF
  $9BFE  7E 3C 00  ROR $003C,X
  $9C01  00        BRK
  $9C02  01 00     ORA ($00,X)
  $9C04  00        BRK
  $9C05  00        BRK
  $9C06  01 03     ORA ($03,X)
  $9C08  01 06     ORA ($06,X)
  $9C0A  0F        .db $0F
  $9C0B  04        .db $04
  $9C0C  1E 0C 1D  ASL $1D0C,X
  $9C0F  03        .db $03
  $9C10  7E FE FC  ROR $FCFE,X
  $9C13  E0 84     CPX #$84
  $9C15  CC C7 7F  CPY $7FC7
  $9C18  7F        .db $7F
  $9C19  FF        .db $FF
  $9C1A  FF        .db $FF
  $9C1B  E3        .db $E3
  $9C1C  86 CE     STX $CE

L_9C1E:
  $9C1E  C7        .db $C7
  $9C1F  7F        .db $7F
  $9C20  00        BRK
  $9C21  00        BRK
  $9C22  00        BRK
  $9C23  00        BRK
  $9C24  00        BRK
  $9C25  80        .db $80
  $9C26  80        .db $80
  $9C27  80        .db $80
  $9C28  C0 F0     CPY #$F0
  $9C2A  FC        .db $FC
  $9C2B  F0 7C     BEQ $9CA9
  $9C2D  B0 87     BCS $9BB6
  $9C2F  BE 00 00  LDX $0000,Y
  $9C32  00        BRK
  $9C33  00        BRK
  $9C34  70 E0     BVS $9C16
  $9C36  80        .db $80
  $9C37  40        RTI
  $9C38  00        BRK
  $9C39  00        BRK
  $9C3A  00        BRK
  $9C3B  00        BRK
  $9C3C  70 E0     BVS $9C1E
  $9C3E  80        .db $80
  $9C3F  40        RTI
  $9C40  00        BRK
  $9C41  00        BRK
  $9C42  C0 C1     CPY #$C1
  $9C44  81 00     STA ($00,X)
  $9C46  00        BRK
  $9C47  00        BRK
  $9C48  08        PHP
  $9C49  39 DC D1  AND $D1DC,Y
  $9C4C  81 00     STA ($00,X)

L_9C4E:
  $9C4E  03        .db $03
  $9C4F  04        .db $04
  $9C50  0E 06 04  ASL $0406
  $9C53  E8        INX
  $9C54  70 00     BVS $9C56

L_9C56:
  $9C56  00        BRK
  $9C57  00        BRK
  $9C58  EE F6 14  INC $14F6
  $9C5B  E9 73     SBC #$73
  $9C5D  07        .db $07
  $9C5E  BF        .db $BF
  $9C5F  1F        .db $1F
  $9C60  00        BRK
  $9C61  00        BRK
  $9C62  00        BRK
  $9C63  00        BRK
  $9C64  00        BRK
  $9C65  00        BRK
  $9C66  00        BRK
  $9C67  00        BRK
  $9C68  7E 78 F0  ROR $F078,X
  $9C6B  F0 E0     BEQ $9C4D
  $9C6D  60        RTS
  $9C6E  60        RTS
  $9C6F  B0 00     BCS $9C71

L_9C71:
  $9C71  00        BRK
  $9C72  00        BRK
  $9C73  00        BRK
  $9C74  00        BRK
  $9C75  00        BRK
  $9C76  00        BRK
  $9C77  00        BRK
  $9C78  73        .db $73
  $9C79  E0 F2     CPX #$F2
  $9C7B  63        .db $63
  $9C7C  09 10     ORA #$10
  $9C7E  E0 00     CPX #$00
  $9C80  00        BRK
  $9C81  00        BRK
  $9C82  00        BRK
  $9C83  00        BRK
  $9C84  00        BRK
  $9C85  00        BRK
  $9C86  00        BRK
  $9C87  00        BRK
  $9C88  F6 FC     INC $FC,X
  $9C8A  00        BRK
  $9C8B  80        .db $80
  $9C8C  C8        INY
  $9C8D  C8        INY
  $9C8E  08        PHP
  $9C8F  30 00     BMI $9C91

L_9C91:
  $9C91  00        BRK
  $9C92  C0 C1     CPY #$C1
  $9C94  81 00     STA ($00,X)
  $9C96  00        BRK
  $9C97  00        BRK
  $9C98  08        PHP
  $9C99  39 DC D1  AND $D1DC,Y
  $9C9C  85 02     STA $02
  $9C9E  01 00     ORA ($00,X)
  $9CA0  00        BRK
  $9CA1  00        BRK
  $9CA2  00        BRK
  $9CA3  00        BRK
  $9CA4  00        BRK
  $9CA5  00        BRK
  $9CA6  00        BRK
  $9CA7  00        BRK
  $9CA8  7E 78 F0  ROR $F078,X
  $9CAB  F0 E4     BEQ $9C91
  $9CAD  7C        .db $7C
  $9CAE  98        TYA
  $9CAF  F0 00     BEQ $9CB1

L_9CB1:
  $9CB1  00        BRK
  $9CB2  00        BRK
  $9CB3  00        BRK
  $9CB4  00        BRK
  $9CB5  00        BRK
  $9CB6  00        BRK
  $9CB7  00        BRK
  $9CB8  71 E4     ADC ($E4),Y
  $9CBA  F3        .db $F3
  $9CBB  63        .db $63
  $9CBC  09 10     ORA #$10
  $9CBE  E0 00     CPX #$00
  $9CC0  00        BRK
  $9CC1  00        BRK
  $9CC2  00        BRK
  $9CC3  00        BRK
  $9CC4  00        BRK
  $9CC5  00        BRK
  $9CC6  00        BRK
  $9CC7  00        BRK
  $9CC8  F0 00     BEQ $9CCA

L_9CCA:
  $9CCA  C0 80     CPY #$80
  $9CCC  C8        INY
  $9CCD  C8        INY
  $9CCE  08        PHP
  $9CCF  30 07     BMI $9CD8
  $9CD1  0F        .db $0F
  $9CD2  1F        .db $1F
  $9CD3  0E 08 0C  ASL $0C08
  $9CD6  1C        .db $1C
  $9CD7  37        .db $37

L_9CD8:
  $9CD8  07        .db $07
  $9CD9  0F        .db $0F
  $9CDA  3F        .db $3F
  $9CDB  4E 28 CC  LSR $CC28
  $9CDE  DC        .db $DC
  $9CDF  37        .db $37
  $9CE0  E0 E0     CPX #$E0
  $9CE2  C0 00     CPY #$00
  $9CE4  40        RTI
  $9CE5  C8        INY
  $9CE6  78        SEI

L_9CE7:
  $9CE7  F0 E0     BEQ $9CC9
  $9CE9  F0 FC     BEQ $9CE7
  $9CEB  3E 67 EA  ROL $EA67,X
  $9CEE  78        SEI
  $9CEF  F0 03     BEQ $9CF4
  $9CF1  02        .db $02
  $9CF2  00        BRK
  $9CF3  01 01     ORA ($01,X)
  $9CF5  00        BRK
  $9CF6  00        BRK
  $9CF7  60        RTS
  $9CF8  03        .db $03
  $9CF9  1A        .db $1A
  $9CFA  3C        .db $3C
  $9CFB  3D 79 70  AND $7079,X
  $9CFE  11 63     ORA ($63),Y
  $9D00  3E 0E 06  ROL $060E,X
  $9D03  EC F8 E0  CPX $E0F8
  $9D06  00        BRK
  $9D07  00        BRK
  $9D08  3E CE 16  ROL $16CE,X
  $9D0B  ED FB E7  SBC $E7FB
  $9D0E  1F        .db $1F
  $9D0F  9F        .db $9F
  $9D10  00        BRK
  $9D11  00        BRK
  $9D12  00        BRK
  $9D13  00        BRK
  $9D14  00        BRK
  $9D15  00        BRK
  $9D16  00        BRK
  $9D17  00        BRK
  $9D18  70 7C     BVS $9D96
  $9D1A  FE FE FF  INC $FFFE,X
  $9D1D  EF        .db $EF
  $9D1E  EE E0 00  INC $00E0
  $9D21  00        BRK
  $9D22  00        BRK
  $9D23  00        BRK
  $9D24  00        BRK
  $9D25  00        BRK
  $9D26  00        BRK
  $9D27  00        BRK
  $9D28  83        .db $83
  $9D29  31 7A     AND ($7A),Y
  $9D2B  79 F8 F0  ADC $F0F8,Y
  $9D2E  69 1B     ADC #$1B
  $9D30  07        .db $07
  $9D31  06 00     ASL $00
  $9D33  00        BRK
  $9D34  00        BRK
  $9D35  00        BRK
  $9D36  00        BRK
  $9D37  00        BRK
  $9D38  F7        .db $F7
  $9D39  E6 E0     INC $E0
  $9D3B  00        BRK
  $9D3C  E0 E0     CPX #$E0
  $9D3E  E0 C0     CPX #$C0
  $9D40  00        BRK
  $9D41  00        BRK
  $9D42  00        BRK
  $9D43  00        BRK
  $9D44  00        BRK
  $9D45  00        BRK
  $9D46  00        BRK
  $9D47  00        BRK
  $9D48  66 C3     ROR $C3
  $9D4A  00        BRK
  $9D4B  00        BRK
  $9D4C  00        BRK
  $9D4D  00        BRK
  $9D4E  00        BRK

L_9D4F:
  $9D4F  00        BRK
  $9D50  00        BRK
  $9D51  00        BRK
  $9D52  00        BRK
  $9D53  08        PHP
  $9D54  10 10     BPL $9D66
  $9D56  20 20 00  JSR $0020
  $9D59  01 03     ORA ($03,X)
  $9D5B  07        .db $07
  $9D5C  0F        .db $0F
  $9D5D  0F        .db $0F
  $9D5E  0F        .db $0F
  $9D5F  04        .db $04
  $9D60  00        BRK
  $9D61  00        BRK
  $9D62  00        BRK
  $9D63  04        .db $04
  $9D64  06 07     ASL $07

L_9D66:
  $9D66  03        .db $03
  $9D67  06 F0     ASL $F0
  $9D69  FC        .db $FC
  $9D6A  FC        .db $FC
  $9D6B  F8        SED
  $9D6C  F8        SED
  $9D6D  F8        SED
  $9D6E  CC 18 00  CPY $0018
  $9D71  32        .db $32
  $9D72  70 78     BVS $9DEC
  $9D74  38        SEC
  $9D75  1C        .db $1C
  $9D76  6E 77 05  ROR $0577

L_9D79:
  $9D79  07        .db $07
  $9D7A  05 03     ORA $03
  $9D7C  03        .db $03
  $9D7D  01 00     ORA ($00,X)
  $9D7F  00        BRK
  $9D80  00        BRK
  $9D81  31 01     AND ($01),Y
  $9D83  01 03     ORA ($03,X)
  $9D85  07        .db $07
  $9D86  0F        .db $0F
  $9D87  3F        .db $3F
  $9D88  8E BE 8C  STX $8CBE
  $9D8B  FC        .db $FC
  $9D8C  F8        SED
  $9D8D  F0 C0     BEQ $9D4F
  $9D8F  00        BRK
  $9D90  70 F8     BVS $9D8A
  $9D92  F8        SED
  $9D93  F0 E4     BEQ $9D79
  $9D95  EE EE EC  INC $ECEE
  $9D98  00        BRK
  $9D99  00        BRK
  $9D9A  00        BRK
  $9D9B  00        BRK
  $9D9C  00        BRK
  $9D9D  00        BRK
  $9D9E  00        BRK
  $9D9F  00        BRK
  $9DA0  73        .db $73
  $9DA1  74        .db $74
  $9DA2  27        .db $27
  $9DA3  03        .db $03
  $9DA4  00        BRK
  $9DA5  01 03     ORA ($03,X)
  $9DA7  07        .db $07
  $9DA8  00        BRK
  $9DA9  00        BRK
  $9DAA  00        BRK
  $9DAB  00        BRK
  $9DAC  00        BRK
  $9DAD  00        BRK
  $9DAE  00        BRK
  $9DAF  00        BRK
  $9DB0  FF        .db $FF
  $9DB1  F8        SED
  $9DB2  73        .db $73
  $9DB3  77        .db $77
  $9DB4  A7        .db $A7
  $9DB5  4C BE 04  JMP $04BE
  $9DB8  00        BRK
  $9DB9  00        BRK
  $9DBA  00        BRK
  $9DBB  00        BRK
  $9DBC  00        BRK
  $9DBD  00        BRK
  $9DBE  00        BRK
  $9DBF  00        BRK
  $9DC0  86 0E     STX $0E
  $9DC2  C6 86     DEC $86
  $9DC4  00        BRK
  $9DC5  00        BRK
  $9DC6  00        BRK
  $9DC7  00        BRK
  $9DC8  00        BRK
  $9DC9  00        BRK
  $9DCA  00        BRK
  $9DCB  00        BRK
  $9DCC  00        BRK
  $9DCD  00        BRK
  $9DCE  00        BRK
  $9DCF  00        BRK
  $9DD0  04        .db $04
  $9DD1  03        .db $03
  $9DD2  01 01     ORA ($01,X)
  $9DD4  02        .db $02
  $9DD5  00        BRK
  $9DD6  00        BRK
  $9DD7  00        BRK
  $9DD8  00        BRK
  $9DD9  00        BRK
  $9DDA  00        BRK
  $9DDB  00        BRK
  $9DDC  00        BRK
  $9DDD  00        BRK
  $9DDE  00        BRK
  $9DDF  00        BRK
  $9DE0  01 03     ORA ($03,X)
  $9DE2  C6 0C     DEC $0C
  $9DE4  02        .db $02
  $9DE5  00        BRK
  $9DE6  00        BRK
  $9DE7  00        BRK
  $9DE8  00        BRK
  $9DE9  00        BRK
  $9DEA  00        BRK
  $9DEB  00        BRK

L_9DEC:
  $9DEC  00        BRK
  $9DED  00        BRK
  $9DEE  00        BRK
  $9DEF  00        BRK
  $9DF0  00        BRK
  $9DF1  00        BRK
  $9DF2  00        BRK
  $9DF3  00        BRK
  $9DF4  00        BRK
  $9DF5  00        BRK
  $9DF6  00        BRK
  $9DF7  00        BRK
  $9DF8  00        BRK
  $9DF9  00        BRK
  $9DFA  00        BRK
  $9DFB  01 01     ORA ($01,X)
  $9DFD  03        .db $03
  $9DFE  07        .db $07
  $9DFF  07        .db $07
  $9E00  00        BRK
  $9E01  00        BRK
  $9E02  00        BRK
  $9E03  00        BRK
  $9E04  00        BRK
  $9E05  00        BRK
  $9E06  00        BRK
  $9E07  00        BRK
  $9E08  3C        .db $3C
  $9E09  7E FE FC  ROR $FCFE,X
  $9E0C  FC        .db $FC
  $9E0D  FE FE FF  INC $FFFE,X
  $9E10  00        BRK
  $9E11  76 32     ROR $32,X
  $9E13  38        SEC
  $9E14  38        SEC
  $9E15  18        CLC
  $9E16  4C 6E 03  JMP $036E
  $9E19  07        .db $07
  $9E1A  03        .db $03
  $9E1B  05 07     ORA $07
  $9E1D  07        .db $07
  $9E1E  03        .db $03
  $9E1F  01 00     ORA ($00,X)
  $9E21  20 70 60  JSR $6070
  $9E24  01 03     ORA ($03,X)
  $9E26  07        .db $07
  $9E27  0F        .db $0F
  $9E28  FF        .db $FF
  $9E29  E6 F6     INC $F6
  $9E2B  6C 18 F0  JMP ($F018)
  $9E2E  C0 80     CPY #$80
  $9E30  38        SEC
  $9E31  FC        .db $FC
  $9E32  FC        .db $FC
  $9E33  F8        SED
  $9E34  F4        .db $F4
  $9E35  EC EE EE  CPX $EEEE
  $9E38  00        BRK
  $9E39  00        BRK
  $9E3A  00        BRK
  $9E3B  00        BRK
  $9E3C  00        BRK
  $9E3D  00        BRK
  $9E3E  00        BRK
  $9E3F  00        BRK
  $9E40  27        .db $27
  $9E41  43        .db $43
  $9E42  61 22     ADC ($22,X)
  $9E44  30 61     BMI $9EA7
  $9E46  40        RTI

L_9E47:
  $9E47  41 00     EOR ($00,X)
  $9E49  00        BRK
  $9E4A  00        BRK
  $9E4B  00        BRK
  $9E4C  00        BRK
  $9E4D  00        BRK
  $9E4E  00        BRK
  $9E4F  00        BRK
  $9E50  FF        .db $FF
  $9E51  FC        .db $FC
  $9E52  F0 F3     BEQ $9E47
  $9E54  60        RTS
  $9E55  A7        .db $A7
  $9E56  08        PHP
  $9E57  CF        .db $CF
  $9E58  00        BRK
  $9E59  00        BRK
  $9E5A  00        BRK
  $9E5B  00        BRK
  $9E5C  00        BRK
  $9E5D  00        BRK
  $9E5E  00        BRK
  $9E5F  00        BRK
  $9E60  CE EE 64  DEC $64EE
  $9E63  82        .db $82
  $9E64  06 0B     ASL $0B
  $9E66  09 01     ORA #$01
  $9E68  00        BRK
  $9E69  00        BRK
  $9E6A  00        BRK
  $9E6B  00        BRK
  $9E6C  00        BRK
  $9E6D  00        BRK
  $9E6E  00        BRK

L_9E6F:
  $9E6F  00        BRK
  $9E70  0F        .db $0F
  $9E71  0E 1C 18  ASL $181C
  $9E74  04        .db $04
  $9E75  1C        .db $1C
  $9E76  07        .db $07
  $9E77  02        .db $02
  $9E78  00        BRK
  $9E79  00        BRK
  $9E7A  00        BRK
  $9E7B  00        BRK
  $9E7C  00        BRK
  $9E7D  00        BRK
  $9E7E  00        BRK
  $9E7F  00        BRK
  $9E80  1C        .db $1C
  $9E81  0E 05 02  ASL $0205
  $9E84  06 06     ASL $06
  $9E86  0C        .db $0C
  $9E87  9C        .db $9C
  $9E88  00        BRK
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  00        BRK
  $9E8C  00        BRK
  $9E8D  00        BRK
  $9E8E  00        BRK
  $9E8F  00        BRK
  $9E90  04        .db $04
  $9E91  04        .db $04
  $9E92  00        BRK
  $9E93  00        BRK
  $9E94  00        BRK
  $9E95  00        BRK
  $9E96  00        BRK
  $9E97  00        BRK
  $9E98  00        BRK
  $9E99  00        BRK
  $9E9A  00        BRK
  $9E9B  00        BRK
  $9E9C  00        BRK
  $9E9D  00        BRK
  $9E9E  00        BRK
  $9E9F  00        BRK
  $9EA0  24 02     BIT $02
  $9EA2  00        BRK
  $9EA3  00        BRK
  $9EA4  00        BRK
  $9EA5  00        BRK
  $9EA6  00        BRK

L_9EA7:
  $9EA7  00        BRK
  $9EA8  00        BRK
  $9EA9  00        BRK
  $9EAA  00        BRK
  $9EAB  00        BRK
  $9EAC  00        BRK
  $9EAD  00        BRK
  $9EAE  00        BRK
  $9EAF  00        BRK
  $9EB0  00        BRK
  $9EB1  A0 00     LDY #$00
  $9EB3  00        BRK
  $9EB4  00        BRK
  $9EB5  40        RTI
  $9EB6  A0 40     LDY #$40
  $9EB8  00        BRK
  $9EB9  E0 E0     CPX #$E0
  $9EBB  60        RTS
  $9EBC  60        RTS
  $9EBD  70 B0     BVS $9E6F
  $9EBF  D0 00     BNE $9EC1

L_9EC1:
  $9EC1  00        BRK
  $9EC2  01 01     ORA ($01,X)
  $9EC4  00        BRK
  $9EC5  00        BRK
  $9EC6  02        .db $02
  $9EC7  00        BRK
  $9EC8  00        BRK
  $9EC9  00        BRK
  $9ECA  01 01     ORA ($01,X)
  $9ECC  01 01     ORA ($01,X)
  $9ECE  03        .db $03
  $9ECF  07        .db $07
  $9ED0  00        BRK
  $9ED1  86 08     STX $08
  $9ED3  10 00     BPL $9ED5

L_9ED5:
  $9ED5  0A        ASL
  $9ED6  08        PHP
  $9ED7  2C 1C FE  BIT $FE1C
  $9EDA  F8        SED
  $9EDB  F0 E4     BEQ $9EC1

L_9EDD:
  $9EDD  EE E6 E6  INC $E6E6
  $9EE0  18        CLC
  $9EE1  64        .db $64
  $9EE2  C2        .db $C2
  $9EE3  04        .db $04
  $9EE4  C0 43     CPY #$43
  $9EE6  40        RTI
  $9EE7  01 DA     ORA ($DA,X)
  $9EE9  CC 86 03  CPY $0386
  $9EEC  81 80     STA ($80,X)
  $9EEE  80        .db $80
  $9EEF  40        RTI
  $9EF0  08        PHP
  $9EF1  40        RTI
  $9EF2  00        BRK
  $9EF3  14        .db $14
  $9EF4  00        BRK
  $9EF5  27        .db $27
  $9EF6  00        BRK
  $9EF7  0E 0F 7F  ASL $7F0F
  $9EFA  F8        SED
  $9EFB  F0 E0     BEQ $9EDD
  $9EFD  E0 C0     CPX #$C0
  $9EFF  40        RTI
  $9F00  0C        .db $0C
  $9F01  04        .db $04
  $9F02  03        .db $03
  $9F03  04        .db $04
  $9F04  06 06     ASL $06
  $9F06  02        .db $02
  $9F07  02        .db $02
  $9F08  C2        .db $C2
  $9F09  C2        .db $C2
  $9F0A  E3        .db $E3
  $9F0B  C3        .db $C3
  $9F0C  01 01     ORA ($01,X)
  $9F0E  01 01     ORA ($01,X)
  $9F10  00        BRK
  $9F11  00        BRK
  $9F12  00        BRK
  $9F13  C0 03     CPY #$03
  $9F15  06 00     ASL $00
  $9F17  01 60     ORA ($60,X)
  $9F19  C1 C3     CMP ($C3,X)
  $9F1B  C7        .db $C7
  $9F1C  04        .db $04
  $9F1D  08        PHP
  $9F1E  0C        .db $0C
  $9F1F  02        .db $02
  $9F20  00        BRK
  $9F21  80        .db $80
  $9F22  06 83     ASL $83
  $9F24  01 01     ORA ($01,X)
  $9F26  02        .db $02
  $9F27  04        .db $04
  $9F28  22        .db $22
  $9F29  87        .db $87
  $9F2A  81 00     STA ($00,X)
  $9F2C  01 00     ORA ($00,X)
  $9F2E  01 02     ORA ($02,X)
  $9F30  00        BRK
  $9F31  00        BRK
  $9F32  00        BRK
  $9F33  00        BRK
  $9F34  80        .db $80
  $9F35  09 00     ORA #$00
  $9F37  00        BRK
  $9F38  00        BRK
  $9F39  03        .db $03
  $9F3A  87        .db $87
  $9F3B  09 C9     ORA #$C9
  $9F3D  89        .db $89
  $9F3E  00        BRK
  $9F3F  00        BRK
  $9F40  01 00     ORA ($00,X)
  $9F42  00        BRK
  $9F43  00        BRK
  $9F44  00        BRK
  $9F45  02        .db $02
  $9F46  00        BRK
  $9F47  00        BRK
  $9F48  02        .db $02
  $9F49  01 01     ORA ($01,X)
  $9F4B  02        .db $02
  $9F4C  02        .db $02
  $9F4D  02        .db $02
  $9F4E  00        BRK
  $9F4F  00        BRK
  $9F50  00        BRK
  $9F51  40        RTI
  $9F52  00        BRK
  $9F53  00        BRK
  $9F54  01 00     ORA ($00,X)
  $9F56  00        BRK

L_9F57:
  $9F57  00        BRK
  $9F58  08        PHP
  $9F59  CC 12 01  CPY $0112
  $9F5C  01 00     ORA ($00,X)
  $9F5E  00        BRK

L_9F5F:
  $9F5F  00        BRK
  $9F60  00        BRK
  $9F61  00        BRK
  $9F62  00        BRK
  $9F63  00        BRK
  $9F64  00        BRK
  $9F65  00        BRK
  $9F66  08        PHP
  $9F67  00        BRK
  $9F68  00        BRK
  $9F69  00        BRK
  $9F6A  00        BRK
  $9F6B  01 03     ORA ($03,X)
  $9F6D  07        .db $07
  $9F6E  0F        .db $0F
  $9F6F  0F        .db $0F
  $9F70  24 02     BIT $02
  $9F72  0D 3A 14  ORA $143A
  $9F75  74        .db $74
  $9F76  30 38     BMI $9FB0
  $9F78  3C        .db $3C
  $9F79  7E FF FE  ROR $FEFF,X
  $9F7C  FC        .db $FC
  $9F7D  FC        .db $FC
  $9F7E  FC        .db $FC
  $9F7F  FE 00 00  INC $0000,X
  $9F82  09 0D     ORA #$0D
  $9F84  04        .db $04
  $9F85  02        .db $02
  $9F86  03        .db $03
  $9F87  03        .db $03
  $9F88  0F        .db $0F
  $9F89  07        .db $07
  $9F8A  03        .db $03
  $9F8B  03        .db $03
  $9F8C  02        .db $02
  $9F8D  06 07     ASL $07
  $9F8F  07        .db $07
  $9F90  7A        .db $7A
  $9F91  F4        .db $F4
  $9F92  E8        INX
  $9F93  E8        INX
  $9F94  D8        CLD
  $9F95  30 C0     BMI $9F57
  $9F97  00        BRK
  $9F98  FE FC 88  INC $88FC,X
  $9F9B  08        PHP
  $9F9C  18        CLC

L_9F9D:
  $9F9D  30 C0     BMI $9F5F
  $9F9F  00        BRK
  $9FA0  18        CLC
  $9FA1  64        .db $64
  $9FA2  C2        .db $C2
  $9FA3  0C        .db $0C
  $9FA4  C0 4F     CPY #$4F
  $9FA6  40        RTI
  $9FA7  07        .db $07
  $9FA8  DA        .db $DA
  $9FA9  CC 86 03  CPY $0386
  $9FAC  81 80     STA ($80,X)
  $9FAE  80        .db $80
  $9FAF  40        RTI

L_9FB0:
  $9FB0  08        PHP
  $9FB1  40        RTI
  $9FB2  00        BRK
  $9FB3  17        .db $17
  $9FB4  00        BRK
  $9FB5  27        .db $27
  $9FB6  00        BRK
  $9FB7  0F        .db $0F
  $9FB8  0F        .db $0F
  $9FB9  7F        .db $7F
  $9FBA  F8        SED
  $9FBB  F0 E0     BEQ $9F9D
  $9FBD  E0 C0     CPX #$C0
  $9FBF  40        RTI
  $9FC0  0C        .db $0C
  $9FC1  04        .db $04
  $9FC2  03        .db $03
  $9FC3  04        .db $04
  $9FC4  06 C6     ASL $C6
  $9FC6  02        .db $02
  $9FC7  82        .db $82
  $9FC8  C2        .db $C2
  $9FC9  C2        .db $C2
  $9FCA  E3        .db $E3
  $9FCB  C3        .db $C3
  $9FCC  01 01     ORA ($01,X)
  $9FCE  01 01     ORA ($01,X)
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
  $9FDB  18        CLC
  $9FDC  18        CLC
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
  $9FEA  18        CLC
  $9FEB  3C        .db $3C
  $9FEC  3C        .db $3C
  $9FED  18        CLC
  $9FEE  00        BRK
  $9FEF  00        BRK
  $9FF0  00        BRK
  $9FF1  00        BRK
  $9FF2  07        .db $07
  $9FF3  0F        .db $0F
  $9FF4  1F        .db $1F
  $9FF5  0F        .db $0F
  $9FF6  1E 0E 00  ASL $000E,X
  $9FF9  00        BRK
  $9FFA  00        BRK
  $9FFB  03        .db $03
  $9FFC  0F        .db $0F
  $9FFD  02        .db $02
  $9FFE  0D 05 80  ORA $8005
  $A001  2B        .db $2B
  $A002  3F        .db $3F
  $A003  7F        .db $7F
  $A004  7F        .db $7F
  $A005  7F        .db $7F
  $A006  BF        .db $BF
  $A007  55 FF     EOR $FF,X
  $A009  D4        .db $D4
  $A00A  C0 80     CPY #$80
  $A00C  80        .db $80
  $A00D  80        .db $80
  $A00E  C8        INY
  $A00F  FF        .db $FF
  $A010  FF        .db $FF
  $A011  7F        .db $7F
  $A012  00        BRK
  $A013  02        .db $02
  $A014  54        .db $54
  $A015  FC        .db $FC
  $A016  FC        .db $FC
  $A017  F8        SED
  $A018  FF        .db $FF
  $A019  7F        .db $7F
  $A01A  00        BRK
  $A01B  FE AA 02  INC $02AA,X
  $A01E  02        .db $02
  $A01F  06 02     ASL $02
  $A021  A8        TAY
  $A022  FC        .db $FC
  $A023  FC        .db $FC
  $A024  FC        .db $FC
  $A025  FC        .db $FC
  $A026  DE 54 FE  DEC $FE54,X
  $A029  56 02     LSR $02,X
  $A02B  02        .db $02
  $A02C  02        .db $02
  $A02D  02        .db $02
  $A02E  22        .db $22
  $A02F  FE FE FE  INC $FEFE,X
  $A032  00        BRK
  $A033  80        .db $80
  $A034  15 7F     ORA $7F,X
  $A036  7F        .db $7F
  $A037  3F        .db $3F
  $A038  FE FE 00  INC $00FE,X
  $A03B  FF        .db $FF
  $A03C  EA        NOP
  $A03D  80        .db $80
  $A03E  80        .db $80
  $A03F  C0 80     CPY #$80
  $A041  2B        .db $2B
  $A042  3F        .db $3F
  $A043  7F        .db $7F
  $A044  7F        .db $7F
  $A045  7F        .db $7F
  $A046  BF        .db $BF
  $A047  55 FF     EOR $FF,X
  $A049  D4        .db $D4
  $A04A  C0 80     CPY #$80
  $A04C  80        .db $80
  $A04D  80        .db $80
  $A04E  C8        INY
  $A04F  FF        .db $FF
  $A050  FF        .db $FF
  $A051  7F        .db $7F
  $A052  00        BRK
  $A053  02        .db $02

L_A054:
  $A054  54        .db $54
  $A055  FC        .db $FC
  $A056  30 FC     BMI $A054
  $A058  FF        .db $FF
  $A059  7F        .db $7F
  $A05A  00        BRK
  $A05B  FE AA 02  INC $02AA,X
  $A05E  CE FC 02  DEC $02FC
  $A061  A8        TAY
  $A062  FC        .db $FC
  $A063  FC        .db $FC
  $A064  FC        .db $FC
  $A065  FC        .db $FC
  $A066  DE 54 FE  DEC $FE54,X
  $A069  56 02     LSR $02,X
  $A06B  02        .db $02
  $A06C  02        .db $02
  $A06D  02        .db $02
  $A06E  22        .db $22
  $A06F  FE FE FE  INC $FEFE,X
  $A072  00        BRK
  $A073  80        .db $80
  $A074  15 7F     ORA $7F,X
  $A076  29 7F     AND #$7F
  $A078  FE FE 00  INC $00FE,X
  $A07B  FF        .db $FF
  $A07C  EA        NOP
  $A07D  80        .db $80
  $A07E  D6 7F     DEC $7F,X
  $A080  AF        .db $AF
  $A081  AF        .db $AF
  $A082  AF        .db $AF
  $A083  AF        .db $AF
  $A084  AF        .db $AF
  $A085  AF        .db $AF
  $A086  80        .db $80
  $A087  00        BRK
  $A088  C0 C0     CPY #$C0
  $A08A  C0 C0     CPY #$C0
  $A08C  C0 C0     CPY #$C0
  $A08E  EF        .db $EF
  $A08F  00        BRK
  $A090  B7        .db $B7
  $A091  B7        .db $B7
  $A092  B7        .db $B7
  $A093  B7        .db $B7
  $A094  B7        .db $B7
  $A095  B7        .db $B7
  $A096  80        .db $80
  $A097  00        BRK
  $A098  C0 C0     CPY #$C0
  $A09A  C0 C0     CPY #$C0
  $A09C  C0 C0     CPY #$C0
  $A09E  F7        .db $F7
  $A09F  00        BRK
  $A0A0  CA        DEX
  $A0A1  CA        DEX
  $A0A2  CA        DEX
  $A0A3  CA        DEX
  $A0A4  CA        DEX
  $A0A5  CA        DEX
  $A0A6  02        .db $02
  $A0A7  00        BRK
  $A0A8  26 26     ROL $26
  $A0AA  26 26     ROL $26
  $A0AC  26 26     ROL $26
  $A0AE  EE 00 9A  INC $9A00
  $A0B1  9A        TXS
  $A0B2  9A        TXS
  $A0B3  9A        TXS
  $A0B4  9A        TXS
  $A0B5  9A        TXS
  $A0B6  02        .db $02
  $A0B7  00        BRK
  $A0B8  46 46     LSR $46
  $A0BA  46 46     LSR $46
  $A0BC  46 46     LSR $46
  $A0BE  DE 00 00  DEC $0000,X
  $A0C1  FF        .db $FF
  $A0C2  AA        TAX
  $A0C3  51 B8     EOR ($B8),Y
  $A0C5  75 AA     ADC $AA,X
  $A0C7  DD 00 FF  CMP $FF00,X
  $A0CA  FF        .db $FF
  $A0CB  FF        .db $FF
  $A0CC  47        .db $47
  $A0CD  8A        TXA
  $A0CE  55 22     EOR $22,X
  $A0D0  FE FF FF  INC $FFFF,X
  $A0D3  DF        .db $DF
  $A0D4  FE F3 FF  INC $FFF3,X
  $A0D7  FF        .db $FF
  $A0D8  01 00     ORA ($00,X)
  $A0DA  00        BRK
  $A0DB  20 01 0C  JSR $0C01
  $A0DE  00        BRK
  $A0DF  00        BRK
  $A0E0  00        BRK
  $A0E1  FF        .db $FF
  $A0E2  AA        TAX
  $A0E3  04        .db $04
  $A0E4  A3        .db $A3
  $A0E5  5D EA 7D  EOR $7DEA,X
  $A0E8  00        BRK
  $A0E9  FF        .db $FF
  $A0EA  FF        .db $FF
  $A0EB  FF        .db $FF
  $A0EC  5C        .db $5C
  $A0ED  A2 15     LDX #$15
  $A0EF  82        .db $82
  $A0F0  FE F7 FF  INC $FFF7,X
  $A0F3  FF        .db $FF
  $A0F4  FF        .db $FF
  $A0F5  F7        .db $F7
  $A0F6  AF        .db $AF
  $A0F7  DF        .db $DF
  $A0F8  01 08     ORA ($08,X)
  $A0FA  00        BRK
  $A0FB  00        BRK
  $A0FC  00        BRK
  $A0FD  08        PHP
  $A0FE  50 20     BVC $A120
  $A100  FF        .db $FF
  $A101  5F        .db $5F
  $A102  BF        .db $BF
  $A103  FF        .db $FF
  $A104  FF        .db $FF
  $A105  FF        .db $FF
  $A106  FF        .db $FF
  $A107  EF        .db $EF
  $A108  00        BRK
  $A109  A0 40     LDY #$40
  $A10B  00        BRK
  $A10C  00        BRK
  $A10D  00        BRK

L_A10E:
  $A10E  00        BRK
  $A10F  10 FD     BPL $A10E
  $A111  FF        .db $FF
  $A112  FF        .db $FF
  $A113  DF        .db $DF
  $A114  FE FD FE  INC $FEFD,X
  $A117  77        .db $77
  $A118  02        .db $02
  $A119  00        BRK
  $A11A  00        BRK
  $A11B  20 01 02  JSR $0201
  $A11E  01 88     ORA ($88,X)

L_A120:
  $A120  FF        .db $FF
  $A121  FF        .db $FF
  $A122  FF        .db $FF
  $A123  FF        .db $FF
  $A124  D7        .db $D7
  $A125  FE FF FF  INC $FFFF,X
  $A128  00        BRK
  $A129  00        BRK
  $A12A  00        BRK
  $A12B  00        BRK
  $A12C  28        PLP
  $A12D  01 00     ORA ($00,X)
  $A12F  00        BRK
  $A130  FF        .db $FF
  $A131  FF        .db $FF
  $A132  FF        .db $FF
  $A133  9D FF FF  STA $FFFF,X
  $A136  7E DB 00  ROR $00DB,X
  $A139  00        BRK
  $A13A  00        BRK
  $A13B  62        .db $62
  $A13C  00        BRK
  $A13D  00        BRK
  $A13E  81 24     STA ($24,X)
  $A140  EF        .db $EF
  $A141  77        .db $77
  $A142  AA        TAX
  $A143  5D A2 01  EOR $01A2,X
  $A146  00        BRK
  $A147  80        .db $80
  $A148  10 88     BPL $A0D2
  $A14A  55 A2     EOR $A2,X
  $A14C  5D FE FF  EOR $FFFE,X
  $A14F  FF        .db $FF
  $A150  50 8A     BVC $A0DC
  $A152  55 AE     EOR $AE,X
  $A154  FF        .db $FF
  $A155  55 AA     EOR $AA,X
  $A157  00        BRK
  $A158  FF        .db $FF
  $A159  FF        .db $FF
  $A15A  FF        .db $FF
  $A15B  FF        .db $FF

L_A15C:
  $A15C  FF        .db $FF
  $A15D  55 AA     EOR $AA,X
  $A15F  00        BRK
  $A160  FF        .db $FF
  $A161  7D AA 75  ADC $75AA,X
  $A164  A8        TAY
  $A165  04        .db $04
  $A166  00        BRK
  $A167  08        PHP
  $A168  00        BRK
  $A169  82        .db $82
  $A16A  55 8A     EOR $8A,X
  $A16C  57        .db $57
  $A16D  FB        .db $FB
  $A16E  FF        .db $FF
  $A16F  FF        .db $FF
  $A170  45 AA     EOR $AA
  $A172  55 EB     EOR $EB,X
  $A174  FF        .db $FF
  $A175  5D AA 00  EOR $00AA,X
  $A178  FF        .db $FF
  $A179  FF        .db $FF
  $A17A  FF        .db $FF
  $A17B  FF        .db $FF
  $A17C  FF        .db $FF
  $A17D  5D AA 00  EOR $00AA,X
  $A180  00        BRK
  $A181  FF        .db $FF
  $A182  AA        TAX
  $A183  51 B8     EOR ($B8),Y
  $A185  75 BE     ADC $BE,X
  $A187  FF        .db $FF
  $A188  00        BRK
  $A189  FF        .db $FF
  $A18A  FF        .db $FF
  $A18B  FF        .db $FF
  $A18C  47        .db $47
  $A18D  8A        TXA
  $A18E  41 00     EOR ($00,X)
  $A190  FE FF FF  INC $FFFF,X
  $A193  FF        .db $FF
  $A194  DD FF FF  CMP $FFFF,X
  $A197  00        BRK
  $A198  01 00     ORA ($00,X)
  $A19A  00        BRK
  $A19B  00        BRK
  $A19C  22        .db $22
  $A19D  FF        .db $FF
  $A19E  FF        .db $FF
  $A19F  00        BRK
  $A1A0  00        BRK
  $A1A1  FF        .db $FF
  $A1A2  AA        TAX
  $A1A3  04        .db $04
  $A1A4  A3        .db $A3
  $A1A5  DD EA FD  CMP $FDEA,X
  $A1A8  00        BRK
  $A1A9  FF        .db $FF
  $A1AA  FF        .db $FF
  $A1AB  FF        .db $FF
  $A1AC  5C        .db $5C
  $A1AD  22        .db $22
  $A1AE  15 02     ORA $02,X
  $A1B0  FE FF FF  INC $FFFF,X
  $A1B3  FF        .db $FF
  $A1B4  DD FF FF  CMP $FFFF,X
  $A1B7  00        BRK
  $A1B8  01 00     ORA ($00,X)
  $A1BA  00        BRK
  $A1BB  00        BRK
  $A1BC  22        .db $22
  $A1BD  FF        .db $FF
  $A1BE  FF        .db $FF
  $A1BF  00        BRK
  $A1C0  00        BRK
  $A1C1  FF        .db $FF
  $A1C2  BF        .db $BF
  $A1C3  DD A3 01  CMP $01A3,X
  $A1C6  00        BRK
  $A1C7  80        .db $80
  $A1C8  00        BRK
  $A1C9  FF        .db $FF
  $A1CA  40        RTI
  $A1CB  22        .db $22
  $A1CC  5C        .db $5C
  $A1CD  FE FF FF  INC $FFFF,X
  $A1D0  50 8A     BVC $A15C
  $A1D2  55 AE     EOR $AE,X
  $A1D4  FF        .db $FF
  $A1D5  55 AA     EOR $AA,X
  $A1D7  00        BRK
  $A1D8  FF        .db $FF
  $A1D9  FF        .db $FF
  $A1DA  FF        .db $FF
  $A1DB  FF        .db $FF
  $A1DC  FF        .db $FF
  $A1DD  55 AA     EOR $AA,X
  $A1DF  00        BRK
  $A1E0  00        BRK
  $A1E1  FF        .db $FF
  $A1E2  CF        .db $CF
  $A1E3  75 A8     ADC $A8,X
  $A1E5  44        .db $44
  $A1E6  00        BRK
  $A1E7  08        PHP
  $A1E8  00        BRK
  $A1E9  FF        .db $FF
  $A1EA  30 8A     BMI $A176
  $A1EC  57        .db $57
  $A1ED  BB        .db $BB
  $A1EE  FF        .db $FF
  $A1EF  FF        .db $FF
  $A1F0  45 AA     EOR $AA
  $A1F2  55 EB     EOR $EB,X
  $A1F4  FF        .db $FF
  $A1F5  5D AA 00  EOR $00AA,X
  $A1F8  FF        .db $FF
  $A1F9  FF        .db $FF
  $A1FA  FF        .db $FF
  $A1FB  FF        .db $FF
  $A1FC  FF        .db $FF
  $A1FD  5D AA 00  EOR $00AA,X
  $A200  04        .db $04
  $A201  A8        TAY
  $A202  FC        .db $FC
  $A203  00        BRK
  $A204  80        .db $80
  $A205  2E 7F 3F  ROL $3F7F
  $A208  FE FE FC  INC $FCFE,X
  $A20B  00        BRK
  $A20C  FF        .db $FF
  $A20D  D1 80     CMP ($80),Y

L_A20F:
  $A20F  C0 7F     CPY #$7F
  $A211  28        PLP
  $A212  FF        .db $FF
  $A213  00        BRK
  $A214  02        .db $02
  $A215  50 F8     BVC $A20F
  $A217  FC        .db $FC
  $A218  80        .db $80
  $A219  FF        .db $FF
  $A21A  FF        .db $FF
  $A21B  00        BRK
  $A21C  FE AE 06  INC $06AE,X
  $A21F  02        .db $02
  $A220  C9 AE     CMP #$AE
  $A222  FF        .db $FF
  $A223  00        BRK
  $A224  02        .db $02
  $A225  B8        CLV
  $A226  FC        .db $FC
  $A227  FC        .db $FC
  $A228  B6 FF     LDX $FF,Y
  $A22A  FF        .db $FF
  $A22B  00        BRK
  $A22C  FE 46 02  INC $0246,X
  $A22F  02        .db $02
  $A230  FC        .db $FC
  $A231  AA        TAX
  $A232  FE 00 80  INC $8000,X
  $A235  55 3F     EOR $3F,X
  $A237  7F        .db $7F
  $A238  02        .db $02
  $A239  DE FE 00  DEC $00FE,X
  $A23C  FF        .db $FF
  $A23D  AA        TAX
  $A23E  C0 80     CPY #$80
  $A240  6B        .db $6B
  $A241  6F        .db $6F
  $A242  37        .db $37
  $A243  00        BRK
  $A244  F6 1A     INC $1A,X
  $A246  8A        TXA
  $A247  1A        .db $1A
  $A248  2A        ROL
  $A249  12        .db $12
  $A24A  48        PHA
  $A24B  00        BRK
  $A24C  F6 FE     INC $FE,X
  $A24E  FE FC 76  INC $76FC,X
  $A251  DE 3E FE  DEC $FE3E,X
  $A254  FC        .db $FC
  $A255  00        BRK
  $A256  FF        .db $FF
  $A257  0C        .db $0C
  $A258  EC 28 C0  CPX $C028
  $A25B  00        BRK
  $A25C  02        .db $02
  $A25D  00        BRK
  $A25E  FF        .db $FF
  $A25F  F3        .db $F3
  $A260  06 1A     ASL $1A
  $A262  9E        .db $9E
  $A263  00        BRK
  $A264  7F        .db $7F
  $A265  40        RTI
  $A266  59 7B 06  EOR $067B,Y
  $A269  1C        .db $1C
  $A26A  40        RTI
  $A26B  00        BRK
  $A26C  7F        .db $7F
  $A26D  7F        .db $7F
  $A26E  37        .db $37
  $A26F  06 7F     ASL $7F
  $A271  7F        .db $7F
  $A272  5F        .db $5F
  $A273  43        .db $43
  $A274  3F        .db $3F
  $A275  00        BRK
  $A276  E3        .db $E3
  $A277  05 00     ORA $00
  $A279  02        .db $02
  $A27A  20 3C 40  JSR $403C
  $A27D  00        BRK
  $A27E  E3        .db $E3
  $A27F  E7        .db $E7
  $A280  FE FF FF  INC $FFFF,X
  $A283  FF        .db $FF
  $A284  3A        .db $3A
  $A285  FF        .db $FF
  $A286  00        BRK
  $A287  FE C1 00  INC $00C1,X
  $A28A  00        BRK
  $A28B  00        BRK
  $A28C  C5 00     CMP $00
  $A28E  00        BRK
  $A28F  FE 82 98  INC $9882,X
  $A292  FE FE F2  INC $F2FE,X
  $A295  FE 00 00  INC $0000,X
  $A298  FE 7E 20  INC $207E,X
  $A29B  00        BRK
  $A29C  0C        .db $0C
  $A29D  00        BRK
  $A29E  00        BRK
  $A29F  FF        .db $FF
  $A2A0  27        .db $27
  $A2A1  E6 E7     INC $E7
  $A2A3  E5 64     SBC $64
  $A2A5  C7        .db $C7
  $A2A6  00        BRK
  $A2A7  FF        .db $FF
  $A2A8  C3        .db $C3
  $A2A9  C1 80     CMP ($80,X)
  $A2AB  02        .db $02
  $A2AC  83        .db $83
  $A2AD  20 00 FF  JSR $FF00
  $A2B0  80        .db $80
  $A2B1  E9 DF     SBC #$DF
  $A2B3  FF        .db $FF
  $A2B4  99 FF 00  STA $00FF,Y
  $A2B7  CE FF 7E  DEC $7EFF
  $A2BA  38        SEC
  $A2BB  00        BRK
  $A2BC  66 00     ROR $00

L_A2BE:
  $A2BE  00        BRK
  $A2BF  DF        .db $DF
  $A2C0  32        .db $32
  $A2C1  FF        .db $FF
  $A2C2  FF        .db $FF
  $A2C3  FF        .db $FF
  $A2C4  00        BRK
  $A2C5  22        .db $22
  $A2C6  37        .db $37
  $A2C7  F7        .db $F7
  $A2C8  CF        .db $CF
  $A2C9  44        .db $44
  $A2CA  00        BRK
  $A2CB  00        BRK
  $A2CC  00        BRK
  $A2CD  F7        .db $F7
  $A2CE  E1 C0     SBC ($C0,X)
  $A2D0  F7        .db $F7
  $A2D1  00        BRK
  $A2D2  00        BRK
  $A2D3  66 7E     ROR $7E
  $A2D5  7E 00 00  ROR $0000,X
  $A2D8  00        BRK
  $A2D9  00        BRK
  $A2DA  7E 3C 30  ROR $303C,X
  $A2DD  00        BRK
  $A2DE  00        BRK
  $A2DF  DF        .db $DF
  $A2E0  50 DC     BVC $A2BE
  $A2E2  DE DF 00  DEC $00DF,X
  $A2E5  00        BRK
  $A2E6  80        .db $80
  $A2E7  EF        .db $EF
  $A2E8  8F        .db $8F
  $A2E9  0F        .db $0F
  $A2EA  03        .db $03
  $A2EB  00        BRK
  $A2EC  00        BRK
  $A2ED  FF        .db $FF
  $A2EE  FF        .db $FF
  $A2EF  73        .db $73
  $A2F0  FF        .db $FF
  $A2F1  00        BRK
  $A2F2  00        BRK
  $A2F3  C4 FF     CPY $FF
  $A2F5  FF        .db $FF
  $A2F6  00        BRK
  $A2F7  00        BRK
  $A2F8  00        BRK
  $A2F9  00        BRK
  $A2FA  FF        .db $FF
  $A2FB  7F        .db $7F
  $A2FC  26 00     ROL $00
  $A2FE  00        BRK
  $A2FF  F7        .db $F7
  $A300  54        .db $54
  $A301  D4        .db $D4
  $A302  DF        .db $DF
  $A303  00        BRK
  $A304  F8        SED
  $A305  04        .db $04
  $A306  76 00     ROR $00,X
  $A308  8F        .db $8F
  $A309  0F        .db $0F
  $A30A  00        BRK
  $A30B  00        BRK
  $A30C  FE FE 88  INC $88FE,X
  $A30F  00        BRK
  $A310  EF        .db $EF
  $A311  E4 AC     CPX $AC
  $A313  00        BRK
  $A314  BC 98 06  LDY $0698,X
  $A317  00        BRK
  $A318  EF        .db $EF
  $A319  CF        .db $CF
  $A31A  43        .db $43
  $A31B  00        BRK
  $A31C  BE BE B8  LDX $B8BE,Y
  $A31F  00        BRK
  $A320  40        RTI
  $A321  74        .db $74
  $A322  77        .db $77
  $A323  00        BRK
  $A324  78        SEI
  $A325  E9 B9     SBC #$B9
  $A327  00        BRK
  $A328  F7        .db $F7
  $A329  F3        .db $F3
  $A32A  80        .db $80
  $A32B  00        BRK
  $A32C  FD 7C 44  SBC $447C,X
  $A32F  00        BRK
  $A330  BF        .db $BF
  $A331  2A        ROL
  $A332  BC 00 FB  LDY $FB00,X
  $A335  31 42     AND ($42),Y
  $A337  00        BRK
  $A338  BF        .db $BF
  $A339  9F        .db $9F
  $A33A  03        .db $03
  $A33B  00        BRK
  $A33C  FB        .db $FB
  $A33D  FB        .db $FB
  $A33E  B9 00 FB  LDA $FB00,Y
  $A341  71 40     ADC ($40),Y
  $A343  00        BRK
  $A344  BF        .db $BF
  $A345  BF        .db $BF
  $A346  0C        .db $0C
  $A347  00        BRK
  $A348  FB        .db $FB
  $A349  FB        .db $FB
  $A34A  FB        .db $FB
  $A34B  00        BRK
  $A34C  BF        .db $BF
  $A34D  BF        .db $BF
  $A34E  BF        .db $BF
  $A34F  00        BRK
  $A350  9F        .db $9F
  $A351  8F        .db $8F
  $A352  00        BRK
  $A353  00        BRK
  $A354  BC B8 00  LDY $00B8,X
  $A357  00        BRK
  $A358  DF        .db $DF
  $A359  DF        .db $DF
  $A35A  DF        .db $DF
  $A35B  00        BRK
  $A35C  BE BE BE  LDX $BEBE,Y
  $A35F  00        BRK
  $A360  FE FC 18  INC $18FC,X
  $A363  00        BRK
  $A364  9F        .db $9F
  $A365  1F        .db $1F
  $A366  07        .db $07
  $A367  00        BRK
  $A368  FE FE FE  INC $FEFE,X
  $A36B  00        BRK
  $A36C  BF        .db $BF
  $A36D  BF        .db $BF
  $A36E  BF        .db $BF
  $A36F  00        BRK
  $A370  EF        .db $EF
  $A371  C7        .db $C7
  $A372  80        .db $80
  $A373  00        BRK
  $A374  F3        .db $F3
  $A375  63        .db $63
  $A376  00        BRK
  $A377  00        BRK
  $A378  EF        .db $EF
  $A379  EF        .db $EF
  $A37A  EF        .db $EF
  $A37B  00        BRK
  $A37C  FB        .db $FB
  $A37D  FB        .db $FB
  $A37E  FB        .db $FB
  $A37F  00        BRK
  $A380  DD 1C D1  CMP $D11C,X
  $A383  00        BRK
  $A384  EF        .db $EF
  $A385  8C EF 00  STY $00EF
  $A388  DD DD 0C  CMP $0CDD,X
  $A38B  00        BRK
  $A38C  EF        .db $EF
  $A38D  E7        .db $E7
  $A38E  02        .db $02
  $A38F  00        BRK
  $A390  62        .db $62
  $A391  04        .db $04
  $A392  FE 00 CF  INC $CF00,X
  $A395  50 5C     BVC $A3F3
  $A397  DF        .db $DF
  $A398  FE FE 88  INC $88FE,X
  $A39B  00        BRK
  $A39C  DF        .db $DF
  $A39D  9F        .db $9F
  $A39E  8B        .db $8B
  $A39F  00        BRK
  $A3A0  E7        .db $E7
  $A3A1  63        .db $63
  $A3A2  AC 00 BC  LDY $BC00
  $A3A5  AA        TAX
  $A3A6  3F        .db $3F
  $A3A7  00        BRK
  $A3A8  EF        .db $EF
  $A3A9  EF        .db $EF
  $A3AA  43        .db $43
  $A3AB  00        BRK
  $A3AC  BF        .db $BF
  $A3AD  1F        .db $1F
  $A3AE  80        .db $80
  $A3AF  00        BRK
  $A3B0  FD E9 F9  SBC $F9E9,X
  $A3B3  00        BRK
  $A3B4  F7        .db $F7
  $A3B5  30 56     BMI $A40D
  $A3B7  F7        .db $F7
  $A3B8  FD 7C 44  SBC $447C,X
  $A3BB  00        BRK
  $A3BC  F7        .db $F7
  $A3BD  F7        .db $F7
  $A3BE  E1 00     SBC ($00,X)
  $A3C0  00        BRK
  $A3C1  7E 46 6E  ROR $6E46,X
  $A3C4  7E 00 40  ROR $4000,X
  $A3C7  36 00     ROL $00,X
  $A3C9  7E 38 10  ROR $1038,X
  $A3CC  00        BRK
  $A3CD  00        BRK
  $A3CE  F7        .db $F7
  $A3CF  E3        .db $E3
  $A3D0  57        .db $57
  $A3D1  F7        .db $F7
  $A3D2  F7        .db $F7
  $A3D3  00        BRK
  $A3D4  00        BRK
  $A3D5  32        .db $32
  $A3D6  FF        .db $FF
  $A3D7  FF        .db $FF
  $A3D8  E1 80     SBC ($80,X)
  $A3DA  00        BRK
  $A3DB  00        BRK
  $A3DC  FF        .db $FF
  $A3DD  CF        .db $CF
  $A3DE  44        .db $44
  $A3DF  00        BRK
  $A3E0  00        BRK
  $A3E1  FF        .db $FF
  $A3E2  D1 FF     CMP ($FF),Y
  $A3E4  FF        .db $FF
  $A3E5  00        BRK
  $A3E6  04        .db $04
  $A3E7  43        .db $43
  $A3E8  00        BRK
  $A3E9  FF        .db $FF
  $A3EA  7E 26 00  ROR $0026,X
  $A3ED  00        BRK
  $A3EE  FF        .db $FF
  $A3EF  FF        .db $FF
  $A3F0  E4 FF     CPX $FF
  $A3F2  FF        .db $FF

L_A3F3:
  $A3F3  00        BRK
  $A3F4  8E D0 DD  STX $DDD0
  $A3F7  DF        .db $DF
  $A3F8  7F        .db $7F
  $A3F9  0C        .db $0C
  $A3FA  00        BRK
  $A3FB  00        BRK
  $A3FC  DF        .db $DF
  $A3FD  0F        .db $0F
  $A3FE  0F        .db $0F
  $A3FF  02        .db $02
  $A400  FA        .db $FA
  $A401  44        .db $44
  $A402  AA        TAX
  $A403  FC        .db $FC
  $A404  00        BRK
  $A405  80        .db $80
  $A406  5D 3F 06  EOR $063F,X
  $A409  BE FE FC  LDX $FCFE,Y
  $A40C  00        BRK

L_A40D:
  $A40D  FF        .db $FF
  $A40E  A2 C0     LDX #$C0
  $A410  7F        .db $7F
  $A411  7F        .db $7F
  $A412  7F        .db $7F
  $A413  3C        .db $3C
  $A414  A2 FD     LDX #$FD
  $A416  7F        .db $7F
  $A417  00        BRK
  $A418  80        .db $80
  $A419  80        .db $80
  $A41A  80        .db $80
  $A41B  C3        .db $C3
  $A41C  FF        .db $FF
  $A41D  FF        .db $FF
  $A41E  7F        .db $7F
  $A41F  00        BRK
  $A420  7F        .db $7F
  $A421  57        .db $57
  $A422  AA        TAX
  $A423  FF        .db $FF
  $A424  00        BRK
  $A425  02        .db $02
  $A426  54        .db $54
  $A427  FC        .db $FC
  $A428  80        .db $80
  $A429  E8        INX
  $A42A  FF        .db $FF
  $A42B  FF        .db $FF
  $A42C  00        BRK
  $A42D  FE AA 02  INC $02AA,X
  $A430  FC        .db $FC
  $A431  FC        .db $FC
  $A432  FC        .db $FC
  $A433  F2        .db $F2
  $A434  AA        TAX
  $A435  DE FE 00  DEC $00FE,X
  $A438  02        .db $02
  $A439  02        .db $02
  $A43A  02        .db $02
  $A43B  0E FE FE  ASL $FEFE
  $A43E  FE 00 FF  INC $FF00,X
  $A441  00        BRK
  $A442  B8        CLV
  $A443  F8        SED
  $A444  DD FF BF  CMP $BFFF,X
  $A447  99 00 00  STA $0000,Y
  $A44A  FF        .db $FF
  $A44B  7F        .db $7F
  $A44C  27        .db $27
  $A44D  02        .db $02
  $A44E  40        RTI
  $A44F  66 FF     ROR $FF
  $A451  00        BRK
  $A452  FC        .db $FC
  $A453  86 DE     STX $DE
  $A455  96 DE     STX $DE,Y
  $A457  FA        .db $FA
  $A458  00        BRK
  $A459  00        BRK
  $A45A  FC        .db $FC
  $A45B  FC        .db $FC
  $A45C  6A        ROR
  $A45D  68        PLA
  $A45E  20 04 DF  JSR $DF04
  $A461  00        BRK
  $A462  FE 02 9E  INC $9E02,X
  $A465  BE FE F2  LDX $F2FE,Y
  $A468  00        BRK
  $A469  00        BRK
  $A46A  FE FC F8  INC $F8FC,X
  $A46D  F0 40     BEQ $A4AF
  $A46F  0C        .db $0C
  $A470  FE 00 FF  INC $FF00,X
  $A473  88        DEY
  $A474  C5 FF     CMP $FF
  $A476  FF        .db $FF
  $A477  FF        .db $FF
  $A478  00        BRK
  $A479  00        BRK
  $A47A  FF        .db $FF
  $A47B  7F        .db $7F
  $A47C  7B        .db $7B
  $A47D  10 20     BPL $A49F
  $A47F  00        BRK
  $A480  62        .db $62
  $A481  FE 00 7F  INC $7F00,X
  $A484  5C        .db $5C
  $A485  3C        .db $3C
  $A486  47        .db $47
  $A487  4F        .db $4F
  $A488  9C        .db $9C
  $A489  00        BRK
  $A48A  00        BRK
  $A48B  7F        .db $7F
  $A48C  2B        .db $2B
  $A48D  43        .db $43
  $A48E  3C        .db $3C
  $A48F  3C        .db $3C
  $A490  7F        .db $7F
  $A491  7E 3F 00  ROR $003F,X
  $A494  FC        .db $FC
  $A495  AC FE F6  LDY $F6FE
  $A498  10 01     BPL $A49B
  $A49A  40        RTI

L_A49B:
  $A49B  00        BRK
  $A49C  FC        .db $FC
  $A49D  52        .db $52
  $A49E  00        BRK

L_A49F:
  $A49F  08        PHP
  $A4A0  85 FF     STA $FF
  $A4A2  00        BRK
  $A4A3  FC        .db $FC
  $A4A4  3C        .db $3C
  $A4A5  F2        .db $F2
  $A4A6  7E FE 7A  ROR $7AFE,X
  $A4A9  80        .db $80
  $A4AA  00        BRK
  $A4AB  FC        .db $FC
  $A4AC  C6 0C     DEC $0C
  $A4AE  A8        TAY

L_A4AF:
  $A4AF  00        BRK
  $A4B0  FE EE FC  INC $FCEE,X
  $A4B3  00        BRK
  $A4B4  3E 3F 7F  ROL $7F3F,X
  $A4B7  79 04 3C  ADC $3C04,Y
  $A4BA  02        .db $02
  $A4BB  00        BRK
  $A4BC  3F        .db $3F
  $A4BD  50 00     BVC $A4BF

L_A4BF:
  $A4BF  16 7E     ASL $7E,X
  $A4C1  EA        NOP
  $A4C2  FE 6E FC  INC $FC6E,X
  $A4C5  00        BRK
  $A4C6  3C        .db $3C
  $A4C7  5E 80 14  LSR $1480,X
  $A4CA  00        BRK
  $A4CB  90 02     BCC $A4CF
  $A4CD  00        BRK
  $A4CE  3F        .db $3F

L_A4CF:
  $A4CF  29 7F     AND #$7F
  $A4D1  3D 7B 32  AND $327B,X
  $A4D4  20 00 00  JSR $0000
  $A4D7  00        BRK
  $A4D8  00        BRK
  $A4D9  46 58     LSR $58
  $A4DB  10 20     BPL $A4FD
  $A4DD  00        BRK
  $A4DE  00        BRK
  $A4DF  00        BRK
  $A4E0  7F        .db $7F
  $A4E1  7F        .db $7F
  $A4E2  7F        .db $7F
  $A4E3  3D 7F 00  AND $007F,X
  $A4E6  DC        .db $DC
  $A4E7  FC        .db $FC
  $A4E8  00        BRK
  $A4E9  00        BRK
  $A4EA  00        BRK
  $A4EB  42        .db $42
  $A4EC  40        RTI
  $A4ED  00        BRK
  $A4EE  FC        .db $FC
  $A4EF  06 FE     ASL $FE
  $A4F1  F2        .db $F2
  $A4F2  76 24     ROR $24,X
  $A4F4  02        .db $02
  $A4F5  00        BRK
  $A4F6  00        BRK
  $A4F7  00        BRK
  $A4F8  00        BRK
  $A4F9  0C        .db $0C
  $A4FA  84 46     STY $46
  $A4FC  22        .db $22

L_A4FD:
  $A4FD  00        BRK
  $A4FE  00        BRK
  $A4FF  00        BRK
  $A500  3F        .db $3F
  $A501  0F        .db $0F
  $A502  C7        .db $C7

L_A503:
  $A503  9F        .db $9F
  $A504  3E 0F CF  ROL $CF0F,X
  $A507  E1 07     SBC ($07,X)
  $A509  F0 F8     BEQ $A503
  $A50B  E0 C7     CPX #$C7
  $A50D  F3        .db $F3

L_A50E:
  $A50E  F0 FE     BEQ $A50E
  $A510  FC        .db $FC
  $A511  3F        .db $3F
  $A512  87        .db $87
  $A513  C7        .db $C7
  $A514  F1 87     SBC ($87),Y

L_A516:
  $A516  F0 FE     BEQ $A516
  $A518  7F        .db $7F
  $A519  C7        .db $C7
  $A51A  F8        SED
  $A51B  F8        SED
  $A51C  FE F8 FF  INC $FFF8,X
  $A51F  3F        .db $3F
  $A520  00        BRK
  $A521  E3        .db $E3
  $A522  FC        .db $FC
  $A523  FD F9 9E  SBC $9EF9,X

L_A526:
  $A526  E4 FE     CPX $FE
  $A528  00        BRK
  $A529  FC        .db $FC
  $A52A  3F        .db $3F
  $A52B  0E 1E E7  ASL $E71E
  $A52E  3B        .db $3B
  $A52F  7F        .db $7F
  $A530  FF        .db $FF
  $A531  CF        .db $CF
  $A532  F3        .db $F3
  $A533  F9 F8 FD  SBC $FDF8,Y
  $A536  FF        .db $FF
  $A537  1F        .db $1F
  $A538  03        .db $03
  $A539  F0 7C     BEQ $A5B7
  $A53B  1E 3F 0E  ASL $0E3F,X
  $A53E  07        .db $07
  $A53F  E0 03     CPX #$03
  $A541  F8        SED
  $A542  FE F0 FF  INC $FFF0,X
  $A545  1F        .db $1F
  $A546  FF        .db $FF
  $A547  67        .db $67
  $A548  0C        .db $0C
  $A549  3F        .db $3F
  $A54A  0F        .db $0F
  $A54B  1F        .db $1F
  $A54C  0F        .db $0F
  $A54D  E1 0F     SBC ($0F,X)
  $A54F  98        TYA
  $A550  CF        .db $CF
  $A551  33        .db $33
  $A552  FA        .db $FA
  $A553  FF        .db $FF
  $A554  FE 30 1E  INC $1E30,X
  $A557  8F        .db $8F
  $A558  F0 CC     BEQ $A526
  $A55A  FF        .db $FF
  $A55B  1F        .db $1F
  $A55C  07        .db $07
  $A55D  CF        .db $CF
  $A55E  E1 F0     SBC ($F0,X)
  $A560  9C        .db $9C
  $A561  FF        .db $FF
  $A562  3F        .db $3F
  $A563  FF        .db $FF
  $A564  1E C7 1F  ASL $1FC7,X
  $A567  C7        .db $C7
  $A568  1F        .db $1F
  $A569  0F        .db $0F
  $A56A  C7        .db $C7
  $A56B  07        .db $07
  $A56C  E3        .db $E3
  $A56D  F9 E3 F8  SBC $F8E3,Y
  $A570  E1 FE     SBC ($FE,X)
  $A572  3F        .db $3F
  $A573  9F        .db $9F
  $A574  3F        .db $3F
  $A575  73        .db $73
  $A576  0F        .db $0F
  $A577  E3        .db $E3
  $A578  7E FF C3  ROR $C3FF,X
  $A57B  E1 C0     SBC ($C0,X)
  $A57D  8F        .db $8F
  $A57E  F3        .db $F3
  $A57F  FC        .db $FC
  $A580  F0 3E     BEQ $A5C0
  $A582  1F        .db $1F
  $A583  9F        .db $9F
  $A584  CF        .db $CF
  $A585  5F        .db $5F
  $A586  87        .db $87
  $A587  CF        .db $CF
  $A588  00        BRK
  $A589  C0 E0     CPY #$E0
  $A58B  E0 F1     CPX #$F1
  $A58D  E0 FC     CPX #$FC
  $A58F  3E F9 F8  ROL $F8F9,X
  $A592  FC        .db $FC
  $A593  FC        .db $FC
  $A594  5C        .db $5C
  $A595  0E 6E F2  ASL $F26E
  $A598  1F        .db $1F
  $A599  87        .db $87
  $A59A  C7        .db $C7
  $A59B  FF        .db $FF
  $A59C  FF        .db $FF
  $A59D  FF        .db $FF
  $A59E  9F        .db $9F
  $A59F  0F        .db $0F
  $A5A0  00        BRK
  $A5A1  00        BRK
  $A5A2  00        BRK
  $A5A3  C0 E0     CPY #$E0
  $A5A5  E0 F0     CPX #$F0
  $A5A7  F8        SED
  $A5A8  00        BRK
  $A5A9  00        BRK
  $A5AA  00        BRK
  $A5AB  00        BRK
  $A5AC  80        .db $80
  $A5AD  C0 F0     CPY #$F0
  $A5AF  F8        SED
  $A5B0  F8        SED
  $A5B1  3C        .db $3C
  $A5B2  0C        .db $0C
  $A5B3  CC E6 F2  CPY $F2E6
  $A5B6  F8        SED

L_A5B7:
  $A5B7  FC        .db $FC
  $A5B8  F8        SED
  $A5B9  FC        .db $FC
  $A5BA  FC        .db $FC
  $A5BB  3C        .db $3C
  $A5BC  1E 8E 86  ASL $868E,X
  $A5BF  C2        .db $C2

L_A5C0:
  $A5C0  F2        .db $F2
  $A5C1  F8        SED
  $A5C2  78        SEI
  $A5C3  7C        .db $7C
  $A5C4  3C        .db $3C
  $A5C5  3D 1F 1F  AND $1F1F,X
  $A5C8  0F        .db $0F
  $A5C9  47        .db $47
  $A5CA  67        .db $67
  $A5CB  67        .db $67
  $A5CC  67        .db $67
  $A5CD  76 76     ROR $76,X
  $A5CF  3F        .db $3F
  $A5D0  2F        .db $2F
  $A5D1  2E 66 72  ROL $7266
  $A5D4  72        .db $72
  $A5D5  7A        .db $7A
  $A5D6  78        SEI
  $A5D7  7C        .db $7C
  $A5D8  1F        .db $1F
  $A5D9  1F        .db $1F
  $A5DA  1F        .db $1F
  $A5DB  0F        .db $0F
  $A5DC  0F        .db $0F
  $A5DD  07        .db $07
  $A5DE  47        .db $47
  $A5DF  43        .db $43
  $A5E0  7C        .db $7C
  $A5E1  7E 7E 3F  ROR $3F7E,X
  $A5E4  B7        .db $B7
  $A5E5  97        .db $97
  $A5E6  93        .db $93
  $A5E7  DB        .db $DB
  $A5E8  C2        .db $C2
  $A5E9  E0 F8     CPX #$F8
  $A5EB  FC        .db $FC
  $A5EC  7C        .db $7C
  $A5ED  7E 7E 36  ROR $367E,X
  $A5F0  DB        .db $DB
  $A5F1  CD CD EF  CMP $EFCD
  $A5F4  EF        .db $EF
  $A5F5  EF        .db $EF
  $A5F6  FF        .db $FF
  $A5F7  FF        .db $FF
  $A5F8  37        .db $37
  $A5F9  33        .db $33
  $A5FA  3B        .db $3B
  $A5FB  19 19 19  ORA $1919,Y
  $A5FE  18        CLC
  $A5FF  1C        .db $1C
  $A600  7C        .db $7C
  $A601  FC        .db $FC
  $A602  7C        .db $7C
  $A603  3D 3D 3F  AND $3F3D,X
  $A606  5B        .db $5B
  $A607  DF        .db $DF
  $A608  43        .db $43
  $A609  E3        .db $E3
  $A60A  E3        .db $E3
  $A60B  E2        .db $E2
  $A60C  E2        .db $E2
  $A60D  E8        INX
  $A60E  BC 3C D7  LDY $D73C,X
  $A611  C7        .db $C7
  $A612  E7        .db $E7
  $A613  E5 E5     SBC $E5
  $A615  EC F8 F8  CPX $F8F8
  $A618  3C        .db $3C
  $A619  3E 1E 1F  ROL $1F1E,X
  $A61C  9F        .db $9F
  $A61D  9F        .db $9F
  $A61E  9F        .db $9F
  $A61F  9F        .db $9F
  $A620  7F        .db $7F
  $A621  7F        .db $7F
  $A622  7F        .db $7F
  $A623  75 65     ADC $65,X
  $A625  6D 49 C9  ADC $C949
  $A628  8C CC CC  STY $CCCC
  $A62B  DE FE F6  DEC $F6FE,X
  $A62E  B7        .db $B7

L_A62F:
  $A62F  37        .db $37
  $A630  CC DC DE  CPY $DEDC
  $A633  DE DE FE  DEC $FEDE,X
  $A636  FF        .db $FF
  $A637  FF        .db $FF
  $A638  33        .db $33
  $A639  23        .db $23
  $A63A  A1 A1     LDA ($A1,X)
  $A63C  A9 89     LDA #$89
  $A63E  99 99 FF  STA $FF99,Y
  $A641  00        BRK
  $A642  B8        CLV
  $A643  F8        SED
  $A644  DD FF BF  CMP $BFFF,X
  $A647  BF        .db $BF
  $A648  00        BRK
  $A649  00        BRK
  $A64A  FF        .db $FF
  $A64B  7F        .db $7F
  $A64C  27        .db $27
  $A64D  02        .db $02
  $A64E  5E 7F FB  LSR $FB7F,X
  $A651  00        BRK
  $A652  FC        .db $FC
  $A653  FE FE EE  INC $EEFE,X
  $A656  FC        .db $FC
  $A657  FE FB 00  INC $00FB,X
  $A65A  FC        .db $FC
  $A65B  FE FE EE  INC $EEFE,X
  $A65E  FC        .db $FC
  $A65F  FE DF 00  INC $00DF,X
  $A662  FE 02 9E  INC $9E02,X
  $A665  BE FE FA  LDX $FAFE,Y
  $A668  00        BRK
  $A669  00        BRK
  $A66A  FE FC F8  INC $F8FC,X
  $A66D  F0 C0     BEQ $A62F
  $A66F  EC FE 00  CPX $00FE
  $A672  7F        .db $7F
  $A673  FF        .db $FF
  $A674  FB        .db $FB
  $A675  FF        .db $FF
  $A676  FF        .db $FF
  $A677  FF        .db $FF
  $A678  FA        .db $FA
  $A679  00        BRK
  $A67A  7F        .db $7F
  $A67B  FF        .db $FF
  $A67C  FB        .db $FB
  $A67D  FF        .db $FF
  $A67E  FF        .db $FF
  $A67F  FF        .db $FF
  $A680  62        .db $62
  $A681  FE 00 7F  INC $7F00,X
  $A684  5C        .db $5C
  $A685  3C        .db $3C
  $A686  47        .db $47
  $A687  5F        .db $5F
  $A688  9C        .db $9C
  $A689  00        BRK
  $A68A  00        BRK
  $A68B  7F        .db $7F
  $A68C  2B        .db $2B
  $A68D  43        .db $43
  $A68E  3C        .db $3C
  $A68F  3F        .db $3F
  $A690  7F        .db $7F
  $A691  7F        .db $7F
  $A692  3B        .db $3B
  $A693  00        BRK
  $A694  FC        .db $FC
  $A695  FE FE F6  INC $F6FE,X
  $A698  7F        .db $7F
  $A699  7F        .db $7F
  $A69A  3B        .db $3B
  $A69B  00        BRK
  $A69C  FC        .db $FC
  $A69D  FE FE FE  INC $FEFE,X
  $A6A0  85 FF     STA $FF
  $A6A2  00        BRK
  $A6A3  FC        .db $FC
  $A6A4  3C        .db $3C
  $A6A5  F2        .db $F2
  $A6A6  7E FE 7A  ROR $7AFE,X
  $A6A9  80        .db $80
  $A6AA  00        BRK
  $A6AB  FC        .db $FC
  $A6AC  C6 0C     DEC $0C
  $A6AE  A8        TAY
  $A6AF  DC        .db $DC
  $A6B0  FE 7E FC  INC $FC7E,X
  $A6B3  00        BRK
  $A6B4  3F        .db $3F
  $A6B5  7F        .db $7F
  $A6B6  7F        .db $7F
  $A6B7  7F        .db $7F
  $A6B8  FE 7E FC  INC $FC7E,X
  $A6BB  00        BRK
  $A6BC  3F        .db $3F
  $A6BD  7F        .db $7F
  $A6BE  7F        .db $7F
  $A6BF  7F        .db $7F
  $A6C0  78        SEI
  $A6C1  20 40 00  JSR $0040
  $A6C4  00        BRK
  $A6C5  00        BRK
  $A6C6  00        BRK
  $A6C7  00        BRK
  $A6C8  60        RTS
  $A6C9  40        RTI
  $A6CA  00        BRK
  $A6CB  00        BRK
  $A6CC  00        BRK
  $A6CD  00        BRK
  $A6CE  00        BRK
  $A6CF  00        BRK
  $A6D0  00        BRK
  $A6D1  00        BRK
  $A6D2  00        BRK
  $A6D3  00        BRK
  $A6D4  40        RTI
  $A6D5  00        BRK
  $A6D6  78        SEI
  $A6D7  00        BRK
  $A6D8  00        BRK
  $A6D9  00        BRK
  $A6DA  00        BRK
  $A6DB  00        BRK
  $A6DC  40        RTI
  $A6DD  60        RTS
  $A6DE  00        BRK
  $A6DF  00        BRK
  $A6E0  1E 04 02  ASL $0204,X
  $A6E3  00        BRK
  $A6E4  00        BRK
  $A6E5  00        BRK
  $A6E6  00        BRK
  $A6E7  00        BRK
  $A6E8  06 02     ASL $02
  $A6EA  00        BRK
  $A6EB  00        BRK
  $A6EC  00        BRK
  $A6ED  00        BRK
  $A6EE  00        BRK
  $A6EF  00        BRK
  $A6F0  00        BRK
  $A6F1  00        BRK
  $A6F2  00        BRK
  $A6F3  00        BRK
  $A6F4  02        .db $02
  $A6F5  00        BRK
  $A6F6  1E 00 00  ASL $0000,X
  $A6F9  00        BRK
  $A6FA  00        BRK
  $A6FB  00        BRK
  $A6FC  02        .db $02
  $A6FD  06 00     ASL $00
  $A6FF  00        BRK
  $A700  54        .db $54
  $A701  D4        .db $D4
  $A702  DF        .db $DF
  $A703  00        BRK
  $A704  F8        SED
  $A705  04        .db $04
  $A706  7E 00 8F  ROR $8F00,X
  $A709  0F        .db $0F
  $A70A  00        BRK
  $A70B  00        BRK
  $A70C  FE FE BE  INC $BEFE,X
  $A70F  00        BRK
  $A710  EF        .db $EF
  $A711  EF        .db $EF
  $A712  EF        .db $EF
  $A713  00        BRK
  $A714  BE BE BE  LDX $BEBE,Y
  $A717  00        BRK
  $A718  EF        .db $EF
  $A719  EF        .db $EF
  $A71A  EF        .db $EF
  $A71B  00        BRK
  $A71C  BE BE BE  LDX $BEBE,Y
  $A71F  00        BRK
  $A720  40        RTI
  $A721  74        .db $74
  $A722  77        .db $77
  $A723  00        BRK
  $A724  78        SEI
  $A725  E9 FD     SBC #$FD
  $A727  00        BRK
  $A728  F7        .db $F7
  $A729  F3        .db $F3
  $A72A  80        .db $80
  $A72B  00        BRK
  $A72C  FD FC FC  SBC $FCFC,X
  $A72F  00        BRK
  $A730  BF        .db $BF
  $A731  BF        .db $BF
  $A732  BF        .db $BF
  $A733  00        BRK
  $A734  FB        .db $FB
  $A735  FB        .db $FB
  $A736  FB        .db $FB
  $A737  00        BRK
  $A738  BF        .db $BF
  $A739  BF        .db $BF
  $A73A  BF        .db $BF
  $A73B  00        BRK
  $A73C  FB        .db $FB
  $A73D  FB        .db $FB
  $A73E  FB        .db $FB
  $A73F  00        BRK
  $A740  FB        .db $FB
  $A741  71 40     ADC ($40),Y
  $A743  00        BRK
  $A744  BF        .db $BF
  $A745  BF        .db $BF
  $A746  3F        .db $3F
  $A747  00        BRK
  $A748  FB        .db $FB
  $A749  FB        .db $FB
  $A74A  FB        .db $FB
  $A74B  00        BRK
  $A74C  BF        .db $BF
  $A74D  BF        .db $BF
  $A74E  BF        .db $BF
  $A74F  00        BRK
  $A750  DF        .db $DF
  $A751  D7        .db $D7
  $A752  DF        .db $DF
  $A753  00        BRK
  $A754  BE BE BC  LDX $BCBE,Y
  $A757  00        BRK
  $A758  DF        .db $DF
  $A759  D7        .db $D7
  $A75A  DF        .db $DF
  $A75B  00        BRK
  $A75C  BE BE BC  LDX $BCBE,Y
  $A75F  00        BRK
  $A760  FE FC 18  INC $18FC,X
  $A763  00        BRK
  $A764  9F        .db $9F
  $A765  1F        .db $1F
  $A766  BF        .db $BF
  $A767  00        BRK
  $A768  FE FE FE  INC $FEFE,X
  $A76B  00        BRK
  $A76C  BF        .db $BF
  $A76D  BF        .db $BF
  $A76E  BF        .db $BF
  $A76F  00        BRK
  $A770  EF        .db $EF
  $A771  EF        .db $EF
  $A772  E7        .db $E7
  $A773  00        BRK
  $A774  FB        .db $FB
  $A775  DB        .db $DB
  $A776  F3        .db $F3
  $A777  00        BRK
  $A778  EF        .db $EF
  $A779  EF        .db $EF
  $A77A  E7        .db $E7
  $A77B  00        BRK
  $A77C  FB        .db $FB
  $A77D  DB        .db $DB
  $A77E  F3        .db $F3
  $A77F  00        BRK
  $A780  DD 1C D1  CMP $D11C,X
  $A783  00        BRK
  $A784  EF        .db $EF
  $A785  8C E7 00  STY $00E7
  $A788  DD DD 0C  CMP $0CDD,X
  $A78B  00        BRK
  $A78C  EF        .db $EF
  $A78D  E7        .db $E7
  $A78E  E7        .db $E7
  $A78F  00        BRK
  $A790  FE FA FC  INC $FCFA,X
  $A793  00        BRK
  $A794  CF        .db $CF
  $A795  DF        .db $DF
  $A796  DF        .db $DF
  $A797  DF        .db $DF
  $A798  FE FA FC  INC $FCFA,X
  $A79B  00        BRK
  $A79C  CF        .db $CF
  $A79D  DF        .db $DF
  $A79E  DF        .db $DF
  $A79F  DF        .db $DF
  $A7A0  E7        .db $E7
  $A7A1  63        .db $63
  $A7A2  AC 00 BC  LDY $BC00
  $A7A5  AA        TAX
  $A7A6  3F        .db $3F
  $A7A7  00        BRK
  $A7A8  EF        .db $EF
  $A7A9  EF        .db $EF
  $A7AA  43        .db $43
  $A7AB  00        BRK
  $A7AC  BF        .db $BF
  $A7AD  1F        .db $1F
  $A7AE  BF        .db $BF
  $A7AF  00        BRK
  $A7B0  FD FD 6D  SBC $6DFD,X
  $A7B3  00        BRK
  $A7B4  F7        .db $F7
  $A7B5  F7        .db $F7
  $A7B6  F7        .db $F7
  $A7B7  F7        .db $F7
  $A7B8  FD FD 6D  SBC $6DFD,X
  $A7BB  00        BRK
  $A7BC  F7        .db $F7
  $A7BD  F7        .db $F7
  $A7BE  F7        .db $F7
  $A7BF  F7        .db $F7
  $A7C0  00        BRK
  $A7C1  7E 46 6E  ROR $6E46,X
  $A7C4  7E 00 47  ROR $4700,X
  $A7C7  77        .db $77
  $A7C8  00        BRK
  $A7C9  7E 38 10  ROR $1038,X
  $A7CC  00        BRK
  $A7CD  00        BRK
  $A7CE  F7        .db $F7
  $A7CF  F7        .db $F7
  $A7D0  F7        .db $F7
  $A7D1  F7        .db $F7
  $A7D2  F3        .db $F3
  $A7D3  00        BRK
  $A7D4  FF        .db $FF
  $A7D5  FF        .db $FF
  $A7D6  EF        .db $EF
  $A7D7  FF        .db $FF
  $A7D8  F7        .db $F7
  $A7D9  F7        .db $F7
  $A7DA  F3        .db $F3
  $A7DB  00        BRK
  $A7DC  FF        .db $FF
  $A7DD  FF        .db $FF
  $A7DE  EF        .db $EF
  $A7DF  FF        .db $FF
  $A7E0  00        BRK
  $A7E1  FF        .db $FF
  $A7E2  D1 FF     CMP ($FF),Y
  $A7E4  FF        .db $FF
  $A7E5  00        BRK
  $A7E6  C4 F3     CPY $F3
  $A7E8  00        BRK
  $A7E9  FF        .db $FF
  $A7EA  7E 26 00  ROR $0026,X
  $A7ED  00        BRK
  $A7EE  FF        .db $FF
  $A7EF  FF        .db $FF
  $A7F0  FF        .db $FF
  $A7F1  7F        .db $7F
  $A7F2  FF        .db $FF
  $A7F3  00        BRK
  $A7F4  8F        .db $8F
  $A7F5  DB        .db $DB
  $A7F6  DF        .db $DF
  $A7F7  DF        .db $DF
  $A7F8  FF        .db $FF
  $A7F9  7F        .db $7F
  $A7FA  FF        .db $FF
  $A7FB  00        BRK
  $A7FC  8F        .db $8F
  $A7FD  DB        .db $DB

L_A7FE:
  $A7FE  DF        .db $DF
  $A7FF  DF        .db $DF
  $A800  32        .db $32
  $A801  FF        .db $FF
  $A802  FF        .db $FF
  $A803  FF        .db $FF
  $A804  00        BRK
  $A805  22        .db $22
  $A806  37        .db $37
  $A807  F7        .db $F7
  $A808  CF        .db $CF
  $A809  44        .db $44
  $A80A  00        BRK
  $A80B  00        BRK
  $A80C  00        BRK
  $A80D  F7        .db $F7
  $A80E  F7        .db $F7
  $A80F  F7        .db $F7
  $A810  E7        .db $E7
  $A811  00        BRK
  $A812  6C 7E 7E  JMP ($7E7E)
  $A815  76 00     ROR $00,X
  $A817  DF        .db $DF
  $A818  E7        .db $E7
  $A819  00        BRK
  $A81A  6C 7E 7E  JMP ($7E7E)
  $A81D  76 00     ROR $00,X
  $A81F  DF        .db $DF
  $A820  50 DC     BVC $A7FE
  $A822  DE DF 00  DEC $00DF,X
  $A825  00        BRK
  $A826  B0 FF     BCS $A827
  $A828  8F        .db $8F
  $A829  0F        .db $0F
  $A82A  03        .db $03
  $A82B  00        BRK
  $A82C  00        BRK
  $A82D  FF        .db $FF
  $A82E  FF        .db $FF
  $A82F  FF        .db $FF
  $A830  FF        .db $FF
  $A831  00        BRK
  $A832  FF        .db $FF
  $A833  FF        .db $FF
  $A834  FF        .db $FF
  $A835  7F        .db $7F
  $A836  00        BRK
  $A837  F7        .db $F7
  $A838  FF        .db $FF
  $A839  00        BRK
  $A83A  FF        .db $FF
  $A83B  FF        .db $FF
  $A83C  FF        .db $FF
  $A83D  7F        .db $7F
  $A83E  00        BRK
  $A83F  F7        .db $F7
  $A840  62        .db $62
  $A841  FE 00 7F  INC $7F00,X
  $A844  5C        .db $5C
  $A845  3C        .db $3C
  $A846  47        .db $47
  $A847  4F        .db $4F
  $A848  9C        .db $9C
  $A849  00        BRK
  $A84A  00        BRK
  $A84B  7F        .db $7F
  $A84C  2B        .db $2B
  $A84D  43        .db $43
  $A84E  3C        .db $3C
  $A84F  3C        .db $3C
  $A850  7F        .db $7F
  $A851  7E 3F 00  ROR $003F,X
  $A854  00        BRK
  $A855  00        BRK
  $A856  00        BRK
  $A857  00        BRK
  $A858  10 01     BPL $A85B
  $A85A  40        RTI

L_A85B:
  $A85B  00        BRK
  $A85C  00        BRK
  $A85D  00        BRK
  $A85E  00        BRK
  $A85F  00        BRK
  $A860  85 FF     STA $FF
  $A862  00        BRK
  $A863  FC        .db $FC
  $A864  3C        .db $3C
  $A865  F2        .db $F2
  $A866  7E FE 7A  ROR $7AFE,X
  $A869  80        .db $80
  $A86A  00        BRK
  $A86B  FC        .db $FC
  $A86C  C6 0C     DEC $0C
  $A86E  A8        TAY
  $A86F  00        BRK
  $A870  FE EE FC  INC $FCEE,X
  $A873  00        BRK
  $A874  00        BRK
  $A875  00        BRK
  $A876  00        BRK
  $A877  00        BRK
  $A878  04        .db $04
  $A879  3C        .db $3C
  $A87A  02        .db $02
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
  $AA00  BF        .db $BF
  $AA01  00        BRK
  $AA02  00        BRK
  $AA03  DB        .db $DB
  $AA04  BB        .db $BB
  $AA05  00        BRK
  $AA06  00        BRK
  $AA07  DF        .db $DF
  $AA08  40        RTI
  $AA09  FF        .db $FF
  $AA0A  FF        .db $FF
  $AA0B  FB        .db $FB
  $AA0C  44        .db $44
  $AA0D  FF        .db $FF
  $AA0E  FF        .db $FF
  $AA0F  FF        .db $FF
  $AA10  F5 00     SBC $00,X
  $AA12  00        BRK
  $AA13  F6 FF     INC $FF,X
  $AA15  00        BRK
  $AA16  00        BRK
  $AA17  EE 0B FF  INC $FF0B
  $AA1A  FF        .db $FF
  $AA1B  FE 00 FF  INC $FF00,X
  $AA1E  FF        .db $FF
  $AA1F  FF        .db $FF
  $AA20  7E 00 00  ROR $0000,X
  $AA23  EF        .db $EF
  $AA24  FB        .db $FB
  $AA25  0A        ASL
  $AA26  2A        ROL
  $AA27  3F        .db $3F
  $AA28  81 FF     STA ($FF,X)
  $AA2A  FF        .db $FF
  $AA2B  FF        .db $FF
  $AA2C  04        .db $04
  $AA2D  FF        .db $FF
  $AA2E  F5 D0     SBC $D0,X
  $AA30  7F        .db $7F
  $AA31  2F        .db $2F
  $AA32  C5 F3     CMP $F3
  $AA34  BE 01 00  LDX $0001,Y
  $AA37  EE D0 30  INC $30D0
  $AA3A  C7        .db $C7
  $AA3B  F3        .db $F3
  $AA3C  5E FF FF  LSR $FFFF,X
  $AA3F  FE BF 00  INC $00BF,X
  $AA42  00        BRK
  $AA43  DB        .db $DB
  $AA44  57        .db $57
  $AA45  AA        TAX
  $AA46  7F        .db $7F
  $AA47  FF        .db $FF
  $AA48  40        RTI
  $AA49  FF        .db $FF
  $AA4A  FF        .db $FF
  $AA4B  FB        .db $FB
  $AA4C  FF        .db $FF
  $AA4D  55 80     EOR $80,X
  $AA4F  00        BRK
  $AA50  FF        .db $FF
  $AA51  7E AB 57  ROR $57AB,X
  $AA54  00        BRK
  $AA55  FF        .db $FF
  $AA56  7F        .db $7F
  $AA57  02        .db $02
  $AA58  00        BRK
  $AA59  81 55     STA ($55,X)
  $AA5B  FF        .db $FF
  $AA5C  00        BRK
  $AA5D  FF        .db $FF
  $AA5E  FF        .db $FF
  $AA5F  FF        .db $FF
  $AA60  7E 00 00  ROR $0000,X
  $AA63  EF        .db $EF
  $AA64  95 EA     STA $EA,X
  $AA66  7D FF 81  ADC $81FF,X
  $AA69  FF        .db $FF
  $AA6A  FF        .db $FF
  $AA6B  FF        .db $FF
  $AA6C  FF        .db $FF
  $AA6D  95 82     STA $82,X
  $AA6F  00        BRK
  $AA70  7F        .db $7F
  $AA71  7D AA D5  ADC $D5AA,X
  $AA74  00        BRK
  $AA75  FF        .db $FF
  $AA76  FF        .db $FF
  $AA77  02        .db $02
  $AA78  80        .db $80
  $AA79  82        .db $82
  $AA7A  D5 FF     CMP $FF,X
  $AA7C  00        BRK
  $AA7D  FF        .db $FF
  $AA7E  FF        .db $FF
  $AA7F  FF        .db $FF
  $AA80  BF        .db $BF
  $AA81  00        BRK
  $AA82  00        BRK
  $AA83  DB        .db $DB
  $AA84  BB        .db $BB
  $AA85  50 54     BVC $AADB
  $AA87  F9 40 FF  SBC $FF40,Y
  $AA8A  FF        .db $FF
  $AA8B  FB        .db $FB
  $AA8C  44        .db $44
  $AA8D  FF        .db $FF
  $AA8E  AF        .db $AF
  $AA8F  07        .db $07
  $AA90  FF        .db $FF
  $AA91  F4        .db $F4
  $AA92  A3        .db $A3
  $AA93  1F        .db $1F
  $AA94  FF        .db $FF
  $AA95  E0 80     CPX #$80
  $AA97  0E 03 0C  ASL $0C03
  $AA9A  E3        .db $E3
  $AA9B  1F        .db $1F
  $AA9C  FC        .db $FC
  $AA9D  FF        .db $FF
  $AA9E  FF        .db $FF
  $AA9F  FF        .db $FF
  $AAA0  7E 00 00  ROR $0000,X
  $AAA3  EF        .db $EF
  $AAA4  FB        .db $FB
  $AAA5  00        BRK
  $AAA6  00        BRK
  $AAA7  7B        .db $7B
  $AAA8  81 FF     STA ($FF,X)
  $AAAA  FF        .db $FF
  $AAAB  FF        .db $FF
  $AAAC  04        .db $04
  $AAAD  FF        .db $FF
  $AAAE  FF        .db $FF
  $AAAF  FB        .db $FB
  $AAB0  1E 00 00  ASL $0000,X
  $AAB3  FB        .db $FB
  $AAB4  B7        .db $B7
  $AAB5  00        BRK
  $AAB6  00        BRK
  $AAB7  EE 61 7F  INC $7F61
  $AABA  FF        .db $FF
  $AABB  FF        .db $FF
  $AABC  48        PHA
  $AABD  FF        .db $FF
  $AABE  FF        .db $FF
  $AABF  FE FF FF  INC $FFFF,X
  $AAC2  FF        .db $FF
  $AAC3  FF        .db $FF
  $AAC4  FF        .db $FF
  $AAC5  FF        .db $FF
  $AAC6  FF        .db $FF
  $AAC7  FF        .db $FF
  $AAC8  F7        .db $F7
  $AAC9  83        .db $83
  $AACA  00        BRK
  $AACB  00        BRK
  $AACC  00        BRK
  $AACD  00        BRK
  $AACE  00        BRK
  $AACF  00        BRK
  $AAD0  FF        .db $FF
  $AAD1  FF        .db $FF
  $AAD2  FF        .db $FF
  $AAD3  FF        .db $FF
  $AAD4  FF        .db $FF
  $AAD5  FF        .db $FF
  $AAD6  FF        .db $FF
  $AAD7  FF        .db $FF
  $AAD8  00        BRK
  $AAD9  00        BRK
  $AADA  00        BRK

L_AADB:
  $AADB  00        BRK
  $AADC  00        BRK
  $AADD  40        RTI
  $AADE  B1 AA     LDA ($AA),Y
  $AAE0  FF        .db $FF
  $AAE1  FF        .db $FF
  $AAE2  FF        .db $FF
  $AAE3  FF        .db $FF
  $AAE4  FF        .db $FF
  $AAE5  FF        .db $FF
  $AAE6  FF        .db $FF
  $AAE7  FF        .db $FF
  $AAE8  FF        .db $FF
  $AAE9  27        .db $27
  $AAEA  00        BRK
  $AAEB  00        BRK
  $AAEC  00        BRK
  $AAED  00        BRK
  $AAEE  00        BRK
  $AAEF  00        BRK
  $AAF0  FF        .db $FF
  $AAF1  FF        .db $FF
  $AAF2  FF        .db $FF
  $AAF3  FF        .db $FF
  $AAF4  FF        .db $FF
  $AAF5  FF        .db $FF
  $AAF6  FF        .db $FF
  $AAF7  FF        .db $FF
  $AAF8  00        BRK
  $AAF9  00        BRK
  $AAFA  00        BRK
  $AAFB  00        BRK
  $AAFC  40        RTI
  $AAFD  A5 42     LDA $42
  $AAFF  F7        .db $F7
  $AB00  00        BRK
  $AB01  00        BRK
  $AB02  00        BRK
  $AB03  00        BRK
  $AB04  00        BRK
  $AB05  00        BRK
  $AB06  00        BRK
  $AB07  00        BRK
  $AB08  00        BRK
  $AB09  00        BRK
  $AB0A  00        BRK
  $AB0B  00        BRK
  $AB0C  00        BRK
  $AB0D  00        BRK
  $AB0E  00        BRK
  $AB0F  00        BRK
  $AB10  00        BRK
  $AB11  00        BRK
  $AB12  00        BRK
  $AB13  00        BRK
  $AB14  00        BRK
  $AB15  00        BRK
  $AB16  00        BRK
  $AB17  00        BRK
  $AB18  00        BRK
  $AB19  00        BRK
  $AB1A  00        BRK
  $AB1B  00        BRK
  $AB1C  00        BRK
  $AB1D  00        BRK
  $AB1E  00        BRK
  $AB1F  00        BRK
  $AB20  00        BRK
  $AB21  00        BRK
  $AB22  00        BRK
  $AB23  00        BRK
  $AB24  00        BRK
  $AB25  00        BRK
  $AB26  00        BRK
  $AB27  00        BRK
  $AB28  00        BRK
  $AB29  00        BRK
  $AB2A  00        BRK
  $AB2B  00        BRK
  $AB2C  00        BRK
  $AB2D  00        BRK
  $AB2E  00        BRK
  $AB2F  00        BRK
  $AB30  00        BRK
  $AB31  00        BRK
  $AB32  00        BRK
  $AB33  00        BRK
  $AB34  00        BRK
  $AB35  00        BRK
  $AB36  00        BRK
  $AB37  00        BRK
  $AB38  00        BRK
  $AB39  00        BRK
  $AB3A  00        BRK
  $AB3B  00        BRK
  $AB3C  00        BRK
  $AB3D  00        BRK
  $AB3E  00        BRK
  $AB3F  00        BRK
  $AB40  00        BRK
  $AB41  01 02     ORA ($02,X)
  $AB43  24 10     BIT $10
  $AB45  18        CLC
  $AB46  24 02     BIT $02
  $AB48  81 83     STA ($83,X)
  $AB4A  A6 BC     LDX $BC
  $AB4C  98        TYA
  $AB4D  BC A6 83  LDY $83A6,X
  $AB50  00        BRK
  $AB51  01 02     ORA ($02,X)
  $AB53  24 10     BIT $10
  $AB55  18        CLC
  $AB56  24 02     BIT $02
  $AB58  81 83     STA ($83,X)
  $AB5A  A6 BC     LDX $BC
  $AB5C  98        TYA
  $AB5D  BC A6 83  LDY $83A6,X
  $AB60  81 83     STA ($83,X)
  $AB62  43        .db $43
  $AB63  25 11     AND $11
  $AB65  19 27 43  ORA $4327,Y
  $AB68  80        .db $80
  $AB69  C2        .db $C2
  $AB6A  66 3C     ROR $3C
  $AB6C  18        CLC
  $AB6D  3C        .db $3C
  $AB6E  66 C2     ROR $C2
  $AB70  81 83     STA ($83,X)
  $AB72  43        .db $43
  $AB73  25 11     AND $11
  $AB75  19 27 43  ORA $4327,Y
  $AB78  80        .db $80
  $AB79  C2        .db $C2
  $AB7A  66 3C     ROR $3C
  $AB7C  18        CLC
  $AB7D  3C        .db $3C
  $AB7E  66 C2     ROR $C2
  $AB80  00        BRK
  $AB81  FF        .db $FF
  $AB82  7F        .db $7F
  $AB83  18        CLC
  $AB84  08        PHP
  $AB85  24 24     BIT $24
  $AB87  02        .db $02
  $AB88  FF        .db $FF
  $AB89  00        BRK
  $AB8A  FF        .db $FF
  $AB8B  98        TYA
  $AB8C  88        DEY
  $AB8D  A4 A6     LDY $A6
  $AB8F  83        .db $83
  $AB90  00        BRK
  $AB91  01 02     ORA ($02,X)
  $AB93  24 10     BIT $10
  $AB95  18        CLC
  $AB96  24 02     BIT $02
  $AB98  81 83     STA ($83,X)
  $AB9A  A6 BC     LDX $BC
  $AB9C  98        TYA
  $AB9D  BC A6 83  LDY $83A6,X
  $ABA0  00        BRK
  $ABA1  FF        .db $FF
  $ABA2  FF        .db $FF
  $ABA3  19 09 25  ORA $2509,Y
  $ABA6  27        .db $27
  $ABA7  43        .db $43
  $ABA8  FF        .db $FF
  $ABA9  00        BRK
  $ABAA  FF        .db $FF
  $ABAB  18        CLC
  $ABAC  08        PHP
  $ABAD  24 66     BIT $66
  $ABAF  C2        .db $C2
  $ABB0  81 83     STA ($83,X)
  $ABB2  43        .db $43
  $ABB3  25 11     AND $11
  $ABB5  19 27 43  ORA $4327,Y
  $ABB8  80        .db $80
  $ABB9  C2        .db $C2
  $ABBA  66 3C     ROR $3C
  $ABBC  18        CLC
  $ABBD  3C        .db $3C
  $ABBE  66 C2     ROR $C2
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
  $ABCA  2D 00 00  AND $0000
  $ABCD  00        BRK
  $ABCE  00        BRK
  $ABCF  00        BRK
  $ABD0  FF        .db $FF
  $ABD1  FF        .db $FF
  $ABD2  FF        .db $FF
  $ABD3  FF        .db $FF
  $ABD4  FF        .db $FF
  $ABD5  FF        .db $FF
  $ABD6  FF        .db $FF

L_ABD7:
  $ABD7  FF        .db $FF
  $ABD8  00        BRK
  $ABD9  00        BRK
  $ABDA  00        BRK
  $ABDB  00        BRK
  $ABDC  0C        .db $0C
  $ABDD  A7        .db $A7
  $ABDE  5C        .db $5C
  $ABDF  FF        .db $FF
  $ABE0  FF        .db $FF
  $ABE1  FF        .db $FF
  $ABE2  FF        .db $FF
  $ABE3  FF        .db $FF
  $ABE4  FF        .db $FF
  $ABE5  FF        .db $FF
  $ABE6  FF        .db $FF

L_ABE7:
  $ABE7  FF        .db $FF
  $ABE8  FF        .db $FF
  $ABE9  FF        .db $FF
  $ABEA  FF        .db $FF
  $ABEB  7F        .db $7F
  $ABEC  2F        .db $2F
  $ABED  01 02     ORA ($02,X)
  $ABEF  00        BRK
  $ABF0  FF        .db $FF
  $ABF1  FF        .db $FF
  $ABF2  FF        .db $FF
  $ABF3  FF        .db $FF
  $ABF4  FF        .db $FF
  $ABF5  FF        .db $FF
  $ABF6  FF        .db $FF
  $ABF7  FF        .db $FF
  $ABF8  00        BRK
  $ABF9  01 17     ORA ($17,X)
  $ABFB  5C        .db $5C
  $ABFC  F9 0F 1F  SBC $1F0F,Y
  $ABFF  FF        .db $FF
  $AC00  7F        .db $7F
  $AC01  4B        .db $4B
  $AC02  4B        .db $4B
  $AC03  50 7B     BVC $AC80
  $AC05  4B        .db $4B
  $AC06  4B        .db $4B
  $AC07  54        .db $54
  $AC08  40        RTI
  $AC09  74        .db $74
  $AC0A  74        .db $74
  $AC0B  7B        .db $7B
  $AC0C  44        .db $44
  $AC0D  74        .db $74
  $AC0E  74        .db $74
  $AC0F  7F        .db $7F
  $AC10  7F        .db $7F
  $AC11  4B        .db $4B
  $AC12  4B        .db $4B
  $AC13  74        .db $74
  $AC14  7F        .db $7F
  $AC15  4B        .db $4B
  $AC16  4B        .db $4B
  $AC17  64        .db $64
  $AC18  40        RTI
  $AC19  74        .db $74
  $AC1A  74        .db $74
  $AC1B  7F        .db $7F
  $AC1C  40        RTI
  $AC1D  74        .db $74
  $AC1E  74        .db $74
  $AC1F  7F        .db $7F
  $AC20  FE B0 B0  INC $B0B0,X
  $AC23  4F        .db $4F
  $AC24  FB        .db $FB
  $AC25  B0 B0     BCS $ABD7
  $AC27  4B        .db $4B
  $AC28  01 4F     ORA ($4F,X)
  $AC2A  4F        .db $4F
  $AC2B  FF        .db $FF
  $AC2C  04        .db $04
  $AC2D  4F        .db $4F
  $AC2E  4F        .db $4F
  $AC2F  FB        .db $FB
  $AC30  FE B0 B0  INC $B0B0,X
  $AC33  4B        .db $4B
  $AC34  B7        .db $B7
  $AC35  B0 B0     BCS $ABE7
  $AC37  4E 01 4F  LSR $4F01
  $AC3A  4F        .db $4F
  $AC3B  FF        .db $FF
  $AC3C  48        PHA
  $AC3D  4F        .db $4F
  $AC3E  4F        .db $4F
  $AC3F  FE BF 00  INC $00BF,X
  $AC42  07        .db $07
  $AC43  DC        .db $DC
  $AC44  BF        .db $BF
  $AC45  00        BRK
  $AC46  07        .db $07
  $AC47  DC        .db $DC
  $AC48  40        RTI
  $AC49  FF        .db $FF
  $AC4A  FF        .db $FF
  $AC4B  FC        .db $FC
  $AC4C  44        .db $44
  $AC4D  FF        .db $FF
  $AC4E  FF        .db $FF
  $AC4F  FC        .db $FC
  $AC50  F7        .db $F7
  $AC51  00        BRK
  $AC52  00        BRK
  $AC53  F6 FF     INC $FF,X
  $AC55  00        BRK
  $AC56  00        BRK
  $AC57  EE 0C FF  INC $FF0C
  $AC5A  FF        .db $FF
  $AC5B  FE 00 FF  INC $FF00,X
  $AC5E  FF        .db $FF
  $AC5F  FF        .db $FF
  $AC60  7E 00 E0  ROR $E000,X
  $AC63  2F        .db $2F
  $AC64  FB        .db $FB
  $AC65  00        BRK
  $AC66  E0 3B     CPX #$3B
  $AC68  81 FF     STA ($FF,X)
  $AC6A  FF        .db $FF
  $AC6B  1F        .db $1F
  $AC6C  04        .db $04
  $AC6D  FF        .db $FF
  $AC6E  FF        .db $FF
  $AC6F  1B        .db $1B
  $AC70  FE 00 00  INC $0000,X
  $AC73  FB        .db $FB
  $AC74  B7        .db $B7
  $AC75  00        BRK
  $AC76  00        BRK
  $AC77  EE 01 FF  INC $FF01
  $AC7A  FF        .db $FF
  $AC7B  FF        .db $FF
  $AC7C  48        PHA
  $AC7D  FF        .db $FF
  $AC7E  FF        .db $FF
  $AC7F  FE BB 04  INC $04BB,X
  $AC82  04        .db $04
  $AC83  DF        .db $DF
  $AC84  BB        .db $BB
  $AC85  04        .db $04
  $AC86  04        .db $04
  $AC87  DE 44 FF  DEC $FF44,X
  $AC8A  FF        .db $FF
  $AC8B  FF        .db $FF
  $AC8C  44        .db $44
  $AC8D  FF        .db $FF
  $AC8E  FF        .db $FF
  $AC8F  FF        .db $FF
  $AC90  F3        .db $F3
  $AC91  04        .db $04
  $AC92  04        .db $04
  $AC93  F6 FB     INC $FB,X
  $AC95  04        .db $04
  $AC96  04        .db $04
  $AC97  EE 0C FF  INC $FF0C
  $AC9A  FF        .db $FF
  $AC9B  FE 04 FF  INC $FF04,X
  $AC9E  FF        .db $FF
  $AC9F  FF        .db $FF
  $ACA0  16 B6     ASL $B6,X
  $ACA2  B6 FE     LDX $FE,Y
  $ACA4  16 B6     ASL $B6,X
  $ACA6  B6 FE     LDX $FE,Y
  $ACA8  FE FE FE  INC $FEFE,X
  $ACAB  FE FE FE  INC $FEFE,X
  $ACAE  FE FE 16  INC $16FE,X
  $ACB1  B6 B6     LDX $B6,Y
  $ACB3  FE 16 B6  INC $B616,X
  $ACB6  B6 FE     LDX $FE,Y
  $ACB8  FE FE FE  INC $FEFE,X
  $ACBB  FE FE FE  INC $FEFE,X
  $ACBE  FE FE 55  INC $55FE,X
  $ACC1  55 FF     EOR $FF,X
  $ACC3  FF        .db $FF
  $ACC4  EE EF DB  INC $DBEF
  $ACC7  95 55     STA $55,X
  $ACC9  AA        TAX
  $ACCA  00        BRK
  $ACCB  00        BRK
  $ACCC  11 11     ORA ($11),Y
  $ACCE  27        .db $27
  $ACCF  6F        .db $6F
  $ACD0  B5 EB     LDA $EB,X
  $ACD2  6B        .db $6B
  $ACD3  FF        .db $FF
  $ACD4  6E FD DF  ROR $DFFD
  $ACD7  8F        .db $8F
  $ACD8  6F        .db $6F
  $ACD9  FF        .db $FF
  $ACDA  FF        .db $FF
  $ACDB  7F        .db $7F
  $ACDC  FF        .db $FF
  $ACDD  FE F8 F9  INC $F9F8,X
  $ACE0  55 55     EOR $55,X
  $ACE2  FF        .db $FF
  $ACE3  FF        .db $FF
  $ACE4  FB        .db $FB
  $ACE5  DD DB BB  CMP $BBDB,X
  $ACE8  55 AA     EOR $AA,X
  $ACEA  00        BRK
  $ACEB  00        BRK
  $ACEC  04        .db $04
  $ACED  22        .db $22
  $ACEE  26 66     ROL $66
  $ACF0  F6 57     INC $57,X
  $ACF2  D4        .db $D4
  $ACF3  CE 5F CB  DEC $CB5F
  $ACF6  5F        .db $5F
  $ACF7  38        SEC
  $ACF8  6F        .db $6F
  $ACF9  EF        .db $EF
  $ACFA  EF        .db $EF
  $ACFB  FD F8 7C  SBC $7CF8,X
  $ACFE  F8        SED
  $ACFF  FF        .db $FF
  $AD00  55 55     EOR $55,X
  $AD02  FF        .db $FF
  $AD03  FF        .db $FF
  $AD04  7F        .db $7F
  $AD05  B7        .db $B7
  $AD06  FB        .db $FB
  $AD07  DB        .db $DB
  $AD08  55 AA     EOR $AA,X
  $AD0A  00        BRK
  $AD0B  00        BRK
  $AD0C  80        .db $80
  $AD0D  C8        INY
  $AD0E  84 A4     STY $A4
  $AD10  DF        .db $DF
  $AD11  F6 3D     INC $3D,X
  $AD13  6F        .db $6F
  $AD14  5F        .db $5F
  $AD15  3F        .db $3F
  $AD16  BA        TSX
  $AD17  78        SEI
  $AD18  A4 AD     LDY $AD
  $AD1A  EF        .db $EF
  $AD1B  FF        .db $FF
  $AD1C  F8        SED
  $AD1D  F8        SED
  $AD1E  7D FF 55  ADC $55FF,X
  $AD21  55 FF     EOR $FF,X
  $AD23  FF        .db $FF
  $AD24  7F        .db $7F
  $AD25  BB        .db $BB
  $AD26  B7        .db $B7
  $AD27  75 55     ADC $55,X
  $AD29  AA        TAX
  $AD2A  00        BRK
  $AD2B  00        BRK
  $AD2C  80        .db $80
  $AD2D  44        .db $44
  $AD2E  48        PHA
  $AD2F  CA        DEX
  $AD30  7B        .db $7B
  $AD31  DE FD AE  DEC $AEFD,X
  $AD34  2F        .db $2F
  $AD35  BB        .db $BB
  $AD36  FF        .db $FF
  $AD37  FB        .db $FB
  $AD38  CE EF EF  DEC $EFEF
  $AD3B  7F        .db $7F
  $AD3C  FF        .db $FF
  $AD3D  7F        .db $7F
  $AD3E  63        .db $63
  $AD3F  E7        .db $E7
  $AD40  DF        .db $DF
  $AD41  E0 E1     CPX #$E1
  $AD43  9F        .db $9F
  $AD44  FF        .db $FF
  $AD45  9F        .db $9F
  $AD46  1D 3D E0  ORA $E03D,X
  $AD49  BF        .db $BF
  $AD4A  3F        .db $3F
  $AD4B  7F        .db $7F
  $AD4C  1D F9 F3  ORA $F3F9,X
  $AD4F  F7        .db $F7
  $AD50  39 7F 63  AND $637F,Y
  $AD53  67        .db $67
  $AD54  6E FF DF  ROR $DFFF
  $AD57  88        DEY
  $AD58  E7        .db $E7
  $AD59  E3        .db $E3
  $AD5A  FF        .db $FF
  $AD5B  FF        .db $FF
  $AD5C  FF        .db $FF
  $AD5D  FC        .db $FC
  $AD5E  F8        SED
  $AD5F  FF        .db $FF
  $AD60  E6 FB     INC $FB
  $AD62  F9 F1 FF  SBC $FFF1,Y
  $AD65  0F        .db $0F
  $AD66  33        .db $33
  $AD67  33        .db $33
  $AD68  7F        .db $7F
  $AD69  C7        .db $C7
  $AD6A  87        .db $87
  $AD6B  8F        .db $8F
  $AD6C  03        .db $03
  $AD6D  FF        .db $FF
  $AD6E  CF        .db $CF
  $AD6F  EF        .db $EF
  $AD70  06 4E     ASL $4E
  $AD72  CF        .db $CF
  $AD73  CF        .db $CF
  $AD74  5F        .db $5F
  $AD75  4B        .db $4B
  $AD76  D8        CLD
  $AD77  38        SEC
  $AD78  FF        .db $FF
  $AD79  FF        .db $FF
  $AD7A  FC        .db $FC
  $AD7B  FC        .db $FC
  $AD7C  F8        SED
  $AD7D  FC        .db $FC
  $AD7E  7F        .db $7F
  $AD7F  FF        .db $FF
  $AD80  24 7C     BIT $7C
  $AD82  D2        .db $D2
  $AD83  FB        .db $FB
  $AD84  F3        .db $F3
  $AD85  FB        .db $FB
  $AD86  33        .db $33
  $AD87  83        .db $83
  $AD88  FF        .db $FF
  $AD89  E7        .db $E7
  $AD8A  EF        .db $EF
  $AD8B  87        .db $87
  $AD8C  1F        .db $1F
  $AD8D  07        .db $07
  $AD8E  FF        .db $FF
  $AD8F  FF        .db $FF
  $AD90  8F        .db $8F
  $AD91  8F        .db $8F
  $AD92  4F        .db $4F
  $AD93  4D DF FF  EOR $FFDF
  $AD96  38        SEC
  $AD97  78        SEI
  $AD98  FF        .db $FF
  $AD99  FF        .db $FF
  $AD9A  FE FE 78  INC $78FE,X
  $AD9D  38        SEC
  $AD9E  FF        .db $FF
  $AD9F  FF        .db $FF
  $ADA0  73        .db $73
  $ADA1  79 DF 83  ADC $83DF,Y
  $ADA4  81 1A     STA ($1A,X)
  $ADA6  87        .db $87
  $ADA7  8F        .db $8F
  $ADA8  EF        .db $EF
  $ADA9  C7        .db $C7
  $ADAA  E1 FD     SBC ($FD,X)
  $ADAC  FF        .db $FF
  $ADAD  FF        .db $FF
  $ADAE  FE FE 4C  INC $4CFE,X
  $ADB1  5C        .db $5C
  $ADB2  FC        .db $FC
  $ADB3  2E A7 FB  ROL $FBA7
  $ADB6  6F        .db $6F
  $ADB7  E3        .db $E3
  $ADB8  FF        .db $FF
  $ADB9  FF        .db $FF
  $ADBA  7F        .db $7F
  $ADBB  FF        .db $FF
  $ADBC  7F        .db $7F
  $ADBD  27        .db $27
  $ADBE  F3        .db $F3
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
  $ADCA  FD EF 9A  SBC $9AEF,X
  $ADCD  E8        INX
  $ADCE  80        .db $80
  $ADCF  00        BRK
  $ADD0  FF        .db $FF
  $ADD1  FF        .db $FF
  $ADD2  FF        .db $FF
  $ADD3  FF        .db $FF
  $ADD4  FF        .db $FF
  $ADD5  FF        .db $FF
  $ADD6  FF        .db $FF
  $ADD7  FF        .db $FF
  $ADD8  00        BRK
  $ADD9  40        RTI
  $ADDA  80        .db $80
  $ADDB  74        .db $74
  $ADDC  FE D9 FF  INC $FFD9,X
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
  $ADE9  FE E0 30  INC $30E0,X
  $ADEC  00        BRK
  $ADED  00        BRK
  $ADEE  00        BRK
  $ADEF  00        BRK
  $ADF0  FF        .db $FF
  $ADF1  FF        .db $FF
  $ADF2  FF        .db $FF
  $ADF3  FF        .db $FF
  $ADF4  FF        .db $FF
  $ADF5  FF        .db $FF
  $ADF6  FF        .db $FF
  $ADF7  FF        .db $FF
  $ADF8  00        BRK
  $ADF9  00        BRK
  $ADFA  00        BRK
  $ADFB  00        BRK
  $ADFC  00        BRK
  $ADFD  B4 FA     LDY $FA,X
  $ADFF  FF        .db $FF
  $AE00  9D FF 40  STA $40FF,X
  $AE03  4B        .db $4B
  $AE04  4B        .db $4B
  $AE05  4B        .db $4B
  $AE06  6B        .db $6B
  $AE07  96 E2     STX $E2,Y
  $AE09  FF        .db $FF
  $AE0A  7F        .db $7F
  $AE0B  74        .db $74
  $AE0C  74        .db $74
  $AE0D  74        .db $74
  $AE0E  74        .db $74
  $AE0F  E9 FA     SBC #$FA
  $AE11  40        RTI
  $AE12  4A        LSR
  $AE13  4A        LSR
  $AE14  4A        LSR
  $AE15  68        PLA
  $AE16  B4 FF     LDY $FF,X
  $AE18  FF        .db $FF
  $AE19  7F        .db $7F
  $AE1A  75 75     ADC $75,X
  $AE1C  75 7F     ADC $7F,X
  $AE1E  CB        .db $CB
  $AE1F  FF        .db $FF
  $AE20  02        .db $02
  $AE21  FE 3C 0C  INC $0C3C,X
  $AE24  1C        .db $1C
  $AE25  0C        .db $0C
  $AE26  1C        .db $1C
  $AE27  42        .db $42
  $AE28  FE FE FC  INC $FCFE,X
  $AE2B  FC        .db $FC
  $AE2C  FC        .db $FC
  $AE2D  FC        .db $FC
  $AE2E  FC        .db $FC
  $AE2F  BE FE 1C  LDX $1CFE,Y
  $AE32  2C 1C 0C  BIT $0C1C
  $AE35  5C        .db $5C
  $AE36  02        .db $02
  $AE37  FE FE FC  INC $FCFE,X
  $AE3A  FC        .db $FC
  $AE3B  FC        .db $FC
  $AE3C  FC        .db $FC
  $AE3D  FC        .db $FC
  $AE3E  FE FE FF  INC $FFFE,X
  $AE41  FF        .db $FF
  $AE42  FF        .db $FF
  $AE43  FF        .db $FF
  $AE44  FF        .db $FF
  $AE45  FF        .db $FF
  $AE46  FF        .db $FF
  $AE47  FF        .db $FF
  $AE48  FF        .db $FF
  $AE49  FF        .db $FF
  $AE4A  FF        .db $FF
  $AE4B  FF        .db $FF
  $AE4C  FF        .db $FF
  $AE4D  FF        .db $FF
  $AE4E  FF        .db $FF
  $AE4F  FF        .db $FF
  $AE50  FF        .db $FF
  $AE51  FF        .db $FF
  $AE52  FE FE FA  INC $FAFE,X
  $AE55  E2        .db $E2
  $AE56  C4 88     CPY $88
  $AE58  FF        .db $FF
  $AE59  FF        .db $FF
  $AE5A  FF        .db $FF
  $AE5B  F9 F1 E1  SBC $E1F1,Y
  $AE5E  C3        .db $C3
  $AE5F  87        .db $87
  $AE60  FF        .db $FF
  $AE61  FF        .db $FF
  $AE62  FF        .db $FF
  $AE63  FF        .db $FF
  $AE64  FF        .db $FF
  $AE65  FF        .db $FF
  $AE66  FF        .db $FF
  $AE67  FF        .db $FF
  $AE68  FF        .db $FF
  $AE69  FF        .db $FF
  $AE6A  FF        .db $FF
  $AE6B  FF        .db $FF
  $AE6C  FF        .db $FF
  $AE6D  FF        .db $FF
  $AE6E  FF        .db $FF
  $AE6F  FF        .db $FF
  $AE70  FF        .db $FF
  $AE71  80        .db $80
  $AE72  00        BRK
  $AE73  00        BRK
  $AE74  00        BRK
  $AE75  00        BRK
  $AE76  60        RTS
  $AE77  C0 FF     CPY #$FF
  $AE79  FF        .db $FF
  $AE7A  FF        .db $FF
  $AE7B  FF        .db $FF
  $AE7C  FF        .db $FF
  $AE7D  FF        .db $FF
  $AE7E  9F        .db $9F
  $AE7F  3F        .db $3F
  $AE80  FF        .db $FF
  $AE81  FF        .db $FF
  $AE82  FF        .db $FF
  $AE83  FF        .db $FF
  $AE84  FF        .db $FF
  $AE85  FF        .db $FF
  $AE86  FF        .db $FF
  $AE87  FF        .db $FF
  $AE88  FF        .db $FF
  $AE89  FF        .db $FF
  $AE8A  FF        .db $FF
  $AE8B  FF        .db $FF
  $AE8C  FF        .db $FF
  $AE8D  FF        .db $FF
  $AE8E  FF        .db $FF
  $AE8F  FF        .db $FF
  $AE90  FF        .db $FF
  $AE91  3F        .db $3F
  $AE92  0F        .db $0F
  $AE93  07        .db $07
  $AE94  01 00     ORA ($00,X)
  $AE96  00        BRK
  $AE97  00        BRK
  $AE98  FF        .db $FF
  $AE99  BF        .db $BF
  $AE9A  EF        .db $EF
  $AE9B  FF        .db $FF
  $AE9C  FD FE FF  SBC $FFFE,X
  $AE9F  FF        .db $FF
  $AEA0  FF        .db $FF
  $AEA1  FF        .db $FF
  $AEA2  FF        .db $FF
  $AEA3  FF        .db $FF
  $AEA4  FF        .db $FF
  $AEA5  FF        .db $FF
  $AEA6  FF        .db $FF
  $AEA7  FF        .db $FF
  $AEA8  FF        .db $FF
  $AEA9  FF        .db $FF
  $AEAA  FF        .db $FF
  $AEAB  FF        .db $FF
  $AEAC  FF        .db $FF
  $AEAD  FF        .db $FF
  $AEAE  FF        .db $FF
  $AEAF  FF        .db $FF
  $AEB0  FF        .db $FF
  $AEB1  FF        .db $FF
  $AEB2  FF        .db $FF
  $AEB3  FF        .db $FF
  $AEB4  FF        .db $FF
  $AEB5  FF        .db $FF
  $AEB6  7F        .db $7F
  $AEB7  3F        .db $3F
  $AEB8  FF        .db $FF
  $AEB9  FF        .db $FF
  $AEBA  FF        .db $FF
  $AEBB  FF        .db $FF
  $AEBC  FF        .db $FF
  $AEBD  FF        .db $FF
  $AEBE  7F        .db $7F
  $AEBF  BF        .db $BF
  $AEC0  FF        .db $FF
  $AEC1  FF        .db $FF
  $AEC2  FF        .db $FF
  $AEC3  FF        .db $FF

L_AEC4:
  $AEC4  FF        .db $FF
  $AEC5  FF        .db $FF
  $AEC6  FF        .db $FF
  $AEC7  FE FF FF  INC $FFFF,X
  $AECA  FF        .db $FF
  $AECB  FF        .db $FF
  $AECC  FF        .db $FF
  $AECD  FF        .db $FF
  $AECE  FF        .db $FF
  $AECF  FF        .db $FF
  $AED0  FC        .db $FC
  $AED1  FC        .db $FC
  $AED2  F9 F3 F3  SBC $F3F3,Y
  $AED5  E7        .db $E7
  $AED6  E7        .db $E7
  $AED7  C7        .db $C7
  $AED8  FF        .db $FF
  $AED9  FF        .db $FF
  $AEDA  FE FC FC  INC $FCFC,X
  $AEDD  F8        SED
  $AEDE  F8        SED
  $AEDF  F8        SED
  $AEE0  FF        .db $FF
  $AEE1  FC        .db $FC
  $AEE2  F0 E0     BEQ $AEC4
  $AEE4  C4 9C     CPY $9C
  $AEE6  38        SEC
  $AEE7  70 FF     BVS $AEE8
  $AEE9  FF        .db $FF
  $AEEA  FF        .db $FF
  $AEEB  FF        .db $FF

L_AEEC:
  $AEEC  FB        .db $FB
  $AEED  E3        .db $E3
  $AEEE  C7        .db $C7
  $AEEF  8F        .db $8F
  $AEF0  60        RTS
  $AEF1  C0 C0     CPY #$C0
  $AEF3  80        .db $80
  $AEF4  80        .db $80
  $AEF5  80        .db $80
  $AEF6  00        BRK
  $AEF7  00        BRK
  $AEF8  9F        .db $9F
  $AEF9  3F        .db $3F
  $AEFA  3F        .db $3F
  $AEFB  7F        .db $7F
  $AEFC  7F        .db $7F
  $AEFD  7F        .db $7F
  $AEFE  FF        .db $FF
  $AEFF  FF        .db $FF
  $AF00  CF        .db $CF
  $AF01  CF        .db $CF
  $AF02  9E        .db $9E
  $AF03  9E        .db $9E
  $AF04  9F        .db $9F
  $AF05  1F        .db $1F
  $AF06  3E 3F F0  ROL $F03F,X
  $AF09  F0 E1     BEQ $AEEC
  $AF0B  E1 E0     SBC ($E0,X)
  $AF0D  E0 C1     CPX #$C1
  $AF0F  C0 01     CPY #$01
  $AF11  01 3F     ORA ($3F,X)
  $AF13  01 01     ORA ($01,X)
  $AF15  3F        .db $3F
  $AF16  00        BRK
  $AF17  80        .db $80
  $AF18  80        .db $80
  $AF19  BE C0 80  LDX $80C0,Y
  $AF1C  BE C0 FF  LDX $FFC0,Y
  $AF1F  80        .db $80
  $AF20  00        BRK
  $AF21  00        BRK
  $AF22  00        BRK
  $AF23  58        CLI
  $AF24  00        BRK
  $AF25  A0 00     LDY #$00
  $AF27  00        BRK
  $AF28  FF        .db $FF
  $AF29  FF        .db $FF
  $AF2A  FF        .db $FF
  $AF2B  A7        .db $A7
  $AF2C  FF        .db $FF
  $AF2D  5F        .db $5F
  $AF2E  FF        .db $FF
  $AF2F  FF        .db $FF
  $AF30  00        BRK
  $AF31  E8        INX
  $AF32  80        .db $80
  $AF33  C0 F0     CPY #$F0
  $AF35  FF        .db $FF
  $AF36  00        BRK
  $AF37  00        BRK
  $AF38  FF        .db $FF
  $AF39  17        .db $17
  $AF3A  7F        .db $7F
  $AF3B  3F        .db $3F
  $AF3C  0F        .db $0F
  $AF3D  00        BRK
  $AF3E  FF        .db $FF
  $AF3F  00        BRK
  $AF40  1F        .db $1F
  $AF41  01 00     ORA ($00,X)
  $AF43  0B        .db $0B
  $AF44  00        BRK
  $AF45  00        BRK
  $AF46  00        BRK
  $AF47  00        BRK
  $AF48  FF        .db $FF
  $AF49  FF        .db $FF
  $AF4A  FF        .db $FF
  $AF4B  FF        .db $FF
  $AF4C  FF        .db $FF
  $AF4D  FF        .db $FF
  $AF4E  FF        .db $FF
  $AF4F  FF        .db $FF
  $AF50  00        BRK
  $AF51  01 00     ORA ($00,X)
  $AF53  00        BRK
  $AF54  00        BRK
  $AF55  00        BRK
  $AF56  00        BRK
  $AF57  00        BRK
  $AF58  FF        .db $FF
  $AF59  FF        .db $FF
  $AF5A  FF        .db $FF
  $AF5B  FF        .db $FF
  $AF5C  FF        .db $FF
  $AF5D  FF        .db $FF
  $AF5E  FF        .db $FF
  $AF5F  00        BRK
  $AF60  FC        .db $FC
  $AF61  FE 3E DE  INC $DE3E,X
  $AF64  0E 06 9E  ASL $9E06
  $AF67  02        .db $02
  $AF68  FC        .db $FC
  $AF69  FE FE FE  INC $FEFE,X
  $AF6C  FE FE FE  INC $FEFE,X
  $AF6F  FE 02 5E  INC $5E02,X
  $AF72  02        .db $02
  $AF73  0E 02 76  ASL $7602
  $AF76  02        .db $02
  $AF77  00        BRK
  $AF78  FE FE FE  INC $FEFE,X
  $AF7B  FE FE FE  INC $FEFE,X
  $AF7E  FE 00 7F  INC $7F00,X
  $AF81  17        .db $17
  $AF82  7E 01 01  ROR $0101,X
  $AF85  7F        .db $7F
  $AF86  01 01     ORA ($01,X)
  $AF88  80        .db $80
  $AF89  E8        INX
  $AF8A  81 80     STA ($80,X)
  $AF8C  BE 80 80  LDX $8080,Y
  $AF8F  BE 3F 2F  LDX $2F3F,Y
  $AF92  0F        .db $0F
  $AF93  8E 86 80  STX $8086
  $AF96  C0 C0     CPY #$C0
  $AF98  C0 D0     CPY #$D0
  $AF9A  F0 F1     BEQ $AF8D
  $AF9C  F9 FF FF  SBC $FFFF,Y
  $AF9F  FF        .db $FF
  $AFA0  FF        .db $FF
  $AFA1  80        .db $80
  $AFA2  00        BRK
  $AFA3  CC F0 C0  CPY $C0F0
  $AFA6  C0 80     CPY #$80
  $AFA8  00        BRK
  $AFA9  7F        .db $7F
  $AFAA  FF        .db $FF
  $AFAB  33        .db $33
  $AFAC  0F        .db $0F
  $AFAD  3F        .db $3F
  $AFAE  3C        .db $3C
  $AFAF  7E 00 00  ROR $0000,X
  $AFB2  00        BRK
  $AFB3  00        BRK
  $AFB4  00        BRK
  $AFB5  00        BRK
  $AFB6  00        BRK
  $AFB7  00        BRK
  $AFB8  FF        .db $FF
  $AFB9  FF        .db $FF
  $AFBA  FD FF FF  SBC $FFFF,X
  $AFBD  FF        .db $FF
  $AFBE  FF        .db $FF
  $AFBF  FF        .db $FF
  $AFC0  D2        .db $D2
  $AFC1  00        BRK
  $AFC2  00        BRK
  $AFC3  00        BRK
  $AFC4  00        BRK
  $AFC5  00        BRK
  $AFC6  00        BRK
  $AFC7  00        BRK
  $AFC8  2D FF FF  AND $FFFF
  $AFCB  FF        .db $FF
  $AFCC  FF        .db $FF
  $AFCD  FF        .db $FF
  $AFCE  0F        .db $0F
  $AFCF  1F        .db $1F
  $AFD0  00        BRK
  $AFD1  00        BRK
  $AFD2  00        BRK
  $AFD3  00        BRK
  $AFD4  00        BRK
  $AFD5  06 01     ASL $01
  $AFD7  1F        .db $1F
  $AFD8  3F        .db $3F
  $AFD9  FF        .db $FF
  $AFDA  2F        .db $2F
  $AFDB  FF        .db $FF
  $AFDC  FF        .db $FF
  $AFDD  FF        .db $FF
  $AFDE  FF        .db $FF
  $AFDF  FF        .db $FF
  $AFE0  04        .db $04
  $AFE1  3E 02 06  ROL $0602,X
  $AFE4  02        .db $02
  $AFE5  02        .db $02
  $AFE6  9E        .db $9E
  $AFE7  02        .db $02
  $AFE8  FC        .db $FC
  $AFE9  FE FE FE  INC $FEFE,X
  $AFEC  FE FE FE  INC $FEFE,X
  $AFEF  FE 02 06  INC $0602,X
  $AFF2  2E 0E 0C  ROL $0C0E
  $AFF5  BC F8 E0  LDY $E0F8,X
  $AFF8  FE FE FE  INC $FEFE,X
  $AFFB  FE FC FC  INC $FCFC,X
  $AFFE  F8        SED
  $AFFF  E0 FF     CPX #$FF
  $B001  FF        .db $FF
  $B002  FF        .db $FF
  $B003  FF        .db $FF
  $B004  FF        .db $FF

L_B005:
  $B005  FF        .db $FF
  $B006  FF        .db $FF
  $B007  FF        .db $FF
  $B008  FF        .db $FF
  $B009  FF        .db $FF
  $B00A  FF        .db $FF
  $B00B  FF        .db $FF
  $B00C  FF        .db $FF

L_B00D:
  $B00D  FF        .db $FF
  $B00E  FF        .db $FF
  $B00F  FF        .db $FF
  $B010  FF        .db $FF
  $B011  FF        .db $FF
  $B012  FE FE FE  INC $FEFE,X
  $B015  FC        .db $FC
  $B016  FC        .db $FC
  $B017  FF        .db $FF
  $B018  FF        .db $FF
  $B019  FF        .db $FF
  $B01A  FE FE FE  INC $FEFE,X
  $B01D  FC        .db $FC
  $B01E  FC        .db $FC
  $B01F  FC        .db $FC
  $B020  FE FC F8  INC $F8FC,X
  $B023  F0 E0     BEQ $B005
  $B025  C0 C0     CPY #$C0
  $B027  81 FE     STA ($FE,X)
  $B029  FC        .db $FC
  $B02A  F8        SED
  $B02B  F0 E0     BEQ $B00D
  $B02D  C0 C0     CPY #$C0
  $B02F  80        .db $80
  $B030  01 01     ORA ($01,X)
  $B032  02        .db $02
  $B033  02        .db $02
  $B034  02        .db $02
  $B035  04        .db $04
  $B036  04        .db $04
  $B037  F8        SED
  $B038  00        BRK
  $B039  00        BRK
  $B03A  01 01     ORA ($01,X)
  $B03C  01 03     ORA ($03,X)
  $B03E  03        .db $03
  $B03F  07        .db $07
  $B040  11 21     ORA ($21),Y
  $B042  23        .db $23
  $B043  47        .db $47
  $B044  47        .db $47
  $B045  8F        .db $8F
  $B046  8F        .db $8F
  $B047  0F        .db $0F
  $B048  0E 1E 1C  ASL $1C1E
  $B04B  38        SEC
  $B04C  38        SEC
  $B04D  70 70     BVS $B0BF
  $B04F  F0 0D     BEQ $B05E
  $B051  08        PHP
  $B052  18        CLC
  $B053  10 10     BPL $B065
  $B055  78        SEI
  $B056  78        SEI
  $B057  FC        .db $FC
  $B058  F2        .db $F2
  $B059  F7        .db $F7
  $B05A  E7        .db $E7
  $B05B  EF        .db $EF
  $B05C  EF        .db $EF
  $B05D  87        .db $87

L_B05E:
  $B05E  87        .db $87
  $B05F  03        .db $03
  $B060  C0 C0     CPY #$C0
  $B062  C0 E0     CPY #$E0
  $B064  E0 E0     CPX #$E0
  $B066  80        .db $80
  $B067  80        .db $80
  $B068  3F        .db $3F
  $B069  3F        .db $3F
  $B06A  3F        .db $3F
  $B06B  1F        .db $1F
  $B06C  1F        .db $1F
  $B06D  1F        .db $1F
  $B06E  7F        .db $7F
  $B06F  7F        .db $7F
  $B070  80        .db $80
  $B071  00        BRK
  $B072  00        BRK
  $B073  00        BRK
  $B074  00        BRK
  $B075  00        BRK
  $B076  00        BRK
  $B077  00        BRK
  $B078  7F        .db $7F
  $B079  FF        .db $FF
  $B07A  FF        .db $FF
  $B07B  FF        .db $FF
  $B07C  FF        .db $FF
  $B07D  FF        .db $FF
  $B07E  FF        .db $FF
  $B07F  FF        .db $FF
  $B080  00        BRK
  $B081  00        BRK
  $B082  00        BRK
  $B083  00        BRK
  $B084  00        BRK
  $B085  00        BRK
  $B086  00        BRK
  $B087  02        .db $02
  $B088  FF        .db $FF
  $B089  FF        .db $FF
  $B08A  FF        .db $FF
  $B08B  FF        .db $FF
  $B08C  FF        .db $FF
  $B08D  FF        .db $FF
  $B08E  FF        .db $FF
  $B08F  FC        .db $FC
  $B090  00        BRK
  $B091  00        BRK
  $B092  00        BRK
  $B093  00        BRK
  $B094  00        BRK
  $B095  00        BRK
  $B096  00        BRK
  $B097  00        BRK
  $B098  FC        .db $FC
  $B099  FF        .db $FF
  $B09A  FF        .db $FF
  $B09B  FF        .db $FF
  $B09C  FF        .db $FF
  $B09D  FF        .db $FF
  $B09E  FF        .db $FF
  $B09F  FE 1F 0F  INC $0F1F,X
  $B0A2  07        .db $07
  $B0A3  03        .db $03
  $B0A4  03        .db $03
  $B0A5  01 21     ORA ($21,X)
  $B0A7  00        BRK
  $B0A8  DF        .db $DF
  $B0A9  EF        .db $EF
  $B0AA  F7        .db $F7
  $B0AB  FB        .db $FB
  $B0AC  FB        .db $FB
  $B0AD  FD CD CE  SBC $CECD,X
  $B0B0  00        BRK
  $B0B1  00        BRK
  $B0B2  00        BRK
  $B0B3  00        BRK
  $B0B4  00        BRK
  $B0B5  00        BRK
  $B0B6  01 03     ORA ($03,X)
  $B0B8  FE FE FC  INC $FCFE,X
  $B0BB  F8        SED
  $B0BC  E0 80     CPX #$80
  $B0BE  01 03     ORA ($03,X)
  $B0C0  2F        .db $2F
  $B0C1  4D 75 4C  EOR $4C75
  $B0C4  49 2D     EOR #$2D
  $B0C6  4A        LSR
  $B0C7  3E 10 72  ROL $7210,X
  $B0CA  4A        LSR
  $B0CB  73        .db $73
  $B0CC  76 72     ROR $72,X
  $B0CE  77        .db $77
  $B0CF  3F        .db $3F
  $B0D0  7F        .db $7F
  $B0D1  2D 4B 4D  AND $4D4B
  $B0D4  45 2B     EOR $2B
  $B0D6  4D 3E 41  EOR $413E
  $B0D9  73        .db $73
  $B0DA  77        .db $77
  $B0DB  73        .db $73
  $B0DC  7B        .db $7B
  $B0DD  77        .db $77
  $B0DE  73        .db $73
  $B0DF  3E 7E 43  ROL $437E,X
  $B0E2  01 01     ORA ($01,X)
  $B0E4  03        .db $03
  $B0E5  21 13     AND ($13,X)
  $B0E7  EE 80 BF  INC $BF80
  $B0EA  FF        .db $FF
  $B0EB  FF        .db $FF
  $B0EC  FF        .db $FF
  $B0ED  FF        .db $FF
  $B0EE  FF        .db $FF
  $B0EF  FF        .db $FF
  $B0F0  77        .db $77
  $B0F1  C8        INY
  $B0F2  A0 80     LDY #$80
  $B0F4  80        .db $80
  $B0F5  80        .db $80
  $B0F6  C4 BB     CPY $BB
  $B0F8  88        DEY
  $B0F9  37        .db $37
  $B0FA  5F        .db $5F
  $B0FB  7F        .db $7F
  $B0FC  7F        .db $7F
  $B0FD  7F        .db $7F
  $B0FE  7F        .db $7F
  $B0FF  FF        .db $FF
  $B100  6F        .db $6F
  $B101  C9 B0     CMP #$B0
  $B103  C0 80     CPY #$80
  $B105  A0 C2     LDY #$C2
  $B107  FD 90 36  SBC $3690,X
  $B10A  4F        .db $4F
  $B10B  3F        .db $3F
  $B10C  7F        .db $7F
  $B10D  7F        .db $7F
  $B10E  7F        .db $7F
  $B10F  FF        .db $FF
  $B110  BF        .db $BF
  $B111  41 03     EOR ($03,X)
  $B113  01 01     ORA ($01,X)
  $B115  02        .db $02
  $B116  09 F6     ORA #$F6
  $B118  41 BF     EOR ($BF,X)
  $B11A  FF        .db $FF
  $B11B  FF        .db $FF
  $B11C  FF        .db $FF
  $B11D  FF        .db $FF
  $B11E  FF        .db $FF
  $B11F  FE 7E 43  INC $437E,X
  $B122  01 01     ORA ($01,X)
  $B124  02        .db $02
  $B125  21 13     AND ($13,X)
  $B127  EE 80 BF  INC $BF80
  $B12A  FF        .db $FF
  $B12B  FF        .db $FF
  $B12C  FF        .db $FF
  $B12D  FF        .db $FF
  $B12E  FF        .db $FF
  $B12F  FE 77 C8  INC $C877,X
  $B132  A0 80     LDY #$80
  $B134  80        .db $80
  $B135  80        .db $80
  $B136  C4 FB     CPY $FB
  $B138  88        DEY
  $B139  37        .db $37
  $B13A  5F        .db $5F
  $B13B  7F        .db $7F
  $B13C  7F        .db $7F
  $B13D  7F        .db $7F
  $B13E  7F        .db $7F
  $B13F  FB        .db $FB
  $B140  6F        .db $6F
  $B141  C9 B0     CMP #$B0
  $B143  C0 80     CPY #$80
  $B145  A0 C2     LDY #$C2
  $B147  FF        .db $FF
  $B148  90 36     BCC $B180
  $B14A  4F        .db $4F
  $B14B  3F        .db $3F
  $B14C  7F        .db $7F
  $B14D  7F        .db $7F
  $B14E  7F        .db $7F
  $B14F  FF        .db $FF
  $B150  BF        .db $BF
  $B151  41 03     EOR ($03,X)
  $B153  01 01     ORA ($01,X)
  $B155  03        .db $03
  $B156  09 FE     ORA #$FE
  $B158  41 BF     EOR ($BF,X)
  $B15A  FF        .db $FF
  $B15B  FF        .db $FF
  $B15C  FF        .db $FF
  $B15D  FF        .db $FF
  $B15E  FF        .db $FF
  $B15F  FE 6C 56  INC $566C,X
  $B162  16 14     ASL $14,X
  $B164  12        .db $12
  $B165  26 16     ROL $16
  $B167  FC        .db $FC
  $B168  94 BE     STY $BE,X
  $B16A  FE FE FE  INC $FEFE,X
  $B16D  FE FE FC  INC $FCFE,X
  $B170  76 CE     ROR $CE,X
  $B172  B6 94     LDX $94,Y
  $B174  82        .db $82
  $B175  96 D6     STX $D6,Y
  $B177  EC 9E 36  CPX $369E
  $B17A  5E 7E 7E  LSR $7E7E,X
  $B17D  7E 7E FC  ROR $FC7E,X

L_B180:
  $B180  7F        .db $7F
  $B181  FF        .db $FF
  $B182  F5 F0     SBC $F0,X
  $B184  C7        .db $C7
  $B185  EF        .db $EF
  $B186  CF        .db $CF
  $B187  EE 00 00  INC $0000
  $B18A  00        BRK
  $B18B  00        BRK
  $B18C  00        BRK
  $B18D  00        BRK
  $B18E  00        BRK
  $B18F  00        BRK
  $B190  CE EB CC  DEC $CCEB
  $B193  EE F7 FF  INC $FFF7
  $B196  55 00     EOR $00,X
  $B198  00        BRK
  $B199  00        BRK
  $B19A  00        BRK
  $B19B  00        BRK
  $B19C  00        BRK
  $B19D  00        BRK
  $B19E  00        BRK
  $B19F  00        BRK
  $B1A0  FC        .db $FC
  $B1A1  FE 5C 0E  INC $0E5C,X
  $B1A4  F4        .db $F4
  $B1A5  BE DC 4E  LDX $4EDC,Y
  $B1A8  00        BRK
  $B1A9  00        BRK
  $B1AA  00        BRK
  $B1AB  00        BRK
  $B1AC  00        BRK
  $B1AD  00        BRK
  $B1AE  00        BRK
  $B1AF  00        BRK
  $B1B0  DC        .db $DC
  $B1B1  CE 3C BE  DEC $BE3C
  $B1B4  FC        .db $FC
  $B1B5  FE 54 00  INC $0054,X
  $B1B8  00        BRK
  $B1B9  00        BRK
  $B1BA  00        BRK
  $B1BB  00        BRK
  $B1BC  00        BRK
  $B1BD  00        BRK

L_B1BE:
  $B1BE  00        BRK
  $B1BF  00        BRK
  $B1C0  C0 E0     CPY #$E0
  $B1C2  E0 F0     CPX #$F0
  $B1C4  F0 F8     BEQ $B1BE
  $B1C6  FC        .db $FC
  $B1C7  FC        .db $FC
  $B1C8  DF        .db $DF
  $B1C9  EF        .db $EF
  $B1CA  EF        .db $EF
  $B1CB  F7        .db $F7
  $B1CC  F3        .db $F3
  $B1CD  F9 FC FC  SBC $FCFC,Y
  $B1D0  FE FF FF  INC $FFFF,X
  $B1D3  FF        .db $FF
  $B1D4  FF        .db $FF
  $B1D5  FF        .db $FF
  $B1D6  FF        .db $FF
  $B1D7  FF        .db $FF

L_B1D8:
  $B1D8  FE FF FF  INC $FFFF,X
  $B1DB  FF        .db $FF
  $B1DC  FF        .db $FF
  $B1DD  FF        .db $FF
  $B1DE  FF        .db $FF
  $B1DF  FF        .db $FF
  $B1E0  00        BRK
  $B1E1  00        BRK
  $B1E2  00        BRK
  $B1E3  00        BRK
  $B1E4  00        BRK
  $B1E5  00        BRK
  $B1E6  00        BRK
  $B1E7  00        BRK
  $B1E8  FF        .db $FF
  $B1E9  FF        .db $FF
  $B1EA  FF        .db $FF
  $B1EB  FF        .db $FF
  $B1EC  FF        .db $FF
  $B1ED  FE FE 3C  INC $3CFE,X
  $B1F0  00        BRK
  $B1F1  00        BRK
  $B1F2  80        .db $80

L_B1F3:
  $B1F3  C0 E0     CPY #$E0
  $B1F5  F0 FC     BEQ $B1F3
  $B1F7  FF        .db $FF
  $B1F8  00        BRK
  $B1F9  00        BRK
  $B1FA  80        .db $80

L_B1FB:
  $B1FB  C0 E0     CPY #$E0
  $B1FD  F0 FC     BEQ $B1FB
  $B1FF  FF        .db $FF
  $B200  FC        .db $FC
  $B201  FC        .db $FC
  $B202  FC        .db $FC
  $B203  FC        .db $FC
  $B204  FC        .db $FC
  $B205  FE FE FF  INC $FFFE,X
  $B208  FF        .db $FF
  $B209  FF        .db $FF
  $B20A  FF        .db $FF
  $B20B  FD FD FE  SBC $FEFD,X
  $B20E  FE FF FF  INC $FFFF,X
  $B211  FF        .db $FF
  $B212  FF        .db $FF
  $B213  FF        .db $FF
  $B214  FF        .db $FF
  $B215  FF        .db $FF
  $B216  FF        .db $FF
  $B217  FF        .db $FF
  $B218  FF        .db $FF
  $B219  FF        .db $FF
  $B21A  FF        .db $FF
  $B21B  FF        .db $FF
  $B21C  FF        .db $FF
  $B21D  FF        .db $FF
  $B21E  FF        .db $FF
  $B21F  FF        .db $FF
  $B220  00        BRK
  $B221  00        BRK
  $B222  00        BRK
  $B223  00        BRK
  $B224  00        BRK

L_B225:
  $B225  00        BRK
  $B226  00        BRK

L_B227:
  $B227  00        BRK
  $B228  FF        .db $FF
  $B229  FF        .db $FF
  $B22A  FF        .db $FF
  $B22B  FF        .db $FF
  $B22C  FF        .db $FF
  $B22D  FF        .db $FF
  $B22E  00        BRK
  $B22F  0F        .db $0F
  $B230  80        .db $80
  $B231  C0 E0     CPY #$E0
  $B233  F0 F0     BEQ $B225
  $B235  F0 F0     BEQ $B227
  $B237  F0 9F     BEQ $B1D8
  $B239  DF        .db $DF
  $B23A  EF        .db $EF
  $B23B  F0 F7     BEQ $B234
  $B23D  F7        .db $F7
  $B23E  F7        .db $F7

L_B23F:
  $B23F  F0 FE     BEQ $B23F
  $B241  8F        .db $8F
  $B242  00        BRK
  $B243  00        BRK
  $B244  00        BRK
  $B245  00        BRK
  $B246  A8        TAY
  $B247  00        BRK
  $B248  01 70     ORA ($70,X)
  $B24A  FF        .db $FF
  $B24B  FF        .db $FF
  $B24C  FF        .db $FF
  $B24D  FF        .db $FF
  $B24E  BF        .db $BF
  $B24F  FF        .db $FF
  $B250  00        BRK
  $B251  00        BRK
  $B252  00        BRK
  $B253  09 F6     ORA #$F6
  $B255  F6 F6     INC $F6,X
  $B257  00        BRK
  $B258  FF        .db $FF
  $B259  FF        .db $FF
  $B25A  FF        .db $FF
  $B25B  FF        .db $FF
  $B25C  09 09     ORA #$09
  $B25E  09 00     ORA #$00
  $B260  00        BRK
  $B261  FC        .db $FC
  $B262  00        BRK
  $B263  00        BRK
  $B264  00        BRK
  $B265  00        BRK
  $B266  B4 03     LDY $03,X
  $B268  FF        .db $FF
  $B269  03        .db $03
  $B26A  FF        .db $FF
  $B26B  FF        .db $FF
  $B26C  FF        .db $FF
  $B26D  FF        .db $FF
  $B26E  F4        .db $F4
  $B26F  FF        .db $FF
  $B270  07        .db $07
  $B271  0E 3C F0  ASL $F03C
  $B274  00        BRK
  $B275  06 06     ASL $06
  $B277  00        BRK
  $B278  FF        .db $FF
  $B279  FE FC F0  INC $F0FC,X
  $B27C  FC        .db $FC

L_B27D:
  $B27D  FE FE 00  INC $00FE,X
  $B280  04        .db $04
  $B281  08        PHP
  $B282  08        PHP
  $B283  13        .db $13
  $B284  17        .db $17
  $B285  6E 1C 38  ROR $381C
  $B288  FC        .db $FC
  $B289  F8        SED
  $B28A  F8        SED
  $B28B  F0 F0     BEQ $B27D

L_B28D:
  $B28D  E1 03     SBC ($03,X)
  $B28F  07        .db $07
  $B290  38        SEC
  $B291  70 70     BVS $B303
  $B293  F0 F8     BEQ $B28D
  $B295  FF        .db $FF
  $B296  00        BRK
  $B297  00        BRK
  $B298  07        .db $07
  $B299  0F        .db $0F
  $B29A  0F        .db $0F
  $B29B  0F        .db $0F
  $B29C  07        .db $07
  $B29D  00        BRK
  $B29E  7F        .db $7F
  $B29F  00        BRK
  $B2A0  0C        .db $0C
  $B2A1  7F        .db $7F
  $B2A2  E0 80     CPX #$80
  $B2A4  0E 1F 33  ASL $331F
  $B2A7  33        .db $33
  $B2A8  0C        .db $0C
  $B2A9  43        .db $43
  $B2AA  1F        .db $1F
  $B2AB  7F        .db $7F
  $B2AC  FF        .db $FF
  $B2AD  F3        .db $F3
  $B2AE  E2        .db $E2
  $B2AF  E2        .db $E2
  $B2B0  3D 1E 00  AND $001E,X
  $B2B3  00        BRK
  $B2B4  00        BRK
  $B2B5  E0 00     CPX #$00
  $B2B7  00        BRK
  $B2B8  FE F1 FF  INC $FFF1,X
  $B2BB  FF        .db $FF
  $B2BC  FF        .db $FF
  $B2BD  1F        .db $1F
  $B2BE  FF        .db $FF
  $B2BF  00        BRK
  $B2C0  7F        .db $7F
  $B2C1  3F        .db $3F
  $B2C2  0F        .db $0F
  $B2C3  07        .db $07
  $B2C4  03        .db $03
  $B2C5  01 00     ORA ($00,X)
  $B2C7  00        BRK
  $B2C8  7F        .db $7F
  $B2C9  3F        .db $3F
  $B2CA  CF        .db $CF
  $B2CB  E7        .db $E7
  $B2CC  F3        .db $F3
  $B2CD  F9 FC FC  SBC $FCFC,Y
  $B2D0  00        BRK
  $B2D1  00        BRK
  $B2D2  00        BRK
  $B2D3  00        BRK
  $B2D4  00        BRK
  $B2D5  00        BRK
  $B2D6  00        BRK
  $B2D7  00        BRK
  $B2D8  FE FE FE  INC $FEFE,X
  $B2DB  FE FC FC  INC $FCFC,X
  $B2DE  F0 00     BEQ $B2E0

L_B2E0:
  $B2E0  FF        .db $FF
  $B2E1  FF        .db $FF
  $B2E2  FF        .db $FF
  $B2E3  FF        .db $FF
  $B2E4  FF        .db $FF
  $B2E5  FF        .db $FF
  $B2E6  FF        .db $FF
  $B2E7  7F        .db $7F
  $B2E8  FF        .db $FF
  $B2E9  FF        .db $FF
  $B2EA  FF        .db $FF
  $B2EB  FF        .db $FF
  $B2EC  FF        .db $FF
  $B2ED  FF        .db $FF
  $B2EE  FF        .db $FF
  $B2EF  7F        .db $7F
  $B2F0  7F        .db $7F
  $B2F1  3F        .db $3F
  $B2F2  3F        .db $3F
  $B2F3  1F        .db $1F
  $B2F4  1F        .db $1F
  $B2F5  1F        .db $1F
  $B2F6  1F        .db $1F
  $B2F7  3F        .db $3F
  $B2F8  7F        .db $7F
  $B2F9  3F        .db $3F
  $B2FA  3F        .db $3F
  $B2FB  1F        .db $1F
  $B2FC  1F        .db $1F
  $B2FD  1F        .db $1F
  $B2FE  1F        .db $1F
  $B2FF  3F        .db $3F
  $B300  BF        .db $BF
  $B301  00        BRK
  $B302  00        BRK

L_B303:
  $B303  D3        .db $D3
  $B304  BB        .db $BB
  $B305  00        BRK
  $B306  00        BRK
  $B307  DE 40 FF  DEC $FF40,X
  $B30A  FF        .db $FF
  $B30B  FB        .db $FB
  $B30C  44        .db $44
  $B30D  FF        .db $FF
  $B30E  FF        .db $FF
  $B30F  FF        .db $FF
  $B310  F7        .db $F7
  $B311  00        BRK
  $B312  00        BRK
  $B313  F6 FF     INC $FF,X
  $B315  00        BRK
  $B316  00        BRK
  $B317  EE 08 FF  INC $FF08
  $B31A  FF        .db $FF
  $B31B  FE 00 FF  INC $FF00,X
  $B31E  FF        .db $FF
  $B31F  FF        .db $FF
  $B320  7E 00 00  ROR $0000,X
  $B323  EF        .db $EF
  $B324  FB        .db $FB
  $B325  00        BRK
  $B326  00        BRK
  $B327  FB        .db $FB
  $B328  81 FF     STA ($FF,X)
  $B32A  FF        .db $FF
  $B32B  FF        .db $FF
  $B32C  04        .db $04
  $B32D  FF        .db $FF
  $B32E  FF        .db $FF
  $B32F  FB        .db $FB
  $B330  DE 00 00  DEC $0000,X
  $B333  7B        .db $7B
  $B334  B7        .db $B7
  $B335  00        BRK
  $B336  00        BRK
  $B337  EE 21 FF  INC $FF21
  $B33A  FF        .db $FF
  $B33B  FF        .db $FF
  $B33C  48        PHA
  $B33D  FF        .db $FF
  $B33E  FF        .db $FF
  $B33F  FE 00 08  INC $0800,X
  $B342  00        BRK
  $B343  18        CLC
  $B344  08        PHP
  $B345  18        CLC
  $B346  08        PHP
  $B347  18        CLC
  $B348  00        BRK
  $B349  38        SEC
  $B34A  00        BRK
  $B34B  38        SEC
  $B34C  38        SEC
  $B34D  38        SEC
  $B34E  38        SEC
  $B34F  38        SEC
  $B350  08        PHP
  $B351  18        CLC
  $B352  08        PHP
  $B353  18        CLC
  $B354  08        PHP
  $B355  18        CLC
  $B356  08        PHP
  $B357  30 38     BMI $B391
  $B359  38        SEC
  $B35A  38        SEC
  $B35B  38        SEC
  $B35C  38        SEC
  $B35D  38        SEC
  $B35E  38        SEC
  $B35F  30 00     BMI $B361

L_B361:
  $B361  08        PHP
  $B362  00        BRK
  $B363  18        CLC
  $B364  08        PHP
  $B365  18        CLC
  $B366  08        PHP
  $B367  18        CLC
  $B368  00        BRK
  $B369  38        SEC
  $B36A  00        BRK
  $B36B  38        SEC
  $B36C  38        SEC
  $B36D  38        SEC
  $B36E  38        SEC
  $B36F  38        SEC
  $B370  08        PHP
  $B371  18        CLC
  $B372  08        PHP
  $B373  18        CLC
  $B374  08        PHP
  $B375  18        CLC
  $B376  08        PHP
  $B377  30 38     BMI $B3B1
  $B379  38        SEC
  $B37A  38        SEC
  $B37B  38        SEC
  $B37C  38        SEC
  $B37D  38        SEC
  $B37E  38        SEC
  $B37F  30 00     BMI $B381

L_B381:
  $B381  30 00     BMI $B383

L_B383:
  $B383  20 30 20  JSR $2030
  $B386  30 20     BMI $B3A8
  $B388  00        BRK
  $B389  30 00     BMI $B38B

L_B38B:
  $B38B  20 30 20  JSR $2030
  $B38E  30 20     BMI $B3B0
  $B390  08        PHP

L_B391:
  $B391  18        CLC
  $B392  08        PHP
  $B393  18        CLC
  $B394  08        PHP
  $B395  18        CLC
  $B396  08        PHP
  $B397  30 38     BMI $B3D1
  $B399  38        SEC
  $B39A  38        SEC
  $B39B  38        SEC
  $B39C  38        SEC
  $B39D  38        SEC
  $B39E  38        SEC
  $B39F  30 00     BMI $B3A1

L_B3A1:
  $B3A1  30 00     BMI $B3A3

L_B3A3:
  $B3A3  20 30 20  JSR $2030
  $B3A6  30 20     BMI $B3C8

L_B3A8:
  $B3A8  00        BRK
  $B3A9  30 00     BMI $B3AB

L_B3AB:
  $B3AB  20 30 20  JSR $2030
  $B3AE  30 20     BMI $B3D0

L_B3B0:
  $B3B0  08        PHP

L_B3B1:
  $B3B1  18        CLC
  $B3B2  08        PHP
  $B3B3  18        CLC
  $B3B4  08        PHP
  $B3B5  18        CLC
  $B3B6  08        PHP
  $B3B7  30 38     BMI $B3F1
  $B3B9  38        SEC
  $B3BA  38        SEC
  $B3BB  38        SEC
  $B3BC  38        SEC
  $B3BD  38        SEC
  $B3BE  38        SEC
  $B3BF  30 00     BMI $B3C1

L_B3C1:
  $B3C1  08        PHP
  $B3C2  00        BRK
  $B3C3  1E 0E 19  ASL $190E,X
  $B3C6  0B        .db $0B
  $B3C7  1F        .db $1F

L_B3C8:
  $B3C8  00        BRK
  $B3C9  38        SEC
  $B3CA  00        BRK
  $B3CB  3E 38 39  ROL $3938,X
  $B3CE  3B        .db $3B
  $B3CF  3E 0F 18  ROL $180F,X
  $B3D2  08        PHP
  $B3D3  18        CLC
  $B3D4  08        PHP
  $B3D5  1E 0E 30  ASL $300E,X
  $B3D8  3E 3B 39  ROL $393B,X
  $B3DB  38        SEC
  $B3DC  38        SEC
  $B3DD  3A        .db $3A
  $B3DE  3E 30 00  ROL $0030,X
  $B3E1  08        PHP
  $B3E2  00        BRK
  $B3E3  1E 0E 98  ASL $980E,X
  $B3E6  88        DEY
  $B3E7  98        TYA
  $B3E8  00        BRK
  $B3E9  38        SEC
  $B3EA  00        BRK
  $B3EB  3A        .db $3A
  $B3EC  3E B8 F8  ROL $F8B8,X
  $B3EF  78        SEI
  $B3F0  88        DEY

L_B3F1:
  $B3F1  18        CLC
  $B3F2  08        PHP
  $B3F3  18        CLC
  $B3F4  4E 1E 08  LSR $081E
  $B3F7  30 78     BMI $B471
  $B3F9  F8        SED
  $B3FA  B8        CLV
  $B3FB  38        SEC
  $B3FC  38        SEC
  $B3FD  3E 38 30  ROL $3038,X
  $B400  47        .db $47
  $B401  40        RTI
  $B402  4A        LSR
  $B403  40        RTI
  $B404  20 20 00  JSR $0020
  $B407  88        DEY
  $B408  80        .db $80
  $B409  80        .db $80
  $B40A  80        .db $80
  $B40B  80        .db $80
  $B40C  80        .db $80
  $B40D  04        .db $04
  $B40E  00        BRK
  $B40F  00        BRK
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
  $B42D  24 24     BIT $24
  $B42F  12        .db $12
  $B430  00        BRK
  $B431  00        BRK
  $B432  36 5A     ROL $5A,X
  $B434  12        .db $12
  $B435  12        .db $12
  $B436  12        .db $12
  $B437  00        BRK
  $B438  00        BRK
  $B439  48        PHA
  $B43A  12        .db $12
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
  $B460  94 01     STY $01,X
  $B462  95 01     STA $01,X
  $B464  96 01     STX $01,Y
  $B466  97        .db $97
  $B467  03        .db $03
  $B468  93        .db $93
  $B469  01 9F     ORA ($9F,X)
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  11 30     ORA ($30),Y
  $B46F  0F        .db $0F
  $B470  29 37     AND #$37
  $B472  91 03     STA ($03),Y
  $B474  92        .db $92
  $B475  03        .db $03
  $B476  93        .db $93
  $B477  03        .db $03
  $B478  94 03     STY $03,X
  $B47A  95 03     STA $03,X
  $B47C  9F        .db $9F
  $B47D  03        .db $03
  $B47E  0F        .db $0F
  $B47F  26 30     ROL $30
  $B481  0F        .db $0F
  $B482  14        .db $14
  $B483  34        .db $34
  $B484  94 01     STY $01,X
  $B486  95 01     STA $01,X
  $B488  96 01     STX $01,Y
  $B48A  97        .db $97
  $B48B  03        .db $03
  $B48C  93        .db $93
  $B48D  01 9F     ORA ($9F,X)
  $B48F  03        .db $03
  $B490  0F        .db $0F
  $B491  11 30     ORA ($30),Y
  $B493  0F        .db $0F
  $B494  26 37     ROL $37
  $B496  98        TYA
  $B497  06 99     ASL $99
  $B499  06 9A     ASL $9A
  $B49B  06 9B     ASL $9B
  $B49D  06 9C     ASL $9C
  $B49F  06 9D     ASL $9D
  $B4A1  06 0F     ASL $0F
  $B4A3  28        PLP
  $B4A4  15 0F     ORA $0F,X
  $B4A6  28        PLP
  $B4A7  15 AA     ORA $AA,X
  $B4A9  07        .db $07
  $B4AA  AB        .db $AB
  $B4AB  07        .db $07
  $B4AC  AC 07 AD  LDY $AD07
  $B4AF  07        .db $07
  $B4B0  AE 07 96  LDX $9607
  $B4B3  03        .db $03
  $B4B4  30 15     BMI $B4CB
  $B4B6  28        PLP
  $B4B7  27        .db $27
  $B4B8  29 19     AND #$19
  $B4BA  90 02     BCC $B4BE
  $B4BC  91 02     STA ($02),Y

L_B4BE:
  $B4BE  92        .db $92
  $B4BF  02        .db $02
  $B4C0  9E        .db $9E
  $B4C1  04        .db $04
  $B4C2  9C        .db $9C
  $B4C3  01 96     ORA ($96,X)
  $B4C5  03        .db $03
  $B4C6  0F        .db $0F
  $B4C7  27        .db $27
  $B4C8  30 0F     BMI $B4D9
  $B4CA  00        BRK

L_B4CB:
  $B4CB  20 FF FF  JSR $FFFF
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

L_B4D9:
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
  $B600  01 01     ORA ($01,X)
  $B602  02        .db $02
  $B603  02        .db $02
  $B604  02        .db $02
  $B605  03        .db $03
  $B606  03        .db $03
  $B607  03        .db $03
  $B608  04        .db $04
  $B609  04        .db $04
  $B60A  04        .db $04
  $B60B  05 05     ORA $05
  $B60D  07        .db $07
  $B60E  07        .db $07
  $B60F  08        PHP
  $B610  08        PHP
  $B611  08        PHP
  $B612  08        PHP
  $B613  08        PHP
  $B614  09 09     ORA #$09
  $B616  0A        ASL
  $B617  0A        ASL
  $B618  0A        ASL
  $B619  0A        ASL
  $B61A  0B        .db $0B
  $B61B  0B        .db $0B
  $B61C  0B        .db $0B
  $B61D  0B        .db $0B
  $B61E  0B        .db $0B
  $B61F  0C        .db $0C
  $B620  0C        .db $0C
  $B621  0C        .db $0C
  $B622  0C        .db $0C
  $B623  0E 0E 0F  ASL $0F0E
  $B626  0F        .db $0F
  $B627  0F        .db $0F
  $B628  0F        .db $0F
  $B629  0F        .db $0F
  $B62A  0F        .db $0F
  $B62B  0F        .db $0F
  $B62C  10 10     BPL $B63E
  $B62E  10 10     BPL $B640
  $B630  10 10     BPL $B642
  $B632  11 11     ORA ($11),Y
  $B634  11 11     ORA ($11),Y
  $B636  11 12     ORA ($12),Y
  $B638  12        .db $12
  $B639  12        .db $12
  $B63A  12        .db $12
  $B63B  12        .db $12
  $B63C  12        .db $12
  $B63D  14        .db $14

L_B63E:
  $B63E  18        CLC
  $B63F  19 1B 1C  ORA $1C1B,Y

L_B642:
  $B642  1D 1D 1E  ORA $1E1D,X
  $B645  1E 1E 1F  ASL $1F1E,X
  $B648  20 21 22  JSR $2221
  $B64B  23        .db $23
  $B64C  25 25     AND $25
  $B64E  2A        ROL
  $B64F  2A        ROL
  $B650  2A        ROL
  $B651  2A        ROL
  $B652  2A        ROL
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

L_B6AC:
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

L_B6F2:
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
  $B700  70 F0     BVS $B6F2
  $B702  90 A8     BCC $B6AC
  $B704  E8        INX
  $B705  48        PHA
  $B706  88        DEY
  $B707  D8        CLD
  $B708  28        PLP
  $B709  88        DEY
  $B70A  E8        INX
  $B70B  48        PHA
  $B70C  C8        INY
  $B70D  78        SEI
  $B70E  98        TYA
  $B70F  48        PHA
  $B710  68        PLA
  $B711  78        SEI
  $B712  A8        TAY
  $B713  A8        TAY
  $B714  B8        CLV
  $B715  E8        INX
  $B716  38        SEC
  $B717  58        CLI
  $B718  A8        TAY
  $B719  A8        TAY
  $B71A  08        PHP
  $B71B  38        SEC
  $B71C  68        PLA
  $B71D  A8        TAY
  $B71E  D8        CLD
  $B71F  48        PHA
  $B720  48        PHA
  $B721  98        TYA
  $B722  D8        CLD
  $B723  68        PLA
  $B724  E8        INX
  $B725  18        CLC
  $B726  48        PHA
  $B727  48        PHA
  $B728  78        SEI
  $B729  A8        TAY
  $B72A  D8        CLD
  $B72B  D8        CLD
  $B72C  08        PHP
  $B72D  38        SEC
  $B72E  68        PLA
  $B72F  98        TYA
  $B730  C8        INY
  $B731  F8        SED
  $B732  28        PLP
  $B733  58        CLI
  $B734  88        DEY
  $B735  B8        CLV
  $B736  E8        INX
  $B737  18        CLC
  $B738  48        PHA
  $B739  78        SEI
  $B73A  78        SEI
  $B73B  A8        TAY
  $B73C  D8        CLD
  $B73D  50 08     BVC $B747
  $B73F  10 20     BPL $B761
  $B741  30 48     BMI $B78B
  $B743  B8        CLV
  $B744  48        PHA
  $B745  A8        TAY
  $B746  E8        INX

L_B747:
  $B747  F0 6C     BEQ $B7B5
  $B749  4C 44 98  JMP $9844
  $B74C  10 10     BPL $B75E
  $B74E  28        PLP
  $B74F  68        PLA
  $B750  98        TYA
  $B751  D8        CLD
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

L_B75E:
  $B75E  FF        .db $FF
  $B75F  FF        .db $FF
  $B760  FF        .db $FF

L_B761:
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

L_B78B:
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

L_B7B5:
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

L_B7FF:
  $B7FF  FF        .db $FF
  $B800  10 10     BPL $B812
  $B802  10 58     BPL $B85C
  $B804  78        SEI
  $B805  48        PHA
  $B806  68        PLA
  $B807  98        TYA
  $B808  58        CLI
  $B809  58        CLI
  $B80A  38        SEC
  $B80B  58        CLI
  $B80C  58        CLI
  $B80D  98        TYA
  $B80E  58        CLI
  $B80F  C8        INY
  $B810  37        .db $37
  $B811  57        .db $57

L_B812:
  $B812  47        .db $47
  $B813  77        .db $77
  $B814  58        CLI
  $B815  78        SEI
  $B816  A7        .db $A7
  $B817  48        PHA
  $B818  67        .db $67
  $B819  97        .db $97
  $B81A  88        DEY
  $B81B  78        SEI
  $B81C  48        PHA
  $B81D  A7        .db $A7
  $B81E  48        PHA
  $B81F  77        .db $77
  $B820  A7        .db $A7
  $B821  48        PHA
  $B822  B7        .db $B7
  $B823  B8        CLV
  $B824  77        .db $77
  $B825  77        .db $77
  $B826  47        .db $47
  $B827  77        .db $77
  $B828  47        .db $47
  $B829  77        .db $77
  $B82A  47        .db $47
  $B82B  77        .db $77
  $B82C  47        .db $47
  $B82D  47        .db $47
  $B82E  67        .db $67
  $B82F  67        .db $67
  $B830  67        .db $67
  $B831  67        .db $67
  $B832  67        .db $67
  $B833  77        .db $77
  $B834  67        .db $67
  $B835  57        .db $57
  $B836  47        .db $47
  $B837  97        .db $97
  $B838  97        .db $97
  $B839  67        .db $67
  $B83A  97        .db $97
  $B83B  77        .db $77
  $B83C  67        .db $67
  $B83D  94 30     STY $30,X
  $B83F  30 30     BMI $B871
  $B841  30 BC     BMI $B7FF
  $B843  AC 9C AC  LDY $AC9C
  $B846  9C        .db $9C
  $B847  BC 5C 64  LDY $645C,X
  $B84A  74        .db $74
  $B84B  B8        CLV
  $B84C  38        SEC
  $B84D  88        DEY
  $B84E  98        TYA
  $B84F  98        TYA
  $B850  88        DEY
  $B851  88        DEY
  $B852  98        TYA
  $B853  FF        .db $FF
  $B854  FF        .db $FF
  $B855  FF        .db $FF
  $B856  FF        .db $FF
  $B857  FF        .db $FF
  $B858  FF        .db $FF
  $B859  FF        .db $FF
  $B85A  FF        .db $FF
  $B85B  FF        .db $FF

L_B85C:
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

L_B871:
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
  $B900  2B        .db $2B
  $B901  2B        .db $2B
  $B902  2B        .db $2B
  $B903  21 21     AND ($21,X)
  $B905  21 21     AND ($21,X)
  $B907  21 21     AND ($21,X)
  $B909  21 21     AND ($21,X)
  $B90B  21 21     AND ($21,X)
  $B90D  46 46     LSR $46
  $B90F  46 53     LSR $53
  $B911  55 54     EOR $54,X
  $B913  53        .db $53
  $B914  21 21     AND ($21,X)
  $B916  53        .db $53
  $B917  21 54     AND ($54,X)
  $B919  53        .db $53
  $B91A  21 21     AND ($21,X)
  $B91C  21 53     AND ($53,X)
  $B91E  21 55     AND ($55,X)
  $B920  53        .db $53
  $B921  21 53     AND ($53,X)
  $B923  46 53     LSR $53
  $B925  53        .db $53
  $B926  54        .db $54
  $B927  53        .db $53
  $B928  53        .db $53
  $B929  53        .db $53
  $B92A  54        .db $54
  $B92B  53        .db $53
  $B92C  53        .db $53
  $B92D  53        .db $53
  $B92E  53        .db $53
  $B92F  53        .db $53
  $B930  53        .db $53
  $B931  53        .db $53
  $B932  53        .db $53
  $B933  53        .db $53
  $B934  53        .db $53
  $B935  53        .db $53
  $B936  53        .db $53
  $B937  53        .db $53
  $B938  53        .db $53
  $B939  54        .db $54
  $B93A  53        .db $53
  $B93B  53        .db $53
  $B93C  53        .db $53
  $B93D  4E 39 37  LSR $3739
  $B940  37        .db $37
  $B941  39 50 50  AND $5050,Y
  $B944  50 50     BVC $B996
  $B946  50 50     BVC $B998
  $B948  50 4F     BVC $B999
  $B94A  4F        .db $4F
  $B94B  46 21     LSR $21
  $B94D  21 63     AND ($63,X)
  $B94F  63        .db $63
  $B950  63        .db $63
  $B951  63        .db $63
  $B952  64        .db $64
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

L_B996:
  $B996  FF        .db $FF
  $B997  FF        .db $FF

L_B998:
  $B998  FF        .db $FF

L_B999:
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
  $BA00  0B        .db $0B
  $BA01  0C        .db $0C
  $BA02  0C        .db $0C
  $BA03  11 15     ORA ($15),Y
  $BA05  15 16     ORA $16,X
  $BA07  16 17     ASL $17,X
  $BA09  17        .db $17
  $BA0A  20 21 FF  JSR $FF21
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
  $BA41  58        CLI
  $BA42  E8        INX
  $BA43  B8        CLV
  $BA44  F8        SED
  $BA45  F8        SED
  $BA46  F8        SED
  $BA47  F8        SED
  $BA48  08        PHP
  $BA49  08        PHP
  $BA4A  40        RTI
  $BA4B  38        SEC
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
  $BA80  AF        .db $AF
  $BA81  8F        .db $8F
  $BA82  AF        .db $AF
  $BA83  A8        TAY
  $BA84  6F        .db $6F
  $BA85  8F        .db $8F
  $BA86  6F        .db $6F
  $BA87  8F        .db $8F
  $BA88  6F        .db $6F
  $BA89  8F        .db $8F
  $BA8A  58        CLI
  $BA8B  68        PLA
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
  $BAC0  2D 2D 2D  AND $2D2D
  $BAC3  7B        .db $7B
  $BAC4  2F        .db $2F
  $BAC5  2F        .db $2F
  $BAC6  2F        .db $2F
  $BAC7  2F        .db $2F
  $BAC8  2F        .db $2F
  $BAC9  2F        .db $2F
  $BACA  7B        .db $7B
  $BACB  78        SEI
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
  $BB00  A4 B4     LDY $B4
  $BB02  94 B4     STY $B4,X
  $BB04  B4 B4     LDY $B4,X
  $BB06  00        BRK
  $BB07  09 16     ORA #$16
  $BB09  18        CLC
  $BB0A  21 21     AND ($21,X)
  $BB0C  00        BRK
  $BB0D  14        .db $14
  $BB0E  3E 3E 49  ROL $493E,X
  $BB11  49 00     EOR #$00
  $BB13  00        BRK
  $BB14  06 0A     ASL $0A
  $BB16  0C        .db $0C
  $BB17  0C        .db $0C
  $BB18  84 87     STY $87
  $BB1A  8A        TXA
  $BB1B  8A        TXA
  $BB1C  8D 8D E0  STA $E08D
  $BB1F  20 60 E0  JSR $E060
  $BB22  20 20 85  JSR $8520
  $BB25  87        .db $87
  $BB26  8A        TXA
  $BB27  8B        .db $8B
  $BB28  8D 8D 60  STA $608D
  $BB2B  A0 A0     LDY #$A0
  $BB2D  60        RTS
  $BB2E  A0 A0     LDY #$A0
  $BB30  00        BRK
  $BB31  02        .db $02
  $BB32  05 07     ORA $07
  $BB34  08        PHP
  $BB35  08        PHP
  $BB36  00        BRK
  $BB37  09 16     ORA #$16
  $BB39  18        CLC
  $BB3A  21 21     AND ($21,X)
  $BB3C  07        .db $07
  $BB3D  13        .db $13
  $BB3E  16 20     ASL $20,X
  $BB40  21 21     AND ($21,X)
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
  $BC06  09 94     ORA #$94
  $BC08  04        .db $04
  $BC09  01 93     ORA ($93,X)
  $BC0B  01 01     ORA ($01,X)
  $BC0D  9F        .db $9F
  $BC0E  01 03     ORA ($03,X)
  $BC10  80        .db $80
  $BC11  06 09     ASL $09
  $BC13  A0 0A     LDY #$0A
  $BC15  00        BRK
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
  $BD00  07        .db $07
  $BD01  90 09     BCC $BD0C
  $BD03  00        BRK
  $BD04  84 01     STY $01
  $BD06  09 94     ORA #$94
  $BD08  04        .db $04
  $BD09  01 93     ORA ($93,X)
  $BD0B  01 01     ORA ($01,X)
  $BD0D  9F        .db $9F
  $BD0E  01 03     ORA ($03,X)
  $BD10  80        .db $80
  $BD11  06 09     ASL $09
  $BD13  AA        TAX
  $BD14  0A        ASL
  $BD15  00        BRK
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
  $BE00  03        .db $03
  $BE01  06 0F     ASL $0F
  $BE03  36 26     ROL $26,X
  $BE05  15 0F     ORA $0F,X
  $BE07  30 10     BMI $BE19
  $BE09  00        BRK
  $BE0A  0F        .db $0F
  $BE0B  16 05     ASL $05,X
  $BE0D  07        .db $07
  $BE0E  0F        .db $0F
  $BE0F  36 26     ROL $26,X
  $BE11  16 0F     ASL $0F,X
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  11 30     ORA ($30),Y
  $BE1E  0F        .db $0F
  $BE1F  0F        .db $0F
  $BE20  29 37     AND #$37
  $BE22  0F        .db $0F
  $BE23  36 26     ROL $26,X
  $BE25  15 0F     ORA $0F,X
  $BE27  30 10     BMI $BE39
  $BE29  00        BRK
  $BE2A  0F        .db $0F
  $BE2B  16 05     ASL $05,X
  $BE2D  07        .db $07
  $BE2E  0F        .db $0F
  $BE2F  36 26     ROL $26,X
  $BE31  16 0F     ASL $0F,X
  $BE33  36 26     ROL $26,X
  $BE35  15 0F     ORA $0F,X
  $BE37  30 10     BMI $BE49

L_BE39:
  $BE39  00        BRK
  $BE3A  0F        .db $0F
  $BE3B  16 05     ASL $05,X
  $BE3D  07        .db $07
  $BE3E  0F        .db $0F
  $BE3F  26 16     ROL $16
  $BE41  36 0F     ROL $0F,X
  $BE43  36 26     ROL $26,X
  $BE45  15 0F     ORA $0F,X
  $BE47  30 10     BMI $BE59

L_BE49:
  $BE49  00        BRK
  $BE4A  0F        .db $0F
  $BE4B  16 05     ASL $05,X
  $BE4D  07        .db $07
  $BE4E  0F        .db $0F
  $BE4F  16 36     ASL $36,X
  $BE51  26 FF     ROL $FF
  $BE53  FF        .db $FF
  $BE54  FF        .db $FF
  $BE55  FF        .db $FF
  $BE56  FF        .db $FF
  $BE57  FF        .db $FF
  $BE58  FF        .db $FF

L_BE59:
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
  $BF03  20 10 0C  JSR $0C10
  $BF06  0F        .db $0F
  $BF07  1C        .db $1C
  $BF08  0C        .db $0C
  $BF09  0C        .db $0C
  $BF0A  0F        .db $0F
  $BF0B  38        SEC
  $BF0C  27        .db $27
  $BF0D  07        .db $07
  $BF0E  0F        .db $0F
  $BF0F  2C 1B 0C  BIT $0C1B
  $BF12  0F        .db $0F
  $BF13  0F        .db $0F
  $BF14  2C 11 0F  BIT $0F11
  $BF17  0F        .db $0F
  $BF18  20 38 0F  JSR $0F38
  $BF1B  0F        .db $0F
  $BF1C  11 30     ORA ($30),Y
  $BF1E  0F        .db $0F
  $BF1F  0F        .db $0F
  $BF20  29 37     AND #$37
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