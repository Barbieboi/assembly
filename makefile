CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=fibo

DEPS:=fibo.s main_fibo.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
