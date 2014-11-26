.text
main:
	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 #salva o valor do reg $2 no reg $5
    	addi $2, $0, 5 #ler um valor digitado
    	syscall
    	add $6, $0, $2
    	beq $5, $6, iguais #compara os valores do reg $5 e do reg $6
    	addi $4, $0, 1
    	beq $0, $0, fim #finaliza
iguais:	addi $4, $0, 0 
fim:    addi $2, $0, 1 #ler o valor que se encontra no registrador $4
	syscall
	nop
