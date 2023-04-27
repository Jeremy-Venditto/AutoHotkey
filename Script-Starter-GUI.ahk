					; ####################
					; AHK Script Generator
					; ####################

#Requires AutoHotkey v1.1.35 
;#Warn
#SingleInstance Force

/*

This Gui script will generate a starting template for AHK scripts
If a filename is given, it will save to the desktop
If a filename is not given, it will still generate the script in notepad

Features:

Run a program
Move / Resize / Maximize a window
Automatic clicks
Play a soundfile
Set hotkeys
Remap keyboard keys
Enter additional text at the end of the script

*/

Gui, +AlwaysOnTop +OwnDialogs -MinimizeBox

;#######################################
;                Above Tabs
;#######################################

Gui, Tab
Gui, Font, s14 , Arial
Gui, Add, Text, c39ACFA x85 y15, Script Generator
Gui, Font, s11 , Arial

;#######################################
;                Tabs Start
;#######################################

Gui, Add, Tab2, Center w275 x15 y50 h310 AltSubmit gTabEvent vTabVariable,Hotkeys|Clicks|Sounds|Programs|Other

;#######################################
;                Set Variables
;#######################################

click1edit = off
click2edit = off
click3edit = off
programedit = off

;#######################################
;                Tab 1 Hotkeys
;#######################################

Gui, Tab, 1
Gui, Add, Checkbox, vhotkeyyesno ghotkeytoggle cF4D40C x30 y110, Hotkey?
Gui, Add, Text, cF4D40C x110 y110 w125 h50 , Enter Hotkey:
Gui, Add, Edit, vhotkey x205 y105 w50 Center, F12
GuiControl, Disable, hotkey
Gui, Add, Button, vallkeys gallkeys x260 y105 w20 h25, *
GuiControl, Disable, allkeys
Gui, Add, Checkbox, vcontrol c45CDCB x30 y135  , Control
GuiControl, Disable, control
Gui, Add, Radio, veither1 cFF93A0 x110 y135 Checked, Either
GuiControl, Disable, either1
Gui, Add, Radio, vcontrolleftonly cFF93A0 x175 y135, Left
GuiControl, Disable, controlleftonly
Gui, Add, Radio, vcontrolrightonly cFF93A0 x225 y135, Right 
GuiControl, Disable, controlrightonly
Gui, Add, Checkbox, vshift c45CDCB x30 y155, Shift
GuiControl, Disable, shift
Gui, Add, Radio, veither2 cFF93A0 x110 y155 Checked, Either
GuiControl, Disable, either2
Gui, Add, Radio, vshiftleftonly cFF93A0 x175 y155, Left
GuiControl, Disable, shiftleftonly
Gui, Add, Radio, vshiftrightonly cFF93A0 x225 y155, Right 
GuiControl, Disable, shiftrightonly
Gui, Add, Checkbox, vwin c45CDCB x30 y175 , Win Key
GuiControl, Disable, win
Gui, Add, Radio, veither3 cFF93A0 x110 y175 Checked, Either
GuiControl, Disable, either3
Gui, Add, Radio, vwinleftonly cFF93A0 x175 y175, Left
GuiControl, Disable, winleftonly
Gui, Add, Radio, vwinrightonly cFF93A0 x225 y175, Right 
GuiControl, Disable, winrightonly
Gui, Add, Checkbox, valt c45CDCB x30 y195, Alt
GuiControl, Disable, alt
Gui, Add, Radio, veither4 cFF93A0 x110 y195 Checked, Either
GuiControl, Disable, either4
Gui, Add, Radio, valtleftonly cFF93A0 x175 y195, Left
GuiControl, Disable, altleftonly
Gui, Add, Radio, valtrightonly cFF93A0 x225 y195, Right 
GuiControl, Disable, altrightonly

; Remap

Gui, Add, Text, x35 y225 w235 h1 0x10
Gui, Add, Checkbox, vremap gcheckremap cF4D40C x30 y240, Remap?
GuiControl, Disable, remap
Gui, Add, Text, cF4D40C x120 y240 h50 , Remap to:
Gui, Add, Edit, vhotkeyremap x200 y235 w50 Center, a
GuiControl, Disable, hotkeyremap
Gui, Add, Button, vallkeysremap gallkeysremap x260 y235 w20 h25, *
GuiControl, Disable, allkeysremap
Gui, Add, Checkbox, vcontrolremap c45CDCB x30 y270  , Control
GuiControl, Disable, controlremap
Gui, Add, Radio, veitherremap1 cFF93A0 x110 y270 Checked, Either
GuiControl, Disable, eitherremap1
Gui, Add, Radio, vcontrolleftonlyremap cFF93A0 x175 y270, Left
GuiControl, Disable, controlleftonlyremap
Gui, Add, Radio, vcontrolrightonlyremap cFF93A0 x225 y270, Right 
GuiControl, Disable, controlrightonlyremap
Gui, Add, Checkbox, vshiftremap c45CDCB x30 y290, Shift
GuiControl, Disable, shiftremap
Gui, Add, Radio, veitherremap2 cFF93A0 x110 y290 Checked, Either
GuiControl, Disable, eitherremap2
Gui, Add, Radio, vshiftleftonlyremap cFF93A0 x175 y290, Left
GuiControl, Disable, shiftleftonlyremap
Gui, Add, Radio, vshiftrightonlyremap cFF93A0 x225 y290, Right 
GuiControl, Disable, shiftrightonlyremap
Gui, Add, Checkbox, vwinremap c45CDCB x30 y310 , Win Key
GuiControl, Disable, winremap
Gui, Add, Radio, veitherremap3 cFF93A0 x110 y310 Checked, Either
GuiControl, Disable, eitherremap3
Gui, Add, Radio, vwinleftonlyremap cFF93A0 x175 y310, Left
GuiControl, Disable, winleftonlyremap
Gui, Add, Radio, vwinrightonlyremap cFF93A0 x225 y310, Right 
GuiControl, Disable, winrightonlyremap
Gui, Add, Checkbox, valtremap c45CDCB x30 y330, Alt
GuiControl, Disable, altremap
Gui, Add, Radio, veitherremap4 cFF93A0 x110 y330 Checked, Either
GuiControl, Disable, eitherremap4
Gui, Add, Radio, valtleftonlyremap cFF93A0 x175 y330, Left
GuiControl, Disable, altleftonlyremap
Gui, Add, Radio, valtrightonlyremap cFF93A0 x225 y330, Right 
GuiControl, Disable, altrightonlyremap

;#######################################
;                Tab 2 Clicks
;#######################################

