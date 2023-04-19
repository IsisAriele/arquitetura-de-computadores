.text
# Faça um programa que leia um número inteiro e imprima 1 se o valor for ímpar e 0 se
# o valor for par.

main:
addi $2, $0, 5
syscall
add $6, $0, $2

div:
addi $5, $0, 2
div $6, $5
mfhi $4

print:
addi $2, $0, 1
syscall

end:
addi $2, $0, 10
syscall
