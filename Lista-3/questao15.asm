.text

main:	
addi $2, $0, 5
syscall	
add $16, $0, $2 
	
addi $8, $0, 1 # inicialização do primeiro número da sequência Fibonacci
addi $9, $0, 1 # inicialização do segundo número da sequência Fibonacci
addi $10, $0, 1
	
for1: 
beq $16, $0, fim
addi $10, $0, 0 
	  
for:
beq $10, $9 quebradelinha 
add $4, $8, $0
addi $2, $0, 1	
syscall
	  
addi $4, $0, ' '
addi $2, $0, 11
syscall
	  
add $11, $8, $9 
add $8, $9, $0 
add $9, $11, $0 
addi $10, $10, 1 
j for
	  
quebradelinha:  
addi $4, $0, '\n'
addi $2, $0, 11
syscall		
		
addi $9, $9, 1 
addi $16, $16, -1 
j for1
	  	
fim:	
addi $2, $0, 10
syscall