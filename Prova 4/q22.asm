# Leia um vetor de 10 posicoes
# verifique se existem valores repetidos e os escreva na tela.

.data

.text
main: 
lui $8, 0x1001
addi $10, $0, 10  # contador

#Leitura do vetor de 10 posições    
for:  
beq $10, $0, segue
addi $2, $0, 5
syscall

sw $2, 0($8)  #Armazena o valor lido no vetor ($2), na posição apontada por $8 na memoria
addi $8, $8, 4 #incremento $8 para o prox endereço de memória

addi $10, $10, -1 #decremento contador
j for        

segue:  
addi $4, $0, '\n'
addi $2, $0, 11
syscall

#reinicio das variáveis
addi $9, $8, 0 #Copia de $8 para for3
addi $10, $0, 10  # contador
addi $13, $0, 10 #contador for3
     
for2:  
beq $10, $0, for3
addi $12, $0, 1
lw $2, 0($8)  #Carrega o valor do vetor na posição apontada por $8 para o registrador $2.
bne $2, $9, diff #Compara o valor do registrador $2 com o valor a ser analisado, armazenado no registrador $9.
#iguais
addi $4, $9, 0 # Imprime o valor do registrador $12, que representa o índice onde o valor procurado foi encontrado.
addi $2, $0, 1
syscall
     
addi $4, $0, '\n'
addi $2, $0, 11
syscall
     
diff:      
addi $8, $8, 4 #Incrementa o endereço do vetor para apontar para a próxima posição.
addi $10, $10, -1 #Decrementa o contador em 1.
j for2       


for3:
addi $9, $9, 4 #incremento
#addi $12, $0, 1 #incremento para sair do for
bne $12, $13, for2 #quando $12 = 10, vai p fim
     
fim:                    
addi $2, $0, 10
syscall
