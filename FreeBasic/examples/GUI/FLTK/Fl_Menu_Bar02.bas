#include once "fltk-c.bi"
#include once "crt/string.bi"


function strDup(byval s as zstring ptr) as zstring ptr
  dim as integer nChars = len(*s)
  dim as zstring ptr p = allocate(nChars+1)
  if nChars>0 then memcpy(p, s, nChars)
  p[nChars]=0
  return p
end function

'test of:
' Fl_Menu_Bar  http://www.fltk.org/doc-1.3/classFl__Menu__Bar.html
' Fl_Menu_Add
' flChoice

sub QuitCB cdecl (byval self as Fl_Widget ptr,byval userdata as any ptr)
  if flChoice("Do you really want to exit ?","no","yes") then
    Fl_WindowHide Fl_WidgetWindow(self)
  end if
end sub

sub WindowCB cdecl (byval self as Fl_Widget ptr,byval userdata as any ptr)
  print "window callback called"
  Fl_WindowHide cptr(FL_WINDOW ptr,self)
end sub

sub TestCB cdecl (byval self as Fl_Widget ptr,byval userdata as any ptr)
  dim as Fl_Menu_     ptr mnu = cptr(Fl_Menu_ ptr,self)
  dim as Fl_Menu_Item ptr mi  = cptr(any ptr,Fl_Menu_MValue(mnu))
  if (mi=0) then
    print ("NULL")
  elseif Fl_Menu_ItemGetShortcut(mi) then
    print *Fl_Menu_ItemGetLabel(mi), *Fl_GetShortcutLabel(Fl_Menu_ItemGetShortcut(mi))
  else
    print *Fl_Menu_ItemGetLabel(mi)
  end if
end sub

dim as Fl_Menu_Item hugemenu(99)

