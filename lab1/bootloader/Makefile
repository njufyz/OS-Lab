bootloader.bin: start.S boot.c boot.h helper.h
	gcc -c -m32 start.S -o start.o
	gcc -c -m32 -O1 -fno-stack-protector boot.c -o boot.o
	ld -m elf_i386 -e start -Ttext 0x7c00 start.o boot.o -o bootloader.elf
	objcopy -S -j .text -O binary bootloader.elf bootloader.bin
	../utils/genboot.pl bootloader.bin

clean:
	rm -rf *.o *.elf *.bin
