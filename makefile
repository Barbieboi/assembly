CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=stringa_cmp

DEPS:=stringa_cmp.s main.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