Gui, Tab, 2
Gui, Add, Checkbox, gChkChange vCB1 x30 y110 cF4D40C, Click 1
Gui, Add, Radio, vRBL1 x100 y110 cF4D40C, Left
Guicontrol, Disable, RBL1
Gui, Add, Radio, vRBR1 x150 y110 cF4D40C, Right
Guicontrol, Disable, RBR1
Gui, Add, Button, vB1 x210 y105 gclick1coords , Coords
Guicontrol, Disable, B1
Gui, Add, Edit, x90 y140 w145 vEdit1  
GuiControl, Disable, Edit1
Gui, Add, Button, x30 y135 w20 vclear1 gbutton1clear, Clear
GuiControl, Disable, clear1
Gui, Add, Text, x35 y+5 w235 h1 0x10
Gui, Add, Checkbox, gChkChange vCB2 x30 y180 cF4D40C, Click 2
GuiControl, Disable, CB2
Gui, Add, Radio, vRBL2 x100 y180 cF4D40C, Left
Guicontrol, Disable, RBL2
Gui, Add, Radio, vRBR2 x150 y180 cF4D40C, Right
Guicontrol, Disable, RBR2
Gui, Add, Button, x210 y175 vB2 gclick2coords, Coords
GuiControl, Disable, B2
Gui, Add, Edit, x90 y210 w145 vEdit2
GuiControl, Disable, Edit2
Gui, Add, Button, x30 y205 w20 vclear2 gbutton2clear, Clear
GuiControl, Disable, Clear2
Gui, Add, Text, x35 y+5 w235 h1 0x10
Gui, Add, Checkbox, gChkChange vCB3 x30 y250 cF4D40C, Click 3
GuiControl, Disable, CB3
Gui, Add, Radio, vRBL3 x100 y250 cF4D40C, Left
Guicontrol, Disable, RBL3
Gui, Add, Radio, vRBR3 x150 y250 cF4D40C, Right
Guicontrol, Disable, RBR3
Gui, Add, Button, x210 y245 vB3 gclick3coords, Coords
GuiControl, Disable, B3
Gui, Add, Edit, x90 y280 w145 vEdit3
GuiControl, Disable, Edit3
Gui, Add, Button, x30 y275 w20 vclear3 gbutton3clear, Clear
GuiControl, Disable, clear3
Gui, Add, Text, x35 y+5 w235 h1 0x10
Gui, Add, Button, x50 y+5 gwinspy, Open Window Spy
Gui, Add, Button, x200 y316 ghowtouse, Help


;#######################################
;                Tab 3 Sounds
;#######################################

Gui, Tab, 3
Gui, Add, Text, cF4D40C x80 y120 w165 h50 , Add Sound File Path
Gui, Add, Edit, x35 y+10 w235 h23 vFSF_A
Gui, Add, Text, x35 y+10 w235 h1 0x10
Gui, Add, Button, x105 y+15 w80 h23 gFile_B, % "Select File"

;#######################################
;                Tab 4 Programs
;#######################################

Gui, Tab, 4
Gui, Add, Checkbox, vrunprogram grunprogramtoggle x30 y110 cF4D40C, Run a program
Gui, Add, Checkbox, vmovewindow gmovewindowbutton x160 y110 Cf4D40C, Move window?
GuiControl, Disable, movewindow
Gui, Add, Edit, veditprogram y+10 x30
GuiControl, Disable, editprogram
Gui, Add, Button, vprogramselect gprogramselectbutton x200 y140 h20 w75, Select
GuiControl, Disable, programselect
Gui, Add, Text, x35 y+5 w235 h1 0x10
Gui, Add, Text, c39ACFA x95 y+10, Window Functions
Gui, Add, Checkbox, vactivatewindow gactivatewindowtoggle x30 y200 cF4D40C, Activate a window
Gui, Add, Checkbox, vuseabove guseabovebutton x180 y200 cF4D40C, Use Above
GuiControl, Disable, useabove
Gui, Add, Edit, vactivewindowedit x30 y220
GuiControl, Disable, activewindowedit
Gui, Add, Button, vwindowchoose gprogramchoosebutton x200 y222 h20 w75, Choose
GuiControl, Disable, windowchoose
Gui, Add, Checkbox, vmoveresize gmoveresizetoggle x30 y250 cF4D40C, Move or Resize a Window
GuiControl, Disable, moveresize
Gui, Add, Text, x50 y270 cF4D40C, X:
Gui, Add, Edit, veditx x70 y270 w75 
GuiControl, Disable, editx
Gui, Add, Text, x155 y270 cF4D40C, Y:
Gui, Add, Edit, vedity x175 y270 w75 
GuiControl, Disable, edity
Gui, Add, Text, x50 y300 cF4D40C, W:
Gui, Add, Edit, veditw x70 y300 w75 
GuiControl, Disable, editw
Gui, Add, Text, x155 y300 cF4D40C, H:
Gui, Add, Edit, vedith x175 y300 w75 
GuiControl, Disable, edith
Gui, Add, Checkbox, vmaximize x30 y335 cF4D40C, Maximize?
GuiControl, Disable, maximize
Gui, Add, Button, gprogramwindowspybutton x125 y335 h20 cF4D40C, Window Spy
Gui, Add, Button, gprogramhelpbutton x230 y335 h20 cF4D40C, Help

;#######################################
;                Tab 5 Other
;#######################################

Gui, Tab, 5
Gui, Add, Text, cF4D40C x75 y105 w145 h50 , Additional Script Stuff
Gui, Add, Edit, vothertext x34 y130 w240 h200

;#######################################
;                Below Tabs
;#######################################

Gui, Tab
Gui, Add, Text, Center cF4D40C x10 y365 w275 h50, Filename for Script
Gui, Add, Edit, vfilename x70 y390
Gui, Add, Button, gGenerateFile Center x15 y430 w275 h50, Generate File

;#######################################
;                Show GUI
;#######################################

Gui, Show, , Script Generator
TabColors := ["113300", "33334d", "330000", "333300", "000000"]
GoSub, TabEvent ; Set the default
return

;#######################################
;                Hotkeys
;#######################################

;Rbutton::
^LButton::

if (click1edit = "on")
{
MouseGetPos, xpos, ypos
   GuiControl,, click1entry, %xpos% %ypos% ; I think we can delete
   GuiControl,, edit1, %xpos% %ypos%
}

else if (click2edit = "on")
{
MouseGetPos, xpos, ypos
   GuiControl,, edit2, %xpos% %ypos%
}

else if (click3edit = "on")
{
MouseGetPos, xpos, ypos
   GuiControl,, edit3, %xpos% %ypos%
}

else if (programedit = "on")
{
MouseGetPos, ahk_class
WinGetClass, class, A
   GuiControl,, activewindowedit, %class%
}

;Hotkey, Rbutton,, Off
Hotkey, ^LButton,, Off
exit
Return

;#######################################
;                GLabels
;#######################################




; Activate Window Checkbox on Programs Tab

activatewindowtoggle:
GuiControlGet, CheckBoxState,, activatewindow
  If (CheckBoxState = 1)
     { 
       ;GuiControl, Enable, useabove
       GuiControl, Enable, activewindowedit
       GuiControl, Enable, windowchoose
       GuiControl, Enable, moveresize
     }
  Else 
     {
       ;GuiControl, Disable, useabove
       GuiControl, Disable, activewindowedit
       GuiControl, Disable, windowchoose
       GuiControl, Disable, moveresize
     }