dim as Fl_Menu_Item menutable(...) => _
 {(@"foo",0,0,0,FL_MENU_INACTIVE), _
  (@"&File",0,0,0,FL_SUBMENU), _
  (@"&Open",FL_ALT + asc("o"),0,0,FL_MENU_INACTIVE), _
  (@"&Close",0,0), _
  (@"&Quit",FL_ALT + asc("q"),@quitcb,0,FL_MENU_DIVIDER), _
  (@"shortcut",asc("a")), _
  (@"shortcut",FL_SHIFT+asc("a")), _
  (@"shortcut",FL_CTRL+asc("a")), _
  (@"shortcut",FL_CTRL+FL_SHIFT+asc("a")), _
  (@"shortcut",FL_ALT+asc("a")), _
  (@"shortcut",FL_ALT+FL_SHIFT+asc("a")), _
  (@"shortcut",FL_ALT+FL_CTRL+asc("a")), _
  (@"shortcut",FL_ALT+FL_SHIFT+FL_CTRL+asc("a"),0,0,FL_MENU_DIVIDER), _
  (@"shortcut",asc(!"\r")), _ ' FL_ENTER
  (@"shortcut",FL_CTRL+FL_Enter_Key,0,0,FL_MENU_DIVIDER), _
  (@"shortcut",FL_F+1), _
  (@"shortcut",FL_SHIFT+FL_F+1), _
  (@"shortcut",FL_CTRL+FL_F+1), _
  (@"shortcut",FL_SHIFT+FL_CTRL+FL_F+1), _
  (@"shortcut",FL_ALT+FL_F+1), _
  (@"shortcut",FL_ALT+FL_SHIFT+FL_F+1), _
  (@"shortcut",FL_ALT+FL_CTRL+FL_F+1), _
  (@"shortcut",FL_ALT+FL_SHIFT+FL_CTRL+FL_F+1,0,0,FL_MENU_DIVIDER), _
  (@"&Submenus", FL_ALT+asc("S"),0,@"Submenu1",FL_SUBMENU), _
  (@"A very long menu item"), _
  (@"&submenu",FL_CTRL+asc("S"),0,@"submenu2",FL_SUBMENU), _
  (@"item 1"), _
  (@"item 2"), _
  (@"item 3"), _
  (@"item 4"), _
  (0), _
  (@"after submenu"), _
  (0), _
  (0), _
  (@"&Edit",FL_F+2,0,0,FL_SUBMENU), _
    (@"Undo",FL_ALT+asc("z"),0), _
    (@"Redo",FL_ALT+asc("r"),0, 0, FL_MENU_DIVIDER), _
    (@"Cut",FL_ALT+asc("x"),0), _
    (@"Copy",FL_ALT+asc("c"),0), _
    (@"Paste",FL_ALT+asc("v"),0), _
    (@"Inactive",FL_ALT+asc("d"),0, 0, FL_MENU_INACTIVE), _
    (@"Clear",0,0,0,FL_MENU_DIVIDER), _
    (@"Invisible",FL_ALT+asc("e"),0,0,FL_MENU_INVISIBLE), _
    (@"Preferences",0,0), _
    (@"Size",0,0), _
    (0), _
  (@"&Checkbox" ,FL_F+3,0,0,FL_SUBMENU), _
    (@"&Alpha"  ,FL_F+2,0, cast(any ptr,1), FL_MENU_TOGGLE), _
    (@"&Beta"   ,0     ,0, cast(any ptr,2), FL_MENU_TOGGLE), _
    (@"&Gamma"  ,0     ,0, cast(any ptr,3), FL_MENU_TOGGLE), _
    (@"&Delta"  ,0     ,0, cast(any ptr,4), FL_MENU_TOGGLE or FL_MENU_VALUE ), _
    (@"&Epsilon",0     ,0, cast(any ptr,5), FL_MENU_TOGGLE), _
    (@"&Pi"     ,0     ,0, cast(any ptr,6), FL_MENU_TOGGLE), _
    (@"&Mu"     ,0     ,0, cast(any ptr,7), FL_MENU_TOGGLE or FL_MENU_DIVIDER), _
    (@"Red"     ,0     ,0, cast(any ptr,1), FL_MENU_TOGGLE, 0, 0, 0, 1), _
    (@"Black"   ,0     ,0, cast(any ptr,1), FL_MENU_TOGGLE or FL_MENU_DIVIDER), _
    (@"00"      ,0     ,0, cast(any ptr,1), FL_MENU_TOGGLE), _
    (@"000"     ,0     ,0, cast(any ptr,1), FL_MENU_TOGGLE), _
    (0), _
  (@"&Radio",0,0,0,FL_SUBMENU), _
    (@"&Alpha"  ,0     ,0, cast(any ptr,1), FL_MENU_RADIO), _
    (@"&Beta"   ,0     ,0, cast(any ptr,2), FL_MENU_RADIO), _
    (@"&Gamma"  ,0     ,0, cast(any ptr,3), FL_MENU_RADIO), _
    (@"&Delta"  ,0     ,0, cast(any ptr,4), FL_MENU_RADIO or FL_MENU_VALUE), _
    (@"&Epsilon",0     ,0, cast(any ptr,5), FL_MENU_RADIO), _
    (@"&Pi"     ,0     ,0, cast(any ptr,6), FL_MENU_RADIO), _
    (@"&Mu"     ,0     ,0, cast(any ptr,7), FL_MENU_RADIO or FL_MENU_DIVIDER), _
    (@"Red"     ,0     ,0, cast(any ptr,1), FL_MENU_RADIO), _
    (@"Black"   ,0     ,0, cast(any ptr,1), FL_MENU_RADIO or FL_MENU_DIVIDER), _
    (@"00"      ,0     ,0, cast(any ptr,1), FL_MENU_RADIO), _
    (@"000"     ,0     ,0, cast(any ptr,1), FL_MENU_RADIO), _
    (0), _
  (@"&Font",0,0,0,FL_SUBMENU), _
    (@"Normal"    ,0,0,0,0,0,0                ,14), _
    (@"Bold"      ,0,0,0,0,0,FL_BOLD          ,14), _
    (@"Italic"    ,0,0,0,0,0,FL_ITALIC        ,14), _
    (@"BoldItalic",0,0,0,0,0,FL_BOLD+FL_ITALIC,14), _
    (@"Small"     ,0,0,0,0,0,FL_BOLD+FL_ITALIC,10), _
    (@"Emboss"    ,0,0,0,0,FL_LABEL_EMBOSSED), _
    (@"Engrave"   ,0,0,0,0,FL_LABEL_ENGRAVED), _
    (@"Shadow"    ,0,0,0,0,FL_LABEL_SHADOW), _
    (@"@->"       ,0,0,0,0,FL_LABEL_SYMBOL), _
    (0), _
  (@"&International",0,0,0,FL_SUBMENU), _
    (@"Sharp Ess",&H0000df), _
    (@"A Umlaut",&H0000c4), _
    (@"a Umlaut",&H0000e4), _
    (@"Euro currency",FL_COMMAND+&H0020ac), _
    (@!"the &\xc3\xbc Umlaut"), _  ' &uuml;
    (@!"the capital &\xc3\x9c"), _ ' &Uuml;
    (@!"convert \xc2\xa5 to &\xc2\xa3"), _ ' Yen to GBP
    (@!"convert \xc2\xa5 to &\xe2\x82\xac"), _ ' Yen to Euro
    (0), _
  (@"E&mpty",0,0,0,FL_SUBMENU), _
    (0), _
  (@"&Inactive",0,0,0,FL_MENU_INACTIVE or FL_SUBMENU), _
    (@"A very long menu item"), _
    (@"A very long menu item"), _
    (0), _
  (@"Invisible",0,0,0,FL_MENU_INVISIBLE or FL_SUBMENU), _
    (@"A very long menu item"), _
    (@"A very long menu item"), _
    (0), _
  (@"&Huge",0,0, @hugemenu(0),FL_SUBMENU_POINTER), _
  (@"button",FL_F+4,0,0,FL_MENU_TOGGLE), _
  (0)}

