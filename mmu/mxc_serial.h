#ifndef __MXC_SERIAL_H__
#define __MXC_SERIAL_H__

void early_iomuxc_init(void);
void early_mxc_serial_setbrg(void);
void early_mxc_serial_putc(const char c);
void early_mxc_serial_init(void);

void mxc_serial_putc(const char c);
void printint(int xx, int base, int sign);
void cprintf(char *fmt, ...);

#endif
