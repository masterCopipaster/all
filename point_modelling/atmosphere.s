	.file	"atmosphere.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ph_vector.h"
.LC1:
	.string	"l.type == r.type"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
.LHOTB2:
	.type	vector_add.part.0, @function
vector_add.part.0:
.LFB93:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$__PRETTY_FUNCTION__.4607, %ecx
	movl	$48, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
	.cfi_endproc
.LFE93:
	.size	vector_add.part.0, .-vector_add.part.0
.LCOLDE2:
.LHOTE2:
.LCOLDB3:
.LHOTB3:
	.type	vector_sub.part.1, @function
vector_sub.part.1:
.LFB94:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$__PRETTY_FUNCTION__.4613, %ecx
	movl	$59, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
	.cfi_endproc
.LFE94:
	.size	vector_sub.part.1, .-vector_sub.part.1
.LCOLDE3:
.LHOTE3:
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	common_interact.part.2, @function
common_interact.part.2:
.LFB95:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm5
	movsd	24(%rsi), %xmm4
	movsd	32(%rsi), %xmm1
	movsd	40(%rsi), %xmm0
	jne	.L12
	subsd	%xmm4, %xmm3
	subsd	%xmm1, %xmm2
	subsd	%xmm0, %xmm5
	movapd	%xmm3, %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	movapd	%xmm5, %xmm4
	mulsd	%xmm2, %xmm0
	mulsd	%xmm5, %xmm4
	addsd	%xmm0, %xmm1
	addsd	%xmm4, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L18
.L7:
	ucomisd	.LC4(%rip), %xmm0
	jp	.L14
	je	.L5
.L14:
	movsd	8(%rdi), %xmm1
	addsd	8(%rsi), %xmm1
	ucomisd	%xmm1, %xmm0
	ja	.L19
