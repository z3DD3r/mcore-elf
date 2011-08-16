INPUT(Tunes.o Graphics.o LNGparser.o Config.o Utils.o)
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