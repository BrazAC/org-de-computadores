.section .bss
    M: .word 
    P: .word

.section .text
    .globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    j inicio # JUMP INICIO

# funcao que calcula a media de dois numeros
calcula:
    # fazer o que tem fazer
    add t0, a0, a1 # (a0 + a1)
    srli t0, t0, 1 # (a0 + a1) / 2

    # retornar valor am a0
    add a0, zero, t0

    # retornar ao caller
    jr ra

inicio:
    # valores iniciais
    addi t0, zero, 10 # t0 = 10
    addi t1, zero, 6  # t1 = 6

    # carregar argumentos
    add a0, zero, t0 # a0 = t0
    add a1, zero, t1 # a1 = t1

    # salvar caller-saved
    addi sp, sp, -16 # alocar memoria na stack
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw a1, 8(sp)
    sw ra, 16(sp)

    # chamar funcao
    jal ra, calcula # a0 = calcula(a0, a1)
    
    # restaurar caller-saved
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw a1, 8(sp)
    lw ra, 16(sp)
    addi sp, sp, +16 # desalocar memoria na stack
