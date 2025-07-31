.data
fileWrite:	.asciiz  "./output.txt"
instrucaoTeste:.word 0x03E00008#0x00082020 #0x70031CF0
instrucoes:	.word 0
fileRead:	.asciiz  "./ex-000-012.bin" 
pc_atual:	.word 0x00400000	
.text
.globl main
main:
	# Abri o arquivo de leitura
	li $v0,13           
    	la $a0,fileRead     	
    	li $a1,0           	
    	syscall
    	move $s7,$v0        	

	# Abrir o arquivo de escrita
    	li $v0,13           	
    	la $a0,fileWrite     	
    	li $a1,1         
    	li $a2,0  	
    	syscall
    	move $s1,$v0		#Salva o descritor no s1
    	
inicio_loop:	
	#read the file
	li $v0, 14		# read_file syscall code = 14
	move $a0,$s7		# file descriptor
	la $a1,instrucoes  	# The buffer that holds the string of the WHOLE file
	la $a2,4		# hardcoded buffer length
	syscall
	
	bne $v0, 4, fim		#Manda pro fim
	
	
	move $a0, $s1
	lw $a1, pc_atual    	#LW na instru��o
	jal hexa
	jal print_space
	

	move $a0,$s1		#Passa o descritor como parametro
	lw $s0,instrucoes    	#LW na instru��o
	move $a1,$s0		#Passa a instru��o como parametro
	jal hexa		#Fun��o que transforma em hexadecimal e imprime na tela
	
	#Passa a instru��o para o t9
	move $t9, $s0
	
	#Campo RS
	sll $t1, $t9, 6
	srl $t1, $t1, 27
	la $t0, campo_rs
	sw $t1, 0($t0)
	
	#Campo RT
	sll $t2, $t9, 11
	srl $t2, $t2, 27
	la $t0, campo_rt
	sw $t2, 0($t0)
	
	#Campo RD
	sll $t3, $t9, 16
	srl $t3, $t3, 27
	la $t0, campo_rd
	sw $t3, 0($t0)
	
	#Campo SA
	sll $t4, $t9, 21
	srl $t4, $t4, 27
	la $t0, campo_sa
	sw $t4, 0($t0)
	#Campo imm
	sll $t5, $t9, 16
	srl $t5, $t5, 16
	move $a0, $t5
	jal extende_sinal
	la $t0, campo_imm
	sw $v0, 0($t0)
	
	#Campo target
	sll $t6, $t9, 6
	srl $t6, $t6, 6
	la $t0, campo_target
	sw $t6, 0($t0)
	
	#Campo funct
	sll $t7, $t9, 26
	srl $t7, $t7, 26
	la $t0, campo_funct
	sw $t7, 0($t0)
	
	
main1:
	lw $t9, instrucoes
	srl $t2, $t9, 26
    	beq $t2, 0x00, ins_campo_funct
    	
	# Ins de instrucao
	beq $t2, 0x02, ins_j
	beq $t2, 0x03, ins_jal
	beq $t2, 0x05, ins_bne
	beq $t2, 0x08, ins_addi
	beq $t2, 0x09, ins_addiu
	beq $t2, 0x0D, ins_ori
	beq $t2, 0x0F, ins_lui
	beq $t2, 0x1C, ins_mul
	beq $t2, 0x23, ins_lw
	beq $t2, 0x2B, ins_sw
	
	j ins_desconhecida

ins_campo_funct:	
	move $a0, $t1
	jal map_register
	move $s2, $v1
	
	lw $t0, campo_funct
	
	beq $t0, 0x20, ins_add
	beq $t0, 0x21, ins_addu
	beq $t0, 0x08, ins_jr
	beq $t0, 0x0C, ins_syscall
	
	j ins_desconhecida
	
ins_j:
    li $v0,15
    move $a0,$s1
    la $a1, j_msg
    la $a2, 2		
    syscall
    jal print_space
    
    lw $t0, pc_atual
    addi $t0, $t0, 4
    andi $t0, $t0, 0xF0000000
    lw $t1, campo_target
    sll $t1, $t1, 2
    or $t0, $t0, $t1
    
    move $a0, $s1
    move $a1, $t0
    jal hexa
    
    j loop

ins_jal:
    li $v0,15
    move $a0,$s1
    la $a1, jal_msg
    la $a2, 4		
    syscall
    jal print_space
    
    lw $t0, pc_atual
    addi $t0, $t0, 4
    andi $t0, $t0, 0xF0000000
    lw $t1, campo_target
    sll $t1, $t1, 2
    or $t0, $t0, $t1
    
    move $a0, $s1
    move $a1, $t0
    jal hexa
    
    j loop

ins_bne:
    li $v0,15
    move $a0,$s1
    la $a1, bne_msg
    la $a2, 4		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    
    lw $t0, pc_atual
    addi $t0, $t0, 4
    lw $t1, campo_imm
    sll $t1, $t1, 2
    add $t1, $t1, $t0
    move $a0, $s1
    move $a1, $t1
    jal hexa
    
    j loop

