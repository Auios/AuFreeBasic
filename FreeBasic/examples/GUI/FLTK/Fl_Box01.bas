#include once "fltk-c.bi"

'test of:
' Fl_BoxNew()

var Win = Fl_WindowNew(320,200)
Fl_BoxNew(10,10,300,180,"Hello, World!")
Fl_WindowShow Win
Fl_Run
