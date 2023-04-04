.text

main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2

#Divisão dos números em centenas, dezenas e unidades.
divs:	addi $6, $0, 100
	div $8, $6
	mflo $9 #Centena, primeiro digito a ser impresso
	mfhi $10 #Resto
	addi $7, $0, 10
	div $10, $7
	mflo $8 #Dezena, segundo digito a ser impresso
	mfhi $7 #Unidade, terceiro digito a ser impresso

print:  add $4, $0, $9
	addi $2, $0, 1
	syscall
	    
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	    
	add $4, $0, $7
	addi $2, $0, 1
	syscall
	    
end:    addi $2, $0, 10
	syscall
	    
	
	