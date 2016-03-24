#TARGET = eagle
#FLAVOR = debug
CC = xtensa-lx106-elf-cc
LD = xtensa-lx106-elf-cc
AR = xtensa-lx106-elf-ar
CFLAGS = -I. -I./$(INCLUDES) -mlongcalls
CXX = xtensa-lx106-elf-c++
CXXFLAGS = -I. -I/$(INCLUDES) -mlongcalls
LDDIR=/home/vagrant/build/esp-open-sdk/esp_iot_sdk_v1.5.2/ld
LDLIBS = -nostdlib -Wl,--start-group -lmain -lnet80211 -lwpa -llwip -lpp -lphy -ldriver  -Wl,--end-group -lgcc
LDFLAGS = -Teagle.app.v6.ld -L$(LDDIR) -Ldriver

ifndef PDIR # {
GEN_IMAGES= eagle.app.v6.out
GEN_BINS= eagle.app.v6.bin
SPECIAL_MKTARGETS=$(APP_MKTARGETS)
SUBDIRS= driver
endif # } PDIR

APPDIR = .

COMPONENTS_eagle.app.v6 = driver/libdriver.a
GEN_LIBS=driver/libdriver.a

#LINKFLAGS_eagle.app.v6 = \

espwol-0x00000.bin: espwol
	esptool.py elf2image $^

espwol: espwol.o

espwol.o: espwol.cpp

flash: espwol-0x00000.bin
	esptool.py write_flash 0 espwol-0x00000.bin 0x40000 espwol-0x40000.bin

clean:
	rm -f espwol espwol.o espwol-0x00000.bin espwol-0x40000.bin

.PHONY: sub
sub:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

# Recursion Magic - Don't touch this!!!

INCLUDES := $(INCLUDES) -I$(PDIR)include -I$(PDIR) -I./include
PDIR FLAGS:= ../$(PDIR)
#sinclude $(PDIR)Makefile
