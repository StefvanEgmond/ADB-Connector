@echo off
C:
cd %USERPROFILE%\AppData\Local\Android\Sdk\platform-tools

:MENU

CLS

ECHO.
ECHO ..................................................
ECHO PRESS 1, 2 OR 3 to select your task, or 9 to EXIT.
ECHO ..................................................
ECHO.
ECHO 1 - Start ADB (USB)
ECHO 2 - Stop ADB (USB)
ECHO 3 - Check status
ECHO 9 - EXIT
ECHO.

SET /P M=Type 1, 2 or 9 then press ENTER: 

IF %M%==1 GOTO START
IF %M%==2 GOTO STOP
IF %M%==3 GOTO STATUS
IF %M%==9 GOTO EOF


:START
adb usb
ECHO ADB over USB started
PAUSE
GOTO MENU

:STOP
adb kill-server
ECHO ADB server killed
PAUSE
GOTO MENU

:STATUS
adb devices -l | find "device product:" >nul
if errorlevel 1 (
    echo No connected devices
) else (
    echo Device connected 
)
PAUSE
GOTO MENU
