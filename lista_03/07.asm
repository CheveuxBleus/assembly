.data
p1: 	.asciiz "Digite 10 números:\n"
p2:	.asciiz " é o maior número\n"
p3:	.asciiz "Índice do maior: "
p4:	.asciiz " é o menor número\n"
p5:	.asciiz "Índice do menor: "
p6:	.asciiz "\n"
.text
main:	lui $4, 0x1001 #print "Digite 10 números"
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	#$15 = maior / $16 = indice maior/ $17 = menor / $18 = indice menor
teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dadosyscall
	lw $15, 0($7) 	#passa o primeiro dado para o registrador $15
	add $17, $0, $15 #passa o primeiro dado para o registrador $17
	subi $16, $6, 1 #passa o indice para o $16
	subi $18, $6, 1 #passa o indice para o $16
	addi $5, $0, 10 #$5 = fim = 10
teste2:	beq $6, $5, fim #se $6(inicio) = 11 => fim
	addi $6, $6, 1 #incremento $6
	addi $7, $7, 4 #incremento $7
	lw $4, 0($7) 	#passa os dados para o registrador $4	
	slt $13, $4, $15 #se num < que $15 = 1, se num > $15 = 0;
	beq $13, $0, troca
	slt $13, $17, $4 #se $17 < num = 1, senao = 0
	beq $13, $0, troca2
	j teste2
troca:	add $15, $0, $4 #salva o num em $15
	subi $16, $6, 1 #passa o indice para o $16
	j teste2
troca2:	add $17, $0, $4 #salva o num em $15
	subi $18, $6, 1 #passa o indice para o $16
	j teste2	
fim: 	add $4, $0, $15 #print o maior numero
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print segunda string
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	lui $4, 0x1001 #print terceira string
	addi $4, $4, 0x27
	addi $2, $0, 4
	syscall
	add $4, $0, $16 #print o valor do indice
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $4, $4, 0x5e
	addi $2, $0, 4
	syscall
	add $4, $0, $17 #print o menor numero
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print quarta string
	addi $4, $4, 0x39
	addi $2, $0, 4
	syscall
	lui $4, 0x1001 #print quinta string
	addi $4, $4, 0x4c
	addi $2, $0, 4
	syscall
	add $4, $0, $18 #print o valor do indice
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
