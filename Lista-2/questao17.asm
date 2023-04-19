.text
main: addi $2, $0, 5
      syscall
      add $8, $0, $2
      addi $25, $0, 10
      div $8, $25
      mfhi $10  # menos sig país
      mflo $8
      div $8, $25
      mfhi $9  # meio do país
      mflo $8 # mais sig país
      #=======================
      addi $2, $0, 5
      syscall
      add $11, $0, $2
      div $11, $25
      mfhi $15  # menos sig empres
      mflo $11
      div $11, $25
      mfhi $14  # meio do empres
      mflo $11
      div $11, $25
      mfhi $13  # meio do empres
      mflo $11
      div $11, $25
      mfhi $12  # meio do empres
      mflo $11  # mais sig empres
      #=======================
      addi $2, $0, 5
      syscall
      add $16, $0, $2
      div $16, $25
      mfhi $19  # menos sig prod
      mflo $16
      div $16, $25
      mfhi $18  # meio do prod
      mflo $16
      div $16, $25
      mfhi $17  # meio do prod
      mflo $16  # mais sig prod
      #==========================
      add $20, $9, $11
      add $20, $20, $13
      add $20, $20, $15
      add $20, $20, $17
      add $20, $20, $19
      sll $21, $20, 1
      add $20, $21, $20
     
      add $21, $8, $10
      add $21, $21, $12
      add $21, $21, $14
      add $21, $21, $16
      add $21, $21, $18
     
      add $20, $20, $21
     
      div $20, $25
     
      mfhi $21
      sub $21, $0, $21 #0-resto
      srl $21, $21, 31
     
      mflo $22
      add $21, $21, $22
      mul $21, $21, $25
      sub $4, $21, $20
      addi $2, $0, 1
      syscall
     
      addi $2, $0, 10
      syscall