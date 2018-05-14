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

extern	_objc_getClass
extern	_sel_registerName
extern	_objc_msgSend

global _xasm_utf8_to_nss

section .text

s1:	db "NSString", 0
s2:	db "stringWithUTF8String:", 0

_xasm_utf8_to_nss:
	enter 0, 0

	mov rbx, rdi
	mov rdi, s1
	call _objc_getClass
	mov r15, rax
	mov rdi, s2
	call _sel_registerName
	mov rdi, r15
	mov rsi, rax
	mov rdx, rbx
	call _objc_msgSend

	leave
	ret
