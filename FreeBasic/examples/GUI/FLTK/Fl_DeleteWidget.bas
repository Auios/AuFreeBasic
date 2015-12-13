#include once "fltk-c.bi"

' test of:
' Fl_DeleteWidget
' Fl_WidgetDeactivate
' Fl_WidgetWindow
' Fl_WidgetRedraw

sub ButtonCB cdecl (byval btn as FL_WIDGET ptr,byval box as any ptr)
  Fl_DeleteWidget box                  ' set box on deletion list
  Fl_WidgetDeactivate btn              ' disable delete button
  Fl_DoWidgetDeletion                  ' do widget deletion
  Fl_WidgetRedraw Fl_WidgetWindow(btn) ' redraw parent window
end sub
'
' main
'
var win = Fl_WindowNew(320,200)
var box = Fl_BoxNew(10,10,300,32,"i'm a box")
var btn = Fl_ButtonNew(10,64,128,24,"delete box")
Fl_WidgetSetCallbackArg btn,@ButtonCB,box
Fl_WindowShow win
Fl_Run
