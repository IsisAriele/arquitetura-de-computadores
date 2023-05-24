# Crie uma função que recebe como parâmetro um número inteiro 
# e devolve o seu dobro.

.text
Main:
addi $2, $0, 5
syscall
add $4, $2, $0
jal dobro

print:
addi $2, $0, 1
syscall

fim:
addi $2, $0, 10
syscall

dobro:
sll $4, $4, 1
jr $31
