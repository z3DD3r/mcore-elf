INPUT(___gui___.o ldr_autorun.o ldr_core.o ldr_elflist.o ldr_library.o ldr_parser.o lib.elf)
OUTPUT_FORMAT(binary)
ENTRY(_main)

SECTIONS
{
	. = 0x096C3D00;
	.text :
	{
		*(.text)
	}
	.data :
	{
		*(.data)
		*(.rodata)
	}
    .bss :
    {
		*(.bss)
		*(COMMON)
    }
}

