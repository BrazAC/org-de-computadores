#pra compilar isso aqui use -march=rv32im

.section .data
    num1: .word 10
    num2: .word 20

.section .text
    .globl _start
_start
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # carregar numeros da memoria
    la t0, num1
    la t1, num2
    lw t0, 0(t0)
    lw t1, 0(t1)

    # salvar conteudo do registradores caller-saved
    addi sp, sp, -8 # alocar memoria da stack
    sw t0, 4(sp)    # empilha t0
    sw t1, 0(sp)    # empilha t1

    # passar os argumentos e chamar a funcao
    mv a0, t0
    mv a1, t1
    jal media # chama a funcao, retorno em a0

    #Restaurar dados antes de prosseguir
    lw t0, 4(sp)    # restaura t0
    l2 t1, 0(sp)    # restaura t1
    addi sp, sp, 8  # desaloca a memoria

    mul s0, t0, t1  # calcula o produto

    la t0, num1
    la t1, num2
    sw a0, 0(t0)    # salva a media
    sw s0, 0(t1)    # salva o produto


media:
    add t0, a0, a1 # soma os dois parametros a0 e a1
    srli t0, t0, 1 # divide a soma por 2
    mv a0, t0      # copia o retorno
    jr ra          # retorna 

