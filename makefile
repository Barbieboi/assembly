CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=change

DEPS:=change.s main_change.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
