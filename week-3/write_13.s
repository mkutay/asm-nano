.equ SREG, 0x3f ; status register is given in the data sheet, p11

.equ PORTB, 0x05
.equ DDRB, 0x04

.org 0

main: 
  ldi r16, 0
  out SREG, r16 ; clear SREG

  ldi r16, 0x0F
  out DDRB, r16

  ldi r16, 0x0D
  out PORTB, r16


mainloop:
  rjmp mainloop
