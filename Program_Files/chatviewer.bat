@echo off
title Chat Viewer
color 1b
mode con: cols=60 lines=30

:start
cls
set fu=%~1
set su=%~2
findstr /i "%fu%(%su%): %su%(%fu%): " "Program_Files\chatroom.chat" 
ping localhost -n 3 >nul
goto start