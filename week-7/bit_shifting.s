.equ SREG, 0x3f ; status register is given in the data sheet, p11

.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PORTD, 0x0b
.equ DDRD, 0x0a

.org 0

main: 
  ldi r16, 0
  out SREG, r16 ; clear SREG

  ldi r16, 0x0f
  out DDRB, r16
  ldi r16, 0xf0
  out DDRD, r16

  ldi r16, 0x05
  lsl r16
  out PORTB, r16
  ldi r16, 0x50
  lsl r16
  out PORTD, r16

  ldi r18, 50
  rcall delay

  ldi r16, 0x05
  out PORTB, r16
  ldi r16, 0x50
  out PORTD, r16

  ldi r18, 50
  rcall delay

  rjmp main

mainloop:
  rjmp mainloop

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

