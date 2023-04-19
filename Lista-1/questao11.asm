.text

main: 	addi $2, $0, 5
	syscall
	
div100: addi $4, $0, 100
	div $2, $4
	mflo $7 #Primeiro numero 
	mfhi $5 #Resto
	
div10:	addi $4, $0, 10
	div $5, $4
	mflo $8 #Segundo
	mfhi $9 #Terceiro
	
print:	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	
	add $4, $0, $7
	addi $2, $0, 1
	syscall
	
end:	addi $2, $0, 10
	syscall
	
	
