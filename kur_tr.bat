@echo off
TITLE Gemma 4 - Tek Tikla Otomatik Kurulum (16GB VRAM)
SETLOCAL EnableDelayedExpansion
color 0b

:: --- YAPILANDIRMA ---
set "BIN_URL=https://github.com"
set "MODEL_URL=https://huggingface.co"
set "MODEL_NAME=gemma-4-31b-IQ3_XXS.gguf"

echo ========================================================
echo   GEMMA 4 TURBOQUANT OTOMATIK KURULUM VE BASLATMA
echo ========================================================

:: 1. Adim: Dosya kontrolu
if not exist "llama-server.exe" (
    echo [1/3] Gerekli dosyalar bulunamadi. Indiriliyor...
    powershell -Command "Invoke-WebRequest -Uri '%BIN_URL%' -OutFile 'llama_bin.zip'"
    echo [OK] Indirildi. Dosyalar cikartiliyor...
    powershell -Command "Expand-Archive -Path 'llama_bin.zip' -DestinationPath '.' -Force"
    del llama_bin.zip
)

:: 2. Adim: Model kontrolu
if not exist "%MODEL_NAME%" (
    echo [2/3] Gemma 4 Modeli indiriliyor (Yaklasik 13GB)...
    powershell -Command "Invoke-WebRequest -Uri '%MODEL_URL%' -OutFile '%MODEL_NAME%'"
    echo [OK] Model indirildi.
)

:: 3. Adim: Baslatma
echo [3/3] Sistem baslatiliyor...
echo Tarayicini ac ve bu adrese git: http://localhost:8080
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
