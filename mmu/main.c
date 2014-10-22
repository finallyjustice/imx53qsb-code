#include "mxc_serial.h"
#include "config.h"
#include "memlayout.h"

void test_putc(const char c)
{
	__REG(_P2V(UART_PHYS + UTXD)) = c;

	while(!(__REG(_P2V(UART_PHYS + UTS)) & UTS_TXEMPTY))
		;

	if(c == '\n')
		test_putc('\r');
}

void kmain(void)
{
	//cprintf("Hello New Kernel!\n");
	test_putc('A');
	while(1);
}
