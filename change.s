@ void change(char *s, char t , char c)
@ sostituisce in s le occorrenze di t con c
.text
.global change
.type change , %function

change :
	push {lr}
	mov r12 , #0 @ r12 -> i
loop :
	ldrb r3 , [r0 , r12] 
	cmp r3 , #0 
	beq end
	cmp r3 , r1
	streqb r2 , [r0 , r12]
	add r12 , r12 , #1 
	b loop

	end : 
	pop {pc}
