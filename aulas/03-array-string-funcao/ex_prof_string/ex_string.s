.section .data
texto: .asciz "braz"

.section .text
    .globl _start

_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    la t0, texto # end. base da string
    lb t1, 0(t0) # le primeiro caracter

loop: beq t1, zero, fimLoop
    addi t1, t1, -32 # converte letra atual pra maiusculo 
    sb t1, 0(t0)     # armazena a letra de volta
    
    addi t0, t0, 1 # atualiza o end. pra prox. letra
    lb t1, 0(t0)   # le a prox. letra

    j loop
fimLoop:

addi t0, zero, 0
j fimLoop