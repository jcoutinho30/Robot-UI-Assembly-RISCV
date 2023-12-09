# Nome: José Renato Coutinho, RA: 238012

.data
dois: .word 0b000011111111, 0b000010000000, 0b000010000000, 0b000011111111, 0b000000000001, 0b000000000001, 0b000011111111
tres: .word 0b000011111111, 0b000000000001, 0b000000000001, 0b000011111111, 0b000000000001, 0b000000000001, 0b000011111111
oito: .word 0b000011111111, 0b000010000001, 0b000010000001, 0b000011111111, 0b000010000001, 0b000010000001, 0b000011111111
zero: .word 0b000011111111, 0b000010000001, 0b000010000001, 0b000010000001, 0b000010000001, 0b000010000001, 0b000011111111
um:   .word 0b000000000001, 0b000000000001, 0b000000000001, 0b000000000001, 0b000000000001, 0b000000000001, 0b000000000001

.text
main:

addi sp, sp, -20
sw s5, 16(sp)
sw s4, 12(sp)
sw s3, 8(sp)
sw s1, 4(sp)
sw s2, 0(sp)

li s1, 0
li s2, 0
li s3, 0
li s4, 0
li s5, 0

li a0, 0x110
li a6, 8 #parametro de deslocamento p direita
li a7, 0b000011111111 #parametro de pausa p deslocamento p direita

call numero2_surgindo
call numero3_surgindo
call numero8_surgindo
call numero0_surgindo
call numero1_surgindo
li s1, 0
call numero2_surgindo

lw s2, 0(sp)
lw s1, 4(sp)
lw s3, 8(sp)
lw s4, 12(sp)
lw s5, 16(sp)
addi sp, sp, 20

addi a0, zero, 10
ecall   # Encerra a execução do programa

numero2_surgindo:
addi sp, sp, -4
sw ra, 0(sp)
la a4, dois
li a1, 2
li t1, 9
beq a2, a7, numero2_deslocando
addi a6, a6, -1
for:
lw a2, 0(a4)
sra a2, a2, a6
ecall
addi a4, a4, 4
addi a1, a1, 1
beq a1, t1, numero2_surgindo
j for
numero2_deslocando:
li a5, 15
call pausa
#parametro p proximo surgimento
li a6, 8
li t2, 0b00000000111111110000000000000000
la a4, dois
li a1, 2
li t1, 9
beq a2, t2, fim
addi s1, s1, 1
for2:
lw a2, 0(a4)
sll a2, a2, s1
ecall
addi a4, a4, 4
addi a1, a1, 1 
beq a1, t1, numero2_deslocando
j for2

numero3_surgindo:
addi sp, sp, -4
sw ra, 0(sp)
la a4, tres
li a1, 2
li t1, 9
beq a2, a7, numero3_deslocando
addi a6, a6, -1
for3:
lw a2, 0(a4)
sra a2, a2, a6
ecall
addi a4, a4, 4
addi a1, a1, 1
beq a1, t1, numero3_surgindo
j for3
numero3_deslocando:
li a5, 15
call pausa
li a6, 8
li t2, 0b00000000111111110000000000000000
la a4, tres
li a1, 2
li t1, 9
beq a2, t2, fim
addi s2, s2, 1
for4:
lw a2, 0(a4)
sll a2, a2, s2
ecall
addi a4, a4, 4
addi a1, a1, 1 
beq a1, t1, numero3_deslocando
j for4

numero8_surgindo:
addi sp, sp, -4
sw ra, 0(sp)
la a4, oito
li a1, 2
li t1, 9
beq a2, a7, numero8_deslocando
addi a6, a6, -1
for5:
lw a2, 0(a4)
sra a2, a2, a6
ecall
addi a4, a4, 4
addi a1, a1, 1
beq a1, t1, numero8_surgindo
j for5
numero8_deslocando:
li a5, 15
call pausa
li a6, 8
li t2, 0b00000000111111110000000000000000
la a4, oito
li a1, 2
li t1, 9
beq a2, t2, fim
addi s3, s3, 1
for6:
lw a2, 0(a4)
sll a2, a2, s3
ecall
addi a4, a4, 4
addi a1, a1, 1 
beq a1, t1, numero8_deslocando
j for6

numero0_surgindo:
addi sp, sp, -4
sw ra, 0(sp)
la a4, zero
li a1, 2
li t1, 9
beq a2, a7, numero0_deslocando
addi a6, a6, -1
for7:
lw a2, 0(a4)
sra a2, a2, a6
ecall
addi a4, a4, 4
addi a1, a1, 1
beq a1, t1, numero0_surgindo
j for7
numero0_deslocando:
li a5, 15
call pausa
li a6, 8
li t2, 0b00000000111111110000000000000000
la a4, zero
li a1, 2
li t1, 9
beq a2, t2, fim
addi s4, s4, 1
for8:
lw a2, 0(a4)
sll a2, a2, s4
ecall
addi a4, a4, 4
addi a1, a1, 1 
beq a1, t1, numero0_deslocando
j for8

numero1_surgindo:
addi sp, sp, -4
sw ra, 0(sp)
numero1_deslocando:
li a5, 15
call pausa
li a6, 8
li t2, 0b00000000000000010000000000000000
la a4, um
li a1, 2
li t1, 9
beq a2, t2, fim
addi s5, s5, 1
for10:
lw a2, 0(a4)
sll a2, a2, s5
ecall
addi a4, a4, 4
addi a1, a1, 1 
beq a1, t1, numero1_deslocando
j for10

fim:
lw ra, 0(sp)
addi sp, sp, 4
ret

pausa:
addi a5, a5, -1
bgt a5, zero, pausa
ret 

