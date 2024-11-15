CC=arm-linux-gnueabihf-gcc
ARMFLAGS = -static -ggdb3
LDLIBS=-lm
MAKEFLAGS += -r


TARGET:=test_mat

DEPS:=main.c stampa_mat.s 

$(TARGET):$(DEPS)
	$(CC) $^ -o $@ $(ARMFLAGS)
