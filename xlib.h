
#ifndef XLIB_H
# define XLIB_H
# include <ctype.h>

void *xmemset(void *b, int c, size_t n);
void *xapp();
void xloop(void *app);
void *xwin();
void *xwincreate();
void xwinfront(void *win);
void *xwininit(void *win, double w, double h);
void *xwinselrect();
void xwintitle(void *win, char *title);

#endif
