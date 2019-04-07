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
	je	.L18
	movq	%r12, %rdi
	movq	%rsi, %rbx
	negq	%rdi
	movq	%rdi, -2128(%rbp)
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
	movl	-2112(%rbp), %ecx
.L5:
	movl	$0, -1088(%rbp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L24:
	movl	(%r15,%rax), %ecx
.L8:
	addl	%ecx, %edx
	movl	%edx, -1084(%rbp,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L24
	leaq	15(%r12), %rax
	movq	-2136(%rbp), %rsi
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-2152(%rbp), %rax
	movq	%rsi, %rbx
	movq	%rsp, -2144(%rbp)
	imulq	%r12, %rax
	addq	%rsi, %rax
	movq	%rax, -2128(%rbp)
.L9:
	cmpq	-2128(%rbp), %rbx
	jnb	.L16
.L15:
	movl	-2116(%rbp), %esi
	movq	%rbx, %rdi
	call	*%r13
	movzbl	%al, %r14d
	movl	-2112(%rbp,%r14,4), %r8d
	movq	%r14, %rdx
	testl	%r8d, %r8d
	jne	.L10
	cmpb	$-1, %al
	je	.L16
	addl	$1, %edx
	addl	$1, selfcalls(%rip)
	movslq	%edx, %rdx
	movl	-1088(%rbp,%rdx,4), %ebx
	imulq	%r12, %rbx
	addq	-2136(%rbp), %rbx
	cmpq	-2128(%rbp), %rbx
	jb	.L15
	.p2align 4,,10
	.p2align 3
.L16:
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L25
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
.L10:
	.cfi_restore_state
	movl	-1088(%rbp,%r14,4), %r15d
	movq	%r15, %r9
	imulq	%r12, %r15
	addq	-2136(%rbp), %r15
	cmpq	%r15, %rbx
	je	.L26
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
.L14:
	subl	$1, %r8d
	addl	$1, %r9d
	addl	$1, selfcalls(%rip)
	movl	%r8d, -2112(%rbp,%r14,4)
	movl	%r9d, -1088(%rbp,%r14,4)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L26:
	addq	%r12, %rbx
	jmp	.L14
.L18:
	xorl	%ecx, %ecx
	jmp	.L5
.L25:
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
	je	.L36
	movq	%rsi, %r12
	movq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L29:
	movq	%r12, %rdi
	movl	12(%rsp), %esi
	addq	%rbp, %r12
	call	*%r13
	movzbl	%al, %eax
	addl	$1, 32(%rsp,%rax,4)
	subq	$1, %r14
	jne	.L29
	movl	32(%rsp), %ecx
.L28:
	movl	$0, 1056(%rsp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L43:
	movl	(%r15,%rax), %ecx
.L31:
	addl	%ecx, %edx
	movl	%edx, 1060(%rsp,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L43
	movq	24(%rsp), %r12
	testq	%r12, %r12
	je	.L34
	.p2align 4,,10
	.p2align 3
.L37:
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
	jne	.L37
.L34:
	movq	2088(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L44
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
.L36:
	.cfi_restore_state
	xorl	%ecx, %ecx
	jmp	.L28
.L44:
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
	jne	.L51
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L47:
	addq	$1, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L49
.L51:
	cmpb	$48, %dl
	jne	.L47
	movb	$95, (%rax)
	addq	$1, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L51
.L49:
	movq	%rsp, %rdi
	call	puts
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L57
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L57:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%esi, %ecx
	shrl	$6, %esi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	$-1, %rax
	movl	$127, %r8d
	movl	$191, %r9d
	movq	%rax, %rdx
	movw	%ax, (%rsp)
	movw	%r8w, 4(%rsp)
	salq	%cl, %rdx
	movl	$63, %ecx
	cmpl	$3, %esi
	movw	%cx, 2(%rsp)
	movw	%r9w, 6(%rsp)
	ja	.L63
	movl	%esi, %ecx
	movl	%esi, %esi
	movq	%rdx, %rax
	andq	(%rdi,%rsi,8), %rax
	je	.L66
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L67:
	movl	%ecx, %esi
	movq	(%rdi,%rsi,8), %rax
	testq	%rax, %rax
	jne	.L64
.L66:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L67
	movl	$-1, %eax
.L63:
	movq	8(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L73
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	movq	$-1, %rdx
	bsfq	%rax, %rax
	cmove	%rdx, %rax
	movswl	(%rsp,%rsi,2), %edx
	leal	1(%rdx,%rax), %eax
	jmp	.L63
.L73:
	call	__stack_chk_fail
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
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %r12d
	movq	%rcx, %rbx
	movq	%rsi, %rbp
	subq	$1096, %rsp
	.cfi_def_cfa_offset 1152
	movq	%fs:40, %rax
	movq	%rax, 1080(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	movq	%rdi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%r9, 8(%rsp)
	je	.L78
	.p2align 4,,10
	.p2align 3
.L101:
	movq	%r14, %rdi
	movl	%r12d, %esi
	call	*%rbx
	movq	8(%rsp), %rcx
	movzbl	%al, %eax
	addq	24(%rsp), %r14
	addl	$1, (%rcx,%rax,4)
	subq	$1, %rbp
	jne	.L101
.L78:
	leaq	52(%rsp), %rcx
	movl	$0, 48(%rsp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L76:
	movq	8(%rsp), %rdi
	addl	(%rdi,%rax), %edx
	movl	%edx, (%rcx,%rax)
	addq	$4, %rax
	cmpq	$1020, %rax
	jne	.L76
	imulq	24(%rsp), %r13
	movq	32(%rsp), %rax
	leaq	(%rax,%r13), %rbp
	movq	%rax, %r13
.L79:
	cmpq	%rbp, %r13
	jnb	.L89
.L88:
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	*%rbx
	movq	8(%rsp), %rcx
	movzbl	%al, %edx
	movzbl	%al, %r8d
	leaq	(%rcx,%rdx,4), %r9
	movl	(%r9), %ecx
	testl	%ecx, %ecx
	jne	.L80
	cmpb	$-1, %al
	je	.L89
	addl	$1, %r8d
	movslq	%r8d, %rax
	movl	48(%rsp,%rax,4), %r13d
	imulq	24(%rsp), %r13
	addq	32(%rsp), %r13
	cmpq	%rbp, %r13
	jb	.L88
.L89:
	xorl	%eax, %eax
	testl	%r12d, %r12d
	je	.L74
	leal	-1(%r12), %eax
	leaq	48(%rsp), %rbp
	xorl	%edx, %edx
	movl	%eax, 44(%rsp)
	leaq	1024(%rbp), %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L97:
	movl	0(%rbp), %r13d
	movl	%r13d, %esi
	subl	%edx, %esi
	cmpl	$1, %esi
	jbe	.L91
	cmpl	$2, %esi
	jne	.L92
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	movl	44(%rsp), %r14d
	imulq	%rax, %rdx
	leaq	(%rcx,%rdx), %r15
	addq	%r15, %rax
	movq	%rax, (%rsp)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L93:
	jb	.L91
	testl	%r14d, %r14d
	leal	-1(%r14), %eax
	je	.L91
	movl	%eax, %r14d
.L96:
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	*%rbx
	movl	%eax, %r12d
	movl	%r14d, %esi
	movq	(%rsp), %rdi
	call	*%rbx
	cmpb	%al, %r12b
	jbe	.L93
	movq	(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L94:
	movzbl	(%r15), %ecx
	movzbl	(%rax), %esi
	addq	$1, %r15
	addq	$1, %rax
	cmpq	(%rsp), %r15
	movb	%sil, -1(%r15)
	movb	%cl, -1(%rax)
	jne	.L94
	.p2align 4,,10
	.p2align 3
.L91:
	addq	$4, %rbp
	cmpq	16(%rsp), %rbp
	movl	%r13d, %edx
	jne	.L97
.L74:
	movq	1080(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L111
	addq	$1096, %rsp
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
.L92:
	.cfi_restore_state
	movq	24(%rsp), %rax
	movl	%edx, %edi
	movq	32(%rsp), %rcx
	movq	8(%rsp), %r9
	movl	44(%rsp), %r8d
	addq	$4, %rbp
	imulq	%rax, %rdi
	movq	%rax, %rdx
	leaq	(%rcx,%rdi), %rdi
	movq	%rbx, %rcx
	call	rsort_msb
	cmpq	16(%rsp), %rbp
	movl	%r13d, %edx
	jne	.L97
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L80:
	movl	48(%rsp,%r8,4), %edx
	movq	24(%rsp), %rax
	leaq	0(%r13,%rax), %rdi
	movq	%rdx, %r10
	imulq	%rax, %rdx
	movq	%r13, %rax
	addq	32(%rsp), %rdx
	cmpq	%rdx, %r13
	je	.L112
	.p2align 4,,10
	.p2align 3
.L100:
	movzbl	(%rax), %ecx
	movzbl	(%rdx), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%rax, %rdi
	movb	%sil, -1(%rax)
	movb	%cl, -1(%rdx)
	jne	.L100
	movl	(%r9), %ecx
.L86:
	subl	$1, %ecx
	addl	$1, %r10d
	movl	%ecx, (%r9)
	movl	%r10d, 48(%rsp,%r8,4)
	jmp	.L79
.L112:
	movq	%rdi, %r13
	jmp	.L86
.L111:
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
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rbx
	movq	%rbx, 120(%rsp)
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	movq	%rdi, 24(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movl	%r8d, (%rsp)
	je	.L118
	movl	(%rsp), %ebp
	movq	24(%rsp), %r15
	movq	8(%rsp), %rbx
	movl	%ebp, %r12d
	movq	%r15, %r13
	andl	$1, %ebp
	shrl	%r12d
	movq	%r9, %r15
	.p2align 4,,10
	.p2align 3
.L117:
	movq	%r13, %rdi
	movl	%r12d, %esi
	call	*%r14
	movl	%eax, %ecx
	shrb	$4, %cl
	testl	%ebp, %ebp
	cmovne	%ecx, %eax
	addq	16(%rsp), %r13
	andl	$15, %eax
	addl	$1, (%r15,%rax,4)
	subq	$1, %rbx
	jne	.L117
	movq	%r15, %r13
.L118:
	leaq	52(%rsp), %rcx
	movl	$0, 48(%rsp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L115:
	addl	0(%r13,%rax), %edx
	movl	%edx, (%rcx,%rax)
	addq	$4, %rax
	cmpq	$60, %rax
	jne	.L115
	movq	8(%rsp), %rbp
	movq	24(%rsp), %rax
	movl	$1, %r15d
	imulq	16(%rsp), %rbp
	movl	%r15d, %ebx
	movq	%rax, %r12
	addq	%rax, %rbp
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L162:
	cmpb	$15, %al
	je	.L161
	addl	$1, %r10d
	movq	24(%rsp), %rax
	movslq	%r10d, %r10
	movl	48(%rsp,%r10,4), %r8d
	imulq	16(%rsp), %r8
	leaq	(%rax,%r8), %r12
.L125:
	addl	$1, %ebx
.L119:
	cmpq	%rbp, %r12
	leal	-1(%rbx), %r15d
	jnb	.L161
	movl	(%rsp), %esi
	movq	%r12, %rdi
	call	*%r14
	movl	%eax, %edx
	shrb	$4, %dl
	testb	$1, %al
	cmovne	%edx, %eax
	andl	$15, %eax
	movzbl	%al, %edx
	movzbl	%al, %r10d
	leaq	0(%r13,%rdx,4), %r11
	movl	(%r11), %ecx
	testl	%ecx, %ecx
	je	.L162
	movl	48(%rsp,%r10,4), %edx
	movq	16(%rsp), %rax
	leaq	(%r12,%rax), %rdi
	movq	%rdx, %r15
	imulq	%rax, %rdx
	movq	%r12, %rax
	addq	24(%rsp), %rdx
	cmpq	%rdx, %r12
	je	.L163
	.p2align 4,,10
	.p2align 3
.L150:
	movzbl	(%rax), %ecx
	movzbl	(%rdx), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%rdi, %rax
	movb	%sil, -1(%rax)
	movb	%cl, -1(%rdx)
	jne	.L150
	movl	(%r11), %ecx
.L127:
	subl	$1, %ecx
	addl	$1, %r15d
	movl	%ecx, (%r11)
	movl	%r15d, 48(%rsp,%r10,4)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L161:
	movl	(%rsp), %ecx
	addl	%r15d, selfcalls(%rip)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L113
	movl	(%rsp), %eax
	movl	8(%rsp), %esi
	leaq	108(%rsp), %rbp
	movq	%r13, 40(%rsp)
	subl	$1, %eax
	movl	%eax, 36(%rsp)
	andl	$1, %eax
	movl	%eax, 8(%rsp)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L164:
	addl	$1, counts(%rip)
.L132:
	leaq	44(%rsp), %rax
	subq	$4, %rbp
	movl	%ebx, %esi
	cmpq	%rbp, %rax
	je	.L113
.L141:
	movl	0(%rbp), %ebx
	subl	%ebx, %esi
	je	.L164
	cmpl	$1, %esi
	je	.L165
	cmpl	$2, %esi
	jne	.L134
	movq	16(%rsp), %rax
	movl	%ebx, %r8d
	movq	24(%rsp), %rcx
	movl	36(%rsp), %r13d
	imulq	%rax, %r8
	leaq	(%rcx,%r8), %r15
	addq	%r15, %rax
	movq	%rax, (%rsp)
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L136:
	testl	%r13d, %r13d
	leal	-1(%r13), %eax
	je	.L138
	movl	%eax, %r13d
.L139:
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	*%r14
	movl	%r13d, %esi
	movl	%eax, %r12d
	movq	(%rsp), %rdi
	call	*%r14
	movl	8(%rsp), %edx
	testl	%edx, %edx
	je	.L135
	shrb	$4, %r12b
	shrb	$4, %al
.L135:
	movl	%r12d, %edx
	andl	$15, %eax
	andl	$15, %edx
	cmpb	%al, %dl
	jbe	.L136
	movq	(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L137:
	movzbl	(%r15), %edx
	movzbl	(%rax), %ecx
	addq	$1, %r15
	addq	$1, %rax
	cmpq	(%rsp), %r15
	movb	%cl, -1(%r15)
	movb	%dl, -1(%rax)
	jne	.L137
.L138:
	addq	$1, shuffles(%rip)
.L167:
	leaq	44(%rsp), %rax
	subq	$4, %rbp
	movl	%ebx, %esi
	cmpq	%rbp, %rax
	jne	.L141
.L113:
	movq	120(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L166
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
.L134:
	.cfi_restore_state
	movq	16(%rsp), %rax
	movl	%ebx, %edi
	movq	40(%rsp), %r9
	movl	36(%rsp), %r8d
	movl	%esi, %esi
	movq	%r14, %rcx
	imulq	%rax, %rdi
	movq	%rax, %rdx
	addq	24(%rsp), %rdi
	call	rsort_msb16
	addq	$1, shuffles(%rip)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L165:
	addl	$1, poscalc(%rip)
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L163:
	movq	%rdi, %r12
	jmp	.L127
.L166:
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
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subl	$1, %eax
	movq	%rcx, %rbp
	movq	%r9, %r12
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	192(%rsp), %rsi
	movq	%rdi, 24(%rsp)
	movq	%rdx, 8(%rsp)
	movl	%r8d, 20(%rsp)
	movl	%eax, 16(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%fs:40, %rsi
	movq	%rsi, 120(%rsp)
	xorl	%esi, %esi
	cmpq	%rdx, %rdi
	jnb	.L209
	.p2align 4,,10
	.p2align 3
.L222:
	movq	24(%rsp), %rbx
	movq	$0, 80(%rsp)
	movl	$1, %r15d
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	movl	20(%rsp), %esi
	movq	%rbx, %rdi
	call	*%rbp
	cmpq	%rbx, 8(%rsp)
	movl	%eax, %r14d
	ja	.L225
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L174:
	addl	$1, counts(%rip)
	movq	%rbx, %rdi
	movl	16(%rsp), %esi
	call	*%rbp
	movzbl	%al, %edx
	addq	%r13, %rbx
	addl	$1, (%r12,%rdx,4)
	movl	%eax, %edx
	andl	$63, %eax
	shrb	$6, %dl
	movl	%eax, %ecx
	movq	%r15, %rax
	andl	$3, %edx
	salq	%cl, %rax
	orq	%rax, 80(%rsp,%rdx,8)
	cmpq	%rbx, 8(%rsp)
	jbe	.L249
.L225:
	movl	20(%rsp), %esi
	movq	%rbx, %rdi
	call	*%rbp
	cmpb	%al, %r14b
	je	.L174
.L249:
	movq	%rbx, %rax
	subq	24(%rsp), %rax
	xorl	%edx, %edx
	divq	%r13
	cmpq	$1, %rax
	je	.L175
	cmpq	$2, %rax
	jne	.L171
	movq	24(%rsp), %rsi
	movl	16(%rsp), %r15d
	movq	%r12, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%rsi, %rax
	movl	%r15d, %r12d
	movq	%rsi, %r15
	addq	%r13, %rax
	movq	%rax, 32(%rsp)
	movq	%rax, %r14
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L177:
	jb	.L242
	testl	%r12d, %r12d
	leal	-1(%r12), %eax
	je	.L242
	movl	%eax, %r12d
.L180:
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	*%rbp
	movl	%eax, %ebx
	movl	%r12d, %esi
	movq	%r14, %rdi
	call	*%rbp
	cmpb	%al, %bl
	jbe	.L177
	movq	32(%rsp), %rdi
	movq	40(%rsp), %rbx
	movq	48(%rsp), %r12
	movq	24(%rsp), %rax
	movq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L178:
	movzbl	(%rax), %ecx
	movzbl	(%rdx), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%rdi, %rax
	movb	%sil, -1(%rax)
	movb	%cl, -1(%rdx)
	jne	.L178
.L179:
	movl	16(%rsp), %esi
	movq	32(%rsp), %rdi
	call	*%rbp
	movzbl	%al, %eax
	movl	$0, (%r12,%rax,4)
.L175:
	movl	16(%rsp), %esi
	movq	24(%rsp), %rdi
	call	*%rbp
	movzbl	%al, %eax
	movq	%rbx, 24(%rsp)
	movl	$0, (%r12,%rax,4)
.L181:
	cmpq	%rbx, 8(%rsp)
	ja	.L222
.L209:
	movq	120(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L252
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
.L251:
	.cfi_restore_state
	movq	24(%rsp), %rbx
.L171:
	movl	$-1, %eax
	movw	%ax, 64(%rsp)
	movl	$63, %eax
	movw	%ax, 66(%rsp)
	movl	$127, %eax
	movw	%ax, 68(%rsp)
	movl	$191, %eax
	movw	%ax, 70(%rsp)
	xorl	%eax, %eax
.L185:
	movq	80(%rsp,%rax,8), %rdx
	movl	%eax, %ecx
	testq	%rdx, %rdx
	jne	.L253
	addq	$1, %rax
	cmpq	$4, %rax
	jne	.L185
	.p2align 4,,10
	.p2align 3
.L210:
	movq	24(%rsp), %rax
	cmpq	%rbx, %rax
	jnb	.L194
	movq	56(%rsp), %r14
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L223:
	addq	$1, shuffles(%rip)
	movl	16(%rsp), %esi
	movq	%r15, %rdi
	call	*%rbp
	movzbl	%al, %r9d
	salq	$2, %r9
	leaq	(%r12,%r9), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jne	.L195
	movzbl	%al, %ecx
	movq	$-1, %rax
	movl	$-1, %esi
	addl	$1, %ecx
	movl	$63, %edi
	movl	$127, %r8d
	salq	%cl, %rax
	shrl	$6, %ecx
	movl	$191, %r9d
	cmpl	$4, %ecx
	movw	%si, 64(%rsp)
	movw	%di, 66(%rsp)
	movw	%r8w, 68(%rsp)
	movw	%r9w, 70(%rsp)
	je	.L194
	movl	%ecx, %edx
	andq	80(%rsp,%rdx,8), %rax
	je	.L199
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L202:
	movl	%ecx, %edx
	movq	80(%rsp,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L197
.L199:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L202
.L194:
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L254
.L213:
	movq	%rbx, 24(%rsp)
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L195:
	addq	%r14, %r9
	leaq	(%r15,%r13), %r10
	movq	%r15, %rax
	movl	(%r9), %edx
	imulq	%r13, %rdx
	addq	24(%rsp), %rdx
	cmpq	%r15, %rdx
	je	.L255
	.p2align 4,,10
	.p2align 3
.L224:
	movzbl	(%rax), %ecx
	movzbl	(%rdx), %esi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%r10, %rax
	movb	%sil, -1(%rax)
	movb	%cl, -1(%rdx)
	jne	.L224
	movl	(%r8), %esi
.L205:
	subl	$1, %esi
	movl	%esi, (%r8)
	addl	$1, (%r9)
.L203:
	cmpq	%rbx, %r15
	jb	.L223
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L213
.L254:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movq	%rbx, %rdx
	movq	%r12, %r9
	pushq	64(%rsp)
	.cfi_def_cfa_offset 208
	movl	32(%rsp), %r8d
	movq	%rbp, %rcx
	movq	40(%rsp), %rdi
	movq	%r13, %rsi
	addl	$1, selfcalls(%rip)
	call	_rsort
	popq	%rax
	.cfi_def_cfa_offset 200
	popq	%rdx
	.cfi_def_cfa_offset 192
	movq	%rbx, 24(%rsp)
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L197:
	movswl	64(%rsp,%rdx,2), %edx
	bsfq	%rax, %rax
	movq	$-1, %rsi
	cmove	%rsi, %rax
	leal	1(%rdx,%rax), %eax
	cmpl	$-1, %eax
	je	.L194
	cltq
	movl	(%r14,%rax,4), %ecx
	movq	24(%rsp), %rax
	imulq	%r13, %rcx
	leaq	(%rax,%rcx), %r15
	jmp	.L203
.L242:
	movq	40(%rsp), %rbx
	movq	48(%rsp), %r12
	jmp	.L179
.L255:
	movq	%r10, %r15
	jmp	.L205
.L253:
	movswl	64(%rsp,%rcx,2), %eax
	rep bsfq	%rdx, %rdx
	leal	1(%rax,%rdx), %ecx
	cmpl	$-1, %ecx
	je	.L210
	movq	56(%rsp), %r8
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L191:
	movslq	%ecx, %rax
	addl	$1, poscalc(%rip)
	addl	%esi, %edx
	addl	$1, %ecx
	movl	%edx, (%r8,%rax,4)
	movl	(%r12,%rax,4), %esi
	movq	$-1, %rax
	movl	$-1, %r10d
	movl	$63, %r11d
	salq	%cl, %rax
	shrl	$6, %ecx
	movl	$127, %r14d
	movl	$191, %r15d
	cmpl	$3, %ecx
	movw	%r10w, 64(%rsp)
	movw	%r11w, 66(%rsp)
	movw	%r14w, 68(%rsp)
	movw	%r15w, 70(%rsp)
	ja	.L210
	movl	%ecx, %edi
	andq	80(%rsp,%rdi,8), %rax
	je	.L190
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L192:
	movl	%ecx, %edi
	movq	80(%rsp,%rdi,8), %rax
	testq	%rax, %rax
	jne	.L188
.L190:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L192
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L188:
	bsfq	%rax, %rax
	movq	$-1, %rcx
	cmove	%rcx, %rax
	movswl	64(%rsp,%rdi,2), %ecx
	leal	1(%rcx,%rax), %ecx
	cmpl	$-1, %ecx
	jne	.L191
	jmp	.L210
.L252:
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
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	movl	%r8d, %r12d
	subq	$1144, %rsp
	.cfi_def_cfa_offset 1200
	movq	%fs:40, %rbx
	movq	%rbx, 1128(%rsp)
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	je	.L303
	movq	%rsi, %rbx
	movl	$1, %r14d
	movq	%rdi, %r13
	movq	%r9, %r15
	.p2align 4,,10
	.p2align 3
.L258:
	movq	%r13, %rdi
	movl	%r12d, %esi
	call	*%rbp
	movzbl	%al, %edx
	addq	8(%rsp), %r13
	addl	$1, (%r15,%rdx,4)
	movl	%eax, %edx
	andl	$63, %eax
	shrb	$6, %dl
	movl	%eax, %ecx
	movq	%r14, %rax
	andl	$3, %edx
	salq	%cl, %rax
	orq	%rax, 64(%rsp,%rdx,8)
	subq	$1, %rbx
	jne	.L258
	movq	64(%rsp), %rdx
	movq	%r15, %r13
.L257:
	movl	$191, %eax
	movl	$-1, %ebx
	movl	$63, %r14d
	movl	$127, %r15d
	movw	%ax, 102(%rsp)
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movw	%bx, 96(%rsp)
	movw	%r14w, 98(%rsp)
	movw	%r15w, 100(%rsp)
	movl	%eax, %ecx
	jne	.L328
.L259:
	addq	$1, %rax
	cmpq	$4, %rax
	je	.L301
	movq	64(%rsp,%rax,8), %rdx
	movl	%eax, %ecx
	testq	%rdx, %rdx
	je	.L259
.L328:
	movswl	96(%rsp,%rcx,2), %eax
	rep bsfq	%rdx, %rdx
	leal	1(%rax,%rdx), %ecx
	cmpl	$-1, %ecx
	je	.L301
	xorl	%esi, %esi
	xorl	%edx, %edx
	movq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L268:
	movslq	%ecx, %rax
	addl	%esi, %edx
	addl	$1, %ecx
	movl	%edx, 96(%rsp,%rax,4)
	movl	0(%r13,%rax,4), %esi
	movq	%rdi, %rax
	salq	%cl, %rax
	shrl	$6, %ecx
	movl	$-1, %r8d
	movl	$63, %r9d
	movl	$127, %r10d
	movl	$191, %r11d
	cmpl	$3, %ecx
	movw	%r8w, 48(%rsp)
	movw	%r9w, 50(%rsp)
	movw	%r10w, 52(%rsp)
	movw	%r11w, 54(%rsp)
	ja	.L301
	movl	%ecx, %r8d
	andq	64(%rsp,%r8,8), %rax
	je	.L267
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L269:
	movl	%ecx, %r8d
	movq	64(%rsp,%r8,8), %rax
	testq	%rax, %rax
	jne	.L265
.L267:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L269
.L301:
	movq	16(%rsp), %r15
	movq	24(%rsp), %rax
	movq	$-1, %r14
	imulq	8(%rsp), %r15
	leaq	(%rax,%r15), %rbx
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L270:
	cmpq	%rbx, %r15
	jnb	.L277
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	*%rbp
	movzbl	%al, %ecx
	movzbl	%al, %eax
	leaq	0(%r13,%rax,4), %r8
	movl	(%r8), %esi
	testl	%esi, %esi
	jne	.L271
	addl	$1, %ecx
	movq	%r14, %rax
	movl	$-1, %r15d
	salq	%cl, %rax
	shrl	$6, %ecx
	movl	$63, %edx
	movl	$127, %esi
	movl	$191, %edi
	cmpl	$4, %ecx
	movw	%r15w, 48(%rsp)
	movw	%dx, 50(%rsp)
	movw	%si, 52(%rsp)
	movw	%di, 54(%rsp)
	je	.L277
	movl	%ecx, %edx
	andq	64(%rsp,%rdx,8), %rax
	je	.L275
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L278:
	movl	%ecx, %edx
	movq	64(%rsp,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L273
.L275:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L278
.L277:
	xorl	%eax, %eax
	testl	%r12d, %r12d
	je	.L256
	leal	-1(%r12), %eax
	movl	$127, %ebx
	movl	$-1, %r10d
	movl	$63, %r11d
	movw	%bx, 52(%rsp)
	movl	$191, %r12d
	xorl	%ebx, %ebx
	movl	%eax, 36(%rsp)
	movw	%r10w, 48(%rsp)
	movw	%r11w, 50(%rsp)
	movw	%r12w, 54(%rsp)
	movq	$-1, %rax
	xorl	%edi, %edi
	movl	%ebx, %ecx
	movq	%r13, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L286:
	movl	%ecx, %edx
	andq	64(%rsp,%rdx,8), %rax
	je	.L297
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L300:
	movl	%ecx, %edx
	movq	64(%rsp,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L295
.L297:
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L300
.L256:
	movq	1128(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L329
	addq	$1144, %rsp
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
.L295:
	.cfi_restore_state
	movswl	48(%rsp,%rdx,2), %edx
	bsfq	%rax, %rax
	movq	$-1, %rbx
	cmove	%rbx, %rax
	leal	1(%rdx,%rax), %eax
	cmpl	$-1, %eax
	movl	%eax, 16(%rsp)
	je	.L256
	movslq	16(%rsp), %rax
	movl	96(%rsp,%rax,4), %r14d
	movl	%r14d, %esi
	subl	%edi, %esi
	cmpl	$1, %esi
	je	.L288
	movq	8(%rsp), %rax
	imulq	%rax, %rdi
	cmpl	$2, %esi
	jne	.L289
	movq	24(%rsp), %rbx
	leaq	(%rbx,%rdi), %r15
	movl	36(%rsp), %ebx
	leaq	(%r15,%rax), %r13
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L290:
	jb	.L288
	testl	%ebx, %ebx
	leal	-1(%rbx), %eax
	je	.L288
	movl	%eax, %ebx
.L293:
	movl	%ebx, %esi
	movq	%r15, %rdi
	call	*%rbp
	movl	%eax, %r12d
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	*%rbp
	cmpb	%al, %r12b
	jbe	.L290
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L291:
	movzbl	(%r15), %edx
	movzbl	(%rax), %esi
	addq	$1, %r15
	addq	$1, %rax
	cmpq	%r13, %r15
	movb	%sil, -1(%r15)
	movb	%dl, -1(%rax)
	jne	.L291
	.p2align 4,,10
	.p2align 3
.L288:
	movl	16(%rsp), %ecx
	movq	$-1, %rax
	movl	$-1, %edx
	movl	$63, %esi
	movl	$127, %r8d
	movl	$191, %r9d
	movslq	%r14d, %rdi
	movw	%dx, 48(%rsp)
	movw	%si, 50(%rsp)
	addl	$1, %ecx
	movw	%r8w, 52(%rsp)
	movw	%r9w, 54(%rsp)
	salq	%cl, %rax
	shrl	$6, %ecx
	cmpl	$3, %ecx
	jbe	.L286
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L271:
	movl	96(%rsp,%rcx,4), %edx
	movq	8(%rsp), %rax
	leaq	(%r15,%rax), %r10
	movq	%rdx, %r9
	imulq	%rax, %rdx
	movq	%r15, %rax
	addq	24(%rsp), %rdx
	cmpq	%rdx, %r15
	je	.L330
	.p2align 4,,10
	.p2align 3
.L312:
	movzbl	(%rax), %esi
	movzbl	(%rdx), %edi
	addq	$1, %rax
	addq	$1, %rdx
	cmpq	%r10, %rax
	movb	%dil, -1(%rax)
	movb	%sil, -1(%rdx)
	jne	.L312
	movl	(%r8), %esi
.L281:
	subl	$1, %esi
	addl	$1, %r9d
	movl	%esi, (%r8)
	movl	%r9d, 96(%rsp,%rcx,4)
	jmp	.L270
	.p2align 4,,10
	.p2align 3
.L289:
	addq	24(%rsp), %rdi
	movq	40(%rsp), %r9
	movq	%rbp, %rcx
	movl	36(%rsp), %r8d
	movq	%rax, %rdx
	call	srsort
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L273:
	movswl	48(%rsp,%rdx,2), %edx
	bsfq	%rax, %rax
	cmove	%r14, %rax
	leal	1(%rdx,%rax), %eax
	cmpl	$-1, %eax
	je	.L277
	cltq
	movl	96(%rsp,%rax,4), %r15d
	imulq	8(%rsp), %r15
	addq	24(%rsp), %r15
	jmp	.L270
.L330:
	movq	%r10, %r15
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L265:
	movswl	48(%rsp,%r8,2), %ecx
	bsfq	%rax, %rax
	cmove	%rdi, %rax
	leal	1(%rcx,%rax), %ecx
	cmpl	$-1, %ecx
	jne	.L268
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L303:
	xorl	%edx, %edx
	jmp	.L257
.L329:
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
	jne	.L334
	addq	$2072, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L334:
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
