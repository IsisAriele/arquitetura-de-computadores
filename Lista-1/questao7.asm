.text

main: 	addi $2, $0, 5
      	syscall

div1000: addi $4, $0, 1000
	div $2, $4
	mflo $5 #Milhar
	mfhi $6 #Resto
	
div100: addi $4, $0, 100
	div $6, $4
	mflo $7 #Centena
	mfhi $8 #Resto

div10: 	addi $4, $0, 10
	div $8, $4
	mflo $9 #Dezena
	mfhi $10 #Unidade

print: 	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	add $4, $0, $7
	addi $2, $0, 1
	syscall
	
	add $4, $0, $5
	addi $2, $0, 1
	syscall

end:    addi $2, $0, 10
	syscall