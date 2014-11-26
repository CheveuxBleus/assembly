.data
 .asciiz "Digite a nota 1:"
 .asciiz "Digite a nota 2:"
 .asciiz " alunos passaram\n"
 .asciiz " alunos não passaram"
.text
main:	addi $19, $0, -1 #$19 = -1 (parametro para finalizar)
	addi $7, $0, 2 #$7 = 2
    	addi $8, $0, 3 #$8 = 3
    	addi $9, $0, 5 #$9 = 5
    	addi $14, $0, 6 #$14 = 6
    	#$20 => passaram / $21 => nao passaram
teste:	lui $4, 0x1001 #print a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe n1 => $5
	syscall
	add $5, $0, $2
	beq $5, $19, fim
	addi $4, $4, 17 #print a segunda string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe n2 => $6
	syscall
	add $6, $0, $2	
	mul  $10, $5, $7 #n1*2
	mul $11, $6, $8 #n2*3
	add $12, $10, $11 #(n1*2) + (n2*3)
	div $12, $9 #((n1*2) + (n2*3))/5
	mflo $13 #$13 = media
	slt $13, $13, $14 #$13 = 0 se media>= 6, senao $13 = 1
	beq $13, $0, passou
	addi $21, $21, 1 #nao passou
	j teste 
passou:	addi $20, $20, 1 #passou
	j teste	
fim:	add $4, $0, $20 #print valor de quantos passaram
	addi $2, $0, 1
	syscall
	lui $4, 0x1001# print a terceira string
	addi $4, $4, 34
	addi $2, $0, 4
	syscall
	add $4, $0, $21 #print valor de quantos nao passaram
	addi $2, $0, 1
	syscall
	lui $4, 0x1001# print a quarta string
	addi $4, $4, 52
	addi $2, $0, 4
	syscall
	nop
