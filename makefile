CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=contacar

DEPS:=main.c contacar.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
