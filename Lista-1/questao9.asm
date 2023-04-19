.text
# Faça um programa que leia um número inteiro, representando a duração em segundos
# de um experimento científico e imprima o tempo decorrido nesse experimento no
# formato h:m:s.
main: 	addi $2, $0, 5
	syscall

horas: 	addi $7, $0, 3600
	div $2, $7
	mflo $8 #Horas
	mfhi $4 #Resto
	
minutos:addi $7, $0, 60
	div $4, $7
	mflo $9 #Minutos
	mfhi $10 #Resto dos segundos
	
print: 	add $4, $0, $8
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ':'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ':'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
end: 	addi $2, $0, 10
	syscall

	

	