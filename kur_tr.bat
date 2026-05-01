@echo off
TITLE Gemma 4 - Tek Tikla Otomatik Kurulum (16GB VRAM)
SETLOCAL EnableDelayedExpansion
color 0b

:: --- YAPILANDIRMA ---
:: Not: URL'leri tırnak içinde tutuyoruz
set "BIN_URL=https://github.com"
set "MODEL_URL=https://huggingface.co"
set "MODEL_NAME=gemma-4-31b-IQ3_XXS.gguf"

echo ========================================================
echo   GEMMA 4 TURBOQUANT OTOMATIK KURULUM VE BASLATMA
echo ========================================================

:: 1. Adim: Dosya kontrolu ve Guvenli Indirme
if not exist "llama-server.exe" (
    echo [1/3] Gerekli dosyalar bulunamadi. Indiriliyor...
    :: TLS 1.2 zorlamasi ve guvenli indirme
    powershell -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('%BIN_URL%', 'llama_bin.zip')"
    
    if exist "llama_bin.zip" (
        echo [OK] Indirildi. Dosyalar cikartiliyor...
        powershell -ExecutionPolicy Bypass -Command "Expand-Archive -Path 'llama_bin.zip' -DestinationPath '.' -Force"
        del llama_bin.zip
    ) else (
        echo HATA: Zip dosyasi indirilemedi. Internet baglantinizi kontrol edin.
        pause
        exit /b
    )
)

:: 2. Adim: Model kontrolu
if not exist "%MODEL_NAME%" (
    echo [2/3] Gemma 4 Modeli indiriliyor (Yaklasik 13GB)...
    echo Bu islem uzun surebilir, lutfen pencereyi kapatmayin.
    powershell -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('%MODEL_URL%', '%MODEL_NAME%')"
    echo [OK] Model indirildi.
)

:: 3. Adim: Baslatma
echo [3/3] Sistem baslatiliyor...
echo Tarayicini ac ve bu adrese git: http://localhost:8080
echo.

:: Komutu tirnak icinde calistirarak "unexpected" hatasini onluyoruz
"llama-server.exe" ^
  -m "%MODEL_NAME%" ^
  -ngl 99 ^
  -kvalue turbo4 ^
  -vvalue turbo4 ^
  -np 1 ^
  --flash-attn ^
  --ctx-size 16384 ^
  --port 8080 ^
  --mlock

pause
