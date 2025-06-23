@echo off
echo ================================
echo Chrome Version Files Checker
echo ================================
echo.

set ERROR_COUNT=0

echo Checking core files...
if exist "main.dart.js" (
    for %%A in ("main.dart.js") do (
        echo [OK] main.dart.js - Size: %%~zA bytes
    )
) else (
    echo [FAIL] main.dart.js missing - This is the most important file!
    set /a ERROR_COUNT+=1
)

if exist "flutter.js" (
    echo [OK] flutter.js
) else (
    echo [FAIL] flutter.js missing
    set /a ERROR_COUNT+=1
)

if exist "flutter_service_worker.js" (
    echo [OK] flutter_service_worker.js
) else (
    echo [FAIL] flutter_service_worker.js missing
    set /a ERROR_COUNT+=1
)

echo.
echo Checking resource folders...
if exist "assets\" (
    echo [OK] assets/ folder
) else (
    echo [FAIL] assets/ folder missing
    set /a ERROR_COUNT+=1
)

if exist "canvaskit\" (
    echo [OK] canvaskit/ folder
) else (
    echo [FAIL] canvaskit/ folder missing
    set /a ERROR_COUNT+=1
)

echo.
echo Checking configuration files...
if exist "favicon.png" (
    echo [OK] favicon.png
) else (
    echo [SKIP] favicon.png missing (optional)
)

if exist "version.json" (
    echo [OK] version.json
) else (
    echo [SKIP] version.json missing (optional)
)

if exist "index.html" (
    echo [OK] index.html
) else (
    echo [FAIL] index.html missing
    set /a ERROR_COUNT+=1
)

if exist "flutter_bootstrap.js" (
    echo [OK] flutter_bootstrap.js
) else (
    echo [FAIL] flutter_bootstrap.js missing
    set /a ERROR_COUNT+=1
)

if exist "vercel.json" (
    echo [OK] vercel.json (deployment config)
) else (
    echo [SKIP] vercel.json missing (recommended for Vercel)
)

echo.
echo ================================
if %ERROR_COUNT%==0 (
    echo [SUCCESS] All required files are present!
    echo Ready for Vercel deployment
) else (
    echo [ERROR] Missing %ERROR_COUNT% important files
    echo Please run copy_files_clean.bat to copy missing files
)
echo ================================

echo.
echo File summary:
echo -------------
dir /B *.js *.html *.json *.png 2>nul | find /V /C "" && echo files found || echo No files found

echo.
echo Folder summary:
echo ---------------
if exist "assets\" echo assets/ folder exists
if exist "canvaskit\" echo canvaskit/ folder exists
if exist "icons\" echo icons/ folder exists

echo.
pause 