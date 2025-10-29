    .section .data
    num1: .word 10 #variavel global
    num2: .word 5  #variavel global

.section .text
    .globl _start
_start:
    la t1, num1 #carrega o end. de num1 em t0
    la t2, num2 #carrega o end. de num2 em t0

    lw t1, 0(t1)
    lw t2, 0(t1)

    bgt t1, t2, num1_maior
    add t0, t2, zero
    j fim
num1_maior:
    add t0, t1, zero
fim:
    add s0, zero, zero #so pra o programa parar pra debugar


    