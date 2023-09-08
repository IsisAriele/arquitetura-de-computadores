.text
main:	addi $2, $0, 5
	syscall # le o primeiro numero
	add $8, $0, $2 # Trasnfiro pra reg 8
	addi $2, $0, 5
	syscall #le o segundo numero
mult:	mul $4, $8, $2
	addi $2, $0, 1
	syscall #imprime a multiplicacao
end:	addi $2, $0, 10
	syscall