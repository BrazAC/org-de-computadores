.section .text
    .globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    addi s0, zero,-16 # s0 = -1, numero original
    addi t1, zero, 0  # t1 = 0, bit extraido
    addi t0, zero, 0  # t0 = 0, soma

    addi t2, zero, 32 # t2 = 32, quantidade de repeticoes
    addi t3, zero, 0  # t3 = 0, iterador

    loop:beq t3, t2, endLoop
        andi t1, s0, 1 # extrair bit
        srli s0, s0, 1 # deslocar numero original a direita
        add t0, t0, t1 # somar o bit extraido a soma atual

        addi t3, t3, 1
        j loop
endLoop:

gambiarra:
    addi t3, zero, 0
    j gambiarra 
