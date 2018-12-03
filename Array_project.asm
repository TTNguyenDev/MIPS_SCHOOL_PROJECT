#define - $s0 store size of array
#       - $s1 store elements of array

.data
	array: .word 100
	
	Result: .asciiz "\nKet qua: "
        Space: .asciiz " "
        Enter: .asciiz "\n"
        GetNumOfElement: .asciiz "\nNhap vao su lua chon cua ban: "
        GetSizeOfArray: .asciiz "\nNhap vao so luong phan tu: "
        ShowOption: .asciiz "\n----------------MENU----------------\n1. Xuat ra cac phan tu\n2. Tinh tong cac phan tu\n3. Liet ke cac phan tu la so nguyen to\n4. Max\n5. Find element\n6. Exit"
 
        
.text
.globl main
main:
	j getSize
		

getSize: 
	la $a0, GetSizeOfArray
	li $v0, 4
	syscall
	
	li, $v0, 5
	syscall	
	blez $v0, getSize
	move $s0, $v0 #s0 register store size of array	
	move $t0, $s0 #create a copy of $s0
	la $s1, array
	j getInput


getInput:
	beq $t0, 0, MENU
	
	li $v0, 5
	syscall
	sw $v0, ($s1)
	addi $t0, $t0, -1
	addi $s1, $s1, 4
	b getInput
	

MENU: 
	#Print menu 
	addi $v0, $0, 4
	la $a0, ShowOption
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