dim as Fl_Menu_Item pulldown(...) => _
 {(@"Red"    ,FL_ALT+asc("r")), _
  (@"Green"  ,FL_ALT+asc("g")), _
  (@"Blue"   ,FL_ALT+asc("b")), _
  (@"Strange",FL_ALT+asc("s"),0,0,FL_MENU_INACTIVE), _
  (@"&Charm" ,FL_ALT+asc("c")), _
  (@"Truth"  ,FL_ALT+asc("t")), _
  (@"Beauty" ,FL_ALT+asc("b")), _
  (0)}


#define WIN_WIDTH 700
dim as Fl_Menu_ ptr menus(3)
dim as zstring ptr buf = callocate(32)
for i as long=0 to 98
  sprintf(buf,"item %d",i)
  hugemenu(i).text = strDup(buf)
next

dim as Fl_DOUBLE_WINDOW ptr win = Fl_Double_WindowNew(WIN_WIDTH,400)
Fl_WidgetSetCallback win,@WindowCB

dim as FL_MENU_BAR ptr menuBar = Fl_Menu_BarNew(0,0,WIN_WIDTH,30)
Fl_Menu_SetMenu(menuBar,@menutable(0))
Fl_WidgetSetCallback menuBar,@TestCB
menus(0) = menubar

dim as FL_MENU_BUTTON ptr mb1 = Fl_Menu_ButtonNew(100,100,120,25,"&menubutton")
Fl_Menu_SetMenu mb1,@pulldown(0)
Fl_WidgetSetTooltip mb1,"this is a menu button"
Fl_WidgetSetCallback mb1,@TestCB
menus(1) = mb1

dim as FL_CHOICE ptr ch = Fl_ChoiceNew(300,100,80,25,"&choice:")
Fl_Menu_SetMenu ch,@pulldown(0)
Fl_WidgetSetTooltip ch,"this is a choice menu"
Fl_WidgetSetCallback ch,@TestCB
menus(2) = ch

dim as FL_MENU_BUTTON ptr mb = Fl_Menu_ButtonNew(0,0,WIN_WIDTH,400,"&popup")
Fl_WidgetSetType mb,POPUP3
Fl_WidgetSetBox mb,FL_NO_BOX
Fl_Menu_SetMenu mb,@menutable(0)
Fl_Menu_Remove mb,1 ' delete the "File" submenu
Fl_WidgetSetCallback mb,@TestCB
menus(3) = mb
  
dim as FL_BOX ptr b = Fl_BoxNew(200,200,200,100,!"Press right button\nfor a pop-up menu")
Fl_GroupSetResizable(win,mb)
Fl_WindowSizeRange win,300,400,0,400
Fl_WindowEnd win
Fl_WindowShow win
Fl_Run


