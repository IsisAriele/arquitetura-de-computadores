.text
# Fa�a um programa que leia um caractere min�sculo e imprima o seu equivalente
# mai�sculo.
main: 	addi $2, $0, 12
	syscall #L� caractere
	
maiusc: addi $4, $2, -32 #Tabela ascii subtra��o correspondente
	
print: 	addi $2, $0, 11
	syscall # Imprime na tela
	
end:	addi $2, $0, 10
	syscall #Encerra
	

	
	
	