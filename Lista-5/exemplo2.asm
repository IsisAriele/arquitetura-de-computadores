#Faça um programa que leia 10 números inteiros e armazene-os em um vetor. 
# Em seguida escreva os elementos desse vetor que são primos e 
# suas respectivas posições no vetor.
.data

.text
main: lui $8, 0x1001
      addi $10, $0, 10  # contador
     
for:  beq $10, $0, sai
      addi $2, $0, 5
      syscall

      sw $2, 0($8)  #armazena o numero
      addi $8, $8, 4

      addi $10, $10, -1
      j for        
sai:  addi $4, $0, '\n'
      addi $2, $0, 11
      syscall
     
      lui $8, 0x1001
      addi $10, $0, 10  # contador
      addi $12, $0, 0
     
for2:  beq $10, $0, sai2
     
      lw $2, 0($8)  
      addi $24, $0, 0 # divs
      add $25, $2, $0
     
forp: beq $25, $0, fimp      
      div $2, $25
      mfhi $15
      bne $15, $0, contp
      addi $24, $24, 1
contp:addi $25, $25, -1
      j forp
fimp: addi $14, $0, 2
      bne $14, $24, naop    
      add $4, $2, $0
      addi $2, $0, 1
      syscall
      addi $4, $0, '('
      addi $2, $0, 11
      syscall
      add $4, $12, $0
      addi $2, $0, 1
      syscall
      addi $4, $0, ')'
      addi $2, $0, 11
      syscall
      addi $4, $0, '\n'
      addi $2, $0, 11
      syscall
naop:      
      addi $8, $8, 4
      addi $12, $12, 1
      addi $10, $10, -1
      j for2        
sai2:      
     
     
fim:                    
      addi $2, $0, 10
      syscall