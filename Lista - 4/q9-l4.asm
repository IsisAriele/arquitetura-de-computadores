# Elabore uma fun��o que receba tr�s notas de um aluno como par�metros 
# e uma letra.Se a letra for A, a fun��o dever� calcular a m�dia aritm�tica 
# das notas do aluno; se for P, dever� calcular a m�dia ponderada, 
# com pesos 5, 3 e 2.
.text
main:
addi $2, $0, 5
syscall
add $4, $0, $2
addi $2, $0, 5
syscall
add $5, $0, $2
addi $2, $0, 5
syscall
add $6, $0, $2
addi $2, $0, 12
syscall
add $7, $0, $2
jal media

fim:
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall

media:
addi $8, $0, 97 # --> letra a
addi $9, $0, 112 # --> letra p
beq $7, $8, mediaAritmetica
beq $7, $9, mediaPonderada

mediaAritmetica:
addi $9, $0, 3
add $8, $4, $5
add $8, $8, $6
div $8, $9
mflo $4
jr $31

mediaPonderada:
#Pesos
addi $8, $0, 5
addi $9, $0, 3
addi $10, $0, 2
# Soma dos pesos
add $11, $8, $9
add $11, $11, $10
# Multiplica��es
mul $4, $4, $8
mul $5, $5, $9
mul $6, $6, $10
# Soma final
add $4, $4, $5
add $4, $4, $6
# Divis�o final
div $4, $11
mflo $4
jr $31
