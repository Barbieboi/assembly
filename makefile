CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=crea_arr

DEPS:=crea_arr.s stampa_arr.s

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
