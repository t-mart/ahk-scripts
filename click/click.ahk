#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

ClickWithDelay(delay) {
    Click
    Sleep delay
}

ClickN(times, delay:=40) {
    Loop times {
        ClickWithDelay(delay)
    }
}

F1::ClickN(10)

F2::ClickN(100)

F4::Reload()
