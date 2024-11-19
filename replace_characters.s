.text
.global replace_characters
.type replace_characters , %function

replace_characters : 
	push {r4 , r5 , lr}
	mov r3 , #0
	mov r5 , r0
	loop :
	ldrb  r12 , [r5 , r3]
	cmp r12 , #0
	beq end
	mov r4 , #0
	replace :
	ldrb r0 , [r1 , r4]
	cmp r0 , #0
	beq next
	cmp r0 , r12
	ldreqb r0 , [r2 , r4]
	streqb r0 , [r5 , r3]
	add r4 , #1
	b replace
next :
	add r3 , #1
	b loop
end :
	mov r0 , #0
	pop {r4 , r5 , pc}

