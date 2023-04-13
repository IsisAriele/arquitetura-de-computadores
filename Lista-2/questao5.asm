.text

main: 
addi $2, $0, 5
syscall
add $6, $0, $2 #armazenei primeiro valor em reg 6
addi $2, $0, 5
syscall
add $7, $0, $2 # Segundo valor em reg 7
addi $2, $0, 5
syscall
add $8, $0, $2 # Terceiro valor em reg 8

addi $9, $0, 1 # Pesos
addi $10, $0, 2
addi $11, $0, 3

multiplicacoes:
mul $6, $6, $9
mul $7, $7, $10
mul $8, $8, $11

somanotas:
add $6, $6, $7
add $6, $6, $8

somapesos:
add $9, $9, $10
add $9, $9, $11

div:
div $6, $9
mflo $12 #Se 60 --> aprovado; se não --> reprovado

teste:
addi $9, $0, 60 # Constante de comparação
beq $12, $9, aprovacao # Verifica caso nota = 60

teste2:
slt $10, $12, $9
beq $10, $0, aprovacao # Verifica caso nota > 60

teste3:
add $4, $0, $12
j reprovacao

aprovacao:
add $4, $0, $12
addi $2, $0, 1
syscall

addi $4, $0, 'A'
addi $2, $0, 11
syscall
j fim

reprovacao:
add $4, $0, $12
addi $2, $0, 1
syscall

addi $4, $0, 'R'
addi $2, $0, 11
syscall
j fim

fim:
addi $2, $0, 10
syscall
