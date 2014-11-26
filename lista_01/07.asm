.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 #salva o valor no reg $5
    	addi $6, $0, 2 
    	div $5, $6 #valor dividido por 2
    	mfhi $7 #resto da divisao => $7
    	beq $7, $0, par #se resto = 0, entao é par
    	add $4, $0, 1 #senao é impar e imprimi 1
    	beq $0, $0, fim 
par:	add $4, $0, 2 #se for par imprimi 2
fim:	add $2, $0, 1
	syscall
	nop