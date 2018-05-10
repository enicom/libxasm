#include "xlib.h"

int main()
{
    void *myapp;
    void *win;
    void *new_id;

    myapp = xapp();
    new_id = xwincreate();
    win = xwininit(new_id, 400.0, 400.0);    
    xwintitle(win, "My window");
    xwinfront(win);
    xloop(myapp);

    return 0;
}
