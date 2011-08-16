@echo off

set src_files=src\app.c
set out_elfname=bin\BattBrightness.elf

set sdk_path="d:\!mcore\sdk"
set gcc_path="d:\!mcore\gcc\usr\local\bin"

set gcc_params=-x c -fshort-wchar -funsigned-char -fomit-frame-pointer -fno-builtin -m340 -m4align -mbig-endian -nostdinc -nostdlib
set ld_params=-d -EB -N -r -s -Bstatic -Bsymbolic -Bsymbolic-functions --gc-sections -nostdinc -nostdlib --unresolved-symbols=report-all -z muldefs -z combreloc -z nodefaultlib

@echo on

%gcc_path%\mcore-elf-gcc.exe %gcc_params% -I%sdk_path% -c %src_files%
%gcc_path%\mcore-elf-ld.exe %ld_params% -Tlinker.ld -o%out_elfname%

del /S *.o
pause
