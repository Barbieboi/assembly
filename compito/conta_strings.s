               .text
               .global conta_strings
               .type conta_strings, %function

conta_strings :
    push {r4 ,lr}
    mov r4 , #0 @ r4 -> res
    cmp r0 , #0
    beq end
    mov r2, #0
    loop :  
    cmp r2 ,r1
    beq end
    push {r0 , r1 ,r2}
    mov r1 , r0
    ldr r0 , [r1 , r2 , lsl #2]
    bl conta
    add r4 , r4 , r0
    pop {r0 , r1 , r2}
    add r2 , r2 , #1
    b loop
    end : 
    mov r0 , r4 
    pop {r4 , pc}
