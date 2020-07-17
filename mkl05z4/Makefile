CC=arm-none-eabi-gcc
CFLAGS=-g  -mcpu=cortex-m3 -mthumb

AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump

LDMAP=MKL05Z4.ld
DEPS =
OBJS = startup_MKL05Z4.o system_MKL05Z4.o
ELF = hello-mkl05z4.elf
BIN = hello-mkl05z4.bin
HEX = hello-mkl05z4.hex


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
