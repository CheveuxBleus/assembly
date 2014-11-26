.data
 .asciiz "Digite um número: "
 .asciiz "Divisores:\n"
 .asciiz "\n"
.text
main:	lui $4, 0x1001 #print a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe um num
	syscall
	add $5, $0, $2 #salva o num em $5
	addi $8, $2, 1 #salva o num+1 em $8
	addi $6, $0, 1 #$6 = 1
	addi $4, $4, 19 #print a segunda string
	addi $2, $0, 4
	syscall
teste:	beq $8, $6, fim
	div $5, $6
	mfhi $7
	bne $7, $0, mais
	add $4, $0, $6 #print $6 (divisor)
	addi $2, $0, 1 
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $4, $4, 31 
	addi $2, $0, 4
	syscall
mais:	addi $6, $6, 1
	j teste
fim:	nop