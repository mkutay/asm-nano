.org 0 ; address from which to start placing instructions

.equ SREG, 0x3f
.equ DDRB, 0x04
.equ PORTB, 0x05

ldi r17, 0x01

ldi r16, 0
out SREG, r16

ldi r16, 0x01
out DDRB, r16

main:
  out PORTB, r16

  ldi r18, 50
  rcall delay

  eor R16, R17 ; xor of the registers and stores the result in the first one

  rjmp main

delay_1s:
  ldi r20, 64 ; 1
  delay1:
    ldi r21, 249 ; 1
    delay2:
      ldi r22, 250 ; 1
      delay3:
        nop ; 1
        dec r22 ; 1
        brne delay3 ; 1 if false, 2 if true
      dec r21 ; 1
      brne delay2 ; 1 if false, 2 if true
    dec r20 ; 1
    brne delay1 ; 1 if false, 2 if true
  ret

delay:
  rcall delay_10ms ; 1
  dec r18 ; 1
  brne delay ; 1 if false, 2 if true
  ret

delay_10ms:
  ldi r20, 79 ; 1
  delay12:
    ldi r21, 2 ; 1
    delay22:
      ldi r22, 252 ; 1
      delay32:
        nop ; 1
        dec r22 ; 1
        brne delay32 ; 1 if false, 2 if true
      dec r21 ; 1
      brne delay22 ; 1 if false, 2 if true
    dec r20 ; 1
    brne delay12 ; 1 if false, 2 if true
  ret

; ((4*250 - 1 + 4) * 249 - 1 + 4) * 64 - 1 cycles