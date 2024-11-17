.text
.global contacar
.type contacar , %function

@ contare le occorrenze di k in una stringa s
contacar :
	mov r3 , #0
	loop :
	ldrb r2 , [r0] ,#1
	cmp r2 , #0
	beq end 
	cmp r2 , r1
	addeq r3 , #1
	b loop
end :
	mov r0 , r3
	mov pc , lr
