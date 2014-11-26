.text
main:
    	addi $2, $0, 5 #ler um valor digitado
    	syscall
    	beq $2, $0, nulo #compara o valor com zero
    	srl $5, $2, 31 #empurra 31 bit para a direita e salva no registrador $5
    	beq $5, $0, positivo #compara o valor com zero
        addi $4, $0, -1 
       	beq $0, $0, fim #finaliza
nulo:   addi $4, $0, 0
        beq $0, $0, fim
positivo:addi $4, $0, 1
fim:    addi $2, $0, 1 #ler o valor que se encontra no registrador $4
	syscall
	nop
 