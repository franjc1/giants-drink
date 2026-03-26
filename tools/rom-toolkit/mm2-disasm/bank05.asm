; Mega Man 2 — PRG Bank 5
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK

L_8002:
  $8002  00        BRK
  $8003  00        BRK
  $8004  19 1A 1A  ORA $1A1A,Y
  $8007  19 18 1A  ORA $1A18,Y
  $800A  18        CLC
  $800B  19 18 19  ORA $1918,Y
  $800E  18        CLC
  $800F  19 19 1A  ORA $1A19,Y
  $8012  18        CLC
  $8013  19 18 1A  ORA $1A18,Y
  $8016  1A        .db $1A
  $8017  19 19 19  ORA $1919,Y
  $801A  18        CLC
  $801B  19 18 19  ORA $1918,Y
  $801E  19 19 19  ORA $1919,Y
  $8021  DF        .db $DF
  $8022  19 E2 19  ORA $19E2,Y
  $8025  E4 19     CPX $19
  $8027  DF        .db $DF
  $8028  19 E2 19  ORA $19E2,Y
  $802B  E4 19     CPX $19
  $802D  E2        .db $E2
  $802E  19 E3 19  ORA $19E3,Y
  $8031  E3        .db $E3
  $8032  19 E3 19  ORA $19E3,Y
  $8035  E3        .db $E3
  $8036  19 E4 19  ORA $19E4,Y
  $8039  DF        .db $DF
  $803A  19 DF 19  ORA $19DF,Y
  $803D  19 19 19  ORA $1919,Y
  $8040  19 DF 19  ORA $19DF,Y
  $8043  E2        .db $E2
  $8044  19 E4 19  ORA $19E4,Y
  $8047  DF        .db $DF
  $8048  19 E2 19  ORA $19E2,Y
  $804B  E4 19     CPX $19
  $804D  E2        .db $E2
  $804E  19 E3 19  ORA $19E3,Y
  $8051  E3        .db $E3
  $8052  19 E3 19  ORA $19E3,Y
  $8055  E3        .db $E3
  $8056  19 E4 19  ORA $19E4,Y
  $8059  DF        .db $DF
  $805A  19 DF 19  ORA $19DF,Y
  $805D  19 DF 18  ORA $18DF,Y
  $8060  19 DF 19  ORA $19DF,Y
  $8063  E2        .db $E2
  $8064  19 E4 19  ORA $19E4,Y
  $8067  DF        .db $DF
  $8068  19 E2 19  ORA $19E2,Y
  $806B  E4 19     CPX $19
  $806D  E2        .db $E2
  $806E  19 E3 19  ORA $19E3,Y
  $8071  E3        .db $E3
  $8072  19 E3 19  ORA $19E3,Y
  $8075  E3        .db $E3
  $8076  19 E4 19  ORA $19E4,Y
  $8079  DF        .db $DF
  $807A  19 DF DF  ORA $DFDF,Y
  $807D  18        CLC
  $807E  19 19 DF  ORA $DF19,Y
  $8081  18        CLC
  $8082  E2        .db $E2
  $8083  18        CLC
  $8084  E4 18     CPX $18
  $8086  DF        .db $DF
  $8087  18        CLC
  $8088  E2        .db $E2
  $8089  18        CLC
  $808A  E4 18     CPX $18
  $808C  E2        .db $E2
  $808D  18        CLC
  $808E  E3        .db $E3
  $808F  18        CLC
  $8090  E3        .db $E3
  $8091  18        CLC
  $8092  E3        .db $E3
  $8093  18        CLC
  $8094  E3        .db $E3
  $8095  18        CLC
  $8096  E4 18     CPX $18
  $8098  DF        .db $DF
  $8099  18        CLC
  $809A  DF        .db $DF
  $809B  18        CLC
  $809C  19 19 19  ORA $1919,Y
  $809F  DF        .db $DF
  $80A0  DF        .db $DF
  $80A1  18        CLC
  $80A2  E2        .db $E2
  $80A3  18        CLC
  $80A4  E4 18     CPX $18
  $80A6  DF        .db $DF
  $80A7  18        CLC
  $80A8  E2        .db $E2
  $80A9  18        CLC
  $80AA  E4 18     CPX $18
  $80AC  E2        .db $E2
  $80AD  18        CLC
  $80AE  E3        .db $E3
  $80AF  18        CLC
  $80B0  E3        .db $E3
  $80B1  18        CLC
  $80B2  E3        .db $E3
  $80B3  18        CLC
  $80B4  E3        .db $E3
  $80B5  18        CLC
  $80B6  E4 18     CPX $18
  $80B8  DF        .db $DF
  $80B9  18        CLC
  $80BA  DF        .db $DF
  $80BB  18        CLC
  $80BC  19 19 19  ORA $1919,Y
  $80BF  DF        .db $DF
  $80C0  DF        .db $DF
  $80C1  18        CLC
  $80C2  E2        .db $E2
  $80C3  18        CLC
  $80C4  E4 18     CPX $18
  $80C6  DF        .db $DF
  $80C7  18        CLC
  $80C8  E2        .db $E2
  $80C9  18        CLC
  $80CA  E4 18     CPX $18
  $80CC  E2        .db $E2
  $80CD  18        CLC
  $80CE  E3        .db $E3
  $80CF  18        CLC
  $80D0  E3        .db $E3
  $80D1  18        CLC
  $80D2  E3        .db $E3
  $80D3  18        CLC
  $80D4  E3        .db $E3
  $80D5  18        CLC
  $80D6  E4 18     CPX $18
  $80D8  DF        .db $DF
  $80D9  18        CLC
  $80DA  DF        .db $DF
  $80DB  18        CLC
  $80DC  19 DF 19  ORA $19DF,Y
  $80DF  19 EA EC  ORA $ECEA,Y
  $80E2  18        CLC
  $80E3  19 18 19  ORA $1918,Y
  $80E6  EA        NOP
  $80E7  EC E2 18  CPX $18E2
  $80EA  E4 DF     CPX $DF
  $80EC  DF        .db $DF
  $80ED  18        CLC
  $80EE  EA        NOP
  $80EF  EC E2 DF  CPX $DFE2
  $80F2  E4 18     CPX $18
  $80F4  EA        NOP
  $80F5  EC DF 18  CPX $18DF
  $80F8  19 DF 19  ORA $19DF,Y
  $80FB  19 19 19  ORA $1919,Y
  $80FE  DF        .db $DF
  $80FF  18        CLC
  $8100  19 19 49  ORA $4919,Y
  $8103  4A        LSR
  $8104  18        CLC
  $8105  19 08 08  ORA $0808,Y
  $8108  19 19 DF  ORA $DF19,Y
  $810B  EA        NOP
  $810C  19 19 DF  ORA $DF19,Y
  $810F  EA        NOP
  $8110  19 19 DF  ORA $DF19,Y
  $8113  EA        NOP
  $8114  DF        .db $DF
  $8115  EA        NOP
  $8116  19 19 DF  ORA $DF19,Y
  $8119  EA        NOP
  $811A  19 19 DF  ORA $DF19,Y
  $811D  EA        NOP
  $811E  19 19 19  ORA $1919,Y
  $8121  19 49 49  ORA $4949,Y
  $8124  47        .db $47
  $8125  4C 47 4D  JMP $4D47
  $8128  19 19 EC  ORA $EC19,Y
  $812B  DF        .db $DF
  $812C  19 19 EC  ORA $EC19,Y
  $812F  DF        .db $DF
  $8130  19 19 EC  ORA $EC19,Y
  $8133  DF        .db $DF
  $8134  EC DF 19  CPX $19DF
  $8137  19 EC DF  ORA $DFEC,Y
  $813A  19 19 EC  ORA $EC19,Y
  $813D  DF        .db $DF
  $813E  19 19 4E  ORA $4E19,Y
  $8141  4B        .db $4B
  $8142  4F        .db $4F
  $8143  4B        .db $4B
  $8144  19 19 08  ORA $0819,Y
  $8147  08        PHP
  $8148  19 19 EA  ORA $EA19,Y
  $814B  EC 19 19  CPX $1919
  $814E  EA        NOP
  $814F  EC 19 19  CPX $1919
  $8152  EA        NOP
  $8153  EC EA EC  CPX $ECEA
  $8156  19 19 EA  ORA $EA19,Y
  $8159  EC 19 19  CPX $1919
  $815C  EA        NOP
  $815D  EC 19 19  CPX $1919
  $8160  E2        .db $E2
  $8161  18        CLC
  $8162  E4 1B     CPX $1B
  $8164  19 19 1C  ORA $1C19,Y
  $8167  1C        .db $1C
  $8168  19 19 EA  ORA $EA19,Y
  $816B  EB        .db $EB
  $816C  19 19 EA  ORA $EA19,Y
  $816F  EB        .db $EB
  $8170  19 19 EA  ORA $EA19,Y
  $8173  EB        .db $EB
  $8174  EA        NOP
  $8175  EB        .db $EB
  $8176  19 19 EA  ORA $EA19,Y
  $8179  EB        .db $EB
  $817A  19 19 EA  ORA $EA19,Y
  $817D  EB        .db $EB
  $817E  19 19 E4  ORA $E419,Y
  $8181  1B        .db $1B
  $8182  DF        .db $DF
  $8183  18        CLC
  $8184  1C        .db $1C
  $8185  1C        .db $1C
  $8186  19 19 19  ORA $1919,Y
  $8189  19 EB EB  ORA $EBEB,Y
  $818C  19 19 EB  ORA $EB19,Y
  $818F  EB        .db $EB
  $8190  19 19 EB  ORA $EB19,Y
  $8193  EB        .db $EB
  $8194  EB        .db $EB
  $8195  EB        .db $EB
  $8196  19 19 EB  ORA $EB19,Y
  $8199  EB        .db $EB
  $819A  19 19 EB  ORA $EB19,Y
  $819D  EB        .db $EB
  $819E  19 19 19  ORA $1919,Y
  $81A1  E4 1C     CPX $1C
  $81A3  DF        .db $DF
  $81A4  18        CLC
  $81A5  19 1B 1C  ORA $1C1B,Y
  $81A8  19 19 EB  ORA $EB19,Y
  $81AB  EC 19 19  CPX $1919
  $81AE  EB        .db $EB
  $81AF  EC 19 19  CPX $1919
  $81B2  EB        .db $EB
  $81B3  EC EB EC  CPX $ECEB
  $81B6  19 19 EB  ORA $EB19,Y
  $81B9  EC 19 19  CPX $1919
  $81BC  EB        .db $EB
  $81BD  EC 19 19  CPX $1919
  $81C0  1C        .db $1C
  $81C1  E2        .db $E2
  $81C2  1C        .db $1C
  $81C3  E4 1B     CPX $1B
  $81C5  1C        .db $1C
  $81C6  18        CLC
  $81C7  19 19 19  ORA $1919,Y
  $81CA  DF        .db $DF
  $81CB  DF        .db $DF
  $81CC  19 19 DF  ORA $DF19,Y
  $81CF  DF        .db $DF
  $81D0  19 19 DF  ORA $DF19,Y
  $81D3  DF        .db $DF
  $81D4  DF        .db $DF
  $81D5  DF        .db $DF
  $81D6  19 19 DF  ORA $DF19,Y
  $81D9  DF        .db $DF
  $81DA  19 19 DF  ORA $DF19,Y
  $81DD  DF        .db $DF
  $81DE  19 19 DF  ORA $DF19,Y
  $81E1  E2        .db $E2
  $81E2  19 E3 19  ORA $19E3,Y
  $81E5  DF        .db $DF
  $81E6  EA        NOP
  $81E7  EC 18 19  CPX $1918
  $81EA  DF        .db $DF
  $81EB  19 DF 19  ORA $19DF,Y
  $81EE  18        CLC
  $81EF  19 EA EC  ORA $ECEA,Y
  $81F2  19 DF 18  ORA $18DF,Y
  $81F5  1E 18 1E  ASL $1E18,X
  $81F8  EB        .db $EB
  $81F9  EC 19 DF  CPX $DF19
  $81FC  19 DF EB  ORA $EBDF,Y
  $81FF  EC 00 40  CPX $4000
  $8202  00        BRK
  $8203  40        RTI
  $8204  64        .db $64
  $8205  66 65     ROR $65
  $8207  67        .db $67
  $8208  64        .db $64
  $8209  67        .db $67
  $820A  65 66     ADC $66
  $820C  64        .db $64
  $820D  67        .db $67
  $820E  61 63     ADC ($63,X)
  $8210  60        RTS
  $8211  62        .db $62
  $8212  65 66     ADC $66
  $8214  64        .db $64
  $8215  66 61     ROR $61
  $8217  63        .db $63
  $8218  60        RTS
  $8219  62        .db $62
  $821A  65 67     ADC $67
  $821C  28        PLP
  $821D  28        PLP
  $821E  28        PLP
  $821F  28        PLP
  $8220  2A        ROL
  $8221  2A        ROL
  $8222  2A        ROL
  $8223  2A        ROL
  $8224  29 2A     AND #$2A
  $8226  29 2A     AND #$2A
  $8228  2A        ROL
  $8229  2A        ROL
  $822A  2A        ROL
  $822B  65 2A     ADC $2A
  $822D  64        .db $64
  $822E  2A        ROL
  $822F  65 66     ADC $66
  $8231  29 67     AND #$67
  $8233  29 29     AND #$29
  $8235  2A        ROL
  $8236  67        .db $67
  $8237  29 29     AND #$29
  $8239  2A        ROL
  $823A  08        PHP
  $823B  08        PHP
  $823C  2A        ROL
  $823D  2A        ROL
  $823E  08        PHP
  $823F  08        PHP
  $8240  2A        ROL
  $8241  66 65     ROR $65
  $8243  67        .db $67
  $8244  64        .db $64
  $8245  29 65     AND #$65
  $8247  29 6B     AND #$6B
  $8249  00        BRK
  $824A  6B        .db $6B
  $824B  00        BRK
  $824C  61 63     ADC ($63,X)
  $824E  64        .db $64
  $824F  67        .db $67
  $8250  65 66     ADC $66
  $8252  60        RTS
  $8253  62        .db $62
  $8254  00        BRK
  $8255  00        BRK
  $8256  2C 00 00  BIT $0000
  $8259  6C 00 40  JMP ($4000)
  $825C  2C 40 00  BIT $0040
  $825F  40        RTI
  $8260  C5 4E     CMP $4E
  $8262  17        .db $17
  $8263  4E 17 4E  LSR $4E17
  $8266  17        .db $17
  $8267  4E 17 4E  LSR $4E17
  $826A  17        .db $17
  $826B  C5 16     CMP $16
  $826D  17        .db $17
  $826E  C5 C5     CMP $C5
  $8270  17        .db $17
  $8271  4E C5 4E  LSR $4EC5
  $8274  17        .db $17
  $8275  C5 17     CMP $17
  $8277  4E 38 3A  LSR $3A38
  $827A  39 3B 17  AND $173B,Y
  $827D  AE 17 AE  LDX $AE17
  $8280  19 E0 19  ORA $19E0,Y
  $8283  E3        .db $E3
  $8284  E8        INX
  $8285  19 E4 19  ORA $19E4,Y
  $8288  DF        .db $DF
  $8289  1B        .db $1B
  $828A  E2        .db $E2
  $828B  1B        .db $1B
  $828C  1C        .db $1C
  $828D  1C        .db $1C
  $828E  1C        .db $1C
  $828F  1C        .db $1C
  $8290  00        BRK
  $8291  06 09     ASL $09
  $8293  07        .db $07
  $8294  17        .db $17
  $8295  17        .db $17
  $8296  48        PHA
  $8297  50 00     BVC $8299

L_8299:
  $8299  00        BRK
  $829A  00        BRK
  $829B  00        BRK
  $829C  01 01     ORA ($01,X)
  $829E  05 01     ORA $01
  $82A0  01 01     ORA ($01,X)
  $82A2  01 01     ORA ($01,X)
  $82A4  01 01     ORA ($01,X)
  $82A6  01 02     ORA ($02,X)
  $82A8  01 03     ORA ($03,X)
  $82AA  01 03     ORA ($03,X)
  $82AC  01 04     ORA ($04,X)
  $82AE  01 01     ORA ($01,X)
  $82B0  01 01     ORA ($01,X)
  $82B2  08        PHP
  $82B3  08        PHP
  $82B4  09 09     ORA #$09
  $82B6  01 01     ORA ($01,X)
  $82B8  01 01     ORA ($01,X)
  $82BA  08        PHP
  $82BB  05 00     ORA $00
  $82BD  06 00     ASL $00
  $82BF  06 09     ASL $09
  $82C1  07        .db $07
  $82C2  01 01     ORA ($01,X)
  $82C4  02        .db $02
  $82C5  08        PHP
  $82C6  03        .db $03
  $82C7  00        BRK
  $82C8  03        .db $03
  $82C9  00        BRK
  $82CA  03        .db $03
  $82CB  00        BRK
  $82CC  04        .db $04
  $82CD  09 01     ORA #$01
  $82CF  01 08     ORA ($08,X)
  $82D1  08        PHP
  $82D2  00        BRK
  $82D3  00        BRK
  $82D4  05 01     ORA $01
  $82D6  06 01     ASL $01
  $82D8  06 01     ASL $01
  $82DA  06 01     ASL $01
  $82DC  07        .db $07
  $82DD  01 01     ORA ($01,X)
  $82DF  01 0A     ORA ($0A,X)
  $82E1  0A        ASL
  $82E2  0A        ASL
  $82E3  0A        ASL
  $82E4  0A        ASL
  $82E5  0A        ASL
  $82E6  0C        .db $0C
  $82E7  0C        .db $0C
  $82E8  0A        ASL
  $82E9  0B        .db $0B
  $82EA  0A        ASL
  $82EB  0B        .db $0B
  $82EC  0A        ASL
  $82ED  0B        .db $0B
  $82EE  0C        .db $0C
  $82EF  0D 01 02  ORA $0201
  $82F2  01 03     ORA ($03,X)
  $82F4  01 03     ORA ($03,X)
  $82F6  01 04     ORA ($04,X)
  $82F8  00        BRK
  $82F9  00        BRK
  $82FA  09 09     ORA #$09
  $82FC  06 01     ASL $01
  $82FE  07        .db $07
  $82FF  01 01     ORA ($01,X)
  $8301  01 01     ORA ($01,X)
  $8303  01 03     ORA ($03,X)
  $8305  04        .db $04
  $8306  01 05     ORA ($05,X)
  $8308  01 06     ORA ($06,X)
  $830A  01 07     ORA ($07,X)
  $830C  08        PHP
  $830D  09 0A     ORA #$0A
  $830F  0B        .db $0B
  $8310  16 18     ASL $18,X
  $8312  17        .db $17
  $8313  0F        .db $0F
  $8314  10 0C     BPL $8322
  $8316  11 0D     ORA ($0D),Y
  $8318  12        .db $12
  $8319  0E 13 0F  ASL $0F13
  $831C  14        .db $14
  $831D  0D 15 0D  ORA $0D15
  $8320  19 20 19  ORA $1920,Y
  $8323  21 1A     AND ($1A,X)
  $8325  22        .db $22
  $8326  1B        .db $1B
  $8327  23        .db $23
  $8328  1C        .db $1C
  $8329  1F        .db $1F
  $832A  1D 1F 1F  ORA $1F1F,X
  $832D  24 1F     BIT $1F
  $832F  25 1F     AND $1F
  $8331  26 1F     ROL $1F
  $8333  24 1F     BIT $1F
  $8335  24 1F     BIT $1F
  $8337  24 27     BIT $27
  $8339  2E 28 2F  ROL $2F28
  $833C  29 31     AND #$31
  $833E  2A        ROL
  $833F  31 25     AND ($25),Y
  $8341  26 2D     ROL $2D
  $8343  27        .db $27
  $8344  26 26     ROL $26
  $8346  27        .db $27
  $8347  27        .db $27
  $8348  25 26     AND $26
  $834A  08        PHP
  $834B  08        PHP
  $834C  26 26     ROL $26
  $834E  08        PHP
  $834F  08        PHP
  $8350  EA        NOP
  $8351  EC 2D 27  CPX $272D
  $8354  25 26     AND $26
  $8356  27        .db $27
  $8357  27        .db $27
  $8358  DF        .db $DF
  $8359  EA        NOP
  $835A  27        .db $27
  $835B  27        .db $27
  $835C  EC DF 27  CPX $27DF
  $835F  27        .db $27
  $8360  25 26     AND $26
  $8362  EA        NOP
  $8363  EC 26 26  CPX $2626
  $8366  EA        NOP
  $8367  EB        .db $EB
  $8368  26 26     ROL $26
  $836A  EC DF 26  CPX $26DF
  $836D  E3        .db $E3
  $836E  DF        .db $DF
  $836F  E4 26     CPX $26
  $8371  26 EB     ROL $EB
  $8373  EC 26 26  CPX $2626
  $8376  27        .db $27
  $8377  E2        .db $E2
  $8378  26 E4     ROL $E4
  $837A  27        .db $27
  $837B  27        .db $27
  $837C  26 26     ROL $26
  $837E  27        .db $27
  $837F  E2        .db $E2
  $8380  26 E4     ROL $E4
  $8382  E2        .db $E2
  $8383  DF        .db $DF
  $8384  E4 1B     CPX $1B
  $8386  DF        .db $DF
  $8387  1B        .db $1B
  $8388  EA        NOP
  $8389  EB        .db $EB
  $838A  27        .db $27
  $838B  E2        .db $E2
  $838C  26 E4     ROL $E4
  $838E  E2        .db $E2
  $838F  DF        .db $DF
  $8390  E4 18     CPX $18
  $8392  EA        NOP
  $8393  EC 19 E4  CPX $E419
  $8396  EA        NOP
  $8397  EB        .db $EB
  $8398  18        CLC
  $8399  1A        .db $1A
  $839A  EB        .db $EB
  $839B  EC EB EC  CPX $ECEB
  $839E  18        CLC
  $839F  E2        .db $E2
  $83A0  18        CLC
  $83A1  E3        .db $E3

L_83A2:
  $83A2  18        CLC
  $83A3  E3        .db $E3
  $83A4  01 01     ORA ($01,X)
  $83A6  02        .db $02
  $83A7  08        PHP
  $83A8  03        .db $03
  $83A9  00        BRK
  $83AA  04        .db $04
  $83AB  09 08     ORA #$08
  $83AD  05 00     ORA $00
  $83AF  06 00     ASL $00
  $83B1  00        BRK
  $83B2  00        BRK
  $83B3  00        BRK
  $83B4  00        BRK
  $83B5  2C 00 00  BIT $0000
  $83B8  2C 00 00  BIT $0000
  $83BB  00        BRK
  $83BC  00        BRK
  $83BD  00        BRK
  $83BE  00        BRK
  $83BF  2C 2B 31  BIT $312B
  $83C2  2C 31 32  BIT $3231
  $83C5  31 32     AND ($32),Y
  $83C7  31 32     AND ($32),Y
  $83C9  31 32     AND ($32),Y
  $83CB  34        .db $34
  $83CC  35 30     AND $30,X
  $83CE  35 24     AND $24,X
  $83D0  35 2E     AND $2E,X
  $83D2  36 2F     ROL $2F,X
  $83D4  37        .db $37
  $83D5  31 2F     AND ($2F),Y
  $83D7  31 31     AND ($31),Y
  $83D9  34        .db $34
  $83DA  31 31     AND ($31),Y
  $83DC  31 33     AND ($33),Y
  $83DE  34        .db $34
  $83DF  31 31     AND ($31),Y
  $83E1  34        .db $34
  $83E2  34        .db $34
  $83E3  33        .db $33
  $83E4  33        .db $33
  $83E5  34        .db $34
  $83E6  31 34     AND ($34),Y
  $83E8  2E 31 2F  ROL $2F31
  $83EB  31 1E     AND ($1E),Y
  $83ED  21 29     AND ($29,X)
  $83EF  1F        .db $1F
  $83F0  01 01     ORA ($01,X)
  $83F2  01 02     ORA ($02,X)
  $83F4  34        .db $34
  $83F5  31 33     AND ($33),Y
  $83F7  31 1E     AND ($1E),Y
  $83F9  20 29 21  JSR $2129
  $83FC  19 20 19  ORA $1920,Y
  $83FF  20 00 00  JSR $0000
  $8402  00        BRK
  $8403  00        BRK

L_8404:
  $8404  00        BRK
  $8405  00        BRK

L_8406:
  $8406  00        BRK
  $8407  00        BRK
  $8408  90 E0     BCC $83EA
  $840A  50 50     BVC $845C
  $840C  50 50     BVC $845E
  $840E  90 00     BCC $8410

L_8410:
  $8410  70 90     BVS $83A2
  $8412  F0 F0     BEQ $8404
  $8414  F0 F0     BEQ $8406
  $8416  70 0C     BVS $8424
  $8418  E0 70     CPX #$70
  $841A  A0 A0     LDY #$A0
  $841C  A0 A0     LDY #$A0
  $841E  E0 02     CPX #$02
  $8420  09 0E     ORA #$0E
  $8422  05 05     ORA $05

L_8424:
  $8424  05 05     ORA $05
  $8426  09 80     ORA #$80
  $8428  07        .db $07
  $8429  09 0F     ORA #$0F
  $842B  0F        .db $0F
  $842C  0F        .db $0F
  $842D  0F        .db $0F
  $842E  07        .db $07
  $842F  C0 0E     CPY #$0E
  $8431  07        .db $07
  $8432  0A        ASL
  $8433  0A        ASL
  $8434  0A        ASL
  $8435  0A        ASL
  $8436  0E 10 33  ASL $3310
  $8439  88        DEY
  $843A  CA        DEX
  $843B  CE 25 3B  DEC $3B25
  $843E  30 04     BMI $8444
  $8440  44        .db $44
  $8441  44        .db $44
  $8442  C8        INY
  $8443  84 4C     STY $4C
  $8445  32        .db $32
  $8446  21 13     AND ($13,X)
  $8448  44        .db $44
  $8449  55 4C     EOR $4C,X
  $844B  C8        INY
  $844C  84 13     STY $13
  $844E  32        .db $32
  $844F  21 55     AND ($55,X)
  $8451  44        .db $44
  $8452  88        DEY
  $8453  44        .db $44
  $8454  CC 22 11  CPY $1122
  $8457  33        .db $33
  $8458  05 00     ORA $00
  $845A  88        DEY
  $845B  44        .db $44

L_845C:
  $845C  CC 22 11  CPY $1122
  $845F  33        .db $33

L_8460:
  $8460  0E 00 88  ASL $8800
  $8463  44        .db $44
  $8464  CC 22 11  CPY $1122
  $8467  33        .db $33
  $8468  E0 00     CPX #$00
  $846A  88        DEY
  $846B  44        .db $44
  $846C  CC 22 11  CPY $1122
  $846F  33        .db $33
  $8470  F0 00     BEQ $8472

L_8472:
  $8472  C8        INY
  $8473  84 4C     STY $4C
  $8475  32        .db $32
  $8476  21 13     AND ($13,X)
  $8478  A1 64     LDA ($64,X)
  $847A  08        PHP
  $847B  03        .db $03
  $847C  E2        .db $E2
  $847D  00        BRK
  $847E  E2        .db $E2
  $847F  DC        .db $DC
  $8480  00        BRK
  $8481  00        BRK
  $8482  00        BRK
  $8483  00        BRK
  $8484  00        BRK
  $8485  00        BRK
  $8486  00        BRK
  $8487  FF        .db $FF
  $8488  55 55     EOR $55,X
  $848A  15 05     ORA $05,X
  $848C  50 51     BVC $84DF
  $848E  99 99 01  STA $0199,Y
  $8491  50 0A     BVC $849D
  $8493  00        BRK
  $8494  00        BRK
  $8495  08        PHP
  $8496  20 02 F8  JSR $F802
  $8499  FA        .db $FA
  $849A  3A        .db $3A
  $849B  22        .db $22
  $849C  F2        .db $F2

L_849D:
  $849D  CA        DEX
  $849E  00        BRK
  $849F  0A        ASL
  $84A0  50 05     BVC $84A7
  $84A2  0E 00 01  ASL $0100
  $84A5  EE 55 00  INC $0055
  $84A8  00        BRK
  $84A9  00        BRK
  $84AA  00        BRK
  $84AB  00        BRK
  $84AC  00        BRK
  $84AD  00        BRK
  $84AE  00        BRK
  $84AF  05 00     ORA $00
  $84B1  40        RTI
  $84B2  50 00     BVC $84B4

L_84B4:
  $84B4  44        .db $44
  $84B5  00        BRK
  $84B6  00        BRK
  $84B7  00        BRK
  $84B8  55 55     EOR $55,X
  $84BA  55 55     EOR $55,X
  $84BC  00        BRK
  $84BD  00        BRK
  $84BE  11 00     ORA ($00),Y
  $84C0  00        BRK
  $84C1  00        BRK
  $84C2  00        BRK
  $84C3  00        BRK
  $84C4  90 90     BCC $8456
  $84C6  A0 A0     LDY #$A0
  $84C8  AA        TAX
  $84C9  A5 AA     LDA $AA
  $84CB  6A        ROR
  $84CC  9A        TXS
  $84CD  AA        TAX
  $84CE  AA        TAX
  $84CF  AA        TAX
  $84D0  00        BRK
  $84D1  00        BRK
  $84D2  44        .db $44
  $84D3  44        .db $44
  $84D4  33        .db $33
  $84D5  00        BRK
  $84D6  21 32     AND ($32,X)
  $84D8  88        DEY
  $84D9  44        .db $44
  $84DA  84 5C     STY $5C
  $84DC  44        .db $44
  $84DD  40        RTI
  $84DE  10 80     BPL $8460
  $84E0  6C 0B B3  JMP ($B30B)
  $84E3  6C 8B DC  JMP ($DC8B)
  $84E6  CC 73 50  CPY $5073
  $84E9  00        BRK
  $84EA  10 04     BPL $84F0
  $84EC  00        BRK
  $84ED  20 02 80  JSR $8002

L_84F0:
  $84F0  FF        .db $FF
  $84F1  FF        .db $FF
  $84F2  FF        .db $FF
  $84F3  FF        .db $FF
  $84F4  FF        .db $FF
  $84F5  FF        .db $FF
  $84F6  FF        .db $FF
  $84F7  FF        .db $FF
  $84F8  FF        .db $FF
  $84F9  FF        .db $FF
  $84FA  AA        TAX
  $84FB  FF        .db $FF
  $84FC  00        BRK
  $84FD  FF        .db $FF
  $84FE  AA        TAX
  $84FF  AA        TAX
  $8500  08        PHP
  $8501  38        SEC
  $8502  5E 4F 57  LSR $574F,X
  $8505  23        .db $23
  $8506  21 0F     AND ($0F,X)
  $8508  1D 02 01  ORA $0102,X
  $850B  01 01     ORA ($01,X)
  $850D  25 58     AND $58
  $850F  59 70 02  EOR $0270,Y
  $8512  01 01     ORA ($01,X)
  $8514  01 30     ORA ($30,X)
  $8516  3A        .db $3A
  $8517  53        .db $53
  $8518  0A        ASL
  $8519  02        .db $02
  $851A  01 01     ORA ($01,X)
  $851C  01 2D     ORA ($2D,X)
  $851E  28        PLP
  $851F  0F        .db $0F
  $8520  18        CLC
  $8521  02        .db $02
  $8522  01 01     ORA ($01,X)
  $8524  01 58     ORA ($58,X)
  $8526  25 0F     AND $0F
  $8528  14        .db $14
  $8529  02        .db $02
  $852A  01 01     ORA ($01,X)
  $852C  01 33     ORA ($33,X)
  $852E  3B        .db $3B
  $852F  52        .db $52
  $8530  19 02 01  ORA $0102,Y
  $8533  01 01     ORA ($01,X)
  $8535  60        RTS
  $8536  58        CLI
  $8537  59 1A 02  EOR $021A,Y
  $853A  01 01     ORA ($01,X)
  $853C  01 20     ORA ($20,X)
  $853E  36 0F     ROL $0F,X
  $8540  3E 3C 3D  ROL $3D3C,X

L_8543:
  $8543  78        SEI
  $8544  02        .db $02
  $8545  35 58     AND $58,X
  $8547  59 59 2B  EOR $2B59,Y
  $854A  58        CLI
  $854B  68        PLA
  $854C  02        .db $02
  $854D  22        .db $22
  $854E  3B        .db $3B
  $854F  5A        .db $5A
  $8550  52        .db $52
  $8551  31 2B     AND ($2B),Y
  $8553  0B        .db $0B
  $8554  02        .db $02
  $8555  2B        .db $2B
  $8556  23        .db $23
  $8557  0F        .db $0F
  $8558  0F        .db $0F
  $8559  33        .db $33
  $855A  31 11     AND ($11),Y
  $855C  02        .db $02
  $855D  31 25     AND ($25),Y
  $855F  0F        .db $0F
  $8560  0F        .db $0F
  $8561  21 3A     AND ($3A,X)
  $8563  79 02 32  ADC $3202,Y
  $8566  36 0F     ROL $0F,X
  $8568  59 23 26  EOR $2623,Y
  $856B  1B        .db $1B
  $856C  02        .db $02
  $856D  28        PLP
  $856E  3A        .db $3A
  $856F  5B        .db $5B
  $8570  54        .db $54
  $8571  24 58     BIT $58
  $8573  68        PLA
  $8574  02        .db $02
  $8575  25 2B     AND $2B
  $8577  0F        .db $0F
  $8578  61 29     ADC ($29,X)
  $857A  3A        .db $3A
  $857B  79 02 36  ADC $3602,Y
  $857E  2D 0F 59  AND $590F
  $8581  2A        ROL
  $8582  28        PLP
  $8583  01 01     ORA ($01,X)
  $8585  23        .db $23
  $8586  58        CLI
  $8587  59 6B 33  EOR $336B,Y
  $858A  25 1B     AND $1B
  $858C  03        .db $03
  $858D  25 45     AND $45
  $858F  67        .db $67
  $8590  59 60 30  EOR $3060,Y
  $8593  09 03     ORA #$03
  $8595  75 78     ADC $78,X
  $8597  03        .db $03
  $8598  59 23 2D  EOR $2D23,Y
  $859B  10 03     BPL $85A0
  $859D  17        .db $17
  $859E  09 71     ORA #$71

L_85A0:
  $85A0  61 29     ADC ($29,X)
  $85A2  22        .db $22
  $85A3  0D 03 33  ORA $3303
  $85A6  0B        .db $0B
  $85A7  03        .db $03
  $85A8  0F        .db $0F
  $85A9  2B        .db $2B
  $85AA  30 1A     BMI $85C6
  $85AC  03        .db $03
  $85AD  21 0D     AND ($0D,X)
  $85AF  38        SEC
  $85B0  0F        .db $0F
  $85B1  31 2C     AND ($2C),Y
  $85B3  10 03     BPL $85B8
  $85B5  22        .db $22
  $85B6  18        CLC
  $85B7  69 2F     ADC #$2F
  $85B9  3A        .db $3A
  $85BA  31 0C     AND ($0C),Y
  $85BC  03        .db $03
  $85BD  30 14     BMI $85D3
  $85BF  69 0B     ADC #$0B
  $85C1  03        .db $03
  $85C2  0F        .db $0F
  $85C3  11 03     ORA ($03),Y
  $85C5  2C 19 39  BIT $3919
  $85C8  11 03     ORA ($03),Y
  $85CA  22        .db $22
  $85CB  13        .db $13
  $85CC  03        .db $03
  $85CD  31 18     AND ($18),Y
  $85CF  03        .db $03
  $85D0  12        .db $12
  $85D1  03        .db $03
  $85D2  30 19     BMI $85ED
  $85D4  03        .db $03
  $85D5  32        .db $32
  $85D6  14        .db $14
  $85D7  71 08     ADC ($08),Y
  $85D9  03        .db $03
  $85DA  2D 3E 07  AND $073E
  $85DD  23        .db $23
  $85DE  19 03 1C  ORA $1C03,Y
  $85E1  03        .db $03
  $85E2  3A        .db $3A
  $85E3  53        .db $53
  $85E4  06 24     ASL $24
  $85E6  1A        .db $1A
  $85E7  69 09     ADC #$09
  $85E9  03        .db $03
  $85EA  30 12     BMI $85FE
  $85EC  03        .db $03

L_85ED:
  $85ED  29 16     AND #$16
  $85EF  39 0B 03  AND $030B,Y
  $85F2  2D 08 03  AND $0308
  $85F5  30 12     BMI $8609
  $85F7  03        .db $03
  $85F8  0D 03 58  ORA $5803
  $85FB  68        PLA
  $85FC  03        .db $03
  $85FD  2C 08 03  BIT $0308
  $8600  1B        .db $1B
  $8601  03        .db $03
  $8602  36 0A     ROL $0A,X
  $8604  03        .db $03
  $8605  31 1D     AND ($1D),Y
  $8607  03        .db $03
  $8608  68        PLA

L_8609:
  $8609  03        .db $03
  $860A  46 6D     LSR $6D
  $860C  07        .db $07
  $860D  30 0B     BMI $861A
  $860F  71 0B     ADC ($0B),Y
  $8611  39 5B 6B  AND $6B5B,Y
  $8614  06 2D     ASL $2D
  $8616  11 38     ORA ($38),Y
  $8618  11 03     ORA ($03),Y

L_861A:
  $861A  0F        .db $0F
  $861B  0F        .db $0F
  $861C  0F        .db $0F
  $861D  0F        .db $0F
  $861E  12        .db $12
  $861F  71 70     ADC ($70),Y
  $8621  03        .db $03
  $8622  30 0F     BMI $8633
  $8624  0F        .db $0F
  $8625  2B        .db $2B
  $8626  08        PHP
  $8627  69 0B     ADC #$0B
  $8629  03        .db $03
  $862A  2D 0F 0F  AND $0F0F
  $862D  31 1D     AND ($1D),Y
  $862F  71 0D     ADC ($0D),Y
  $8631  03        .db $03
  $8632  20 0F 0F  JSR $0F0F
  $8635  33        .db $33
  $8636  10 39     BPL $8671
  $8638  18        CLC
  $8639  03        .db $03
  $863A  21 08     AND ($08,X)
  $863C  38        SEC
  $863D  35 0D     AND $0D,X
  $863F  03        .db $03
  $8640  14        .db $14
  $8641  03        .db $03
  $8642  28        PLP
  $8643  1D 69 3C  ORA $3C69,X
  $8646  57        .db $57
  $8647  07        .db $07
  $8648  19 03 24  ORA $2403,Y
  $864B  10 69     BPL $86B6
  $864D  3B        .db $3B
  $864E  5A        .db $5A
  $864F  62        .db $62
  $8650  70 03     BVS $8655
  $8652  29 0D     AND #$0D
  $8654  39 5C 6C  AND $6C5C,Y
  $8657  06 08     ASL $08
  $8659  03        .db $03
  $865A  2A        ROL
  $865B  0F        .db $0F
  $865C  0F        .db $0F
  $865D  0F        .db $0F
  $865E  08        PHP
  $865F  71 1C     ADC ($1C),Y
  $8661  03        .db $03
  $8662  5E 4F 3C  LSR $3C4F,X
  $8665  2A        ROL
  $8666  1D 38 68  ORA $6838,X
  $8669  39 74 06  AND $0674,Y
  $866C  36 33     ROL $33,X
  $866E  10 69     BPL $86D9
  $8670  0F        .db $0F

L_8671:
  $8671  0F        .db $0F
  $8672  1A        .db $1A
  $8673  03        .db $03
  $8674  58        CLI
  $8675  21 0C     AND ($0C,X)
  $8677  39 08 38  AND $3808,Y
  $867A  56 07     LSR $07,X
  $867C  3A        .db $3A
  $867D  22        .db $22
  $867E  11 71     ORA ($71),Y
  $8680  1C        .db $1C
  $8681  03        .db $03
  $8682  0F        .db $0F
  $8683  0F        .db $0F
  $8684  0F        .db $0F
  $8685  0F        .db $0F
  $8686  18        CLC
  $8687  03        .db $03
  $8688  09 03     ORA #$03
  $868A  3D 46 6D  AND $6D46,X
  $868D  28        PLP
  $868E  14        .db $14
  $868F  03        .db $03
  $8690  10 03     BPL $8695
  $8692  2B        .db $2B
  $8693  2F        .db $2F
  $8694  06 25     ASL $25
  $8696  19 69 11  ORA $1169,Y
  $8699  03        .db $03
  $869A  2D 0B 03  AND $030B
  $869D  1F        .db $1F
  $869E  12        .db $12
  $869F  03        .db $03
  $86A0  70 03     BVS $86A5
  $86A2  20 11 39  JSR $3911

L_86A5:
  $86A5  73        .db $73
  $86A6  79 7A 0B  ADC $0B7A,Y
  $86A9  03        .db $03
  $86AA  35 0F     AND $0F,X
  $86AC  0F        .db $0F
  $86AD  0F        .db $0F
  $86AE  0F        .db $0F
  $86AF  0F        .db $0F
  $86B0  11 03     ORA ($03),Y
  $86B2  47        .db $47
  $86B3  66 4F     ROR $4F
  $86B5  57        .db $57

L_86B6:
  $86B6  5D 65 70  EOR $7065,X
  $86B9  39 53 72  AND $7253,Y
  $86BC  5B        .db $5B
  $86BD  4C 5C 4A  JMP $4A5C
  $86C0  0D 38 5E  ORA $5E38
  $86C3  4F        .db $4F
  $86C4  5F        .db $5F
  $86C5  6F        .db $6F
  $86C6  46 65     LSR $65
  $86C8  1B        .db $1B
  $86C9  03        .db $03
  $86CA  01 01     ORA ($01,X)
  $86CC  01 17     ORA ($17,X)
  $86CE  27        .db $27
  $86CF  53        .db $53
  $86D0  68        PLA
  $86D1  03        .db $03
  $86D2  01 01     ORA ($01,X)
  $86D4  01 33     ORA ($33,X)
  $86D6  0F        .db $0F
  $86D7  0F        .db $0F
  $86D8  0A        ASL

L_86D9:
  $86D9  03        .db $03
  $86DA  01 01     ORA ($01,X)
  $86DC  01 21     ORA ($21,X)
  $86DE  0E 38 79  ASL $7938
  $86E1  03        .db $03
  $86E2  01 01     ORA ($01,X)
  $86E4  01 30     ORA ($30,X)
  $86E6  0A        ASL
  $86E7  03        .db $03
  $86E8  01 01     ORA ($01,X)
  $86EA  01 01     ORA ($01,X)
  $86EC  01 2D     ORA ($2D,X)
  $86EE  10 03     BPL $86F3
  $86F0  4E 5E 4F  LSR $4F5E

L_86F3:
  $86F3  47        .db $47
  $86F4  6E 1F 0D  ROR $0D1F
  $86F7  03        .db $03
  $86F8  5A        .db $5A
  $86F9  4B        .db $4B
  $86FA  5B        .db $5B
  $86FB  6B        .db $6B
  $86FC  42        .db $42
  $86FD  6C 79 03  JMP ($0379)
  $8700  6D 5E 4F  ADC $4F5E
  $8703  57        .db $57
  $8704  7C        .db $7C
  $8705  7D 2A 0F  ADC $0F2A,X
  $8708  63        .db $63
  $8709  6B        .db $6B
  $870A  17        .db $17
  $870B  0F        .db $0F
  $870C  37        .db $37
  $870D  57        .db $57
  $870E  78        SEI
  $870F  39 0F 0F  AND $0F0F,Y
  $8712  26 0F     ROL $0F
  $8714  2F        .db $2F
  $8715  06 1D     ASL $1D
  $8717  03        .db $03
  $8718  7C        .db $7C
  $8719  03        .db $03
  $871A  28        PLP
  $871B  0F        .db $0F
  $871C  0A        ASL
  $871D  03        .db $03
  $871E  37        .db $37
  $871F  5F        .db $5F
  $8720  1B        .db $1B
  $8721  03        .db $03
  $8722  25 2F     AND $2F
  $8724  79 39 5C  ADC $5C39,Y
  $8727  4A        LSR
  $8728  1D 03 36  ORA $3603,X
  $872B  0F        .db $0F
  $872C  0F        .db $0F
  $872D  0F        .db $0F
  $872E  0F        .db $0F
  $872F  0F        .db $0F
  $8730  13        .db $13
  $8731  03        .db $03
  $8732  56 5D     LSR $5D,X
  $8734  4E 5E 6E  LSR $6E5E
  $8737  55 19     EOR $19,X
  $8739  39 5C 6C  AND $6C5C,Y
  $873C  43        .db $43
  $873D  6A        ROR
  $873E  74        .db $74
  $873F  52        .db $52
  $8740  0F        .db $0F
  $8741  3C        .db $3C
  $8742  57        .db $57
  $8743  46 6D     LSR $6D
  $8745  5E 6E 45  LSR $456E,X
  $8748  6A        ROR
  $8749  30 2F     BMI $877A
  $874B  53        .db $53
  $874C  42        .db $42
  $874D  64        .db $64
  $874E  4A        LSR
  $874F  5C        .db $5C
  $8750  01 2D     ORA ($2D,X)
  $8752  08        PHP
  $8753  03        .db $03
  $8754  0F        .db $0F
  $8755  0F        .db $0F
  $8756  0F        .db $0F
  $8757  0F        .db $0F
  $8758  4D 1F 1D  EOR $1D1F
  $875B  03        .db $03
  $875C  3C        .db $3C
  $875D  47        .db $47
  $875E  66 4F     ROR $4F
  $8760  53        .db $53
  $8761  42        .db $42
  $8762  7F        .db $7F
  $8763  03        .db $03
  $8764  3B        .db $3B
  $8765  5B        .db $5B
  $8766  4C 44 0F  JMP $0F44
  $8769  0F        .db $0F
  $876A  0F        .db $0F
  $876B  0F        .db $0F
  $876C  0F        .db $0F
  $876D  0F        .db $0F
  $876E  0F        .db $0F
  $876F  0F        .db $0F
  $8770  4E 56 1F  LSR $1F56
  $8773  0F        .db $0F
  $8774  3D 55 3C  AND $3C55,X
  $8777  47        .db $47
  $8778  62        .db $62
  $8779  4B        .db $4B

L_877A:
  $877A  5B        .db $5B
  $877B  6B        .db $6B
  $877C  2B        .db $2B
  $877D  0F        .db $0F
  $877E  32        .db $32
  $877F  0F        .db $0F
  $8780  5D 4E 5E  EOR $5E4E,X
  $8783  6E 75 56  ROR $5675
  $8786  45 67     EOR $67
  $8788  64        .db $64
  $8789  6C 43 6A  JMP ($6A43)
  $878C  06 44     ASL $44
  $878E  63        .db $63
  $878F  4C 0F 0F  JMP $0F0F
  $8792  2A        ROL
  $8793  0F        .db $0F
  $8794  0F        .db $0F
  $8795  22        .db $22
  $8796  0F        .db $0F
  $8797  0F        .db $0F
  $8798  7C        .db $7C
  $8799  03        .db $03
  $879A  1F        .db $1F
  $879B  12        .db $12
  $879C  03        .db $03
  $879D  1F        .db $1F
  $879E  08        PHP
  $879F  7B        .db $7B
  $87A0  79 39 5C  ADC $5C39,Y
  $87A3  7F        .db $7F
  $87A4  39 3F 08  AND $083F,Y
  $87A7  7A        .db $7A
  $87A8  0F        .db $0F
  $87A9  0F        .db $0F
  $87AA  22        .db $22
  $87AB  0F        .db $0F
  $87AC  0F        .db $0F
  $87AD  2A        ROL
  $87AE  0F        .db $0F
  $87AF  0F        .db $0F
  $87B0  7C        .db $7C
  $87B1  03        .db $03
  $87B2  0F        .db $0F
  $87B3  1A        .db $1A
  $87B4  03        .db $03
  $87B5  0F        .db $0F
  $87B6  0A        ASL
  $87B7  7B        .db $7B
  $87B8  37        .db $37
  $87B9  5F        .db $5F
  $87BA  4D 5F 6F  EOR $6F5F
  $87BD  5D 6D 07  EOR $076D,X
  $87C0  6F        .db $6F
  $87C1  56 45     LSR $45,X
  $87C3  67        .db $67
  $87C4  4D 55 78  EOR $7855
  $87C7  03        .db $03
  $87C8  5C        .db $5C
  $87C9  6C 3F 0F  JMP ($0F3F)
  $87CC  0F        .db $0F
  $87CD  0F        .db $0F
  $87CE  1D 69 0F  ORA $0F69,X
  $87D1  0F        .db $0F
  $87D2  32        .db $32
  $87D3  0F        .db $0F
  $87D4  0F        .db $0F
  $87D5  0F        .db $0F
  $87D6  10 03     BPL $87DB
  $87D8  7C        .db $7C
  $87D9  03        .db $03
  $87DA  46 7E     LSR $7E
  $87DC  03        .db $03
  $87DD  0F        .db $0F
  $87DE  0D 69 79  ORA $7969
  $87E1  39 3F 0A  AND $0A3F,Y
  $87E4  03        .db $03
  $87E5  0F        .db $0F
  $87E6  1E 7A 0F  ASL $0F7A,X
  $87E9  0F        .db $0F
  $87EA  2A        ROL
  $87EB  0F        .db $0F
  $87EC  0F        .db $0F
  $87ED  0F        .db $0F
  $87EE  0F        .db $0F
  $87EF  0F        .db $0F
  $87F0  78        SEI
  $87F1  03        .db $03
  $87F2  5E 4F 5F  LSR $5F4F,X
  $87F5  6F        .db $6F
  $87F6  46 65     LSR $65
  $87F8  09 39     ORA #$39
  $87FA  43        .db $43
  $87FB  62        .db $62
  $87FC  4B        .db $4B
  $87FD  42        .db $42
  $87FE  64        .db $64
  $87FF  64        .db $64
  $8800  1B        .db $1B
  $8801  38        SEC
  $8802  5E 4F 5F  LSR $5F4F,X
  $8805  6F        .db $6F
  $8806  46 65     LSR $65
  $8808  68        PLA
  $8809  03        .db $03
  $880A  0F        .db $0F
  $880B  0F        .db $0F
  $880C  2F        .db $2F
  $880D  5B        .db $5B
  $880E  4C 53 1B  JMP $1B53
  $8811  03        .db $03
  $8812  0F        .db $0F
  $8813  1F        .db $1F
  $8814  0F        .db $0F
  $8815  0F        .db $0F
  $8816  0F        .db $0F
  $8817  0F        .db $0F
  $8818  68        PLA
  $8819  02        .db $02
  $881A  0F        .db $0F
  $881B  17        .db $17
  $881C  0F        .db $0F
  $881D  0F        .db $0F
  $881E  A0 A1     LDY #$A1
  $8820  79 03 0F  ADC $0F03,Y
  $8823  0F        .db $0F
  $8824  0F        .db $0F
  $8825  0F        .db $0F
  $8826  11 28     ORA ($28),Y
  $8828  0F        .db $0F
  $8829  0F        .db $0F
  $882A  0F        .db $0F
  $882B  26 0F     ROL $0F
  $882D  0F        .db $0F
  $882E  13        .db $13
  $882F  25 6D     AND $6D
  $8831  07        .db $07
  $8832  5E 4F 57  LSR $574F,X
  $8835  1F        .db $1F
  $8836  15 33     ORA $33,X
  $8838  4A        LSR
  $8839  5A        .db $5A
  $883A  6A        ROR
  $883B  44        .db $44
  $883C  4C 5C 6C  JMP $6C5C
  $883F  35 6D     AND $6D,X
  $8841  47        .db $47
  $8842  66 4F     ROR $4F
  $8844  47        .db $47
  $8845  6E 7C 03  ROR $037C
  $8848  4C 54 3F  JMP $3F54
  $884B  0F        .db $0F
  $884C  0F        .db $0F
  $884D  0F        .db $0F
  $884E  0B        .db $0B
  $884F  69 0F     ADC #$0F
  $8851  0F        .db $0F
  $8852  33        .db $33
  $8853  01 01     ORA ($01,X)
  $8855  01 0D     ORA ($0D,X)
  $8857  71 03     ADC ($03),Y
  $8859  0F        .db $0F
  $885A  21 0F     AND ($0F,X)
  $885C  0F        .db $0F
  $885D  0F        .db $0F
  $885E  18        CLC
  $885F  03        .db $03
  $8860  03        .db $03
  $8861  0F        .db $0F
  $8862  22        .db $22
  $8863  01 01     ORA ($01,X)
  $8865  01 15     ORA ($15,X)
  $8867  71 03     ADC ($03),Y
  $8869  0F        .db $0F
  $886A  30 0F     BMI $887B
  $886C  0F        .db $0F
  $886D  0F        .db $0F
  $886E  0E 69 03  ASL $0369
  $8871  0F        .db $0F
  $8872  2D 01 01  AND $0101
  $8875  01 13     ORA ($13,X)
  $8877  03        .db $03
  $8878  03        .db $03
  $8879  0F        .db $0F
  $887A  26 0F     ROL $0F
  $887C  0F        .db $0F
  $887D  0F        .db $0F
  $887E  19 69 0F  ORA $0F69,Y
  $8881  0F        .db $0F
  $8882  23        .db $23
  $8883  01 01     ORA ($01,X)
  $8885  01 1B     ORA ($1B,X)
  $8887  03        .db $03
  $8888  0F        .db $0F
  $8889  0F        .db $0F
  $888A  29 0F     AND #$0F
  $888C  0F        .db $0F
  $888D  0F        .db $0F
  $888E  1D 69 0F  ORA $0F69,X
  $8891  0F        .db $0F
  $8892  2A        ROL
  $8893  01 01     ORA ($01,X)
  $8895  01 10     ORA ($10,X)
  $8897  71 0F     ADC ($0F),Y
  $8899  0F        .db $0F
  $889A  0F        .db $0F
  $889B  0F        .db $0F
  $889C  0F        .db $0F
  $889D  0F        .db $0F
  $889E  0C        .db $0C
  $889F  03        .db $03
  $88A0  0F        .db $0F
  $88A1  0F        .db $0F
  $88A2  3F        .db $3F
  $88A3  0F        .db $0F
  $88A4  0F        .db $0F
  $88A5  0F        .db $0F
  $88A6  11 71     ORA ($71),Y
  $88A8  01 01     ORA ($01,X)
  $88AA  01 01     ORA ($01,X)
  $88AC  01 01     ORA ($01,X)
  $88AE  10 69     BPL $8919
  $88B0  0F        .db $0F
  $88B1  0F        .db $0F
  $88B2  17        .db $17
  $88B3  0F        .db $0F
  $88B4  0F        .db $0F
  $88B5  0F        .db $0F
  $88B6  11 03     ORA ($03),Y
  $88B8  01 01     ORA ($01,X)
  $88BA  01 01     ORA ($01,X)
  $88BC  01 01     ORA ($01,X)
  $88BE  13        .db $13
  $88BF  71 0F     ADC ($0F),Y
  $88C1  0F        .db $0F
  $88C2  1F        .db $1F
  $88C3  0F        .db $0F
  $88C4  0F        .db $0F
  $88C5  0F        .db $0F
  $88C6  19 03 01  ORA $0103,Y
  $88C9  01 3F     ORA ($3F,X)
  $88CB  01 01     ORA ($01,X)
  $88CD  01 1B     ORA ($1B,X)
  $88CF  69 0F     ADC #$0F
  $88D1  0F        .db $0F
  $88D2  0F        .db $0F
  $88D3  0F        .db $0F
  $88D4  0F        .db $0F
  $88D5  0F        .db $0F
  $88D6  09 71     ORA #$71
  $88D8  01 01     ORA ($01,X)
  $88DA  1F        .db $1F
  $88DB  01 01     ORA ($01,X)
  $88DD  01 0E     ORA ($0E,X)
  $88DF  03        .db $03
  $88E0  0F        .db $0F
  $88E1  0F        .db $0F
  $88E2  17        .db $17
  $88E3  0F        .db $0F
  $88E4  0F        .db $0F
  $88E5  0F        .db $0F
  $88E6  0B        .db $0B
  $88E7  69 01     ADC #$01
  $88E9  01 01     ORA ($01,X)
  $88EB  01 01     ORA ($01,X)
  $88ED  01 11     ORA ($11,X)
  $88EF  71 0F     ADC ($0F),Y
  $88F1  0F        .db $0F
  $88F2  3F        .db $3F
  $88F3  0F        .db $0F
  $88F4  0F        .db $0F
  $88F5  0F        .db $0F
  $88F6  12        .db $12
  $88F7  03        .db $03
  $88F8  01 01     ORA ($01,X)
  $88FA  01 01     ORA ($01,X)
  $88FC  01 01     ORA ($01,X)
  $88FE  08        PHP
  $88FF  71 0F     ADC ($0F),Y
  $8901  0F        .db $0F
  $8902  28        PLP
  $8903  0F        .db $0F
  $8904  0F        .db $0F
  $8905  0F        .db $0F
  $8906  1D 03 01  ORA $0103,X
  $8909  01 25     ORA ($25,X)
  $890B  01 01     ORA ($01,X)
  $890D  01 16     ORA ($16,X)
  $890F  69 0F     ADC #$0F
  $8911  0F        .db $0F
  $8912  36 0F     ROL $0F,X
  $8914  0F        .db $0F
  $8915  3F        .db $3F
  $8916  13        .db $13
  $8917  71 01     ADC ($01),Y

L_8919:
  $8919  01 33     ORA ($33,X)
  $891B  01 01     ORA ($01,X)
  $891D  28        PLP
  $891E  15 03     ORA $03,X
  $8920  0F        .db $0F
  $8921  0F        .db $0F
  $8922  21 0F     AND ($0F,X)
  $8924  0F        .db $0F
  $8925  29 08     AND #$08
  $8927  71 01     ADC ($01),Y
  $8929  01 23     ORA ($23,X)
  $892B  01 01     ORA ($01,X)
  $892D  2B        .db $2B
  $892E  1D 69 0F  ORA $0F69,X
  $8931  0F        .db $0F
  $8932  29 0F     AND #$0F
  $8934  0F        .db $0F
  $8935  2D 10 03  AND $0310
  $8938  01 01     ORA ($01,X)
  $893A  2B        .db $2B
  $893B  01 01     ORA ($01,X)
  $893D  20 0D 69  JSR $690D
  $8940  0F        .db $0F
  $8941  0F        .db $0F
  $8942  31 0F     AND ($0F),Y
  $8944  0F        .db $0F
  $8945  21 16     AND ($16,X)
  $8947  03        .db $03
  $8948  01 01     ORA ($01,X)
  $894A  32        .db $32
  $894B  01 01     ORA ($01,X)
  $894D  22        .db $22
  $894E  1B        .db $1B
  $894F  71 0F     ADC ($0F),Y
  $8951  0F        .db $0F
  $8952  22        .db $22
  $8953  0F        .db $0F
  $8954  0F        .db $0F
  $8955  0F        .db $0F
  $8956  09 69     ORA #$69
  $8958  01 01     ORA ($01,X)
  $895A  30 01     BMI $895D
  $895C  3F        .db $3F

L_895D:
  $895D  01 0E     ORA ($0E,X)
  $895F  03        .db $03
  $8960  6B        .db $6B
  $8961  06 2D     ASL $2D
  $8963  0F        .db $0F
  $8964  32        .db $32
  $8965  0F        .db $0F
  $8966  13        .db $13
  $8967  69 01     ADC #$01
  $8969  01 01     ORA ($01,X)
  $896B  01 2A     ORA ($2A,X)
  $896D  01 19     ORA ($19,X)
  $896F  71 48     ADC ($48),Y
  $8971  40        RTI
  $8972  06 0F     ASL $0F
  $8974  0F        .db $0F
  $8975  0F        .db $0F
  $8976  1A        .db $1A
  $8977  69 49     ADC #$49
  $8979  50 41     BVC $89BC
  $897B  51 3C     EOR ($3C),Y
  $897D  3D 3C 07  AND $073C,X
  $8980  0F        .db $0F
  $8981  1B        .db $1B
  $8982  02        .db $02
  $8983  01 A2     ORA ($A2,X)
  $8985  58        CLI
  $8986  2E 0F 59  ROL $590F
  $8989  68        PLA
  $898A  02        .db $02
  $898B  01 2D     ORA ($2D,X)
  $898D  33        .db $33
  $898E  3B        .db $3B
  $898F  53        .db $53
  $8990  0F        .db $0F
  $8991  0B        .db $0B
  $8992  02        .db $02
  $8993  01 20     ORA ($20,X)
  $8995  60        RTS
  $8996  58        CLI
  $8997  59 0F 11  EOR $110F,Y
  $899A  02        .db $02
  $899B  01 60     ORA ($60,X)
  $899D  23        .db $23
  $899E  32        .db $32
  $899F  0F        .db $0F
  $89A0  A3        .db $A3
  $89A1  70 02     BVS $89A5
  $89A3  01 58     ORA ($58,X)

L_89A5:
  $89A5  29 3C     AND #$3C
  $89A7  57        .db $57
  $89A8  0F        .db $0F
  $89A9  08        PHP
  $89AA  02        .db $02
  $89AB  01 A2     ORA ($A2,X)
  $89AD  58        CLI
  $89AE  2E 0F 59  ROL $590F
  $89B1  68        PLA

L_89B2:
  $89B2  02        .db $02
  $89B3  01 2D     ORA ($2D,X)
  $89B5  30 3D     BMI $89F4
  $89B7  56 0F     LSR $0F,X
  $89B9  0E 41 51  ASL $5141

L_89BC:
  $89BC  58        CLI
  $89BD  2D 26 0F  AND $0F26
  $89C0  1B        .db $1B
  $89C1  D4        .db $D4
  $89C2  D5 D1     CMP $D1,X

L_89C4:
  $89C4  D6 D7     DEC $D7,X
  $89C6  58        CLI
  $89C7  59 68 D0  EOR $D068,Y
  $89CA  D1 D1     CMP ($D1),Y
  $89CC  D1 DF     CMP ($DF),Y
  $89CE  3B        .db $3B
  $89CF  5B        .db $5B
  $89D0  10 D0     BPL $89A2
  $89D2  D1 D1     CMP ($D1),Y
  $89D4  D1 E0     CMP ($E0),Y
  $89D6  02        .db $02
  $89D7  01 0D     ORA ($0D,X)
  $89D9  D0 D1     BNE $89AC
  $89DB  D1 DD     CMP ($DD),Y
  $89DD  E1 A3     SBC ($A3,X)
  $89DF  A3        .db $A3
  $89E0  70 D0     BVS $89B2
  $89E2  D1 D1     CMP ($D1),Y
  $89E4  DE E2 E7  DEC $E7E2,X
  $89E7  02        .db $02
  $89E8  1E D0 D1  ASL $D1D0,X
  $89EB  D1 D1     CMP ($D1),Y
  $89ED  E3        .db $E3
  $89EE  E8        INX
  $89EF  02        .db $02
  $89F0  1B        .db $1B
  $89F1  D0 D1     BNE $89C4
  $89F3  D1 DD     CMP ($DD),Y
  $89F5  E4 E5     CPX $E5
  $89F7  E6 68     INC $68
  $89F9  D8        CLD
  $89FA  D9 DA DB  CMP $DBDA,Y
  $89FD  02        .db $02
  $89FE  22        .db $22
  $89FF  01 00     ORA ($00,X)
  $8A01  08        PHP
  $8A02  10 0F     BPL $8A13
  $8A04  08        PHP
  $8A05  00        BRK
  $8A06  00        BRK
  $8A07  00        BRK
  $8A08  00        BRK
  $8A09  08        PHP
  $8A0A  10 0F     BPL $8A1B
  $8A0C  08        PHP
  $8A0D  00        BRK
  $8A0E  00        BRK
  $8A0F  00        BRK
  $8A10  00        BRK
  $8A11  08        PHP
  $8A12  10 0F     BPL $8A23
  $8A14  08        PHP
  $8A15  00        BRK
  $8A16  00        BRK
  $8A17  00        BRK
  $8A18  00        BRK
  $8A19  08        PHP
  $8A1A  10 0F     BPL $8A2B
  $8A1C  08        PHP
  $8A1D  00        BRK
  $8A1E  00        BRK
  $8A1F  00        BRK
  $8A20  00        BRK
  $8A21  08        PHP
  $8A22  10 0F     BPL $8A33
  $8A24  08        PHP
  $8A25  00        BRK
  $8A26  00        BRK
  $8A27  00        BRK
  $8A28  00        BRK
  $8A29  08        PHP
  $8A2A  10 0F     BPL $8A3B
  $8A2C  08        PHP
  $8A2D  00        BRK
  $8A2E  00        BRK
  $8A2F  00        BRK
  $8A30  00        BRK
  $8A31  08        PHP
  $8A32  10 0F     BPL $8A43
  $8A34  08        PHP
  $8A35  00        BRK
  $8A36  00        BRK
  $8A37  00        BRK
  $8A38  00        BRK
  $8A39  08        PHP
  $8A3A  09 0A     ORA #$0A
  $8A3C  08        PHP
  $8A3D  00        BRK
  $8A3E  00        BRK
  $8A3F  00        BRK
  $8A40  08        PHP
  $8A41  0B        .db $0B
  $8A42  55 0F     EOR $0F,X
  $8A44  0C        .db $0C
  $8A45  0C        .db $0C
  $8A46  08        PHP
  $8A47  08        PHP
  $8A48  08        PHP
  $8A49  10 0F     BPL $8A5A
  $8A4B  0F        .db $0F
  $8A4C  0F        .db $0F
  $8A4D  0F        .db $0F
  $8A4E  08        PHP
  $8A4F  08        PHP
  $8A50  08        PHP
  $8A51  10 0F     BPL $8A62
  $8A53  0F        .db $0F
  $8A54  0F        .db $0F
  $8A55  0F        .db $0F
  $8A56  08        PHP
  $8A57  08        PHP
  $8A58  08        PHP
  $8A59  10 0F     BPL $8A6A
  $8A5B  0F        .db $0F
  $8A5C  0F        .db $0F
  $8A5D  0F        .db $0F
  $8A5E  08        PHP
  $8A5F  08        PHP
  $8A60  08        PHP
  $8A61  10 0F     BPL $8A72
  $8A63  0F        .db $0F
  $8A64  0F        .db $0F
  $8A65  0F        .db $0F
  $8A66  08        PHP
  $8A67  08        PHP
  $8A68  08        PHP
  $8A69  10 0F     BPL $8A7A
  $8A6B  0F        .db $0F
  $8A6C  0F        .db $0F
  $8A6D  0F        .db $0F
  $8A6E  08        PHP
  $8A6F  08        PHP
  $8A70  08        PHP
  $8A71  10 0F     BPL $8A82
  $8A73  0F        .db $0F
  $8A74  0F        .db $0F
  $8A75  0F        .db $0F
  $8A76  08        PHP
  $8A77  08        PHP
  $8A78  08        PHP
  $8A79  0D 0E 0E  ORA $0E0E
  $8A7C  0E 0E 08  ASL $080E
  $8A7F  08        PHP
  $8A80  81 83     STA ($83,X)

L_8A82:
  $8A82  82        .db $82
  $8A83  85 86     STA $86
  $8A85  82        .db $82
  $8A86  83        .db $83
  $8A87  81 88     STA ($88,X)
  $8A89  88        DEY
  $8A8A  88        DEY
  $8A8B  88        DEY
  $8A8C  88        DEY
  $8A8D  88        DEY
  $8A8E  88        DEY
  $8A8F  88        DEY
  $8A90  88        DEY
  $8A91  88        DEY
  $8A92  88        DEY
  $8A93  88        DEY
  $8A94  88        DEY
  $8A95  88        DEY
  $8A96  88        DEY
  $8A97  88        DEY
  $8A98  88        DEY
  $8A99  88        DEY
  $8A9A  88        DEY
  $8A9B  88        DEY
  $8A9C  88        DEY
  $8A9D  88        DEY
  $8A9E  88        DEY
  $8A9F  88        DEY
  $8AA0  88        DEY
  $8AA1  88        DEY
  $8AA2  88        DEY
  $8AA3  88        DEY
  $8AA4  88        DEY
  $8AA5  88        DEY
  $8AA6  88        DEY
  $8AA7  88        DEY
  $8AA8  88        DEY
  $8AA9  88        DEY
  $8AAA  88        DEY
  $8AAB  88        DEY
  $8AAC  88        DEY
  $8AAD  88        DEY
  $8AAE  88        DEY
  $8AAF  88        DEY
  $8AB0  88        DEY
  $8AB1  88        DEY
  $8AB2  88        DEY
  $8AB3  88        DEY
  $8AB4  88        DEY
  $8AB5  88        DEY
  $8AB6  88        DEY
  $8AB7  88        DEY
  $8AB8  81 86     STA ($86,X)
  $8ABA  82        .db $82
  $8ABB  81 93     STA ($93,X)
  $8ABD  94 83     STY $83,X
  $8ABF  81 81     STA ($81,X)
  $8AC1  83        .db $83
  $8AC2  82        .db $82
  $8AC3  85 86     STA $86
  $8AC5  82        .db $82
  $8AC6  83        .db $83
  $8AC7  81 88     STA ($88,X)
  $8AC9  88        DEY
  $8ACA  88        DEY
  $8ACB  88        DEY
  $8ACC  88        DEY
  $8ACD  88        DEY
  $8ACE  88        DEY
  $8ACF  88        DEY
  $8AD0  88        DEY
  $8AD1  88        DEY
  $8AD2  88        DEY
  $8AD3  88        DEY
  $8AD4  88        DEY
  $8AD5  88        DEY
  $8AD6  88        DEY
  $8AD7  88        DEY
  $8AD8  88        DEY
  $8AD9  88        DEY
  $8ADA  88        DEY
  $8ADB  88        DEY
  $8ADC  88        DEY
  $8ADD  88        DEY
  $8ADE  88        DEY
  $8ADF  88        DEY
  $8AE0  88        DEY
  $8AE1  88        DEY
  $8AE2  88        DEY
  $8AE3  88        DEY
  $8AE4  88        DEY
  $8AE5  88        DEY
  $8AE6  88        DEY
  $8AE7  88        DEY
  $8AE8  88        DEY
  $8AE9  88        DEY
  $8AEA  88        DEY
  $8AEB  88        DEY
  $8AEC  88        DEY
  $8AED  88        DEY
  $8AEE  88        DEY
  $8AEF  88        DEY
  $8AF0  88        DEY
  $8AF1  88        DEY
  $8AF2  88        DEY
  $8AF3  88        DEY
  $8AF4  88        DEY
  $8AF5  88        DEY
  $8AF6  88        DEY
  $8AF7  88        DEY
  $8AF8  81 86     STA ($86,X)
  $8AFA  82        .db $82
  $8AFB  81 93     STA ($93,X)
  $8AFD  94 83     STY $83,X
  $8AFF  81 81     STA ($81,X)
  $8B01  83        .db $83
  $8B02  82        .db $82
  $8B03  85 86     STA $86
  $8B05  82        .db $82
  $8B06  83        .db $83
  $8B07  81 88     STA ($88,X)
  $8B09  88        DEY
  $8B0A  88        DEY
  $8B0B  88        DEY
  $8B0C  88        DEY
  $8B0D  88        DEY
  $8B0E  88        DEY
  $8B0F  88        DEY
  $8B10  88        DEY
  $8B11  88        DEY
  $8B12  88        DEY
  $8B13  88        DEY
  $8B14  88        DEY
  $8B15  88        DEY
  $8B16  88        DEY
  $8B17  88        DEY
  $8B18  88        DEY
  $8B19  88        DEY
  $8B1A  88        DEY
  $8B1B  88        DEY
  $8B1C  88        DEY
  $8B1D  88        DEY
  $8B1E  88        DEY
  $8B1F  88        DEY
  $8B20  88        DEY
  $8B21  88        DEY
  $8B22  88        DEY
  $8B23  88        DEY
  $8B24  88        DEY
  $8B25  88        DEY
  $8B26  88        DEY
  $8B27  88        DEY
  $8B28  88        DEY
  $8B29  88        DEY
  $8B2A  88        DEY
  $8B2B  88        DEY
  $8B2C  88        DEY
  $8B2D  88        DEY
  $8B2E  88        DEY
  $8B2F  88        DEY
  $8B30  88        DEY
  $8B31  88        DEY
  $8B32  88        DEY
  $8B33  88        DEY
  $8B34  88        DEY
  $8B35  88        DEY
  $8B36  88        DEY
  $8B37  88        DEY
  $8B38  81 86     STA ($86,X)
  $8B3A  82        .db $82
  $8B3B  81 93     STA ($93,X)
  $8B3D  94 83     STY $83,X
  $8B3F  81 82     STA ($82,X)
  $8B41  81 84     STA ($84,X)
  $8B43  85 81     STA $81
  $8B45  85 82     STA $82
  $8B47  81 88     STA ($88,X)
  $8B49  88        DEY
  $8B4A  88        DEY
  $8B4B  88        DEY
  $8B4C  88        DEY
  $8B4D  88        DEY
  $8B4E  83        .db $83
  $8B4F  86 88     STX $88
  $8B51  88        DEY
  $8B52  88        DEY
  $8B53  88        DEY
  $8B54  88        DEY
  $8B55  88        DEY
  $8B56  81 93     STA ($93,X)
  $8B58  88        DEY
  $8B59  88        DEY
  $8B5A  88        DEY
  $8B5B  88        DEY
  $8B5C  88        DEY
  $8B5D  88        DEY
  $8B5E  94 81     STY $81,X
  $8B60  88        DEY
  $8B61  88        DEY
  $8B62  88        DEY
  $8B63  88        DEY
  $8B64  88        DEY
  $8B65  88        DEY
  $8B66  81 83     STA ($83,X)
  $8B68  88        DEY
  $8B69  88        DEY
  $8B6A  88        DEY
  $8B6B  88        DEY
  $8B6C  88        DEY
  $8B6D  88        DEY
  $8B6E  81 82     STA ($82,X)
  $8B70  88        DEY
  $8B71  88        DEY
  $8B72  88        DEY
  $8B73  88        DEY
  $8B74  88        DEY
  $8B75  8A        TXA
  $8B76  81 84     STA ($84,X)
  $8B78  81 89     STA ($89,X)
  $8B7A  88        DEY
  $8B7B  88        DEY
  $8B7C  88        DEY
  $8B7D  8B        .db $8B
  $8B7E  82        .db $82
  $8B7F  84 81     STY $81
  $8B81  8C 88 88  STY $8888
  $8B84  88        DEY
  $8B85  8B        .db $8B
  $8B86  81 93     STA ($93,X)
  $8B88  84 89     STY $89
  $8B8A  88        DEY
  $8B8B  88        DEY
  $8B8C  88        DEY
  $8B8D  8B        .db $8B
  $8B8E  86 81     STX $81
  $8B90  85 82     STA $82
  $8B92  89        .db $89
  $8B93  88        DEY
  $8B94  88        DEY
  $8B95  82        .db $82
  $8B96  93        .db $93
  $8B97  94 81     STY $81,X
  $8B99  81 89     STA ($89,X)
  $8B9B  88        DEY
  $8B9C  88        DEY
  $8B9D  81 81     STA ($81,X)
  $8B9F  82        .db $82
  $8BA0  86 8C     STX $8C
  $8BA2  88        DEY
  $8BA3  88        DEY
  $8BA4  88        DEY
  $8BA5  93        .db $93
  $8BA6  83        .db $83
  $8BA7  85 81     STA $81
  $8BA9  89        .db $89
  $8BAA  88        DEY
  $8BAB  88        DEY
  $8BAC  88        DEY
  $8BAD  85 82     STA $82
  $8BAF  94 82     STY $82,X
  $8BB1  81 89     STA ($89,X)
  $8BB3  88        DEY
  $8BB4  8B        .db $8B
  $8BB5  81 82     STA ($82,X)
  $8BB7  85 86     STA $86
  $8BB9  8C 88 88  STY $8888
  $8BBC  8B        .db $8B
  $8BBD  82        .db $82
  $8BBE  83        .db $83
  $8BBF  81 81     STA ($81,X)
  $8BC1  89        .db $89
  $8BC2  88        DEY
  $8BC3  88        DEY
  $8BC4  8B        .db $8B
  $8BC5  81 85     STA ($85,X)
  $8BC7  83        .db $83
  $8BC8  86 89     STX $89
  $8BCA  88        DEY
  $8BCB  88        DEY
  $8BCC  8B        .db $8B
  $8BCD  84 82     STY $82
  $8BCF  83        .db $83
  $8BD0  82        .db $82
  $8BD1  8C 88 88  STY $8888
  $8BD4  90 81     BCC $8B57
  $8BD6  82        .db $82
  $8BD7  86 82     STX $82
  $8BD9  81 89     STA ($89,X)
  $8BDB  88        DEY
  $8BDC  82        .db $82
  $8BDD  86 93     STX $93
  $8BDF  82        .db $82
  $8BE0  86 89     STX $89
  $8BE2  88        DEY
  $8BE3  88        DEY
  $8BE4  81 93     STA ($93,X)
  $8BE6  82        .db $82
  $8BE7  85 81     STA $81
  $8BE9  8C 88 88  STY $8888
  $8BEC  86 82     STX $82
  $8BEE  94 82     STY $82,X
  $8BF0  81 81     STA ($81,X)
  $8BF2  8D 88 84  STA $8488
  $8BF5  81 81     STA ($81,X)
  $8BF7  85 84     STA $84
  $8BF9  82        .db $82
  $8BFA  8C 88 82  STY $8288
  $8BFD  86 93     STX $93
  $8BFF  83        .db $83
  $8C00  83        .db $83
  $8C01  84 81     STY $81
  $8C03  89        .db $89
  $8C04  81 93     STA ($93,X)
  $8C06  81 84     STA ($84,X)
  $8C08  82        .db $82
  $8C09  86 94     STX $94
  $8C0B  89        .db $89
  $8C0C  93        .db $93
  $8C0D  81 82     STA ($82,X)
  $8C0F  81 94     STA ($94,X)
  $8C11  81 82     STA ($82,X)
  $8C13  89        .db $89
  $8C14  81 84     STA ($84,X)
  $8C16  82        .db $82
  $8C17  81 86     STA ($86,X)
  $8C19  84 93     STY $93
  $8C1B  89        .db $89
  $8C1C  82        .db $82
  $8C1D  86 81     STX $81
  $8C1F  83        .db $83
  $8C20  93        .db $93
  $8C21  85 81     STA $81
  $8C23  89        .db $89
  $8C24  93        .db $93
  $8C25  85 84     STA $84
  $8C27  85 81     STA $81
  $8C29  82        .db $82
  $8C2A  82        .db $82
  $8C2B  89        .db $89
  $8C2C  83        .db $83
  $8C2D  81 85     STA ($85,X)
  $8C2F  82        .db $82
  $8C30  81 83     STA ($83,X)
  $8C32  82        .db $82
  $8C33  89        .db $89
  $8C34  82        .db $82
  $8C35  82        .db $82
  $8C36  81 83     STA ($83,X)
  $8C38  86 81     STX $81
  $8C3A  84 89     STY $89
  $8C3C  84 81     STY $81
  $8C3E  84 81     STY $81
  $8C40  94 85     STY $85,X
  $8C42  82        .db $82
  $8C43  89        .db $89
  $8C44  81 84     STA ($84,X)
  $8C46  81 93     STA ($93,X)
  $8C48  81 83     STA ($83,X)
  $8C4A  94 89     STY $89,X
  $8C4C  81 93     STA ($93,X)
  $8C4E  83        .db $83
  $8C4F  81 82     STA ($82,X)
  $8C51  85 82     STA $82
  $8C53  89        .db $89
  $8C54  85 82     STA $82
  $8C56  82        .db $82
  $8C57  93        .db $93
  $8C58  86 82     STX $82
  $8C5A  84 89     STY $89
  $8C5C  82        .db $82
  $8C5D  83        .db $83
  $8C5E  93        .db $93
  $8C5F  81 81     STA ($81,X)
  $8C61  85 81     STA $81
  $8C63  89        .db $89
  $8C64  86 94     STX $94
  $8C66  81 85     STA ($85,X)
  $8C68  82        .db $82
  $8C69  84 93     STY $93
  $8C6B  89        .db $89
  $8C6C  81 82     STA ($82,X)
  $8C6E  86 86     STX $86
  $8C70  86 81     STX $81
  $8C72  83        .db $83
  $8C73  89        .db $89
  $8C74  81 83     STA ($83,X)
  $8C76  84 81     STY $81
  $8C78  82        .db $82
  $8C79  81 81     STA ($81,X)
  $8C7B  89        .db $89
  $8C7C  85 81     STA $81
  $8C7E  82        .db $82
  $8C7F  82        .db $82
  $8C80  81 85     STA ($85,X)
  $8C82  93        .db $93
  $8C83  89        .db $89
  $8C84  93        .db $93
  $8C85  81 86     STA ($86,X)
  $8C87  81 85     STA ($85,X)
  $8C89  94 81     STY $81,X
  $8C8B  89        .db $89
  $8C8C  83        .db $83
  $8C8D  85 81     STA $81
  $8C8F  81 83     STA ($83,X)
  $8C91  82        .db $82
  $8C92  89        .db $89
  $8C93  88        DEY
  $8C94  81 84     STA ($84,X)
  $8C96  82        .db $82
  $8C97  85 81     STA $81
  $8C99  81 89     STA ($89,X)
  $8C9B  81 94     STA ($94,X)
  $8C9D  81 86     STA ($86,X)
  $8C9F  81 84     STA ($84,X)
  $8CA1  86 89     STX $89
  $8CA3  82        .db $82
  $8CA4  85 82     STA $82
  $8CA6  82        .db $82
  $8CA7  83        .db $83
  $8CA8  84 81     STY $81
  $8CAA  89        .db $89
  $8CAB  88        DEY
  $8CAC  88        DEY
  $8CAD  88        DEY
  $8CAE  82        .db $82
  $8CAF  82        .db $82
  $8CB0  82        .db $82
  $8CB1  85 83     STA $83
  $8CB3  81 89     STA ($89,X)
  $8CB5  88        DEY
  $8CB6  81 81     STA ($81,X)
  $8CB8  94 93     STY $93,X
  $8CBA  81 84     STA ($84,X)
  $8CBC  8E 8F 82  STX $828F
  $8CBF  81 00     STA ($00,X)
  $8CC1  00        BRK
  $8CC2  00        BRK
  $8CC3  80        .db $80
  $8CC4  ED 00 80  SBC $8000
  $8CC7  80        .db $80
  $8CC8  00        BRK
  $8CC9  00        BRK
  $8CCA  00        BRK
  $8CCB  EE 00 EF  INC $EF00
  $8CCE  80        .db $80
  $8CCF  80        .db $80
  $8CD0  00        BRK
  $8CD1  00        BRK
  $8CD2  00        BRK
  $8CD3  00        BRK
  $8CD4  00        BRK
  $8CD5  00        BRK
  $8CD6  80        .db $80
  $8CD7  80        .db $80
  $8CD8  ED 00 00  SBC $0000
  $8CDB  00        BRK
  $8CDC  95 00     STA $00,X
  $8CDE  96 80     STX $80,Y
  $8CE0  00        BRK
  $8CE1  00        BRK
  $8CE2  ED 00 00  SBC $0000
  $8CE5  00        BRK
  $8CE6  80        .db $80
  $8CE7  80        .db $80
  $8CE8  00        BRK
  $8CE9  EE 00 00  INC $0000
  $8CEC  00        BRK
  $8CED  00        BRK
  $8CEE  80        .db $80
  $8CEF  80        .db $80
  $8CF0  00        BRK
  $8CF1  00        BRK
  $8CF2  00        BRK
  $8CF3  00        BRK
  $8CF4  00        BRK
  $8CF5  00        BRK
  $8CF6  97        .db $97
  $8CF7  80        .db $80
  $8CF8  00        BRK
  $8CF9  ED 00 EF  SBC $EF00
  $8CFC  00        BRK
  $8CFD  EE 80 80  INC $8080
  $8D00  00        BRK
  $8D01  00        BRK
  $8D02  00        BRK
  $8D03  80        .db $80
  $8D04  ED 00 80  SBC $8000
  $8D07  80        .db $80
  $8D08  00        BRK
  $8D09  00        BRK
  $8D0A  00        BRK
  $8D0B  EE 00 EF  INC $EF00
  $8D0E  80        .db $80
  $8D0F  80        .db $80
  $8D10  00        BRK
  $8D11  00        BRK
  $8D12  00        BRK
  $8D13  00        BRK
  $8D14  00        BRK
  $8D15  00        BRK
  $8D16  80        .db $80
  $8D17  80        .db $80
  $8D18  ED 00 00  SBC $0000
  $8D1B  00        BRK
  $8D1C  95 00     STA $00,X
  $8D1E  96 80     STX $80,Y
  $8D20  00        BRK
  $8D21  00        BRK
  $8D22  ED 00 00  SBC $0000
  $8D25  00        BRK
  $8D26  80        .db $80
  $8D27  80        .db $80
  $8D28  00        BRK
  $8D29  EE 00 00  INC $0000
  $8D2C  00        BRK
  $8D2D  00        BRK
  $8D2E  80        .db $80
  $8D2F  80        .db $80
  $8D30  00        BRK
  $8D31  00        BRK
  $8D32  00        BRK
  $8D33  00        BRK
  $8D34  00        BRK
  $8D35  00        BRK
  $8D36  97        .db $97
  $8D37  80        .db $80
  $8D38  00        BRK
  $8D39  ED 00 EF  SBC $EF00
  $8D3C  00        BRK
  $8D3D  EE 80 80  INC $8080
  $8D40  A8        TAY
  $8D41  A8        TAY
  $8D42  A8        TAY
  $8D43  A8        TAY
  $8D44  A8        TAY
  $8D45  A8        TAY
  $8D46  A8        TAY
  $8D47  A8        TAY
  $8D48  A8        TAY
  $8D49  A8        TAY
  $8D4A  A8        TAY
  $8D4B  A8        TAY
  $8D4C  A8        TAY
  $8D4D  A8        TAY
  $8D4E  A8        TAY
  $8D4F  A8        TAY
  $8D50  A8        TAY
  $8D51  A8        TAY
  $8D52  A9 AC     LDA #$AC
  $8D54  A7        .db $A7
  $8D55  A8        TAY
  $8D56  A8        TAY
  $8D57  A8        TAY
  $8D58  A8        TAY
  $8D59  A8        TAY
  $8D5A  AA        TAX
  $8D5B  A6 B6     LDX $B6
  $8D5D  A8        TAY
  $8D5E  A8        TAY
  $8D5F  A8        TAY
  $8D60  A8        TAY
  $8D61  A8        TAY
  $8D62  AA        TAX
  $8D63  A6 B6     LDX $B6
  $8D65  A8        TAY
  $8D66  A8        TAY
  $8D67  A8        TAY
  $8D68  A8        TAY
  $8D69  A8        TAY
  $8D6A  BD BE BF  LDA $BFBE,X
  $8D6D  A8        TAY
  $8D6E  A8        TAY
  $8D6F  A8        TAY
  $8D70  A8        TAY
  $8D71  A8        TAY
  $8D72  A8        TAY
  $8D73  A8        TAY
  $8D74  A8        TAY
  $8D75  A8        TAY
  $8D76  A8        TAY
  $8D77  A8        TAY
  $8D78  A8        TAY
  $8D79  A8        TAY
  $8D7A  A8        TAY
  $8D7B  A8        TAY
  $8D7C  A8        TAY
  $8D7D  A8        TAY
  $8D7E  A8        TAY
  $8D7F  A8        TAY
  $8D80  A8        TAY
  $8D81  A8        TAY
  $8D82  A8        TAY
  $8D83  A8        TAY
  $8D84  A8        TAY
  $8D85  A8        TAY
  $8D86  A8        TAY
  $8D87  A8        TAY
  $8D88  A8        TAY
  $8D89  B1 B4     LDA ($B4),Y
  $8D8B  B4 B4     LDY $B4,X
  $8D8D  B5 A8     LDA $A8,X
  $8D8F  A8        TAY
  $8D90  A8        TAY
  $8D91  B2        .db $B2
  $8D92  B8        CLV
  $8D93  B8        CLV
  $8D94  BA        TSX
  $8D95  B6 A8     LDX $A8,Y
  $8D97  A8        TAY
  $8D98  A8        TAY
  $8D99  B2        .db $B2
  $8D9A  B8        CLV
  $8D9B  B8        CLV
  $8D9C  BA        TSX
  $8D9D  B6 A8     LDX $A8,Y
  $8D9F  A8        TAY
  $8DA0  A8        TAY
  $8DA1  B2        .db $B2
  $8DA2  B9 B9 BB  LDA $BBB9,Y
  $8DA5  B6 A8     LDX $A8,Y
  $8DA7  A8        TAY
  $8DA8  A8        TAY
  $8DA9  B3        .db $B3
  $8DAA  AD AD AD  LDA $ADAD
  $8DAD  B7        .db $B7
  $8DAE  A8        TAY
  $8DAF  A8        TAY
  $8DB0  A8        TAY
  $8DB1  A8        TAY
  $8DB2  A8        TAY
  $8DB3  A8        TAY
  $8DB4  BC B4 B5  LDY $B5B4,X
  $8DB7  A8        TAY
  $8DB8  A8        TAY
  $8DB9  A8        TAY
  $8DBA  A8        TAY
  $8DBB  A8        TAY
  $8DBC  AB        .db $AB
  $8DBD  AD B7 A8  LDA $A8B7
  $8DC0  A8        TAY
  $8DC1  A8        TAY
  $8DC2  A8        TAY
  $8DC3  A8        TAY
  $8DC4  A8        TAY
  $8DC5  A8        TAY
  $8DC6  A8        TAY
  $8DC7  A8        TAY
  $8DC8  A8        TAY
  $8DC9  A8        TAY
  $8DCA  A8        TAY
  $8DCB  A8        TAY
  $8DCC  A8        TAY
  $8DCD  A8        TAY
  $8DCE  A8        TAY
  $8DCF  A8        TAY
  $8DD0  A8        TAY
  $8DD1  A8        TAY
  $8DD2  A9 AC     LDA #$AC
  $8DD4  AE A8 A8  LDX $A8A8
  $8DD7  A8        TAY
  $8DD8  A8        TAY
  $8DD9  A8        TAY
  $8DDA  AA        TAX
  $8DDB  A6 AF     LDX $AF
  $8DDD  A8        TAY
  $8DDE  A8        TAY
  $8DDF  A8        TAY
  $8DE0  A8        TAY
  $8DE1  A8        TAY
  $8DE2  AA        TAX
  $8DE3  A6 AF     LDX $AF
  $8DE5  A8        TAY
  $8DE6  A8        TAY
  $8DE7  A8        TAY
  $8DE8  A8        TAY
  $8DE9  A8        TAY
  $8DEA  AB        .db $AB
  $8DEB  AD B0 A8  LDA $A8B0
  $8DEE  A8        TAY
  $8DEF  A8        TAY
  $8DF0  A8        TAY
  $8DF1  A8        TAY
  $8DF2  A8        TAY
  $8DF3  A8        TAY
  $8DF4  A8        TAY
  $8DF5  A8        TAY
  $8DF6  A8        TAY
  $8DF7  A8        TAY
  $8DF8  A8        TAY
  $8DF9  A8        TAY
  $8DFA  A8        TAY
  $8DFB  A8        TAY
  $8DFC  A8        TAY
  $8DFD  A8        TAY
  $8DFE  A8        TAY
  $8DFF  A8        TAY
  $8E00  A8        TAY
  $8E01  A8        TAY
  $8E02  A8        TAY
  $8E03  A8        TAY
  $8E04  A8        TAY
  $8E05  A8        TAY
  $8E06  A8        TAY
  $8E07  A8        TAY
  $8E08  A8        TAY
  $8E09  A8        TAY
  $8E0A  A8        TAY
  $8E0B  A8        TAY
  $8E0C  A8        TAY
  $8E0D  A8        TAY
  $8E0E  A8        TAY
  $8E0F  A8        TAY
  $8E10  A8        TAY
  $8E11  A8        TAY
  $8E12  A8        TAY
  $8E13  E9 A7     SBC #$A7
  $8E15  A8        TAY
  $8E16  A8        TAY
  $8E17  A8        TAY
  $8E18  A8        TAY
  $8E19  A8        TAY
  $8E1A  A8        TAY
  $8E1B  B2        .db $B2
  $8E1C  B6 A8     LDX $A8,Y
  $8E1E  A8        TAY
  $8E1F  A8        TAY
  $8E20  A8        TAY
  $8E21  A8        TAY
  $8E22  A8        TAY
  $8E23  B2        .db $B2
  $8E24  B6 A8     LDX $A8,Y
  $8E26  A8        TAY
  $8E27  A8        TAY
  $8E28  A8        TAY
  $8E29  A8        TAY
  $8E2A  A8        TAY
  $8E2B  EA        NOP
  $8E2C  BF        .db $BF
  $8E2D  A8        TAY
  $8E2E  A8        TAY
  $8E2F  A8        TAY
  $8E30  A8        TAY
  $8E31  A8        TAY
  $8E32  A8        TAY
  $8E33  A8        TAY
  $8E34  A8        TAY
  $8E35  A8        TAY
  $8E36  A8        TAY
  $8E37  A8        TAY
  $8E38  A8        TAY
  $8E39  A8        TAY
  $8E3A  A8        TAY
  $8E3B  A8        TAY
  $8E3C  A8        TAY
  $8E3D  A8        TAY
  $8E3E  A8        TAY
  $8E3F  A8        TAY
  $8E40  A8        TAY
  $8E41  A8        TAY
  $8E42  A8        TAY
  $8E43  A8        TAY
  $8E44  A8        TAY
  $8E45  A8        TAY
  $8E46  A8        TAY
  $8E47  A8        TAY
  $8E48  A8        TAY
  $8E49  A8        TAY
  $8E4A  A8        TAY
  $8E4B  A8        TAY
  $8E4C  A8        TAY
  $8E4D  A8        TAY
  $8E4E  A8        TAY
  $8E4F  A8        TAY
  $8E50  A8        TAY
  $8E51  A8        TAY
  $8E52  BC B4 EB  LDY $EBB4,X
  $8E55  A8        TAY
  $8E56  A8        TAY
  $8E57  A8        TAY
  $8E58  A8        TAY
  $8E59  A8        TAY
  $8E5A  AA        TAX
  $8E5B  A6 AF     LDX $AF
  $8E5D  A8        TAY
  $8E5E  A8        TAY
  $8E5F  A8        TAY
  $8E60  A8        TAY
  $8E61  A8        TAY
  $8E62  AA        TAX
  $8E63  A6 AF     LDX $AF
  $8E65  A8        TAY
  $8E66  A8        TAY
  $8E67  A8        TAY
  $8E68  A8        TAY
  $8E69  A8        TAY
  $8E6A  AA        TAX
  $8E6B  A6 AF     LDX $AF
  $8E6D  A8        TAY
  $8E6E  A8        TAY
  $8E6F  A8        TAY
  $8E70  A8        TAY
  $8E71  A8        TAY
  $8E72  AB        .db $AB
  $8E73  AD B0 A8  LDA $A8B0
  $8E76  A8        TAY
  $8E77  A8        TAY
  $8E78  A8        TAY
  $8E79  A8        TAY
  $8E7A  A8        TAY
  $8E7B  A8        TAY
  $8E7C  A8        TAY
  $8E7D  A8        TAY
  $8E7E  A8        TAY
  $8E7F  A8        TAY
  $8E80  A8        TAY
  $8E81  A8        TAY
  $8E82  A8        TAY
  $8E83  A8        TAY
  $8E84  A8        TAY
  $8E85  A8        TAY
  $8E86  A8        TAY
  $8E87  A8        TAY
  $8E88  A8        TAY
  $8E89  B1 B4     LDA ($B4),Y
  $8E8B  B4 B4     LDY $B4,X
  $8E8D  B5 A8     LDA $A8,X
  $8E8F  A8        TAY
  $8E90  A8        TAY
  $8E91  B2        .db $B2
  $8E92  B8        CLV
  $8E93  B8        CLV
  $8E94  BA        TSX
  $8E95  B6 A8     LDX $A8,Y
  $8E97  A8        TAY
  $8E98  A8        TAY
  $8E99  B2        .db $B2
  $8E9A  B8        CLV
  $8E9B  B8        CLV
  $8E9C  BA        TSX
  $8E9D  B6 A8     LDX $A8,Y
  $8E9F  A8        TAY
  $8EA0  A8        TAY
  $8EA1  B2        .db $B2
  $8EA2  B9 B9 BB  LDA $BBB9,Y
  $8EA5  B6 A8     LDX $A8,Y
  $8EA7  A8        TAY
  $8EA8  A8        TAY
  $8EA9  B3        .db $B3
  $8EAA  AD AD AD  LDA $ADAD
  $8EAD  B7        .db $B7
  $8EAE  A8        TAY
  $8EAF  A8        TAY
  $8EB0  A8        TAY
  $8EB1  A8        TAY
  $8EB2  A8        TAY
  $8EB3  B1 B4     LDA ($B4),Y
  $8EB5  B4 B5     LDY $B5,X
  $8EB7  A8        TAY
  $8EB8  A8        TAY
  $8EB9  A8        TAY
  $8EBA  A8        TAY
  $8EBB  B3        .db $B3
  $8EBC  AD AD B7  LDA $B7AD
  $8EBF  A8        TAY
  $8EC0  00        BRK
  $8EC1  00        BRK
  $8EC2  00        BRK
  $8EC3  00        BRK
  $8EC4  00        BRK
  $8EC5  00        BRK
  $8EC6  00        BRK
  $8EC7  00        BRK
  $8EC8  00        BRK
  $8EC9  00        BRK
  $8ECA  C1 C5     CMP ($C5,X)
  $8ECC  C8        INY
  $8ECD  00        BRK
  $8ECE  00        BRK
  $8ECF  00        BRK
  $8ED0  00        BRK
  $8ED1  00        BRK
  $8ED2  C0 C6     CPY #$C6
  $8ED4  C9 00     CMP #$00
  $8ED6  00        BRK
  $8ED7  00        BRK
  $8ED8  00        BRK
  $8ED9  00        BRK
  $8EDA  C2        .db $C2
  $8EDB  C7        .db $C7
  $8EDC  CA        DEX
  $8EDD  00        BRK
  $8EDE  00        BRK
  $8EDF  00        BRK
  $8EE0  00        BRK
  $8EE1  00        BRK
  $8EE2  C3        .db $C3
  $8EE3  C4 FF     CPY $FF
  $8EE5  00        BRK
  $8EE6  00        BRK
  $8EE7  00        BRK
  $8EE8  00        BRK
  $8EE9  00        BRK
  $8EEA  00        BRK
  $8EEB  00        BRK
  $8EEC  00        BRK
  $8EED  00        BRK
  $8EEE  00        BRK
  $8EEF  00        BRK
  $8EF0  00        BRK
  $8EF1  00        BRK
  $8EF2  00        BRK
  $8EF3  00        BRK
  $8EF4  00        BRK
  $8EF5  00        BRK
  $8EF6  00        BRK
  $8EF7  00        BRK
  $8EF8  00        BRK
  $8EF9  00        BRK
  $8EFA  00        BRK
  $8EFB  00        BRK
  $8EFC  00        BRK
  $8EFD  00        BRK
  $8EFE  00        BRK
  $8EFF  00        BRK
  $8F00  C0 FC     CPY #$FC
  $8F02  C3        .db $C3
  $8F03  C4 FE     CPY $FE
  $8F05  CB        .db $CB
  $8F06  F3        .db $F3
  $8F07  FA        .db $FA
  $8F08  C0 C0     CPY #$C0
  $8F0A  C1 C5     CMP ($C5,X)
  $8F0C  C8        INY
  $8F0D  CC F4 F6  CPY $F6F4
  $8F10  C0 C0     CPY #$C0
  $8F12  C0 C6     CPY #$C6
  $8F14  C9 CD     CMP #$CD
  $8F16  F5 F7     SBC $F7,X
  $8F18  C0 C0     CPY #$C0
  $8F1A  C2        .db $C2
  $8F1B  C7        .db $C7
  $8F1C  CA        DEX
  $8F1D  CE F6 F7  DEC $F7F6
  $8F20  C0 FC     CPY #$FC
  $8F22  C3        .db $C3
  $8F23  C4 FF     CPY $FF
  $8F25  CF        .db $CF
  $8F26  F7        .db $F7

L_8F27:
  $8F27  FD C0 C0  SBC $C0C0,X
  $8F2A  C1 C5     CMP ($C5,X)
  $8F2C  FB        .db $FB
  $8F2D  F0 F8     BEQ $8F27
  $8F2F  F8        SED
  $8F30  C0 C0     CPY #$C0
  $8F32  C0 C6     CPY #$C6
  $8F34  C9 F1     CMP #$F1
  $8F36  F7        .db $F7
  $8F37  FD C0 C0  SBC $C0C0,X
  $8F3A  C2        .db $C2
  $8F3B  C7        .db $C7
  $8F3C  CA        DEX
  $8F3D  F2        .db $F2
  $8F3E  F8        SED
  $8F3F  FD A8 A8  SBC $A8A8,X
  $8F42  A8        TAY
  $8F43  A8        TAY
  $8F44  A8        TAY
  $8F45  A8        TAY
  $8F46  A8        TAY
  $8F47  A8        TAY
  $8F48  A8        TAY
  $8F49  B1 B4     LDA ($B4),Y
  $8F4B  B4 B5     LDY $B5,X
  $8F4D  B1 EB     LDA ($EB),Y
  $8F4F  A8        TAY
  $8F50  A8        TAY
  $8F51  B2        .db $B2
  $8F52  A6 A6     LDX $A6
  $8F54  B6 B2     LDX $B2,Y
  $8F56  AF        .db $AF
  $8F57  A8        TAY
  $8F58  A8        TAY
  $8F59  B2        .db $B2
  $8F5A  A6 A6     LDX $A6
  $8F5C  B6 B2     LDX $B2,Y
  $8F5E  AF        .db $AF
  $8F5F  A8        TAY
  $8F60  A8        TAY
  $8F61  B2        .db $B2
  $8F62  A6 A6     LDX $A6
  $8F64  B6 B2     LDX $B2,Y
  $8F66  AF        .db $AF
  $8F67  A8        TAY
  $8F68  A8        TAY
  $8F69  B2        .db $B2
  $8F6A  A6 A6     LDX $A6
  $8F6C  B6 B2     LDX $B2,Y
  $8F6E  AF        .db $AF
  $8F6F  A8        TAY
  $8F70  A8        TAY
  $8F71  EA        NOP
  $8F72  BE BE BF  LDX $BFBE,Y
  $8F75  EA        NOP
  $8F76  A4 A8     LDY $A8
  $8F78  A8        TAY
  $8F79  A8        TAY
  $8F7A  A8        TAY
  $8F7B  A8        TAY
  $8F7C  A8        TAY
  $8F7D  A8        TAY
  $8F7E  A8        TAY
  $8F7F  A8        TAY
  $8F80  A8        TAY
  $8F81  A8        TAY
  $8F82  A8        TAY
  $8F83  A8        TAY
  $8F84  A8        TAY
  $8F85  A8        TAY
  $8F86  A8        TAY
  $8F87  A8        TAY
  $8F88  A8        TAY
  $8F89  B1 B4     LDA ($B4),Y
  $8F8B  B4 B4     LDY $B4,X
  $8F8D  B5 A8     LDA $A8,X
  $8F8F  A8        TAY
  $8F90  A8        TAY
  $8F91  B2        .db $B2
  $8F92  B8        CLV
  $8F93  B8        CLV
  $8F94  BA        TSX
  $8F95  B6 A8     LDX $A8,Y
  $8F97  A8        TAY
  $8F98  A8        TAY
  $8F99  B2        .db $B2
  $8F9A  B8        CLV
  $8F9B  B8        CLV
  $8F9C  BA        TSX
  $8F9D  B6 A8     LDX $A8,Y
  $8F9F  A8        TAY
  $8FA0  A8        TAY
  $8FA1  B2        .db $B2
  $8FA2  B9 B9 BB  LDA $BBB9,Y
  $8FA5  B6 A8     LDX $A8,Y
  $8FA7  A8        TAY
  $8FA8  A8        TAY
  $8FA9  B3        .db $B3
  $8FAA  AD AD AD  LDA $ADAD
  $8FAD  B7        .db $B7
  $8FAE  A8        TAY
  $8FAF  A8        TAY
  $8FB0  A8        TAY
  $8FB1  A8        TAY
  $8FB2  A8        TAY
  $8FB3  B1 B4     LDA ($B4),Y
  $8FB5  B4 B5     LDY $B5,X
  $8FB7  A8        TAY
  $8FB8  A8        TAY
  $8FB9  A8        TAY
  $8FBA  A8        TAY
  $8FBB  B3        .db $B3
  $8FBC  AD AD B7  LDA $B7AD
  $8FBF  A8        TAY
  $8FC0  A8        TAY
  $8FC1  A8        TAY
  $8FC2  A8        TAY
  $8FC3  A8        TAY
  $8FC4  A8        TAY
  $8FC5  A8        TAY
  $8FC6  A8        TAY
  $8FC7  A8        TAY
  $8FC8  A8        TAY
  $8FC9  B1 B4     LDA ($B4),Y
  $8FCB  B4 B5     LDY $B5,X
  $8FCD  B1 EB     LDA ($EB),Y
  $8FCF  A8        TAY
  $8FD0  A8        TAY
  $8FD1  B2        .db $B2
  $8FD2  A6 A6     LDX $A6
  $8FD4  B6 B2     LDX $B2,Y
  $8FD6  AF        .db $AF
  $8FD7  A8        TAY
  $8FD8  A8        TAY
  $8FD9  B2        .db $B2
  $8FDA  A6 A6     LDX $A6
  $8FDC  B6 B2     LDX $B2,Y
  $8FDE  AF        .db $AF
  $8FDF  A8        TAY
  $8FE0  A8        TAY
  $8FE1  B2        .db $B2
  $8FE2  A6 A6     LDX $A6
  $8FE4  B6 B2     LDX $B2,Y
  $8FE6  AF        .db $AF
  $8FE7  A8        TAY
  $8FE8  A8        TAY
  $8FE9  B2        .db $B2
  $8FEA  A6 A6     LDX $A6
  $8FEC  B6 B2     LDX $B2,Y
  $8FEE  AF        .db $AF
  $8FEF  A8        TAY
  $8FF0  A8        TAY
  $8FF1  EA        NOP
  $8FF2  BE BE BF  LDX $BFBE,Y
  $8FF5  EA        NOP
  $8FF6  A4 A8     LDY $A8
  $8FF8  A8        TAY
  $8FF9  A8        TAY
  $8FFA  A8        TAY
  $8FFB  A8        TAY
  $8FFC  A8        TAY
  $8FFD  A8        TAY
  $8FFE  A8        TAY
  $8FFF  A8        TAY
  $9000  00        BRK
  $9001  00        BRK
  $9002  00        BRK
  $9003  06 26     ASL $26
  $9005  63        .db $63
  $9006  79 81 00  ADC $0081,Y
  $9009  00        BRK
  $900A  00        BRK
  $900B  04        .db $04
  $900C  04        .db $04
  $900D  04        .db $04
  $900E  46 FF     LSR $FF
  $9010  7F        .db $7F
  $9011  FF        .db $FF
  $9012  7F        .db $7F
  $9013  7F        .db $7F
  $9014  7E FE FC  ROR $FCFE,X
  $9017  F8        SED
  $9018  03        .db $03
  $9019  03        .db $03
  $901A  03        .db $03
  $901B  07        .db $07
  $901C  06 0E     ASL $0E
  $901E  1C        .db $1C
  $901F  F8        SED
  $9020  88        DEY
  $9021  30 00     BMI $9023

L_9023:
  $9023  80        .db $80
  $9024  00        BRK
  $9025  41 23     EOR ($23,X)
  $9027  08        PHP
  $9028  CF        .db $CF
  $9029  FF        .db $FF
  $902A  FF        .db $FF
  $902B  FC        .db $FC
  $902C  7D 7B 3F  ADC $3F7B,X

L_902F:
  $902F  0F        .db $0F
  $9030  38        SEC
  $9031  10 00     BPL $9033

L_9033:
  $9033  00        BRK
  $9034  00        BRK
  $9035  80        .db $80
  $9036  10 00     BPL $9038

L_9038:
  $9038  F8        SED
  $9039  F0 30     BEQ $906B
  $903B  30 F0     BMI $902D
  $903D  F0 F0     BEQ $902F
  $903F  C0 00     CPY #$00
  $9041  00        BRK
  $9042  00        BRK
  $9043  00        BRK
  $9044  80        .db $80
  $9045  80        .db $80
  $9046  C0 C0     CPY #$C0
  $9048  00        BRK
  $9049  00        BRK
  $904A  00        BRK
  $904B  00        BRK
  $904C  00        BRK
  $904D  00        BRK
  $904E  00        BRK
  $904F  00        BRK
  $9050  C0 C0     CPY #$C0
  $9052  C0 C0     CPY #$C0
  $9054  80        .db $80
  $9055  00        BRK
  $9056  38        SEC
  $9057  7C        .db $7C
  $9058  00        BRK
  $9059  00        BRK
  $905A  00        BRK
  $905B  00        BRK
  $905C  00        BRK
  $905D  00        BRK
  $905E  38        SEC
  $905F  0C        .db $0C
  $9060  3C        .db $3C
  $9061  7E FF FF  ROR $FFFF,X
  $9064  FC        .db $FC
  $9065  FC        .db $FC
  $9066  7F        .db $7F
  $9067  3F        .db $3F
  $9068  3C        .db $3C
  $9069  7E FF FF  ROR $FFFF,X
  $906C  00        BRK
  $906D  00        BRK
  $906E  00        BRK
  $906F  01 1C     ORA ($1C,X)
  $9071  3E 7F 7F  ROL $7F7F,X
  $9074  4F        .db $4F
  $9075  4F        .db $4F
  $9076  FF        .db $FF
  $9077  FE 1C 3E  INC $3E1C,X
  $907A  7F        .db $7F
  $907B  7F        .db $7F
  $907C  00        BRK
  $907D  00        BRK
  $907E  80        .db $80
  $907F  C0 7E     CPY #$7E
  $9081  E0 C1     CPX #$C1
  $9083  C2        .db $C2
  $9084  C2        .db $C2
  $9085  62        .db $62
  $9086  31 1C     AND ($1C),Y
  $9088  7F        .db $7F
  $9089  FF        .db $FF
  $908A  FF        .db $FF
  $908B  FE FE 7E  INC $7EFE,X
  $908E  3F        .db $3F
  $908F  1F        .db $1F
  $9090  3C        .db $3C
  $9091  04        .db $04
  $9092  02        .db $02
  $9093  02        .db $02
  $9094  02        .db $02
  $9095  42        .db $42
  $9096  84 08     STY $08
  $9098  FC        .db $FC
  $9099  FC        .db $FC
  $909A  3E 3E 3E  ROL $3E3E,X
  $909D  7E FC F8  ROR $F8FC,X
  $90A0  00        BRK
  $90A1  00        BRK
  $90A2  00        BRK
  $90A3  08        PHP
  $90A4  18        CLC
  $90A5  10 00     BPL $90A7

L_90A7:
  $90A7  00        BRK
  $90A8  1C        .db $1C
  $90A9  36 26     ROL $26,X
  $90AB  4E 5E 5C  LSR $5C5E
  $90AE  78        SEI
  $90AF  30 00     BMI $90B1

L_90B1:
  $90B1  00        BRK
  $90B2  F0 78     BEQ $912C
  $90B4  3C        .db $3C

L_90B5:
  $90B5  1C        .db $1C
  $90B6  04        .db $04
  $90B7  00        BRK

L_90B8:
  $90B8  00        BRK
  $90B9  00        BRK
  $90BA  F0 78     BEQ $9134
  $90BC  3C        .db $3C
  $90BD  1C        .db $1C
  $90BE  04        .db $04
  $90BF  00        BRK
  $90C0  00        BRK
  $90C1  00        BRK
  $90C2  00        BRK
  $90C3  00        BRK
  $90C4  00        BRK
  $90C5  00        BRK
  $90C6  70 E8     BVS $90B0
  $90C8  00        BRK
  $90C9  00        BRK
  $90CA  00        BRK
  $90CB  00        BRK
  $90CC  00        BRK
  $90CD  00        BRK
  $90CE  70 E8     BVS $90B8
  $90D0  00        BRK
  $90D1  00        BRK
  $90D2  00        BRK
  $90D3  00        BRK
  $90D4  01 00     ORA ($00,X)
  $90D6  01 02     ORA ($02,X)
  $90D8  00        BRK
  $90D9  00        BRK
  $90DA  00        BRK
  $90DB  00        BRK
  $90DC  01 03     ORA ($03,X)
  $90DE  07        .db $07
  $90DF  0F        .db $0F
  $90E0  00        BRK
  $90E1  03        .db $03
  $90E2  18        CLC
  $90E3  4F        .db $4F
  $90E4  30 CF     BMI $90B5
  $90E6  10 27     BPL $910F
  $90E8  00        BRK
  $90E9  03        .db $03
  $90EA  1F        .db $1F
  $90EB  7F        .db $7F
  $90EC  FF        .db $FF
  $90ED  FF        .db $FF
  $90EE  FF        .db $FF
  $90EF  FF        .db $FF
  $90F0  00        BRK
  $90F1  18        CLC
  $90F2  FA        .db $FA
  $90F3  05 C4     ORA $C4
  $90F5  18        CLC
  $90F6  E0 00     CPX #$00
  $90F8  00        BRK
  $90F9  F8        SED
  $90FA  FE FF FF  INC $FFFF,X
  $90FD  FE F8 E0  INC $E0F8,X
  $9100  02        .db $02
  $9101  01 00     ORA ($00,X)
  $9103  00        BRK
  $9104  00        BRK
  $9105  00        BRK
  $9106  00        BRK
  $9107  03        .db $03
  $9108  0F        .db $0F
  $9109  0F        .db $0F
  $910A  03        .db $03
  $910B  00        BRK
  $910C  00        BRK
  $910D  00        BRK
  $910E  00        BRK

L_910F:
  $910F  03        .db $03
  $9110  18        CLC
  $9111  C0 00     CPY #$00
  $9113  00        BRK
  $9114  00        BRK
  $9115  00        BRK
  $9116  01 03     ORA ($03,X)
  $9118  FF        .db $FF
  $9119  FC        .db $FC
  $911A  E0 00     CPX #$00
  $911C  00        BRK
  $911D  00        BRK
  $911E  01 03     ORA ($03,X)
  $9120  00        BRK
  $9121  00        BRK
  $9122  00        BRK
  $9123  00        BRK
  $9124  78        SEI
  $9125  EC DC BE  CPX $BEDC
  $9128  00        BRK
  $9129  00        BRK
  $912A  00        BRK

L_912B:
  $912B  00        BRK

L_912C:
  $912C  78        SEI
  $912D  E4 C4     CPX $C4
  $912F  86 C1     STX $C1
  $9131  23        .db $23
  $9132  96 C0     STX $C0,Y

L_9134:
  $9134  C1 70     CMP ($70,X)
  $9136  00        BRK
  $9137  80        .db $80
  $9138  C1 23     CMP ($23,X)
  $913A  16 04     ASL $04,X
  $913C  0E 8F FF  ASL $FF8F
  $913F  FC        .db $FC
  $9140  BF        .db $BF
  $9141  7F        .db $7F
  $9142  7F        .db $7F
  $9143  77        .db $77
  $9144  E3        .db $E3
  $9145  02        .db $02
  $9146  06 04     ASL $04
  $9148  83        .db $83
  $9149  07        .db $07
  $914A  07        .db $07
  $914B  0F        .db $0F
  $914C  1F        .db $1F
  $914D  FE 06 E4  INC $E406,X
  $9150  80        .db $80
  $9151  01 03     ORA ($03,X)
  $9153  00        BRK
  $9154  00        BRK

L_9155:
  $9155  00        BRK
  $9156  00        BRK
  $9157  00        BRK
  $9158  FB        .db $FB
  $9159  67        .db $67
  $915A  3F        .db $3F
  $915B  1F        .db $1F
  $915C  00        BRK
  $915D  00        BRK
  $915E  00        BRK
  $915F  00        BRK
  $9160  08        PHP
  $9161  80        .db $80
  $9162  00        BRK

L_9163:
  $9163  00        BRK
  $9164  00        BRK
  $9165  00        BRK
  $9166  00        BRK
  $9167  00        BRK
  $9168  F8        SED
  $9169  F0 C0     BEQ $912B
  $916B  80        .db $80
  $916C  00        BRK
  $916D  00        BRK
  $916E  00        BRK
  $916F  00        BRK
  $9170  00        BRK
  $9171  00        BRK
  $9172  00        BRK
  $9173  00        BRK
  $9174  00        BRK
  $9175  00        BRK
  $9176  10 10     BPL $9188
  $9178  00        BRK
  $9179  00        BRK
  $917A  60        RTS
  $917B  F0 D8     BEQ $9155
  $917D  88        DEY

L_917E:
  $917E  98        TYA
  $917F  98        TYA
  $9180  00        BRK
  $9181  00        BRK
  $9182  C0 E0     CPY #$E0
  $9184  F0 F8     BEQ $917E
  $9186  E4 E6     CPX $E6

L_9188:
  $9188  00        BRK
  $9189  00        BRK
  $918A  80        .db $80
  $918B  80        .db $80
  $918C  80        .db $80
  $918D  80        .db $80
  $918E  80        .db $80
  $918F  C0 00     CPY #$00
  $9191  00        BRK
  $9192  00        BRK
  $9193  30 11     BMI $91A6
  $9195  01 03     ORA ($03,X)
  $9197  03        .db $03
  $9198  00        BRK
  $9199  00        BRK
  $919A  30 48     BMI $91E4
  $919C  68        PLA
  $919D  30 00     BMI $919F

L_919F:
  $919F  00        BRK
  $91A0  00        BRK
  $91A1  00        BRK
  $91A2  00        BRK
  $91A3  00        BRK
  $91A4  00        BRK
  $91A5  00        BRK

L_91A6:
  $91A6  00        BRK
  $91A7  00        BRK
  $91A8  C8        INY
  $91A9  78        SEI
  $91AA  30 00     BMI $91AC

L_91AC:
  $91AC  00        BRK
  $91AD  00        BRK
  $91AE  00        BRK
  $91AF  00        BRK
  $91B0  E7        .db $E7
  $91B1  FF        .db $FF
  $91B2  7F        .db $7F
  $91B3  7F        .db $7F
  $91B4  3F        .db $3F
  $91B5  38        SEC
  $91B6  18        CLC
  $91B7  08        PHP
  $91B8  C0 E0     CPY #$E0
  $91BA  70 78     BVS $9234
  $91BC  3F        .db $3F
  $91BD  3F        .db $3F
  $91BE  1F        .db $1F
  $91BF  0F        .db $0F
  $91C0  03        .db $03
  $91C1  87        .db $87
  $91C2  FF        .db $FF
  $91C3  DE 0C 00  DEC $000C,X
  $91C6  00        BRK
  $91C7  00        BRK
  $91C8  00        BRK
  $91C9  00        BRK
  $91CA  31 F3     AND ($F3),Y
  $91CC  FF        .db $FF
  $91CD  FF        .db $FF
  $91CE  FF        .db $FF
  $91CF  0F        .db $0F
  $91D0  04        .db $04
  $91D1  00        BRK
  $91D2  00        BRK
  $91D3  00        BRK
  $91D4  00        BRK
  $91D5  00        BRK
  $91D6  00        BRK
  $91D7  00        BRK
  $91D8  06 01     ASL $01
  $91DA  00        BRK
  $91DB  00        BRK
  $91DC  00        BRK
  $91DD  00        BRK
  $91DE  00        BRK
  $91DF  00        BRK
  $91E0  60        RTS
  $91E1  30 80     BMI $9163
  $91E3  00        BRK

L_91E4:
  $91E4  00        BRK
  $91E5  00        BRK
  $91E6  00        BRK
  $91E7  00        BRK
  $91E8  63        .db $63
  $91E9  FF        .db $FF
  $91EA  80        .db $80
  $91EB  00        BRK
  $91EC  00        BRK
  $91ED  00        BRK
  $91EE  00        BRK
  $91EF  00        BRK
  $91F0  00        BRK
  $91F1  00        BRK
  $91F2  00        BRK
  $91F3  00        BRK
  $91F4  00        BRK
  $91F5  01 03     ORA ($03,X)
  $91F7  01 00     ORA ($00,X)
  $91F9  00        BRK
  $91FA  00        BRK
  $91FB  00        BRK
  $91FC  00        BRK
  $91FD  00        BRK
  $91FE  00        BRK
  $91FF  00        BRK
  $9200  03        .db $03
  $9201  03        .db $03
  $9202  00        BRK
  $9203  01 0D     ORA ($0D,X)
  $9205  1E 1F 1F  ASL $1F1F,X
  $9208  00        BRK
  $9209  00        BRK
  $920A  00        BRK
  $920B  00        BRK
  $920C  0C        .db $0C
  $920D  18        CLC
  $920E  10 10     BPL $9220
  $9210  E6 E7     INC $E7
  $9212  E7        .db $E7
  $9213  7F        .db $7F
  $9214  3E 10 18  ROL $1810,X
  $9217  00        BRK
  $9218  80        .db $80
  $9219  C0 C0     CPY #$C0
  $921B  60        RTS
  $921C  31 1F     AND ($1F),Y
  $921E  1C        .db $1C
  $921F  00        BRK

L_9220:
  $9220  4D 02 8C  EOR $8C02
  $9223  1C        .db $1C
  $9224  06 02     ASL $02
  $9226  00        BRK
  $9227  00        BRK
  $9228  00        BRK
  $9229  02        .db $02
  $922A  00        BRK
  $922B  E4 C6     CPX $C6
  $922D  02        .db $02
  $922E  00        BRK
  $922F  00        BRK
  $9230  00        BRK
  $9231  00        BRK
  $9232  00        BRK
  $9233  00        BRK

L_9234:
  $9234  00        BRK
  $9235  00        BRK
  $9236  00        BRK
  $9237  00        BRK
  $9238  0E 1C 18  ASL $181C
  $923B  30 30     BMI $926D
  $923D  60        RTS
  $923E  60        RTS
  $923F  60        RTS
  $9240  00        BRK
  $9241  00        BRK
  $9242  00        BRK
  $9243  00        BRK
  $9244  00        BRK
  $9245  00        BRK
  $9246  00        BRK
  $9247  00        BRK
  $9248  78        SEI
  $9249  1C        .db $1C
  $924A  0C        .db $0C
  $924B  0E 06 03  ASL $0306
  $924E  03        .db $03
  $924F  03        .db $03
  $9250  00        BRK
  $9251  00        BRK
  $9252  00        BRK
  $9253  00        BRK
  $9254  00        BRK
  $9255  00        BRK
  $9256  00        BRK
  $9257  00        BRK
  $9258  00        BRK
  $9259  00        BRK
  $925A  00        BRK
  $925B  00        BRK
  $925C  00        BRK
  $925D  0F        .db $0F
  $925E  7F        .db $7F
  $925F  E0 00     CPX #$00
  $9261  00        BRK
  $9262  00        BRK
  $9263  00        BRK
  $9264  00        BRK
  $9265  00        BRK
  $9266  00        BRK
  $9267  00        BRK
  $9268  00        BRK
  $9269  00        BRK
  $926A  00        BRK
  $926B  00        BRK
  $926C  00        BRK

L_926D:
  $926D  F0 FE     BEQ $926D
  $926F  0F        .db $0F
  $9270  00        BRK
  $9271  0C        .db $0C
  $9272  08        PHP
  $9273  00        BRK
  $9274  00        BRK
  $9275  00        BRK
  $9276  00        BRK
  $9277  00        BRK
  $9278  0E 13 17  ASL $1713
  $927B  1F        .db $1F
  $927C  0E 00 00  ASL $0000
  $927F  00        BRK
  $9280  00        BRK
  $9281  00        BRK
  $9282  00        BRK
  $9283  00        BRK
  $9284  00        BRK
  $9285  00        BRK
  $9286  00        BRK
  $9287  02        .db $02
  $9288  00        BRK
  $9289  00        BRK
  $928A  00        BRK
  $928B  00        BRK
  $928C  00        BRK
  $928D  00        BRK
  $928E  00        BRK
  $928F  00        BRK
  $9290  02        .db $02
  $9291  02        .db $02
  $9292  03        .db $03
  $9293  03        .db $03
  $9294  01 01     ORA ($01,X)
  $9296  00        BRK

L_9297:
  $9297  00        BRK
  $9298  00        BRK
  $9299  00        BRK
  $929A  00        BRK
  $929B  00        BRK
  $929C  00        BRK
  $929D  00        BRK
  $929E  00        BRK
  $929F  00        BRK
  $92A0  00        BRK
  $92A1  00        BRK
  $92A2  00        BRK
  $92A3  00        BRK
  $92A4  03        .db $03
  $92A5  E1 DC     SBC ($DC,X)
  $92A7  26 00     ROL $00
  $92A9  00        BRK
  $92AA  00        BRK
  $92AB  00        BRK
  $92AC  00        BRK
  $92AD  00        BRK
  $92AE  1C        .db $1C
  $92AF  3E 0E 3E  ROL $3E0E,X
  $92B2  3C        .db $3C
  $92B3  3C        .db $3C
  $92B4  38        SEC
  $92B5  F0 E0     BEQ $9297
  $92B7  00        BRK
  $92B8  00        BRK
  $92B9  00        BRK
  $92BA  00        BRK
  $92BB  00        BRK
  $92BC  00        BRK
  $92BD  00        BRK
  $92BE  00        BRK
  $92BF  00        BRK
  $92C0  43        .db $43
  $92C1  01 04     ORA ($04,X)
  $92C3  98        TYA
  $92C4  00        BRK

L_92C5:
  $92C5  42        .db $42
  $92C6  20 13 7F  JSR $7F13
  $92C9  FF        .db $FF
  $92CA  E7        .db $E7
  $92CB  FE 78 63  INC $6378,X
  $92CE  3F        .db $3F
  $92CF  1F        .db $1F
  $92D0  F8        SED
  $92D1  D8        CLD
  $92D2  98        TYA
  $92D3  30 F0     BMI $92C5
  $92D5  60        RTS
  $92D6  C0 00     CPY #$00
  $92D8  F8        SED
  $92D9  D8        CLD
  $92DA  98        TYA
  $92DB  30 F0     BMI $92CD
  $92DD  E0 C0     CPX #$C0
  $92DF  00        BRK
  $92E0  02        .db $02
  $92E1  05 05     ORA $05
  $92E3  09 0A     ORA #$0A
  $92E5  12        .db $12
  $92E6  12        .db $12
  $92E7  24 00     BIT $00
  $92E9  02        .db $02
  $92EA  02        .db $02
  $92EB  06 04     ASL $04
  $92ED  0C        .db $0C
  $92EE  0C        .db $0C
  $92EF  18        CLC
  $92F0  00        BRK
  $92F1  00        BRK
  $92F2  3C        .db $3C
  $92F3  3C        .db $3C
  $92F4  3C        .db $3C
  $92F5  3C        .db $3C
  $92F6  00        BRK
  $92F7  00        BRK
  $92F8  00        BRK
  $92F9  00        BRK
  $92FA  00        BRK
  $92FB  00        BRK
  $92FC  00        BRK
  $92FD  00        BRK
  $92FE  00        BRK
  $92FF  00        BRK
  $9300  00        BRK
  $9301  00        BRK
  $9302  00        BRK
  $9303  00        BRK
  $9304  10 00     BPL $9306

L_9306:
  $9306  00        BRK
  $9307  00        BRK
  $9308  00        BRK
  $9309  00        BRK
  $930A  00        BRK
  $930B  00        BRK
  $930C  10 00     BPL $930E

L_930E:
  $930E  00        BRK
  $930F  00        BRK
  $9310  00        BRK
  $9311  00        BRK
  $9312  00        BRK
  $9313  18        CLC
  $9314  18        CLC
  $9315  00        BRK
  $9316  00        BRK
  $9317  00        BRK
  $9318  00        BRK
  $9319  00        BRK
  $931A  00        BRK
  $931B  18        CLC
  $931C  18        CLC
  $931D  00        BRK
  $931E  00        BRK
  $931F  00        BRK
  $9320  00        BRK
  $9321  00        BRK
  $9322  18        CLC
  $9323  3C        .db $3C
  $9324  3C        .db $3C
  $9325  18        CLC
  $9326  00        BRK
  $9327  00        BRK
  $9328  00        BRK
  $9329  00        BRK
  $932A  18        CLC
  $932B  3C        .db $3C
  $932C  3C        .db $3C
  $932D  18        CLC
  $932E  00        BRK
  $932F  00        BRK
  $9330  FC        .db $FC
  $9331  F8        SED
  $9332  70 78     BVS $93AC

L_9334:
  $9334  D8        CLD
  $9335  C8        INY
  $9336  70 00     BVS $9338

L_9338:
  $9338  FC        .db $FC
  $9339  F8        SED
  $933A  F0 F8     BEQ $9334
  $933C  D8        CLD
  $933D  C8        INY
  $933E  71 01     ADC ($01),Y
  $9340  70 7F     BVS $93C1
  $9342  1F        .db $1F
  $9343  0F        .db $0F
  $9344  07        .db $07
  $9345  03        .db $03
  $9346  00        BRK
  $9347  00        BRK
  $9348  70 7F     BVS $93C9
  $934A  1F        .db $1F
  $934B  4F        .db $4F
  $934C  F7        .db $F7
  $934D  FB        .db $FB
  $934E  FC        .db $FC
  $934F  1E 07 FF  ASL $FF07,X
  $9352  FE F8 F0  INC $F0F8,X
  $9355  C0 00     CPY #$00
  $9357  00        BRK
  $9358  07        .db $07
  $9359  FF        .db $FF
  $935A  FE F9 F7  INC $F7F9,X
  $935D  CF        .db $CF
  $935E  1F        .db $1F
  $935F  7F        .db $7F
  $9360  00        BRK
  $9361  01 01     ORA ($01,X)
  $9363  03        .db $03
  $9364  03        .db $03
  $9365  02        .db $02
  $9366  02        .db $02
  $9367  02        .db $02
  $9368  00        BRK
  $9369  01 01     ORA ($01,X)
  $936B  03        .db $03
  $936C  03        .db $03
  $936D  03        .db $03
  $936E  03        .db $03
  $936F  03        .db $03
  $9370  E0 F0     CPX #$F0
  $9372  F0 78     BEQ $93EC

L_9374:
  $9374  3C        .db $3C
  $9375  7C        .db $7C
  $9376  7C        .db $7C
  $9377  FE EC F4  INC $F4EC,X
  $937A  F0 F8     BEQ $9374
  $937C  FC        .db $FC
  $937D  FC        .db $FC
  $937E  FC        .db $FC
  $937F  FE 00 00  INC $0000,X
  $9382  00        BRK
  $9383  00        BRK
  $9384  03        .db $03
  $9385  3E 3F 7F  ROL $7F3F,X
  $9388  7F        .db $7F
  $9389  3F        .db $3F
  $938A  3F        .db $3F
  $938B  1C        .db $1C
  $938C  03        .db $03
  $938D  3F        .db $3F
  $938E  3F        .db $3F
  $938F  7F        .db $7F
  $9390  00        BRK
  $9391  00        BRK
  $9392  00        BRK
  $9393  80        .db $80
  $9394  C0 C0     CPY #$C0
  $9396  40        RTI
  $9397  40        RTI
  $9398  80        .db $80
  $9399  80        .db $80
  $939A  00        BRK
  $939B  80        .db $80
  $939C  C0 C0     CPY #$C0
  $939E  C0 C0     CPY #$C0
  $93A0  02        .db $02
  $93A1  02        .db $02
  $93A2  03        .db $03
  $93A3  00        BRK
  $93A4  03        .db $03
  $93A5  02        .db $02
  $93A6  04        .db $04
  $93A7  05 03     ORA $03
  $93A9  03        .db $03
  $93AA  03        .db $03
  $93AB  00        BRK

L_93AC:
  $93AC  03        .db $03
  $93AD  03        .db $03
  $93AE  07        .db $07
  $93AF  07        .db $07
  $93B0  FE FE FE  INC $FEFE,X
  $93B3  7E 9E FC  ROR $FC9E,X
  $93B6  FC        .db $FC
  $93B7  F8        SED
  $93B8  FE FE FE  INC $FEFE,X
  $93BB  7E 9E FC  ROR $FC9E,X
  $93BE  FC        .db $FC
  $93BF  F8        SED
  $93C0  7F        .db $7F

L_93C1:
  $93C1  7F        .db $7F
  $93C2  7E 7E FF  ROR $FF7E,X
  $93C5  FD FF F0  SBC $F0FF,X
  $93C8  7F        .db $7F

L_93C9:
  $93C9  7F        .db $7F
  $93CA  7F        .db $7F
  $93CB  7F        .db $7F
  $93CC  FF        .db $FF
  $93CD  FF        .db $FF
  $93CE  FF        .db $FF
  $93CF  F0 40     BEQ $9411
  $93D1  40        RTI
  $93D2  C0 C0     CPY #$C0
  $93D4  80        .db $80
  $93D5  80        .db $80
  $93D6  80        .db $80
  $93D7  00        BRK
  $93D8  C0 C0     CPY #$C0
  $93DA  C0 C0     CPY #$C0
  $93DC  80        .db $80
  $93DD  80        .db $80
  $93DE  80        .db $80
  $93DF  00        BRK
  $93E0  15 77     ORA $77,X
  $93E2  F7        .db $F7
  $93E3  03        .db $03
  $93E4  FC        .db $FC
  $93E5  7F        .db $7F
  $93E6  1F        .db $1F
  $93E7  00        BRK
  $93E8  07        .db $07
  $93E9  07        .db $07
  $93EA  07        .db $07
  $93EB  03        .db $03

L_93EC:
  $93EC  00        BRK
  $93ED  00        BRK
  $93EE  00        BRK
  $93EF  00        BRK
  $93F0  FA        .db $FA
  $93F1  F7        .db $F7
  $93F2  EF        .db $EF
  $93F3  C0 3F     CPY #$3F
  $93F5  FF        .db $FF
  $93F6  FF        .db $FF
  $93F7  00        BRK
  $93F8  F8        SED
  $93F9  F0 E0     BEQ $93DB
  $93FB  C0 00     CPY #$00
  $93FD  00        BRK
  $93FE  00        BRK
  $93FF  00        BRK
  $9400  00        BRK
  $9401  00        BRK
  $9402  00        BRK
  $9403  03        .db $03
  $9404  07        .db $07
  $9405  0F        .db $0F
  $9406  1F        .db $1F
  $9407  1F        .db $1F
  $9408  00        BRK
  $9409  07        .db $07
  $940A  1F        .db $1F
  $940B  3F        .db $3F
  $940C  3F        .db $3F
  $940D  7F        .db $7F
  $940E  7F        .db $7F
  $940F  7F        .db $7F
  $9410  00        BRK

L_9411:
  $9411  00        BRK
  $9412  00        BRK
  $9413  C0 E0     CPY #$E0
  $9415  E0 C0     CPX #$C0
  $9417  00        BRK
  $9418  00        BRK
  $9419  E0 F8     CPX #$F8
  $941B  FC        .db $FC
  $941C  FC        .db $FC
  $941D  FE FE FE  INC $FEFE,X
  $9420  1E 1E 1E  ASL $1E1E,X
  $9423  0C        .db $0C
  $9424  00        BRK
  $9425  00        BRK
  $9426  00        BRK
  $9427  00        BRK
  $9428  7F        .db $7F
  $9429  7F        .db $7F
  $942A  7F        .db $7F
  $942B  3F        .db $3F
  $942C  3F        .db $3F
  $942D  1F        .db $1F
  $942E  07        .db $07
  $942F  00        BRK
  $9430  00        BRK
  $9431  00        BRK
  $9432  00        BRK
  $9433  00        BRK
  $9434  00        BRK
  $9435  00        BRK
  $9436  00        BRK
  $9437  00        BRK
  $9438  FE FE FE  INC $FEFE,X
  $943B  FC        .db $FC
  $943C  FC        .db $FC
  $943D  F8        SED
  $943E  E0 00     CPX #$00
  $9440  00        BRK
  $9441  07        .db $07
  $9442  1F        .db $1F
  $9443  3C        .db $3C
  $9444  38        SEC
  $9445  70 60     BVS $94A7
  $9447  60        RTS
  $9448  00        BRK
  $9449  07        .db $07
  $944A  1F        .db $1F
  $944B  3F        .db $3F
  $944C  3F        .db $3F
  $944D  7F        .db $7F
  $944E  7F        .db $7F
  $944F  7F        .db $7F
  $9450  00        BRK
  $9451  E0 F8     CPX #$F8
  $9453  3C        .db $3C
  $9454  1C        .db $1C
  $9455  1E 3E FE  ASL $FE3E,X
  $9458  00        BRK
  $9459  E0 F8     CPX #$F8
  $945B  FC        .db $FC
  $945C  FC        .db $FC
  $945D  FE FE FE  INC $FEFE,X
  $9460  61 61     ADC ($61,X)
  $9462  61 33     ADC ($33,X)
  $9464  3F        .db $3F
  $9465  1F        .db $1F
  $9466  07        .db $07
  $9467  00        BRK
  $9468  7F        .db $7F
  $9469  7F        .db $7F
  $946A  7F        .db $7F
  $946B  3F        .db $3F
  $946C  3F        .db $3F
  $946D  1F        .db $1F
  $946E  07        .db $07
  $946F  00        BRK
  $9470  FE FE FE  INC $FEFE,X
  $9473  FC        .db $FC
  $9474  FC        .db $FC
  $9475  F8        SED
  $9476  E0 00     CPX #$00
  $9478  FE FE FE  INC $FEFE,X
  $947B  FC        .db $FC
  $947C  FC        .db $FC
  $947D  F8        SED
  $947E  E0 00     CPX #$00
  $9480  00        BRK
  $9481  00        BRK
  $9482  78        SEI
  $9483  3C        .db $3C
  $9484  00        BRK
  $9485  00        BRK
  $9486  00        BRK
  $9487  00        BRK
  $9488  00        BRK
  $9489  FC        .db $FC
  $948A  FE FF FF  INC $FFFF,X
  $948D  FE FC 00  INC $00FC,X
  $9490  18        CLC
  $9491  18        CLC
  $9492  18        CLC
  $9493  10 10     BPL $94A5
  $9495  10 10     BPL $94A7
  $9497  10 38     BPL $94D1
  $9499  38        SEC
  $949A  18        CLC
  $949B  18        CLC
  $949C  10 10     BPL $94AE
  $949E  10 10     BPL $94B0
  $94A0  00        BRK
  $94A1  00        BRK
  $94A2  00        BRK
  $94A3  10 18     BPL $94BD

L_94A5:
  $94A5  18        CLC
  $94A6  18        CLC

L_94A7:
  $94A7  18        CLC
  $94A8  00        BRK
  $94A9  10 38     BPL $94E3
  $94AB  38        SEC
  $94AC  38        SEC
  $94AD  38        SEC

L_94AE:
  $94AE  38        SEC
  $94AF  38        SEC

L_94B0:
  $94B0  70 70     BVS $9522
  $94B2  A0 A0     LDY #$A0
  $94B4  00        BRK
  $94B5  00        BRK

L_94B6:
  $94B6  00        BRK
  $94B7  00        BRK
  $94B8  F0 70     BEQ $952A
  $94BA  A0 A0     LDY #$A0
  $94BC  00        BRK

L_94BD:
  $94BD  00        BRK

L_94BE:
  $94BE  00        BRK
  $94BF  00        BRK
  $94C0  0D 0D 0C  ORA $0C0D
  $94C3  0C        .db $0C
  $94C4  0D 0F 0E  ORA $0E0F
  $94C7  00        BRK
  $94C8  0D 0D 0C  ORA $0C0D
  $94CB  0C        .db $0C
  $94CC  0D 0F 0E  ORA $0E0F
  $94CF  00        BRK
  $94D0  83        .db $83

L_94D1:
  $94D1  A6 0C     LDX $0C
  $94D3  98        TYA
  $94D4  B0 E0     BCS $94B6
  $94D6  C0 80     CPY #$80
  $94D8  83        .db $83
  $94D9  A6 0C     LDX $0C
  $94DB  98        TYA
  $94DC  B0 E0     BCS $94BE
  $94DE  C0 80     CPY #$80
  $94E0  00        BRK
  $94E1  00        BRK
  $94E2  00        BRK

L_94E3:
  $94E3  00        BRK
  $94E4  00        BRK
  $94E5  01 02     ORA ($02,X)
  $94E7  04        .db $04
  $94E8  00        BRK
  $94E9  00        BRK
  $94EA  00        BRK
  $94EB  00        BRK
  $94EC  00        BRK
  $94ED  01 02     ORA ($02,X)
  $94EF  04        .db $04
  $94F0  00        BRK
  $94F1  03        .db $03
  $94F2  1C        .db $1C
  $94F3  60        RTS
  $94F4  80        .db $80
  $94F5  1E 7E 7C  ASL $7C7E,X
  $94F8  00        BRK
  $94F9  03        .db $03
  $94FA  1C        .db $1C
  $94FB  60        RTS
  $94FC  80        .db $80
  $94FD  1E 7E 7C  ASL $7C7E,X
  $9500  04        .db $04
  $9501  09 09     ORA #$09

L_9503:
  $9503  11 11     ORA ($11),Y
  $9505  11 10     ORA ($10),Y
  $9507  20 04 09  JSR $0904
  $950A  09 11     ORA #$11
  $950C  11 11     ORA ($11),Y
  $950E  10 20     BPL $9530
  $9510  F8        SED
  $9511  F0 F0     BEQ $9503
  $9513  E0 C0     CPX #$C0
  $9515  80        .db $80

L_9516:
  $9516  00        BRK
  $9517  00        BRK
  $9518  F8        SED
  $9519  F0 F0     BEQ $950B
  $951B  E0 C0     CPX #$C0
  $951D  80        .db $80
  $951E  00        BRK
  $951F  00        BRK
  $9520  20 20 20  JSR $2020
  $9523  20 20 20  JSR $2020
  $9526  20 10 20  JSR $2010
  $9529  20 20 20  JSR $2020
  $952C  20 20 20  JSR $2020
  $952F  10 10     BPL $9541
  $9531  10 08     BPL $953B
  $9533  04        .db $04
  $9534  04        .db $04
  $9535  02        .db $02
  $9536  00        BRK
  $9537  00        BRK
  $9538  10 10     BPL $954A
  $953A  08        PHP

L_953B:
  $953B  04        .db $04
  $953C  04        .db $04
  $953D  02        .db $02
  $953E  00        BRK
  $953F  00        BRK
  $9540  00        BRK

L_9541:
  $9541  03        .db $03
  $9542  01 00     ORA ($00,X)

L_9544:
  $9544  02        .db $02
  $9545  03        .db $03
  $9546  01 00     ORA ($00,X)
  $9548  03        .db $03
  $9549  03        .db $03

L_954A:
  $954A  05 06     ORA $06

L_954C:
  $954C  07        .db $07
  $954D  03        .db $03
  $954E  01 00     ORA ($00,X)
  $9550  00        BRK
  $9551  00        BRK
  $9552  00        BRK
  $9553  00        BRK
  $9554  00        BRK
  $9555  00        BRK
  $9556  00        BRK
  $9557  00        BRK
  $9558  00        BRK
  $9559  80        .db $80
  $955A  C0 E0     CPY #$E0
  $955C  70 B8     BVS $9516
  $955E  DC        .db $DC
  $955F  EE 00 00  INC $0000
  $9562  00        BRK
  $9563  00        BRK
  $9564  00        BRK
  $9565  00        BRK
  $9566  00        BRK
  $9567  00        BRK
  $9568  77        .db $77
  $9569  3B        .db $3B
  $956A  1C        .db $1C
  $956B  00        BRK
  $956C  00        BRK
  $956D  00        BRK
  $956E  00        BRK
  $956F  00        BRK
  $9570  00        BRK
  $9571  00        BRK
  $9572  00        BRK
  $9573  00        BRK
  $9574  01 02     ORA ($02,X)
  $9576  04        .db $04
  $9577  08        PHP
  $9578  00        BRK
  $9579  00        BRK
  $957A  00        BRK
  $957B  00        BRK
  $957C  01 02     ORA ($02,X)
  $957E  04        .db $04
  $957F  08        PHP
  $9580  00        BRK
  $9581  0F        .db $0F
  $9582  30 C0     BMI $9544
  $9584  00        BRK
  $9585  00        BRK
  $9586  00        BRK
  $9587  00        BRK
  $9588  00        BRK
  $9589  0F        .db $0F
  $958A  30 C0     BMI $954C
  $958C  00        BRK
  $958D  00        BRK
  $958E  00        BRK
  $958F  00        BRK
  $9590  08        PHP
  $9591  10 10     BPL $95A3
  $9593  23        .db $23
  $9594  27        .db $27
  $9595  27        .db $27
  $9596  4F        .db $4F
  $9597  4E 08 10  LSR $1008
  $959A  10 23     BPL $95BF
  $959C  27        .db $27
  $959D  27        .db $27
  $959E  4F        .db $4F
  $959F  4E 00 01  LSR $0100
  $95A2  01 03     ORA ($03,X)
  $95A4  03        .db $03
  $95A5  03        .db $03
  $95A6  03        .db $03
  $95A7  07        .db $07
  $95A8  01 06     ORA ($06,X)
  $95AA  0F        .db $0F
  $95AB  05 1C     ORA $1C
  $95AD  0C        .db $0C
  $95AE  1D 0B FC  ORA $FC0B,X
  $95B1  FE FC FC  INC $FCFC,X
  $95B4  FD FD FF  SBC $FFFD,X
  $95B7  FF        .db $FF
  $95B8  7D FF FF  ADC $FFFF,X
  $95BB  FF        .db $FF
  $95BC  C2        .db $C2
  $95BD  8E C7 7F  STX $7FC7
  $95C0  00        BRK
  $95C1  00        BRK
  $95C2  00        BRK
  $95C3  00        BRK
  $95C4  80        .db $80
  $95C5  C0 C0     CPY #$C0

L_95C7:
  $95C7  C0 C0     CPY #$C0
  $95C9  F0 FC     BEQ $95C7

L_95CB:
  $95CB  F0 7C     BEQ $9649
  $95CD  BE B0 BC  LDX $BCB0,Y
  $95D0  46 46     LSR $46
  $95D2  40        RTI
  $95D3  40        RTI
  $95D4  40        RTI
  $95D5  40        RTI
  $95D6  40        RTI
  $95D7  20 46 46  JSR $4646
  $95DA  40        RTI
  $95DB  40        RTI
  $95DC  40        RTI
  $95DD  40        RTI
  $95DE  40        RTI
  $95DF  20 03 02  JSR $0203
  $95E2  01 03     ORA ($03,X)
  $95E4  0F        .db $0F
  $95E5  1D 1C 00  ORA $001C,X
  $95E8  04        .db $04
  $95E9  01 00     ORA ($00,X)
  $95EB  01 0D     ORA ($0D,X)
  $95ED  1C        .db $1C
  $95EE  1D 01 1F  ORA $1F01,X
  $95F1  0F        .db $0F
  $95F2  EF        .db $EF
  $95F3  FE FC FF  INC $FFFC,X
  $95F6  7E 3E EE  ROR $EE3E,X
  $95F9  F6 14     INC $14,X
  $95FB  E9 63     SBC #$63
  $95FD  0C        .db $0C
  $95FE  9D DD 80  STA $80DD,X
  $9601  C0 30     CPY #$30
  $9603  08        PHP
  $9604  88        DEY
  $9605  84 04     STY $04
  $9607  04        .db $04
  $9608  78        SEI
  $9609  10 C0     BPL $95CB
  $960B  F0 70     BEQ $967D
  $960D  78        SEI
  $960E  F8        SED
  $960F  F8        SED
  $9610  20 20 10  JSR $1020
  $9613  10 08     BPL $961D
  $9615  08        PHP
  $9616  04        .db $04
  $9617  02        .db $02
  $9618  20 20 10  JSR $1020
  $961B  10 08     BPL $9625

L_961D:
  $961D  08        PHP
  $961E  04        .db $04
  $961F  02        .db $02
  $9620  01 00     ORA ($00,X)
  $9622  00        BRK
  $9623  00        BRK
  $9624  00        BRK

L_9625:
  $9625  00        BRK
  $9626  00        BRK
  $9627  00        BRK
  $9628  01 00     ORA ($00,X)
  $962A  00        BRK
  $962B  00        BRK
  $962C  00        BRK
  $962D  00        BRK
  $962E  00        BRK
  $962F  00        BRK
  $9630  01 03     ORA ($03,X)
  $9632  03        .db $03
  $9633  07        .db $07
  $9634  03        .db $03
  $9635  07        .db $07
  $9636  07        .db $07
  $9637  0F        .db $0F
  $9638  02        .db $02
  $9639  0D 1F 09  ORA $091F
  $963C  3D 19 3B  AND $3B19,X
  $963F  16 F8     ASL $F8,X
  $9641  FC        .db $FC
  $9642  F8        SED
  $9643  F8        SED
  $9644  FB        .db $FB
  $9645  FB        .db $FB
  $9646  FF        .db $FF
  $9647  FF        .db $FF
  $9648  FB        .db $FB

L_9649:
  $9649  FF        .db $FF
  $964A  FF        .db $FF
  $964B  C7        .db $C7
  $964C  0C        .db $0C
  $964D  9D 8F FF  STA $FF8F,X
  $9650  00        BRK
  $9651  00        BRK
  $9652  00        BRK
  $9653  00        BRK
  $9654  00        BRK

L_9655:
  $9655  80        .db $80
  $9656  80        .db $80
  $9657  80        .db $80
  $9658  80        .db $80
  $9659  E0 F8     CPX #$F8
  $965B  E0 F8     CPX #$F8
  $965D  7C        .db $7C
  $965E  60        RTS
  $965F  78        SEI
  $9660  06 04     ASL $04
  $9662  03        .db $03
  $9663  07        .db $07
  $9664  3F        .db $3F
  $9665  63        .db $63
  $9666  E0 E0     CPX #$E0
  $9668  09 03     ORA #$03
  $966A  00        BRK
  $966B  03        .db $03
  $966C  02        .db $02
  $966D  60        RTS
  $966E  E8        INX
  $966F  EC 3F 1F  CPX $1F3F
  $9672  DE FC F8  DEC $F8FC,X
  $9675  E0 70     CPX #$70
  $9677  70 DC     BVS $9655
  $9679  EC 29 D3  CPX $D329
  $967C  87        .db $87

L_967D:
  $967D  6F        .db $6F
  $967E  77        .db $77
  $967F  77        .db $77
  $9680  00        BRK
  $9681  00        BRK
  $9682  00        BRK
  $9683  00        BRK
  $9684  00        BRK
  $9685  00        BRK
  $9686  00        BRK
  $9687  00        BRK
  $9688  30 00     BMI $968A

L_968A:
  $968A  80        .db $80
  $968B  C0 E0     CPY #$E0
  $968D  E0 F0     CPX #$F0
  $968F  F0 00     BEQ $9691

L_9691:
  $9691  0E 1F 37  ASL $371F
  $9694  20 30 63  JSR $6330
  $9697  67        .db $67
  $9698  00        BRK
  $9699  0E 1F 3F  ASL $3F1F
  $969C  3F        .db $3F
  $969D  3F        .db $3F
  $969E  7F        .db $7F
  $969F  7F        .db $7F
  $96A0  0E 3E FE  ASL $FE3E
  $96A3  FE 3E FF  INC $FF3E,X
  $96A6  FF        .db $FF
  $96A7  FE 0E 3E  INC $3E0E,X
  $96AA  FE FE FE  INC $FEFE,X
  $96AD  FF        .db $FF
  $96AE  FF        .db $FF
  $96AF  FE 6F DF  INC $DF6F,X
  $96B2  DD 8D FE  CMP $FE8D,X
  $96B5  7E 06 00  ROR $0006,X
  $96B8  7F        .db $7F
  $96B9  FF        .db $FF
  $96BA  FD FD FE  SBC $FEFD,X
  $96BD  7E 06 00  ROR $0006,X
  $96C0  FC        .db $FC
  $96C1  F0 F0     BEQ $96B3
  $96C3  F8        SED
  $96C4  F8        SED
  $96C5  78        SEI
  $96C6  70 60     BVS $9728
  $96C8  FC        .db $FC
  $96C9  F0 F0     BEQ $96BB
  $96CB  F8        SED
  $96CC  F8        SED
  $96CD  F8        SED
  $96CE  F0 60     BEQ $9730
  $96D0  EC 7F 7F  CPX $7F7F
  $96D3  3F        .db $3F
  $96D4  C0 FF     CPY #$FF
  $96D6  FF        .db $FF
  $96D7  00        BRK
  $96D8  EF        .db $EF
  $96D9  7F        .db $7F
  $96DA  7F        .db $7F
  $96DB  3F        .db $3F
  $96DC  00        BRK
  $96DD  00        BRK
  $96DE  00        BRK
  $96DF  00        BRK
  $96E0  98        TYA
  $96E1  6E EF E0  ROR $E0EF
  $96E4  1F        .db $1F
  $96E5  FE F8 00  INC $00F8,X
  $96E8  80        .db $80
  $96E9  E0 E0     CPX #$E0
  $96EB  E0 00     CPX #$00
  $96ED  00        BRK
  $96EE  00        BRK
  $96EF  00        BRK

L_96F0:
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
  $96FB  00        BRK
  $96FC  00        BRK
  $96FD  00        BRK
  $96FE  00        BRK
  $96FF  00        BRK
  $9700  00        BRK
  $9701  00        BRK
  $9702  00        BRK
  $9703  00        BRK
  $9704  00        BRK
  $9705  1C        .db $1C
  $9706  3E 31 00  ROL $0031,X
  $9709  00        BRK
  $970A  00        BRK
  $970B  00        BRK
  $970C  38        SEC
  $970D  20 40 49  JSR $4940
  $9710  31 31     AND ($31),Y
  $9712  31 3E     AND ($3E),Y
  $9714  3F        .db $3F
  $9715  1C        .db $1C
  $9716  07        .db $07
  $9717  01 41     ORA ($41,X)
  $9719  01 29     ORA ($29,X)
  $971B  3F        .db $3F
  $971C  3F        .db $3F
  $971D  1C        .db $1C
  $971E  0F        .db $0F
  $971F  03        .db $03
  $9720  8C 8C 8C  STY $8C8C
  $9723  7C        .db $7C
  $9724  FC        .db $FC
  $9725  38        SEC
  $9726  E0 80     CPX #$80

L_9728:
  $9728  82        .db $82
  $9729  80        .db $80
  $972A  94 7C     STY $7C,X
  $972C  FC        .db $FC
  $972D  38        SEC
  $972E  F0 C0     BEQ $96F0

L_9730:
  $9730  19 79 00  ORA $0079,Y
  $9733  FA        .db $FA
  $9734  F4        .db $F4
  $9735  6B        .db $6B
  $9736  0F        .db $0F
  $9737  07        .db $07
  $9738  01 01     ORA ($01,X)
  $973A  00        BRK
  $973B  03        .db $03
  $973C  07        .db $07
  $973D  0F        .db $0F
  $973E  0F        .db $0F
  $973F  07        .db $07
  $9740  FF        .db $FF
  $9741  03        .db $03
  $9742  FC        .db $FC
  $9743  1F        .db $1F
  $9744  7F        .db $7F
  $9745  FF        .db $FF
  $9746  FF        .db $FF
  $9747  FE FF 03  INC $03FF,X
  $974A  FC        .db $FC
  $974B  FF        .db $FF
  $974C  FF        .db $FF
  $974D  FF        .db $FF
  $974E  FF        .db $FF
  $974F  FE DF C0  INC $C0DF,X
  $9752  E0 6F     CPX #$6F
  $9754  CF        .db $CF
  $9755  DF        .db $DF
  $9756  80        .db $80
  $9757  7F        .db $7F
  $9758  DF        .db $DF
  $9759  C0 E0     CPY #$E0
  $975B  60        RTS
  $975C  C0 C0     CPY #$C0
  $975E  80        .db $80
  $975F  00        BRK
  $9760  78        SEI
  $9761  FE 00 FF  INC $FF00,X
  $9764  FF        .db $FF
  $9765  FE 00 80  INC $8000,X
  $9768  00        BRK
  $9769  00        BRK
  $976A  00        BRK
  $976B  00        BRK
  $976C  00        BRK
  $976D  00        BRK
  $976E  00        BRK
  $976F  00        BRK
  $9770  19 06 F7  ORA $F706,Y
  $9773  F7        .db $F7
  $9774  F8        SED
  $9775  00        BRK
  $9776  1F        .db $1F
  $9777  01 01     ORA ($01,X)
  $9779  07        .db $07
  $977A  07        .db $07
  $977B  07        .db $07
  $977C  00        BRK
  $977D  00        BRK
  $977E  00        BRK
  $977F  00        BRK
  $9780  37        .db $37
  $9781  FE FE FD  INC $FDFE,X
  $9784  03        .db $03
  $9785  00        BRK
  $9786  FF        .db $FF
  $9787  FF        .db $FF
  $9788  F7        .db $F7
  $9789  FE FE FC  INC $FCFE,X
  $978C  00        BRK
  $978D  00        BRK
  $978E  00        BRK
  $978F  00        BRK
  $9790  5F        .db $5F
  $9791  0F        .db $0F
  $9792  F7        .db $F7
  $9793  FB        .db $FB
  $9794  FC        .db $FC
  $9795  00        BRK
  $9796  FF        .db $FF
  $9797  FF        .db $FF
  $9798  1F        .db $1F
  $9799  0F        .db $0F
  $979A  07        .db $07
  $979B  03        .db $03
  $979C  00        BRK
  $979D  00        BRK
  $979E  00        BRK
  $979F  00        BRK
  $97A0  A8        TAY
  $97A1  E0 EF     CPX #$EF
  $97A3  CF        .db $CF
  $97A4  3F        .db $3F
  $97A5  00        BRK
  $97A6  F8        SED
  $97A7  80        .db $80
  $97A8  E0 E0     CPX #$E0
  $97AA  E0 C0     CPX #$C0
  $97AC  00        BRK
  $97AD  00        BRK
  $97AE  00        BRK
  $97AF  00        BRK
  $97B0  00        BRK
  $97B1  05 08     ORA $08
  $97B3  18        CLC
  $97B4  78        SEI
  $97B5  4F        .db $4F
  $97B6  7F        .db $7F
  $97B7  FF        .db $FF
  $97B8  01 66     ORA ($66,X)
  $97BA  48        PHA
  $97BB  58        CLI
  $97BC  7D 7C FF  ADC $FF7C,X
  $97BF  FF        .db $FF
  $97C0  E0 F0     CPX #$F0

L_97C2:
  $97C2  F8        SED
  $97C3  F8        SED
  $97C4  F8        SED
  $97C5  F8        SED
  $97C6  F8        SED
  $97C7  F0 F0     BEQ $97B9
  $97C9  38        SEC
  $97CA  1C        .db $1C

L_97CB:
  $97CB  1C        .db $1C
  $97CC  1C        .db $1C
  $97CD  3C        .db $3C
  $97CE  FC        .db $FC
  $97CF  F8        SED
  $97D0  C3        .db $C3
  $97D1  7B        .db $7B
  $97D2  7F        .db $7F
  $97D3  3F        .db $3F
  $97D4  06 00     ASL $00
  $97D6  00        BRK
  $97D7  00        BRK
  $97D8  C7        .db $C7
  $97D9  FF        .db $FF
  $97DA  7F        .db $7F
  $97DB  3F        .db $3F
  $97DC  0F        .db $0F
  $97DD  00        BRK
  $97DE  00        BRK
  $97DF  00        BRK
  $97E0  F0 E0     BEQ $97C2
  $97E2  C0 80     CPY #$80
  $97E4  00        BRK
  $97E5  00        BRK
  $97E6  00        BRK
  $97E7  00        BRK
  $97E8  F8        SED
  $97E9  F0 E0     BEQ $97CB
  $97EB  C0 00     CPY #$00
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
  $9801  07        .db $07
  $9802  18        CLC
  $9803  30 20     BMI $9825
  $9805  41 42     EOR ($42,X)
  $9807  44        .db $44
  $9808  07        .db $07
  $9809  1F        .db $1F
  $980A  38        SEC
  $980B  77        .db $77
  $980C  6F        .db $6F
  $980D  DF        .db $DF
  $980E  DE DC 00  DEC $00DC,X
  $9811  E0 18     CPX #$18
  $9813  0C        .db $0C
  $9814  04        .db $04
  $9815  02        .db $02
  $9816  02        .db $02
  $9817  02        .db $02
  $9818  E0 F8     CPX #$F8
  $981A  1C        .db $1C
  $981B  0E 06 03  ASL $0306
  $981E  03        .db $03
  $981F  03        .db $03
  $9820  00        BRK
  $9821  00        BRK
  $9822  07        .db $07
  $9823  08        PHP
  $9824  10 20     BPL $9846
  $9826  20 21 00  JSR $0021
  $9829  07        .db $07
  $982A  1F        .db $1F
  $982B  38        SEC
  $982C  30 63     BMI $9891
  $982E  67        .db $67
  $982F  67        .db $67
  $9830  00        BRK
  $9831  00        BRK
  $9832  E0 10     CPX #$10
  $9834  08        PHP
  $9835  04        .db $04

L_9836:
  $9836  84 04     STY $04
  $9838  00        BRK
  $9839  E0 F8     CPX #$F8
  $983B  1C        .db $1C
  $983C  0C        .db $0C
  $983D  86 86     STX $86
  $983F  06 22     ASL $22
  $9841  20 20 10  JSR $1020
  $9844  08        PHP
  $9845  07        .db $07

L_9846:
  $9846  00        BRK
  $9847  00        BRK
  $9848  66 60     ROR $60
  $984A  60        RTS
  $984B  30 38     BMI $9885
  $984D  1F        .db $1F
  $984E  07        .db $07
  $984F  00        BRK
  $9850  04        .db $04
  $9851  04        .db $04
  $9852  04        .db $04
  $9853  08        PHP
  $9854  10 E0     BPL $9836
  $9856  00        BRK
  $9857  00        BRK
  $9858  06 06     ASL $06
  $985A  06 0C     ASL $0C
  $985C  1C        .db $1C
  $985D  F8        SED
  $985E  E0 00     CPX #$00
  $9860  00        BRK
  $9861  00        BRK
  $9862  00        BRK
  $9863  07        .db $07
  $9864  0C        .db $0C
  $9865  18        CLC
  $9866  10 10     BPL $9878
  $9868  00        BRK
  $9869  00        BRK
  $986A  07        .db $07
  $986B  0F        .db $0F
  $986C  1C        .db $1C
  $986D  38        SEC
  $986E  31 33     AND ($33),Y
  $9870  00        BRK
  $9871  00        BRK
  $9872  00        BRK
  $9873  E0 30     CPX #$30

L_9875:
  $9875  18        CLC
  $9876  48        PHA
  $9877  C8        INY

L_9878:
  $9878  00        BRK
  $9879  00        BRK
  $987A  E0 F0     CPX #$F0
  $987C  38        SEC
  $987D  1C        .db $1C

L_987E:
  $987E  CC CC 11  CPY $11CC
  $9881  13        .db $13
  $9882  18        CLC
  $9883  0C        .db $0C
  $9884  07        .db $07

L_9885:
  $9885  00        BRK
  $9886  00        BRK
  $9887  00        BRK
  $9888  33        .db $33
  $9889  33        .db $33
  $988A  38        SEC
  $988B  1C        .db $1C
  $988C  0F        .db $0F
  $988D  07        .db $07
  $988E  00        BRK
  $988F  00        BRK
  $9890  08        PHP

L_9891:
  $9891  08        PHP
  $9892  18        CLC
  $9893  30 E0     BMI $9875
  $9895  00        BRK
  $9896  00        BRK
  $9897  00        BRK
  $9898  0C        .db $0C
  $9899  0C        .db $0C
  $989A  1C        .db $1C
  $989B  38        SEC
  $989C  F0 E0     BEQ $987E
  $989E  00        BRK
  $989F  00        BRK
  $98A0  00        BRK
  $98A1  00        BRK
  $98A2  00        BRK
  $98A3  00        BRK
  $98A4  3C        .db $3C
  $98A5  42        .db $42
  $98A6  81 00     STA ($00,X)
  $98A8  00        BRK
  $98A9  18        CLC
  $98AA  3C        .db $3C
  $98AB  7E C3 81  ROR $81C3,X
  $98AE  00        BRK
  $98AF  00        BRK
  $98B0  40        RTI
  $98B1  20 10 10  JSR $1010
  $98B4  10 10     BPL $98C6
  $98B6  20 40 30  JSR $3040
  $98B9  18        CLC
  $98BA  0C        .db $0C
  $98BB  0E 0E 0C  ASL $0C0E
  $98BE  18        CLC
  $98BF  30 07     BMI $98C8
  $98C1  1A        .db $1A
  $98C2  28        PLP
  $98C3  20 43 85  JSR $8543

L_98C6:
  $98C6  C8        INY
  $98C7  8D 00 05  STA $0500
  $98CA  17        .db $17
  $98CB  1F        .db $1F
  $98CC  3C        .db $3C
  $98CD  7A        .db $7A
  $98CE  37        .db $37
  $98CF  72        .db $72
  $98D0  E0 58     CPX #$58
  $98D2  14        .db $14
  $98D3  02        .db $02
  $98D4  C6 A1     DEC $A1
  $98D6  13        .db $13
  $98D7  B1 00     LDA ($00),Y
  $98D9  A0 E8     LDY #$E8
  $98DB  FC        .db $FC

L_98DC:
  $98DC  38        SEC
  $98DD  5E EC 4E  LSR $4EEC,X
  $98E0  02        .db $02
  $98E1  0D 14 30  ORA $3014
  $98E4  53        .db $53
  $98E5  46 8E     LSR $8E
  $98E7  49 00     EOR #$00
  $98E9  02        .db $02
  $98EA  0B        .db $0B
  $98EB  0F        .db $0F
  $98EC  2C 39 71  BIT $7139
  $98EF  36 40     ROL $40,X
  $98F1  B0 08     BCS $98FB
  $98F3  1C        .db $1C
  $98F4  C2        .db $C2

L_98F5:
  $98F5  66 71     ROR $71
  $98F7  92        .db $92
  $98F8  00        BRK
  $98F9  40        RTI
  $98FA  F0 E0     BEQ $98DC
  $98FC  3C        .db $3C

L_98FD:
  $98FD  98        TYA
  $98FE  8E 6C 00  STX $006C
  $9901  0F        .db $0F
  $9902  0F        .db $0F
  $9903  19 1B 24  ORA $241B,Y
  $9906  13        .db $13
  $9907  09 00     ORA #$00
  $9909  0F        .db $0F
  $990A  1F        .db $1F
  $990B  3F        .db $3F
  $990C  3F        .db $3F
  $990D  3F        .db $3F
  $990E  1F        .db $1F
  $990F  0F        .db $0F
  $9910  00        BRK
  $9911  80        .db $80
  $9912  E0 F8     CPX #$F8
  $9914  FC        .db $FC
  $9915  7C        .db $7C
  $9916  FC        .db $FC
  $9917  FC        .db $FC
  $9918  00        BRK
  $9919  80        .db $80
  $991A  E0 F8     CPX #$F8
  $991C  FC        .db $FC
  $991D  FC        .db $FC
  $991E  FC        .db $FC
  $991F  FC        .db $FC
  $9920  2F        .db $2F
  $9921  10 0F     BPL $9932
  $9923  13        .db $13
  $9924  0F        .db $0F
  $9925  07        .db $07
  $9926  18        CLC
  $9927  10 3F     BPL $9968

L_9929:
  $9929  3F        .db $3F
  $992A  1F        .db $1F
  $992B  1F        .db $1F
  $992C  1F        .db $1F
  $992D  0F        .db $0F
  $992E  18        CLC
  $992F  10 F8     BPL $9929
  $9931  E0 F0     CPX #$F0
  $9933  F0 C0     BEQ $98F5
  $9935  80        .db $80
  $9936  00        BRK
  $9937  00        BRK
  $9938  F8        SED
  $9939  E0 F0     CPX #$F0
  $993B  F0 C0     BEQ $98FD
  $993D  80        .db $80
  $993E  00        BRK
  $993F  00        BRK
  $9940  04        .db $04
  $9941  0B        .db $0B
  $9942  1E 3F 1F  ASL $1F3F,X
  $9945  0B        .db $0B
  $9946  14        .db $14
  $9947  1E 07 0F  ASL $0F07,X
  $994A  1F        .db $1F
  $994B  3F        .db $3F
  $994C  1F        .db $1F
  $994D  0F        .db $0F
  $994E  17        .db $17
  $994F  1F        .db $1F
  $9950  00        BRK
  $9951  F0 2C     BEQ $997F
  $9953  77        .db $77
  $9954  E7        .db $E7
  $9955  8F        .db $8F
  $9956  1E 7E F0  ASL $F07E,X
  $9959  FC        .db $FC
  $995A  FE FF FF  INC $FFFF,X
  $995D  FF        .db $FF
  $995E  FE FE 08  INC $08FE,X
  $9961  0F        .db $0F
  $9962  08        PHP
  $9963  1D 1E 18  ORA $181E,X
  $9966  10 20     BPL $9988

L_9968:
  $9968  0F        .db $0F
  $9969  0F        .db $0F
  $996A  0F        .db $0F
  $996B  1F        .db $1F
  $996C  1F        .db $1F
  $996D  1E 18 20  ASL $2018,X
  $9970  0C        .db $0C
  $9971  78        SEI
  $9972  60        RTS
  $9973  E0 C0     CPX #$C0
  $9975  00        BRK

L_9976:
  $9976  00        BRK
  $9977  00        BRK
  $9978  FC        .db $FC
  $9979  F8        SED
  $997A  E0 E0     CPX #$E0
  $997C  C0 00     CPY #$00
  $997E  00        BRK

L_997F:
  $997F  00        BRK
  $9980  00        BRK
  $9981  01 03     ORA ($03,X)
  $9983  07        .db $07
  $9984  07        .db $07
  $9985  07        .db $07
  $9986  07        .db $07
  $9987  03        .db $03

L_9988:
  $9988  00        BRK
  $9989  01 03     ORA ($03,X)
  $998B  07        .db $07
  $998C  07        .db $07
  $998D  07        .db $07
  $998E  07        .db $07
  $998F  03        .db $03
  $9990  70 F8     BVS $998A
  $9992  FC        .db $FC
  $9993  FC        .db $FC
  $9994  FA        .db $FA
  $9995  FA        .db $FA
  $9996  E2        .db $E2
  $9997  8C 70 F8  STY $F870
  $999A  FC        .db $FC
  $999B  FE FF FF  INC $FFFF,X
  $999E  FF        .db $FF
  $999F  FF        .db $FF
  $99A0  0F        .db $0F
  $99A1  0F        .db $0F
  $99A2  07        .db $07
  $99A3  07        .db $07
  $99A4  07        .db $07
  $99A5  07        .db $07
  $99A6  04        .db $04
  $99A7  0C        .db $0C
  $99A8  0F        .db $0F
  $99A9  0F        .db $0F
  $99AA  07        .db $07
  $99AB  07        .db $07
  $99AC  07        .db $07
  $99AD  07        .db $07
  $99AE  07        .db $07
  $99AF  0C        .db $0C
  $99B0  F0 C4     BEQ $9976
  $99B2  F8        SED
  $99B3  80        .db $80
  $99B4  E0 00     CPX #$00
  $99B6  00        BRK
  $99B7  00        BRK
  $99B8  FE FC FC  INC $FCFC,X
  $99BB  F8        SED
  $99BC  E0 C0     CPX #$C0
  $99BE  00        BRK
  $99BF  00        BRK
  $99C0  00        BRK
  $99C1  00        BRK
  $99C2  00        BRK
  $99C3  00        BRK
  $99C4  00        BRK
  $99C5  03        .db $03
  $99C6  07        .db $07
  $99C7  03        .db $03
  $99C8  00        BRK
  $99C9  06 0F     ASL $0F
  $99CB  1D 18 23  ORA $2318,X
  $99CE  37        .db $37
  $99CF  13        .db $13
  $99D0  00        BRK
  $99D1  00        BRK
  $99D2  03        .db $03
  $99D3  00        BRK
  $99D4  07        .db $07
  $99D5  0E 2C 05  ASL $052C
  $99D8  00        BRK
  $99D9  1C        .db $1C
  $99DA  33        .db $33
  $99DB  4F        .db $4F
  $99DC  5F        .db $5F
  $99DD  5E 2F 27  LSR $272F,X
  $99E0  00        BRK
  $99E1  00        BRK
  $99E2  00        BRK
  $99E3  0C        .db $0C
  $99E4  10 08     BPL $99EE
  $99E6  08        PHP
  $99E7  11 08     ORA ($08),Y
  $99E9  22        .db $22
  $99EA  4C 1C B0  JMP $B01C
  $99ED  0E 48 31  ASL $3148
  $99F0  00        BRK
  $99F1  00        BRK
  $99F2  00        BRK
  $99F3  00        BRK
  $99F4  00        BRK
  $99F5  00        BRK
  $99F6  00        BRK
  $99F7  00        BRK
  $99F8  38        SEC
  $99F9  20 88 10  JSR $1088
  $99FC  90 00     BCC $99FE

L_99FE:
  $99FE  00        BRK
  $99FF  00        BRK
  $9A00  00        BRK
  $9A01  03        .db $03
  $9A02  0F        .db $0F
  $9A03  1C        .db $1C
  $9A04  38        SEC
  $9A05  30 60     BMI $9A67
  $9A07  60        RTS
  $9A08  00        BRK
  $9A09  03        .db $03
  $9A0A  0F        .db $0F
  $9A0B  1F        .db $1F
  $9A0C  3F        .db $3F
  $9A0D  3F        .db $3F
  $9A0E  7E 7C FF  ROR $FF7C,X
  $9A11  FF        .db $FF
  $9A12  00        BRK
  $9A13  00        BRK
  $9A14  00        BRK
  $9A15  00        BRK
  $9A16  00        BRK
  $9A17  00        BRK
  $9A18  FF        .db $FF
  $9A19  FF        .db $FF
  $9A1A  FF        .db $FF
  $9A1B  FF        .db $FF
  $9A1C  FF        .db $FF
  $9A1D  00        BRK
  $9A1E  00        BRK
  $9A1F  7E C0 C0  ROR $C0C0,X
  $9A22  C0 C0     CPY #$C0
  $9A24  C0 C0     CPY #$C0
  $9A26  C0 C0     CPY #$C0
  $9A28  F8        SED
  $9A29  F9 F9 F9  SBC $F9F9,Y
  $9A2C  F9 F9 F9  SBC $F9F9,Y
  $9A2F  F8        SED
  $9A30  00        BRK
  $9A31  00        BRK
  $9A32  00        BRK
  $9A33  00        BRK
  $9A34  00        BRK
  $9A35  00        BRK
  $9A36  00        BRK
  $9A37  00        BRK
  $9A38  81 00     STA ($00,X)
  $9A3A  00        BRK
  $9A3B  00        BRK
  $9A3C  00        BRK
  $9A3D  00        BRK
  $9A3E  00        BRK
  $9A3F  81 00     STA ($00,X)
  $9A41  00        BRK
  $9A42  00        BRK
  $9A43  01 07     ORA ($07,X)
  $9A45  0E 0C 18  ASL $180C
  $9A48  00        BRK
  $9A49  00        BRK
  $9A4A  00        BRK
  $9A4B  01 07     ORA ($07,X)
  $9A4D  0F        .db $0F
  $9A4E  0F        .db $0F
  $9A4F  1F        .db $1F
  $9A50  00        BRK
  $9A51  00        BRK
  $9A52  7E FF C3  ROR $C3FF,X
  $9A55  00        BRK
  $9A56  00        BRK
  $9A57  00        BRK
  $9A58  00        BRK
  $9A59  00        BRK
  $9A5A  7E FF FF  ROR $FFFF,X
  $9A5D  FF        .db $FF
  $9A5E  FF        .db $FF
  $9A5F  C3        .db $C3
  $9A60  18        CLC
  $9A61  38        SEC
  $9A62  30 30     BMI $9A94
  $9A64  30 30     BMI $9A96
  $9A66  38        SEC

L_9A67:
  $9A67  18        CLC
  $9A68  1F        .db $1F
  $9A69  3F        .db $3F
  $9A6A  3E 3E 3E  ROL $3E3E,X
  $9A6D  3E 3F 1F  ROL $1F3F,X
  $9A70  00        BRK
  $9A71  00        BRK
  $9A72  00        BRK
  $9A73  00        BRK
  $9A74  00        BRK
  $9A75  00        BRK
  $9A76  00        BRK
  $9A77  00        BRK
  $9A78  80        .db $80
  $9A79  3C        .db $3C
  $9A7A  42        .db $42
  $9A7B  42        .db $42
  $9A7C  42        .db $42
  $9A7D  42        .db $42
  $9A7E  3C        .db $3C
  $9A7F  00        BRK
  $9A80  07        .db $07
  $9A81  1F        .db $1F
  $9A82  38        SEC
  $9A83  70 60     BVS $9AE5
  $9A85  C0 C0     CPY #$C0
  $9A87  C0 07     CPY #$07
  $9A89  1F        .db $1F
  $9A8A  3F        .db $3F
  $9A8B  7F        .db $7F
  $9A8C  7C        .db $7C
  $9A8D  FB        .db $FB
  $9A8E  F4        .db $F4
  $9A8F  F4        .db $F4
  $9A90  00        BRK
  $9A91  00        BRK
  $9A92  07        .db $07
  $9A93  0F        .db $0F

L_9A94:
  $9A94  18        CLC
  $9A95  30 30     BMI $9AC7
  $9A97  30 00     BMI $9A99

L_9A99:
  $9A99  00        BRK
  $9A9A  07        .db $07
  $9A9B  0F        .db $0F
  $9A9C  1F        .db $1F
  $9A9D  3E 3C 39  ROL $393C,X
  $9AA0  3C        .db $3C
  $9AA1  42        .db $42
  $9AA2  81 81     STA ($81,X)
  $9AA4  81 81     STA ($81,X)
  $9AA6  42        .db $42
  $9AA7  3C        .db $3C
  $9AA8  3C        .db $3C
  $9AA9  7E E7 C3  ROR $C3E7,X
  $9AAC  C3        .db $C3
  $9AAD  E7        .db $E7
  $9AAE  7E 3C 00  ROR $003C,X
  $9AB1  3C        .db $3C
  $9AB2  66 42     ROR $42
  $9AB4  42        .db $42
  $9AB5  66 3C     ROR $3C
  $9AB7  00        BRK
  $9AB8  00        BRK
  $9AB9  3C        .db $3C
  $9ABA  7E 66 66  ROR $6666,X
  $9ABD  7E 3C 00  ROR $003C,X
  $9AC0  00        BRK
  $9AC1  00        BRK
  $9AC2  00        BRK
  $9AC3  00        BRK
  $9AC4  00        BRK
  $9AC5  00        BRK
  $9AC6  00        BRK

L_9AC7:
  $9AC7  00        BRK
  $9AC8  10 10     BPL $9ADA
  $9ACA  10 38     BPL $9B04
  $9ACC  FF        .db $FF
  $9ACD  38        SEC
  $9ACE  10 10     BPL $9AE0
  $9AD0  00        BRK
  $9AD1  00        BRK
  $9AD2  00        BRK
  $9AD3  00        BRK
  $9AD4  00        BRK
  $9AD5  00        BRK
  $9AD6  00        BRK
  $9AD7  00        BRK
  $9AD8  00        BRK
  $9AD9  00        BRK

L_9ADA:
  $9ADA  00        BRK
  $9ADB  10 38     BPL $9B15
  $9ADD  10 00     BPL $9ADF

L_9ADF:
  $9ADF  00        BRK

L_9AE0:
  $9AE0  00        BRK
  $9AE1  00        BRK
  $9AE2  00        BRK
  $9AE3  00        BRK
  $9AE4  00        BRK

L_9AE5:
  $9AE5  00        BRK
  $9AE6  00        BRK
  $9AE7  00        BRK
  $9AE8  00        BRK
  $9AE9  10 10     BPL $9AFB
  $9AEB  10 10     BPL $9AFD
  $9AED  10 10     BPL $9AFF
  $9AEF  00        BRK
  $9AF0  00        BRK
  $9AF1  00        BRK
  $9AF2  00        BRK
  $9AF3  00        BRK
  $9AF4  00        BRK

L_9AF5:
  $9AF5  00        BRK
  $9AF6  00        BRK
  $9AF7  00        BRK
  $9AF8  00        BRK
  $9AF9  00        BRK
  $9AFA  00        BRK

L_9AFB:
  $9AFB  00        BRK
  $9AFC  00        BRK

L_9AFD:
  $9AFD  00        BRK
  $9AFE  00        BRK

L_9AFF:
  $9AFF  00        BRK
  $9B00  00        BRK
  $9B01  00        BRK
  $9B02  00        BRK
  $9B03  1E 31 7C  ASL $7C31,X
  $9B06  E6 CE     INC $CE
  $9B08  00        BRK
  $9B09  00        BRK
  $9B0A  00        BRK
  $9B0B  00        BRK
  $9B0C  1E 3F 7F  ASL $7F3F,X
  $9B0F  7F        .db $7F
  $9B10  00        BRK
  $9B11  00        BRK
  $9B12  00        BRK
  $9B13  00        BRK
  $9B14  C0 F0     CPY #$F0
  $9B16  7C        .db $7C
  $9B17  42        .db $42
  $9B18  00        BRK
  $9B19  00        BRK
  $9B1A  00        BRK
  $9B1B  00        BRK
  $9B1C  00        BRK
  $9B1D  40        RTI
  $9B1E  B0 BC     BCS $9ADC
  $9B20  DE FE FE  DEC $FEFE,X
  $9B23  7C        .db $7C
  $9B24  31 1E     AND ($1E),Y
  $9B26  00        BRK
  $9B27  00        BRK
  $9B28  7F        .db $7F
  $9B29  7F        .db $7F
  $9B2A  7F        .db $7F
  $9B2B  3F        .db $3F
  $9B2C  1E 00 00  ASL $0000,X
  $9B2F  00        BRK
  $9B30  7F        .db $7F
  $9B31  42        .db $42
  $9B32  7C        .db $7C
  $9B33  F0 C0     BEQ $9AF5
  $9B35  00        BRK
  $9B36  00        BRK
  $9B37  00        BRK
  $9B38  80        .db $80
  $9B39  BC B0 40  LDY $40B0,X
  $9B3C  00        BRK
  $9B3D  00        BRK
  $9B3E  00        BRK
  $9B3F  00        BRK
  $9B40  00        BRK
  $9B41  00        BRK
  $9B42  00        BRK
  $9B43  01 03     ORA ($03,X)
  $9B45  07        .db $07
  $9B46  0E 0C 00  ASL $000C
  $9B49  00        BRK
  $9B4A  00        BRK
  $9B4B  00        BRK
  $9B4C  01 03     ORA ($03,X)
  $9B4E  07        .db $07
  $9B4F  07        .db $07
  $9B50  00        BRK
  $9B51  0F        .db $0F
  $9B52  1C        .db $1C
  $9B53  FB        .db $FB
  $9B54  1A        .db $1A
  $9B55  CA        DEX
  $9B56  66 E4     ROR $E4
  $9B58  00        BRK
  $9B59  00        BRK
  $9B5A  0F        .db $0F
  $9B5B  0C        .db $0C
  $9B5C  E4 F4     CPX $F4
  $9B5E  F8        SED
  $9B5F  F8        SED
  $9B60  0D 0F 0F  ORA $0F0F
  $9B63  07        .db $07
  $9B64  03        .db $03
  $9B65  01 00     ORA ($00,X)
  $9B67  00        BRK
  $9B68  07        .db $07
  $9B69  07        .db $07
  $9B6A  07        .db $07
  $9B6B  03        .db $03
  $9B6C  01 00     ORA ($00,X)
  $9B6E  00        BRK
  $9B6F  00        BRK
  $9B70  E4 E4     CPX $E4
  $9B72  E6 CA     INC $CA
  $9B74  1A        .db $1A
  $9B75  FB        .db $FB
  $9B76  1C        .db $1C
  $9B77  0F        .db $0F
  $9B78  F8        SED
  $9B79  F8        SED
  $9B7A  F8        SED
  $9B7B  F4        .db $F4
  $9B7C  E4 0C     CPX $0C
  $9B7E  0F        .db $0F
  $9B7F  00        BRK
  $9B80  00        BRK
  $9B81  00        BRK
  $9B82  00        BRK
  $9B83  03        .db $03
  $9B84  06 0F     ASL $0F
  $9B86  1C        .db $1C
  $9B87  19 00 00  ORA $0000,Y
  $9B8A  00        BRK
  $9B8B  00        BRK
  $9B8C  03        .db $03
  $9B8D  07        .db $07
  $9B8E  0F        .db $0F
  $9B8F  0F        .db $0F

L_9B90:
  $9B90  00        BRK
  $9B91  00        BRK
  $9B92  0E DD 3B  ASL $3BDD
  $9B95  9A        TXS
  $9B96  CC C8 00  CPY $00C8
  $9B99  00        BRK
  $9B9A  00        BRK
  $9B9B  0E CC EC  ASL $ECCC
  $9B9E  F0 F0     BEQ $9B90
  $9BA0  1B        .db $1B
  $9BA1  1F        .db $1F
  $9BA2  1F        .db $1F
  $9BA3  0F        .db $0F
  $9BA4  06 03     ASL $03
  $9BA6  00        BRK
  $9BA7  00        BRK

L_9BA8:
  $9BA8  0F        .db $0F
  $9BA9  0F        .db $0F

L_9BAA:
  $9BAA  0F        .db $0F
  $9BAB  07        .db $07
  $9BAC  03        .db $03
  $9BAD  00        BRK
  $9BAE  00        BRK
  $9BAF  00        BRK
  $9BB0  C8        INY
  $9BB1  C8        INY
  $9BB2  CC 9A 3B  CPY $3B9A
  $9BB5  DD 0E 00  CMP $000E,X
  $9BB8  F0 F0     BEQ $9BAA
  $9BBA  F0 EC     BEQ $9BA8
  $9BBC  CC 0E 00  CPY $000E
  $9BBF  00        BRK
  $9BC0  00        BRK
  $9BC1  00        BRK
  $9BC2  00        BRK
  $9BC3  03        .db $03
  $9BC4  04        .db $04
  $9BC5  08        PHP
  $9BC6  10 10     BPL $9BD8
  $9BC8  00        BRK
  $9BC9  00        BRK
  $9BCA  00        BRK
  $9BCB  00        BRK
  $9BCC  03        .db $03
  $9BCD  07        .db $07
  $9BCE  0F        .db $0F
  $9BCF  0F        .db $0F

L_9BD0:
  $9BD0  00        BRK
  $9BD1  00        BRK
  $9BD2  0E DD 3B  ASL $3BDD
  $9BD5  1A        .db $1A
  $9BD6  0C        .db $0C
  $9BD7  08        PHP

L_9BD8:
  $9BD8  00        BRK
  $9BD9  00        BRK
  $9BDA  00        BRK
  $9BDB  0E CC EC  ASL $ECCC
  $9BDE  F0 F0     BEQ $9BD0
  $9BE0  10 10     BPL $9BF2
  $9BE2  10 08     BPL $9BEC
  $9BE4  04        .db $04
  $9BE5  03        .db $03
  $9BE6  00        BRK
  $9BE7  00        BRK

L_9BE8:
  $9BE8  0F        .db $0F
  $9BE9  0F        .db $0F

L_9BEA:
  $9BEA  0F        .db $0F
  $9BEB  07        .db $07

L_9BEC:
  $9BEC  03        .db $03
  $9BED  00        BRK
  $9BEE  00        BRK
  $9BEF  00        BRK
  $9BF0  08        PHP
  $9BF1  08        PHP

L_9BF2:
  $9BF2  0C        .db $0C
  $9BF3  1A        .db $1A
  $9BF4  3B        .db $3B
  $9BF5  DD 0E 00  CMP $000E,X
  $9BF8  F0 F0     BEQ $9BEA
  $9BFA  F0 EC     BEQ $9BE8
  $9BFC  CC 0E 00  CPY $000E
  $9BFF  00        BRK
  $9C00  03        .db $03
  $9C01  1F        .db $1F
  $9C02  3F        .db $3F
  $9C03  7F        .db $7F
  $9C04  7F        .db $7F
  $9C05  FE FC F0  INC $F0FC,X
  $9C08  01 02     ORA ($02,X)
  $9C0A  18        CLC
  $9C0B  36 2E     ROL $2E,X
  $9C0D  5C        .db $5C
  $9C0E  70 00     BVS $9C10

L_9C10:
  $9C10  00        BRK
  $9C11  00        BRK
  $9C12  00        BRK
  $9C13  00        BRK
  $9C14  00        BRK
  $9C15  01 03     ORA ($03,X)
  $9C17  01 00     ORA ($00,X)
  $9C19  00        BRK
  $9C1A  00        BRK
  $9C1B  00        BRK
  $9C1C  00        BRK
  $9C1D  00        BRK
  $9C1E  01 00     ORA ($00,X)
  $9C20  00        BRK
  $9C21  03        .db $03
  $9C22  1F        .db $1F
  $9C23  7E FE FE  ROR $FEFE,X
  $9C26  FC        .db $FC
  $9C27  F0 00     BEQ $9C29

L_9C29:
  $9C29  00        BRK
  $9C2A  02        .db $02
  $9C2B  1C        .db $1C
  $9C2C  64        .db $64
  $9C2D  9C        .db $9C
  $9C2E  F0 00     BEQ $9C30

L_9C30:
  $9C30  03        .db $03
  $9C31  0F        .db $0F
  $9C32  0F        .db $0F
  $9C33  07        .db $07
  $9C34  03        .db $03
  $9C35  00        BRK
  $9C36  00        BRK
  $9C37  00        BRK
  $9C38  00        BRK
  $9C39  03        .db $03
  $9C3A  07        .db $07
  $9C3B  03        .db $03
  $9C3C  00        BRK
  $9C3D  00        BRK
  $9C3E  00        BRK
  $9C3F  00        BRK
  $9C40  E0 F8     CPX #$F8
  $9C42  FC        .db $FC
  $9C43  FE FE F8  INC $F8FE,X
  $9C46  00        BRK
  $9C47  00        BRK
  $9C48  00        BRK
  $9C49  E0 18     CPX #$18
  $9C4B  E4 F8     CPX $F8
  $9C4D  00        BRK
  $9C4E  00        BRK
  $9C4F  00        BRK
  $9C50  00        BRK
  $9C51  00        BRK
  $9C52  00        BRK
  $9C53  0E 39 79  ASL $7939
  $9C56  C3        .db $C3
  $9C57  C7        .db $C7
  $9C58  00        BRK
  $9C59  00        BRK
  $9C5A  01 0E     ORA ($0E,X)
  $9C5C  25 45     AND $45
  $9C5E  FB        .db $FB
  $9C5F  C7        .db $C7
  $9C60  00        BRK
  $9C61  00        BRK
  $9C62  D0 3C     BNE $9CA0
  $9C64  FF        .db $FF
  $9C65  FF        .db $FF
  $9C66  FF        .db $FF
  $9C67  FF        .db $FF
  $9C68  00        BRK
  $9C69  00        BRK
  $9C6A  30 3C     BMI $9CA8
  $9C6C  FF        .db $FF
  $9C6D  FF        .db $FF
  $9C6E  FF        .db $FF
  $9C6F  FF        .db $FF
  $9C70  00        BRK
  $9C71  00        BRK
  $9C72  00        BRK
  $9C73  00        BRK
  $9C74  00        BRK
  $9C75  80        .db $80
  $9C76  80        .db $80
  $9C77  C0 00     CPY #$00
  $9C79  00        BRK
  $9C7A  00        BRK
  $9C7B  00        BRK
  $9C7C  00        BRK
  $9C7D  80        .db $80
  $9C7E  80        .db $80
  $9C7F  C0 01     CPY #$01
  $9C81  01 01     ORA ($01,X)
  $9C83  01 00     ORA ($00,X)
  $9C85  00        BRK
  $9C86  00        BRK
  $9C87  00        BRK
  $9C88  01 01     ORA ($01,X)
  $9C8A  01 01     ORA ($01,X)
  $9C8C  00        BRK
  $9C8D  00        BRK
  $9C8E  00        BRK
  $9C8F  00        BRK
  $9C90  FC        .db $FC
  $9C91  30 20     BMI $9CB3
  $9C93  00        BRK
  $9C94  00        BRK
  $9C95  00        BRK
  $9C96  00        BRK
  $9C97  00        BRK
  $9C98  FC        .db $FC
  $9C99  30 20     BMI $9CBB
  $9C9B  00        BRK
  $9C9C  00        BRK
  $9C9D  00        BRK
  $9C9E  00        BRK
  $9C9F  00        BRK

L_9CA0:
  $9CA0  1F        .db $1F
  $9CA1  0F        .db $0F
  $9CA2  07        .db $07
  $9CA3  07        .db $07
  $9CA4  07        .db $07
  $9CA5  07        .db $07
  $9CA6  04        .db $04
  $9CA7  08        PHP

L_9CA8:
  $9CA8  1F        .db $1F
  $9CA9  0F        .db $0F
  $9CAA  07        .db $07
  $9CAB  07        .db $07
  $9CAC  07        .db $07
  $9CAD  07        .db $07
  $9CAE  07        .db $07
  $9CAF  0F        .db $0F
  $9CB0  C0 E0     CPY #$E0
  $9CB2  E0 E0     CPX #$E0
  $9CB4  E0 E0     CPX #$E0
  $9CB6  40        RTI
  $9CB7  00        BRK
  $9CB8  C0 E0     CPY #$E0
  $9CBA  E0 E0     CPX #$E0
  $9CBC  E0 E0     CPX #$E0
  $9CBE  C0 C0     CPY #$C0
  $9CC0  00        BRK
  $9CC1  10 30     BPL $9CF3
  $9CC3  78        SEI
  $9CC4  F0 00     BEQ $9CC6

L_9CC6:
  $9CC6  00        BRK
  $9CC7  00        BRK
  $9CC8  0E 1C 3D  ASL $3D1C
  $9CCB  7F        .db $7F
  $9CCC  F0 0F     BEQ $9CDD
  $9CCE  FF        .db $FF
  $9CCF  FF        .db $FF
  $9CD0  00        BRK
  $9CD1  00        BRK
  $9CD2  00        BRK
  $9CD3  00        BRK
  $9CD4  00        BRK
  $9CD5  00        BRK
  $9CD6  00        BRK
  $9CD7  00        BRK
  $9CD8  40        RTI
  $9CD9  C0 80     CPY #$80
  $9CDB  00        BRK
  $9CDC  00        BRK

L_9CDD:
  $9CDD  00        BRK
  $9CDE  80        .db $80
  $9CDF  C0 00     CPY #$00
  $9CE1  00        BRK
  $9CE2  00        BRK
  $9CE3  00        BRK
  $9CE4  00        BRK
  $9CE5  00        BRK
  $9CE6  00        BRK
  $9CE7  00        BRK
  $9CE8  00        BRK
  $9CE9  00        BRK
  $9CEA  00        BRK
  $9CEB  00        BRK
  $9CEC  00        BRK
  $9CED  00        BRK
  $9CEE  01 03     ORA ($03,X)
  $9CF0  00        BRK
  $9CF1  00        BRK
  $9CF2  00        BRK

L_9CF3:
  $9CF3  00        BRK
  $9CF4  00        BRK
  $9CF5  00        BRK
  $9CF6  00        BRK
  $9CF7  00        BRK
  $9CF8  00        BRK
  $9CF9  00        BRK
  $9CFA  00        BRK
  $9CFB  00        BRK
  $9CFC  00        BRK
  $9CFD  F0 FF     BEQ $9CFE
  $9CFF  FF        .db $FF
  $9D00  7F        .db $7F
  $9D01  FF        .db $FF
  $9D02  C0 D2     CPY #$D2
  $9D04  C0 FF     CPY #$FF
  $9D06  C0 C9     CPY #$C9
  $9D08  00        BRK
  $9D09  00        BRK
  $9D0A  3F        .db $3F
  $9D0B  24 24     BIT $24
  $9D0D  3F        .db $3F
  $9D0E  00        BRK
  $9D0F  09 FE     ORA #$FE
  $9D11  FF        .db $FF
  $9D12  0B        .db $0B
  $9D13  4B        .db $4B
  $9D14  0B        .db $0B
  $9D15  FB        .db $FB
  $9D16  03        .db $03
  $9D17  23        .db $23
  $9D18  00        BRK
  $9D19  03        .db $03
  $9D1A  FB        .db $FB
  $9D1B  9B        .db $9B
  $9D1C  9B        .db $9B
  $9D1D  FB        .db $FB
  $9D1E  03        .db $03
  $9D1F  23        .db $23
  $9D20  FF        .db $FF
  $9D21  C0 C0     CPY #$C0
  $9D23  FF        .db $FF
  $9D24  C0 FF     CPY #$FF
  $9D26  7F        .db $7F
  $9D27  00        BRK
  $9D28  00        BRK
  $9D29  3F        .db $3F
  $9D2A  3F        .db $3F
  $9D2B  3F        .db $3F
  $9D2C  00        BRK
  $9D2D  7F        .db $7F
  $9D2E  7F        .db $7F
  $9D2F  00        BRK
  $9D30  F3        .db $F3
  $9D31  0B        .db $0B
  $9D32  0B        .db $0B
  $9D33  FB        .db $FB
  $9D34  03        .db $03
  $9D35  FF        .db $FF
  $9D36  FE 00 0B  INC $0B00,X
  $9D39  FB        .db $FB
  $9D3A  FB        .db $FB
  $9D3B  FB        .db $FB
  $9D3C  03        .db $03
  $9D3D  FF        .db $FF
  $9D3E  FE 00 00  INC $0000,X
  $9D41  00        BRK
  $9D42  00        BRK
  $9D43  00        BRK
  $9D44  00        BRK
  $9D45  3F        .db $3F
  $9D46  7F        .db $7F
  $9D47  60        RTS
  $9D48  00        BRK
  $9D49  00        BRK
  $9D4A  00        BRK
  $9D4B  00        BRK
  $9D4C  00        BRK
  $9D4D  00        BRK
  $9D4E  00        BRK
  $9D4F  1F        .db $1F
  $9D50  00        BRK
  $9D51  00        BRK
  $9D52  00        BRK
  $9D53  00        BRK
  $9D54  00        BRK
  $9D55  FF        .db $FF
  $9D56  FF        .db $FF
  $9D57  01 00     ORA ($00,X)
  $9D59  00        BRK
  $9D5A  00        BRK
  $9D5B  00        BRK
  $9D5C  00        BRK
  $9D5D  00        BRK
  $9D5E  01 FD     ORA ($FD,X)
  $9D60  00        BRK
  $9D61  00        BRK
  $9D62  00        BRK
  $9D63  00        BRK
  $9D64  00        BRK
  $9D65  FF        .db $FF
  $9D66  FF        .db $FF
  $9D67  80        .db $80
  $9D68  00        BRK
  $9D69  00        BRK
  $9D6A  00        BRK
  $9D6B  00        BRK
  $9D6C  00        BRK
  $9D6D  00        BRK
  $9D6E  00        BRK
  $9D6F  7F        .db $7F
  $9D70  00        BRK
  $9D71  00        BRK
  $9D72  00        BRK
  $9D73  00        BRK
  $9D74  00        BRK
  $9D75  FC        .db $FC
  $9D76  FE 06 00  INC $0006,X
  $9D79  00        BRK
  $9D7A  00        BRK
  $9D7B  00        BRK
  $9D7C  00        BRK
  $9D7D  00        BRK
  $9D7E  06 F6     ASL $F6
  $9D80  69 60     ADC #$60
  $9D82  7F        .db $7F
  $9D83  60        RTS
  $9D84  60        RTS
  $9D85  02        .db $02
  $9D86  00        BRK
  $9D87  00        BRK
  $9D88  12        .db $12
  $9D89  12        .db $12
  $9D8A  1F        .db $1F
  $9D8B  00        BRK
  $9D8C  00        BRK
  $9D8D  02        .db $02
  $9D8E  00        BRK
  $9D8F  00        BRK
  $9D90  21 01     AND ($01,X)
  $9D92  FD 01 00  SBC $0001,X
  $9D95  59 19 D9  EOR $D919,Y
  $9D98  4D 4D FD  EOR $FD4D
  $9D9B  01 00     ORA ($00,X)
  $9D9D  5E 1E DE  LSR $DE1E,X
  $9DA0  A4 80     LDY $80
  $9DA2  FF        .db $FF
  $9DA3  80        .db $80
  $9DA4  00        BRK
  $9DA5  99 98 9B  STA $9B98,Y
  $9DA8  49 49     EOR #$49
  $9DAA  7F        .db $7F
  $9DAB  00        BRK
  $9DAC  00        BRK
  $9DAD  79 78 7B  ADC $7B78,Y
  $9DB0  86 06     STX $06
  $9DB2  F6 06     INC $06,X
  $9DB4  06 20     ASL $20
  $9DB6  00        BRK
  $9DB7  00        BRK
  $9DB8  36 36     ROL $36,X
  $9DBA  F6 06     INC $06,X
  $9DBC  06 20     ASL $20
  $9DBE  00        BRK
  $9DBF  00        BRK
  $9DC0  00        BRK
  $9DC1  7F        .db $7F
  $9DC2  60        RTS
  $9DC3  60        RTS
  $9DC4  7F        .db $7F
  $9DC5  60        RTS
  $9DC6  7F        .db $7F
  $9DC7  3F        .db $3F
  $9DC8  00        BRK
  $9DC9  00        BRK
  $9DCA  1F        .db $1F
  $9DCB  1F        .db $1F
  $9DCC  1F        .db $1F
  $9DCD  00        BRK
  $9DCE  3F        .db $3F
  $9DCF  3F        .db $3F
  $9DD0  00        BRK
  $9DD1  F9 05 05  SBC $0505,Y
  $9DD4  FD 01 FF  SBC $FF01,X
  $9DD7  FF        .db $FF
  $9DD8  00        BRK
  $9DD9  05 FD     ORA $FD
  $9DDB  FD FD 01  SBC $01FD,X
  $9DDE  FF        .db $FF
  $9DDF  FF        .db $FF
  $9DE0  00        BRK
  $9DE1  FF        .db $FF
  $9DE2  80        .db $80
  $9DE3  80        .db $80
  $9DE4  FF        .db $FF
  $9DE5  80        .db $80
  $9DE6  FF        .db $FF
  $9DE7  FF        .db $FF
  $9DE8  00        BRK
  $9DE9  00        BRK
  $9DEA  7F        .db $7F
  $9DEB  7F        .db $7F
  $9DEC  7F        .db $7F
  $9DED  00        BRK
  $9DEE  7F        .db $7F
  $9DEF  FF        .db $FF
  $9DF0  00        BRK
  $9DF1  E6 16     INC $16
  $9DF3  16 F6     ASL $F6,X
  $9DF5  06 FE     ASL $FE
  $9DF7  FC        .db $FC
  $9DF8  00        BRK
  $9DF9  16 F6     ASL $F6,X
  $9DFB  F6 F6     INC $F6,X
  $9DFD  06 FE     ASL $FE
  $9DFF  FC        .db $FC
  $9E00  00        BRK
  $9E01  00        BRK
  $9E02  00        BRK
  $9E03  00        BRK
  $9E04  3F        .db $3F
  $9E05  7F        .db $7F
  $9E06  60        RTS
  $9E07  69 00     ADC #$00
  $9E09  00        BRK
  $9E0A  00        BRK
  $9E0B  00        BRK
  $9E0C  00        BRK
  $9E0D  00        BRK
  $9E0E  1F        .db $1F
  $9E0F  12        .db $12
  $9E10  00        BRK
  $9E11  00        BRK
  $9E12  00        BRK
  $9E13  00        BRK
  $9E14  FF        .db $FF
  $9E15  FF        .db $FF
  $9E16  01 21     ORA ($21,X)
  $9E18  00        BRK
  $9E19  00        BRK
  $9E1A  00        BRK
  $9E1B  00        BRK
  $9E1C  00        BRK
  $9E1D  01 FD     ORA ($FD,X)
  $9E1F  4D 00 00  EOR $0000
  $9E22  00        BRK
  $9E23  00        BRK
  $9E24  FF        .db $FF
  $9E25  FF        .db $FF
  $9E26  80        .db $80
  $9E27  A4 00     LDY $00
  $9E29  00        BRK
  $9E2A  00        BRK
  $9E2B  00        BRK
  $9E2C  00        BRK
  $9E2D  00        BRK
  $9E2E  7F        .db $7F
  $9E2F  49 00     EOR #$00
  $9E31  00        BRK
  $9E32  00        BRK
  $9E33  00        BRK
  $9E34  FC        .db $FC
  $9E35  FE 06 86  INC $8606,X
  $9E38  00        BRK
  $9E39  00        BRK
  $9E3A  00        BRK
  $9E3B  00        BRK
  $9E3C  00        BRK
  $9E3D  06 F6     ASL $F6
  $9E3F  36 60     ROL $60,X
  $9E41  7F        .db $7F
  $9E42  60        RTS
  $9E43  60        RTS
  $9E44  02        .db $02
  $9E45  00        BRK
  $9E46  00        BRK
  $9E47  00        BRK
  $9E48  12        .db $12
  $9E49  1F        .db $1F
  $9E4A  00        BRK
  $9E4B  00        BRK
  $9E4C  02        .db $02
  $9E4D  00        BRK
  $9E4E  00        BRK
  $9E4F  00        BRK
  $9E50  01 FD     ORA ($FD,X)
  $9E52  00        BRK
  $9E53  00        BRK
  $9E54  5E 19 59  LSR $5919,X
  $9E57  39 4D FD  AND $FD4D,Y
  $9E5A  00        BRK
  $9E5B  00        BRK
  $9E5C  5F        .db $5F
  $9E5D  1E 5E 3E  ASL $3E5E,X
  $9E60  80        .db $80
  $9E61  FF        .db $FF
  $9E62  00        BRK
  $9E63  00        BRK
  $9E64  79 98 9A  ADC $9A98,Y
  $9E67  9C        .db $9C
  $9E68  49 7F     EOR #$7F
  $9E6A  00        BRK
  $9E6B  00        BRK
  $9E6C  F9 78 7A  SBC $7A78,Y
  $9E6F  7C        .db $7C
  $9E70  06 F6     ASL $F6
  $9E72  06 06     ASL $06
  $9E74  20 00 00  JSR $0000
  $9E77  00        BRK
  $9E78  36 F6     ROL $F6,X
  $9E7A  06 06     ASL $06
  $9E7C  20 00 00  JSR $0000
  $9E7F  00        BRK
  $9E80  00        BRK
  $9E81  1F        .db $1F
  $9E82  1F        .db $1F
  $9E83  13        .db $13
  $9E84  13        .db $13
  $9E85  1F        .db $1F
  $9E86  0F        .db $0F
  $9E87  0F        .db $0F
  $9E88  00        BRK
  $9E89  00        BRK
  $9E8A  00        BRK
  $9E8B  08        PHP
  $9E8C  00        BRK
  $9E8D  00        BRK
  $9E8E  01 0F     ORA ($0F,X)
  $9E90  00        BRK
  $9E91  00        BRK
  $9E92  08        PHP
  $9E93  04        .db $04
  $9E94  04        .db $04
  $9E95  00        BRK
  $9E96  FC        .db $FC
  $9E97  F8        SED

L_9E98:
  $9E98  00        BRK
  $9E99  60        RTS
  $9E9A  78        SEI
  $9E9B  7C        .db $7C
  $9E9C  7C        .db $7C
  $9E9D  00        BRK
  $9E9E  FC        .db $FC
  $9E9F  F8        SED

L_9EA0:
  $9EA0  00        BRK
  $9EA1  00        BRK
  $9EA2  00        BRK
  $9EA3  20 20 00  JSR $0020
  $9EA6  3F        .db $3F
  $9EA7  1F        .db $1F
  $9EA8  00        BRK
  $9EA9  06 1E     ASL $1E
  $9EAB  3E 3E 00  ROL $003E,X
  $9EAE  3F        .db $3F
  $9EAF  1F        .db $1F
  $9EB0  00        BRK
  $9EB1  F8        SED
  $9EB2  F8        SED
  $9EB3  C8        INY
  $9EB4  C8        INY
  $9EB5  F8        SED
  $9EB6  F0 E0     BEQ $9E98
  $9EB8  00        BRK
  $9EB9  F8        SED
  $9EBA  F8        SED
  $9EBB  E8        INX
  $9EBC  C8        INY
  $9EBD  F8        SED
  $9EBE  F0 E0     BEQ $9EA0
  $9EC0  00        BRK
  $9EC1  01 03     ORA ($03,X)
  $9EC3  07        .db $07

L_9EC4:
  $9EC4  0E 1C 38  ASL $381C
  $9EC7  72        .db $72
  $9EC8  00        BRK
  $9EC9  00        BRK

L_9ECA:
  $9ECA  00        BRK
  $9ECB  00        BRK
  $9ECC  01 03     ORA ($03,X)
  $9ECE  07        .db $07
  $9ECF  0C        .db $0C
  $9ED0  F0 F8     BEQ $9ECA
  $9ED2  9C        .db $9C
  $9ED3  0C        .db $0C
  $9ED4  45 00     EOR $00
  $9ED6  00        BRK
  $9ED7  00        BRK
  $9ED8  30 38     BMI $9F12
  $9EDA  7C        .db $7C
  $9EDB  FC        .db $FC
  $9EDC  9D 90 E3  STA $E390,X
  $9EDF  C6 0F     DEC $0F
  $9EE1  1F        .db $1F
  $9EE2  39 30 A2  AND $A230,Y
  $9EE5  00        BRK
  $9EE6  C0 60     CPY #$60
  $9EE8  01 03     ORA ($03,X)
  $9EEA  07        .db $07
  $9EEB  0F        .db $0F
  $9EEC  99 09 C7  STA $C709,Y
  $9EEF  63        .db $63
  $9EF0  00        BRK
  $9EF1  80        .db $80
  $9EF2  C0 E0     CPY #$E0
  $9EF4  70 38     BVS $9F2E

L_9EF6:
  $9EF6  1C        .db $1C
  $9EF7  4E 00 80  LSR $8000
  $9EFA  C0 E0     CPY #$E0
  $9EFC  F0 F8     BEQ $9EF6
  $9EFE  FC        .db $FC
  $9EFF  3E E0 C0  ROL $C0E0,X
  $9F02  90 C0     BCC $9EC4
  $9F04  60        RTS
  $9F05  30 18     BMI $9F1F
  $9F07  00        BRK
  $9F08  1C        .db $1C
  $9F09  3F        .db $3F
  $9F0A  66 24     ROR $24
  $9F0C  1C        .db $1C
  $9F0D  08        PHP
  $9F0E  00        BRK
  $9F0F  00        BRK
  $9F10  00        BRK
  $9F11  00        BRK

L_9F12:
  $9F12  02        .db $02
  $9F13  00        BRK
  $9F14  5E 99 59  LSR $5999,X
  $9F17  19 84 04  ORA $0484,Y
  $9F1A  02        .db $02
  $9F1B  00        BRK
  $9F1C  5F        .db $5F
  $9F1D  9E        .db $9E
  $9F1E  5E 1E 20  LSR $201E,X
  $9F21  20 40 00  JSR $0040
  $9F24  7A        .db $7A
  $9F25  99 9A 98  STA $989A,Y
  $9F28  21 20     AND ($20,X)
  $9F2A  40        RTI
  $9F2B  00        BRK
  $9F2C  FA        .db $FA
  $9F2D  79 7A 78  ADC $787A,Y
  $9F30  07        .db $07
  $9F31  03        .db $03
  $9F32  09 03     ORA #$03
  $9F34  06 0C     ASL $0C
  $9F36  18        CLC
  $9F37  00        BRK
  $9F38  3F        .db $3F
  $9F39  FF        .db $FF
  $9F3A  67        .db $67
  $9F3B  27        .db $27
  $9F3C  3E 1C 18  ROL $181C,X
  $9F3F  00        BRK
  $9F40  00        BRK
  $9F41  02        .db $02
  $9F42  02        .db $02
  $9F43  22        .db $22
  $9F44  02        .db $02
  $9F45  02        .db $02
  $9F46  06 7C     ASL $7C
  $9F48  00        BRK
  $9F49  FE FE CE  INC $CEFE,X
  $9F4C  CE FE FE  DEC $FEFE
  $9F4F  7C        .db $7C
  $9F50  00        BRK
  $9F51  01 01     ORA ($01,X)
  $9F53  11 01     ORA ($01),Y
  $9F55  01 03     ORA ($03,X)
  $9F57  3E 00 7F  ROL $7F00,X
  $9F5A  7F        .db $7F
  $9F5B  67        .db $67
  $9F5C  67        .db $67
  $9F5D  7F        .db $7F
  $9F5E  7F        .db $7F
  $9F5F  3E 1F 3C  ROL $3C1F,X
  $9F62  30 34     BMI $9F98
  $9F64  30 30     BMI $9F96
  $9F66  30 34     BMI $9F9C
  $9F68  00        BRK
  $9F69  03        .db $03
  $9F6A  0F        .db $0F
  $9F6B  09 09     ORA #$09
  $9F6D  0F        .db $0F
  $9F6E  0F        .db $0F
  $9F6F  09 00     ORA #$00
  $9F71  81 3C     STA ($3C,X)
  $9F73  00        BRK
  $9F74  3C        .db $3C
  $9F75  00        BRK
  $9F76  00        BRK
  $9F77  00        BRK
  $9F78  81 81     STA ($81,X)
  $9F7A  3C        .db $3C
  $9F7B  3C        .db $3C
  $9F7C  3C        .db $3C
  $9F7D  00        BRK
  $9F7E  3C        .db $3C
  $9F7F  66 30     ROR $30
  $9F81  30 30     BMI $9FB3
  $9F83  34        .db $34
  $9F84  30 30     BMI $9FB6
  $9F86  30 1F     BMI $9FA7
  $9F88  09 0F     ORA #$0F
  $9F8A  0F        .db $0F
  $9F8B  09 09     ORA #$09
  $9F8D  0F        .db $0F
  $9F8E  20 1F 00  JSR $001F
  $9F91  00        BRK
  $9F92  24 00     BIT $00
  $9F94  66 5A     ROR $5A

L_9F96:
  $9F96  5A        .db $5A
  $9F97  5A        .db $5A

L_9F98:
  $9F98  42        .db $42
  $9F99  42        .db $42
  $9F9A  24 00     BIT $00

L_9F9C:
  $9F9C  7E 66 66  ROR $6666,X
  $9F9F  66 00     ROR $00
  $9FA1  00        BRK
  $9FA2  0F        .db $0F
  $9FA3  02        .db $02
  $9FA4  00        BRK
  $9FA5  00        BRK
  $9FA6  00        BRK

L_9FA7:
  $9FA7  07        .db $07
  $9FA8  00        BRK
  $9FA9  00        BRK
  $9FAA  0F        .db $0F
  $9FAB  0C        .db $0C
  $9FAC  0C        .db $0C
  $9FAD  0F        .db $0F
  $9FAE  0F        .db $0F
  $9FAF  07        .db $07
  $9FB0  00        BRK
  $9FB1  E7        .db $E7
  $9FB2  E7        .db $E7

L_9FB3:
  $9FB3  24 24     BIT $24
  $9FB5  24 66     BIT $66
  $9FB7  C3        .db $C3
  $9FB8  00        BRK
  $9FB9  E7        .db $E7
  $9FBA  E7        .db $E7
  $9FBB  E7        .db $E7
  $9FBC  E7        .db $E7
  $9FBD  E7        .db $E7
  $9FBE  E7        .db $E7
  $9FBF  C3        .db $C3
  $9FC0  3E 79 60  ROL $6079,X
  $9FC3  68        PLA
  $9FC4  60        RTS
  $9FC5  60        RTS
  $9FC6  60        RTS
  $9FC7  68        PLA
  $9FC8  01 07     ORA ($07,X)
  $9FCA  1E 12 12  ASL $1212,X
  $9FCD  1E 1E 12  ASL $121E,X
  $9FD0  00        BRK
  $9FD1  00        BRK
  $9FD2  3C        .db $3C
  $9FD3  00        BRK
  $9FD4  3C        .db $3C
  $9FD5  00        BRK
  $9FD6  00        BRK
  $9FD7  00        BRK
  $9FD8  00        BRK
  $9FD9  00        BRK
  $9FDA  3C        .db $3C
  $9FDB  3C        .db $3C
  $9FDC  3C        .db $3C
  $9FDD  00        BRK
  $9FDE  3C        .db $3C
  $9FDF  66 60     ROR $60
  $9FE1  60        RTS
  $9FE2  60        RTS
  $9FE3  68        PLA
  $9FE4  60        RTS
  $9FE5  60        RTS
  $9FE6  60        RTS
  $9FE7  3E 12 1E  ROL $1E12,X
  $9FEA  1E 12 12  ASL $1212,X
  $9FED  1E 40 3E  ASL $3E40,X
  $9FF0  00        BRK
  $9FF1  00        BRK
  $9FF2  00        BRK
  $9FF3  18        CLC
  $9FF4  24 2C     BIT $2C
  $9FF6  18        CLC
  $9FF7  00        BRK
  $9FF8  00        BRK
  $9FF9  00        BRK
  $9FFA  00        BRK
  $9FFB  18        CLC
  $9FFC  3C        .db $3C
  $9FFD  3C        .db $3C
  $9FFE  18        CLC
  $9FFF  00        BRK
  $A000  00        BRK
  $A001  00        BRK
  $A002  00        BRK
  $A003  00        BRK
  $A004  00        BRK
  $A005  00        BRK
  $A006  FD FA 00  SBC $00FA,X
  $A009  00        BRK
  $A00A  00        BRK
  $A00B  00        BRK
  $A00C  00        BRK
  $A00D  00        BRK
  $A00E  FD FB 00  SBC $00FB,X
  $A011  0A        ASL
  $A012  FF        .db $FF
  $A013  FF        .db $FF
  $A014  FF        .db $FF
  $A015  14        .db $14
  $A016  E0 FF     CPX #$FF
  $A018  01 FE     ORA ($FE,X)
  $A01A  FF        .db $FF
  $A01B  FF        .db $FF
  $A01C  FF        .db $FF
  $A01D  1F        .db $1F
  $A01E  E0 FF     CPX #$FF
  $A020  00        BRK
  $A021  00        BRK
  $A022  00        BRK
  $A023  00        BRK
  $A024  00        BRK
  $A025  9F        .db $9F
  $A026  7F        .db $7F
  $A027  FF        .db $FF
  $A028  00        BRK

L_A029:
  $A029  00        BRK
  $A02A  00        BRK
  $A02B  00        BRK
  $A02C  00        BRK
  $A02D  FF        .db $FF
  $A02E  FF        .db $FF
  $A02F  FF        .db $FF
  $A030  F8        SED
  $A031  00        BRK
  $A032  CC E1 D5  CPY $D5E1
  $A035  20 0F DF  JSR $DF0F
  $A038  FF        .db $FF
  $A039  00        BRK
  $A03A  EF        .db $EF
  $A03B  F7        .db $F7
  $A03C  F7        .db $F7
  $A03D  E0 0F     CPX #$0F
  $A03F  DF        .db $DF
  $A040  80        .db $80
  $A041  43        .db $43
  $A042  BF        .db $BF
  $A043  BF        .db $BF
  $A044  5D 80 FD  EOR $FD80,X
  $A047  FA        .db $FA
  $A048  80        .db $80
  $A049  7F        .db $7F
  $A04A  FF        .db $FF
  $A04B  FF        .db $FF
  $A04C  7F        .db $7F
  $A04D  80        .db $80
  $A04E  FD FB 00  SBC $00FB,X
  $A051  0A        ASL
  $A052  FF        .db $FF
  $A053  FF        .db $FF
  $A054  FF        .db $FF
  $A055  14        .db $14
  $A056  E0 FF     CPX #$FF
  $A058  01 FE     ORA ($FE,X)
  $A05A  FF        .db $FF
  $A05B  FF        .db $FF
  $A05C  FF        .db $FF
  $A05D  1F        .db $1F
  $A05E  E0 FF     CPX #$FF
  $A060  CF        .db $CF
  $A061  01 FA     ORA ($FA,X)
  $A063  F8        SED
  $A064  40        RTI
  $A065  01 3F     ORA ($3F,X)
  $A067  FF        .db $FF
  $A068  DF        .db $DF
  $A069  01 FE     ORA ($FE,X)
  $A06B  FE FC 01  INC $01FC,X
  $A06E  FF        .db $FF
  $A06F  FF        .db $FF
  $A070  FF        .db $FF
  $A071  00        BRK
  $A072  CC E1 95  CPY $95E1
  $A075  20 01 CF  JSR $CF01
  $A078  FF        .db $FF
  $A079  00        BRK
  $A07A  EF        .db $EF
  $A07B  F7        .db $F7
  $A07C  F7        .db $F7
  $A07D  E0 0F     CPX #$0F
  $A07F  DF        .db $DF
  $A080  81 46     STA ($46,X)
  $A082  BD BD FD  LDA $FDBD,X
  $A085  50 A2     BVC $A029
  $A087  C1 81     CMP ($81,X)
  $A089  7E FF FF  ROR $FFFF,X
  $A08C  FF        .db $FF
  $A08D  7C        .db $7C
  $A08E  BB        .db $BB
  $A08F  C3        .db $C3
  $A090  BB        .db $BB
  $A091  4C 5F BE  JMP $BE5F
  $A094  3C        .db $3C
  $A095  3C        .db $3C
  $A096  48        PHA
  $A097  80        .db $80
  $A098  BB        .db $BB
  $A099  7C        .db $7C
  $A09A  7F        .db $7F
  $A09B  FF        .db $FF
  $A09C  7F        .db $7F
  $A09D  7F        .db $7F
  $A09E  7E 9C BE  ROR $BE9C,X
  $A0A1  3E 38 01  ROL $0138,X
  $A0A4  4D 3E BE  EOR $BE3E
  $A0A7  BC BF 7F  LDY $7FBF,X
  $A0AA  3E 01 7D  ROL $7D01,X
  $A0AD  7E BE BE  ROR $BEBE,X
  $A0B0  3C        .db $3C
  $A0B1  58        CLI
  $A0B2  01 01     ORA ($01,X)
  $A0B4  06 3F     ASL $3F
  $A0B6  3F        .db $3F
  $A0B7  BF        .db $BF
  $A0B8  BE 7E 3D  LDX $3D7E,Y
  $A0BB  01 3E     ORA ($3E,X)
  $A0BD  7F        .db $7F
  $A0BE  7F        .db $7F
  $A0BF  BF        .db $BF
  $A0C0  00        BRK
  $A0C1  00        BRK
  $A0C2  00        BRK
  $A0C3  00        BRK
  $A0C4  00        BRK
  $A0C5  C0 F8     CPY #$F8
  $A0C7  F8        SED
  $A0C8  00        BRK
  $A0C9  00        BRK
  $A0CA  00        BRK
  $A0CB  03        .db $03
  $A0CC  03        .db $03
  $A0CD  C3        .db $C3
  $A0CE  FB        .db $FB
  $A0CF  FB        .db $FB
  $A0D0  00        BRK
  $A0D1  08        PHP
  $A0D2  F8        SED
  $A0D3  F8        SED
  $A0D4  F8        SED
  $A0D5  F8        SED
  $A0D6  00        BRK
  $A0D7  F8        SED
  $A0D8  03        .db $03
  $A0D9  FB        .db $FB
  $A0DA  FB        .db $FB
  $A0DB  FB        .db $FB
  $A0DC  FB        .db $FB
  $A0DD  FB        .db $FB
  $A0DE  03        .db $03
  $A0DF  FB        .db $FB
  $A0E0  00        BRK
  $A0E1  00        BRK
  $A0E2  00        BRK
  $A0E3  C0 C0     CPY #$C0
  $A0E5  C7        .db $C7
  $A0E6  C3        .db $C3
  $A0E7  CF        .db $CF
  $A0E8  00        BRK
  $A0E9  00        BRK
  $A0EA  00        BRK
  $A0EB  C0 C0     CPY #$C0
  $A0ED  C7        .db $C7
  $A0EE  CF        .db $CF
  $A0EF  CF        .db $CF
  $A0F0  CF        .db $CF
  $A0F1  C0 CC     CPY #$CC
  $A0F3  C1 C5     CMP ($C5,X)
  $A0F5  C3        .db $C3
  $A0F6  CC CF CF  CPY $CFCF
  $A0F9  C0 CF     CPY #$CF
  $A0FB  C7        .db $C7
  $A0FC  C7        .db $C7
  $A0FD  C3        .db $C3
  $A0FE  CC CF 80  CPY $80CF
  $A101  40        RTI
  $A102  B8        CLV
  $A103  B8        CLV
  $A104  58        CLI
  $A105  80        .db $80
  $A106  F8        SED
  $A107  F8        SED
  $A108  83        .db $83
  $A109  7B        .db $7B
  $A10A  FB        .db $FB
  $A10B  FB        .db $FB
  $A10C  7B        .db $7B
  $A10D  83        .db $83
  $A10E  FB        .db $FB
  $A10F  FB        .db $FB
  $A110  00        BRK
  $A111  08        PHP
  $A112  F8        SED
  $A113  F8        SED
  $A114  F8        SED
  $A115  F8        SED
  $A116  00        BRK
  $A117  F8        SED
  $A118  03        .db $03
  $A119  FB        .db $FB
  $A11A  FB        .db $FB
  $A11B  FB        .db $FB
  $A11C  FB        .db $FB
  $A11D  FB        .db $FB
  $A11E  03        .db $03
  $A11F  FB        .db $FB
  $A120  C1 CE     CMP ($CE,X)
  $A122  CA        DEX
  $A123  C2        .db $C2
  $A124  CC C1 C3  CPY $C3C1
  $A127  CF        .db $CF
  $A128  C1 CE     CMP ($CE,X)
  $A12A  CE CE CC  DEC $CCCE
  $A12D  C1 CF     CMP ($CF,X)
  $A12F  CF        .db $CF
  $A130  CF        .db $CF
  $A131  C0 CC     CPY #$CC
  $A133  C1 C5     CMP ($C5,X)
  $A135  C3        .db $C3
  $A136  CC CF CF  CPY $CFCF
  $A139  C0 CF     CPY #$CF
  $A13B  C7        .db $C7
  $A13C  C7        .db $C7
  $A13D  C3        .db $C3
  $A13E  CC CF 00  CPY $00CF
  $A141  00        BRK
  $A142  00        BRK
  $A143  00        BRK
  $A144  00        BRK
  $A145  C0 00     CPY #$00
  $A147  55 00     EOR $00,X
  $A149  00        BRK
  $A14A  00        BRK
  $A14B  00        BRK
  $A14C  00        BRK
  $A14D  C0 FF     CPY #$FF
  $A14F  FF        .db $FF
  $A150  FF        .db $FF
  $A151  AA        TAX
  $A152  00        BRK
  $A153  00        BRK
  $A154  FF        .db $FF
  $A155  F8        SED
  $A156  00        BRK
  $A157  FF        .db $FF
  $A158  FF        .db $FF
  $A159  AA        TAX
  $A15A  00        BRK
  $A15B  00        BRK
  $A15C  FF        .db $FF
  $A15D  FF        .db $FF
  $A15E  00        BRK
  $A15F  FF        .db $FF
  $A160  00        BRK
  $A161  00        BRK
  $A162  00        BRK
  $A163  00        BRK
  $A164  00        BRK
  $A165  07        .db $07
  $A166  00        BRK
  $A167  55 00     EOR $00,X
  $A169  00        BRK
  $A16A  00        BRK
  $A16B  00        BRK
  $A16C  00        BRK
  $A16D  07        .db $07
  $A16E  FF        .db $FF
  $A16F  FF        .db $FF
  $A170  FF        .db $FF
  $A171  AA        TAX
  $A172  00        BRK
  $A173  00        BRK
  $A174  95 23     STA $23,X
  $A176  0C        .db $0C
  $A177  EF        .db $EF
  $A178  FF        .db $FF
  $A179  AA        TAX
  $A17A  00        BRK
  $A17B  00        BRK
  $A17C  F7        .db $F7
  $A17D  E3        .db $E3
  $A17E  0C        .db $0C
  $A17F  EF        .db $EF
  $A180  80        .db $80
  $A181  40        RTI
  $A182  BF        .db $BF
  $A183  BF        .db $BF
  $A184  5F        .db $5F
  $A185  80        .db $80
  $A186  00        BRK
  $A187  AA        TAX
  $A188  80        .db $80
  $A189  7F        .db $7F
  $A18A  FF        .db $FF
  $A18B  FF        .db $FF
  $A18C  7F        .db $7F
  $A18D  80        .db $80
  $A18E  FF        .db $FF
  $A18F  FF        .db $FF
  $A190  FF        .db $FF
  $A191  AA        TAX
  $A192  00        BRK
  $A193  00        BRK
  $A194  FF        .db $FF
  $A195  F8        SED
  $A196  00        BRK
  $A197  FF        .db $FF
  $A198  FF        .db $FF
  $A199  AA        TAX
  $A19A  00        BRK
  $A19B  00        BRK
  $A19C  FF        .db $FF
  $A19D  FF        .db $FF
  $A19E  00        BRK
  $A19F  FF        .db $FF
  $A1A0  01 FE     ORA ($FE,X)
  $A1A2  FA        .db $FA
  $A1A3  F2        .db $F2
  $A1A4  8C 01 00  STY $0001
  $A1A7  AA        TAX
  $A1A8  01 FE     ORA ($FE,X)
  $A1AA  FE FE FC  INC $FCFE,X
  $A1AD  01 FF     ORA ($FF,X)
  $A1AF  FF        .db $FF
  $A1B0  FF        .db $FF
  $A1B1  AA        TAX
  $A1B2  00        BRK
  $A1B3  00        BRK
  $A1B4  95 23     STA $23,X
  $A1B6  0C        .db $0C
  $A1B7  EF        .db $EF
  $A1B8  FF        .db $FF
  $A1B9  AA        TAX
  $A1BA  00        BRK
  $A1BB  00        BRK
  $A1BC  F7        .db $F7
  $A1BD  E3        .db $E3
  $A1BE  0C        .db $0C
  $A1BF  EF        .db $EF
  $A1C0  00        BRK
  $A1C1  3F        .db $3F
  $A1C2  7F        .db $7F
  $A1C3  7F        .db $7F
  $A1C4  7C        .db $7C
  $A1C5  78        SEI
  $A1C6  78        SEI
  $A1C7  70 00     BVS $A1C9

L_A1C9:
  $A1C9  3F        .db $3F
  $A1CA  71 67     ADC ($67),Y
  $A1CC  6F        .db $6F
  $A1CD  7F        .db $7F
  $A1CE  6F        .db $6F
  $A1CF  7F        .db $7F
  $A1D0  7F        .db $7F
  $A1D1  42        .db $42
  $A1D2  44        .db $44
  $A1D3  7E 41 71  ROR $7141,X
  $A1D6  3F        .db $3F
  $A1D7  00        BRK
  $A1D8  7F        .db $7F
  $A1D9  7F        .db $7F
  $A1DA  7F        .db $7F
  $A1DB  7F        .db $7F
  $A1DC  7F        .db $7F
  $A1DD  7E 3F 00  ROR $003F,X
  $A1E0  00        BRK
  $A1E1  FC        .db $FC
  $A1E2  C6 FA     DEC $FA
  $A1E4  06 02     ASL $02
  $A1E6  02        .db $02
  $A1E7  02        .db $02
  $A1E8  00        BRK
  $A1E9  FC        .db $FC
  $A1EA  7E FE FE  ROR $FEFE,X
  $A1ED  FE FE FE  INC $FEFE,X
  $A1F0  FE 02 06  INC $0602,X
  $A1F3  0E FE 7E  ASL $7EFE
  $A1F6  FC        .db $FC
  $A1F7  A0 FA     LDY #$FA
  $A1F9  FE FA F2  INC $F2FA,X
  $A1FC  F6 8E     INC $8E,X
  $A1FE  FC        .db $FC
  $A1FF  A0 00     LDY #$00
  $A201  3F        .db $3F
  $A202  7F        .db $7F
  $A203  7F        .db $7F
  $A204  7F        .db $7F
  $A205  7E 78 78  ROR $7878,X
  $A208  00        BRK
  $A209  3F        .db $3F
  $A20A  70 63     BVS $A26F
  $A20C  67        .db $67
  $A20D  6F        .db $6F
  $A20E  6F        .db $6F
  $A20F  6F        .db $6F
  $A210  7F        .db $7F
  $A211  7A        .db $7A
  $A212  7C        .db $7C
  $A213  7E 79 68  ROR $6879,X
  $A216  68        PLA
  $A217  68        PLA
  $A218  6F        .db $6F
  $A219  6F        .db $6F
  $A21A  7F        .db $7F
  $A21B  7F        .db $7F
  $A21C  6F        .db $6F
  $A21D  7F        .db $7F
  $A21E  7F        .db $7F
  $A21F  7F        .db $7F
  $A220  02        .db $02
  $A221  FF        .db $FF
  $A222  FF        .db $FF
  $A223  FE FF 01  INC $01FF,X
  $A226  01 03     ORA ($03,X)
  $A228  02        .db $02
  $A229  FF        .db $FF
  $A22A  37        .db $37
  $A22B  FF        .db $FF
  $A22C  FF        .db $FF
  $A22D  FF        .db $FF
  $A22E  FF        .db $FF
  $A22F  FF        .db $FF
  $A230  FE 00 00  INC $0000,X
  $A233  00        BRK
  $A234  FF        .db $FF
  $A235  13        .db $13
  $A236  0D 0E FF  ORA $FF0E
  $A239  FF        .db $FF
  $A23A  FF        .db $FF
  $A23B  FF        .db $FF
  $A23C  FF        .db $FF
  $A23D  FC        .db $FC
  $A23E  FB        .db $FB
  $A23F  FA        .db $FA
  $A240  00        BRK
  $A241  FF        .db $FF
  $A242  FF        .db $FF
  $A243  FF        .db $FF
  $A244  00        BRK
  $A245  00        BRK
  $A246  00        BRK
  $A247  80        .db $80
  $A248  00        BRK
  $A249  FF        .db $FF
  $A24A  F4        .db $F4
  $A24B  FF        .db $FF
  $A24C  FF        .db $FF
  $A24D  FF        .db $FF
  $A24E  FF        .db $FF
  $A24F  FF        .db $FF
  $A250  7F        .db $7F
  $A251  02        .db $02
  $A252  04        .db $04
  $A253  FE 01 80  INC $8001,X
  $A256  C0 60     CPY #$60
  $A258  FF        .db $FF
  $A259  FF        .db $FF
  $A25A  FF        .db $FF
  $A25B  FF        .db $FF
  $A25C  FF        .db $FF
  $A25D  FF        .db $FF
  $A25E  FF        .db $FF
  $A25F  7F        .db $7F
  $A260  00        BRK
  $A261  FC        .db $FC
  $A262  FE FE 4E  INC $4EFE,X
  $A265  16 06     ASL $06,X
  $A267  06 00     ASL $00
  $A269  FC        .db $FC
  $A26A  0E F6 FA  ASL $FAF6
  $A26D  FA        .db $FA
  $A26E  FE FE FE  INC $FEFE,X
  $A271  16 06     ASL $06,X
  $A273  06 FE     ASL $FE
  $A275  16 0E     ASL $0E,X
  $A277  0E FA FE  ASL $FEFA
  $A27A  FA        .db $FA
  $A27B  FA        .db $FA
  $A27C  FE FA FA  INC $FAFA,X
  $A27F  FA        .db $FA
  $A280  00        BRK
  $A281  3F        .db $3F
  $A282  7F        .db $7F
  $A283  7F        .db $7F
  $A284  7F        .db $7F
  $A285  7C        .db $7C
  $A286  78        SEI
  $A287  78        SEI
  $A288  00        BRK
  $A289  3F        .db $3F
  $A28A  70 63     BVS $A2EF
  $A28C  67        .db $67
  $A28D  6F        .db $6F
  $A28E  6F        .db $6F
  $A28F  6F        .db $6F
  $A290  77        .db $77
  $A291  72        .db $72
  $A292  54        .db $54
  $A293  7E 41 70  ROR $7041,X
  $A296  3F        .db $3F
  $A297  00        BRK
  $A298  7F        .db $7F
  $A299  6F        .db $6F
  $A29A  7F        .db $7F
  $A29B  7F        .db $7F
  $A29C  7F        .db $7F
  $A29D  7F        .db $7F
  $A29E  3F        .db $3F
  $A29F  00        BRK
  $A2A0  00        BRK
  $A2A1  FF        .db $FF
  $A2A2  FF        .db $FF
  $A2A3  FE 01 01  INC $0101,X
  $A2A6  01 03     ORA ($03,X)
  $A2A8  00        BRK
  $A2A9  FF        .db $FF
  $A2AA  6F        .db $6F
  $A2AB  FF        .db $FF
  $A2AC  FF        .db $FF
  $A2AD  FF        .db $FF
  $A2AE  FF        .db $FF
  $A2AF  FF        .db $FF
  $A2B0  FC        .db $FC
  $A2B1  00        BRK
  $A2B2  00        BRK
  $A2B3  00        BRK
  $A2B4  FF        .db $FF
  $A2B5  36 FF     ROL $FF,X
  $A2B7  00        BRK
  $A2B8  FF        .db $FF
  $A2B9  FF        .db $FF
  $A2BA  FF        .db $FF
  $A2BB  FF        .db $FF
  $A2BC  FF        .db $FF
  $A2BD  D9 FF 00  CMP $00FF,Y
  $A2C0  00        BRK
  $A2C1  FF        .db $FF
  $A2C2  FF        .db $FF
  $A2C3  7F        .db $7F
  $A2C4  80        .db $80
  $A2C5  00        BRK
  $A2C6  00        BRK
  $A2C7  80        .db $80
  $A2C8  00        BRK
  $A2C9  FF        .db $FF
  $A2CA  87        .db $87
  $A2CB  FF        .db $FF
  $A2CC  FF        .db $FF
  $A2CD  FF        .db $FF
  $A2CE  FF        .db $FF
  $A2CF  FF        .db $FF
  $A2D0  7F        .db $7F
  $A2D1  02        .db $02
  $A2D2  04        .db $04
  $A2D3  FE 01 33  INC $3301,X
  $A2D6  FF        .db $FF
  $A2D7  00        BRK
  $A2D8  FF        .db $FF
  $A2D9  FF        .db $FF
  $A2DA  FF        .db $FF
  $A2DB  FF        .db $FF
  $A2DC  FF        .db $FF
  $A2DD  CC FF 00  CPY $00FF
  $A2E0  00        BRK
  $A2E1  FF        .db $FF
  $A2E2  FF        .db $FF
  $A2E3  F3        .db $F3
  $A2E4  01 01     ORA ($01,X)
  $A2E6  01 03     ORA ($03,X)
  $A2E8  00        BRK
  $A2E9  FF        .db $FF
  $A2EA  BF        .db $BF
  $A2EB  FF        .db $FF
  $A2EC  FF        .db $FF
  $A2ED  FF        .db $FF
  $A2EE  FF        .db $FF

L_A2EF:
  $A2EF  FF        .db $FF
  $A2F0  FE 00 00  INC $0000,X
  $A2F3  00        BRK
  $A2F4  FF        .db $FF
  $A2F5  F7        .db $F7
  $A2F6  FF        .db $FF
  $A2F7  00        BRK
  $A2F8  FF        .db $FF
  $A2F9  FF        .db $FF
  $A2FA  FF        .db $FF
  $A2FB  FF        .db $FF
  $A2FC  FF        .db $FF
  $A2FD  18        CLC
  $A2FE  FF        .db $FF
  $A2FF  00        BRK
  $A300  00        BRK
  $A301  FF        .db $FF
  $A302  E0 7F     CPX #$7F
  $A304  80        .db $80
  $A305  00        BRK
  $A306  00        BRK
  $A307  80        .db $80
  $A308  00        BRK
  $A309  FF        .db $FF
  $A30A  FF        .db $FF
  $A30B  FF        .db $FF
  $A30C  FF        .db $FF
  $A30D  FF        .db $FF
  $A30E  FF        .db $FF
  $A30F  FF        .db $FF
  $A310  7F        .db $7F
  $A311  02        .db $02
  $A312  04        .db $04
  $A313  FE 01 7F  INC $7F01,X
  $A316  FF        .db $FF
  $A317  00        BRK
  $A318  FF        .db $FF
  $A319  FF        .db $FF
  $A31A  FF        .db $FF
  $A31B  FF        .db $FF
  $A31C  FF        .db $FF
  $A31D  80        .db $80
  $A31E  FF        .db $FF
  $A31F  00        BRK
  $A320  00        BRK
  $A321  FC        .db $FC
  $A322  86 E2     STX $E2
  $A324  06 02     ASL $02
  $A326  06 06     ASL $06
  $A328  00        BRK
  $A329  FC        .db $FC
  $A32A  FE FE FA  INC $FAFE,X
  $A32D  FE FA FA  INC $FAFA,X
  $A330  F6 0E     INC $0E,X
  $A332  0E 1A 7A  ASL $7A1A
  $A335  EE FC 00  INC $00FC
  $A338  FA        .db $FA
  $A339  F2        .db $F2
  $A33A  F2        .db $F2
  $A33B  E6 86     INC $86
  $A33D  1E FC 00  ASL $00FC,X
  $A340  00        BRK
  $A341  00        BRK
  $A342  00        BRK
  $A343  00        BRK
  $A344  00        BRK
  $A345  00        BRK
  $A346  00        BRK
  $A347  00        BRK
  $A348  00        BRK
  $A349  00        BRK
  $A34A  00        BRK
  $A34B  00        BRK
  $A34C  00        BRK
  $A34D  00        BRK
  $A34E  00        BRK
  $A34F  00        BRK
  $A350  00        BRK
  $A351  FB        .db $FB
  $A352  F7        .db $F7
  $A353  F7        .db $F7
  $A354  F7        .db $F7
  $A355  F7        .db $F7
  $A356  04        .db $04
  $A357  FF        .db $FF
  $A358  00        BRK
  $A359  08        PHP
  $A35A  0C        .db $0C
  $A35B  0C        .db $0C
  $A35C  0C        .db $0C
  $A35D  0C        .db $0C
  $A35E  FF        .db $FF
  $A35F  FF        .db $FF
  $A360  00        BRK
  $A361  00        BRK
  $A362  00        BRK
  $A363  00        BRK
  $A364  00        BRK
  $A365  00        BRK
  $A366  00        BRK
  $A367  00        BRK
  $A368  00        BRK
  $A369  00        BRK
  $A36A  00        BRK
  $A36B  00        BRK
  $A36C  00        BRK
  $A36D  00        BRK
  $A36E  00        BRK
  $A36F  00        BRK
  $A370  00        BRK
  $A371  FF        .db $FF
  $A372  FE FE FE  INC $FEFE,X
  $A375  FE 00 FF  INC $FF00,X
  $A378  00        BRK
  $A379  01 01     ORA ($01,X)
  $A37B  01 01     ORA ($01,X)
  $A37D  01 FF     ORA ($FF,X)
  $A37F  FF        .db $FF
  $A380  FF        .db $FF
  $A381  FF        .db $FF
  $A382  FF        .db $FF
  $A383  FF        .db $FF
  $A384  FF        .db $FF
  $A385  FF        .db $FF
  $A386  80        .db $80
  $A387  FF        .db $FF
  $A388  80        .db $80
  $A389  80        .db $80
  $A38A  80        .db $80
  $A38B  80        .db $80
  $A38C  80        .db $80
  $A38D  80        .db $80
  $A38E  FF        .db $FF
  $A38F  FF        .db $FF
  $A390  F7        .db $F7
  $A391  F7        .db $F7
  $A392  F7        .db $F7
  $A393  F7        .db $F7
  $A394  F7        .db $F7
  $A395  F7        .db $F7
  $A396  04        .db $04
  $A397  FF        .db $FF
  $A398  0C        .db $0C
  $A399  0C        .db $0C
  $A39A  0C        .db $0C
  $A39B  0C        .db $0C
  $A39C  0C        .db $0C
  $A39D  0C        .db $0C
  $A39E  FF        .db $FF
  $A39F  FF        .db $FF
  $A3A0  FF        .db $FF
  $A3A1  FF        .db $FF
  $A3A2  FF        .db $FF
  $A3A3  FF        .db $FF
  $A3A4  FF        .db $FF
  $A3A5  FF        .db $FF
  $A3A6  00        BRK
  $A3A7  FF        .db $FF
  $A3A8  00        BRK
  $A3A9  00        BRK
  $A3AA  00        BRK
  $A3AB  00        BRK
  $A3AC  00        BRK
  $A3AD  00        BRK
  $A3AE  FF        .db $FF
  $A3AF  FF        .db $FF
  $A3B0  FE FE FE  INC $FEFE,X
  $A3B3  FE FE FE  INC $FEFE,X
  $A3B6  00        BRK
  $A3B7  FF        .db $FF
  $A3B8  01 01     ORA ($01,X)
  $A3BA  01 01     ORA ($01,X)
  $A3BC  01 01     ORA ($01,X)
  $A3BE  FF        .db $FF
  $A3BF  FF        .db $FF
  $A3C0  F7        .db $F7
  $A3C1  F7        .db $F7
  $A3C2  F7        .db $F7
  $A3C3  F7        .db $F7
  $A3C4  F7        .db $F7
  $A3C5  F7        .db $F7
  $A3C6  04        .db $04
  $A3C7  FF        .db $FF
  $A3C8  0C        .db $0C
  $A3C9  0C        .db $0C
  $A3CA  0C        .db $0C
  $A3CB  0C        .db $0C
  $A3CC  0C        .db $0C
  $A3CD  0C        .db $0C
  $A3CE  FF        .db $FF
  $A3CF  FF        .db $FF
  $A3D0  FF        .db $FF
  $A3D1  FF        .db $FF
  $A3D2  FF        .db $FF
  $A3D3  FF        .db $FF
  $A3D4  FF        .db $FF
  $A3D5  FF        .db $FF
  $A3D6  80        .db $80
  $A3D7  FF        .db $FF
  $A3D8  80        .db $80
  $A3D9  80        .db $80
  $A3DA  80        .db $80
  $A3DB  80        .db $80
  $A3DC  80        .db $80
  $A3DD  80        .db $80
  $A3DE  FF        .db $FF
  $A3DF  FF        .db $FF
  $A3E0  FE FE FE  INC $FEFE,X
  $A3E3  FE FE FE  INC $FEFE,X
  $A3E6  00        BRK
  $A3E7  FF        .db $FF
  $A3E8  01 01     ORA ($01,X)
  $A3EA  01 01     ORA ($01,X)
  $A3EC  01 01     ORA ($01,X)
  $A3EE  FF        .db $FF
  $A3EF  FF        .db $FF
  $A3F0  FF        .db $FF
  $A3F1  FF        .db $FF
  $A3F2  FF        .db $FF
  $A3F3  FF        .db $FF
  $A3F4  FF        .db $FF
  $A3F5  FF        .db $FF
  $A3F6  00        BRK
  $A3F7  FF        .db $FF
  $A3F8  00        BRK
  $A3F9  00        BRK
  $A3FA  00        BRK
  $A3FB  00        BRK
  $A3FC  00        BRK
  $A3FD  00        BRK
  $A3FE  FF        .db $FF
  $A3FF  FF        .db $FF
  $A400  60        RTS
  $A401  7F        .db $7F
  $A402  60        RTS
  $A403  7F        .db $7F
  $A404  60        RTS
  $A405  60        RTS
  $A406  60        RTS
  $A407  60        RTS
  $A408  7F        .db $7F
  $A409  7F        .db $7F
  $A40A  7F        .db $7F
  $A40B  7F        .db $7F
  $A40C  7F        .db $7F
  $A40D  7F        .db $7F
  $A40E  7F        .db $7F
  $A40F  7F        .db $7F
  $A410  7F        .db $7F
  $A411  62        .db $62
  $A412  6C 7E 71  JMP ($717E)
  $A415  3F        .db $3F
  $A416  1F        .db $1F
  $A417  00        BRK
  $A418  7F        .db $7F
  $A419  7F        .db $7F
  $A41A  7F        .db $7F
  $A41B  7F        .db $7F
  $A41C  7F        .db $7F
  $A41D  3F        .db $3F
  $A41E  1F        .db $1F
  $A41F  00        BRK
  $A420  07        .db $07
  $A421  F3        .db $F3
  $A422  11 FE     ORA ($FE),Y
  $A424  01 01     ORA ($01,X)
  $A426  01 03     ORA ($03,X)
  $A428  FF        .db $FF
  $A429  FF        .db $FF
  $A42A  FF        .db $FF
  $A42B  FF        .db $FF
  $A42C  FF        .db $FF
  $A42D  FF        .db $FF
  $A42E  FF        .db $FF
  $A42F  FF        .db $FF
  $A430  FE 00 00  INC $0000,X
  $A433  FF        .db $FF
  $A434  80        .db $80
  $A435  FF        .db $FF
  $A436  FF        .db $FF
  $A437  00        BRK
  $A438  FF        .db $FF
  $A439  FF        .db $FF
  $A43A  FF        .db $FF
  $A43B  FF        .db $FF
  $A43C  FF        .db $FF
  $A43D  FF        .db $FF
  $A43E  FF        .db $FF
  $A43F  00        BRK
  $A440  68        PLA
  $A441  FF        .db $FF
  $A442  D0 7F     BNE $A4C3
  $A444  C0 00     CPY #$00
  $A446  00        BRK
  $A447  80        .db $80
  $A448  7F        .db $7F
  $A449  FF        .db $FF
  $A44A  FF        .db $FF
  $A44B  FF        .db $FF
  $A44C  FF        .db $FF
  $A44D  FF        .db $FF
  $A44E  FF        .db $FF
  $A44F  FF        .db $FF
  $A450  7F        .db $7F
  $A451  02        .db $02
  $A452  04        .db $04
  $A453  FE 00 FF  INC $FF00,X
  $A456  FF        .db $FF
  $A457  00        BRK
  $A458  FF        .db $FF
  $A459  FF        .db $FF
  $A45A  FF        .db $FF
  $A45B  FF        .db $FF
  $A45C  FF        .db $FF
  $A45D  00        BRK
  $A45E  FF        .db $FF
  $A45F  00        BRK
  $A460  0E F6 16  ASL $16F6
  $A463  F6 06     INC $06,X
  $A465  06 06     ASL $06
  $A467  06 FE     ASL $FE
  $A469  FA        .db $FA
  $A46A  FE FA FA  INC $FAFA,X
  $A46D  FE FA FA  INC $FAFA,X
  $A470  FE 0E 1E  INC $1E0E,X
  $A473  3E FE DC  ROL $DCFE,X
  $A476  F8        SED
  $A477  00        BRK
  $A478  F2        .db $F2
  $A479  F2        .db $F2
  $A47A  E6 C6     INC $C6
  $A47C  0E 3C F8  ASL $F83C
  $A47F  00        BRK
  $A480  00        BRK
  $A481  3F        .db $3F
  $A482  7F        .db $7F
  $A483  7F        .db $7F
  $A484  7E 7C 78  ROR $787C,X
  $A487  78        SEI
  $A488  00        BRK
  $A489  3F        .db $3F
  $A48A  70 63     BVS $A4EF
  $A48C  47        .db $47
  $A48D  4F        .db $4F
  $A48E  5F        .db $5F
  $A48F  5F        .db $5F
  $A490  7B        .db $7B
  $A491  7A        .db $7A
  $A492  74        .db $74
  $A493  7E 71 40  ROR $4071,X
  $A496  60        RTS
  $A497  40        RTI
  $A498  5F        .db $5F
  $A499  5F        .db $5F
  $A49A  7F        .db $7F
  $A49B  5F        .db $5F
  $A49C  7F        .db $7F
  $A49D  7F        .db $7F
  $A49E  5F        .db $5F
  $A49F  7F        .db $7F
  $A4A0  00        BRK
  $A4A1  F8        SED
  $A4A2  DC        .db $DC
  $A4A3  BE 06 02  LDX $0206,Y
  $A4A6  02        .db $02
  $A4A7  02        .db $02
  $A4A8  00        BRK
  $A4A9  F8        SED
  $A4AA  BC FE FE  LDY $FEFE,X
  $A4AD  FE FE FE  INC $FEFE,X
  $A4B0  FE 02 06  INC $0602,X
  $A4B3  02        .db $02
  $A4B4  FE 16 0E  INC $0E16,X
  $A4B7  0A        ASL
  $A4B8  FE FE FA  INC $FAFE,X
  $A4BB  FE FE FA  INC $FAFE,X
  $A4BE  FA        .db $FA
  $A4BF  FE 60 7F  INC $7F60,X
  $A4C2  60        RTS

L_A4C3:
  $A4C3  7F        .db $7F
  $A4C4  60        RTS
  $A4C5  60        RTS
  $A4C6  60        RTS
  $A4C7  60        RTS
  $A4C8  7F        .db $7F
  $A4C9  7F        .db $7F
  $A4CA  7F        .db $7F
  $A4CB  7F        .db $7F
  $A4CC  7F        .db $7F
  $A4CD  7F        .db $7F
  $A4CE  7F        .db $7F
  $A4CF  7F        .db $7F
  $A4D0  7F        .db $7F
  $A4D1  62        .db $62
  $A4D2  64        .db $64
  $A4D3  7E 61 60  ROR $6061,X
  $A4D6  60        RTS
  $A4D7  60        RTS
  $A4D8  7F        .db $7F
  $A4D9  7F        .db $7F
  $A4DA  7F        .db $7F
  $A4DB  7F        .db $7F
  $A4DC  7F        .db $7F
  $A4DD  7F        .db $7F
  $A4DE  7F        .db $7F
  $A4DF  7F        .db $7F
  $A4E0  1E F6 06  ASL $06F6,X
  $A4E3  FE 06 06  INC $0606,X
  $A4E6  06 06     ASL $06
  $A4E8  FE FE FE  INC $FEFE,X
  $A4EB  FE FE FE  INC $FEFE,X
  $A4EE  FE FA FE  INC $FEFA,X
  $A4F1  06 06     ASL $06
  $A4F3  06 FE     ASL $FE
  $A4F5  06 06     ASL $06
  $A4F7  06 FA     ASL $FA
  $A4F9  FA        .db $FA
  $A4FA  FE FE FE  INC $FEFE,X
  $A4FD  FA        .db $FA
  $A4FE  FE FA 60  INC $60FA,X
  $A501  7F        .db $7F
  $A502  40        RTI
  $A503  7F        .db $7F
  $A504  60        RTS
  $A505  40        RTI
  $A506  40        RTI
  $A507  60        RTS
  $A508  7F        .db $7F
  $A509  7F        .db $7F
  $A50A  7F        .db $7F
  $A50B  7F        .db $7F
  $A50C  7F        .db $7F
  $A50D  7F        .db $7F
  $A50E  7F        .db $7F
  $A50F  7F        .db $7F
  $A510  7F        .db $7F
  $A511  42        .db $42
  $A512  44        .db $44
  $A513  7E 61 7B  ROR $7B61,X
  $A516  3F        .db $3F
  $A517  00        BRK
  $A518  7F        .db $7F
  $A519  7F        .db $7F
  $A51A  7F        .db $7F
  $A51B  7F        .db $7F
  $A51C  7F        .db $7F
  $A51D  74        .db $74
  $A51E  3F        .db $3F
  $A51F  00        BRK
  $A520  1E F6 16  ASL $16F6,X
  $A523  FE 06 06  INC $0606,X
  $A526  06 06     ASL $06
  $A528  FE FA FA  INC $FAFA,X
  $A52B  FA        .db $FA
  $A52C  FA        .db $FA
  $A52D  FA        .db $FA
  $A52E  FA        .db $FA
  $A52F  FA        .db $FA
  $A530  F6 0E     INC $0E,X
  $A532  0E 1A FA  ASL $FA1A
  $A535  EE FC 00  INC $00FC
  $A538  FA        .db $FA
  $A539  F2        .db $F2
  $A53A  F2        .db $F2
  $A53B  E6 C6     INC $C6
  $A53D  1E FC 00  ASL $00FC,X
  $A540  00        BRK
  $A541  00        BRK
  $A542  00        BRK
  $A543  00        BRK
  $A544  00        BRK
  $A545  00        BRK
  $A546  00        BRK
  $A547  00        BRK
  $A548  00        BRK
  $A549  00        BRK
  $A54A  00        BRK
  $A54B  00        BRK
  $A54C  00        BRK
  $A54D  00        BRK
  $A54E  00        BRK
  $A54F  00        BRK
  $A550  00        BRK
  $A551  7F        .db $7F
  $A552  FF        .db $FF
  $A553  FF        .db $FF
  $A554  FF        .db $FF
  $A555  FF        .db $FF
  $A556  80        .db $80
  $A557  FF        .db $FF
  $A558  00        BRK
  $A559  00        BRK
  $A55A  80        .db $80
  $A55B  80        .db $80
  $A55C  80        .db $80
  $A55D  80        .db $80
  $A55E  FF        .db $FF
  $A55F  FF        .db $FF
  $A560  00        BRK
  $A561  00        BRK
  $A562  00        BRK
  $A563  00        BRK
  $A564  00        BRK
  $A565  00        BRK
  $A566  00        BRK
  $A567  00        BRK
  $A568  00        BRK
  $A569  00        BRK
  $A56A  00        BRK
  $A56B  00        BRK
  $A56C  00        BRK
  $A56D  00        BRK
  $A56E  00        BRK
  $A56F  00        BRK
  $A570  00        BRK
  $A571  FF        .db $FF
  $A572  FF        .db $FF
  $A573  FF        .db $FF
  $A574  FF        .db $FF
  $A575  FF        .db $FF
  $A576  00        BRK
  $A577  FF        .db $FF
  $A578  00        BRK
  $A579  00        BRK
  $A57A  00        BRK
  $A57B  00        BRK
  $A57C  00        BRK
  $A57D  00        BRK
  $A57E  FF        .db $FF
  $A57F  FF        .db $FF
  $A580  00        BRK
  $A581  00        BRK
  $A582  00        BRK
  $A583  00        BRK
  $A584  00        BRK
  $A585  00        BRK
  $A586  00        BRK
  $A587  00        BRK
  $A588  00        BRK
  $A589  00        BRK
  $A58A  00        BRK
  $A58B  00        BRK
  $A58C  00        BRK
  $A58D  00        BRK
  $A58E  00        BRK
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
  $A5A0  00        BRK
  $A5A1  00        BRK
  $A5A2  00        BRK
  $A5A3  00        BRK
  $A5A4  00        BRK
  $A5A5  00        BRK
  $A5A6  00        BRK
  $A5A7  00        BRK
  $A5A8  00        BRK
  $A5A9  00        BRK
  $A5AA  00        BRK
  $A5AB  00        BRK
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
  $A5C0  00        BRK
  $A5C1  00        BRK
  $A5C2  00        BRK
  $A5C3  00        BRK
  $A5C4  00        BRK
  $A5C5  00        BRK
  $A5C6  00        BRK
  $A5C7  00        BRK
  $A5C8  00        BRK
  $A5C9  00        BRK
  $A5CA  00        BRK
  $A5CB  00        BRK
  $A5CC  00        BRK
  $A5CD  00        BRK
  $A5CE  00        BRK
  $A5CF  00        BRK
  $A5D0  00        BRK
  $A5D1  00        BRK
  $A5D2  00        BRK
  $A5D3  00        BRK
  $A5D4  00        BRK
  $A5D5  00        BRK
  $A5D6  00        BRK
  $A5D7  00        BRK
  $A5D8  00        BRK
  $A5D9  00        BRK
  $A5DA  00        BRK
  $A5DB  00        BRK
  $A5DC  00        BRK
  $A5DD  00        BRK
  $A5DE  00        BRK
  $A5DF  00        BRK
  $A5E0  00        BRK
  $A5E1  00        BRK
  $A5E2  00        BRK
  $A5E3  00        BRK
  $A5E4  00        BRK
  $A5E5  00        BRK
  $A5E6  00        BRK
  $A5E7  00        BRK
  $A5E8  00        BRK
  $A5E9  00        BRK
  $A5EA  00        BRK
  $A5EB  00        BRK
  $A5EC  00        BRK
  $A5ED  00        BRK
  $A5EE  00        BRK
  $A5EF  00        BRK
  $A5F0  00        BRK
  $A5F1  00        BRK
  $A5F2  00        BRK
  $A5F3  00        BRK
  $A5F4  00        BRK
  $A5F5  00        BRK
  $A5F6  00        BRK
  $A5F7  00        BRK
  $A5F8  00        BRK
  $A5F9  00        BRK
  $A5FA  00        BRK
  $A5FB  00        BRK
  $A5FC  00        BRK
  $A5FD  00        BRK
  $A5FE  00        BRK
  $A5FF  00        BRK
  $A600  00        BRK
  $A601  00        BRK
  $A602  00        BRK
  $A603  00        BRK
  $A604  00        BRK
  $A605  00        BRK
  $A606  00        BRK
  $A607  00        BRK
  $A608  00        BRK
  $A609  00        BRK
  $A60A  00        BRK
  $A60B  00        BRK
  $A60C  00        BRK
  $A60D  00        BRK
  $A60E  00        BRK
  $A60F  00        BRK
  $A610  00        BRK
  $A611  00        BRK
  $A612  00        BRK
  $A613  00        BRK
  $A614  00        BRK
  $A615  00        BRK
  $A616  00        BRK
  $A617  00        BRK
  $A618  00        BRK
  $A619  00        BRK
  $A61A  00        BRK
  $A61B  00        BRK
  $A61C  00        BRK
  $A61D  00        BRK
  $A61E  00        BRK
  $A61F  00        BRK
  $A620  00        BRK
  $A621  00        BRK
  $A622  00        BRK
  $A623  00        BRK
  $A624  00        BRK
  $A625  00        BRK
  $A626  00        BRK
  $A627  00        BRK
  $A628  00        BRK
  $A629  00        BRK
  $A62A  00        BRK
  $A62B  00        BRK
  $A62C  00        BRK
  $A62D  00        BRK
  $A62E  00        BRK
  $A62F  00        BRK
  $A630  00        BRK
  $A631  00        BRK
  $A632  00        BRK
  $A633  00        BRK
  $A634  00        BRK
  $A635  00        BRK
  $A636  00        BRK
  $A637  00        BRK
  $A638  00        BRK
  $A639  00        BRK
  $A63A  00        BRK
  $A63B  00        BRK
  $A63C  00        BRK
  $A63D  00        BRK
  $A63E  00        BRK
  $A63F  00        BRK
  $A640  00        BRK
  $A641  00        BRK
  $A642  00        BRK
  $A643  00        BRK
  $A644  00        BRK
  $A645  00        BRK
  $A646  00        BRK
  $A647  00        BRK
  $A648  00        BRK
  $A649  00        BRK
  $A64A  00        BRK
  $A64B  00        BRK
  $A64C  00        BRK
  $A64D  00        BRK
  $A64E  00        BRK
  $A64F  00        BRK
  $A650  00        BRK
  $A651  00        BRK
  $A652  00        BRK
  $A653  00        BRK
  $A654  00        BRK
  $A655  00        BRK
  $A656  00        BRK
  $A657  00        BRK
  $A658  00        BRK
  $A659  00        BRK
  $A65A  00        BRK
  $A65B  00        BRK
  $A65C  00        BRK
  $A65D  00        BRK
  $A65E  00        BRK
  $A65F  00        BRK
  $A660  00        BRK
  $A661  00        BRK
  $A662  00        BRK
  $A663  00        BRK
  $A664  00        BRK
  $A665  00        BRK
  $A666  00        BRK
  $A667  00        BRK
  $A668  00        BRK
  $A669  00        BRK
  $A66A  00        BRK
  $A66B  00        BRK
  $A66C  00        BRK
  $A66D  00        BRK
  $A66E  00        BRK
  $A66F  00        BRK
  $A670  00        BRK
  $A671  00        BRK
  $A672  00        BRK
  $A673  00        BRK
  $A674  00        BRK
  $A675  00        BRK
  $A676  00        BRK
  $A677  00        BRK
  $A678  00        BRK
  $A679  00        BRK
  $A67A  00        BRK
  $A67B  00        BRK
  $A67C  00        BRK
  $A67D  00        BRK
  $A67E  00        BRK
  $A67F  00        BRK
  $A680  00        BRK
  $A681  00        BRK
  $A682  00        BRK
  $A683  00        BRK
  $A684  00        BRK
  $A685  00        BRK
  $A686  00        BRK
  $A687  00        BRK
  $A688  00        BRK
  $A689  00        BRK
  $A68A  00        BRK
  $A68B  00        BRK
  $A68C  00        BRK
  $A68D  00        BRK
  $A68E  00        BRK
  $A68F  00        BRK
  $A690  00        BRK
  $A691  00        BRK
  $A692  00        BRK
  $A693  00        BRK
  $A694  00        BRK
  $A695  00        BRK
  $A696  00        BRK
  $A697  00        BRK
  $A698  00        BRK
  $A699  00        BRK
  $A69A  00        BRK
  $A69B  00        BRK
  $A69C  00        BRK
  $A69D  00        BRK
  $A69E  00        BRK
  $A69F  00        BRK
  $A6A0  00        BRK
  $A6A1  00        BRK
  $A6A2  00        BRK
  $A6A3  00        BRK
  $A6A4  00        BRK
  $A6A5  00        BRK
  $A6A6  00        BRK
  $A6A7  00        BRK
  $A6A8  00        BRK
  $A6A9  00        BRK
  $A6AA  00        BRK
  $A6AB  00        BRK
  $A6AC  00        BRK
  $A6AD  00        BRK
  $A6AE  00        BRK
  $A6AF  00        BRK
  $A6B0  00        BRK
  $A6B1  00        BRK
  $A6B2  00        BRK
  $A6B3  00        BRK
  $A6B4  00        BRK
  $A6B5  00        BRK
  $A6B6  00        BRK
  $A6B7  00        BRK
  $A6B8  00        BRK
  $A6B9  00        BRK
  $A6BA  00        BRK
  $A6BB  00        BRK
  $A6BC  00        BRK
  $A6BD  00        BRK
  $A6BE  00        BRK
  $A6BF  00        BRK
  $A6C0  00        BRK
  $A6C1  00        BRK
  $A6C2  00        BRK
  $A6C3  00        BRK
  $A6C4  00        BRK
  $A6C5  00        BRK
  $A6C6  00        BRK
  $A6C7  00        BRK
  $A6C8  00        BRK
  $A6C9  00        BRK
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
  $A6D4  00        BRK
  $A6D5  00        BRK
  $A6D6  00        BRK
  $A6D7  00        BRK
  $A6D8  00        BRK
  $A6D9  00        BRK
  $A6DA  00        BRK
  $A6DB  00        BRK
  $A6DC  00        BRK
  $A6DD  00        BRK
  $A6DE  00        BRK
  $A6DF  00        BRK
  $A6E0  00        BRK
  $A6E1  00        BRK
  $A6E2  00        BRK
  $A6E3  00        BRK
  $A6E4  00        BRK
  $A6E5  00        BRK
  $A6E6  00        BRK
  $A6E7  00        BRK
  $A6E8  00        BRK
  $A6E9  00        BRK
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
  $A6F4  00        BRK
  $A6F5  00        BRK
  $A6F6  00        BRK
  $A6F7  00        BRK
  $A6F8  00        BRK
  $A6F9  00        BRK
  $A6FA  00        BRK
  $A6FB  00        BRK
  $A6FC  00        BRK
  $A6FD  00        BRK
  $A6FE  00        BRK
  $A6FF  00        BRK
  $A700  00        BRK
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
  $A70B  00        BRK
  $A70C  00        BRK
  $A70D  00        BRK
  $A70E  00        BRK
  $A70F  00        BRK
  $A710  00        BRK
  $A711  00        BRK
  $A712  00        BRK
  $A713  00        BRK
  $A714  00        BRK
  $A715  00        BRK
  $A716  00        BRK
  $A717  00        BRK
  $A718  00        BRK
  $A719  00        BRK
  $A71A  00        BRK
  $A71B  00        BRK
  $A71C  00        BRK
  $A71D  00        BRK
  $A71E  00        BRK
  $A71F  00        BRK
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
  $A730  00        BRK
  $A731  00        BRK
  $A732  00        BRK
  $A733  00        BRK
  $A734  00        BRK
  $A735  00        BRK
  $A736  00        BRK
  $A737  00        BRK
  $A738  00        BRK
  $A739  00        BRK
  $A73A  00        BRK
  $A73B  00        BRK
  $A73C  00        BRK
  $A73D  00        BRK
  $A73E  00        BRK
  $A73F  00        BRK
  $A740  00        BRK
  $A741  00        BRK
  $A742  00        BRK
  $A743  00        BRK
  $A744  00        BRK
  $A745  00        BRK
  $A746  00        BRK
  $A747  00        BRK
  $A748  00        BRK
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
  $A760  00        BRK
  $A761  00        BRK
  $A762  00        BRK
  $A763  00        BRK
  $A764  00        BRK
  $A765  00        BRK
  $A766  00        BRK
  $A767  00        BRK
  $A768  00        BRK
  $A769  00        BRK
  $A76A  00        BRK
  $A76B  00        BRK
  $A76C  00        BRK
  $A76D  00        BRK
  $A76E  00        BRK
  $A76F  00        BRK
  $A770  00        BRK
  $A771  00        BRK
  $A772  00        BRK
  $A773  00        BRK
  $A774  00        BRK
  $A775  00        BRK
  $A776  00        BRK
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
  $A781  00        BRK
  $A782  00        BRK
  $A783  00        BRK
  $A784  00        BRK
  $A785  00        BRK
  $A786  00        BRK
  $A787  00        BRK
  $A788  00        BRK
  $A789  00        BRK
  $A78A  00        BRK
  $A78B  00        BRK
  $A78C  00        BRK
  $A78D  00        BRK
  $A78E  00        BRK
  $A78F  00        BRK
  $A790  00        BRK
  $A791  00        BRK
  $A792  00        BRK
  $A793  00        BRK
  $A794  00        BRK
  $A795  00        BRK
  $A796  00        BRK
  $A797  00        BRK
  $A798  00        BRK
  $A799  00        BRK
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
  $A7A6  00        BRK
  $A7A7  00        BRK
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
  $A7C0  00        BRK
  $A7C1  00        BRK
  $A7C2  00        BRK
  $A7C3  00        BRK
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
  $A7D1  00        BRK
  $A7D2  00        BRK
  $A7D3  00        BRK
  $A7D4  00        BRK
  $A7D5  00        BRK
  $A7D6  00        BRK
  $A7D7  00        BRK
  $A7D8  00        BRK
  $A7D9  00        BRK
  $A7DA  00        BRK
  $A7DB  00        BRK
  $A7DC  00        BRK
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
  $A7E8  00        BRK
  $A7E9  00        BRK
  $A7EA  00        BRK
  $A7EB  00        BRK
  $A7EC  00        BRK
  $A7ED  00        BRK
  $A7EE  00        BRK
  $A7EF  00        BRK
  $A7F0  00        BRK
  $A7F1  00        BRK
  $A7F2  00        BRK
  $A7F3  00        BRK
  $A7F4  00        BRK
  $A7F5  00        BRK
  $A7F6  00        BRK
  $A7F7  00        BRK
  $A7F8  00        BRK
  $A7F9  00        BRK
  $A7FA  00        BRK
  $A7FB  00        BRK
  $A7FC  00        BRK
  $A7FD  00        BRK
  $A7FE  00        BRK
  $A7FF  00        BRK
  $A800  00        BRK
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

L_A9E6:
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
  $AA00  A6 70     LDX $70
  $AA02  7F        .db $7F
  $AA03  7F        .db $7F
  $AA04  3F        .db $3F
  $AA05  7F        .db $7F
  $AA06  7F        .db $7F
  $AA07  3F        .db $3F
  $AA08  40        RTI
  $AA09  30 3F     BMI $AA4A
  $AA0B  3F        .db $3F
  $AA0C  1C        .db $1C
  $AA0D  23        .db $23
  $AA0E  36 02     ROL $02,X
  $AA10  6C FE F9  JMP ($F9FE)
  $AA13  F1 FA     SBC ($FA),Y
  $AA15  FE FC F8  INC $F8FC,X
  $AA18  70 CC     BVS $A9E6

L_AA1A:
  $AA1A  BE 6E DC  LDX $DC6E,Y
  $AA1D  3C        .db $3C
  $AA1E  D8        CLD
  $AA1F  F0 03     BEQ $AA24
  $AA21  03        .db $03
  $AA22  01 00     ORA ($00,X)

L_AA24:
  $AA24  00        BRK
  $AA25  00        BRK
  $AA26  00        BRK
  $AA27  00        BRK
  $AA28  00        BRK
  $AA29  00        BRK
  $AA2A  00        BRK
  $AA2B  00        BRK
  $AA2C  00        BRK
  $AA2D  00        BRK
  $AA2E  00        BRK
  $AA2F  00        BRK
  $AA30  FC        .db $FC
  $AA31  F8        SED
  $AA32  FC        .db $FC
  $AA33  FA        .db $FA
  $AA34  41 71     EOR ($71,X)
  $AA36  82        .db $82
  $AA37  FC        .db $FC
  $AA38  18        CLC
  $AA39  00        BRK
  $AA3A  60        RTS
  $AA3B  7C        .db $7C
  $AA3C  3E 0E 7C  ROL $7C0E,X
  $AA3F  00        BRK
  $AA40  3F        .db $3F
  $AA41  29 1C     AND #$1C
  $AA43  1F        .db $1F
  $AA44  3F        .db $3F
  $AA45  7F        .db $7F
  $AA46  7E 3C 02  ROR $023C,X
  $AA49  10 0C     BPL $AA57
  $AA4B  07        .db $07
  $AA4C  18        CLC
  $AA4D  3E 3F 1F  ROL $1F3F,X
  $AA50  92        .db $92
  $AA51  9B        .db $9B
  $AA52  3D FF FF  AND $FFFF,X
  $AA55  1F        .db $1F

L_AA56:
  $AA56  0F        .db $0F

L_AA57:
  $AA57  1F        .db $1F
  $AA58  1C        .db $1C
  $AA59  1C        .db $1C
  $AA5A  03        .db $03
  $AA5B  B9 7D FE  LDA $FE7D,Y
  $AA5E  FE EE 00  INC $00EE,X
  $AA61  00        BRK
  $AA62  C0 E0     CPY #$E0
  $AA64  F0 F0     BEQ $AA56
  $AA66  F0 E0     BEQ $AA48
  $AA68  00        BRK
  $AA69  00        BRK
  $AA6A  00        BRK
  $AA6B  C0 E0     CPY #$E0
  $AA6D  E0 E0     CPX #$E0
  $AA6F  00        BRK
  $AA70  1E 0F 0F  ASL $0F0F,X
  $AA73  1F        .db $1F
  $AA74  13        .db $13
  $AA75  38        SEC
  $AA76  40        RTI
  $AA77  7F        .db $7F
  $AA78  07        .db $07
  $AA79  00        BRK
  $AA7A  04        .db $04
  $AA7B  0E 0F 07  ASL $070F
  $AA7E  3F        .db $3F
  $AA7F  00        BRK
  $AA80  7F        .db $7F
  $AA81  FF        .db $FF
  $AA82  FF        .db $FF
  $AA83  FF        .db $FF
  $AA84  87        .db $87
  $AA85  83        .db $83
  $AA86  40        RTI
  $AA87  C0 9C     CPY #$9C
  $AA89  30 00     BMI $AA8B

L_AA8B:
  $AA8B  00        BRK
  $AA8C  01 00     ORA ($00,X)
  $AA8E  80        .db $80
  $AA8F  00        BRK
  $AA90  90 88     BCC $AA1A
  $AA92  C4 E4     CPY $E4
  $AA94  F8        SED
  $AA95  80        .db $80
  $AA96  00        BRK
  $AA97  00        BRK
  $AA98  60        RTS
  $AA99  F0 F8     BEQ $AA93
  $AA9B  D8        CLD
  $AA9C  80        .db $80
  $AA9D  00        BRK
  $AA9E  00        BRK
  $AA9F  00        BRK
  $AAA0  07        .db $07
  $AAA1  1A        .db $1A
  $AAA2  28        PLP
  $AAA3  20 43 85  JSR $8543
  $AAA6  C8        INY
  $AAA7  8D 00 05  STA $0500
  $AAAA  17        .db $17
  $AAAB  1F        .db $1F
  $AAAC  3C        .db $3C
  $AAAD  7A        .db $7A
  $AAAE  37        .db $37
  $AAAF  72        .db $72
  $AAB0  E0 58     CPX #$58
  $AAB2  14        .db $14
  $AAB3  02        .db $02
  $AAB4  C6 A1     DEC $A1
  $AAB6  13        .db $13
  $AAB7  B1 00     LDA ($00),Y
  $AAB9  A0 E8     LDY #$E8
  $AABB  FC        .db $FC

L_AABC:
  $AABC  38        SEC
  $AABD  5E EC 4E  LSR $4EEC,X
  $AAC0  02        .db $02
  $AAC1  0D 14 30  ORA $3014
  $AAC4  53        .db $53
  $AAC5  46 8E     LSR $8E
  $AAC7  49 00     EOR #$00
  $AAC9  02        .db $02
  $AACA  0B        .db $0B
  $AACB  0F        .db $0F
  $AACC  2C 39 71  BIT $7139
  $AACF  36 40     ROL $40,X
  $AAD1  B0 08     BCS $AADB
  $AAD3  1C        .db $1C
  $AAD4  C2        .db $C2
  $AAD5  66 71     ROR $71
  $AAD7  92        .db $92
  $AAD8  00        BRK
  $AAD9  40        RTI
  $AADA  F0 E0     BEQ $AABC
  $AADC  3C        .db $3C
  $AADD  98        TYA
  $AADE  8E 6C 00  STX $006C
  $AAE1  00        BRK
  $AAE2  00        BRK
  $AAE3  00        BRK
  $AAE4  00        BRK
  $AAE5  00        BRK
  $AAE6  00        BRK
  $AAE7  00        BRK
  $AAE8  00        BRK
  $AAE9  00        BRK
  $AAEA  00        BRK
  $AAEB  00        BRK
  $AAEC  00        BRK
  $AAED  00        BRK
  $AAEE  00        BRK
  $AAEF  00        BRK
  $AAF0  00        BRK
  $AAF1  00        BRK
  $AAF2  00        BRK
  $AAF3  00        BRK
  $AAF4  00        BRK
  $AAF5  00        BRK
  $AAF6  00        BRK
  $AAF7  00        BRK
  $AAF8  00        BRK
  $AAF9  00        BRK
  $AAFA  00        BRK
  $AAFB  00        BRK
  $AAFC  00        BRK
  $AAFD  00        BRK
  $AAFE  00        BRK
  $AAFF  00        BRK
  $AB00  00        BRK
  $AB01  00        BRK
  $AB02  00        BRK
  $AB03  00        BRK
  $AB04  00        BRK
  $AB05  03        .db $03
  $AB06  07        .db $07
  $AB07  0F        .db $0F
  $AB08  00        BRK
  $AB09  00        BRK
  $AB0A  00        BRK
  $AB0B  00        BRK
  $AB0C  00        BRK
  $AB0D  00        BRK
  $AB0E  03        .db $03
  $AB0F  07        .db $07
  $AB10  00        BRK
  $AB11  00        BRK
  $AB12  07        .db $07
  $AB13  1F        .db $1F
  $AB14  39 F9 E7  AND $E7F9,Y
  $AB17  EF        .db $EF
  $AB18  00        BRK
  $AB19  00        BRK
  $AB1A  00        BRK
  $AB1B  07        .db $07
  $AB1C  1A        .db $1A
  $AB1D  1E A7 E2  ASL $E2A7,X
  $AB20  00        BRK
  $AB21  00        BRK
  $AB22  E1 FF     SBC ($FF,X)
  $AB24  FF        .db $FF
  $AB25  9F        .db $9F
  $AB26  1F        .db $1F
  $AB27  9F        .db $9F
  $AB28  00        BRK
  $AB29  00        BRK
  $AB2A  00        BRK
  $AB2B  E1 FB     SBC ($FB,X)
  $AB2D  9F        .db $9F
  $AB2E  1F        .db $1F

L_AB2F:
  $AB2F  1F        .db $1F
  $AB30  00        BRK
  $AB31  00        BRK
  $AB32  E0 F0     CPX #$F0
  $AB34  F8        SED
  $AB35  F0 F8     BEQ $AB2F
  $AB37  F8        SED
  $AB38  00        BRK
  $AB39  00        BRK
  $AB3A  00        BRK
  $AB3B  E0 F0     CPX #$F0
  $AB3D  E0 E0     CPX #$E0
  $AB3F  C0 0F     CPY #$0F
  $AB41  0F        .db $0F
  $AB42  1F        .db $1F
  $AB43  3F        .db $3F
  $AB44  3F        .db $3F
  $AB45  7F        .db $7F
  $AB46  7D CD 07  ADC $07CD,X
  $AB49  07        .db $07
  $AB4A  03        .db $03
  $AB4B  03        .db $03
  $AB4C  01 00     ORA ($00,X)
  $AB4E  30 78     BMI $ABC8
  $AB50  ED F2 F8  SBC $F8F2
  $AB53  F7        .db $F7
  $AB54  EC EC DF  CPX $DFEC
  $AB57  DD E0 B2  CMP $B2E0,X
  $AB5A  DF        .db $DF
  $AB5B  78        SEI
  $AB5C  B3        .db $B3
  $AB5D  F3        .db $F3
  $AB5E  E0 E3     CPX #$E3
  $AB60  BF        .db $BF
  $AB61  7F        .db $7F
  $AB62  3F        .db $3F
  $AB63  CF        .db $CF
  $AB64  F7        .db $F7
  $AB65  F7        .db $F7
  $AB66  FB        .db $FB
  $AB67  FB        .db $FB
  $AB68  3B        .db $3B
  $AB69  77        .db $77
  $AB6A  FD 3B 0F  SBC $0F3B,X
  $AB6D  0F        .db $0F

L_AB6E:
  $AB6E  07        .db $07
  $AB6F  07        .db $07
  $AB70  FC        .db $FC
  $AB71  FC        .db $FC
  $AB72  FE FA D1  INC $D1FA,X
  $AB75  D1 A1     CMP ($A1),Y
  $AB77  B1 C0     LDA ($C0),Y
  $AB79  80        .db $80
  $AB7A  80        .db $80
  $AB7B  84 8E     STY $8E
  $AB7D  8E 1E 0E  STX $0E1E
  $AB80  FC        .db $FC
  $AB81  B4 84     LDY $84,X
  $AB83  84 B4     STY $B4
  $AB85  FC        .db $FC
  $AB86  FC        .db $FC
  $AB87  78        SEI
  $AB88  30 48     BMI $ABD2
  $AB8A  78        SEI
  $AB8B  78        SEI
  $AB8C  48        PHA
  $AB8D  30 00     BMI $AB8F

L_AB8F:
  $AB8F  00        BRK
  $AB90  DB        .db $DB
  $AB91  EB        .db $EB
  $AB92  6F        .db $6F
  $AB93  37        .db $37
  $AB94  18        CLC
  $AB95  1F        .db $1F
  $AB96  3F        .db $3F
  $AB97  7F        .db $7F
  $AB98  67        .db $67
  $AB99  74        .db $74
  $AB9A  30 18     BMI $ABB4
  $AB9C  0F        .db $0F
  $AB9D  03        .db $03
  $AB9E  00        BRK
  $AB9F  00        BRK
  $ABA0  9B        .db $9B
  $ABA1  97        .db $97
  $ABA2  F6 CE     INC $CE,X
  $ABA4  3F        .db $3F
  $ABA5  FF        .db $FF
  $ABA6  FF        .db $FF
  $ABA7  FF        .db $FF
  $ABA8  66 6E     ROR $6E
  $ABAA  0C        .db $0C
  $ABAB  38        SEC
  $ABAC  F0 C0     BEQ $AB6E
  $ABAE  00        BRK
  $ABAF  00        BRK
  $ABB0  42        .db $42
  $ABB1  82        .db $82
  $ABB2  84 84     STY $84

L_ABB4:
  $ABB4  44        .db $44
  $ABB5  38        SEC
  $ABB6  80        .db $80
  $ABB7  C0 3C     CPY #$3C
  $ABB9  7C        .db $7C
  $ABBA  78        SEI
  $ABBB  78        SEI
  $ABBC  38        SEC
  $ABBD  00        BRK
  $ABBE  00        BRK
  $ABBF  00        BRK
  $ABC0  00        BRK
  $ABC1  00        BRK
  $ABC2  00        BRK
  $ABC3  00        BRK
  $ABC4  01 02     ORA ($02,X)
  $ABC6  04        .db $04
  $ABC7  07        .db $07

L_ABC8:
  $ABC8  00        BRK
  $ABC9  00        BRK
  $ABCA  00        BRK
  $ABCB  00        BRK
  $ABCC  00        BRK
  $ABCD  01 03     ORA ($03,X)
  $ABCF  00        BRK
  $ABD0  7C        .db $7C
  $ABD1  D8        CLD

L_ABD2:
  $ABD2  88        DEY
  $ABD3  84 84     STY $84
  $ABD5  04        .db $04
  $ABD6  02        .db $02
  $ABD7  FE 00 20  INC $2000,X
  $ABDA  70 78     BVS $AC54
  $ABDC  78        SEI
  $ABDD  F8        SED
  $ABDE  FC        .db $FC
  $ABDF  00        BRK
  $ABE0  0F        .db $0F
  $ABE1  03        .db $03
  $ABE2  02        .db $02
  $ABE3  02        .db $02
  $ABE4  02        .db $02
  $ABE5  01 02     ORA ($02,X)
  $ABE7  03        .db $03
  $ABE8  00        BRK
  $ABE9  00        BRK
  $ABEA  01 01     ORA ($01,X)
  $ABEC  01 00     ORA ($00,X)
  $ABEE  01 00     ORA ($00,X)
  $ABF0  C0 20     CPY #$20
  $ABF2  10 10     BPL $AC04
  $ABF4  0C        .db $0C
  $ABF5  02        .db $02
  $ABF6  01 FF     ORA ($FF,X)
  $ABF8  00        BRK
  $ABF9  C0 E0     CPY #$E0
  $ABFB  E0 F0     CPX #$F0
  $ABFD  FC        .db $FC
  $ABFE  FE 00 00  INC $0000,X
  $AC01  00        BRK
  $AC02  00        BRK
  $AC03  00        BRK

L_AC04:
  $AC04  01 07     ORA ($07,X)
  $AC06  0E FE 00  ASL $00FE
  $AC09  00        BRK
  $AC0A  00        BRK
  $AC0B  00        BRK
  $AC0C  00        BRK
  $AC0D  01 06     ORA ($06,X)
  $AC0F  07        .db $07
  $AC10  00        BRK
  $AC11  00        BRK
  $AC12  00        BRK
  $AC13  00        BRK
  $AC14  F8        SED
  $AC15  FF        .db $FF
  $AC16  7F        .db $7F
  $AC17  67        .db $67
  $AC18  00        BRK
  $AC19  00        BRK
  $AC1A  00        BRK
  $AC1B  00        BRK
  $AC1C  00        BRK
  $AC1D  F8        SED
  $AC1E  BE A7 00  LDX $00A7,Y
  $AC21  00        BRK
  $AC22  00        BRK
  $AC23  00        BRK
  $AC24  78        SEI
  $AC25  FD FF FF  SBC $FFFF,X
  $AC28  00        BRK
  $AC29  00        BRK
  $AC2A  00        BRK
  $AC2B  00        BRK
  $AC2C  00        BRK
  $AC2D  78        SEI
  $AC2E  F8        SED
  $AC2F  F8        SED
  $AC30  00        BRK
  $AC31  00        BRK
  $AC32  00        BRK
  $AC33  00        BRK
  $AC34  00        BRK
  $AC35  E0 98     CPX #$98
  $AC37  04        .db $04
  $AC38  00        BRK
  $AC39  00        BRK
  $AC3A  00        BRK
  $AC3B  00        BRK
  $AC3C  00        BRK
  $AC3D  00        BRK
  $AC3E  60        RTS
  $AC3F  F8        SED
  $AC40  3F        .db $3F
  $AC41  7F        .db $7F
  $AC42  CF        .db $CF
  $AC43  BF        .db $BF
  $AC44  8F        .db $8F
  $AC45  87        .db $87
  $AC46  87        .db $87
  $AC47  B7        .db $B7
  $AC48  03        .db $03
  $AC49  37        .db $37
  $AC4A  77        .db $77
  $AC4B  77        .db $77
  $AC4C  73        .db $73
  $AC4D  7B        .db $7B
  $AC4E  79 48 E7  ADC $E748,Y
  $AC51  EF        .db $EF
  $AC52  ED F2 F8  SBC $F8F2
  $AC55  F7        .db $F7
  $AC56  EC EC A7  CPX $A7EC
  $AC59  E2        .db $E2
  $AC5A  E0 B2     CPX #$B2
  $AC5C  DF        .db $DF
  $AC5D  78        SEI
  $AC5E  B3        .db $B3
  $AC5F  F3        .db $F3
  $AC60  1F        .db $1F
  $AC61  9F        .db $9F
  $AC62  BF        .db $BF
  $AC63  7F        .db $7F
  $AC64  3F        .db $3F

L_AC65:
  $AC65  CF        .db $CF
  $AC66  F7        .db $F7
  $AC67  F7        .db $F7
  $AC68  1F        .db $1F
  $AC69  1F        .db $1F
  $AC6A  3B        .db $3B
  $AC6B  77        .db $77

L_AC6C:
  $AC6C  FD 3B 0F  SBC $0F3B,X
  $AC6F  0F        .db $0F
  $AC70  FD FE FE  SBC $FEFE,X
  $AC73  F1 E0     SBC ($E0),Y
  $AC75  C0 C0     CPY #$C0
  $AC77  C0 C2     CPY #$C2
  $AC79  C1 C1     CMP ($C1,X)
  $AC7B  80        .db $80
  $AC7C  80        .db $80
  $AC7D  80        .db $80
  $AC7E  80        .db $80
  $AC7F  80        .db $80

L_AC80:
  $AC80  08        PHP
  $AC81  08        PHP
  $AC82  08        PHP
  $AC83  10 E0     BPL $AC65
  $AC85  00        BRK
  $AC86  00        BRK
  $AC87  00        BRK
  $AC88  F0 F0     BEQ $AC7A
  $AC8A  F0 E0     BEQ $AC6C
  $AC8C  00        BRK
  $AC8D  00        BRK
  $AC8E  00        BRK
  $AC8F  00        BRK
  $AC90  FD FD 78  SBC $78FD,X
  $AC93  00        BRK
  $AC94  00        BRK
  $AC95  00        BRK
  $AC96  00        BRK
  $AC97  00        BRK
  $AC98  30 00     BMI $AC9A

L_AC9A:
  $AC9A  00        BRK
  $AC9B  00        BRK
  $AC9C  00        BRK
  $AC9D  00        BRK
  $AC9E  00        BRK
  $AC9F  00        BRK
  $ACA0  DF        .db $DF
  $ACA1  DD DB EB  CMP $EBDB,X
  $ACA4  6F        .db $6F
  $ACA5  37        .db $37
  $ACA6  78        SEI
  $ACA7  FF        .db $FF
  $ACA8  E0 E3     CPX #$E3
  $ACAA  67        .db $67
  $ACAB  74        .db $74
  $ACAC  30 18     BMI $ACC6
  $ACAE  0F        .db $0F
  $ACAF  03        .db $03
  $ACB0  FB        .db $FB
  $ACB1  FB        .db $FB
  $ACB2  9B        .db $9B
  $ACB3  97        .db $97
  $ACB4  F7        .db $F7
  $ACB5  CF        .db $CF
  $ACB6  3F        .db $3F
  $ACB7  FF        .db $FF
  $ACB8  07        .db $07
  $ACB9  07        .db $07
  $ACBA  66 6E     ROR $6E
  $ACBC  0C        .db $0C
  $ACBD  38        SEC
  $ACBE  F0 C0     BEQ $AC80
  $ACC0  80        .db $80
  $ACC1  80        .db $80
  $ACC2  00        BRK
  $ACC3  00        BRK
  $ACC4  00        BRK
  $ACC5  C0 F0     CPY #$F0
  $ACC7  F8        SED
  $ACC8  00        BRK
  $ACC9  00        BRK
  $ACCA  00        BRK
  $ACCB  00        BRK
  $ACCC  00        BRK

L_ACCD:
  $ACCD  00        BRK
  $ACCE  00        BRK
  $ACCF  00        BRK
  $ACD0  01 01     ORA ($01,X)
  $ACD2  01 01     ORA ($01,X)
  $ACD4  00        BRK
  $ACD5  03        .db $03
  $ACD6  04        .db $04
  $ACD7  07        .db $07
  $ACD8  00        BRK
  $ACD9  00        BRK
  $ACDA  00        BRK
  $ACDB  00        BRK
  $ACDC  00        BRK
  $ACDD  00        BRK
  $ACDE  03        .db $03
  $ACDF  00        BRK
  $ACE0  FF        .db $FF
  $ACE1  3E 08 88  ROL $8808,X
  $ACE4  C4 04     CPY $04
  $ACE6  02        .db $02
  $ACE7  FE 00 C0  INC $C000,X
  $ACEA  F0 70     BEQ $AD5C
  $ACEC  38        SEC
  $ACED  F8        SED
  $ACEE  FC        .db $FC
  $ACEF  00        BRK
  $ACF0  FF        .db $FF
  $ACF1  03        .db $03
  $ACF2  01 01     ORA ($01,X)
  $ACF4  01 02     ORA ($02,X)
  $ACF6  02        .db $02
  $ACF7  03        .db $03
  $ACF8  00        BRK
  $ACF9  00        BRK
  $ACFA  00        BRK
  $ACFB  00        BRK
  $ACFC  00        BRK
  $ACFD  01 01     ORA ($01,X)
  $ACFF  00        BRK
  $AD00  C8        INY
  $AD01  84 04     STY $04
  $AD03  08        PHP
  $AD04  38        SEC
  $AD05  06 01     ASL $01
  $AD07  FF        .db $FF
  $AD08  30 78     BMI $AD82
  $AD0A  F8        SED
  $AD0B  F0 C0     BEQ $ACCD
  $AD0D  F8        SED
  $AD0E  FE 00 E7  INC $E700,X
  $AD11  EF        .db $EF
  $AD12  ED F2 F8  SBC $F8F2
  $AD15  F7        .db $F7
  $AD16  EF        .db $EF
  $AD17  EB        .db $EB
  $AD18  A7        .db $A7
  $AD19  E2        .db $E2
  $AD1A  E0 B2     CPX #$B2
  $AD1C  DF        .db $DF
  $AD1D  78        SEI
  $AD1E  B0 F4     BCS $AD14
  $AD20  1F        .db $1F
  $AD21  9F        .db $9F
  $AD22  BF        .db $BF
  $AD23  7F        .db $7F
  $AD24  3F        .db $3F
  $AD25  CF        .db $CF
  $AD26  F7        .db $F7
  $AD27  97        .db $97
  $AD28  1F        .db $1F
  $AD29  1F        .db $1F
  $AD2A  3B        .db $3B
  $AD2B  77        .db $77
  $AD2C  FD 3B 0F  SBC $0F3B,X
  $AD2F  6F        .db $6F

L_AD30:
  $AD30  D3        .db $D3
  $AD31  DD DF EF  CMP $EFDF,X
  $AD34  6E 37 78  ROR $7837
  $AD37  FF        .db $FF
  $AD38  EC E3 63  CPX $63E3
  $AD3B  70 31     BVS $AD6E
  $AD3D  18        CLC
  $AD3E  1F        .db $1F
  $AD3F  03        .db $03

L_AD40:
  $AD40  9B        .db $9B
  $AD41  FB        .db $FB
  $AD42  FB        .db $FB
  $AD43  77        .db $77
  $AD44  77        .db $77
  $AD45  CF        .db $CF
  $AD46  3F        .db $3F
  $AD47  FF        .db $FF
  $AD48  67        .db $67
  $AD49  07        .db $07
  $AD4A  06 8E     ASL $8E
  $AD4C  8C 38 F0  STY $F038
  $AD4F  C0 FD     CPY #$FD
  $AD51  FD 78 00  SBC $0078,X
  $AD54  00        BRK
  $AD55  00        BRK
  $AD56  01 03     ORA ($03,X)
  $AD58  30 00     BMI $AD5A

L_AD5A:
  $AD5A  00        BRK
  $AD5B  00        BRK

L_AD5C:
  $AD5C  00        BRK
  $AD5D  00        BRK
  $AD5E  00        BRK
  $AD5F  00        BRK
  $AD60  DF        .db $DF
  $AD61  DD DB EB  CMP $EBDB,X
  $AD64  6F        .db $6F
  $AD65  37        .db $37
  $AD66  F8        SED
  $AD67  FF        .db $FF
  $AD68  E0 E3     CPX #$E3
  $AD6A  67        .db $67
  $AD6B  74        .db $74
  $AD6C  30 18     BMI $AD86

L_AD6E:
  $AD6E  0F        .db $0F
  $AD6F  03        .db $03
  $AD70  FB        .db $FB
  $AD71  FB        .db $FB
  $AD72  9B        .db $9B
  $AD73  97        .db $97
  $AD74  F7        .db $F7
  $AD75  CF        .db $CF
  $AD76  3F        .db $3F
  $AD77  FF        .db $FF
  $AD78  07        .db $07
  $AD79  07        .db $07
  $AD7A  66 6E     ROR $6E
  $AD7C  0C        .db $0C
  $AD7D  38        SEC
  $AD7E  F0 C0     BEQ $AD40
  $AD80  80        .db $80
  $AD81  80        .db $80

L_AD82:
  $AD82  00        BRK
  $AD83  00        BRK
  $AD84  C0 E0     CPY #$E0

L_AD86:
  $AD86  90 08     BCC $AD90
  $AD88  00        BRK
  $AD89  00        BRK
  $AD8A  00        BRK
  $AD8B  00        BRK
  $AD8C  00        BRK
  $AD8D  00        BRK
  $AD8E  60        RTS
  $AD8F  F0 9F     BEQ $AD30
  $AD91  87        .db $87
  $AD92  82        .db $82
  $AD93  82        .db $82
  $AD94  41 41     EOR ($41,X)
  $AD96  82        .db $82
  $AD97  84 60     STY $60
  $AD99  78        SEI
  $AD9A  7C        .db $7C
  $AD9B  7C        .db $7C
  $AD9C  3E 3E 7C  ROL $7C3E,X
  $AD9F  78        SEI
  $ADA0  FF        .db $FF
  $ADA1  E7        .db $E7
  $ADA2  01 01     ORA ($01,X)
  $ADA4  00        BRK
  $ADA5  00        BRK
  $ADA6  00        BRK
  $ADA7  00        BRK
  $ADA8  00        BRK
  $ADA9  00        BRK
  $ADAA  00        BRK
  $ADAB  00        BRK
  $ADAC  00        BRK
  $ADAD  00        BRK
  $ADAE  00        BRK
  $ADAF  00        BRK
  $ADB0  C1 81     CMP ($81,X)
  $ADB2  82        .db $82
  $ADB3  04        .db $04
  $ADB4  84 82     STY $82
  $ADB6  42        .db $42
  $ADB7  22        .db $22
  $ADB8  3E 7E 7C  ROL $7C7E,X
  $ADBB  F8        SED
  $ADBC  78        SEI
  $ADBD  7C        .db $7C
  $ADBE  3C        .db $3C
  $ADBF  1C        .db $1C
  $ADC0  88        DEY
  $ADC1  70 00     BVS $ADC3

L_ADC3:
  $ADC3  00        BRK
  $ADC4  00        BRK
  $ADC5  00        BRK
  $ADC6  00        BRK
  $ADC7  00        BRK
  $ADC8  70 00     BVS $ADCA

L_ADCA:
  $ADCA  00        BRK
  $ADCB  00        BRK
  $ADCC  00        BRK
  $ADCD  00        BRK
  $ADCE  00        BRK
  $ADCF  00        BRK
  $ADD0  1C        .db $1C
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
  $ADE4  01 07     ORA ($07,X)
  $ADE6  0E FE 00  ASL $00FE
  $ADE9  00        BRK
  $ADEA  00        BRK
  $ADEB  00        BRK
  $ADEC  00        BRK
  $ADED  01 06     ORA ($06,X)
  $ADEF  07        .db $07
  $ADF0  00        BRK
  $ADF1  00        BRK
  $ADF2  00        BRK
  $ADF3  00        BRK
  $ADF4  F8        SED
  $ADF5  FF        .db $FF
  $ADF6  7F        .db $7F
  $ADF7  67        .db $67
  $ADF8  00        BRK
  $ADF9  00        BRK
  $ADFA  00        BRK
  $ADFB  00        BRK
  $ADFC  00        BRK
  $ADFD  F8        SED
  $ADFE  BE A7 03  LDX $03A7,Y
  $AE01  0F        .db $0F
  $AE02  13        .db $13
  $AE03  21 41     AND ($41,X)
  $AE05  43        .db $43
  $AE06  86 9B     STX $9B
  $AE08  00        BRK
  $AE09  03        .db $03
  $AE0A  0F        .db $0F
  $AE0B  1F        .db $1F
  $AE0C  3F        .db $3F
  $AE0D  3E 78 60  ROL $6078,X
  $AE10  F0 FC     BEQ $AE0E
  $AE12  8E F7 FE  STX $FEF7
  $AE15  3C        .db $3C
  $AE16  34        .db $34

L_AE17:
  $AE17  37        .db $37
  $AE18  00        BRK
  $AE19  F0 FC     BEQ $AE17
  $AE1B  FE 30 18  INC $1830,X
  $AE1E  18        CLC
  $AE1F  18        CLC
  $AE20  00        BRK
  $AE21  E0 98     CPX #$98
  $AE23  86 47     STX $47
  $AE25  4F        .db $4F
  $AE26  3F        .db $3F
  $AE27  3F        .db $3F
  $AE28  00        BRK
  $AE29  00        BRK
  $AE2A  60        RTS
  $AE2B  78        SEI
  $AE2C  3A        .db $3A
  $AE2D  37        .db $37
  $AE2E  0F        .db $0F
  $AE2F  1F        .db $1F
  $AE30  73        .db $73
  $AE31  E0 EF     CPX #$EF
  $AE33  F0 7F     BEQ $AEB4
  $AE35  BE 9F DF  LDX $DF9F,Y
  $AE38  00        BRK
  $AE39  40        RTI
  $AE3A  40        RTI
  $AE3B  60        RTS
  $AE3C  30 5D     BMI $AE9B
  $AE3E  65 A0     ADC $A0
  $AE40  7F        .db $7F
  $AE41  7F        .db $7F
  $AE42  7E FE FE  ROR $FEFE,X
  $AE45  FF        .db $FF
  $AE46  FF        .db $FF
  $AE47  EF        .db $EF

L_AE48:
  $AE48  27        .db $27
  $AE49  2E 1D 7D  ROL $7D1D
  $AE4C  FD 78 63  SBC $6378,X
  $AE4F  16 C0     ASL $C0,X
  $AE51  C0 40     CPY #$40
  $AE53  20 E0 F0  JSR $F0E0
  $AE56  F0 F0     BEQ $AE48
  $AE58  80        .db $80
  $AE59  00        BRK
  $AE5A  80        .db $80
  $AE5B  C0 00     CPY #$00
  $AE5D  E0 E0     CPX #$E0
  $AE5F  E0 19     CPX #$19
  $AE61  0C        .db $0C
  $AE62  07        .db $07
  $AE63  01 01     ORA ($01,X)
  $AE65  07        .db $07
  $AE66  0F        .db $0F
  $AE67  0F        .db $0F
  $AE68  0F        .db $0F
  $AE69  07        .db $07
  $AE6A  00        BRK
  $AE6B  00        BRK
  $AE6C  00        BRK
  $AE6D  01 07     ORA ($07,X)
  $AE6F  00        BRK
  $AE70  F0 C0     BEQ $AE32
  $AE72  83        .db $83
  $AE73  DC        .db $DC
  $AE74  F8        SED
  $AE75  F8        SED
  $AE76  FC        .db $FC

L_AE77:
  $AE77  FC        .db $FC
  $AE78  8F        .db $8F
  $AE79  BF        .db $BF
  $AE7A  7C        .db $7C
  $AE7B  E0 F0     CPX #$F0
  $AE7D  F0 F8     BEQ $AE77
  $AE7F  00        BRK
  $AE80  1E 1D E7  ASL $E71D,X
  $AE83  23        .db $23
  $AE84  43        .db $43
  $AE85  4F        .db $4F
  $AE86  77        .db $77
  $AE87  07        .db $07
  $AE88  ED E6 1B  SBC $1BE6
  $AE8B  1D 3C 31  ORA $313C,X
  $AE8E  03        .db $03
  $AE8F  00        BRK
  $AE90  E0 E0     CPX #$E0

L_AE92:
  $AE92  C0 C0     CPY #$C0
  $AE94  F0 FC     BEQ $AE92
  $AE96  FE FE 40  INC $40FE,X
  $AE99  C0 80     CPY #$80

L_AE9B:
  $AE9B  00        BRK
  $AE9C  C0 F0     CPY #$F0
  $AE9E  FC        .db $FC
  $AE9F  00        BRK
  $AEA0  00        BRK
  $AEA1  00        BRK
  $AEA2  E0 98     CPX #$98
  $AEA4  86 47     STX $47
  $AEA6  4F        .db $4F
  $AEA7  3F        .db $3F
  $AEA8  00        BRK
  $AEA9  00        BRK
  $AEAA  00        BRK
  $AEAB  60        RTS
  $AEAC  78        SEI
  $AEAD  3A        .db $3A
  $AEAE  37        .db $37
  $AEAF  0F        .db $0F
  $AEB0  00        BRK
  $AEB1  00        BRK
  $AEB2  00        BRK
  $AEB3  00        BRK

L_AEB4:
  $AEB4  00        BRK
  $AEB5  00        BRK
  $AEB6  80        .db $80
  $AEB7  C0 00     CPY #$00
  $AEB9  00        BRK
  $AEBA  00        BRK
  $AEBB  00        BRK
  $AEBC  00        BRK
  $AEBD  00        BRK
  $AEBE  00        BRK
  $AEBF  80        .db $80
  $AEC0  3F        .db $3F
  $AEC1  19 0C 07  ORA $070C,Y
  $AEC4  01 00     ORA ($00,X)
  $AEC6  01 01     ORA ($01,X)
  $AEC8  1F        .db $1F
  $AEC9  0F        .db $0F
  $AECA  07        .db $07
  $AECB  00        BRK
  $AECC  00        BRK
  $AECD  00        BRK
  $AECE  00        BRK
  $AECF  00        BRK
  $AED0  C7        .db $C7
  $AED1  FF        .db $FF
  $AED2  A7        .db $A7
  $AED3  43        .db $43
  $AED4  83        .db $83
  $AED5  86 0C     STX $0C
  $AED7  36 80     ROL $80,X
  $AED9  87        .db $87
  $AEDA  5F        .db $5F
  $AEDB  BF        .db $BF
  $AEDC  7E 7C F0  ROR $F07C,X
  $AEDF  C0 E0     CPY #$E0
  $AEE1  F8        SED
  $AEE2  1C        .db $1C
  $AEE3  EE FC 78  INC $78FC
  $AEE6  68        PLA
  $AEE7  6C 00 E0  JMP ($E000)
  $AEEA  F8        SED
  $AEEB  FC        .db $FC
  $AEEC  60        RTS
  $AEED  30 30     BMI $AF1F
  $AEEF  30 00     BMI $AEF1

L_AEF1:
  $AEF1  00        BRK
  $AEF2  00        BRK
  $AEF3  00        BRK
  $AEF4  00        BRK
  $AEF5  00        BRK
  $AEF6  01 02     ORA ($02,X)
  $AEF8  00        BRK
  $AEF9  00        BRK
  $AEFA  00        BRK
  $AEFB  00        BRK
  $AEFC  00        BRK
  $AEFD  00        BRK
  $AEFE  00        BRK
  $AEFF  01 E6     ORA ($E6,X)
  $AF01  40        RTI
  $AF02  5E 21 1F  LSR $1F21,X
  $AF05  6F        .db $6F

L_AF06:
  $AF06  87        .db $87
  $AF07  06 00     ASL $00
  $AF09  00        BRK
  $AF0A  00        BRK
  $AF0B  00        BRK
  $AF0C  00        BRK
  $AF0D  17        .db $17
  $AF0E  7A        .db $7A
  $AF0F  FB        .db $FB
  $AF10  FC        .db $FC
  $AF11  FA        .db $FA
  $AF12  F2        .db $F2
  $AF13  F2        .db $F2
  $AF14  E2        .db $E2
  $AF15  E4 F4     CPX $F4
  $AF17  3C        .db $3C
  $AF18  48        PHA
  $AF19  54        .db $54
  $AF1A  2C EC 1C  BIT $1CEC
  $AF1D  98        TYA
  $AF1E  68        PLA

L_AF1F:
  $AF1F  F0 01     BEQ $AF22
  $AF21  00        BRK

L_AF22:
  $AF22  00        BRK
  $AF23  01 01     ORA ($01,X)
  $AF25  07        .db $07
  $AF26  0F        .db $0F
  $AF27  0F        .db $0F
  $AF28  00        BRK
  $AF29  00        BRK
  $AF2A  00        BRK
  $AF2B  00        BRK
  $AF2C  00        BRK
  $AF2D  01 07     ORA ($07,X)
  $AF2F  00        BRK
  $AF30  87        .db $87
  $AF31  6F        .db $6F
  $AF32  9F        .db $9F
  $AF33  C4 F8     CPY $F8
  $AF35  F8        SED
  $AF36  FC        .db $FC
  $AF37  FC        .db $FC
  $AF38  7A        .db $7A
  $AF39  17        .db $17
  $AF3A  60        RTS
  $AF3B  F8        SED
  $AF3C  F0 F0     BEQ $AF2E
  $AF3E  F8        SED
  $AF3F  00        BRK
  $AF40  FA        .db $FA
  $AF41  E1 E1     SBC ($E1,X)
  $AF43  1B        .db $1B
  $AF44  07        .db $07
  $AF45  03        .db $03
  $AF46  07        .db $07
  $AF47  07        .db $07
  $AF48  64        .db $64
  $AF49  9E        .db $9E
  $AF4A  1F        .db $1F
  $AF4B  07        .db $07
  $AF4C  03        .db $03
  $AF4D  01 03     ORA ($03,X)
  $AF4F  00        BRK
  $AF50  00        BRK
  $AF51  00        BRK
  $AF52  80        .db $80
  $AF53  C0 F0     CPY #$F0
  $AF55  FC        .db $FC
  $AF56  FE FE 00  INC $00FE,X
  $AF59  00        BRK
  $AF5A  00        BRK
  $AF5B  80        .db $80
  $AF5C  C0 F0     CPY #$F0
  $AF5E  FC        .db $FC
  $AF5F  00        BRK
  $AF60  04        .db $04
  $AF61  0A        ASL
  $AF62  0A        ASL
  $AF63  11 11     ORA ($11),Y
  $AF65  20 31 3F  JSR $3F31
  $AF68  00        BRK
  $AF69  04        .db $04
  $AF6A  04        .db $04
  $AF6B  0E 0E 1F  ASL $1F0E
  $AF6E  0E 11 00  ASL $0011
  $AF71  03        .db $03
  $AF72  04        .db $04
  $AF73  08        PHP
  $AF74  10 90     BPL $AF06
  $AF76  A1 A6     LDA ($A6,X)
  $AF78  00        BRK
  $AF79  00        BRK
  $AF7A  03        .db $03
  $AF7B  07        .db $07
  $AF7C  0F        .db $0F
  $AF7D  0F        .db $0F
  $AF7E  1E 18 FC  ASL $FC18,X
  $AF81  FF        .db $FF
  $AF82  E3        .db $E3
  $AF83  7D 7F CF  ADC $CF7F,X
  $AF86  8D CD 00  STA $00CD
  $AF89  FC        .db $FC
  $AF8A  FF        .db $FF
  $AF8B  FF        .db $FF
  $AF8C  CC 86 06  CPY $0686
  $AF8F  06 00     ASL $00
  $AF91  00        BRK
  $AF92  80        .db $80
  $AF93  D0 A8     BNE $AF3D
  $AF95  28        PLP
  $AF96  44        .db $44
  $AF97  C4 00     CPY $00
  $AF99  00        BRK
  $AF9A  00        BRK
  $AF9B  80        .db $80
  $AF9C  10 10     BPL $AFAE
  $AF9E  38        SEC
  $AF9F  38        SEC
  $AFA0  3F        .db $3F
  $AFA1  3F        .db $3F
  $AFA2  37        .db $37
  $AFA3  13        .db $13
  $AFA4  1B        .db $1B
  $AFA5  0E 07 00  ASL $0007
  $AFA8  1F        .db $1F
  $AFA9  1F        .db $1F
  $AFAA  1F        .db $1F
  $AFAB  0E 0E 05  ASL $050E

L_AFAE:
  $AFAE  00        BRK
  $AFAF  00        BRK
  $AFB0  9C        .db $9C
  $AFB1  F8        SED
  $AFB2  BB        .db $BB
  $AFB3  3C        .db $3C
  $AFB4  1F        .db $1F
  $AFB5  7F        .db $7F
  $AFB6  87        .db $87
  $AFB7  05 00     ORA $00
  $AFB9  10 50     BPL $B00B
  $AFBB  D8        CLD
  $AFBC  EC 87 01  CPX $0187
  $AFBF  02        .db $02
  $AFC0  DF        .db $DF
  $AFC1  1F        .db $1F
  $AFC2  DF        .db $DF
  $AFC3  3F        .db $3F
  $AFC4  FF        .db $FF
  $AFC5  BF        .db $BF
  $AFC6  FF        .db $FF
  $AFC7  F9 09 0B  SBC $0B09,Y
  $AFCA  07        .db $07
  $AFCB  1F        .db $1F
  $AFCC  3F        .db $3F
  $AFCD  5E 58 06  LSR $0658,X
  $AFD0  82        .db $82
  $AFD1  C6 FE     DEC $FE
  $AFD3  FE EE EE  INC $EEEE,X
  $AFD6  EC 7C 7C  CPX $7C7C
  $AFD9  38        SEC
  $AFDA  44        .db $44
  $AFDB  7C        .db $7C
  $AFDC  54        .db $54
  $AFDD  54        .db $54
  $AFDE  38        SEC
  $AFDF  38        SEC
  $AFE0  00        BRK
  $AFE1  00        BRK
  $AFE2  00        BRK
  $AFE3  00        BRK
  $AFE4  01 07     ORA ($07,X)
  $AFE6  0F        .db $0F
  $AFE7  0F        .db $0F
  $AFE8  00        BRK
  $AFE9  00        BRK
  $AFEA  00        BRK
  $AFEB  00        BRK
  $AFEC  00        BRK
  $AFED  01 07     ORA ($07,X)
  $AFEF  00        BRK
  $AFF0  08        PHP
  $AFF1  10 31     BPL $B024

L_AFF3:
  $AFF3  7A        .db $7A
  $AFF4  FC        .db $FC
  $AFF5  FC        .db $FC
  $AFF6  FC        .db $FC

L_AFF7:
  $AFF7  FC        .db $FC
  $AFF8  07        .db $07
  $AFF9  0F        .db $0F
  $AFFA  1E 3C 78  ASL $783C,X
  $AFFD  F0 F8     BEQ $AFF7
  $AFFF  00        BRK
  $B000  00        BRK
  $B001  00        BRK
  $B002  FC        .db $FC
  $B003  03        .db $03
  $B004  03        .db $03
  $B005  03        .db $03
  $B006  07        .db $07
  $B007  07        .db $07
  $B008  FF        .db $FF
  $B009  FF        .db $FF
  $B00A  03        .db $03

L_B00B:
  $B00B  01 01     ORA ($01,X)
  $B00D  01 03     ORA ($03,X)
  $B00F  00        BRK
  $B010  B8        CLV
  $B011  50 E0     BVC $AFF3
  $B013  E0 F0     CPX #$F0
  $B015  FC        .db $FC
  $B016  FE FE 10  INC $10FE,X
  $B019  80        .db $80
  $B01A  C0 C0     CPY #$C0

L_B01C:
  $B01C  E0 F0     CPX #$F0
  $B01E  FC        .db $FC
  $B01F  00        BRK
  $B020  10 20     BPL $B042
  $B022  43        .db $43
  $B023  C4 E4     CPY $E4
  $B025  FC        .db $FC
  $B026  7E 7E 0F  ROR $0F7E,X
  $B029  1F        .db $1F
  $B02A  3C        .db $3C
  $B02B  78        SEI
  $B02C  78        SEI
  $B02D  78        SEI
  $B02E  3C        .db $3C
  $B02F  3C        .db $3C
  $B030  04        .db $04
  $B031  04        .db $04
  $B032  84 44     STY $44
  $B034  44        .db $44
  $B035  5C        .db $5C
  $B036  7C        .db $7C
  $B037  7C        .db $7C
  $B038  F8        SED
  $B039  F8        SED
  $B03A  78        SEI
  $B03B  38        SEC
  $B03C  38        SEC
  $B03D  38        SEC
  $B03E  38        SEC

L_B03F:
  $B03F  38        SEC
  $B040  E0 40     CPX #$40

L_B042:
  $B042  00        BRK
  $B043  00        BRK
  $B044  00        BRK
  $B045  00        BRK
  $B046  00        BRK
  $B047  00        BRK
  $B048  40        RTI
  $B049  00        BRK
  $B04A  00        BRK
  $B04B  00        BRK
  $B04C  00        BRK
  $B04D  00        BRK
  $B04E  00        BRK
  $B04F  00        BRK
  $B050  7C        .db $7C
  $B051  F9 F1 61  SBC $61F1,Y
  $B054  01 00     ORA ($00,X)

L_B056:
  $B056  00        BRK
  $B057  00        BRK
  $B058  38        SEC
  $B059  70 60     BVS $B0BB
  $B05B  00        BRK

L_B05C:
  $B05C  00        BRK
  $B05D  00        BRK
  $B05E  00        BRK
  $B05F  00        BRK

L_B060:
  $B060  FC        .db $FC
  $B061  FC        .db $FC
  $B062  F8        SED
  $B063  F8        SED
  $B064  F0 F0     BEQ $B056
  $B066  60        RTS
  $B067  00        BRK
  $B068  78        SEI
  $B069  F8        SED
  $B06A  F0 F0     BEQ $B05C
  $B06C  E0 60     CPX #$60
  $B06E  00        BRK
  $B06F  00        BRK
  $B070  00        BRK
  $B071  01 02     ORA ($02,X)
  $B073  04        .db $04
  $B074  08        PHP
  $B075  08        PHP
  $B076  10 F3     BPL $B06B
  $B078  00        BRK
  $B079  00        BRK
  $B07A  01 03     ORA ($03,X)
  $B07C  07        .db $07
  $B07D  07        .db $07
  $B07E  0F        .db $0F
  $B07F  0C        .db $0C
  $B080  7E FF 71  ROR $71FF,X
  $B083  3E 3F 67  ROL $673F,X
  $B086  C7        .db $C7
  $B087  64        .db $64
  $B088  00        BRK
  $B089  7E FF FF  ROR $FFFF,X
  $B08C  E6 C3     INC $C3
  $B08E  00        BRK
  $B08F  03        .db $03
  $B090  00        BRK
  $B091  80        .db $80
  $B092  C0 E0     CPY #$E0
  $B094  C0 80     CPY #$80
  $B096  F0 C8     BEQ $B060
  $B098  00        BRK
  $B099  00        BRK
  $B09A  80        .db $80
  $B09B  C0 00     CPY #$00
  $B09D  00        BRK
  $B09E  00        BRK
  $B09F  30 9E     BMI $B03F
  $B0A1  8C 4D 4E  STY $4E4D
  $B0A4  3F        .db $3F
  $B0A5  3F        .db $3F
  $B0A6  1E 0C 60  ASL $600C,X
  $B0A9  70 30     BVS $B0DB
  $B0AB  34        .db $34
  $B0AC  0A        ASL
  $B0AD  1C        .db $1C
  $B0AE  0D 03 6C  ORA $6C03
  $B0B1  0E EE 1F  ASL $1FEE
  $B0B4  FF        .db $FF
  $B0B5  DF        .db $DF
  $B0B6  FC        .db $FC
  $B0B7  00        BRK
  $B0B8  03        .db $03
  $B0B9  05 01     ORA $01

L_B0BB:
  $B0BB  0E 1E AC  ASL $AC1E
  $B0BE  03        .db $03
  $B0BF  FF        .db $FF
  $B0C0  34        .db $34
  $B0C1  3A        .db $3A
  $B0C2  7E FE EE  ROR $EEFE,X
  $B0C5  F7        .db $F7
  $B0C6  FF        .db $FF
  $B0C7  BF        .db $BF
  $B0C8  C8        INY
  $B0C9  D4        .db $D4
  $B0CA  B8        CLV
  $B0CB  6C D4 6E  JMP ($6ED4)
  $B0CE  3E 0E 08  ROL $080E,X
  $B0D1  18        CLC
  $B0D2  1C        .db $1C
  $B0D3  1F        .db $1F
  $B0D4  0F        .db $0F
  $B0D5  0F        .db $0F
  $B0D6  0F        .db $0F
  $B0D7  1F        .db $1F
  $B0D8  07        .db $07
  $B0D9  0F        .db $0F
  $B0DA  0F        .db $0F

L_B0DB:
  $B0DB  0F        .db $0F
  $B0DC  07        .db $07
  $B0DD  07        .db $07
  $B0DE  07        .db $07
  $B0DF  0E 70 88  ASL $8870
  $B0E2  88        DEY
  $B0E3  8B        .db $8B
  $B0E4  CF        .db $CF
  $B0E5  CF        .db $CF
  $B0E6  9F        .db $9F
  $B0E7  3F        .db $3F
  $B0E8  8F        .db $8F
  $B0E9  07        .db $07
  $B0EA  07        .db $07
  $B0EB  07        .db $07
  $B0EC  87        .db $87
  $B0ED  87        .db $87
  $B0EE  0F        .db $0F
  $B0EF  1F        .db $1F
  $B0F0  8E 80 80  STX $8080
  $B0F3  80        .db $80
  $B0F4  80        .db $80
  $B0F5  80        .db $80
  $B0F6  80        .db $80
  $B0F7  80        .db $80
  $B0F8  00        BRK
  $B0F9  00        BRK
  $B0FA  00        BRK
  $B0FB  00        BRK
  $B0FC  00        BRK
  $B0FD  00        BRK
  $B0FE  00        BRK
  $B0FF  00        BRK
  $B100  1E 0C 00  ASL $000C,X
  $B103  00        BRK
  $B104  00        BRK
  $B105  00        BRK
  $B106  00        BRK
  $B107  00        BRK
  $B108  0C        .db $0C
  $B109  00        BRK
  $B10A  00        BRK
  $B10B  00        BRK
  $B10C  00        BRK
  $B10D  00        BRK
  $B10E  00        BRK
  $B10F  00        BRK
  $B110  3F        .db $3F
  $B111  3F        .db $3F
  $B112  3E 1E 0C  ROL $0C1E,X
  $B115  00        BRK
  $B116  00        BRK
  $B117  00        BRK
  $B118  1E 1E 1C  ASL $1C1E,X
  $B11B  0C        .db $0C
  $B11C  00        BRK
  $B11D  00        BRK
  $B11E  00        BRK
  $B11F  00        BRK
  $B120  00        BRK
  $B121  00        BRK
  $B122  00        BRK
  $B123  00        BRK
  $B124  03        .db $03
  $B125  0F        .db $0F
  $B126  13        .db $13
  $B127  21 00     AND ($00,X)
  $B129  00        BRK
  $B12A  00        BRK
  $B12B  00        BRK
  $B12C  00        BRK
  $B12D  03        .db $03
  $B12E  0F        .db $0F
  $B12F  1F        .db $1F
  $B130  00        BRK
  $B131  00        BRK

L_B132:
  $B132  00        BRK
  $B133  00        BRK
  $B134  F0 FC     BEQ $B132
  $B136  8E F7 00  STX $00F7
  $B139  00        BRK
  $B13A  00        BRK

L_B13B:
  $B13B  00        BRK
  $B13C  00        BRK
  $B13D  F0 FC     BEQ $B13B
  $B13F  FE 41 43  INC $4341,X
  $B142  86 9B     STX $9B
  $B144  73        .db $73
  $B145  20 2F 10  JSR $102F
  $B148  3F        .db $3F
  $B149  3E 78 60  ROL $6078,X
  $B14C  00        BRK
  $B14D  00        BRK
  $B14E  00        BRK
  $B14F  00        BRK
  $B150  FE 3C 34  INC $343C,X
  $B153  37        .db $37
  $B154  7F        .db $7F
  $B155  7F        .db $7F
  $B156  79 F1 30  ADC $30F1,Y
  $B159  18        CLC
  $B15A  18        CLC
  $B15B  18        CLC
  $B15C  37        .db $37
  $B15D  28        PLP
  $B15E  16 6E     ASL $6E,X
  $B160  00        BRK
  $B161  00        BRK
  $B162  00        BRK
  $B163  00        BRK
  $B164  80        .db $80
  $B165  C0 C0     CPY #$C0
  $B167  C0 00     CPY #$00
  $B169  00        BRK
  $B16A  00        BRK
  $B16B  00        BRK
  $B16C  00        BRK
  $B16D  80        .db $80
  $B16E  80        .db $80
  $B16F  80        .db $80
  $B170  03        .db $03
  $B171  07        .db $07
  $B172  0F        .db $0F
  $B173  1F        .db $1F
  $B174  1F        .db $1F
  $B175  1F        .db $1F
  $B176  0F        .db $0F
  $B177  07        .db $07
  $B178  00        BRK
  $B179  03        .db $03
  $B17A  07        .db $07
  $B17B  0F        .db $0F
  $B17C  07        .db $07
  $B17D  03        .db $03
  $B17E  01 00     ORA ($00,X)
  $B180  2F        .db $2F
  $B181  EF        .db $EF
  $B182  F7        .db $F7
  $B183  DF        .db $DF
  $B184  9F        .db $9F
  $B185  BE FF DF  LDX $DFFF,Y
  $B188  10 17     BPL $B1A1
  $B18A  E8        INX
  $B18B  E3        .db $E3
  $B18C  E6 CD     INC $CD
  $B18E  C6 83     DEC $83

L_B190:
  $B190  E1 E2     SBC ($E2,X)
  $B192  F4        .db $F4
  $B193  FA        .db $FA
  $B194  71 F1     ADC ($F1),Y
  $B196  F1 F3     SBC ($F3),Y
  $B198  9E        .db $9E
  $B199  1D EB E1  ORA $E1EB,X
  $B19C  E0 40     CPX #$40

L_B19E:
  $B19E  C0 A1     CPY #$A1
  $B1A0  80        .db $80

L_B1A1:
  $B1A1  40        RTI
  $B1A2  20 10 18  JSR $1810
  $B1A5  38        SEC
  $B1A6  F8        SED
  $B1A7  F0 00     BEQ $B1A9

L_B1A9:
  $B1A9  80        .db $80
  $B1AA  C0 E0     CPY #$E0
  $B1AC  F0 F0     BEQ $B19E
  $B1AE  F0 E0     BEQ $B190
  $B1B0  8F        .db $8F
  $B1B1  07        .db $07
  $B1B2  01 00     ORA ($00,X)
  $B1B4  00        BRK
  $B1B5  00        BRK
  $B1B6  00        BRK
  $B1B7  00        BRK
  $B1B8  01 00     ORA ($00,X)
  $B1BA  00        BRK
  $B1BB  00        BRK
  $B1BC  00        BRK
  $B1BD  00        BRK
  $B1BE  00        BRK
  $B1BF  00        BRK
  $B1C0  F3        .db $F3
  $B1C1  F9 FC FC  SBC $FCFC,Y
  $B1C4  FC        .db $FC
  $B1C5  7C        .db $7C
  $B1C6  78        SEI
  $B1C7  30 61     BMI $B22A
  $B1C9  F0 F8     BEQ $B1C3
  $B1CB  78        SEI
  $B1CC  78        SEI
  $B1CD  38        SEC
  $B1CE  30 00     BMI $B1D0

L_B1D0:
  $B1D0  F0 F0     BEQ $B1C2
  $B1D2  F8        SED
  $B1D3  78        SEI
  $B1D4  30 00     BMI $B1D6

L_B1D6:
  $B1D6  00        BRK
  $B1D7  00        BRK
  $B1D8  E0 E0     CPX #$E0
  $B1DA  70 30     BVS $B20C
  $B1DC  00        BRK
  $B1DD  00        BRK

L_B1DE:
  $B1DE  00        BRK
  $B1DF  00        BRK
  $B1E0  F0 FC     BEQ $B1DE
  $B1E2  8E F7 FE  STX $FEF7
  $B1E5  3F        .db $3F
  $B1E6  37        .db $37

L_B1E7:
  $B1E7  37        .db $37
  $B1E8  00        BRK
  $B1E9  F0 FC     BEQ $B1E7
  $B1EB  FE 30 18  INC $1830,X
  $B1EE  1A        .db $1A
  $B1EF  1A        .db $1A
  $B1F0  00        BRK
  $B1F1  00        BRK
  $B1F2  00        BRK
  $B1F3  00        BRK
  $B1F4  00        BRK
  $B1F5  E0 18     CPX #$18
  $B1F7  1C        .db $1C
  $B1F8  00        BRK
  $B1F9  00        BRK
  $B1FA  00        BRK
  $B1FB  00        BRK
  $B1FC  00        BRK
  $B1FD  00        BRK
  $B1FE  E0 E8     CPX #$E8
  $B200  7E 7F 7E  ROR $7E7F,X
  $B203  FC        .db $FC
  $B204  FC        .db $FC
  $B205  FC        .db $FC
  $B206  F5 EB     SBC $EB,X
  $B208  25 2C     AND $2C
  $B20A  1C        .db $1C
  $B20B  78        SEI

L_B20C:
  $B20C  F8        SED
  $B20D  70 68     BVS $B277
  $B20F  15 3E     ORA $3E,X
  $B211  F6 77     INC $77,X
  $B213  77        .db $77
  $B214  7F        .db $7F
  $B215  7F        .db $7F
  $B216  E3        .db $E3
  $B217  C1 DC     CMP ($DC,X)
  $B219  1C        .db $1C
  $B21A  2A        ROL
  $B21B  2A        ROL
  $B21C  3E 22 1C  ROL $1C22,X
  $B21F  BE 19 0C  LDX $0C19,Y
  $B222  07        .db $07
  $B223  00        BRK
  $B224  00        BRK
  $B225  00        BRK
  $B226  00        BRK
  $B227  00        BRK
  $B228  0F        .db $0F
  $B229  07        .db $07

L_B22A:
  $B22A  00        BRK
  $B22B  00        BRK
  $B22C  00        BRK
  $B22D  00        BRK
  $B22E  00        BRK
  $B22F  00        BRK
  $B230  E6 C4     INC $C4
  $B232  86 0F     STX $0F
  $B234  0F        .db $0F
  $B235  0F        .db $0F
  $B236  1F        .db $1F
  $B237  1F        .db $1F
  $B238  81 83     STA ($83,X)
  $B23A  03        .db $03
  $B23B  07        .db $07
  $B23C  07        .db $07
  $B23D  03        .db $03
  $B23E  0F        .db $0F
  $B23F  00        BRK

L_B240:
  $B240  0B        .db $0B
  $B241  17        .db $17
  $B242  2F        .db $2F
  $B243  FF        .db $FF
  $B244  E3        .db $E3
  $B245  F1 F0     SBC ($F0),Y
  $B247  F0 F7     BEQ $B240
  $B249  EF        .db $EF
  $B24A  DD 83 C1  CMP $C183,X
  $B24D  E0 E0     CPX #$E0
  $B24F  00        BRK
  $B250  E1 E2     SBC ($E2,X)
  $B252  F2        .db $F2
  $B253  F4        .db $F4
  $B254  E8        INX
  $B255  C0 00     CPY #$00
  $B257  00        BRK
  $B258  DE DC CC  DEC $CCDC,X
  $B25B  C8        INY
  $B25C  C0 00     CPY #$00
  $B25E  00        BRK
  $B25F  00        BRK
  $B260  00        BRK
  $B261  00        BRK
  $B262  00        BRK
  $B263  00        BRK
  $B264  00        BRK
  $B265  00        BRK
  $B266  00        BRK
  $B267  FC        .db $FC
  $B268  00        BRK
  $B269  00        BRK
  $B26A  00        BRK
  $B26B  00        BRK
  $B26C  00        BRK
  $B26D  00        BRK
  $B26E  00        BRK
  $B26F  00        BRK
  $B270  0F        .db $0F
  $B271  13        .db $13
  $B272  21 41     AND ($41,X)
  $B274  43        .db $43
  $B275  86 9B     STX $9B

L_B277:
  $B277  73        .db $73
  $B278  03        .db $03
  $B279  0F        .db $0F
  $B27A  1F        .db $1F
  $B27B  3F        .db $3F
  $B27C  3E 78 60  ROL $6078,X
  $B27F  00        BRK
  $B280  FC        .db $FC
  $B281  8E F7 FE  STX $FEF7
  $B284  3C        .db $3C
  $B285  34        .db $34

L_B286:
  $B286  34        .db $34
  $B287  7C        .db $7C
  $B288  F0 FC     BEQ $B286

L_B28A:
  $B28A  FE 30 18  INC $1830,X
  $B28D  18        CLC
  $B28E  18        CLC
  $B28F  20 81 BD  JSR $BD81
  $B292  C3        .db $C3
  $B293  FF        .db $FF
  $B294  7B        .db $7B
  $B295  3F        .db $3F
  $B296  3F        .db $3F
  $B297  23        .db $23
  $B298  00        BRK
  $B299  00        BRK
  $B29A  01 43     ORA ($43,X)
  $B29C  35 15     AND $15,X
  $B29E  00        BRK
  $B29F  1D F8 F4  ORA $F4F8,X
  $B2A2  F2        .db $F2
  $B2A3  FD FF FE  SBC $FEFF,X
  $B2A6  FE DC B0  INC $B0DC,X
  $B2A9  68        PLA
  $B2AA  EC C2 9C  CPX $9CC2
  $B2AD  7C        .db $7C
  $B2AE  DC        .db $DC
  $B2AF  A8        TAY
  $B2B0  27        .db $27
  $B2B1  14        .db $14
  $B2B2  0C        .db $0C
  $B2B3  08        PHP
  $B2B4  09 0F     ORA #$0F
  $B2B6  07        .db $07
  $B2B7  07        .db $07
  $B2B8  18        CLC
  $B2B9  0B        .db $0B
  $B2BA  03        .db $03
  $B2BB  07        .db $07
  $B2BC  06 00     ASL $00
  $B2BE  03        .db $03
  $B2BF  00        BRK
  $B2C0  BC FC 7E  LDY $7EFC,X
  $B2C3  7E FE FC  ROR $FCFE,X
  $B2C6  F8        SED
  $B2C7  F0 D8     BEQ $B2A1
  $B2C9  70 AC     BVS $B277
  $B2CB  9C        .db $9C
  $B2CC  7C        .db $7C
  $B2CD  F8        SED
  $B2CE  F0 00     BEQ $B2D0

L_B2D0:
  $B2D0  1C        .db $1C
  $B2D1  08        PHP
  $B2D2  0B        .db $0B
  $B2D3  04        .db $04
  $B2D4  07        .db $07
  $B2D5  1B        .db $1B
  $B2D6  61 81     ADC ($81,X)
  $B2D8  00        BRK
  $B2D9  00        BRK
  $B2DA  00        BRK
  $B2DB  00        BRK
  $B2DC  00        BRK
  $B2DD  05 1E     ORA $1E
  $B2DF  7E DF 1D  ROR $1DDF,X
  $B2E2  DC        .db $DC
  $B2E3  3C        .db $3C
  $B2E4  F8        SED
  $B2E5  F8        SED
  $B2E6  FD 8F 08  SBC $088F,X
  $B2E9  0A        ASL
  $B2EA  03        .db $03
  $B2EB  1B        .db $1B
  $B2EC  07        .db $07
  $B2ED  E7        .db $E7
  $B2EE  9A        TXS
  $B2EF  FC        .db $FC
  $B2F0  F0 98     BEQ $B28A
  $B2F2  CC FE FE  CPY $FEFE
  $B2F5  FA        .db $FA
  $B2F6  F2        .db $F2
  $B2F7  F9 C0 F0  SBC $F0C0,Y
  $B2FA  78        SEI
  $B2FB  7C        .db $7C
  $B2FC  78        SEI
  $B2FD  74        .db $74
  $B2FE  0C        .db $0C
  $B2FF  76 61     ROR $61,X
  $B301  1B        .db $1B
  $B302  1F        .db $1F
  $B303  1C        .db $1C
  $B304  1F        .db $1F
  $B305  7F        .db $7F
  $B306  FF        .db $FF
  $B307  FF        .db $FF
  $B308  1E 05 08  ASL $0805,X

L_B30B:
  $B30B  0F        .db $0F
  $B30C  0E 1F 7F  ASL $7F1F
  $B30F  00        BRK
  $B310  FC        .db $FC
  $B311  F8        SED
  $B312  F1 8B     SBC ($8B),Y
  $B314  07        .db $07
  $B315  80        .db $80
  $B316  C0 C0     CPY #$C0
  $B318  9B        .db $9B
  $B319  E7        .db $E7
  $B31A  0F        .db $0F
  $B31B  07        .db $07
  $B31C  00        BRK
  $B31D  00        BRK
  $B31E  80        .db $80
  $B31F  00        BRK
  $B320  FD FF FC  SBC $FCFF,X
  $B323  FC        .db $FC
  $B324  FC        .db $FC
  $B325  7C        .db $7C
  $B326  38        SEC
  $B327  00        BRK
  $B328  F2        .db $F2
  $B329  F8        SED
  $B32A  B8        CLV
  $B32B  78        SEI
  $B32C  78        SEI
  $B32D  38        SEC
  $B32E  00        BRK
  $B32F  00        BRK
  $B330  00        BRK
  $B331  00        BRK
  $B332  11 10     ORA ($10),Y
  $B334  7E 42 3C  ROR $3C42,X
  $B337  00        BRK
  $B338  03        .db $03
  $B339  07        .db $07
  $B33A  13        .db $13
  $B33B  32        .db $32
  $B33C  7E 42 3C  ROR $3C42,X
  $B33F  00        BRK
  $B340  1F        .db $1F
  $B341  3E 73 F9  ROL $F973,X
  $B344  FF        .db $FF
  $B345  FE FC B8  INC $B8FC,X
  $B348  00        BRK
  $B349  1F        .db $1F
  $B34A  3F        .db $3F

L_B34B:
  $B34B  7F        .db $7F
  $B34C  7F        .db $7F
  $B34D  7F        .db $7F
  $B34E  7F        .db $7F
  $B34F  7F        .db $7F
  $B350  00        BRK
  $B351  80        .db $80
  $B352  40        RTI
  $B353  40        RTI
  $B354  60        RTS
  $B355  70 50     BVS $B3A7
  $B357  D0 00     BNE $B359

L_B359:
  $B359  00        BRK
  $B35A  80        .db $80
  $B35B  80        .db $80
  $B35C  80        .db $80
  $B35D  A0 A0     LDY #$A0
  $B35F  60        RTS
  $B360  41 3F     EOR ($3F,X)
  $B362  0C        .db $0C
  $B363  07        .db $07
  $B364  00        BRK
  $B365  00        BRK
  $B366  00        BRK
  $B367  00        BRK
  $B368  3E 01 07  ROL $0701,X
  $B36B  00        BRK
  $B36C  00        BRK
  $B36D  00        BRK
  $B36E  00        BRK
  $B36F  00        BRK
  $B370  90 48     BCC $B3BA
  $B372  28        PLP
  $B373  88        DEY
  $B374  78        SEI
  $B375  00        BRK
  $B376  00        BRK
  $B377  00        BRK
  $B378  60        RTS
  $B379  B0 D0     BCS $B34B
  $B37B  70 00     BVS $B37D

L_B37D:
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
  $B387  3E 00 00  ROL $0000,X
  $B38A  00        BRK
  $B38B  00        BRK
  $B38C  00        BRK
  $B38D  00        BRK
  $B38E  00        BRK
  $B38F  00        BRK
  $B390  00        BRK
  $B391  00        BRK
  $B392  01 01     ORA ($01,X)
  $B394  01 01     ORA ($01,X)
  $B396  01 00     ORA ($00,X)
  $B398  00        BRK
  $B399  00        BRK
  $B39A  00        BRK
  $B39B  00        BRK
  $B39C  00        BRK
  $B39D  00        BRK
  $B39E  00        BRK
  $B39F  00        BRK
  $B3A0  7D E6 F2  ADC $F2E6,X
  $B3A3  FE FC F8  INC $F8FC,X
  $B3A6  71 82     ADC ($82),Y
  $B3A8  3E 7F FF  ROL $FF7F,X
  $B3AB  FF        .db $FF
  $B3AC  FF        .db $FF
  $B3AD  FF        .db $FF
  $B3AE  FE 7C 00  INC $007C,X
  $B3B1  00        BRK
  $B3B2  00        BRK
  $B3B3  00        BRK
  $B3B4  00        BRK
  $B3B5  00        BRK
  $B3B6  7C        .db $7C
  $B3B7  FA        .db $FA
  $B3B8  00        BRK
  $B3B9  00        BRK

L_B3BA:
  $B3BA  00        BRK
  $B3BB  00        BRK
  $B3BC  00        BRK
  $B3BD  00        BRK
  $B3BE  00        BRK
  $B3BF  7C        .db $7C
  $B3C0  01 03     ORA ($03,X)
  $B3C2  03        .db $03
  $B3C3  03        .db $03
  $B3C4  03        .db $03
  $B3C5  02        .db $02
  $B3C6  01 00     ORA ($00,X)
  $B3C8  00        BRK
  $B3C9  01 01     ORA ($01,X)
  $B3CB  01 01     ORA ($01,X)
  $B3CD  01 00     ORA ($00,X)
  $B3CF  00        BRK
  $B3D0  CD E5 FD  CMP $FDE5
  $B3D3  F9 F1 E2  SBC $E2F1,Y
  $B3D6  04        .db $04
  $B3D7  F8        SED
  $B3D8  FE FE FE  INC $FEFE,X
  $B3DB  FE FE FC  INC $FCFE,X
  $B3DE  F8        SED
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
  $B400  46 40     LSR $40
  $B402  40        RTI
  $B403  40        RTI
  $B404  40        RTI
  $B405  40        RTI
  $B406  40        RTI
  $B407  24 20     BIT $20
  $B409  00        BRK
  $B40A  40        RTI
  $B40B  40        RTI
  $B40C  40        RTI
  $B40D  25 00     AND $00
  $B40F  00        BRK
  $B410  00        BRK
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
  $B42D  12        .db $12
  $B42E  00        BRK
  $B42F  00        BRK
  $B430  24 00     BIT $00
  $B432  12        .db $12
  $B433  12        .db $12
  $B434  00        BRK
  $B435  36 6C     ROL $6C,X
  $B437  6C 6C 6C  JMP ($6C6C)
  $B43A  48        PHA
  $B43B  5A        .db $5A
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
  $B460  98        TYA
  $B461  03        .db $03
  $B462  99 03 92  STA $9203,Y
  $B465  04        .db $04
  $B466  9E        .db $9E
  $B467  03        .db $03
  $B468  93        .db $93
  $B469  04        .db $04
  $B46A  9F        .db $9F
  $B46B  03        .db $03
  $B46C  0F        .db $0F
  $B46D  11 30     ORA ($30),Y
  $B46F  0F        .db $0F
  $B470  15 28     ORA $28,X
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
  $B484  98        TYA
  $B485  03        .db $03
  $B486  99 03 9A  STA $9A03,Y
  $B489  03        .db $03
  $B48A  9E        .db $9E
  $B48B  04        .db $04
  $B48C  90 03     BCC $B491
  $B48E  9F        .db $9F
  $B48F  03        .db $03
  $B490  0F        .db $0F

L_B491:
  $B491  15 27     ORA $27,X
  $B493  0F        .db $0F
  $B494  11 3C     ORA ($3C),Y
  $B496  9E        .db $9E
  $B497  06 9F     ASL $9F
  $B499  06 96     ASL $96
  $B49B  07        .db $07
  $B49C  97        .db $97
  $B49D  07        .db $07
  $B49E  9E        .db $9E
  $B49F  07        .db $07
  $B4A0  9F        .db $9F
  $B4A1  07        .db $07
  $B4A2  30 30     BMI $B4D4
  $B4A4  28        PLP
  $B4A5  0F        .db $0F
  $B4A6  30 12     BMI $B4BA
  $B4A8  9C        .db $9C
  $B4A9  00        BRK
  $B4AA  9D 00 9E  STA $9E00,X
  $B4AD  00        BRK
  $B4AE  94 06     STY $06,X

L_B4B0:
  $B4B0  95 06     STA $06,X
  $B4B2  9F        .db $9F
  $B4B3  00        BRK
  $B4B4  0F        .db $0F
  $B4B5  11 2C     ORA ($2C),Y
  $B4B7  0F        .db $0F
  $B4B8  0F        .db $0F
  $B4B9  0F        .db $0F

L_B4BA:
  $B4BA  BA        TSX
  $B4BB  08        PHP
  $B4BC  BB        .db $BB
  $B4BD  08        PHP
  $B4BE  95 05     STA $05,X
  $B4C0  96 05     STX $05,Y
  $B4C2  95 02     STA $02,X
  $B4C4  9F        .db $9F
  $B4C5  00        BRK
  $B4C6  0F        .db $0F
  $B4C7  2C 15 0F  BIT $0F15
  $B4CA  38        SEC
  $B4CB  15 9D     ORA $9D,X
  $B4CD  02        .db $02
  $B4CE  90 03     BCC $B4D3
  $B4D0  95 05     STA $05,X
  $B4D2  96 05     STX $05,Y

L_B4D4:
  $B4D4  95 02     STA $02,X
  $B4D6  9F        .db $9F
  $B4D7  00        BRK
  $B4D8  00        BRK
  $B4D9  05 26     ORA $26
  $B4DB  0F        .db $0F
  $B4DC  38        SEC
  $B4DD  15 FF     ORA $FF,X
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
  $B601  03        .db $03
  $B602  03        .db $03
  $B603  04        .db $04
  $B604  04        .db $04
  $B605  06 07     ASL $07
  $B607  08        PHP
  $B608  0A        ASL
  $B609  0A        ASL
  $B60A  0B        .db $0B
  $B60B  0C        .db $0C
  $B60C  0D 0F 11  ORA $110F
  $B60F  1A        .db $1A
  $B610  1A        .db $1A
  $B611  1A        .db $1A
  $B612  1A        .db $1A
  $B613  1B        .db $1B
  $B614  1B        .db $1B
  $B615  1B        .db $1B
  $B616  1B        .db $1B
  $B617  1B        .db $1B
  $B618  1C        .db $1C
  $B619  1C        .db $1C
  $B61A  1C        .db $1C
  $B61B  1C        .db $1C
  $B61C  1D 1D 1D  ORA $1D1D,X
  $B61F  1E 1E 1E  ASL $1E1E,X
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

L_B6C7:
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

L_B6E3:
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
  $B700  84 9C     STY $9C
  $B702  EC 24 CC  CPX $CC24
  $B705  44        .db $44
  $B706  40        RTI
  $B707  68        PLA
  $B708  A8        TAY
  $B709  D8        CLD
  $B70A  88        DEY
  $B70B  68        PLA
  $B70C  F8        SED
  $B70D  38        SEC
  $B70E  08        PHP
  $B70F  18        CLC
  $B710  58        CLI
  $B711  B0 D0     BCS $B6E3
  $B713  28        PLP
  $B714  48        PHA
  $B715  70 B0     BVS $B6C7
  $B717  E8        INX
  $B718  28        PLP
  $B719  78        SEI
  $B71A  A0 C8     LDY #$C8
  $B71C  68        PLA
  $B71D  90 B8     BCC $B6D7
  $B71F  30 78     BMI $B799
  $B721  B0 FF     BCS $B722
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

L_B799:
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
  $B800  C4 94     CPY $94
  $B802  94 34     STY $34,X
  $B804  94 94     STY $94,X
  $B806  84 84     STY $84
  $B808  9C        .db $9C
  $B809  6C B0 B4  JMP ($B4B0)
  $B80C  B4 B4     LDY $B4,X
  $B80E  84 34     STY $34
  $B810  44        .db $44
  $B811  24 44     BIT $44
  $B813  24 34     BIT $34
  $B815  44        .db $44
  $B816  34        .db $34
  $B817  54        .db $54
  $B818  64        .db $64
  $B819  64        .db $64
  $B81A  64        .db $64
  $B81B  64        .db $64
  $B81C  64        .db $64
  $B81D  64        .db $64
  $B81E  64        .db $64
  $B81F  64        .db $64
  $B820  44        .db $44
  $B821  44        .db $44
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
  $B900  4B        .db $4B
  $B901  4B        .db $4B
  $B902  4C 4B 4B  JMP $4B4B
  $B905  4C 4E 4B  JMP $4B4E
  $B908  50 50     BVC $B95A
  $B90A  31 4E     AND ($4E),Y
  $B90C  4E 4E 4E  LSR $4E4E
  $B90F  72        .db $72
  $B910  73        .db $73
  $B911  72        .db $72
  $B912  73        .db $73
  $B913  72        .db $72
  $B914  73        .db $73
  $B915  72        .db $72
  $B916  73        .db $73
  $B917  72        .db $72
  $B918  73        .db $73
  $B919  72        .db $72
  $B91A  73        .db $73
  $B91B  72        .db $72
  $B91C  73        .db $73
  $B91D  72        .db $72
  $B91E  73        .db $73
  $B91F  72        .db $72
  $B920  73        .db $73
  $B921  72        .db $72
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

L_B95A:
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

L_B9E0:
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
  $BA01  04        .db $04
  $BA02  05 06     ORA $06
  $BA04  06 06     ASL $06
  $BA06  09 09     ORA #$09
  $BA08  0A        ASL
  $BA09  0C        .db $0C
  $BA0A  10 11     BPL $BA1D
  $BA0C  11 11     ORA ($11),Y
  $BA0E  12        .db $12
  $BA0F  12        .db $12
  $BA10  13        .db $13
  $BA11  13        .db $13
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

L_BA1D:
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
  $BA40  C8        INY
  $BA41  58        CLI
  $BA42  58        CLI
  $BA43  68        PLA
  $BA44  98        TYA
  $BA45  C8        INY
  $BA46  70 98     BVS $B9E0
  $BA48  58        CLI
  $BA49  E8        INX
  $BA4A  C8        INY
  $BA4B  98        TYA
  $BA4C  F8        SED
  $BA4D  F8        SED
  $BA4E  F8        SED
  $BA4F  F8        SED
  $BA50  08        PHP
  $BA51  08        PHP
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
  $BA80  98        TYA
  $BA81  8F        .db $8F
  $BA82  38        SEC
  $BA83  2F        .db $2F
  $BA84  2F        .db $2F
  $BA85  2F        .db $2F
  $BA86  78        SEI
  $BA87  6F        .db $6F
  $BA88  3A        .db $3A
  $BA89  D8        CLD
  $BA8A  38        SEC
  $BA8B  2F        .db $2F
  $BA8C  4F        .db $4F
  $BA8D  6F        .db $6F
  $BA8E  4F        .db $4F
  $BA8F  6F        .db $6F
  $BA90  4F        .db $4F
  $BA91  6F        .db $6F
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
  $BAC0  76 57     ROR $57,X
  $BAC2  7B        .db $7B
  $BAC3  2D 2D 2D  AND $2D2D
  $BAC6  76 2D     ROR $2D,X
  $BAC8  78        SEI
  $BAC9  76 7A     ROR $7A,X
  $BACB  2D 2F 2F  AND $2F2F
  $BACE  2F        .db $2F
  $BACF  2F        .db $2F
  $BAD0  2F        .db $2F
  $BAD1  2F        .db $2F
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
  $BB00  94 84     STY $84,X
  $BB02  74        .db $74
  $BB03  84 84     STY $84
  $BB05  84 00     STY $00
  $BB07  08        PHP
  $BB08  12        .db $12
  $BB09  16 16     ASL $16,X
  $BB0B  16 00     ASL $00,X
  $BB0D  07        .db $07
  $BB0E  0F        .db $0F
  $BB0F  0F        .db $0F
  $BB10  0F        .db $0F
  $BB11  0F        .db $0F
  $BB12  00        BRK
  $BB13  06 0E     ASL $0E
  $BB15  12        .db $12
  $BB16  12        .db $12
  $BB17  12        .db $12
  $BB18  84 86     STY $86
  $BB1A  89        .db $89
  $BB1B  8A        TXA
  $BB1C  8A        TXA
  $BB1D  8A        TXA
  $BB1E  E0 E0     CPX #$E0
  $BB20  60        RTS
  $BB21  60        RTS
  $BB22  60        RTS
  $BB23  60        RTS
  $BB24  85 87     STA $87
  $BB26  89        .db $89
  $BB27  8A        TXA
  $BB28  8A        TXA
  $BB29  8A        TXA
  $BB2A  60        RTS
  $BB2B  60        RTS
  $BB2C  E0 E0     CPX #$E0
  $BB2E  E0 E0     CPX #$E0
  $BB30  00        BRK
  $BB31  02        .db $02
  $BB32  08        PHP
  $BB33  0A        ASL
  $BB34  0A        ASL
  $BB35  0A        ASL
  $BB36  00        BRK
  $BB37  08        PHP
  $BB38  12        .db $12
  $BB39  16 16     ASL $16,X
  $BB3B  16 06     ASL $06,X
  $BB3D  08        PHP
  $BB3E  12        .db $12
  $BB3F  16 16     ASL $16,X
  $BB41  16 FF     ASL $FF,X
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
  $BC08  05 03     ORA $03
  $BC0A  9F        .db $9F
  $BC0B  01 03     ORA ($03,X)
  $BC0D  80        .db $80
  $BC0E  06 09     ASL $09
  $BC10  A0 0A     LDY #$0A
  $BC12  05 FF     ORA $FF
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
  $BD00  06 90     ASL $90
  $BD02  09 00     ORA #$00
  $BD04  84 01     STY $01
  $BD06  09 98     ORA #$98
  $BD08  05 03     ORA $03
  $BD0A  9F        .db $9F
  $BD0B  01 03     ORA ($03,X)
  $BD0D  80        .db $80
  $BD0E  08        PHP
  $BD0F  09 B0     ORA #$B0
  $BD11  08        PHP
  $BD12  02        .db $02
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

L_BD81:
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
  $BE01  20 0F 2B  JSR $2B0F
  $BE04  12        .db $12
  $BE05  02        .db $02
  $BE06  0F        .db $0F
  $BE07  20 21 11  JSR $1121
  $BE0A  0F        .db $0F
  $BE0B  20 21 11  JSR $1121
  $BE0E  0F        .db $0F
  $BE0F  20 21 11  JSR $1121
  $BE12  0F        .db $0F
  $BE13  0F        .db $0F
  $BE14  2C 11 0F  BIT $0F11
  $BE17  0F        .db $0F
  $BE18  20 38 0F  JSR $0F38
  $BE1B  0F        .db $0F
  $BE1C  11 30     ORA ($30),Y
  $BE1E  0F        .db $0F
  $BE1F  0F        .db $0F
  $BE20  15 28     ORA $28,X
  $BE22  0F        .db $0F
  $BE23  2B        .db $2B
  $BE24  12        .db $12
  $BE25  02        .db $02
  $BE26  0F        .db $0F
  $BE27  30 31     BMI $BE5A
  $BE29  2C 0F 20  BIT $200F
  $BE2C  21 11     AND ($11,X)
  $BE2E  0F        .db $0F
  $BE2F  20 21 11  JSR $1121
  $BE32  0F        .db $0F
  $BE33  2B        .db $2B
  $BE34  12        .db $12
  $BE35  02        .db $02
  $BE36  0F        .db $0F
  $BE37  20 21 11  JSR $1121
  $BE3A  0F        .db $0F
  $BE3B  30 31     BMI $BE6E
  $BE3D  2C 0F 20  BIT $200F
  $BE40  21 11     AND ($11,X)
  $BE42  0F        .db $0F
  $BE43  2B        .db $2B
  $BE44  12        .db $12
  $BE45  02        .db $02
  $BE46  0F        .db $0F
  $BE47  20 21 11  JSR $1121
  $BE4A  0F        .db $0F
  $BE4B  20 21 11  JSR $1121
  $BE4E  0F        .db $0F
  $BE4F  30 31     BMI $BE82
  $BE51  2C 0F 0F  BIT $0F0F
  $BE54  0F        .db $0F
  $BE55  0F        .db $0F
  $BE56  0F        .db $0F
  $BE57  0F        .db $0F
  $BE58  0F        .db $0F
  $BE59  0F        .db $0F

L_BE5A:
  $BE5A  0F        .db $0F
  $BE5B  0F        .db $0F
  $BE5C  0F        .db $0F
  $BE5D  0F        .db $0F
  $BE5E  0F        .db $0F

L_BE5F:
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

L_BE6E:
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

L_BE82:
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
  $BF03  27        .db $27
  $BF04  18        CLC
  $BF05  0A        ASL
  $BF06  0F        .db $0F
  $BF07  0F        .db $0F
  $BF08  0B        .db $0B
  $BF09  0F        .db $0F
  $BF0A  0F        .db $0F
  $BF0B  20 10 00  JSR $0010
  $BF0E  0F        .db $0F
  $BF0F  0B        .db $0B
  $BF10  0F        .db $0F
  $BF11  0B        .db $0B
  $BF12  0F        .db $0F
  $BF13  0F        .db $0F
  $BF14  2C 11 0F  BIT $0F11
  $BF17  0F        .db $0F
  $BF18  20 38 0F  JSR $0F38
  $BF1B  0F        .db $0F
  $BF1C  11 30     ORA ($30),Y
  $BF1E  0F        .db $0F
  $BF1F  0F        .db $0F
  $BF20  15 28     ORA $28,X
  $BF22  0F        .db $0F
  $BF23  27        .db $27
  $BF24  18        CLC
  $BF25  0A        ASL
  $BF26  0F        .db $0F
  $BF27  0F        .db $0F
  $BF28  0B        .db $0B
  $BF29  0F        .db $0F
  $BF2A  0F        .db $0F
  $BF2B  20 10 00  JSR $0010
  $BF2E  0F        .db $0F
  $BF2F  0B        .db $0B
  $BF30  0F        .db $0F
  $BF31  0B        .db $0B
  $BF32  0F        .db $0F
  $BF33  27        .db $27
  $BF34  18        CLC
  $BF35  0A        ASL
  $BF36  0F        .db $0F
  $BF37  0F        .db $0F
  $BF38  0B        .db $0B
  $BF39  0F        .db $0F
  $BF3A  0F        .db $0F
  $BF3B  20 10 00  JSR $0010
  $BF3E  0F        .db $0F
  $BF3F  0F        .db $0F
  $BF40  0B        .db $0B
  $BF41  0B        .db $0B
  $BF42  0F        .db $0F
  $BF43  27        .db $27
  $BF44  18        CLC
  $BF45  0A        ASL
  $BF46  0F        .db $0F
  $BF47  0F        .db $0F
  $BF48  0B        .db $0B
  $BF49  0F        .db $0F
  $BF4A  0F        .db $0F
  $BF4B  20 10 00  JSR $0010
  $BF4E  0F        .db $0F
  $BF4F  0B        .db $0B
  $BF50  0B        .db $0B
  $BF51  0F        .db $0F
  $BF52  0F        .db $0F
  $BF53  27        .db $27
  $BF54  18        CLC
  $BF55  0A        ASL
  $BF56  0F        .db $0F
  $BF57  0F        .db $0F
  $BF58  0B        .db $0B
  $BF59  0F        .db $0F
  $BF5A  0F        .db $0F
  $BF5B  20 10 00  JSR $0010
  $BF5E  0F        .db $0F
  $BF5F  0B        .db $0B
  $BF60  0B        .db $0B
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