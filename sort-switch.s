	.file	"sort.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w+"
.LC1:
	.string	"keytable"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	sortFile
	.type	sortFile, @function
sortFile:
.LFB71:
	.cfi_startproc
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	jmp	fopen
	.cfi_endproc
.LFE71:
	.size	sortFile, .-sortFile
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.str1.1
.LC3:
	.string	"r"
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	sort_main
	.type	sort_main, @function
sort_main:
.LFB72:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	movl	$.LC3, %esi
	call	fopen
	movq	%rax, input(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE72:
	.size	sort_main, .-sort_main
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.globl	rsort_lsb
	.type	rsort_lsb, @function
rsort_lsb:
.LFB73:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdx, %r12
	leaq	-1(%rsi), %rdx
	pushq	%rbx
	leaq	-2112(%rbp), %r15
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rcx, %r13
	movl	$128, %ecx
	imulq	%r12, %rdx
	subq	$2120, %rsp
	movq	%rdi, -2136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%r15, %rdi
	testq	%rsi, %rsi
	movq	%rsi, -2152(%rbp)
	movl	%r8d, -2116(%rbp)
	rep stosq
	leaq	(%rbx,%rdx), %r14
	je	.L5
	movq	%r12, %rcx
	movq	%rsi, %rbx
	negq	%rcx
	movq	%rcx, -2128(%rbp)
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r14, %rdi
	movl	-2116(%rbp), %esi
	call	*%r13
	movzbl	%al, %eax
	addq	-2128(%rbp), %r14
	addl	$1, -2112(%rbp,%rax,4)
	subq	$1, %rbx
	jne	.L6
.L5:
	movl	$0, -1088(%rbp)
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	addl	(%r15,%rax), %edx
	movl	%edx, -1084(%rbp,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L7
	leaq	15(%r12), %rax
	movq	-2136(%rbp), %rcx
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-2152(%rbp), %rax
	movq	%rcx, %rbx
	movq	%rsp, -2144(%rbp)
	imulq	%r12, %rax
	addq	%rcx, %rax
	movq	%rax, -2128(%rbp)
.L8:
	cmpq	-2128(%rbp), %rbx
	jnb	.L15
.L14:
	movl	-2116(%rbp), %esi
	movq	%rbx, %rdi
	call	*%r13
	movzbl	%al, %r14d
	movl	-2112(%rbp,%r14,4), %r8d
	movq	%r14, %rdx
	testl	%r8d, %r8d
	jne	.L9
	cmpb	$-1, %al
	je	.L15
	addl	$1, %edx
	addl	$1, selfcalls(%rip)
	movslq	%edx, %rdx
	movl	-1088(%rbp,%rdx,4), %ebx
	imulq	%r12, %rbx
	addq	-2136(%rbp), %rbx
	cmpq	-2128(%rbp), %rbx
	jb	.L14
	.p2align 4,,10
	.p2align 3
.L15:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L26
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movl	-1088(%rbp,%r14,4), %r15d
	movq	%r15, %r9
	imulq	%r12, %r15
	addq	-2136(%rbp), %r15
	cmpq	%r15, %rbx
	je	.L27
	movq	-2144(%rbp), %rdi
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movl	%r8d, -2120(%rbp)
	movl	%r9d, -2152(%rbp)
	call	memcpy
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	memcpy
	movq	-2144(%rbp), %rsi
	movq	%r12, %rdx
	movq	%r15, %rdi
	call	memcpy
	movl	-2120(%rbp), %r8d
	movl	-2152(%rbp), %r9d
.L13:
	subl	$1, %r8d
	addl	$1, %r9d
	addl	$1, selfcalls(%rip)
	movl	%r8d, -2112(%rbp,%r14,4)
	movl	%r9d, -1088(%rbp,%r14,4)
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L27:
	addq	%r12, %rbx
	jmp	.L13
.L26:
	call	__stack_chk_fail
	.cfi_endproc
.LFE73:
	.size	rsort_lsb, .-rsort_lsb
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.globl	rsort_lsb_copy
	.type	rsort_lsb_copy, @function
rsort_lsb_copy:
.LFB74:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	movl	$128, %ecx
	movq	%rsi, %rbx
	subq	$2104, %rsp
	.cfi_def_cfa_offset 2160
	leaq	32(%rsp), %r15
	movq	%rdi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 2088(%rsp)
	xorl	%eax, %eax
	movq	%r15, %rdi
	testq	%rdx, %rdx
	movl	%r9d, 12(%rsp)
	rep stosq
	je	.L29
	movq	%rsi, %r12
	movq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L30:
	movq	%r12, %rdi
	movl	12(%rsp), %esi
	addq	%rbp, %r12
	call	*%r13
	movzbl	%al, %eax
	addl	$1, 32(%rsp,%rax,4)
	subq	$1, %r14
	jne	.L30
.L29:
	movl	$0, 1056(%rsp)
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L31:
	addl	(%r15,%rax), %edx
	movl	%edx, 1060(%rsp,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L31
	movq	24(%rsp), %r12
	testq	%r12, %r12
	je	.L34
	.p2align 4,,10
	.p2align 3
.L38:
	movq	%rbx, %rdi
	movl	12(%rsp), %esi
	call	*%r13
	movzbl	%al, %r15d
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	movl	1056(%rsp,%r15,4), %edi
	addq	%rbp, %rbx
	movq	%rdi, %r14
	imulq	%rbp, %rdi
	addq	16(%rsp), %rdi
	call	memcpy
	leal	1(%r14), %r8d
	subq	$1, %r12
	movl	%r8d, 1056(%rsp,%r15,4)
	jne	.L38
.L34:
	movq	2088(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L46
	addq	$2104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L46:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE74:
	.size	rsort_lsb_copy, .-rsort_lsb_copy
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.1
.LC7:
	.string	"%016lx %016lx %016lx %016lx\n"
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.globl	print256
	.type	print256, @function
print256:
.LFB75:
	.cfi_startproc
	subq	$160, %rsp
	.cfi_def_cfa_offset 168
	movl	$1, %edx
	movl	$.LC7, %r8d
	movq	%fs:40, %rax
	movq	%rax, 144(%rsp)
	xorl	%eax, %eax
	pushq	(%rdi)
	.cfi_def_cfa_offset 176
	pushq	8(%rdi)
	.cfi_def_cfa_offset 184
	movl	$128, %ecx
	pushq	16(%rdi)
	.cfi_def_cfa_offset 192
	movq	24(%rdi), %r9
	movl	$128, %esi
	leaq	32(%rsp), %rdi
	call	__snprintf_chk
	movzbl	32(%rsp), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	movq	%rsp, %rax
	testb	%dl, %dl
	jne	.L53
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L49:
	addq	$1, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L51
.L53:
	cmpb	$48, %dl
	jne	.L49
	movb	$95, (%rax)
	addq	$1, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L53
.L51:
	movq	%rsp, %rdi
	call	puts
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L59
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE75:
	.size	print256, .-print256
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	setbit
	.type	setbit, @function
setbit:
.LFB76:
	.cfi_startproc
	movl	%esi, %eax
	movl	%esi, %ecx
	movl	$1, %edx
	shrb	$6, %al
	andl	$63, %ecx
	movzbl	%al, %eax
	salq	%cl, %rdx
	orq	%rdx, (%rdi,%rax,8)
	ret
	.cfi_endproc
.LFE76:
	.size	setbit, .-setbit
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	unsetbit
	.type	unsetbit, @function
unsetbit:
.LFB77:
	.cfi_startproc
	movl	%esi, %eax
	movl	%esi, %ecx
	movq	$-2, %rdx
	shrb	$6, %al
	andl	$63, %ecx
	movzbl	%al, %eax
	rolq	%cl, %rdx
	andq	%rdx, (%rdi,%rax,8)
	ret
	.cfi_endproc
.LFE77:
	.size	unsetbit, .-unsetbit
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.globl	__popcountdi2
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	numset
	.type	numset, @function
numset:
.LFB78:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rdi
	call	__popcountdi2
	movq	8(%rbx), %rdi
	movl	%eax, %ebp
	call	__popcountdi2
	movq	16(%rbx), %rdi
	addl	%eax, %ebp
	call	__popcountdi2
	movq	24(%rbx), %rdi
	addl	%eax, %ebp
	call	__popcountdi2
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	addl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE78:
	.size	numset, .-numset
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	getnextset
	.type	getnextset, @function
getnextset:
.LFB79:
	.cfi_startproc
	movq	$-1, %rax
	movl	%esi, %ecx
	movq	%rax, %rsi
	salq	%cl, %rsi
	shrl	$6, %ecx
	cmpl	$1, %ecx
	je	.L66
	jb	.L67
	cmpl	$2, %ecx
	je	.L68
	cmpl	$3, %ecx
	je	.L69
	rep ret
	.p2align 4,,10
	.p2align 3
.L67:
	movq	%rsi, %rdx
	andq	(%rdi), %rdx
	movq	%rax, %rsi
	testq	%rdx, %rdx
	jne	.L88
.L66:
	movq	%rsi, %rdx
	andq	8(%rdi), %rdx
	movq	$-1, %rsi
	testq	%rdx, %rdx
	jne	.L89
.L68:
	movq	%rsi, %rdx
	andq	16(%rdi), %rdx
	movq	$-1, %rsi
	testq	%rdx, %rdx
	jne	.L90
.L69:
	andq	24(%rdi), %rsi
	je	.L74
	xorl	%eax, %eax
	rep bsfq	%rsi, %rax
	addl	$192, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	addl	$64, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	subl	$-128, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE79:
	.size	getnextset, .-getnextset
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	rsort_msb
	.type	rsort_msb, @function
rsort_msb:
.LFB80:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	subq	$1112, %rsp
	.cfi_def_cfa_offset 1168
	movq	%fs:40, %rax
	movq	%rax, 1096(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	movq	%rdi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%r9, 40(%rsp)
	je	.L95
	movq	16(%rsp), %r13
	movq	%rsi, %rbx
	movq	%r9, %r14
	movq	%rsi, (%rsp)
	movq	%rdi, %rbp
	.p2align 4,,10
	.p2align 3
.L249:
	movq	%rbp, %rdi
	movl	%r15d, %esi
	addq	%r13, %rbp
	call	*%r12
	movzbl	%al, %eax
	addl	$1, (%r14,%rax,4)
	subq	$1, %rbx
	jne	.L249
	movq	(%rsp), %rbp
.L95:
	movq	40(%rsp), %rsi
	leaq	68(%rsp), %rcx
	movl	$0, 64(%rsp)
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L93:
	addl	(%rsi,%rax), %edx
	movl	%edx, (%rcx,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L93
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	imulq	%rax, %rbp
	movq	%rcx, %rbx
	leaq	(%rcx,%rbp), %r13
	movq	%rax, %rbp
.L96:
	cmpq	%r13, %rbx
	jnb	.L115
.L114:
	movq	%rbx, %rdi
	movl	%r15d, %esi
	call	*%r12
	movq	40(%rsp), %rdi
	movzbl	%al, %edx
	movzbl	%al, %ecx
	leaq	(%rdi,%rdx,4), %rdi
	movl	(%rdi), %edx
	testl	%edx, %edx
	jne	.L97
	cmpb	$-1, %al
	je	.L115
	leal	1(%rcx), %eax
	cltq
	movl	64(%rsp,%rax,4), %ebx
	imulq	%rbp, %rbx
	addq	24(%rsp), %rbx
	cmpq	%r13, %rbx
	jb	.L114
.L115:
	xorl	%eax, %eax
	testl	%r15d, %r15d
	je	.L91
	leal	-1(%r15), %eax
	leaq	64(%rsp), %r13
	xorl	%ebp, %ebp
	movl	%eax, 32(%rsp)
	leaq	1024(%r13), %rax
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rax
	addq	$16, %rax
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L132:
	movl	0(%r13), %eax
	movl	%eax, %esi
	movl	%eax, (%rsp)
	subl	%ebp, %esi
	cmpl	$1, %esi
	jbe	.L117
	cmpl	$2, %esi
	jne	.L118
	movq	16(%rsp), %rax
	movq	24(%rsp), %r15
	movl	32(%rsp), %r14d
	imulq	%rax, %rbp
	addq	%rbp, %r15
	movq	%rbp, 48(%rsp)
	leaq	(%r15,%rax), %rbx
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L119:
	jb	.L117
	testl	%r14d, %r14d
	leal	-1(%r14), %eax
	je	.L117
	movl	%eax, %r14d
.L131:
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	*%r12
	movl	%eax, %ebp
	movl	%r14d, %esi
	movq	%rbx, %rdi
	call	*%r12
	cmpb	%al, %bpl
	jbe	.L119
	movq	48(%rsp), %rsi
	movq	16(%rsp), %rcx
	movq	56(%rsp), %rax
	movq	%rcx, %rdi
	addq	%rsi, %rax
	addq	%rsi, %rdi
	cmpq	%rsi, %rax
	movq	%rsi, %rax
	setle	%dl
	addq	$16, %rax
	cmpq	%rax, %rdi
	setge	%al
	orb	%al, %dl
	je	.L120
	cmpq	$19, %rcx
	jbe	.L120
	movq	%r15, %rdx
	negq	%rdx
	andl	$15, %edx
	cmpq	%rcx, %rdx
	cmova	%rcx, %rdx
	testq	%rdx, %rdx
	je	.L135
	movzbl	(%r15), %eax
	movzbl	(%rbx), %r8d
	leaq	-1(%rcx), %r11
	cmpq	$1, %rdx
	leaq	1(%r15), %rsi
	movb	%r8b, (%r15)
	movb	%al, (%rbx)
	leaq	1(%rbx), %r8
	movq	%r11, %rax
	je	.L122
	movzbl	1(%r15), %eax
	movzbl	1(%rbx), %r8d
	leaq	2(%r15), %rsi
	movb	%r8b, 1(%r15)
	movb	%al, 1(%rbx)
	movq	%rcx, %rax
	subq	$2, %rax
	cmpq	$2, %rdx
	leaq	2(%rbx), %r8
	je	.L122
	movzbl	2(%r15), %eax
	movzbl	2(%rbx), %r8d
	leaq	3(%r15), %rsi
	movb	%r8b, 2(%r15)
	movb	%al, 2(%rbx)
	movq	%rcx, %rax
	subq	$3, %rax
	cmpq	$3, %rdx
	leaq	3(%rbx), %r8
	je	.L122
	movzbl	3(%r15), %eax
	movzbl	3(%rbx), %r8d
	leaq	4(%r15), %rsi
	movb	%r8b, 3(%r15)
	movb	%al, 3(%rbx)
	movq	%rcx, %rax
	subq	$4, %rax
	cmpq	$4, %rdx
	leaq	4(%rbx), %r8
	je	.L122
	movzbl	4(%r15), %eax
	movzbl	4(%rbx), %r8d
	leaq	5(%r15), %rsi
	movb	%r8b, 4(%r15)
	movb	%al, 4(%rbx)
	movq	%rcx, %rax
	subq	$5, %rax
	cmpq	$5, %rdx
	leaq	5(%rbx), %r8
	je	.L122
	movzbl	5(%r15), %eax
	movzbl	5(%rbx), %r8d
	leaq	6(%r15), %rsi
	movb	%r8b, 5(%r15)
	movb	%al, 5(%rbx)
	movq	%rcx, %rax
	subq	$6, %rax
	cmpq	$6, %rdx
	leaq	6(%rbx), %r8
	je	.L122
	movzbl	6(%r15), %eax
	movzbl	6(%rbx), %r8d
	leaq	7(%r15), %rsi
	movb	%r8b, 6(%r15)
	movb	%al, 6(%rbx)
	movq	%rcx, %rax
	subq	$7, %rax
	cmpq	$7, %rdx
	leaq	7(%rbx), %r8
	je	.L122
	movzbl	7(%r15), %eax
	movzbl	7(%rbx), %r8d
	leaq	8(%r15), %rsi
	movb	%r8b, 7(%r15)
	movb	%al, 7(%rbx)
	movq	%rcx, %rax
	subq	$8, %rax
	cmpq	$8, %rdx
	leaq	8(%rbx), %r8
	je	.L122
	movzbl	8(%r15), %eax
	movzbl	8(%rbx), %r8d
	leaq	9(%r15), %rsi
	movb	%r8b, 8(%r15)
	movb	%al, 8(%rbx)
	movq	%rcx, %rax
	subq	$9, %rax
	cmpq	$9, %rdx
	leaq	9(%rbx), %r8
	je	.L122
	movzbl	9(%r15), %eax
	movzbl	9(%rbx), %r8d
	leaq	10(%r15), %rsi
	movb	%r8b, 9(%r15)
	movb	%al, 9(%rbx)
	movq	%rcx, %rax
	subq	$10, %rax
	cmpq	$10, %rdx
	leaq	10(%rbx), %r8
	je	.L122
	movzbl	10(%r15), %eax
	movzbl	10(%rbx), %r8d
	leaq	11(%r15), %rsi
	movb	%r8b, 10(%r15)
	movb	%al, 10(%rbx)
	movq	%rcx, %rax
	subq	$11, %rax
	cmpq	$11, %rdx
	leaq	11(%rbx), %r8
	je	.L122
	movzbl	11(%r15), %eax
	movzbl	11(%rbx), %r8d
	leaq	12(%r15), %rsi
	movb	%r8b, 11(%r15)
	movb	%al, 11(%rbx)
	movq	%rcx, %rax
	subq	$12, %rax
	cmpq	$12, %rdx
	leaq	12(%rbx), %r8
	je	.L122
	movzbl	12(%r15), %eax
	movzbl	12(%rbx), %r8d
	leaq	13(%r15), %rsi
	movb	%r8b, 12(%r15)
	movb	%al, 12(%rbx)
	movq	%rcx, %rax
	subq	$13, %rax
	cmpq	$13, %rdx
	leaq	13(%rbx), %r8
	je	.L122
	movzbl	13(%r15), %eax
	movzbl	13(%rbx), %r8d
	leaq	14(%r15), %rsi
	movb	%r8b, 13(%r15)
	movb	%al, 13(%rbx)
	movq	%rcx, %rax
	subq	$14, %rax
	cmpq	$15, %rdx
	leaq	14(%rbx), %r8
	jne	.L122
	movzbl	14(%r15), %eax
	movzbl	14(%rbx), %r8d
	leaq	15(%r15), %rsi
	movb	%r8b, 14(%r15)
	movb	%al, 14(%rbx)
	leaq	15(%rbx), %r8
	movq	%rcx, %rax
	subq	$15, %rax
.L122:
	movq	16(%rsp), %r10
	movq	%r8, %rbx
	movq	%rsi, %r15
.L121:
	subq	%rdx, %r10
	subq	%rdx, %r11
	leaq	-16(%r10), %r8
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, %r9
	salq	$4, %r9
	cmpq	$14, %r11
	jbe	.L123
	movq	48(%rsp), %rsi
	movq	24(%rsp), %rcx
	xorl	%r11d, %r11d
	addq	%rdx, %rsi
	addq	%rdi, %rdx
	xorl	%edi, %edi
	addq	%rcx, %rsi
	addq	%rcx, %rdx
.L124:
	movdqa	(%rsi,%rdi), %xmm0
	addq	$1, %r11
	movdqu	(%rdx,%rdi), %xmm1
	movaps	%xmm1, (%rsi,%rdi)
	movups	%xmm0, (%rdx,%rdi)
	addq	$16, %rdi
	cmpq	%r8, %r11
	jb	.L124
	subq	%r9, %rax
	addq	%r9, %r15
	addq	%r9, %rbx
	cmpq	%r9, %r10
	je	.L117
.L123:
	movzbl	(%r15), %edx
	movzbl	(%rbx), %esi
	cmpq	$1, %rax
	movb	%sil, (%r15)
	movb	%dl, (%rbx)
	je	.L117
	movzbl	1(%r15), %edx
	movzbl	1(%rbx), %esi
	cmpq	$2, %rax
	movb	%sil, 1(%r15)
	movb	%dl, 1(%rbx)
	je	.L117
	movzbl	2(%r15), %edx
	movzbl	2(%rbx), %esi
	cmpq	$3, %rax
	movb	%sil, 2(%r15)
	movb	%dl, 2(%rbx)
	je	.L117
	movzbl	3(%r15), %edx
	movzbl	3(%rbx), %esi
	cmpq	$4, %rax
	movb	%sil, 3(%r15)
	movb	%dl, 3(%rbx)
	je	.L117
	movzbl	4(%r15), %edx
	movzbl	4(%rbx), %esi
	cmpq	$5, %rax
	movb	%sil, 4(%r15)
	movb	%dl, 4(%rbx)
	je	.L117
	movzbl	5(%r15), %edx
	movzbl	5(%rbx), %esi
	cmpq	$6, %rax
	movb	%sil, 5(%r15)
	movb	%dl, 5(%rbx)
	je	.L117
	movzbl	6(%r15), %edx
	movzbl	6(%rbx), %esi
	cmpq	$7, %rax
	movb	%sil, 6(%r15)
	movb	%dl, 6(%rbx)
	je	.L117
	movzbl	7(%r15), %edx
	movzbl	7(%rbx), %esi
	cmpq	$8, %rax
	movb	%sil, 7(%r15)
	movb	%dl, 7(%rbx)
	je	.L117
	movzbl	8(%r15), %edx
	movzbl	8(%rbx), %esi
	cmpq	$9, %rax
	movb	%sil, 8(%r15)
	movb	%dl, 8(%rbx)
	je	.L117
	movzbl	9(%r15), %edx
	movzbl	9(%rbx), %esi
	cmpq	$10, %rax
	movb	%sil, 9(%r15)
	movb	%dl, 9(%rbx)
	je	.L117
	movzbl	10(%r15), %edx
	movzbl	10(%rbx), %esi
	cmpq	$11, %rax
	movb	%sil, 10(%r15)
	movb	%dl, 10(%rbx)
	je	.L117
	movzbl	11(%r15), %edx
	movzbl	11(%rbx), %esi
	cmpq	$12, %rax
	movb	%sil, 11(%r15)
	movb	%dl, 11(%rbx)
	je	.L117
	movzbl	12(%r15), %edx
	movzbl	12(%rbx), %esi
	cmpq	$13, %rax
	movb	%sil, 12(%r15)
	movb	%dl, 12(%rbx)
	je	.L117
	movzbl	13(%r15), %edx
	movzbl	13(%rbx), %esi
	cmpq	$14, %rax
	movb	%sil, 13(%r15)
	movb	%dl, 13(%rbx)
	je	.L117
	movzbl	14(%r15), %eax
	movzbl	14(%rbx), %edx
	movb	%dl, 14(%r15)
	movb	%al, 14(%rbx)
	.p2align 4,,10
	.p2align 3
.L117:
	addq	$4, %r13
	cmpq	8(%rsp), %r13
	movl	(%rsp), %ebp
	jne	.L132
.L91:
	movq	1096(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L324
	addq	$1112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	.cfi_restore_state
	movq	16(%rsp), %rax
	movl	%ebp, %edi
	movq	24(%rsp), %rcx
	movq	40(%rsp), %r9
	movl	32(%rsp), %r8d
	addq	$4, %r13
	imulq	%rax, %rdi
	movq	%rax, %rdx
	leaq	(%rcx,%rdi), %rdi
	movq	%r12, %rcx
	call	rsort_msb
	cmpq	8(%rsp), %r13
	movl	(%rsp), %ebp
	jne	.L132
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L97:
	movslq	%ecx, %r14
	movq	24(%rsp), %rax
	movl	64(%rsp,%r14,4), %r9d
	movq	%r9, %r10
	imulq	%rbp, %r9
	addq	%r9, %rax
	cmpq	%rax, %rbx
	je	.L325
	movq	24(%rsp), %rcx
	leaq	16(%rcx,%r9), %rdx
	cmpq	%rdx, %rbx
	leaq	16(%rbx), %rdx
	setnb	%cl
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %cl
	je	.L104
	cmpq	$19, %rbp
	jbe	.L104
	movq	%rbx, %rcx
	negq	%rcx
	andl	$15, %ecx
	cmpq	%rbp, %rcx
	cmova	%rbp, %rcx
	testq	%rcx, %rcx
	je	.L134
	movzbl	(%rbx), %esi
	movzbl	(%rax), %r8d
	leaq	-1(%rbp), %r11
	cmpq	$1, %rcx
	leaq	1(%rbx), %rdx
	movb	%r8b, (%rbx)
	movb	%sil, (%rax)
	leaq	1(%rax), %r8
	movq	%r11, %rsi
	je	.L106
	movzbl	1(%rbx), %esi
	movzbl	1(%rax), %r8d
	cmpq	$2, %rcx
	leaq	2(%rbx), %rdx
	movb	%r8b, 1(%rbx)
	movb	%sil, 1(%rax)
	leaq	2(%rax), %r8
	leaq	-2(%rbp), %rsi
	je	.L106
	movzbl	2(%rbx), %esi
	movzbl	2(%rax), %r8d
	cmpq	$3, %rcx
	leaq	3(%rbx), %rdx
	movb	%r8b, 2(%rbx)
	movb	%sil, 2(%rax)
	leaq	3(%rax), %r8
	leaq	-3(%rbp), %rsi
	je	.L106
	movzbl	3(%rbx), %esi
	movzbl	3(%rax), %r8d
	cmpq	$4, %rcx
	leaq	4(%rbx), %rdx
	movb	%r8b, 3(%rbx)
	movb	%sil, 3(%rax)
	leaq	4(%rax), %r8
	leaq	-4(%rbp), %rsi
	je	.L106
	movzbl	4(%rbx), %esi
	movzbl	4(%rax), %r8d
	cmpq	$5, %rcx
	leaq	5(%rbx), %rdx
	movb	%r8b, 4(%rbx)
	movb	%sil, 4(%rax)
	leaq	5(%rax), %r8
	leaq	-5(%rbp), %rsi
	je	.L106
	movzbl	5(%rbx), %esi
	movzbl	5(%rax), %r8d
	cmpq	$6, %rcx
	leaq	6(%rbx), %rdx
	movb	%r8b, 5(%rbx)
	movb	%sil, 5(%rax)
	leaq	6(%rax), %r8
	leaq	-6(%rbp), %rsi
	je	.L106
	movzbl	6(%rbx), %esi
	movzbl	6(%rax), %r8d
	cmpq	$7, %rcx
	leaq	7(%rbx), %rdx
	movb	%r8b, 6(%rbx)
	movb	%sil, 6(%rax)
	leaq	7(%rax), %r8
	leaq	-7(%rbp), %rsi
	je	.L106
	movzbl	7(%rbx), %esi
	movzbl	7(%rax), %r8d
	cmpq	$8, %rcx
	leaq	8(%rbx), %rdx
	movb	%r8b, 7(%rbx)
	movb	%sil, 7(%rax)
	leaq	8(%rax), %r8
	leaq	-8(%rbp), %rsi
	je	.L106
	movzbl	8(%rbx), %esi
	movzbl	8(%rax), %r8d
	cmpq	$9, %rcx
	leaq	9(%rbx), %rdx
	movb	%r8b, 8(%rbx)
	movb	%sil, 8(%rax)
	leaq	9(%rax), %r8
	leaq	-9(%rbp), %rsi
	je	.L106
	movzbl	9(%rbx), %esi
	movzbl	9(%rax), %r8d
	cmpq	$10, %rcx
	leaq	10(%rbx), %rdx
	movb	%r8b, 9(%rbx)
	movb	%sil, 9(%rax)
	leaq	10(%rax), %r8
	leaq	-10(%rbp), %rsi
	je	.L106
	movzbl	10(%rbx), %esi
	movzbl	10(%rax), %r8d
	cmpq	$11, %rcx
	leaq	11(%rbx), %rdx
	movb	%r8b, 10(%rbx)
	movb	%sil, 10(%rax)
	leaq	11(%rax), %r8
	leaq	-11(%rbp), %rsi
	je	.L106
	movzbl	11(%rbx), %esi
	movzbl	11(%rax), %r8d
	cmpq	$12, %rcx
	leaq	12(%rbx), %rdx
	movb	%r8b, 11(%rbx)
	movb	%sil, 11(%rax)
	leaq	12(%rax), %r8
	leaq	-12(%rbp), %rsi
	je	.L106
	movzbl	12(%rbx), %esi
	movzbl	12(%rax), %r8d
	cmpq	$13, %rcx
	leaq	13(%rbx), %rdx
	movb	%r8b, 12(%rbx)
	movb	%sil, 12(%rax)
	leaq	13(%rax), %r8
	leaq	-13(%rbp), %rsi
	je	.L106
	movzbl	13(%rbx), %esi
	movzbl	13(%rax), %r8d
	cmpq	$15, %rcx
	leaq	14(%rbx), %rdx
	movb	%r8b, 13(%rbx)
	movb	%sil, 13(%rax)
	leaq	14(%rax), %r8
	leaq	-14(%rbp), %rsi
	jne	.L106
	movzbl	14(%rbx), %esi
	movzbl	14(%rax), %r8d
	leaq	15(%rbx), %rdx
	movb	%r8b, 14(%rbx)
	movb	%sil, 14(%rax)
	leaq	15(%rax), %r8
	leaq	-15(%rbp), %rsi
.L106:
	movq	%r8, %rax
.L105:
	movq	%rbp, %r8
	subq	%rcx, %r11
	subq	%rcx, %r8
	movq	%r8, (%rsp)
	subq	$16, %r8
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, 8(%rsp)
	salq	$4, %r8
	cmpq	$14, %r11
	jbe	.L107
	leaq	(%rbx,%rcx), %r11
	addq	%r9, %rcx
	addq	24(%rsp), %rcx
	movq	%rax, 48(%rsp)
	xorl	%r9d, %r9d
	movq	%r11, 32(%rsp)
	movq	32(%rsp), %rax
	xorl	%r11d, %r11d
.L108:
	movdqa	(%rax,%r9), %xmm0
	addq	$1, %r11
	movdqu	(%rcx,%r9), %xmm1
	movaps	%xmm1, (%rax,%r9)
	movups	%xmm0, (%rcx,%r9)
	addq	$16, %r9
	cmpq	8(%rsp), %r11
	jb	.L108
	movq	48(%rsp), %rax
	subq	%r8, %rsi
	addq	%r8, %rdx
	addq	%r8, %rax
	cmpq	%r8, (%rsp)
	je	.L113
.L107:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %r8d
	cmpq	$1, %rsi
	movb	%r8b, (%rdx)
	movb	%cl, (%rax)
	je	.L113
	movzbl	1(%rdx), %ecx
	movzbl	1(%rax), %r8d
	cmpq	$2, %rsi
	movb	%r8b, 1(%rdx)
	movb	%cl, 1(%rax)
	je	.L113
	movzbl	2(%rdx), %ecx
	movzbl	2(%rax), %r8d
	cmpq	$3, %rsi
	movb	%r8b, 2(%rdx)
	movb	%cl, 2(%rax)
	je	.L113
	movzbl	3(%rdx), %ecx
	movzbl	3(%rax), %r8d
	cmpq	$4, %rsi
	movb	%r8b, 3(%rdx)
	movb	%cl, 3(%rax)
	je	.L113
	movzbl	4(%rdx), %ecx
	movzbl	4(%rax), %r8d
	cmpq	$5, %rsi
	movb	%r8b, 4(%rdx)
	movb	%cl, 4(%rax)
	je	.L113
	movzbl	5(%rdx), %ecx
	movzbl	5(%rax), %r8d
	cmpq	$6, %rsi
	movb	%r8b, 5(%rdx)
	movb	%cl, 5(%rax)
	je	.L113
	movzbl	6(%rdx), %ecx
	movzbl	6(%rax), %r8d
	cmpq	$7, %rsi
	movb	%r8b, 6(%rdx)
	movb	%cl, 6(%rax)
	je	.L113
	movzbl	7(%rdx), %ecx
	movzbl	7(%rax), %r8d
	cmpq	$8, %rsi
	movb	%r8b, 7(%rdx)
	movb	%cl, 7(%rax)
	je	.L113
	movzbl	8(%rdx), %ecx
	movzbl	8(%rax), %r8d
	cmpq	$9, %rsi
	movb	%r8b, 8(%rdx)
	movb	%cl, 8(%rax)
	je	.L113
	movzbl	9(%rdx), %ecx
	movzbl	9(%rax), %r8d
	cmpq	$10, %rsi
	movb	%r8b, 9(%rdx)
	movb	%cl, 9(%rax)
	je	.L113
	movzbl	10(%rdx), %ecx
	movzbl	10(%rax), %r8d
	cmpq	$11, %rsi
	movb	%r8b, 10(%rdx)
	movb	%cl, 10(%rax)
	je	.L113
	movzbl	11(%rdx), %ecx
	movzbl	11(%rax), %r8d
	cmpq	$12, %rsi
	movb	%r8b, 11(%rdx)
	movb	%cl, 11(%rax)
	je	.L113
	movzbl	12(%rdx), %ecx
	movzbl	12(%rax), %r8d
	cmpq	$13, %rsi
	movb	%r8b, 12(%rdx)
	movb	%cl, 12(%rax)
	je	.L113
	movzbl	13(%rdx), %ecx
	movzbl	13(%rax), %r8d
	cmpq	$14, %rsi
	movb	%r8b, 13(%rdx)
	movb	%cl, 13(%rax)
	je	.L113
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%rdx)
	movb	%cl, 14(%rax)
.L113:
	movl	(%rdi), %edx
.L103:
	leal	1(%r10), %eax
	subl	$1, %edx
	movl	%edx, (%rdi)
	movl	%eax, 64(%rsp,%r14,4)
	jmp	.L96
.L135:
	movq	%rcx, %rax
	leaq	-1(%rcx), %r11
	movq	%rcx, %r10
	jmp	.L121
.L120:
	movq	16(%rsp), %rax
	leaq	(%rbx,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L129:
	movzbl	(%r15), %eax
	movzbl	(%rbx), %edx
	addq	$1, %rbx
	addq	$1, %r15
	cmpq	%rsi, %rbx
	movb	%dl, -1(%r15)
	movb	%al, -1(%rbx)
	jne	.L129
	addq	$4, %r13
	cmpq	8(%rsp), %r13
	movl	(%rsp), %ebp
	jne	.L132
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L134:
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	leaq	-1(%rbp), %r11
	jmp	.L105
.L104:
	leaq	(%rbx,%rbp), %r8
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L112:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %esi
	addq	$1, %rdx
	addq	$1, %rax
	cmpq	%rdx, %r8
	movb	%sil, -1(%rdx)
	movb	%cl, -1(%rax)
	jne	.L112
	jmp	.L113
.L325:
	addq	%rbp, %rbx
	jmp	.L103
.L324:
	call	__stack_chk_fail
	.cfi_endproc
.LFE80:
	.size	rsort_msb, .-rsort_msb
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	rsort_msb16
	.type	rsort_msb16, @function
rsort_msb16:
.LFB81:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%rdi, 24(%rsp)
	movq	%rsi, 48(%rsp)
	movq	%fs:40, %rdi
	movq	%rdi, 152(%rsp)
	xorl	%edi, %edi
	testq	%rsi, %rsi
	movl	%r8d, 12(%rsp)
	movq	%r9, 16(%rsp)
	je	.L331
	movl	%r8d, %eax
	movl	%r8d, %r12d
	movq	%r9, %r14
	shrl	%r12d
	testb	$1, %al
	movq	24(%rsp), %r13
	movq	48(%rsp), %rbx
	jne	.L332
	.p2align 4,,10
	.p2align 3
.L330:
	movq	%r13, %rdi
	movl	%r12d, %esi
	addq	%r15, %r13
	call	*%rbp
	andl	$15, %eax
	addl	$1, (%r14,%rax,4)
	subq	$1, %rbx
	jne	.L330
.L331:
	movq	16(%rsp), %rcx
	movl	$0, 80(%rsp)
	movl	$1, %r13d
	movl	(%rcx), %eax
	movl	%eax, 84(%rsp)
	addl	4(%rcx), %eax
	movl	%eax, 88(%rsp)
	addl	8(%rcx), %eax
	movl	%eax, 92(%rsp)
	addl	12(%rcx), %eax
	movl	%eax, 96(%rsp)
	addl	16(%rcx), %eax
	movl	%eax, 100(%rsp)
	addl	20(%rcx), %eax
	movl	%eax, 104(%rsp)
	addl	24(%rcx), %eax
	movl	%eax, 108(%rsp)
	addl	28(%rcx), %eax
	movl	%eax, 112(%rsp)
	addl	32(%rcx), %eax
	movl	%eax, 116(%rsp)
	addl	36(%rcx), %eax
	movl	%eax, 120(%rsp)
	addl	40(%rcx), %eax
	movl	%eax, 124(%rsp)
	addl	44(%rcx), %eax
	movl	%eax, 128(%rsp)
	addl	48(%rcx), %eax
	movl	%eax, 132(%rsp)
	addl	52(%rcx), %eax
	movl	%eax, 136(%rsp)
	addl	56(%rcx), %eax
	movl	%eax, 140(%rsp)
	movq	48(%rsp), %rax
	movq	24(%rsp), %r14
	imulq	%r15, %rax
	movq	%r14, %rbx
	addq	%r14, %rax
	movq	%rax, 32(%rsp)
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L542:
	cmpb	$15, %al
	je	.L352
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	80(%rsp,%rcx,4), %ebx
	imulq	%r15, %rbx
	addq	%r14, %rbx
.L338:
	addl	$1, %r13d
.L328:
	cmpq	32(%rsp), %rbx
	leal	-1(%r13), %r12d
	jnb	.L352
	movq	%rbx, %rdi
	movl	12(%rsp), %esi
	call	*%rbp
	movl	%eax, %edx
	movq	16(%rsp), %rdi
	shrb	$4, %dl
	testb	$1, %al
	cmovne	%edx, %eax
	andl	$15, %eax
	movzbl	%al, %edx
	movzbl	%al, %ecx
	leaq	(%rdi,%rdx,4), %rdi
	movl	(%rdi), %edx
	testl	%edx, %edx
	je	.L542
	movslq	%ecx, %r11
	movl	80(%rsp,%r11,4), %r12d
	movq	%r12, %r9
	imulq	%r15, %r12
	leaq	(%r14,%r12), %rax
	cmpq	%rax, %rbx
	je	.L543
	leaq	16(%r14,%r12), %rdx
	cmpq	%rdx, %rbx
	leaq	16(%rbx), %rdx
	setnb	%cl
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %cl
	je	.L341
	cmpq	$19, %r15
	jbe	.L341
	movq	%rbx, %r10
	negq	%r10
	andl	$15, %r10d
	cmpq	%r15, %r10
	cmova	%r15, %r10
	testq	%r10, %r10
	je	.L376
	movzbl	(%rbx), %ecx
	movzbl	(%rax), %esi
	cmpq	$1, %r10
	leaq	1(%rbx), %rdx
	leaq	1(%rax), %r8
	movb	%sil, (%rbx)
	movb	%cl, (%rax)
	leaq	-1(%r15), %rcx
	movq	%rcx, %rsi
	je	.L343
	movzbl	1(%rbx), %esi
	movzbl	1(%rax), %r8d
	cmpq	$2, %r10
	leaq	2(%rbx), %rdx
	movb	%r8b, 1(%rbx)
	movb	%sil, 1(%rax)
	leaq	2(%rax), %r8
	leaq	-2(%r15), %rsi
	je	.L343
	movzbl	2(%rbx), %esi
	movzbl	2(%rax), %r8d
	cmpq	$3, %r10
	leaq	3(%rbx), %rdx
	movb	%r8b, 2(%rbx)
	movb	%sil, 2(%rax)
	leaq	3(%rax), %r8
	leaq	-3(%r15), %rsi
	je	.L343
	movzbl	3(%rbx), %esi
	movzbl	3(%rax), %r8d
	cmpq	$4, %r10
	leaq	4(%rbx), %rdx
	movb	%r8b, 3(%rbx)
	movb	%sil, 3(%rax)
	leaq	4(%rax), %r8
	leaq	-4(%r15), %rsi
	je	.L343
	movzbl	4(%rbx), %esi
	movzbl	4(%rax), %r8d
	cmpq	$5, %r10
	leaq	5(%rbx), %rdx
	movb	%r8b, 4(%rbx)
	movb	%sil, 4(%rax)
	leaq	5(%rax), %r8
	leaq	-5(%r15), %rsi
	je	.L343
	movzbl	5(%rbx), %esi
	movzbl	5(%rax), %r8d
	cmpq	$6, %r10
	leaq	6(%rbx), %rdx
	movb	%r8b, 5(%rbx)
	movb	%sil, 5(%rax)
	leaq	6(%rax), %r8
	leaq	-6(%r15), %rsi
	je	.L343
	movzbl	6(%rbx), %esi
	movzbl	6(%rax), %r8d
	cmpq	$7, %r10
	leaq	7(%rbx), %rdx
	movb	%r8b, 6(%rbx)
	movb	%sil, 6(%rax)
	leaq	7(%rax), %r8
	leaq	-7(%r15), %rsi
	je	.L343
	movzbl	7(%rbx), %esi
	movzbl	7(%rax), %r8d
	cmpq	$8, %r10
	leaq	8(%rbx), %rdx
	movb	%r8b, 7(%rbx)
	movb	%sil, 7(%rax)
	leaq	8(%rax), %r8
	leaq	-8(%r15), %rsi
	je	.L343
	movzbl	8(%rbx), %esi
	movzbl	8(%rax), %r8d
	cmpq	$9, %r10
	leaq	9(%rbx), %rdx
	movb	%r8b, 8(%rbx)
	movb	%sil, 8(%rax)
	leaq	9(%rax), %r8
	leaq	-9(%r15), %rsi
	je	.L343
	movzbl	9(%rbx), %esi
	movzbl	9(%rax), %r8d
	cmpq	$10, %r10
	leaq	10(%rbx), %rdx
	movb	%r8b, 9(%rbx)
	movb	%sil, 9(%rax)
	leaq	10(%rax), %r8
	leaq	-10(%r15), %rsi
	je	.L343
	movzbl	10(%rbx), %esi
	movzbl	10(%rax), %r8d
	cmpq	$11, %r10
	leaq	11(%rbx), %rdx
	movb	%r8b, 10(%rbx)
	movb	%sil, 10(%rax)
	leaq	11(%rax), %r8
	leaq	-11(%r15), %rsi
	je	.L343
	movzbl	11(%rbx), %esi
	movzbl	11(%rax), %r8d
	cmpq	$12, %r10
	leaq	12(%rbx), %rdx
	movb	%r8b, 11(%rbx)
	movb	%sil, 11(%rax)
	leaq	12(%rax), %r8
	leaq	-12(%r15), %rsi
	je	.L343
	movzbl	12(%rbx), %esi
	movzbl	12(%rax), %r8d
	cmpq	$13, %r10
	leaq	13(%rbx), %rdx
	movb	%r8b, 12(%rbx)
	movb	%sil, 12(%rax)
	leaq	13(%rax), %r8
	leaq	-13(%r15), %rsi
	je	.L343
	movzbl	13(%rbx), %esi
	movzbl	13(%rax), %r8d
	cmpq	$15, %r10
	leaq	14(%rbx), %rdx
	movb	%r8b, 13(%rbx)
	movb	%sil, 13(%rax)
	leaq	14(%rax), %r8
	leaq	-14(%r15), %rsi
	jne	.L343
	movzbl	14(%rbx), %esi
	movzbl	14(%rax), %r8d
	leaq	15(%rbx), %rdx
	movb	%r8b, 14(%rbx)
	movb	%sil, 14(%rax)
	leaq	15(%rax), %r8
	leaq	-15(%r15), %rsi
.L343:
	movq	%r8, %rax
.L342:
	movq	%r15, %r8
	subq	%r10, %rcx
	subq	%r10, %r8
	movq	%r8, 40(%rsp)
	subq	$16, %r8
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, 56(%rsp)
	salq	$4, %r8
	cmpq	$14, %rcx
	jbe	.L344
	leaq	(%rbx,%r10), %rcx
	movq	%rax, 72(%rsp)
	movq	%rcx, 64(%rsp)
	leaq	(%r12,%r10), %rcx
	movq	64(%rsp), %rax
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
	addq	%r14, %rcx
.L345:
	movdqa	(%rax,%r10), %xmm0
	addq	$1, %r12
	movdqu	(%rcx,%r10), %xmm1
	movaps	%xmm1, (%rax,%r10)
	movups	%xmm0, (%rcx,%r10)
	addq	$16, %r10
	cmpq	56(%rsp), %r12
	jb	.L345
	movq	72(%rsp), %rax
	subq	%r8, %rsi
	addq	%r8, %rdx
	addq	%r8, %rax
	cmpq	%r8, 40(%rsp)
	je	.L350
	.p2align 4,,10
	.p2align 3
.L344:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %r8d
	cmpq	$1, %rsi
	movb	%r8b, (%rdx)
	movb	%cl, (%rax)
	je	.L350
	movzbl	1(%rdx), %ecx
	movzbl	1(%rax), %r8d
	cmpq	$2, %rsi
	movb	%r8b, 1(%rdx)
	movb	%cl, 1(%rax)
	je	.L350
	movzbl	2(%rdx), %ecx
	movzbl	2(%rax), %r8d
	cmpq	$3, %rsi
	movb	%r8b, 2(%rdx)
	movb	%cl, 2(%rax)
	je	.L350
	movzbl	3(%rdx), %ecx
	movzbl	3(%rax), %r8d
	cmpq	$4, %rsi
	movb	%r8b, 3(%rdx)
	movb	%cl, 3(%rax)
	je	.L350
	movzbl	4(%rdx), %ecx
	movzbl	4(%rax), %r8d
	cmpq	$5, %rsi
	movb	%r8b, 4(%rdx)
	movb	%cl, 4(%rax)
	je	.L350
	movzbl	5(%rdx), %ecx
	movzbl	5(%rax), %r8d
	cmpq	$6, %rsi
	movb	%r8b, 5(%rdx)
	movb	%cl, 5(%rax)
	je	.L350
	movzbl	6(%rdx), %ecx
	movzbl	6(%rax), %r8d
	cmpq	$7, %rsi
	movb	%r8b, 6(%rdx)
	movb	%cl, 6(%rax)
	je	.L350
	movzbl	7(%rdx), %ecx
	movzbl	7(%rax), %r8d
	cmpq	$8, %rsi
	movb	%r8b, 7(%rdx)
	movb	%cl, 7(%rax)
	je	.L350
	movzbl	8(%rdx), %ecx
	movzbl	8(%rax), %r8d
	cmpq	$9, %rsi
	movb	%r8b, 8(%rdx)
	movb	%cl, 8(%rax)
	je	.L350
	movzbl	9(%rdx), %ecx
	movzbl	9(%rax), %r8d
	cmpq	$10, %rsi
	movb	%r8b, 9(%rdx)
	movb	%cl, 9(%rax)
	je	.L350
	movzbl	10(%rdx), %ecx
	movzbl	10(%rax), %r8d
	cmpq	$11, %rsi
	movb	%r8b, 10(%rdx)
	movb	%cl, 10(%rax)
	je	.L350
	movzbl	11(%rdx), %ecx
	movzbl	11(%rax), %r8d
	cmpq	$12, %rsi
	movb	%r8b, 11(%rdx)
	movb	%cl, 11(%rax)
	je	.L350
	movzbl	12(%rdx), %ecx
	movzbl	12(%rax), %r8d
	cmpq	$13, %rsi
	movb	%r8b, 12(%rdx)
	movb	%cl, 12(%rax)
	je	.L350
	movzbl	13(%rdx), %ecx
	movzbl	13(%rax), %r8d
	cmpq	$14, %rsi
	movb	%r8b, 13(%rdx)
	movb	%cl, 13(%rax)
	je	.L350
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%rdx)
	movb	%cl, 14(%rax)
.L350:
	movl	(%rdi), %edx
.L340:
	leal	1(%r9), %eax
	subl	$1, %edx
	movl	%edx, (%rdi)
	movl	%eax, 80(%rsp,%r11,4)
	jmp	.L338
	.p2align 4,,10
	.p2align 3
.L332:
	movq	%r13, %rdi
	movl	%r12d, %esi
	addq	%r15, %r13
	call	*%rbp
	shrb	$4, %al
	movzbl	%al, %eax
	addl	$1, (%r14,%rax,4)
	subq	$1, %rbx
	jne	.L332
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L352:
	movl	12(%rsp), %edx
	addl	%r12d, selfcalls(%rip)
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L326
	movl	12(%rsp), %eax
	movl	48(%rsp), %esi
	leaq	140(%rsp), %r13
	movq	%r15, 32(%rsp)
	subl	$1, %eax
	movl	%eax, 40(%rsp)
	andl	$1, %eax
	movl	%eax, 56(%rsp)
	leaq	16(%r15), %rax
	movq	%rax, 64(%rsp)
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L544:
	addl	$1, counts(%rip)
	movl	%eax, %esi
.L354:
	leaq	76(%rsp), %rax
	subq	$4, %r13
	cmpq	%rax, %r13
	je	.L326
.L374:
	movl	0(%r13), %eax
	subl	%eax, %esi
	movl	%eax, 12(%rsp)
	je	.L544
	cmpl	$1, %esi
	je	.L545
	cmpl	$2, %esi
	jne	.L356
	movl	12(%rsp), %eax
	movq	32(%rsp), %rdi
	movq	24(%rsp), %r15
	movl	40(%rsp), %r12d
	imulq	%rdi, %rax
	addq	%rax, %r15
	movq	%rax, 48(%rsp)
	movl	56(%rsp), %eax
	leaq	(%r15,%rdi), %rbx
	testl	%eax, %eax
	jne	.L373
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L546:
	testl	%r12d, %r12d
	leal	-1(%r12), %eax
	je	.L372
	movl	%eax, %r12d
.L359:
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	*%rbp
	movl	%eax, %r14d
	movl	%r12d, %esi
	movq	%rbx, %rdi
	andl	$15, %r14d
	call	*%rbp
	andl	$15, %eax
	cmpb	%r14b, %al
	jnb	.L546
.L358:
	movq	48(%rsp), %rdx
	movq	32(%rsp), %rdi
	movq	64(%rsp), %rax
	movq	%rdi, %r10
	addq	%rdx, %rax
	addq	%rdx, %r10
	cmpq	%rax, %rdx
	movq	%rdx, %rax
	setge	%cl
	addq	$16, %rax
	cmpq	%rax, %r10
	setge	%al
	orb	%al, %cl
	je	.L362
	cmpq	$19, %rdi
	movq	%rdi, %rax
	jbe	.L362
	movq	%r15, %rdi
	movq	%rax, %rdx
	negq	%rdi
	andl	$15, %edi
	cmpq	%rax, %rdi
	cmova	%rax, %rdi
	testq	%rdi, %rdi
	je	.L378
	movzbl	(%r15), %ecx
	movzbl	(%rbx), %eax
	leaq	-1(%rdx), %rsi
	cmpq	$1, %rdi
	leaq	1(%r15), %r8
	movb	%al, (%r15)
	movb	%cl, (%rbx)
	leaq	1(%rbx), %rax
	movq	%rsi, %rcx
	je	.L392
	movzbl	1(%r15), %ecx
	movzbl	1(%rbx), %eax
	cmpq	$2, %rdi
	leaq	2(%r15), %r8
	movb	%al, 1(%r15)
	movb	%cl, 1(%rbx)
	leaq	2(%rbx), %rax
	leaq	-2(%rdx), %rcx
	je	.L392
	movzbl	2(%r15), %ecx
	movzbl	2(%rbx), %eax
	cmpq	$3, %rdi
	leaq	3(%r15), %r8
	movb	%al, 2(%r15)
	movb	%cl, 2(%rbx)
	leaq	3(%rbx), %rax
	leaq	-3(%rdx), %rcx
	je	.L392
	movzbl	3(%r15), %ecx
	movzbl	3(%rbx), %eax
	cmpq	$4, %rdi
	leaq	4(%r15), %r8
	movb	%al, 3(%r15)
	movb	%cl, 3(%rbx)
	leaq	4(%rbx), %rax
	leaq	-4(%rdx), %rcx
	je	.L392
	movzbl	4(%r15), %ecx
	movzbl	4(%rbx), %eax
	cmpq	$5, %rdi
	leaq	5(%r15), %r8
	movb	%al, 4(%r15)
	movb	%cl, 4(%rbx)
	leaq	5(%rbx), %rax
	leaq	-5(%rdx), %rcx
	je	.L392
	movzbl	5(%r15), %ecx
	movzbl	5(%rbx), %eax
	cmpq	$6, %rdi
	leaq	6(%r15), %r8
	movb	%al, 5(%r15)
	movb	%cl, 5(%rbx)
	leaq	6(%rbx), %rax
	leaq	-6(%rdx), %rcx
	je	.L392
	movzbl	6(%r15), %ecx
	movzbl	6(%rbx), %eax
	cmpq	$7, %rdi
	leaq	7(%r15), %r8
	movb	%al, 6(%r15)
	movb	%cl, 6(%rbx)
	leaq	7(%rbx), %rax
	leaq	-7(%rdx), %rcx
	je	.L392
	movzbl	7(%r15), %ecx
	movzbl	7(%rbx), %eax
	cmpq	$8, %rdi
	leaq	8(%r15), %r8
	movb	%al, 7(%r15)
	movb	%cl, 7(%rbx)
	leaq	8(%rbx), %rax
	leaq	-8(%rdx), %rcx
	je	.L392
	movzbl	8(%r15), %ecx
	movzbl	8(%rbx), %eax
	cmpq	$9, %rdi
	leaq	9(%r15), %r8
	movb	%al, 8(%r15)
	movb	%cl, 8(%rbx)
	leaq	9(%rbx), %rax
	leaq	-9(%rdx), %rcx
	je	.L392
	movzbl	9(%r15), %ecx
	movzbl	9(%rbx), %eax
	cmpq	$10, %rdi
	leaq	10(%r15), %r8
	movb	%al, 9(%r15)
	movb	%cl, 9(%rbx)
	leaq	10(%rbx), %rax
	leaq	-10(%rdx), %rcx
	je	.L392
	movzbl	10(%r15), %ecx
	movzbl	10(%rbx), %eax
	cmpq	$11, %rdi
	leaq	11(%r15), %r8
	movb	%al, 10(%r15)
	movb	%cl, 10(%rbx)
	leaq	11(%rbx), %rax
	leaq	-11(%rdx), %rcx
	je	.L392
	movzbl	11(%r15), %ecx
	movzbl	11(%rbx), %eax
	cmpq	$12, %rdi
	leaq	12(%r15), %r8
	movb	%al, 11(%r15)
	movb	%cl, 11(%rbx)
	leaq	12(%rbx), %rax
	leaq	-12(%rdx), %rcx
	je	.L392
	movzbl	12(%r15), %ecx
	movzbl	12(%rbx), %eax
	cmpq	$13, %rdi
	leaq	13(%r15), %r8
	movb	%al, 12(%r15)
	movb	%cl, 12(%rbx)
	leaq	13(%rbx), %rax
	leaq	-13(%rdx), %rcx
	je	.L392
	movzbl	13(%r15), %ecx
	movzbl	13(%rbx), %eax
	cmpq	$15, %rdi
	leaq	14(%r15), %r8
	movb	%al, 13(%r15)
	movb	%cl, 13(%rbx)
	leaq	14(%rbx), %rax
	leaq	-14(%rdx), %rcx
	jne	.L392
	movzbl	14(%r15), %ecx
	movzbl	14(%rbx), %eax
	addq	$15, %r15
	movq	32(%rsp), %r11
	movb	%al, -1(%r15)
	movb	%cl, 14(%rbx)
	leaq	15(%rbx), %rax
	leaq	-15(%rdx), %rcx
.L363:
	subq	%rdi, %r11
	subq	%rdi, %rsi
	leaq	-16(%r11), %r8
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, %r9
	salq	$4, %r9
	cmpq	$14, %rsi
	jbe	.L365
	movq	48(%rsp), %rsi
	movq	24(%rsp), %rbx
	addq	%rdi, %rsi
	addq	%r10, %rdi
	xorl	%r10d, %r10d
	addq	%rbx, %rsi
	addq	%rbx, %rdi
	xorl	%ebx, %ebx
.L366:
	movdqa	(%rsi,%r10), %xmm0
	addq	$1, %rbx
	movdqu	(%rdi,%r10), %xmm1
	movaps	%xmm1, (%rsi,%r10)
	movups	%xmm0, (%rdi,%r10)
	addq	$16, %r10
	cmpq	%rbx, %r8
	ja	.L366
	subq	%r9, %rcx
	addq	%r9, %r15
	addq	%r9, %rax
	cmpq	%r9, %r11
	je	.L372
	.p2align 4,,10
	.p2align 3
.L365:
	movzbl	(%r15), %esi
	movzbl	(%rax), %edi
	cmpq	$1, %rcx
	movb	%dil, (%r15)
	movb	%sil, (%rax)
	je	.L372
	movzbl	1(%r15), %esi
	movzbl	1(%rax), %edi
	cmpq	$2, %rcx
	movb	%dil, 1(%r15)
	movb	%sil, 1(%rax)
	je	.L372
	movzbl	2(%r15), %esi
	movzbl	2(%rax), %edi
	cmpq	$3, %rcx
	movb	%dil, 2(%r15)
	movb	%sil, 2(%rax)
	je	.L372
	movzbl	3(%r15), %esi
	movzbl	3(%rax), %edi
	cmpq	$4, %rcx
	movb	%dil, 3(%r15)
	movb	%sil, 3(%rax)
	je	.L372
	movzbl	4(%r15), %esi
	movzbl	4(%rax), %edi
	cmpq	$5, %rcx
	movb	%dil, 4(%r15)
	movb	%sil, 4(%rax)
	je	.L372
	movzbl	5(%r15), %esi
	movzbl	5(%rax), %edi
	cmpq	$6, %rcx
	movb	%dil, 5(%r15)
	movb	%sil, 5(%rax)
	je	.L372
	movzbl	6(%r15), %esi
	movzbl	6(%rax), %edi
	cmpq	$7, %rcx
	movb	%dil, 6(%r15)
	movb	%sil, 6(%rax)
	je	.L372
	movzbl	7(%r15), %esi
	movzbl	7(%rax), %edi
	cmpq	$8, %rcx
	movb	%dil, 7(%r15)
	movb	%sil, 7(%rax)
	je	.L372
	movzbl	8(%r15), %esi
	movzbl	8(%rax), %edi
	cmpq	$9, %rcx
	movb	%dil, 8(%r15)
	movb	%sil, 8(%rax)
	je	.L372
	movzbl	9(%r15), %esi
	movzbl	9(%rax), %edi
	cmpq	$10, %rcx
	movb	%dil, 9(%r15)
	movb	%sil, 9(%rax)
	je	.L372
	movzbl	10(%r15), %esi
	movzbl	10(%rax), %edi
	cmpq	$11, %rcx
	movb	%dil, 10(%r15)
	movb	%sil, 10(%rax)
	je	.L372
	movzbl	11(%r15), %esi
	movzbl	11(%rax), %edi
	cmpq	$12, %rcx
	movb	%dil, 11(%r15)
	movb	%sil, 11(%rax)
	je	.L372
	movzbl	12(%r15), %esi
	movzbl	12(%rax), %edi
	cmpq	$13, %rcx
	movb	%dil, 12(%r15)
	movb	%sil, 12(%rax)
	je	.L372
	movzbl	13(%r15), %esi
	movzbl	13(%rax), %edi
	cmpq	$14, %rcx
	movb	%dil, 13(%r15)
	movb	%sil, 13(%rax)
	je	.L372
	movzbl	14(%r15), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%r15)
	movb	%cl, 14(%rax)
.L372:
	addq	$1, shuffles(%rip)
	movl	12(%rsp), %esi
.L548:
	leaq	76(%rsp), %rax
	subq	$4, %r13
	cmpq	%rax, %r13
	jne	.L374
.L326:
	movq	152(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L547
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L361:
	.cfi_restore_state
	testl	%r12d, %r12d
	leal	-1(%r12), %eax
	je	.L372
	movl	%eax, %r12d
.L373:
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	*%rbp
	movl	%eax, %r14d
	movl	%r12d, %esi
	movq	%rbx, %rdi
	shrb	$4, %r14b
	call	*%rbp
	shrb	$4, %al
	cmpb	%al, %r14b
	jbe	.L361
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L392:
	movq	%r8, %r15
	movq	32(%rsp), %r11
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L356:
	movl	12(%rsp), %edi
	movq	32(%rsp), %rax
	movl	%esi, %esi
	movq	16(%rsp), %r9
	movl	40(%rsp), %r8d
	movq	%rbp, %rcx
	movq	%rax, %rdx
	imulq	%rax, %rdi
	addq	24(%rsp), %rdi
	call	rsort_msb16
	addq	$1, shuffles(%rip)
	movl	12(%rsp), %esi
	jmp	.L548
	.p2align 4,,10
	.p2align 3
.L545:
	addl	$1, poscalc(%rip)
	movl	%eax, %esi
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L376:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	leaq	-1(%r15), %rcx
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L341:
	leaq	(%rbx,%r15), %rsi
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L349:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %r8d
	addq	$1, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rsi
	movb	%r8b, -1(%rdx)
	movb	%cl, -1(%rax)
	jne	.L349
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L543:
	addq	%r15, %rbx
	jmp	.L340
	.p2align 4,,10
	.p2align 3
.L378:
	movq	%rbx, %rax
	movq	32(%rsp), %rbx
	movq	%rbx, %rcx
	leaq	-1(%rbx), %rsi
	movq	%rbx, %r11
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L362:
	movq	32(%rsp), %rax
	leaq	(%rbx,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L370:
	movzbl	(%r15), %eax
	movzbl	(%rbx), %edx
	addq	$1, %rbx
	addq	$1, %r15
	cmpq	%rsi, %rbx
	movb	%dl, -1(%r15)
	movb	%al, -1(%rbx)
	jne	.L370
	addq	$1, shuffles(%rip)
	movl	12(%rsp), %esi
	jmp	.L548
.L547:
	call	__stack_chk_fail
	.cfi_endproc
.LFE81:
	.size	rsort_msb16, .-rsort_msb16
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	_rsort
	.type	_rsort, @function
_rsort:
.LFB84:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	$1, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	192(%rsp), %rbx
	movl	%eax, 32(%rsp)
	leaq	16(%rsi), %rax
	movq	%rdi, 16(%rsp)
	movq	%rdx, (%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%fs:40, %rbx
	movq	%rbx, 120(%rsp)
	xorl	%ebx, %ebx
	cmpq	%rdx, %rdi
	jnb	.L606
	movq	%rcx, %r14
	movq	%rsi, %r15
	movq	%r9, %r12
	.p2align 4,,10
	.p2align 3
.L738:
	movq	16(%rsp), %rbx
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	movl	36(%rsp), %esi
	movq	%rbx, %rdi
	call	*%r14
	cmpq	%rbx, (%rsp)
	movl	%eax, %ebp
	movl	36(%rsp), %r13d
	ja	.L740
	jmp	.L822
	.p2align 4,,10
	.p2align 3
.L555:
	addl	$1, counts(%rip)
	movq	%rbx, %rdi
	movl	32(%rsp), %esi
	call	*%r14
	movzbl	%al, %edx
	addq	%r15, %rbx
	addl	$1, (%r12,%rdx,4)
	movl	%eax, %edx
	andl	$63, %eax
	shrb	$6, %dl
	movl	%eax, %ecx
	movl	$1, %eax
	andl	$3, %edx
	salq	%cl, %rax
	orq	%rax, 80(%rsp,%rdx,8)
	cmpq	%rbx, (%rsp)
	jbe	.L818
.L740:
	movl	%r13d, %esi
	movq	%rbx, %rdi
	call	*%r14
	cmpb	%al, %bpl
	je	.L555
.L818:
	movq	%rbx, %rax
	subq	16(%rsp), %rax
	xorl	%edx, %edx
	divq	%r15
	cmpq	$1, %rax
	je	.L556
	cmpq	$2, %rax
	jne	.L552
	movq	16(%rsp), %rax
	movl	32(%rsp), %r13d
	movq	%r12, 40(%rsp)
	movq	%rbx, 24(%rsp)
	movl	%r13d, %r12d
	leaq	(%rax,%r15), %rbp
	movq	%rax, %r13
	jmp	.L570
	.p2align 4,,10
	.p2align 3
.L558:
	jb	.L811
	testl	%r12d, %r12d
	leal	-1(%r12), %eax
	je	.L811
	movl	%eax, %r12d
.L570:
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	*%r14
	movl	%eax, %ebx
	movl	%r12d, %esi
	movq	%rbp, %rdi
	call	*%r14
	cmpb	%al, %bl
	jbe	.L558
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rbx
	movq	40(%rsp), %r12
	movq	%rdi, %rax
	addq	$16, %rax
	cmpq	%rax, %rbp
	setnb	%dl
	cmpq	$0, 72(%rsp)
	setle	%al
	orb	%al, %dl
	je	.L559
	cmpq	$19, %r15
	jbe	.L559
	movq	%rdi, %rcx
	negq	%rcx
	andl	$15, %ecx
	cmpq	%r15, %rcx
	cmova	%r15, %rcx
	testq	%rcx, %rcx
	je	.L610
	movzbl	(%rdi), %esi
	movzbl	0(%rbp), %eax
	leaq	-1(%r15), %r9
	cmpq	$1, %rcx
	leaq	1(%rdi), %rdx
	movb	%al, (%rdi)
	movb	%sil, 0(%rbp)
	leaq	1(%rbp), %rax
	movq	%r9, %rsi
	je	.L560
	movzbl	1(%rdi), %esi
	movzbl	1(%rbp), %eax
	cmpq	$2, %rcx
	leaq	2(%rdi), %rdx
	movb	%al, 1(%rdi)
	movb	%sil, 1(%rbp)
	leaq	2(%rbp), %rax
	leaq	-2(%r15), %rsi
	je	.L560
	movzbl	2(%rdi), %esi
	movzbl	2(%rbp), %eax
	cmpq	$3, %rcx
	leaq	3(%rdi), %rdx
	movb	%al, 2(%rdi)
	movb	%sil, 2(%rbp)
	leaq	3(%rbp), %rax
	leaq	-3(%r15), %rsi
	je	.L560
	movzbl	3(%rdi), %esi
	movzbl	3(%rbp), %eax
	cmpq	$4, %rcx
	leaq	4(%rdi), %rdx
	movb	%al, 3(%rdi)
	movb	%sil, 3(%rbp)
	leaq	4(%rbp), %rax
	leaq	-4(%r15), %rsi
	je	.L560
	movzbl	4(%rdi), %esi
	movzbl	4(%rbp), %eax
	cmpq	$5, %rcx
	leaq	5(%rdi), %rdx
	movb	%al, 4(%rdi)
	movb	%sil, 4(%rbp)
	leaq	5(%rbp), %rax
	leaq	-5(%r15), %rsi
	je	.L560
	movzbl	5(%rdi), %esi
	movzbl	5(%rbp), %eax
	cmpq	$6, %rcx
	leaq	6(%rdi), %rdx
	movb	%al, 5(%rdi)
	movb	%sil, 5(%rbp)
	leaq	6(%rbp), %rax
	leaq	-6(%r15), %rsi
	je	.L560
	movzbl	6(%rdi), %esi
	movzbl	6(%rbp), %eax
	cmpq	$7, %rcx
	leaq	7(%rdi), %rdx
	movb	%al, 6(%rdi)
	movb	%sil, 6(%rbp)
	leaq	7(%rbp), %rax
	leaq	-7(%r15), %rsi
	je	.L560
	movzbl	7(%rdi), %esi
	movzbl	7(%rbp), %eax
	cmpq	$8, %rcx
	leaq	8(%rdi), %rdx
	movb	%al, 7(%rdi)
	movb	%sil, 7(%rbp)
	leaq	8(%rbp), %rax
	leaq	-8(%r15), %rsi
	je	.L560
	movzbl	8(%rdi), %esi
	movzbl	8(%rbp), %eax
	cmpq	$9, %rcx
	leaq	9(%rdi), %rdx
	movb	%al, 8(%rdi)
	movb	%sil, 8(%rbp)
	leaq	9(%rbp), %rax
	leaq	-9(%r15), %rsi
	je	.L560
	movzbl	9(%rdi), %esi
	movzbl	9(%rbp), %eax
	cmpq	$10, %rcx
	leaq	10(%rdi), %rdx
	movb	%al, 9(%rdi)
	movb	%sil, 9(%rbp)
	leaq	10(%rbp), %rax
	leaq	-10(%r15), %rsi
	je	.L560
	movzbl	10(%rdi), %esi
	movzbl	10(%rbp), %eax
	cmpq	$11, %rcx
	leaq	11(%rdi), %rdx
	movb	%al, 10(%rdi)
	movb	%sil, 10(%rbp)
	leaq	11(%rbp), %rax
	leaq	-11(%r15), %rsi
	je	.L560
	movzbl	11(%rdi), %esi
	movzbl	11(%rbp), %eax
	cmpq	$12, %rcx
	leaq	12(%rdi), %rdx
	movb	%al, 11(%rdi)
	movb	%sil, 11(%rbp)
	leaq	12(%rbp), %rax
	leaq	-12(%r15), %rsi
	je	.L560
	movzbl	12(%rdi), %esi
	movzbl	12(%rbp), %eax
	cmpq	$13, %rcx
	leaq	13(%rdi), %rdx
	movb	%al, 12(%rdi)
	movb	%sil, 12(%rbp)
	leaq	13(%rbp), %rax
	leaq	-13(%r15), %rsi
	je	.L560
	movzbl	13(%rdi), %esi
	movzbl	13(%rbp), %eax
	cmpq	$15, %rcx
	leaq	14(%rdi), %rdx
	movb	%al, 13(%rdi)
	movb	%sil, 13(%rbp)
	leaq	14(%rbp), %rax
	leaq	-14(%r15), %rsi
	jne	.L560
	movzbl	14(%rdi), %esi
	movzbl	14(%rbp), %eax
	leaq	15(%rdi), %rdx
	movb	%al, 14(%rdi)
	movb	%sil, 14(%rbp)
	leaq	15(%rbp), %rax
	leaq	-15(%r15), %rsi
.L560:
	movq	%r15, %r13
	subq	%rcx, %r9
	subq	%rcx, %r13
	leaq	-16(%r13), %rdi
	shrq	$4, %rdi
	addq	$1, %rdi
	movq	%rdi, %r8
	salq	$4, %r8
	cmpq	$14, %r9
	jbe	.L562
	movq	16(%rsp), %r10
	xorl	%r9d, %r9d
	movq	%r10, %r11
	addq	%rcx, %r11
	addq	%r15, %rcx
	addq	%r10, %rcx
	xorl	%r10d, %r10d
.L563:
	movdqa	(%r11,%r9), %xmm0
	addq	$1, %r10
	movdqu	(%rcx,%r9), %xmm1
	movaps	%xmm1, (%r11,%r9)
	movups	%xmm0, (%rcx,%r9)
	addq	$16, %r9
	cmpq	%r10, %rdi
	ja	.L563
	subq	%r8, %rsi
	addq	%r8, %rdx
	addq	%r8, %rax
	cmpq	%r13, %r8
	je	.L569
.L562:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %edi
	cmpq	$1, %rsi
	movb	%dil, (%rdx)
	movb	%cl, (%rax)
	je	.L569
	movzbl	1(%rdx), %ecx
	movzbl	1(%rax), %edi
	cmpq	$2, %rsi
	movb	%dil, 1(%rdx)
	movb	%cl, 1(%rax)
	je	.L569
	movzbl	2(%rdx), %ecx
	movzbl	2(%rax), %edi
	cmpq	$3, %rsi
	movb	%dil, 2(%rdx)
	movb	%cl, 2(%rax)
	je	.L569
	movzbl	3(%rdx), %ecx
	movzbl	3(%rax), %edi
	cmpq	$4, %rsi
	movb	%dil, 3(%rdx)
	movb	%cl, 3(%rax)
	je	.L569
	movzbl	4(%rdx), %ecx
	movzbl	4(%rax), %edi
	cmpq	$5, %rsi
	movb	%dil, 4(%rdx)
	movb	%cl, 4(%rax)
	je	.L569
	movzbl	5(%rdx), %ecx
	movzbl	5(%rax), %edi
	cmpq	$6, %rsi
	movb	%dil, 5(%rdx)
	movb	%cl, 5(%rax)
	je	.L569
	movzbl	6(%rdx), %ecx
	movzbl	6(%rax), %edi
	cmpq	$7, %rsi
	movb	%dil, 6(%rdx)
	movb	%cl, 6(%rax)
	je	.L569
	movzbl	7(%rdx), %ecx
	movzbl	7(%rax), %edi
	cmpq	$8, %rsi
	movb	%dil, 7(%rdx)
	movb	%cl, 7(%rax)
	je	.L569
	movzbl	8(%rdx), %ecx
	movzbl	8(%rax), %edi
	cmpq	$9, %rsi
	movb	%dil, 8(%rdx)
	movb	%cl, 8(%rax)
	je	.L569
	movzbl	9(%rdx), %ecx
	movzbl	9(%rax), %edi
	cmpq	$10, %rsi
	movb	%dil, 9(%rdx)
	movb	%cl, 9(%rax)
	je	.L569
	movzbl	10(%rdx), %ecx
	movzbl	10(%rax), %edi
	cmpq	$11, %rsi
	movb	%dil, 10(%rdx)
	movb	%cl, 10(%rax)
	je	.L569
	movzbl	11(%rdx), %ecx
	movzbl	11(%rax), %edi
	cmpq	$12, %rsi
	movb	%dil, 11(%rdx)
	movb	%cl, 11(%rax)
	je	.L569
	movzbl	12(%rdx), %ecx
	movzbl	12(%rax), %edi
	cmpq	$13, %rsi
	movb	%dil, 12(%rdx)
	movb	%cl, 12(%rax)
	je	.L569
	movzbl	13(%rdx), %ecx
	movzbl	13(%rax), %edi
	cmpq	$14, %rsi
	movb	%dil, 13(%rdx)
	movb	%cl, 13(%rax)
	je	.L569
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%rdx)
	movb	%cl, 14(%rax)
	.p2align 4,,10
	.p2align 3
.L569:
	movl	32(%rsp), %esi
	movq	%rbp, %rdi
	call	*%r14
	movzbl	%al, %eax
	movl	$0, (%r12,%rax,4)
.L556:
	movl	32(%rsp), %esi
	movq	16(%rsp), %rdi
	call	*%r14
	movzbl	%al, %eax
	movq	%rbx, 16(%rsp)
	movl	$0, (%r12,%rax,4)
.L571:
	cmpq	%rbx, (%rsp)
	ja	.L738
.L606:
	movq	120(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L823
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L811:
	.cfi_restore_state
	movq	24(%rsp), %rbx
	movq	40(%rsp), %r12
	jmp	.L569
.L822:
	movq	16(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L552:
	movq	80(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, 48(%rsp)
	jne	.L824
	movq	88(%rsp), %r9
	testq	%r9, %r9
	jne	.L825
	movq	96(%rsp), %r8
	testq	%r8, %r8
	jne	.L826
	movq	104(%rsp), %rdi
	xorl	%ecx, %ecx
	rep bsfq	%rdi, %rcx
	addl	$192, %ecx
	testq	%rdi, %rdi
	je	.L577
.L573:
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L608:
	movslq	%ecx, %rax
	addl	%esi, %edx
	addl	$1, %ecx
	movq	8(%rsp), %rsi
	movq	$-1, %r10
	addl	$1, poscalc(%rip)
	salq	%cl, %r10
	shrl	$6, %ecx
	cmpl	$1, %ecx
	movl	%edx, (%rsi,%rax,4)
	movl	(%r12,%rax,4), %esi
	je	.L580
	jb	.L581
	cmpl	$2, %ecx
	je	.L582
	cmpl	$3, %ecx
	je	.L583
.L577:
	movq	16(%rsp), %rax
	cmpq	%rbx, %rax
	movq	%rax, %rbp
	jnb	.L585
	movq	%rbx, 24(%rsp)
	movq	16(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L739:
	addq	$1, shuffles(%rip)
	movq	%rbp, %rdi
	movl	32(%rsp), %esi
	call	*%r14
	movzbl	%al, %edi
	salq	$2, %rdi
	leaq	(%r12,%rdi), %r8
	movl	(%r8), %edx
	testl	%edx, %edx
	jne	.L586
	movzbl	%al, %ecx
	movq	$-1, %rax
	addl	$1, %ecx
	salq	%cl, %rax
	shrl	$6, %ecx
	cmpl	$1, %ecx
	je	.L587
	jb	.L588
	cmpl	$2, %ecx
	je	.L589
	cmpl	$3, %ecx
	je	.L590
.L814:
	movq	24(%rsp), %rbx
.L585:
	movl	36(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L827
	movq	%rbx, 16(%rsp)
	jmp	.L571
	.p2align 4,,10
	.p2align 3
.L581:
	movq	%r10, %rax
	andq	48(%rsp), %rax
	xorl	%ecx, %ecx
	movq	$-1, %r10
	rep bsfq	%rax, %rcx
	testq	%rax, %rax
	jne	.L608
.L580:
	movq	%r10, %rax
	movq	$-1, %r10
	andq	%r9, %rax
	testq	%rax, %rax
	jne	.L828
.L582:
	movq	%r10, %rax
	movq	$-1, %r10
	andq	%r8, %rax
	testq	%rax, %rax
	jne	.L829
.L583:
	andq	%rdi, %r10
	je	.L577
	xorl	%ecx, %ecx
	rep bsfq	%r10, %rcx
	addl	$192, %ecx
	jmp	.L608
	.p2align 4,,10
	.p2align 3
.L829:
	xorl	%ecx, %ecx
	rep bsfq	%rax, %rcx
	subl	$-128, %ecx
	jmp	.L608
	.p2align 4,,10
	.p2align 3
.L586:
	addq	8(%rsp), %rdi
	movl	(%rdi), %r13d
	imulq	%r15, %r13
	leaq	(%rbx,%r13), %rax
	cmpq	%rax, %rbp
	je	.L830
	leaq	16(%rbx,%r13), %rdx
	cmpq	%rdx, %rbp
	leaq	16(%rbp), %rdx
	setnb	%cl
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %cl
	je	.L594
	cmpq	$19, %r15
	jbe	.L594
	movq	%rbp, %r11
	negq	%r11
	andl	$15, %r11d
	cmpq	%r15, %r11
	cmova	%r15, %r11
	testq	%r11, %r11
	je	.L618
	movzbl	0(%rbp), %ecx
	movzbl	(%rax), %esi
	cmpq	$1, %r11
	leaq	1(%rbp), %rdx
	leaq	1(%rax), %r9
	movb	%sil, 0(%rbp)
	movb	%cl, (%rax)
	leaq	-1(%r15), %rcx
	movq	%rcx, %rsi
	je	.L632
	movzbl	1(%rbp), %esi
	movzbl	1(%rax), %r9d
	cmpq	$2, %r11
	leaq	2(%rbp), %rdx
	movb	%r9b, 1(%rbp)
	movb	%sil, 1(%rax)
	leaq	2(%rax), %r9
	leaq	-2(%r15), %rsi
	je	.L632
	movzbl	2(%rbp), %esi
	movzbl	2(%rax), %r9d
	cmpq	$3, %r11
	leaq	3(%rbp), %rdx
	movb	%r9b, 2(%rbp)
	movb	%sil, 2(%rax)
	leaq	3(%rax), %r9
	leaq	-3(%r15), %rsi
	je	.L632
	movzbl	3(%rbp), %esi
	movzbl	3(%rax), %r9d
	cmpq	$4, %r11
	leaq	4(%rbp), %rdx
	movb	%r9b, 3(%rbp)
	movb	%sil, 3(%rax)
	leaq	4(%rax), %r9
	leaq	-4(%r15), %rsi
	je	.L632
	movzbl	4(%rbp), %esi
	movzbl	4(%rax), %r9d
	cmpq	$5, %r11
	leaq	5(%rbp), %rdx
	movb	%r9b, 4(%rbp)
	movb	%sil, 4(%rax)
	leaq	5(%rax), %r9
	leaq	-5(%r15), %rsi
	je	.L632
	movzbl	5(%rbp), %esi
	movzbl	5(%rax), %r9d
	cmpq	$6, %r11
	leaq	6(%rbp), %rdx
	movb	%r9b, 5(%rbp)
	movb	%sil, 5(%rax)
	leaq	6(%rax), %r9
	leaq	-6(%r15), %rsi
	je	.L632
	movzbl	6(%rbp), %esi
	movzbl	6(%rax), %r9d
	cmpq	$7, %r11
	leaq	7(%rbp), %rdx
	movb	%r9b, 6(%rbp)
	movb	%sil, 6(%rax)
	leaq	7(%rax), %r9
	leaq	-7(%r15), %rsi
	je	.L632
	movzbl	7(%rbp), %esi
	movzbl	7(%rax), %r9d
	cmpq	$8, %r11
	leaq	8(%rbp), %rdx
	movb	%r9b, 7(%rbp)
	movb	%sil, 7(%rax)
	leaq	8(%rax), %r9
	leaq	-8(%r15), %rsi
	je	.L632
	movzbl	8(%rbp), %esi
	movzbl	8(%rax), %r9d
	cmpq	$9, %r11
	leaq	9(%rbp), %rdx
	movb	%r9b, 8(%rbp)
	movb	%sil, 8(%rax)
	leaq	9(%rax), %r9
	leaq	-9(%r15), %rsi
	je	.L632
	movzbl	9(%rbp), %esi
	movzbl	9(%rax), %r9d
	cmpq	$10, %r11
	leaq	10(%rbp), %rdx
	movb	%r9b, 9(%rbp)
	movb	%sil, 9(%rax)
	leaq	10(%rax), %r9
	leaq	-10(%r15), %rsi
	je	.L632
	movzbl	10(%rbp), %esi
	movzbl	10(%rax), %r9d
	cmpq	$11, %r11
	leaq	11(%rbp), %rdx
	movb	%r9b, 10(%rbp)
	movb	%sil, 10(%rax)
	leaq	11(%rax), %r9
	leaq	-11(%r15), %rsi
	je	.L632
	movzbl	11(%rbp), %esi
	movzbl	11(%rax), %r9d
	cmpq	$12, %r11
	leaq	12(%rbp), %rdx
	movb	%r9b, 11(%rbp)
	movb	%sil, 11(%rax)
	leaq	12(%rax), %r9
	leaq	-12(%r15), %rsi
	je	.L632
	movzbl	12(%rbp), %esi
	movzbl	12(%rax), %r9d
	cmpq	$13, %r11
	leaq	13(%rbp), %rdx
	movb	%r9b, 12(%rbp)
	movb	%sil, 12(%rax)
	leaq	13(%rax), %r9
	leaq	-13(%r15), %rsi
	je	.L632
	movzbl	13(%rbp), %esi
	movzbl	13(%rax), %r9d
	cmpq	$15, %r11
	leaq	14(%rbp), %rdx
	movb	%r9b, 13(%rbp)
	movb	%sil, 13(%rax)
	leaq	14(%rax), %r9
	leaq	-14(%r15), %rsi
	jne	.L632
	movzbl	14(%rbp), %esi
	movzbl	14(%rax), %r9d
	leaq	15(%rbp), %rdx
	addq	$15, %rax
	movb	%r9b, 14(%rbp)
	movb	%sil, -1(%rax)
	leaq	-15(%r15), %rsi
.L595:
	movq	%r15, %r10
	subq	%r11, %rcx
	subq	%r11, %r10
	leaq	-16(%r10), %r9
	movq	%r10, 40(%rsp)
	shrq	$4, %r9
	addq	$1, %r9
	movq	%r9, %r10
	salq	$4, %r10
	cmpq	$14, %rcx
	jbe	.L597
	leaq	0(%rbp,%r11), %rcx
	movq	%rax, 64(%rsp)
	movq	%rcx, 56(%rsp)
	leaq	0(%r13,%r11), %rcx
	movq	56(%rsp), %rax
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	addq	%rbx, %rcx
.L598:
	movdqa	(%rax,%r11), %xmm0
	addq	$1, %r13
	movdqu	(%rcx,%r11), %xmm1
	movaps	%xmm1, (%rax,%r11)
	movups	%xmm0, (%rcx,%r11)
	addq	$16, %r11
	cmpq	%r13, %r9
	ja	.L598
	movq	64(%rsp), %rax
	subq	%r10, %rsi
	addq	%r10, %rdx
	addq	%r10, %rax
	cmpq	40(%rsp), %r10
	je	.L603
	.p2align 4,,10
	.p2align 3
.L597:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %r9d
	cmpq	$1, %rsi
	movb	%r9b, (%rdx)
	movb	%cl, (%rax)
	je	.L603
	movzbl	1(%rdx), %ecx
	movzbl	1(%rax), %r9d
	cmpq	$2, %rsi
	movb	%r9b, 1(%rdx)
	movb	%cl, 1(%rax)
	je	.L603
	movzbl	2(%rdx), %ecx
	movzbl	2(%rax), %r9d
	cmpq	$3, %rsi
	movb	%r9b, 2(%rdx)
	movb	%cl, 2(%rax)
	je	.L603
	movzbl	3(%rdx), %ecx
	movzbl	3(%rax), %r9d
	cmpq	$4, %rsi
	movb	%r9b, 3(%rdx)
	movb	%cl, 3(%rax)
	je	.L603
	movzbl	4(%rdx), %ecx
	movzbl	4(%rax), %r9d
	cmpq	$5, %rsi
	movb	%r9b, 4(%rdx)
	movb	%cl, 4(%rax)
	je	.L603
	movzbl	5(%rdx), %ecx
	movzbl	5(%rax), %r9d
	cmpq	$6, %rsi
	movb	%r9b, 5(%rdx)
	movb	%cl, 5(%rax)
	je	.L603
	movzbl	6(%rdx), %ecx
	movzbl	6(%rax), %r9d
	cmpq	$7, %rsi
	movb	%r9b, 6(%rdx)
	movb	%cl, 6(%rax)
	je	.L603
	movzbl	7(%rdx), %ecx
	movzbl	7(%rax), %r9d
	cmpq	$8, %rsi
	movb	%r9b, 7(%rdx)
	movb	%cl, 7(%rax)
	je	.L603
	movzbl	8(%rdx), %ecx
	movzbl	8(%rax), %r9d
	cmpq	$9, %rsi
	movb	%r9b, 8(%rdx)
	movb	%cl, 8(%rax)
	je	.L603
	movzbl	9(%rdx), %ecx
	movzbl	9(%rax), %r9d
	cmpq	$10, %rsi
	movb	%r9b, 9(%rdx)
	movb	%cl, 9(%rax)
	je	.L603
	movzbl	10(%rdx), %ecx
	movzbl	10(%rax), %r9d
	cmpq	$11, %rsi
	movb	%r9b, 10(%rdx)
	movb	%cl, 10(%rax)
	je	.L603
	movzbl	11(%rdx), %ecx
	movzbl	11(%rax), %r9d
	cmpq	$12, %rsi
	movb	%r9b, 11(%rdx)
	movb	%cl, 11(%rax)
	je	.L603
	movzbl	12(%rdx), %ecx
	movzbl	12(%rax), %r9d
	cmpq	$13, %rsi
	movb	%r9b, 12(%rdx)
	movb	%cl, 12(%rax)
	je	.L603
	movzbl	13(%rdx), %ecx
	movzbl	13(%rax), %r9d
	cmpq	$14, %rsi
	movb	%r9b, 13(%rdx)
	movb	%cl, 13(%rax)
	je	.L603
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%rdx)
	movb	%cl, 14(%rax)
.L603:
	movl	(%r8), %edx
.L593:
	subl	$1, %edx
	movl	%edx, (%r8)
	addl	$1, (%rdi)
	jmp	.L607
	.p2align 4,,10
	.p2align 3
.L828:
	xorl	%ecx, %ecx
	rep bsfq	%rax, %rcx
	addl	$64, %ecx
	jmp	.L608
	.p2align 4,,10
	.p2align 3
.L632:
	movq	%r9, %rax
	jmp	.L595
	.p2align 4,,10
	.p2align 3
.L588:
	andq	48(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L831
.L587:
	andq	88(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L832
.L589:
	andq	96(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L833
.L590:
	andq	104(%rsp), %rax
	je	.L814
	rep bsfq	%rax, %rax
	addl	$192, %eax
.L591:
	movq	8(%rsp), %rdi
	cltq
	movl	(%rdi,%rax,4), %ebp
	imulq	%r15, %rbp
	addq	%rbx, %rbp
.L607:
	cmpq	24(%rsp), %rbp
	jb	.L739
	jmp	.L814
	.p2align 4,,10
	.p2align 3
.L833:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	subl	$-128, %eax
	jmp	.L591
	.p2align 4,,10
	.p2align 3
.L832:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	addl	$64, %eax
	jmp	.L591
	.p2align 4,,10
	.p2align 3
.L618:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	leaq	-1(%r15), %rcx
	jmp	.L595
.L831:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	jmp	.L591
	.p2align 4,,10
	.p2align 3
.L594:
	leaq	(%rax,%r15), %r9
	movq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L602:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%rax, %r9
	movb	%sil, -1(%rdx)
	movb	%cl, -1(%rax)
	jne	.L602
	jmp	.L603
	.p2align 4,,10
	.p2align 3
.L830:
	addq	%r15, %rbp
	jmp	.L593
.L827:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movq	%rbx, %rdx
	movq	%r12, %r9
	pushq	16(%rsp)
	.cfi_def_cfa_offset 208
	movl	48(%rsp), %r8d
	movq	%r14, %rcx
	movq	32(%rsp), %rdi
	movq	%r15, %rsi
	addl	$1, selfcalls(%rip)
	call	_rsort
	popq	%rax
	.cfi_def_cfa_offset 200
	popq	%rdx
	.cfi_def_cfa_offset 192
	movq	%rbx, 16(%rsp)
	jmp	.L571
.L826:
	xorl	%ecx, %ecx
	movq	104(%rsp), %rdi
	rep bsfq	%r8, %rcx
	subl	$-128, %ecx
	jmp	.L573
.L824:
	xorl	%ecx, %ecx
	movq	88(%rsp), %r9
	movq	96(%rsp), %r8
	rep bsfq	%rax, %rcx
	movq	104(%rsp), %rdi
	jmp	.L573
.L825:
	xorl	%ecx, %ecx
	movq	96(%rsp), %r8
	movq	104(%rsp), %rdi
	rep bsfq	%r9, %rcx
	addl	$64, %ecx
	jmp	.L573
.L610:
	movq	%rdi, %rdx
	movq	%rbp, %rax
	movq	%r15, %rsi
	leaq	-1(%r15), %r9
	jmp	.L560
.L559:
	movq	16(%rsp), %rdx
	leaq	0(%rbp,%r15), %rdi
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L567:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%rax, %rdi
	movb	%sil, -1(%rdx)
	movb	%cl, -1(%rax)
	jne	.L567
	jmp	.L569
.L823:
	call	__stack_chk_fail
	.cfi_endproc
.LFE84:
	.size	_rsort, .-_rsort
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	srsort
	.type	srsort, @function
srsort:
.LFB85:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r15
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	movl	%r8d, %r13d
	subq	$1160, %rsp
	.cfi_def_cfa_offset 1216
	movq	%rsi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	movq	%fs:40, %rsi
	movq	%rsi, 1144(%rsp)
	xorl	%esi, %esi
	testq	%rax, %rax
	movq	%r9, 8(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	je	.L835
	movq	%rax, %rbx
	movl	$1, %r12d
	movl	%r8d, 16(%rsp)
	movq	%rdi, %r13
	movq	%r9, %r14
	.p2align 4,,10
	.p2align 3
.L836:
	movq	%r13, %rdi
	movl	16(%rsp), %esi
	addq	%r15, %r13
	call	*%rbp
	movzbl	%al, %edx
	addl	$1, (%r14,%rdx,4)
	movl	%eax, %edx
	andl	$63, %eax
	shrb	$6, %dl
	movl	%eax, %ecx
	movq	%r12, %rax
	andl	$3, %edx
	salq	%cl, %rax
	orq	%rax, 80(%rsp,%rdx,8)
	subq	$1, %rbx
	jne	.L836
	movq	80(%rsp), %rax
	movl	16(%rsp), %r13d
	testq	%rax, %rax
	movq	%rax, 48(%rsp)
	je	.L835
	movq	88(%rsp), %r10
	movq	96(%rsp), %r9
	xorl	%ecx, %ecx
	movq	104(%rsp), %r8
	rep bsfq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L837:
	movq	8(%rsp), %rbx
	xorl	%esi, %esi
	xorl	%edx, %edx
	movq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L895:
	movslq	%ecx, %rax
	movq	%rdi, %r11
	addl	$1, %ecx
	salq	%cl, %r11
	shrl	$6, %ecx
	addl	%esi, %edx
	cmpl	$1, %ecx
	movl	%edx, 112(%rsp,%rax,4)
	movl	(%rbx,%rax,4), %esi
	je	.L843
	jb	.L844
	cmpl	$2, %ecx
	je	.L845
	cmpl	$3, %ecx
	je	.L846
.L841:
	movq	40(%rsp), %rax
	movq	32(%rsp), %rdi
	imulq	%r15, %rax
	movq	%rdi, %rbx
	addq	%rdi, %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L842:
	cmpq	16(%rsp), %rbx
	jnb	.L849
	movq	%rbx, %rdi
	movl	%r13d, %esi
	call	*%rbp
	movq	8(%rsp), %rdi
	movzbl	%al, %ecx
	movzbl	%al, %eax
	leaq	(%rdi,%rax,4), %rdi
	movl	(%rdi), %edx
	testl	%edx, %edx
	jne	.L848
	addl	$1, %ecx
	movq	$-1, %rax
	salq	%cl, %rax
	shrl	$6, %ecx
	cmpl	$1, %ecx
	je	.L850
	jb	.L851
	cmpl	$2, %ecx
	je	.L852
	cmpl	$3, %ecx
	je	.L853
.L849:
	xorl	%eax, %eax
	testl	%r13d, %r13d
	je	.L834
	leal	-1(%r13), %eax
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	movl	%eax, 56(%rsp)
	leaq	16(%r15), %rax
	movq	%rax, 72(%rsp)
	movslq	%r14d, %rax
	.p2align 4,,10
	.p2align 3
.L871:
	movq	$-1, %rbx
	salq	%cl, %rbx
	shrl	$6, %ecx
	cmpl	$1, %ecx
	je	.L888
	jb	.L889
	cmpl	$2, %ecx
	je	.L890
	cmpl	$3, %ecx
	je	.L891
.L834:
	movq	1144(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1094
	addq	$1160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L844:
	.cfi_restore_state
	movq	%r11, %rax
	andq	48(%rsp), %rax
	xorl	%ecx, %ecx
	movq	$-1, %r11
	rep bsfq	%rax, %rcx
	testq	%rax, %rax
	jne	.L895
.L843:
	movq	%r11, %rax
	movq	$-1, %r11
	andq	%r10, %rax
	testq	%rax, %rax
	jne	.L1095
.L845:
	movq	%r11, %rax
	movq	$-1, %r11
	andq	%r9, %rax
	testq	%rax, %rax
	jne	.L1096
.L846:
	andq	%r8, %r11
	je	.L841
	xorl	%ecx, %ecx
	movq	8(%rsp), %rbx
	rep bsfq	%r11, %rcx
	addl	$192, %ecx
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L1096:
	xorl	%ecx, %ecx
	movq	8(%rsp), %rbx
	rep bsfq	%rax, %rcx
	subl	$-128, %ecx
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L1095:
	xorl	%ecx, %ecx
	movq	8(%rsp), %rbx
	rep bsfq	%rax, %rcx
	addl	$64, %ecx
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L848:
	movslq	%ecx, %r14
	movq	32(%rsp), %rax
	movl	112(%rsp,%r14,4), %r12d
	movq	%r12, %r11
	imulq	%r15, %r12
	addq	%r12, %rax
	cmpq	%rax, %rbx
	je	.L1097
	movq	32(%rsp), %rsi
	leaq	16(%rsi,%r12), %rdx
	cmpq	%rdx, %rbx
	leaq	16(%rbx), %rdx
	setnb	%cl
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %cl
	je	.L858
	cmpq	$19, %r15
	jbe	.L858
	movq	%rbx, %r10
	negq	%r10
	andl	$15, %r10d
	cmpq	%r15, %r10
	cmova	%r15, %r10
	testq	%r10, %r10
	je	.L903
	movzbl	(%rbx), %ecx
	movzbl	(%rax), %esi
	cmpq	$1, %r10
	leaq	1(%rbx), %rdx
	leaq	1(%rax), %r8
	movb	%sil, (%rbx)
	movb	%cl, (%rax)
	leaq	-1(%r15), %rcx
	movq	%rcx, %rsi
	je	.L917
	movzbl	1(%rbx), %esi
	movzbl	1(%rax), %r8d
	cmpq	$2, %r10
	leaq	2(%rbx), %rdx
	movb	%r8b, 1(%rbx)
	movb	%sil, 1(%rax)
	leaq	2(%rax), %r8
	leaq	-2(%r15), %rsi
	je	.L917
	movzbl	2(%rbx), %esi
	movzbl	2(%rax), %r8d
	cmpq	$3, %r10
	leaq	3(%rbx), %rdx
	movb	%r8b, 2(%rbx)
	movb	%sil, 2(%rax)
	leaq	3(%rax), %r8
	leaq	-3(%r15), %rsi
	je	.L917
	movzbl	3(%rbx), %esi
	movzbl	3(%rax), %r8d
	cmpq	$4, %r10
	leaq	4(%rbx), %rdx
	movb	%r8b, 3(%rbx)
	movb	%sil, 3(%rax)
	leaq	4(%rax), %r8
	leaq	-4(%r15), %rsi
	je	.L917
	movzbl	4(%rbx), %esi
	movzbl	4(%rax), %r8d
	cmpq	$5, %r10
	leaq	5(%rbx), %rdx
	movb	%r8b, 4(%rbx)
	movb	%sil, 4(%rax)
	leaq	5(%rax), %r8
	leaq	-5(%r15), %rsi
	je	.L917
	movzbl	5(%rbx), %esi
	movzbl	5(%rax), %r8d
	cmpq	$6, %r10
	leaq	6(%rbx), %rdx
	movb	%r8b, 5(%rbx)
	movb	%sil, 5(%rax)
	leaq	6(%rax), %r8
	leaq	-6(%r15), %rsi
	je	.L917
	movzbl	6(%rbx), %esi
	movzbl	6(%rax), %r8d
	cmpq	$7, %r10
	leaq	7(%rbx), %rdx
	movb	%r8b, 6(%rbx)
	movb	%sil, 6(%rax)
	leaq	7(%rax), %r8
	leaq	-7(%r15), %rsi
	je	.L917
	movzbl	7(%rbx), %esi
	movzbl	7(%rax), %r8d
	cmpq	$8, %r10
	leaq	8(%rbx), %rdx
	movb	%r8b, 7(%rbx)
	movb	%sil, 7(%rax)
	leaq	8(%rax), %r8
	leaq	-8(%r15), %rsi
	je	.L917
	movzbl	8(%rbx), %esi
	movzbl	8(%rax), %r8d
	cmpq	$9, %r10
	leaq	9(%rbx), %rdx
	movb	%r8b, 8(%rbx)
	movb	%sil, 8(%rax)
	leaq	9(%rax), %r8
	leaq	-9(%r15), %rsi
	je	.L917
	movzbl	9(%rbx), %esi
	movzbl	9(%rax), %r8d
	cmpq	$10, %r10
	leaq	10(%rbx), %rdx
	movb	%r8b, 9(%rbx)
	movb	%sil, 9(%rax)
	leaq	10(%rax), %r8
	leaq	-10(%r15), %rsi
	je	.L917
	movzbl	10(%rbx), %esi
	movzbl	10(%rax), %r8d
	cmpq	$11, %r10
	leaq	11(%rbx), %rdx
	movb	%r8b, 10(%rbx)
	movb	%sil, 10(%rax)
	leaq	11(%rax), %r8
	leaq	-11(%r15), %rsi
	je	.L917
	movzbl	11(%rbx), %esi
	movzbl	11(%rax), %r8d
	cmpq	$12, %r10
	leaq	12(%rbx), %rdx
	movb	%r8b, 11(%rbx)
	movb	%sil, 11(%rax)
	leaq	12(%rax), %r8
	leaq	-12(%r15), %rsi
	je	.L917
	movzbl	12(%rbx), %esi
	movzbl	12(%rax), %r8d
	cmpq	$13, %r10
	leaq	13(%rbx), %rdx
	movb	%r8b, 12(%rbx)
	movb	%sil, 12(%rax)
	leaq	13(%rax), %r8
	leaq	-13(%r15), %rsi
	je	.L917
	movzbl	13(%rbx), %esi
	movzbl	13(%rax), %r8d
	cmpq	$15, %r10
	leaq	14(%rbx), %rdx
	movb	%r8b, 13(%rbx)
	movb	%sil, 13(%rax)
	leaq	14(%rax), %r8
	leaq	-14(%r15), %rsi
	jne	.L917
	movzbl	14(%rbx), %esi
	movzbl	14(%rax), %r8d
	leaq	15(%rbx), %rdx
	addq	$15, %rax
	movb	%r8b, 14(%rbx)
	movb	%sil, -1(%rax)
	leaq	-15(%r15), %rsi
.L859:
	movq	%r15, %r9
	subq	%r10, %rcx
	subq	%r10, %r9
	leaq	-16(%r9), %r8
	movq	%r9, 40(%rsp)
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, %r9
	salq	$4, %r9
	cmpq	$14, %rcx
	jbe	.L861
	leaq	(%rbx,%r10), %rcx
	movq	%rax, 64(%rsp)
	movq	%rcx, 56(%rsp)
	leaq	(%r12,%r10), %rcx
	addq	32(%rsp), %rcx
	movq	56(%rsp), %rax
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
.L862:
	movdqa	(%rax,%r10), %xmm0
	addq	$1, %r12
	movdqu	(%rcx,%r10), %xmm1
	movaps	%xmm1, (%rax,%r10)
	movups	%xmm0, (%rcx,%r10)
	addq	$16, %r10
	cmpq	%r12, %r8
	ja	.L862
	movq	64(%rsp), %rax
	subq	%r9, %rsi
	addq	%r9, %rdx
	addq	%r9, %rax
	cmpq	40(%rsp), %r9
	je	.L867
	.p2align 4,,10
	.p2align 3
.L861:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %r8d
	cmpq	$1, %rsi
	movb	%r8b, (%rdx)
	movb	%cl, (%rax)
	je	.L867
	movzbl	1(%rdx), %ecx
	movzbl	1(%rax), %r8d
	cmpq	$2, %rsi
	movb	%r8b, 1(%rdx)
	movb	%cl, 1(%rax)
	je	.L867
	movzbl	2(%rdx), %ecx
	movzbl	2(%rax), %r8d
	cmpq	$3, %rsi
	movb	%r8b, 2(%rdx)
	movb	%cl, 2(%rax)
	je	.L867
	movzbl	3(%rdx), %ecx
	movzbl	3(%rax), %r8d
	cmpq	$4, %rsi
	movb	%r8b, 3(%rdx)
	movb	%cl, 3(%rax)
	je	.L867
	movzbl	4(%rdx), %ecx
	movzbl	4(%rax), %r8d
	cmpq	$5, %rsi
	movb	%r8b, 4(%rdx)
	movb	%cl, 4(%rax)
	je	.L867
	movzbl	5(%rdx), %ecx
	movzbl	5(%rax), %r8d
	cmpq	$6, %rsi
	movb	%r8b, 5(%rdx)
	movb	%cl, 5(%rax)
	je	.L867
	movzbl	6(%rdx), %ecx
	movzbl	6(%rax), %r8d
	cmpq	$7, %rsi
	movb	%r8b, 6(%rdx)
	movb	%cl, 6(%rax)
	je	.L867
	movzbl	7(%rdx), %ecx
	movzbl	7(%rax), %r8d
	cmpq	$8, %rsi
	movb	%r8b, 7(%rdx)
	movb	%cl, 7(%rax)
	je	.L867
	movzbl	8(%rdx), %ecx
	movzbl	8(%rax), %r8d
	cmpq	$9, %rsi
	movb	%r8b, 8(%rdx)
	movb	%cl, 8(%rax)
	je	.L867
	movzbl	9(%rdx), %ecx
	movzbl	9(%rax), %r8d
	cmpq	$10, %rsi
	movb	%r8b, 9(%rdx)
	movb	%cl, 9(%rax)
	je	.L867
	movzbl	10(%rdx), %ecx
	movzbl	10(%rax), %r8d
	cmpq	$11, %rsi
	movb	%r8b, 10(%rdx)
	movb	%cl, 10(%rax)
	je	.L867
	movzbl	11(%rdx), %ecx
	movzbl	11(%rax), %r8d
	cmpq	$12, %rsi
	movb	%r8b, 11(%rdx)
	movb	%cl, 11(%rax)
	je	.L867
	movzbl	12(%rdx), %ecx
	movzbl	12(%rax), %r8d
	cmpq	$13, %rsi
	movb	%r8b, 12(%rdx)
	movb	%cl, 12(%rax)
	je	.L867
	movzbl	13(%rdx), %ecx
	movzbl	13(%rax), %r8d
	cmpq	$14, %rsi
	movb	%r8b, 13(%rdx)
	movb	%cl, 13(%rax)
	je	.L867
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%rdx)
	movb	%cl, 14(%rax)
.L867:
	movl	(%rdi), %edx
.L857:
	leal	1(%r11), %eax
	subl	$1, %edx
	movl	%edx, (%rdi)
	movl	%eax, 112(%rsp,%r14,4)
	jmp	.L842
	.p2align 4,,10
	.p2align 3
.L889:
	andq	48(%rsp), %rbx
	movq	%rbx, %rcx
	movq	$-1, %rbx
	testq	%rcx, %rcx
	jne	.L1098
.L888:
	andq	88(%rsp), %rbx
	movq	%rbx, %rdx
	movq	$-1, %rbx
	testq	%rdx, %rdx
	jne	.L1099
.L890:
	andq	96(%rsp), %rbx
	movq	%rbx, %rdx
	movq	$-1, %rbx
	testq	%rdx, %rdx
	jne	.L1100
.L891:
	andq	104(%rsp), %rbx
	je	.L834
	rep bsfq	%rbx, %rbx
	leal	192(%rbx), %edi
	movl	%edi, 16(%rsp)
.L892:
	movslq	16(%rsp), %rdx
	movl	112(%rsp,%rdx,4), %edi
	movl	%edi, %esi
	movl	%edi, 40(%rsp)
	subl	%eax, %esi
	cmpl	$1, %esi
	je	.L884
	cmpl	$2, %esi
	jne	.L872
	imulq	%r15, %rax
	movq	32(%rsp), %rbx
	movl	56(%rsp), %r14d
	addq	%rax, %rbx
	movq	%rax, 64(%rsp)
	leaq	(%rbx,%r15), %r12
	jmp	.L886
	.p2align 4,,10
	.p2align 3
.L873:
	jb	.L884
	testl	%r14d, %r14d
	leal	-1(%r14), %eax
	je	.L884
	movl	%eax, %r14d
.L886:
	movl	%r14d, %esi
	movq	%rbx, %rdi
	call	*%rbp
	movl	%eax, %r13d
	movl	%r14d, %esi
	movq	%r12, %rdi
	call	*%rbp
	cmpb	%al, %r13b
	jbe	.L873
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rax
	addq	%rsi, %rax
	leaq	(%r15,%rsi), %rdi
	cmpq	%rsi, %rax
	leaq	16(%rsi), %rax
	setle	%dl
	cmpq	%rdi, %rax
	setle	%al
	orb	%al, %dl
	je	.L874
	cmpq	$19, %r15
	jbe	.L874
	movq	%rbx, %rdx
	negq	%rdx
	andl	$15, %edx
	cmpq	%r15, %rdx
	cmova	%r15, %rdx
	testq	%rdx, %rdx
	je	.L918
	movzbl	(%r12), %esi
	movzbl	(%rbx), %eax
	cmpq	$1, %rdx
	leaq	1(%rbx), %r8
	leaq	1(%r12), %r9
	movb	%sil, (%rbx)
	leaq	-1(%r15), %rsi
	movb	%al, (%r12)
	movq	%rsi, %rax
	je	.L919
	movzbl	1(%rbx), %eax
	movzbl	1(%r12), %r8d
	cmpq	$2, %rdx
	leaq	2(%rbx), %r9
	movb	%r8b, 1(%rbx)
	movb	%al, 1(%r12)
	leaq	2(%r12), %r8
	leaq	-2(%r15), %rax
	je	.L932
	movzbl	2(%rbx), %eax
	movzbl	2(%r12), %r8d
	cmpq	$3, %rdx
	leaq	3(%rbx), %r9
	movb	%r8b, 2(%rbx)
	movb	%al, 2(%r12)
	leaq	3(%r12), %r8
	leaq	-3(%r15), %rax
	je	.L932
	movzbl	3(%rbx), %eax
	movzbl	3(%r12), %r8d
	cmpq	$4, %rdx
	leaq	4(%rbx), %r9
	movb	%r8b, 3(%rbx)
	movb	%al, 3(%r12)
	leaq	4(%r12), %r8
	leaq	-4(%r15), %rax
	je	.L932
	movzbl	4(%rbx), %eax
	movzbl	4(%r12), %r8d
	cmpq	$5, %rdx
	leaq	5(%rbx), %r9
	movb	%r8b, 4(%rbx)
	movb	%al, 4(%r12)
	leaq	5(%r12), %r8
	leaq	-5(%r15), %rax
	je	.L932
	movzbl	5(%rbx), %eax
	movzbl	5(%r12), %r8d
	cmpq	$6, %rdx
	leaq	6(%rbx), %r9
	movb	%r8b, 5(%rbx)
	movb	%al, 5(%r12)
	leaq	6(%r12), %r8
	leaq	-6(%r15), %rax
	je	.L932
	movzbl	6(%rbx), %eax
	movzbl	6(%r12), %r8d
	cmpq	$7, %rdx
	leaq	7(%rbx), %r9
	movb	%r8b, 6(%rbx)
	movb	%al, 6(%r12)
	leaq	7(%r12), %r8
	leaq	-7(%r15), %rax
	je	.L932
	movzbl	7(%rbx), %eax
	movzbl	7(%r12), %r8d
	cmpq	$8, %rdx
	leaq	8(%rbx), %r9
	movb	%r8b, 7(%rbx)
	movb	%al, 7(%r12)
	leaq	8(%r12), %r8
	leaq	-8(%r15), %rax
	je	.L932
	movzbl	8(%rbx), %eax
	movzbl	8(%r12), %r8d
	cmpq	$9, %rdx
	leaq	9(%rbx), %r9
	movb	%r8b, 8(%rbx)
	movb	%al, 8(%r12)
	leaq	9(%r12), %r8
	leaq	-9(%r15), %rax
	je	.L932
	movzbl	9(%rbx), %eax
	movzbl	9(%r12), %r8d
	cmpq	$10, %rdx
	leaq	10(%rbx), %r9
	movb	%r8b, 9(%rbx)
	movb	%al, 9(%r12)
	leaq	10(%r12), %r8
	leaq	-10(%r15), %rax
	je	.L932
	movzbl	10(%rbx), %eax
	movzbl	10(%r12), %r8d
	cmpq	$11, %rdx
	leaq	11(%rbx), %r9
	movb	%r8b, 10(%rbx)
	movb	%al, 10(%r12)
	leaq	11(%r12), %r8
	leaq	-11(%r15), %rax
	je	.L932
	movzbl	11(%rbx), %eax
	movzbl	11(%r12), %r8d
	cmpq	$12, %rdx
	leaq	12(%rbx), %r9
	movb	%r8b, 11(%rbx)
	movb	%al, 11(%r12)
	leaq	12(%r12), %r8
	leaq	-12(%r15), %rax
	je	.L932
	movzbl	12(%rbx), %eax
	movzbl	12(%r12), %r8d
	cmpq	$13, %rdx
	leaq	13(%rbx), %r9
	movb	%r8b, 12(%rbx)
	movb	%al, 12(%r12)
	leaq	13(%r12), %r8
	leaq	-13(%r15), %rax
	je	.L932
	movzbl	13(%rbx), %eax
	movzbl	13(%r12), %r8d
	cmpq	$15, %rdx
	leaq	14(%rbx), %r9
	movb	%r8b, 13(%rbx)
	movb	%al, 13(%r12)
	leaq	14(%r12), %r8
	leaq	-14(%r15), %rax
	jne	.L932
	movzbl	14(%rbx), %eax
	movzbl	14(%r12), %r8d
	addq	$15, %rbx
	addq	$15, %r12
	movb	%r8b, -1(%rbx)
	movb	%al, -1(%r12)
	leaq	-15(%r15), %rax
.L875:
	movq	%r15, %r10
	subq	%rdx, %rsi
	subq	%rdx, %r10
	leaq	-16(%r10), %r8
	shrq	$4, %r8
	addq	$1, %r8
	movq	%r8, %r9
	salq	$4, %r9
	cmpq	$14, %rsi
	jbe	.L877
	movq	64(%rsp), %rsi
	movq	32(%rsp), %rcx
	xorl	%r11d, %r11d
	addq	%rdx, %rsi
	addq	%rdi, %rdx
	xorl	%edi, %edi
	addq	%rcx, %rsi
	addq	%rcx, %rdx
.L878:
	movdqa	(%rsi,%rdi), %xmm0
	addq	$1, %r11
	movdqu	(%rdx,%rdi), %xmm1
	movaps	%xmm1, (%rsi,%rdi)
	movups	%xmm0, (%rdx,%rdi)
	addq	$16, %rdi
	cmpq	%r11, %r8
	ja	.L878
	subq	%r9, %rax
	addq	%r9, %rbx
	addq	%r9, %r12
	cmpq	%r10, %r9
	je	.L884
.L877:
	movzbl	(%rbx), %edx
	movzbl	(%r12), %esi
	cmpq	$1, %rax
	movb	%sil, (%rbx)
	movb	%dl, (%r12)
	je	.L884
	movzbl	1(%rbx), %edx
	movzbl	1(%r12), %esi
	cmpq	$2, %rax
	movb	%sil, 1(%rbx)
	movb	%dl, 1(%r12)
	je	.L884
	movzbl	2(%rbx), %edx
	movzbl	2(%r12), %esi
	cmpq	$3, %rax
	movb	%sil, 2(%rbx)
	movb	%dl, 2(%r12)
	je	.L884
	movzbl	3(%rbx), %edx
	movzbl	3(%r12), %esi
	cmpq	$4, %rax
	movb	%sil, 3(%rbx)
	movb	%dl, 3(%r12)
	je	.L884
	movzbl	4(%rbx), %edx
	movzbl	4(%r12), %esi
	cmpq	$5, %rax
	movb	%sil, 4(%rbx)
	movb	%dl, 4(%r12)
	je	.L884
	movzbl	5(%rbx), %edx
	movzbl	5(%r12), %esi
	cmpq	$6, %rax
	movb	%sil, 5(%rbx)
	movb	%dl, 5(%r12)
	je	.L884
	movzbl	6(%rbx), %edx
	movzbl	6(%r12), %esi
	cmpq	$7, %rax
	movb	%sil, 6(%rbx)
	movb	%dl, 6(%r12)
	je	.L884
	movzbl	7(%rbx), %edx
	movzbl	7(%r12), %esi
	cmpq	$8, %rax
	movb	%sil, 7(%rbx)
	movb	%dl, 7(%r12)
	je	.L884
	movzbl	8(%rbx), %edx
	movzbl	8(%r12), %esi
	cmpq	$9, %rax
	movb	%sil, 8(%rbx)
	movb	%dl, 8(%r12)
	je	.L884
	movzbl	9(%rbx), %edx
	movzbl	9(%r12), %esi
	cmpq	$10, %rax
	movb	%sil, 9(%rbx)
	movb	%dl, 9(%r12)
	je	.L884
	movzbl	10(%rbx), %edx
	movzbl	10(%r12), %esi
	cmpq	$11, %rax
	movb	%sil, 10(%rbx)
	movb	%dl, 10(%r12)
	je	.L884
	movzbl	11(%rbx), %edx
	movzbl	11(%r12), %esi
	cmpq	$12, %rax
	movb	%sil, 11(%rbx)
	movb	%dl, 11(%r12)
	je	.L884
	movzbl	12(%rbx), %edx
	movzbl	12(%r12), %esi
	cmpq	$13, %rax
	movb	%sil, 12(%rbx)
	movb	%dl, 12(%r12)
	je	.L884
	movzbl	13(%rbx), %edx
	movzbl	13(%r12), %esi
	cmpq	$14, %rax
	movb	%sil, 13(%rbx)
	movb	%dl, 13(%r12)
	je	.L884
	movzbl	14(%rbx), %eax
	movzbl	14(%r12), %edx
	movb	%dl, 14(%rbx)
	movb	%al, 14(%r12)
	.p2align 4,,10
	.p2align 3
.L884:
	movl	16(%rsp), %ecx
	movslq	40(%rsp), %rax
	addl	$1, %ecx
	jmp	.L871
	.p2align 4,,10
	.p2align 3
.L1100:
	xorl	%ebx, %ebx
	rep bsfq	%rdx, %rbx
	leal	128(%rbx), %edi
	movl	%edi, 16(%rsp)
	jmp	.L892
	.p2align 4,,10
	.p2align 3
.L872:
	movslq	%eax, %rdi
	movq	8(%rsp), %r9
	movl	56(%rsp), %r8d
	movq	%rdi, %rax
	movq	32(%rsp), %rdi
	movq	%rbp, %rcx
	imulq	%r15, %rax
	movq	%r15, %rdx
	addq	%rax, %rdi
	call	srsort
	movl	16(%rsp), %ecx
	movslq	40(%rsp), %rax
	addl	$1, %ecx
	jmp	.L871
	.p2align 4,,10
	.p2align 3
.L1099:
	xorl	%ebx, %ebx
	rep bsfq	%rdx, %rbx
	leal	64(%rbx), %edi
	movl	%edi, 16(%rsp)
	jmp	.L892
	.p2align 4,,10
	.p2align 3
.L917:
	movq	%r8, %rax
	jmp	.L859
	.p2align 4,,10
	.p2align 3
.L851:
	andq	48(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L1101
.L850:
	andq	88(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L1102
.L852:
	andq	96(%rsp), %rax
	movq	%rax, %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	jne	.L1103
.L853:
	andq	104(%rsp), %rax
	je	.L849
	rep bsfq	%rax, %rax
	addl	$192, %eax
.L854:
	cltq
	movl	112(%rsp,%rax,4), %ebx
	imulq	%r15, %rbx
	addq	32(%rsp), %rbx
	jmp	.L842
	.p2align 4,,10
	.p2align 3
.L903:
	movq	%rbx, %rdx
	movq	%r15, %rsi
	leaq	-1(%r15), %rcx
	jmp	.L859
	.p2align 4,,10
	.p2align 3
.L1098:
	xorl	%edi, %edi
	rep bsfq	%rcx, %rdi
	movq	%rdi, 16(%rsp)
	jmp	.L892
	.p2align 4,,10
	.p2align 3
.L1103:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	subl	$-128, %eax
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L1102:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	addl	$64, %eax
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L1101:
	xorl	%eax, %eax
	rep bsfq	%rdx, %rax
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L858:
	leaq	(%rax,%r15), %r8
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L866:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%r8, %rax
	movb	%sil, -1(%rdx)
	movb	%cl, -1(%rax)
	jne	.L866
	jmp	.L867
	.p2align 4,,10
	.p2align 3
.L1097:
	addq	%r15, %rbx
	jmp	.L857
	.p2align 4,,10
	.p2align 3
.L932:
	movq	%r8, %r12
	movq	%r9, %rbx
	jmp	.L875
	.p2align 4,,10
	.p2align 3
.L835:
	movq	88(%rsp), %r10
	testq	%r10, %r10
	jne	.L1104
	movq	96(%rsp), %r9
	testq	%r9, %r9
	movq	%r9, 48(%rsp)
	jne	.L1105
	movq	104(%rsp), %r8
	xorl	%ecx, %ecx
	rep bsfq	%r8, %rcx
	addl	$192, %ecx
	testq	%r8, %r8
	jne	.L837
	jmp	.L841
.L1104:
	xorl	%ecx, %ecx
	movq	$0, 48(%rsp)
	movq	96(%rsp), %r9
	rep bsfq	%r10, %rcx
	movq	104(%rsp), %r8
	addl	$64, %ecx
	jmp	.L837
.L874:
	leaq	(%r12,%r15), %rsi
	.p2align 4,,10
	.p2align 3
.L882:
	movzbl	(%rbx), %eax
	movzbl	(%r12), %edx
	addq	$1, %r12
	addq	$1, %rbx
	cmpq	%r12, %rsi
	movb	%dl, -1(%rbx)
	movb	%al, -1(%r12)
	jne	.L882
	movl	16(%rsp), %ecx
	movslq	40(%rsp), %rax
	addl	$1, %ecx
	jmp	.L871
.L918:
	movq	%r15, %rax
	leaq	-1(%r15), %rsi
	jmp	.L875
.L1105:
	xorl	%ecx, %ecx
	movq	$0, 48(%rsp)
	movq	104(%rsp), %r8
	rep bsfq	%r9, %rcx
	subl	$-128, %ecx
	jmp	.L837
.L919:
	movq	%r9, %r12
	movq	%r8, %rbx
	jmp	.L875
.L1094:
	call	__stack_chk_fail
	.cfi_endproc
.LFE85:
	.size	srsort, .-srsort
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.globl	rsort
	.type	rsort, @function
rsort:
.LFB86:
	.cfi_startproc
	subq	$2072, %rsp
	.cfi_def_cfa_offset 2080
	movq	%rdi, %r10
	movq	%rcx, %r11
	movq	%fs:40, %rax
	movq	%rax, 2056(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	movl	$128, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 2088
	rep stosq
	movl	%edx, %edx
	leaq	1032(%rsp), %rax
	movq	%r11, %rcx
	movq	%r10, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 2096
	leaq	16(%rsp), %r9
	imulq	%rsi, %rdx
	addq	%r10, %rdx
	call	_rsort
	popq	%rax
	.cfi_def_cfa_offset 2088
	popq	%rdx
	.cfi_def_cfa_offset 2080
	movq	2056(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L1109
	addq	$2072, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L1109:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE86:
	.size	rsort, .-rsort
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.comm	outputfd,4,4
	.comm	keyextractorpipe,8,8
	.comm	input,8,8
	.globl	delimiter
	.data
	.type	delimiter, @object
	.size	delimiter, 1
delimiter:
	.byte	10
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
