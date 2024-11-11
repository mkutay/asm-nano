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

  ldi r16, 0x0b
  out PORTB, r16

  ldi r16, 0xf0
  out DDRD, r16

  ldi r16, 0xd0
  out PORTD, r16

mainloop:
  rjmp mainloop
