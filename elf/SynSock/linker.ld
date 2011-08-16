INPUT(synsock.o sock_api.o sock_utils.o)
OUTPUT_FORMAT("elf32-mcore-big")
ENTRY(ELF_Entry)
SECTIONS
{
    .text :
    {
	*(.text)
    }
    .data :
    {
	*(.data)
	*(.rodata)
    *(.bss)
    *(COMMON)
    }
}
