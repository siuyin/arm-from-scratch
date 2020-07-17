MEMORY
{
	VECTORS (rx) : ORIGIN = 0x00000000, LENGTH = 0x00000400
	FLASH_PROTECTION (rx) : ORIGIN = 0x00000400, LENGTH = 0x00000010
	FLASH (rx) : ORIGIN = 0x00000410, LENGTH = 32K - 0x00000410
	RAM (rwx) : ORIGIN = 0x1ffffc00, LENGTH = 4K - 0xc0
}

ENTRY(Reset_Handler)

SECTIONS
{
	.isr_vector :
	{
	} > VECTORS

	.text :
	{
		*(.text*)
	} > FLASH

	. = ALIGN(4);
	__etext = .;

	.data : AT (__etext)
	{
		. = ALIGN(4);
	} > RAM

	.bss :
	{
		*(.bss*)
		*(COMMON)
	} > RAM
}
