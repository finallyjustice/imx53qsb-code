#include "config.h"

// set the iomuxc policy to enable serial port I/O
void early_iomuxc_init(void)
{
	void *iomuxc_base = (void *)IOMUXC_BASE_ADDR;
	unsigned long long v1 = 0x0803d828784180ec;
	unsigned long long v2 = 0x0003d820004140e8;

	unsigned int mux_ctrl_ofs = (v1 & MUX_CTRL_OFS_MASK) >> MUX_CTRL_OFS_SHIFT;
	unsigned int mux_mode = (v1 & MUX_MODE_MASK) >> MUX_MODE_SHIFT;
	(*(volatile unsigned int *)(iomuxc_base + mux_ctrl_ofs) = (mux_mode));

	mux_ctrl_ofs = (v2 & MUX_CTRL_OFS_MASK) >> MUX_CTRL_OFS_SHIFT;
	mux_mode = (v2 & MUX_MODE_MASK) >> MUX_MODE_SHIFT;
	(*(volatile unsigned int *)(iomuxc_base + mux_ctrl_ofs) = (mux_mode));
}

// set frequency for serial
void early_mxc_serial_setbrg(void)
{
	__REG(UART_PHYS + UFCR) = 4 << 7; 
	__REG(UART_PHYS + UBIR) = 0xf;
	__REG(UART_PHYS + UBMR) = 289;
}

void early_mxc_serial_putc(const char c)
{
	__REG(UART_PHYS + UTXD) = c;

	while(!(__REG(UART_PHYS + UTS) & UTS_TXEMPTY))
		;

	if(c == '\n')
		early_mxc_serial_putc('\r');
}

void early_mxc_serial_init(void)
{
	__REG(UART_PHYS + UCR1) = 0x0;
	__REG(UART_PHYS + UCR2) = 0x0;

	while(!(__REG(UART_PHYS + UCR2) & UCR2_SRST))
		;

	__REG(UART_PHYS + UCR3) = 0x0704 | UCR3_ADNIMP;
	__REG(UART_PHYS + UCR4) = 0x8000;
	__REG(UART_PHYS + UESC) = 0x002b;
	__REG(UART_PHYS + UTIM) = 0x0;

	__REG(UART_PHYS + UTS) = 0x0;

	early_mxc_serial_setbrg();

	__REG(UART_PHYS + UCR2) = UCR2_WS | UCR2_IRTS | UCR2_RXEN | UCR2_TXEN | UCR2_SRST;

	__REG(UART_PHYS + UCR1) = UCR1_UARTEN;

	return;
}
