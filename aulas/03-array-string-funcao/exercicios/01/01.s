.section .data
    mArray: .word 4, 10, 23, -2, 12

.section .text
    .globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    addi t0, zero, 0 # indice
    addi t1, zero, 5 # tam. array
    addi s2, zero, 4 # tam. elemento

    # carregar primeiro elemento em maior
    la s1, mArray # s1 = end. base
    lw s0, 0(s1)  # maior

loop:beq t0, t1, endLoop 
    # calcular end. do elemento alvo 
    mul t3, t0, s2 # (indice * tam. elemento)
    add t4, s1, t3 # base + (indice * 4)

    addi t0, t0, 1 # incrementar indice

    # carregar elemento alvo
    lw t3, 0(t4)

    # verifica se eh maior que o maior
    blt t3, s0, menorQMaior
        add s0, zero, t3
menorQMaior: 
    j loop
endLoop:

gambiarra:
    addi t1, zero, 0
    j gambiarra