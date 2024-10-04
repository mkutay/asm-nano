# 1 "test.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.S"
; https:

# 1 "/usr/lib/avr/include/avr/io.h" 1 3
# 99 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/sfr_defs.h" 1 3
# 100 "/usr/lib/avr/include/avr/io.h" 2 3
# 272 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/iom328p.h" 1 3
# 273 "/usr/lib/avr/include/avr/io.h" 2 3
# 627 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/portpins.h" 1 3
# 628 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/common.h" 1 3
# 630 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/version.h" 1 3
# 632 "/usr/lib/avr/include/avr/io.h" 2 3






# 1 "/usr/lib/avr/include/avr/fuse.h" 1 3
# 639 "/usr/lib/avr/include/avr/io.h" 2 3


# 1 "/usr/lib/avr/include/avr/lock.h" 1 3
# 642 "/usr/lib/avr/include/avr/io.h" 2 3
# 4 "test.S" 2

.section .data

.section .bss

.section .text

.org 0 ; address from which to start placing instructions

LDI R16, (1<<5) ; LoaD Immediate, works only for registers 16-31, 5 = 5, 1 << 5 is just left shift-ing 1 five times, ie 0b00100000
LDI R17, (1<<5)

OUT ((((0x04) + 0x20)) - 0x20), R16

LOOP:
  OUT ((((0x05) + 0x20)) - 0x20), R16
  RCALL DELAY_1S
  EOR R16, R17 ; xor of the registers and stores the result in the first one
  RJMP LOOP

DELAY_1S:
  LDI R20, 64
  DELAY1:
    LDI R21, 250
    DELAY2:
      LDI R22, 250
      DELAY3:
        DEC R22
        NOP
        BRNE DELAY3

        DEC R21
        BRNE DELAY2

        DEC R20
        BRNE DELAY1

        RET
