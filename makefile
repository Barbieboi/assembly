CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=fact

DEPS:=fact.s main_fact.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
