@echo off
chcp 65001 >nul
echo ================================
echo Flutter Web Files Copy Script
echo ================================
echo.

set SOURCE_DIR=C:\Users\34770\Desktop\pet_management_system\build\web
set TARGET_DIR=%CD%

echo Source: %SOURCE_DIR%
echo Target: %TARGET_DIR%
echo.

echo Checking source directory...
if not exist "%SOURCE_DIR%" (
    echo ERROR: Source directory not found!
    echo Please build web version first: flutter build web --release
    pause
    exit /b 1
)

echo.
echo Starting file copy...

echo 1. Copying main JS files...
if exist "%SOURCE_DIR%\main.dart.js" (
    copy "%SOURCE_DIR%\main.dart.js" "%TARGET_DIR%\" >nul
    echo [OK] main.dart.js
) else (
    echo [FAIL] main.dart.js not found
)

if exist "%SOURCE_DIR%\flutter.js" (
    copy "%SOURCE_DIR%\flutter.js" "%TARGET_DIR%\" >nul
    echo [OK] flutter.js
) else (
    echo [FAIL] flutter.js not found
)

if exist "%SOURCE_DIR%\flutter_service_worker.js" (
    copy "%SOURCE_DIR%\flutter_service_worker.js" "%TARGET_DIR%\" >nul
    echo [OK] flutter_service_worker.js
) else (
    echo [FAIL] flutter_service_worker.js not found
)

echo.
echo 2. Copying other files...
if exist "%SOURCE_DIR%\favicon.png" (
    copy "%SOURCE_DIR%\favicon.png" "%TARGET_DIR%\" >nul
    echo [OK] favicon.png
) else (
    echo [SKIP] favicon.png not found
)

if exist "%SOURCE_DIR%\version.json" (
    copy "%SOURCE_DIR%\version.json" "%TARGET_DIR%\" >nul
    echo [OK] version.json
) else (
    echo [SKIP] version.json not found
)

echo.
echo 3. Copying folders...
if exist "%SOURCE_DIR%\assets" (
    xcopy "%SOURCE_DIR%\assets" "%TARGET_DIR%\assets\" /E /I /Y >nul
    echo [OK] assets/ folder
) else (
    echo [FAIL] assets/ folder not found
)

if exist "%SOURCE_DIR%\canvaskit" (
    xcopy "%SOURCE_DIR%\canvaskit" "%TARGET_DIR%\canvaskit\" /E /I /Y >nul
    echo [OK] canvaskit/ folder
) else (
    echo [FAIL] canvaskit/ folder not found
)

if exist "%SOURCE_DIR%\icons" (
    xcopy "%SOURCE_DIR%\icons" "%TARGET_DIR%\icons\" /E /I /Y >nul
    echo [OK] icons/ folder
) else (
    echo [SKIP] icons/ folder not found
)

echo.
echo ================================
echo Copy completed!
echo ================================
echo.

echo Verifying files...
if exist "%TARGET_DIR%\main.dart.js" (
    for %%A in ("%TARGET_DIR%\main.dart.js") do (
        echo main.dart.js size: %%~zA bytes
    )
) else (
    echo WARNING: main.dart.js copy failed
)

echo.
echo Current directory files:
dir /B *.js *.html *.json *.png 2>nul

echo.
echo Next steps:
echo 1. Check all files copied successfully
echo 2. Run deploy.bat to upload to GitHub
echo 3. Connect repository to Vercel
echo.
pause 