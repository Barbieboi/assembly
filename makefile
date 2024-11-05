CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=find_max

DEPS:=find_max.s main_find_max.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
