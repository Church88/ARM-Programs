//Documentation for all syscalls can be found at http://syscalls.kernelgrok.com/
//Note that is for x86, so your mileage may vary

.global _start
_start:
	MOV R0,#1		@0 = stdin, 1 = stdout, 2 = stderr
	LDR R1,=hi		@load the address of hi into R1
	MOV R2,#13      @strlen(hi)
	MOV R7,#4		@Write syscall
	SWI 0			@Syscall

	MOV R7,#1		@Exit Syscall
	SWI 0

.data
hi: .ascii "Hello World!\n"
