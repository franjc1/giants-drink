; Mega Man 2 — PRG Bank 8
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
  $8008  00        BRK
  $8009  00        BRK

L_800A:
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
  $8040  00        BRK
  $8041  44        .db $44
  $8042  0A        ASL
  $8043  16 2E     ASL $2E,X
  $8045  5E 3E 00  LSR $003E,X
  $8048  FE FE FE  INC $FEFE,X
  $804B  FE FE FE  INC $FEFE,X
  $804E  FE 00 00  INC $0000,X
  $8051  44        .db $44
  $8052  0A        ASL
  $8053  16 2E     ASL $2E,X
  $8055  5E 3E 00  LSR $003E,X
  $8058  FE FE FE  INC $FEFE,X
  $805B  FE FE FE  INC $FEFE,X
  $805E  FE 00 00  INC $0000,X
  $8061  44        .db $44
  $8062  0A        ASL
  $8063  16 2E     ASL $2E,X

L_8065:
  $8065  5E 3E 00  LSR $003E,X
  $8068  FE FE FE  INC $FEFE,X
  $806B  FE FE FE  INC $FEFE,X
  $806E  FE 00 00  INC $0000,X
  $8071  44        .db $44
  $8072  0A        ASL
  $8073  16 2E     ASL $2E,X
  $8075  5E 3E 00  LSR $003E,X
  $8078  FE FE FE  INC $FEFE,X
  $807B  FE FE FE  INC $FEFE,X
  $807E  FE 00 7F  INC $7F00,X
  $8081  FF        .db $FF
  $8082  FF        .db $FF
  $8083  F0 E0     BEQ $8065
  $8085  E0 E0     CPX #$E0
  $8087  E0 00     CPX #$00
  $8089  00        BRK
  $808A  00        BRK
  $808B  00        BRK
  $808C  00        BRK
  $808D  00        BRK
  $808E  00        BRK
  $808F  00        BRK
  $8090  E0 E0     CPX #$E0
  $8092  E0 E0     CPX #$E0
  $8094  E0 E0     CPX #$E0
  $8096  E0 E0     CPX #$E0
  $8098  00        BRK
  $8099  00        BRK
  $809A  00        BRK
  $809B  00        BRK
  $809C  00        BRK
  $809D  00        BRK
  $809E  00        BRK
  $809F  00        BRK
  $80A0  FF        .db $FF
  $80A1  FF        .db $FF
  $80A2  FF        .db $FF
  $80A3  00        BRK
  $80A4  00        BRK
  $80A5  00        BRK
  $80A6  00        BRK
  $80A7  00        BRK
  $80A8  00        BRK
  $80A9  00        BRK
  $80AA  00        BRK
  $80AB  00        BRK
  $80AC  00        BRK
  $80AD  00        BRK
  $80AE  00        BRK
  $80AF  00        BRK
  $80B0  00        BRK
  $80B1  00        BRK
  $80B2  00        BRK
  $80B3  00        BRK
  $80B4  00        BRK
  $80B5  00        BRK
  $80B6  00        BRK
  $80B7  00        BRK
  $80B8  00        BRK
  $80B9  00        BRK
  $80BA  00        BRK
  $80BB  00        BRK
  $80BC  00        BRK
  $80BD  00        BRK
  $80BE  00        BRK
  $80BF  00        BRK
  $80C0  FF        .db $FF
  $80C1  FF        .db $FF
  $80C2  FF        .db $FF
  $80C3  00        BRK
  $80C4  00        BRK
  $80C5  00        BRK
  $80C6  00        BRK
  $80C7  00        BRK
  $80C8  00        BRK
  $80C9  00        BRK
  $80CA  00        BRK
  $80CB  00        BRK
  $80CC  00        BRK
  $80CD  00        BRK
  $80CE  00        BRK
  $80CF  00        BRK
  $80D0  00        BRK
  $80D1  00        BRK
  $80D2  00        BRK
  $80D3  00        BRK
  $80D4  00        BRK
  $80D5  00        BRK
  $80D6  00        BRK
  $80D7  00        BRK
  $80D8  00        BRK
  $80D9  00        BRK
  $80DA  00        BRK
  $80DB  00        BRK
  $80DC  00        BRK
  $80DD  00        BRK
  $80DE  00        BRK
  $80DF  00        BRK
  $80E0  FF        .db $FF
  $80E1  FF        .db $FF
  $80E2  FF        .db $FF
  $80E3  00        BRK
  $80E4  00        BRK
  $80E5  00        BRK
  $80E6  00        BRK
  $80E7  00        BRK
  $80E8  00        BRK
  $80E9  00        BRK
  $80EA  00        BRK
  $80EB  00        BRK
  $80EC  00        BRK
  $80ED  00        BRK
  $80EE  00        BRK
  $80EF  00        BRK
  $80F0  00        BRK
  $80F1  00        BRK
  $80F2  00        BRK
  $80F3  00        BRK
  $80F4  00        BRK
  $80F5  00        BRK
  $80F6  00        BRK
  $80F7  00        BRK
  $80F8  00        BRK
  $80F9  00        BRK
  $80FA  00        BRK
  $80FB  00        BRK
  $80FC  00        BRK
  $80FD  00        BRK
  $80FE  00        BRK
  $80FF  00        BRK
  $8100  F8        SED
  $8101  FC        .db $FC
  $8102  FC        .db $FC
  $8103  3C        .db $3C
  $8104  1C        .db $1C
  $8105  1C        .db $1C
  $8106  1C        .db $1C
  $8107  1C        .db $1C
  $8108  00        BRK
  $8109  00        BRK
  $810A  00        BRK
  $810B  00        BRK
  $810C  00        BRK
  $810D  00        BRK
  $810E  00        BRK
  $810F  00        BRK
  $8110  1C        .db $1C
  $8111  1C        .db $1C
  $8112  1C        .db $1C
  $8113  1C        .db $1C
  $8114  1C        .db $1C
  $8115  1C        .db $1C
  $8116  1C        .db $1C
  $8117  1C        .db $1C
  $8118  00        BRK
  $8119  00        BRK
  $811A  00        BRK
  $811B  00        BRK
  $811C  00        BRK
  $811D  00        BRK
  $811E  00        BRK
  $811F  00        BRK
  $8120  00        BRK
  $8121  44        .db $44
  $8122  0A        ASL
  $8123  16 2E     ASL $2E,X
  $8125  5E 3E 00  LSR $003E,X
  $8128  FE FE FE  INC $FEFE,X
  $812B  FE FE FE  INC $FEFE,X
  $812E  FE 00 E0  INC $E000,X
  $8131  F4        .db $F4
  $8132  FA        .db $FA
  $8133  F6 FE     INC $FE,X
  $8135  FE FE 00  INC $00FE,X
  $8138  FE FE FE  INC $FEFE,X
  $813B  FE FE FE  INC $FEFE,X
  $813E  FE 00 E0  INC $E000,X
  $8141  E0 F0     CPX #$F0
  $8143  FF        .db $FF
  $8144  FF        .db $FF
  $8145  7F        .db $7F
  $8146  00        BRK
  $8147  00        BRK
  $8148  00        BRK
  $8149  00        BRK
  $814A  00        BRK
  $814B  00        BRK
  $814C  00        BRK
  $814D  00        BRK
  $814E  00        BRK
  $814F  00        BRK
  $8150  00        BRK
  $8151  44        .db $44
  $8152  0A        ASL
  $8153  16 2E     ASL $2E,X
  $8155  5E 3E 00  LSR $003E,X
  $8158  FE FE FE  INC $FEFE,X
  $815B  FE FE FE  INC $FEFE,X
  $815E  FE 00 00  INC $0000,X
  $8161  00        BRK
  $8162  00        BRK
  $8163  FF        .db $FF
  $8164  FF        .db $FF
  $8165  FF        .db $FF
  $8166  00        BRK
  $8167  00        BRK
  $8168  00        BRK
  $8169  00        BRK
  $816A  00        BRK
  $816B  00        BRK
  $816C  00        BRK
  $816D  00        BRK
  $816E  00        BRK
  $816F  00        BRK
  $8170  FE FE FE  INC $FEFE,X
  $8173  7E 2E 5E  ROR $5E2E,X
  $8176  3E 00 FE  ROL $FE00,X
  $8179  FE FE FE  INC $FEFE,X
  $817C  FE FE FE  INC $FEFE,X
  $817F  00        BRK
  $8180  00        BRK
  $8181  00        BRK
  $8182  00        BRK
  $8183  FF        .db $FF
  $8184  FF        .db $FF
  $8185  FF        .db $FF
  $8186  00        BRK
  $8187  00        BRK
  $8188  00        BRK
  $8189  00        BRK
  $818A  00        BRK
  $818B  00        BRK
  $818C  00        BRK
  $818D  00        BRK
  $818E  00        BRK
  $818F  00        BRK
  $8190  FE FE FE  INC $FEFE,X
  $8193  FE 2E 5E  INC $5E2E,X
  $8196  3E 00 FE  ROL $FE00,X
  $8199  FE FE FE  INC $FEFE,X
  $819C  FE FE FE  INC $FEFE,X
  $819F  00        BRK
  $81A0  00        BRK
  $81A1  00        BRK
  $81A2  00        BRK
  $81A3  FF        .db $FF
  $81A4  FF        .db $FF
  $81A5  FF        .db $FF
  $81A6  00        BRK
  $81A7  00        BRK
  $81A8  00        BRK
  $81A9  00        BRK
  $81AA  00        BRK
  $81AB  00        BRK
  $81AC  00        BRK
  $81AD  00        BRK
  $81AE  00        BRK
  $81AF  00        BRK
  $81B0  FE FE FE  INC $FEFE,X
  $81B3  FE 2E 5E  INC $5E2E,X
  $81B6  3E 00 FE  ROL $FE00,X
  $81B9  FE FE FE  INC $FEFE,X
  $81BC  FE FE FE  INC $FEFE,X
  $81BF  00        BRK
  $81C0  1C        .db $1C
  $81C1  1C        .db $1C
  $81C2  3C        .db $3C
  $81C3  FC        .db $FC
  $81C4  FC        .db $FC
  $81C5  F8        SED
  $81C6  00        BRK
  $81C7  00        BRK
  $81C8  00        BRK
  $81C9  00        BRK
  $81CA  00        BRK
  $81CB  00        BRK
  $81CC  00        BRK
  $81CD  00        BRK
  $81CE  00        BRK
  $81CF  00        BRK
  $81D0  FE FE FE  INC $FEFE,X
  $81D3  FE 2E 5E  INC $5E2E,X

L_81D6:
  $81D6  3E 00 FE  ROL $FE00,X
  $81D9  FE FE FE  INC $FEFE,X
  $81DC  FE FE FE  INC $FEFE,X
  $81DF  00        BRK
  $81E0  F0 F4     BEQ $81D6
  $81E2  FA        .db $FA
  $81E3  F6 FE     INC $FE,X
  $81E5  FE FE 00  INC $00FE,X
  $81E8  FE FE FE  INC $FEFE,X
  $81EB  FE FE FE  INC $FEFE,X
  $81EE  FE 00 F0  INC $F000,X
  $81F1  F4        .db $F4
  $81F2  FA        .db $FA
  $81F3  F6 2E     INC $2E,X
  $81F5  5E 3E 00  LSR $003E,X
  $81F8  FE FE FE  INC $FEFE,X
  $81FB  FE FE FE  INC $FEFE,X
  $81FE  FE 00 E0  INC $E000,X
  $8201  E0 E0     CPX #$E0
  $8203  E0 E0     CPX #$E0
  $8205  E0 E0     CPX #$E0
  $8207  E0 00     CPX #$00
  $8209  00        BRK
  $820A  00        BRK
  $820B  00        BRK
  $820C  00        BRK
  $820D  00        BRK
  $820E  00        BRK
  $820F  00        BRK
  $8210  E0 E0     CPX #$E0
  $8212  E0 E0     CPX #$E0
  $8214  E0 E0     CPX #$E0
  $8216  E0 E0     CPX #$E0
  $8218  00        BRK
  $8219  00        BRK
  $821A  00        BRK
  $821B  00        BRK
  $821C  00        BRK
  $821D  00        BRK
  $821E  00        BRK
  $821F  00        BRK
  $8220  00        BRK
  $8221  00        BRK
  $8222  00        BRK
  $8223  00        BRK
  $8224  00        BRK
  $8225  00        BRK
  $8226  00        BRK
  $8227  00        BRK
  $8228  00        BRK
  $8229  00        BRK
  $822A  00        BRK
  $822B  00        BRK
  $822C  00        BRK
  $822D  00        BRK
  $822E  00        BRK
  $822F  00        BRK
  $8230  00        BRK
  $8231  00        BRK
  $8232  00        BRK
  $8233  00        BRK
  $8234  00        BRK
  $8235  00        BRK
  $8236  00        BRK
  $8237  00        BRK
  $8238  00        BRK
  $8239  00        BRK
  $823A  00        BRK
  $823B  00        BRK
  $823C  00        BRK
  $823D  00        BRK
  $823E  00        BRK
  $823F  00        BRK
  $8240  1C        .db $1C
  $8241  1C        .db $1C
  $8242  1C        .db $1C
  $8243  1C        .db $1C
  $8244  1C        .db $1C
  $8245  1C        .db $1C
  $8246  1C        .db $1C
  $8247  1C        .db $1C
  $8248  00        BRK
  $8249  00        BRK
  $824A  00        BRK
  $824B  00        BRK
  $824C  00        BRK
  $824D  00        BRK
  $824E  00        BRK
  $824F  00        BRK
  $8250  1C        .db $1C
  $8251  1C        .db $1C
  $8252  1C        .db $1C
  $8253  1C        .db $1C
  $8254  1C        .db $1C
  $8255  1C        .db $1C

L_8256:
  $8256  1C        .db $1C
  $8257  1C        .db $1C
  $8258  00        BRK
  $8259  00        BRK
  $825A  00        BRK
  $825B  00        BRK
  $825C  00        BRK
  $825D  00        BRK
  $825E  00        BRK
  $825F  00        BRK
  $8260  F0 F4     BEQ $8256
  $8262  FA        .db $FA
  $8263  F6 FE     INC $FE,X
  $8265  FE FE 00  INC $00FE,X
  $8268  FE FE FE  INC $FEFE,X
  $826B  FE FE FE  INC $FEFE,X
  $826E  FE 00 F0  INC $F000,X
  $8271  F4        .db $F4
  $8272  FA        .db $FA
  $8273  F6 FE     INC $FE,X
  $8275  FE FE 00  INC $00FE,X
  $8278  FE FE FE  INC $FEFE,X
  $827B  FE FE FE  INC $FEFE,X
  $827E  FE 00 00  INC $0000,X
  $8281  7F        .db $7F
  $8282  40        RTI
  $8283  40        RTI
  $8284  40        RTI
  $8285  40        RTI
  $8286  40        RTI
  $8287  40        RTI
  $8288  FF        .db $FF
  $8289  FF        .db $FF
  $828A  C0 C0     CPY #$C0
  $828C  C0 C0     CPY #$C0
  $828E  C0 C0     CPY #$C0
  $8290  40        RTI
  $8291  40        RTI
  $8292  40        RTI
  $8293  40        RTI
  $8294  40        RTI
  $8295  40        RTI
  $8296  40        RTI
  $8297  40        RTI
  $8298  C0 C0     CPY #$C0
  $829A  C0 C0     CPY #$C0
  $829C  C0 C0     CPY #$C0
  $829E  C0 C0     CPY #$C0
  $82A0  00        BRK
  $82A1  FF        .db $FF
  $82A2  00        BRK
  $82A3  00        BRK
  $82A4  00        BRK
  $82A5  00        BRK
  $82A6  00        BRK
  $82A7  00        BRK
  $82A8  FF        .db $FF
  $82A9  FF        .db $FF
  $82AA  00        BRK
  $82AB  00        BRK
  $82AC  00        BRK
  $82AD  00        BRK
  $82AE  00        BRK
  $82AF  00        BRK
  $82B0  00        BRK
  $82B1  00        BRK
  $82B2  00        BRK
  $82B3  00        BRK
  $82B4  00        BRK
  $82B5  00        BRK
  $82B6  00        BRK
  $82B7  00        BRK
  $82B8  00        BRK
  $82B9  00        BRK
  $82BA  00        BRK
  $82BB  00        BRK
  $82BC  00        BRK
  $82BD  00        BRK
  $82BE  00        BRK
  $82BF  00        BRK
  $82C0  00        BRK
  $82C1  FF        .db $FF
  $82C2  00        BRK
  $82C3  00        BRK
  $82C4  00        BRK
  $82C5  00        BRK
  $82C6  00        BRK
  $82C7  00        BRK
  $82C8  FF        .db $FF
  $82C9  FF        .db $FF
  $82CA  00        BRK
  $82CB  00        BRK
  $82CC  00        BRK
  $82CD  00        BRK
  $82CE  00        BRK
  $82CF  00        BRK
  $82D0  00        BRK
  $82D1  00        BRK
  $82D2  00        BRK
  $82D3  00        BRK
  $82D4  00        BRK
  $82D5  00        BRK
  $82D6  00        BRK
  $82D7  00        BRK
  $82D8  00        BRK
  $82D9  00        BRK
  $82DA  00        BRK
  $82DB  00        BRK
  $82DC  00        BRK
  $82DD  00        BRK
  $82DE  00        BRK
  $82DF  00        BRK
  $82E0  00        BRK
  $82E1  FF        .db $FF
  $82E2  00        BRK
  $82E3  00        BRK
  $82E4  00        BRK
  $82E5  00        BRK
  $82E6  00        BRK
  $82E7  00        BRK
  $82E8  FF        .db $FF
  $82E9  FF        .db $FF
  $82EA  00        BRK
  $82EB  00        BRK
  $82EC  00        BRK
  $82ED  00        BRK
  $82EE  00        BRK
  $82EF  00        BRK
  $82F0  00        BRK
  $82F1  00        BRK
  $82F2  00        BRK
  $82F3  00        BRK
  $82F4  00        BRK
  $82F5  00        BRK
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
  $8300  40        RTI
  $8301  40        RTI
  $8302  40        RTI
  $8303  40        RTI
  $8304  40        RTI
  $8305  40        RTI
  $8306  40        RTI
  $8307  40        RTI
  $8308  C0 C0     CPY #$C0
  $830A  C0 C0     CPY #$C0
  $830C  C0 C0     CPY #$C0
  $830E  C0 C0     CPY #$C0
  $8310  40        RTI
  $8311  40        RTI
  $8312  40        RTI
  $8313  40        RTI
  $8314  40        RTI
  $8315  40        RTI
  $8316  40        RTI
  $8317  40        RTI
  $8318  C0 C0     CPY #$C0
  $831A  C0 C0     CPY #$C0
  $831C  C0 C0     CPY #$C0
  $831E  C0 C0     CPY #$C0
  $8320  00        BRK
  $8321  00        BRK
  $8322  00        BRK
  $8323  00        BRK
  $8324  00        BRK
  $8325  00        BRK
  $8326  00        BRK
  $8327  00        BRK
  $8328  00        BRK
  $8329  00        BRK
  $832A  00        BRK
  $832B  00        BRK
  $832C  00        BRK
  $832D  00        BRK
  $832E  00        BRK
  $832F  00        BRK
  $8330  00        BRK
  $8331  00        BRK
  $8332  00        BRK
  $8333  00        BRK
  $8334  00        BRK
  $8335  00        BRK
  $8336  00        BRK
  $8337  00        BRK
  $8338  00        BRK
  $8339  00        BRK
  $833A  00        BRK
  $833B  00        BRK
  $833C  00        BRK
  $833D  00        BRK
  $833E  00        BRK
  $833F  00        BRK
  $8340  40        RTI
  $8341  C0 00     CPY #$00
  $8343  00        BRK
  $8344  00        BRK
  $8345  00        BRK
  $8346  00        BRK
  $8347  00        BRK
  $8348  C0 C0     CPY #$C0
  $834A  00        BRK
  $834B  00        BRK
  $834C  00        BRK
  $834D  00        BRK
  $834E  00        BRK
  $834F  00        BRK
  $8350  00        BRK
  $8351  00        BRK
  $8352  00        BRK
  $8353  00        BRK
  $8354  00        BRK
  $8355  00        BRK
  $8356  00        BRK
  $8357  00        BRK
  $8358  00        BRK
  $8359  00        BRK
  $835A  00        BRK
  $835B  00        BRK
  $835C  00        BRK
  $835D  00        BRK
  $835E  00        BRK
  $835F  00        BRK
  $8360  00        BRK
  $8361  00        BRK
  $8362  00        BRK
  $8363  00        BRK
  $8364  00        BRK
  $8365  00        BRK
  $8366  00        BRK
  $8367  00        BRK
  $8368  00        BRK
  $8369  00        BRK
  $836A  00        BRK
  $836B  00        BRK
  $836C  00        BRK
  $836D  00        BRK
  $836E  00        BRK
  $836F  00        BRK
  $8370  00        BRK
  $8371  00        BRK
  $8372  00        BRK
  $8373  00        BRK
  $8374  00        BRK
  $8375  00        BRK
  $8376  00        BRK
  $8377  00        BRK
  $8378  00        BRK
  $8379  00        BRK
  $837A  00        BRK
  $837B  00        BRK
  $837C  00        BRK
  $837D  00        BRK
  $837E  00        BRK
  $837F  00        BRK
  $8380  00        BRK
  $8381  00        BRK
  $8382  00        BRK
  $8383  00        BRK
  $8384  00        BRK
  $8385  00        BRK
  $8386  00        BRK
  $8387  00        BRK
  $8388  00        BRK
  $8389  00        BRK
  $838A  00        BRK
  $838B  00        BRK
  $838C  00        BRK
  $838D  00        BRK
  $838E  00        BRK
  $838F  00        BRK
  $8390  00        BRK
  $8391  00        BRK
  $8392  00        BRK
  $8393  00        BRK
  $8394  00        BRK
  $8395  00        BRK
  $8396  00        BRK
  $8397  00        BRK
  $8398  00        BRK
  $8399  00        BRK
  $839A  00        BRK
  $839B  00        BRK
  $839C  00        BRK
  $839D  00        BRK
  $839E  00        BRK
  $839F  00        BRK
  $83A0  00        BRK
  $83A1  00        BRK
  $83A2  00        BRK
  $83A3  00        BRK
  $83A4  00        BRK
  $83A5  00        BRK
  $83A6  00        BRK
  $83A7  00        BRK
  $83A8  00        BRK
  $83A9  00        BRK
  $83AA  00        BRK
  $83AB  00        BRK
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
  $83C1  00        BRK
  $83C2  00        BRK
  $83C3  00        BRK
  $83C4  00        BRK
  $83C5  00        BRK
  $83C6  00        BRK
  $83C7  00        BRK
  $83C8  00        BRK
  $83C9  00        BRK
  $83CA  00        BRK
  $83CB  00        BRK
  $83CC  00        BRK
  $83CD  00        BRK
  $83CE  00        BRK
  $83CF  00        BRK
  $83D0  00        BRK
  $83D1  00        BRK
  $83D2  00        BRK
  $83D3  00        BRK
  $83D4  00        BRK
  $83D5  00        BRK
  $83D6  00        BRK
  $83D7  00        BRK
  $83D8  00        BRK
  $83D9  00        BRK
  $83DA  00        BRK
  $83DB  00        BRK
  $83DC  00        BRK
  $83DD  00        BRK
  $83DE  00        BRK
  $83DF  00        BRK
  $83E0  00        BRK
  $83E1  00        BRK
  $83E2  00        BRK
  $83E3  00        BRK
  $83E4  00        BRK
  $83E5  00        BRK
  $83E6  00        BRK
  $83E7  00        BRK
  $83E8  00        BRK
  $83E9  00        BRK
  $83EA  00        BRK
  $83EB  00        BRK
  $83EC  00        BRK
  $83ED  00        BRK
  $83EE  00        BRK
  $83EF  00        BRK
  $83F0  00        BRK
  $83F1  00        BRK
  $83F2  00        BRK
  $83F3  00        BRK
  $83F4  00        BRK
  $83F5  00        BRK
  $83F6  00        BRK
  $83F7  00        BRK
  $83F8  00        BRK
  $83F9  00        BRK
  $83FA  00        BRK
  $83FB  00        BRK
  $83FC  00        BRK
  $83FD  00        BRK
  $83FE  00        BRK
  $83FF  00        BRK
  $8400  00        BRK
  $8401  7E 02 12  ROR $1202,X
  $8404  14        .db $14
  $8405  18        CLC
  $8406  10 20     BPL $8428
  $8408  00        BRK
  $8409  00        BRK
  $840A  00        BRK
  $840B  00        BRK
  $840C  00        BRK
  $840D  00        BRK
  $840E  00        BRK
  $840F  00        BRK
  $8410  00        BRK
  $8411  06 18     ASL $18
  $8413  68        PLA
  $8414  08        PHP
  $8415  08        PHP
  $8416  08        PHP
  $8417  08        PHP

L_8418:
  $8418  00        BRK
  $8419  00        BRK
  $841A  00        BRK
  $841B  00        BRK
  $841C  00        BRK
  $841D  00        BRK
  $841E  00        BRK
  $841F  00        BRK
  $8420  18        CLC
  $8421  7E 42 42  ROR $4242,X
  $8424  02        .db $02
  $8425  02        .db $02
  $8426  04        .db $04
  $8427  38        SEC

L_8428:
  $8428  00        BRK
  $8429  00        BRK
  $842A  00        BRK
  $842B  00        BRK
  $842C  00        BRK
  $842D  00        BRK
  $842E  00        BRK
  $842F  00        BRK
  $8430  00        BRK
  $8431  7C        .db $7C
  $8432  10 10     BPL $8444
  $8434  10 10     BPL $8446
  $8436  10 7C     BPL $84B4
  $8438  00        BRK
  $8439  00        BRK
  $843A  00        BRK
  $843B  00        BRK
  $843C  00        BRK
  $843D  00        BRK
  $843E  00        BRK
  $843F  00        BRK
  $8440  04        .db $04
  $8441  7E 0C 0C  ROR $0C0C,X

L_8444:
  $8444  14        .db $14
  $8445  14        .db $14

L_8446:
  $8446  64        .db $64
  $8447  04        .db $04
  $8448  00        BRK
  $8449  00        BRK
  $844A  00        BRK
  $844B  00        BRK
  $844C  00        BRK
  $844D  00        BRK
  $844E  00        BRK
  $844F  00        BRK
  $8450  20 7E 22  JSR $227E
  $8453  22        .db $22
  $8454  22        .db $22
  $8455  22        .db $22
  $8456  22        .db $22
  $8457  24 00     BIT $00
  $8459  00        BRK
  $845A  00        BRK
  $845B  00        BRK
  $845C  00        BRK
  $845D  00        BRK
  $845E  00        BRK
  $845F  00        BRK
  $8460  10 7E     BPL $84E0
  $8462  10 10     BPL $8474
  $8464  7E 08 08  ROR $0808,X
  $8467  08        PHP
  $8468  00        BRK
  $8469  00        BRK
  $846A  00        BRK
  $846B  00        BRK
  $846C  00        BRK
  $846D  00        BRK
  $846E  00        BRK
  $846F  00        BRK
  $8470  00        BRK
  $8471  3E 22 42  ROL $4222,X

L_8474:
  $8474  42        .db $42
  $8475  04        .db $04
  $8476  08        PHP
  $8477  70 00     BVS $8479

L_8479:
  $8479  00        BRK
  $847A  00        BRK
  $847B  00        BRK
  $847C  00        BRK
  $847D  00        BRK
  $847E  00        BRK
  $847F  00        BRK
  $8480  40        RTI
  $8481  7E 48 48  ROR $4848,X
  $8484  08        PHP
  $8485  08        PHP
  $8486  08        PHP
  $8487  10 00     BPL $8489

L_8489:
  $8489  00        BRK
  $848A  00        BRK
  $848B  00        BRK
  $848C  00        BRK
  $848D  00        BRK
  $848E  00        BRK
  $848F  00        BRK
  $8490  00        BRK
  $8491  7E 02 02  ROR $0202,X
  $8494  02        .db $02
  $8495  02        .db $02
  $8496  02        .db $02
  $8497  7E 00 00  ROR $0000,X
  $849A  00        BRK
  $849B  00        BRK
  $849C  00        BRK
  $849D  00        BRK
  $849E  00        BRK
  $849F  00        BRK
  $84A0  24 7E     BIT $7E
  $84A2  24 24     BIT $24
  $84A4  04        .db $04
  $84A5  04        .db $04
  $84A6  08        PHP
  $84A7  10 00     BPL $84A9

L_84A9:
  $84A9  00        BRK
  $84AA  00        BRK
  $84AB  00        BRK
  $84AC  00        BRK
  $84AD  00        BRK
  $84AE  00        BRK
  $84AF  00        BRK
  $84B0  00        BRK
  $84B1  72        .db $72
  $84B2  02        .db $02
  $84B3  72        .db $72

L_84B4:
  $84B4  02        .db $02
  $84B5  02        .db $02
  $84B6  04        .db $04
  $84B7  78        SEI
  $84B8  00        BRK
  $84B9  00        BRK
  $84BA  00        BRK
  $84BB  00        BRK
  $84BC  00        BRK
  $84BD  00        BRK
  $84BE  00        BRK
  $84BF  00        BRK
  $84C0  00        BRK
  $84C1  7E 02 04  ROR $0402,X
  $84C4  08        PHP
  $84C5  18        CLC
  $84C6  24 42     BIT $42
  $84C8  00        BRK
  $84C9  00        BRK
  $84CA  00        BRK
  $84CB  00        BRK
  $84CC  00        BRK
  $84CD  00        BRK
  $84CE  00        BRK
  $84CF  00        BRK
  $84D0  20 7E 22  JSR $227E
  $84D3  24 20     BIT $20
  $84D5  20 20 1E  JSR $1E20
  $84D8  00        BRK
  $84D9  00        BRK
  $84DA  00        BRK
  $84DB  00        BRK
  $84DC  00        BRK
  $84DD  00        BRK
  $84DE  00        BRK
  $84DF  00        BRK

L_84E0:
  $84E0  00        BRK
  $84E1  42        .db $42
  $84E2  22        .db $22
  $84E3  12        .db $12
  $84E4  04        .db $04
  $84E5  04        .db $04
  $84E6  08        PHP
  $84E7  10 00     BPL $84E9

L_84E9:
  $84E9  00        BRK
  $84EA  00        BRK
  $84EB  00        BRK
  $84EC  00        BRK
  $84ED  00        BRK
  $84EE  00        BRK
  $84EF  00        BRK
  $84F0  00        BRK
  $84F1  3E 22 52  ROL $5222,X
  $84F4  4A        LSR
  $84F5  04        .db $04
  $84F6  08        PHP
  $84F7  70 00     BVS $84F9

L_84F9:
  $84F9  00        BRK
  $84FA  00        BRK
  $84FB  00        BRK
  $84FC  00        BRK
  $84FD  00        BRK
  $84FE  00        BRK
  $84FF  00        BRK
  $8500  00        BRK
  $8501  0C        .db $0C
  $8502  30 08     BMI $850C
  $8504  7E 08 08  ROR $0808,X
  $8507  10 00     BPL $8509

L_8509:
  $8509  00        BRK
  $850A  00        BRK
  $850B  00        BRK

L_850C:
  $850C  00        BRK
  $850D  00        BRK
  $850E  00        BRK
  $850F  00        BRK
  $8510  00        BRK
  $8511  52        .db $52
  $8512  52        .db $52
  $8513  52        .db $52
  $8514  04        .db $04
  $8515  04        .db $04
  $8516  08        PHP
  $8517  10 00     BPL $8519

L_8519:
  $8519  00        BRK
  $851A  00        BRK
  $851B  00        BRK
  $851C  00        BRK
  $851D  00        BRK
  $851E  00        BRK
  $851F  00        BRK
  $8520  00        BRK
  $8521  3C        .db $3C
  $8522  00        BRK
  $8523  7E 08 08  ROR $0808,X
  $8526  08        PHP
  $8527  10 00     BPL $8529

L_8529:
  $8529  00        BRK
  $852A  00        BRK
  $852B  00        BRK
  $852C  00        BRK
  $852D  00        BRK
  $852E  00        BRK
  $852F  00        BRK
  $8530  00        BRK
  $8531  40        RTI
  $8532  40        RTI
  $8533  70 4C     BVS $8581
  $8535  42        .db $42
  $8536  40        RTI
  $8537  40        RTI
  $8538  00        BRK
  $8539  00        BRK
  $853A  00        BRK
  $853B  00        BRK
  $853C  00        BRK
  $853D  00        BRK
  $853E  00        BRK
  $853F  00        BRK
  $8540  00        BRK
  $8541  08        PHP
  $8542  7E 08 08  ROR $0808,X
  $8545  08        PHP
  $8546  08        PHP
  $8547  10 00     BPL $8549

L_8549:
  $8549  00        BRK
  $854A  00        BRK
  $854B  00        BRK
  $854C  00        BRK
  $854D  00        BRK
  $854E  00        BRK
  $854F  00        BRK
  $8550  00        BRK
  $8551  00        BRK
  $8552  3C        .db $3C
  $8553  00        BRK
  $8554  00        BRK
  $8555  00        BRK
  $8556  7E 00 00  ROR $0000,X
  $8559  00        BRK
  $855A  00        BRK
  $855B  00        BRK
  $855C  00        BRK
  $855D  00        BRK
  $855E  00        BRK
  $855F  00        BRK
  $8560  00        BRK
  $8561  7E 02 02  ROR $0202,X
  $8564  34        .db $34
  $8565  08        PHP
  $8566  14        .db $14
  $8567  62        .db $62
  $8568  00        BRK
  $8569  00        BRK
  $856A  00        BRK
  $856B  00        BRK
  $856C  00        BRK
  $856D  00        BRK
  $856E  00        BRK
  $856F  00        BRK
  $8570  10 7E     BPL $85F0
  $8572  02        .db $02
  $8573  04        .db $04
  $8574  18        CLC
  $8575  74        .db $74
  $8576  12        .db $12
  $8577  10 00     BPL $8579

L_8579:
  $8579  00        BRK
  $857A  00        BRK
  $857B  00        BRK
  $857C  00        BRK
  $857D  00        BRK
  $857E  00        BRK
  $857F  00        BRK
  $8580  00        BRK

L_8581:
  $8581  04        .db $04
  $8582  04        .db $04
  $8583  08        PHP
  $8584  08        PHP
  $8585  10 20     BPL $85A7
  $8587  40        RTI
  $8588  00        BRK
  $8589  00        BRK
  $858A  00        BRK
  $858B  00        BRK
  $858C  00        BRK
  $858D  00        BRK
  $858E  00        BRK
  $858F  00        BRK
  $8590  00        BRK
  $8591  08        PHP
  $8592  08        PHP
  $8593  04        .db $04
  $8594  24 42     BIT $42
  $8596  42        .db $42
  $8597  02        .db $02
  $8598  00        BRK
  $8599  00        BRK
  $859A  00        BRK
  $859B  00        BRK
  $859C  00        BRK
  $859D  00        BRK
  $859E  00        BRK
  $859F  00        BRK
  $85A0  00        BRK
  $85A1  40        RTI
  $85A2  7E 40 40  ROR $4040,X
  $85A5  40        RTI
  $85A6  40        RTI

L_85A7:
  $85A7  3E 00 00  ROL $0000,X
  $85AA  00        BRK
  $85AB  00        BRK
  $85AC  00        BRK
  $85AD  00        BRK
  $85AE  00        BRK
  $85AF  00        BRK
  $85B0  00        BRK
  $85B1  7E 02 02  ROR $0202,X
  $85B4  02        .db $02
  $85B5  02        .db $02
  $85B6  04        .db $04
  $85B7  38        SEC
  $85B8  00        BRK
  $85B9  00        BRK
  $85BA  00        BRK
  $85BB  00        BRK
  $85BC  00        BRK
  $85BD  00        BRK
  $85BE  00        BRK
  $85BF  00        BRK
  $85C0  00        BRK
  $85C1  10 28     BPL $85EB
  $85C3  48        PHA
  $85C4  04        .db $04
  $85C5  04        .db $04
  $85C6  02        .db $02
  $85C7  02        .db $02
  $85C8  00        BRK
  $85C9  00        BRK
  $85CA  00        BRK
  $85CB  00        BRK
  $85CC  00        BRK
  $85CD  00        BRK
  $85CE  00        BRK
  $85CF  00        BRK
  $85D0  10 7C     BPL $864E
  $85D2  10 10     BPL $85E4
  $85D4  54        .db $54
  $85D5  54        .db $54
  $85D6  54        .db $54
  $85D7  10 00     BPL $85D9

L_85D9:
  $85D9  00        BRK
  $85DA  00        BRK
  $85DB  00        BRK
  $85DC  00        BRK
  $85DD  00        BRK
  $85DE  00        BRK
  $85DF  00        BRK
  $85E0  00        BRK
  $85E1  FE 02 04  INC $0402,X

L_85E4:
  $85E4  48        PHA
  $85E5  30 10     BMI $85F7
  $85E7  08        PHP
  $85E8  00        BRK
  $85E9  00        BRK
  $85EA  00        BRK

L_85EB:
  $85EB  00        BRK
  $85EC  00        BRK
  $85ED  00        BRK
  $85EE  00        BRK
  $85EF  00        BRK

L_85F0:
  $85F0  00        BRK
  $85F1  70 0E     BVS $8601
  $85F3  70 0E     BVS $8603
  $85F5  00        BRK
  $85F6  70 0E     BVS $8606
  $85F8  00        BRK
  $85F9  00        BRK
  $85FA  00        BRK
  $85FB  00        BRK
  $85FC  00        BRK
  $85FD  00        BRK
  $85FE  00        BRK
  $85FF  00        BRK
  $8600  00        BRK

L_8601:
  $8601  08        PHP
  $8602  10 10     BPL $8614
  $8604  20 24 5E  JSR $5E24
  $8607  62        .db $62
  $8608  00        BRK
  $8609  00        BRK
  $860A  00        BRK
  $860B  00        BRK
  $860C  00        BRK
  $860D  00        BRK
  $860E  00        BRK
  $860F  00        BRK
  $8610  00        BRK
  $8611  04        .db $04
  $8612  04        .db $04
  $8613  28        PLP

L_8614:
  $8614  18        CLC
  $8615  18        CLC
  $8616  24 40     BIT $40
  $8618  00        BRK
  $8619  00        BRK
  $861A  00        BRK
  $861B  00        BRK
  $861C  00        BRK
  $861D  00        BRK
  $861E  00        BRK
  $861F  00        BRK
  $8620  00        BRK
  $8621  7C        .db $7C
  $8622  20 7E 20  JSR $207E
  $8625  20 20 1C  JSR $1C20
  $8628  00        BRK
  $8629  00        BRK
  $862A  00        BRK
  $862B  00        BRK
  $862C  00        BRK
  $862D  00        BRK
  $862E  00        BRK
  $862F  00        BRK
  $8630  20 20 FF  JSR $FF20
  $8633  22        .db $22
  $8634  24 20     BIT $20
  $8636  10 10     BPL $8648
  $8638  00        BRK
  $8639  00        BRK
  $863A  00        BRK
  $863B  00        BRK
  $863C  00        BRK
  $863D  00        BRK
  $863E  00        BRK
  $863F  00        BRK
  $8640  00        BRK
  $8641  3C        .db $3C
  $8642  04        .db $04
  $8643  04        .db $04
  $8644  04        .db $04
  $8645  04        .db $04
  $8646  04        .db $04
  $8647  7E 00 00  ROR $0000,X
  $864A  00        BRK
  $864B  00        BRK
  $864C  00        BRK
  $864D  00        BRK

L_864E:
  $864E  00        BRK
  $864F  00        BRK
  $8650  00        BRK
  $8651  7E 02 02  ROR $0202,X
  $8654  7E 02 02  ROR $0202,X
  $8657  7E 00 00  ROR $0000,X
  $865A  00        BRK
  $865B  00        BRK
  $865C  00        BRK
  $865D  00        BRK
  $865E  00        BRK
  $865F  00        BRK
  $8660  00        BRK
  $8661  7E 00 7E  ROR $7E00,X
  $8664  02        .db $02
  $8665  02        .db $02
  $8666  04        .db $04
  $8667  78        SEI
  $8668  00        BRK
  $8669  00        BRK
  $866A  00        BRK
  $866B  00        BRK
  $866C  00        BRK
  $866D  00        BRK
  $866E  00        BRK
  $866F  00        BRK
  $8670  00        BRK
  $8671  42        .db $42
  $8672  42        .db $42
  $8673  42        .db $42
  $8674  42        .db $42
  $8675  02        .db $02
  $8676  04        .db $04
  $8677  38        SEC
  $8678  00        BRK
  $8679  00        BRK
  $867A  00        BRK
  $867B  00        BRK
  $867C  00        BRK
  $867D  00        BRK
  $867E  00        BRK
  $867F  00        BRK
  $8680  00        BRK
  $8681  08        PHP
  $8682  28        PLP
  $8683  28        PLP
  $8684  28        PLP
  $8685  2A        ROL
  $8686  4A        LSR
  $8687  0C        .db $0C
  $8688  00        BRK
  $8689  00        BRK
  $868A  00        BRK
  $868B  00        BRK
  $868C  00        BRK
  $868D  00        BRK
  $868E  00        BRK
  $868F  00        BRK
  $8690  00        BRK
  $8691  40        RTI
  $8692  40        RTI
  $8693  40        RTI
  $8694  40        RTI
  $8695  42        .db $42
  $8696  4C 70 00  JMP $0070
  $8699  00        BRK
  $869A  00        BRK
  $869B  00        BRK
  $869C  00        BRK
  $869D  00        BRK
  $869E  00        BRK
  $869F  00        BRK
  $86A0  00        BRK
  $86A1  7E 42 42  ROR $4242,X
  $86A4  42        .db $42
  $86A5  42        .db $42
  $86A6  42        .db $42
  $86A7  7E 00 00  ROR $0000,X
  $86AA  00        BRK
  $86AB  00        BRK
  $86AC  00        BRK
  $86AD  00        BRK
  $86AE  00        BRK
  $86AF  00        BRK
  $86B0  00        BRK
  $86B1  FC        .db $FC
  $86B2  04        .db $04
  $86B3  7C        .db $7C
  $86B4  04        .db $04
  $86B5  04        .db $04
  $86B6  08        PHP
  $86B7  F0 00     BEQ $86B9

L_86B9:
  $86B9  00        BRK
  $86BA  00        BRK
  $86BB  00        BRK
  $86BC  00        BRK
  $86BD  00        BRK
  $86BE  00        BRK
  $86BF  00        BRK
  $86C0  00        BRK
  $86C1  7E 42 42  ROR $4242,X
  $86C4  42        .db $42
  $86C5  02        .db $02
  $86C6  04        .db $04
  $86C7  38        SEC
  $86C8  00        BRK
  $86C9  00        BRK
  $86CA  00        BRK
  $86CB  00        BRK
  $86CC  00        BRK
  $86CD  00        BRK
  $86CE  00        BRK
  $86CF  00        BRK
  $86D0  00        BRK
  $86D1  02        .db $02
  $86D2  72        .db $72
  $86D3  02        .db $02
  $86D4  02        .db $02
  $86D5  02        .db $02
  $86D6  04        .db $04
  $86D7  78        SEI
  $86D8  00        BRK
  $86D9  00        BRK
  $86DA  00        BRK
  $86DB  00        BRK
  $86DC  00        BRK
  $86DD  00        BRK
  $86DE  00        BRK
  $86DF  00        BRK
  $86E0  00        BRK
  $86E1  00        BRK
  $86E2  00        BRK
  $86E3  54        .db $54
  $86E4  54        .db $54
  $86E5  04        .db $04
  $86E6  08        PHP
  $86E7  10 00     BPL $86E9

L_86E9:
  $86E9  00        BRK
  $86EA  00        BRK
  $86EB  00        BRK
  $86EC  00        BRK
  $86ED  00        BRK
  $86EE  00        BRK
  $86EF  00        BRK
  $86F0  00        BRK
  $86F1  00        BRK
  $86F2  00        BRK
  $86F3  20 7C 24  JSR $247C
  $86F6  28        PLP
  $86F7  20 00 00  JSR $0000
  $86FA  00        BRK
  $86FB  00        BRK
  $86FC  00        BRK
  $86FD  00        BRK
  $86FE  00        BRK
  $86FF  00        BRK
  $8700  00        BRK
  $8701  00        BRK
  $8702  00        BRK
  $8703  38        SEC
  $8704  08        PHP
  $8705  08        PHP
  $8706  08        PHP
  $8707  7C        .db $7C
  $8708  00        BRK
  $8709  00        BRK
  $870A  00        BRK
  $870B  00        BRK
  $870C  00        BRK
  $870D  00        BRK
  $870E  00        BRK
  $870F  00        BRK
  $8710  00        BRK
  $8711  00        BRK
  $8712  00        BRK
  $8713  3C        .db $3C
  $8714  04        .db $04
  $8715  3C        .db $3C
  $8716  04        .db $04
  $8717  3C        .db $3C
  $8718  00        BRK
  $8719  00        BRK
  $871A  00        BRK
  $871B  00        BRK
  $871C  00        BRK
  $871D  00        BRK
  $871E  00        BRK
  $871F  00        BRK
  $8720  50 50     BVC $8772
  $8722  50 00     BVC $8724

L_8724:
  $8724  00        BRK
  $8725  00        BRK
  $8726  00        BRK
  $8727  00        BRK
  $8728  00        BRK
  $8729  00        BRK
  $872A  00        BRK
  $872B  00        BRK
  $872C  00        BRK
  $872D  00        BRK
  $872E  00        BRK
  $872F  00        BRK
  $8730  30 48     BMI $877A
  $8732  48        PHA
  $8733  30 00     BMI $8735

L_8735:
  $8735  00        BRK
  $8736  00        BRK
  $8737  00        BRK
  $8738  00        BRK
  $8739  00        BRK
  $873A  00        BRK
  $873B  00        BRK
  $873C  00        BRK
  $873D  00        BRK
  $873E  00        BRK
  $873F  00        BRK
  $8740  00        BRK
  $8741  00        BRK
  $8742  00        BRK
  $8743  00        BRK
  $8744  FC        .db $FC
  $8745  00        BRK
  $8746  00        BRK
  $8747  00        BRK
  $8748  00        BRK
  $8749  00        BRK
  $874A  00        BRK
  $874B  00        BRK
  $874C  00        BRK
  $874D  00        BRK
  $874E  00        BRK
  $874F  00        BRK
  $8750  00        BRK
  $8751  00        BRK
  $8752  00        BRK
  $8753  7C        .db $7C
  $8754  04        .db $04
  $8755  18        CLC
  $8756  10 20     BPL $8778
  $8758  00        BRK
  $8759  00        BRK
  $875A  00        BRK
  $875B  00        BRK
  $875C  00        BRK
  $875D  00        BRK
  $875E  00        BRK
  $875F  00        BRK
  $8760  00        BRK
  $8761  00        BRK
  $8762  00        BRK
  $8763  00        BRK
  $8764  00        BRK
  $8765  00        BRK
  $8766  00        BRK
  $8767  00        BRK
  $8768  00        BRK
  $8769  00        BRK
  $876A  00        BRK
  $876B  00        BRK
  $876C  00        BRK
  $876D  00        BRK
  $876E  00        BRK
  $876F  00        BRK
  $8770  00        BRK
  $8771  00        BRK

L_8772:
  $8772  00        BRK
  $8773  00        BRK
  $8774  00        BRK
  $8775  00        BRK
  $8776  00        BRK
  $8777  00        BRK

L_8778:
  $8778  00        BRK
  $8779  00        BRK

L_877A:
  $877A  00        BRK
  $877B  00        BRK
  $877C  00        BRK
  $877D  00        BRK
  $877E  00        BRK
  $877F  00        BRK
  $8780  00        BRK
  $8781  00        BRK
  $8782  00        BRK
  $8783  00        BRK
  $8784  00        BRK
  $8785  00        BRK
  $8786  00        BRK
  $8787  00        BRK
  $8788  00        BRK
  $8789  00        BRK
  $878A  00        BRK
  $878B  00        BRK
  $878C  00        BRK
  $878D  00        BRK
  $878E  00        BRK
  $878F  00        BRK
  $8790  00        BRK
  $8791  00        BRK
  $8792  00        BRK
  $8793  00        BRK
  $8794  00        BRK
  $8795  00        BRK
  $8796  00        BRK
  $8797  00        BRK
  $8798  00        BRK
  $8799  00        BRK
  $879A  00        BRK
  $879B  00        BRK
  $879C  00        BRK
  $879D  00        BRK
  $879E  00        BRK
  $879F  00        BRK
  $87A0  00        BRK
  $87A1  00        BRK
  $87A2  00        BRK
  $87A3  00        BRK
  $87A4  00        BRK
  $87A5  00        BRK
  $87A6  00        BRK
  $87A7  00        BRK
  $87A8  00        BRK
  $87A9  00        BRK
  $87AA  00        BRK
  $87AB  00        BRK
  $87AC  00        BRK
  $87AD  00        BRK
  $87AE  00        BRK
  $87AF  00        BRK
  $87B0  00        BRK
  $87B1  00        BRK
  $87B2  00        BRK
  $87B3  00        BRK
  $87B4  00        BRK
  $87B5  00        BRK
  $87B6  00        BRK
  $87B7  00        BRK
  $87B8  00        BRK
  $87B9  00        BRK
  $87BA  00        BRK
  $87BB  00        BRK
  $87BC  00        BRK
  $87BD  00        BRK
  $87BE  00        BRK
  $87BF  00        BRK
  $87C0  00        BRK
  $87C1  00        BRK
  $87C2  00        BRK
  $87C3  00        BRK
  $87C4  00        BRK
  $87C5  00        BRK
  $87C6  00        BRK
  $87C7  00        BRK
  $87C8  00        BRK
  $87C9  00        BRK
  $87CA  00        BRK
  $87CB  00        BRK
  $87CC  00        BRK
  $87CD  00        BRK
  $87CE  00        BRK
  $87CF  00        BRK
  $87D0  00        BRK
  $87D1  00        BRK
  $87D2  00        BRK
  $87D3  00        BRK
  $87D4  00        BRK
  $87D5  00        BRK
  $87D6  00        BRK
  $87D7  00        BRK
  $87D8  00        BRK
  $87D9  00        BRK
  $87DA  00        BRK
  $87DB  00        BRK
  $87DC  00        BRK
  $87DD  00        BRK
  $87DE  00        BRK
  $87DF  00        BRK
  $87E0  00        BRK
  $87E1  00        BRK
  $87E2  00        BRK
  $87E3  00        BRK
  $87E4  00        BRK
  $87E5  00        BRK
  $87E6  00        BRK
  $87E7  00        BRK
  $87E8  00        BRK
  $87E9  00        BRK
  $87EA  00        BRK
  $87EB  00        BRK
  $87EC  00        BRK
  $87ED  00        BRK
  $87EE  00        BRK
  $87EF  00        BRK
  $87F0  00        BRK
  $87F1  00        BRK
  $87F2  00        BRK
  $87F3  00        BRK
  $87F4  00        BRK
  $87F5  00        BRK
  $87F6  00        BRK
  $87F7  00        BRK
  $87F8  00        BRK
  $87F9  00        BRK
  $87FA  00        BRK
  $87FB  00        BRK
  $87FC  00        BRK
  $87FD  00        BRK
  $87FE  00        BRK
  $87FF  00        BRK
  $8800  00        BRK
  $8801  00        BRK
  $8802  00        BRK
  $8803  00        BRK
  $8804  00        BRK
  $8805  00        BRK
  $8806  00        BRK
  $8807  00        BRK
  $8808  00        BRK
  $8809  00        BRK
  $880A  00        BRK
  $880B  00        BRK
  $880C  00        BRK
  $880D  00        BRK
  $880E  00        BRK
  $880F  00        BRK
  $8810  00        BRK
  $8811  7C        .db $7C
  $8812  C6 C6     DEC $C6
  $8814  C6 FE     DEC $FE
  $8816  C6 C6     DEC $C6
  $8818  FF        .db $FF
  $8819  83        .db $83
  $881A  39 39 39  AND $3939,Y
  $881D  01 39     ORA ($39,X)
  $881F  39 00 FC  AND $FC00,Y
  $8822  C6 C6     DEC $C6
  $8824  FC        .db $FC
  $8825  C6 C6     DEC $C6
  $8827  FC        .db $FC
  $8828  FF        .db $FF
  $8829  03        .db $03
  $882A  39 39 03  AND $0339,Y
  $882D  39 39 03  AND $0339,Y
  $8830  00        BRK
  $8831  7C        .db $7C
  $8832  C6 C0     DEC $C0
  $8834  C0 C0     CPY #$C0
  $8836  C6 7C     DEC $7C
  $8838  FF        .db $FF
  $8839  83        .db $83
  $883A  39 3F 3F  AND $3F3F,Y
  $883D  3F        .db $3F
  $883E  39 83 00  AND $0083,Y
  $8841  FC        .db $FC
  $8842  C6 C6     DEC $C6
  $8844  C6 C6     DEC $C6
  $8846  C6 FC     DEC $FC
  $8848  FF        .db $FF
  $8849  03        .db $03
  $884A  39 39 39  AND $3939,Y
  $884D  39 39 03  AND $0339,Y
  $8850  00        BRK
  $8851  FE C0 C0  INC $C0C0,X
  $8854  FC        .db $FC
  $8855  C0 C0     CPY #$C0
  $8857  FE FF 01  INC $01FF,X
  $885A  3F        .db $3F
  $885B  3F        .db $3F
  $885C  03        .db $03
  $885D  3F        .db $3F
  $885E  3F        .db $3F
  $885F  01 00     ORA ($00,X)
  $8861  FE C0 C0  INC $C0C0,X
  $8864  FC        .db $FC
  $8865  C0 C0     CPY #$C0
  $8867  C0 FF     CPY #$FF
  $8869  01 3F     ORA ($3F,X)
  $886B  3F        .db $3F
  $886C  03        .db $03
  $886D  3F        .db $3F
  $886E  3F        .db $3F
  $886F  3F        .db $3F
  $8870  00        BRK
  $8871  7C        .db $7C
  $8872  C6 C0     DEC $C0
  $8874  DE C6 C6  DEC $C6C6,X
  $8877  7C        .db $7C
  $8878  FF        .db $FF
  $8879  83        .db $83
  $887A  39 3F 21  AND $213F,Y
  $887D  39 39 83  AND $8339,Y
  $8880  00        BRK
  $8881  C6 C6     DEC $C6
  $8883  C6 FE     DEC $FE
  $8885  C6 C6     DEC $C6
  $8887  C6 FF     DEC $FF
  $8889  39 39 39  AND $3939,Y
  $888C  01 39     ORA ($39,X)
  $888E  39 39 00  AND $0039,Y
  $8891  30 30     BMI $88C3
  $8893  30 30     BMI $88C5
  $8895  30 30     BMI $88C7
  $8897  30 FF     BMI $8898
  $8899  CF        .db $CF
  $889A  CF        .db $CF
  $889B  CF        .db $CF
  $889C  CF        .db $CF
  $889D  CF        .db $CF
  $889E  CF        .db $CF
  $889F  CF        .db $CF
  $88A0  00        BRK
  $88A1  0C        .db $0C
  $88A2  0C        .db $0C
  $88A3  0C        .db $0C
  $88A4  0C        .db $0C
  $88A5  6C 6C 38  JMP ($386C)
  $88A8  FF        .db $FF
  $88A9  F3        .db $F3
  $88AA  F3        .db $F3
  $88AB  F3        .db $F3
  $88AC  F3        .db $F3
  $88AD  93        .db $93
  $88AE  93        .db $93
  $88AF  C7        .db $C7
  $88B0  00        BRK
  $88B1  CC D8 F0  CPY $F0D8
  $88B4  E0 F0     CPX #$F0
  $88B6  D8        CLD
  $88B7  CC FF 33  CPY $33FF
  $88BA  27        .db $27
  $88BB  0F        .db $0F
  $88BC  1F        .db $1F
  $88BD  0F        .db $0F
  $88BE  27        .db $27
  $88BF  33        .db $33
  $88C0  00        BRK
  $88C1  60        RTS
  $88C2  60        RTS

L_88C3:
  $88C3  60        RTS
  $88C4  60        RTS

L_88C5:
  $88C5  60        RTS
  $88C6  60        RTS

L_88C7:
  $88C7  7E FF 9F  ROR $9FFF,X
  $88CA  9F        .db $9F
  $88CB  9F        .db $9F
  $88CC  9F        .db $9F
  $88CD  9F        .db $9F
  $88CE  9F        .db $9F
  $88CF  81 00     STA ($00,X)
  $88D1  C6 EE     DEC $EE
  $88D3  FE D6 C6  INC $C6D6,X
  $88D6  C6 C6     DEC $C6
  $88D8  FF        .db $FF
  $88D9  39 11 01  AND $0111,Y
  $88DC  29 39     AND #$39
  $88DE  39 39 00  AND $0039,Y
  $88E1  C6 E6     DEC $E6
  $88E3  F6 DE     INC $DE,X
  $88E5  CE C6 C6  DEC $C6C6
  $88E8  FF        .db $FF
  $88E9  39 19 09  AND $0919,Y
  $88EC  21 31     AND ($31,X)
  $88EE  39 39 00  AND $0039,Y
  $88F1  7C        .db $7C
  $88F2  C6 C6     DEC $C6
  $88F4  C6 C6     DEC $C6
  $88F6  C6 7C     DEC $7C
  $88F8  FF        .db $FF
  $88F9  83        .db $83
  $88FA  39 39 39  AND $3939,Y
  $88FD  39 39 83  AND $8339,Y
  $8900  00        BRK
  $8901  FC        .db $FC
  $8902  C6 C6     DEC $C6
  $8904  C6 FC     DEC $FC
  $8906  C0 C0     CPY #$C0
  $8908  FF        .db $FF
  $8909  03        .db $03
  $890A  39 39 39  AND $3939,Y
  $890D  03        .db $03
  $890E  3F        .db $3F
  $890F  3F        .db $3F
  $8910  00        BRK
  $8911  7C        .db $7C
  $8912  C6 C6     DEC $C6
  $8914  C6 DE     DEC $DE
  $8916  CE 7C FF  DEC $FF7C
  $8919  83        .db $83
  $891A  39 39 39  AND $3939,Y
  $891D  21 31     AND ($31,X)
  $891F  83        .db $83
  $8920  00        BRK
  $8921  FC        .db $FC
  $8922  C6 C6     DEC $C6
  $8924  C6 FC     DEC $FC
  $8926  CC C6 FF  CPY $FFC6
  $8929  03        .db $03
  $892A  39 39 39  AND $3939,Y
  $892D  03        .db $03
  $892E  33        .db $33
  $892F  39 00 7C  AND $7C00,Y
  $8932  C6 C0     DEC $C0
  $8934  7C        .db $7C
  $8935  06 C6     ASL $C6
  $8937  7C        .db $7C
  $8938  FF        .db $FF
  $8939  83        .db $83
  $893A  39 3F 83  AND $833F,Y
  $893D  F9 39 83  SBC $8339,Y
  $8940  00        BRK
  $8941  FC        .db $FC
  $8942  30 30     BMI $8974
  $8944  30 30     BMI $8976
  $8946  30 30     BMI $8978
  $8948  FF        .db $FF
  $8949  03        .db $03
  $894A  CF        .db $CF
  $894B  CF        .db $CF
  $894C  CF        .db $CF
  $894D  CF        .db $CF
  $894E  CF        .db $CF
  $894F  CF        .db $CF
  $8950  00        BRK
  $8951  C6 C6     DEC $C6
  $8953  C6 C6     DEC $C6
  $8955  C6 C6     DEC $C6
  $8957  7C        .db $7C
  $8958  FF        .db $FF
  $8959  39 39 39  AND $3939,Y
  $895C  39 39 39  AND $3939,Y
  $895F  83        .db $83
  $8960  00        BRK
  $8961  C6 C6     DEC $C6
  $8963  C6 C6     DEC $C6
  $8965  6C 38 10  JMP ($1038)
  $8968  FF        .db $FF
  $8969  39 39 39  AND $3939,Y
  $896C  39 93 C7  AND $C793,Y
  $896F  EF        .db $EF
  $8970  00        BRK
  $8971  C6 C6     DEC $C6
  $8973  C6 D6     DEC $D6
  $8975  FE EE C6  INC $C6EE,X

L_8978:
  $8978  FF        .db $FF
  $8979  39 39 39  AND $3939,Y
  $897C  29 01     AND #$01
  $897E  11 39     ORA ($39),Y
  $8980  00        BRK
  $8981  CC CC 78  CPY $78CC
  $8984  30 78     BMI $89FE
  $8986  CC CC FF  CPY $FFCC
  $8989  33        .db $33
  $898A  33        .db $33
  $898B  87        .db $87
  $898C  CF        .db $CF
  $898D  87        .db $87
  $898E  33        .db $33
  $898F  33        .db $33
  $8990  00        BRK
  $8991  CC CC CC  CPY $CCCC
  $8994  78        SEI
  $8995  30 30     BMI $89C7
  $8997  30 FF     BMI $8998
  $8999  33        .db $33
  $899A  33        .db $33
  $899B  33        .db $33
  $899C  87        .db $87
  $899D  CF        .db $CF
  $899E  CF        .db $CF
  $899F  CF        .db $CF
  $89A0  00        BRK
  $89A1  FC        .db $FC
  $89A2  8C 18 30  STY $3018
  $89A5  60        RTS
  $89A6  C4 FC     CPY $FC
  $89A8  FF        .db $FF
  $89A9  03        .db $03
  $89AA  73        .db $73
  $89AB  E7        .db $E7
  $89AC  CF        .db $CF
  $89AD  9F        .db $9F
  $89AE  3B        .db $3B
  $89AF  03        .db $03
  $89B0  00        BRK
  $89B1  00        BRK
  $89B2  00        BRK
  $89B3  00        BRK
  $89B4  58        CLI
  $89B5  60        RTS
  $89B6  60        RTS
  $89B7  62        .db $62
  $89B8  FF        .db $FF
  $89B9  FF        .db $FF
  $89BA  FF        .db $FF
  $89BB  FF        .db $FF
  $89BC  A7        .db $A7
  $89BD  9F        .db $9F
  $89BE  9F        .db $9F
  $89BF  9D 00 00  STA $0000,X
  $89C2  00        BRK
  $89C3  00        BRK
  $89C4  00        BRK
  $89C5  00        BRK
  $89C6  60        RTS

L_89C7:
  $89C7  60        RTS
  $89C8  FF        .db $FF

L_89C9:
  $89C9  FF        .db $FF
  $89CA  FF        .db $FF
  $89CB  FF        .db $FF
  $89CC  FF        .db $FF
  $89CD  FF        .db $FF
  $89CE  9F        .db $9F
  $89CF  9F        .db $9F
  $89D0  00        BRK
  $89D1  00        BRK
  $89D2  00        BRK
  $89D3  00        BRK
  $89D4  60        RTS
  $89D5  60        RTS
  $89D6  20 40 FF  JSR $FF40
  $89D9  FF        .db $FF
  $89DA  FF        .db $FF
  $89DB  FF        .db $FF
  $89DC  9F        .db $9F
  $89DD  9F        .db $9F
  $89DE  DF        .db $DF
  $89DF  BF        .db $BF
  $89E0  00        BRK
  $89E1  18        CLC
  $89E2  18        CLC
  $89E3  08        PHP
  $89E4  10 00     BPL $89E6

L_89E6:
  $89E6  00        BRK
  $89E7  00        BRK
  $89E8  FF        .db $FF
  $89E9  E7        .db $E7
  $89EA  E7        .db $E7
  $89EB  F7        .db $F7
  $89EC  EF        .db $EF
  $89ED  FF        .db $FF
  $89EE  FF        .db $FF
  $89EF  FF        .db $FF
  $89F0  00        BRK
  $89F1  0C        .db $0C
  $89F2  0C        .db $0C
  $89F3  1C        .db $1C
  $89F4  18        CLC
  $89F5  10 00     BPL $89F7

L_89F7:
  $89F7  30 FF     BMI $89F8
  $89F9  F3        .db $F3
  $89FA  F3        .db $F3
  $89FB  E3        .db $E3
  $89FC  E7        .db $E7
  $89FD  EF        .db $EF

L_89FE:
  $89FE  FF        .db $FF
  $89FF  CF        .db $CF
  $8A00  00        BRK
  $8A01  00        BRK
  $8A02  00        BRK
  $8A03  00        BRK
  $8A04  00        BRK
  $8A05  00        BRK
  $8A06  00        BRK
  $8A07  00        BRK
  $8A08  FF        .db $FF
  $8A09  FF        .db $FF
  $8A0A  FF        .db $FF
  $8A0B  FF        .db $FF
  $8A0C  FF        .db $FF
  $8A0D  FF        .db $FF
  $8A0E  FF        .db $FF
  $8A0F  FF        .db $FF
  $8A10  00        BRK
  $8A11  FF        .db $FF
  $8A12  00        BRK
  $8A13  FF        .db $FF
  $8A14  00        BRK
  $8A15  FF        .db $FF
  $8A16  00        BRK
  $8A17  00        BRK
  $8A18  FF        .db $FF
  $8A19  00        BRK
  $8A1A  FF        .db $FF
  $8A1B  00        BRK
  $8A1C  FF        .db $FF
  $8A1D  00        BRK
  $8A1E  FF        .db $FF
  $8A1F  FF        .db $FF
  $8A20  00        BRK
  $8A21  00        BRK
  $8A22  00        BRK
  $8A23  00        BRK
  $8A24  00        BRK
  $8A25  00        BRK
  $8A26  00        BRK
  $8A27  00        BRK
  $8A28  FF        .db $FF
  $8A29  FF        .db $FF
  $8A2A  C0 C0     CPY #$C0
  $8A2C  C0 C0     CPY #$C0
  $8A2E  C0 C0     CPY #$C0
  $8A30  00        BRK
  $8A31  00        BRK
  $8A32  00        BRK
  $8A33  FF        .db $FF
  $8A34  00        BRK
  $8A35  FF        .db $FF
  $8A36  FF        .db $FF
  $8A37  FF        .db $FF
  $8A38  FF        .db $FF
  $8A39  FF        .db $FF
  $8A3A  00        BRK
  $8A3B  00        BRK
  $8A3C  00        BRK
  $8A3D  FF        .db $FF
  $8A3E  00        BRK
  $8A3F  FF        .db $FF
  $8A40  00        BRK
  $8A41  00        BRK
  $8A42  00        BRK
  $8A43  00        BRK
  $8A44  00        BRK
  $8A45  00        BRK
  $8A46  00        BRK
  $8A47  00        BRK
  $8A48  FF        .db $FF
  $8A49  FF        .db $FF
  $8A4A  01 01     ORA ($01,X)
  $8A4C  01 01     ORA ($01,X)
  $8A4E  01 01     ORA ($01,X)
  $8A50  17        .db $17
  $8A51  17        .db $17
  $8A52  17        .db $17
  $8A53  17        .db $17
  $8A54  17        .db $17
  $8A55  17        .db $17
  $8A56  17        .db $17
  $8A57  17        .db $17
  $8A58  C5 C5     CMP $C5
  $8A5A  C5 C5     CMP $C5
  $8A5C  C5 C5     CMP $C5
  $8A5E  C5 C5     CMP $C5
  $8A60  D7        .db $D7
  $8A61  17        .db $17
  $8A62  D7        .db $D7
  $8A63  17        .db $17
  $8A64  D7        .db $D7
  $8A65  D7        .db $D7
  $8A66  D7        .db $D7
  $8A67  D7        .db $D7
  $8A68  C5 C5     CMP $C5
  $8A6A  C5 C5     CMP $C5
  $8A6C  C5 C5     CMP $C5
  $8A6E  C5 C5     CMP $C5
  $8A70  D7        .db $D7
  $8A71  D7        .db $D7
  $8A72  D7        .db $D7
  $8A73  D7        .db $D7
  $8A74  17        .db $17
  $8A75  D7        .db $D7
  $8A76  17        .db $17
  $8A77  D7        .db $D7
  $8A78  C5 C5     CMP $C5
  $8A7A  C5 C5     CMP $C5
  $8A7C  C5 C5     CMP $C5
  $8A7E  C5 C5     CMP $C5
  $8A80  00        BRK
  $8A81  00        BRK
  $8A82  00        BRK
  $8A83  00        BRK
  $8A84  00        BRK
  $8A85  00        BRK
  $8A86  00        BRK
  $8A87  00        BRK
  $8A88  C0 C0     CPY #$C0
  $8A8A  C0 C0     CPY #$C0
  $8A8C  C0 C0     CPY #$C0
  $8A8E  C0 FF     CPY #$FF
  $8A90  FF        .db $FF
  $8A91  FF        .db $FF
  $8A92  FF        .db $FF
  $8A93  00        BRK
  $8A94  FF        .db $FF
  $8A95  00        BRK
  $8A96  00        BRK
  $8A97  00        BRK
  $8A98  FF        .db $FF
  $8A99  00        BRK
  $8A9A  FF        .db $FF
  $8A9B  00        BRK
  $8A9C  00        BRK
  $8A9D  00        BRK
  $8A9E  00        BRK
  $8A9F  FF        .db $FF
  $8AA0  00        BRK
  $8AA1  00        BRK
  $8AA2  00        BRK
  $8AA3  00        BRK
  $8AA4  00        BRK
  $8AA5  00        BRK
  $8AA6  00        BRK
  $8AA7  00        BRK
  $8AA8  01 01     ORA ($01,X)
  $8AAA  01 01     ORA ($01,X)
  $8AAC  01 01     ORA ($01,X)
  $8AAE  01 FF     ORA ($FF,X)
  $8AB0  E8        INX
  $8AB1  E8        INX
  $8AB2  E8        INX
  $8AB3  E8        INX
  $8AB4  E8        INX
  $8AB5  E8        INX
  $8AB6  E8        INX
  $8AB7  E8        INX
  $8AB8  A1 A1     LDA ($A1,X)
  $8ABA  A1 A1     LDA ($A1,X)
  $8ABC  A1 A1     LDA ($A1,X)
  $8ABE  A1 A1     LDA ($A1,X)
  $8AC0  FF        .db $FF
  $8AC1  00        BRK
  $8AC2  FF        .db $FF
  $8AC3  00        BRK
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
  $8AD4  00        BRK
  $8AD5  FF        .db $FF
  $8AD6  00        BRK
  $8AD7  FF        .db $FF
  $8AD8  FF        .db $FF
  $8AD9  FF        .db $FF
  $8ADA  FF        .db $FF
  $8ADB  FF        .db $FF
  $8ADC  FF        .db $FF
  $8ADD  FF        .db $FF
  $8ADE  FF        .db $FF
  $8ADF  FF        .db $FF
  $8AE0  00        BRK
  $8AE1  00        BRK
  $8AE2  00        BRK
  $8AE3  00        BRK
  $8AE4  00        BRK
  $8AE5  00        BRK
  $8AE6  00        BRK
  $8AE7  00        BRK
  $8AE8  00        BRK
  $8AE9  00        BRK
  $8AEA  00        BRK
  $8AEB  00        BRK
  $8AEC  00        BRK
  $8AED  00        BRK
  $8AEE  00        BRK
  $8AEF  00        BRK
  $8AF0  00        BRK
  $8AF1  00        BRK
  $8AF2  00        BRK
  $8AF3  00        BRK
  $8AF4  00        BRK
  $8AF5  00        BRK
  $8AF6  00        BRK
  $8AF7  00        BRK
  $8AF8  00        BRK
  $8AF9  00        BRK
  $8AFA  00        BRK
  $8AFB  00        BRK
  $8AFC  00        BRK
  $8AFD  00        BRK
  $8AFE  00        BRK
  $8AFF  00        BRK
  $8B00  00        BRK
  $8B01  00        BRK
  $8B02  00        BRK
  $8B03  00        BRK
  $8B04  00        BRK
  $8B05  00        BRK
  $8B06  01 03     ORA ($03,X)
  $8B08  00        BRK
  $8B09  00        BRK
  $8B0A  00        BRK
  $8B0B  00        BRK
  $8B0C  00        BRK
  $8B0D  00        BRK
  $8B0E  01 03     ORA ($03,X)
  $8B10  00        BRK
  $8B11  00        BRK
  $8B12  00        BRK
  $8B13  32        .db $32
  $8B14  54        .db $54
  $8B15  D8        CLD
  $8B16  9F        .db $9F
  $8B17  FF        .db $FF
  $8B18  00        BRK
  $8B19  00        BRK
  $8B1A  00        BRK
  $8B1B  33        .db $33
  $8B1C  57        .db $57
  $8B1D  F8        SED
  $8B1E  9F        .db $9F
  $8B1F  FF        .db $FF
  $8B20  00        BRK
  $8B21  22        .db $22
  $8B22  81 11     STA ($11,X)
  $8B24  19 0E F0  ORA $F00E,Y
  $8B27  FE 00 3E  INC $3E00,X
  $8B2A  F9 F9 FF  SBC $FFF9,Y
  $8B2D  0E F0 FE  ASL $FEF0
  $8B30  00        BRK
  $8B31  00        BRK
  $8B32  00        BRK
  $8B33  00        BRK
  $8B34  00        BRK
  $8B35  00        BRK
  $8B36  00        BRK
  $8B37  00        BRK
  $8B38  00        BRK
  $8B39  00        BRK

L_8B3A:
  $8B3A  00        BRK
  $8B3B  00        BRK
  $8B3C  00        BRK
  $8B3D  00        BRK
  $8B3E  00        BRK
  $8B3F  00        BRK
  $8B40  07        .db $07
  $8B41  03        .db $03
  $8B42  01 01     ORA ($01,X)
  $8B44  01 00     ORA ($00,X)
  $8B46  00        BRK
  $8B47  00        BRK
  $8B48  07        .db $07
  $8B49  03        .db $03
  $8B4A  01 01     ORA ($01,X)
  $8B4C  01 00     ORA ($00,X)
  $8B4E  00        BRK
  $8B4F  00        BRK
  $8B50  E0 DF     CPX #$DF
  $8B52  B0 20     BCS $8B74
  $8B54  4C 5E DF  JMP $DF5E
  $8B57  9F        .db $9F
  $8B58  E0 C0     CPX #$C0
  $8B5A  80        .db $80
  $8B5B  00        BRK
  $8B5C  00        BRK
  $8B5D  00        BRK
  $8B5E  00        BRK
  $8B5F  00        BRK
  $8B60  F9 3C CE  SBC $CE3C,Y
  $8B63  33        .db $33
  $8B64  0C        .db $0C
  $8B65  03        .db $03
  $8B66  00        BRK
  $8B67  00        BRK
  $8B68  FF        .db $FF
  $8B69  3F        .db $3F
  $8B6A  0F        .db $0F
  $8B6B  03        .db $03
  $8B6C  00        BRK
  $8B6D  00        BRK
  $8B6E  00        BRK
  $8B6F  00        BRK
  $8B70  00        BRK
  $8B71  80        .db $80
  $8B72  80        .db $80
  $8B73  C0 C0     CPY #$C0
  $8B75  00        BRK
  $8B76  C0 20     CPY #$20
  $8B78  00        BRK
  $8B79  80        .db $80
  $8B7A  80        .db $80
  $8B7B  C0 C0     CPY #$C0
  $8B7D  00        BRK
  $8B7E  00        BRK
  $8B7F  00        BRK
  $8B80  00        BRK
  $8B81  00        BRK
  $8B82  02        .db $02
  $8B83  07        .db $07
  $8B84  4F        .db $4F
  $8B85  6F        .db $6F
  $8B86  37        .db $37
  $8B87  17        .db $17
  $8B88  00        BRK
  $8B89  00        BRK
  $8B8A  02        .db $02
  $8B8B  07        .db $07
  $8B8C  4F        .db $4F
  $8B8D  6F        .db $6F
  $8B8E  77        .db $77
  $8B8F  77        .db $77
  $8B90  9F        .db $9F
  $8B91  8F        .db $8F
  $8B92  87        .db $87
  $8B93  C0 F0     CPY #$F0
  $8B95  C0 8F     CPY #$8F
  $8B97  B0 00     BCS $8B99

L_8B99:
  $8B99  00        BRK
  $8B9A  00        BRK
  $8B9B  80        .db $80
  $8B9C  DF        .db $DF
  $8B9D  FF        .db $FF
  $8B9E  FF        .db $FF
  $8B9F  FF        .db $FF
  $8BA0  20 C9 89  JSR $89C9

L_8BA3:
  $8BA3  4F        .db $4F
  $8BA4  07        .db $07
  $8BA5  03        .db $03
  $8BA6  E0 39     CPX #$39
  $8BA8  00        BRK
  $8BA9  00        BRK
  $8BAA  00        BRK
  $8BAB  78        SEI
  $8BAC  FC        .db $FC
  $8BAD  FE FE FF  INC $FFFE,X
  $8BB0  10 88     BPL $8B3A
  $8BB2  CC C4 C4  CPY $C4C4

L_8BB5:
  $8BB5  84 08     STY $08
  $8BB7  08        PHP
  $8BB8  80        .db $80
  $8BB9  60        RTS
  $8BBA  30 10     BMI $8BCC
  $8BBC  10 10     BPL $8BCE
  $8BBE  20 40 1B  JSR $1B40
  $8BC1  4B        .db $4B
  $8BC2  4D 65 72  EOR $7265
  $8BC5  7B        .db $7B
  $8BC6  7F        .db $7F
  $8BC7  00        BRK
  $8BC8  7B        .db $7B
  $8BC9  7B        .db $7B
  $8BCA  7D 7D 7E  ADC $7E7D,X
  $8BCD  7F        .db $7F

L_8BCE:
  $8BCE  7F        .db $7F
  $8BCF  00        BRK
  $8BD0  C0 80     CPY #$80
  $8BD2  CF        .db $CF
  $8BD3  F0 E0     BEQ $8BB5
  $8BD5  30 CC     BMI $8BA3
  $8BD7  00        BRK
  $8BD8  FF        .db $FF
  $8BD9  FF        .db $FF
  $8BDA  FF        .db $FF
  $8BDB  FF        .db $FF
  $8BDC  FF        .db $FF
  $8BDD  3F        .db $3F
  $8BDE  CF        .db $CF
  $8BDF  00        BRK
  $8BE0  0C        .db $0C
  $8BE1  06 C2     ASL $C2
  $8BE3  73        .db $73
  $8BE4  1A        .db $1A
  $8BE5  08        PHP
  $8BE6  08        PHP
  $8BE7  00        BRK
  $8BE8  FF        .db $FF
  $8BE9  FF        .db $FF
  $8BEA  FF        .db $FF
  $8BEB  FF        .db $FF
  $8BEC  FE FC F8  INC $F8FC,X
  $8BEF  00        BRK
  $8BF0  10 60     BPL $8C52
  $8BF2  00        BRK
  $8BF3  00        BRK
  $8BF4  00        BRK
  $8BF5  00        BRK
  $8BF6  00        BRK
  $8BF7  00        BRK
  $8BF8  00        BRK
  $8BF9  00        BRK
  $8BFA  00        BRK
  $8BFB  00        BRK
  $8BFC  00        BRK
  $8BFD  00        BRK
  $8BFE  00        BRK
  $8BFF  00        BRK
  $8C00  00        BRK
  $8C01  00        BRK
  $8C02  00        BRK
  $8C03  00        BRK
  $8C04  00        BRK

L_8C05:
  $8C05  01 03     ORA ($03,X)
  $8C07  07        .db $07
  $8C08  00        BRK
  $8C09  00        BRK
  $8C0A  00        BRK
  $8C0B  00        BRK
  $8C0C  00        BRK
  $8C0D  03        .db $03
  $8C0E  03        .db $03
  $8C0F  1F        .db $1F
  $8C10  00        BRK
  $8C11  00        BRK
  $8C12  00        BRK
  $8C13  0F        .db $0F
  $8C14  7F        .db $7F
  $8C15  FF        .db $FF
  $8C16  FF        .db $FF
  $8C17  F0 00     BEQ $8C19

L_8C19:
  $8C19  00        BRK
  $8C1A  00        BRK
  $8C1B  3F        .db $3F
  $8C1C  FF        .db $FF
  $8C1D  FF        .db $FF
  $8C1E  FF        .db $FF
  $8C1F  F0 00     BEQ $8C21

L_8C21:
  $8C21  00        BRK
  $8C22  00        BRK
  $8C23  C0 F0     CPY #$F0
  $8C25  F8        SED
  $8C26  FC        .db $FC
  $8C27  3E 00 00  ROL $0000,X

L_8C2A:
  $8C2A  00        BRK
  $8C2B  F8        SED
  $8C2C  FE FF FF  INC $FFFF,X
  $8C2F  FF        .db $FF
  $8C30  00        BRK

L_8C31:
  $8C31  00        BRK
  $8C32  00        BRK
  $8C33  00        BRK
  $8C34  00        BRK
  $8C35  00        BRK
  $8C36  00        BRK
  $8C37  00        BRK
  $8C38  00        BRK

L_8C39:
  $8C39  00        BRK
  $8C3A  00        BRK
  $8C3B  00        BRK
  $8C3C  00        BRK
  $8C3D  80        .db $80
  $8C3E  C0 F0     CPY #$F0
  $8C40  0F        .db $0F
  $8C41  19 76 77  ORA $7776,Y
  $8C44  6F        .db $6F
  $8C45  6F        .db $6F
  $8C46  6F        .db $6F
  $8C47  77        .db $77
  $8C48  7F        .db $7F
  $8C49  79 70 70  ADC $7070,Y
  $8C4C  60        RTS
  $8C4D  60        RTS
  $8C4E  60        RTS
  $8C4F  70 E0     BVS $8C31
  $8C51  E0 E0     CPX #$E0
  $8C53  70 B0     BVS $8C05
  $8C55  D8        CLD
  $8C56  8F        .db $8F
  $8C57  90 E0     BCC $8C39
  $8C59  E0 E0     CPX #$E0
  $8C5B  70 38     BVS $8C95
  $8C5D  1F        .db $1F
  $8C5E  0F        .db $0F
  $8C5F  06 1E     ASL $1E
  $8C61  1C        .db $1C
  $8C62  18        CLC
  $8C63  10 07     BPL $8C6C
  $8C65  1F        .db $1F
  $8C66  67        .db $67
  $8C67  E7        .db $E7
  $8C68  7F        .db $7F
  $8C69  3F        .db $3F
  $8C6A  3F        .db $3F
  $8C6B  38        SEC

L_8C6C:
  $8C6C  60        RTS
  $8C6D  80        .db $80
  $8C6E  00        BRK
  $8C6F  00        BRK
  $8C70  00        BRK
  $8C71  00        BRK
  $8C72  00        BRK
  $8C73  E0 E0     CPX #$E0
  $8C75  E0 C0     CPX #$C0
  $8C77  C0 F8     CPY #$F8
  $8C79  FE 1E 0E  INC $0E1E,X
  $8C7C  0E 0E 1E  ASL $1E0E
  $8C7F  1E 77 73  ASL $7377,X
  $8C82  39 1C 4C  AND $4C1C,Y
  $8C85  2E 1C 50  ROL $501C
  $8C88  70 78     BVS $8D02
  $8C8A  3C        .db $3C
  $8C8B  5E 6F 3E  LSR $3E6F,X
  $8C8E  5C        .db $5C
  $8C8F  70 99     BVS $8C2A
  $8C91  F5 EC     SBC $EC,X
  $8C93  18        CLC
  $8C94  00        BRK

L_8C95:
  $8C95  00        BRK
  $8C96  00        BRK
  $8C97  00        BRK
  $8C98  00        BRK
  $8C99  04        .db $04
  $8C9A  0E 1F C0  ASL $C01F
  $8C9D  00        BRK
  $8C9E  00        BRK
  $8C9F  00        BRK
  $8CA0  E7        .db $E7
  $8CA1  FF        .db $FF
  $8CA2  FE 38 00  INC $0038,X
  $8CA5  00        BRK
  $8CA6  00        BRK
  $8CA7  00        BRK
  $8CA8  00        BRK
  $8CA9  00        BRK
  $8CAA  00        BRK
  $8CAB  01 07     ORA ($07,X)
  $8CAD  01 00     ORA ($00,X)
  $8CAF  00        BRK
  $8CB0  80        .db $80
  $8CB1  00        BRK
  $8CB2  00        BRK
  $8CB3  08        PHP
  $8CB4  10 24     BPL $8CDA
  $8CB6  08        PHP
  $8CB7  12        .db $12
  $8CB8  3E 7E F2  ROL $F27E,X
  $8CBB  EE D8 F6  INC $F6D8
  $8CBE  6C 3A 20  JMP ($203A)
  $8CC1  20 40 40  JSR $4040
  $8CC4  00        BRK
  $8CC5  00        BRK
  $8CC6  0F        .db $0F
  $8CC7  00        BRK
  $8CC8  20 60 40  JSR $4060
  $8CCB  40        RTI
  $8CCC  00        BRK
  $8CCD  06 0F     ASL $0F

L_8CCF:
  $8CCF  00        BRK
  $8CD0  0D 13 27  ORA $2713
  $8CD3  2E 3C 19  ROL $193C
  $8CD6  12        .db $12
  $8CD7  00        BRK
  $8CD8  0F        .db $0F
  $8CD9  1F        .db $1F

L_8CDA:
  $8CDA  3F        .db $3F
  $8CDB  3F        .db $3F
  $8CDC  3F        .db $3F

L_8CDD:
  $8CDD  1F        .db $1F
  $8CDE  1F        .db $1F
  $8CDF  00        BRK
  $8CE0  C0 A0     CPY #$A0
  $8CE2  30 50     BMI $8D34
  $8CE4  90 10     BCC $8CF6
  $8CE6  20 00 C0  JSR $C000
  $8CE9  E0 F0     CPX #$F0
  $8CEB  F0 F0     BEQ $8CDD
  $8CED  F0 E0     BEQ $8CCF
  $8CEF  00        BRK
  $8CF0  04        .db $04
  $8CF1  08        PHP
  $8CF2  00        BRK
  $8CF3  00        BRK
  $8CF4  00        BRK
  $8CF5  00        BRK

L_8CF6:
  $8CF6  00        BRK
  $8CF7  00        BRK
  $8CF8  16 1E     ASL $1E,X
  $8CFA  0E 0E 06  ASL $060E
  $8CFD  06 06     ASL $06
  $8CFF  00        BRK
  $8D00  18        CLC
  $8D01  18        CLC

L_8D02:
  $8D02  18        CLC
  $8D03  18        CLC
  $8D04  18        CLC
  $8D05  1D 0D 0D  ORA $0D0D,X
  $8D08  00        BRK
  $8D09  00        BRK
  $8D0A  00        BRK
  $8D0B  00        BRK
  $8D0C  00        BRK
  $8D0D  01 01     ORA ($01,X)
  $8D0F  01 00     ORA ($00,X)
  $8D11  04        .db $04
  $8D12  10 40     BPL $8D54
  $8D14  80        .db $80
  $8D15  01 01     ORA ($01,X)
  $8D17  03        .db $03
  $8D18  00        BRK
  $8D19  07        .db $07
  $8D1A  1F        .db $1F
  $8D1B  7F        .db $7F
  $8D1C  FF        .db $FF
  $8D1D  FF        .db $FF
  $8D1E  FF        .db $FF
  $8D1F  FF        .db $FF
  $8D20  00        BRK
  $8D21  78        SEI
  $8D22  3E 3E 7E  ROL $7E3E,X
  $8D25  FD FB F7  SBC $F7FB,X
  $8D28  00        BRK
  $8D29  F8        SED
  $8D2A  FE FE FE  INC $FEFE,X
  $8D2D  FC        .db $FC
  $8D2E  F8        SED
  $8D2F  F0 18     BEQ $8D49
  $8D31  30 70     BMI $8DA3
  $8D33  E0 C0     CPX #$C0
  $8D35  C0 A0     CPY #$A0
  $8D37  B0 00     BCS $8D39

L_8D39:
  $8D39  00        BRK
  $8D3A  00        BRK
  $8D3B  00        BRK
  $8D3C  00        BRK
  $8D3D  00        BRK
  $8D3E  20 30 0E  JSR $0E30
  $8D41  0E 07 07  ASL $0707
  $8D44  03        .db $03
  $8D45  0B        .db $0B
  $8D46  09 09     ORA #$09
  $8D48  00        BRK

L_8D49:
  $8D49  00        BRK
  $8D4A  00        BRK
  $8D4B  00        BRK
  $8D4C  00        BRK
  $8D4D  08        PHP
  $8D4E  08        PHP
  $8D4F  08        PHP
  $8D50  83        .db $83
  $8D51  87        .db $87
  $8D52  47        .db $47
  $8D53  06 A1     ASL $A1
  $8D55  C7        .db $C7
  $8D56  FF        .db $FF
  $8D57  FF        .db $FF
  $8D58  FF        .db $FF
  $8D59  FF        .db $FF
  $8D5A  7F        .db $7F
  $8D5B  3E 38 00  ROL $0038,X
  $8D5E  00        BRK
  $8D5F  00        BRK
  $8D60  EF        .db $EF
  $8D61  DE BC 7C  DEC $7CBC,X
  $8D64  F9 F0 E0  SBC $E0F0,Y
  $8D67  C0 E0     CPY #$E0
  $8D69  C0 80     CPY #$80
  $8D6B  00        BRK
  $8D6C  01 00     ORA ($00,X)
  $8D6E  00        BRK
  $8D6F  00        BRK
  $8D70  30 70     BMI $8DE2
  $8D72  6C DE DE  JMP ($DEDE)
  $8D75  B2        .db $B2
  $8D76  B2        .db $B2
  $8D77  AA        TAX
  $8D78  30 70     BMI $8DEA
  $8D7A  60        RTS
  $8D7B  C0 C0     CPY #$C0
  $8D7D  80        .db $80
  $8D7E  80        .db $80
  $8D7F  88        DEY
  $8D80  08        PHP
  $8D81  08        PHP
  $8D82  08        PHP
  $8D83  08        PHP
  $8D84  6C 76 57  JMP ($5776)
  $8D87  12        .db $12
  $8D88  08        PHP
  $8D89  08        PHP
  $8D8A  08        PHP
  $8D8B  08        PHP
  $8D8C  6C 76 77  JMP ($7776)
  $8D8F  72        .db $72
  $8D90  FF        .db $FF
  $8D91  7F        .db $7F
  $8D92  3C        .db $3C
  $8D93  30 00     BMI $8D95

L_8D95:
  $8D95  00        BRK
  $8D96  00        BRK
  $8D97  00        BRK
  $8D98  00        BRK
  $8D99  00        BRK
  $8D9A  00        BRK
  $8D9B  00        BRK
  $8D9C  00        BRK
  $8D9D  00        BRK
  $8D9E  00        BRK
  $8D9F  00        BRK
  $8DA0  80        .db $80
  $8DA1  01 00     ORA ($00,X)

L_8DA3:
  $8DA3  02        .db $02
  $8DA4  04        .db $04
  $8DA5  08        PHP
  $8DA6  00        BRK
  $8DA7  01 00     ORA ($00,X)
  $8DA9  01 01     ORA ($01,X)
  $8DAB  03        .db $03
  $8DAC  07        .db $07
  $8DAD  0F        .db $0F
  $8DAE  07        .db $07
  $8DAF  03        .db $03
  $8DB0  AA        TAX
  $8DB1  24 24     BIT $24
  $8DB3  38        SEC
  $8DB4  52        .db $52
  $8DB5  46 C4     LSR $C4
  $8DB7  CC 88 80  CPY $8088
  $8DBA  80        .db $80
  $8DBB  80        .db $80
  $8DBC  C2        .db $C2
  $8DBD  C6 C6     DEC $C6
  $8DBF  CE 12 11  DEC $1112
  $8DC2  18        CLC
  $8DC3  08        PHP
  $8DC4  04        .db $04
  $8DC5  42        .db $42
  $8DC6  7F        .db $7F
  $8DC7  00        BRK
  $8DC8  72        .db $72
  $8DC9  71 78     ADC ($78),Y
  $8DCB  78        SEI
  $8DCC  7C        .db $7C
  $8DCD  7E 7F 00  ROR $007F,X
  $8DD0  00        BRK
  $8DD1  00        BRK
  $8DD2  00        BRK
  $8DD3  00        BRK
  $8DD4  00        BRK
  $8DD5  00        BRK
  $8DD6  00        BRK
  $8DD7  00        BRK
  $8DD8  00        BRK
  $8DD9  00        BRK
  $8DDA  00        BRK
  $8DDB  00        BRK
  $8DDC  00        BRK
  $8DDD  00        BRK
  $8DDE  00        BRK
  $8DDF  00        BRK
  $8DE0  01 01     ORA ($01,X)

L_8DE2:
  $8DE2  06 04     ASL $04
  $8DE4  08        PHP
  $8DE5  00        BRK
  $8DE6  03        .db $03
  $8DE7  00        BRK
  $8DE8  03        .db $03
  $8DE9  03        .db $03

L_8DEA:
  $8DEA  06 04     ASL $04
  $8DEC  08        PHP
  $8DED  00        BRK
  $8DEE  03        .db $03
  $8DEF  00        BRK
  $8DF0  88        DEY
  $8DF1  08        PHP
  $8DF2  10 32     BPL $8E26
  $8DF4  62        .db $62
  $8DF5  CE FE 00  DEC $00FE
  $8DF8  8E 0E 1E  STX $1E0E
  $8DFB  3E 7E FE  ROL $FE7E,X
  $8DFE  FE 00 00  INC $0000,X
  $8E01  1F        .db $1F
  $8E02  3F        .db $3F
  $8E03  7F        .db $7F
  $8E04  7F        .db $7F
  $8E05  7F        .db $7F
  $8E06  7F        .db $7F
  $8E07  7F        .db $7F
  $8E08  00        BRK
  $8E09  00        BRK
  $8E0A  00        BRK
  $8E0B  00        BRK
  $8E0C  00        BRK
  $8E0D  00        BRK
  $8E0E  00        BRK
  $8E0F  00        BRK
  $8E10  00        BRK
  $8E11  FF        .db $FF
  $8E12  FF        .db $FF
  $8E13  FF        .db $FF
  $8E14  F8        SED
  $8E15  F3        .db $F3
  $8E16  E4 DE     CPX $DE
  $8E18  00        BRK
  $8E19  00        BRK
  $8E1A  00        BRK
  $8E1B  00        BRK
  $8E1C  00        BRK
  $8E1D  00        BRK
  $8E1E  04        .db $04
  $8E1F  1E 00 FF  ASL $FF00,X
  $8E22  FF        .db $FF
  $8E23  FF        .db $FF
  $8E24  00        BRK
  $8E25  F8        SED

L_8E26:
  $8E26  00        BRK
  $8E27  FE 00 00  INC $0000,X
  $8E2A  00        BRK
  $8E2B  00        BRK
  $8E2C  00        BRK
  $8E2D  00        BRK
  $8E2E  00        BRK
  $8E2F  00        BRK
  $8E30  00        BRK
  $8E31  FE FE FE  INC $FEFE,X
  $8E34  02        .db $02
  $8E35  04        .db $04
  $8E36  08        PHP
  $8E37  10 00     BPL $8E39

L_8E39:
  $8E39  00        BRK
  $8E3A  00        BRK
  $8E3B  00        BRK
  $8E3C  00        BRK
  $8E3D  00        BRK
  $8E3E  00        BRK
  $8E3F  00        BRK
  $8E40  7F        .db $7F
  $8E41  7F        .db $7F
  $8E42  7E 7D 7A  ROR $7A7D,X
  $8E45  77        .db $77
  $8E46  69 49     ADC #$49
  $8E48  00        BRK
  $8E49  00        BRK
  $8E4A  00        BRK
  $8E4B  01 00     ORA ($00,X)
  $8E4D  00        BRK
  $8E4E  00        BRK
  $8E4F  00        BRK
  $8E50  BF        .db $BF
  $8E51  61 C0     ADC ($C0,X)
  $8E53  C0 80     CPY #$80
  $8E55  00        BRK
  $8E56  00        BRK
  $8E57  00        BRK
  $8E58  3F        .db $3F
  $8E59  7F        .db $7F
  $8E5A  FF        .db $FF
  $8E5B  FF        .db $FF
  $8E5C  F8        SED
  $8E5D  70 60     BVS $8EBF
  $8E5F  40        RTI
  $8E60  00        BRK
  $8E61  7F        .db $7F
  $8E62  80        .db $80
  $8E63  7F        .db $7F
  $8E64  3C        .db $3C
  $8E65  18        CLC
  $8E66  00        BRK
  $8E67  00        BRK
  $8E68  00        BRK
  $8E69  00        BRK
  $8E6A  80        .db $80
  $8E6B  C0 20     CPY #$20
  $8E6D  18        CLC
  $8E6E  00        BRK
  $8E6F  00        BRK
  $8E70  20 40 00  JSR $0040
  $8E73  00        BRK
  $8E74  00        BRK
  $8E75  00        BRK
  $8E76  00        BRK
  $8E77  00        BRK
  $8E78  00        BRK
  $8E79  80        .db $80
  $8E7A  80        .db $80
  $8E7B  C0 40     CPY #$40
  $8E7D  00        BRK
  $8E7E  00        BRK
  $8E7F  00        BRK
  $8E80  29 2F     AND #$2F
  $8E82  56 59     LSR $59,X
  $8E84  6E 66 76  ROR $7666
  $8E87  72        .db $72
  $8E88  20 20 10  JSR $1020
  $8E8B  19 0F 07  ORA $070F,Y

L_8E8E:
  $8E8E  07        .db $07
  $8E8F  03        .db $03
  $8E90  00        BRK
  $8E91  00        BRK
  $8E92  80        .db $80
  $8E93  00        BRK
  $8E94  00        BRK
  $8E95  00        BRK
  $8E96  00        BRK
  $8E97  00        BRK
  $8E98  40        RTI
  $8E99  40        RTI
  $8E9A  C0 E0     CPY #$E0
  $8E9C  F0 F0     BEQ $8E8E
  $8E9E  E0 E0     CPX #$E0
  $8EA0  00        BRK
  $8EA1  00        BRK
  $8EA2  00        BRK
  $8EA3  00        BRK
  $8EA4  00        BRK
  $8EA5  00        BRK
  $8EA6  00        BRK
  $8EA7  00        BRK
  $8EA8  00        BRK
  $8EA9  00        BRK
  $8EAA  00        BRK
  $8EAB  00        BRK
  $8EAC  00        BRK
  $8EAD  00        BRK
  $8EAE  00        BRK
  $8EAF  00        BRK
  $8EB0  00        BRK
  $8EB1  00        BRK
  $8EB2  00        BRK
  $8EB3  00        BRK
  $8EB4  00        BRK
  $8EB5  00        BRK
  $8EB6  00        BRK
  $8EB7  00        BRK
  $8EB8  00        BRK
  $8EB9  00        BRK
  $8EBA  00        BRK
  $8EBB  00        BRK
  $8EBC  00        BRK
  $8EBD  00        BRK
  $8EBE  00        BRK

L_8EBF:
  $8EBF  00        BRK
  $8EC0  7B        .db $7B
  $8EC1  79 7C 7C  ADC $7C7C,Y
  $8EC4  7E 7E 7F  ROR $7F7E,X
  $8EC7  00        BRK
  $8EC8  03        .db $03
  $8EC9  01 00     ORA ($00,X)
  $8ECB  00        BRK
  $8ECC  00        BRK
  $8ECD  00        BRK
  $8ECE  00        BRK
  $8ECF  00        BRK
  $8ED0  00        BRK
  $8ED1  00        BRK
  $8ED2  80        .db $80
  $8ED3  00        BRK
  $8ED4  00        BRK
  $8ED5  00        BRK
  $8ED6  FF        .db $FF
  $8ED7  00        BRK
  $8ED8  E0 E0     CPX #$E0
  $8EDA  F0 78     BEQ $8F54
  $8EDC  1C        .db $1C
  $8EDD  00        BRK
  $8EDE  00        BRK
  $8EDF  00        BRK
  $8EE0  00        BRK
  $8EE1  00        BRK
  $8EE2  00        BRK
  $8EE3  00        BRK
  $8EE4  00        BRK
  $8EE5  00        BRK
  $8EE6  FF        .db $FF
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
  $8EF2  20 10 18  JSR $1810
  $8EF5  0C        .db $0C
  $8EF6  FC        .db $FC
  $8EF7  00        BRK
  $8EF8  00        BRK
  $8EF9  00        BRK
  $8EFA  00        BRK
  $8EFB  00        BRK
  $8EFC  00        BRK
  $8EFD  00        BRK
  $8EFE  00        BRK
  $8EFF  00        BRK
  $8F00  00        BRK
  $8F01  00        BRK
  $8F02  00        BRK
  $8F03  7C        .db $7C
  $8F04  7D 7D 7D  ADC $7D7D,X
  $8F07  7D FF FF  ADC $FFFF,X
  $8F0A  FF        .db $FF
  $8F0B  83        .db $83
  $8F0C  82        .db $82
  $8F0D  80        .db $80
  $8F0E  80        .db $80
  $8F0F  80        .db $80

L_8F10:
  $8F10  00        BRK
  $8F11  00        BRK
  $8F12  1F        .db $1F
  $8F13  7F        .db $7F
  $8F14  FF        .db $FF
  $8F15  F5 B6     SBC $B6,X
  $8F17  B6 FF     LDX $FF,Y
  $8F19  FF        .db $FF
  $8F1A  FF        .db $FF
  $8F1B  FF        .db $FF
  $8F1C  1F        .db $1F
  $8F1D  4A        LSR
  $8F1E  49 49     EOR #$49
  $8F20  00        BRK
  $8F21  00        BRK
  $8F22  F8        SED
  $8F23  FF        .db $FF
  $8F24  FF        .db $FF
  $8F25  87        .db $87
  $8F26  0F        .db $0F
  $8F27  1F        .db $1F
  $8F28  FF        .db $FF
  $8F29  FF        .db $FF
  $8F2A  FF        .db $FF
  $8F2B  FC        .db $FC
  $8F2C  F8        SED
  $8F2D  78        SEI
  $8F2E  F0 E0     BEQ $8F10
  $8F30  00        BRK
  $8F31  00        BRK
  $8F32  00        BRK
  $8F33  F8        SED
  $8F34  F0 E0     BEQ $8F16
  $8F36  E0 C0     CPX #$C0
  $8F38  FF        .db $FF
  $8F39  FF        .db $FF
  $8F3A  FF        .db $FF
  $8F3B  07        .db $07
  $8F3C  0F        .db $0F
  $8F3D  01 03     ORA ($03,X)
  $8F3F  03        .db $03
  $8F40  7D 7C 7C  ADC $7C7C,X
  $8F43  7C        .db $7C

L_8F44:
  $8F44  7D 7D 7F  ADC $7F7D,X
  $8F47  7F        .db $7F
  $8F48  80        .db $80
  $8F49  80        .db $80
  $8F4A  80        .db $80
  $8F4B  80        .db $80
  $8F4C  80        .db $80
  $8F4D  80        .db $80
  $8F4E  80        .db $80
  $8F4F  80        .db $80
  $8F50  E6 00     INC $00
  $8F52  F0 F0     BEQ $8F44

L_8F54:
  $8F54  F8        SED
  $8F55  F9 FD FF  SBC $FFFD,Y
  $8F58  19 FF 0F  ORA $0FFF,Y
  $8F5B  0F        .db $0F
  $8F5C  07        .db $07
  $8F5D  06 02     ASL $02
  $8F5F  00        BRK
  $8F60  9F        .db $9F
  $8F61  3F        .db $3F
  $8F62  7F        .db $7F
  $8F63  7E FE FC  ROR $FCFE,X
  $8F66  F8        SED
  $8F67  F8        SED
  $8F68  60        RTS
  $8F69  C0 80     CPY #$80
  $8F6B  80        .db $80
  $8F6C  00        BRK
  $8F6D  00        BRK
  $8F6E  00        BRK
  $8F6F  00        BRK
  $8F70  80        .db $80
  $8F71  88        DEY
  $8F72  08        PHP
  $8F73  1C        .db $1C
  $8F74  1C        .db $1C
  $8F75  1C        .db $1C
  $8F76  1C        .db $1C
  $8F77  1C        .db $1C
  $8F78  07        .db $07
  $8F79  0F        .db $0F
  $8F7A  0F        .db $0F
  $8F7B  1F        .db $1F
  $8F7C  3F        .db $3F
  $8F7D  3F        .db $3F
  $8F7E  7F        .db $7F
  $8F7F  FF        .db $FF
  $8F80  7F        .db $7F
  $8F81  7F        .db $7F

L_8F82:
  $8F82  7E 7E 7C  ROR $7C7E,X
  $8F85  7C        .db $7C
  $8F86  00        BRK
  $8F87  00        BRK
  $8F88  80        .db $80
  $8F89  80        .db $80
  $8F8A  80        .db $80
  $8F8B  80        .db $80
  $8F8C  80        .db $80
  $8F8D  80        .db $80
  $8F8E  C1 C1     CMP ($C1,X)

L_8F90:
  $8F90  7F        .db $7F
  $8F91  7F        .db $7F
  $8F92  3F        .db $3F
  $8F93  3F        .db $3F
  $8F94  1F        .db $1F
  $8F95  1F        .db $1F
  $8F96  0F        .db $0F
  $8F97  0E 00 00  ASL $0000
  $8F9A  40        RTI
  $8F9B  40        RTI
  $8F9C  E0 E0     CPX #$E0
  $8F9E  F0 F0     BEQ $8F90
  $8FA0  F0 E0     BEQ $8F82
  $8FA2  E0 C0     CPX #$C0
  $8FA4  80        .db $80
  $8FA5  80        .db $80
  $8FA6  00        BRK
  $8FA7  00        BRK
  $8FA8  00        BRK
  $8FA9  01 03     ORA ($03,X)
  $8FAB  03        .db $03
  $8FAC  07        .db $07
  $8FAD  0F        .db $0F
  $8FAE  0F        .db $0F
  $8FAF  1F        .db $1F
  $8FB0  1C        .db $1C
  $8FB1  1C        .db $1C
  $8FB2  1C        .db $1C
  $8FB3  1C        .db $1C
  $8FB4  1C        .db $1C
  $8FB5  38        SEC
  $8FB6  38        SEC
  $8FB7  70 FF     BVS $8FB8
  $8FB9  FF        .db $FF
  $8FBA  FF        .db $FF
  $8FBB  FF        .db $FF
  $8FBC  FF        .db $FF
  $8FBD  FF        .db $FF
  $8FBE  FF        .db $FF
  $8FBF  FF        .db $FF
  $8FC0  0F        .db $0F
  $8FC1  07        .db $07
  $8FC2  03        .db $03
  $8FC3  01 00     ORA ($00,X)
  $8FC5  00        BRK
  $8FC6  00        BRK
  $8FC7  00        BRK
  $8FC8  FF        .db $FF
  $8FC9  FF        .db $FF
  $8FCA  FF        .db $FF
  $8FCB  FF        .db $FF
  $8FCC  FF        .db $FF
  $8FCD  FF        .db $FF
  $8FCE  FF        .db $FF
  $8FCF  FF        .db $FF
  $8FD0  06 84     ASL $84

L_8FD2:
  $8FD2  E0 FE     CPX #$FE
  $8FD4  7F        .db $7F
  $8FD5  1F        .db $1F
  $8FD6  00        BRK
  $8FD7  00        BRK
  $8FD8  F8        SED
  $8FD9  F8        SED
  $8FDA  FE FE FF  INC $FFFE,X
  $8FDD  FF        .db $FF
  $8FDE  FF        .db $FF
  $8FDF  FF        .db $FF
  $8FE0  00        BRK
  $8FE1  01 07     ORA ($07,X)
  $8FE3  FF        .db $FF
  $8FE4  FE F8 00  INC $00F8,X
  $8FE7  00        BRK
  $8FE8  3F        .db $3F
  $8FE9  3F        .db $3F
  $8FEA  7F        .db $7F
  $8FEB  FF        .db $FF
  $8FEC  FF        .db $FF
  $8FED  FF        .db $FF
  $8FEE  FF        .db $FF
  $8FEF  FF        .db $FF
  $8FF0  F0 E0     BEQ $8FD2
  $8FF2  C0 80     CPY #$80
  $8FF4  00        BRK
  $8FF5  00        BRK
  $8FF6  00        BRK
  $8FF7  00        BRK
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

L_9010:
  $9010  00        BRK
  $9011  00        BRK
  $9012  00        BRK
  $9013  00        BRK
  $9014  00        BRK
  $9015  00        BRK

L_9016:
  $9016  00        BRK
  $9017  00        BRK
  $9018  00        BRK
  $9019  00        BRK
  $901A  00        BRK
  $901B  00        BRK
  $901C  00        BRK
  $901D  00        BRK
  $901E  00        BRK
  $901F  00        BRK
  $9020  00        BRK
  $9021  00        BRK
  $9022  00        BRK
  $9023  00        BRK
  $9024  00        BRK
  $9025  01 03     ORA ($03,X)
  $9027  05 00     ORA $00
  $9029  00        BRK
  $902A  00        BRK
  $902B  00        BRK
  $902C  00        BRK
  $902D  01 07     ORA ($07,X)
  $902F  1F        .db $1F
  $9030  00        BRK
  $9031  00        BRK
  $9032  00        BRK
  $9033  86 8E     STX $8E
  $9035  56 46     LSR $46,X
  $9037  44        .db $44
  $9038  00        BRK
  $9039  00        BRK
  $903A  00        BRK
  $903B  80        .db $80
  $903C  80        .db $80
  $903D  D8        CLD
  $903E  FE FC 00  INC $00FC,X
  $9041  00        BRK
  $9042  04        .db $04
  $9043  04        .db $04
  $9044  00        BRK
  $9045  04        .db $04
  $9046  08        PHP
  $9047  08        PHP
  $9048  10 10     BPL $905A
  $904A  1C        .db $1C
  $904B  1F        .db $1F
  $904C  1F        .db $1F
  $904D  1D 18 18  ORA $1818,X
  $9050  00        BRK
  $9051  00        BRK
  $9052  02        .db $02
  $9053  A2 AB     LDX #$AB
  $9055  0A        ASL
  $9056  0C        .db $0C
  $9057  08        PHP
  $9058  00        BRK
  $9059  03        .db $03

L_905A:
  $905A  1F        .db $1F
  $905B  FF        .db $FF
  $905C  FF        .db $FF
  $905D  FE FC 78  INC $78FC,X
  $9060  9C        .db $9C
  $9061  AC C6 83  LDY $83C6
  $9064  01 00     ORA ($00,X)
  $9066  00        BRK
  $9067  00        BRK
  $9068  FF        .db $FF
  $9069  EF        .db $EF
  $906A  C7        .db $C7
  $906B  83        .db $83
  $906C  01 00     ORA ($00,X)

L_906E:
  $906E  00        BRK
  $906F  00        BRK
  $9070  CC 88 98  CPY $9888
  $9073  38        SEC
  $9074  B0 A0     BCS $9016
  $9076  A0 E8     LDY #$E8

L_9078:
  $9078  FC        .db $FC
  $9079  F8        SED
  $907A  F8        SED
  $907B  F8        SED
  $907C  F0 F0     BEQ $906E
  $907E  F0 F8     BEQ $9078
  $9080  08        PHP
  $9081  08        PHP
  $9082  08        PHP
  $9083  18        CLC
  $9084  18        CLC
  $9085  18        CLC
  $9086  14        .db $14
  $9087  14        .db $14
  $9088  18        CLC
  $9089  18        CLC
  $908A  18        CLC
  $908B  18        CLC
  $908C  18        CLC
  $908D  18        CLC
  $908E  1C        .db $1C
  $908F  1C        .db $1C
  $9090  10 00     BPL $9092

L_9092:
  $9092  00        BRK
  $9093  00        BRK
  $9094  00        BRK
  $9095  00        BRK
  $9096  00        BRK
  $9097  00        BRK
  $9098  30 00     BMI $909A

L_909A:
  $909A  00        BRK
  $909B  00        BRK
  $909C  00        BRK
  $909D  00        BRK
  $909E  00        BRK
  $909F  00        BRK
  $90A0  00        BRK
  $90A1  00        BRK
  $90A2  00        BRK
  $90A3  00        BRK
  $90A4  00        BRK

L_90A5:
  $90A5  00        BRK
  $90A6  00        BRK
  $90A7  01 00     ORA ($00,X)
  $90A9  00        BRK
  $90AA  00        BRK
  $90AB  00        BRK
  $90AC  00        BRK
  $90AD  00        BRK
  $90AE  00        BRK

L_90AF:
  $90AF  01 E8     ORA ($E8,X)
  $90B1  AC A4 B4  LDY $B4A4
  $90B4  94 B4     STY $B4,X
  $90B6  AC A8 F8  LDY $F8A8
  $90B9  FC        .db $FC
  $90BA  FC        .db $FC
  $90BB  FC        .db $FC
  $90BC  FC        .db $FC
  $90BD  FC        .db $FC
  $90BE  FC        .db $FC
  $90BF  F8        SED
  $90C0  14        .db $14
  $90C1  02        .db $02
  $90C2  31 70     AND ($70),Y
  $90C4  F8        SED
  $90C5  FC        .db $FC
  $90C6  FE 00 1C  INC $1C00,X
  $90C9  0E 07 03  ASL $0307
  $90CC  01 00     ORA ($00,X)
  $90CE  00        BRK
  $90CF  00        BRK
  $90D0  00        BRK
  $90D1  00        BRK
  $90D2  00        BRK
  $90D3  80        .db $80
  $90D4  7F        .db $7F
  $90D5  0F        .db $0F
  $90D6  00        BRK
  $90D7  00        BRK
  $90D8  00        BRK
  $90D9  00        BRK

L_90DA:
  $90DA  00        BRK
  $90DB  80        .db $80
  $90DC  FF        .db $FF
  $90DD  FF        .db $FF
  $90DE  3F        .db $3F
  $90DF  00        BRK
  $90E0  03        .db $03
  $90E1  06 18     ASL $18
  $90E3  30 C0     BMI $90A5
  $90E5  00        BRK
  $90E6  03        .db $03
  $90E7  00        BRK
  $90E8  03        .db $03
  $90E9  07        .db $07
  $90EA  1F        .db $1F
  $90EB  3F        .db $3F
  $90EC  FC        .db $FC
  $90ED  F0 C0     BEQ $90AF
  $90EF  00        BRK
  $90F0  30 24     BMI $9116
  $90F2  0C        .db $0C
  $90F3  1C        .db $1C
  $90F4  3C        .db $3C
  $90F5  FC        .db $FC
  $90F6  FC        .db $FC
  $90F7  00        BRK
  $90F8  F0 E0     BEQ $90DA
  $90FA  C0 00     CPY #$00
  $90FC  00        BRK
  $90FD  00        BRK
  $90FE  00        BRK
  $90FF  00        BRK
  $9100  00        BRK
  $9101  40        RTI
  $9102  60        RTS
  $9103  70 71     BVS $9176
  $9105  7B        .db $7B
  $9106  7A        .db $7A
  $9107  72        .db $72
  $9108  00        BRK
  $9109  00        BRK
  $910A  00        BRK
  $910B  00        BRK
  $910C  01 03     ORA ($03,X)
  $910E  03        .db $03
  $910F  03        .db $03
  $9110  00        BRK
  $9111  00        BRK
  $9112  23        .db $23
  $9113  86 0C     STX $0C
  $9115  1C        .db $1C

L_9116:
  $9116  18        CLC
  $9117  38        SEC
  $9118  00        BRK
  $9119  00        BRK
  $911A  3F        .db $3F
  $911B  FE FC FC  INC $FCFC,X
  $911E  F8        SED
  $911F  F8        SED
  $9120  00        BRK
  $9121  14        .db $14
  $9122  76 FF     ROR $FF,X
  $9124  7F        .db $7F
  $9125  FF        .db $FF
  $9126  FF        .db $FF

L_9127:
  $9127  F8        SED
  $9128  00        BRK
  $9129  00        BRK
  $912A  10 1E     BPL $914A
  $912C  3F        .db $3F
  $912D  21 00     AND ($00,X)
  $912F  00        BRK
  $9130  00        BRK
  $9131  00        BRK
  $9132  80        .db $80
  $9133  C0 D0     CPY #$D0
  $9135  F0 F0     BEQ $9127
  $9137  F4        .db $F4
  $9138  00        BRK
  $9139  00        BRK
  $913A  00        BRK
  $913B  00        BRK
  $913C  00        BRK
  $913D  20 40 60  JSR $6040
  $9140  32        .db $32
  $9141  1B        .db $1B
  $9142  11 08     ORA ($08),Y
  $9144  1C        .db $1C
  $9145  26 22     ROL $22
  $9147  22        .db $22
  $9148  03        .db $03
  $9149  03        .db $03

L_914A:
  $914A  01 00     ORA ($00,X)
  $914C  00        BRK
  $914D  00        BRK
  $914E  00        BRK
  $914F  04        .db $04
  $9150  78        SEI
  $9151  48        PHA
  $9152  C0 80     CPY #$80
  $9154  80        .db $80
  $9155  80        .db $80
  $9156  80        .db $80
  $9157  80        .db $80
  $9158  F8        SED
  $9159  C8        INY
  $915A  C0 80     CPY #$80
  $915C  80        .db $80
  $915D  80        .db $80
  $915E  80        .db $80

L_915F:
  $915F  80        .db $80
  $9160  F8        SED
  $9161  F8        SED
  $9162  FC        .db $FC
  $9163  FF        .db $FF
  $9164  FF        .db $FF
  $9165  3F        .db $3F
  $9166  7F        .db $7F
  $9167  8D 00 02  STA $0200
  $916A  00        BRK
  $916B  00        BRK
  $916C  11 0F     ORA ($0F),Y
  $916E  07        .db $07
  $916F  01 7C     ORA ($7C,X)
  $9171  7C        .db $7C
  $9172  7E FC FC  ROR $FCFC,X
  $9175  FE FC A8  INC $A8FC,X
  $9178  38        SEC
  $9179  18        CLC
  $917A  18        CLC
  $917B  18        CLC
  $917C  5C        .db $5C
  $917D  D0 E0     BNE $915F
  $917F  80        .db $80
  $9180  22        .db $22
  $9181  22        .db $22
  $9182  32        .db $32
  $9183  1E 0D 33  ASL $330D,X
  $9186  73        .db $73
  $9187  09 04     ORA #$04
  $9189  04        .db $04
  $918A  00        BRK
  $918B  00        BRK
  $918C  01 33     ORA ($33,X)
  $918E  73        .db $73
  $918F  79 80 C1  ADC $C180,Y
  $9192  C3        .db $C3
  $9193  60        RTS
  $9194  10 08     BPL $919E
  $9196  00        BRK
  $9197  80        .db $80
  $9198  83        .db $83
  $9199  C3        .db $C3
  $919A  C3        .db $C3
  $919B  E0 F0     CPX #$F0
  $919D  F8        SED

L_919E:
  $919E  F8        SED
  $919F  F8        SED
  $91A0  00        BRK
  $91A1  00        BRK
  $91A2  00        BRK
  $91A3  00        BRK
  $91A4  00        BRK
  $91A5  03        .db $03
  $91A6  1C        .db $1C
  $91A7  70 00     BVS $91A9

L_91A9:
  $91A9  00        BRK
  $91AA  00        BRK
  $91AB  00        BRK
  $91AC  00        BRK
  $91AD  03        .db $03
  $91AE  1F        .db $1F
  $91AF  7F        .db $7F
  $91B0  00        BRK
  $91B1  00        BRK
  $91B2  00        BRK
  $91B3  00        BRK
  $91B4  20 10 10  JSR $1010
  $91B7  10 00     BPL $91B9

L_91B9:
  $91B9  00        BRK
  $91BA  00        BRK
  $91BB  00        BRK
  $91BC  20 10 90  JSR $9010
  $91BF  D0 09     BNE $91CA
  $91C1  0C        .db $0C
  $91C2  06 03     ASL $03
  $91C4  41 60     EOR ($60,X)
  $91C6  70 00     BVS $91C8

L_91C8:
  $91C8  79 7C 7E  ADC $7E7C,Y
  $91CB  7F        .db $7F
  $91CC  7F        .db $7F
  $91CD  7F        .db $7F
  $91CE  7F        .db $7F
  $91CF  00        BRK
  $91D0  83        .db $83
  $91D1  C3        .db $C3
  $91D2  63        .db $63
  $91D3  33        .db $33
  $91D4  87        .db $87
  $91D5  C0 38     CPY #$38
  $91D7  00        BRK
  $91D8  FB        .db $FB
  $91D9  FB        .db $FB
  $91DA  7B        .db $7B
  $91DB  3B        .db $3B
  $91DC  87        .db $87
  $91DD  C0 F8     CPY #$F8
  $91DF  00        BRK

L_91E0:
  $91E0  E1 C1     SBC ($C1,X)
  $91E2  C1 C1     CMP ($C1,X)
  $91E4  E2        .db $E2
  $91E5  FE 3F 00  INC $003F,X
  $91E8  FF        .db $FF
  $91E9  FF        .db $FF

L_91EA:
  $91EA  FF        .db $FF
  $91EB  FF        .db $FF
  $91EC  FF        .db $FF
  $91ED  FF        .db $FF
  $91EE  3F        .db $3F
  $91EF  00        BRK
  $91F0  30 30     BMI $9222
  $91F2  30 24     BMI $9218
  $91F4  0E 96 36  ASL $3696
  $91F7  00        BRK
  $91F8  F0 F0     BEQ $91EA
  $91FA  F0 E4     BEQ $91E0
  $91FC  CE 9E 3E  DEC $3E9E
  $91FF  00        BRK
  $9200  00        BRK
  $9201  00        BRK
  $9202  00        BRK
  $9203  01 00     ORA ($00,X)
  $9205  00        BRK
  $9206  01 03     ORA ($03,X)
  $9208  00        BRK
  $9209  00        BRK
  $920A  00        BRK
  $920B  00        BRK
  $920C  06 0F     ASL $0F
  $920E  0F        .db $0F
  $920F  1F        .db $1F
  $9210  00        BRK
  $9211  3F        .db $3F
  $9212  FF        .db $FF
  $9213  FF        .db $FF
  $9214  FF        .db $FF
  $9215  3F        .db $3F
  $9216  CF        .db $CF
  $9217  F3        .db $F3

L_9218:
  $9218  00        BRK
  $9219  00        BRK
  $921A  03        .db $03
  $921B  00        BRK
  $921C  1C        .db $1C
  $921D  07        .db $07
  $921E  C1 F0     CMP ($F0,X)
  $9220  00        BRK
  $9221  C0 F0     CPY #$F0
  $9223  FC        .db $FC
  $9224  FE FC FC  INC $FCFC,X
  $9227  89        .db $89
  $9228  00        BRK
  $9229  00        BRK
  $922A  80        .db $80
  $922B  C0 70     CPY #$70
  $922D  F9 F9 8B  SBC $8BF9,Y
  $9230  00        BRK
  $9231  00        BRK
  $9232  00        BRK
  $9233  00        BRK
  $9234  00        BRK
  $9235  00        BRK
  $9236  80        .db $80
  $9237  80        .db $80
  $9238  00        BRK
  $9239  00        BRK
  $923A  00        BRK
  $923B  00        BRK
  $923C  00        BRK
  $923D  00        BRK
  $923E  80        .db $80
  $923F  80        .db $80
  $9240  03        .db $03
  $9241  01 01     ORA ($01,X)
  $9243  00        BRK
  $9244  00        BRK
  $9245  00        BRK
  $9246  00        BRK
  $9247  00        BRK
  $9248  1F        .db $1F
  $9249  0F        .db $0F
  $924A  07        .db $07
  $924B  03        .db $03
  $924C  01 01     ORA ($01,X)
  $924E  01 01     ORA ($01,X)
  $9250  FC        .db $FC
  $9251  8F        .db $8F
  $9252  03        .db $03
  $9253  01 00     ORA ($00,X)
  $9255  00        BRK
  $9256  00        BRK
  $9257  00        BRK
  $9258  FC        .db $FC
  $9259  8F        .db $8F
  $925A  07        .db $07
  $925B  03        .db $03
  $925C  01 00     ORA ($00,X)
  $925E  00        BRK
  $925F  00        BRK
  $9260  31 7B     AND ($7B),Y
  $9262  87        .db $87
  $9263  03        .db $03
  $9264  02        .db $02
  $9265  06 04     ASL $04
  $9267  1C        .db $1C
  $9268  33        .db $33
  $9269  7F        .db $7F
  $926A  C7        .db $C7
  $926B  83        .db $83
  $926C  82        .db $82
  $926D  86 44     STX $44
  $926F  3C        .db $3C
  $9270  C0 C0     CPY #$C0
  $9272  40        RTI
  $9273  20 20 20  JSR $2020
  $9276  20 20 C0  JSR $C020
  $9279  C0 60     CPY #$60
  $927B  70 30     BVS $92AD
  $927D  30 30     BMI $92AF
  $927F  30 00     BMI $9281

L_9281:
  $9281  00        BRK
  $9282  00        BRK
  $9283  00        BRK
  $9284  00        BRK
  $9285  00        BRK
  $9286  00        BRK
  $9287  00        BRK
  $9288  01 01     ORA ($01,X)
  $928A  03        .db $03
  $928B  43        .db $43
  $928C  67        .db $67
  $928D  77        .db $77
  $928E  73        .db $73
  $928F  79 00 00  ADC $0000,Y
  $9292  00        BRK
  $9293  00        BRK
  $9294  00        BRK
  $9295  00        BRK
  $9296  40        RTI
  $9297  60        RTS
  $9298  00        BRK
  $9299  00        BRK
  $929A  80        .db $80
  $929B  80        .db $80
  $929C  C0 C0     CPY #$C0
  $929E  E0 F0     CPX #$F0
  $92A0  08        PHP
  $92A1  00        BRK
  $92A2  00        BRK
  $92A3  00        BRK
  $92A4  00        BRK
  $92A5  00        BRK
  $92A6  00        BRK
  $92A7  00        BRK
  $92A8  18        CLC
  $92A9  00        BRK
  $92AA  00        BRK
  $92AB  00        BRK
  $92AC  00        BRK

L_92AD:
  $92AD  00        BRK
  $92AE  00        BRK

L_92AF:
  $92AF  00        BRK

L_92B0:
  $92B0  26 2E     ROL $2E
  $92B2  2E 2E 2E  ROL $2E2E
  $92B5  2E 26 22  ROL $2226
  $92B8  36 2E     ROL $2E,X
  $92BA  2E 2E 2E  ROL $2E2E
  $92BD  2E 2E 2E  ROL $2E2E
  $92C0  20 30 38  JSR $3830
  $92C3  3C        .db $3C
  $92C4  1E 0F 07  ASL $070F,X
  $92C7  00        BRK
  $92C8  7C        .db $7C
  $92C9  7E 7E 7F  ROR $7F7E,X
  $92CC  7F        .db $7F
  $92CD  7F        .db $7F
  $92CE  7F        .db $7F
  $92CF  00        BRK
  $92D0  30 38     BMI $930A
  $92D2  1C        .db $1C
  $92D3  1E 07 03  ASL $0307,X
  $92D6  80        .db $80
  $92D7  00        BRK
  $92D8  F8        SED
  $92D9  7C        .db $7C
  $92DA  3E 1F 87  ROL $871F,X
  $92DD  C3        .db $C3
  $92DE  F0 00     BEQ $92E0

L_92E0:
  $92E0  00        BRK
  $92E1  00        BRK
  $92E2  03        .db $03
  $92E3  0F        .db $0F
  $92E4  1F        .db $1F
  $92E5  9F        .db $9F
  $92E6  FF        .db $FF
  $92E7  00        BRK
  $92E8  00        BRK
  $92E9  00        BRK
  $92EA  1F        .db $1F
  $92EB  3F        .db $3F
  $92EC  FF        .db $FF
  $92ED  FF        .db $FF
  $92EE  FF        .db $FF
  $92EF  00        BRK
  $92F0  20 20 20  JSR $2020
  $92F3  A0 E0     LDY #$E0
  $92F5  E0 C0     CPX #$C0
  $92F7  00        BRK
  $92F8  26 36     ROL $36
  $92FA  76 F6     ROR $F6,X
  $92FC  EE EE DE  INC $DEEE
  $92FF  00        BRK
  $9300  00        BRK
  $9301  00        BRK
  $9302  00        BRK
  $9303  00        BRK
  $9304  00        BRK
  $9305  01 03     ORA ($03,X)
  $9307  07        .db $07
  $9308  00        BRK
  $9309  00        BRK

L_930A:
  $930A  00        BRK
  $930B  00        BRK
  $930C  00        BRK
  $930D  01 00     ORA ($00,X)
  $930F  07        .db $07
  $9310  00        BRK
  $9311  07        .db $07
  $9312  1F        .db $1F
  $9313  7F        .db $7F
  $9314  FF        .db $FF
  $9315  FF        .db $FF
  $9316  FF        .db $FF
  $9317  FF        .db $FF
  $9318  00        BRK
  $9319  00        BRK
  $931A  06 38     ASL $38
  $931C  30 A0     BMI $92BE
  $931E  90 90     BCC $92B0
  $9320  00        BRK
  $9321  80        .db $80
  $9322  40        RTI
  $9323  40        RTI
  $9324  20 30 30  JSR $3030
  $9327  30 00     BMI $9329

L_9329:
  $9329  FF        .db $FF
  $932A  7F        .db $7F
  $932B  7F        .db $7F
  $932C  3F        .db $3F
  $932D  3F        .db $3F
  $932E  3F        .db $3F
  $932F  3F        .db $3F

L_9330:
  $9330  00        BRK
  $9331  C0 30     CPY #$30
  $9333  18        CLC
  $9334  3C        .db $3C
  $9335  3C        .db $3C
  $9336  10 10     BPL $9348
  $9338  00        BRK
  $9339  C0 F0     CPY #$F0
  $933B  F8        SED
  $933C  FC        .db $FC
  $933D  FC        .db $FC
  $933E  F0 F0     BEQ $9330
  $9340  07        .db $07
  $9341  0F        .db $0F
  $9342  0F        .db $0F
  $9343  1F        .db $1F
  $9344  1F        .db $1F
  $9345  3F        .db $3F
  $9346  3F        .db $3F
  $9347  3F        .db $3F

L_9348:
  $9348  07        .db $07
  $9349  06 06     ASL $06
  $934B  06 0F     ASL $0F
  $934D  03        .db $03
  $934E  03        .db $03
  $934F  1F        .db $1F
  $9350  FF        .db $FF
  $9351  FF        .db $FF
  $9352  FF        .db $FF
  $9353  FF        .db $FF
  $9354  FE FC F8  INC $F8FC,X
  $9357  F0 30     BEQ $9389
  $9359  20 20 20  JSR $2020
  $935C  A2 FC     LDX #$FC
  $935E  F8        SED
  $935F  F0 38     BEQ $9399
  $9361  3C        .db $3C
  $9362  02        .db $02
  $9363  01 01     ORA ($01,X)
  $9365  00        BRK
  $9366  00        BRK
  $9367  00        BRK
  $9368  3F        .db $3F
  $9369  3F        .db $3F
  $936A  03        .db $03
  $936B  01 01     ORA ($01,X)
  $936D  00        BRK
  $936E  00        BRK
  $936F  00        BRK
  $9370  18        CLC
  $9371  38        SEC
  $9372  20 5C 3E  JSR $3E5C
  $9375  32        .db $32
  $9376  32        .db $32
  $9377  32        .db $32
  $9378  F8        SED
  $9379  F8        SED
  $937A  E0 C0     CPX #$C0
  $937C  80        .db $80
  $937D  80        .db $80
  $937E  88        DEY
  $937F  88        DEY
  $9380  7F        .db $7F
  $9381  7F        .db $7F
  $9382  7E 78 00  ROR $0078,X
  $9385  00        BRK
  $9386  00        BRK
  $9387  00        BRK
  $9388  3F        .db $3F

L_9389:
  $9389  3F        .db $3F
  $938A  7E 78 00  ROR $0078,X
  $938D  00        BRK
  $938E  00        BRK
  $938F  00        BRK
  $9390  E0 80     CPX #$80
  $9392  00        BRK
  $9393  00        BRK
  $9394  00        BRK
  $9395  00        BRK
  $9396  00        BRK
  $9397  00        BRK
  $9398  E0 80     CPX #$80
  $939A  00        BRK
  $939B  00        BRK
  $939C  00        BRK
  $939D  00        BRK
  $939E  00        BRK
  $939F  00        BRK
  $93A0  00        BRK
  $93A1  00        BRK
  $93A2  00        BRK
  $93A3  00        BRK
  $93A4  00        BRK
  $93A5  00        BRK
  $93A6  00        BRK
  $93A7  10 00     BPL $93A9

L_93A9:
  $93A9  00        BRK
  $93AA  01 01     ORA ($01,X)
  $93AC  03        .db $03
  $93AD  07        .db $07
  $93AE  07        .db $07
  $93AF  17        .db $17
  $93B0  32        .db $32
  $93B1  32        .db $32
  $93B2  32        .db $32
  $93B3  3C        .db $3C
  $93B4  58        CLI
  $93B5  76 76     ROR $76,X
  $93B7  66 88     ROR $88
  $93B9  88        DEY
  $93BA  80        .db $80
  $93BB  80        .db $80
  $93BC  C0 F6     CPY #$F6
  $93BE  F6 E6     INC $E6,X
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
  $93E0  10 10     BPL $93F2
  $93E2  11 13     ORA ($13),Y
  $93E4  1E 18 07  ASL $0718,X
  $93E7  00        BRK
  $93E8  17        .db $17
  $93E9  17        .db $17
  $93EA  17        .db $17

L_93EB:
  $93EB  17        .db $17
  $93EC  1E 18 07  ASL $0718,X
  $93EF  00        BRK
  $93F0  6E CE 9E  ROR $9ECE
  $93F3  3E 7E FE  ROL $FE7E,X
  $93F6  FE 00 EE  INC $EE00,X
  $93F9  CE 9E 3E  DEC $3E9E
  $93FC  7E FE FE  ROR $FEFE,X
  $93FF  00        BRK
  $9400  A0 A9     LDY #$A9
  $9402  A8        TAY
  $9403  AB        .db $AB
  $9404  AA        TAX
  $9405  AA        TAX
  $9406  AA        TAX
  $9407  AA        TAX
  $9408  D1 D9     CMP ($D9),Y
  $940A  D8        CLD
  $940B  DB        .db $DB
  $940C  DB        .db $DB
  $940D  DA        .db $DA
  $940E  DB        .db $DB
  $940F  CB        .db $CB
  $9410  8A        TXA
  $9411  AA        TAX
  $9412  AA        TAX
  $9413  AA        TAX
  $9414  AB        .db $AB
  $9415  A8        TAY
  $9416  A9 A0     LDA #$A0
  $9418  CB        .db $CB
  $9419  DB        .db $DB
  $941A  DB        .db $DB
  $941B  DA        .db $DA
  $941C  DB        .db $DB
  $941D  D8        CLD
  $941E  D9 D1 0A  CMP $0AD1,Y
  $9421  AA        TAX
  $9422  2A        ROL
  $9423  EA        NOP
  $9424  2A        ROL
  $9425  2A        ROL
  $9426  2A        ROL
  $9427  2A        ROL
  $9428  86 B6     STX $B6
  $942A  36 F6     ROL $F6,X
  $942C  76 76     ROR $76,X
  $942E  F6 F2     INC $F2,X
  $9430  22        .db $22
  $9431  2A        ROL
  $9432  2A        ROL
  $9433  2A        ROL
  $9434  EA        NOP
  $9435  2A        ROL
  $9436  AA        TAX
  $9437  0A        ASL
  $9438  F2        .db $F2
  $9439  F6 76     INC $76,X
  $943B  76 F6     ROR $F6,X
  $943D  36 B6     ROL $B6,X
  $943F  86 06     STX $06
  $9441  9C        .db $9C
  $9442  BE BF BF  LDX $BFBF,Y
  $9445  CE DE C6  DEC $C6DE
  $9448  08        PHP
  $9449  90 A0     BCC $93EB
  $944B  A0 A0     LDY #$A0
  $944D  D0 D0     BNE $941F
  $944F  C8        INY
  $9450  E6 EE     INC $EE
  $9452  E2        .db $E2
  $9453  E2        .db $E2
  $9454  E7        .db $E7
  $9455  EB        .db $EB
  $9456  E1 E1     SBC ($E1,X)
  $9458  E8        INX
  $9459  E8        INX
  $945A  E4 E4     CPX $E4
  $945C  E4 E8     CPX $E8
  $945E  EA        NOP
  $945F  E8        INX
  $9460  01 00     ORA ($00,X)
  $9462  00        BRK
  $9463  BF        .db $BF
  $9464  0F        .db $0F
  $9465  0E 1E 1C  ASL $1C1E
  $9468  00        BRK
  $9469  00        BRK
  $946A  00        BRK
  $946B  00        BRK
  $946C  00        BRK
  $946D  00        BRK
  $946E  00        BRK
  $946F  00        BRK
  $9470  1C        .db $1C
  $9471  1C        .db $1C
  $9472  1C        .db $1C
  $9473  1C        .db $1C
  $9474  1C        .db $1C
  $9475  0C        .db $0C
  $9476  0E 06 00  ASL $0006
  $9479  00        BRK
  $947A  00        BRK
  $947B  00        BRK
  $947C  00        BRK
  $947D  00        BRK
  $947E  00        BRK
  $947F  00        BRK
  $9480  7E 00 00  ROR $0000,X
  $9483  C4 00     CPY $00
  $9485  00        BRK
  $9486  00        BRK
  $9487  00        BRK
  $9488  00        BRK
  $9489  00        BRK
  $948A  00        BRK
  $948B  00        BRK
  $948C  00        BRK
  $948D  00        BRK
  $948E  00        BRK
  $948F  00        BRK
  $9490  00        BRK
  $9491  00        BRK
  $9492  00        BRK
  $9493  00        BRK
  $9494  00        BRK
  $9495  00        BRK
  $9496  00        BRK
  $9497  00        BRK
  $9498  00        BRK
  $9499  00        BRK
  $949A  00        BRK
  $949B  00        BRK
  $949C  00        BRK
  $949D  00        BRK
  $949E  00        BRK
  $949F  00        BRK
  $94A0  07        .db $07
  $94A1  00        BRK
  $94A2  00        BRK
  $94A3  DF        .db $DF
  $94A4  07        .db $07
  $94A5  01 01     ORA ($01,X)
  $94A7  03        .db $03
  $94A8  00        BRK
  $94A9  00        BRK
  $94AA  00        BRK
  $94AB  00        BRK
  $94AC  00        BRK
  $94AD  01 01     ORA ($01,X)
  $94AF  03        .db $03
  $94B0  03        .db $03
  $94B1  03        .db $03
  $94B2  03        .db $03
  $94B3  03        .db $03
  $94B4  03        .db $03
  $94B5  03        .db $03
  $94B6  01 01     ORA ($01,X)
  $94B8  03        .db $03
  $94B9  03        .db $03
  $94BA  03        .db $03
  $94BB  03        .db $03
  $94BC  03        .db $03
  $94BD  03        .db $03
  $94BE  01 01     ORA ($01,X)
  $94C0  FF        .db $FF
  $94C1  7F        .db $7F
  $94C2  FF        .db $FF
  $94C3  FF        .db $FF
  $94C4  FF        .db $FF
  $94C5  FF        .db $FF
  $94C6  FF        .db $FF
  $94C7  FF        .db $FF
  $94C8  00        BRK
  $94C9  FF        .db $FF

L_94CA:
  $94CA  FF        .db $FF
  $94CB  00        BRK
  $94CC  00        BRK
  $94CD  00        BRK
  $94CE  C0 E0     CPY #$E0
  $94D0  FF        .db $FF
  $94D1  FF        .db $FF
  $94D2  FF        .db $FF
  $94D3  FF        .db $FF

L_94D4:
  $94D4  FF        .db $FF
  $94D5  FF        .db $FF
  $94D6  FF        .db $FF
  $94D7  FF        .db $FF
  $94D8  F0 F0     BEQ $94CA
  $94DA  F0 F8     BEQ $94D4
  $94DC  F8        SED
  $94DD  F8        SED
  $94DE  F8        SED
  $94DF  FC        .db $FC
  $94E0  20 9F 9F  JSR $9F9F
  $94E3  FF        .db $FF
  $94E4  FF        .db $FF
  $94E5  FF        .db $FF
  $94E6  FF        .db $FF
  $94E7  FF        .db $FF
  $94E8  20 DF DF  JSR $DFDF
  $94EB  00        BRK
  $94EC  00        BRK
  $94ED  00        BRK
  $94EE  00        BRK
  $94EF  00        BRK
  $94F0  FF        .db $FF
  $94F1  FF        .db $FF
  $94F2  FF        .db $FF
  $94F3  FF        .db $FF
  $94F4  FF        .db $FF
  $94F5  FF        .db $FF
  $94F6  FF        .db $FF
  $94F7  FF        .db $FF
  $94F8  00        BRK
  $94F9  00        BRK
  $94FA  00        BRK
  $94FB  00        BRK
  $94FC  00        BRK
  $94FD  00        BRK
  $94FE  00        BRK
  $94FF  00        BRK
  $9500  04        .db $04
  $9501  E7        .db $E7
  $9502  CF        .db $CF
  $9503  FF        .db $FF
  $9504  FF        .db $FF
  $9505  FF        .db $FF
  $9506  FF        .db $FF
  $9507  FF        .db $FF
  $9508  04        .db $04
  $9509  EF        .db $EF
  $950A  DF        .db $DF
  $950B  00        BRK
  $950C  00        BRK
  $950D  00        BRK
  $950E  00        BRK
  $950F  00        BRK
  $9510  FF        .db $FF

L_9511:
  $9511  FF        .db $FF
  $9512  FF        .db $FF
  $9513  FF        .db $FF
  $9514  FF        .db $FF
  $9515  FF        .db $FF
  $9516  FF        .db $FF
  $9517  FF        .db $FF
  $9518  00        BRK
  $9519  00        BRK
  $951A  00        BRK
  $951B  00        BRK
  $951C  00        BRK
  $951D  00        BRK
  $951E  00        BRK
  $951F  00        BRK
  $9520  00        BRK
  $9521  FF        .db $FF
  $9522  FF        .db $FF
  $9523  FF        .db $FF
  $9524  FF        .db $FF
  $9525  FE FC FC  INC $FCFC,X
  $9528  00        BRK
  $9529  FF        .db $FF
  $952A  FF        .db $FF
  $952B  00        BRK
  $952C  00        BRK
  $952D  01 0E     ORA ($0E,X)
  $952F  1E F9 F9  ASL $F9F9,X
  $9532  F9 F9 F3  SBC $F3F9,Y
  $9535  F3        .db $F3
  $9536  F3        .db $F3
  $9537  F3        .db $F3
  $9538  3D 3D 3D  AND $3D3D,X
  $953B  7D 7B 7B  ADC $7B7B,X
  $953E  7B        .db $7B
  $953F  FB        .db $FB
  $9540  10 CF     BPL $9511
  $9542  9F        .db $9F
  $9543  FF        .db $FF
  $9544  FF        .db $FF
  $9545  7F        .db $7F
  $9546  FF        .db $FF
  $9547  FF        .db $FF
  $9548  10 EF     BPL $9539
  $954A  DF        .db $DF
  $954B  03        .db $03
  $954C  0F        .db $0F
  $954D  7F        .db $7F
  $954E  FF        .db $FF
  $954F  FF        .db $FF
  $9550  FF        .db $FF
  $9551  FF        .db $FF
  $9552  FF        .db $FF
  $9553  FF        .db $FF
  $9554  FF        .db $FF
  $9555  FF        .db $FF
  $9556  FF        .db $FF
  $9557  FF        .db $FF
  $9558  FF        .db $FF
  $9559  FF        .db $FF
  $955A  FF        .db $FF
  $955B  FF        .db $FF
  $955C  FF        .db $FF
  $955D  FF        .db $FF
  $955E  FF        .db $FF
  $955F  FF        .db $FF
  $9560  01 F9     ORA ($F9,X)
  $9562  F3        .db $F3
  $9563  F7        .db $F7
  $9564  E7        .db $E7
  $9565  CF        .db $CF
  $9566  CF        .db $CF
  $9567  CF        .db $CF
  $9568  01 FB     ORA ($FB,X)
  $956A  F7        .db $F7
  $956B  2F        .db $2F
  $956C  EF        .db $EF
  $956D  DF        .db $DF
  $956E  DF        .db $DF
  $956F  DF        .db $DF
  $9570  9F        .db $9F
  $9571  9F        .db $9F
  $9572  9F        .db $9F
  $9573  9F        .db $9F
  $9574  9F        .db $9F
  $9575  9F        .db $9F
  $9576  9F        .db $9F
  $9577  9F        .db $9F
  $9578  BF        .db $BF
  $9579  BF        .db $BF
  $957A  BF        .db $BF
  $957B  BF        .db $BF
  $957C  BF        .db $BF
  $957D  BF        .db $BF
  $957E  BF        .db $BF
  $957F  BF        .db $BF
  $9580  00        BRK
  $9581  FE FC FC  INC $FCFC,X
  $9584  F9 F9 F9  SBC $F9F9,Y
  $9587  F9 00 FF  SBC $FF00,Y
  $958A  FE FE FD  INC $FDFE,X
  $958D  FD FD FD  SBC $FDFD,X
  $9590  F9 F9 F9  SBC $F9F9,Y
  $9593  F9 F9 F9  SBC $F9F9,Y
  $9596  F9 F9 FD  SBC $FDF9,Y
  $9599  FD FD FD  SBC $FDFD,X
  $959C  FD FD FD  SBC $FDFD,X
  $959F  FD 81 79  SBC $7981,X
  $95A2  F9 F9 F9  SBC $F9F9,Y
  $95A5  F3        .db $F3
  $95A6  F3        .db $F3
  $95A7  F3        .db $F3
  $95A8  81 7B     STA ($7B,X)
  $95AA  FB        .db $FB
  $95AB  FB        .db $FB
  $95AC  FB        .db $FB
  $95AD  F7        .db $F7
  $95AE  F7        .db $F7
  $95AF  F7        .db $F7
  $95B0  F3        .db $F3
  $95B1  F3        .db $F3
  $95B2  F3        .db $F3
  $95B3  F3        .db $F3
  $95B4  F3        .db $F3
  $95B5  F3        .db $F3
  $95B6  F3        .db $F3
  $95B7  F3        .db $F3
  $95B8  F7        .db $F7
  $95B9  F7        .db $F7
  $95BA  F7        .db $F7
  $95BB  F7        .db $F7
  $95BC  F7        .db $F7
  $95BD  F7        .db $F7
  $95BE  F7        .db $F7
  $95BF  F7        .db $F7
  $95C0  81 9E     STA ($9E,X)
  $95C2  9F        .db $9F
  $95C3  9F        .db $9F
  $95C4  9F        .db $9F
  $95C5  CF        .db $CF
  $95C6  CF        .db $CF
  $95C7  CF        .db $CF
  $95C8  81 DE     STA ($DE,X)
  $95CA  DF        .db $DF
  $95CB  DF        .db $DF
  $95CC  DF        .db $DF
  $95CD  EF        .db $EF
  $95CE  EF        .db $EF
  $95CF  EF        .db $EF
  $95D0  CF        .db $CF
  $95D1  CF        .db $CF
  $95D2  CF        .db $CF
  $95D3  CF        .db $CF
  $95D4  CF        .db $CF
  $95D5  CF        .db $CF
  $95D6  CF        .db $CF
  $95D7  CF        .db $CF
  $95D8  EF        .db $EF
  $95D9  EF        .db $EF
  $95DA  EF        .db $EF
  $95DB  EF        .db $EF
  $95DC  EF        .db $EF
  $95DD  EF        .db $EF
  $95DE  EF        .db $EF
  $95DF  EF        .db $EF
  $95E0  00        BRK
  $95E1  7F        .db $7F
  $95E2  3F        .db $3F
  $95E3  3F        .db $3F
  $95E4  9F        .db $9F
  $95E5  9F        .db $9F
  $95E6  9F        .db $9F
  $95E7  9F        .db $9F
  $95E8  00        BRK
  $95E9  FF        .db $FF
  $95EA  7F        .db $7F
  $95EB  7F        .db $7F
  $95EC  BF        .db $BF
  $95ED  BF        .db $BF
  $95EE  BF        .db $BF
  $95EF  BF        .db $BF
  $95F0  9F        .db $9F
  $95F1  9F        .db $9F
  $95F2  9F        .db $9F
  $95F3  9F        .db $9F
  $95F4  9F        .db $9F
  $95F5  9F        .db $9F
  $95F6  9F        .db $9F
  $95F7  9F        .db $9F
  $95F8  BF        .db $BF
  $95F9  BF        .db $BF
  $95FA  BF        .db $BF
  $95FB  BF        .db $BF
  $95FC  BF        .db $BF
  $95FD  BF        .db $BF
  $95FE  BF        .db $BF
  $95FF  BF        .db $BF
  $9600  80        .db $80
  $9601  9F        .db $9F
  $9602  CF        .db $CF
  $9603  E7        .db $E7
  $9604  E7        .db $E7
  $9605  F3        .db $F3
  $9606  F3        .db $F3
  $9607  F3        .db $F3
  $9608  80        .db $80
  $9609  DF        .db $DF
  $960A  EF        .db $EF
  $960B  F7        .db $F7
  $960C  F7        .db $F7
  $960D  FB        .db $FB
  $960E  FB        .db $FB
  $960F  FB        .db $FB
  $9610  F9 F9 F9  SBC $F9F9,Y
  $9613  F9 F9 F9  SBC $F9F9,Y
  $9616  F9 F9 FD  SBC $FDF9,Y
  $9619  FD FD FD  SBC $FDFD,X
  $961C  FD FD FD  SBC $FDFD,X
  $961F  FD 08 F3  SBC $F308,X
  $9622  F9 FC FE  SBC $FEFC,Y
  $9625  FE FF FF  INC $FFFF,X
  $9628  08        PHP
  $9629  F7        .db $F7
  $962A  FB        .db $FB
  $962B  FD FE FE  SBC $FEFE,X
  $962E  FF        .db $FF
  $962F  FF        .db $FF
  $9630  FF        .db $FF
  $9631  FF        .db $FF
  $9632  FF        .db $FF
  $9633  FF        .db $FF
  $9634  FF        .db $FF
  $9635  FF        .db $FF
  $9636  FF        .db $FF
  $9637  FF        .db $FF
  $9638  FF        .db $FF
  $9639  FF        .db $FF
  $963A  FF        .db $FF
  $963B  FF        .db $FF
  $963C  FF        .db $FF
  $963D  FF        .db $FF
  $963E  FF        .db $FF
  $963F  FF        .db $FF
  $9640  00        BRK
  $9641  FF        .db $FF
  $9642  FF        .db $FF
  $9643  FF        .db $FF
  $9644  7F        .db $7F
  $9645  7F        .db $7F
  $9646  3F        .db $3F
  $9647  3F        .db $3F
  $9648  00        BRK
  $9649  FF        .db $FF
  $964A  FF        .db $FF
  $964B  DE FF FF  DEC $FFFF,X
  $964E  7F        .db $7F
  $964F  7F        .db $7F
  $9650  9F        .db $9F
  $9651  9F        .db $9F
  $9652  9F        .db $9F
  $9653  9F        .db $9F
  $9654  CF        .db $CF
  $9655  CF        .db $CF
  $9656  CF        .db $CF
  $9657  CF        .db $CF
  $9658  BF        .db $BF
  $9659  BF        .db $BF
  $965A  BF        .db $BF
  $965B  BF        .db $BF
  $965C  DF        .db $DF
  $965D  DF        .db $DF
  $965E  DF        .db $DF
  $965F  DF        .db $DF
  $9660  20 E7 F3  JSR $F3E7
  $9663  FF        .db $FF
  $9664  FC        .db $FC
  $9665  FC        .db $FC
  $9666  FE FE 20  INC $20FE,X
  $9669  F7        .db $F7
  $966A  FB        .db $FB
  $966B  78        SEI
  $966C  FE FE FF  INC $FFFE,X
  $966F  FF        .db $FF
  $9670  FE FF FF  INC $FFFF,X
  $9673  FF        .db $FF
  $9674  FF        .db $FF
  $9675  FF        .db $FF
  $9676  FF        .db $FF
  $9677  FF        .db $FF
  $9678  FF        .db $FF
  $9679  FF        .db $FF
  $967A  FF        .db $FF
  $967B  FF        .db $FF
  $967C  FF        .db $FF
  $967D  FF        .db $FF
  $967E  FF        .db $FF
  $967F  FF        .db $FF
  $9680  7F        .db $7F
  $9681  F8        SED
  $9682  FE FF FF  INC $FFFF,X
  $9685  FF        .db $FF
  $9686  7F        .db $7F
  $9687  7F        .db $7F
  $9688  00        BRK
  $9689  F8        SED
  $968A  FE 80 FE  INC $FE80,X
  $968D  FF        .db $FF
  $968E  7F        .db $7F
  $968F  7F        .db $7F
  $9690  7F        .db $7F
  $9691  3F        .db $3F
  $9692  3F        .db $3F
  $9693  3F        .db $3F
  $9694  3F        .db $3F
  $9695  3F        .db $3F
  $9696  9F        .db $9F
  $9697  9F        .db $9F
  $9698  7F        .db $7F
  $9699  BF        .db $BF
  $969A  BF        .db $BF
  $969B  BF        .db $BF
  $969C  BF        .db $BF
  $969D  BF        .db $BF
  $969E  DF        .db $DF
  $969F  DF        .db $DF
  $96A0  F0 00     BEQ $96A2

L_96A2:
  $96A2  00        BRK
  $96A3  FF        .db $FF
  $96A4  FF        .db $FF
  $96A5  FF        .db $FF
  $96A6  EF        .db $EF
  $96A7  F7        .db $F7

L_96A8:
  $96A8  00        BRK
  $96A9  00        BRK

L_96AA:
  $96AA  00        BRK
  $96AB  00        BRK

L_96AC:
  $96AC  00        BRK
  $96AD  C0 E0     CPY #$E0
  $96AF  F0 F7     BEQ $96A8
  $96B1  F3        .db $F3
  $96B2  F3        .db $F3
  $96B3  F3        .db $F3
  $96B4  F3        .db $F3
  $96B5  F3        .db $F3
  $96B6  F3        .db $F3
  $96B7  F3        .db $F3
  $96B8  F0 F0     BEQ $96AA
  $96BA  F0 F0     BEQ $96AC
  $96BC  F0 F0     BEQ $96AE
  $96BE  F0 F0     BEQ $96B0
  $96C0  3F        .db $3F
  $96C1  00        BRK
  $96C2  00        BRK
  $96C3  FF        .db $FF
  $96C4  FC        .db $FC
  $96C5  FC        .db $FC
  $96C6  FE FE 00  INC $00FE,X
  $96C9  00        BRK
  $96CA  00        BRK
  $96CB  00        BRK
  $96CC  00        BRK
  $96CD  00        BRK
  $96CE  00        BRK
  $96CF  00        BRK
  $96D0  FE FE FE  INC $FEFE,X
  $96D3  FE FE FE  INC $FEFE,X
  $96D6  FC        .db $FC
  $96D7  FC        .db $FC
  $96D8  00        BRK
  $96D9  00        BRK
  $96DA  00        BRK
  $96DB  00        BRK
  $96DC  00        BRK
  $96DD  00        BRK
  $96DE  00        BRK
  $96DF  00        BRK
  $96E0  C0 00     CPY #$00
  $96E2  00        BRK
  $96E3  A3        .db $A3
  $96E4  00        BRK
  $96E5  00        BRK
  $96E6  00        BRK
  $96E7  00        BRK
  $96E8  00        BRK
  $96E9  00        BRK
  $96EA  00        BRK
  $96EB  00        BRK
  $96EC  00        BRK
  $96ED  00        BRK
  $96EE  00        BRK
  $96EF  00        BRK
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

L_96FD:
  $96FD  00        BRK
  $96FE  00        BRK
  $96FF  00        BRK
  $9700  00        BRK
  $9701  00        BRK
  $9702  00        BRK
  $9703  F0 F8     BEQ $96FD
  $9705  78        SEI
  $9706  7C        .db $7C
  $9707  3C        .db $3C
  $9708  00        BRK
  $9709  00        BRK
  $970A  00        BRK
  $970B  00        BRK
  $970C  00        BRK
  $970D  00        BRK
  $970E  00        BRK
  $970F  00        BRK
  $9710  3C        .db $3C
  $9711  3C        .db $3C
  $9712  38        SEC
  $9713  38        SEC
  $9714  38        SEC
  $9715  30 30     BMI $9747
  $9717  60        RTS
  $9718  00        BRK
  $9719  00        BRK
  $971A  00        BRK
  $971B  00        BRK
  $971C  00        BRK
  $971D  00        BRK
  $971E  00        BRK
  $971F  00        BRK
  $9720  20 11 19  JSR $1911
  $9723  F9 F9 73  SBC $73F9,Y
  $9726  73        .db $73
  $9727  73        .db $73
  $9728  00        BRK
  $9729  01 01     ORA ($01,X)
  $972B  01 01     ORA ($01,X)
  $972D  03        .db $03
  $972E  03        .db $03
  $972F  03        .db $03
  $9730  67        .db $67
  $9731  67        .db $67
  $9732  67        .db $67
  $9733  47        .db $47
  $9734  D7        .db $D7
  $9735  C7        .db $C7
  $9736  87        .db $87
  $9737  87        .db $87
  $9738  07        .db $07
  $9739  07        .db $07

L_973A:
  $973A  07        .db $07
  $973B  07        .db $07
  $973C  17        .db $17
  $973D  17        .db $17
  $973E  17        .db $17
  $973F  17        .db $17
  $9740  E5 E4     SBC $E4
  $9742  E6 E6     INC $E6
  $9744  E7        .db $E7
  $9745  E7        .db $E7
  $9746  E7        .db $E7

L_9747:
  $9747  E7        .db $E7
  $9748  EC EC EE  CPX $EEEC
  $974B  EE EF EF  INC $EFEF
  $974E  EF        .db $EF
  $974F  EF        .db $EF
  $9750  E7        .db $E7
  $9751  E7        .db $E7
  $9752  E7        .db $E7
  $9753  E7        .db $E7
  $9754  E7        .db $E7
  $9755  E7        .db $E7
  $9756  E7        .db $E7
  $9757  E7        .db $E7
  $9758  EF        .db $EF
  $9759  EF        .db $EF
  $975A  EF        .db $EF
  $975B  EF        .db $EF
  $975C  EF        .db $EF
  $975D  EF        .db $EF
  $975E  EF        .db $EF
  $975F  EF        .db $EF
  $9760  86 87     STX $87
  $9762  C3        .db $C3
  $9763  43        .db $43
  $9764  41 21     EOR ($21,X)
  $9766  A0 90     LDY #$90
  $9768  00        BRK
  $9769  00        BRK
  $976A  00        BRK
  $976B  00        BRK
  $976C  00        BRK
  $976D  00        BRK
  $976E  80        .db $80

L_976F:
  $976F  80        .db $80
  $9770  D0 C8     BNE $973A
  $9772  E8        INX
  $9773  E4 E6     CPX $E6
  $9775  E2        .db $E2
  $9776  E3        .db $E3
  $9777  E5 C0     SBC $C0
  $9779  C0 E0     CPY #$E0
  $977B  E0 F0     CPX #$F0
  $977D  F0 F0     BEQ $976F
  $977F  F4        .db $F4
  $9780  00        BRK
  $9781  00        BRK
  $9782  00        BRK
  $9783  80        .db $80
  $9784  80        .db $80
  $9785  80        .db $80
  $9786  C0 C0     CPY #$C0
  $9788  00        BRK
  $9789  00        BRK
  $978A  00        BRK
  $978B  00        BRK
  $978C  00        BRK
  $978D  00        BRK
  $978E  00        BRK
  $978F  00        BRK
  $9790  60        RTS
  $9791  60        RTS
  $9792  30 30     BMI $97C4
  $9794  18        CLC
  $9795  18        CLC
  $9796  0C        .db $0C
  $9797  0C        .db $0C
  $9798  00        BRK
  $9799  00        BRK
  $979A  00        BRK
  $979B  00        BRK
  $979C  00        BRK
  $979D  00        BRK
  $979E  00        BRK
  $979F  00        BRK
  $97A0  01 01     ORA ($01,X)
  $97A2  00        BRK
  $97A3  00        BRK
  $97A4  00        BRK
  $97A5  00        BRK
  $97A6  00        BRK
  $97A7  00        BRK
  $97A8  01 01     ORA ($01,X)
  $97AA  00        BRK
  $97AB  00        BRK
  $97AC  00        BRK
  $97AD  00        BRK
  $97AE  00        BRK
  $97AF  00        BRK
  $97B0  00        BRK
  $97B1  00        BRK
  $97B2  00        BRK
  $97B3  00        BRK
  $97B4  00        BRK
  $97B5  00        BRK
  $97B6  00        BRK
  $97B7  00        BRK
  $97B8  00        BRK
  $97B9  00        BRK
  $97BA  00        BRK
  $97BB  00        BRK
  $97BC  00        BRK
  $97BD  00        BRK
  $97BE  00        BRK
  $97BF  00        BRK
  $97C0  FF        .db $FF
  $97C1  FF        .db $FF
  $97C2  FF        .db $FF
  $97C3  FF        .db $FF

L_97C4:
  $97C4  FF        .db $FF
  $97C5  FF        .db $FF
  $97C6  7F        .db $7F
  $97C7  7F        .db $7F
  $97C8  FC        .db $FC
  $97C9  FC        .db $FC
  $97CA  FC        .db $FC
  $97CB  FE FE FE  INC $FEFE,X
  $97CE  7E 7F 7F  ROR $7F7F,X
  $97D1  3F        .db $3F
  $97D2  3F        .db $3F
  $97D3  3F        .db $3F
  $97D4  1F        .db $1F
  $97D5  1F        .db $1F
  $97D6  1F        .db $1F
  $97D7  0F        .db $0F
  $97D8  7F        .db $7F
  $97D9  3F        .db $3F
  $97DA  3F        .db $3F
  $97DB  3F        .db $3F
  $97DC  1F        .db $1F
  $97DD  1F        .db $1F
  $97DE  1F        .db $1F
  $97DF  0F        .db $0F
  $97E0  FF        .db $FF
  $97E1  FF        .db $FF
  $97E2  FF        .db $FF
  $97E3  FF        .db $FF
  $97E4  FF        .db $FF
  $97E5  FF        .db $FF
  $97E6  FF        .db $FF
  $97E7  FF        .db $FF
  $97E8  00        BRK
  $97E9  00        BRK
  $97EA  00        BRK
  $97EB  00        BRK
  $97EC  00        BRK
  $97ED  00        BRK
  $97EE  00        BRK
  $97EF  00        BRK
  $97F0  FF        .db $FF
  $97F1  FF        .db $FF
  $97F2  FF        .db $FF
  $97F3  FF        .db $FF
  $97F4  FF        .db $FF
  $97F5  FF        .db $FF
  $97F6  FF        .db $FF
  $97F7  FF        .db $FF
  $97F8  00        BRK
  $97F9  80        .db $80
  $97FA  80        .db $80
  $97FB  C0 C0     CPY #$C0
  $97FD  C0 E0     CPY #$E0
  $97FF  E0 00     CPX #$00
  $9801  7E 7C 78  ROR $787C,X
  $9804  70 60     BVS $9866
  $9806  40        RTI
  $9807  00        BRK
  $9808  00        BRK
  $9809  00        BRK
  $980A  02        .db $02
  $980B  06 0E     ASL $0E
  $980D  1E 3E 00  ASL $003E,X
  $9810  FF        .db $FF
  $9811  FF        .db $FF
  $9812  FF        .db $FF
  $9813  FF        .db $FF
  $9814  FF        .db $FF
  $9815  FF        .db $FF
  $9816  FF        .db $FF
  $9817  FF        .db $FF
  $9818  FF        .db $FF
  $9819  FF        .db $FF
  $981A  FF        .db $FF
  $981B  FF        .db $FF
  $981C  FF        .db $FF
  $981D  FF        .db $FF
  $981E  FF        .db $FF
  $981F  FF        .db $FF
  $9820  00        BRK
  $9821  00        BRK
  $9822  00        BRK
  $9823  00        BRK
  $9824  00        BRK
  $9825  00        BRK
  $9826  00        BRK
  $9827  00        BRK
  $9828  00        BRK
  $9829  00        BRK
  $982A  00        BRK
  $982B  00        BRK
  $982C  00        BRK
  $982D  00        BRK
  $982E  00        BRK
  $982F  00        BRK
  $9830  00        BRK
  $9831  00        BRK
  $9832  00        BRK
  $9833  00        BRK
  $9834  00        BRK
  $9835  00        BRK
  $9836  00        BRK
  $9837  00        BRK
  $9838  00        BRK
  $9839  00        BRK
  $983A  00        BRK
  $983B  00        BRK
  $983C  00        BRK
  $983D  00        BRK
  $983E  00        BRK
  $983F  00        BRK
  $9840  FF        .db $FF
  $9841  FF        .db $FF
  $9842  FF        .db $FF
  $9843  FF        .db $FF
  $9844  FF        .db $FF
  $9845  FF        .db $FF
  $9846  FF        .db $FF
  $9847  FF        .db $FF
  $9848  00        BRK
  $9849  00        BRK
  $984A  00        BRK
  $984B  00        BRK
  $984C  00        BRK
  $984D  00        BRK
  $984E  00        BRK
  $984F  00        BRK
  $9850  FF        .db $FF
  $9851  FF        .db $FF
  $9852  FF        .db $FF
  $9853  FF        .db $FF
  $9854  FF        .db $FF
  $9855  FF        .db $FF
  $9856  FF        .db $FF
  $9857  FF        .db $FF
  $9858  00        BRK
  $9859  00        BRK
  $985A  00        BRK
  $985B  00        BRK
  $985C  00        BRK
  $985D  00        BRK
  $985E  00        BRK
  $985F  00        BRK
  $9860  F3        .db $F3
  $9861  F3        .db $F3
  $9862  F3        .db $F3
  $9863  F3        .db $F3
  $9864  F3        .db $F3
  $9865  F3        .db $F3

L_9866:
  $9866  F3        .db $F3
  $9867  F3        .db $F3
  $9868  FB        .db $FB
  $9869  FB        .db $FB
  $986A  FB        .db $FB
  $986B  FB        .db $FB
  $986C  FB        .db $FB
  $986D  FB        .db $FB
  $986E  FB        .db $FB
  $986F  FB        .db $FB
  $9870  F3        .db $F3
  $9871  F3        .db $F3
  $9872  F3        .db $F3
  $9873  F9 F9 F9  SBC $F9F9,Y
  $9876  F9 F9 FB  SBC $FBF9,Y
  $9879  FB        .db $FB
  $987A  FB        .db $FB
  $987B  7D 7D 7D  ADC $7D7D,X
  $987E  7D 3D FF  ADC $FF3D,X
  $9881  FF        .db $FF
  $9882  FF        .db $FF
  $9883  FF        .db $FF
  $9884  FF        .db $FF
  $9885  FF        .db $FF
  $9886  FF        .db $FF
  $9887  FF        .db $FF
  $9888  FF        .db $FF
  $9889  FF        .db $FF
  $988A  FF        .db $FF
  $988B  FF        .db $FF
  $988C  FF        .db $FF
  $988D  FF        .db $FF
  $988E  FF        .db $FF
  $988F  FF        .db $FF
  $9890  FF        .db $FF
  $9891  FF        .db $FF
  $9892  FF        .db $FF
  $9893  FF        .db $FF
  $9894  FF        .db $FF
  $9895  FF        .db $FF
  $9896  FF        .db $FF
  $9897  FF        .db $FF
  $9898  FF        .db $FF
  $9899  FF        .db $FF
  $989A  FF        .db $FF
  $989B  FF        .db $FF
  $989C  FF        .db $FF
  $989D  FF        .db $FF
  $989E  FF        .db $FF
  $989F  FF        .db $FF
  $98A0  9F        .db $9F
  $98A1  9F        .db $9F
  $98A2  9F        .db $9F
  $98A3  9F        .db $9F
  $98A4  9F        .db $9F
  $98A5  CF        .db $CF
  $98A6  CF        .db $CF
  $98A7  CF        .db $CF
  $98A8  BF        .db $BF
  $98A9  BF        .db $BF
  $98AA  BF        .db $BF
  $98AB  BF        .db $BF
  $98AC  BF        .db $BF
  $98AD  DF        .db $DF
  $98AE  DF        .db $DF
  $98AF  DF        .db $DF
  $98B0  CF        .db $CF
  $98B1  CF        .db $CF
  $98B2  CF        .db $CF
  $98B3  CF        .db $CF
  $98B4  E7        .db $E7
  $98B5  E7        .db $E7
  $98B6  E7        .db $E7
  $98B7  E7        .db $E7
  $98B8  DF        .db $DF
  $98B9  DF        .db $DF
  $98BA  DF        .db $DF
  $98BB  DF        .db $DF
  $98BC  EF        .db $EF
  $98BD  EF        .db $EF
  $98BE  EF        .db $EF
  $98BF  EF        .db $EF
  $98C0  F9 F9 F9  SBC $F9F9,Y
  $98C3  F9 F9 F9  SBC $F9F9,Y
  $98C6  F9 F9 FD  SBC $FDF9,Y
  $98C9  FD FD FD  SBC $FDFD,X
  $98CC  FD FD FD  SBC $FDFD,X
  $98CF  FD F9 F9  SBC $F9F9,X
  $98D2  FC        .db $FC
  $98D3  FC        .db $FC
  $98D4  FC        .db $FC
  $98D5  FC        .db $FC
  $98D6  FC        .db $FC
  $98D7  FC        .db $FC
  $98D8  FD FD FE  SBC $FEFD,X
  $98DB  FE FE FE  INC $FEFE,X
  $98DE  FE FE F3  INC $F3FE,X
  $98E1  F3        .db $F3
  $98E2  F3        .db $F3
  $98E3  F3        .db $F3
  $98E4  F3        .db $F3
  $98E5  F3        .db $F3
  $98E6  F3        .db $F3
  $98E7  F3        .db $F3
  $98E8  F7        .db $F7
  $98E9  F7        .db $F7
  $98EA  F7        .db $F7
  $98EB  F7        .db $F7
  $98EC  F7        .db $F7
  $98ED  F7        .db $F7
  $98EE  F7        .db $F7
  $98EF  F7        .db $F7
  $98F0  F3        .db $F3
  $98F1  F3        .db $F3
  $98F2  F3        .db $F3
  $98F3  F3        .db $F3
  $98F4  F3        .db $F3
  $98F5  F3        .db $F3
  $98F6  F9 F9 F7  SBC $F7F9,Y
  $98F9  F7        .db $F7
  $98FA  F7        .db $F7
  $98FB  F7        .db $F7
  $98FC  F7        .db $F7
  $98FD  F7        .db $F7
  $98FE  FB        .db $FB
  $98FF  FB        .db $FB
  $9900  CF        .db $CF
  $9901  CF        .db $CF
  $9902  CF        .db $CF
  $9903  CF        .db $CF
  $9904  CF        .db $CF
  $9905  CF        .db $CF
  $9906  CF        .db $CF
  $9907  CF        .db $CF
  $9908  EF        .db $EF
  $9909  EF        .db $EF
  $990A  EF        .db $EF
  $990B  EF        .db $EF
  $990C  EF        .db $EF
  $990D  EF        .db $EF
  $990E  EF        .db $EF
  $990F  EF        .db $EF
  $9910  CF        .db $CF
  $9911  CF        .db $CF
  $9912  CF        .db $CF
  $9913  CF        .db $CF
  $9914  CF        .db $CF
  $9915  CF        .db $CF
  $9916  9F        .db $9F
  $9917  9F        .db $9F
  $9918  EF        .db $EF
  $9919  EF        .db $EF
  $991A  EF        .db $EF
  $991B  EF        .db $EF
  $991C  EF        .db $EF
  $991D  EF        .db $EF
  $991E  DF        .db $DF
  $991F  DF        .db $DF
  $9920  9F        .db $9F
  $9921  9F        .db $9F
  $9922  9F        .db $9F
  $9923  9F        .db $9F
  $9924  9F        .db $9F
  $9925  9F        .db $9F
  $9926  9F        .db $9F
  $9927  9F        .db $9F
  $9928  BF        .db $BF
  $9929  BF        .db $BF
  $992A  BF        .db $BF
  $992B  BF        .db $BF
  $992C  BF        .db $BF
  $992D  BF        .db $BF
  $992E  BF        .db $BF
  $992F  BF        .db $BF
  $9930  9F        .db $9F
  $9931  9F        .db $9F
  $9932  3F        .db $3F
  $9933  3F        .db $3F
  $9934  3F        .db $3F
  $9935  3F        .db $3F
  $9936  3F        .db $3F
  $9937  3F        .db $3F
  $9938  BF        .db $BF
  $9939  BF        .db $BF
  $993A  7F        .db $7F
  $993B  7F        .db $7F
  $993C  7F        .db $7F
  $993D  7F        .db $7F
  $993E  7F        .db $7F
  $993F  7F        .db $7F
  $9940  F9 F9 F9  SBC $F9F9,Y
  $9943  F9 F9 F3  SBC $F3F9,Y
  $9946  F3        .db $F3
  $9947  F3        .db $F3
  $9948  FD FD FD  SBC $FDFD,X
  $994B  FD FD FB  SBC $FBFD,X
  $994E  FB        .db $FB
  $994F  FB        .db $FB
  $9950  F3        .db $F3
  $9951  F3        .db $F3
  $9952  F3        .db $F3
  $9953  F3        .db $F3
  $9954  E7        .db $E7
  $9955  E7        .db $E7
  $9956  E7        .db $E7
  $9957  E7        .db $E7
  $9958  FB        .db $FB
  $9959  FB        .db $FB
  $995A  FB        .db $FB
  $995B  FB        .db $FB
  $995C  F7        .db $F7
  $995D  F7        .db $F7
  $995E  F7        .db $F7
  $995F  F7        .db $F7
  $9960  FF        .db $FF
  $9961  FF        .db $FF
  $9962  FF        .db $FF
  $9963  FF        .db $FF
  $9964  FF        .db $FF
  $9965  FF        .db $FF
  $9966  FF        .db $FF
  $9967  FF        .db $FF
  $9968  FF        .db $FF
  $9969  FF        .db $FF
  $996A  FF        .db $FF
  $996B  FF        .db $FF
  $996C  FF        .db $FF
  $996D  FF        .db $FF
  $996E  FF        .db $FF
  $996F  FF        .db $FF
  $9970  FF        .db $FF
  $9971  FF        .db $FF
  $9972  FF        .db $FF
  $9973  FF        .db $FF
  $9974  FF        .db $FF
  $9975  FF        .db $FF
  $9976  FF        .db $FF
  $9977  FF        .db $FF
  $9978  FF        .db $FF
  $9979  FF        .db $FF
  $997A  FF        .db $FF
  $997B  FF        .db $FF
  $997C  FF        .db $FF
  $997D  FF        .db $FF
  $997E  FF        .db $FF
  $997F  FF        .db $FF
  $9980  CF        .db $CF
  $9981  CF        .db $CF
  $9982  CF        .db $CF
  $9983  CF        .db $CF
  $9984  CF        .db $CF
  $9985  CF        .db $CF
  $9986  CF        .db $CF
  $9987  CF        .db $CF
  $9988  DF        .db $DF
  $9989  DF        .db $DF
  $998A  DF        .db $DF
  $998B  DF        .db $DF
  $998C  DF        .db $DF
  $998D  DF        .db $DF
  $998E  DF        .db $DF
  $998F  DF        .db $DF
  $9990  CF        .db $CF
  $9991  CF        .db $CF
  $9992  CF        .db $CF
  $9993  9F        .db $9F
  $9994  9F        .db $9F
  $9995  9F        .db $9F
  $9996  9F        .db $9F
  $9997  9F        .db $9F
  $9998  DF        .db $DF
  $9999  DF        .db $DF
  $999A  DF        .db $DF
  $999B  BF        .db $BF
  $999C  BF        .db $BF
  $999D  BF        .db $BF
  $999E  BF        .db $BF
  $999F  BF        .db $BF
  $99A0  FF        .db $FF
  $99A1  FF        .db $FF
  $99A2  FF        .db $FF
  $99A3  FF        .db $FF
  $99A4  FF        .db $FF
  $99A5  FF        .db $FF
  $99A6  FF        .db $FF
  $99A7  FF        .db $FF
  $99A8  FF        .db $FF
  $99A9  FF        .db $FF
  $99AA  FF        .db $FF
  $99AB  FF        .db $FF
  $99AC  FF        .db $FF
  $99AD  FF        .db $FF
  $99AE  FF        .db $FF
  $99AF  FF        .db $FF
  $99B0  FF        .db $FF
  $99B1  FF        .db $FF
  $99B2  FF        .db $FF
  $99B3  FF        .db $FF
  $99B4  FF        .db $FF
  $99B5  FF        .db $FF
  $99B6  FE FE FF  INC $FFFE,X
  $99B9  FF        .db $FF
  $99BA  FF        .db $FF
  $99BB  FF        .db $FF
  $99BC  FF        .db $FF
  $99BD  FF        .db $FF
  $99BE  FF        .db $FF
  $99BF  FF        .db $FF
  $99C0  9F        .db $9F
  $99C1  9F        .db $9F
  $99C2  9F        .db $9F
  $99C3  9F        .db $9F
  $99C4  9F        .db $9F
  $99C5  9F        .db $9F
  $99C6  9F        .db $9F
  $99C7  9F        .db $9F
  $99C8  DF        .db $DF
  $99C9  DF        .db $DF
  $99CA  DF        .db $DF
  $99CB  DF        .db $DF
  $99CC  DF        .db $DF
  $99CD  DF        .db $DF
  $99CE  DF        .db $DF
  $99CF  DF        .db $DF
  $99D0  9F        .db $9F
  $99D1  3F        .db $3F
  $99D2  3F        .db $3F
  $99D3  3F        .db $3F
  $99D4  3F        .db $3F
  $99D5  3F        .db $3F
  $99D6  7F        .db $7F
  $99D7  7F        .db $7F
  $99D8  DF        .db $DF
  $99D9  BF        .db $BF

L_99DA:
  $99DA  BF        .db $BF
  $99DB  BF        .db $BF

L_99DC:
  $99DC  BF        .db $BF
  $99DD  BF        .db $BF
  $99DE  7F        .db $7F
  $99DF  7F        .db $7F
  $99E0  F3        .db $F3
  $99E1  F3        .db $F3
  $99E2  F3        .db $F3
  $99E3  F3        .db $F3
  $99E4  E7        .db $E7
  $99E5  E7        .db $E7
  $99E6  E7        .db $E7
  $99E7  E7        .db $E7
  $99E8  F0 F0     BEQ $99DA
  $99EA  F0 F0     BEQ $99DC
  $99EC  E0 E0     CPX #$E0
  $99EE  E0 E0     CPX #$E0
  $99F0  E7        .db $E7
  $99F1  C7        .db $C7
  $99F2  C7        .db $C7
  $99F3  CF        .db $CF
  $99F4  CF        .db $CF
  $99F5  8F        .db $8F
  $99F6  9F        .db $9F

L_99F7:
  $99F7  9F        .db $9F
  $99F8  E0 C0     CPX #$C0
  $99FA  C0 C0     CPY #$C0
  $99FC  C0 80     CPY #$80
  $99FE  80        .db $80
  $99FF  80        .db $80
  $9A00  FC        .db $FC
  $9A01  F8        SED
  $9A02  F8        SED
  $9A03  F8        SED
  $9A04  F8        SED
  $9A05  F0 F0     BEQ $99F7
  $9A07  F0 00     BEQ $9A09

L_9A09:
  $9A09  00        BRK
  $9A0A  00        BRK
  $9A0B  00        BRK
  $9A0C  00        BRK
  $9A0D  00        BRK
  $9A0E  00        BRK
  $9A0F  00        BRK
  $9A10  E0 E0     CPX #$E0
  $9A12  E0 C0     CPX #$C0
  $9A14  C0 80     CPY #$80
  $9A16  80        .db $80
  $9A17  00        BRK
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
  $9A23  01 01     ORA ($01,X)
  $9A25  01 03     ORA ($03,X)
  $9A27  03        .db $03
  $9A28  00        BRK
  $9A29  00        BRK
  $9A2A  00        BRK
  $9A2B  00        BRK
  $9A2C  00        BRK
  $9A2D  00        BRK
  $9A2E  00        BRK
  $9A2F  00        BRK
  $9A30  06 06     ASL $06
  $9A32  0C        .db $0C
  $9A33  0C        .db $0C
  $9A34  18        CLC
  $9A35  18        CLC
  $9A36  30 30     BMI $9A68
  $9A38  00        BRK
  $9A39  00        BRK
  $9A3A  00        BRK
  $9A3B  00        BRK
  $9A3C  00        BRK
  $9A3D  00        BRK
  $9A3E  00        BRK
  $9A3F  00        BRK
  $9A40  61 C1     ADC ($C1,X)
  $9A42  C3        .db $C3
  $9A43  82        .db $82
  $9A44  82        .db $82
  $9A45  84 05     STY $05
  $9A47  09 00     ORA #$00
  $9A49  00        BRK
  $9A4A  00        BRK
  $9A4B  00        BRK
  $9A4C  00        BRK
  $9A4D  00        BRK
  $9A4E  01 01     ORA ($01,X)
  $9A50  0B        .db $0B
  $9A51  13        .db $13
  $9A52  17        .db $17
  $9A53  37        .db $37
  $9A54  67        .db $67
  $9A55  47        .db $47
  $9A56  C7        .db $C7
  $9A57  A7        .db $A7
  $9A58  03        .db $03
  $9A59  03        .db $03
  $9A5A  07        .db $07
  $9A5B  07        .db $07
  $9A5C  0F        .db $0F
  $9A5D  0F        .db $0F
  $9A5E  0F        .db $0F
  $9A5F  2F        .db $2F
  $9A60  A7        .db $A7
  $9A61  27        .db $27
  $9A62  67        .db $67
  $9A63  67        .db $67
  $9A64  E7        .db $E7
  $9A65  E7        .db $E7
  $9A66  E7        .db $E7
  $9A67  E7        .db $E7

L_9A68:
  $9A68  37        .db $37
  $9A69  37        .db $37
  $9A6A  77        .db $77
  $9A6B  77        .db $77
  $9A6C  F7        .db $F7
  $9A6D  F7        .db $F7
  $9A6E  F7        .db $F7
  $9A6F  F7        .db $F7
  $9A70  E7        .db $E7
  $9A71  E7        .db $E7
  $9A72  E7        .db $E7
  $9A73  E7        .db $E7
  $9A74  E7        .db $E7
  $9A75  E7        .db $E7
  $9A76  E7        .db $E7
  $9A77  E7        .db $E7
  $9A78  F7        .db $F7
  $9A79  F7        .db $F7
  $9A7A  F7        .db $F7
  $9A7B  F7        .db $F7
  $9A7C  F7        .db $F7
  $9A7D  F7        .db $F7
  $9A7E  F7        .db $F7
  $9A7F  F7        .db $F7
  $9A80  E7        .db $E7
  $9A81  E7        .db $E7
  $9A82  E7        .db $E7
  $9A83  E7        .db $E7
  $9A84  E7        .db $E7
  $9A85  E7        .db $E7
  $9A86  E7        .db $E7
  $9A87  E7        .db $E7
  $9A88  EF        .db $EF
  $9A89  EF        .db $EF
  $9A8A  EF        .db $EF
  $9A8B  EF        .db $EF
  $9A8C  EF        .db $EF
  $9A8D  EF        .db $EF
  $9A8E  EF        .db $EF
  $9A8F  EF        .db $EF
  $9A90  E7        .db $E7
  $9A91  E7        .db $E7
  $9A92  E7        .db $E7
  $9A93  E7        .db $E7
  $9A94  E7        .db $E7
  $9A95  E7        .db $E7
  $9A96  E7        .db $E7
  $9A97  E7        .db $E7
  $9A98  EF        .db $EF
  $9A99  EF        .db $EF
  $9A9A  EF        .db $EF
  $9A9B  EF        .db $EF
  $9A9C  EF        .db $EF
  $9A9D  EF        .db $EF
  $9A9E  EF        .db $EF

L_9A9F:
  $9A9F  EF        .db $EF
  $9AA0  E5 E6     SBC $E6
  $9AA2  E6 E7     INC $E7
  $9AA4  E7        .db $E7
  $9AA5  E7        .db $E7
  $9AA6  E7        .db $E7
  $9AA7  E7        .db $E7
  $9AA8  F4        .db $F4
  $9AA9  F6 F6     INC $F6,X
  $9AAB  F7        .db $F7
  $9AAC  F7        .db $F7
  $9AAD  F7        .db $F7
  $9AAE  F7        .db $F7
  $9AAF  F7        .db $F7
  $9AB0  E7        .db $E7
  $9AB1  E7        .db $E7
  $9AB2  E7        .db $E7
  $9AB3  E7        .db $E7
  $9AB4  E7        .db $E7
  $9AB5  E7        .db $E7
  $9AB6  E7        .db $E7
  $9AB7  E7        .db $E7
  $9AB8  F7        .db $F7
  $9AB9  F7        .db $F7
  $9ABA  F7        .db $F7
  $9ABB  F7        .db $F7
  $9ABC  F7        .db $F7
  $9ABD  F7        .db $F7
  $9ABE  F7        .db $F7
  $9ABF  F7        .db $F7
  $9AC0  86 86     STX $86
  $9AC2  C3        .db $C3
  $9AC3  61 21     ADC ($21,X)
  $9AC5  90 D8     BCC $9A9F
  $9AC7  E8        INX
  $9AC8  00        BRK
  $9AC9  00        BRK
  $9ACA  00        BRK
  $9ACB  00        BRK
  $9ACC  00        BRK
  $9ACD  80        .db $80
  $9ACE  C0 E0     CPY #$E0
  $9AD0  E4 EA     CPX $EA
  $9AD2  E1 E4     SBC ($E4,X)
  $9AD4  E6 E7     INC $E7
  $9AD6  E7        .db $E7
  $9AD7  E7        .db $E7
  $9AD8  E0 E8     CPX #$E8
  $9ADA  E8        INX
  $9ADB  EC EE EF  CPX $EFEE
  $9ADE  EF        .db $EF
  $9ADF  EF        .db $EF
  $9AE0  00        BRK
  $9AE1  00        BRK
  $9AE2  00        BRK
  $9AE3  00        BRK
  $9AE4  80        .db $80
  $9AE5  C0 40     CPY #$40
  $9AE7  20 00 00  JSR $0000
  $9AEA  00        BRK
  $9AEB  00        BRK
  $9AEC  00        BRK
  $9AED  00        BRK
  $9AEE  00        BRK
  $9AEF  00        BRK
  $9AF0  30 10     BMI $9B02
  $9AF2  08        PHP
  $9AF3  84 42     STY $42
  $9AF5  21 90     AND ($90,X)
  $9AF7  C8        INY
  $9AF8  00        BRK
  $9AF9  00        BRK
  $9AFA  00        BRK
  $9AFB  00        BRK
  $9AFC  00        BRK
  $9AFD  00        BRK
  $9AFE  80        .db $80
  $9AFF  C0 07     CPY #$07
  $9B01  07        .db $07

L_9B02:
  $9B02  07        .db $07
  $9B03  03        .db $03
  $9B04  03        .db $03
  $9B05  01 01     ORA ($01,X)
  $9B07  00        BRK
  $9B08  07        .db $07
  $9B09  07        .db $07
  $9B0A  07        .db $07
  $9B0B  03        .db $03
  $9B0C  03        .db $03
  $9B0D  01 01     ORA ($01,X)
  $9B0F  00        BRK
  $9B10  00        BRK
  $9B11  00        BRK
  $9B12  00        BRK
  $9B13  00        BRK
  $9B14  00        BRK
  $9B15  00        BRK
  $9B16  80        .db $80
  $9B17  40        RTI
  $9B18  00        BRK
  $9B19  00        BRK

L_9B1A:
  $9B1A  00        BRK
  $9B1B  00        BRK
  $9B1C  00        BRK
  $9B1D  00        BRK
  $9B1E  00        BRK
  $9B1F  00        BRK
  $9B20  FF        .db $FF
  $9B21  FF        .db $FF
  $9B22  FF        .db $FF
  $9B23  FF        .db $FF

L_9B24:
  $9B24  FF        .db $FF
  $9B25  FF        .db $FF
  $9B26  FF        .db $FF
  $9B27  FF        .db $FF
  $9B28  F0 F0     BEQ $9B1A
  $9B2A  F0 F8     BEQ $9B24
  $9B2C  FC        .db $FC
  $9B2D  FC        .db $FC
  $9B2E  FE FF 7F  INC $7FFF,X
  $9B31  7F        .db $7F
  $9B32  3F        .db $3F
  $9B33  1F        .db $1F
  $9B34  0F        .db $0F
  $9B35  07        .db $07
  $9B36  03        .db $03
  $9B37  03        .db $03
  $9B38  7F        .db $7F
  $9B39  7F        .db $7F
  $9B3A  3F        .db $3F
  $9B3B  1F        .db $1F
  $9B3C  0F        .db $0F
  $9B3D  07        .db $07
  $9B3E  03        .db $03
  $9B3F  03        .db $03
  $9B40  FF        .db $FF
  $9B41  FF        .db $FF
  $9B42  FF        .db $FF
  $9B43  FF        .db $FF
  $9B44  FF        .db $FF
  $9B45  FF        .db $FF
  $9B46  FF        .db $FF
  $9B47  FF        .db $FF
  $9B48  00        BRK
  $9B49  00        BRK
  $9B4A  00        BRK
  $9B4B  00        BRK
  $9B4C  00        BRK
  $9B4D  00        BRK
  $9B4E  00        BRK

L_9B4F:
  $9B4F  00        BRK
  $9B50  FF        .db $FF
  $9B51  FF        .db $FF
  $9B52  FF        .db $FF
  $9B53  FF        .db $FF
  $9B54  FF        .db $FF
  $9B55  FF        .db $FF
  $9B56  FF        .db $FF
  $9B57  FF        .db $FF
  $9B58  00        BRK
  $9B59  80        .db $80
  $9B5A  80        .db $80
  $9B5B  C0 E0     CPY #$E0
  $9B5D  F0 F0     BEQ $9B4F
  $9B5F  F8        SED
  $9B60  F9 F9 F9  SBC $F9F9,Y
  $9B63  FC        .db $FC
  $9B64  FC        .db $FC
  $9B65  FC        .db $FC
  $9B66  FE FE 3D  INC $3DFE,X
  $9B69  3D 3D 1E  AND $1E3D,X
  $9B6C  1E 1E 0F  ASL $0F1E,X
  $9B6F  0F        .db $0F
  $9B70  FE FF FF  INC $FFFF,X
  $9B73  FF        .db $FF
  $9B74  FF        .db $FF
  $9B75  FF        .db $FF
  $9B76  FF        .db $FF
  $9B77  FF        .db $FF
  $9B78  0F        .db $0F
  $9B79  07        .db $07
  $9B7A  07        .db $07
  $9B7B  03        .db $03
  $9B7C  03        .db $03
  $9B7D  03        .db $03
  $9B7E  01 01     ORA ($01,X)
  $9B80  FF        .db $FF
  $9B81  FF        .db $FF
  $9B82  FF        .db $FF
  $9B83  FF        .db $FF
  $9B84  FF        .db $FF
  $9B85  FF        .db $FF
  $9B86  7F        .db $7F
  $9B87  7F        .db $7F
  $9B88  FF        .db $FF
  $9B89  FF        .db $FF
  $9B8A  FF        .db $FF
  $9B8B  FF        .db $FF
  $9B8C  FF        .db $FF
  $9B8D  FF        .db $FF
  $9B8E  7F        .db $7F
  $9B8F  7F        .db $7F
  $9B90  7F        .db $7F
  $9B91  3F        .db $3F
  $9B92  3F        .db $3F
  $9B93  3F        .db $3F
  $9B94  9F        .db $9F
  $9B95  9F        .db $9F
  $9B96  9F        .db $9F
  $9B97  CF        .db $CF
  $9B98  7F        .db $7F
  $9B99  BF        .db $BF
  $9B9A  BF        .db $BF
  $9B9B  BF        .db $BF
  $9B9C  DF        .db $DF
  $9B9D  DF        .db $DF
  $9B9E  DF        .db $DF
  $9B9F  EF        .db $EF
  $9BA0  E7        .db $E7
  $9BA1  E7        .db $E7
  $9BA2  F3        .db $F3
  $9BA3  F3        .db $F3
  $9BA4  F3        .db $F3
  $9BA5  F3        .db $F3
  $9BA6  F9 F9 EF  SBC $EFF9,Y
  $9BA9  EF        .db $EF
  $9BAA  F7        .db $F7
  $9BAB  F7        .db $F7
  $9BAC  F7        .db $F7
  $9BAD  F7        .db $F7
  $9BAE  FB        .db $FB
  $9BAF  FB        .db $FB
  $9BB0  F9 FC FC  SBC $FCFC,Y
  $9BB3  FC        .db $FC
  $9BB4  FE FE FE  INC $FEFE,X
  $9BB7  FF        .db $FF
  $9BB8  FB        .db $FB
  $9BB9  FD FD FD  SBC $FDFD,X
  $9BBC  FE FE FE  INC $FEFE,X
  $9BBF  FF        .db $FF
  $9BC0  FC        .db $FC
  $9BC1  FE FE FE  INC $FEFE,X
  $9BC4  FE FE FE  INC $FEFE,X
  $9BC7  FE FE FF  INC $FFFE,X
  $9BCA  FF        .db $FF
  $9BCB  FF        .db $FF
  $9BCC  FF        .db $FF
  $9BCD  FF        .db $FF
  $9BCE  FF        .db $FF
  $9BCF  FF        .db $FF
  $9BD0  FF        .db $FF
  $9BD1  FF        .db $FF
  $9BD2  FF        .db $FF
  $9BD3  FF        .db $FF
  $9BD4  7F        .db $7F
  $9BD5  7F        .db $7F
  $9BD6  7F        .db $7F
  $9BD7  3F        .db $3F
  $9BD8  FF        .db $FF
  $9BD9  FF        .db $FF
  $9BDA  FF        .db $FF
  $9BDB  FF        .db $FF
  $9BDC  FF        .db $FF
  $9BDD  FF        .db $FF
  $9BDE  FF        .db $FF
  $9BDF  7F        .db $7F
  $9BE0  F9 79 79  SBC $7979,Y
  $9BE3  79 79 79  ADC $7979,Y
  $9BE6  79 79 FB  ADC $FB79,Y
  $9BE9  7B        .db $7B
  $9BEA  7B        .db $7B
  $9BEB  7B        .db $7B
  $9BEC  7B        .db $7B
  $9BED  7B        .db $7B
  $9BEE  7B        .db $7B
  $9BEF  7B        .db $7B
  $9BF0  39 39 39  AND $3939,Y
  $9BF3  39 39 39  AND $3939,Y
  $9BF6  99 99 BB  STA $BB99,Y
  $9BF9  BB        .db $BB
  $9BFA  BB        .db $BB
  $9BFB  BB        .db $BB
  $9BFC  BB        .db $BB
  $9BFD  BB        .db $BB
  $9BFE  DB        .db $DB
  $9BFF  DB        .db $DB
  $9C00  9F        .db $9F
  $9C01  9E        .db $9E
  $9C02  9E        .db $9E
  $9C03  9E        .db $9E
  $9C04  9E        .db $9E
  $9C05  9E        .db $9E
  $9C06  9E        .db $9E
  $9C07  9E        .db $9E
  $9C08  DF        .db $DF
  $9C09  DE DE DE  DEC $DEDE,X
  $9C0C  DE DE DE  DEC $DEDE,X
  $9C0F  DE 9C 9C  DEC $9C9C,X
  $9C12  9C        .db $9C
  $9C13  9C        .db $9C
  $9C14  9C        .db $9C
  $9C15  9C        .db $9C
  $9C16  99 99 DD  STA $DD99,Y
  $9C19  DD DD DD  CMP $DDDD,X
  $9C1C  DD DD DB  CMP $DBDD,X
  $9C1F  DB        .db $DB
  $9C20  3F        .db $3F
  $9C21  7F        .db $7F
  $9C22  7F        .db $7F
  $9C23  7F        .db $7F
  $9C24  7F        .db $7F
  $9C25  7F        .db $7F
  $9C26  7F        .db $7F
  $9C27  7F        .db $7F
  $9C28  7F        .db $7F
  $9C29  FF        .db $FF
  $9C2A  FF        .db $FF
  $9C2B  FF        .db $FF
  $9C2C  FF        .db $FF
  $9C2D  FF        .db $FF
  $9C2E  FF        .db $FF
  $9C2F  FF        .db $FF
  $9C30  FF        .db $FF
  $9C31  FF        .db $FF
  $9C32  FF        .db $FF
  $9C33  FF        .db $FF
  $9C34  FE FE FE  INC $FEFE,X
  $9C37  FC        .db $FC
  $9C38  FF        .db $FF
  $9C39  FF        .db $FF
  $9C3A  FF        .db $FF
  $9C3B  FF        .db $FF
  $9C3C  FF        .db $FF
  $9C3D  FF        .db $FF
  $9C3E  FF        .db $FF
  $9C3F  FE E7 E7  INC $E7E7,X
  $9C42  CF        .db $CF
  $9C43  CF        .db $CF
  $9C44  CF        .db $CF
  $9C45  CF        .db $CF
  $9C46  9F        .db $9F
  $9C47  9F        .db $9F
  $9C48  F7        .db $F7
  $9C49  F7        .db $F7
  $9C4A  EF        .db $EF
  $9C4B  EF        .db $EF
  $9C4C  EF        .db $EF
  $9C4D  EF        .db $EF
  $9C4E  DF        .db $DF
  $9C4F  DF        .db $DF
  $9C50  9F        .db $9F
  $9C51  3F        .db $3F
  $9C52  3F        .db $3F
  $9C53  3F        .db $3F
  $9C54  7F        .db $7F
  $9C55  7F        .db $7F
  $9C56  7F        .db $7F
  $9C57  FF        .db $FF
  $9C58  DF        .db $DF
  $9C59  BF        .db $BF
  $9C5A  BF        .db $BF
  $9C5B  BF        .db $BF
  $9C5C  7F        .db $7F
  $9C5D  7F        .db $7F
  $9C5E  7F        .db $7F
  $9C5F  FF        .db $FF
  $9C60  FF        .db $FF
  $9C61  FF        .db $FF
  $9C62  FF        .db $FF
  $9C63  FF        .db $FF
  $9C64  FF        .db $FF
  $9C65  FF        .db $FF
  $9C66  FE FE FF  INC $FFFE,X
  $9C69  FF        .db $FF
  $9C6A  FF        .db $FF
  $9C6B  FF        .db $FF
  $9C6C  FF        .db $FF
  $9C6D  FF        .db $FF
  $9C6E  FE FE FE  INC $FEFE,X
  $9C71  FC        .db $FC
  $9C72  FC        .db $FC
  $9C73  FC        .db $FC
  $9C74  F9 F9 F9  SBC $F9F9,Y
  $9C77  F3        .db $F3
  $9C78  FE FD FD  INC $FDFD,X
  $9C7B  FD FB FB  SBC $FBFB,X
  $9C7E  FB        .db $FB
  $9C7F  F7        .db $F7
  $9C80  9F        .db $9F
  $9C81  9F        .db $9F
  $9C82  9F        .db $9F
  $9C83  3F        .db $3F
  $9C84  3F        .db $3F
  $9C85  3F        .db $3F
  $9C86  7F        .db $7F
  $9C87  7F        .db $7F
  $9C88  BF        .db $BF
  $9C89  BF        .db $BF
  $9C8A  BF        .db $BF
  $9C8B  7F        .db $7F
  $9C8C  7F        .db $7F
  $9C8D  7F        .db $7F
  $9C8E  FF        .db $FF
  $9C8F  FF        .db $FF
  $9C90  7F        .db $7F
  $9C91  FF        .db $FF
  $9C92  FF        .db $FF
  $9C93  FF        .db $FF
  $9C94  FF        .db $FF
  $9C95  FF        .db $FF
  $9C96  FF        .db $FF
  $9C97  FF        .db $FF
  $9C98  FF        .db $FF
  $9C99  FF        .db $FF
  $9C9A  FF        .db $FF
  $9C9B  FF        .db $FF
  $9C9C  FF        .db $FF
  $9C9D  FF        .db $FF
  $9C9E  FF        .db $FF
  $9C9F  FF        .db $FF
  $9CA0  FE FC FC  INC $FCFC,X
  $9CA3  FC        .db $FC
  $9CA4  F9 F9 F9  SBC $F9F9,Y
  $9CA7  F3        .db $F3
  $9CA8  FF        .db $FF
  $9CA9  FE FE FE  INC $FEFE,X
  $9CAC  FD FD FD  SBC $FDFD,X
  $9CAF  FB        .db $FB
  $9CB0  F3        .db $F3

L_9CB1:
  $9CB1  E7        .db $E7
  $9CB2  E7        .db $E7
  $9CB3  CF        .db $CF
  $9CB4  CF        .db $CF
  $9CB5  9F        .db $9F
  $9CB6  9E        .db $9E
  $9CB7  3E FB F7  ROL $F7FB,X
  $9CBA  F7        .db $F7
  $9CBB  EF        .db $EF
  $9CBC  EF        .db $EF
  $9CBD  DF        .db $DF
  $9CBE  DE BE 7F  DEC $7FBE,X
  $9CC1  FF        .db $FF
  $9CC2  FE FC FC  INC $FCFC,X
  $9CC5  F8        SED
  $9CC6  F8        SED
  $9CC7  F0 7F     BEQ $9D48
  $9CC9  FF        .db $FF
  $9CCA  FE FC FC  INC $FCFC,X
  $9CCD  F8        SED
  $9CCE  F8        SED
  $9CCF  F0 E0     BEQ $9CB1
  $9CD1  E1 C1     SBC ($C1,X)
  $9CD3  C3        .db $C3
  $9CD4  87        .db $87
  $9CD5  06 0C     ASL $0C
  $9CD7  1C        .db $1C

L_9CD8:
  $9CD8  E0 E0     CPX #$E0
  $9CDA  C0 C0     CPY #$C0
  $9CDC  80        .db $80
  $9CDD  00        BRK
  $9CDE  00        BRK
  $9CDF  00        BRK
  $9CE0  1F        .db $1F
  $9CE1  1E 3C 3C  ASL $3C3C,X
  $9CE4  38        SEC
  $9CE5  78        SEI
  $9CE6  70 F0     BVS $9CD8
  $9CE8  00        BRK
  $9CE9  00        BRK
  $9CEA  00        BRK
  $9CEB  00        BRK
  $9CEC  00        BRK
  $9CED  00        BRK
  $9CEE  00        BRK
  $9CEF  00        BRK
  $9CF0  E0 C0     CPX #$C0
  $9CF2  C0 80     CPY #$80
  $9CF4  00        BRK
  $9CF5  00        BRK
  $9CF6  01 02     ORA ($02,X)
  $9CF8  00        BRK
  $9CF9  00        BRK
  $9CFA  00        BRK
  $9CFB  00        BRK
  $9CFC  00        BRK
  $9CFD  00        BRK
  $9CFE  00        BRK
  $9CFF  00        BRK
  $9D00  00        BRK
  $9D01  00        BRK
  $9D02  00        BRK
  $9D03  00        BRK
  $9D04  01 03     ORA ($03,X)
  $9D06  02        .db $02
  $9D07  04        .db $04
  $9D08  00        BRK
  $9D09  00        BRK
  $9D0A  00        BRK
  $9D0B  00        BRK
  $9D0C  00        BRK
  $9D0D  00        BRK
  $9D0E  00        BRK
  $9D0F  00        BRK
  $9D10  0C        .db $0C
  $9D11  08        PHP
  $9D12  10 21     BPL $9D35
  $9D14  42        .db $42
  $9D15  84 09     STY $09
  $9D17  13        .db $13
  $9D18  00        BRK
  $9D19  00        BRK
  $9D1A  00        BRK
  $9D1B  00        BRK
  $9D1C  00        BRK
  $9D1D  00        BRK
  $9D1E  01 03     ORA ($03,X)
  $9D20  61 61     ADC ($61,X)
  $9D22  C2        .db $C2
  $9D23  86 84     STX $84
  $9D25  09 0B     ORA #$0B
  $9D27  17        .db $17
  $9D28  00        BRK
  $9D29  00        BRK
  $9D2A  00        BRK
  $9D2B  00        BRK
  $9D2C  00        BRK
  $9D2D  01 03     ORA ($03,X)
  $9D2F  07        .db $07
  $9D30  27        .db $27
  $9D31  57        .db $57
  $9D32  87        .db $87
  $9D33  27        .db $27
  $9D34  67        .db $67

L_9D35:
  $9D35  E7        .db $E7
  $9D36  E7        .db $E7
  $9D37  E7        .db $E7
  $9D38  07        .db $07
  $9D39  17        .db $17
  $9D3A  17        .db $17
  $9D3B  37        .db $37
  $9D3C  77        .db $77
  $9D3D  F7        .db $F7
  $9D3E  F7        .db $F7
  $9D3F  F7        .db $F7
  $9D40  A7        .db $A7
  $9D41  67        .db $67
  $9D42  67        .db $67
  $9D43  E7        .db $E7
  $9D44  E7        .db $E7
  $9D45  E7        .db $E7
  $9D46  E7        .db $E7
  $9D47  E7        .db $E7

L_9D48:
  $9D48  2F        .db $2F
  $9D49  6F        .db $6F
  $9D4A  6F        .db $6F
  $9D4B  EF        .db $EF
  $9D4C  EF        .db $EF
  $9D4D  EF        .db $EF
  $9D4E  EF        .db $EF
  $9D4F  EF        .db $EF
  $9D50  E7        .db $E7
  $9D51  E7        .db $E7
  $9D52  E7        .db $E7
  $9D53  E7        .db $E7
  $9D54  E7        .db $E7
  $9D55  E7        .db $E7
  $9D56  E7        .db $E7
  $9D57  E7        .db $E7
  $9D58  EF        .db $EF
  $9D59  EF        .db $EF
  $9D5A  EF        .db $EF
  $9D5B  EF        .db $EF
  $9D5C  EF        .db $EF
  $9D5D  EF        .db $EF
  $9D5E  EF        .db $EF
  $9D5F  EF        .db $EF
  $9D60  E7        .db $E7
  $9D61  E7        .db $E7
  $9D62  E7        .db $E7
  $9D63  E7        .db $E7
  $9D64  E7        .db $E7
  $9D65  E7        .db $E7
  $9D66  E7        .db $E7
  $9D67  E7        .db $E7
  $9D68  F7        .db $F7
  $9D69  F7        .db $F7
  $9D6A  F7        .db $F7
  $9D6B  F7        .db $F7
  $9D6C  F7        .db $F7
  $9D6D  F7        .db $F7
  $9D6E  F7        .db $F7
  $9D6F  F7        .db $F7
  $9D70  E7        .db $E7
  $9D71  E7        .db $E7
  $9D72  E7        .db $E7
  $9D73  E7        .db $E7
  $9D74  E7        .db $E7
  $9D75  E7        .db $E7
  $9D76  E7        .db $E7
  $9D77  E7        .db $E7
  $9D78  F7        .db $F7
  $9D79  F7        .db $F7
  $9D7A  F7        .db $F7
  $9D7B  F7        .db $F7
  $9D7C  F7        .db $F7
  $9D7D  F7        .db $F7
  $9D7E  F7        .db $F7
  $9D7F  F7        .db $F7
  $9D80  E7        .db $E7
  $9D81  E7        .db $E7
  $9D82  E7        .db $E7
  $9D83  E7        .db $E7
  $9D84  E7        .db $E7
  $9D85  E7        .db $E7
  $9D86  E7        .db $E7
  $9D87  E7        .db $E7
  $9D88  EF        .db $EF
  $9D89  EF        .db $EF
  $9D8A  EF        .db $EF
  $9D8B  EF        .db $EF
  $9D8C  EF        .db $EF
  $9D8D  EF        .db $EF
  $9D8E  EF        .db $EF
  $9D8F  EF        .db $EF
  $9D90  E7        .db $E7
  $9D91  E7        .db $E7
  $9D92  E7        .db $E7
  $9D93  E7        .db $E7
  $9D94  E7        .db $E7
  $9D95  E7        .db $E7
  $9D96  E7        .db $E7
  $9D97  E7        .db $E7
  $9D98  EF        .db $EF
  $9D99  EF        .db $EF
  $9D9A  EF        .db $EF
  $9D9B  EF        .db $EF
  $9D9C  EF        .db $EF
  $9D9D  EF        .db $EF
  $9D9E  EF        .db $EF
  $9D9F  EF        .db $EF
  $9DA0  E4 E3     CPX $E3
  $9DA2  E5 E6     SBC $E6
  $9DA4  E7        .db $E7
  $9DA5  E7        .db $E7
  $9DA6  E7        .db $E7
  $9DA7  E7        .db $E7
  $9DA8  E0 F0     CPX #$F0
  $9DAA  F4        .db $F4
  $9DAB  F6 F7     INC $F7,X
  $9DAD  F7        .db $F7
  $9DAE  F7        .db $F7
  $9DAF  F7        .db $F7
  $9DB0  E7        .db $E7
  $9DB1  E7        .db $E7
  $9DB2  E7        .db $E7
  $9DB3  E7        .db $E7
  $9DB4  E7        .db $E7
  $9DB5  E7        .db $E7
  $9DB6  E7        .db $E7
  $9DB7  E7        .db $E7
  $9DB8  F7        .db $F7
  $9DB9  F7        .db $F7
  $9DBA  F7        .db $F7
  $9DBB  F7        .db $F7
  $9DBC  F7        .db $F7
  $9DBD  F7        .db $F7
  $9DBE  F7        .db $F7
  $9DBF  F7        .db $F7
  $9DC0  20 18 84  JSR $8418
  $9DC3  C2        .db $C2
  $9DC4  31 98     AND ($98),Y
  $9DC6  E4 EB     CPX $EB
  $9DC8  00        BRK
  $9DC9  00        BRK
  $9DCA  00        BRK
  $9DCB  00        BRK
  $9DCC  00        BRK
  $9DCD  80        .db $80
  $9DCE  E0 E8     CPX #$E8
  $9DD0  E4 E6     CPX $E6
  $9DD2  E7        .db $E7
  $9DD3  E7        .db $E7
  $9DD4  E7        .db $E7
  $9DD5  E7        .db $E7
  $9DD6  E7        .db $E7
  $9DD7  E7        .db $E7
  $9DD8  EC EE EF  CPX $EFEE
  $9DDB  EF        .db $EF
  $9DDC  EF        .db $EF
  $9DDD  EF        .db $EF
  $9DDE  EF        .db $EF
  $9DDF  EF        .db $EF
  $9DE0  01 00     ORA ($00,X)
  $9DE2  00        BRK
  $9DE3  00        BRK
  $9DE4  80        .db $80
  $9DE5  60        RTS
  $9DE6  10 0C     BPL $9DF4
  $9DE8  01 00     ORA ($00,X)
  $9DEA  00        BRK
  $9DEB  00        BRK
  $9DEC  00        BRK
  $9DED  00        BRK
  $9DEE  00        BRK
  $9DEF  00        BRK
  $9DF0  82        .db $82
  $9DF1  61 18     ADC ($18,X)
  $9DF3  C6 E1     DEC $E1

L_9DF5:
  $9DF5  E0 E6     CPX #$E6
  $9DF7  E7        .db $E7
  $9DF8  00        BRK
  $9DF9  00        BRK
  $9DFA  00        BRK
  $9DFB  C0 E0     CPY #$E0
  $9DFD  F0 F6     BEQ $9DF5
  $9DFF  F7        .db $F7
  $9E00  FF        .db $FF
  $9E01  FF        .db $FF
  $9E02  7F        .db $7F
  $9E03  3F        .db $3F
  $9E04  1F        .db $1F
  $9E05  07        .db $07
  $9E06  03        .db $03
  $9E07  01 FC     ORA ($FC,X)
  $9E09  FE 7F 3F  INC $3F7F,X
  $9E0C  1F        .db $1F
  $9E0D  07        .db $07
  $9E0E  03        .db $03
  $9E0F  01 00     ORA ($00,X)
  $9E11  80        .db $80
  $9E12  60        RTS
  $9E13  18        CLC
  $9E14  84 63     STY $63
  $9E16  18        CLC
  $9E17  06 00     ASL $00
  $9E19  00        BRK
  $9E1A  00        BRK
  $9E1B  00        BRK
  $9E1C  00        BRK
  $9E1D  00        BRK
  $9E1E  00        BRK
  $9E1F  00        BRK
  $9E20  FF        .db $FF
  $9E21  FF        .db $FF
  $9E22  FF        .db $FF
  $9E23  FF        .db $FF
  $9E24  FF        .db $FF
  $9E25  FF        .db $FF
  $9E26  FF        .db $FF
  $9E27  FF        .db $FF
  $9E28  00        BRK
  $9E29  00        BRK
  $9E2A  00        BRK
  $9E2B  00        BRK
  $9E2C  80        .db $80
  $9E2D  C0 E0     CPY #$E0
  $9E2F  F0 FF     BEQ $9E30
  $9E31  3F        .db $3F
  $9E32  1F        .db $1F
  $9E33  07        .db $07
  $9E34  01 00     ORA ($00,X)
  $9E36  C0 38     CPY #$38
  $9E38  F8        SED
  $9E39  3C        .db $3C
  $9E3A  1F        .db $1F
  $9E3B  07        .db $07
  $9E3C  01 00     ORA ($00,X)
  $9E3E  00        BRK
  $9E3F  00        BRK
  $9E40  E7        .db $E7
  $9E41  E7        .db $E7
  $9E42  F3        .db $F3
  $9E43  F9 F9 FC  SBC $FCF9,Y
  $9E46  FE FE F7  INC $F7FE,X
  $9E49  F7        .db $F7
  $9E4A  7B        .db $7B
  $9E4B  7D 3D 3E  ADC $3E3D,X
  $9E4E  1F        .db $1F
  $9E4F  1F        .db $1F
  $9E50  FF        .db $FF
  $9E51  FF        .db $FF
  $9E52  FF        .db $FF
  $9E53  7F        .db $7F
  $9E54  7F        .db $7F
  $9E55  1C        .db $1C
  $9E56  1E 1F 0F  ASL $0F1F,X
  $9E59  0F        .db $0F
  $9E5A  07        .db $07
  $9E5B  07        .db $07
  $9E5C  43        .db $43
  $9E5D  03        .db $03
  $9E5E  00        BRK
  $9E5F  00        BRK
  $9E60  FF        .db $FF
  $9E61  FF        .db $FF
  $9E62  FF        .db $FF
  $9E63  FF        .db $FF
  $9E64  FF        .db $FF
  $9E65  FF        .db $FF
  $9E66  7F        .db $7F
  $9E67  7F        .db $7F
  $9E68  FF        .db $FF
  $9E69  FF        .db $FF
  $9E6A  FF        .db $FF
  $9E6B  FF        .db $FF
  $9E6C  FF        .db $FF
  $9E6D  FF        .db $FF
  $9E6E  7F        .db $7F
  $9E6F  7F        .db $7F
  $9E70  3F        .db $3F
  $9E71  9F        .db $9F
  $9E72  CF        .db $CF
  $9E73  E7        .db $E7
  $9E74  F3        .db $F3
  $9E75  F8        SED
  $9E76  7C        .db $7C
  $9E77  1E BF DF  ASL $DFBF,X
  $9E7A  EF        .db $EF
  $9E7B  F7        .db $F7
  $9E7C  FB        .db $FB
  $9E7D  FC        .db $FC
  $9E7E  FF        .db $FF
  $9E7F  1E 3F 3F  ASL $3F3F,X
  $9E82  9F        .db $9F
  $9E83  9F        .db $9F
  $9E84  9F        .db $9F
  $9E85  CF        .db $CF
  $9E86  CF        .db $CF
  $9E87  E7        .db $E7
  $9E88  7F        .db $7F
  $9E89  7F        .db $7F
  $9E8A  BF        .db $BF
  $9E8B  BF        .db $BF
  $9E8C  BF        .db $BF
  $9E8D  DF        .db $DF
  $9E8E  DF        .db $DF
  $9E8F  EF        .db $EF
  $9E90  E7        .db $E7
  $9E91  F3        .db $F3
  $9E92  F9 FC FE  SBC $FEFC,Y
  $9E95  FF        .db $FF
  $9E96  3F        .db $3F
  $9E97  07        .db $07
  $9E98  EF        .db $EF
  $9E99  F7        .db $F7
  $9E9A  FB        .db $FB
  $9E9B  FD FE FF  SBC $FFFE,X
  $9E9E  3F        .db $3F
  $9E9F  07        .db $07
  $9EA0  9C        .db $9C
  $9EA1  9C        .db $9C
  $9EA2  9C        .db $9C
  $9EA3  9C        .db $9C
  $9EA4  CC CC CC  CPY $CCCC
  $9EA7  CC DD DD  CPY $DDDD
  $9EAA  DD DD ED  CMP $EDDD,X
  $9EAD  ED ED ED  SBC $EDED
  $9EB0  E4 E4     CPX $E4
  $9EB2  E4 F0     CPX $F0
  $9EB4  70 38     BVS $9EEE
  $9EB6  18        CLC
  $9EB7  8C F5 F5  STY $F5F5
  $9EBA  F5 F9     SBC $F9,X
  $9EBC  F9 7D 3D  SBC $3D7D,Y
  $9EBF  9E        .db $9E
  $9EC0  39 39 39  AND $3939,Y
  $9EC3  39 33 33  AND $3333,Y
  $9EC6  33        .db $33
  $9EC7  73        .db $73
  $9EC8  BB        .db $BB
  $9EC9  BB        .db $BB
  $9ECA  BB        .db $BB
  $9ECB  BB        .db $BB
  $9ECC  B7        .db $B7
  $9ECD  B7        .db $B7
  $9ECE  B7        .db $B7
  $9ECF  77        .db $77
  $9ED0  67        .db $67
  $9ED1  67        .db $67
  $9ED2  67        .db $67
  $9ED3  4F        .db $4F
  $9ED4  4E 1C 18  LSR $181C
  $9ED7  31 6F     AND ($6F),Y
  $9ED9  6F        .db $6F
  $9EDA  6F        .db $6F
  $9EDB  5F        .db $5F
  $9EDC  5F        .db $5F
  $9EDD  3E 3C 79  ROL $793C,X
  $9EE0  FC        .db $FC
  $9EE1  FC        .db $FC
  $9EE2  F9 F9 F9  SBC $F9F9,Y
  $9EE5  F3        .db $F3
  $9EE6  F3        .db $F3
  $9EE7  E7        .db $E7
  $9EE8  FE FE FD  INC $FDFE,X
  $9EEB  FD FD FB  SBC $FBFD,X

L_9EEE:
  $9EEE  FB        .db $FB
  $9EEF  F7        .db $F7
  $9EF0  E7        .db $E7
  $9EF1  CF        .db $CF
  $9EF2  9F        .db $9F
  $9EF3  3F        .db $3F
  $9EF4  7F        .db $7F
  $9EF5  FF        .db $FF
  $9EF6  FC        .db $FC

L_9EF7:
  $9EF7  E0 F7     CPX #$F7
  $9EF9  EF        .db $EF
  $9EFA  DF        .db $DF
  $9EFB  BF        .db $BF
  $9EFC  7F        .db $7F
  $9EFD  FF        .db $FF
  $9EFE  FC        .db $FC
  $9EFF  E0 FF     CPX #$FF
  $9F01  FF        .db $FF
  $9F02  FF        .db $FF
  $9F03  FF        .db $FF
  $9F04  FF        .db $FF
  $9F05  FF        .db $FF
  $9F06  FE FE FF  INC $FFFE,X
  $9F09  FF        .db $FF
  $9F0A  FF        .db $FF
  $9F0B  FF        .db $FF
  $9F0C  FF        .db $FF
  $9F0D  FF        .db $FF
  $9F0E  FE FE FC  INC $FCFE,X
  $9F11  F9 F3 E7  SBC $E7F3,Y
  $9F14  CF        .db $CF
  $9F15  1F        .db $1F
  $9F16  3E 78 FD  ROL $FD78,X
  $9F19  FB        .db $FB
  $9F1A  F7        .db $F7
  $9F1B  EF        .db $EF
  $9F1C  DF        .db $DF
  $9F1D  3F        .db $3F
  $9F1E  FF        .db $FF
  $9F1F  78        SEI
  $9F20  E7        .db $E7
  $9F21  E7        .db $E7
  $9F22  CF        .db $CF
  $9F23  9F        .db $9F
  $9F24  9F        .db $9F
  $9F25  3F        .db $3F
  $9F26  7F        .db $7F
  $9F27  7F        .db $7F
  $9F28  EF        .db $EF
  $9F29  EF        .db $EF
  $9F2A  DF        .db $DF
  $9F2B  BF        .db $BF
  $9F2C  BF        .db $BF
  $9F2D  7F        .db $7F
  $9F2E  FF        .db $FF
  $9F2F  FF        .db $FF
  $9F30  FF        .db $FF
  $9F31  FF        .db $FF
  $9F32  FC        .db $FC
  $9F33  F0 C2     BEQ $9EF7
  $9F35  08        PHP
  $9F36  00        BRK
  $9F37  01 FF     ORA ($FF,X)
  $9F39  FF        .db $FF
  $9F3A  FF        .db $FF
  $9F3B  FC        .db $FC
  $9F3C  F2        .db $F2
  $9F3D  C8        INY
  $9F3E  00        BRK
  $9F3F  00        BRK
  $9F40  FF        .db $FF
  $9F41  FE FE FC  INC $FCFE,X

L_9F44:
  $9F44  F9 F3 E7  SBC $E7F3,Y
  $9F47  CE FF FF  DEC $FFFF
  $9F4A  FF        .db $FF
  $9F4B  FE FD FB  INC $FBFD,X
  $9F4E  F7        .db $F7
  $9F4F  EE 9C 38  INC $389C
  $9F52  61 83     ADC ($83,X)
  $9F54  06 1C     ASL $1C
  $9F56  78        SEI
  $9F57  FF        .db $FF
  $9F58  DC        .db $DC
  $9F59  B8        CLV
  $9F5A  60        RTS
  $9F5B  80        .db $80
  $9F5C  00        BRK
  $9F5D  00        BRK
  $9F5E  00        BRK
  $9F5F  00        BRK
  $9F60  3C        .db $3C
  $9F61  78        SEI
  $9F62  70 E0     BVS $9F44
  $9F64  C1 83     CMP ($83,X)
  $9F66  0E 18 BC  ASL $BC18
  $9F69  78        SEI
  $9F6A  70 E0     BVS $9F4C
  $9F6C  C0 80     CPY #$80
  $9F6E  00        BRK
  $9F6F  00        BRK
  $9F70  30 60     BMI $9FD2
  $9F72  C1 06     CMP ($06,X)
  $9F74  0F        .db $0F
  $9F75  3E F8 E0  ROL $E0F8,X
  $9F78  00        BRK
  $9F79  00        BRK
  $9F7A  00        BRK
  $9F7B  00        BRK
  $9F7C  00        BRK
  $9F7D  00        BRK
  $9F7E  00        BRK
  $9F7F  00        BRK
  $9F80  18        CLC
  $9F81  30 60     BMI $9FE3
  $9F83  C0 80     CPY #$80
  $9F85  01 06     ORA ($06,X)
  $9F87  08        PHP
  $9F88  00        BRK
  $9F89  00        BRK
  $9F8A  00        BRK
  $9F8B  00        BRK
  $9F8C  00        BRK
  $9F8D  00        BRK
  $9F8E  00        BRK
  $9F8F  00        BRK
  $9F90  31 46     AND ($46),Y
  $9F92  98        TYA
  $9F93  63        .db $63
  $9F94  87        .db $87
  $9F95  07        .db $07
  $9F96  67        .db $67
  $9F97  E7        .db $E7
  $9F98  00        BRK
  $9F99  00        BRK
  $9F9A  00        BRK
  $9F9B  03        .db $03
  $9F9C  07        .db $07
  $9F9D  0F        .db $0F
  $9F9E  6F        .db $6F

L_9F9F:
  $9F9F  EF        .db $EF
  $9FA0  04        .db $04
  $9FA1  08        PHP
  $9FA2  11 62     ORA ($62),Y
  $9FA4  8C 19 37  STY $3719
  $9FA7  D7        .db $D7
  $9FA8  00        BRK
  $9FA9  00        BRK
  $9FAA  00        BRK
  $9FAB  00        BRK
  $9FAC  00        BRK
  $9FAD  01 07     ORA ($07,X)
  $9FAF  17        .db $17
  $9FB0  A7        .db $A7
  $9FB1  67        .db $67
  $9FB2  E7        .db $E7
  $9FB3  E7        .db $E7
  $9FB4  E7        .db $E7
  $9FB5  E7        .db $E7
  $9FB6  E7        .db $E7
  $9FB7  E7        .db $E7
  $9FB8  37        .db $37
  $9FB9  77        .db $77
  $9FBA  F7        .db $F7
  $9FBB  F7        .db $F7
  $9FBC  F7        .db $F7
  $9FBD  F7        .db $F7
  $9FBE  F7        .db $F7
  $9FBF  F7        .db $F7
  $9FC0  27        .db $27
  $9FC1  C7        .db $C7
  $9FC2  A7        .db $A7
  $9FC3  67        .db $67
  $9FC4  E7        .db $E7
  $9FC5  E7        .db $E7
  $9FC6  E7        .db $E7
  $9FC7  E7        .db $E7
  $9FC8  07        .db $07
  $9FC9  0F        .db $0F
  $9FCA  2F        .db $2F
  $9FCB  6F        .db $6F
  $9FCC  EF        .db $EF
  $9FCD  EF        .db $EF
  $9FCE  EF        .db $EF
  $9FCF  EF        .db $EF
  $9FD0  E7        .db $E7
  $9FD1  E7        .db $E7

L_9FD2:
  $9FD2  E7        .db $E7
  $9FD3  E7        .db $E7
  $9FD4  E7        .db $E7
  $9FD5  E7        .db $E7
  $9FD6  E7        .db $E7
  $9FD7  E7        .db $E7
  $9FD8  EF        .db $EF
  $9FD9  EF        .db $EF
  $9FDA  EF        .db $EF
  $9FDB  EF        .db $EF
  $9FDC  EF        .db $EF
  $9FDD  EF        .db $EF
  $9FDE  EF        .db $EF
  $9FDF  EF        .db $EF
  $9FE0  E7        .db $E7
  $9FE1  E7        .db $E7
  $9FE2  E7        .db $E7

L_9FE3:
  $9FE3  E7        .db $E7
  $9FE4  E7        .db $E7
  $9FE5  E7        .db $E7
  $9FE6  E7        .db $E7
  $9FE7  E7        .db $E7
  $9FE8  F7        .db $F7
  $9FE9  F7        .db $F7
  $9FEA  F7        .db $F7
  $9FEB  F7        .db $F7
  $9FEC  F7        .db $F7
  $9FED  F7        .db $F7
  $9FEE  F7        .db $F7
  $9FEF  F7        .db $F7
  $9FF0  E7        .db $E7
  $9FF1  E7        .db $E7
  $9FF2  E7        .db $E7
  $9FF3  E7        .db $E7
  $9FF4  E7        .db $E7
  $9FF5  E7        .db $E7
  $9FF6  E7        .db $E7
  $9FF7  E7        .db $E7
  $9FF8  F7        .db $F7
  $9FF9  F7        .db $F7
  $9FFA  F7        .db $F7
  $9FFB  F7        .db $F7
  $9FFC  F7        .db $F7
  $9FFD  F7        .db $F7
  $9FFE  F7        .db $F7
  $9FFF  F7        .db $F7
  $A000  E1 E4     SBC ($E4,X)
  $A002  E7        .db $E7
  $A003  E7        .db $E7
  $A004  E7        .db $E7
  $A005  E7        .db $E7
  $A006  E7        .db $E7
  $A007  E7        .db $E7
  $A008  E0 EC     CPX #$EC
  $A00A  EF        .db $EF
  $A00B  EF        .db $EF
  $A00C  EF        .db $EF
  $A00D  EF        .db $EF
  $A00E  EF        .db $EF
  $A00F  EF        .db $EF
  $A010  E7        .db $E7
  $A011  E7        .db $E7
  $A012  E7        .db $E7
  $A013  E7        .db $E7
  $A014  E7        .db $E7
  $A015  E7        .db $E7
  $A016  E7        .db $E7
  $A017  E7        .db $E7
  $A018  EF        .db $EF
  $A019  EF        .db $EF
  $A01A  EF        .db $EF
  $A01B  EF        .db $EF
  $A01C  EF        .db $EF
  $A01D  EF        .db $EF
  $A01E  EF        .db $EF
  $A01F  EF        .db $EF
  $A020  C7        .db $C7
  $A021  38        SEC
  $A022  87        .db $87
  $A023  E0 E7     CPX #$E7
  $A025  E7        .db $E7
  $A026  E7        .db $E7
  $A027  E7        .db $E7
  $A028  00        BRK
  $A029  00        BRK
  $A02A  80        .db $80
  $A02B  F0 F7     BEQ $A024
  $A02D  F7        .db $F7
  $A02E  F7        .db $F7
  $A02F  F7        .db $F7
  $A030  E7        .db $E7
  $A031  E7        .db $E7
  $A032  E7        .db $E7
  $A033  E7        .db $E7
  $A034  E7        .db $E7
  $A035  E7        .db $E7
  $A036  E7        .db $E7
  $A037  E7        .db $E7
  $A038  F7        .db $F7
  $A039  F7        .db $F7
  $A03A  F7        .db $F7
  $A03B  F7        .db $F7
  $A03C  F7        .db $F7
  $A03D  F7        .db $F7
  $A03E  F7        .db $F7
  $A03F  F7        .db $F7
  $A040  FF        .db $FF
  $A041  FF        .db $FF
  $A042  FF        .db $FF
  $A043  FF        .db $FF
  $A044  1F        .db $1F
  $A045  C1 E4     CMP ($E4,X)
  $A047  E7        .db $E7
  $A048  00        BRK
  $A049  00        BRK
  $A04A  00        BRK
  $A04B  00        BRK
  $A04C  00        BRK
  $A04D  C0 EC     CPY #$EC
  $A04F  EF        .db $EF
  $A050  E7        .db $E7
  $A051  E7        .db $E7
  $A052  E7        .db $E7
  $A053  E7        .db $E7
  $A054  E7        .db $E7
  $A055  E7        .db $E7
  $A056  E7        .db $E7
  $A057  E7        .db $E7
  $A058  EF        .db $EF
  $A059  EF        .db $EF
  $A05A  EF        .db $EF
  $A05B  EF        .db $EF
  $A05C  EF        .db $EF
  $A05D  EF        .db $EF
  $A05E  EF        .db $EF
  $A05F  EF        .db $EF
  $A060  80        .db $80
  $A061  E0 F8     CPX #$F8
  $A063  FC        .db $FC
  $A064  FF        .db $FF
  $A065  FF        .db $FF
  $A066  0F        .db $0F
  $A067  E0 00     CPX #$00
  $A069  00        BRK
  $A06A  00        BRK
  $A06B  00        BRK
  $A06C  00        BRK
  $A06D  00        BRK
  $A06E  00        BRK
  $A06F  E0 E7     CPX #$E7
  $A071  E7        .db $E7
  $A072  E7        .db $E7
  $A073  E7        .db $E7
  $A074  E7        .db $E7
  $A075  E7        .db $E7
  $A076  E7        .db $E7
  $A077  E7        .db $E7
  $A078  F7        .db $F7
  $A079  F7        .db $F7
  $A07A  F7        .db $F7
  $A07B  F7        .db $F7
  $A07C  F7        .db $F7
  $A07D  F7        .db $F7
  $A07E  F7        .db $F7
  $A07F  F7        .db $F7
  $A080  00        BRK
  $A081  00        BRK
  $A082  00        BRK
  $A083  00        BRK
  $A084  00        BRK
  $A085  F8        SED
  $A086  FF        .db $FF
  $A087  07        .db $07
  $A088  00        BRK
  $A089  00        BRK
  $A08A  00        BRK
  $A08B  00        BRK
  $A08C  00        BRK
  $A08D  00        BRK
  $A08E  00        BRK
  $A08F  00        BRK
  $A090  E0 E7     CPX #$E7
  $A092  E7        .db $E7
  $A093  E7        .db $E7
  $A094  E7        .db $E7
  $A095  E7        .db $E7
  $A096  E7        .db $E7
  $A097  E7        .db $E7
  $A098  E0 EF     CPX #$EF
  $A09A  EF        .db $EF
  $A09B  EF        .db $EF
  $A09C  EF        .db $EF
  $A09D  EF        .db $EF
  $A09E  EF        .db $EF
  $A09F  EF        .db $EF
  $A0A0  00        BRK
  $A0A1  00        BRK
  $A0A2  00        BRK
  $A0A3  00        BRK
  $A0A4  00        BRK
  $A0A5  00        BRK
  $A0A6  FF        .db $FF
  $A0A7  FF        .db $FF
  $A0A8  00        BRK
  $A0A9  00        BRK
  $A0AA  00        BRK
  $A0AB  00        BRK
  $A0AC  00        BRK
  $A0AD  00        BRK
  $A0AE  00        BRK
  $A0AF  00        BRK
  $A0B0  00        BRK
  $A0B1  E7        .db $E7
  $A0B2  E7        .db $E7
  $A0B3  E7        .db $E7
  $A0B4  E7        .db $E7
  $A0B5  E7        .db $E7
  $A0B6  E7        .db $E7
  $A0B7  E7        .db $E7
  $A0B8  00        BRK
  $A0B9  F7        .db $F7
  $A0BA  F7        .db $F7
  $A0BB  F7        .db $F7
  $A0BC  F7        .db $F7
  $A0BD  F7        .db $F7
  $A0BE  F7        .db $F7
  $A0BF  F7        .db $F7
  $A0C0  00        BRK
  $A0C1  00        BRK
  $A0C2  00        BRK
  $A0C3  00        BRK
  $A0C4  00        BRK
  $A0C5  00        BRK
  $A0C6  FF        .db $FF
  $A0C7  FF        .db $FF
  $A0C8  00        BRK
  $A0C9  00        BRK
  $A0CA  00        BRK
  $A0CB  00        BRK
  $A0CC  00        BRK
  $A0CD  00        BRK
  $A0CE  00        BRK
  $A0CF  00        BRK
  $A0D0  00        BRK
  $A0D1  E7        .db $E7
  $A0D2  E7        .db $E7
  $A0D3  E7        .db $E7
  $A0D4  E7        .db $E7
  $A0D5  E7        .db $E7
  $A0D6  E7        .db $E7
  $A0D7  E7        .db $E7
  $A0D8  00        BRK
  $A0D9  EF        .db $EF
  $A0DA  EF        .db $EF
  $A0DB  EF        .db $EF
  $A0DC  EF        .db $EF
  $A0DD  EF        .db $EF
  $A0DE  EF        .db $EF
  $A0DF  EF        .db $EF
  $A0E0  00        BRK
  $A0E1  00        BRK
  $A0E2  00        BRK
  $A0E3  00        BRK
  $A0E4  00        BRK
  $A0E5  1F        .db $1F
  $A0E6  FF        .db $FF
  $A0E7  E0 00     CPX #$00
  $A0E9  00        BRK
  $A0EA  00        BRK
  $A0EB  00        BRK
  $A0EC  00        BRK
  $A0ED  00        BRK
  $A0EE  00        BRK
  $A0EF  00        BRK
  $A0F0  07        .db $07
  $A0F1  E7        .db $E7
  $A0F2  E7        .db $E7
  $A0F3  E7        .db $E7
  $A0F4  E7        .db $E7
  $A0F5  E7        .db $E7
  $A0F6  E7        .db $E7
  $A0F7  E7        .db $E7
  $A0F8  07        .db $07
  $A0F9  F7        .db $F7
  $A0FA  F7        .db $F7
  $A0FB  F7        .db $F7
  $A0FC  F7        .db $F7
  $A0FD  F7        .db $F7
  $A0FE  F7        .db $F7
  $A0FF  F7        .db $F7
  $A100  00        BRK
  $A101  00        BRK
  $A102  00        BRK
  $A103  00        BRK
  $A104  0F        .db $0F
  $A105  FF        .db $FF
  $A106  F0 07     BEQ $A10F
  $A108  00        BRK
  $A109  00        BRK

L_A10A:
  $A10A  00        BRK
  $A10B  00        BRK
  $A10C  00        BRK
  $A10D  00        BRK
  $A10E  00        BRK

L_A10F:
  $A10F  07        .db $07
  $A110  E7        .db $E7
  $A111  E7        .db $E7
  $A112  E7        .db $E7
  $A113  E7        .db $E7
  $A114  E7        .db $E7
  $A115  E7        .db $E7
  $A116  E7        .db $E7
  $A117  E7        .db $E7
  $A118  EF        .db $EF
  $A119  EF        .db $EF
  $A11A  EF        .db $EF
  $A11B  EF        .db $EF
  $A11C  EF        .db $EF
  $A11D  EF        .db $EF
  $A11E  EF        .db $EF
  $A11F  EF        .db $EF
  $A120  03        .db $03
  $A121  07        .db $07
  $A122  0F        .db $0F
  $A123  7F        .db $7F
  $A124  F8        SED
  $A125  83        .db $83
  $A126  27        .db $27
  $A127  E7        .db $E7
  $A128  00        BRK
  $A129  00        BRK
  $A12A  00        BRK
  $A12B  00        BRK
  $A12C  00        BRK
  $A12D  03        .db $03
  $A12E  37        .db $37
  $A12F  F7        .db $F7
  $A130  E7        .db $E7
  $A131  E7        .db $E7
  $A132  E7        .db $E7
  $A133  E7        .db $E7
  $A134  E7        .db $E7
  $A135  E7        .db $E7
  $A136  E7        .db $E7
  $A137  E7        .db $E7
  $A138  F7        .db $F7
  $A139  F7        .db $F7
  $A13A  F7        .db $F7
  $A13B  F7        .db $F7
  $A13C  F7        .db $F7
  $A13D  F7        .db $F7
  $A13E  F7        .db $F7
  $A13F  F7        .db $F7
  $A140  FF        .db $FF
  $A141  FC        .db $FC
  $A142  E1 07     SBC ($07,X)
  $A144  E7        .db $E7
  $A145  E7        .db $E7
  $A146  E7        .db $E7
  $A147  E7        .db $E7
  $A148  00        BRK
  $A149  00        BRK
  $A14A  01 0F     ORA ($0F,X)
  $A14C  EF        .db $EF
  $A14D  EF        .db $EF
  $A14E  EF        .db $EF
  $A14F  EF        .db $EF
  $A150  E7        .db $E7
  $A151  E7        .db $E7
  $A152  E7        .db $E7
  $A153  E7        .db $E7
  $A154  E7        .db $E7
  $A155  E7        .db $E7
  $A156  E7        .db $E7
  $A157  E7        .db $E7
  $A158  EF        .db $EF
  $A159  EF        .db $EF
  $A15A  EF        .db $EF
  $A15B  EF        .db $EF
  $A15C  EF        .db $EF
  $A15D  EF        .db $EF
  $A15E  EF        .db $EF
  $A15F  EF        .db $EF
  $A160  87        .db $87
  $A161  27        .db $27
  $A162  E7        .db $E7
  $A163  E7        .db $E7
  $A164  E7        .db $E7
  $A165  E7        .db $E7
  $A166  E7        .db $E7
  $A167  E7        .db $E7
  $A168  07        .db $07
  $A169  37        .db $37
  $A16A  F7        .db $F7
  $A16B  F7        .db $F7
  $A16C  F7        .db $F7
  $A16D  F7        .db $F7
  $A16E  F7        .db $F7
  $A16F  F7        .db $F7
  $A170  E7        .db $E7
  $A171  E7        .db $E7
  $A172  E7        .db $E7
  $A173  E7        .db $E7
  $A174  E7        .db $E7
  $A175  E7        .db $E7
  $A176  E7        .db $E7
  $A177  E7        .db $E7
  $A178  F7        .db $F7
  $A179  F7        .db $F7
  $A17A  F7        .db $F7
  $A17B  F7        .db $F7
  $A17C  F7        .db $F7
  $A17D  F7        .db $F7
  $A17E  F7        .db $F7
  $A17F  F7        .db $F7
  $A180  00        BRK
  $A181  08        PHP
  $A182  E7        .db $E7
  $A183  E7        .db $E7
  $A184  E7        .db $E7
  $A185  E7        .db $E7
  $A186  E7        .db $E7
  $A187  E7        .db $E7
  $A188  00        BRK
  $A189  08        PHP

L_A18A:
  $A18A  EF        .db $EF
  $A18B  EF        .db $EF
  $A18C  EF        .db $EF
  $A18D  EF        .db $EF
  $A18E  EF        .db $EF
  $A18F  EF        .db $EF
  $A190  E7        .db $E7
  $A191  E7        .db $E7
  $A192  E7        .db $E7
  $A193  E7        .db $E7
  $A194  E7        .db $E7
  $A195  E7        .db $E7
  $A196  E7        .db $E7
  $A197  E7        .db $E7
  $A198  EF        .db $EF
  $A199  EF        .db $EF
  $A19A  EF        .db $EF
  $A19B  EF        .db $EF
  $A19C  EF        .db $EF
  $A19D  EF        .db $EF
  $A19E  EF        .db $EF
  $A19F  EF        .db $EF
  $A1A0  00        BRK
  $A1A1  10 E7     BPL $A18A
  $A1A3  E7        .db $E7
  $A1A4  E7        .db $E7
  $A1A5  E7        .db $E7
  $A1A6  E7        .db $E7
  $A1A7  E7        .db $E7
  $A1A8  00        BRK
  $A1A9  10 F7     BPL $A1A2
  $A1AB  F7        .db $F7
  $A1AC  F7        .db $F7
  $A1AD  F7        .db $F7
  $A1AE  F7        .db $F7
  $A1AF  F7        .db $F7
  $A1B0  E7        .db $E7
  $A1B1  E7        .db $E7
  $A1B2  E7        .db $E7
  $A1B3  E7        .db $E7
  $A1B4  E7        .db $E7
  $A1B5  E7        .db $E7
  $A1B6  E7        .db $E7
  $A1B7  E7        .db $E7
  $A1B8  F7        .db $F7
  $A1B9  F7        .db $F7
  $A1BA  F7        .db $F7
  $A1BB  F7        .db $F7
  $A1BC  F7        .db $F7
  $A1BD  F7        .db $F7
  $A1BE  F7        .db $F7
  $A1BF  F7        .db $F7
  $A1C0  E7        .db $E7
  $A1C1  E7        .db $E7
  $A1C2  E7        .db $E7
  $A1C3  E7        .db $E7
  $A1C4  E7        .db $E7
  $A1C5  E7        .db $E7
  $A1C6  E7        .db $E7
  $A1C7  E7        .db $E7
  $A1C8  EF        .db $EF
  $A1C9  EF        .db $EF
  $A1CA  EF        .db $EF
  $A1CB  EF        .db $EF
  $A1CC  EF        .db $EF
  $A1CD  EF        .db $EF
  $A1CE  EF        .db $EF
  $A1CF  EF        .db $EF
  $A1D0  E7        .db $E7
  $A1D1  E7        .db $E7
  $A1D2  E7        .db $E7
  $A1D3  E7        .db $E7
  $A1D4  E7        .db $E7
  $A1D5  E7        .db $E7
  $A1D6  E7        .db $E7
  $A1D7  E7        .db $E7
  $A1D8  EF        .db $EF
  $A1D9  EF        .db $EF
  $A1DA  EF        .db $EF
  $A1DB  EF        .db $EF
  $A1DC  EF        .db $EF
  $A1DD  EF        .db $EF
  $A1DE  EF        .db $EF
  $A1DF  EF        .db $EF
  $A1E0  E7        .db $E7
  $A1E1  E7        .db $E7
  $A1E2  E7        .db $E7
  $A1E3  E7        .db $E7
  $A1E4  E7        .db $E7
  $A1E5  E7        .db $E7
  $A1E6  E7        .db $E7
  $A1E7  E7        .db $E7
  $A1E8  F7        .db $F7
  $A1E9  F7        .db $F7
  $A1EA  F7        .db $F7
  $A1EB  F7        .db $F7
  $A1EC  F7        .db $F7
  $A1ED  F7        .db $F7
  $A1EE  F7        .db $F7
  $A1EF  F7        .db $F7
  $A1F0  E7        .db $E7
  $A1F1  E7        .db $E7
  $A1F2  E7        .db $E7
  $A1F3  E7        .db $E7
  $A1F4  E7        .db $E7
  $A1F5  E7        .db $E7
  $A1F6  E7        .db $E7
  $A1F7  E7        .db $E7
  $A1F8  F7        .db $F7
  $A1F9  F7        .db $F7
  $A1FA  F7        .db $F7
  $A1FB  F7        .db $F7
  $A1FC  F7        .db $F7
  $A1FD  F7        .db $F7
  $A1FE  F7        .db $F7
  $A1FF  F7        .db $F7
  $A200  7C        .db $7C
  $A201  00        BRK
  $A202  3F        .db $3F
  $A203  80        .db $80
  $A204  B9 3F 3F  LDA $3F3F,Y
  $A207  80        .db $80
  $A208  7C        .db $7C
  $A209  7F        .db $7F
  $A20A  00        BRK
  $A20B  BC 82 83  LDY $8382,X
  $A20E  80        .db $80
  $A20F  3F        .db $3F
  $A210  81 01     STA ($01,X)
  $A212  00        BRK
  $A213  80        .db $80
  $A214  87        .db $87
  $A215  07        .db $07
  $A216  06 7E     ASL $7E
  $A218  3E BF BF  ROL $BFBF,X
  $A21B  BF        .db $BF
  $A21C  BF        .db $BF
  $A21D  3C        .db $3C
  $A21E  7D 7D 3C  ADC $3C7D,X
  $A221  00        BRK
  $A222  FF        .db $FF
  $A223  00        BRK
  $A224  99 FF FF  STA $FFFF,Y
  $A227  00        BRK
  $A228  3C        .db $3C
  $A229  FF        .db $FF
  $A22A  00        BRK
  $A22B  3C        .db $3C
  $A22C  42        .db $42
  $A22D  C3        .db $C3
  $A22E  00        BRK
  $A22F  FF        .db $FF
  $A230  BF        .db $BF
  $A231  BF        .db $BF
  $A232  00        BRK
  $A233  00        BRK
  $A234  FF        .db $FF
  $A235  FF        .db $FF

L_A236:
  $A236  18        CLC
  $A237  9F        .db $9F
  $A238  C0 FF     CPY #$FF
  $A23A  FF        .db $FF
  $A23B  FF        .db $FF
  $A23C  FF        .db $FF
  $A23D  10 F7     BPL $A236
  $A23F  3F        .db $3F
  $A240  3C        .db $3C
  $A241  00        BRK
  $A242  FF        .db $FF
  $A243  00        BRK
  $A244  99 FF FF  STA $FFFF,Y
  $A247  00        BRK
  $A248  3C        .db $3C
  $A249  FF        .db $FF
  $A24A  00        BRK
  $A24B  3C        .db $3C
  $A24C  42        .db $42
  $A24D  C3        .db $C3
  $A24E  00        BRK
  $A24F  FF        .db $FF
  $A250  FE FE 00  INC $00FE,X
  $A253  00        BRK
  $A254  FF        .db $FF
  $A255  FF        .db $FF
  $A256  00        BRK
  $A257  FF        .db $FF
  $A258  03        .db $03
  $A259  FF        .db $FF
  $A25A  FF        .db $FF
  $A25B  FF        .db $FF
  $A25C  FF        .db $FF
  $A25D  00        BRK
  $A25E  FF        .db $FF
  $A25F  FF        .db $FF
  $A260  3E 00 FC  ROL $FC00,X
  $A263  01 9D     ORA ($9D,X)
  $A265  FC        .db $FC
  $A266  FC        .db $FC
  $A267  01 3E     ORA ($3E,X)
  $A269  FE 00 3D  INC $3D00,X
  $A26C  41 C1     EOR ($C1,X)
  $A26E  01 FC     ORA ($FC,X)
  $A270  C1 C0     CMP ($C0,X)
  $A272  00        BRK
  $A273  01 E1     ORA ($E1,X)
  $A275  E0 60     CPX #$60
  $A277  FE 7C FD  INC $FD7C,X
  $A27A  FD FD FD  SBC $FDFD,X
  $A27D  5C        .db $5C
  $A27E  DE DE 7E  DEC $7EDE,X
  $A281  06 07     ASL $07
  $A283  87        .db $87
  $A284  80        .db $80
  $A285  00        BRK
  $A286  01 81     ORA ($81,X)
  $A288  05 7D     ORA $7D
  $A28A  3F        .db $3F
  $A28B  BC BF BF  LDY $BFBF,X
  $A28E  BE 3F 80  LDX $803F,Y
  $A291  03        .db $03
  $A292  02        .db $02
  $A293  BC 80 3F  LDY $3F80,X
  $A296  7C        .db $7C
  $A297  00        BRK
  $A298  3F        .db $3F
  $A299  BF        .db $BF
  $A29A  BB        .db $BB
  $A29B  BC BF 3F  LDY $3FBF,X
  $A29E  7C        .db $7C
  $A29F  00        BRK
  $A2A0  1A        .db $1A
  $A2A1  1A        .db $1A
  $A2A2  FA        .db $FA
  $A2A3  FF        .db $FF
  $A2A4  00        BRK

L_A2A5:
  $A2A5  00        BRK
  $A2A6  BF        .db $BF
  $A2A7  BF        .db $BF
  $A2A8  3A        .db $3A
  $A2A9  F0 FA     BEQ $A2A5
  $A2AB  00        BRK
  $A2AC  FF        .db $FF
  $A2AD  FF        .db $FF
  $A2AE  C0 FF     CPY #$FF
  $A2B0  00        BRK
  $A2B1  C3        .db $C3
  $A2B2  42        .db $42
  $A2B3  3C        .db $3C
  $A2B4  00        BRK
  $A2B5  FF        .db $FF
  $A2B6  3C        .db $3C
  $A2B7  00        BRK
  $A2B8  FF        .db $FF
  $A2B9  FF        .db $FF
  $A2BA  DB        .db $DB
  $A2BB  3C        .db $3C
  $A2BC  FF        .db $FF
  $A2BD  FF        .db $FF
  $A2BE  3C        .db $3C
  $A2BF  00        BRK
  $A2C0  AA        TAX
  $A2C1  AA        TAX
  $A2C2  AA        TAX
  $A2C3  FF        .db $FF
  $A2C4  00        BRK
  $A2C5  00        BRK
  $A2C6  FE FE AA  INC $AAFE,X
  $A2C9  00        BRK
  $A2CA  AA        TAX
  $A2CB  00        BRK
  $A2CC  FF        .db $FF
  $A2CD  FF        .db $FF
  $A2CE  03        .db $03
  $A2CF  FF        .db $FF
  $A2D0  00        BRK
  $A2D1  C3        .db $C3
  $A2D2  42        .db $42
  $A2D3  3C        .db $3C
  $A2D4  00        BRK
  $A2D5  FF        .db $FF
  $A2D6  3C        .db $3C
  $A2D7  00        BRK
  $A2D8  FF        .db $FF
  $A2D9  FF        .db $FF
  $A2DA  DB        .db $DB
  $A2DB  3C        .db $3C
  $A2DC  FF        .db $FF
  $A2DD  FF        .db $FF
  $A2DE  3C        .db $3C
  $A2DF  00        BRK
  $A2E0  BE A0 A0  LDX $A0A0,Y
  $A2E3  E1 01     SBC ($01,X)
  $A2E5  00        BRK
  $A2E6  C0 C1     CPY #$C1
  $A2E8  80        .db $80
  $A2E9  1E 9C 1D  ASL $1D9C,X
  $A2EC  FD FD 7D  SBC $7DFD,X
  $A2EF  FC        .db $FC
  $A2F0  01 C0     ORA ($C0,X)
  $A2F2  40        RTI
  $A2F3  3D 01 FC  AND $FC01,X
  $A2F6  3E 00 FC  ROL $FC00,X
  $A2F9  FD DD 3D  SBC $3DDD,X
  $A2FC  FD FC 3E  SBC $3EFC,X
  $A2FF  00        BRK
  $A300  40        RTI
  $A301  B2        .db $B2
  $A302  A0 80     LDY #$80
  $A304  80        .db $80
  $A305  9E        .db $9E
  $A306  A1 A1     LDA ($A1,X)
  $A308  7F        .db $7F
  $A309  CD DF FF  CMP $FFDF
  $A30C  FF        .db $FF
  $A30D  EF        .db $EF
  $A30E  C1 C1     CMP ($C1,X)
  $A310  E3        .db $E3
  $A311  E7        .db $E7
  $A312  E7        .db $E7
  $A313  E7        .db $E7
  $A314  E7        .db $E7
  $A315  A3        .db $A3
  $A316  A1 9E     LDA ($9E,X)
  $A318  A0 A0     LDY #$A0
  $A31A  A0 A0     LDY #$A0
  $A31C  A0 C1     LDY #$C1
  $A31E  C1 EF     CMP ($EF,X)
  $A320  00        BRK
  $A321  FB        .db $FB
  $A322  69 61     ADC #$61
  $A324  69 6F     ADC #$6F
  $A326  6C 6F FF  JMP ($FF6F)
  $A329  04        .db $04
  $A32A  96 9E     STX $9E,Y
  $A32C  96 97     STX $97,Y
  $A32E  96 94     STX $94,Y
  $A330  E9 EF     SBC #$EF
  $A332  EC EF E9  CPX $E9EF
  $A335  69 69     ADC #$69
  $A337  61 96     ADC ($96,X)
  $A339  97        .db $97
  $A33A  96 94     STX $94,Y
  $A33C  96 96     STX $96,Y
  $A33E  96 99     STX $99,Y
  $A340  00        BRK
  $A341  C8        INY
  $A342  00        BRK
  $A343  00        BRK
  $A344  00        BRK
  $A345  FE 02 FE  INC $FE02,X
  $A348  FF        .db $FF
  $A349  37        .db $37
  $A34A  FF        .db $FF
  $A34B  FF        .db $FF
  $A34C  FF        .db $FF
  $A34D  FF        .db $FF
  $A34E  05 01     ORA $01
  $A350  00        BRK
  $A351  FE 02 FE  INC $FE02,X
  $A354  00        BRK
  $A355  00        BRK
  $A356  24 00     BIT $00
  $A358  FF        .db $FF
  $A359  FF        .db $FF
  $A35A  05 01     ORA $01
  $A35C  FF        .db $FF
  $A35D  FF        .db $FF
  $A35E  C9 49     CMP #$49
  $A360  8C 46 26  STY $2646
  $A363  26 26     ROL $26
  $A365  26 26     ROL $26
  $A367  26 FC     ROL $FC
  $A369  FE FE FE  INC $FEFE,X
  $A36C  FE FE FE  INC $FEFE,X
  $A36F  FE 26 26  INC $2626,X
  $A372  26 26     ROL $26
  $A374  26 26     ROL $26
  $A376  26 26     ROL $26
  $A378  FE FE FE  INC $FEFE,X
  $A37B  FE FE FE  INC $FEFE,X
  $A37E  FE FE 80  INC $80FE,X
  $A381  80        .db $80
  $A382  80        .db $80
  $A383  40        RTI
  $A384  16 60     ASL $60,X
  $A386  C7        .db $C7
  $A387  80        .db $80
  $A388  FF        .db $FF
  $A389  FF        .db $FF
  $A38A  FF        .db $FF
  $A38B  7F        .db $7F
  $A38C  16 7F     ASL $7F,X
  $A38E  F8        SED
  $A38F  FF        .db $FF
  $A390  81 A1     STA ($A1,X)
  $A392  81 81     STA ($81,X)
  $A394  81 68     STA ($68,X)
  $A396  81 00     STA ($00,X)
  $A398  FE CE CE  INC $CECE,X
  $A39B  FE FE 7F  INC $7FFE,X
  $A39E  FE 00 69  INC $6900,X
  $A3A1  61 FD     ADC ($FD,X)
  $A3A3  00        BRK
  $A3A4  FF        .db $FF
  $A3A5  00        BRK
  $A3A6  FF        .db $FF
  $A3A7  CC 95 9E  CPY $9E95
  $A3AA  02        .db $02
  $A3AB  FF        .db $FF
  $A3AC  FF        .db $FF
  $A3AD  FF        .db $FF
  $A3AE  00        BRK
  $A3AF  33        .db $33
  $A3B0  C8        INY
  $A3B1  C8        INY
  $A3B2  C8        INY
  $A3B3  C8        INY
  $A3B4  C8        INY
  $A3B5  E4 C8     CPX $C8
  $A3B7  00        BRK
  $A3B8  37        .db $37
  $A3B9  37        .db $37
  $A3BA  37        .db $37
  $A3BB  37        .db $37
  $A3BC  37        .db $37
  $A3BD  1B        .db $1B
  $A3BE  37        .db $37
  $A3BF  00        BRK
  $A3C0  00        BRK
  $A3C1  00        BRK
  $A3C2  A0 00     LDY #$00
  $A3C4  FE 00 30  INC $3000,X
  $A3C7  00        BRK
  $A3C8  FF        .db $FF
  $A3C9  FF        .db $FF
  $A3CA  5F        .db $5F
  $A3CB  FF        .db $FF
  $A3CC  FE FF CF  INC $CFFF,X
  $A3CF  C0 11     CPY #$11
  $A3D1  01 01     ORA ($01,X)
  $A3D3  1F        .db $1F
  $A3D4  00        BRK
  $A3D5  0A        ASL
  $A3D6  00        BRK
  $A3D7  00        BRK
  $A3D8  CF        .db $CF
  $A3D9  DF        .db $DF
  $A3DA  DF        .db $DF
  $A3DB  DF        .db $DF
  $A3DC  FF        .db $FF
  $A3DD  FF        .db $FF
  $A3DE  FF        .db $FF
  $A3DF  00        BRK
  $A3E0  26 26     ROL $26
  $A3E2  46 8C     LSR $8C
  $A3E4  D0 2C     BNE $A412
  $A3E6  16 16     ASL $16,X
  $A3E8  FE FE FE  INC $FEFE,X
  $A3EB  FC        .db $FC
  $A3EC  D0 FC     BNE $A3EA
  $A3EE  FE FE 16  INC $16FE,X
  $A3F1  06 06     ASL $06
  $A3F3  16 16     ASL $16,X
  $A3F5  FC        .db $FC
  $A3F6  16 00     ASL $00,X
  $A3F8  FE F6 E6  INC $E6F6,X
  $A3FB  FE FE FC  INC $FCFE,X
  $A3FE  FE 00 00  INC $0000,X
  $A401  00        BRK
  $A402  00        BRK
  $A403  00        BRK
  $A404  00        BRK
  $A405  00        BRK
  $A406  00        BRK
  $A407  00        BRK
  $A408  00        BRK
  $A409  00        BRK
  $A40A  00        BRK
  $A40B  00        BRK
  $A40C  00        BRK
  $A40D  00        BRK
  $A40E  00        BRK
  $A40F  00        BRK
  $A410  00        BRK
  $A411  00        BRK

L_A412:
  $A412  00        BRK
  $A413  00        BRK
  $A414  00        BRK
  $A415  00        BRK
  $A416  00        BRK
  $A417  00        BRK
  $A418  00        BRK
  $A419  00        BRK
  $A41A  00        BRK
  $A41B  00        BRK
  $A41C  00        BRK
  $A41D  00        BRK
  $A41E  00        BRK
  $A41F  00        BRK
  $A420  00        BRK
  $A421  00        BRK
  $A422  00        BRK
  $A423  00        BRK
  $A424  00        BRK
  $A425  00        BRK
  $A426  00        BRK
  $A427  00        BRK
  $A428  00        BRK
  $A429  00        BRK
  $A42A  00        BRK
  $A42B  00        BRK
  $A42C  00        BRK
  $A42D  00        BRK
  $A42E  00        BRK
  $A42F  00        BRK
  $A430  00        BRK
  $A431  00        BRK
  $A432  00        BRK
  $A433  00        BRK
  $A434  00        BRK
  $A435  00        BRK
  $A436  00        BRK
  $A437  00        BRK
  $A438  00        BRK
  $A439  00        BRK
  $A43A  00        BRK
  $A43B  00        BRK
  $A43C  00        BRK
  $A43D  00        BRK
  $A43E  00        BRK
  $A43F  00        BRK
  $A440  00        BRK
  $A441  00        BRK
  $A442  00        BRK
  $A443  00        BRK
  $A444  00        BRK
  $A445  00        BRK
  $A446  00        BRK
  $A447  00        BRK
  $A448  FF        .db $FF
  $A449  FF        .db $FF
  $A44A  FF        .db $FF
  $A44B  FF        .db $FF
  $A44C  FF        .db $FF
  $A44D  FF        .db $FF
  $A44E  FF        .db $FF
  $A44F  FF        .db $FF
  $A450  00        BRK
  $A451  00        BRK
  $A452  00        BRK
  $A453  00        BRK
  $A454  00        BRK
  $A455  00        BRK
  $A456  00        BRK
  $A457  00        BRK
  $A458  FF        .db $FF
  $A459  FF        .db $FF
  $A45A  FF        .db $FF

L_A45B:
  $A45B  FF        .db $FF
  $A45C  FF        .db $FF
  $A45D  FF        .db $FF
  $A45E  FF        .db $FF
  $A45F  FF        .db $FF
  $A460  00        BRK
  $A461  00        BRK
  $A462  00        BRK
  $A463  00        BRK
  $A464  00        BRK
  $A465  00        BRK
  $A466  00        BRK
  $A467  00        BRK
  $A468  FF        .db $FF
  $A469  FF        .db $FF
  $A46A  FF        .db $FF
  $A46B  FF        .db $FF
  $A46C  FF        .db $FF
  $A46D  FF        .db $FF
  $A46E  FF        .db $FF
  $A46F  FF        .db $FF
  $A470  00        BRK
  $A471  00        BRK
  $A472  00        BRK
  $A473  00        BRK
  $A474  00        BRK
  $A475  00        BRK
  $A476  00        BRK
  $A477  00        BRK
  $A478  FF        .db $FF
  $A479  FF        .db $FF
  $A47A  FF        .db $FF
  $A47B  FF        .db $FF
  $A47C  FF        .db $FF
  $A47D  FF        .db $FF
  $A47E  FF        .db $FF
  $A47F  FF        .db $FF
  $A480  00        BRK

L_A481:
  $A481  00        BRK
  $A482  00        BRK
  $A483  00        BRK
  $A484  00        BRK
  $A485  00        BRK
  $A486  00        BRK
  $A487  00        BRK
  $A488  FF        .db $FF
  $A489  FF        .db $FF
  $A48A  FF        .db $FF
  $A48B  FF        .db $FF
  $A48C  FF        .db $FF
  $A48D  FF        .db $FF
  $A48E  FF        .db $FF
  $A48F  FF        .db $FF
  $A490  00        BRK
  $A491  0F        .db $0F
  $A492  3F        .db $3F
  $A493  7F        .db $7F
  $A494  7F        .db $7F
  $A495  FF        .db $FF
  $A496  FF        .db $FF
  $A497  FF        .db $FF
  $A498  FF        .db $FF
  $A499  F0 C0     BEQ $A45B
  $A49B  80        .db $80
  $A49C  80        .db $80
  $A49D  00        BRK
  $A49E  00        BRK
  $A49F  00        BRK
  $A4A0  00        BRK
  $A4A1  00        BRK
  $A4A2  00        BRK
  $A4A3  00        BRK
  $A4A4  00        BRK
  $A4A5  00        BRK
  $A4A6  00        BRK

L_A4A7:
  $A4A7  00        BRK
  $A4A8  FF        .db $FF
  $A4A9  FF        .db $FF
  $A4AA  FF        .db $FF
  $A4AB  FF        .db $FF
  $A4AC  FF        .db $FF
  $A4AD  FF        .db $FF
  $A4AE  FF        .db $FF
  $A4AF  FF        .db $FF
  $A4B0  00        BRK
  $A4B1  80        .db $80
  $A4B2  E0 F0     CPX #$F0
  $A4B4  F0 FD     BEQ $A4B3
  $A4B6  F0 EF     BEQ $A4A7
  $A4B8  FF        .db $FF
  $A4B9  7F        .db $7F
  $A4BA  1F        .db $1F
  $A4BB  0F        .db $0F
  $A4BC  0F        .db $0F
  $A4BD  02        .db $02
  $A4BE  0F        .db $0F
  $A4BF  10 C0     BPL $A481
  $A4C1  FD E0 F3  SBC $F3E0,X
  $A4C4  F7        .db $F7
  $A4C5  F7        .db $F7
  $A4C6  F7        .db $F7
  $A4C7  EF        .db $EF
  $A4C8  3F        .db $3F
  $A4C9  02        .db $02
  $A4CA  1F        .db $1F
  $A4CB  0C        .db $0C
  $A4CC  08        PHP
  $A4CD  08        PHP
  $A4CE  08        PHP
  $A4CF  10 FF     BPL $A4D0
  $A4D1  DF        .db $DF
  $A4D2  FF        .db $FF
  $A4D3  FF        .db $FF
  $A4D4  FE FE FD  INC $FDFE,X

L_A4D7:
  $A4D7  7D 00 20  ADC $2000,X
  $A4DA  00        BRK
  $A4DB  00        BRK
  $A4DC  01 01     ORA ($01,X)
  $A4DE  02        .db $02
  $A4DF  82        .db $82
  $A4E0  00        BRK
  $A4E1  40        RTI
  $A4E2  00        BRK
  $A4E3  C0 E0     CPY #$E0
  $A4E5  F0 F0     BEQ $A4D7
  $A4E7  F0 FF     BEQ $A4E8
  $A4E9  BF        .db $BF
  $A4EA  FF        .db $FF
  $A4EB  3F        .db $3F
  $A4EC  1F        .db $1F
  $A4ED  0F        .db $0F
  $A4EE  0F        .db $0F
  $A4EF  0F        .db $0F
  $A4F0  FD E0 80  SBC $80E0,X
  $A4F3  7C        .db $7C
  $A4F4  FE FF FF  INC $FFFF,X
  $A4F7  FF        .db $FF
  $A4F8  02        .db $02
  $A4F9  1F        .db $1F
  $A4FA  7F        .db $7F
  $A4FB  83        .db $83
  $A4FC  01 00     ORA ($00,X)
  $A4FE  00        BRK
  $A4FF  00        BRK
  $A500  7F        .db $7F
  $A501  FF        .db $FF
  $A502  7F        .db $7F
  $A503  FF        .db $FF
  $A504  FF        .db $FF
  $A505  FF        .db $FF
  $A506  FF        .db $FF
  $A507  FD 80 00  SBC $0080,X
  $A50A  80        .db $80
  $A50B  00        BRK
  $A50C  00        BRK
  $A50D  00        BRK
  $A50E  00        BRK
  $A50F  02        .db $02
  $A510  FF        .db $FF
  $A511  E3        .db $E3
  $A512  E0 E0     CPX #$E0
  $A514  A8        TAY
  $A515  71 E8     ADC ($E8),Y
  $A517  F4        .db $F4
  $A518  00        BRK
  $A519  00        BRK
  $A51A  60        RTS
  $A51B  E0 A8     CPX #$A8
  $A51D  71 E8     ADC ($E8),Y
  $A51F  F4        .db $F4
  $A520  FF        .db $FF
  $A521  FC        .db $FC
  $A522  FB        .db $FB
  $A523  F7        .db $F7
  $A524  F7        .db $F7
  $A525  47        .db $47
  $A526  FB        .db $FB
  $A527  FD 00 03  SBC $0300,X
  $A52A  04        .db $04
  $A52B  08        PHP
  $A52C  08        PHP
  $A52D  B8        CLV
  $A52E  04        .db $04
  $A52F  02        .db $02
  $A530  FF        .db $FF
  $A531  FF        .db $FF
  $A532  FF        .db $FF
  $A533  7F        .db $7F
  $A534  1F        .db $1F
  $A535  0F        .db $0F
  $A536  03        .db $03
  $A537  80        .db $80
  $A538  00        BRK
  $A539  00        BRK
  $A53A  00        BRK
  $A53B  00        BRK
  $A53C  00        BRK
  $A53D  00        BRK
  $A53E  00        BRK
  $A53F  80        .db $80
  $A540  00        BRK
  $A541  00        BRK
  $A542  E0 F8     CPX #$F8
  $A544  FF        .db $FF
  $A545  FC        .db $FC
  $A546  FE FF FF  INC $FFFF,X
  $A549  FF        .db $FF
  $A54A  1F        .db $1F
  $A54B  07        .db $07
  $A54C  00        BRK
  $A54D  03        .db $03
  $A54E  01 00     ORA ($00,X)
  $A550  FE FE FD  INC $FDFE,X
  $A553  FB        .db $FB
  $A554  FF        .db $FF
  $A555  FF        .db $FF
  $A556  FF        .db $FF
  $A557  7F        .db $7F
  $A558  01 01     ORA ($01,X)
  $A55A  02        .db $02
  $A55B  04        .db $04
  $A55C  00        BRK
  $A55D  00        BRK
  $A55E  00        BRK
  $A55F  00        BRK
  $A560  00        BRK
  $A561  00        BRK
  $A562  00        BRK
  $A563  00        BRK
  $A564  E8        INX
  $A565  00        BRK
  $A566  00        BRK
  $A567  A0 FF     LDY #$FF
  $A569  FF        .db $FF
  $A56A  FF        .db $FF
  $A56B  FF        .db $FF
  $A56C  17        .db $17
  $A56D  FF        .db $FF
  $A56E  FF        .db $FF
  $A56F  5F        .db $5F

L_A570:
  $A570  00        BRK
  $A571  00        BRK
  $A572  F0 FC     BEQ $A570
  $A574  FE FE F3  INC $F3FE,X
  $A577  F8        SED

L_A578:
  $A578  FF        .db $FF
  $A579  FF        .db $FF
  $A57A  0F        .db $0F
  $A57B  03        .db $03
  $A57C  01 01     ORA ($01,X)
  $A57E  30 F8     BMI $A578
  $A580  00        BRK
  $A581  00        BRK
  $A582  00        BRK
  $A583  00        BRK
  $A584  00        BRK
  $A585  00        BRK
  $A586  00        BRK
  $A587  00        BRK
  $A588  FF        .db $FF
  $A589  FF        .db $FF
  $A58A  FF        .db $FF
  $A58B  FF        .db $FF
  $A58C  FF        .db $FF
  $A58D  FF        .db $FF
  $A58E  FF        .db $FF
  $A58F  FF        .db $FF
  $A590  00        BRK
  $A591  00        BRK
  $A592  00        BRK
  $A593  00        BRK
  $A594  00        BRK
  $A595  00        BRK
  $A596  03        .db $03
  $A597  0F        .db $0F
  $A598  FF        .db $FF
  $A599  FF        .db $FF
  $A59A  FF        .db $FF
  $A59B  FF        .db $FF
  $A59C  FF        .db $FF
  $A59D  FF        .db $FF
  $A59E  FC        .db $FC
  $A59F  F0 00     BEQ $A5A1

L_A5A1:
  $A5A1  00        BRK
  $A5A2  00        BRK
  $A5A3  00        BRK
  $A5A4  00        BRK
  $A5A5  00        BRK
  $A5A6  00        BRK
  $A5A7  00        BRK
  $A5A8  FF        .db $FF
  $A5A9  FF        .db $FF
  $A5AA  FF        .db $FF
  $A5AB  FF        .db $FF
  $A5AC  FF        .db $FF
  $A5AD  FF        .db $FF
  $A5AE  FF        .db $FF
  $A5AF  FF        .db $FF

L_A5B0:
  $A5B0  00        BRK
  $A5B1  00        BRK
  $A5B2  00        BRK
  $A5B3  03        .db $03
  $A5B4  07        .db $07
  $A5B5  0F        .db $0F
  $A5B6  CF        .db $CF
  $A5B7  F7        .db $F7
  $A5B8  FF        .db $FF
  $A5B9  FF        .db $FF
  $A5BA  FF        .db $FF
  $A5BB  FC        .db $FC
  $A5BC  F8        SED
  $A5BD  F0 30     BEQ $A5EF
  $A5BF  08        PHP
  $A5C0  00        BRK
  $A5C1  00        BRK
  $A5C2  00        BRK
  $A5C3  00        BRK
  $A5C4  00        BRK
  $A5C5  07        .db $07
  $A5C6  0F        .db $0F
  $A5C7  1F        .db $1F
  $A5C8  FF        .db $FF
  $A5C9  FF        .db $FF
  $A5CA  FF        .db $FF
  $A5CB  FF        .db $FF
  $A5CC  FF        .db $FF
  $A5CD  F8        SED
  $A5CE  F0 E0     BEQ $A5B0
  $A5D0  1F        .db $1F
  $A5D1  1F        .db $1F
  $A5D2  1F        .db $1F
  $A5D3  EF        .db $EF
  $A5D4  FF        .db $FF
  $A5D5  F8        SED
  $A5D6  F7        .db $F7
  $A5D7  EF        .db $EF
  $A5D8  E0 E0     CPX #$E0
  $A5DA  E0 10     CPX #$10
  $A5DC  00        BRK
  $A5DD  07        .db $07
  $A5DE  08        PHP
  $A5DF  10 00     BPL $A5E1

L_A5E1:
  $A5E1  01 03     ORA ($03,X)
  $A5E3  03        .db $03
  $A5E4  03        .db $03
  $A5E5  83        .db $83
  $A5E6  C0 EF     CPY #$EF
  $A5E8  FF        .db $FF
  $A5E9  FE FC FC  INC $FCFC,X
  $A5EC  FC        .db $FC
  $A5ED  7C        .db $7C
  $A5EE  3F        .db $3F

L_A5EF:
  $A5EF  10 EF     BPL $A5E0
  $A5F1  DF        .db $DF
  $A5F2  FF        .db $FF
  $A5F3  FF        .db $FF
  $A5F4  FF        .db $FF
  $A5F5  7F        .db $7F
  $A5F6  DF        .db $DF
  $A5F7  FF        .db $FF
  $A5F8  10 20     BPL $A61A
  $A5FA  00        BRK

L_A5FB:
  $A5FB  00        BRK
  $A5FC  00        BRK
  $A5FD  80        .db $80
  $A5FE  20 00 00  JSR $0000
  $A601  01 01     ORA ($01,X)
  $A603  03        .db $03
  $A604  03        .db $03
  $A605  03        .db $03
  $A606  01 01     ORA ($01,X)
  $A608  FF        .db $FF
  $A609  FE FE FC  INC $FCFE,X
  $A60C  FC        .db $FC
  $A60D  FC        .db $FC
  $A60E  FE FE 00  INC $00FE,X
  $A611  0F        .db $0F
  $A612  1F        .db $1F
  $A613  3F        .db $3F
  $A614  3F        .db $3F
  $A615  3F        .db $3F
  $A616  3F        .db $3F
  $A617  0F        .db $0F
  $A618  FF        .db $FF
  $A619  F0 E0     BEQ $A5FB
  $A61B  C0 C0     CPY #$C0
  $A61D  C0 C0     CPY #$C0
  $A61F  F0 7E     BEQ $A69F
  $A621  FF        .db $FF
  $A622  FF        .db $FF
  $A623  FF        .db $FF
  $A624  FF        .db $FF
  $A625  FF        .db $FF
  $A626  FF        .db $FF
  $A627  FF        .db $FF
  $A628  81 00     STA ($00,X)
  $A62A  00        BRK
  $A62B  00        BRK
  $A62C  00        BRK
  $A62D  00        BRK
  $A62E  00        BRK
  $A62F  00        BRK
  $A630  EF        .db $EF
  $A631  1F        .db $1F
  $A632  FF        .db $FF
  $A633  F8        SED
  $A634  F7        .db $F7
  $A635  EF        .db $EF
  $A636  FF        .db $FF
  $A637  DF        .db $DF
  $A638  10 E0     BPL $A61A
  $A63A  00        BRK
  $A63B  07        .db $07
  $A63C  08        PHP
  $A63D  10 00     BPL $A63F

L_A63F:
  $A63F  20 F3 FD  JSR $FDF3
  $A642  FD FF FF  SBC $FFFF,X
  $A645  FC        .db $FC
  $A646  FB        .db $FB
  $A647  77        .db $77
  $A648  0C        .db $0C
  $A649  02        .db $02
  $A64A  02        .db $02
  $A64B  00        BRK
  $A64C  00        BRK
  $A64D  03        .db $03
  $A64E  04        .db $04
  $A64F  88        DEY
  $A650  EF        .db $EF
  $A651  EF        .db $EF
  $A652  EF        .db $EF
  $A653  EF        .db $EF
  $A654  EF        .db $EF
  $A655  87        .db $87
  $A656  7B        .db $7B
  $A657  7F        .db $7F
  $A658  10 10     BPL $A66A
  $A65A  10 10     BPL $A66C
  $A65C  10 78     BPL $A6D6
  $A65E  84 80     STY $80
  $A660  DF        .db $DF
  $A661  FF        .db $FF
  $A662  FF        .db $FF
  $A663  FF        .db $FF
  $A664  FF        .db $FF
  $A665  3F        .db $3F
  $A666  CF        .db $CF
  $A667  F7        .db $F7
  $A668  20 00 00  JSR $0000
  $A66B  00        BRK

L_A66C:
  $A66C  00        BRK
  $A66D  C0 30     CPY #$30
  $A66F  08        PHP
  $A670  F7        .db $F7
  $A671  FF        .db $FF
  $A672  FF        .db $FF
  $A673  F7        .db $F7
  $A674  FF        .db $FF
  $A675  FF        .db $FF
  $A676  F8        SED
  $A677  F8        SED
  $A678  08        PHP
  $A679  00        BRK
  $A67A  00        BRK
  $A67B  08        PHP
  $A67C  00        BRK
  $A67D  00        BRK
  $A67E  08        PHP
  $A67F  18        CLC
  $A680  FF        .db $FF
  $A681  7F        .db $7F
  $A682  BF        .db $BF
  $A683  BF        .db $BF
  $A684  BF        .db $BF
  $A685  BF        .db $BF
  $A686  FF        .db $FF
  $A687  BF        .db $BF
  $A688  00        BRK
  $A689  80        .db $80
  $A68A  40        RTI
  $A68B  40        RTI
  $A68C  40        RTI
  $A68D  40        RTI
  $A68E  00        BRK
  $A68F  40        RTI
  $A690  7F        .db $7F
  $A691  FF        .db $FF
  $A692  FF        .db $FF
  $A693  3F        .db $3F
  $A694  DF        .db $DF
  $A695  EE FD FD  INC $FDFD

L_A698:
  $A698  80        .db $80
  $A699  00        BRK
  $A69A  00        BRK
  $A69B  C0 20     CPY #$20
  $A69D  11 02     ORA ($02),Y

L_A69F:
  $A69F  02        .db $02
  $A6A0  DF        .db $DF
  $A6A1  BF        .db $BF
  $A6A2  FF        .db $FF
  $A6A3  BF        .db $BF
  $A6A4  FF        .db $FF
  $A6A5  FF        .db $FF
  $A6A6  FF        .db $FF
  $A6A7  FF        .db $FF
  $A6A8  20 40 00  JSR $0040
  $A6AB  40        RTI
  $A6AC  00        BRK
  $A6AD  00        BRK
  $A6AE  00        BRK
  $A6AF  00        BRK
  $A6B0  FF        .db $FF
  $A6B1  FF        .db $FF
  $A6B2  FF        .db $FF
  $A6B3  FF        .db $FF
  $A6B4  87        .db $87
  $A6B5  79 FE FF  ADC $FFFE,Y
  $A6B8  00        BRK
  $A6B9  00        BRK
  $A6BA  00        BRK
  $A6BB  00        BRK
  $A6BC  78        SEI
  $A6BD  86 01     STX $01
  $A6BF  00        BRK
  $A6C0  FB        .db $FB
  $A6C1  FF        .db $FF
  $A6C2  FB        .db $FB
  $A6C3  FF        .db $FF
  $A6C4  E1 DE     SBC ($DE,X)
  $A6C6  BF        .db $BF
  $A6C7  BF        .db $BF
  $A6C8  04        .db $04
  $A6C9  00        BRK
  $A6CA  04        .db $04
  $A6CB  00        BRK
  $A6CC  1E 21 40  ASL $4021,X
  $A6CF  40        RTI
  $A6D0  BF        .db $BF
  $A6D1  BF        .db $BF
  $A6D2  FF        .db $FF
  $A6D3  EF        .db $EF
  $A6D4  FF        .db $FF
  $A6D5  FF        .db $FF

L_A6D6:
  $A6D6  FF        .db $FF
  $A6D7  3F        .db $3F
  $A6D8  40        RTI
  $A6D9  40        RTI
  $A6DA  00        BRK
  $A6DB  10 00     BPL $A6DD

L_A6DD:
  $A6DD  00        BRK
  $A6DE  00        BRK
  $A6DF  00        BRK
  $A6E0  FF        .db $FF
  $A6E1  FF        .db $FF
  $A6E2  FF        .db $FF
  $A6E3  FF        .db $FF
  $A6E4  FF        .db $FF
  $A6E5  FF        .db $FF
  $A6E6  FF        .db $FF
  $A6E7  FF        .db $FF
  $A6E8  00        BRK
  $A6E9  00        BRK
  $A6EA  00        BRK
  $A6EB  00        BRK
  $A6EC  00        BRK
  $A6ED  00        BRK
  $A6EE  00        BRK
  $A6EF  00        BRK
  $A6F0  FF        .db $FF
  $A6F1  FF        .db $FF
  $A6F2  FF        .db $FF
  $A6F3  FF        .db $FF
  $A6F4  FF        .db $FF
  $A6F5  FF        .db $FF
  $A6F6  FC        .db $FC
  $A6F7  F3        .db $F3
  $A6F8  00        BRK
  $A6F9  00        BRK
  $A6FA  00        BRK
  $A6FB  00        BRK
  $A6FC  01 03     ORA ($03,X)
  $A6FE  0C        .db $0C
  $A6FF  13        .db $13
  $A700  B6 7D     LDX $7D,Y
  $A702  EF        .db $EF
  $A703  EE E7 E3  INC $E3E7
  $A706  03        .db $03
  $A707  87        .db $87
  $A708  00        BRK
  $A709  00        BRK
  $A70A  20 20 60  JSR $6020
  $A70D  E0 00     CPX #$00
  $A70F  30 87     BMI $A698
  $A711  BE 4F 87  LDX $874F,Y
  $A714  80        .db $80
  $A715  00        BRK
  $A716  BA        TSX
  $A717  DF        .db $DF
  $A718  30 3E     BMI $A758
  $A71A  4F        .db $4F
  $A71B  A7        .db $A7
  $A71C  70 55     BVS $A773
  $A71E  00        BRK
  $A71F  00        BRK
  $A720  ED BE DB  SBC $DBBE
  $A723  B6 FF     LDX $FF,Y
  $A725  FB        .db $FB
  $A726  FF        .db $FF
  $A727  FE 00 00  INC $0000,X
  $A72A  00        BRK
  $A72B  00        BRK
  $A72C  00        BRK
  $A72D  00        BRK
  $A72E  00        BRK
  $A72F  00        BRK
  $A730  7B        .db $7B
  $A731  3D 1E 81  AND $811E,X
  $A734  01 26     ORA ($26,X)
  $A736  7F        .db $7F
  $A737  B7        .db $B7
  $A738  78        SEI
  $A739  3C        .db $3C
  $A73A  5E A0 3C  LSR $3CA0,X
  $A73D  10 00     BPL $A73F

L_A73F:
  $A73F  00        BRK
  $A740  A9 5A     LDA #$5A
  $A742  47        .db $47
  $A743  A9 12     LDA #$12
  $A745  05 50     ORA $50
  $A747  BB        .db $BB
  $A748  00        BRK
  $A749  00        BRK
  $A74A  38        SEC
  $A74B  54        .db $54
  $A74C  6C FA AE  JMP ($AEFA)
  $A74F  44        .db $44
  $A750  44        .db $44
  $A751  9B        .db $9B
  $A752  55 BF     EOR $BF,X
  $A754  AA        TAX
  $A755  5F        .db $5F
  $A756  BB        .db $BB
  $A757  EF        .db $EF

L_A758:
  $A758  28        PLP
  $A759  10 10     BPL $A76B
  $A75B  10 55     BPL $A7B2
  $A75D  A0 44     LDY #$44
  $A75F  10 74     BPL $A7D5
  $A761  BA        TSX
  $A762  D7        .db $D7
  $A763  BA        TSX
  $A764  D7        .db $D7
  $A765  BE D7 FF  LDX $FFD7,Y

L_A768:
  $A768  00        BRK
  $A769  00        BRK
  $A76A  00        BRK

L_A76B:
  $A76B  00        BRK
  $A76C  00        BRK
  $A76D  00        BRK
  $A76E  00        BRK
  $A76F  00        BRK
  $A770  DD AB FF  CMP $FFAB,X

L_A773:
  $A773  AE F7 55  LDX $55F7
  $A776  FB        .db $FB
  $A777  B6 00     LDX $00,Y
  $A779  00        BRK
  $A77A  00        BRK
  $A77B  00        BRK
  $A77C  00        BRK
  $A77D  AA        TAX
  $A77E  04        .db $04
  $A77F  49 62     EOR #$62
  $A781  B9 57 AA  LDA $AA57,Y
  $A784  FF        .db $FF
  $A785  BA        TSX
  $A786  5D F7 00  EOR $00F7,X
  $A789  00        BRK
  $A78A  00        BRK
  $A78B  00        BRK
  $A78C  00        BRK
  $A78D  00        BRK
  $A78E  00        BRK
  $A78F  00        BRK
  $A790  5D BB FD  EOR $FDBB,X
  $A793  AF        .db $AF
  $A794  A7        .db $A7
  $A795  75 FF     ADC $FF,X
  $A797  B6 00     LDX $00,Y
  $A799  00        BRK
  $A79A  02        .db $02
  $A79B  00        BRK
  $A79C  50 8A     BVC $A728
  $A79E  00        BRK
  $A79F  49 42     EOR #$42
  $A7A1  AB        .db $AB
  $A7A2  77        .db $77
  $A7A3  FA        .db $FA
  $A7A4  DF        .db $DF
  $A7A5  BE D5 FA  LDX $FAD5,Y
  $A7A8  00        BRK
  $A7A9  00        BRK
  $A7AA  00        BRK
  $A7AB  00        BRK
  $A7AC  00        BRK
  $A7AD  00        BRK
  $A7AE  00        BRK
  $A7AF  05 5D     ORA $5D
  $A7B1  AF        .db $AF

L_A7B2:
  $A7B2  7F        .db $7F
  $A7B3  BA        TSX
  $A7B4  A5 55     LDA $55
  $A7B6  FB        .db $FB
  $A7B7  FE 02 50  INC $5002,X
  $A7BA  80        .db $80
  $A7BB  04        .db $04
  $A7BC  50 AA     BVC $A768
  $A7BE  04        .db $04
  $A7BF  01 95     ORA ($95,X)
  $A7C1  52        .db $52
  $A7C2  C5 91     CMP $91
  $A7C4  49 A0     EOR #$A0
  $A7C6  0A        ASL
  $A7C7  DD 00 08  CMP $0800,X
  $A7CA  3A        .db $3A
  $A7CB  2A        ROL
  $A7CC  36 5B     ROL $5B,X
  $A7CE  75 22     ADC $22,X
  $A7D0  22        .db $22
  $A7D1  D9 AB FD  CMP $FDAB,Y
  $A7D4  7F        .db $7F

L_A7D5:
  $A7D5  FB        .db $FB
  $A7D6  DD FF 14  CMP $14FF,X
  $A7D9  08        PHP
  $A7DA  08        PHP
  $A7DB  08        PHP
  $A7DC  80        .db $80
  $A7DD  04        .db $04
  $A7DE  22        .db $22
  $A7DF  00        BRK
  $A7E0  B0 21     BCS $A803
  $A7E2  40        RTI
  $A7E3  EA        NOP
  $A7E4  01 D3     ORA ($D3,X)
  $A7E6  2E 05 08  ROL $0805
  $A7E9  1C        .db $1C
  $A7EA  3E 14 7E  ROL $7E14,X
  $A7ED  2C 50 28  BIT $2850
  $A7F0  D3        .db $D3
  $A7F1  56 DD     LSR $DD,X
  $A7F3  77        .db $77
  $A7F4  E8        INX
  $A7F5  55 7B     EOR $7B,X
  $A7F7  EE 10 10  INC $1010
  $A7FA  10 00     BPL $A7FC

L_A7FC:
  $A7FC  02        .db $02
  $A7FD  20 84 11  JSR $1184
  $A800  FC        .db $FC
  $A801  F5 F6     SBC $F6,X

L_A803:
  $A803  FA        .db $FA
  $A804  F9 F9 FC  SBC $FCF9,Y
  $A807  FC        .db $FC
  $A808  FC        .db $FC
  $A809  F5 F6     SBC $F6,X
  $A80B  FA        .db $FA
  $A80C  F9 F9 FC  SBC $FCF9,Y
  $A80F  FC        .db $FC
  $A810  FE FC FB  INC $FBFC,X
  $A813  E7        .db $E7
  $A814  DF        .db $DF
  $A815  FF        .db $FF
  $A816  EB        .db $EB
  $A817  56 FE     LSR $FE,X
  $A819  FC        .db $FC
  $A81A  FB        .db $FB
  $A81B  E7        .db $E7
  $A81C  DF        .db $DF
  $A81D  FF        .db $FF
  $A81E  EB        .db $EB
  $A81F  56 40     LSR $40,X
  $A821  24 10     BIT $10
  $A823  89        .db $89
  $A824  44        .db $44
  $A825  26 BB     ROL $BB
  $A827  9F        .db $9F
  $A828  40        RTI
  $A829  24 10     BIT $10
  $A82B  89        .db $89
  $A82C  44        .db $44
  $A82D  26 BB     ROL $BB
  $A82F  9F        .db $9F
  $A830  3C        .db $3C
  $A831  E3        .db $E3
  $A832  9F        .db $9F
  $A833  FC        .db $FC
  $A834  F3        .db $F3
  $A835  FF        .db $FF
  $A836  EE D9 3C  INC $3CD9
  $A839  E3        .db $E3
  $A83A  9F        .db $9F
  $A83B  FC        .db $FC
  $A83C  F3        .db $F3
  $A83D  FF        .db $FF
  $A83E  EE D9 1F  INC $1FD9
  $A841  05 0B     ORA $0B
  $A843  17        .db $17
  $A844  EF        .db $EF
  $A845  4F        .db $4F
  $A846  9B        .db $9B
  $A847  77        .db $77
  $A848  03        .db $03
  $A849  05 0B     ORA $0B
  $A84B  17        .db $17
  $A84C  EF        .db $EF
  $A84D  4F        .db $4F
  $A84E  9B        .db $9B
  $A84F  77        .db $77
  $A850  EF        .db $EF
  $A851  DF        .db $DF
  $A852  3F        .db $3F
  $A853  EF        .db $EF
  $A854  9F        .db $9F
  $A855  3F        .db $3F
  $A856  7E 55 EF  ROR $EF55,X
  $A859  DF        .db $DF
  $A85A  3F        .db $3F
  $A85B  EF        .db $EF
  $A85C  9F        .db $9F
  $A85D  3F        .db $3F
  $A85E  7E 55 F8  ROR $F855,X
  $A861  FC        .db $FC
  $A862  FC        .db $FC
  $A863  FE FE FF  INC $FFFE,X
  $A866  F7        .db $F7
  $A867  FB        .db $FB
  $A868  F8        SED
  $A869  FC        .db $FC
  $A86A  FC        .db $FC
  $A86B  FE FE FF  INC $FFFE,X
  $A86E  F7        .db $F7
  $A86F  FB        .db $FB
  $A870  FD FE FE  SBC $FEFE,X
  $A873  EF        .db $EF
  $A874  F7        .db $F7
  $A875  F5 FA     SBC $FA,X
  $A877  69 FD     ADC #$FD
  $A879  FE FE EF  INC $EFFE,X
  $A87C  F7        .db $F7
  $A87D  F5 FA     SBC $FA,X
  $A87F  69 08     ADC #$08
  $A881  1C        .db $1C
  $A882  0E 07 01  ASL $0107
  $A885  80        .db $80
  $A886  90 48     BCC $A8D0
  $A888  79 1C 0E  ADC $0E1C,Y
  $A88B  07        .db $07
  $A88C  01 80     ORA ($80,X)
  $A88E  90 48     BCC $A8D8
  $A890  A4 F2     LDY $F2
  $A892  D2        .db $D2
  $A893  69 34     ADC #$34
  $A895  98        TYA
  $A896  8F        .db $8F
  $A897  C3        .db $C3
  $A898  A4 F2     LDY $F2
  $A89A  D2        .db $D2
  $A89B  69 34     ADC #$34
  $A89D  98        TYA
  $A89E  8F        .db $8F
  $A89F  C3        .db $C3
  $A8A0  00        BRK
  $A8A1  00        BRK
  $A8A2  00        BRK
  $A8A3  80        .db $80
  $A8A4  61 B3     ADC ($B3,X)
  $A8A6  45 19     EOR $19
  $A8A8  FF        .db $FF
  $A8A9  7F        .db $7F
  $A8AA  1F        .db $1F
  $A8AB  87        .db $87
  $A8AC  61 B3     ADC ($B3,X)
  $A8AE  45 19     EOR $19
  $A8B0  03        .db $03
  $A8B1  04        .db $04
  $A8B2  23        .db $23
  $A8B3  11 8C     ORA ($8C),Y
  $A8B5  62        .db $62
  $A8B6  11 CC     ORA ($CC),Y
  $A8B8  03        .db $03
  $A8B9  04        .db $04
  $A8BA  23        .db $23
  $A8BB  11 8C     ORA ($8C),Y
  $A8BD  62        .db $62
  $A8BE  11 CC     ORA ($CC),Y
  $A8C0  00        BRK
  $A8C1  00        BRK
  $A8C2  00        BRK
  $A8C3  80        .db $80
  $A8C4  C0 A1     CPY #$A1
  $A8C6  53        .db $53
  $A8C7  CF        .db $CF
  $A8C8  FF        .db $FF
  $A8C9  FF        .db $FF
  $A8CA  FF        .db $FF
  $A8CB  9F        .db $9F
  $A8CC  C7        .db $C7
  $A8CD  A1 53     LDA ($53,X)
  $A8CF  CF        .db $CF

L_A8D0:
  $A8D0  9C        .db $9C
  $A8D1  3B        .db $3B
  $A8D2  77        .db $77
  $A8D3  CE BD 3A  DEC $3ABD
  $A8D6  85 63     STA $63

L_A8D8:
  $A8D8  9C        .db $9C
  $A8D9  3B        .db $3B
  $A8DA  77        .db $77
  $A8DB  CE BD 3A  DEC $3ABD
  $A8DE  85 63     STA $63
  $A8E0  00        BRK
  $A8E1  02        .db $02
  $A8E2  0E 1F 7F  ASL $7F1F
  $A8E5  FF        .db $FF
  $A8E6  BF        .db $BF
  $A8E7  7F        .db $7F
  $A8E8  FF        .db $FF

L_A8E9:
  $A8E9  FE FE FF  INC $FFFE,X
  $A8EC  FF        .db $FF
  $A8ED  FF        .db $FF
  $A8EE  BF        .db $BF
  $A8EF  7F        .db $7F
  $A8F0  FF        .db $FF
  $A8F1  FF        .db $FF
  $A8F2  77        .db $77
  $A8F3  F7        .db $F7
  $A8F4  6F        .db $6F
  $A8F5  EF        .db $EF
  $A8F6  DF        .db $DF
  $A8F7  BA        TSX
  $A8F8  FF        .db $FF
  $A8F9  FF        .db $FF
  $A8FA  77        .db $77

L_A8FB:
  $A8FB  F7        .db $F7
  $A8FC  6F        .db $6F
  $A8FD  EF        .db $EF
  $A8FE  DF        .db $DF
  $A8FF  BA        TSX
  $A900  1F        .db $1F
  $A901  3F        .db $3F
  $A902  3F        .db $3F
  $A903  1F        .db $1F
  $A904  07        .db $07
  $A905  81 80     STA ($80,X)
  $A907  D0 E0     BNE $A8E9
  $A909  C0 00     CPY #$00
  $A90B  00        BRK
  $A90C  00        BRK
  $A90D  80        .db $80
  $A90E  80        .db $80
  $A90F  D0 EA     BNE $A8FB
  $A911  E9 F4     SBC #$F4
  $A913  DA        .db $DA
  $A914  ED AC D6  SBC $D6AC
  $A917  BB        .db $BB
  $A918  EA        NOP
  $A919  E9 F4     SBC #$F4
  $A91B  DA        .db $DA
  $A91C  ED AC D6  SBC $D6AC
  $A91F  BB        .db $BB
  $A920  FB        .db $FB
  $A921  FB        .db $FB
  $A922  FB        .db $FB
  $A923  FB        .db $FB
  $A924  F7        .db $F7
  $A925  F7        .db $F7
  $A926  7F        .db $7F
  $A927  1F        .db $1F
  $A928  04        .db $04
  $A929  04        .db $04
  $A92A  04        .db $04
  $A92B  04        .db $04
  $A92C  08        PHP
  $A92D  08        PHP
  $A92E  00        BRK
  $A92F  00        BRK
  $A930  07        .db $07
  $A931  01 C0     ORA ($C0,X)
  $A933  24 12     BIT $12
  $A935  89        .db $89
  $A936  46 21     LSR $21
  $A938  00        BRK
  $A939  00        BRK
  $A93A  C0 24     CPY #$24
  $A93C  12        .db $12
  $A93D  89        .db $89
  $A93E  46 21     LSR $21
  $A940  DF        .db $DF
  $A941  DF        .db $DF
  $A942  DF        .db $DF
  $A943  FF        .db $FF
  $A944  FF        .db $FF
  $A945  FF        .db $FF
  $A946  FF        .db $FF
  $A947  FF        .db $FF
  $A948  20 20 20  JSR $2020
  $A94B  00        BRK
  $A94C  00        BRK
  $A94D  00        BRK
  $A94E  01 07     ORA ($07,X)
  $A950  FF        .db $FF
  $A951  FF        .db $FF
  $A952  77        .db $77
  $A953  DB        .db $DB
  $A954  FF        .db $FF
  $A955  B6 CE     LDX $CE,Y
  $A957  BB        .db $BB
  $A958  0F        .db $0F
  $A959  3F        .db $3F

L_A95A:
  $A95A  77        .db $77
  $A95B  DB        .db $DB
  $A95C  FF        .db $FF
  $A95D  B6 CE     LDX $CE,Y
  $A95F  BB        .db $BB
  $A960  FF        .db $FF
  $A961  FF        .db $FF

L_A962:
  $A962  FF        .db $FF
  $A963  FF        .db $FF
  $A964  FF        .db $FF
  $A965  FF        .db $FF
  $A966  1F        .db $1F
  $A967  8E 00 00  STX $0000
  $A96A  00        BRK
  $A96B  00        BRK
  $A96C  00        BRK
  $A96D  00        BRK
  $A96E  23        .db $23
  $A96F  8E 87 C1  STX $C187
  $A972  E0 A4     CPX #$A4
  $A974  92        .db $92
  $A975  C9 46     CMP #$46
  $A977  21 87     AND ($87,X)
  $A979  C1 E0     CMP ($E0,X)
  $A97B  A4 92     LDY $92
  $A97D  C9 46     CMP #$46
  $A97F  21 FF     AND ($FF,X)
  $A981  FF        .db $FF
  $A982  FF        .db $FF
  $A983  FF        .db $FF
  $A984  FC        .db $FC
  $A985  E3        .db $E3
  $A986  1F        .db $1F
  $A987  FD 00 00  SBC $0000,X
  $A98A  01 07     ORA ($07,X)
  $A98C  1C        .db $1C
  $A98D  E3        .db $E3
  $A98E  1F        .db $1F
  $A98F  FD EB 58  SBC $58EB,X
  $A992  03        .db $03
  $A993  47        .db $47
  $A994  2C 00 00  BIT $0000
  $A997  82        .db $82
  $A998  EB        .db $EB
  $A999  58        CLI
  $A99A  03        .db $03
  $A99B  47        .db $47
  $A99C  2C 00 00  BIT $0000
  $A99F  82        .db $82
  $A9A0  EA        NOP
  $A9A1  D9 A9 78  CMP $78A9,Y
  $A9A4  DC        .db $DC
  $A9A5  B8        CLV
  $A9A6  A1 47     LDA ($47,X)
  $A9A8  2A        ROL
  $A9A9  D9 A9 78  CMP $78A9,Y
  $A9AC  DC        .db $DC
  $A9AD  B8        CLV
  $A9AE  A1 47     LDA ($47,X)
  $A9B0  1F        .db $1F
  $A9B1  7F        .db $7F
  $A9B2  FF        .db $FF
  $A9B3  9E        .db $9E
  $A9B4  39 47 9E  AND $9E47,Y
  $A9B7  7F        .db $7F
  $A9B8  1F        .db $1F
  $A9B9  7F        .db $7F
  $A9BA  FF        .db $FF
  $A9BB  9E        .db $9E
  $A9BC  39 47 9E  AND $9E47,Y
  $A9BF  7F        .db $7F
  $A9C0  0F        .db $0F
  $A9C1  00        BRK
  $A9C2  01 C7     ORA ($C7,X)
  $A9C4  1C        .db $1C
  $A9C5  63        .db $63
  $A9C6  1F        .db $1F
  $A9C7  FD 00 00  SBC $0000,X
  $A9CA  01 C7     ORA ($C7,X)
  $A9CC  1C        .db $1C
  $A9CD  63        .db $63
  $A9CE  1F        .db $1F
  $A9CF  FD EB D8  SBC $D8EB,X
  $A9D2  83        .db $83
  $A9D3  3E FA E4  ROL $E4FA,X
  $A9D6  50 82     BVC $A95A
  $A9D8  EB        .db $EB
  $A9D9  D8        CLD
  $A9DA  83        .db $83
  $A9DB  3E FA E4  ROL $E4FA,X
  $A9DE  50 82     BVC $A962
  $A9E0  D7        .db $D7
  $A9E1  AF        .db $AF
  $A9E2  DD 7B EB  CMP $EB7B,X
  $A9E5  D7        .db $D7
  $A9E6  AF        .db $AF
  $A9E7  5B        .db $5B
  $A9E8  57        .db $57
  $A9E9  AF        .db $AF
  $A9EA  DD 7B EB  CMP $EB7B,X
  $A9ED  D7        .db $D7
  $A9EE  AF        .db $AF
  $A9EF  5B        .db $5B
  $A9F0  37        .db $37
  $A9F1  EF        .db $EF
  $A9F2  DF        .db $DF
  $A9F3  BE 3D 69  LDX $693D,Y
  $A9F6  D2        .db $D2
  $A9F7  4B        .db $4B
  $A9F8  37        .db $37
  $A9F9  EF        .db $EF
  $A9FA  DF        .db $DF

L_A9FB:
  $A9FB  BE 3D 69  LDX $693D,Y
  $A9FE  D2        .db $D2
  $A9FF  4B        .db $4B
  $AA00  B6 7D     LDX $7D,Y
  $AA02  EF        .db $EF
  $AA03  FE FF FF  INC $FFFF,X

L_AA06:
  $AA06  DF        .db $DF
  $AA07  8F        .db $8F
  $AA08  00        BRK
  $AA09  00        BRK
  $AA0A  00        BRK
  $AA0B  00        BRK
  $AA0C  00        BRK
  $AA0D  3E 5F AF  ROL $AF5F,X
  $AA10  00        BRK
  $AA11  BE 4F 87  LDX $874F,Y
  $AA14  80        .db $80
  $AA15  00        BRK
  $AA16  BA        TSX
  $AA17  DF        .db $DF
  $AA18  70 3E     BVS $AA58
  $AA1A  4F        .db $4F
  $AA1B  A7        .db $A7
  $AA1C  70 55     BVS $AA73
  $AA1E  00        BRK
  $AA1F  00        BRK
  $AA20  ED BE DB  SBC $DBBE
  $AA23  B6 FF     LDX $FF,Y
  $AA25  FB        .db $FB
  $AA26  FF        .db $FF
  $AA27  FE 00 00  INC $0000,X
  $AA2A  00        BRK
  $AA2B  00        BRK
  $AA2C  00        BRK
  $AA2D  00        BRK
  $AA2E  00        BRK
  $AA2F  80        .db $80
  $AA30  7B        .db $7B
  $AA31  3D 1E 81  AND $811E,X
  $AA34  01 26     ORA ($26,X)
  $AA36  7F        .db $7F
  $AA37  B6 78     LDX $78,Y
  $AA39  3C        .db $3C
  $AA3A  5E A0 3C  LSR $3CA0,X
  $AA3D  10 00     BPL $AA3F

L_AA3F:
  $AA3F  00        BRK
  $AA40  B8        CLV
  $AA41  F4        .db $F4
  $AA42  70 C0     BVS $AA04
  $AA44  84 C1     STY $C1
  $AA46  CA        DEX
  $AA47  E5 47     SBC $47
  $AA49  0B        .db $0B
  $AA4A  8F        .db $8F
  $AA4B  2F        .db $2F
  $AA4C  33        .db $33
  $AA4D  1E 33 09  ASL $0933,X
  $AA50  C4 E9     CPY $E9
  $AA52  F4        .db $F4
  $AA53  7E FB A8  ROR $A8FB,X
  $AA56  12        .db $12
  $AA57  5F        .db $5F

L_AA58:
  $AA58  12        .db $12
  $AA59  02        .db $02
  $AA5A  00        BRK
  $AA5B  00        BRK
  $AA5C  04        .db $04
  $AA5D  02        .db $02
  $AA5E  45 A0     EOR $A0
  $AA60  9E        .db $9E
  $AA61  03        .db $03
  $AA62  06 41     ASL $41
  $AA64  12        .db $12
  $AA65  68        PLA
  $AA66  D1 4B     CMP ($4B),Y
  $AA68  61 D0     ADC ($D0,X)
  $AA6A  E9 BC     SBC #$BC
  $AA6C  E8        INX
  $AA6D  B6 4C     LDX $4C,Y
  $AA6F  50 95     BVC $AA06
  $AA71  83        .db $83
  $AA72  AF        .db $AF

L_AA73:
  $AA73  95 6B     STA $6B,X
  $AA75  9C        .db $9C
  $AA76  A9 DA     LDA #$DA
  $AA78  A8        TAY
  $AA79  90 80     BCC $A9FB
  $AA7B  80        .db $80
  $AA7C  00        BRK
  $AA7D  22        .db $22
  $AA7E  54        .db $54
  $AA7F  25 FF     AND $FF
  $AA81  FF        .db $FF
  $AA82  FF        .db $FF
  $AA83  FF        .db $FF
  $AA84  ED C5 C6  SBC $C6C5
  $AA87  80        .db $80
  $AA88  00        BRK
  $AA89  00        BRK
  $AA8A  00        BRK
  $AA8B  1F        .db $1F
  $AA8C  2D 45 56  AND $5645
  $AA8F  B8        CLV
  $AA90  03        .db $03
  $AA91  85 A8     STA $A8
  $AA93  D0 A0     BNE $AA35
  $AA95  80        .db $80
  $AA96  40        RTI
  $AA97  A0 3B     LDY #$3B
  $AA99  35 0A     AND $0A,X
  $AA9B  17        .db $17
  $AA9C  2F        .db $2F
  $AA9D  18        CLC
  $AA9E  1F        .db $1F
  $AA9F  0F        .db $0F
  $AAA0  FF        .db $FF
  $AAA1  FF        .db $FF
  $AAA2  FF        .db $FF
  $AAA3  FF        .db $FF

L_AAA4:
  $AAA4  7F        .db $7F
  $AAA5  7F        .db $7F
  $AAA6  BF        .db $BF
  $AAA7  0F        .db $0F
  $AAA8  00        BRK
  $AAA9  00        BRK
  $AAAA  00        BRK
  $AAAB  80        .db $80
  $AAAC  40        RTI
  $AAAD  40        RTI
  $AAAE  A0 00     LDY #$00
  $AAB0  DA        .db $DA
  $AAB1  ED F6 7B  SBC $7BF6
  $AAB4  3D 00 00  AND $0000,X
  $AAB7  49 DA     EOR #$DA
  $AAB9  ED F6 7B  SBC $7BF6
  $AABC  BD C0 DB  LDA $DBC0,X
  $AABF  96 FF     STX $FF,Y
  $AAC1  FB        .db $FB
  $AAC2  FB        .db $FB
  $AAC3  FD F9 FE  SBC $FEF9,X
  $AAC6  00        BRK
  $AAC7  80        .db $80
  $AAC8  08        PHP
  $AAC9  08        PHP
  $AACA  18        CLC
  $AACB  1C        .db $1C

L_AACC:
  $AACC  38        SEC
  $AACD  7E 00 38  ROR $3800,X
  $AAD0  80        .db $80
  $AAD1  00        BRK
  $AAD2  8D 46 A3  STA $A346
  $AAD5  00        BRK
  $AAD6  00        BRK
  $AAD7  02        .db $02
  $AAD8  24 3C     BIT $3C
  $AADA  BD 66 AB  LDA $AB66,X
  $AADD  0C        .db $0C
  $AADE  0F        .db $0F
  $AADF  85 FF     STA $FF
  $AAE1  FF        .db $FF
  $AAE2  FF        .db $FF
  $AAE3  FF        .db $FF
  $AAE4  FF        .db $FF
  $AAE5  FF        .db $FF
  $AAE6  7F        .db $7F
  $AAE7  FF        .db $FF
  $AAE8  00        BRK
  $AAE9  00        BRK
  $AAEA  00        BRK
  $AAEB  00        BRK
  $AAEC  00        BRK
  $AAED  00        BRK
  $AAEE  00        BRK
  $AAEF  00        BRK
  $AAF0  FF        .db $FF
  $AAF1  FF        .db $FF
  $AAF2  5F        .db $5F
  $AAF3  AF        .db $AF
  $AAF4  57        .db $57
  $AAF5  01 01     ORA ($01,X)
  $AAF7  21 00     AND ($00,X)
  $AAF9  00        BRK
  $AAFA  50 A8     BVC $AAA4
  $AAFC  54        .db $54
  $AAFD  00        BRK
  $AAFE  F0 98     BEQ $AA98
  $AB00  AD E2 7A  LDA $7AE2
  $AB03  ED FF FD  SBC $FDFF
  $AB06  EF        .db $EF
  $AB07  FF        .db $FF
  $AB08  40        RTI
  $AB09  18        CLC
  $AB0A  85 12     STA $12
  $AB0C  00        BRK
  $AB0D  02        .db $02
  $AB0E  10 00     BPL $AB10

L_AB10:
  $AB10  FE FF FF  INC $FFFF,X
  $AB13  FD FF FF  SBC $FFFF,X
  $AB16  5B        .db $5B
  $AB17  FE 01 00  INC $0001,X
  $AB1A  00        BRK
  $AB1B  02        .db $02
  $AB1C  00        BRK
  $AB1D  00        BRK
  $AB1E  00        BRK
  $AB1F  00        BRK
  $AB20  EB        .db $EB
  $AB21  AD E7 5D  LDA $5DE7
  $AB24  DB        .db $DB
  $AB25  B7        .db $B7
  $AB26  ED FB 14  SBC $14FB
  $AB29  00        BRK
  $AB2A  10 A0     BPL $AACC
  $AB2C  24 48     BIT $48
  $AB2E  12        .db $12
  $AB2F  04        .db $04
  $AB30  D7        .db $D7
  $AB31  FC        .db $FC
  $AB32  FF        .db $FF
  $AB33  F6 FF     INC $FF,X
  $AB35  EF        .db $EF
  $AB36  BD F7 28  LDA $28F7,X
  $AB39  03        .db $03
  $AB3A  00        BRK
  $AB3B  09 00     ORA #$00
  $AB3D  00        BRK
  $AB3E  00        BRK
  $AB3F  00        BRK
  $AB40  ED FF BB  SBC $BBFF
  $AB43  F7        .db $F7
  $AB44  5E 77 5D  LSR $5D77,X
  $AB47  55 12     EOR $12,X
  $AB49  00        BRK
  $AB4A  04        .db $04
  $AB4B  00        BRK
  $AB4C  00        BRK
  $AB4D  80        .db $80
  $AB4E  A0 AA     LDY #$AA
  $AB50  AA        TAX
  $AB51  F7        .db $F7
  $AB52  AD FF FF  LDA $FFFF
  $AB55  FB        .db $FB
  $AB56  B6 D7     LDX $D7,Y
  $AB58  55 08     EOR $08,X
  $AB5A  52        .db $52
  $AB5B  00        BRK
  $AB5C  00        BRK
  $AB5D  04        .db $04
  $AB5E  49 28     EOR #$28
  $AB60  EB        .db $EB
  $AB61  BF        .db $BF
  $AB62  EE FF F7  INC $F7FF
  $AB65  FF        .db $FF
  $AB66  7F        .db $7F
  $AB67  DF        .db $DF
  $AB68  14        .db $14
  $AB69  40        RTI
  $AB6A  11 00     ORA ($00),Y
  $AB6C  08        PHP
  $AB6D  00        BRK
  $AB6E  00        BRK
  $AB6F  00        BRK
  $AB70  AF        .db $AF
  $AB71  B6 49     LDX $49,Y
  $AB73  F2        .db $F2
  $AB74  B6 DD     LDX $DD,Y
  $AB76  FB        .db $FB
  $AB77  51 00     EOR ($00),Y
  $AB79  48        PHA
  $AB7A  A2 0C     LDX #$0C
  $AB7C  49 22     EOR #$22
  $AB7E  04        .db $04
  $AB7F  26 ED     ROL $ED
  $AB81  FF        .db $FF
  $AB82  BB        .db $BB
  $AB83  FF        .db $FF
  $AB84  FF        .db $FF
  $AB85  FD FF FF  SBC $FFFF,X
  $AB88  12        .db $12
  $AB89  00        BRK
  $AB8A  44        .db $44
  $AB8B  00        BRK
  $AB8C  00        BRK
  $AB8D  02        .db $02
  $AB8E  00        BRK
  $AB8F  00        BRK
  $AB90  FF        .db $FF
  $AB91  EF        .db $EF
  $AB92  BF        .db $BF
  $AB93  EB        .db $EB
  $AB94  BE EB 36  LDX $36EB,Y
  $AB97  F7        .db $F7
  $AB98  00        BRK
  $AB99  00        BRK
  $AB9A  00        BRK
  $AB9B  00        BRK
  $AB9C  00        BRK
  $AB9D  04        .db $04
  $AB9E  C9 08     CMP #$08
  $ABA0  EB        .db $EB
  $ABA1  BF        .db $BF
  $ABA2  EE FF F7  INC $F7FF
  $ABA5  FF        .db $FF
  $ABA6  FF        .db $FF
  $ABA7  FF        .db $FF
  $ABA8  14        .db $14
  $ABA9  40        RTI
  $ABAA  11 00     ORA ($00),Y
  $ABAC  08        PHP
  $ABAD  00        BRK
  $ABAE  00        BRK
  $ABAF  00        BRK
  $ABB0  FF        .db $FF
  $ABB1  FF        .db $FF
  $ABB2  EF        .db $EF
  $ABB3  BD 97 DD  LDA $DD97,X
  $ABB6  FB        .db $FB
  $ABB7  D9 00 00  CMP $0000,Y
  $ABBA  00        BRK
  $ABBB  00        BRK
  $ABBC  40        RTI
  $ABBD  22        .db $22
  $ABBE  04        .db $04
  $ABBF  26 59     ROL $59
  $ABC1  C6 7A     DEC $7A
  $ABC3  B7        .db $B7
  $ABC4  6E FF B7  ROR $B7FF
  $ABC7  FF        .db $FF
  $ABC8  22        .db $22
  $ABC9  31 85     AND ($85),Y
  $ABCB  48        PHA
  $ABCC  91 00     STA ($00),Y
  $ABCE  48        PHA
  $ABCF  00        BRK
  $ABD0  EF        .db $EF
  $ABD1  FF        .db $FF
  $ABD2  FD FF FF  SBC $FFFF,X
  $ABD5  EF        .db $EF
  $ABD6  FF        .db $FF

L_ABD7:
  $ABD7  FF        .db $FF
  $ABD8  10 00     BPL $ABDA

L_ABDA:
  $ABDA  02        .db $02
  $ABDB  00        BRK
  $ABDC  00        BRK
  $ABDD  10 00     BPL $ABDF

L_ABDF:
  $ABDF  00        BRK
  $ABE0  DD 4E 7B  CMP $7B4E,X
  $ABE3  FF        .db $FF
  $ABE4  EE FF B7  INC $B7FF
  $ABE7  FF        .db $FF
  $ABE8  22        .db $22
  $ABE9  B1 84     LDA ($84),Y
  $ABEB  00        BRK
  $ABEC  11 00     ORA ($00),Y
  $ABEE  48        PHA
  $ABEF  00        BRK
  $ABF0  EF        .db $EF
  $ABF1  FF        .db $FF
  $ABF2  FD FF F7  SBC $F7FF,X
  $ABF5  FF        .db $FF
  $ABF6  7E FF 10  ROR $10FF,X
  $ABF9  00        BRK
  $ABFA  02        .db $02
  $ABFB  00        BRK
  $ABFC  08        PHP
  $ABFD  00        BRK
  $ABFE  81 00     STA ($00,X)
  $AC00  EE F0 D0  INC $D0F0
  $AC03  60        RTS
  $AC04  8C 40 CA  STY $CA40
  $AC07  15 10     ORA $10,X
  $AC09  0B        .db $0B
  $AC0A  25 1F     AND $1F
  $AC0C  13        .db $13
  $AC0D  B7        .db $B7
  $AC0E  15 6A     ORA $6A,X
  $AC10  AA        TAX
  $AC11  65 9B     ADC $9B
  $AC13  B0 C2     BCS $ABD7
  $AC15  69 F9     ADC #$F9
  $AC17  F6 15     INC $15,X
  $AC19  18        CLC
  $AC1A  23        .db $23
  $AC1B  0C        .db $0C
  $AC1C  18        CLC
  $AC1D  06 00     ASL $00
  $AC1F  00        BRK
  $AC20  42        .db $42
  $AC21  18        CLC
  $AC22  02        .db $02
  $AC23  20 0A A1  JSR $A10A
  $AC26  0C        .db $0C
  $AC27  6A        ROR
  $AC28  91 E4     STA ($E4),Y
  $AC2A  FD DF F5  SBC $F5DF,X
  $AC2D  5E B3 55  LSR $55B3,X
  $AC30  DE D5 65  DEC $65D5,X
  $AC33  AA        TAX
  $AC34  6C 65 6D  JMP ($6D65)
  $AC37  62        .db $62
  $AC38  4D 52 22  EOR $2252
  $AC3B  A5 63     LDA $63
  $AC3D  62        .db $62
  $AC3E  60        RTS
  $AC3F  60        RTS
  $AC40  5B        .db $5B
  $AC41  F5 7F     SBC $7F,X
  $AC43  BA        TSX
  $AC44  1F        .db $1F
  $AC45  8A        TXA
  $AC46  5F        .db $5F
  $AC47  0D A4 0A  ORA $0AA4
  $AC4A  00        BRK
  $AC4B  05 80     ORA $80
  $AC4D  65 80     ADC $80
  $AC4F  A2 97     LDX #$97
  $AC51  4F        .db $4F
  $AC52  B7        .db $B7
  $AC53  6D D7 5A  ADC $5AD7
  $AC56  2A        ROL
  $AC57  B5 40     LDA $40,X
  $AC59  A0 40     LDY #$40
  $AC5B  82        .db $82
  $AC5C  00        BRK
  $AC5D  05 00     ORA $00
  $AC5F  00        BRK
  $AC60  DD 4E 7B  CMP $7B4E,X
  $AC63  FF        .db $FF
  $AC64  EE FF B7  INC $B7FF
  $AC67  FF        .db $FF
  $AC68  22        .db $22
  $AC69  B1 84     LDA ($84),Y
  $AC6B  00        BRK
  $AC6C  11 00     ORA ($00),Y
  $AC6E  48        PHA
  $AC6F  00        BRK
  $AC70  EF        .db $EF
  $AC71  FF        .db $FF
  $AC72  FD FF F5  SBC $F5FF,X
  $AC75  DD 4A B5  CMP $B54A,X
  $AC78  10 00     BPL $AC7A

L_AC7A:
  $AC7A  02        .db $02
  $AC7B  00        BRK
  $AC7C  08        PHP
  $AC7D  22        .db $22

L_AC7E:
  $AC7E  91 00     STA ($00),Y
  $AC80  99 06 5B  STA $5B06,Y
  $AC83  B7        .db $B7
  $AC84  6E FE B3  ROR $B3FE
  $AC87  5E 62 B1  LSR $B162,X
  $AC8A  84 48     STY $48
  $AC8C  91 00     STA ($00),Y
  $AC8E  48        PHA
  $AC8F  00        BRK
  $AC90  EA        NOP
  $AC91  BF        .db $BF
  $AC92  E5 4F     SBC $4F
  $AC94  B2        .db $B2
  $AC95  6F        .db $6F
  $AC96  B3        .db $B3
  $AC97  4F        .db $4F
  $AC98  01 00     ORA ($00,X)
  $AC9A  0A        ASL
  $AC9B  10 4D     BPL $ACEA
  $AC9D  90 4C     BCC $ACEB
  $AC9F  B0 DD     BCS $AC7E
  $ACA1  4C 7B EA  JMP $EA7B
  $ACA4  FF        .db $FF
  $ACA5  DA        .db $DA
  $ACA6  F4        .db $F4
  $ACA7  CD 22 B1  CMP $B122
  $ACAA  84 00     STY $00
  $ACAC  00        BRK
  $ACAD  01 09     ORA ($09,X)
  $ACAF  22        .db $22
  $ACB0  EA        NOP
  $ACB1  95 68     STA $68,X
  $ACB3  5F        .db $5F
  $ACB4  F7        .db $F7
  $ACB5  DD 4E B5  CMP $B54E,X
  $ACB8  15 6A     ORA $6A,X
  $ACBA  97        .db $97
  $ACBB  A0 08     LDY #$08
  $ACBD  22        .db $22
  $ACBE  91 00     STA ($00),Y
  $ACC0  B9 C6 7C  LDA $7CC6,Y
  $ACC3  D7        .db $D7
  $ACC4  AC DB B2  LDY $B2DB
  $ACC7  EF        .db $EF
  $ACC8  42        .db $42
  $ACC9  10 01     BPL $ACCC
  $ACCB  00        BRK

L_ACCC:
  $ACCC  11 24     ORA ($24),Y
  $ACCE  4D 10 AD  EOR $AD10
  $ACD1  DF        .db $DF
  $ACD2  F5 7F     SBC $7F,X
  $ACD4  FF        .db $FF
  $ACD5  EF        .db $EF
  $ACD6  FF        .db $FF
  $ACD7  FF        .db $FF
  $ACD8  52        .db $52
  $ACD9  20 0A 80  JSR $800A
  $ACDC  00        BRK
  $ACDD  10 00     BPL $ACDF

L_ACDF:
  $ACDF  00        BRK
  $ACE0  A4 DA     LDY $DA
  $ACE2  AB        .db $AB
  $ACE3  6C 97 FD  JMP ($FD97)
  $ACE6  BF        .db $BF
  $ACE7  F7        .db $F7
  $ACE8  12        .db $12
  $ACE9  01 54     ORA ($54,X)

L_ACEB:
  $ACEB  93        .db $93
  $ACEC  68        PLA
  $ACED  02        .db $02
  $ACEE  40        RTI
  $ACEF  08        PHP
  $ACF0  FF        .db $FF
  $ACF1  DF        .db $DF
  $ACF2  FF        .db $FF
  $ACF3  EF        .db $EF
  $ACF4  BF        .db $BF
  $ACF5  FF        .db $FF
  $ACF6  FF        .db $FF
  $ACF7  FF        .db $FF
  $ACF8  00        BRK
  $ACF9  20 00 10  JSR $1000
  $ACFC  40        RTI
  $ACFD  00        BRK
  $ACFE  00        BRK
  $ACFF  00        BRK
  $AD00  FF        .db $FF
  $AD01  DF        .db $DF
  $AD02  FF        .db $FF
  $AD03  EF        .db $EF
  $AD04  BF        .db $BF
  $AD05  FF        .db $FF
  $AD06  FF        .db $FF
  $AD07  FF        .db $FF
  $AD08  00        BRK
  $AD09  20 00 10  JSR $1000
  $AD0C  40        RTI
  $AD0D  00        BRK
  $AD0E  00        BRK
  $AD0F  00        BRK
  $AD10  FD FF FF  SBC $FFFF,X
  $AD13  FF        .db $FF
  $AD14  FF        .db $FF
  $AD15  FF        .db $FF
  $AD16  FF        .db $FF
  $AD17  FF        .db $FF
  $AD18  02        .db $02
  $AD19  00        BRK
  $AD1A  00        BRK
  $AD1B  00        BRK
  $AD1C  00        BRK
  $AD1D  00        BRK
  $AD1E  00        BRK
  $AD1F  00        BRK
  $AD20  EF        .db $EF
  $AD21  FF        .db $FF
  $AD22  FD FF FF  SBC $FFFF,X
  $AD25  EF        .db $EF
  $AD26  FF        .db $FF
  $AD27  FF        .db $FF
  $AD28  10 00     BPL $AD2A

L_AD2A:
  $AD2A  02        .db $02
  $AD2B  00        BRK
  $AD2C  00        BRK
  $AD2D  10 00     BPL $AD2F

L_AD2F:
  $AD2F  00        BRK
  $AD30  FF        .db $FF
  $AD31  FF        .db $FF
  $AD32  FF        .db $FF
  $AD33  FF        .db $FF
  $AD34  EF        .db $EF
  $AD35  FF        .db $FF
  $AD36  FF        .db $FF
  $AD37  FF        .db $FF

L_AD38:
  $AD38  00        BRK
  $AD39  00        BRK
  $AD3A  00        BRK
  $AD3B  00        BRK
  $AD3C  10 00     BPL $AD3E

L_AD3E:
  $AD3E  00        BRK
  $AD3F  00        BRK
  $AD40  FF        .db $FF
  $AD41  FF        .db $FF
  $AD42  FD FD F8  SBC $F8FD,X
  $AD45  F8        SED
  $AD46  F0 F0     BEQ $AD38
  $AD48  00        BRK
  $AD49  03        .db $03
  $AD4A  05 05     ORA $05
  $AD4C  08        PHP
  $AD4D  08        PHP
  $AD4E  16 16     ASL $16,X
  $AD50  E0 E0     CPX #$E0
  $AD52  C0 C0     CPY #$C0
  $AD54  E0 E3     CPX #$E3
  $AD56  EF        .db $EF
  $AD57  E7        .db $E7
  $AD58  2F        .db $2F
  $AD59  29 5F     AND #$5F
  $AD5B  59 1F 1F  EOR $1F1F,Y
  $AD5E  13        .db $13
  $AD5F  13        .db $13
  $AD60  FF        .db $FF
  $AD61  FF        .db $FF
  $AD62  FF        .db $FF
  $AD63  FF        .db $FF
  $AD64  E1 E1     SBC ($E1,X)
  $AD66  71 71     ADC ($71),Y
  $AD68  00        BRK
  $AD69  FF        .db $FF
  $AD6A  FF        .db $FF
  $AD6B  FF        .db $FF
  $AD6C  E7        .db $E7
  $AD6D  E1 77     SBC ($77,X)
  $AD6F  77        .db $77
  $AD70  39 3F 1F  AND $1F3F,Y
  $AD73  1F        .db $1F
  $AD74  00        BRK
  $AD75  00        BRK
  $AD76  40        RTI
  $AD77  20 39 3F  JSR $3F39
  $AD7A  9F        .db $9F
  $AD7B  9F        .db $9F
  $AD7C  C0 FB     CPY #$FB
  $AD7E  B8        CLV
  $AD7F  DF        .db $DF
  $AD80  FF        .db $FF
  $AD81  FF        .db $FF
  $AD82  FE FF 86  INC $86FF,X
  $AD85  86 C7     STX $C7
  $AD87  C7        .db $C7
  $AD88  00        BRK
  $AD89  FF        .db $FF
  $AD8A  FE FF 9E  INC $9EFF,X
  $AD8D  86 DF     STX $DF
  $AD8F  DF        .db $DF
  $AD90  E6 FF     INC $FF
  $AD92  B4 FF     LDY $FF,X
  $AD94  00        BRK
  $AD95  00        BRK
  $AD96  40        RTI
  $AD97  41 E6     EOR ($E6,X)
  $AD99  FF        .db $FF
  $AD9A  B4 FF     LDY $FF,X
  $AD9C  00        BRK
  $AD9D  6D 21 BC  ADC $BC21
  $ADA0  FF        .db $FF
  $ADA1  FF        .db $FF
  $ADA2  8F        .db $8F
  $ADA3  FF        .db $FF
  $ADA4  07        .db $07
  $ADA5  1F        .db $1F
  $ADA6  03        .db $03
  $ADA7  1F        .db $1F
  $ADA8  00        BRK
  $ADA9  E0 80     CPX #$80
  $ADAB  F0 60     BEQ $AE0D
  $ADAD  18        CLC
  $ADAE  60        RTS
  $ADAF  7C        .db $7C
  $ADB0  81 FF     STA ($FF,X)
  $ADB2  00        BRK
  $ADB3  FF        .db $FF
  $ADB4  00        BRK
  $ADB5  00        BRK
  $ADB6  06 01     ASL $01
  $ADB8  80        .db $80
  $ADB9  FE 00 FF  INC $FF00,X
  $ADBC  00        BRK
  $ADBD  AC 88 FC  LDY $FC88
  $ADC0  FF        .db $FF
  $ADC1  F7        .db $F7
  $ADC2  59 E7 6A  EOR $6AE7,Y
  $ADC5  FC        .db $FC
  $ADC6  B7        .db $B7
  $ADC7  FD 00 00  SBC $0000,X
  $ADCA  24 08     BIT $08
  $ADCC  95 03     STA $03,X
  $ADCE  48        PHA
  $ADCF  02        .db $02
  $ADD0  6D FF B5  ADC $B5FF
  $ADD3  FF        .db $FF
  $ADD4  7F        .db $7F
  $ADD5  EF        .db $EF
  $ADD6  FF        .db $FF
  $ADD7  FF        .db $FF
  $ADD8  92        .db $92
  $ADD9  00        BRK
  $ADDA  4A        LSR
  $ADDB  00        BRK
  $ADDC  80        .db $80
  $ADDD  10 00     BPL $ADDF

L_ADDF:
  $ADDF  00        BRK
  $ADE0  9D 42 FB  STA $FB42,X
  $ADE3  5F        .db $5F
  $ADE4  A6 F9     LDX $F9
  $ADE6  97        .db $97
  $ADE7  7E 22 B5  ROR $B522,X
  $ADEA  04        .db $04
  $ADEB  00        BRK
  $ADEC  51 04     EOR ($04),Y
  $ADEE  68        PLA
  $ADEF  81 EB     STA ($EB,X)
  $ADF1  FE FD FF  INC $FFFD,X
  $ADF4  F7        .db $F7
  $ADF5  FF        .db $FF
  $ADF6  7E FF 14  ROR $14FF,X
  $ADF9  01 02     ORA ($02,X)
  $ADFB  00        BRK
  $ADFC  08        PHP
  $ADFD  00        BRK
  $ADFE  81 00     STA ($00,X)
  $AE00  AD D1 BB  LDA $BBD1
  $AE03  EE 7F DD  INC $DD7F
  $AE06  7F        .db $7F
  $AE07  97        .db $97
  $AE08  12        .db $12
  $AE09  2A        ROL
  $AE0A  44        .db $44
  $AE0B  11 00     ORA ($00),Y

L_AE0D:
  $AE0D  02        .db $02
  $AE0E  00        BRK
  $AE0F  40        RTI
  $AE10  9B        .db $9B
  $AE11  6C DB 76  JMP ($76DB)
  $AE14  FF        .db $FF
  $AE15  FD EF FF  SBC $FFEF,X
  $AE18  60        RTS
  $AE19  92        .db $92
  $AE1A  24 89     BIT $89
  $AE1C  00        BRK
  $AE1D  02        .db $02
  $AE1E  10 00     BPL $AE20

L_AE20:
  $AE20  6B        .db $6B
  $AE21  25 EA     AND $EA
  $AE23  BF        .db $BF
  $AE24  F7        .db $F7
  $AE25  FF        .db $FF
  $AE26  FF        .db $FF
  $AE27  FF        .db $FF
  $AE28  14        .db $14
  $AE29  D2        .db $D2
  $AE2A  15 40     ORA $40,X
  $AE2C  08        PHP
  $AE2D  00        BRK
  $AE2E  00        BRK
  $AE2F  00        BRK
  $AE30  FF        .db $FF
  $AE31  DF        .db $DF
  $AE32  35 DF     AND $DF,X
  $AE34  3A        .db $3A
  $AE35  D7        .db $D7
  $AE36  BD F2 00  LDA $00F2,X
  $AE39  00        BRK
  $AE3A  80        .db $80
  $AE3B  00        BRK
  $AE3C  C0 20     CPY #$20
  $AE3E  40        RTI
  $AE3F  05 EF     ORA $EF
  $AE41  A9 6E     LDA #$6E
  $AE43  FB        .db $FB
  $AE44  BF        .db $BF
  $AE45  FF        .db $FF
  $AE46  F7        .db $F7
  $AE47  FF        .db $FF
  $AE48  00        BRK
  $AE49  54        .db $54
  $AE4A  91 04     STA ($04),Y
  $AE4C  40        RTI
  $AE4D  00        BRK
  $AE4E  08        PHP
  $AE4F  00        BRK
  $AE50  FF        .db $FF
  $AE51  FF        .db $FF
  $AE52  F7        .db $F7
  $AE53  DF        .db $DF
  $AE54  E4 94     CPX $94
  $AE56  53        .db $53
  $AE57  AD 00 00  LDA $0000
  $AE5A  00        BRK
  $AE5B  00        BRK
  $AE5C  11 2B     ORA ($2B),Y
  $AE5E  A4 52     LDY $52
  $AE60  5F        .db $5F
  $AE61  D1 FB     CMP ($FB),Y
  $AE63  EF        .db $EF
  $AE64  FF        .db $FF
  $AE65  BD FF FF  LDA $FFFF,X
  $AE68  80        .db $80
  $AE69  2A        ROL
  $AE6A  04        .db $04
  $AE6B  10 00     BPL $AE6D

L_AE6D:
  $AE6D  42        .db $42
  $AE6E  00        BRK
  $AE6F  00        BRK
  $AE70  FF        .db $FF
  $AE71  EE 76 A9  INC $A976
  $AE74  8C 45 94  STY $9445
  $AE77  6D 00 01  ADC $0100
  $AE7A  08        PHP
  $AE7B  46 73     LSR $73
  $AE7D  AA        TAX
  $AE7E  6B        .db $6B
  $AE7F  92        .db $92
  $AE80  7E DB 76  ROR $76DB,X
  $AE83  DF        .db $DF
  $AE84  FF        .db $FF
  $AE85  FF        .db $FF
  $AE86  EF        .db $EF
  $AE87  F9 81 24  SBC $2481,Y
  $AE8A  89        .db $89
  $AE8B  20 00 00  JSR $0000
  $AE8E  10 06     BPL $AE96
  $AE90  EB        .db $EB
  $AE91  D0 0E     BNE $AEA1
  $AE93  21 D1     AND ($D1,X)
  $AE95  76 98     ROR $98,X
  $AE97  35 04     AND $04,X
  $AE99  2F        .db $2F
  $AE9A  E1 DE     SBC ($DE,X)
  $AE9C  2E 89 67  ROL $6789
  $AE9F  CA        DEX
  $AEA0  D7        .db $D7

L_AEA1:
  $AEA1  B9 ED FF  LDA $FFED,Y
  $AEA4  FF        .db $FF
  $AEA5  D3        .db $D3
  $AEA6  B7        .db $B7
  $AEA7  40        RTI
  $AEA8  08        PHP
  $AEA9  42        .db $42
  $AEAA  12        .db $12
  $AEAB  00        BRK
  $AEAC  00        BRK
  $AEAD  04        .db $04
  $AEAE  48        PHA
  $AEAF  2D 0B A4  AND $A40B
  $AEB2  0D 52 A9  ORA $A952
  $AEB5  56 C8     LSR $C8,X
  $AEB7  31 F4     AND ($F4),Y

L_AEB9:
  $AEB9  1B        .db $1B
  $AEBA  F2        .db $F2
  $AEBB  AD 56 A9  LDA $A956
  $AEBE  37        .db $37
  $AEBF  CE 5B BD  DEC $BD5B
  $AEC2  F7        .db $F7
  $AEC3  FF        .db $FF
  $AEC4  57        .db $57
  $AEC5  B2        .db $B2
  $AEC6  04        .db $04
  $AEC7  E9 84     SBC #$84
  $AEC9  40        RTI
  $AECA  08        PHP
  $AECB  00        BRK
  $AECC  88        DEY
  $AECD  44        .db $44
  $AECE  79 16 14  ADC $1416,Y
  $AED1  91 20     STA ($20),Y
  $AED3  22        .db $22
  $AED4  08        PHP
  $AED5  82        .db $82
  $AED6  10 44     BPL $AF1C
  $AED8  EB        .db $EB
  $AED9  6E DF DD  ROR $DDDF
  $AEDC  F7        .db $F7
  $AEDD  7D EF BB  ADC $BBEF,X
  $AEE0  6A        ROR
  $AEE1  FF        .db $FF
  $AEE2  BB        .db $BB
  $AEE3  B9 80 C0  LDA $C080,Y
  $AEE6  0D EA 84  ORA $84EA
  $AEE9  00        BRK
  $AEEA  44        .db $44
  $AEEB  42        .db $42
  $AEEC  2D 3F D2  AND $D23F
  $AEEF  15 50     ORA $50,X
  $AEF1  04        .db $04
  $AEF2  29 49     AND #$49
  $AEF4  40        RTI
  $AEF5  8A        TXA
  $AEF6  10 81     BPL $AE79
  $AEF8  AF        .db $AF
  $AEF9  FB        .db $FB

L_AEFA:
  $AEFA  D6 B6     DEC $B6,X
  $AEFC  BF        .db $BF
  $AEFD  75 EF     ADC $EF,X
  $AEFF  7E EE F2  ROR $F2EE,X
  $AF02  28        PLP
  $AF03  55 40     EOR $40,X
  $AF05  94 45     STY $45,X
  $AF07  8A        TXA
  $AF08  10 09     BPL $AF13
  $AF0A  47        .db $47
  $AF0B  AA        TAX
  $AF0C  BF        .db $BF
  $AF0D  6B        .db $6B
  $AF0E  BA        TSX
  $AF0F  75 04     ADC $04,X
  $AF11  91 20     STA ($20),Y

L_AF13:
  $AF13  22        .db $22
  $AF14  08        PHP
  $AF15  82        .db $82
  $AF16  10 44     BPL $AF5C
  $AF18  FB        .db $FB
  $AF19  6E DF DD  ROR $DDDF

L_AF1C:
  $AF1C  F7        .db $F7
  $AF1D  7D EF BB  ADC $BBEF,X
  $AF20  DA        .db $DA
  $AF21  54        .db $54
  $AF22  2B        .db $2B
  $AF23  29 CA     AND #$CA
  $AF25  A2 54     LDX #$54
  $AF27  A9 01     LDA #$01
  $AF29  2B        .db $2B
  $AF2A  D4        .db $D4
  $AF2B  D6 35     DEC $35,X
  $AF2D  5D AB 56  EOR $56AB,X
  $AF30  40        RTI
  $AF31  04        .db $04
  $AF32  29 49     AND #$49
  $AF34  40        RTI
  $AF35  8A        TXA
  $AF36  10 81     BPL $AEB9
  $AF38  BF        .db $BF
  $AF39  FB        .db $FB
  $AF3A  D6 B6     DEC $B6,X
  $AF3C  BF        .db $BF
  $AF3D  75 EF     ADC $EF,X
  $AF3F  7E EB BF  ROR $BFEB,X
  $AF42  EE FF F7  INC $F7FF
  $AF45  FF        .db $FF
  $AF46  FF        .db $FF
  $AF47  FF        .db $FF
  $AF48  14        .db $14
  $AF49  40        RTI
  $AF4A  11 00     ORA ($00),Y
  $AF4C  08        PHP
  $AF4D  00        BRK
  $AF4E  00        BRK
  $AF4F  00        BRK
  $AF50  FF        .db $FF
  $AF51  FF        .db $FF
  $AF52  FF        .db $FF
  $AF53  FF        .db $FF
  $AF54  FF        .db $FF
  $AF55  FF        .db $FF
  $AF56  FF        .db $FF
  $AF57  FF        .db $FF
  $AF58  00        BRK
  $AF59  00        BRK
  $AF5A  00        BRK
  $AF5B  00        BRK

L_AF5C:
  $AF5C  00        BRK
  $AF5D  00        BRK
  $AF5E  00        BRK
  $AF5F  00        BRK
  $AF60  FF        .db $FF
  $AF61  FF        .db $FF
  $AF62  FF        .db $FF
  $AF63  FF        .db $FF
  $AF64  FF        .db $FF
  $AF65  FF        .db $FF
  $AF66  FF        .db $FF
  $AF67  FF        .db $FF
  $AF68  00        BRK
  $AF69  00        BRK
  $AF6A  00        BRK
  $AF6B  00        BRK
  $AF6C  00        BRK
  $AF6D  00        BRK
  $AF6E  00        BRK
  $AF6F  00        BRK
  $AF70  FF        .db $FF
  $AF71  FF        .db $FF
  $AF72  FF        .db $FF
  $AF73  FF        .db $FF
  $AF74  E4 F4     CPX $F4
  $AF76  D3        .db $D3
  $AF77  AD 00 00  LDA $0000
  $AF7A  00        BRK
  $AF7B  00        BRK
  $AF7C  11 0B     ORA ($0B),Y
  $AF7E  24 52     BIT $52
  $AF80  FF        .db $FF
  $AF81  FF        .db $FF
  $AF82  FF        .db $FF
  $AF83  FF        .db $FF
  $AF84  FF        .db $FF
  $AF85  FF        .db $FF
  $AF86  FF        .db $FF
  $AF87  FE 00 00  INC $0000,X
  $AF8A  00        BRK
  $AF8B  00        BRK
  $AF8C  00        BRK
  $AF8D  00        BRK
  $AF8E  00        BRK
  $AF8F  00        BRK
  $AF90  FB        .db $FB
  $AF91  FC        .db $FC
  $AF92  B3        .db $B3
  $AF93  E0 A2     CPX #$A2
  $AF95  50 20     BVC $AFB7
  $AF97  28        PLP
  $AF98  00        BRK
  $AF99  02        .db $02
  $AF9A  08        PHP
  $AF9B  0F        .db $0F
  $AF9C  15 AF     ORA $AF,X
  $AF9E  DF        .db $DF
  $AF9F  57        .db $57
  $AFA0  FF        .db $FF
  $AFA1  FF        .db $FF
  $AFA2  FF        .db $FF
  $AFA3  FA        .db $FA
  $AFA4  E9 F5     SBC #$F5
  $AFA6  EA        NOP
  $AFA7  D5 00     CMP $00,X
  $AFA9  00        BRK
  $AFAA  00        BRK
  $AFAB  05 02     ORA $02
  $AFAD  0A        ASL
  $AFAE  05 0A     ORA $0A
  $AFB0  12        .db $12
  $AFB1  48        PHA
  $AFB2  25 89     AND $89
  $AFB4  2A        ROL
  $AFB5  44        .db $44
  $AFB6  20 82 ED  JSR $ED82
  $AFB9  97        .db $97
  $AFBA  5A        .db $5A
  $AFBB  76 D5     ROR $D5,X
  $AFBD  BB        .db $BB
  $AFBE  DF        .db $DF
  $AFBF  7D FF F3  ADC $F3FF,X
  $AFC2  0F        .db $0F
  $AFC3  80        .db $80
  $AFC4  03        .db $03
  $AFC5  02        .db $02
  $AFC6  04        .db $04
  $AFC7  20 00 08  JSR $0800
  $AFCA  D0 32     BNE $AFFE
  $AFCC  5C        .db $5C
  $AFCD  F5 BB     SBC $BB,X
  $AFCF  CF        .db $CF
  $AFD0  95 91     STA $91,X
  $AFD2  22        .db $22
  $AFD3  22        .db $22
  $AFD4  08        PHP
  $AFD5  82        .db $82
  $AFD6  10 44     BPL $B01C
  $AFD8  6A        ROR
  $AFD9  6E DD DD  ROR $DDDD
  $AFDC  F7        .db $F7
  $AFDD  7D EF BB  ADC $BBEF,X
  $AFE0  E8        INX
  $AFE1  A4 93     LDY $93
  $AFE3  AC 11 4A  LDY $4A11
  $AFE6  49 94     EOR #$94
  $AFE8  02        .db $02
  $AFE9  19 4C 53  ORA $534C,Y
  $AFEC  AE B5 B6  LDX $B6B5
  $AFEF  6B        .db $6B
  $AFF0  50 04     BVC $AFF6
  $AFF2  29 09     AND #$09
  $AFF4  40        RTI
  $AFF5  8A        TXA

L_AFF6:
  $AFF6  10 85     BPL $AF7D
  $AFF8  AF        .db $AF
  $AFF9  FB        .db $FB
  $AFFA  D6 F6     DEC $F6,X
  $AFFC  BF        .db $BF
  $AFFD  75 EF     ADC $EF,X
  $AFFF  7A        .db $7A
  $B000  00        BRK
  $B001  00        BRK
  $B002  00        BRK
  $B003  00        BRK
  $B004  00        BRK
  $B005  00        BRK
  $B006  00        BRK
  $B007  01 00     ORA ($00,X)
  $B009  00        BRK
  $B00A  00        BRK
  $B00B  00        BRK
  $B00C  00        BRK
  $B00D  00        BRK
  $B00E  00        BRK
  $B00F  00        BRK
  $B010  00        BRK
  $B011  00        BRK
  $B012  00        BRK
  $B013  00        BRK
  $B014  00        BRK
  $B015  00        BRK
  $B016  1F        .db $1F
  $B017  FF        .db $FF
  $B018  00        BRK
  $B019  00        BRK
  $B01A  00        BRK
  $B01B  00        BRK

L_B01C:
  $B01C  00        BRK
  $B01D  00        BRK
  $B01E  00        BRK
  $B01F  00        BRK
  $B020  00        BRK
  $B021  00        BRK
  $B022  00        BRK
  $B023  00        BRK
  $B024  07        .db $07
  $B025  FF        .db $FF
  $B026  FE FE 00  INC $00FE,X
  $B029  00        BRK
  $B02A  00        BRK
  $B02B  00        BRK
  $B02C  00        BRK
  $B02D  00        BRK
  $B02E  00        BRK
  $B02F  00        BRK

L_B030:
  $B030  00        BRK
  $B031  00        BRK
  $B032  00        BRK
  $B033  00        BRK
  $B034  08        PHP
  $B035  08        PHP
  $B036  10 10     BPL $B048
  $B038  00        BRK
  $B039  00        BRK
  $B03A  00        BRK
  $B03B  00        BRK
  $B03C  78        SEI
  $B03D  78        SEI
  $B03E  F0 F0     BEQ $B030
  $B040  00        BRK
  $B041  00        BRK
  $B042  06 02     ASL $02
  $B044  06 01     ASL $01
  $B046  01 03     ORA ($03,X)

L_B048:
  $B048  00        BRK
  $B049  00        BRK
  $B04A  06 0E     ASL $0E
  $B04C  06 00     ASL $00
  $B04E  00        BRK
  $B04F  00        BRK
  $B050  1F        .db $1F
  $B051  FF        .db $FF
  $B052  FF        .db $FF
  $B053  FF        .db $FF
  $B054  FF        .db $FF
  $B055  FF        .db $FF
  $B056  FF        .db $FF
  $B057  FF        .db $FF
  $B058  00        BRK
  $B059  00        BRK
  $B05A  00        BRK
  $B05B  00        BRK
  $B05C  00        BRK
  $B05D  00        BRK
  $B05E  00        BRK
  $B05F  00        BRK
  $B060  FF        .db $FF
  $B061  FF        .db $FF
  $B062  FF        .db $FF
  $B063  FF        .db $FF
  $B064  FF        .db $FF
  $B065  FF        .db $FF

L_B066:
  $B066  FF        .db $FF
  $B067  FF        .db $FF
  $B068  00        BRK
  $B069  00        BRK
  $B06A  00        BRK
  $B06B  00        BRK
  $B06C  00        BRK
  $B06D  00        BRK
  $B06E  00        BRK
  $B06F  00        BRK
  $B070  FC        .db $FC
  $B071  FC        .db $FC
  $B072  F8        SED
  $B073  F8        SED
  $B074  F0 F0     BEQ $B066
  $B076  E1 E1     SBC ($E1,X)
  $B078  01 01     ORA ($01,X)
  $B07A  03        .db $03
  $B07B  03        .db $03
  $B07C  07        .db $07
  $B07D  07        .db $07
  $B07E  0F        .db $0F
  $B07F  0F        .db $0F

L_B080:
  $B080  20 20 40  JSR $4020
  $B083  40        RTI
  $B084  80        .db $80
  $B085  80        .db $80
  $B086  00        BRK
  $B087  00        BRK
  $B088  E0 E0     CPX #$E0
  $B08A  C0 C0     CPY #$C0
  $B08C  80        .db $80
  $B08D  80        .db $80
  $B08E  00        BRK
  $B08F  00        BRK
  $B090  03        .db $03
  $B091  07        .db $07
  $B092  07        .db $07
  $B093  0F        .db $0F
  $B094  0F        .db $0F
  $B095  1F        .db $1F
  $B096  1F        .db $1F
  $B097  32        .db $32
  $B098  00        BRK
  $B099  00        BRK
  $B09A  00        BRK
  $B09B  00        BRK
  $B09C  00        BRK
  $B09D  00        BRK
  $B09E  00        BRK
  $B09F  00        BRK
  $B0A0  FF        .db $FF
  $B0A1  FF        .db $FF
  $B0A2  FF        .db $FF
  $B0A3  FF        .db $FF
  $B0A4  FF        .db $FF
  $B0A5  FF        .db $FF
  $B0A6  FF        .db $FF
  $B0A7  3C        .db $3C
  $B0A8  00        BRK
  $B0A9  00        BRK
  $B0AA  00        BRK
  $B0AB  00        BRK
  $B0AC  00        BRK
  $B0AD  00        BRK
  $B0AE  00        BRK
  $B0AF  00        BRK
  $B0B0  FF        .db $FF
  $B0B1  FF        .db $FF
  $B0B2  FF        .db $FF
  $B0B3  FF        .db $FF
  $B0B4  FF        .db $FF
  $B0B5  FF        .db $FF
  $B0B6  FE FE 00  INC $00FE,X
  $B0B9  00        BRK
  $B0BA  00        BRK
  $B0BB  00        BRK
  $B0BC  00        BRK
  $B0BD  00        BRK
  $B0BE  00        BRK
  $B0BF  00        BRK
  $B0C0  C2        .db $C2
  $B0C1  C2        .db $C2
  $B0C2  85 84     STA $84
  $B0C4  0A        ASL
  $B0C5  0A        ASL
  $B0C6  13        .db $13
  $B0C7  10 1E     BPL $B0E7
  $B0C9  1E 3D 3D  ASL $3D3D,X
  $B0CC  7B        .db $7B
  $B0CD  7B        .db $7B
  $B0CE  F3        .db $F3
  $B0CF  F0 00     BEQ $B0D1

L_B0D1:
  $B0D1  00        BRK
  $B0D2  60        RTS
  $B0D3  7C        .db $7C
  $B0D4  07        .db $07
  $B0D5  01 80     ORA ($80,X)
  $B0D7  10 00     BPL $B0D9

L_B0D9:
  $B0D9  F0 9E     BEQ $B079
  $B0DB  83        .db $83
  $B0DC  F8        SED
  $B0DD  FE FF 1F  INC $1FFF,X
  $B0E0  00        BRK
  $B0E1  00        BRK
  $B0E2  00        BRK
  $B0E3  00        BRK
  $B0E4  00        BRK
  $B0E5  C0 C0     CPY #$C0

L_B0E7:
  $B0E7  60        RTS
  $B0E8  00        BRK
  $B0E9  00        BRK
  $B0EA  00        BRK
  $B0EB  80        .db $80
  $B0EC  C0 20     CPY #$20
  $B0EE  30 90     BMI $B080
  $B0F0  00        BRK
  $B0F1  3F        .db $3F
  $B0F2  00        BRK
  $B0F3  09 19     ORA #$19
  $B0F5  09 00     ORA #$00
  $B0F7  00        BRK
  $B0F8  00        BRK
  $B0F9  40        RTI
  $B0FA  00        BRK
  $B0FB  54        .db $54
  $B0FC  44        .db $44
  $B0FD  54        .db $54
  $B0FE  5D 00 00  EOR $0000,X
  $B101  FF        .db $FF
  $B102  00        BRK
  $B103  CE CE CE  DEC $CECE
  $B106  00        BRK
  $B107  00        BRK
  $B108  00        BRK
  $B109  00        BRK
  $B10A  00        BRK
  $B10B  21 21     AND ($21,X)
  $B10D  21 EF     AND ($EF,X)
  $B10F  00        BRK
  $B110  00        BRK
  $B111  FF        .db $FF
  $B112  00        BRK
  $B113  72        .db $72
  $B114  72        .db $72
  $B115  72        .db $72
  $B116  00        BRK
  $B117  00        BRK
  $B118  00        BRK
  $B119  00        BRK
  $B11A  00        BRK
  $B11B  09 09     ORA #$09
  $B11D  09 7B     ORA #$7B
  $B11F  00        BRK
  $B120  00        BRK
  $B121  00        BRK
  $B122  00        BRK
  $B123  00        BRK
  $B124  00        BRK
  $B125  00        BRK
  $B126  00        BRK
  $B127  00        BRK
  $B128  00        BRK
  $B129  FF        .db $FF
  $B12A  00        BRK
  $B12B  DE DE DE  DEC $DEDE,X
  $B12E  DE 00 00  DEC $0000,X
  $B131  3E 00 19  ROL $1900,X
  $B134  1B        .db $1B
  $B135  27        .db $27

L_B136:
  $B136  4F        .db $4F
  $B137  3F        .db $3F
  $B138  00        BRK
  $B139  FE 00 F8  INC $F800,X
  $B13C  F8        SED
  $B13D  E0 C0     CPX #$C0
  $B13F  00        BRK
  $B140  70 71     BVS $B1B3
  $B142  F1 F0     SBC ($F0),Y
  $B144  F0 F0     BEQ $B136
  $B146  F0 F3     BEQ $B13B
  $B148  00        BRK
  $B149  00        BRK
  $B14A  00        BRK
  $B14B  00        BRK
  $B14C  00        BRK
  $B14D  00        BRK
  $B14E  00        BRK
  $B14F  00        BRK
  $B150  08        PHP
  $B151  F1 20     SBC ($20),Y
  $B153  04        .db $04
  $B154  0C        .db $0C
  $B155  1C        .db $1C

L_B156:
  $B156  3C        .db $3C
  $B157  79 00 00  ADC $0000,Y
  $B15A  00        BRK
  $B15B  00        BRK
  $B15C  00        BRK
  $B15D  00        BRK
  $B15E  00        BRK
  $B15F  00        BRK
  $B160  FC        .db $FC
  $B161  FC        .db $FC
  $B162  F8        SED
  $B163  F8        SED
  $B164  F0 F0     BEQ $B156
  $B166  E1 E1     SBC ($E1,X)
  $B168  01 01     ORA ($01,X)
  $B16A  03        .db $03
  $B16B  03        .db $03
  $B16C  07        .db $07
  $B16D  07        .db $07
  $B16E  0F        .db $0F
  $B16F  0F        .db $0F
  $B170  20 20 40  JSR $4020
  $B173  40        RTI
  $B174  80        .db $80
  $B175  80        .db $80
  $B176  18        CLC
  $B177  08        PHP
  $B178  E0 E0     CPX #$E0
  $B17A  C0 C0     CPY #$C0
  $B17C  80        .db $80
  $B17D  80        .db $80
  $B17E  78        SEI
  $B17F  78        SEI
  $B180  04        .db $04
  $B181  02        .db $02
  $B182  01 00     ORA ($00,X)
  $B184  00        BRK
  $B185  00        BRK
  $B186  00        BRK
  $B187  00        BRK
  $B188  07        .db $07
  $B189  03        .db $03
  $B18A  01 00     ORA ($00,X)
  $B18C  00        BRK
  $B18D  00        BRK
  $B18E  00        BRK
  $B18F  00        BRK
  $B190  20 30 10  JSR $1030
  $B193  10 98     BPL $B12D
  $B195  88        DEY
  $B196  88        DEY
  $B197  88        DEY
  $B198  D8        CLD
  $B199  C8        INY
  $B19A  E8        INX
  $B19B  EC E4 F4  CPX $F4E4
  $B19E  F4        .db $F4
  $B19F  F4        .db $F4
  $B1A0  00        BRK
  $B1A1  00        BRK
  $B1A2  01 03     ORA ($03,X)
  $B1A4  07        .db $07
  $B1A5  07        .db $07
  $B1A6  0F        .db $0F
  $B1A7  1F        .db $1F
  $B1A8  00        BRK
  $B1A9  00        BRK
  $B1AA  00        BRK
  $B1AB  00        BRK
  $B1AC  00        BRK
  $B1AD  00        BRK
  $B1AE  01 00     ORA ($00,X)
  $B1B0  3C        .db $3C
  $B1B1  FF        .db $FF
  $B1B2  FF        .db $FF

L_B1B3:
  $B1B3  FF        .db $FF
  $B1B4  FF        .db $FF
  $B1B5  FF        .db $FF
  $B1B6  FF        .db $FF
  $B1B7  FF        .db $FF
  $B1B8  00        BRK
  $B1B9  00        BRK
  $B1BA  1F        .db $1F
  $B1BB  3F        .db $3F
  $B1BC  1F        .db $1F
  $B1BD  FC        .db $FC
  $B1BE  FC        .db $FC
  $B1BF  FE 71 FF  INC $FF71,X
  $B1C2  FF        .db $FF
  $B1C3  FF        .db $FF
  $B1C4  FF        .db $FF
  $B1C5  FF        .db $FF
  $B1C6  FF        .db $FF
  $B1C7  FF        .db $FF
  $B1C8  00        BRK
  $B1C9  00        BRK
  $B1CA  80        .db $80
  $B1CB  80        .db $80
  $B1CC  80        .db $80
  $B1CD  00        BRK
  $B1CE  00        BRK
  $B1CF  00        BRK
  $B1D0  C7        .db $C7
  $B1D1  FF        .db $FF
  $B1D2  FF        .db $FF
  $B1D3  FF        .db $FF
  $B1D4  FF        .db $FF
  $B1D5  FF        .db $FF
  $B1D6  FF        .db $FF
  $B1D7  FF        .db $FF
  $B1D8  00        BRK
  $B1D9  00        BRK
  $B1DA  00        BRK
  $B1DB  00        BRK
  $B1DC  00        BRK
  $B1DD  00        BRK
  $B1DE  00        BRK
  $B1DF  00        BRK
  $B1E0  1C        .db $1C
  $B1E1  FF        .db $FF
  $B1E2  FF        .db $FF
  $B1E3  FF        .db $FF
  $B1E4  FF        .db $FF
  $B1E5  FF        .db $FF
  $B1E6  FF        .db $FF
  $B1E7  F0 00     BEQ $B1E9

L_B1E9:
  $B1E9  00        BRK
  $B1EA  00        BRK
  $B1EB  00        BRK
  $B1EC  00        BRK
  $B1ED  00        BRK
  $B1EE  00        BRK
  $B1EF  00        BRK
  $B1F0  7F        .db $7F
  $B1F1  FF        .db $FF
  $B1F2  FF        .db $FF
  $B1F3  FF        .db $FF
  $B1F4  FF        .db $FF
  $B1F5  FF        .db $FF
  $B1F6  FF        .db $FF
  $B1F7  07        .db $07
  $B1F8  00        BRK
  $B1F9  00        BRK
  $B1FA  00        BRK
  $B1FB  00        BRK
  $B1FC  00        BRK
  $B1FD  00        BRK
  $B1FE  00        BRK
  $B1FF  00        BRK
  $B200  F9 F8 FE  SBC $FEF8,Y
  $B203  FF        .db $FF
  $B204  FF        .db $FF
  $B205  FF        .db $FF
  $B206  FF        .db $FF
  $B207  FF        .db $FF
  $B208  00        BRK
  $B209  00        BRK
  $B20A  00        BRK
  $B20B  00        BRK
  $B20C  00        BRK
  $B20D  00        BRK
  $B20E  00        BRK
  $B20F  00        BRK
  $B210  F1 03     SBC ($03),Y
  $B212  0F        .db $0F
  $B213  FF        .db $FF
  $B214  FE FC F0  INC $F0FC,X
  $B217  E0 00     CPX #$00
  $B219  00        BRK
  $B21A  00        BRK
  $B21B  00        BRK
  $B21C  00        BRK
  $B21D  00        BRK
  $B21E  00        BRK
  $B21F  00        BRK
  $B220  82        .db $82
  $B221  04        .db $04
  $B222  09 31     ORA #$31
  $B224  00        BRK
  $B225  1F        .db $1F
  $B226  6A        ROR
  $B227  D5 9E     CMP $9E,X
  $B229  7C        .db $7C
  $B22A  79 71 00  ADC $0071,Y
  $B22D  1F        .db $1F
  $B22E  7F        .db $7F
  $B22F  FF        .db $FF
  $B230  08        PHP

L_B231:
  $B231  09 58     ORA #$58
  $B233  FA        .db $FA
  $B234  00        BRK
  $B235  FF        .db $FF
  $B236  AA        TAX
  $B237  55 C8     EOR $C8,X
  $B239  C9 F8     CMP #$F8
  $B23B  FB        .db $FB
  $B23C  00        BRK
  $B23D  FF        .db $FF
  $B23E  FF        .db $FF
  $B23F  FF        .db $FF
  $B240  00        BRK
  $B241  C0 03     CPY #$03
  $B243  EB        .db $EB
  $B244  00        BRK
  $B245  FF        .db $FF
  $B246  AA        TAX
  $B247  55 00     EOR $00,X
  $B249  40        RTI
  $B24A  03        .db $03
  $B24B  1B        .db $1B
  $B24C  00        BRK
  $B24D  FF        .db $FF
  $B24E  FF        .db $FF
  $B24F  FF        .db $FF
  $B250  FC        .db $FC
  $B251  00        BRK
  $B252  7F        .db $7F
  $B253  01 00     ORA ($00,X)
  $B255  FE AE 56  INC $56AE,X
  $B258  FC        .db $FC
  $B259  00        BRK
  $B25A  81 FF     STA ($FF,X)
  $B25C  00        BRK
  $B25D  FE FE FE  INC $FEFE,X
  $B260  00        BRK
  $B261  00        BRK
  $B262  00        BRK
  $B263  00        BRK
  $B264  00        BRK
  $B265  00        BRK
  $B266  02        .db $02
  $B267  3C        .db $3C
  $B268  00        BRK
  $B269  00        BRK
  $B26A  00        BRK
  $B26B  00        BRK
  $B26C  00        BRK
  $B26D  00        BRK
  $B26E  7E 42 0F  ROR $0F42,X
  $B271  07        .db $07
  $B272  03        .db $03
  $B273  03        .db $03
  $B274  01 01     ORA ($01,X)
  $B276  00        BRK
  $B277  00        BRK
  $B278  61 73     ADC ($73,X)
  $B27A  3B        .db $3B
  $B27B  19 0C 0C  ORA $0C0C,Y
  $B27E  06 06     ASL $06
  $B280  FF        .db $FF
  $B281  FF        .db $FF
  $B282  FF        .db $FF
  $B283  FF        .db $FF
  $B284  FF        .db $FF
  $B285  FF        .db $FF
  $B286  FF        .db $FF
  $B287  FF        .db $FF
  $B288  FE F0 C0  INC $C0F0,X
  $B28B  C0 80     CPY #$80
  $B28D  80        .db $80
  $B28E  00        BRK
  $B28F  00        BRK
  $B290  FF        .db $FF
  $B291  FF        .db $FF
  $B292  FF        .db $FF
  $B293  FF        .db $FF
  $B294  FF        .db $FF
  $B295  FF        .db $FF
  $B296  FF        .db $FF
  $B297  FF        .db $FF
  $B298  00        BRK
  $B299  00        BRK
  $B29A  00        BRK
  $B29B  00        BRK
  $B29C  00        BRK
  $B29D  00        BRK
  $B29E  00        BRK
  $B29F  00        BRK
  $B2A0  FF        .db $FF
  $B2A1  FE FC F8  INC $F8FC,X
  $B2A4  F1 E1     SBC ($E1),Y
  $B2A6  C0 8C     CPY #$8C
  $B2A8  00        BRK
  $B2A9  00        BRK
  $B2AA  01 03     ORA ($03,X)
  $B2AC  02        .db $02
  $B2AD  00        BRK
  $B2AE  18        CLC
  $B2AF  30 80     BMI $B231
  $B2B1  00        BRK
  $B2B2  0E 7E FE  ASL $FE7E
  $B2B5  FE FE 7E  INC $7EFE,X
  $B2B8  0E 7E F0  ASL $F07E
  $B2BB  80        .db $80
  $B2BC  00        BRK
  $B2BD  00        BRK
  $B2BE  00        BRK
  $B2BF  00        BRK
  $B2C0  00        BRK
  $B2C1  00        BRK
  $B2C2  70 7E     BVS $B342
  $B2C4  7F        .db $7F
  $B2C5  7F        .db $7F
  $B2C6  7F        .db $7F
  $B2C7  7E 70 7E  ROR $7E70,X
  $B2CA  0F        .db $0F
  $B2CB  01 00     ORA ($00,X)
  $B2CD  00        BRK
  $B2CE  00        BRK
  $B2CF  00        BRK
  $B2D0  FF        .db $FF
  $B2D1  3F        .db $3F
  $B2D2  1F        .db $1F
  $B2D3  0F        .db $0F
  $B2D4  86 80     STX $80
  $B2D6  00        BRK
  $B2D7  30 00     BMI $B2D9

L_B2D9:
  $B2D9  00        BRK
  $B2DA  80        .db $80
  $B2DB  C0 40     CPY #$40
  $B2DD  00        BRK
  $B2DE  18        CLC
  $B2DF  0C        .db $0C
  $B2E0  C3        .db $C3
  $B2E1  87        .db $87
  $B2E2  00        BRK
  $B2E3  7F        .db $7F
  $B2E4  00        BRK
  $B2E5  3F        .db $3F
  $B2E6  70 E0     BVS $B2C8
  $B2E8  03        .db $03
  $B2E9  07        .db $07
  $B2EA  00        BRK
  $B2EB  00        BRK
  $B2EC  00        BRK
  $B2ED  3F        .db $3F
  $B2EE  7F        .db $7F
  $B2EF  FF        .db $FF
  $B2F0  80        .db $80
  $B2F1  00        BRK
  $B2F2  0A        ASL
  $B2F3  15 3F     ORA $3F,X
  $B2F5  FF        .db $FF
  $B2F6  AA        TAX
  $B2F7  55 FF     EOR $FF,X
  $B2F9  FF        .db $FF
  $B2FA  35 2A     AND $2A,X
  $B2FC  00        BRK
  $B2FD  00        BRK
  $B2FE  55 AA     EOR $AA,X
  $B300  00        BRK
  $B301  00        BRK
  $B302  AA        TAX
  $B303  55 FF     EOR $FF,X
  $B305  FF        .db $FF
  $B306  AA        TAX
  $B307  55 FF     EOR $FF,X
  $B309  FF        .db $FF
  $B30A  55 AA     EOR $AA,X
  $B30C  00        BRK
  $B30D  00        BRK
  $B30E  55 AA     EOR $AA,X
  $B310  00        BRK
  $B311  00        BRK
  $B312  AA        TAX
  $B313  55 FF     EOR $FF,X
  $B315  FF        .db $FF
  $B316  AA        TAX
  $B317  55 FF     EOR $FF,X
  $B319  FF        .db $FF
  $B31A  55 AA     EOR $AA,X
  $B31C  00        BRK
  $B31D  00        BRK
  $B31E  55 AA     EOR $AA,X
  $B320  06 02     ASL $02
  $B322  AA        TAX
  $B323  52        .db $52
  $B324  FE FE AA  INC $AAFE,X
  $B327  56 FE     LSR $FE,X
  $B329  FE 56 AE  INC $AE56,X
  $B32C  02        .db $02
  $B32D  02        .db $02
  $B32E  56 AA     LSR $AA,X
  $B330  00        BRK
  $B331  3E 3E 00  ROL $003E,X
  $B334  00        BRK
  $B335  3E 3E 3C  ROL $3C3E,X
  $B338  00        BRK
  $B339  40        RTI
  $B33A  40        RTI
  $B33B  7E 00 40  ROR $4000,X
  $B33E  40        RTI
  $B33F  42        .db $42
  $B340  00        BRK
  $B341  00        BRK

L_B342:
  $B342  00        BRK
  $B343  00        BRK
  $B344  00        BRK
  $B345  00        BRK
  $B346  00        BRK
  $B347  00        BRK
  $B348  06 03     ASL $03
  $B34A  03        .db $03
  $B34B  03        .db $03
  $B34C  03        .db $03
  $B34D  03        .db $03
  $B34E  03        .db $03
  $B34F  03        .db $03
  $B350  FF        .db $FF
  $B351  7F        .db $7F
  $B352  7F        .db $7F
  $B353  7F        .db $7F
  $B354  7F        .db $7F
  $B355  79 79 7F  ADC $7F79,Y
  $B358  00        BRK
  $B359  00        BRK
  $B35A  00        BRK
  $B35B  00        BRK
  $B35C  00        BRK
  $B35D  04        .db $04
  $B35E  00        BRK
  $B35F  00        BRK
  $B360  FF        .db $FF
  $B361  FF        .db $FF
  $B362  FF        .db $FF
  $B363  FF        .db $FF
  $B364  FE FE FE  INC $FEFE,X
  $B367  FE 00 00  INC $0000,X
  $B36A  00        BRK
  $B36B  00        BRK
  $B36C  00        BRK
  $B36D  00        BRK
  $B36E  00        BRK
  $B36F  00        BRK
  $B370  8E 1F 1F  STX $1F1F
  $B373  1F        .db $1F
  $B374  3F        .db $3F
  $B375  3F        .db $3F
  $B376  3F        .db $3F
  $B377  00        BRK
  $B378  30 60     BMI $B3DA
  $B37A  60        RTS
  $B37B  60        RTS
  $B37C  C0 C0     CPY #$C0
  $B37E  C0 00     CPY #$00
  $B380  38        SEC
  $B381  00        BRK
  $B382  80        .db $80
  $B383  80        .db $80
  $B384  80        .db $80
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
  $B390  1C        .db $1C
  $B391  00        BRK
  $B392  01 01     ORA ($01,X)
  $B394  01 00     ORA ($00,X)
  $B396  00        BRK
  $B397  00        BRK
  $B398  00        BRK
  $B399  00        BRK

L_B39A:
  $B39A  00        BRK
  $B39B  00        BRK
  $B39C  00        BRK
  $B39D  00        BRK
  $B39E  00        BRK
  $B39F  00        BRK
  $B3A0  70 F8     BVS $B39A
  $B3A2  F8        SED
  $B3A3  F8        SED
  $B3A4  FC        .db $FC
  $B3A5  FC        .db $FC
  $B3A6  FC        .db $FC
  $B3A7  00        BRK
  $B3A8  0C        .db $0C
  $B3A9  06 06     ASL $06
  $B3AB  06 03     ASL $03
  $B3AD  03        .db $03
  $B3AE  03        .db $03
  $B3AF  00        BRK
  $B3B0  E0 E0     CPX #$E0
  $B3B2  C0 C0     CPY #$C0
  $B3B4  40        RTI
  $B3B5  6A        ROR
  $B3B6  00        BRK
  $B3B7  30 FF     BMI $B3B8
  $B3B9  FF        .db $FF
  $B3BA  FF        .db $FF
  $B3BB  FF        .db $FF
  $B3BC  7F        .db $7F
  $B3BD  7F        .db $7F
  $B3BE  00        BRK
  $B3BF  3F        .db $3F
  $B3C0  00        BRK
  $B3C1  00        BRK
  $B3C2  00        BRK
  $B3C3  00        BRK
  $B3C4  00        BRK
  $B3C5  AA        TAX
  $B3C6  05 0B     ORA $0B
  $B3C8  FF        .db $FF
  $B3C9  FF        .db $FF
  $B3CA  FF        .db $FF
  $B3CB  FF        .db $FF
  $B3CC  FF        .db $FF
  $B3CD  FF        .db $FF
  $B3CE  07        .db $07
  $B3CF  FB        .db $FB
  $B3D0  00        BRK
  $B3D1  00        BRK
  $B3D2  00        BRK
  $B3D3  00        BRK
  $B3D4  00        BRK
  $B3D5  AA        TAX
  $B3D6  55 FF     EOR $FF,X
  $B3D8  FF        .db $FF
  $B3D9  FF        .db $FF

L_B3DA:
  $B3DA  FF        .db $FF
  $B3DB  FF        .db $FF
  $B3DC  FF        .db $FF
  $B3DD  FF        .db $FF
  $B3DE  FF        .db $FF
  $B3DF  FF        .db $FF
  $B3E0  00        BRK
  $B3E1  00        BRK
  $B3E2  00        BRK
  $B3E3  00        BRK
  $B3E4  00        BRK
  $B3E5  AA        TAX
  $B3E6  55 FF     EOR $FF,X
  $B3E8  FF        .db $FF
  $B3E9  FF        .db $FF
  $B3EA  FF        .db $FF
  $B3EB  FF        .db $FF
  $B3EC  FF        .db $FF
  $B3ED  FF        .db $FF
  $B3EE  FF        .db $FF
  $B3EF  FF        .db $FF
  $B3F0  02        .db $02
  $B3F1  02        .db $02
  $B3F2  02        .db $02
  $B3F3  02        .db $02
  $B3F4  02        .db $02
  $B3F5  AA        TAX
  $B3F6  56 FE     LSR $FE,X
  $B3F8  FE FE FE  INC $FEFE,X
  $B3FB  FE FE FE  INC $FEFE,X
  $B3FE  FE FE 00  INC $00FE,X
  $B401  00        BRK
  $B402  00        BRK
  $B403  00        BRK
  $B404  3E 3E 00  ROL $003E,X
  $B407  02        .db $02
  $B408  7E 7E 00  ROR $007E,X
  $B40B  7E 40 40  ROR $4040,X
  $B40E  7E 7E 00  ROR $007E,X
  $B411  00        BRK
  $B412  00        BRK
  $B413  01 01     ORA ($01,X)
  $B415  03        .db $03
  $B416  03        .db $03
  $B417  07        .db $07
  $B418  06 06     ASL $06
  $B41A  06 0C     ASL $0C
  $B41C  0C        .db $0C
  $B41D  18        CLC
  $B41E  18        CLC
  $B41F  30 FF     BMI $B420
  $B421  FF        .db $FF
  $B422  FF        .db $FF
  $B423  FF        .db $FF
  $B424  F9 F9 FF  SBC $FFF9,Y
  $B427  FF        .db $FF
  $B428  00        BRK
  $B429  00        BRK
  $B42A  00        BRK
  $B42B  00        BRK
  $B42C  04        .db $04
  $B42D  00        BRK
  $B42E  00        BRK
  $B42F  00        BRK
  $B430  FE FE FE  INC $FEFE,X
  $B433  FE FF FF  INC $FFFF,X
  $B436  FF        .db $FF
  $B437  FF        .db $FF
  $B438  00        BRK
  $B439  00        BRK
  $B43A  00        BRK
  $B43B  00        BRK
  $B43C  00        BRK
  $B43D  00        BRK
  $B43E  00        BRK
  $B43F  00        BRK
  $B440  00        BRK
  $B441  3F        .db $3F
  $B442  3F        .db $3F
  $B443  3F        .db $3F
  $B444  1F        .db $1F
  $B445  1F        .db $1F
  $B446  1F        .db $1F
  $B447  0E 00 C0  ASL $C000
  $B44A  C0 C0     CPY #$C0
  $B44C  60        RTS
  $B44D  60        RTS
  $B44E  60        RTS
  $B44F  30 00     BMI $B451

L_B451:
  $B451  00        BRK
  $B452  00        BRK
  $B453  80        .db $80
  $B454  80        .db $80
  $B455  80        .db $80
  $B456  00        BRK
  $B457  38        SEC
  $B458  00        BRK
  $B459  00        BRK
  $B45A  00        BRK
  $B45B  00        BRK
  $B45C  00        BRK
  $B45D  00        BRK
  $B45E  00        BRK
  $B45F  00        BRK
  $B460  00        BRK
  $B461  00        BRK
  $B462  00        BRK
  $B463  01 01     ORA ($01,X)
  $B465  01 00     ORA ($00,X)
  $B467  1C        .db $1C
  $B468  00        BRK
  $B469  00        BRK
  $B46A  00        BRK
  $B46B  00        BRK
  $B46C  00        BRK
  $B46D  00        BRK
  $B46E  00        BRK
  $B46F  00        BRK
  $B470  00        BRK
  $B471  FC        .db $FC
  $B472  FC        .db $FC
  $B473  FC        .db $FC
  $B474  F8        SED
  $B475  F8        SED
  $B476  F8        SED
  $B477  70 00     BVS $B479

L_B479:
  $B479  03        .db $03
  $B47A  03        .db $03
  $B47B  03        .db $03
  $B47C  06 06     ASL $06
  $B47E  06 0C     ASL $0C
  $B480  70 74     BVS $B4F6
  $B482  70 7F     BVS $B503
  $B484  60        RTS
  $B485  E0 FF     CPX #$FF
  $B487  00        BRK
  $B488  7F        .db $7F
  $B489  79 79 7F  ADC $7F79,Y
  $B48C  60        RTS
  $B48D  FF        .db $FF
  $B48E  FF        .db $FF
  $B48F  00        BRK
  $B490  0A        ASL
  $B491  4B        .db $4B
  $B492  0B        .db $0B
  $B493  F8        SED
  $B494  00        BRK
  $B495  C0 87     CPY #$87
  $B497  0C        .db $0C
  $B498  FB        .db $FB
  $B499  9B        .db $9B
  $B49A  9B        .db $9B
  $B49B  F8        SED
  $B49C  07        .db $07
  $B49D  DF        .db $DF
  $B49E  BF        .db $BF
  $B49F  3C        .db $3C
  $B4A0  AA        TAX
  $B4A1  FF        .db $FF
  $B4A2  FF        .db $FF
  $B4A3  1F        .db $1F
  $B4A4  07        .db $07
  $B4A5  09 C4     ORA #$C4
  $B4A7  04        .db $04
  $B4A8  FF        .db $FF
  $B4A9  FF        .db $FF
  $B4AA  FF        .db $FF
  $B4AB  1F        .db $1F
  $B4AC  E7        .db $E7
  $B4AD  F9 FC 3C  SBC $3CFC,Y
  $B4B0  AA        TAX
  $B4B1  FF        .db $FF
  $B4B2  FF        .db $FF
  $B4B3  FF        .db $FF
  $B4B4  FF        .db $FF
  $B4B5  FF        .db $FF
  $B4B6  00        BRK
  $B4B7  3F        .db $3F
  $B4B8  FF        .db $FF
  $B4B9  FF        .db $FF
  $B4BA  FF        .db $FF
  $B4BB  FF        .db $FF
  $B4BC  FF        .db $FF
  $B4BD  FF        .db $FF
  $B4BE  00        BRK
  $B4BF  00        BRK
  $B4C0  AE FE FE  LDX $FEFE
  $B4C3  FE FE FE  INC $FEFE,X
  $B4C6  3E 80 FE  ROL $FE80,X
  $B4C9  FE FE FE  INC $FEFE,X
  $B4CC  FE FE 3E  INC $3EFE,X
  $B4CF  00        BRK
  $B4D0  00        BRK
  $B4D1  3C        .db $3C
  $B4D2  00        BRK
  $B4D3  7E 00 02  ROR $0200,X
  $B4D6  7C        .db $7C
  $B4D7  00        BRK
  $B4D8  00        BRK
  $B4D9  42        .db $42
  $B4DA  7E 7E 00  ROR $007E,X
  $B4DD  7E 7C 00  ROR $007C,X
  $B4E0  00        BRK
  $B4E1  00        BRK
  $B4E2  00        BRK
  $B4E3  00        BRK
  $B4E4  00        BRK
  $B4E5  00        BRK
  $B4E6  00        BRK
  $B4E7  00        BRK
  $B4E8  00        BRK
  $B4E9  00        BRK
  $B4EA  00        BRK
  $B4EB  00        BRK
  $B4EC  00        BRK
  $B4ED  00        BRK
  $B4EE  00        BRK
  $B4EF  03        .db $03
  $B4F0  00        BRK
  $B4F1  00        BRK
  $B4F2  00        BRK
  $B4F3  00        BRK
  $B4F4  00        BRK
  $B4F5  00        BRK

L_B4F6:
  $B4F6  00        BRK
  $B4F7  01 00     ORA ($00,X)
  $B4F9  00        BRK
  $B4FA  00        BRK
  $B4FB  00        BRK
  $B4FC  01 07     ORA ($07,X)
  $B4FE  1E F8 07  ASL $07F8,X
  $B501  0F        .db $0F
  $B502  1F        .db $1F

L_B503:
  $B503  1F        .db $1F
  $B504  3F        .db $3F
  $B505  7F        .db $7F
  $B506  FF        .db $FF
  $B507  FF        .db $FF
  $B508  30 60     BMI $B56A
  $B50A  C0 C0     CPY #$C0
  $B50C  80        .db $80
  $B50D  00        BRK
  $B50E  00        BRK
  $B50F  00        BRK
  $B510  FF        .db $FF
  $B511  FF        .db $FF
  $B512  FF        .db $FF
  $B513  FF        .db $FF
  $B514  FF        .db $FF
  $B515  FF        .db $FF
  $B516  FF        .db $FF
  $B517  FF        .db $FF
  $B518  00        BRK
  $B519  00        BRK
  $B51A  00        BRK
  $B51B  00        BRK
  $B51C  00        BRK
  $B51D  00        BRK
  $B51E  00        BRK
  $B51F  00        BRK
  $B520  FF        .db $FF
  $B521  FF        .db $FF
  $B522  FF        .db $FF
  $B523  FF        .db $FF
  $B524  FF        .db $FF
  $B525  FF        .db $FF
  $B526  FF        .db $FF
  $B527  FF        .db $FF
  $B528  00        BRK
  $B529  00        BRK
  $B52A  00        BRK
  $B52B  00        BRK
  $B52C  00        BRK
  $B52D  00        BRK
  $B52E  00        BRK
  $B52F  00        BRK
  $B530  8C 80 C1  STY $C180
  $B533  E1 F0     SBC ($F0,X)
  $B535  F8        SED
  $B536  E0 9C     CPX #$9C
  $B538  30 18     BMI $B552
  $B53A  00        BRK
  $B53B  02        .db $02
  $B53C  03        .db $03
  $B53D  01 00     ORA ($00,X)
  $B53F  1C        .db $1C
  $B540  7E FE FE  ROR $FEFE,X
  $B543  FE 7E 0E  INC $0E7E,X
  $B546  00        BRK
  $B547  00        BRK
  $B548  00        BRK
  $B549  00        BRK
  $B54A  00        BRK
  $B54B  00        BRK
  $B54C  80        .db $80
  $B54D  F0 7E     BEQ $B5CD
  $B54F  0E 7E 7F  ASL $7F7E

L_B552:
  $B552  7F        .db $7F
  $B553  7F        .db $7F
  $B554  7F        .db $7F
  $B555  7E 70 01  ROR $0170,X
  $B558  00        BRK
  $B559  00        BRK
  $B55A  00        BRK
  $B55B  00        BRK
  $B55C  00        BRK
  $B55D  01 0E     ORA ($0E,X)
  $B55F  71 31     ADC ($31),Y
  $B561  00        BRK
  $B562  85 CD     STA $CD
  $B564  98        TYA
  $B565  30 00     BMI $B567

L_B567:
  $B567  FD 0D 18  SBC $180D,X

L_B56A:
  $B56A  04        .db $04
  $B56B  0C        .db $0C
  $B56C  5C        .db $5C
  $B56D  BF        .db $BF
  $B56E  00        BRK
  $B56F  FD 00 00  SBC $0000,X
  $B572  50 50     BVC $B5C4
  $B574  00        BRK
  $B575  00        BRK
  $B576  00        BRK
  $B577  4E FE 02  LSR $02FE
  $B57A  02        .db $02
  $B57B  02        .db $02
  $B57C  02        .db $02
  $B57D  FE 00 4E  INC $4E00,X
  $B580  1B        .db $1B
  $B581  16 14     ASL $14,X
  $B583  14        .db $14
  $B584  16 1B     ASL $1B,X
  $B586  0C        .db $0C
  $B587  20 78 70  JSR $7078
  $B58A  71 71     ADC ($71),Y
  $B58C  70 78     BVS $B606
  $B58E  3C        .db $3C
  $B58F  3F        .db $3F
  $B590  C2        .db $C2
  $B591  62        .db $62
  $B592  22        .db $22
  $B593  22        .db $22
  $B594  62        .db $62
  $B595  C2        .db $C2
  $B596  04        .db $04
  $B597  0C        .db $0C
  $B598  1E 0E 8E  ASL $8E0E,X
  $B59B  8E 0E 1E  STX $1E0E
  $B59E  3C        .db $3C
  $B59F  FC        .db $FC
  $B5A0  7F        .db $7F
  $B5A1  7F        .db $7F
  $B5A2  7F        .db $7F
  $B5A3  7F        .db $7F
  $B5A4  7F        .db $7F
  $B5A5  7F        .db $7F
  $B5A6  FF        .db $FF
  $B5A7  FF        .db $FF
  $B5A8  00        BRK
  $B5A9  00        BRK
  $B5AA  00        BRK
  $B5AB  00        BRK
  $B5AC  00        BRK
  $B5AD  00        BRK
  $B5AE  00        BRK
  $B5AF  00        BRK
  $B5B0  E0 F8     CPX #$F8
  $B5B2  FC        .db $FC
  $B5B3  FE FB F7  INC $F7FB,X
  $B5B6  EF        .db $EF
  $B5B7  C7        .db $C7
  $B5B8  00        BRK
  $B5B9  00        BRK
  $B5BA  00        BRK
  $B5BB  02        .db $02
  $B5BC  03        .db $03
  $B5BD  07        .db $07
  $B5BE  0F        .db $0F
  $B5BF  1F        .db $1F
  $B5C0  00        BRK
  $B5C1  00        BRK
  $B5C2  00        BRK
  $B5C3  00        BRK

L_B5C4:
  $B5C4  00        BRK
  $B5C5  80        .db $80
  $B5C6  80        .db $80
  $B5C7  00        BRK
  $B5C8  00        BRK
  $B5C9  00        BRK
  $B5CA  00        BRK
  $B5CB  00        BRK
  $B5CC  00        BRK

L_B5CD:
  $B5CD  80        .db $80
  $B5CE  80        .db $80
  $B5CF  00        BRK
  $B5D0  00        BRK
  $B5D1  06 07     ASL $07
  $B5D3  0F        .db $0F
  $B5D4  0F        .db $0F
  $B5D5  0F        .db $0F
  $B5D6  1F        .db $1F
  $B5D7  1F        .db $1F
  $B5D8  01 00     ORA ($00,X)
  $B5DA  00        BRK
  $B5DB  01 01     ORA ($01,X)
  $B5DD  00        BRK
  $B5DE  03        .db $03
  $B5DF  01 07     ORA ($07,X)
  $B5E1  0F        .db $0F
  $B5E2  FF        .db $FF
  $B5E3  FF        .db $FF
  $B5E4  FF        .db $FF
  $B5E5  FF        .db $FF
  $B5E6  FF        .db $FF
  $B5E7  FF        .db $FF
  $B5E8  E0 00     CPX #$00
  $B5EA  38        SEC
  $B5EB  E0 E0     CPX #$E0
  $B5ED  C0 C0     CPY #$C0
  $B5EF  00        BRK
  $B5F0  FF        .db $FF
  $B5F1  FF        .db $FF
  $B5F2  FF        .db $FF
  $B5F3  FF        .db $FF
  $B5F4  FF        .db $FF
  $B5F5  FF        .db $FF
  $B5F6  FF        .db $FF
  $B5F7  FF        .db $FF
  $B5F8  00        BRK
  $B5F9  00        BRK
  $B5FA  00        BRK
  $B5FB  00        BRK
  $B5FC  00        BRK
  $B5FD  00        BRK
  $B5FE  00        BRK
  $B5FF  00        BRK
  $B600  FF        .db $FF
  $B601  FF        .db $FF
  $B602  FF        .db $FF
  $B603  FF        .db $FF
  $B604  FE F8 E0  INC $E0F8,X
  $B607  80        .db $80
  $B608  00        BRK
  $B609  00        BRK
  $B60A  00        BRK
  $B60B  00        BRK
  $B60C  00        BRK
  $B60D  01 07     ORA ($07,X)
  $B60F  1F        .db $1F
  $B610  FE F8 E0  INC $E0F8,X
  $B613  80        .db $80
  $B614  00        BRK
  $B615  01 06     ORA ($06,X)
  $B617  18        CLC
  $B618  00        BRK
  $B619  01 07     ORA ($07,X)
  $B61B  1F        .db $1F
  $B61C  7F        .db $7F
  $B61D  FF        .db $FF
  $B61E  FE F8 07  INC $07F8,X
  $B621  07        .db $07
  $B622  0E 18 67  ASL $6718
  $B625  80        .db $80
  $B626  62        .db $62
  $B627  60        RTS
  $B628  7F        .db $7F
  $B629  FF        .db $FF
  $B62A  FE F8 E7  INC $E7F8,X
  $B62D  80        .db $80
  $B62E  64        .db $64
  $B62F  64        .db $64
  $B630  C0 8F     CPY #$8F
  $B632  08        PHP
  $B633  2B        .db $2B
  $B634  EA        NOP
  $B635  0A        ASL
  $B636  68        PLA
  $B637  68        PLA
  $B638  C0 8F     CPY #$8F
  $B63A  0F        .db $0F
  $B63B  6F        .db $6F
  $B63C  EF        .db $EF
  $B63D  0F        .db $0F
  $B63E  EC EF 03  CPX $03EF
  $B641  FA        .db $FA
  $B642  0A        ASL
  $B643  CA        DEX
  $B644  08        PHP
  $B645  08        PHP
  $B646  08        PHP
  $B647  08        PHP
  $B648  03        .db $03
  $B649  FA        .db $FA
  $B64A  FA        .db $FA
  $B64B  DA        .db $DA
  $B64C  D8        CLD
  $B64D  DA        .db $DA
  $B64E  1A        .db $1A
  $B64F  F8        SED
  $B650  C0 00     CPY #$00
  $B652  00        BRK
  $B653  00        BRK
  $B654  00        BRK
  $B655  02        .db $02
  $B656  02        .db $02
  $B657  0E FE 02  ASL $02FE
  $B65A  AA        TAX
  $B65B  AA        TAX
  $B65C  00        BRK
  $B65D  AE AE 0E  LDX $0EAE
  $B660  1F        .db $1F
  $B661  39 70 60  AND $6070,Y
  $B664  40        RTI
  $B665  40        RTI
  $B666  40        RTI
  $B667  40        RTI
  $B668  1F        .db $1F
  $B669  3F        .db $3F
  $B66A  7F        .db $7F
  $B66B  7C        .db $7C
  $B66C  78        SEI
  $B66D  71 63     ADC ($63),Y
  $B66F  67        .db $67
  $B670  18        CLC
  $B671  87        .db $87
  $B672  E0 F0     CPX #$F0
  $B674  E7        .db $E7
  $B675  EF        .db $EF
  $B676  EF        .db $EF

L_B677:
  $B677  EF        .db $EF
  $B678  1F        .db $1F
  $B679  87        .db $87
  $B67A  E0 F0     CPX #$F0
  $B67C  E0 E0     CPX #$E0
  $B67E  E0 E0     CPX #$E0
  $B680  19 E3 07  ORA $07E3,Y
  $B683  1F        .db $1F
  $B684  FF        .db $FF
  $B685  FF        .db $FF
  $B686  FF        .db $FF
  $B687  FF        .db $FF
  $B688  F8        SED
  $B689  E0 00     CPX #$00
  $B68B  00        BRK
  $B68C  00        BRK

L_B68D:
  $B68D  00        BRK
  $B68E  00        BRK
  $B68F  00        BRK
  $B690  FF        .db $FF
  $B691  FF        .db $FF
  $B692  FE FD F8  INC $F8FD,X
  $B695  F0 E0     BEQ $B677
  $B697  C0 00     CPY #$00
  $B699  00        BRK
  $B69A  00        BRK
  $B69B  01 03     ORA ($03,X)
  $B69D  07        .db $07
  $B69E  0F        .db $0F
  $B69F  1F        .db $1F
  $B6A0  B2        .db $B2
  $B6A1  18        CLC
  $B6A2  08        PHP
  $B6A3  00        BRK
  $B6A4  80        .db $80
  $B6A5  40        RTI
  $B6A6  00        BRK
  $B6A7  00        BRK
  $B6A8  3E 7C F8  ROL $F87C,X
  $B6AB  F0 E0     BEQ $B68D
  $B6AD  C0 80     CPY #$80
  $B6AF  00        BRK
  $B6B0  1F        .db $1F
  $B6B1  1F        .db $1F
  $B6B2  1F        .db $1F
  $B6B3  3F        .db $3F
  $B6B4  3F        .db $3F
  $B6B5  3F        .db $3F
  $B6B6  3F        .db $3F
  $B6B7  3F        .db $3F
  $B6B8  00        BRK
  $B6B9  00        BRK
  $B6BA  00        BRK
  $B6BB  00        BRK
  $B6BC  00        BRK
  $B6BD  00        BRK
  $B6BE  00        BRK
  $B6BF  00        BRK
  $B6C0  FF        .db $FF
  $B6C1  FF        .db $FF
  $B6C2  FF        .db $FF
  $B6C3  FF        .db $FF
  $B6C4  FE F8 E0  INC $E0F8,X
  $B6C7  80        .db $80
  $B6C8  00        BRK
  $B6C9  00        BRK
  $B6CA  00        BRK
  $B6CB  00        BRK
  $B6CC  00        BRK
  $B6CD  01 07     ORA ($07,X)
  $B6CF  1F        .db $1F
  $B6D0  FE F8 E0  INC $E0F8,X
  $B6D3  80        .db $80
  $B6D4  00        BRK
  $B6D5  01 06     ORA ($06,X)
  $B6D7  18        CLC
  $B6D8  00        BRK
  $B6D9  01 07     ORA ($07,X)
  $B6DB  1F        .db $1F
  $B6DC  7F        .db $7F
  $B6DD  FF        .db $FF
  $B6DE  FE F8 00  INC $00F8,X
  $B6E1  01 06     ORA ($06,X)
  $B6E3  18        CLC
  $B6E4  60        RTS
  $B6E5  80        .db $80
  $B6E6  00        BRK
  $B6E7  00        BRK
  $B6E8  7F        .db $7F
  $B6E9  FF        .db $FF
  $B6EA  FE F8 E0  INC $E0F8,X
  $B6ED  80        .db $80
  $B6EE  00        BRK
  $B6EF  00        BRK
  $B6F0  60        RTS
  $B6F1  95 00     STA $00,X
  $B6F3  DB        .db $DB
  $B6F4  00        BRK
  $B6F5  00        BRK
  $B6F6  00        BRK
  $B6F7  00        BRK
  $B6F8  E0 9B     CPX #$9B
  $B6FA  00        BRK
  $B6FB  E7        .db $E7
  $B6FC  00        BRK
  $B6FD  04        .db $04
  $B6FE  04        .db $04
  $B6FF  04        .db $04
  $B700  60        RTS
  $B701  00        BRK
  $B702  7F        .db $7F
  $B703  40        RTI
  $B704  5C        .db $5C
  $B705  40        RTI
  $B706  5C        .db $5C
  $B707  61 67     ADC ($67,X)
  $B709  00        BRK
  $B70A  00        BRK
  $B70B  21 35     AND ($35,X)
  $B70D  21 35     AND ($35,X)
  $B70F  61 E0     ADC ($E0,X)
  $B711  0B        .db $0B
  $B712  40        RTI
  $B713  2B        .db $2B
  $B714  E0 0B     CPX #$0B
  $B716  60        RTS
  $B717  6B        .db $6B
  $B718  E0 4C     CPX #$4C
  $B71A  40        RTI
  $B71B  EC E0 0C  CPX $0CE0
  $B71E  E0 EC     CPX #$EC
  $B720  03        .db $03
  $B721  22        .db $22
  $B722  06 26     ASL $26
  $B724  00        BRK
  $B725  28        PLP
  $B726  08        PHP
  $B727  28        PLP
  $B728  03        .db $03
  $B729  E2        .db $E2
  $B72A  06 E6     ASL $E6
  $B72C  00        BRK
  $B72D  EA        NOP
  $B72E  0A        ASL
  $B72F  E8        INX
  $B730  80        .db $80
  $B731  BC A4 80  LDY $80A4,X
  $B734  02        .db $02
  $B735  00        BRK
  $B736  01 7F     ORA ($7F,X)
  $B738  80        .db $80
  $B739  84 9C     STY $9C
  $B73B  80        .db $80
  $B73C  FE 00 01  INC $0100,X
  $B73F  7F        .db $7F
  $B740  6C 78 71  JMP ($7178)
  $B743  63        .db $63
  $B744  46 CD     LSR $CD
  $B746  9B        .db $9B
  $B747  37        .db $37
  $B748  73        .db $73
  $B749  67        .db $67
  $B74A  6F        .db $6F
  $B74B  7F        .db $7F
  $B74C  7F        .db $7F
  $B74D  FF        .db $FF
  $B74E  FF        .db $FF
  $B74F  FF        .db $FF
  $B750  EF        .db $EF
  $B751  EF        .db $EF
  $B752  6F        .db $6F
  $B753  6F        .db $6F
  $B754  E7        .db $E7
  $B755  E7        .db $E7
  $B756  C3        .db $C3
  $B757  83        .db $83
  $B758  E0 E0     CPX #$E0
  $B75A  E0 E0     CPX #$E0
  $B75C  E0 E0     CPX #$E0
  $B75E  C0 80     CPY #$80
  $B760  FF        .db $FF
  $B761  FF        .db $FF
  $B762  FE FC F8  INC $F8FC,X
  $B765  F4        .db $F4
  $B766  E6 C3     INC $C3
  $B768  00        BRK
  $B769  00        BRK
  $B76A  00        BRK
  $B76B  01 03     ORA ($03,X)
  $B76D  07        .db $07
  $B76E  0F        .db $0F
  $B76F  1F        .db $1F
  $B770  80        .db $80
  $B771  00        BRK
  $B772  80        .db $80
  $B773  40        RTI
  $B774  20 00 00  JSR $0000
  $B777  00        BRK
  $B778  3E 7C F8  ROL $F87C,X
  $B77B  F0 E0     BEQ $B75D
  $B77D  C0 80     CPY #$80
  $B77F  00        BRK
  $B780  3E 38 00  ROL $0038,X
  $B783  00        BRK
  $B784  00        BRK
  $B785  23        .db $23
  $B786  1C        .db $1C
  $B787  00        BRK
  $B788  00        BRK
  $B789  01 07     ORA ($07,X)
  $B78B  3F        .db $3F
  $B78C  3F        .db $3F
  $B78D  3F        .db $3F
  $B78E  1C        .db $1C
  $B78F  00        BRK
  $B790  00        BRK
  $B791  01 06     ORA ($06,X)
  $B793  18        CLC
  $B794  60        RTS
  $B795  80        .db $80
  $B796  00        BRK
  $B797  00        BRK
  $B798  7F        .db $7F
  $B799  FF        .db $FF
  $B79A  FE F8 E0  INC $E0F8,X
  $B79D  80        .db $80
  $B79E  00        BRK
  $B79F  00        BRK
  $B7A0  60        RTS
  $B7A1  80        .db $80
  $B7A2  00        BRK
  $B7A3  00        BRK
  $B7A4  00        BRK
  $B7A5  00        BRK
  $B7A6  00        BRK
  $B7A7  00        BRK
  $B7A8  E0 80     CPX #$80
  $B7AA  00        BRK
  $B7AB  00        BRK
  $B7AC  00        BRK
  $B7AD  00        BRK
  $B7AE  00        BRK
  $B7AF  00        BRK
  $B7B0  00        BRK
  $B7B1  00        BRK
  $B7B2  00        BRK
  $B7B3  00        BRK
  $B7B4  00        BRK
  $B7B5  00        BRK
  $B7B6  00        BRK
  $B7B7  00        BRK
  $B7B8  00        BRK
  $B7B9  00        BRK
  $B7BA  00        BRK
  $B7BB  00        BRK
  $B7BC  00        BRK
  $B7BD  00        BRK
  $B7BE  00        BRK
  $B7BF  00        BRK
  $B7C0  00        BRK
  $B7C1  00        BRK
  $B7C2  00        BRK
  $B7C3  00        BRK
  $B7C4  00        BRK
  $B7C5  01 00     ORA ($00,X)
  $B7C7  00        BRK
  $B7C8  04        .db $04
  $B7C9  02        .db $02
  $B7CA  02        .db $02
  $B7CB  02        .db $02
  $B7CC  01 00     ORA ($00,X)
  $B7CE  00        BRK
  $B7CF  00        BRK
  $B7D0  3C        .db $3C
  $B7D1  20 20 20  JSR $2020
  $B7D4  1F        .db $1F
  $B7D5  00        BRK
  $B7D6  00        BRK
  $B7D7  80        .db $80
  $B7D8  1D 01 1F  ORA $1F01,X
  $B7DB  1F        .db $1F
  $B7DC  1F        .db $1F
  $B7DD  00        BRK
  $B7DE  80        .db $80
  $B7DF  00        BRK
  $B7E0  4F        .db $4F
  $B7E1  40        RTI
  $B7E2  40        RTI
  $B7E3  40        RTI
  $B7E4  81 02     STA ($02,X)
  $B7E6  05 0A     ORA $0A
  $B7E8  CF        .db $CF
  $B7E9  C0 C0     CPY #$C0
  $B7EB  C0 81     CPY #$81
  $B7ED  03        .db $03
  $B7EE  07        .db $07
  $B7EF  0F        .db $0F
  $B7F0  F9 02 06  SBC $0602,Y
  $B7F3  FD 47 8F  SBC $8F47,X

L_B7F6:
  $B7F6  1E 3C F9  ASL $F93C,X
  $B7F9  03        .db $03
  $B7FA  07        .db $07
  $B7FB  FE F8 F0  INC $F0F8,X

L_B7FE:
  $B7FE  E1 C3     SBC ($C3,X)
  $B800  C0 30     CPY #$30
  $B802  E1 C3     SBC ($C3,X)
  $B804  86 0D     STX $0D
  $B806  1B        .db $1B
  $B807  37        .db $37
  $B808  FF        .db $FF
  $B809  CF        .db $CF
  $B80A  1F        .db $1F
  $B80B  3F        .db $3F
  $B80C  7F        .db $7F
  $B80D  FF        .db $FF
  $B80E  FF        .db $FF
  $B80F  FF        .db $FF
  $B810  6F        .db $6F
  $B811  DE BC 78  DEC $78BC,X
  $B814  F0 E0     BEQ $B7F6
  $B816  C0 80     CPY #$80
  $B818  FF        .db $FF
  $B819  FE FC F8  INC $F8FC,X
  $B81C  F0 E0     BEQ $B7FE
  $B81E  C0 80     CPY #$80
  $B820  01 00     ORA ($00,X)
  $B822  00        BRK
  $B823  00        BRK
  $B824  00        BRK
  $B825  00        BRK
  $B826  00        BRK
  $B827  00        BRK
  $B828  00        BRK
  $B829  00        BRK
  $B82A  00        BRK
  $B82B  00        BRK
  $B82C  00        BRK
  $B82D  00        BRK
  $B82E  00        BRK
  $B82F  00        BRK
  $B830  B0 78     BCS $B8AA
  $B832  F8        SED
  $B833  70 20     BVS $B855
  $B835  00        BRK
  $B836  00        BRK
  $B837  00        BRK
  $B838  3E 7C F8  ROL $F87C,X
  $B83B  70 20     BVS $B85D
  $B83D  00        BRK
  $B83E  00        BRK
  $B83F  00        BRK
  $B840  40        RTI
  $B841  20 18 06  JSR $0618

L_B844:
  $B844  00        BRK
  $B845  00        BRK
  $B846  00        BRK
  $B847  00        BRK
  $B848  00        BRK
  $B849  00        BRK
  $B84A  00        BRK
  $B84B  00        BRK
  $B84C  00        BRK
  $B84D  00        BRK
  $B84E  00        BRK
  $B84F  00        BRK
  $B850  14        .db $14
  $B851  28        PLP
  $B852  51 A3     EOR ($A3),Y
  $B854  C7        .db $C7

L_B855:
  $B855  0F        .db $0F

L_B856:
  $B856  1E 1C 1F  ASL $1F1C,X
  $B859  3F        .db $3F
  $B85A  7E FC F8  ROR $F8FC,X

L_B85D:
  $B85D  70 21     BVS $B880
  $B85F  03        .db $03
  $B860  78        SEI
  $B861  F0 E1     BEQ $B844
  $B863  C3        .db $C3
  $B864  86 0D     STX $0D
  $B866  1B        .db $1B
  $B867  37        .db $37
  $B868  87        .db $87
  $B869  0F        .db $0F
  $B86A  1F        .db $1F
  $B86B  3F        .db $3F
  $B86C  7F        .db $7F
  $B86D  FF        .db $FF
  $B86E  FF        .db $FF
  $B86F  FF        .db $FF
  $B870  6F        .db $6F
  $B871  DE BC 78  DEC $78BC,X
  $B874  F0 E0     BEQ $B856
  $B876  C0 80     CPY #$80
  $B878  FF        .db $FF
  $B879  FE FC F8  INC $F8FC,X
  $B87C  F0 E0     BEQ $B85E
  $B87E  C0 80     CPY #$80

L_B880:
  $B880  08        PHP
  $B881  00        BRK
  $B882  01 01     ORA ($01,X)
  $B884  00        BRK
  $B885  00        BRK
  $B886  00        BRK
  $B887  00        BRK
  $B888  07        .db $07
  $B889  07        .db $07
  $B88A  03        .db $03
  $B88B  01 00     ORA ($00,X)
  $B88D  00        BRK
  $B88E  00        BRK
  $B88F  00        BRK
  $B890  6F        .db $6F
  $B891  DE BC 78  DEC $78BC,X
  $B894  F0 60     BEQ $B8F6
  $B896  00        BRK
  $B897  00        BRK
  $B898  FF        .db $FF
  $B899  FE FC F8  INC $F8FC,X
  $B89C  F0 60     BEQ $B8FE
  $B89E  00        BRK
  $B89F  00        BRK
  $B8A0  3E A7 80  ROL $80A7,X
  $B8A3  7F        .db $7F
  $B8A4  00        BRK
  $B8A5  02        .db $02
  $B8A6  00        BRK
  $B8A7  00        BRK
  $B8A8  41 C0     EOR ($C0,X)

L_B8AA:
  $B8AA  FF        .db $FF

L_B8AB:
  $B8AB  7F        .db $7F
  $B8AC  00        BRK
  $B8AD  00        BRK
  $B8AE  00        BRK
  $B8AF  00        BRK
  $B8B0  00        BRK
  $B8B1  00        BRK
  $B8B2  00        BRK
  $B8B3  FF        .db $FF
  $B8B4  00        BRK
  $B8B5  00        BRK
  $B8B6  00        BRK
  $B8B7  0F        .db $0F
  $B8B8  FF        .db $FF
  $B8B9  39 FF FF  AND $FFFF,Y
  $B8BC  00        BRK
  $B8BD  2A        ROL
  $B8BE  00        BRK
  $B8BF  0F        .db $0F
  $B8C0  63        .db $63
  $B8C1  31 E3     AND ($E3),Y
  $B8C3  F1 07     SBC ($07),Y
  $B8C5  07        .db $07
  $B8C6  03        .db $03
  $B8C7  01 E0     ORA ($E0,X)
  $B8C9  F0 E0     BEQ $B8AB
  $B8CB  F0 00     BEQ $B8CD

L_B8CD:
  $B8CD  A0 00     LDY #$00
  $B8CF  08        PHP
  $B8D0  03        .db $03
  $B8D1  01 00     ORA ($00,X)
  $B8D3  00        BRK
  $B8D4  00        BRK
  $B8D5  00        BRK
  $B8D6  00        BRK
  $B8D7  00        BRK
  $B8D8  03        .db $03
  $B8D9  01 00     ORA ($00,X)
  $B8DB  00        BRK
  $B8DC  00        BRK
  $B8DD  00        BRK
  $B8DE  00        BRK
  $B8DF  00        BRK
  $B8E0  83        .db $83
  $B8E1  88        DEY
  $B8E2  A0 88     LDY #$88
  $B8E4  81 81     STA ($81,X)
  $B8E6  00        BRK
  $B8E7  0C        .db $0C
  $B8E8  A0 88     LDY #$88
  $B8EA  A9 8B     LDA #$8B
  $B8EC  82        .db $82
  $B8ED  80        .db $80
  $B8EE  18        CLC
  $B8EF  30 00     BMI $B8F1

L_B8F1:
  $B8F1  03        .db $03
  $B8F2  03        .db $03
  $B8F3  07        .db $07
  $B8F4  06 02     ASL $02

L_B8F6:
  $B8F6  02        .db $02
  $B8F7  02        .db $02
  $B8F8  00        BRK
  $B8F9  03        .db $03
  $B8FA  03        .db $03
  $B8FB  07        .db $07
  $B8FC  06 02     ASL $02

L_B8FE:
  $B8FE  02        .db $02
  $B8FF  02        .db $02
  $B900  0E 1F 1F  ASL $1F1F
  $B903  1F        .db $1F
  $B904  3F        .db $3F
  $B905  3F        .db $3F
  $B906  3F        .db $3F
  $B907  00        BRK
  $B908  30 60     BMI $B96A
  $B90A  60        RTS
  $B90B  60        RTS
  $B90C  C0 C0     CPY #$C0
  $B90E  C0 00     CPY #$00
  $B910  00        BRK
  $B911  7F        .db $7F
  $B912  FF        .db $FF
  $B913  FE 92 B6  INC $B692,X
  $B916  FE 00 00  INC $0000,X
  $B919  00        BRK
  $B91A  FF        .db $FF
  $B91B  01 01     ORA ($01,X)
  $B91D  25 01     AND $01
  $B91F  01 00     ORA ($00,X)
  $B921  F1 F1     SBC ($F1),Y
  $B923  70 70     BVS $B995
  $B925  77        .db $77
  $B926  77        .db $77
  $B927  70 00     BVS $B929

L_B929:
  $B929  28        PLP
  $B92A  E8        INX
  $B92B  EF        .db $EF
  $B92C  EF        .db $EF
  $B92D  EF        .db $EF
  $B92E  EF        .db $EF
  $B92F  EF        .db $EF
  $B930  00        BRK
  $B931  00        BRK
  $B932  00        BRK
  $B933  00        BRK
  $B934  00        BRK
  $B935  FF        .db $FF
  $B936  FF        .db $FF
  $B937  01 00     ORA ($00,X)
  $B939  98        TYA
  $B93A  98        TYA
  $B93B  FE FE FF  INC $FFFE,X
  $B93E  FF        .db $FF
  $B93F  FF        .db $FF
  $B940  00        BRK
  $B941  3F        .db $3F
  $B942  3F        .db $3F
  $B943  3F        .db $3F
  $B944  1F        .db $1F
  $B945  1F        .db $1F
  $B946  1F        .db $1F
  $B947  0E 00 C0  ASL $C000
  $B94A  C0 C0     CPY #$C0
  $B94C  60        RTS
  $B94D  60        RTS
  $B94E  60        RTS
  $B94F  30 76     BMI $B9C7
  $B951  56 76     LSR $76,X
  $B953  56 76     LSR $76,X
  $B955  76 00     ROR $00,X
  $B957  FF        .db $FF
  $B958  8E 8E 8E  STX $8E8E
  $B95B  8E 8E 8E  STX $8E8E
  $B95E  00        BRK
  $B95F  00        BRK
  $B960  00        BRK
  $B961  41 00     EOR ($00,X)
  $B963  41 00     EOR ($00,X)
  $B965  41 00     EOR ($00,X)
  $B967  FF        .db $FF
  $B968  00        BRK
  $B969  A2 00     LDX #$00
  $B96B  A2 00     LDX #$00
  $B96D  A2 00     LDX #$00
  $B96F  00        BRK
  $B970  00        BRK
  $B971  00        BRK
  $B972  00        BRK
  $B973  00        BRK
  $B974  00        BRK
  $B975  00        BRK
  $B976  00        BRK
  $B977  00        BRK
  $B978  00        BRK
  $B979  80        .db $80
  $B97A  03        .db $03
  $B97B  BB        .db $BB
  $B97C  2B        .db $2B
  $B97D  BE 2C AC  LDX $AC2C,Y
  $B980  8C 80 01  STY $0180
  $B983  01 00     ORA ($00,X)
  $B985  00        BRK
  $B986  1C        .db $1C
  $B987  00        BRK
  $B988  30 18     BMI $B9A2
  $B98A  80        .db $80
  $B98B  82        .db $82
  $B98C  83        .db $83
  $B98D  01 3C     ORA ($3C,X)
  $B98F  30 00     BMI $B991

L_B991:
  $B991  00        BRK
  $B992  00        BRK
  $B993  00        BRK
  $B994  00        BRK

L_B995:
  $B995  03        .db $03
  $B996  00        BRK
  $B997  00        BRK
  $B998  00        BRK
  $B999  00        BRK
  $B99A  00        BRK
  $B99B  00        BRK
  $B99C  00        BRK
  $B99D  00        BRK
  $B99E  03        .db $03
  $B99F  00        BRK
  $B9A0  08        PHP
  $B9A1  0F        .db $0F

L_B9A2:
  $B9A2  00        BRK
  $B9A3  03        .db $03
  $B9A4  03        .db $03
  $B9A5  FF        .db $FF
  $B9A6  00        BRK
  $B9A7  00        BRK
  $B9A8  0F        .db $0F
  $B9A9  0F        .db $0F
  $B9AA  00        BRK
  $B9AB  03        .db $03
  $B9AC  03        .db $03
  $B9AD  00        BRK
  $B9AE  FF        .db $FF
  $B9AF  00        BRK
  $B9B0  00        BRK
  $B9B1  FF        .db $FF
  $B9B2  00        BRK
  $B9B3  33        .db $33
  $B9B4  33        .db $33
  $B9B5  FF        .db $FF
  $B9B6  00        BRK
  $B9B7  00        BRK
  $B9B8  FF        .db $FF
  $B9B9  FF        .db $FF
  $B9BA  00        BRK
  $B9BB  33        .db $33
  $B9BC  33        .db $33
  $B9BD  00        BRK
  $B9BE  FF        .db $FF
  $B9BF  00        BRK
  $B9C0  00        BRK
  $B9C1  FF        .db $FF
  $B9C2  00        BRK
  $B9C3  33        .db $33
  $B9C4  33        .db $33
  $B9C5  FF        .db $FF
  $B9C6  00        BRK

L_B9C7:
  $B9C7  00        BRK
  $B9C8  FF        .db $FF
  $B9C9  FF        .db $FF
  $B9CA  00        BRK
  $B9CB  33        .db $33
  $B9CC  33        .db $33
  $B9CD  00        BRK
  $B9CE  FF        .db $FF
  $B9CF  00        BRK
  $B9D0  00        BRK
  $B9D1  00        BRK
  $B9D2  00        BRK
  $B9D3  00        BRK
  $B9D4  00        BRK
  $B9D5  00        BRK
  $B9D6  00        BRK
  $B9D7  00        BRK
  $B9D8  AC AC 2C  LDY $2CAC
  $B9DB  2C 7A F8  BIT $F87A
  $B9DE  F8        SED
  $B9DF  00        BRK
  $B9E0  F7        .db $F7
  $B9E1  10 15     BPL $B9F8
  $B9E3  10 07     BPL $B9EC
  $B9E5  00        BRK
  $B9E6  62        .db $62
  $B9E7  60        RTS
  $B9E8  F7        .db $F7
  $B9E9  D5 D5     CMP $D5,X
  $B9EB  F7        .db $F7

L_B9EC:
  $B9EC  07        .db $07
  $B9ED  00        BRK
  $B9EE  64        .db $64
  $B9EF  64        .db $64
  $B9F0  E0 0F     CPX #$0F
  $B9F2  48        PHA
  $B9F3  2B        .db $2B
  $B9F4  EA        NOP
  $B9F5  0A        ASL
  $B9F6  68        PLA
  $B9F7  68        PLA

L_B9F8:
  $B9F8  E0 4F     CPX #$4F
  $B9FA  4F        .db $4F
  $B9FB  EF        .db $EF
  $B9FC  EF        .db $EF
  $B9FD  0F        .db $0F
  $B9FE  EC EF 00  CPX $00EF
  $BA01  15 00     ORA $00,X
  $BA03  DB        .db $DB
  $BA04  00        BRK
  $BA05  00        BRK
  $BA06  00        BRK
  $BA07  00        BRK
  $BA08  00        BRK
  $BA09  1B        .db $1B
  $BA0A  00        BRK

L_BA0B:
  $BA0B  E7        .db $E7
  $BA0C  00        BRK
  $BA0D  04        .db $04
  $BA0E  04        .db $04
  $BA0F  04        .db $04
  $BA10  09 13     ORA #$13
  $BA12  10 11     BPL $BA25
  $BA14  49 F1     EOR #$F1
  $BA16  F3        .db $F3
  $BA17  FB        .db $FB
  $BA18  04        .db $04
  $BA19  0C        .db $0C
  $BA1A  0F        .db $0F
  $BA1B  0E 07 4E  ASL $4E07
  $BA1E  AC E4 41  LDY $41E4
  $BA21  01 FE     ORA ($FE,X)
  $BA23  FE FC FC  INC $FCFC,X
  $BA26  FD FF 80  SBC $80FF,X
  $BA29  C0 7F     CPY #$7F
  $BA2B  FF        .db $FF
  $BA2C  FF        .db $FF
  $BA2D  E7        .db $E7
  $BA2E  CE 8E 40  DEC $408E
  $BA31  68        PLA
  $BA32  2A        ROL
  $BA33  0F        .db $0F
  $BA34  0F        .db $0F
  $BA35  0F        .db $0F
  $BA36  8F        .db $8F
  $BA37  DF        .db $DF
  $BA38  80        .db $80
  $BA39  90 D0     BCC $BA0B
  $BA3B  F2        .db $F2
  $BA3C  F4        .db $F4
  $BA3D  F5 76     SBC $76,X
  $BA3F  A7        .db $A7
  $BA40  FB        .db $FB
  $BA41  EF        .db $EF
  $BA42  47        .db $47
  $BA43  22        .db $22
  $BA44  13        .db $13
  $BA45  0B        .db $0B
  $BA46  07        .db $07
  $BA47  0D 65 53  ORA $5365
  $BA4A  38        SEC
  $BA4B  1D 0C 05  ORA $050C,X
  $BA4E  01 02     ORA ($02,X)
  $BA50  FF        .db $FF
  $BA51  FF        .db $FF
  $BA52  1F        .db $1F
  $BA53  0F        .db $0F
  $BA54  EF        .db $EF
  $BA55  FE FC F8  INC $F8FC,X
  $BA58  C7        .db $C7
  $BA59  7F        .db $7F
  $BA5A  EE F6 14  INC $14F6
  $BA5D  0D 1B F7  ORA $F71B
  $BA60  DF        .db $DF

L_BA61:
  $BA61  F3        .db $F3
  $BA62  E1 82     SBC ($82,X)
  $BA64  04        .db $04
  $BA65  0A        ASL
  $BA66  0D 01 A3  ORA $A301
  $BA69  8C 1E 7C  STY $7C1E
  $BA6C  F8        SED
  $BA6D  F0 F2     BEQ $BA61
  $BA6F  FE D0 30  INC $30D0,X
  $BA72  18        CLC
  $BA73  18        CLC
  $BA74  8D 8E 48  STA $488E
  $BA77  30 0F     BMI $BA88
  $BA79  CF        .db $CF
  $BA7A  FF        .db $FF
  $BA7B  FF        .db $FF
  $BA7C  7E 78 30  ROR $3078,X
  $BA7F  00        BRK
  $BA80  C0 80     CPY #$80
  $BA82  80        .db $80
  $BA83  80        .db $80
  $BA84  40        RTI
  $BA85  21 1E     AND ($1E,X)

L_BA87:
  $BA87  00        BRK

L_BA88:
  $BA88  3F        .db $3F
  $BA89  7F        .db $7F
  $BA8A  7F        .db $7F
  $BA8B  7F        .db $7F
  $BA8C  3F        .db $3F
  $BA8D  1E 00 00  ASL $0000,X
  $BA90  02        .db $02
  $BA91  07        .db $07
  $BA92  1C        .db $1C
  $BA93  38        SEC
  $BA94  70 F1     BVS $BA87
  $BA96  12        .db $12
  $BA97  0C        .db $0C
  $BA98  FC        .db $FC
  $BA99  F8        SED
  $BA9A  FB        .db $FB
  $BA9B  FF        .db $FF
  $BA9C  FF        .db $FF
  $BA9D  1E 0C 00  ASL $000C,X
  $BAA0  00        BRK
  $BAA1  01 17     ORA ($17,X)
  $BAA3  57        .db $57
  $BAA4  4F        .db $4F
  $BAA5  8F        .db $8F
  $BAA6  4F        .db $4F
  $BAA7  8F        .db $8F
  $BAA8  00        BRK
  $BAA9  00        BRK
  $BAAA  09 2F     ORA #$2F
  $BAAC  3F        .db $3F
  $BAAD  7F        .db $7F
  $BAAE  3F        .db $3F
  $BAAF  7F        .db $7F
  $BAB0  0A        ASL
  $BAB1  F5 E1     SBC $E1,X
  $BAB3  E0 C0     CPX #$C0
  $BAB5  C1 D9     CMP ($D9,X)
  $BAB7  DD 00 0A  CMP $0A00,X
  $BABA  FE FF FF  INC $FFFF,X
  $BABD  FE E6 EA  INC $EAE6,X
  $BAC0  00        BRK
  $BAC1  00        BRK
  $BAC2  C0 B0     CPY #$B0
  $BAC4  8C 02 01  STY $0102
  $BAC7  C1 00     CMP ($00,X)
  $BAC9  00        BRK

L_BACA:
  $BACA  00        BRK
  $BACB  40        RTI
  $BACC  70 FC     BVS $BACA
  $BACE  FE 3E 13  INC $133E,X
  $BAD1  13        .db $13
  $BAD2  09 07     ORA #$07
  $BAD4  03        .db $03
  $BAD5  0C        .db $0C
  $BAD6  1F        .db $1F
  $BAD7  3F        .db $3F
  $BAD8  0F        .db $0F
  $BAD9  0D 07 01  ORA $0107
  $BADC  00        BRK
  $BADD  03        .db $03
  $BADE  0F        .db $0F
  $BADF  1E FB FF  ASL $FFFB,X
  $BAE2  FF        .db $FF
  $BAE3  FF        .db $FF
  $BAE4  0F        .db $0F
  $BAE5  9C        .db $9C
  $BAE6  FE FE FE  INC $FEFE,X
  $BAE9  1E 0E 6C  ASL $6C0E,X
  $BAEC  F8        SED
  $BAED  63        .db $63
  $BAEE  1F        .db $1F
  $BAEF  3D C8 84  AND $84C8,X
  $BAF2  84 84     STY $84
  $BAF4  08        PHP
  $BAF5  08        PHP
  $BAF6  18        CLC
  $BAF7  68        PLA
  $BAF8  37        .db $37
  $BAF9  7B        .db $7B
  $BAFA  7B        .db $7B
  $BAFB  7B        .db $7B
  $BAFC  F7        .db $F7
  $BAFD  F7        .db $F7
  $BAFE  E7        .db $E7
  $BAFF  97        .db $97
  $BB00  10 10     BPL $BB12
  $BB02  18        CLC

L_BB03:
  $BB03  14        .db $14
  $BB04  32        .db $32
  $BB05  31 61     AND ($61),Y
  $BB07  F9 E0 E0  SBC $E0E0,Y
  $BB0A  E0 F8     CPX #$F8
  $BB0C  FC        .db $FC
  $BB0D  FE FE 06  INC $06FE,X
  $BB10  37        .db $37
  $BB11  4F        .db $4F

L_BB12:
  $BB12  8F        .db $8F
  $BB13  CF        .db $CF
  $BB14  1F        .db $1F
  $BB15  9F        .db $9F
  $BB16  1F        .db $1F
  $BB17  BF        .db $BF
  $BB18  0B        .db $0B
  $BB19  37        .db $37
  $BB1A  7F        .db $7F
  $BB1B  3F        .db $3F
  $BB1C  F6 64     INC $64,X
  $BB1E  EE 5B F1  INC $F15B
  $BB21  F0 E0     BEQ $BB03
  $BB23  E0 EC     CPX #$EC
  $BB25  EE FF FF  INC $FFFF
  $BB28  EE FF FF  INC $FFFF
  $BB2B  FF        .db $FF
  $BB2C  F3        .db $F3
  $BB2D  75 3C     ADC $3C,X
  $BB2F  FC        .db $FC
  $BB30  80        .db $80
  $BB31  40        RTI
  $BB32  30 68     BMI $BB9C
  $BB34  24 42     BIT $42
  $BB36  C1 61     CMP ($61,X)
  $BB38  00        BRK
  $BB39  80        .db $80
  $BB3A  C0 90     CPY #$90
  $BB3C  D8        CLD
  $BB3D  BC 3E 9E  LDY $9E3E,X
  $BB40  0B        .db $0B
  $BB41  06 03     ASL $03
  $BB43  03        .db $03
  $BB44  05 08     ORA $08
  $BB46  1F        .db $1F
  $BB47  3F        .db $3F
  $BB48  04        .db $04
  $BB49  01 00     ORA ($00,X)
  $BB4B  01 02     ORA ($02,X)
  $BB4D  07        .db $07
  $BB4E  0E 1E 1F  ASL $1F1E
  $BB51  0F        .db $0F
  $BB52  EF        .db $EF
  $BB53  FF        .db $FF
  $BB54  FC        .db $FC
  $BB55  F8        SED
  $BB56  3E 7F EE  ROL $EE7F,X
  $BB59  F6 14     INC $14,X
  $BB5B  E8        INX
  $BB5C  73        .db $73
  $BB5D  07        .db $07
  $BB5E  1F        .db $1F
  $BB5F  3C        .db $3C
  $BB60  C4 C4     CPY $C4
  $BB62  84 08     STY $08
  $BB64  10 30     BPL $BB96
  $BB66  D0 08     BNE $BB70
  $BB68  3B        .db $3B
  $BB69  3B        .db $3B
  $BB6A  7B        .db $7B
  $BB6B  F7        .db $F7
  $BB6C  EF        .db $EF
  $BB6D  CF        .db $CF
  $BB6E  2F        .db $2F
  $BB6F  F7        .db $F7

L_BB70:
  $BB70  00        BRK
  $BB71  00        BRK
  $BB72  00        BRK
  $BB73  00        BRK
  $BB74  00        BRK
  $BB75  00        BRK
  $BB76  00        BRK
  $BB77  00        BRK
  $BB78  00        BRK
  $BB79  00        BRK
  $BB7A  00        BRK
  $BB7B  00        BRK
  $BB7C  00        BRK
  $BB7D  00        BRK
  $BB7E  00        BRK
  $BB7F  00        BRK
  $BB80  00        BRK
  $BB81  00        BRK
  $BB82  00        BRK
  $BB83  00        BRK
  $BB84  00        BRK
  $BB85  00        BRK
  $BB86  00        BRK
  $BB87  00        BRK
  $BB88  00        BRK
  $BB89  00        BRK
  $BB8A  00        BRK
  $BB8B  00        BRK
  $BB8C  00        BRK
  $BB8D  00        BRK
  $BB8E  00        BRK
  $BB8F  00        BRK
  $BB90  00        BRK
  $BB91  00        BRK
  $BB92  00        BRK
  $BB93  00        BRK
  $BB94  00        BRK
  $BB95  00        BRK

L_BB96:
  $BB96  00        BRK
  $BB97  00        BRK
  $BB98  00        BRK
  $BB99  00        BRK
  $BB9A  00        BRK
  $BB9B  00        BRK

L_BB9C:
  $BB9C  00        BRK
  $BB9D  00        BRK
  $BB9E  00        BRK
  $BB9F  00        BRK
  $BBA0  00        BRK
  $BBA1  00        BRK
  $BBA2  00        BRK
  $BBA3  00        BRK
  $BBA4  00        BRK
  $BBA5  00        BRK
  $BBA6  00        BRK
  $BBA7  00        BRK
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
  $BBB8  00        BRK
  $BBB9  00        BRK
  $BBBA  00        BRK
  $BBBB  00        BRK
  $BBBC  00        BRK
  $BBBD  00        BRK
  $BBBE  00        BRK
  $BBBF  00        BRK
  $BBC0  00        BRK
  $BBC1  00        BRK
  $BBC2  00        BRK
  $BBC3  00        BRK
  $BBC4  00        BRK
  $BBC5  00        BRK
  $BBC6  00        BRK
  $BBC7  00        BRK
  $BBC8  00        BRK
  $BBC9  00        BRK
  $BBCA  00        BRK
  $BBCB  00        BRK
  $BBCC  00        BRK
  $BBCD  00        BRK
  $BBCE  00        BRK
  $BBCF  00        BRK
  $BBD0  00        BRK
  $BBD1  00        BRK
  $BBD2  00        BRK
  $BBD3  00        BRK
  $BBD4  00        BRK
  $BBD5  00        BRK
  $BBD6  00        BRK
  $BBD7  00        BRK
  $BBD8  00        BRK
  $BBD9  00        BRK
  $BBDA  00        BRK
  $BBDB  00        BRK
  $BBDC  00        BRK
  $BBDD  00        BRK
  $BBDE  00        BRK
  $BBDF  00        BRK
  $BBE0  00        BRK
  $BBE1  00        BRK
  $BBE2  00        BRK
  $BBE3  00        BRK
  $BBE4  00        BRK
  $BBE5  00        BRK
  $BBE6  00        BRK
  $BBE7  00        BRK
  $BBE8  00        BRK
  $BBE9  00        BRK
  $BBEA  00        BRK
  $BBEB  00        BRK
  $BBEC  00        BRK
  $BBED  00        BRK
  $BBEE  00        BRK
  $BBEF  00        BRK
  $BBF0  00        BRK
  $BBF1  00        BRK
  $BBF2  00        BRK
  $BBF3  00        BRK
  $BBF4  00        BRK
  $BBF5  00        BRK
  $BBF6  00        BRK
  $BBF7  00        BRK
  $BBF8  00        BRK
  $BBF9  00        BRK
  $BBFA  00        BRK
  $BBFB  00        BRK
  $BBFC  00        BRK
  $BBFD  00        BRK
  $BBFE  00        BRK
  $BBFF  00        BRK
  $BC00  00        BRK
  $BC01  00        BRK
  $BC02  00        BRK
  $BC03  03        .db $03
  $BC04  07        .db $07
  $BC05  0F        .db $0F
  $BC06  1F        .db $1F
  $BC07  1F        .db $1F
  $BC08  00        BRK
  $BC09  07        .db $07
  $BC0A  1F        .db $1F
  $BC0B  3F        .db $3F
  $BC0C  3F        .db $3F
  $BC0D  7F        .db $7F
  $BC0E  7F        .db $7F
  $BC0F  7F        .db $7F
  $BC10  00        BRK
  $BC11  00        BRK
  $BC12  00        BRK
  $BC13  C0 E0     CPY #$E0
  $BC15  E0 C0     CPX #$C0
  $BC17  00        BRK
  $BC18  00        BRK
  $BC19  E0 F8     CPX #$F8
  $BC1B  FC        .db $FC
  $BC1C  FC        .db $FC
  $BC1D  FE FE FE  INC $FEFE,X
  $BC20  1E 1E 1E  ASL $1E1E,X
  $BC23  0C        .db $0C
  $BC24  00        BRK
  $BC25  00        BRK
  $BC26  00        BRK
  $BC27  00        BRK
  $BC28  7F        .db $7F
  $BC29  7F        .db $7F
  $BC2A  7F        .db $7F
  $BC2B  3F        .db $3F
  $BC2C  3F        .db $3F
  $BC2D  1F        .db $1F
  $BC2E  07        .db $07
  $BC2F  00        BRK
  $BC30  00        BRK
  $BC31  00        BRK
  $BC32  00        BRK
  $BC33  00        BRK
  $BC34  00        BRK
  $BC35  00        BRK
  $BC36  00        BRK
  $BC37  00        BRK
  $BC38  FE FE FE  INC $FEFE,X
  $BC3B  FC        .db $FC
  $BC3C  FC        .db $FC
  $BC3D  F8        SED
  $BC3E  E0 00     CPX #$00
  $BC40  00        BRK
  $BC41  07        .db $07
  $BC42  1F        .db $1F
  $BC43  3C        .db $3C
  $BC44  38        SEC
  $BC45  70 60     BVS $BCA7
  $BC47  60        RTS
  $BC48  00        BRK
  $BC49  07        .db $07
  $BC4A  1F        .db $1F
  $BC4B  3F        .db $3F
  $BC4C  3F        .db $3F
  $BC4D  7F        .db $7F
  $BC4E  7F        .db $7F
  $BC4F  7F        .db $7F
  $BC50  00        BRK
  $BC51  E0 F8     CPX #$F8
  $BC53  3C        .db $3C
  $BC54  1C        .db $1C
  $BC55  1E 3E FE  ASL $FE3E,X
  $BC58  00        BRK
  $BC59  E0 F8     CPX #$F8
  $BC5B  FC        .db $FC
  $BC5C  FC        .db $FC
  $BC5D  FE FE FE  INC $FEFE,X
  $BC60  61 61     ADC ($61,X)
  $BC62  61 33     ADC ($33,X)
  $BC64  3F        .db $3F
  $BC65  1F        .db $1F
  $BC66  07        .db $07
  $BC67  00        BRK
  $BC68  7F        .db $7F
  $BC69  7F        .db $7F
  $BC6A  7F        .db $7F
  $BC6B  3F        .db $3F
  $BC6C  3F        .db $3F
  $BC6D  1F        .db $1F
  $BC6E  07        .db $07
  $BC6F  00        BRK
  $BC70  FE FE FE  INC $FEFE,X
  $BC73  FC        .db $FC
  $BC74  FC        .db $FC
  $BC75  F8        SED
  $BC76  E0 00     CPX #$00
  $BC78  FE FE FE  INC $FEFE,X
  $BC7B  FC        .db $FC
  $BC7C  FC        .db $FC
  $BC7D  F8        SED
  $BC7E  E0 00     CPX #$00
  $BC80  00        BRK
  $BC81  00        BRK
  $BC82  78        SEI
  $BC83  3C        .db $3C
  $BC84  00        BRK
  $BC85  00        BRK
  $BC86  00        BRK
  $BC87  00        BRK
  $BC88  00        BRK
  $BC89  FC        .db $FC
  $BC8A  FE FF FF  INC $FFFF,X
  $BC8D  FE FC 00  INC $00FC,X
  $BC90  18        CLC
  $BC91  18        CLC
  $BC92  18        CLC
  $BC93  10 10     BPL $BCA5
  $BC95  10 10     BPL $BCA7
  $BC97  10 38     BPL $BCD1
  $BC99  38        SEC
  $BC9A  18        CLC
  $BC9B  18        CLC
  $BC9C  10 10     BPL $BCAE
  $BC9E  10 10     BPL $BCB0
  $BCA0  00        BRK
  $BCA1  00        BRK
  $BCA2  00        BRK
  $BCA3  10 18     BPL $BCBD

L_BCA5:
  $BCA5  18        CLC
  $BCA6  18        CLC

L_BCA7:
  $BCA7  18        CLC
  $BCA8  00        BRK
  $BCA9  10 38     BPL $BCE3
  $BCAB  38        SEC
  $BCAC  38        SEC
  $BCAD  38        SEC

L_BCAE:
  $BCAE  38        SEC
  $BCAF  38        SEC

L_BCB0:
  $BCB0  70 70     BVS $BD22
  $BCB2  A0 A0     LDY #$A0
  $BCB4  00        BRK
  $BCB5  00        BRK

L_BCB6:
  $BCB6  00        BRK
  $BCB7  00        BRK
  $BCB8  F0 70     BEQ $BD2A
  $BCBA  A0 A0     LDY #$A0
  $BCBC  00        BRK

L_BCBD:
  $BCBD  00        BRK

L_BCBE:
  $BCBE  00        BRK
  $BCBF  00        BRK
  $BCC0  0D 0D 0C  ORA $0C0D
  $BCC3  0C        .db $0C
  $BCC4  0D 0F 0E  ORA $0E0F
  $BCC7  00        BRK
  $BCC8  0D 0D 0C  ORA $0C0D
  $BCCB  0C        .db $0C
  $BCCC  0D 0F 0E  ORA $0E0F
  $BCCF  00        BRK
  $BCD0  83        .db $83

L_BCD1:
  $BCD1  A6 0C     LDX $0C
  $BCD3  98        TYA
  $BCD4  B0 E0     BCS $BCB6
  $BCD6  C0 80     CPY #$80
  $BCD8  83        .db $83
  $BCD9  A6 0C     LDX $0C
  $BCDB  98        TYA
  $BCDC  B0 E0     BCS $BCBE
  $BCDE  C0 80     CPY #$80
  $BCE0  00        BRK
  $BCE1  00        BRK
  $BCE2  00        BRK

L_BCE3:
  $BCE3  00        BRK
  $BCE4  00        BRK
  $BCE5  01 02     ORA ($02,X)
  $BCE7  04        .db $04
  $BCE8  00        BRK
  $BCE9  00        BRK
  $BCEA  00        BRK
  $BCEB  00        BRK
  $BCEC  00        BRK
  $BCED  01 02     ORA ($02,X)
  $BCEF  04        .db $04
  $BCF0  00        BRK
  $BCF1  03        .db $03
  $BCF2  1C        .db $1C
  $BCF3  60        RTS
  $BCF4  80        .db $80
  $BCF5  1E 7E 7C  ASL $7C7E,X
  $BCF8  00        BRK
  $BCF9  03        .db $03
  $BCFA  1C        .db $1C
  $BCFB  60        RTS
  $BCFC  80        .db $80
  $BCFD  1E 7E 7C  ASL $7C7E,X
  $BD00  04        .db $04
  $BD01  09 09     ORA #$09

L_BD03:
  $BD03  11 11     ORA ($11),Y
  $BD05  11 10     ORA ($10),Y
  $BD07  20 04 09  JSR $0904
  $BD0A  09 11     ORA #$11
  $BD0C  11 11     ORA ($11),Y
  $BD0E  10 20     BPL $BD30
  $BD10  F8        SED
  $BD11  F0 F0     BEQ $BD03
  $BD13  E0 C0     CPX #$C0
  $BD15  80        .db $80

L_BD16:
  $BD16  00        BRK
  $BD17  00        BRK
  $BD18  F8        SED
  $BD19  F0 F0     BEQ $BD0B
  $BD1B  E0 C0     CPX #$C0
  $BD1D  80        .db $80
  $BD1E  00        BRK
  $BD1F  00        BRK
  $BD20  20 20 20  JSR $2020
  $BD23  20 20 20  JSR $2020
  $BD26  20 10 20  JSR $2010
  $BD29  20 20 20  JSR $2020
  $BD2C  20 20 20  JSR $2020
  $BD2F  10 10     BPL $BD41
  $BD31  10 08     BPL $BD3B
  $BD33  04        .db $04
  $BD34  04        .db $04
  $BD35  02        .db $02
  $BD36  00        BRK
  $BD37  00        BRK
  $BD38  10 10     BPL $BD4A
  $BD3A  08        PHP

L_BD3B:
  $BD3B  04        .db $04
  $BD3C  04        .db $04
  $BD3D  02        .db $02
  $BD3E  00        BRK
  $BD3F  00        BRK
  $BD40  00        BRK

L_BD41:
  $BD41  03        .db $03
  $BD42  01 00     ORA ($00,X)

L_BD44:
  $BD44  02        .db $02
  $BD45  03        .db $03
  $BD46  01 00     ORA ($00,X)
  $BD48  03        .db $03
  $BD49  03        .db $03

L_BD4A:
  $BD4A  05 06     ORA $06

L_BD4C:
  $BD4C  07        .db $07
  $BD4D  03        .db $03
  $BD4E  01 00     ORA ($00,X)
  $BD50  00        BRK
  $BD51  00        BRK
  $BD52  00        BRK
  $BD53  00        BRK
  $BD54  00        BRK
  $BD55  00        BRK
  $BD56  00        BRK
  $BD57  00        BRK
  $BD58  00        BRK
  $BD59  80        .db $80
  $BD5A  C0 E0     CPY #$E0
  $BD5C  70 B8     BVS $BD16
  $BD5E  DC        .db $DC
  $BD5F  EE 00 00  INC $0000
  $BD62  00        BRK
  $BD63  00        BRK
  $BD64  00        BRK
  $BD65  00        BRK
  $BD66  00        BRK
  $BD67  00        BRK
  $BD68  77        .db $77
  $BD69  3B        .db $3B
  $BD6A  1C        .db $1C
  $BD6B  00        BRK
  $BD6C  00        BRK
  $BD6D  00        BRK
  $BD6E  00        BRK
  $BD6F  00        BRK
  $BD70  00        BRK
  $BD71  00        BRK
  $BD72  00        BRK
  $BD73  00        BRK
  $BD74  01 02     ORA ($02,X)
  $BD76  04        .db $04
  $BD77  08        PHP
  $BD78  00        BRK
  $BD79  00        BRK
  $BD7A  00        BRK
  $BD7B  00        BRK
  $BD7C  01 02     ORA ($02,X)
  $BD7E  04        .db $04
  $BD7F  08        PHP
  $BD80  00        BRK
  $BD81  0F        .db $0F
  $BD82  30 C0     BMI $BD44
  $BD84  00        BRK
  $BD85  00        BRK
  $BD86  00        BRK
  $BD87  00        BRK
  $BD88  00        BRK
  $BD89  0F        .db $0F
  $BD8A  30 C0     BMI $BD4C
  $BD8C  00        BRK
  $BD8D  00        BRK
  $BD8E  00        BRK
  $BD8F  00        BRK
  $BD90  08        PHP
  $BD91  10 10     BPL $BDA3
  $BD93  23        .db $23
  $BD94  27        .db $27
  $BD95  27        .db $27
  $BD96  4F        .db $4F
  $BD97  4E 08 10  LSR $1008
  $BD9A  10 23     BPL $BDBF
  $BD9C  27        .db $27
  $BD9D  27        .db $27
  $BD9E  4F        .db $4F
  $BD9F  4E 00 01  LSR $0100
  $BDA2  01 03     ORA ($03,X)
  $BDA4  03        .db $03
  $BDA5  03        .db $03
  $BDA6  03        .db $03
  $BDA7  07        .db $07
  $BDA8  01 06     ORA ($06,X)
  $BDAA  0F        .db $0F
  $BDAB  05 1C     ORA $1C
  $BDAD  0C        .db $0C
  $BDAE  1D 0B FC  ORA $FC0B,X
  $BDB1  FE FC FC  INC $FCFC,X
  $BDB4  FD FD FF  SBC $FFFD,X
  $BDB7  FF        .db $FF
  $BDB8  7D FF FF  ADC $FFFF,X
  $BDBB  FF        .db $FF
  $BDBC  C2        .db $C2
  $BDBD  8E C7 7F  STX $7FC7
  $BDC0  00        BRK
  $BDC1  00        BRK
  $BDC2  00        BRK
  $BDC3  00        BRK
  $BDC4  80        .db $80
  $BDC5  C0 C0     CPY #$C0

L_BDC7:
  $BDC7  C0 C0     CPY #$C0
  $BDC9  F0 FC     BEQ $BDC7
  $BDCB  F0 7C     BEQ $BE49
  $BDCD  BE B0 BC  LDX $BCB0,Y
  $BDD0  46 46     LSR $46
  $BDD2  40        RTI
  $BDD3  40        RTI
  $BDD4  40        RTI
  $BDD5  40        RTI
  $BDD6  40        RTI
  $BDD7  20 46 46  JSR $4646
  $BDDA  40        RTI
  $BDDB  40        RTI
  $BDDC  40        RTI
  $BDDD  40        RTI
  $BDDE  40        RTI
  $BDDF  20 03 02  JSR $0203
  $BDE2  01 03     ORA ($03,X)
  $BDE4  0F        .db $0F
  $BDE5  1D 1C 00  ORA $001C,X
  $BDE8  04        .db $04
  $BDE9  01 00     ORA ($00,X)
  $BDEB  01 0D     ORA ($0D,X)
  $BDED  1C        .db $1C
  $BDEE  1D 01 1F  ORA $1F01,X
  $BDF1  0F        .db $0F
  $BDF2  EF        .db $EF
  $BDF3  FE FC FF  INC $FFFC,X
  $BDF6  7E 3E EE  ROR $EE3E,X
  $BDF9  F6 14     INC $14,X
  $BDFB  E9 63     SBC #$63
  $BDFD  0C        .db $0C
  $BDFE  9D DD 80  STA $80DD,X
  $BE01  C3        .db $C3
  $BE02  33        .db $33
  $BE03  0F        .db $0F
  $BE04  8E 86 06  STX $0686
  $BE07  06 78     ASL $78
  $BE09  13        .db $13
  $BE0A  C3        .db $C3
  $BE0B  F7        .db $F7
  $BE0C  76 7A     ROR $7A,X
  $BE0E  FA        .db $FA
  $BE0F  FA        .db $FA
  $BE10  20 20 10  JSR $1020
  $BE13  10 08     BPL $BE1D
  $BE15  08        PHP
  $BE16  04        .db $04
  $BE17  02        .db $02
  $BE18  20 20 10  JSR $1020
  $BE1B  10 08     BPL $BE25

L_BE1D:
  $BE1D  08        PHP
  $BE1E  04        .db $04
  $BE1F  02        .db $02
  $BE20  01 00     ORA ($00,X)
  $BE22  00        BRK
  $BE23  00        BRK
  $BE24  00        BRK

L_BE25:
  $BE25  00        BRK
  $BE26  00        BRK
  $BE27  00        BRK
  $BE28  01 00     ORA ($00,X)
  $BE2A  00        BRK
  $BE2B  00        BRK
  $BE2C  00        BRK
  $BE2D  00        BRK
  $BE2E  00        BRK
  $BE2F  00        BRK
  $BE30  01 03     ORA ($03,X)
  $BE32  03        .db $03
  $BE33  07        .db $07
  $BE34  03        .db $03
  $BE35  07        .db $07
  $BE36  07        .db $07
  $BE37  0F        .db $0F
  $BE38  02        .db $02
  $BE39  0D 1F 09  ORA $091F
  $BE3C  3D 19 3B  AND $3B19,X
  $BE3F  16 F8     ASL $F8,X
  $BE41  FC        .db $FC
  $BE42  F8        SED
  $BE43  F8        SED
  $BE44  FB        .db $FB
  $BE45  FB        .db $FB
  $BE46  FF        .db $FF
  $BE47  FF        .db $FF
  $BE48  FB        .db $FB

L_BE49:
  $BE49  FF        .db $FF
  $BE4A  FF        .db $FF
  $BE4B  C7        .db $C7
  $BE4C  0C        .db $0C
  $BE4D  9D 8F FF  STA $FF8F,X
  $BE50  00        BRK
  $BE51  00        BRK
  $BE52  00        BRK
  $BE53  00        BRK
  $BE54  00        BRK

L_BE55:
  $BE55  80        .db $80
  $BE56  80        .db $80
  $BE57  80        .db $80
  $BE58  80        .db $80
  $BE59  E0 F8     CPX #$F8
  $BE5B  E0 F8     CPX #$F8
  $BE5D  7C        .db $7C
  $BE5E  60        RTS
  $BE5F  78        SEI
  $BE60  06 04     ASL $04
  $BE62  03        .db $03
  $BE63  07        .db $07
  $BE64  3F        .db $3F
  $BE65  63        .db $63
  $BE66  E0 E0     CPX #$E0
  $BE68  09 03     ORA #$03
  $BE6A  00        BRK
  $BE6B  03        .db $03
  $BE6C  02        .db $02
  $BE6D  60        RTS
  $BE6E  E8        INX
  $BE6F  EC 3F 1F  CPX $1F3F
  $BE72  DE FC F8  DEC $F8FC,X
  $BE75  E0 70     CPX #$70
  $BE77  70 DC     BVS $BE55
  $BE79  EC 29 D3  CPX $D329
  $BE7C  87        .db $87
  $BE7D  6F        .db $6F
  $BE7E  77        .db $77
  $BE7F  77        .db $77
  $BE80  00        BRK
  $BE81  00        BRK
  $BE82  00        BRK
  $BE83  00        BRK
  $BE84  00        BRK
  $BE85  00        BRK
  $BE86  00        BRK
  $BE87  00        BRK
  $BE88  30 00     BMI $BE8A

L_BE8A:
  $BE8A  80        .db $80
  $BE8B  C0 E0     CPY #$E0
  $BE8D  E0 F0     CPX #$F0
  $BE8F  F0 00     BEQ $BE91

L_BE91:
  $BE91  0E 1F 3F  ASL $3F1F
  $BE94  3F        .db $3F
  $BE95  3F        .db $3F
  $BE96  7F        .db $7F
  $BE97  7F        .db $7F
  $BE98  00        BRK
  $BE99  06 03     ASL $03
  $BE9B  00        BRK
  $BE9C  00        BRK
  $BE9D  00        BRK
  $BE9E  00        BRK
  $BE9F  00        BRK
  $BEA0  0E 3E FE  ASL $FE3E
  $BEA3  FE FE FF  INC $FFFE,X
  $BEA6  FF        .db $FF
  $BEA7  FE 02 02  INC $0202,X
  $BEAA  02        .db $02
  $BEAB  02        .db $02
  $BEAC  02        .db $02
  $BEAD  03        .db $03
  $BEAE  03        .db $03
  $BEAF  0E 7F FF  ASL $FF7F
  $BEB2  FD FD FE  SBC $FEFD,X
  $BEB5  7E 06 00  ROR $0006,X
  $BEB8  00        BRK
  $BEB9  00        BRK
  $BEBA  00        BRK
  $BEBB  00        BRK
  $BEBC  02        .db $02
  $BEBD  06 06     ASL $06
  $BEBF  00        BRK
  $BEC0  FC        .db $FC
  $BEC1  F0 F0     BEQ $BEB3
  $BEC3  F8        SED
  $BEC4  F8        SED
  $BEC5  F8        SED
  $BEC6  F0 60     BEQ $BF28
  $BEC8  1C        .db $1C
  $BEC9  10 10     BPL $BEDB
  $BECB  18        CLC
  $BECC  18        CLC
  $BECD  18        CLC
  $BECE  30 60     BMI $BF30
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

L_BEDB:
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

L_BF28:
  $BF28  00        BRK
  $BF29  00        BRK
  $BF2A  00        BRK
  $BF2B  00        BRK
  $BF2C  00        BRK
  $BF2D  00        BRK
  $BF2E  00        BRK
  $BF2F  00        BRK

L_BF30:
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