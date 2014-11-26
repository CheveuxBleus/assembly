.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $6, $0, $2
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $7, $0, $2	
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $8, $0, $2
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $9, $0, $2	
    	sub $10, $5, $6 #$5 - $6
    	srl $11, $10, 31
    	beq $11, $0, parte1 #$5 > $6
    	add $24, $0, $5 #$6 > $5 => menor no $24
    	add $25, $0, $6 #maior no $25
    	beq $0, $0, parte2 
parte1:	add $24, $0, $6 #menor no $24
    	add $25, $0, $5 #maior no $25
parte2:	sub $12, $7, $8 #$7 - $8
	srl $12, $12, 31
	beq $12, $0, parte3 #$7 > $8
	add $23, $0, $8 #$8 > $7 => maior no $23
	add $22, $0, $7 #menor no $22
	beq $0, $0, parte4 #$6 > $5
parte3:	add $23, $0, $7 #maior no $23
	add $22, $0, $8 #menor no $22
parte4:	sub $13, $25, $23 # maior1 - maior2 ($25 - $23)
	srl $13, $13, 31
	beq $13, $0, maior1 #$25 é maior
	add $21, $0, $23 #$23 é maior e é salvo no $21
	beq $0, $0, menor
maior1:	add $21, $0, $25 #o maior é salvo no $21
menor:	sub $14, $24, $22 #menor1 - menor2 ($24 - $22)
	srl $14, $14, 31
	beq $14, $0, menor1 #$22 é o menor
	add $20, $0, $24 #$24 é o menor e é salvo no $20
	beq $0, $0, parte5
menor1:	add $20, $0, $22 #o menor é salvo no $20
parte5:	sub $15, $21, $9 # $21 - $9 (o maior - $9)
	srl $15, $15, 31
	beq $15, $0, menor2 #$21 > $9
	add $25, $0, $9 #$9 é o maior de todos e é salvo no $25
	add $24, $0, $20 #$20 é o menor de todos e é salvo no $24
	beq $0, $0, fim
menor2:	add $25, $0, $21 #$21 é o maior de todos e é salvo no $25
	sub $16, $20, $9 #o menor($20) - $9
	srl $16, $16, 31
	beq $16, $0, menor3 #$20 > $9
	add $24, $0, $20 #$20 é o menor de todos e é salo no $24
	beq $0, $0, fim
menor3:	add $24, $0, $9 #$9 é o menor de todos e é salo no $24
fim:	add $4, $0, $25 #o maior vai para o $4
	add $2, $0, 1 #imprimi o maior
	syscall
	add $4, $0, $24 #o menor vai para o $4
	add $2, $0, 1 #imprimi o menor
	syscall
	nop
	
	
	
	
	
	