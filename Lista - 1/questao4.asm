.text
main:	addi $2, $0, 5
	syscall #primeira nota
	add $8, $0, $2
	addi $2, $0, 5
	syscall #segunda nota
	add $9, $0, $2

pesos: 	addi $2, $0, 5
	syscall #peso 1
	add $3, $0, $2
	addi $2, $0, 5
	syscall #peso 2
	
mpesos:	mul $8, $8, $3 #multiplica primeira nota pelo peso 1
	mul $9, $9, $2 #multiplica segunda nota pelo peso 2
	add $9, $9, $8 #soma ambas multiplicações

div:	add $7, $3, $2 #peso 1 + peso 2
	div $9, $7 #divisao final da média ponderada
	mflo $4 #armazena o que esta no lo (valor do consciente da div) em reg 4
	
print: 	addi $2, $0, 1
	syscall # imprime o que esta em reg 4

end:	addi $2, $0, 10
	syscall
	
	