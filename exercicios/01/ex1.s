.section .data
num1: .word 10
num2: .word 5

.section .text
  .globl _start
_start:
  la gp, __global_pointer$ #inicializa gp
  la t1, num1            # carrega o endereco de num1 em t1
  la t2, num2

  lw t1, 0(t1)           # carrega t0 com a palavra na memoria no endereco t0
  lw t2, 0(t2)

  bgt t1, t2, num1_maior # desvia se t1 > t2
  add t0, t2, zero
  j fim

num1_maior:
  add t0, t1, zero

fim:
  add s0, zero, zero     # serve para nad