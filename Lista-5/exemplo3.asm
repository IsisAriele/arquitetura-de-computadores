# Leia um vetor de 10 posicoes
# em seguida, leia um numero inteiro
# imprima os indices onde esse valor se encontra

.data

.text
main: lui $8, 0x1001
      addi $10, $0, 10  # contador
     
for:  beq $10, $0, sai
      addi $2, $0, 5
      syscall

      sw $2, 0($8)  
      addi $8, $8, 4

      addi $10, $10, -1
      j for        
sai:  addi $4, $0, '\n'
      addi $2, $0, 11
      syscall
      addi $2, $0, 5
      syscall
      add $9, $2, $0 #copia do valor a ser analisado
      
      addi $4, $0, '\n' #quebra de linha
      addi $2, $0, 11
      syscall
      
      lui $8, 0x1001 #Carrega o endereço base do vetor novamente no registrador $8.
      addi $10, $0, 10  # contador
      addi $12, $0, 0
     
for2:  beq $10, $0, sai2
     
      lw $2, 0($8)  #Carrega o valor do vetor na posição apontada por $8 para o registrador $2.
      bne $2, $9, diff #Compara o valor do registrador $2 com o valor a ser analisado, armazenado no registrador $9.
      #iguais
      addi $4, $12, 0 # Imprime o valor do registrador $12, que representa o índice onde o valor procurado foi encontrado.
      addi $2, $0, 1
      syscall
     
      addi $4, $0, '\n'
      addi $2, $0, 11
      syscall
     
diff:      
      addi $8, $8, 4 #Incrementa o endereço do vetor para apontar para a próxima posição.
      addi $12, $12, 1 # Incrementa o contador de índice em 1.
      addi $10, $10, -1 #Decrementa o contador em 1.
      j for2        
sai2:      
     
     
fim:                    
      addi $2, $0, 10
      syscall
