# compara dois numeros e armazena o maior em t0
.section .data
    num0: .word 3
    num1: .word  7

.section .text
    .globl _start
_start:
    # inicializa global pointer
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    la t0, num0  # end. de num0
    la t1, num1  # end. de num1
    lw t0, 0(t0) # t0 = 3
    lw t1, 0(t1) # t1 = 7

    blt t0, t1, t0Menor
    j t0Maior
t0Menor:
    addi t0, t1, 0
t0Maior:

    addi t3, t3, 0
    j t0Maior