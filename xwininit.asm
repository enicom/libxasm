;; Copyright (c) 2017, Nicolas Chevalier <nicolas.chevalier@enicom.org>
;;
;; Permission to use, copy, modify, and distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.
;;
;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

extern	_sel_registerName
extern	_objc_msgSend
extern  _objc_allocateClassPair
extern	_objc_getClass
extern	_class_addMethod

global _xwininit

section .bss
	arg1:	resq 1
	arg2:	resq 1

section .data
	x:	dq 0.0
	y:	dq 0.0

section .text
	s4:	db "initWithContentRect:styleMask:backing:defer:", 0

_xwininit:
	enter 32, 0

	mov r14, rdi
	movq [rel arg1], xmm0
	movq [rel arg2], xmm1

	mov rdi, s4
	call _sel_registerName

	mov r15, rax
	movq xmm0, qword[rel x]
	movq xmm1, qword[rel y]
	movq xmm2, qword[rel arg1]
	movq xmm3, qword[rel arg2]

	movq [rbp - 32], xmm0
	movq [rbp - 24], xmm1
	movq [rbp - 16], xmm2
	movq [rbp - 8], xmm3

	mov rdi, r14
	mov rsi, r15
	mov rdx, 0xf 		; xxx: mask
	mov rcx, 2
	xor r8, r8
	call _objc_msgSend

	leave
	ret
