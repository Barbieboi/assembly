CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=contapari

DEPS:=contapari.s main_contapari.c

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