.L5:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	movsd	.LC5(%rip), %xmm4
	movq	%rsi, 8(%rsp)
	movsd	.LC6(%rip), %xmm1
	movq	%rdi, 16(%rsp)
	mulsd	16(%rdi), %xmm4
	movsd	%xmm5, 40(%rsp)
	mulsd	(%rdi), %xmm1
	movsd	%xmm2, 32(%rsp)
	movsd	%xmm3, 24(%rsp)
	mulsd	16(%rsi), %xmm4
	mulsd	(%rsi), %xmm1
	subsd	%xmm1, %xmm4
	movsd	.LC7(%rip), %xmm1
	movsd	%xmm4, (%rsp)
	call	pow
	movsd	(%rsp), %xmm4
	movq	8(%rsp), %rsi
	movsd	24(%rsp), %xmm3
	divsd	%xmm0, %xmm4
	cmpl	$5, 112(%rsi)
	movsd	32(%rsp), %xmm2
	movsd	40(%rsp), %xmm5
	movsd	96(%rsi), %xmm1
	mulsd	%xmm4, %xmm3
	mulsd	%xmm4, %xmm2
	mulsd	%xmm4, %xmm5
	movsd	104(%rsi), %xmm0
	movsd	88(%rsi), %xmm4
	jne	.L12
	subsd	%xmm3, %xmm4
	movq	16(%rsp), %rdi
	subsd	%xmm2, %xmm1
	subsd	%xmm5, %xmm0
	movsd	%xmm4, 88(%rsi)
	movsd	%xmm1, 96(%rsi)
	movsd	%xmm0, 104(%rsi)
	cmpl	$5, 112(%rdi)
	movsd	88(%rdi), %xmm4
	movsd	96(%rdi), %xmm1
	movsd	104(%rdi), %xmm0
	jne	.L20
	addsd	%xmm4, %xmm3
	addsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm5
	movsd	%xmm3, 88(%rdi)
	movsd	%xmm2, 96(%rdi)
	movsd	%xmm5, 104(%rdi)
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movapd	%xmm1, %xmm0
	movq	%rsi, 32(%rsp)
	movq	%rdi, 24(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm3, (%rsp)
	call	sqrt
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	movsd	16(%rsp), %xmm5
	movsd	8(%rsp), %xmm2
	movsd	(%rsp), %xmm3
	jmp	.L7
.L12:
	call	vector_sub.part.1
.L20:
	call	vector_add.part.0
	.cfi_endproc
.LFE95:
	.size	common_interact.part.2, .-common_interact.part.2
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.type	lnk_interact.part.4, @function
lnk_interact.part.4:
.LFB97:
	.cfi_startproc
	subq	$136, %rsp
	.cfi_def_cfa_offset 144
	movl	80(%rsi), %eax
	cmpl	%eax, 80(%rdi)
	movapd	%xmm2, %xmm8
	movsd	56(%rdi), %xmm5
	movsd	64(%rdi), %xmm12
	movsd	72(%rdi), %xmm11
	movsd	56(%rsi), %xmm2
	movsd	64(%rsi), %xmm15
	movsd	72(%rsi), %xmm14
	jne	.L23
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movapd	%xmm0, %xmm13
	movsd	24(%rdi), %xmm4
	movsd	32(%rdi), %xmm3
	movsd	40(%rdi), %xmm7
	movsd	24(%rsi), %xmm9
	movsd	32(%rsi), %xmm6
	movsd	40(%rsi), %xmm0
	jne	.L23
	subsd	%xmm6, %xmm3
	subsd	%xmm9, %xmm4
	subsd	%xmm0, %xmm7
	movapd	%xmm3, %xmm0
	movapd	%xmm4, %xmm9
	mulsd	%xmm3, %xmm0
	mulsd	%xmm4, %xmm9
	addsd	%xmm0, %xmm9
	movapd	%xmm7, %xmm0
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm9
	sqrtsd	%xmm9, %xmm6
	ucomisd	%xmm6, %xmm6
	movapd	%xmm6, %xmm10
	jp	.L33
.L24:
	ucomisd	.LC4(%rip), %xmm10
	jp	.L31
	jne	.L31
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	ucomisd	%xmm6, %xmm6
	movapd	%xmm6, %xmm0
	jp	.L34
.L28:
	subsd	%xmm2, %xmm5
	cmpl	$5, 112(%rsi)
	subsd	%xmm15, %xmm12
	subsd	%xmm14, %xmm11
	subsd	%xmm10, %xmm13
	mulsd	%xmm10, %xmm10
	mulsd	%xmm4, %xmm5
	mulsd	%xmm3, %xmm12
	mulsd	%xmm7, %xmm11
	mulsd	%xmm13, %xmm1
	addsd	%xmm12, %xmm5
	movapd	%xmm1, %xmm6
	addsd	%xmm11, %xmm5
	mulsd	%xmm0, %xmm6
	movsd	104(%rsi), %xmm0
	mulsd	%xmm8, %xmm5
	movapd	%xmm5, %xmm1
	movsd	88(%rsi), %xmm5
	subsd	%xmm6, %xmm1
	movapd	%xmm1, %xmm2
	movsd	96(%rsi), %xmm1
	divsd	%xmm10, %xmm2
	mulsd	%xmm2, %xmm4
	mulsd	%xmm2, %xmm3
	mulsd	%xmm7, %xmm2
	jne	.L35
	addsd	%xmm4, %xmm5
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm0
	movsd	%xmm5, 88(%rsi)
	movsd	%xmm1, 96(%rsi)
	movsd	%xmm0, 104(%rsi)
	cmpl	$5, 112(%rdi)
	movsd	88(%rdi), %xmm5
	movsd	96(%rdi), %xmm1
	movsd	104(%rdi), %xmm0
	jne	.L23
	subsd	%xmm4, %xmm5
	subsd	%xmm3, %xmm1
	subsd	%xmm2, %xmm0
	movsd	%xmm5, 88(%rdi)
	movsd	%xmm1, 96(%rdi)
	movsd	%xmm0, 104(%rdi)
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L33:
	.cfi_restore_state
	movapd	%xmm9, %xmm0
	movsd	%xmm6, 120(%rsp)
	movsd	%xmm8, 112(%rsp)
	movq	%rsi, 88(%rsp)
	movq	%rdi, 80(%rsp)
	movsd	%xmm1, 104(%rsp)
	movsd	%xmm13, 96(%rsp)
	movsd	%xmm7, 72(%rsp)
	movsd	%xmm3, 64(%rsp)
	movsd	%xmm4, 56(%rsp)
	movsd	%xmm14, 48(%rsp)
	movsd	%xmm15, 40(%rsp)
	movsd	%xmm2, 32(%rsp)
	movsd	%xmm11, 24(%rsp)
	movsd	%xmm12, 16(%rsp)
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm9, (%rsp)
	call	sqrt
	movsd	120(%rsp), %xmm6
	movapd	%xmm0, %xmm10
	movsd	112(%rsp), %xmm8
	movsd	104(%rsp), %xmm1
	movq	88(%rsp), %rsi
	movsd	96(%rsp), %xmm13
	movq	80(%rsp), %rdi
	movsd	72(%rsp), %xmm7
	movsd	64(%rsp), %xmm3
	movsd	56(%rsp), %xmm4
	movsd	48(%rsp), %xmm14
	movsd	40(%rsp), %xmm15
	movsd	32(%rsp), %xmm2
	movsd	24(%rsp), %xmm11
	movsd	16(%rsp), %xmm12
	movsd	8(%rsp), %xmm5
	movsd	(%rsp), %xmm9
	jmp	.L24
.L34:
	movapd	%xmm9, %xmm0
	movsd	%xmm10, 112(%rsp)
	movsd	%xmm8, 104(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%rdi, 72(%rsp)
	movsd	%xmm1, 96(%rsp)
	movsd	%xmm13, 88(%rsp)
	movsd	%xmm7, 64(%rsp)
	movsd	%xmm3, 56(%rsp)
	movsd	%xmm4, 48(%rsp)
	movsd	%xmm14, 40(%rsp)
	movsd	%xmm15, 32(%rsp)
	movsd	%xmm2, 24(%rsp)
	movsd	%xmm11, 16(%rsp)
	movsd	%xmm12, 8(%rsp)
	movsd	%xmm5, (%rsp)
	call	sqrt
	movsd	112(%rsp), %xmm10
	movsd	104(%rsp), %xmm8
	movq	80(%rsp), %rsi
	movsd	96(%rsp), %xmm1
	movq	72(%rsp), %rdi
	movsd	88(%rsp), %xmm13
	movsd	64(%rsp), %xmm7
	movsd	56(%rsp), %xmm3
	movsd	48(%rsp), %xmm4
	movsd	40(%rsp), %xmm14
	movsd	32(%rsp), %xmm15
	movsd	24(%rsp), %xmm2
	movsd	16(%rsp), %xmm11
	movsd	8(%rsp), %xmm12
	movsd	(%rsp), %xmm5
	jmp	.L28
.L23:
	call	vector_sub.part.1
.L35:
	call	vector_add.part.0
	.cfi_endproc
.LFE97:
	.size	lnk_interact.part.4, .-lnk_interact.part.4
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.type	len_john_interact.part.6, @function
len_john_interact.part.6:
.LFB99:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movapd	%xmm0, %xmm6
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm4
	movsd	24(%rsi), %xmm5
	movsd	32(%rsi), %xmm1
	movsd	40(%rsi), %xmm0
	jne	.L44
	subsd	%xmm5, %xmm3
	subsd	%xmm1, %xmm2
	subsd	%xmm0, %xmm4
	movapd	%xmm3, %xmm0
	movapd	%xmm2, %xmm1
	mulsd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm1
	ucomisd	%xmm1, %xmm1
	jp	.L48
.L38:
	ucomisd	.LC4(%rip), %xmm1
	jp	.L45
	je	.L36
.L45:
	movsd	8(%rdi), %xmm0
	movsd	.LC10(%rip), %xmm5
	addsd	8(%rsi), %xmm0
	mulsd	%xmm0, %xmm5
	ucomisd	%xmm1, %xmm5
	ja	.L49
.L36:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	movapd	%xmm0, %xmm5
	movsd	%xmm6, 56(%rsp)
	movq	%rsi, 48(%rsp)
	movq	%rdi, 40(%rsp)
	movsd	%xmm4, 32(%rsp)
	divsd	%xmm1, %xmm5
	movsd	%xmm2, 24(%rsp)
	movsd	%xmm3, 16(%rsp)
	movsd	.LC11(%rip), %xmm1
	movapd	%xmm5, %xmm0
	movsd	%xmm5, 8(%rsp)
	call	pow
	movsd	8(%rsp), %xmm5
	movsd	%xmm0, (%rsp)
	movsd	.LC12(%rip), %xmm1
	movapd	%xmm5, %xmm0
	call	pow
	movsd	(%rsp), %xmm7
	movq	48(%rsp), %rsi
	movsd	56(%rsp), %xmm6
	movq	40(%rsp), %rdi
	subsd	%xmm0, %xmm7
	movsd	32(%rsp), %xmm4
	cmpl	$5, 112(%rsi)
	movsd	16(%rsp), %xmm3
	movsd	24(%rsp), %xmm2
	movsd	96(%rsi), %xmm1
	mulsd	%xmm7, %xmm6
	movsd	104(%rsi), %xmm0
	mulsd	%xmm6, %xmm3
	mulsd	%xmm6, %xmm2
	mulsd	%xmm4, %xmm6
	movsd	88(%rsi), %xmm4
	jne	.L50
	addsd	%xmm3, %xmm4
	addsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm0
	movsd	%xmm4, 88(%rsi)
	movsd	%xmm1, 96(%rsi)
	movsd	%xmm0, 104(%rsi)
	cmpl	$5, 112(%rdi)
	movsd	88(%rdi), %xmm4
	movsd	96(%rdi), %xmm1
	movsd	104(%rdi), %xmm0
	jne	.L44
	subsd	%xmm3, %xmm4
	subsd	%xmm2, %xmm1
	subsd	%xmm6, %xmm0
	movsd	%xmm4, 88(%rdi)
	movsd	%xmm1, 96(%rdi)
	movsd	%xmm0, 104(%rdi)
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L48:
	.cfi_restore_state
	movsd	%xmm6, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdi, 24(%rsp)
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm3, (%rsp)
	call	sqrt
	movsd	40(%rsp), %xmm6
	movapd	%xmm0, %xmm1
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	movsd	16(%rsp), %xmm4
	movsd	8(%rsp), %xmm2
	movsd	(%rsp), %xmm3
	jmp	.L38
.L44:
	call	vector_sub.part.1
.L50:
	call	vector_add.part.0
	.cfi_endproc
.LFE99:
	.size	len_john_interact.part.6, .-len_john_interact.part.6
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	new_vector
	.type	new_vector, @function
new_vector:
.LFB63:
	.cfi_startproc
	movq	%rdi, %rax
	movsd	%xmm0, (%rdi)
	movl	%esi, 24(%rdi)
	movsd	%xmm1, 8(%rdi)
	movsd	%xmm2, 16(%rdi)
	ret
	.cfi_endproc
.LFE63:
	.size	new_vector, .-new_vector
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	vector_add
	.type	vector_add, @function
vector_add:
.LFB64:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	72(%rsp), %eax
	cmpl	40(%rsp), %eax
	jne	.L55
	movsd	24(%rsp), %xmm1
	movl	%eax, 24(%rdi)
	movq	%rdi, %rax
	movsd	32(%rsp), %xmm0
	movsd	16(%rsp), %xmm2
	addsd	56(%rsp), %xmm1
	addsd	64(%rsp), %xmm0
	addsd	48(%rsp), %xmm2
	movsd	%xmm1, 8(%rdi)
	movsd	%xmm0, 16(%rdi)
	movsd	%xmm2, (%rdi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L55:
	.cfi_restore_state
	call	vector_add.part.0
	.cfi_endproc
.LFE64:
	.size	vector_add, .-vector_add
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	vector_sub
	.type	vector_sub, @function
vector_sub:
.LFB65:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	72(%rsp), %eax
	cmpl	40(%rsp), %eax
	jne	.L59
	movsd	24(%rsp), %xmm1
	movl	%eax, 24(%rdi)
	movq	%rdi, %rax
	movsd	32(%rsp), %xmm0
	movsd	16(%rsp), %xmm2
	subsd	56(%rsp), %xmm1
	subsd	64(%rsp), %xmm0
	subsd	48(%rsp), %xmm2
	movsd	%xmm1, 8(%rdi)
	movsd	%xmm0, 16(%rdi)
	movsd	%xmm2, (%rdi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	call	vector_sub.part.1
	.cfi_endproc
.LFE65:
	.size	vector_sub, .-vector_sub
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4,,15
	.globl	negative
	.type	negative, @function
negative:
.LFB66:
	.cfi_startproc
	movsd	.LC17(%rip), %xmm3
	movl	32(%rsp), %edx
	movsd	16(%rsp), %xmm1
	movq	%rdi, %rax
	movsd	24(%rsp), %xmm0
	movsd	8(%rsp), %xmm2
	movl	%edx, 24(%rdi)
	xorpd	%xmm3, %xmm1
	xorpd	%xmm3, %xmm0
	xorpd	%xmm3, %xmm2
	movsd	%xmm1, 8(%rdi)
	movsd	%xmm0, 16(%rdi)
	movsd	%xmm2, (%rdi)
	ret
	.cfi_endproc
.LFE66:
	.size	negative, .-negative
	.section	.text.unlikely
.LCOLDE18:
	.text
.LHOTE18:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.globl	mul_to_num
	.type	mul_to_num, @function
mul_to_num:
.LFB67:
	.cfi_startproc
	movsd	16(%rsp), %xmm2
	movq	%rdi, %rax
	movsd	24(%rsp), %xmm1
	movl	%esi, 24(%rdi)
	mulsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm1
	mulsd	8(%rsp), %xmm0
	movsd	%xmm2, 8(%rdi)
	movsd	%xmm1, 16(%rdi)
	movsd	%xmm0, (%rdi)
	ret
	.cfi_endproc
.LFE67:
	.size	mul_to_num, .-mul_to_num
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.globl	scalar_mul
	.type	scalar_mul, @function
scalar_mul:
.LFB68:
	.cfi_startproc
	movsd	8(%rsp), %xmm0
	movsd	40(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	16(%rsp), %xmm0
	mulsd	48(%rsp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	24(%rsp), %xmm1
	mulsd	56(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE68:
	.size	scalar_mul, .-scalar_mul
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.globl	vector_abs
	.type	vector_abs, @function
vector_abs:
.LFB69:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movsd	16(%rsp), %xmm0
	movsd	24(%rsp), %xmm2
	mulsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	movsd	32(%rsp), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L67
.L64:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L67:
	.cfi_restore_state
	movapd	%xmm1, %xmm0
	call	sqrt
	jmp	.L64
	.cfi_endproc
.LFE69:
	.size	vector_abs, .-vector_abs
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.rodata.str1.1
.LC22:
	.string	"ALL"
.LC23:
	.string	"RADIUS"
.LC24:
	.string	"VELOCITY"
.LC25:
	.string	"ACCELERATION"
.LC26:
	.string	"IMPULSE"
.LC27:
	.string	"UNKNOWN TYPE"
.LC28:
	.string	"FORCE"
.LC29:
	.string	"IMPULSE MOMENT"
.LC30:
	.string	"FORCE MOMENT"
	.section	.text.unlikely
.LCOLDB31:
	.text
.LHOTB31:
	.p2align 4,,15
	.globl	print_type
	.type	print_type, @function
print_type:
.LFB70:
	.cfi_startproc
	movl	32(%rsp), %edx
	movl	$.LC22, %eax
	testl	%edx, %edx
	je	.L69
	cmpl	$1, %edx
	je	.L71
	cmpl	$2, %edx
	je	.L72
	cmpl	$3, %edx
	je	.L73
	cmpl	$4, %edx
	je	.L74
	cmpl	$5, %edx
	je	.L75
	cmpl	$7, %edx
	je	.L76
	cmpl	$6, %edx
	movl	$.LC30, %eax
	movl	$.LC27, %edx
	cmovne	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	movl	$.LC29, %eax
.L69:
	rep ret
	.p2align 4,,10
	.p2align 3
.L71:
	movl	$.LC23, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	movl	$.LC24, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	movl	$.LC25, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	movl	$.LC26, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	movl	$.LC28, %eax
	ret
	.cfi_endproc
.LFE70:
	.size	print_type, .-print_type
	.section	.text.unlikely
.LCOLDE31:
	.text
.LHOTE31:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC32:
	.string	"(%lg, %lg, %lg) abs: %lg, type: %s"
	.section	.text.unlikely
.LCOLDB33:
	.text
.LHOTB33:
	.p2align 4,,15
	.globl	str_output
	.type	str_output, @function
str_output:
.LFB71:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$12, %ecx
	movl	$.LC22, %r8d
	subq	$152, %rsp
	.cfi_def_cfa_offset 176
	leaq	32(%rsp), %rbp
	movsd	176(%rsp), %xmm4
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rdi
	movsd	184(%rsp), %xmm1
	rep stosq
	movl	200(%rsp), %eax
	movsd	192(%rsp), %xmm2
	testl	%eax, %eax
	movl	$0, (%rdi)
	je	.L80
	cmpl	$1, %eax
	je	.L87
	cmpl	$2, %eax
	je	.L88
	cmpl	$3, %eax
	je	.L89
	cmpl	$4, %eax
	je	.L90
	cmpl	$5, %eax
	je	.L91
	cmpl	$7, %eax
	je	.L92
	cmpl	$6, %eax
	movl	$.LC27, %r8d
	movl	$.LC30, %eax
	cmove	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L80:
	movapd	%xmm1, %xmm0
	movapd	%xmm4, %xmm3
	mulsd	%xmm1, %xmm0
	mulsd	%xmm4, %xmm3
	addsd	%xmm3, %xmm0
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	sqrtsd	%xmm0, %xmm3
	ucomisd	%xmm3, %xmm3
	jp	.L98
.L81:
	movapd	%xmm4, %xmm0
	movl	$100, %edx
	movl	$.LC32, %ecx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$4, %eax
	call	__sprintf_chk
	movq	%rbp, %rdx
.L83:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L83
	movl	%eax, %ecx
	movl	$1, %esi
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %ebx
	cmove	%rcx, %rdx
	addb	%al, %bl
	sbbq	$3, %rdx
	subq	%rbp, %rdx
	leaq	1(%rdx), %rbx
	movq	%rbx, %rdi
	call	calloc
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	memcpy
	movq	136(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L99
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	movl	$.LC23, %r8d
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L88:
	movl	$.LC24, %r8d
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L89:
	movl	$.LC25, %r8d
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L90:
	movl	$.LC26, %r8d
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L91:
	movl	$.LC28, %r8d
	jmp	.L80
.L99:
	call	__stack_chk_fail
	.p2align 4,,10
	.p2align 3
.L92:
	movl	$.LC29, %r8d
	jmp	.L80
.L98:
	movsd	%xmm2, 24(%rsp)
	movq	%r8, 8(%rsp)
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm1, (%rsp)
	call	sqrt
	movsd	24(%rsp), %xmm2
	movapd	%xmm0, %xmm3
	movsd	16(%rsp), %xmm4
	movq	8(%rsp), %r8
	movsd	(%rsp), %xmm1
	jmp	.L81
	.cfi_endproc
.LFE71:
	.size	str_output, .-str_output
	.section	.text.unlikely
.LCOLDE33:
	.text
.LHOTE33:
	.section	.text.unlikely
.LCOLDB34:
	.text
.LHOTB34:
	.p2align 4,,15
	.globl	new_point
	.type	new_point, @function
new_point:
.LFB72:
	.cfi_startproc
	movl	$168, %esi
	movl	$1, %edi
	jmp	calloc
	.cfi_endproc
.LFE72:
	.size	new_point, .-new_point
	.section	.text.unlikely
.LCOLDE34:
	.text
.LHOTE34:
	.section	.text.unlikely
.LCOLDB36:
	.text
.LHOTB36:
	.p2align 4,,15
	.globl	calc_movement
	.type	calc_movement, @function
calc_movement:
.LFB73:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	.L101
	movsd	.LC35(%rip), %xmm1
	cmpl	$2, 80(%rdi)
	movsd	88(%rdi), %xmm5
	movl	$3, 144(%rdi)
	divsd	(%rdi), %xmm1
	movsd	96(%rdi), %xmm3
	movsd	56(%rdi), %xmm6
	movsd	64(%rdi), %xmm4
	movsd	72(%rdi), %xmm2
	mulsd	%xmm1, %xmm5
	mulsd	%xmm1, %xmm3
	mulsd	104(%rdi), %xmm1
	movsd	%xmm5, 120(%rdi)
	mulsd	%xmm0, %xmm5
	movsd	%xmm3, 128(%rdi)
	mulsd	%xmm0, %xmm3
	movsd	%xmm1, 136(%rdi)
	mulsd	%xmm0, %xmm1
	jne	.L104
	addsd	%xmm4, %xmm3
	cmpl	$1, 48(%rdi)
	addsd	%xmm2, %xmm1
	movsd	24(%rdi), %xmm4
	addsd	%xmm6, %xmm5
	movsd	32(%rdi), %xmm2
	movsd	%xmm3, 64(%rdi)
	mulsd	%xmm0, %xmm3
	movsd	%xmm1, 72(%rdi)
	mulsd	%xmm0, %xmm1
	movsd	%xmm5, 56(%rdi)
	mulsd	%xmm0, %xmm5
	movsd	40(%rdi), %xmm0
	jne	.L104
	addsd	%xmm4, %xmm5
	addsd	%xmm2, %xmm3
	addsd	%xmm0, %xmm1
	movsd	%xmm5, 24(%rdi)
	movsd	%xmm3, 32(%rdi)
	movsd	%xmm1, 40(%rdi)
.L101:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L104:
	.cfi_restore_state
	call	vector_add.part.0
	.cfi_endproc
.LFE73:
	.size	calc_movement, .-calc_movement
	.section	.text.unlikely
.LCOLDE36:
	.text
.LHOTE36:
	.section	.text.unlikely
.LCOLDB37:
	.text
.LHOTB37:
	.p2align 4,,15
	.globl	point_init
	.type	point_init, @function
point_init:
.LFB74:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L109
	movq	$0, 88(%rdi)
	movq	$0, 96(%rdi)
	movq	$0, 104(%rdi)
	movl	$5, 112(%rdi)
.L109:
	rep ret
	.cfi_endproc
.LFE74:
	.size	point_init, .-point_init
	.section	.text.unlikely
.LCOLDE37:
	.text
.LHOTE37:
	.section	.rodata.str1.1
.LC38:
	.string	"ph_point.h"
.LC39:
	.string	"point"
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"type: %d\nmass: %lg\nradius: %lg\ncharge: %lg\nradius vector: %s\nvelocity: %s\nacceleration: %s\nforce: %s"
	.section	.text.unlikely
.LCOLDB41:
	.text
.LHOTB41:
	.p2align 4,,15
	.globl	point_str_printout
	.type	point_str_printout, @function
point_str_printout:
.LFB75:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1008, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L122
	movq	%rdi, %rbx
	leaq	-1040(%rbp), %rdi
	xorl	%eax, %eax
	movl	$125, %ecx
	rep stosq
	pushq	112(%rbx)
	pushq	104(%rbx)
	pushq	96(%rbx)
	pushq	88(%rbx)
	call	str_output
	addq	$32, %rsp
	pushq	144(%rbx)
	pushq	136(%rbx)
	pushq	128(%rbx)
	pushq	120(%rbx)
	movq	%rax, %r14
	call	str_output
	addq	$32, %rsp
	pushq	80(%rbx)
	pushq	72(%rbx)
	pushq	64(%rbx)
	pushq	56(%rbx)
	movq	%rax, %r13
	call	str_output
	addq	$32, %rsp
	pushq	48(%rbx)
	pushq	40(%rbx)
	pushq	32(%rbx)
	pushq	24(%rbx)
	movq	%rax, %r12
	call	str_output
	addq	$24, %rsp
	movl	152(%rbx), %r8d
	leaq	-1040(%rbp), %rdi
	pushq	%r14
	movsd	16(%rbx), %xmm2
	pushq	%r13
	movsd	8(%rbx), %xmm1
	pushq	%r12
	movsd	(%rbx), %xmm0
	movq	%rax, %r9
	movl	$1000, %edx
	movl	$.LC40, %ecx
	movl	$1, %esi
	movl	$3, %eax
	call	__sprintf_chk
	leaq	-1040(%rbp), %rdx
.L116:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L116
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %esi
	cmove	%rcx, %rdx
	addb	%al, %sil
	leaq	-1040(%rbp), %rax
	sbbq	$3, %rdx
	movl	$1, %esi
	addq	$32, %rsp
	subq	%rax, %rdx
	leaq	1(%rdx), %rbx
	movq	%rbx, %rdi
	call	calloc
	leaq	-1040(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	memcpy
	movq	-40(%rbp), %rsi
	xorq	%fs:40, %rsi
	jne	.L123
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L123:
	.cfi_restore_state
	call	__stack_chk_fail
.L122:
	movl	$__PRETTY_FUNCTION__.4663, %ecx
	movl	$40, %edx
	movl	$.LC38, %esi
	movl	$.LC39, %edi
	call	__assert_fail
	.cfi_endproc
.LFE75:
	.size	point_str_printout, .-point_str_printout
	.section	.text.unlikely
.LCOLDE41:
	.text
.LHOTE41:
	.section	.text.unlikely
.LCOLDB42:
	.text
.LHOTB42:
	.p2align 4,,15
	.globl	grav_interact
	.type	grav_interact, @function
grav_interact:
.LFB76:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L146
	testq	%rsi, %rsi
	je	.L146
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movl	48(%rdi), %eax
	cmpl	%eax, 48(%rsi)
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm0
	movsd	24(%rsi), %xmm5
	movsd	32(%rsi), %xmm4
	movsd	40(%rsi), %xmm1
	jne	.L136
	subsd	%xmm5, %xmm3
	movapd	%xmm0, %xmm5
	subsd	%xmm4, %xmm2
	subsd	%xmm1, %xmm5
	movapd	%xmm3, %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	movapd	%xmm5, %xmm4
	mulsd	%xmm2, %xmm0
	mulsd	%xmm5, %xmm4
	addsd	%xmm0, %xmm1
	addsd	%xmm4, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L147
.L129:
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L138
	je	.L124
.L138:
	movsd	8(%rbx), %xmm4
	addsd	8(%rbp), %xmm4
	ucomisd	%xmm4, %xmm0
	ja	.L148
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm3
.L133:
	cmpl	$5, 112(%rbp)
	movsd	88(%rbp), %xmm5
	movsd	96(%rbp), %xmm4
	movsd	104(%rbp), %xmm1
	jne	.L149
	addsd	%xmm3, %xmm5
	addsd	%xmm2, %xmm4
	addsd	%xmm0, %xmm1
	movsd	%xmm5, 88(%rbp)
	movsd	%xmm4, 96(%rbp)
	movsd	%xmm1, 104(%rbp)
	cmpl	$5, 112(%rbx)
	movsd	88(%rbx), %xmm5
	movsd	96(%rbx), %xmm4
	movsd	104(%rbx), %xmm1
	jne	.L136
	subsd	%xmm3, %xmm5
	subsd	%xmm2, %xmm4
	subsd	%xmm0, %xmm1
	movsd	%xmm5, 88(%rbx)
	movsd	%xmm4, 96(%rbx)
	movsd	%xmm1, 104(%rbx)
.L124:
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L146:
	rep ret
	.p2align 4,,10
	.p2align 3
.L148:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movsd	.LC6(%rip), %xmm4
	movsd	.LC7(%rip), %xmm1
	mulsd	(%rbx), %xmm4
	movsd	%xmm5, 24(%rsp)
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm3, 8(%rsp)
	mulsd	0(%rbp), %xmm4
	movsd	%xmm4, (%rsp)
	call	pow
	movsd	(%rsp), %xmm4
	movsd	8(%rsp), %xmm3
	divsd	%xmm0, %xmm4
	movsd	16(%rsp), %xmm2
	movsd	24(%rsp), %xmm5
	movapd	%xmm4, %xmm0
	mulsd	%xmm4, %xmm3
	mulsd	%xmm4, %xmm2
	mulsd	%xmm5, %xmm0
	jmp	.L133
.L147:
	movapd	%xmm1, %xmm0
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm3, (%rsp)
	call	sqrt
	movsd	16(%rsp), %xmm5
	movsd	8(%rsp), %xmm2
	movsd	(%rsp), %xmm3
	jmp	.L129
.L136:
	call	vector_sub.part.1
.L149:
	call	vector_add.part.0
	.cfi_endproc
.LFE76:
	.size	grav_interact, .-grav_interact
	.section	.text.unlikely
.LCOLDE42:
	.text
.LHOTE42:
	.section	.text.unlikely
.LCOLDB43:
	.text
.LHOTB43:
	.p2align 4,,15
	.globl	common_interact
	.type	common_interact, @function
common_interact:
.LFB77:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L150
	testq	%rsi, %rsi
	je	.L150
	jmp	common_interact.part.2
	.p2align 4,,10
	.p2align 3
.L150:
	rep ret
	.cfi_endproc
.LFE77:
	.size	common_interact, .-common_interact
	.section	.text.unlikely
.LCOLDE43:
	.text
.LHOTE43:
	.section	.text.unlikely
.LCOLDB45:
	.text
.LHOTB45:
	.p2align 4,,15
	.globl	common_energy
	.type	common_energy, @function
common_energy:
.LFB78:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L175
	testq	%rsi, %rsi
	je	.L175
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movsd	24(%rdi), %xmm0
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm1
	movsd	24(%rsi), %xmm5
	movsd	32(%rsi), %xmm4
	movsd	40(%rsi), %xmm3
	jne	.L176
	subsd	%xmm5, %xmm0
	subsd	%xmm4, %xmm2
	subsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	sqrtsd	%xmm2, %xmm2
	ucomisd	%xmm2, %xmm2
	jp	.L177
.L163:
	pxor	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jp	.L168
	je	.L161
.L168:
	movsd	8(%rbp), %xmm1
	addsd	8(%rbx), %xmm1
	ucomisd	%xmm1, %xmm2
	jbe	.L161
	movsd	.LC44(%rip), %xmm0
	movsd	.LC6(%rip), %xmm1
	mulsd	16(%rbp), %xmm0
	mulsd	0(%rbp), %xmm1
	mulsd	16(%rbx), %xmm0
	mulsd	(%rbx), %xmm1
	subsd	%xmm1, %xmm0
	divsd	%xmm2, %xmm0
.L161:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	pxor	%xmm0, %xmm0
	ret
.L177:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	call	sqrt
	movapd	%xmm0, %xmm2
	jmp	.L163
.L176:
	call	vector_sub.part.1
	.cfi_endproc
.LFE78:
	.size	common_energy, .-common_energy
	.section	.text.unlikely
.LCOLDE45:
	.text
.LHOTE45:
	.section	.text.unlikely
.LCOLDB46:
	.text
.LHOTB46:
	.p2align 4,,15
	.globl	qulon_interact
	.type	qulon_interact, @function
qulon_interact:
.LFB79:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L200
	testq	%rsi, %rsi
	je	.L200
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movl	48(%rdi), %eax
	cmpl	%eax, 48(%rsi)
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm0
	movsd	24(%rsi), %xmm5
	movsd	32(%rsi), %xmm4
	movsd	40(%rsi), %xmm1
	jne	.L189
	subsd	%xmm5, %xmm3
	movapd	%xmm0, %xmm5
	subsd	%xmm4, %xmm2
	subsd	%xmm1, %xmm5
	movapd	%xmm3, %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	movapd	%xmm5, %xmm4
	mulsd	%xmm2, %xmm0
	mulsd	%xmm5, %xmm4
	addsd	%xmm0, %xmm1
	addsd	%xmm4, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L201
.L183:
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L192
	je	.L178
.L192:
	movsd	8(%rbx), %xmm4
	addsd	8(%rbp), %xmm4
	ucomisd	%xmm4, %xmm0
	ja	.L202
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm3
.L187:
	cmpl	$5, 112(%rbp)
	movsd	88(%rbp), %xmm5
	movsd	96(%rbp), %xmm4
	movsd	104(%rbp), %xmm1
	jne	.L189
	subsd	%xmm3, %xmm5
	subsd	%xmm2, %xmm4
	subsd	%xmm0, %xmm1
	movsd	%xmm5, 88(%rbp)
	movsd	%xmm4, 96(%rbp)
	movsd	%xmm1, 104(%rbp)
	cmpl	$5, 112(%rbx)
	movsd	88(%rbx), %xmm5
	movsd	96(%rbx), %xmm4
	movsd	104(%rbx), %xmm1
	jne	.L203
	addsd	%xmm5, %xmm3
	addsd	%xmm4, %xmm2
	addsd	%xmm1, %xmm0
	movsd	%xmm3, 88(%rbx)
	movsd	%xmm2, 96(%rbx)
	movsd	%xmm0, 104(%rbx)
.L178:
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L200:
	rep ret
	.p2align 4,,10
	.p2align 3
.L202:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movsd	.LC5(%rip), %xmm4
	movsd	.LC7(%rip), %xmm1
	mulsd	16(%rbx), %xmm4
	movsd	%xmm5, 24(%rsp)
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm3, 8(%rsp)
	mulsd	16(%rbp), %xmm4
	movsd	%xmm4, (%rsp)
	call	pow
	movsd	(%rsp), %xmm4
	movsd	8(%rsp), %xmm3
	divsd	%xmm0, %xmm4
	movsd	16(%rsp), %xmm2
	movsd	24(%rsp), %xmm5
	movapd	%xmm4, %xmm0
	mulsd	%xmm4, %xmm3
	mulsd	%xmm4, %xmm2
	mulsd	%xmm5, %xmm0
	jmp	.L187
.L201:
	movapd	%xmm1, %xmm0
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm3, (%rsp)
	call	sqrt
	movsd	16(%rsp), %xmm5
	movsd	8(%rsp), %xmm2
	movsd	(%rsp), %xmm3
	jmp	.L183
.L189:
	call	vector_sub.part.1
.L203:
	call	vector_add.part.0
	.cfi_endproc
.LFE79:
	.size	qulon_interact, .-qulon_interact
	.section	.text.unlikely
.LCOLDE46:
	.text
.LHOTE46:
	.section	.text.unlikely
.LCOLDB47:
	.text
.LHOTB47:
	.p2align 4,,15
	.globl	elastic_interact
	.type	elastic_interact, @function
elastic_interact:
.LFB80:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L223
	testq	%rsi, %rsi
	je	.L223
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movapd	%xmm0, %xmm7
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movsd	24(%rdi), %xmm4
	movsd	32(%rdi), %xmm3
	movsd	40(%rdi), %xmm2
	movsd	24(%rsi), %xmm6
	movsd	32(%rsi), %xmm5
	movsd	40(%rsi), %xmm0
	jne	.L215
	subsd	%xmm6, %xmm4
	subsd	%xmm5, %xmm3
	subsd	%xmm0, %xmm2
	movapd	%xmm4, %xmm6
	movapd	%xmm3, %xmm5
	mulsd	%xmm4, %xmm6
	mulsd	%xmm3, %xmm5
	addsd	%xmm5, %xmm6
	movapd	%xmm2, %xmm5
	mulsd	%xmm2, %xmm5
	addsd	%xmm5, %xmm6
	sqrtsd	%xmm6, %xmm5
	ucomisd	%xmm5, %xmm5
	movapd	%xmm5, %xmm8
	jp	.L224
.L209:
	ucomisd	.LC4(%rip), %xmm8
	jp	.L217
	jne	.L217
	addq	$72, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L223:
	rep ret
	.p2align 4,,10
	.p2align 3
.L217:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	ucomisd	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	jp	.L225
.L213:
	subsd	%xmm0, %xmm7
	cmpl	$5, 112(%rbp)
	movsd	88(%rbp), %xmm5
	movsd	104(%rbp), %xmm0
	mulsd	%xmm7, %xmm1
	divsd	%xmm8, %xmm1
	mulsd	%xmm1, %xmm4
	mulsd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm2
	movsd	96(%rbp), %xmm1
	jne	.L215
	subsd	%xmm4, %xmm5
	subsd	%xmm3, %xmm1
	subsd	%xmm2, %xmm0
	movsd	%xmm5, 88(%rbp)
	movsd	%xmm1, 96(%rbp)
	movsd	%xmm0, 104(%rbp)
	cmpl	$5, 112(%rbx)
	movsd	88(%rbx), %xmm5
	movsd	96(%rbx), %xmm1
	movsd	104(%rbx), %xmm0
	jne	.L226
	addsd	%xmm5, %xmm4
	addsd	%xmm1, %xmm3
	addsd	%xmm0, %xmm2
	movsd	%xmm4, 88(%rbx)
	movsd	%xmm3, 96(%rbx)
	movsd	%xmm2, 104(%rbx)
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	.L223
.L224:
	.cfi_restore_state
	movapd	%xmm6, %xmm0
	movsd	%xmm1, 56(%rsp)
	movsd	%xmm7, 48(%rsp)
	movsd	%xmm5, 40(%rsp)
	movsd	%xmm2, 32(%rsp)
	movsd	%xmm3, 24(%rsp)
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm6, 8(%rsp)
	call	sqrt
	movsd	56(%rsp), %xmm1
	movapd	%xmm0, %xmm8
	movsd	48(%rsp), %xmm7
	movsd	40(%rsp), %xmm5
	movsd	32(%rsp), %xmm2
	movsd	24(%rsp), %xmm3
	movsd	16(%rsp), %xmm4
	movsd	8(%rsp), %xmm6
	jmp	.L209
.L225:
	movapd	%xmm6, %xmm0
	movsd	%xmm1, 48(%rsp)
	movsd	%xmm7, 40(%rsp)
	movsd	%xmm8, 32(%rsp)
	movsd	%xmm2, 24(%rsp)
	movsd	%xmm3, 16(%rsp)
	movsd	%xmm4, 8(%rsp)
	call	sqrt
	movsd	48(%rsp), %xmm1
	movsd	40(%rsp), %xmm7
	movsd	32(%rsp), %xmm8
	movsd	24(%rsp), %xmm2
	movsd	16(%rsp), %xmm3
	movsd	8(%rsp), %xmm4
	jmp	.L213
.L215:
	call	vector_sub.part.1
.L226:
	call	vector_add.part.0
	.cfi_endproc
.LFE80:
	.size	elastic_interact, .-elastic_interact
	.section	.text.unlikely
.LCOLDE47:
	.text
.LHOTE47:
	.section	.text.unlikely
.LCOLDB48:
	.text
.LHOTB48:
	.p2align 4,,15
	.globl	viscous_interact
	.type	viscous_interact, @function
viscous_interact:
.LFB81:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L244
	testq	%rsi, %rsi
	je	.L244
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movapd	%xmm0, %xmm6
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	movl	80(%rsi), %eax
	cmpl	%eax, 80(%rdi)
	movsd	56(%rdi), %xmm10
	movsd	64(%rdi), %xmm8
	movsd	72(%rdi), %xmm7
	movsd	56(%rsi), %xmm12
	movsd	64(%rsi), %xmm11
	movsd	72(%rsi), %xmm9
	jne	.L232
	movl	48(%rdi), %eax
	cmpl	%eax, 48(%rsi)
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm1
	movsd	24(%rsi), %xmm5
	movsd	32(%rsi), %xmm4
	movsd	40(%rsi), %xmm0
	jne	.L232
	subsd	%xmm5, %xmm3
	subsd	%xmm4, %xmm2
	subsd	%xmm0, %xmm1
	movapd	%xmm3, %xmm5
	movapd	%xmm2, %xmm4
	mulsd	%xmm3, %xmm5
	mulsd	%xmm2, %xmm4
	addsd	%xmm4, %xmm5
	movapd	%xmm1, %xmm4
	mulsd	%xmm1, %xmm4
	addsd	%xmm4, %xmm5
	sqrtsd	%xmm5, %xmm4
	ucomisd	%xmm4, %xmm4
	movapd	%xmm5, %xmm0
	jp	.L245
.L233:
	ucomisd	.LC4(%rip), %xmm4
	jp	.L238
	jne	.L238
	addq	$88, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L244:
	rep ret
	.p2align 4,,10
	.p2align 3
.L238:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movapd	%xmm10, %xmm0
	mulsd	%xmm4, %xmm4
	subsd	%xmm11, %xmm8
	cmpl	$5, 112(%rbp)
	subsd	%xmm12, %xmm0
	movsd	88(%rbp), %xmm5
	subsd	%xmm9, %xmm7
	mulsd	%xmm2, %xmm8
	mulsd	%xmm3, %xmm0
	mulsd	%xmm1, %xmm7
	addsd	%xmm8, %xmm0
	addsd	%xmm7, %xmm0
	mulsd	%xmm6, %xmm0
	divsd	%xmm4, %xmm0
	movsd	96(%rbp), %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm1
	movsd	104(%rbp), %xmm0
	jne	.L246
	addsd	%xmm3, %xmm5
	addsd	%xmm2, %xmm4
	addsd	%xmm1, %xmm0
	movsd	%xmm5, 88(%rbp)
	movsd	%xmm4, 96(%rbp)
	movsd	%xmm0, 104(%rbp)
	cmpl	$5, 112(%rbx)
	movsd	88(%rbx), %xmm5
	movsd	96(%rbx), %xmm4
	movsd	104(%rbx), %xmm0
	jne	.L232
	subsd	%xmm3, %xmm5
	subsd	%xmm2, %xmm4
	subsd	%xmm1, %xmm0
	movsd	%xmm5, 88(%rbx)
	movsd	%xmm4, 96(%rbx)
	movsd	%xmm0, 104(%rbx)
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	.L244
.L245:
	.cfi_restore_state
	movsd	%xmm6, 72(%rsp)
	movsd	%xmm9, 64(%rsp)
	movsd	%xmm1, 56(%rsp)
	movsd	%xmm2, 48(%rsp)
	movsd	%xmm3, 40(%rsp)
	movsd	%xmm10, 32(%rsp)
	movsd	%xmm8, 24(%rsp)
	movsd	%xmm7, 16(%rsp)
	movsd	%xmm12, 8(%rsp)
	movsd	%xmm11, (%rsp)
	call	sqrt
	movsd	72(%rsp), %xmm6
	movapd	%xmm0, %xmm4
	movsd	64(%rsp), %xmm9
	movsd	56(%rsp), %xmm1
	movsd	48(%rsp), %xmm2
	movsd	40(%rsp), %xmm3
	movsd	32(%rsp), %xmm10
	movsd	24(%rsp), %xmm8
	movsd	16(%rsp), %xmm7
	movsd	8(%rsp), %xmm12
	movsd	(%rsp), %xmm11
	jmp	.L233
.L232:
	call	vector_sub.part.1
.L246:
	call	vector_add.part.0
	.cfi_endproc
.LFE81:
	.size	viscous_interact, .-viscous_interact
	.section	.text.unlikely
.LCOLDE48:
	.text
.LHOTE48:
	.section	.text.unlikely
.LCOLDB49:
	.text
.LHOTB49:
	.p2align 4,,15
	.globl	lnk_interact
	.type	lnk_interact, @function
lnk_interact:
.LFB82:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L247
	testq	%rsi, %rsi
	je	.L247
	jmp	lnk_interact.part.4
	.p2align 4,,10
	.p2align 3
.L247:
	rep ret
	.cfi_endproc
.LFE82:
	.size	lnk_interact, .-lnk_interact
	.section	.text.unlikely
.LCOLDE49:
	.text
.LHOTE49:
	.section	.text.unlikely
.LCOLDB51:
	.text
.LHOTB51:
	.p2align 4,,15
	.globl	lnk_energy
	.type	lnk_energy, @function
lnk_energy:
.LFB83:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L270
	testq	%rsi, %rsi
	je	.L270
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movapd	%xmm0, %xmm5
	movsd	24(%rdi), %xmm4
	movsd	32(%rdi), %xmm3
	movsd	40(%rdi), %xmm2
	movsd	24(%rsi), %xmm7
	movsd	32(%rsi), %xmm6
	movsd	40(%rsi), %xmm0
	jne	.L271
	subsd	%xmm7, %xmm4
	subsd	%xmm6, %xmm3
	subsd	%xmm0, %xmm2
	mulsd	%xmm4, %xmm4
	mulsd	%xmm3, %xmm3
	mulsd	%xmm2, %xmm2
	addsd	%xmm4, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm3, %xmm0
	sqrtsd	%xmm3, %xmm3
	ucomisd	%xmm3, %xmm3
	jp	.L272
.L260:
	pxor	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm3
	jp	.L264
	jne	.L264
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L264:
	.cfi_restore_state
	subsd	%xmm3, %xmm5
	movapd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	.LC50(%rip), %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L270:
	pxor	%xmm0, %xmm0
	ret
.L272:
	.cfi_def_cfa_offset 32
	movsd	%xmm1, 8(%rsp)
	movsd	%xmm5, (%rsp)
	call	sqrt
	movsd	8(%rsp), %xmm1
	movapd	%xmm0, %xmm3
	movsd	(%rsp), %xmm5
	jmp	.L260
.L271:
	call	vector_sub.part.1
	.cfi_endproc
.LFE83:
	.size	lnk_energy, .-lnk_energy
	.section	.text.unlikely
.LCOLDE51:
	.text
.LHOTE51:
	.section	.text.unlikely
.LCOLDB52:
	.text
.LHOTB52:
	.p2align 4,,15
	.globl	len_john_interact
	.type	len_john_interact, @function
len_john_interact:
.LFB84:
	.cfi_startproc
	testq	%rdi, %rdi
	setne	%dl
	cmpq	%rsi, %rdi
	setne	%al
	testb	%al, %dl
	je	.L273
	testq	%rsi, %rsi
	je	.L273
	jmp	len_john_interact.part.6
	.p2align 4,,10
	.p2align 3
.L273:
	rep ret
	.cfi_endproc
.LFE84:
	.size	len_john_interact, .-len_john_interact
	.section	.text.unlikely
.LCOLDE52:
	.text
.LHOTE52:
	.section	.text.unlikely
.LCOLDB56:
	.text
.LHOTB56:
	.p2align 4,,15
	.globl	len_john_energy
	.type	len_john_energy, @function
len_john_energy:
.LFB85:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setne	%dl
	testq	%rdi, %rdi
	setne	%al
	testb	%al, %dl
	je	.L298
	testq	%rsi, %rsi
	je	.L298
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movapd	%xmm0, %xmm4
	movq	%rsi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movl	48(%rsi), %eax
	cmpl	%eax, 48(%rdi)
	movsd	24(%rdi), %xmm3
	movsd	32(%rdi), %xmm2
	movsd	40(%rdi), %xmm1
	movsd	24(%rsi), %xmm6
	movsd	32(%rsi), %xmm5
	movsd	40(%rsi), %xmm0
	jne	.L299
	subsd	%xmm6, %xmm3
	subsd	%xmm5, %xmm2
	subsd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm3
	mulsd	%xmm2, %xmm2
	mulsd	%xmm1, %xmm1
	addsd	%xmm3, %xmm2
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	sqrtsd	%xmm2, %xmm2
	ucomisd	%xmm2, %xmm2
	jp	.L300
.L286:
	pxor	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jp	.L291
	je	.L284
.L291:
	movsd	8(%rbp), %xmm1
	movsd	.LC10(%rip), %xmm3
	addsd	8(%rbx), %xmm1
	mulsd	%xmm1, %xmm3
	ucomisd	%xmm2, %xmm3
	ja	.L301
.L284:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L301:
	.cfi_restore_state
	divsd	%xmm2, %xmm1
	movsd	%xmm4, 24(%rsp)
	movapd	%xmm1, %xmm2
	movsd	.LC53(%rip), %xmm1
	movapd	%xmm2, %xmm0
	movsd	%xmm2, 16(%rsp)
	call	pow
	movsd	16(%rsp), %xmm2
	movsd	%xmm0, 8(%rsp)
	movsd	.LC54(%rip), %xmm1
	movapd	%xmm2, %xmm0
	call	pow
	movsd	8(%rsp), %xmm3
	movapd	%xmm0, %xmm1
	movsd	24(%rsp), %xmm4
	divsd	.LC55(%rip), %xmm3
	divsd	.LC54(%rip), %xmm1
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movapd	%xmm3, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L298:
	pxor	%xmm0, %xmm0
	ret
.L300:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movsd	%xmm4, 8(%rsp)
	call	sqrt
	movsd	8(%rsp), %xmm4
	movapd	%xmm0, %xmm2
	jmp	.L286
.L299:
	call	vector_sub.part.1
	.cfi_endproc
.LFE85:
	.size	len_john_energy, .-len_john_energy
	.section	.text.unlikely
.LCOLDE56:
	.text
.LHOTE56:
	.section	.text.unlikely
.LCOLDB58:
	.text
.LHOTB58:
	.p2align 4,,15
	.globl	cur_time
	.type	cur_time, @function
cur_time:
.LFB86:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	clock
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC57(%rip), %xmm0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE86:
	.size	cur_time, .-cur_time
	.section	.text.unlikely
.LCOLDE58:
	.text
.LHOTE58:
	.section	.text.unlikely
.LCOLDB59:
	.text
.LHOTB59:
	.p2align 4,,15
	.globl	new_interact
	.type	new_interact, @function
new_interact:
.LFB87:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	$40, %esi
	movl	$1, %edi
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	calloc
	movsd	24(%rsp), %xmm0
	movsd	16(%rsp), %xmm1
	movsd	8(%rsp), %xmm2
	movsd	%xmm0, 24(%rax)
	movsd	%xmm1, 16(%rax)
	movsd	%xmm2, 32(%rax)
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE87:
	.size	new_interact, .-new_interact
	.section	.text.unlikely
.LCOLDE59:
	.text
.LHOTE59:
	.section	.text.unlikely
.LCOLDB60:
	.text
.LHOTB60:
	.p2align 4,,15
	.globl	make_new_universe
	.type	make_new_universe, @function
make_new_universe:
.LFB88:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edi, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebp
	movl	$1, %edi
	movl	$64, %esi
	call	calloc
	movslq	%r12d, %rdi
	movl	$8, %esi
	movq	%rax, %rbx
	call	calloc
	movslq	%ebp, %rdi
	movl	$8, %esi
	movq	%rax, (%rbx)
	call	calloc
	movl	%r12d, 8(%rbx)
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	movl	%ebp, 24(%rbx)
	movq	$0, 32(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE88:
	.size	make_new_universe, .-make_new_universe
	.section	.text.unlikely
.LCOLDE60:
	.text
.LHOTE60:
	.section	.text.unlikely
.LCOLDB61:
	.text
.LHOTB61:
	.p2align 4,,15
	.globl	calc_group_interactions
	.type	calc_group_interactions, @function
calc_group_interactions:
.LFB89:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	8(%rdi), %eax
	movq	%rdi, %rbx
	testl	%eax, %eax
	jle	.L309
	movq	(%rdi), %rcx
	leal	-1(%rax), %edx
	leaq	8(%rcx,%rdx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L311:
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L310
	movq	$0, 88(%rdx)
	movq	$0, 96(%rdx)
	movq	$0, 104(%rdx)
	movl	$5, 112(%rdx)
.L310:
	addq	$8, %rcx
	cmpq	%rsi, %rcx
	jne	.L311
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	cmpl	%eax, %r13d
	jl	.L322
	addl	$1, %r13d
	addq	$8, %r14
	cmpl	%eax, %r13d
	jge	.L309
	.p2align 4,,10
	.p2align 3
.L322:
	movq	%r14, %r12
	movl	%r13d, %ebp
	.p2align 4,,10
	.p2align 3
.L315:
	movl	44(%rbx), %edx
	testl	%edx, %edx
	je	.L313
	movq	(%rbx), %rax
	movq	(%rax,%r14), %rdi
	movq	(%rax,%r12), %rsi
	testq	%rdi, %rdi
	je	.L313
	testq	%rsi, %rsi
	je	.L313
	call	common_interact.part.2
	.p2align 4,,10
	.p2align 3
.L313:
	movl	40(%rbx), %eax
	testl	%eax, %eax
	je	.L314
	movq	(%rbx), %rax
	movq	(%rax,%r12), %rsi
	movq	(%rax,%r14), %rdi
	cmpq	%rdi, %rsi
	setne	%dl
	testq	%rsi, %rsi
	setne	%al
	testb	%al, %dl
	je	.L314
	testq	%rdi, %rdi
	je	.L314
	movsd	48(%rbx), %xmm0
	call	len_john_interact.part.6
.L314:
	movl	8(%rbx), %eax
	addl	$1, %ebp
	addq	$8, %r12
	cmpl	%ebp, %eax
	jg	.L315
	addl	$1, %r13d
	addq	$8, %r14
	cmpl	%eax, %r13d
	jl	.L322
.L309:
	movl	24(%rbx), %edx
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testl	%edx, %edx
	jle	.L308
	.p2align 4,,10
	.p2align 3
.L339:
	movq	16(%rbx), %rax
	movq	(%rax,%r12), %rax
	testq	%rax, %rax
	je	.L319
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	testq	%rdi, %rdi
	je	.L319
	testq	%rsi, %rsi
	je	.L319
	movsd	24(%rax), %xmm0
	movsd	32(%rax), %xmm2
	movsd	16(%rax), %xmm1
	call	lnk_interact.part.4
	movl	24(%rbx), %edx
.L319:
	addl	$1, %ebp
	addq	$8, %r12
	cmpl	%edx, %ebp
	jl	.L339
.L308:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE89:
	.size	calc_group_interactions, .-calc_group_interactions
	.section	.text.unlikely
.LCOLDE61:
	.text
.LHOTE61:
	.section	.text.unlikely
.LCOLDB62:
	.text
.LHOTB62:
	.p2align 4,,15
	.globl	calc_group_energy
	.type	calc_group_energy, @function
calc_group_energy:
.LFB90:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jle	.L387
	movq	(%rdi), %rcx
	pxor	%xmm5, %xmm5
	leal	-1(%rax), %edx
	movsd	.LC50(%rip), %xmm4
	leaq	8(%rcx,%rdx,8), %rsi
	movapd	%xmm5, %xmm2
	.p2align 4,,10
	.p2align 3
.L354:
	movq	(%rcx), %rdx
	addq	$8, %rcx
	cmpq	%rsi, %rcx
	movsd	56(%rdx), %xmm3
	movsd	64(%rdx), %xmm1
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm1
	movsd	72(%rdx), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	mulsd	(%rdx), %xmm0
	mulsd	%xmm4, %xmm0
	addsd	%xmm0, %xmm2
	jne	.L354
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	cmpl	%eax, %ecx
	jl	.L388
	.p2align 4,,10
	.p2align 3
.L378:
	addl	$1, %ecx
	addq	$8, %r15
	cmpl	%eax, %ecx
	jge	.L353
.L388:
	movq	%r15, %r12
	movl	%ecx, %ebp
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L363:
	movapd	%xmm5, %xmm0
.L359:
	addsd	%xmm0, %xmm2
.L356:
	movl	40(%rbx), %eax
	testl	%eax, %eax
	je	.L366
	movq	(%rbx), %rax
	movq	(%rax,%r12), %r13
	movq	(%rax,%r15), %r14
	testq	%r13, %r13
	setne	%dl
	cmpq	%r14, %r13
	setne	%al
	testb	%al, %dl
	je	.L373
	testq	%r14, %r14
	je	.L373
	movl	48(%r13), %eax
	cmpl	%eax, 48(%r14)
	movsd	24(%r14), %xmm0
	movsd	32(%r14), %xmm4
	movsd	40(%r14), %xmm1
	movsd	24(%r13), %xmm8
	movsd	32(%r13), %xmm3
	movsd	40(%r13), %xmm7
	jne	.L370
	subsd	%xmm3, %xmm4
	movsd	48(%rbx), %xmm6
	subsd	%xmm8, %xmm0
	subsd	%xmm7, %xmm1
	movapd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm3
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm3
	addsd	%xmm1, %xmm3
	movapd	%xmm3, %xmm0
	sqrtsd	%xmm3, %xmm3
	ucomisd	%xmm3, %xmm3
	jp	.L414
.L371:
	ucomisd	%xmm5, %xmm3
	jp	.L392
	je	.L373
.L392:
	movsd	8(%r14), %xmm0
	movsd	.LC10(%rip), %xmm1
	addsd	8(%r13), %xmm0
	mulsd	%xmm0, %xmm1
	ucomisd	%xmm3, %xmm1
	ja	.L415
.L373:
	movapd	%xmm5, %xmm0
.L369:
	addsd	%xmm0, %xmm2
.L366:
	movl	8(%rbx), %eax
	addl	$1, %ebp
	addq	$8, %r12
	cmpl	%ebp, %eax
	jle	.L378
.L376:
	movl	44(%rbx), %edx
	testl	%edx, %edx
	je	.L356
	movq	(%rbx), %rax
	movq	(%rax,%r15), %r13
	movq	(%rax,%r12), %r14
	testq	%r13, %r13
	je	.L363
	testq	%r14, %r14
	je	.L363
	movl	48(%r14), %eax
	cmpl	%eax, 48(%r13)
	movsd	24(%r13), %xmm0
	movsd	32(%r13), %xmm4
	movsd	40(%r13), %xmm1
	movsd	24(%r14), %xmm7
	movsd	32(%r14), %xmm3
	movsd	40(%r14), %xmm6
	jne	.L370
	subsd	%xmm3, %xmm4
	subsd	%xmm7, %xmm0
	subsd	%xmm6, %xmm1
	movapd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm3
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm3
	addsd	%xmm1, %xmm3
	movapd	%xmm3, %xmm0
	sqrtsd	%xmm3, %xmm3
	ucomisd	%xmm3, %xmm3
	jp	.L416
.L361:
	ucomisd	%xmm5, %xmm3
	jp	.L390
	je	.L363
.L390:
	movsd	8(%r13), %xmm0
	addsd	8(%r14), %xmm0
	ucomisd	%xmm0, %xmm3
	jbe	.L363
	movsd	.LC44(%rip), %xmm0
	movsd	.LC6(%rip), %xmm1
	mulsd	16(%r13), %xmm0
	mulsd	0(%r13), %xmm1
	mulsd	16(%r14), %xmm0
	mulsd	(%r14), %xmm1
	subsd	%xmm1, %xmm0
	divsd	%xmm3, %xmm0
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L415:
	divsd	%xmm3, %xmm0
	movsd	%xmm5, 48(%rsp)
	movl	%ecx, 40(%rsp)
	movsd	%xmm6, 32(%rsp)
	movsd	%xmm2, 24(%rsp)
	movsd	.LC53(%rip), %xmm1
	movsd	%xmm0, 16(%rsp)
	call	pow
	movsd	16(%rsp), %xmm3
	movsd	%xmm0, 8(%rsp)
	movsd	.LC54(%rip), %xmm1
	movapd	%xmm3, %xmm0
	call	pow
	movsd	8(%rsp), %xmm4
	movl	40(%rsp), %ecx
	divsd	.LC54(%rip), %xmm0
	divsd	.LC55(%rip), %xmm4
	movsd	32(%rsp), %xmm6
	movsd	48(%rsp), %xmm5
	movsd	24(%rsp), %xmm2
	addsd	%xmm4, %xmm0
	mulsd	%xmm6, %xmm0
	jmp	.L369
.L387:
	pxor	%xmm5, %xmm5
	movapd	%xmm5, %xmm2
.L353:
	movl	24(%rbx), %esi
	testl	%esi, %esi
	jle	.L379
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	movapd	%xmm5, %xmm6
	movsd	.LC50(%rip), %xmm10
	movapd	%xmm5, %xmm9
	jmp	.L386
	.p2align 4,,10
	.p2align 3
.L389:
	movapd	%xmm6, %xmm1
.L381:
	addsd	%xmm1, %xmm2
.L380:
	addl	$1, %ebp
	addq	$8, %r12
	cmpl	%esi, %ebp
	jge	.L379
.L386:
	movq	16(%rbx), %rax
	movq	(%rax,%r12), %rax
	testq	%rax, %rax
	je	.L380
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	testq	%rdx, %rdx
	je	.L389
	testq	%rcx, %rcx
	je	.L389
	movl	48(%rcx), %edi
	cmpl	%edi, 48(%rdx)
	movsd	24(%rdx), %xmm0
	movsd	32(%rdx), %xmm4
	movsd	40(%rdx), %xmm1
	movsd	24(%rcx), %xmm12
	movsd	32(%rcx), %xmm3
	movsd	40(%rcx), %xmm11
	jne	.L370
	subsd	%xmm3, %xmm4
	movsd	16(%rax), %xmm8
	subsd	%xmm12, %xmm0
	movsd	24(%rax), %xmm7
	subsd	%xmm11, %xmm1
	movapd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm3
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm3
	addsd	%xmm3, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L417
.L382:
	ucomisd	%xmm5, %xmm0
	jp	.L384
	ucomisd	%xmm6, %xmm0
	movapd	%xmm9, %xmm1
	je	.L381
.L384:
	subsd	%xmm0, %xmm7
	mulsd	%xmm7, %xmm7
	mulsd	%xmm8, %xmm7
	mulsd	%xmm10, %xmm7
	movapd	%xmm7, %xmm1
	jmp	.L381
.L379:
	movsd	%xmm2, 56(%rbx)
	addq	$72, %rsp
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
.L414:
	.cfi_restore_state
	movsd	%xmm5, 32(%rsp)
	movl	%ecx, 24(%rsp)
	movsd	%xmm6, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	sqrt
	movsd	32(%rsp), %xmm5
	movapd	%xmm0, %xmm3
	movl	24(%rsp), %ecx
	movsd	16(%rsp), %xmm6
	movsd	8(%rsp), %xmm2
	jmp	.L371
.L416:
	movsd	%xmm5, 24(%rsp)
	movl	%ecx, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	sqrt
	movsd	24(%rsp), %xmm5
	movapd	%xmm0, %xmm3
	movl	16(%rsp), %ecx
	movsd	8(%rsp), %xmm2
	jmp	.L361
.L370:
	call	vector_sub.part.1
.L417:
	movapd	%xmm1, %xmm0
	movsd	%xmm9, 56(%rsp)
	movsd	%xmm10, 48(%rsp)
	movsd	%xmm6, 40(%rsp)
	movsd	%xmm5, 32(%rsp)
	movsd	%xmm7, 24(%rsp)
	movsd	%xmm8, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	sqrt
	movl	24(%rbx), %esi
	movsd	56(%rsp), %xmm9
	movsd	48(%rsp), %xmm10
	movsd	40(%rsp), %xmm6
	movsd	32(%rsp), %xmm5
	movsd	24(%rsp), %xmm7
	movsd	16(%rsp), %xmm8
	movsd	8(%rsp), %xmm2
	jmp	.L382
	.cfi_endproc
.LFE90:
	.size	calc_group_energy, .-calc_group_energy
	.section	.text.unlikely
.LCOLDE62:
	.text
.LHOTE62:
	.section	.text.unlikely
.LCOLDB63:
	.text
.LHOTB63:
	.p2align 4,,15
	.globl	make_timestep
	.type	make_timestep, @function
make_timestep:
.LFB91:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jle	.L424
	movq	(%rdi), %rdx
	subl	$1, %eax
	movsd	.LC35(%rip), %xmm7
	leaq	8(%rdx,%rax,8), %rcx
	.p2align 4,,10
	.p2align 3
.L423:
	movq	(%rdx), %rax
	testq	%rax, %rax
	je	.L420
	movapd	%xmm7, %xmm1
	movsd	88(%rax), %xmm5
	movsd	96(%rax), %xmm3
	cmpl	$2, 80(%rax)
	divsd	(%rax), %xmm1
	movl	$3, 144(%rax)
	movsd	56(%rax), %xmm6
	movsd	64(%rax), %xmm4
	movsd	72(%rax), %xmm2
	mulsd	%xmm1, %xmm5
	mulsd	%xmm1, %xmm3
	mulsd	104(%rax), %xmm1
	movsd	%xmm5, 120(%rax)
	mulsd	%xmm0, %xmm5
	movsd	%xmm3, 128(%rax)
	mulsd	%xmm0, %xmm3
	movsd	%xmm1, 136(%rax)
	mulsd	%xmm0, %xmm1
	jne	.L422
	addsd	%xmm6, %xmm5
	cmpl	$1, 48(%rax)
	addsd	%xmm4, %xmm3
	movsd	24(%rax), %xmm6
	addsd	%xmm2, %xmm1
	movsd	32(%rax), %xmm4
	movsd	40(%rax), %xmm2
	movsd	%xmm5, 56(%rax)
	mulsd	%xmm0, %xmm5
	movsd	%xmm3, 64(%rax)
	mulsd	%xmm0, %xmm3
	movsd	%xmm1, 72(%rax)
	mulsd	%xmm0, %xmm1
	jne	.L422
	addsd	%xmm6, %xmm5
	addsd	%xmm4, %xmm3
	addsd	%xmm2, %xmm1
	movsd	%xmm5, 24(%rax)
	movsd	%xmm3, 32(%rax)
	movsd	%xmm1, 40(%rax)
.L420:
	addq	$8, %rdx
	cmpq	%rdx, %rcx
	jne	.L423
.L424:
	addsd	32(%rdi), %xmm0
	movsd	%xmm0, 32(%rdi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L422:
	.cfi_restore_state
	call	vector_add.part.0
	.cfi_endproc
.LFE91:
	.size	make_timestep, .-make_timestep
	.section	.text.unlikely
.LCOLDE63:
	.text
.LHOTE63:
	.section	.rodata.str1.1
.LC71:
	.string	"%f %f\n"
	.section	.text.unlikely
.LCOLDB72:
	.section	.text.startup,"ax",@progbits
.LHOTB72:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB92:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$301, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$8, %r12d
	movl	$1, %ebp
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	call	make_new_universe
	movsd	.LC64(%rip), %xmm7
	movl	$0, 44(%rax)
	movl	$1, 40(%rax)
	movq	%rax, %r13
	movsd	%xmm7, 48(%rax)
	call	clock
	movl	%eax, %edi
	call	srand
	movq	0(%r13), %r14
	.p2align 4,,10
	.p2align 3
.L432:
	movl	$168, %esi
	movl	$1, %edi
	call	calloc
	pxor	%xmm0, %xmm0
	movq	%rax, (%r14,%r12)
	movq	0(%r13), %r14
	movsd	.LC65(%rip), %xmm7
	movsd	.LC35(%rip), %xmm6
	leaq	32(%rsp), %rsi
	cvtsi2sd	%ebp, %xmm0
	leaq	40(%rsp), %rdi
	leaq	(%r14,%r12), %r15
	addl	$1, %ebp
	addq	$8, %r12
	movq	(%r15), %rbx
	movsd	%xmm7, 8(%rbx)
	movq	$0, 16(%rbx)
	movsd	%xmm6, (%rbx)
	mulsd	.LC66(%rip), %xmm0
	divsd	.LC67(%rip), %xmm0
	call	sincos
	movsd	40(%rsp), %xmm0
	cmpl	$301, %ebp
	movsd	.LC68(%rip), %xmm1
	mulsd	.LC68(%rip), %xmm0
	mulsd	32(%rsp), %xmm1
	movq	$0, 40(%rbx)
	movl	$1, 48(%rbx)
	movsd	%xmm0, 32(%rbx)
	movsd	%xmm1, 24(%rbx)
	movq	(%r15), %rax
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movl	$2, 80(%rax)
	jne	.L432
	movl	$168, %esi
	movl	$1, %edi
	call	calloc
	movq	%rax, (%r14)
	movq	0(%r13), %rdx
	movq	%r13, %rdi
	movsd	.LC69(%rip), %xmm7
	movq	(%rdx), %rax
	movsd	%xmm7, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movsd	.LC7(%rip), %xmm7
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movsd	%xmm7, (%rax)
	movl	$1, 48(%rax)
	movq	(%rdx), %rax
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movl	$2, 80(%rax)
	call	calc_group_energy
	pxor	%xmm7, %xmm7
	movsd	.LC70(%rip), %xmm5
	movsd	.LC35(%rip), %xmm6
	movsd	%xmm7, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L441:
	movsd	%xmm6, 16(%rsp)
	movsd	%xmm5, 8(%rsp)
	call	clock
	pxor	%xmm7, %xmm7
	movq	%r13, %rdi
	cvtsi2sdq	%rax, %xmm7
	divsd	.LC57(%rip), %xmm7
	movsd	%xmm7, (%rsp)
	call	calc_group_interactions
	movl	8(%r13), %eax
	movsd	(%rsp), %xmm7
	movsd	8(%rsp), %xmm5
	testl	%eax, %eax
	movsd	16(%rsp), %xmm6
	jle	.L440
	movq	0(%r13), %rdx
	subl	$1, %eax
	leaq	8(%rdx,%rax,8), %rcx
	.p2align 4,,10
	.p2align 3
.L439:
	movq	(%rdx), %rax
	testq	%rax, %rax
	je	.L436
	movapd	%xmm6, %xmm0
	movsd	88(%rax), %xmm4
	movsd	96(%rax), %xmm2
	cmpl	$2, 80(%rax)
	divsd	(%rax), %xmm0
	movl	$3, 144(%rax)
	movsd	56(%rax), %xmm8
	movsd	64(%rax), %xmm3
	movsd	72(%rax), %xmm1
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm2
	mulsd	104(%rax), %xmm0
	movsd	%xmm4, 120(%rax)
	mulsd	%xmm5, %xmm4
	movsd	%xmm2, 128(%rax)
	mulsd	%xmm5, %xmm2
	movsd	%xmm0, 136(%rax)
	mulsd	%xmm5, %xmm0
	jne	.L438
	addsd	%xmm8, %xmm4
	cmpl	$1, 48(%rax)
	addsd	%xmm3, %xmm2
	movsd	24(%rax), %xmm8
	addsd	%xmm1, %xmm0
	movsd	32(%rax), %xmm3
	movsd	40(%rax), %xmm1
	movsd	%xmm4, 56(%rax)
	mulsd	%xmm5, %xmm4
	movsd	%xmm2, 64(%rax)
	mulsd	%xmm5, %xmm2
	movsd	%xmm0, 72(%rax)
	mulsd	%xmm5, %xmm0
	jne	.L438
	addsd	%xmm8, %xmm4
	addsd	%xmm3, %xmm2
	addsd	%xmm1, %xmm0
	movsd	%xmm4, 24(%rax)
	movsd	%xmm2, 32(%rax)
	movsd	%xmm0, 40(%rax)
.L436:
	addq	$8, %rdx
	cmpq	%rdx, %rcx
	jne	.L439
.L440:
	movapd	%xmm7, %xmm0
	movsd	32(%r13), %xmm1
	subsd	24(%rsp), %xmm0
	addsd	%xmm5, %xmm1
	movsd	%xmm1, 32(%r13)
	ucomisd	%xmm6, %xmm0
	jbe	.L435
	movapd	%xmm7, %xmm0
	movl	$.LC71, %esi
	movl	$1, %edi
	movl	$2, %eax
	movsd	%xmm6, 16(%rsp)
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm7, (%rsp)
	call	__printf_chk
	movsd	(%rsp), %xmm7
	movsd	16(%rsp), %xmm6
	movsd	%xmm7, 24(%rsp)
	movsd	8(%rsp), %xmm5
.L435:
	movsd	.LC67(%rip), %xmm3
	ucomisd	%xmm7, %xmm3
	jnb	.L441
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L438:
	.cfi_restore_state
	call	vector_add.part.0
	.cfi_endproc
.LFE92:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE72:
	.section	.text.startup
.LHOTE72:
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.4663, @object
	.size	__PRETTY_FUNCTION__.4663, 19
__PRETTY_FUNCTION__.4663:
	.string	"point_str_printout"
	.align 8
	.type	__PRETTY_FUNCTION__.4613, @object
	.size	__PRETTY_FUNCTION__.4613, 11
__PRETTY_FUNCTION__.4613:
	.string	"vector_sub"
	.align 8
	.type	__PRETTY_FUNCTION__.4607, @object
	.size	__PRETTY_FUNCTION__.4607, 11
__PRETTY_FUNCTION__.4607:
	.string	"vector_add"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	0
	.align 8
.LC5:
	.long	3489660928
	.long	1107346312
	.align 8
.LC6:
	.long	1634589169
	.long	1037194648
	.align 8
.LC7:
	.long	0
	.long	1074266112
	.align 8
.LC10:
	.long	0
	.long	1074790400
	.align 8
.LC11:
	.long	0
	.long	1075838976
	.align 8
.LC12:
	.long	0
	.long	1076625408
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC17:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC35:
	.long	0
	.long	1072693248
	.align 8
.LC44:
	.long	3489660928
	.long	-1040137336
	.align 8
.LC50:
	.long	0
	.long	1071644672
	.align 8
.LC53:
	.long	0
	.long	1075314688
	.align 8
.LC54:
	.long	0
	.long	1076363264
	.align 8
.LC55:
	.long	0
	.long	-1072168960
	.align 8
.LC57:
	.long	0
	.long	1093567616
	.align 8
.LC64:
	.long	0
	.long	1076101120
	.align 8
.LC65:
	.long	2576980378
	.long	1070176665
	.align 8
.LC66:
	.long	1374389535
	.long	1075388088
	.align 8
.LC67:
	.long	0
	.long	1081262080
	.align 8
.LC68:
	.long	1094259183
	.long	1077091256
	.align 8
.LC69:
	.long	1094259183
	.long	1076042680
	.align 8
.LC70:
	.long	3539053052
	.long	1062232653
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
