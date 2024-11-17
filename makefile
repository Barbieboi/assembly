CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=binarysearch

DEPS:=main.c binarysearch.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
