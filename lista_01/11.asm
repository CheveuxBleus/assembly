.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 #valor1 => $5
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $6, $0, $2 #valor2 => $6
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $7, $0, $2	#valor3 => $7
    	sub $10, $5, $6 #$5 - $6 => $10
    	srl $10, $10, 31
    	beq $10, $0, parte1 #$5 > $6
    	add $25, $0, $6 #maior para o $25
	add $23, $0, $5 #menor para o $23
	beq $0, $0, parte2
parte1:	add $25, $0, $5 #maior para o $25
	add $23, $0, $6 #menor para o $23
parte2:	sub $11, $25, $7 # o maior - $7 => $11
	srl $11, $11, 31
	beq $11, $0, parte3 #o maior($25) > $7
	add $24, $0, $25 #$25 => $24
	add $25, $0, $7 #$7 => $25
	beq $0, $0, fim
parte3:	sub $12, $7, $23 #$7 - $23(o menor) => $12
	srl $12, $12, 31
	beq $12, $0, parte4 #$7 > $23
	add $24, $0, $23 #$23 => $24
	add $23, $0, $7 #$7 => $23
	beq $0, $0, fim		
parte4:	add $24, $0, $7 #$7 => $24
fim:	add $4, $0, $25
	add $2, $0, 1 #imprimi o maior
	syscall
	add $4, $0, $24 #imprimi o medio
	add $2, $0, 1
	syscall
	add $4, $0, $23 #imprimi o menor
	add $2, $0, 1
	syscall
	nop