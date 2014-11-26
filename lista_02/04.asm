.data
.asciiz "\n"
.text

main:	
	addi $7, $0, 1 #inicio = 1
	addi $8, $0, 40 #final- $8 = 40
	addi $9, $0, 2 # $9 = 2
teste:	
	beq $11, $8, fim #se $11(contador) = $8 => fim
	div $7, $9
	mfhi $10
	beq $10, $0, imprimi
	j incremento
imprimi:
	add $4, $0, $7 #imprimi o numero
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi quebra de linha
	addi $2, $0, 4
	syscall
	addi $11, $11, 1 #contador = contador + 1
incremento:
	addi $7, $7, 1 #incremento => i++
	j teste	#jump para o teste
fim:	
	nop