.text

main: 	addi $2, $0, 5
      	syscall		#le o numero
      
div100: addi $5, $0, 100
	div $2, $5 #Divisão do número lido por 100
	mflo $6 #Consciente
	mfhi $7 #Resto
	
div10:	addi $8, $0, 10
	div $7 $8 #Divisão do resto por 10
	mflo $9 #consciente
	mfhi $10 #resto
	
soma: 	add $4, $6, $9 #soma do primeiro com o segundo algarismo
	add $4, $4, $10 #soma com ultimo algarismo
	
imprime:addi $2, $0, 1
	syscall	   #imprime o resultado

fim: 	addi $2, $0, 10
	syscall	  #fim