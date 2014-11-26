.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 #dia => $5
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $6, $0, $2 #mes => $6
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $7, $0, $2	#ano => $7
    	blez $5, erro #se dia <= 0 - erro
    	blez $6, erro #se mes <= 0 - erro
    	blez $7, erro #se ano <= 0 - erro
    	addi $19, $0, 1
    	addi $20, $0, 2
    	addi $21, $0, 3
    	addi $22, $0, 4
    	addi $23, $0, 5
    	addi $24, $0, 6
    	addi $25, $0, 7
    	addi $26, $0, 8
    	addi $27, $0, 9
    	addi $28, $0, 10
    	addi $29, $0, 11
    	addi $30, $0, 12
    	beq $6, $19, m31 #janeiro => 31
    	beq $6, $20, m28
    	beq $6, $21, m31
    	beq $6, $22, m30
    	beq $6, $23, m31
    	beq $6, $24, m30
    	beq $6, $25, m31
    	beq $6, $26, m31
    	beq $6, $27, m30
    	beq $6, $28, m31
    	beq $6, $29, m30
    	beq $6, $30, m31
	beq $0, $0, erro #se for maior que 12 => erro
m30:	subi $10, $5, 31 #dia - 31
	srl $10, $10, 31
	beq $10, $0, erro #se for >= 0 - erro
	add $4, $0, 1
	beq $0, $0, fim
m31:	subi $10, $5, 32 #dia - 32
	srl $10, $10, 31
	beq $10, $0, erro #se for >= 0 - erro
	add $4, $0, 1
	beq $0, $0, fim
m28:	subi $10, $5, 29 #dia - 29
	srl $10, $10, 31
	beq $10, $0, bi #pode ser bissexto
	add $4, $0, 1
	beq $0, $0, fim
bi:	addi $11, $0, 4 #$11 = 4
	addi $12, $0, 400 #$12 = 400
	addi $13, $0, 100 #$13 = 100
	div $7, $11 #ano / 4
	mfhi $14 #resto
	bne $14, $0, erro #se resto diferente de 0 => erro
	div $7, $13 #senao ano/ 100
	mfhi $14 #resto
	beq $14, $0, teste #tem q ver se eh divisivel por 400
	beq $0, $0, m29 #pode ser 29
teste:	div $7, $12 #ano / 400
	mfhi $14
	beq $14, $0, m29 #se for 0, é bissexto
	beq $0, $0, erro
m29:	subi $10, $5, 30  #dia - 30
	srl $10, $10, 31
	beq $10, $0, erro #se for >= 0 - erro
	add $4, $0, 1
	beq $0, $0, fim
erro: 	add $4, $0, -1 #erro = -1
fim:	add $2, $0, 1 #imprimi o valor no reg $4
	syscall
	nop