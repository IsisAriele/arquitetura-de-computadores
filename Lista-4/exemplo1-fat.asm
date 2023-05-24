#Rotina para calcular o fatorial
# Entrada: $4
# Saida: $2
# usa (sem preservar): 8
# Obs: não checa maior que um na entrada

.text
main:
addi $2, $0, 5
syscall
add $4, $0, $2
jal fat # O registrador $31 recebeu o registrador da linha seguinte

ret1:
add $4, $0, $2 #Impressão na tela
addi $2, $0, 1
syscall
addi $2, $0, 10

fim:
syscall

fat:
add $2, $4, $0
addi $8, $4, -1

mtl:
mul $2, $2, $8
addi $8, $8, -1
bne $8, $0, mtl
jr $31

#jal vai e jr volta :D

