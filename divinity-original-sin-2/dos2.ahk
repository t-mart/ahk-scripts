#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; Unfortunate, but DoS2 runs as admin, so we also need it for hotkeys to work
if not (A_IsAdmin)
{
    Run '*RunAs "' A_ScriptFullPath '" /restart'
}

SoundDir := A_ScriptDir "\sounds"
LoadedSound := SoundDir "\script-loaded.mp3"

SoundPlay(LoadedSound)

F6::
{
    Reload
}

; all hotkeys below can only be activated if the game is active
#HotIf WinActive("ahk_exe EoCApp.exe")

; identify something at a merchant, to help with large numbers of items.
; first, press the identify button (magnifying glass icon) in the bottom right
; then, press this hotkey (Alt+X). this hotkey will click to identify the item,
; accept the prompt, and return the mouse to where it was before.
!x::
{
    Click
    oldX := 0
    oldY := 0
  
    MouseGetPos(&oldX, &oldY)
  
    MouseMove(952, 615)
    Sleep 50
    Click
  
    MouseMove(oldX, oldY)
}