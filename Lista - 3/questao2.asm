.text
addi $2, $0, 5
syscall
add $8, $0, $2 #Refer�ncia;

addi $2, $0, 5
syscall
add $9, $0, $2 #Quantidade de valores a serem impressos;

addi $10, $0, 1 #Incremento

for:
beq $0, $9, fim #Onde acaba o loop, decrementa��o ser� feita
div $10, $8 #Divis�o do icnremento pela refer�ncia
mfhi $25 #Resto da divis�o
beq $25, $0, multiplo #Se resto = 0 -> multiplo
addi $10, $10, 1 #Adiciona 1 ao incremento
j for

multiplo:
add $4, $10, $0
addi $2, $0, 1
syscall
addi $4, $0, ' '
addi $2, $0, 11
syscall
subi $9, $9, 1 #Diminui 1 a cada impress�o
addi $10, $10, 1 #+ 1 ao incremento
j for

fim:
addi $2, $0, 10
syscall
