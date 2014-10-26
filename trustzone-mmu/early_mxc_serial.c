#include "config.h"
#include "memlayout.h"

void early_mxc_serial_putc(const char c)
{
	__REG(UART_PHYS + UTXD) = c;

	while(!(__REG(UART_PHYS + UTS) & UTS_TXEMPTY))
		;

	if(c == '\n')
		early_mxc_serial_putc('\r');
}
