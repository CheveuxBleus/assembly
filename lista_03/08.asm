.data

p1: 	.asciiz "Digite 10 números:\n"
p2:	.asciiz "Maior número: "
p3:	.asciiz "Índice do maior número: "
p4:	.asciiz "Último número: "
p5:	.asciiz "Array modificado: \n"
p6:	.asciiz "\n"
p7:	.asciiz " "

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite 10 números"
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	
#recebe os 10 numeros e salva na memória	
#$15 = maior / $16 = indice maior/ $17 = ultimo numero

teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste

#procura o maior número e o seu índice

print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dados
	lw $15, 0($7) 	#passa o primeiro dado para o registrador $15
	subi $16, $6, 1 #passa o indice para o $16
	addi $5, $0, 10 #$5 = fim = 10	
	
teste2:	beq $6, $5, print2 #se $6(inicio) = 11 => fim
	addi $6, $6, 1 #incremento $6
	addi $7, $7, 4 #incremento $7
	lw $4, 0($7) 	#passa os dados para o registrador $4	
	slt $13, $4, $15 #se num < que $15 = 1, se num > $15 = 0;
	beq $13, $0, troca
	j teste2
	
#salva o maior número no $15 e o índice no $16
	
troca:	add $15, $0, $4 #salva o num em $15
	subi $16, $6, 1 #passa o indice para o $16
	j teste2	
	
#salva o ultimo número no $17

print2:	add $17, $0, $4 #salva o ultimo num no $17

#Print resultados

	lui $4, 0x1001 #print "Maior número:"
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	add $4, $0, $15 #print o valor do maior numero
	addi $2, $0, 1
	syscall
	jal qdl
	
	lui $4, 0x1001 #print "Índice do maior número: "
	addi $4, $4, 0x23
	addi $2, $0, 4
	syscall
	add $4, $0, $16 #print o valor do índice
	addi $2, $0, 1
	syscall
	jal qdl
	
	lui $4, 0x1001 #print "Último número:"
	addi $4, $4, 0x3c
	addi $2, $0, 4
	syscall
	add $4, $0, $17 #print o valor do ultimo número
	addi $2, $0, 1
	syscall
	jal qdl
	
	lui $4, 0x1001 #print "Array modificado: \n"
	addi $4, $4, 0x4c
	addi $2, $0, 4
	syscall
	
#troca os lugares do maior número com o ultimo numero e vice versa	
	
muda:	beq $15, $17, print3 #se o ultimo numero = ao maior numero => pula
	mul $18, $16, 4 #achar o endereço do maior número => indice * 4
	lui $7, 0x1002
	add $7, $7, $18 #endereço do maior numero
	sw $17, 0($7) #sobrescrevi o ultimo numero no endereço do maior numero
	lui $7, 0x1002
	addi $7, $7, 36 #endereço do ultimo numero
	sw $15, 0($7) #sobrescrevi o maior numero no endereço do ultimo numero
	
#print o novo array

print3:	lui $7, 0x1002
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	
teste3:	beq $5, $6, fim
	lw $4, 0($7) #$4 recebe o dado da memória
	addi $2, $0, 1 #print o valor
	syscall
	jal space
	addi $6, $6, 1 #incremento do $6
	addi $7, $7, 4 #incremento do $7
	j teste3

fim:	addi $2, $0, 10
	syscall

#print quebra de linha

qdl:	lui $4, 0x1001 
	addi $4, $4, 0x60
	addi $2, $0, 4
	syscall
	jr $31
	
#print espaço
	
space:	lui $4, 0x1001 
	addi $4, $4, 0x62
	addi $2, $0, 4
	syscall
	jr $31