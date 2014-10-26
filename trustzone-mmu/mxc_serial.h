#ifndef __MXC_SERIAL_H__
#define __MXC_SERIAL_H__

void secure_iomuxc_init(void);
void secure_mxc_serial_setbrg(void);
void secure_mxc_serial_putc(const char c);
void secure_mxc_serial_init(void);

void mxc_serial_putc(const char c);
void printint(int xx, int base, int sign);
void cprintf(char *fmt, ...);

#endif
