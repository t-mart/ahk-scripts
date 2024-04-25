#Requires AutoHotkey v2.0
#SingleInstance Force

SoundDir := A_ScriptDir "\sounds"
LoadedSound := SoundDir "\script-loaded.mp3"
AnimationDelay := 50

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
; separately. The default delay of 40ms between the down and up seems to work
; reliably.
MHRSend(key, delay:=40) {
    Send "{" key " down}"
    Sleep delay
    Send "{" key " up}"
}

; From the "Confim" screen, accept the current Qurious armor roll and roll again
; with automatically-chosen materials. This is useful for spamming rolls.
;
; Notably, this keybind **accepts** the current roll, overwriting the current
; one. This is helpful because it "saves" the last roll. I find this useful when
; I'm spamming this keybind hundreds of times, and my mind goes blank, and I hit
; a good roll, but then mistakenly roll over it. By the time my brain registers
; the hit, I can just _not_ apply the new roll. Conversely, if you want a
; keybind that doesn't overwrite (e.g., because you like your current roll),
; don't use this keybind, or craft a new piece to save that roll (which might be
; expensive).
;
; To get to the initial state for this keybind:
;
; 1. Talk to the Smithy
; 2. Select "Qurious Armor Crafting"
; 3. Select an armor piece
; 4. Select either of the Augment types
; 5. Select materials and confirm transaction
; 6. You are now at the initial state. Press the keybind to start
;
; Don't start this keybind before the last one has completed: it will possibly
; break the sequencing. But if this does happen, no problem, just get back to
; the initial state.
#HotIf WinActive("ahk_exe MonsterHunterRise.exe")
F9::{
    ; Confirm the current roll
    MHRSend "f"

    ; Move to Yes on "Apply Results" confirmation prompt
    MHRSend "Left"

    ; Confirm the Yes
    MHRSend "f" 

    ; Wait for animation to finish
    Sleep AnimationDelay

    ; Continue augmenting
    MHRSend "f"

    ; Wait for animation to finish
    Sleep AnimationDelay

    ; Confirm the Yes to continue augmenting
    MHRSend "f"

    ; Auto-select materials and put cursor on "Confirm"
    MHRSend "x"

    ; Confirm the materials
    MHRSend "f"

    ; Wait for animation to finish
    Sleep AnimationDelay

    ; Confirm the transaction
    MHRSend "f"
}

; Create 10 of all (8) decorations on a page for 5 pages on the Create
; Decorations screen. This is useful for creating a lot of decorations quickly.
; Partial pages (the last page) will work, but will create more than 10 of those
; decorations.
;
; This keybind assumes you have enough mats to cover the material costs for each
; decoration. No logic is implemented to check for this. I use an item editor to
; hack this in (I ain't gonna farm all that)
;
; Note you can always abort this by pressing F5 to reload the script.
;
; To get to the initial state for this keybind:
;
; 1. Talk to the Smithy
; 2. Select "Decorations"
; 3. Select "Create Decorations"
; 4. (Optional) Head to the page you want to start on
; 5. (Optional) Select the first decoration on the page
; 6. You are now at the initial state. Press the keybind to start
#HotIf WinActive("ahk_exe MonsterHunterRise.exe")
F10::{
    Loop 5 {
        Loop 8 {
            Loop 10 {
                ; Purchase
                MHRSend "f"
    
                ; Wait for animation to finish
                Sleep AnimationDelay
    
                ; Confirm
                MHRSend "f"
    
                ; Wait for animation to finish
                Sleep AnimationDelay
            }
            ; Move to next decoration
            MHRSend "Down"
        }
        ; Move to next page
        MHRSend "Right"
    }
}