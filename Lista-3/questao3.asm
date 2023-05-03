.text

main:
addi $8, $0, 1	# Incremento
addi $9, $0, 10	# Constante para parar
	
loop:
beq $0, $9, fim	# Verifica se nossa constante de parar é 0
	
add $4, $8, $0		
addi $2, $0, 1			
syscall			
	
add $4, $0, '\n'	
addi $2, $0, 11		
syscall			
	
subi $9, $9, 1	# Subtrai 1 a constante para parar
addi $8, $8, 1	# Soma 1 ao nosso incremento
j loop		# Volta para o loop
	
fim:
addi $2, $0, 10
syscall
