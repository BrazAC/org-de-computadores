# encontrar o maior elemento de um array
.section .data
    meu_array: .word -5, 33, 9, 5

.section .text
    .globl _start
_start:
    .option push 
    .option norelax 
    la gp, __global_pointer$ 
    .option pop

    la t0, meu_array # le o endereco da base do array (NUNCA ALTERE ESSE VALOR)
    lw s0, 0(t0)     # inicializa o maior valor
    addi t1, zero, 1 # iterador
    addi t2, zero, 4 # tamanho do array

    #Percorrer array
loop:beq t1, t2, fimLoop
     # calcula o end. do proximo elemento
     slli t3, t1, 2  # (indice * tamElemento)
     add t3, t0, t3 # base + (indice * tamElemento)

     # carregar o elemento atual
     lw s1, 0(t3)

     # testa se precisa atualizar maior
     bge s0, s1, nao_troca
        mv s0, s1
     nao_troca:

     addi t1, zero, 1
     j loop 
fimLoop:
add s0, s0, 0
j fimLoop