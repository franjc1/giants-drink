; Mega Man 2 — PRG Bank 7
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  00        BRK
  $8003  00        BRK
  $8004  01 01     ORA ($01,X)
  $8006  01 01     ORA ($01,X)
  $8008  01 01     ORA ($01,X)
  $800A  01 01     ORA ($01,X)
  $800C  01 01     ORA ($01,X)
  $800E  01 01     ORA ($01,X)
  $8010  01 01     ORA ($01,X)
  $8012  01 01     ORA ($01,X)
  $8014  3A        .db $3A
  $8015  3A        .db $3A
  $8016  39 39 38  AND $3839,Y
  $8019  38        SEC
  $801A  39 39 01  AND $0139,Y
  $801D  58        CLI
  $801E  01 7F     ORA ($7F,X)
  $8020  06 00     ASL $00
  $8022  07        .db $07
  $8023  00        BRK
  $8024  5E 01 5E  LSR $5E01,X
  $8027  01 01     ORA ($01,X)
  $8029  5E 01 5E  LSR $5E01,X
  $802C  5F        .db $5F
  $802D  01 01     ORA ($01,X)
  $802F  01 01     ORA ($01,X)
  $8031  01 01     ORA ($01,X)
  $8033  45 45     EOR $45
  $8035  01 5E     ORA ($5E,X)
  $8037  01 5E     ORA ($5E,X)
  $8039  01 5F     ORA ($5F,X)
  $803B  01 01     ORA ($01,X)
  $803D  45 01     EOR $01
  $803F  5E 08 00  LSR $0008,X
  $8042  08        PHP
  $8043  00        BRK
  $8044  78        SEI
  $8045  66 61     ROR $61
  $8047  7B        .db $7B
  $8048  61 67     ADC ($67,X)
  $804A  62        .db $62
  $804B  78        SEI
  $804C  6A        ROR
  $804D  63        .db $63
  $804E  67        .db $67
  $804F  79 66 79  ADC $7966,Y
  $8052  78        SEI
  $8053  66 5A     ROR $5A
  $8055  64        .db $64
  $8056  5B        .db $5B
  $8057  65 02     ADC $02
  $8059  03        .db $03
  $805A  02        .db $02
  $805B  03        .db $03
  $805C  78        SEI
  $805D  6B        .db $6B
  $805E  1D 1D 63  ORA $631D,X
  $8061  66 59     ROR $59
  $8063  7B        .db $7B
  $8064  62        .db $62
  $8065  78        SEI
  $8066  7A        .db $7A
  $8067  79 59 67  ADC $6759,Y
  $806A  62        .db $62
  $806B  78        SEI
  $806C  7C        .db $7C
  $806D  62        .db $62
  $806E  63        .db $63
  $806F  66 61     ROR $61
  $8071  7B        .db $7B
  $8072  62        .db $62
  $8073  6B        .db $6B
  $8074  66 6A     ROR $6A
  $8076  78        SEI
  $8077  7B        .db $7B
  $8078  79 7B 67  ADC $677B,Y
  $807B  7B        .db $7B
  $807C  66 6B     ROR $6B
  $807E  78        SEI
  $807F  6A        ROR

L_8080:
  $8080  78        SEI
  $8081  66 61     ROR $61
  $8083  6B        .db $6B
  $8084  79 67 63  ADC $6367,Y
  $8087  78        SEI
  $8088  6A        ROR
  $8089  7A        .db $7A
  $808A  6B        .db $6B
  $808B  63        .db $63
  $808C  66 61     ROR $61
  $808E  78        SEI
  $808F  61 61     ADC ($61,X)
  $8091  6A        ROR
  $8092  61 7B     ADC ($7B,X)
  $8094  62        .db $62
  $8095  79 7A 78  ADC $787A,Y
  $8098  61 61     ADC ($61,X)
  $809A  6A        ROR
  $809B  62        .db $62
  $809C  6A        ROR
  $809D  62        .db $62
  $809E  78        SEI
  $809F  66 5E     ROR $5E
  $80A1  6A        ROR
  $80A2  5E 78 6A  LSR $6A78,X
  $80A5  5E 78 5E  LSR $5E78,X
  $80A8  58        CLI
  $80A9  01 7C     ORA ($7C,X)
  $80AB  01 7C     ORA ($7C,X)
  $80AD  01 7C     ORA ($7C,X)
  $80AF  01 7F     ORA ($7F,X)
  $80B1  01 01     ORA ($01,X)
  $80B3  01 67     ORA ($67,X)
  $80B5  6A        ROR
  $80B6  7C        .db $7C
  $80B7  63        .db $63
  $80B8  01 01     ORA ($01,X)
  $80BA  61 6A     ADC ($6A,X)
  $80BC  7C        .db $7C
  $80BD  7C        .db $7C
  $80BE  6B        .db $6B
  $80BF  7C        .db $7C
  $80C0  02        .db $02
  $80C1  04        .db $04
  $80C2  02        .db $02
  $80C3  05 01     ORA $01
  $80C5  5E 6A 5E  LSR $5E6A,X
  $80C8  01 01     ORA ($01,X)
  $80CA  01 58     ORA ($58,X)
  $80CC  01 7F     ORA ($7F,X)
  $80CE  01 01     ORA ($01,X)
  $80D0  6A        ROR
  $80D1  01 6B     ORA ($6B,X)
  $80D3  01 3A     ORA ($3A,X)
  $80D5  00        BRK
  $80D6  39 00 7B  AND $7B00,Y
  $80D9  01 6B     ORA ($6B,X)
  $80DB  01 6A     ORA ($6A,X)
  $80DD  01 7C     ORA ($7C,X)
  $80DF  01 01     ORA ($01,X)
  $80E1  62        .db $62
  $80E2  01 7A     ORA ($7A,X)
  $80E4  01 7A     ORA ($7A,X)
  $80E6  01 63     ORA ($63,X)
  $80E8  01 62     ORA ($62,X)
  $80EA  01 63     ORA ($63,X)
  $80EC  01 01     ORA ($01,X)
  $80EE  61 79     ADC ($79,X)
  $80F0  6A        ROR
  $80F1  01 78     ORA ($78,X)
  $80F3  61 63     ADC ($63,X)
  $80F5  78        SEI
  $80F6  1D 1D 61  ORA $611D,X
  $80F9  61 01     ADC ($01,X)
  $80FB  01 1D     ORA ($1D,X)
  $80FD  1D 08 08  ORA $0808,X
  $8100  17        .db $17
  $8101  09 3E     ORA #$3E
  $8103  0A        ASL
  $8104  83        .db $83
  $8105  83        .db $83
  $8106  7F        .db $7F
  $8107  01 83     ORA ($83,X)
  $8109  01 58     ORA ($58,X)
  $810B  01 7C     ORA ($7C,X)
  $810D  01 83     ORA ($83,X)
  $810F  83        .db $83
  $8110  17        .db $17
  $8111  0B        .db $0B
  $8112  16 00     ASL $00,X
  $8114  15 15     ORA $15,X
  $8116  15 16     ORA $16,X
  $8118  01 83     ORA ($83,X)
  $811A  01 7C     ORA ($7C,X)
  $811C  00        BRK
  $811D  00        BRK
  $811E  00        BRK
  $811F  00        BRK
  $8120  16 3E     ASL $3E,X
  $8122  17        .db $17
  $8123  09 01     ORA #$01
  $8125  58        CLI
  $8126  01 83     ORA ($83,X)
  $8128  3E 0A 17  ROL $170A,X
  $812B  0B        .db $0B
  $812C  83        .db $83
  $812D  83        .db $83
  $812E  79 61 83  ADC $8361,Y
  $8131  01 6A     ORA ($6A,X)
  $8133  62        .db $62
  $8134  83        .db $83
  $8135  83        .db $83
  $8136  62        .db $62
  $8137  79 0A 3E  ADC $3E0A,Y
  $813A  17        .db $17
  $813B  00        BRK
  $813C  83        .db $83
  $813D  83        .db $83
  $813E  6B        .db $6B
  $813F  01 01     ORA ($01,X)
  $8141  01 83     ORA ($83,X)
  $8143  83        .db $83
  $8144  01 01     ORA ($01,X)
  $8146  83        .db $83
  $8147  01 83     ORA ($83,X)
  $8149  83        .db $83
  $814A  01 01     ORA ($01,X)
  $814C  83        .db $83
  $814D  01 01     ORA ($01,X)
  $814F  01 6A     ORA ($6A,X)
  $8151  01 83     ORA ($83,X)
  $8153  83        .db $83
  $8154  16 15     ASL $15,X
  $8156  09 16     ORA #$16
  $8158  01 01     ORA ($01,X)
  $815A  34        .db $34
  $815B  33        .db $33
  $815C  63        .db $63
  $815D  78        SEI
  $815E  83        .db $83
  $815F  83        .db $83
  $8160  62        .db $62
  $8161  61 83     ADC ($83,X)
  $8163  83        .db $83
  $8164  59 69 83  EOR $8369,Y
  $8167  83        .db $83
  $8168  83        .db $83
  $8169  83        .db $83
  $816A  79 79 83  ADC $8379,Y
  $816D  83        .db $83
  $816E  63        .db $63
  $816F  7B        .db $7B
  $8170  83        .db $83
  $8171  83        .db $83
  $8172  7C        .db $7C
  $8173  01 62     ORA ($62,X)
  $8175  61 7C     ADC ($7C,X)
  $8177  01 01     ORA ($01,X)
  $8179  83        .db $83
  $817A  79 61 01  ADC $0161,Y
  $817D  01 01     ORA ($01,X)
  $817F  30 30     BMI $81B1
  $8181  34        .db $34
  $8182  31 01     AND ($01),Y
  $8184  31 01     AND ($01),Y
  $8186  31 01     AND ($01),Y
  $8188  31 01     AND ($01),Y
  $818A  32        .db $32
  $818B  34        .db $34
  $818C  35 01     AND $01,X
  $818E  01 01     ORA ($01,X)
  $8190  35 01     AND $01,X
  $8192  30 34     BMI $81C8
  $8194  01 31     ORA ($31,X)
  $8196  01 31     ORA ($31,X)
  $8198  30 35     BMI $81CF
  $819A  31 30     AND ($30),Y
  $819C  31 32     AND ($32),Y
  $819E  31 01     AND ($01),Y
  $81A0  34        .db $34
  $81A1  34        .db $34
  $81A2  01 01     ORA ($01,X)
  $81A4  31 01     AND ($01),Y
  $81A6  2D 2C 01  AND $012C
  $81A9  01 34     ORA ($34,X)
  $81AB  34        .db $34
  $81AC  31 30     AND ($30),Y
  $81AE  31 31     AND ($31),Y
  $81B0  31 32     AND ($32),Y
  $81B2  32        .db $32
  $81B3  34        .db $34
  $81B4  34        .db $34
  $81B5  35 34     AND $34,X
  $81B7  34        .db $34
  $81B8  33        .db $33
  $81B9  31 31     AND ($31),Y
  $81BB  31 31     AND ($31),Y
  $81BD  31 31     AND ($31),Y
  $81BF  31 33     AND ($33),Y
  $81C1  01 31     ORA ($31,X)
  $81C3  01 2D     ORA ($2D,X)
  $81C5  2C 31 01  BIT $0131

L_81C8:
  $81C8  31 01     AND ($01),Y
  $81CA  35 01     AND $01,X
  $81CC  01 30     ORA ($30,X)
  $81CE  33        .db $33

L_81CF:
  $81CF  31 34     AND ($34),Y
  $81D1  34        .db $34
  $81D2  34        .db $34
  $81D3  34        .db $34
  $81D4  31 31     AND ($31),Y
  $81D6  35 31     AND $31,X
  $81D8  35 31     AND $31,X
  $81DA  01 31     ORA ($31,X)
  $81DC  34        .db $34
  $81DD  35 33     AND $33,X
  $81DF  30 30     BMI $8211
  $81E1  34        .db $34
  $81E2  31 30     AND ($30),Y
  $81E4  32        .db $32
  $81E5  35 34     AND $34,X
  $81E7  34        .db $34
  $81E8  33        .db $33
  $81E9  30 32     BMI $821D
  $81EB  35 1D     AND $1D,X
  $81ED  01 49     ORA ($49,X)
  $81EF  49 47     EOR #$47
  $81F1  4C 47 4D  JMP $4D47
  $81F4  4E 4B 4F  LSR $4F4B
  $81F7  4B        .db $4B
  $81F8  1D 01 49  ORA $4901,X
  $81FB  4A        LSR
  $81FC  0A        ASL
  $81FD  16 0B     ASL $0B,X
  $81FF  3E 09 16  ROL $1609,X
  $8202  0A        ASL
  $8203  3E 17 00  ROL $0017,X
  $8206  17        .db $17
  $8207  0E 0C 0D  ASL $0D0C
  $820A  0E 0F 01  ASL $010F
  $820D  01 59     ORA ($59,X)
  $820F  69 59     ADC #$59

L_8211:
  $8211  69 01     ADC #$01
  $8213  01 0C     ORA ($0C,X)
  $8215  0D 3F 0C  ORA $0C3F
  $8218  09 16     ORA #$16
  $821A  0A        ASL
  $821B  16 01     ASL $01,X

L_821D:
  $821D  62        .db $62
  $821E  01 7A     ORA ($7A,X)
  $8220  83        .db $83
  $8221  83        .db $83
  $8222  61 6B     ADC ($6B,X)
  $8224  83        .db $83
  $8225  83        .db $83
  $8226  63        .db $63
  $8227  78        SEI
  $8228  3F        .db $3F
  $8229  0C        .db $0C
  $822A  0E 0F 3F  ASL $3F0F
  $822D  0C        .db $0C
  $822E  0F        .db $0F
  $822F  0F        .db $0F
  $8230  01 83     ORA ($83,X)
  $8232  01 62     ORA ($62,X)
  $8234  1D 63 1D  ORA $1D63,X
  $8237  01 01     ORA ($01,X)
  $8239  7A        .db $7A
  $823A  01 63     ORA ($63,X)
  $823C  83        .db $83
  $823D  7C        .db $7C
  $823E  01 7C     ORA ($7C,X)
  $8240  01 01     ORA ($01,X)
  $8242  01 58     ORA ($58,X)
  $8244  0D 10 0F  ORA $0F10
  $8247  11 3E     ORA ($3E),Y
  $8249  15 15     ORA $15,X
  $824B  00        BRK
  $824C  00        BRK
  $824D  15 0C     ORA $0C,X
  $824F  16 7A     ASL $7A,X
  $8251  61 63     ADC ($63,X)
  $8253  61 62     ADC ($62,X)
  $8255  6B        .db $6B
  $8256  7C        .db $7C
  $8257  01 01     ORA ($01,X)
  $8259  7C        .db $7C
  $825A  61 6B     ADC ($6B,X)
  $825C  01 01     ORA ($01,X)
  $825E  01 62     ORA ($62,X)
  $8260  61 6B     ADC ($6B,X)
  $8262  01 01     ORA ($01,X)
  $8264  01 62     ORA ($62,X)
  $8266  01 7C     ORA ($7C,X)
  $8268  01 7C     ORA ($7C,X)
  $826A  01 63     ORA ($63,X)
  $826C  01 01     ORA ($01,X)
  $826E  61 61     ADC ($61,X)
  $8270  7C        .db $7C
  $8271  01 7B     ORA ($7B,X)
  $8273  01 78     ORA ($78,X)
  $8275  6A        ROR
  $8276  01 7C     ORA ($7C,X)
  $8278  79 6B 7C  ADC $7C6B,Y
  $827B  01 6B     ORA ($6B,X)
  $827D  01 01     ORA ($01,X)
  $827F  01 0D     ORA ($0D,X)
  $8281  17        .db $17
  $8282  0F        .db $0F
  $8283  3E 7A 79  ROL $797A,X
  $8286  7C        .db $7C
  $8287  7C        .db $7C
  $8288  7C        .db $7C
  $8289  7C        .db $7C
  $828A  7A        .db $7A
  $828B  7B        .db $7B
  $828C  78        SEI
  $828D  61 1D     ADC ($1D,X)
  $828F  1D 7C 7C  ORA $7C7C,X
  $8292  7C        .db $7C
  $8293  7C        .db $7C
  $8294  01 01     ORA ($01,X)
  $8296  61 6A     ADC ($6A,X)
  $8298  01 1D     ORA ($1D,X)
  $829A  62        .db $62
  $829B  79 1D 1D  ADC $1D1D,Y
  $829E  79 6A 01  ADC $016A,Y
  $82A1  3E 01 01  ROL $0101,X
  $82A4  01 01     ORA ($01,X)
  $82A6  01 28     ORA ($28,X)
  $82A8  01 3E     ORA ($3E,X)
  $82AA  01 28     ORA ($28,X)
  $82AC  28        PLP
  $82AD  01 3E     ORA ($3E,X)
  $82AF  01 20     ORA ($20,X)
  $82B1  01 01     ORA ($01,X)
  $82B3  20 20 28  JSR $2820
  $82B6  01 01     ORA ($01,X)
  $82B8  3E 01 28  ROL $2801,X
  $82BB  01 01     ORA ($01,X)
  $82BD  28        PLP
  $82BE  28        PLP
  $82BF  01 01     ORA ($01,X)
  $82C1  01 3E     ORA ($3E,X)
  $82C3  01 28     ORA ($28,X)
  $82C5  01 01     ORA ($01,X)
  $82C7  01 20     ORA ($20,X)
  $82C9  01 3D     ORA ($3D,X)
  $82CB  01 01     ORA ($01,X)
  $82CD  3D 01 20  AND $2001,X
  $82D0  17        .db $17
  $82D1  10 3E     BPL $8311
  $82D3  11 12     ORA ($12),Y
  $82D5  13        .db $13
  $82D6  13        .db $13
  $82D7  01 10     ORA ($10,X)
  $82D9  12        .db $12
  $82DA  11 14     ORA ($14),Y
  $82DC  00        BRK
  $82DD  15 15     ORA $15,X
  $82DF  16 10     ASL $10,X
  $82E1  13        .db $13
  $82E2  11 14     ORA ($14),Y
  $82E4  12        .db $12
  $82E5  12        .db $12
  $82E6  14        .db $14
  $82E7  13        .db $13
  $82E8  01 00     ORA ($00,X)
  $82EA  01 00     ORA ($00,X)
  $82EC  12        .db $12
  $82ED  00        BRK
  $82EE  14        .db $14
  $82EF  00        BRK
  $82F0  3F        .db $3F
  $82F1  00        BRK
  $82F2  3F        .db $3F
  $82F3  00        BRK
  $82F4  01 00     ORA ($00,X)
  $82F6  14        .db $14
  $82F7  00        BRK
  $82F8  12        .db $12
  $82F9  00        BRK
  $82FA  01 00     ORA ($00,X)
  $82FC  38        SEC
  $82FD  00        BRK
  $82FE  39 00 63  AND $6300,Y
  $8301  66 59     ROR $59
  $8303  7B        .db $7B
  $8304  62        .db $62
  $8305  78        SEI
  $8306  67        .db $67
  $8307  79 6A 01  ADC $016A,Y
  $830A  7C        .db $7C
  $830B  01 7B     ORA ($7B,X)
  $830D  01 6B     ORA ($6B,X)
  $830F  01 63     ORA ($63,X)

L_8311:
  $8311  78        SEI
  $8312  01 01     ORA ($01,X)
  $8314  78        SEI
  $8315  6B        .db $6B
  $8316  01 01     ORA ($01,X)
  $8318  83        .db $83
  $8319  83        .db $83
  $831A  01 01     ORA ($01,X)
  $831C  83        .db $83
  $831D  83        .db $83
  $831E  63        .db $63
  $831F  79 83 83  ADC $8383,Y
  $8322  67        .db $67
  $8323  78        SEI
  $8324  83        .db $83
  $8325  83        .db $83
  $8326  1F        .db $1F
  $8327  01 83     ORA ($83,X)
  $8329  83        .db $83
  $832A  6B        .db $6B
  $832B  01 61     ORA ($61,X)
  $832D  61 1F     ADC ($1F,X)
  $832F  01 6B     ORA ($6B,X)
  $8331  01 01     ORA ($01,X)
  $8333  01 62     ORA ($62,X)
  $8335  79 7A 78  ADC $787A,Y
  $8338  1F        .db $1F
  $8339  01 1F     ORA ($1F,X)
  $833B  01 83     ORA ($83,X)
  $833D  31 01     AND ($01),Y
  $833F  31 78     AND ($78),Y
  $8341  66 61     ROR $61
  $8343  6B        .db $6B
  $8344  79 67 63  ADC $6367,Y
  $8347  78        SEI
  $8348  6A        ROR
  $8349  7A        .db $7A
  $834A  6B        .db $6B
  $834B  63        .db $63
  $834C  66 61     ROR $61
  $834E  78        SEI
  $834F  61 61     ADC ($61,X)
  $8351  6A        ROR
  $8352  61 7B     ADC ($7B,X)
  $8354  62        .db $62
  $8355  79 7A 78  ADC $787A,Y
  $8358  61 61     ADC ($61,X)
  $835A  6A        ROR
  $835B  62        .db $62
  $835C  6A        ROR
  $835D  62        .db $62
  $835E  78        SEI
  $835F  66 63     ROR $63
  $8361  66 59     ROR $59
  $8363  7B        .db $7B
  $8364  62        .db $62
  $8365  78        SEI
  $8366  67        .db $67
  $8367  79 61 67  ADC $6761,Y
  $836A  62        .db $62
  $836B  78        SEI
  $836C  66 6A     ROR $6A
  $836E  78        SEI
  $836F  7B        .db $7B
  $8370  1D 7C 1D  ORA $1D7C,X
  $8373  7C        .db $7C
  $8374  83        .db $83
  $8375  83        .db $83
  $8376  61 79     ADC ($79,X)
  $8378  7C        .db $7C
  $8379  1D 7C 01  ORA $017C,X
  $837C  79 78 63  ADC $6378,Y
  $837F  69 83     ADC #$83
  $8381  83        .db $83
  $8382  01 01     ORA ($01,X)
  $8384  78        SEI
  $8385  6B        .db $6B
  $8386  01 01     ORA ($01,X)
  $8388  63        .db $63
  $8389  78        SEI
  $838A  01 01     ORA ($01,X)
  $838C  01 83     ORA ($83,X)
  $838E  79 61 01  ADC $0161,Y
  $8391  01 83     ORA ($83,X)
  $8393  83        .db $83
  $8394  83        .db $83
  $8395  01 01     ORA ($01,X)
  $8397  01 83     ORA ($83,X)
  $8399  83        .db $83
  $839A  58        CLI
  $839B  01 63     ORA ($63,X)
  $839D  66 61     ROR $61
  $839F  7B        .db $7B
  $83A0  1D 1C 1D  ORA $1D1C,X
  $83A3  00        BRK
  $83A4  1C        .db $1C
  $83A5  00        BRK
  $83A6  1D 00 1D  ORA $1D00,X
  $83A9  00        BRK
  $83AA  1D 1C 1C  ORA $1C1C,X
  $83AD  00        BRK
  $83AE  00        BRK
  $83AF  1C        .db $1C
  $83B0  1C        .db $1C
  $83B1  00        BRK
  $83B2  1D 1D 1D  ORA $1D1D,X
  $83B5  1C        .db $1C
  $83B6  00        BRK
  $83B7  1D 1D 1D  ORA $1D1D,X
  $83BA  61 61     ADC ($61,X)
  $83BC  1D 1D 83  ORA $831D,X
  $83BF  83        .db $83
  $83C0  83        .db $83
  $83C1  83        .db $83
  $83C2  1D 1D 78  ORA $781D,X
  $83C5  6B        .db $6B
  $83C6  1D 1D 1D  ORA $1D1D,X
  $83C9  1D 1C 1D  ORA $1D1C,X
  $83CC  6A        ROR
  $83CD  01 7B     ORA ($7B,X)

L_83CF:
  $83CF  01 7B     ORA ($7B,X)
  $83D1  01 7C     ORA ($7C,X)
  $83D3  01 00     ORA ($00,X)
  $83D5  1D 1C 00  ORA $001C,X
  $83D8  00        BRK
  $83D9  1D 1D 00  ORA $001D,X
  $83DC  1D 1D 00  ORA $001D,X
  $83DF  1C        .db $1C
  $83E0  1C        .db $1C
  $83E1  00        BRK
  $83E2  00        BRK
  $83E3  1D 00 1D  ORA $1D00,X
  $83E6  00        BRK
  $83E7  00        BRK
  $83E8  1D 00 1C  ORA $1C00,X
  $83EB  1D 1D 00  ORA $001D,X
  $83EE  00        BRK
  $83EF  1C        .db $1C
  $83F0  1D 00 00  ORA $0000,X
  $83F3  00        BRK
  $83F4  1D 83 00  ORA $0083,X
  $83F7  58        CLI
  $83F8  00        BRK
  $83F9  00        BRK
  $83FA  00        BRK
  $83FB  00        BRK
  $83FC  00        BRK
  $83FD  00        BRK
  $83FE  00        BRK
  $83FF  00        BRK
  $8400  00        BRK
  $8401  00        BRK
  $8402  55 AA     EOR $AA,X
  $8404  FF        .db $FF
  $8405  FF        .db $FF
  $8406  FF        .db $FF
  $8407  05 55     ORA $55
  $8409  05 50     ORA $50
  $840B  01 40     ORA ($40,X)
  $840D  05 05     ORA $05
  $840F  50 55     BVC $8466
  $8411  00        BRK
  $8412  00        BRK
  $8413  00        BRK
  $8414  00        BRK
  $8415  55 55     EOR $55,X
  $8417  BF        .db $BF
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
  $8428  05 50     ORA $50
  $842A  00        BRK
  $842B  00        BRK
  $842C  00        BRK
  $842D  00        BRK
  $842E  00        BRK
  $842F  00        BRK
  $8430  55 50     EOR $50,X
  $8432  00        BRK
  $8433  00        BRK
  $8434  00        BRK
  $8435  0F        .db $0F
  $8436  00        BRK
  $8437  00        BRK
  $8438  00        BRK
  $8439  00        BRK
  $843A  00        BRK
  $843B  00        BRK
  $843C  FF        .db $FF
  $843D  FB        .db $FB
  $843E  FF        .db $FF
  $843F  BA        TSX
  $8440  20 11 01  JSR $0111
  $8443  44        .db $44
  $8444  00        BRK
  $8445  00        BRK
  $8446  10 00     BPL $8448

L_8448:
  $8448  80        .db $80
  $8449  40        RTI
  $844A  00        BRK
  $844B  11 01     ORA ($01),Y
  $844D  11 00     ORA ($00),Y
  $844F  11 44     ORA ($44),Y
  $8451  04        .db $04
  $8452  11 01     ORA ($01),Y
  $8454  44        .db $44

L_8455:
  $8455  08        PHP
  $8456  44        .db $44
  $8457  44        .db $44
  $8458  44        .db $44
  $8459  44        .db $44
  $845A  DD DD 11  CMP $11DD,X
  $845D  FF        .db $FF
  $845E  DF        .db $DF
  $845F  40        RTI
  $8460  15 05     ORA $05,X
  $8462  45 01     EOR $01
  $8464  45 50     EOR $50

L_8466:
  $8466  55 15     EOR $15,X
  $8468  11 45     ORA ($45),Y
  $846A  44        .db $44
  $846B  55 55     EOR $55,X
  $846D  55 55     EOR $55,X
  $846F  55 05     EOR $05,X
  $8471  15 05     ORA $05,X
  $8473  54        .db $54
  $8474  55 55     EOR $55,X
  $8476  51 55     EOR ($55),Y
  $8478  55 55     EOR $55,X
  $847A  55 BA     EOR $BA,X
  $847C  AA        TAX
  $847D  AA        TAX
  $847E  BA        TSX
  $847F  00        BRK
  $8480  02        .db $02
  $8481  80        .db $80
  $8482  22        .db $22
  $8483  00        BRK
  $8484  00        BRK
  $8485  80        .db $80
  $8486  02        .db $02
  $8487  FF        .db $FF
  $8488  DD DD 20  CMP $20DD,X
  $848B  A8        TAY
  $848C  DF        .db $DF
  $848D  FB        .db $FB
  $848E  FF        .db $FF
  $848F  FD FF 02  SBC $02FF,X
  $8492  00        BRK
  $8493  00        BRK
  $8494  FF        .db $FF
  $8495  FF        .db $FF
  $8496  FF        .db $FF
  $8497  FF        .db $FF
  $8498  FF        .db $FF
  $8499  FF        .db $FF
  $849A  FF        .db $FF
  $849B  FF        .db $FF
  $849C  FF        .db $FF
  $849D  FF        .db $FF
  $849E  FF        .db $FF
  $849F  FF        .db $FF
  $84A0  02        .db $02
  $84A1  FF        .db $FF
  $84A2  FF        .db $FF
  $84A3  FF        .db $FF
  $84A4  FF        .db $FF
  $84A5  FF        .db $FF
  $84A6  FF        .db $FF
  $84A7  FE 55 55  INC $5555,X
  $84AA  55 05     EOR $05,X
  $84AC  51 11     EOR ($11),Y
  $84AE  05 15     ORA $15
  $84B0  04        .db $04
  $84B1  01 55     ORA ($55,X)
  $84B3  50 A0     BVC $8455
  $84B5  88        DEY
  $84B6  00        BRK
  $84B7  00        BRK
  $84B8  20 2A 08  JSR $082A
  $84BB  00        BRK
  $84BC  00        BRK
  $84BD  02        .db $02
  $84BE  02        .db $02
  $84BF  0F        .db $0F
  $84C0  AA        TAX
  $84C1  AA        TAX
  $84C2  AA        TAX
  $84C3  AA        TAX
  $84C4  AA        TAX
  $84C5  AA        TAX
  $84C6  99 99 99  STA $9999,Y
  $84C9  99 99 AA  STA $AA99,Y
  $84CC  AA        TAX
  $84CD  AA        TAX
  $84CE  AA        TAX
  $84CF  51 FF     EOR ($FF),Y
  $84D1  FF        .db $FF
  $84D2  FF        .db $FF
  $84D3  FF        .db $FF
  $84D4  FF        .db $FF
  $84D5  FF        .db $FF
  $84D6  FF        .db $FF
  $84D7  FF        .db $FF
  $84D8  FF        .db $FF
  $84D9  FF        .db $FF
  $84DA  FF        .db $FF
  $84DB  FF        .db $FF
  $84DC  FF        .db $FF
  $84DD  DD EF FF  CMP $FFEF,X
  $84E0  DD FF FF  CMP $FFFF,X
  $84E3  DF        .db $DF
  $84E4  77        .db $77
  $84E5  FD DD FF  SBC $FFDD,X
  $84E8  1E 0D 4E  ASL $4E0D,X
  $84EB  41 CD     EOR ($CD,X)
  $84ED  93        .db $93
  $84EE  FE 76 DD  INC $DD76,X
  $84F1  BF        .db $BF
  $84F2  BA        TSX
  $84F3  FF        .db $FF
  $84F4  FF        .db $FF
  $84F5  08        PHP
  $84F6  3C        .db $3C
  $84F7  A3        .db $A3
  $84F8  40        RTI
  $84F9  20 CF 83  JSR $83CF
  $84FC  02        .db $02
  $84FD  DF        .db $DF
  $84FE  00        BRK
  $84FF  55 20     EOR $20,X
  $8501  21 15     AND ($15,X)
  $8503  28        PLP
  $8504  15 21     ORA $21,X
  $8506  13        .db $13
  $8507  14        .db $14
  $8508  01 01     ORA ($01,X)
  $850A  01 0E     ORA ($0E,X)
  $850C  01 01     ORA ($01,X)
  $850E  18        CLC
  $850F  13        .db $13
  $8510  52        .db $52
  $8511  52        .db $52
  $8512  2A        ROL
  $8513  01 01     ORA ($01,X)
  $8515  01 19     ORA ($19,X)
  $8517  14        .db $14
  $8518  01 01     ORA ($01,X)
  $851A  43        .db $43
  $851B  50 51     BVC $856E
  $851D  01 18     ORA ($18,X)
  $851F  13        .db $13
  $8520  0C        .db $0C
  $8521  01 2C     ORA ($2C,X)
  $8523  01 2A     ORA ($2A,X)
  $8525  01 19     ORA ($19,X)
  $8527  14        .db $14
  $8528  0A        ASL
  $8529  01 01     ORA ($01,X)
  $852B  01 43     ORA ($43,X)
  $852D  50 18     BVC $8547
  $852F  12        .db $12
  $8530  0A        ASL
  $8531  01 0D     ORA ($0D,X)
  $8533  01 2B     ORA ($2B,X)
  $8535  01 19     ORA ($19,X)
  $8537  14        .db $14
  $8538  29 27     AND #$27
  $853A  28        PLP
  $853B  25 14     AND $14
  $853D  27        .db $27
  $853E  11 12     ORA ($12),Y
  $8540  20 21 22  JSR $2221
  $8543  28        PLP
  $8544  15 21     ORA $21,X
  $8546  1A        .db $1A

L_8547:
  $8547  23        .db $23
  $8548  01 01     ORA ($01,X)
  $854A  01 0B     ORA ($0B,X)
  $854C  01 01     ORA ($01,X)
  $854E  2B        .db $2B
  $854F  01 50     ORA ($50,X)
  $8551  50 50     BVC $85A3
  $8553  01 01     ORA ($01,X)
  $8555  01 5C     ORA ($5C,X)
  $8557  52        .db $52
  $8558  2D 2E 01  AND $012E
  $855B  32        .db $32
  $855C  01 01     ORA ($01,X)
  $855E  2C 01 11  BIT $1101
  $8561  1C        .db $1C
  $8562  01 46     ORA ($46,X)
  $8564  52        .db $52
  $8565  53        .db $53
  $8566  01 01     ORA ($01,X)
  $8568  13        .db $13
  $8569  15 0C     ORA $0C,X
  $856B  33        .db $33
  $856C  01 01     ORA ($01,X)

L_856E:
  $856E  01 01     ORA ($01,X)
  $8570  11 2D     ORA ($2D),Y
  $8572  31 2E     AND ($2E),Y
  $8574  01 0F     ORA ($0F,X)
  $8576  01 01     ORA ($01,X)
  $8578  13        .db $13
  $8579  14        .db $14
  $857A  29 12     AND #$12
  $857C  26 29     ROL $29
  $857E  24 25     BIT $25
  $8580  11 12     ORA ($12),Y
  $8582  13        .db $13
  $8583  23        .db $23
  $8584  20 15 22  JSR $2215
  $8587  23        .db $23
  $8588  13        .db $13
  $8589  14        .db $14
  $858A  11 34     ORA ($34),Y
  $858C  01 01     ORA ($01,X)
  $858E  01 01     ORA ($01,X)
  $8590  11 12     ORA ($12),Y
  $8592  13        .db $13
  $8593  37        .db $37
  $8594  01 49     ORA ($49,X)
  $8596  50 50     BVC $85E8
  $8598  13        .db $13
  $8599  14        .db $14
  $859A  20 36 01  JSR $0136
  $859D  38        SEC
  $859E  24 25     BIT $25
  $85A0  11 15     ORA ($15),Y
  $85A2  36 01     ROL $01,X
  $85A4  01 39     ORA ($39,X)
  $85A6  13        .db $13
  $85A7  14        .db $14
  $85A8  13        .db $13
  $85A9  14        .db $14
  $85AA  37        .db $37
  $85AB  01 01     ORA ($01,X)
  $85AD  38        SEC
  $85AE  11 12     ORA ($12),Y
  $85B0  11 12     ORA ($12),Y
  $85B2  36 01     ROL $01,X
  $85B4  01 1A     ORA ($1A,X)
  $85B6  13        .db $13
  $85B7  14        .db $14
  $85B8  13        .db $13
  $85B9  14        .db $14
  $85BA  37        .db $37
  $85BB  01 01     ORA ($01,X)
  $85BD  1B        .db $1B
  $85BE  15 12     ORA $12,X
  $85C0  11 12     ORA ($12),Y
  $85C2  36 01     ROL $01,X
  $85C4  01 1A     ORA ($1A,X)
  $85C6  13        .db $13
  $85C7  14        .db $14
  $85C8  13        .db $13
  $85C9  37        .db $37
  $85CA  01 01     ORA ($01,X)
  $85CC  01 1B     ORA ($1B,X)
  $85CE  11 12     ORA ($12),Y
  $85D0  11 36     ORA ($36),Y
  $85D2  01 01     ORA ($01,X)
  $85D4  3A        .db $3A
  $85D5  12        .db $12
  $85D6  13        .db $13
  $85D7  14        .db $14
  $85D8  13        .db $13
  $85D9  34        .db $34
  $85DA  01 01     ORA ($01,X)
  $85DC  38        SEC
  $85DD  15 11     ORA $11,X
  $85DF  12        .db $12
  $85E0  11 37     ORA ($37),Y
  $85E2  01 01     ORA ($01,X)
  $85E4  19 12 13  ORA $1312,Y
  $85E7  14        .db $14

L_85E8:
  $85E8  22        .db $22
  $85E9  36 01     ROL $01,X
  $85EB  01 19     ORA ($19,X)
  $85ED  14        .db $14
  $85EE  11 12     ORA ($12),Y
  $85F0  4B        .db $4B
  $85F1  4B        .db $4B
  $85F2  4C 3B 2F  JMP $2F3B
  $85F5  12        .db $12
  $85F6  15 14     ORA $14,X
  $85F8  13        .db $13
  $85F9  14        .db $14
  $85FA  11 12     ORA ($12),Y
  $85FC  13        .db $13
  $85FD  14        .db $14
  $85FE  11 12     ORA ($12),Y
  $8600  01 01     ORA ($01,X)
  $8602  01 01     ORA ($01,X)
  $8604  01 01     ORA ($01,X)
  $8606  19 14 01  ORA $0114,Y
  $8609  01 60     ORA ($60,X)
  $860B  68        PLA
  $860C  68        PLA
  $860D  70 18     BVS $8627
  $860F  12        .db $12
  $8610  01 01     ORA ($01,X)
  $8612  61 01     ADC ($01,X)
  $8614  01 71     ORA ($71,X)
  $8616  19 14 01  ORA $0114,Y
  $8619  01 61     ORA ($61,X)
  $861B  01 01     ORA ($01,X)
  $861D  61 18     ADC ($18,X)
  $861F  12        .db $12
  $8620  01 01     ORA ($01,X)
  $8622  61 01     ADC ($01,X)
  $8624  01 69     ORA ($69,X)
  $8626  19 14 01  ORA $0114,Y
  $8629  01 61     ORA ($61,X)
  $862B  01 01     ORA ($01,X)
  $862D  61 18     ADC ($18,X)
  $862F  12        .db $12
  $8630  54        .db $54
  $8631  51 62     EOR ($62),Y
  $8633  6A        ROR
  $8634  6A        ROR
  $8635  72        .db $72
  $8636  4D 4B 37  EOR $374B
  $8639  01 01     ORA ($01,X)
  $863B  01 01     ORA ($01,X)
  $863D  01 18     ORA ($18,X)
  $863F  12        .db $12
  $8640  34        .db $34
  $8641  01 01     ORA ($01,X)
  $8643  01 01     ORA ($01,X)
  $8645  01 1A     ORA ($1A,X)
  $8647  34        .db $34
  $8648  4F        .db $4F
  $8649  53        .db $53
  $864A  60        RTS
  $864B  70 01     BVS $864E
  $864D  01 1B     ORA ($1B,X)
  $864F  37        .db $37
  $8650  01 01     ORA ($01,X)
  $8652  61 61     ADC ($61,X)
  $8654  01 01     ORA ($01,X)
  $8656  1A        .db $1A
  $8657  36 01     ROL $01,X
  $8659  60        RTS
  $865A  63        .db $63
  $865B  61 60     ADC ($60,X)
  $865D  70 1B     BVS $867A
  $865F  34        .db $34
  $8660  01 61     ORA ($61,X)
  $8662  60        RTS
  $8663  64        .db $64
  $8664  72        .db $72
  $8665  71 1A     ADC ($1A),Y
  $8667  37        .db $37
  $8668  01 61     ORA ($61,X)
  $866A  62        .db $62
  $866B  72        .db $72
  $866C  01 69     ORA ($69,X)
  $866E  1B        .db $1B

L_866F:
  $866F  37        .db $37
  $8670  01 62     ORA ($62,X)
  $8672  6A        ROR
  $8673  6A        ROR
  $8674  6A        ROR
  $8675  72        .db $72
  $8676  57        .db $57
  $8677  57        .db $57
  $8678  01 01     ORA ($01,X)

L_867A:
  $867A  01 01     ORA ($01,X)
  $867C  01 01     ORA ($01,X)
  $867E  1B        .db $1B
  $867F  24 34     BIT $34
  $8681  5F        .db $5F
  $8682  6A        ROR
  $8683  56 01     LSR $01,X
  $8685  01 18     ORA ($18,X)
  $8687  21 4F     AND ($4F,X)
  $8689  CF        .db $CF
  $868A  78        SEI
  $868B  77        .db $77
  $868C  73        .db $73
  $868D  70 4D     BVS $86DC
  $868F  4B        .db $4B
  $8690  01 65     ORA ($65,X)
  $8692  6F        .db $6F
  $8693  6F        .db $6F
  $8694  6F        .db $6F
  $8695  71 18     ADC ($18),Y
  $8697  37        .db $37
  $8698  01 66     ORA ($66,X)
  $869A  79 79 75  ADC $7579,Y
  $869D  61 19     ADC ($19,X)
  $869F  36 01     ROL $01,X
  $86A1  67        .db $67
  $86A2  7A        .db $7A
  $86A3  7A        .db $7A
  $86A4  6E 61 18  ROR $1861
  $86A7  37        .db $37
  $86A8  01 6B     ORA ($6B,X)
  $86AA  7A        .db $7A
  $86AB  7A        .db $7A
  $86AC  76 69     ROR $69,X
  $86AE  19 36 01  ORA $0136,Y
  $86B1  6C 74 74  JMP ($7474)
  $86B4  6D 72 18  ADC $1872
  $86B7  37        .db $37
  $86B8  01 01     ORA ($01,X)
  $86BA  01 01     ORA ($01,X)
  $86BC  01 01     ORA ($01,X)
  $86BE  19 36 A8  ORA $A836,Y
  $86C1  B0 AC     BCS $866F
  $86C3  02        .db $02
  $86C4  AE 01 18  LDX $1801
  $86C7  21 A9     AND ($A9,X)
  $86C9  B1 01     LDA ($01),Y
  $86CB  AD 01 01  LDA $0101
  $86CE  4D 4B A8  EOR $A84B
  $86D1  B0 01     BCS $86D4
  $86D3  01 01     ORA ($01,X)
  $86D5  01 19     ORA ($19,X)
  $86D7  37        .db $37
  $86D8  02        .db $02
  $86D9  AA        TAX
  $86DA  01 01     ORA ($01,X)

L_86DC:
  $86DC  01 01     ORA ($01,X)
  $86DE  18        CLC
  $86DF  36 02     ROL $02,X
  $86E1  AB        .db $AB
  $86E2  01 01     ORA ($01,X)
  $86E4  01 01     ORA ($01,X)
  $86E6  19 37 A9  ORA $A937,Y
  $86E9  B1 01     LDA ($01),Y
  $86EB  01 01     ORA ($01,X)
  $86ED  01 18     ORA ($18,X)
  $86EF  36 AA     ROL $AA,X
  $86F1  01 01     ORA ($01,X)
  $86F3  01 01     ORA ($01,X)
  $86F5  01 19     ORA ($19,X)
  $86F7  37        .db $37
  $86F8  AB        .db $AB
  $86F9  01 01     ORA ($01,X)
  $86FB  01 01     ORA ($01,X)
  $86FD  01 18     ORA ($18,X)
  $86FF  36 A8     ROL $A8,X
  $8701  B0 01     BCS $8704
  $8703  01 01     ORA ($01,X)
  $8705  01 19     ORA ($19,X)
  $8707  36 02     ROL $02,X
  $8709  AA        TAX
  $870A  01 01     ORA ($01,X)
  $870C  01 01     ORA ($01,X)
  $870E  18        CLC
  $870F  37        .db $37
  $8710  02        .db $02
  $8711  AB        .db $AB
  $8712  01 01     ORA ($01,X)
  $8714  01 01     ORA ($01,X)
  $8716  19 36 A9  ORA $A936,Y
  $8719  B1 84     LDA ($84),Y
  $871B  01 01     ORA ($01,X)
  $871D  01 18     ORA ($18,X)
  $871F  37        .db $37
  $8720  B1 01     LDA ($01),Y
  $8722  01 01     ORA ($01,X)
  $8724  01 01     ORA ($01,X)
  $8726  19 36 50  ORA $5036,Y
  $8729  50 50     BVC $877B
  $872B  50 50     BVC $877D
  $872D  50 18     BVC $8747
  $872F  37        .db $37
  $8730  24 25     BIT $25
  $8732  26 15     ROL $15
  $8734  24 25     BIT $25
  $8736  13        .db $13
  $8737  27        .db $27
  $8738  13        .db $13
  $8739  14        .db $14
  $873A  11 12     ORA ($12),Y
  $873C  13        .db $13
  $873D  14        .db $14
  $873E  11 12     ORA ($12),Y
  $8740  01 01     ORA ($01,X)
  $8742  32        .db $32
  $8743  B2        .db $B2
  $8744  02        .db $02
  $8745  02        .db $02
  $8746  02        .db $02

L_8747:
  $8747  02        .db $02
  $8748  01 01     ORA ($01,X)
  $874A  33        .db $33
  $874B  AC 02 07  LDY $0702
  $874E  02        .db $02
  $874F  02        .db $02
  $8750  01 32     ORA ($32,X)
  $8752  01 01     ORA ($01,X)
  $8754  AC 02 02  LDY $0202
  $8757  02        .db $02
  $8758  01 33     ORA ($33,X)
  $875A  01 01     ORA ($01,X)
  $875C  32        .db $32
  $875D  B2        .db $B2
  $875E  02        .db $02
  $875F  02        .db $02
  $8760  01 01     ORA ($01,X)
  $8762  01 01     ORA ($01,X)
  $8764  33        .db $33
  $8765  AC AF AC  LDY $ACAF
  $8768  50 50     BVC $87BA
  $876A  50 50     BVC $87BC
  $876C  50 50     BVC $87BE
  $876E  58        CLI
  $876F  54        .db $54
  $8770  24 25     BIT $25
  $8772  26 27     ROL $27
  $8774  24 15     BIT $15
  $8776  26 27     ROL $27
  $8778  13        .db $13
  $8779  14        .db $14
  $877A  15 12     ORA $12,X
  $877C  13        .db $13

L_877D:
  $877D  14        .db $14
  $877E  11 12     ORA ($12),Y
  $8780  01 01     ORA ($01,X)
  $8782  01 01     ORA ($01,X)
  $8784  01 01     ORA ($01,X)
  $8786  01 01     ORA ($01,X)
  $8788  01 01     ORA ($01,X)
  $878A  01 01     ORA ($01,X)
  $878C  01 01     ORA ($01,X)
  $878E  01 01     ORA ($01,X)
  $8790  52        .db $52
  $8791  52        .db $52
  $8792  01 84     ORA ($84,X)
  $8794  01 01     ORA ($01,X)
  $8796  01 01     ORA ($01,X)
  $8798  01 01     ORA ($01,X)
  $879A  01 83     ORA ($83,X)
  $879C  01 01     ORA ($01,X)
  $879E  01 01     ORA ($01,X)
  $87A0  01 01     ORA ($01,X)
  $87A2  01 01     ORA ($01,X)
  $87A4  01 01     ORA ($01,X)
  $87A6  01 01     ORA ($01,X)
  $87A8  01 01     ORA ($01,X)
  $87AA  01 59     ORA ($59,X)
  $87AC  50 50     BVC $87FE
  $87AE  58        CLI
  $87AF  54        .db $54
  $87B0  24 15     BIT $15
  $87B2  26 27     ROL $27
  $87B4  24 25     BIT $25
  $87B6  26 27     ROL $27
  $87B8  13        .db $13
  $87B9  14        .db $14

L_87BA:
  $87BA  11 12     ORA ($12),Y

L_87BC:
  $87BC  13        .db $13
  $87BD  14        .db $14

L_87BE:
  $87BE  11 12     ORA ($12),Y
  $87C0  03        .db $03
  $87C1  03        .db $03
  $87C2  03        .db $03
  $87C3  03        .db $03
  $87C4  03        .db $03
  $87C5  03        .db $03
  $87C6  C1 C3     CMP ($C3,X)
  $87C8  03        .db $03
  $87C9  03        .db $03
  $87CA  03        .db $03
  $87CB  03        .db $03
  $87CC  03        .db $03
  $87CD  03        .db $03
  $87CE  C0 C2     CPY #$C2
  $87D0  03        .db $03
  $87D1  03        .db $03
  $87D2  03        .db $03
  $87D3  03        .db $03
  $87D4  03        .db $03
  $87D5  03        .db $03
  $87D6  C7        .db $C7
  $87D7  CA        DEX
  $87D8  C6 C6     DEC $C6
  $87DA  C6 C6     DEC $C6
  $87DC  C6 C6     DEC $C6
  $87DE  C0 C2     CPY #$C2
  $87E0  C6 C6     DEC $C6
  $87E2  C6 C6     DEC $C6
  $87E4  C6 C6     DEC $C6
  $87E6  C1 C3     CMP ($C3,X)
  $87E8  03        .db $03
  $87E9  03        .db $03
  $87EA  03        .db $03
  $87EB  03        .db $03
  $87EC  03        .db $03
  $87ED  03        .db $03
  $87EE  C0 C2     CPY #$C2
  $87F0  03        .db $03
  $87F1  03        .db $03
  $87F2  03        .db $03
  $87F3  03        .db $03
  $87F4  03        .db $03
  $87F5  03        .db $03
  $87F6  C1 CD     CMP ($CD,X)
  $87F8  03        .db $03
  $87F9  03        .db $03
  $87FA  03        .db $03
  $87FB  03        .db $03
  $87FC  03        .db $03
  $87FD  03        .db $03

L_87FE:
  $87FE  C0 C1     CPY #$C1
  $8800  04        .db $04
  $8801  04        .db $04
  $8802  04        .db $04
  $8803  04        .db $04
  $8804  04        .db $04
  $8805  04        .db $04
  $8806  04        .db $04
  $8807  04        .db $04
  $8808  E0 E0     CPX #$E0
  $880A  E0 E0     CPX #$E0
  $880C  D5 F3     CMP $F3,X
  $880E  04        .db $04
  $880F  04        .db $04
  $8810  E0 E0     CPX #$E0
  $8812  E0 E0     CPX #$E0
  $8814  D8        CLD
  $8815  F4        .db $F4
  $8816  04        .db $04
  $8817  04        .db $04
  $8818  5A        .db $5A
  $8819  5B        .db $5B
  $881A  89        .db $89
  $881B  5A        .db $5A
  $881C  88        DEY
  $881D  E6 E0     INC $E0
  $881F  E0 E0     CPX #$E0
  $8821  E0 E0     CPX #$E0
  $8823  E0 5B     CPX #$5B
  $8825  E6 E0     INC $E0
  $8827  E0 89     CPX #$89
  $8829  5B        .db $5B
  $882A  89        .db $89
  $882B  88        DEY
  $882C  D9 F3 04  CMP $04F3,Y
  $882F  04        .db $04
  $8830  E2        .db $E2
  $8831  98        TYA
  $8832  E1 E2     SBC ($E2,X)
  $8834  E2        .db $E2
  $8835  9F        .db $9F
  $8836  04        .db $04
  $8837  04        .db $04
  $8838  04        .db $04
  $8839  04        .db $04
  $883A  04        .db $04
  $883B  04        .db $04
  $883C  04        .db $04
  $883D  04        .db $04
  $883E  04        .db $04
  $883F  04        .db $04
  $8840  F9 FA FB  SBC $FBFA,Y
  $8843  04        .db $04
  $8844  04        .db $04
  $8845  04        .db $04
  $8846  04        .db $04
  $8847  04        .db $04
  $8848  FB        .db $FB
  $8849  FC        .db $FC
  $884A  F9 89 E0  SBC $E089,Y
  $884D  E0 E0     CPX #$E0
  $884F  E0 E0     CPX #$E0
  $8851  F0 E0     BEQ $8833
  $8853  5B        .db $5B
  $8854  E0 E0     CPX #$E0
  $8856  E0 E0     CPX #$E0
  $8858  D6 D7     DEC $D7,X
  $885A  D1 DA     CMP ($DA),Y
  $885C  A5 5A     LDA $5A
  $885E  5B        .db $5B
  $885F  88        DEY
  $8860  5A        .db $5A
  $8861  5A        .db $5A
  $8862  5B        .db $5B
  $8863  88        DEY
  $8864  E0 E0     CPX #$E0
  $8866  E0 E0     CPX #$E0
  $8868  5A        .db $5A
  $8869  5B        .db $5B
  $886A  89        .db $89
  $886B  88        DEY

L_886C:
  $886C  5B        .db $5B
  $886D  88        DEY
  $886E  5A        .db $5A
  $886F  5B        .db $5B
  $8870  E1 E2     SBC ($E2,X)
  $8872  98        TYA

L_8873:
  $8873  E2        .db $E2
  $8874  E1 E2     SBC ($E2,X)
  $8876  98        TYA
  $8877  E1 FB     SBC ($FB,X)
  $8879  FC        .db $FC
  $887A  F9 04 04  SBC $0404,Y
  $887D  04        .db $04
  $887E  04        .db $04
  $887F  04        .db $04
  $8880  F9 FA FB  SBC $FBFA,Y
  $8883  FC        .db $FC
  $8884  F9 FA FB  SBC $FBFA,Y

L_8887:
  $8887  FB        .db $FB
  $8888  FB        .db $FB
  $8889  FC        .db $FC
  $888A  F9 FA FB  SBC $FBFA,Y
  $888D  FC        .db $FC
  $888E  F9 FA F0  SBC $F0FA,Y
  $8891  F0 E0     BEQ $8873
  $8893  F0 E0     BEQ $8875
  $8895  F0 F0     BEQ $8887
  $8897  E0 FB     CPX #$FB
  $8899  FC        .db $FC
  $889A  F9 87 D6  SBC $D687,Y
  $889D  D7        .db $D7
  $889E  D1 D2     CMP ($D2),Y
  $88A0  D6 D7     DEC $D7,X
  $88A2  D4        .db $D4
  $88A3  DA        .db $DA
  $88A4  3C        .db $3C
  $88A5  E3        .db $E3
  $88A6  5A        .db $5A
  $88A7  88        DEY
  $88A8  5B        .db $5B
  $88A9  DD 88 89  CMP $8988,X
  $88AC  5A        .db $5A
  $88AD  5A        .db $5A
  $88AE  5B        .db $5B
  $88AF  89        .db $89

L_88B0:
  $88B0  F1 E2     SBC ($E2),Y
  $88B2  E2        .db $E2
  $88B3  F1 F1     SBC ($F1),Y
  $88B5  E2        .db $E2
  $88B6  F1 98     SBC ($98),Y
  $88B8  FB        .db $FB
  $88B9  FC        .db $FC
  $88BA  F9 FA FB  SBC $FBFA,Y
  $88BD  FC        .db $FC
  $88BE  F9 FA F5  SBC $F5FA,Y
  $88C1  F6 F7     INC $F7,X
  $88C3  F8        SED
  $88C4  F9 FA FB  SBC $FBFA,Y
  $88C7  FC        .db $FC
  $88C8  88        DEY
  $88C9  F0 E5     BEQ $88B0
  $88CB  F6 FB     INC $FB,X
  $88CD  FC        .db $FC
  $88CE  F9 FA D0  SBC $D0FA,Y
  $88D1  F6 F7     INC $F7,X
  $88D3  F8        SED
  $88D4  90 FA     BCC $88D0
  $88D6  FD E0 88  SBC $88E0,X
  $88D9  F0 E0     BEQ $88BB
  $88DB  F0 8F     BEQ $886C
  $88DD  FC        .db $FC
  $88DE  DC        .db $DC
  $88DF  04        .db $04
  $88E0  F5 F6     SBC $F6,X
  $88E2  F7        .db $F7
  $88E3  F8        SED
  $88E4  8E D7 D9  STX $D9D7
  $88E7  D5 E8     CMP $E8,X
  $88E9  E8        INX
  $88EA  F5 F6     SBC $F6,X
  $88EC  8C 5A 89  STY $895A
  $88EF  5A        .db $5A
  $88F0  F5 E9     SBC $E9,X
  $88F2  E8        INX
  $88F3  F8        SED
  $88F4  8D F1 E2  STA $E2F1
  $88F7  F1 F7     SBC ($F7),Y
  $88F9  E8        INX
  $88FA  F5 F6     SBC $F6,X
  $88FC  FB        .db $FB
  $88FD  FC        .db $FC
  $88FE  F9 FA F5  SBC $F5FA,Y
  $8901  F6 F7     INC $F7,X
  $8903  F8        SED
  $8904  F5 F6     SBC $F6,X
  $8906  F7        .db $F7
  $8907  F8        SED
  $8908  F7        .db $F7
  $8909  F8        SED
  $890A  89        .db $89
  $890B  88        DEY
  $890C  5A        .db $5A
  $890D  DD 5B 5A  CMP $5A5B,X
  $8910  F5 F6     SBC $F6,X
  $8912  94 D3     STY $D3,X
  $8914  D1 D2     CMP ($D2),Y
  $8916  D3        .db $D3
  $8917  D4        .db $D4
  $8918  F7        .db $F7
  $8919  F8        SED
  $891A  F5 F6     SBC $F6,X
  $891C  F7        .db $F7
  $891D  8C DD DD  STY $DDDD
  $8920  F5 F6     SBC $F6,X
  $8922  F7        .db $F7
  $8923  F8        SED
  $8924  F5 DC     SBC $DC,X
  $8926  DC        .db $DC
  $8927  F8        SED
  $8928  F7        .db $F7
  $8929  F8        SED
  $892A  F5 F6     SBC $F6,X
  $892C  97        .db $97
  $892D  96 DC     STX $DC,Y
  $892F  F6 F5     INC $F5,X
  $8931  EA        NOP
  $8932  F7        .db $F7
  $8933  F8        SED
  $8934  DC        .db $DC
  $8935  F6 DC     INC $DC,X
  $8937  F8        SED
  $8938  F7        .db $F7
  $8939  F8        SED
  $893A  F5 99     SBC $99,X
  $893C  98        TYA
  $893D  F8        SED
  $893E  95 F6     STA $F6,X
  $8940  F5 F6     SBC $F6,X
  $8942  F7        .db $F7
  $8943  9A        TXS
  $8944  EE EE 9C  INC $9CEE
  $8947  F8        SED
  $8948  F7        .db $F7
  $8949  F8        SED
  $894A  F5 F6     SBC $F6,X
  $894C  F7        .db $F7
  $894D  F8        SED
  $894E  DE F6 EA  DEC $EAF6,X
  $8951  EB        .db $EB
  $8952  F7        .db $F7
  $8953  F8        SED
  $8954  F5 F6     SBC $F6,X
  $8956  DE F8 F7  DEC $F7F8,X
  $8959  EC EB F6  CPX $F6EB
  $895C  F7        .db $F7
  $895D  5D 9D F6  EOR $F69D,X
  $8960  F5 F6     SBC $F6,X
  $8962  ED F8 F5  SBC $F5F8
  $8965  DE DC F8  DEC $F8DC,X
  $8968  F7        .db $F7
  $8969  F8        SED
  $896A  F5 F6     SBC $F6,X
  $896C  5D A3 9E  EOR $9EA3,X
  $896F  F6 7B     INC $7B,X
  $8971  7E F7 F8  ROR $F8F7,X
  $8974  A1 3E     LDA ($3E,X)
  $8976  9F        .db $9F
  $8977  F8        SED
  $8978  7C        .db $7C
  $8979  7D 3F 3F  ADC $3F3F,X
  $897C  A2 F8     LDX #$F8
  $897E  F5 F6     SBC $F6,X
  $8980  F5 A4     SBC $A4,X
  $8982  F7        .db $F7
  $8983  F8        SED
  $8984  A4 F6     LDY $F6
  $8986  F7        .db $F7
  $8987  F8        SED
  $8988  F7        .db $F7
  $8989  A2 F5     LDX #$F5
  $898B  F6 A2     INC $A2,X
  $898D  F8        SED
  $898E  F5 F6     SBC $F6,X
  $8990  F5 A4     SBC $A4,X
  $8992  F7        .db $F7
  $8993  F8        SED
  $8994  A4 F6     LDY $F6
  $8996  F7        .db $F7
  $8997  F8        SED
  $8998  F7        .db $F7
  $8999  A2 F5     LDX #$F5
  $899B  F6 A2     INC $A2,X
  $899D  F8        SED
  $899E  F5 F6     SBC $F6,X
  $89A0  F5 A4     SBC $A4,X
  $89A2  F7        .db $F7
  $89A3  F8        SED
  $89A4  A4 F6     LDY $F6
  $89A6  F7        .db $F7
  $89A7  F8        SED
  $89A8  F7        .db $F7
  $89A9  A2 F5     LDX #$F5
  $89AB  F6 A2     INC $A2,X
  $89AD  F8        SED
  $89AE  F5 F6     SBC $F6,X
  $89B0  F5 A4     SBC $A4,X
  $89B2  F7        .db $F7
  $89B3  F8        SED
  $89B4  A4 F6     LDY $F6
  $89B6  F7        .db $F7
  $89B7  F8        SED
  $89B8  F7        .db $F7
  $89B9  A2 3F     LDX #$3F
  $89BB  3F        .db $3F
  $89BC  A2 F8     LDX #$F8
  $89BE  F5 F6     SBC $F6,X
  $89C0  3E 17 F7  ROL $F717,X
  $89C3  F8        SED
  $89C4  3D 3E DF  AND $DF3E,X
  $89C7  D7        .db $D7
  $89C8  F7        .db $F7
  $89C9  F8        SED
  $89CA  F5 F6     SBC $F6,X
  $89CC  F7        .db $F7
  $89CD  F8        SED
  $89CE  D8        CLD
  $89CF  DA        .db $DA
  $89D0  F5 F6     SBC $F6,X
  $89D2  F7        .db $F7
  $89D3  F8        SED
  $89D4  F5 F6     SBC $F6,X
  $89D6  D9 DB F7  CMP $F7DB,Y
  $89D9  F8        SED
  $89DA  F5 F6     SBC $F6,X
  $89DC  F7        .db $F7
  $89DD  F8        SED
  $89DE  D8        CLD
  $89DF  DA        .db $DA
  $89E0  F5 F6     SBC $F6,X
  $89E2  F7        .db $F7
  $89E3  F8        SED
  $89E4  F5 F6     SBC $F6,X
  $89E6  D9 DB F7  CMP $F7DB,Y
  $89E9  F8        SED
  $89EA  F5 F6     SBC $F6,X
  $89EC  F7        .db $F7
  $89ED  F8        SED
  $89EE  D8        CLD
  $89EF  DA        .db $DA
  $89F0  F5 F6     SBC $F6,X
  $89F2  F7        .db $F7
  $89F3  F8        SED
  $89F4  F5 F6     SBC $F6,X
  $89F6  D9 DB A6  CMP $A6DB,Y
  $89F9  A6 A6     LDX $A6
  $89FB  A5 A7     LDA $A7
  $89FD  A7        .db $A7
  $89FE  E7        .db $E7
  $89FF  D1 40     CMP ($40),Y
  $8A01  4E 82 91  LSR $9182
  $8A04  B5 BA     LDA $BA,X
  $8A06  FF        .db $FF
  $8A07  FF        .db $FF
  $8A08  44        .db $44
  $8A09  55 85     EOR $85,X
  $8A0B  92        .db $92
  $8A0C  B6 BB     LDX $BB,Y
  $8A0E  FF        .db $FF
  $8A0F  FF        .db $FF
  $8A10  45 7F     EOR $7F
  $8A12  86 93     STX $93
  $8A14  B7        .db $B7
  $8A15  BC FF FF  LDY $FFFF,X
  $8A18  48        PHA
  $8A19  80        .db $80
  $8A1A  8A        TXA
  $8A1B  A0 B8     LDY #$B8
  $8A1D  BD FF FF  LDA $FFFF,X
  $8A20  4A        LSR
  $8A21  81 8B     STA ($8B,X)
  $8A23  B4 B9     LDY $B9,X
  $8A25  BE FF FF  LDX $FFFF,Y
  $8A28  06 06     ASL $06
  $8A2A  06 06     ASL $06
  $8A2C  06 BF     ASL $BF
  $8A2E  FF        .db $FF
  $8A2F  FF        .db $FF
  $8A30  05 05     ORA $05
  $8A32  05 05     ORA $05
  $8A34  05 35     ORA $35
  $8A36  FF        .db $FF
  $8A37  FF        .db $FF
  $8A38  05 05     ORA $05
  $8A3A  05 05     ORA $05
  $8A3C  05 35     ORA $35
  $8A3E  FF        .db $FF
  $8A3F  FF        .db $FF
  $8A40  FF        .db $FF
  $8A41  FF        .db $FF
  $8A42  FF        .db $FF
  $8A43  FF        .db $FF
  $8A44  FF        .db $FF
  $8A45  FF        .db $FF
  $8A46  16 08     ASL $08,X
  $8A48  FF        .db $FF
  $8A49  FF        .db $FF
  $8A4A  FF        .db $FF
  $8A4B  FF        .db $FF
  $8A4C  FF        .db $FF
  $8A4D  FF        .db $FF
  $8A4E  16 08     ASL $08,X
  $8A50  FF        .db $FF
  $8A51  FF        .db $FF
  $8A52  FF        .db $FF
  $8A53  FF        .db $FF
  $8A54  FF        .db $FF
  $8A55  FF        .db $FF
  $8A56  30 10     BMI $8A68
  $8A58  FF        .db $FF
  $8A59  FF        .db $FF
  $8A5A  FF        .db $FF
  $8A5B  FF        .db $FF
  $8A5C  FF        .db $FF
  $8A5D  FF        .db $FF
  $8A5E  16 08     ASL $08,X
  $8A60  FF        .db $FF
  $8A61  FF        .db $FF
  $8A62  FF        .db $FF
  $8A63  FF        .db $FF
  $8A64  FF        .db $FF
  $8A65  FF        .db $FF
  $8A66  16 08     ASL $08,X

L_8A68:
  $8A68  06 06     ASL $06
  $8A6A  06 06     ASL $06
  $8A6C  06 06     ASL $06
  $8A6E  06 06     ASL $06
  $8A70  05 05     ORA $05
  $8A72  05 05     ORA $05
  $8A74  05 05     ORA $05
  $8A76  05 05     ORA $05
  $8A78  05 05     ORA $05
  $8A7A  05 05     ORA $05
  $8A7C  05 05     ORA $05
  $8A7E  05 05     ORA $05
  $8A80  FF        .db $FF
  $8A81  FF        .db $FF
  $8A82  FF        .db $FF
  $8A83  FF        .db $FF
  $8A84  FF        .db $FF
  $8A85  FF        .db $FF
  $8A86  FF        .db $FF
  $8A87  FF        .db $FF
  $8A88  FF        .db $FF
  $8A89  FF        .db $FF
  $8A8A  FF        .db $FF
  $8A8B  FF        .db $FF
  $8A8C  FF        .db $FF
  $8A8D  FF        .db $FF
  $8A8E  FF        .db $FF
  $8A8F  FF        .db $FF
  $8A90  FF        .db $FF
  $8A91  FF        .db $FF
  $8A92  FF        .db $FF
  $8A93  FF        .db $FF
  $8A94  FF        .db $FF
  $8A95  FF        .db $FF
  $8A96  FF        .db $FF
  $8A97  FF        .db $FF
  $8A98  FF        .db $FF
  $8A99  FF        .db $FF
  $8A9A  FF        .db $FF
  $8A9B  FF        .db $FF
  $8A9C  FF        .db $FF
  $8A9D  FF        .db $FF
  $8A9E  FF        .db $FF
  $8A9F  FF        .db $FF
  $8AA0  FF        .db $FF
  $8AA1  FF        .db $FF
  $8AA2  FF        .db $FF
  $8AA3  FF        .db $FF
  $8AA4  FF        .db $FF
  $8AA5  FF        .db $FF
  $8AA6  FF        .db $FF
  $8AA7  FF        .db $FF
  $8AA8  FF        .db $FF
  $8AA9  FF        .db $FF
  $8AAA  FF        .db $FF
  $8AAB  FF        .db $FF
  $8AAC  FF        .db $FF
  $8AAD  FF        .db $FF
  $8AAE  FF        .db $FF
  $8AAF  FF        .db $FF
  $8AB0  FF        .db $FF
  $8AB1  FF        .db $FF
  $8AB2  FF        .db $FF
  $8AB3  FF        .db $FF
  $8AB4  FF        .db $FF
  $8AB5  FF        .db $FF
  $8AB6  FF        .db $FF
  $8AB7  FF        .db $FF
  $8AB8  FF        .db $FF
  $8AB9  FF        .db $FF
  $8ABA  FF        .db $FF
  $8ABB  FF        .db $FF
  $8ABC  FF        .db $FF
  $8ABD  FF        .db $FF
  $8ABE  FF        .db $FF
  $8ABF  FF        .db $FF
  $8AC0  FF        .db $FF
  $8AC1  FF        .db $FF
  $8AC2  FF        .db $FF
  $8AC3  FF        .db $FF
  $8AC4  FF        .db $FF
  $8AC5  FF        .db $FF
  $8AC6  FF        .db $FF
  $8AC7  FF        .db $FF
  $8AC8  FF        .db $FF
  $8AC9  FF        .db $FF
  $8ACA  FF        .db $FF
  $8ACB  FF        .db $FF
  $8ACC  FF        .db $FF
  $8ACD  FF        .db $FF
  $8ACE  FF        .db $FF
  $8ACF  FF        .db $FF
  $8AD0  FF        .db $FF
  $8AD1  FF        .db $FF
  $8AD2  FF        .db $FF
  $8AD3  FF        .db $FF
  $8AD4  FF        .db $FF
  $8AD5  FF        .db $FF
  $8AD6  FF        .db $FF
  $8AD7  FF        .db $FF
  $8AD8  FF        .db $FF
  $8AD9  FF        .db $FF
  $8ADA  FF        .db $FF
  $8ADB  FF        .db $FF
  $8ADC  FF        .db $FF
  $8ADD  FF        .db $FF
  $8ADE  FF        .db $FF
  $8ADF  FF        .db $FF
  $8AE0  FF        .db $FF
  $8AE1  FF        .db $FF
  $8AE2  FF        .db $FF
  $8AE3  FF        .db $FF
  $8AE4  FF        .db $FF
  $8AE5  FF        .db $FF
  $8AE6  FF        .db $FF
  $8AE7  FF        .db $FF
  $8AE8  FF        .db $FF
  $8AE9  FF        .db $FF
  $8AEA  FF        .db $FF
  $8AEB  FF        .db $FF
  $8AEC  FF        .db $FF
  $8AED  FF        .db $FF
  $8AEE  FF        .db $FF
  $8AEF  FF        .db $FF
  $8AF0  FF        .db $FF
  $8AF1  FF        .db $FF
  $8AF2  FF        .db $FF
  $8AF3  FF        .db $FF
  $8AF4  FF        .db $FF
  $8AF5  FF        .db $FF
  $8AF6  FF        .db $FF
  $8AF7  FF        .db $FF
  $8AF8  FF        .db $FF
  $8AF9  FF        .db $FF
  $8AFA  FF        .db $FF
  $8AFB  FF        .db $FF
  $8AFC  FF        .db $FF
  $8AFD  FF        .db $FF
  $8AFE  FF        .db $FF
  $8AFF  FF        .db $FF
  $8B00  FF        .db $FF
  $8B01  FF        .db $FF
  $8B02  FF        .db $FF
  $8B03  FF        .db $FF
  $8B04  FF        .db $FF
  $8B05  FF        .db $FF
  $8B06  FF        .db $FF
  $8B07  FF        .db $FF
  $8B08  FF        .db $FF
  $8B09  FF        .db $FF
  $8B0A  FF        .db $FF
  $8B0B  FF        .db $FF
  $8B0C  FF        .db $FF
  $8B0D  FF        .db $FF
  $8B0E  FF        .db $FF
  $8B0F  FF        .db $FF
  $8B10  FF        .db $FF
  $8B11  FF        .db $FF
  $8B12  FF        .db $FF
  $8B13  FF        .db $FF
  $8B14  FF        .db $FF
  $8B15  FF        .db $FF
  $8B16  FF        .db $FF
  $8B17  FF        .db $FF
  $8B18  FF        .db $FF
  $8B19  FF        .db $FF
  $8B1A  FF        .db $FF
  $8B1B  FF        .db $FF
  $8B1C  FF        .db $FF
  $8B1D  FF        .db $FF
  $8B1E  FF        .db $FF
  $8B1F  FF        .db $FF
  $8B20  FF        .db $FF
  $8B21  FF        .db $FF
  $8B22  FF        .db $FF
  $8B23  FF        .db $FF
  $8B24  FF        .db $FF
  $8B25  FF        .db $FF
  $8B26  FF        .db $FF
  $8B27  FF        .db $FF
  $8B28  FF        .db $FF
  $8B29  FF        .db $FF
  $8B2A  FF        .db $FF
  $8B2B  FF        .db $FF
  $8B2C  FF        .db $FF
  $8B2D  FF        .db $FF
  $8B2E  FF        .db $FF
  $8B2F  FF        .db $FF
  $8B30  FF        .db $FF
  $8B31  FF        .db $FF
  $8B32  FF        .db $FF
  $8B33  FF        .db $FF
  $8B34  FF        .db $FF
  $8B35  FF        .db $FF
  $8B36  FF        .db $FF
  $8B37  FF        .db $FF
  $8B38  FF        .db $FF
  $8B39  FF        .db $FF
  $8B3A  FF        .db $FF
  $8B3B  FF        .db $FF
  $8B3C  FF        .db $FF
  $8B3D  FF        .db $FF
  $8B3E  FF        .db $FF
  $8B3F  FF        .db $FF
  $8B40  FF        .db $FF
  $8B41  FF        .db $FF
  $8B42  FF        .db $FF
  $8B43  FF        .db $FF
  $8B44  FF        .db $FF
  $8B45  FF        .db $FF
  $8B46  FF        .db $FF
  $8B47  FF        .db $FF
  $8B48  FF        .db $FF
  $8B49  FF        .db $FF
  $8B4A  FF        .db $FF
  $8B4B  FF        .db $FF
  $8B4C  FF        .db $FF
  $8B4D  FF        .db $FF
  $8B4E  FF        .db $FF
  $8B4F  FF        .db $FF
  $8B50  FF        .db $FF
  $8B51  FF        .db $FF
  $8B52  FF        .db $FF
  $8B53  FF        .db $FF
  $8B54  FF        .db $FF
  $8B55  FF        .db $FF
  $8B56  FF        .db $FF
  $8B57  FF        .db $FF
  $8B58  FF        .db $FF
  $8B59  FF        .db $FF
  $8B5A  FF        .db $FF
  $8B5B  FF        .db $FF
  $8B5C  FF        .db $FF
  $8B5D  FF        .db $FF
  $8B5E  FF        .db $FF
  $8B5F  FF        .db $FF
  $8B60  FF        .db $FF
  $8B61  FF        .db $FF
  $8B62  FF        .db $FF
  $8B63  FF        .db $FF
  $8B64  FF        .db $FF
  $8B65  FF        .db $FF
  $8B66  FF        .db $FF
  $8B67  FF        .db $FF
  $8B68  FF        .db $FF
  $8B69  FF        .db $FF
  $8B6A  FF        .db $FF
  $8B6B  FF        .db $FF
  $8B6C  FF        .db $FF
  $8B6D  FF        .db $FF
  $8B6E  FF        .db $FF
  $8B6F  FF        .db $FF
  $8B70  FF        .db $FF
  $8B71  FF        .db $FF
  $8B72  FF        .db $FF
  $8B73  FF        .db $FF
  $8B74  FF        .db $FF
  $8B75  FF        .db $FF
  $8B76  FF        .db $FF
  $8B77  FF        .db $FF
  $8B78  FF        .db $FF
  $8B79  FF        .db $FF
  $8B7A  FF        .db $FF
  $8B7B  FF        .db $FF
  $8B7C  FF        .db $FF
  $8B7D  FF        .db $FF
  $8B7E  FF        .db $FF
  $8B7F  FF        .db $FF
  $8B80  FF        .db $FF
  $8B81  FF        .db $FF
  $8B82  FF        .db $FF
  $8B83  FF        .db $FF
  $8B84  FF        .db $FF
  $8B85  FF        .db $FF
  $8B86  FF        .db $FF
  $8B87  FF        .db $FF
  $8B88  FF        .db $FF
  $8B89  FF        .db $FF
  $8B8A  FF        .db $FF
  $8B8B  FF        .db $FF
  $8B8C  FF        .db $FF
  $8B8D  FF        .db $FF
  $8B8E  FF        .db $FF
  $8B8F  FF        .db $FF
  $8B90  FF        .db $FF
  $8B91  FF        .db $FF
  $8B92  FF        .db $FF
  $8B93  FF        .db $FF
  $8B94  FF        .db $FF
  $8B95  FF        .db $FF
  $8B96  FF        .db $FF
  $8B97  FF        .db $FF
  $8B98  FF        .db $FF
  $8B99  FF        .db $FF
  $8B9A  FF        .db $FF
  $8B9B  FF        .db $FF
  $8B9C  FF        .db $FF
  $8B9D  FF        .db $FF
  $8B9E  FF        .db $FF
  $8B9F  FF        .db $FF
  $8BA0  FF        .db $FF
  $8BA1  FF        .db $FF
  $8BA2  FF        .db $FF
  $8BA3  FF        .db $FF
  $8BA4  FF        .db $FF
  $8BA5  FF        .db $FF
  $8BA6  FF        .db $FF
  $8BA7  FF        .db $FF
  $8BA8  FF        .db $FF
  $8BA9  FF        .db $FF
  $8BAA  FF        .db $FF
  $8BAB  FF        .db $FF
  $8BAC  FF        .db $FF
  $8BAD  FF        .db $FF
  $8BAE  FF        .db $FF
  $8BAF  FF        .db $FF
  $8BB0  FF        .db $FF
  $8BB1  FF        .db $FF
  $8BB2  FF        .db $FF
  $8BB3  FF        .db $FF
  $8BB4  FF        .db $FF
  $8BB5  FF        .db $FF
  $8BB6  FF        .db $FF
  $8BB7  FF        .db $FF
  $8BB8  FF        .db $FF
  $8BB9  FF        .db $FF
  $8BBA  FF        .db $FF
  $8BBB  FF        .db $FF
  $8BBC  FF        .db $FF
  $8BBD  FF        .db $FF
  $8BBE  FF        .db $FF
  $8BBF  FF        .db $FF
  $8BC0  FF        .db $FF
  $8BC1  FF        .db $FF
  $8BC2  FF        .db $FF
  $8BC3  FF        .db $FF
  $8BC4  FF        .db $FF
  $8BC5  FF        .db $FF
  $8BC6  FF        .db $FF
  $8BC7  FF        .db $FF
  $8BC8  FF        .db $FF
  $8BC9  FF        .db $FF
  $8BCA  FF        .db $FF
  $8BCB  FF        .db $FF
  $8BCC  FF        .db $FF
  $8BCD  FF        .db $FF
  $8BCE  FF        .db $FF
  $8BCF  FF        .db $FF
  $8BD0  FF        .db $FF
  $8BD1  FF        .db $FF
  $8BD2  FF        .db $FF
  $8BD3  FF        .db $FF
  $8BD4  FF        .db $FF
  $8BD5  FF        .db $FF
  $8BD6  FF        .db $FF
  $8BD7  FF        .db $FF
  $8BD8  FF        .db $FF
  $8BD9  FF        .db $FF
  $8BDA  FF        .db $FF
  $8BDB  FF        .db $FF
  $8BDC  FF        .db $FF
  $8BDD  FF        .db $FF
  $8BDE  FF        .db $FF
  $8BDF  FF        .db $FF
  $8BE0  FF        .db $FF
  $8BE1  FF        .db $FF
  $8BE2  FF        .db $FF
  $8BE3  FF        .db $FF
  $8BE4  FF        .db $FF
  $8BE5  FF        .db $FF
  $8BE6  FF        .db $FF
  $8BE7  FF        .db $FF
  $8BE8  FF        .db $FF
  $8BE9  FF        .db $FF
  $8BEA  FF        .db $FF
  $8BEB  FF        .db $FF
  $8BEC  FF        .db $FF
  $8BED  FF        .db $FF
  $8BEE  FF        .db $FF
  $8BEF  FF        .db $FF
  $8BF0  FF        .db $FF
  $8BF1  FF        .db $FF
  $8BF2  FF        .db $FF
  $8BF3  FF        .db $FF
  $8BF4  FF        .db $FF
  $8BF5  FF        .db $FF
  $8BF6  FF        .db $FF
  $8BF7  FF        .db $FF
  $8BF8  FF        .db $FF
  $8BF9  FF        .db $FF
  $8BFA  FF        .db $FF
  $8BFB  FF        .db $FF
  $8BFC  FF        .db $FF
  $8BFD  FF        .db $FF
  $8BFE  FF        .db $FF
  $8BFF  FF        .db $FF
  $8C00  FF        .db $FF
  $8C01  FF        .db $FF
  $8C02  FF        .db $FF
  $8C03  FF        .db $FF
  $8C04  FF        .db $FF
  $8C05  FF        .db $FF
  $8C06  FF        .db $FF
  $8C07  FF        .db $FF
  $8C08  FF        .db $FF
  $8C09  FF        .db $FF
  $8C0A  FF        .db $FF
  $8C0B  FF        .db $FF
  $8C0C  FF        .db $FF
  $8C0D  FF        .db $FF
  $8C0E  FF        .db $FF
  $8C0F  FF        .db $FF
  $8C10  FF        .db $FF
  $8C11  FF        .db $FF
  $8C12  FF        .db $FF
  $8C13  FF        .db $FF
  $8C14  FF        .db $FF
  $8C15  FF        .db $FF
  $8C16  FF        .db $FF
  $8C17  FF        .db $FF
  $8C18  FF        .db $FF
  $8C19  FF        .db $FF
  $8C1A  FF        .db $FF
  $8C1B  FF        .db $FF
  $8C1C  FF        .db $FF
  $8C1D  FF        .db $FF
  $8C1E  FF        .db $FF
  $8C1F  FF        .db $FF
  $8C20  FF        .db $FF
  $8C21  FF        .db $FF
  $8C22  FF        .db $FF
  $8C23  FF        .db $FF
  $8C24  FF        .db $FF
  $8C25  FF        .db $FF
  $8C26  FF        .db $FF
  $8C27  FF        .db $FF
  $8C28  FF        .db $FF
  $8C29  FF        .db $FF
  $8C2A  FF        .db $FF
  $8C2B  FF        .db $FF
  $8C2C  FF        .db $FF
  $8C2D  FF        .db $FF
  $8C2E  FF        .db $FF
  $8C2F  FF        .db $FF
  $8C30  FF        .db $FF
  $8C31  FF        .db $FF
  $8C32  FF        .db $FF
  $8C33  FF        .db $FF
  $8C34  FF        .db $FF
  $8C35  FF        .db $FF
  $8C36  FF        .db $FF
  $8C37  FF        .db $FF
  $8C38  FF        .db $FF
  $8C39  FF        .db $FF
  $8C3A  FF        .db $FF
  $8C3B  FF        .db $FF
  $8C3C  FF        .db $FF
  $8C3D  FF        .db $FF
  $8C3E  FF        .db $FF
  $8C3F  FF        .db $FF
  $8C40  FF        .db $FF
  $8C41  FF        .db $FF
  $8C42  FF        .db $FF
  $8C43  FF        .db $FF
  $8C44  FF        .db $FF
  $8C45  FF        .db $FF
  $8C46  FF        .db $FF
  $8C47  FF        .db $FF
  $8C48  FF        .db $FF
  $8C49  FF        .db $FF
  $8C4A  FF        .db $FF
  $8C4B  FF        .db $FF
  $8C4C  FF        .db $FF
  $8C4D  FF        .db $FF
  $8C4E  FF        .db $FF
  $8C4F  FF        .db $FF
  $8C50  FF        .db $FF
  $8C51  FF        .db $FF
  $8C52  FF        .db $FF
  $8C53  FF        .db $FF
  $8C54  FF        .db $FF
  $8C55  FF        .db $FF
  $8C56  FF        .db $FF
  $8C57  FF        .db $FF
  $8C58  FF        .db $FF
  $8C59  FF        .db $FF
  $8C5A  FF        .db $FF
  $8C5B  FF        .db $FF
  $8C5C  FF        .db $FF
  $8C5D  FF        .db $FF
  $8C5E  FF        .db $FF
  $8C5F  FF        .db $FF
  $8C60  FF        .db $FF
  $8C61  FF        .db $FF
  $8C62  FF        .db $FF
  $8C63  FF        .db $FF
  $8C64  FF        .db $FF
  $8C65  FF        .db $FF
  $8C66  FF        .db $FF
  $8C67  FF        .db $FF
  $8C68  FF        .db $FF
  $8C69  FF        .db $FF
  $8C6A  FF        .db $FF
  $8C6B  FF        .db $FF
  $8C6C  FF        .db $FF
  $8C6D  FF        .db $FF
  $8C6E  FF        .db $FF
  $8C6F  FF        .db $FF
  $8C70  FF        .db $FF
  $8C71  FF        .db $FF
  $8C72  FF        .db $FF
  $8C73  FF        .db $FF
  $8C74  FF        .db $FF
  $8C75  FF        .db $FF
  $8C76  FF        .db $FF
  $8C77  FF        .db $FF
  $8C78  FF        .db $FF
  $8C79  FF        .db $FF
  $8C7A  FF        .db $FF
  $8C7B  FF        .db $FF
  $8C7C  FF        .db $FF
  $8C7D  FF        .db $FF
  $8C7E  FF        .db $FF
  $8C7F  FF        .db $FF
  $8C80  FF        .db $FF
  $8C81  FF        .db $FF
  $8C82  FF        .db $FF
  $8C83  FF        .db $FF
  $8C84  FF        .db $FF
  $8C85  FF        .db $FF
  $8C86  FF        .db $FF
  $8C87  FF        .db $FF
  $8C88  FF        .db $FF
  $8C89  FF        .db $FF
  $8C8A  FF        .db $FF
  $8C8B  FF        .db $FF
  $8C8C  FF        .db $FF
  $8C8D  FF        .db $FF
  $8C8E  FF        .db $FF
  $8C8F  FF        .db $FF
  $8C90  FF        .db $FF
  $8C91  FF        .db $FF
  $8C92  FF        .db $FF
  $8C93  FF        .db $FF
  $8C94  FF        .db $FF
  $8C95  FF        .db $FF
  $8C96  FF        .db $FF
  $8C97  FF        .db $FF
  $8C98  FF        .db $FF
  $8C99  FF        .db $FF
  $8C9A  FF        .db $FF
  $8C9B  FF        .db $FF
  $8C9C  FF        .db $FF
  $8C9D  FF        .db $FF
  $8C9E  FF        .db $FF
  $8C9F  FF        .db $FF
  $8CA0  FF        .db $FF
  $8CA1  FF        .db $FF
  $8CA2  FF        .db $FF
  $8CA3  FF        .db $FF
  $8CA4  FF        .db $FF
  $8CA5  FF        .db $FF
  $8CA6  FF        .db $FF
  $8CA7  FF        .db $FF
  $8CA8  FF        .db $FF
  $8CA9  FF        .db $FF
  $8CAA  FF        .db $FF
  $8CAB  FF        .db $FF
  $8CAC  FF        .db $FF
  $8CAD  FF        .db $FF
  $8CAE  FF        .db $FF
  $8CAF  FF        .db $FF
  $8CB0  FF        .db $FF
  $8CB1  FF        .db $FF
  $8CB2  FF        .db $FF
  $8CB3  FF        .db $FF
  $8CB4  FF        .db $FF
  $8CB5  FF        .db $FF
  $8CB6  FF        .db $FF
  $8CB7  FF        .db $FF
  $8CB8  FF        .db $FF
  $8CB9  FF        .db $FF
  $8CBA  FF        .db $FF
  $8CBB  FF        .db $FF
  $8CBC  FF        .db $FF
  $8CBD  FF        .db $FF
  $8CBE  FF        .db $FF
  $8CBF  FF        .db $FF
  $8CC0  FF        .db $FF
  $8CC1  FF        .db $FF
  $8CC2  FF        .db $FF
  $8CC3  FF        .db $FF
  $8CC4  FF        .db $FF
  $8CC5  FF        .db $FF
  $8CC6  FF        .db $FF
  $8CC7  FF        .db $FF
  $8CC8  FF        .db $FF
  $8CC9  FF        .db $FF
  $8CCA  FF        .db $FF
  $8CCB  FF        .db $FF
  $8CCC  FF        .db $FF
  $8CCD  FF        .db $FF
  $8CCE  FF        .db $FF
  $8CCF  FF        .db $FF
  $8CD0  FF        .db $FF
  $8CD1  FF        .db $FF
  $8CD2  FF        .db $FF
  $8CD3  FF        .db $FF
  $8CD4  FF        .db $FF
  $8CD5  FF        .db $FF
  $8CD6  FF        .db $FF
  $8CD7  FF        .db $FF
  $8CD8  FF        .db $FF
  $8CD9  FF        .db $FF
  $8CDA  FF        .db $FF
  $8CDB  FF        .db $FF
  $8CDC  FF        .db $FF
  $8CDD  FF        .db $FF
  $8CDE  FF        .db $FF
  $8CDF  FF        .db $FF
  $8CE0  FF        .db $FF
  $8CE1  FF        .db $FF
  $8CE2  FF        .db $FF
  $8CE3  FF        .db $FF
  $8CE4  FF        .db $FF
  $8CE5  FF        .db $FF
  $8CE6  FF        .db $FF
  $8CE7  FF        .db $FF
  $8CE8  FF        .db $FF
  $8CE9  FF        .db $FF
  $8CEA  FF        .db $FF
  $8CEB  FF        .db $FF
  $8CEC  FF        .db $FF
  $8CED  FF        .db $FF
  $8CEE  FF        .db $FF
  $8CEF  FF        .db $FF
  $8CF0  FF        .db $FF
  $8CF1  FF        .db $FF
  $8CF2  FF        .db $FF
  $8CF3  FF        .db $FF
  $8CF4  FF        .db $FF
  $8CF5  FF        .db $FF
  $8CF6  FF        .db $FF
  $8CF7  FF        .db $FF
  $8CF8  FF        .db $FF
  $8CF9  FF        .db $FF
  $8CFA  FF        .db $FF
  $8CFB  FF        .db $FF
  $8CFC  FF        .db $FF
  $8CFD  FF        .db $FF
  $8CFE  FF        .db $FF
  $8CFF  FF        .db $FF
  $8D00  FF        .db $FF
  $8D01  FF        .db $FF
  $8D02  FF        .db $FF
  $8D03  FF        .db $FF
  $8D04  FF        .db $FF
  $8D05  FF        .db $FF
  $8D06  FF        .db $FF
  $8D07  FF        .db $FF
  $8D08  FF        .db $FF
  $8D09  FF        .db $FF
  $8D0A  FF        .db $FF
  $8D0B  FF        .db $FF
  $8D0C  FF        .db $FF
  $8D0D  FF        .db $FF
  $8D0E  FF        .db $FF
  $8D0F  FF        .db $FF
  $8D10  FF        .db $FF
  $8D11  FF        .db $FF
  $8D12  FF        .db $FF
  $8D13  FF        .db $FF
  $8D14  FF        .db $FF
  $8D15  FF        .db $FF
  $8D16  FF        .db $FF
  $8D17  FF        .db $FF
  $8D18  FF        .db $FF
  $8D19  FF        .db $FF
  $8D1A  FF        .db $FF
  $8D1B  FF        .db $FF
  $8D1C  FF        .db $FF
  $8D1D  FF        .db $FF
  $8D1E  FF        .db $FF
  $8D1F  FF        .db $FF
  $8D20  FF        .db $FF
  $8D21  FF        .db $FF
  $8D22  FF        .db $FF
  $8D23  FF        .db $FF
  $8D24  FF        .db $FF
  $8D25  FF        .db $FF
  $8D26  FF        .db $FF
  $8D27  FF        .db $FF
  $8D28  FF        .db $FF
  $8D29  FF        .db $FF
  $8D2A  FF        .db $FF
  $8D2B  FF        .db $FF
  $8D2C  FF        .db $FF
  $8D2D  FF        .db $FF
  $8D2E  FF        .db $FF
  $8D2F  FF        .db $FF
  $8D30  FF        .db $FF
  $8D31  FF        .db $FF
  $8D32  FF        .db $FF
  $8D33  FF        .db $FF
  $8D34  FF        .db $FF
  $8D35  FF        .db $FF
  $8D36  FF        .db $FF
  $8D37  FF        .db $FF
  $8D38  FF        .db $FF
  $8D39  FF        .db $FF
  $8D3A  FF        .db $FF
  $8D3B  FF        .db $FF
  $8D3C  FF        .db $FF
  $8D3D  FF        .db $FF
  $8D3E  FF        .db $FF
  $8D3F  FF        .db $FF
  $8D40  FF        .db $FF
  $8D41  FF        .db $FF
  $8D42  FF        .db $FF
  $8D43  FF        .db $FF
  $8D44  FF        .db $FF
  $8D45  FF        .db $FF
  $8D46  FF        .db $FF
  $8D47  FF        .db $FF
  $8D48  FF        .db $FF
  $8D49  FF        .db $FF
  $8D4A  FF        .db $FF
  $8D4B  FF        .db $FF
  $8D4C  FF        .db $FF
  $8D4D  FF        .db $FF
  $8D4E  FF        .db $FF
  $8D4F  FF        .db $FF
  $8D50  FF        .db $FF
  $8D51  FF        .db $FF
  $8D52  FF        .db $FF
  $8D53  FF        .db $FF
  $8D54  FF        .db $FF
  $8D55  FF        .db $FF
  $8D56  FF        .db $FF
  $8D57  FF        .db $FF
  $8D58  FF        .db $FF
  $8D59  FF        .db $FF
  $8D5A  FF        .db $FF
  $8D5B  FF        .db $FF
  $8D5C  FF        .db $FF
  $8D5D  FF        .db $FF
  $8D5E  FF        .db $FF
  $8D5F  FF        .db $FF
  $8D60  FF        .db $FF
  $8D61  FF        .db $FF
  $8D62  FF        .db $FF
  $8D63  FF        .db $FF
  $8D64  FF        .db $FF
  $8D65  FF        .db $FF
  $8D66  FF        .db $FF
  $8D67  FF        .db $FF
  $8D68  FF        .db $FF
  $8D69  FF        .db $FF
  $8D6A  FF        .db $FF
  $8D6B  FF        .db $FF
  $8D6C  FF        .db $FF
  $8D6D  FF        .db $FF
  $8D6E  FF        .db $FF
  $8D6F  FF        .db $FF
  $8D70  FF        .db $FF
  $8D71  FF        .db $FF
  $8D72  FF        .db $FF
  $8D73  FF        .db $FF
  $8D74  FF        .db $FF
  $8D75  FF        .db $FF
  $8D76  FF        .db $FF
  $8D77  FF        .db $FF
  $8D78  FF        .db $FF
  $8D79  FF        .db $FF
  $8D7A  FF        .db $FF
  $8D7B  FF        .db $FF
  $8D7C  FF        .db $FF
  $8D7D  FF        .db $FF
  $8D7E  FF        .db $FF
  $8D7F  FF        .db $FF
  $8D80  FF        .db $FF
  $8D81  FF        .db $FF
  $8D82  FF        .db $FF
  $8D83  FF        .db $FF
  $8D84  FF        .db $FF
  $8D85  FF        .db $FF
  $8D86  FF        .db $FF
  $8D87  FF        .db $FF
  $8D88  FF        .db $FF
  $8D89  FF        .db $FF
  $8D8A  FF        .db $FF
  $8D8B  FF        .db $FF
  $8D8C  FF        .db $FF
  $8D8D  FF        .db $FF
  $8D8E  FF        .db $FF
  $8D8F  FF        .db $FF
  $8D90  FF        .db $FF
  $8D91  FF        .db $FF
  $8D92  FF        .db $FF
  $8D93  FF        .db $FF
  $8D94  FF        .db $FF
  $8D95  FF        .db $FF
  $8D96  FF        .db $FF
  $8D97  FF        .db $FF
  $8D98  FF        .db $FF
  $8D99  FF        .db $FF
  $8D9A  FF        .db $FF
  $8D9B  FF        .db $FF
  $8D9C  FF        .db $FF
  $8D9D  FF        .db $FF
  $8D9E  FF        .db $FF
  $8D9F  FF        .db $FF
  $8DA0  FF        .db $FF
  $8DA1  FF        .db $FF
  $8DA2  FF        .db $FF
  $8DA3  FF        .db $FF
  $8DA4  FF        .db $FF
  $8DA5  FF        .db $FF
  $8DA6  FF        .db $FF
  $8DA7  FF        .db $FF
  $8DA8  FF        .db $FF
  $8DA9  FF        .db $FF
  $8DAA  FF        .db $FF
  $8DAB  FF        .db $FF
  $8DAC  FF        .db $FF
  $8DAD  FF        .db $FF
  $8DAE  FF        .db $FF
  $8DAF  FF        .db $FF
  $8DB0  FF        .db $FF
  $8DB1  FF        .db $FF
  $8DB2  FF        .db $FF
  $8DB3  FF        .db $FF
  $8DB4  FF        .db $FF
  $8DB5  FF        .db $FF
  $8DB6  FF        .db $FF
  $8DB7  FF        .db $FF
  $8DB8  FF        .db $FF
  $8DB9  FF        .db $FF
  $8DBA  FF        .db $FF
  $8DBB  FF        .db $FF
  $8DBC  FF        .db $FF
  $8DBD  FF        .db $FF
  $8DBE  FF        .db $FF
  $8DBF  FF        .db $FF
  $8DC0  FF        .db $FF
  $8DC1  FF        .db $FF
  $8DC2  FF        .db $FF
  $8DC3  FF        .db $FF
  $8DC4  FF        .db $FF
  $8DC5  FF        .db $FF
  $8DC6  FF        .db $FF
  $8DC7  FF        .db $FF
  $8DC8  FF        .db $FF
  $8DC9  FF        .db $FF
  $8DCA  FF        .db $FF
  $8DCB  FF        .db $FF
  $8DCC  FF        .db $FF
  $8DCD  FF        .db $FF
  $8DCE  FF        .db $FF
  $8DCF  FF        .db $FF
  $8DD0  FF        .db $FF
  $8DD1  FF        .db $FF
  $8DD2  FF        .db $FF
  $8DD3  FF        .db $FF
  $8DD4  FF        .db $FF
  $8DD5  FF        .db $FF
  $8DD6  FF        .db $FF
  $8DD7  FF        .db $FF
  $8DD8  FF        .db $FF
  $8DD9  FF        .db $FF
  $8DDA  FF        .db $FF
  $8DDB  FF        .db $FF
  $8DDC  FF        .db $FF
  $8DDD  FF        .db $FF
  $8DDE  FF        .db $FF
  $8DDF  FF        .db $FF
  $8DE0  FF        .db $FF
  $8DE1  FF        .db $FF
  $8DE2  FF        .db $FF
  $8DE3  FF        .db $FF
  $8DE4  FF        .db $FF
  $8DE5  FF        .db $FF
  $8DE6  FF        .db $FF
  $8DE7  FF        .db $FF
  $8DE8  FF        .db $FF
  $8DE9  FF        .db $FF
  $8DEA  FF        .db $FF
  $8DEB  FF        .db $FF
  $8DEC  FF        .db $FF
  $8DED  FF        .db $FF
  $8DEE  FF        .db $FF
  $8DEF  FF        .db $FF
  $8DF0  FF        .db $FF
  $8DF1  FF        .db $FF
  $8DF2  FF        .db $FF
  $8DF3  FF        .db $FF
  $8DF4  FF        .db $FF
  $8DF5  FF        .db $FF
  $8DF6  FF        .db $FF
  $8DF7  FF        .db $FF
  $8DF8  FF        .db $FF
  $8DF9  FF        .db $FF
  $8DFA  FF        .db $FF
  $8DFB  FF        .db $FF
  $8DFC  FF        .db $FF
  $8DFD  FF        .db $FF
  $8DFE  FF        .db $FF
  $8DFF  FF        .db $FF
  $8E00  FF        .db $FF
  $8E01  FF        .db $FF
  $8E02  FF        .db $FF
  $8E03  FF        .db $FF
  $8E04  FF        .db $FF
  $8E05  FF        .db $FF
  $8E06  FF        .db $FF
  $8E07  FF        .db $FF
  $8E08  FF        .db $FF
  $8E09  FF        .db $FF
  $8E0A  FF        .db $FF
  $8E0B  FF        .db $FF
  $8E0C  FF        .db $FF
  $8E0D  FF        .db $FF
  $8E0E  FF        .db $FF
  $8E0F  FF        .db $FF
  $8E10  FF        .db $FF
  $8E11  FF        .db $FF
  $8E12  FF        .db $FF
  $8E13  FF        .db $FF
  $8E14  FF        .db $FF
  $8E15  FF        .db $FF
  $8E16  FF        .db $FF
  $8E17  FF        .db $FF
  $8E18  FF        .db $FF
  $8E19  FF        .db $FF
  $8E1A  FF        .db $FF
  $8E1B  FF        .db $FF
  $8E1C  FF        .db $FF
  $8E1D  FF        .db $FF
  $8E1E  FF        .db $FF
  $8E1F  FF        .db $FF
  $8E20  FF        .db $FF
  $8E21  FF        .db $FF
  $8E22  FF        .db $FF
  $8E23  FF        .db $FF
  $8E24  FF        .db $FF
  $8E25  FF        .db $FF
  $8E26  FF        .db $FF
  $8E27  FF        .db $FF
  $8E28  FF        .db $FF
  $8E29  FF        .db $FF
  $8E2A  FF        .db $FF
  $8E2B  FF        .db $FF
  $8E2C  FF        .db $FF
  $8E2D  FF        .db $FF
  $8E2E  FF        .db $FF
  $8E2F  FF        .db $FF
  $8E30  FF        .db $FF
  $8E31  FF        .db $FF
  $8E32  FF        .db $FF
  $8E33  FF        .db $FF
  $8E34  FF        .db $FF
  $8E35  FF        .db $FF
  $8E36  FF        .db $FF
  $8E37  FF        .db $FF
  $8E38  FF        .db $FF
  $8E39  FF        .db $FF
  $8E3A  FF        .db $FF
  $8E3B  FF        .db $FF
  $8E3C  FF        .db $FF
  $8E3D  FF        .db $FF
  $8E3E  FF        .db $FF
  $8E3F  FF        .db $FF
  $8E40  FF        .db $FF
  $8E41  FF        .db $FF
  $8E42  FF        .db $FF
  $8E43  FF        .db $FF
  $8E44  FF        .db $FF
  $8E45  FF        .db $FF
  $8E46  FF        .db $FF
  $8E47  FF        .db $FF
  $8E48  FF        .db $FF
  $8E49  FF        .db $FF
  $8E4A  FF        .db $FF
  $8E4B  FF        .db $FF
  $8E4C  FF        .db $FF
  $8E4D  FF        .db $FF
  $8E4E  FF        .db $FF
  $8E4F  FF        .db $FF
  $8E50  FF        .db $FF
  $8E51  FF        .db $FF
  $8E52  FF        .db $FF
  $8E53  FF        .db $FF
  $8E54  FF        .db $FF
  $8E55  FF        .db $FF
  $8E56  FF        .db $FF
  $8E57  FF        .db $FF
  $8E58  FF        .db $FF
  $8E59  FF        .db $FF
  $8E5A  FF        .db $FF
  $8E5B  FF        .db $FF
  $8E5C  FF        .db $FF
  $8E5D  FF        .db $FF
  $8E5E  FF        .db $FF
  $8E5F  FF        .db $FF
  $8E60  FF        .db $FF
  $8E61  FF        .db $FF
  $8E62  FF        .db $FF
  $8E63  FF        .db $FF
  $8E64  FF        .db $FF
  $8E65  FF        .db $FF
  $8E66  FF        .db $FF
  $8E67  FF        .db $FF
  $8E68  FF        .db $FF
  $8E69  FF        .db $FF
  $8E6A  FF        .db $FF
  $8E6B  FF        .db $FF
  $8E6C  FF        .db $FF
  $8E6D  FF        .db $FF
  $8E6E  FF        .db $FF
  $8E6F  FF        .db $FF
  $8E70  FF        .db $FF
  $8E71  FF        .db $FF
  $8E72  FF        .db $FF
  $8E73  FF        .db $FF
  $8E74  FF        .db $FF
  $8E75  FF        .db $FF
  $8E76  FF        .db $FF
  $8E77  FF        .db $FF
  $8E78  FF        .db $FF
  $8E79  FF        .db $FF
  $8E7A  FF        .db $FF
  $8E7B  FF        .db $FF
  $8E7C  FF        .db $FF
  $8E7D  FF        .db $FF
  $8E7E  FF        .db $FF
  $8E7F  FF        .db $FF
  $8E80  FF        .db $FF
  $8E81  FF        .db $FF
  $8E82  FF        .db $FF
  $8E83  FF        .db $FF
  $8E84  FF        .db $FF
  $8E85  FF        .db $FF
  $8E86  FF        .db $FF
  $8E87  FF        .db $FF
  $8E88  FF        .db $FF
  $8E89  FF        .db $FF
  $8E8A  FF        .db $FF
  $8E8B  FF        .db $FF
  $8E8C  FF        .db $FF
  $8E8D  FF        .db $FF
  $8E8E  FF        .db $FF
  $8E8F  FF        .db $FF
  $8E90  FF        .db $FF
  $8E91  FF        .db $FF
  $8E92  FF        .db $FF
  $8E93  FF        .db $FF
  $8E94  FF        .db $FF
  $8E95  FF        .db $FF
  $8E96  FF        .db $FF
  $8E97  FF        .db $FF
  $8E98  FF        .db $FF
  $8E99  FF        .db $FF
  $8E9A  FF        .db $FF
  $8E9B  FF        .db $FF
  $8E9C  FF        .db $FF
  $8E9D  FF        .db $FF
  $8E9E  FF        .db $FF
  $8E9F  FF        .db $FF
  $8EA0  FF        .db $FF
  $8EA1  FF        .db $FF
  $8EA2  FF        .db $FF
  $8EA3  FF        .db $FF
  $8EA4  FF        .db $FF
  $8EA5  FF        .db $FF
  $8EA6  FF        .db $FF
  $8EA7  FF        .db $FF
  $8EA8  FF        .db $FF
  $8EA9  FF        .db $FF
  $8EAA  FF        .db $FF
  $8EAB  FF        .db $FF
  $8EAC  FF        .db $FF
  $8EAD  FF        .db $FF
  $8EAE  FF        .db $FF
  $8EAF  FF        .db $FF
  $8EB0  FF        .db $FF
  $8EB1  FF        .db $FF
  $8EB2  FF        .db $FF
  $8EB3  FF        .db $FF
  $8EB4  FF        .db $FF
  $8EB5  FF        .db $FF
  $8EB6  FF        .db $FF
  $8EB7  FF        .db $FF
  $8EB8  FF        .db $FF
  $8EB9  FF        .db $FF
  $8EBA  FF        .db $FF
  $8EBB  FF        .db $FF
  $8EBC  FF        .db $FF
  $8EBD  FF        .db $FF
  $8EBE  FF        .db $FF
  $8EBF  FF        .db $FF
  $8EC0  FF        .db $FF
  $8EC1  FF        .db $FF
  $8EC2  FF        .db $FF
  $8EC3  FF        .db $FF
  $8EC4  FF        .db $FF
  $8EC5  FF        .db $FF
  $8EC6  FF        .db $FF
  $8EC7  FF        .db $FF
  $8EC8  FF        .db $FF
  $8EC9  FF        .db $FF
  $8ECA  FF        .db $FF
  $8ECB  FF        .db $FF
  $8ECC  FF        .db $FF
  $8ECD  FF        .db $FF
  $8ECE  FF        .db $FF
  $8ECF  FF        .db $FF
  $8ED0  FF        .db $FF
  $8ED1  FF        .db $FF
  $8ED2  FF        .db $FF
  $8ED3  FF        .db $FF
  $8ED4  FF        .db $FF
  $8ED5  FF        .db $FF
  $8ED6  FF        .db $FF
  $8ED7  FF        .db $FF
  $8ED8  FF        .db $FF
  $8ED9  FF        .db $FF
  $8EDA  FF        .db $FF
  $8EDB  FF        .db $FF
  $8EDC  FF        .db $FF
  $8EDD  FF        .db $FF
  $8EDE  FF        .db $FF
  $8EDF  FF        .db $FF
  $8EE0  FF        .db $FF
  $8EE1  FF        .db $FF
  $8EE2  FF        .db $FF
  $8EE3  FF        .db $FF
  $8EE4  FF        .db $FF
  $8EE5  FF        .db $FF
  $8EE6  FF        .db $FF
  $8EE7  FF        .db $FF
  $8EE8  FF        .db $FF
  $8EE9  FF        .db $FF
  $8EEA  FF        .db $FF
  $8EEB  FF        .db $FF
  $8EEC  FF        .db $FF
  $8EED  FF        .db $FF
  $8EEE  FF        .db $FF
  $8EEF  FF        .db $FF
  $8EF0  FF        .db $FF
  $8EF1  FF        .db $FF
  $8EF2  FF        .db $FF
  $8EF3  FF        .db $FF
  $8EF4  FF        .db $FF
  $8EF5  FF        .db $FF
  $8EF6  FF        .db $FF
  $8EF7  FF        .db $FF
  $8EF8  FF        .db $FF
  $8EF9  FF        .db $FF
  $8EFA  FF        .db $FF
  $8EFB  FF        .db $FF
  $8EFC  FF        .db $FF
  $8EFD  FF        .db $FF
  $8EFE  FF        .db $FF
  $8EFF  FF        .db $FF
  $8F00  FF        .db $FF
  $8F01  FF        .db $FF
  $8F02  FF        .db $FF
  $8F03  FF        .db $FF
  $8F04  FF        .db $FF
  $8F05  FF        .db $FF
  $8F06  FF        .db $FF
  $8F07  FF        .db $FF
  $8F08  FF        .db $FF
  $8F09  FF        .db $FF
  $8F0A  FF        .db $FF
  $8F0B  FF        .db $FF
  $8F0C  FF        .db $FF
  $8F0D  FF        .db $FF
  $8F0E  FF        .db $FF
  $8F0F  FF        .db $FF
  $8F10  FF        .db $FF
  $8F11  FF        .db $FF
  $8F12  FF        .db $FF
  $8F13  FF        .db $FF
  $8F14  FF        .db $FF
  $8F15  FF        .db $FF
  $8F16  FF        .db $FF
  $8F17  FF        .db $FF
  $8F18  FF        .db $FF
  $8F19  FF        .db $FF
  $8F1A  FF        .db $FF
  $8F1B  FF        .db $FF
  $8F1C  FF        .db $FF
  $8F1D  FF        .db $FF
  $8F1E  FF        .db $FF
  $8F1F  FF        .db $FF
  $8F20  FF        .db $FF
  $8F21  FF        .db $FF
  $8F22  FF        .db $FF
  $8F23  FF        .db $FF
  $8F24  FF        .db $FF
  $8F25  FF        .db $FF
  $8F26  FF        .db $FF
  $8F27  FF        .db $FF
  $8F28  FF        .db $FF
  $8F29  FF        .db $FF
  $8F2A  FF        .db $FF
  $8F2B  FF        .db $FF
  $8F2C  FF        .db $FF
  $8F2D  FF        .db $FF
  $8F2E  FF        .db $FF
  $8F2F  FF        .db $FF
  $8F30  FF        .db $FF
  $8F31  FF        .db $FF
  $8F32  FF        .db $FF
  $8F33  FF        .db $FF
  $8F34  FF        .db $FF
  $8F35  FF        .db $FF
  $8F36  FF        .db $FF
  $8F37  FF        .db $FF
  $8F38  FF        .db $FF
  $8F39  FF        .db $FF
  $8F3A  FF        .db $FF
  $8F3B  FF        .db $FF
  $8F3C  FF        .db $FF
  $8F3D  FF        .db $FF
  $8F3E  FF        .db $FF
  $8F3F  FF        .db $FF
  $8F40  FF        .db $FF
  $8F41  FF        .db $FF
  $8F42  FF        .db $FF
  $8F43  FF        .db $FF
  $8F44  FF        .db $FF
  $8F45  FF        .db $FF
  $8F46  FF        .db $FF
  $8F47  FF        .db $FF
  $8F48  FF        .db $FF
  $8F49  FF        .db $FF
  $8F4A  FF        .db $FF
  $8F4B  FF        .db $FF
  $8F4C  FF        .db $FF
  $8F4D  FF        .db $FF
  $8F4E  FF        .db $FF
  $8F4F  FF        .db $FF
  $8F50  FF        .db $FF
  $8F51  FF        .db $FF
  $8F52  FF        .db $FF
  $8F53  FF        .db $FF
  $8F54  FF        .db $FF
  $8F55  FF        .db $FF
  $8F56  FF        .db $FF
  $8F57  FF        .db $FF
  $8F58  FF        .db $FF
  $8F59  FF        .db $FF
  $8F5A  FF        .db $FF
  $8F5B  FF        .db $FF
  $8F5C  FF        .db $FF
  $8F5D  FF        .db $FF
  $8F5E  FF        .db $FF
  $8F5F  FF        .db $FF
  $8F60  FF        .db $FF
  $8F61  FF        .db $FF
  $8F62  FF        .db $FF
  $8F63  FF        .db $FF
  $8F64  FF        .db $FF
  $8F65  FF        .db $FF
  $8F66  FF        .db $FF
  $8F67  FF        .db $FF
  $8F68  FF        .db $FF
  $8F69  FF        .db $FF
  $8F6A  FF        .db $FF
  $8F6B  FF        .db $FF
  $8F6C  FF        .db $FF
  $8F6D  FF        .db $FF
  $8F6E  FF        .db $FF
  $8F6F  FF        .db $FF
  $8F70  FF        .db $FF
  $8F71  FF        .db $FF
  $8F72  FF        .db $FF
  $8F73  FF        .db $FF
  $8F74  FF        .db $FF
  $8F75  FF        .db $FF
  $8F76  FF        .db $FF
  $8F77  FF        .db $FF
  $8F78  FF        .db $FF
  $8F79  FF        .db $FF
  $8F7A  FF        .db $FF
  $8F7B  FF        .db $FF
  $8F7C  FF        .db $FF
  $8F7D  FF        .db $FF
  $8F7E  FF        .db $FF
  $8F7F  FF        .db $FF
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
  $9005  01 02     ORA ($02,X)
  $9007  02        .db $02
  $9008  00        BRK
  $9009  00        BRK
  $900A  00        BRK
  $900B  00        BRK
  $900C  00        BRK
  $900D  00        BRK
  $900E  01 01     ORA ($01,X)
  $9010  00        BRK
  $9011  00        BRK
  $9012  00        BRK
  $9013  00        BRK
  $9014  20 20 40  JSR $4020
  $9017  40        RTI
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  00        BRK
  $901C  40        RTI
  $901D  40        RTI
  $901E  80        .db $80
  $901F  80        .db $80
  $9020  02        .db $02
  $9021  02        .db $02
  $9022  01 01     ORA ($01,X)
  $9024  01 01     ORA ($01,X)
  $9026  07        .db $07
  $9027  0F        .db $0F
  $9028  01 01     ORA ($01,X)
  $902A  00        BRK
  $902B  00        BRK
  $902C  00        BRK
  $902D  00        BRK
  $902E  00        BRK
  $902F  06 3C     ASL $3C
  $9031  7C        .db $7C
  $9032  79 33 05  ADC $0533,Y
  $9035  89        .db $89
  $9036  59 5B 01  EOR $015B,Y
  $9039  BF        .db $BF
  $903A  FE FD F9  INC $F9FD,X
  $903D  71 21     ADC ($21),Y
  $903F  03        .db $03
  $9040  80        .db $80
  $9041  80        .db $80
  $9042  00        BRK
  $9043  80        .db $80
  $9044  70 7C     BVS $90C2
  $9046  7E FE 00  ROR $00FE,X
  $9049  00        BRK
  $904A  00        BRK
  $904B  00        BRK
  $904C  80        .db $80
  $904D  A0 A0     LDY #$A0
  $904F  60        RTS
  $9050  3F        .db $3F
  $9051  7F        .db $7F
  $9052  5F        .db $5F
  $9053  9B        .db $9B
  $9054  99 9C FC  STA $FC9C,Y
  $9057  7C        .db $7C
  $9058  06 03     ASL $03
  $905A  23        .db $23
  $905B  71 70     ADC ($70),Y
  $905D  78        SEI
  $905E  78        SEI
  $905F  38        SEC
  $9060  83        .db $83
  $9061  83        .db $83
  $9062  C6 7D     DEC $7D
  $9064  BB        .db $BB
  $9065  C7        .db $C7
  $9066  7F        .db $7F
  $9067  FF        .db $FF
  $9068  82        .db $82
  $9069  02        .db $02
  $906A  81 C3     STA ($C3,X)
  $906C  FF        .db $FF
  $906D  7E 38 00  ROR $0038,X
  $9070  FF        .db $FF
  $9071  FF        .db $FF
  $9072  FF        .db $FF
  $9073  DF        .db $DF
  $9074  BF        .db $BF
  $9075  BE FE FC  LDX $FCFE,Y
  $9078  40        RTI
  $9079  C6 8E     DEC $8E
  $907B  86 1E     STX $1E
  $907D  0C        .db $0C
  $907E  1C        .db $1C
  $907F  00        BRK
  $9080  39 03 04  AND $0403,Y
  $9083  08        PHP
  $9084  1F        .db $1F
  $9085  7F        .db $7F
  $9086  FF        .db $FF
  $9087  FF        .db $FF
  $9088  00        BRK
  $9089  00        BRK
  $908A  03        .db $03
  $908B  07        .db $07
  $908C  07        .db $07
  $908D  1F        .db $1F
  $908E  7F        .db $7F
  $908F  00        BRK
  $9090  FF        .db $FF
  $9091  E1 C0     SBC ($C0,X)
  $9093  C0 C1     CPY #$C1
  $9095  81 83     STA ($83,X)
  $9097  83        .db $83
  $9098  00        BRK
  $9099  00        BRK
  $909A  00        BRK
  $909B  80        .db $80
  $909C  80        .db $80
  $909D  00        BRK
  $909E  01 00     ORA ($00,X)
  $90A0  E8        INX
  $90A1  C8        INY
  $90A2  E8        INX
  $90A3  F8        SED
  $90A4  F8        SED
  $90A5  FE FF FF  INC $FFFF,X
  $90A8  10 30     BPL $90DA
  $90AA  70 70     BVS $911C
  $90AC  E0 F8     CPX #$F8
  $90AE  FE 00 00  INC $0000,X
  $90B1  00        BRK
  $90B2  00        BRK
  $90B3  00        BRK
  $90B4  00        BRK
  $90B5  00        BRK
  $90B6  40        RTI
  $90B7  40        RTI
  $90B8  00        BRK
  $90B9  00        BRK
  $90BA  00        BRK
  $90BB  00        BRK
  $90BC  00        BRK
  $90BD  00        BRK
  $90BE  80        .db $80
  $90BF  80        .db $80
  $90C0  04        .db $04
  $90C1  04        .db $04

L_90C2:
  $90C2  04        .db $04
  $90C3  04        .db $04
  $90C4  02        .db $02
  $90C5  02        .db $02
  $90C6  02        .db $02
  $90C7  03        .db $03
  $90C8  02        .db $02
  $90C9  02        .db $02
  $90CA  02        .db $02
  $90CB  03        .db $03
  $90CC  01 01     ORA ($01,X)
  $90CE  01 00     ORA ($00,X)
  $90D0  00        BRK
  $90D1  00        BRK
  $90D2  79 F9 F2  ADC $F2F9,Y
  $90D5  67        .db $67
  $90D6  0A        ASL
  $90D7  12        .db $12
  $90D8  01 01     ORA ($01,X)

L_90DA:
  $90DA  02        .db $02
  $90DB  7E FC FA  ROR $FAFC,X
  $90DE  F3        .db $F3
  $90DF  E3        .db $E3
  $90E0  80        .db $80
  $90E1  80        .db $80
  $90E2  00        BRK
  $90E3  0C        .db $0C
  $90E4  1E 3F FF  ASL $FF3F,X
  $90E7  FE 00 00  INC $0000,X
  $90EA  00        BRK
  $90EB  00        BRK
  $90EC  0C        .db $0C
  $90ED  1E 0C 40  ASL $400C,X
  $90F0  06 0E     ASL $0E

L_90F2:
  $90F2  1F        .db $1F
  $90F3  1F        .db $1F
  $90F4  1F        .db $1F
  $90F5  0F        .db $0F
  $90F6  0F        .db $0F
  $90F7  07        .db $07
  $90F8  00        BRK
  $90F9  04        .db $04
  $90FA  0D 02 01  ORA $0102
  $90FD  00        BRK
  $90FE  00        BRK
  $90FF  00        BRK
  $9100  B2        .db $B2
  $9101  B7        .db $B7
  $9102  07        .db $07
  $9103  07        .db $07
  $9104  8D FB E7  STA $E7FB
  $9107  FF        .db $FF
  $9108  43        .db $43
  $9109  06 04     ASL $04
  $910B  05 03     ORA $03
  $910D  86 7C     STX $7C
  $910F  00        BRK
  $9110  F0 E0     BEQ $90F2
  $9112  E0 C0     CPX #$C0
  $9114  80        .db $80
  $9115  00        BRK
  $9116  00        BRK
  $9117  E0 40     CPX #$40
  $9119  C0 80     CPY #$80
  $911B  80        .db $80

L_911C:
  $911C  00        BRK
  $911D  00        BRK
  $911E  00        BRK
  $911F  00        BRK
  $9120  00        BRK
  $9121  00        BRK
  $9122  00        BRK
  $9123  00        BRK
  $9124  00        BRK
  $9125  00        BRK
  $9126  01 01     ORA ($01,X)
  $9128  00        BRK
  $9129  00        BRK
  $912A  00        BRK
  $912B  00        BRK
  $912C  00        BRK
  $912D  00        BRK
  $912E  00        BRK
  $912F  00        BRK
  $9130  07        .db $07
  $9131  07        .db $07
  $9132  0B        .db $0B
  $9133  1F        .db $1F
  $9134  3F        .db $3F
  $9135  FF        .db $FF
  $9136  FF        .db $FF
  $9137  FE 01 01  INC $0101,X
  $913A  04        .db $04
  $913B  0E 0F 3C  ASL $3C0F
  $913E  FE 00 0F  INC $0F00,X
  $9141  DF        .db $DF
  $9142  FF        .db $FF
  $9143  FC        .db $FC
  $9144  F8        SED
  $9145  01 01     ORA ($01,X)
  $9147  01 F8     ORA ($F8,X)
  $9149  FC        .db $FC
  $914A  FC        .db $FC
  $914B  38        SEC
  $914C  00        BRK
  $914D  00        BRK
  $914E  00        BRK
  $914F  00        BRK
  $9150  F8        SED
  $9151  E4 F4     CPX $F4
  $9153  FC        .db $FC
  $9154  FC        .db $FC
  $9155  FE FF FF  INC $FFFF,X
  $9158  00        BRK
  $9159  18        CLC
  $915A  38        SEC
  $915B  38        SEC
  $915C  70 7C     BVS $91DA
  $915E  FE 00 00  INC $0000,X
  $9161  07        .db $07
  $9162  0C        .db $0C
  $9163  1F        .db $1F
  $9164  1F        .db $1F
  $9165  1F        .db $1F
  $9166  0C        .db $0C
  $9167  00        BRK
  $9168  00        BRK
  $9169  00        BRK
  $916A  07        .db $07
  $916B  0F        .db $0F
  $916C  0F        .db $0F
  $916D  0C        .db $0C

L_916E:
  $916E  00        BRK
  $916F  00        BRK
  $9170  23        .db $23
  $9171  A7        .db $A7
  $9172  57        .db $57
  $9173  F3        .db $F3
  $9174  F0 F8     BEQ $916E
  $9176  F5 75     SBC $75,X
  $9178  10 1B     BPL $9195

L_917A:
  $917A  8F        .db $8F
  $917B  8F        .db $8F
  $917C  0F        .db $0F
  $917D  27        .db $27
  $917E  22        .db $22
  $917F  20 C8 C8  JSR $C8C8
  $9182  90 38     BCC $91BC
  $9184  54        .db $54
  $9185  94 96     STY $96,X
  $9187  BF        .db $BF
  $9188  10 F0     BPL $917A
  $918A  E0 D0     CPX #$D0
  $918C  98        TYA
  $918D  18        CLC
  $918E  18        CLC
  $918F  36 78     ROL $78,X
  $9191  28        PLP
  $9192  14        .db $14
  $9193  17        .db $17
  $9194  1B        .db $1B

L_9195:
  $9195  0C        .db $0C
  $9196  07        .db $07
  $9197  0F        .db $0F
  $9198  28        PLP
  $9199  10 08     BPL $91A3
  $919B  0C        .db $0C
  $919C  07        .db $07
  $919D  03        .db $03
  $919E  00        BRK
  $919F  00        BRK
  $91A0  3F        .db $3F
  $91A1  3F        .db $3F
  $91A2  77        .db $77

L_91A3:
  $91A3  EF        .db $EF
  $91A4  9F        .db $9F
  $91A5  7F        .db $7F
  $91A6  FF        .db $FF
  $91A7  FF        .db $FF
  $91A8  27        .db $27
  $91A9  2E 1E 3C  ROL $3C1E
  $91AC  F9 F3 E3  SBC $E3F3,Y
  $91AF  0F        .db $0F
  $91B0  80        .db $80
  $91B1  80        .db $80
  $91B2  C0 C0     CPY #$C0
  $91B4  C0 C0     CPY #$C0
  $91B6  C0 80     CPY #$80
  $91B8  00        BRK
  $91B9  00        BRK
  $91BA  00        BRK
  $91BB  00        BRK

L_91BC:
  $91BC  80        .db $80
  $91BD  80        .db $80
  $91BE  80        .db $80
  $91BF  00        BRK
  $91C0  1F        .db $1F
  $91C1  13        .db $13
  $91C2  17        .db $17
  $91C3  1F        .db $1F
  $91C4  3F        .db $3F
  $91C5  7F        .db $7F
  $91C6  FF        .db $FF
  $91C7  FF        .db $FF
  $91C8  00        BRK
  $91C9  0C        .db $0C
  $91CA  0E 0E 07  ASL $070E
  $91CD  3F        .db $3F
  $91CE  7F        .db $7F
  $91CF  00        BRK
  $91D0  FF        .db $FF
  $91D1  9F        .db $9F
  $91D2  0F        .db $0F
  $91D3  03        .db $03
  $91D4  83        .db $83
  $91D5  81 C1     STA ($C1,X)
  $91D7  C1 0E     CMP ($0E,X)
  $91D9  0E 00 01  ASL $0100
  $91DC  01 00     ORA ($00,X)
  $91DE  80        .db $80
  $91DF  00        BRK
  $91E0  80        .db $80
  $91E1  40        RTI
  $91E2  20 F0 FC  JSR $FCF0
  $91E5  FE FF FF  INC $FFFF,X
  $91E8  00        BRK
  $91E9  80        .db $80

L_91EA:
  $91EA  C0 E0     CPY #$E0
  $91EC  F0 FC     BEQ $91EA
  $91EE  FE 00 00  INC $0000,X
  $91F1  00        BRK
  $91F2  00        BRK
  $91F3  20 24 7C  JSR $7C24
  $91F6  38        SEC
  $91F7  00        BRK
  $91F8  02        .db $02
  $91F9  06 86     ASL $86
  $91FB  A4 7C     LDY $7C
  $91FD  7C        .db $7C
  $91FE  38        SEC
  $91FF  00        BRK
  $9200  04        .db $04
  $9201  04        .db $04
  $9202  04        .db $04
  $9203  04        .db $04
  $9204  03        .db $03
  $9205  03        .db $03
  $9206  03        .db $03
  $9207  03        .db $03
  $9208  02        .db $02
  $9209  02        .db $02
  $920A  02        .db $02
  $920B  03        .db $03
  $920C  01 01     ORA ($01,X)
  $920E  01 00     ORA ($00,X)

L_9210:
  $9210  04        .db $04
  $9211  04        .db $04
  $9212  04        .db $04
  $9213  04        .db $04
  $9214  02        .db $02
  $9215  02        .db $02
  $9216  02        .db $02
  $9217  03        .db $03
  $9218  02        .db $02
  $9219  02        .db $02
  $921A  02        .db $02
  $921B  03        .db $03
  $921C  01 01     ORA ($01,X)
  $921E  01 00     ORA ($00,X)
  $9220  00        BRK
  $9221  00        BRK
  $9222  00        BRK
  $9223  00        BRK
  $9224  00        BRK
  $9225  00        BRK
  $9226  00        BRK
  $9227  00        BRK

L_9228:
  $9228  01 01     ORA ($01,X)
  $922A  02        .db $02
  $922B  06 0C     ASL $0C
  $922D  98        TYA
  $922E  F0 E0     BEQ $9210

L_9230:
  $9230  00        BRK
  $9231  00        BRK
  $9232  79 F9 F2  ADC $F2F9,Y
  $9235  67        .db $67
  $9236  0B        .db $0B
  $9237  13        .db $13
  $9238  00        BRK
  $9239  00        BRK
  $923A  00        BRK
  $923B  78        SEI
  $923C  F0 62     BEQ $92A0
  $923E  03        .db $03
  $923F  03        .db $03
  $9240  00        BRK
  $9241  00        BRK
  $9242  00        BRK
  $9243  04        .db $04
  $9244  0C        .db $0C
  $9245  98        TYA
  $9246  F0 E0     BEQ $9228
  $9248  01 01     ORA ($01,X)
  $924A  02        .db $02
  $924B  06 0C     ASL $0C
  $924D  98        TYA
  $924E  F0 E0     BEQ $9230
  $9250  00        BRK
  $9251  00        BRK
  $9252  00        BRK
  $9253  00        BRK
  $9254  00        BRK
  $9255  00        BRK
  $9256  40        RTI
  $9257  40        RTI
  $9258  00        BRK
  $9259  00        BRK
  $925A  00        BRK
  $925B  00        BRK
  $925C  00        BRK
  $925D  00        BRK
  $925E  80        .db $80
  $925F  80        .db $80
  $9260  00        BRK
  $9261  00        BRK
  $9262  00        BRK
  $9263  00        BRK
  $9264  00        BRK
  $9265  00        BRK
  $9266  00        BRK
  $9267  00        BRK
  $9268  00        BRK
  $9269  10 10     BPL $927B
  $926B  10 38     BPL $92A5
  $926D  FE 38 10  INC $1038,X
  $9270  00        BRK
  $9271  00        BRK
  $9272  00        BRK
  $9273  00        BRK
  $9274  00        BRK
  $9275  00        BRK
  $9276  00        BRK
  $9277  00        BRK
  $9278  80        .db $80
  $9279  80        .db $80
  $927A  80        .db $80

L_927B:
  $927B  80        .db $80
  $927C  00        BRK
  $927D  00        BRK
  $927E  00        BRK
  $927F  00        BRK
  $9280  00        BRK
  $9281  00        BRK
  $9282  00        BRK
  $9283  00        BRK
  $9284  00        BRK
  $9285  00        BRK
  $9286  00        BRK
  $9287  00        BRK
  $9288  00        BRK
  $9289  00        BRK
  $928A  00        BRK
  $928B  10 10     BPL $929D
  $928D  38        SEC
  $928E  10 10     BPL $92A0
  $9290  04        .db $04
  $9291  04        .db $04
  $9292  04        .db $04
  $9293  04        .db $04
  $9294  02        .db $02
  $9295  72        .db $72
  $9296  FA        .db $FA
  $9297  BF        .db $BF
  $9298  02        .db $02
  $9299  02        .db $02
  $929A  02        .db $02
  $929B  03        .db $03
  $929C  01 01     ORA ($01,X)
  $929E  71 78     ADC ($78),Y

L_92A0:
  $92A0  9E        .db $9E
  $92A1  9E        .db $9E
  $92A2  9F        .db $9F
  $92A3  9F        .db $9F
  $92A4  DF        .db $DF

L_92A5:
  $92A5  7F        .db $7F
  $92A6  79 31 78  ADC $7831,Y
  $92A9  78        SEI
  $92AA  71 72     ADC ($72),Y
  $92AC  21 01     AND ($01,X)
  $92AE  00        BRK
  $92AF  00        BRK
  $92B0  B2        .db $B2
  $92B1  B7        .db $B7
  $92B2  07        .db $07
  $92B3  07        .db $07
  $92B4  8D 7B 87  STA $877B
  $92B7  FF        .db $FF
  $92B8  43        .db $43
  $92B9  06 04     ASL $04
  $92BB  05 03     ORA $03
  $92BD  86 FC     STX $FC
  $92BF  00        BRK
  $92C0  03        .db $03
  $92C1  07        .db $07
  $92C2  09 13     ORA #$13
  $92C4  3F        .db $3F
  $92C5  FF        .db $FF
  $92C6  FF        .db $FF
  $92C7  FE 00 00  INC $0000,X
  $92CA  06 0E     ASL $0E
  $92CC  0F        .db $0F
  $92CD  3C        .db $3C
  $92CE  FE 00 FF  INC $FF00,X
  $92D1  FF        .db $FF
  $92D2  C3        .db $C3
  $92D3  80        .db $80
  $92D4  80        .db $80
  $92D5  01 01     ORA ($01,X)
  $92D7  01 00     ORA ($00,X)
  $92D9  00        BRK
  $92DA  00        BRK
  $92DB  00        BRK
  $92DC  00        BRK
  $92DD  00        BRK
  $92DE  00        BRK
  $92DF  00        BRK
  $92E0  6F        .db $6F
  $92E1  0F        .db $0F
  $92E2  0F        .db $0F
  $92E3  1B        .db $1B
  $92E4  F7        .db $F7
  $92E5  EE 1E FE  INC $FE1E
  $92E8  0D 09 09  ORA $0909
  $92EB  06 0E     ASL $0E
  $92ED  FC        .db $FC
  $92EE  F8        SED
  $92EF  E0 3D     CPX #$3D
  $92F1  FE 7E FF  INC $FF7E,X
  $92F4  ED CE 1F  SBC $1FCE
  $92F7  23        .db $23
  $92F8  18        CLC
  $92F9  1A        .db $1A
  $92FA  8C CE 87  STY $87CE
  $92FD  01 00     ORA ($00,X)
  $92FF  1C        .db $1C
  $9300  00        BRK
  $9301  00        BRK
  $9302  00        BRK
  $9303  00        BRK
  $9304  00        BRK
  $9305  00        BRK
  $9306  04        .db $04
  $9307  08        PHP
  $9308  00        BRK
  $9309  00        BRK
  $930A  00        BRK
  $930B  00        BRK
  $930C  00        BRK
  $930D  00        BRK
  $930E  00        BRK
  $930F  04        .db $04
  $9310  00        BRK
  $9311  00        BRK
  $9312  00        BRK
  $9313  00        BRK
  $9314  00        BRK
  $9315  20 20 40  JSR $4020
  $9318  00        BRK
  $9319  00        BRK
  $931A  00        BRK
  $931B  00        BRK
  $931C  00        BRK
  $931D  40        RTI
  $931E  40        RTI
  $931F  80        .db $80
  $9320  08        PHP
  $9321  08        PHP
  $9322  09 05     ORA #$05
  $9324  04        .db $04
  $9325  04        .db $04
  $9326  06 1D     ASL $1D
  $9328  04        .db $04
  $9329  04        .db $04
  $932A  06 03     ASL $03
  $932C  03        .db $03
  $932D  03        .db $03
  $932E  01 00     ORA ($00,X)
  $9330  01 F2     ORA ($F2,X)
  $9332  F2        .db $F2
  $9333  E4 CE     CPX $CE
  $9335  15 25     ORA $25,X
  $9337  65 02     ADC $02
  $9339  04        .db $04
  $933A  FC        .db $FC
  $933B  F8        SED
  $933C  F4        .db $F4
  $933D  E6 C6     INC $C6
  $933F  86 00     STX $00
  $9341  00        BRK
  $9342  00        BRK
  $9343  00        BRK
  $9344  00        BRK
  $9345  C0 F0     CPY #$F0
  $9347  F8        SED
  $9348  00        BRK
  $9349  00        BRK
  $934A  00        BRK
  $934B  00        BRK
  $934C  00        BRK
  $934D  00        BRK
  $934E  80        .db $80
  $934F  00        BRK
  $9350  0F        .db $0F
  $9351  10 38     BPL $938B
  $9353  3F        .db $3F
  $9354  3F        .db $3F
  $9355  1F        .db $1F
  $9356  0E 00 00  ASL $0000
  $9359  0F        .db $0F
  $935A  1F        .db $1F
  $935B  1F        .db $1F
  $935C  1E 0A 00  ASL $000A,X
  $935F  00        BRK
  $9360  3D FE 7E  AND $7EFE,X
  $9363  FF        .db $FF
  $9364  ED C6 03  SBC $03C6
  $9367  07        .db $07
  $9368  18        CLC
  $9369  1A        .db $1A
  $936A  8C CE 87  STY $87CE
  $936D  03        .db $03
  $936E  01 00     ORA ($00,X)
  $9370  6F        .db $6F
  $9371  0F        .db $0F
  $9372  0F        .db $0F
  $9373  1B        .db $1B
  $9374  F7        .db $F7
  $9375  EE 1E FF  INC $FF1E
  $9378  0D 09 09  ORA $0909
  $937B  06 0E     ASL $0E
  $937D  FC        .db $FC
  $937E  F8        SED
  $937F  E0 FC     CPX #$FC
  $9381  FC        .db $FC
  $9382  FC        .db $FC
  $9383  F8        SED
  $9384  C0 00     CPY #$00
  $9386  00        BRK
  $9387  00        BRK
  $9388  D8        CLD
  $9389  F8        SED
  $938A  F8        SED

L_938B:
  $938B  C0 00     CPY #$00
  $938D  00        BRK
  $938E  00        BRK
  $938F  00        BRK
  $9390  1F        .db $1F
  $9391  13        .db $13
  $9392  17        .db $17
  $9393  1F        .db $1F
  $9394  3F        .db $3F
  $9395  7F        .db $7F
  $9396  FF        .db $FF
  $9397  FF        .db $FF
  $9398  00        BRK
  $9399  0C        .db $0C
  $939A  0E 0E 1F  ASL $1F0E
  $939D  3F        .db $3F
  $939E  7F        .db $7F
  $939F  00        BRK
  $93A0  FF        .db $FF
  $93A1  9F        .db $9F
  $93A2  07        .db $07
  $93A3  03        .db $03
  $93A4  83        .db $83
  $93A5  81 C1     STA ($C1,X)
  $93A7  C1 00     CMP ($00,X)
  $93A9  00        BRK
  $93AA  00        BRK
  $93AB  01 01     ORA ($01,X)
  $93AD  00        BRK
  $93AE  80        .db $80
  $93AF  00        BRK
  $93B0  80        .db $80
  $93B1  40        RTI
  $93B2  20 F0 FC  JSR $FCF0
  $93B5  FE FF FF  INC $FFFF,X
  $93B8  00        BRK
  $93B9  80        .db $80

L_93BA:
  $93BA  C0 E0     CPY #$E0
  $93BC  F0 FC     BEQ $93BA
  $93BE  FE 00 00  INC $0000,X
  $93C1  00        BRK
  $93C2  00        BRK
  $93C3  00        BRK
  $93C4  40        RTI
  $93C5  80        .db $80
  $93C6  80        .db $80
  $93C7  8F        .db $8F
  $93C8  00        BRK
  $93C9  00        BRK
  $93CA  00        BRK
  $93CB  00        BRK
  $93CC  00        BRK
  $93CD  40        RTI
  $93CE  40        RTI
  $93CF  40        RTI
  $93D0  00        BRK
  $93D1  00        BRK
  $93D2  00        BRK
  $93D3  08        PHP
  $93D4  08        PHP
  $93D5  10 10     BPL $93E7
  $93D7  20 00 00  JSR $0000
  $93DA  00        BRK
  $93DB  10 10     BPL $93ED
  $93DD  20 20 40  JSR $4020
  $93E0  04        .db $04
  $93E1  02        .db $02
  $93E2  02        .db $02
  $93E3  02        .db $02
  $93E4  03        .db $03
  $93E5  0E 1E 3F  ASL $3F1E
  $93E8  03        .db $03
  $93E9  01 01     ORA ($01,X)
  $93EB  01 00     ORA ($00,X)

L_93ED:
  $93ED  00        BRK
  $93EE  0C        .db $0C
  $93EF  0D 00 00  ORA $0000
  $93F2  3E 22 22  ROL $2222,X
  $93F5  3E 00 00  ROL $0000,X
  $93F8  00        BRK
  $93F9  00        BRK
  $93FA  3E 22 22  ROL $2222,X
  $93FD  3E 00 00  ROL $0000,X
  $9400  F9 F2 67  SBC $67F2,Y
  $9403  0A        ASL
  $9404  12        .db $12
  $9405  B2        .db $B2
  $9406  B7        .db $B7
  $9407  07        .db $07
  $9408  7E FC FA  ROR $FAFC,X
  $940B  F3        .db $F3
  $940C  E3        .db $E3
  $940D  43        .db $43
  $940E  06 04     ASL $04
  $9410  00        BRK
  $9411  00        BRK
  $9412  00        BRK
  $9413  E0 F8     CPX #$F8
  $9415  FC        .db $FC
  $9416  FE FF 00  INC $00FF,X
  $9419  00        BRK
  $941A  00        BRK
  $941B  00        BRK
  $941C  40        RTI
  $941D  40        RTI
  $941E  C0 86     CPY #$86
  $9420  7F        .db $7F
  $9421  7F        .db $7F
  $9422  FE D3 99  INC $99D3,X
  $9425  BC FC 7C  LDY $7CFC,X
  $9428  06 07     ASL $07
  $942A  03        .db $03
  $942B  21 70     AND ($70,X)
  $942D  78        SEI
  $942E  78        SEI
  $942F  38        SEC
  $9430  07        .db $07
  $9431  8D FB 77  STA $77FB
  $9434  8F        .db $8F
  $9435  FF        .db $FF
  $9436  FF        .db $FF
  $9437  FF        .db $FF
  $9438  05 03     ORA $03
  $943A  87        .db $87
  $943B  FE FC 70  INC $70FC,X
  $943E  00        BRK
  $943F  00        BRK
  $9440  DF        .db $DF
  $9441  9F        .db $9F
  $9442  BF        .db $BF
  $9443  3E 3E 1C  ROL $1C3E,X
  $9446  80        .db $80
  $9447  80        .db $80
  $9448  8E 06 1E  STX $1E06
  $944B  0C        .db $0C
  $944C  1C        .db $1C
  $944D  00        BRK
  $944E  00        BRK
  $944F  00        BRK
  $9450  78        SEI
  $9451  00        BRK
  $9452  00        BRK
  $9453  00        BRK
  $9454  00        BRK
  $9455  00        BRK
  $9456  00        BRK
  $9457  00        BRK
  $9458  00        BRK
  $9459  00        BRK
  $945A  00        BRK
  $945B  00        BRK
  $945C  00        BRK
  $945D  00        BRK
  $945E  00        BRK
  $945F  00        BRK
  $9460  7C        .db $7C
  $9461  7C        .db $7C
  $9462  7E 3F 1F  ROR $1F3F,X
  $9465  0F        .db $0F
  $9466  01 00     ORA ($00,X)
  $9468  03        .db $03
  $9469  03        .db $03
  $946A  03        .db $03
  $946B  0B        .db $0B
  $946C  05 01     ORA $01
  $946E  00        BRK
  $946F  00        BRK
  $9470  C0 C0     CPY #$C0
  $9472  E0 E0     CPX #$E0
  $9474  E0 E0     CPX #$E0
  $9476  C0 00     CPY #$00
  $9478  80        .db $80
  $9479  80        .db $80
  $947A  C0 C0     CPY #$C0
  $947C  C0 C0     CPY #$C0
  $947E  00        BRK
  $947F  00        BRK
  $9480  80        .db $80
  $9481  80        .db $80
  $9482  00        BRK
  $9483  80        .db $80
  $9484  70 7C     BVS $9502
  $9486  7E FF 00  ROR $00FF,X
  $9489  00        BRK
  $948A  00        BRK
  $948B  00        BRK
  $948C  80        .db $80
  $948D  A0 A0     LDY #$A0
  $948F  60        RTS
  $9490  3F        .db $3F
  $9491  7F        .db $7F
  $9492  7F        .db $7F
  $9493  FE D3 99  INC $99D3,X
  $9496  BD FF 0D  LDA $0DFF,X
  $9499  06 07     ASL $07
  $949B  03        .db $03
  $949C  21 70     AND ($70,X)
  $949E  78        SEI
  $949F  78        SEI
  $94A0  07        .db $07
  $94A1  07        .db $07
  $94A2  8D FB 77  STA $77FB
  $94A5  8F        .db $8F
  $94A6  FF        .db $FF
  $94A7  FF        .db $FF
  $94A8  04        .db $04
  $94A9  05 03     ORA $03
  $94AB  87        .db $87
  $94AC  FE FC 18  INC $18FC,X
  $94AF  00        BRK
  $94B0  FF        .db $FF
  $94B1  DF        .db $DF
  $94B2  9F        .db $9F
  $94B3  BF        .db $BF
  $94B4  3E BE 9C  ROL $9CBE,X
  $94B7  C0 86     CPY #$86
  $94B9  8E 06 1E  STX $1E06
  $94BC  0C        .db $0C
  $94BD  1C        .db $1C
  $94BE  00        BRK
  $94BF  00        BRK
  $94C0  7C        .db $7C
  $94C1  7C        .db $7C
  $94C2  06 03     ASL $03
  $94C4  03        .db $03
  $94C5  07        .db $07
  $94C6  07        .db $07
  $94C7  03        .db $03
  $94C8  3B        .db $3B
  $94C9  03        .db $03
  $94CA  03        .db $03
  $94CB  01 01     ORA ($01,X)
  $94CD  03        .db $03
  $94CE  03        .db $03
  $94CF  00        BRK
  $94D0  E7        .db $E7
  $94D1  C1 E0     CMP ($E0,X)
  $94D3  E0 E0     CPX #$E0
  $94D5  E0 C0     CPX #$C0
  $94D7  80        .db $80
  $94D8  00        BRK
  $94D9  80        .db $80
  $94DA  C0 C0     CPY #$C0
  $94DC  C0 C0     CPY #$C0
  $94DE  80        .db $80
  $94DF  00        BRK
  $94E0  E0 D0     CPX #$D0
  $94E2  C8        INY
  $94E3  7C        .db $7C
  $94E4  7C        .db $7C
  $94E5  3C        .db $3C
  $94E6  00        BRK
  $94E7  00        BRK
  $94E8  00        BRK
  $94E9  20 70 38  JSR $3870
  $94EC  38        SEC
  $94ED  00        BRK
  $94EE  00        BRK
  $94EF  00        BRK
  $94F0  3F        .db $3F
  $94F1  7F        .db $7F
  $94F2  7F        .db $7F
  $94F3  FE D3 99  INC $99D3,X
  $94F6  BC FC 0D  LDY $0DFC,X
  $94F9  06 07     ASL $07
  $94FB  03        .db $03
  $94FC  21 70     AND ($70,X)
  $94FE  78        SEI
  $94FF  78        SEI
  $9500  07        .db $07
  $9501  07        .db $07

L_9502:
  $9502  8D FB 77  STA $77FB
  $9505  8F        .db $8F
  $9506  FF        .db $FF
  $9507  FE 04 05  INC $0504,X
  $950A  03        .db $03
  $950B  87        .db $87
  $950C  FE F0 60  INC $60F0,X
  $950F  00        BRK
  $9510  FF        .db $FF
  $9511  DF        .db $DF
  $9512  9F        .db $9F
  $9513  BF        .db $BF
  $9514  3E 3E 1C  ROL $1C3E,X
  $9517  00        BRK
  $9518  86 8E     STX $8E
  $951A  06 1E     ASL $1E
  $951C  0C        .db $0C
  $951D  1C        .db $1C
  $951E  00        BRK
  $951F  00        BRK
  $9520  7C        .db $7C
  $9521  79 01 01  ADC $0101,Y
  $9524  00        BRK
  $9525  00        BRK
  $9526  00        BRK
  $9527  00        BRK
  $9528  38        SEC
  $9529  00        BRK
  $952A  00        BRK
  $952B  00        BRK
  $952C  00        BRK
  $952D  00        BRK
  $952E  00        BRK
  $952F  00        BRK

L_9530:
  $9530  FF        .db $FF
  $9531  3F        .db $3F
  $9532  37        .db $37
  $9533  BB        .db $BB
  $9534  F9 F8 F0  SBC $F0F8,Y
  $9537  E0 00     CPX #$00
  $9539  C1 E1     CMP ($E1,X)
  $953B  F1 70     SBC ($70),Y
  $953D  70 60     BVS $959F
  $953F  00        BRK
  $9540  00        BRK
  $9541  80        .db $80
  $9542  C0 C0     CPY #$C0
  $9544  C0 C0     CPY #$C0
  $9546  00        BRK
  $9547  00        BRK
  $9548  00        BRK
  $9549  00        BRK
  $954A  80        .db $80
  $954B  80        .db $80
  $954C  80        .db $80
  $954D  00        BRK
  $954E  00        BRK
  $954F  00        BRK
  $9550  01 01     ORA ($01,X)
  $9552  3C        .db $3C
  $9553  46 FF     LSR $FF
  $9555  FF        .db $FF
  $9556  7F        .db $7F
  $9557  07        .db $07
  $9558  00        BRK
  $9559  00        BRK
  $955A  00        BRK
  $955B  38        SEC
  $955C  70 71     BVS $95CF
  $955E  01 01     ORA ($01,X)
  $9560  1E 3E BC  ASL $BC3E,X
  $9563  99 82 C4  STA $C482,Y
  $9566  AC AD 80  LDY $80AD
  $9569  DF        .db $DF
  $956A  7F        .db $7F
  $956B  7E 7C 38  ROR $387C,X
  $956E  10 01     BPL $9571
  $9570  40        RTI

L_9571:
  $9571  40        RTI
  $9572  80        .db $80
  $9573  C0 A0     CPY #$A0
  $9575  B8        CLV
  $9576  BE FF 80  LDX $80FF,Y
  $9579  80        .db $80
  $957A  00        BRK
  $957B  80        .db $80
  $957C  C0 C0     CPY #$C0
  $957E  D0 B0     BNE $9530
  $9580  0F        .db $0F
  $9581  07        .db $07
  $9582  06 06     ASL $06
  $9584  03        .db $03
  $9585  0F        .db $0F
  $9586  1F        .db $1F
  $9587  23        .db $23
  $9588  05 02     ORA $02
  $958A  03        .db $03
  $958B  01 00     ORA ($00,X)
  $958D  00        BRK
  $958E  00        BRK
  $958F  1C        .db $1C
  $9590  07        .db $07
  $9591  07        .db $07
  $9592  8D FB 67  STA $67FB
  $9595  9E        .db $9E
  $9596  FE FE 04  INC $04FE,X
  $9599  05 03     ORA $03
  $959B  87        .db $87
  $959C  FE 7C 30  INC $307C,X

L_959F:
  $959F  00        BRK
  $95A0  FE FF DF  INC $DFFF,X
  $95A3  9F        .db $9F
  $95A4  3F        .db $3F
  $95A5  3E 3E 1C  ROL $1C3E,X
  $95A8  C0 86     CPY #$86
  $95AA  8E 0E 1E  STX $1E0E
  $95AD  0C        .db $0C
  $95AE  1C        .db $1C
  $95AF  00        BRK

L_95B0:
  $95B0  23        .db $23
  $95B1  17        .db $17
  $95B2  1F        .db $1F
  $95B3  1F        .db $1F
  $95B4  1F        .db $1F
  $95B5  1F        .db $1F
  $95B6  1E 0C 1E  ASL $1E0C,X
  $95B9  0F        .db $0F
  $95BA  0F        .db $0F
  $95BB  07        .db $07
  $95BC  0E 0E 0C  ASL $0C0E
  $95BF  00        BRK
  $95C0  FE 3E 9E  INC $9E3E,X
  $95C3  9E        .db $9E
  $95C4  13        .db $13
  $95C5  11 13     ORA ($13),Y
  $95C7  0F        .db $0F
  $95C8  00        BRK
  $95C9  00        BRK
  $95CA  00        BRK
  $95CB  00        BRK
  $95CC  0C        .db $0C
  $95CD  0E 0E 06  ASL $060E
  $95D0  1F        .db $1F
  $95D1  1F        .db $1F
  $95D2  1F        .db $1F
  $95D3  1F        .db $1F
  $95D4  1F        .db $1F
  $95D5  0E 00 00  ASL $0000
  $95D8  0E 0E 0E  ASL $0E0E
  $95DB  0E 0E 00  ASL $000E
  $95DE  00        BRK
  $95DF  00        BRK
  $95E0  00        BRK
  $95E1  00        BRK
  $95E2  00        BRK
  $95E3  00        BRK
  $95E4  3C        .db $3C
  $95E5  42        .db $42
  $95E6  81 00     STA ($00,X)
  $95E8  00        BRK
  $95E9  18        CLC
  $95EA  3C        .db $3C
  $95EB  7E C3 81  ROR $81C3,X
  $95EE  00        BRK
  $95EF  00        BRK
  $95F0  40        RTI
  $95F1  20 10 10  JSR $1010
  $95F4  10 10     BPL $9606
  $95F6  20 40 30  JSR $3040
  $95F9  18        CLC
  $95FA  0C        .db $0C
  $95FB  0E 0E 0C  ASL $0C0E
  $95FE  18        CLC
  $95FF  30 00     BMI $9601

L_9601:
  $9601  00        BRK
  $9602  01 02     ORA ($02,X)
  $9604  02        .db $02
  $9605  07        .db $07

L_9606:
  $9606  0F        .db $0F
  $9607  0F        .db $0F
  $9608  00        BRK
  $9609  00        BRK
  $960A  00        BRK
  $960B  01 01     ORA ($01,X)
  $960D  01 07     ORA ($07,X)
  $960F  00        BRK
  $9610  3F        .db $3F
  $9611  FF        .db $FF
  $9612  7F        .db $7F
  $9613  38        SEC
  $9614  10 F0     BPL $9606
  $9616  F8        SED
  $9617  F8        SED
  $9618  00        BRK
  $9619  00        BRK
  $961A  80        .db $80
  $961B  C0 E0     CPY #$E0
  $961D  E0 F0     CPX #$F0
  $961F  00        BRK
  $9620  FF        .db $FF
  $9621  FF        .db $FF
  $9622  FF        .db $FF
  $9623  01 01     ORA ($01,X)
  $9625  01 03     ORA ($03,X)
  $9627  03        .db $03
  $9628  18        CLC
  $9629  F8        SED
  $962A  00        BRK
  $962B  00        BRK
  $962C  00        BRK

L_962D:
  $962D  00        BRK
  $962E  01 00     ORA ($00,X)
  $9630  DC        .db $DC
  $9631  E0 90     CPX #$90
  $9633  08        PHP
  $9634  C8        INY
  $9635  FC        .db $FC
  $9636  FE FE 00  INC $00FE,X
  $9639  00        BRK
  $963A  60        RTS
  $963B  F0 F0     BEQ $962D
  $963D  E0 FC     CPX #$FC
  $963F  00        BRK
  $9640  00        BRK
  $9641  01 02     ORA ($02,X)
  $9643  07        .db $07
  $9644  0D BF 4B  ORA $4BBF
  $9647  C9 00     CMP #$00
  $9649  00        BRK
  $964A  01 03     ORA ($03,X)
  $964C  06 04     ASL $04
  $964E  B3        .db $B3
  $964F  31 70     AND ($70),Y
  $9651  08        PHP
  $9652  0C        .db $0C
  $9653  FE FE FD  INC $FDFE,X

L_9656:
  $9656  ED CD 00  SBC $00CD
  $9659  F0 F0     BEQ $964B
  $965B  0C        .db $0C
  $965C  FC        .db $FC
  $965D  C6 96     DEC $96
  $965F  36 20     ROL $20,X
  $9661  F0 70     BEQ $96D3
  $9663  38        SEC
  $9664  10 F0     BPL $9656
  $9666  F8        SED
  $9667  F8        SED
  $9668  1F        .db $1F
  $9669  0F        .db $0F
  $966A  8F        .db $8F
  $966B  C0 E0     CPY #$E0
  $966D  E0 F0     CPX #$F0
  $966F  00        BRK
  $9670  00        BRK
  $9671  01 03     ORA ($03,X)
  $9673  01 01     ORA ($01,X)
  $9675  01 03     ORA ($03,X)
  $9677  03        .db $03
  $9678  FF        .db $FF
  $9679  FE FC 00  INC $00FC,X
  $967C  00        BRK
  $967D  00        BRK

L_967E:
  $967E  01 00     ORA ($00,X)
  $9680  1F        .db $1F
  $9681  0F        .db $0F
  $9682  0F        .db $0F
  $9683  00        BRK
  $9684  00        BRK
  $9685  E0 F0     CPX #$F0
  $9687  00        BRK
  $9688  20 F0 F0  JSR $F0F0
  $968B  F8        SED
  $968C  F0 F0     BEQ $967E
  $968E  F8        SED
  $968F  F8        SED
  $9690  FF        .db $FF
  $9691  FE F8 00  INC $00F8,X
  $9694  00        BRK
  $9695  00        BRK
  $9696  00        BRK
  $9697  00        BRK
  $9698  18        CLC
  $9699  F9 07 01  SBC $0107,Y
  $969C  01 01     ORA ($01,X)
  $969E  03        .db $03
  $969F  03        .db $03
  $96A0  00        BRK
  $96A1  00        BRK
  $96A2  00        BRK
  $96A3  00        BRK
  $96A4  00        BRK
  $96A5  00        BRK
  $96A6  00        BRK
  $96A7  07        .db $07
  $96A8  00        BRK
  $96A9  00        BRK
  $96AA  00        BRK
  $96AB  00        BRK
  $96AC  00        BRK
  $96AD  00        BRK
  $96AE  00        BRK
  $96AF  00        BRK
  $96B0  0F        .db $0F
  $96B1  15 78     ORA $78,X
  $96B3  4B        .db $4B
  $96B4  78        SEI
  $96B5  15 0F     ORA $0F,X
  $96B7  00        BRK
  $96B8  00        BRK
  $96B9  0A        ASL
  $96BA  07        .db $07
  $96BB  34        .db $34
  $96BC  07        .db $07
  $96BD  0A        ASL
  $96BE  00        BRK
  $96BF  00        BRK
  $96C0  80        .db $80
  $96C1  47        .db $47
  $96C2  38        SEC
  $96C3  BC 3E 7E  LDY $7E3E,X
  $96C6  81 01     STA ($01,X)
  $96C8  00        BRK
  $96C9  80        .db $80
  $96CA  C7        .db $C7
  $96CB  43        .db $43
  $96CC  C1 81     CMP ($81,X)
  $96CE  00        BRK
  $96CF  00        BRK
  $96D0  10 20     BPL $96F2
  $96D2  7F        .db $7F

L_96D3:
  $96D3  DF        .db $DF
  $96D4  FC        .db $FC
  $96D5  B8        CLV
  $96D6  90 80     BCC $9658
  $96D8  0C        .db $0C
  $96D9  10 30     BPL $970B
  $96DB  6F        .db $6F
  $96DC  4C 38 10  JMP $1038
  $96DF  00        BRK
  $96E0  80        .db $80
  $96E1  C0 E0     CPY #$E0
  $96E3  E0 D0     CPX #$D0
  $96E5  D0 DE     BNE $96C5
  $96E7  D1 00     CMP ($00),Y
  $96E9  00        BRK
  $96EA  C0 C0     CPY #$C0
  $96EC  60        RTS
  $96ED  60        RTS
  $96EE  60        RTS
  $96EF  6E 80 80  ROR $8080

L_96F2:
  $96F2  C1 C7     CMP ($C7,X)
  $96F4  FE B8 40  INC $40B8,X
  $96F7  7F        .db $7F
  $96F8  00        BRK
  $96F9  00        BRK
  $96FA  41 86     EOR ($86,X)
  $96FC  B9 47 3F  LDA $3F47,Y
  $96FF  00        BRK
  $9700  F0 F9     BEQ $96FB
  $9702  FF        .db $FF
  $9703  BF        .db $BF
  $9704  13        .db $13
  $9705  23        .db $23
  $9706  E7        .db $E7
  $9707  F7        .db $F7
  $9708  4F        .db $4F
  $9709  DE B8 50  DEC $50B8,X
  $970C  E1 C0     SBC ($C0,X)
  $970E  03        .db $03
  $970F  C3        .db $C3
  $9710  80        .db $80
  $9711  80        .db $80
  $9712  C0 E0     CPY #$E0
  $9714  E0 E0     CPX #$E0
  $9716  E0 C0     CPX #$C0
  $9718  00        BRK
  $9719  00        BRK
  $971A  00        BRK
  $971B  C0 C0     CPY #$C0
  $971D  C0 C0     CPY #$C0
  $971F  80        .db $80
  $9720  01 03     ORA ($03,X)
  $9722  04        .db $04
  $9723  08        PHP
  $9724  0F        .db $0F
  $9725  0F        .db $0F
  $9726  1F        .db $1F
  $9727  1F        .db $1F

L_9728:
  $9728  00        BRK
  $9729  00        BRK
  $972A  03        .db $03
  $972B  07        .db $07
  $972C  07        .db $07
  $972D  01 0F     ORA ($0F,X)
  $972F  00        BRK
  $9730  FF        .db $FF
  $9731  FF        .db $FF
  $9732  FF        .db $FF
  $9733  60        RTS
  $9734  C0 E0     CPY #$E0
  $9736  F0 F0     BEQ $9728
  $9738  1F        .db $1F
  $9739  0F        .db $0F
  $973A  00        BRK
  $973B  80        .db $80
  $973C  80        .db $80
  $973D  C0 E0     CPY #$E0
  $973F  00        BRK
  $9740  FF        .db $FF
  $9741  FF        .db $FF
  $9742  F9 10 0F  SBC $0F10,Y
  $9745  07        .db $07
  $9746  07        .db $07
  $9747  07        .db $07
  $9748  83        .db $83
  $9749  00        BRK
  $974A  06 0F     ASL $0F
  $974C  07        .db $07
  $974D  01 03     ORA ($03,X)
  $974F  00        BRK
  $9750  C0 80     CPY #$80
  $9752  00        BRK
  $9753  80        .db $80
  $9754  C0 F8     CPY #$F8
  $9756  FC        .db $FC
  $9757  FC        .db $FC
  $9758  80        .db $80
  $9759  00        BRK
  $975A  00        BRK
  $975B  00        BRK
  $975C  80        .db $80
  $975D  C0 F8     CPY #$F8
  $975F  00        BRK
  $9760  38        SEC
  $9761  3C        .db $3C
  $9762  1C        .db $1C
  $9763  17        .db $17
  $9764  0B        .db $0B
  $9765  04        .db $04
  $9766  0F        .db $0F

L_9767:
  $9767  1F        .db $1F
  $9768  10 14     BPL $977E
  $976A  08        PHP
  $976B  0B        .db $0B
  $976C  04        .db $04
  $976D  03        .db $03
  $976E  02        .db $02
  $976F  01 0F     ORA ($0F,X)
  $9771  1F        .db $1F
  $9772  7B        .db $7B
  $9773  E1 82     SBC ($82,X)
  $9775  0E FE FE  ASL $FEFE
  $9778  0D 1B 65  ORA $651B
  $977B  9E        .db $9E
  $977C  7C        .db $7C
  $977D  F0 04     BEQ $9783
  $977F  FC        .db $FC
  $9780  FC        .db $FC
  $9781  F8        SED
  $9782  E0 00     CPX #$00
  $9784  00        BRK
  $9785  00        BRK
  $9786  00        BRK
  $9787  00        BRK
  $9788  00        BRK
  $9789  00        BRK
  $978A  00        BRK
  $978B  00        BRK
  $978C  00        BRK
  $978D  00        BRK
  $978E  00        BRK
  $978F  00        BRK
  $9790  3F        .db $3F
  $9791  3F        .db $3F
  $9792  4E 43 43  LSR $4343
  $9795  27        .db $27
  $9796  3F        .db $3F
  $9797  3F        .db $3F
  $9798  00        BRK
  $9799  00        BRK
  $979A  30 3C     BMI $97D8
  $979C  3F        .db $3F
  $979D  1F        .db $1F
  $979E  07        .db $07
  $979F  1E FE FE  ASL $FEFE,X
  $97A2  3E 1E 9E  ROL $9E1E,X
  $97A5  92        .db $92
  $97A6  A2 22     LDX #$22
  $97A8  E0 00     CPX #$00
  $97AA  00        BRK
  $97AB  00        BRK
  $97AC  00        BRK
  $97AD  0C        .db $0C
  $97AE  1C        .db $1C
  $97AF  1C        .db $1C
  $97B0  3F        .db $3F
  $97B1  3E 1C 00  ROL $001C,X
  $97B4  00        BRK
  $97B5  00        BRK
  $97B6  00        BRK
  $97B7  00        BRK
  $97B8  1E 1C 00  ASL $001C,X
  $97BB  00        BRK
  $97BC  00        BRK
  $97BD  00        BRK
  $97BE  00        BRK
  $97BF  00        BRK
  $97C0  32        .db $32
  $97C1  7E 7C 7C  ROR $7C7C,X
  $97C4  7C        .db $7C
  $97C5  7C        .db $7C

L_97C6:
  $97C6  38        SEC
  $97C7  00        BRK
  $97C8  1C        .db $1C
  $97C9  3C        .db $3C
  $97CA  38        SEC
  $97CB  38        SEC
  $97CC  38        SEC
  $97CD  38        SEC
  $97CE  00        BRK
  $97CF  00        BRK
  $97D0  00        BRK
  $97D1  07        .db $07
  $97D2  0A        ASL
  $97D3  3C        .db $3C
  $97D4  25 3D     AND $3D
  $97D6  1A        .db $1A
  $97D7  07        .db $07

L_97D8:
  $97D8  00        BRK
  $97D9  00        BRK
  $97DA  05 03     ORA $03
  $97DC  1A        .db $1A
  $97DD  02        .db $02
  $97DE  05 00     ORA $00
  $97E0  20 7F DF  JSR $DF7F
  $97E3  FC        .db $FC
  $97E4  B8        CLV
  $97E5  90 80     BCC $9767
  $97E7  80        .db $80

L_97E8:
  $97E8  10 30     BPL $981A
  $97EA  6F        .db $6F
  $97EB  4C 38 10  JMP $1038
  $97EE  00        BRK
  $97EF  00        BRK
  $97F0  C0 E0     CPY #$E0
  $97F2  E0 D0     CPX #$D0
  $97F4  D0 D0     BNE $97C6
  $97F6  D0 F0     BNE $97E8
  $97F8  00        BRK
  $97F9  C0 C0     CPY #$C0
  $97FB  60        RTS
  $97FC  60        RTS
  $97FD  60        RTS
  $97FE  60        RTS
  $97FF  40        RTI
  $9800  00        BRK
  $9801  00        BRK
  $9802  00        BRK
  $9803  00        BRK
  $9804  18        CLC
  $9805  3C        .db $3C
  $9806  3A        .db $3A
  $9807  13        .db $13
  $9808  00        BRK
  $9809  00        BRK
  $980A  00        BRK
  $980B  00        BRK
  $980C  00        BRK
  $980D  18        CLC
  $980E  1C        .db $1C
  $980F  0C        .db $0C
  $9810  0F        .db $0F
  $9811  1F        .db $1F
  $9812  3F        .db $3F
  $9813  7F        .db $7F

L_9814:
  $9814  EE F5 DB  INC $DBF5
  $9817  DB        .db $DB
  $9818  00        BRK
  $9819  08        PHP

L_981A:
  $981A  1F        .db $1F
  $981B  00        BRK
  $981C  11 0A     ORA ($0A),Y
  $981E  24 24     BIT $24
  $9820  C0 E0     CPY #$E0
  $9822  F0 F0     BEQ $9814
  $9824  F8        SED
  $9825  B4 34     LDY $34,X
  $9827  34        .db $34
  $9828  00        BRK
  $9829  C0 E0     CPY #$E0
  $982B  20 10 58  JSR $5810
  $982E  D8        CLD
  $982F  D8        CLD
  $9830  38        SEC
  $9831  5C        .db $5C
  $9832  7F        .db $7F
  $9833  7F        .db $7F
  $9834  3E 1D 0F  ROL $0F1D,X
  $9837  01 00     ORA ($00,X)
  $9839  28        PLP
  $983A  0C        .db $0C
  $983B  3E 1F 0E  ROL $0E1F,X
  $983E  00        BRK
  $983F  00        BRK
  $9840  C8        INY
  $9841  F7        .db $F7
  $9842  40        RTI
  $9843  61 BF     ADC ($BF,X)
  $9845  2E 3C 98  ROL $983C
  $9848  37        .db $37
  $9849  08        PHP
  $984A  FF        .db $FF
  $984B  BF        .db $BF
  $984C  40        RTI
  $984D  D9 DB E7  CMP $E7DB,Y
  $9850  F8        SED
  $9851  E4 C2     CPX $C2
  $9853  82        .db $82
  $9854  33        .db $33
  $9855  1F        .db $1F
  $9856  1F        .db $1F
  $9857  7F        .db $7F
  $9858  00        BRK
  $9859  58        CLI
  $985A  BC 7C CE  LDY $CE7C,X
  $985D  E6 E6     INC $E6
  $985F  EE 01 01  INC $0101
  $9862  02        .db $02
  $9863  07        .db $07
  $9864  07        .db $07
  $9865  0F        .db $0F
  $9866  3F        .db $3F
  $9867  FF        .db $FF
  $9868  00        BRK
  $9869  00        BRK
  $986A  01 03     ORA ($03,X)
  $986C  03        .db $03
  $986D  01 00     ORA ($00,X)
  $986F  00        BRK
  $9870  FF        .db $FF
  $9871  7F        .db $7F
  $9872  1F        .db $1F
  $9873  20 E0 F0  JSR $F0E0
  $9876  F8        SED
  $9877  FC        .db $FC
  $9878  FF        .db $FF
  $9879  FF        .db $FF
  $987A  E0 C0     CPX #$C0
  $987C  C0 E0     CPY #$E0
  $987E  00        BRK
  $987F  00        BRK
  $9880  FF        .db $FF
  $9881  9E        .db $9E
  $9882  1C        .db $1C
  $9883  BE 7F 7F  LDX $7F7F,Y
  $9886  7F        .db $7F
  $9887  FF        .db $FF
  $9888  CE E0 F8  DEC $F8E0
  $988B  7C        .db $7C
  $988C  3E 38 00  ROL $0038,X
  $988F  00        BRK
  $9890  00        BRK
  $9891  00        BRK
  $9892  00        BRK
  $9893  00        BRK
  $9894  00        BRK
  $9895  80        .db $80
  $9896  E0 F0     CPX #$F0
  $9898  00        BRK
  $9899  00        BRK
  $989A  00        BRK
  $989B  00        BRK
  $989C  00        BRK

L_989D:
  $989D  00        BRK
  $989E  00        BRK
  $989F  00        BRK
  $98A0  00        BRK
  $98A1  00        BRK
  $98A2  00        BRK
  $98A3  00        BRK
  $98A4  0C        .db $0C
  $98A5  1E 3F 3F  ASL $3F3F,X
  $98A8  00        BRK

L_98A9:
  $98A9  00        BRK
  $98AA  00        BRK
  $98AB  00        BRK
  $98AC  00        BRK
  $98AD  0C        .db $0C
  $98AE  1E 1E 00  ASL $001E,X
  $98B1  00        BRK
  $98B2  60        RTS
  $98B3  F0 E8     BEQ $989D
  $98B5  4C 7E FF  JMP $FF7E
  $98B8  00        BRK
  $98B9  00        BRK
  $98BA  00        BRK
  $98BB  60        RTS
  $98BC  70 30     BVS $98EE
  $98BE  00        BRK
  $98BF  46 0F     LSR $0F
  $98C1  0F        .db $0F
  $98C2  0F        .db $0F
  $98C3  0F        .db $0F
  $98C4  05 05     ORA $05
  $98C6  04        .db $04
  $98C7  02        .db $02
  $98C8  07        .db $07
  $98C9  07        .db $07
  $98CA  06 06     ASL $06
  $98CC  02        .db $02
  $98CD  02        .db $02
  $98CE  03        .db $03
  $98CF  01 FF     ORA ($FF,X)
  $98D1  FF        .db $FF
  $98D2  DD EB B6  CMP $B6EB,X
  $98D5  B6 C8     LDX $C8,Y
  $98D7  F7        .db $F7
  $98D8  BF        .db $BF
  $98D9  00        BRK
  $98DA  22        .db $22
  $98DB  14        .db $14
  $98DC  49 49     EOR #$49
  $98DE  37        .db $37
  $98DF  08        PHP
  $98E0  E0 E0     CPX #$E0
  $98E2  F0 68     BEQ $994C
  $98E4  68        PLA
  $98E5  68        PLA
  $98E6  F8        SED
  $98E7  F0 C0     BEQ $98A9
  $98E9  40        RTI
  $98EA  20 B0 B0  JSR $B0B0
  $98ED  B0 00     BCS $98EF

L_98EF:
  $98EF  40        RTI
  $98F0  02        .db $02
  $98F1  01 00     ORA ($00,X)
  $98F3  00        BRK
  $98F4  00        BRK
  $98F5  00        BRK
  $98F6  00        BRK
  $98F7  00        BRK
  $98F8  01 00     ORA ($00,X)
  $98FA  00        BRK
  $98FB  00        BRK
  $98FC  00        BRK
  $98FD  00        BRK
  $98FE  00        BRK
  $98FF  00        BRK
  $9900  C0 61     CPY #$61
  $9902  BF        .db $BF
  $9903  BE AC BC  LDX $BCAC,Y
  $9906  D8        CLD
  $9907  FF        .db $FF
  $9908  7F        .db $7F
  $9909  BF        .db $BF
  $990A  40        RTI
  $990B  41 5B     EOR ($5B,X)
  $990D  5B        .db $5B
  $990E  67        .db $67
  $990F  7F        .db $7F
  $9910  C8        INY
  $9911  84 24     STY $24
  $9913  12        .db $12
  $9914  3E FE FC  ROL $FCFE,X
  $9917  F8        SED
  $9918  B0 78     BCS $9992
  $991A  D8        CLD
  $991B  EC CC 3C  CPX $3CCC
  $991E  78        SEI
  $991F  70 00     BVS $9921

L_9921:
  $9921  01 01     ORA ($01,X)
  $9923  03        .db $03
  $9924  03        .db $03
  $9925  07        .db $07
  $9926  1F        .db $1F
  $9927  7F        .db $7F
  $9928  00        BRK
  $9929  00        BRK
  $992A  00        BRK
  $992B  01 01     ORA ($01,X)
  $992D  00        BRK
  $992E  00        BRK
  $992F  00        BRK
  $9930  9F        .db $9F
  $9931  0F        .db $0F
  $9932  C9 D1     CMP #$D1
  $9934  F1 F1     SBC ($F1),Y
  $9936  F9 FD 7F  SBC $7FFD,Y
  $9939  F8        SED
  $993A  F0 E0     BEQ $991C
  $993C  E0 60     CPX #$60
  $993E  00        BRK
  $993F  00        BRK
  $9940  F8        SED
  $9941  18        CLC
  $9942  18        CLC
  $9943  BC FC FE  LDY $FEFC,X
  $9946  FF        .db $FF
  $9947  FF        .db $FF
  $9948  00        BRK
  $9949  E0 F0     CPX #$F0
  $994B  78        SEI

L_994C:
  $994C  78        SEI
  $994D  E0 00     CPX #$00
  $994F  00        BRK
  $9950  00        BRK
  $9951  00        BRK
  $9952  00        BRK
  $9953  00        BRK
  $9954  00        BRK
  $9955  00        BRK
  $9956  80        .db $80
  $9957  C0 00     CPY #$00
  $9959  00        BRK
  $995A  00        BRK
  $995B  00        BRK
  $995C  00        BRK
  $995D  00        BRK
  $995E  00        BRK
  $995F  00        BRK
  $9960  00        BRK
  $9961  00        BRK
  $9962  00        BRK
  $9963  00        BRK
  $9964  00        BRK
  $9965  18        CLC
  $9966  3C        .db $3C
  $9967  3A        .db $3A
  $9968  00        BRK
  $9969  00        BRK
  $996A  00        BRK
  $996B  00        BRK
  $996C  00        BRK
  $996D  00        BRK
  $996E  18        CLC
  $996F  1C        .db $1C
  $9970  00        BRK
  $9971  00        BRK
  $9972  01 03     ORA ($03,X)
  $9974  07        .db $07
  $9975  0E 0F ED  ASL $ED0F
  $9978  00        BRK
  $9979  00        BRK
  $997A  00        BRK
  $997B  01 00     ORA ($00,X)
  $997D  01 00     ORA ($00,X)
  $997F  02        .db $02
  $9980  98        TYA
  $9981  FC        .db $FC
  $9982  FE FF FF  INC $FFFF,X
  $9985  EF        .db $EF
  $9986  5B        .db $5B
  $9987  B3        .db $B3
  $9988  60        RTS
  $9989  00        BRK
  $998A  8C FE 02  STY $02FE
  $998D  11 A5     ORA ($A5),Y
  $998F  4D 00 00  EOR $0000

L_9992:
  $9992  00        BRK
  $9993  00        BRK
  $9994  00        BRK
  $9995  BC 7E 7F  LDY $7F7E,X
  $9998  00        BRK
  $9999  00        BRK
  $999A  00        BRK
  $999B  00        BRK
  $999C  00        BRK
  $999D  00        BRK
  $999E  BC BE 36  LDY $36BE,X
  $99A1  3E 3F 3E  ROL $3E3F,X
  $99A4  3E 3C 1F  ROL $1F3C,X
  $99A7  0C        .db $0C
  $99A8  08        PHP
  $99A9  14        .db $14
  $99AA  1C        .db $1C
  $99AB  1D 1F 1F  ORA $1F1F,X
  $99AE  0C        .db $0C
  $99AF  00        BRK
  $99B0  B6 C8     LDX $C8,Y
  $99B2  F7        .db $F7
  $99B3  C0 E1     CPY #$E1
  $99B5  3F        .db $3F
  $99B6  97        .db $97
  $99B7  9E        .db $9E
  $99B8  49 37     EOR #$37
  $99BA  08        PHP
  $99BB  7F        .db $7F
  $99BC  3F        .db $3F
  $99BD  C0 6C     CPY #$6C
  $99BF  6D 6F F7  ADC $F76F
  $99C2  E9 C0     SBC #$C0
  $99C4  90 10     BCC $99D6
  $99C6  10 30     BPL $99F8
  $99C8  B7        .db $B7
  $99C9  09 50     ORA #$50
  $99CB  B0 60     BCS $9A2D
  $99CD  E0 E0     CPX #$E0
  $99CF  E0 E0     CPX #$E0
  $99D1  C0 80     CPY #$80
  $99D3  00        BRK
  $99D4  00        BRK
  $99D5  00        BRK

L_99D6:
  $99D6  00        BRK
  $99D7  00        BRK
  $99D8  C0 80     CPY #$80
  $99DA  00        BRK
  $99DB  00        BRK
  $99DC  00        BRK
  $99DD  00        BRK
  $99DE  00        BRK
  $99DF  00        BRK
  $99E0  01 06     ORA ($06,X)
  $99E2  0F        .db $0F
  $99E3  0F        .db $0F
  $99E4  07        .db $07
  $99E5  0F        .db $0F
  $99E6  3F        .db $3F
  $99E7  FF        .db $FF
  $99E8  00        BRK
  $99E9  01 07     ORA ($07,X)
  $99EB  07        .db $07
  $99EC  03        .db $03
  $99ED  01 00     ORA ($00,X)
  $99EF  00        BRK

L_99F0:
  $99F0  CC 7F 3F  CPY $3F7F
  $99F3  9F        .db $9F
  $99F4  E0 F0     CPX #$F0
  $99F6  F0 F8     BEQ $99F0

L_99F8:
  $99F8  73        .db $73
  $99F9  FF        .db $FF
  $99FA  FF        .db $FF
  $99FB  E0 C0     CPX #$C0
  $99FD  C0 00     CPY #$00
  $99FF  00        BRK
  $9A00  EC C6 8F  CPX $8FC6
  $9A03  FF        .db $FF
  $9A04  3F        .db $3F
  $9A05  7F        .db $7F

L_9A06:
  $9A06  7F        .db $7F
  $9A07  FF        .db $FF
  $9A08  F0 FC     BEQ $9A06
  $9A0A  FE 1E 1C  INC $1C1E,X
  $9A0D  38        SEC
  $9A0E  00        BRK
  $9A0F  00        BRK
  $9A10  00        BRK
  $9A11  00        BRK
  $9A12  00        BRK
  $9A13  00        BRK
  $9A14  00        BRK
  $9A15  80        .db $80
  $9A16  E0 F0     CPX #$F0
  $9A18  00        BRK
  $9A19  00        BRK
  $9A1A  00        BRK
  $9A1B  00        BRK
  $9A1C  00        BRK
  $9A1D  00        BRK
  $9A1E  00        BRK
  $9A1F  00        BRK
  $9A20  00        BRK
  $9A21  00        BRK
  $9A22  00        BRK
  $9A23  30 78     BMI $9A9D
  $9A25  74        .db $74

L_9A26:
  $9A26  26 3F     ROL $3F
  $9A28  00        BRK
  $9A29  00        BRK
  $9A2A  00        BRK
  $9A2B  00        BRK
  $9A2C  30 38     BMI $9A66
  $9A2E  18        CLC
  $9A2F  00        BRK
  $9A30  00        BRK
  $9A31  00        BRK
  $9A32  01 03     ORA ($03,X)
  $9A34  03        .db $03
  $9A35  03        .db $03
  $9A36  07        .db $07
  $9A37  19 00 00  ORA $0000,Y
  $9A3A  00        BRK
  $9A3B  00        BRK
  $9A3C  00        BRK
  $9A3D  00        BRK
  $9A3E  00        BRK
  $9A3F  06 7F     ASL $7F
  $9A41  FF        .db $FF
  $9A42  FF        .db $FF
  $9A43  BB        .db $BB
  $9A44  D6 6C     DEC $6C,X
  $9A46  6C 91 23  JMP ($2391)
  $9A49  7F        .db $7F
  $9A4A  00        BRK
  $9A4B  44        .db $44
  $9A4C  29 93     AND #$93
  $9A4E  93        .db $93
  $9A4F  6E 80 C0  ROR $C080
  $9A52  C0 E0     CPY #$E0
  $9A54  D0 D0     BNE $9A26
  $9A56  DC        .db $DC
  $9A57  F3        .db $F3

L_9A58:
  $9A58  00        BRK
  $9A59  80        .db $80
  $9A5A  80        .db $80
  $9A5B  40        RTI
  $9A5C  60        RTS
  $9A5D  60        RTS
  $9A5E  60        RTS
  $9A5F  0C        .db $0C
  $9A60  38        SEC
  $9A61  7C        .db $7C
  $9A62  FF        .db $FF
  $9A63  FC        .db $FC
  $9A64  B8        CLV
  $9A65  70 00     BVS $9A67

L_9A67:
  $9A67  00        BRK
  $9A68  0F        .db $0F
  $9A69  3F        .db $3F
  $9A6A  7C        .db $7C
  $9A6B  38        SEC
  $9A6C  50 00     BVC $9A6E

L_9A6E:
  $9A6E  00        BRK

L_9A6F:
  $9A6F  00        BRK
  $9A70  F7        .db $F7
  $9A71  C0 E1     CPY #$E1
  $9A73  BF        .db $BF
  $9A74  B7        .db $B7
  $9A75  9E        .db $9E
  $9A76  4C A3 08  JMP $08A3
  $9A79  7F        .db $7F
  $9A7A  3F        .db $3F
  $9A7B  40        RTI
  $9A7C  4C 6D 33  JMP $336D
  $9A7F  7F        .db $7F
  $9A80  E0 E1     CPX #$E1
  $9A82  C7        .db $C7
  $9A83  89        .db $89
  $9A84  08        PHP
  $9A85  18        CLC
  $9A86  70 D0     BVS $9A58
  $9A88  5F        .db $5F
  $9A89  9F        .db $9F
  $9A8A  39 70 F0  AND $F070,Y
  $9A8D  F0 E0     BEQ $9A6F
  $9A8F  E0 E0     CPX #$E0
  $9A91  F0 F8     BEQ $9A8B
  $9A93  F8        SED
  $9A94  F8        SED
  $9A95  60        RTS
  $9A96  00        BRK
  $9A97  00        BRK
  $9A98  80        .db $80
  $9A99  E0 F0     CPX #$F0
  $9A9B  F0 40     BEQ $9ADD

L_9A9D:
  $9A9D  00        BRK
  $9A9E  00        BRK
  $9A9F  00        BRK
  $9AA0  4F        .db $4F
  $9AA1  87        .db $87
  $9AA2  E8        INX
  $9AA3  FC        .db $FC
  $9AA4  7C        .db $7C
  $9AA5  7C        .db $7C
  $9AA6  7C        .db $7C
  $9AA7  7C        .db $7C
  $9AA8  3F        .db $3F
  $9AA9  78        SEI
  $9AAA  70 70     BVS $9B1C
  $9AAC  38        SEC
  $9AAD  30 00     BMI $9AAF

L_9AAF:
  $9AAF  00        BRK
  $9AB0  C4 84     CPY $84
  $9AB2  7E 7E 7E  ROR $7E7E,X
  $9AB5  7C        .db $7C
  $9AB6  7C        .db $7C
  $9AB7  7C        .db $7C
  $9AB8  F8        SED
  $9AB9  78        SEI
  $9ABA  1C        .db $1C
  $9ABB  3C        .db $3C
  $9ABC  3C        .db $3C
  $9ABD  18        CLC
  $9ABE  00        BRK
  $9ABF  00        BRK
  $9AC0  7C        .db $7C
  $9AC1  F8        SED
  $9AC2  F8        SED
  $9AC3  F8        SED
  $9AC4  00        BRK
  $9AC5  00        BRK
  $9AC6  00        BRK
  $9AC7  00        BRK
  $9AC8  00        BRK
  $9AC9  00        BRK
  $9ACA  00        BRK
  $9ACB  00        BRK
  $9ACC  00        BRK
  $9ACD  00        BRK
  $9ACE  00        BRK
  $9ACF  00        BRK
  $9AD0  3E 3E 3E  ROL $3E3E,X
  $9AD3  1E 00 00  ASL $0000,X
  $9AD6  00        BRK
  $9AD7  00        BRK
  $9AD8  00        BRK
  $9AD9  00        BRK
  $9ADA  00        BRK
  $9ADB  00        BRK
  $9ADC  00        BRK

L_9ADD:
  $9ADD  00        BRK
  $9ADE  00        BRK
  $9ADF  00        BRK
  $9AE0  00        BRK
  $9AE1  00        BRK
  $9AE2  61 FB     ADC ($FB,X)
  $9AE4  FF        .db $FF
  $9AE5  FF        .db $FF

L_9AE6:
  $9AE6  7B        .db $7B
  $9AE7  39 00 00  AND $0000,Y
  $9AEA  00        BRK
  $9AEB  60        RTS
  $9AEC  78        SEI
  $9AED  78        SEI
  $9AEE  3C        .db $3C
  $9AEF  0E 80 C0  ASL $C080
  $9AF2  C0 E3     CPY #$E3
  $9AF4  D7        .db $D7
  $9AF5  DF        .db $DF
  $9AF6  D7        .db $D7
  $9AF7  F3        .db $F3
  $9AF8  00        BRK
  $9AF9  80        .db $80
  $9AFA  80        .db $80
  $9AFB  40        RTI
  $9AFC  63        .db $63
  $9AFD  67        .db $67
  $9AFE  6F        .db $6F
  $9AFF  0C        .db $0C
  $9B00  00        BRK
  $9B01  00        BRK
  $9B02  E0 F0     CPX #$F0
  $9B04  F0 E0     BEQ $9AE6
  $9B06  C0 00     CPY #$00
  $9B08  00        BRK
  $9B09  00        BRK
  $9B0A  00        BRK
  $9B0B  E0 80     CPX #$80
  $9B0D  C0 00     CPY #$00
  $9B0F  00        BRK
  $9B10  06 01     ASL $01
  $9B12  00        BRK
  $9B13  00        BRK
  $9B14  00        BRK
  $9B15  01 02     ORA ($02,X)
  $9B17  07        .db $07
  $9B18  01 00     ORA ($00,X)
  $9B1A  00        BRK
  $9B1B  00        BRK

L_9B1C:
  $9B1C  00        BRK
  $9B1D  00        BRK

L_9B1E:
  $9B1E  01 03     ORA ($03,X)
  $9B20  F7        .db $F7
  $9B21  C0 E1     CPY #$E1
  $9B23  BF        .db $BF
  $9B24  B7        .db $B7
  $9B25  9E        .db $9E
  $9B26  6C 9F 08  JMP ($089F)
  $9B29  7F        .db $7F
  $9B2A  3F        .db $3F
  $9B2B  40        RTI
  $9B2C  4C 6D B3  JMP $B36D

L_9B2F:
  $9B2F  FF        .db $FF
  $9B30  E2        .db $E2
  $9B31  E4 C8     CPX $C8
  $9B33  88        DEY
  $9B34  18        CLC
  $9B35  30 F8     BMI $9B2F
  $9B37  CC 5C 98  CPY $985C
  $9B3A  30 70     BMI $9BAC
  $9B3C  F0 E0     BEQ $9B1E
  $9B3E  C0 F8     CPY #$F8
  $9B40  1F        .db $1F
  $9B41  1F        .db $1F
  $9B42  0F        .db $0F
  $9B43  0F        .db $0F
  $9B44  1F        .db $1F
  $9B45  3F        .db $3F
  $9B46  7E FC 0F  ROR $0FFC,X
  $9B49  0E 07 06  ASL $0607
  $9B4C  00        BRK
  $9B4D  00        BRK
  $9B4E  00        BRK
  $9B4F  00        BRK
  $9B50  3C        .db $3C
  $9B51  FE 81 C3  INC $C381,X
  $9B54  81 00     STA ($00,X)
  $9B56  00        BRK
  $9B57  00        BRK
  $9B58  FF        .db $FF
  $9B59  01 00     ORA ($00,X)

L_9B5B:
  $9B5B  00        BRK
  $9B5C  00        BRK
  $9B5D  00        BRK
  $9B5E  00        BRK
  $9B5F  00        BRK
  $9B60  78        SEI
  $9B61  F8        SED
  $9B62  F8        SED
  $9B63  F8        SED
  $9B64  F8        SED
  $9B65  FC        .db $FC
  $9B66  7E 3F F0  ROR $F03F,X
  $9B69  70 F0     BVS $9B5B
  $9B6B  F0 40     BEQ $9BAD
  $9B6D  00        BRK
  $9B6E  00        BRK
  $9B6F  00        BRK
  $9B70  00        BRK
  $9B71  00        BRK
  $9B72  00        BRK
  $9B73  00        BRK
  $9B74  00        BRK
  $9B75  00        BRK
  $9B76  00        BRK
  $9B77  7F        .db $7F
  $9B78  00        BRK
  $9B79  00        BRK
  $9B7A  00        BRK
  $9B7B  00        BRK
  $9B7C  00        BRK
  $9B7D  00        BRK
  $9B7E  00        BRK
  $9B7F  00        BRK
  $9B80  F8        SED
  $9B81  F9 7F 1F  SBC $1F7F,Y
  $9B84  3F        .db $3F
  $9B85  77        .db $77
  $9B86  7A        .db $7A
  $9B87  6D 1F 1E  ADC $1E1F
  $9B8A  00        BRK
  $9B8B  0F        .db $0F
  $9B8C  00        BRK
  $9B8D  08        PHP
  $9B8E  05 12     ORA $12
  $9B90  C0 E0     CPY #$E0
  $9B92  FE FF FF  INC $FFFF,X
  $9B95  7F        .db $7F
  $9B96  DB        .db $DB
  $9B97  9B        .db $9B
  $9B98  00        BRK
  $9B99  00        BRK
  $9B9A  60        RTS
  $9B9B  F6 17     INC $17,X
  $9B9D  8B        .db $8B
  $9B9E  2D 6C 00  AND $006C
  $9BA1  00        BRK
  $9BA2  00        BRK
  $9BA3  00        BRK
  $9BA4  80        .db $80
  $9BA5  80        .db $80
  $9BA6  80        .db $80
  $9BA7  00        BRK
  $9BA8  00        BRK
  $9BA9  00        BRK
  $9BAA  00        BRK
  $9BAB  00        BRK

L_9BAC:
  $9BAC  00        BRK

L_9BAD:
  $9BAD  00        BRK
  $9BAE  00        BRK
  $9BAF  00        BRK
  $9BB0  6D 32 3D  ADC $3D32
  $9BB3  30 18     BMI $9BCD
  $9BB5  1F        .db $1F
  $9BB6  15 17     ORA $17,X
  $9BB8  12        .db $12
  $9BB9  0D 02 1F  ORA $1F02
  $9BBC  0F        .db $0F
  $9BBD  00        BRK
  $9BBE  0B        .db $0B
  $9BBF  0B        .db $0B
  $9BC0  9A        TXS
  $9BC1  3F        .db $3F
  $9BC2  F8        SED
  $9BC3  30 77     BMI $9C3C
  $9BC5  EF        .db $EF

L_9BC6:
  $9BC6  CF        .db $CF
  $9BC7  8F        .db $8F
  $9BC8  6C C0 17  JMP ($17C0)
  $9BCB  EF        .db $EF
  $9BCC  C9 17     CMP #$17
  $9BCE  37        .db $37
  $9BCF  77        .db $77
  $9BD0  00        BRK
  $9BD1  00        BRK
  $9BD2  C0 E0     CPY #$E0
  $9BD4  F0 F0     BEQ $9BC6
  $9BD6  E0 C0     CPX #$C0
  $9BD8  00        BRK
  $9BD9  00        BRK
  $9BDA  00        BRK
  $9BDB  C0 E0     CPY #$E0
  $9BDD  E0 C0     CPX #$C0
  $9BDF  00        BRK
  $9BE0  05 0C     ORA $0C
  $9BE2  1F        .db $1F
  $9BE3  1F        .db $1F
  $9BE4  0F        .db $0F
  $9BE5  0F        .db $0F
  $9BE6  3F        .db $3F
  $9BE7  FF        .db $FF
  $9BE8  02        .db $02
  $9BE9  03        .db $03
  $9BEA  0C        .db $0C
  $9BEB  0F        .db $0F
  $9BEC  07        .db $07
  $9BED  01 00     ORA ($00,X)

L_9BEF:
  $9BEF  00        BRK
  $9BF0  8F        .db $8F
  $9BF1  3F        .db $3F
  $9BF2  7E F9 E0  ROR $E0F9,X
  $9BF5  F0 F8     BEQ $9BEF
  $9BF7  FC        .db $FC
  $9BF8  7C        .db $7C
  $9BF9  FF        .db $FF
  $9BFA  B9 00 C0  LDA $C000,Y
  $9BFD  80        .db $80
  $9BFE  00        BRK
  $9BFF  00        BRK
  $9C00  E0 90     CPX #$90
  $9C02  18        CLC
  $9C03  3C        .db $3C
  $9C04  FE FF 7F  INC $7FFF,X
  $9C07  FF        .db $FF
  $9C08  40        RTI
  $9C09  E0 F0     CPX #$F0
  $9C0B  F8        SED
  $9C0C  7C        .db $7C
  $9C0D  78        SEI
  $9C0E  00        BRK
  $9C0F  00        BRK
  $9C10  00        BRK
  $9C11  00        BRK
  $9C12  00        BRK
  $9C13  00        BRK
  $9C14  00        BRK
  $9C15  80        .db $80
  $9C16  E0 F0     CPX #$F0
  $9C18  00        BRK
  $9C19  00        BRK
  $9C1A  00        BRK
  $9C1B  00        BRK
  $9C1C  00        BRK
  $9C1D  00        BRK
  $9C1E  00        BRK
  $9C1F  00        BRK
  $9C20  00        BRK
  $9C21  01 03     ORA ($03,X)
  $9C23  07        .db $07
  $9C24  0E 0F 0D  ASL $0D0F
  $9C27  8D 00 00  STA $0000
  $9C2A  01 00     ORA ($00,X)
  $9C2C  01 00     ORA ($00,X)
  $9C2E  02        .db $02
  $9C2F  02        .db $02
  $9C30  FC        .db $FC

L_9C31:
  $9C31  FE FF FF  INC $FFFF,X
  $9C34  EF        .db $EF
  $9C35  5B        .db $5B
  $9C36  B3        .db $B3
  $9C37  B3        .db $B3
  $9C38  00        BRK
  $9C39  8C FE 02  STY $02FE

L_9C3C:
  $9C3C  11 A5     ORA ($A5),Y
  $9C3E  4D 4D 00  EOR $004D
  $9C41  00        BRK
  $9C42  00        BRK
  $9C43  00        BRK
  $9C44  80        .db $80
  $9C45  40        RTI
  $9C46  40        RTI
  $9C47  40        RTI
  $9C48  00        BRK
  $9C49  00        BRK
  $9C4A  00        BRK
  $9C4B  00        BRK
  $9C4C  00        BRK
  $9C4D  80        .db $80
  $9C4E  80        .db $80
  $9C4F  80        .db $80
  $9C50  07        .db $07
  $9C51  0F        .db $0F
  $9C52  17        .db $17
  $9C53  17        .db $17
  $9C54  0F        .db $0F
  $9C55  07        .db $07
  $9C56  00        BRK
  $9C57  00        BRK
  $9C58  00        BRK
  $9C59  07        .db $07
  $9C5A  0B        .db $0B
  $9C5B  0B        .db $0B
  $9C5C  07        .db $07
  $9C5D  00        BRK
  $9C5E  00        BRK
  $9C5F  00        BRK
  $9C60  FE E7 E6  INC $E6E7,X
  $9C63  C3        .db $C3
  $9C64  FB        .db $FB
  $9C65  04        .db $04
  $9C66  02        .db $02
  $9C67  03        .db $03
  $9C68  81 D8     STA ($D8,X)
  $9C6A  FB        .db $FB
  $9C6B  FD 04 03  SBC $0304,X
  $9C6E  01 00     ORA ($00,X)
  $9C70  47        .db $47
  $9C71  BF        .db $BF
  $9C72  06 0E     ASL $0E
  $9C74  FD 5D 78  SBC $785D,X
  $9C77  70 B8     BVS $9C31
  $9C79  42        .db $42
  $9C7A  FD F9 02  SBC $02F9,X
  $9C7D  B2        .db $B2
  $9C7E  B7        .db $B7
  $9C7F  8F        .db $8F
  $9C80  E0 98     CPX #$98
  $9C82  1C        .db $1C
  $9C83  FE FE FC  INC $FCFE,X
  $9C86  F8        SED
  $9C87  E0 00     CPX #$00
  $9C89  60        RTS
  $9C8A  F8        SED
  $9C8B  3C        .db $3C
  $9C8C  FC        .db $FC
  $9C8D  F8        SED
  $9C8E  60        RTS
  $9C8F  00        BRK
  $9C90  06 0C     ASL $0C
  $9C92  0F        .db $0F
  $9C93  0F        .db $0F
  $9C94  07        .db $07
  $9C95  07        .db $07
  $9C96  0F        .db $0F
  $9C97  1F        .db $1F
  $9C98  01 07     ORA ($07,X)
  $9C9A  07        .db $07
  $9C9B  07        .db $07
  $9C9C  03        .db $03
  $9C9D  03        .db $03
  $9C9E  00        BRK
  $9C9F  00        BRK
  $9CA0  83        .db $83
  $9CA1  7E 3F C0  ROR $C03F,X
  $9CA4  C0 E1     CPY #$E1
  $9CA6  C0 80     CPY #$80
  $9CA8  FF        .db $FF
  $9CA9  FF        .db $FF
  $9CAA  C0 00     CPY #$00
  $9CAC  80        .db $80
  $9CAD  00        BRK
  $9CAE  00        BRK
  $9CAF  00        BRK
  $9CB0  18        CLC
  $9CB1  1C        .db $1C
  $9CB2  3C        .db $3C
  $9CB3  FC        .db $FC
  $9CB4  FC        .db $FC
  $9CB5  FC        .db $FC
  $9CB6  FC        .db $FC
  $9CB7  7E E0 F8  ROR $F8E0,X
  $9CBA  F8        SED
  $9CBB  38        SEC
  $9CBC  78        SEI
  $9CBD  78        SEI
  $9CBE  20 00 3F  JSR $3F00
  $9CC1  7E 00 00  ROR $0000,X
  $9CC4  00        BRK
  $9CC5  00        BRK
  $9CC6  00        BRK
  $9CC7  00        BRK
  $9CC8  00        BRK
  $9CC9  00        BRK
  $9CCA  00        BRK
  $9CCB  00        BRK
  $9CCC  00        BRK
  $9CCD  00        BRK
  $9CCE  00        BRK
  $9CCF  00        BRK
  $9CD0  70 4F     BVS $9D21
  $9CD2  87        .db $87
  $9CD3  E8        INX
  $9CD4  FC        .db $FC
  $9CD5  7C        .db $7C
  $9CD6  7C        .db $7C
  $9CD7  7C        .db $7C
  $9CD8  3F        .db $3F
  $9CD9  3F        .db $3F
  $9CDA  78        SEI
  $9CDB  70 70     BVS $9D4D
  $9CDD  38        SEC
  $9CDE  30 00     BMI $9CE0

L_9CE0:
  $9CE0  E8        INX
  $9CE1  C4 84     CPY $84
  $9CE3  7E 7E 7E  ROR $7E7E,X
  $9CE6  7C        .db $7C
  $9CE7  7C        .db $7C
  $9CE8  F0 F8     BEQ $9CE2
  $9CEA  78        SEI
  $9CEB  1C        .db $1C
  $9CEC  3C        .db $3C
  $9CED  3C        .db $3C
  $9CEE  18        CLC
  $9CEF  00        BRK
  $9CF0  7C        .db $7C
  $9CF1  7C        .db $7C
  $9CF2  F8        SED
  $9CF3  F8        SED
  $9CF4  F8        SED
  $9CF5  00        BRK
  $9CF6  00        BRK
  $9CF7  00        BRK
  $9CF8  00        BRK
  $9CF9  00        BRK
  $9CFA  00        BRK
  $9CFB  00        BRK
  $9CFC  00        BRK
  $9CFD  00        BRK
  $9CFE  00        BRK
  $9CFF  00        BRK
  $9D00  7C        .db $7C
  $9D01  3E 3E 3E  ROL $3E3E,X
  $9D04  1E 00 00  ASL $0000,X
  $9D07  00        BRK
  $9D08  00        BRK
  $9D09  00        BRK
  $9D0A  00        BRK
  $9D0B  00        BRK
  $9D0C  00        BRK
  $9D0D  00        BRK
  $9D0E  00        BRK
  $9D0F  00        BRK
  $9D10  30 48     BMI $9D5A
  $9D12  84 84     STY $84
  $9D14  48        PHA
  $9D15  30 00     BMI $9D17

L_9D17:
  $9D17  00        BRK
  $9D18  02        .db $02
  $9D19  30 78     BMI $9D93
  $9D1B  7A        .db $7A
  $9D1C  30 07     BMI $9D25
  $9D1E  00        BRK
  $9D1F  00        BRK
  $9D20  00        BRK

L_9D21:
  $9D21  00        BRK
  $9D22  00        BRK
  $9D23  00        BRK
  $9D24  00        BRK

L_9D25:
  $9D25  00        BRK
  $9D26  00        BRK
  $9D27  00        BRK
  $9D28  00        BRK
  $9D29  00        BRK
  $9D2A  90 04     BCC $9D30
  $9D2C  51 02     EOR ($02),Y
  $9D2E  80        .db $80
  $9D2F  00        BRK

L_9D30:
  $9D30  00        BRK
  $9D31  30 48     BMI $9D7B
  $9D33  84 80     STY $80
  $9D35  48        PHA
  $9D36  20 00 00  JSR $0000
  $9D39  0C        .db $0C
  $9D3A  30 79     BMI $9DB5
  $9D3C  7E 30 1C  ROR $1C30,X
  $9D3F  00        BRK
  $9D40  00        BRK
  $9D41  00        BRK
  $9D42  00        BRK
  $9D43  00        BRK
  $9D44  00        BRK
  $9D45  00        BRK
  $9D46  00        BRK
  $9D47  00        BRK
  $9D48  00        BRK
  $9D49  40        RTI
  $9D4A  00        BRK
  $9D4B  40        RTI
  $9D4C  00        BRK

L_9D4D:
  $9D4D  20 00 00  JSR $0000
  $9D50  00        BRK
  $9D51  00        BRK
  $9D52  30 48     BMI $9D9C
  $9D54  84 84     STY $84
  $9D56  48        PHA
  $9D57  30 01     BMI $9D5A
  $9D59  00        BRK

L_9D5A:
  $9D5A  0A        ASL
  $9D5B  30 78     BMI $9DD5
  $9D5D  78        SEI
  $9D5E  34        .db $34
  $9D5F  00        BRK
  $9D60  00        BRK
  $9D61  00        BRK
  $9D62  00        BRK
  $9D63  00        BRK
  $9D64  00        BRK
  $9D65  00        BRK
  $9D66  00        BRK
  $9D67  00        BRK
  $9D68  00        BRK
  $9D69  00        BRK
  $9D6A  04        .db $04
  $9D6B  10 00     BPL $9D6D

L_9D6D:
  $9D6D  90 00     BCC $9D6F

L_9D6F:
  $9D6F  00        BRK
  $9D70  00        BRK
  $9D71  00        BRK
  $9D72  00        BRK
  $9D73  00        BRK
  $9D74  00        BRK
  $9D75  00        BRK
  $9D76  00        BRK
  $9D77  00        BRK
  $9D78  07        .db $07
  $9D79  18        CLC
  $9D7A  20 47 4F  JSR $4F47
  $9D7D  9E        .db $9E
  $9D7E  9C        .db $9C
  $9D7F  98        TYA
  $9D80  00        BRK
  $9D81  00        BRK
  $9D82  00        BRK
  $9D83  00        BRK
  $9D84  00        BRK
  $9D85  00        BRK
  $9D86  00        BRK
  $9D87  00        BRK
  $9D88  E0 18     CPX #$18
  $9D8A  04        .db $04
  $9D8B  02        .db $02
  $9D8C  02        .db $02
  $9D8D  01 01     ORA ($01,X)
  $9D8F  01 00     ORA ($00,X)
  $9D91  00        BRK
  $9D92  00        BRK

L_9D93:
  $9D93  00        BRK
  $9D94  00        BRK
  $9D95  00        BRK
  $9D96  00        BRK
  $9D97  00        BRK
  $9D98  00        BRK
  $9D99  07        .db $07
  $9D9A  18        CLC
  $9D9B  30 27     BMI $9DC4
  $9D9D  4F        .db $4F
  $9D9E  4E 4C 00  LSR $004C
  $9DA1  00        BRK
  $9DA2  00        BRK
  $9DA3  00        BRK
  $9DA4  00        BRK
  $9DA5  00        BRK
  $9DA6  00        BRK
  $9DA7  00        BRK
  $9DA8  00        BRK
  $9DA9  E0 18     CPX #$18
  $9DAB  0C        .db $0C
  $9DAC  04        .db $04
  $9DAD  02        .db $02
  $9DAE  02        .db $02
  $9DAF  02        .db $02
  $9DB0  00        BRK
  $9DB1  00        BRK
  $9DB2  00        BRK
  $9DB3  00        BRK
  $9DB4  10 30     BPL $9DE6
  $9DB6  38        SEC
  $9DB7  6C 07 07  JMP ($0707)
  $9DBA  0F        .db $0F
  $9DBB  0F        .db $0F
  $9DBC  17        .db $17
  $9DBD  37        .db $37
  $9DBE  3A        .db $3A
  $9DBF  7C        .db $7C
  $9DC0  00        BRK
  $9DC1  00        BRK
  $9DC2  00        BRK
  $9DC3  00        BRK

L_9DC4:
  $9DC4  00        BRK
  $9DC5  00        BRK
  $9DC6  00        BRK
  $9DC7  00        BRK
  $9DC8  FF        .db $FF
  $9DC9  FF        .db $FF
  $9DCA  FF        .db $FF
  $9DCB  7F        .db $7F
  $9DCC  7F        .db $7F
  $9DCD  7F        .db $7F
  $9DCE  7F        .db $7F
  $9DCF  3F        .db $3F
  $9DD0  4E 5E 7E  LSR $7E5E
  $9DD3  BC BE F6  LDY $F6BE,X
  $9DD6  72        .db $72
  $9DD7  3C        .db $3C
  $9DD8  7E 7E 7E  ROR $7E7E,X
  $9DDB  FC        .db $FC
  $9DDC  FE F6 72  INC $72F6,X
  $9DDF  3D 40 E0  AND $E040,X
  $9DE2  FF        .db $FF
  $9DE3  7F        .db $7F
  $9DE4  1F        .db $1F
  $9DE5  0F        .db $0F

L_9DE6:
  $9DE6  03        .db $03
  $9DE7  00        BRK
  $9DE8  4F        .db $4F
  $9DE9  E0 FF     CPX #$FF
  $9DEB  7F        .db $7F
  $9DEC  9F        .db $9F
  $9DED  EF        .db $EF
  $9DEE  F3        .db $F3
  $9DEF  F8        SED
  $9DF0  00        BRK
  $9DF1  00        BRK
  $9DF2  00        BRK
  $9DF3  00        BRK
  $9DF4  01 01     ORA ($01,X)
  $9DF6  03        .db $03
  $9DF7  02        .db $02
  $9DF8  01 01     ORA ($01,X)
  $9DFA  01 00     ORA ($00,X)
  $9DFC  01 01     ORA ($01,X)
  $9DFE  03        .db $03
  $9DFF  03        .db $03
  $9E00  80        .db $80
  $9E01  C1 C7     CMP ($C7,X)
  $9E03  FE 7B 67  INC $677B,X
  $9E06  7F        .db $7F
  $9E07  FF        .db $FF
  $9E08  00        BRK
  $9E09  41 06     EOR ($06,X)
  $9E0B  79 24 1B  ADC $1B24,Y
  $9E0E  07        .db $07
  $9E0F  07        .db $07
  $9E10  F8        SED
  $9E11  E4 C2     CPX $C2
  $9E13  C2        .db $C2
  $9E14  E2        .db $E2
  $9E15  FC        .db $FC
  $9E16  F8        SED
  $9E17  FC        .db $FC
  $9E18  C0 98     CPY #$98
  $9E1A  3C        .db $3C
  $9E1B  BC 1C 00  LDY $001C,X
  $9E1E  C0 E0     CPY #$E0
  $9E20  13        .db $13
  $9E21  13        .db $13
  $9E22  0B        .db $0B
  $9E23  0F        .db $0F
  $9E24  0F        .db $0F
  $9E25  0F        .db $0F
  $9E26  0F        .db $0F
  $9E27  06 0C     ASL $0C
  $9E29  0F        .db $0F
  $9E2A  07        .db $07
  $9E2B  01 07     ORA ($07,X)
  $9E2D  07        .db $07
  $9E2E  06 00     ASL $00
  $9E30  FF        .db $FF
  $9E31  FF        .db $FF
  $9E32  C0 E0     CPY #$E0
  $9E34  E0 C0     CPX #$C0
  $9E36  80        .db $80
  $9E37  00        BRK
  $9E38  1E 00 80  ASL $8000,X
  $9E3B  C0 C0     CPY #$C0
  $9E3D  80        .db $80
  $9E3E  00        BRK
  $9E3F  00        BRK
  $9E40  F0 F8     BEQ $9E3A
  $9E42  E4 66     CPX $66
  $9E44  3F        .db $3F
  $9E45  1F        .db $1F
  $9E46  0F        .db $0F
  $9E47  07        .db $07
  $9E48  00        BRK
  $9E49  00        BRK
  $9E4A  18        CLC
  $9E4B  1C        .db $1C
  $9E4C  0E 0E 06  ASL $060E
  $9E4F  00        BRK
  $9E50  00        BRK
  $9E51  00        BRK
  $9E52  00        BRK
  $9E53  00        BRK
  $9E54  00        BRK
  $9E55  1C        .db $1C
  $9E56  42        .db $42
  $9E57  83        .db $83
  $9E58  00        BRK
  $9E59  00        BRK
  $9E5A  00        BRK
  $9E5B  00        BRK
  $9E5C  00        BRK
  $9E5D  00        BRK
  $9E5E  30 40     BMI $9EA0
  $9E60  03        .db $03
  $9E61  06 07     ASL $07
  $9E63  05 04     ORA $04
  $9E65  04        .db $04
  $9E66  04        .db $04
  $9E67  0C        .db $0C
  $9E68  01 03     ORA ($03,X)
  $9E6A  02        .db $02
  $9E6B  01 00     ORA ($00,X)
  $9E6D  00        BRK
  $9E6E  00        BRK
  $9E6F  00        BRK
  $9E70  FF        .db $FF
  $9E71  FF        .db $FF
  $9E72  E6 C6     INC $C6
  $9E74  86 06     STX $06
  $9E76  07        .db $07
  $9E77  07        .db $07
  $9E78  86 7E     STX $7E
  $9E7A  63        .db $63
  $9E7B  C3        .db $C3
  $9E7C  83        .db $83
  $9E7D  03        .db $03
  $9E7E  02        .db $02
  $9E7F  06 00     ASL $00
  $9E81  00        BRK
  $9E82  80        .db $80
  $9E83  80        .db $80
  $9E84  F8        SED
  $9E85  BC BC FC  LDY $FCBC,X
  $9E88  00        BRK
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  00        BRK
  $9E8C  00        BRK
  $9E8D  40        RTI
  $9E8E  40        RTI
  $9E8F  88        DEY
  $9E90  01 02     ORA ($02,X)
  $9E92  0F        .db $0F
  $9E93  09 0F     ORA #$0F
  $9E95  06 01     ASL $01
  $9E97  00        BRK
  $9E98  00        BRK
  $9E99  01 00     ORA ($00,X)
  $9E9B  06 00     ASL $00
  $9E9D  01 00     ORA ($00,X)
  $9E9F  00        BRK

L_9EA0:
  $9EA0  FA        .db $FA
  $9EA1  BA        TSX
  $9EA2  1D 7D 0E  ORA $0E7D,X
  $9EA5  B3        .db $B3
  $9EA6  E1 00     SBC ($00,X)
  $9EA8  06 44     ASL $44
  $9EAA  E7        .db $E7
  $9EAB  82        .db $82
  $9EAC  F1 40     SBC ($40),Y
  $9EAE  00        BRK
  $9EAF  00        BRK
  $9EB0  0F        .db $0F
  $9EB1  3F        .db $3F
  $9EB2  F1 C3     SBC ($C3),Y
  $9EB4  0E FF FF  ASL $FFFF
  $9EB7  FF        .db $FF
  $9EB8  0D 33 CF  ORA $CF33
  $9EBB  3C        .db $3C
  $9EBC  F0 00     BEQ $9EBE

L_9EBE:
  $9EBE  00        BRK
  $9EBF  00        BRK
  $9EC0  FC        .db $FC
  $9EC1  FC        .db $FC
  $9EC2  FC        .db $FC
  $9EC3  7C        .db $7C
  $9EC4  38        SEC
  $9EC5  00        BRK
  $9EC6  00        BRK
  $9EC7  00        BRK
  $9EC8  98        TYA
  $9EC9  98        TYA
  $9ECA  38        SEC
  $9ECB  38        SEC
  $9ECC  00        BRK
  $9ECD  00        BRK
  $9ECE  00        BRK
  $9ECF  00        BRK
  $9ED0  FE 7F 7D  INC $7D7F,X
  $9ED3  31 09     AND ($09),Y
  $9ED5  07        .db $07
  $9ED6  07        .db $07
  $9ED7  03        .db $03
  $9ED8  00        BRK
  $9ED9  00        BRK
  $9EDA  02        .db $02
  $9EDB  0F        .db $0F
  $9EDC  07        .db $07
  $9EDD  03        .db $03
  $9EDE  03        .db $03
  $9EDF  00        BRK
  $9EE0  00        BRK
  $9EE1  00        BRK
  $9EE2  80        .db $80
  $9EE3  C0 C0     CPY #$C0
  $9EE5  C0 C0     CPY #$C0
  $9EE7  80        .db $80
  $9EE8  00        BRK
  $9EE9  00        BRK
  $9EEA  00        BRK
  $9EEB  80        .db $80
  $9EEC  80        .db $80
  $9EED  80        .db $80
  $9EEE  80        .db $80
  $9EEF  00        BRK
  $9EF0  FA        .db $FA
  $9EF1  BA        TSX
  $9EF2  1D 7D 0E  ORA $0E7D,X
  $9EF5  BF        .db $BF
  $9EF6  F7        .db $F7
  $9EF7  23        .db $23
  $9EF8  06 44     ASL $44
  $9EFA  E7        .db $E7
  $9EFB  82        .db $82
  $9EFC  F1 40     SBC ($40),Y
  $9EFE  08        PHP
  $9EFF  1C        .db $1C
  $9F00  0F        .db $0F
  $9F01  3F        .db $3F
  $9F02  F1 C3     SBC ($C3),Y
  $9F04  0F        .db $0F
  $9F05  FF        .db $FF
  $9F06  FF        .db $FF
  $9F07  FE 0D 33  INC $330D,X
  $9F0A  CF        .db $CF
  $9F0B  3C        .db $3C
  $9F0C  F0 02     BEQ $9F10
  $9F0E  86 7C     STX $7C

L_9F10:
  $9F10  27        .db $27
  $9F11  3F        .db $3F
  $9F12  3F        .db $3F
  $9F13  3E 7C 79  ROL $797C,X
  $9F16  33        .db $33
  $9F17  07        .db $07
  $9F18  1C        .db $1C
  $9F19  1C        .db $1C
  $9F1A  1E 1C 38  ASL $381C,X
  $9F1D  30 01     BMI $9F20

L_9F1F:
  $9F1F  03        .db $03

L_9F20:
  $9F20  FE 7E 7C  INC $7C7E,X
  $9F23  7C        .db $7C
  $9F24  F8        SED
  $9F25  C8        INY
  $9F26  88        DEY
  $9F27  90 44     BCC $9F6D
  $9F29  00        BRK
  $9F2A  00        BRK
  $9F2B  00        BRK
  $9F2C  00        BRK
  $9F2D  F0 F0     BEQ $9F1F
  $9F2F  E0 3F     CPX #$3F
  $9F31  3E 3E 1E  ROL $1E3E,X
  $9F34  0C        .db $0C
  $9F35  00        BRK
  $9F36  00        BRK
  $9F37  00        BRK
  $9F38  1E 1C 1C  ASL $1C1C,X
  $9F3B  0C        .db $0C
  $9F3C  00        BRK
  $9F3D  00        BRK
  $9F3E  00        BRK
  $9F3F  00        BRK
  $9F40  06 8C     ASL $8C
  $9F42  58        CLI
  $9F43  5A        .db $5A
  $9F44  FE FE 7C  INC $7CFE,X
  $9F47  70 00     BVS $9F49

L_9F49:
  $9F49  02        .db $02
  $9F4A  86 A6     STX $A6
  $9F4C  FE 86 7C  INC $7C86,X
  $9F4F  70 06     BVS $9F57
  $9F51  8C 58 5A  STY $5A58
  $9F54  FE FE 7C  INC $7CFE,X

L_9F57:
  $9F57  70 00     BVS $9F59

L_9F59:
  $9F59  02        .db $02
  $9F5A  86 A6     STX $A6
  $9F5C  FE C6 44  INC $44C6,X
  $9F5F  70 00     BVS $9F61

L_9F61:
  $9F61  00        BRK
  $9F62  00        BRK
  $9F63  00        BRK
  $9F64  00        BRK
  $9F65  00        BRK
  $9F66  00        BRK
  $9F67  00        BRK
  $9F68  10 10     BPL $9F7A
  $9F6A  10 38     BPL $9FA4
  $9F6C  FF        .db $FF

L_9F6D:
  $9F6D  38        SEC
  $9F6E  10 10     BPL $9F80
  $9F70  00        BRK
  $9F71  00        BRK
  $9F72  00        BRK
  $9F73  00        BRK
  $9F74  00        BRK
  $9F75  00        BRK
  $9F76  00        BRK
  $9F77  00        BRK
  $9F78  00        BRK
  $9F79  00        BRK

L_9F7A:
  $9F7A  00        BRK
  $9F7B  10 38     BPL $9FB5
  $9F7D  10 00     BPL $9F7F

L_9F7F:
  $9F7F  00        BRK

L_9F80:
  $9F80  00        BRK
  $9F81  00        BRK
  $9F82  00        BRK
  $9F83  00        BRK
  $9F84  00        BRK
  $9F85  00        BRK
  $9F86  00        BRK
  $9F87  00        BRK
  $9F88  00        BRK
  $9F89  10 10     BPL $9F9B
  $9F8B  10 10     BPL $9F9D
  $9F8D  10 10     BPL $9F9F
  $9F8F  00        BRK
  $9F90  00        BRK
  $9F91  00        BRK
  $9F92  00        BRK
  $9F93  00        BRK
  $9F94  00        BRK
  $9F95  C0 78     CPY #$78
  $9F97  FC        .db $FC
  $9F98  FE FE FE  INC $FEFE,X

L_9F9B:
  $9F9B  FC        .db $FC
  $9F9C  3C        .db $3C

L_9F9D:
  $9F9D  C0 F8     CPY #$F8

L_9F9F:
  $9F9F  FC        .db $FC
  $9FA0  02        .db $02
  $9FA1  03        .db $03
  $9FA2  07        .db $07
  $9FA3  05 05     ORA $05
  $9FA5  07        .db $07
  $9FA6  06 00     ASL $00
  $9FA8  03        .db $03
  $9FA9  03        .db $03
  $9FAA  07        .db $07
  $9FAB  07        .db $07
  $9FAC  07        .db $07
  $9FAD  07        .db $07
  $9FAE  07        .db $07
  $9FAF  00        BRK
  $9FB0  FC        .db $FC
  $9FB1  FC        .db $FC
  $9FB2  FC        .db $FC
  $9FB3  FC        .db $FC
  $9FB4  FC        .db $FC

L_9FB5:
  $9FB5  FC        .db $FC
  $9FB6  FC        .db $FC
  $9FB7  3C        .db $3C
  $9FB8  FC        .db $FC
  $9FB9  FC        .db $FC
  $9FBA  FC        .db $FC
  $9FBB  FC        .db $FC
  $9FBC  FC        .db $FC
  $9FBD  FC        .db $FC
  $9FBE  FC        .db $FC
  $9FBF  3C        .db $3C
  $9FC0  0F        .db $0F
  $9FC1  5C        .db $5C
  $9FC2  BB        .db $BB
  $9FC3  BF        .db $BF
  $9FC4  BF        .db $BF
  $9FC5  60        RTS
  $9FC6  1F        .db $1F
  $9FC7  01 0F     ORA ($0F,X)
  $9FC9  1F        .db $1F
  $9FCA  3F        .db $3F
  $9FCB  3F        .db $3F
  $9FCC  3F        .db $3F
  $9FCD  00        BRK
  $9FCE  00        BRK
  $9FCF  00        BRK
  $9FD0  CD FD FB  CMP $FBFD
  $9FD3  FB        .db $FB
  $9FD4  F7        .db $F7
  $9FD5  0F        .db $0F
  $9FD6  FF        .db $FF
  $9FD7  FF        .db $FF
  $9FD8  CC FC F8  CPY $F8FC
  $9FDB  F8        SED
  $9FDC  F0 00     BEQ $9FDE

L_9FDE:
  $9FDE  00        BRK
  $9FDF  00        BRK
  $9FE0  00        BRK
  $9FE1  00        BRK
  $9FE2  03        .db $03
  $9FE3  06 0C     ASL $0C
  $9FE5  1C        .db $1C
  $9FE6  1F        .db $1F
  $9FE7  37        .db $37
  $9FE8  00        BRK
  $9FE9  00        BRK
  $9FEA  00        BRK
  $9FEB  03        .db $03
  $9FEC  07        .db $07
  $9FED  0F        .db $0F
  $9FEE  0C        .db $0C
  $9FEF  1F        .db $1F
  $9FF0  3C        .db $3C
  $9FF1  C3        .db $C3
  $9FF2  CF        .db $CF
  $9FF3  3F        .db $3F
  $9FF4  1F        .db $1F
  $9FF5  7F        .db $7F
  $9FF6  FF        .db $FF
  $9FF7  FF        .db $FF
  $9FF8  00        BRK
  $9FF9  3C        .db $3C
  $9FFA  F3        .db $F3
  $9FFB  CF        .db $CF
  $9FFC  FF        .db $FF
  $9FFD  BF        .db $BF
  $9FFE  7F        .db $7F
  $9FFF  FF        .db $FF
  $A000  80        .db $80
  $A001  3F        .db $3F
  $A002  6A        ROR
  $A003  40        RTI
  $A004  60        RTS
  $A005  40        RTI
  $A006  63        .db $63
  $A007  43        .db $43
  $A008  FF        .db $FF
  $A009  C0 95     CPY #$95
  $A00B  BF        .db $BF
  $A00C  9F        .db $9F
  $A00D  B8        CLV
  $A00E  9B        .db $9B
  $A00F  BB        .db $BB
  $A010  63        .db $63
  $A011  43        .db $43
  $A012  60        RTS
  $A013  7F        .db $7F
  $A014  2A        ROL
  $A015  00        BRK
  $A016  00        BRK
  $A017  80        .db $80
  $A018  9B        .db $9B
  $A019  BB        .db $BB
  $A01A  9F        .db $9F
  $A01B  80        .db $80
  $A01C  D5 FF     CMP $FF,X
  $A01E  7F        .db $7F
  $A01F  80        .db $80
  $A020  00        BRK
  $A021  FF        .db $FF
  $A022  AA        TAX
  $A023  00        BRK
  $A024  00        BRK
  $A025  00        BRK
  $A026  FF        .db $FF
  $A027  FF        .db $FF
  $A028  FF        .db $FF
  $A029  00        BRK
  $A02A  55 FF     EOR $FF,X
  $A02C  FF        .db $FF
  $A02D  00        BRK
  $A02E  FF        .db $FF
  $A02F  FF        .db $FF
  $A030  FF        .db $FF
  $A031  FF        .db $FF
  $A032  00        BRK
  $A033  FF        .db $FF
  $A034  AA        TAX
  $A035  00        BRK
  $A036  00        BRK
  $A037  00        BRK
  $A038  FF        .db $FF
  $A039  FF        .db $FF
  $A03A  FF        .db $FF
  $A03B  00        BRK
  $A03C  55 FF     EOR $FF,X
  $A03E  FF        .db $FF

L_A03F:
  $A03F  00        BRK
  $A040  80        .db $80
  $A041  3F        .db $3F
  $A042  6A        ROR
  $A043  40        RTI
  $A044  60        RTS
  $A045  40        RTI
  $A046  63        .db $63
  $A047  43        .db $43
  $A048  FF        .db $FF
  $A049  C0 95     CPY #$95

L_A04B:
  $A04B  BF        .db $BF
  $A04C  9F        .db $9F

L_A04D:
  $A04D  B8        CLV
  $A04E  9B        .db $9B

L_A04F:
  $A04F  BB        .db $BB
  $A050  63        .db $63
  $A051  43        .db $43
  $A052  63        .db $63
  $A053  43        .db $43
  $A054  63        .db $63
  $A055  43        .db $43
  $A056  63        .db $63
  $A057  43        .db $43
  $A058  9B        .db $9B
  $A059  BB        .db $BB
  $A05A  9B        .db $9B
  $A05B  BB        .db $BB
  $A05C  9B        .db $9B
  $A05D  BB        .db $BB
  $A05E  9B        .db $9B

L_A05F:
  $A05F  BB        .db $BB
  $A060  01 F0     ORA ($F0,X)
  $A062  B8        CLV
  $A063  10 18     BPL $A07D
  $A065  10 D8     BPL $A03F
  $A067  D0 FD     BNE $A066
  $A069  0E 46 EE  ASL $EE46
  $A06C  E6 2E     INC $2E
  $A06E  E6 EE     INC $EE
  $A070  D8        CLD
  $A071  D0 D8     BNE $A04B
  $A073  D0 D8     BNE $A04D
  $A075  D0 D8     BNE $A04F
  $A077  D0 E6     BNE $A05F
  $A079  EE E6 EE  INC $EEE6
  $A07C  E6 EE     INC $EE
  $A07E  E6 EE     INC $EE
  $A080  FF        .db $FF
  $A081  FF        .db $FF
  $A082  FF        .db $FF
  $A083  FE F8 F0  INC $F0F8,X
  $A086  E0 C0     CPX #$C0
  $A088  00        BRK
  $A089  00        BRK
  $A08A  00        BRK
  $A08B  01 07     ORA ($07,X)
  $A08D  0F        .db $0F
  $A08E  1F        .db $1F
  $A08F  32        .db $32
  $A090  C3        .db $C3
  $A091  84 87     STY $87
  $A093  88        DEY
  $A094  0F        .db $0F
  $A095  08        PHP
  $A096  07        .db $07
  $A097  00        BRK
  $A098  3F        .db $3F
  $A099  64        .db $64
  $A09A  7F        .db $7F
  $A09B  48        PHA
  $A09C  FF        .db $FF
  $A09D  88        DEY
  $A09E  FF        .db $FF
  $A09F  00        BRK
  $A0A0  D8        CLD
  $A0A1  C0 80     CPY #$80
  $A0A3  00        BRK
  $A0A4  08        PHP
  $A0A5  18        CLC
  $A0A6  DF        .db $DF
  $A0A7  DF        .db $DF
  $A0A8  3E 00 6F  ROL $6F00,X
  $A0AB  EF        .db $EF
  $A0AC  D8        CLD
  $A0AD  DA        .db $DA
  $A0AE  DF        .db $DF
  $A0AF  DF        .db $DF
  $A0B0  BF        .db $BF
  $A0B1  BF        .db $BF
  $A0B2  BF        .db $BF
  $A0B3  BE BC B8  LDX $B8BC,Y
  $A0B6  A0 00     LDY #$00
  $A0B8  BF        .db $BF
  $A0B9  BF        .db $BF
  $A0BA  BF        .db $BF
  $A0BB  BE BE BF  LDX $BFBE,Y
  $A0BE  BF        .db $BF
  $A0BF  00        BRK
  $A0C0  63        .db $63
  $A0C1  03        .db $03
  $A0C2  00        BRK
  $A0C3  00        BRK
  $A0C4  80        .db $80
  $A0C5  80        .db $80
  $A0C6  C0 C0     CPY #$C0
  $A0C8  F8        SED
  $A0C9  00        BRK
  $A0CA  F8        SED
  $A0CB  FF        .db $FF
  $A0CC  8F        .db $8F
  $A0CD  AF        .db $AF
  $A0CE  FF        .db $FF
  $A0CF  FF        .db $FF
  $A0D0  80        .db $80
  $A0D1  80        .db $80
  $A0D2  00        BRK
  $A0D3  C3        .db $C3
  $A0D4  82        .db $82
  $A0D5  00        BRK
  $A0D6  00        BRK
  $A0D7  00        BRK
  $A0D8  FF        .db $FF
  $A0D9  FF        .db $FF
  $A0DA  3C        .db $3C
  $A0DB  DB        .db $DB
  $A0DC  DB        .db $DB
  $A0DD  3C        .db $3C
  $A0DE  FF        .db $FF
  $A0DF  00        BRK
  $A0E0  FF        .db $FF
  $A0E1  FF        .db $FF
  $A0E2  FF        .db $FF
  $A0E3  3F        .db $3F
  $A0E4  1F        .db $1F
  $A0E5  0F        .db $0F
  $A0E6  07        .db $07
  $A0E7  03        .db $03

L_A0E8:
  $A0E8  00        BRK
  $A0E9  00        BRK
  $A0EA  00        BRK
  $A0EB  00        BRK
  $A0EC  C0 E0     CPY #$E0
  $A0EE  F0 F8     BEQ $A0E8
  $A0F0  03        .db $03
  $A0F1  01 01     ORA ($01,X)
  $A0F3  08        PHP
  $A0F4  08        PHP
  $A0F5  00        BRK
  $A0F6  00        BRK
  $A0F7  00        BRK
  $A0F8  F8        SED
  $A0F9  FC        .db $FC
  $A0FA  F4        .db $F4
  $A0FB  6A        ROR
  $A0FC  6A        ROR
  $A0FD  F6 FE     INC $FE,X
  $A0FF  00        BRK
  $A100  00        BRK
  $A101  00        BRK
  $A102  00        BRK
  $A103  00        BRK
  $A104  00        BRK
  $A105  00        BRK
  $A106  00        BRK
  $A107  00        BRK
  $A108  00        BRK
  $A109  00        BRK
  $A10A  00        BRK
  $A10B  00        BRK
  $A10C  00        BRK
  $A10D  00        BRK
  $A10E  00        BRK
  $A10F  00        BRK
  $A110  01 00     ORA ($00,X)
  $A112  00        BRK
  $A113  00        BRK
  $A114  00        BRK
  $A115  00        BRK
  $A116  00        BRK
  $A117  00        BRK
  $A118  01 00     ORA ($00,X)
  $A11A  00        BRK
  $A11B  00        BRK
  $A11C  00        BRK
  $A11D  00        BRK
  $A11E  00        BRK
  $A11F  00        BRK
  $A120  00        BRK
  $A121  00        BRK
  $A122  00        BRK
  $A123  00        BRK
  $A124  00        BRK
  $A125  00        BRK
  $A126  00        BRK
  $A127  80        .db $80
  $A128  00        BRK
  $A129  00        BRK
  $A12A  00        BRK
  $A12B  00        BRK
  $A12C  00        BRK
  $A12D  00        BRK
  $A12E  00        BRK
  $A12F  80        .db $80
  $A130  C0 80     CPY #$80
  $A132  00        BRK
  $A133  00        BRK
  $A134  00        BRK
  $A135  00        BRK
  $A136  00        BRK
  $A137  00        BRK
  $A138  40        RTI
  $A139  80        .db $80
  $A13A  00        BRK
  $A13B  00        BRK
  $A13C  00        BRK
  $A13D  00        BRK
  $A13E  00        BRK
  $A13F  00        BRK
  $A140  00        BRK
  $A141  00        BRK
  $A142  00        BRK
  $A143  04        .db $04
  $A144  00        BRK
  $A145  00        BRK
  $A146  00        BRK
  $A147  00        BRK
  $A148  00        BRK
  $A149  00        BRK
  $A14A  00        BRK
  $A14B  04        .db $04
  $A14C  00        BRK
  $A14D  00        BRK
  $A14E  00        BRK
  $A14F  00        BRK
  $A150  00        BRK
  $A151  00        BRK
  $A152  00        BRK
  $A153  10 00     BPL $A155

L_A155:
  $A155  00        BRK
  $A156  00        BRK
  $A157  00        BRK
  $A158  00        BRK
  $A159  00        BRK
  $A15A  00        BRK
  $A15B  00        BRK
  $A15C  00        BRK
  $A15D  00        BRK
  $A15E  00        BRK
  $A15F  00        BRK
  $A160  00        BRK
  $A161  00        BRK
  $A162  00        BRK
  $A163  00        BRK
  $A164  00        BRK
  $A165  00        BRK
  $A166  00        BRK
  $A167  00        BRK
  $A168  00        BRK
  $A169  00        BRK
  $A16A  00        BRK
  $A16B  00        BRK
  $A16C  00        BRK
  $A16D  00        BRK
  $A16E  00        BRK
  $A16F  00        BRK
  $A170  00        BRK
  $A171  0C        .db $0C
  $A172  00        BRK
  $A173  00        BRK
  $A174  00        BRK
  $A175  00        BRK
  $A176  00        BRK
  $A177  00        BRK
  $A178  00        BRK
  $A179  0C        .db $0C
  $A17A  00        BRK
  $A17B  00        BRK
  $A17C  00        BRK
  $A17D  00        BRK
  $A17E  00        BRK
  $A17F  00        BRK
  $A180  FF        .db $FF
  $A181  00        BRK
  $A182  55 00     EOR $00,X
  $A184  FF        .db $FF
  $A185  FF        .db $FF
  $A186  AA        TAX
  $A187  00        BRK
  $A188  00        BRK
  $A189  FF        .db $FF
  $A18A  FF        .db $FF
  $A18B  00        BRK
  $A18C  FF        .db $FF
  $A18D  FF        .db $FF
  $A18E  FF        .db $FF
  $A18F  00        BRK
  $A190  FF        .db $FF
  $A191  AA        TAX
  $A192  00        BRK
  $A193  00        BRK
  $A194  00        BRK
  $A195  00        BRK
  $A196  00        BRK
  $A197  FF        .db $FF
  $A198  FF        .db $FF
  $A199  FF        .db $FF
  $A19A  FF        .db $FF
  $A19B  00        BRK
  $A19C  FF        .db $FF
  $A19D  55 00     EOR $00,X
  $A19F  00        BRK
  $A1A0  FF        .db $FF
  $A1A1  00        BRK
  $A1A2  55 00     EOR $00,X
  $A1A4  FF        .db $FF
  $A1A5  FF        .db $FF
  $A1A6  AA        TAX
  $A1A7  00        BRK
  $A1A8  00        BRK
  $A1A9  FF        .db $FF
  $A1AA  FF        .db $FF
  $A1AB  00        BRK
  $A1AC  FF        .db $FF
  $A1AD  FF        .db $FF
  $A1AE  FF        .db $FF
  $A1AF  00        BRK
  $A1B0  FF        .db $FF
  $A1B1  AA        TAX
  $A1B2  00        BRK
  $A1B3  00        BRK
  $A1B4  00        BRK
  $A1B5  00        BRK
  $A1B6  00        BRK
  $A1B7  FF        .db $FF
  $A1B8  FF        .db $FF
  $A1B9  FF        .db $FF
  $A1BA  FF        .db $FF
  $A1BB  00        BRK
  $A1BC  FF        .db $FF
  $A1BD  55 00     EOR $00,X
  $A1BF  00        BRK
  $A1C0  EA        NOP
  $A1C1  00        BRK
  $A1C2  5F        .db $5F
  $A1C3  3E 80 BE  ROL $BE80,X
  $A1C6  BE 3E 0F  LDX $0F3E,Y
  $A1C9  C0 DF     CPY #$DF
  $A1CB  3E 80 BE  ROL $BE80,X
  $A1CE  BE 3E AA  LDX $AA3E,Y
  $A1D1  80        .db $80
  $A1D2  3E 2A 00  ROL $002A,X
  $A1D5  00        BRK
  $A1D6  00        BRK
  $A1D7  E0 BE     CPX #$BE
  $A1D9  80        .db $80
  $A1DA  BE 3E BE  LDX $BE3E,Y
  $A1DD  40        RTI
  $A1DE  1F        .db $1F
  $A1DF  0A        ASL
  $A1E0  BF        .db $BF
  $A1E1  73        .db $73
  $A1E2  73        .db $73
  $A1E3  E1 E7     SBC ($E7,X)
  $A1E5  E1 A1     SBC ($A1,X)
  $A1E7  01 BC     ORA ($BC,X)
  $A1E9  72        .db $72
  $A1EA  72        .db $72
  $A1EB  E1 E0     SBC ($E0,X)
  $A1ED  E1 E1     SBC ($E1,X)
  $A1EF  01 E1     ORA ($E1,X)
  $A1F1  E1 A1     SBC ($A1,X)
  $A1F3  21 27     AND ($27,X)
  $A1F5  13        .db $13
  $A1F6  13        .db $13
  $A1F7  0F        .db $0F
  $A1F8  E1 E1     SBC ($E1,X)
  $A1FA  E1 E1     SBC ($E1,X)
  $A1FC  E0 72     CPX #$72
  $A1FE  72        .db $72
  $A1FF  BC FF FF  LDY $FFFF,X
  $A202  FF        .db $FF
  $A203  FF        .db $FF
  $A204  FF        .db $FF
  $A205  FF        .db $FF
  $A206  FF        .db $FF
  $A207  FF        .db $FF
  $A208  C0 FE     CPY #$FE
  $A20A  FF        .db $FF
  $A20B  FF        .db $FF
  $A20C  FF        .db $FF
  $A20D  FF        .db $FF
  $A20E  FF        .db $FF
  $A20F  FF        .db $FF
  $A210  FF        .db $FF
  $A211  FF        .db $FF
  $A212  FF        .db $FF
  $A213  FF        .db $FF
  $A214  FF        .db $FF
  $A215  FF        .db $FF
  $A216  FF        .db $FF
  $A217  FF        .db $FF
  $A218  FF        .db $FF
  $A219  FF        .db $FF
  $A21A  FF        .db $FF
  $A21B  FF        .db $FF
  $A21C  FF        .db $FF
  $A21D  FF        .db $FF
  $A21E  FF        .db $FF
  $A21F  FF        .db $FF
  $A220  FF        .db $FF
  $A221  FF        .db $FF
  $A222  FF        .db $FF
  $A223  FF        .db $FF
  $A224  FF        .db $FF
  $A225  FF        .db $FF
  $A226  FF        .db $FF
  $A227  FF        .db $FF
  $A228  00        BRK
  $A229  00        BRK
  $A22A  80        .db $80
  $A22B  C0 E0     CPY #$E0
  $A22D  E0 F0     CPX #$F0
  $A22F  F0 FF     BEQ $A230
  $A231  FF        .db $FF

L_A232:
  $A232  FF        .db $FF
  $A233  FF        .db $FF
  $A234  FF        .db $FF
  $A235  FF        .db $FF
  $A236  FF        .db $FF
  $A237  FF        .db $FF
  $A238  F0 F8     BEQ $A232
  $A23A  FC        .db $FC

L_A23B:
  $A23B  FE FE FF  INC $FFFE,X
  $A23E  FF        .db $FF

L_A23F:
  $A23F  FF        .db $FF
  $A240  63        .db $63
  $A241  43        .db $43
  $A242  63        .db $63
  $A243  43        .db $43
  $A244  63        .db $63
  $A245  43        .db $43
  $A246  63        .db $63
  $A247  43        .db $43
  $A248  9B        .db $9B
  $A249  BB        .db $BB
  $A24A  9B        .db $9B

L_A24B:
  $A24B  BB        .db $BB
  $A24C  9B        .db $9B

L_A24D:
  $A24D  BB        .db $BB
  $A24E  9B        .db $9B

L_A24F:
  $A24F  BB        .db $BB
  $A250  63        .db $63
  $A251  43        .db $43
  $A252  63        .db $63
  $A253  43        .db $43
  $A254  63        .db $63
  $A255  43        .db $43
  $A256  63        .db $63
  $A257  43        .db $43
  $A258  9B        .db $9B
  $A259  BB        .db $BB
  $A25A  9B        .db $9B
  $A25B  BB        .db $BB
  $A25C  9B        .db $9B
  $A25D  BB        .db $BB
  $A25E  9B        .db $9B

L_A25F:
  $A25F  BB        .db $BB
  $A260  D8        CLD
  $A261  D0 D8     BNE $A23B
  $A263  D0 D8     BNE $A23D
  $A265  D0 D8     BNE $A23F
  $A267  D0 E6     BNE $A24F
  $A269  EE E6 EE  INC $EEE6
  $A26C  E6 EE     INC $EE
  $A26E  E6 EE     INC $EE
  $A270  D8        CLD
  $A271  D0 D8     BNE $A24B
  $A273  D0 D8     BNE $A24D
  $A275  D0 D8     BNE $A24F
  $A277  D0 E6     BNE $A25F
  $A279  EE E6 EE  INC $EEE6
  $A27C  E6 EE     INC $EE
  $A27E  E6 EE     INC $EE
  $A280  80        .db $80
  $A281  3F        .db $3F
  $A282  6A        ROR
  $A283  40        RTI
  $A284  60        RTS
  $A285  40        RTI
  $A286  63        .db $63
  $A287  43        .db $43
  $A288  FF        .db $FF
  $A289  C0 95     CPY #$95
  $A28B  BF        .db $BF
  $A28C  9F        .db $9F
  $A28D  B8        CLV
  $A28E  9B        .db $9B

L_A28F:
  $A28F  BB        .db $BB
  $A290  63        .db $63
  $A291  43        .db $43
  $A292  63        .db $63
  $A293  43        .db $43
  $A294  63        .db $63
  $A295  43        .db $43
  $A296  63        .db $63
  $A297  43        .db $43
  $A298  9B        .db $9B
  $A299  BB        .db $BB
  $A29A  9B        .db $9B
  $A29B  BB        .db $BB
  $A29C  9B        .db $9B
  $A29D  BB        .db $BB
  $A29E  9B        .db $9B
  $A29F  BB        .db $BB
  $A2A0  00        BRK
  $A2A1  FF        .db $FF

L_A2A2:
  $A2A2  AA        TAX
  $A2A3  00        BRK
  $A2A4  00        BRK
  $A2A5  00        BRK
  $A2A6  FF        .db $FF
  $A2A7  FF        .db $FF
  $A2A8  FF        .db $FF
  $A2A9  00        BRK
  $A2AA  55 FF     EOR $FF,X
  $A2AC  FF        .db $FF
  $A2AD  00        BRK
  $A2AE  FF        .db $FF
  $A2AF  FF        .db $FF
  $A2B0  FF        .db $FF
  $A2B1  FF        .db $FF
  $A2B2  E0 CF     CPX #$CF
  $A2B4  DA        .db $DA
  $A2B5  D0 D8     BNE $A28F
  $A2B7  D0 FF     BNE $A2B8
  $A2B9  FF        .db $FF
  $A2BA  FF        .db $FF
  $A2BB  F0 E5     BEQ $A2A2
  $A2BD  EF        .db $EF
  $A2BE  E7        .db $E7

L_A2BF:
  $A2BF  EE 00 FF  INC $FF00
  $A2C2  AA        TAX
  $A2C3  00        BRK
  $A2C4  00        BRK
  $A2C5  00        BRK
  $A2C6  FF        .db $FF
  $A2C7  FF        .db $FF
  $A2C8  FF        .db $FF
  $A2C9  00        BRK
  $A2CA  55 FF     EOR $FF,X
  $A2CC  FF        .db $FF

L_A2CD:
  $A2CD  00        BRK
  $A2CE  FF        .db $FF

L_A2CF:
  $A2CF  FF        .db $FF
  $A2D0  FF        .db $FF
  $A2D1  FF        .db $FF
  $A2D2  07        .db $07
  $A2D3  C3        .db $C3
  $A2D4  E3        .db $E3
  $A2D5  43        .db $43
  $A2D6  63        .db $63
  $A2D7  43        .db $43
  $A2D8  FF        .db $FF
  $A2D9  FF        .db $FF
  $A2DA  F7        .db $F7
  $A2DB  3B        .db $3B
  $A2DC  1B        .db $1B
  $A2DD  BB        .db $BB
  $A2DE  9B        .db $9B

L_A2DF:
  $A2DF  BB        .db $BB
  $A2E0  01 F0     ORA ($F0,X)
  $A2E2  B8        CLV
  $A2E3  10 18     BPL $A2FD
  $A2E5  10 D8     BPL $A2BF
  $A2E7  D0 FD     BNE $A2E6
  $A2E9  0E 46 EE  ASL $EE46
  $A2EC  E6 2E     INC $2E
  $A2EE  E6 EE     INC $EE
  $A2F0  D8        CLD
  $A2F1  D0 D8     BNE $A2CB
  $A2F3  D0 D8     BNE $A2CD
  $A2F5  D0 D8     BNE $A2CF
  $A2F7  D0 E6     BNE $A2DF
  $A2F9  EE E6 EE  INC $EEE6
  $A2FC  E6 EE     INC $EE
  $A2FE  E6 EE     INC $EE
  $A300  17        .db $17
  $A301  00        BRK
  $A302  00        BRK
  $A303  0F        .db $0F
  $A304  00        BRK
  $A305  80        .db $80
  $A306  87        .db $87
  $A307  80        .db $80
  $A308  FF        .db $FF
  $A309  C0 DE     CPY #$DE
  $A30B  7F        .db $7F
  $A30C  60        RTS

L_A30D:
  $A30D  6E 3F 00  ROR $003F
  $A310  C3        .db $C3
  $A311  C0 E0     CPY #$E0
  $A313  F0 F8     BEQ $A30D
  $A315  FE FF FF  INC $FFFF,X
  $A318  1F        .db $1F
  $A319  1F        .db $1F
  $A31A  0F        .db $0F
  $A31B  07        .db $07
  $A31C  01 00     ORA ($00,X)
  $A31E  00        BRK
  $A31F  00        BRK
  $A320  FF        .db $FF
  $A321  00        BRK
  $A322  00        BRK
  $A323  00        BRK
  $A324  00        BRK
  $A325  00        BRK
  $A326  00        BRK
  $A327  04        .db $04
  $A328  FF        .db $FF
  $A329  FF        .db $FF
  $A32A  FF        .db $FF
  $A32B  FF        .db $FF
  $A32C  FF        .db $FF
  $A32D  FF        .db $FF
  $A32E  E0 0E     CPX #$0E
  $A330  E0 00     CPX #$00
  $A332  00        BRK
  $A333  00        BRK
  $A334  00        BRK
  $A335  00        BRK
  $A336  C0 D0     CPY #$D0
  $A338  E0 FF     CPX #$FF
  $A33A  FF        .db $FF
  $A33B  FF        .db $FF
  $A33C  FA        .db $FA
  $A33D  3F        .db $3F
  $A33E  00        BRK
  $A33F  3E D3 02  ROL $02D3,X
  $A342  12        .db $12
  $A343  02        .db $02
  $A344  10 00     BPL $A346

L_A346:
  $A346  10 00     BPL $A348

L_A348:
  $A348  DB        .db $DB
  $A349  C3        .db $C3
  $A34A  DB        .db $DB
  $A34B  C3        .db $C3
  $A34C  DB        .db $DB
  $A34D  C3        .db $C3
  $A34E  DB        .db $DB
  $A34F  03        .db $03
  $A350  00        BRK
  $A351  00        BRK
  $A352  00        BRK
  $A353  00        BRK
  $A354  00        BRK
  $A355  00        BRK
  $A356  01 43     ORA ($43,X)
  $A358  FB        .db $FB
  $A359  FB        .db $FB
  $A35A  FB        .db $FB
  $A35B  EA        NOP
  $A35C  1B        .db $1B
  $A35D  F6 00     INC $00,X
  $A35F  F8        SED
  $A360  80        .db $80
  $A361  00        BRK
  $A362  00        BRK
  $A363  00        BRK
  $A364  00        BRK
  $A365  01 01     ORA ($01,X)
  $A367  01 FE     ORA ($FE,X)
  $A369  FE 1E FE  INC $FE1E,X
  $A36C  1C        .db $1C
  $A36D  F4        .db $F4
  $A36E  14        .db $14
  $A36F  E8        INX
  $A370  03        .db $03
  $A371  03        .db $03
  $A372  07        .db $07
  $A373  0F        .db $0F
  $A374  1F        .db $1F
  $A375  7F        .db $7F
  $A376  FF        .db $FF
  $A377  FF        .db $FF
  $A378  C8        INY
  $A379  90 20     BCC $A39B
  $A37B  C0 80     CPY #$80
  $A37D  00        BRK
  $A37E  00        BRK
  $A37F  00        BRK
  $A380  00        BRK
  $A381  FF        .db $FF
  $A382  AA        TAX
  $A383  00        BRK
  $A384  00        BRK
  $A385  00        BRK
  $A386  03        .db $03
  $A387  63        .db $63
  $A388  FF        .db $FF
  $A389  00        BRK

L_A38A:
  $A38A  55 FF     EOR $FF,X
  $A38C  FF        .db $FF
  $A38D  00        BRK
  $A38E  03        .db $03
  $A38F  9B        .db $9B
  $A390  43        .db $43
  $A391  63        .db $63
  $A392  00        BRK
  $A393  FF        .db $FF
  $A394  AA        TAX
  $A395  00        BRK
  $A396  00        BRK
  $A397  00        BRK
  $A398  BB        .db $BB
  $A399  9B        .db $9B
  $A39A  FF        .db $FF

L_A39B:
  $A39B  00        BRK
  $A39C  55 FF     EOR $FF,X
  $A39E  FF        .db $FF
  $A39F  00        BRK
  $A3A0  00        BRK
  $A3A1  FF        .db $FF
  $A3A2  AA        TAX
  $A3A3  00        BRK
  $A3A4  00        BRK
  $A3A5  00        BRK
  $A3A6  C0 D8     CPY #$D8
  $A3A8  FF        .db $FF
  $A3A9  00        BRK
  $A3AA  55 FF     EOR $FF,X
  $A3AC  FF        .db $FF
  $A3AD  00        BRK
  $A3AE  C0 E6     CPY #$E6
  $A3B0  D0 D8     BNE $A38A
  $A3B2  00        BRK
  $A3B3  FF        .db $FF
  $A3B4  AA        TAX
  $A3B5  00        BRK
  $A3B6  00        BRK
  $A3B7  00        BRK
  $A3B8  EE E6 FF  INC $FFE6
  $A3BB  00        BRK
  $A3BC  55 FF     EOR $FF,X
  $A3BE  FF        .db $FF

L_A3BF:
  $A3BF  00        BRK
  $A3C0  60        RTS
  $A3C1  41 61     EOR ($61,X)
  $A3C3  40        RTI
  $A3C4  60        RTS
  $A3C5  40        RTI
  $A3C6  63        .db $63
  $A3C7  43        .db $43
  $A3C8  99 B8 98  STA $98B8,Y
  $A3CB  B9 99 B8  LDA $B899,Y
  $A3CE  9B        .db $9B

L_A3CF:
  $A3CF  BB        .db $BB
  $A3D0  63        .db $63
  $A3D1  43        .db $43
  $A3D2  60        RTS
  $A3D3  41 61     EOR ($61,X)
  $A3D5  40        RTI
  $A3D6  60        RTS
  $A3D7  40        RTI
  $A3D8  9B        .db $9B
  $A3D9  BB        .db $BB
  $A3DA  99 B8 98  STA $98B8,Y
  $A3DD  B9 99 B8  LDA $B899,Y
  $A3E0  18        CLC
  $A3E1  D0 58     BNE $A43B
  $A3E3  10 18     BPL $A3FD
  $A3E5  10 D8     BPL $A3BF
  $A3E7  D0 E6     BNE $A3CF
  $A3E9  2E A6 EE  ROL $EEA6
  $A3EC  E6 2E     INC $2E
  $A3EE  E6 EE     INC $EE
  $A3F0  D8        CLD
  $A3F1  D0 18     BNE $A40B
  $A3F3  D0 58     BNE $A44D
  $A3F5  10 18     BPL $A40F
  $A3F7  10 E6     BPL $A3DF
  $A3F9  EE E6 2E  INC $2EE6
  $A3FC  A6 EE     LDX $EE
  $A3FE  E6 2E     INC $2E
  $A400  FF        .db $FF
  $A401  FF        .db $FF
  $A402  FF        .db $FF
  $A403  FF        .db $FF
  $A404  FF        .db $FF
  $A405  FF        .db $FF
  $A406  FF        .db $FF
  $A407  FF        .db $FF
  $A408  FF        .db $FF
  $A409  FF        .db $FF
  $A40A  FF        .db $FF

L_A40B:
  $A40B  FF        .db $FF
  $A40C  FF        .db $FF
  $A40D  FF        .db $FF
  $A40E  FF        .db $FF

L_A40F:
  $A40F  FF        .db $FF
  $A410  FF        .db $FF
  $A411  FF        .db $FF
  $A412  FF        .db $FF
  $A413  FF        .db $FF
  $A414  FF        .db $FF
  $A415  FF        .db $FF
  $A416  FF        .db $FF
  $A417  FF        .db $FF
  $A418  FF        .db $FF
  $A419  FF        .db $FF
  $A41A  FF        .db $FF
  $A41B  FF        .db $FF
  $A41C  FF        .db $FF
  $A41D  FE F8 80  INC $80F8,X
  $A420  FF        .db $FF
  $A421  FF        .db $FF
  $A422  FF        .db $FF
  $A423  FF        .db $FF
  $A424  FF        .db $FF
  $A425  FF        .db $FF
  $A426  FF        .db $FF
  $A427  FF        .db $FF
  $A428  FF        .db $FF
  $A429  FF        .db $FF
  $A42A  FF        .db $FF
  $A42B  FE FE FC  INC $FCFE,X
  $A42E  FC        .db $FC
  $A42F  F8        SED
  $A430  FF        .db $FF
  $A431  FF        .db $FF
  $A432  FF        .db $FF
  $A433  FF        .db $FF
  $A434  FF        .db $FF
  $A435  FF        .db $FF
  $A436  FF        .db $FF
  $A437  FF        .db $FF
  $A438  F0 80     BEQ $A3BA
  $A43A  80        .db $80

L_A43B:
  $A43B  00        BRK
  $A43C  00        BRK

L_A43D:
  $A43D  00        BRK
  $A43E  00        BRK

L_A43F:
  $A43F  00        BRK
  $A440  63        .db $63
  $A441  43        .db $43
  $A442  63        .db $63
  $A443  43        .db $43
  $A444  63        .db $63
  $A445  43        .db $43
  $A446  63        .db $63
  $A447  43        .db $43
  $A448  9B        .db $9B
  $A449  BB        .db $BB

L_A44A:
  $A44A  9B        .db $9B
  $A44B  BB        .db $BB
  $A44C  9B        .db $9B

L_A44D:
  $A44D  BB        .db $BB
  $A44E  9B        .db $9B

L_A44F:
  $A44F  BB        .db $BB
  $A450  63        .db $63
  $A451  43        .db $43
  $A452  60        RTS
  $A453  7F        .db $7F
  $A454  2A        ROL
  $A455  00        BRK
  $A456  00        BRK
  $A457  80        .db $80
  $A458  9B        .db $9B
  $A459  BB        .db $BB
  $A45A  9F        .db $9F
  $A45B  80        .db $80
  $A45C  D5 FF     CMP $FF,X
  $A45E  7F        .db $7F
  $A45F  80        .db $80
  $A460  D8        CLD
  $A461  D0 D8     BNE $A43B
  $A463  D0 D8     BNE $A43D
  $A465  D0 D8     BNE $A43F
  $A467  D0 E6     BNE $A44F
  $A469  EE E6 EE  INC $EEE6

L_A46C:
  $A46C  E6 EE     INC $EE
  $A46E  E6 EE     INC $EE
  $A470  D0 D8     BNE $A44A
  $A472  10 F8     BPL $A46C
  $A474  B0 00     BCS $A476

L_A476:
  $A476  00        BRK
  $A477  01 EE     ORA ($EE,X)
  $A479  E6 EE     INC $EE
  $A47B  06 4E     ASL $4E
  $A47D  FE FC 01  INC $01FC,X
  $A480  63        .db $63
  $A481  43        .db $43
  $A482  63        .db $63
  $A483  43        .db $43
  $A484  63        .db $63
  $A485  43        .db $43
  $A486  63        .db $63
  $A487  43        .db $43
  $A488  9B        .db $9B
  $A489  BB        .db $BB
  $A48A  9B        .db $9B
  $A48B  BB        .db $BB
  $A48C  9B        .db $9B
  $A48D  BB        .db $BB
  $A48E  9B        .db $9B
  $A48F  BB        .db $BB
  $A490  63        .db $63
  $A491  43        .db $43
  $A492  60        RTS
  $A493  7F        .db $7F
  $A494  2A        ROL
  $A495  00        BRK
  $A496  00        BRK
  $A497  80        .db $80
  $A498  9B        .db $9B
  $A499  BB        .db $BB
  $A49A  9F        .db $9F
  $A49B  80        .db $80
  $A49C  D5 FF     CMP $FF,X
  $A49E  7F        .db $7F
  $A49F  80        .db $80
  $A4A0  D8        CLD
  $A4A1  DF        .db $DF
  $A4A2  CA        DEX
  $A4A3  C0 C0     CPY #$C0
  $A4A5  E0 FF     CPX #$FF
  $A4A7  FF        .db $FF
  $A4A8  E7        .db $E7
  $A4A9  E0 F5     CPX #$F5
  $A4AB  FF        .db $FF
  $A4AC  DF        .db $DF
  $A4AD  E0 FF     CPX #$FF
  $A4AF  FF        .db $FF
  $A4B0  FF        .db $FF
  $A4B1  FF        .db $FF
  $A4B2  00        BRK
  $A4B3  FF        .db $FF
  $A4B4  AA        TAX
  $A4B5  00        BRK
  $A4B6  00        BRK
  $A4B7  00        BRK
  $A4B8  FF        .db $FF
  $A4B9  FF        .db $FF
  $A4BA  FF        .db $FF

L_A4BB:
  $A4BB  00        BRK
  $A4BC  55 FF     EOR $FF,X
  $A4BE  FF        .db $FF

L_A4BF:
  $A4BF  00        BRK
  $A4C0  63        .db $63
  $A4C1  C3        .db $C3
  $A4C2  83        .db $83
  $A4C3  03        .db $03
  $A4C4  03        .db $03
  $A4C5  07        .db $07
  $A4C6  FF        .db $FF
  $A4C7  FF        .db $FF
  $A4C8  9B        .db $9B
  $A4C9  3B        .db $3B
  $A4CA  7B        .db $7B
  $A4CB  FB        .db $FB
  $A4CC  F3        .db $F3
  $A4CD  07        .db $07
  $A4CE  FF        .db $FF

L_A4CF:
  $A4CF  FF        .db $FF
  $A4D0  FF        .db $FF
  $A4D1  FF        .db $FF
  $A4D2  00        BRK
  $A4D3  FF        .db $FF
  $A4D4  AA        TAX
  $A4D5  00        BRK
  $A4D6  00        BRK
  $A4D7  00        BRK
  $A4D8  FF        .db $FF
  $A4D9  FF        .db $FF
  $A4DA  FF        .db $FF
  $A4DB  00        BRK
  $A4DC  55 FF     EOR $FF,X
  $A4DE  FF        .db $FF
  $A4DF  00        BRK
  $A4E0  D8        CLD
  $A4E1  D0 D8     BNE $A4BB
  $A4E3  D0 D8     BNE $A4BD
  $A4E5  D0 D8     BNE $A4BF
  $A4E7  D0 E6     BNE $A4CF
  $A4E9  EE E6 EE  INC $EEE6
  $A4EC  E6 EE     INC $EE
  $A4EE  E6 EE     INC $EE
  $A4F0  D8        CLD
  $A4F1  D0 18     BNE $A50B
  $A4F3  F0 A8     BEQ $A49D
  $A4F5  00        BRK
  $A4F6  00        BRK
  $A4F7  01 E6     ORA ($E6,X)
  $A4F9  EE E6 0E  INC $0EE6
  $A4FC  56 FE     LSR $FE,X
  $A4FE  FC        .db $FC
  $A4FF  01 FD     ORA ($FD,X)
  $A501  FE FD FE  INC $FEFD,X
  $A504  FD FE FD  SBC $FDFE,X
  $A507  FE 01 00  INC $0001,X
  $A50A  01 00     ORA ($00,X)
  $A50C  01 00     ORA ($00,X)
  $A50E  01 00     ORA ($00,X)
  $A510  FD FE FD  SBC $FDFE,X
  $A513  FE FD FE  INC $FEFD,X
  $A516  FD FE 01  SBC $01FE,X
  $A519  00        BRK
  $A51A  01 00     ORA ($00,X)
  $A51C  01 00     ORA ($00,X)
  $A51E  01 00     ORA ($00,X)
  $A520  7F        .db $7F
  $A521  FF        .db $FF
  $A522  7F        .db $7F
  $A523  FF        .db $FF
  $A524  7F        .db $7F
  $A525  FF        .db $FF
  $A526  7F        .db $7F
  $A527  FF        .db $FF
  $A528  00        BRK
  $A529  00        BRK
  $A52A  00        BRK
  $A52B  00        BRK
  $A52C  00        BRK
  $A52D  00        BRK
  $A52E  00        BRK
  $A52F  00        BRK
  $A530  7F        .db $7F
  $A531  FF        .db $FF
  $A532  7F        .db $7F
  $A533  FF        .db $FF
  $A534  7F        .db $7F
  $A535  FF        .db $FF
  $A536  7F        .db $7F
  $A537  FF        .db $FF
  $A538  00        BRK
  $A539  00        BRK
  $A53A  00        BRK
  $A53B  00        BRK
  $A53C  00        BRK
  $A53D  00        BRK
  $A53E  00        BRK
  $A53F  00        BRK
  $A540  FF        .db $FF
  $A541  FF        .db $FF
  $A542  FF        .db $FF
  $A543  FF        .db $FF
  $A544  FF        .db $FF
  $A545  FF        .db $FF
  $A546  F7        .db $F7
  $A547  F7        .db $F7
  $A548  00        BRK
  $A549  00        BRK
  $A54A  00        BRK
  $A54B  00        BRK
  $A54C  00        BRK
  $A54D  00        BRK
  $A54E  F7        .db $F7
  $A54F  F7        .db $F7
  $A550  A5 00     LDA $00
  $A552  FD FE FD  SBC $FDFE,X
  $A555  FE FD FE  INC $FEFD,X
  $A558  A5 00     LDA $00
  $A55A  01 00     ORA ($00,X)
  $A55C  01 00     ORA ($00,X)
  $A55E  01 00     ORA ($00,X)
  $A560  FF        .db $FF
  $A561  FF        .db $FF

L_A562:
  $A562  FF        .db $FF
  $A563  FF        .db $FF
  $A564  FF        .db $FF
  $A565  FF        .db $FF
  $A566  DF        .db $DF
  $A567  DF        .db $DF
  $A568  00        BRK
  $A569  00        BRK
  $A56A  00        BRK
  $A56B  00        BRK
  $A56C  00        BRK
  $A56D  00        BRK
  $A56E  DF        .db $DF
  $A56F  DF        .db $DF
  $A570  4A        LSR
  $A571  00        BRK
  $A572  7F        .db $7F
  $A573  FF        .db $FF
  $A574  7F        .db $7F
  $A575  FF        .db $FF
  $A576  7F        .db $7F
  $A577  FF        .db $FF
  $A578  4A        LSR
  $A579  00        BRK
  $A57A  00        BRK
  $A57B  00        BRK
  $A57C  00        BRK
  $A57D  00        BRK
  $A57E  00        BRK
  $A57F  00        BRK
  $A580  E1 DC     SBC ($DC,X)
  $A582  A6 42     LDX $42
  $A584  02        .db $02
  $A585  02        .db $02
  $A586  02        .db $02
  $A587  22        .db $22
  $A588  00        BRK
  $A589  1C        .db $1C
  $A58A  26 42     ROL $42
  $A58C  32        .db $32
  $A58D  1A        .db $1A
  $A58E  4A        LSR
  $A58F  62        .db $62
  $A590  22        .db $22
  $A591  02        .db $02
  $A592  42        .db $42
  $A593  62        .db $62
  $A594  22        .db $22
  $A595  02        .db $02
  $A596  42        .db $42
  $A597  62        .db $62
  $A598  32        .db $32
  $A599  1A        .db $1A
  $A59A  4A        LSR
  $A59B  62        .db $62
  $A59C  32        .db $32
  $A59D  1A        .db $1A
  $A59E  4A        LSR
  $A59F  62        .db $62
  $A5A0  F0 C0     BEQ $A562
  $A5A2  07        .db $07
  $A5A3  1E 38 00  ASL $0038,X
  $A5A6  00        BRK
  $A5A7  00        BRK
  $A5A8  00        BRK
  $A5A9  0F        .db $0F
  $A5AA  3F        .db $3F
  $A5AB  7E FE F8  ROR $F8FE,X
  $A5AE  08        PHP
  $A5AF  3E 00 00  ROL $0000,X
  $A5B2  7C        .db $7C
  $A5B3  FE FE 00  INC $00FE,X
  $A5B6  F2        .db $F2
  $A5B7  FE FE 83  INC $83FE,X
  $A5BA  31 60     AND ($60),Y
  $A5BC  00        BRK
  $A5BD  00        BRK
  $A5BE  F2        .db $F2
  $A5BF  FE 0F 03  INC $030F,X
  $A5C2  00        BRK
  $A5C3  00        BRK
  $A5C4  00        BRK
  $A5C5  00        BRK
  $A5C6  00        BRK

L_A5C7:
  $A5C7  00        BRK
  $A5C8  00        BRK
  $A5C9  F0 FC     BEQ $A5C7
  $A5CB  7E 7F 1F  ROR $1F7F,X
  $A5CE  10 7C     BPL $A64C
  $A5D0  00        BRK
  $A5D1  00        BRK
  $A5D2  3E 7F 7F  ROL $7F7F,X
  $A5D5  00        BRK
  $A5D6  4F        .db $4F
  $A5D7  7F        .db $7F
  $A5D8  7F        .db $7F
  $A5D9  C1 98     CMP ($98,X)
  $A5DB  30 00     BMI $A5DD

L_A5DD:
  $A5DD  00        BRK
  $A5DE  4F        .db $4F
  $A5DF  7F        .db $7F
  $A5E0  87        .db $87
  $A5E1  3B        .db $3B
  $A5E2  65 42     ADC $42
  $A5E4  40        RTI
  $A5E5  40        RTI
  $A5E6  40        RTI
  $A5E7  44        .db $44
  $A5E8  00        BRK
  $A5E9  38        SEC
  $A5EA  64        .db $64
  $A5EB  42        .db $42
  $A5EC  4C 58 52  JMP $5258
  $A5EF  46 44     LSR $44
  $A5F1  40        RTI
  $A5F2  42        .db $42
  $A5F3  46 44     LSR $44
  $A5F5  40        RTI
  $A5F6  42        .db $42
  $A5F7  46 4C     LSR $4C
  $A5F9  58        CLI
  $A5FA  52        .db $52
  $A5FB  46 4C     LSR $4C
  $A5FD  58        CLI
  $A5FE  52        .db $52
  $A5FF  46 FF     LSR $FF
  $A601  FF        .db $FF
  $A602  FF        .db $FF
  $A603  FF        .db $FF
  $A604  FF        .db $FF
  $A605  FF        .db $FF
  $A606  FF        .db $FF
  $A607  FF        .db $FF
  $A608  00        BRK
  $A609  00        BRK
  $A60A  00        BRK
  $A60B  00        BRK
  $A60C  00        BRK
  $A60D  00        BRK
  $A60E  01 03     ORA ($03,X)
  $A610  FF        .db $FF
  $A611  FF        .db $FF
  $A612  FF        .db $FF
  $A613  FF        .db $FF
  $A614  FF        .db $FF
  $A615  FF        .db $FF
  $A616  FF        .db $FF
  $A617  FF        .db $FF
  $A618  03        .db $03
  $A619  03        .db $03
  $A61A  03        .db $03
  $A61B  03        .db $03
  $A61C  03        .db $03
  $A61D  03        .db $03
  $A61E  03        .db $03
  $A61F  03        .db $03
  $A620  FF        .db $FF
  $A621  FF        .db $FF
  $A622  FF        .db $FF
  $A623  FF        .db $FF
  $A624  FF        .db $FF
  $A625  FF        .db $FF
  $A626  FF        .db $FF
  $A627  FF        .db $FF
  $A628  00        BRK
  $A629  00        BRK
  $A62A  00        BRK
  $A62B  00        BRK
  $A62C  00        BRK
  $A62D  00        BRK
  $A62E  FF        .db $FF
  $A62F  FF        .db $FF
  $A630  AA        TAX
  $A631  00        BRK
  $A632  9F        .db $9F
  $A633  3F        .db $3F
  $A634  BF        .db $BF
  $A635  3F        .db $3F
  $A636  BF        .db $BF
  $A637  3F        .db $3F
  $A638  AA        TAX
  $A639  00        BRK
  $A63A  80        .db $80
  $A63B  00        BRK
  $A63C  80        .db $80
  $A63D  00        BRK
  $A63E  80        .db $80
  $A63F  00        BRK
  $A640  FF        .db $FF
  $A641  FF        .db $FF
  $A642  FF        .db $FF
  $A643  FF        .db $FF
  $A644  FF        .db $FF
  $A645  FF        .db $FF
  $A646  FF        .db $FF
  $A647  FF        .db $FF
  $A648  00        BRK
  $A649  00        BRK
  $A64A  00        BRK
  $A64B  00        BRK

L_A64C:
  $A64C  00        BRK
  $A64D  00        BRK
  $A64E  FF        .db $FF
  $A64F  FF        .db $FF
  $A650  AA        TAX
  $A651  00        BRK
  $A652  FF        .db $FF
  $A653  FF        .db $FF
  $A654  FF        .db $FF
  $A655  FF        .db $FF
  $A656  FF        .db $FF
  $A657  FF        .db $FF
  $A658  AA        TAX
  $A659  00        BRK
  $A65A  00        BRK
  $A65B  00        BRK
  $A65C  00        BRK
  $A65D  00        BRK
  $A65E  00        BRK
  $A65F  00        BRK
  $A660  FF        .db $FF
  $A661  FF        .db $FF
  $A662  FF        .db $FF
  $A663  FF        .db $FF
  $A664  FF        .db $FF
  $A665  FF        .db $FF
  $A666  FF        .db $FF
  $A667  FF        .db $FF
  $A668  00        BRK
  $A669  00        BRK
  $A66A  00        BRK
  $A66B  00        BRK
  $A66C  00        BRK
  $A66D  00        BRK
  $A66E  FF        .db $FF
  $A66F  FF        .db $FF
  $A670  AA        TAX
  $A671  00        BRK
  $A672  FF        .db $FF
  $A673  FF        .db $FF
  $A674  FF        .db $FF
  $A675  FF        .db $FF
  $A676  FF        .db $FF
  $A677  FF        .db $FF
  $A678  AA        TAX
  $A679  00        BRK
  $A67A  00        BRK
  $A67B  00        BRK
  $A67C  00        BRK
  $A67D  00        BRK
  $A67E  00        BRK
  $A67F  00        BRK
  $A680  FF        .db $FF
  $A681  FF        .db $FF
  $A682  FF        .db $FF
  $A683  FF        .db $FF
  $A684  FF        .db $FF
  $A685  FF        .db $FF
  $A686  FF        .db $FF
  $A687  FF        .db $FF
  $A688  00        BRK
  $A689  00        BRK
  $A68A  00        BRK
  $A68B  00        BRK
  $A68C  00        BRK
  $A68D  00        BRK
  $A68E  FF        .db $FF
  $A68F  FF        .db $FF
  $A690  AB        .db $AB
  $A691  03        .db $03
  $A692  FB        .db $FB
  $A693  FF        .db $FF
  $A694  FF        .db $FF
  $A695  FF        .db $FF
  $A696  FF        .db $FF
  $A697  FF        .db $FF
  $A698  AB        .db $AB
  $A699  03        .db $03
  $A69A  03        .db $03
  $A69B  03        .db $03
  $A69C  03        .db $03
  $A69D  03        .db $03
  $A69E  03        .db $03
  $A69F  03        .db $03
  $A6A0  FF        .db $FF
  $A6A1  FF        .db $FF
  $A6A2  FF        .db $FF
  $A6A3  FF        .db $FF
  $A6A4  FF        .db $FF
  $A6A5  FF        .db $FF
  $A6A6  7F        .db $7F
  $A6A7  BF        .db $BF
  $A6A8  00        BRK
  $A6A9  00        BRK
  $A6AA  00        BRK
  $A6AB  00        BRK
  $A6AC  00        BRK
  $A6AD  00        BRK
  $A6AE  00        BRK
  $A6AF  80        .db $80
  $A6B0  BF        .db $BF
  $A6B1  3F        .db $3F
  $A6B2  BF        .db $BF
  $A6B3  3F        .db $3F
  $A6B4  BF        .db $BF
  $A6B5  3F        .db $3F
  $A6B6  BF        .db $BF
  $A6B7  3F        .db $3F
  $A6B8  80        .db $80
  $A6B9  00        BRK
  $A6BA  80        .db $80
  $A6BB  00        BRK
  $A6BC  80        .db $80
  $A6BD  00        BRK
  $A6BE  80        .db $80
  $A6BF  00        BRK
  $A6C0  FF        .db $FF
  $A6C1  FF        .db $FF
  $A6C2  FF        .db $FF
  $A6C3  FF        .db $FF
  $A6C4  FF        .db $FF
  $A6C5  FF        .db $FF
  $A6C6  FF        .db $FF
  $A6C7  FF        .db $FF
  $A6C8  03        .db $03
  $A6C9  03        .db $03
  $A6CA  03        .db $03
  $A6CB  03        .db $03
  $A6CC  03        .db $03
  $A6CD  03        .db $03
  $A6CE  03        .db $03
  $A6CF  03        .db $03
  $A6D0  FD FE FF  SBC $FFFE,X
  $A6D3  FF        .db $FF
  $A6D4  FF        .db $FF
  $A6D5  FF        .db $FF
  $A6D6  FF        .db $FF
  $A6D7  FF        .db $FF
  $A6D8  00        BRK
  $A6D9  00        BRK
  $A6DA  00        BRK
  $A6DB  00        BRK
  $A6DC  00        BRK
  $A6DD  00        BRK
  $A6DE  00        BRK
  $A6DF  00        BRK
  $A6E0  BF        .db $BF
  $A6E1  3F        .db $3F
  $A6E2  BF        .db $BF
  $A6E3  3F        .db $3F
  $A6E4  BF        .db $BF
  $A6E5  1F        .db $1F
  $A6E6  FF        .db $FF
  $A6E7  FF        .db $FF
  $A6E8  80        .db $80
  $A6E9  00        BRK
  $A6EA  80        .db $80
  $A6EB  00        BRK
  $A6EC  80        .db $80
  $A6ED  00        BRK
  $A6EE  FF        .db $FF
  $A6EF  FF        .db $FF
  $A6F0  AA        TAX
  $A6F1  00        BRK
  $A6F2  FF        .db $FF
  $A6F3  FF        .db $FF
  $A6F4  FF        .db $FF
  $A6F5  FF        .db $FF
  $A6F6  FF        .db $FF
  $A6F7  FF        .db $FF
  $A6F8  AA        TAX
  $A6F9  00        BRK
  $A6FA  00        BRK
  $A6FB  00        BRK
  $A6FC  00        BRK
  $A6FD  00        BRK
  $A6FE  00        BRK
  $A6FF  00        BRK
  $A700  FF        .db $FF
  $A701  FF        .db $FF
  $A702  FF        .db $FF
  $A703  FF        .db $FF
  $A704  FF        .db $FF
  $A705  FF        .db $FF
  $A706  FF        .db $FF
  $A707  FF        .db $FF
  $A708  03        .db $03
  $A709  03        .db $03
  $A70A  03        .db $03
  $A70B  03        .db $03
  $A70C  03        .db $03
  $A70D  03        .db $03
  $A70E  03        .db $03
  $A70F  03        .db $03
  $A710  FF        .db $FF
  $A711  FF        .db $FF
  $A712  FF        .db $FF
  $A713  FF        .db $FF
  $A714  FF        .db $FF
  $A715  FF        .db $FF
  $A716  FF        .db $FF
  $A717  FF        .db $FF
  $A718  03        .db $03
  $A719  03        .db $03
  $A71A  03        .db $03
  $A71B  03        .db $03
  $A71C  03        .db $03
  $A71D  03        .db $03
  $A71E  03        .db $03
  $A71F  03        .db $03
  $A720  BF        .db $BF
  $A721  3F        .db $3F
  $A722  BF        .db $BF
  $A723  3F        .db $3F
  $A724  BF        .db $BF
  $A725  3F        .db $3F
  $A726  BF        .db $BF
  $A727  3F        .db $3F
  $A728  80        .db $80
  $A729  00        BRK
  $A72A  80        .db $80
  $A72B  00        BRK
  $A72C  80        .db $80
  $A72D  00        BRK
  $A72E  80        .db $80
  $A72F  00        BRK
  $A730  BF        .db $BF
  $A731  3F        .db $3F
  $A732  BF        .db $BF
  $A733  3F        .db $3F
  $A734  BF        .db $BF
  $A735  3F        .db $3F
  $A736  BF        .db $BF
  $A737  3F        .db $3F
  $A738  80        .db $80
  $A739  00        BRK
  $A73A  80        .db $80
  $A73B  00        BRK
  $A73C  80        .db $80
  $A73D  00        BRK
  $A73E  80        .db $80
  $A73F  00        BRK
  $A740  FF        .db $FF
  $A741  FF        .db $FF
  $A742  FF        .db $FF
  $A743  FF        .db $FF
  $A744  FF        .db $FF
  $A745  FF        .db $FF
  $A746  FF        .db $FF
  $A747  FF        .db $FF
  $A748  03        .db $03
  $A749  03        .db $03
  $A74A  03        .db $03
  $A74B  03        .db $03
  $A74C  03        .db $03
  $A74D  07        .db $07
  $A74E  FF        .db $FF
  $A74F  FF        .db $FF
  $A750  AA        TAX
  $A751  00        BRK
  $A752  FF        .db $FF
  $A753  FF        .db $FF
  $A754  FF        .db $FF
  $A755  FF        .db $FF
  $A756  FF        .db $FF
  $A757  FF        .db $FF
  $A758  AA        TAX
  $A759  00        BRK
  $A75A  00        BRK
  $A75B  00        BRK
  $A75C  00        BRK
  $A75D  00        BRK
  $A75E  00        BRK
  $A75F  00        BRK
  $A760  BF        .db $BF
  $A761  3F        .db $3F
  $A762  BF        .db $BF
  $A763  3F        .db $3F
  $A764  BF        .db $BF
  $A765  3F        .db $3F
  $A766  BF        .db $BF
  $A767  3F        .db $3F
  $A768  80        .db $80
  $A769  00        BRK
  $A76A  80        .db $80
  $A76B  00        BRK
  $A76C  80        .db $80
  $A76D  00        BRK
  $A76E  80        .db $80
  $A76F  00        BRK
  $A770  3F        .db $3F
  $A771  7F        .db $7F
  $A772  FF        .db $FF
  $A773  FF        .db $FF
  $A774  FF        .db $FF
  $A775  FF        .db $FF
  $A776  FF        .db $FF
  $A777  FF        .db $FF
  $A778  00        BRK
  $A779  00        BRK
  $A77A  00        BRK
  $A77B  00        BRK
  $A77C  00        BRK
  $A77D  00        BRK
  $A77E  00        BRK
  $A77F  00        BRK
  $A780  02        .db $02
  $A781  02        .db $02
  $A782  02        .db $02
  $A783  06 0C     ASL $0C
  $A785  30 40     BMI $A7C7
  $A787  80        .db $80
  $A788  32        .db $32
  $A789  1A        .db $1A
  $A78A  4A        LSR
  $A78B  66 4C     ROR $4C
  $A78D  33        .db $33
  $A78E  47        .db $47
  $A78F  0F        .db $0F
  $A790  C9 C2     CMP #$C2
  $A792  C2        .db $C2
  $A793  E2        .db $E2
  $A794  C2        .db $C2
  $A795  A2 00     LDX #$00
  $A797  01 1B     ORA ($1B,X)
  $A799  12        .db $12
  $A79A  1E 0E 06  ASL $060E,X
  $A79D  22        .db $22
  $A79E  00        BRK
  $A79F  00        BRK
  $A7A0  7C        .db $7C
  $A7A1  38        SEC
  $A7A2  00        BRK
  $A7A3  00        BRK
  $A7A4  1E 3C 00  ASL $003C,X
  $A7A7  FF        .db $FF
  $A7A8  7C        .db $7C
  $A7A9  38        SEC
  $A7AA  07        .db $07
  $A7AB  3C        .db $3C
  $A7AC  FE FF FF  INC $FFFF,X
  $A7AF  FF        .db $FF
  $A7B0  00        BRK
  $A7B1  00        BRK
  $A7B2  00        BRK
  $A7B3  00        BRK
  $A7B4  00        BRK
  $A7B5  00        BRK
  $A7B6  00        BRK
  $A7B7  FF        .db $FF
  $A7B8  00        BRK
  $A7B9  00        BRK
  $A7BA  00        BRK
  $A7BB  00        BRK
  $A7BC  00        BRK
  $A7BD  00        BRK
  $A7BE  00        BRK
  $A7BF  00        BRK
  $A7C0  3E 1C 00  ROL $001C,X
  $A7C3  00        BRK
  $A7C4  00        BRK
  $A7C5  00        BRK
  $A7C6  00        BRK

L_A7C7:
  $A7C7  FF        .db $FF
  $A7C8  3E 1C E0  ROL $E01C,X

L_A7CB:
  $A7CB  3C        .db $3C
  $A7CC  7F        .db $7F
  $A7CD  FF        .db $FF
  $A7CE  FF        .db $FF
  $A7CF  FF        .db $FF
  $A7D0  00        BRK
  $A7D1  00        BRK
  $A7D2  00        BRK
  $A7D3  00        BRK
  $A7D4  00        BRK
  $A7D5  00        BRK
  $A7D6  00        BRK
  $A7D7  FF        .db $FF
  $A7D8  00        BRK
  $A7D9  00        BRK
  $A7DA  00        BRK
  $A7DB  00        BRK
  $A7DC  00        BRK
  $A7DD  00        BRK
  $A7DE  00        BRK
  $A7DF  00        BRK
  $A7E0  40        RTI
  $A7E1  40        RTI
  $A7E2  40        RTI
  $A7E3  60        RTS
  $A7E4  30 0C     BMI $A7F2
  $A7E6  02        .db $02
  $A7E7  01 4C     ORA ($4C,X)
  $A7E9  58        CLI
  $A7EA  52        .db $52
  $A7EB  66 32     ROR $32
  $A7ED  CC E2 F0  CPY $F0E2
  $A7F0  A3        .db $A3
  $A7F1  43        .db $43

L_A7F2:
  $A7F2  43        .db $43
  $A7F3  47        .db $47
  $A7F4  43        .db $43
  $A7F5  45 00     EOR $00
  $A7F7  80        .db $80
  $A7F8  E8        INX
  $A7F9  48        PHA
  $A7FA  78        SEI
  $A7FB  70 60     BVS $A85D
  $A7FD  44        .db $44
  $A7FE  00        BRK
  $A7FF  00        BRK
  $A800  00        BRK
  $A801  FF        .db $FF
  $A802  AA        TAX
  $A803  00        BRK
  $A804  00        BRK
  $A805  00        BRK
  $A806  03        .db $03
  $A807  63        .db $63
  $A808  FF        .db $FF
  $A809  00        BRK
  $A80A  55 FF     EOR $FF,X
  $A80C  FF        .db $FF
  $A80D  00        BRK
  $A80E  03        .db $03
  $A80F  9B        .db $9B
  $A810  43        .db $43
  $A811  63        .db $63
  $A812  00        BRK
  $A813  FF        .db $FF
  $A814  AA        TAX
  $A815  00        BRK
  $A816  00        BRK
  $A817  00        BRK
  $A818  BB        .db $BB
  $A819  9B        .db $9B
  $A81A  FF        .db $FF
  $A81B  00        BRK
  $A81C  55 FF     EOR $FF,X
  $A81E  FF        .db $FF
  $A81F  00        BRK
  $A820  18        CLC
  $A821  F0 A8     BEQ $A7CB
  $A823  00        BRK
  $A824  00        BRK
  $A825  01 FF     ORA ($FF,X)
  $A827  FF        .db $FF
  $A828  E6 0E     INC $0E
  $A82A  56 FE     LSR $FE,X
  $A82C  FC        .db $FC
  $A82D  01 FF     ORA ($FF,X)
  $A82F  FF        .db $FF
  $A830  FF        .db $FF
  $A831  FF        .db $FF
  $A832  01 F0     ORA ($F0,X)
  $A834  B8        CLV
  $A835  10 18     BPL $A84F
  $A837  10 FF     BPL $A838
  $A839  FF        .db $FF
  $A83A  FD 0E 46  SBC $460E,X
  $A83D  EE E6 2E  INC $2EE6
  $A840  60        RTS
  $A841  7F        .db $7F
  $A842  15 00     ORA $00,X
  $A844  00        BRK
  $A845  80        .db $80
  $A846  FF        .db $FF
  $A847  FF        .db $FF
  $A848  9F        .db $9F
  $A849  80        .db $80
  $A84A  EA        NOP
  $A84B  FF        .db $FF
  $A84C  7F        .db $7F
  $A84D  80        .db $80
  $A84E  FF        .db $FF

L_A84F:
  $A84F  FF        .db $FF
  $A850  FF        .db $FF
  $A851  FF        .db $FF
  $A852  80        .db $80
  $A853  3F        .db $3F
  $A854  6A        ROR
  $A855  40        RTI
  $A856  60        RTS
  $A857  40        RTI
  $A858  FF        .db $FF
  $A859  FF        .db $FF
  $A85A  FF        .db $FF
  $A85B  C0 95     CPY #$95

L_A85D:
  $A85D  BF        .db $BF
  $A85E  9F        .db $9F
  $A85F  B8        CLV
  $A860  18        CLC
  $A861  D0 58     BNE $A8BB
  $A863  10 18     BPL $A87D
  $A865  10 D8     BPL $A83F
  $A867  D0 E6     BNE $A84F
  $A869  2E A6 EE  ROL $EEA6
  $A86C  E6 2E     INC $2E
  $A86E  E6 EE     INC $EE
  $A870  D8        CLD
  $A871  D0 00     BNE $A873

L_A873:
  $A873  FF        .db $FF
  $A874  AA        TAX
  $A875  00        BRK
  $A876  00        BRK
  $A877  00        BRK
  $A878  E6 EE     INC $EE
  $A87A  FF        .db $FF

L_A87B:
  $A87B  00        BRK
  $A87C  55 FF     EOR $FF,X

L_A87E:
  $A87E  FF        .db $FF
  $A87F  00        BRK

L_A880:
  $A880  07        .db $07
  $A881  C3        .db $C3
  $A882  63        .db $63
  $A883  43        .db $43
  $A884  63        .db $63
  $A885  43        .db $43
  $A886  63        .db $63
  $A887  43        .db $43
  $A888  F7        .db $F7
  $A889  3B        .db $3B
  $A88A  9B        .db $9B
  $A88B  BB        .db $BB
  $A88C  9B        .db $9B
  $A88D  BB        .db $BB
  $A88E  9B        .db $9B
  $A88F  BB        .db $BB

L_A890:
  $A890  63        .db $63
  $A891  43        .db $43
  $A892  60        RTS
  $A893  41 60     EOR ($60,X)
  $A895  40        RTI
  $A896  60        RTS
  $A897  40        RTI
  $A898  9B        .db $9B
  $A899  BB        .db $BB
  $A89A  99 B8 99  STA $99B8,Y
  $A89D  B9 99 B8  LDA $B899,Y
  $A8A0  E0 CF     CPX #$CF
  $A8A2  DA        .db $DA
  $A8A3  D8        CLD
  $A8A4  D0 D8     BNE $A87E
  $A8A6  D0 D8     BNE $A880
  $A8A8  FF        .db $FF
  $A8A9  F0 E5     BEQ $A890
  $A8AB  E7        .db $E7
  $A8AC  EF        .db $EF
  $A8AD  E6 EE     INC $EE
  $A8AF  E6 D0     INC $D0
  $A8B1  D8        CLD
  $A8B2  00        BRK
  $A8B3  FF        .db $FF
  $A8B4  AA        TAX
  $A8B5  00        BRK
  $A8B6  00        BRK
  $A8B7  00        BRK
  $A8B8  EE E6 FF  INC $FFE6

L_A8BB:
  $A8BB  00        BRK
  $A8BC  55 FF     EOR $FF,X
  $A8BE  FF        .db $FF

L_A8BF:
  $A8BF  00        BRK
  $A8C0  00        BRK
  $A8C1  FF        .db $FF
  $A8C2  AA        TAX
  $A8C3  00        BRK
  $A8C4  00        BRK
  $A8C5  00        BRK
  $A8C6  03        .db $03
  $A8C7  63        .db $63
  $A8C8  FF        .db $FF
  $A8C9  00        BRK
  $A8CA  55 FF     EOR $FF,X
  $A8CC  FF        .db $FF
  $A8CD  00        BRK
  $A8CE  03        .db $03

L_A8CF:
  $A8CF  9B        .db $9B
  $A8D0  43        .db $43
  $A8D1  63        .db $63
  $A8D2  43        .db $43
  $A8D3  E3        .db $E3
  $A8D4  A3        .db $A3
  $A8D5  03        .db $03
  $A8D6  03        .db $03
  $A8D7  07        .db $07
  $A8D8  BB        .db $BB
  $A8D9  9B        .db $9B
  $A8DA  BB        .db $BB
  $A8DB  1B        .db $1B
  $A8DC  5B        .db $5B
  $A8DD  FB        .db $FB
  $A8DE  F3        .db $F3
  $A8DF  07        .db $07
  $A8E0  18        CLC
  $A8E1  D0 98     BNE $A87B
  $A8E3  10 18     BPL $A8FD
  $A8E5  10 D8     BPL $A8BF
  $A8E7  D0 E6     BNE $A8CF
  $A8E9  2E 66 EE  ROL $EE66
  $A8EC  E6 2E     INC $2E
  $A8EE  E6 EE     INC $EE
  $A8F0  D8        CLD
  $A8F1  D0 D8     BNE $A8CB
  $A8F3  DF        .db $DF
  $A8F4  CA        DEX
  $A8F5  C0 C0     CPY #$C0
  $A8F7  E0 E6     CPX #$E6
  $A8F9  EE E7 E0  INC $E0E7
  $A8FC  F5 FF     SBC $FF,X
  $A8FE  DF        .db $DF
  $A8FF  E0 00     CPX #$00
  $A901  FF        .db $FF
  $A902  AA        TAX
  $A903  00        BRK
  $A904  00        BRK
  $A905  00        BRK
  $A906  FF        .db $FF
  $A907  FF        .db $FF
  $A908  FF        .db $FF
  $A909  00        BRK
  $A90A  55 FF     EOR $FF,X
  $A90C  FF        .db $FF
  $A90D  00        BRK
  $A90E  FF        .db $FF
  $A90F  FF        .db $FF
  $A910  FF        .db $FF
  $A911  FF        .db $FF
  $A912  00        BRK
  $A913  FF        .db $FF
  $A914  AA        TAX
  $A915  00        BRK
  $A916  00        BRK
  $A917  00        BRK
  $A918  FF        .db $FF
  $A919  FF        .db $FF
  $A91A  FF        .db $FF
  $A91B  00        BRK
  $A91C  55 FF     EOR $FF,X
  $A91E  FF        .db $FF
  $A91F  00        BRK
  $A920  00        BRK
  $A921  FF        .db $FF
  $A922  AA        TAX
  $A923  00        BRK
  $A924  00        BRK
  $A925  00        BRK
  $A926  FF        .db $FF
  $A927  FF        .db $FF
  $A928  FF        .db $FF
  $A929  00        BRK
  $A92A  55 FF     EOR $FF,X
  $A92C  FF        .db $FF
  $A92D  00        BRK
  $A92E  FF        .db $FF
  $A92F  FF        .db $FF
  $A930  FF        .db $FF
  $A931  FF        .db $FF
  $A932  00        BRK
  $A933  FF        .db $FF
  $A934  AA        TAX
  $A935  00        BRK
  $A936  00        BRK
  $A937  00        BRK
  $A938  FF        .db $FF
  $A939  FF        .db $FF
  $A93A  FF        .db $FF
  $A93B  00        BRK
  $A93C  55 FF     EOR $FF,X
  $A93E  FF        .db $FF
  $A93F  00        BRK
  $A940  FF        .db $FF
  $A941  FF        .db $FF
  $A942  FF        .db $FF
  $A943  FF        .db $FF
  $A944  FF        .db $FF
  $A945  FF        .db $FF
  $A946  FF        .db $FF
  $A947  FF        .db $FF
  $A948  00        BRK
  $A949  00        BRK
  $A94A  00        BRK
  $A94B  00        BRK
  $A94C  01 01     ORA ($01,X)
  $A94E  01 07     ORA ($07,X)
  $A950  FF        .db $FF
  $A951  FF        .db $FF
  $A952  FF        .db $FF
  $A953  FF        .db $FF
  $A954  FF        .db $FF
  $A955  FF        .db $FF
  $A956  FF        .db $FF
  $A957  FF        .db $FF
  $A958  1F        .db $1F
  $A959  3F        .db $3F
  $A95A  3F        .db $3F
  $A95B  7F        .db $7F
  $A95C  7F        .db $7F
  $A95D  7F        .db $7F
  $A95E  FF        .db $FF
  $A95F  FF        .db $FF
  $A960  FF        .db $FF
  $A961  FF        .db $FF
  $A962  FF        .db $FF
  $A963  FF        .db $FF
  $A964  FF        .db $FF
  $A965  FF        .db $FF
  $A966  FF        .db $FF
  $A967  FF        .db $FF
  $A968  1F        .db $1F
  $A969  7F        .db $7F
  $A96A  FF        .db $FF
  $A96B  FF        .db $FF
  $A96C  FF        .db $FF
  $A96D  FF        .db $FF
  $A96E  FF        .db $FF
  $A96F  FF        .db $FF
  $A970  FF        .db $FF
  $A971  FF        .db $FF
  $A972  FF        .db $FF
  $A973  FF        .db $FF
  $A974  FF        .db $FF
  $A975  FF        .db $FF
  $A976  FF        .db $FF
  $A977  FF        .db $FF
  $A978  FF        .db $FF
  $A979  FF        .db $FF
  $A97A  FF        .db $FF
  $A97B  FF        .db $FF
  $A97C  FF        .db $FF
  $A97D  FF        .db $FF
  $A97E  FF        .db $FF
  $A97F  FF        .db $FF
  $A980  FF        .db $FF
  $A981  FF        .db $FF
  $A982  FF        .db $FF
  $A983  FF        .db $FF
  $A984  FF        .db $FF
  $A985  FF        .db $FF
  $A986  FF        .db $FF
  $A987  FF        .db $FF
  $A988  FF        .db $FF
  $A989  FF        .db $FF
  $A98A  FF        .db $FF
  $A98B  7F        .db $7F
  $A98C  7F        .db $7F
  $A98D  3F        .db $3F
  $A98E  1F        .db $1F
  $A98F  07        .db $07
  $A990  FF        .db $FF
  $A991  FF        .db $FF
  $A992  FF        .db $FF
  $A993  FF        .db $FF
  $A994  FF        .db $FF
  $A995  FF        .db $FF
  $A996  FF        .db $FF
  $A997  FF        .db $FF
  $A998  01 01     ORA ($01,X)
  $A99A  00        BRK
  $A99B  00        BRK
  $A99C  00        BRK

L_A99D:
  $A99D  00        BRK
  $A99E  00        BRK
  $A99F  00        BRK
  $A9A0  FF        .db $FF
  $A9A1  FF        .db $FF
  $A9A2  FF        .db $FF
  $A9A3  FF        .db $FF
  $A9A4  FF        .db $FF
  $A9A5  FF        .db $FF
  $A9A6  FF        .db $FF
  $A9A7  FF        .db $FF
  $A9A8  FF        .db $FF
  $A9A9  FF        .db $FF
  $A9AA  FF        .db $FF
  $A9AB  FF        .db $FF
  $A9AC  FF        .db $FF
  $A9AD  FF        .db $FF
  $A9AE  FF        .db $FF
  $A9AF  FF        .db $FF
  $A9B0  FF        .db $FF
  $A9B1  FF        .db $FF
  $A9B2  FF        .db $FF
  $A9B3  FF        .db $FF
  $A9B4  FF        .db $FF
  $A9B5  FF        .db $FF
  $A9B6  FF        .db $FF
  $A9B7  FF        .db $FF
  $A9B8  FF        .db $FF
  $A9B9  FF        .db $FF
  $A9BA  FF        .db $FF
  $A9BB  FF        .db $FF
  $A9BC  7F        .db $7F
  $A9BD  3F        .db $3F
  $A9BE  0F        .db $0F

L_A9BF:
  $A9BF  01 00     ORA ($00,X)
  $A9C1  FF        .db $FF
  $A9C2  AA        TAX
  $A9C3  00        BRK
  $A9C4  00        BRK
  $A9C5  00        BRK
  $A9C6  FF        .db $FF
  $A9C7  FF        .db $FF
  $A9C8  FF        .db $FF
  $A9C9  00        BRK
  $A9CA  55 FF     EOR $FF,X
  $A9CC  FF        .db $FF
  $A9CD  00        BRK
  $A9CE  FF        .db $FF
  $A9CF  FF        .db $FF
  $A9D0  FF        .db $FF
  $A9D1  FF        .db $FF
  $A9D2  00        BRK
  $A9D3  FF        .db $FF
  $A9D4  AA        TAX
  $A9D5  00        BRK
  $A9D6  00        BRK
  $A9D7  00        BRK
  $A9D8  FF        .db $FF
  $A9D9  FF        .db $FF
  $A9DA  FF        .db $FF
  $A9DB  00        BRK
  $A9DC  55 FF     EOR $FF,X
  $A9DE  FF        .db $FF
  $A9DF  00        BRK
  $A9E0  01 F0     ORA ($F0,X)
  $A9E2  B8        CLV
  $A9E3  10 18     BPL $A9FD
  $A9E5  10 D8     BPL $A9BF
  $A9E7  D0 FD     BNE $A9E6
  $A9E9  0E 46 EE  ASL $EE46
  $A9EC  E6 2E     INC $2E
  $A9EE  E6 EE     INC $EE
  $A9F0  D8        CLD
  $A9F1  D0 18     BNE $AA0B
  $A9F3  F0 A8     BEQ $A99D
  $A9F5  00        BRK
  $A9F6  00        BRK
  $A9F7  01 E6     ORA ($E6,X)
  $A9F9  EE E6 0E  INC $0EE6
  $A9FC  56 FE     LSR $FE,X
  $A9FE  FC        .db $FC
  $A9FF  01 18     ORA ($18,X)
  $AA01  18        CLC
  $AA02  18        CLC
  $AA03  1F        .db $1F

L_AA04:
  $AA04  38        SEC
  $AA05  30 30     BMI $AA37
  $AA07  70 1F     BVS $AA28
  $AA09  1F        .db $1F
  $AA0A  1F        .db $1F

L_AA0B:
  $AA0B  1F        .db $1F
  $AA0C  3F        .db $3F
  $AA0D  3F        .db $3F
  $AA0E  3F        .db $3F
  $AA0F  7F        .db $7F
  $AA10  02        .db $02
  $AA11  12        .db $12
  $AA12  E6 84     INC $84
  $AA14  0C        .db $0C
  $AA15  08        PHP
  $AA16  18        CLC

L_AA17:
  $AA17  30 FE     BMI $AA17
  $AA19  FE FE FC  INC $FCFE,X
  $AA1C  FC        .db $FC
  $AA1D  F8        SED
  $AA1E  F8        SED
  $AA1F  F0 00     BEQ $AA21

L_AA21:
  $AA21  00        BRK
  $AA22  00        BRK
  $AA23  01 03     ORA ($03,X)
  $AA25  07        .db $07
  $AA26  1F        .db $1F

L_AA27:
  $AA27  7F        .db $7F

L_AA28:
  $AA28  00        BRK
  $AA29  00        BRK
  $AA2A  00        BRK
  $AA2B  01 02     ORA ($02,X)
  $AA2D  04        .db $04
  $AA2E  18        CLC
  $AA2F  60        RTS
  $AA30  00        BRK
  $AA31  00        BRK
  $AA32  00        BRK
  $AA33  C0 E0     CPY #$E0
  $AA35  F0 F0     BEQ $AA27

L_AA37:
  $AA37  E0 00     CPX #$00
  $AA39  00        BRK
  $AA3A  00        BRK
  $AA3B  C0 60     CPY #$60
  $AA3D  30 30     BMI $AA6F
  $AA3F  20 00 00  JSR $0000
  $AA42  01 03     ORA ($03,X)
  $AA44  07        .db $07
  $AA45  0E 3C 74  ASL $743C
  $AA48  00        BRK
  $AA49  00        BRK
  $AA4A  01 03     ORA ($03,X)
  $AA4C  07        .db $07
  $AA4D  0F        .db $0F
  $AA4E  3F        .db $3F
  $AA4F  7F        .db $7F
  $AA50  79 C7 80  ADC $80C7,Y
  $AA53  81 42     STA ($42,X)
  $AA55  34        .db $34
  $AA56  18        CLC
  $AA57  60        RTS
  $AA58  7F        .db $7F
  $AA59  FF        .db $FF
  $AA5A  FF        .db $FF
  $AA5B  FF        .db $FF
  $AA5C  FE FC F8  INC $F8FC,X
  $AA5F  E0 A0     CPX #$A0
  $AA61  40        RTI
  $AA62  80        .db $80
  $AA63  00        BRK
  $AA64  00        BRK
  $AA65  00        BRK
  $AA66  00        BRK
  $AA67  00        BRK
  $AA68  E0 C0     CPX #$C0
  $AA6A  80        .db $80
  $AA6B  00        BRK
  $AA6C  00        BRK
  $AA6D  00        BRK
  $AA6E  00        BRK

L_AA6F:
  $AA6F  00        BRK
  $AA70  FF        .db $FF
  $AA71  F8        SED
  $AA72  FF        .db $FF
  $AA73  7F        .db $7F
  $AA74  1F        .db $1F
  $AA75  07        .db $07

L_AA76:
  $AA76  03        .db $03
  $AA77  01 C7     ORA ($C7,X)
  $AA79  8F        .db $8F
  $AA7A  C7        .db $C7
  $AA7B  61 18     ADC ($18,X)
  $AA7D  04        .db $04
  $AA7E  02        .db $02
  $AA7F  01 E0     ORA ($E0,X)
  $AA81  10 81     BPL $AA04
  $AA83  E8        INX
  $AA84  F0 F0     BEQ $AA76
  $AA86  E0 C0     CPX #$C0
  $AA88  E0 F0     CPX #$F0
  $AA8A  FF        .db $FF
  $AA8B  EF        .db $EF
  $AA8C  30 30     BMI $AABE
  $AA8E  60        RTS
  $AA8F  C0 01     CPY #$01
  $AA91  0F        .db $0F
  $AA92  F8        SED
  $AA93  00        BRK
  $AA94  FE 00 00  INC $0000,X
  $AA97  00        BRK
  $AA98  01 0F     ORA ($0F,X)
  $AA9A  FF        .db $FF
  $AA9B  FF        .db $FF
  $AA9C  FE 00 00  INC $0000,X
  $AA9F  00        BRK
  $AAA0  C3        .db $C3
  $AAA1  C6 18     DEC $18
  $AAA3  C0 00     CPY #$00
  $AAA5  00        BRK
  $AAA6  00        BRK
  $AAA7  00        BRK
  $AAA8  FF        .db $FF
  $AAA9  FE F8 C0  INC $C0F8,X
  $AAAC  00        BRK
  $AAAD  00        BRK
  $AAAE  00        BRK
  $AAAF  00        BRK
  $AAB0  80        .db $80
  $AAB1  00        BRK
  $AAB2  00        BRK
  $AAB3  00        BRK
  $AAB4  00        BRK
  $AAB5  00        BRK
  $AAB6  00        BRK
  $AAB7  00        BRK
  $AAB8  80        .db $80
  $AAB9  00        BRK
  $AABA  00        BRK
  $AABB  00        BRK
  $AABC  00        BRK
  $AABD  00        BRK

L_AABE:
  $AABE  00        BRK
  $AABF  00        BRK
  $AAC0  08        PHP
  $AAC1  08        PHP
  $AAC2  0F        .db $0F
  $AAC3  09 08     ORA #$08
  $AAC5  04        .db $04
  $AAC6  04        .db $04
  $AAC7  04        .db $04
  $AAC8  0F        .db $0F
  $AAC9  0F        .db $0F
  $AACA  0F        .db $0F
  $AACB  0F        .db $0F
  $AACC  0F        .db $0F
  $AACD  07        .db $07
  $AACE  07        .db $07
  $AACF  07        .db $07
  $AAD0  02        .db $02
  $AAD1  02        .db $02
  $AAD2  06 C4     ASL $C4
  $AAD4  0C        .db $0C
  $AAD5  08        PHP
  $AAD6  08        PHP
  $AAD7  00        BRK
  $AAD8  FE FE FE  INC $FEFE,X
  $AADB  FC        .db $FC

L_AADC:
  $AADC  FC        .db $FC
  $AADD  F8        SED
  $AADE  F8        SED
  $AADF  F0 07     BEQ $AAE8
  $AAE1  05 04     ORA $04
  $AAE3  04        .db $04
  $AAE4  04        .db $04
  $AAE5  04        .db $04
  $AAE6  0C        .db $0C
  $AAE7  0E 07 07  ASL $0707

L_AAEA:
  $AAEA  07        .db $07
  $AAEB  07        .db $07
  $AAEC  07        .db $07
  $AAED  07        .db $07
  $AAEE  0F        .db $0F
  $AAEF  0F        .db $0F
  $AAF0  00        BRK
  $AAF1  D0 10     BNE $AB03
  $AAF3  00        BRK
  $AAF4  20 00 40  JSR $4000
  $AAF7  00        BRK
  $AAF8  F0 F0     BEQ $AAEA
  $AAFA  F0 E0     BEQ $AADC
  $AAFC  E0 C0     CPX #$C0
  $AAFE  C0 80     CPY #$80
  $AB00  08        PHP
  $AB01  08        PHP
  $AB02  11 10     ORA ($10),Y
  $AB04  12        .db $12
  $AB05  20 24 48  JSR $4824
  $AB08  0F        .db $0F
  $AB09  0F        .db $0F
  $AB0A  1F        .db $1F
  $AB0B  1E 1E 3C  ASL $3C1E,X
  $AB0E  3C        .db $3C
  $AB0F  78        SEI
  $AB10  80        .db $80
  $AB11  00        BRK
  $AB12  00        BRK

L_AB13:
  $AB13  00        BRK
  $AB14  00        BRK
  $AB15  00        BRK
  $AB16  00        BRK
  $AB17  00        BRK
  $AB18  80        .db $80
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
  $AB26  03        .db $03
  $AB27  07        .db $07
  $AB28  00        BRK
  $AB29  00        BRK
  $AB2A  00        BRK
  $AB2B  00        BRK
  $AB2C  00        BRK
  $AB2D  00        BRK
  $AB2E  03        .db $03
  $AB2F  04        .db $04
  $AB30  00        BRK
  $AB31  00        BRK
  $AB32  01 02     ORA ($02,X)
  $AB34  04        .db $04
  $AB35  05 0A     ORA $0A
  $AB37  94 00     STY $00,X
  $AB39  00        BRK

L_AB3A:
  $AB3A  01 03     ORA ($03,X)
  $AB3C  07        .db $07
  $AB3D  07        .db $07
  $AB3E  0E 9C 80  ASL $809C
  $AB41  90 20     BCC $AB63
  $AB43  40        RTI
  $AB44  80        .db $80
  $AB45  00        BRK
  $AB46  00        BRK
  $AB47  00        BRK
  $AB48  F0 F0     BEQ $AB3A
  $AB4A  E0 C0     CPX #$C0
  $AB4C  80        .db $80
  $AB4D  00        BRK
  $AB4E  00        BRK
  $AB4F  00        BRK
  $AB50  07        .db $07
  $AB51  0F        .db $0F
  $AB52  0F        .db $0F
  $AB53  0F        .db $0F
  $AB54  0F        .db $0F
  $AB55  1F        .db $1F
  $AB56  1F        .db $1F
  $AB57  1F        .db $1F
  $AB58  04        .db $04
  $AB59  08        PHP
  $AB5A  08        PHP

L_AB5B:
  $AB5B  09 09     ORA #$09
  $AB5D  18        CLC
  $AB5E  10 10     BPL $AB70
  $AB60  E8        INX
  $AB61  D0 B0     BNE $AB13

L_AB63:
  $AB63  78        SEI
  $AB64  FC        .db $FC
  $AB65  FC        .db $FC
  $AB66  FC        .db $FC
  $AB67  F8        SED
  $AB68  F8        SED
  $AB69  70 F0     BVS $AB5B
  $AB6B  F8        SED
  $AB6C  8C 04 04  STY $0404
  $AB6F  18        CLC

L_AB70:
  $AB70  1F        .db $1F
  $AB71  0F        .db $0F
  $AB72  00        BRK
  $AB73  00        BRK
  $AB74  00        BRK
  $AB75  00        BRK
  $AB76  00        BRK
  $AB77  00        BRK
  $AB78  11 0F     ORA ($0F),Y
  $AB7A  00        BRK
  $AB7B  00        BRK
  $AB7C  00        BRK
  $AB7D  00        BRK
  $AB7E  00        BRK
  $AB7F  00        BRK
  $AB80  E0 00     CPX #$00
  $AB82  00        BRK
  $AB83  00        BRK
  $AB84  00        BRK
  $AB85  00        BRK
  $AB86  00        BRK
  $AB87  00        BRK
  $AB88  E0 00     CPX #$00
  $AB8A  00        BRK
  $AB8B  00        BRK
  $AB8C  00        BRK
  $AB8D  00        BRK
  $AB8E  00        BRK
  $AB8F  00        BRK
  $AB90  00        BRK
  $AB91  60        RTS
  $AB92  E0 F0     CPX #$F0
  $AB94  F0 78     BEQ $AC0E
  $AB96  78        SEI
  $AB97  3C        .db $3C
  $AB98  00        BRK
  $AB99  60        RTS
  $AB9A  E8        INX
  $AB9B  F4        .db $F4
  $AB9C  F6 7B     INC $7B,X
  $AB9E  7B        .db $7B
  $AB9F  3D 00 00  AND $0000,X
  $ABA2  00        BRK
  $ABA3  00        BRK
  $ABA4  00        BRK
  $ABA5  00        BRK
  $ABA6  00        BRK
  $ABA7  00        BRK
  $ABA8  00        BRK
  $ABA9  00        BRK
  $ABAA  00        BRK
  $ABAB  00        BRK
  $ABAC  00        BRK
  $ABAD  00        BRK
  $ABAE  80        .db $80
  $ABAF  C0 3E     CPY #$3E
  $ABB1  1F        .db $1F
  $ABB2  0F        .db $0F
  $ABB3  07        .db $07
  $ABB4  01 00     ORA ($00,X)
  $ABB6  00        BRK
  $ABB7  00        BRK
  $ABB8  3E 1F 0F  ROL $0F1F,X
  $ABBB  07        .db $07
  $ABBC  01 00     ORA ($00,X)
  $ABBE  00        BRK

L_ABBF:
  $ABBF  00        BRK
  $ABC0  00        BRK
  $ABC1  00        BRK
  $ABC2  80        .db $80
  $ABC3  C0 E0     CPY #$E0
  $ABC5  70 38     BVS $ABFF
  $ABC7  1F        .db $1F
  $ABC8  E0 70     CPX #$70
  $ABCA  B8        CLV
  $ABCB  DC        .db $DC
  $ABCC  EC 70 38  CPX $3870
  $ABCF  1F        .db $1F
  $ABD0  00        BRK
  $ABD1  00        BRK
  $ABD2  00        BRK
  $ABD3  00        BRK
  $ABD4  40        RTI
  $ABD5  20 10 F0  JSR $F010
  $ABD8  00        BRK
  $ABD9  00        BRK
  $ABDA  00        BRK
  $ABDB  00        BRK
  $ABDC  40        RTI
  $ABDD  20 10 F0  JSR $F010
  $ABE0  FF        .db $FF
  $ABE1  7E 00 00  ROR $0000,X
  $ABE4  00        BRK
  $ABE5  00        BRK

L_ABE6:
  $ABE6  00        BRK
  $ABE7  00        BRK
  $ABE8  FF        .db $FF
  $ABE9  7E 00 00  ROR $0000,X
  $ABEC  00        BRK
  $ABED  00        BRK
  $ABEE  00        BRK
  $ABEF  00        BRK
  $ABF0  00        BRK
  $ABF1  60        RTS
  $ABF2  E0 E0     CPX #$E0
  $ABF4  F0 F0     BEQ $ABE6
  $ABF6  F0 70     BEQ $AC68
  $ABF8  00        BRK
  $ABF9  6C EE EF  JMP ($EFEE)
  $ABFC  F7        .db $F7
  $ABFD  F7        .db $F7
  $ABFE  F7        .db $F7

L_ABFF:
  $ABFF  77        .db $77
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
  $AC0C  80        .db $80
  $AC0D  C0 C0     CPY #$C0
  $AC0F  E0 F0     CPX #$F0
  $AC11  70 78     BVS $AC8B
  $AC13  38        SEC
  $AC14  38        SEC
  $AC15  1C        .db $1C
  $AC16  0C        .db $0C
  $AC17  0C        .db $0C
  $AC18  F7        .db $F7
  $AC19  77        .db $77
  $AC1A  7B        .db $7B
  $AC1B  3B        .db $3B
  $AC1C  3B        .db $3B
  $AC1D  1D 0D 0D  ORA $0D0D,X
  $AC20  00        BRK
  $AC21  00        BRK
  $AC22  04        .db $04
  $AC23  04        .db $04
  $AC24  04        .db $04
  $AC25  04        .db $04
  $AC26  04        .db $04
  $AC27  04        .db $04
  $AC28  C0 E0     CPY #$E0
  $AC2A  E4 E4     CPX $E4
  $AC2C  E4 E4     CPX $E4
  $AC2E  E4 E4     CPX $E4
  $AC30  06 06     ASL $06
  $AC32  03        .db $03
  $AC33  03        .db $03
  $AC34  01 00     ORA ($00,X)
  $AC36  00        BRK
  $AC37  00        BRK
  $AC38  06 06     ASL $06
  $AC3A  03        .db $03
  $AC3B  03        .db $03
  $AC3C  01 00     ORA ($00,X)
  $AC3E  00        BRK
  $AC3F  00        BRK
  $AC40  06 02     ASL $02
  $AC42  02        .db $02
  $AC43  03        .db $03
  $AC44  83        .db $83
  $AC45  C7        .db $C7
  $AC46  7E 3C E6  ROR $E63C,X
  $AC49  C2        .db $C2
  $AC4A  02        .db $02
  $AC4B  03        .db $03
  $AC4C  83        .db $83
  $AC4D  C7        .db $C7
  $AC4E  7E 3C 0C  ROR $0C3C,X
  $AC51  0F        .db $0F
  $AC52  0F        .db $0F
  $AC53  0F        .db $0F
  $AC54  07        .db $07
  $AC55  07        .db $07
  $AC56  03        .db $03
  $AC57  00        BRK
  $AC58  00        BRK
  $AC59  00        BRK
  $AC5A  00        BRK
  $AC5B  00        BRK
  $AC5C  00        BRK
  $AC5D  00        BRK
  $AC5E  00        BRK
  $AC5F  00        BRK
  $AC60  00        BRK
  $AC61  7E 42 5A  ROR $5A42,X
  $AC64  5A        .db $5A
  $AC65  42        .db $42
  $AC66  7E 00 FE  ROR $FE00,X
  $AC69  FE C6 DE  INC $DEC6,X
  $AC6C  DE FE FE  DEC $FEFE,X
  $AC6F  00        BRK
  $AC70  00        BRK
  $AC71  00        BRK
  $AC72  00        BRK
  $AC73  00        BRK
  $AC74  00        BRK
  $AC75  00        BRK
  $AC76  00        BRK
  $AC77  00        BRK
  $AC78  00        BRK
  $AC79  00        BRK
  $AC7A  00        BRK
  $AC7B  01 07     ORA ($07,X)
  $AC7D  1F        .db $1F
  $AC7E  7F        .db $7F
  $AC7F  FF        .db $FF
  $AC80  00        BRK
  $AC81  00        BRK
  $AC82  03        .db $03
  $AC83  0F        .db $0F
  $AC84  37        .db $37
  $AC85  3F        .db $3F
  $AC86  CF        .db $CF
  $AC87  3F        .db $3F
  $AC88  07        .db $07
  $AC89  3F        .db $3F
  $AC8A  FF        .db $FF

L_AC8B:
  $AC8B  FF        .db $FF
  $AC8C  FF        .db $FF
  $AC8D  FF        .db $FF
  $AC8E  FF        .db $FF
  $AC8F  FF        .db $FF
  $AC90  00        BRK
  $AC91  00        BRK
  $AC92  40        RTI
  $AC93  C0 F0     CPY #$F0
  $AC95  F8        SED
  $AC96  F4        .db $F4
  $AC97  F8        SED
  $AC98  C0 F0     CPY #$F0
  $AC9A  FC        .db $FC
  $AC9B  FC        .db $FC
  $AC9C  FE FF FF  INC $FFFF,X
  $AC9F  FF        .db $FF
  $ACA0  00        BRK
  $ACA1  00        BRK
  $ACA2  00        BRK
  $ACA3  00        BRK
  $ACA4  00        BRK
  $ACA5  00        BRK
  $ACA6  00        BRK
  $ACA7  00        BRK
  $ACA8  00        BRK
  $ACA9  00        BRK
  $ACAA  00        BRK
  $ACAB  00        BRK
  $ACAC  00        BRK
  $ACAD  00        BRK
  $ACAE  03        .db $03
  $ACAF  0F        .db $0F
  $ACB0  00        BRK
  $ACB1  00        BRK
  $ACB2  00        BRK
  $ACB3  00        BRK
  $ACB4  03        .db $03
  $ACB5  0F        .db $0F
  $ACB6  07        .db $07
  $ACB7  1F        .db $1F
  $ACB8  00        BRK
  $ACB9  00        BRK
  $ACBA  0F        .db $0F
  $ACBB  3F        .db $3F
  $ACBC  7F        .db $7F
  $ACBD  FF        .db $FF
  $ACBE  FF        .db $FF
  $ACBF  FF        .db $FF
  $ACC0  00        BRK
  $ACC1  00        BRK
  $ACC2  00        BRK
  $ACC3  00        BRK
  $ACC4  E0 F0     CPX #$F0
  $ACC6  F8        SED
  $ACC7  F8        SED
  $ACC8  00        BRK
  $ACC9  00        BRK
  $ACCA  E0 F8     CPX #$F8
  $ACCC  F8        SED
  $ACCD  FC        .db $FC
  $ACCE  FC        .db $FC
  $ACCF  FE 00 00  INC $0000,X
  $ACD2  00        BRK
  $ACD3  00        BRK
  $ACD4  00        BRK
  $ACD5  00        BRK
  $ACD6  00        BRK
  $ACD7  00        BRK
  $ACD8  0F        .db $0F
  $ACD9  07        .db $07
  $ACDA  07        .db $07
  $ACDB  07        .db $07
  $ACDC  03        .db $03
  $ACDD  03        .db $03
  $ACDE  03        .db $03
  $ACDF  01 00     ORA ($00,X)
  $ACE1  00        BRK
  $ACE2  00        BRK
  $ACE3  00        BRK
  $ACE4  00        BRK
  $ACE5  00        BRK
  $ACE6  00        BRK
  $ACE7  00        BRK
  $ACE8  00        BRK
  $ACE9  00        BRK
  $ACEA  00        BRK
  $ACEB  00        BRK
  $ACEC  00        BRK
  $ACED  00        BRK
  $ACEE  00        BRK
  $ACEF  00        BRK
  $ACF0  00        BRK
  $ACF1  00        BRK
  $ACF2  00        BRK
  $ACF3  00        BRK
  $ACF4  00        BRK
  $ACF5  00        BRK
  $ACF6  00        BRK
  $ACF7  00        BRK
  $ACF8  00        BRK
  $ACF9  00        BRK
  $ACFA  00        BRK
  $ACFB  00        BRK
  $ACFC  00        BRK
  $ACFD  00        BRK
  $ACFE  00        BRK
  $ACFF  00        BRK
  $AD00  00        BRK
  $AD01  00        BRK
  $AD02  00        BRK
  $AD03  40        RTI
  $AD04  A0 A0     LDY #$A0
  $AD06  50 50     BVC $AD58
  $AD08  00        BRK
  $AD09  80        .db $80
  $AD0A  40        RTI
  $AD0B  60        RTS
  $AD0C  30 38     BMI $AD46
  $AD0E  18        CLC
  $AD0F  1C        .db $1C
  $AD10  00        BRK
  $AD11  00        BRK
  $AD12  00        BRK
  $AD13  00        BRK
  $AD14  00        BRK
  $AD15  08        PHP
  $AD16  10 10     BPL $AD28
  $AD18  00        BRK
  $AD19  00        BRK
  $AD1A  00        BRK
  $AD1B  00        BRK
  $AD1C  00        BRK
  $AD1D  08        PHP
  $AD1E  04        .db $04
  $AD1F  04        .db $04
  $AD20  00        BRK
  $AD21  00        BRK
  $AD22  00        BRK
  $AD23  00        BRK
  $AD24  01 03     ORA ($03,X)
  $AD26  07        .db $07
  $AD27  0F        .db $0F

L_AD28:
  $AD28  00        BRK
  $AD29  00        BRK
  $AD2A  00        BRK
  $AD2B  00        BRK
  $AD2C  00        BRK
  $AD2D  00        BRK
  $AD2E  00        BRK
  $AD2F  00        BRK
  $AD30  68        PLA
  $AD31  68        PLA
  $AD32  E8        INX
  $AD33  F4        .db $F4
  $AD34  F4        .db $F4
  $AD35  FA        .db $FA
  $AD36  FA        .db $FA
  $AD37  FB        .db $FB
  $AD38  0C        .db $0C
  $AD39  0E 0F 07  ASL $070F
  $AD3C  07        .db $07
  $AD3D  03        .db $03
  $AD3E  03        .db $03
  $AD3F  03        .db $03
  $AD40  00        BRK
  $AD41  00        BRK
  $AD42  00        BRK
  $AD43  00        BRK
  $AD44  00        BRK
  $AD45  00        BRK

L_AD46:
  $AD46  00        BRK

L_AD47:
  $AD47  01 00     ORA ($00,X)
  $AD49  00        BRK
  $AD4A  00        BRK
  $AD4B  00        BRK
  $AD4C  80        .db $80
  $AD4D  80        .db $80
  $AD4E  C0 C0     CPY #$C0
  $AD50  10 18     BPL $AD6A

L_AD52:
  $AD52  38        SEC
  $AD53  38        SEC
  $AD54  78        SEI
  $AD55  70 F0     BVS $AD47
  $AD57  E0 02     CPX #$02
  $AD59  02        .db $02
  $AD5A  02        .db $02
  $AD5B  02        .db $02
  $AD5C  02        .db $02
  $AD5D  06 04     ASL $04
  $AD5F  0C        .db $0C
  $AD60  00        BRK
  $AD61  00        BRK
  $AD62  01 0E     ORA ($0E,X)
  $AD64  03        .db $03
  $AD65  01 01     ORA ($01,X)
  $AD67  01 00     ORA ($00,X)
  $AD69  1F        .db $1F

L_AD6A:
  $AD6A  01 00     ORA ($00,X)
  $AD6C  00        BRK
  $AD6D  00        BRK
  $AD6E  00        BRK
  $AD6F  00        BRK
  $AD70  FD 3D 0E  SBC $0E3D,X
  $AD73  46 B2     LSR $B2
  $AD75  D8        CLD
  $AD76  ED E7 01  SBC $01E7
  $AD79  01 C0     ORA ($C0,X)
  $AD7B  70 38     BVS $ADB5
  $AD7D  1C        .db $1C
  $AD7E  0F        .db $0F

L_AD7F:
  $AD7F  07        .db $07
  $AD80  03        .db $03
  $AD81  03        .db $03
  $AD82  87        .db $87
  $AD83  87        .db $87
  $AD84  86 81     STX $81
  $AD86  C3        .db $C3
  $AD87  C2        .db $C2
  $AD88  C0 E0     CPY #$E0
  $AD8A  E0 E0     CPX #$E0
  $AD8C  F0 F1     BEQ $AD7F
  $AD8E  F3        .db $F3
  $AD8F  C2        .db $C2
  $AD90  D0 C0     BNE $AD52
  $AD92  A0 40     LDY #$40
  $AD94  80        .db $80
  $AD95  00        BRK
  $AD96  00        BRK
  $AD97  00        BRK
  $AD98  18        CLC
  $AD99  18        CLC
  $AD9A  30 60     BMI $ADFC
  $AD9C  C0 80     CPY #$80
  $AD9E  00        BRK
  $AD9F  00        BRK
  $ADA0  03        .db $03
  $ADA1  03        .db $03
  $ADA2  04        .db $04
  $ADA3  01 00     ORA ($00,X)
  $ADA5  00        BRK
  $ADA6  00        BRK
  $ADA7  00        BRK
  $ADA8  00        BRK
  $ADA9  00        BRK
  $ADAA  00        BRK
  $ADAB  03        .db $03
  $ADAC  04        .db $04
  $ADAD  00        BRK
  $ADAE  00        BRK
  $ADAF  00        BRK
  $ADB0  F3        .db $F3
  $ADB1  02        .db $02
  $ADB2  1E 80 00  ASL $0080,X

L_ADB5:
  $ADB5  00        BRK
  $ADB6  00        BRK
  $ADB7  00        BRK
  $ADB8  03        .db $03
  $ADB9  0E FE 80  ASL $80FE
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
  $ADC6  00        BRK
  $ADC7  07        .db $07
  $ADC8  00        BRK
  $ADC9  00        BRK
  $ADCA  00        BRK
  $ADCB  00        BRK
  $ADCC  00        BRK
  $ADCD  00        BRK
  $ADCE  07        .db $07
  $ADCF  3F        .db $3F
  $ADD0  00        BRK
  $ADD1  00        BRK
  $ADD2  00        BRK
  $ADD3  00        BRK
  $ADD4  00        BRK
  $ADD5  00        BRK
  $ADD6  00        BRK
  $ADD7  E0 00     CPX #$00
  $ADD9  00        BRK
  $ADDA  00        BRK
  $ADDB  00        BRK
  $ADDC  00        BRK
  $ADDD  FC        .db $FC
  $ADDE  FE FE 00  INC $00FE,X
  $ADE1  00        BRK
  $ADE2  03        .db $03
  $ADE3  02        .db $02
  $ADE4  04        .db $04
  $ADE5  08        PHP
  $ADE6  58        CLI
  $ADE7  70 00     BVS $ADE9

L_ADE9:
  $ADE9  00        BRK
  $ADEA  03        .db $03
  $ADEB  0E 1C 38  ASL $381C
  $ADEE  78        SEI
  $ADEF  70 00     BVS $ADF1

L_ADF1:
  $ADF1  01 07     ORA ($07,X)
  $ADF3  18        CLC
  $ADF4  47        .db $47
  $ADF5  1F        .db $1F
  $ADF6  07        .db $07
  $ADF7  01 01     ORA ($01,X)
  $ADF9  07        .db $07
  $ADFA  1F        .db $1F
  $ADFB  78        SEI

L_ADFC:
  $ADFC  C0 00     CPY #$00
  $ADFE  00        BRK
  $ADFF  00        BRK
  $AE00  3F        .db $3F
  $AE01  E0 1F     CPX #$1F
  $AE03  FF        .db $FF
  $AE04  FF        .db $FF
  $AE05  FF        .db $FF
  $AE06  FE FD FF  INC $FFFD,X
  $AE09  E0 00     CPX #$00
  $AE0B  00        BRK
  $AE0C  00        BRK
  $AE0D  03        .db $03
  $AE0E  06 0C     ASL $0C
  $AE10  F0 00     BEQ $AE12

L_AE12:
  $AE12  E0 C0     CPX #$C0
  $AE14  C0 80     CPY #$80
  $AE16  C0 C0     CPY #$C0
  $AE18  F8        SED
  $AE19  00        BRK
  $AE1A  00        BRK
  $AE1B  00        BRK
  $AE1C  C0 80     CPY #$80
  $AE1E  00        BRK
  $AE1F  40        RTI
  $AE20  60        RTS
  $AE21  00        BRK
  $AE22  00        BRK
  $AE23  00        BRK
  $AE24  00        BRK
  $AE25  00        BRK
  $AE26  00        BRK
  $AE27  00        BRK
  $AE28  60        RTS
  $AE29  00        BRK
  $AE2A  00        BRK
  $AE2B  00        BRK
  $AE2C  00        BRK
  $AE2D  00        BRK
  $AE2E  00        BRK
  $AE2F  00        BRK
  $AE30  F3        .db $F3
  $AE31  EF        .db $EF
  $AE32  DF        .db $DF
  $AE33  8E 0C 0C  STX $0C0C
  $AE36  08        PHP
  $AE37  00        BRK
  $AE38  10 20     BPL $AE5A
  $AE3A  41 82     EOR ($82,X)
  $AE3C  04        .db $04
  $AE3D  04        .db $04
  $AE3E  08        PHP
  $AE3F  00        BRK
  $AE40  C0 80     CPY #$80
  $AE42  00        BRK
  $AE43  00        BRK
  $AE44  00        BRK
  $AE45  00        BRK
  $AE46  00        BRK
  $AE47  00        BRK
  $AE48  C0 80     CPY #$80
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
  $AE58  7F        .db $7F
  $AE59  FF        .db $FF

L_AE5A:
  $AE5A  F5 F0     SBC $F0,X
  $AE5C  C7        .db $C7
  $AE5D  EF        .db $EF
  $AE5E  CF        .db $CF
  $AE5F  EE 00 00  INC $0000
  $AE62  00        BRK
  $AE63  00        BRK
  $AE64  00        BRK
  $AE65  00        BRK
  $AE66  00        BRK
  $AE67  00        BRK
  $AE68  FC        .db $FC
  $AE69  FE 5C 0E  INC $0E5C,X
  $AE6C  F4        .db $F4
  $AE6D  BE DC 4E  LDX $4EDC,Y
  $AE70  00        BRK
  $AE71  00        BRK
  $AE72  00        BRK
  $AE73  00        BRK
  $AE74  00        BRK
  $AE75  00        BRK
  $AE76  00        BRK
  $AE77  00        BRK
  $AE78  CE EB CC  DEC $CCEB
  $AE7B  EE F7 FF  INC $FFF7
  $AE7E  55 00     EOR $00,X
  $AE80  00        BRK
  $AE81  00        BRK
  $AE82  00        BRK
  $AE83  00        BRK
  $AE84  00        BRK
  $AE85  00        BRK
  $AE86  00        BRK
  $AE87  00        BRK
  $AE88  DC        .db $DC
  $AE89  CE 3C BE  DEC $BE3C
  $AE8C  FC        .db $FC
  $AE8D  FE 54 00  INC $0054,X
  $AE90  00        BRK
  $AE91  00        BRK
  $AE92  00        BRK
  $AE93  00        BRK
  $AE94  00        BRK
  $AE95  00        BRK
  $AE96  00        BRK
  $AE97  00        BRK
  $AE98  01 00     ORA ($00,X)
  $AE9A  00        BRK
  $AE9B  00        BRK
  $AE9C  00        BRK
  $AE9D  00        BRK
  $AE9E  01 03     ORA ($03,X)
  $AEA0  80        .db $80
  $AEA1  00        BRK
  $AEA2  00        BRK
  $AEA3  00        BRK
  $AEA4  00        BRK
  $AEA5  00        BRK
  $AEA6  00        BRK
  $AEA7  00        BRK
  $AEA8  80        .db $80
  $AEA9  80        .db $80
  $AEAA  80        .db $80
  $AEAB  40        RTI
  $AEAC  00        BRK
  $AEAD  C0 E0     CPY #$E0
  $AEAF  F0 40     BEQ $AEF1
  $AEB1  00        BRK
  $AEB2  00        BRK
  $AEB3  00        BRK
  $AEB4  00        BRK
  $AEB5  00        BRK
  $AEB6  00        BRK
  $AEB7  00        BRK
  $AEB8  60        RTS
  $AEB9  40        RTI
  $AEBA  40        RTI
  $AEBB  80        .db $80
  $AEBC  00        BRK
  $AEBD  C0 E0     CPY #$E0
  $AEBF  F0 00     BEQ $AEC1

L_AEC1:
  $AEC1  00        BRK
  $AEC2  00        BRK
  $AEC3  00        BRK
  $AEC4  00        BRK
  $AEC5  00        BRK

L_AEC6:
  $AEC6  00        BRK
  $AEC7  00        BRK
  $AEC8  F0 FC     BEQ $AEC6
  $AECA  FF        .db $FF
  $AECB  7F        .db $7F
  $AECC  7F        .db $7F
  $AECD  7F        .db $7F
  $AECE  7F        .db $7F
  $AECF  3F        .db $3F
  $AED0  00        BRK
  $AED1  00        BRK
  $AED2  00        BRK
  $AED3  00        BRK
  $AED4  00        BRK
  $AED5  1C        .db $1C
  $AED6  30 31     BMI $AF09
  $AED8  00        BRK
  $AED9  00        BRK
  $AEDA  00        BRK
  $AEDB  00        BRK
  $AEDC  38        SEC
  $AEDD  20 4A 41  JSR $414A
  $AEE0  31 31     AND ($31),Y
  $AEE2  3F        .db $3F
  $AEE3  3E 3F 1C  ROL $1C3F,X
  $AEE6  07        .db $07
  $AEE7  01 41     ORA ($41,X)
  $AEE9  09 21     ORA #$21
  $AEEB  3F        .db $3F
  $AEEC  3F        .db $3F
  $AEED  1C        .db $1C
  $AEEE  0F        .db $0F
  $AEEF  03        .db $03
  $AEF0  8C 8C FC  STY $FC8C
  $AEF3  7C        .db $7C
  $AEF4  FC        .db $FC
  $AEF5  38        SEC
  $AEF6  E0 80     CPX #$80
  $AEF8  82        .db $82
  $AEF9  90 84     BCC $AE7F
  $AEFB  7C        .db $7C
  $AEFC  FC        .db $FC
  $AEFD  38        SEC
  $AEFE  F0 C0     BEQ $AEC0
  $AF00  30 58     BMI $AF5A
  $AF02  98        TYA
  $AF03  B8        CLV
  $AF04  B8        CLV
  $AF05  F8        SED
  $AF06  F0 70     BEQ $AF78
  $AF08  30 78     BMI $AF82
  $AF0A  F8        SED
  $AF0B  F8        SED
  $AF0C  F8        SED
  $AF0D  F8        SED
  $AF0E  F0 70     BEQ $AF80
  $AF10  00        BRK
  $AF11  00        BRK
  $AF12  00        BRK
  $AF13  00        BRK
  $AF14  00        BRK
  $AF15  00        BRK
  $AF16  40        RTI
  $AF17  20 00 00  JSR $0000
  $AF1A  00        BRK
  $AF1B  00        BRK
  $AF1C  C0 E0     CPY #$E0
  $AF1E  60        RTS
  $AF1F  30 20     BMI $AF41
  $AF21  20 20 20  JSR $2020
  $AF24  20 40 00  JSR $0040
  $AF27  00        BRK
  $AF28  30 30     BMI $AF5A
  $AF2A  30 30     BMI $AF5C
  $AF2C  30 60     BMI $AF8E
  $AF2E  E0 C0     CPX #$C0
  $AF30  0F        .db $0F
  $AF31  0F        .db $0F
  $AF32  0F        .db $0F
  $AF33  1F        .db $1F
  $AF34  1F        .db $1F
  $AF35  1E 3E 3E  ASL $3E3E,X

L_AF38:
  $AF38  0E 0E 0E  ASL $0E0E
  $AF3B  1E 1E 1C  ASL $1C1E,X
  $AF3E  3C        .db $3C
  $AF3F  3C        .db $3C
  $AF40  00        BRK

L_AF41:
  $AF41  00        BRK
  $AF42  00        BRK
  $AF43  01 03     ORA ($03,X)
  $AF45  07        .db $07
  $AF46  0F        .db $0F
  $AF47  1B        .db $1B
  $AF48  00        BRK
  $AF49  00        BRK
  $AF4A  00        BRK
  $AF4B  01 03     ORA ($03,X)
  $AF4D  07        .db $07

L_AF4E:
  $AF4E  0F        .db $0F
  $AF4F  1F        .db $1F
  $AF50  7E 7C FC  ROR $FC7C,X

L_AF53:
  $AF53  FC        .db $FC
  $AF54  F8        SED
  $AF55  F8        SED
  $AF56  F0 E0     BEQ $AF38
  $AF58  7C        .db $7C
  $AF59  78        SEI

L_AF5A:
  $AF5A  F8        SED
  $AF5B  F8        SED

L_AF5C:
  $AF5C  F0 F0     BEQ $AF4E
  $AF5E  E0 C0     CPX #$C0
  $AF60  00        BRK
  $AF61  00        BRK
  $AF62  00        BRK
  $AF63  01 01     ORA ($01,X)
  $AF65  02        .db $02
  $AF66  02        .db $02
  $AF67  02        .db $02
  $AF68  00        BRK
  $AF69  00        BRK
  $AF6A  00        BRK
  $AF6B  00        BRK
  $AF6C  00        BRK
  $AF6D  01 01     ORA ($01,X)
  $AF6F  01 30     ORA ($30,X)
  $AF71  70 E0     BVS $AF53
  $AF73  60        RTS
  $AF74  60        RTS
  $AF75  70 7F     BVS $AFF6
  $AF77  3F        .db $3F

L_AF78:
  $AF78  10 30     BPL $AFAA
  $AF7A  60        RTS
  $AF7B  E0 E0     CPX #$E0
  $AF7D  F0 FF     BEQ $AF7E
  $AF7F  FF        .db $FF

L_AF80:
  $AF80  00        BRK

L_AF81:
  $AF81  00        BRK

L_AF82:
  $AF82  00        BRK
  $AF83  01 07     ORA ($07,X)
  $AF85  3E F8 E0  ROL $E0F8,X
  $AF88  00        BRK
  $AF89  00        BRK
  $AF8A  00        BRK
  $AF8B  01 07     ORA ($07,X)
  $AF8D  3F        .db $3F

L_AF8E:
  $AF8E  FF        .db $FF
  $AF8F  FF        .db $FF
  $AF90  31 61     AND ($61),Y
  $AF92  C3        .db $C3
  $AF93  83        .db $83
  $AF94  07        .db $07
  $AF95  0E 0C 18  ASL $180C

L_AF98:
  $AF98  3F        .db $3F
  $AF99  7F        .db $7F
  $AF9A  FF        .db $FF
  $AF9B  FF        .db $FF
  $AF9C  FE FC F8  INC $F8FC,X

L_AF9F:
  $AF9F  F0 E0     BEQ $AF81
  $AFA1  C0 80     CPY #$80
  $AFA3  80        .db $80
  $AFA4  00        BRK
  $AFA5  00        BRK
  $AFA6  00        BRK
  $AFA7  00        BRK
  $AFA8  C0 80     CPY #$80

L_AFAA:
  $AFAA  00        BRK
  $AFAB  00        BRK
  $AFAC  00        BRK
  $AFAD  00        BRK
  $AFAE  00        BRK
  $AFAF  00        BRK
  $AFB0  02        .db $02
  $AFB1  02        .db $02
  $AFB2  01 01     ORA ($01,X)
  $AFB4  00        BRK
  $AFB5  00        BRK
  $AFB6  00        BRK
  $AFB7  00        BRK
  $AFB8  01 01     ORA ($01,X)
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
  $AFC4  80        .db $80
  $AFC5  40        RTI
  $AFC6  30 0F     BMI $AFD7
  $AFC8  FF        .db $FF
  $AFC9  FF        .db $FF
  $AFCA  FF        .db $FF
  $AFCB  FF        .db $FF
  $AFCC  7F        .db $7F
  $AFCD  3F        .db $3F
  $AFCE  0F        .db $0F
  $AFCF  00        BRK
  $AFD0  00        BRK
  $AFD1  00        BRK
  $AFD2  00        BRK
  $AFD3  00        BRK
  $AFD4  03        .db $03
  $AFD5  0C        .db $0C
  $AFD6  30 C0     BMI $AF98
  $AFD8  FF        .db $FF
  $AFD9  FF        .db $FF
  $AFDA  FF        .db $FF
  $AFDB  FF        .db $FF
  $AFDC  FC        .db $FC
  $AFDD  F0 C0     BEQ $AF9F
  $AFDF  00        BRK
  $AFE0  10 20     BPL $B002
  $AFE2  40        RTI
  $AFE3  80        .db $80
  $AFE4  00        BRK
  $AFE5  00        BRK
  $AFE6  00        BRK
  $AFE7  00        BRK
  $AFE8  E0 C0     CPX #$C0
  $AFEA  80        .db $80
  $AFEB  00        BRK
  $AFEC  00        BRK
  $AFED  00        BRK
  $AFEE  00        BRK
  $AFEF  00        BRK
  $AFF0  07        .db $07
  $AFF1  07        .db $07
  $AFF2  07        .db $07
  $AFF3  07        .db $07
  $AFF4  0F        .db $0F
  $AFF5  0F        .db $0F

L_AFF6:
  $AFF6  0F        .db $0F
  $AFF7  1E 06 06  ASL $0606,X
  $AFFA  06 06     ASL $06
  $AFFC  0E 0E 0E  ASL $0E0E
  $AFFF  1C        .db $1C
  $B000  0F        .db $0F
  $B001  1F        .db $1F

L_B002:
  $B002  1F        .db $1F
  $B003  3E 3C 7C  ROL $7C3C,X
  $B006  7C        .db $7C
  $B007  F8        SED
  $B008  0E 1E 1E  ASL $1E1E
  $B00B  3C        .db $3C
  $B00C  38        SEC
  $B00D  78        SEI
  $B00E  78        SEI
  $B00F  F0 01     BEQ $B012
  $B011  03        .db $03

L_B012:
  $B012  07        .db $07
  $B013  07        .db $07
  $B014  0F        .db $0F
  $B015  0F        .db $0F
  $B016  1F        .db $1F
  $B017  1B        .db $1B
  $B018  01 03     ORA ($03,X)
  $B01A  07        .db $07
  $B01B  07        .db $07
  $B01C  0F        .db $0F
  $B01D  0F        .db $0F
  $B01E  1E 1E E0  ASL $E01E,X
  $B021  C0 C0     CPY #$C0
  $B023  80        .db $80
  $B024  80        .db $80
  $B025  80        .db $80
  $B026  00        BRK
  $B027  00        BRK
  $B028  C0 80     CPY #$80
  $B02A  80        .db $80
  $B02B  00        BRK
  $B02C  00        BRK
  $B02D  00        BRK
  $B02E  00        BRK
  $B02F  00        BRK
  $B030  00        BRK
  $B031  00        BRK
  $B032  00        BRK
  $B033  00        BRK
  $B034  00        BRK
  $B035  30 60     BMI $B097
  $B037  E0 00     CPX #$00
  $B039  00        BRK
  $B03A  00        BRK
  $B03B  00        BRK
  $B03C  00        BRK
  $B03D  10 20     BPL $B05F
  $B03F  60        RTS
  $B040  07        .db $07
  $B041  07        .db $07
  $B042  07        .db $07
  $B043  07        .db $07
  $B044  05 05     ORA $05
  $B046  05 02     ORA $02
  $B048  03        .db $03
  $B049  03        .db $03
  $B04A  03        .db $03
  $B04B  03        .db $03
  $B04C  03        .db $03
  $B04D  03        .db $03
  $B04E  03        .db $03
  $B04F  01 00     ORA ($00,X)
  $B051  00        BRK
  $B052  00        BRK
  $B053  00        BRK
  $B054  00        BRK
  $B055  80        .db $80
  $B056  C0 FF     CPY #$FF
  $B058  00        BRK
  $B059  00        BRK
  $B05A  00        BRK
  $B05B  00        BRK
  $B05C  00        BRK
  $B05D  80        .db $80
  $B05E  C0 FF     CPY #$FF
  $B060  00        BRK
  $B061  00        BRK
  $B062  00        BRK
  $B063  01 03     ORA ($03,X)
  $B065  07        .db $07
  $B066  3E F8 00  ROL $00F8,X
  $B069  00        BRK
  $B06A  00        BRK
  $B06B  01 03     ORA ($03,X)
  $B06D  07        .db $07
  $B06E  3F        .db $3F
  $B06F  FF        .db $FF
  $B070  32        .db $32
  $B071  62        .db $62
  $B072  E2        .db $E2
  $B073  C4 84     CPY $84
  $B075  04        .db $04
  $B076  04        .db $04
  $B077  18        CLC
  $B078  3C        .db $3C
  $B079  7C        .db $7C
  $B07A  FC        .db $FC
  $B07B  F8        SED
  $B07C  F8        SED
  $B07D  F8        SED
  $B07E  F8        SED
  $B07F  E0 02     CPX #$02
  $B081  01 01     ORA ($01,X)
  $B083  00        BRK
  $B084  00        BRK
  $B085  00        BRK
  $B086  00        BRK
  $B087  00        BRK
  $B088  01 00     ORA ($00,X)
  $B08A  00        BRK
  $B08B  00        BRK
  $B08C  00        BRK
  $B08D  00        BRK
  $B08E  00        BRK
  $B08F  00        BRK
  $B090  3F        .db $3F
  $B091  00        BRK
  $B092  00        BRK
  $B093  80        .db $80
  $B094  40        RTI
  $B095  30 0F     BMI $B0A6

L_B097:
  $B097  00        BRK
  $B098  FF        .db $FF
  $B099  FF        .db $FF
  $B09A  FF        .db $FF
  $B09B  7F        .db $7F
  $B09C  3F        .db $3F
  $B09D  0F        .db $0F
  $B09E  00        BRK
  $B09F  00        BRK
  $B0A0  E0 00     CPX #$00
  $B0A2  00        BRK
  $B0A3  00        BRK
  $B0A4  03        .db $03
  $B0A5  1C        .db $1C

L_B0A6:
  $B0A6  F0 00     BEQ $B0A8

L_B0A8:
  $B0A8  FF        .db $FF
  $B0A9  FF        .db $FF
  $B0AA  FF        .db $FF
  $B0AB  FF        .db $FF
  $B0AC  FC        .db $FC

L_B0AD:
  $B0AD  E0 00     CPX #$00
  $B0AF  00        BRK

L_B0B0:
  $B0B0  10 20     BPL $B0D2
  $B0B2  40        RTI
  $B0B3  80        .db $80
  $B0B4  00        BRK
  $B0B5  00        BRK
  $B0B6  00        BRK
  $B0B7  00        BRK
  $B0B8  E0 C0     CPX #$C0
  $B0BA  80        .db $80
  $B0BB  00        BRK
  $B0BC  00        BRK
  $B0BD  00        BRK
  $B0BE  00        BRK
  $B0BF  00        BRK
  $B0C0  00        BRK
  $B0C1  00        BRK
  $B0C2  00        BRK
  $B0C3  07        .db $07
  $B0C4  1F        .db $1F
  $B0C5  3F        .db $3F
  $B0C6  77        .db $77
  $B0C7  67        .db $67
  $B0C8  00        BRK
  $B0C9  00        BRK
  $B0CA  00        BRK
  $B0CB  07        .db $07
  $B0CC  1F        .db $1F
  $B0CD  3F        .db $3F
  $B0CE  7F        .db $7F
  $B0CF  7F        .db $7F
  $B0D0  00        BRK
  $B0D1  1F        .db $1F

L_B0D2:
  $B0D2  78        SEI
  $B0D3  FF        .db $FF
  $B0D4  FF        .db $FF
  $B0D5  FF        .db $FF
  $B0D6  03        .db $03
  $B0D7  80        .db $80
  $B0D8  00        BRK
  $B0D9  1F        .db $1F
  $B0DA  7F        .db $7F
  $B0DB  FF        .db $FF
  $B0DC  C0 FF     CPY #$FF
  $B0DE  FF        .db $FF
  $B0DF  FF        .db $FF
  $B0E0  00        BRK
  $B0E1  80        .db $80
  $B0E2  60        RTS
  $B0E3  90 C8     BCC $B0AD
  $B0E5  E4 F4     CPX $F4
  $B0E7  F6 00     INC $00,X
  $B0E9  80        .db $80
  $B0EA  E0 F0     CPX #$F0
  $B0EC  78        SEI
  $B0ED  BC DC DE  LDY $DEDC,X
  $B0F0  C7        .db $C7
  $B0F1  C7        .db $C7
  $B0F2  80        .db $80
  $B0F3  83        .db $83
  $B0F4  8F        .db $8F
  $B0F5  DF        .db $DF
  $B0F6  4F        .db $4F
  $B0F7  43        .db $43
  $B0F8  FF        .db $FF
  $B0F9  FF        .db $FF
  $B0FA  FF        .db $FF
  $B0FB  FF        .db $FF
  $B0FC  FF        .db $FF
  $B0FD  FF        .db $FF
  $B0FE  7F        .db $7F
  $B0FF  7F        .db $7F
  $B100  FC        .db $FC
  $B101  FC        .db $FC
  $B102  FE FC F8  INC $F8FC,X
  $B105  FF        .db $FF
  $B106  FF        .db $FF
  $B107  FF        .db $FF
  $B108  FF        .db $FF
  $B109  FF        .db $FF
  $B10A  FF        .db $FF
  $B10B  FF        .db $FF
  $B10C  FF        .db $FF
  $B10D  FF        .db $FF
  $B10E  FF        .db $FF
  $B10F  C0 76     CPY #$76
  $B111  7E 7E 7E  ROR $7E7E,X
  $B114  FC        .db $FC
  $B115  FC        .db $FC
  $B116  F8        SED
  $B117  F8        SED
  $B118  EE EE EE  INC $EEEE
  $B11B  EE EC C0  INC $C0EC
  $B11E  20 F0 C7  JSR $C7F0
  $B121  C7        .db $C7
  $B122  CF        .db $CF
  $B123  DF        .db $DF
  $B124  DF        .db $DF
  $B125  4F        .db $4F

L_B126:
  $B126  6F        .db $6F
  $B127  27        .db $27
  $B128  FF        .db $FF
  $B129  FF        .db $FF
  $B12A  FF        .db $FF
  $B12B  FF        .db $FF
  $B12C  FF        .db $FF
  $B12D  7F        .db $7F
  $B12E  7F        .db $7F
  $B12F  3F        .db $3F
  $B130  FF        .db $FF
  $B131  C0 03     CPY #$03
  $B133  FF        .db $FF
  $B134  FF        .db $FF
  $B135  FF        .db $FF
  $B136  FF        .db $FF
  $B137  FF        .db $FF
  $B138  FF        .db $FF
  $B139  FF        .db $FF

L_B13A:
  $B13A  FF        .db $FF
  $B13B  FF        .db $FF

L_B13C:
  $B13C  FF        .db $FF
  $B13D  FF        .db $FF
  $B13E  FF        .db $FF
  $B13F  F8        SED
  $B140  F8        SED
  $B141  F8        SED
  $B142  F8        SED
  $B143  F8        SED
  $B144  F0 E0     BEQ $B126
  $B146  C0 C0     CPY #$C0
  $B148  F0 F0     BEQ $B13A
  $B14A  F0 F0     BEQ $B13C
  $B14C  E0 C0     CPX #$C0
  $B14E  00        BRK
  $B14F  C0 37     CPY #$37
  $B151  3F        .db $3F
  $B152  1F        .db $1F
  $B153  0F        .db $0F
  $B154  03        .db $03
  $B155  00        BRK
  $B156  00        BRK
  $B157  00        BRK
  $B158  3F        .db $3F
  $B159  3F        .db $3F
  $B15A  1F        .db $1F
  $B15B  0F        .db $0F
  $B15C  03        .db $03
  $B15D  00        BRK
  $B15E  00        BRK
  $B15F  00        BRK
  $B160  FF        .db $FF
  $B161  FF        .db $FF
  $B162  FF        .db $FF
  $B163  FF        .db $FF
  $B164  FE 00 00  INC $0000,X
  $B167  00        BRK
  $B168  FF        .db $FF
  $B169  FF        .db $FF
  $B16A  FF        .db $FF
  $B16B  FF        .db $FF
  $B16C  FE 00 00  INC $0000,X
  $B16F  00        BRK
  $B170  C0 C0     CPY #$C0
  $B172  80        .db $80
  $B173  00        BRK
  $B174  00        BRK
  $B175  00        BRK
  $B176  00        BRK
  $B177  00        BRK
  $B178  C0 C0     CPY #$C0
  $B17A  80        .db $80
  $B17B  00        BRK
  $B17C  00        BRK
  $B17D  00        BRK
  $B17E  00        BRK
  $B17F  00        BRK
  $B180  00        BRK
  $B181  00        BRK
  $B182  7F        .db $7F
  $B183  1F        .db $1F
  $B184  40        RTI
  $B185  40        RTI
  $B186  DF        .db $DF
  $B187  C0 00     CPY #$00
  $B189  00        BRK
  $B18A  7F        .db $7F
  $B18B  FF        .db $FF
  $B18C  BF        .db $BF
  $B18D  BF        .db $BF
  $B18E  BF        .db $BF
  $B18F  BF        .db $BF
  $B190  00        BRK
  $B191  00        BRK
  $B192  FF        .db $FF
  $B193  FF        .db $FF
  $B194  00        BRK
  $B195  00        BRK
  $B196  FE 00 00  INC $0000,X
  $B199  00        BRK
  $B19A  FF        .db $FF
  $B19B  FF        .db $FF
  $B19C  FF        .db $FF
  $B19D  FE FE FC  INC $FCFE,X
  $B1A0  DF        .db $DF
  $B1A1  FF        .db $FF
  $B1A2  FF        .db $FF
  $B1A3  FF        .db $FF
  $B1A4  FF        .db $FF
  $B1A5  7F        .db $7F
  $B1A6  00        BRK
  $B1A7  00        BRK
  $B1A8  BF        .db $BF
  $B1A9  BF        .db $BF
  $B1AA  BF        .db $BF
  $B1AB  FF        .db $FF
  $B1AC  7F        .db $7F
  $B1AD  00        BRK
  $B1AE  00        BRK
  $B1AF  00        BRK
  $B1B0  FC        .db $FC
  $B1B1  FC        .db $FC
  $B1B2  F8        SED
  $B1B3  F8        SED
  $B1B4  F8        SED
  $B1B5  F8        SED
  $B1B6  00        BRK
  $B1B7  00        BRK
  $B1B8  FC        .db $FC
  $B1B9  FC        .db $FC
  $B1BA  F8        SED
  $B1BB  F8        SED
  $B1BC  F8        SED
  $B1BD  00        BRK
  $B1BE  00        BRK
  $B1BF  00        BRK
  $B1C0  00        BRK
  $B1C1  00        BRK
  $B1C2  3F        .db $3F
  $B1C3  0F        .db $0F
  $B1C4  20 20 6E  JSR $6E20
  $B1C7  60        RTS
  $B1C8  00        BRK
  $B1C9  00        BRK
  $B1CA  3F        .db $3F
  $B1CB  7F        .db $7F
  $B1CC  5F        .db $5F
  $B1CD  5E 5E 5C  LSR $5C5E,X
  $B1D0  6C 7C 78  JMP ($787C)
  $B1D3  78        SEI
  $B1D4  78        SEI
  $B1D5  38        SEC
  $B1D6  00        BRK
  $B1D7  00        BRK
  $B1D8  5C        .db $5C
  $B1D9  5C        .db $5C
  $B1DA  58        CLI
  $B1DB  78        SEI
  $B1DC  38        SEC
  $B1DD  00        BRK
  $B1DE  00        BRK
  $B1DF  00        BRK
  $B1E0  00        BRK
  $B1E1  00        BRK
  $B1E2  07        .db $07
  $B1E3  01 04     ORA ($04,X)
  $B1E5  04        .db $04
  $B1E6  0D 0C 00  ORA $000C
  $B1E9  00        BRK
  $B1EA  07        .db $07
  $B1EB  0F        .db $0F
  $B1EC  0B        .db $0B
  $B1ED  0B        .db $0B
  $B1EE  0B        .db $0B
  $B1EF  0B        .db $0B
  $B1F0  0D 0F 0F  ORA $0F0F
  $B1F3  0F        .db $0F
  $B1F4  0F        .db $0F
  $B1F5  07        .db $07
  $B1F6  00        BRK
  $B1F7  00        BRK
  $B1F8  0B        .db $0B
  $B1F9  0B        .db $0B
  $B1FA  0B        .db $0B
  $B1FB  0F        .db $0F
  $B1FC  07        .db $07
  $B1FD  00        BRK
  $B1FE  00        BRK
  $B1FF  00        BRK
  $B200  FF        .db $FF
  $B201  DF        .db $DF
  $B202  FE EF BF  INC $BFEF,X
  $B205  FB        .db $FB
  $B206  FF        .db $FF
  $B207  FF        .db $FF
  $B208  00        BRK
  $B209  20 01 10  JSR $1001
  $B20C  40        RTI
  $B20D  04        .db $04
  $B20E  00        BRK
  $B20F  00        BRK
  $B210  FF        .db $FF
  $B211  FB        .db $FB
  $B212  FF        .db $FF
  $B213  FF        .db $FF
  $B214  DF        .db $DF
  $B215  FF        .db $FF
  $B216  FF        .db $FF
  $B217  FF        .db $FF
  $B218  00        BRK

L_B219:
  $B219  04        .db $04
  $B21A  00        BRK
  $B21B  00        BRK
  $B21C  20 00 00  JSR $0000
  $B21F  00        BRK
  $B220  6F        .db $6F
  $B221  FF        .db $FF
  $B222  FD DF FF  SBC $FFDF,X
  $B225  EE FF BF  INC $BFFF
  $B228  90 00     BCC $B22A

L_B22A:
  $B22A  02        .db $02
  $B22B  20 00 11  JSR $1100
  $B22E  00        BRK
  $B22F  40        RTI
  $B230  FF        .db $FF
  $B231  FF        .db $FF
  $B232  FF        .db $FF
  $B233  FF        .db $FF
  $B234  EF        .db $EF
  $B235  FF        .db $FF
  $B236  FF        .db $FF
  $B237  FF        .db $FF
  $B238  00        BRK
  $B239  00        BRK
  $B23A  00        BRK
  $B23B  00        BRK
  $B23C  10 00     BPL $B23E

L_B23E:
  $B23E  00        BRK
  $B23F  00        BRK
  $B240  40        RTI
  $B241  54        .db $54
  $B242  10 04     BPL $B248
  $B244  A2 00     LDX #$00
  $B246  44        .db $44
  $B247  20 BF AB  JSR $ABBF
  $B24A  EF        .db $EF
  $B24B  FB        .db $FB
  $B24C  5D FF BB  EOR $BBFF,X
  $B24F  DF        .db $DF
  $B250  14        .db $14
  $B251  91 20     STA ($20),Y
  $B253  22        .db $22
  $B254  08        PHP
  $B255  82        .db $82
  $B256  10 44     BPL $B29C
  $B258  EB        .db $EB
  $B259  6E DF DD  ROR $DDDF
  $B25C  F7        .db $F7
  $B25D  7D EF BB  ADC $BBEF,X
  $B260  40        RTI
  $B261  54        .db $54
  $B262  10 04     BPL $B268
  $B264  A2 00     LDX #$00
  $B266  44        .db $44
  $B267  20 BF AB  JSR $ABBF
  $B26A  EF        .db $EF
  $B26B  FB        .db $FB
  $B26C  5D FF BB  EOR $BBFF,X
  $B26F  DF        .db $DF
  $B270  14        .db $14
  $B271  91 20     STA ($20),Y
  $B273  22        .db $22
  $B274  08        PHP
  $B275  82        .db $82
  $B276  10 44     BPL $B2BC
  $B278  EB        .db $EB
  $B279  6E DF DD  ROR $DDDF
  $B27C  F7        .db $F7
  $B27D  7D EF BB  ADC $BBEF,X
  $B280  42        .db $42
  $B281  11 90     ORA ($90),Y
  $B283  2C 91 42  BIT $4291
  $B286  49 94     EOR #$94
  $B288  15 AA     ORA $AA,X
  $B28A  4A        LSR
  $B28B  D3        .db $D3
  $B28C  6E BD B6  ROR $B6BD
  $B28F  6B        .db $6B
  $B290  50 04     BVC $B296
  $B292  29 49     AND #$49
  $B294  40        RTI
  $B295  8A        TXA

L_B296:
  $B296  10 81     BPL $B219
  $B298  AF        .db $AF
  $B299  FB        .db $FB
  $B29A  D6 B6     DEC $B6,X

L_B29C:
  $B29C  BF        .db $BF
  $B29D  75 EF     ADC $EF,X
  $B29F  7E 54 C4  ROR $C454,X
  $B2A2  10 04     BPL $B2A8
  $B2A4  A2 00     LDX #$00
  $B2A6  44        .db $44
  $B2A7  20 01 2A  JSR $2A01
  $B2AA  E7        .db $E7
  $B2AB  FB        .db $FB
  $B2AC  5D FF BB  EOR $BBFF,X
  $B2AF  DF        .db $DF
  $B2B0  14        .db $14
  $B2B1  91 20     STA ($20),Y
  $B2B3  22        .db $22
  $B2B4  08        PHP
  $B2B5  82        .db $82
  $B2B6  10 44     BPL $B2FC
  $B2B8  EB        .db $EB
  $B2B9  6E DF DD  ROR $DDDF

L_B2BC:
  $B2BC  F7        .db $F7
  $B2BD  7D EF BB  ADC $BBEF,X
  $B2C0  09 50     ORA #$50
  $B2C2  46 1F     LSR $1F
  $B2C4  A7        .db $A7
  $B2C5  4F        .db $4F
  $B2C6  1F        .db $1F
  $B2C7  B3        .db $B3
  $B2C8  F6 AF     INC $AF,X
  $B2CA  BF        .db $BF
  $B2CB  FF        .db $FF
  $B2CC  5B        .db $5B
  $B2CD  BD FF 6F  LDA $6FFF,X
  $B2D0  20 0C 27  JSR $270C
  $B2D3  89        .db $89
  $B2D4  00        BRK
  $B2D5  FC        .db $FC
  $B2D6  3F        .db $3F
  $B2D7  81 DF     STA ($DF,X)
  $B2D9  F3        .db $F3
  $B2DA  D8        CLD
  $B2DB  76 FF     ROR $FF,X
  $B2DD  03        .db $03
  $B2DE  C0 7E     CPY #$7E
  $B2E0  40        RTI
  $B2E1  22        .db $22
  $B2E2  5D 38 62  EOR $6238,X
  $B2E5  E2        .db $E2
  $B2E6  F1 9C     SBC ($9C),Y
  $B2E8  BF        .db $BF
  $B2E9  DD BE E7  CMP $E7BE,X
  $B2EC  FD DD FE  SBC $FEDD,X
  $B2EF  6F        .db $6F
  $B2F0  84 4E     STY $4E
  $B2F2  58        CLI
  $B2F3  D9 D0 66  CMP $66D0,Y
  $B2F6  FF        .db $FF
  $B2F7  80        .db $80
  $B2F8  7B        .db $7B
  $B2F9  B1 A7     LDA ($A7),Y
  $B2FB  26 2F     ROL $2F
  $B2FD  89        .db $89
  $B2FE  00        BRK
  $B2FF  3F        .db $3F
  $B300  24 89     BIT $89
  $B302  54        .db $54
  $B303  40        RTI
  $B304  2B        .db $2B
  $B305  80        .db $80
  $B306  3C        .db $3C
  $B307  0E DB 77  ASL $77DB
  $B30A  AB        .db $AB
  $B30B  BF        .db $BF
  $B30C  D7        .db $D7
  $B30D  7F        .db $7F
  $B30E  C3        .db $C3
  $B30F  F1 CF     SBC ($CF),Y
  $B311  7B        .db $7B
  $B312  34        .db $34
  $B313  48        PHA
  $B314  07        .db $07
  $B315  9F        .db $9F
  $B316  3C        .db $3C
  $B317  40        RTI
  $B318  FC        .db $FC
  $B319  B4 DF     LDY $DF,X
  $B31B  F7        .db $F7
  $B31C  F8        SED
  $B31D  60        RTS
  $B31E  C3        .db $C3
  $B31F  BF        .db $BF
  $B320  49 0A     EOR #$0A
  $B322  91 76     STA ($76),Y
  $B324  F9 22 20  SBC $2022,Y
  $B327  4D B6 FD  EOR $FDB6
  $B32A  FE FF 6A  INC $6AFF,X
  $B32D  AD DF B2  LDA $B2DF
  $B330  58        CLI
  $B331  B8        CLV
  $B332  B7        .db $B7
  $B333  7E E0 39  ROR $39E0,X
  $B336  8C 22 A7  STY $A722
  $B339  47        .db $47
  $B33A  48        PHA
  $B33B  01 1F     ORA ($1F,X)
  $B33D  C6 73     DEC $73
  $B33F  DD 59 C6  CMP $C659,X
  $B342  52        .db $52
  $B343  A5 6A     LDA $6A
  $B345  FA        .db $FA
  $B346  B5 FA     LDA $FA,X
  $B348  22        .db $22
  $B349  31 AD     AND ($AD),Y
  $B34B  5A        .db $5A
  $B34C  95 05     STA $05,X
  $B34E  4A        LSR
  $B34F  05 EF     ORA $EF
  $B351  BF        .db $BF
  $B352  FD FF FF  SBC $FFFF,X
  $B355  EF        .db $EF
  $B356  FF        .db $FF
  $B357  FF        .db $FF
  $B358  10 40     BPL $B39A
  $B35A  02        .db $02
  $B35B  00        BRK
  $B35C  00        BRK
  $B35D  10 00     BPL $B35F

L_B35F:
  $B35F  00        BRK
  $B360  DD 47 6A  CMP $6A47,X
  $B363  B5 AE     LDA $AE,X
  $B365  ED B6 FF  SBC $FFB6
  $B368  20 B0 95  JSR $95B0
  $B36B  4A        LSR
  $B36C  51 12     EOR ($12),Y
  $B36E  49 00     EOR #$00
  $B370  6D FF FD  ADC $FDFF
  $B373  BF        .db $BF
  $B374  F7        .db $F7
  $B375  FF        .db $FF
  $B376  7E FF 92  ROR $92FF,X
  $B379  00        BRK
  $B37A  02        .db $02
  $B37B  40        RTI
  $B37C  08        PHP
  $B37D  00        BRK
  $B37E  81 00     STA ($00,X)
  $B380  22        .db $22
  $B381  5D CA 2C  EOR $2CCA,X
  $B384  D5 3B     CMP $3B,X
  $B386  ED B7 54  SBC $54B7
  $B389  80        .db $80
  $B38A  35 D3     AND $D3,X
  $B38C  2A        ROL
  $B38D  C4 12     CPY $12
  $B38F  48        PHA
  $B390  FD BF F7  SBC $F7BF,X
  $B393  FF        .db $FF
  $B394  FE DF FF  INC $FFDF,X
  $B397  FF        .db $FF
  $B398  02        .db $02
  $B399  40        RTI

L_B39A:
  $B39A  08        PHP
  $B39B  00        BRK
  $B39C  01 20     ORA ($20,X)
  $B39E  00        BRK
  $B39F  00        BRK
  $B3A0  FD D7 6E  SBC $6ED7,X
  $B3A3  AD 3A ED  LDA $ED3A
  $B3A6  B3        .db $B3
  $B3A7  F6 00     INC $00,X
  $B3A9  00        BRK
  $B3AA  80        .db $80
  $B3AB  52        .db $52
  $B3AC  C5 12     CMP $12
  $B3AE  4C 09 FF  JMP $FF09
  $B3B1  BD FF EF  LDA $EFFF,X
  $B3B4  E4 F4     CPX $F4
  $B3B6  D3        .db $D3
  $B3B7  AD 00 42  LDA $4200
  $B3BA  00        BRK
  $B3BB  10 11     BPL $B3CE
  $B3BD  0B        .db $0B
  $B3BE  24 52     BIT $52
  $B3C0  FF        .db $FF
  $B3C1  BF        .db $BF
  $B3C2  EF        .db $EF
  $B3C3  DD F7 3D  CMP $3DF7,X
  $B3C6  A7        .db $A7
  $B3C7  DE 00 00  DEC $0000,X
  $B3CA  00        BRK
  $B3CB  00        BRK
  $B3CC  00        BRK
  $B3CD  C0 58     CPY #$58
  $B3CF  20 D3 FC  JSR $FCD3
  $B3D2  B3        .db $B3
  $B3D3  E0 A2     CPX #$A2
  $B3D5  50 20     BVC $B3F7
  $B3D7  28        PLP
  $B3D8  28        PLP
  $B3D9  02        .db $02
  $B3DA  08        PHP
  $B3DB  0F        .db $0F
  $B3DC  15 AF     ORA $AF,X
  $B3DE  DF        .db $DF
  $B3DF  57        .db $57
  $B3E0  FF        .db $FF
  $B3E1  FF        .db $FF
  $B3E2  FF        .db $FF
  $B3E3  FA        .db $FA
  $B3E4  69 F5     ADC #$F5
  $B3E6  6A        ROR
  $B3E7  D5 00     CMP $00,X
  $B3E9  00        BRK
  $B3EA  00        BRK
  $B3EB  05 02     ORA $02
  $B3ED  0A        ASL
  $B3EE  05 0A     ORA $0A
  $B3F0  12        .db $12
  $B3F1  48        PHA
  $B3F2  25 89     AND $89
  $B3F4  2A        ROL
  $B3F5  44        .db $44
  $B3F6  20 82 ED  JSR $ED82
  $B3F9  97        .db $97
  $B3FA  5A        .db $5A
  $B3FB  76 D5     ROR $D5,X
  $B3FD  BB        .db $BB
  $B3FE  DF        .db $DF
  $B3FF  7D 80 80  ADC $8080,X
  $B402  81 80     STA ($80,X)
  $B404  80        .db $80
  $B405  80        .db $80
  $B406  81 80     STA ($80,X)
  $B408  80        .db $80
  $B409  80        .db $80
  $B40A  80        .db $80
  $B40B  80        .db $80
  $B40C  80        .db $80
  $B40D  80        .db $80
  $B40E  21 20     AND ($20,X)
  $B410  00        BRK
  $B411  00        BRK
  $B412  00        BRK
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

L_B421:
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
  $B42C  24 24     BIT $24
  $B42E  12        .db $12
  $B42F  24 24     BIT $24
  $B431  24 36     BIT $36
  $B433  36 12     ROL $12,X
  $B435  12        .db $12
  $B436  00        BRK
  $B437  00        BRK
  $B438  00        BRK
  $B439  48        PHA
  $B43A  5A        .db $5A
  $B43B  5A        .db $5A
  $B43C  6C 6C FF  JMP ($FF6C)
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
  $B460  98        TYA
  $B461  03        .db $03
  $B462  99 03 93  STA $9303,Y
  $B465  01 93     ORA ($93,X)
  $B467  01 9C     ORA ($9C,X)
  $B469  01 9F     ORA ($9F,X)
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  15 30     ORA $30,X
  $B46F  0F        .db $0F
  $B470  11 30     ORA ($30),Y
  $B472  95 03     STA $03,X
  $B474  93        .db $93
  $B475  01 92     ORA ($92,X)
  $B477  02        .db $02
  $B478  9A        TXS
  $B479  03        .db $03
  $B47A  9A        TXS
  $B47B  03        .db $03
  $B47C  9F        .db $9F
  $B47D  03        .db $03
  $B47E  0F        .db $0F
  $B47F  27        .db $27
  $B480  30 0F     BMI $B491
  $B482  27        .db $27
  $B483  30 9C     BMI $B421
  $B485  01 9C     ORA ($9C,X)
  $B487  01 9C     ORA ($9C,X)
  $B489  01 95     ORA ($95,X)
  $B48B  03        .db $03
  $B48C  93        .db $93
  $B48D  01 9F     ORA ($9F,X)
  $B48F  03        .db $03
  $B490  0F        .db $0F

L_B491:
  $B491  11 30     ORA ($30),Y
  $B493  0F        .db $0F
  $B494  15 37     ORA $37,X
  $B496  95 02     STA $02,X
  $B498  96 02     STX $02,Y
  $B49A  94 02     STY $02,X
  $B49C  9E        .db $9E
  $B49D  03        .db $03
  $B49E  9B        .db $9B
  $B49F  02        .db $02
  $B4A0  9F        .db $9F
  $B4A1  03        .db $03
  $B4A2  0F        .db $0F
  $B4A3  11 30     ORA ($30),Y
  $B4A5  0F        .db $0F
  $B4A6  16 28     ASL $28,X
  $B4A8  98        TYA
  $B4A9  03        .db $03
  $B4AA  99 03 9A  STA $9A03,Y
  $B4AD  03        .db $03
  $B4AE  9B        .db $9B
  $B4AF  03        .db $03
  $B4B0  9C        .db $9C
  $B4B1  03        .db $03
  $B4B2  9F        .db $9F
  $B4B3  03        .db $03
  $B4B4  0F        .db $0F
  $B4B5  11 30     ORA ($30),Y
  $B4B7  0F        .db $0F
  $B4B8  16 27     ASL $27,X
  $B4BA  94 01     STY $01,X
  $B4BC  95 01     STA $01,X
  $B4BE  96 01     STX $01,Y
  $B4C0  97        .db $97
  $B4C1  01 98     ORA ($98,X)
  $B4C3  01 9F     ORA ($9F,X)
  $B4C5  03        .db $03
  $B4C6  0F        .db $0F
  $B4C7  11 30     ORA ($30),Y
  $B4C9  0F        .db $0F
  $B4CA  16 27     ASL $27,X
  $B4CC  AE 05 AF  LDX $AF05
  $B4CF  05 B0     ORA $B0
  $B4D1  05 B1     ORA $B1
  $B4D3  05 B2     ORA $B2
  $B4D5  05 B3     ORA $B3
  $B4D7  05 0F     ORA $0F
  $B4D9  30 30     BMI $B50B
  $B4DB  0F        .db $0F
  $B4DC  30 16     BMI $B4F4
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

L_B4F4:
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

L_B50B:
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
  $B600  00        BRK
  $B601  00        BRK
  $B602  00        BRK
  $B603  01 01     ORA ($01,X)
  $B605  01 02     ORA ($02,X)
  $B607  03        .db $03
  $B608  03        .db $03
  $B609  04        .db $04
  $B60A  04        .db $04
  $B60B  04        .db $04
  $B60C  04        .db $04
  $B60D  05 05     ORA $05
  $B60F  05 05     ORA $05
  $B611  06 06     ASL $06
  $B613  06 06     ASL $06
  $B615  08        PHP
  $B616  0A        ASL
  $B617  0A        ASL
  $B618  0B        .db $0B
  $B619  0B        .db $0B
  $B61A  0C        .db $0C
  $B61B  0C        .db $0C
  $B61C  0D 0E 0E  ORA $0E0E
  $B61F  10 11     BPL $B632
  $B621  11 FF     ORA ($FF),Y
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

L_B632:
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

L_B6EB:
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

L_B701:
  $B701  88        DEY
  $B702  B8        CLV
  $B703  38        SEC
  $B704  A8        TAY

L_B705:
  $B705  B8        CLV
  $B706  C8        INY
  $B707  48        PHA
  $B708  88        DEY
  $B709  10 10     BPL $B71B
  $B70B  D8        CLD
  $B70C  F0 10     BEQ $B71E
  $B70E  D8        CLD
  $B70F  F0 F0     BEQ $B701
  $B711  10 D8     BPL $B6EB
  $B713  F0 F0     BEQ $B705
  $B715  18        CLC
  $B716  20 48 20  JSR $2048
  $B719  A8        TAY
  $B71A  20 80 80  JSR $8080
  $B71D  40        RTI

L_B71E:
  $B71E  6C E0 40  JMP ($40E0)
  $B721  A8        TAY
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
  $B800  78        SEI
  $B801  28        PLP
  $B802  48        PHA
  $B803  68        PLA
  $B804  58        CLI
  $B805  B8        CLV
  $B806  98        TYA
  $B807  88        DEY
  $B808  78        SEI
  $B809  38        SEC
  $B80A  68        PLA
  $B80B  48        PHA
  $B80C  68        PLA
  $B80D  78        SEI
  $B80E  48        PHA
  $B80F  48        PHA
  $B810  70 68     BVS $B87A
  $B812  48        PHA
  $B813  38        SEC
  $B814  68        PLA
  $B815  90 20     BCC $B837
  $B817  58        CLI
  $B818  20 B8 20  JSR $20B8
  $B81B  30 30     BMI $B84D
  $B81D  30 64     BMI $B883
  $B81F  10 10     BPL $B831
  $B821  10 FF     BPL $B822
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

L_B831:
  $B831  FF        .db $FF
  $B832  FF        .db $FF
  $B833  FF        .db $FF
  $B834  FF        .db $FF
  $B835  FF        .db $FF
  $B836  FF        .db $FF

L_B837:
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

L_B84D:
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

L_B87A:
  $B87A  FF        .db $FF
  $B87B  FF        .db $FF
  $B87C  FF        .db $FF
  $B87D  FF        .db $FF
  $B87E  FF        .db $FF
  $B87F  FF        .db $FF
  $B880  FF        .db $FF
  $B881  FF        .db $FF
  $B882  FF        .db $FF

L_B883:
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
  $B900  21 21     AND ($21,X)
  $B902  21 21     AND ($21,X)
  $B904  21 21     AND ($21,X)
  $B906  34        .db $34
  $B907  34        .db $34
  $B908  34        .db $34
  $B909  21 21     AND ($21,X)
  $B90B  12        .db $12
  $B90C  21 21     AND ($21,X)
  $B90E  12        .db $12
  $B90F  21 21     AND ($21,X)
  $B911  21 12     AND ($12,X)
  $B913  21 21     AND ($21,X)
  $B915  31 56     AND ($56),Y
  $B917  34        .db $34
  $B918  56 34     LSR $34,X
  $B91A  56 37     LSR $37,X
  $B91C  37        .db $37
  $B91D  37        .db $37
  $B91E  4B        .db $4B
  $B91F  2B        .db $2B
  $B920  2B        .db $2B
  $B921  2B        .db $2B
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
  $BA00  0E 0F 10  ASL $100F
  $BA03  11 11     ORA ($11),Y
  $BA05  12        .db $12
  $BA06  12        .db $12
  $BA07  13        .db $13
  $BA08  13        .db $13
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
  $BA40  88        DEY
  $BA41  70 48     BVS $BA8B
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
  $BA81  C8        INY
  $BA82  38        SEC
  $BA83  4F        .db $4F
  $BA84  6F        .db $6F
  $BA85  4F        .db $4F
  $BA86  6F        .db $6F
  $BA87  4F        .db $4F
  $BA88  6F        .db $6F
  $BA89  FF        .db $FF
  $BA8A  FF        .db $FF

L_BA8B:
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
  $BAC0  76 7A     ROR $7A,X
  $BAC2  7B        .db $7B
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
  $BB00  B4 B4     LDY $B4,X
  $BB02  74        .db $74
  $BB03  B4 B4     LDY $B4,X
  $BB05  B4 00     LDY $00,X
  $BB07  07        .db $07
  $BB08  12        .db $12
  $BB09  FF        .db $FF
  $BB0A  00        BRK
  $BB0B  00        BRK
  $BB0C  00        BRK
  $BB0D  15 22     ORA $22,X
  $BB0F  22        .db $22
  $BB10  22        .db $22
  $BB11  22        .db $22
  $BB12  00        BRK
  $BB13  00        BRK
  $BB14  05 09     ORA $09
  $BB16  09 09     ORA #$09
  $BB18  84 86     STY $86
  $BB1A  89        .db $89
  $BB1B  84 84     STY $84
  $BB1D  84 E0     STY $E0
  $BB1F  A0 60     LDY #$60
  $BB21  E0 E0     CPX #$E0
  $BB23  E0 85     CPX #$85
  $BB25  87        .db $87
  $BB26  89        .db $89
  $BB27  85 85     STA $85
  $BB29  85 60     STA $60
  $BB2B  20 E0 60  JSR $60E0
  $BB2E  60        RTS
  $BB2F  60        RTS
  $BB30  00        BRK
  $BB31  06 0F     ASL $0F
  $BB33  00        BRK
  $BB34  00        BRK
  $BB35  00        BRK
  $BB36  00        BRK
  $BB37  07        .db $07
  $BB38  12        .db $12
  $BB39  00        BRK
  $BB3A  00        BRK
  $BB3B  00        BRK
  $BB3C  00        BRK
  $BB3D  08        PHP
  $BB3E  12        .db $12
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
  $BC00  06 90     ASL $90
  $BC02  09 00     ORA #$00
  $BC04  84 01     STY $01
  $BC06  09 8F     ORA #$8F
  $BC08  05 01     ORA $01
  $BC0A  9F        .db $9F
  $BC0B  01 03     ORA ($03,X)
  $BC0D  80        .db $80
  $BC0E  06 09     ASL $09
  $BC10  A0 0A     LDY #$0A
  $BC12  07        .db $07
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
  $BE00  00        BRK
  $BE01  00        BRK
  $BE02  0F        .db $0F
  $BE03  39 18 12  AND $1218,Y
  $BE06  0F        .db $0F
  $BE07  12        .db $12
  $BE08  27        .db $27
  $BE09  20 0F 39  JSR $390F
  $BE0C  18        CLC
  $BE0D  12        .db $12
  $BE0E  0F        .db $0F
  $BE0F  39 18 01  AND $0118,Y
  $BE12  0F        .db $0F
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  11 30     ORA ($30),Y
  $BE1E  0F        .db $0F
  $BE1F  0F        .db $0F
  $BE20  11 30     ORA ($30),Y
  $BE22  0F        .db $0F
  $BE23  0F        .db $0F
  $BE24  0F        .db $0F
  $BE25  0F        .db $0F
  $BE26  0F        .db $0F
  $BE27  0F        .db $0F
  $BE28  0F        .db $0F
  $BE29  0F        .db $0F
  $BE2A  0F        .db $0F
  $BE2B  0F        .db $0F
  $BE2C  0F        .db $0F
  $BE2D  0F        .db $0F
  $BE2E  0F        .db $0F
  $BE2F  0F        .db $0F
  $BE30  0F        .db $0F
  $BE31  0F        .db $0F
  $BE32  0F        .db $0F
  $BE33  0F        .db $0F
  $BE34  0F        .db $0F
  $BE35  0F        .db $0F
  $BE36  0F        .db $0F
  $BE37  0F        .db $0F
  $BE38  0F        .db $0F
  $BE39  0F        .db $0F
  $BE3A  0F        .db $0F
  $BE3B  0F        .db $0F
  $BE3C  0F        .db $0F
  $BE3D  0F        .db $0F
  $BE3E  0F        .db $0F
  $BE3F  0F        .db $0F
  $BE40  0F        .db $0F
  $BE41  0F        .db $0F
  $BE42  0F        .db $0F
  $BE43  0F        .db $0F
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