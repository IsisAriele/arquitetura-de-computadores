# Faça uma função para verificar se um número é um quadrado perfeito.
.text

main:
addi $2, $0, 5
syscall
jal verificaQuadradoPerfeito

fim:
addi $2, $0, 10
syscall

verificaQuadradoPerfeito:
add $8, $0, $2 # Copia da entrada
addi $9, $0, 1 #Copia da entrada para 

for:
beq $9, $8, fimNaoPerfeito
sub $10, $8, $9 # Analisando antecessores da entrada
mul $10, $10, $10 #Analisando o quadrado do antecessor 
beq $10, $8, fimPerfeito #Verifica se é igual a entrada

addi $9, $9, 1
j for

fimPerfeito:
addi $4, $0, 'S'
addi $2, $0, 11
syscall
jr $31

fimNaoPerfeito:
addi $4, $0, 'N'
addi $2, $0, 11
syscall
jr $31
