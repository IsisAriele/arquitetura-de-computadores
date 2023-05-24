.text
main:

addi $2, $0, 5
syscall
add $8, $0, $2

slt $20, $8, $0
addi $15, $0, 1
beq $15, $20, fim

#Acumulador
add $16, $0, $8
for:
addi $2, $0, 5
syscall
add $9, $0, $2
slt $20, $0, $9
beq $20, $0, fim

positivo:
mul $16, $16, $9
j for

fim:
add $4, $0, $16
addi $2, $0, 1
syscall

addi $2, $0, 10
syscall