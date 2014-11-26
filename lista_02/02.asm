.data
.asciiz "\n"

.text

main:	addi $7, $0, 200 #$7= 100(inicio- i)
teste:	beq $7, $0, fim #se $7(i) = $0(0) => fim
	add $4, $0, $7 #senao imprimi o valor de i
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi quebra de linha
	addi $2, $0, 4
	syscall
	subi $7, $7, 1 # incremento => i--
	j teste	#jump para o teste
fim:	nop