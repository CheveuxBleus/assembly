.data
.asciiz "Numero:"
.asciiz "\nSoma:"
.text
main:	lui $4, 0x1001 #imprimi string "Numero:"
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe numero
	syscall
	add $5, $0, $2 #salva numero no $5
	addi $7, $0, 1 #$7= 1(inicio- i)
	addi $8, $5, 1 #final- $8 = numero +1
teste:	beq $7, $8, fim #se $7(i) = $8 => fim
	add $9, $9, $7 #$9(soma) = $9 + $7(i)
	addi $7, $7, 1 #incremento => i++
	j teste	#jump para o teste
fim:	addi $4, $4, 9 #imprimi string "soma"
	addi $2, $0, 4
	syscall
	add $4, $0, $9 #imprimi valor da soma
	addi $2, $0, 1
	syscall
	nop