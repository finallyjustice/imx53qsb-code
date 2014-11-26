#include "mxc_serial.h"

void swi_handler()
{
	cprintf("In Secure World's SWI Handler\n");
}


void bootmain(void)
{
	iomuxc_init();
	mxc_serial_init();

	cprintf("Hello World %d\n", 4567);
	asm volatile("swi #7");
	cprintf("back from swi handler %d\n", 4567);
	
	cprintf("Hello World %d\n", 4567);
	asm volatile("swi #0");
	cprintf("back from swi handler %d\n", 4567);

}

