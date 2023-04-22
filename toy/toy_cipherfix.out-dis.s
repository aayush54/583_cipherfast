	.text
	.file	"toy_cipherfix.out"
	.globl	classify                        # -- Begin function classify
	.p2align	4, 0x90
	.type	classify,@function
classify:                               # @classify
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, -20(%rsp)
	movq	%rdi, -8(%rsp)
	movl	%esi, -20(%rsp)
	retq
.Lfunc_end0:
	.size	classify, .Lfunc_end0-classify
	.cfi_endproc
                                        # -- End function
	.globl	declassify                      # -- Begin function declassify
	.p2align	4, 0x90
	.type	declassify,@function
declassify:                             # @declassify
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, -20(%rsp)
	movq	%rdi, -8(%rsp)
	movl	%esi, -20(%rsp)
	retq
.Lfunc_end1:
	.size	declassify, .Lfunc_end1-declassify
	.cfi_endproc
                                        # -- End function
	.globl	secret_comp                     # -- Begin function secret_comp
	.p2align	4, 0x90
	.type	secret_comp,@function
secret_comp:                            # @secret_comp
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, -60(%rsp)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movq	%r8, -40(%rsp)
	movq	%r9, -48(%rsp)
	movl	$0, -60(%rsp)
	movabsq	$-4294967296, %r8               # imm = 0xFFFFFFFF00000000
	.p2align	4, 0x90
.LBB2_1:                                # %bb.1
                                        # =>This Inner Loop Header: Depth=1
	movl	-60(%rsp), %eax
	addq	$-4, %rax
	seto	%dl
	shrq	$63, %rax
	cmpb	%dl, %al
	je	.LBB2_3
# %bb.2:                                # %bb.2
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rsp), %rax
	movslq	-60(%rsp), %rdx
	movl	(%rax,%rdx), %eax
	movq	-24(%rsp), %rsi
	movq	-16(%rsp), %rdi
	addl	(%rdi,%rdx), %eax
	movb	%al, (%rsi,%rdx)
	movq	-8(%rsp), %rax
	movslq	-60(%rsp), %rdx
	movl	(%rax,%rdx), %eax
	movq	-32(%rsp), %rsi
	movq	-16(%rsp), %rdi
	imull	(%rdi,%rdx), %eax
	movb	%al, (%rsi,%rdx)
	movq	-8(%rsp), %rax
	movslq	-60(%rsp), %rdx
	movl	(%rax,%rdx), %eax
	movq	-40(%rsp), %rsi
	movq	-16(%rsp), %rdi
	subl	(%rdi,%rdx), %eax
	movb	%al, (%rsi,%rdx)
	movq	-8(%rsp), %rax
	movslq	-60(%rsp), %rsi
	movsbq	(%rax,%rsi), %rdx
	movq	-48(%rsp), %rdi
	movq	-16(%rsp), %rax
	movsbq	(%rax,%rsi), %rcx
	movq	%rdx, %rax
	andq	%r8, %rax
	orq	%rdx, %rax
	cqto
	idivq	%rcx
	movb	%dl, (%rdi,%rsi)
	incl	-60(%rsp)
	jmp	.LBB2_1
.LBB2_3:                                # %bb.3
	retq
.Lfunc_end2:
	.size	secret_comp, .Lfunc_end2-secret_comp
	.cfi_endproc
                                        # -- End function
	.globl	mix_comp                        # -- Begin function mix_comp
	.p2align	4, 0x90
	.type	mix_comp,@function
mix_comp:                               # @mix_comp
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, -40(%rsp)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movl	%ecx, -28(%rsp)
	movl	$0, -40(%rsp)
	.p2align	4, 0x90
.LBB3_1:                                # %bb.1
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rsp), %eax
	movl	%eax, %ecx
	subl	-28(%rsp), %ecx
	seto	%dl
	shrl	$31, %ecx
	cmpb	%dl, %cl
	je	.LBB3_3
# %bb.2:                                # %bb.2
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-16(%rsp), %rcx
	movslq	-40(%rsp), %rdx
	movl	(%rcx,%rdx), %ecx
	imull	(%rax,%rdx), %ecx
	movq	-8(%rsp), %rax
	movb	%cl, (%rax,%rdx)
	incl	-40(%rsp)
	jmp	.LBB3_1
.LBB3_3:                                # %bb.3
	retq
.Lfunc_end3:
	.size	mix_comp, .Lfunc_end3-mix_comp
	.cfi_endproc
                                        # -- End function
	.globl	public_comp                     # -- Begin function public_comp
	.p2align	4, 0x90
	.type	public_comp,@function
public_comp:                            # @public_comp
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, -48(%rsp)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movl	%ecx, -28(%rsp)
	movl	$0, -36(%rsp)
	.p2align	4, 0x90
.LBB4_1:                                # %bb.1
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rsp), %eax
	subl	-28(%rsp), %eax
	seto	%cl
	shrl	$31, %eax
	cmpb	%cl, %al
	je	.LBB4_3
# %bb.2:                                # %bb.2
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-16(%rsp), %rcx
	movslq	-36(%rsp), %rdx
	movl	(%rcx,%rdx), %ecx
	imull	(%rax,%rdx), %ecx
	movq	-8(%rsp), %rax
	movb	%cl, (%rax,%rdx)
	incl	-36(%rsp)
	jmp	.LBB4_1
.LBB4_3:                                # %bb.3
	movl	$0, -48(%rsp)
	.p2align	4, 0x90
