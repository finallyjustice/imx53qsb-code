CROSS_PREFIX= arm-none-eabi-

AS = $(CROSS_PREFIX)as
CC = $(CROSS_PREFIX)gcc
LD = $(CROSS_PREFIX)ld
OBJCOPY = $(CROSS_PREFIX)objcopy
OBJDUMP = $(CROSS_PREFIX)objdump
#MKIMAGE = /home/zhang/research/imx53/u-boot/tools/mkimage
MKIMAGE = mkimage

#CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -march=armv7-a
CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -mcpu=cortex-a8
#ASFLAGS = -Wall -march=armv7-a 
ASFLAGS = -Wall -mcpu=cortex-a8
LDFLAGS = -L . -lgcc

OBJS = \
	secure_entry.o \
	secure_start.o \
	secure_mxc_serial.o \
	normal_entry.o \
	normal_start.o \
	early_mxc_serial.o \
	normal_main.o \
	mxc_serial.o

all : kernel.img

kernel.img : kernel.ld $(OBJS)
	$(LD) $(OBJS) -T kernel.ld -o kernel.elf $(LDFLAGS)
	$(OBJDUMP) -D kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym
	$(OBJCOPY) kernel.elf -O binary kernel.img
	$(MKIMAGE) -n imximage.cfg -T imximage -e 0x80010000 -d kernel.img kernel.imx

clean :
	rm -f *.o *.elf *.asm *.sym *.img *.imx 
