.text
.global stampa_arr
.type stampa_arr , %function

stampa_arr :
	push {r4 ,r5, r6, lr}
	mov r4 , r0 @ r4 -> *a
	mov r5 , r1 @ r5 -> n
	mov r6 , #0 @ r6 -> i
loop :
	cmp r6 , r5 
	beq end 
	ldr r0 , =msg 
	ldr r1 , [r4 , r6 ,lsl #2]
	bl printf
	add r6 , #1
	b loop
end :
	ldr r0 ,=newline
	bl printf
	mov r0 , #0
	pop {r4, r5 ,r6 ,pc}

.data
	msg :
		.string "%5d"
	newline :
		.string "\n"
