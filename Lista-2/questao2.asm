.text
main: addi $2, $0, 5
      syscall
      add $8, $0, $2 # lê inteiro
      srl $9, $8, 31 # Guarda bit mais significativo
     
      beq $9, $0, posit #Se bit mais signficativo = , salta para rotulo posit
neg:        
      mul $4, $8, $8 #quadrado
     
      j fimif
posit:
      sll $4, $8, 1  #dobro

fimif: addi $2, $0, 1
       syscall

                                                                                                 
      addi $2, $0, 10
      syscall