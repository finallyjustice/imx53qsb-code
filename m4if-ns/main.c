#include "mxc_serial.h"

#define R32   (volatile unsigned long *)
#define CSU_BASE_ADDR   0x63F9C000

// base address of secure data
#define SECURE_DATA     0x75100000

#define M4IF_BASE_ADDR  0x63FD8000 

#define M4IF_WMSA0_6    0x63FD80EC
#define M4IF_WMEA0_6    0x63FD810C
#define M4IF_WMIS0      0x63FD8114 

enum
{
	SD0 = SECURE_DATA + 0x00,
	SD1 = SECURE_DATA + 0x04,
};

enum
{
	CSL0	= CSU_BASE_ADDR + 0x00,
    CSL1	= CSU_BASE_ADDR + 0x04,
    CSL2	= CSU_BASE_ADDR + 0x08,         // GPIO7
    CSL3	= CSU_BASE_ADDR + 0x0c,
    CSL4	= CSU_BASE_ADDR + 0x10,
    CSL5	= CSU_BASE_ADDR + 0x14,
    CSL6	= CSU_BASE_ADDR + 0x18,
    CSL7	= CSU_BASE_ADDR + 0x1c,
    CSL8	= CSU_BASE_ADDR + 0x20,
    CSL9	= CSU_BASE_ADDR + 0x24,
    CSL10	= CSU_BASE_ADDR + 0x28,
    CSL11   = CSU_BASE_ADDR + 0x2c,
    CSL12	= CSU_BASE_ADDR + 0x30,         // GPIO7
    CSL13	= CSU_BASE_ADDR + 0x34,
    CSL14	= CSU_BASE_ADDR + 0x38,
    CSL15	= CSU_BASE_ADDR + 0x3c,
    CSL16	= CSU_BASE_ADDR + 0x40,
    CSL17	= CSU_BASE_ADDR + 0x44,
    CSL18	= CSU_BASE_ADDR + 0x48,
    CSL19   = CSU_BASE_ADDR + 0x4c,
    CSL20	= CSU_BASE_ADDR + 0x50,
    CSL21	= CSU_BASE_ADDR + 0x54,
    CSL22	= CSU_BASE_ADDR + 0x58,
    CSL23	= CSU_BASE_ADDR + 0x5c,
    CSL24	= CSU_BASE_ADDR + 0x60,
    CSL25	= CSU_BASE_ADDR + 0x64,         // ESDHC
    CSL26	= CSU_BASE_ADDR + 0x68,
    CSL27	= CSU_BASE_ADDR + 0x6c,
    CSL28	= CSU_BASE_ADDR + 0x70,         // ESDHC
    CSL29	= CSU_BASE_ADDR + 0x74,
    CSL30	= CSU_BASE_ADDR + 0x78,
    CSL31	= CSU_BASE_ADDR + 0x7c,
};

void enable_hwfirewall(void)
{
	// onlu CSL6 CSL7 CSL10 are required
	*R32 CSL0  = 0x00ff00ff;
	*R32 CSL1  = 0x00ff00ff;
	*R32 CSL2  = 0x00ff00ff;
	*R32 CSL3  = 0x00ff00ff;
	*R32 CSL4  = 0x00ff00ff;
	*R32 CSL5  = 0x00ff00ff;
	*R32 CSL6  = 0x00ff00ff;
	*R32 CSL7  = 0x00ff00ff;
	*R32 CSL8  = 0x00ff00ff;
	*R32 CSL9  = 0x00ff00ff;
	*R32 CSL10 = 0x00ff00ff;
	*R32 CSL11 = 0x00ff00ff;
	*R32 CSL12 = 0x00ff00ff;
	*R32 CSL13 = 0x00ff00ff;
	*R32 CSL14 = 0x00ff00ff;
	*R32 CSL15 = 0x00ff00ff;
	*R32 CSL16 = 0x00ff00ff;
	*R32 CSL17 = 0x00ff00ff;
	*R32 CSL18 = 0x00ff00ff;
	*R32 CSL19 = 0x00ff00ff;
	*R32 CSL20 = 0x00ff00ff;
	*R32 CSL21 = 0x00ff00ff;
	*R32 CSL22 = 0x00ff00ff;
	*R32 CSL23 = 0x00ff00ff;
	*R32 CSL24 = 0x00ff00ff;
	*R32 CSL25 = 0x003b003b;
	*R32 CSL26 = 0x00ff00ff;
	*R32 CSL27 = 0x00ff00ff;
	*R32 CSL28 = 0x003b003b;
	*R32 CSL29 = 0x00ff00ff;
	*R32 CSL30 = 0x00ff00ff;
	*R32 CSL31 = 0x00ff00ff;
} 

void bootmain(void)
{
	// enable_hwfirewall allows printf in Normal World
	enable_hwfirewall();
	iomuxc_init();
	mxc_serial_init();

	// init the secure memoru in secure world
	*R32 M4IF_WMEA0_6 = 0x00075FFF;  // end of secure memory
	*R32 M4IF_WMSA0_6 = 0x80075000;  // start of secure memory
	// if we comment this line, we would be able to read secure data in normal world
	*R32 M4IF_WMIS0   = 0x80000000;  // enable secure memory

	// init two secure data field
	*R32 SD0 = 0x11223344;
	*R32 SD1 = 0x55667788;

	cprintf("Test TrustZone NS-bit\n");

	cprintf("Secure Data SD0: 0x%x\n", *R32 SD0);
	cprintf("Secure Data SD1: 0x%x\n", *R32 SD1);


	cprintf("Switch to Normal World\n");
	
	__asm__ volatile(
			"mrc p15, 0, r0, c1, c1, 0\n\t"
			"mov r1, r0\n\t"
			"add r0, r1, #1\n\t"
			"mcr p15, 0, r0, c1, c1, 0\n\t"
			: 
			: 
			: "r0","r1"
	);

	cprintf("Now we are in Normal World, we can not read secure data\n");
	cprintf("Secure Data SD0: 0x%x\n", *R32 SD0);
	cprintf("Secure Data SD1: 0x%x\n", *R32 SD1);

	return;
}
