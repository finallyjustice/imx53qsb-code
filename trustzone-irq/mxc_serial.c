#include "config.h"

// set the iomuxc policy to enable serial port I/O
void iomuxc_init(void)
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
void mxc_serial_setbrg(void)
{
	__REG(UART_PHYS + UFCR) = 4 << 7; 
	__REG(UART_PHYS + UBIR) = 0xf;
	__REG(UART_PHYS + UBMR) = 289;
}

void mxc_serial_putc(const char c)
{
	__REG(UART_PHYS + UTXD) = c;

	while(!(__REG(UART_PHYS + UTS) & UTS_TXEMPTY))
		;

	if(c == '\n')
		mxc_serial_putc('\r');
}

void mxc_serial_init(void)
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

	mxc_serial_setbrg();

	__REG(UART_PHYS + UCR2) = UCR2_WS | UCR2_IRTS | UCR2_RXEN | UCR2_TXEN | UCR2_SRST;

	__REG(UART_PHYS + UCR1) = UCR1_UARTEN;

	return;
}

static void printint(int xx, int base, int sign)
{
	static char digits[] = "0123456789abcdef";
	char buf[16];
	int i;
	unsigned int x;

	if(sign && (sign = xx < 0))
		x = -xx;
	else
		x = xx;

	i = 0;
	do{
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);

	if(sign)
		buf[i++] = '-';

	while(--i >= 0)
		mxc_serial_putc(buf[i]);
}

void cprintf(char *fmt, ...)
{
	int i, c;
	unsigned int *argp;
	char *s;

	argp = (unsigned int*)(void*)(&fmt + 1);
	for(i = 0; (c = fmt[i] & 0xff) != 0; i++)
	{
		if(c != '%')
		{
			mxc_serial_putc(c);
			continue;
		}
		c = fmt[++i] & 0xff;
		if(c == 0)
			break;
		switch(c)
		{
		case 'd':
			printint(*argp++, 10, 1);
			break;
		case 'x':
		case 'p':
			printint(*argp++, 16, 0);
			break;
		case 's':
			if((s = (char*)*argp++) == 0)
				s = "(null)";
			for(; *s; s++)
				mxc_serial_putc(*s);
			break;
		case '%':
			mxc_serial_putc('%');
			break;
		default:
			// Print unknown % sequence to draw attention.
			mxc_serial_putc('%');
			mxc_serial_putc(c);
			break;
		}
	}
}
