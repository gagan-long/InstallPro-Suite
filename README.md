<!-- Banner/logo section (optional, add your own logo if available) -->
<p align="center">
  <img src="logo.png" height="30px" width="60px" alt="InstallPro Suite Logo" />
</p>

<h1 align="center">InstallPro Suite</h1>
<p align="center">
  <b>Professional Batch Installer for Windows</b><br>
  <i>Automate. Deploy. Relax.</i>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#customization">Customization</a> •
  <a href="#troubleshooting">Troubleshooting</a> •
  <a href="#license">License</a>
</p>

---

## 📝 Overview

**InstallPro Suite** is a robust batch installer tool for Windows. Effortlessly install multiple applications and drivers from a single folder using silent/default settings. Ideal for IT professionals, system administrators, and anyone seeking fast, unattended software deployment.

---

## ✨ Features

- **Batch Installation:** Installs all `.exe` and `.msi` files in one go.
- **Silent Operation:** Uses default silent switches for seamless, unattended installation.
- **Professional Logging:** Generates a detailed installation log (`installpro_log.txt`).
- **Easy Setup:** Just place your installers in the `Installers` folder and run the script.
- **Customizable:** Easily extend to support drivers or custom install switches.

---

## 📦 Installation

1. **Download the Script:**  
   Save the batch script as `InstallProSuite.bat` in your chosen directory.

2. **Prepare the Installers Folder:**  
   - Create a folder named `Installers` in the same directory as the script.
   - Place all `.exe` and `.msi` installers you wish to deploy into this folder.

---

## ▶️ Usage

1. **Run as Administrator:**  
   Right-click `InstallProSuite.bat` and select **Run as administrator**.

2. **Automated Installation:**  
   The tool will scan the `Installers` folder and install each application silently.

3. **Review the Log:**  
   After completion, open `installpro_log.txt` to review detailed results and statuses.

---

## 🗂️ Directory Structure Example

C:
├── InstallProSuite.bat
├── installpro_log.txt
└── Installers
    ├── ChromeSetup.exe
    ├── 7zip.msi
    └── NVIDIA_Driver.inf


---

## ⚙️ Customization

- **Silent Switches:**  
  The script uses `/S /quiet /norestart` for `.exe` and `/qn /norestart` for `.msi`.  
  Edit the script if your installers require different options.

- **Driver Installation:**  
  To add support for `.inf` drivers, append this block after the `.exe` section:

:: Install all INF drivers
for %%f in ("%INSTALL_DIR%*.inf") do (
echo Installing driver: %%~nxf
pnputil /add-driver "%%f" /install >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
echo [SUCCESS] %%~nxf driver installed successfully. >> "%LOG_FILE%"
) else (
echo [ERROR] %%~nxf driver failed to install. >> "%LOG_FILE%"
)
echo.
)


---

## 🛠️ Troubleshooting

- **Script Not Running:**  
Ensure you have administrator privileges.
- **Installer Not Silent:**  
Some installers may not support the default silent switches. Check vendor documentation for the correct options.
- **Log Not Created:**  
Confirm write permissions in the script directory.

---

## 🙏 Acknowledgments

- Inspired by best practices in deployment automation.
- Professional README structure inspired by [Best-README-Template][1] and [Professional README Guide][2].

---

## 📄 License

InstallPro Suite is free for personal and professional use.  
No warranty provided. Use at your own risk.

---

<p align="center"><i>Automate. Deploy. Relax. — With InstallPro Suite!</i></p>
