.data
 .word 12 15 8 0 3

.text
main:
lui $4, 0x1001
addi $5, $0, 3
jal prln

fim:
addi $2, $0, 10
syscall

prln:
add $9, $0, $4 #--> endereço inicial
add $10, $0, $5 #--> qtd que resta imprimir

cont:
lw $4, 0($9) #$4 = MEM($9)
addi $2, $0, 1
syscall      #Imprime $4

addi $4, $0, '\n'
addi $2, $0, 11
syscall      #quebra de linha

addi $9, $9, 4 #Prox endereço
addi $10, $10, -1 #restam imprimir
bne $10, $0, cont #se resta algum volta pra cont

fimprln:
jr $31
