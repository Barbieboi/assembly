CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=

DEPS:=

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
