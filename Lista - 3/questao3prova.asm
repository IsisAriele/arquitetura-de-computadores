.text
main:
addi $2, $0, 5 
syscall
beq $2, $0, fim

add $8, $0, $2 # Menor n�mero
add $9, $0, $2 # Maior n�mero
add $10, $0, $2 # Soma dos n�meros
addi $11, $0, 1 # Quantidade de n�meros

for:
# Leitura do n�mero
addi $2, $0, 5 # C�digo da syscall para ler inteiro
syscall
beq $2, $0, fim
# Verifica se o n�mero � menor que o menor n�mero encontrado at� agora
slt $14, $2, $8 #se $2 < $8 -> $14 = 1
bne $14, $0, atualiza_menor
# Verifica se o n�mero � maior que o maior n�mero encontrado at� agora
slt $14, $9, $2
bne $14, $0, atualiza_maior

mediaGeral:
# Atualiza a soma dos n�meros e a quantidade de n�meros
add $10, $10, $2
addi $11, $11, 1
# Volta para o in�cio do loop
j for
    
atualiza_menor:
# Atualiza o menor n�mero
add $8, $0, $2
j mediaGeral
    
atualiza_maior:
# Atualiza o maior n�mero
add $9, $0, $2
j mediaGeral
    
fim:
# Calcula a m�dia dos n�meros
div $10, $11
mflo $12
    
# Calcula a m�dia entre o menor e o maior n�mero
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