Return  

; Allkeys

Allkeys:
Gui 2: +AlwaysOnTop +OwnDialogs -MinimizeBox
Gui 2: Font, s14 , Arial
Gui 2: Add, Text, c39ACFA Center x10 y30 w200 h180, Select a special key
Gui 2: Font, s11 , Arial
Gui 2: Add, Radio, gspecialcheckkeyboard vkeyboard x10 y70
Gui 2: Add, Text, x90 y70, Keyboard
Gui 2: Add, DropDownList, vspecialkeys x10 y100 w200 cGreen, |Backspace|Scroll Lock|Enter|Pause/Break|Space|Print Screen|Caps Lock|Escape|Insert|Home|End|Page Up|Page Down|Up Arrow|Down Arrow|Left Arrow|Right Arrow
Gui 2: Add, Radio, gspecialcheckmouse vmouse x10 y140
Gui 2: Add, Text, x90 y140, Clicks
Gui 2: Add, DropDownList, vmouseclicks x10 y170 w200 cGreen, Left Click|Middle Click|Right Click|Button 4|Button 5
Gui 2: Add, Radio, gspecialchecknumberpad vnumberpad x10 y210
Gui 2: Add, Text, x90 y210, Numpad
Gui 2: Add, DropDownList, vnumpad x10 y240 w200 cGreen, |0|1|2|3|4|5|6|7|8|9|.|Enter|+|-|*|/|NumLock
Gui 2: Add, Button, vsubmitspecial gsubmitspecial x80 y280, Submit
GuiControl 2: Disable, submitspecial
Gui 2: Show
Return


specialcheckkeyboard:
GuiControlGet, RadioState,, keyboard
If (RadioState = 1)
{
GuiControl,,mouse,0
GuiControl,,numberpad,0
GuiControl, Enable, submitspecial
}
Return

specialcheckmouse:
GuiControlGet, RadioState,, mouse
If (RadioState = 1)
{
GuiControl,,keyboard,0
GuiControl,,numberpad,0
GuiControl, Enable, submitspecial
}
Return

specialchecknumberpad:
GuiControlGet, RadioState,, numberpad
If (RadioState = 1)
{
GuiControl,,keyboard,0
GuiControl,,mouse,0
GuiControl, Enable, submitspecial
}
Return

specialcheckkeyboardremap:
GuiControlGet, RadioState,, keyboardremap
If (RadioState = 1)
{
GuiControl,,mouseremap,0
GuiControl,,numberpadremap,0
GuiControl, Enable, submitspecialremap
}
Return

specialcheckmouseremap:
GuiControlGet, RadioState,, mouseremap
If (RadioState = 1)
{
GuiControl,,keyboardremap,0
GuiControl,,numberpadremap,0
GuiControl, Enable, submitspecialremap
}
Return

specialchecknumberpadremap:
GuiControlGet, RadioState,, numberpadremap
If (RadioState = 1)
{
GuiControl,,keyboardremap,0
GuiControl,,mouseremap,0
GuiControl, Enable, submitspecialremap
}
Return


; AllkeysRemap
Allkeysremap:

Gui 3: +AlwaysOnTop +OwnDialogs -MinimizeBox
Gui 3: Font, s14 , Arial
Gui 3: Add, Text, c39ACFA Center x10 y10 w200 h180, Select a special key
Gui 3: Add, Text, c39ACFA Center x10 y35 w200 h180,( Remap )
Gui 3: Font, s11 , Arial
Gui 3: Add, Radio, gspecialcheckkeyboardremap vkeyboardremap x10 y70
Gui 3: Add, Text, x90 y70, Keyboard
Gui 3: Add, DropDownList, vspecialkeysremap x10 y100 w200 cGreen, |Backspace|Scroll Lock|Enter|Pause/Break|Space|Print Screen|Caps Lock|Escape|Insert|Home|End|Page Up|Page Down|Up Arrow|Down Arrow|Left Arrow|Right Arrow
Gui 3: Add, Radio, gspecialcheckmouseremap vmouseremap x10 y140
Gui 3: Add, Text, x90 y140, Clicks
Gui 3: Add, DropDownList, vmouseclicksremap x10 y170 w200 cGreen, Left Click|Middle Click|Right Click|Button 4|Button 5
Gui 3: Add, Radio, gspecialchecknumberpadremap vnumberpadremap x10 y210
Gui 3: Add, Text, x90 y210, Numpad
Gui 3: Add, DropDownList, vnumpadremap x10 y240 w200 cGreen, |0|1|2|3|4|5|6|7|8|9|.|Enter|+|-|*|/|NumLock
Gui 3: Add, Button, vsubmitspecialremap gsubmitspecialremap x80 y280, Submit
GuiControl 3: Disable, submitspecialremap
Gui 3: Show
Return

; "Coords" (1) Button on the "Clicks" tab

click1coords:
click1edit = on
click2edit = off
click3edit = off
;Hotkey, Rbutton,, On
Hotkey, ^LButton,, On
return

; "Coords" (2) Button on the "Clicks" tab

click2coords:
click1edit = off
click2edit = on
click3edit = off
;Hotkey, Rbutton,, On
Hotkey, ^LButton,, On
return


; "Coords" (3) Button on the "Clicks" tab

click3coords:
click1edit = off
click2edit = off
click3edit = on
;Hotkey, Rbutton,, On
Hotkey, ^LButton,, On
return

; "Clear" (1) Button on the "Clicks" tab

button1clear:
   GuiControl,  , edit1
return

; "Clear" (2) Button on the "Clicks" tab

button2clear:
   GuiControl,  , edit2
return

; "Clear" (3) Button on the "Clicks" tab

button3clear:
   GuiControl,  , edit3
return

; Checks for click checkbox changes

ChkChange:

  GuiControlGet, CheckBoxState,, CB1
If (CheckboxState = 1)
    {
    GuiControl, Enable, CB2
    }
Else
    {
       GuiControl, Disable , CB2
       GuiControl,,CB2,0
       GuiControl, Disable, CB3
       GuiControl,,CB3,0
    }

  GuiControlGet, CheckBoxState,, CB2
If (CheckboxState = 1)
    {
      GuiControl, Enable, CB3
    }
Else
    {
       GuiControl,,CB3,0
    }

Loop, 3 {
  GuiControlGet, CheckBoxState,, CB%A_Index%
  If (CheckBoxState = 1)
     { 
       GuiControl, Enable, Edit%A_Index%
       GuiControl, Enable, RBL%A_Index%
       GuiControl, Enable, RBR%A_Index%
       GuiControl, Enable, B%A_Index%
       GuiControl, Enable, Clear%A_Index%
     } 
  Else 
     {
       GuiControl, Disable, Edit%A_Index%
       GuiControl, Disable, RBL%A_Index%
       GuiControl, Disable, RBR%A_Index%
       GuiControl, Disable, B%A_Index%
       GuiControl, Disable, Clear%A_Index%
     }
}
Return

; "Remap?" checkbox on the "Hotkeys" tab

