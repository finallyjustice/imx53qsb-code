#include "mxc_serial.h"

void bootmain(void)
{
	iomuxc_init();
	mxc_serial_init();

	cprintf("Test TrustZone NS-bit\n");

	int scr_val = 1;

	__asm__ volatile(
			"mrc p15, 0, r0, c1, c1, 0\n\t"
			"mov %0, r0\n\t"
			: "=r"(scr_val)
			: 
			: "r0"
	);

	if(scr_val & 0x1)
		cprintf("TrustZone NS Bit is 1 - Normal\n");
	else
		cprintf("TrustZone NS Bit is 0 - Secure\n");

	cprintf("SCR Reg: 0x%x\n", scr_val);

	cprintf("Begin Set TrustZone NS Bit to 1\n");
	
	__asm__ volatile(
			"mrc p15, 0, r0, c1, c1, 0\n\t"
			"mov r1, r0\n\t"
			"add r0, r1, #1\n\t"
			"mcr p15, 0, r0, c1, c1, 0\n\t"
			: 
			: 
			: "r0","r1"
	);

	cprintf("End Set TrustZone NS Bit to 1\n");
	
	/*scr_val = 0;

	__asm__ volatile(
			"mrc p15, 0, r0, c1, c1, 0\n\t"
			"mov %0, r0\n\t"
			: "=r"(scr_val)
			: 
			: "r0"
	);

	cprintf("Read TrustZone NS Bit\n");

	if(scr_val & 0x1)
		cprintf("TrustZone NS Bit is 1\n");
	else
		cprintf("TrustZone NS Bit is 0\n");*/

	return;
}
