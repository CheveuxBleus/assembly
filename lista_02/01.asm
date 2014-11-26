.data
.asciiz "\n"

.text

main:	addi $7, $0, 1 #$7= 0(inicio- i)
	addi $8, $0, 101 #final- $8 = 101
teste:	beq $7, $8, fim #se $7(i) = $8 => fim
	add $4, $0, $7 #senao imprimi o valor de i
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi quebra de linha
	addi $2, $0, 4
	syscall
	addi $7, $7, 1 # incremento => i++
	j teste	#jump para o teste
fim:	nop