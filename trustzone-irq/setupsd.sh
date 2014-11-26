# export ARCH=arm 
# export CROSS_COMPILE=arm-none-eabi-

dd if=kernel.imx of=/dev/mmcblk0 bs=512 seek=2
