	.global _start
_start:
	MOV r0, #10
	MOV r1, #3
	MOV r2, #0
	MOV r3, #0
	
continue:	
	SUB r0, r0, r1
	CMP r0, #0
	BGT continue
	BLE quit

quit:
	ADD r0, r0, r1
	MOV r7, #1
	SWI 0
