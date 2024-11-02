.text
.global sum_array
.type sum_array , %function

sum_array :
		push {lr}
		mov r2, #0 @ -> i
		mov r3, #0 @ -> risultato
	loop :
		cmp r2 , r1 @ r1 -> n
		beq end
		ldr r12 , [r0] , #4 
		add r3 , r12 ,r3  
		add r2 , r2 , #1
		b loop

	end :
		mov r1, r3
		ldr r0, =msg
		bl printf
		pop {pc}

.data
	msg :
	.string "Risultato: %d\n" 
