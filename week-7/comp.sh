avr-as -g -mmcu=atmega328p -o temp.o $1.s
# avr-gcc -DF_CPU=16000000UL -mmcu=atmega328p -E $1.S -o $1.s
# avr-gcc -mmcu=atmega328p -nostdlib -g $1.s -o $1.o
avr-ld -o temp.elf temp.o
avr-objcopy -O ihex -R .eeprom temp.elf temp.hex

