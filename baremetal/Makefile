CC=arm-none-eabi-gcc
CFLAGS=-g -mcpu=arm926ej-s

AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump

LDMAP=hw-boot.ld
DEPS =
OBJS = hw-entry.o hw-startup.o
ELF = baremetal.elf
BIN = baremetal.bin
HEX = baremetal.hex


.PHONY: all clean dump

all: $(BIN) $(HEX)

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


clean:
	rm -f  *.o *.bin *.hex *.elf

dump: $(ELF)
	$(OBJDUMP) -d $(ELF)
