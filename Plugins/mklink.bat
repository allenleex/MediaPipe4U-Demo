@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
 
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
 
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
 
    "%temp%\getadmin.vbs"
    exit /B
 
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


set DIR="F:\3D_Works\UE\MediaPipe4U\Build"

mklink /D "%~dp0MediaPipe4U" "%DIR%\MediaPipe4U"
mklink /D "%~dp0MediaPipe4UGStreamer" "%DIR%\MediaPipe4UGStreamer"
mklink /D "%~dp0GStreamer" "%DIR%\GStreamer"
mklink /D "%~dp0MediaPipe4ULiveLink" "%DIR%\MediaPipe4ULiveLink"
mklink /D "%~dp0MediaPipe4UBVH" "%DIR%\MediaPipe4UBVH"
mklink /D "%~dp0MediaPipe4UNvAR" "%DIR%\MediaPipe4UNvAR"

pause > nul