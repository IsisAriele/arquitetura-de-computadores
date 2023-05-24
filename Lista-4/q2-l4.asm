# Faça uma função para verificar se um número é positivo ou negativo.
# Sendo que o valor de retorno será 1 se positivo, 
# -1 se negativo e 0 se for igual a 0.

.text
main:
addi $2, $0, 5
syscall
add $4, $2, $0
jal verifica

print:
addi $2, $0, 1
syscall

fim:
addi $2, $0, 10
syscall

verifica:
beq $4, $0, zero
slt $5, $4, $0 #Se $4 < $0 --> $5 recebe 1 (numero negativo)
bne $5, $0, negativo
slt $5, $0, $4
bne $5, $0, positivo

zero:
addi $4, $0, 0
jr $31

negativo:
addi $4, $0, -1
jr $31

positivo:
addi $4, $0, 1
jr $31