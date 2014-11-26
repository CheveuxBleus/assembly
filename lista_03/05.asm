.data
p1: 	.asciiz "\n"
p2: 	.asciiz "Estão acima da média:\n"
p3:	.asciiz "Digite 30 notas:\n"
p4:	.asciiz "Média da turma: "
p5:	.asciiz "Total acima da média: "
.text
main:	lui $4, 0x1001 #print a terceira string
	addi $4, $4, 0x19
	addi $2, $0, 4
	syscall
	addi $5, $0, 31 #$5 = 31(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	addi $10, $0, 30 #$10 = 30
teste:	beq $6, $5, print #se $6(inicio) = 21 => print
	addi $2, $0, 5 #recebe numero
	syscall
	add $12, $12, $2 #$12 = soma de todas as notas
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dado
	lui $4, 0x1001 #print a ultima string
	addi $4, $4, 0x2b
	addi $2, $0, 4
	syscall
	div $12, $10 	#soma / 30 = média
	mflo $12 	#$12 = média
	add $4, $0, $12 #print média 
	addi $2, $0, 1 
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $2, $0, 4
	syscall
	lui $4, 0x1001 	#print a segunda string
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
teste2:	beq $6, $5, fim #se $6(inicio) = 31 => fim
	lw $4, 0($7) 	#passa os dados para o registrador $4	
	slt $13, $4, $12 #se nota >= media entao $13 = 0
	beq $13, $0, print2
	j inc
print2:	addi $2, $0, 1 	#print o dado
	syscall
	addi $14, $14, 1 #qtd de notas acima da media	
	lui $4, 0x1001 #print quebra de linha
	addi $2, $0, 4
	syscall
inc:	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste2
fim: 	lui $4, 0x1001 #print a ultima string
	addi $4, $4, 0x3c
	addi $2, $0, 4
	syscall
	add $4, $0, $14 #print total acima da media
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
