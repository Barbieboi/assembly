.text
.global stringa_cmp
.type stringa_cmp , %function

@r0 -> s1 		r1 -> s2
stringa_cmp :
	

	loop :
	ldrb r2 , [r0] , #1
	ldrb r3 , [r1] , #1
	cmp r2 , #0
	beq first_null
	cmp r3 , #0
	beq second_null
	cmp r2 , r3
	bne not_true 
	b loop

first_null :
	cmp r3 , #0
	beq true
	b not_true


true :
	mov r0 , #1
	mov pc , lr

second_null :
	cmp r2 , #0
	beq true
	b not_true


not_true :
	mov r0 , #0
	mov pc , lr

