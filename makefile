CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=list

DEPS:=main.c removelis.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
