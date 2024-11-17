CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=principale

DEPS:=main_principale.c principale.s somma.s calcola.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
