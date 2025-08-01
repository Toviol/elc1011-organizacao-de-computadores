.data
	x: 		.word 0x00000000
	#y: 		.word 0x12341234
	y: 		.word 0x90357274
				
	divisor: 	.word 0x12341234
	#divisor: 	.word 0x90357274
	
	
	resto:   	.asciiz "Resto: "
	inteiro:	.asciiz "Parte inteira: "
	space:		.asciiz "\n"
	
.text
#Dividendo & Resto
#s0 = x = mst resto
#s1 = y = lsb resto

#s3  = divisor

main:
	#Carregando as variáveis
	lw $s0, x
	lw $s1, y
	lw $s3, divisor
		
	
	#Fazendo o primeiro passo do algoritmo da divisão, shiftar o resto para esquerda	
	move $a0, $s0
	move $a1, $s1
	jal shift_left
	
	#s0 = x = mst resto, s1 = y = lsb resto
	move $s0, $v0
	move $s1, $v1
	
	for_inicializacao:    
	        #Inicializa o loop com 0
       		addi  $s2, $zero, 0
            	j     for_verifica_condicao
	for_codigo_condicao_verdadeira:
		#Se o msb do resto for menor do que o divisor vai para a operação caso o resto seja menor
		bltu $s0, $s3, resto_menor
		
		resto_maior:
			#Subtraio o o divisor do resto
			subu $s0, $s0, $s3
			
			#Shift left no resto
			move $a0, $s0
			move $a1, $s1
			jal shift_left
			move $s0, $v0
			move $s1, $v1
			
			#Adiciona 1 ao resto
			addi $s1, $s1,  1
	
			j for_incremento

		resto_menor:
			#Dou um shift left
			move $a0, $s0
			move $a1, $s1
			jal shift_left
			move $s0, $v0
			move $s1, $v1

	for_incremento:
	          
            	addi  $s2, $s2, 1
	for_verifica_condicao:
            	slti   $t3, $s2, 32
            	bne    $t3, $zero, for_codigo_condicao_verdadeira
	fim_laco:
		#Ultimo passo, dar um shift right no msb do resto
		srl $s0, $s0, 1
	
		
	imprime:
		#Imprime a parte inteira da divisão, lsb do resto.
		li $v0, 4
		la $a0, inteiro
		syscall
		
		li  $v0, 1
		move $a0, $s1
		syscall
		
		#Nova linha
		li $v0, 4
		la $a0, space
		syscall
		
		#Imprime o resto da divisão, msb do resto.
		li $v0, 4
		la $a0, resto
		syscall
		
		li  $v0, 1
		move $a0, $s0
		syscall
		
		
	#Fim do programa
	fim:
		li $v0, 10
		syscall				
									
#Função para dar shift left no resto devido a necessidade de uso de dois registradores.																		
shift_left:
	move $t0, $a0
	move $t1, $a1
	#Guarda o bit mais significativo da primeira parte do resto
	srl $t2, $t1, 31
	
	#Shift left no resto
	sll $t1, $t1, 1
	sll $t0, $t0, 1
	
	#Adiciona o msb da parte menos significativa do resto à parte mais significativa do resto
	add $t0, $t0, $t2

	move $v0, $t0
	move $v1, $t1
	jr $ra
	
