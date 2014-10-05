CFLAGS += -Iinc/

ALL: source/main.o source/student.o 
	cc -o student source/main.o source/student.o

clean: 
	rm student
	rm source/*.o

tmpclean:
	rm ./
	rm ./*~
	rm include/*~
	rm source/*~

install:
	sudo cp student /usr/bin/student

uninstall:
	sudo rm /usr/bin/student
