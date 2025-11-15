.section .data
    n: .word 6

.section .text
    .globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    la s0, n     # s0 = end. de n
    lw s0, 0(s0) # s0 = n
    addi t1, zero, 1 # t1 = 1
    addi t2, zero, 2 # t2 = 2
    add s1, zero, s0 # s1 = s0

    jal ra, fibonnaci
    j finalgoritmo

fibonnaci:
        beq s1, t1, retornaUm
        beq s1, t2, retornaUm
        j retornaRec
    retornaUm:
        addi t0, zero, 1 # retorna 1
        j fim
    retornaRec:
        addi s1, s1, -1
        jal ra, fibonnaci # fibonnaci(n-1)

    fim:
        jr ra


finalgoritmo: