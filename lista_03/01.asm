.data
p: 	.asciiz "\n"
p1: 	.asciiz "Digite 10 números:\n"
p2: 	.asciiz "Números digitados:\n"
.text
main:	lui $4, 0x1001 #print a segunda string
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dado
	lui $4, 0x1001 #print a terceira string
	addi $4, $4, 0x16 #
	addi $2, $0, 4
	syscall
teste2:	beq $6, $5, fim #se $6(inicio) = 11 => fim
	lw $4, 0($7) #passa os dados para o registrador $4
	addi $2, $0, 1 #print o dado
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $2, $0, 4
	syscall
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste2
fim: 	nop
