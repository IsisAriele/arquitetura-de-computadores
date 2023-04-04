.text

main: 	addi $2, $0, 5
	syscall # le um inteiro para $2, usuário digita valor que vai parar em $2
	add $8, $0, $2 # copia para $8
	addi $2, $0, 5
	syscall #le outro inteiro para $2
	
soma: 	add $9, $2, $8 #soma os números lidos
	add $4, $0, $9 # $4 <- $9
	addi $2, $0, 1
	syscall # imprime o valor em $4
	addi $2, $0, 10
	
fim: 	syscall # termina a execução do programa


