.text
.global main
.type main , %function

main :
	push {lr}
	ldr r0 , =arr 
	mov r1 , #10@ r1 -> n
	mov r2 , #0 @ r2 -> i
	mov r3 , #0 @ r3 -> ris
	loop :
	cmp r2 , r1
	beq end 
	ldr r12 , [r0] , #4
	add r3 , r12
	add r2 , #1
	b loop
	end :
	ldr r0 , =msg
	mov r1 , r3
	bl printf 
	mov r0 , #0
	pop {pc} 


.data
	arr : .word 0,1,2,3,4,5,6,7,8,9
	msg : .string "il risultato è %d\n"
