CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=conta_cifre

DEPS:=main.c conta_cifre.s conta.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
