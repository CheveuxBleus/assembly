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
    	sub $8, $5, $6 #$5-$6 => $8
    	srl $9, $8, 31 #salva o ultimo bit no reg $9
    	beq $9, $0, parte1 #compara $9 com zero
    	sub $8, $6, $7 #$6 - $7 => $8
    	srl $9, $8, 31 #salva o ultimo bit no reg $9
    	beq $9, $0, parte2 #compara com zero para saber quem é o maior
maior1: add $4, $0, $7
   	beq $0, $0, fim
parte1: sub $8, $5, $7 #$5 - $7 => $8
    	srl $9, $8, 31 #salva o ultimo bit no reg $9
    	beq $9, $0, maior2    	
    	beq $0, $0, maior1    	
parte2:	sub $8, $6, $7
    	srl $9, $8, 31
    	beq $9, $0, maior3
    	beq $0, $0, maior1    	
maior2:	add $4, $0, $5
    	beq $0, $0, fim    	
maior3:	add $4, $0, $6 	
fim:  	addi $2, $0, 1
    	syscall
	nop
