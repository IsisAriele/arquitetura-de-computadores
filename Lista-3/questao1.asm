# calcule e mostre os 10 primeiros números múltiplos de 3.
# último multiplo é o 30;
.text
main: 
addi $8, $0, 3
addi $9, $0, 1
addi $10, $0, 30

for:
div $9, $8
mfhi $25
beq $25, $0, multiplo
addi $9, $9, 1
j for

multiplo:
add $4, $9, $0
addi $2, $0, 1
syscall
addi $4, $0, ' '
addi $2, $0, 11
syscall
beq $9, $10, fim
addi $9, $9, 1
j for

fim:
addi $2, $0, 10
syscall
