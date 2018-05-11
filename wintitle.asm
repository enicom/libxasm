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
extern  _objc_getClass
extern	_objc_msgSend

global _xasm_wintitle

section .text

s1:	db "NSString", 0
s2:	db "alloc", 0
s3:	db "initWithCString:", 0
s4:	db "setTitle:", 0

_xasm_wintitle:
	enter 0, 0

	mov r13, rdi
	mov r15, rsi
	mov rdi, s2
	call _sel_registerName

	mov rbx, rax
	mov rdi, s1
	call _objc_getClass

	mov rdi, rax
	mov rsi, rbx
	call _objc_msgSend
	
	mov rdi, s3
	mov r14, rax
	call _sel_registerName

	mov rdi, r14
	mov rsi, rax
	mov rdx, r15
	call _objc_msgSend

	mov r12, rax
	mov rdi, s4
	call _sel_registerName

	mov rdi, r13
	mov rsi, rax
	mov rdx, r12
	call _objc_msgSend

	leave
	ret
