@echo off
setlocal

cd /d "%~dp0"

echo ========================================
echo        OFFLINE CODE GENERATOR
echo ========================================
echo.

if not exist "engine\llama-cli.exe" (
    echo ERROR: llama-cli.exe was not found.
    echo.
    echo Expected:
    echo engine\llama-cli.exe
    echo.
    pause
    exit /b 1
)

if not exist "models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf" (
    echo ERROR: Model file was not found.
    echo.
    echo Expected:
    echo models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
    echo.
    pause
    exit /b 1
)

if not exist "prompts\system.txt" (
    echo ERROR: System prompt was not found.
    echo.
    echo Expected:
    echo prompts\system.txt
    echo.
    pause
    exit /b 1
)

echo Model found.
echo Engine found.
echo Starting terminal...
echo.

engine\llama-cli.exe ^
    -m "models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf" ^
    -c 8192 ^
    -n 4096 ^
    --temp 0.2 ^
    --top-p 0.9 ^
    --system-prompt-file "prompts\system.txt"

pause