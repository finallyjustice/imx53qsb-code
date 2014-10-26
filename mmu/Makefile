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
LDFLAGS = -L . -lgcc
#LDFLAGS = 

OBJS = \
	start.o \
	early_mxc_serial.o \
	main.o \
	mxc_serial.o 

all : kernel.img

entry.o : entry.S
	$(AS) entry.S -o entry.o

kernel.img : kernel.ld entry.o $(OBJS)
	$(LD) entry.o $(OBJS) -T kernel.ld -o kernel.elf $(LDFLAGS)
	$(OBJDUMP) -D kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym
	$(OBJCOPY) kernel.elf -O binary kernel.img
	#$(MKIMAGE) -n imximage.cfg -T imximage -e 0x97800000 -d kernel.img kernel.imx
	$(MKIMAGE) -n imximage.cfg -T imximage -e 0x80010000 -d kernel.img kernel.imx

clean :
	rm -f *.o *.elf *.asm *sym *.img *.imx 