checkremap:
GuiControlGet, CheckBoxState,, remap
  If (CheckBoxState = 1)
     { 
       GuiControl, Enable, hotkeyremap
       GuiControl, Enable, allkeysremap
       GuiControl, Enable, controlremap
       GuiControl, Enable, eitherremap1
       GuiControl, Enable, controlleftonlyremap
       GuiControl, Enable, controlrightonlyremap

       GuiControl, Enable, shiftremap
       GuiControl, Enable, eitherremap2
       GuiControl, Enable, shiftleftonlyremap
       GuiControl, Enable, shiftrightonlyremap

       GuiControl, Enable, winremap
       GuiControl, Enable, eitherremap3
       GuiControl, Enable, winleftonlyremap
       GuiControl, Enable, winrightonlyremap

       GuiControl, Enable, altremap
       GuiControl, Enable, eitherremap4
       GuiControl, Enable, altleftonlyremap
       GuiControl, Enable, altrightonlyremap
     } 
  Else 
     {
       GuiControl, Disable, hotkeyremap
       GuiControl, Disable, allkeysremap
       GuiControl, Disable, controlremap
       GuiControl, Disable, eitherremap1
       GuiControl, Disable, controlleftonlyremap
       GuiControl, Disable, controlrightonlyremap

       GuiControl, Disable, shiftremap
       GuiControl, Disable, eitherremap2
       GuiControl, Disable, shiftleftonlyremap
       GuiControl, Disable, shiftrightonlyremap

       GuiControl, Disable, winremap
       GuiControl, Disable, eitherremap3
       GuiControl, Disable, winleftonlyremap
       GuiControl, Disable, winrightonlyremap

       GuiControl, Disable, altremap
       GuiControl, Disable, eitherremap4
       GuiControl, Disable, altleftonlyremap
       GuiControl, Disable, altrightonlyremap
     }
Return

; File Select for soundpath on "Sounds" tab

File_B:
    FileSelectFile, File_A
   SplitPath, File_A, name, dir, ext, name_no_ext, drive
    GuiControl,, FSF_A, % File_A
	return

; Pressing X in the top right closes the GUI

GuiClose:
ExitApp
Return

; "Hotkey?" Checkbox on the "Hotkeys" tab

hotkeytoggle:
GuiControlGet, CheckBoxState,, hotkeyyesno
  If (CheckBoxState = 1)
     { 
       GuiControl, Enable, hotkey
       GuiControl, Enable, allkeys
       GuiControl, Enable, control
       GuiControl, Enable, either1
       GuiControl, Enable, controlleftonly
       GuiControl, Enable, controlrightonly
       GuiControl, Enable, shift
       GuiControl, Enable, either2
       GuiControl, Enable, shiftleftonly
       GuiControl, Enable, shiftrightonly
       GuiControl, Enable, win
       GuiControl, Enable, either3
       GuiControl, Enable, winleftonly
       GuiControl, Enable, winrightonly
       GuiControl, Enable, alt
       GuiControl, Enable, either4
       GuiControl, Enable, altleftonly
       GuiControl, Enable, altrightonly
       GuiControl, Enable, remap
     } 
  Else 
     {
       GuiControl, Disable, hotkey
       GuiControl, Disable, allkeys
       GuiControl, Disable, control
       GuiControl, Disable, either1
       GuiControl, Disable, controlleftonly
       GuiControl, Disable, controlrightonly
       GuiControl, Disable, shift
       GuiControl, Disable, either2
       GuiControl, Disable, shiftleftonly
       GuiControl, Disable, shiftrightonly
       GuiControl, Disable, win
       GuiControl, Disable, either3
       GuiControl, Disable, winleftonly
       GuiControl, Disable, winrightonly
       GuiControl, Disable, alt
       GuiControl, Disable, either4
       GuiControl, Disable, altleftonly
       GuiControl, Disable, altrightonly
       GuiControl, Disable, remap
     }
Return

; "Help" Button on the "Clicks" tab

howtouse:
msgbox, 262144, Help, 
(


1 ) Click on the "Coords" button on the desired mouse click

2 ) "Left click" on the window or desktop

3 ) "Control left click" where you want to set the coordinates

** Note ** 
It defaults to the GUI's coordinates
If you left click on a window and then right click, you will get the window coordinates
If you left click on the screen, you will get the screen coordinates
The clicks section needs improving
)

Return

; "Run a program" checkbox on the "Programs" tab 

runprogramtoggle:
GuiControlGet, CheckBoxState,, runprogram
  If (CheckBoxState = 1)
     { 
       GuiControl, Enable, movewindow
       GuiControl, Enable, programselect
       GuiControl, Enable, editprogram
       GuiControl, Enable, useabove
     }
  Else 
     {
       GuiControl, Disable, movewindow
       GuiControl, Disable, programselect
       GuiControl, Disable, editprogram
       GuiControl, Disable, useabove
     }
Return

; "Move or resize a window" checkbox on the "Programs" tab 

moveresizetoggle:
GuiControlGet, CheckBoxState,, moveresize
  If (CheckBoxState = 1)
     { 
       GuiControl, Enable, editx
       GuiControl, Enable, edity
       GuiControl, Enable, edith
       GuiControl, Enable, editw
       GuiControl, Enable, maximize
     }
  Else 
     {
       GuiControl, Disable, editx
       GuiControl, Disable, edity
       GuiControl, Disable, edith
       GuiControl, Disable, editw
       GuiControl, Disable, maximize
     }
Return

; Move Window Checkbox on the "Programs" tab 

movewindowbutton:


GuiControlGet, CheckBoxState,, movewindow
  If (CheckBoxState = 1)
     {   
     GuiControl,,useabove,1
     GuiControl, Disable, useabove
     GuiControl,,movewindow,1
     GuiControl, Enable, movewindow
     }
    Else
     {
     GuiControl,,useabove,0
     GuiControl, Enable, useabove
     }

GuiControlGet, CheckBoxState,, movewindow
  If (CheckBoxState = 1)
     { 
     GuiControl,,activatewindow,1
     GoSub, activatewindowtoggle
    ; GuiControl,,useabove,1
    ; GuiControl, Disable , useabove
     GoSub, useabovebutton
     }
   ;Else
    ; {
    ; GuiControl,,useabove,0
     ;GuiControl, Enable, useabove
     ;}
Return

; Choose button on the "Programs" tab, activates 

programchoosebutton:
programedit = on
Return

; Help Button on the "Programs" tab 

programhelpbutton:

msgbox, 262144, Help, 
(
Activate a Window:
Open the program you want to use in this script
Click the Choose Button
Left click on the window, it will grab it's window class and add it to the text entry box
If you want to use a different method (ahk_exe), you can find it by clicking the Window Spy button
)
Return

; Loads the Select File on the "Programs" tab, enters it into editprogram on the "Programs" tab 

programselectbutton:

    FileSelectFile, File_A
   SplitPath, File_A, name, dir, ext, name_no_ext, drive
    GuiControl,, editprogram, % File_A
	return
