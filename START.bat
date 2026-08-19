@echo off
setlocal

cd /d "%~dp0"

cls

echo ========================================
echo          OFFLINE CODE GENERATOR
echo ========================================
echo.
echo [1] Terminal Mode
echo [2] Web Mode
echo [3] Exit
echo.

choice /c 123 /n /m "Select: "

if errorlevel 3 exit /b
if errorlevel 2 goto WEB
if errorlevel 1 goto TERMINAL

:TERMINAL
call TERMINAL.bat
exit /b

:WEB
call WEB.bat
exit /b