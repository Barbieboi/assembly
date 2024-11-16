.text
.global removelis
.type removelis , %function

@ elimina la prima occorenza di un elemento 

removelis :
	cmp r0 , #0
	moveq pc , lr 
	mov r2 , r0 
	loop :
	cmp r2 , #0 @ p == NULL
	beq end 
	ldr r12 , [r2]
	cmp r12 , r1 
	beq rm 
	mov r3 , r2 @ r3 -> prec
	ldr r2 , [r2 , #4] @ p = p->next
	b loop
rm :
	ldr r2 , [r2 , #4] @ r2 ->  p->next
	str r2 , [r3 , #4] @ prec->next = p->next
end :
	mov pc , lr

