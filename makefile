CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=sum_array

DEPS:=sum_array.s main_sumarray.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
