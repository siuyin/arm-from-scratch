CC=arm-none-eabi-gcc
CFLAGS=-g -mcpu=arm926ej-s

AS=arm-none-eabi-as

LD=arm-none-eabi-ld
LDMAP=qemuboot.ld

OBJCOPY=arm-none-eabi-objcopy

DEPS =
OBJS = hw2-entry.o startup.o
ELF = qemuboot.elf
BIN = qemuboot.bin
HEX = qemuboot.hex

.PHONY: all
all: $(ELF) $(BIN) $(HEX)


%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

%.o: %.s
	$(AS)  -o $@ $< $(CFLAGS)

$(ELF): $(OBJS)
	$(LD) -T $(LDMAP) -o $@ $^

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $^ $@

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex $< $@


.PHONY: clean
clean:
	rm -f  *.o *.bin *.hex *.elf
