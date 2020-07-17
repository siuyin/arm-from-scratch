CC=arm-none-eabi-gcc
CFLAGS=-g -mcpu=arm926ej-s

AS=arm-none-eabi-as

LD=arm-none-eabi-ld
LDMAP=qemuboot.ld

OBJCOPY=arm-none-eabi-objcopy

DEPS =
OBJ = hw2-entry.o startup.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

%.o: %.s
	$(AS)  -o $@ $< $(CFLAGS)

%.elf: $(OBJ)
	$(LD) -T $(LDMAP) -o $@ $^

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

.PHONY: clean

clean:
	rm -f  *.o *.bin *.hex
