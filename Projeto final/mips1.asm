.text
main: lui $8, 0x1001
      addi $9, $0, 512  # unidades gráficas
      addi $10, $0, 0x0ff
for:  beq $9, $0, fim
      sw $10, 0($8)
      sw $10, 2048($8)
     
      addi $4, $0, 1000
      addi $5, $0, 0x00ffffff
      addi $2, $0, 42
      syscall
      add $10, $4, $0 #o registrador que guarda a cor recebe outra cor
     
      addi $8, $8, 4
      addi $9, $9, -1      
      j for
fim:  addi $20, $0, 0x00ffffff
      lui $21, 0x1001
      sw $20, 0($21)
     
      addi $22, $0, 512
fmv:  beq $22, $0, sai2
      lw $23, 2048($21)
      sw $23, 0($21)
      addi $21, $21, 4
      sw $20, 0($21)
      jal sleep
      addi $22, $22, -1
      j fmv
sai2:                  
      addi $2, $0, 10
      syscall      
     
sleep: addi $15, $0, 8000
forsleep: beq $15, $0, fimsleep
          nop
          nop
          nop
          nop
          addi $15, $15, -1
          j forsleep  
fimsleep: jr $31