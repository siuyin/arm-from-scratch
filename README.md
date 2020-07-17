# Bare metal and QEMU arm emulation demo

# Dependencies
- gnu-rm for the compiler tools.
 See: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
- build-essential for make etc.

# Compile and link
The following source targets a Versatile Platform Baseboard
using an ARM926ej-s processor.

```
arm-none-eabi-gcc -g -c -mcpu=arm926ej-s hw2-entry.c -o hw2-entry.o

arm-none-eabi-as -g -mcpu=arm926ej-s startup.s -o startup.o

arm-none-eabi-ld -T qemuboot.ld hw2-entry.o startup.o -o qemuboot.elf

arm-none-eabi-objcopy -O binary qemuboot.elf qemuboot.bin
```
# Run
QEMU can emulate the Versatile Platform Baseboard as follows:
```
qemu-system-arm -M versatilepb -nographic -kernel qemuboot.bin
```

