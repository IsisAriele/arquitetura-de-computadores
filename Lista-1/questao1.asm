.text

main: 	addi $2, $0, 5
	syscall #ler o numero
	sll $4, $2, 1 #deslocando multiplico o valor por 2 e armazeno em reg 4
	
print:	addi $2, $0, 1
	syscall #imprime na tela o valor armazenado em $4

end:	addi $2, $0, 10
	syscall 