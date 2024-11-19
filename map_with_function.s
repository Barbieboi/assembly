.text
.global map_with_function
.type map_with_function , %function

map_with_function :
	push {r4 , lr}
	mov r3 , #0
	mov r4 , #0
	loop :
	cmp r3 , r1
	beq end 
	push {r0 , r1 , r2 , r3}
	ldr r1 , [r0 , r3 , lsl #2]
	mov r0 , r1 
	blx r2
	add r4 , r4 , r0
	pop {r0 , r1, r2 , r3}
	add r3 , #1
	b loop
end :
	mov r0 , r4 
	pop {r4 , pc}

