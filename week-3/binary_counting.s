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

increment:
  inc r16
  out PORTB, r16
  and r16, 0x0F
  rcall delay
  rjmp increment

mainloop:
  rjmp mainloop

delay:
  ldi r20, 16
  delay1:
    ldi r21, 250
    delay2:
      ldi r22, 250
      delay3:
        dec r22
        nop
        brne delay3

        dec r21
        brne delay2

        dec r20
        brne delay1

        ret