ins_addi:
    li $v0,15
    move $a0,$s1
    la $a1, addi_msg
    la $a2, 5		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    j loop
#aquiiii
ins_addiu:
    li $v0,15
    move $a0,$s1
    la $a1, addiu_msg
    la $a2, 6		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    j loop

ins_ori:
    li $v0,15
    move $a0,$s1
    la $a1, ori_msg
    la $a2, 4		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    j loop

ins_lui:
    li $v0,15
    move $a0,$s1
    la $a1, lui_msg
    la $a2, 4		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    j loop

ins_mul:
    lw $t0, campo_funct
    bne $t0, 0x02, ins_desconhecida


    li $v0,15
    move $a0,$s1
    la $a1, mul_msg
    la $a2, 4		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rd
    jal map_register
    
    j loop

ins_lw:
    li $v0,15
    move $a0,$s1
    la $a1, lw_msg
    la $a2, 3		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    jal print_abre
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_fecha
   
    
    j loop

ins_sw:
    li $v0,15
    move $a0,$s1
    la $a1, sw_msg
    la $a2, 3		
    syscall
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_imm
    jal hexa
    
    jal print_abre
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_fecha
    
    j loop

# Instru��es que diferem pelo FUNCT

ins_add:
    li $v0,15
    move $a0,$s1
    la $a1, add_msg
    la $a2, 5		
    syscall
    
    move $a0, $s1
    lw $a1, campo_rd
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    
    j loop
	
ins_addu:
    li $v0,15
    move $a0,$s1
    la $a1, addu_msg
    la $a2, 6
    syscall
    
    
    move $a0, $s1
    lw $a1, campo_rd
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    jal print_comma
    jal print_space
    
    move $a0, $s1
    lw $a1, campo_rt
    jal map_register
    
    j loop
    
    
    
    j loop

ins_jr:
    li $v0,15
    move $a0,$s1
    la $a1, jr_msg
    la $a2, 4	
    syscall
    
    move $a0, $s1
    lw $a1, campo_rs
    jal map_register
    
    
    j loop
	
ins_syscall:
    li $v0,15
    move $a0,$s1
    la $a1, syscall_msg
    la $a2, 8
    syscall
    j loop

ins_desconhecida:
    li $v0,15
    move $a0,$s1
    la $a1, desconhecida_msg
    la $a2, 25
    syscall
    j loop		
				
loop:
	jal print_nova_linha
	
	la $t0, pc_atual
	lw $t1, 0($t0)
	addi $t1, $t1, 4
	sw $t1, 0($t0)
	
	j inicio_loop
								
fim:
    # Close the input file
    move $a0, $s1
    li $v0, 16
    syscall
    
    # Close the outpu file
    move $a0, $s1
    li $v0, 16
    syscall
    
    li $v0, 10
    syscall



print_comma:
	li $v0,15
    	move $a0,$s1
    	la $a1, comma
    	la $a2, 1
    	syscall
    	
    	jr $ra

print_space:
	li $v0,15
    	move $a0,$s1
    	la $a1, space
    	la $a2, 1
    	syscall
    	
    	jr $ra
    	
print_abre:
	li $v0,15
    	move $a0,$s1
    	la $a1, parentesis_aberto_msg
    	la $a2, 1
    	syscall
    	
    	jr $ra

print_fecha:
	li $v0,15
    	move $a0,$s1
    	la $a1, parentesis_fechado_msg
    	la $a2, 1
    	syscall
    	
    	jr $ra

print_nova_linha:
	li $v0,15
    	move $a0,$s1
    	la $a1, nova_linha_msg
    	la $a2, 1
    	syscall
    	
    	jr $ra



.data

# Instru��es que diferem pelo OPCODE
j_msg: 		.asciiz " j "
jal_msg: 	.asciiz " jal "
bne_msg: 	.asciiz " bne "
addi_msg: 	.asciiz " addi "
addiu_msg: 	.asciiz " addiu "
ori_msg: 	.asciiz " ori "
lui_msg: 	.asciiz " lui "
mul_msg: 	.asciiz " mul "
lw_msg: 	.asciiz " lw "
sw_msg: 	.asciiz " sw "

# Instru��es que diferem pelo FUNCT
add_msg: 	.asciiz " add "
addu_msg: 	.asciiz " addu "
jr_msg: 	.asciiz " jr "
syscall_msg: 	.asciiz " syscall "

desconhecida_msg: 	.asciiz " Instrucao Desconhecida "
parentesis_aberto_msg: 	.asciiz "("
parentesis_fechado_msg: .asciiz ")"
nova_linha_msg: 	.asciiz "\n"
# Campos

campo_rs:	.word 0
campo_rt:	.word 0
campo_rd:	.word 0
campo_sa:	.word 0
campo_imm:	.word 0
campo_target:	.word 0
campo_funct:	.word 0

comma:	.asciiz ","
space:	.asciiz " "