.LBB4_4:                                # %bb.4
                                        # =>This Inner Loop Header: Depth=1
	movl	-48(%rsp), %eax
	movl	%eax, %ecx
	subl	-28(%rsp), %ecx
	seto	%dl
	shrl	$31, %ecx
	cmpb	%dl, %cl
	je	.LBB4_6
# %bb.5:                                # %bb.5
                                        #   in Loop: Header=BB4_4 Depth=1
	movslq	-48(%rsp), %rax
	movzbl	-32(%rsp,%rax), %ecx
	movq	-8(%rsp), %rdx
	movb	%cl, (%rdx,%rax)
	incl	-48(%rsp)
	jmp	.LBB4_4
.LBB4_6:                                # %bb.6
	retq
.Lfunc_end4:
	.size	public_comp, .Lfunc_end4-public_comp
	.cfi_endproc
                                        # -- End function
	.globl	print_char                      # -- Begin function print_char
	.p2align	4, 0x90
	.type	print_char,@function
print_char:                             # @print_char
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, (%rsp)
	movq	%rdi, 16(%rsp)
	movl	$0, 4(%rsp)
	.p2align	4, 0x90
.LBB5_1:                                # %bb.1
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	cmpq	$8, %rax
	jae	.LBB5_3
# %bb.2:                                # %bb.2
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	4(%rsp), %esi
	movl	$.Lrodata_15+4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rsp), %rcx
	movslq	4(%rsp), %rdx
	movsbl	(%rcx,%rdx), %esi
	movl	%eax, (%rsp)
	movl	$.Lrodata_15+7, %edi
	xorl	%eax, %eax
	callq	printf
	incl	4(%rsp)
	jmp	.LBB5_1
.LBB5_3:                                # %bb.3
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	print_char, .Lfunc_end5-print_char
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	56(%rsp), %r13
	leaq	64(%rsp), %r15
	leaq	104(%rsp), %r12
	leaq	136(%rsp), %rbx
	leaq	200(%rsp), %r14
	movl	$3735928559, %eax               # imm = 0xDEADBEEF
	movq	%rax, 16(%rsp)
	movl	$0, 228(%rsp)
	movl	$16, %edx
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset
	movl	$.Lrodata_15+16, %esi
	movl	$63, %edx
	movq	%rbx, %rdi
	callq	memcpy
	movl	$0, 132(%rsp)
	.p2align	4, 0x90
.LBB6_1:                                # %bb.1
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 8(%rsp)
	movl	132(%rsp), %eax
	addq	$-16, %rax
	seto	%cl
	shrq	$63, %rax
	cmpb	%cl, %al
	je	.LBB6_3
# %bb.2:                                # %bb.2
                                        #   in Loop: Header=BB6_1 Depth=1
	movslq	132(%rsp), %rax
	leal	(%rax,%rax,2), %ecx
	movslq	%ecx, %rcx
	movzbl	136(%rsp,%rcx), %ecx
	movb	%cl, 200(%rsp,%rax)
	movl	132(%rsp), %eax
	incl	%eax
	movl	%eax, 132(%rsp)
	jmp	.LBB6_1
.LBB6_3:                                # %bb.3
	movq	.Lrodata_15+80(%rip), %rax
	movq	%rax, 104(%rsp)
	movq	.Lrodata_15+88(%rip), %rax
	movq	%rax, 112(%rsp)
	movq	%r14, %rdi
	movl	$16, %esi
	callq	classify
	movq	%r12, %rdi
	movl	$16, %esi
	callq	classify
	movl	$4, %edi
	callq	malloc
	movq	%rax, 96(%rsp)
	movl	$4, %edi
	callq	malloc
	movq	%rax, 88(%rsp)
	movl	$4, %edi
	callq	malloc
	movq	%rax, 80(%rsp)
	movl	$4, %edi
	callq	malloc
	leaq	4(%r13), %rbp
	leaq	4(%r15), %rbx
	movq	%rax, 72(%rsp)
	movq	96(%rsp), %rax
	movl	200(%rsp), %ecx
	movl	%ecx, (%rax)
	movq	88(%rsp), %rax
	movl	204(%rsp), %ecx
	movl	%ecx, (%rax)
	movq	80(%rsp), %rax
	movl	208(%rsp), %ecx
	movl	%ecx, (%rax)
	movq	72(%rsp), %rax
	movl	212(%rsp), %ecx
	movl	%ecx, (%rax)
	movq	96(%rsp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	movq	%rbp, %r8
	movq	%r13, %r9
	callq	secret_comp
	movq	88(%rsp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	movq	%rbp, %r8
	movq	%r13, %r9
	callq	secret_comp
	leaq	48(%rsp), %rdx
	leaq	4(%rdx), %rsi
	movq	.Lrodata_15+96(%rip), %rax
	rolq	$32, %rax
	movq	%rax, 48(%rsp)
	leaq	44(%rsp), %rbp
	movq	%rbp, %rdi
	movl	$4, %ecx
	callq	public_comp
	leaq	40(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	movl	$4, %ecx
	callq	mix_comp
	movl	$.Lrodata_15+10, %edi
	xorl	%eax, %eax
	callq	printf
	movl	228(%rsp), %ecx
	movl	%eax, 36(%rsp)
	movl	%ecx, %eax
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	.Lrodata_15,@object             # @rodata_15
	.section	.rodata,"a",@progbits
	.p2align	4
.Lrodata_15:
	.ascii	"\001\000\002\000%i\000%c\000done\n\000abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\000\000\f\270dV\247:U\321\220\033\275\013L\377\023m\n\013\f\r\021\"3D"
	.size	.Lrodata_15, 104

	.section	".note.GNU-stack","",@progbits
