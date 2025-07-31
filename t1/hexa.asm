.text
.globl hexa
hexa:
# Cabeçallho
# a0=descritor_arquivo
# a1=numero

# t8=descritor_arquivo
# Imprime Hexa
	move $t8, $a0
	move $t2, $a1
     	 
     	
     	# Escreve 0x no arquivo
     	li $v0,15
    	move $a0,$s1
    	la $a1, simbolo_hexa	
  	la $a2, 2		
   	syscall
     	
     	addi $t0, $zero, 0         
     	la $t3, numero_hexa     
     	 
     	Loop_traducao_hexa:
     		beq $t0, 8, Fim_traducao_hexa
     		rol $t2, $t2, 4

     		and $t4, $t2, 0xf           	# Mascara 1111
     		ble $t4, 9, Soma_48     	# Se for menor que 9, adiciona 48 na tabela ascii
     		addi $t4, $t4, 55           	# Se for maior que 9, adiciona 55 na tabela ascii
     		j Incremento_traducao_hexa
     		
     	Soma_48:
         	addi $t4, $t4, 48
         	
     	Incremento_traducao_hexa: 
     		sb $t4, 0($t3)
     		addi $t3, $t3, 1 
     		addi $t0, $t0, 1  
     		j Loop_traducao_hexa
     		
	Fim_traducao_hexa:
     		li $v0,15
    		move $a0,$t8
    		la $a1, numero_hexa
    		la $a2, 8		
    		syscall
    		
    		jr $ra
.data
# Traducao para Hexadecimal
simbolo_hexa: 	.asciiz "0x"
numero_hexa: 	.space 8