Return

; Loads Window Spy on the "Programs" tab 

programwindowspybutton:

run, %A_AhkPath%\..\WindowSpy.ahk

Return

Submitspecial:


GuiControlGet, RadioState,, keyboard
If (RadioState = 1)
     {
      GuiControlGet, specialkeys
       If (specialkeys = "Backspace")
         {
           msgbox, "Backspace Selected"
           GuiControl 1:, hotkey, Backspace
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Scroll Lock")
         {
           GuiControl 1:, hotkey, ScrollLock
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Enter")
         {
           GuiControl 1:, hotkey, Enter
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Pause/Break")
         {
           GuiControl 1:, hotkey, Pause
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Space")
         {
           GuiControl 1:, hotkey, Space
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Print Screen")
         {
           GuiControl 1:, hotkey, PrintScreen
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Caps Lock")
         {
           GuiControl 1:, hotkey, CapsLock
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Delete")
         {
           GuiControl 1:, hotkey, Delete
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Insert")
         {
           GuiControl 1:, hotkey, Insert
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Home")
         {
           GuiControl 1:, hotkey, Home
           gui, 2: destroy
           Return
         }
       If (specialkeys = "End")
         {
           GuiControl 1:, hotkey, End
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Page Up")
         {
           GuiControl 1:, hotkey, PgUp
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Page Down")
         {
           GuiControl 1:, hotkey, PgDn
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Up Arrow")
         {
           GuiControl 1:, hotkey, Up
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Down Arrow")
         {
           GuiControl 1:, hotkey, Down
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Left Arrow")
         {
           GuiControl 1:, hotkey, Left
           gui, 2: destroy
           Return
         }
       If (specialkeys = "Right Arrow")
         {
           GuiControl 1:, hotkey, Right
           gui, 2: destroy
           Return
         }
Return
}



GuiControlGet, RadioState,, mouse
If (RadioState = 1)
     {
      GuiControlGet, mouseclicks
       If (mouseclicks = "Left Click")
         {
           GuiControl 1:, hotkey, LButton
           gui, 2: destroy
           Return
         }
       If (mouseclicks = "Middle Click")
         {
           GuiControl 1:, hotkey, MButton
           gui, 2: destroy
           Return
         }
       If (mouseclicks = "Right Click")
         {
           GuiControl 1:, hotkey, RButton
           gui, 2: destroy
           Return
         }
       If (mouseclicks = "Button 4")
         {
           GuiControl 1:, hotkey, XButton1
           gui, 2: destroy
           Return
         }
       If (mouseclicks = "Button 5")
         {
           GuiControl 1:, hotkey, XButton2
           gui, 2: destroy
           Return
         }
Return
}

GuiControlGet, RadioState,, numberpad
If (RadioState = 1)
     {
     GuiControlGet, numpad
       If (numpad = "0")
         {
           GuiControl 1:, hotkey, Numpad0 / NumpadIns
           gui, 2: destroy
           Return
         }
       If (numpad = "1")
         {
           GuiControl 1:, hotkey, Numpad1 / NumpadEnd
           gui, 2: destroy
           Return
         }
       If (numpad = "2")
         {
           GuiControl 1:, hotkey, Numpad2 / NumpadDown
           gui, 2: destroy
           Return
         }
       If (numpad = "3")
         {
           GuiControl 1:, hotkey, Numpad3 / NumpadPgDn
           gui, 2: destroy
           Return
         }
       If (numpad = "4")
         {
           GuiControl 1:, hotkey, Numpad4 / NumpadLeft
           gui, 2: destroy
           Return
         }
       If (numpad = "5")
         {
           GuiControl 1:, hotkey, Numpad5 / NumpadClear
           gui, 2: destroy
           Return
         }
       If (numpad = "6")
         {
           GuiControl 1:, hotkey, Numpad6 / NumpadRight
           gui, 2: destroy
           Return
         }
       If (numpad = "7")
         {
           GuiControl 1:, hotkey, Numpad7 / NumpadHome
           gui, 2: destroy
           Return
         }
       If (numpad = "8")
         {
           GuiControl 1:, hotkey, Numpad8 / NumpadUp
           gui, 2: destroy
           Return
         }
       If (numpad = "9")
         {
           GuiControl 1:, hotkey, Numpad9 / NumpadPgUp
           gui, 2: destroy
           Return
         }
       If (numpad = ".")
         {
           GuiControl 1:, hotkey, NumpadDot / NumpadDel
           gui, 2: destroy
           Return
         }
       If (numpad = "Enter")
         {
           GuiControl 1:, hotkey, NumpadEnter
           gui, 2: destroy
           Return
         }
       If (numpad = "+")
         {
           GuiControl 1:, hotkey, NumpadAdd
           gui, 2: destroy
           Return
         }
       If (numpad = "-")
         {
           GuiControl 1:, hotkey, NumpadSub
           gui, 2: destroy
           Return
         }
       If (numpad = "*")
         {
           GuiControl 1:, hotkey, NumpadMult
           gui, 2: destroy
           Return
         }
       If (numpad = "/")
         {
           GuiControl 1:, hotkey, NumpadDiv
           gui, 2: destroy
           Return
         }
       If (numpad = "NumLock")
         {
           GuiControl 1:, hotkey, NumLock
       gui, 2: destroy
           Return
         }
Return
}
gui, 2: destroy
return



; closes the remap Gui window

2GuiClose:
   Gui, 2:destroy
Return

; closes the remap special Gui window

3GuiClose:
   Gui, 3:destroy
Return



Submitspecialremap:

GuiControlGet, RadioState,, keyboardremap
If (RadioState = 1)
     {
      GuiControlGet, specialkeysremap
       If (specialkeysremap = "Backspace")
         {
           msgbox, "Backspace Selected"
           GuiControl 1:, hotkeyremap, Backspace
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Scroll Lock")
         {
           GuiControl 1:, hotkeyremap, ScrollLock
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Enter")
         {
           GuiControl 1:, hotkeyremap, Enter
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Pause/Break")
         {
           GuiControl 1:, hotkeyremap, Pause
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Space")
         {
           GuiControl 1:, hotkeyremap, Space
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Print Screen")
         {
           GuiControl 1:, hotkeyremap, PrintScreen
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Caps Lock")
         {
           GuiControl 1:, hotkeyremap, CapsLock
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Delete")
         {
           GuiControl 1:, hotkeyremap, Delete
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Insert")
         {
           GuiControl 1:, hotkeyremap, Insert
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Home")
         {
           GuiControl 1:, hotkeyremap, Home
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "End")
         {
           GuiControl 1:, hotkeyremap, End
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Page Up")
         {
           GuiControl 1:, hotkeyremap, PgUp
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Page Down")
         {
           GuiControl 1:, hotkeyremap, PgDn
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Up Arrow")
         {
           GuiControl 1:, hotkeyremap, Up
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Down Arrow")
         {
           GuiControl 1:, hotkeyremap, Down
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Left Arrow")
         {
           GuiControl 1:, hotkeyremap, Left
           gui, 3: destroy
           Return
         }
       If (specialkeysremap = "Right Arrow")
         {
           GuiControl 1:, hotkeyremap, Right
           gui, 3: destroy
           Return
         }
Return
}



GuiControlGet, RadioState,, mouseremap
If (RadioState = 1)
     {
      GuiControlGet, mouseclicksremap
       If (mouseclicksremap = "Left Click")
         {
           GuiControl 1:, hotkeyremap, LButton
           gui, 3: destroy
           Return
         }
       If (mouseclicksremap = "Middle Click")
         {
           GuiControl 1:, hotkeyremap, MButton
           gui, 3: destroy
           Return
         }
       If (mouseclicksremap = "Right Click")
         {
           GuiControl 1:, hotkeyremap, RButton
           gui, 3: destroy
           Return
         }
       If (mouseclicksremap = "Button 4")
         {
           GuiControl 1:, hotkeyremap, XButton1
           gui, 3: destroy
           Return
         }
       If (mouseclicksremap = "Button 5")
         {
           GuiControl 1:, hotkeyremap, XButton2
           gui, 3: destroy
           Return
         }
Return
}

GuiControlGet, RadioState,, numberpadremap
If (RadioState = 1)
     {
msgbox "you rock"
     GuiControlGet, numpadremap
       If (numpadremap = "0")
         {
msgbox "0 Selected"
           GuiControl 1:, hotkeyremap, Numpad0 / NumpadIns
           gui, 3: destroy
           Return
         }
       If (numpadremap = "1")
         {
           GuiControl 1:, hotkeyremap, Numpad1 / NumpadEnd
           gui, 3: destroy
           Return
         }
       If (numpadremap = "2")
         {
           GuiControl 1:, hotkeyremap, Numpad2 / NumpadDown
           gui, 3: destroy
           Return
         }
       If (numpadremap = "3")
         {
           GuiControl 1:, hotkeyremap, Numpad3 / NumpadPgDn
           gui, 3: destroy
           Return
         }
       If (numpadremap = "4")
         {
           GuiControl 1:, hotkeyremap, Numpad4 / NumpadLeft
           gui, 3: destroy
           Return
         }
       If (numpadremap = "5")
         {
           GuiControl 1:, hotkeyremap, Numpad5 / NumpadClear
           gui, 3: destroy
           Return
         }
       If (numpadremap = "6")
         {
           GuiControl 1:, hotkeyremap, Numpad6 / NumpadRight
           gui, 3: destroy
           Return
         }
       If (numpadremap = "7")
         {
           GuiControl 1:, hotkeyremap, Numpad7 / NumpadHome
           gui, 3: destroy
           Return
         }
       If (numpadremap = "8")
         {
           GuiControl 1:, hotkeyremap, Numpad8 / NumpadUp
           gui, 3: destroy
           Return
         }
       If (numpadremap = "9")
         {
           GuiControl 1:, hotkeyremap, Numpad9 / NumpadPgUp
           gui, 3: destroy
           Return
         }
       If (numpadremap = ".")
         {
           GuiControl 1:, hotkeyremap, NumpadDot / NumpadDel
           gui, 3: destroy
           Return
         }
       If (numpadremap = "Enter")
         {
           GuiControl 1:, hotkeyremap, NumpadEnter
           gui, 3: destroy
           Return
         }
       If (numpadremap = "+")
         {
           GuiControl 1:, hotkeyremap, NumpadAdd
           gui, 3: destroy
           Return
         }
       If (numpadremap = "-")
         {
           GuiControl 1:, hotkeyremap, NumpadSub
           gui, 3: destroy
           Return
         }
       If (numpadremap = "*")
         {
           GuiControl 1:, hotkeyremap, NumpadMult
           gui, 3: destroy
           Return
         }
       If (numpadremap = "/")
         {
           GuiControl 1:, hotkeyremap, NumpadDiv
           gui, 3: destroy
           Return
         }
       If (numpadremap = "NumLock")
         {
           GuiControl 1:, hotkeyremap, NumLock
       gui, 3: destroy
           Return
         }
Return
}
gui, 3: destroy
return


; Loads Tab Colors

TabEvent:
GuiControlGet, TabVariable
Gui, Color, % TabColors[TabVariable]
return

; Use Above Checkbox on the "Programs" tab

useabovebutton:

GuiControlGet, CheckBoxState,, useabove
  If (CheckBoxState = 1)
     {   
     GuiControl,,movewindow,1
;     GuiControl, Disable, movewindow
;     GuiControl, Enable, movewindow
     }
    Else
     {
     GuiControl,,movewindow,0
     GuiControl, Enable, movewindow
     }



GuiControlGet, activatewindow
GuiControlGet, activewindowedit
GuiControlGet, editprogram, 
GuiControlGet, CheckBoxState,, useabove
  If (CheckBoxState = 1)  AND (editprogram != "")
     {   
GuiControl, Enable, activatewindow
     GuiControl,,activatewindow,1
     GoSub, activatewindowtoggle
GuiControl, Enable, activewindowedit
;GuiControl, Disable, movewindow; fuck
 ;      msgbox, %editprogram%
       Run, %editprogram%
;       WinWait, %editprogram%
sleep 1000
       WinGetClass, class, A
  ;     MsgBox, The active window's class is "%class%".
    GuiControl,, activewindowedit, %class%

     }
Return

; "Windows Spy" Button on the "Clicks" tab

winspy:
run, %A_AhkPath%\..\WindowSpy.ahk
return

; ##########################################
; ##########################################
; ##########################################
; # # # # # # # # # # # # # # # # # # # # #

;     Generate File Button ( a Glabel )

; # # # # # # # # # # # # # # # # # # # # #

GenerateFile:

; ----------------------------------------------
; Open Notepad, Type in required starting Syntax
; ----------------------------------------------

run, notepad.exe ; OK
WinWait, Notepad
WinActivate, Notepad
Sleep 500
SendRaw, #Requires AutoHotkey v1.1.35 `n
SendRaw, #Warn `n
SendRaw, #SingleInstance Force `n

Gui, Submit, NoHide ;this command submits the guis' datas' state

; -----------------------------
; Comment section before Script
; -----------------------------

SendRaw, `n
SendInput, {;}
SendRaw, ~~~~~~~~~~~~~~~~~~~~~ Comments ~~~~~~~~~~~~~~~~~~~~~ `n
SendRaw, `n


			; Tab 1 (Hotkeys)



GuiControlGet, CheckBoxState,, hotkeyyesno
  If (CheckBoxState = 1)
     { 
      Send, {;}

        If (Controlleftonly = 1) AND (Control = 1)
          {
           SendInput {Space}
           Sendraw, (Left)
           Sendraw, Control
          }

        If (Controlrightonly = 1) AND (Control = 1)
          {
           SendInput {Space}
           Sendraw, (Right)
           Sendraw, Control
          }

        If (Control = 1) AND (controlleftonly = 0) AND (controlrightonly = 0)
          {
           SendInput {Space}
           Sendraw, Control
          }

If (shiftleftonly = 1) AND (shift = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, Shift
}

If (shiftrightonly = 1) AND (shift = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, Shift
}

If (Shift = 1) AND (shiftleftonly = 0) AND (shiftrightonly = 0)
{
     SendInput {Space}
     Sendraw, shift
}

If (winleftonly = 1) AND (win = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, Win
}

If (winrightonly = 1) AND (win = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, win
}

If (win = 1) AND (winleftonly = 0) AND (winrightonly = 0)
{
     SendInput {Space}
     Sendraw, win
}

If (altleftonly = 1) AND (alt = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, alt
}

If (altrightonly = 1) AND (alt = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, alt
}

If (alt = 1) AND (altleftonly = 0) AND (altrightonly = 0)
{
     SendInput {Space}
     Sendraw, alt
}

If (hotkeyyesno = 1)
{
SendInput {Space}
Sendraw, '%hotkey%'
}

If (remap = 0)
{
Sendraw, `n
}


}



If (hotkeyyesno = 1) AND (remap = 1)
{

SendInput {Space}
sendraw, Remapped to 

If (Controlleftonlyremap = 1) AND (Controlremap = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, Control
}

If (Controlrightonlyremap = 1) AND (Controlremap = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, Control
}

If (Controlremap = 1) AND (controlleftonlyremap = 0) AND (controlrightonlyremap = 0)
{
     SendInput {Space}
     Sendraw, Control
}

If (shiftleftonlyremap = 1) AND (shift = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, Shift
}

If (shiftrightonlyremap = 1) AND (shiftremap = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, Shift
}

If (Shiftremap = 1) AND (shiftleftonlyremap = 0) AND (shiftrightonlyremap = 0)
{
     SendInput {Space}
     Sendraw, shift
}

If (winleftonlyremap = 1) AND (winremap = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, Win
}

If (winrightonlyremap = 1) AND (winremap = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, win
}

If (winremap = 1) AND (winleftonlyremap = 0) AND (winrightonlyremap = 0)
{
     SendInput {Space}
     Sendraw, win
}


If (altleftonlyremap = 1) AND (altremap = 1)
{
     SendInput {Space}
     Sendraw, (Left)
     Sendraw, alt
}

If (altrightonlyremap = 1) AND (altremap = 1)
{
     SendInput {Space}
     Sendraw, (Right)
     Sendraw, alt
}

If (altremap = 1) AND (altleftonlyremap = 0) AND (altrightonlyremap = 0)
{
     SendInput {Space}
     Sendraw, alt
}

SendInput {Space}
SendRaw, '%hotkeyremap%' `n
}

			; Tab 3 (Sounds)

			; Tab 3 (Sounds)
; -----------------------------------
; Set the soundpath if it was entered
; -----------------------------------

if (FSF_A != "")
{
      ;SendRaw, `n
     SendInput, {;}
     SendInput, {Space}
     Sendraw, Play Sound File '%FSF_A%' `n
}


			; Tab 4 (Programs)


GuiControlGet, CheckBoxState,, runprogram
  If (CheckBoxState = 1) AND (editprogram != "")
;If (editprogram != "")
{
;SendRaw, `n
Send, {;}
SendInput {Space}
SendRaw, Run Program %editprogram% `n
}

GuiControlGet, CheckBoxState,, activatewindow
  If (CheckBoxState = 1) AND If (activewindowedit != "") 
{
;SendRaw, `n
Send, {;}
SendInput {Space}
SendRaw, Activate Window %activewindowedit% `n
}


GuiControlGet, CheckBoxState,, moveresize
  If (CheckBoxState = 1) AND ( (editx !="") OR (edity !="") OR (editw !="") OR (edith !="") )
     { 
;SendRaw, `n
Send, {;}
SendInput {Space}
SendRaw, Move the window to:
SendInput {Space}
If (editx != "") 
{
SendRaw, X: %editx%
SendInput {Space}
}

If (edity != "") 
{
SendRaw, Y: %edity%
SendInput {Space}
}

If (editw != "") 
{
SendRaw, W: %editw%
SendInput {Space}
}

If (edith != "") 
{
SendRaw, H: %editH%
SendInput {Space}
}

}

GuiControlGet, CheckBoxState,, maximize
  If (CheckBoxState = 1)
     { 	
     SendRaw, `n
     Send, {;}
     SendInput {Space}
     SendRaw, Maximize the window `n
     }


			; Tab 2 (Clicks)


; Click 1 - Left Click

If (CB1 = 1) AND (RBR1 = 0)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Left click screen position %Edit1% `n
}

; Click 1 - Right Click

If (CB1 = 1) AND (RBR1 = 1)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Right click screen position %Edit1% `n
}

; Click 2 - Left Click

If (CB2 = 1) AND (RBR2 = 0)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Left click screen position %Edit2% `n
}


; Click 2 - Right Click

If (CB2 = 1) AND (RBR2 = 1)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Right click screen position %Edit2% `n
}

; Click 3 - Left Click

If (CB3 = 1) AND (RBR3 = 0)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Left click screen position %Edit3% `n
}


; Click 3 - Right Click

If (CB3 = 1) AND (RBR3 = 1)
{
SendInput, {;}
SendInput, {Space}
Sendraw, Right click screen position %Edit3% `n
}







			; Tab 5 (Other)

SendRaw, `n
SendInput, {;}
SendRaw, ~~~~~~~~~~~~~~~~~~~~~~ Script ~~~~~~~~~~~~~~~~~~~~~~
SendRaw, `n
SendRaw, `n

; ------------------------------------
; Send the Selected Hotkeys to notepad
; ------------------------------------

GuiControlGet, CheckBoxState,, hotkeyyesno
  If (CheckBoxState = 1)
     { 

If (Controlleftonly = 1) AND (Control = 1)
{
     SendRaw, <^
}

If (Controlrightonly = 1) AND (Control = 1)
{
     SendRaw, >^
}

If (Control = 1) AND (controlleftonly = 0) AND (controlrightonly = 0)
{
    Sendraw, ^
}

If (shiftleftonly = 1) AND (shift = 1)
{
     SendRaw, <+
}

If (shiftrightonly = 1) AND (shift = 1)
{
     SendRaw, >+
}

If (shift = 1) AND (shiftleftonly = 0) AND (shiftrightonly = 0)
{
    Sendraw, +
}

If (winleftonly = 1) AND (win = 1)
{
     SendRaw, <#
}

If (winrightonly = 1) AND (win = 1)
{
     SendRaw, >#
}

If (win = 1) AND (winleftonly = 0) AND (winrightonly = 0)
{
    Sendraw, #
}

If (altleftonly = 1) AND (alt = 1)
{
     SendRaw, <!
}

If (altrightonly = 1) AND (alt = 1)
{
     SendRaw, >!
}

If (alt = 1) AND (altleftonly = 0) AND (altrightonly = 0)
{
    Sendraw, !
}

If (hotkeyyesno = 1)
{
Send, %hotkey%
SendRaw, ::
}

If (remap = 0)
{
Sendraw, `n
}

; ###################################
; Set the remapped key if it was entered
; ###################################


GuiControlGet, CheckBoxState,, remap
  If (CheckBoxState = 1)
     { 

If (Controlleftonlyremap = 1) AND (Controlremap = 1)
{
     SendRaw, <^
}

If (Controlrightonlyremap = 1) AND (Controlremap = 1)
{
     SendRaw, >^
}

If (Controlremap = 1) AND (controlleftonlyremap = 0) AND (controlrightonlyremap = 0)
{
    Sendraw, ^
}

If (shiftleftonlyremap = 1) AND (shiftremap = 1)
{
     SendRaw, <+
}

If (shiftrightonlyremap = 1) AND (shiftremap = 1)
{
     SendRaw, >+
}

If (shiftremap = 1) AND (shiftleftonlyremap = 0) AND (shiftrightonlyremap = 0)
{
    Sendraw, +
}

If (winleftonlyremap = 1) AND (winremap = 1)
{
     SendRaw, <#
}

If (winrightonlyremap = 1) AND (winremap = 1)
{
     SendRaw, >#
}

If (winremap = 1) AND (winleftonlyremap = 0) AND (winrightonlyremap = 0)
{
    Sendraw, #
}

If (altleftonlyremap = 1) AND (altremap = 1)
{
     SendRaw, <!
}

If (altrightonlyremap = 1) AND (altremap = 1)
{
     SendRaw, >!
}

If (altremap = 1) AND (altleftonlyremap = 0) AND (altrightonlyremap = 0)
{
    Sendraw, !
}



If (hotkeyyesno = 1) AND (remap = 1)
{
sendraw %hotkeyremap% `n
}
}
}

			; Tab 3 (Sounds)
; -----------------------------------
; Set the soundpath if it was entered
; -----------------------------------

if (FSF_A != "")
{
     Sendraw, `n
     Sendraw, Soundplay,, %FSF_A% `n
     ;Sendraw, `n
}



			; Tab 4 (Programs)

GuiControlGet, CheckBoxState,, activatewindow
  If (CheckBoxState = 1) AND (activewindowedit !="")
     {
     BRACKET = YES
     }

GuiControlGet, CheckBoxState,, runprogram
  If (CheckBoxState = 1) AND (editprogram !="")
     {
     BRACKET = YES
     }

;GuiControlGet, CheckBoxState,, runprogram
 ; If (CheckBoxState = 1) AND (editprogram != "")

If (BRACKET = "YES")
{

Sendraw, `n 
SendRaw, { `n
}

GuiControlGet, CheckBoxState,, moveresize
If (CheckBoxState = 1) AND ( (editx !="") OR (edity !="") OR (editw !="") OR (edith !="") )
{
SendRaw, CoordMode, Mouse, Screen `n
}

If (editprogram !="") OR (activewindowedit !="")
{

GuiControlGet, CheckBoxState,, moveresize
  If (CheckBoxState = 1) 
{ 										



If (editx != "") 
{
SendRaw, X=%editx% `n
}

If (edity != "") 
{
SendRaw, Y=%edity% `n
}

If (editw != "") 
{
SendRaw, W=%editw% `n
}

If (edith != "") 
{
SendRaw, H=%editH% `n
}


} 											


GuiControlGet, CheckBoxState,, runprogram
  If (CheckBoxState = 1) 
{
SendRaw, Run, %editprogram% `n
}

GuiControlGet, CheckBoxState,, moveresize
  If (CheckBoxState = 1) AND ( (editx !="") OR (edity !="") OR (editw !="") OR (edith !="") )
     {
SendRaw, WinWait, ahk_class %activewindowedit% `n
SendRaw, WinGet, WinStatus, MinMax, ahk_class %activewindowedit% `n
SendRaw, if (WinStatus != 0) `n
SendRaw, WinRestore, ahk_class %activewindowedit% `n
SendRaw, WinMove, ahk_class %activewindowedit%,,

If (editx != "") 
{
SendInput {Space}
SendRaw, x,
}

If (edity != "") 
{
SendInput {Space}
SendRaw, y,
}

If (editw != "") 
{
SendInput {Space}
SendRaw, w,
}

If (edith != "") 
{
SendInput {Space}
SendRaw, h
}

     }

GuiControlGet, CheckBoxState,, maximize
  If (CheckBoxState = 1)
     { 	
     SendRaw, `n
     SendRaw, WinMaximize, ahk_class %activewindowedit% `n
     }


GuiControlGet, CheckBoxState,, activatewindow
  If (CheckBoxState = 1) AND (activewindowedit !="")
     {
     SendRaw, WinActivate, ahk_class %activewindowedit% `n
     }


  If (BRACKET = "YES")
{
SendRaw, } `n
}

SendRaw, `n
}



			; Tab 2 (Clicks)

; ###################################
; Set the clicks if it was entered
; ###################################

; Click 1 - Left Click

If (CB1 = 1) AND (RBR1 = 0)
{
Sendraw, Send {Click %Edit1%} `n
SendRaw, Sleep 1000 `n
}

; Click 1 - Right Click

If (CB1 = 1) AND (RBR1 = 1)
{
Sendraw, Send, {Click %Edit1% Right} `n
SendRaw, Sleep 1000 `n
}

; Click 2 - Left Click

If (CB2 = 1) AND (RBR2 = 0)
{
;SendRaw, Sleep 1000 `n
Sendraw, Send, {Click %Edit2%} `n
SendRaw, Sleep 1000 `n
}
; Click 2 - Right Click

If (CB2 = 1) AND (RBR2 = 1)
{
;SendRaw, Sleep 1000 `n
Sendraw, Send, {Click %Edit2% Right} `n
SendRaw, Sleep 1000 `n
}

; Click 3 - Left Click

If (CB3 = 1) AND (RBR3 = 0)
{
;SendRaw, Sleep 1000 `n
Sendraw, Send, {Click %Edit3%} `n
SendRaw, Sleep 1000 `n
}

; Click 3 - Right Click

If (CB3 = 1) AND (RBR3 = 1)
{
;SendRaw, Sleep 1000 `n
Sendraw, Send, {Click %Edit3% Right} `n
SendRaw, Sleep 1000 `n
}


			; Tab 5 (Other)

If (othertext != "")
{
SendRaw, `n
SendRaw, %othertext% `n
SendRaw, `n
}
			; End Tabs

If (hotkeyyesno = 1)
{
Sendraw, `n
Sendraw, Return
}

; --------------------------------------------
; Save file to desktop if Filename was entered
; --------------------------------------------

if (Filename != "")
{
     Send, ^s %filename%.ahk
     Send, ^l
     SendRaw, %userprofile%\desktop
     Send, !s
     MsgBox, File %filename% has been saved to the desktop
}

Return

;;;;;;;;;;;;;;;;;;; Problems ;;;;;;;;;;;;;;;;;;;;;;;;;;

; Make the special keys display correctly in the comments section