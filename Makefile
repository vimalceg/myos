GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = 
LDPARAMS = -melf_i386

objects = loader.o kernal.o

%.o: %.cpp
	g++  $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as  $(ASPARAMS) -o $@ -c $<

mykernal.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: mykernal.bin
	sudo cp $< /boot/mykernal.bin 
	