.text

main:
addi $2, $0, 5
syscall # Leitura do dado
andi $8, $2, 1 # Verifica o bit menos significativo, se impar = 1, se par =0;
beq $8, $0, par #Verifica se o dado em $8 é 0, se sim salta para rotulo par;

impar:
$4, $0, 'i'
j print

par:
$4, $0, 'p'

print:
addi $2, $0, 11
syscall

end:
addi $2, $0, 10
syscall