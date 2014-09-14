CROSS_PREFIX= arm-none-eabi-

AS = $(CROSS_PREFIX)as
CC = $(CROSS_PREFIX)gcc
LD = $(CROSS_PREFIX)ld
OBJCOPY = $(CROSS_PREFIX)objcopy
OBJDUMP = $(CROSS_PREFIX)objdump
#MKIMAGE = /home/zhang/research/imx53/u-boot/tools/mkimage
MKIMAGE = mkimage


CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -march=armv7-a
ASFLAGS = -Wall -march=armv7-a 

all : kernel.img

entry.o : entry.S
	$(AS) entry.S -o entry.o

main.o : main.c 
	$(CC) $(CFLAGS) -c main.c -o main.o

kernel.img : kernel.ld entry.o main.o 
	$(LD) entry.o main.o -T kernel.ld -o kernel.elf
	$(OBJDUMP) -D kernel.elf > kernel.asm
	$(OBJCOPY) kernel.elf -O binary kernel.img
	$(MKIMAGE) -n imximage.cfg -T imximage -e 0x97800000 -d kernel.img kernel.imx

clean :
	rm -f *.o *.elf *.asm *.img *.imx 
