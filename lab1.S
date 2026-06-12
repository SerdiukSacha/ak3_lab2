.syntax unified
.cpu cortex-m4
.thumb

.global lab1
.type lab1, %function

lab1:
    push {r4, lr}
    mov r0, #21
    mov r1, #9
    mov r2, #6

    cmp r2, #0
    beq zero_div


    sub r3, r0, r1
    cmp r3, #0
    blt use_sub

    add r4, r0, r1
    sdiv r0, r4, r2
    b end_lab

use_sub:

    sdiv r0, r3, r2
    b end_lab

zero_div:

    mov r0, #0

end_lab:
    pop {r4, pc}
.size lab1, .-lab1
