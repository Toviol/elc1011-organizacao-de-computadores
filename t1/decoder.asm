.globl map_register
.globl extende_sinal
.text


#a0=numero
extende_sinal:
  	addi $sp, $sp, -16
        sw $ra, 4($sp)
        sw $s0, 8($sp)
        sw $s1, 12($sp)                                      
	
  	sh $a0, 0($sp)                                        
 	lh $v0, 0($sp)                                         

  	lw $ra, 4($sp)
        lw $s0, 8($sp)
        lw $s1, 12($sp)
        addi $sp, $sp, 16
        
        jr $ra


#a0=decoder
map_register:


    #Ajuste pilha
    addi $sp, $sp, -16
    sw $ra, 4($sp)
    sw $s0, 8($sp)
    sw $s1, 12($sp)    

   
    beq $a1, 0, found_zero
    beq $a1, 1, found_at
    beq $a1, 2, found_v0
    beq $a1, 3, found_v1
    beq $a1, 4, found_a0
    beq $a1, 5, found_a1
    beq $a1, 6, found_a2
    beq $a1, 7, found_a3
    beq $a1, 8, found_t0
    beq $a1, 9, found_t1
    beq $a1, 10, found_t2
    beq $a1, 11, found_t3
    beq $a1, 12, found_t4
    beq $a1, 13, found_t5
    beq $a1, 14, found_t6
    beq $a1, 15, found_t7
    beq $a1, 16, found_s0
    beq $a1, 17, found_s1
    beq $a1, 18, found_s2
    beq $a1, 19, found_s3
    beq $a1, 20, found_s4
    beq $a1, 21, found_s5
    beq $a1, 22, found_s6
    beq $a1, 23, found_s7
    beq $a1, 24, found_t8
    beq $a1, 25, found_t9
    beq $a1, 26, found_k0
    beq $a1, 27, found_k1
    beq $a1, 28, found_gp
    beq $a1, 29, found_sp
    beq $a1, 30, found_fp
    beq $a1, 31, found_ra
   

found_zero:
    li $v0,15
    la $a1, zero_msg
    la $a2, 5	
    syscall
    j exit

found_at:
    li $v0,15
    la $a1, at_msg
    la $a2, 3	
    syscall
    j exit

found_v0:
    li $v0,15
    la $a1, v0_msg
    la $a2, 3	
    syscall
    j exit

found_v1:
    li $v0,15
    la $a1, v1_msg
    la $a2, 3	
    syscall
    j exit

found_a0:
    li $v0,15
    la $a1, a0_msg
    la $a2, 3	
    syscall
    j exit

found_a1:
    li $v0,15
    la $a1, a1_msg
    la $a2, 3	
    syscall
    j exit

found_a2:
    li $v0,15
    la $a1, a2_msg
    la $a2, 3	
    syscall
    j exit

found_a3:
    li $v0,15
    la $a1, a3_msg
    la $a2, 3	
    syscall
    j exit

found_t0:
    li $v0,15
    la $a1, t0_msg
    la $a2, 3	
    syscall
    j exit

found_t1:
    li $v0,15
    la $a1, t1_msg
    la $a2, 3	
    syscall
    j exit

found_t2:
    li $v0,15
    la $a1, t2_msg
    la $a2, 3	
    syscall
    j exit

found_t3:
    li $v0,15
    la $a1, t3_msg
    la $a2, 3	
    syscall
    j exit

found_t4:
    li $v0,15
    la $a1, t4_msg
    la $a2, 3	
    syscall
    j exit

found_t5:
    li $v0,15
    la $a1, t5_msg
    la $a2, 3	
    syscall
    j exit

found_t6:
    li $v0,15
    la $a1, t6_msg
    la $a2, 3	
    syscall
    j exit

found_t7:
    li $v0,15
    la $a1, t7_msg
    la $a2, 3	
    syscall
    j exit

found_s0:
    li $v0,15
    la $a1, s0_msg
    la $a2, 3	
    syscall
    j exit

found_s1:
    li $v0,15
    la $a1, s1_msg
    la $a2, 3	
    syscall
    j exit

found_s2:
    li $v0,15
    la $a1, s2_msg
    la $a2, 3	
    syscall
    j exit

found_s3:
    li $v0,15
    la $a1, s3_msg
    la $a2, 3	
    syscall
    j exit

found_s4:
    li $v0,15
    la $a1, s4_msg
    la $a2, 3	
    syscall
    j exit

found_s5:
    li $v0,15
    la $a1, s5_msg
    la $a2, 3	
    syscall
    j exit

found_s6:
    li $v0,15
    la $a1, s6_msg
    la $a2, 3	
    syscall
    j exit

found_s7:
    li $v0,15
    la $a1, s7_msg
    la $a2, 3	
    syscall
    j exit

found_t8:
    li $v0,15
    la $a1, t8_msg
    la $a2, 3	
    syscall
    j exit

found_t9:
    li $v0,15
    la $a1, t9_msg
    la $a2, 3	
    syscall
    j exit

found_k0:
    li $v0,15
    la $a1, k0_msg
    la $a2, 3	
    syscall
    j exit

found_k1:
    li $v0,15
    la $a1, k1_msg
    la $a2, 3	
    syscall
    j exit

found_gp:
    li $v0,15
    la $a1, gp_msg
    la $a2, 3	
    syscall
    j exit

found_sp:
    li $v0,15
    la $a1, sp_msg
    la $a2, 3	
    syscall
    j exit

found_fp:
    li $v0,15
    la $a1, fp_msg
    la $a2, 3	
    syscall
    j exit

found_ra:
    li $v0,15
    la $a1, ra_msg
    la $a2, 3	
    syscall
    j exit


exit:
    lw $ra, 4($sp)
    lw $s0, 8($sp)
    lw $s1, 12($sp)
    addi $sp, $sp, 16
        
    jr $ra
    

    
.data

# Registradores
zero_msg:	.asciiz "$zero"
at_msg:		.asciiz "$at"

v0_msg:		.asciiz "$v0"
v1_msg:		.asciiz "$v1"

a0_msg:		.asciiz "$a0"
a1_msg:		.asciiz "$a1"
a2_msg:		.asciiz "$a2"
a3_msg:		.asciiz "$a3"

t0_msg:		.asciiz "$t0"
t1_msg:		.asciiz "$t1"
t2_msg:		.asciiz "$t2"
t3_msg:		.asciiz "$t3"
t4_msg:		.asciiz "$t4"
t5_msg:		.asciiz "$t5"
t6_msg:		.asciiz "$t6"
t7_msg:		.asciiz "$t7"

s0_msg:		.asciiz "$s0"
s1_msg:		.asciiz "$s1"
s2_msg:		.asciiz "$s2"
s3_msg:		.asciiz "$s3"
s4_msg:		.asciiz "$s4"
s5_msg:		.asciiz "$s5"
s6_msg:		.asciiz "$s6"
s7_msg:		.asciiz "$s7"

t8_msg:		.asciiz "$t8"
t9_msg:		.asciiz "$t9"

k0_msg:		.asciiz "$k0"
k1_msg:		.asciiz "$k1"
gp_msg:		.asciiz "$gp"
sp_msg:		.asciiz "$sp"
fp_msg:		.asciiz "$fp"
ra_msg:		.asciiz "$ra"
