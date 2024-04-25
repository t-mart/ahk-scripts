#Requires AutoHotkey v2.0
#SingleInstance Force

SoundDir := A_ScriptDir "\sounds"
LoadedSound := SoundDir "\script-loaded.mp3"

; Audibly let us know we've loaded or reloaded.
SoundPlay(LoadedSound)

; When F5 is pressed, reload the script. This is useful for
; debugging/development/testing.
F5::
{
    Reload
}

; MHR is wierd in that I can't seem to send streams of characters with "Send"
; but, we can work around that by: sending the key down, sleeping, then up
; separately. 40ms of delay between the down and up seems to work reliably.
MHRSend(key) {
    Send "{" key " down}"
    Sleep 40
    Send "{" key " up}"
}

; From the "Confim" screen, accept the current Qurious armor roll and roll again
; with automatically-chosen materials. This is useful for spamming rolls.
;
; To get to the initial state for this script:
;
; 1. Head to the Smithy
; 2. Select "Qurious Armor Crafting"
; 3. Select an armor piece
; 4. Select either of the Augment types
; 5. Select materials and confirm
; 6. Press this keybind to start the script
;
; Don't start this keybind before the last one has completed: it will possibly
; break the script. But if it does, no problem, just get back to the initial
; state.
#HotIf WinActive("ahk_exe MonsterHunterRise.exe")
F9::{
    MHRSend "f"
    MHRSend "Left"
    MHRSend "f"
    Sleep 50 ; wait for the animation to finish
    MHRSend "f"
    Sleep 50 ; wait for the animation to finish
    MHRSend "f"
    MHRSend "x"
    MHRSend "f"
    Sleep 50 ; wait for the animation to finish
    MHRSend "f"
}
