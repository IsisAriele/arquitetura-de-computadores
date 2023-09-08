.text
# Faça um programa que leia três números inteiros, representando a duração em horas,
# minutos e segundos de um experimento científico e informe essa duração em
#segundos.
main: 	addi $2, $0, 5
	syscall
	add $5, $0, $2 #Horas
	addi $2, $0, 5
	syscall
	add $6, $0, $2 #Minutos
	addi $2, $0, 5
	syscall
	add $7, $0, $2 #Segundos

hora:	addi $8, $0, 3600
	mul $5, $5, $8

minutos:addi $9, $0, 60
	mul $6, $6, $9

soma:	add $4, $5, $6
	add $4, $4, $7

print: 	addi $2, $0, 1
	syscall
	
end: 	addi $2, $0, 10
	syscall

	