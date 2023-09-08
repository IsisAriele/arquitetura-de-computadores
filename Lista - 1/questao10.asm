.text
# Faça um programa que leia um caractere minúsculo e imprima o seu equivalente
# maiúsculo.
main: 	addi $2, $0, 12
	syscall #Lê caractere
	
maiusc: addi $4, $2, -32 #Tabela ascii subtração correspondente
	
print: 	addi $2, $0, 11
	syscall # Imprime na tela
	
end:	addi $2, $0, 10
	syscall #Encerra
	

	
	
	