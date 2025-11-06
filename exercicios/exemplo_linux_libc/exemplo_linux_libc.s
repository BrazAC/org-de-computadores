# verificar qual o maior de dois valores
.section .data
    num1: .word 10
    num2: .word 5

.section .text #aqui onde fica o codigo do programa
.globl main #entrada pra funcao main (chamado pelo crt0)
main:
    #le o endereco das variaveis globais
    la t1, num1 
    la t2, num2

    #le o conteudo das variaveis
    lw t3, 0(t1) #t3 = 10
    lw t4, 0(t2) #t4 = 5

    #testa qual das duas e maior
    bgt t3, t4, t3_maior
        addi t0, t4, 0 #mv t0, t4
        j fim
t3_maior:
        addi t0, t3, 0 #mv t0, t3
fim:
    #trava em looping infinito
    addi t0, t0, 0
    j fim 