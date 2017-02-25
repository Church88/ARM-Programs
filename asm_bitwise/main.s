//because R0 because 0=cin 1=cout 2=cerr
//because R1 is the only output reg
//because R2 dictates output or input size who knows
//because R7 determines which syscall to use 4=write 3=read

.global _start
_start:

    MOV R0,#1
    LDR R1,=greeting
    MOV R2,#68 //cause its 68 characters long
    MOV R7,#4 
    SWI 0 //do stuff

read_singlish:
    //read in something as 2 characters cause why not
    MOV R0,#0
    LDR R1,=input //its blank...because
    MOV R2,#2 //because
    MOV R7,#3 //read
    SWI 0 //stuff
    LDRB R8,[R1] //because load it
    CMP R8,#57 //Ascii for char 9 is 57 in decimal
    BGT error
    CMP R8,#48 //Ascii for char 0 is 48 in decimal
    BLT error
    SUB R8,R8,#48
    MOV R9,R8
    MOV R5,#-1 //loop counter
    MOV R0,#0
    LDR R1,=input //that blank thing again
    MOV R2,#10 //if size is 9, also have to hit enter e.g. ABCDEFGHI'\n'
    MOV R7,#3
    SWI 0
    MOV R6,R1
    
loop:
    CMP R9,#0
    BEQ string_print
	SUB R9,R9,#1
	ADD R5,#1
	LDRB R11,[R6,R5] //Load Byte offset by R5 into R11 from R6
	
	@make sure each letter in the string is a letter
	CMP R11,#65
	BLT error
	CMP R11,#90
	BGT check_lower
	BAL continue 
check_lower:
	CMP R11,#97
	BLT error
	CMP R11,#122
	BGT error
continue:
    BIC R11,#32
    STRB R11,[R1,R5]
    BAL loop
    
string_print:
    MOV R0,#1
    MOV R2,R8
    MOV R7,#4
    SWI 0
	MOV R0,#1
	LDR R1,=endl
	MOV R2,#1
	MOV R7,#4
	SWI 0

check_length:
	CMP R8,#1
	BEQ only_one
	BAL morethanone

only_one:
	MOV R0,#1
	MOV R2,#2
	LDR R1,=one_dot
	MOV R7,#4
	SWI 0
	BAL quit

morethanone:
MOV R11,R8,LSL#8
SUB R11,R11,#0x100    //sub one to length
MOV R4,#1
ORR R4,R4,R11         //Form Voltron
first_part:
	MOV R0,#1
	LDR R1,=dots
	AND R2,R4,#0xFF   //clear out the second byte ->hex
	MOV R7,#4
	SWI 0
	MOV R0,#1
	LDR R1,=endl
	MOV R2,#1
	MOV R7,#4
	SWI 0
	ADD R4,R4,#3      //add 3 more to the dots
	SUB R4,R4,#0x100  //subtract 1 from stringlength
	CMP R4,#0xFF      //see if there is anything left in the string length side if there is R3 will be greater
	BGT first_part    //Bacon Lettuce Tomatoe 

ADD R11,R11,#0x100    //add one to length
ORR R4,R4,R11         //Form Megatron
second_part:
	MOV R0,#1 
	LDR R1,=dots
	AND R2,R4,#0xFF   //clear out the second byte ->hex
	MOV R7,#4
	SWI 0
	MOV R0,#1
	LDR R1,=endl
	MOV R2,#1
	MOV R7,#4
	SWI 0
	SUB R4,R4,#3     //sub 3 dots
	SUB R4,R4,#0x100 //subtract 1 from stringlength
	CMP R4,#0xFF     //see if there is anything left in the string length side if there is R3 will be greater
	BGT second_part
	B quit

quit:
	MOV R7,#1               @Exit Syscall
    SWI 0

error:
	MOV R0,#1
	LDR R1,=bad_input
	MOV R2,#10
	MOV R7,#4
	SWI 0
	MOV R7,#1
	SWI 0

.data
bad_input: .ascii "BAD INPUT\n"
endl: .ascii "\n"
garbage: .ascii "."
greeting: .ascii "Please enter how many letters you would like to uppercaseify (1-9)"
input: .ascii "                  "
dots: .ascii "..................................................................................."
one_dot: .ascii ".\n"
