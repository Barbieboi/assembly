CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=countzero

DEPS:=countzero.s main.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
