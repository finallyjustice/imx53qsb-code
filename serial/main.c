#include "mxc_serial.h"

void bootmain(void)
{
	iomuxc_init();
	mxc_serial_init();

	cprintf("Hello World %d\n", 4567);
}
