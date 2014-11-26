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
m30:	addi $8, $0, 30 #$8 = 30
	beq $5, $8, dia1 #se dia = 30 => dia1
	addi $5, $5, 1 #senao dia = dia+1
	beq $0, $0, fim
m31:	addi $8, $0, 31 #$8 = 31
	beq $5, $8, dia1 #se dia = 31 => dia1
	addi $5, $5, 1 #senao dia = dia+1
	beq $0, $0, fim	
m28:	addi $8, $0, 28 #$8 = 28
	addi $9, $0, 29 #$9 = 29
	beq $5, $9, dia1 #se dia = 29 => dia1
	beq $5, $8, bi #se dia = 28 => bissexto
	addi $5, $5, 1 #senao dia = dia+1
	beq $0, $0, fim
dia1:	addi $5, $0, 1 #dia = 1
	addi $9, $0, 12 #$9 = 12
	beq $6, $9, mes1 #se mes = 12 => mes1
	addi $6, $6, 1 #senao mes = mes +1
	beq $0, $0, fim	
mes1:	addi $6, $0, 1 #mes = 1
	addi $7, $7, 1 #ano = ano + 1
	beq $0, $0, fim	
bi:	addi $11, $0, 4 #$11 = 4
	addi $12, $0, 400 #$12 = 400
	addi $13, $0, 100 #$13 = 100
	div $7, $11 #ano / 4
	mfhi $14 #resto
	bne $14, $0, dia1 #se resto diferente de 0 => nao é bissexto => dia1
	div $7, $13 #senao ano/ 100
	mfhi $14 #resto
	beq $14, $0, teste #tem q ver se eh divisivel por 400
	add $5, $0, 29 #se nao for divisivel por 100, é bissexto e o dia = 29
	beq $0, $0, fim
teste:	div $7, $12 #ano / 400
	mfhi $14
	bne $14, $0, dia1 #se nao for divisivel por 400, nao é bissexto => dia1
	add $5, $0, 29 #se for divisivel por 400, é bissexto e o dia = 29
	beq $0, $0, fim
erro: 	add $4, $0, -1 #erro = -1
	add $2, $0, 1 #imprimi o valor no reg $4
	syscall
	beq $0, $0, fim2
fim:	add $4, $0, $5 #dia
	add $2, $0, 1 #imprimi o valor no reg $4
	syscall
	add $4, $0, $6 #mes
	add $2, $0, 1 #imprimi o valor no reg $4
	syscall
	add $4, $0, $7 #ano
	add $2, $0, 1 #imprimi o valor no reg $4
	syscall
fim2:	nop