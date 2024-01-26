#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_class POEWindowClass")
SendMode "Input"

SoundDir := A_ScriptDir "\sounds"
ClickSound := SoundDir "\click.wav"
MacroOnSound := SoundDir "\flask-macro-on.mp3"
MacroOffSound := SoundDir "\flask-macro-off.mp3"

MacroIsOn := true

PlayMacroState() {
    if MacroIsOn
    {
        SoundPlay(MacroOnSound)
    }
    else
    {
        SoundPlay(MacroOffSound)
    }
}

PlayMacroState() ; on load

$1::
!::
{
    if !MacroIsOn
    {
        Send 1
        return
    }

    SoundPlay(ClickSound)

    Loop Parse "12345" {
        Send A_LoopField
        if A_LoopField != "5"
        {
            Sleep(Random(15, 25))
        }
    }
}

F4::
{
    global MacroIsOn
    if MacroIsOn
    {
        MacroIsOn := false
    }
    else
    {
        MacroIsOn := true
    }
    PlayMacroState()
}

F5::
{
    Reload
}
