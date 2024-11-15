CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=pippare

DEPS:=main.c pippolis.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
