# 🚀 Gemma 4 TurboQuant - One-Click Installer for Windows

[![License: MIT](https://shields.io)](https://opensource.org)
[![Model: Gemma-4-31B](https://shields.io)](https://huggingface.co)

[Türkçe sürüm için aşağı kaydırın / Scroll down for Turkish version]

This project provides an automated, one-click solution to run **Gemma 4 31B** (and other variants) on 16GB VRAM GPUs (like RTX 4080/4090 Laptop) using **TurboQuant KV Cache** technology for maximum performance and context window.

---

## 🌟 Features (EN)
- **Zero Configuration:** Automatically downloads the correct `llama.cpp` TurboQuant build and the optimized GGUF model.
- **TurboQuant KV Cache:** Compresses memory usage by up to 4x, allowing large models to fit into 16GB VRAM.
- **High Performance:** Pre-configured with Flash Attention and SWA optimizations for RTX 40-series cards.
- **Web UI Included:** Accessible via any browser at `localhost:8080`.

## 🛠️ How to Run
1. Ensure your **NVIDIA Drivers** are up to date.
2. Download `run_gemma4.bat` from this repository.
3. Double-click the `.bat` file. 
   * *Note: It will download approximately 13GB of data on the first run.*
4. Once the server starts, open your browser and go to: `http://localhost:8080`

---

## 🌟 Özellikler (TR)
- **Sıfır Yapılandırma:** Doğru `llama.cpp` TurboQuant sürümünü ve optimize edilmiş GGUF modelini otomatik olarak indirir.
- **TurboQuant KV Cache:** Bellek kullanımını 4 kata kadar sıkıştırarak 31B gibi dev modellerin 16GB VRAM'e sığmasını sağlar.
- **Yüksek Performans:** RTX 40 serisi kartlar için Flash Attention ve SWA optimizasyonları ile önceden yapılandırılmıştır.
- **Web Arayüzü:** Herhangi bir tarayıcı üzerinden `localhost:8080` adresinden erişilebilir.

## 🛠️ Nasıl Çalıştırılır?
1. **NVIDIA Sürücülerinizin** güncel olduğundan emin olun.
2. Bu depodaki `run_gemma4.bat` dosyasını indirin.
3. `.bat` dosyasına çift tıklayın. 
   * *Not: İlk çalıştırmada yaklaşık 13GB veri indirilecektir.*
4. Sunucu başladığında tarayıcınızı açın ve şu adrese gidin: `http://localhost:8080`

---

## ⚙️ Technical Details / Teknik Detaylar


| Feature | Parameter | Description |
| :--- | :--- | :--- |
| **Model** | `Gemma-4-31B-IQ3_XXS` | High intelligence, 16GB VRAM friendly |
| **KV Cache** | `turbo4` | TurboQuant 4-bit compression |
| **Context Size** | `16384` | Stable 16K context window |
| **Backend** | `CUDA` | Optimized for NVIDIA GPUs |

### ⚠️ Troubleshooting / Hata Ayıklama
- **Out of Memory (OOM):** If you experience crashes, edit the `.bat` file and change `turbo4` to `turbo3`.
- **OOM Hatası:** Eğer bellek hatası alırsanız, `.bat` dosyasını düzenleyip `turbo4` değerini `turbo3` yapın.
- **Performance:** Ensure no other VRAM-heavy applications (like games) are running.
- **Performans:** Arka planda oyun gibi VRAM tüketen uygulamaların kapalı olduğundan emin olun.

---
*Developed for the AI community. Feel free to contribute!*
