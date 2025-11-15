.section .data
    n: .word 5

.section .text
    .globl _start
_start:
    .option push                
    .option norelax            
    la gp, __global_pointer$    
    .option pop                 

    la t0, n     # t0 = (end. de n)
    lw s0, 0(t0) # s0 = n

    addi t0, zero, 0 # t0 = 0, soma
    addi t1, zero, 1 # t1 = 1, iterador
    addi s0, s0, 1   # necessario para mais uma iteracao

loop:beq t1, s0, endLoop
     add t0, t0, t1 # t0 = t0 + t1
     addi t1, t1, 1 # t1 += 1
     j loop
endLoop:

    addi s0, s0, -1 # voltando ao original

gambiarra:
    addi t1, t1, 0
    j gambiarra 

