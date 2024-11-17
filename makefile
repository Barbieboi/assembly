CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=diagonale

DEPS:=main.c diagonale.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
