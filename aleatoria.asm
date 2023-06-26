.text
main: 
lui $8, 0x1001
addi $10, $0, 10  # contador

# Leitura do vetor de 10 posições    
for:  
beq $10, $0, segue
addi $2, $0, 5
syscall

sw $2, 0($8)  # Armazena o valor lido no vetor ($2), na posição apontada por $8 na memória
addi $8, $8, 4 # Incremento $8 para o próximo endereço de memória

addi $10, $10, -1 # Decremento contador
j for        

segue:  
addi $4, $0, '\n'
addi $2, $0, 11
syscall

# Verificação de valores repetidos
lui $8, 0x1001 #reinicializo o ponteiro para o início do vetor
addi $9, $8, 4
addi $10, $0, 10  # contador for 2
addi $11, $0, 10  # contador for 3
     
for2:
beq $11, $0, for3
lw $2, 0($8)  # Carrega o valor do vetor na posição apontada por $8 para o registrador $2
beq $2, $9, igual # Compara o valor do registrador $2 com o valor a ser analisado, armazenado no registrador $9

# Valores diferentes
addi $11, $11, -1 # Decrementa o contador em 1
addi $9, $9, 4
j for2       

igual:
addi $4, $9, 0 # Imprime o valor do registrador $9, que representa o valor repetido encontrado
addi $2, $0, 1
syscall
     
addi $4, $0, '\n'
addi $2, $0, 11
syscall
     
addi $11, $11, -1 # Decrementa o contador em 1
addi $9, $9, 4
j for2

for3:  
beq $10, $0, fim
addi $8, $8, 4 #prox valor do vetor
addi $10, $0, -1 #decremento i

#trabalhando os incrementos
addi $14, $0, 1 #valor para subtração
addi $11, $0, 10 #reinicio incremento de for3
sub $11, $11, $14 #ele só vai avaliar a partir do prox
j for2

fim:                    
addi $2, $0, 10
syscall