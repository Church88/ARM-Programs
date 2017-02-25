	.global _start
_start:
	MOV	r0, #42
	MOV r1, #21    @Try #2, #200, and #21 here
	MOV r2, r1
	ADD r1, r1, r2
	CMP r0, r1 
	BGT greater
	BLT less
	MOV r0, #0
	BAL quit

greater:
	MOV r0, #1
	BAL quit

less:
	MOV r0, #2
	BAL quit

quit:
	@r0 has been set to the exit value already
	@View the exit value by typing "echo $?" from the UNIX prompt
	MOV r7, #1 @Quit
	SWI 0      @Quit
