/*OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")*/
/*OUTPUT_ARCH(arm)*/
ENTRY(_start)

SECTIONS
{
	. = 0x90000000;
	/*. = ALIGN(4);*/
	.text : { *(.text) }

	. = ALIGN(4);
	.data : { *(.data) }

	. = ALIGN(4);
	__bss_start = .;
	.bss : { *(.bss*) }
	__bss_end = .;

	. = 0xc0000000;
	.stack :
	{
		STACK_ADDR = . ;
	}
}

