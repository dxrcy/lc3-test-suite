.ORIG x3000

	halt

	add	r0,	r1,	r2
	add	r0,	r1,	#0
	and	r0,	r1,	r2
	and	r0,	r1,	#0
	not	r0,	r1
	ld	r0,	Data
	ldi	r0,	Data
	ldr	r0,	r1,	#0
	lea	r0,	Data
	st	r0,	Data
	sti	r0,	Data
	str	r0,	r1,	#0
	br	Data
	brn	Data
	jsr	Data
	jsrr	r0
	jmp	r0
	trap	x25

Data	.BLKW	#1

.END
