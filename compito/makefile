CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=a.out

DEPS:=main.c conta_strings.s conta.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
