.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2 #Idade
addi $2, $0, 5
syscall
add $9, $0, $2 #Serviço

maior65:
addi $5, $0, 65
slt $10, $8, $5
beq $10, $0, aposenta # Verifica idade minima

servico40:
addi $6, $0, 40
slt $10, $9, $6
beq $10, $0, aposenta # Verifica tempo serviço mínimo

maior60e35:
addi $6, $0, 35
slt $11, $9, $6 
beq $11, $0, verificaservico 

verificaservico:
addi $5, $0, 60
slt $10, $8, $5
add $10, $10, $11 # Soma das verificações mínimas
beq $10, $0, aposenta # soma = 0 salta para aposenta

naoaposenta:
addi $4, $0, 'N'
addi $2, $0, 11
syscall
j fim

aposenta:
addi $4, $0, 'S'
addi $2, $0, 11
syscall

fim:
addi $2, $0, 10
syscall

