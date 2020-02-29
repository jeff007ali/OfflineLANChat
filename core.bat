@echo off
title Chat
color 1b
mode con: cols=60 lines=12

:home
set home=returncode
cls
echo Welcome to Chat room
echo --------------------
echo.
echo 1. Login
echo 2. Create Account
echo 3. Exit
echo.
set /p home=Number: 

if %home%==1 goto login
if %home%==2 goto create
if %home%==3 exit

goto home

:create
cls
echo Welcome to Chat room
echo --------------------
echo.
echo Create an account
echo.
set /p nun=New Username : 
set /p npw=New Password : 
if Exist "Users\%nun%.chatuser" goto create_error

echo user >"Users\%nun%.chatuser"
echo locallocallocal >"Users\locallocallocallocallocal%npw%local%nun%locallocallocallocal.local"

echo.
echo Account Successfully created
ping localhost -n 3 >nul
goto home

:create_error
echo.
echo This username already exists.
echo Please use a different username.
ping localhost -n 3 >nul
goto create

:login
cls
echo Welcome to Chat room
echo --------------------
echo.
echo Login to your account
echo.
set /p un=Username : 
set /p pw=Password : 

if NOT Exist "Users\%un%.chatuser" goto login_error
if NOT Exist "Users\locallocallocallocallocal%pw%local%un%locallocallocallocal.local" goto login_error

goto chat_with

:login_error
echo.
echo Username or Password you entered is incorrect!
ping localhost -n 3 >nul
goto login

:chat_with
cls
echo Welcome to Chat Room
echo --------------------
echo.
set /p aun=%un% with whom do you want to chat with : 

if NOT Exist "Users\%aun%.chatuser" goto chat_with_error

start Program_Files\chatviewer.bat  %un% %aun%
goto chat_return

:chat_with_error
echo.
echo User doesn't exist!
ping localhost -n 3 >nul
goto chat_with

:chat_return
cls
echo Welcome to Chat Room
echo --------------------
echo.
set /p text=%un% says to %aun% : 
echo %un%(%aun%): %text% >>"Program_Files\chatroom.chat"
goto chat_return
