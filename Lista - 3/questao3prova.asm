.text
main:
addi $2, $0, 5 
syscall
beq $2, $0, fim

add $8, $0, $2 # Menor número
add $9, $0, $2 # Maior número
add $10, $0, $2 # Soma dos números
addi $11, $0, 1 # Quantidade de números

for:
# Leitura do número
addi $2, $0, 5 # Código da syscall para ler inteiro
syscall
beq $2, $0, fim
# Verifica se o número é menor que o menor número encontrado até agora
slt $14, $2, $8 #se $2 < $8 -> $14 = 1
bne $14, $0, atualiza_menor
# Verifica se o número é maior que o maior número encontrado até agora
slt $14, $9, $2
bne $14, $0, atualiza_maior

mediaGeral:
# Atualiza a soma dos números e a quantidade de números
add $10, $10, $2
addi $11, $11, 1
# Volta para o início do loop
j for
    
atualiza_menor:
# Atualiza o menor número
add $8, $0, $2
j mediaGeral
    
atualiza_maior:
# Atualiza o maior número
add $9, $0, $2
j mediaGeral
    
fim:
# Calcula a média dos números
div $10, $11
mflo $12
    
# Calcula a média entre o menor e o maior número
add $13, $8, $9
addi $16, $0, 2
div $13, $16
mflo $13

#impressoes
add $4, $0, $8
addi $2, $0, 1
syscall

addi $4, $0, '\n'
addi $2, $0, 11
syscall

add $4, $0, $9
addi $2, $0, 1
syscall

addi $4, $0, '\n'
addi $2, $0, 11
syscall

add $4, $0, $12
addi $2, $0, 1
syscall

addi $4, $0, '\n'
addi $2, $0, 11
syscall

add $4, $0, $13
addi $2, $0, 1
syscall
    
addi $2, $0, 10
syscall