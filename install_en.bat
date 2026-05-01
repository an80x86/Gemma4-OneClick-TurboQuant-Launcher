@echo off
TITLE Gemma 4 - One-Click Automated Installer (16GB VRAM)
SETLOCAL EnableDelayedExpansion
color 0a

:: --- CONFIGURATION ---
set "BIN_URL=https://github.com"
set "MODEL_URL=https://huggingface.co"
set "MODEL_NAME=gemma-4-31b-IQ3_XXS.gguf"

echo ========================================================
echo   GEMMA 4 TURBOQUANT AUTOMATIC INSTALLER & LAUNCHER
echo ========================================================

:: Step 1: Binary Check
if not exist "llama-server.exe" (
    echo [1/3] llama.cpp binaries not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri '%BIN_URL%' -OutFile 'llama_bin.zip'"
    echo [OK] Download complete. Extracting files...
    powershell -Command "Expand-Archive -Path 'llama_bin.zip' -DestinationPath '.' -Force"
    del llama_bin.zip
)

:: Step 2: Model Check
if not exist "%MODEL_NAME%" (
    echo [2/3] Downloading Gemma 4 Model (Approx. 13GB)...
    powershell -Command "Invoke-WebRequest -Uri '%MODEL_URL%' -OutFile '%MODEL_NAME%'"
    echo [OK] Model download complete.
)

:: Step 3: Launch
echo [3/3] Starting the system...
echo Open your browser and go to: http://localhost:8080
echo.

llama-server.exe ^
  -m %MODEL_NAME% ^
  -ngl 99 ^
  -kvalue turbo4 ^
  -vvalue turbo4 ^
  --cache-type-k turbo4 ^
  --cache-type-v turbo4 ^
  -np 1 ^
  --flash-attn ^
  --ctx-size 16384 ^
  --port 8080 ^
  --mlock

pause
