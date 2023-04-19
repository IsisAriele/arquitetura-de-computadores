.text
main:
addi  $2, $0, 12
syscall

#Primeira letra - MAIUSCULA
add $4, $2, -32 #H

addi  $2, $0, 12
syscall
add $5, $0, $2 #e

addi  $2, $0, 12
syscall
add $6, $0, $2 #ll

addi  $2, $0, 12
syscall
add $7, $0, $2 #o

addi  $2, $0, 12
syscall
add $8, $0, $2 #'\n'


#Primeira letra - MAIUSCULA
addi  $2, $0, 12
syscall
add $9, $0, $2
add $9, $9, -32 #W

addi  $2, $0, 12
syscall
add $10, $0, $2 #r

addi  $2, $0, 12
syscall
add $11, $0, $2 #d

print: 	addi $2, $0, 11
	syscall # Imprime na tela
	
	add $4, $0, $5
	addi $2, $0, 11
	syscall
	
	add $4, $0, $6
	addi $2, $0, 11
	syscall
	
	add $4, $0, $6
	addi $2, $0, 11
	syscall
	
	add $4, $0, $7
	addi $2, $0, 11
	syscall
	
	add $4, $0, $8
	addi $2, $0, 11
	syscall
	
	add $4, $0, $9
	addi $2, $0, 11
	syscall
	
	add $4, $0, $7
	addi $2, $0, 11
	syscall
	
	add $4, $0, $10
	addi $2, $0, 11
	syscall
	
	add $4, $0, $11
	addi $2, $0, 11
	syscall
	
end:	addi $2, $0, 10
	syscall #Encerra
	





