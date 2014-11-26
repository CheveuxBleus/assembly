.data

p1: 	.asciiz "Digite um array com 20 elementos:\n"
p2: 	.asciiz "Maior diferença: "
p3:	.asciiz "\nÍndice 1: "
p4:	.asciiz "\nÍndice 2: "

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite um array com 20 elementos:\n" - p1
	addi $2, $0, 4
	syscall
	addi $8, $0, 20 #$8 = 20
	lui $9, 0x1002 #endereço para salvar na memória
	addi $20, $0, 1 #$20 = 1
	
#recebe os 20 numeros e salva na memória 

teste:	beq $8, $0, dif #se $8(inicio) = 0 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 4 #incrementa o valor do $9
	sub $8, $8, $20 #decremento do $8
	j teste
	
#encontra onde está a diferença
# $10 = diferença / $11 = indice1 / $12 = indice2 / $13 = contador
	
dif:	addi $8, $0, 19 #$8 = 20
	lui $9, 0x1002 #endereço para salvar na memória
	addi $13, $0, 0 #contador = 0
	addi $10, $0, 0 #zerar dif
	
teste2:	beq $8, $0, print #se $8(inicio) = 0 => print
	lw $14, 0($9) #salva no $14 o valor do indice1
	addi $9, $9, 4
	lw $15, 0($9) #salva no $15 o valor do indice2
	slt $16, $14, $15
	beq $16, $0, inc
	sub $18, $15, $14 #ind2 - ind1 = dif => salvei a diferença no $16
	slt $17, $18, $10 #se dif > $10 => troca
	beq $17, $0, troca
	j inc
	
troca:	add $10, $0, $18 #dif passa pro $10
	sub $11, $13, $20 #$11 recebe contador - 1
	add $12, $0, $13 #$12 recebe contador
	
inc:	addi $13, $13, 1 #contador => $13++ = indice 1
	sub $8, $8, $20 #decremento do $8
	j teste2
	
#Print diferença e os indices

print:	lui $4, 0x1001 #print "Maior diferença: " - p2
	addi $4, $4, 0x23
	addi $2, $0, 4
	syscall
	add $4, $0, $10 #print diferença (salva no $10)
	addi $2, $0, 1
	syscall
	
	lui $4, 0x1001 #print "\nÍndice 1: " - p3
	addi $4, $4, 0x35
	addi $2, $0, 4
	syscall
	add $4, $0, $11 #print indice1 (salvo no $11)
	addi $2, $0, 1
	syscall
	
	lui $4, 0x1001 #print "\nÍndice 2: " - p4
	addi $4, $4, 0x41
	addi $2, $0, 4
	syscall
	add $4, $0, $12 #print indice2 (salvo no $12)
	addi $2, $0, 1
	syscall
	
fim:	addi $2, $0, 10
	syscall
