#include "mxc_serial.h"
#include "config.h"
#include "memlayout.h"

void kmain(void)
{
	__REG(_P2V(UART_PHYS + UTXD)) = 'B';
	__REG(UART_PHYS + UTXD) = 'A';
	cprintf("Bless!!!! %d\n", 1000);

	cprintf("$$ Say hello in TrustZone ^^Normal^^ World!\n");
	// transit to Secure Monitor (Dst: Secure World)
	asm volatile("smc #0\n\t");
	cprintf("$$ Back from secure world!\n");
	
	asm volatile("smc #0\n\t");
	cprintf("Come back to life again!\n");

	while(1);
}
