#include once "fltk-c.bi"

' test of:
' Fl_Pack http://www.fltk.org/doc-1.3/classFl__Pack.html

function CreateMainWindow as FL_WINDOW ptr
  dim as integer w=300
  dim as integer h=300
  ' create flicker free double window
  dim as FL_Window ptr win = Fl_Double_WindowNew(w,h,"resize me horizontal")
  Fl_WindowBegin win
    w=Fl_WidgetGetW(win)
    h=Fl_WidgetGetH(win)

    var packH =  Fl_PackNew(0,0,w,h\3)
    Fl_WidgetSetType packH,FL_PACK_HORIZONTAL
    Fl_GroupBegin(packH)
      Fl_Round_ClockNew(0,0,w\3,h\3)
      Fl_Round_ClockNew(0,0,w\3,h\3)
      Fl_Round_ClockNew(0,0,w\3,h\3)
    Fl_GroupEnd packH
#if 1
    var packV =  Fl_PackNew(0,h\2,w\2,h\3)
    Fl_WidgetSetType packV,FL_PACK_VERTICAL
    Fl_GroupBegin(packV)
      Fl_Round_ClockNew(0,0,w\6,h\6)
      Fl_Round_ClockNew(0,0,w\6,h\6)
      Fl_Round_ClockNew(0,0,w\6,h\6)
      Fl_Round_ClockNew(0,0,w\6,h\6)
    Fl_GroupEnd packV
#endif
    

  Fl_WindowEnd win
  Fl_GroupSetResizable win,win
  'Fl_WindowSizeRange win,160,Fl_WidgetGetH(win)
  return win
end function

'
' main
'
Fl_WindowShow CreateMainWindow()
Fl_Run
