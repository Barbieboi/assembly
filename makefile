CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=longest

DEPS:=main.c longest.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
