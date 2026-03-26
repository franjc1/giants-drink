; Mega Man 2 — PRG Bank 15
; Base address: $C000
; Size: 16384 bytes

; NMI vector:   $CFF0
; Reset vector: $FFE0
; IRQ vector:   $FFE0


L_C000:
  $C000  85 29     STA $29
  $C002  85 69     STA $69
  $C004  E6 68     INC $68
  $C006  8D F0 FF  STA $FFF0
  $C009  4A        LSR
  $C00A  8D F0 FF  STA $FFF0
  $C00D  4A        LSR
  $C00E  8D F0 FF  STA $FFF0
  $C011  4A        LSR
  $C012  8D F0 FF  STA $FFF0
  $C015  4A        LSR
  $C016  8D F0 FF  STA $FFF0
  $C019  A9 00     LDA #$00
  $C01B  85 68     STA $68
  $C01D  A5 67     LDA $67
  $C01F  D0 01     BNE $C022
  $C021  60        RTS

L_C022:
  $C022  A9 0C     LDA #$0C
  $C024  8D F0 FF  STA $FFF0
  $C027  4A        LSR
  $C028  8D F0 FF  STA $FFF0
  $C02B  4A        LSR
  $C02C  8D F0 FF  STA $FFF0
  $C02F  4A        LSR
  $C030  8D F0 FF  STA $FFF0
  $C033  4A        LSR
  $C034  8D F0 FF  STA $FFF0
  $C037  20 00 80  JSR $8000

L_C03A:
  $C03A  A6 66     LDX $66
  $C03C  F0 0A     BEQ $C048
  $C03E  BD 7F 05  LDA $057F,X
  $C041  20 03 80  JSR $8003
  $C044  C6 66     DEC $66
  $C046  D0 F2     BNE $C03A

L_C048:
  $C048  A9 00     LDA #$00
  $C04A  85 67     STA $67
  $C04C  A5 69     LDA $69
  $C04E  4C 00 C0  JMP $C000

L_C051:
  $C051  A4 66     LDY $66
  $C053  C0 10     CPY #$10
  $C055  B0 05     BCS $C05C
  $C057  99 80 05  STA $0580,Y
  $C05A  E6 66     INC $66

L_C05C:
  $C05C  60        RTS
  $C05D  8D FF 9F  STA $9FFF
  $C060  4A        LSR
  $C061  8D FF 9F  STA $9FFF
  $C064  4A        LSR
  $C065  8D FF 9F  STA $9FFF
  $C068  4A        LSR
  $C069  8D FF 9F  STA $9FFF
  $C06C  4A        LSR
  $C06D  8D FF 9F  STA $9FFF
  $C070  60        RTS
  $C071  A9 0D     LDA #$0D
  $C073  20 00 C0  JSR $C000
  $C076  20 06 80  JSR $8006
  $C079  A9 0E     LDA #$0E
  $C07B  20 00 C0  JSR $C000
  $C07E  60        RTS

L_C07F:
  $C07F  A5 23     LDA $23
  $C081  85 25     STA $25
  $C083  A5 24     LDA $24
  $C085  85 26     STA $26
  $C087  20 27 C4  JSR $C427
  $C08A  A9 00     LDA #$00
  $C08C  85 1D     STA $1D

L_C08E:
  $C08E  A5 1D     LDA $1D
  $C090  F0 FC     BEQ $C08E
  $C092  20 D7 D0  JSR $D0D7
  $C095  A5 23     LDA $23
  $C097  45 25     EOR $25
  $C099  25 23     AND $23
  $C09B  85 27     STA $27
  $C09D  A5 24     LDA $24
  $C09F  45 26     EOR $26
  $C0A1  25 24     AND $24
  $C0A3  85 28     STA $28
  $C0A5  A9 0E     LDA #$0E
  $C0A7  20 00 C0  JSR $C000
  $C0AA  60        RTS
  $C0AB  A5 23     LDA $23
  $C0AD  85 25     STA $25
  $C0AF  A5 24     LDA $24
  $C0B1  85 26     STA $26
  $C0B3  20 27 C4  JSR $C427
  $C0B6  A9 00     LDA #$00
  $C0B8  85 1D     STA $1D

L_C0BA:
  $C0BA  A5 1D     LDA $1D
  $C0BC  F0 FC     BEQ $C0BA
  $C0BE  20 D7 D0  JSR $D0D7
  $C0C1  A5 23     LDA $23
  $C0C3  45 25     EOR $25
  $C0C5  25 23     AND $23
  $C0C7  85 27     STA $27
  $C0C9  A5 24     LDA $24
  $C0CB  45 26     EOR $26
  $C0CD  25 24     AND $24
  $C0CF  85 28     STA $28
  $C0D1  A9 0D     LDA #$0D
  $C0D3  20 00 C0  JSR $C000
  $C0D6  60        RTS

L_C0D7:
  $C0D7  A5 23     LDA $23
  $C0D9  48        PHA
  $C0DA  A5 24     LDA $24
  $C0DC  48        PHA
  $C0DD  A5 27     LDA $27
  $C0DF  48        PHA
  $C0E0  A9 1E     LDA #$1E
  $C0E2  05 F8     ORA $F8
  $C0E4  85 F8     STA $F8
  $C0E6  8D 01 20  STA $2001
  $C0E9  A9 00     LDA #$00
  $C0EB  85 1D     STA $1D

L_C0ED:
  $C0ED  A5 1D     LDA $1D
  $C0EF  F0 FC     BEQ $C0ED
  $C0F1  68        PLA
  $C0F2  85 27     STA $27
  $C0F4  68        PLA
  $C0F5  85 24     STA $24
  $C0F7  68        PLA
  $C0F8  85 23     STA $23
  $C0FA  A9 0E     LDA #$0E
  $C0FC  20 00 C0  JSR $C000
  $C0FF  60        RTS

L_C100:
  $C100  48        PHA
  $C101  20 7F C0  JSR $C07F
  $C104  68        PLA
  $C105  38        SEC
  $C106  E9 01     SBC #$01
  $C108  D0 F6     BNE $C100
  $C10A  60        RTS

L_C10B:
  $C10B  A9 41     LDA #$41
  $C10D  20 51 C0  JSR $C051
  $C110  A9 FF     LDA #$FF
  $C112  20 51 C0  JSR $C051
  $C115  A5 2C     LDA $2C
  $C117  D0 65     BNE $C17E
  $C119  85 36     STA $36

L_C11B:
  $C11B  29 01     AND #$01
  $C11D  D0 47     BNE $C166
  $C11F  A5 36     LDA $36
  $C121  29 07     AND #$07
  $C123  AA        TAX
  $C124  A0 01     LDY #$01

L_C126:
  $C126  A9 25     LDA #$25
  $C128  99 0E 04  STA $040E,Y
  $C12B  A9 80     LDA #$80
  $C12D  99 2E 04  STA $042E,Y
  $C130  18        CLC
  $C131  AD 60 04  LDA $0460
  $C134  7D E0 C1  ADC $C1E0,X
  $C137  99 6E 04  STA $046E,Y
  $C13A  AD 40 04  LDA $0440
  $C13D  7D E8 C1  ADC $C1E8,X
  $C140  99 4E 04  STA $044E,Y
  $C143  AD A0 04  LDA $04A0
  $C146  7D D8 C1  ADC $C1D8,X
  $C149  99 AE 04  STA $04AE,Y
  $C14C  A9 01     LDA #$01
  $C14E  99 AE 06  STA $06AE,Y
  $C151  A9 00     LDA #$00
  $C153  99 2E 06  STA $062E,Y
  $C156  99 0E 06  STA $060E,Y
  $C159  99 6E 06  STA $066E,Y
  $C15C  99 4E 06  STA $064E,Y
  $C15F  99 8E 06  STA $068E,Y
  $C162  E8        INX
  $C163  88        DEY
  $C164  10 C0     BPL $C126

L_C166:
  $C166  20 52 C3  JSR $C352
  $C169  E6 36     INC $36
  $C16B  A5 36     LDA $36
  $C16D  C9 10     CMP #$10
  $C16F  90 AA     BCC $C11B
  $C171  4E 2E 04  LSR $042E
  $C174  4E 2F 04  LSR $042F
  $C177  20 93 C3  JSR $C393
  $C17A  A9 A0     LDA #$A0
  $C17C  D0 02     BNE $C180

L_C17E:
  $C17E  A9 E0     LDA #$E0

L_C180:
  $C180  85 36     STA $36

L_C182:
  $C182  4E 20 04  LSR $0420
  $C185  20 52 C3  JSR $C352
  $C188  C6 36     DEC $36
  $C18A  D0 F6     BNE $C182
  $C18C  A9 10     LDA #$10
  $C18E  8D 00 20  STA $2000
  $C191  A9 06     LDA #$06
  $C193  8D 01 20  STA $2001
  $C196  A5 2A     LDA $2A
  $C198  29 07     AND #$07
  $C19A  20 00 C0  JSR $C000
  $C19D  A2 00     LDX #$00
  $C19F  AD 40 04  LDA $0440

L_C1A2:
  $C1A2  DD 07 BB  CMP $BB07,X
  $C1A5  90 05     BCC $C1AC
  $C1A7  E8        INX
  $C1A8  E0 05     CPX #$05
  $C1AA  D0 F6     BNE $C1A2

L_C1AC:
  $C1AC  86 B0     STX $B0
  $C1AE  A2 FF     LDX #$FF
  $C1B0  9A        TXS
  $C1B1  A9 0E     LDA #$0E
  $C1B3  20 00 C0  JSR $C000
  $C1B6  C6 A8     DEC $A8
  $C1B8  D0 1B     BNE $C1D5
  $C1BA  A9 00     LDA #$00
  $C1BC  85 A7     STA $A7
  $C1BE  A9 0D     LDA #$0D
  $C1C0  20 00 C0  JSR $C000
  $C1C3  20 0C 80  JSR $800C
  $C1C6  A9 0E     LDA #$0E
  $C1C8  20 00 C0  JSR $C000
  $C1CB  A5 FD     LDA $FD
  $C1CD  D0 03     BNE $C1D2
  $C1CF  4C 88 80  JMP $8088

L_C1D2:
  $C1D2  4C 72 80  JMP $8072

L_C1D5:
  $C1D5  4C AB 80  JMP $80AB
  $C1D8  F8        SED
  $C1D9  08        PHP
  $C1DA  FB        .db $FB
  $C1DB  05 00     ORA $00
  $C1DD  00        BRK
  $C1DE  05 FB     ORA $FB
  $C1E0  00        BRK
  $C1E1  00        BRK
  $C1E2  FB        .db $FB
  $C1E3  05 FB     ORA $FB
  $C1E5  08        PHP
  $C1E6  FB        .db $FB
  $C1E7  05 00     ORA $00
  $C1E9  00        BRK
  $C1EA  FF        .db $FF
  $C1EB  00        BRK
  $C1EC  FF        .db $FF
  $C1ED  00        BRK
  $C1EE  FF        .db $FF
  $C1EF  00        BRK

L_C1F0:
  $C1F0  20 89 C2  JSR $C289
  $C1F3  E6 BD     INC $BD

L_C1F5:
  $C1F5  20 19 C8  JSR $C819
  $C1F8  A5 2A     LDA $2A
  $C1FA  C9 08     CMP #$08
  $C1FC  D0 11     BNE $C20F
  $C1FE  A5 37     LDA $37
  $C200  C9 03     CMP #$03
  $C202  D0 0B     BNE $C20F
  $C204  A9 00     LDA #$00
  $C206  85 BD     STA $BD
  $C208  A9 01     LDA #$01
  $C20A  85 2C     STA $2C
  $C20C  4C 0B C1  JMP $C10B

L_C20F:
  $C20F  A5 B1     LDA $B1
  $C211  C9 FF     CMP #$FF
  $C213  D0 E0     BNE $C1F5
  $C215  A9 00     LDA #$00
  $C217  85 BD     STA $BD
  $C219  A9 10     LDA #$10
  $C21B  85 F7     STA $F7
  $C21D  8D 00 20  STA $2000
  $C220  A9 06     LDA #$06
  $C222  85 F8     STA $F8
  $C224  8D 01 20  STA $2001
  $C227  A9 00     LDA #$00
  $C229  85 B0     STA $B0
  $C22B  A2 FF     LDX #$FF
  $C22D  9A        TXS
  $C22E  A9 0E     LDA #$0E
  $C230  20 00 C0  JSR $C000
  $C233  A6 2A     LDX $2A
  $C235  E0 08     CPX #$08
  $C237  B0 28     BCS $C261
  $C239  BD 79 C2  LDA $C279,X
  $C23C  05 9A     ORA $9A
  $C23E  85 9A     STA $9A
  $C240  BD 81 C2  LDA $C281,X
  $C243  05 9B     ORA $9B
  $C245  85 9B     STA $9B
  $C247  A9 0D     LDA #$0D
  $C249  20 00 C0  JSR $C000
  $C24C  20 12 80  JSR $8012
  $C24F  A9 0E     LDA #$0E
  $C251  20 00 C0  JSR $C000
  $C254  A5 9A     LDA $9A
  $C256  C9 FF     CMP #$FF
  $C258  F0 03     BEQ $C25D
  $C25A  4C 76 80  JMP $8076

L_C25D:
  $C25D  A9 07     LDA #$07
  $C25F  85 2A     STA $2A

L_C261:
  $C261  E6 2A     INC $2A
  $C263  A5 2A     LDA $2A
  $C265  C9 0E     CMP #$0E
  $C267  D0 0D     BNE $C276
  $C269  A9 0D     LDA #$0D
  $C26B  20 00 C0  JSR $C000
  $C26E  20 0F 80  JSR $800F
  $C271  A9 0E     LDA #$0E
  $C273  4C D1 F2  JMP $F2D1

L_C276:
  $C276  4C 79 80  JMP $8079
  $C279  01 02     ORA ($02,X)
  $C27B  04        .db $04
  $C27C  08        PHP
  $C27D  10 20     BPL $C29F
  $C27F  40        RTI
  $C280  80        .db $80
  $C281  01 02     ORA ($02,X)
  $C283  00        BRK
  $C284  00        BRK
  $C285  00        BRK
  $C286  04        .db $04
  $C287  00        BRK
  $C288  00        BRK

L_C289:
  $C289  A9 00     LDA #$00
  $C28B  8D AA 05  STA $05AA
  $C28E  8D A7 05  STA $05A7
  $C291  8D A9 05  STA $05A9
  $C294  8D A8 05  STA $05A8
  $C297  85 AA     STA $AA
  $C299  A9 FE     LDA #$FE
  $C29B  85 B1     STA $B1
  $C29D  60        RTS
  $C29E  A9 00     LDA #$00
  $C2A0  85 FD     STA $FD
  $C2A2  A9 02     LDA #$02
  $C2A4  8D 54 03  STA $0354
  $C2A7  A9 04     LDA #$04
  $C2A9  8D 55 03  STA $0355
  $C2AC  A9 BB     LDA #$BB
  $C2AE  85 FD     STA $FD

L_C2B0:
  $C2B0  20 86 C3  JSR $C386
  $C2B3  C6 FD     DEC $FD
  $C2B5  D0 F9     BNE $C2B0
  $C2B7  A9 00     LDA #$00
  $C2B9  8D 55 03  STA $0355
  $C2BC  8D 54 03  STA $0354
  $C2BF  A2 02     LDX #$02

L_C2C1:
  $C2C1  BD 21 C3  LDA $C321,X
  $C2C4  9D 57 03  STA $0357,X
  $C2C7  CA        DEX
  $C2C8  10 F7     BPL $C2C1
  $C2CA  A9 86     LDA #$86
  $C2CC  85 FF     STA $FF
  $C2CE  A9 00     LDA #$00
  $C2D0  85 FE     STA $FE

L_C2D2:
  $C2D2  A9 09     LDA #$09
  $C2D4  20 00 C0  JSR $C000
  $C2D7  A5 FD     LDA $FD
  $C2D9  4A        LSR
  $C2DA  AA        TAX
  $C2DB  BD 24 C3  LDA $C324,X
  $C2DE  8D B6 03  STA $03B6
  $C2E1  BD 3B C3  LDA $C33B,X
  $C2E4  8D B7 03  STA $03B7
  $C2E7  A5 FD     LDA $FD
  $C2E9  29 01     AND #$01
  $C2EB  F0 08     BEQ $C2F5
  $C2ED  AD B7 03  LDA $03B7
  $C2F0  09 20     ORA #$20
  $C2F2  8D B7 03  STA $03B7

L_C2F5:
  $C2F5  A0 20     LDY #$20

L_C2F7:
  $C2F7  B1 FE     LDA ($FE),Y
  $C2F9  99 B8 03  STA $03B8,Y
  $C2FC  88        DEY
  $C2FD  10 F8     BPL $C2F7
  $C2FF  A9 20     LDA #$20
  $C301  85 47     STA $47
  $C303  18        CLC
  $C304  A5 FE     LDA $FE
  $C306  69 20     ADC #$20
  $C308  85 FE     STA $FE
  $C30A  A5 FF     LDA $FF
  $C30C  69 00     ADC #$00
  $C30E  85 FF     STA $FF
  $C310  20 86 C3  JSR $C386
  $C313  E6 FD     INC $FD
  $C315  A5 FD     LDA $FD
  $C317  C9 2E     CMP #$2E
  $C319  D0 B7     BNE $C2D2
  $C31B  A9 0E     LDA #$0E
  $C31D  20 00 C0  JSR $C000
  $C320  60        RTS
  $C321  28        PLP
  $C322  18        CLC
  $C323  2C 10 1A  BIT $1A10
  $C326  1A        .db $1A
  $C327  1B        .db $1B
  $C328  1B        .db $1B
  $C329  1B        .db $1B
  $C32A  1B        .db $1B
  $C32B  1C        .db $1C
  $C32C  1C        .db $1C
  $C32D  1C        .db $1C
  $C32E  1C        .db $1C
  $C32F  1D 1D 1D  ORA $1D1D,X
  $C332  1D 1E 1E  ORA $1E1E,X
  $C335  1E 1E 1F  ASL $1F1E,X
  $C338  1F        .db $1F
  $C339  1F        .db $1F
  $C33A  1F        .db $1F
  $C33B  00        BRK
  $C33C  80        .db $80
  $C33D  C0 00     CPY #$00
  $C33F  40        RTI
  $C340  80        .db $80
  $C341  C0 00     CPY #$00
  $C343  40        RTI
  $C344  80        .db $80
  $C345  C0 00     CPY #$00
  $C347  40        RTI
  $C348  80        .db $80
  $C349  C0 00     CPY #$00
  $C34B  40        RTI
  $C34C  80        .db $80
  $C34D  C0 00     CPY #$00
  $C34F  40        RTI
  $C350  80        .db $80
  $C351  C0 A9     CPY #$A9
  $C353  0E 20 00  ASL $0020
  $C356  C0 A9     CPY #$A9
  $C358  00        BRK
  $C359  8D 80 06  STA $0680
  $C35C  A9 01     LDA #$01
  $C35E  85 4B     STA $4B
  $C360  20 D0 DC  JSR $DCD0
  $C363  20 58 D6  JSR $D658
  $C366  20 A9 C5  JSR $C5A9
  $C369  20 5B 92  JSR $925B

L_C36C:
  $C36C  20 77 CC  JSR $CC77
  $C36F  A5 FB     LDA $FB
  $C371  F0 0F     BEQ $C382
  $C373  E6 FC     INC $FC
  $C375  C5 FC     CMP $FC
  $C377  F0 02     BEQ $C37B
  $C379  B0 07     BCS $C382

L_C37B:
  $C37B  20 D7 C0  JSR $C0D7
  $C37E  A9 00     LDA #$00
  $C380  85 FC     STA $FC

L_C382:
  $C382  20 7F C0  JSR $C07F
  $C385  60        RTS

L_C386:
  $C386  A2 1F     LDX #$1F
  $C388  A9 00     LDA #$00

L_C38A:
  $C38A  9D 80 06  STA $0680,X
  $C38D  CA        DEX
  $C38E  10 FA     BPL $C38A
  $C390  4C 6C C3  JMP $C36C

L_C393:
  $C393  AD 40 04  LDA $0440
  $C396  85 09     STA $09
  $C398  AD 60 04  LDA $0460
  $C39B  85 08     STA $08
  $C39D  AD A0 04  LDA $04A0
  $C3A0  85 0A     STA $0A
  $C3A2  A9 25     LDA #$25
  $C3A4  85 0B     STA $0B
  $C3A6  A2 0D     LDX #$0D
  $C3A8  A0 0B     LDY #$0B

L_C3AA:
  $C3AA  A9 80     LDA #$80
  $C3AC  19 1B C4  ORA $C41B,Y
  $C3AF  9D 20 04  STA $0420,X
  $C3B2  A5 0B     LDA $0B
  $C3B4  9D 00 04  STA $0400,X
  $C3B7  A5 09     LDA $09
  $C3B9  9D 40 04  STA $0440,X
  $C3BC  A5 08     LDA $08
  $C3BE  9D 60 04  STA $0460,X
  $C3C1  A5 0A     LDA $0A
  $C3C3  9D A0 04  STA $04A0,X
  $C3C6  B9 EB C3  LDA $C3EB,Y
  $C3C9  9D 20 06  STA $0620,X
  $C3CC  B9 F7 C3  LDA $C3F7,Y
  $C3CF  9D 00 06  STA $0600,X
  $C3D2  B9 03 C4  LDA $C403,Y
  $C3D5  9D 60 06  STA $0660,X
  $C3D8  B9 0F C4  LDA $C40F,Y
  $C3DB  9D 40 06  STA $0640,X
  $C3DE  A9 00     LDA #$00
  $C3E0  9D 80 06  STA $0680,X
  $C3E3  9D A0 06  STA $06A0,X
  $C3E6  CA        DEX
  $C3E7  88        DEY
  $C3E8  10 C0     BPL $C3AA
  $C3EA  60        RTS
  $C3EB  00        BRK
  $C3EC  00        BRK
  $C3ED  00        BRK
  $C3EE  00        BRK
  $C3EF  60        RTS
  $C3F0  60        RTS
  $C3F1  60        RTS
  $C3F2  60        RTS
  $C3F3  00        BRK
  $C3F4  C0 00     CPY #$00
  $C3F6  E0 00     CPX #$00
  $C3F8  02        .db $02
  $C3F9  00        BRK
  $C3FA  02        .db $02
  $C3FB  01 01     ORA ($01,X)
  $C3FD  01 01     ORA ($01,X)
  $C3FF  00        BRK
  $C400  00        BRK
  $C401  00        BRK
  $C402  00        BRK
  $C403  00        BRK
  $C404  00        BRK
  $C405  00        BRK
  $C406  00        BRK
  $C407  60        RTS
  $C408  A0 A0     LDY #$A0
  $C40A  60        RTS
  $C40B  C0 00     CPY #$00
  $C40D  40        RTI
  $C40E  00        BRK
  $C40F  02        .db $02
  $C410  00        BRK
  $C411  FE 00 01  INC $0100,X
  $C414  FE FE 01  INC $01FE,X
  $C417  00        BRK
  $C418  00        BRK
  $C419  FF        .db $FF
  $C41A  00        BRK
  $C41B  00        BRK
  $C41C  40        RTI
  $C41D  00        BRK
  $C41E  00        BRK
  $C41F  40        RTI
  $C420  40        RTI
  $C421  00        BRK
  $C422  00        BRK
  $C423  00        BRK
  $C424  40        RTI
  $C425  00        BRK
  $C426  00        BRK

L_C427:
  $C427  A5 AA     LDA $AA
  $C429  D0 31     BNE $C45C
  $C42B  AD 55 03  LDA $0355
  $C42E  F0 2C     BEQ $C45C
  $C430  E6 44     INC $44
  $C432  C5 44     CMP $44
  $C434  B0 26     BCS $C45C
  $C436  A9 00     LDA #$00
  $C438  85 44     STA $44
  $C43A  E6 43     INC $43
  $C43C  A5 43     LDA $43
  $C43E  CD 54 03  CMP $0354
  $C441  90 04     BCC $C447
  $C443  A9 00     LDA #$00
  $C445  85 43     STA $43

L_C447:
  $C447  0A        ASL
  $C448  0A        ASL
  $C449  0A        ASL
  $C44A  0A        ASL
  $C44B  AA        TAX
  $C44C  A0 00     LDY #$00

L_C44E:
  $C44E  BD 76 03  LDA $0376,X
  $C451  99 56 03  STA $0356,Y
  $C454  E8        INX
  $C455  C8        INY
  $C456  C0 10     CPY #$10
  $C458  D0 F4     BNE $C44E
  $C45A  E6 3A     INC $3A

L_C45C:
  $C45C  60        RTS
  $C45D  A5 2A     LDA $2A
  $C45F  29 07     AND #$07
  $C461  20 00 C0  JSR $C000
  $C464  A9 00     LDA #$00
  $C466  85 0A     STA $0A
  $C468  A9 BC     LDA #$BC
  $C46A  85 0B     STA $0B
  $C46C  A5 2A     LDA $2A
  $C46E  29 08     AND #$08
  $C470  F0 02     BEQ $C474
  $C472  E6 0B     INC $0B

L_C474:
  $C474  A0 00     LDY #$00
  $C476  B1 0A     LDA ($0A),Y
  $C478  85 00     STA $00
  $C47A  A9 00     LDA #$00
  $C47C  8D 06 20  STA $2006
  $C47F  8D 06 20  STA $2006
  $C482  85 08     STA $08
  $C484  C8        INY
  $C485  84 01     STY $01

L_C487:
  $C487  A4 01     LDY $01
  $C489  B1 0A     LDA ($0A),Y
  $C48B  85 09     STA $09
  $C48D  C8        INY
  $C48E  B1 0A     LDA ($0A),Y
  $C490  85 02     STA $02
  $C492  C8        INY
  $C493  B1 0A     LDA ($0A),Y
  $C495  C8        INY
  $C496  84 01     STY $01
  $C498  20 00 C0  JSR $C000

L_C49B:
  $C49B  A0 00     LDY #$00

L_C49D:
  $C49D  B1 08     LDA ($08),Y
  $C49F  8D 07 20  STA $2007
  $C4A2  C8        INY
  $C4A3  D0 F8     BNE $C49D
  $C4A5  E6 09     INC $09
  $C4A7  C6 02     DEC $02
  $C4A9  D0 F0     BNE $C49B
  $C4AB  A5 2A     LDA $2A
  $C4AD  29 07     AND #$07
  $C4AF  20 00 C0  JSR $C000
  $C4B2  C6 00     DEC $00
  $C4B4  D0 D1     BNE $C487
  $C4B6  E6 0B     INC $0B
  $C4B8  E6 0B     INC $0B
  $C4BA  A0 61     LDY #$61

L_C4BC:
  $C4BC  B1 0A     LDA ($0A),Y
  $C4BE  99 54 03  STA $0354,Y
  $C4C1  88        DEY
  $C4C2  10 F8     BPL $C4BC
  $C4C4  20 F5 D0  JSR $D0F5
  $C4C7  A9 0E     LDA #$0E
  $C4C9  20 00 C0  JSR $C000
  $C4CC  60        RTS
  $C4CD  A5 2A     LDA $2A
  $C4CF  29 07     AND #$07
  $C4D1  20 00 C0  JSR $C000
  $C4D4  A4 B0     LDY $B0
  $C4D6  B9 06 BB  LDA $BB06,Y
  $C4D9  85 20     STA $20
  $C4DB  8D 40 04  STA $0440
  $C4DE  B9 0C BB  LDA $BB0C,Y
  $C4E1  85 48     STA $48
  $C4E3  85 49     STA $49
  $C4E5  B9 12 BB  LDA $BB12,Y
  $C4E8  85 4C     STA $4C
  $C4EA  85 4D     STA $4D
  $C4EC  B9 18 BB  LDA $BB18,Y
  $C4EF  85 17     STA $17
  $C4F1  B9 1E BB  LDA $BB1E,Y
  $C4F4  85 16     STA $16
  $C4F6  B9 24 BB  LDA $BB24,Y
  $C4F9  85 19     STA $19
  $C4FB  B9 2A BB  LDA $BB2A,Y
  $C4FE  85 18     STA $18
  $C500  B9 30 BB  LDA $BB30,Y
  $C503  85 38     STA $38
  $C505  B9 36 BB  LDA $BB36,Y
  $C508  85 14     STA $14
  $C50A  B9 3C BB  LDA $BB3C,Y
  $C50D  85 15     STA $15
  $C50F  A6 38     LDX $38
  $C511  20 64 CB  JSR $CB64
  $C514  98        TYA
  $C515  18        CLC
  $C516  69 0B     ADC #$0B
  $C518  A8        TAY
  $C519  A2 0C     LDX #$0C

L_C51B:
  $C51B  B9 60 B4  LDA $B460,Y
  $C51E  48        PHA
  $C51F  88        DEY
  $C520  CA        DEX
  $C521  D0 F8     BNE $C51B
  $C523  A9 0A     LDA #$0A
  $C525  8D 06 20  STA $2006
  $C528  A9 00     LDA #$00
  $C52A  8D 06 20  STA $2006
  $C52D  85 08     STA $08
  $C52F  A9 06     LDA #$06
  $C531  85 00     STA $00

L_C533:
  $C533  68        PLA
  $C534  85 09     STA $09
  $C536  68        PLA
  $C537  20 00 C0  JSR $C000
  $C53A  A0 00     LDY #$00

L_C53C:
  $C53C  B1 08     LDA ($08),Y
  $C53E  8D 07 20  STA $2007
  $C541  C8        INY
  $C542  D0 F8     BNE $C53C
  $C544  C6 00     DEC $00
  $C546  D0 EB     BNE $C533
  $C548  A9 0E     LDA #$0E
  $C54A  20 00 C0  JSR $C000
  $C54D  A5 B0     LDA $B0
  $C54F  C9 02     CMP #$02
  $C551  D0 03     BNE $C556
  $C553  20 15 91  JSR $9115

L_C556:
  $C556  60        RTS
  $C557  A9 0D     LDA #$0D
  $C559  20 00 C0  JSR $C000
  $C55C  20 09 80  JSR $8009
  $C55F  A9 0E     LDA #$0E
  $C561  20 00 C0  JSR $C000
  $C564  60        RTS
  $C565  A9 0D     LDA #$0D
  $C567  20 00 C0  JSR $C000
  $C56A  20 00 80  JSR $8000
  $C56D  A9 0E     LDA #$0E
  $C56F  20 00 C0  JSR $C000
  $C572  60        RTS
  $C573  A2 0F     LDX #$0F

L_C575:
  $C575  BD 20 04  LDA $0420,X
  $C578  30 2E     BMI $C5A8
  $C57A  CA        DEX
  $C57B  E0 01     CPX #$01
  $C57D  D0 F6     BNE $C575
  $C57F  A5 47     LDA $47
  $C581  F0 03     BEQ $C586
  $C583  20 7F C0  JSR $C07F

L_C586:
  $C586  AD B6 03  LDA $03B6
  $C589  48        PHA
  $C58A  AD B7 03  LDA $03B7
  $C58D  48        PHA
  $C58E  A9 32     LDA #$32
  $C590  20 51 C0  JSR $C051
  $C593  A9 0D     LDA #$0D
  $C595  20 00 C0  JSR $C000
  $C598  20 03 80  JSR $8003
  $C59B  68        PLA
  $C59C  8D B7 03  STA $03B7
  $C59F  68        PLA
  $C5A0  8D B6 03  STA $03B6
  $C5A3  A9 0E     LDA #$0E
  $C5A5  20 00 C0  JSR $C000

L_C5A8:
  $C5A8  60        RTS

L_C5A9:
  $C5A9  A5 B1     LDA $B1
  $C5AB  F0 43     BEQ $C5F0
  $C5AD  A9 0B     LDA #$0B
  $C5AF  20 00 C0  JSR $C000
  $C5B2  20 03 80  JSR $8003
  $C5B5  A9 0E     LDA #$0E
  $C5B7  20 00 C0  JSR $C000
  $C5BA  AD AA 05  LDA $05AA
  $C5BD  F0 31     BEQ $C5F0
  $C5BF  A5 2A     LDA $2A
  $C5C1  C9 0C     CMP #$0C
  $C5C3  D0 28     BNE $C5ED
  $C5C5  A5 BC     LDA $BC
  $C5C7  C9 FF     CMP #$FF
  $C5C9  F0 22     BEQ $C5ED
  $C5CB  A2 0F     LDX #$0F

L_C5CD:
  $C5CD  5E 30 04  LSR $0430,X
  $C5D0  CA        DEX
  $C5D1  10 FA     BPL $C5CD
  $C5D3  20 89 C2  JSR $C289
  $C5D6  A9 00     LDA #$00
  $C5D8  85 2B     STA $2B
  $C5DA  A9 7D     LDA #$7D
  $C5DC  A2 0F     LDX #$0F
  $C5DE  20 60 F1  JSR $F160
  $C5E1  A9 20     LDA #$20
  $C5E3  8D 7F 04  STA $047F
  $C5E6  A9 AB     LDA #$AB
  $C5E8  8D BF 04  STA $04BF
  $C5EB  D0 03     BNE $C5F0

L_C5ED:
  $C5ED  4C F0 C1  JMP $C1F0

L_C5F0:
  $C5F0  60        RTS
  $C5F1  48        PHA
  $C5F2  AD A7 05  LDA $05A7
  $C5F5  85 09     STA $09
  $C5F7  AD A9 05  LDA $05A9
  $C5FA  85 08     STA $08
  $C5FC  68        PLA
  $C5FD  20 0C C7  JSR $C70C
  $C600  18        CLC
  $C601  AD B7 03  LDA $03B7
  $C604  69 20     ADC #$20
  $C606  8D B7 03  STA $03B7
  $C609  AD B6 03  LDA $03B6
  $C60C  69 00     ADC #$00
  $C60E  8D B6 03  STA $03B6
  $C611  18        CLC
  $C612  AD A9 05  LDA $05A9
  $C615  69 20     ADC #$20
  $C617  8D A9 05  STA $05A9
  $C61A  AD A7 05  LDA $05A7
  $C61D  69 00     ADC #$00
  $C61F  8D A7 05  STA $05A7
  $C622  A9 0B     LDA #$0B
  $C624  20 00 C0  JSR $C000
  $C627  60        RTS
  $C628  20 00 C0  JSR $C000
  $C62B  A9 00     LDA #$00
  $C62D  85 08     STA $08
  $C62F  A2 04     LDX #$04

L_C631:
  $C631  B1 08     LDA ($08),Y
  $C633  8D 07 20  STA $2007
  $C636  C8        INY
  $C637  D0 F8     BNE $C631
  $C639  E6 09     INC $09
  $C63B  CA        DEX
  $C63C  D0 F3     BNE $C631
  $C63E  A9 0D     LDA #$0D
  $C640  20 00 C0  JSR $C000
  $C643  60        RTS
  $C644  85 00     STA $00
  $C646  AA        TAX
  $C647  BD 89 C6  LDA $C689,X
  $C64A  85 01     STA $01
  $C64C  BD 90 C6  LDA $C690,X
  $C64F  85 02     STA $02
  $C651  A9 00     LDA #$00
  $C653  85 08     STA $08
  $C655  8D 06 20  STA $2006
  $C658  8D 06 20  STA $2006

L_C65B:
  $C65B  A6 02     LDX $02
  $C65D  BD BE C6  LDA $C6BE,X
  $C660  85 09     STA $09
  $C662  BD E5 C6  LDA $C6E5,X
  $C665  85 03     STA $03
  $C667  BD 97 C6  LDA $C697,X
  $C66A  20 00 C0  JSR $C000
  $C66D  A0 00     LDY #$00

L_C66F:
  $C66F  B1 08     LDA ($08),Y
  $C671  8D 07 20  STA $2007
  $C674  C8        INY
  $C675  D0 F8     BNE $C66F
  $C677  E6 09     INC $09
  $C679  C6 03     DEC $03
  $C67B  D0 F2     BNE $C66F
  $C67D  E6 02     INC $02
  $C67F  C6 01     DEC $01
  $C681  D0 D8     BNE $C65B
  $C683  A9 0D     LDA #$0D
  $C685  20 00 C0  JSR $C000
  $C688  60        RTS
  $C689  02        .db $02
  $C68A  02        .db $02
  $C68B  03        .db $03
  $C68C  06 0E     ASL $0E
  $C68E  04        .db $04
  $C68F  08        PHP
  $C690  00        BRK
  $C691  02        .db $02
  $C692  04        .db $04
  $C693  07        .db $07
  $C694  0D 1B 1F  ORA $1F1B
  $C697  05 08     ORA $08
  $C699  06 09     ASL $09
  $C69B  06 00     ASL $00
  $C69D  09 00     ORA #$00
  $C69F  09 08     ORA #$08
  $C6A1  09 08     ORA #$08
  $C6A3  09 03     ORA #$03
  $C6A5  03        .db $03
  $C6A6  04        .db $04
  $C6A7  04        .db $04
  $C6A8  06 04     ASL $04
  $C6AA  05 05     ORA $05
  $C6AC  05 07     ORA $07
  $C6AE  07        .db $07
  $C6AF  02        .db $02
  $C6B0  08        PHP
  $C6B1  07        .db $07
  $C6B2  05 08     ORA $08
  $C6B4  09 08     ORA #$08
  $C6B6  00        BRK
  $C6B7  06 07     ASL $07
  $C6B9  07        .db $07
  $C6BA  07        .db $07
  $C6BB  02        .db $02
  $C6BC  02        .db $02
  $C6BD  09 90     ORA #$90
  $C6BF  88        DEY
  $C6C0  90 90     BCC $C652
  $C6C2  90 98     BCC $C65C
  $C6C4  A0 98     LDY #$98
  $C6C6  AC 80 AC  LDY $AC80
  $C6C9  84 9F     STY $9F
  $C6CB  99 9C 9D  STA $9D9C,Y
  $C6CE  9B        .db $9B
  $C6CF  B2        .db $B2
  $C6D0  97        .db $97
  $C6D1  93        .db $93
  $C6D2  96 9C     STX $9C,Y
  $C6D4  9D 9F 95  STA $959F,X
  $C6D7  A4 B2     LDY $B2
  $C6D9  90 88     BCC $C663
  $C6DB  9F        .db $9F
  $C6DC  8C 98 B2  STY $B298
  $C6DF  9D 9F AE  STA $AE9F,X
  $C6E2  96 94     STX $94,Y
  $C6E4  AC 10 10  LDY $1010
  $C6E7  10 10     BPL $C6F9
  $C6E9  08        PHP
  $C6EA  08        PHP
  $C6EB  10 0E     BPL $C6FB
  $C6ED  02        .db $02
  $C6EE  04        .db $04
  $C6EF  02        .db $02
  $C6F0  04        .db $04
  $C6F1  06 02     ASL $02
  $C6F3  01 01     ORA ($01,X)
  $C6F5  01 02     ORA ($02,X)
  $C6F7  01 01     ORA ($01,X)

L_C6F9:
  $C6F9  02        .db $02
  $C6FA  01 01     ORA ($01,X)
  $C6FC  01 02     ORA ($02,X)
  $C6FE  0C        .db $0C
  $C6FF  02        .db $02
  $C700  10 03     BPL $C705
  $C702  01 0C     ORA ($0C,X)
  $C704  08        PHP

L_C705:
  $C705  01 01     ORA ($01,X)
  $C707  01 01     ORA ($01,X)
  $C709  01 01     ORA ($01,X)
  $C70B  02        .db $02

L_C70C:
  $C70C  20 00 C0  JSR $C000
  $C70F  A0 1F     LDY #$1F

L_C711:
  $C711  B1 08     LDA ($08),Y
  $C713  99 B8 03  STA $03B8,Y
  $C716  88        DEY
  $C717  10 F8     BPL $C711
  $C719  A9 20     LDA #$20
  $C71B  85 47     STA $47
  $C71D  A9 0D     LDA #$0D
  $C71F  20 00 C0  JSR $C000
  $C722  60        RTS
  $C723  A9 01     LDA #$01
  $C725  20 00 C0  JSR $C000
  $C728  A2 1F     LDX #$1F

L_C72A:
  $C72A  BD D0 9C  LDA $9CD0,X
  $C72D  9D B8 03  STA $03B8,X
  $C730  CA        DEX
  $C731  10 F7     BPL $C72A
  $C733  A9 08     LDA #$08
  $C735  8D B6 03  STA $03B6
  $C738  A9 00     LDA #$00
  $C73A  8D B7 03  STA $03B7
  $C73D  A9 20     LDA #$20
  $C73F  85 47     STA $47
  $C741  A9 0D     LDA #$0D
  $C743  20 00 C0  JSR $C000
  $C746  60        RTS
  $C747  A9 09     LDA #$09
  $C749  20 00 C0  JSR $C000
  $C74C  A0 1F     LDY #$1F

L_C74E:
  $C74E  B1 FE     LDA ($FE),Y
  $C750  99 B8 03  STA $03B8,Y
  $C753  88        DEY
  $C754  10 F8     BPL $C74E
  $C756  A9 20     LDA #$20
  $C758  85 47     STA $47
  $C75A  A9 0D     LDA #$0D
  $C75C  20 00 C0  JSR $C000
  $C75F  60        RTS
  $C760  A5 FD     LDA $FD
  $C762  85 09     STA $09
  $C764  A9 00     LDA #$00
  $C766  46 09     LSR $09
  $C768  6A        ROR
  $C769  46 09     LSR $09
  $C76B  6A        ROR
  $C76C  46 09     LSR $09
  $C76E  6A        ROR
  $C76F  8D B7 03  STA $03B7
  $C772  85 08     STA $08
  $C774  A5 FD     LDA $FD
  $C776  C9 08     CMP #$08
  $C778  90 05     BCC $C77F
  $C77A  A5 09     LDA $09
  $C77C  4C 83 C7  JMP $C783

L_C77F:
  $C77F  A5 09     LDA $09
  $C781  69 09     ADC #$09

L_C783:
  $C783  8D B6 03  STA $03B6
  $C786  18        CLC
  $C787  98        TYA
  $C788  65 09     ADC $09
  $C78A  85 09     STA $09
  $C78C  8A        TXA
  $C78D  20 00 C0  JSR $C000
  $C790  A0 1F     LDY #$1F

L_C792:
  $C792  B1 08     LDA ($08),Y
  $C794  99 B8 03  STA $03B8,Y
  $C797  88        DEY
  $C798  10 F8     BPL $C792
  $C79A  A9 20     LDA #$20
  $C79C  85 47     STA $47
  $C79E  A9 0D     LDA #$0D
  $C7A0  20 00 C0  JSR $C000
  $C7A3  60        RTS
  $C7A4  A5 2A     LDA $2A
  $C7A6  29 07     AND #$07
  $C7A8  20 00 C0  JSR $C000
  $C7AB  B9 00 B4  LDA $B400,Y
  $C7AE  A8        TAY
  $C7AF  A9 0E     LDA #$0E
  $C7B1  20 00 C0  JSR $C000
  $C7B4  60        RTS
  $C7B5  A9 C0     LDA #$C0
  $C7B7  8D 20 04  STA $0420
  $C7BA  A9 80     LDA #$80
  $C7BC  8D 60 04  STA $0460
  $C7BF  A9 14     LDA #$14
  $C7C1  8D A0 04  STA $04A0
  $C7C4  A9 1A     LDA #$1A
  $C7C6  8D 00 04  STA $0400

L_C7C9:
  $C7C9  A5 2A     LDA $2A
  $C7CB  29 07     AND #$07
  $C7CD  20 00 C0  JSR $C000
  $C7D0  A9 00     LDA #$00
  $C7D2  8D 80 06  STA $0680
  $C7D5  8D A0 06  STA $06A0
  $C7D8  18        CLC
  $C7D9  AD A0 04  LDA $04A0
  $C7DC  69 10     ADC #$10
  $C7DE  8D A0 04  STA $04A0
  $C7E1  A6 B0     LDX $B0
  $C7E3  DD 00 BB  CMP $BB00,X
  $C7E6  F0 09     BEQ $C7F1
  $C7E8  20 77 CC  JSR $CC77
  $C7EB  20 7F C0  JSR $C07F
  $C7EE  4C C9 C7  JMP $C7C9

L_C7F1:
  $C7F1  A9 30     LDA #$30
  $C7F3  20 51 C0  JSR $C051
  $C7F6  A9 00     LDA #$00
  $C7F8  85 2C     STA $2C
  $C7FA  85 3E     STA $3E
  $C7FC  85 3F     STA $3F
  $C7FE  A9 40     LDA #$40
  $C800  85 42     STA $42
  $C802  A9 0E     LDA #$0E
  $C804  20 00 C0  JSR $C000
  $C807  60        RTS
  $C808  A5 2A     LDA $2A
  $C80A  85 B3     STA $B3
  $C80C  A9 0B     LDA #$0B
  $C80E  20 00 C0  JSR $C000
  $C811  20 00 80  JSR $8000
  $C814  A9 0E     LDA #$0E
  $C816  20 00 C0  JSR $C000

L_C819:
  $C819  A9 00     LDA #$00
  $C81B  85 23     STA $23
  $C81D  85 27     STA $27
  $C81F  20 EE 84  JSR $84EE
  $C822  20 D0 DC  JSR $DCD0
  $C825  20 58 D6  JSR $D658
  $C828  20 A9 C5  JSR $C5A9
  $C82B  20 5B 92  JSR $925B
  $C82E  20 77 CC  JSR $CC77
  $C831  A5 FB     LDA $FB
  $C833  F0 0F     BEQ $C844
  $C835  E6 FC     INC $FC
  $C837  C5 FC     CMP $FC
  $C839  F0 02     BEQ $C83D
  $C83B  B0 07     BCS $C844

L_C83D:
  $C83D  20 D7 C0  JSR $C0D7
  $C840  A9 00     LDA #$00
  $C842  85 FC     STA $FC

L_C844:
  $C844  20 7F C0  JSR $C07F
  $C847  A5 B1     LDA $B1
  $C849  C9 02     CMP #$02
  $C84B  90 CC     BCC $C819
  $C84D  60        RTS

L_C84E:
  $C84E  A9 00     LDA #$00
  $C850  85 03     STA $03
  $C852  85 04     STA $04
  $C854  A5 01     LDA $01
  $C856  05 02     ORA $02
  $C858  D0 03     BNE $C85D
  $C85A  85 03     STA $03
  $C85C  60        RTS

L_C85D:
  $C85D  A0 08     LDY #$08

L_C85F:
  $C85F  06 03     ASL $03
  $C861  26 01     ROL $01
  $C863  26 04     ROL $04
  $C865  38        SEC
  $C866  A5 04     LDA $04
  $C868  E5 02     SBC $02
  $C86A  90 04     BCC $C870
  $C86C  85 04     STA $04
  $C86E  E6 03     INC $03

L_C870:
  $C870  88        DEY
  $C871  D0 EC     BNE $C85F
  $C873  60        RTS

L_C874:
  $C874  A9 00     LDA #$00
  $C876  85 11     STA $11
  $C878  85 10     STA $10
  $C87A  A5 0B     LDA $0B
  $C87C  05 0A     ORA $0A
  $C87E  05 0D     ORA $0D
  $C880  05 0C     ORA $0C
  $C882  D0 05     BNE $C889
  $C884  85 0F     STA $0F
  $C886  85 0E     STA $0E
  $C888  60        RTS

L_C889:
  $C889  A0 10     LDY #$10

L_C88B:
  $C88B  06 10     ASL $10
  $C88D  26 0A     ROL $0A
  $C88F  26 0B     ROL $0B
  $C891  26 11     ROL $11
  $C893  38        SEC
  $C894  A5 0B     LDA $0B
  $C896  E5 0C     SBC $0C
  $C898  AA        TAX
  $C899  A5 11     LDA $11
  $C89B  E5 0D     SBC $0D
  $C89D  90 06     BCC $C8A5
  $C89F  86 09     STX $09
  $C8A1  85 11     STA $11
  $C8A3  E6 10     INC $10

L_C8A5:
  $C8A5  88        DEY
  $C8A6  D0 E3     BNE $C88B
  $C8A8  A5 0A     LDA $0A
  $C8AA  85 0F     STA $0F
  $C8AC  A5 10     LDA $10
  $C8AE  85 0E     STA $0E
  $C8B0  60        RTS
  $C8B1  A6 1B     LDX $1B
  $C8B3  A0 20     LDY #$20
  $C8B5  A5 09     LDA $09
  $C8B7  29 01     AND #$01
  $C8B9  F0 02     BEQ $C8BD
  $C8BB  A0 24     LDY #$24

L_C8BD:
  $C8BD  84 0B     STY $0B
  $C8BF  A5 08     LDA $08
  $C8C1  4A        LSR
  $C8C2  4A        LSR
  $C8C3  48        PHA
  $C8C4  4A        LSR
  $C8C5  29 03     AND #$03
  $C8C7  05 0B     ORA $0B
  $C8C9  9D 00 03  STA $0300,X
  $C8CC  68        PLA
  $C8CD  48        PHA
  $C8CE  6A        ROR
  $C8CF  29 FC     AND #$FC
  $C8D1  9D 04 03  STA $0304,X
  $C8D4  A5 0B     LDA $0B
  $C8D6  09 03     ORA #$03
  $C8D8  9D 08 03  STA $0308,X
  $C8DB  68        PLA
  $C8DC  85 0A     STA $0A
  $C8DE  4A        LSR
  $C8DF  4A        LSR
  $C8E0  4A        LSR
  $C8E1  06 0A     ASL $0A
  $C8E3  06 0A     ASL $0A
  $C8E5  06 0A     ASL $0A
  $C8E7  05 0A     ORA $0A
  $C8E9  09 C0     ORA #$C0
  $C8EB  9D 0C 03  STA $030C,X
  $C8EE  60        RTS
  $C8EF  A6 51     LDX $51
  $C8F1  A0 08     LDY #$08
  $C8F3  A5 09     LDA $09
  $C8F5  29 01     AND #$01
  $C8F7  F0 02     BEQ $C8FB
  $C8F9  A0 09     LDY #$09

L_C8FB:
  $C8FB  84 0B     STY $0B
  $C8FD  A5 0A     LDA $0A
  $C8FF  29 F8     AND #$F8
  $C901  0A        ASL
  $C902  26 0B     ROL $0B
  $C904  0A        ASL
  $C905  26 0B     ROL $0B
  $C907  9D BC 03  STA $03BC,X
  $C90A  A5 08     LDA $08
  $C90C  4A        LSR
  $C90D  4A        LSR
  $C90E  4A        LSR
  $C90F  1D BC 03  ORA $03BC,X
  $C912  9D BC 03  STA $03BC,X
  $C915  A5 0B     LDA $0B
  $C917  9D B6 03  STA $03B6,X
  $C91A  60        RTS
  $C91B  48        PHA
  $C91C  A5 08     LDA $08
  $C91E  48        PHA
  $C91F  A6 51     LDX $51
  $C921  A5 0A     LDA $0A
  $C923  29 E0     AND #$E0
  $C925  4A        LSR
  $C926  4A        LSR
  $C927  85 0B     STA $0B
  $C929  06 08     ASL $08

L_C92B:
  $C92B  2A        ROL
  $C92C  06 08     ASL $08
  $C92E  2A        ROL
  $C92F  06 08     ASL $08
  $C931  2A        ROL
  $C932  05 0B     ORA $0B
  $C934  09 C0     ORA #$C0
  $C936  9D C8 03  STA $03C8,X
  $C939  A0 23     LDY #$23
  $C93B  A5 09     LDA $09
  $C93D  29 01     AND #$01
  $C93F  F0 02     BEQ $C943
  $C941  A0 27     LDY #$27

L_C943:
  $C943  98        TYA
  $C944  9D C2 03  STA $03C2,X
  $C947  A0 00     LDY #$00
  $C949  68        PLA
  $C94A  29 10     AND #$10
  $C94C  F0 01     BEQ $C94F
  $C94E  C8        INY

L_C94F:
  $C94F  A5 0A     LDA $0A
  $C951  29 10     AND #$10
  $C953  F0 02     BEQ $C957
  $C955  C8        INY
  $C956  C8        INY

L_C957:
  $C957  68        PLA
  $C958  39 67 C9  AND $C967,Y
  $C95B  9D CE 03  STA $03CE,X
  $C95E  B9 67 C9  LDA $C967,Y
  $C961  49 FF     EOR #$FF
  $C963  9D D4 03  STA $03D4,X
  $C966  60        RTS
  $C967  03        .db $03
  $C968  0C        .db $0C
  $C969  30 C0     BMI $C92B

L_C96B:
  $C96B  A5 2A     LDA $2A
  $C96D  29 07     AND #$07
  $C96F  20 00 C0  JSR $C000
  $C972  A9 20     LDA #$20
  $C974  85 0B     STA $0B
  $C976  A0 00     LDY #$00
  $C978  B1 08     LDA ($08),Y
  $C97A  AA        TAX
  $C97B  A8        TAY
  $C97C  B9 00 84  LDA $8400,Y
  $C97F  48        PHA
  $C980  8A        TXA
  $C981  0A        ASL
  $C982  26 0B     ROL $0B
  $C984  0A        ASL
  $C985  26 0B     ROL $0B
  $C987  85 0A     STA $0A
  $C989  A5 1B     LDA $1B
  $C98B  0A        ASL
  $C98C  0A        ASL
  $C98D  0A        ASL
  $C98E  0A        ASL
  $C98F  AA        TAX
  $C990  48        PHA
  $C991  A0 00     LDY #$00

L_C993:
  $C993  18        CLC
  $C994  68        PLA
  $C995  48        PHA
  $C996  79 07 CA  ADC $CA07,Y
  $C999  AA        TAX
  $C99A  B1 0A     LDA ($0A),Y
  $C99C  0A        ASL
  $C99D  0A        ASL
  $C99E  18        CLC
  $C99F  9D 10 03  STA $0310,X
  $C9A2  69 01     ADC #$01
  $C9A4  9D 14 03  STA $0314,X
  $C9A7  69 01     ADC #$01
  $C9A9  9D 11 03  STA $0311,X
  $C9AC  69 01     ADC #$01
  $C9AE  9D 15 03  STA $0315,X
  $C9B1  C8        INY
  $C9B2  C0 04     CPY #$04
  $C9B4  D0 DD     BNE $C993
  $C9B6  68        PLA
  $C9B7  A0 20     LDY #$20
  $C9B9  A5 08     LDA $08
  $C9BB  29 40     AND #$40
  $C9BD  F0 02     BEQ $C9C1
  $C9BF  A0 24     LDY #$24

L_C9C1:
  $C9C1  84 0D     STY $0D
  $C9C3  A5 1A     LDA $1A
  $C9C5  85 0C     STA $0C
  $C9C7  4A        LSR
  $C9C8  66 0C     ROR $0C
  $C9CA  A5 0C     LDA $0C
  $C9CC  48        PHA
  $C9CD  29 03     AND #$03
  $C9CF  05 0D     ORA $0D
  $C9D1  85 0D     STA $0D
  $C9D3  68        PLA
  $C9D4  29 FC     AND #$FC
  $C9D6  A6 1B     LDX $1B
  $C9D8  9D 04 03  STA $0304,X
  $C9DB  A5 0D     LDA $0D
  $C9DD  9D 00 03  STA $0300,X
  $C9E0  A5 0D     LDA $0D
  $C9E2  09 03     ORA #$03
  $C9E4  9D 08 03  STA $0308,X
  $C9E7  A5 1A     LDA $1A
  $C9E9  85 0C     STA $0C
  $C9EB  4A        LSR
  $C9EC  4A        LSR
  $C9ED  4A        LSR
  $C9EE  06 0C     ASL $0C
  $C9F0  06 0C     ASL $0C
  $C9F2  06 0C     ASL $0C
  $C9F4  09 C0     ORA #$C0
  $C9F6  05 0C     ORA $0C
  $C9F8  9D 0C 03  STA $030C,X
  $C9FB  68        PLA
  $C9FC  9D 50 03  STA $0350,X
  $C9FF  E6 1B     INC $1B
  $CA01  A9 0E     LDA #$0E
  $CA03  20 00 C0  JSR $C000
  $CA06  60        RTS
  $CA07  00        BRK
  $CA08  08        PHP
  $CA09  02        .db $02
  $CA0A  0A        ASL
  $CA0B  A5 29     LDA $29
  $CA0D  48        PHA
  $CA0E  20 6B C9  JSR $C96B
  $CA11  68        PLA
  $CA12  20 00 C0  JSR $C000
  $CA15  60        RTS
  $CA16  A5 2A     LDA $2A
  $CA18  29 07     AND #$07
  $CA1A  20 00 C0  JSR $C000
  $CA1D  A5 39     LDA $39
  $CA1F  4A        LSR
  $CA20  4A        LSR
  $CA21  4A        LSR
  $CA22  4A        LSR
  $CA23  8D 00 03  STA $0300
  $CA26  A5 39     LDA $39
  $CA28  0A        ASL
  $CA29  0A        ASL
  $CA2A  0A        ASL
  $CA2B  48        PHA
  $CA2C  29 18     AND #$18
  $CA2E  8D 01 03  STA $0301
  $CA31  68        PLA
  $CA32  0A        ASL
  $CA33  29 C0     AND #$C0
  $CA35  0D 01 03  ORA $0301
  $CA38  8D 01 03  STA $0301
  $CA3B  A5 39     LDA $39
  $CA3D  29 F8     AND #$F8
  $CA3F  09 C0     ORA #$C0
  $CA41  8D 13 03  STA $0313
  $CA44  A5 39     LDA $39
  $CA46  29 03     AND #$03
  $CA48  0A        ASL
  $CA49  0D 13 03  ORA $0313
  $CA4C  8D 13 03  STA $0313
  $CA4F  A2 20     LDX #$20
  $CA51  A5 20     LDA $20
  $CA53  29 01     AND #$01
  $CA55  F0 02     BEQ $CA59
  $CA57  A2 24     LDX #$24

L_CA59:
  $CA59  8A        TXA
  $CA5A  0D 00 03  ORA $0300
  $CA5D  8D 00 03  STA $0300
  $CA60  8A        TXA
  $CA61  09 03     ORA #$03
  $CA63  8D 12 03  STA $0312
  $CA66  A9 00     LDA #$00
  $CA68  85 00     STA $00
  $CA6A  A5 39     LDA $39
  $CA6C  29 3B     AND #$3B
  $CA6E  4A        LSR
  $CA6F  66 00     ROR $00
  $CA71  4A        LSR
  $CA72  66 00     ROR $00
  $CA74  4A        LSR
  $CA75  66 00     ROR $00
  $CA77  46 00     LSR $00
  $CA79  05 00     ORA $00
  $CA7B  85 00     STA $00
  $CA7D  AD 40 04  LDA $0440
  $CA80  A2 00     LDX #$00
  $CA82  86 08     STX $08
  $CA84  4A        LSR
  $CA85  66 08     ROR $08
  $CA87  4A        LSR
  $CA88  66 08     ROR $08
  $CA8A  18        CLC
  $CA8B  69 85     ADC #$85
  $CA8D  85 09     STA $09
  $CA8F  86 01     STX $01

L_CA91:
  $CA91  A4 00     LDY $00
  $CA93  B1 08     LDA ($08),Y
  $CA95  85 03     STA $03
  $CA97  85 0A     STA $0A
  $CA99  A9 20     LDA #$20
  $CA9B  06 0A     ASL $0A
  $CA9D  2A        ROL
  $CA9E  06 0A     ASL $0A
  $CAA0  2A        ROL
  $CAA1  85 0B     STA $0B
  $CAA3  A0 00     LDY #$00
  $CAA5  A5 39     LDA $39
  $CAA7  29 04     AND #$04
  $CAA9  F0 01     BEQ $CAAC
  $CAAB  C8        INY

L_CAAC:
  $CAAC  A9 02     LDA #$02
  $CAAE  85 02     STA $02

L_CAB0:
  $CAB0  B1 0A     LDA ($0A),Y
  $CAB2  0A        ASL
  $CAB3  0A        ASL
  $CAB4  18        CLC
  $CAB5  9D 02 03  STA $0302,X
  $CAB8  69 01     ADC #$01
  $CABA  9D 0A 03  STA $030A,X
  $CABD  69 01     ADC #$01
  $CABF  9D 03 03  STA $0303,X
  $CAC2  69 01     ADC #$01
  $CAC4  9D 0B 03  STA $030B,X
  $CAC7  E8        INX
  $CAC8  E8        INX
  $CAC9  C8        INY
  $CACA  C8        INY
  $CACB  C6 02     DEC $02
  $CACD  D0 E1     BNE $CAB0
  $CACF  A5 39     LDA $39
  $CAD1  A0 0F     LDY #$0F
  $CAD3  29 04     AND #$04
  $CAD5  F0 02     BEQ $CAD9
  $CAD7  A0 F0     LDY #$F0

L_CAD9:
  $CAD9  8C 14 03  STY $0314
  $CADC  A4 03     LDY $03
  $CADE  B9 00 84  LDA $8400,Y
  $CAE1  2D 14 03  AND $0314
  $CAE4  A4 01     LDY $01
  $CAE6  99 15 03  STA $0315,Y
  $CAE9  A5 00     LDA $00
  $CAEB  09 08     ORA #$08
  $CAED  85 00     STA $00
  $CAEF  E6 01     INC $01
  $CAF1  A5 01     LDA $01
  $CAF3  C9 02     CMP #$02
  $CAF5  F0 03     BEQ $CAFA
  $CAF7  4C 91 CA  JMP $CA91

L_CAFA:
  $CAFA  A9 80     LDA #$80
  $CAFC  85 1B     STA $1B
  $CAFE  A9 FF     LDA #$FF
  $CB00  4D 14 03  EOR $0314
  $CB03  8D 14 03  STA $0314
  $CB06  A9 0E     LDA #$0E
  $CB08  20 00 C0  JSR $C000
  $CB0B  60        RTS
  $CB0C  A5 FD     LDA $FD
  $CB0E  C9 60     CMP #$60
  $CB10  90 01     BCC $CB13
  $CB12  60        RTS

L_CB13:
  $CB13  A5 29     LDA $29
  $CB15  48        PHA
  $CB16  A5 FD     LDA $FD
  $CB18  29 F0     AND #$F0
  $CB1A  4A        LSR
  $CB1B  4A        LSR
  $CB1C  4A        LSR
  $CB1D  48        PHA
  $CB1E  4A        LSR
  $CB1F  18        CLC
  $CB20  69 0A     ADC #$0A
  $CB22  8D B6 03  STA $03B6
  $CB25  A5 FD     LDA $FD
  $CB27  0A        ASL
  $CB28  0A        ASL
  $CB29  0A        ASL
  $CB2A  0A        ASL
  $CB2B  8D B7 03  STA $03B7
  $CB2E  85 08     STA $08
  $CB30  A5 2A     LDA $2A
  $CB32  29 07     AND #$07
  $CB34  20 00 C0  JSR $C000
  $CB37  A6 FE     LDX $FE
  $CB39  20 64 CB  JSR $CB64
  $CB3C  18        CLC
  $CB3D  68        PLA
  $CB3E  7D 2C B4  ADC $B42C,X
  $CB41  AA        TAX
  $CB42  BD 60 B4  LDA $B460,X
  $CB45  85 09     STA $09
  $CB47  BD 61 B4  LDA $B461,X
  $CB4A  20 00 C0  JSR $C000
  $CB4D  A0 1F     LDY #$1F

L_CB4F:
  $CB4F  B1 08     LDA ($08),Y
  $CB51  99 B8 03  STA $03B8,Y
  $CB54  88        DEY
  $CB55  10 F8     BPL $CB4F
  $CB57  A9 20     LDA #$20
  $CB59  85 47     STA $47
  $CB5B  E6 FD     INC $FD
  $CB5D  E6 FD     INC $FD
  $CB5F  68        PLA
  $CB60  20 00 C0  JSR $C000
  $CB63  60        RTS

L_CB64:
  $CB64  BC 2C B4  LDY $B42C,X
  $CB67  B9 6C B4  LDA $B46C,Y
  $CB6A  8D 6F 03  STA $036F
  $CB6D  B9 6D B4  LDA $B46D,Y
  $CB70  8D 70 03  STA $0370
  $CB73  B9 6E B4  LDA $B46E,Y
  $CB76  8D 71 03  STA $0371
  $CB79  B9 6F B4  LDA $B46F,Y
  $CB7C  8D 73 03  STA $0373
  $CB7F  B9 70 B4  LDA $B470,Y
  $CB82  8D 74 03  STA $0374
  $CB85  B9 71 B4  LDA $B471,Y
  $CB88  8D 75 03  STA $0375
  $CB8B  60        RTS
  $CB8C  A2 0F     LDX #$0F
  $CB8E  A0 00     LDY #$00

L_CB90:
  $CB90  BD 30 04  LDA $0430,X
  $CB93  10 07     BPL $CB9C
  $CB95  29 10     AND #$10
  $CB97  F0 03     BEQ $CB9C
  $CB99  96 56     STX $56,Y
  $CB9B  C8        INY

L_CB9C:
  $CB9C  CA        DEX
  $CB9D  10 F1     BPL $CB90
  $CB9F  84 55     STY $55
  $CBA1  60        RTS

L_CBA2:
  $CBA2  A4 55     LDY $55

L_CBA4:
  $CBA4  88        DEY
  $CBA5  30 1C     BMI $CBC3
  $CBA7  B6 56     LDX $56,Y
  $CBA9  A5 08     LDA $08
  $CBAB  3D 10 06  AND $0610,X
  $CBAE  DD 50 06  CMP $0650,X
  $CBB1  D0 F1     BNE $CBA4
  $CBB3  A5 0A     LDA $0A
  $CBB5  3D 30 06  AND $0630,X
  $CBB8  DD 70 06  CMP $0670,X
  $CBBB  D0 E7     BNE $CBA4
  $CBBD  BD F0 04  LDA $04F0,X
  $CBC0  85 00     STA $00
  $CBC2  60        RTS

L_CBC3:
  $CBC3  A5 2A     LDA $2A
  $CBC5  29 07     AND #$07
  $CBC7  20 00 C0  JSR $C000
  $CBCA  A9 00     LDA #$00
  $CBCC  85 00     STA $00
  $CBCE  A5 0B     LDA $0B
  $CBD0  F0 09     BEQ $CBDB
  $CBD2  30 03     BMI $CBD7
  $CBD4  4C 41 CC  JMP $CC41

L_CBD7:
  $CBD7  A9 00     LDA #$00
  $CBD9  85 0A     STA $0A

L_CBDB:
  $CBDB  A5 08     LDA $08
  $CBDD  4A        LSR
  $CBDE  4A        LSR
  $CBDF  29 38     AND #$38
  $CBE1  85 00     STA $00
  $CBE3  A5 0A     LDA $0A
  $CBE5  0A        ASL
  $CBE6  2A        ROL
  $CBE7  2A        ROL
  $CBE8  2A        ROL
  $CBE9  29 07     AND #$07
  $CBEB  05 00     ORA $00
  $CBED  85 00     STA $00
  $CBEF  A9 00     LDA #$00
  $CBF1  85 0C     STA $0C
  $CBF3  A5 09     LDA $09
  $CBF5  4A        LSR
  $CBF6  66 0C     ROR $0C
  $CBF8  4A        LSR
  $CBF9  66 0C     ROR $0C
  $CBFB  18        CLC
  $CBFC  69 85     ADC #$85
  $CBFE  85 0D     STA $0D
  $CC00  A4 00     LDY $00
  $CC02  B1 0C     LDA ($0C),Y
  $CC04  85 0C     STA $0C
  $CC06  A9 20     LDA #$20
  $CC08  06 0C     ASL $0C
  $CC0A  2A        ROL
  $CC0B  06 0C     ASL $0C
  $CC0D  2A        ROL
  $CC0E  85 0D     STA $0D
  $CC10  A0 00     LDY #$00
  $CC12  A5 08     LDA $08
  $CC14  29 10     AND #$10
  $CC16  F0 02     BEQ $CC1A
  $CC18  C8        INY
  $CC19  C8        INY

L_CC1A:
  $CC1A  A5 0A     LDA $0A
  $CC1C  29 10     AND #$10
  $CC1E  F0 01     BEQ $CC21
  $CC20  C8        INY

L_CC21:
  $CC21  B1 0C     LDA ($0C),Y
  $CC23  85 00     STA $00
  $CC25  06 00     ASL $00
  $CC27  2A        ROL
  $CC28  06 00     ASL $00
  $CC2A  2A        ROL
  $CC2B  29 03     AND #$03
  $CC2D  85 00     STA $00
  $CC2F  4A        LSR
  $CC30  F0 0F     BEQ $CC41
  $CC32  C6 00     DEC $00
  $CC34  C6 00     DEC $00
  $CC36  A5 2A     LDA $2A
  $CC38  0A        ASL
  $CC39  65 00     ADC $00
  $CC3B  AA        TAX
  $CC3C  BD 47 CC  LDA $CC47,X
  $CC3F  85 00     STA $00

L_CC41:
  $CC41  A9 0E     LDA #$0E
  $CC43  20 00 C0  JSR $C000
  $CC46  60        RTS
  $CC47  02        .db $02
  $CC48  03        .db $03
  $CC49  02        .db $02
  $CC4A  03        .db $03
  $CC4B  02        .db $02
  $CC4C  00        BRK
  $CC4D  04        .db $04
  $CC4E  03        .db $03
  $CC4F  00        BRK
  $CC50  03        .db $03
  $CC51  02        .db $02
  $CC52  07        .db $07
  $CC53  05 06     ORA $06
  $CC55  02        .db $02
  $CC56  03        .db $03
  $CC57  02        .db $02
  $CC58  00        BRK
  $CC59  02        .db $02
  $CC5A  03        .db $03
  $CC5B  04        .db $04
  $CC5C  03        .db $03
  $CC5D  02        .db $02
  $CC5E  03        .db $03
  $CC5F  00        BRK
  $CC60  00        BRK
  $CC61  00        BRK
  $CC62  00        BRK
  $CC63  20 A2 CB  JSR $CBA2
  $CC66  A9 0B     LDA #$0B
  $CC68  20 00 C0  JSR $C000
  $CC6B  60        RTS

L_CC6C:
  $CC6C  A9 F8     LDA #$F8
  $CC6E  A2 00     LDX #$00

L_CC70:
  $CC70  9D 00 02  STA $0200,X
  $CC73  E8        INX
  $CC74  D0 FA     BNE $CC70
  $CC76  60        RTS

L_CC77:
  $CC77  A9 0A     LDA #$0A
  $CC79  20 00 C0  JSR $C000
  $CC7C  20 6C CC  JSR $CC6C
  $CC7F  A9 00     LDA #$00
  $CC81  85 06     STA $06
  $CC83  85 0D     STA $0D
  $CC85  85 0C     STA $0C
  $CC87  A5 AA     LDA $AA
  $CC89  F0 03     BEQ $CC8E
  $CC8B  4C 05 CD  JMP $CD05

L_CC8E:
  $CC8E  A5 1C     LDA $1C
  $CC90  29 01     AND #$01
  $CC92  D0 2C     BNE $CCC0
  $CC94  A9 FF     LDA #$FF
  $CC96  85 0C     STA $0C
  $CC98  A9 00     LDA #$00
  $CC9A  85 2B     STA $2B

L_CC9C:
  $CC9C  20 E7 CD  JSR $CDE7
  $CC9F  B0 1C     BCS $CCBD
  $CCA1  E6 2B     INC $2B
  $CCA3  A5 2B     LDA $2B
  $CCA5  C9 10     CMP #$10
  $CCA7  D0 F3     BNE $CC9C

L_CCA9:
  $CCA9  20 F9 CE  JSR $CEF9
  $CCAC  B0 0F     BCS $CCBD
  $CCAE  E6 2B     INC $2B
  $CCB0  A5 2B     LDA $2B
  $CCB2  C9 20     CMP #$20
  $CCB4  D0 F3     BNE $CCA9
  $CCB6  A5 06     LDA $06
  $CCB8  85 0C     STA $0C
  $CCBA  20 5D CF  JSR $CF5D

L_CCBD:
  $CCBD  4C E5 CC  JMP $CCE5

L_CCC0:
  $CCC0  20 5D CF  JSR $CF5D
  $CCC3  A5 06     LDA $06
  $CCC5  85 0D     STA $0D
  $CCC7  A9 1F     LDA #$1F
  $CCC9  85 2B     STA $2B

L_CCCB:
  $CCCB  20 F9 CE  JSR $CEF9
  $CCCE  B0 15     BCS $CCE5
  $CCD0  C6 2B     DEC $2B
  $CCD2  A5 2B     LDA $2B
  $CCD4  C9 0F     CMP #$0F
  $CCD6  D0 F3     BNE $CCCB

L_CCD8:
  $CCD8  20 E7 CD  JSR $CDE7
  $CCDB  B0 08     BCS $CCE5
  $CCDD  C6 2B     DEC $2B
  $CCDF  10 F7     BPL $CCD8
  $CCE1  A5 06     LDA $06
  $CCE3  85 0C     STA $0C

L_CCE5:
  $CCE5  A5 2A     LDA $2A
  $CCE7  C9 01     CMP #$01
  $CCE9  D0 14     BNE $CCFF
  $CCEB  A6 0D     LDX $0D

L_CCED:
  $CCED  E4 0C     CPX $0C
  $CCEF  F0 0E     BEQ $CCFF
  $CCF1  BD 02 02  LDA $0202,X
  $CCF4  09 20     ORA #$20
  $CCF6  9D 02 02  STA $0202,X
  $CCF9  E8        INX
  $CCFA  E8        INX
  $CCFB  E8        INX
  $CCFC  E8        INX
  $CCFD  D0 EE     BNE $CCED

L_CCFF:
  $CCFF  A9 0E     LDA #$0E
  $CD01  20 00 C0  JSR $C000
  $CD04  60        RTS

L_CD05:
  $CD05  A5 1C     LDA $1C
  $CD07  29 01     AND #$01
  $CD09  D0 49     BNE $CD54
  $CD0B  A9 FF     LDA #$FF
  $CD0D  85 0C     STA $0C
  $CD0F  A9 00     LDA #$00
  $CD11  85 2B     STA $2B
  $CD13  A5 AA     LDA $AA
  $CD15  29 04     AND #$04
  $CD17  F0 06     BEQ $CD1F
  $CD19  20 97 CD  JSR $CD97
  $CD1C  4C 22 CD  JMP $CD22

L_CD1F:
  $CD1F  20 E7 CD  JSR $CDE7

L_CD22:
  $CD22  E6 2B     INC $2B

L_CD24:
  $CD24  A5 AA     LDA $AA
  $CD26  29 02     AND #$02
  $CD28  D0 06     BNE $CD30
  $CD2A  20 E7 CD  JSR $CDE7
  $CD2D  4C 33 CD  JMP $CD33

L_CD30:
  $CD30  20 97 CD  JSR $CD97

L_CD33:
  $CD33  B0 1C     BCS $CD51
  $CD35  E6 2B     INC $2B
  $CD37  A5 2B     LDA $2B
  $CD39  C9 10     CMP #$10
  $CD3B  D0 E7     BNE $CD24

L_CD3D:
  $CD3D  20 BF CD  JSR $CDBF
  $CD40  B0 0F     BCS $CD51
  $CD42  E6 2B     INC $2B
  $CD44  A5 2B     LDA $2B
  $CD46  C9 20     CMP #$20
  $CD48  D0 F3     BNE $CD3D
  $CD4A  A5 06     LDA $06
  $CD4C  85 0C     STA $0C
  $CD4E  20 5D CF  JSR $CF5D

L_CD51:
  $CD51  4C E5 CC  JMP $CCE5

L_CD54:
  $CD54  20 5D CF  JSR $CF5D
  $CD57  A5 06     LDA $06
  $CD59  85 0D     STA $0D
  $CD5B  A9 1F     LDA #$1F
  $CD5D  85 2B     STA $2B

L_CD5F:
  $CD5F  20 BF CD  JSR $CDBF
  $CD62  B0 30     BCS $CD94
  $CD64  C6 2B     DEC $2B
  $CD66  A5 2B     LDA $2B
  $CD68  C9 0F     CMP #$0F
  $CD6A  D0 F3     BNE $CD5F

L_CD6C:
  $CD6C  A5 AA     LDA $AA
  $CD6E  29 02     AND #$02
  $CD70  D0 06     BNE $CD78
  $CD72  20 E7 CD  JSR $CDE7
  $CD75  4C 7B CD  JMP $CD7B

L_CD78:
  $CD78  20 97 CD  JSR $CD97

L_CD7B:
  $CD7B  B0 17     BCS $CD94
  $CD7D  C6 2B     DEC $2B
  $CD7F  D0 EB     BNE $CD6C
  $CD81  A5 AA     LDA $AA
  $CD83  29 04     AND #$04
  $CD85  F0 06     BEQ $CD8D
  $CD87  20 97 CD  JSR $CD97
  $CD8A  4C 90 CD  JMP $CD90

L_CD8D:
  $CD8D  20 E7 CD  JSR $CDE7

L_CD90:
  $CD90  A5 06     LDA $06
  $CD92  85 0C     STA $0C

L_CD94:
  $CD94  4C E5 CC  JMP $CCE5

L_CD97:
  $CD97  A6 2B     LDX $2B
  $CD99  BD 20 04  LDA $0420,X
  $CD9C  30 02     BMI $CDA0
  $CD9E  18        CLC
  $CD9F  60        RTS

L_CDA0:
  $CDA0  BC 00 04  LDY $0400,X
  $CDA3  B9 00 F9  LDA $F900,Y
  $CDA6  85 08     STA $08
  $CDA8  B9 00 FA  LDA $FA00,Y
  $CDAB  85 09     STA $09
  $CDAD  BD A0 06  LDA $06A0,X
  $CDB0  18        CLC
  $CDB1  69 02     ADC #$02
  $CDB3  A8        TAY
  $CDB4  B1 08     LDA ($08),Y
  $CDB6  F0 03     BEQ $CDBB
  $CDB8  4C 2F CE  JMP $CE2F

L_CDBB:
  $CDBB  5E 20 04  LSR $0420,X
  $CDBE  60        RTS

L_CDBF:
  $CDBF  A6 2B     LDX $2B
  $CDC1  BD 20 04  LDA $0420,X
  $CDC4  30 02     BMI $CDC8
  $CDC6  18        CLC
  $CDC7  60        RTS

L_CDC8:
  $CDC8  BC 00 04  LDY $0400,X
  $CDCB  B9 80 F9  LDA $F980,Y
  $CDCE  85 08     STA $08
  $CDD0  B9 80 FA  LDA $FA80,Y
  $CDD3  85 09     STA $09
  $CDD5  BD A0 06  LDA $06A0,X
  $CDD8  18        CLC
  $CDD9  69 02     ADC #$02
  $CDDB  A8        TAY
  $CDDC  B1 08     LDA ($08),Y
  $CDDE  F0 03     BEQ $CDE3
  $CDE0  4C 41 CF  JMP $CF41

L_CDE3:
  $CDE3  5E 20 04  LSR $0420,X
  $CDE6  60        RTS

L_CDE7:
  $CDE7  A6 2B     LDX $2B
  $CDE9  BD 20 04  LDA $0420,X
  $CDEC  30 02     BMI $CDF0
  $CDEE  18        CLC
  $CDEF  60        RTS

L_CDF0:
  $CDF0  BC 00 04  LDY $0400,X
  $CDF3  B9 00 F9  LDA $F900,Y
  $CDF6  85 08     STA $08
  $CDF8  B9 00 FA  LDA $FA00,Y
  $CDFB  85 09     STA $09
  $CDFD  BD A0 06  LDA $06A0,X
  $CE00  48        PHA
  $CE01  FE 80 06  INC $0680,X
  $CE04  A0 01     LDY #$01
  $CE06  B1 08     LDA ($08),Y
  $CE08  DD 80 06  CMP $0680,X
  $CE0B  B0 15     BCS $CE22
  $CE0D  A9 00     LDA #$00
  $CE0F  9D 80 06  STA $0680,X
  $CE12  FE A0 06  INC $06A0,X
  $CE15  88        DEY
  $CE16  B1 08     LDA ($08),Y
  $CE18  DD A0 06  CMP $06A0,X
  $CE1B  B0 05     BCS $CE22
  $CE1D  A9 00     LDA #$00
  $CE1F  9D A0 06  STA $06A0,X

L_CE22:
  $CE22  68        PLA
  $CE23  18        CLC
  $CE24  69 02     ADC #$02
  $CE26  A8        TAY
  $CE27  B1 08     LDA ($08),Y
  $CE29  D0 04     BNE $CE2F
  $CE2B  5E 20 04  LSR $0420,X
  $CE2E  60        RTS

L_CE2F:
  $CE2F  A8        TAY
  $CE30  E0 01     CPX #$01
  $CE32  B0 15     BCS $CE49
  $CE34  A5 4B     LDA $4B
  $CE36  F0 0B     BEQ $CE43
  $CE38  C6 4B     DEC $4B
  $CE3A  A5 1C     LDA $1C
  $CE3C  29 02     AND #$02
  $CE3E  F0 03     BEQ $CE43

L_CE40:
  $CE40  4C F5 CE  JMP $CEF5

L_CE43:
  $CE43  A5 F9     LDA $F9
  $CE45  D0 F9     BNE $CE40
  $CE47  F0 12     BEQ $CE5B

L_CE49:
  $CE49  D0 10     BNE $CE5B
  $CE4B  AD A8 05  LDA $05A8
  $CE4E  F0 0B     BEQ $CE5B
  $CE50  A5 1C     LDA $1C
  $CE52  29 02     AND #$02
  $CE54  D0 02     BNE $CE58
  $CE56  A0 18     LDY #$18

L_CE58:
  $CE58  CE A8 05  DEC $05A8

L_CE5B:
  $CE5B  B9 00 80  LDA $8000,Y
  $CE5E  85 08     STA $08
  $CE60  B9 00 82  LDA $8200,Y
  $CE63  85 09     STA $09
  $CE65  A9 00     LDA #$00
  $CE67  85 03     STA $03

L_CE69:
  $CE69  A0 00     LDY #$00
  $CE6B  B1 08     LDA ($08),Y
  $CE6D  85 04     STA $04
  $CE6F  C8        INY
  $CE70  B1 08     LDA ($08),Y
  $CE72  A8        TAY
  $CE73  B9 00 84  LDA $8400,Y
  $CE76  85 0A     STA $0A
  $CE78  B9 00 85  LDA $8500,Y
  $CE7B  85 0B     STA $0B
  $CE7D  38        SEC
  $CE7E  BD 60 04  LDA $0460,X
  $CE81  E5 1F     SBC $1F
  $CE83  85 00     STA $00
  $CE85  BD 40 04  LDA $0440,X
  $CE88  E5 20     SBC $20
  $CE8A  BD A0 04  LDA $04A0,X
  $CE8D  85 01     STA $01
  $CE8F  BD 20 04  LDA $0420,X
  $CE92  29 40     AND #$40
  $CE94  85 02     STA $02
  $CE96  A9 02     LDA #$02
  $CE98  85 07     STA $07

L_CE9A:
  $CE9A  A6 06     LDX $06
  $CE9C  A4 07     LDY $07
  $CE9E  B1 08     LDA ($08),Y
  $CEA0  9D 01 02  STA $0201,X
  $CEA3  18        CLC
  $CEA4  B1 0A     LDA ($0A),Y
  $CEA6  65 01     ADC $01
  $CEA8  9D 00 02  STA $0200,X
  $CEAB  C8        INY
  $CEAC  A5 03     LDA $03
  $CEAE  F0 08     BEQ $CEB8
  $CEB0  B1 08     LDA ($08),Y
  $CEB2  29 F0     AND #$F0
  $CEB4  05 03     ORA $03
  $CEB6  D0 02     BNE $CEBA

L_CEB8:
  $CEB8  B1 08     LDA ($08),Y

L_CEBA:
  $CEBA  45 02     EOR $02
  $CEBC  9D 02 02  STA $0202,X
  $CEBF  A5 02     LDA $02
  $CEC1  F0 09     BEQ $CECC
  $CEC3  B1 0A     LDA ($0A),Y
  $CEC5  A8        TAY
  $CEC6  B9 00 86  LDA $8600,Y
  $CEC9  4C CE CE  JMP $CECE

L_CECC:
  $CECC  B1 0A     LDA ($0A),Y

L_CECE:
  $CECE  18        CLC
  $CECF  30 06     BMI $CED7
  $CED1  65 00     ADC $00
  $CED3  90 0D     BCC $CEE2
  $CED5  B0 04     BCS $CEDB

L_CED7:
  $CED7  65 00     ADC $00
  $CED9  B0 07     BCS $CEE2

L_CEDB:
  $CEDB  A9 F8     LDA #$F8
  $CEDD  9D 00 02  STA $0200,X
  $CEE0  D0 0B     BNE $CEED

L_CEE2:
  $CEE2  9D 03 02  STA $0203,X
  $CEE5  18        CLC
  $CEE6  8A        TXA
  $CEE7  69 04     ADC #$04
  $CEE9  85 06     STA $06
  $CEEB  F0 0A     BEQ $CEF7

L_CEED:
  $CEED  E6 07     INC $07
  $CEEF  E6 07     INC $07
  $CEF1  C6 04     DEC $04
  $CEF3  D0 A5     BNE $CE9A

L_CEF5:
  $CEF5  18        CLC
  $CEF6  60        RTS

L_CEF7:
  $CEF7  38        SEC
  $CEF8  60        RTS

L_CEF9:
  $CEF9  A6 2B     LDX $2B
  $CEFB  BD 20 04  LDA $0420,X
  $CEFE  30 02     BMI $CF02
  $CF00  18        CLC
  $CF01  60        RTS

L_CF02:
  $CF02  BC 00 04  LDY $0400,X
  $CF05  B9 80 F9  LDA $F980,Y
  $CF08  85 08     STA $08
  $CF0A  B9 80 FA  LDA $FA80,Y
  $CF0D  85 09     STA $09
  $CF0F  BD A0 06  LDA $06A0,X
  $CF12  48        PHA
  $CF13  FE 80 06  INC $0680,X
  $CF16  A0 01     LDY #$01
  $CF18  B1 08     LDA ($08),Y
  $CF1A  DD 80 06  CMP $0680,X
  $CF1D  B0 15     BCS $CF34
  $CF1F  A9 00     LDA #$00
  $CF21  9D 80 06  STA $0680,X
  $CF24  FE A0 06  INC $06A0,X
  $CF27  88        DEY
  $CF28  B1 08     LDA ($08),Y
  $CF2A  DD A0 06  CMP $06A0,X
  $CF2D  B0 05     BCS $CF34
  $CF2F  A9 00     LDA #$00
  $CF31  9D A0 06  STA $06A0,X

L_CF34:
  $CF34  68        PLA
  $CF35  18        CLC
  $CF36  69 02     ADC #$02
  $CF38  A8        TAY
  $CF39  B1 08     LDA ($08),Y
  $CF3B  D0 04     BNE $CF41
  $CF3D  5E 20 04  LSR $0420,X
  $CF40  60        RTS

L_CF41:
  $CF41  A8        TAY
  $CF42  BD 20 04  LDA $0420,X
  $CF45  29 20     AND #$20
  $CF47  D0 12     BNE $CF5B
  $CF49  B9 00 81  LDA $8100,Y
  $CF4C  85 08     STA $08
  $CF4E  B9 00 83  LDA $8300,Y
  $CF51  85 09     STA $09
  $CF53  BD 00 01  LDA $0100,X
  $CF56  85 03     STA $03
  $CF58  4C 69 CE  JMP $CE69

L_CF5B:
  $CF5B  18        CLC
  $CF5C  60        RTS

L_CF5D:
  $CF5D  AD C0 06  LDA $06C0
  $CF60  85 00     STA $00
  $CF62  A6 06     LDX $06
  $CF64  A9 01     LDA #$01
  $CF66  85 02     STA $02
  $CF68  A9 18     LDA #$18
  $CF6A  85 01     STA $01
  $CF6C  20 A8 CF  JSR $CFA8
  $CF6F  B0 36     BCS $CFA7
  $CF71  A4 A9     LDY $A9
  $CF73  F0 12     BEQ $CF87
  $CF75  B9 9B 00  LDA $009B,Y
  $CF78  85 00     STA $00
  $CF7A  A9 00     LDA #$00
  $CF7C  85 02     STA $02
  $CF7E  A9 10     LDA #$10
  $CF80  85 01     STA $01
  $CF82  20 A8 CF  JSR $CFA8
  $CF85  B0 20     BCS $CFA7

L_CF87:
  $CF87  A5 B1     LDA $B1
  $CF89  F0 1C     BEQ $CFA7
  $CF8B  AD C1 06  LDA $06C1
  $CF8E  85 00     STA $00
  $CF90  A9 03     LDA #$03
  $CF92  A4 B3     LDY $B3
  $CF94  C0 08     CPY #$08
  $CF96  F0 04     BEQ $CF9C
  $CF98  C0 0D     CPY #$0D
  $CF9A  D0 02     BNE $CF9E

L_CF9C:
  $CF9C  A9 01     LDA #$01

L_CF9E:
  $CF9E  85 02     STA $02
  $CFA0  A9 28     LDA #$28
  $CFA2  85 01     STA $01
  $CFA4  20 A8 CF  JSR $CFA8

L_CFA7:
  $CFA7  60        RTS

L_CFA8:
  $CFA8  A0 06     LDY #$06

L_CFAA:
  $CFAA  B9 E5 CF  LDA $CFE5,Y
  $CFAD  9D 00 02  STA $0200,X
  $CFB0  38        SEC
  $CFB1  A5 00     LDA $00
  $CFB3  E9 04     SBC #$04
  $CFB5  B0 0E     BCS $CFC5
  $CFB7  A6 00     LDX $00
  $CFB9  A9 00     LDA #$00
  $CFBB  85 00     STA $00
  $CFBD  BD EC CF  LDA $CFEC,X
  $CFC0  A6 06     LDX $06
  $CFC2  4C C9 CF  JMP $CFC9

L_CFC5:
  $CFC5  85 00     STA $00
  $CFC7  A9 87     LDA #$87

L_CFC9:
  $CFC9  9D 01 02  STA $0201,X
  $CFCC  A5 02     LDA $02
  $CFCE  9D 02 02  STA $0202,X
  $CFD1  A5 01     LDA $01
  $CFD3  9D 03 02  STA $0203,X
  $CFD6  E8        INX
  $CFD7  E8        INX
  $CFD8  E8        INX
  $CFD9  E8        INX
  $CFDA  86 06     STX $06
  $CFDC  F0 05     BEQ $CFE3
  $CFDE  88        DEY
  $CFDF  10 C9     BPL $CFAA
  $CFE1  18        CLC
  $CFE2  60        RTS

L_CFE3:
  $CFE3  38        SEC
  $CFE4  60        RTS
  $CFE5  18        CLC
  $CFE6  20 28 30  JSR $3028
  $CFE9  38        SEC
  $CFEA  40        RTI
  $CFEB  48        PHA
  $CFEC  8B        .db $8B
  $CFED  8A        TXA
  $CFEE  89        .db $89
  $CFEF  88        DEY
  $CFF0  48        PHA
  $CFF1  08        PHP
  $CFF2  8A        TXA
  $CFF3  48        PHA
  $CFF4  98        TYA
  $CFF5  48        PHA
  $CFF6  A5 1D     LDA $1D
  $CFF8  F0 03     BEQ $CFFD
  $CFFA  4C 8D D0  JMP $D08D

L_CFFD:
  $CFFD  A5 F7     LDA $F7
  $CFFF  29 7C     AND #$7C
  $D001  85 F7     STA $F7
  $D003  8D 00 20  STA $2000
  $D006  A5 F8     LDA $F8
  $D008  29 E7     AND #$E7
  $D00A  85 F8     STA $F8
  $D00C  8D 01 20  STA $2001
  $D00F  AD 02 20  LDA $2002
  $D012  A9 00     LDA #$00
  $D014  8D 03 20  STA $2003
  $D017  A9 02     LDA #$02
  $D019  8D 14 40  STA $4014
  $D01C  A5 1B     LDA $1B
  $D01E  F0 03     BEQ $D023
  $D020  20 1B D1  JSR $D11B

L_D023:
  $D023  20 F5 D0  JSR $D0F5
  $D026  A5 47     LDA $47
  $D028  F0 03     BEQ $D02D
  $D02A  20 DF D1  JSR $D1DF

L_D02D:
  $D02D  A5 51     LDA $51
  $D02F  F0 03     BEQ $D034
  $D031  20 F9 D1  JSR $D1F9

L_D034:
  $D034  AD 02 20  LDA $2002
  $D037  A9 00     LDA #$00
  $D039  85 01     STA $01
  $D03B  A5 1F     LDA $1F
  $D03D  85 00     STA $00
  $D03F  A5 B8     LDA $B8
  $D041  F0 0F     BEQ $D052
  $D043  38        SEC
  $D044  A5 00     LDA $00
  $D046  E5 B8     SBC $B8
  $D048  85 00     STA $00
  $D04A  A9 00     LDA #$00
  $D04C  E5 B9     SBC $B9
  $D04E  29 01     AND #$01
  $D050  85 01     STA $01

L_D052:
  $D052  A5 00     LDA $00
  $D054  8D 05 20  STA $2005
  $D057  A5 22     LDA $22
  $D059  85 00     STA $00
  $D05B  A5 B6     LDA $B6
  $D05D  F0 07     BEQ $D066
  $D05F  38        SEC
  $D060  A5 00     LDA $00
  $D062  E5 B6     SBC $B6
  $D064  85 00     STA $00

L_D066:
  $D066  A5 00     LDA $00
  $D068  8D 05 20  STA $2005
  $D06B  A5 F8     LDA $F8
  $D06D  09 1E     ORA #$1E
  $D06F  85 F8     STA $F8
  $D071  8D 01 20  STA $2001
  $D074  A5 F7     LDA $F7
  $D076  09 80     ORA #$80
  $D078  85 F7     STA $F7
  $D07A  A5 20     LDA $20
  $D07C  45 01     EOR $01
  $D07E  29 01     AND #$01
  $D080  05 F7     ORA $F7
  $D082  05 AE     ORA $AE
  $D084  85 F7     STA $F7
  $D086  8D 00 20  STA $2000
  $D089  85 1D     STA $1D
  $D08B  E6 1C     INC $1C

L_D08D:
  $D08D  A5 68     LDA $68
  $D08F  F0 04     BEQ $D095
  $D091  E6 67     INC $67
  $D093  D0 31     BNE $D0C6

L_D095:
  $D095  A9 0C     LDA #$0C
  $D097  8D F0 FF  STA $FFF0
  $D09A  4A        LSR
  $D09B  8D F0 FF  STA $FFF0
  $D09E  4A        LSR
  $D09F  8D F0 FF  STA $FFF0
  $D0A2  4A        LSR
  $D0A3  8D F0 FF  STA $FFF0
  $D0A6  4A        LSR
  $D0A7  8D F0 FF  STA $FFF0
  $D0AA  20 00 80  JSR $8000

L_D0AD:
  $D0AD  A6 66     LDX $66
  $D0AF  F0 10     BEQ $D0C1
  $D0B1  BD 7F 05  LDA $057F,X
  $D0B4  C9 FD     CMP #$FD
  $D0B6  D0 02     BNE $D0BA
  $D0B8  A0 A0     LDY #$A0

L_D0BA:
  $D0BA  20 03 80  JSR $8003
  $D0BD  C6 66     DEC $66
  $D0BF  D0 EC     BNE $D0AD

L_D0C1:
  $D0C1  A5 29     LDA $29
  $D0C3  20 00 C0  JSR $C000

L_D0C6:
  $D0C6  AD 80 04  LDA $0480
  $D0C9  45 4A     EOR $4A
  $D0CB  65 1C     ADC $1C
  $D0CD  4A        LSR
  $D0CE  85 4A     STA $4A
  $D0D0  68        PLA
  $D0D1  A8        TAY
  $D0D2  68        PLA
  $D0D3  AA        TAX
  $D0D4  28        PLP
  $D0D5  68        PLA
  $D0D6  40        RTI

L_D0D7:
  $D0D7  A2 01     LDX #$01
  $D0D9  8E 16 40  STX $4016
  $D0DC  CA        DEX
  $D0DD  8E 16 40  STX $4016
  $D0E0  E8        INX

L_D0E1:
  $D0E1  A0 08     LDY #$08

L_D0E3:
  $D0E3  BD 16 40  LDA $4016,X
  $D0E6  85 27     STA $27
  $D0E8  4A        LSR
  $D0E9  05 27     ORA $27
  $D0EB  4A        LSR
  $D0EC  76 23     ROR $23,X
  $D0EE  88        DEY
  $D0EF  D0 F2     BNE $D0E3
  $D0F1  CA        DEX
  $D0F2  10 ED     BPL $D0E1
  $D0F4  60        RTS

L_D0F5:
  $D0F5  A0 3F     LDY #$3F
  $D0F7  8C 06 20  STY $2006
  $D0FA  A2 00     LDX #$00
  $D0FC  8E 06 20  STX $2006

L_D0FF:
  $D0FF  BD 56 03  LDA $0356,X
  $D102  8D 07 20  STA $2007
  $D105  E8        INX
  $D106  E0 20     CPX #$20
  $D108  D0 F5     BNE $D0FF
  $D10A  8C 06 20  STY $2006
  $D10D  A9 00     LDA #$00
  $D10F  8D 06 20  STA $2006
  $D112  8D 06 20  STA $2006
  $D115  8D 06 20  STA $2006
  $D118  85 3A     STA $3A
  $D11A  60        RTS

L_D11B:
  $D11B  10 03     BPL $D120
  $D11D  4C 81 D1  JMP $D181

L_D120:
  $D120  A0 00     LDY #$00

L_D122:
  $D122  84 00     STY $00
  $D124  98        TYA
  $D125  0A        ASL
  $D126  0A        ASL
  $D127  0A        ASL
  $D128  0A        ASL
  $D129  AA        TAX
  $D12A  A9 04     LDA #$04
  $D12C  85 01     STA $01
  $D12E  B9 00 03  LDA $0300,Y
  $D131  85 0B     STA $0B
  $D133  B9 04 03  LDA $0304,Y
  $D136  85 0A     STA $0A
  $D138  C9 80     CMP #$80
  $D13A  90 0C     BCC $D148
  $D13C  A5 0B     LDA $0B
  $D13E  29 03     AND #$03
  $D140  C9 03     CMP #$03
  $D142  D0 04     BNE $D148
  $D144  A9 02     LDA #$02
  $D146  85 01     STA $01

L_D148:
  $D148  B9 08 03  LDA $0308,Y
  $D14B  8D 06 20  STA $2006
  $D14E  B9 0C 03  LDA $030C,Y
  $D151  8D 06 20  STA $2006
  $D154  B9 50 03  LDA $0350,Y
  $D157  8D 07 20  STA $2007

L_D15A:
  $D15A  A5 0B     LDA $0B
  $D15C  8D 06 20  STA $2006
  $D15F  18        CLC
  $D160  A5 0A     LDA $0A
  $D162  8D 06 20  STA $2006
  $D165  69 20     ADC #$20
  $D167  85 0A     STA $0A
  $D169  A0 04     LDY #$04

L_D16B:
  $D16B  BD 10 03  LDA $0310,X
  $D16E  8D 07 20  STA $2007
  $D171  E8        INX
  $D172  88        DEY
  $D173  D0 F6     BNE $D16B
  $D175  C6 01     DEC $01
  $D177  D0 E1     BNE $D15A
  $D179  A4 00     LDY $00
  $D17B  C8        INY
  $D17C  C6 1B     DEC $1B
  $D17E  D0 A2     BNE $D122
  $D180  60        RTS

L_D181:
  $D181  A2 00     LDX #$00
  $D183  86 1B     STX $1B

L_D185:
  $D185  AD 00 03  LDA $0300
  $D188  8D 06 20  STA $2006
  $D18B  AD 01 03  LDA $0301
  $D18E  8D 06 20  STA $2006

L_D191:
  $D191  BD 02 03  LDA $0302,X
  $D194  8D 07 20  STA $2007
  $D197  E8        INX
  $D198  8A        TXA
  $D199  29 07     AND #$07
  $D19B  D0 F4     BNE $D191
  $D19D  18        CLC
  $D19E  AD 01 03  LDA $0301
  $D1A1  69 20     ADC #$20
  $D1A3  8D 01 03  STA $0301
  $D1A6  AD 12 03  LDA $0312
  $D1A9  8D 06 20  STA $2006
  $D1AC  AD 13 03  LDA $0313
  $D1AF  8D 06 20  STA $2006
  $D1B2  AD 07 20  LDA $2007
  $D1B5  AD 07 20  LDA $2007
  $D1B8  A4 1B     LDY $1B
  $D1BA  2D 14 03  AND $0314
  $D1BD  19 15 03  ORA $0315,Y
  $D1C0  48        PHA
  $D1C1  AD 12 03  LDA $0312
  $D1C4  8D 06 20  STA $2006
  $D1C7  AD 13 03  LDA $0313
  $D1CA  8D 06 20  STA $2006
  $D1CD  68        PLA
  $D1CE  8D 07 20  STA $2007
  $D1D1  E6 1B     INC $1B
  $D1D3  EE 13 03  INC $0313
  $D1D6  E0 10     CPX #$10
  $D1D8  D0 AB     BNE $D185
  $D1DA  A9 00     LDA #$00
  $D1DC  85 1B     STA $1B
  $D1DE  60        RTS

L_D1DF:
  $D1DF  AD B6 03  LDA $03B6
  $D1E2  8D 06 20  STA $2006
  $D1E5  AD B7 03  LDA $03B7
  $D1E8  8D 06 20  STA $2006
  $D1EB  A2 00     LDX #$00

L_D1ED:
  $D1ED  BD B8 03  LDA $03B8,X
  $D1F0  8D 07 20  STA $2007
  $D1F3  E8        INX
  $D1F4  C6 47     DEC $47
  $D1F6  D0 F5     BNE $D1ED
  $D1F8  60        RTS

L_D1F9:
  $D1F9  A5 F7     LDA $F7
  $D1FB  09 04     ORA #$04
  $D1FD  8D 00 20  STA $2000
  $D200  A5 54     LDA $54
  $D202  D0 65     BNE $D269
  $D204  A4 51     LDY $51
  $D206  30 25     BMI $D22D

L_D208:
  $D208  B9 B5 03  LDA $03B5,Y
  $D20B  8D 06 20  STA $2006
  $D20E  B9 BB 03  LDA $03BB,Y
  $D211  8D 06 20  STA $2006
  $D214  B9 C1 03  LDA $03C1,Y
  $D217  8D 07 20  STA $2007
  $D21A  18        CLC
  $D21B  69 01     ADC #$01
  $D21D  8D 07 20  STA $2007
  $D220  88        DEY
  $D221  D0 E5     BNE $D208

L_D223:
  $D223  84 51     STY $51
  $D225  A5 F7     LDA $F7
  $D227  29 FB     AND #$FB
  $D229  8D 00 20  STA $2000
  $D22C  60        RTS

L_D22D:
  $D22D  98        TYA
  $D22E  29 7F     AND #$7F
  $D230  A8        TAY

L_D231:
  $D231  A9 02     LDA #$02
  $D233  85 00     STA $00
  $D235  A9 E4     LDA #$E4
  $D237  85 01     STA $01

L_D239:
  $D239  B9 B5 03  LDA $03B5,Y
  $D23C  8D 06 20  STA $2006
  $D23F  B9 BB 03  LDA $03BB,Y
  $D242  8D 06 20  STA $2006
  $D245  A9 02     LDA #$02
  $D247  85 02     STA $02

L_D249:
  $D249  A5 01     LDA $01
  $D24B  8D 07 20  STA $2007
  $D24E  E6 01     INC $01
  $D250  C6 02     DEC $02
  $D252  D0 F5     BNE $D249
  $D254  C6 00     DEC $00
  $D256  F0 0C     BEQ $D264
  $D258  18        CLC
  $D259  B9 BB 03  LDA $03BB,Y
  $D25C  69 01     ADC #$01
  $D25E  99 BB 03  STA $03BB,Y
  $D261  4C 39 D2  JMP $D239

L_D264:
  $D264  88        DEY
  $D265  D0 CA     BNE $D231
  $D267  F0 BA     BEQ $D223

L_D269:
  $D269  10 18     BPL $D283
  $D26B  AD B6 03  LDA $03B6
  $D26E  8D 06 20  STA $2006
  $D271  AE BC 03  LDX $03BC
  $D274  CA        DEX
  $D275  CA        DEX
  $D276  8E 06 20  STX $2006
  $D279  AD 07 20  LDA $2007
  $D27C  AD 07 20  LDA $2007
  $D27F  AA        TAX
  $D280  4C 85 D2  JMP $D285

L_D283:
  $D283  A2 20     LDX #$20

L_D285:
  $D285  A0 02     LDY #$02

L_D287:
  $D287  AD B6 03  LDA $03B6
  $D28A  8D 06 20  STA $2006
  $D28D  AD BC 03  LDA $03BC
  $D290  8D 06 20  STA $2006
  $D293  8E 07 20  STX $2007
  $D296  E8        INX
  $D297  8E 07 20  STX $2007
  $D29A  E8        INX
  $D29B  EE BC 03  INC $03BC
  $D29E  88        DEY
  $D29F  D0 E6     BNE $D287
  $D2A1  AD C2 03  LDA $03C2
  $D2A4  8D 06 20  STA $2006
  $D2A7  AD C8 03  LDA $03C8
  $D2AA  8D 06 20  STA $2006
  $D2AD  A5 54     LDA $54
  $D2AF  10 1B     BPL $D2CC
  $D2B1  AD 07 20  LDA $2007
  $D2B4  AD 07 20  LDA $2007
  $D2B7  85 00     STA $00
  $D2B9  AD D4 03  LDA $03D4
  $D2BC  49 FF     EOR #$FF
  $D2BE  4A        LSR
  $D2BF  4A        LSR
  $D2C0  25 00     AND $00
  $D2C2  0A        ASL
  $D2C3  0A        ASL
  $D2C4  8D CE 03  STA $03CE
  $D2C7  A5 00     LDA $00
  $D2C9  4C D2 D2  JMP $D2D2

L_D2CC:
  $D2CC  AD 07 20  LDA $2007
  $D2CF  AD 07 20  LDA $2007

L_D2D2:
  $D2D2  2D D4 03  AND $03D4
  $D2D5  0D CE 03  ORA $03CE
  $D2D8  AA        TAX
  $D2D9  AD C2 03  LDA $03C2
  $D2DC  8D 06 20  STA $2006
  $D2DF  AD C8 03  LDA $03C8
  $D2E2  8D 06 20  STA $2006
  $D2E5  8E 07 20  STX $2007
  $D2E8  84 54     STY $54
  $D2EA  4C 23 D2  JMP $D223
  $D2ED  A5 A9     LDA $A9
  $D2EF  0A        ASL
  $D2F0  0A        ASL
  $D2F1  AA        TAX
  $D2F2  E8        INX
  $D2F3  A0 01     LDY #$01

L_D2F5:
  $D2F5  BD 02 D3  LDA $D302,X
  $D2F8  99 66 03  STA $0366,Y
  $D2FB  C8        INY
  $D2FC  E8        INX
  $D2FD  C0 04     CPY #$04
  $D2FF  D0 F4     BNE $D2F5
  $D301  60        RTS
  $D302  0F        .db $0F
  $D303  0F        .db $0F
  $D304  2C 11 0F  BIT $0F11
  $D307  0F        .db $0F
  $D308  28        PLP
  $D309  15 0F     ORA $0F,X
  $D30B  0F        .db $0F
  $D30C  30 11     BMI $D31F
  $D30E  0F        .db $0F
  $D30F  0F        .db $0F
  $D310  30 19     BMI $D32B
  $D312  0F        .db $0F
  $D313  0F        .db $0F
  $D314  30 00     BMI $D316

L_D316:
  $D316  0F        .db $0F
  $D317  0F        .db $0F
  $D318  34        .db $34
  $D319  25 0F     AND $0F
  $D31B  0F        .db $0F
  $D31C  34        .db $34
  $D31D  14        .db $14
  $D31E  0F        .db $0F

L_D31F:
  $D31F  0F        .db $0F
  $D320  37        .db $37
  $D321  18        CLC
  $D322  0F        .db $0F
  $D323  0F        .db $0F
  $D324  30 26     BMI $D34C
  $D326  0F        .db $0F
  $D327  0F        .db $0F
  $D328  30 16     BMI $D340
  $D32A  0F        .db $0F

L_D32B:
  $D32B  0F        .db $0F
  $D32C  30 16     BMI $D344
  $D32E  0F        .db $0F
  $D32F  0F        .db $0F
  $D330  30 16     BMI $D348

L_D332:
  $D332  A9 26     LDA #$26
  $D334  20 51 C0  JSR $C051
  $D337  A9 00     LDA #$00
  $D339  85 3D     STA $3D
  $D33B  85 36     STA $36
  $D33D  A9 02     LDA #$02
  $D33F  85 2C     STA $2C
  $D341  20 A8 D3  JSR $D3A8

L_D344:
  $D344  A9 01     LDA #$01
  $D346  8D A0 06  STA $06A0
  $D349  A9 6F     LDA #$6F
  $D34B  85 4B     STA $4B
  $D34D  A9 01     LDA #$01
  $D34F  8D 40 06  STA $0640
  $D352  A9 40     LDA #$40
  $D354  8D 60 06  STA $0660
  $D357  A9 00     LDA #$00
  $D359  8D 00 06  STA $0600
  $D35C  A9 90     LDA #$90
  $D35E  8D 20 06  STA $0620
  $D361  4E 2F 04  LSR $042F
  $D364  A9 00     LDA #$00
  $D366  85 AA     STA $AA
  $D368  A2 0E     LDX #$0E

L_D36A:
  $D36A  BD 20 04  LDA $0420,X
  $D36D  10 06     BPL $D375
  $D36F  CA        DEX
  $D370  E0 01     CPX #$01
  $D372  D0 F6     BNE $D36A
  $D374  60        RTS

L_D375:
  $D375  A9 80     LDA #$80
  $D377  9D 20 04  STA $0420,X
  $D37A  A9 24     LDA #$24
  $D37C  9D 00 04  STA $0400,X
  $D37F  AD 40 04  LDA $0440
  $D382  9D 40 04  STA $0440,X
  $D385  AD 60 04  LDA $0460
  $D388  9D 60 04  STA $0460,X
  $D38B  AD A0 04  LDA $04A0
  $D38E  9D A0 04  STA $04A0,X
  $D391  A9 08     LDA #$08
  $D393  9D 60 06  STA $0660,X
  $D396  A9 00     LDA #$00
  $D398  9D 40 06  STA $0640,X
  $D39B  9D 20 06  STA $0620,X
  $D39E  9D 00 06  STA $0600,X
  $D3A1  9D 80 06  STA $0680,X
  $D3A4  9D A0 06  STA $06A0,X
  $D3A7  60        RTS

L_D3A8:
  $D3A8  A6 2C     LDX $2C
  $D3AA  18        CLC
  $D3AB  BD D4 D3  LDA $D3D4,X
  $D3AE  65 3D     ADC $3D
  $D3B0  CD 00 04  CMP $0400
  $D3B3  F0 08     BEQ $D3BD
  $D3B5  A2 00     LDX #$00
  $D3B7  8E A0 06  STX $06A0
  $D3BA  8E 80 06  STX $0680

L_D3BD:
  $D3BD  8D 00 04  STA $0400
  $D3C0  A5 36     LDA $36
  $D3C2  F0 03     BEQ $D3C7
  $D3C4  C6 36     DEC $36
  $D3C6  60        RTS

L_D3C7:
  $D3C7  A9 00     LDA #$00
  $D3C9  85 3D     STA $3D
  $D3CB  A6 2C     LDX $2C
  $D3CD  BD D4 D3  LDA $D3D4,X
  $D3D0  8D 00 04  STA $0400
  $D3D3  60        RTS
  $D3D4  1A        .db $1A
  $D3D5  19 18 00  ORA $0018,Y
  $D3D8  04        .db $04
  $D3D9  08        PHP
  $D3DA  0C        .db $0C
  $D3DB  10 14     BPL $D3F1
  $D3DD  1B        .db $1B
  $D3DE  1F        .db $1F
  $D3DF  26 B9     ROL $B9
  $D3E1  4F        .db $4F
  $D3E2  D4        .db $D4
  $D3E3  9D 00 04  STA $0400,X
  $D3E6  AD 20 04  LDA $0420
  $D3E9  29 40     AND #$40
  $D3EB  08        PHP
  $D3EC  19 61 D4  ORA $D461,Y
  $D3EF  9D 20 04  STA $0420,X
  $D3F2  28        PLP
  $D3F3  D0 15     BNE $D40A
  $D3F5  38        SEC
  $D3F6  AD 60 04  LDA $0460
  $D3F9  F9 73 D4  SBC $D473,Y
  $D3FC  9D 60 04  STA $0460,X
  $D3FF  AD 40 04  LDA $0440
  $D402  E9 00     SBC #$00
  $D404  9D 40 04  STA $0440,X
  $D407  4C 1C D4  JMP $D41C

L_D40A:
  $D40A  18        CLC
  $D40B  AD 60 04  LDA $0460
  $D40E  79 73 D4  ADC $D473,Y
  $D411  9D 60 04  STA $0460,X
  $D414  AD 40 04  LDA $0440
  $D417  69 00     ADC #$00
  $D419  9D 40 04  STA $0440,X

L_D41C:
  $D41C  AD A0 04  LDA $04A0
  $D41F  9D A0 04  STA $04A0,X
  $D422  B9 85 D4  LDA $D485,Y
  $D425  9D 20 06  STA $0620,X
  $D428  B9 97 D4  LDA $D497,Y
  $D42B  9D 00 06  STA $0600,X
  $D42E  B9 A9 D4  LDA $D4A9,Y
  $D431  9D 60 06  STA $0660,X
  $D434  B9 BB D4  LDA $D4BB,Y
  $D437  9D 40 06  STA $0640,X
  $D43A  B9 CD D4  LDA $D4CD,Y
  $D43D  9D 90 05  STA $0590,X
  $D440  A9 00     LDA #$00
  $D442  9D A0 06  STA $06A0,X
  $D445  9D 80 06  STA $0680,X
  $D448  9D E0 04  STA $04E0,X
  $D44B  9D C0 06  STA $06C0,X
  $D44E  60        RTS
  $D44F  23        .db $23
  $D450  30 31     BMI $D483
  $D452  32        .db $32
  $D453  33        .db $33
  $D454  34        .db $34
  $D455  35 36     AND $36,X
  $D457  37        .db $37
  $D458  38        SEC
  $D459  39 3A 2F  AND $2F3A,Y
  $D45C  3E 3F 74  ROL $743F,X
  $D45F  79 7C 81  ADC $817C,Y
  $D462  83        .db $83
  $D463  83        .db $83
  $D464  82        .db $82
  $D465  87        .db $87
  $D466  83        .db $83
  $D467  83        .db $83
  $D468  81 82     STA ($82,X)
  $D46A  82        .db $82
  $D46B  82        .db $82
  $D46C  86 81     STX $81
  $D46E  82        .db $82
  $D46F  80        .db $80
  $D470  80        .db $80
  $D471  80        .db $80
  $D472  80        .db $80
  $D473  10 00     BPL $D475

L_D475:
  $D475  10 00     BPL $D477

L_D477:
  $D477  10 10     BPL $D489
  $D479  10 00     BPL $D47B

L_D47B:
  $D47B  00        BRK
  $D47C  20 20 00  JSR $0020
  $D47F  00        BRK
  $D480  00        BRK
  $D481  00        BRK
  $D482  00        BRK

L_D483:
  $D483  00        BRK
  $D484  00        BRK
  $D485  00        BRK
  $D486  00        BRK
  $D487  00        BRK
  $D488  00        BRK

L_D489:
  $D489  00        BRK
  $D48A  71 00     ADC ($00),Y
  $D48C  00        BRK
  $D48D  0F        .db $0F
  $D48E  00        BRK
  $D48F  00        BRK
  $D490  27        .db $27
  $D491  00        BRK
  $D492  00        BRK
  $D493  00        BRK
  $D494  00        BRK
  $D495  00        BRK
  $D496  00        BRK
  $D497  04        .db $04
  $D498  00        BRK
  $D499  00        BRK
  $D49A  00        BRK
  $D49B  01 04     ORA ($04,X)
  $D49D  04        .db $04
  $D49E  00        BRK
  $D49F  00        BRK
  $D4A0  00        BRK
  $D4A1  00        BRK
  $D4A2  01 00     ORA ($00,X)
  $D4A4  00        BRK
  $D4A5  00        BRK
  $D4A6  00        BRK
  $D4A7  00        BRK
  $D4A8  00        BRK
  $D4A9  00        BRK
  $D4AA  00        BRK
  $D4AB  40        RTI
  $D4AC  00        BRK
  $D4AD  00        BRK
  $D4AE  AA        TAX
  $D4AF  00        BRK
  $D4B0  00        BRK
  $D4B1  00        BRK
  $D4B2  41 00     EOR ($00,X)
  $D4B4  76 00     ROR $00,X
  $D4B6  00        BRK
  $D4B7  00        BRK
  $D4B8  C0 00     CPY #$00
  $D4BA  00        BRK
  $D4BB  00        BRK
  $D4BC  00        BRK
  $D4BD  00        BRK
  $D4BE  00        BRK
  $D4BF  02        .db $02
  $D4C0  02        .db $02
  $D4C1  00        BRK
  $D4C2  00        BRK
  $D4C3  00        BRK
  $D4C4  00        BRK
  $D4C5  00        BRK
  $D4C6  03        .db $03
  $D4C7  00        BRK
  $D4C8  00        BRK
  $D4C9  00        BRK
  $D4CA  FE 00 00  INC $0000,X
  $D4CD  01 01     ORA ($01,X)
  $D4CF  02        .db $02
  $D4D0  04        .db $04
  $D4D1  02        .db $02
  $D4D2  01 02     ORA ($02,X)
  $D4D4  02        .db $02
  $D4D5  00        BRK
  $D4D6  00        BRK
  $D4D7  00        BRK
  $D4D8  00        BRK
  $D4D9  02        .db $02
  $D4DA  00        BRK
  $D4DB  00        BRK
  $D4DC  00        BRK
  $D4DD  00        BRK
  $D4DE  00        BRK
  $D4DF  00        BRK
  $D4E0  20 40 60  JSR $6040
  $D4E3  80        .db $80
  $D4E4  0E 12 12  ASL $1212
  $D4E7  12        .db $12
  $D4E8  0A        ASL
  $D4E9  16 2E     ASL $2E,X
  $D4EB  0E 12 16  ASL $1612
  $D4EE  09 2E     ORA #$2E
  $D4F0  0A        ASL
  $D4F1  16 0E     ASL $0E,X
  $D4F3  0C        .db $0C
  $D4F4  0A        ASL
  $D4F5  1E 1E 26  ASL $261E,X
  $D4F8  46 02     LSR $02
  $D4FA  06 06     ASL $06
  $D4FC  06 06     ASL $06
  $D4FE  06 06     ASL $06
  $D500  06 06     ASL $06
  $D502  06 06     ASL $06
  $D504  0C        .db $0C
  $D505  10 10     BPL $D517
  $D507  10 08     BPL $D511
  $D509  14        .db $14
  $D50A  2C 0C 10  BIT $100C
  $D50D  14        .db $14
  $D50E  04        .db $04
  $D50F  2C 08 14  BIT $1408
  $D512  0C        .db $0C
  $D513  0A        ASL
  $D514  08        PHP
  $D515  1C        .db $1C
  $D516  1C        .db $1C

L_D517:
  $D517  24 44     BIT $44
  $D519  02        .db $02
  $D51A  04        .db $04
  $D51B  04        .db $04
  $D51C  04        .db $04
  $D51D  04        .db $04
  $D51E  04        .db $04
  $D51F  04        .db $04
  $D520  04        .db $04
  $D521  04        .db $04
  $D522  04        .db $04
  $D523  04        .db $04
  $D524  10 14     BPL $D53A
  $D526  14        .db $14
  $D527  14        .db $14
  $D528  0C        .db $0C
  $D529  18        CLC
  $D52A  30 10     BMI $D53C
  $D52C  14        .db $14
  $D52D  18        CLC
  $D52E  08        PHP
  $D52F  30 0C     BMI $D53D
  $D531  18        CLC
  $D532  10 0E     BPL $D542
  $D534  0A        ASL
  $D535  20 20 28  JSR $2820
  $D538  48        PHA
  $D539  02        .db $02

L_D53A:
  $D53A  08        PHP
  $D53B  08        PHP

L_D53C:
  $D53C  08        PHP

L_D53D:
  $D53D  08        PHP
  $D53E  08        PHP
  $D53F  08        PHP
  $D540  08        PHP
  $D541  08        PHP

L_D542:
  $D542  08        PHP
  $D543  08        PHP
  $D544  14        .db $14
  $D545  18        CLC
  $D546  18        CLC
  $D547  18        CLC
  $D548  10 1C     BPL $D566
  $D54A  34        .db $34
  $D54B  14        .db $14
  $D54C  18        CLC
  $D54D  1C        .db $1C
  $D54E  0C        .db $0C
  $D54F  34        .db $34
  $D550  10 1C     BPL $D56E
  $D552  14        .db $14
  $D553  12        .db $12
  $D554  10 24     BPL $D57A
  $D556  24 2C     BIT $2C
  $D558  4C 02 0C  JMP $0C02
  $D55B  0C        .db $0C
  $D55C  0C        .db $0C
  $D55D  0C        .db $0C
  $D55E  0C        .db $0C
  $D55F  0C        .db $0C
  $D560  0C        .db $0C
  $D561  0C        .db $0C
  $D562  0C        .db $0C
  $D563  0C        .db $0C
  $D564  18        CLC
  $D565  1C        .db $1C

L_D566:
  $D566  1C        .db $1C
  $D567  1C        .db $1C
  $D568  14        .db $14
  $D569  20 38 18  JSR $1838
  $D56C  1C        .db $1C
  $D56D  20 10 38  JSR $3810
  $D570  14        .db $14
  $D571  20 18 16  JSR $1618
  $D574  14        .db $14
  $D575  28        PLP
  $D576  28        PLP
  $D577  30 50     BMI $D5C9
  $D579  02        .db $02

L_D57A:
  $D57A  10 10     BPL $D58C
  $D57C  10 10     BPL $D58E
  $D57E  10 10     BPL $D590
  $D580  10 10     BPL $D592
  $D582  10 10     BPL $D594
  $D584  18        CLC
  $D585  14        .db $14
  $D586  10 0C     BPL $D594
  $D588  0C        .db $0C
  $D589  10 28     BPL $D5B3
  $D58B  10 1E     BPL $D5AB
  $D58D  18        CLC

L_D58E:
  $D58E  28        PLP
  $D58F  30 14     BMI $D5A5
  $D591  24 0C     BIT $0C
  $D593  10 18     BPL $D5AD
  $D595  10 20     BPL $D5B7
  $D597  38        SEC
  $D598  18        CLC
  $D599  18        CLC
  $D59A  08        PHP
  $D59B  08        PHP
  $D59C  08        PHP
  $D59D  08        PHP
  $D59E  08        PHP
  $D59F  08        PHP
  $D5A0  08        PHP
  $D5A1  08        PHP
  $D5A2  08        PHP
  $D5A3  08        PHP
  $D5A4  14        .db $14

L_D5A5:
  $D5A5  10 0C     BPL $D5B3
  $D5A7  08        PHP
  $D5A8  08        PHP
  $D5A9  0C        .db $0C
  $D5AA  24 0C     BIT $0C
  $D5AC  1A        .db $1A

L_D5AD:
  $D5AD  14        .db $14
  $D5AE  24 2C     BIT $2C
  $D5B0  10 20     BPL $D5D2
  $D5B2  08        PHP

L_D5B3:
  $D5B3  0C        .db $0C
  $D5B4  14        .db $14
  $D5B5  0C        .db $0C
  $D5B6  1C        .db $1C

L_D5B7:
  $D5B7  34        .db $34
  $D5B8  14        .db $14
  $D5B9  14        .db $14
  $D5BA  04        .db $04
  $D5BB  04        .db $04
  $D5BC  04        .db $04
  $D5BD  04        .db $04
  $D5BE  04        .db $04
  $D5BF  04        .db $04
  $D5C0  04        .db $04
  $D5C1  04        .db $04
  $D5C2  04        .db $04
  $D5C3  04        .db $04
  $D5C4  18        CLC
  $D5C5  14        .db $14
  $D5C6  10 0C     BPL $D5D4
  $D5C8  0C        .db $0C

L_D5C9:
  $D5C9  10 28     BPL $D5F3
  $D5CB  10 1E     BPL $D5EB
  $D5CD  18        CLC
  $D5CE  28        PLP
  $D5CF  30 14     BMI $D5E5

L_D5D1:
  $D5D1  24 0C     BIT $0C
  $D5D3  10 18     BPL $D5ED
  $D5D5  10 20     BPL $D5F7
  $D5D7  38        SEC
  $D5D8  18        CLC
  $D5D9  18        CLC
  $D5DA  08        PHP
  $D5DB  08        PHP
  $D5DC  08        PHP
  $D5DD  08        PHP
  $D5DE  08        PHP
  $D5DF  08        PHP
  $D5E0  08        PHP
  $D5E1  08        PHP
  $D5E2  08        PHP
  $D5E3  08        PHP
  $D5E4  1C        .db $1C

L_D5E5:
  $D5E5  18        CLC
  $D5E6  14        .db $14
  $D5E7  10 10     BPL $D5F9
  $D5E9  14        .db $14
  $D5EA  2C 14 22  BIT $2214

L_D5ED:
  $D5ED  1C        .db $1C
  $D5EE  2C 34 18  BIT $1834
  $D5F1  28        PLP
  $D5F2  10 14     BPL $D608
  $D5F4  1C        .db $1C
  $D5F5  14        .db $14
  $D5F6  24 3C     BIT $3C
  $D5F8  1C        .db $1C

L_D5F9:
  $D5F9  1C        .db $1C
  $D5FA  0C        .db $0C
  $D5FB  0C        .db $0C
  $D5FC  0C        .db $0C
  $D5FD  0C        .db $0C
  $D5FE  0C        .db $0C
  $D5FF  0C        .db $0C
  $D600  0C        .db $0C
  $D601  0C        .db $0C
  $D602  0C        .db $0C
  $D603  0C        .db $0C
  $D604  20 1C 18  JSR $181C
  $D607  14        .db $14

L_D608:
  $D608  14        .db $14
  $D609  18        CLC
  $D60A  30 18     BMI $D624
  $D60C  26 20     ROL $20
  $D60E  30 38     BMI $D648
  $D610  1C        .db $1C
  $D611  2C 14 18  BIT $1814
  $D614  20 18 28  JSR $2818
  $D617  40        RTI
  $D618  20 20 10  JSR $1020
  $D61B  10 10     BPL $D62D
  $D61D  10 10     BPL $D62F
  $D61F  10 10     BPL $D631
  $D621  10 10     BPL $D633
  $D623  10 AC     BPL $D5D1
  $D625  00        BRK
  $D626  04        .db $04
  $D627  84 01     STY $01
  $D629  A9 09     LDA #$09
  $D62B  20 00 C0  JSR $C000
  $D62E  20 00 86  JSR $8600

L_D631:
  $D631  A9 0D     LDA #$0D

L_D633:
  $D633  20 00 C0  JSR $C000
  $D636  60        RTS
  $D637  A9 09     LDA #$09
  $D639  20 00 C0  JSR $C000
  $D63C  20 03 86  JSR $8603
  $D63F  4C 31 D6  JMP $D631
  $D642  A9 09     LDA #$09
  $D644  20 00 C0  JSR $C000
  $D647  20 06 86  JSR $8606
  $D64A  4C 31 D6  JMP $D631
  $D64D  A9 09     LDA #$09
  $D64F  20 00 C0  JSR $C000
  $D652  20 09 86  JSR $8609
  $D655  4C 31 D6  JMP $D631

L_D658:
  $D658  A5 2A     LDA $2A
  $D65A  29 07     AND #$07
  $D65C  20 00 C0  JSR $C000
  $D65F  18        CLC
  $D660  A5 1F     LDA $1F
  $D662  85 0A     STA $0A
  $D664  69 FF     ADC #$FF
  $D666  85 08     STA $08
  $D668  A5 20     LDA $20
  $D66A  85 0B     STA $0B
  $D66C  69 00     ADC #$00
  $D66E  85 09     STA $09
  $D670  A5 42     LDA $42
  $D672  29 40     AND #$40
  $D674  D0 72     BNE $D6E8

L_D676:
  $D676  A4 48     LDY $48
  $D678  F0 18     BEQ $D692
  $D67A  B9 FF B5  LDA $B5FF,Y
  $D67D  C5 0B     CMP $0B
  $D67F  90 11     BCC $D692
  $D681  D0 07     BNE $D68A
  $D683  B9 FF B6  LDA $B6FF,Y
  $D686  C5 0A     CMP $0A
  $D688  90 08     BCC $D692

L_D68A:
  $D68A  88        DEY
  $D68B  20 53 D7  JSR $D753
  $D68E  C6 48     DEC $48
  $D690  D0 E4     BNE $D676

L_D692:
  $D692  A4 49     LDY $49
  $D694  F0 13     BEQ $D6A9

L_D696:
  $D696  B9 FF B5  LDA $B5FF,Y
  $D699  C5 09     CMP $09
  $D69B  90 0C     BCC $D6A9
  $D69D  D0 07     BNE $D6A6
  $D69F  B9 FF B6  LDA $B6FF,Y
  $D6A2  C5 08     CMP $08
  $D6A4  90 03     BCC $D6A9

L_D6A6:
  $D6A6  88        DEY
  $D6A7  D0 ED     BNE $D696

L_D6A9:
  $D6A9  84 49     STY $49

L_D6AB:
  $D6AB  A4 4C     LDY $4C
  $D6AD  F0 1D     BEQ $D6CC
  $D6AF  B9 FF B9  LDA $B9FF,Y
  $D6B2  C5 0B     CMP $0B
  $D6B4  90 16     BCC $D6CC
  $D6B6  D0 07     BNE $D6BF
  $D6B8  B9 3F BA  LDA $BA3F,Y
  $D6BB  C5 0A     CMP $0A
  $D6BD  90 0D     BCC $D6CC

L_D6BF:
  $D6BF  B9 3F 01  LDA $013F,Y
  $D6C2  F0 04     BEQ $D6C8
  $D6C4  88        DEY
  $D6C5  20 CC D7  JSR $D7CC

L_D6C8:
  $D6C8  C6 4C     DEC $4C
  $D6CA  D0 DF     BNE $D6AB

L_D6CC:
  $D6CC  A4 4D     LDY $4D
  $D6CE  F0 13     BEQ $D6E3

L_D6D0:
  $D6D0  B9 FF B9  LDA $B9FF,Y
  $D6D3  C5 09     CMP $09
  $D6D5  90 0C     BCC $D6E3
  $D6D7  D0 07     BNE $D6E0
  $D6D9  B9 3F BA  LDA $BA3F,Y
  $D6DC  C5 08     CMP $08
  $D6DE  90 03     BCC $D6E3

L_D6E0:
  $D6E0  88        DEY
  $D6E1  D0 ED     BNE $D6D0

L_D6E3:
  $D6E3  84 4D     STY $4D
  $D6E5  4C 4D D7  JMP $D74D

L_D6E8:
  $D6E8  A4 49     LDY $49
  $D6EA  A5 09     LDA $09
  $D6EC  D9 00 B6  CMP $B600,Y
  $D6EF  90 10     BCC $D701
  $D6F1  D0 07     BNE $D6FA
  $D6F3  A5 08     LDA $08
  $D6F5  D9 00 B7  CMP $B700,Y
  $D6F8  90 07     BCC $D701

L_D6FA:
  $D6FA  20 53 D7  JSR $D753
  $D6FD  E6 49     INC $49
  $D6FF  D0 E7     BNE $D6E8

L_D701:
  $D701  A4 48     LDY $48

L_D703:
  $D703  A5 0B     LDA $0B
  $D705  D9 00 B6  CMP $B600,Y
  $D708  90 0C     BCC $D716
  $D70A  D0 07     BNE $D713
  $D70C  A5 0A     LDA $0A
  $D70E  D9 00 B7  CMP $B700,Y
  $D711  90 03     BCC $D716

L_D713:
  $D713  C8        INY
  $D714  D0 ED     BNE $D703

L_D716:
  $D716  84 48     STY $48

L_D718:
  $D718  A4 4D     LDY $4D
  $D71A  A5 09     LDA $09
  $D71C  D9 00 BA  CMP $BA00,Y
  $D71F  90 15     BCC $D736
  $D721  D0 07     BNE $D72A
  $D723  A5 08     LDA $08
  $D725  D9 40 BA  CMP $BA40,Y
  $D728  90 0C     BCC $D736

L_D72A:
  $D72A  B9 40 01  LDA $0140,Y
  $D72D  F0 03     BEQ $D732
  $D72F  20 CC D7  JSR $D7CC

L_D732:
  $D732  E6 4D     INC $4D
  $D734  D0 E2     BNE $D718

L_D736:
  $D736  A4 4C     LDY $4C

L_D738:
  $D738  A5 0B     LDA $0B
  $D73A  D9 00 BA  CMP $BA00,Y
  $D73D  90 0C     BCC $D74B
  $D73F  D0 07     BNE $D748
  $D741  A5 0A     LDA $0A
  $D743  D9 40 BA  CMP $BA40,Y
  $D746  90 03     BCC $D74B

L_D748:
  $D748  C8        INY
  $D749  D0 ED     BNE $D738

L_D74B:
  $D74B  84 4C     STY $4C

L_D74D:
  $D74D  A9 0E     LDA #$0E
  $D74F  20 00 C0  JSR $C000
  $D752  60        RTS

L_D753:
  $D753  98        TYA
  $D754  A2 0F     LDX #$0F

L_D756:
  $D756  DD 00 01  CMP $0100,X
  $D759  F0 70     BEQ $D7CB
  $D75B  CA        DEX
  $D75C  10 F8     BPL $D756
  $D75E  20 43 DA  JSR $DA43
  $D761  B0 68     BCS $D7CB
  $D763  98        TYA
  $D764  9D 00 01  STA $0100,X
  $D767  B9 00 B6  LDA $B600,Y
  $D76A  9D 50 04  STA $0450,X
  $D76D  B9 00 B7  LDA $B700,Y
  $D770  9D 70 04  STA $0470,X
  $D773  B9 00 B8  LDA $B800,Y
  $D776  9D B0 04  STA $04B0,X
  $D779  B9 00 B9  LDA $B900,Y

L_D77C:
  $D77C  9D 10 04  STA $0410,X
  $D77F  A8        TAY
  $D780  48        PHA
  $D781  B9 05 D8  LDA $D805,Y
  $D784  9D 30 04  STA $0430,X
  $D787  B9 81 D9  LDA $D981,Y
  $D78A  9D F0 06  STA $06F0,X
  $D78D  A9 14     LDA #$14
  $D78F  9D D0 06  STA $06D0,X
  $D792  B9 85 D8  LDA $D885,Y
  $D795  A8        TAY
  $D796  B9 01 DA  LDA $DA01,Y
  $D799  9D 10 06  STA $0610,X
  $D79C  B9 02 DA  LDA $DA02,Y
  $D79F  9D 30 06  STA $0630,X
  $D7A2  68        PLA
  $D7A3  A8        TAY
  $D7A4  B9 01 D9  LDA $D901,Y
  $D7A7  A8        TAY
  $D7A8  B9 21 DA  LDA $DA21,Y
  $D7AB  9D 50 06  STA $0650,X
  $D7AE  B9 22 DA  LDA $DA22,Y
  $D7B1  9D 70 06  STA $0670,X
  $D7B4  A9 00     LDA #$00
  $D7B6  9D B0 06  STA $06B0,X
  $D7B9  9D 90 06  STA $0690,X
  $D7BC  9D F0 04  STA $04F0,X
  $D7BF  9D 20 01  STA $0120,X
  $D7C2  9D 90 04  STA $0490,X
  $D7C5  9D D0 04  STA $04D0,X
  $D7C8  9D 10 01  STA $0110,X

L_D7CB:
  $D7CB  60        RTS

L_D7CC:
  $D7CC  98        TYA
  $D7CD  A2 0F     LDX #$0F

L_D7CF:
  $D7CF  DD 30 01  CMP $0130,X
  $D7D2  F0 F7     BEQ $D7CB
  $D7D4  CA        DEX
  $D7D5  10 F8     BPL $D7CF
  $D7D7  20 43 DA  JSR $DA43
  $D7DA  B0 EF     BCS $D7CB
  $D7DC  98        TYA
  $D7DD  48        PHA
  $D7DE  9D 30 01  STA $0130,X
  $D7E1  B9 00 BA  LDA $BA00,Y
  $D7E4  9D 50 04  STA $0450,X
  $D7E7  B9 40 BA  LDA $BA40,Y
  $D7EA  9D 70 04  STA $0470,X
  $D7ED  B9 80 BA  LDA $BA80,Y
  $D7F0  9D B0 04  STA $04B0,X
  $D7F3  B9 C0 BA  LDA $BAC0,Y
  $D7F6  20 7C D7  JSR $D77C
  $D7F9  68        PLA
  $D7FA  9D 20 01  STA $0120,X
  $D7FD  A8        TAY
  $D7FE  B9 40 01  LDA $0140,Y
  $D801  9D D0 06  STA $06D0,X
  $D804  60        RTS
  $D805  83        .db $83
  $D806  83        .db $83
  $D807  A0 A0     LDY #$A0
  $D809  83        .db $83
  $D80A  A0 80     LDY #$80
  $D80C  A0 83     LDY #$83
  $D80E  A0 83     LDY #$83
  $D810  83        .db $83
  $D811  83        .db $83
  $D812  87        .db $87
  $D813  80        .db $80
  $D814  83        .db $83
  $D815  83        .db $83
  $D816  A0 80     LDY #$80
  $D818  80        .db $80
  $D819  A0 A0     LDY #$A0
  $D81B  8B        .db $8B
  $D81C  87        .db $87
  $D81D  81 83     STA ($83,X)
  $D81F  80        .db $80
  $D820  81 A0     STA ($A0,X)
  $D822  A3        .db $A3
  $D823  A0 87     LDY #$87
  $D825  A0 A0     LDY #$A0
  $D827  83        .db $83
  $D828  83        .db $83
  $D829  85 A0     STA $A0
  $D82B  A0 A0     LDY #$A0
  $D82D  A0 83     LDY #$83
  $D82F  87        .db $87
  $D830  A0 87     LDY #$87
  $D832  92        .db $92
  $D833  B0 B0     BCS $D7E5
  $D835  83        .db $83
  $D836  87        .db $87
  $D837  AB        .db $AB
  $D838  87        .db $87
  $D839  8F        .db $8F
  $D83A  81 83     STA ($83,X)
  $D83C  A0 83     LDY #$83
  $D83E  A0 80     LDY #$80
  $D840  84 83     STY $83
  $D842  83        .db $83
  $D843  80        .db $80
  $D844  85 A0     STA $A0
  $D846  A0 A0     LDY #$A0
  $D848  A0 8B     LDY #$8B
  $D84A  83        .db $83
  $D84B  83        .db $83
  $D84C  A0 83     LDY #$83
  $D84E  83        .db $83
  $D84F  A0 83     LDY #$83
  $D851  C3        .db $C3
  $D852  85 83     STA $83
  $D854  8F        .db $8F
  $D855  83        .db $83
  $D856  83        .db $83
  $D857  A1 A0     LDA ($A0,X)
  $D859  A0 A0     LDY #$A0
  $D85B  A0 92     LDY #$92
  $D85D  81 81     STA ($81,X)
  $D85F  81 85     STA ($85,X)
  $D861  81 8B     STA ($8B,X)
  $D863  81 81     STA ($81,X)
  $D865  80        .db $80
  $D866  8B        .db $8B
  $D867  81 80     STA ($80,X)
  $D869  A0 8B     LDY #$8B
  $D86B  8B        .db $8B
  $D86C  80        .db $80
  $D86D  81 8B     STA ($8B,X)
  $D86F  87        .db $87
  $D870  81 80     STA ($80,X)
  $D872  83        .db $83
  $D873  81 81     STA ($81,X)
  $D875  80        .db $80
  $D876  A3        .db $A3
  $D877  81 81     STA ($81,X)
  $D879  85 00     STA $00
  $D87B  81 81     STA ($81,X)
  $D87D  81 81     STA ($81,X)
  $D87F  81 81     STA ($81,X)
  $D881  81 81     STA ($81,X)
  $D883  81 00     STA ($00,X)
  $D885  00        BRK
  $D886  02        .db $02
  $D887  02        .db $02
  $D888  02        .db $02
  $D889  02        .db $02
  $D88A  02        .db $02
  $D88B  02        .db $02
  $D88C  02        .db $02
  $D88D  02        .db $02
  $D88E  02        .db $02
  $D88F  04        .db $04
  $D890  06 02     ASL $02
  $D892  02        .db $02
  $D893  02        .db $02
  $D894  02        .db $02
  $D895  02        .db $02
  $D896  02        .db $02
  $D897  02        .db $02
  $D898  02        .db $02
  $D899  02        .db $02
  $D89A  08        PHP
  $D89B  02        .db $02
  $D89C  02        .db $02
  $D89D  02        .db $02
  $D89E  02        .db $02
  $D89F  02        .db $02
  $D8A0  0A        ASL
  $D8A1  02        .db $02
  $D8A2  02        .db $02
  $D8A3  02        .db $02
  $D8A4  0C        .db $0C
  $D8A5  02        .db $02
  $D8A6  02        .db $02
  $D8A7  02        .db $02
  $D8A8  02        .db $02
  $D8A9  02        .db $02
  $D8AA  02        .db $02
  $D8AB  02        .db $02
  $D8AC  02        .db $02
  $D8AD  02        .db $02
  $D8AE  02        .db $02
  $D8AF  02        .db $02
  $D8B0  02        .db $02
  $D8B1  02        .db $02
  $D8B2  1C        .db $1C
  $D8B3  0E 0E 02  ASL $020E
  $D8B6  10 02     BPL $D8BA
  $D8B8  02        .db $02
  $D8B9  02        .db $02

L_D8BA:
  $D8BA  02        .db $02
  $D8BB  02        .db $02
  $D8BC  02        .db $02
  $D8BD  12        .db $12
  $D8BE  02        .db $02
  $D8BF  02        .db $02
  $D8C0  14        .db $14
  $D8C1  02        .db $02
  $D8C2  02        .db $02
  $D8C3  02        .db $02
  $D8C4  16 02     ASL $02,X
  $D8C6  02        .db $02
  $D8C7  02        .db $02
  $D8C8  02        .db $02
  $D8C9  02        .db $02
  $D8CA  18        CLC
  $D8CB  02        .db $02
  $D8CC  02        .db $02
  $D8CD  02        .db $02
  $D8CE  02        .db $02
  $D8CF  02        .db $02
  $D8D0  02        .db $02
  $D8D1  02        .db $02
  $D8D2  02        .db $02
  $D8D3  02        .db $02
  $D8D4  02        .db $02
  $D8D5  02        .db $02
  $D8D6  02        .db $02
  $D8D7  02        .db $02
  $D8D8  1A        .db $1A
  $D8D9  1A        .db $1A
  $D8DA  1A        .db $1A
  $D8DB  02        .db $02
  $D8DC  0E 02 02  ASL $0202
  $D8DF  08        PHP
  $D8E0  14        .db $14
  $D8E1  02        .db $02
  $D8E2  02        .db $02
  $D8E3  02        .db $02
  $D8E4  02        .db $02
  $D8E5  02        .db $02
  $D8E6  02        .db $02
  $D8E7  02        .db $02
  $D8E8  02        .db $02
  $D8E9  02        .db $02
  $D8EA  02        .db $02
  $D8EB  02        .db $02
  $D8EC  02        .db $02
  $D8ED  02        .db $02
  $D8EE  02        .db $02
  $D8EF  02        .db $02
  $D8F0  02        .db $02
  $D8F1  08        PHP
  $D8F2  1E 02 02  ASL $0202,X
  $D8F5  02        .db $02
  $D8F6  02        .db $02
  $D8F7  02        .db $02
  $D8F8  02        .db $02
  $D8F9  02        .db $02
  $D8FA  02        .db $02
  $D8FB  02        .db $02
  $D8FC  02        .db $02
  $D8FD  02        .db $02
  $D8FE  02        .db $02
  $D8FF  02        .db $02
  $D900  02        .db $02
  $D901  00        BRK
  $D902  02        .db $02
  $D903  02        .db $02
  $D904  02        .db $02
  $D905  04        .db $04
  $D906  02        .db $02
  $D907  04        .db $04
  $D908  04        .db $04
  $D909  06 04     ASL $04
  $D90B  02        .db $02
  $D90C  08        PHP
  $D90D  02        .db $02
  $D90E  08        PHP
  $D90F  0A        ASL
  $D910  02        .db $02
  $D911  02        .db $02
  $D912  02        .db $02
  $D913  02        .db $02
  $D914  02        .db $02
  $D915  02        .db $02
  $D916  02        .db $02
  $D917  02        .db $02
  $D918  02        .db $02
  $D919  02        .db $02
  $D91A  01 02     ORA ($02,X)
  $D91C  0E 0C 02  ASL $020C
  $D91F  02        .db $02
  $D920  02        .db $02
  $D921  02        .db $02
  $D922  02        .db $02
  $D923  02        .db $02
  $D924  02        .db $02
  $D925  10 02     BPL $D929
  $D927  02        .db $02
  $D928  02        .db $02

L_D929:
  $D929  02        .db $02
  $D92A  02        .db $02
  $D92B  02        .db $02
  $D92C  02        .db $02
  $D92D  04        .db $04
  $D92E  02        .db $02
  $D92F  02        .db $02
  $D930  02        .db $02
  $D931  02        .db $02
  $D932  02        .db $02
  $D933  02        .db $02
  $D934  02        .db $02
  $D935  02        .db $02
  $D936  02        .db $02
  $D937  02        .db $02
  $D938  02        .db $02
  $D939  02        .db $02
  $D93A  02        .db $02
  $D93B  0A        ASL
  $D93C  10 02     BPL $D940
  $D93E  02        .db $02
  $D93F  02        .db $02

L_D940:
  $D940  10 02     BPL $D944
  $D942  02        .db $02
  $D943  02        .db $02

L_D944:
  $D944  02        .db $02
  $D945  20 02 02  JSR $0202
  $D948  02        .db $02
  $D949  14        .db $14
  $D94A  16 02     ASL $02,X
  $D94C  02        .db $02
  $D94D  02        .db $02
  $D94E  02        .db $02
  $D94F  02        .db $02
  $D950  18        CLC
  $D951  02        .db $02
  $D952  02        .db $02
  $D953  02        .db $02
  $D954  02        .db $02
  $D955  02        .db $02
  $D956  02        .db $02
  $D957  02        .db $02
  $D958  02        .db $02
  $D959  02        .db $02
  $D95A  02        .db $02
  $D95B  02        .db $02
  $D95C  1C        .db $1C
  $D95D  02        .db $02
  $D95E  02        .db $02
  $D95F  02        .db $02
  $D960  02        .db $02
  $D961  02        .db $02
  $D962  02        .db $02
  $D963  10 02     BPL $D967
  $D965  02        .db $02
  $D966  02        .db $02

L_D967:
  $D967  02        .db $02
  $D968  14        .db $14
  $D969  02        .db $02
  $D96A  02        .db $02
  $D96B  02        .db $02
  $D96C  1E 02 02  ASL $0202,X
  $D96F  02        .db $02
  $D970  02        .db $02
  $D971  02        .db $02
  $D972  02        .db $02
  $D973  02        .db $02
  $D974  02        .db $02
  $D975  02        .db $02
  $D976  02        .db $02
  $D977  02        .db $02
  $D978  02        .db $02
  $D979  02        .db $02
  $D97A  02        .db $02
  $D97B  02        .db $02
  $D97C  02        .db $02
  $D97D  02        .db $02
  $D97E  02        .db $02
  $D97F  02        .db $02
  $D980  02        .db $02
  $D981  00        BRK
  $D982  00        BRK
  $D983  00        BRK
  $D984  01 01     ORA ($01,X)
  $D986  01 01     ORA ($01,X)
  $D988  01 02     ORA ($02,X)
  $D98A  02        .db $02
  $D98B  01 01     ORA ($01,X)
  $D98D  01 04     ORA ($04,X)
  $D98F  00        BRK
  $D990  05 06     ORA $06
  $D992  01 01     ORA ($01,X)
  $D994  01 07     ORA ($07,X)
  $D996  07        .db $07
  $D997  02        .db $02
  $D998  01 04     ORA ($04,X)
  $D99A  08        PHP
  $D99B  02        .db $02
  $D99C  04        .db $04
  $D99D  08        PHP
  $D99E  09 00     ORA #$00
  $D9A0  00        BRK
  $D9A1  00        BRK
  $D9A2  00        BRK
  $D9A3  07        .db $07
  $D9A4  09 07     ORA #$07
  $D9A6  00        BRK
  $D9A7  00        BRK
  $D9A8  00        BRK
  $D9A9  00        BRK
  $D9AA  09 00     ORA #$00
  $D9AC  00        BRK
  $D9AD  00        BRK
  $D9AE  10 00     BPL $D9B0

L_D9B0:
  $D9B0  00        BRK
  $D9B1  05 07     ORA $07
  $D9B3  0A        ASL
  $D9B4  07        .db $07
  $D9B5  07        .db $07
  $D9B6  04        .db $04
  $D9B7  09 00     ORA #$00
  $D9B9  07        .db $07
  $D9BA  00        BRK
  $D9BB  07        .db $07
  $D9BC  04        .db $04
  $D9BD  04        .db $04
  $D9BE  01 03     ORA ($03,X)
  $D9C0  07        .db $07
  $D9C1  0B        .db $0B
  $D9C2  0B        .db $0B
  $D9C3  00        BRK
  $D9C4  00        BRK
  $D9C5  07        .db $07
  $D9C6  07        .db $07
  $D9C7  07        .db $07
  $D9C8  00        BRK
  $D9C9  0C        .db $0C
  $D9CA  0C        .db $0C
  $D9CB  00        BRK
  $D9CC  01 01     ORA ($01,X)
  $D9CE  04        .db $04
  $D9CF  0D 01 0E  ORA $0E01
  $D9D2  0F        .db $0F
  $D9D3  0A        ASL
  $D9D4  00        BRK
  $D9D5  00        BRK
  $D9D6  00        BRK
  $D9D7  13        .db $13
  $D9D8  10 04     BPL $D9DE
  $D9DA  04        .db $04
  $D9DB  0E 07 07  ASL $0707

L_D9DE:
  $D9DE  07        .db $07

L_D9DF:
  $D9DF  07        .db $07
  $D9E0  07        .db $07
  $D9E1  00        BRK
  $D9E2  12        .db $12
  $D9E3  07        .db $07
  $D9E4  00        BRK
  $D9E5  00        BRK
  $D9E6  13        .db $13
  $D9E7  00        BRK
  $D9E8  00        BRK
  $D9E9  02        .db $02
  $D9EA  00        BRK
  $D9EB  07        .db $07
  $D9EC  09 00     ORA #$00
  $D9EE  04        .db $04
  $D9EF  04        .db $04
  $D9F0  04        .db $04

L_D9F1:
  $D9F1  00        BRK
  $D9F2  0D 04 04  ORA $0404
  $D9F5  04        .db $04
  $D9F6  00        BRK
  $D9F7  07        .db $07
  $D9F8  04        .db $04
  $D9F9  07        .db $07
  $D9FA  04        .db $04
  $D9FB  07        .db $07
  $D9FC  07        .db $07
  $D9FD  15 15     ORA $15,X
  $D9FF  15 00     ORA $00,X
  $DA01  01 E3     ORA ($E3,X)
  $DA03  00        BRK
  $DA04  00        BRK
  $DA05  00        BRK
  $DA06  83        .db $83
  $DA07  00        BRK
  $DA08  C4 04     CPY $04
  $DA0A  40        RTI
  $DA0B  03        .db $03
  $DA0C  80        .db $80
  $DA0D  01 A9     ORA ($A9,X)
  $DA0F  F0 E0     BEQ $D9F1
  $DA11  00        BRK
  $DA12  41 02     EOR ($02,X)
  $DA14  0C        .db $0C
  $DA15  01 00     ORA ($00,X)
  $DA17  01 40     ORA ($40,X)
  $DA19  00        BRK
  $DA1A  6C F0 F0  JMP ($F0F0)
  $DA1D  F0 C0     BEQ $D9DF
  $DA1F  01 77     ORA ($77,X)
  $DA21  00        BRK
  $DA22  C7        .db $C7
  $DA23  00        BRK
  $DA24  00        BRK
  $DA25  FF        .db $FF
  $DA26  5D FE 98  EOR $98FE,X
  $DA29  04        .db $04
  $DA2A  E6 01     INC $01
  $DA2C  00        BRK
  $DA2D  F8        SED
  $DA2E  00        BRK
  $DA2F  FC        .db $FC
  $DA30  00        BRK
  $DA31  04        .db $04
  $DA32  00        BRK
  $DA33  01 47     ORA ($47,X)
  $DA35  08        PHP
  $DA36  00        BRK
  $DA37  F8        SED
  $DA38  00        BRK
  $DA39  02        .db $02
  $DA3A  D4        .db $D4
  $DA3B  02        .db $02
  $DA3C  00        BRK
  $DA3D  03        .db $03
  $DA3E  76 FC     ROR $FC,X
  $DA40  8A        TXA
  $DA41  00        BRK
  $DA42  20 A2 0F  JSR $0FA2

L_DA45:
  $DA45  BD 30 04  LDA $0430,X
  $DA48  10 05     BPL $DA4F
  $DA4A  CA        DEX
  $DA4B  10 F8     BPL $DA45
  $DA4D  38        SEC
  $DA4E  60        RTS

L_DA4F:
  $DA4F  18        CLC
  $DA50  60        RTS
  $DA51  A5 F9     LDA $F9
  $DA53  D0 15     BNE $DA6A
  $DA55  A6 A9     LDX $A9
  $DA57  F0 04     BEQ $DA5D
  $DA59  B5 9B     LDA $9B,X
  $DA5B  F0 0D     BEQ $DA6A

L_DA5D:
  $DA5D  BD B8 DC  LDA $DCB8,X
  $DA60  85 08     STA $08
  $DA62  BD C4 DC  LDA $DCC4,X
  $DA65  85 09     STA $09
  $DA67  6C 08 00  JMP ($0008)

L_DA6A:
  $DA6A  38        SEC
  $DA6B  60        RTS
  $DA6C  A5 27     LDA $27
  $DA6E  29 02     AND #$02
  $DA70  F0 2B     BEQ $DA9D
  $DA72  A2 04     LDX #$04

L_DA74:
  $DA74  BD 20 04  LDA $0420,X
  $DA77  10 07     BPL $DA80
  $DA79  CA        DEX
  $DA7A  E0 01     CPX #$01
  $DA7C  D0 F6     BNE $DA74
  $DA7E  F0 1D     BEQ $DA9D

L_DA80:
  $DA80  A9 24     LDA #$24
  $DA82  20 51 C0  JSR $C051
  $DA85  A0 00     LDY #$00
  $DA87  20 E0 D3  JSR $D3E0

L_DA8A:
  $DA8A  A9 0F     LDA #$0F
  $DA8C  85 36     STA $36
  $DA8E  A9 01     LDA #$01

L_DA90:
  $DA90  85 3D     STA $3D
  $DA92  A6 2C     LDX $2C
  $DA94  18        CLC
  $DA95  7D D4 D3  ADC $D3D4,X
  $DA98  8D 00 04  STA $0400
  $DA9B  18        CLC
  $DA9C  60        RTS

L_DA9D:
  $DA9D  38        SEC
  $DA9E  60        RTS
  $DA9F  A5 27     LDA $27
  $DAA1  29 02     AND #$02
  $DAA3  F0 0C     BEQ $DAB1
  $DAA5  A2 02     LDX #$02
  $DAA7  A0 01     LDY #$01
  $DAA9  20 E0 D3  JSR $D3E0
  $DAAC  A9 82     LDA #$82
  $DAAE  9D 20 04  STA $0420,X

L_DAB1:
  $DAB1  38        SEC
  $DAB2  60        RTS
  $DAB3  A5 27     LDA $27
  $DAB5  29 02     AND #$02
  $DAB7  F0 2B     BEQ $DAE4
  $DAB9  A2 04     LDX #$04

L_DABB:
  $DABB  BD 20 04  LDA $0420,X
  $DABE  30 24     BMI $DAE4
  $DAC0  CA        DEX
  $DAC1  E0 01     CPX #$01
  $DAC3  D0 F6     BNE $DABB
  $DAC5  A2 04     LDX #$04

L_DAC7:
  $DAC7  86 01     STX $01
  $DAC9  A0 02     LDY #$02
  $DACB  20 E0 D3  JSR $D3E0
  $DACE  A6 01     LDX $01
  $DAD0  CA        DEX
  $DAD1  E0 01     CPX #$01
  $DAD3  D0 F2     BNE $DAC7
  $DAD5  A9 3F     LDA #$3F
  $DAD7  20 51 C0  JSR $C051
  $DADA  38        SEC
  $DADB  A5 9D     LDA $9D
  $DADD  E9 02     SBC #$02
  $DADF  85 9D     STA $9D
  $DAE1  4C 8A DA  JMP $DA8A

L_DAE4:
  $DAE4  38        SEC
  $DAE5  60        RTS
  $DAE6  A5 27     LDA $27
  $DAE8  29 02     AND #$02
  $DAEA  F0 1C     BEQ $DB08
  $DAEC  AD 22 04  LDA $0422
  $DAEF  30 17     BMI $DB08
  $DAF1  38        SEC
  $DAF2  A5 9E     LDA $9E
  $DAF4  E9 03     SBC #$03
  $DAF6  90 10     BCC $DB08
  $DAF8  A2 05     LDX #$05

L_DAFA:
  $DAFA  86 02     STX $02
  $DAFC  A0 03     LDY #$03
  $DAFE  20 E0 D3  JSR $D3E0
  $DB01  A6 02     LDX $02
  $DB03  CA        DEX
  $DB04  E0 01     CPX #$01
  $DB06  D0 F2     BNE $DAFA

L_DB08:
  $DB08  38        SEC
  $DB09  60        RTS
  $DB0A  A5 27     LDA $27
  $DB0C  29 02     AND #$02
  $DB0E  F0 29     BEQ $DB39
  $DB10  A2 03     LDX #$03

L_DB12:
  $DB12  BD 20 04  LDA $0420,X
  $DB15  10 07     BPL $DB1E
  $DB17  CA        DEX
  $DB18  E0 01     CPX #$01
  $DB1A  D0 F6     BNE $DB12
  $DB1C  F0 1B     BEQ $DB39

L_DB1E:
  $DB1E  A0 04     LDY #$04
  $DB20  20 E0 D3  JSR $D3E0
  $DB23  A9 24     LDA #$24
  $DB25  20 51 C0  JSR $C051
  $DB28  E6 AC     INC $AC
  $DB2A  A5 AC     LDA $AC
  $DB2C  C9 02     CMP #$02
  $DB2E  D0 06     BNE $DB36
  $DB30  A9 00     LDA #$00
  $DB32  85 AC     STA $AC
  $DB34  C6 9F     DEC $9F

L_DB36:
  $DB36  4C 8A DA  JMP $DA8A

L_DB39:
  $DB39  38        SEC
  $DB3A  60        RTS
  $DB3B  A5 27     LDA $27
  $DB3D  29 02     AND #$02
  $DB3F  D0 0A     BNE $DB4B
  $DB41  A5 AB     LDA $AB
  $DB43  C9 0B     CMP #$0B
  $DB45  F0 04     BEQ $DB4B
  $DB47  E6 AB     INC $AB
  $DB49  18        CLC
  $DB4A  60        RTS

L_DB4B:
  $DB4B  A2 05     LDX #$05

L_DB4D:
  $DB4D  BD 20 04  LDA $0420,X
  $DB50  10 07     BPL $DB59
  $DB52  CA        DEX
  $DB53  E0 01     CPX #$01
  $DB55  D0 F6     BNE $DB4D
  $DB57  F0 1F     BEQ $DB78

L_DB59:
  $DB59  A0 05     LDY #$05
  $DB5B  20 E0 D3  JSR $D3E0
  $DB5E  A9 24     LDA #$24
  $DB60  20 51 C0  JSR $C051
  $DB63  E6 AC     INC $AC
  $DB65  A5 AC     LDA $AC
  $DB67  C9 08     CMP #$08
  $DB69  D0 06     BNE $DB71
  $DB6B  A9 00     LDA #$00
  $DB6D  85 AC     STA $AC
  $DB6F  C6 A0     DEC $A0

L_DB71:
  $DB71  A9 00     LDA #$00
  $DB73  85 AB     STA $AB
  $DB75  4C 8A DA  JMP $DA8A

L_DB78:
  $DB78  38        SEC
  $DB79  60        RTS
  $DB7A  A5 27     LDA $27
  $DB7C  29 02     AND #$02
  $DB7E  F0 1D     BEQ $DB9D
  $DB80  AD 22 04  LDA $0422
  $DB83  30 18     BMI $DB9D
  $DB85  38        SEC
  $DB86  A5 A3     LDA $A3
  $DB88  E9 04     SBC #$04
  $DB8A  90 11     BCC $DB9D
  $DB8C  85 A3     STA $A3
  $DB8E  A2 02     LDX #$02
  $DB90  A0 06     LDY #$06
  $DB92  20 E0 D3  JSR $D3E0
  $DB95  A9 24     LDA #$24
  $DB97  20 51 C0  JSR $C051
  $DB9A  4C 8A DA  JMP $DA8A

L_DB9D:
  $DB9D  38        SEC
  $DB9E  60        RTS
  $DB9F  A5 27     LDA $27
  $DBA1  29 02     AND #$02
  $DBA3  F0 4A     BEQ $DBEF
  $DBA5  A2 04     LDX #$04

L_DBA7:
  $DBA7  BD 20 04  LDA $0420,X
  $DBAA  10 07     BPL $DBB3
  $DBAC  CA        DEX
  $DBAD  E0 01     CPX #$01
  $DBAF  D0 F6     BNE $DBA7
  $DBB1  F0 3C     BEQ $DBEF

L_DBB3:
  $DBB3  A0 07     LDY #$07
  $DBB5  20 E0 D3  JSR $D3E0
  $DBB8  A9 23     LDA #$23
  $DBBA  20 51 C0  JSR $C051
  $DBBD  E6 AC     INC $AC
  $DBBF  A5 AC     LDA $AC
  $DBC1  C9 04     CMP #$04
  $DBC3  D0 06     BNE $DBCB
  $DBC5  A9 00     LDA #$00
  $DBC7  85 AC     STA $AC
  $DBC9  C6 A2     DEC $A2

L_DBCB:
  $DBCB  A5 23     LDA $23
  $DBCD  29 F0     AND #$F0
  $DBCF  4A        LSR
  $DBD0  4A        LSR
  $DBD1  4A        LSR
  $DBD2  4A        LSR
  $DBD3  A8        TAY
  $DBD4  B9 F1 DB  LDA $DBF1,Y
  $DBD7  9D 60 06  STA $0660,X
  $DBDA  B9 01 DC  LDA $DC01,Y
  $DBDD  9D 40 06  STA $0640,X
  $DBE0  B9 11 DC  LDA $DC11,Y
  $DBE3  9D 20 06  STA $0620,X
  $DBE6  B9 21 DC  LDA $DC21,Y
  $DBE9  9D 00 06  STA $0600,X
  $DBEC  4C 4D DC  JMP $DC4D

L_DBEF:
  $DBEF  38        SEC
  $DBF0  60        RTS
  $DBF1  00        BRK
  $DBF2  00        BRK
  $DBF3  00        BRK
  $DBF4  00        BRK
  $DBF5  00        BRK
  $DBF6  D4        .db $D4
  $DBF7  2C 00 00  BIT $0000
  $DBFA  D4        .db $D4
  $DBFB  2C 00 00  BIT $0000
  $DBFE  00        BRK
  $DBFF  00        BRK
  $DC00  00        BRK
  $DC01  00        BRK
  $DC02  04        .db $04
  $DC03  FC        .db $FC
  $DC04  00        BRK
  $DC05  00        BRK
  $DC06  02        .db $02
  $DC07  FD 00 00  SBC $0000,X
  $DC0A  02        .db $02
  $DC0B  FD 00 00  SBC $0000,X
  $DC0E  00        BRK
  $DC0F  00        BRK
  $DC10  00        BRK
  $DC11  00        BRK
  $DC12  00        BRK
  $DC13  00        BRK
  $DC14  00        BRK
  $DC15  00        BRK
  $DC16  D4        .db $D4
  $DC17  D4        .db $D4
  $DC18  00        BRK
  $DC19  00        BRK
  $DC1A  D4        .db $D4
  $DC1B  D4        .db $D4
  $DC1C  00        BRK
  $DC1D  00        BRK
  $DC1E  00        BRK
  $DC1F  00        BRK
  $DC20  00        BRK
  $DC21  04        .db $04
  $DC22  00        BRK
  $DC23  00        BRK
  $DC24  00        BRK
  $DC25  04        .db $04
  $DC26  02        .db $02
  $DC27  02        .db $02
  $DC28  00        BRK
  $DC29  04        .db $04
  $DC2A  02        .db $02
  $DC2B  02        .db $02
  $DC2C  00        BRK
  $DC2D  00        BRK
  $DC2E  00        BRK
  $DC2F  00        BRK
  $DC30  00        BRK
  $DC31  A5 27     LDA $27
  $DC33  29 02     AND #$02
  $DC35  F0 1F     BEQ $DC56
  $DC37  A2 02     LDX #$02
  $DC39  AD 22 04  LDA $0422
  $DC3C  30 18     BMI $DC56
  $DC3E  A0 08     LDY #$08
  $DC40  20 E0 D3  JSR $D3E0
  $DC43  A9 01     LDA #$01
  $DC45  8D A6 05  STA $05A6
  $DC48  A9 21     LDA #$21
  $DC4A  20 51 C0  JSR $C051

L_DC4D:
  $DC4D  A9 0F     LDA #$0F
  $DC4F  85 36     STA $36
  $DC51  A9 03     LDA #$03
  $DC53  4C 90 DA  JMP $DA90

L_DC56:
  $DC56  38        SEC
  $DC57  60        RTS
  $DC58  A5 27     LDA $27
  $DC5A  29 02     AND #$02
  $DC5C  F0 F8     BEQ $DC56
  $DC5E  A2 04     LDX #$04

L_DC60:
  $DC60  BD 20 04  LDA $0420,X
  $DC63  10 07     BPL $DC6C
  $DC65  CA        DEX
  $DC66  E0 01     CPX #$01
  $DC68  D0 F6     BNE $DC60
  $DC6A  F0 0F     BEQ $DC7B

L_DC6C:
  $DC6C  A0 09     LDY #$09
  $DC6E  20 E0 D3  JSR $D3E0
  $DC71  38        SEC
  $DC72  A5 A4     LDA $A4
  $DC74  E9 02     SBC #$02
  $DC76  85 A4     STA $A4
  $DC78  4C 4D DC  JMP $DC4D

L_DC7B:
  $DC7B  38        SEC
  $DC7C  60        RTS
  $DC7D  A5 27     LDA $27
  $DC7F  29 02     AND #$02
  $DC81  F0 19     BEQ $DC9C
  $DC83  AD 22 04  LDA $0422
  $DC86  30 14     BMI $DC9C
  $DC88  A2 02     LDX #$02
  $DC8A  A0 0A     LDY #$0A
  $DC8C  20 E0 D3  JSR $D3E0
  $DC8F  A9 3E     LDA #$3E
  $DC91  8D E2 04  STA $04E2
  $DC94  A9 13     LDA #$13
  $DC96  8D C2 06  STA $06C2
  $DC99  4C 4D DC  JMP $DC4D

L_DC9C:
  $DC9C  60        RTS
  $DC9D  A5 27     LDA $27
  $DC9F  29 02     AND #$02
  $DCA1  F0 14     BEQ $DCB7
  $DCA3  AD 22 04  LDA $0422
  $DCA6  30 0F     BMI $DCB7
  $DCA8  A2 02     LDX #$02
  $DCAA  A0 0B     LDY #$0B
  $DCAC  20 E0 D3  JSR $D3E0
  $DCAF  A9 1F     LDA #$1F
  $DCB1  8D C2 06  STA $06C2
  $DCB4  4C 4D DC  JMP $DC4D

L_DCB7:
  $DCB7  60        RTS
  $DCB8  6C 9F B3  JMP ($B39F)
  $DCBB  E6 0A     INC $0A
  $DCBD  3B        .db $3B
  $DCBE  31 9F     AND ($9F),Y
  $DCC0  7A        .db $7A
  $DCC1  58        CLI
  $DCC2  7D 9D DA  ADC $DA9D,X
  $DCC5  DA        .db $DA
  $DCC6  DA        .db $DA
  $DCC7  DA        .db $DA
  $DCC8  DB        .db $DB
  $DCC9  DB        .db $DB
  $DCCA  DC        .db $DC
  $DCCB  DB        .db $DB
  $DCCC  DB        .db $DB
  $DCCD  DC        .db $DC
  $DCCE  DC        .db $DC
  $DCCF  DC        .db $DC

L_DCD0:
  $DCD0  A2 0F     LDX #$0F

L_DCD2:
  $DCD2  86 2B     STX $2B
  $DCD4  BD 20 04  LDA $0420,X
  $DCD7  10 10     BPL $DCE9
  $DCD9  29 02     AND #$02
  $DCDB  D0 14     BNE $DCF1
  $DCDD  38        SEC
  $DCDE  BD 60 04  LDA $0460,X
  $DCE1  E5 1F     SBC $1F
  $DCE3  9D E0 06  STA $06E0,X
  $DCE6  20 EF EE  JSR $EEEF

L_DCE9:
  $DCE9  A6 2B     LDX $2B
  $DCEB  CA        DEX
  $DCEC  E0 01     CPX #$01
  $DCEE  D0 E2     BNE $DCD2
  $DCF0  60        RTS

L_DCF1:
  $DCF1  A9 DC     LDA #$DC
  $DCF3  48        PHA
  $DCF4  A9 E8     LDA #$E8
  $DCF6  48        PHA
  $DCF7  38        SEC
  $DCF8  BD 60 04  LDA $0460,X
  $DCFB  E5 1F     SBC $1F
  $DCFD  9D E0 06  STA $06E0,X
  $DD00  38        SEC
  $DD01  BD 00 04  LDA $0400,X
  $DD04  E9 2F     SBC #$2F
  $DD06  A8        TAY
  $DD07  B9 14 DD  LDA $DD14,Y
  $DD0A  85 08     STA $08
  $DD0C  B9 24 DD  LDA $DD24,Y
  $DD0F  85 09     STA $09
  $DD11  6C 08 00  JMP ($0008)
  $DD14  34        .db $34
  $DD15  34        .db $34
  $DD16  48        PHA
  $DD17  74        .db $74
  $DD18  6F        .db $6F
  $DD19  CE 16 58  DEC $5816
  $DD1C  58        CLI
  $DD1D  90 10     BCC $DD2F
  $DD1F  DD 71 E4  CMP $E471,X
  $DD22  E4 E8     CPX $E8
  $DD24  DD DD DE  CMP $DEDD,X
  $DD27  DE DF DF  DEC $DFDF,X
  $DD2A  E0 E1     CPX #$E1
  $DD2C  E1 E1     SBC ($E1,X)
  $DD2E  E2        .db $E2

L_DD2F:
  $DD2F  E2        .db $E2
  $DD30  E4 E4     CPX $E4
  $DD32  E4 E4     CPX $E4
  $DD34  BD E0 04  LDA $04E0,X
  $DD37  F0 03     BEQ $DD3C
  $DD39  4C EC DD  JMP $DDEC

L_DD3C:
  $DD3C  A9 00     LDA #$00
  $DD3E  9D A0 06  STA $06A0,X
  $DD41  9D 80 06  STA $0680,X
  $DD44  A5 AC     LDA $AC
  $DD46  C9 FF     CMP #$FF
  $DD48  F0 02     BEQ $DD4C
  $DD4A  E6 AC     INC $AC

L_DD4C:
  $DD4C  A0 02     LDY #$02
  $DD4E  A5 AC     LDA $AC
  $DD50  C9 7D     CMP #$7D
  $DD52  90 08     BCC $DD5C
  $DD54  C8        INY
  $DD55  C8        INY
  $DD56  C9 BB     CMP #$BB
  $DD58  90 02     BCC $DD5C
  $DD5A  C8        INY
  $DD5B  C8        INY

L_DD5C:
  $DD5C  84 00     STY $00
  $DD5E  A5 1C     LDA $1C
  $DD60  29 04     AND #$04
  $DD62  D0 02     BNE $DD66
  $DD64  A0 00     LDY #$00

L_DD66:
  $DD66  20 18 DE  JSR $DE18
  $DD69  AD A0 04  LDA $04A0
  $DD6C  9D A0 04  STA $04A0,X
  $DD6F  AD 60 04  LDA $0460
  $DD72  9D 60 04  STA $0460,X
  $DD75  AD 40 04  LDA $0440
  $DD78  9D 40 04  STA $0440,X
  $DD7B  A5 00     LDA $00
  $DD7D  4A        LSR
  $DD7E  A8        TAY
  $DD7F  B9 44 DE  LDA $DE44,Y
  $DD82  C5 9C     CMP $9C
  $DD84  90 0D     BCC $DD93
  $DD86  F0 0B     BEQ $DD93
  $DD88  A0 00     LDY #$00
  $DD8A  84 AC     STY $AC
  $DD8C  20 18 DE  JSR $DE18
  $DD8F  5E 20 04  LSR $0420,X
  $DD92  60        RTS

L_DD93:
  $DD93  A5 23     LDA $23
  $DD95  29 02     AND #$02
  $DD97  F0 01     BEQ $DD9A
  $DD99  60        RTS

L_DD9A:
  $DD9A  A0 00     LDY #$00
  $DD9C  84 AC     STY $AC
  $DD9E  20 18 DE  JSR $DE18
  $DDA1  4E 22 04  LSR $0422
  $DDA4  A2 04     LDX #$04

L_DDA6:
  $DDA6  BD 20 04  LDA $0420,X
  $DDA9  10 06     BPL $DDB1
  $DDAB  CA        DEX
  $DDAC  E0 02     CPX #$02
  $DDAE  D0 F6     BNE $DDA6

L_DDB0:
  $DDB0  60        RTS

L_DDB1:
  $DDB1  A5 F9     LDA $F9
  $DDB3  D0 1E     BNE $DDD3
  $DDB5  A0 01     LDY #$01
  $DDB7  20 E0 D3  JSR $D3E0
  $DDBA  A5 00     LDA $00
  $DDBC  4A        LSR
  $DDBD  9D E0 04  STA $04E0,X
  $DDC0  9D 90 05  STA $0590,X
  $DDC3  A8        TAY
  $DDC4  B9 41 DE  LDA $DE41,Y
  $DDC7  9D A0 06  STA $06A0,X
  $DDCA  38        SEC
  $DDCB  BD 60 04  LDA $0460,X
  $DDCE  E5 1F     SBC $1F
  $DDD0  9D E0 06  STA $06E0,X

L_DDD3:
  $DDD3  38        SEC
  $DDD4  A5 9C     LDA $9C
  $DDD6  F9 44 DE  SBC $DE44,Y
  $DDD9  85 9C     STA $9C
  $DDDB  A9 38     LDA #$38
  $DDDD  20 51 C0  JSR $C051
  $DDE0  A9 04     LDA #$04
  $DDE2  9D 00 06  STA $0600,X
  $DDE5  A5 2C     LDA $2C
  $DDE7  F0 C7     BEQ $DDB0
  $DDE9  4C 8A DA  JMP $DA8A

L_DDEC:
  $DDEC  C9 02     CMP #$02
  $DDEE  B0 0B     BCS $DDFB
  $DDF0  BD A0 06  LDA $06A0,X
  $DDF3  C9 03     CMP #$03
  $DDF5  D0 1D     BNE $DE14
  $DDF7  A9 01     LDA #$01
  $DDF9  D0 16     BNE $DE11

L_DDFB:
  $DDFB  D0 0B     BNE $DE08
  $DDFD  BD A0 06  LDA $06A0,X
  $DE00  C9 06     CMP #$06
  $DE02  D0 10     BNE $DE14
  $DE04  A9 04     LDA #$04
  $DE06  D0 09     BNE $DE11

L_DE08:
  $DE08  BD A0 06  LDA $06A0,X
  $DE0B  C9 09     CMP #$09
  $DE0D  D0 05     BNE $DE14
  $DE0F  A9 07     LDA #$07

L_DE11:
  $DE11  9D A0 06  STA $06A0,X

L_DE14:
  $DE14  20 EF EE  JSR $EEEF
  $DE17  60        RTS

L_DE18:
  $DE18  B9 39 DE  LDA $DE39,Y
  $DE1B  8D 67 03  STA $0367
  $DE1E  B9 3A DE  LDA $DE3A,Y
  $DE21  8D 69 03  STA $0369
  $DE24  A5 1C     LDA $1C
  $DE26  29 07     AND #$07
  $DE28  D0 0A     BNE $DE34
  $DE2A  A5 00     LDA $00
  $DE2C  4A        LSR
  $DE2D  A8        TAY
  $DE2E  B9 35 DE  LDA $DE35,Y
  $DE31  20 51 C0  JSR $C051

L_DE34:
  $DE34  60        RTS
  $DE35  35 35     AND $35,X
  $DE37  36 37     ROL $37,X
  $DE39  0F        .db $0F
  $DE3A  15 31     ORA $31,X
  $DE3C  15 35     ORA $35,X
  $DE3E  2C 30 30  BIT $3030
  $DE41  00        BRK
  $DE42  01 04     ORA ($04,X)
  $DE44  07        .db $07
  $DE45  01 06     ORA ($06,X)
  $DE47  0A        ASL
  $DE48  8A        TXA
  $DE49  38        SEC
  $DE4A  E9 02     SBC #$02
  $DE4C  A8        TAY
  $DE4D  B9 6E DE  LDA $DE6E,Y
  $DE50  9D 20 06  STA $0620,X
  $DE53  B9 71 DE  LDA $DE71,Y
  $DE56  9D 00 06  STA $0600,X
  $DE59  18        CLC
  $DE5A  BD 60 06  LDA $0660,X
  $DE5D  69 10     ADC #$10
  $DE5F  9D 60 06  STA $0660,X
  $DE62  BD 40 06  LDA $0640,X
  $DE65  69 00     ADC #$00
  $DE67  9D 40 06  STA $0640,X
  $DE6A  20 EF EE  JSR $EEEF
  $DE6D  60        RTS
  $DE6E  19 99 33  ORA $3399,Y
  $DE71  01 01     ORA ($01,X)
  $DE73  02        .db $02
  $DE74  BD E0 04  LDA $04E0,X
  $DE77  D0 74     BNE $DEED
  $DE79  A9 00     LDA #$00
  $DE7B  9D 80 06  STA $0680,X
  $DE7E  BD C0 06  LDA $06C0,X
  $DE81  85 01     STA $01
  $DE83  8A        TXA
  $DE84  38        SEC
  $DE85  E9 02     SBC #$02
  $DE87  85 00     STA $00
  $DE89  29 01     AND #$01
  $DE8B  D0 11     BNE $DE9E
  $DE8D  38        SEC
  $DE8E  AD 60 04  LDA $0460
  $DE91  E5 01     SBC $01
  $DE93  9D 60 04  STA $0460,X
  $DE96  AD 40 04  LDA $0440
  $DE99  E9 00     SBC #$00
  $DE9B  4C AC DE  JMP $DEAC

L_DE9E:
  $DE9E  18        CLC
  $DE9F  AD 60 04  LDA $0460
  $DEA2  65 01     ADC $01
  $DEA4  9D 60 04  STA $0460,X
  $DEA7  AD 40 04  LDA $0440
  $DEAA  69 00     ADC #$00

L_DEAC:
  $DEAC  9D 40 04  STA $0440,X
  $DEAF  A5 00     LDA $00
  $DEB1  29 02     AND #$02
  $DEB3  D0 09     BNE $DEBE
  $DEB5  38        SEC
  $DEB6  AD A0 04  LDA $04A0
  $DEB9  E5 01     SBC $01
  $DEBB  4C C4 DE  JMP $DEC4

L_DEBE:
  $DEBE  18        CLC
  $DEBF  AD A0 04  LDA $04A0
  $DEC2  65 01     ADC $01

L_DEC4:
  $DEC4  9D A0 04  STA $04A0,X
  $DEC7  A5 01     LDA $01
  $DEC9  C9 0C     CMP #$0C
  $DECB  F0 07     BEQ $DED4
  $DECD  18        CLC
  $DECE  69 02     ADC #$02
  $DED0  9D C0 06  STA $06C0,X
  $DED3  60        RTS

L_DED4:
  $DED4  4E 23 04  LSR $0423
  $DED7  4E 24 04  LSR $0424
  $DEDA  4E 25 04  LSR $0425
  $DEDD  A9 83     LDA #$83
  $DEDF  8D 22 04  STA $0422
  $DEE2  A9 01     LDA #$01
  $DEE4  8D E2 04  STA $04E2
  $DEE7  A9 01     LDA #$01
  $DEE9  8D A2 06  STA $06A2
  $DEEC  60        RTS

L_DEED:
  $DEED  A5 F9     LDA $F9
  $DEEF  F0 04     BEQ $DEF5
  $DEF1  A9 06     LDA #$06
  $DEF3  D0 09     BNE $DEFE

L_DEF5:
  $DEF5  BD A0 06  LDA $06A0,X
  $DEF8  C9 05     CMP #$05
  $DEFA  90 05     BCC $DF01
  $DEFC  A9 01     LDA #$01

L_DEFE:
  $DEFE  9D A0 06  STA $06A0,X

L_DF01:
  $DF01  BD E0 04  LDA $04E0,X
  $DF04  C9 01     CMP #$01
  $DF06  D0 61     BNE $DF69
  $DF08  A5 1C     LDA $1C
  $DF0A  29 07     AND #$07
  $DF0C  D0 05     BNE $DF13
  $DF0E  A9 31     LDA #$31
  $DF10  20 51 C0  JSR $C051

L_DF13:
  $DF13  AD 60 04  LDA $0460
  $DF16  9D 60 04  STA $0460,X
  $DF19  AD 40 04  LDA $0440
  $DF1C  9D 40 04  STA $0440,X
  $DF1F  AD A0 04  LDA $04A0
  $DF22  9D A0 04  STA $04A0,X
  $DF25  A5 F9     LDA $F9
  $DF27  F0 05     BEQ $DF2E
  $DF29  A9 00     LDA #$00
  $DF2B  9D A0 04  STA $04A0,X

L_DF2E:
  $DF2E  A5 23     LDA $23
  $DF30  29 F0     AND #$F0
  $DF32  F0 34     BEQ $DF68
  $DF34  A4 F9     LDY $F9
  $DF36  F0 04     BEQ $DF3C
  $DF38  5E 20 04  LSR $0420,X
  $DF3B  60        RTS

L_DF3C:
  $DF3C  29 C0     AND #$C0
  $DF3E  F0 0F     BEQ $DF4F
  $DF40  4A        LSR
  $DF41  29 40     AND #$40
  $DF43  09 83     ORA #$83
  $DF45  9D 20 04  STA $0420,X
  $DF48  A9 04     LDA #$04
  $DF4A  9D 00 06  STA $0600,X
  $DF4D  D0 0F     BNE $DF5E

L_DF4F:
  $DF4F  A0 00     LDY #$00
  $DF51  A5 23     LDA $23
  $DF53  29 10     AND #$10
  $DF55  D0 01     BNE $DF58
  $DF57  C8        INY

L_DF58:
  $DF58  B9 6D DF  LDA $DF6D,Y
  $DF5B  9D 40 06  STA $0640,X

L_DF5E:
  $DF5E  38        SEC
  $DF5F  A5 9E     LDA $9E
  $DF61  E9 03     SBC #$03
  $DF63  85 9E     STA $9E
  $DF65  FE E0 04  INC $04E0,X

L_DF68:
  $DF68  60        RTS

L_DF69:
  $DF69  20 EF EE  JSR $EEEF
  $DF6C  60        RTS
  $DF6D  04        .db $04
  $DF6E  FC        .db $FC
  $DF6F  A9 07     LDA #$07
  $DF71  85 01     STA $01
  $DF73  A9 07     LDA #$07
  $DF75  85 02     STA $02
  $DF77  20 CF F0  JSR $F0CF
  $DF7A  BD E0 04  LDA $04E0,X
  $DF7D  D0 20     BNE $DF9F
  $DF7F  A5 00     LDA $00
  $DF81  F0 47     BEQ $DFCA
  $DF83  FE E0 04  INC $04E0,X
  $DF86  BD 20 04  LDA $0420,X
  $DF89  29 FB     AND #$FB
  $DF8B  9D 20 04  STA $0420,X

L_DF8E:
  $DF8E  A9 C0     LDA #$C0
  $DF90  9D 60 06  STA $0660,X
  $DF93  A9 FF     LDA #$FF
  $DF95  9D 40 06  STA $0640,X
  $DF98  A9 02     LDA #$02
  $DF9A  9D 00 06  STA $0600,X
  $DF9D  D0 2B     BNE $DFCA

L_DF9F:
  $DF9F  C9 01     CMP #$01
  $DFA1  D0 1E     BNE $DFC1
  $DFA3  A5 03     LDA $03
  $DFA5  F0 04     BEQ $DFAB
  $DFA7  5E 20 04  LSR $0420,X
  $DFAA  60        RTS

L_DFAB:
  $DFAB  A5 00     LDA $00
  $DFAD  D0 1B     BNE $DFCA
  $DFAF  A9 00     LDA #$00
  $DFB1  9D 00 06  STA $0600,X
  $DFB4  9D 60 06  STA $0660,X
  $DFB7  A9 FE     LDA #$FE
  $DFB9  9D 40 06  STA $0640,X
  $DFBC  FE E0 04  INC $04E0,X
  $DFBF  D0 09     BNE $DFCA

L_DFC1:
  $DFC1  A5 00     LDA $00
  $DFC3  F0 05     BEQ $DFCA
  $DFC5  DE E0 04  DEC $04E0,X
  $DFC8  D0 C4     BNE $DF8E

L_DFCA:
  $DFCA  20 EF EE  JSR $EEEF
  $DFCD  60        RTS
  $DFCE  BD E0 04  LDA $04E0,X
  $DFD1  C9 12     CMP #$12
  $DFD3  B0 14     BCS $DFE9
  $DFD5  38        SEC
  $DFD6  BD 60 06  LDA $0660,X
  $DFD9  E9 4B     SBC #$4B
  $DFDB  9D 60 06  STA $0660,X
  $DFDE  BD 40 06  LDA $0640,X
  $DFE1  E9 00     SBC #$00
  $DFE3  9D 40 06  STA $0640,X
  $DFE6  4C 0F E0  JMP $E00F

L_DFE9:
  $DFE9  D0 08     BNE $DFF3
  $DFEB  BD 20 04  LDA $0420,X
  $DFEE  49 40     EOR #$40
  $DFF0  9D 20 04  STA $0420,X

L_DFF3:
  $DFF3  BD E0 04  LDA $04E0,X
  $DFF6  C9 23     CMP #$23
  $DFF8  D0 04     BNE $DFFE
  $DFFA  5E 20 04  LSR $0420,X
  $DFFD  60        RTS

L_DFFE:
  $DFFE  18        CLC
  $DFFF  BD 60 06  LDA $0660,X
  $E002  69 4B     ADC #$4B
  $E004  9D 60 06  STA $0660,X
  $E007  BD 40 06  LDA $0640,X
  $E00A  69 00     ADC #$00
  $E00C  9D 40 06  STA $0640,X

L_E00F:
  $E00F  FE E0 04  INC $04E0,X
  $E012  20 EF EE  JSR $EEEF
  $E015  60        RTS
  $E016  BD E0 04  LDA $04E0,X
  $E019  D0 77     BNE $E092
  $E01B  A9 00     LDA #$00
  $E01D  9D A0 06  STA $06A0,X
  $E020  9D 80 06  STA $0680,X
  $E023  38        SEC
  $E024  BD A0 04  LDA $04A0,X
  $E027  E9 08     SBC #$08
  $E029  85 0A     STA $0A
  $E02B  A9 00     LDA #$00
  $E02D  85 0B     STA $0B
  $E02F  BD 20 04  LDA $0420,X
  $E032  29 40     AND #$40
  $E034  D0 10     BNE $E046
  $E036  38        SEC
  $E037  BD 60 04  LDA $0460,X
  $E03A  E9 06     SBC #$06
  $E03C  85 08     STA $08
  $E03E  BD 40 04  LDA $0440,X
  $E041  E9 00     SBC #$00
  $E043  4C 53 E0  JMP $E053

L_E046:
  $E046  18        CLC
  $E047  BD 60 04  LDA $0460,X
  $E04A  69 06     ADC #$06
  $E04C  85 08     STA $08
  $E04E  BD 40 04  LDA $0440,X
  $E051  69 00     ADC #$00

L_E053:
  $E053  85 09     STA $09
  $E055  20 A2 CB  JSR $CBA2
  $E058  A4 00     LDY $00
  $E05A  A6 2B     LDX $2B
  $E05C  B9 4F E1  LDA $E14F,Y
  $E05F  D0 17     BNE $E078
  $E061  18        CLC
  $E062  A5 0A     LDA $0A
  $E064  69 10     ADC #$10
  $E066  85 0A     STA $0A
  $E068  20 A2 CB  JSR $CBA2
  $E06B  A4 00     LDY $00
  $E06D  A6 2B     LDX $2B
  $E06F  B9 4F E1  LDA $E14F,Y
  $E072  D0 04     BNE $E078
  $E074  20 EF EE  JSR $EEEF
  $E077  60        RTS

L_E078:
  $E078  A9 2E     LDA #$2E
  $E07A  20 51 C0  JSR $C051
  $E07D  BD 20 04  LDA $0420,X
  $E080  29 FE     AND #$FE
  $E082  9D 20 04  STA $0420,X
  $E085  FE A0 06  INC $06A0,X
  $E088  FE E0 04  INC $04E0,X
  $E08B  A9 7E     LDA #$7E
  $E08D  9D C0 06  STA $06C0,X
  $E090  D0 27     BNE $E0B9

L_E092:
  $E092  C9 01     CMP #$01
  $E094  D0 27     BNE $E0BD
  $E096  BD A0 06  LDA $06A0,X
  $E099  C9 04     CMP #$04
  $E09B  D0 05     BNE $E0A2
  $E09D  A9 02     LDA #$02
  $E09F  9D A0 06  STA $06A0,X

L_E0A2:
  $E0A2  DE C0 06  DEC $06C0,X
  $E0A5  D0 12     BNE $E0B9
  $E0A7  A9 05     LDA #$05
  $E0A9  9D A0 06  STA $06A0,X
  $E0AC  A9 00     LDA #$00
  $E0AE  9D 80 06  STA $0680,X
  $E0B1  A9 38     LDA #$38
  $E0B3  9D C0 06  STA $06C0,X
  $E0B6  FE E0 04  INC $04E0,X

L_E0B9:
  $E0B9  20 E9 E4  JSR $E4E9
  $E0BC  60        RTS

L_E0BD:
  $E0BD  A9 00     LDA #$00
  $E0BF  9D 80 06  STA $0680,X
  $E0C2  BD C0 06  LDA $06C0,X
  $E0C5  29 07     AND #$07
  $E0C7  D0 47     BNE $E110
  $E0C9  A9 2B     LDA #$2B
  $E0CB  20 51 C0  JSR $C051
  $E0CE  BD C0 06  LDA $06C0,X
  $E0D1  4A        LSR
  $E0D2  29 0C     AND #$0C
  $E0D4  85 02     STA $02
  $E0D6  A9 06     LDA #$06
  $E0D8  85 01     STA $01

L_E0DA:
  $E0DA  A5 01     LDA $01
  $E0DC  C9 02     CMP #$02
  $E0DE  F0 30     BEQ $E110
  $E0E0  85 00     STA $00
  $E0E2  A0 0C     LDY #$0C
  $E0E4  20 FF E4  JSR $E4FF
  $E0E7  A4 00     LDY $00
  $E0E9  A6 02     LDX $02
  $E0EB  18        CLC
  $E0EC  B9 A0 04  LDA $04A0,Y
  $E0EF  7D 1F E1  ADC $E11F,X
  $E0F2  99 A0 04  STA $04A0,Y
  $E0F5  18        CLC
  $E0F6  B9 60 04  LDA $0460,Y
  $E0F9  7D 2F E1  ADC $E12F,X
  $E0FC  99 60 04  STA $0460,Y
  $E0FF  B9 40 04  LDA $0440,Y
  $E102  7D 3F E1  ADC $E13F,X
  $E105  99 40 04  STA $0440,Y
  $E108  A6 2B     LDX $2B
  $E10A  E6 02     INC $02
  $E10C  C6 01     DEC $01
  $E10E  D0 CA     BNE $E0DA

L_E110:
  $E110  A6 2B     LDX $2B
  $E112  DE C0 06  DEC $06C0,X
  $E115  10 04     BPL $E11B
  $E117  5E 20 04  LSR $0420,X
  $E11A  60        RTS

L_E11B:
  $E11B  20 E9 E4  JSR $E4E9
  $E11E  60        RTS
  $E11F  F8        SED
  $E120  F0 08     BEQ $E12A
  $E122  00        BRK
  $E123  F8        SED
  $E124  F8        SED

L_E125:
  $E125  08        PHP

L_E126:
  $E126  00        BRK
  $E127  F0 00     BEQ $E129

L_E129:
  $E129  10 10     BPL $E13B
  $E12B  F0 F8     BEQ $E125
  $E12D  08        PHP

L_E12E:
  $E12E  08        PHP
  $E12F  F8        SED
  $E130  08        PHP
  $E131  00        BRK
  $E132  10 F8     BPL $E12C
  $E134  10 F0     BPL $E126
  $E136  08        PHP
  $E137  00        BRK
  $E138  00        BRK
  $E139  F8        SED
  $E13A  10 F0     BPL $E12C
  $E13C  10 F0     BPL $E12E
  $E13E  08        PHP
  $E13F  FF        .db $FF
  $E140  00        BRK
  $E141  00        BRK
  $E142  00        BRK
  $E143  FF        .db $FF
  $E144  00        BRK
  $E145  FF        .db $FF
  $E146  00        BRK
  $E147  00        BRK
  $E148  00        BRK
  $E149  FF        .db $FF
  $E14A  00        BRK
  $E14B  FF        .db $FF
  $E14C  00        BRK
  $E14D  FF        .db $FF
  $E14E  00        BRK
  $E14F  00        BRK
  $E150  01 00     ORA ($00,X)
  $E152  00        BRK
  $E153  00        BRK
  $E154  01 01     ORA ($01,X)
  $E156  01 01     ORA ($01,X)
  $E158  DE 20 06  DEC $0620,X
  $E15B  D0 15     BNE $E172
  $E15D  A9 0F     LDA #$0F
  $E15F  9D 20 06  STA $0620,X
  $E162  C6 A1     DEC $A1
  $E164  D0 0C     BNE $E172
  $E166  5E 20 04  LSR $0420,X
  $E169  A9 00     LDA #$00
  $E16B  85 AA     STA $AA
  $E16D  A9 01     LDA #$01
  $E16F  85 50     STA $50
  $E171  60        RTS

L_E172:
  $E172  A9 01     LDA #$01
  $E174  85 AA     STA $AA
  $E176  A9 00     LDA #$00
  $E178  85 50     STA $50
  $E17A  85 4F     STA $4F
  $E17C  A9 80     LDA #$80
  $E17E  9D A0 04  STA $04A0,X
  $E181  18        CLC
  $E182  65 1F     ADC $1F
  $E184  9D 60 04  STA $0460,X
  $E187  AD 40 04  LDA $0440
  $E18A  69 00     ADC #$00
  $E18C  9D 40 04  STA $0440,X
  $E18F  60        RTS
  $E190  BD E0 04  LDA $04E0,X
  $E193  D0 23     BNE $E1B8
  $E195  FE C0 06  INC $06C0,X
  $E198  BD C0 06  LDA $06C0,X
  $E19B  C9 BB     CMP #$BB
  $E19D  F0 0F     BEQ $E1AE
  $E19F  BD A0 06  LDA $06A0,X
  $E1A2  C9 02     CMP #$02
  $E1A4  D0 05     BNE $E1AB
  $E1A6  A9 00     LDA #$00
  $E1A8  9D A0 06  STA $06A0,X

L_E1AB:
  $E1AB  4C CD E1  JMP $E1CD

L_E1AE:
  $E1AE  A9 3E     LDA #$3E
  $E1B0  9D C0 06  STA $06C0,X
  $E1B3  FE E0 04  INC $04E0,X
  $E1B6  D0 15     BNE $E1CD

L_E1B8:
  $E1B8  C9 01     CMP #$01
  $E1BA  D0 49     BNE $E205
  $E1BC  BD A0 06  LDA $06A0,X
  $E1BF  C9 07     CMP #$07
  $E1C1  D0 05     BNE $E1C8
  $E1C3  A9 03     LDA #$03
  $E1C5  9D A0 06  STA $06A0,X

L_E1C8:
  $E1C8  DE C0 06  DEC $06C0,X
  $E1CB  F0 26     BEQ $E1F3

L_E1CD:
  $E1CD  38        SEC
  $E1CE  BD A0 04  LDA $04A0,X
  $E1D1  E9 04     SBC #$04
  $E1D3  9D A1 05  STA $05A1,X
  $E1D6  A9 14     LDA #$14
  $E1D8  9D 9E 05  STA $059E,X
  $E1DB  A9 0B     LDA #$0B
  $E1DD  85 01     STA $01
  $E1DF  A9 1D     LDA #$1D
  $E1E1  85 02     STA $02
  $E1E3  A9 04     LDA #$04
  $E1E5  85 03     STA $03
  $E1E7  20 ED E3  JSR $E3ED
  $E1EA  A5 00     LDA $00
  $E1EC  F0 17     BEQ $E205
  $E1EE  A9 00     LDA #$00
  $E1F0  9D 60 06  STA $0660,X

L_E1F3:
  $E1F3  A9 02     LDA #$02
  $E1F5  9D E0 04  STA $04E0,X
  $E1F8  A9 08     LDA #$08
  $E1FA  9D A0 06  STA $06A0,X
  $E1FD  A9 00     LDA #$00
  $E1FF  9D 80 06  STA $0680,X
  $E202  9D 9E 05  STA $059E,X

L_E205:
  $E205  20 EF EE  JSR $EEEF
  $E208  90 05     BCC $E20F
  $E20A  A9 00     LDA #$00
  $E20C  9D 9E 05  STA $059E,X

L_E20F:
  $E20F  60        RTS
  $E210  BD E0 04  LDA $04E0,X
  $E213  F0 05     BEQ $E21A
  $E215  DE E0 04  DEC $04E0,X
  $E218  D0 4C     BNE $E266

L_E21A:
  $E21A  DE C0 06  DEC $06C0,X
  $E21D  D0 26     BNE $E245
  $E21F  A9 13     LDA #$13
  $E221  9D C0 06  STA $06C0,X
  $E224  C6 A5     DEC $A5
  $E226  D0 1D     BNE $E245

L_E228:
  $E228  A9 05     LDA #$05
  $E22A  9D A0 06  STA $06A0,X
  $E22D  A9 00     LDA #$00
  $E22F  8D A0 05  STA $05A0
  $E232  9D 00 06  STA $0600,X
  $E235  9D 20 06  STA $0620,X
  $E238  9D 80 06  STA $0680,X
  $E23B  A9 80     LDA #$80
  $E23D  9D 20 04  STA $0420,X
  $E240  F0 03     BEQ $E245
  $E242  4C D2 E2  JMP $E2D2

L_E245:
  $E245  BD 00 06  LDA $0600,X
  $E248  C9 02     CMP #$02
  $E24A  F0 1A     BEQ $E266
  $E24C  18        CLC
  $E24D  BD 20 06  LDA $0620,X
  $E250  69 08     ADC #$08
  $E252  9D 20 06  STA $0620,X
  $E255  BD 00 06  LDA $0600,X
  $E258  69 00     ADC #$00
  $E25A  9D 00 06  STA $0600,X
  $E25D  C9 02     CMP #$02
  $E25F  D0 05     BNE $E266
  $E261  A9 00     LDA #$00
  $E263  9D 20 06  STA $0620,X

L_E266:
  $E266  A9 0F     LDA #$0F
  $E268  85 01     STA $01
  $E26A  A9 08     LDA #$08
  $E26C  85 02     STA $02
  $E26E  20 CF F0  JSR $F0CF
  $E271  A5 03     LDA $03
  $E273  D0 B3     BNE $E228
  $E275  38        SEC
  $E276  BD A0 04  LDA $04A0,X
  $E279  E9 20     SBC #$20
  $E27B  85 0A     STA $0A
  $E27D  A9 00     LDA #$00
  $E27F  85 0B     STA $0B
  $E281  38        SEC
  $E282  BD 60 04  LDA $0460,X
  $E285  E9 10     SBC #$10
  $E287  85 08     STA $08
  $E289  BD 40 04  LDA $0440,X
  $E28C  E9 00     SBC #$00
  $E28E  85 09     STA $09
  $E290  20 A2 CB  JSR $CBA2
  $E293  A6 2B     LDX $2B
  $E295  A4 00     LDY $00
  $E297  B9 4F E1  LDA $E14F,Y
  $E29A  D0 19     BNE $E2B5
  $E29C  18        CLC
  $E29D  A5 08     LDA $08
  $E29F  69 20     ADC #$20
  $E2A1  85 08     STA $08
  $E2A3  A5 09     LDA $09
  $E2A5  69 00     ADC #$00
  $E2A7  85 09     STA $09
  $E2A9  20 A2 CB  JSR $CBA2
  $E2AC  A6 2B     LDX $2B
  $E2AE  A4 00     LDY $00
  $E2B0  B9 4F E1  LDA $E14F,Y
  $E2B3  F0 03     BEQ $E2B8

L_E2B5:
  $E2B5  4C 28 E2  JMP $E228

L_E2B8:
  $E2B8  38        SEC
  $E2B9  BD A0 04  LDA $04A0,X
  $E2BC  E9 04     SBC #$04
  $E2BE  9D A1 05  STA $05A1,X
  $E2C1  A9 18     LDA #$18
  $E2C3  9D 9E 05  STA $059E,X
  $E2C6  BD A0 06  LDA $06A0,X
  $E2C9  C9 04     CMP #$04
  $E2CB  D0 05     BNE $E2D2
  $E2CD  A9 00     LDA #$00
  $E2CF  9D A0 06  STA $06A0,X

L_E2D2:
  $E2D2  20 EF EE  JSR $EEEF
  $E2D5  90 05     BCC $E2DC
  $E2D7  A9 00     LDA #$00
  $E2D9  9D 9E 05  STA $059E,X

L_E2DC:
  $E2DC  60        RTS
  $E2DD  BD E0 04  LDA $04E0,X
  $E2E0  D0 65     BNE $E347
  $E2E2  BD 40 06  LDA $0640,X
  $E2E5  85 04     STA $04
  $E2E7  A9 0A     LDA #$0A
  $E2E9  85 01     STA $01
  $E2EB  A9 08     LDA #$08
  $E2ED  85 02     STA $02
  $E2EF  20 CF F0  JSR $F0CF
  $E2F2  A5 03     LDA $03
  $E2F4  F0 1D     BEQ $E313
  $E2F6  A9 62     LDA #$62
  $E2F8  9D 60 06  STA $0660,X
  $E2FB  A9 00     LDA #$00
  $E2FD  9D 40 06  STA $0640,X
  $E300  9D 20 06  STA $0620,X
  $E303  9D 00 06  STA $0600,X
  $E306  BD 20 04  LDA $0420,X
  $E309  29 FB     AND #$FB
  $E30B  9D 20 04  STA $0420,X
  $E30E  FE E0 04  INC $04E0,X
  $E311  D0 12     BNE $E325

L_E313:
  $E313  A5 04     LDA $04
  $E315  10 0E     BPL $E325
  $E317  A5 00     LDA $00
  $E319  F0 0A     BEQ $E325
  $E31B  A9 03     LDA #$03
  $E31D  9D 40 06  STA $0640,X
  $E320  A9 76     LDA #$76
  $E322  9D 60 06  STA $0660,X

L_E325:
  $E325  A9 00     LDA #$00
  $E327  9D 90 05  STA $0590,X
  $E32A  BD A0 06  LDA $06A0,X
  $E32D  C9 04     CMP #$04
  $E32F  D0 05     BNE $E336
  $E331  A9 00     LDA #$00
  $E333  9D A0 06  STA $06A0,X

L_E336:
  $E336  DE C0 06  DEC $06C0,X
  $E339  D0 09     BNE $E344
  $E33B  A9 1F     LDA #$1F
  $E33D  9D C0 06  STA $06C0,X
  $E340  C6 A6     DEC $A6
  $E342  F0 59     BEQ $E39D

L_E344:
  $E344  4C E2 E3  JMP $E3E2

L_E347:
  $E347  38        SEC
  $E348  BD A0 04  LDA $04A0,X
  $E34B  E9 08     SBC #$08
  $E34D  9D A1 05  STA $05A1,X
  $E350  A9 14     LDA #$14
  $E352  9D 9E 05  STA $059E,X
  $E355  A9 0C     LDA #$0C
  $E357  85 01     STA $01
  $E359  A9 21     LDA #$21
  $E35B  85 02     STA $02
  $E35D  A9 08     LDA #$08
  $E35F  85 03     STA $03
  $E361  20 ED E3  JSR $E3ED
  $E364  BD E0 04  LDA $04E0,X
  $E367  29 0F     AND #$0F
  $E369  C9 02     CMP #$02
  $E36B  B0 49     BCS $E3B6
  $E36D  BD E0 04  LDA $04E0,X
  $E370  10 05     BPL $E377
  $E372  FE E0 04  INC $04E0,X
  $E375  D0 00     BNE $E377

L_E377:
  $E377  A5 00     LDA $00
  $E379  D0 22     BNE $E39D
  $E37B  A5 03     LDA $03
  $E37D  D0 A6     BNE $E325
  $E37F  A9 00     LDA #$00
  $E381  9D 40 06  STA $0640,X
  $E384  9D 60 06  STA $0660,X
  $E387  BD A0 06  LDA $06A0,X
  $E38A  C9 09     CMP #$09
  $E38C  D0 05     BNE $E393
  $E38E  A9 05     LDA #$05
  $E390  9D A0 06  STA $06A0,X

L_E393:
  $E393  FE 90 05  INC $0590,X
  $E396  BD 90 05  LDA $0590,X
  $E399  C9 3E     CMP #$3E
  $E39B  90 99     BCC $E336

L_E39D:
  $E39D  A9 0A     LDA #$0A
  $E39F  9D A0 06  STA $06A0,X
  $E3A2  A9 00     LDA #$00
  $E3A4  9D 40 06  STA $0640,X
  $E3A7  9D 60 06  STA $0660,X
  $E3AA  9D 80 06  STA $0680,X
  $E3AD  9D 9E 05  STA $059E,X
  $E3B0  A9 80     LDA #$80
  $E3B2  9D 20 04  STA $0420,X
  $E3B5  60        RTS

L_E3B6:
  $E3B6  BD E0 04  LDA $04E0,X
  $E3B9  10 11     BPL $E3CC
  $E3BB  29 0F     AND #$0F
  $E3BD  9D E0 04  STA $04E0,X
  $E3C0  A9 62     LDA #$62
  $E3C2  9D 60 06  STA $0660,X
  $E3C5  A9 00     LDA #$00
  $E3C7  9D 40 06  STA $0640,X
  $E3CA  F0 AB     BEQ $E377

L_E3CC:
  $E3CC  BD 40 06  LDA $0640,X
  $E3CF  10 04     BPL $E3D5
  $E3D1  A5 00     LDA $00
  $E3D3  D0 C8     BNE $E39D

L_E3D5:
  $E3D5  A9 9E     LDA #$9E
  $E3D7  9D 60 06  STA $0660,X
  $E3DA  A9 FF     LDA #$FF
  $E3DC  9D 40 06  STA $0640,X
  $E3DF  4C 77 E3  JMP $E377

L_E3E2:
  $E3E2  20 EF EE  JSR $EEEF
  $E3E5  90 05     BCC $E3EC
  $E3E7  A9 00     LDA #$00
  $E3E9  9D 9E 05  STA $059E,X

L_E3EC:
  $E3EC  60        RTS

L_E3ED:
  $E3ED  BD 20 04  LDA $0420,X
  $E3F0  29 40     AND #$40
  $E3F2  D0 10     BNE $E404
  $E3F4  38        SEC
  $E3F5  BD 60 04  LDA $0460,X
  $E3F8  E5 01     SBC $01
  $E3FA  85 08     STA $08
  $E3FC  BD 40 04  LDA $0440,X
  $E3FF  E9 00     SBC #$00
  $E401  4C 11 E4  JMP $E411

L_E404:
  $E404  18        CLC
  $E405  BD 60 04  LDA $0460,X
  $E408  65 01     ADC $01
  $E40A  85 08     STA $08
  $E40C  BD 40 04  LDA $0440,X
  $E40F  69 00     ADC #$00

L_E411:
  $E411  85 09     STA $09
  $E413  38        SEC
  $E414  BD A0 04  LDA $04A0,X
  $E417  E9 08     SBC #$08
  $E419  85 0A     STA $0A
  $E41B  A9 00     LDA #$00
  $E41D  E9 00     SBC #$00
  $E41F  85 0B     STA $0B
  $E421  20 A2 CB  JSR $CBA2
  $E424  A6 2B     LDX $2B
  $E426  A4 00     LDY $00
  $E428  B9 68 E4  LDA $E468,Y
  $E42B  48        PHA
  $E42C  BD 40 06  LDA $0640,X
  $E42F  10 0F     BPL $E440
  $E431  18        CLC
  $E432  BD A0 04  LDA $04A0,X
  $E435  65 03     ADC $03
  $E437  85 0A     STA $0A
  $E439  A9 00     LDA #$00
  $E43B  69 00     ADC #$00
  $E43D  4C 4C E4  JMP $E44C

L_E440:
  $E440  38        SEC
  $E441  BD A0 04  LDA $04A0,X
  $E444  E5 02     SBC $02
  $E446  85 0A     STA $0A
  $E448  A9 00     LDA #$00
  $E44A  E9 00     SBC #$00

L_E44C:
  $E44C  85 0B     STA $0B
  $E44E  BD 60 04  LDA $0460,X
  $E451  85 08     STA $08
  $E453  BD 40 04  LDA $0440,X
  $E456  85 09     STA $09
  $E458  20 A2 CB  JSR $CBA2
  $E45B  A6 2B     LDX $2B
  $E45D  A4 00     LDY $00
  $E45F  B9 68 E4  LDA $E468,Y
  $E462  85 00     STA $00
  $E464  68        PLA
  $E465  85 03     STA $03
  $E467  60        RTS
  $E468  00        BRK
  $E469  01 00     ORA ($00,X)
  $E46B  01 00     ORA ($00,X)
  $E46D  01 01     ORA ($01,X)
  $E46F  01 01     ORA ($01,X)
  $E471  A9 00     LDA #$00
  $E473  9D 80 06  STA $0680,X
  $E476  BD E0 04  LDA $04E0,X
  $E479  D0 33     BNE $E4AE
  $E47B  BD C0 06  LDA $06C0,X
  $E47E  D0 5D     BNE $E4DD
  $E480  BD 20 04  LDA $0420,X
  $E483  49 40     EOR #$40
  $E485  9D 20 04  STA $0420,X
  $E488  FE A0 06  INC $06A0,X
  $E48B  29 40     AND #$40
  $E48D  F0 03     BEQ $E492
  $E48F  FE A0 06  INC $06A0,X

L_E492:
  $E492  A9 00     LDA #$00
  $E494  9D 20 06  STA $0620,X
  $E497  9D 60 06  STA $0660,X
  $E49A  A9 FE     LDA #$FE
  $E49C  9D 40 06  STA $0640,X
  $E49F  A9 01     LDA #$01
  $E4A1  9D 00 06  STA $0600,X
  $E4A4  A9 10     LDA #$10
  $E4A6  9D C0 06  STA $06C0,X
  $E4A9  FE E0 04  INC $04E0,X
  $E4AC  D0 2F     BNE $E4DD

L_E4AE:
  $E4AE  18        CLC
  $E4AF  BD 20 06  LDA $0620,X
  $E4B2  69 40     ADC #$40
  $E4B4  9D 20 06  STA $0620,X
  $E4B7  BD 00 06  LDA $0600,X
  $E4BA  69 00     ADC #$00
  $E4BC  9D 00 06  STA $0600,X
  $E4BF  BD C0 06  LDA $06C0,X
  $E4C2  D0 19     BNE $E4DD
  $E4C4  A9 00     LDA #$00
  $E4C6  9D A0 06  STA $06A0,X
  $E4C9  9D 20 06  STA $0620,X
  $E4CC  9D 00 06  STA $0600,X
  $E4CF  9D 60 06  STA $0660,X
  $E4D2  9D 40 06  STA $0640,X
  $E4D5  A9 02     LDA #$02
  $E4D7  9D C0 06  STA $06C0,X
  $E4DA  DE E0 04  DEC $04E0,X

L_E4DD:
  $E4DD  DE C0 06  DEC $06C0,X
  $E4E0  20 EF EE  JSR $EEEF
  $E4E3  60        RTS
  $E4E4  20 E9 E4  JSR $E4E9
  $E4E7  60        RTS
  $E4E8  60        RTS

L_E4E9:
  $E4E9  38        SEC
  $E4EA  BD 60 04  LDA $0460,X
  $E4ED  E5 1F     SBC $1F
  $E4EF  BD 40 04  LDA $0440,X
  $E4F2  E5 20     SBC $20
  $E4F4  90 04     BCC $E4FA
  $E4F6  D0 02     BNE $E4FA
  $E4F8  18        CLC
  $E4F9  60        RTS

L_E4FA:
  $E4FA  5E 20 04  LSR $0420,X
  $E4FD  38        SEC
  $E4FE  60        RTS

L_E4FF:
  $E4FF  BD 60 04  LDA $0460,X
  $E502  85 08     STA $08
  $E504  BD 40 04  LDA $0440,X
  $E507  85 09     STA $09
  $E509  BD A0 04  LDA $04A0,X
  $E50C  85 0A     STA $0A
  $E50E  A6 00     LDX $00
  $E510  B9 4F D4  LDA $D44F,Y
  $E513  9D 00 04  STA $0400,X
  $E516  B9 61 D4  LDA $D461,Y
  $E519  9D 20 04  STA $0420,X
  $E51C  A5 08     LDA $08
  $E51E  9D 60 04  STA $0460,X
  $E521  A5 09     LDA $09
  $E523  9D 40 04  STA $0440,X
  $E526  A5 0A     LDA $0A
  $E528  9D A0 04  STA $04A0,X
  $E52B  B9 85 D4  LDA $D485,Y
  $E52E  9D 20 06  STA $0620,X
  $E531  B9 97 D4  LDA $D497,Y
  $E534  9D 00 06  STA $0600,X
  $E537  B9 A9 D4  LDA $D4A9,Y
  $E53A  9D 60 06  STA $0660,X
  $E53D  B9 BB D4  LDA $D4BB,Y
  $E540  9D 40 06  STA $0640,X
  $E543  A9 00     LDA #$00
  $E545  9D A0 06  STA $06A0,X
  $E548  9D 80 06  STA $0680,X
  $E54B  9D E0 04  STA $04E0,X
  $E54E  38        SEC
  $E54F  BD 60 04  LDA $0460,X
  $E552  E5 1F     SBC $1F
  $E554  9D E0 06  STA $06E0,X
  $E557  A6 2B     LDX $2B
  $E559  60        RTS

L_E55A:
  $E55A  A9 00     LDA #$00
  $E55C  85 01     STA $01
  $E55E  A5 2C     LDA $2C
  $E560  F0 6A     BEQ $E5CC
  $E562  A5 BD     LDA $BD
  $E564  D0 66     BNE $E5CC
  $E566  A5 F9     LDA $F9
  $E568  D0 62     BNE $E5CC
  $E56A  38        SEC
  $E56B  A5 2D     LDA $2D
  $E56D  E5 2E     SBC $2E
  $E56F  B0 04     BCS $E575
  $E571  49 FF     EOR #$FF
  $E573  69 01     ADC #$01

L_E575:
  $E575  BC E0 06  LDY $06E0,X
  $E578  D9 E4 D4  CMP $D4E4,Y
  $E57B  B0 4F     BCS $E5CC
  $E57D  38        SEC
  $E57E  AD A0 04  LDA $04A0
  $E581  FD A0 04  SBC $04A0,X
  $E584  B0 04     BCS $E58A
  $E586  49 FF     EOR #$FF
  $E588  69 01     ADC #$01

L_E58A:
  $E58A  D9 84 D5  CMP $D584,Y
  $E58D  B0 3D     BCS $E5CC
  $E58F  BC 00 04  LDY $0400,X
  $E592  C0 76     CPY #$76
  $E594  B0 37     BCS $E5CD
  $E596  A5 4B     LDA $4B
  $E598  D0 32     BNE $E5CC
  $E59A  38        SEC
  $E59B  AD C0 06  LDA $06C0
  $E59E  F9 5C ED  SBC $ED5C,Y
  $E5A1  8D C0 06  STA $06C0
  $E5A4  F0 02     BEQ $E5A8
  $E5A6  B0 0A     BCS $E5B2

L_E5A8:
  $E5A8  A9 00     LDA #$00
  $E5AA  85 2C     STA $2C
  $E5AC  8D C0 06  STA $06C0
  $E5AF  4C 0B C1  JMP $C10B

L_E5B2:
  $E5B2  AD 20 04  LDA $0420
  $E5B5  29 BF     AND #$BF
  $E5B7  8D 20 04  STA $0420
  $E5BA  BD 20 04  LDA $0420,X
  $E5BD  29 40     AND #$40
  $E5BF  49 40     EOR #$40
  $E5C1  0D 20 04  ORA $0420
  $E5C4  8D 20 04  STA $0420
  $E5C7  20 32 D3  JSR $D332
  $E5CA  E6 01     INC $01

L_E5CC:
  $E5CC  60        RTS

L_E5CD:
  $E5CD  A5 AD     LDA $AD
  $E5CF  D0 1A     BNE $E5EB
  $E5D1  5E 20 04  LSR $0420,X
  $E5D4  84 AD     STY $AD
  $E5D6  E6 01     INC $01
  $E5D8  BD E0 04  LDA $04E0,X
  $E5DB  D0 0E     BNE $E5EB
  $E5DD  A9 FF     LDA #$FF
  $E5DF  9D 20 01  STA $0120,X
  $E5E2  BD 10 01  LDA $0110,X
  $E5E5  A8        TAY
  $E5E6  A9 00     LDA #$00
  $E5E8  99 40 01  STA $0140,Y

L_E5EB:
  $E5EB  60        RTS

L_E5EC:
  $E5EC  BD A0 04  LDA $04A0,X
  $E5EF  85 00     STA $00
  $E5F1  BD E0 06  LDA $06E0,X
  $E5F4  85 08     STA $08
  $E5F6  A2 09     LDX #$09
  $E5F8  A5 1C     LDA $1C
  $E5FA  29 01     AND #$01
  $E5FC  D0 01     BNE $E5FF
  $E5FE  CA        DEX

L_E5FF:
  $E5FF  BD 20 04  LDA $0420,X
  $E602  10 30     BPL $E634
  $E604  29 01     AND #$01
  $E606  F0 2C     BEQ $E634
  $E608  18        CLC
  $E609  BC 90 05  LDY $0590,X
  $E60C  B9 DF D4  LDA $D4DF,Y
  $E60F  65 08     ADC $08
  $E611  A8        TAY
  $E612  38        SEC
  $E613  A5 2E     LDA $2E
  $E615  FD E0 06  SBC $06E0,X
  $E618  B0 04     BCS $E61E
  $E61A  49 FF     EOR #$FF
  $E61C  69 01     ADC #$01

L_E61E:
  $E61E  D9 E4 D4  CMP $D4E4,Y
  $E621  B0 11     BCS $E634
  $E623  38        SEC
  $E624  A5 00     LDA $00
  $E626  FD A0 04  SBC $04A0,X
  $E629  B0 04     BCS $E62F
  $E62B  49 FF     EOR #$FF
  $E62D  69 01     ADC #$01

L_E62F:
  $E62F  D9 84 D5  CMP $D584,Y
  $E632  90 0F     BCC $E643

L_E634:
  $E634  CA        DEX
  $E635  CA        DEX
  $E636  E0 02     CPX #$02
  $E638  B0 C5     BCS $E5FF
  $E63A  A6 2B     LDX $2B
  $E63C  A9 00     LDA #$00
  $E63E  9D 00 01  STA $0100,X
  $E641  18        CLC
  $E642  60        RTS

L_E643:
  $E643  A4 A9     LDY $A9
  $E645  B9 86 E9  LDA $E986,Y
  $E648  85 08     STA $08
  $E64A  B9 8F E9  LDA $E98F,Y
  $E64D  85 09     STA $09
  $E64F  6C 08 00  JMP ($0008)
  $E652  A4 2B     LDY $2B
  $E654  B9 20 04  LDA $0420,Y
  $E657  29 08     AND #$08
  $E659  D0 34     BNE $E68F
  $E65B  B9 00 04  LDA $0400,Y
  $E65E  A8        TAY
  $E65F  B9 98 E9  LDA $E998,Y
  $E662  85 00     STA $00
  $E664  F0 29     BEQ $E68F
  $E666  20 7F E9  JSR $E97F
  $E669  5E 20 04  LSR $0420,X
  $E66C  A9 2B     LDA #$2B
  $E66E  20 51 C0  JSR $C051
  $E671  A6 2B     LDX $2B
  $E673  BD 00 01  LDA $0100,X
  $E676  D0 30     BNE $E6A8
  $E678  FE 00 01  INC $0100,X
  $E67B  38        SEC
  $E67C  BD C0 06  LDA $06C0,X
  $E67F  E5 00     SBC $00
  $E681  9D C0 06  STA $06C0,X
  $E684  F0 02     BEQ $E688
  $E686  B0 20     BCS $E6A8

L_E688:
  $E688  A9 00     LDA #$00
  $E68A  9D C0 06  STA $06C0,X
  $E68D  38        SEC
  $E68E  60        RTS

L_E68F:
  $E68F  BD 20 04  LDA $0420,X
  $E692  49 40     EOR #$40
  $E694  29 FE     AND #$FE
  $E696  9D 20 04  STA $0420,X
  $E699  A9 05     LDA #$05
  $E69B  9D 40 06  STA $0640,X
  $E69E  9D 00 06  STA $0600,X
  $E6A1  A9 2D     LDA #$2D
  $E6A3  20 51 C0  JSR $C051
  $E6A6  A6 2B     LDX $2B

L_E6A8:
  $E6A8  18        CLC
  $E6A9  60        RTS
  $E6AA  A4 2B     LDY $2B
  $E6AC  B9 20 04  LDA $0420,Y
  $E6AF  29 08     AND #$08
  $E6B1  D0 4F     BNE $E702
  $E6B3  B9 00 04  LDA $0400,Y
  $E6B6  A8        TAY
  $E6B7  BD E0 04  LDA $04E0,X
  $E6BA  C9 02     CMP #$02
  $E6BC  90 13     BCC $E6D1
  $E6BE  F0 06     BEQ $E6C6
  $E6C0  B9 14 EA  LDA $EA14,Y
  $E6C3  4C D4 E6  JMP $E6D4

L_E6C6:
  $E6C6  18        CLC
  $E6C7  B9 98 E9  LDA $E998,Y
  $E6CA  0A        ASL
  $E6CB  79 98 E9  ADC $E998,Y
  $E6CE  4C D4 E6  JMP $E6D4

L_E6D1:
  $E6D1  B9 98 E9  LDA $E998,Y

L_E6D4:
  $E6D4  85 00     STA $00
  $E6D6  F0 2A     BEQ $E702
  $E6D8  20 7F E9  JSR $E97F
  $E6DB  8A        TXA
  $E6DC  48        PHA
  $E6DD  A9 2B     LDA #$2B
  $E6DF  20 51 C0  JSR $C051
  $E6E2  68        PLA
  $E6E3  A8        TAY
  $E6E4  A6 2B     LDX $2B
  $E6E6  BD 00 01  LDA $0100,X
  $E6E9  D0 27     BNE $E712
  $E6EB  FE 00 01  INC $0100,X
  $E6EE  38        SEC
  $E6EF  BD C0 06  LDA $06C0,X
  $E6F2  E5 00     SBC $00
  $E6F4  9D C0 06  STA $06C0,X
  $E6F7  F0 02     BEQ $E6FB
  $E6F9  B0 12     BCS $E70D

L_E6FB:
  $E6FB  A9 00     LDA #$00
  $E6FD  9D C0 06  STA $06C0,X
  $E700  38        SEC
  $E701  60        RTS

L_E702:
  $E702  A9 2D     LDA #$2D
  $E704  20 51 C0  JSR $C051
  $E707  5E 20 04  LSR $0420,X
  $E70A  4C 12 E7  JMP $E712

L_E70D:
  $E70D  A9 00     LDA #$00
  $E70F  99 20 04  STA $0420,Y

L_E712:
  $E712  A6 2B     LDX $2B
  $E714  18        CLC
  $E715  60        RTS
  $E716  A4 2B     LDY $2B
  $E718  B9 20 04  LDA $0420,Y
  $E71B  29 08     AND #$08
  $E71D  D0 35     BNE $E754
  $E71F  B9 00 04  LDA $0400,Y
  $E722  A8        TAY
  $E723  B9 8C EA  LDA $EA8C,Y
  $E726  85 00     STA $00
  $E728  F0 2A     BEQ $E754
  $E72A  20 7F E9  JSR $E97F
  $E72D  8A        TXA
  $E72E  48        PHA
  $E72F  A9 2B     LDA #$2B
  $E731  20 51 C0  JSR $C051
  $E734  68        PLA
  $E735  A8        TAY
  $E736  A6 2B     LDX $2B
  $E738  BD 00 01  LDA $0100,X
  $E73B  D0 33     BNE $E770
  $E73D  FE 00 01  INC $0100,X
  $E740  38        SEC
  $E741  BD C0 06  LDA $06C0,X
  $E744  E5 00     SBC $00
  $E746  9D C0 06  STA $06C0,X
  $E749  F0 02     BEQ $E74D
  $E74B  B0 C0     BCS $E70D

L_E74D:
  $E74D  A9 00     LDA #$00
  $E74F  9D C0 06  STA $06C0,X
  $E752  38        SEC
  $E753  60        RTS

L_E754:
  $E754  A9 2D     LDA #$2D
  $E756  20 51 C0  JSR $C051
  $E759  BD 20 04  LDA $0420,X
  $E75C  29 FE     AND #$FE
  $E75E  9D 20 04  STA $0420,X
  $E761  A9 3D     LDA #$3D
  $E763  9D 00 04  STA $0400,X
  $E766  A9 00     LDA #$00
  $E768  9D A0 06  STA $06A0,X
  $E76B  9D 80 06  STA $0680,X
  $E76E  A6 2B     LDX $2B

L_E770:
  $E770  18        CLC
  $E771  60        RTS
  $E772  A4 2B     LDY $2B
  $E774  B9 20 04  LDA $0420,Y
  $E777  29 08     AND #$08
  $E779  D0 35     BNE $E7B0
  $E77B  B9 00 04  LDA $0400,Y
  $E77E  A8        TAY
  $E77F  B9 04 EB  LDA $EB04,Y
  $E782  85 00     STA $00
  $E784  F0 2A     BEQ $E7B0
  $E786  20 7F E9  JSR $E97F
  $E789  8A        TXA
  $E78A  48        PHA
  $E78B  A9 2B     LDA #$2B
  $E78D  20 51 C0  JSR $C051
  $E790  68        PLA
  $E791  A8        TAY
  $E792  A6 2B     LDX $2B
  $E794  BD 00 01  LDA $0100,X
  $E797  D0 39     BNE $E7D2
  $E799  FE 00 01  INC $0100,X
  $E79C  38        SEC
  $E79D  BD C0 06  LDA $06C0,X
  $E7A0  E5 00     SBC $00
  $E7A2  9D C0 06  STA $06C0,X
  $E7A5  F0 02     BEQ $E7A9
  $E7A7  B0 2B     BCS $E7D4

L_E7A9:
  $E7A9  A9 00     LDA #$00
  $E7AB  9D C0 06  STA $06C0,X
  $E7AE  38        SEC
  $E7AF  60        RTS

L_E7B0:
  $E7B0  A9 2D     LDA #$2D
  $E7B2  20 51 C0  JSR $C051
  $E7B5  BD 20 04  LDA $0420,X
  $E7B8  29 F2     AND #$F2
  $E7BA  9D 20 04  STA $0420,X
  $E7BD  A9 3B     LDA #$3B
  $E7BF  9D 00 04  STA $0400,X
  $E7C2  A9 00     LDA #$00
  $E7C4  9D A0 06  STA $06A0,X
  $E7C7  9D 80 06  STA $0680,X
  $E7CA  9D E0 04  STA $04E0,X
  $E7CD  9D C0 06  STA $06C0,X

L_E7D0:
  $E7D0  A6 2B     LDX $2B

L_E7D2:
  $E7D2  18        CLC
  $E7D3  60        RTS

L_E7D4:
  $E7D4  A9 00     LDA #$00
  $E7D6  99 20 04  STA $0420,Y
  $E7D9  F0 F5     BEQ $E7D0
  $E7DB  A4 2B     LDY $2B
  $E7DD  B9 20 04  LDA $0420,Y
  $E7E0  29 08     AND #$08
  $E7E2  D0 35     BNE $E819
  $E7E4  B9 00 04  LDA $0400,Y
  $E7E7  A8        TAY
  $E7E8  B9 7C EB  LDA $EB7C,Y
  $E7EB  85 00     STA $00
  $E7ED  F0 2A     BEQ $E819
  $E7EF  20 7F E9  JSR $E97F
  $E7F2  8A        TXA
  $E7F3  48        PHA
  $E7F4  A9 2B     LDA #$2B
  $E7F6  20 51 C0  JSR $C051
  $E7F9  68        PLA
  $E7FA  A8        TAY
  $E7FB  A6 2B     LDX $2B
  $E7FD  BD 00 01  LDA $0100,X
  $E800  D0 33     BNE $E835
  $E802  FE 00 01  INC $0100,X
  $E805  38        SEC
  $E806  BD C0 06  LDA $06C0,X
  $E809  E5 00     SBC $00
  $E80B  9D C0 06  STA $06C0,X
  $E80E  F0 02     BEQ $E812
  $E810  B0 C2     BCS $E7D4

L_E812:
  $E812  A9 00     LDA #$00
  $E814  9D C0 06  STA $06C0,X
  $E817  38        SEC
  $E818  60        RTS

L_E819:
  $E819  A9 00     LDA #$00
  $E81B  9D 00 06  STA $0600,X
  $E81E  9D 20 06  STA $0620,X
  $E821  9D 60 06  STA $0660,X
  $E824  A9 04     LDA #$04
  $E826  9D 40 06  STA $0640,X
  $E829  A9 80     LDA #$80
  $E82B  9D 20 04  STA $0420,X
  $E82E  A9 2D     LDA #$2D
  $E830  20 51 C0  JSR $C051
  $E833  A6 2B     LDX $2B

L_E835:
  $E835  18        CLC
  $E836  60        RTS
  $E837  A4 2B     LDY $2B
  $E839  B9 20 04  LDA $0420,Y
  $E83C  29 08     AND #$08
  $E83E  D0 35     BNE $E875
  $E840  B9 00 04  LDA $0400,Y
  $E843  A8        TAY
  $E844  B9 F4 EB  LDA $EBF4,Y
  $E847  85 00     STA $00
  $E849  F0 2A     BEQ $E875
  $E84B  20 7F E9  JSR $E97F
  $E84E  8A        TXA
  $E84F  48        PHA
  $E850  A9 2B     LDA #$2B
  $E852  20 51 C0  JSR $C051
  $E855  68        PLA
  $E856  A8        TAY
  $E857  A6 2B     LDX $2B
  $E859  BD 00 01  LDA $0100,X
  $E85C  D0 47     BNE $E8A5
  $E85E  FE 00 01  INC $0100,X
  $E861  38        SEC
  $E862  BD C0 06  LDA $06C0,X
  $E865  E5 00     SBC $00
  $E867  9D C0 06  STA $06C0,X
  $E86A  F0 02     BEQ $E86E
  $E86C  B0 39     BCS $E8A7

L_E86E:
  $E86E  A9 00     LDA #$00
  $E870  9D C0 06  STA $06C0,X
  $E873  38        SEC
  $E874  60        RTS

L_E875:
  $E875  A9 3C     LDA #$3C
  $E877  9D 00 04  STA $0400,X
  $E87A  BD 20 04  LDA $0420,X
  $E87D  29 C0     AND #$C0
  $E87F  49 40     EOR #$40
  $E881  09 04     ORA #$04
  $E883  9D 20 04  STA $0420,X
  $E886  A9 00     LDA #$00
  $E888  9D A0 06  STA $06A0,X
  $E88B  9D 80 06  STA $0680,X
  $E88E  9D 00 06  STA $0600,X
  $E891  9D 60 06  STA $0660,X
  $E894  A9 C0     LDA #$C0
  $E896  9D 20 06  STA $0620,X
  $E899  A9 04     LDA #$04
  $E89B  9D 40 06  STA $0640,X
  $E89E  A9 2D     LDA #$2D
  $E8A0  20 51 C0  JSR $C051

L_E8A3:
  $E8A3  A6 2B     LDX $2B

L_E8A5:
  $E8A5  18        CLC
  $E8A6  60        RTS

L_E8A7:
  $E8A7  A9 00     LDA #$00
  $E8A9  99 20 04  STA $0420,Y
  $E8AC  F0 F5     BEQ $E8A3
  $E8AE  A4 2B     LDY $2B
  $E8B0  B9 20 04  LDA $0420,Y
  $E8B3  29 08     AND #$08
  $E8B5  D0 35     BNE $E8EC
  $E8B7  B9 00 04  LDA $0400,Y
  $E8BA  A8        TAY
  $E8BB  B9 6C EC  LDA $EC6C,Y
  $E8BE  85 00     STA $00
  $E8C0  F0 2A     BEQ $E8EC
  $E8C2  20 7F E9  JSR $E97F
  $E8C5  8A        TXA
  $E8C6  48        PHA
  $E8C7  A9 2B     LDA #$2B
  $E8C9  20 51 C0  JSR $C051
  $E8CC  68        PLA
  $E8CD  A8        TAY
  $E8CE  A6 2B     LDX $2B
  $E8D0  BD 00 01  LDA $0100,X
  $E8D3  D0 3C     BNE $E911
  $E8D5  FE 00 01  INC $0100,X
  $E8D8  38        SEC
  $E8D9  BD C0 06  LDA $06C0,X
  $E8DC  E5 00     SBC $00
  $E8DE  9D C0 06  STA $06C0,X
  $E8E1  F0 02     BEQ $E8E5
  $E8E3  B0 C2     BCS $E8A7

L_E8E5:
  $E8E5  A9 00     LDA #$00
  $E8E7  9D C0 06  STA $06C0,X
  $E8EA  38        SEC
  $E8EB  60        RTS

L_E8EC:
  $E8EC  BD 00 04  LDA $0400,X
  $E8EF  C9 2F     CMP #$2F
  $E8F1  F0 1E     BEQ $E911
  $E8F3  BD E0 04  LDA $04E0,X
  $E8F6  C9 02     CMP #$02
  $E8F8  F0 17     BEQ $E911
  $E8FA  A9 05     LDA #$05
  $E8FC  9D A0 06  STA $06A0,X
  $E8FF  A9 00     LDA #$00
  $E901  9D 80 06  STA $0680,X
  $E904  A9 38     LDA #$38
  $E906  9D C0 06  STA $06C0,X
  $E909  FE E0 04  INC $04E0,X
  $E90C  A9 2D     LDA #$2D
  $E90E  20 51 C0  JSR $C051

L_E911:
  $E911  A6 2B     LDX $2B
  $E913  18        CLC
  $E914  60        RTS
  $E915  A4 2B     LDY $2B
  $E917  B9 20 04  LDA $0420,Y
  $E91A  29 08     AND #$08
  $E91C  D0 35     BNE $E953
  $E91E  B9 00 04  LDA $0400,Y
  $E921  A8        TAY
  $E922  B9 E4 EC  LDA $ECE4,Y
  $E925  85 00     STA $00
  $E927  F0 2A     BEQ $E953
  $E929  20 7F E9  JSR $E97F
  $E92C  8A        TXA
  $E92D  48        PHA
  $E92E  A9 2B     LDA #$2B
  $E930  20 51 C0  JSR $C051
  $E933  68        PLA
  $E934  A8        TAY
  $E935  A6 2B     LDX $2B
  $E937  BD 00 01  LDA $0100,X
  $E93A  D0 3A     BNE $E976
  $E93C  FE 00 01  INC $0100,X
  $E93F  38        SEC
  $E940  BD C0 06  LDA $06C0,X
  $E943  E5 00     SBC $00
  $E945  9D C0 06  STA $06C0,X
  $E948  F0 02     BEQ $E94C
  $E94A  B0 2C     BCS $E978

L_E94C:
  $E94C  A9 00     LDA #$00
  $E94E  9D C0 06  STA $06C0,X
  $E951  38        SEC
  $E952  60        RTS

L_E953:
  $E953  A9 03     LDA #$03
  $E955  9D 40 06  STA $0640,X
  $E958  A9 B2     LDA #$B2
  $E95A  9D 60 06  STA $0660,X
  $E95D  A9 01     LDA #$01
  $E95F  9D 00 06  STA $0600,X
  $E962  A9 87     LDA #$87
  $E964  9D 20 06  STA $0620,X
  $E967  BD 20 04  LDA $0420,X
  $E96A  29 F0     AND #$F0
  $E96C  9D 20 04  STA $0420,X
  $E96F  A9 2D     LDA #$2D
  $E971  20 51 C0  JSR $C051

L_E974:
  $E974  A6 2B     LDX $2B

L_E976:
  $E976  18        CLC
  $E977  60        RTS

L_E978:
  $E978  A9 00     LDA #$00
  $E97A  99 20 04  STA $0420,Y
  $E97D  F0 F5     BEQ $E974

L_E97F:
  $E97F  A5 CB     LDA $CB
  $E981  D0 02     BNE $E985
  $E983  06 00     ASL $00

L_E985:
  $E985  60        RTS
  $E986  52        .db $52
  $E987  AA        TAX
  $E988  16 72     ASL $72,X
  $E98A  DB        .db $DB
  $E98B  37        .db $37
  $E98C  7F        .db $7F
  $E98D  15 AE     ORA $AE,X
  $E98F  E6 E6     INC $E6
  $E991  E7        .db $E7
  $E992  E7        .db $E7
  $E993  E7        .db $E7
  $E994  E8        INX
  $E995  E9 E9     SBC #$E9
  $E997  E8        INX
  $E998  07        .db $07
  $E999  07        .db $07
  $E99A  14        .db $14
  $E99B  14        .db $14
  $E99C  14        .db $14
  $E99D  14        .db $14
  $E99E  14        .db $14
  $E99F  14        .db $14
  $E9A0  14        .db $14
  $E9A1  14        .db $14
  $E9A2  0A        ASL
  $E9A3  0A        ASL
  $E9A4  02        .db $02
  $E9A5  14        .db $14
  $E9A6  14        .db $14
  $E9A7  02        .db $02
  $E9A8  00        BRK
  $E9A9  00        BRK
  $E9AA  00        BRK
  $E9AB  00        BRK
  $E9AC  00        BRK
  $E9AD  00        BRK
  $E9AE  0A        ASL
  $E9AF  02        .db $02
  $E9B0  00        BRK
  $E9B1  01 00     ORA ($00,X)
  $E9B3  00        BRK
  $E9B4  00        BRK
  $E9B5  07        .db $07
  $E9B6  00        BRK
  $E9B7  02        .db $02
  $E9B8  00        BRK
  $E9B9  00        BRK
  $E9BA  14        .db $14
  $E9BB  02        .db $02
  $E9BC  00        BRK
  $E9BD  00        BRK
  $E9BE  00        BRK
  $E9BF  00        BRK
  $E9C0  00        BRK
  $E9C1  06 14     ASL $14
  $E9C3  00        BRK
  $E9C4  04        .db $04
  $E9C5  00        BRK
  $E9C6  00        BRK
  $E9C7  00        BRK
  $E9C8  00        BRK
  $E9C9  0A        ASL
  $E9CA  00        BRK
  $E9CB  00        BRK
  $E9CC  14        .db $14
  $E9CD  00        BRK
  $E9CE  04        .db $04
  $E9CF  00        BRK
  $E9D0  14        .db $14
  $E9D1  00        BRK
  $E9D2  14        .db $14
  $E9D3  00        BRK
  $E9D4  14        .db $14
  $E9D5  07        .db $07
  $E9D6  00        BRK
  $E9D7  00        BRK
  $E9D8  00        BRK
  $E9D9  00        BRK
  $E9DA  00        BRK
  $E9DB  00        BRK
  $E9DC  00        BRK
  $E9DD  14        .db $14
  $E9DE  00        BRK
  $E9DF  00        BRK
  $E9E0  04        .db $04
  $E9E1  04        .db $04
  $E9E2  00        BRK
  $E9E3  04        .db $04
  $E9E4  04        .db $04
  $E9E5  00        BRK
  $E9E6  01 02     ORA ($02,X)
  $E9E8  04        .db $04
  $E9E9  04        .db $04
  $E9EA  00        BRK
  $E9EB  00        BRK
  $E9EC  00        BRK
  $E9ED  00        BRK
  $E9EE  00        BRK
  $E9EF  00        BRK
  $E9F0  00        BRK
  $E9F1  00        BRK
  $E9F2  00        BRK
  $E9F3  00        BRK
  $E9F4  00        BRK
  $E9F5  00        BRK
  $E9F6  00        BRK
  $E9F7  00        BRK
  $E9F8  00        BRK
  $E9F9  00        BRK
  $E9FA  00        BRK
  $E9FB  00        BRK
  $E9FC  00        BRK
  $E9FD  00        BRK
  $E9FE  00        BRK
  $E9FF  00        BRK
  $EA00  00        BRK
  $EA01  00        BRK
  $EA02  07        .db $07
  $EA03  00        BRK
  $EA04  00        BRK
  $EA05  00        BRK
  $EA06  00        BRK
  $EA07  00        BRK
  $EA08  00        BRK
  $EA09  00        BRK
  $EA0A  00        BRK
  $EA0B  00        BRK
  $EA0C  00        BRK
  $EA0D  00        BRK
  $EA0E  00        BRK
  $EA0F  00        BRK
  $EA10  00        BRK
  $EA11  00        BRK
  $EA12  00        BRK
  $EA13  00        BRK
  $EA14  14        .db $14
  $EA15  14        .db $14
  $EA16  00        BRK
  $EA17  00        BRK
  $EA18  14        .db $14
  $EA19  00        BRK
  $EA1A  14        .db $14
  $EA1B  00        BRK
  $EA1C  14        .db $14
  $EA1D  00        BRK
  $EA1E  14        .db $14
  $EA1F  14        .db $14
  $EA20  14        .db $14
  $EA21  14        .db $14
  $EA22  00        BRK
  $EA23  14        .db $14
  $EA24  00        BRK
  $EA25  00        BRK
  $EA26  00        BRK
  $EA27  00        BRK
  $EA28  00        BRK
  $EA29  00        BRK
  $EA2A  14        .db $14
  $EA2B  14        .db $14
  $EA2C  00        BRK
  $EA2D  14        .db $14
  $EA2E  00        BRK
  $EA2F  00        BRK
  $EA30  00        BRK
  $EA31  14        .db $14
  $EA32  00        BRK
  $EA33  14        .db $14
  $EA34  00        BRK
  $EA35  00        BRK
  $EA36  14        .db $14
  $EA37  00        BRK
  $EA38  00        BRK
  $EA39  00        BRK
  $EA3A  00        BRK
  $EA3B  00        BRK
  $EA3C  00        BRK
  $EA3D  14        .db $14
  $EA3E  14        .db $14
  $EA3F  00        BRK
  $EA40  14        .db $14
  $EA41  00        BRK
  $EA42  00        BRK
  $EA43  00        BRK
  $EA44  00        BRK
  $EA45  14        .db $14
  $EA46  00        BRK
  $EA47  00        BRK
  $EA48  14        .db $14
  $EA49  14        .db $14
  $EA4A  00        BRK
  $EA4B  00        BRK
  $EA4C  14        .db $14
  $EA4D  00        BRK
  $EA4E  14        .db $14
  $EA4F  14        .db $14
  $EA50  14        .db $14
  $EA51  00        BRK
  $EA52  00        BRK
  $EA53  00        BRK
  $EA54  00        BRK
  $EA55  00        BRK
  $EA56  00        BRK
  $EA57  00        BRK
  $EA58  00        BRK
  $EA59  14        .db $14
  $EA5A  14        .db $14
  $EA5B  00        BRK
  $EA5C  14        .db $14
  $EA5D  14        .db $14
  $EA5E  00        BRK
  $EA5F  14        .db $14
  $EA60  14        .db $14
  $EA61  00        BRK
  $EA62  14        .db $14
  $EA63  14        .db $14
  $EA64  14        .db $14
  $EA65  14        .db $14
  $EA66  00        BRK
  $EA67  00        BRK
  $EA68  00        BRK
  $EA69  00        BRK
  $EA6A  00        BRK
  $EA6B  00        BRK
  $EA6C  00        BRK
  $EA6D  00        BRK
  $EA6E  00        BRK
  $EA6F  00        BRK
  $EA70  00        BRK
  $EA71  00        BRK
  $EA72  00        BRK
  $EA73  00        BRK
  $EA74  00        BRK
  $EA75  00        BRK
  $EA76  00        BRK
  $EA77  00        BRK
  $EA78  00        BRK
  $EA79  00        BRK
  $EA7A  00        BRK
  $EA7B  00        BRK
  $EA7C  00        BRK
  $EA7D  00        BRK
  $EA7E  14        .db $14
  $EA7F  00        BRK
  $EA80  00        BRK
  $EA81  00        BRK
  $EA82  00        BRK
  $EA83  00        BRK
  $EA84  00        BRK
  $EA85  00        BRK
  $EA86  00        BRK
  $EA87  00        BRK
  $EA88  00        BRK
  $EA89  00        BRK
  $EA8A  00        BRK
  $EA8B  00        BRK
  $EA8C  00        BRK
  $EA8D  00        BRK
  $EA8E  00        BRK
  $EA8F  00        BRK
  $EA90  14        .db $14
  $EA91  00        BRK
  $EA92  14        .db $14
  $EA93  00        BRK
  $EA94  14        .db $14
  $EA95  00        BRK
  $EA96  00        BRK
  $EA97  14        .db $14
  $EA98  00        BRK
  $EA99  14        .db $14
  $EA9A  00        BRK
  $EA9B  00        BRK
  $EA9C  00        BRK
  $EA9D  00        BRK
  $EA9E  00        BRK
  $EA9F  00        BRK
  $EAA0  00        BRK
  $EAA1  00        BRK
  $EAA2  14        .db $14
  $EAA3  00        BRK
  $EAA4  00        BRK
  $EAA5  00        BRK
  $EAA6  00        BRK
  $EAA7  00        BRK
  $EAA8  00        BRK
  $EAA9  00        BRK
  $EAAA  00        BRK
  $EAAB  00        BRK
  $EAAC  00        BRK
  $EAAD  00        BRK
  $EAAE  14        .db $14
  $EAAF  14        .db $14
  $EAB0  00        BRK
  $EAB1  00        BRK
  $EAB2  00        BRK
  $EAB3  00        BRK
  $EAB4  00        BRK
  $EAB5  00        BRK
  $EAB6  14        .db $14
  $EAB7  00        BRK
  $EAB8  14        .db $14
  $EAB9  00        BRK
  $EABA  00        BRK
  $EABB  00        BRK
  $EABC  00        BRK
  $EABD  00        BRK
  $EABE  00        BRK
  $EABF  00        BRK
  $EAC0  00        BRK
  $EAC1  00        BRK
  $EAC2  00        BRK
  $EAC3  00        BRK
  $EAC4  14        .db $14
  $EAC5  00        BRK
  $EAC6  07        .db $07
  $EAC7  00        BRK
  $EAC8  14        .db $14
  $EAC9  14        .db $14
  $EACA  00        BRK
  $EACB  00        BRK
  $EACC  00        BRK
  $EACD  00        BRK
  $EACE  00        BRK
  $EACF  00        BRK
  $EAD0  00        BRK
  $EAD1  14        .db $14
  $EAD2  00        BRK
  $EAD3  00        BRK
  $EAD4  07        .db $07
  $EAD5  07        .db $07
  $EAD6  00        BRK
  $EAD7  07        .db $07
  $EAD8  07        .db $07
  $EAD9  00        BRK
  $EADA  07        .db $07
  $EADB  04        .db $04
  $EADC  14        .db $14
  $EADD  14        .db $14
  $EADE  00        BRK
  $EADF  00        BRK
  $EAE0  00        BRK
  $EAE1  00        BRK
  $EAE2  00        BRK
  $EAE3  00        BRK
  $EAE4  00        BRK
  $EAE5  00        BRK
  $EAE6  00        BRK
  $EAE7  00        BRK
  $EAE8  00        BRK
  $EAE9  00        BRK
  $EAEA  00        BRK
  $EAEB  00        BRK
  $EAEC  00        BRK
  $EAED  00        BRK
  $EAEE  00        BRK
  $EAEF  00        BRK
  $EAF0  00        BRK
  $EAF1  00        BRK
  $EAF2  00        BRK
  $EAF3  00        BRK
  $EAF4  00        BRK
  $EAF5  00        BRK
  $EAF6  00        BRK
  $EAF7  00        BRK
  $EAF8  00        BRK
  $EAF9  00        BRK
  $EAFA  00        BRK
  $EAFB  00        BRK
  $EAFC  00        BRK
  $EAFD  00        BRK
  $EAFE  00        BRK
  $EAFF  00        BRK
  $EB00  00        BRK
  $EB01  00        BRK
  $EB02  00        BRK
  $EB03  00        BRK
  $EB04  14        .db $14
  $EB05  14        .db $14
  $EB06  00        BRK
  $EB07  00        BRK
  $EB08  14        .db $14
  $EB09  00        BRK
  $EB0A  14        .db $14
  $EB0B  00        BRK
  $EB0C  14        .db $14
  $EB0D  00        BRK
  $EB0E  14        .db $14
  $EB0F  14        .db $14
  $EB10  00        BRK
  $EB11  14        .db $14
  $EB12  00        BRK
  $EB13  07        .db $07
  $EB14  00        BRK
  $EB15  00        BRK
  $EB16  00        BRK
  $EB17  00        BRK
  $EB18  00        BRK
  $EB19  00        BRK
  $EB1A  14        .db $14
  $EB1B  14        .db $14
  $EB1C  00        BRK
  $EB1D  14        .db $14
  $EB1E  00        BRK
  $EB1F  00        BRK
  $EB20  00        BRK
  $EB21  14        .db $14
  $EB22  00        BRK
  $EB23  14        .db $14
  $EB24  00        BRK
  $EB25  00        BRK
  $EB26  14        .db $14
  $EB27  07        .db $07
  $EB28  00        BRK
  $EB29  00        BRK
  $EB2A  00        BRK
  $EB2B  00        BRK
  $EB2C  00        BRK
  $EB2D  07        .db $07
  $EB2E  14        .db $14
  $EB2F  00        BRK
  $EB30  07        .db $07
  $EB31  00        BRK
  $EB32  00        BRK
  $EB33  00        BRK
  $EB34  00        BRK
  $EB35  00        BRK
  $EB36  00        BRK
  $EB37  00        BRK
  $EB38  14        .db $14
  $EB39  00        BRK
  $EB3A  07        .db $07
  $EB3B  00        BRK
  $EB3C  14        .db $14
  $EB3D  00        BRK
  $EB3E  14        .db $14
  $EB3F  00        BRK
  $EB40  14        .db $14
  $EB41  14        .db $14
  $EB42  00        BRK
  $EB43  00        BRK
  $EB44  00        BRK
  $EB45  00        BRK
  $EB46  00        BRK
  $EB47  00        BRK
  $EB48  00        BRK
  $EB49  14        .db $14
  $EB4A  14        .db $14
  $EB4B  00        BRK
  $EB4C  14        .db $14
  $EB4D  14        .db $14
  $EB4E  00        BRK
  $EB4F  14        .db $14
  $EB50  14        .db $14
  $EB51  00        BRK
  $EB52  07        .db $07
  $EB53  07        .db $07
  $EB54  14        .db $14
  $EB55  14        .db $14
  $EB56  00        BRK
  $EB57  00        BRK
  $EB58  00        BRK
  $EB59  00        BRK
  $EB5A  00        BRK
  $EB5B  00        BRK
  $EB5C  00        BRK
  $EB5D  00        BRK
  $EB5E  00        BRK
  $EB5F  00        BRK
  $EB60  00        BRK
  $EB61  00        BRK
  $EB62  00        BRK
  $EB63  00        BRK
  $EB64  00        BRK
  $EB65  00        BRK
  $EB66  00        BRK
  $EB67  00        BRK
  $EB68  00        BRK
  $EB69  00        BRK
  $EB6A  00        BRK
  $EB6B  00        BRK
  $EB6C  00        BRK
  $EB6D  00        BRK
  $EB6E  00        BRK
  $EB6F  00        BRK
  $EB70  00        BRK
  $EB71  00        BRK
  $EB72  00        BRK
  $EB73  00        BRK
  $EB74  00        BRK
  $EB75  00        BRK
  $EB76  00        BRK
  $EB77  00        BRK
  $EB78  00        BRK
  $EB79  00        BRK
  $EB7A  00        BRK
  $EB7B  00        BRK
  $EB7C  14        .db $14
  $EB7D  14        .db $14
  $EB7E  00        BRK
  $EB7F  00        BRK
  $EB80  00        BRK
  $EB81  00        BRK
  $EB82  14        .db $14
  $EB83  00        BRK
  $EB84  14        .db $14
  $EB85  00        BRK
  $EB86  00        BRK
  $EB87  14        .db $14
  $EB88  04        .db $04
  $EB89  14        .db $14
  $EB8A  00        BRK
  $EB8B  00        BRK
  $EB8C  00        BRK
  $EB8D  00        BRK
  $EB8E  00        BRK
  $EB8F  00        BRK
  $EB90  00        BRK
  $EB91  00        BRK
  $EB92  00        BRK
  $EB93  07        .db $07
  $EB94  00        BRK
  $EB95  00        BRK
  $EB96  00        BRK
  $EB97  00        BRK
  $EB98  00        BRK
  $EB99  00        BRK
  $EB9A  00        BRK
  $EB9B  00        BRK
  $EB9C  00        BRK
  $EB9D  00        BRK
  $EB9E  00        BRK
  $EB9F  07        .db $07
  $EBA0  00        BRK
  $EBA1  00        BRK
  $EBA2  00        BRK
  $EBA3  00        BRK
  $EBA4  00        BRK
  $EBA5  00        BRK
  $EBA6  00        BRK
  $EBA7  00        BRK
  $EBA8  00        BRK
  $EBA9  00        BRK
  $EBAA  00        BRK
  $EBAB  00        BRK
  $EBAC  00        BRK
  $EBAD  00        BRK
  $EBAE  00        BRK
  $EBAF  00        BRK
  $EBB0  14        .db $14
  $EBB1  00        BRK
  $EBB2  07        .db $07
  $EBB3  00        BRK
  $EBB4  00        BRK
  $EBB5  00        BRK
  $EBB6  00        BRK
  $EBB7  00        BRK
  $EBB8  14        .db $14
  $EBB9  14        .db $14
  $EBBA  00        BRK
  $EBBB  00        BRK
  $EBBC  00        BRK
  $EBBD  00        BRK
  $EBBE  00        BRK
  $EBBF  00        BRK
  $EBC0  00        BRK
  $EBC1  00        BRK
  $EBC2  07        .db $07
  $EBC3  00        BRK
  $EBC4  00        BRK
  $EBC5  00        BRK
  $EBC6  00        BRK
  $EBC7  02        .db $02
  $EBC8  02        .db $02
  $EBC9  00        BRK
  $EBCA  00        BRK
  $EBCB  04        .db $04
  $EBCC  07        .db $07
  $EBCD  07        .db $07
  $EBCE  00        BRK
  $EBCF  00        BRK
  $EBD0  00        BRK
  $EBD1  00        BRK
  $EBD2  00        BRK
  $EBD3  00        BRK
  $EBD4  00        BRK
  $EBD5  00        BRK
  $EBD6  00        BRK
  $EBD7  00        BRK
  $EBD8  00        BRK
  $EBD9  00        BRK
  $EBDA  00        BRK
  $EBDB  00        BRK
  $EBDC  00        BRK
  $EBDD  00        BRK
  $EBDE  00        BRK
  $EBDF  00        BRK
  $EBE0  00        BRK
  $EBE1  00        BRK
  $EBE2  00        BRK
  $EBE3  00        BRK
  $EBE4  00        BRK
  $EBE5  00        BRK
  $EBE6  14        .db $14
  $EBE7  00        BRK
  $EBE8  00        BRK
  $EBE9  00        BRK
  $EBEA  00        BRK
  $EBEB  00        BRK
  $EBEC  00        BRK
  $EBED  00        BRK
  $EBEE  00        BRK
  $EBEF  00        BRK
  $EBF0  00        BRK
  $EBF1  00        BRK
  $EBF2  00        BRK
  $EBF3  00        BRK
  $EBF4  07        .db $07
  $EBF5  07        .db $07
  $EBF6  00        BRK
  $EBF7  00        BRK
  $EBF8  14        .db $14
  $EBF9  00        BRK
  $EBFA  14        .db $14
  $EBFB  00        BRK
  $EBFC  07        .db $07
  $EBFD  00        BRK
  $EBFE  04        .db $04
  $EBFF  14        .db $14
  $EC00  04        .db $04
  $EC01  14        .db $14
  $EC02  00        BRK
  $EC03  02        .db $02
  $EC04  00        BRK
  $EC05  00        BRK
  $EC06  00        BRK
  $EC07  00        BRK
  $EC08  00        BRK
  $EC09  00        BRK
  $EC0A  0A        ASL
  $EC0B  04        .db $04
  $EC0C  00        BRK
  $EC0D  02        .db $02
  $EC0E  00        BRK
  $EC0F  00        BRK
  $EC10  00        BRK
  $EC11  07        .db $07
  $EC12  00        BRK
  $EC13  02        .db $02
  $EC14  00        BRK
  $EC15  00        BRK
  $EC16  14        .db $14
  $EC17  02        .db $02
  $EC18  00        BRK
  $EC19  00        BRK
  $EC1A  00        BRK
  $EC1B  00        BRK
  $EC1C  00        BRK
  $EC1D  07        .db $07
  $EC1E  07        .db $07
  $EC1F  00        BRK
  $EC20  04        .db $04
  $EC21  00        BRK
  $EC22  00        BRK
  $EC23  00        BRK
  $EC24  00        BRK
  $EC25  0A        ASL
  $EC26  00        BRK
  $EC27  00        BRK
  $EC28  14        .db $14
  $EC29  00        BRK
  $EC2A  04        .db $04
  $EC2B  00        BRK
  $EC2C  14        .db $14
  $EC2D  00        BRK
  $EC2E  00        BRK
  $EC2F  00        BRK
  $EC30  14        .db $14
  $EC31  07        .db $07
  $EC32  00        BRK
  $EC33  00        BRK
  $EC34  00        BRK
  $EC35  00        BRK
  $EC36  00        BRK
  $EC37  00        BRK
  $EC38  00        BRK
  $EC39  14        .db $14
  $EC3A  07        .db $07
  $EC3B  00        BRK
  $EC3C  04        .db $04
  $EC3D  04        .db $04
  $EC3E  00        BRK
  $EC3F  04        .db $04
  $EC40  04        .db $04
  $EC41  00        BRK
  $EC42  04        .db $04
  $EC43  04        .db $04
  $EC44  04        .db $04
  $EC45  04        .db $04
  $EC46  00        BRK
  $EC47  00        BRK
  $EC48  00        BRK
  $EC49  00        BRK
  $EC4A  00        BRK
  $EC4B  00        BRK
  $EC4C  00        BRK
  $EC4D  00        BRK
  $EC4E  00        BRK
  $EC4F  00        BRK
  $EC50  00        BRK
  $EC51  00        BRK
  $EC52  00        BRK
  $EC53  00        BRK
  $EC54  00        BRK
  $EC55  00        BRK
  $EC56  00        BRK
  $EC57  00        BRK
  $EC58  00        BRK
  $EC59  00        BRK
  $EC5A  00        BRK
  $EC5B  00        BRK
  $EC5C  00        BRK
  $EC5D  00        BRK
  $EC5E  07        .db $07
  $EC5F  00        BRK
  $EC60  00        BRK
  $EC61  00        BRK
  $EC62  00        BRK
  $EC63  00        BRK
  $EC64  00        BRK
  $EC65  14        .db $14
  $EC66  00        BRK
  $EC67  00        BRK
  $EC68  00        BRK
  $EC69  00        BRK
  $EC6A  00        BRK
  $EC6B  00        BRK
  $EC6C  14        .db $14
  $EC6D  14        .db $14
  $EC6E  00        BRK
  $EC6F  00        BRK
  $EC70  14        .db $14
  $EC71  00        BRK
  $EC72  14        .db $14
  $EC73  00        BRK
  $EC74  14        .db $14
  $EC75  00        BRK
  $EC76  14        .db $14
  $EC77  14        .db $14
  $EC78  00        BRK
  $EC79  14        .db $14
  $EC7A  00        BRK
  $EC7B  00        BRK
  $EC7C  00        BRK
  $EC7D  00        BRK
  $EC7E  00        BRK
  $EC7F  00        BRK
  $EC80  00        BRK
  $EC81  00        BRK
  $EC82  14        .db $14
  $EC83  14        .db $14
  $EC84  00        BRK
  $EC85  00        BRK
  $EC86  00        BRK
  $EC87  00        BRK
  $EC88  00        BRK
  $EC89  14        .db $14
  $EC8A  00        BRK
  $EC8B  14        .db $14
  $EC8C  00        BRK
  $EC8D  00        BRK
  $EC8E  14        .db $14
  $EC8F  00        BRK
  $EC90  00        BRK
  $EC91  00        BRK
  $EC92  00        BRK
  $EC93  00        BRK
  $EC94  00        BRK
  $EC95  14        .db $14
  $EC96  14        .db $14
  $EC97  00        BRK
  $EC98  14        .db $14
  $EC99  0A        ASL
  $EC9A  00        BRK
  $EC9B  00        BRK
  $EC9C  00        BRK
  $EC9D  14        .db $14
  $EC9E  00        BRK
  $EC9F  00        BRK
  $ECA0  14        .db $14
  $ECA1  00        BRK
  $ECA2  07        .db $07
  $ECA3  00        BRK
  $ECA4  14        .db $14
  $ECA5  00        BRK
  $ECA6  14        .db $14
  $ECA7  00        BRK
  $ECA8  14        .db $14
  $ECA9  14        .db $14
  $ECAA  00        BRK
  $ECAB  00        BRK
  $ECAC  00        BRK
  $ECAD  00        BRK
  $ECAE  00        BRK
  $ECAF  00        BRK
  $ECB0  00        BRK
  $ECB1  14        .db $14
  $ECB2  07        .db $07
  $ECB3  00        BRK
  $ECB4  04        .db $04
  $ECB5  04        .db $04
  $ECB6  00        BRK
  $ECB7  04        .db $04
  $ECB8  04        .db $04
  $ECB9  00        BRK
  $ECBA  04        .db $04
  $ECBB  02        .db $02
  $ECBC  04        .db $04
  $ECBD  04        .db $04
  $ECBE  00        BRK
  $ECBF  00        BRK
  $ECC0  00        BRK
  $ECC1  00        BRK
  $ECC2  00        BRK
  $ECC3  0A        ASL
  $ECC4  00        BRK
  $ECC5  00        BRK
  $ECC6  00        BRK
  $ECC7  00        BRK
  $ECC8  00        BRK
  $ECC9  00        BRK
  $ECCA  00        BRK
  $ECCB  00        BRK
  $ECCC  00        BRK
  $ECCD  00        BRK
  $ECCE  00        BRK
  $ECCF  00        BRK
  $ECD0  00        BRK
  $ECD1  00        BRK
  $ECD2  00        BRK
  $ECD3  00        BRK
  $ECD4  00        BRK
  $ECD5  00        BRK
  $ECD6  00        BRK
  $ECD7  00        BRK
  $ECD8  00        BRK
  $ECD9  14        .db $14
  $ECDA  00        BRK
  $ECDB  00        BRK
  $ECDC  00        BRK
  $ECDD  14        .db $14
  $ECDE  00        BRK
  $ECDF  00        BRK
  $ECE0  00        BRK
  $ECE1  00        BRK
  $ECE2  00        BRK
  $ECE3  00        BRK
  $ECE4  14        .db $14
  $ECE5  14        .db $14
  $ECE6  00        BRK
  $ECE7  00        BRK
  $ECE8  14        .db $14
  $ECE9  00        BRK
  $ECEA  14        .db $14
  $ECEB  00        BRK
  $ECEC  14        .db $14
  $ECED  00        BRK
  $ECEE  04        .db $04
  $ECEF  14        .db $14
  $ECF0  02        .db $02
  $ECF1  14        .db $14
  $ECF2  00        BRK
  $ECF3  04        .db $04
  $ECF4  00        BRK
  $ECF5  00        BRK
  $ECF6  00        BRK
  $ECF7  00        BRK
  $ECF8  00        BRK
  $ECF9  00        BRK
  $ECFA  14        .db $14
  $ECFB  04        .db $04
  $ECFC  00        BRK
  $ECFD  02        .db $02
  $ECFE  00        BRK
  $ECFF  00        BRK
  $ED00  00        BRK
  $ED01  07        .db $07
  $ED02  00        BRK
  $ED03  00        BRK
  $ED04  00        BRK
  $ED05  00        BRK
  $ED06  14        .db $14
  $ED07  04        .db $04
  $ED08  00        BRK
  $ED09  00        BRK
  $ED0A  00        BRK
  $ED0B  00        BRK
  $ED0C  00        BRK
  $ED0D  00        BRK
  $ED0E  14        .db $14
  $ED0F  00        BRK
  $ED10  14        .db $14
  $ED11  00        BRK
  $ED12  00        BRK
  $ED13  00        BRK
  $ED14  00        BRK
  $ED15  0A        ASL
  $ED16  00        BRK
  $ED17  00        BRK
  $ED18  14        .db $14
  $ED19  00        BRK
  $ED1A  04        .db $04
  $ED1B  00        BRK
  $ED1C  14        .db $14
  $ED1D  00        BRK
  $ED1E  14        .db $14
  $ED1F  00        BRK
  $ED20  14        .db $14
  $ED21  07        .db $07
  $ED22  00        BRK
  $ED23  00        BRK
  $ED24  00        BRK
  $ED25  00        BRK
  $ED26  00        BRK
  $ED27  00        BRK
  $ED28  00        BRK
  $ED29  14        .db $14
  $ED2A  00        BRK
  $ED2B  00        BRK
  $ED2C  07        .db $07
  $ED2D  07        .db $07
  $ED2E  00        BRK
  $ED2F  04        .db $04
  $ED30  04        .db $04
  $ED31  00        BRK
  $ED32  00        BRK
  $ED33  02        .db $02
  $ED34  14        .db $14
  $ED35  14        .db $14
  $ED36  00        BRK
  $ED37  00        BRK
  $ED38  00        BRK
  $ED39  00        BRK
  $ED3A  00        BRK
  $ED3B  00        BRK
  $ED3C  00        BRK
  $ED3D  00        BRK
  $ED3E  00        BRK
  $ED3F  00        BRK
  $ED40  00        BRK
  $ED41  00        BRK
  $ED42  00        BRK
  $ED43  00        BRK
  $ED44  00        BRK
  $ED45  00        BRK
  $ED46  00        BRK
  $ED47  00        BRK
  $ED48  00        BRK
  $ED49  00        BRK
  $ED4A  00        BRK
  $ED4B  00        BRK
  $ED4C  00        BRK
  $ED4D  00        BRK
  $ED4E  07        .db $07
  $ED4F  00        BRK
  $ED50  00        BRK
  $ED51  00        BRK
  $ED52  00        BRK
  $ED53  00        BRK
  $ED54  00        BRK
  $ED55  00        BRK
  $ED56  00        BRK
  $ED57  00        BRK
  $ED58  00        BRK
  $ED59  00        BRK
  $ED5A  00        BRK
  $ED5B  00        BRK
  $ED5C  02        .db $02
  $ED5D  02        .db $02
  $ED5E  02        .db $02
  $ED5F  02        .db $02
  $ED60  02        .db $02
  $ED61  02        .db $02
  $ED62  04        .db $04
  $ED63  04        .db $04
  $ED64  04        .db $04
  $ED65  04        .db $04
  $ED66  04        .db $04
  $ED67  04        .db $04
  $ED68  04        .db $04
  $ED69  01 00     ORA ($00,X)
  $ED6B  0C        .db $0C
  $ED6C  0C        .db $0C
  $ED6D  00        BRK
  $ED6E  00        BRK
  $ED6F  00        BRK
  $ED70  00        BRK
  $ED71  1C        .db $1C
  $ED72  04        .db $04
  $ED73  04        .db $04
  $ED74  02        .db $02
  $ED75  08        PHP
  $ED76  08        PHP
  $ED77  04        .db $04
  $ED78  00        BRK
  $ED79  04        .db $04
  $ED7A  00        BRK
  $ED7B  04        .db $04
  $ED7C  00        BRK
  $ED7D  00        BRK
  $ED7E  02        .db $02
  $ED7F  08        PHP
  $ED80  03        .db $03
  $ED81  00        BRK
  $ED82  00        BRK
  $ED83  00        BRK
  $ED84  00        BRK
  $ED85  04        .db $04
  $ED86  04        .db $04
  $ED87  00        BRK
  $ED88  04        .db $04
  $ED89  00        BRK
  $ED8A  00        BRK
  $ED8B  00        BRK
  $ED8C  08        PHP
  $ED8D  08        PHP
  $ED8E  08        PHP
  $ED8F  04        .db $04
  $ED90  04        .db $04
  $ED91  02        .db $02
  $ED92  06 00     ASL $00
  $ED94  04        .db $04
  $ED95  00        BRK
  $ED96  04        .db $04
  $ED97  00        BRK
  $ED98  02        .db $02
  $ED99  04        .db $04
  $ED9A  00        BRK
  $ED9B  02        .db $02
  $ED9C  00        BRK
  $ED9D  00        BRK
  $ED9E  00        BRK
  $ED9F  00        BRK
  $EDA0  02        .db $02
  $EDA1  02        .db $02
  $EDA2  04        .db $04
  $EDA3  00        BRK
  $EDA4  04        .db $04
  $EDA5  04        .db $04
  $EDA6  00        BRK
  $EDA7  04        .db $04
  $EDA8  04        .db $04
  $EDA9  02        .db $02
  $EDAA  08        PHP
  $EDAB  04        .db $04
  $EDAC  02        .db $02
  $EDAD  02        .db $02
  $EDAE  08        PHP
  $EDAF  00        BRK
  $EDB0  00        BRK
  $EDB1  00        BRK
  $EDB2  0A        ASL
  $EDB3  00        BRK
  $EDB4  04        .db $04
  $EDB5  04        .db $04
  $EDB6  02        .db $02
  $EDB7  04        .db $04
  $EDB8  03        .db $03
  $EDB9  04        .db $04
  $EDBA  04        .db $04
  $EDBB  04        .db $04
  $EDBC  00        BRK
  $EDBD  08        PHP
  $EDBE  04        .db $04
  $EDBF  04        .db $04
  $EDC0  00        BRK
  $EDC1  1C        .db $1C
  $EDC2  1C        .db $1C
  $EDC3  04        .db $04
  $EDC4  06 04     ASL $04
  $EDC6  08        PHP
  $EDC7  06 00     ASL $00
  $EDC9  04        .db $04
  $EDCA  04        .db $04
  $EDCB  06 00     ASL $00
  $EDCD  0A        ASL
  $EDCE  0A        ASL
  $EDCF  0A        ASL
  $EDD0  0A        ASL
  $EDD1  00        BRK
  $EDD2  00        BRK
  $EDD3  00        BRK
  $EDD4  00        BRK
  $EDD5  00        BRK
  $EDD6  00        BRK
  $EDD7  00        BRK
  $EDD8  A9 14     LDA #$14
  $EDDA  9D 50 01  STA $0150,X
  $EDDD  20 B3 EF  JSR $EFB3
  $EDE0  90 05     BCC $EDE7
  $EDE2  A9 00     LDA #$00
  $EDE4  9D 50 01  STA $0150,X

L_EDE7:
  $EDE7  38        SEC
  $EDE8  BD A0 04  LDA $04A0,X
  $EDEB  E9 04     SBC #$04
  $EDED  9D 60 01  STA $0160,X
  $EDF0  60        RTS
  $EDF1  A9 18     LDA #$18
  $EDF3  9D 50 01  STA $0150,X
  $EDF6  20 B3 EF  JSR $EFB3
  $EDF9  90 05     BCC $EE00
  $EDFB  A9 00     LDA #$00
  $EDFD  9D 50 01  STA $0150,X

L_EE00:
  $EE00  38        SEC
  $EE01  BD A0 04  LDA $04A0,X
  $EE04  E9 08     SBC #$08
  $EE06  9D 60 01  STA $0160,X
  $EE09  60        RTS
  $EE0A  A9 18     LDA #$18
  $EE0C  9D 50 01  STA $0150,X
  $EE0F  20 B3 EF  JSR $EFB3
  $EE12  90 05     BCC $EE19
  $EE14  A9 00     LDA #$00
  $EE16  9D 50 01  STA $0150,X

L_EE19:
  $EE19  38        SEC
  $EE1A  BD A0 04  LDA $04A0,X
  $EE1D  E9 08     SBC #$08
  $EE1F  9D 60 01  STA $0160,X
  $EE22  60        RTS
  $EE23  20 EE EF  JSR $EFEE
  $EE26  38        SEC
  $EE27  BD 00 04  LDA $0400,X
  $EE2A  E9 40     SBC #$40
  $EE2C  A8        TAY
  $EE2D  B9 79 AF  LDA $AF79,Y
  $EE30  85 01     STA $01
  $EE32  BD 20 04  LDA $0420,X
  $EE35  29 20     AND #$20
  $EE37  F0 1B     BEQ $EE54
  $EE39  A4 01     LDY $01
  $EE3B  A9 15     LDA #$15
  $EE3D  D9 58 03  CMP $0358,Y
  $EE40  D0 07     BNE $EE49
  $EE42  A9 04     LDA #$04
  $EE44  9D 20 06  STA $0620,X
  $EE47  D0 06     BNE $EE4F

L_EE49:
  $EE49  A5 00     LDA $00
  $EE4B  C9 60     CMP #$60
  $EE4D  B0 29     BCS $EE78

L_EE4F:
  $EE4F  A9 82     LDA #$82
  $EE51  9D 20 04  STA $0420,X

L_EE54:
  $EE54  BD 20 06  LDA $0620,X
  $EE57  C9 04     CMP #$04
  $EE59  B0 1D     BCS $EE78
  $EE5B  BD E0 04  LDA $04E0,X
  $EE5E  29 03     AND #$03
  $EE60  D0 13     BNE $EE75
  $EE62  9D E0 04  STA $04E0,X
  $EE65  BD 20 06  LDA $0620,X
  $EE68  FE 20 06  INC $0620,X
  $EE6B  0A        ASL
  $EE6C  0A        ASL
  $EE6D  A8        TAY
  $EE6E  A6 01     LDX $01
  $EE70  20 4C AF  JSR $AF4C
  $EE73  A6 2B     LDX $2B

L_EE75:
  $EE75  FE E0 04  INC $04E0,X

L_EE78:
  $EE78  20 B3 EF  JSR $EFB3
  $EE7B  60        RTS
  $EE7C  BD 20 06  LDA $0620,X
  $EE7F  D0 22     BNE $EEA3
  $EE81  A9 6E     LDA #$6E
  $EE83  9D E0 04  STA $04E0,X
  $EE86  FE 20 06  INC $0620,X
  $EE89  A9 00     LDA #$00
  $EE8B  9D 20 04  STA $0420,X
  $EE8E  A9 01     LDA #$01
  $EE90  85 01     STA $01
  $EE92  A9 23     LDA #$23
  $EE94  20 CF 96  JSR $96CF
  $EE97  A9 83     LDA #$83
  $EE99  9D 20 04  STA $0420,X
  $EE9C  B0 05     BCS $EEA3
  $EE9E  A9 26     LDA #$26
  $EEA0  20 59 F1  JSR $F159

L_EEA3:
  $EEA3  20 B3 EF  JSR $EFB3
  $EEA6  90 0C     BCC $EEB4
  $EEA8  A9 23     LDA #$23
  $EEAA  20 10 F0  JSR $F010
  $EEAD  90 05     BCC $EEB4
  $EEAF  A9 28     LDA #$28
  $EEB1  20 59 F1  JSR $F159

L_EEB4:
  $EEB4  60        RTS
  $EEB5  60        RTS
  $EEB6  A9 01     LDA #$01
  $EEB8  D0 02     BNE $EEBC
  $EEBA  A9 00     LDA #$00

L_EEBC:
  $EEBC  85 4E     STA $4E
  $EEBE  BD 20 04  LDA $0420,X
  $EEC1  29 03     AND #$03
  $EEC3  F0 2A     BEQ $EEEF
  $EEC5  48        PHA
  $EEC6  29 01     AND #$01
  $EEC8  F0 03     BEQ $EECD
  $EECA  20 5A E5  JSR $E55A

L_EECD:
  $EECD  68        PLA
  $EECE  29 02     AND #$02
  $EED0  F0 1D     BEQ $EEEF
  $EED2  20 EC E5  JSR $E5EC
  $EED5  90 18     BCC $EEEF
  $EED7  20 5A F2  JSR $F25A
  $EEDA  A9 06     LDA #$06
  $EEDC  9D 00 04  STA $0400,X
  $EEDF  A9 80     LDA #$80
  $EEE1  9D 20 04  STA $0420,X
  $EEE4  A9 00     LDA #$00
  $EEE6  9D 80 06  STA $0680,X
  $EEE9  9D A0 06  STA $06A0,X
  $EEEC  4C 8F EF  JMP $EF8F

L_EEEF:
  $EEEF  38        SEC
  $EEF0  BD C0 04  LDA $04C0,X
  $EEF3  FD 60 06  SBC $0660,X
  $EEF6  9D C0 04  STA $04C0,X
  $EEF9  BD A0 04  LDA $04A0,X
  $EEFC  FD 40 06  SBC $0640,X
  $EEFF  9D A0 04  STA $04A0,X
  $EF02  C9 F0     CMP #$F0
  $EF04  90 03     BCC $EF09
  $EF06  4C 8C EF  JMP $EF8C

L_EF09:
  $EF09  BD 20 04  LDA $0420,X
  $EF0C  29 04     AND #$04
  $EF0E  F0 11     BEQ $EF21
  $EF10  18        CLC
  $EF11  BD 60 06  LDA $0660,X
  $EF14  E5 30     SBC $30
  $EF16  9D 60 06  STA $0660,X
  $EF19  BD 40 06  LDA $0640,X
  $EF1C  E5 31     SBC $31
  $EF1E  9D 40 06  STA $0640,X

L_EF21:
  $EF21  BD 20 04  LDA $0420,X
  $EF24  29 40     AND #$40
  $EF26  D0 32     BNE $EF5A
  $EF28  38        SEC
  $EF29  BD 80 04  LDA $0480,X
  $EF2C  FD 20 06  SBC $0620,X
  $EF2F  9D 80 04  STA $0480,X
  $EF32  BD 60 04  LDA $0460,X
  $EF35  FD 00 06  SBC $0600,X
  $EF38  9D 60 04  STA $0460,X
  $EF3B  BD 40 04  LDA $0440,X
  $EF3E  E9 00     SBC #$00
  $EF40  9D 40 04  STA $0440,X
  $EF43  38        SEC
  $EF44  BD 60 04  LDA $0460,X
  $EF47  E5 1F     SBC $1F
  $EF49  85 08     STA $08
  $EF4B  BD 40 04  LDA $0440,X
  $EF4E  E5 20     SBC $20
  $EF50  D0 3A     BNE $EF8C
  $EF52  A5 08     LDA $08
  $EF54  C9 08     CMP #$08
  $EF56  90 34     BCC $EF8C
  $EF58  B0 30     BCS $EF8A

L_EF5A:
  $EF5A  18        CLC
  $EF5B  BD 80 04  LDA $0480,X
  $EF5E  7D 20 06  ADC $0620,X
  $EF61  9D 80 04  STA $0480,X
  $EF64  BD 60 04  LDA $0460,X
  $EF67  7D 00 06  ADC $0600,X
  $EF6A  9D 60 04  STA $0460,X
  $EF6D  BD 40 04  LDA $0440,X
  $EF70  69 00     ADC #$00
  $EF72  9D 40 04  STA $0440,X
  $EF75  38        SEC
  $EF76  BD 60 04  LDA $0460,X
  $EF79  E5 1F     SBC $1F
  $EF7B  85 08     STA $08
  $EF7D  BD 40 04  LDA $0440,X
  $EF80  E5 20     SBC $20
  $EF82  D0 08     BNE $EF8C
  $EF84  A5 08     LDA $08
  $EF86  C9 F8     CMP #$F8
  $EF88  B0 02     BCS $EF8C

L_EF8A:
  $EF8A  18        CLC
  $EF8B  60        RTS

L_EF8C:
  $EF8C  5E 20 04  LSR $0420,X

L_EF8F:
  $EF8F  E0 10     CPX #$10
  $EF91  90 09     BCC $EF9C
  $EF93  A5 4E     LDA $4E
  $EF95  D0 07     BNE $EF9E
  $EF97  A9 FF     LDA #$FF
  $EF99  9D F0 00  STA $00F0,X

L_EF9C:
  $EF9C  38        SEC
  $EF9D  60        RTS

L_EF9E:
  $EF9E  A9 FF     LDA #$FF
  $EFA0  9D 20 01  STA $0120,X
  $EFA3  BD 10 01  LDA $0110,X
  $EFA6  A8        TAY
  $EFA7  BD C0 06  LDA $06C0,X
  $EFAA  99 40 01  STA $0140,Y
  $EFAD  38        SEC
  $EFAE  60        RTS
  $EFAF  A9 01     LDA #$01
  $EFB1  D0 02     BNE $EFB5

L_EFB3:
  $EFB3  A9 00     LDA #$00

L_EFB5:
  $EFB5  85 4E     STA $4E
  $EFB7  BD 20 04  LDA $0420,X
  $EFBA  29 03     AND #$03
  $EFBC  F0 2A     BEQ $EFE8
  $EFBE  48        PHA
  $EFBF  29 01     AND #$01
  $EFC1  F0 03     BEQ $EFC6
  $EFC3  20 5A E5  JSR $E55A

L_EFC6:
  $EFC6  68        PLA
  $EFC7  29 02     AND #$02
  $EFC9  F0 1D     BEQ $EFE8
  $EFCB  20 EC E5  JSR $E5EC
  $EFCE  90 18     BCC $EFE8
  $EFD0  20 5A F2  JSR $F25A
  $EFD3  A9 06     LDA #$06
  $EFD5  9D 00 04  STA $0400,X
  $EFD8  A9 80     LDA #$80
  $EFDA  9D 20 04  STA $0420,X
  $EFDD  A9 00     LDA #$00
  $EFDF  9D 80 06  STA $0680,X
  $EFE2  9D A0 06  STA $06A0,X
  $EFE5  4C 8F EF  JMP $EF8F

L_EFE8:
  $EFE8  A5 2F     LDA $2F
  $EFEA  D0 A0     BNE $EF8C
  $EFEC  18        CLC
  $EFED  60        RTS

L_EFEE:
  $EFEE  BD 20 04  LDA $0420,X
  $EFF1  29 BF     AND #$BF
  $EFF3  9D 20 04  STA $0420,X
  $EFF6  38        SEC
  $EFF7  A5 2E     LDA $2E
  $EFF9  E5 2D     SBC $2D
  $EFFB  85 00     STA $00
  $EFFD  B0 10     BCS $F00F
  $EFFF  A5 00     LDA $00
  $F001  49 FF     EOR #$FF
  $F003  69 01     ADC #$01
  $F005  85 00     STA $00
  $F007  A9 40     LDA #$40
  $F009  1D 20 04  ORA $0420,X
  $F00C  9D 20 04  STA $0420,X

L_F00F:
  $F00F  60        RTS

L_F010:
  $F010  85 00     STA $00
  $F012  A0 0F     LDY #$0F

L_F014:
  $F014  A5 00     LDA $00

L_F016:
  $F016  D9 10 04  CMP $0410,Y
  $F019  F0 05     BEQ $F020
  $F01B  88        DEY
  $F01C  10 F8     BPL $F016
  $F01E  38        SEC
  $F01F  60        RTS

L_F020:
  $F020  B9 30 04  LDA $0430,Y
  $F023  30 05     BMI $F02A
  $F025  88        DEY
  $F026  10 EC     BPL $F014
  $F028  38        SEC
  $F029  60        RTS

L_F02A:
  $F02A  18        CLC
  $F02B  60        RTS

L_F02C:
  $F02C  A9 00     LDA #$00
  $F02E  85 0B     STA $0B
  $F030  BD 40 06  LDA $0640,X
  $F033  08        PHP
  $F034  10 09     BPL $F03F
  $F036  18        CLC
  $F037  BD A0 04  LDA $04A0,X
  $F03A  65 02     ADC $02
  $F03C  4C 45 F0  JMP $F045

L_F03F:
  $F03F  38        SEC
  $F040  BD A0 04  LDA $04A0,X
  $F043  E5 02     SBC $02

L_F045:
  $F045  85 0A     STA $0A
  $F047  18        CLC
  $F048  BD 60 04  LDA $0460,X
  $F04B  65 01     ADC $01
  $F04D  85 08     STA $08
  $F04F  BD 40 04  LDA $0440,X
  $F052  69 00     ADC #$00
  $F054  85 09     STA $09
  $F056  E0 0F     CPX #$0F
  $F058  B0 06     BCS $F060
  $F05A  20 A2 CB  JSR $CBA2
  $F05D  4C 63 F0  JMP $F063

L_F060:
  $F060  20 C3 CB  JSR $CBC3

L_F063:
  $F063  A4 00     LDY $00
  $F065  B9 50 F1  LDA $F150,Y
  $F068  85 02     STA $02
  $F06A  A6 2B     LDX $2B
  $F06C  38        SEC
  $F06D  BD 60 04  LDA $0460,X
  $F070  E5 01     SBC $01
  $F072  85 08     STA $08
  $F074  BD 40 04  LDA $0440,X
  $F077  E9 00     SBC #$00
  $F079  85 09     STA $09
  $F07B  E0 0F     CPX #$0F
  $F07D  B0 06     BCS $F085
  $F07F  20 A2 CB  JSR $CBA2
  $F082  4C 88 F0  JMP $F088

L_F085:
  $F085  20 C3 CB  JSR $CBC3

L_F088:
  $F088  A6 2B     LDX $2B
  $F08A  A4 00     LDY $00
  $F08C  B9 50 F1  LDA $F150,Y
  $F08F  05 02     ORA $02
  $F091  85 00     STA $00
  $F093  F0 38     BEQ $F0CD
  $F095  28        PLP
  $F096  30 0D     BMI $F0A5
  $F098  A5 0A     LDA $0A
  $F09A  29 0F     AND #$0F
  $F09C  49 0F     EOR #$0F
  $F09E  38        SEC
  $F09F  7D A0 04  ADC $04A0,X
  $F0A2  4C B3 F0  JMP $F0B3

L_F0A5:
  $F0A5  BD A0 04  LDA $04A0,X
  $F0A8  48        PHA
  $F0A9  A5 0A     LDA $0A
  $F0AB  29 0F     AND #$0F
  $F0AD  85 02     STA $02
  $F0AF  68        PLA
  $F0B0  38        SEC
  $F0B1  E5 02     SBC $02

L_F0B3:
  $F0B3  9D A0 04  STA $04A0,X
  $F0B6  A9 00     LDA #$00
  $F0B8  9D C0 04  STA $04C0,X
  $F0BB  BD 20 04  LDA $0420,X
  $F0BE  29 04     AND #$04
  $F0C0  F0 0A     BEQ $F0CC
  $F0C2  A9 C0     LDA #$C0
  $F0C4  9D 60 06  STA $0660,X
  $F0C7  A9 FF     LDA #$FF
  $F0C9  9D 40 06  STA $0640,X

L_F0CC:
  $F0CC  60        RTS

L_F0CD:
  $F0CD  28        PLP
  $F0CE  60        RTS

L_F0CF:
  $F0CF  BD A0 04  LDA $04A0,X
  $F0D2  85 0A     STA $0A
  $F0D4  A9 00     LDA #$00
  $F0D6  85 0B     STA $0B
  $F0D8  BD 20 04  LDA $0420,X
  $F0DB  29 40     AND #$40
  $F0DD  08        PHP
  $F0DE  F0 10     BEQ $F0F0
  $F0E0  38        SEC
  $F0E1  BD 60 04  LDA $0460,X
  $F0E4  65 01     ADC $01
  $F0E6  85 08     STA $08
  $F0E8  BD 40 04  LDA $0440,X
  $F0EB  69 00     ADC #$00
  $F0ED  4C FD F0  JMP $F0FD

L_F0F0:
  $F0F0  18        CLC
  $F0F1  BD 60 04  LDA $0460,X
  $F0F4  E5 01     SBC $01
  $F0F6  85 08     STA $08
  $F0F8  BD 40 04  LDA $0440,X
  $F0FB  E9 00     SBC #$00

L_F0FD:
  $F0FD  85 09     STA $09
  $F0FF  E0 0F     CPX #$0F
  $F101  B0 06     BCS $F109
  $F103  20 A2 CB  JSR $CBA2
  $F106  4C 0C F1  JMP $F10C

L_F109:
  $F109  20 C3 CB  JSR $CBC3

L_F10C:
  $F10C  A6 2B     LDX $2B
  $F10E  A4 00     LDY $00
  $F110  B9 50 F1  LDA $F150,Y
  $F113  85 03     STA $03
  $F115  F0 35     BEQ $F14C
  $F117  28        PLP
  $F118  F0 1A     BEQ $F134
  $F11A  A5 08     LDA $08
  $F11C  29 0F     AND #$0F
  $F11E  85 00     STA $00
  $F120  38        SEC
  $F121  BD 60 04  LDA $0460,X
  $F124  E5 00     SBC $00
  $F126  9D 60 04  STA $0460,X
  $F129  BD 40 04  LDA $0440,X
  $F12C  E9 00     SBC #$00
  $F12E  9D 40 04  STA $0440,X
  $F131  4C 2C F0  JMP $F02C

L_F134:
  $F134  A5 08     LDA $08
  $F136  29 0F     AND #$0F
  $F138  49 0F     EOR #$0F
  $F13A  38        SEC
  $F13B  7D 60 04  ADC $0460,X
  $F13E  9D 60 04  STA $0460,X
  $F141  BD 40 04  LDA $0440,X
  $F144  69 00     ADC #$00
  $F146  9D 40 04  STA $0440,X
  $F149  4C 2C F0  JMP $F02C

L_F14C:
  $F14C  28        PLP
  $F14D  4C 2C F0  JMP $F02C
  $F150  00        BRK
  $F151  01 00     ORA ($00,X)
  $F153  01 00     ORA ($00,X)
  $F155  01 01     ORA ($01,X)
  $F157  01 01     ORA ($01,X)

L_F159:
  $F159  48        PHA
  $F15A  20 43 DA  JSR $DA43
  $F15D  B0 33     BCS $F192
  $F15F  68        PLA

L_F160:
  $F160  20 7C D7  JSR $D77C
  $F163  8A        TXA
  $F164  A8        TAY
  $F165  A6 2B     LDX $2B
  $F167  BD 20 04  LDA $0420,X
  $F16A  29 40     AND #$40
  $F16C  19 30 04  ORA $0430,Y
  $F16F  99 30 04  STA $0430,Y
  $F172  BD 80 04  LDA $0480,X
  $F175  99 90 04  STA $0490,Y
  $F178  BD 60 04  LDA $0460,X
  $F17B  99 70 04  STA $0470,Y
  $F17E  BD 40 04  LDA $0440,X
  $F181  99 50 04  STA $0450,Y
  $F184  BD C0 04  LDA $04C0,X
  $F187  99 D0 04  STA $04D0,Y
  $F18A  BD A0 04  LDA $04A0,X
  $F18D  99 B0 04  STA $04B0,Y
  $F190  18        CLC
  $F191  60        RTS

L_F192:
  $F192  68        PLA
  $F193  A6 2B     LDX $2B
  $F195  38        SEC
  $F196  60        RTS
  $F197  A0 40     LDY #$40
  $F199  38        SEC
  $F19A  A5 2D     LDA $2D
  $F19C  E5 2E     SBC $2E
  $F19E  85 00     STA $00
  $F1A0  B0 0A     BCS $F1AC
  $F1A2  A5 00     LDA $00
  $F1A4  49 FF     EOR #$FF
  $F1A6  69 01     ADC #$01
  $F1A8  A0 00     LDY #$00
  $F1AA  85 00     STA $00

L_F1AC:
  $F1AC  BD 20 04  LDA $0420,X
  $F1AF  29 BF     AND #$BF
  $F1B1  9D 20 04  STA $0420,X
  $F1B4  98        TYA
  $F1B5  1D 20 04  ORA $0420,X
  $F1B8  9D 20 04  STA $0420,X
  $F1BB  38        SEC
  $F1BC  AD A0 04  LDA $04A0
  $F1BF  FD A0 04  SBC $04A0,X
  $F1C2  08        PHP
  $F1C3  B0 04     BCS $F1C9
  $F1C5  49 FF     EOR #$FF
  $F1C7  69 01     ADC #$01

L_F1C9:
  $F1C9  85 01     STA $01
  $F1CB  C5 00     CMP $00
  $F1CD  B0 3B     BCS $F20A
  $F1CF  A5 09     LDA $09
  $F1D1  85 0D     STA $0D
  $F1D3  9D 00 06  STA $0600,X
  $F1D6  A5 08     LDA $08
  $F1D8  85 0C     STA $0C
  $F1DA  9D 20 06  STA $0620,X
  $F1DD  A5 00     LDA $00
  $F1DF  85 0B     STA $0B
  $F1E1  A9 00     LDA #$00
  $F1E3  85 0A     STA $0A
  $F1E5  20 74 C8  JSR $C874
  $F1E8  A5 0F     LDA $0F
  $F1EA  85 0D     STA $0D
  $F1EC  A5 0E     LDA $0E
  $F1EE  85 0C     STA $0C
  $F1F0  A5 01     LDA $01
  $F1F2  85 0B     STA $0B
  $F1F4  A9 00     LDA #$00
  $F1F6  85 0A     STA $0A
  $F1F8  20 74 C8  JSR $C874
  $F1FB  A6 2B     LDX $2B
  $F1FD  A5 0F     LDA $0F
  $F1FF  9D 40 06  STA $0640,X
  $F202  A5 0E     LDA $0E
  $F204  9D 60 06  STA $0660,X
  $F207  4C 42 F2  JMP $F242

L_F20A:
  $F20A  A5 09     LDA $09
  $F20C  85 0D     STA $0D
  $F20E  9D 40 06  STA $0640,X
  $F211  A5 08     LDA $08
  $F213  85 0C     STA $0C
  $F215  9D 60 06  STA $0660,X
  $F218  A5 01     LDA $01
  $F21A  85 0B     STA $0B
  $F21C  A9 00     LDA #$00
  $F21E  85 0A     STA $0A
  $F220  20 74 C8  JSR $C874
  $F223  A5 0F     LDA $0F
  $F225  85 0D     STA $0D
  $F227  A5 0E     LDA $0E
  $F229  85 0C     STA $0C
  $F22B  A5 00     LDA $00
  $F22D  85 0B     STA $0B
  $F22F  A9 00     LDA #$00
  $F231  85 0A     STA $0A
  $F233  20 74 C8  JSR $C874
  $F236  A6 2B     LDX $2B
  $F238  A5 0F     LDA $0F
  $F23A  9D 00 06  STA $0600,X
  $F23D  A5 0E     LDA $0E
  $F23F  9D 20 06  STA $0620,X

L_F242:
  $F242  28        PLP
  $F243  90 14     BCC $F259
  $F245  BD 60 06  LDA $0660,X
  $F248  49 FF     EOR #$FF
  $F24A  69 01     ADC #$01
  $F24C  9D 60 06  STA $0660,X
  $F24F  BD 40 06  LDA $0640,X
  $F252  49 FF     EOR #$FF
  $F254  69 00     ADC #$00
  $F256  9D 40 06  STA $0640,X

L_F259:
  $F259  60        RTS

L_F25A:
  $F25A  A5 B1     LDA $B1
  $F25C  F0 01     BEQ $F25F
  $F25E  60        RTS

L_F25F:
  $F25F  A5 4A     LDA $4A
  $F261  85 01     STA $01
  $F263  A9 64     LDA #$64
  $F265  85 02     STA $02
  $F267  20 4E C8  JSR $C84E
  $F26A  A5 CB     LDA $CB
  $F26C  F0 48     BEQ $F2B6
  $F26E  A5 04     LDA $04
  $F270  C9 30     CMP #$30
  $F272  90 14     BCC $F288
  $F274  C9 49     CMP #$49
  $F276  90 11     BCC $F289
  $F278  C9 58     CMP #$58
  $F27A  90 11     BCC $F28D
  $F27C  C9 5D     CMP #$5D
  $F27E  90 11     BCC $F291
  $F280  C9 61     CMP #$61
  $F282  90 11     BCC $F295
  $F284  C9 62     CMP #$62
  $F286  F0 11     BEQ $F299

L_F288:
  $F288  60        RTS

L_F289:
  $F289  A9 79     LDA #$79
  $F28B  D0 14     BNE $F2A1

L_F28D:
  $F28D  A9 77     LDA #$77
  $F28F  D0 10     BNE $F2A1

L_F291:
  $F291  A9 78     LDA #$78
  $F293  D0 0C     BNE $F2A1

L_F295:
  $F295  A9 76     LDA #$76
  $F297  D0 08     BNE $F2A1

L_F299:
  $F299  A9 7B     LDA #$7B
  $F29B  D0 04     BNE $F2A1
  $F29D  A9 7A     LDA #$7A
  $F29F  D0 00     BNE $F2A1

L_F2A1:
  $F2A1  20 59 F1  JSR $F159
  $F2A4  B0 0F     BCS $F2B5
  $F2A6  A9 84     LDA #$84
  $F2A8  99 30 04  STA $0430,Y
  $F2AB  A9 02     LDA #$02
  $F2AD  99 50 06  STA $0650,Y
  $F2B0  A9 01     LDA #$01
  $F2B2  99 F0 04  STA $04F0,Y

L_F2B5:
  $F2B5  60        RTS

L_F2B6:
  $F2B6  A5 04     LDA $04
  $F2B8  C9 1C     CMP #$1C
  $F2BA  90 CC     BCC $F288
  $F2BC  C9 26     CMP #$26
  $F2BE  90 C9     BCC $F289
  $F2C0  C9 30     CMP #$30
  $F2C2  90 C9     BCC $F28D
  $F2C4  C9 4E     CMP #$4E
  $F2C6  90 C9     BCC $F291
  $F2C8  C9 62     CMP #$62
  $F2CA  90 C9     BCC $F295
  $F2CC  C9 63     CMP #$63
  $F2CE  F0 C9     BEQ $F299
  $F2D0  60        RTS

L_F2D1:
  $F2D1  A9 10     LDA #$10
  $F2D3  8D 00 20  STA $2000
  $F2D6  A9 06     LDA #$06
  $F2D8  8D 01 20  STA $2001
  $F2DB  A9 0E     LDA #$0E
  $F2DD  20 00 C0  JSR $C000
  $F2E0  4C 00 80  JMP $8000
  $F2E3  FF        .db $FF
  $F2E4  FF        .db $FF
  $F2E5  FF        .db $FF
  $F2E6  FF        .db $FF
  $F2E7  FF        .db $FF
  $F2E8  FF        .db $FF
  $F2E9  FF        .db $FF
  $F2EA  FF        .db $FF
  $F2EB  FF        .db $FF
  $F2EC  FF        .db $FF
  $F2ED  FF        .db $FF
  $F2EE  FF        .db $FF
  $F2EF  FF        .db $FF
  $F2F0  FF        .db $FF
  $F2F1  FF        .db $FF
  $F2F2  FF        .db $FF
  $F2F3  FF        .db $FF
  $F2F4  FF        .db $FF
  $F2F5  FF        .db $FF
  $F2F6  FF        .db $FF
  $F2F7  FF        .db $FF
  $F2F8  FF        .db $FF
  $F2F9  FF        .db $FF
  $F2FA  FF        .db $FF
  $F2FB  FF        .db $FF
  $F2FC  FF        .db $FF
  $F2FD  FF        .db $FF
  $F2FE  FF        .db $FF
  $F2FF  FF        .db $FF
  $F300  FF        .db $FF
  $F301  FF        .db $FF
  $F302  FF        .db $FF
  $F303  FF        .db $FF
  $F304  FF        .db $FF
  $F305  FF        .db $FF
  $F306  FF        .db $FF
  $F307  FF        .db $FF
  $F308  FF        .db $FF
  $F309  FF        .db $FF
  $F30A  FF        .db $FF
  $F30B  FF        .db $FF
  $F30C  FF        .db $FF
  $F30D  FF        .db $FF
  $F30E  FF        .db $FF
  $F30F  FF        .db $FF
  $F310  FF        .db $FF
  $F311  FF        .db $FF
  $F312  FF        .db $FF
  $F313  FF        .db $FF
  $F314  FF        .db $FF
  $F315  FF        .db $FF
  $F316  FF        .db $FF
  $F317  FF        .db $FF
  $F318  FF        .db $FF
  $F319  FF        .db $FF
  $F31A  FF        .db $FF
  $F31B  FF        .db $FF
  $F31C  FF        .db $FF
  $F31D  FF        .db $FF
  $F31E  FF        .db $FF
  $F31F  FF        .db $FF
  $F320  FF        .db $FF
  $F321  FF        .db $FF
  $F322  FF        .db $FF
  $F323  FF        .db $FF
  $F324  FF        .db $FF
  $F325  FF        .db $FF
  $F326  FF        .db $FF
  $F327  FF        .db $FF
  $F328  FF        .db $FF
  $F329  FF        .db $FF
  $F32A  FF        .db $FF
  $F32B  FF        .db $FF
  $F32C  FF        .db $FF
  $F32D  FF        .db $FF
  $F32E  FF        .db $FF
  $F32F  FF        .db $FF
  $F330  FF        .db $FF
  $F331  FF        .db $FF
  $F332  FF        .db $FF
  $F333  FF        .db $FF
  $F334  FF        .db $FF
  $F335  FF        .db $FF
  $F336  FF        .db $FF
  $F337  FF        .db $FF
  $F338  FF        .db $FF
  $F339  FF        .db $FF
  $F33A  FF        .db $FF
  $F33B  FF        .db $FF
  $F33C  FF        .db $FF
  $F33D  FF        .db $FF
  $F33E  FF        .db $FF
  $F33F  FF        .db $FF
  $F340  FF        .db $FF
  $F341  FF        .db $FF
  $F342  FF        .db $FF
  $F343  FF        .db $FF
  $F344  FF        .db $FF
  $F345  FF        .db $FF
  $F346  FF        .db $FF
  $F347  FF        .db $FF
  $F348  FF        .db $FF
  $F349  FF        .db $FF
  $F34A  FF        .db $FF
  $F34B  FF        .db $FF
  $F34C  FF        .db $FF
  $F34D  FF        .db $FF
  $F34E  FF        .db $FF
  $F34F  FF        .db $FF
  $F350  FF        .db $FF
  $F351  FF        .db $FF
  $F352  FF        .db $FF
  $F353  FF        .db $FF
  $F354  FF        .db $FF
  $F355  FF        .db $FF
  $F356  FF        .db $FF
  $F357  FF        .db $FF
  $F358  FF        .db $FF
  $F359  FF        .db $FF
  $F35A  FF        .db $FF
  $F35B  FF        .db $FF
  $F35C  FF        .db $FF
  $F35D  FF        .db $FF
  $F35E  FF        .db $FF
  $F35F  FF        .db $FF
  $F360  FF        .db $FF
  $F361  FF        .db $FF
  $F362  FF        .db $FF
  $F363  FF        .db $FF
  $F364  FF        .db $FF
  $F365  FF        .db $FF
  $F366  FF        .db $FF
  $F367  FF        .db $FF
  $F368  FF        .db $FF
  $F369  FF        .db $FF
  $F36A  FF        .db $FF
  $F36B  FF        .db $FF
  $F36C  FF        .db $FF
  $F36D  FF        .db $FF
  $F36E  FF        .db $FF
  $F36F  FF        .db $FF
  $F370  FF        .db $FF
  $F371  FF        .db $FF
  $F372  FF        .db $FF
  $F373  FF        .db $FF
  $F374  FF        .db $FF
  $F375  FF        .db $FF
  $F376  FF        .db $FF
  $F377  FF        .db $FF
  $F378  FF        .db $FF
  $F379  FF        .db $FF
  $F37A  FF        .db $FF
  $F37B  FF        .db $FF
  $F37C  FF        .db $FF
  $F37D  FF        .db $FF
  $F37E  FF        .db $FF
  $F37F  FF        .db $FF
  $F380  FF        .db $FF
  $F381  FF        .db $FF
  $F382  FF        .db $FF
  $F383  FF        .db $FF
  $F384  FF        .db $FF
  $F385  FF        .db $FF
  $F386  FF        .db $FF
  $F387  FF        .db $FF
  $F388  FF        .db $FF
  $F389  FF        .db $FF
  $F38A  FF        .db $FF
  $F38B  FF        .db $FF
  $F38C  FF        .db $FF
  $F38D  FF        .db $FF
  $F38E  FF        .db $FF
  $F38F  FF        .db $FF
  $F390  FF        .db $FF
  $F391  FF        .db $FF
  $F392  FF        .db $FF
  $F393  FF        .db $FF
  $F394  FF        .db $FF
  $F395  FF        .db $FF
  $F396  FF        .db $FF
  $F397  FF        .db $FF
  $F398  FF        .db $FF
  $F399  FF        .db $FF
  $F39A  FF        .db $FF
  $F39B  FF        .db $FF
  $F39C  FF        .db $FF
  $F39D  FF        .db $FF
  $F39E  FF        .db $FF
  $F39F  FF        .db $FF
  $F3A0  FF        .db $FF
  $F3A1  FF        .db $FF
  $F3A2  FF        .db $FF
  $F3A3  FF        .db $FF
  $F3A4  FF        .db $FF
  $F3A5  FF        .db $FF
  $F3A6  FF        .db $FF
  $F3A7  FF        .db $FF
  $F3A8  FF        .db $FF
  $F3A9  FF        .db $FF
  $F3AA  FF        .db $FF
  $F3AB  FF        .db $FF
  $F3AC  FF        .db $FF
  $F3AD  FF        .db $FF
  $F3AE  FF        .db $FF
  $F3AF  FF        .db $FF
  $F3B0  FF        .db $FF
  $F3B1  FF        .db $FF
  $F3B2  FF        .db $FF
  $F3B3  FF        .db $FF
  $F3B4  FF        .db $FF
  $F3B5  FF        .db $FF
  $F3B6  FF        .db $FF
  $F3B7  FF        .db $FF
  $F3B8  FF        .db $FF
  $F3B9  FF        .db $FF
  $F3BA  FF        .db $FF
  $F3BB  FF        .db $FF
  $F3BC  FF        .db $FF
  $F3BD  FF        .db $FF
  $F3BE  FF        .db $FF
  $F3BF  FF        .db $FF
  $F3C0  FF        .db $FF
  $F3C1  FF        .db $FF
  $F3C2  FF        .db $FF
  $F3C3  FF        .db $FF
  $F3C4  FF        .db $FF
  $F3C5  FF        .db $FF
  $F3C6  FF        .db $FF
  $F3C7  FF        .db $FF
  $F3C8  FF        .db $FF
  $F3C9  FF        .db $FF
  $F3CA  FF        .db $FF
  $F3CB  FF        .db $FF
  $F3CC  FF        .db $FF
  $F3CD  FF        .db $FF
  $F3CE  FF        .db $FF
  $F3CF  FF        .db $FF
  $F3D0  FF        .db $FF
  $F3D1  FF        .db $FF
  $F3D2  FF        .db $FF
  $F3D3  FF        .db $FF
  $F3D4  FF        .db $FF
  $F3D5  FF        .db $FF
  $F3D6  FF        .db $FF
  $F3D7  FF        .db $FF
  $F3D8  FF        .db $FF
  $F3D9  FF        .db $FF
  $F3DA  FF        .db $FF
  $F3DB  FF        .db $FF
  $F3DC  FF        .db $FF
  $F3DD  FF        .db $FF
  $F3DE  FF        .db $FF
  $F3DF  FF        .db $FF
  $F3E0  FF        .db $FF
  $F3E1  FF        .db $FF
  $F3E2  FF        .db $FF
  $F3E3  FF        .db $FF
  $F3E4  FF        .db $FF
  $F3E5  FF        .db $FF
  $F3E6  FF        .db $FF
  $F3E7  FF        .db $FF
  $F3E8  FF        .db $FF
  $F3E9  FF        .db $FF
  $F3EA  FF        .db $FF
  $F3EB  FF        .db $FF
  $F3EC  FF        .db $FF
  $F3ED  FF        .db $FF
  $F3EE  FF        .db $FF
  $F3EF  FF        .db $FF
  $F3F0  FF        .db $FF
  $F3F1  FF        .db $FF
  $F3F2  FF        .db $FF
  $F3F3  FF        .db $FF
  $F3F4  FF        .db $FF
  $F3F5  FF        .db $FF
  $F3F6  FF        .db $FF
  $F3F7  FF        .db $FF
  $F3F8  FF        .db $FF
  $F3F9  FF        .db $FF
  $F3FA  FF        .db $FF
  $F3FB  FF        .db $FF
  $F3FC  FF        .db $FF
  $F3FD  FF        .db $FF
  $F3FE  FF        .db $FF
  $F3FF  FF        .db $FF
  $F400  FF        .db $FF
  $F401  FF        .db $FF
  $F402  FF        .db $FF
  $F403  FF        .db $FF
  $F404  FF        .db $FF
  $F405  FF        .db $FF
  $F406  FF        .db $FF
  $F407  FF        .db $FF
  $F408  FF        .db $FF
  $F409  FF        .db $FF
  $F40A  FF        .db $FF
  $F40B  FF        .db $FF
  $F40C  FF        .db $FF
  $F40D  FF        .db $FF
  $F40E  FF        .db $FF
  $F40F  FF        .db $FF
  $F410  FF        .db $FF
  $F411  FF        .db $FF
  $F412  FF        .db $FF
  $F413  FF        .db $FF
  $F414  FF        .db $FF
  $F415  FF        .db $FF
  $F416  FF        .db $FF
  $F417  FF        .db $FF
  $F418  FF        .db $FF
  $F419  FF        .db $FF
  $F41A  FF        .db $FF
  $F41B  FF        .db $FF
  $F41C  FF        .db $FF
  $F41D  FF        .db $FF
  $F41E  FF        .db $FF
  $F41F  FF        .db $FF
  $F420  FF        .db $FF
  $F421  FF        .db $FF
  $F422  FF        .db $FF
  $F423  FF        .db $FF
  $F424  FF        .db $FF
  $F425  FF        .db $FF
  $F426  FF        .db $FF
  $F427  FF        .db $FF
  $F428  FF        .db $FF
  $F429  FF        .db $FF
  $F42A  FF        .db $FF
  $F42B  FF        .db $FF
  $F42C  FF        .db $FF
  $F42D  FF        .db $FF
  $F42E  FF        .db $FF
  $F42F  FF        .db $FF
  $F430  FF        .db $FF
  $F431  FF        .db $FF
  $F432  FF        .db $FF
  $F433  FF        .db $FF
  $F434  FF        .db $FF
  $F435  FF        .db $FF
  $F436  FF        .db $FF
  $F437  FF        .db $FF
  $F438  FF        .db $FF
  $F439  FF        .db $FF
  $F43A  FF        .db $FF
  $F43B  FF        .db $FF
  $F43C  FF        .db $FF
  $F43D  FF        .db $FF
  $F43E  FF        .db $FF
  $F43F  FF        .db $FF
  $F440  FF        .db $FF
  $F441  FF        .db $FF
  $F442  FF        .db $FF
  $F443  FF        .db $FF
  $F444  FF        .db $FF
  $F445  FF        .db $FF
  $F446  FF        .db $FF
  $F447  FF        .db $FF
  $F448  FF        .db $FF
  $F449  FF        .db $FF
  $F44A  FF        .db $FF
  $F44B  FF        .db $FF
  $F44C  FF        .db $FF
  $F44D  FF        .db $FF
  $F44E  FF        .db $FF
  $F44F  FF        .db $FF
  $F450  FF        .db $FF
  $F451  FF        .db $FF
  $F452  FF        .db $FF
  $F453  FF        .db $FF
  $F454  FF        .db $FF
  $F455  FF        .db $FF
  $F456  FF        .db $FF
  $F457  FF        .db $FF
  $F458  FF        .db $FF
  $F459  FF        .db $FF
  $F45A  FF        .db $FF
  $F45B  FF        .db $FF
  $F45C  FF        .db $FF
  $F45D  FF        .db $FF
  $F45E  FF        .db $FF
  $F45F  FF        .db $FF
  $F460  FF        .db $FF
  $F461  FF        .db $FF
  $F462  FF        .db $FF
  $F463  FF        .db $FF
  $F464  FF        .db $FF
  $F465  FF        .db $FF
  $F466  FF        .db $FF
  $F467  FF        .db $FF
  $F468  FF        .db $FF
  $F469  FF        .db $FF
  $F46A  FF        .db $FF
  $F46B  FF        .db $FF
  $F46C  FF        .db $FF
  $F46D  FF        .db $FF
  $F46E  FF        .db $FF
  $F46F  FF        .db $FF
  $F470  FF        .db $FF
  $F471  FF        .db $FF
  $F472  FF        .db $FF
  $F473  FF        .db $FF
  $F474  FF        .db $FF
  $F475  FF        .db $FF
  $F476  FF        .db $FF
  $F477  FF        .db $FF
  $F478  FF        .db $FF
  $F479  FF        .db $FF
  $F47A  FF        .db $FF
  $F47B  FF        .db $FF
  $F47C  FF        .db $FF
  $F47D  FF        .db $FF
  $F47E  FF        .db $FF
  $F47F  FF        .db $FF
  $F480  FF        .db $FF
  $F481  FF        .db $FF
  $F482  FF        .db $FF
  $F483  FF        .db $FF
  $F484  FF        .db $FF
  $F485  FF        .db $FF
  $F486  FF        .db $FF
  $F487  FF        .db $FF
  $F488  FF        .db $FF
  $F489  FF        .db $FF
  $F48A  FF        .db $FF
  $F48B  FF        .db $FF
  $F48C  FF        .db $FF
  $F48D  FF        .db $FF
  $F48E  FF        .db $FF
  $F48F  FF        .db $FF
  $F490  FF        .db $FF
  $F491  FF        .db $FF
  $F492  FF        .db $FF
  $F493  FF        .db $FF
  $F494  FF        .db $FF
  $F495  FF        .db $FF
  $F496  FF        .db $FF
  $F497  FF        .db $FF
  $F498  FF        .db $FF
  $F499  FF        .db $FF
  $F49A  FF        .db $FF
  $F49B  FF        .db $FF
  $F49C  FF        .db $FF
  $F49D  FF        .db $FF
  $F49E  FF        .db $FF
  $F49F  FF        .db $FF
  $F4A0  FF        .db $FF
  $F4A1  FF        .db $FF
  $F4A2  FF        .db $FF
  $F4A3  FF        .db $FF
  $F4A4  FF        .db $FF
  $F4A5  FF        .db $FF
  $F4A6  FF        .db $FF
  $F4A7  FF        .db $FF
  $F4A8  FF        .db $FF
  $F4A9  FF        .db $FF
  $F4AA  FF        .db $FF
  $F4AB  FF        .db $FF
  $F4AC  FF        .db $FF
  $F4AD  FF        .db $FF
  $F4AE  FF        .db $FF
  $F4AF  FF        .db $FF
  $F4B0  FF        .db $FF
  $F4B1  FF        .db $FF
  $F4B2  FF        .db $FF
  $F4B3  FF        .db $FF
  $F4B4  FF        .db $FF
  $F4B5  FF        .db $FF
  $F4B6  FF        .db $FF
  $F4B7  FF        .db $FF
  $F4B8  FF        .db $FF
  $F4B9  FF        .db $FF
  $F4BA  FF        .db $FF
  $F4BB  FF        .db $FF
  $F4BC  FF        .db $FF
  $F4BD  FF        .db $FF
  $F4BE  FF        .db $FF
  $F4BF  FF        .db $FF
  $F4C0  FF        .db $FF
  $F4C1  FF        .db $FF
  $F4C2  FF        .db $FF
  $F4C3  FF        .db $FF
  $F4C4  FF        .db $FF
  $F4C5  FF        .db $FF
  $F4C6  FF        .db $FF
  $F4C7  FF        .db $FF
  $F4C8  FF        .db $FF
  $F4C9  FF        .db $FF
  $F4CA  FF        .db $FF
  $F4CB  FF        .db $FF
  $F4CC  FF        .db $FF
  $F4CD  FF        .db $FF
  $F4CE  FF        .db $FF
  $F4CF  FF        .db $FF
  $F4D0  FF        .db $FF
  $F4D1  FF        .db $FF
  $F4D2  FF        .db $FF
  $F4D3  FF        .db $FF
  $F4D4  FF        .db $FF
  $F4D5  FF        .db $FF
  $F4D6  FF        .db $FF
  $F4D7  FF        .db $FF
  $F4D8  FF        .db $FF
  $F4D9  FF        .db $FF
  $F4DA  FF        .db $FF
  $F4DB  FF        .db $FF
  $F4DC  FF        .db $FF
  $F4DD  FF        .db $FF
  $F4DE  FF        .db $FF
  $F4DF  FF        .db $FF
  $F4E0  FF        .db $FF
  $F4E1  FF        .db $FF
  $F4E2  FF        .db $FF
  $F4E3  FF        .db $FF
  $F4E4  FF        .db $FF
  $F4E5  FF        .db $FF
  $F4E6  FF        .db $FF
  $F4E7  FF        .db $FF
  $F4E8  FF        .db $FF
  $F4E9  FF        .db $FF
  $F4EA  FF        .db $FF
  $F4EB  FF        .db $FF
  $F4EC  FF        .db $FF
  $F4ED  FF        .db $FF
  $F4EE  FF        .db $FF
  $F4EF  FF        .db $FF
  $F4F0  FF        .db $FF
  $F4F1  FF        .db $FF
  $F4F2  FF        .db $FF
  $F4F3  FF        .db $FF
  $F4F4  FF        .db $FF
  $F4F5  FF        .db $FF
  $F4F6  FF        .db $FF
  $F4F7  FF        .db $FF
  $F4F8  FF        .db $FF
  $F4F9  FF        .db $FF
  $F4FA  FF        .db $FF
  $F4FB  FF        .db $FF
  $F4FC  FF        .db $FF
  $F4FD  FF        .db $FF
  $F4FE  FF        .db $FF
  $F4FF  FF        .db $FF
  $F500  FF        .db $FF
  $F501  FF        .db $FF
  $F502  FF        .db $FF
  $F503  FF        .db $FF
  $F504  FF        .db $FF
  $F505  FF        .db $FF
  $F506  FF        .db $FF
  $F507  FF        .db $FF
  $F508  FF        .db $FF
  $F509  FF        .db $FF
  $F50A  FF        .db $FF
  $F50B  FF        .db $FF
  $F50C  FF        .db $FF
  $F50D  FF        .db $FF
  $F50E  FF        .db $FF
  $F50F  FF        .db $FF
  $F510  FF        .db $FF
  $F511  FF        .db $FF
  $F512  FF        .db $FF
  $F513  FF        .db $FF
  $F514  FF        .db $FF
  $F515  FF        .db $FF
  $F516  FF        .db $FF
  $F517  FF        .db $FF
  $F518  FF        .db $FF
  $F519  FF        .db $FF
  $F51A  FF        .db $FF
  $F51B  FF        .db $FF
  $F51C  FF        .db $FF
  $F51D  FF        .db $FF
  $F51E  FF        .db $FF
  $F51F  FF        .db $FF
  $F520  FF        .db $FF
  $F521  FF        .db $FF
  $F522  FF        .db $FF
  $F523  FF        .db $FF
  $F524  FF        .db $FF
  $F525  FF        .db $FF
  $F526  FF        .db $FF
  $F527  FF        .db $FF
  $F528  FF        .db $FF
  $F529  FF        .db $FF
  $F52A  FF        .db $FF
  $F52B  FF        .db $FF
  $F52C  FF        .db $FF
  $F52D  FF        .db $FF
  $F52E  FF        .db $FF
  $F52F  FF        .db $FF
  $F530  FF        .db $FF
  $F531  FF        .db $FF
  $F532  FF        .db $FF
  $F533  FF        .db $FF
  $F534  FF        .db $FF
  $F535  FF        .db $FF
  $F536  FF        .db $FF
  $F537  FF        .db $FF
  $F538  FF        .db $FF
  $F539  FF        .db $FF
  $F53A  FF        .db $FF
  $F53B  FF        .db $FF
  $F53C  FF        .db $FF
  $F53D  FF        .db $FF
  $F53E  FF        .db $FF
  $F53F  FF        .db $FF
  $F540  FF        .db $FF
  $F541  FF        .db $FF
  $F542  FF        .db $FF
  $F543  FF        .db $FF
  $F544  FF        .db $FF
  $F545  FF        .db $FF
  $F546  FF        .db $FF
  $F547  FF        .db $FF
  $F548  FF        .db $FF
  $F549  FF        .db $FF
  $F54A  FF        .db $FF
  $F54B  FF        .db $FF
  $F54C  FF        .db $FF
  $F54D  FF        .db $FF
  $F54E  FF        .db $FF
  $F54F  FF        .db $FF
  $F550  FF        .db $FF
  $F551  FF        .db $FF
  $F552  FF        .db $FF
  $F553  FF        .db $FF
  $F554  FF        .db $FF
  $F555  FF        .db $FF
  $F556  FF        .db $FF
  $F557  FF        .db $FF
  $F558  FF        .db $FF
  $F559  FF        .db $FF
  $F55A  FF        .db $FF
  $F55B  FF        .db $FF
  $F55C  FF        .db $FF
  $F55D  FF        .db $FF
  $F55E  FF        .db $FF
  $F55F  FF        .db $FF
  $F560  FF        .db $FF
  $F561  FF        .db $FF
  $F562  FF        .db $FF
  $F563  FF        .db $FF
  $F564  FF        .db $FF
  $F565  FF        .db $FF
  $F566  FF        .db $FF
  $F567  FF        .db $FF
  $F568  FF        .db $FF
  $F569  FF        .db $FF
  $F56A  FF        .db $FF
  $F56B  FF        .db $FF
  $F56C  FF        .db $FF
  $F56D  FF        .db $FF
  $F56E  FF        .db $FF
  $F56F  FF        .db $FF
  $F570  FF        .db $FF
  $F571  FF        .db $FF
  $F572  FF        .db $FF
  $F573  FF        .db $FF
  $F574  FF        .db $FF
  $F575  FF        .db $FF
  $F576  FF        .db $FF
  $F577  FF        .db $FF
  $F578  FF        .db $FF
  $F579  FF        .db $FF
  $F57A  FF        .db $FF
  $F57B  FF        .db $FF
  $F57C  FF        .db $FF
  $F57D  FF        .db $FF
  $F57E  FF        .db $FF
  $F57F  FF        .db $FF
  $F580  FF        .db $FF
  $F581  FF        .db $FF
  $F582  FF        .db $FF
  $F583  FF        .db $FF
  $F584  FF        .db $FF
  $F585  FF        .db $FF
  $F586  FF        .db $FF
  $F587  FF        .db $FF
  $F588  FF        .db $FF
  $F589  FF        .db $FF
  $F58A  FF        .db $FF
  $F58B  FF        .db $FF
  $F58C  FF        .db $FF
  $F58D  FF        .db $FF
  $F58E  FF        .db $FF
  $F58F  FF        .db $FF
  $F590  FF        .db $FF
  $F591  FF        .db $FF
  $F592  FF        .db $FF
  $F593  FF        .db $FF
  $F594  FF        .db $FF
  $F595  FF        .db $FF
  $F596  FF        .db $FF
  $F597  FF        .db $FF
  $F598  FF        .db $FF
  $F599  FF        .db $FF
  $F59A  FF        .db $FF
  $F59B  FF        .db $FF
  $F59C  FF        .db $FF
  $F59D  FF        .db $FF
  $F59E  FF        .db $FF
  $F59F  FF        .db $FF
  $F5A0  FF        .db $FF
  $F5A1  FF        .db $FF
  $F5A2  FF        .db $FF
  $F5A3  FF        .db $FF
  $F5A4  FF        .db $FF
  $F5A5  FF        .db $FF
  $F5A6  FF        .db $FF
  $F5A7  FF        .db $FF
  $F5A8  FF        .db $FF
  $F5A9  FF        .db $FF
  $F5AA  FF        .db $FF
  $F5AB  FF        .db $FF
  $F5AC  FF        .db $FF
  $F5AD  FF        .db $FF
  $F5AE  FF        .db $FF
  $F5AF  FF        .db $FF
  $F5B0  FF        .db $FF
  $F5B1  FF        .db $FF
  $F5B2  FF        .db $FF
  $F5B3  FF        .db $FF
  $F5B4  FF        .db $FF
  $F5B5  FF        .db $FF
  $F5B6  FF        .db $FF
  $F5B7  FF        .db $FF
  $F5B8  FF        .db $FF
  $F5B9  FF        .db $FF
  $F5BA  FF        .db $FF
  $F5BB  FF        .db $FF
  $F5BC  FF        .db $FF
  $F5BD  FF        .db $FF
  $F5BE  FF        .db $FF
  $F5BF  FF        .db $FF
  $F5C0  FF        .db $FF
  $F5C1  FF        .db $FF
  $F5C2  FF        .db $FF
  $F5C3  FF        .db $FF
  $F5C4  FF        .db $FF
  $F5C5  FF        .db $FF
  $F5C6  FF        .db $FF
  $F5C7  FF        .db $FF
  $F5C8  FF        .db $FF
  $F5C9  FF        .db $FF
  $F5CA  FF        .db $FF
  $F5CB  FF        .db $FF
  $F5CC  FF        .db $FF
  $F5CD  FF        .db $FF
  $F5CE  FF        .db $FF
  $F5CF  FF        .db $FF
  $F5D0  FF        .db $FF
  $F5D1  FF        .db $FF
  $F5D2  FF        .db $FF
  $F5D3  FF        .db $FF
  $F5D4  FF        .db $FF
  $F5D5  FF        .db $FF
  $F5D6  FF        .db $FF
  $F5D7  FF        .db $FF
  $F5D8  FF        .db $FF
  $F5D9  FF        .db $FF
  $F5DA  FF        .db $FF
  $F5DB  FF        .db $FF
  $F5DC  FF        .db $FF
  $F5DD  FF        .db $FF
  $F5DE  FF        .db $FF
  $F5DF  FF        .db $FF
  $F5E0  FF        .db $FF
  $F5E1  FF        .db $FF
  $F5E2  FF        .db $FF
  $F5E3  FF        .db $FF
  $F5E4  FF        .db $FF
  $F5E5  FF        .db $FF
  $F5E6  FF        .db $FF
  $F5E7  FF        .db $FF
  $F5E8  FF        .db $FF
  $F5E9  FF        .db $FF
  $F5EA  FF        .db $FF
  $F5EB  FF        .db $FF
  $F5EC  FF        .db $FF
  $F5ED  FF        .db $FF
  $F5EE  FF        .db $FF
  $F5EF  FF        .db $FF
  $F5F0  FF        .db $FF
  $F5F1  FF        .db $FF
  $F5F2  FF        .db $FF
  $F5F3  FF        .db $FF
  $F5F4  FF        .db $FF
  $F5F5  FF        .db $FF
  $F5F6  FF        .db $FF
  $F5F7  FF        .db $FF
  $F5F8  FF        .db $FF
  $F5F9  FF        .db $FF
  $F5FA  FF        .db $FF
  $F5FB  FF        .db $FF
  $F5FC  FF        .db $FF
  $F5FD  FF        .db $FF
  $F5FE  FF        .db $FF
  $F5FF  FF        .db $FF
  $F600  FF        .db $FF
  $F601  FF        .db $FF
  $F602  FF        .db $FF
  $F603  FF        .db $FF
  $F604  FF        .db $FF
  $F605  FF        .db $FF
  $F606  FF        .db $FF
  $F607  FF        .db $FF
  $F608  FF        .db $FF
  $F609  FF        .db $FF
  $F60A  FF        .db $FF
  $F60B  FF        .db $FF
  $F60C  FF        .db $FF
  $F60D  FF        .db $FF
  $F60E  FF        .db $FF
  $F60F  FF        .db $FF
  $F610  FF        .db $FF
  $F611  FF        .db $FF
  $F612  FF        .db $FF
  $F613  FF        .db $FF
  $F614  FF        .db $FF
  $F615  FF        .db $FF
  $F616  FF        .db $FF
  $F617  FF        .db $FF
  $F618  FF        .db $FF
  $F619  FF        .db $FF
  $F61A  FF        .db $FF
  $F61B  FF        .db $FF
  $F61C  FF        .db $FF
  $F61D  FF        .db $FF
  $F61E  FF        .db $FF
  $F61F  FF        .db $FF
  $F620  FF        .db $FF
  $F621  FF        .db $FF
  $F622  FF        .db $FF
  $F623  FF        .db $FF
  $F624  FF        .db $FF
  $F625  FF        .db $FF
  $F626  FF        .db $FF
  $F627  FF        .db $FF
  $F628  FF        .db $FF
  $F629  FF        .db $FF
  $F62A  FF        .db $FF
  $F62B  FF        .db $FF
  $F62C  FF        .db $FF
  $F62D  FF        .db $FF
  $F62E  FF        .db $FF
  $F62F  FF        .db $FF
  $F630  FF        .db $FF
  $F631  FF        .db $FF
  $F632  FF        .db $FF
  $F633  FF        .db $FF
  $F634  FF        .db $FF
  $F635  FF        .db $FF
  $F636  FF        .db $FF
  $F637  FF        .db $FF
  $F638  FF        .db $FF
  $F639  FF        .db $FF
  $F63A  FF        .db $FF
  $F63B  FF        .db $FF
  $F63C  FF        .db $FF
  $F63D  FF        .db $FF
  $F63E  FF        .db $FF
  $F63F  FF        .db $FF
  $F640  FF        .db $FF
  $F641  FF        .db $FF
  $F642  FF        .db $FF
  $F643  FF        .db $FF
  $F644  FF        .db $FF
  $F645  FF        .db $FF
  $F646  FF        .db $FF
  $F647  FF        .db $FF
  $F648  FF        .db $FF
  $F649  FF        .db $FF
  $F64A  FF        .db $FF
  $F64B  FF        .db $FF
  $F64C  FF        .db $FF
  $F64D  FF        .db $FF
  $F64E  FF        .db $FF
  $F64F  FF        .db $FF
  $F650  FF        .db $FF
  $F651  FF        .db $FF
  $F652  FF        .db $FF
  $F653  FF        .db $FF
  $F654  FF        .db $FF
  $F655  FF        .db $FF
  $F656  FF        .db $FF
  $F657  FF        .db $FF
  $F658  FF        .db $FF
  $F659  FF        .db $FF
  $F65A  FF        .db $FF
  $F65B  FF        .db $FF
  $F65C  FF        .db $FF
  $F65D  FF        .db $FF
  $F65E  FF        .db $FF
  $F65F  FF        .db $FF
  $F660  FF        .db $FF
  $F661  FF        .db $FF
  $F662  FF        .db $FF
  $F663  FF        .db $FF
  $F664  FF        .db $FF
  $F665  FF        .db $FF
  $F666  FF        .db $FF
  $F667  FF        .db $FF
  $F668  FF        .db $FF
  $F669  FF        .db $FF
  $F66A  FF        .db $FF
  $F66B  FF        .db $FF
  $F66C  FF        .db $FF
  $F66D  FF        .db $FF
  $F66E  FF        .db $FF
  $F66F  FF        .db $FF
  $F670  FF        .db $FF
  $F671  FF        .db $FF
  $F672  FF        .db $FF
  $F673  FF        .db $FF
  $F674  FF        .db $FF
  $F675  FF        .db $FF
  $F676  FF        .db $FF
  $F677  FF        .db $FF
  $F678  FF        .db $FF
  $F679  FF        .db $FF
  $F67A  FF        .db $FF
  $F67B  FF        .db $FF
  $F67C  FF        .db $FF
  $F67D  FF        .db $FF
  $F67E  FF        .db $FF
  $F67F  FF        .db $FF
  $F680  FF        .db $FF
  $F681  FF        .db $FF
  $F682  FF        .db $FF
  $F683  FF        .db $FF
  $F684  FF        .db $FF
  $F685  FF        .db $FF
  $F686  FF        .db $FF
  $F687  FF        .db $FF
  $F688  FF        .db $FF
  $F689  FF        .db $FF
  $F68A  FF        .db $FF
  $F68B  FF        .db $FF
  $F68C  FF        .db $FF
  $F68D  FF        .db $FF
  $F68E  FF        .db $FF
  $F68F  FF        .db $FF
  $F690  FF        .db $FF
  $F691  FF        .db $FF
  $F692  FF        .db $FF
  $F693  FF        .db $FF
  $F694  FF        .db $FF
  $F695  FF        .db $FF
  $F696  FF        .db $FF
  $F697  FF        .db $FF
  $F698  FF        .db $FF
  $F699  FF        .db $FF
  $F69A  FF        .db $FF
  $F69B  FF        .db $FF
  $F69C  FF        .db $FF
  $F69D  FF        .db $FF
  $F69E  FF        .db $FF
  $F69F  FF        .db $FF
  $F6A0  FF        .db $FF
  $F6A1  FF        .db $FF
  $F6A2  FF        .db $FF
  $F6A3  FF        .db $FF
  $F6A4  FF        .db $FF
  $F6A5  FF        .db $FF
  $F6A6  FF        .db $FF
  $F6A7  FF        .db $FF
  $F6A8  FF        .db $FF
  $F6A9  FF        .db $FF
  $F6AA  FF        .db $FF
  $F6AB  FF        .db $FF
  $F6AC  FF        .db $FF
  $F6AD  FF        .db $FF
  $F6AE  FF        .db $FF
  $F6AF  FF        .db $FF
  $F6B0  FF        .db $FF
  $F6B1  FF        .db $FF
  $F6B2  FF        .db $FF
  $F6B3  FF        .db $FF
  $F6B4  FF        .db $FF
  $F6B5  FF        .db $FF
  $F6B6  FF        .db $FF
  $F6B7  FF        .db $FF
  $F6B8  FF        .db $FF
  $F6B9  FF        .db $FF
  $F6BA  FF        .db $FF
  $F6BB  FF        .db $FF
  $F6BC  FF        .db $FF
  $F6BD  FF        .db $FF
  $F6BE  FF        .db $FF
  $F6BF  FF        .db $FF
  $F6C0  FF        .db $FF
  $F6C1  FF        .db $FF
  $F6C2  FF        .db $FF
  $F6C3  FF        .db $FF
  $F6C4  FF        .db $FF
  $F6C5  FF        .db $FF
  $F6C6  FF        .db $FF
  $F6C7  FF        .db $FF
  $F6C8  FF        .db $FF
  $F6C9  FF        .db $FF
  $F6CA  FF        .db $FF
  $F6CB  FF        .db $FF
  $F6CC  FF        .db $FF
  $F6CD  FF        .db $FF
  $F6CE  FF        .db $FF
  $F6CF  FF        .db $FF
  $F6D0  FF        .db $FF
  $F6D1  FF        .db $FF
  $F6D2  FF        .db $FF
  $F6D3  FF        .db $FF
  $F6D4  FF        .db $FF
  $F6D5  FF        .db $FF
  $F6D6  FF        .db $FF
  $F6D7  FF        .db $FF
  $F6D8  FF        .db $FF
  $F6D9  FF        .db $FF
  $F6DA  FF        .db $FF
  $F6DB  FF        .db $FF
  $F6DC  FF        .db $FF
  $F6DD  FF        .db $FF
  $F6DE  FF        .db $FF
  $F6DF  FF        .db $FF
  $F6E0  FF        .db $FF
  $F6E1  FF        .db $FF
  $F6E2  FF        .db $FF
  $F6E3  FF        .db $FF
  $F6E4  FF        .db $FF
  $F6E5  FF        .db $FF
  $F6E6  FF        .db $FF
  $F6E7  FF        .db $FF
  $F6E8  FF        .db $FF
  $F6E9  FF        .db $FF
  $F6EA  FF        .db $FF
  $F6EB  FF        .db $FF
  $F6EC  FF        .db $FF
  $F6ED  FF        .db $FF
  $F6EE  FF        .db $FF
  $F6EF  FF        .db $FF
  $F6F0  FF        .db $FF
  $F6F1  FF        .db $FF
  $F6F2  FF        .db $FF
  $F6F3  FF        .db $FF
  $F6F4  FF        .db $FF
  $F6F5  FF        .db $FF
  $F6F6  FF        .db $FF
  $F6F7  FF        .db $FF
  $F6F8  FF        .db $FF
  $F6F9  FF        .db $FF
  $F6FA  FF        .db $FF
  $F6FB  FF        .db $FF
  $F6FC  FF        .db $FF
  $F6FD  FF        .db $FF
  $F6FE  FF        .db $FF
  $F6FF  FF        .db $FF
  $F700  FF        .db $FF
  $F701  FF        .db $FF
  $F702  FF        .db $FF
  $F703  FF        .db $FF
  $F704  FF        .db $FF
  $F705  FF        .db $FF
  $F706  FF        .db $FF
  $F707  FF        .db $FF
  $F708  FF        .db $FF
  $F709  FF        .db $FF
  $F70A  FF        .db $FF
  $F70B  FF        .db $FF
  $F70C  FF        .db $FF
  $F70D  FF        .db $FF
  $F70E  FF        .db $FF
  $F70F  FF        .db $FF
  $F710  FF        .db $FF
  $F711  FF        .db $FF
  $F712  FF        .db $FF
  $F713  FF        .db $FF
  $F714  FF        .db $FF
  $F715  FF        .db $FF
  $F716  FF        .db $FF
  $F717  FF        .db $FF
  $F718  FF        .db $FF
  $F719  FF        .db $FF
  $F71A  FF        .db $FF
  $F71B  FF        .db $FF
  $F71C  FF        .db $FF
  $F71D  FF        .db $FF
  $F71E  FF        .db $FF
  $F71F  FF        .db $FF
  $F720  FF        .db $FF
  $F721  FF        .db $FF
  $F722  FF        .db $FF
  $F723  FF        .db $FF
  $F724  FF        .db $FF
  $F725  FF        .db $FF
  $F726  FF        .db $FF
  $F727  FF        .db $FF
  $F728  FF        .db $FF
  $F729  FF        .db $FF
  $F72A  FF        .db $FF
  $F72B  FF        .db $FF
  $F72C  FF        .db $FF
  $F72D  FF        .db $FF
  $F72E  FF        .db $FF
  $F72F  FF        .db $FF
  $F730  FF        .db $FF
  $F731  FF        .db $FF
  $F732  FF        .db $FF
  $F733  FF        .db $FF
  $F734  FF        .db $FF
  $F735  FF        .db $FF
  $F736  FF        .db $FF
  $F737  FF        .db $FF
  $F738  FF        .db $FF
  $F739  FF        .db $FF
  $F73A  FF        .db $FF
  $F73B  FF        .db $FF
  $F73C  FF        .db $FF
  $F73D  FF        .db $FF
  $F73E  FF        .db $FF
  $F73F  FF        .db $FF
  $F740  FF        .db $FF
  $F741  FF        .db $FF
  $F742  FF        .db $FF
  $F743  FF        .db $FF
  $F744  FF        .db $FF
  $F745  FF        .db $FF
  $F746  FF        .db $FF
  $F747  FF        .db $FF
  $F748  FF        .db $FF
  $F749  FF        .db $FF
  $F74A  FF        .db $FF
  $F74B  FF        .db $FF
  $F74C  FF        .db $FF
  $F74D  FF        .db $FF
  $F74E  FF        .db $FF
  $F74F  FF        .db $FF
  $F750  FF        .db $FF
  $F751  FF        .db $FF
  $F752  FF        .db $FF
  $F753  FF        .db $FF
  $F754  FF        .db $FF
  $F755  FF        .db $FF
  $F756  FF        .db $FF
  $F757  FF        .db $FF
  $F758  FF        .db $FF
  $F759  FF        .db $FF
  $F75A  FF        .db $FF
  $F75B  FF        .db $FF
  $F75C  FF        .db $FF
  $F75D  FF        .db $FF
  $F75E  FF        .db $FF
  $F75F  FF        .db $FF
  $F760  FF        .db $FF
  $F761  FF        .db $FF
  $F762  FF        .db $FF
  $F763  FF        .db $FF
  $F764  FF        .db $FF
  $F765  FF        .db $FF
  $F766  FF        .db $FF
  $F767  FF        .db $FF
  $F768  FF        .db $FF
  $F769  FF        .db $FF
  $F76A  FF        .db $FF
  $F76B  FF        .db $FF
  $F76C  FF        .db $FF
  $F76D  FF        .db $FF
  $F76E  FF        .db $FF
  $F76F  FF        .db $FF
  $F770  FF        .db $FF
  $F771  FF        .db $FF
  $F772  FF        .db $FF
  $F773  FF        .db $FF
  $F774  FF        .db $FF
  $F775  FF        .db $FF
  $F776  FF        .db $FF
  $F777  FF        .db $FF
  $F778  FF        .db $FF
  $F779  FF        .db $FF
  $F77A  FF        .db $FF
  $F77B  FF        .db $FF
  $F77C  FF        .db $FF
  $F77D  FF        .db $FF
  $F77E  FF        .db $FF
  $F77F  FF        .db $FF
  $F780  FF        .db $FF
  $F781  FF        .db $FF
  $F782  FF        .db $FF
  $F783  FF        .db $FF
  $F784  FF        .db $FF
  $F785  FF        .db $FF
  $F786  FF        .db $FF
  $F787  FF        .db $FF
  $F788  FF        .db $FF
  $F789  FF        .db $FF
  $F78A  FF        .db $FF
  $F78B  FF        .db $FF
  $F78C  FF        .db $FF
  $F78D  FF        .db $FF
  $F78E  FF        .db $FF
  $F78F  FF        .db $FF
  $F790  FF        .db $FF
  $F791  FF        .db $FF
  $F792  FF        .db $FF
  $F793  FF        .db $FF
  $F794  FF        .db $FF
  $F795  FF        .db $FF
  $F796  FF        .db $FF
  $F797  FF        .db $FF
  $F798  FF        .db $FF
  $F799  FF        .db $FF
  $F79A  FF        .db $FF
  $F79B  FF        .db $FF
  $F79C  FF        .db $FF
  $F79D  FF        .db $FF
  $F79E  FF        .db $FF
  $F79F  FF        .db $FF
  $F7A0  FF        .db $FF
  $F7A1  FF        .db $FF
  $F7A2  FF        .db $FF
  $F7A3  FF        .db $FF
  $F7A4  FF        .db $FF
  $F7A5  FF        .db $FF
  $F7A6  FF        .db $FF
  $F7A7  FF        .db $FF
  $F7A8  FF        .db $FF
  $F7A9  FF        .db $FF
  $F7AA  FF        .db $FF
  $F7AB  FF        .db $FF
  $F7AC  FF        .db $FF
  $F7AD  FF        .db $FF
  $F7AE  FF        .db $FF
  $F7AF  FF        .db $FF
  $F7B0  FF        .db $FF
  $F7B1  FF        .db $FF
  $F7B2  FF        .db $FF
  $F7B3  FF        .db $FF
  $F7B4  FF        .db $FF
  $F7B5  FF        .db $FF
  $F7B6  FF        .db $FF
  $F7B7  FF        .db $FF
  $F7B8  FF        .db $FF
  $F7B9  FF        .db $FF
  $F7BA  FF        .db $FF
  $F7BB  FF        .db $FF
  $F7BC  FF        .db $FF
  $F7BD  FF        .db $FF
  $F7BE  FF        .db $FF
  $F7BF  FF        .db $FF
  $F7C0  FF        .db $FF
  $F7C1  FF        .db $FF
  $F7C2  FF        .db $FF
  $F7C3  FF        .db $FF
  $F7C4  FF        .db $FF
  $F7C5  FF        .db $FF
  $F7C6  FF        .db $FF
  $F7C7  FF        .db $FF
  $F7C8  FF        .db $FF
  $F7C9  FF        .db $FF
  $F7CA  FF        .db $FF
  $F7CB  FF        .db $FF
  $F7CC  FF        .db $FF
  $F7CD  FF        .db $FF
  $F7CE  FF        .db $FF
  $F7CF  FF        .db $FF
  $F7D0  FF        .db $FF
  $F7D1  FF        .db $FF
  $F7D2  FF        .db $FF
  $F7D3  FF        .db $FF
  $F7D4  FF        .db $FF
  $F7D5  FF        .db $FF
  $F7D6  FF        .db $FF
  $F7D7  FF        .db $FF
  $F7D8  FF        .db $FF
  $F7D9  FF        .db $FF
  $F7DA  FF        .db $FF
  $F7DB  FF        .db $FF
  $F7DC  FF        .db $FF
  $F7DD  FF        .db $FF
  $F7DE  FF        .db $FF
  $F7DF  FF        .db $FF
  $F7E0  FF        .db $FF
  $F7E1  FF        .db $FF
  $F7E2  FF        .db $FF
  $F7E3  FF        .db $FF
  $F7E4  FF        .db $FF
  $F7E5  FF        .db $FF
  $F7E6  FF        .db $FF
  $F7E7  FF        .db $FF
  $F7E8  FF        .db $FF
  $F7E9  FF        .db $FF
  $F7EA  FF        .db $FF
  $F7EB  FF        .db $FF
  $F7EC  FF        .db $FF
  $F7ED  FF        .db $FF
  $F7EE  FF        .db $FF
  $F7EF  FF        .db $FF
  $F7F0  FF        .db $FF
  $F7F1  FF        .db $FF
  $F7F2  FF        .db $FF
  $F7F3  FF        .db $FF
  $F7F4  FF        .db $FF
  $F7F5  FF        .db $FF
  $F7F6  FF        .db $FF
  $F7F7  FF        .db $FF
  $F7F8  FF        .db $FF
  $F7F9  FF        .db $FF
  $F7FA  FF        .db $FF
  $F7FB  FF        .db $FF
  $F7FC  FF        .db $FF
  $F7FD  FF        .db $FF
  $F7FE  FF        .db $FF
  $F7FF  FF        .db $FF
  $F800  FF        .db $FF
  $F801  FF        .db $FF
  $F802  FF        .db $FF
  $F803  FF        .db $FF
  $F804  FF        .db $FF
  $F805  FF        .db $FF
  $F806  FF        .db $FF
  $F807  FF        .db $FF
  $F808  FF        .db $FF
  $F809  FF        .db $FF
  $F80A  FF        .db $FF
  $F80B  FF        .db $FF
  $F80C  FF        .db $FF
  $F80D  FF        .db $FF
  $F80E  FF        .db $FF
  $F80F  FF        .db $FF
  $F810  FF        .db $FF
  $F811  FF        .db $FF
  $F812  FF        .db $FF
  $F813  FF        .db $FF
  $F814  FF        .db $FF
  $F815  FF        .db $FF
  $F816  FF        .db $FF
  $F817  FF        .db $FF
  $F818  FF        .db $FF
  $F819  FF        .db $FF
  $F81A  FF        .db $FF
  $F81B  FF        .db $FF
  $F81C  FF        .db $FF
  $F81D  FF        .db $FF
  $F81E  FF        .db $FF
  $F81F  FF        .db $FF
  $F820  FF        .db $FF
  $F821  FF        .db $FF
  $F822  FF        .db $FF
  $F823  FF        .db $FF
  $F824  FF        .db $FF
  $F825  FF        .db $FF
  $F826  FF        .db $FF
  $F827  FF        .db $FF
  $F828  FF        .db $FF
  $F829  FF        .db $FF
  $F82A  FF        .db $FF
  $F82B  FF        .db $FF
  $F82C  FF        .db $FF
  $F82D  FF        .db $FF
  $F82E  FF        .db $FF
  $F82F  FF        .db $FF
  $F830  FF        .db $FF
  $F831  FF        .db $FF
  $F832  FF        .db $FF
  $F833  FF        .db $FF
  $F834  FF        .db $FF
  $F835  FF        .db $FF
  $F836  FF        .db $FF
  $F837  FF        .db $FF
  $F838  FF        .db $FF
  $F839  FF        .db $FF
  $F83A  FF        .db $FF
  $F83B  FF        .db $FF
  $F83C  FF        .db $FF
  $F83D  FF        .db $FF
  $F83E  FF        .db $FF
  $F83F  FF        .db $FF
  $F840  FF        .db $FF
  $F841  FF        .db $FF
  $F842  FF        .db $FF
  $F843  FF        .db $FF
  $F844  FF        .db $FF
  $F845  FF        .db $FF
  $F846  FF        .db $FF
  $F847  FF        .db $FF
  $F848  FF        .db $FF
  $F849  FF        .db $FF
  $F84A  FF        .db $FF
  $F84B  FF        .db $FF
  $F84C  FF        .db $FF
  $F84D  FF        .db $FF
  $F84E  FF        .db $FF
  $F84F  FF        .db $FF
  $F850  FF        .db $FF
  $F851  FF        .db $FF
  $F852  FF        .db $FF
  $F853  FF        .db $FF
  $F854  FF        .db $FF
  $F855  FF        .db $FF
  $F856  FF        .db $FF
  $F857  FF        .db $FF
  $F858  FF        .db $FF
  $F859  FF        .db $FF
  $F85A  FF        .db $FF
  $F85B  FF        .db $FF
  $F85C  FF        .db $FF
  $F85D  FF        .db $FF
  $F85E  FF        .db $FF
  $F85F  FF        .db $FF
  $F860  FF        .db $FF
  $F861  FF        .db $FF
  $F862  FF        .db $FF
  $F863  FF        .db $FF
  $F864  FF        .db $FF
  $F865  FF        .db $FF
  $F866  FF        .db $FF
  $F867  FF        .db $FF
  $F868  FF        .db $FF
  $F869  FF        .db $FF
  $F86A  FF        .db $FF
  $F86B  FF        .db $FF
  $F86C  FF        .db $FF
  $F86D  FF        .db $FF
  $F86E  FF        .db $FF
  $F86F  FF        .db $FF
  $F870  FF        .db $FF
  $F871  FF        .db $FF
  $F872  FF        .db $FF
  $F873  FF        .db $FF
  $F874  FF        .db $FF
  $F875  FF        .db $FF
  $F876  FF        .db $FF
  $F877  FF        .db $FF
  $F878  FF        .db $FF
  $F879  FF        .db $FF
  $F87A  FF        .db $FF
  $F87B  FF        .db $FF
  $F87C  FF        .db $FF
  $F87D  FF        .db $FF
  $F87E  FF        .db $FF
  $F87F  FF        .db $FF
  $F880  FF        .db $FF
  $F881  FF        .db $FF
  $F882  FF        .db $FF
  $F883  FF        .db $FF
  $F884  FF        .db $FF
  $F885  FF        .db $FF
  $F886  FF        .db $FF
  $F887  FF        .db $FF
  $F888  FF        .db $FF
  $F889  FF        .db $FF
  $F88A  FF        .db $FF
  $F88B  FF        .db $FF
  $F88C  FF        .db $FF
  $F88D  FF        .db $FF
  $F88E  FF        .db $FF
  $F88F  FF        .db $FF
  $F890  FF        .db $FF
  $F891  FF        .db $FF
  $F892  FF        .db $FF
  $F893  FF        .db $FF
  $F894  FF        .db $FF
  $F895  FF        .db $FF
  $F896  FF        .db $FF
  $F897  FF        .db $FF
  $F898  FF        .db $FF
  $F899  FF        .db $FF
  $F89A  FF        .db $FF
  $F89B  FF        .db $FF
  $F89C  FF        .db $FF
  $F89D  FF        .db $FF
  $F89E  FF        .db $FF
  $F89F  FF        .db $FF
  $F8A0  FF        .db $FF
  $F8A1  FF        .db $FF
  $F8A2  FF        .db $FF
  $F8A3  FF        .db $FF
  $F8A4  FF        .db $FF
  $F8A5  FF        .db $FF
  $F8A6  FF        .db $FF
  $F8A7  FF        .db $FF
  $F8A8  FF        .db $FF
  $F8A9  FF        .db $FF
  $F8AA  FF        .db $FF
  $F8AB  FF        .db $FF
  $F8AC  FF        .db $FF
  $F8AD  FF        .db $FF
  $F8AE  FF        .db $FF
  $F8AF  FF        .db $FF
  $F8B0  FF        .db $FF
  $F8B1  FF        .db $FF
  $F8B2  FF        .db $FF
  $F8B3  FF        .db $FF
  $F8B4  FF        .db $FF
  $F8B5  FF        .db $FF

L_F8B6:
  $F8B6  FF        .db $FF
  $F8B7  FF        .db $FF
  $F8B8  FF        .db $FF
  $F8B9  FF        .db $FF
  $F8BA  FF        .db $FF
  $F8BB  FF        .db $FF
  $F8BC  FF        .db $FF
  $F8BD  FF        .db $FF
  $F8BE  FF        .db $FF
  $F8BF  FF        .db $FF
  $F8C0  FF        .db $FF
  $F8C1  FF        .db $FF
  $F8C2  FF        .db $FF
  $F8C3  FF        .db $FF
  $F8C4  FF        .db $FF
  $F8C5  FF        .db $FF
  $F8C6  FF        .db $FF
  $F8C7  FF        .db $FF
  $F8C8  FF        .db $FF
  $F8C9  FF        .db $FF
  $F8CA  FF        .db $FF
  $F8CB  FF        .db $FF
  $F8CC  FF        .db $FF
  $F8CD  FF        .db $FF
  $F8CE  FF        .db $FF
  $F8CF  FF        .db $FF
  $F8D0  FF        .db $FF
  $F8D1  FF        .db $FF
  $F8D2  FF        .db $FF
  $F8D3  FF        .db $FF
  $F8D4  FF        .db $FF
  $F8D5  FF        .db $FF
  $F8D6  FF        .db $FF
  $F8D7  FF        .db $FF
  $F8D8  FF        .db $FF
  $F8D9  FF        .db $FF
  $F8DA  FF        .db $FF
  $F8DB  FF        .db $FF
  $F8DC  FF        .db $FF
  $F8DD  FF        .db $FF
  $F8DE  FF        .db $FF
  $F8DF  FF        .db $FF
  $F8E0  FF        .db $FF
  $F8E1  FF        .db $FF
  $F8E2  FF        .db $FF
  $F8E3  FF        .db $FF
  $F8E4  FF        .db $FF
  $F8E5  FF        .db $FF
  $F8E6  FF        .db $FF
  $F8E7  FF        .db $FF
  $F8E8  FF        .db $FF
  $F8E9  FF        .db $FF
  $F8EA  FF        .db $FF
  $F8EB  FF        .db $FF
  $F8EC  FF        .db $FF
  $F8ED  FF        .db $FF
  $F8EE  FF        .db $FF
  $F8EF  FF        .db $FF
  $F8F0  FF        .db $FF
  $F8F1  FF        .db $FF
  $F8F2  FF        .db $FF
  $F8F3  FF        .db $FF
  $F8F4  FF        .db $FF
  $F8F5  FF        .db $FF
  $F8F6  FF        .db $FF
  $F8F7  FF        .db $FF
  $F8F8  FF        .db $FF
  $F8F9  FF        .db $FF
  $F8FA  FF        .db $FF
  $F8FB  FF        .db $FF
  $F8FC  FF        .db $FF
  $F8FD  FF        .db $FF
  $F8FE  FF        .db $FF
  $F8FF  FF        .db $FF
  $F900  00        BRK
  $F901  0D 1A 27  ORA $271A
  $F904  34        .db $34
  $F905  38        SEC
  $F906  3C        .db $3C
  $F907  40        RTI
  $F908  44        .db $44
  $F909  4A        LSR
  $F90A  50 56     BVC $F962
  $F90C  5C        .db $5C
  $F90D  5F        .db $5F
  $F90E  62        .db $62
  $F90F  65 68     ADC $68
  $F911  6D 72 77  ADC $7772
  $F914  7C        .db $7C
  $F915  81 86     STA ($86,X)

L_F917:
  $F917  8B        .db $8B
  $F918  90 9C     BCC $F8B6
  $F91A  A4 AB     LDY $AB
  $F91C  AF        .db $AF
  $F91D  B3        .db $B3
  $F91E  B3        .db $B3
  $F91F  B7        .db $B7
  $F920  BB        .db $BB
  $F921  BF        .db $BF
  $F922  BF        .db $BF
  $F923  C3        .db $C3
  $F924  C6 CC     DEC $CC
  $F926  D2        .db $D2
  $F927  D8        CLD
  $F928  D8        CLD
  $F929  D8        CLD
  $F92A  D8        CLD
  $F92B  D8        CLD
  $F92C  D8        CLD

L_F92D:
  $F92D  D8        CLD
  $F92E  D8        CLD
  $F92F  D8        CLD
  $F930  DF        .db $DF
  $F931  EB        .db $EB
  $F932  F0 F9     BEQ $F92D
  $F934  FE 04 0C  INC $0C04,X
  $F937  10 1B     BPL $F954
  $F939  2A        ROL
  $F93A  36 47     ROL $47,X
  $F93C  4C 4F 56  JMP $564F
  $F93F  56 5E     LSR $5E,X
  $F941  5E 5E 5E  LSR $5E5E,X
  $F944  5E 5E 5E  LSR $5E5E,X
  $F947  5E 5E 5E  LSR $5E5E,X
  $F94A  5E 5E 5E  LSR $5E5E,X
  $F94D  5E 5E 5E  LSR $5E5E,X
  $F950  5E 70 76  LSR $7670,X
  $F953  86 8A     STX $8A
  $F955  96 9A     STX $9A,Y
  $F957  9E        .db $9E
  $F958  A2 A8     LDX #$A8
  $F95A  AC B6 BB  LDY $BBB6
  $F95D  BF        .db $BF
  $F95E  C2        .db $C2
  $F95F  C6 D1     DEC $D1
  $F961  D9 DD E5  CMP $E5DD,Y
  $F964  ED F3 F8  SBC $F8F3
  $F967  0A        ASL
  $F968  10 13     BPL $F97D
  $F96A  19 1F 24  ORA $241F,Y
  $F96D  32        .db $32
  $F96E  36 3D     ROL $3D,X
  $F970  43        .db $43
  $F971  47        .db $47
  $F972  4B        .db $4B
  $F973  4F        .db $4F
  $F974  53        .db $53
  $F975  58        CLI
  $F976  5C        .db $5C
  $F977  62        .db $62
  $F978  66 69     ROR $69
  $F97A  6D 70 74  ADC $7470

L_F97D:
  $F97D  78        SEI
  $F97E  78        SEI
  $F97F  78        SEI

L_F980:
  $F980  78        SEI
  $F981  82        .db $82
  $F982  8C 8C 8C  STY $8C8C
  $F985  90 90     BCC $F917
  $F987  97        .db $97
  $F988  97        .db $97
  $F989  9B        .db $9B
  $F98A  9B        .db $9B
  $F98B  A3        .db $A3
  $F98C  A6 B5     LDX $B5
  $F98E  B9 BD C1  LDA $C1BD,Y
  $F991  C8        INY
  $F992  C8        INY
  $F993  CC CF CF  CPY $CFCF
  $F996  D2        .db $D2
  $F997  DD E3 E6  CMP $E6E3,X
  $F99A  F1 FA     SBC ($FA),Y
  $F99C  FE 04 10  INC $1004,X
  $F99F  10 16     BPL $F9B7
  $F9A1  16 16     ASL $16,X
  $F9A3  1E 26 26  ASL $2626,X
  $F9A6  26 26     ROL $26
  $F9A8  26 2A     ROL $2A
  $F9AA  2E 32 32  ROL $3232
  $F9AD  40        RTI
  $F9AE  40        RTI
  $F9AF  40        RTI
  $F9B0  43        .db $43
  $F9B1  46 58     LSR $58
  $F9B3  58        CLI
  $F9B4  5B        .db $5B
  $F9B5  63        .db $63
  $F9B6  66 79     ROR $79
  $F9B8  79 79 7F  ADC $7F79,Y
  $F9BB  82        .db $82
  $F9BC  85 89     STA $89
  $F9BE  90 94     BCC $F954
  $F9C0  97        .db $97
  $F9C1  97        .db $97
  $F9C2  97        .db $97
  $F9C3  97        .db $97
  $F9C4  9B        .db $9B
  $F9C5  9E        .db $9E
  $F9C6  A3        .db $A3
  $F9C7  AB        .db $AB
  $F9C8  AB        .db $AB
  $F9C9  B0 B5     BCS $F980
  $F9CB  B5 B5     LDA $B5,X
  $F9CD  63        .db $63
  $F9CE  C2        .db $C2
  $F9CF  C8        INY
  $F9D0  CC CF CC  CPY $CCCF
  $F9D3  E1 E1     SBC ($E1,X)
  $F9D5  E1 E9     SBC ($E9,X)
  $F9D7  40        RTI
  $F9D8  E9 EE     SBC #$EE
  $F9DA  F4        .db $F4
  $F9DB  F9 FD 01  SBC $01FD,Y
  $F9DE  06 0D     ASL $0D
  $F9E0  14        .db $14
  $F9E1  1A        .db $1A
  $F9E2  20 27 27  JSR $2727
  $F9E5  2A        ROL
  $F9E6  2E FE 32  ROL $32FE
  $F9E9  36 39     ROL $39,X
  $F9EB  42        .db $42
  $F9EC  46 49     LSR $49
  $F9EE  52        .db $52
  $F9EF  63        .db $63
  $F9F0  55 59     EOR $59,X
  $F9F2  5D 5D 67  EOR $675D,X
  $F9F5  6D 6D 71  ADC $716D
  $F9F8  75 79     ADC $79,X
  $F9FA  7D 81 84  ADC $8481,X
  $F9FD  84 84     STY $84
  $F9FF  87        .db $87
  $FA00  FB        .db $FB
  $FA01  FB        .db $FB
  $FA02  FB        .db $FB
  $FA03  FB        .db $FB
  $FA04  FB        .db $FB
  $FA05  FB        .db $FB
  $FA06  FB        .db $FB
  $FA07  FB        .db $FB
  $FA08  FB        .db $FB
  $FA09  FB        .db $FB
  $FA0A  FB        .db $FB
  $FA0B  FB        .db $FB
  $FA0C  FB        .db $FB
  $FA0D  FB        .db $FB
  $FA0E  FB        .db $FB
  $FA0F  FB        .db $FB
  $FA10  FB        .db $FB
  $FA11  FB        .db $FB
  $FA12  FB        .db $FB
  $FA13  FB        .db $FB
  $FA14  FB        .db $FB
  $FA15  FB        .db $FB
  $FA16  FB        .db $FB
  $FA17  FB        .db $FB
  $FA18  FB        .db $FB
  $FA19  FB        .db $FB
  $FA1A  FB        .db $FB
  $FA1B  FB        .db $FB
  $FA1C  FB        .db $FB
  $FA1D  FB        .db $FB
  $FA1E  FB        .db $FB
  $FA1F  FB        .db $FB
  $FA20  FB        .db $FB
  $FA21  FB        .db $FB
  $FA22  FB        .db $FB
  $FA23  FB        .db $FB
  $FA24  FB        .db $FB
  $FA25  FB        .db $FB
  $FA26  FB        .db $FB
  $FA27  FB        .db $FB
  $FA28  FB        .db $FB
  $FA29  FB        .db $FB
  $FA2A  FB        .db $FB
  $FA2B  FB        .db $FB
  $FA2C  FB        .db $FB
  $FA2D  FB        .db $FB
  $FA2E  FB        .db $FB
  $FA2F  FB        .db $FB
  $FA30  FB        .db $FB
  $FA31  FB        .db $FB
  $FA32  FB        .db $FB
  $FA33  FB        .db $FB
  $FA34  FB        .db $FB
  $FA35  FC        .db $FC
  $FA36  FC        .db $FC
  $FA37  FC        .db $FC
  $FA38  FC        .db $FC
  $FA39  FC        .db $FC
  $FA3A  FC        .db $FC
  $FA3B  FC        .db $FC
  $FA3C  FC        .db $FC
  $FA3D  FC        .db $FC
  $FA3E  FC        .db $FC
  $FA3F  FC        .db $FC
  $FA40  FC        .db $FC
  $FA41  FC        .db $FC
  $FA42  FC        .db $FC
  $FA43  FC        .db $FC
  $FA44  FC        .db $FC
  $FA45  FC        .db $FC
  $FA46  FC        .db $FC
  $FA47  FC        .db $FC
  $FA48  FC        .db $FC
  $FA49  FC        .db $FC
  $FA4A  FC        .db $FC
  $FA4B  FC        .db $FC
  $FA4C  FC        .db $FC
  $FA4D  FC        .db $FC
  $FA4E  FC        .db $FC
  $FA4F  FC        .db $FC
  $FA50  FC        .db $FC
  $FA51  FC        .db $FC
  $FA52  FC        .db $FC
  $FA53  FC        .db $FC
  $FA54  FC        .db $FC
  $FA55  FC        .db $FC
  $FA56  FC        .db $FC
  $FA57  FC        .db $FC
  $FA58  FC        .db $FC
  $FA59  FC        .db $FC
  $FA5A  FC        .db $FC
  $FA5B  FC        .db $FC
  $FA5C  FC        .db $FC
  $FA5D  FC        .db $FC
  $FA5E  FC        .db $FC
  $FA5F  FC        .db $FC
  $FA60  FC        .db $FC
  $FA61  FC        .db $FC
  $FA62  FC        .db $FC
  $FA63  FC        .db $FC
  $FA64  FC        .db $FC
  $FA65  FC        .db $FC
  $FA66  FC        .db $FC
  $FA67  FD FD FD  SBC $FDFD,X
  $FA6A  FD FD FD  SBC $FDFD,X
  $FA6D  FD FD FD  SBC $FDFD,X
  $FA70  FD FD FD  SBC $FDFD,X
  $FA73  FD FD FD  SBC $FDFD,X
  $FA76  FD FD FD  SBC $FDFD,X
  $FA79  FD FD FD  SBC $FDFD,X
  $FA7C  FD FD FD  SBC $FDFD,X
  $FA7F  FD FD FD  SBC $FDFD,X
  $FA82  FD FD FD  SBC $FDFD,X
  $FA85  FD FD FD  SBC $FDFD,X
  $FA88  FD FD FD  SBC $FDFD,X
  $FA8B  FD FD FD  SBC $FDFD,X
  $FA8E  FD FD FD  SBC $FDFD,X
  $FA91  FD FD FD  SBC $FDFD,X
  $FA94  FD FD FD  SBC $FDFD,X
  $FA97  FD FD FD  SBC $FDFD,X
  $FA9A  FD FD FD  SBC $FDFD,X
  $FA9D  FE FE FE  INC $FEFE,X
  $FAA0  FE FE FE  INC $FEFE,X
  $FAA3  FE FE FE  INC $FEFE,X
  $FAA6  FE FE FE  INC $FEFE,X
  $FAA9  FE FE FE  INC $FEFE,X
  $FAAC  FE FE FE  INC $FEFE,X
  $FAAF  FE FE FE  INC $FEFE,X
  $FAB2  FE FE FE  INC $FEFE,X
  $FAB5  FE FE FE  INC $FEFE,X
  $FAB8  FE FE FE  INC $FEFE,X
  $FABB  FE FE FE  INC $FEFE,X
  $FABE  FE FE FE  INC $FEFE,X
  $FAC1  FE FE FE  INC $FEFE,X
  $FAC4  FE FE FE  INC $FEFE,X
  $FAC7  FE FE FE  INC $FEFE,X
  $FACA  FE FE FE  INC $FEFE,X
  $FACD  FE FE FE  INC $FEFE,X
  $FAD0  FE FE FE  INC $FEFE,X
  $FAD3  FE FE FE  INC $FEFE,X
  $FAD6  FE FE FE  INC $FEFE,X
  $FAD9  FE FE FE  INC $FEFE,X
  $FADC  FE FF FF  INC $FFFF,X
  $FADF  FF        .db $FF
  $FAE0  FF        .db $FF
  $FAE1  FF        .db $FF
  $FAE2  FF        .db $FF
  $FAE3  FF        .db $FF
  $FAE4  FF        .db $FF
  $FAE5  FF        .db $FF
  $FAE6  FF        .db $FF
  $FAE7  FD FF FF  SBC $FFFF,X
  $FAEA  FF        .db $FF
  $FAEB  FF        .db $FF
  $FAEC  FF        .db $FF
  $FAED  FF        .db $FF
  $FAEE  FF        .db $FF
  $FAEF  FE FF FF  INC $FFFF,X
  $FAF2  FF        .db $FF
  $FAF3  FF        .db $FF
  $FAF4  FF        .db $FF
  $FAF5  FF        .db $FF
  $FAF6  FF        .db $FF
  $FAF7  FF        .db $FF
  $FAF8  FF        .db $FF
  $FAF9  FF        .db $FF
  $FAFA  FF        .db $FF
  $FAFB  FF        .db $FF
  $FAFC  FF        .db $FF
  $FAFD  FF        .db $FF
  $FAFE  FF        .db $FF
  $FAFF  FF        .db $FF
  $FB00  0A        ASL
  $FB01  08        PHP
  $FB02  04        .db $04
  $FB03  04        .db $04
  $FB04  04        .db $04
  $FB05  04        .db $04
  $FB06  04        .db $04
  $FB07  04        .db $04
  $FB08  04        .db $04
  $FB09  04        .db $04
  $FB0A  04        .db $04
  $FB0B  04        .db $04
  $FB0C  05 0A     ORA $0A
  $FB0E  08        PHP
  $FB0F  09 09     ORA #$09
  $FB11  09 09     ORA #$09
  $FB13  09 09     ORA #$09
  $FB15  09 09     ORA #$09
  $FB17  09 09     ORA #$09
  $FB19  09 0A     ORA #$0A
  $FB1B  08        PHP
  $FB1C  10 10     BPL $FB2E
  $FB1E  10 10     BPL $FB30
  $FB20  10 10     BPL $FB32
  $FB22  10 10     BPL $FB34
  $FB24  10 10     BPL $FB36
  $FB26  11 0A     ORA ($0A),Y
  $FB28  08        PHP
  $FB29  20 20 20  JSR $2020
  $FB2C  20 20 20  JSR $2020
  $FB2F  20 20 20  JSR $2020

L_FB32:
  $FB32  20 20 01  JSR $0120
  $FB35  05 06     ORA $06
  $FB37  06 01     ASL $01
  $FB39  05 09     ORA $09
  $FB3B  09 01     ORA #$01
  $FB3D  05 12     ORA $12
  $FB3F  12        .db $12
  $FB40  01 05     ORA ($05,X)
  $FB42  20 20 03  JSR $0320
  $FB45  06 01     ASL $01
  $FB47  03        .db $03
  $FB48  02        .db $02
  $FB49  03        .db $03
  $FB4A  03        .db $03
  $FB4B  06 0A     ASL $0A
  $FB4D  0C        .db $0C
  $FB4E  0B        .db $0B
  $FB4F  0C        .db $0C
  $FB50  03        .db $03
  $FB51  06 0D     ASL $0D
  $FB53  0F        .db $0F
  $FB54  0E 0F 03  ASL $030F
  $FB57  06 20     ASL $20
  $FB59  20 20 20  JSR $2020
  $FB5C  00        BRK
  $FB5D  00        BRK
  $FB5E  08        PHP
  $FB5F  00        BRK
  $FB60  00        BRK
  $FB61  14        .db $14
  $FB62  00        BRK
  $FB63  00        BRK
  $FB64  13        .db $13
  $FB65  00        BRK
  $FB66  00        BRK
  $FB67  1E 02 03  ASL $0302,X
  $FB6A  06 06     ASL $06
  $FB6C  06 02     ASL $02
  $FB6E  03        .db $03
  $FB6F  09 09     ORA #$09
  $FB71  09 02     ORA #$02
  $FB73  03        .db $03
  $FB74  12        .db $12
  $FB75  12        .db $12
  $FB76  12        .db $12
  $FB77  02        .db $02
  $FB78  06 20     ASL $20
  $FB7A  20 20 02  JSR $0220
  $FB7D  01 02     ORA ($02,X)
  $FB7F  04        .db $04
  $FB80  04        .db $04
  $FB81  02        .db $02
  $FB82  01 0B     ORA ($0B,X)
  $FB84  09 09     ORA #$09
  $FB86  02        .db $02
  $FB87  01 0E     ORA ($0E,X)
  $FB89  10 10     BPL $FB9B
  $FB8B  02        .db $02
  $FB8C  01 20     ORA ($20,X)
  $FB8E  20 20 09  JSR $0920
  $FB91  02        .db $02
  $FB92  18        CLC
  $FB93  07        .db $07
  $FB94  07        .db $07
  $FB95  18        CLC
  $FB96  07        .db $07
  $FB97  07        .db $07
  $FB98  18        CLC
  $FB99  07        .db $07
  $FB9A  07        .db $07

L_FB9B:
  $FB9B  18        CLC
  $FB9C  05 07     ORA $07
  $FB9E  1A        .db $1A
  $FB9F  1A        .db $1A
  $FBA0  1A        .db $1A
  $FBA1  1A        .db $1A
  $FBA2  1A        .db $1A
  $FBA3  1A        .db $1A
  $FBA4  04        .db $04
  $FBA5  02        .db $02
  $FBA6  1B        .db $1B
  $FBA7  1C        .db $1C
  $FBA8  1D 1B 1B  ORA $1B1B,X
  $FBAB  01 08     ORA ($08,X)
  $FBAD  15 16     ORA $16,X
  $FBAF  01 08     ORA ($08,X)
  $FBB1  19 19 01  ORA $0119,Y
  $FBB4  08        PHP
  $FBB5  1F        .db $1F
  $FBB6  1F        .db $1F
  $FBB7  01 0A     ORA ($0A,X)
  $FBB9  17        .db $17
  $FBBA  21 01     AND ($01,X)
  $FBBC  0A        ASL
  $FBBD  19 19 01  ORA $0119,Y
  $FBC0  0A        ASL
  $FBC1  1F        .db $1F
  $FBC2  1F        .db $1F
  $FBC3  00        BRK
  $FBC4  00        BRK
  $FBC5  22        .db $22
  $FBC6  03        .db $03
  $FBC7  08        PHP
  $FBC8  23        .db $23
  $FBC9  24 25     BIT $25
  $FBCB  00        BRK
  $FBCC  03        .db $03
  $FBCD  01 26     ORA ($26,X)
  $FBCF  27        .db $27
  $FBD0  28        PLP
  $FBD1  29 03     AND #$03
  $FBD3  02        .db $02
  $FBD4  1B        .db $1B
  $FBD5  1D 1C 1B  ORA $1B1C,X
  $FBD8  04        .db $04
  $FBD9  02        .db $02
  $FBDA  39 3A 3B  AND $3B3A,Y
  $FBDD  3C        .db $3C
  $FBDE  00        BRK
  $FBDF  09 03     ORA #$03
  $FBE1  2F        .db $2F
  $FBE2  4D 4E 4D  EOR $4D4E
  $FBE5  4F        .db $4F
  $FBE6  50 4F     BVC $FC37
  $FBE8  51 52     EOR ($52),Y
  $FBEA  51 02     EOR ($02),Y
  $FBEC  01 3D     ORA ($3D,X)
  $FBEE  3E 3F 06  ROL $063F,X
  $FBF1  03        .db $03
  $FBF2  53        .db $53
  $FBF3  56 58     LSR $58,X
  $FBF5  57        .db $57
  $FBF6  59 56 2E  EOR $2E56,Y
  $FBF9  02        .db $02
  $FBFA  05 48     ORA $48
  $FBFC  49 4A     EOR #$4A
  $FBFE  03        .db $03
  $FBFF  03        .db $03
  $FC00  44        .db $44
  $FC01  45 46     EOR $46
  $FC03  47        .db $47
  $FC04  05 06     ORA $06
  $FC06  2A        ROL
  $FC07  2B        .db $2B
  $FC08  2C 2D 2C  BIT $2C2D
  $FC0B  2E 01 04  ROL $0401
  $FC0E  4B        .db $4B
  $FC0F  4C 08 06  JMP $0608
  $FC12  30 31     BMI $FC45
  $FC14  32        .db $32
  $FC15  33        .db $33
  $FC16  34        .db $34
  $FC17  35 36     AND $36,X
  $FC19  37        .db $37
  $FC1A  38        SEC
  $FC1B  0C        .db $0C
  $FC1C  02        .db $02
  $FC1D  5A        .db $5A
  $FC1E  5B        .db $5B
  $FC1F  5A        .db $5A
  $FC20  5A        .db $5A
  $FC21  2E 5B 2E  ROL $2E5B
  $FC24  5A        .db $5A
  $FC25  39 3A 3B  AND $3B3A,Y
  $FC28  3C        .db $3C
  $FC29  00        BRK
  $FC2A  09 02     ORA #$02
  $FC2C  5C        .db $5C
  $FC2D  5C        .db $5C
  $FC2E  5D 5D 5C  EOR $5C5D,X
  $FC31  39 3A 3B  AND $3B3A,Y
  $FC34  3C        .db $3C
  $FC35  00        BRK
  $FC36  0E 02 5E  ASL $5E02
  $FC39  5E 5F 5F  LSR $5F5F,X
  $FC3C  5E 5E 2E  LSR $2E5E,X
  $FC3F  5F        .db $5F
  $FC40  2E 5E 39  ROL $395E
  $FC43  3A        .db $3A
  $FC44  3B        .db $3B

L_FC45:
  $FC45  3C        .db $3C
  $FC46  00        BRK
  $FC47  02        .db $02
  $FC48  03        .db $03
  $FC49  57        .db $57
  $FC4A  54        .db $54
  $FC4B  55 00     EOR $00,X
  $FC4D  00        BRK
  $FC4E  44        .db $44
  $FC4F  04        .db $04
  $FC50  03        .db $03
  $FC51  40        RTI
  $FC52  41 42     EOR ($42,X)
  $FC54  43        .db $43
  $FC55  00        BRK
  $FC56  05 04     ORA $04
  $FC58  C3        .db $C3
  $FC59  C4 C5     CPY $C5
  $FC5B  C6 C6     DEC $C6
  $FC5D  00        BRK
  $FC5E  0F        .db $0F
  $FC5F  02        .db $02
  $FC60  65 62     ADC $62
  $FC62  62        .db $62
  $FC63  61 61     ADC ($61,X)
  $FC65  60        RTS
  $FC66  63        .db $63
  $FC67  64        .db $64
  $FC68  63        .db $63
  $FC69  64        .db $64
  $FC6A  63        .db $63
  $FC6B  64        .db $64
  $FC6C  63        .db $63
  $FC6D  64        .db $64
  $FC6E  63        .db $63
  $FC6F  60        RTS
  $FC70  03        .db $03
  $FC71  06 60     ASL $60
  $FC73  66 67     ROR $67
  $FC75  67        .db $67
  $FC76  0D 02 63  ORA $6302
  $FC79  64        .db $64
  $FC7A  63        .db $63
  $FC7B  68        PLA
  $FC7C  69 6A     ADC #$6A
  $FC7E  6B        .db $6B
  $FC7F  6C 6D 6B  JMP ($6B6D)
  $FC82  6A        ROR
  $FC83  69 68     ADC #$68
  $FC85  62        .db $62
  $FC86  01 12     ORA ($12,X)
  $FC88  62        .db $62
  $FC89  62        .db $62
  $FC8A  09 05     ORA #$05
  $FC8C  7C        .db $7C
  $FC8D  6E 6F 70  ROR $706F
  $FC90  71 72     ADC ($72),Y
  $FC92  73        .db $73
  $FC93  74        .db $74
  $FC94  75 70     ADC $70,X
  $FC96  01 06     ORA ($06,X)
  $FC98  7C        .db $7C
  $FC99  7B        .db $7B
  $FC9A  01 10     ORA ($10,X)
  $FC9C  76 76     ROR $76,X
  $FC9E  01 7E     ORA ($7E,X)
  $FCA0  77        .db $77
  $FCA1  77        .db $77
  $FCA2  03        .db $03
  $FCA3  05 78     ORA $78
  $FCA5  7A        .db $7A
  $FCA6  79 7A 01  ADC $017A,Y
  $FCA9  24 7C     BIT $7C
  $FCAB  7C        .db $7C
  $FCAC  07        .db $07
  $FCAD  06 84     ASL $84
  $FCAF  7D 7E 7F  ADC $7F7E,X
  $FCB2  80        .db $80
  $FCB3  81 82     STA ($82,X)
  $FCB5  7F        .db $7F
  $FCB6  02        .db $02
  $FCB7  10 7D     BPL $FD36
  $FCB9  83        .db $83
  $FCBA  83        .db $83
  $FCBB  01 08     ORA ($08,X)
  $FCBD  86 87     STX $87
  $FCBF  00        BRK
  $FCC0  00        BRK
  $FCC1  84 01     STY $01
  $FCC3  12        .db $12
  $FCC4  85 85     STA $85
  $FCC6  08        PHP
  $FCC7  06 88     ASL $88
  $FCC9  89        .db $89
  $FCCA  8A        TXA
  $FCCB  8B        .db $8B
  $FCCC  8C 8D 8E  STY $8E8D
  $FCCF  8F        .db $8F
  $FCD0  90 05     BCC $FCD7
  $FCD2  08        PHP
  $FCD3  91 91     STA ($91),Y
  $FCD5  91 91     STA ($91),Y

L_FCD7:
  $FCD7  92        .db $92
  $FCD8  93        .db $93
  $FCD9  01 08     ORA ($08,X)

L_FCDB:
  $FCDB  91 96     STA ($96),Y
  $FCDD  05 05     ORA $05
  $FCDF  94 95     STY $95,X
  $FCE1  94 97     STY $97,X
  $FCE3  98        TYA
  $FCE4  97        .db $97
  $FCE5  05 08     ORA $08
  $FCE7  9C        .db $9C
  $FCE8  99 99 99  STA $9999,Y
  $FCEB  9A        TXS
  $FCEC  9B        .db $9B
  $FCED  03        .db $03
  $FCEE  06 9F     ASL $9F
  $FCF0  A0 A1     LDY #$A1
  $FCF2  A0 02     LDY #$02
  $FCF4  08        PHP
  $FCF5  9C        .db $9C

L_FCF6:
  $FCF6  9D 9E 0F  STA $0F9E,X
  $FCF9  03        .db $03
  $FCFA  A5 A2     LDA $A2
  $FCFC  A3        .db $A3
  $FCFD  A4 A3     LDY $A3
  $FCFF  A4 A2     LDY $A2
  $FD01  A3        .db $A3
  $FD02  A4 A3     LDY $A3
  $FD04  A4 A2     LDY $A2
  $FD06  A3        .db $A3
  $FD07  A4 A3     LDY $A3
  $FD09  A2 03     LDX #$03
  $FD0B  03        .db $03
  $FD0C  A6 A3     LDX $A3
  $FD0E  A4 A3     LDY $A3
  $FD10  00        BRK
  $FD11  00        BRK
  $FD12  A5 03     LDA $03
  $FD14  08        PHP
  $FD15  AA        TAX
  $FD16  A7        .db $A7
  $FD17  A8        TAY
  $FD18  A9 03     LDA #$03
  $FD1A  06 AD     ASL $AD
  $FD1C  AE AF AE  LDX $AEAF
  $FD1F  02        .db $02
  $FD20  06 AA     ASL $AA
  $FD22  AB        .db $AB
  $FD23  AC 0B 06  LDY $060B
  $FD26  B4 B3     LDY $B3,X
  $FD28  B0 B1     BCS $FCDB
  $FD2A  B2        .db $B2
  $FD2B  B1 B2     LDA ($B2),Y
  $FD2D  B1 B2     LDA ($B2),Y
  $FD2F  B1 B2     LDA ($B2),Y
  $FD31  B0 01     BCS $FD34
  $FD33  06 B1     ASL $B1
  $FD35  B2        .db $B2

L_FD36:
  $FD36  04        .db $04
  $FD37  06 B0     ASL $B0
  $FD39  B3        .db $B3
  $FD3A  B4 B3     LDY $B3,X
  $FD3C  B0 03     BCS $FD41
  $FD3E  08        PHP
  $FD3F  B0 B5     BCS $FCF6

L_FD41:
  $FD41  B6 B0     LDX $B0,Y
  $FD43  01 18     ORA ($18,X)
  $FD45  B7        .db $B7
  $FD46  B8        CLV
  $FD47  01 08     ORA ($08,X)
  $FD49  B9 BA 01  LDA $01BA,Y
  $FD4C  02        .db $02
  $FD4D  BC BD 01  LDY $01BD,X
  $FD50  04        .db $04
  $FD51  BE BF 02  LDX $02BF,Y
  $FD54  06 C0     ASL $C0
  $FD56  C1 C2     CMP ($C2,X)
  $FD58  01 04     ORA ($04,X)
  $FD5A  C7        .db $C7
  $FD5B  C8        INY
  $FD5C  03        .db $03
  $FD5D  1C        .db $1C
  $FD5E  C9 CA     CMP #$CA
  $FD60  CB        .db $CB
  $FD61  CC 01 05  CPY $0501
  $FD64  CC CD 00  CPY $00CD
  $FD67  00        BRK
  $FD68  BB        .db $BB
  $FD69  01 06     ORA ($06,X)
  $FD6B  CE CF 00  DEC $00CF
  $FD6E  00        BRK
  $FD6F  D0 01     BNE $FD72
  $FD71  0C        .db $0C

L_FD72:
  $FD72  D2        .db $D2
  $FD73  D1 01     CMP ($01),Y
  $FD75  08        PHP
  $FD76  D3        .db $D3
  $FD77  D4        .db $D4
  $FD78  07        .db $07
  $FD79  02        .db $02
  $FD7A  45 45     EOR $45
  $FD7C  46 46     LSR $46
  $FD7E  45 47     EOR $47
  $FD80  45 48     EOR $48
  $FD82  07        .db $07
  $FD83  02        .db $02
  $FD84  45 45     EOR $45
  $FD86  46 46     LSR $46
  $FD88  45 47     EOR $47
  $FD8A  45 48     EOR $48
  $FD8C  01 05     ORA ($05,X)
  $FD8E  39 3A 04  AND $043A,Y
  $FD91  02        .db $02
  $FD92  79 7A 7B  ADC $7B7A,Y
  $FD95  7C        .db $7C
  $FD96  00        BRK
  $FD97  01 06     ORA ($06,X)
  $FD99  69 6A     ADC #$6A
  $FD9B  05 05     ORA $05
  $FD9D  61 62     ADC ($62,X)
  $FD9F  61 63     ADC ($63,X)
  $FDA1  64        .db $64
  $FDA2  63        .db $63
  $FDA3  00        BRK
  $FDA4  00        BRK
  $FDA5  7D 0C 06  ADC $060C,X
  $FDA8  3E 3F 3E  ROL $3E3F,X
  $FDAB  3F        .db $3F
  $FDAC  3E 3F 3E  ROL $3E3F,X
  $FDAF  40        RTI
  $FDB0  3E 41 42  ROL $4241,X
  $FDB3  42        .db $42
  $FDB4  41 01     EOR ($01,X)
  $FDB6  02        .db $02
  $FDB7  44        .db $44
  $FDB8  43        .db $43
  $FDB9  01 04     ORA ($04,X)
  $FDBB  7E 7F 01  ROR $017F,X
  $FDBE  08        PHP
  $FDBF  80        .db $80
  $FDC0  81 04     STA ($04,X)
  $FDC2  08        PHP
  $FDC3  82        .db $82
  $FDC4  83        .db $83
  $FDC5  82        .db $82
  $FDC6  83        .db $83
  $FDC7  82        .db $82
  $FDC8  01 06     ORA ($06,X)
  $FDCA  84 85     STY $85
  $FDCC  00        BRK
  $FDCD  00        BRK
  $FDCE  86 00     STX $00
  $FDD0  00        BRK
  $FDD1  87        .db $87
  $FDD2  08        PHP
  $FDD3  04        .db $04
  $FDD4  2C 2C 2D  BIT $2D2C
  $FDD7  2E 2F 30  ROL $302F
  $FDDA  31 32     AND ($32),Y
  $FDDC  30 03     BMI $FDE1
  $FDDE  04        .db $04
  $FDDF  3B        .db $3B
  $FDE0  3C        .db $3C

L_FDE1:
  $FDE1  3D 3C 00  AND $003C,X
  $FDE4  00        BRK
  $FDE5  88        DEY
  $FDE6  08        PHP
  $FDE7  06 89     ASL $89
  $FDE9  8A        TXA
  $FDEA  89        .db $89
  $FDEB  8B        .db $8B
  $FDEC  8C 89 8B  STY $8B89
  $FDEF  8C 89 06  STY $0689
  $FDF2  04        .db $04
  $FDF3  8D 8E 8D  STA $8D8E
  $FDF6  8E 8D 8E  STX $8E8D
  $FDF9  8D 01 04  STA $0401
  $FDFC  8F        .db $8F
  $FDFD  90 03     BCC $FE02
  $FDFF  00        BRK
  $FE00  91 92     STA ($92),Y

L_FE02:
  $FE02  93        .db $93
  $FE03  93        .db $93
  $FE04  09 0A     ORA #$0A
  $FE06  22        .db $22
  $FE07  20 20 1F  JSR $1F20
  $FE0A  1E 1D 1E  ASL $1E1D,X
  $FE0D  1F        .db $1F
  $FE0E  21 22     AND ($22,X)
  $FE10  03        .db $03
  $FE11  04        .db $04
  $FE12  01 02     ORA ($02,X)
  $FE14  03        .db $03
  $FE15  02        .db $02
  $FE16  05 06     ORA $06
  $FE18  04        .db $04
  $FE19  05 06     ORA $06
  $FE1B  07        .db $07
  $FE1C  08        PHP
  $FE1D  09 05     ORA #$05
  $FE1F  06 71     ASL $71
  $FE21  72        .db $72
  $FE22  71 74     ADC ($74),Y
  $FE24  73        .db $73
  $FE25  73        .db $73
  $FE26  01 04     ORA ($04,X)
  $FE28  75 76     ADC $76,X
  $FE2A  01 06     ORA ($06,X)
  $FE2C  13        .db $13
  $FE2D  14        .db $14
  $FE2E  01 08     ORA ($08,X)
  $FE30  11 12     ORA ($12),Y
  $FE32  0B        .db $0B
  $FE33  04        .db $04
  $FE34  0D 0E 0F  ORA $0F0E
  $FE37  0D 0E 0F  ORA $0F0E
  $FE3A  0D 0E 0F  ORA $0F0E
  $FE3D  10 0F     BPL $FE4E
  $FE3F  10 00     BPL $FE41

L_FE41:
  $FE41  00        BRK
  $FE42  94 00     STY $00,X
  $FE44  00        BRK
  $FE45  65 0F     ADC $0F
  $FE47  06 6B     ASL $6B
  $FE49  6C 6B 6D  JMP ($6D6B)
  $FE4C  6B        .db $6B
  $FE4D  6C 6B 6D  JMP ($6D6B)
  $FE50  6E 6C 6B  ROR $6B6C
  $FE53  6D 6D 6F  ADC $6F6D
  $FE56  66 66     ROR $66
  $FE58  00        BRK
  $FE59  00        BRK
  $FE5A  70 05     BVS $FE61
  $FE5C  06 5D     ASL $5D
  $FE5E  5E 5E 5F  LSR $5F5E,X

L_FE61:
  $FE61  60        RTS
  $FE62  5F        .db $5F
  $FE63  00        BRK
  $FE64  00        BRK
  $FE65  95 10     STA $10,X
  $FE67  03        .db $03
  $FE68  29 2A     AND #$2A
  $FE6A  2B        .db $2B
  $FE6B  2A        ROL
  $FE6C  2B        .db $2B
  $FE6D  2A        ROL
  $FE6E  2B        .db $2B
  $FE6F  2A        ROL
  $FE70  2B        .db $2B
  $FE71  2A        ROL
  $FE72  2B        .db $2B
  $FE73  2A        ROL
  $FE74  2B        .db $2B
  $FE75  2A        ROL
  $FE76  2B        .db $2B
  $FE77  2A        ROL
  $FE78  2B        .db $2B
  $FE79  03        .db $03
  $FE7A  04        .db $04
  $FE7B  15 16     ORA $16,X
  $FE7D  15 17     ORA $17,X
  $FE7F  00        BRK
  $FE80  00        BRK
  $FE81  18        CLC
  $FE82  00        BRK
  $FE83  00        BRK
  $FE84  19 01 04  ORA $0401,Y
  $FE87  1B        .db $1B
  $FE88  1C        .db $1C
  $FE89  04        .db $04
  $FE8A  08        PHP
  $FE8B  23        .db $23
  $FE8C  24 23     BIT $23
  $FE8E  25 25     AND $25
  $FE90  01 03     ORA ($03,X)
  $FE92  27        .db $27
  $FE93  28        PLP
  $FE94  00        BRK
  $FE95  00        BRK
  $FE96  26 01     ROL $01
  $FE98  08        PHP
  $FE99  96 97     STX $97,Y
  $FE9B  00        BRK
  $FE9C  00        BRK
  $FE9D  98        TYA
  $FE9E  02        .db $02
  $FE9F  08        PHP
  $FEA0  0A        ASL
  $FEA1  0B        .db $0B
  $FEA2  0C        .db $0C
  $FEA3  05 04     ORA $04
  $FEA5  99 9A 9B  STA $9B9A,Y
  $FEA8  9C        .db $9C
  $FEA9  9D 9A 02  STA $029A,X
  $FEAC  0A        ASL
  $FEAD  49 4A     EOR #$4A
  $FEAF  4B        .db $4B
  $FEB0  02        .db $02
  $FEB1  0A        ASL
  $FEB2  4C 4D 4E  JMP $4E4D
  $FEB5  0A        ASL
  $FEB6  04        .db $04
  $FEB7  57        .db $57
  $FEB8  58        CLI
  $FEB9  59 5A 5B  EOR $5B5A,Y
  $FEBC  5C        .db $5C
  $FEBD  5B        .db $5B
  $FEBE  5A        .db $5A
  $FEBF  59 58 57  EOR $5758,Y
  $FEC2  03        .db $03
  $FEC3  08        PHP
  $FEC4  52        .db $52
  $FEC5  53        .db $53
  $FEC6  54        .db $54
  $FEC7  53        .db $53
  $FEC8  01 04     ORA ($04,X)
  $FECA  55 56     EOR $56,X
  $FECC  00        BRK
  $FECD  00        BRK
  $FECE  9E        .db $9E
  $FECF  0F        .db $0F
  $FED0  02        .db $02
  $FED1  9F        .db $9F
  $FED2  9F        .db $9F
  $FED3  A0 A0     LDY #$A0
  $FED5  A2 A2     LDX #$A2
  $FED7  A1 A1     LDA ($A1,X)
  $FED9  A3        .db $A3
  $FEDA  A3        .db $A3
  $FEDB  A1 79     LDA ($79,X)
  $FEDD  7A        .db $7A
  $FEDE  7B        .db $7B
  $FEDF  7C        .db $7C
  $FEE0  00        BRK
  $FEE1  05 06     ORA $06
  $FEE3  A4 A5     LDY $A5
  $FEE5  A6 A7     LDX $A7
  $FEE7  A8        TAY
  $FEE8  A5 02     LDA $02
  $FEEA  04        .db $04
  $FEEB  B4 B5     LDY $B5,X
  $FEED  B6 03     LDX $03,Y
  $FEEF  03        .db $03
  $FEF0  B7        .db $B7
  $FEF1  B8        CLV
  $FEF2  B9 BA 02  LDA $02BA,Y
  $FEF5  04        .db $04
  $FEF6  BB        .db $BB
  $FEF7  BC BD 01  LDY $01BD,X
  $FEFA  04        .db $04
  $FEFB  BE BF 01  LDX $01BF,Y
  $FEFE  03        .db $03
  $FEFF  C0 C1     CPY #$C1
  $FF01  02        .db $02
  $FF02  01 C2     ORA ($C2,X)
  $FF04  C3        .db $C3
  $FF05  C4 06     CPY $06
  $FF07  04        .db $04
  $FF08  C5 C6     CMP $C6
  $FF0A  C7        .db $C7
  $FF0B  C8        INY
  $FF0C  C7        .db $C7
  $FF0D  04        .db $04
  $FF0E  00        BRK
  $FF0F  79 7A 7B  ADC $7B7A,Y
  $FF12  7C        .db $7C
  $FF13  00        BRK
  $FF14  03        .db $03
  $FF15  01 79     ORA ($79,X)
  $FF17  7A        .db $7A
  $FF18  7B        .db $7B
  $FF19  7C        .db $7C
  $FF1A  03        .db $03
  $FF1B  03        .db $03
  $FF1C  C9 CA     CMP #$CA
  $FF1E  CB        .db $CB
  $FF1F  CC 04 02  CPY $0204
  $FF22  CD CE CF  CMP $CFCE
  $FF25  D0 D1     BNE $FEF8
  $FF27  00        BRK
  $FF28  00        BRK
  $FF29  D2        .db $D2
  $FF2A  01 02     ORA ($02,X)
  $FF2C  D3        .db $D3
  $FF2D  D4        .db $D4
  $FF2E  01 05     ORA ($05,X)
  $FF30  D6 D5     DEC $D5,X
  $FF32  01 03     ORA ($03,X)
  $FF34  D7        .db $D7
  $FF35  D8        CLD
  $FF36  00        BRK
  $FF37  00        BRK
  $FF38  D9 06 04  CMP $0406,Y
  $FF3B  33        .db $33
  $FF3C  34        .db $34
  $FF3D  35 36     AND $36,X
  $FF3F  37        .db $37
  $FF40  38        SEC
  $FF41  37        .db $37
  $FF42  01 02     ORA ($02,X)
  $FF44  7A        .db $7A
  $FF45  79 00 00  ADC $0000,Y
  $FF48  68        PLA
  $FF49  06 04     ASL $04
  $FF4B  4F        .db $4F
  $FF4C  50 51     BVC $FF9F
  $FF4E  DA        .db $DA
  $FF4F  DA        .db $DA
  $FF50  DB        .db $DB
  $FF51  DA        .db $DA
  $FF52  00        BRK
  $FF53  00        BRK
  $FF54  DC        .db $DC
  $FF55  01 04     ORA ($04,X)
  $FF57  DD DE 01  CMP $01DE,X
  $FF5A  08        PHP
  $FF5B  77        .db $77
  $FF5C  78        SEI
  $FF5D  07        .db $07
  $FF5E  04        .db $04
  $FF5F  DF        .db $DF
  $FF60  E0 DF     CPX #$DF
  $FF62  E1 E2     SBC ($E2,X)
  $FF64  E2        .db $E2
  $FF65  E3        .db $E3
  $FF66  E1 03     SBC ($03,X)
  $FF68  05 E6     ORA $E6
  $FF6A  E4 E5     CPX $E5
  $FF6C  00        BRK
  $FF6D  01 04     ORA ($04,X)
  $FF6F  A9 AA     LDA #$AA
  $FF71  01 04     ORA ($04,X)
  $FF73  AB        .db $AB
  $FF74  AC 01 04  LDY $0401
  $FF77  AD AE 01  LDA $01AE
  $FF7A  04        .db $04
  $FF7B  AF        .db $AF
  $FF7C  B0 01     BCS $FF7F
  $FF7E  04        .db $04

L_FF7F:
  $FF7F  B1 B2     LDA ($B2),Y
  $FF81  00        BRK
  $FF82  00        BRK
  $FF83  B3        .db $B3
  $FF84  00        BRK
  $FF85  00        BRK
  $FF86  67        .db $67
  $FF87  FF        .db $FF
  $FF88  FF        .db $FF
  $FF89  FF        .db $FF
  $FF8A  FF        .db $FF
  $FF8B  FF        .db $FF
  $FF8C  FF        .db $FF
  $FF8D  FF        .db $FF
  $FF8E  FF        .db $FF
  $FF8F  FF        .db $FF
  $FF90  FF        .db $FF
  $FF91  FF        .db $FF
  $FF92  FF        .db $FF
  $FF93  FF        .db $FF
  $FF94  FF        .db $FF
  $FF95  FF        .db $FF
  $FF96  FF        .db $FF
  $FF97  FF        .db $FF
  $FF98  FF        .db $FF
  $FF99  FF        .db $FF
  $FF9A  FF        .db $FF
  $FF9B  FF        .db $FF
  $FF9C  FF        .db $FF
  $FF9D  FF        .db $FF
  $FF9E  FF        .db $FF

L_FF9F:
  $FF9F  FF        .db $FF
  $FFA0  FF        .db $FF
  $FFA1  FF        .db $FF
  $FFA2  FF        .db $FF
  $FFA3  FF        .db $FF
  $FFA4  FF        .db $FF
  $FFA5  FF        .db $FF
  $FFA6  FF        .db $FF
  $FFA7  FF        .db $FF
  $FFA8  FF        .db $FF
  $FFA9  FF        .db $FF
  $FFAA  FF        .db $FF
  $FFAB  FF        .db $FF
  $FFAC  FF        .db $FF
  $FFAD  FF        .db $FF
  $FFAE  FF        .db $FF
  $FFAF  FF        .db $FF
  $FFB0  FF        .db $FF
  $FFB1  FF        .db $FF
  $FFB2  FF        .db $FF
  $FFB3  FF        .db $FF
  $FFB4  FF        .db $FF
  $FFB5  FF        .db $FF
  $FFB6  FF        .db $FF
  $FFB7  FF        .db $FF
  $FFB8  FF        .db $FF
  $FFB9  FF        .db $FF
  $FFBA  FF        .db $FF
  $FFBB  FF        .db $FF
  $FFBC  FF        .db $FF
  $FFBD  FF        .db $FF
  $FFBE  FF        .db $FF
  $FFBF  FF        .db $FF
  $FFC0  FF        .db $FF
  $FFC1  FF        .db $FF
  $FFC2  FF        .db $FF
  $FFC3  FF        .db $FF
  $FFC4  FF        .db $FF
  $FFC5  FF        .db $FF
  $FFC6  FF        .db $FF
  $FFC7  FF        .db $FF
  $FFC8  FF        .db $FF
  $FFC9  FF        .db $FF
  $FFCA  FF        .db $FF
  $FFCB  FF        .db $FF
  $FFCC  FF        .db $FF
  $FFCD  FF        .db $FF
  $FFCE  FF        .db $FF
  $FFCF  FF        .db $FF
  $FFD0  FF        .db $FF
  $FFD1  FF        .db $FF
  $FFD2  FF        .db $FF
  $FFD3  FF        .db $FF
  $FFD4  FF        .db $FF
  $FFD5  FF        .db $FF
  $FFD6  FF        .db $FF
  $FFD7  FF        .db $FF
  $FFD8  FF        .db $FF
  $FFD9  FF        .db $FF
  $FFDA  FF        .db $FF
  $FFDB  FF        .db $FF
  $FFDC  FF        .db $FF
  $FFDD  FF        .db $FF
  $FFDE  FF        .db $FF
  $FFDF  FF        .db $FF
  $FFE0  78        SEI
  $FFE1  EE E1 FF  INC $FFE1
  $FFE4  4C D1 F2  JMP $F2D1
  $FFE7  FF        .db $FF
  $FFE8  FF        .db $FF
  $FFE9  FF        .db $FF
  $FFEA  FF        .db $FF
  $FFEB  FF        .db $FF
  $FFEC  FF        .db $FF
  $FFED  FF        .db $FF
  $FFEE  FF        .db $FF
  $FFEF  FF        .db $FF
  $FFF0  78        SEI
  $FFF1  E9 00     SBC #$00
  $FFF3  00        BRK
  $FFF4  48        PHA
  $FFF5  04        .db $04
  $FFF6  00        BRK
  $FFF7  00        BRK
  $FFF8  08        PHP
  $FFF9  AC F0 CF  LDY $CFF0
  $FFFC  E0 FF     CPX #$FF
  $FFFE  E0 FF     CPX #$FF