@echo off

set src_files=ldr_src\___gui___.c ldr_src\ldr_autorun.c ldr_src\ldr_core.c ldr_src\ldr_elflist.c ldr_src\ldr_library.c ldr_src\ldr_parser.c

set sdk_path="d:\!mcore\sdk"
set gcc_path="d:\!mcore\gcc\usr\local\bin"

set lib_path=lib.bin
set out_name=ldr.bin

lib2asm.exe %lib_path%
IF NOT EXIST "lib.asm" GOTO END

@echo on

%gcc_path%\mcore-elf-gcc -nostdinc -nostdlib -fshort-wchar -fomit-frame-pointer -mbig-endian -m340 -I%sdk_path% -c %src_files%
%gcc_path%\mcore-elf-as -EB lib.asm
%gcc_path%\mcore-elf-ld -o lib.elf -EB a.out
%gcc_path%\mcore-elf-ld -Bstatic -Tldr_linker.ld -z muldefs -o%out_name%

@echo off
pause

del *.out
del *.elf
del *.o
del lib.asm
EXIT

:END
@echo off
echo ERROR. file lib.asm does not exist!

pause
EXIT