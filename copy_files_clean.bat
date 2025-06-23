@echo off
echo ================================
echo Flutter Web Files Copy Script
echo ================================
echo.

set SOURCE_DIR=C:\Users\34770\Desktop\pet_management_system\build\web
set TARGET_DIR=%CD%

echo Source Directory: %SOURCE_DIR%
echo Target Directory: %TARGET_DIR%
echo.

echo Checking source directory...
if not exist "%SOURCE_DIR%" (
    echo ERROR: Source directory not found!
    echo Please build web version first:
    echo flutter build web --release
    pause
    exit /b 1
)

echo.
echo Starting file copy process...

echo.
echo Step 1: Copying main JavaScript files...
if exist "%SOURCE_DIR%\main.dart.js" (
    copy "%SOURCE_DIR%\main.dart.js" "%TARGET_DIR%\" >nul
    echo [OK] main.dart.js copied
) else (
    echo [FAIL] main.dart.js not found
)

if exist "%SOURCE_DIR%\flutter.js" (
    copy "%SOURCE_DIR%\flutter.js" "%TARGET_DIR%\" >nul
    echo [OK] flutter.js copied
) else (
    echo [FAIL] flutter.js not found
)

if exist "%SOURCE_DIR%\flutter_service_worker.js" (
    copy "%SOURCE_DIR%\flutter_service_worker.js" "%TARGET_DIR%\" >nul
    echo [OK] flutter_service_worker.js copied
) else (
    echo [FAIL] flutter_service_worker.js not found
)

echo.
echo Step 2: Copying additional files...
if exist "%SOURCE_DIR%\favicon.png" (
    copy "%SOURCE_DIR%\favicon.png" "%TARGET_DIR%\" >nul
    echo [OK] favicon.png copied
) else (
    echo [SKIP] favicon.png not found
)

if exist "%SOURCE_DIR%\version.json" (
    copy "%SOURCE_DIR%\version.json" "%TARGET_DIR%\" >nul
    echo [OK] version.json copied
) else (
    echo [SKIP] version.json not found
)

echo.
echo Step 3: Copying directories...
if exist "%SOURCE_DIR%\assets" (
    xcopy "%SOURCE_DIR%\assets" "%TARGET_DIR%\assets\" /E /I /Y >nul
    echo [OK] assets/ directory copied
) else (
    echo [FAIL] assets/ directory not found
)

if exist "%SOURCE_DIR%\canvaskit" (
    xcopy "%SOURCE_DIR%\canvaskit" "%TARGET_DIR%\canvaskit\" /E /I /Y >nul
    echo [OK] canvaskit/ directory copied
) else (
    echo [FAIL] canvaskit/ directory not found
)

if exist "%SOURCE_DIR%\icons" (
    xcopy "%SOURCE_DIR%\icons" "%TARGET_DIR%\icons\" /E /I /Y >nul
    echo [OK] icons/ directory copied
) else (
    echo [SKIP] icons/ directory not found
)

echo.
echo ================================
echo Copy process completed!
echo ================================
echo.

echo Verifying copied files...
if exist "%TARGET_DIR%\main.dart.js" (
    for %%A in ("%TARGET_DIR%\main.dart.js") do (
        echo main.dart.js file size: %%~zA bytes
    )
) else (
    echo WARNING: main.dart.js copy failed!
)

echo.
echo Files in current directory:
dir /B *.js *.html *.json *.png 2>nul

echo.
echo NEXT STEPS:
echo 1. Verify all files copied successfully
echo 2. Run deploy.bat to upload to GitHub
echo 3. Connect repository to Vercel
echo 4. Deploy on Vercel platform
echo.
pause 