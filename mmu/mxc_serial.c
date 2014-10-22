#include "config.h"
#include "memlayout.h"

void mxc_serial_putc(const char c)
{
	__REG(_P2V(UART_PHYS + UTXD)) = c;

	while(!(__REG(_P2V(UART_PHYS + UTS)) & UTS_TXEMPTY))
		;

	if(c == '\n')
		mxc_serial_putc('\r');
}

void printint(int xx, int base, int sign)
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
