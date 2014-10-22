/*OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")*/
/*OUTPUT_ARCH(arm)*/
ENTRY(_start)

ENTRY_SVC_STACK_SIZE = 0x1000;

SECTIONS
{
	/* . = 0x97800000; */
	. = 0x70008000;
	.start_sec : {
		entry.o(.text)
		start.o(.text .text.*)
		early_mxc_serial.o(.text .text.*)

		entry.o(.rodata .rodata.*)
		start.o(.rodata .rodata.*)
		early_mxc_serial.o(.rodata .rodata.*)

		entry.o(.data .data.*)
		start.o(.data .data.*)
		early_mxc_serial.o(.data .data.*)

		entry.o(.bss .bss.* COMMON)
		start.o(.bss .bss.* COMMON)
		early_mxc_serial.o(.bss .bss.* COMMON)

		/*define a stack for the entry*/
		. = ALIGN(0x1000);
		. += ENTRY_SVC_STACK_SIZE;

		PROVIDE (svc_stktop = .);

		/* define the kernel page table, must be 16K and 16K-aligned*/
		. = ALIGN(0x4000);
		PROVIDE (_kernel_pgtbl = .);
		. += 0x4000;

		/* we also need a user page table*/
		PROVIDE (_user_pgtbl = .);
		. += 0x1000;
	}

	/*the kernel executes at the higher 2GB address space, but loaded
	  at the lower memory (0x20000)*/
	. = 0x80020000;
	
	.text : AT(0x70020000){
		*(.text .text.* .gnu.linkonce.t.*)
	}

	PROVIDE(etext = .);   /* Define the 'etext' symbol to this value */

	.rodata : {
		*(.rodata .rodata.* .gnu.linkonce.r.*)
	}

	/* aligned the data to a (4K) page, so it can be assigned
	   different protection than the code*/
	. = ALIGN(0x1000);

	PROVIDE (data_start = .);
	
	.data : {
		*(.data .data.*)
	}

	PROVIDE (edata = .);

	.bss : {
		*(.bss .bss.* COMMON)
	}
	
	. = ALIGN(0x1000);
	PROVIDE (end = .);
}

