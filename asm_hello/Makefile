a.out: hello_world.s
	as -o hello_world.o hello_world.s
	ld -o a.out hello_world.o

read: read.s
	as -o read.o read.s
	ld -o read read.o

clean:
	rm -rf *.o a.out
