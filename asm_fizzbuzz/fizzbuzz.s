/* Homework 2 - Assembly Fizzbuzz
 Your program must print the numbers from 1 to 100, except when:
 1) If the number is divisible by 15, print FizzBuzz instead, if not:
   2) If the number is divisible by 3, print Fizz instead
   3) If the number is divisible by 5, print Buzz instead
 I have provided you functions that will do the printing, you just need
 to do the control logic.

 Don't modify the C file at all, or your house will lose 50 points.

 Don't use R0 through R3 in this function (except in the one example below)
 They get overwritten every time you call a function.
 So use R4 through R12 for your logic

Any line marked with DM ("Don't Modify") should probably be left alone.
The rest of the source code is just example source code and can be deleted or changed.
*/

	.global fizzbuzz     @DM - Don't modify


fizzbuzz:                @DM - Don't modify
	PUSH {LR}            @DM: Preserve LR for the calling function
	PUSH {R4-R12}        @DM: This preserves the R4 through R12 from the calling function
	MOV R4, #0
	MOV R6, #3
	MOV R7, #5
	MOV R8, #15

loop:
	ADD R4, R4, #1
	CMP R4, #101
	BEQ return 
	MOV R5, R4
modulus15:
	SUB R5, R5, R8
	CMP R5, #0
	BGT modulus15
	BEQ fizz_buzz
	MOV R5, R4
modulus3:
	SUB R5, R5, R6
	CMP R5, #0
	BGT modulus3
	BEQ fizz
	MOV R5, R4
modulus5:
	SUB R5, R5, R7
	CMP R5, #0
	BGT modulus5
	BEQ buzz
finish:
	MOV R1, R4
	BL print_number
	BAL loop

fizz:
	BL print_fizz
	BAL loop

buzz:
	BL print_buzz
	BAL loop

fizz_buzz:
	BL print_fizzbuzz
	BAL loop

return:
	POP {R4-R12}         @DM: Restore R4 through R12 for the calling function
	POP {PC}             @DM: Return from a function        

@You shouldn't need this function for this assignment, but hey it's there for you
quit:
	MOV R7,#1
	SWI 0

