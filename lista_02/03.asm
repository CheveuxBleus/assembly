.text

main:	addi $7, $0, 1 #$7= 0(inicio- i)
	addi $8, $0, 201 #final- $8 = 201
teste:	beq $7, $8, fim #se $7(i) = $8 => fim
	add $9, $9, $7 #$9(soma) = $9 + $7(i)
	addi $7, $7, 1 #incremento => i++
	j teste	#jump para o teste
fim:	add $4, $0, $9
	addi $2, $0, 1
	syscall
	nop
