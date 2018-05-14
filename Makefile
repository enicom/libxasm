# Copyright (c) 2017, Nicolas Chevalier <nicolas.chevalier@enicom.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

LIBASM = libxasm.a

SRC =	memset.asm \
	putchar.asm \
	app.asm \
	loop.asm \
	wincreate.asm \
	winfront.asm \
	wininit.asm \
	wintitle.asm \
	setview.asm \
	auview_generic.asm \
	utf8_to_nss.asm

FLAGS = -f macho64

NASM = nasm $(FLAGS)

OBJS = $(SRC:.asm=.o)

all : $(LIBASM)

$(LIBASM): $(OBJS)
	ar rcs $(LIBASM) $(OBJS)
	ranlib $(LIBASM)

%.o: %.asm
	$(NASM) -o $@ $^

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(LIBASM)

re: fclean all
test: $(LIBASM)
	 gcc -Wl,-no_pie -framework Foundation -framework Cocoa -o test main.c $(LIBASM)

.PHONY: all clean fclean re
