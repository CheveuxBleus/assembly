.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $6, $0, $2 
    	sub $7, $5, $6 #$5 - $6 =>$7
    	srl $8, $7, 31 #salva o bit de sinal no $8
    	beq $8, $0, maior #compara $8 com zero
    	beq $0, $0, fim
maior:	add $10, $0, $5
	add $5, $0, $6
	add $6, $0, $10
fim:	add $4, $0, $5
	addi $2, $0, 1 #imprime o valor que esta salvo no reg $4
    	syscall
    	add $4, $0, $6
	addi $2, $0, 1 #imprime o valor que esta salvo no reg $4
    	syscall
  	nop