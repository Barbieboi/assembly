.text
.global myatoi_signed
.type myatoi_signed , %function

@ '-' -> 45

myatoi_signed :
	push {r0 , lr}
	bl strlen
	mov r2 , r0
	sub r2 , #1 
	mov r3 , #1
	mov r12 , #0
	pop {r1}
	loop :
	cmp r2, #0
	blt end
	ldrb r0, [r1 , r2] 
	cmp r0 , #45
	beq negative
	cmp r0 , #48 @ -> codifica decimale di '0'
	blt invalid
	cmp r0 , #57 @ -> codifica decimale di '9'
	bgt invalid
	sub r0 , #48
	mul r0 , r0 , r3 
	add r12 , r12 , r0
	mov r0 , #10 
	mul r3 , r3 , r0
	sub r2,  #1
	b loop
negative :
	mov r3, #-1
	mul r12 , r12 , r3
end :
	mov r0 , r12 
	pop {pc}

invalid :
	mov r0 , #-1
	pop {pc}
