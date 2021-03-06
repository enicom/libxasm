/*
 * Copyright (c) 2017, Nicolas Chevalier <nicolas.chevalier@enicom.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifndef LIBXASM_H
# define LIBXASM_H

#include <ctype.h>

void *xasm_memset(void *b, int c, size_t n);
void *xasm_app();
void *xasm_win();
void *xasm_wincreate();
void *xasm_wininit(void *win, double w, double h);
void *xasm_winselrect();
void *xasm_auview_generic(void *au);
void *xasm_auview_custom(void *obj, void *au);
void *xasm_utf8_to_nss(char *str);
void *xasm_bundle_create(char *path);
void *xasm_bundle_getclass(void *bundle, char *name);
void *xasm_obj_alloc(void *obj);
void xasm_loop(void *app);
void xasm_winfront(void *win);
void xasm_wintitle(void *win, char *title);
void xasm_winresize(void *win, void *view);
void xasm_setview(void *win, void *view);

#endif
