.text
.global invertistr
.type invertistr , %function

invertistr :
	push {r4 , lr}
	mov r4 , r0
	bl strlen
	push {r0}
	add r0 , #1
	bl malloc
	cmp r0 , #0
	beq err
	mov r3 , r0 
	pop {r1}
	sub r1 , #1
	loop :
	cmp r1 , #0
	blt end
	ldrb r2 , [r4 , r1]
	strb r2 , [r0] , #1
	sub r1 , #1
	b loop
	end :
	mov r2 , #0
	strb r2 , [r0]
	mov r0 , r3
	pop {r4 , pc}

err :
	mov r0 , #1
	b exit
