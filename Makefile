AS_FLAGS = --32 -gstabs
LD_FLAGS = -m elf_i386

all: bin/elaborato

obj/elaborato.o: src/elaborato.s
	as $(AS_FLAGS) src/elaborato.s -o obj/elaborato.o 

bin/elaborato: obj/elaborato.o
	ld $(LD_FLAGS) obj/elaborato.o -o bin/elaborato 

clean: 
	rm -f obj/* bin/*