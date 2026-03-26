; Mega Man 2 — PRG Bank 10
; Base address: $8000
; Size: 16384 bytes

  $8000  00        BRK
  $8001  00        BRK
  $8002  16 2A     ASL $2A,X
  $8004  3C        .db $3C
  $8005  52        .db $52
  $8006  68        PLA
  $8007  7E 96 AE  ROR $AE96,X
  $800A  C4 DA     CPY $DA
  $800C  EE 02 16  INC $1602
  $800F  28        PLP
  $8010  3A        .db $3A
  $8011  50 66     BVC $8079
  $8013  7C        .db $7C
  $8014  92        .db $92
  $8015  AA        TAX
  $8016  BA        TSX
  $8017  CA        DEX
  $8018  D6 EA     DEC $EA,X
  $801A  FE 14 1E  INC $1E14,X
  $801D  34        .db $34
  $801E  3E 56 6A  ROL $6A56,X
  $8021  82        .db $82
  $8022  8E 92 9A  STX $9A92
  $8025  A2 AA     LDX #$AA
  $8027  B4 BE     LDY $BE,X
  $8029  C8        INY
  $802A  CC D6 E0  CPY $E0D6
  $802D  EA        NOP
  $802E  F4        .db $F4
  $802F  F4        .db $F4
  $8030  F8        SED
  $8031  0C        .db $0C
  $8032  20 34 48  JSR $4834
  $8035  5C        .db $5C
  $8036  70 84     BVS $7FBC
  $8038  98        TYA
  $8039  AC B6 C0  LDY $C0B6
  $803C  CA        DEX
  $803D  CE D8 E2  DEC $E2D8
  $8040  EC F6 00  CPX $00F6
  $8043  0A        ASL
  $8044  14        .db $14
  $8045  18        CLC
  $8046  1C        .db $1C
  $8047  20 24 2E  JSR $2E24
  $804A  38        SEC
  $804B  42        .db $42
  $804C  4C 56 5A  JMP $5A56
  $804F  5E 68 72  LSR $7268,X
  $8052  86 9A     STX $9A
  $8054  9E        .db $9E
  $8055  B0 C2     BCS $8019
  $8057  CC D6 E0  CPY $E0D6
  $805A  EA        NOP
  $805B  F4        .db $F4
  $805C  FE 08 12  INC $1208,X
  $805F  20 2E 4C  JSR $4C2E
  $8062  66 7C     ROR $7C
  $8064  A2 C8     LDX #$C8
  $8066  E0 F8     CPX #$F8
  $8068  12        .db $12
  $8069  2C 46 60  BIT $6046
  $806C  7A        .db $7A
  $806D  94 AE     STY $AE,X
  $806F  C8        INY
  $8070  E2        .db $E2
  $8071  FC        .db $FC
  $8072  16 32     ASL $32,X
  $8074  4E 6C 86  LSR $866C
  $8077  A2 BC     LDX #$BC

L_8079:
  $8079  D6 F0     DEC $F0,X
  $807B  0A        ASL
  $807C  28        PLP
  $807D  42        .db $42
  $807E  5E 7C 98  LSR $987C,X
  $8081  B4 D0     LDY $D0,X
  $8083  EC 08 2A  CPX $2A08
  $8086  46 5C     LSR $5C
  $8088  76 8A     ROR $8A,X
  $808A  9E        .db $9E
  $808B  B2        .db $B2
  $808C  C6 DA     DEC $DA
  $808E  EE 02 16  INC $1602
  $8091  2A        ROL
  $8092  40        RTI
  $8093  5A        .db $5A
  $8094  74        .db $74
  $8095  8E A6 BE  STX $BEA6
  $8098  DA        .db $DA
  $8099  F4        .db $F4
  $809A  08        PHP
  $809B  20 34 4A  JSR $4A34
  $809E  64        .db $64
  $809F  7E 94 A4  ROR $A494,X
  $80A2  B8        CLV
  $80A3  DC        .db $DC
  $80A4  02        .db $02
  $80A5  28        PLP
  $80A6  50 74     BVC $811C
  $80A8  8C A8 C4  STY $C4A8
  $80AB  E2        .db $E2
  $80AC  FC        .db $FC
  $80AD  18        CLC
  $80AE  32        .db $32
  $80AF  44        .db $44
  $80B0  58        CLI
  $80B1  7A        .db $7A
  $80B2  9A        TXS
  $80B3  BC DE 02  LDY $02DE,X
  $80B6  22        .db $22
  $80B7  46 5A     LSR $5A
  $80B9  6A        ROR
  $80BA  8A        TXA
  $80BB  AC B6 00  LDY $00B6
  $80BE  4A        LSR
  $80BF  A8        TAY
  $80C0  06 40     ASL $40
  $80C2  7A        .db $7A
  $80C3  B4 BE     LDY $BE,X
  $80C5  C8        INY
  $80C6  DA        .db $DA
  $80C7  EC 00 14  CPX $1400
  $80CA  26 3C     ROL $3C
  $80CC  56 76     LSR $76,X
  $80CE  96 A4     STX $A4,Y
  $80D0  B2        .db $B2
  $80D1  C6 D6     DEC $D6
  $80D3  E6 08     INC $08
  $80D5  2A        ROL
  $80D6  2A        ROL
  $80D7  2A        ROL
  $80D8  2A        ROL
  $80D9  2A        ROL
  $80DA  2A        ROL
  $80DB  2A        ROL
  $80DC  2A        ROL
  $80DD  2A        ROL
  $80DE  2A        ROL
  $80DF  2A        ROL
  $80E0  FF        .db $FF
  $80E1  FF        .db $FF
  $80E2  FF        .db $FF
  $80E3  FF        .db $FF
  $80E4  FF        .db $FF
  $80E5  FF        .db $FF
  $80E6  FF        .db $FF
  $80E7  FF        .db $FF
  $80E8  FF        .db $FF
  $80E9  FF        .db $FF
  $80EA  FF        .db $FF
  $80EB  FF        .db $FF
  $80EC  FF        .db $FF
  $80ED  FF        .db $FF
  $80EE  FF        .db $FF
  $80EF  FF        .db $FF
  $80F0  FF        .db $FF
  $80F1  FF        .db $FF
  $80F2  FF        .db $FF
  $80F3  FF        .db $FF
  $80F4  FF        .db $FF
  $80F5  FF        .db $FF
  $80F6  FF        .db $FF
  $80F7  FF        .db $FF
  $80F8  FF        .db $FF
  $80F9  FF        .db $FF
  $80FA  FF        .db $FF
  $80FB  FF        .db $FF
  $80FC  FF        .db $FF
  $80FD  FF        .db $FF
  $80FE  FF        .db $FF
  $80FF  FF        .db $FF
  $8100  2A        ROL
  $8101  2A        ROL
  $8102  52        .db $52
  $8103  78        SEI
  $8104  9E        .db $9E
  $8105  A8        TAY
  $8106  B2        .db $B2
  $8107  BC C6 D0  LDY $D0C6,X
  $810A  DA        .db $DA
  $810B  E4 EE     CPX $EE
  $810D  F8        SED
  $810E  1A        .db $1A
  $810F  3C        .db $3C
  $8110  62        .db $62
  $8111  88        DEY
  $8112  A0 B8     LDY #$B8
  $8114  DA        .db $DA
  $8115  FC        .db $FC
  $8116  08        PHP
  $8117  14        .db $14
  $8118  20 2A 30  JSR $302A
  $811B  30 34     BMI $8151
  $811D  38        SEC
  $811E  62        .db $62
  $811F  8C B6 E0  STY $E0B6
  $8122  08        PHP
  $8123  32        .db $32
  $8124  50 6E     BVC $8194
  $8126  8C 96 AC  STY $AC96
  $8129  C2        .db $C2
  $812A  F0 1E     BEQ $814A
  $812C  4C 5A 72  JMP $725A
  $812F  8A        TXA

L_8130:
  $8130  A2 BA     LDX #$BA
  $8132  D2        .db $D2
  $8133  EA        NOP
  $8134  F4        .db $F4
  $8135  0E 28 42  ASL $4228
  $8138  56 6C     LSR $6C,X
  $813A  88        DEY
  $813B  A4 C8     LDY $C8
  $813D  EC 12 32  CPX $3212
  $8140  52        .db $52
  $8141  72        .db $72
  $8142  92        .db $92

L_8143:
  $8143  B2        .db $B2
  $8144  B6 BC     LDX $BC,Y
  $8146  DA        .db $DA
  $8147  F8        SED
  $8148  1A        .db $1A
  $8149  32        .db $32

L_814A:
  $814A  3A        .db $3A
  $814B  42        .db $42
  $814C  4A        LSR
  $814D  52        .db $52
  $814E  5A        .db $5A
  $814F  62        .db $62
  $8150  68        PLA

L_8151:
  $8151  6E 74 B4  ROR $B474
  $8154  F4        .db $F4
  $8155  3A        .db $3A
  $8156  4E 62 7E  LSR $7E62
  $8159  9A        TXS
  $815A  B6 D2     LDX $D2,Y
  $815C  F0 0E     BEQ $816C
  $815E  1A        .db $1A
  $815F  26 36     ROL $36
  $8161  46 5A     LSR $5A
  $8163  6E 7C 8A  ROR $8A7C
  $8166  B6 C0     LDX $C0,Y
  $8168  C4 CE     CPY $CE
  $816A  DC        .db $DC
  $816B  F0 12     BEQ $817F
  $816D  34        .db $34
  $816E  56 78     LSR $78,X
  $8170  82        .db $82
  $8171  8C B8 E2  STY $E2B8
  $8174  14        .db $14
  $8175  3E 48 52  ROL $5248,X
  $8178  A8        TAY
  $8179  04        .db $04
  $817A  0E 18 22  ASL $2218
  $817D  26 3A     ROL $3A

L_817F:
  $817F  3E 42 54  ROL $5442,X
  $8182  66 78     ROR $78
  $8184  8A        TXA
  $8185  94 9E     STY $9E,X
  $8187  B0 BA     BCS $8143
  $8189  C0 EE     CPY #$EE
  $818B  20 50 80  JSR $8050
  $818E  90 A0     BCC $8130
  $8190  AA        TAX
  $8191  B4 DE     LDY $DE,X
  $8193  00        BRK

L_8194:
  $8194  32        .db $32
  $8195  44        .db $44
  $8196  48        PHA
  $8197  4C 50 5A  JMP $5A50
  $819A  64        .db $64
  $819B  72        .db $72
  $819C  86 94     STX $94

L_819E:
  $819E  A8        TAY
  $819F  AE B2 B6  LDX $B6B2
  $81A2  BE C2 CA  LDX $CAC2,Y
  $81A5  D8        CLD
  $81A6  E6 F4     INC $F4
  $81A8  02        .db $02
  $81A9  10 1A     BPL $81C5
  $81AB  24 28     BIT $28
  $81AD  2C 36 40  BIT $4036
  $81B0  44        .db $44
  $81B1  48        PHA
  $81B2  52        .db $52
  $81B3  5C        .db $5C
  $81B4  66 6A     ROR $6A
  $81B6  6E 72 76  ROR $7672
  $81B9  7A        .db $7A
  $81BA  7E 82 88  ROR $8882,X
  $81BD  8E 94 9E  STX $9E94
  $81C0  A8        TAY
  $81C1  B2        .db $B2
  $81C2  BC C6 D0  LDY $D0C6,X

L_81C5:
  $81C5  DA        .db $DA
  $81C6  E4 EE     CPX $EE
  $81C8  F8        SED
  $81C9  02        .db $02
  $81CA  24 46     BIT $46
  $81CC  68        PLA
  $81CD  8A        TXA
  $81CE  94 9E     STY $9E,X
  $81D0  A4 AE     LDY $AE
  $81D2  B8        CLV
  $81D3  C2        .db $C2
  $81D4  DE F4 10  DEC $10F4,X
  $81D7  2C 3A 48  BIT $483A
  $81DA  66 6C     ROR $6C
  $81DC  72        .db $72
  $81DD  76 7A     ROR $7A,X
  $81DF  7E 84 8A  ROR $8A84,X
  $81E2  90 9A     BCC $817E
  $81E4  A4 AA     LDY $AA
  $81E6  B0 B6     BCS $819E
  $81E8  B6 B6     LDX $B6,Y
  $81EA  B6 B6     LDX $B6,Y
  $81EC  B6 B6     LDX $B6,Y
  $81EE  B6 B6     LDX $B6,Y
  $81F0  FF        .db $FF
  $81F1  FF        .db $FF
  $81F2  FF        .db $FF
  $81F3  FF        .db $FF
  $81F4  FF        .db $FF
  $81F5  FF        .db $FF
  $81F6  FF        .db $FF
  $81F7  FF        .db $FF
  $81F8  FF        .db $FF
  $81F9  FF        .db $FF
  $81FA  FF        .db $FF
  $81FB  FF        .db $FF
  $81FC  FF        .db $FF
  $81FD  FF        .db $FF
  $81FE  FF        .db $FF
  $81FF  FF        .db $FF
  $8200  87        .db $87
  $8201  87        .db $87
  $8202  87        .db $87
  $8203  87        .db $87
  $8204  87        .db $87
  $8205  87        .db $87
  $8206  87        .db $87
  $8207  87        .db $87
  $8208  87        .db $87
  $8209  87        .db $87
  $820A  87        .db $87
  $820B  87        .db $87
  $820C  87        .db $87
  $820D  88        DEY
  $820E  88        DEY
  $820F  88        DEY
  $8210  88        DEY
  $8211  88        DEY
  $8212  88        DEY
  $8213  88        DEY
  $8214  88        DEY
  $8215  88        DEY

L_8216:
  $8216  88        DEY
  $8217  88        DEY

L_8218:
  $8218  88        DEY
  $8219  88        DEY

L_821A:
  $821A  88        DEY
  $821B  89        .db $89

L_821C:
  $821C  89        .db $89
  $821D  89        .db $89

L_821E:
  $821E  89        .db $89
  $821F  89        .db $89
  $8220  89        .db $89

L_8221:
  $8221  89        .db $89
  $8222  89        .db $89
  $8223  89        .db $89
  $8224  89        .db $89
  $8225  89        .db $89
  $8226  89        .db $89
  $8227  89        .db $89
  $8228  89        .db $89
  $8229  89        .db $89
  $822A  89        .db $89
  $822B  89        .db $89
  $822C  89        .db $89
  $822D  89        .db $89
  $822E  89        .db $89
  $822F  89        .db $89
  $8230  89        .db $89
  $8231  8A        TXA
  $8232  8A        TXA
  $8233  8A        TXA
  $8234  8A        TXA
  $8235  8A        TXA
  $8236  8A        TXA
  $8237  8A        TXA
  $8238  8A        TXA
  $8239  8A        TXA
  $823A  8A        TXA
  $823B  8A        TXA
  $823C  8A        TXA
  $823D  8A        TXA
  $823E  8A        TXA
  $823F  8A        TXA
  $8240  8A        TXA
  $8241  8A        TXA
  $8242  8B        .db $8B
  $8243  8B        .db $8B
  $8244  8B        .db $8B
  $8245  8B        .db $8B
  $8246  8B        .db $8B
  $8247  8B        .db $8B
  $8248  8B        .db $8B
  $8249  8B        .db $8B
  $824A  8B        .db $8B
  $824B  8B        .db $8B
  $824C  8B        .db $8B
  $824D  8B        .db $8B
  $824E  8B        .db $8B
  $824F  8B        .db $8B
  $8250  8B        .db $8B
  $8251  8B        .db $8B
  $8252  8B        .db $8B
  $8253  8B        .db $8B
  $8254  8B        .db $8B
  $8255  8B        .db $8B
  $8256  8B        .db $8B
  $8257  8B        .db $8B
  $8258  8B        .db $8B
  $8259  8B        .db $8B
  $825A  8B        .db $8B
  $825B  8B        .db $8B
  $825C  8B        .db $8B
  $825D  8C 8C 8C  STY $8C8C
  $8260  8C 8C 8C  STY $8C8C
  $8263  8C 8C 8C  STY $8C8C
  $8266  8C 8C 8D  STY $8D8C
  $8269  8D 8D 8D  STA $8D8D
  $826C  8D 8D 8D  STA $8D8D
  $826F  8D 8D 8D  STA $8D8D
  $8272  8E 8E 8E  STX $8E8E
  $8275  8E 8E 8E  STX $8E8E
  $8278  8E 8E 8E  STX $8E8E
  $827B  8F        .db $8F
  $827C  8F        .db $8F
  $827D  8F        .db $8F
  $827E  8F        .db $8F
  $827F  8F        .db $8F
  $8280  8F        .db $8F
  $8281  8F        .db $8F
  $8282  8F        .db $8F
  $8283  8F        .db $8F
  $8284  90 90     BCC $8216
  $8286  90 90     BCC $8218
  $8288  90 90     BCC $821A
  $828A  90 90     BCC $821C
  $828C  90 90     BCC $821E
  $828E  90 91     BCC $8221
  $8290  91 91     STA ($91),Y
  $8292  91 91     STA ($91),Y
  $8294  91 91     STA ($91),Y
  $8296  91 91     STA ($91),Y
  $8298  91 91     STA ($91),Y
  $829A  92        .db $92
  $829B  92        .db $92
  $829C  92        .db $92
  $829D  92        .db $92
  $829E  92        .db $92
  $829F  92        .db $92
  $82A0  92        .db $92
  $82A1  92        .db $92
  $82A2  92        .db $92
  $82A3  92        .db $92
  $82A4  93        .db $93
  $82A5  93        .db $93
  $82A6  93        .db $93
  $82A7  93        .db $93
  $82A8  93        .db $93
  $82A9  93        .db $93
  $82AA  93        .db $93
  $82AB  93        .db $93
  $82AC  93        .db $93
  $82AD  94 94     STY $94,X
  $82AF  94 94     STY $94,X
  $82B1  94 94     STY $94,X
  $82B3  94 94     STY $94,X
  $82B5  95 95     STA $95,X
  $82B7  95 95     STA $95,X
  $82B9  95 95     STA $95,X
  $82BB  95 95     STA $95,X
  $82BD  96 96     STX $96,Y
  $82BF  96 97     STX $97,Y
  $82C1  97        .db $97
  $82C2  97        .db $97
  $82C3  97        .db $97
  $82C4  97        .db $97
  $82C5  97        .db $97
  $82C6  97        .db $97
  $82C7  97        .db $97
  $82C8  98        TYA
  $82C9  98        TYA
  $82CA  98        TYA
  $82CB  98        TYA
  $82CC  98        TYA
  $82CD  98        TYA
  $82CE  98        TYA
  $82CF  98        TYA
  $82D0  98        TYA
  $82D1  98        TYA
  $82D2  98        TYA
  $82D3  98        TYA
  $82D4  99 99 99  STA $9999,Y
  $82D7  99 99 99  STA $9999,Y
  $82DA  99 99 99  STA $9999,Y
  $82DD  99 99 99  STA $9999,Y
  $82E0  FF        .db $FF
  $82E1  FF        .db $FF
  $82E2  FF        .db $FF
  $82E3  FF        .db $FF
  $82E4  FF        .db $FF
  $82E5  FF        .db $FF
  $82E6  FF        .db $FF
  $82E7  FF        .db $FF
  $82E8  FF        .db $FF
  $82E9  FF        .db $FF
  $82EA  FF        .db $FF
  $82EB  FF        .db $FF
  $82EC  FF        .db $FF
  $82ED  FF        .db $FF
  $82EE  FF        .db $FF
  $82EF  FF        .db $FF
  $82F0  FF        .db $FF
  $82F1  FF        .db $FF
  $82F2  FF        .db $FF
  $82F3  FF        .db $FF
  $82F4  FF        .db $FF
  $82F5  FF        .db $FF
  $82F6  FF        .db $FF
  $82F7  FF        .db $FF
  $82F8  FF        .db $FF
  $82F9  FF        .db $FF
  $82FA  FF        .db $FF
  $82FB  FF        .db $FF
  $82FC  FF        .db $FF
  $82FD  FF        .db $FF
  $82FE  FF        .db $FF
  $82FF  FF        .db $FF
  $8300  99 99 99  STA $9999,Y
  $8303  99 99 99  STA $9999,Y
  $8306  99 99 99  STA $9999,Y
  $8309  99 99 99  STA $9999,Y
  $830C  99 99 9A  STA $9A99,Y
  $830F  9A        TXS
  $8310  9A        TXS
  $8311  9A        TXS
  $8312  9A        TXS
  $8313  9A        TXS
  $8314  9A        TXS
  $8315  9A        TXS
  $8316  9B        .db $9B
  $8317  9B        .db $9B
  $8318  9B        .db $9B
  $8319  9B        .db $9B
  $831A  9B        .db $9B
  $831B  9B        .db $9B
  $831C  9B        .db $9B
  $831D  9B        .db $9B
  $831E  9B        .db $9B
  $831F  9B        .db $9B
  $8320  9B        .db $9B
  $8321  9B        .db $9B
  $8322  9C        .db $9C
  $8323  9C        .db $9C
  $8324  9C        .db $9C
  $8325  9C        .db $9C
  $8326  9C        .db $9C
  $8327  9C        .db $9C
  $8328  9C        .db $9C
  $8329  9C        .db $9C
  $832A  9C        .db $9C
  $832B  9D 9D 9D  STA $9D9D,X
  $832E  9D 9D 9D  STA $9D9D,X
  $8331  9D 9D 9D  STA $9D9D,X
  $8334  9D 9E 9E  STA $9E9E,X
  $8337  9E        .db $9E
  $8338  9E        .db $9E
  $8339  9E        .db $9E
  $833A  9E        .db $9E
  $833B  9E        .db $9E
  $833C  9E        .db $9E
  $833D  9E        .db $9E
  $833E  9F        .db $9F
  $833F  9F        .db $9F
  $8340  9F        .db $9F
  $8341  9F        .db $9F
  $8342  9F        .db $9F
  $8343  9F        .db $9F
  $8344  9F        .db $9F
  $8345  9F        .db $9F
  $8346  9F        .db $9F
  $8347  9F        .db $9F
  $8348  A0 A0     LDY #$A0
  $834A  A0 A0     LDY #$A0
  $834C  A0 A0     LDY #$A0
  $834E  A0 A0     LDY #$A0
  $8350  A0 A0     LDY #$A0
  $8352  A0 A0     LDY #$A0
  $8354  A0 A1     LDY #$A1
  $8356  A1 A1     LDA ($A1,X)
  $8358  A1 A1     LDA ($A1,X)
  $835A  A1 A1     LDA ($A1,X)
  $835C  A1 A2     LDA ($A2,X)
  $835E  A2 A2     LDX #$A2
  $8360  A2 A2     LDX #$A2
  $8362  A2 A2     LDX #$A2
  $8364  A2 A2     LDX #$A2
  $8366  A2 A2     LDX #$A2
  $8368  A2 A2     LDX #$A2
  $836A  A2 A2     LDX #$A2
  $836C  A3        .db $A3
  $836D  A3        .db $A3
  $836E  A3        .db $A3
  $836F  A3        .db $A3
  $8370  A3        .db $A3
  $8371  A3        .db $A3
  $8372  A3        .db $A3
  $8373  A3        .db $A3
  $8374  A4 A4     LDY $A4
  $8376  A4 A4     LDY $A4
  $8378  A4 A5     LDY $A5
  $837A  A5 A5     LDA $A5
  $837C  A5 A5     LDA $A5
  $837E  A5 A5     LDA $A5
  $8380  A5 A5     LDA $A5
  $8382  A5 A5     LDA $A5
  $8384  A5 A5     LDA $A5
  $8386  A5 A5     LDA $A5
  $8388  A5 A5     LDA $A5
  $838A  A5 A6     LDA $A6
  $838C  A6 A6     LDX $A6
  $838E  A6 A6     LDX $A6
  $8390  A6 A6     LDX $A6
  $8392  A6 A7     LDX $A7
  $8394  A7        .db $A7
  $8395  A7        .db $A7
  $8396  A7        .db $A7
  $8397  A7        .db $A7
  $8398  A7        .db $A7
  $8399  A7        .db $A7
  $839A  A7        .db $A7
  $839B  A7        .db $A7
  $839C  A7        .db $A7
  $839D  A7        .db $A7
  $839E  A7        .db $A7
  $839F  A7        .db $A7
  $83A0  A7        .db $A7
  $83A1  A7        .db $A7
  $83A2  A7        .db $A7
  $83A3  A7        .db $A7
  $83A4  A7        .db $A7
  $83A5  A7        .db $A7
  $83A6  A7        .db $A7
  $83A7  A7        .db $A7
  $83A8  A8        TAY
  $83A9  A8        TAY
  $83AA  A8        TAY
  $83AB  A8        TAY
  $83AC  A8        TAY
  $83AD  A8        TAY
  $83AE  A8        TAY
  $83AF  A8        TAY
  $83B0  A8        TAY
  $83B1  A8        TAY
  $83B2  A8        TAY
  $83B3  A8        TAY
  $83B4  A8        TAY
  $83B5  A8        TAY
  $83B6  A8        TAY
  $83B7  A8        TAY
  $83B8  A8        TAY
  $83B9  A8        TAY
  $83BA  A8        TAY
  $83BB  A8        TAY
  $83BC  A8        TAY
  $83BD  A8        TAY
  $83BE  A8        TAY
  $83BF  A8        TAY
  $83C0  A8        TAY
  $83C1  A8        TAY
  $83C2  A8        TAY
  $83C3  A8        TAY
  $83C4  A8        TAY
  $83C5  A8        TAY
  $83C6  A8        TAY
  $83C7  A8        TAY
  $83C8  A8        TAY
  $83C9  A9 A9     LDA #$A9
  $83CB  A9 A9     LDA #$A9
  $83CD  A9 A9     LDA #$A9
  $83CF  A9 A9     LDA #$A9
  $83D1  A9 A9     LDA #$A9
  $83D3  A9 A9     LDA #$A9
  $83D5  A9 AA     LDA #$AA
  $83D7  AA        TAX
  $83D8  AA        TAX
  $83D9  AA        TAX
  $83DA  AA        TAX
  $83DB  AA        TAX
  $83DC  AA        TAX
  $83DD  AA        TAX
  $83DE  AA        TAX

L_83DF:
  $83DF  AA        TAX
  $83E0  AA        TAX
  $83E1  AA        TAX
  $83E2  AA        TAX
  $83E3  AA        TAX
  $83E4  AA        TAX
  $83E5  AA        TAX
  $83E6  AA        TAX
  $83E7  AA        TAX
  $83E8  AA        TAX
  $83E9  AA        TAX
  $83EA  AA        TAX
  $83EB  AA        TAX
  $83EC  AA        TAX
  $83ED  AA        TAX
  $83EE  AA        TAX
  $83EF  AA        TAX
  $83F0  FF        .db $FF
  $83F1  FF        .db $FF
  $83F2  FF        .db $FF
  $83F3  FF        .db $FF
  $83F4  FF        .db $FF
  $83F5  FF        .db $FF
  $83F6  FF        .db $FF
  $83F7  FF        .db $FF
  $83F8  FF        .db $FF
  $83F9  FF        .db $FF
  $83FA  FF        .db $FF
  $83FB  FF        .db $FF
  $83FC  FF        .db $FF
  $83FD  FF        .db $FF
  $83FE  FF        .db $FF
  $83FF  FF        .db $FF
  $8400  B4 D0     LDY $D0,X
  $8402  E4 F6     CPX $F6
  $8404  0A        ASL
  $8405  20 36 4C  JSR $4C36
  $8408  60        RTS
  $8409  72        .db $72
  $840A  86 94     STX $94
  $840C  A6 BC     LDX $BC
  $840E  C2        .db $C2
  $840F  C2        .db $C2
  $8410  C2        .db $C2
  $8411  E8        INX
  $8412  0C        .db $0C
  $8413  30 50     BMI $8465
  $8415  74        .db $74
  $8416  8A        TXA
  $8417  A0 CC     LDY #$CC
  $8419  D6 FE     DEC $FE,X
  $841B  26 4E     ROL $4E
  $841D  76 92     ROR $92,X
  $841F  AE CA F6  LDX $F6CA
  $8422  0C        .db $0C
  $8423  22        .db $22
  $8424  34        .db $34
  $8425  44        .db $44
  $8426  5C        .db $5C
  $8427  7E A0 C4  ROR $C4A0,X
  $842A  E2        .db $E2
  $842B  E6 06     INC $06
  $842D  1C        .db $1C
  $842E  3A        .db $3A
  $842F  96 9E     STX $9E,Y
  $8431  DC        .db $DC
  $8432  1A        .db $1A
  $8433  5E 7A 88  LSR $887A,X
  $8436  9A        TXS
  $8437  A6 B2     LDX $B2
  $8439  C4 D0     CPY $D0
  $843B  F8        SED
  $843C  18        CLC
  $843D  38        SEC
  $843E  62        .db $62
  $843F  92        .db $92
  $8440  E6 40     INC $40
  $8442  44        .db $44
  $8443  5E 72 82  LSR $8272,X
  $8446  86 B2     STX $B2
  $8448  E2        .db $E2
  $8449  10 3E     BPL $8489
  $844B  4C 5A 7A  JMP $7A5A
  $844E  B2        .db $B2
  $844F  D8        CLD
  $8450  02        .db $02
  $8451  0E 1A 2C  ASL $2C1A
  $8454  3E 46 48  ROL $4846,X
  $8457  4A        LSR
  $8458  4C 52 58  JMP $5852
  $845B  70 82     BVS $83DF
  $845D  94 A6     STY $A6,X
  $845F  AE BE C6  LDX $C6BE
  $8462  CE DA E2  DEC $E2DA

L_8465:
  $8465  EA        NOP
  $8466  0E 26 3C  ASL $3C26
  $8469  52        .db $52
  $846A  6A        ROR
  $846B  82        .db $82
  $846C  9A        TXS
  $846D  B2        .db $B2
  $846E  CE E6 FE  DEC $FEE6
  $8471  16 30     ASL $30,X
  $8473  4A        LSR
  $8474  64        .db $64
  $8475  7E 92 B2  ROR $B292,X
  $8478  C6 DE     DEC $DE
  $847A  F6 0E     INC $0E,X
  $847C  24 3A     BIT $3A
  $847E  54        .db $54
  $847F  6C 80 98  JMP ($9880)
  $8482  AA        TAX
  $8483  C2        .db $C2
  $8484  D6 E4     DEC $E4,X
  $8486  06 2A     ASL $2A
  $8488  50 72     BVC $84FC
  $848A  8A        TXA
  $848B  A4 BE     LDY $BE
  $848D  DA        .db $DA
  $848E  F2        .db $F2
  $848F  0C        .db $0C
  $8490  1C        .db $1C
  $8491  2E 80 A0  ROL $A080
  $8494  BE DC FE  LDX $FEDC,Y
  $8497  1E 3E 5E  ASL $5E3E,X
  $849A  7E 98 AC  ROR $AC98,X
  $849D  C6 E0     DEC $E0
  $849F  FE 1E 2C  INC $2C1E,X
  $84A2  34        .db $34
  $84A3  34        .db $34
  $84A4  FF        .db $FF
  $84A5  FF        .db $FF
  $84A6  FF        .db $FF
  $84A7  FF        .db $FF
  $84A8  FF        .db $FF
  $84A9  FF        .db $FF
  $84AA  FF        .db $FF
  $84AB  FF        .db $FF
  $84AC  FF        .db $FF
  $84AD  FF        .db $FF
  $84AE  FF        .db $FF
  $84AF  FF        .db $FF
  $84B0  FF        .db $FF
  $84B1  FF        .db $FF
  $84B2  FF        .db $FF
  $84B3  FF        .db $FF
  $84B4  FF        .db $FF
  $84B5  FF        .db $FF
  $84B6  FF        .db $FF
  $84B7  FF        .db $FF
  $84B8  FF        .db $FF
  $84B9  FF        .db $FF
  $84BA  FF        .db $FF
  $84BB  FF        .db $FF
  $84BC  FF        .db $FF
  $84BD  FF        .db $FF
  $84BE  FF        .db $FF
  $84BF  FF        .db $FF
  $84C0  FF        .db $FF
  $84C1  FF        .db $FF
  $84C2  FF        .db $FF
  $84C3  FF        .db $FF
  $84C4  FF        .db $FF
  $84C5  FF        .db $FF
  $84C6  FF        .db $FF
  $84C7  FF        .db $FF
  $84C8  FF        .db $FF
  $84C9  FF        .db $FF
  $84CA  FF        .db $FF
  $84CB  FF        .db $FF
  $84CC  FF        .db $FF
  $84CD  FF        .db $FF
  $84CE  FF        .db $FF
  $84CF  FF        .db $FF
  $84D0  FF        .db $FF
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
  $84DD  FF        .db $FF
  $84DE  FF        .db $FF
  $84DF  FF        .db $FF
  $84E0  FF        .db $FF
  $84E1  FF        .db $FF
  $84E2  FF        .db $FF
  $84E3  FF        .db $FF

L_84E4:
  $84E4  FF        .db $FF
  $84E5  FF        .db $FF

L_84E6:
  $84E6  FF        .db $FF
  $84E7  FF        .db $FF

L_84E8:
  $84E8  FF        .db $FF
  $84E9  FF        .db $FF

L_84EA:
  $84EA  FF        .db $FF
  $84EB  FF        .db $FF

L_84EC:
  $84EC  FF        .db $FF
  $84ED  FF        .db $FF
  $84EE  FF        .db $FF
  $84EF  FF        .db $FF
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
  $84FA  FF        .db $FF
  $84FB  FF        .db $FF

L_84FC:
  $84FC  FF        .db $FF
  $84FD  FF        .db $FF
  $84FE  FF        .db $FF
  $84FF  FF        .db $FF
  $8500  AA        TAX
  $8501  AA        TAX
  $8502  AA        TAX
  $8503  AA        TAX
  $8504  AB        .db $AB
  $8505  AB        .db $AB
  $8506  AB        .db $AB
  $8507  AB        .db $AB
  $8508  AB        .db $AB
  $8509  AB        .db $AB
  $850A  AB        .db $AB
  $850B  AB        .db $AB
  $850C  AB        .db $AB
  $850D  AB        .db $AB
  $850E  AB        .db $AB
  $850F  AB        .db $AB
  $8510  AB        .db $AB
  $8511  AB        .db $AB
  $8512  AC AC AC  LDY $ACAC
  $8515  AC AC AC  LDY $ACAC
  $8518  AC AC AC  LDY $ACAC
  $851B  AD AD AD  LDA $ADAD
  $851E  AD AD AD  LDA $ADAD
  $8521  AD AE AE  LDA $AEAE
  $8524  AE AE AE  LDX $AEAE
  $8527  AE AE AE  LDX $AEAE
  $852A  AE AE AF  LDX $AFAE
  $852D  AF        .db $AF
  $852E  AF        .db $AF
  $852F  AF        .db $AF
  $8530  AF        .db $AF
  $8531  AF        .db $AF
  $8532  B0 B0     BCS $84E4
  $8534  B0 B0     BCS $84E6
  $8536  B0 B0     BCS $84E8
  $8538  B0 B0     BCS $84EA
  $853A  B0 B0     BCS $84EC
  $853C  B1 B1     LDA ($B1),Y
  $853E  B1 B1     LDA ($B1),Y
  $8540  B1 B2     LDA ($B2),Y
  $8542  B2        .db $B2
  $8543  B2        .db $B2
  $8544  B2        .db $B2
  $8545  B2        .db $B2
  $8546  B2        .db $B2
  $8547  B2        .db $B2
  $8548  B2        .db $B2
  $8549  B3        .db $B3
  $854A  B3        .db $B3
  $854B  B3        .db $B3
  $854C  B3        .db $B3
  $854D  B3        .db $B3
  $854E  B3        .db $B3
  $854F  B3        .db $B3
  $8550  B4 B4     LDY $B4,X
  $8552  B4 B4     LDY $B4,X
  $8554  B4 B4     LDY $B4,X
  $8556  B4 B4     LDY $B4,X
  $8558  B4 B4     LDY $B4,X
  $855A  B4 B4     LDY $B4,X
  $855C  B4 B4     LDY $B4,X
  $855E  B4 B4     LDY $B4,X
  $8560  B4 B4     LDY $B4,X
  $8562  B4 B4     LDY $B4,X
  $8564  B4 B4     LDY $B4,X
  $8566  B5 B5     LDA $B5,X
  $8568  B5 B5     LDA $B5,X
  $856A  B5 B5     LDA $B5,X
  $856C  B5 B5     LDA $B5,X
  $856E  B5 B5     LDA $B5,X
  $8570  B5 B6     LDA $B6,X
  $8572  B6 B6     LDX $B6,Y
  $8574  B6 B6     LDX $B6,Y
  $8576  B6 B6     LDX $B6,Y
  $8578  B6 B6     LDX $B6,Y
  $857A  B6 B7     LDX $B7,Y
  $857C  B7        .db $B7
  $857D  B7        .db $B7
  $857E  B7        .db $B7
  $857F  B7        .db $B7
  $8580  B7        .db $B7
  $8581  B7        .db $B7
  $8582  B7        .db $B7
  $8583  B7        .db $B7
  $8584  B7        .db $B7
  $8585  B7        .db $B7
  $8586  B8        CLV
  $8587  B8        CLV
  $8588  B8        CLV
  $8589  B8        CLV
  $858A  B8        CLV
  $858B  B8        CLV
  $858C  B8        CLV
  $858D  B8        CLV
  $858E  B8        CLV
  $858F  B9 B9 B9  LDA $B9B9,Y
  $8592  B9 B9 B9  LDA $B9B9,Y
  $8595  B9 B9 BA  LDA $BAB9,Y
  $8598  BA        TSX
  $8599  BA        TSX
  $859A  BA        TSX
  $859B  BA        TSX
  $859C  BA        TSX
  $859D  BA        TSX
  $859E  BA        TSX
  $859F  BA        TSX
  $85A0  BB        .db $BB
  $85A1  BB        .db $BB
  $85A2  BB        .db $BB
  $85A3  BB        .db $BB
  $85A4  FF        .db $FF
  $85A5  FF        .db $FF
  $85A6  FF        .db $FF
  $85A7  FF        .db $FF
  $85A8  FF        .db $FF
  $85A9  FF        .db $FF
  $85AA  FF        .db $FF
  $85AB  FF        .db $FF
  $85AC  FF        .db $FF
  $85AD  FF        .db $FF
  $85AE  FF        .db $FF
  $85AF  FF        .db $FF
  $85B0  FF        .db $FF
  $85B1  FF        .db $FF
  $85B2  FF        .db $FF
  $85B3  FF        .db $FF
  $85B4  FF        .db $FF
  $85B5  FF        .db $FF
  $85B6  FF        .db $FF
  $85B7  FF        .db $FF
  $85B8  FF        .db $FF
  $85B9  FF        .db $FF
  $85BA  FF        .db $FF
  $85BB  FF        .db $FF
  $85BC  FF        .db $FF
  $85BD  FF        .db $FF
  $85BE  FF        .db $FF
  $85BF  FF        .db $FF
  $85C0  FF        .db $FF
  $85C1  FF        .db $FF
  $85C2  FF        .db $FF
  $85C3  FF        .db $FF
  $85C4  FF        .db $FF
  $85C5  FF        .db $FF
  $85C6  FF        .db $FF
  $85C7  FF        .db $FF
  $85C8  FF        .db $FF
  $85C9  FF        .db $FF
  $85CA  FF        .db $FF
  $85CB  FF        .db $FF
  $85CC  FF        .db $FF
  $85CD  FF        .db $FF
  $85CE  FF        .db $FF
  $85CF  FF        .db $FF
  $85D0  FF        .db $FF
  $85D1  FF        .db $FF
  $85D2  FF        .db $FF
  $85D3  FF        .db $FF
  $85D4  FF        .db $FF
  $85D5  FF        .db $FF
  $85D6  FF        .db $FF
  $85D7  FF        .db $FF
  $85D8  FF        .db $FF
  $85D9  FF        .db $FF
  $85DA  FF        .db $FF
  $85DB  FF        .db $FF
  $85DC  FF        .db $FF
  $85DD  FF        .db $FF
  $85DE  FF        .db $FF
  $85DF  FF        .db $FF
  $85E0  FF        .db $FF
  $85E1  FF        .db $FF
  $85E2  FF        .db $FF
  $85E3  FF        .db $FF
  $85E4  FF        .db $FF
  $85E5  FF        .db $FF
  $85E6  FF        .db $FF
  $85E7  FF        .db $FF
  $85E8  FF        .db $FF
  $85E9  FF        .db $FF
  $85EA  FF        .db $FF
  $85EB  FF        .db $FF
  $85EC  FF        .db $FF
  $85ED  FF        .db $FF
  $85EE  FF        .db $FF
  $85EF  FF        .db $FF
  $85F0  FF        .db $FF
  $85F1  FF        .db $FF
  $85F2  FF        .db $FF
  $85F3  FF        .db $FF
  $85F4  FF        .db $FF
  $85F5  FF        .db $FF
  $85F6  FF        .db $FF
  $85F7  FF        .db $FF
  $85F8  FF        .db $FF
  $85F9  FF        .db $FF
  $85FA  FF        .db $FF
  $85FB  FF        .db $FF
  $85FC  FF        .db $FF
  $85FD  FF        .db $FF
  $85FE  FF        .db $FF
  $85FF  FF        .db $FF
  $8600  F8        SED
  $8601  F7        .db $F7
  $8602  F6 F5     INC $F5,X
  $8604  F4        .db $F4
  $8605  F3        .db $F3
  $8606  F2        .db $F2
  $8607  F1 F0     SBC ($F0),Y
  $8609  EF        .db $EF
  $860A  EE ED EC  INC $ECED
  $860D  EB        .db $EB
  $860E  EA        NOP
  $860F  E9 E8     SBC #$E8
  $8611  E7        .db $E7
  $8612  E6 E5     INC $E5
  $8614  E4 E3     CPX $E3
  $8616  E2        .db $E2
  $8617  E1 E0     SBC ($E0,X)
  $8619  DF        .db $DF
  $861A  DE DD DC  DEC $DCDD,X
  $861D  DB        .db $DB
  $861E  DA        .db $DA
  $861F  D9 D8 D7  CMP $D7D8,Y
  $8622  D6 D5     DEC $D5,X
  $8624  D4        .db $D4
  $8625  D3        .db $D3
  $8626  D2        .db $D2
  $8627  D1 D0     CMP ($D0),Y
  $8629  CF        .db $CF
  $862A  CE CD CC  DEC $CCCD
  $862D  CB        .db $CB
  $862E  CA        DEX
  $862F  C9 C8     CMP #$C8
  $8631  C7        .db $C7
  $8632  C6 C5     DEC $C5
  $8634  C4 C3     CPY $C3
  $8636  C2        .db $C2
  $8637  C1 C0     CMP ($C0,X)
  $8639  BF        .db $BF
  $863A  BE BD BC  LDX $BCBD,Y
  $863D  BB        .db $BB
  $863E  BA        TSX
  $863F  B9 B8 B7  LDA $B7B8,Y
  $8642  B6 B5     LDX $B5,Y
  $8644  B4 B3     LDY $B3,X
  $8646  B2        .db $B2
  $8647  B1 B0     LDA ($B0),Y
  $8649  AF        .db $AF
  $864A  AE AD AC  LDX $ACAD
  $864D  AB        .db $AB
  $864E  AA        TAX
  $864F  A9 A8     LDA #$A8
  $8651  A7        .db $A7
  $8652  A6 A5     LDX $A5
  $8654  A4 A3     LDY $A3
  $8656  A2 A1     LDX #$A1
  $8658  A0 9F     LDY #$9F
  $865A  9E        .db $9E
  $865B  9D 9C 9B  STA $9B9C,X
  $865E  9A        TXS
  $865F  99 98 97  STA $9798,Y
  $8662  96 95     STX $95,Y
  $8664  94 93     STY $93,X
  $8666  92        .db $92
  $8667  91 90     STA ($90),Y
  $8669  8F        .db $8F
  $866A  8E 8D 8C  STX $8C8D
  $866D  8B        .db $8B
  $866E  8A        TXA
  $866F  89        .db $89
  $8670  88        DEY
  $8671  87        .db $87
  $8672  86 85     STX $85
  $8674  84 83     STY $83
  $8676  82        .db $82
  $8677  81 80     STA ($80,X)
  $8679  7F        .db $7F
  $867A  7E 7D 7C  ROR $7C7D,X
  $867D  7B        .db $7B
  $867E  7A        .db $7A
  $867F  79 78 77  ADC $7778,Y
  $8682  76 75     ROR $75,X
  $8684  74        .db $74
  $8685  73        .db $73
  $8686  72        .db $72
  $8687  71 70     ADC ($70),Y
  $8689  6F        .db $6F
  $868A  6E 6D 6C  ROR $6C6D
  $868D  6B        .db $6B
  $868E  6A        ROR
  $868F  69 68     ADC #$68
  $8691  67        .db $67
  $8692  66 65     ROR $65
  $8694  64        .db $64
  $8695  63        .db $63
  $8696  62        .db $62
  $8697  61 60     ADC ($60,X)
  $8699  5F        .db $5F
  $869A  5E 5D 5C  LSR $5C5D,X
  $869D  5B        .db $5B
  $869E  5A        .db $5A
  $869F  59 58 57  EOR $5758,Y
  $86A2  56 55     LSR $55,X
  $86A4  54        .db $54
  $86A5  53        .db $53
  $86A6  52        .db $52
  $86A7  51 50     EOR ($50),Y
  $86A9  4F        .db $4F
  $86AA  4E 4D 4C  LSR $4C4D
  $86AD  4B        .db $4B
  $86AE  4A        LSR
  $86AF  49 48     EOR #$48
  $86B1  47        .db $47
  $86B2  46 45     LSR $45
  $86B4  44        .db $44
  $86B5  43        .db $43
  $86B6  42        .db $42
  $86B7  41 40     EOR ($40,X)
  $86B9  3F        .db $3F
  $86BA  3E 3D 3C  ROL $3C3D,X
  $86BD  3B        .db $3B
  $86BE  3A        .db $3A
  $86BF  39 38 37  AND $3738,Y
  $86C2  36 35     ROL $35,X
  $86C4  34        .db $34
  $86C5  33        .db $33
  $86C6  32        .db $32
  $86C7  31 30     AND ($30),Y
  $86C9  2F        .db $2F
  $86CA  2E 2D 2C  ROL $2C2D
  $86CD  2B        .db $2B
  $86CE  2A        ROL
  $86CF  29 28     AND #$28
  $86D1  27        .db $27
  $86D2  26 25     ROL $25
  $86D4  24 23     BIT $23
  $86D6  22        .db $22
  $86D7  21 20     AND ($20,X)
  $86D9  1F        .db $1F
  $86DA  1E 1D 1C  ASL $1C1D,X
  $86DD  1B        .db $1B
  $86DE  1A        .db $1A
  $86DF  19 18 17  ORA $1718,Y
  $86E2  16 15     ASL $15,X
  $86E4  14        .db $14
  $86E5  13        .db $13
  $86E6  12        .db $12
  $86E7  11 10     ORA ($10),Y
  $86E9  0F        .db $0F
  $86EA  0E 0D 0C  ASL $0C0D
  $86ED  0B        .db $0B
  $86EE  0A        ASL
  $86EF  09 08     ORA #$08
  $86F1  07        .db $07
  $86F2  06 05     ASL $05
  $86F4  04        .db $04
  $86F5  03        .db $03
  $86F6  02        .db $02
  $86F7  01 00     ORA ($00,X)
  $86F9  FF        .db $FF
  $86FA  FE FD FC  INC $FCFD,X
  $86FD  FB        .db $FB
  $86FE  FA        .db $FA
  $86FF  F9 0A 01  SBC $010A,Y
  $8702  01 00     ORA ($00,X)
  $8704  02        .db $02
  $8705  00        BRK
  $8706  11 00     ORA ($00),Y
  $8708  12        .db $12
  $8709  00        BRK
  $870A  21 00     AND ($00,X)
  $870C  22        .db $22
  $870D  00        BRK
  $870E  23        .db $23
  $870F  00        BRK
  $8710  00        BRK
  $8711  01 13     ORA ($13,X)
  $8713  00        BRK
  $8714  10 00     BPL $8716

L_8716:
  $8716  09 01     ORA #$01
  $8718  01 00     ORA ($00,X)
  $871A  05 00     ORA $00
  $871C  14        .db $14
  $871D  00        BRK
  $871E  15 00     ORA $00,X
  $8720  24 00     BIT $00
  $8722  25 00     AND $00
  $8724  26 00     ROL $00
  $8726  00        BRK
  $8727  01 16     ORA ($16,X)
  $8729  00        BRK
  $872A  08        PHP
  $872B  02        .db $02
  $872C  07        .db $07
  $872D  00        BRK
  $872E  08        PHP
  $872F  00        BRK
  $8730  17        .db $17
  $8731  00        BRK
  $8732  18        CLC
  $8733  00        BRK
  $8734  27        .db $27
  $8735  00        BRK
  $8736  28        PLP
  $8737  00        BRK
  $8738  06 00     ASL $00
  $873A  00        BRK
  $873B  01 0A     ORA ($0A,X)
  $873D  00        BRK
  $873E  1A        .db $1A
  $873F  00        BRK
  $8740  29 00     AND #$00
  $8742  2A        ROL
  $8743  00        BRK
  $8744  2B        .db $2B
  $8745  00        BRK
  $8746  09 00     ORA #$00
  $8748  0A        ASL
  $8749  00        BRK
  $874A  0B        .db $0B
  $874B  00        BRK
  $874C  19 00 1B  ORA $1B00,Y
  $874F  00        BRK
  $8750  00        BRK
  $8751  01 0A     ORA ($0A,X)
  $8753  00        BRK
  $8754  1A        .db $1A
  $8755  00        BRK
  $8756  29 00     AND #$00
  $8758  2A        ROL
  $8759  00        BRK
  $875A  2B        .db $2B
  $875B  00        BRK
  $875C  09 00     ORA #$00
  $875E  0A        ASL
  $875F  00        BRK
  $8760  0B        .db $0B
  $8761  00        BRK
  $8762  19 00 1B  ORA $1B00,Y
  $8765  00        BRK
  $8766  20 01 0A  JSR $0A01
  $8769  00        BRK
  $876A  1A        .db $1A
  $876B  00        BRK
  $876C  03        .db $03
  $876D  00        BRK
  $876E  04        .db $04
  $876F  00        BRK
  $8770  2B        .db $2B
  $8771  00        BRK
  $8772  09 00     ORA #$00
  $8774  0A        ASL
  $8775  00        BRK
  $8776  0B        .db $0B
  $8777  00        BRK
  $8778  19 00 1B  ORA $1B00,Y
  $877B  00        BRK
  $877C  00        BRK
  $877D  01 0B     ORA ($0B,X)
  $877F  05 0C     ORA $0C
  $8781  00        BRK
  $8782  0D 00 1E  ORA $1E00
  $8785  40        RTI
  $8786  1C        .db $1C
  $8787  00        BRK
  $8788  1D 00 1E  ORA $1E00,X
  $878B  00        BRK
  $878C  50 00     BVC $878E

L_878E:
  $878E  2C 00 2D  BIT $2D00
  $8791  00        BRK
  $8792  0E 00 2E  ASL $2E00
  $8795  01 0B     ORA ($0B,X)
  $8797  04        .db $04
  $8798  31 00     AND ($00),Y
  $879A  32        .db $32
  $879B  00        BRK
  $879C  41 00     EOR ($00,X)
  $879E  42        .db $42
  $879F  00        BRK
  $87A0  50 00     BVC $87A2

L_87A2:
  $87A2  51 00     EOR ($00),Y
  $87A4  52        .db $52
  $87A5  00        BRK
  $87A6  40        RTI
  $87A7  00        BRK
  $87A8  30 40     BMI $87EA
  $87AA  2F        .db $2F
  $87AB  01 30     ORA ($30,X)
  $87AD  00        BRK
  $87AE  0A        ASL
  $87AF  07        .db $07
  $87B0  07        .db $07
  $87B1  00        BRK
  $87B2  0D 00 43  ORA $4300
  $87B5  00        BRK
  $87B6  44        .db $44
  $87B7  00        BRK
  $87B8  53        .db $53
  $87B9  00        BRK
  $87BA  54        .db $54
  $87BB  00        BRK
  $87BC  0F        .db $0F
  $87BD  00        BRK
  $87BE  45 00     EOR $00
  $87C0  55 00     EOR $00,X
  $87C2  00        BRK
  $87C3  01 0A     ORA ($0A,X)
  $87C5  01 01     ORA ($01,X)
  $87C7  00        BRK
  $87C8  02        .db $02
  $87C9  00        BRK
  $87CA  4A        LSR
  $87CB  00        BRK
  $87CC  12        .db $12
  $87CD  00        BRK
  $87CE  4B        .db $4B
  $87CF  00        BRK
  $87D0  22        .db $22
  $87D1  00        BRK
  $87D2  23        .db $23
  $87D3  00        BRK
  $87D4  00        BRK
  $87D5  01 13     ORA ($13,X)
  $87D7  00        BRK
  $87D8  0F        .db $0F
  $87D9  00        BRK
  $87DA  09 08     ORA #$08
  $87DC  01 00     ORA ($00,X)
  $87DE  05 00     ORA $00
  $87E0  3A        .db $3A
  $87E1  00        BRK
  $87E2  3B        .db $3B
  $87E3  00        BRK
  $87E4  24 00     BIT $00
  $87E6  25 00     AND $00
  $87E8  4D 00 0F  EOR $0F00
  $87EB  00        BRK
  $87EC  00        BRK
  $87ED  01 09     ORA ($09,X)
  $87EF  02        .db $02
  $87F0  07        .db $07
  $87F1  00        BRK
  $87F2  08        PHP
  $87F3  00        BRK
  $87F4  59 00 18  EOR $1800,Y
  $87F7  00        BRK
  $87F8  27        .db $27
  $87F9  00        BRK
  $87FA  28        PLP
  $87FB  00        BRK
  $87FC  06 00     ASL $00
  $87FE  00        BRK
  $87FF  01 0F     ORA ($0F,X)
  $8801  00        BRK
  $8802  09 01     ORA #$01
  $8804  5B        .db $5B
  $8805  00        BRK
  $8806  02        .db $02
  $8807  00        BRK
  $8808  5C        .db $5C
  $8809  00        BRK
  $880A  12        .db $12
  $880B  00        BRK
  $880C  4B        .db $4B
  $880D  00        BRK
  $880E  22        .db $22
  $880F  00        BRK
  $8810  23        .db $23
  $8811  00        BRK
  $8812  00        BRK
  $8813  01 13     ORA ($13,X)
  $8815  00        BRK
  $8816  08        PHP
  $8817  01 5B     ORA ($5B,X)
  $8819  00        BRK
  $881A  05 00     ORA $00
  $881C  5A        .db $5A
  $881D  00        BRK
  $881E  3B        .db $3B
  $881F  00        BRK
  $8820  24 00     BIT $00
  $8822  25 00     AND $00
  $8824  4D 00 00  EOR $0000
  $8827  01 08     ORA ($08,X)
  $8829  02        .db $02
  $882A  3C        .db $3C
  $882B  00        BRK
  $882C  08        PHP
  $882D  00        BRK
  $882E  4C 00 18  JMP $1800
  $8831  00        BRK
  $8832  27        .db $27
  $8833  00        BRK
  $8834  28        PLP
  $8835  00        BRK
  $8836  06 00     ASL $00
  $8838  00        BRK
  $8839  01 0A     ORA ($0A,X)
  $883B  00        BRK
  $883C  1A        .db $1A
  $883D  00        BRK
  $883E  49 00     EOR #$00
  $8840  2A        ROL
  $8841  00        BRK
  $8842  2B        .db $2B
  $8843  00        BRK
  $8844  48        PHA
  $8845  00        BRK
  $8846  0A        ASL
  $8847  00        BRK
  $8848  0B        .db $0B
  $8849  00        BRK
  $884A  58        CLI
  $884B  00        BRK
  $884C  1B        .db $1B
  $884D  00        BRK
  $884E  00        BRK
  $884F  01 0A     ORA ($0A,X)
  $8851  00        BRK
  $8852  1A        .db $1A
  $8853  00        BRK
  $8854  49 00     EOR #$00
  $8856  2A        ROL
  $8857  00        BRK
  $8858  2B        .db $2B
  $8859  00        BRK
  $885A  48        PHA
  $885B  00        BRK
  $885C  0A        ASL
  $885D  00        BRK
  $885E  0B        .db $0B
  $885F  00        BRK
  $8860  58        CLI
  $8861  00        BRK
  $8862  1B        .db $1B
  $8863  00        BRK
  $8864  20 01 0A  JSR $0A01
  $8867  00        BRK
  $8868  1A        .db $1A
  $8869  00        BRK
  $886A  39 00 04  AND $0400,Y
  $886D  00        BRK
  $886E  2B        .db $2B
  $886F  00        BRK
  $8870  48        PHA
  $8871  00        BRK
  $8872  0A        ASL
  $8873  00        BRK
  $8874  0B        .db $0B
  $8875  00        BRK
  $8876  58        CLI
  $8877  00        BRK
  $8878  1B        .db $1B
  $8879  00        BRK
  $887A  00        BRK
  $887B  01 0A     ORA ($0A,X)
  $887D  04        .db $04
  $887E  3D 00 32  AND $3200,X
  $8881  00        BRK
  $8882  41 00     EOR ($00,X)
  $8884  42        .db $42
  $8885  00        BRK
  $8886  50 00     BVC $8888

L_8888:
  $8888  51 00     EOR ($00),Y
  $888A  52        .db $52
  $888B  00        BRK
  $888C  40        RTI
  $888D  00        BRK
  $888E  30 00     BMI $8890

L_8890:
  $8890  2F        .db $2F
  $8891  01 0B     ORA ($0B,X)
  $8893  06 07     ASL $07
  $8895  00        BRK
  $8896  32        .db $32
  $8897  00        BRK
  $8898  6C 00 42  JMP ($4200)
  $889B  00        BRK
  $889C  51 00     EOR ($00),Y
  $889E  52        .db $52
  $889F  00        BRK
  $88A0  40        RTI
  $88A1  00        BRK
  $88A2  30 40     BMI $88E4
  $88A4  50 00     BVC $88A6

L_88A6:
  $88A6  2F        .db $2F
  $88A7  01 0F     ORA ($0F,X)
  $88A9  00        BRK
  $88AA  07        .db $07
  $88AB  0A        ASL
  $88AC  3E 00 3F  ROL $3F00,X
  $88AF  00        BRK
  $88B0  4E 00 4F  LSR $4F00
  $88B3  00        BRK
  $88B4  5F        .db $5F
  $88B5  00        BRK
  $88B6  5E 00 5D  LSR $5D00,X
  $88B9  00        BRK
  $88BA  07        .db $07
  $88BB  0B        .db $0B
  $88BC  3F        .db $3F
  $88BD  40        RTI
  $88BE  3E 40 4F  ROL $4F40,X
  $88C1  40        RTI
  $88C2  4E 40 5F  LSR $5F40
  $88C5  40        RTI
  $88C6  5E 40 5D  LSR $5D40,X
  $88C9  40        RTI
  $88CA  05 0B     ORA $0B
  $88CC  60        RTS
  $88CD  00        BRK
  $88CE  60        RTS
  $88CF  40        RTI
  $88D0  61 00     ADC ($00,X)
  $88D2  62        .db $62
  $88D3  00        BRK
  $88D4  63        .db $63
  $88D5  00        BRK
  $88D6  09 00     ORA #$00
  $88D8  7B        .db $7B
  $88D9  01 79     ORA ($79,X)
  $88DB  01 7A     ORA ($7A,X)
  $88DD  81 79     STA ($79,X)
  $88DF  41 77     EOR ($77,X)
  $88E1  01 7A     ORA ($7A,X)
  $88E3  01 77     ORA ($77,X)
  $88E5  41 78     EOR ($78,X)
  $88E7  01 78     ORA ($78,X)
  $88E9  41 09     EOR ($09,X)
  $88EB  0B        .db $0B
  $88EC  6D 00 6E  ADC $6E00
  $88EF  00        BRK
  $88F0  7D 00 7E  ADC $7E00,X
  $88F3  00        BRK
  $88F4  6F        .db $6F
  $88F5  00        BRK
  $88F6  5E 40 5D  LSR $5D40,X
  $88F9  40        RTI
  $88FA  7C        .db $7C
  $88FB  01 0F     ORA ($0F,X)
  $88FD  00        BRK
  $88FE  0A        ASL
  $88FF  03        .db $03
  $8900  0C        .db $0C
  $8901  00        BRK
  $8902  0D 00 46  ORA $4600
  $8905  00        BRK
  $8906  47        .db $47
  $8907  00        BRK
  $8908  1D 00 1E  ORA $1E00,X
  $890B  00        BRK
  $890C  56 00     LSR $00,X
  $890E  57        .db $57
  $890F  00        BRK
  $8910  38        SEC
  $8911  00        BRK
  $8912  2E 01 04  ROL $0401
  $8915  09 33     ORA #$33
  $8917  00        BRK
  $8918  33        .db $33
  $8919  00        BRK
  $891A  33        .db $33
  $891B  00        BRK
  $891C  33        .db $33
  $891D  00        BRK
  $891E  0A        ASL
  $891F  09 1F     ORA #$1F
  $8921  00        BRK
  $8922  36 00     ROL $00,X
  $8924  36 00     ROL $00,X
  $8926  37        .db $37
  $8927  00        BRK
  $8928  35 00     AND $00,X
  $892A  35 00     AND $00,X
  $892C  34        .db $34
  $892D  00        BRK
  $892E  35 40     AND $40,X
  $8930  35 40     AND $40,X
  $8932  34        .db $34
  $8933  40        RTI
  $8934  04        .db $04
  $8935  00        BRK
  $8936  1F        .db $1F
  $8937  00        BRK
  $8938  34        .db $34
  $8939  00        BRK
  $893A  37        .db $37
  $893B  00        BRK
  $893C  34        .db $34
  $893D  40        RTI
  $893E  0B        .db $0B
  $893F  06 07     ASL $07
  $8941  00        BRK
  $8942  32        .db $32
  $8943  00        BRK
  $8944  6C 00 42  JMP ($4200)
  $8947  00        BRK
  $8948  51 00     EOR ($00),Y
  $894A  52        .db $52
  $894B  00        BRK
  $894C  40        RTI
  $894D  00        BRK
  $894E  30 40     BMI $8990
  $8950  50 00     BVC $8952

L_8952:
  $8952  2F        .db $2F
  $8953  01 64     ORA ($64,X)
  $8955  00        BRK
  $8956  09 0B     ORA #$0B
  $8958  6D 00 6E  ADC $6E00
  $895B  00        BRK
  $895C  7D 00 7E  ADC $7E00,X
  $895F  00        BRK
  $8960  6F        .db $6F
  $8961  00        BRK
  $8962  5E 40 5D  LSR $5D40,X
  $8965  40        RTI
  $8966  7C        .db $7C
  $8967  01 7F     ORA ($7F,X)
  $8969  00        BRK
  $896A  0B        .db $0B
  $896B  0C        .db $0C
  $896C  07        .db $07
  $896D  00        BRK
  $896E  0D 00 72  ORA $7200
  $8971  00        BRK
  $8972  70 00     BVS $8974

L_8974:
  $8974  44        .db $44
  $8975  00        BRK
  $8976  73        .db $73
  $8977  00        BRK
  $8978  71 00     ADC ($00),Y
  $897A  54        .db $54
  $897B  00        BRK
  $897C  55 00     EOR $00,X
  $897E  45 00     EOR $00
  $8980  00        BRK
  $8981  01 05     ORA ($05,X)
  $8983  0A        ASL
  $8984  60        RTS
  $8985  00        BRK
  $8986  60        RTS
  $8987  40        RTI
  $8988  62        .db $62
  $8989  40        RTI
  $898A  61 40     ADC ($40,X)
  $898C  63        .db $63
  $898D  40        RTI
  $898E  01 00     ORA ($00,X)

L_8990:
  $8990  69 01     ADC #$01
  $8992  03        .db $03
  $8993  0D 74 01  ORA $0174
  $8996  74        .db $74
  $8997  01 74     ORA ($74,X)
  $8999  01 03     ORA ($03,X)
  $899B  0D 75 01  ORA $0175
  $899E  75 01     ADC $01,X
  $89A0  75 01     ADC $01,X
  $89A2  03        .db $03
  $89A3  0D 76 01  ORA $0176
  $89A6  76 01     ROR $01,X
  $89A8  76 01     ROR $01,X
  $89AA  04        .db $04
  $89AB  17        .db $17
  $89AC  83        .db $83
  $89AD  00        BRK
  $89AE  83        .db $83
  $89AF  40        RTI
  $89B0  83        .db $83
  $89B1  80        .db $80
  $89B2  83        .db $83
  $89B3  C0 04     CPY #$04
  $89B5  17        .db $17
  $89B6  84 00     STY $00
  $89B8  84 40     STY $40
  $89BA  84 80     STY $80
  $89BC  84 C0     STY $C0
  $89BE  04        .db $04
  $89BF  17        .db $17
  $89C0  85 00     STA $00
  $89C2  85 40     STA $40
  $89C4  85 80     STA $80
  $89C6  85 C0     STA $C0
  $89C8  01 00     ORA ($00,X)
  $89CA  86 00     STX $00
  $89CC  04        .db $04
  $89CD  17        .db $17
  $89CE  91 40     STA ($40),Y
  $89D0  90 40     BCC $8A12
  $89D2  93        .db $93
  $89D3  40        RTI
  $89D4  92        .db $92
  $89D5  40        RTI
  $89D6  04        .db $04
  $89D7  17        .db $17
  $89D8  95 40     STA $40,X
  $89DA  94 40     STY $40,X
  $89DC  97        .db $97
  $89DD  40        RTI
  $89DE  96 40     STX $40,Y
  $89E0  04        .db $04
  $89E1  17        .db $17
  $89E2  99 40 98  STA $9840,Y
  $89E5  40        RTI
  $89E6  9B        .db $9B
  $89E7  40        RTI
  $89E8  9A        TXS
  $89E9  40        RTI
  $89EA  04        .db $04
  $89EB  17        .db $17
  $89EC  9D 40 9C  STA $9C40,X
  $89EF  40        RTI
  $89F0  9F        .db $9F
  $89F1  40        RTI
  $89F2  9E        .db $9E
  $89F3  40        RTI
  $89F4  01 00     ORA ($00,X)
  $89F6  8F        .db $8F
  $89F7  00        BRK
  $89F8  09 5B     ORA #$5B
  $89FA  9C        .db $9C
  $89FB  01 9C     ORA ($9C,X)
  $89FD  01 9C     ORA ($9C,X)
  $89FF  01 9C     ORA ($9C,X)
  $8A01  01 9C     ORA ($9C,X)
  $8A03  01 9C     ORA ($9C,X)
  $8A05  01 9C     ORA ($9C,X)
  $8A07  01 9C     ORA ($9C,X)
  $8A09  01 9C     ORA ($9C,X)
  $8A0B  01 09     ORA ($09,X)
  $8A0D  5B        .db $5B
  $8A0E  9D 01 9D  STA $9D01,X
  $8A11  01 9D     ORA ($9D,X)
  $8A13  01 9D     ORA ($9D,X)
  $8A15  01 9D     ORA ($9D,X)
  $8A17  01 9D     ORA ($9D,X)
  $8A19  01 9D     ORA ($9D,X)
  $8A1B  01 9D     ORA ($9D,X)
  $8A1D  01 9D     ORA ($9D,X)
  $8A1F  01 09     ORA ($09,X)
  $8A21  5B        .db $5B
  $8A22  9E        .db $9E
  $8A23  01 9E     ORA ($9E,X)
  $8A25  01 9E     ORA ($9E,X)
  $8A27  01 9E     ORA ($9E,X)
  $8A29  01 9E     ORA ($9E,X)
  $8A2B  01 9E     ORA ($9E,X)
  $8A2D  01 9E     ORA ($9E,X)
  $8A2F  01 9E     ORA ($9E,X)
  $8A31  01 9E     ORA ($9E,X)
  $8A33  01 09     ORA ($09,X)
  $8A35  5C        .db $5C
  $8A36  9C        .db $9C
  $8A37  01 9C     ORA ($9C,X)
  $8A39  01 9C     ORA ($9C,X)
  $8A3B  01 9C     ORA ($9C,X)
  $8A3D  01 9C     ORA ($9C,X)
  $8A3F  01 9C     ORA ($9C,X)
  $8A41  01 9C     ORA ($9C,X)
  $8A43  01 9C     ORA ($9C,X)
  $8A45  01 9C     ORA ($9C,X)
  $8A47  01 09     ORA ($09,X)
  $8A49  5C        .db $5C
  $8A4A  9D 01 9D  STA $9D01,X
  $8A4D  01 9D     ORA ($9D,X)
  $8A4F  01 9D     ORA ($9D,X)
  $8A51  01 9D     ORA ($9D,X)
  $8A53  01 9D     ORA ($9D,X)
  $8A55  01 9D     ORA ($9D,X)
  $8A57  01 9D     ORA ($9D,X)
  $8A59  01 9D     ORA ($9D,X)
  $8A5B  01 09     ORA ($09,X)
  $8A5D  5C        .db $5C
  $8A5E  9E        .db $9E
  $8A5F  01 9E     ORA ($9E,X)
  $8A61  01 9E     ORA ($9E,X)
  $8A63  01 9E     ORA ($9E,X)
  $8A65  01 9E     ORA ($9E,X)
  $8A67  01 9E     ORA ($9E,X)
  $8A69  01 9E     ORA ($9E,X)
  $8A6B  01 9E     ORA ($9E,X)
  $8A6D  01 9E     ORA ($9E,X)
  $8A6F  01 09     ORA ($09,X)
  $8A71  5D 9C 01  EOR $019C,X
  $8A74  9C        .db $9C
  $8A75  01 9C     ORA ($9C,X)
  $8A77  01 9C     ORA ($9C,X)
  $8A79  01 9C     ORA ($9C,X)
  $8A7B  01 9C     ORA ($9C,X)
  $8A7D  01 9C     ORA ($9C,X)
  $8A7F  01 9C     ORA ($9C,X)
  $8A81  01 9C     ORA ($9C,X)
  $8A83  01 09     ORA ($09,X)
  $8A85  5D 9D 01  EOR $019D,X
  $8A88  9D 01 9D  STA $9D01,X
  $8A8B  01 9D     ORA ($9D,X)
  $8A8D  01 9D     ORA ($9D,X)
  $8A8F  01 9D     ORA ($9D,X)
  $8A91  01 9D     ORA ($9D,X)
  $8A93  01 9D     ORA ($9D,X)
  $8A95  01 9D     ORA ($9D,X)
  $8A97  01 09     ORA ($09,X)
  $8A99  5D 9E 01  EOR $019E,X
  $8A9C  9E        .db $9E
  $8A9D  01 9E     ORA ($9E,X)
  $8A9F  01 9E     ORA ($9E,X)
  $8AA1  01 9E     ORA ($9E,X)
  $8AA3  01 9E     ORA ($9E,X)
  $8AA5  01 9E     ORA ($9E,X)
  $8AA7  01 9E     ORA ($9E,X)
  $8AA9  01 9E     ORA ($9E,X)
  $8AAB  01 04     ORA ($04,X)
  $8AAD  17        .db $17
  $8AAE  83        .db $83
  $8AAF  01 83     ORA ($83,X)
  $8AB1  41 83     EOR ($83,X)
  $8AB3  81 83     STA ($83,X)
  $8AB5  C1 04     CMP ($04,X)
  $8AB7  17        .db $17
  $8AB8  84 01     STY $01
  $8ABA  84 41     STY $41
  $8ABC  84 81     STY $81
  $8ABE  84 C1     STY $C1
  $8AC0  04        .db $04
  $8AC1  17        .db $17
  $8AC2  85 01     STA $01
  $8AC4  85 41     STA $41
  $8AC6  85 81     STA $81
  $8AC8  85 C1     STA $C1
  $8ACA  01 00     ORA ($00,X)
  $8ACC  86 01     STX $01
  $8ACE  04        .db $04
  $8ACF  17        .db $17
  $8AD0  91 40     STA ($40),Y
  $8AD2  90 40     BCC $8B14
  $8AD4  93        .db $93
  $8AD5  40        RTI
  $8AD6  92        .db $92
  $8AD7  40        RTI
  $8AD8  04        .db $04
  $8AD9  17        .db $17
  $8ADA  95 40     STA $40,X
  $8ADC  94 40     STY $40,X
  $8ADE  97        .db $97
  $8ADF  40        RTI
  $8AE0  96 40     STX $40,Y
  $8AE2  04        .db $04
  $8AE3  17        .db $17
  $8AE4  99 40 98  STA $9840,Y
  $8AE7  40        RTI
  $8AE8  9B        .db $9B
  $8AE9  40        RTI
  $8AEA  9A        TXS
  $8AEB  40        RTI
  $8AEC  04        .db $04
  $8AED  17        .db $17
  $8AEE  9C        .db $9C
  $8AEF  00        BRK
  $8AF0  9C        .db $9C
  $8AF1  40        RTI
  $8AF2  9C        .db $9C
  $8AF3  80        .db $80
  $8AF4  9C        .db $9C
  $8AF5  C0 04     CPY #$04
  $8AF7  17        .db $17

L_8AF8:
  $8AF8  9D 00 9D  STA $9D00,X
  $8AFB  40        RTI
  $8AFC  9D 80 9D  STA $9D80,X
  $8AFF  C0 04     CPY #$04
  $8B01  17        .db $17
  $8B02  9E        .db $9E
  $8B03  00        BRK
  $8B04  9E        .db $9E
  $8B05  40        RTI
  $8B06  9E        .db $9E
  $8B07  80        .db $80
  $8B08  9E        .db $9E
  $8B09  C0 04     CPY #$04
  $8B0B  17        .db $17
  $8B0C  9F        .db $9F
  $8B0D  00        BRK
  $8B0E  9F        .db $9F
  $8B0F  40        RTI
  $8B10  9F        .db $9F
  $8B11  80        .db $80
  $8B12  9F        .db $9F
  $8B13  C0 01     CPY #$01
  $8B15  00        BRK
  $8B16  9A        TXS
  $8B17  41 01     EOR ($01,X)
  $8B19  00        BRK
  $8B1A  9B        .db $9B
  $8B1B  41 01     EOR ($01,X)
  $8B1D  00        BRK
  $8B1E  9A        TXS
  $8B1F  C1 01     CMP ($01,X)
  $8B21  00        BRK
  $8B22  9B        .db $9B
  $8B23  C1 04     CMP ($04,X)
  $8B25  17        .db $17
  $8B26  90 00     BCC $8B28

L_8B28:
  $8B28  91 00     STA ($00),Y
  $8B2A  91 C0     STA ($C0),Y
  $8B2C  91 80     STA ($80),Y
  $8B2E  04        .db $04
  $8B2F  17        .db $17
  $8B30  92        .db $92
  $8B31  00        BRK
  $8B32  93        .db $93
  $8B33  00        BRK
  $8B34  94 00     STY $00,X
  $8B36  95 00     STA $00,X
  $8B38  04        .db $04
  $8B39  17        .db $17
  $8B3A  96 00     STX $00,Y

L_8B3C:
  $8B3C  97        .db $97
  $8B3D  00        BRK
  $8B3E  98        TYA
  $8B3F  00        BRK
  $8B40  99 00 04  STA $0400,Y
  $8B43  17        .db $17
  $8B44  9C        .db $9C
  $8B45  01 9D     ORA ($9D,X)
  $8B47  01 9D     ORA ($9D,X)
  $8B49  C1 9C     CMP ($9C,X)
  $8B4B  C1 04     CMP ($04,X)
  $8B4D  17        .db $17
  $8B4E  9E        .db $9E
  $8B4F  01 9F     ORA ($9F,X)
  $8B51  01 9F     ORA ($9F,X)
  $8B53  C1 9E     CMP ($9E,X)
  $8B55  C1 01     CMP ($01,X)
  $8B57  00        BRK
  $8B58  9A        TXS
  $8B59  00        BRK
  $8B5A  01 00     ORA ($00,X)
  $8B5C  9B        .db $9B
  $8B5D  00        BRK
  $8B5E  04        .db $04
  $8B5F  17        .db $17
  $8B60  98        TYA
  $8B61  00        BRK
  $8B62  98        TYA
  $8B63  40        RTI
  $8B64  98        TYA
  $8B65  80        .db $80
  $8B66  98        TYA
  $8B67  C0 04     CPY #$04
  $8B69  17        .db $17
  $8B6A  99 00 99  STA $9900,Y
  $8B6D  40        RTI
  $8B6E  99 80 99  STA $9980,Y
  $8B71  C0 09     CPY #$09
  $8B73  00        BRK
  $8B74  93        .db $93
  $8B75  00        BRK
  $8B76  90 80     BCC $8AF8
  $8B78  91 80     STA ($80),Y
  $8B7A  90 C0     BCC $8B3C
  $8B7C  90 00     BCC $8B7E

L_8B7E:
  $8B7E  91 00     STA ($00),Y
  $8B80  90 40     BCC $8BC2
  $8B82  92        .db $92
  $8B83  00        BRK
  $8B84  92        .db $92
  $8B85  40        RTI
  $8B86  09 00     ORA #$00
  $8B88  97        .db $97
  $8B89  00        BRK
  $8B8A  94 80     STY $80,X
  $8B8C  95 80     STA $80,X
  $8B8E  94 C0     STY $C0,X
  $8B90  94 00     STY $00,X
  $8B92  95 00     STA $00,X
  $8B94  94 40     STY $40,X
  $8B96  96 00     STX $00,Y
  $8B98  96 40     STX $40,Y
  $8B9A  01 00     ORA ($00,X)
  $8B9C  90 00     BCC $8B9E

L_8B9E:
  $8B9E  08        PHP
  $8B9F  5F        .db $5F
  $8BA0  91 00     STA ($00),Y
  $8BA2  91 00     STA ($00),Y
  $8BA4  91 00     STA ($00),Y
  $8BA6  91 00     STA ($00),Y
  $8BA8  92        .db $92
  $8BA9  00        BRK
  $8BAA  92        .db $92
  $8BAB  00        BRK
  $8BAC  92        .db $92
  $8BAD  00        BRK
  $8BAE  92        .db $92
  $8BAF  00        BRK
  $8BB0  08        PHP
  $8BB1  5F        .db $5F
  $8BB2  93        .db $93
  $8BB3  00        BRK
  $8BB4  93        .db $93
  $8BB5  00        BRK
  $8BB6  93        .db $93
  $8BB7  00        BRK
  $8BB8  93        .db $93
  $8BB9  00        BRK
  $8BBA  94 00     STY $00,X
  $8BBC  94 00     STY $00,X
  $8BBE  94 00     STY $00,X
  $8BC0  94 00     STY $00,X

L_8BC2:
  $8BC2  04        .db $04
  $8BC3  5E 90 00  LSR $0090,X
  $8BC6  90 00     BCC $8BC8

L_8BC8:
  $8BC8  90 00     BCC $8BCA

L_8BCA:
  $8BCA  90 00     BCC $8BCC

L_8BCC:
  $8BCC  04        .db $04
  $8BCD  5F        .db $5F
  $8BCE  90 00     BCC $8BD0

L_8BD0:
  $8BD0  90 00     BCC $8BD2

L_8BD2:
  $8BD2  90 00     BCC $8BD4

L_8BD4:
  $8BD4  90 00     BCC $8BD6

L_8BD6:
  $8BD6  04        .db $04
  $8BD7  61 90     ADC ($90,X)
  $8BD9  00        BRK
  $8BDA  90 00     BCC $8BDC

L_8BDC:
  $8BDC  90 00     BCC $8BDE

L_8BDE:
  $8BDE  90 00     BCC $8BE0

L_8BE0:
  $8BE0  04        .db $04
  $8BE1  60        RTS
  $8BE2  90 00     BCC $8BE4

L_8BE4:
  $8BE4  90 00     BCC $8BE6

L_8BE6:
  $8BE6  90 00     BCC $8BE8

L_8BE8:
  $8BE8  90 00     BCC $8BEA

L_8BEA:
  $8BEA  04        .db $04
  $8BEB  63        .db $63
  $8BEC  95 00     STA $00,X
  $8BEE  96 00     STX $00,Y
  $8BF0  95 40     STA $40,X
  $8BF2  97        .db $97
  $8BF3  00        BRK
  $8BF4  04        .db $04
  $8BF5  64        .db $64
  $8BF6  95 00     STA $00,X
  $8BF8  96 00     STX $00,Y
  $8BFA  95 40     STA $40,X
  $8BFC  97        .db $97
  $8BFD  40        RTI
  $8BFE  04        .db $04
  $8BFF  54        .db $54
  $8C00  91 00     STA ($00),Y
  $8C02  92        .db $92
  $8C03  00        BRK
  $8C04  90 00     BCC $8C06

L_8C06:
  $8C06  93        .db $93
  $8C07  00        BRK
  $8C08  04        .db $04
  $8C09  54        .db $54
  $8C0A  91 00     STA ($00),Y
  $8C0C  92        .db $92
  $8C0D  00        BRK
  $8C0E  90 00     BCC $8C10

L_8C10:
  $8C10  94 00     STY $00,X
  $8C12  06 62     ASL $62
  $8C14  98        TYA
  $8C15  00        BRK
  $8C16  99 00 98  STA $9800,Y
  $8C19  40        RTI
  $8C1A  9A        TXS
  $8C1B  00        BRK
  $8C1C  9B        .db $9B
  $8C1D  00        BRK
  $8C1E  9A        TXS
  $8C1F  40        RTI
  $8C20  06 62     ASL $62
  $8C22  9C        .db $9C
  $8C23  00        BRK
  $8C24  99 00 9C  STA $9C00,Y
  $8C27  40        RTI
  $8C28  9D 00 9B  STA $9B00,X
  $8C2B  00        BRK
  $8C2C  9D 40 0E  STA $0E40,X
  $8C2F  65 A2     ADC $A2
  $8C31  03        .db $03
  $8C32  A3        .db $A3
  $8C33  03        .db $03
  $8C34  A5 03     LDA $03
  $8C36  A6 03     LDX $03
  $8C38  A7        .db $A7
  $8C39  03        .db $03
  $8C3A  A8        TAY
  $8C3B  03        .db $03
  $8C3C  A9 03     LDA #$03
  $8C3E  AA        TAX
  $8C3F  03        .db $03
  $8C40  AB        .db $AB
  $8C41  03        .db $03
  $8C42  AC 03 A1  LDY $A103
  $8C45  03        .db $03
  $8C46  A4 03     LDY $03
  $8C48  A0 03     LDY #$03
  $8C4A  C0 01     CPY #$01
  $8C4C  0C        .db $0C
  $8C4D  66 AE     ROR $AE
  $8C4F  03        .db $03
  $8C50  AF        .db $AF
  $8C51  03        .db $03
  $8C52  B0 03     BCS $8C57
  $8C54  B1 03     LDA ($03),Y
  $8C56  B2        .db $B2

L_8C57:
  $8C57  03        .db $03
  $8C58  B3        .db $B3
  $8C59  03        .db $03
  $8C5A  B4 03     LDY $03,X
  $8C5C  B5 03     LDA $03,X
  $8C5E  B6 03     LDX $03,Y
  $8C60  C0 01     CPY #$01
  $8C62  AD 03 AD  LDA $AD03
  $8C65  03        .db $03
  $8C66  0A        ASL
  $8C67  65 B7     ADC $B7
  $8C69  03        .db $03
  $8C6A  B8        CLV
  $8C6B  03        .db $03
  $8C6C  B9 03 BA  LDA $BA03,Y
  $8C6F  03        .db $03
  $8C70  BB        .db $BB
  $8C71  03        .db $03
  $8C72  B9 43 BC  LDA $BC43,Y
  $8C75  03        .db $03
  $8C76  BD 03 BE  LDA $BE03,X
  $8C79  03        .db $03
  $8C7A  BF        .db $BF
  $8C7B  03        .db $03
  $8C7C  12        .db $12
  $8C7D  65 A2     ADC $A2
  $8C7F  03        .db $03
  $8C80  C6 03     DEC $03
  $8C82  C8        INY
  $8C83  03        .db $03
  $8C84  A6 03     LDX $03
  $8C86  A7        .db $A7
  $8C87  03        .db $03
  $8C88  C9 03     CMP #$03
  $8C8A  CA        DEX
  $8C8B  03        .db $03
  $8C8C  CB        .db $CB
  $8C8D  03        .db $03
  $8C8E  CC 03 CD  CPY $CD03
  $8C91  03        .db $03
  $8C92  C5 03     CMP $03
  $8C94  C7        .db $C7
  $8C95  03        .db $03
  $8C96  8F        .db $8F
  $8C97  03        .db $03
  $8C98  C0 01     CPY #$01
  $8C9A  C1 03     CMP ($03,X)
  $8C9C  C2        .db $C2
  $8C9D  03        .db $03
  $8C9E  C3        .db $C3
  $8C9F  03        .db $03
  $8CA0  C4 03     CPY $03
  $8CA2  12        .db $12
  $8CA3  65 A2     ADC $A2
  $8CA5  03        .db $03
  $8CA6  D3        .db $D3
  $8CA7  03        .db $03
  $8CA8  D5 03     CMP $03,X
  $8CAA  A6 03     LDX $03
  $8CAC  A7        .db $A7
  $8CAD  03        .db $03
  $8CAE  D6 03     DEC $03,X
  $8CB0  D7        .db $D7
  $8CB1  03        .db $03
  $8CB2  D8        CLD
  $8CB3  03        .db $03
  $8CB4  D9 03 DA  CMP $DA03,Y
  $8CB7  03        .db $03
  $8CB8  D2        .db $D2
  $8CB9  03        .db $03
  $8CBA  D4        .db $D4
  $8CBB  03        .db $03
  $8CBC  8F        .db $8F
  $8CBD  03        .db $03
  $8CBE  C0 01     CPY #$01
  $8CC0  CE 03 CF  DEC $CF03
  $8CC3  03        .db $03
  $8CC4  D0 03     BNE $8CC9
  $8CC6  D1 03     CMP ($03),Y
  $8CC8  0B        .db $0B

L_8CC9:
  $8CC9  67        .db $67
  $8CCA  DC        .db $DC
  $8CCB  03        .db $03
  $8CCC  DD 03 DE  CMP $DE03,X
  $8CCF  03        .db $03
  $8CD0  E0 03     CPX #$03
  $8CD2  E1 03     SBC ($03,X)
  $8CD4  E2        .db $E2
  $8CD5  03        .db $03
  $8CD6  E3        .db $E3
  $8CD7  03        .db $03
  $8CD8  E4 03     CPX $03
  $8CDA  E5 03     SBC $03
  $8CDC  E6 03     INC $03
  $8CDE  C0 01     CPY #$01
  $8CE0  0B        .db $0B
  $8CE1  68        PLA
  $8CE2  A0 03     LDY #$03
  $8CE4  A2 03     LDX #$03
  $8CE6  A3        .db $A3
  $8CE7  03        .db $03
  $8CE8  E9 03     SBC #$03
  $8CEA  EA        NOP
  $8CEB  03        .db $03
  $8CEC  EB        .db $EB
  $8CED  03        .db $03
  $8CEE  EC 03 ED  CPX $ED03
  $8CF1  03        .db $03
  $8CF2  EE 03 EF  INC $EF03
  $8CF5  03        .db $03
  $8CF6  C0 01     CPY #$01
  $8CF8  0C        .db $0C
  $8CF9  69 F0     ADC #$F0
  $8CFB  03        .db $03
  $8CFC  F1 03     SBC ($03),Y
  $8CFE  F2        .db $F2
  $8CFF  03        .db $03
  $8D00  F3        .db $F3
  $8D01  03        .db $03
  $8D02  F4        .db $F4
  $8D03  03        .db $03
  $8D04  F5 03     SBC $03,X
  $8D06  F6 03     INC $03,X
  $8D08  F7        .db $F7
  $8D09  03        .db $03
  $8D0A  F8        SED
  $8D0B  03        .db $03
  $8D0C  F9 03 FA  SBC $FA03,Y
  $8D0F  03        .db $03
  $8D10  DB        .db $DB
  $8D11  01 0C     ORA ($0C,X)
  $8D13  3A        .db $3A
  $8D14  FB        .db $FB
  $8D15  02        .db $02
  $8D16  FC        .db $FC
  $8D17  02        .db $02
  $8D18  FB        .db $FB
  $8D19  82        .db $82
  $8D1A  FC        .db $FC
  $8D1B  82        .db $82
  $8D1C  FB        .db $FB
  $8D1D  02        .db $02
  $8D1E  FC        .db $FC
  $8D1F  02        .db $02
  $8D20  FB        .db $FB
  $8D21  82        .db $82
  $8D22  FC        .db $FC
  $8D23  82        .db $82
  $8D24  FB        .db $FB
  $8D25  02        .db $02
  $8D26  FC        .db $FC
  $8D27  02        .db $02
  $8D28  FB        .db $FB
  $8D29  82        .db $82
  $8D2A  FC        .db $FC
  $8D2B  82        .db $82
  $8D2C  0C        .db $0C
  $8D2D  6A        ROR
  $8D2E  FD 02 FE  SBC $FE02,X
  $8D31  02        .db $02
  $8D32  FD 82 FE  SBC $FE82,X
  $8D35  82        .db $82
  $8D36  FD 02 FE  SBC $FE02,X
  $8D39  02        .db $02
  $8D3A  FD 82 FE  SBC $FE82,X
  $8D3D  82        .db $82
  $8D3E  FD 02 FE  SBC $FE02,X
  $8D41  02        .db $02
  $8D42  FD 82 FE  SBC $FE82,X
  $8D45  82        .db $82
  $8D46  0C        .db $0C
  $8D47  5A        .db $5A
  $8D48  FF        .db $FF
  $8D49  82        .db $82
  $8D4A  FF        .db $FF
  $8D4B  C2        .db $C2
  $8D4C  FF        .db $FF
  $8D4D  02        .db $02
  $8D4E  FF        .db $FF
  $8D4F  42        .db $42
  $8D50  FF        .db $FF
  $8D51  82        .db $82
  $8D52  FF        .db $FF
  $8D53  C2        .db $C2
  $8D54  FF        .db $FF
  $8D55  02        .db $02
  $8D56  FF        .db $FF
  $8D57  42        .db $42
  $8D58  FF        .db $FF
  $8D59  02        .db $02
  $8D5A  FF        .db $FF
  $8D5B  42        .db $42
  $8D5C  FF        .db $FF
  $8D5D  82        .db $82
  $8D5E  FF        .db $FF
  $8D5F  C2        .db $C2
  $8D60  0C        .db $0C
  $8D61  4C FB 02  JMP $02FB
  $8D64  FC        .db $FC
  $8D65  02        .db $02
  $8D66  FB        .db $FB
  $8D67  02        .db $02
  $8D68  FC        .db $FC
  $8D69  02        .db $02
  $8D6A  FB        .db $FB
  $8D6B  02        .db $02
  $8D6C  FC        .db $FC
  $8D6D  02        .db $02
  $8D6E  FB        .db $FB
  $8D6F  82        .db $82
  $8D70  FC        .db $FC
  $8D71  82        .db $82
  $8D72  FB        .db $FB
  $8D73  82        .db $82
  $8D74  FC        .db $FC
  $8D75  82        .db $82
  $8D76  FB        .db $FB
  $8D77  82        .db $82
  $8D78  FC        .db $FC
  $8D79  82        .db $82
  $8D7A  0C        .db $0C
  $8D7B  4C FD 02  JMP $02FD
  $8D7E  FE 02 FD  INC $FD02,X
  $8D81  02        .db $02
  $8D82  FE 02 FD  INC $FD02,X
  $8D85  02        .db $02
  $8D86  FE 02 FD  INC $FD02,X
  $8D89  82        .db $82
  $8D8A  FE 82 FD  INC $FD82,X
  $8D8D  82        .db $82
  $8D8E  FE 82 FD  INC $FD82,X
  $8D91  82        .db $82
  $8D92  FE 82 0C  INC $0C82,X
  $8D95  4C FF 02  JMP $02FF
  $8D98  FF        .db $FF
  $8D99  42        .db $42
  $8D9A  FF        .db $FF
  $8D9B  02        .db $02
  $8D9C  FF        .db $FF
  $8D9D  42        .db $42
  $8D9E  FF        .db $FF
  $8D9F  02        .db $02
  $8DA0  FF        .db $FF
  $8DA1  42        .db $42
  $8DA2  FF        .db $FF
  $8DA3  82        .db $82
  $8DA4  FF        .db $FF
  $8DA5  C2        .db $C2
  $8DA6  FF        .db $FF
  $8DA7  82        .db $82
  $8DA8  FF        .db $FF
  $8DA9  C2        .db $C2
  $8DAA  FF        .db $FF
  $8DAB  82        .db $82
  $8DAC  FF        .db $FF
  $8DAD  C2        .db $C2
  $8DAE  0C        .db $0C
  $8DAF  6B        .db $6B
  $8DB0  A2 03     LDX #$03
  $8DB2  A3        .db $A3
  $8DB3  03        .db $03
  $8DB4  A4 03     LDY $03
  $8DB6  A5 03     LDA $03
  $8DB8  A6 03     LDX $03
  $8DBA  A7        .db $A7
  $8DBB  03        .db $03
  $8DBC  A8        TAY
  $8DBD  03        .db $03
  $8DBE  A9 03     LDA #$03
  $8DC0  AA        TAX
  $8DC1  03        .db $03
  $8DC2  BF        .db $BF
  $8DC3  01 A0     ORA ($A0,X)
  $8DC5  03        .db $03
  $8DC6  A1 03     LDA ($03,X)
  $8DC8  0C        .db $0C
  $8DC9  6C A0 03  JMP ($03A0)
  $8DCC  A1 03     LDA ($03,X)
  $8DCE  B6 03     LDX $03,Y
  $8DD0  B7        .db $B7
  $8DD1  03        .db $03
  $8DD2  B8        CLV
  $8DD3  03        .db $03
  $8DD4  B9 03 BA  LDA $BA03,Y
  $8DD7  03        .db $03
  $8DD8  BB        .db $BB
  $8DD9  03        .db $03
  $8DDA  BC 03 BD  LDY $BD03,X
  $8DDD  03        .db $03
  $8DDE  BE 03 BF  LDX $BF03,Y
  $8DE1  01 0C     ORA ($0C,X)
  $8DE3  00        BRK
  $8DE4  B0 03     BCS $8DE9
  $8DE6  B3        .db $B3
  $8DE7  03        .db $03
  $8DE8  B4 03     LDY $03,X
  $8DEA  B5 03     LDA $03,X
  $8DEC  AC 03 AD  LDY $AD03
  $8DEF  03        .db $03
  $8DF0  AE 03 AF  LDX $AF03
  $8DF3  03        .db $03
  $8DF4  B1 03     LDA ($03),Y
  $8DF6  BF        .db $BF
  $8DF7  01 AB     ORA ($AB,X)
  $8DF9  03        .db $03
  $8DFA  B2        .db $B2
  $8DFB  03        .db $03
  $8DFC  0C        .db $0C
  $8DFD  00        BRK
  $8DFE  B0 03     BCS $8E03
  $8E00  B3        .db $B3
  $8E01  03        .db $03
  $8E02  B4 03     LDY $03,X
  $8E04  B5 03     LDA $03,X
  $8E06  C0 02     CPY #$02
  $8E08  AD 03 AE  LDA $AE03
  $8E0B  03        .db $03
  $8E0C  AF        .db $AF
  $8E0D  03        .db $03
  $8E0E  B1 03     LDA ($03),Y
  $8E10  BF        .db $BF
  $8E11  01 AB     ORA ($AB,X)
  $8E13  03        .db $03
  $8E14  B2        .db $B2
  $8E15  03        .db $03
  $8E16  0D 00 B0  ORA $B000
  $8E19  03        .db $03
  $8E1A  B3        .db $B3
  $8E1B  03        .db $03
  $8E1C  B4 03     LDY $03,X
  $8E1E  B5 03     LDA $03,X
  $8E20  C1 03     CMP ($03,X)
  $8E22  C3        .db $C3
  $8E23  03        .db $03
  $8E24  AE 03 AF  LDX $AF03
  $8E27  03        .db $03
  $8E28  B1 03     LDA ($03),Y
  $8E2A  BF        .db $BF
  $8E2B  01 AB     ORA ($AB,X)
  $8E2D  03        .db $03
  $8E2E  B2        .db $B2
  $8E2F  03        .db $03
  $8E30  C2        .db $C2
  $8E31  02        .db $02
  $8E32  0D 00 B0  ORA $B000
  $8E35  03        .db $03
  $8E36  B3        .db $B3
  $8E37  03        .db $03
  $8E38  B4 03     LDY $03,X
  $8E3A  B5 03     LDA $03,X
  $8E3C  AC 03 C3  LDY $C303
  $8E3F  03        .db $03
  $8E40  AE 03 AF  LDX $AF03
  $8E43  03        .db $03
  $8E44  B1 03     LDA ($03),Y
  $8E46  BF        .db $BF
  $8E47  01 C5     ORA ($C5,X)
  $8E49  02        .db $02
  $8E4A  B2        .db $B2
  $8E4B  03        .db $03
  $8E4C  C4 02     CPY $02
  $8E4E  0E 00 B0  ASL $B000
  $8E51  03        .db $03
  $8E52  B3        .db $B3
  $8E53  03        .db $03
  $8E54  B4 03     LDY $03,X
  $8E56  B5 03     LDA $03,X
  $8E58  AC 03 AD  LDY $AD03
  $8E5B  03        .db $03
  $8E5C  AE 03 AF  LDX $AF03
  $8E5F  03        .db $03
  $8E60  B1 03     LDA ($03),Y
  $8E62  BF        .db $BF
  $8E63  01 C6     ORA ($C6,X)
  $8E65  02        .db $02
  $8E66  B2        .db $B2
  $8E67  03        .db $03
  $8E68  8F        .db $8F
  $8E69  03        .db $03
  $8E6A  C7        .db $C7
  $8E6B  02        .db $02
  $8E6C  0C        .db $0C
  $8E6D  00        BRK
  $8E6E  B0 03     BCS $8E73
  $8E70  B3        .db $B3
  $8E71  03        .db $03
  $8E72  B4 03     LDY $03,X
  $8E74  B5 03     LDA $03,X
  $8E76  AC 03 AD  LDY $AD03
  $8E79  03        .db $03
  $8E7A  AE 03 AF  LDX $AF03
  $8E7D  03        .db $03
  $8E7E  B1 03     LDA ($03),Y
  $8E80  BF        .db $BF
  $8E81  01 C8     ORA ($C8,X)
  $8E83  02        .db $02
  $8E84  B2        .db $B2
  $8E85  03        .db $03
  $8E86  0D 6D D2  ORA $D26D
  $8E89  03        .db $03
  $8E8A  D3        .db $D3
  $8E8B  03        .db $03
  $8E8C  D4        .db $D4
  $8E8D  03        .db $03
  $8E8E  D6 03     DEC $03,X
  $8E90  D7        .db $D7
  $8E91  03        .db $03
  $8E92  D8        CLD
  $8E93  03        .db $03
  $8E94  D9 03 DA  CMP $DA03,Y
  $8E97  03        .db $03
  $8E98  DB        .db $DB
  $8E99  03        .db $03
  $8E9A  BF        .db $BF
  $8E9B  01 D0     ORA ($D0,X)
  $8E9D  03        .db $03
  $8E9E  D1 03     CMP ($03),Y
  $8EA0  D5 03     CMP $03,X
  $8EA2  0C        .db $0C
  $8EA3  00        BRK
  $8EA4  CB        .db $CB
  $8EA5  03        .db $03
  $8EA6  CC 03 CD  CPY $CD03
  $8EA9  03        .db $03
  $8EAA  B5 03     LDA $03,X
  $8EAC  C9 03     CMP #$03
  $8EAE  AD 03 AE  LDA $AE03
  $8EB1  03        .db $03
  $8EB2  CA        DEX
  $8EB3  03        .db $03
  $8EB4  B1 03     LDA ($03),Y
  $8EB6  BF        .db $BF
  $8EB7  01 AB     ORA ($AB,X)
  $8EB9  03        .db $03
  $8EBA  B2        .db $B2
  $8EBB  03        .db $03
  $8EBC  0C        .db $0C
  $8EBD  6E A0 03  ROR $03A0
  $8EC0  A1 03     LDA ($03,X)
  $8EC2  A2 03     LDX #$03
  $8EC4  A3        .db $A3
  $8EC5  03        .db $03
  $8EC6  E8        INX
  $8EC7  03        .db $03
  $8EC8  E9 03     SBC #$03
  $8ECA  EA        NOP

L_8ECB:
  $8ECB  03        .db $03
  $8ECC  EB        .db $EB
  $8ECD  03        .db $03
  $8ECE  EC 03 ED  CPX $ED03
  $8ED1  03        .db $03
  $8ED2  EE 03 BF  INC $BF03
  $8ED5  01 0C     ORA ($0C,X)
  $8ED7  6E A0 03  ROR $03A0
  $8EDA  A1 03     LDA ($03,X)
  $8EDC  A2 03     LDX #$03
  $8EDE  A3        .db $A3
  $8EDF  03        .db $03
  $8EE0  E8        INX
  $8EE1  03        .db $03
  $8EE2  EF        .db $EF
  $8EE3  03        .db $03
  $8EE4  F0 03     BEQ $8EE9
  $8EE6  F1 03     SBC ($03),Y
  $8EE8  F2        .db $F2

L_8EE9:
  $8EE9  03        .db $03
  $8EEA  F3        .db $F3
  $8EEB  03        .db $03
  $8EEC  F4        .db $F4
  $8EED  03        .db $03
  $8EEE  BF        .db $BF
  $8EEF  01 0C     ORA ($0C,X)
  $8EF1  6F        .db $6F
  $8EF2  DE 03 E0  DEC $E003,X
  $8EF5  03        .db $03
  $8EF6  E1 03     SBC ($03,X)
  $8EF8  E2        .db $E2
  $8EF9  03        .db $03
  $8EFA  E3        .db $E3
  $8EFB  03        .db $03
  $8EFC  E4 03     CPX $03
  $8EFE  E5 03     SBC $03
  $8F00  E6 03     INC $03
  $8F02  E7        .db $E7
  $8F03  03        .db $03
  $8F04  BF        .db $BF
  $8F05  01 DC     ORA ($DC,X)
  $8F07  03        .db $03
  $8F08  DD 03 0E  CMP $0E03,X
  $8F0B  6D D2 03  ADC $03D2
  $8F0E  D3        .db $D3
  $8F0F  03        .db $03
  $8F10  D4        .db $D4
  $8F11  03        .db $03
  $8F12  CF        .db $CF
  $8F13  03        .db $03
  $8F14  CE 03 D8  DEC $D803
  $8F17  03        .db $03
  $8F18  FB        .db $FB
  $8F19  03        .db $03
  $8F1A  FC        .db $FC
  $8F1B  03        .db $03
  $8F1C  8F        .db $8F
  $8F1D  03        .db $03
  $8F1E  BF        .db $BF
  $8F1F  01 D0     ORA ($D0,X)
  $8F21  03        .db $03
  $8F22  D1 03     CMP ($03),Y
  $8F24  D5 03     CMP $03,X
  $8F26  FD 03 0C  SBC $0C03,X
  $8F29  70 A0     BVS $8ECB
  $8F2B  03        .db $03
  $8F2C  A1 03     LDA ($03,X)
  $8F2E  F5 03     SBC $03,X
  $8F30  F6 03     INC $03,X
  $8F32  F7        .db $F7
  $8F33  03        .db $03
  $8F34  F8        SED
  $8F35  03        .db $03
  $8F36  F9 03 FA  SBC $FA03,Y
  $8F39  03        .db $03
  $8F3A  FB        .db $FB
  $8F3B  03        .db $03
  $8F3C  FC        .db $FC
  $8F3D  03        .db $03
  $8F3E  FD 03 BF  SBC $BF03,X
  $8F41  01 0D     ORA ($0D,X)
  $8F43  71 A0     ADC ($A0),Y
  $8F45  03        .db $03
  $8F46  A1 03     LDA ($03,X)
  $8F48  A2 03     LDX #$03
  $8F4A  A3        .db $A3
  $8F4B  03        .db $03
  $8F4C  A4 03     LDY $03
  $8F4E  A5 03     LDA $03
  $8F50  A6 03     LDX $03
  $8F52  A7        .db $A7
  $8F53  03        .db $03
  $8F54  A8        TAY
  $8F55  03        .db $03
  $8F56  A9 03     LDA #$03
  $8F58  AA        TAX
  $8F59  03        .db $03
  $8F5A  AB        .db $AB
  $8F5B  03        .db $03
  $8F5C  F4        .db $F4
  $8F5D  01 0E     ORA ($0E,X)
  $8F5F  76 AC     ROR $AC,X
  $8F61  03        .db $03
  $8F62  A0 03     LDY #$03
  $8F64  AD 03 AE  LDA $AE03
  $8F67  03        .db $03
  $8F68  AF        .db $AF
  $8F69  03        .db $03
  $8F6A  B0 03     BCS $8F6F
  $8F6C  B1 03     LDA ($03),Y
  $8F6E  B2        .db $B2

L_8F6F:
  $8F6F  03        .db $03
  $8F70  B3        .db $B3
  $8F71  03        .db $03
  $8F72  B4 03     LDY $03,X
  $8F74  B5 03     LDA $03,X
  $8F76  B6 03     LDX $03,Y
  $8F78  B7        .db $B7
  $8F79  03        .db $03
  $8F7A  F4        .db $F4
  $8F7B  01 0D     ORA ($0D,X)
  $8F7D  72        .db $72
  $8F7E  B8        CLV
  $8F7F  03        .db $03
  $8F80  B9 03 BA  LDA $BA03,Y
  $8F83  03        .db $03
  $8F84  BB        .db $BB
  $8F85  03        .db $03
  $8F86  BC 03 BD  LDY $BD03,X
  $8F89  03        .db $03
  $8F8A  BE 03 BF  LDX $BF03,Y
  $8F8D  03        .db $03
  $8F8E  C0 03     CPY #$03
  $8F90  C1 03     CMP ($03,X)
  $8F92  C2        .db $C2
  $8F93  03        .db $03
  $8F94  C3        .db $C3
  $8F95  03        .db $03
  $8F96  F4        .db $F4
  $8F97  01 0D     ORA ($0D,X)
  $8F99  72        .db $72
  $8F9A  B8        CLV
  $8F9B  03        .db $03
  $8F9C  C4 03     CPY $03
  $8F9E  C5 03     CMP $03
  $8FA0  BB        .db $BB
  $8FA1  03        .db $03
  $8FA2  BC 03 BD  LDY $BD03,X
  $8FA5  03        .db $03
  $8FA6  BE 03 BF  LDX $BF03,Y
  $8FA9  03        .db $03
  $8FAA  C0 03     CPY #$03
  $8FAC  C1 03     CMP ($03,X)
  $8FAE  C2        .db $C2
  $8FAF  03        .db $03
  $8FB0  C3        .db $C3
  $8FB1  03        .db $03
  $8FB2  F4        .db $F4
  $8FB3  01 0D     ORA ($0D,X)
  $8FB5  72        .db $72
  $8FB6  B8        CLV
  $8FB7  03        .db $03
  $8FB8  B9 03 BA  LDA $BA03,Y
  $8FBB  03        .db $03
  $8FBC  BB        .db $BB
  $8FBD  03        .db $03
  $8FBE  BC 03 BD  LDY $BD03,X
  $8FC1  02        .db $02
  $8FC2  BE 02 BF  LDX $BF02,Y
  $8FC5  03        .db $03
  $8FC6  C0 03     CPY #$03
  $8FC8  C6 03     DEC $03
  $8FCA  C7        .db $C7
  $8FCB  03        .db $03
  $8FCC  C3        .db $C3
  $8FCD  03        .db $03
  $8FCE  F4        .db $F4
  $8FCF  01 0D     ORA ($0D,X)
  $8FD1  72        .db $72
  $8FD2  B8        CLV
  $8FD3  02        .db $02
  $8FD4  B9 02 BA  LDA $BA02,Y
  $8FD7  02        .db $02
  $8FD8  BB        .db $BB
  $8FD9  02        .db $02
  $8FDA  BC 02 BD  LDY $BD02,X
  $8FDD  03        .db $03
  $8FDE  BE 03 BF  LDX $BF03,Y
  $8FE1  02        .db $02
  $8FE2  C0 02     CPY #$02
  $8FE4  C8        INY
  $8FE5  03        .db $03
  $8FE6  C9 03     CMP #$03
  $8FE8  C3        .db $C3
  $8FE9  02        .db $02
  $8FEA  F4        .db $F4
  $8FEB  01 0D     ORA ($0D,X)
  $8FED  73        .db $73
  $8FEE  CA        DEX
  $8FEF  03        .db $03
  $8FF0  CB        .db $CB
  $8FF1  03        .db $03
  $8FF2  CC 03 CD  CPY $CD03
  $8FF5  03        .db $03
  $8FF6  CE 03 CF  DEC $CF03
  $8FF9  03        .db $03
  $8FFA  D0 03     BNE $8FFF
  $8FFC  D1 03     CMP ($03),Y
  $8FFE  D2        .db $D2

L_8FFF:
  $8FFF  03        .db $03
  $9000  D3        .db $D3
  $9001  03        .db $03
  $9002  D4        .db $D4
  $9003  03        .db $03
  $9004  D5 03     CMP $03,X
  $9006  F5 01     SBC $01,X
  $9008  10 76     BPL $9080
  $900A  AC 03 A0  LDY $A003
  $900D  03        .db $03
  $900E  AD 03 AE  LDA $AE03
  $9011  03        .db $03
  $9012  AF        .db $AF
  $9013  03        .db $03
  $9014  B0 03     BCS $9019
  $9016  D6 03     DEC $03,X
  $9018  D7        .db $D7

L_9019:
  $9019  03        .db $03
  $901A  D8        CLD
  $901B  03        .db $03
  $901C  8F        .db $8F
  $901D  03        .db $03
  $901E  D9 03 DA  CMP $DA03,Y
  $9021  03        .db $03
  $9022  8F        .db $8F
  $9023  03        .db $03
  $9024  F4        .db $F4
  $9025  01 DB     ORA ($DB,X)
  $9027  03        .db $03
  $9028  DC        .db $DC
  $9029  03        .db $03
  $902A  0D 74 E5  ORA $E574
  $902D  03        .db $03
  $902E  E6 03     INC $03
  $9030  E7        .db $E7
  $9031  03        .db $03
  $9032  E8        INX
  $9033  03        .db $03
  $9034  E9 03     SBC #$03
  $9036  EF        .db $EF
  $9037  03        .db $03
  $9038  F0 03     BEQ $903D
  $903A  EC 03 F1  CPX $F103

L_903D:
  $903D  03        .db $03
  $903E  F2        .db $F2
  $903F  03        .db $03
  $9040  8F        .db $8F
  $9041  03        .db $03
  $9042  F5 01     SBC $01,X
  $9044  F3        .db $F3
  $9045  03        .db $03
  $9046  0A        ASL
  $9047  75 A0     ADC $A0,X
  $9049  03        .db $03
  $904A  DD 03 DE  CMP $DE03,X
  $904D  03        .db $03
  $904E  DF        .db $DF
  $904F  03        .db $03
  $9050  F4        .db $F4
  $9051  01 E0     ORA ($E0,X)
  $9053  03        .db $03
  $9054  E1 03     SBC ($03,X)
  $9056  E2        .db $E2
  $9057  03        .db $03
  $9058  E3        .db $E3
  $9059  03        .db $03
  $905A  E4 03     CPX $03
  $905C  0C        .db $0C
  $905D  74        .db $74
  $905E  E5 03     SBC $03
  $9060  E6 03     INC $03
  $9062  E7        .db $E7
  $9063  03        .db $03
  $9064  E8        INX
  $9065  03        .db $03
  $9066  E9 03     SBC #$03
  $9068  EA        NOP
  $9069  03        .db $03
  $906A  EB        .db $EB
  $906B  03        .db $03
  $906C  EC 03 8F  CPX $8F03
  $906F  03        .db $03
  $9070  ED 03 EE  SBC $EE03
  $9073  03        .db $03
  $9074  F4        .db $F4
  $9075  01 09     ORA ($09,X)
  $9077  5B        .db $5B
  $9078  F6 01     INC $01,X
  $907A  F6 01     INC $01,X
  $907C  F6 01     INC $01,X
  $907E  F6 01     INC $01,X

L_9080:
  $9080  F6 01     INC $01,X
  $9082  F6 01     INC $01,X
  $9084  F6 01     INC $01,X
  $9086  F6 01     INC $01,X
  $9088  F6 01     INC $01,X
  $908A  09 5B     ORA #$5B
  $908C  F7        .db $F7
  $908D  01 F7     ORA ($F7,X)
  $908F  01 F7     ORA ($F7,X)
  $9091  01 F7     ORA ($F7,X)
  $9093  01 F7     ORA ($F7,X)
  $9095  01 F7     ORA ($F7,X)
  $9097  01 F7     ORA ($F7,X)
  $9099  01 F7     ORA ($F7,X)
  $909B  01 F7     ORA ($F7,X)
  $909D  01 09     ORA ($09,X)
  $909F  5B        .db $5B
  $90A0  F8        SED
  $90A1  01 F8     ORA ($F8,X)
  $90A3  01 F8     ORA ($F8,X)
  $90A5  01 F8     ORA ($F8,X)
  $90A7  01 F8     ORA ($F8,X)
  $90A9  01 F8     ORA ($F8,X)
  $90AB  01 F8     ORA ($F8,X)
  $90AD  01 F8     ORA ($F8,X)
  $90AF  01 F8     ORA ($F8,X)
  $90B1  01 09     ORA ($09,X)
  $90B3  5C        .db $5C
  $90B4  F6 01     INC $01,X
  $90B6  F6 01     INC $01,X
  $90B8  F6 01     INC $01,X
  $90BA  F6 01     INC $01,X
  $90BC  F6 01     INC $01,X
  $90BE  F6 01     INC $01,X
  $90C0  F6 01     INC $01,X
  $90C2  F6 01     INC $01,X
  $90C4  F6 01     INC $01,X
  $90C6  09 5C     ORA #$5C
  $90C8  F7        .db $F7
  $90C9  01 F7     ORA ($F7,X)
  $90CB  01 F7     ORA ($F7,X)
  $90CD  01 F7     ORA ($F7,X)
  $90CF  01 F7     ORA ($F7,X)
  $90D1  01 F7     ORA ($F7,X)
  $90D3  01 F7     ORA ($F7,X)
  $90D5  01 F7     ORA ($F7,X)
  $90D7  01 F7     ORA ($F7,X)
  $90D9  01 09     ORA ($09,X)
  $90DB  5C        .db $5C
  $90DC  F8        SED
  $90DD  01 F8     ORA ($F8,X)
  $90DF  01 F8     ORA ($F8,X)
  $90E1  01 F8     ORA ($F8,X)
  $90E3  01 F8     ORA ($F8,X)
  $90E5  01 F8     ORA ($F8,X)
  $90E7  01 F8     ORA ($F8,X)
  $90E9  01 F8     ORA ($F8,X)
  $90EB  01 F8     ORA ($F8,X)
  $90ED  01 09     ORA ($09,X)
  $90EF  5D F6 01  EOR $01F6,X
  $90F2  F6 01     INC $01,X
  $90F4  F6 01     INC $01,X
  $90F6  F6 01     INC $01,X
  $90F8  F6 01     INC $01,X
  $90FA  F6 01     INC $01,X
  $90FC  F6 01     INC $01,X
  $90FE  F6 01     INC $01,X
  $9100  F6 01     INC $01,X
  $9102  09 5D     ORA #$5D
  $9104  F7        .db $F7
  $9105  01 F7     ORA ($F7,X)
  $9107  01 F7     ORA ($F7,X)
  $9109  01 F7     ORA ($F7,X)
  $910B  01 F7     ORA ($F7,X)
  $910D  01 F7     ORA ($F7,X)
  $910F  01 F7     ORA ($F7,X)
  $9111  01 F7     ORA ($F7,X)
  $9113  01 F7     ORA ($F7,X)
  $9115  01 09     ORA ($09,X)
  $9117  5D F8 01  EOR $01F8,X
  $911A  F8        SED
  $911B  01 F8     ORA ($F8,X)
  $911D  01 F8     ORA ($F8,X)
  $911F  01 F8     ORA ($F8,X)
  $9121  01 F8     ORA ($F8,X)
  $9123  01 F8     ORA ($F8,X)
  $9125  01 F8     ORA ($F8,X)
  $9127  01 F8     ORA ($F8,X)
  $9129  01 0A     ORA ($0A,X)
  $912B  77        .db $77
  $912C  A0 03     LDY #$03
  $912E  A1 03     LDA ($03,X)
  $9130  A2 03     LDX #$03
  $9132  A3        .db $A3
  $9133  03        .db $03
  $9134  A4 03     LDY $03
  $9136  A5 03     LDA $03
  $9138  A6 03     LDX $03
  $913A  A7        .db $A7
  $913B  03        .db $03
  $913C  A8        TAY
  $913D  03        .db $03
  $913E  A9 03     LDA #$03
  $9140  0C        .db $0C
  $9141  78        SEI
  $9142  AA        TAX
  $9143  03        .db $03
  $9144  AB        .db $AB
  $9145  03        .db $03
  $9146  AC 03 AD  LDY $AD03
  $9149  03        .db $03
  $914A  AE 03 AF  LDX $AF03
  $914D  03        .db $03
  $914E  B0 03     BCS $9153
  $9150  B1 03     LDA ($03),Y
  $9152  B2        .db $B2

L_9153:
  $9153  03        .db $03
  $9154  B3        .db $B3
  $9155  03        .db $03
  $9156  B4 03     LDY $03,X
  $9158  B5 03     LDA $03,X
  $915A  0C        .db $0C
  $915B  79 B6 03  ADC $03B6,Y
  $915E  B7        .db $B7
  $915F  03        .db $03
  $9160  B8        CLV
  $9161  03        .db $03
  $9162  B9 03 BA  LDA $BA03,Y
  $9165  03        .db $03
  $9166  BB        .db $BB
  $9167  03        .db $03
  $9168  BC 03 BD  LDY $BD03,X
  $916B  03        .db $03
  $916C  BE 03 BF  LDX $BF03,Y
  $916F  03        .db $03
  $9170  C0 03     CPY #$03
  $9172  C1 03     CMP ($03,X)
  $9174  0C        .db $0C
  $9175  7A        .db $7A
  $9176  C2        .db $C2
  $9177  03        .db $03
  $9178  C3        .db $C3
  $9179  03        .db $03
  $917A  C4 03     CPY $03
  $917C  C5 03     CMP $03
  $917E  C6 03     DEC $03
  $9180  C7        .db $C7
  $9181  03        .db $03
  $9182  C8        INY
  $9183  03        .db $03
  $9184  C9 03     CMP #$03
  $9186  CA        DEX
  $9187  03        .db $03
  $9188  CB        .db $CB
  $9189  03        .db $03
  $918A  CC 03 CD  CPY $CD03
  $918D  03        .db $03
  $918E  0B        .db $0B
  $918F  7B        .db $7B
  $9190  C2        .db $C2
  $9191  03        .db $03
  $9192  CE 03 C4  DEC $C403
  $9195  03        .db $03
  $9196  CF        .db $CF
  $9197  03        .db $03
  $9198  D0 03     BNE $919D
  $919A  D1 03     CMP ($03),Y
  $919C  D2        .db $D2

L_919D:
  $919D  03        .db $03
  $919E  D3        .db $D3
  $919F  03        .db $03
  $91A0  D4        .db $D4
  $91A1  03        .db $03
  $91A2  D5 03     CMP $03,X
  $91A4  D6 03     DEC $03,X
  $91A6  0B        .db $0B
  $91A7  7C        .db $7C
  $91A8  D7        .db $D7
  $91A9  03        .db $03
  $91AA  D8        CLD
  $91AB  03        .db $03
  $91AC  D9 03 DA  CMP $DA03,Y
  $91AF  03        .db $03
  $91B0  DB        .db $DB
  $91B1  03        .db $03
  $91B2  DC        .db $DC
  $91B3  03        .db $03
  $91B4  DD 03 DE  CMP $DE03,X
  $91B7  03        .db $03
  $91B8  DF        .db $DF
  $91B9  03        .db $03
  $91BA  E0 03     CPX #$03
  $91BC  E1 03     SBC ($03,X)
  $91BE  0D 7D A0  ORA $A07D
  $91C1  03        .db $03
  $91C2  E2        .db $E2
  $91C3  03        .db $03
  $91C4  E3        .db $E3
  $91C5  03        .db $03
  $91C6  E4 03     CPX $03
  $91C8  E5 03     SBC $03
  $91CA  E6 03     INC $03
  $91CC  E7        .db $E7
  $91CD  03        .db $03
  $91CE  E8        INX
  $91CF  03        .db $03
  $91D0  E9 03     SBC #$03
  $91D2  EA        NOP
  $91D3  03        .db $03
  $91D4  EB        .db $EB
  $91D5  03        .db $03
  $91D6  EC 03 EC  CPX $EC03
  $91D9  43        .db $43
  $91DA  0C        .db $0C
  $91DB  7E A0 03  ROR $03A0,X
  $91DE  E2        .db $E2
  $91DF  03        .db $03
  $91E0  E3        .db $E3
  $91E1  03        .db $03
  $91E2  E4 03     CPX $03
  $91E4  E5 03     SBC $03
  $91E6  E6 03     INC $03
  $91E8  E7        .db $E7
  $91E9  03        .db $03
  $91EA  E8        INX
  $91EB  03        .db $03
  $91EC  ED 03 EE  SBC $EE03
  $91EF  03        .db $03
  $91F0  EF        .db $EF
  $91F1  03        .db $03
  $91F2  F0 03     BEQ $91F7
  $91F4  09 7F     ORA #$7F
  $91F6  A1 03     LDA ($03,X)
  $91F8  A2 03     LDX #$03
  $91FA  A3        .db $A3
  $91FB  03        .db $03
  $91FC  A4 03     LDY $03
  $91FE  A5 03     LDA $03
  $9200  A6 03     LDX $03
  $9202  A7        .db $A7
  $9203  03        .db $03
  $9204  A8        TAY
  $9205  03        .db $03
  $9206  A0 01     LDY #$01
  $9208  0B        .db $0B
  $9209  80        .db $80
  $920A  A9 03     LDA #$03
  $920C  AA        TAX
  $920D  03        .db $03
  $920E  AB        .db $AB
  $920F  03        .db $03
  $9210  AC 03 AD  LDY $AD03
  $9213  03        .db $03
  $9214  AE 03 AF  LDX $AF03
  $9217  03        .db $03
  $9218  B0 03     BCS $921D
  $921A  B1 03     LDA ($03),Y
  $921C  B2        .db $B2

L_921D:
  $921D  03        .db $03
  $921E  A0 01     LDY #$01
  $9220  09 81     ORA #$81
  $9222  B3        .db $B3
  $9223  03        .db $03
  $9224  B4 03     LDY $03,X
  $9226  B5 03     LDA $03,X
  $9228  A0 01     LDY #$01
  $922A  B6 03     LDX $03,Y
  $922C  B7        .db $B7
  $922D  03        .db $03
  $922E  B8        CLV
  $922F  03        .db $03
  $9230  B9 03 BA  LDA $BA03,Y
  $9233  03        .db $03
  $9234  0A        ASL
  $9235  7F        .db $7F
  $9236  A1 03     LDA ($03,X)
  $9238  BB        .db $BB
  $9239  03        .db $03
  $923A  BC 03 BD  LDY $BD03,X
  $923D  03        .db $03
  $923E  BE 03 BF  LDX $BF03,Y
  $9241  03        .db $03
  $9242  C0 03     CPY #$03
  $9244  C1 03     CMP ($03,X)
  $9246  A0 01     LDY #$01
  $9248  C2        .db $C2
  $9249  03        .db $03
  $924A  0C        .db $0C
  $924B  82        .db $82
  $924C  C3        .db $C3
  $924D  02        .db $02
  $924E  C4 02     CPY $02
  $9250  A1 03     LDA ($03,X)
  $9252  C5 03     CMP $03
  $9254  C6 03     DEC $03
  $9256  C7        .db $C7
  $9257  03        .db $03
  $9258  C8        INY
  $9259  03        .db $03
  $925A  C9 03     CMP #$03
  $925C  CA        DEX
  $925D  03        .db $03
  $925E  CB        .db $CB
  $925F  03        .db $03
  $9260  CC 03 A0  CPY $A003
  $9263  01 0C     ORA ($0C,X)
  $9265  80        .db $80
  $9266  A9 03     LDA #$03
  $9268  CD 03 CE  CMP $CE03
  $926B  03        .db $03
  $926C  AC 03 CF  LDY $CF03
  $926F  03        .db $03
  $9270  D0 03     BNE $9275
  $9272  AF        .db $AF
  $9273  03        .db $03
  $9274  D1 03     CMP ($03),Y
  $9276  D2        .db $D2
  $9277  03        .db $03
  $9278  D3        .db $D3
  $9279  03        .db $03
  $927A  A0 01     LDY #$01
  $927C  D4        .db $D4
  $927D  03        .db $03
  $927E  0A        ASL
  $927F  83        .db $83
  $9280  D5 03     CMP $03,X
  $9282  D6 03     DEC $03,X
  $9284  D8        CLD
  $9285  03        .db $03
  $9286  D9 03 DA  CMP $DA03,Y
  $9289  03        .db $03
  $928A  DB        .db $DB
  $928B  03        .db $03
  $928C  DC        .db $DC
  $928D  03        .db $03
  $928E  DD 03 A0  CMP $A003,X
  $9291  01 D7     ORA ($D7,X)
  $9293  03        .db $03
  $9294  07        .db $07
  $9295  84 DE     STY $DE
  $9297  03        .db $03
  $9298  DF        .db $DF
  $9299  03        .db $03
  $929A  E0 03     CPX #$03
  $929C  E1 03     SBC ($03,X)
  $929E  E2        .db $E2
  $929F  03        .db $03
  $92A0  E3        .db $E3
  $92A1  03        .db $03
  $92A2  A0 01     LDY #$01
  $92A4  09 83     ORA #$83
  $92A6  D5 03     CMP $03,X
  $92A8  D6 03     DEC $03,X
  $92AA  E4 03     CPX $03
  $92AC  E5 03     SBC $03
  $92AE  E6 03     INC $03
  $92B0  E7        .db $E7
  $92B1  03        .db $03
  $92B2  E8        INX
  $92B3  03        .db $03
  $92B4  E9 03     SBC #$03
  $92B6  A0 01     LDY #$01
  $92B8  11 85     ORA ($85),Y
  $92BA  A0 03     LDY #$03
  $92BC  A1 03     LDA ($03,X)
  $92BE  A2 03     LDX #$03
  $92C0  A3        .db $A3
  $92C1  03        .db $03
  $92C2  A4 03     LDY $03
  $92C4  A5 03     LDA $03
  $92C6  A6 03     LDX $03
  $92C8  A7        .db $A7
  $92C9  03        .db $03
  $92CA  A8        TAY
  $92CB  03        .db $03
  $92CC  A9 03     LDA #$03
  $92CE  AA        TAX
  $92CF  03        .db $03
  $92D0  AB        .db $AB
  $92D1  03        .db $03
  $92D2  AC 03 AD  LDY $AD03
  $92D5  03        .db $03
  $92D6  AE 03 AF  LDX $AF03
  $92D9  03        .db $03
  $92DA  DE 01 12  DEC $1201,X
  $92DD  86 B0     STX $B0
  $92DF  03        .db $03
  $92E0  B1 03     LDA ($03),Y
  $92E2  B2        .db $B2
  $92E3  03        .db $03
  $92E4  B3        .db $B3
  $92E5  03        .db $03
  $92E6  B4 03     LDY $03,X
  $92E8  B5 03     LDA $03,X
  $92EA  B6 03     LDX $03,Y
  $92EC  B7        .db $B7
  $92ED  03        .db $03
  $92EE  B8        CLV
  $92EF  03        .db $03
  $92F0  B9 03 BA  LDA $BA03,Y
  $92F3  03        .db $03
  $92F4  BB        .db $BB
  $92F5  03        .db $03
  $92F6  BC 03 BD  LDY $BD03,X
  $92F9  03        .db $03
  $92FA  BE 03 BF  LDX $BF03,Y
  $92FD  03        .db $03
  $92FE  C0 03     CPY #$03
  $9300  DE 01 12  DEC $1201,X
  $9303  86 B0     STX $B0
  $9305  03        .db $03
  $9306  B1 03     LDA ($03),Y
  $9308  B2        .db $B2
  $9309  03        .db $03
  $930A  B3        .db $B3
  $930B  03        .db $03
  $930C  B4 03     LDY $03,X
  $930E  C1 03     CMP ($03,X)
  $9310  C2        .db $C2
  $9311  03        .db $03
  $9312  B7        .db $B7
  $9313  03        .db $03
  $9314  B8        CLV
  $9315  03        .db $03
  $9316  B9 03 C3  LDA $C303,Y
  $9319  03        .db $03
  $931A  C4 03     CPY $03
  $931C  BC 03 BD  LDY $BD03,X
  $931F  03        .db $03
  $9320  BE 03 BF  LDX $BF03,Y
  $9323  03        .db $03
  $9324  C0 03     CPY #$03
  $9326  DE 01 13  DEC $1301,X
  $9329  87        .db $87
  $932A  B0 03     BCS $932F
  $932C  B1 03     LDA ($03),Y
  $932E  B2        .db $B2

L_932F:
  $932F  03        .db $03
  $9330  B3        .db $B3
  $9331  03        .db $03
  $9332  B4 03     LDY $03,X
  $9334  B5 03     LDA $03,X
  $9336  B6 03     LDX $03,Y
  $9338  B7        .db $B7
  $9339  03        .db $03
  $933A  B8        CLV
  $933B  03        .db $03
  $933C  C5 03     CMP $03
  $933E  C6 03     DEC $03
  $9340  C7        .db $C7
  $9341  03        .db $03
  $9342  C8        INY
  $9343  03        .db $03
  $9344  C9 03     CMP #$03
  $9346  CA        DEX
  $9347  03        .db $03
  $9348  CB        .db $CB
  $9349  03        .db $03
  $934A  CC 03 CD  CPY $CD03
  $934D  03        .db $03
  $934E  DE 01 11  DEC $1101,X
  $9351  88        DEY
  $9352  CE 03 CF  DEC $CF03
  $9355  03        .db $03
  $9356  D0 03     BNE $935B
  $9358  D1 03     CMP ($03),Y
  $935A  D2        .db $D2

L_935B:
  $935B  03        .db $03
  $935C  D3        .db $D3
  $935D  03        .db $03
  $935E  D4        .db $D4
  $935F  03        .db $03
  $9360  D5 03     CMP $03,X
  $9362  D6 03     DEC $03,X
  $9364  D7        .db $D7
  $9365  03        .db $03
  $9366  D8        CLD
  $9367  03        .db $03
  $9368  D9 03 DA  CMP $DA03,Y
  $936B  03        .db $03
  $936C  DB        .db $DB
  $936D  03        .db $03
  $936E  DC        .db $DC
  $936F  03        .db $03
  $9370  DD 03 DE  CMP $DE03,X
  $9373  01 0B     ORA ($0B,X)
  $9375  89        .db $89
  $9376  A0 03     LDY #$03
  $9378  A1 03     LDA ($03,X)
  $937A  A2 03     LDX #$03
  $937C  A3        .db $A3
  $937D  03        .db $03
  $937E  A4 03     LDY $03
  $9380  A5 03     LDA $03
  $9382  A6 03     LDX $03
  $9384  A7        .db $A7
  $9385  03        .db $03
  $9386  A8        TAY
  $9387  03        .db $03
  $9388  A9 03     LDA #$03
  $938A  F3        .db $F3
  $938B  01 0D     ORA ($0D,X)
  $938D  8A        TXA
  $938E  AA        TAX
  $938F  03        .db $03
  $9390  AB        .db $AB
  $9391  03        .db $03
  $9392  AC 03 AD  LDY $AD03
  $9395  03        .db $03
  $9396  AE 03 AF  LDX $AF03
  $9399  03        .db $03
  $939A  B0 03     BCS $939F
  $939C  B1 03     LDA ($03),Y
  $939E  B2        .db $B2

L_939F:
  $939F  03        .db $03
  $93A0  B3        .db $B3
  $93A1  03        .db $03
  $93A2  B4 03     LDY $03,X
  $93A4  B5 03     LDA $03,X
  $93A6  F3        .db $F3
  $93A7  01 0D     ORA ($0D,X)
  $93A9  8B        .db $8B
  $93AA  B6 03     LDX $03,Y
  $93AC  B7        .db $B7
  $93AD  03        .db $03
  $93AE  B8        CLV
  $93AF  03        .db $03
  $93B0  B9 03 BA  LDA $BA03,Y
  $93B3  03        .db $03
  $93B4  BB        .db $BB
  $93B5  03        .db $03
  $93B6  BC 03 BD  LDY $BD03,X
  $93B9  03        .db $03
  $93BA  BE 03 BF  LDX $BF03,Y
  $93BD  03        .db $03
  $93BE  C0 03     CPY #$03
  $93C0  C1 03     CMP ($03,X)
  $93C2  F3        .db $F3
  $93C3  01 0E     ORA ($0E,X)
  $93C5  8C B6 03  STY $03B6
  $93C8  B7        .db $B7
  $93C9  03        .db $03
  $93CA  B8        CLV
  $93CB  03        .db $03
  $93CC  B9 03 BA  LDA $BA03,Y
  $93CF  03        .db $03
  $93D0  BB        .db $BB
  $93D1  03        .db $03
  $93D2  BC 03 BD  LDY $BD03,X
  $93D5  03        .db $03
  $93D6  C2        .db $C2
  $93D7  03        .db $03
  $93D8  C3        .db $C3
  $93D9  03        .db $03
  $93DA  C4 03     CPY $03
  $93DC  C5 03     CMP $03
  $93DE  C6 03     DEC $03
  $93E0  F3        .db $F3
  $93E1  01 0C     ORA ($0C,X)
  $93E3  8D C7 03  STA $03C7
  $93E6  C8        INY

L_93E7:
  $93E7  03        .db $03
  $93E8  C9 03     CMP #$03
  $93EA  CA        DEX
  $93EB  03        .db $03
  $93EC  CB        .db $CB
  $93ED  03        .db $03
  $93EE  CC 03 CD  CPY $CD03
  $93F1  03        .db $03
  $93F2  CE 03 CF  DEC $CF03
  $93F5  03        .db $03
  $93F6  D0 03     BNE $93FB
  $93F8  D1 03     CMP ($03),Y
  $93FA  F3        .db $F3

L_93FB:
  $93FB  01 0D     ORA ($0D,X)
  $93FD  8E D2 03  STX $03D2
  $9400  D3        .db $D3
  $9401  03        .db $03
  $9402  D4        .db $D4
  $9403  03        .db $03
  $9404  D5 03     CMP $03,X
  $9406  D6 03     DEC $03,X
  $9408  D8        CLD
  $9409  03        .db $03
  $940A  D9 03 DA  CMP $DA03,Y
  $940D  03        .db $03
  $940E  DB        .db $DB
  $940F  03        .db $03
  $9410  DC        .db $DC
  $9411  03        .db $03
  $9412  DD 03 D7  CMP $D703,X
  $9415  03        .db $03
  $9416  F3        .db $F3
  $9417  01 0C     ORA ($0C,X)
  $9419  89        .db $89
  $941A  A0 03     LDY #$03
  $941C  DE 03 A2  DEC $A203,X
  $941F  03        .db $03
  $9420  A3        .db $A3
  $9421  03        .db $03
  $9422  E0 03     CPX #$03
  $9424  E1 03     SBC ($03,X)
  $9426  E2        .db $E2
  $9427  03        .db $03
  $9428  E3        .db $E3
  $9429  03        .db $03
  $942A  E4 03     CPX $03
  $942C  E5 03     SBC $03

L_942E:
  $942E  F3        .db $F3
  $942F  01 DF     ORA ($DF,X)
  $9431  03        .db $03
  $9432  08        PHP
  $9433  8F        .db $8F
  $9434  E6 03     INC $03
  $9436  E7        .db $E7
  $9437  03        .db $03
  $9438  E8        INX
  $9439  03        .db $03
  $943A  E9 03     SBC #$03
  $943C  EA        NOP
  $943D  03        .db $03
  $943E  EB        .db $EB
  $943F  03        .db $03
  $9440  EC 03 F3  CPX $F303
  $9443  01 09     ORA ($09,X)
  $9445  90 A0     BCC $93E7
  $9447  03        .db $03
  $9448  A1 03     LDA ($03,X)
  $944A  ED 03 EE  SBC $EE03
  $944D  03        .db $03
  $944E  EF        .db $EF
  $944F  03        .db $03

L_9450:
  $9450  F0 03     BEQ $9455
  $9452  F1 03     SBC ($03),Y
  $9454  F2        .db $F2

L_9455:
  $9455  03        .db $03
  $9456  F3        .db $F3
  $9457  01 10     ORA ($10,X)
  $9459  91 A0     STA ($A0),Y
  $945B  03        .db $03
  $945C  A1 03     LDA ($03,X)
  $945E  A2 03     LDX #$03
  $9460  A3        .db $A3
  $9461  03        .db $03
  $9462  A4 03     LDY $03
  $9464  A5 03     LDA $03
  $9466  A6 03     LDX $03
  $9468  A7        .db $A7
  $9469  03        .db $03
  $946A  A8        TAY
  $946B  03        .db $03
  $946C  A9 03     LDA #$03
  $946E  AA        TAX
  $946F  03        .db $03
  $9470  AB        .db $AB
  $9471  03        .db $03
  $9472  AC 03 AC  LDY $AC03
  $9475  43        .db $43
  $9476  AD 03 F4  LDA $F403
  $9479  02        .db $02
  $947A  0F        .db $0F
  $947B  93        .db $93
  $947C  AE 03 AF  LDX $AF03
  $947F  03        .db $03
  $9480  B0 03     BCS $9485
  $9482  B1 03     LDA ($03),Y
  $9484  B2        .db $B2

L_9485:
  $9485  03        .db $03
  $9486  B3        .db $B3
  $9487  03        .db $03
  $9488  B4 03     LDY $03,X
  $948A  B5 03     LDA $03,X
  $948C  B6 03     LDX $03,Y
  $948E  B7        .db $B7
  $948F  03        .db $03
  $9490  B8        CLV
  $9491  03        .db $03
  $9492  B9 03 BA  LDA $BA03,Y
  $9495  03        .db $03
  $9496  BB        .db $BB
  $9497  03        .db $03
  $9498  F4        .db $F4
  $9499  02        .db $02
  $949A  10 92     BPL $942E
  $949C  AE 03 AF  LDX $AF03
  $949F  03        .db $03
  $94A0  B0 03     BCS $94A5
  $94A2  BC 03 BD  LDY $BD03,X

L_94A5:
  $94A5  03        .db $03
  $94A6  BE 03 BF  LDX $BF03,Y
  $94A9  03        .db $03
  $94AA  C0 03     CPY #$03
  $94AC  C1 03     CMP ($03,X)
  $94AE  C2        .db $C2
  $94AF  03        .db $03
  $94B0  C3        .db $C3
  $94B1  03        .db $03
  $94B2  B8        CLV
  $94B3  03        .db $03
  $94B4  B9 03 BA  LDA $BA03,Y
  $94B7  03        .db $03
  $94B8  BB        .db $BB
  $94B9  03        .db $03
  $94BA  F4        .db $F4
  $94BB  02        .db $02
  $94BC  10 92     BPL $9450
  $94BE  AE 03 AF  LDX $AF03
  $94C1  03        .db $03
  $94C2  B0 03     BCS $94C7
  $94C4  C4 03     CPY $03
  $94C6  C5 03     CMP $03
  $94C8  C6 03     DEC $03
  $94CA  C7        .db $C7
  $94CB  03        .db $03
  $94CC  C8        INY
  $94CD  03        .db $03
  $94CE  C9 03     CMP #$03
  $94D0  C2        .db $C2
  $94D1  03        .db $03
  $94D2  CA        DEX
  $94D3  03        .db $03
  $94D4  B8        CLV
  $94D5  03        .db $03
  $94D6  B9 03 BA  LDA $BA03,Y
  $94D9  03        .db $03
  $94DA  BB        .db $BB
  $94DB  03        .db $03
  $94DC  F4        .db $F4
  $94DD  02        .db $02
  $94DE  11 91     ORA ($91),Y
  $94E0  A0 03     LDY #$03
  $94E2  A1 03     LDA ($03,X)
  $94E4  CC 03 CD  CPY $CD03
  $94E7  03        .db $03
  $94E8  CE 03 A5  DEC $A503
  $94EB  03        .db $03
  $94EC  CF        .db $CF
  $94ED  03        .db $03
  $94EE  D0 03     BNE $94F3
  $94F0  D1 03     CMP ($03),Y
  $94F2  D2        .db $D2

L_94F3:
  $94F3  03        .db $03
  $94F4  D3        .db $D3
  $94F5  03        .db $03
  $94F6  D4        .db $D4
  $94F7  03        .db $03
  $94F8  D5 03     CMP $03,X
  $94FA  D5 43     CMP $43,X
  $94FC  D6 03     DEC $03,X
  $94FE  F4        .db $F4
  $94FF  02        .db $02
  $9500  CB        .db $CB
  $9501  03        .db $03
  $9502  0F        .db $0F
  $9503  94 D7     STY $D7,X
  $9505  03        .db $03
  $9506  D7        .db $D7
  $9507  43        .db $43
  $9508  D8        CLD
  $9509  03        .db $03
  $950A  D9 03 DA  CMP $DA03,Y
  $950D  03        .db $03
  $950E  DB        .db $DB
  $950F  03        .db $03
  $9510  DC        .db $DC
  $9511  03        .db $03
  $9512  DD 03 DE  CMP $DE03,X
  $9515  03        .db $03
  $9516  DF        .db $DF
  $9517  03        .db $03
  $9518  E0 03     CPX #$03
  $951A  E1 03     SBC ($03,X)
  $951C  E2        .db $E2
  $951D  03        .db $03
  $951E  E3        .db $E3
  $951F  03        .db $03
  $9520  F4        .db $F4
  $9521  02        .db $02
  $9522  11 95     ORA ($95),Y
  $9524  E4 03     CPX $03
  $9526  E5 03     SBC $03
  $9528  E6 03     INC $03
  $952A  E7        .db $E7
  $952B  03        .db $03
  $952C  E8        INX
  $952D  03        .db $03
  $952E  E9 03     SBC #$03
  $9530  EA        NOP
  $9531  03        .db $03
  $9532  EB        .db $EB
  $9533  03        .db $03
  $9534  EC 03 ED  CPX $ED03
  $9537  03        .db $03
  $9538  EE 03 EF  INC $EF03
  $953B  03        .db $03
  $953C  F0 03     BEQ $9541
  $953E  F1 03     SBC ($03),Y
  $9540  F2        .db $F2

L_9541:
  $9541  03        .db $03
  $9542  F3        .db $F3
  $9543  03        .db $03
  $9544  F4        .db $F4
  $9545  02        .db $02
  $9546  09 38     ORA #$38
  $9548  C5 02     CMP $02
  $954A  B9 02 BA  LDA $BA02,Y
  $954D  02        .db $02
  $954E  BB        .db $BB
  $954F  02        .db $02
  $9550  BC 02 8F  LDY $8F02,X
  $9553  02        .db $02
  $9554  8F        .db $8F
  $9555  02        .db $02
  $9556  BD 02 BE  LDA $BE02,X
  $9559  02        .db $02
  $955A  07        .db $07
  $955B  38        SEC
  $955C  C5 02     CMP $02
  $955E  BF        .db $BF
  $955F  02        .db $02
  $9560  C0 02     CPY #$02
  $9562  C1 02     CMP ($02,X)
  $9564  C2        .db $C2
  $9565  02        .db $02
  $9566  C3        .db $C3
  $9567  02        .db $02
  $9568  C4 02     CPY $02
  $956A  0F        .db $0F
  $956B  9E        .db $9E
  $956C  A0 03     LDY #$03
  $956E  A1 03     LDA ($03,X)
  $9570  A2 03     LDX #$03
  $9572  A3        .db $A3
  $9573  03        .db $03
  $9574  A4 03     LDY $03
  $9576  A5 03     LDA $03
  $9578  A6 03     LDX $03
  $957A  A7        .db $A7
  $957B  03        .db $03
  $957C  A8        TAY
  $957D  03        .db $03
  $957E  A9 03     LDA #$03
  $9580  AA        TAX
  $9581  03        .db $03
  $9582  AB        .db $AB
  $9583  03        .db $03
  $9584  AC 03 AD  LDY $AD03
  $9587  03        .db $03
  $9588  AE 03 10  LDX $1003
  $958B  9F        .db $9F
  $958C  A0 03     LDY #$03
  $958E  A1 03     LDA ($03,X)
  $9590  A2 03     LDX #$03
  $9592  AF        .db $AF
  $9593  03        .db $03
  $9594  B0 03     BCS $9599
  $9596  B3        .db $B3
  $9597  03        .db $03
  $9598  B1 03     LDA ($03),Y
  $959A  B2        .db $B2
  $959B  03        .db $03
  $959C  B4 03     LDY $03,X
  $959E  B5 03     LDA $03,X
  $95A0  B6 03     LDX $03,Y
  $95A2  B7        .db $B7
  $95A3  03        .db $03
  $95A4  B8        CLV
  $95A5  03        .db $03
  $95A6  B9 03 BA  LDA $BA03,Y
  $95A9  03        .db $03
  $95AA  BB        .db $BB
  $95AB  03        .db $03
  $95AC  04        .db $04
  $95AD  17        .db $17
  $95AE  FF        .db $FF
  $95AF  02        .db $02
  $95B0  FF        .db $FF
  $95B1  42        .db $42
  $95B2  FF        .db $FF
  $95B3  82        .db $82
  $95B4  FF        .db $FF
  $95B5  C2        .db $C2
  $95B6  24 2E     BIT $2E
  $95B8  AE 02 AF  LDX $AF02
  $95BB  02        .db $02
  $95BC  B0 02     BCS $95C0
  $95BE  B1 02     LDA ($02),Y

L_95C0:
  $95C0  B2        .db $B2
  $95C1  02        .db $02
  $95C2  B3        .db $B3
  $95C3  02        .db $02
  $95C4  D8        CLD
  $95C5  02        .db $02
  $95C6  D9 02 D9  CMP $D902,Y
  $95C9  42        .db $42
  $95CA  D8        CLD
  $95CB  42        .db $42
  $95CC  DA        .db $DA
  $95CD  02        .db $02
  $95CE  DB        .db $DB
  $95CF  02        .db $02
  $95D0  DC        .db $DC
  $95D1  02        .db $02
  $95D2  DC        .db $DC
  $95D3  42        .db $42
  $95D4  DB        .db $DB
  $95D5  42        .db $42
  $95D6  DD 02 DE  CMP $DE02,X
  $95D9  02        .db $02
  $95DA  DF        .db $DF
  $95DB  02        .db $02
  $95DC  DF        .db $DF
  $95DD  42        .db $42
  $95DE  DE 42 A0  DEC $A042,X
  $95E1  02        .db $02
  $95E2  A1 02     LDA ($02,X)
  $95E4  A2 02     LDX #$02
  $95E6  A3        .db $A3
  $95E7  02        .db $02
  $95E8  AC 02 AD  LDY $AD02
  $95EB  02        .db $02
  $95EC  AA        TAX
  $95ED  02        .db $02
  $95EE  A9 02     LDA #$02
  $95F0  A8        TAY
  $95F1  02        .db $02
  $95F2  8F        .db $8F
  $95F3  02        .db $02
  $95F4  8F        .db $8F
  $95F5  02        .db $02
  $95F6  B4 02     LDY $02,X
  $95F8  B5 02     LDA $02,X
  $95FA  B6 02     LDX $02,Y
  $95FC  DA        .db $DA
  $95FD  42        .db $42
  $95FE  AB        .db $AB
  $95FF  02        .db $02
  $9600  24 2E     BIT $2E
  $9602  AE 02 AF  LDX $AF02
  $9605  02        .db $02
  $9606  B0 02     BCS $960A
  $9608  B1 02     LDA ($02),Y

L_960A:
  $960A  B2        .db $B2
  $960B  02        .db $02
  $960C  B3        .db $B3
  $960D  02        .db $02
  $960E  D8        CLD
  $960F  02        .db $02
  $9610  D9 02 D9  CMP $D902,Y
  $9613  42        .db $42
  $9614  D8        CLD
  $9615  42        .db $42
  $9616  DA        .db $DA
  $9617  02        .db $02
  $9618  DB        .db $DB
  $9619  02        .db $02
  $961A  DC        .db $DC
  $961B  02        .db $02
  $961C  DC        .db $DC
  $961D  42        .db $42
  $961E  DB        .db $DB
  $961F  42        .db $42
  $9620  DD 02 DE  CMP $DE02,X
  $9623  02        .db $02
  $9624  DF        .db $DF
  $9625  02        .db $02
  $9626  DF        .db $DF
  $9627  42        .db $42
  $9628  DE 42 A0  DEC $A042,X
  $962B  02        .db $02
  $962C  A1 02     LDA ($02,X)
  $962E  A2 02     LDX #$02
  $9630  A3        .db $A3
  $9631  02        .db $02
  $9632  AC 02 AD  LDY $AD02
  $9635  02        .db $02
  $9636  8F        .db $8F
  $9637  02        .db $02
  $9638  8F        .db $8F
  $9639  02        .db $02
  $963A  A8        TAY
  $963B  82        .db $82
  $963C  A9 82     LDA #$82
  $963E  AA        TAX
  $963F  82        .db $82
  $9640  B4 02     LDY $02,X
  $9642  B5 02     LDA $02,X
  $9644  B6 02     LDX $02,Y
  $9646  DA        .db $DA
  $9647  42        .db $42
  $9648  AB        .db $AB
  $9649  02        .db $02
  $964A  2D 2E 8F  AND $8F2E
  $964D  02        .db $02
  $964E  B9 02 8F  LDA $8F02,Y
  $9651  02        .db $02
  $9652  BD 02 8F  LDA $8F02,X
  $9655  02        .db $02
  $9656  8F        .db $8F
  $9657  02        .db $02
  $9658  D8        CLD
  $9659  02        .db $02
  $965A  D9 02 D9  CMP $D902,Y
  $965D  42        .db $42
  $965E  D8        CLD
  $965F  42        .db $42
  $9660  DA        .db $DA
  $9661  02        .db $02
  $9662  DB        .db $DB
  $9663  02        .db $02
  $9664  DC        .db $DC
  $9665  02        .db $02
  $9666  DC        .db $DC
  $9667  42        .db $42
  $9668  DB        .db $DB
  $9669  42        .db $42
  $966A  DD 02 DE  CMP $DE02,X
  $966D  02        .db $02
  $966E  DF        .db $DF
  $966F  02        .db $02
  $9670  DF        .db $DF
  $9671  42        .db $42
  $9672  DE 42 A0  DEC $A042,X
  $9675  02        .db $02
  $9676  A1 02     LDA ($02,X)
  $9678  A2 02     LDX #$02
  $967A  A3        .db $A3
  $967B  02        .db $02
  $967C  AC 02 AD  LDY $AD02
  $967F  02        .db $02
  $9680  AA        TAX
  $9681  02        .db $02
  $9682  A9 02     LDA #$02
  $9684  A8        TAY
  $9685  02        .db $02
  $9686  8F        .db $8F
  $9687  02        .db $02
  $9688  8F        .db $8F
  $9689  02        .db $02
  $968A  B4 02     LDY $02,X
  $968C  B5 02     LDA $02,X
  $968E  B6 02     LDX $02,Y
  $9690  DA        .db $DA
  $9691  42        .db $42
  $9692  AB        .db $AB
  $9693  02        .db $02
  $9694  B7        .db $B7
  $9695  02        .db $02
  $9696  B8        CLV
  $9697  02        .db $02
  $9698  BA        TSX
  $9699  01 BB     ORA ($BB,X)
  $969B  01 BC     ORA ($BC,X)
  $969D  01 BE     ORA ($BE,X)
  $969F  01 BF     ORA ($BF,X)
  $96A1  01 C0     ORA ($C0,X)
  $96A3  01 C1     ORA ($C1,X)
  $96A5  02        .db $02
  $96A6  C2        .db $C2
  $96A7  02        .db $02
  $96A8  2D 2E 8F  AND $8F2E
  $96AB  02        .db $02
  $96AC  B9 02 8F  LDA $8F02,Y
  $96AF  02        .db $02
  $96B0  BD 02 8F  LDA $8F02,X
  $96B3  02        .db $02
  $96B4  8F        .db $8F
  $96B5  02        .db $02
  $96B6  D8        CLD
  $96B7  02        .db $02
  $96B8  D9 02 D9  CMP $D902,Y
  $96BB  42        .db $42
  $96BC  D8        CLD
  $96BD  42        .db $42
  $96BE  DA        .db $DA
  $96BF  02        .db $02
  $96C0  DB        .db $DB
  $96C1  02        .db $02
  $96C2  DC        .db $DC
  $96C3  02        .db $02
  $96C4  DC        .db $DC
  $96C5  42        .db $42
  $96C6  DB        .db $DB
  $96C7  42        .db $42
  $96C8  DD 02 DE  CMP $DE02,X
  $96CB  02        .db $02
  $96CC  DF        .db $DF
  $96CD  02        .db $02
  $96CE  DF        .db $DF
  $96CF  42        .db $42
  $96D0  DE 42 A0  DEC $A042,X
  $96D3  02        .db $02
  $96D4  A1 02     LDA ($02,X)
  $96D6  A2 02     LDX #$02
  $96D8  A3        .db $A3
  $96D9  02        .db $02
  $96DA  AC 02 AD  LDY $AD02
  $96DD  02        .db $02
  $96DE  8F        .db $8F
  $96DF  03        .db $03
  $96E0  8F        .db $8F
  $96E1  03        .db $03
  $96E2  A8        TAY
  $96E3  82        .db $82
  $96E4  A9 82     LDA #$82
  $96E6  AA        TAX
  $96E7  82        .db $82
  $96E8  B4 02     LDY $02,X
  $96EA  B5 02     LDA $02,X
  $96EC  B6 02     LDX $02,Y
  $96EE  DA        .db $DA
  $96EF  42        .db $42
  $96F0  AB        .db $AB
  $96F1  02        .db $02
  $96F2  B7        .db $B7
  $96F3  02        .db $02
  $96F4  B8        CLV
  $96F5  02        .db $02
  $96F6  C3        .db $C3
  $96F7  01 C4     ORA ($C4,X)
  $96F9  01 C5     ORA ($C5,X)
  $96FB  01 C6     ORA ($C6,X)
  $96FD  01 C7     ORA ($C7,X)
  $96FF  01 C8     ORA ($C8,X)
  $9701  01 C1     ORA ($C1,X)
  $9703  02        .db $02
  $9704  C2        .db $C2
  $9705  02        .db $02
  $9706  1C        .db $1C
  $9707  4D DC 02  EOR $02DC
  $970A  DC        .db $DC
  $970B  42        .db $42
  $970C  DF        .db $DF
  $970D  02        .db $02
  $970E  DF        .db $DF
  $970F  42        .db $42
  $9710  E2        .db $E2
  $9711  21 E2     AND ($E2,X)
  $9713  61 E5     ADC ($E5,X)
  $9715  21 E5     AND ($E5,X)
  $9717  61 DA     ADC ($DA,X)
  $9719  02        .db $02
  $971A  DB        .db $DB
  $971B  02        .db $02
  $971C  DB        .db $DB
  $971D  42        .db $42
  $971E  DA        .db $DA
  $971F  42        .db $42
  $9720  DD 02 DE  CMP $DE02,X
  $9723  02        .db $02
  $9724  DE 42 DD  DEC $DD42,X
  $9727  42        .db $42
  $9728  E0 21     CPX #$21
  $972A  E1 21     SBC ($21,X)
  $972C  E1 61     SBC ($61,X)
  $972E  E0 61     CPX #$61
  $9730  E3        .db $E3
  $9731  21 E4     AND ($E4,X)
  $9733  21 E4     AND ($E4,X)
  $9735  61 E3     ADC ($E3,X)
  $9737  61 D8     ADC ($D8,X)
  $9739  02        .db $02
  $973A  D9 02 D9  CMP $D902,Y
  $973D  42        .db $42
  $973E  D8        CLD
  $973F  42        .db $42
  $9740  1C        .db $1C
  $9741  4D DC 02  EOR $02DC
  $9744  DC        .db $DC
  $9745  42        .db $42
  $9746  DF        .db $DF
  $9747  02        .db $02
  $9748  DF        .db $DF
  $9749  42        .db $42
  $974A  E8        INX
  $974B  21 E9     AND ($E9,X)
  $974D  21 E5     AND ($E5,X)
  $974F  21 E5     AND ($E5,X)
  $9751  61 DA     ADC ($DA,X)
  $9753  02        .db $02
  $9754  DB        .db $DB
  $9755  02        .db $02
  $9756  DB        .db $DB
  $9757  42        .db $42
  $9758  DA        .db $DA
  $9759  42        .db $42
  $975A  DD 02 DE  CMP $DE02,X
  $975D  02        .db $02
  $975E  DE 42 DD  DEC $DD42,X
  $9761  42        .db $42
  $9762  E6 21     INC $21
  $9764  E7        .db $E7
  $9765  21 EA     AND ($EA,X)
  $9767  21 EB     AND ($EB,X)
  $9769  21 E3     AND ($E3,X)
  $976B  21 E4     AND ($E4,X)
  $976D  21 E4     AND ($E4,X)
  $976F  61 E3     ADC ($E3,X)
  $9771  61 D8     ADC ($D8,X)
  $9773  02        .db $02
  $9774  D9 02 D9  CMP $D902,Y
  $9777  42        .db $42
  $9778  D8        CLD
  $9779  42        .db $42
  $977A  1C        .db $1C
  $977B  4D DC 02  EOR $02DC
  $977E  DC        .db $DC
  $977F  42        .db $42
  $9780  DF        .db $DF
  $9781  02        .db $02
  $9782  DF        .db $DF
  $9783  42        .db $42
  $9784  E9 61     SBC #$61
  $9786  E8        INX
  $9787  61 E5     ADC ($E5,X)
  $9789  21 E5     AND ($E5,X)
  $978B  61 DA     ADC ($DA,X)
  $978D  02        .db $02
  $978E  DB        .db $DB
  $978F  02        .db $02
  $9790  DB        .db $DB
  $9791  42        .db $42
  $9792  DA        .db $DA
  $9793  42        .db $42
  $9794  DD 02 DE  CMP $DE02,X
  $9797  02        .db $02
  $9798  DE 42 DD  DEC $DD42,X
  $979B  42        .db $42
  $979C  EB        .db $EB
  $979D  61 EA     ADC ($EA,X)
  $979F  61 E7     ADC ($E7,X)
  $97A1  61 E6     ADC ($E6,X)
  $97A3  61 E3     ADC ($E3,X)
  $97A5  21 E4     AND ($E4,X)
  $97A7  21 E4     AND ($E4,X)
  $97A9  61 E3     ADC ($E3,X)
  $97AB  61 D8     ADC ($D8,X)
  $97AD  02        .db $02
  $97AE  D9 02 D9  CMP $D902,Y
  $97B1  42        .db $42
  $97B2  D8        CLD
  $97B3  42        .db $42
  $97B4  04        .db $04
  $97B5  17        .db $17
  $97B6  8F        .db $8F
  $97B7  01 8F     ORA ($8F,X)
  $97B9  01 E0     ORA ($E0,X)
  $97BB  01 E1     ORA ($E1,X)
  $97BD  01 04     ORA ($04,X)
  $97BF  17        .db $17
  $97C0  E2        .db $E2
  $97C1  01 E3     ORA ($E3,X)
  $97C3  01 8F     ORA ($8F,X)
  $97C5  01 8F     ORA ($8F,X)
  $97C7  01 08     ORA ($08,X)
  $97C9  4D 8F 01  EOR $018F
  $97CC  8F        .db $8F
  $97CD  01 E4     ORA ($E4,X)
  $97CF  01 E5     ORA ($E5,X)
  $97D1  01 E6     ORA ($E6,X)
  $97D3  01 E7     ORA ($E7,X)
  $97D5  01 E8     ORA ($E8,X)
  $97D7  01 E9     ORA ($E9,X)
  $97D9  01 08     ORA ($08,X)
  $97DB  4D EA 01  EOR $01EA
  $97DE  8F        .db $8F
  $97DF  01 EB     ORA ($EB,X)
  $97E1  01 EC     ORA ($EC,X)
  $97E3  01 8F     ORA ($8F,X)
  $97E5  01 ED     ORA ($ED,X)
  $97E7  01 EE     ORA ($EE,X)
  $97E9  01 EF     ORA ($EF,X)
  $97EB  01 09     ORA ($09,X)
  $97ED  23        .db $23
  $97EE  A0 01     LDY #$01
  $97F0  A1 01     LDA ($01,X)
  $97F2  A2 01     LDX #$01
  $97F4  A3        .db $A3
  $97F5  01 A4     ORA ($A4,X)
  $97F7  01 A5     ORA ($A5,X)
  $97F9  01 A6     ORA ($A6,X)
  $97FB  01 A7     ORA ($A7,X)
  $97FD  01 A8     ORA ($A8,X)
  $97FF  01 09     ORA ($09,X)
  $9801  23        .db $23
  $9802  A0 01     LDY #$01
  $9804  A1 01     LDA ($01,X)
  $9806  A2 01     LDX #$01
  $9808  A3        .db $A3
  $9809  01 A9     ORA ($A9,X)
  $980B  01 A5     ORA ($A5,X)
  $980D  01 AA     ORA ($AA,X)
  $980F  01 AB     ORA ($AB,X)
  $9811  01 AC     ORA ($AC,X)
  $9813  01 08     ORA ($08,X)
  $9815  24 AD     BIT $AD
  $9817  01 AE     ORA ($AE,X)
  $9819  01 AF     ORA ($AF,X)
  $981B  01 B0     ORA ($B0,X)
  $981D  01 B1     ORA ($B1,X)
  $981F  01 B2     ORA ($B2,X)
  $9821  01 B3     ORA ($B3,X)
  $9823  01 B4     ORA ($B4,X)
  $9825  01 0A     ORA ($0A,X)
  $9827  78        SEI
  $9828  B5 02     LDA $02,X
  $982A  B6 02     LDX $02,Y
  $982C  B7        .db $B7
  $982D  02        .db $02
  $982E  B8        CLV
  $982F  02        .db $02
  $9830  B9 02 BA  LDA $BA02,Y
  $9833  02        .db $02
  $9834  BB        .db $BB
  $9835  02        .db $02
  $9836  BC 02 BD  LDY $BD02,X
  $9839  02        .db $02
  $983A  BE 02 0C  LDX $0C02,Y
  $983D  25 BF     AND $BF
  $983F  02        .db $02
  $9840  C0 02     CPY #$02
  $9842  C1 02     CMP ($02,X)
  $9844  C2        .db $C2
  $9845  02        .db $02
  $9846  C3        .db $C3
  $9847  02        .db $02
  $9848  C4 02     CPY $02
  $984A  C5 02     CMP $02
  $984C  C6 02     DEC $02
  $984E  C7        .db $C7
  $984F  02        .db $02
  $9850  C8        INY
  $9851  02        .db $02
  $9852  C9 02     CMP #$02
  $9854  CA        DEX
  $9855  02        .db $02
  $9856  0F        .db $0F
  $9857  2D CC 02  AND $02CC
  $985A  CF        .db $CF
  $985B  02        .db $02
  $985C  F2        .db $F2
  $985D  02        .db $02
  $985E  F6 03     INC $03,X
  $9860  F7        .db $F7
  $9861  03        .db $03
  $9862  CB        .db $CB
  $9863  02        .db $02
  $9864  CD 02 CE  CMP $CE02
  $9867  02        .db $02
  $9868  F0 02     BEQ $986C
  $986A  F1 02     SBC ($02),Y

L_986C:
  $986C  F3        .db $F3

L_986D:
  $986D  02        .db $02
  $986E  F4        .db $F4
  $986F  02        .db $02
  $9870  F5 02     SBC $02,X
  $9872  F8        SED
  $9873  03        .db $03
  $9874  F9 03 0F  SBC $0F03,Y
  $9877  2D CC 02  AND $02CC
  $987A  FB        .db $FB
  $987B  02        .db $02
  $987C  F2        .db $F2
  $987D  02        .db $02
  $987E  F6 03     INC $03,X

L_9880:
  $9880  F7        .db $F7
  $9881  03        .db $03
  $9882  CB        .db $CB
  $9883  02        .db $02
  $9884  CD 02 FA  CMP $FA02
  $9887  02        .db $02
  $9888  FC        .db $FC
  $9889  02        .db $02
  $988A  F1 02     SBC ($02),Y
  $988C  F3        .db $F3
  $988D  02        .db $02
  $988E  F4        .db $F4

L_988F:
  $988F  02        .db $02
  $9890  F5 02     SBC $02,X
  $9892  F8        SED
  $9893  03        .db $03
  $9894  F9 03 06  SBC $0603,Y
  $9897  62        .db $62
  $9898  CA        DEX
  $9899  01 CB     ORA ($CB,X)
  $989B  01 CC     ORA ($CC,X)
  $989D  01 CE     ORA ($CE,X)
  $989F  01 CF     ORA ($CF,X)
  $98A1  01 D0     ORA ($D0,X)
  $98A3  01 06     ORA ($06,X)
  $98A5  62        .db $62
  $98A6  D3        .db $D3
  $98A7  01 D4     ORA ($D4,X)
  $98A9  01 D5     ORA ($D5,X)
  $98AB  01 D6     ORA ($D6,X)
  $98AD  01 D7     ORA ($D7,X)
  $98AF  01 D8     ORA ($D8,X)
  $98B1  01 09     ORA ($09,X)
  $98B3  00        BRK
  $98B4  A5 01     LDA $01
  $98B6  A7        .db $A7
  $98B7  03        .db $03
  $98B8  A8        TAY
  $98B9  01 A9     ORA ($A9,X)
  $98BB  03        .db $03
  $98BC  A1 01     LDA ($01,X)
  $98BE  A2 01     LDX #$01
  $98C0  A3        .db $A3
  $98C1  01 A4     ORA ($A4,X)
  $98C3  01 A6     ORA ($A6,X)
  $98C5  01 07     ORA ($07,X)
  $98C7  A0 AA     LDY #$AA
  $98C9  01 AB     ORA ($AB,X)
  $98CB  01 AC     ORA ($AC,X)

L_98CD:
  $98CD  01 AD     ORA ($AD,X)
  $98CF  01 AE     ORA ($AE,X)
  $98D1  01 AF     ORA ($AF,X)
  $98D3  01 B0     ORA ($B0,X)
  $98D5  03        .db $03
  $98D6  07        .db $07
  $98D7  A0 B1     LDY #$B1
  $98D9  01 B2     ORA ($B2,X)
  $98DB  01 B3     ORA ($B3,X)
  $98DD  01 B4     ORA ($B4,X)
  $98DF  01 B5     ORA ($B5,X)
  $98E1  01 B6     ORA ($B6,X)
  $98E3  01 B0     ORA ($B0,X)
  $98E5  03        .db $03
  $98E6  10 85     BPL $986D
  $98E8  E7        .db $E7
  $98E9  03        .db $03
  $98EA  E8        INX
  $98EB  03        .db $03
  $98EC  E9 03     SBC #$03
  $98EE  EA        NOP
  $98EF  03        .db $03
  $98F0  EB        .db $EB
  $98F1  03        .db $03
  $98F2  EC 03 ED  CPX $ED03
  $98F5  03        .db $03
  $98F6  EE 03 EB  INC $EB03
  $98F9  83        .db $83
  $98FA  EC 83 ED  CPX $ED83
  $98FD  83        .db $83
  $98FE  EE 83 E7  INC $E783
  $9901  83        .db $83
  $9902  E8        INX
  $9903  83        .db $83
  $9904  E9 83     SBC #$83
  $9906  EA        NOP
  $9907  83        .db $83
  $9908  10 85     BPL $988F
  $990A  EA        NOP
  $990B  43        .db $43
  $990C  E9 43     SBC #$43
  $990E  E8        INX
  $990F  43        .db $43
  $9910  E7        .db $E7
  $9911  43        .db $43
  $9912  EE 43 ED  INC $ED43
  $9915  43        .db $43
  $9916  EC 43 EB  CPX $EB43
  $9919  43        .db $43
  $991A  EE C3 ED  INC $EDC3
  $991D  C3        .db $C3
  $991E  EC C3 EB  CPX $EBC3
  $9921  C3        .db $C3
  $9922  EA        NOP
  $9923  C3        .db $C3
  $9924  E9 C3     SBC #$C3
  $9926  E8        INX
  $9927  C3        .db $C3
  $9928  E7        .db $E7
  $9929  C3        .db $C3
  $992A  13        .db $13
  $992B  10 A0     BPL $98CD
  $992D  03        .db $03
  $992E  A1 03     LDA ($03,X)
  $9930  A2 03     LDX #$03
  $9932  A3        .db $A3
  $9933  03        .db $03
  $9934  A4 03     LDY $03
  $9936  A5 03     LDA $03
  $9938  A6 03     LDX $03
  $993A  A7        .db $A7
  $993B  03        .db $03
  $993C  A8        TAY
  $993D  03        .db $03
  $993E  A9 03     LDA #$03
  $9940  AA        TAX
  $9941  03        .db $03
  $9942  AB        .db $AB
  $9943  03        .db $03
  $9944  AC 03 AD  LDY $AD03
  $9947  03        .db $03
  $9948  AE 03 AF  LDX $AF03
  $994B  03        .db $03
  $994C  B0 03     BCS $9951
  $994E  B1 03     LDA ($03),Y
  $9950  D4        .db $D4

L_9951:
  $9951  01 12     ORA ($12,X)
  $9953  11 B2     ORA ($B2),Y
  $9955  03        .db $03
  $9956  B3        .db $B3
  $9957  03        .db $03
  $9958  B4 03     LDY $03,X
  $995A  B5 03     LDA $03,X
  $995C  B6 03     LDX $03,Y
  $995E  B7        .db $B7
  $995F  03        .db $03
  $9960  B8        CLV
  $9961  03        .db $03
  $9962  B9 03 BA  LDA $BA03,Y
  $9965  03        .db $03
  $9966  BB        .db $BB
  $9967  03        .db $03
  $9968  BC 03 BD  LDY $BD03,X
  $996B  03        .db $03
  $996C  BE 03 BF  LDX $BF03,Y
  $996F  03        .db $03
  $9970  C0 03     CPY #$03
  $9972  C1 03     CMP ($03,X)
  $9974  C2        .db $C2
  $9975  03        .db $03
  $9976  D4        .db $D4
  $9977  01 12     ORA ($12,X)
  $9979  12        .db $12
  $997A  C3        .db $C3
  $997B  03        .db $03
  $997C  C4 03     CPY $03
  $997E  C5 03     CMP $03
  $9980  C6 03     DEC $03
  $9982  C7        .db $C7
  $9983  03        .db $03
  $9984  C8        INY
  $9985  03        .db $03
  $9986  C9 03     CMP #$03
  $9988  CA        DEX
  $9989  03        .db $03
  $998A  CB        .db $CB
  $998B  03        .db $03
  $998C  CC 03 CD  CPY $CD03
  $998F  03        .db $03
  $9990  CE 03 CF  DEC $CF03
  $9993  03        .db $03
  $9994  D1 03     CMP ($03),Y
  $9996  D2        .db $D2
  $9997  03        .db $03
  $9998  D3        .db $D3
  $9999  03        .db $03
  $999A  D4        .db $D4
  $999B  01 D0     ORA ($D0,X)
  $999D  03        .db $03
  $999E  04        .db $04
  $999F  18        CLC
  $99A0  E6 02     INC $02
  $99A2  E6 82     INC $82
  $99A4  E6 42     INC $42
  $99A6  E6 C2     INC $C2
  $99A8  04        .db $04
  $99A9  18        CLC
  $99AA  E7        .db $E7
  $99AB  02        .db $02
  $99AC  E7        .db $E7
  $99AD  82        .db $82
  $99AE  E8        INX
  $99AF  02        .db $02
  $99B0  E8        INX
  $99B1  82        .db $82
  $99B2  04        .db $04
  $99B3  18        CLC
  $99B4  E9 02     SBC #$02
  $99B6  E9 82     SBC #$82
  $99B8  EA        NOP
  $99B9  02        .db $02
  $99BA  EA        NOP
  $99BB  82        .db $82
  $99BC  04        .db $04
  $99BD  18        CLC
  $99BE  EB        .db $EB
  $99BF  02        .db $02
  $99C0  EB        .db $EB
  $99C1  82        .db $82
  $99C2  EB        .db $EB
  $99C3  42        .db $42
  $99C4  EB        .db $EB
  $99C5  C2        .db $C2
  $99C6  04        .db $04
  $99C7  18        CLC
  $99C8  EA        NOP
  $99C9  42        .db $42
  $99CA  EA        NOP
  $99CB  C2        .db $C2
  $99CC  E9 42     SBC #$42
  $99CE  E9 C2     SBC #$C2
  $99D0  04        .db $04
  $99D1  18        CLC
  $99D2  E8        INX
  $99D3  42        .db $42
  $99D4  E8        INX
  $99D5  C2        .db $C2
  $99D6  E7        .db $E7
  $99D7  42        .db $42
  $99D8  E7        .db $E7
  $99D9  C2        .db $C2
  $99DA  04        .db $04
  $99DB  18        CLC
  $99DC  FC        .db $FC
  $99DD  02        .db $02
  $99DE  FD 02 FC  SBC $FC02,X
  $99E1  42        .db $42
  $99E2  FD 42 04  SBC $0442,X
  $99E5  18        CLC
  $99E6  FC        .db $FC
  $99E7  02        .db $02
  $99E8  FE 02 FC  INC $FC02,X
  $99EB  42        .db $42
  $99EC  FE 42 04  INC $0442,X
  $99EF  18        CLC
  $99F0  FC        .db $FC
  $99F1  02        .db $02
  $99F2  FF        .db $FF
  $99F3  02        .db $02
  $99F4  FC        .db $FC
  $99F5  42        .db $42
  $99F6  FF        .db $FF
  $99F7  42        .db $42
  $99F8  10 13     BPL $9A0D
  $99FA  A0 03     LDY #$03
  $99FC  A1 03     LDA ($03,X)
  $99FE  A0 03     LDY #$03
  $9A00  A2 03     LDX #$03
  $9A02  A3        .db $A3
  $9A03  03        .db $03
  $9A04  A4 03     LDY $03
  $9A06  A5 03     LDA $03
  $9A08  A6 03     LDX $03
  $9A0A  A7        .db $A7
  $9A0B  03        .db $03
  $9A0C  A8        TAY

L_9A0D:
  $9A0D  03        .db $03
  $9A0E  A9 01     LDA #$01
  $9A10  AB        .db $AB
  $9A11  03        .db $03
  $9A12  AC 03 AD  LDY $AD03
  $9A15  03        .db $03
  $9A16  BA        TSX
  $9A17  01 AA     ORA ($AA,X)
  $9A19  01 10     ORA ($10,X)
  $9A1B  13        .db $13
  $9A1C  A0 03     LDY #$03
  $9A1E  A1 03     LDA ($03,X)
  $9A20  A0 03     LDY #$03
  $9A22  A2 03     LDX #$03
  $9A24  AE 03 A8  LDX $A803
  $9A27  C3        .db $C3
  $9A28  A5 03     LDA $03
  $9A2A  AF        .db $AF
  $9A2B  03        .db $03
  $9A2C  B0 03     BCS $9A31
  $9A2E  A8        TAY
  $9A2F  03        .db $03
  $9A30  A9 01     LDA #$01
  $9A32  AB        .db $AB
  $9A33  03        .db $03
  $9A34  AC 03 AD  LDY $AD03
  $9A37  03        .db $03
  $9A38  BA        TSX
  $9A39  01 B1     ORA ($B1,X)
  $9A3B  01 12     ORA ($12,X)
  $9A3D  14        .db $14
  $9A3E  A0 03     LDY #$03
  $9A40  B2        .db $B2
  $9A41  03        .db $03
  $9A42  BD 03 A2  LDA $A203,X
  $9A45  03        .db $03
  $9A46  B3        .db $B3
  $9A47  03        .db $03
  $9A48  B4 03     LDY $03,X
  $9A4A  B5 03     LDA $03,X
  $9A4C  A5 03     LDA $03
  $9A4E  B6 03     LDX $03,Y
  $9A50  B7        .db $B7
  $9A51  03        .db $03
  $9A52  A8        TAY
  $9A53  03        .db $03
  $9A54  B8        CLV
  $9A55  01 AB     ORA ($AB,X)
  $9A57  03        .db $03
  $9A58  AC 03 AD  LDY $AD03
  $9A5B  03        .db $03
  $9A5C  BA        TSX
  $9A5D  01 BB     ORA ($BB,X)
  $9A5F  01 BC     ORA ($BC,X)
  $9A61  01 12     ORA ($12,X)
  $9A63  14        .db $14
  $9A64  BD 03 B9  LDA $B903,X
  $9A67  03        .db $03
  $9A68  A0 03     LDY #$03
  $9A6A  A2 03     LDX #$03
  $9A6C  B3        .db $B3
  $9A6D  03        .db $03
  $9A6E  B4 03     LDY $03,X
  $9A70  B5 03     LDA $03,X
  $9A72  A5 03     LDA $03
  $9A74  B6 03     LDX $03,Y
  $9A76  B7        .db $B7
  $9A77  03        .db $03
  $9A78  A8        TAY
  $9A79  03        .db $03
  $9A7A  B8        CLV
  $9A7B  01 AB     ORA ($AB,X)
  $9A7D  03        .db $03
  $9A7E  AC 03 AD  LDY $AD03
  $9A81  03        .db $03
  $9A82  BA        TSX
  $9A83  01 BB     ORA ($BB,X)
  $9A85  01 BC     ORA ($BC,X)
  $9A87  01 0B     ORA ($0B,X)
  $9A89  15 A0     ORA $A0,X
  $9A8B  03        .db $03
  $9A8C  A1 03     LDA ($03,X)
  $9A8E  A2 03     LDX #$03
  $9A90  A3        .db $A3
  $9A91  03        .db $03
  $9A92  A4 03     LDY $03
  $9A94  A5 03     LDA $03
  $9A96  A6 03     LDX $03
  $9A98  A7        .db $A7
  $9A99  03        .db $03
  $9A9A  A8        TAY
  $9A9B  03        .db $03
  $9A9C  A9 03     LDA #$03
  $9A9E  BD 01 0B  LDA $0B01,X
  $9AA1  16 AA     ASL $AA,X
  $9AA3  03        .db $03
  $9AA4  AB        .db $AB
  $9AA5  03        .db $03
  $9AA6  AC 03 AD  LDY $AD03
  $9AA9  03        .db $03
  $9AAA  AE 03 AF  LDX $AF03
  $9AAD  03        .db $03
  $9AAE  B0 03     BCS $9AB3
  $9AB0  B1 03     LDA ($03),Y
  $9AB2  B2        .db $B2

L_9AB3:
  $9AB3  03        .db $03
  $9AB4  B3        .db $B3
  $9AB5  03        .db $03
  $9AB6  BE 01 10  LDX $1001,Y
  $9AB9  17        .db $17
  $9ABA  B7        .db $B7
  $9ABB  02        .db $02
  $9ABC  B7        .db $B7
  $9ABD  42        .db $42
  $9ABE  B7        .db $B7
  $9ABF  82        .db $82
  $9AC0  B7        .db $B7
  $9AC1  C2        .db $C2
  $9AC2  B4 02     LDY $02,X
  $9AC4  B5 02     LDA $02,X
  $9AC6  B5 42     LDA $42,X
  $9AC8  B6 02     LDX $02,Y
  $9ACA  B6 42     LDX $42,Y
  $9ACC  B6 82     LDX $82,Y
  $9ACE  B6 C2     LDX $C2,Y
  $9AD0  B4 82     LDY $82,X
  $9AD2  B5 82     LDA $82,X
  $9AD4  B5 C2     LDA $C2,X
  $9AD6  B4 C2     LDY $C2,X
  $9AD8  B4 42     LDY $42,X
  $9ADA  10 17     BPL $9AF3
  $9ADC  BB        .db $BB
  $9ADD  02        .db $02
  $9ADE  BC 02 BC  LDY $BC02,X
  $9AE1  C2        .db $C2
  $9AE2  BB        .db $BB
  $9AE3  C2        .db $C2
  $9AE4  B8        CLV
  $9AE5  02        .db $02
  $9AE6  B9 02 B9  LDA $B902,Y
  $9AE9  42        .db $42
  $9AEA  BA        TSX
  $9AEB  02        .db $02
  $9AEC  BA        TSX
  $9AED  42        .db $42
  $9AEE  BA        TSX
  $9AEF  82        .db $82
  $9AF0  BA        TSX
  $9AF1  C2        .db $C2
  $9AF2  B8        CLV

L_9AF3:
  $9AF3  82        .db $82
  $9AF4  B9 82 B9  LDA $B982,Y
  $9AF7  C2        .db $C2
  $9AF8  B8        CLV
  $9AF9  C2        .db $C2
  $9AFA  B8        CLV
  $9AFB  42        .db $42
  $9AFC  05 18     ORA $18
  $9AFE  E0 02     CPX #$02
  $9B00  E2        .db $E2
  $9B01  02        .db $02
  $9B02  E1 02     SBC ($02,X)
  $9B04  E3        .db $E3
  $9B05  02        .db $02
  $9B06  EC 01 05  CPX $0501
  $9B09  18        CLC
  $9B0A  E0 02     CPX #$02
  $9B0C  E2        .db $E2
  $9B0D  02        .db $02
  $9B0E  E4 02     CPX $02
  $9B10  E5 02     SBC $02
  $9B12  EC 01 05  CPX $0501
  $9B15  18        CLC
  $9B16  E0 02     CPX #$02
  $9B18  E6 02     INC $02
  $9B1A  E4 02     CPX $02
  $9B1C  E7        .db $E7
  $9B1D  02        .db $02
  $9B1E  EC 01 04  CPX $0401
  $9B21  18        CLC
  $9B22  E8        INX
  $9B23  01 EA     ORA ($EA,X)
  $9B25  01 E9     ORA ($E9,X)
  $9B27  01 EB     ORA ($EB,X)
  $9B29  01 02     ORA ($02,X)
  $9B2B  18        CLC
  $9B2C  EF        .db $EF
  $9B2D  01 EF     ORA ($EF,X)
  $9B2F  81 01     STA ($01,X)
  $9B31  00        BRK
  $9B32  ED 02 01  SBC $0102
  $9B35  00        BRK
  $9B36  EE 02 14  INC $1402
  $9B39  19 A0 02  ORA $02A0,Y
  $9B3C  A1 02     LDA ($02,X)
  $9B3E  A2 02     LDX #$02
  $9B40  A3        .db $A3
  $9B41  02        .db $02
  $9B42  A4 02     LDY $02
  $9B44  A5 02     LDA $02
  $9B46  B2        .db $B2
  $9B47  02        .db $02
  $9B48  B3        .db $B3
  $9B49  02        .db $02
  $9B4A  B4 02     LDY $02,X
  $9B4C  B5 02     LDA $02,X
  $9B4E  B6 02     LDX $02,Y
  $9B50  B7        .db $B7
  $9B51  02        .db $02
  $9B52  B8        CLV
  $9B53  02        .db $02
  $9B54  B9 02 BA  LDA $BA02,Y
  $9B57  02        .db $02
  $9B58  BB        .db $BB
  $9B59  02        .db $02
  $9B5A  BC 02 BD  LDY $BD02,X
  $9B5D  02        .db $02
  $9B5E  BE 02 BF  LDX $BF02,Y
  $9B61  01 14     ORA ($14,X)
  $9B63  1A        .db $1A
  $9B64  AC 02 AD  LDY $AD02
  $9B67  02        .db $02
  $9B68  AE 02 AF  LDX $AF02
  $9B6B  02        .db $02
  $9B6C  B0 02     BCS $9B70
  $9B6E  B1 02     LDA ($02),Y

L_9B70:
  $9B70  B2        .db $B2
  $9B71  02        .db $02
  $9B72  B3        .db $B3
  $9B73  02        .db $02
  $9B74  B4 02     LDY $02,X
  $9B76  B5 02     LDA $02,X
  $9B78  B6 02     LDX $02,Y
  $9B7A  B7        .db $B7
  $9B7B  02        .db $02
  $9B7C  B8        CLV
  $9B7D  02        .db $02
  $9B7E  B9 02 BA  LDA $BA02,Y
  $9B81  02        .db $02
  $9B82  BB        .db $BB
  $9B83  02        .db $02
  $9B84  BC 02 BD  LDY $BD02,X
  $9B87  02        .db $02
  $9B88  BE 02 BF  LDX $BF02,Y
  $9B8B  01 14     ORA ($14,X)
  $9B8D  1B        .db $1B
  $9B8E  A6 02     LDX $02
  $9B90  A7        .db $A7
  $9B91  02        .db $02
  $9B92  A8        TAY
  $9B93  02        .db $02
  $9B94  A9 02     LDA #$02
  $9B96  AA        TAX
  $9B97  02        .db $02
  $9B98  AB        .db $AB
  $9B99  02        .db $02
  $9B9A  B2        .db $B2
  $9B9B  02        .db $02
  $9B9C  B3        .db $B3
  $9B9D  02        .db $02
  $9B9E  B4 02     LDY $02,X
  $9BA0  B5 02     LDA $02,X
  $9BA2  B6 02     LDX $02,Y
  $9BA4  B7        .db $B7
  $9BA5  02        .db $02
  $9BA6  B8        CLV
  $9BA7  02        .db $02
  $9BA8  B9 02 BA  LDA $BA02,Y
  $9BAB  02        .db $02
  $9BAC  BB        .db $BB
  $9BAD  02        .db $02
  $9BAE  BC 02 BD  LDY $BD02,X
  $9BB1  02        .db $02
  $9BB2  BE 02 BF  LDX $BF02,Y
  $9BB5  01 14     ORA ($14,X)
  $9BB7  1A        .db $1A
  $9BB8  8F        .db $8F
  $9BB9  02        .db $02
  $9BBA  8F        .db $8F
  $9BBB  02        .db $02
  $9BBC  DA        .db $DA
  $9BBD  02        .db $02
  $9BBE  DB        .db $DB
  $9BBF  02        .db $02
  $9BC0  DC        .db $DC
  $9BC1  02        .db $02
  $9BC2  DD 02 B2  CMP $B202,X
  $9BC5  02        .db $02
  $9BC6  B3        .db $B3
  $9BC7  02        .db $02
  $9BC8  B4 02     LDY $02,X
  $9BCA  B5 02     LDA $02,X
  $9BCC  B6 02     LDX $02,Y
  $9BCE  B7        .db $B7
  $9BCF  02        .db $02
  $9BD0  B8        CLV
  $9BD1  02        .db $02
  $9BD2  B9 02 BA  LDA $BA02,Y
  $9BD5  02        .db $02
  $9BD6  BB        .db $BB
  $9BD7  02        .db $02
  $9BD8  BC 02 BD  LDY $BD02,X
  $9BDB  02        .db $02
  $9BDC  BE 02 BF  LDX $BF02,Y
  $9BDF  01 13     ORA ($13,X)
  $9BE1  4E C3 02  LSR $02C3
  $9BE4  C4 02     CPY $02
  $9BE6  C6 02     DEC $02
  $9BE8  C7        .db $C7
  $9BE9  02        .db $02
  $9BEA  C8        INY
  $9BEB  02        .db $02
  $9BEC  C9 02     CMP #$02
  $9BEE  CA        DEX
  $9BEF  02        .db $02
  $9BF0  CB        .db $CB
  $9BF1  02        .db $02
  $9BF2  CC 02 CD  CPY $CD02
  $9BF5  02        .db $02
  $9BF6  C0 02     CPY #$02
  $9BF8  C1 02     CMP ($02,X)
  $9BFA  C2        .db $C2
  $9BFB  02        .db $02
  $9BFC  CE 02 CF  DEC $CF02
  $9BFF  02        .db $02
  $9C00  D0 02     BNE $9C04
  $9C02  D1 02     CMP ($02),Y

L_9C04:
  $9C04  D9 01 C5  CMP $C501,Y
  $9C07  02        .db $02
  $9C08  14        .db $14
  $9C09  1C        .db $1C
  $9C0A  C3        .db $C3
  $9C0B  02        .db $02
  $9C0C  C4 02     CPY $02
  $9C0E  C6 02     DEC $02
  $9C10  C7        .db $C7
  $9C11  02        .db $02
  $9C12  C8        INY
  $9C13  02        .db $02
  $9C14  C9 02     CMP #$02
  $9C16  CA        DEX
  $9C17  02        .db $02
  $9C18  D2        .db $D2
  $9C19  02        .db $02
  $9C1A  D3        .db $D3
  $9C1B  02        .db $02
  $9C1C  D4        .db $D4
  $9C1D  02        .db $02
  $9C1E  C0 02     CPY #$02
  $9C20  C1 02     CMP ($02,X)
  $9C22  C2        .db $C2
  $9C23  02        .db $02
  $9C24  8F        .db $8F
  $9C25  02        .db $02
  $9C26  D5 02     CMP $02,X
  $9C28  D6 02     DEC $02,X
  $9C2A  D7        .db $D7
  $9C2B  02        .db $02
  $9C2C  D9 01 C5  CMP $C501,Y
  $9C2F  02        .db $02
  $9C30  D8        CLD
  $9C31  02        .db $02
  $9C32  0E 1D B0  ASL $B01D
  $9C35  03        .db $03
  $9C36  B1 03     LDA ($03),Y
  $9C38  B2        .db $B2
  $9C39  03        .db $03
  $9C3A  B3        .db $B3
  $9C3B  03        .db $03
  $9C3C  B4 03     LDY $03,X
  $9C3E  B5 03     LDA $03,X
  $9C40  B6 03     LDX $03,Y
  $9C42  B7        .db $B7
  $9C43  03        .db $03
  $9C44  B8        CLV
  $9C45  03        .db $03
  $9C46  B9 03 BA  LDA $BA03,Y
  $9C49  03        .db $03
  $9C4A  BB        .db $BB
  $9C4B  03        .db $03
  $9C4C  BC 03 AF  LDY $AF03,X
  $9C4F  01 0E     ORA ($0E,X)
  $9C51  1E BD 03  ASL $03BD,X
  $9C54  BE 03 BF  LDX $BF03,Y
  $9C57  03        .db $03
  $9C58  C0 03     CPY #$03
  $9C5A  C1 03     CMP ($03,X)
  $9C5C  C2        .db $C2
  $9C5D  03        .db $03
  $9C5E  C3        .db $C3
  $9C5F  03        .db $03
  $9C60  C4 03     CPY $03
  $9C62  C6 03     DEC $03
  $9C64  C7        .db $C7
  $9C65  03        .db $03
  $9C66  C8        INY
  $9C67  03        .db $03
  $9C68  C5 03     CMP $03
  $9C6A  C9 03     CMP #$03
  $9C6C  AF        .db $AF
  $9C6D  01 0E     ORA ($0E,X)
  $9C6F  1F        .db $1F
  $9C70  CA        DEX
  $9C71  03        .db $03
  $9C72  CB        .db $CB
  $9C73  03        .db $03
  $9C74  C0 03     CPY #$03
  $9C76  CC 03 C3  CPY $C303
  $9C79  03        .db $03
  $9C7A  C4 03     CPY $03
  $9C7C  CE 03 C7  DEC $C703
  $9C7F  03        .db $03
  $9C80  C8        INY
  $9C81  03        .db $03
  $9C82  C5 03     CMP $03
  $9C84  C9 03     CMP #$03
  $9C86  CD 03 CF  CMP $CF03
  $9C89  03        .db $03
  $9C8A  AF        .db $AF
  $9C8B  01 04     ORA ($04,X)
  $9C8D  18        CLC
  $9C8E  8F        .db $8F
  $9C8F  03        .db $03
  $9C90  AC 03 AD  LDY $AD03
  $9C93  03        .db $03
  $9C94  AE 03 0A  LDX $0A03
  $9C97  43        .db $43
  $9C98  A0 01     LDY #$01
  $9C9A  A1 01     LDA ($01,X)
  $9C9C  A2 01     LDX #$01
  $9C9E  A3        .db $A3
  $9C9F  01 A4     ORA ($A4,X)
  $9CA1  01 A5     ORA ($A5,X)
  $9CA3  01 A6     ORA ($A6,X)
  $9CA5  01 A7     ORA ($A7,X)
  $9CA7  01 A8     ORA ($A8,X)
  $9CA9  03        .db $03
  $9CAA  A9 03     LDA #$03
  $9CAC  0A        ASL
  $9CAD  43        .db $43
  $9CAE  A0 01     LDY #$01
  $9CB0  A1 01     LDA ($01,X)
  $9CB2  A2 01     LDX #$01
  $9CB4  A3        .db $A3
  $9CB5  01 A4     ORA ($A4,X)
  $9CB7  01 A5     ORA ($A5,X)
  $9CB9  01 A6     ORA ($A6,X)
  $9CBB  01 A7     ORA ($A7,X)
  $9CBD  01 AA     ORA ($AA,X)
  $9CBF  03        .db $03
  $9CC0  AB        .db $AB
  $9CC1  03        .db $03
  $9CC2  16 17     ASL $17,X
  $9CC4  A7        .db $A7
  $9CC5  03        .db $03
  $9CC6  A8        TAY
  $9CC7  03        .db $03
  $9CC8  AB        .db $AB
  $9CC9  03        .db $03
  $9CCA  AC 03 A1  LDY $A103
  $9CCD  03        .db $03
  $9CCE  A2 03     LDX #$03
  $9CD0  A3        .db $A3
  $9CD1  03        .db $03
  $9CD2  A6 03     LDX $03
  $9CD4  A9 03     LDA #$03
  $9CD6  AA        TAX
  $9CD7  03        .db $03
  $9CD8  AD 03 AF  LDA $AF03
  $9CDB  03        .db $03
  $9CDC  B0 03     BCS $9CE1
  $9CDE  B1 03     LDA ($03),Y
  $9CE0  B2        .db $B2

L_9CE1:
  $9CE1  03        .db $03
  $9CE2  A4 03     LDY $03

L_9CE4:
  $9CE4  A0 03     LDY #$03
  $9CE6  A5 03     LDA $03
  $9CE8  AE 03 C5  LDX $C503
  $9CEB  01 C6     ORA ($C6,X)
  $9CED  01 C4     ORA ($C4,X)
  $9CEF  01 16     ORA ($16,X)
  $9CF1  20 B3 03  JSR $03B3
  $9CF4  B4 03     LDY $03,X
  $9CF6  B5 03     LDA $03,X
  $9CF8  B6 03     LDX $03,Y
  $9CFA  B7        .db $B7
  $9CFB  03        .db $03
  $9CFC  B8        CLV
  $9CFD  03        .db $03
  $9CFE  B9 03 BA  LDA $BA03,Y
  $9D01  03        .db $03
  $9D02  BB        .db $BB
  $9D03  03        .db $03
  $9D04  BC 03 BD  LDY $BD03,X
  $9D07  03        .db $03
  $9D08  BE 03 BF  LDX $BF03,Y
  $9D0B  03        .db $03
  $9D0C  C0 03     CPY #$03
  $9D0E  AE 03 C1  LDX $C103
  $9D11  03        .db $03
  $9D12  C2        .db $C2
  $9D13  03        .db $03
  $9D14  B1 03     LDA ($03),Y
  $9D16  B2        .db $B2
  $9D17  03        .db $03
  $9D18  C4 01     CPY $01
  $9D1A  C5 01     CMP $01
  $9D1C  C6 01     DEC $01
  $9D1E  16 20     ASL $20,X
  $9D20  B3        .db $B3
  $9D21  03        .db $03
  $9D22  B4 03     LDY $03,X
  $9D24  B5 03     LDA $03,X

L_9D26:
  $9D26  B6 03     LDX $03,Y
  $9D28  B7        .db $B7
  $9D29  03        .db $03
  $9D2A  B8        CLV
  $9D2B  03        .db $03
  $9D2C  B9 03 BA  LDA $BA03,Y
  $9D2F  03        .db $03
  $9D30  BB        .db $BB
  $9D31  03        .db $03
  $9D32  BC 03 C3  LDY $C303,X
  $9D35  03        .db $03
  $9D36  AB        .db $AB
  $9D37  03        .db $03
  $9D38  BF        .db $BF
  $9D39  03        .db $03
  $9D3A  C0 03     CPY #$03
  $9D3C  AE 03 AF  LDX $AF03
  $9D3F  03        .db $03
  $9D40  B0 03     BCS $9D45
  $9D42  B1 03     LDA ($03),Y
  $9D44  B2        .db $B2

L_9D45:
  $9D45  03        .db $03
  $9D46  C4 01     CPY $01
  $9D48  C5 01     CMP $01
  $9D4A  C6 01     DEC $01
  $9D4C  06 21     ASL $21
  $9D4E  D2        .db $D2
  $9D4F  02        .db $02
  $9D50  D2        .db $D2
  $9D51  42        .db $42
  $9D52  D3        .db $D3
  $9D53  02        .db $02
  $9D54  D4        .db $D4
  $9D55  02        .db $02
  $9D56  D4        .db $D4
  $9D57  C2        .db $C2
  $9D58  D4        .db $D4
  $9D59  82        .db $82
  $9D5A  0B        .db $0B
  $9D5B  21 D5     AND ($D5,X)
  $9D5D  02        .db $02
  $9D5E  D5 42     CMP $42,X
  $9D60  D0 82     BNE $9CE4
  $9D62  D0 C2     BNE $9D26
  $9D64  ED 82 EE  SBC $EE82
  $9D67  82        .db $82
  $9D68  EF        .db $EF
  $9D69  82        .db $82
  $9D6A  EC 82 EF  CPX $EF82
  $9D6D  C2        .db $C2
  $9D6E  EC C2 E7  CPX $E7C2
  $9D71  81 0B     STA ($0B,X)
  $9D73  21 EB     AND ($EB,X)
  $9D75  82        .db $82
  $9D76  EB        .db $EB
  $9D77  C2        .db $C2
  $9D78  EA        NOP
  $9D79  82        .db $82
  $9D7A  EA        NOP
  $9D7B  C2        .db $C2
  $9D7C  E7        .db $E7
  $9D7D  82        .db $82
  $9D7E  E8        INX
  $9D7F  82        .db $82
  $9D80  E9 82     SBC #$82
  $9D82  E6 82     INC $82
  $9D84  E9 C2     SBC #$C2
  $9D86  E6 C2     INC $C2
  $9D88  D6 81     DEC $81,X
  $9D8A  0B        .db $0B
  $9D8B  21 E5     AND ($E5,X)
  $9D8D  82        .db $82
  $9D8E  E5 C2     SBC $C2
  $9D90  E4 82     CPX $82
  $9D92  E4 C2     CPX $C2
  $9D94  E1 82     SBC ($82,X)
  $9D96  E2        .db $E2
  $9D97  82        .db $82
  $9D98  E3        .db $E3
  $9D99  82        .db $82
  $9D9A  E0 82     CPX #$82
  $9D9C  E3        .db $E3
  $9D9D  C2        .db $C2
  $9D9E  E0 C2     CPX #$C2
  $9DA0  D6 81     DEC $81,X
  $9DA2  0B        .db $0B
  $9DA3  22        .db $22
  $9DA4  E1 02     SBC ($02,X)
  $9DA6  E4 02     CPX $02
  $9DA8  E4 42     CPX $42
  $9DAA  E2        .db $E2
  $9DAB  02        .db $02
  $9DAC  E0 02     CPX #$02
  $9DAE  E0 42     CPX #$42
  $9DB0  E3        .db $E3
  $9DB1  02        .db $02
  $9DB2  E3        .db $E3
  $9DB3  42        .db $42
  $9DB4  E5 02     SBC $02
  $9DB6  E5 42     SBC $42
  $9DB8  D6 01     DEC $01,X
  $9DBA  0B        .db $0B
  $9DBB  22        .db $22
  $9DBC  E7        .db $E7
  $9DBD  02        .db $02
  $9DBE  EA        NOP
  $9DBF  02        .db $02
  $9DC0  EA        NOP
  $9DC1  42        .db $42
  $9DC2  E8        INX
  $9DC3  02        .db $02
  $9DC4  E6 02     INC $02
  $9DC6  E6 42     INC $42
  $9DC8  E9 02     SBC #$02
  $9DCA  E9 42     SBC #$42
  $9DCC  EB        .db $EB
  $9DCD  02        .db $02
  $9DCE  EB        .db $EB
  $9DCF  42        .db $42
  $9DD0  D6 01     DEC $01,X
  $9DD2  0B        .db $0B
  $9DD3  22        .db $22
  $9DD4  ED 02 D0  SBC $D002
  $9DD7  02        .db $02
  $9DD8  D0 42     BNE $9E1C
  $9DDA  EE 02 EC  INC $EC02
  $9DDD  02        .db $02
  $9DDE  EC 42 EF  CPX $EF42
  $9DE1  02        .db $02
  $9DE2  EF        .db $EF
  $9DE3  42        .db $42
  $9DE4  D1 02     CMP ($02),Y
  $9DE6  D1 42     CMP ($42),Y
  $9DE8  D7        .db $D7
  $9DE9  01 04     ORA ($04,X)
  $9DEB  17        .db $17
  $9DEC  A0 02     LDY #$02
  $9DEE  A1 02     LDA ($02,X)
  $9DF0  A2 02     LDX #$02
  $9DF2  A3        .db $A3
  $9DF3  02        .db $02
  $9DF4  0C        .db $0C
  $9DF5  33        .db $33
  $9DF6  A4 02     LDY $02
  $9DF8  A5 02     LDA $02
  $9DFA  A6 02     LDX $02
  $9DFC  A7        .db $A7
  $9DFD  02        .db $02
  $9DFE  A8        TAY
  $9DFF  02        .db $02
  $9E00  A9 02     LDA #$02
  $9E02  AA        TAX
  $9E03  02        .db $02
  $9E04  AB        .db $AB
  $9E05  02        .db $02
  $9E06  AC 02 AD  LDY $AD02
  $9E09  02        .db $02
  $9E0A  AE 02 AF  LDX $AF02
  $9E0D  02        .db $02
  $9E0E  0C        .db $0C
  $9E0F  33        .db $33
  $9E10  B0 02     BCS $9E14
  $9E12  B1 02     LDA ($02),Y

L_9E14:
  $9E14  B2        .db $B2
  $9E15  02        .db $02
  $9E16  B3        .db $B3
  $9E17  02        .db $02
  $9E18  B4 02     LDY $02,X
  $9E1A  B5 02     LDA $02,X

L_9E1C:
  $9E1C  B6 02     LDX $02,Y
  $9E1E  B7        .db $B7
  $9E1F  02        .db $02
  $9E20  B8        CLV
  $9E21  02        .db $02
  $9E22  B9 02 BA  LDA $BA02,Y
  $9E25  02        .db $02
  $9E26  BB        .db $BB
  $9E27  02        .db $02
  $9E28  0C        .db $0C
  $9E29  33        .db $33
  $9E2A  BC 02 BD  LDY $BD02,X
  $9E2D  02        .db $02
  $9E2E  BE 02 BF  LDX $BF02,Y
  $9E31  02        .db $02
  $9E32  C0 02     CPY #$02
  $9E34  C1 02     CMP ($02,X)
  $9E36  C2        .db $C2
  $9E37  02        .db $02
  $9E38  C3        .db $C3
  $9E39  02        .db $02
  $9E3A  8F        .db $8F
  $9E3B  03        .db $03
  $9E3C  C4 02     CPY $02
  $9E3E  C5 02     CMP $02
  $9E40  8F        .db $8F
  $9E41  03        .db $03
  $9E42  09 6B     ORA #$6B
  $9E44  C6 02     DEC $02
  $9E46  C7        .db $C7
  $9E47  02        .db $02
  $9E48  C6 42     DEC $42
  $9E4A  C8        INY
  $9E4B  02        .db $02
  $9E4C  C9 02     CMP #$02
  $9E4E  C8        INY
  $9E4F  42        .db $42
  $9E50  CA        DEX
  $9E51  02        .db $02
  $9E52  CB        .db $CB
  $9E53  02        .db $02
  $9E54  CA        DEX
  $9E55  42        .db $42
  $9E56  0A        ASL
  $9E57  6B        .db $6B
  $9E58  CC 02 CD  CPY $CD02
  $9E5B  02        .db $02
  $9E5C  CC 42 CE  CPY $CE42
  $9E5F  02        .db $02
  $9E60  C9 02     CMP #$02
  $9E62  CE 42 CA  DEC $CA42
  $9E65  02        .db $02
  $9E66  CB        .db $CB
  $9E67  02        .db $02
  $9E68  CA        DEX
  $9E69  42        .db $42
  $9E6A  CF        .db $CF
  $9E6B  03        .db $03
  $9E6C  0D 42 C0  ORA $C042
  $9E6F  02        .db $02
  $9E70  C1 02     CMP ($02,X)
  $9E72  C2        .db $C2
  $9E73  02        .db $02
  $9E74  C3        .db $C3
  $9E75  02        .db $02
  $9E76  C4 02     CPY $02
  $9E78  C5 02     CMP $02
  $9E7A  C6 01     DEC $01
  $9E7C  C7        .db $C7
  $9E7D  01 C6     ORA ($C6,X)
  $9E7F  41 C8     EOR ($C8,X)
  $9E81  01 CF     ORA ($CF,X)
  $9E83  01 C8     ORA ($C8,X)
  $9E85  41 CD     EOR ($CD,X)
  $9E87  03        .db $03
  $9E88  0D 42 C0  ORA $C042
  $9E8B  02        .db $02
  $9E8C  C1 02     CMP ($02,X)
  $9E8E  C2        .db $C2
  $9E8F  02        .db $02
  $9E90  C3        .db $C3
  $9E91  02        .db $02
  $9E92  C4 02     CPY $02
  $9E94  C5 02     CMP $02
  $9E96  C9 01     CMP #$01
  $9E98  CA        DEX
  $9E99  01 CB     ORA ($CB,X)
  $9E9B  01 CF     ORA ($CF,X)
  $9E9D  01 CC     ORA ($CC,X)
  $9E9F  01 CF     ORA ($CF,X)
  $9EA1  01 CE     ORA ($CE,X)
  $9EA3  03        .db $03
  $9EA4  11 26     ORA ($26),Y
  $9EA6  A0 03     LDY #$03
  $9EA8  A1 03     LDA ($03,X)
  $9EAA  A2 03     LDX #$03
  $9EAC  A3        .db $A3
  $9EAD  03        .db $03
  $9EAE  A4 03     LDY $03
  $9EB0  A5 03     LDA $03
  $9EB2  A8        TAY
  $9EB3  03        .db $03
  $9EB4  A9 03     LDA #$03
  $9EB6  AC 03 AD  LDY $AD03
  $9EB9  03        .db $03
  $9EBA  A6 03     LDX $03
  $9EBC  AA        TAX
  $9EBD  03        .db $03
  $9EBE  AE 03 A7  LDX $A703
  $9EC1  03        .db $03
  $9EC2  AB        .db $AB
  $9EC3  03        .db $03
  $9EC4  AF        .db $AF
  $9EC5  03        .db $03
  $9EC6  CD 01 11  CMP $1101
  $9EC9  27        .db $27
  $9ECA  B0 03     BCS $9ECF
  $9ECC  B1 03     LDA ($03),Y
  $9ECE  B2        .db $B2

L_9ECF:
  $9ECF  03        .db $03
  $9ED0  B3        .db $B3
  $9ED1  03        .db $03
  $9ED2  B4 03     LDY $03,X
  $9ED4  B5 03     LDA $03,X
  $9ED6  B6 03     LDX $03,Y
  $9ED8  B7        .db $B7
  $9ED9  03        .db $03
  $9EDA  B8        CLV
  $9EDB  03        .db $03
  $9EDC  B9 03 BA  LDA $BA03,Y
  $9EDF  03        .db $03
  $9EE0  BB        .db $BB
  $9EE1  03        .db $03
  $9EE2  BC 03 BD  LDY $BD03,X
  $9EE5  03        .db $03
  $9EE6  BE 03 BF  LDX $BF03,Y
  $9EE9  03        .db $03
  $9EEA  CD 01 12  CMP $1201
  $9EED  28        PLP
  $9EEE  C0 03     CPY #$03
  $9EF0  C1 03     CMP ($03,X)
  $9EF2  C2        .db $C2
  $9EF3  03        .db $03
  $9EF4  A4 03     LDY $03
  $9EF6  A5 03     LDA $03
  $9EF8  A6 03     LDX $03
  $9EFA  A7        .db $A7
  $9EFB  03        .db $03
  $9EFC  C3        .db $C3
  $9EFD  03        .db $03
  $9EFE  C4 03     CPY $03
  $9F00  C5 03     CMP $03
  $9F02  C6 03     DEC $03
  $9F04  C7        .db $C7
  $9F05  03        .db $03
  $9F06  C8        INY
  $9F07  03        .db $03
  $9F08  C9 03     CMP #$03
  $9F0A  CA        DEX
  $9F0B  03        .db $03
  $9F0C  CB        .db $CB
  $9F0D  03        .db $03
  $9F0E  CC 03 CD  CPY $CD03
  $9F11  01 0F     ORA ($0F,X)
  $9F13  17        .db $17
  $9F14  A4 02     LDY $02
  $9F16  A5 02     LDA $02
  $9F18  A8        TAY
  $9F19  02        .db $02
  $9F1A  A9 02     LDA #$02
  $9F1C  A0 02     LDY #$02
  $9F1E  A1 02     LDA ($02,X)
  $9F20  A2 02     LDX #$02
  $9F22  A3        .db $A3
  $9F23  02        .db $02
  $9F24  A6 02     LDX $02
  $9F26  A7        .db $A7
  $9F27  02        .db $02
  $9F28  AA        TAX
  $9F29  02        .db $02
  $9F2A  AB        .db $AB
  $9F2B  02        .db $02
  $9F2C  AC 02 AD  LDY $AD02
  $9F2F  02        .db $02
  $9F30  AE 02 0F  LDX $0F02
  $9F33  29 A0     AND #$A0
  $9F35  02        .db $02
  $9F36  A1 02     LDA ($02,X)
  $9F38  A2 02     LDX #$02
  $9F3A  A3        .db $A3
  $9F3B  02        .db $02
  $9F3C  A4 02     LDY $02
  $9F3E  A5 02     LDA $02
  $9F40  A6 02     LDX $02
  $9F42  A7        .db $A7
  $9F43  02        .db $02
  $9F44  A8        TAY
  $9F45  02        .db $02
  $9F46  A9 02     LDA #$02
  $9F48  AA        TAX
  $9F49  02        .db $02
  $9F4A  AF        .db $AF
  $9F4B  02        .db $02
  $9F4C  B0 02     BCS $9F50
  $9F4E  B1 02     LDA ($02),Y

L_9F50:
  $9F50  B2        .db $B2
  $9F51  02        .db $02
  $9F52  0F        .db $0F
  $9F53  29 C3     AND #$C3
  $9F55  02        .db $02
  $9F56  C4 02     CPY $02
  $9F58  A2 02     LDX #$02
  $9F5A  A3        .db $A3
  $9F5B  02        .db $02
  $9F5C  A4 02     LDY $02
  $9F5E  A5 02     LDA $02
  $9F60  A6 02     LDX $02
  $9F62  A7        .db $A7
  $9F63  02        .db $02
  $9F64  A8        TAY
  $9F65  02        .db $02
  $9F66  A9 02     LDA #$02
  $9F68  AA        TAX
  $9F69  02        .db $02
  $9F6A  AF        .db $AF
  $9F6B  02        .db $02
  $9F6C  B0 02     BCS $9F70
  $9F6E  B1 02     LDA ($02),Y

L_9F70:
  $9F70  B2        .db $B2
  $9F71  02        .db $02
  $9F72  0F        .db $0F
  $9F73  29 A0     AND #$A0
  $9F75  02        .db $02
  $9F76  A1 02     LDA ($02,X)
  $9F78  A2 02     LDX #$02
  $9F7A  B3        .db $B3
  $9F7B  02        .db $02
  $9F7C  B4 02     LDY $02,X
  $9F7E  B5 02     LDA $02,X
  $9F80  A6 02     LDX $02
  $9F82  B6 02     LDX $02,Y
  $9F84  B7        .db $B7
  $9F85  02        .db $02
  $9F86  B8        CLV
  $9F87  02        .db $02
  $9F88  AA        TAX
  $9F89  02        .db $02
  $9F8A  B9 02 BA  LDA $BA02,Y
  $9F8D  02        .db $02
  $9F8E  B1 02     LDA ($02),Y
  $9F90  B2        .db $B2
  $9F91  02        .db $02
  $9F92  0F        .db $0F
  $9F93  17        .db $17
  $9F94  BC 02 BD  LDY $BD02,X
  $9F97  02        .db $02
  $9F98  BF        .db $BF
  $9F99  02        .db $02
  $9F9A  C0 02     CPY #$02
  $9F9C  A0 02     LDY #$02
  $9F9E  A1 02     LDA ($02,X)
  $9FA0  A2 02     LDX #$02
  $9FA2  BB        .db $BB
  $9FA3  02        .db $02
  $9FA4  A6 02     LDX $02
  $9FA6  BE 02 AA  LDX $AA02,Y
  $9FA9  02        .db $02
  $9FAA  C1 02     CMP ($02,X)
  $9FAC  C2        .db $C2
  $9FAD  02        .db $02
  $9FAE  AD 02 AE  LDA $AE02
  $9FB1  02        .db $02
  $9FB2  01 2A     ORA ($2A,X)
  $9FB4  C5 02     CMP $02
  $9FB6  02        .db $02
  $9FB7  2A        ROL
  $9FB8  C6 02     DEC $02
  $9FBA  C7        .db $C7
  $9FBB  02        .db $02
  $9FBC  0E 2B A0  ASL $A02B
  $9FBF  03        .db $03
  $9FC0  A1 03     LDA ($03,X)
  $9FC2  A2 03     LDX #$03
  $9FC4  A3        .db $A3
  $9FC5  03        .db $03
  $9FC6  A4 03     LDY $03
  $9FC8  A5 03     LDA $03
  $9FCA  A6 03     LDX $03
  $9FCC  A7        .db $A7
  $9FCD  03        .db $03
  $9FCE  A8        TAY
  $9FCF  03        .db $03
  $9FD0  A9 03     LDA #$03
  $9FD2  AA        TAX
  $9FD3  03        .db $03
  $9FD4  AB        .db $AB
  $9FD5  03        .db $03
  $9FD6  AC 03 BF  LDY $BF03
  $9FD9  01 0E     ORA ($0E,X)
  $9FDB  2B        .db $2B
  $9FDC  A0 03     LDY #$03
  $9FDE  A1 03     LDA ($03,X)
  $9FE0  A2 03     LDX #$03
  $9FE2  A3        .db $A3
  $9FE3  03        .db $03
  $9FE4  AD 03 8F  LDA $8F03
  $9FE7  03        .db $03
  $9FE8  A6 03     LDX $03
  $9FEA  A7        .db $A7
  $9FEB  03        .db $03
  $9FEC  AE 03 A9  LDX $A903
  $9FEF  03        .db $03
  $9FF0  AA        TAX
  $9FF1  03        .db $03
  $9FF2  AB        .db $AB
  $9FF3  03        .db $03
  $9FF4  AC 03 BF  LDY $BF03
  $9FF7  01 10     ORA ($10,X)
  $9FF9  2B        .db $2B
  $9FFA  A0 03     LDY #$03
  $9FFC  A1 03     LDA ($03,X)
  $9FFE  A2 03     LDX #$03
  $A000  A3        .db $A3
  $A001  03        .db $03
  $A002  B1 03     LDA ($03),Y
  $A004  B2        .db $B2
  $A005  03        .db $03
  $A006  A6 03     LDX $03
  $A008  A7        .db $A7
  $A009  03        .db $03
  $A00A  B3        .db $B3
  $A00B  03        .db $03
  $A00C  B4 03     LDY $03,X
  $A00E  AA        TAX
  $A00F  03        .db $03
  $A010  AB        .db $AB
  $A011  03        .db $03
  $A012  AC 03 BF  LDY $BF03
  $A015  01 AF     ORA ($AF,X)

L_A017:
  $A017  03        .db $03
  $A018  B0 03     BCS $A01D
  $A01A  0B        .db $0B
  $A01B  2C B5 03  BIT $03B5
  $A01E  B6 03     LDX $03,Y
  $A020  B7        .db $B7
  $A021  03        .db $03
  $A022  B8        CLV
  $A023  03        .db $03
  $A024  B9 03 BA  LDA $BA03,Y
  $A027  03        .db $03
  $A028  BD 03 BE  LDA $BE03,X
  $A02B  03        .db $03
  $A02C  BB        .db $BB
  $A02D  03        .db $03
  $A02E  BC 03 BF  LDY $BF03,X
  $A031  01 03     ORA ($03,X)
  $A033  2D E1 22  AND $22E1
  $A036  E2        .db $E2
  $A037  22        .db $22
  $A038  E0 23     CPX #$23
  $A03A  03        .db $03
  $A03B  2D E3 22  AND $22E3
  $A03E  E4 22     CPX $22
  $A040  E0 23     CPX #$23
  $A042  03        .db $03
  $A043  2D E5 22  AND $22E5
  $A046  E6 22     INC $22
  $A048  E0 23     CPX #$23
  $A04A  03        .db $03
  $A04B  2D E0 A3  AND $A3E0
  $A04E  E2        .db $E2
  $A04F  A2 E1     LDX #$E1
  $A051  A2 03     LDX #$03
  $A053  2D E0 A3  AND $A3E0
  $A056  E4 A2     CPX $A2
  $A058  E3        .db $E3
  $A059  A2 03     LDX #$03
  $A05B  2D E0 A3  AND $A3E0
  $A05E  E6 A2     INC $A2
  $A060  E5 A2     SBC $A2
  $A062  02        .db $02
  $A063  41 A9     EOR ($A9,X)
  $A065  02        .db $02
  $A066  AA        TAX
  $A067  02        .db $02
  $A068  02        .db $02
  $A069  41 AB     EOR ($AB,X)
  $A06B  02        .db $02
  $A06C  AB        .db $AB
  $A06D  82        .db $82
  $A06E  02        .db $02
  $A06F  41 AA     EOR ($AA,X)
  $A071  82        .db $82
  $A072  A9 82     LDA #$82
  $A074  1F        .db $1F
  $A075  30 A0     BMI $A017
  $A077  02        .db $02
  $A078  A1 02     LDA ($02,X)
  $A07A  A2 02     LDX #$02
  $A07C  A6 03     LDX $03
  $A07E  A3        .db $A3
  $A07F  02        .db $02
  $A080  A4 02     LDY $02
  $A082  A5 02     LDA $02
  $A084  A7        .db $A7
  $A085  03        .db $03
  $A086  A8        TAY
  $A087  03        .db $03
  $A088  A9 03     LDA #$03
  $A08A  AA        TAX
  $A08B  03        .db $03
  $A08C  AB        .db $AB
  $A08D  03        .db $03
  $A08E  AC 03 AD  LDY $AD03
  $A091  03        .db $03
  $A092  AE 03 AF  LDX $AF03
  $A095  03        .db $03
  $A096  B0 03     BCS $A09B
  $A098  B1 03     LDA ($03),Y
  $A09A  B2        .db $B2

L_A09B:
  $A09B  03        .db $03
  $A09C  B1 03     LDA ($03),Y
  $A09E  B2        .db $B2
  $A09F  03        .db $03
  $A0A0  B3        .db $B3
  $A0A1  03        .db $03
  $A0A2  B4 03     LDY $03,X
  $A0A4  B5 03     LDA $03,X
  $A0A6  B4 03     LDY $03,X
  $A0A8  B6 03     LDX $03,Y
  $A0AA  B7        .db $B7
  $A0AB  03        .db $03
  $A0AC  B8        CLV
  $A0AD  03        .db $03
  $A0AE  B9 03 BA  LDA $BA03,Y
  $A0B1  03        .db $03
  $A0B2  BB        .db $BB
  $A0B3  03        .db $03
  $A0B4  1F        .db $1F
  $A0B5  31 A0     AND ($A0),Y
  $A0B7  02        .db $02
  $A0B8  A1 02     LDA ($02,X)
  $A0BA  A2 02     LDX #$02
  $A0BC  A3        .db $A3
  $A0BD  02        .db $02
  $A0BE  A4 02     LDY $02
  $A0C0  A5 02     LDA $02
  $A0C2  BC 03 BD  LDY $BD03,X
  $A0C5  03        .db $03
  $A0C6  BE 03 BF  LDX $BF03,Y
  $A0C9  03        .db $03
  $A0CA  C0 03     CPY #$03
  $A0CC  C1 03     CMP ($03,X)
  $A0CE  C2        .db $C2
  $A0CF  03        .db $03
  $A0D0  C3        .db $C3
  $A0D1  03        .db $03
  $A0D2  C4 03     CPY $03
  $A0D4  C5 03     CMP $03
  $A0D6  C6 03     DEC $03
  $A0D8  C7        .db $C7
  $A0D9  03        .db $03
  $A0DA  C8        INY
  $A0DB  03        .db $03
  $A0DC  C7        .db $C7
  $A0DD  03        .db $03
  $A0DE  B3        .db $B3
  $A0DF  03        .db $03
  $A0E0  CA        DEX
  $A0E1  03        .db $03
  $A0E2  CB        .db $CB
  $A0E3  03        .db $03
  $A0E4  CC 03 CD  CPY $CD03
  $A0E7  03        .db $03
  $A0E8  B7        .db $B7
  $A0E9  03        .db $03
  $A0EA  B8        CLV
  $A0EB  03        .db $03
  $A0EC  B9 03 BA  LDA $BA03,Y
  $A0EF  03        .db $03
  $A0F0  BB        .db $BB
  $A0F1  03        .db $03
  $A0F2  C9 03     CMP #$03
  $A0F4  22        .db $22
  $A0F5  32        .db $32
  $A0F6  A0 02     LDY #$02
  $A0F8  A1 02     LDA ($02,X)
  $A0FA  A2 02     LDX #$02
  $A0FC  A6 03     LDX $03
  $A0FE  A3        .db $A3
  $A0FF  02        .db $02
  $A100  A4 02     LDY $02
  $A102  A5 02     LDA $02
  $A104  A7        .db $A7
  $A105  03        .db $03
  $A106  A8        TAY
  $A107  03        .db $03
  $A108  A9 03     LDA #$03
  $A10A  AA        TAX
  $A10B  03        .db $03
  $A10C  AB        .db $AB
  $A10D  03        .db $03
  $A10E  CE 03 CF  DEC $CF03
  $A111  03        .db $03
  $A112  D0 03     BNE $A117
  $A114  D1 03     CMP ($03),Y
  $A116  D2        .db $D2

L_A117:
  $A117  03        .db $03
  $A118  D3        .db $D3
  $A119  03        .db $03
  $A11A  D2        .db $D2
  $A11B  03        .db $03
  $A11C  D3        .db $D3
  $A11D  03        .db $03
  $A11E  D4        .db $D4
  $A11F  03        .db $03
  $A120  D5 03     CMP $03,X
  $A122  D4        .db $D4
  $A123  03        .db $03
  $A124  D5 03     CMP $03,X
  $A126  B3        .db $B3
  $A127  03        .db $03
  $A128  D6 03     DEC $03,X
  $A12A  D7        .db $D7
  $A12B  03        .db $03
  $A12C  D6 03     DEC $03,X
  $A12E  D8        CLD
  $A12F  03        .db $03
  $A130  B7        .db $B7
  $A131  03        .db $03
  $A132  B8        CLV
  $A133  03        .db $03
  $A134  B9 03 BA  LDA $BA03,Y
  $A137  03        .db $03
  $A138  BB        .db $BB
  $A139  03        .db $03
  $A13A  09 00     ORA #$00
  $A13C  DD 02 DF  CMP $DF02,X
  $A13F  02        .db $02
  $A140  E0 02     CPX #$02
  $A142  E1 02     SBC ($02,X)
  $A144  D9 02 DA  CMP $DA02,Y
  $A147  02        .db $02
  $A148  DB        .db $DB
  $A149  02        .db $02
  $A14A  DC        .db $DC
  $A14B  02        .db $02
  $A14C  DE 02 09  DEC $0902,X
  $A14F  00        BRK
  $A150  E6 02     INC $02
  $A152  E8        INX
  $A153  02        .db $02
  $A154  E9 02     SBC #$02
  $A156  EA        NOP
  $A157  02        .db $02
  $A158  E2        .db $E2
  $A159  02        .db $02
  $A15A  E3        .db $E3
  $A15B  02        .db $02
  $A15C  E4 02     CPX $02
  $A15E  E5 02     SBC $02
  $A160  E7        .db $E7
  $A161  02        .db $02
  $A162  0D 33 A0  ORA $A033
  $A165  03        .db $03
  $A166  A1 03     LDA ($03,X)
  $A168  A2 03     LDX #$03
  $A16A  A3        .db $A3
  $A16B  03        .db $03
  $A16C  A4 03     LDY $03
  $A16E  A5 03     LDA $03
  $A170  A6 03     LDX $03
  $A172  A7        .db $A7
  $A173  03        .db $03
  $A174  A8        TAY
  $A175  03        .db $03
  $A176  A9 03     LDA #$03
  $A178  A9 43     LDA #$43
  $A17A  A8        TAY
  $A17B  43        .db $43
  $A17C  AD 02 0D  LDA $0D02
  $A17F  33        .db $33
  $A180  A0 03     LDY #$03
  $A182  A1 03     LDA ($03,X)
  $A184  AA        TAX
  $A185  03        .db $03
  $A186  AB        .db $AB
  $A187  03        .db $03
  $A188  A4 03     LDY $03
  $A18A  A5 03     LDA $03
  $A18C  A6 03     LDX $03
  $A18E  AC 03 A8  LDY $A803
  $A191  03        .db $03
  $A192  A9 03     LDA #$03
  $A194  A9 43     LDA #$43
  $A196  A8        TAY
  $A197  43        .db $43
  $A198  AD 02 0D  LDA $0D02
  $A19B  33        .db $33
  $A19C  AE 03 AF  LDX $AF03
  $A19F  03        .db $03
  $A1A0  B0 03     BCS $A1A5
  $A1A2  A3        .db $A3
  $A1A3  03        .db $03
  $A1A4  B1 03     LDA ($03),Y
  $A1A6  B2        .db $B2
  $A1A7  03        .db $03
  $A1A8  B3        .db $B3
  $A1A9  03        .db $03
  $A1AA  A7        .db $A7
  $A1AB  03        .db $03
  $A1AC  A8        TAY
  $A1AD  03        .db $03
  $A1AE  B4 03     LDY $03,X
  $A1B0  B5 03     LDA $03,X
  $A1B2  A8        TAY
  $A1B3  43        .db $43
  $A1B4  B7        .db $B7
  $A1B5  02        .db $02
  $A1B6  0D 33 AE  ORA $AE33
  $A1B9  03        .db $03
  $A1BA  AF        .db $AF
  $A1BB  03        .db $03
  $A1BC  B6 03     LDX $03,Y
  $A1BE  AB        .db $AB
  $A1BF  03        .db $03
  $A1C0  B1 03     LDA ($03),Y
  $A1C2  B2        .db $B2
  $A1C3  03        .db $03
  $A1C4  B3        .db $B3
  $A1C5  03        .db $03
  $A1C6  AC 03 A8  LDY $A803
  $A1C9  03        .db $03
  $A1CA  B4 03     LDY $03,X
  $A1CC  B5 03     LDA $03,X
  $A1CE  A8        TAY
  $A1CF  43        .db $43
  $A1D0  B7        .db $B7
  $A1D1  02        .db $02
  $A1D2  0E 33 B9  ASL $B933
  $A1D5  03        .db $03
  $A1D6  BA        TSX
  $A1D7  03        .db $03
  $A1D8  A2 03     LDX #$03
  $A1DA  A3        .db $A3
  $A1DB  03        .db $03
  $A1DC  8F        .db $8F
  $A1DD  03        .db $03
  $A1DE  A5 03     LDA $03
  $A1E0  A6 03     LDX $03
  $A1E2  A7        .db $A7
  $A1E3  03        .db $03
  $A1E4  A8        TAY
  $A1E5  03        .db $03
  $A1E6  A9 03     LDA #$03
  $A1E8  A9 43     LDA #$43
  $A1EA  A8        TAY
  $A1EB  43        .db $43
  $A1EC  BB        .db $BB
  $A1ED  02        .db $02
  $A1EE  B8        CLV
  $A1EF  03        .db $03
  $A1F0  0E 33 B9  ASL $B933
  $A1F3  03        .db $03
  $A1F4  BA        TSX
  $A1F5  03        .db $03
  $A1F6  A2 03     LDX #$03
  $A1F8  AB        .db $AB
  $A1F9  03        .db $03
  $A1FA  8F        .db $8F
  $A1FB  03        .db $03
  $A1FC  A5 03     LDA $03
  $A1FE  A6 03     LDX $03
  $A200  AC 03 A8  LDY $A803
  $A203  03        .db $03
  $A204  A9 03     LDA #$03
  $A206  A9 43     LDA #$43
  $A208  A8        TAY
  $A209  43        .db $43
  $A20A  BB        .db $BB
  $A20B  02        .db $02
  $A20C  B8        CLV
  $A20D  03        .db $03
  $A20E  05 34     ORA $34
  $A210  C7        .db $C7
  $A211  02        .db $02
  $A212  C8        INY
  $A213  02        .db $02
  $A214  C9 02     CMP #$02
  $A216  CA        DEX
  $A217  02        .db $02
  $A218  CB        .db $CB
  $A219  02        .db $02
  $A21A  05 34     ORA $34
  $A21C  CC 02 CD  CPY $CD02
  $A21F  02        .db $02
  $A220  CE 02 CF  DEC $CF02
  $A223  02        .db $02
  $A224  D0 02     BNE $A228
  $A226  07        .db $07
  $A227  34        .db $34

L_A228:
  $A228  C7        .db $C7
  $A229  02        .db $02
  $A22A  C8        INY
  $A22B  02        .db $02
  $A22C  C9 02     CMP #$02
  $A22E  CA        DEX
  $A22F  02        .db $02
  $A230  CB        .db $CB
  $A231  02        .db $02
  $A232  D1 02     CMP ($02),Y
  $A234  D2        .db $D2
  $A235  02        .db $02
  $A236  07        .db $07
  $A237  34        .db $34
  $A238  C7        .db $C7
  $A239  02        .db $02
  $A23A  C8        INY
  $A23B  02        .db $02
  $A23C  C9 02     CMP #$02
  $A23E  CA        DEX
  $A23F  02        .db $02
  $A240  CB        .db $CB
  $A241  02        .db $02
  $A242  D3        .db $D3
  $A243  02        .db $02
  $A244  D4        .db $D4
  $A245  02        .db $02
  $A246  09 35     ORA #$35
  $A248  A0 03     LDY #$03
  $A24A  A1 03     LDA ($03,X)
  $A24C  A2 03     LDX #$03
  $A24E  A3        .db $A3
  $A24F  03        .db $03
  $A250  A4 03     LDY $03
  $A252  A5 03     LDA $03
  $A254  A6 03     LDX $03
  $A256  A7        .db $A7
  $A257  03        .db $03
  $A258  B7        .db $B7
  $A259  01 09     ORA ($09,X)
  $A25B  35 A8     AND $A8,X
  $A25D  03        .db $03
  $A25E  A9 03     LDA #$03
  $A260  AA        TAX
  $A261  03        .db $03
  $A262  AB        .db $AB
  $A263  03        .db $03
  $A264  AC 03 AD  LDY $AD03
  $A267  03        .db $03
  $A268  AE 03 AF  LDX $AF03
  $A26B  03        .db $03
  $A26C  B8        CLV
  $A26D  01 06     ORA ($06,X)
  $A26F  36 B0     ROL $B0,X
  $A271  03        .db $03
  $A272  B1 03     LDA ($03),Y
  $A274  B2        .db $B2
  $A275  03        .db $03
  $A276  B3        .db $B3
  $A277  03        .db $03
  $A278  A7        .db $A7
  $A279  03        .db $03

L_A27A:
  $A27A  B7        .db $B7
  $A27B  01 06     ORA ($06,X)
  $A27D  37        .db $37
  $A27E  B4 03     LDY $03,X
  $A280  B5 03     LDA $03,X
  $A282  B6 03     LDX $03,Y
  $A284  AF        .db $AF
  $A285  03        .db $03
  $A286  B2        .db $B2
  $A287  03        .db $03
  $A288  B7        .db $B7
  $A289  01 15     ORA ($15,X)
  $A28B  4F        .db $4F
  $A28C  D3        .db $D3
  $A28D  23        .db $23
  $A28E  D4        .db $D4
  $A28F  23        .db $23
  $A290  D4        .db $D4
  $A291  63        .db $63

L_A292:
  $A292  D3        .db $D3
  $A293  63        .db $63
  $A294  D5 23     CMP $23,X
  $A296  D6 23     DEC $23,X
  $A298  D7        .db $D7
  $A299  23        .db $23
  $A29A  D8        CLD
  $A29B  23        .db $23

L_A29C:
  $A29C  D1 23     CMP ($23),Y
  $A29E  D2        .db $D2
  $A29F  23        .db $23
  $A2A0  D0 23     BNE $A2C5
  $A2A2  D0 23     BNE $A2C7
  $A2A4  D0 23     BNE $A2C9
  $A2A6  D0 23     BNE $A2CB
  $A2A8  D0 23     BNE $A2CD
  $A2AA  D0 23     BNE $A2CF

L_A2AC:
  $A2AC  D0 23     BNE $A2D1
  $A2AE  D0 23     BNE $A2D3
  $A2B0  D0 23     BNE $A2D5
  $A2B2  D0 23     BNE $A2D7

L_A2B4:
  $A2B4  D0 23     BNE $A2D9
  $A2B6  04        .db $04
  $A2B7  17        .db $17
  $A2B8  D5 02     CMP $02,X
  $A2BA  D6 02     DEC $02,X

L_A2BC:
  $A2BC  D7        .db $D7
  $A2BD  02        .db $02

L_A2BE:
  $A2BE  D8        CLD
  $A2BF  02        .db $02
  $A2C0  01 09     ORA ($09,X)
  $A2C2  3C        .db $3C
  $A2C3  02        .db $02
  $A2C4  04        .db $04

L_A2C5:
  $A2C5  17        .db $17
  $A2C6  C9 03     CMP #$03
  $A2C8  CA        DEX

L_A2C9:
  $A2C9  03        .db $03
  $A2CA  CB        .db $CB

L_A2CB:
  $A2CB  03        .db $03

L_A2CC:
  $A2CC  CC 03 06  CPY $0603

L_A2CF:
  $A2CF  39 D0 03  AND $03D0,Y
  $A2D2  D1 03     CMP ($03),Y

L_A2D4:
  $A2D4  D2        .db $D2

L_A2D5:
  $A2D5  03        .db $03

L_A2D6:
  $A2D6  D3        .db $D3

L_A2D7:
  $A2D7  03        .db $03
  $A2D8  D4        .db $D4

L_A2D9:
  $A2D9  03        .db $03
  $A2DA  D5 03     CMP $03,X
  $A2DC  09 1C     ORA #$1C

L_A2DE:
  $A2DE  D6 03     DEC $03,X

L_A2E0:
  $A2E0  D7        .db $D7
  $A2E1  03        .db $03
  $A2E2  D8        CLD
  $A2E3  03        .db $03
  $A2E4  D9 03 DA  CMP $DA03,Y
  $A2E7  03        .db $03
  $A2E8  DB        .db $DB
  $A2E9  03        .db $03
  $A2EA  DC        .db $DC
  $A2EB  03        .db $03
  $A2EC  DD 03 DE  CMP $DE03,X
  $A2EF  03        .db $03

L_A2F0:
  $A2F0  10 3A     BPL $A32C
  $A2F2  D0 02     BNE $A2F6
  $A2F4  D0 42     BNE $A338

L_A2F6:
  $A2F6  D0 82     BNE $A27A

L_A2F8:
  $A2F8  D0 C2     BNE $A2BC
  $A2FA  D1 02     CMP ($02),Y
  $A2FC  D2        .db $D2
  $A2FD  02        .db $02
  $A2FE  D3        .db $D3
  $A2FF  02        .db $02

L_A300:
  $A300  D4        .db $D4
  $A301  02        .db $02
  $A302  D0 02     BNE $A306
  $A304  D0 42     BNE $A348

L_A306:
  $A306  D0 82     BNE $A28A
  $A308  D0 C2     BNE $A2CC
  $A30A  D0 02     BNE $A30E

L_A30C:
  $A30C  D0 42     BNE $A350

L_A30E:
  $A30E  D0 82     BNE $A292

L_A310:
  $A310  D0 C2     BNE $A2D4
  $A312  10 3B     BPL $A34F
  $A314  D0 02     BNE $A318
  $A316  D0 42     BNE $A35A

L_A318:
  $A318  D0 82     BNE $A29C
  $A31A  D0 C2     BNE $A2DE
  $A31C  D1 02     CMP ($02),Y
  $A31E  D2        .db $D2
  $A31F  02        .db $02
  $A320  D3        .db $D3
  $A321  02        .db $02

L_A322:
  $A322  D4        .db $D4
  $A323  02        .db $02
  $A324  D0 02     BNE $A328
  $A326  D0 42     BNE $A36A

L_A328:
  $A328  D0 82     BNE $A2AC
  $A32A  D0 C2     BNE $A2EE

L_A32C:
  $A32C  D0 02     BNE $A330
  $A32E  D0 42     BNE $A372

L_A330:
  $A330  D0 82     BNE $A2B4

L_A332:
  $A332  D0 C2     BNE $A2F6
  $A334  10 3C     BPL $A372
  $A336  D0 02     BNE $A33A

L_A338:
  $A338  D0 42     BNE $A37C

L_A33A:
  $A33A  D0 82     BNE $A2BE
  $A33C  D0 C2     BNE $A300
  $A33E  D1 02     CMP ($02),Y
  $A340  D2        .db $D2
  $A341  02        .db $02
  $A342  D3        .db $D3
  $A343  02        .db $02
  $A344  D4        .db $D4
  $A345  02        .db $02
  $A346  D0 02     BNE $A34A

L_A348:
  $A348  D0 42     BNE $A38C

L_A34A:
  $A34A  D0 82     BNE $A2CE
  $A34C  D0 C2     BNE $A310

L_A34E:
  $A34E  D0 02     BNE $A352

L_A350:
  $A350  D0 42     BNE $A394

L_A352:
  $A352  D0 82     BNE $A2D6
  $A354  D0 C2     BNE $A318
  $A356  10 3A     BPL $A392
  $A358  D0 02     BNE $A35C

L_A35A:
  $A35A  D0 42     BNE $A39E

L_A35C:
  $A35C  D0 82     BNE $A2E0
  $A35E  D0 C2     BNE $A322
  $A360  D5 02     CMP $02,X
  $A362  D6 02     DEC $02,X
  $A364  D7        .db $D7
  $A365  02        .db $02
  $A366  D8        CLD
  $A367  02        .db $02
  $A368  D0 02     BNE $A36C

L_A36A:
  $A36A  D0 42     BNE $A3AE

L_A36C:
  $A36C  D0 82     BNE $A2F0
  $A36E  D0 C2     BNE $A332
  $A370  D0 02     BNE $A374

L_A372:
  $A372  D0 42     BNE $A3B6

L_A374:
  $A374  D0 82     BNE $A2F8
  $A376  D0 C2     BNE $A33A
  $A378  04        .db $04
  $A379  17        .db $17
  $A37A  D9 02 DA  CMP $DA02,Y
  $A37D  02        .db $02
  $A37E  DB        .db $DB
  $A37F  02        .db $02
  $A380  DC        .db $DC
  $A381  02        .db $02
  $A382  04        .db $04
  $A383  17        .db $17
  $A384  D0 02     BNE $A388
  $A386  D0 42     BNE $A3CA

L_A388:
  $A388  D0 82     BNE $A30C
  $A38A  D0 C2     BNE $A34E

L_A38C:
  $A38C  15 3D     ORA $3D,X
  $A38E  A2 03     LDX #$03
  $A390  A3        .db $A3
  $A391  03        .db $03

L_A392:
  $A392  A4 03     LDY $03

L_A394:
  $A394  A5 03     LDA $03
  $A396  A7        .db $A7
  $A397  03        .db $03
  $A398  A8        TAY
  $A399  03        .db $03
  $A39A  A9 03     LDA #$03
  $A39C  AA        TAX
  $A39D  03        .db $03

L_A39E:
  $A39E  AB        .db $AB
  $A39F  03        .db $03
  $A3A0  AC 03 AD  LDY $AD03
  $A3A3  03        .db $03
  $A3A4  AE 03 AF  LDX $AF03
  $A3A7  03        .db $03
  $A3A8  B0 03     BCS $A3AD
  $A3AA  B1 03     LDA ($03),Y
  $A3AC  B2        .db $B2

L_A3AD:
  $A3AD  03        .db $03

L_A3AE:
  $A3AE  A1 03     LDA ($03,X)
  $A3B0  A6 03     LDX $03
  $A3B2  B7        .db $B7
  $A3B3  01 B8     ORA ($B8,X)
  $A3B5  01 A0     ORA ($A0,X)
  $A3B7  03        .db $03
  $A3B8  14        .db $14
  $A3B9  3D A2 03  AND $03A2,X
  $A3BC  B3        .db $B3
  $A3BD  03        .db $03
  $A3BE  B4 03     LDY $03,X
  $A3C0  A5 03     LDA $03
  $A3C2  A7        .db $A7
  $A3C3  03        .db $03
  $A3C4  B5 03     LDA $03,X
  $A3C6  B6 03     LDX $03,Y
  $A3C8  AA        TAX
  $A3C9  03        .db $03

L_A3CA:
  $A3CA  AB        .db $AB
  $A3CB  03        .db $03
  $A3CC  AC 03 AD  LDY $AD03
  $A3CF  03        .db $03
  $A3D0  AE 03 AF  LDX $AF03
  $A3D3  03        .db $03
  $A3D4  B0 03     BCS $A3D9
  $A3D6  B1 03     LDA ($03),Y
  $A3D8  B2        .db $B2

L_A3D9:
  $A3D9  03        .db $03
  $A3DA  A1 03     LDA ($03,X)
  $A3DC  A6 03     LDX $03
  $A3DE  B7        .db $B7
  $A3DF  01 B8     ORA ($B8,X)
  $A3E1  01 18     ORA ($18,X)
  $A3E3  3E 8F 03  ROL $038F,X
  $A3E6  BA        TSX
  $A3E7  03        .db $03
  $A3E8  BB        .db $BB
  $A3E9  03        .db $03
  $A3EA  BC 03 BD  LDY $BD03,X
  $A3ED  03        .db $03
  $A3EE  BE 03 BF  LDX $BF03,Y
  $A3F1  03        .db $03
  $A3F2  C0 03     CPY #$03
  $A3F4  C1 03     CMP ($03,X)
  $A3F6  C3        .db $C3
  $A3F7  03        .db $03
  $A3F8  C4 03     CPY $03
  $A3FA  C5 03     CMP $03
  $A3FC  C6 03     DEC $03
  $A3FE  C7        .db $C7
  $A3FF  03        .db $03
  $A400  CA        DEX
  $A401  03        .db $03
  $A402  CB        .db $CB
  $A403  03        .db $03
  $A404  CC 03 CD  CPY $CD03
  $A407  03        .db $03
  $A408  E5 01     SBC $01
  $A40A  E4 01     CPX $01
  $A40C  C9 03     CMP #$03
  $A40E  C2        .db $C2
  $A40F  03        .db $03
  $A410  C8        INY
  $A411  03        .db $03
  $A412  B9 03 14  LDA $1403,Y
  $A415  3E CE 03  ROL $03CE,X
  $A418  CF        .db $CF
  $A419  03        .db $03
  $A41A  E0 03     CPX #$03
  $A41C  BC 03 E1  LDY $E103,X
  $A41F  03        .db $03
  $A420  E2        .db $E2
  $A421  03        .db $03
  $A422  BF        .db $BF
  $A423  03        .db $03
  $A424  C0 03     CPY #$03
  $A426  C1 03     CMP ($03,X)
  $A428  E3        .db $E3
  $A429  03        .db $03
  $A42A  C4 03     CPY $03
  $A42C  C5 03     CMP $03
  $A42E  C6 03     DEC $03
  $A430  C7        .db $C7
  $A431  03        .db $03
  $A432  CA        DEX
  $A433  03        .db $03
  $A434  CB        .db $CB
  $A435  03        .db $03
  $A436  CC 03 CD  CPY $CD03
  $A439  03        .db $03
  $A43A  E5 01     SBC $01
  $A43C  E4 01     CPX $01
  $A43E  04        .db $04
  $A43F  17        .db $17
  $A440  E6 03     INC $03
  $A442  E7        .db $E7
  $A443  03        .db $03
  $A444  E8        INX
  $A445  03        .db $03
  $A446  E9 03     SBC #$03
  $A448  04        .db $04
  $A449  17        .db $17
  $A44A  EA        NOP
  $A44B  03        .db $03
  $A44C  EB        .db $EB
  $A44D  03        .db $03
  $A44E  EC 03 ED  CPX $ED03
  $A451  03        .db $03
  $A452  2A        ROL
  $A453  3F        .db $3F
  $A454  D1 03     CMP ($03),Y
  $A456  A0 03     LDY #$03
  $A458  A0 43     LDY #$43
  $A45A  D1 43     CMP ($43),Y
  $A45C  A1 03     LDA ($03,X)
  $A45E  A2 03     LDX #$03
  $A460  A3        .db $A3
  $A461  03        .db $03
  $A462  A4 03     LDY $03
  $A464  A5 03     LDA $03
  $A466  A6 03     LDX $03
  $A468  A7        .db $A7
  $A469  03        .db $03
  $A46A  A8        TAY
  $A46B  03        .db $03
  $A46C  A9 03     LDA #$03
  $A46E  A5 43     LDA $43
  $A470  AA        TAX
  $A471  03        .db $03
  $A472  AB        .db $AB
  $A473  03        .db $03
  $A474  AC 03 AC  LDY $AC03
  $A477  43        .db $43
  $A478  AD 03 AE  LDA $AE03
  $A47B  03        .db $03
  $A47C  AF        .db $AF
  $A47D  03        .db $03
  $A47E  B0 03     BCS $A483
  $A480  B1 03     LDA ($03),Y
  $A482  B1 43     LDA ($43),Y
  $A484  B2        .db $B2
  $A485  03        .db $03
  $A486  B3        .db $B3
  $A487  03        .db $03
  $A488  B4 03     LDY $03,X
  $A48A  B5 03     LDA $03,X
  $A48C  AD 03 AD  LDA $AD03
  $A48F  43        .db $43
  $A490  B6 03     LDX $03,Y
  $A492  B7        .db $B7
  $A493  03        .db $03
  $A494  B8        CLV
  $A495  03        .db $03
  $A496  B9 03 BA  LDA $BA03,Y
  $A499  03        .db $03
  $A49A  BB        .db $BB
  $A49B  03        .db $03
  $A49C  BC 03 BD  LDY $BD03,X
  $A49F  03        .db $03
  $A4A0  BE 03 BF  LDX $BF03,Y
  $A4A3  03        .db $03
  $A4A4  C0 03     CPY #$03
  $A4A6  D2        .db $D2
  $A4A7  01 2D     ORA ($2D,X)
  $A4A9  40        RTI
  $A4AA  C1 03     CMP ($03,X)
  $A4AC  C2        .db $C2
  $A4AD  03        .db $03
  $A4AE  C2        .db $C2
  $A4AF  43        .db $43
  $A4B0  C1 43     CMP ($43,X)
  $A4B2  C3        .db $C3
  $A4B3  03        .db $03
  $A4B4  C4 03     CPY $03
  $A4B6  C5 03     CMP $03
  $A4B8  C6 03     DEC $03
  $A4BA  C7        .db $C7
  $A4BB  03        .db $03
  $A4BC  C3        .db $C3
  $A4BD  43        .db $43
  $A4BE  C8        INY
  $A4BF  03        .db $03
  $A4C0  C9 03     CMP #$03
  $A4C2  CA        DEX
  $A4C3  03        .db $03
  $A4C4  CB        .db $CB
  $A4C5  03        .db $03
  $A4C6  AD 03 C8  LDA $C803
  $A4C9  43        .db $43
  $A4CA  AA        TAX
  $A4CB  03        .db $03
  $A4CC  AB        .db $AB
  $A4CD  03        .db $03
  $A4CE  AC 03 AC  LDY $AC03
  $A4D1  43        .db $43
  $A4D2  AD 03 AE  LDA $AE03
  $A4D5  03        .db $03
  $A4D6  AF        .db $AF
  $A4D7  03        .db $03
  $A4D8  B0 03     BCS $A4DD
  $A4DA  B1 03     LDA ($03),Y
  $A4DC  B1 43     LDA ($43),Y
  $A4DE  B2        .db $B2
  $A4DF  03        .db $03
  $A4E0  B3        .db $B3
  $A4E1  03        .db $03
  $A4E2  B4 03     LDY $03,X
  $A4E4  CC 03 AD  CPY $AD03
  $A4E7  03        .db $03
  $A4E8  AD 03 CD  LDA $CD03
  $A4EB  03        .db $03
  $A4EC  B7        .db $B7
  $A4ED  03        .db $03
  $A4EE  CE 03 CF  DEC $CF03
  $A4F1  03        .db $03
  $A4F2  B9 03 D0  LDA $D003,Y
  $A4F5  03        .db $03
  $A4F6  BD 43 BC  LDA $BC43,X
  $A4F9  43        .db $43
  $A4FA  BB        .db $BB
  $A4FB  43        .db $43
  $A4FC  C0 43     CPY #$43
  $A4FE  BF        .db $BF
  $A4FF  43        .db $43
  $A500  BE 43 D2  LDX $D243,Y
  $A503  01 04     ORA ($04,X)
  $A505  17        .db $17
  $A506  83        .db $83
  $A507  01 83     ORA ($83,X)
  $A509  41 83     EOR ($83,X)
  $A50B  81 83     STA ($83,X)
  $A50D  C1 04     CMP ($04,X)
  $A50F  17        .db $17
  $A510  84 01     STY $01
  $A512  84 41     STY $41
  $A514  84 81     STY $81
  $A516  84 C1     STY $C1
  $A518  04        .db $04
  $A519  17        .db $17
  $A51A  85 01     STA $01
  $A51C  85 41     STA $41
  $A51E  85 81     STA $81
  $A520  85 C1     STA $C1
  $A522  01 00     ORA ($00,X)
  $A524  86 01     STX $01
  $A526  09 00     ORA #$00
  $A528  A3        .db $A3
  $A529  43        .db $43
  $A52A  BB        .db $BB
  $A52B  43        .db $43
  $A52C  BA        TSX
  $A52D  43        .db $43
  $A52E  B9 43 A1  LDA $A143,Y
  $A531  43        .db $43
  $A532  A0 43     LDY #$43
  $A534  8F        .db $8F
  $A535  43        .db $43
  $A536  A4 43     LDY $43
  $A538  A2 43     LDX #$43
  $A53A  01 00     ORA ($00,X)
  $A53C  8C 01 01  STY $0101
  $A53F  00        BRK
  $A540  8C 41 08  STY $0841
  $A543  43        .db $43
  $A544  D0 03     BNE $A549
  $A546  D1 03     CMP ($03),Y
  $A548  D2        .db $D2

L_A549:
  $A549  03        .db $03
  $A54A  D3        .db $D3
  $A54B  03        .db $03
  $A54C  D4        .db $D4
  $A54D  03        .db $03
  $A54E  D5 03     CMP $03,X
  $A550  D6 03     DEC $03,X
  $A552  D7        .db $D7
  $A553  03        .db $03
  $A554  08        PHP
  $A555  43        .db $43
  $A556  D8        CLD
  $A557  03        .db $03
  $A558  D1 03     CMP ($03),Y
  $A55A  D2        .db $D2
  $A55B  03        .db $03
  $A55C  D3        .db $D3
  $A55D  03        .db $03
  $A55E  D9 03 D5  CMP $D503,Y
  $A561  03        .db $03
  $A562  D6 03     DEC $03,X
  $A564  D7        .db $D7
  $A565  03        .db $03
  $A566  08        PHP
  $A567  44        .db $44
  $A568  DA        .db $DA
  $A569  03        .db $03
  $A56A  DB        .db $DB
  $A56B  03        .db $03
  $A56C  DC        .db $DC
  $A56D  03        .db $03
  $A56E  DD 03 DE  CMP $DE03,X
  $A571  03        .db $03
  $A572  DF        .db $DF
  $A573  03        .db $03
  $A574  E0 03     CPX #$03
  $A576  E7        .db $E7
  $A577  01 08     ORA ($08,X)
  $A579  44        .db $44
  $A57A  DA        .db $DA
  $A57B  03        .db $03
  $A57C  E1 03     SBC ($03,X)
  $A57E  E2        .db $E2
  $A57F  03        .db $03
  $A580  E3        .db $E3
  $A581  03        .db $03
  $A582  E4 03     CPX $03
  $A584  E5 03     SBC $03
  $A586  E6 03     INC $03
  $A588  E8        INX
  $A589  01 04     ORA ($04,X)
  $A58B  2F        .db $2F
  $A58C  DB        .db $DB
  $A58D  03        .db $03
  $A58E  DC        .db $DC
  $A58F  03        .db $03
  $A590  DD 03 DE  CMP $DE03,X
  $A593  03        .db $03
  $A594  04        .db $04
  $A595  2F        .db $2F
  $A596  DB        .db $DB
  $A597  03        .db $03
  $A598  DC        .db $DC
  $A599  03        .db $03
  $A59A  DD 03 DF  CMP $DF03,X
  $A59D  03        .db $03
  $A59E  08        PHP
  $A59F  43        .db $43
  $A5A0  C8        INY
  $A5A1  03        .db $03
  $A5A2  C8        INY
  $A5A3  03        .db $03
  $A5A4  C8        INY
  $A5A5  03        .db $03
  $A5A6  C8        INY
  $A5A7  03        .db $03
  $A5A8  C8        INY
  $A5A9  03        .db $03
  $A5AA  C8        INY
  $A5AB  03        .db $03
  $A5AC  C8        INY
  $A5AD  03        .db $03
  $A5AE  C8        INY
  $A5AF  03        .db $03
  $A5B0  04        .db $04
  $A5B1  17        .db $17
  $A5B2  DD 43 DC  CMP $DC43,X
  $A5B5  43        .db $43
  $A5B6  DF        .db $DF
  $A5B7  43        .db $43
  $A5B8  DE 43 02  DEC $0243,X
  $A5BB  45 CE     EOR $CE
  $A5BD  82        .db $82
  $A5BE  CF        .db $CF
  $A5BF  82        .db $82
  $A5C0  16 46     ASL $46,X
  $A5C2  C0 03     CPY #$03
  $A5C4  C1 03     CMP ($03,X)
  $A5C6  C2        .db $C2
  $A5C7  03        .db $03
  $A5C8  C3        .db $C3
  $A5C9  03        .db $03
  $A5CA  C4 03     CPY $03
  $A5CC  C5 03     CMP $03
  $A5CE  C6 03     DEC $03
  $A5D0  A0 03     LDY #$03
  $A5D2  A1 03     LDA ($03,X)
  $A5D4  A2 03     LDX #$03
  $A5D6  A3        .db $A3
  $A5D7  03        .db $03
  $A5D8  A4 03     LDY $03
  $A5DA  A5 03     LDA $03
  $A5DC  A6 03     LDX $03
  $A5DE  A7        .db $A7
  $A5DF  03        .db $03
  $A5E0  A8        TAY
  $A5E1  03        .db $03
  $A5E2  A9 03     LDA #$03
  $A5E4  AA        TAX
  $A5E5  03        .db $03
  $A5E6  AB        .db $AB
  $A5E7  03        .db $03
  $A5E8  AC 03 AD  LDY $AD03
  $A5EB  03        .db $03
  $A5EC  D9 01 18  CMP $1801,Y
  $A5EF  47        .db $47
  $A5F0  C0 03     CPY #$03
  $A5F2  C1 03     CMP ($03,X)
  $A5F4  C2        .db $C2
  $A5F5  03        .db $03
  $A5F6  C3        .db $C3
  $A5F7  03        .db $03
  $A5F8  C4 03     CPY $03
  $A5FA  C5 03     CMP $03
  $A5FC  C6 03     DEC $03
  $A5FE  A0 03     LDY #$03
  $A600  A1 03     LDA ($03,X)
  $A602  A2 03     LDX #$03
  $A604  A3        .db $A3
  $A605  03        .db $03
  $A606  A4 03     LDY $03
  $A608  A5 03     LDA $03
  $A60A  A6 03     LDX $03
  $A60C  A7        .db $A7
  $A60D  03        .db $03
  $A60E  A8        TAY
  $A60F  03        .db $03
  $A610  A9 03     LDA #$03
  $A612  AE 03 AF  LDX $AF03
  $A615  03        .db $03
  $A616  B0 03     BCS $A61B
  $A618  B1 03     LDA ($03),Y
  $A61A  B2        .db $B2

L_A61B:
  $A61B  03        .db $03
  $A61C  B3        .db $B3
  $A61D  03        .db $03
  $A61E  D9 01 17  CMP $1701,Y
  $A621  48        PHA
  $A622  C7        .db $C7
  $A623  03        .db $03
  $A624  C8        INY
  $A625  03        .db $03
  $A626  C9 03     CMP #$03
  $A628  CA        DEX
  $A629  03        .db $03
  $A62A  CB        .db $CB
  $A62B  03        .db $03
  $A62C  CC 03 CD  CPY $CD03
  $A62F  03        .db $03
  $A630  CE 03 A0  DEC $A003
  $A633  03        .db $03
  $A634  A1 03     LDA ($03,X)
  $A636  A2 03     LDX #$03
  $A638  A3        .db $A3
  $A639  03        .db $03
  $A63A  A4 03     LDY $03
  $A63C  A5 03     LDA $03
  $A63E  A6 03     LDX $03
  $A640  A7        .db $A7
  $A641  03        .db $03
  $A642  A8        TAY
  $A643  03        .db $03
  $A644  A9 03     LDA #$03
  $A646  AA        TAX
  $A647  03        .db $03
  $A648  AB        .db $AB
  $A649  03        .db $03
  $A64A  AC 03 AD  LDY $AD03
  $A64D  03        .db $03
  $A64E  D9 01 17  CMP $1701,Y
  $A651  49 CF     EOR #$CF
  $A653  03        .db $03
  $A654  D0 03     BNE $A659
  $A656  D1 03     CMP ($03),Y
  $A658  D2        .db $D2

L_A659:
  $A659  03        .db $03
  $A65A  D3        .db $D3
  $A65B  03        .db $03
  $A65C  D4        .db $D4
  $A65D  03        .db $03
  $A65E  D5 03     CMP $03,X
  $A660  D6 03     DEC $03,X
  $A662  A0 03     LDY #$03
  $A664  A1 03     LDA ($03,X)
  $A666  A2 03     LDX #$03
  $A668  A3        .db $A3
  $A669  03        .db $03
  $A66A  A4 03     LDY $03
  $A66C  A5 03     LDA $03
  $A66E  A6 03     LDX $03
  $A670  A7        .db $A7
  $A671  03        .db $03
  $A672  A8        TAY
  $A673  03        .db $03
  $A674  A9 03     LDA #$03
  $A676  AA        TAX
  $A677  03        .db $03
  $A678  AB        .db $AB
  $A679  03        .db $03
  $A67A  AC 03 AD  LDY $AD03
  $A67D  03        .db $03
  $A67E  D9 01 07  CMP $0701,Y
  $A681  4A        LSR
  $A682  B4 03     LDY $03,X
  $A684  B5 03     LDA $03,X
  $A686  B6 03     LDX $03,Y
  $A688  B7        .db $B7
  $A689  03        .db $03
  $A68A  B8        CLV
  $A68B  03        .db $03
  $A68C  B9 03 BA  LDA $BA03,Y
  $A68F  03        .db $03
  $A690  07        .db $07
  $A691  4B        .db $4B
  $A692  BB        .db $BB
  $A693  03        .db $03
  $A694  BC 03 BD  LDY $BD03,X
  $A697  03        .db $03
  $A698  BE 03 BF  LDX $BF03,Y
  $A69B  03        .db $03
  $A69C  D7        .db $D7
  $A69D  03        .db $03
  $A69E  D8        CLD
  $A69F  03        .db $03
  $A6A0  04        .db $04
  $A6A1  17        .db $17
  $A6A2  DB        .db $DB
  $A6A3  02        .db $02
  $A6A4  DB        .db $DB
  $A6A5  42        .db $42
  $A6A6  DB        .db $DB
  $A6A7  82        .db $82
  $A6A8  DB        .db $DB
  $A6A9  C2        .db $C2
  $A6AA  04        .db $04
  $A6AB  17        .db $17
  $A6AC  DC        .db $DC
  $A6AD  02        .db $02
  $A6AE  DC        .db $DC
  $A6AF  42        .db $42
  $A6B0  DC        .db $DC
  $A6B1  82        .db $82
  $A6B2  DC        .db $DC
  $A6B3  C2        .db $C2
  $A6B4  14        .db $14
  $A6B5  3A        .db $3A
  $A6B6  F5 03     SBC $03,X
  $A6B8  F5 43     SBC $43,X
  $A6BA  F5 83     SBC $83,X
  $A6BC  F5 C3     SBC $C3,X
  $A6BE  F5 03     SBC $03,X
  $A6C0  F5 43     SBC $43,X
  $A6C2  F5 83     SBC $83,X
  $A6C4  F5 C3     SBC $C3,X
  $A6C6  F5 03     SBC $03,X
  $A6C8  F5 43     SBC $43,X
  $A6CA  F5 83     SBC $83,X
  $A6CC  F5 C3     SBC $C3,X
  $A6CE  F5 83     SBC $83,X
  $A6D0  F5 C3     SBC $C3,X
  $A6D2  F4        .db $F4
  $A6D3  83        .db $83
  $A6D4  F4        .db $F4
  $A6D5  C3        .db $C3
  $A6D6  F4        .db $F4
  $A6D7  03        .db $03
  $A6D8  F4        .db $F4
  $A6D9  43        .db $43
  $A6DA  F5 03     SBC $03,X
  $A6DC  F5 43     SBC $43,X
  $A6DE  10 4C     BPL $A72C
  $A6E0  F7        .db $F7
  $A6E1  03        .db $03
  $A6E2  F7        .db $F7
  $A6E3  03        .db $03
  $A6E4  F7        .db $F7
  $A6E5  43        .db $43
  $A6E6  F7        .db $F7
  $A6E7  03        .db $03
  $A6E8  F7        .db $F7
  $A6E9  43        .db $43
  $A6EA  F7        .db $F7
  $A6EB  43        .db $43
  $A6EC  F7        .db $F7
  $A6ED  83        .db $83
  $A6EE  F7        .db $F7
  $A6EF  83        .db $83
  $A6F0  F7        .db $F7
  $A6F1  C3        .db $C3
  $A6F2  F7        .db $F7
  $A6F3  83        .db $83
  $A6F4  F7        .db $F7
  $A6F5  C3        .db $C3
  $A6F6  F7        .db $F7
  $A6F7  C3        .db $C3
  $A6F8  F6 03     INC $03,X
  $A6FA  F6 43     INC $43,X
  $A6FC  F6 83     INC $83,X
  $A6FE  F6 C3     INC $C3,X
  $A700  18        CLC
  $A701  4D F9 03  EOR $03F9
  $A704  F9 43 FB  SBC $FB43,Y
  $A707  03        .db $03
  $A708  FB        .db $FB
  $A709  43        .db $43
  $A70A  FB        .db $FB
  $A70B  83        .db $83
  $A70C  FB        .db $FB
  $A70D  C3        .db $C3
  $A70E  F9 83 F9  SBC $F983,Y
  $A711  C3        .db $C3
  $A712  F8        SED
  $A713  03        .db $03
  $A714  F9 03 F9  SBC $F903,Y
  $A717  43        .db $43
  $A718  F8        SED
  $A719  43        .db $43
  $A71A  FA        .db $FA
  $A71B  03        .db $03
  $A71C  FB        .db $FB
  $A71D  03        .db $03
  $A71E  FB        .db $FB
  $A71F  43        .db $43
  $A720  FA        .db $FA
  $A721  43        .db $43
  $A722  FA        .db $FA
  $A723  83        .db $83
  $A724  FB        .db $FB
  $A725  83        .db $83
  $A726  FB        .db $FB
  $A727  C3        .db $C3
  $A728  FA        .db $FA
  $A729  C3        .db $C3
  $A72A  F8        SED
  $A72B  83        .db $83

L_A72C:
  $A72C  F9 83 F9  SBC $F983,Y
  $A72F  C3        .db $C3
  $A730  F8        SED
  $A731  C3        .db $C3
  $A732  08        PHP
  $A733  4D FF 03  EOR $03FF
  $A736  FF        .db $FF
  $A737  03        .db $03
  $A738  FF        .db $FF
  $A739  03        .db $03
  $A73A  FF        .db $FF
  $A73B  03        .db $03
  $A73C  FF        .db $FF
  $A73D  03        .db $03
  $A73E  FF        .db $FF
  $A73F  03        .db $03
  $A740  FF        .db $FF
  $A741  03        .db $03
  $A742  FF        .db $FF
  $A743  03        .db $03
  $A744  01 00     ORA ($00,X)
  $A746  6A        ROR
  $A747  01 01     ORA ($01,X)
  $A749  09 F0     ORA #$F0
  $A74B  01 01     ORA ($01,X)
  $A74D  09 F1     ORA #$F1
  $A74F  01 04     ORA ($04,X)
  $A751  17        .db $17
  $A752  D7        .db $D7
  $A753  02        .db $02
  $A754  D7        .db $D7
  $A755  42        .db $42
  $A756  D8        CLD
  $A757  02        .db $02
  $A758  D8        CLD
  $A759  42        .db $42
  $A75A  04        .db $04
  $A75B  17        .db $17
  $A75C  F0 02     BEQ $A760
  $A75E  F0 42     BEQ $A7A2

L_A760:
  $A760  F1 02     SBC ($02),Y
  $A762  F2        .db $F2
  $A763  02        .db $02
  $A764  06 50     ASL $50
  $A766  F0 02     BEQ $A76A
  $A768  F0 42     BEQ $A7AC

L_A76A:
  $A76A  F3        .db $F3
  $A76B  02        .db $02
  $A76C  F4        .db $F4
  $A76D  02        .db $02
  $A76E  F5 02     SBC $02,X
  $A770  F5 42     SBC $42,X
  $A772  09 52     ORA #$52
  $A774  F6 02     INC $02,X
  $A776  F7        .db $F7
  $A777  02        .db $02
  $A778  F8        SED
  $A779  02        .db $02
  $A77A  F9 02 FA  SBC $FA02,Y
  $A77D  02        .db $02
  $A77E  FB        .db $FB
  $A77F  02        .db $02
  $A780  FC        .db $FC
  $A781  02        .db $02
  $A782  FD 02 FE  SBC $FE02,X
  $A785  02        .db $02
  $A786  06 51     ASL $51
  $A788  F0 02     BEQ $A78C
  $A78A  F0 42     BEQ $A7CE

L_A78C:
  $A78C  F4        .db $F4
  $A78D  42        .db $42
  $A78E  F3        .db $F3
  $A78F  42        .db $42
  $A790  F5 02     SBC $02,X
  $A792  F5 42     SBC $42,X
  $A794  09 53     ORA #$53
  $A796  F7        .db $F7
  $A797  42        .db $42
  $A798  F6 42     INC $42,X
  $A79A  FA        .db $FA
  $A79B  42        .db $42
  $A79C  F9 42 F8  SBC $F842,Y
  $A79F  42        .db $42
  $A7A0  FC        .db $FC
  $A7A1  42        .db $42

L_A7A2:
  $A7A2  FB        .db $FB
  $A7A3  42        .db $42
  $A7A4  FE 42 FD  INC $FD42,X
  $A7A7  42        .db $42
  $A7A8  02        .db $02
  $A7A9  54        .db $54
  $A7AA  D9 02 D9  CMP $D902,Y
  $A7AD  42        .db $42
  $A7AE  01 57     ORA ($57,X)
  $A7B0  DA        .db $DA
  $A7B1  03        .db $03
  $A7B2  01 55     ORA ($55,X)
  $A7B4  DB        .db $DB
  $A7B5  03        .db $03
  $A7B6  03        .db $03
  $A7B7  58        CLI
  $A7B8  DC        .db $DC
  $A7B9  03        .db $03
  $A7BA  DD 03 DE  CMP $DE03,X
  $A7BD  03        .db $03
  $A7BE  01 56     ORA ($56,X)
  $A7C0  DB        .db $DB
  $A7C1  43        .db $43
  $A7C2  03        .db $03
  $A7C3  59 DC 43  EOR $43DC,Y
  $A7C6  DE 43 DD  DEC $DD43,X
  $A7C9  43        .db $43
  $A7CA  06 5A     ASL $5A
  $A7CC  D0 03     BNE $A7D1

L_A7CE:
  $A7CE  D1 03     CMP ($03),Y
  $A7D0  D2        .db $D2

L_A7D1:
  $A7D1  03        .db $03
  $A7D2  D3        .db $D3
  $A7D3  03        .db $03
  $A7D4  DE 03 DE  DEC $DE03,X
  $A7D7  03        .db $03
  $A7D8  06 5A     ASL $5A
  $A7DA  D4        .db $D4
  $A7DB  03        .db $03
  $A7DC  D5 03     CMP $03,X
  $A7DE  D6 03     DEC $03,X
  $A7E0  D7        .db $D7
  $A7E1  03        .db $03
  $A7E2  DF        .db $DF
  $A7E3  03        .db $03
  $A7E4  DF        .db $DF
  $A7E5  03        .db $03
  $A7E6  06 5A     ASL $5A
  $A7E8  D4        .db $D4
  $A7E9  03        .db $03
  $A7EA  D5 03     CMP $03,X
  $A7EC  D6 03     DEC $03,X
  $A7EE  D8        CLD
  $A7EF  03        .db $03
  $A7F0  DF        .db $DF
  $A7F1  03        .db $03
  $A7F2  DF        .db $DF
  $A7F3  03        .db $03
  $A7F4  06 5A     ASL $5A
  $A7F6  D9 03 DA  CMP $DA03,Y
  $A7F9  03        .db $03
  $A7FA  DB        .db $DB
  $A7FB  03        .db $03
  $A7FC  DC        .db $DC
  $A7FD  03        .db $03
  $A7FE  DF        .db $DF
  $A7FF  03        .db $03
  $A800  DF        .db $DF
  $A801  03        .db $03
  $A802  06 5A     ASL $5A
  $A804  DD 03 D5  CMP $D503,X
  $A807  03        .db $03
  $A808  D6 03     DEC $03,X
  $A80A  D7        .db $D7
  $A80B  03        .db $03
  $A80C  DF        .db $DF
  $A80D  03        .db $03
  $A80E  DF        .db $DF
  $A80F  03        .db $03
  $A810  04        .db $04
  $A811  17        .db $17
  $A812  46 01     LSR $01
  $A814  47        .db $47
  $A815  01 47     ORA ($47,X)
  $A817  C1 47     CMP ($47,X)
  $A819  81 04     STA ($04,X)
  $A81B  17        .db $17
  $A81C  56 01     LSR $01,X
  $A81E  56 41     LSR $41,X
  $A820  56 81     LSR $81,X
  $A822  56 C1     LSR $C1,X
  $A824  01 00     ORA ($00,X)
  $A826  57        .db $57
  $A827  01 01     ORA ($01,X)
  $A829  00        BRK
  $A82A  48        PHA
  $A82B  01 04     ORA ($04,X)
  $A82D  17        .db $17
  $A82E  65 00     ADC $00
  $A830  66 00     ROR $00
  $A832  66 C0     ROR $C0
  $A834  66 80     ROR $80
  $A836  04        .db $04
  $A837  17        .db $17
  $A838  67        .db $67
  $A839  00        BRK
  $A83A  67        .db $67
  $A83B  40        RTI
  $A83C  67        .db $67
  $A83D  80        .db $80
  $A83E  67        .db $67
  $A83F  C0 01     CPY #$01
  $A841  00        BRK
  $A842  58        CLI
  $A843  00        BRK
  $A844  01 00     ORA ($00,X)
  $A846  68        PLA
  $A847  00        BRK
  $A848  04        .db $04
  $A849  17        .db $17
  $A84A  5A        .db $5A
  $A84B  00        BRK
  $A84C  5B        .db $5B
  $A84D  00        BRK
  $A84E  5A        .db $5A
  $A84F  80        .db $80
  $A850  5B        .db $5B
  $A851  80        .db $80
  $A852  04        .db $04
  $A853  17        .db $17
  $A854  4C 00 4C  JMP $4C00
  $A857  40        RTI
  $A858  4C 80 4C  JMP $4C80
  $A85B  C0 04     CPY #$04
  $A85D  17        .db $17
  $A85E  8D 00 8D  STA $8D00
  $A861  40        RTI
  $A862  8E 01 8E  STX $8E01
  $A865  41 01     EOR ($01,X)
  $A867  00        BRK
  $A868  E8        INX
  $A869  02        .db $02
  $A86A  01 00     ORA ($00,X)
  $A86C  E7        .db $E7
  $A86D  02        .db $02
  $A86E  01 00     ORA ($00,X)
  $A870  DF        .db $DF
  $A871  02        .db $02
  $A872  01 00     ORA ($00,X)
  $A874  FF        .db $FF
  $A875  02        .db $02
  $A876  01 00     ORA ($00,X)
  $A878  FE C2 01  INC $01C2,X
  $A87B  00        BRK
  $A87C  FF        .db $FF
  $A87D  42        .db $42
  $A87E  01 00     ORA ($00,X)
  $A880  FE 42 02  INC $0242,X
  $A883  54        .db $54
  $A884  F1 03     SBC ($03),Y
  $A886  F2        .db $F2
  $A887  03        .db $03
  $A888  02        .db $02
  $A889  54        .db $54
  $A88A  F3        .db $F3
  $A88B  03        .db $03
  $A88C  F4        .db $F4
  $A88D  03        .db $03
  $A88E  02        .db $02
  $A88F  54        .db $54
  $A890  F5 03     SBC $03,X
  $A892  F6 03     INC $03,X
  $A894  04        .db $04
  $A895  17        .db $17
  $A896  F7        .db $F7
  $A897  03        .db $03
  $A898  F8        SED
  $A899  03        .db $03

L_A89A:
  $A89A  F8        SED
  $A89B  C3        .db $C3
  $A89C  F8        SED
  $A89D  83        .db $83
  $A89E  04        .db $04
  $A89F  17        .db $17
  $A8A0  F9 03 FA  SBC $FA03,Y
  $A8A3  03        .db $03
  $A8A4  FA        .db $FA
  $A8A5  C3        .db $C3
  $A8A6  FA        .db $FA
  $A8A7  83        .db $83
  $A8A8  04        .db $04
  $A8A9  17        .db $17
  $A8AA  EA        NOP
  $A8AB  02        .db $02
  $A8AC  EB        .db $EB
  $A8AD  02        .db $02
  $A8AE  EB        .db $EB
  $A8AF  C2        .db $C2
  $A8B0  EA        NOP
  $A8B1  C2        .db $C2
  $A8B2  04        .db $04
  $A8B3  17        .db $17
  $A8B4  EC 02 ED  CPX $ED02
  $A8B7  02        .db $02
  $A8B8  ED C2 EC  SBC $ECC2
  $A8BB  C2        .db $C2
  $A8BC  04        .db $04
  $A8BD  17        .db $17
  $A8BE  E1 42     SBC ($42,X)
  $A8C0  E0 42     CPX #$42
  $A8C2  E3        .db $E3
  $A8C3  42        .db $42
  $A8C4  E2        .db $E2
  $A8C5  42        .db $42
  $A8C6  04        .db $04
  $A8C7  17        .db $17
  $A8C8  E5 42     SBC $42
  $A8CA  E4 42     CPX $42
  $A8CC  E7        .db $E7
  $A8CD  42        .db $42
  $A8CE  E6 42     INC $42
  $A8D0  04        .db $04
  $A8D1  17        .db $17
  $A8D2  E9 42     SBC #$42
  $A8D4  E8        INX
  $A8D5  42        .db $42
  $A8D6  EB        .db $EB
  $A8D7  42        .db $42
  $A8D8  EA        NOP
  $A8D9  42        .db $42
  $A8DA  04        .db $04
  $A8DB  17        .db $17
  $A8DC  F5 43     SBC $43,X
  $A8DE  F4        .db $F4
  $A8DF  43        .db $43

L_A8E0:
  $A8E0  F7        .db $F7
  $A8E1  43        .db $43
  $A8E2  F6 43     INC $43,X
  $A8E4  04        .db $04
  $A8E5  17        .db $17
  $A8E6  F8        SED
  $A8E7  43        .db $43
  $A8E8  8F        .db $8F
  $A8E9  03        .db $03
  $A8EA  FA        .db $FA
  $A8EB  43        .db $43
  $A8EC  F9 43 04  SBC $0443,Y
  $A8EF  17        .db $17
  $A8F0  FB        .db $FB
  $A8F1  43        .db $43
  $A8F2  8F        .db $8F
  $A8F3  03        .db $03
  $A8F4  FD 43 FC  SBC $FC43,X
  $A8F7  43        .db $43
  $A8F8  04        .db $04
  $A8F9  17        .db $17
  $A8FA  FB        .db $FB
  $A8FB  42        .db $42
  $A8FC  8F        .db $8F
  $A8FD  03        .db $03
  $A8FE  FD 42 FC  SBC $FC42,X

L_A901:
  $A901  42        .db $42
  $A902  10 96     BPL $A89A
  $A904  F5 02     SBC $02,X
  $A906  F6 02     INC $02,X
  $A908  F7        .db $F7
  $A909  02        .db $02
  $A90A  F8        SED
  $A90B  02        .db $02
  $A90C  F5 02     SBC $02,X
  $A90E  F6 02     INC $02,X
  $A910  F7        .db $F7
  $A911  02        .db $02
  $A912  F8        SED
  $A913  02        .db $02
  $A914  F5 02     SBC $02,X
  $A916  F6 02     INC $02,X
  $A918  F7        .db $F7
  $A919  02        .db $02
  $A91A  F8        SED
  $A91B  02        .db $02
  $A91C  F5 02     SBC $02,X
  $A91E  F6 02     INC $02,X
  $A920  F7        .db $F7
  $A921  02        .db $02
  $A922  F8        SED
  $A923  02        .db $02
  $A924  10 99     BPL $A8BF
  $A926  F5 02     SBC $02,X
  $A928  F6 02     INC $02,X
  $A92A  F7        .db $F7
  $A92B  02        .db $02
  $A92C  F8        SED
  $A92D  02        .db $02
  $A92E  F5 02     SBC $02,X
  $A930  F6 02     INC $02,X
  $A932  F7        .db $F7
  $A933  02        .db $02
  $A934  F8        SED
  $A935  02        .db $02
  $A936  F5 02     SBC $02,X
  $A938  F6 02     INC $02,X
  $A93A  F7        .db $F7
  $A93B  02        .db $02
  $A93C  F8        SED
  $A93D  02        .db $02
  $A93E  F5 02     SBC $02,X
  $A940  F6 02     INC $02,X
  $A942  F7        .db $F7
  $A943  02        .db $02
  $A944  F8        SED
  $A945  02        .db $02
  $A946  10 98     BPL $A8E0
  $A948  F5 02     SBC $02,X
  $A94A  F6 02     INC $02,X
  $A94C  F7        .db $F7
  $A94D  02        .db $02
  $A94E  F8        SED
  $A94F  02        .db $02
  $A950  F5 02     SBC $02,X
  $A952  F6 02     INC $02,X
  $A954  F7        .db $F7
  $A955  02        .db $02
  $A956  F8        SED
  $A957  02        .db $02
  $A958  F5 02     SBC $02,X
  $A95A  F6 02     INC $02,X
  $A95C  F7        .db $F7
  $A95D  02        .db $02
  $A95E  F8        SED
  $A95F  02        .db $02
  $A960  F5 02     SBC $02,X
  $A962  F6 02     INC $02,X
  $A964  F7        .db $F7
  $A965  02        .db $02
  $A966  F8        SED
  $A967  02        .db $02
  $A968  10 97     BPL $A901
  $A96A  F5 02     SBC $02,X
  $A96C  F6 02     INC $02,X
  $A96E  F7        .db $F7
  $A96F  02        .db $02
  $A970  F8        SED
  $A971  02        .db $02
  $A972  F5 02     SBC $02,X
  $A974  F6 02     INC $02,X
  $A976  F7        .db $F7
  $A977  02        .db $02
  $A978  F8        SED
  $A979  02        .db $02
  $A97A  F5 02     SBC $02,X
  $A97C  F6 02     INC $02,X
  $A97E  F7        .db $F7
  $A97F  02        .db $02
  $A980  F8        SED
  $A981  02        .db $02
  $A982  F5 02     SBC $02,X
  $A984  F6 02     INC $02,X
  $A986  F7        .db $F7
  $A987  02        .db $02
  $A988  F8        SED
  $A989  02        .db $02
  $A98A  04        .db $04
  $A98B  17        .db $17
  $A98C  F5 02     SBC $02,X
  $A98E  F6 02     INC $02,X
  $A990  F7        .db $F7
  $A991  02        .db $02
  $A992  F8        SED
  $A993  02        .db $02
  $A994  04        .db $04
  $A995  17        .db $17
  $A996  F9 02 FA  SBC $FA02,Y
  $A999  02        .db $02
  $A99A  FB        .db $FB
  $A99B  02        .db $02
  $A99C  FC        .db $FC
  $A99D  02        .db $02
  $A99E  02        .db $02
  $A99F  54        .db $54
  $A9A0  FD 02 FD  SBC $FD02,X
  $A9A3  42        .db $42
  $A9A4  04        .db $04
  $A9A5  17        .db $17
  $A9A6  FA        .db $FA
  $A9A7  42        .db $42
  $A9A8  F9 42 FC  SBC $FC42,Y
  $A9AB  42        .db $42
  $A9AC  FB        .db $FB
  $A9AD  42        .db $42
  $A9AE  04        .db $04
  $A9AF  17        .db $17
  $A9B0  F6 42     INC $42,X
  $A9B2  F5 42     SBC $42,X
  $A9B4  F8        SED
  $A9B5  42        .db $42
  $A9B6  F7        .db $F7
  $A9B7  42        .db $42
  $A9B8  04        .db $04
  $A9B9  17        .db $17
  $A9BA  E5 01     SBC $01
  $A9BC  E6 01     INC $01
  $A9BE  E7        .db $E7
  $A9BF  01 E8     ORA ($E8,X)
  $A9C1  01 0D     ORA ($0D,X)
  $A9C3  9A        TXS
  $A9C4  D0 03     BNE $A9C9
  $A9C6  D1 03     CMP ($03),Y
  $A9C8  D2        .db $D2

L_A9C9:
  $A9C9  03        .db $03
  $A9CA  D3        .db $D3
  $A9CB  03        .db $03
  $A9CC  D4        .db $D4
  $A9CD  03        .db $03
  $A9CE  D5 03     CMP $03,X
  $A9D0  D6 03     DEC $03,X
  $A9D2  D7        .db $D7
  $A9D3  03        .db $03
  $A9D4  D8        CLD
  $A9D5  03        .db $03
  $A9D6  D9 03 DA  CMP $DA03,Y
  $A9D9  03        .db $03
  $A9DA  DB        .db $DB
  $A9DB  03        .db $03
  $A9DC  CD 03 0A  CMP $0A03
  $A9DF  9B        .db $9B
  $A9E0  DC        .db $DC
  $A9E1  03        .db $03
  $A9E2  DD 03 DE  CMP $DE03,X
  $A9E5  03        .db $03
  $A9E6  DF        .db $DF
  $A9E7  03        .db $03
  $A9E8  E0 03     CPX #$03
  $A9EA  E1 03     SBC ($03,X)
  $A9EC  E2        .db $E2
  $A9ED  03        .db $03
  $A9EE  E3        .db $E3
  $A9EF  03        .db $03
  $A9F0  E4 03     CPX $03
  $A9F2  CD 03 0D  CMP $0D03
  $A9F5  9C        .db $9C
  $A9F6  A0 03     LDY #$03
  $A9F8  A1 03     LDA ($03,X)
  $A9FA  A2 03     LDX #$03
  $A9FC  A3        .db $A3
  $A9FD  03        .db $03
  $A9FE  8F        .db $8F
  $A9FF  03        .db $03
  $AA00  A4 03     LDY $03
  $AA02  A5 03     LDA $03
  $AA04  A6 03     LDX $03
  $AA06  A7        .db $A7
  $AA07  03        .db $03
  $AA08  A8        TAY
  $AA09  03        .db $03
  $AA0A  A9 03     LDA #$03
  $AA0C  AA        TAX
  $AA0D  03        .db $03
  $AA0E  AB        .db $AB
  $AA0F  03        .db $03
  $AA10  0C        .db $0C
  $AA11  9D AC 03  STA $03AC,X
  $AA14  AD 03 AE  LDA $AE03
  $AA17  03        .db $03
  $AA18  AF        .db $AF
  $AA19  03        .db $03
  $AA1A  B0 03     BCS $AA1F
  $AA1C  B1 03     LDA ($03),Y
  $AA1E  B2        .db $B2

L_AA1F:
  $AA1F  03        .db $03
  $AA20  B3        .db $B3
  $AA21  03        .db $03
  $AA22  B4 03     LDY $03,X
  $AA24  B5 03     LDA $03,X
  $AA26  B6 03     LDX $03,Y
  $AA28  B7        .db $B7
  $AA29  03        .db $03
  $AA2A  B8        CLV
  $AA2B  03        .db $03
  $AA2C  06 62     ASL $62
  $AA2E  C9 42     CMP #$42
  $AA30  C8        INY
  $AA31  42        .db $42
  $AA32  C7        .db $C7
  $AA33  42        .db $42
  $AA34  C9 C2     CMP #$C2
  $AA36  C8        INY
  $AA37  C2        .db $C2
  $AA38  C7        .db $C7
  $AA39  C2        .db $C2
  $AA3A  06 62     ASL $62
  $AA3C  CC 42 CB  CPY $CB42
  $AA3F  42        .db $42
  $AA40  CA        DEX
  $AA41  42        .db $42
  $AA42  CC C2 CB  CPY $CBC2
  $AA45  C2        .db $C2
  $AA46  CA        DEX
  $AA47  C2        .db $C2
  $AA48  0E 17 E0  ASL $E017
  $AA4B  03        .db $03
  $AA4C  E1 03     SBC ($03,X)
  $AA4E  E3        .db $E3
  $AA4F  03        .db $03
  $AA50  E4 03     CPX $03
  $AA52  BC 03 BD  LDY $BD03,X
  $AA55  03        .db $03
  $AA56  BE 03 BF  LDX $BF03,Y
  $AA59  03        .db $03
  $AA5A  8F        .db $8F
  $AA5B  03        .db $03
  $AA5C  E2        .db $E2
  $AA5D  03        .db $03
  $AA5E  8F        .db $8F
  $AA5F  03        .db $03
  $AA60  E5 03     SBC $03
  $AA62  E6 03     INC $03
  $AA64  E7        .db $E7
  $AA65  03        .db $03
  $AA66  02        .db $02
  $AA67  41 A9     EOR ($A9,X)
  $AA69  02        .db $02
  $AA6A  A9 82     LDA #$82
  $AA6C  02        .db $02
  $AA6D  41 AC     EOR ($AC,X)
  $AA6F  02        .db $02
  $AA70  AC 82 01  LDY $0182
  $AA73  00        BRK
  $AA74  AD 02 01  LDA $0102
  $AA77  00        BRK
  $AA78  FE 01 01  INC $0101,X
  $AA7B  00        BRK
  $AA7C  FD 01 02  SBC $0201,X
  $AA7F  A1 A9     LDA ($A9,X)
  $AA81  02        .db $02
  $AA82  AA        TAX
  $AA83  02        .db $02
  $AA84  02        .db $02
  $AA85  A1 AA     LDA ($AA,X)
  $AA87  42        .db $42
  $AA88  A9 42     LDA #$42
  $AA8A  02        .db $02
  $AA8B  A1 AB     LDA ($AB,X)
  $AA8D  02        .db $02
  $AA8E  AB        .db $AB
  $AA8F  42        .db $42
  $AA90  02        .db $02
  $AA91  A1 AC     LDA ($AC,X)
  $AA93  02        .db $02
  $AA94  AD 02 AE  LDA $AE02
  $AA97  02        .db $02
  $AA98  AF        .db $AF
  $AA99  02        .db $02
  $AA9A  02        .db $02
  $AA9B  A1 B7     LDA ($B7,X)
  $AA9D  02        .db $02
  $AA9E  B8        CLV
  $AA9F  02        .db $02
  $AAA0  B9 02 BA  LDA $BA02,Y
  $AAA3  02        .db $02
  $AAA4  02        .db $02
  $AAA5  A1 BD     LDA ($BD,X)
  $AAA7  02        .db $02
  $AAA8  BD 42 02  LDA $0242,X
  $AAAB  A1 BE     LDA ($BE,X)
  $AAAD  02        .db $02
  $AAAE  BF        .db $BF
  $AAAF  02        .db $02
  $AAB0  02        .db $02
  $AAB1  2D BB 02  AND $02BB
  $AAB4  BC 02 FC  LDY $FC02,X
  $AAB7  FC        .db $FC
  $AAB8  04        .db $04
  $AAB9  F4        .db $F4
  $AABA  04        .db $04
  $AABB  FC        .db $FC
  $AABC  04        .db $04
  $AABD  04        .db $04
  $AABE  F4        .db $F4
  $AABF  F4        .db $F4
  $AAC0  F4        .db $F4
  $AAC1  FC        .db $FC
  $AAC2  F4        .db $F4
  $AAC3  04        .db $04
  $AAC4  FC        .db $FC
  $AAC5  F4        .db $F4
  $AAC6  FC        .db $FC
  $AAC7  04        .db $04
  $AAC8  FA        .db $FA
  $AAC9  FB        .db $FB
  $AACA  EC 04 04  CPX $0404
  $AACD  EC F4 FC  CPX $FCF4
  $AAD0  F4        .db $F4
  $AAD1  07        .db $07
  $AAD2  F4        .db $F4
  $AAD3  F8        SED
  $AAD4  F4        .db $F4
  $AAD5  00        BRK
  $AAD6  FC        .db $FC
  $AAD7  F8        SED
  $AAD8  FC        .db $FC
  $AAD9  00        BRK
  $AADA  04        .db $04

L_AADB:
  $AADB  F8        SED
  $AADC  04        .db $04
  $AADD  00        BRK
  $AADE  04        .db $04
  $AADF  08        PHP
  $AAE0  FC        .db $FC
  $AAE1  FB        .db $FB
  $AAE2  FC        .db $FC
  $AAE3  08        PHP
  $AAE4  FC        .db $FC
  $AAE5  F0 F4     BEQ $AADB
  $AAE7  F8        SED
  $AAE8  F4        .db $F4
  $AAE9  00        BRK
  $AAEA  FC        .db $FC
  $AAEB  F8        SED
  $AAEC  FC        .db $FC

L_AAED:
  $AAED  00        BRK
  $AAEE  04        .db $04
  $AAEF  F8        SED
  $AAF0  04        .db $04
  $AAF1  00        BRK
  $AAF2  FC        .db $FC
  $AAF3  08        PHP
  $AAF4  FA        .db $FA
  $AAF5  FB        .db $FB
  $AAF6  FA        .db $FA
  $AAF7  F0 F4     BEQ $AAED
  $AAF9  F8        SED
  $AAFA  F4        .db $F4

L_AAFB:
  $AAFB  00        BRK
  $AAFC  FC        .db $FC
  $AAFD  F0 FC     BEQ $AAFB
  $AAFF  F8        SED
  $AB00  FC        .db $FC
  $AB01  00        BRK
  $AB02  FB        .db $FB
  $AB03  08        PHP
  $AB04  04        .db $04
  $AB05  F0 04     BEQ $AB0B
  $AB07  F8        SED
  $AB08  04        .db $04
  $AB09  00        BRK
  $AB0A  FA        .db $FA

L_AB0B:
  $AB0B  FB        .db $FB
  $AB0C  F4        .db $F4
  $AB0D  F8        SED
  $AB0E  F4        .db $F4
  $AB0F  00        BRK
  $AB10  FC        .db $FC
  $AB11  F8        SED
  $AB12  FC        .db $FC
  $AB13  00        BRK
  $AB14  04        .db $04
  $AB15  F0 04     BEQ $AB1B
  $AB17  F8        SED
  $AB18  04        .db $04
  $AB19  00        BRK
  $AB1A  0C        .db $0C

L_AB1B:
  $AB1B  FF        .db $FF
  $AB1C  F5 08     SBC $08,X
  $AB1E  FA        .db $FA
  $AB1F  FB        .db $FB
  $AB20  F5 F0     SBC $F0,X
  $AB22  F4        .db $F4
  $AB23  F8        SED
  $AB24  F4        .db $F4

L_AB25:
  $AB25  00        BRK
  $AB26  FB        .db $FB
  $AB27  F0 FC     BEQ $AB25
  $AB29  F8        SED
  $AB2A  FC        .db $FC
  $AB2B  00        BRK
  $AB2C  FB        .db $FB
  $AB2D  08        PHP
  $AB2E  04        .db $04
  $AB2F  F0 04     BEQ $AB35
  $AB31  F8        SED
  $AB32  04        .db $04
  $AB33  00        BRK
  $AB34  0C        .db $0C

L_AB35:
  $AB35  FE FA FB  INC $FBFA,X
  $AB38  F4        .db $F4
  $AB39  F8        SED
  $AB3A  F4        .db $F4
  $AB3B  00        BRK
  $AB3C  FC        .db $FC
  $AB3D  F8        SED
  $AB3E  FC        .db $FC
  $AB3F  00        BRK
  $AB40  04        .db $04
  $AB41  F8        SED
  $AB42  04        .db $04

L_AB43:
  $AB43  00        BRK
  $AB44  0C        .db $0C

L_AB45:
  $AB45  FF        .db $FF
  $AB46  F5 08     SBC $08,X
  $AB48  04        .db $04
  $AB49  F0 FA     BEQ $AB45
  $AB4B  FB        .db $FB
  $AB4C  FA        .db $FA
  $AB4D  F0 F4     BEQ $AB43
  $AB4F  F4        .db $F4
  $AB50  F4        .db $F4
  $AB51  FC        .db $FC
  $AB52  FC        .db $FC
  $AB53  F4        .db $F4
  $AB54  FC        .db $FC
  $AB55  FC        .db $FC
  $AB56  04        .db $04
  $AB57  F4        .db $F4
  $AB58  04        .db $04
  $AB59  FC        .db $FC
  $AB5A  FB        .db $FB
  $AB5B  EC FB 04  CPX $04FB
  $AB5E  04        .db $04
  $AB5F  04        .db $04
  $AB60  FA        .db $FA
  $AB61  F7        .db $F7
  $AB62  F4        .db $F4
  $AB63  F8        SED
  $AB64  F4        .db $F4
  $AB65  00        BRK
  $AB66  FC        .db $FC
  $AB67  F8        SED
  $AB68  FC        .db $FC
  $AB69  00        BRK
  $AB6A  04        .db $04
  $AB6B  F8        SED
  $AB6C  04        .db $04
  $AB6D  00        BRK
  $AB6E  04        .db $04

L_AB6F:
  $AB6F  08        PHP
  $AB70  FC        .db $FC
  $AB71  F0 FC     BEQ $AB6F
  $AB73  FB        .db $FB
  $AB74  EC FC F4  CPX $F4FC
  $AB77  FC        .db $FC
  $AB78  FC        .db $FC
  $AB79  FC        .db $FC
  $AB7A  04        .db $04
  $AB7B  FC        .db $FC
  $AB7C  F4        .db $F4
  $AB7D  F4        .db $F4
  $AB7E  FC        .db $FC
  $AB7F  F4        .db $F4
  $AB80  04        .db $04
  $AB81  F4        .db $F4
  $AB82  F4        .db $F4
  $AB83  04        .db $04
  $AB84  FC        .db $FC
  $AB85  04        .db $04
  $AB86  04        .db $04
  $AB87  04        .db $04
  $AB88  F4        .db $F4
  $AB89  F8        SED
  $AB8A  F4        .db $F4
  $AB8B  00        BRK
  $AB8C  FC        .db $FC
  $AB8D  F8        SED
  $AB8E  FC        .db $FC
  $AB8F  00        BRK
  $AB90  04        .db $04
  $AB91  00        BRK
  $AB92  04        .db $04
  $AB93  F8        SED
  $AB94  0C        .db $0C
  $AB95  00        BRK
  $AB96  F4        .db $F4
  $AB97  F8        SED
  $AB98  F4        .db $F4
  $AB99  00        BRK
  $AB9A  FC        .db $FC
  $AB9B  F8        SED
  $AB9C  FC        .db $FC

L_AB9D:
  $AB9D  00        BRK
  $AB9E  04        .db $04
  $AB9F  F8        SED
  $ABA0  04        .db $04
  $ABA1  00        BRK
  $ABA2  0C        .db $0C
  $ABA3  F8        SED
  $ABA4  FA        .db $FA
  $ABA5  FB        .db $FB
  $ABA6  FC        .db $FC
  $ABA7  F0 F4     BEQ $AB9D
  $ABA9  F4        .db $F4
  $ABAA  F4        .db $F4
  $ABAB  FC        .db $FC
  $ABAC  FC        .db $FC
  $ABAD  EC FC F4  CPX $F4FC
  $ABB0  FC        .db $FC
  $ABB1  FC        .db $FC
  $ABB2  04        .db $04
  $ABB3  EC 04 F4  CPX $F404
  $ABB6  04        .db $04
  $ABB7  FC        .db $FC
  $ABB8  04        .db $04
  $ABB9  04        .db $04
  $ABBA  FB        .db $FB
  $ABBB  04        .db $04
  $ABBC  FA        .db $FA
  $ABBD  F7        .db $F7
  $ABBE  EC F0 E8  CPX $E8F0
  $ABC1  FC        .db $FC
  $ABC2  EC 08 EC  CPX $EC08
  $ABC5  EC EC F4  CPX $F4EC
  $ABC8  F4        .db $F4
  $ABC9  EC F4 F4  CPX $F4F4
  $ABCC  F4        .db $F4
  $ABCD  FC        .db $FC
  $ABCE  F4        .db $F4
  $ABCF  04        .db $04
  $ABD0  FC        .db $FC
  $ABD1  EC FC F4  CPX $F4FC
  $ABD4  FC        .db $FC
  $ABD5  FC        .db $FC
  $ABD6  FC        .db $FC

L_ABD7:
  $ABD7  04        .db $04
  $ABD8  04        .db $04
  $ABD9  F4        .db $F4
  $ABDA  04        .db $04
  $ABDB  FC        .db $FC
  $ABDC  04        .db $04
  $ABDD  04        .db $04
  $ABDE  0C        .db $0C
  $ABDF  EC 0C F4  CPX $F40C
  $ABE2  0C        .db $0C
  $ABE3  FC        .db $FC
  $ABE4  0C        .db $0C
  $ABE5  04        .db $04
  $ABE6  0C        .db $0C
  $ABE7  0C        .db $0C
  $ABE8  F7        .db $F7
  $ABE9  F0 EC     BEQ $ABD7
  $ABEB  EC EC F4  CPX $F4EC
  $ABEE  EC FC EC  CPX $ECFC
  $ABF1  04        .db $04
  $ABF2  F4        .db $F4
  $ABF3  EC F4 F4  CPX $F4F4
  $ABF6  F4        .db $F4
  $ABF7  FC        .db $FC
  $ABF8  F4        .db $F4
  $ABF9  04        .db $04
  $ABFA  FC        .db $FC
  $ABFB  F4        .db $F4
  $ABFC  FC        .db $FC
  $ABFD  FC        .db $FC
  $ABFE  FC        .db $FC
  $ABFF  04        .db $04
  $AC00  04        .db $04
  $AC01  F4        .db $F4
  $AC02  04        .db $04
  $AC03  FC        .db $FC
  $AC04  04        .db $04
  $AC05  04        .db $04
  $AC06  0C        .db $0C
  $AC07  F4        .db $F4
  $AC08  0C        .db $0C
  $AC09  FC        .db $FC
  $AC0A  0C        .db $0C
  $AC0B  04        .db $04
  $AC0C  F4        .db $F4
  $AC0D  F3        .db $F3
  $AC0E  EC F4 EC  CPX $ECF4
  $AC11  FC        .db $FC
  $AC12  F4        .db $F4
  $AC13  F4        .db $F4
  $AC14  F4        .db $F4
  $AC15  FC        .db $FC
  $AC16  F4        .db $F4
  $AC17  04        .db $04
  $AC18  FC        .db $FC
  $AC19  EC FC F4  CPX $F4FC
  $AC1C  FC        .db $FC
  $AC1D  FC        .db $FC
  $AC1E  FC        .db $FC
  $AC1F  04        .db $04
  $AC20  04        .db $04
  $AC21  F4        .db $F4
  $AC22  04        .db $04
  $AC23  FC        .db $FC
  $AC24  04        .db $04
  $AC25  04        .db $04
  $AC26  04        .db $04
  $AC27  0C        .db $0C
  $AC28  0C        .db $0C
  $AC29  F4        .db $F4
  $AC2A  0C        .db $0C
  $AC2B  04        .db $04
  $AC2C  0C        .db $0C
  $AC2D  0C        .db $0C
  $AC2E  F7        .db $F7
  $AC2F  F5 0A     SBC $0A,X
  $AC31  EC EC F4  CPX $F4EC
  $AC34  EC FC EC  CPX $ECFC
  $AC37  04        .db $04
  $AC38  F4        .db $F4
  $AC39  F9 F4 01  SBC $01F4,Y
  $AC3C  F4        .db $F4
  $AC3D  09 FC     ORA #$FC
  $AC3F  F9 FC 01  SBC $01FC,Y
  $AC42  FC        .db $FC
  $AC43  09 04     ORA #$04
  $AC45  F4        .db $F4
  $AC46  04        .db $04
  $AC47  FC        .db $FC
  $AC48  0C        .db $0C
  $AC49  F4        .db $F4
  $AC4A  0C        .db $0C
  $AC4B  FC        .db $FC
  $AC4C  0C        .db $0C
  $AC4D  04        .db $04
  $AC4E  F4        .db $F4
  $AC4F  FA        .db $FA
  $AC50  02        .db $02
  $AC51  04        .db $04
  $AC52  EC F4 EC  CPX $ECF4
  $AC55  FC        .db $FC
  $AC56  EC 04 F4  CPX $F404
  $AC59  F9 F4 01  SBC $01F4,Y
  $AC5C  F4        .db $F4
  $AC5D  09 F4     ORA #$F4
  $AC5F  11 FC     ORA ($FC),Y
  $AC61  F9 FC 01  SBC $01FC,Y
  $AC64  FC        .db $FC
  $AC65  09 04     ORA #$04
  $AC67  F4        .db $F4
  $AC68  04        .db $04
  $AC69  FC        .db $FC
  $AC6A  0C        .db $0C
  $AC6B  F4        .db $F4
  $AC6C  0C        .db $0C
  $AC6D  FC        .db $FC
  $AC6E  0C        .db $0C
  $AC6F  04        .db $04
  $AC70  F4        .db $F4
  $AC71  FA        .db $FA
  $AC72  F4        .db $F4
  $AC73  09 FC     ORA #$FC
  $AC75  04        .db $04
  $AC76  F0 FC     BEQ $AC74
  $AC78  F8        SED
  $AC79  F8        SED
  $AC7A  F8        SED
  $AC7B  00        BRK
  $AC7C  F8        SED
  $AC7D  08        PHP
  $AC7E  00        BRK
  $AC7F  F8        SED
  $AC80  00        BRK
  $AC81  00        BRK
  $AC82  00        BRK
  $AC83  08        PHP
  $AC84  07        .db $07
  $AC85  F0 08     BEQ $AC8F
  $AC87  F8        SED
  $AC88  08        PHP
  $AC89  00        BRK
  $AC8A  FD FC F0  SBC $F0FC,X
  $AC8D  00        BRK
  $AC8E  F8        SED

L_AC8F:
  $AC8F  F8        SED
  $AC90  F8        SED
  $AC91  00        BRK
  $AC92  F8        SED
  $AC93  08        PHP
  $AC94  00        BRK
  $AC95  F0 00     BEQ $AC97

L_AC97:
  $AC97  F8        SED
  $AC98  00        BRK
  $AC99  00        BRK
  $AC9A  08        PHP
  $AC9B  F8        SED

L_AC9C:
  $AC9C  08        PHP
  $AC9D  00        BRK
  $AC9E  06 08     ASL $08
  $ACA0  FD FA F8  SBC $F8FA,X
  $ACA3  F8        SED
  $ACA4  F8        SED
  $ACA5  00        BRK

L_ACA6:
  $ACA6  00        BRK
  $ACA7  F8        SED
  $ACA8  00        BRK
  $ACA9  00        BRK
  $ACAA  F0 F0     BEQ $AC9C

L_ACAC:
  $ACAC  F0 F8     BEQ $ACA6
  $ACAE  F0 00     BEQ $ACB0

L_ACB0:
  $ACB0  F8        SED
  $ACB1  F0 F8     BEQ $ACAB
  $ACB3  08        PHP
  $ACB4  00        BRK
  $ACB5  F0 00     BEQ $ACB7

L_ACB7:
  $ACB7  08        PHP
  $ACB8  08        PHP
  $ACB9  F0 08     BEQ $ACC3
  $ACBB  F8        SED
  $ACBC  08        PHP
  $ACBD  00        BRK
  $ACBE  08        PHP
  $ACBF  08        PHP
  $ACC0  F0 08     BEQ $ACCA

L_ACC2:
  $ACC2  F0 E8     BEQ $ACAC
  $ACC4  F8        SED
  $ACC5  E8        INX
  $ACC6  08        PHP
  $ACC7  E8        INX
  $ACC8  F7        .db $F7
  $ACC9  F0 F7     BEQ $ACC2
  $ACCB  F8        SED
  $ACCC  EF        .db $EF
  $ACCD  F6 F8     INC $F8,X
  $ACCF  F8        SED
  $ACD0  00        BRK
  $ACD1  F8        SED
  $ACD2  F8        SED
  $ACD3  00        BRK
  $ACD4  00        BRK
  $ACD5  00        BRK
  $ACD6  FE F6 E5  INC $E5F6,X
  $ACD9  F8        SED
  $ACDA  E5 00     SBC $00
  $ACDC  ED F7 ED  SBC $EDF7
  $ACDF  FF        .db $FF
  $ACE0  F5 F0     SBC $F0,X
  $ACE2  F5 F8     SBC $F8,X
  $ACE4  F5 00     SBC $00,X
  $ACE6  FD F1 FD  SBC $FDF1,X
  $ACE9  F9 FD 01  SBC $01FD,Y
  $ACEC  05 E8     ORA $E8
  $ACEE  05 F0     ORA $F0
  $ACF0  05 F8     ORA $F8
  $ACF2  05 00     ORA $00
  $ACF4  0D E8 0D  ORA $0DE8
  $ACF7  F0 0D     BEQ $AD06

L_ACF9:
  $ACF9  F8        SED
  $ACFA  0D 00 15  ORA $1500
  $ACFD  F0 FA     BEQ $ACF9
  $ACFF  F7        .db $F7
  $AD00  E8        INX
  $AD01  F8        SED
  $AD02  E8        INX
  $AD03  00        BRK
  $AD04  F0 F8     BEQ $ACFE

L_AD06:
  $AD06  F0 00     BEQ $AD08

L_AD08:
  $AD08  F8        SED
  $AD09  F8        SED
  $AD0A  F8        SED
  $AD0B  00        BRK
  $AD0C  F8        SED
  $AD0D  08        PHP

L_AD0E:
  $AD0E  00        BRK
  $AD0F  F9 00 01  SBC $0100,Y
  $AD12  00        BRK
  $AD13  09 08     ORA #$08
  $AD15  F0 08     BEQ $AD1F
  $AD17  F8        SED

L_AD18:
  $AD18  08        PHP
  $AD19  00        BRK
  $AD1A  08        PHP
  $AD1B  08        PHP
  $AD1C  10 F0     BPL $AD0E
  $AD1E  10 F8     BPL $AD18
  $AD20  10 00     BPL $AD22

L_AD22:
  $AD22  10 08     BPL $AD2C
  $AD24  18        CLC
  $AD25  F8        SED
  $AD26  FD FF E5  SBC $E5FF,X
  $AD29  F8        SED
  $AD2A  E5 00     SBC $00

L_AD2C:
  $AD2C  ED F8 ED  SBC $EDF8
  $AD2F  00        BRK
  $AD30  F5 00     SBC $00,X
  $AD32  F5 08     SBC $08,X
  $AD34  F5 10     SBC $10,X
  $AD36  FD 01 FD  SBC $FD01,X
  $AD39  09 FD     ORA #$FD
  $AD3B  11 05     ORA ($05),Y
  $AD3D  F8        SED
  $AD3E  05 00     ORA $00
  $AD40  05 08     ORA $08
  $AD42  05 10     ORA $10
  $AD44  0D F8 0D  ORA $0DF8
  $AD47  00        BRK
  $AD48  0D 08 0D  ORA $0D08
  $AD4B  10 15     BPL $AD62
  $AD4D  00        BRK
  $AD4E  FA        .db $FA

L_AD4F:
  $AD4F  07        .db $07
  $AD50  F0 00     BEQ $AD52

L_AD52:
  $AD52  F0 08     BEQ $AD5C
  $AD54  F8        SED
  $AD55  F0 F8     BEQ $AD4F
  $AD57  F8        SED
  $AD58  F8        SED
  $AD59  00        BRK
  $AD5A  F8        SED
  $AD5B  08        PHP

L_AD5C:
  $AD5C  00        BRK
  $AD5D  F0 00     BEQ $AD5F

L_AD5F:
  $AD5F  F8        SED
  $AD60  00        BRK
  $AD61  00        BRK

L_AD62:
  $AD62  00        BRK
  $AD63  08        PHP
  $AD64  E8        INX
  $AD65  00        BRK
  $AD66  E8        INX
  $AD67  08        PHP
  $AD68  F0 F8     BEQ $AD62
  $AD6A  08        PHP
  $AD6B  F1 08     SBC ($08),Y
  $AD6D  F9 08 01  SBC $0108,Y
  $AD70  08        PHP

L_AD71:
  $AD71  09 F7     ORA #$F7
  $AD73  F8        SED
  $AD74  F9 E8 10  SBC $10E8,Y
  $AD77  FD F4 E8  SBC $E8F4,X
  $AD7A  F4        .db $F4
  $AD7B  F0 F4     BEQ $AD71
  $AD7D  F8        SED
  $AD7E  F4        .db $F4
  $AD7F  00        BRK
  $AD80  FC        .db $FC

L_AD81:
  $AD81  E8        INX
  $AD82  FC        .db $FC
  $AD83  F0 FC     BEQ $AD81
  $AD85  F8        SED
  $AD86  FC        .db $FC
  $AD87  00        BRK
  $AD88  FC        .db $FC
  $AD89  08        PHP
  $AD8A  04        .db $04
  $AD8B  F0 04     BEQ $AD91

L_AD8D:
  $AD8D  F8        SED
  $AD8E  04        .db $04
  $AD8F  00        BRK
  $AD90  04        .db $04

L_AD91:
  $AD91  08        PHP
  $AD92  FB        .db $FB
  $AD93  F9 F4 E8  SBC $E8F4,Y
  $AD96  F4        .db $F4
  $AD97  F0 F4     BEQ $AD8D
  $AD99  F8        SED
  $AD9A  F4        .db $F4
  $AD9B  00        BRK
  $AD9C  FC        .db $FC

L_AD9D:
  $AD9D  E8        INX
  $AD9E  FC        .db $FC
  $AD9F  F0 FC     BEQ $AD9D
  $ADA1  F8        SED
  $ADA2  FC        .db $FC
  $ADA3  00        BRK
  $ADA4  04        .db $04
  $ADA5  F0 04     BEQ $ADAB

L_ADA7:
  $ADA7  F8        SED
  $ADA8  04        .db $04
  $ADA9  00        BRK
  $ADAA  FE 08 06  INC $0608,X
  $ADAD  08        PHP
  $ADAE  FD F9 F4  SBC $F4F9,X
  $ADB1  F0 F4     BEQ $ADA7
  $ADB3  F8        SED
  $ADB4  F4        .db $F4

L_ADB5:
  $ADB5  00        BRK
  $ADB6  FC        .db $FC
  $ADB7  F0 FC     BEQ $ADB5
  $ADB9  F8        SED
  $ADBA  FC        .db $FC
  $ADBB  00        BRK
  $ADBC  04        .db $04
  $ADBD  F0 04     BEQ $ADC3
  $ADBF  F8        SED
  $ADC0  04        .db $04
  $ADC1  00        BRK
  $ADC2  FE 08 06  INC $0608,X
  $ADC5  08        PHP
  $ADC6  09 E8     ORA #$E8

L_ADC8:
  $ADC8  0C        .db $0C
  $ADC9  F0 FD     BEQ $ADC8
  $ADCB  F9 F0 F0  SBC $F0F0,Y
  $ADCE  F0 F8     BEQ $ADC8
  $ADD0  F0 00     BEQ $ADD2

L_ADD2:
  $ADD2  F0 08     BEQ $ADDC
  $ADD4  F8        SED
  $ADD5  E8        INX
  $ADD6  F8        SED
  $ADD7  F0 F8     BEQ $ADD1
  $ADD9  F8        SED
  $ADDA  F8        SED
  $ADDB  00        BRK

L_ADDC:
  $ADDC  F8        SED
  $ADDD  08        PHP
  $ADDE  00        BRK
  $ADDF  E8        INX
  $ADE0  00        BRK
  $ADE1  F0 00     BEQ $ADE3

L_ADE3:
  $ADE3  F8        SED
  $ADE4  00        BRK
  $ADE5  00        BRK
  $ADE6  00        BRK
  $ADE7  08        PHP
  $ADE8  08        PHP
  $ADE9  E8        INX

L_ADEA:
  $ADEA  08        PHP
  $ADEB  F0 08     BEQ $ADF5
  $ADED  F8        SED
  $ADEE  08        PHP

L_ADEF:
  $ADEF  00        BRK
  $ADF0  08        PHP
  $ADF1  08        PHP

L_ADF2:
  $ADF2  F0 F6     BEQ $ADEA
  $ADF4  F8        SED

L_ADF5:
  $ADF5  F0 F8     BEQ $ADEF
  $ADF7  F8        SED
  $ADF8  F0 F8     BEQ $ADF2
  $ADFA  F0 00     BEQ $ADFC

L_ADFC:
  $ADFC  F8        SED
  $ADFD  F8        SED
  $ADFE  F8        SED
  $ADFF  00        BRK
  $AE00  00        BRK

L_AE01:
  $AE01  F8        SED
  $AE02  00        BRK
  $AE03  00        BRK
  $AE04  F8        SED
  $AE05  F0 00     BEQ $AE07

L_AE07:
  $AE07  F0 F8     BEQ $AE01
  $AE09  08        PHP
  $AE0A  00        BRK
  $AE0B  08        PHP
  $AE0C  F8        SED
  $AE0D  FC        .db $FC
  $AE0E  F8        SED
  $AE0F  F8        SED
  $AE10  00        BRK

L_AE11:
  $AE11  F8        SED
  $AE12  00        BRK
  $AE13  00        BRK
  $AE14  F8        SED
  $AE15  00        BRK

L_AE16:
  $AE16  F8        SED
  $AE17  F0 F8     BEQ $AE11
  $AE19  08        PHP
  $AE1A  00        BRK
  $AE1B  F0 00     BEQ $AE1D

L_AE1D:
  $AE1D  08        PHP
  $AE1E  08        PHP
  $AE1F  F8        SED

L_AE20:
  $AE20  08        PHP
  $AE21  00        BRK
  $AE22  00        BRK
  $AE23  FC        .db $FC
  $AE24  F0 F0     BEQ $AE16
  $AE26  F0 F8     BEQ $AE20
  $AE28  F0 00     BEQ $AE2A

L_AE2A:
  $AE2A  F2        .db $F2
  $AE2B  08        PHP
  $AE2C  F8        SED
  $AE2D  F0 F8     BEQ $AE27
  $AE2F  F8        SED
  $AE30  F8        SED

L_AE31:
  $AE31  00        BRK
  $AE32  00        BRK
  $AE33  F6 00     INC $00,X
  $AE35  FE EC F4  INC $F4EC,X
  $AE38  EC FC F4  CPX $F4FC
  $AE3B  F0 F4     BEQ $AE31
  $AE3D  F8        SED
  $AE3E  F4        .db $F4
  $AE3F  00        BRK
  $AE40  FC        .db $FC
  $AE41  F6 FC     INC $FC,X
  $AE43  FE 04 F8  INC $F804,X
  $AE46  EC F4 EC  CPX $ECF4
  $AE49  FC        .db $FC
  $AE4A  F4        .db $F4
  $AE4B  F4        .db $F4
  $AE4C  F4        .db $F4
  $AE4D  FC        .db $FC
  $AE4E  F4        .db $F4
  $AE4F  04        .db $04
  $AE50  FC        .db $FC
  $AE51  F4        .db $F4
  $AE52  FC        .db $FC
  $AE53  FC        .db $FC

L_AE54:
  $AE54  FC        .db $FC
  $AE55  04        .db $04
  $AE56  04        .db $04
  $AE57  F6 04     INC $04,X
  $AE59  FE 0C F6  INC $F60C,X
  $AE5C  0C        .db $0C
  $AE5D  FE E8 F0  INC $F0E8,X
  $AE60  E8        INX

L_AE61:
  $AE61  F8        SED
  $AE62  F0 F0     BEQ $AE54
  $AE64  F0 F8     BEQ $AE5E
  $AE66  F8        SED
  $AE67  F0 F8     BEQ $AE61
  $AE69  F8        SED
  $AE6A  00        BRK

L_AE6B:
  $AE6B  F0 00     BEQ $AE6D

L_AE6D:
  $AE6D  F8        SED
  $AE6E  08        PHP
  $AE6F  F0 08     BEQ $AE79
  $AE71  F8        SED
  $AE72  F8        SED
  $AE73  00        BRK
  $AE74  00        BRK
  $AE75  00        BRK

L_AE76:
  $AE76  08        PHP
  $AE77  00        BRK
  $AE78  F8        SED

L_AE79:
  $AE79  08        PHP
  $AE7A  00        BRK
  $AE7B  08        PHP
  $AE7C  08        PHP
  $AE7D  08        PHP
  $AE7E  F7        .db $F7
  $AE7F  F1 E8     SBC ($E8),Y
  $AE81  F0 E8     BEQ $AE6B

L_AE83:
  $AE83  F8        SED
  $AE84  F0 F0     BEQ $AE76
  $AE86  F0 F8     BEQ $AE80
  $AE88  F8        SED
  $AE89  F0 F8     BEQ $AE83
  $AE8B  F8        SED
  $AE8C  F8        SED
  $AE8D  00        BRK
  $AE8E  F8        SED
  $AE8F  00        BRK
  $AE90  00        BRK
  $AE91  F0 00     BEQ $AE93

L_AE93:
  $AE93  F8        SED
  $AE94  00        BRK

L_AE95:
  $AE95  00        BRK
  $AE96  00        BRK
  $AE97  08        PHP
  $AE98  08        PHP
  $AE99  F0 08     BEQ $AEA3
  $AE9B  F8        SED
  $AE9C  08        PHP
  $AE9D  00        BRK
  $AE9E  08        PHP
  $AE9F  08        PHP
  $AEA0  F9 F1 F0  SBC $F0F1,Y

L_AEA3:
  $AEA3  F0 F0     BEQ $AE95
  $AEA5  F8        SED
  $AEA6  F0 00     BEQ $AEA8

L_AEA8:
  $AEA8  F8        SED
  $AEA9  F0 F8     BEQ $AEA3
  $AEAB  F8        SED
  $AEAC  F8        SED
  $AEAD  00        BRK
  $AEAE  F8        SED
  $AEAF  08        PHP
  $AEB0  00        BRK
  $AEB1  F0 00     BEQ $AEB3

L_AEB3:
  $AEB3  F8        SED
  $AEB4  00        BRK
  $AEB5  00        BRK

L_AEB6:
  $AEB6  00        BRK
  $AEB7  08        PHP
  $AEB8  08        PHP
  $AEB9  F6 08     INC $08,X
  $AEBB  FE 08 06  INC $0608,X
  $AEBE  10 F6     BPL $AEB6

L_AEC0:
  $AEC0  10 FE     BPL $AEC0
  $AEC2  10 06     BPL $AECA
  $AEC4  F7        .db $F7
  $AEC5  F1 F1     SBC ($F1),Y
  $AEC7  F0 F1     BEQ $AEBA
  $AEC9  F8        SED

L_AECA:
  $AECA  F1 00     SBC ($00),Y
  $AECC  F9 F0 F9  SBC $F9F0,Y
  $AECF  F8        SED
  $AED0  F9 00 F9  SBC $F900,Y
  $AED3  08        PHP
  $AED4  01 F0     ORA ($F0,X)
  $AED6  01 F8     ORA ($F8,X)
  $AED8  01 00     ORA ($00,X)

L_AEDA:
  $AEDA  01 08     ORA ($08,X)
  $AEDC  09 F0     ORA #$F0
  $AEDE  09 F8     ORA #$F8
  $AEE0  09 00     ORA #$00
  $AEE2  09 08     ORA #$08

L_AEE4:
  $AEE4  FC        .db $FC
  $AEE5  FC        .db $FC
  $AEE6  03        .db $03

L_AEE7:
  $AEE7  00        BRK
  $AEE8  F0 F0     BEQ $AEDA
  $AEEA  F0 F8     BEQ $AEE4
  $AEEC  F8        SED
  $AEED  F0 F8     BEQ $AEE7
  $AEEF  F8        SED
  $AEF0  F8        SED
  $AEF1  00        BRK
  $AEF2  F8        SED
  $AEF3  08        PHP
  $AEF4  00        BRK
  $AEF5  F0 00     BEQ $AEF7

L_AEF7:
  $AEF7  F8        SED
  $AEF8  00        BRK
  $AEF9  00        BRK
  $AEFA  00        BRK
  $AEFB  08        PHP
  $AEFC  08        PHP
  $AEFD  F8        SED
  $AEFE  08        PHP
  $AEFF  00        BRK
  $AF00  08        PHP
  $AF01  08        PHP

L_AF02:
  $AF02  F5 F8     SBC $F8,X
  $AF04  F0 00     BEQ $AF06

L_AF06:
  $AF06  F0 08     BEQ $AF10
  $AF08  F0 F8     BEQ $AF02
  $AF0A  F0 00     BEQ $AF0C

L_AF0C:
  $AF0C  F8        SED
  $AF0D  F8        SED
  $AF0E  F8        SED
  $AF0F  00        BRK

L_AF10:
  $AF10  00        BRK
  $AF11  F8        SED
  $AF12  00        BRK
  $AF13  00        BRK
  $AF14  08        PHP

L_AF15:
  $AF15  F8        SED
  $AF16  08        PHP
  $AF17  00        BRK
  $AF18  00        BRK
  $AF19  08        PHP
  $AF1A  00        BRK
  $AF1B  10 F8     BPL $AF15
  $AF1D  FE F4 FC  INC $FCF4,X
  $AF20  FC        .db $FC

L_AF21:
  $AF21  FC        .db $FC
  $AF22  04        .db $04

L_AF23:
  $AF23  FC        .db $FC
  $AF24  EC F4 EC  CPX $ECF4
  $AF27  FC        .db $FC
  $AF28  F4        .db $F4
  $AF29  F4        .db $F4
  $AF2A  F4        .db $F4
  $AF2B  04        .db $04
  $AF2C  FC        .db $FC
  $AF2D  F4        .db $F4
  $AF2E  FC        .db $FC
  $AF2F  04        .db $04
  $AF30  04        .db $04
  $AF31  F4        .db $F4
  $AF32  04        .db $04
  $AF33  04        .db $04
  $AF34  0C        .db $0C

L_AF35:
  $AF35  F5 0C     SBC $0C,X
  $AF37  FD F4 F4  SBC $F4F4,X
  $AF3A  F4        .db $F4
  $AF3B  FC        .db $FC
  $AF3C  F0 F8     BEQ $AF36
  $AF3E  F0 00     BEQ $AF40

L_AF40:
  $AF40  F8        SED
  $AF41  F8        SED
  $AF42  F8        SED
  $AF43  00        BRK
  $AF44  00        BRK
  $AF45  F8        SED
  $AF46  08        PHP
  $AF47  F8        SED
  $AF48  C8        INY
  $AF49  18        CLC
  $AF4A  C8        INY
  $AF4B  20 C8 28  JSR $28C8
  $AF4E  C8        INY
  $AF4F  30 D0     BMI $AF21
  $AF51  10 D0     BPL $AF23
  $AF53  18        CLC
  $AF54  D0 20     BNE $AF76
  $AF56  D0 28     BNE $AF80
  $AF58  D0 30     BNE $AF8A
  $AF5A  D8        CLD
  $AF5B  10 D8     BPL $AF35

L_AF5D:
  $AF5D  18        CLC
  $AF5E  D8        CLD
  $AF5F  20 D8 28  JSR $28D8

L_AF62:
  $AF62  D8        CLD
  $AF63  30 F8     BMI $AF5D
  $AF65  28        PLP
  $AF66  F8        SED
  $AF67  30 00     BMI $AF69

L_AF69:
  $AF69  28        PLP
  $AF6A  00        BRK
  $AF6B  30 DF     BMI $AF4C
  $AF6D  38        SEC
  $AF6E  DF        .db $DF
  $AF6F  40        RTI
  $AF70  E7        .db $E7
  $AF71  70 EF     BVS $AF62
  $AF73  70 F7     BVS $AF6C
  $AF75  70 FF     BVS $AF76
  $AF77  70 07     BVS $AF80
  $AF79  70 2E     BVS $AFA9
  $AF7B  20 2E 28  JSR $282E
  $AF7E  36 28     ROL $28,X

L_AF80:
  $AF80  D0 38     BNE $AFBA
  $AF82  D8        CLD
  $AF83  38        SEC
  $AF84  E8        INX
  $AF85  00        BRK
  $AF86  E8        INX
  $AF87  08        PHP
  $AF88  F0 08     BEQ $AF92

L_AF8A:
  $AF8A  F0 10     BEQ $AF9C
  $AF8C  F0 18     BEQ $AFA6
  $AF8E  F8        SED
  $AF8F  08        PHP
  $AF90  F8        SED
  $AF91  10 F8     BPL $AF8B
  $AF93  18        CLC
  $AF94  00        BRK
  $AF95  00        BRK
  $AF96  08        PHP
  $AF97  00        BRK
  $AF98  FC        .db $FC
  $AF99  F4        .db $F4
  $AF9A  FC        .db $FC
  $AF9B  FC        .db $FC

L_AF9C:
  $AF9C  FC        .db $FC
  $AF9D  04        .db $04
  $AF9E  04        .db $04
  $AF9F  FC        .db $FC
  $AFA0  E4 F0     CPX $F0
  $AFA2  E4 F8     CPX $F8
  $AFA4  E4 00     CPX $00

L_AFA6:
  $AFA6  E4 08     CPX $08
  $AFA8  EC F0 EC  CPX $ECF0
  $AFAB  F8        SED
  $AFAC  EC 00 EC  CPX $EC00
  $AFAF  08        PHP
  $AFB0  F4        .db $F4
  $AFB1  F0 F4     BEQ $AFA7
  $AFB3  F8        SED
  $AFB4  F4        .db $F4
  $AFB5  00        BRK
  $AFB6  F4        .db $F4

L_AFB7:
  $AFB7  08        PHP
  $AFB8  FC        .db $FC
  $AFB9  F0 FC     BEQ $AFB7
  $AFBB  F8        SED
  $AFBC  FC        .db $FC
  $AFBD  00        BRK
  $AFBE  FC        .db $FC
  $AFBF  08        PHP
  $AFC0  FC        .db $FC
  $AFC1  10 04     BPL $AFC7
  $AFC3  F8        SED
  $AFC4  04        .db $04
  $AFC5  00        BRK
  $AFC6  04        .db $04

L_AFC7:
  $AFC7  08        PHP
  $AFC8  04        .db $04
  $AFC9  10 0C     BPL $AFD7
  $AFCB  F0 0C     BEQ $AFD9
  $AFCD  F8        SED
  $AFCE  0C        .db $0C
  $AFCF  00        BRK
  $AFD0  0C        .db $0C
  $AFD1  08        PHP
  $AFD2  0C        .db $0C
  $AFD3  10 14     BPL $AFE9
  $AFD5  ED 14 F5  SBC $F514
  $AFD8  14        .db $14

L_AFD9:
  $AFD9  FD 14 05  SBC $0514,X
  $AFDC  14        .db $14
  $AFDD  0D E8 F0  ORA $F0E8

L_AFE0:
  $AFE0  E8        INX
  $AFE1  F8        SED
  $AFE2  E8        INX

L_AFE3:
  $AFE3  00        BRK
  $AFE4  F0 F0     BEQ $AFD6
  $AFE6  F0 F8     BEQ $AFE0
  $AFE8  F0 00     BEQ $AFEA

L_AFEA:
  $AFEA  EC 08 F4  CPX $F408
  $AFED  F0 F4     BEQ $AFE3
  $AFEF  F8        SED
  $AFF0  F4        .db $F4
  $AFF1  00        BRK
  $AFF2  F4        .db $F4

L_AFF3:
  $AFF3  08        PHP
  $AFF4  FC        .db $FC
  $AFF5  F0 FC     BEQ $AFF3
  $AFF7  F8        SED
  $AFF8  FC        .db $FC
  $AFF9  00        BRK
  $AFFA  FC        .db $FC
  $AFFB  08        PHP
  $AFFC  FC        .db $FC
  $AFFD  10 04     BPL $B003
  $AFFF  F8        SED
  $B000  04        .db $04
  $B001  00        BRK
  $B002  04        .db $04

L_B003:
  $B003  08        PHP
  $B004  04        .db $04
  $B005  10 0C     BPL $B013
  $B007  F0 0C     BEQ $B015
  $B009  F8        SED
  $B00A  0C        .db $0C
  $B00B  00        BRK
  $B00C  0C        .db $0C
  $B00D  08        PHP
  $B00E  0C        .db $0C
  $B00F  10 14     BPL $B025
  $B011  ED 14 F5  SBC $F514
  $B014  14        .db $14

L_B015:
  $B015  FD 14 05  SBC $0514,X
  $B018  14        .db $14
  $B019  0D 03 18  ORA $1803
  $B01C  E4 F0     CPX $F0
  $B01E  E4 F8     CPX $F8
  $B020  E4 00     CPX $00
  $B022  E4 08     CPX $08
  $B024  EC F0 EC  CPX $ECF0
  $B027  F8        SED
  $B028  EC 00 EC  CPX $EC00
  $B02B  08        PHP
  $B02C  F4        .db $F4
  $B02D  F0 F4     BEQ $B023
  $B02F  F8        SED
  $B030  F4        .db $F4
  $B031  00        BRK
  $B032  F4        .db $F4

L_B033:
  $B033  08        PHP
  $B034  FC        .db $FC
  $B035  F0 FC     BEQ $B033
  $B037  F8        SED
  $B038  FC        .db $FC
  $B039  00        BRK
  $B03A  FC        .db $FC
  $B03B  08        PHP
  $B03C  04        .db $04
  $B03D  F6 04     INC $04,X
  $B03F  FE 04 06  INC $0604,X
  $B042  04        .db $04
  $B043  0E 0C F6  ASL $F60C
  $B046  0C        .db $0C
  $B047  FE 0C 06  INC $060C,X
  $B04A  0C        .db $0C
  $B04B  0E 14 F0  ASL $F014
  $B04E  14        .db $14
  $B04F  F8        SED
  $B050  14        .db $14
  $B051  00        BRK
  $B052  14        .db $14
  $B053  08        PHP
  $B054  14        .db $14
  $B055  10 1C     BPL $B073
  $B057  ED 1C F5  SBC $F51C
  $B05A  1C        .db $1C
  $B05B  FD 1C 05  SBC $051C,X
  $B05E  1C        .db $1C
  $B05F  0D F4 F0  ORA $F0F4
  $B062  F4        .db $F4
  $B063  F8        SED
  $B064  F4        .db $F4
  $B065  00        BRK
  $B066  F4        .db $F4

L_B067:
  $B067  08        PHP
  $B068  FC        .db $FC
  $B069  F0 FC     BEQ $B067
  $B06B  F8        SED
  $B06C  FC        .db $FC
  $B06D  00        BRK
  $B06E  FC        .db $FC
  $B06F  08        PHP
  $B070  04        .db $04
  $B071  F0 04     BEQ $B077

L_B073:
  $B073  F8        SED
  $B074  04        .db $04
  $B075  00        BRK
  $B076  04        .db $04

L_B077:
  $B077  08        PHP
  $B078  FA        .db $FA
  $B079  FC        .db $FC
  $B07A  EC F5 F8  CPX $F8F5
  $B07D  F8        SED
  $B07E  F8        SED
  $B07F  00        BRK
  $B080  00        BRK
  $B081  F7        .db $F7
  $B082  00        BRK
  $B083  FF        .db $FF
  $B084  00        BRK
  $B085  07        .db $07
  $B086  08        PHP
  $B087  F8        SED
  $B088  08        PHP
  $B089  00        BRK
  $B08A  F4        .db $F4
  $B08B  FC        .db $FC
  $B08C  F4        .db $F4
  $B08D  04        .db $04
  $B08E  FC        .db $FC
  $B08F  F4        .db $F4
  $B090  FC        .db $FC
  $B091  FC        .db $FC
  $B092  FC        .db $FC
  $B093  04        .db $04
  $B094  04        .db $04
  $B095  F4        .db $F4
  $B096  04        .db $04
  $B097  FC        .db $FC
  $B098  04        .db $04
  $B099  04        .db $04
  $B09A  04        .db $04
  $B09B  F7        .db $F7
  $B09C  F4        .db $F4
  $B09D  FC        .db $FC
  $B09E  F4        .db $F4
  $B09F  04        .db $04
  $B0A0  FC        .db $FC
  $B0A1  F4        .db $F4
  $B0A2  FC        .db $FC
  $B0A3  FC        .db $FC
  $B0A4  FC        .db $FC
  $B0A5  04        .db $04
  $B0A6  FC        .db $FC
  $B0A7  F7        .db $F7
  $B0A8  F4        .db $F4
  $B0A9  FC        .db $FC
  $B0AA  F4        .db $F4
  $B0AB  04        .db $04
  $B0AC  FC        .db $FC
  $B0AD  FC        .db $FC
  $B0AE  FC        .db $FC
  $B0AF  04        .db $04
  $B0B0  FB        .db $FB
  $B0B1  F4        .db $F4
  $B0B2  FB        .db $FB
  $B0B3  F7        .db $F7
  $B0B4  FC        .db $FC
  $B0B5  F8        SED
  $B0B6  04        .db $04
  $B0B7  F8        SED
  $B0B8  04        .db $04
  $B0B9  00        BRK
  $B0BA  0C        .db $0C
  $B0BB  F8        SED
  $B0BC  0C        .db $0C
  $B0BD  00        BRK
  $B0BE  14        .db $14
  $B0BF  F8        SED
  $B0C0  14        .db $14
  $B0C1  00        BRK
  $B0C2  0C        .db $0C
  $B0C3  08        PHP
  $B0C4  14        .db $14
  $B0C5  04        .db $04
  $B0C6  F8        SED
  $B0C7  F2        .db $F2
  $B0C8  F8        SED
  $B0C9  FA        .db $FA
  $B0CA  F8        SED
  $B0CB  02        .db $02
  $B0CC  00        BRK
  $B0CD  F0 00     BEQ $B0CF

L_B0CF:
  $B0CF  F8        SED

L_B0D0:
  $B0D0  00        BRK
  $B0D1  00        BRK
  $B0D2  E8        INX
  $B0D3  F8        SED
  $B0D4  E8        INX
  $B0D5  00        BRK
  $B0D6  F0 F8     BEQ $B0D0
  $B0D8  F0 00     BEQ $B0DA

L_B0DA:
  $B0DA  F8        SED
  $B0DB  F8        SED
  $B0DC  F8        SED
  $B0DD  00        BRK
  $B0DE  00        BRK
  $B0DF  F8        SED

L_B0E0:
  $B0E0  00        BRK
  $B0E1  00        BRK
  $B0E2  08        PHP
  $B0E3  F8        SED
  $B0E4  08        PHP
  $B0E5  00        BRK
  $B0E6  10 F8     BPL $B0E0
  $B0E8  10 00     BPL $B0EA

L_B0EA:
  $B0EA  18        CLC
  $B0EB  F8        SED
  $B0EC  18        CLC
  $B0ED  00        BRK
  $B0EE  20 F8 20  JSR $20F8
  $B0F1  00        BRK
  $B0F2  D8        CLD
  $B0F3  F8        SED
  $B0F4  D8        CLD
  $B0F5  00        BRK
  $B0F6  E0 F8     CPX #$F8
  $B0F8  E0 00     CPX #$00
  $B0FA  E8        INX
  $B0FB  F6 E8     INC $E8,X
  $B0FD  FE F0 F6  INC $F6F0,X

L_B100:
  $B100  F0 FE     BEQ $B100
  $B102  F8        SED
  $B103  FA        .db $FA
  $B104  F8        SED
  $B105  02        .db $02
  $B106  00        BRK
  $B107  FA        .db $FA
  $B108  00        BRK
  $B109  02        .db $02
  $B10A  08        PHP
  $B10B  F6 08     INC $08,X
  $B10D  FE 10 F6  INC $F610,X

L_B110:
  $B110  10 FE     BPL $B110
  $B112  18        CLC
  $B113  FA        .db $FA
  $B114  18        CLC
  $B115  02        .db $02
  $B116  20 FA 20  JSR $20FA
  $B119  02        .db $02

L_B11A:
  $B11A  E8        INX
  $B11B  FA        .db $FA
  $B11C  E8        INX
  $B11D  02        .db $02
  $B11E  F0 FA     BEQ $B11A
  $B120  F0 02     BEQ $B124
  $B122  F8        SED
  $B123  F6 F8     INC $F8,X
  $B125  FE 00 F6  INC $F600,X
  $B128  00        BRK
  $B129  FE 08 FA  INC $FA08,X
  $B12C  08        PHP

L_B12D:
  $B12D  02        .db $02
  $B12E  10 FA     BPL $B12A
  $B130  10 02     BPL $B134
  $B132  18        CLC
  $B133  F6 18     INC $18,X
  $B135  FE 20 F6  INC $F620,X
  $B138  20 FE F0  JSR $F0FE
  $B13B  F0 F0     BEQ $B12D

L_B13D:
  $B13D  F8        SED
  $B13E  F0 00     BEQ $B140

L_B140:
  $B140  F0 08     BEQ $B14A
  $B142  F8        SED
  $B143  F0 F8     BEQ $B13D
  $B145  F8        SED
  $B146  F8        SED
  $B147  00        BRK
  $B148  F8        SED
  $B149  08        PHP

L_B14A:
  $B14A  00        BRK
  $B14B  F0 00     BEQ $B14D

L_B14D:
  $B14D  F8        SED

L_B14E:
  $B14E  00        BRK
  $B14F  00        BRK
  $B150  00        BRK
  $B151  08        PHP
  $B152  08        PHP
  $B153  F0 08     BEQ $B15D
  $B155  F8        SED
  $B156  08        PHP
  $B157  00        BRK

L_B158:
  $B158  08        PHP
  $B159  08        PHP
  $B15A  F1 E8     SBC ($E8),Y
  $B15C  F9 E8 F9  SBC $F9E8,Y
  $B15F  F8        SED
  $B160  F9 00 E8  SBC $E800,Y
  $B163  FF        .db $FF
  $B164  F0 E8     BEQ $B14E
  $B166  F0 F0     BEQ $B158
  $B168  F0 F8     BEQ $B162
  $B16A  F0 00     BEQ $B16C

L_B16C:
  $B16C  F8        SED
  $B16D  E8        INX
  $B16E  F8        SED
  $B16F  F0 F8     BEQ $B169
  $B171  F8        SED
  $B172  F8        SED

L_B173:
  $B173  00        BRK
  $B174  F8        SED
  $B175  08        PHP
  $B176  00        BRK
  $B177  E8        INX
  $B178  00        BRK
  $B179  F0 00     BEQ $B17B

L_B17B:
  $B17B  F8        SED
  $B17C  00        BRK
  $B17D  00        BRK
  $B17E  00        BRK
  $B17F  08        PHP
  $B180  08        PHP
  $B181  F0 08     BEQ $B18B
  $B183  F8        SED
  $B184  08        PHP
  $B185  00        BRK
  $B186  08        PHP
  $B187  08        PHP
  $B188  FB        .db $FB
  $B189  F9 00 F1  SBC $F100,Y
  $B18C  08        PHP
  $B18D  E8        INX
  $B18E  00        BRK
  $B18F  E0 08     CPX #$08
  $B191  E0 E8     CPX #$E8
  $B193  F4        .db $F4
  $B194  DC        .db $DC

L_B195:
  $B195  F0 DC     BEQ $B173
  $B197  F8        SED
  $B198  DC        .db $DC
  $B199  00        BRK
  $B19A  DC        .db $DC
  $B19B  08        PHP
  $B19C  E4 F0     CPX $F0
  $B19E  E4 F8     CPX $F8
  $B1A0  E4 00     CPX $00
  $B1A2  E4 08     CPX $08
  $B1A4  EC E8 EC  CPX $ECE8
  $B1A7  F0 EC     BEQ $B195

L_B1A9:
  $B1A9  F8        SED
  $B1AA  EC 00 EC  CPX $EC00
  $B1AD  08        PHP
  $B1AE  EC 10 F4  CPX $F410
  $B1B1  E8        INX
  $B1B2  F4        .db $F4
  $B1B3  F0 F4     BEQ $B1A9
  $B1B5  F8        SED
  $B1B6  F4        .db $F4
  $B1B7  00        BRK
  $B1B8  F4        .db $F4

L_B1B9:
  $B1B9  08        PHP
  $B1BA  F4        .db $F4
  $B1BB  10 FC     BPL $B1B9

L_B1BD:
  $B1BD  E8        INX
  $B1BE  FC        .db $FC
  $B1BF  F0 FC     BEQ $B1BD
  $B1C1  F8        SED
  $B1C2  FC        .db $FC
  $B1C3  00        BRK
  $B1C4  FC        .db $FC
  $B1C5  08        PHP
  $B1C6  FC        .db $FC

L_B1C7:
  $B1C7  10 04     BPL $B1CD
  $B1C9  E8        INX
  $B1CA  04        .db $04
  $B1CB  F0 04     BEQ $B1D1

L_B1CD:
  $B1CD  F8        SED
  $B1CE  04        .db $04
  $B1CF  00        BRK
  $B1D0  04        .db $04

L_B1D1:
  $B1D1  08        PHP
  $B1D2  04        .db $04
  $B1D3  10 0C     BPL $B1E1
  $B1D5  F0 0C     BEQ $B1E3
  $B1D7  F8        SED
  $B1D8  0C        .db $0C
  $B1D9  00        BRK
  $B1DA  14        .db $14
  $B1DB  E8        INX
  $B1DC  14        .db $14
  $B1DD  F0 14     BEQ $B1F3
  $B1DF  F8        SED
  $B1E0  1C        .db $1C

L_B1E1:
  $B1E1  E8        INX
  $B1E2  1C        .db $1C

L_B1E3:
  $B1E3  F0 1C     BEQ $B201
  $B1E5  F8        SED
  $B1E6  E7        .db $E7
  $B1E7  F5 DC     SBC $DC,X
  $B1E9  F0 DC     BEQ $B1C7
  $B1EB  F8        SED
  $B1EC  DC        .db $DC

L_B1ED:
  $B1ED  00        BRK
  $B1EE  DC        .db $DC
  $B1EF  08        PHP
  $B1F0  E4 E8     CPX $E8
  $B1F2  E4 F0     CPX $F0
  $B1F4  E4 F8     CPX $F8
  $B1F6  E4 00     CPX $00
  $B1F8  E4 08     CPX $08
  $B1FA  E4 10     CPX $10
  $B1FC  EC E8 EC  CPX $ECE8
  $B1FF  F0 EC     BEQ $B1ED

L_B201:
  $B201  F8        SED
  $B202  EC 00 EC  CPX $EC00
  $B205  08        PHP
  $B206  EC 10 F4  CPX $F410
  $B209  E8        INX
  $B20A  F4        .db $F4
  $B20B  F0 F4     BEQ $B201
  $B20D  F8        SED
  $B20E  F4        .db $F4
  $B20F  00        BRK
  $B210  F4        .db $F4

L_B211:
  $B211  08        PHP
  $B212  F4        .db $F4
  $B213  10 FC     BPL $B211

L_B215:
  $B215  E8        INX
  $B216  FC        .db $FC
  $B217  F0 FC     BEQ $B215
  $B219  F8        SED
  $B21A  FC        .db $FC
  $B21B  00        BRK
  $B21C  FC        .db $FC
  $B21D  08        PHP
  $B21E  FC        .db $FC
  $B21F  10 04     BPL $B225
  $B221  E8        INX
  $B222  04        .db $04
  $B223  F0 04     BEQ $B229

L_B225:
  $B225  F8        SED
  $B226  04        .db $04
  $B227  00        BRK
  $B228  04        .db $04

L_B229:
  $B229  08        PHP

L_B22A:
  $B22A  04        .db $04
  $B22B  10 0C     BPL $B239
  $B22D  F0 0C     BEQ $B23B
  $B22F  F8        SED
  $B230  0C        .db $0C
  $B231  00        BRK
  $B232  0C        .db $0C
  $B233  08        PHP
  $B234  14        .db $14
  $B235  00        BRK
  $B236  14        .db $14
  $B237  08        PHP
  $B238  14        .db $14

L_B239:
  $B239  10 1C     BPL $B257

L_B23B:
  $B23B  00        BRK
  $B23C  1C        .db $1C
  $B23D  08        PHP
  $B23E  1C        .db $1C
  $B23F  10 E9     BPL $B22A
  $B241  F2        .db $F2
  $B242  F8        SED
  $B243  FC        .db $FC
  $B244  00        BRK
  $B245  FC        .db $FC
  $B246  F4        .db $F4
  $B247  F4        .db $F4
  $B248  F4        .db $F4
  $B249  FC        .db $FC
  $B24A  F4        .db $F4
  $B24B  04        .db $04
  $B24C  FC        .db $FC
  $B24D  F4        .db $F4
  $B24E  FC        .db $FC
  $B24F  FC        .db $FC
  $B250  FC        .db $FC
  $B251  04        .db $04
  $B252  04        .db $04
  $B253  F4        .db $F4
  $B254  04        .db $04
  $B255  FC        .db $FC
  $B256  04        .db $04

L_B257:
  $B257  04        .db $04
  $B258  0C        .db $0C
  $B259  F4        .db $F4
  $B25A  0C        .db $0C

L_B25B:
  $B25B  FC        .db $FC
  $B25C  0C        .db $0C
  $B25D  04        .db $04
  $B25E  FC        .db $FC
  $B25F  FC        .db $FC
  $B260  F8        SED
  $B261  F0 F8     BEQ $B25B
  $B263  F8        SED
  $B264  F8        SED
  $B265  00        BRK
  $B266  F8        SED
  $B267  08        PHP
  $B268  00        BRK
  $B269  F0 00     BEQ $B26B

L_B26B:
  $B26B  F8        SED
  $B26C  00        BRK
  $B26D  00        BRK
  $B26E  00        BRK
  $B26F  08        PHP
  $B270  08        PHP
  $B271  F7        .db $F7
  $B272  08        PHP
  $B273  FF        .db $FF
  $B274  FA        .db $FA
  $B275  F8        SED
  $B276  10 07     BPL $B27F
  $B278  10 0F     BPL $B289
  $B27A  10 17     BPL $B293
  $B27C  18        CLC
  $B27D  07        .db $07
  $B27E  18        CLC

L_B27F:
  $B27F  0F        .db $0F
  $B280  18        CLC
  $B281  17        .db $17
  $B282  08        PHP
  $B283  18        CLC
  $B284  FA        .db $FA
  $B285  FA        .db $FA
  $B286  02        .db $02
  $B287  00        BRK
  $B288  00        BRK

L_B289:
  $B289  12        .db $12
  $B28A  00        BRK
  $B28B  1A        .db $1A
  $B28C  08        PHP
  $B28D  12        .db $12
  $B28E  08        PHP
  $B28F  1A        .db $1A
  $B290  10 0A     BPL $B29C
  $B292  10 12     BPL $B2A6
  $B294  10 1A     BPL $B2B0
  $B296  E4 02     CPX $02
  $B298  E4 0A     CPX $0A
  $B29A  EC FA EC  CPX $ECFA
  $B29D  02        .db $02
  $B29E  EC 0A F4  CPX $F40A
  $B2A1  FA        .db $FA
  $B2A2  F4        .db $F4
  $B2A3  02        .db $02
  $B2A4  F4        .db $F4
  $B2A5  0A        ASL

L_B2A6:
  $B2A6  FC        .db $FC
  $B2A7  F2        .db $F2
  $B2A8  FC        .db $FC
  $B2A9  FA        .db $FA
  $B2AA  FC        .db $FC
  $B2AB  02        .db $02
  $B2AC  FC        .db $FC
  $B2AD  0A        ASL
  $B2AE  04        .db $04
  $B2AF  FA        .db $FA

L_B2B0:
  $B2B0  04        .db $04
  $B2B1  02        .db $02
  $B2B2  F4        .db $F4
  $B2B3  02        .db $02
  $B2B4  00        BRK
  $B2B5  12        .db $12
  $B2B6  00        BRK
  $B2B7  1A        .db $1A
  $B2B8  08        PHP
  $B2B9  12        .db $12
  $B2BA  08        PHP
  $B2BB  1A        .db $1A
  $B2BC  10 0A     BPL $B2C8
  $B2BE  10 12     BPL $B2D2
  $B2C0  10 1A     BPL $B2DC
  $B2C2  E7        .db $E7
  $B2C3  02        .db $02
  $B2C4  E7        .db $E7
  $B2C5  0A        ASL
  $B2C6  EF        .db $EF
  $B2C7  FA        .db $FA

L_B2C8:
  $B2C8  EF        .db $EF
  $B2C9  02        .db $02
  $B2CA  EF        .db $EF
  $B2CB  0A        ASL
  $B2CC  F7        .db $F7
  $B2CD  FA        .db $FA
  $B2CE  F7        .db $F7
  $B2CF  02        .db $02
  $B2D0  F7        .db $F7
  $B2D1  0A        ASL

L_B2D2:
  $B2D2  FF        .db $FF
  $B2D3  F2        .db $F2
  $B2D4  FF        .db $FF
  $B2D5  FA        .db $FA
  $B2D6  FF        .db $FF
  $B2D7  02        .db $02
  $B2D8  FF        .db $FF
  $B2D9  0A        ASL
  $B2DA  07        .db $07
  $B2DB  FA        .db $FA

L_B2DC:
  $B2DC  07        .db $07
  $B2DD  02        .db $02
  $B2DE  0F        .db $0F
  $B2DF  FA        .db $FA
  $B2E0  0F        .db $0F
  $B2E1  02        .db $02
  $B2E2  F7        .db $F7
  $B2E3  02        .db $02
  $B2E4  F7        .db $F7
  $B2E5  1E FF 16  ASL $16FF,X
  $B2E8  FF        .db $FF
  $B2E9  1E 07 16  ASL $1607,X
  $B2EC  07        .db $07
  $B2ED  1E 0E 0E  ASL $0E0E,X
  $B2F0  0F        .db $0F
  $B2F1  16 0F     ASL $0F,X
  $B2F3  1E E4 02  ASL $02E4,X
  $B2F6  E4 0A     CPX $0A
  $B2F8  EC FA EC  CPX $ECFA
  $B2FB  02        .db $02
  $B2FC  EC 0A F4  CPX $F40A
  $B2FF  FA        .db $FA
  $B300  F4        .db $F4
  $B301  02        .db $02
  $B302  F4        .db $F4
  $B303  0A        ASL
  $B304  FC        .db $FC
  $B305  F2        .db $F2
  $B306  FC        .db $FC
  $B307  FA        .db $FA
  $B308  FC        .db $FC
  $B309  02        .db $02
  $B30A  FC        .db $FC
  $B30B  0A        ASL
  $B30C  04        .db $04
  $B30D  FA        .db $FA
  $B30E  04        .db $04
  $B30F  02        .db $02
  $B310  F4        .db $F4
  $B311  02        .db $02
  $B312  F8        SED
  $B313  1B        .db $1B
  $B314  F8        SED
  $B315  23        .db $23
  $B316  00        BRK
  $B317  1B        .db $1B
  $B318  00        BRK
  $B319  23        .db $23
  $B31A  08        PHP
  $B31B  1B        .db $1B
  $B31C  08        PHP
  $B31D  23        .db $23
  $B31E  10 1B     BPL $B33B
  $B320  10 23     BPL $B345
  $B322  E4 02     CPX $02
  $B324  E4 0A     CPX $0A
  $B326  EC FA EC  CPX $ECFA
  $B329  02        .db $02
  $B32A  EC 0A F4  CPX $F40A
  $B32D  FA        .db $FA
  $B32E  F4        .db $F4
  $B32F  02        .db $02
  $B330  F4        .db $F4
  $B331  0A        ASL
  $B332  FC        .db $FC
  $B333  F2        .db $F2
  $B334  FC        .db $FC
  $B335  FA        .db $FA
  $B336  FC        .db $FC
  $B337  02        .db $02
  $B338  FC        .db $FC
  $B339  0A        ASL
  $B33A  04        .db $04

L_B33B:
  $B33B  FA        .db $FA
  $B33C  04        .db $04
  $B33D  02        .db $02
  $B33E  F4        .db $F4
  $B33F  02        .db $02
  $B340  EC ED EC  CPX $ECED
  $B343  F5 EC     SBC $EC,X

L_B345:
  $B345  FD F4 ED  SBC $EDF4,X
  $B348  F4        .db $F4
  $B349  F5 F4     SBC $F4,X
  $B34B  FD FC FC  SBC $FCFC,X
  $B34E  E4 F5     CPX $F5
  $B350  E4 FD     CPX $FD
  $B352  EC F5 EC  CPX $ECF5
  $B355  FD F4 F5  SBC $F5F4,X
  $B358  F4        .db $F4

L_B359:
  $B359  FD FC FC  SBC $FCFC,X
  $B35C  F8        SED
  $B35D  E8        INX
  $B35E  F8        SED
  $B35F  F0 F8     BEQ $B359
  $B361  F8        SED
  $B362  F8        SED
  $B363  00        BRK
  $B364  F8        SED
  $B365  08        PHP
  $B366  F8        SED
  $B367  10 00     BPL $B369

L_B369:
  $B369  E8        INX
  $B36A  00        BRK
  $B36B  F0 00     BEQ $B36D

L_B36D:
  $B36D  F8        SED
  $B36E  00        BRK
  $B36F  00        BRK
  $B370  00        BRK
  $B371  08        PHP
  $B372  00        BRK
  $B373  10 F8     BPL $B36D
  $B375  E0 F8     CPX #$F8
  $B377  18        CLC
  $B378  00        BRK
  $B379  E0 00     CPX #$00
  $B37B  18        CLC
  $B37C  F0 F8     BEQ $B376
  $B37E  F0 00     BEQ $B380

L_B380:
  $B380  F8        SED
  $B381  F8        SED
  $B382  F8        SED
  $B383  00        BRK
  $B384  00        BRK
  $B385  F8        SED
  $B386  00        BRK
  $B387  00        BRK
  $B388  08        PHP
  $B389  F8        SED
  $B38A  08        PHP
  $B38B  00        BRK
  $B38C  F0 E8     BEQ $B376
  $B38E  F0 F0     BEQ $B380
  $B390  F0 08     BEQ $B39A
  $B392  F0 10     BEQ $B3A4
  $B394  F8        SED

L_B395:
  $B395  E8        INX
  $B396  F8        SED

L_B397:
  $B397  F0 F8     BEQ $B391
  $B399  08        PHP

L_B39A:
  $B39A  F8        SED
  $B39B  10 00     BPL $B39D

L_B39D:
  $B39D  E8        INX
  $B39E  00        BRK
  $B39F  F0 00     BEQ $B3A1

L_B3A1:
  $B3A1  08        PHP
  $B3A2  00        BRK
  $B3A3  10 08     BPL $B3AD
  $B3A5  E8        INX
  $B3A6  08        PHP
  $B3A7  F0 08     BEQ $B3B1
  $B3A9  08        PHP
  $B3AA  08        PHP
  $B3AB  10 E8     BPL $B395

L_B3AD:
  $B3AD  F0 E8     BEQ $B397
  $B3AF  F8        SED
  $B3B0  E8        INX

L_B3B1:
  $B3B1  00        BRK
  $B3B2  E8        INX

L_B3B3:
  $B3B3  08        PHP
  $B3B4  F0 00     BEQ $B3B6

L_B3B6:
  $B3B6  F0 08     BEQ $B3C0
  $B3B8  F8        SED
  $B3B9  F0 F8     BEQ $B3B3
  $B3BB  F8        SED
  $B3BC  F8        SED
  $B3BD  00        BRK
  $B3BE  F8        SED
  $B3BF  08        PHP

L_B3C0:
  $B3C0  00        BRK
  $B3C1  F0 00     BEQ $B3C3

L_B3C3:
  $B3C3  F8        SED
  $B3C4  00        BRK
  $B3C5  00        BRK

L_B3C6:
  $B3C6  00        BRK
  $B3C7  08        PHP
  $B3C8  E8        INX
  $B3C9  00        BRK
  $B3CA  E8        INX
  $B3CB  08        PHP
  $B3CC  F0 F8     BEQ $B3C6
  $B3CE  08        PHP
  $B3CF  F7        .db $F7
  $B3D0  08        PHP
  $B3D1  FF        .db $FF
  $B3D2  08        PHP
  $B3D3  07        .db $07
  $B3D4  08        PHP

L_B3D5:
  $B3D5  0F        .db $0F
  $B3D6  F7        .db $F7
  $B3D7  F8        SED
  $B3D8  F9 E8 F8  SBC $F8E8,Y
  $B3DB  F0 F8     BEQ $B3D5
  $B3DD  F8        SED
  $B3DE  F8        SED
  $B3DF  00        BRK
  $B3E0  F8        SED
  $B3E1  08        PHP
  $B3E2  00        BRK
  $B3E3  F0 00     BEQ $B3E5

L_B3E5:
  $B3E5  F8        SED
  $B3E6  00        BRK
  $B3E7  00        BRK
  $B3E8  00        BRK
  $B3E9  08        PHP
  $B3EA  F0 F8     BEQ $B3E4
  $B3EC  F0 00     BEQ $B3EE

L_B3EE:
  $B3EE  E8        INX
  $B3EF  FC        .db $FC
  $B3F0  E0 FC     CPX #$FC

L_B3F2:
  $B3F2  D8        CLD
  $B3F3  FC        .db $FC
  $B3F4  D0 FC     BNE $B3F2
  $B3F6  C8        INY
  $B3F7  FC        .db $FC
  $B3F8  C0 FC     CPY #$FC

L_B3FA:
  $B3FA  B8        CLV
  $B3FB  FC        .db $FC
  $B3FC  B0 FC     BCS $B3FA
  $B3FE  A8        TAY
  $B3FF  FC        .db $FC
  $B400  A0 FC     LDY #$FC
  $B402  98        TYA
  $B403  FC        .db $FC
  $B404  F8        SED
  $B405  F7        .db $F7
  $B406  F8        SED
  $B407  FF        .db $FF
  $B408  00        BRK
  $B409  F8        SED
  $B40A  00        BRK
  $B40B  00        BRK
  $B40C  08        PHP
  $B40D  F8        SED

L_B40E:
  $B40E  08        PHP
  $B40F  00        BRK
  $B410  F8        SED
  $B411  F9 F8 01  SBC $01F8,Y
  $B414  00        BRK
  $B415  F8        SED
  $B416  00        BRK
  $B417  00        BRK

L_B418:
  $B418  08        PHP
  $B419  F8        SED
  $B41A  08        PHP

L_B41B:
  $B41B  00        BRK

L_B41C:
  $B41C  F0 F0     BEQ $B40E
  $B41E  F0 F8     BEQ $B418
  $B420  F8        SED
  $B421  F0 F8     BEQ $B41B
  $B423  F8        SED
  $B424  F8        SED
  $B425  00        BRK
  $B426  00        BRK
  $B427  F8        SED
  $B428  00        BRK
  $B429  00        BRK
  $B42A  08        PHP
  $B42B  F8        SED
  $B42C  08        PHP
  $B42D  00        BRK

L_B42E:
  $B42E  F0 00     BEQ $B430

L_B430:
  $B430  F0 08     BEQ $B43A
  $B432  F8        SED
  $B433  F8        SED
  $B434  F8        SED
  $B435  00        BRK
  $B436  F8        SED
  $B437  08        PHP
  $B438  00        BRK
  $B439  F8        SED

L_B43A:
  $B43A  00        BRK
  $B43B  00        BRK
  $B43C  08        PHP
  $B43D  F8        SED
  $B43E  08        PHP
  $B43F  00        BRK
  $B440  FC        .db $FC
  $B441  F8        SED
  $B442  FC        .db $FC

L_B443:
  $B443  00        BRK
  $B444  FC        .db $FC
  $B445  F0 FC     BEQ $B443
  $B447  08        PHP
  $B448  00        BRK
  $B449  FE 00 FA  INC $FA00,X
  $B44C  00        BRK
  $B44D  FC        .db $FC
  $B44E  F8        SED
  $B44F  FF        .db $FF
  $B450  00        BRK
  $B451  F7        .db $F7
  $B452  00        BRK
  $B453  FF        .db $FF
  $B454  F8        SED
  $B455  F9 00 F9  SBC $F900,Y
  $B458  00        BRK
  $B459  01 F8     ORA ($F8,X)
  $B45B  F8        SED
  $B45C  F8        SED
  $B45D  00        BRK
  $B45E  00        BRK
  $B45F  F8        SED

L_B460:
  $B460  00        BRK
  $B461  00        BRK
  $B462  08        PHP
  $B463  F8        SED
  $B464  08        PHP
  $B465  00        BRK
  $B466  F0 F8     BEQ $B460
  $B468  F0 00     BEQ $B46A

L_B46A:
  $B46A  F8        SED

L_B46B:
  $B46B  E8        INX
  $B46C  F8        SED
  $B46D  F0 00     BEQ $B46F

L_B46F:
  $B46F  E8        INX
  $B470  00        BRK
  $B471  F0 A0     BEQ $B413
  $B473  A0 C0     LDY #$C0
  $B475  B8        CLV
  $B476  A0 08     LDY #$08
  $B478  B0 60     BCS $B4DA
  $B47A  F0 40     BEQ $B4BC
  $B47C  10 B0     BPL $B42E
  $B47E  30 20     BMI $B4A0
  $B480  40        RTI
  $B481  68        PLA
  $B482  50 98     BVC $B41C
  $B484  D8        CLD
  $B485  90 D0     BCC $B457
  $B487  A0 C0     LDY #$C0
  $B489  50 E0     BVC $B46B
  $B48B  00        BRK
  $B48C  F0 68     BEQ $B4F6
  $B48E  18        CLC
  $B48F  A8        TAY
  $B490  08        PHP
  $B491  30 58     BMI $B4EB
  $B493  E0 50     CPX #$50
  $B495  40        RTI
  $B496  98        TYA
  $B497  48        PHA
  $B498  B0 C0     BCS $B45A
  $B49A  B8        CLV
  $B49B  20 D8 C0  JSR $C0D8
  $B49E  F8        SED
  $B49F  00        BRK

L_B4A0:
  $B4A0  08        PHP
  $B4A1  68        PLA
  $B4A2  38        SEC
  $B4A3  B0 40     BCS $B4E5
  $B4A5  48        PHA
  $B4A6  58        CLI
  $B4A7  58        CLI
  $B4A8  EC EC EC  CPX $ECEC

L_B4AB:
  $B4AB  0C        .db $0C
  $B4AC  0C        .db $0C
  $B4AD  EC 0C 0C  CPX $0C0C
  $B4B0  E8        INX
  $B4B1  FC        .db $FC
  $B4B2  FC        .db $FC
  $B4B3  10 10     BPL $B4C5
  $B4B5  FC        .db $FC
  $B4B6  FC        .db $FC
  $B4B7  E8        INX
  $B4B8  E8        INX
  $B4B9  04        .db $04
  $B4BA  FC        .db $FC
  $B4BB  18        CLC

L_B4BC:
  $B4BC  10 04     BPL $B4C2
  $B4BE  FC        .db $FC
  $B4BF  F0 EA     BEQ $B4AB
  $B4C1  F4        .db $F4

L_B4C2:
  $B4C2  F4        .db $F4
  $B4C3  0E 0E 04  ASL $040E
  $B4C6  04        .db $04
  $B4C7  EA        NOP
  $B4C8  EA        NOP
  $B4C9  04        .db $04
  $B4CA  04        .db $04
  $B4CB  0E 0E F4  ASL $F40E
  $B4CE  F4        .db $F4
  $B4CF  EA        NOP
  $B4D0  F8        SED
  $B4D1  F4        .db $F4
  $B4D2  F8        SED
  $B4D3  FC        .db $FC
  $B4D4  F8        SED
  $B4D5  04        .db $04
  $B4D6  00        BRK
  $B4D7  F4        .db $F4
  $B4D8  00        BRK
  $B4D9  FC        .db $FC

L_B4DA:
  $B4DA  00        BRK
  $B4DB  04        .db $04
  $B4DC  FC        .db $FC
  $B4DD  F4        .db $F4
  $B4DE  FC        .db $FC
  $B4DF  FC        .db $FC
  $B4E0  FC        .db $FC
  $B4E1  04        .db $04
  $B4E2  04        .db $04
  $B4E3  FA        .db $FA
  $B4E4  FC        .db $FC

L_B4E5:
  $B4E5  F4        .db $F4
  $B4E6  FC        .db $FC
  $B4E7  FC        .db $FC
  $B4E8  FC        .db $FC
  $B4E9  04        .db $04
  $B4EA  04        .db $04

L_B4EB:
  $B4EB  FE F4 F8  INC $F8F4,X
  $B4EE  F4        .db $F4

L_B4EF:
  $B4EF  00        BRK
  $B4F0  FC        .db $FC
  $B4F1  F0 FC     BEQ $B4EF
  $B4F3  F8        SED
  $B4F4  FC        .db $FC
  $B4F5  00        BRK

L_B4F6:
  $B4F6  FC        .db $FC

L_B4F7:
  $B4F7  08        PHP
  $B4F8  04        .db $04
  $B4F9  F0 04     BEQ $B4FF
  $B4FB  F8        SED
  $B4FC  04        .db $04
  $B4FD  00        BRK
  $B4FE  04        .db $04

L_B4FF:
  $B4FF  08        PHP
  $B500  F4        .db $F4
  $B501  F0 F4     BEQ $B4F7
  $B503  08        PHP
  $B504  EC FA FC  CPX $FCFA
  $B507  FA        .db $FA
  $B508  EC F0 EC  CPX $ECF0
  $B50B  F8        SED
  $B50C  EC 00 EC  CPX $EC00
  $B50F  08        PHP
  $B510  F4        .db $F4
  $B511  F4        .db $F4
  $B512  F4        .db $F4
  $B513  FC        .db $FC
  $B514  F4        .db $F4
  $B515  04        .db $04
  $B516  FC        .db $FC
  $B517  F4        .db $F4
  $B518  FC        .db $FC
  $B519  FC        .db $FC
  $B51A  FC        .db $FC
  $B51B  04        .db $04
  $B51C  04        .db $04
  $B51D  F4        .db $F4
  $B51E  04        .db $04
  $B51F  FC        .db $FC
  $B520  04        .db $04
  $B521  04        .db $04

L_B522:
  $B522  FB        .db $FB
  $B523  FA        .db $FA
  $B524  EC FA EC  CPX $ECFA
  $B527  04        .db $04
  $B528  F0 F8     BEQ $B522
  $B52A  F0 00     BEQ $B52C

L_B52C:
  $B52C  F8        SED
  $B52D  F4        .db $F4
  $B52E  F8        SED
  $B52F  FC        .db $FC
  $B530  F8        SED
  $B531  04        .db $04
  $B532  00        BRK
  $B533  F4        .db $F4
  $B534  00        BRK
  $B535  FC        .db $FC
  $B536  00        BRK
  $B537  04        .db $04
  $B538  08        PHP
  $B539  F7        .db $F7
  $B53A  08        PHP
  $B53B  04        .db $04
  $B53C  F9 FA EC  SBC $ECFA,Y
  $B53F  FC        .db $FC
  $B540  F4        .db $F4
  $B541  FA        .db $FA
  $B542  F4        .db $F4
  $B543  02        .db $02
  $B544  FC        .db $FC
  $B545  F4        .db $F4
  $B546  FC        .db $FC
  $B547  FC        .db $FC
  $B548  FC        .db $FC
  $B549  04        .db $04
  $B54A  04        .db $04
  $B54B  EC 04 F4  CPX $F404
  $B54E  04        .db $04
  $B54F  FC        .db $FC
  $B550  04        .db $04
  $B551  04        .db $04
  $B552  FC        .db $FC
  $B553  FC        .db $FC
  $B554  EC F8 EC  CPX $ECF8
  $B557  00        BRK
  $B558  F4        .db $F4
  $B559  F6 F4     INC $F4,X
  $B55B  FE FC EE  INC $EEFC,X
  $B55E  FC        .db $FC
  $B55F  F6 FC     INC $FC,X
  $B561  FE 04 F0  INC $F004,X
  $B564  04        .db $04
  $B565  F8        SED
  $B566  04        .db $04
  $B567  00        BRK
  $B568  04        .db $04
  $B569  08        PHP
  $B56A  FC        .db $FC
  $B56B  F7        .db $F7
  $B56C  EC F8 EC  CPX $ECF8

L_B56F:
  $B56F  00        BRK
  $B570  F4        .db $F4
  $B571  F8        SED
  $B572  F4        .db $F4
  $B573  00        BRK
  $B574  F8        SED
  $B575  F0 F8     BEQ $B56F
  $B577  F8        SED
  $B578  00        BRK
  $B579  F0 00     BEQ $B57B

L_B57B:
  $B57B  F8        SED
  $B57C  04        .db $04
  $B57D  F8        SED
  $B57E  04        .db $04
  $B57F  00        BRK
  $B580  0C        .db $0C
  $B581  F8        SED
  $B582  0C        .db $0C
  $B583  00        BRK
  $B584  F4        .db $F4
  $B585  F4        .db $F4
  $B586  F4        .db $F4
  $B587  FC        .db $FC
  $B588  F4        .db $F4
  $B589  04        .db $04
  $B58A  FC        .db $FC
  $B58B  F4        .db $F4
  $B58C  FC        .db $FC
  $B58D  FC        .db $FC
  $B58E  FC        .db $FC
  $B58F  04        .db $04
  $B590  04        .db $04
  $B591  F4        .db $F4
  $B592  04        .db $04
  $B593  FC        .db $FC
  $B594  04        .db $04
  $B595  04        .db $04
  $B596  F8        SED
  $B597  FC        .db $FC
  $B598  EC F4 EC  CPX $ECF4
  $B59B  04        .db $04
  $B59C  EC F0 EC  CPX $ECF0
  $B59F  00        BRK
  $B5A0  F4        .db $F4
  $B5A1  EC F4 F4  CPX $F4F4
  $B5A4  F4        .db $F4
  $B5A5  FC        .db $FC
  $B5A6  FC        .db $FC
  $B5A7  F4        .db $F4
  $B5A8  FC        .db $FC
  $B5A9  FC        .db $FC
  $B5AA  FC        .db $FC
  $B5AB  04        .db $04
  $B5AC  04        .db $04
  $B5AD  F4        .db $F4
  $B5AE  04        .db $04
  $B5AF  FC        .db $FC
  $B5B0  04        .db $04
  $B5B1  04        .db $04
  $B5B2  F8        SED
  $B5B3  F8        SED
  $B5B4  F4        .db $F4
  $B5B5  F4        .db $F4
  $B5B6  F4        .db $F4
  $B5B7  FC        .db $FC
  $B5B8  F4        .db $F4
  $B5B9  04        .db $04
  $B5BA  FC        .db $FC
  $B5BB  F4        .db $F4
  $B5BC  FC        .db $FC
  $B5BD  FC        .db $FC
  $B5BE  FC        .db $FC
  $B5BF  04        .db $04
  $B5C0  04        .db $04
  $B5C1  F4        .db $F4
  $B5C2  04        .db $04
  $B5C3  FC        .db $FC
  $B5C4  04        .db $04
  $B5C5  04        .db $04
  $B5C6  F9 FA EC  SBC $ECFA,Y
  $B5C9  F4        .db $F4
  $B5CA  EC 02 FC  CPX $FC02
  $B5CD  EC 0C FD  CPX $FD0C
  $B5D0  EC F3 EC  CPX $ECF3
  $B5D3  03        .db $03
  $B5D4  F4        .db $F4
  $B5D5  F3        .db $F3
  $B5D6  F4        .db $F4
  $B5D7  FB        .db $FB
  $B5D8  F4        .db $F4
  $B5D9  03        .db $03
  $B5DA  FC        .db $FC
  $B5DB  F4        .db $F4
  $B5DC  FC        .db $FC
  $B5DD  FC        .db $FC
  $B5DE  FC        .db $FC
  $B5DF  04        .db $04
  $B5E0  04        .db $04
  $B5E1  F4        .db $F4
  $B5E2  04        .db $04
  $B5E3  FC        .db $FC
  $B5E4  04        .db $04
  $B5E5  04        .db $04
  $B5E6  F8        SED
  $B5E7  FB        .db $FB
  $B5E8  F4        .db $F4
  $B5E9  F4        .db $F4
  $B5EA  F4        .db $F4
  $B5EB  FC        .db $FC
  $B5EC  F4        .db $F4
  $B5ED  04        .db $04
  $B5EE  FC        .db $FC
  $B5EF  F4        .db $F4
  $B5F0  FC        .db $FC
  $B5F1  FC        .db $FC
  $B5F2  FC        .db $FC
  $B5F3  04        .db $04
  $B5F4  04        .db $04
  $B5F5  F4        .db $F4
  $B5F6  04        .db $04
  $B5F7  FC        .db $FC
  $B5F8  04        .db $04
  $B5F9  04        .db $04
  $B5FA  F7        .db $F7
  $B5FB  FB        .db $FB
  $B5FC  EC F9 EC  CPX $ECF9
  $B5FF  01 EC     ORA ($EC,X)
  $B601  F3        .db $F3
  $B602  EC 03 F4  CPX $F403
  $B605  F2        .db $F2
  $B606  F4        .db $F4
  $B607  FA        .db $FA
  $B608  F4        .db $F4
  $B609  02        .db $02
  $B60A  FC        .db $FC
  $B60B  F4        .db $F4
  $B60C  FC        .db $FC
  $B60D  FC        .db $FC
  $B60E  FC        .db $FC
  $B60F  04        .db $04
  $B610  04        .db $04
  $B611  F4        .db $F4
  $B612  04        .db $04
  $B613  FC        .db $FC
  $B614  0C        .db $0C
  $B615  FD F8 FB  SBC $FBF8,X
  $B618  EC FC F4  CPX $F4FC
  $B61B  F6 F4     INC $F4,X
  $B61D  FE F4 F6  INC $F6F4,X
  $B620  FC        .db $FC
  $B621  F0 FC     BEQ $B61F
  $B623  F8        SED
  $B624  FC        .db $FC
  $B625  00        BRK
  $B626  FC        .db $FC
  $B627  08        PHP
  $B628  04        .db $04

L_B629:
  $B629  F0 04     BEQ $B62F
  $B62B  F8        SED
  $B62C  04        .db $04
  $B62D  00        BRK
  $B62E  04        .db $04

L_B62F:
  $B62F  08        PHP
  $B630  F7        .db $F7
  $B631  FB        .db $FB
  $B632  F4        .db $F4
  $B633  F0 F4     BEQ $B629
  $B635  F8        SED
  $B636  F4        .db $F4
  $B637  00        BRK
  $B638  F4        .db $F4

L_B639:
  $B639  08        PHP
  $B63A  FC        .db $FC
  $B63B  F0 FC     BEQ $B639
  $B63D  F8        SED
  $B63E  FC        .db $FC
  $B63F  00        BRK
  $B640  FC        .db $FC
  $B641  08        PHP
  $B642  04        .db $04
  $B643  F0 04     BEQ $B649
  $B645  F8        SED
  $B646  04        .db $04

L_B647:
  $B647  00        BRK
  $B648  04        .db $04

L_B649:
  $B649  08        PHP
  $B64A  F9 FD EC  SBC $ECFD,Y
  $B64D  F8        SED
  $B64E  F9 E8 F9  SBC $F9E8,Y
  $B651  F0 F4     BEQ $B647
  $B653  F8        SED
  $B654  F4        .db $F4
  $B655  00        BRK
  $B656  FC        .db $FC
  $B657  F8        SED
  $B658  FC        .db $FC
  $B659  00        BRK
  $B65A  FC        .db $FC
  $B65B  08        PHP
  $B65C  04        .db $04
  $B65D  F0 04     BEQ $B663

L_B65F:
  $B65F  F8        SED
  $B660  04        .db $04
  $B661  00        BRK
  $B662  04        .db $04

L_B663:
  $B663  08        PHP
  $B664  F8        SED
  $B665  F9 EC F7  SBC $F7EC,Y
  $B668  F4        .db $F4
  $B669  F0 F4     BEQ $B65F
  $B66B  F8        SED
  $B66C  F4        .db $F4
  $B66D  00        BRK
  $B66E  FC        .db $FC

L_B66F:
  $B66F  E8        INX
  $B670  FC        .db $FC
  $B671  F0 FC     BEQ $B66F
  $B673  F8        SED
  $B674  FC        .db $FC
  $B675  00        BRK
  $B676  04        .db $04
  $B677  F0 04     BEQ $B67D
  $B679  F8        SED
  $B67A  04        .db $04
  $B67B  00        BRK
  $B67C  F6 F6     INC $F6,X
  $B67E  0C        .db $0C
  $B67F  F3        .db $F3
  $B680  EC F7 F5  CPX $F5F7
  $B683  ED F4 F5  SBC $F5F4
  $B686  F4        .db $F4
  $B687  FD F7 F6  SBC $F6F7,X
  $B68A  FC        .db $FC
  $B68B  F5 FC     SBC $FC,X
  $B68D  FD 04 F0  SBC $F004,X
  $B690  04        .db $04
  $B691  F8        SED
  $B692  04        .db $04
  $B693  00        BRK
  $B694  EC F1 EC  CPX $ECF1
  $B697  FE F4 F0  INC $F0F4,X
  $B69A  F4        .db $F4
  $B69B  F8        SED
  $B69C  F4        .db $F4
  $B69D  00        BRK
  $B69E  F4        .db $F4
  $B69F  08        PHP
  $B6A0  FC        .db $FC
  $B6A1  F8        SED
  $B6A2  FC        .db $FC
  $B6A3  00        BRK
  $B6A4  FC        .db $FC
  $B6A5  08        PHP
  $B6A6  04        .db $04
  $B6A7  F0 04     BEQ $B6AD
  $B6A9  F8        SED
  $B6AA  04        .db $04
  $B6AB  00        BRK
  $B6AC  04        .db $04

L_B6AD:
  $B6AD  08        PHP
  $B6AE  F7        .db $F7
  $B6AF  FD 0C F8  SBC $F80C,X
  $B6B2  0C        .db $0C
  $B6B3  00        BRK
  $B6B4  EC F8 F4  CPX $F4F8
  $B6B7  F7        .db $F7
  $B6B8  F4        .db $F4

L_B6B9:
  $B6B9  FF        .db $FF
  $B6BA  FC        .db $FC
  $B6BB  F0 FC     BEQ $B6B9
  $B6BD  F8        SED
  $B6BE  FC        .db $FC
  $B6BF  00        BRK
  $B6C0  04        .db $04
  $B6C1  F0 04     BEQ $B6C7

L_B6C3:
  $B6C3  F8        SED
  $B6C4  04        .db $04
  $B6C5  00        BRK
  $B6C6  04        .db $04

L_B6C7:
  $B6C7  08        PHP
  $B6C8  EC F2 EC  CPX $ECF2
  $B6CB  FA        .db $FA
  $B6CC  F4        .db $F4
  $B6CD  F0 F4     BEQ $B6C3
  $B6CF  F8        SED
  $B6D0  F4        .db $F4

L_B6D1:
  $B6D1  00        BRK
  $B6D2  FC        .db $FC
  $B6D3  F0 FC     BEQ $B6D1
  $B6D5  F8        SED
  $B6D6  FC        .db $FC
  $B6D7  00        BRK
  $B6D8  04        .db $04
  $B6D9  F0 04     BEQ $B6DF
  $B6DB  F8        SED
  $B6DC  04        .db $04
  $B6DD  00        BRK
  $B6DE  04        .db $04

L_B6DF:
  $B6DF  08        PHP
  $B6E0  EC F8 F4  CPX $F4F8
  $B6E3  F3        .db $F3
  $B6E4  F4        .db $F4
  $B6E5  FB        .db $FB
  $B6E6  F4        .db $F4

L_B6E7:
  $B6E7  03        .db $03
  $B6E8  FC        .db $FC
  $B6E9  F0 FC     BEQ $B6E7
  $B6EB  F8        SED
  $B6EC  FC        .db $FC
  $B6ED  00        BRK
  $B6EE  FC        .db $FC
  $B6EF  08        PHP
  $B6F0  04        .db $04
  $B6F1  F0 04     BEQ $B6F7
  $B6F3  F8        SED
  $B6F4  04        .db $04
  $B6F5  00        BRK
  $B6F6  04        .db $04

L_B6F7:
  $B6F7  08        PHP
  $B6F8  EC F9 F4  CPX $F4F9
  $B6FB  F1 F4     SBC ($F4),Y
  $B6FD  F9 F4 01  SBC $01F4,Y
  $B700  FC        .db $FC
  $B701  F0 FC     BEQ $B6FF
  $B703  F8        SED
  $B704  FC        .db $FC
  $B705  00        BRK
  $B706  FC        .db $FC
  $B707  08        PHP
  $B708  04        .db $04
  $B709  F7        .db $F7
  $B70A  04        .db $04

L_B70B:
  $B70B  FF        .db $FF
  $B70C  0C        .db $0C
  $B70D  F7        .db $F7
  $B70E  0C        .db $0C
  $B70F  FF        .db $FF
  $B710  F0 F9     BEQ $B70B
  $B712  F8        SED
  $B713  F1 F8     SBC ($F8),Y
  $B715  F9 F8 01  SBC $01F8,Y
  $B718  F8        SED
  $B719  09 00     ORA #$00
  $B71B  F0 00     BEQ $B71D

L_B71D:
  $B71D  F8        SED
  $B71E  00        BRK
  $B71F  00        BRK
  $B720  08        PHP
  $B721  F2        .db $F2
  $B722  08        PHP
  $B723  FA        .db $FA
  $B724  08        PHP
  $B725  02        .db $02
  $B726  EC F1 F4  CPX $F4F1
  $B729  F1 F4     SBC ($F4),Y
  $B72B  F9 F4 01  SBC $01F4,Y
  $B72E  FC        .db $FC
  $B72F  F1 FC     SBC ($FC),Y
  $B731  F9 FC 01  SBC $01FC,Y
  $B734  04        .db $04
  $B735  F0 04     BEQ $B73B

L_B737:
  $B737  F8        SED
  $B738  04        .db $04
  $B739  00        BRK
  $B73A  04        .db $04

L_B73B:
  $B73B  08        PHP
  $B73C  F0 F9     BEQ $B737
  $B73E  F8        SED
  $B73F  F4        .db $F4
  $B740  F8        SED
  $B741  FC        .db $FC
  $B742  F8        SED
  $B743  04        .db $04
  $B744  FF        .db $FF
  $B745  EC 00 F4  CPX $F400

L_B748:
  $B748  00        BRK
  $B749  FC        .db $FC
  $B74A  00        BRK
  $B74B  04        .db $04
  $B74C  08        PHP
  $B74D  F4        .db $F4
  $B74E  08        PHP
  $B74F  FC        .db $FC
  $B750  08        PHP
  $B751  04        .db $04
  $B752  10 F4     BPL $B748
  $B754  10 06     BPL $B75C
  $B756  EC F9 F4  CPX $F4F9
  $B759  F4        .db $F4
  $B75A  F4        .db $F4
  $B75B  FC        .db $FC

L_B75C:
  $B75C  F4        .db $F4
  $B75D  04        .db $04
  $B75E  FB        .db $FB
  $B75F  EC FC F4  CPX $F4FC
  $B762  FC        .db $FC
  $B763  FC        .db $FC
  $B764  FC        .db $FC
  $B765  04        .db $04
  $B766  04        .db $04
  $B767  FA        .db $FA
  $B768  04        .db $04
  $B769  02        .db $02
  $B76A  0C        .db $0C
  $B76B  FA        .db $FA
  $B76C  0C        .db $0C
  $B76D  02        .db $02
  $B76E  F4        .db $F4
  $B76F  F8        SED
  $B770  F4        .db $F4
  $B771  00        BRK
  $B772  FC        .db $FC
  $B773  F4        .db $F4
  $B774  FC        .db $FC
  $B775  FC        .db $FC
  $B776  FC        .db $FC
  $B777  04        .db $04
  $B778  04        .db $04
  $B779  F4        .db $F4
  $B77A  04        .db $04
  $B77B  FC        .db $FC
  $B77C  04        .db $04
  $B77D  04        .db $04
  $B77E  F5 F9     SBC $F9,X
  $B780  0C        .db $0C
  $B781  FA        .db $FA
  $B782  F4        .db $F4
  $B783  F4        .db $F4
  $B784  F4        .db $F4
  $B785  FC        .db $FC
  $B786  F4        .db $F4
  $B787  04        .db $04
  $B788  FC        .db $FC
  $B789  F1 FC     SBC ($FC),Y
  $B78B  F9 FC 01  SBC $01FC,Y
  $B78E  04        .db $04
  $B78F  EC 04 F4  CPX $F404
  $B792  04        .db $04
  $B793  FC        .db $FC
  $B794  04        .db $04
  $B795  04        .db $04
  $B796  F6 F6     INC $F6,X
  $B798  0C        .db $0C
  $B799  FC        .db $FC
  $B79A  F4        .db $F4
  $B79B  F4        .db $F4
  $B79C  F4        .db $F4
  $B79D  FC        .db $FC
  $B79E  F4        .db $F4
  $B79F  04        .db $04
  $B7A0  F5 FC     SBC $FC,X
  $B7A2  FC        .db $FC
  $B7A3  F9 FC 01  SBC $01FC,Y
  $B7A6  04        .db $04
  $B7A7  F4        .db $F4
  $B7A8  04        .db $04
  $B7A9  FC        .db $FC
  $B7AA  04        .db $04
  $B7AB  04        .db $04
  $B7AC  EC FC EC  CPX $ECFC
  $B7AF  04        .db $04
  $B7B0  F4        .db $F4
  $B7B1  FA        .db $FA
  $B7B2  F4        .db $F4
  $B7B3  02        .db $02
  $B7B4  FC        .db $FC
  $B7B5  F4        .db $F4
  $B7B6  FC        .db $FC
  $B7B7  FC        .db $FC
  $B7B8  FC        .db $FC
  $B7B9  04        .db $04
  $B7BA  04        .db $04
  $B7BB  F4        .db $F4
  $B7BC  04        .db $04
  $B7BD  FC        .db $FC
  $B7BE  04        .db $04
  $B7BF  04        .db $04
  $B7C0  0C        .db $0C
  $B7C1  FE F5 FB  INC $FBF5,X
  $B7C4  F4        .db $F4
  $B7C5  F4        .db $F4
  $B7C6  F4        .db $F4
  $B7C7  FC        .db $FC
  $B7C8  FC        .db $FC
  $B7C9  F4        .db $F4
  $B7CA  FC        .db $FC
  $B7CB  FC        .db $FC
  $B7CC  FC        .db $FC
  $B7CD  04        .db $04
  $B7CE  04        .db $04
  $B7CF  F4        .db $F4
  $B7D0  04        .db $04
  $B7D1  FC        .db $FC
  $B7D2  04        .db $04
  $B7D3  04        .db $04
  $B7D4  F7        .db $F7
  $B7D5  F7        .db $F7
  $B7D6  FC        .db $FC
  $B7D7  EC F4 F2  CPX $F2F4
  $B7DA  F4        .db $F4
  $B7DB  FA        .db $FA
  $B7DC  FC        .db $FC
  $B7DD  F4        .db $F4
  $B7DE  FC        .db $FC
  $B7DF  FC        .db $FC
  $B7E0  04        .db $04
  $B7E1  F2        .db $F2

L_B7E2:
  $B7E2  04        .db $04
  $B7E3  FA        .db $FA
  $B7E4  F6 F5     INC $F5,X
  $B7E6  F0 F0     BEQ $B7D8
  $B7E8  F0 F8     BEQ $B7E2
  $B7EA  F0 00     BEQ $B7EC

L_B7EC:
  $B7EC  F0 08     BEQ $B7F6
  $B7EE  F8        SED
  $B7EF  F0 F8     BEQ $B7E9
  $B7F1  F8        SED
  $B7F2  F8        SED
  $B7F3  00        BRK
  $B7F4  F8        SED
  $B7F5  08        PHP

L_B7F6:
  $B7F6  00        BRK
  $B7F7  F0 00     BEQ $B7F9

L_B7F9:
  $B7F9  F8        SED
  $B7FA  00        BRK
  $B7FB  00        BRK
  $B7FC  00        BRK
  $B7FD  08        PHP
  $B7FE  08        PHP
  $B7FF  F0 08     BEQ $B809
  $B801  F8        SED
  $B802  08        PHP
  $B803  00        BRK
  $B804  08        PHP
  $B805  08        PHP
  $B806  F2        .db $F2
  $B807  FB        .db $FB
  $B808  F0 F6     BEQ $B800

L_B80A:
  $B80A  F0 FE     BEQ $B80A
  $B80C  F0 06     BEQ $B814
  $B80E  F0 0E     BEQ $B81E
  $B810  F8        SED
  $B811  F0 F8     BEQ $B80B
  $B813  F8        SED

L_B814:
  $B814  F8        SED
  $B815  00        BRK
  $B816  F8        SED
  $B817  08        PHP
  $B818  F8        SED
  $B819  10 00     BPL $B81B

L_B81B:
  $B81B  F0 00     BEQ $B81D

L_B81D:
  $B81D  F8        SED

L_B81E:
  $B81E  00        BRK
  $B81F  00        BRK
  $B820  00        BRK
  $B821  08        PHP
  $B822  08        PHP
  $B823  F0 08     BEQ $B82D
  $B825  F8        SED
  $B826  08        PHP
  $B827  00        BRK
  $B828  08        PHP
  $B829  08        PHP
  $B82A  F4        .db $F4
  $B82B  FB        .db $FB
  $B82C  F0 F6     BEQ $B824

L_B82E:
  $B82E  F0 FE     BEQ $B82E
  $B830  F0 06     BEQ $B838
  $B832  F0 0E     BEQ $B842
  $B834  F8        SED
  $B835  F0 F8     BEQ $B82F
  $B837  F8        SED

L_B838:
  $B838  F8        SED
  $B839  00        BRK
  $B83A  F8        SED
  $B83B  08        PHP
  $B83C  F8        SED
  $B83D  10 00     BPL $B83F

L_B83F:
  $B83F  F0 00     BEQ $B841

L_B841:
  $B841  F8        SED

L_B842:
  $B842  00        BRK

L_B843:
  $B843  00        BRK
  $B844  00        BRK
  $B845  08        PHP
  $B846  08        PHP
  $B847  F5 08     SBC $08,X
  $B849  FD 08 05  SBC $0508,X
  $B84C  10 F5     BPL $B843
  $B84E  10 05     BPL $B855
  $B850  F4        .db $F4
  $B851  FB        .db $FB

L_B852:
  $B852  F0 F4     BEQ $B848
  $B854  F0 FC     BEQ $B852
  $B856  F0 04     BEQ $B85C
  $B858  F8        SED
  $B859  F0 F8     BEQ $B853
  $B85B  F8        SED

L_B85C:
  $B85C  F8        SED
  $B85D  00        BRK
  $B85E  F8        SED
  $B85F  08        PHP
  $B860  FF        .db $FF
  $B861  E8        INX
  $B862  00        BRK
  $B863  F0 00     BEQ $B865

L_B865:
  $B865  F8        SED
  $B866  00        BRK
  $B867  00        BRK
  $B868  00        BRK
  $B869  08        PHP
  $B86A  08        PHP
  $B86B  F0 08     BEQ $B875
  $B86D  F8        SED
  $B86E  08        PHP
  $B86F  00        BRK
  $B870  08        PHP
  $B871  08        PHP
  $B872  F4        .db $F4
  $B873  F9 F4 F8  SBC $F8F4,Y
  $B876  F4        .db $F4

L_B877:
  $B877  00        BRK
  $B878  FC        .db $FC
  $B879  F0 FC     BEQ $B877
  $B87B  F8        SED
  $B87C  FC        .db $FC
  $B87D  00        BRK
  $B87E  FC        .db $FC
  $B87F  08        PHP
  $B880  04        .db $04
  $B881  F0 04     BEQ $B887
  $B883  F8        SED
  $B884  04        .db $04
  $B885  00        BRK
  $B886  04        .db $04

L_B887:
  $B887  08        PHP
  $B888  F9 FA F4  SBC $F4FA,Y
  $B88B  08        PHP
  $B88C  EC F0 EC  CPX $ECF0
  $B88F  F8        SED
  $B890  F4        .db $F4
  $B891  F0 F4     BEQ $B887
  $B893  F8        SED
  $B894  F4        .db $F4

L_B895:
  $B895  00        BRK
  $B896  FC        .db $FC
  $B897  F0 FC     BEQ $B895
  $B899  F8        SED
  $B89A  FC        .db $FC
  $B89B  00        BRK
  $B89C  04        .db $04

L_B89D:
  $B89D  F0 04     BEQ $B8A3
  $B89F  F8        SED
  $B8A0  04        .db $04
  $B8A1  00        BRK
  $B8A2  04        .db $04

L_B8A3:
  $B8A3  08        PHP
  $B8A4  F9 F9 F4  SBC $F4F9,Y
  $B8A7  F0 F4     BEQ $B89D
  $B8A9  F8        SED
  $B8AA  F4        .db $F4
  $B8AB  00        BRK
  $B8AC  F4        .db $F4

L_B8AD:
  $B8AD  08        PHP
  $B8AE  FC        .db $FC
  $B8AF  F0 FC     BEQ $B8AD
  $B8B1  F8        SED
  $B8B2  FC        .db $FC
  $B8B3  00        BRK
  $B8B4  FC        .db $FC
  $B8B5  08        PHP
  $B8B6  04        .db $04
  $B8B7  F0 04     BEQ $B8BD
  $B8B9  F8        SED
  $B8BA  04        .db $04
  $B8BB  00        BRK
  $B8BC  04        .db $04

L_B8BD:
  $B8BD  08        PHP
  $B8BE  F9 FC F4  SBC $F4FC,Y
  $B8C1  EE F4 F6  INC $F6F4
  $B8C4  F4        .db $F4
  $B8C5  FE F4 06  INC $06F4,X
  $B8C8  FC        .db $FC
  $B8C9  EE FC F6  INC $F6FC
  $B8CC  FC        .db $FC
  $B8CD  FE FC 06  INC $06FC,X
  $B8D0  04        .db $04
  $B8D1  F8        SED
  $B8D2  04        .db $04
  $B8D3  00        BRK
  $B8D4  04        .db $04
  $B8D5  08        PHP
  $B8D6  0C        .db $0C
  $B8D7  F8        SED
  $B8D8  0C        .db $0C
  $B8D9  00        BRK
  $B8DA  F9 FA F4  SBC $F4FA,Y
  $B8DD  F6 F4     INC $F4,X
  $B8DF  FE F4 06  INC $06F4,X
  $B8E2  FC        .db $FC
  $B8E3  F6 FC     INC $FC,X
  $B8E5  FE FC 06  INC $06FC,X
  $B8E8  04        .db $04
  $B8E9  F6 04     INC $04,X
  $B8EB  FE 04 06  INC $0604,X
  $B8EE  0C        .db $0C
  $B8EF  F6 0C     INC $0C,X
  $B8F1  FE F9 FB  INC $FBF9,X
  $B8F4  F4        .db $F4
  $B8F5  F8        SED
  $B8F6  F4        .db $F4
  $B8F7  00        BRK
  $B8F8  FC        .db $FC
  $B8F9  F8        SED
  $B8FA  FC        .db $FC
  $B8FB  00        BRK
  $B8FC  FC        .db $FC
  $B8FD  08        PHP
  $B8FE  04        .db $04
  $B8FF  F8        SED
  $B900  04        .db $04
  $B901  00        BRK
  $B902  04        .db $04
  $B903  08        PHP
  $B904  0C        .db $0C
  $B905  F8        SED
  $B906  0C        .db $0C
  $B907  00        BRK
  $B908  0C        .db $0C
  $B909  08        PHP
  $B90A  06 F0     ASL $F0
  $B90C  FD FA EC  SBC $ECFA,X
  $B90F  FE F4 F8  INC $F8F4,X
  $B912  F4        .db $F4
  $B913  00        BRK
  $B914  FC        .db $FC
  $B915  FA        .db $FA
  $B916  FC        .db $FC
  $B917  02        .db $02
  $B918  04        .db $04
  $B919  FA        .db $FA
  $B91A  04        .db $04
  $B91B  02        .db $02
  $B91C  F8        SED
  $B91D  FA        .db $FA
  $B91E  F4        .db $F4
  $B91F  F8        SED
  $B920  F4        .db $F4
  $B921  00        BRK
  $B922  FC        .db $FC
  $B923  F6 FC     INC $FC,X

L_B925:
  $B925  FE FC 06  INC $06FC,X
  $B928  04        .db $04
  $B929  F6 04     INC $04,X
  $B92B  FE 04 06  INC $0604,X
  $B92E  F9 FA F0  SBC $F0FA,Y

L_B931:
  $B931  F8        SED
  $B932  F0 00     BEQ $B934

L_B934:
  $B934  F0 08     BEQ $B93E
  $B936  F8        SED
  $B937  F0 F8     BEQ $B931
  $B939  F8        SED
  $B93A  F8        SED
  $B93B  00        BRK
  $B93C  F8        SED
  $B93D  08        PHP

L_B93E:
  $B93E  00        BRK
  $B93F  F0 00     BEQ $B941

L_B941:
  $B941  F8        SED

L_B942:
  $B942  00        BRK
  $B943  00        BRK
  $B944  00        BRK

L_B945:
  $B945  08        PHP
  $B946  08        PHP
  $B947  F0 08     BEQ $B951
  $B949  F8        SED
  $B94A  08        PHP
  $B94B  00        BRK
  $B94C  08        PHP
  $B94D  08        PHP
  $B94E  F7        .db $F7
  $B94F  FA        .db $FA
  $B950  F0 F0     BEQ $B942
  $B952  C0 F0     CPY #$F0

L_B954:
  $B954  C0 F8     CPY #$F8
  $B956  C0 00     CPY #$00
  $B958  C0 08     CPY #$08
  $B95A  C8        INY
  $B95B  F0 C8     BEQ $B925
  $B95D  F8        SED

L_B95E:
  $B95E  C8        INY
  $B95F  00        BRK
  $B960  C8        INY
  $B961  08        PHP
  $B962  D0 F0     BNE $B954
  $B964  D0 F8     BNE $B95E
  $B966  D0 00     BNE $B968

L_B968:
  $B968  D0 08     BNE $B972
  $B96A  D8        CLD
  $B96B  F0 D8     BEQ $B945
  $B96D  F8        SED
  $B96E  D8        CLD
  $B96F  00        BRK
  $B970  D8        CLD
  $B971  08        PHP

L_B972:
  $B972  E0 F0     CPX #$F0
  $B974  E0 F8     CPX #$F8
  $B976  E0 00     CPX #$00
  $B978  E0 08     CPX #$08
  $B97A  E8        INX
  $B97B  F0 E8     BEQ $B965
  $B97D  F8        SED
  $B97E  E8        INX
  $B97F  00        BRK
  $B980  E8        INX
  $B981  08        PHP
  $B982  F0 F8     BEQ $B97C
  $B984  F0 00     BEQ $B986

L_B986:
  $B986  F0 08     BEQ $B990
  $B988  F8        SED
  $B989  F0 F8     BEQ $B983
  $B98B  F8        SED
  $B98C  F8        SED
  $B98D  00        BRK
  $B98E  F8        SED
  $B98F  08        PHP

L_B990:
  $B990  00        BRK
  $B991  F0 00     BEQ $B993

L_B993:
  $B993  F8        SED
  $B994  00        BRK
  $B995  00        BRK
  $B996  00        BRK
  $B997  08        PHP
  $B998  08        PHP
  $B999  F0 08     BEQ $B9A3
  $B99B  F8        SED

L_B99C:
  $B99C  08        PHP
  $B99D  00        BRK
  $B99E  08        PHP
  $B99F  08        PHP
  $B9A0  F8        SED
  $B9A1  FA        .db $FA
  $B9A2  F0 F8     BEQ $B99C
  $B9A4  F0 00     BEQ $B9A6

L_B9A6:
  $B9A6  F0 08     BEQ $B9B0
  $B9A8  F8        SED
  $B9A9  F0 F8     BEQ $B9A3
  $B9AB  F8        SED
  $B9AC  F8        SED
  $B9AD  00        BRK
  $B9AE  F8        SED
  $B9AF  08        PHP

L_B9B0:
  $B9B0  00        BRK
  $B9B1  F5 00     SBC $00,X
  $B9B3  FD 00 05  SBC $0500,X
  $B9B6  08        PHP
  $B9B7  F0 08     BEQ $B9C1
  $B9B9  F8        SED

L_B9BA:
  $B9BA  08        PHP
  $B9BB  00        BRK
  $B9BC  08        PHP
  $B9BD  08        PHP
  $B9BE  F8        SED

L_B9BF:
  $B9BF  FA        .db $FA
  $B9C0  F0 F8     BEQ $B9BA
  $B9C2  F0 00     BEQ $B9C4

L_B9C4:
  $B9C4  F8        SED
  $B9C5  F0 F8     BEQ $B9BF
  $B9C7  F8        SED

L_B9C8:
  $B9C8  F8        SED
  $B9C9  00        BRK
  $B9CA  F8        SED
  $B9CB  08        PHP
  $B9CC  00        BRK
  $B9CD  F0 00     BEQ $B9CF

L_B9CF:
  $B9CF  F8        SED
  $B9D0  00        BRK
  $B9D1  00        BRK

L_B9D2:
  $B9D2  00        BRK
  $B9D3  08        PHP
  $B9D4  08        PHP
  $B9D5  F0 08     BEQ $B9DF
  $B9D7  F8        SED
  $B9D8  08        PHP
  $B9D9  00        BRK
  $B9DA  08        PHP
  $B9DB  08        PHP

L_B9DC:
  $B9DC  FB        .db $FB
  $B9DD  FB        .db $FB
  $B9DE  F0 E8     BEQ $B9C8
  $B9E0  F0 F0     BEQ $B9D2
  $B9E2  F0 F8     BEQ $B9DC
  $B9E4  F0 00     BEQ $B9E6

L_B9E6:
  $B9E6  F0 08     BEQ $B9F0
  $B9E8  F8        SED
  $B9E9  F0 F8     BEQ $B9E3
  $B9EB  F8        SED
  $B9EC  F8        SED
  $B9ED  00        BRK
  $B9EE  F8        SED
  $B9EF  08        PHP

L_B9F0:
  $B9F0  00        BRK
  $B9F1  F1 00     SBC ($00),Y
  $B9F3  F9 00 01  SBC $0100,Y
  $B9F6  08        PHP
  $B9F7  F0 08     BEQ $BA01
  $B9F9  F8        SED
  $B9FA  08        PHP
  $B9FB  00        BRK
  $B9FC  08        PHP

L_B9FD:
  $B9FD  08        PHP
  $B9FE  F8        SED
  $B9FF  F8        SED
  $BA00  E8        INX

L_BA01:
  $BA01  E8        INX
  $BA02  E8        INX
  $BA03  F0 F0     BEQ $B9F5
  $BA05  E8        INX
  $BA06  F0 F0     BEQ $B9F8

L_BA08:
  $BA08  E8        INX
  $BA09  08        PHP
  $BA0A  E8        INX
  $BA0B  10 F0     BPL $B9FD
  $BA0D  08        PHP
  $BA0E  F0 10     BEQ $BA20
  $BA10  08        PHP
  $BA11  E8        INX
  $BA12  08        PHP
  $BA13  F0 10     BEQ $BA25
  $BA15  E8        INX
  $BA16  10 F0     BPL $BA08
  $BA18  08        PHP
  $BA19  08        PHP
  $BA1A  08        PHP
  $BA1B  10 10     BPL $BA2D
  $BA1D  08        PHP
  $BA1E  10 10     BPL $BA30

L_BA20:
  $BA20  00        BRK
  $BA21  E4 00     CPX $00
  $BA23  EC 08 E4  CPX $E408
  $BA26  08        PHP
  $BA27  EC E4 F0  CPX $F0E4
  $BA2A  E4 F8     CPX $F8
  $BA2C  EC F0 EC  CPX $ECF0
  $BA2F  F8        SED

L_BA30:
  $BA30  0C        .db $0C
  $BA31  00        BRK
  $BA32  0C        .db $0C
  $BA33  08        PHP
  $BA34  14        .db $14
  $BA35  00        BRK
  $BA36  14        .db $14
  $BA37  08        PHP
  $BA38  F0 0C     BEQ $BA46
  $BA3A  F0 14     BEQ $BA50
  $BA3C  F8        SED
  $BA3D  0C        .db $0C
  $BA3E  F8        SED
  $BA3F  14        .db $14
  $BA40  F8        SED
  $BA41  E2        .db $E2
  $BA42  F8        SED
  $BA43  EA        NOP
  $BA44  00        BRK
  $BA45  E2        .db $E2

L_BA46:
  $BA46  00        BRK
  $BA47  EA        NOP
  $BA48  E2        .db $E2
  $BA49  F8        SED
  $BA4A  E2        .db $E2
  $BA4B  00        BRK
  $BA4C  EA        NOP
  $BA4D  F8        SED
  $BA4E  EA        NOP
  $BA4F  00        BRK

L_BA50:
  $BA50  0E F8 0E  ASL $0EF8
  $BA53  00        BRK
  $BA54  16 F8     ASL $F8,X
  $BA56  16 00     ASL $00,X
  $BA58  F8        SED
  $BA59  0E F8 16  ASL $16F8
  $BA5C  00        BRK
  $BA5D  0E 00 16  ASL $1600
  $BA60  F0 E4     BEQ $BA46
  $BA62  F0 EC     BEQ $BA50
  $BA64  F8        SED
  $BA65  E4 F8     CPX $F8
  $BA67  EC E4 00  CPX $00E4
  $BA6A  E4 08     CPX $08
  $BA6C  EC 00 EC  CPX $EC00
  $BA6F  08        PHP
  $BA70  0C        .db $0C
  $BA71  F0 0C     BEQ $BA7F
  $BA73  F8        SED
  $BA74  14        .db $14
  $BA75  F0 14     BEQ $BA8B
  $BA77  F8        SED
  $BA78  00        BRK
  $BA79  0C        .db $0C
  $BA7A  00        BRK

L_BA7B:
  $BA7B  14        .db $14
  $BA7C  08        PHP
  $BA7D  0C        .db $0C
  $BA7E  08        PHP

L_BA7F:
  $BA7F  14        .db $14
  $BA80  D0 E7     BNE $BA69
  $BA82  D0 F7     BNE $BA7B
  $BA84  D8        CLD
  $BA85  DF        .db $DF
  $BA86  D8        CLD
  $BA87  E7        .db $E7
  $BA88  D8        CLD
  $BA89  EF        .db $EF
  $BA8A  D8        CLD

L_BA8B:
  $BA8B  F7        .db $F7
  $BA8C  E0 DF     CPX #$DF
  $BA8E  E0 E7     CPX #$E7
  $BA90  E0 EF     CPX #$EF
  $BA92  E0 F7     CPX #$F7
  $BA94  E8        INX
  $BA95  DF        .db $DF
  $BA96  E8        INX
  $BA97  E7        .db $E7

L_BA98:
  $BA98  E8        INX
  $BA99  F8        SED
  $BA9A  DF        .db $DF
  $BA9B  E3        .db $E3
  $BA9C  DF        .db $DF
  $BA9D  EB        .db $EB
  $BA9E  DF        .db $DF
  $BA9F  F3        .db $F3
  $BAA0  E7        .db $E7
  $BAA1  DB        .db $DB

L_BAA2:
  $BAA2  E7        .db $E7
  $BAA3  E3        .db $E3
  $BAA4  E7        .db $E7
  $BAA5  EB        .db $EB
  $BAA6  E7        .db $E7
  $BAA7  F3        .db $F3
  $BAA8  EF        .db $EF
  $BAA9  E3        .db $E3
  $BAAA  EF        .db $EF
  $BAAB  EB        .db $EB

L_BAAC:
  $BAAC  E8        INX
  $BAAD  F8        SED
  $BAAE  00        BRK
  $BAAF  F8        SED
  $BAB0  00        BRK
  $BAB1  00        BRK
  $BAB2  08        PHP
  $BAB3  D8        CLD
  $BAB4  08        PHP
  $BAB5  E0 08     CPX #$08
  $BAB7  E8        INX
  $BAB8  08        PHP
  $BAB9  F0 08     BEQ $BAC3
  $BABB  F8        SED
  $BABC  08        PHP
  $BABD  00        BRK
  $BABE  10 D8     BPL $BA98

L_BAC0:
  $BAC0  10 E0     BPL $BAA2
  $BAC2  10 E8     BPL $BAAC
  $BAC4  10 F0     BPL $BAB6
  $BAC6  10 F8     BPL $BAC0
  $BAC8  00        BRK
  $BAC9  F8        SED

L_BACA:
  $BACA  00        BRK
  $BACB  00        BRK
  $BACC  08        PHP
  $BACD  F8        SED
  $BACE  08        PHP
  $BACF  00        BRK
  $BAD0  10 F8     BPL $BACA
  $BAD2  10 00     BPL $BAD4

L_BAD4:
  $BAD4  18        CLC
  $BAD5  E8        INX
  $BAD6  18        CLC
  $BAD7  F0 18     BEQ $BAF1
  $BAD9  F8        SED
  $BADA  20 E8 20  JSR $20E8
  $BADD  F0 28     BEQ $BB07
  $BADF  E8        INX
  $BAE0  28        PLP
  $BAE1  F0 F8     BEQ $BADB
  $BAE3  FC        .db $FC
  $BAE4  F4        .db $F4
  $BAE5  18        CLC
  $BAE6  FC        .db $FC
  $BAE7  18        CLC
  $BAE8  04        .db $04
  $BAE9  10 0C     BPL $BAF7
  $BAEB  08        PHP
  $BAEC  0C        .db $0C
  $BAED  10 14     BPL $BB03
  $BAEF  F0 14     BEQ $BB05

L_BAF1:
  $BAF1  F8        SED
  $BAF2  14        .db $14
  $BAF3  00        BRK
  $BAF4  14        .db $14
  $BAF5  08        PHP
  $BAF6  14        .db $14

L_BAF7:
  $BAF7  10 1C     BPL $BB15
  $BAF9  F0 1C     BEQ $BB17
  $BAFB  F8        SED
  $BAFC  1C        .db $1C
  $BAFD  00        BRK
  $BAFE  1C        .db $1C
  $BAFF  08        PHP
  $BB00  F8        SED
  $BB01  FC        .db $FC
  $BB02  F4        .db $F4

L_BB03:
  $BB03  18        CLC
  $BB04  FC        .db $FC

L_BB05:
  $BB05  18        CLC
  $BB06  04        .db $04

L_BB07:
  $BB07  10 0C     BPL $BB15
  $BB09  0F        .db $0F
  $BB0A  14        .db $14
  $BB0B  F6 14     INC $14,X
  $BB0D  08        PHP
  $BB0E  14        .db $14
  $BB0F  10 1C     BPL $BB2D
  $BB11  F0 1C     BEQ $BB2F
  $BB13  F8        SED
  $BB14  1C        .db $1C

L_BB15:
  $BB15  00        BRK
  $BB16  1C        .db $1C

L_BB17:
  $BB17  08        PHP
  $BB18  24 F0     BIT $F0
  $BB1A  24 F8     BIT $F8
  $BB1C  24 00     BIT $00
  $BB1E  24 08     BIT $08
  $BB20  FC        .db $FC
  $BB21  F3        .db $F3
  $BB22  FC        .db $FC
  $BB23  FB        .db $FB
  $BB24  FC        .db $FC
  $BB25  03        .db $03
  $BB26  04        .db $04
  $BB27  F0 04     BEQ $BB2D
  $BB29  F8        SED
  $BB2A  04        .db $04
  $BB2B  00        BRK
  $BB2C  04        .db $04

L_BB2D:
  $BB2D  08        PHP
  $BB2E  FC        .db $FC

L_BB2F:
  $BB2F  F8        SED
  $BB30  FC        .db $FC
  $BB31  00        BRK
  $BB32  04        .db $04
  $BB33  F8        SED
  $BB34  04        .db $04
  $BB35  00        BRK
  $BB36  FF        .db $FF
  $BB37  FF        .db $FF
  $BB38  FF        .db $FF
  $BB39  FF        .db $FF
  $BB3A  FF        .db $FF
  $BB3B  FF        .db $FF
  $BB3C  FF        .db $FF
  $BB3D  FF        .db $FF
  $BB3E  FF        .db $FF
  $BB3F  FF        .db $FF
  $BB40  FF        .db $FF
  $BB41  FF        .db $FF
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
  $BC00  FF        .db $FF
  $BC01  FF        .db $FF
  $BC02  FF        .db $FF
  $BC03  FF        .db $FF
  $BC04  FF        .db $FF
  $BC05  FF        .db $FF
  $BC06  FF        .db $FF
  $BC07  FF        .db $FF
  $BC08  FF        .db $FF
  $BC09  FF        .db $FF
  $BC0A  FF        .db $FF
  $BC0B  FF        .db $FF
  $BC0C  FF        .db $FF
  $BC0D  FF        .db $FF
  $BC0E  FF        .db $FF
  $BC0F  FF        .db $FF
  $BC10  FF        .db $FF
  $BC11  FF        .db $FF
  $BC12  FF        .db $FF
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
  $BE00  FF        .db $FF
  $BE01  FF        .db $FF
  $BE02  FF        .db $FF
  $BE03  FF        .db $FF
  $BE04  FF        .db $FF
  $BE05  FF        .db $FF
  $BE06  FF        .db $FF
  $BE07  FF        .db $FF
  $BE08  FF        .db $FF
  $BE09  FF        .db $FF
  $BE0A  FF        .db $FF
  $BE0B  FF        .db $FF
  $BE0C  FF        .db $FF
  $BE0D  FF        .db $FF
  $BE0E  FF        .db $FF
  $BE0F  FF        .db $FF
  $BE10  FF        .db $FF
  $BE11  FF        .db $FF
  $BE12  FF        .db $FF
  $BE13  FF        .db $FF
  $BE14  FF        .db $FF
  $BE15  FF        .db $FF
  $BE16  FF        .db $FF
  $BE17  FF        .db $FF
  $BE18  FF        .db $FF
  $BE19  FF        .db $FF
  $BE1A  FF        .db $FF
  $BE1B  FF        .db $FF
  $BE1C  FF        .db $FF
  $BE1D  FF        .db $FF
  $BE1E  FF        .db $FF
  $BE1F  FF        .db $FF
  $BE20  FF        .db $FF
  $BE21  FF        .db $FF
  $BE22  FF        .db $FF
  $BE23  FF        .db $FF
  $BE24  FF        .db $FF
  $BE25  FF        .db $FF
  $BE26  FF        .db $FF
  $BE27  FF        .db $FF
  $BE28  FF        .db $FF
  $BE29  FF        .db $FF
  $BE2A  FF        .db $FF
  $BE2B  FF        .db $FF
  $BE2C  FF        .db $FF
  $BE2D  FF        .db $FF
  $BE2E  FF        .db $FF
  $BE2F  FF        .db $FF
  $BE30  FF        .db $FF
  $BE31  FF        .db $FF
  $BE32  FF        .db $FF
  $BE33  FF        .db $FF
  $BE34  FF        .db $FF
  $BE35  FF        .db $FF
  $BE36  FF        .db $FF
  $BE37  FF        .db $FF
  $BE38  FF        .db $FF
  $BE39  FF        .db $FF
  $BE3A  FF        .db $FF
  $BE3B  FF        .db $FF
  $BE3C  FF        .db $FF
  $BE3D  FF        .db $FF
  $BE3E  FF        .db $FF
  $BE3F  FF        .db $FF
  $BE40  FF        .db $FF
  $BE41  FF        .db $FF
  $BE42  FF        .db $FF
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