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
extern	_objc_msgSend_stret
extern	_objc_msgSend

global _xasm_winresize

section .text

s1:	db "frame", 0
s2:	db "setFrame:display:animate:", 0

_xasm_winresize:
	enter 32, 0

	;; win
	mov rbx, rdi

	;; view
	mov r15, rsi

	mov rdi, s1
	call _sel_registerName
	mov r14, rax

	;; CGRect pointer
	lea rdi, [rbp - 32]
	mov rsi, r15
	mov rdx, r14
	call _objc_msgSend_stret

	mov rdi, s2
	call _sel_registerName

	;; be sure to save returned selector (rax), before
	;; using stack frame pointer (rbp)
	mov r13, rax

	movq xmm0, qword[rbp - 32]
	movq xmm1, qword[rbp - 24]
	movq xmm2, qword[rbp - 16]
	movq xmm3, qword[rbp - 8]

	mov rdi, rbx
	mov rsi, r13
	mov rdx, 1
	mov rcx, 0
	call _objc_msgSend

	leave
	ret
