.section .data
    num1: .word 7

.section .text
    .globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    la t0, num1  # carregar end. de num1
    lw t0, 0(t0) # t0 = 4

    andi t1, t0, 1  # t1 = 0 se t0 par, t1 = 1 se t0 impar
    addi t0, zero, 1# t0 = 1

    beq t1, t0, eImpar
        addi t0, zero, 1 # eh par
    j fimIf
eImpar:
        addi t0, zero, 0 # eh impar
fimIf:

    addi t0, zero, 0
    j fimIf