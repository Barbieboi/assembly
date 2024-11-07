CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=reduce

DEPS:=reduce.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
