CC = xtensa-lx106-elf-cc
LD = xtensa-lx106-elf-cc
CFLAGS = -I. -mlongcalls
CXX = xtensa-lx106-elf-c++
CXXFLAGS = -I. -mlongcalls
LDDIR=/home/vagrant/build/esp-open-sdk/esp_iot_sdk_v1.5.2/ld
LDLIBS = -nostdlib -Wl,--start-group -lmain -lnet80211 -lwpa -llwip -lpp -lphy -Wl,--end-group -lgcc
LDFLAGS = -Teagle.app.v6.ld -L$(LDDIR)

espwol-0x00000.bin: espwol
	esptool.py elf2image $^

espwol: espwol.o

espwol.o: espwol.cpp

flash: espwol-0x00000.bin
	esptool.py write_flash 0 espwol-0x00000.bin 0x40000 espwol-0x40000.bin

clean:
	rm -f espwol espwol.o espwol-0x00000.bin espwol-0x40000.bin
