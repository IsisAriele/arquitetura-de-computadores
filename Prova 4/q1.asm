# Crie um programa que leia 6 valores inteiros estritamente 
# positivos (maiores que 0), descartando qualquer
# entrada negativa ou zero, e, em seguida, 
#mostre na tela os valores lidos na ordem inversa.


.text
main: 
lui $8, 0x1001
addi $9, $0, 0  # contador de positivos
addi $10, $0, 6 #limite de positivos
      
for:  
beq $9, $10, sai
addi $2, $0, 5
syscall
beq $2, $0, naoPositivo
slt $11, $0, $2
beq $11, $0, naoPositivo
#positivo
sw $2, 0($8)  #armazena o numero positivo que esta em $2
addi $8, $8, 4 #prox endereço
addi $9, $9, 1 #iteração
     
naoPositivo:      
j for        
sai:  
addi $8, $8, -4
for2: 
beq $10, $0, fim
lw $4, 0($8) #Pega valor da memória
addi $2, $0, 1
syscall
addi $4, $0, ' '
addi $2,$0, 11
syscall
addi $8, $8, -4
         
addi $10, $10, -1      
j for2        
fim:                    
addi $2, $0, 10
syscall