.data
	array: .word 20, 10, 2, 3, 4, 5
	array_size: .space 4
	
	Menu: .asciiz "\n----------------MENU----------------\n1. Xuat ra cac phan tu\n2. Tinh tong cac phan tu\n3. Liet ke cac phan tu la so nguyen to\n4. Max\n5. Find element\n6. Exit"
	Result: .asciiz "\nKet qua: "
        Space: .asciiz " "
        Enter: .asciiz "\n"
        GetNumOfElement: .asciiz "\nNhap vao su lua chon cua ban: "
 
        
.text
.globl main

main:
	
	# store the number of elements
	la		$t0, array_size
	la		$t1, array
	sub		$t2, $t0, $t1
	srl		$t2, $t2, 2
	sw		$t2, 0($t0)
	
	
	#Print output to console
	jal		OUTPUT_FUNC
	
	
	
	j EXIT
	
OUTPUT_FUNC:
	la		$s0, array
	lw		$t0, array_size
	
	addi $v0, $0, 4
	la $a0, Result
	syscall
	
Loop_main1:
	beq		$t0, $zero, MENU
	
	li		$v0, 4
	la		$a0, Space
	syscall
	
	li		$v0, 1
	lw		$a0, 0($s0)
	syscall
	
	addi	$t0, $t0, -1
	addi	$s0, $s0, 4
	
	j		Loop_main1
	
	

SUM:
	
	

	
MENU: 
	#Print menu 
	addi $v0, $0, 4
	la $a0, Menu
	syscall
	
	addi $v0, $0, 4
	la $a0, GetNumOfElement
	syscall
	
	#Nhap so nguyen
	addi $v0, $0, 5
	syscall
	
	#Luu tru so nguyen vua nhap vao $t0
	add $t0, $v0, $0
	
	bgt $t0, 6, MENU
	blez $t0, MENU
	
EXIT: 
	#Ket thuc chuong trinh
	addi $v0, $0 10
	syscall
