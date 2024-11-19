.text
.global rimuovi_nodo
.type rimuovi_nodo , %function

rimuovi_nodo : 
	push {lr}
	mov r2 , r0
	mov r3 , r0
	loop :
	cmp r2 , #0 @ p == NULL
	beq end 
	push { r1, r2 , r3}
	ldr r0 , [r2]
	bl strcmp 
	cmp r0 , #0
	pop {r1 , r2 , r3}
	beq rm 
	mov r3 , r2 @ r3 -> prec
	ldr r2 , [r2 , #4] @ p = p->next
	b loop
rm :
	ldr r2 , [r2 , #4] @ r2 ->  p->next
	str r2 , [r3 , #4] @ prec->next = p->next
	mov r0 , #1
	pop {pc}
end :
	mov r0 , #0
	pop {pc}
