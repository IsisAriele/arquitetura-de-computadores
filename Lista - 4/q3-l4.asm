# Fa�a uma fun��o chamada DesenhaLinha. Ele deve desenhar uma linha
# na tela usando v�rios s�mbolos de igual (Ex: ========). 
# A fun��o recebe por par�metro quantos 
# sinais de igual ser�o mostrados.

.text

main:
addi $2, $0, 5
syscall
jal desenhaLinha

fim:
addi $2, $0, 10
syscall

desenhaLinha:
add $8, $0, $2
addi $9, $0, 1 # Contador
for:
beq $8, $0, fimDaLinha
addi $4, $0, '='
addi $2, $0, 11
syscall

sub $8, $8, $9
j for

fimDaLinha:
jr $31

