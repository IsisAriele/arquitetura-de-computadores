.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2

mult:	mul $4, $2, $8
	addi $2, $0, 1
	syscall

end:	addi $2, $0, 10
	syscall