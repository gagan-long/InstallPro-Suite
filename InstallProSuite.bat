@echo off
:: InstallPro Suite - Batch Installer
:: Installs all EXE and MSI files from a specified folder silently and logs results.

set "INSTALL_DIR=%~dp0Installers"
set "LOG_FILE=%~dp0installpro_log.txt"

echo ================================================== > "%LOG_FILE%"
echo InstallPro Suite - Batch Installation Log           >> "%LOG_FILE%"
echo Date: %DATE% Time: %TIME%                           >> "%LOG_FILE%"
echo Target Folder: %INSTALL_DIR%                        >> "%LOG_FILE%"
echo ================================================== >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"

if not exist "%INSTALL_DIR%" (
    echo [ERROR] Installer folder not found: %INSTALL_DIR%
    echo Please create a folder named 'Installers' in the same directory as this script.
    pause
    exit /b
)

echo Starting batch installation from: %INSTALL_DIR%"
echo.

:: Install all MSI files
for %%f in ("%INSTALL_DIR%\*.msi") do (
    echo Installing: %%~nxf
    msiexec /i "%%f" /qn /norestart /l*v "%LOG_FILE%"
    if !errorlevel! equ 0 (
        echo [SUCCESS] %%~nxf installed successfully. >> "%LOG_FILE%"
    ) else (
        echo [ERROR] %%~nxf failed to install. >> "%LOG_FILE%"
    )
    echo.
)

:: Install all EXE files (try common silent switches)
for %%f in ("%INSTALL_DIR%\*.exe") do (
    echo Installing: %%~nxf
    "%%f" /S /quiet /norestart >> "%LOG_FILE%" 2>&1
    if !errorlevel! equ 0 (
        echo [SUCCESS] %%~nxf installed successfully. >> "%LOG_FILE%"
    ) else (
        echo [ERROR] %%~nxf failed to install. >> "%LOG_FILE%"
    )
    echo.
)

echo ================================================== >> "%LOG_FILE%"
echo Batch installation completed at %TIME%.            >> "%LOG_FILE%"
echo ================================================== >> "%LOG_FILE%"

echo All installations completed. Check installpro_log.txt for details.
pause
