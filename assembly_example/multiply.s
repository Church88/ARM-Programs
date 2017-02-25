	.global _start
_start:
	MOV r2, #0
	MOV r3, #0
	MOV r0, #4
	MOV r1, #7
	
continue:
	SUB r1, r1, #1
	ADD r2, r2, r0
	CMP r1, #0
	BNE continue
	MOV r0, r2

quit:
	MOV r7, #1
	SWI 0
