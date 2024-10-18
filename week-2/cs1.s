; https://dumblebots.com/2022/07/31/programming-arduino-and-avr-microcontrollers-using-the-assembly-language/

.equ SREG,0x3f ; define SREG label (variable) as 0x3f = 63
.org 0 ; establish the start address as 0 - the first address
main:
  ldi r16,0 ; load data to register (on the CPU) r16, zero
  out SREG,r16 ; copy contents of r16 to SREG
mainloop:
  rjmp mainloop ; jump to mainloop address
