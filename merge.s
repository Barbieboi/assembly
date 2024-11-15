.text
.global merge
.type merge , %function

@ node_t *merge(node_t *primo,node_t *secondo)

merge :
	cmp r0 , #0 @ primo == NULL
	moveq r0 , r1 
	moveq pc , lr 
	cmp r1 , #0	@ secondo == NULL
	moveq pc , lr 
	mov r2 , r0 
loop :
	cmp r2 , #0 @ p == NULL
	beq end 
	mov r3 , r2 @ r3 -> prec
	ldr r2 , [r3 , #4] @ p = p->next
	b loop
end :
	str r1 , [r3 , #4] @ prec->next = secondo
	mov pc , lr
   