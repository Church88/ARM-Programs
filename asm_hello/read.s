//Twitterizer program - reads a sentence and changes it into a twit thing

//Documentation for all syscalls can be found at http://syscalls.kernelgrok.com/
//Note that is for x86, so your mileage may vary

.global _start
_start:
	//Read from stdin
	MOV R0,#0		@0 = stdin, 1 = stdout, 2 = stderr
	LDR R1,=hi		@load the address of hi into R1
	ADD R1,R1,#1	@We'll start writing one character in so we can prepend a hastag
	MOV R2,#80      @strlen(hi)
	MOV R7,#3		@Read syscall
	SWI 0			@Syscall
	MOV R5,R0		@Save the return value as bytes read

	//Change the first character to hastag
	LDR R1,=hi		@load the address of hi into R1
	MOV R4,#'#'		@Put a hashtag into R4
	STRB R4,[R1]	@Store (a byte) the hashtag at the first character in hi

	//Change the last character to a newline
	MOV R4,#'\n'	@Put a newline into R4
	ADD R5,R5,#1	@Increase the string length by 1 since we're going to append a \n
	STRB R4,[R1,R5]	@Store a hashtag at the last character (R1+R5) in hi

	//Write the string to stdout
	MOV R0,#1		@0 = stdin, 1 = stdout, 2 = stderr
	MOV R2,R5       @recall the length read in
	MOV R7,#4		@Write syscall
	SWI 0			@Syscall

	MOV R7,#1		@Exit Syscall
	SWI 0

.data
hi: .ascii "                                                                                 "
