#ifndef __MEMLAYOUT_H__
#define __MEMLAYOUT_H_

// Memory layout

// Key addresses for address space layout (see kmap in vm.c for layout)

//#define EXTMEM	  		0x80000000
#define KERNBASE  		0x40000000          // First kernel virtual address
//#define KERNLINK  		(KERNBASE+EXTMEM)  // Address where kernel is linked

// we first map 1MB low memory containing kernel code.
#define INIT_KERNMAP 	0x100000
#define INIT_KERN_SZ    0x100000

#define V2P(a) (((unsigned int) (a)) - KERNBASE)
#define P2V(a) (((void *) (a)) + KERNBASE)

#define _V2P(x) ((unsigned int)(x) - KERNBASE)    // same as V2P, but without casts
#define _P2V(x) ((unsigned int)(x) + KERNBASE)    // same as V2P, but without casts

#endif
