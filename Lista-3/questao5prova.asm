.text
addi $2, $0, 5
syscall
add $8, $0, $2

addi $9, $0, 0 #Inicialização 1 
addi $10, $0, 0 #Inicialização 2
addi $11, $0, 1 #Soma
addi $12, $0, 1 #Coluna inicial

add $4, $11, $0
addi $2, $0, 1
syscall

addi $4, $0, '\n'
addi $2, $0, 11
syscall

for1:
beq $8, $0, fim
addi $10, $0, 0 #Incremento

#Contar coluna +1
for2:
addi $11, $10, $9




add $4, $11, $0
addi $2, $0, 1
syscall
addi $4, $0, ' '
addi $2, $0, 11
syscall

