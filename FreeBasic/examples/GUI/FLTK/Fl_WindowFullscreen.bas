#include once "fltk-c.bi"

'Test of:
' Fl_WindowFullscreen()    http://www.fltk.org/doc-1.3/classFl__Window.html#ac3f59c5dfbf15d4ae5485c5a8c73b0c3
' Fl_WindowFullscreenOff() http://www.fltk.org/doc-1.3/classFl__Window.html#ac75ca514e368f4b43ae1ce7e3ea3c655
' Fl_AddTimeout()          http://www.fltk.org/doc-1.3/classFl.html#a23e63eb7cec3a27fa360e66c6e2b2e52
' Fl_RepeatTimeout ()      http://www.fltk.org/doc-1.3/classFl.html#ae5373d1d50c2b0ba38280d78bb6d2628

sub TimeoutHandler cdecl (byval self as any ptr)
  if Fl_WindowFullscreenActive(self) then
    Fl_WindowFullscreenOff self
  else
    Fl_WindowFullscreen self
  end if
  Fl_RepeatTimeout 3.0, @TimeoutHandler, self
end sub

dim as Fl_Window ptr win = Fl_WindowNew(640,480, "[ESC] quit ...")

Fl_BoxNew(20,40,300,100,"Toggle fullscreen every 3 seconds !")
Fl_AddTimeout 3.0, @TimeoutHandler, win
Fl_WindowShow win
Fl_Run