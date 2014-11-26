.data

p1: 	.asciiz "Digite 10 numeros:\n"
p2: 	.asciiz "Quantidade de elementos diferentes:\n"
p3:	.asciiz "\nArray:\n"
p4:	.asciiz " "

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite 10 numeros:\n" - p1
	addi $2, $0, 4
	syscall
	addi $8, $0, 10 #$8 = 10
	lui $9, 0x1002 #endereço para salvar na memória
	addi $10, $0, 1 #10 = 1
	
#recebe os 10 numeros e salva na memória => Primeiro array

teste:	beq $8, $0, cont #se $8(inicio) = 0 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 4 #incrementa o valor do $9
	sub $8, $8, $10 #decremento do $8
	j teste
	
#Cria um segundo array com numeros diferentes
#$11 - contador ; $12 - num para comparar ; $13 - indice
	
cont:	addi $8, $0, 10 #$8 = 10
	addi $13, $0, 0 #zerar indice
	addi $11, $0, 0 #zerar contador
	
teste2:	beq $8, $0, print #se $8(inicio) = 0 => print
	lui $9, 0x1002 #endereço para salvar na memória
	mul $14, $13, 4 #multiplicar 4 pelo indice para achar o endereço
	add $9, $9, $14
	lw $12, 0($9) #salva num em $12
	j comp
add1:	lui $9, 0x1002 #endereço para salvar na memória
	addi $9, $9, 40 #começo do segundo array
	mul $14, $11, 4 #multiplicar 4 pelo contador para achar o endereço
	add $9, $9, $14
	sw $12, 0($9) #salva no segundo array
	addi $11, $11, 1 #incremento do contador	
inc:	addi $13, $13, 1 #incremento do indice
	sub $8, $8, $10 #decremento do $8
	j teste2
	
#Print resultados

print:	lui $4, 0x1001 #print "Quantidade de elementos diferentes:\n" - p2
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	add $4, $0, $11 #print valor contador
	addi $2, $0, 1
	syscall

#Print Array de numeros diferentes	
			
	lui $4, 0x1001 #print "\nArray:\n" - p3
	addi $4, $4, 0x39
	addi $2, $0, 4
	syscall

 	lui $9, 0x1002 #endereço do segundo array
	addi $9, $9, 40
	add $8, $0, $11 #$8 recebe contador
	
loop2:	beq $8, $0, fim
	lw $4, 0($9) #$4 recebe num
	addi $2, $0, 1 #print num
	syscall
	lui $4, 0x1001 #print espaço - p4
	addi $4, $4, 0x42
	addi $2, $0, 4
	syscall
	sub $8, $8, $10 #decremento do $8
	addi $9, $9, 4 #incremento no endere�o
	j loop2

fim:	addi $2, $0, 10
	syscall
	
#COMPARADOR
#$11 - contador ; $12 - num para comparar ; $13 - indice ; $20 = indice2; $21 recebe num para comparar;

comp:	addi $20, $0, 0 #zerar $20
	lui $9, 0x1002  #zera o endereço na memoria
	
loop:	beq $13, $20, add1 #qd o indice2 for igual ao indice1 = termina
	lw $21, 0($9) #salva num em $21
	beq $21, $12, inc #compara esse numero com o numero recebido, se igual, pula para incremento
	addi $20, $20, 1 #incremento do indice2
	addi $9, $9, 4 #incremento do endereço na memória	
	j loop
	
	
