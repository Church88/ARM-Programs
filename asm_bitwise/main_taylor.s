//For this assignment, you will do two things:
//First, the user will enter how many letters (a number 1 through 9) to
// convert into uppercase equivalents (without using toupper or cheats like that).
//The user will enter that many letters. You will then output each of those letters
// in upper case format. (If they were already uppercase, they shouldn't change).
//Second, you will write a for loop. The twist for this is that you can only use
// a *single register* to implement the for loop's variables to keep track of where it is
// and what the step size should be. (You can use other registers as normal to call
// the write syscall or to check for termination.) So not 3 registers like normally.
//The for loop will print out a diamond pattern like this:
// .
// ....
// .......
// ..........
// .......
// ....
// .
// The above represents a diamond of size == 4. The size you'll actually use
// will be equal to the original number input by the user up top in phase one.
.global _start
_start:
	//Print greeting
	MOV R0,#1		 @0 = stdin, 1 = stdout, 2 = stderr
	LDR R1,=greeting //@Print from this string in the data segment
	MOV R2,#68       @68 characters to print
	MOV R7,#4		 @Choose the Write syscall (which is syscall 4)
	SWI 0			 //@Syscall
	//Read from stdin one character
	MOV R0,#0
	LDR R1,=input //This is essentially a byte buffer
	MOV R2,#2 //Reading in two characters for our number, to account for newline char
	MOV R7,#3 //Syscall for read
	SWI 0
	// LDR R1,=input
	LDRB R8,[R1] //Loading a byte from R1
 	CMP R8,#57   //Comparing to ASCII 9
	BGT quit     //If greater than, quit
	CMP R8,#48   //Comparing to ASCII 0
	BLT quit     //If less than, quit
	SUB R8,R8,#48 //Convert that ASCII character to an integer of equal value 
	MOV R5,R8     //Storing our int in R5
	MOV R3,#0     //Diamond Loop control
	MOV R4,#-1    //Byte offset for our string
//Loop, read that many characters in, one at a time...
    //if > 0 keep going, sub 1 every time after comparison (-2 every time?)
	//Reading the char
	MOV R0,#0     //Stdin
	LDR R1,=input //Byte buffer for string
	MOV R2,#10    //Possible to read in 9 characters + newline
	MOV R7,#3    //Syscall for read
	SWI 0 
	MOV R6,R1   //Moving our captured string into R6 for manipulation
 //There is a garbage bit in front of the input char when read in?
//For each character read, uppercaseify it
//LDR R1,=input
dank_loop:
	ADD R4,R4,#1 //Byte offset, on first loop this is zero
	CMP R4,R8    //Comparing Byte offset to length, we don't want to write past our string length
	BEQ string_put //If equal to length, print string
	LDRB R9,[R6,R4] //On first loop, this is loading a byte from R6 offset by R4 bytes, which would be zero, this would read in the first character of our string, moving upward
    BIC R9,#32      //Bitclears 32 from our 'a' to make it an 'A'
	STRB R9,[R1,R4] //Storing one byte from R9 into R1 (our originally captured string) offset by R4 bytes
	B dank_loop     //Keep looping
//And output it
//Now print out a diamond as described above
string_put:
	MOV R0,#1 //Stdout
		      //No R1 is declared here since inside dank_loop were storing our modified bytes back into R1
	MOV R2,R8 //Output the total length of string
	MOV R7,#4 //Syscall for write
	SWI 0
end_l:
    MOV R0,#1 //Stdout
	LDR R1,=endl //Newline char
	MOV R2,#1 //One char
	MOV R7,#4 //Write syscall
	SWI 0 //This makes the diamond start on the line after our modified string
diamond_up:
	CMP R3,R5 //Compare R3 to original string length
	BEQ sub_2 //If it's equal we need to do a math correction for the bottom half 
	MOV R12,R3 //Move our current R3(0 on first loop) to R12
	MOV R11,#3 //Our formula for the diamond is 3x+1
	MUL R10,R12,R11 //Multiply R12,R11 (O * 3 on first run)
	ADD R10,R10,#1 //Add one (first run will produce 1 dot
	LDR R1,=dots //Load dots into byte buffer
	MOV R0,#1 //Stdout
	MOV R2,R10 //Current length of R10, (1 on first run)
	MOV R7,#4 //Write syscall
	SWI 0
	MOV R0,#1 //Stdout
	LDR R1,=endl //Newline char into buffer
	MOV R2,#1 //1 newline
	MOV R7,#4 //Write Syscall
	SWI 0
	ADD R3,R3,#1 //Loop control with R3
	B diamond_up //Loop to next line
sub_2:
    SUB R3,R3,#2 //When we hit this our R3, equal R5, which is our original string length e.g. (4 || 1 || 9) we substract 2 to properly display the line after our peak
diamond_down:
	CMP R3,#0 //CMP R3, #0, on #0 we want to display one dot
	BLT quit //@ #-1 we want to quit
	MOV R12,R3 //MOV R3 current to R12
	MOV R11,#3 //MOV #3 to R11 for the Mul
	MUL R10,R12,R11 //(3x) or we can interpret as (3 * R12)
	ADD R10,R10,#1 //Add one to complete (3(R12)+1)
	LDR R1,=dots //Load dots into buffer
	MOV R0,#1 //Stdout
	MOV R2,R10 //Current length of R10 for number of dots
	MOV R7,#4 //Write syscall
	SWI 0 
	MOV R0,#1 //Stdout
	LDR R1,=endl //Newline character for buffer
	MOV R2,#1 //One newline character
	MOV R7,#4 //Write syscall
	SWI 0
	SUB R3,R3,#1 //Loop control
	B diamond_down //Loop to next line
quit:
	MOV R7,#1		@Exit Syscall
	SWI 0

.data
endl: .ascii "\n"
garbage: .ascii "."
greeting: .ascii "Please enter how many letters you would like to uppercaseify (1-9): "
input: .ascii "                                                                               "
dots: .ascii "................................................................................"
