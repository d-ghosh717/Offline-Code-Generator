@echo off
setlocal EnableExtensions EnableDelayedExpansion

cd /d "%~dp0"

title Offline Code Generator - Web

set "SERVER=engine\llamafile-0.10.5.exe"
set "MODEL=models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf"
set "HOST=127.0.0.1"
set "PORT=8081"

cls

echo ============================================================
echo                 OFFLINE CODE GENERATOR
echo                       WEB MODE
echo ============================================================
echo.

REM ------------------------------------------------------------
REM Check server
REM ------------------------------------------------------------

if not exist "%SERVER%" (
    echo ERROR: llamafile-0.10.5.exe was not found.
    echo.
    echo Expected:
    echo %SERVER%
    echo.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Check model
REM ------------------------------------------------------------

if not exist "%MODEL%" (
    echo ERROR: Model file was not found.
    echo.
    echo Expected:
    echo %MODEL%
    echo.
    pause
    exit /b 1
)

echo Server  : %SERVER%
echo Model   : %MODEL%
echo.

REM ------------------------------------------------------------
REM Find an available port
REM ------------------------------------------------------------

:CHECK_PORT

echo Checking port %PORT%...

netstat -ano | findstr /R /C:":%PORT% .*LISTENING" >nul

if not errorlevel 1 (
    echo Port %PORT% is already in use.
    echo Trying another port...
    echo.

    set /a PORT+=1

    goto CHECK_PORT
)

echo Port %PORT% is available.
echo.

REM ------------------------------------------------------------
REM Start server
REM ------------------------------------------------------------

echo Starting local AI server...
echo.
echo Server URL:
echo http://%HOST%:%PORT%
echo.

start "" "%SERVER%" ^
    --server ^
    --model "%MODEL%" ^
    --no-mmap ^
    -c 4096 ^
    -np 1 ^
    --host %HOST% ^
    --port %PORT%

REM ------------------------------------------------------------
REM Wait for server
REM ------------------------------------------------------------

echo Waiting for server to become ready...

set /a ATTEMPTS=0

:WAIT_SERVER

set /a ATTEMPTS+=1

if !ATTEMPTS! GEQ 60 (
    echo.
    echo ERROR: Server did not become ready within 60 seconds.
    echo.
    echo Check the server window for details.
    pause
    exit /b 1
)

powershell -NoProfile -Command ^
    "$r = try { Invoke-WebRequest -Uri 'http://%HOST%:%PORT%/health' -UseBasicParsing -TimeoutSec 2 } catch { $null }; if ($r -and $r.StatusCode -eq 200) { exit 0 } else { exit 1 }"

if errorlevel 1 (
    timeout /t 1 /nobreak >nul
    goto WAIT_SERVER
)

echo.
echo ============================================================
echo                    SERVER READY
echo ============================================================
echo.
echo Opening:
echo http://%HOST%:%PORT%
echo.

start "" "http://%HOST%:%PORT%"

echo.
echo The AI server is running.
echo Close the server window when finished.
echo.

pause