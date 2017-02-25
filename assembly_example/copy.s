	.global _start
_start:
	MOV r0, #0
	MOV r1, #0
	MOV r2, #4
	MOV r3, #7
	ADD r0, r0, r2
	ADD r1, r1, r3
	SUB r2, r2, r2
	SUB r3, r3 ,r3

quit:
	MOV r7, #1
	SWI 0
