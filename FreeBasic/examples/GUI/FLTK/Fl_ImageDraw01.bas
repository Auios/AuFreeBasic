#include once "fltk-c.bi"

sub ButtonCB cdecl(button as Fl_Widget ptr,img as any ptr)
  ' get the parent of the box (the window)
  var parent = Fl_WidgetWindow(button)
  ' make the window the current target for all kinds of drawing
  Fl_WindowMakeCurrent(parent)
  ' do it like a boss :-)
  Fl_ImageDraw2 img, 0, 0,64,64, 0, 0
  Fl_ImageDraw2 img,84, 0,64,64,64, 0
  Fl_ImageDraw2 img, 0,84,64,64, 0,64
  Fl_ImageDraw2 img,84,84,64,64,64,64
end sub

'
' main
'
chdir exepath()

Fl_Register_Images()

var img = Fl_JPG_ImageNew("media/renata.jpg")
var win = Fl_Double_WindowNew(148,148+32)
var box = Fl_BoxNew(0,0,148,148)
var btn = Fl_ButtonNew(20,156,108,24,"Draw")
Fl_WidgetSetCallbackArg btn,@ButtonCB,img

Fl_WindowShow win
Fl_Run




