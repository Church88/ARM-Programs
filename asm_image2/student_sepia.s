.global student_sepia
student_sepia:
	PUSH {LR} 			@This is how you function
	PUSH {R4-R12}		@Remember?

	@R0 in
	@R1 out
	@R2 width
	@R3 height
	MUL R4,R2,R3
	@R4 stride
	MOV R5,R4
	@Copy for loop
	ADD R6,R4,R4
	@R6 Stridex2

	@Set up Red ints
	MOV R10,#100
	VDUP.U8 D0,R10
	MOV R10,#196
	VDUP.U8 D1,R10
	MOV R10,#48
	VDUP.U8 D2,R10
	@Set up Green ints
	MOV R10,#89
	VDUP.U8 D3,R10
	MOV R10,#175
	VDUP.U8 D4,R10
	MOV R10,#43
	VDUP.U8 D5,R10
	@Set up Blue ints
	MOV R10,#69
	VDUP.U8 D6,R10
	MOV R10,#136
	VDUP.U8 D7,R10
	MOV R10,#33
	VDUP.U8 D8,R10
	
main_loop:
	@R 7,8,9 = R,G,B
	VLDR D9,[R0] @Red
	VLDR D10,[R0] @Green
	VLDR D11,[R0] @Blue

quit:
	POP [R4=R12}
	POP {LR}
