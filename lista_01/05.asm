.text
main:
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $5, $0, $2 #salva a primeira nota no reg $5
    	addi $2, $0, 5 #ler um valor digitado e salva no reg $2
    	syscall
    	add $6, $0, $2 #salva a segunda nota no reg $6
    	addi $7, $0, 2 #$7 = 2
    	addi $8, $0, 3 #$8 = 3
    	addi $9, $0, 5 #$9 = 5
	mult $5, $7
	mflo $10 # n1 * 2 => $10
	mult $6, $8
	mflo $11 # n2 * 3 => $11
	add $12, $10, $11 #$12 =>(n1*2) + (n2*3)
	div $12, $9 
	mflo $13 #$13 => media
	subi $14, $13, 6 # média - 6 => $14
	srl $15, $14, 31 #salva o ultimo bit no reg $15
    	beq $15, $0, passou
    	addi $4, $0, -1 #nao passou por media
    	beq $0, $0, fim
passou:	add $4, $0, 1
fim: 	addi $2, $0, 1
	syscall 
	nop