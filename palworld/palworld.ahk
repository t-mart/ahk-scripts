#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

SoundDir := A_ScriptDir "\sounds"
LoadedSound := SoundDir "\script-loaded.mp3"
FHeldSound := SoundDir "\f-held.mp3"
FReleasedSound := SoundDir "\f-released.mp3"


SoundPlay(LoadedSound)

; When F7 is pressed, reload the script.
F7::
{
    Reload
}

#HotIf WinActive("ahk_exe  Palworld-Win64-Shipping.exe")
; When F5 is pressed, send the F key down event.
F5::{
    SendInput "{F down}"
    SoundPlay(FHeldSound)
}

; When F6 is pressed, send the F key up event.
F6::{
    SendInput "{F up}"
    SoundPlay(FReleasedSound)
}
