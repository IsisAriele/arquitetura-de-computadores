# Faça um programa que leia um vetor de 10 posições e 
# verifique se existem valores repetidos e os escreva na tela.

.text
main:
addi $8, $0, 0 #i do for
addi $9, $0, 10 #Verificação no for (i < 10)
lui $25, 0x1001

for0:
beq $8, $9, continua #Verifica para sair do for
addi $2, $0, 5 #lê número
syscall
sw $2, 0($25) #Armazenando número lido em um endereço de memória
addi $25, $25, 4 #Somando para apontar para o próximo endereço de memória
addi $8, $8, 1 #incrementa i
j for0

continua:
#Reiniciando as variáveis para a verificação dos repetidos
addi $8, $0, 0
addi $9, $0, 10
addi $15, $0, 0 #Inicializando contador de endereço de memória
lui $25, 0x1001

addi $10, $0, 0 #Contador de números que já foram

#For para verificação se existem repetidos
lw $11, 0($26) #carregando um número no $11
addi $25, $25, 4

for1:
beq $8, $9, nextnumber #contador para verificar um número com o proximo
beq $10, $9, fim #se $10 = 10, todos os números foram verificados 
lw $12, 0($25) #carregando o número seguinte ao $12
beq $11, $12, iguais
addi $25, $25, 4

iguais:
add $4, $0, $11 #adicionando para impressão
addi $2, $0, 1
syscall

addi $4, $0, ' '
addi $2, $0, 11
syscall

j nextnumber

nextnumber:
addi $26, $26, 4
addi $15, $15, 4 #aumentando para não verificar o mesmo numero
lw $11, 0($26) #carregando um número no $11
addi $8, $0, 0

lui $25, 0x1001 #reiniciando o endereço de memoria
addi $25, $25, 4 #adiciona 4 para não verificar o mesmo numero duas vezes
add $25, $25, $15 #adicionando o contador de verificações para não verificar o mesmo numero duas vezes
addi $10, $10, 1

j for1

fim:
addi $2, $0, 10
syscall