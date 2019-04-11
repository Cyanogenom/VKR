#
TARGET = FPGAHPS

#
CROSS_COMPILE = arm-linux-gnueabihf-
ALT_DEVICE_FAMILY ?= soc_cv_av
CFLAGS = -static -g -Wall -I hwlib/include/ -I hwlib/include/$(ALT_DEVICE_FAMILY) -D $(ALT_DEVICE_FAMILY)
LDFLAGS = -g -Wall
CC = gcc
ARCH= arm

build: $(TARGET)
$(TARGET): main.o
	$(CC) $(LDFLAGS) $^ -o $@
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~