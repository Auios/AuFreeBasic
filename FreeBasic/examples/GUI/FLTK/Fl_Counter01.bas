#include once "fltk-c.bi"

var win = Fl_WindowNew(640,480,"Fl_Counter01.bas")
var cnt = Fl_CounterNew(10,10,128,24,"a counter")
Fl_WindowShow win
Fl_Run

