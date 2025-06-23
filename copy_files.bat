@echo off
echo ================================
echo 自动复制Flutter Web文件
echo ================================
echo.

set SOURCE_DIR=C:\Users\34770\Desktop\pet_management_system\build\web
set TARGET_DIR=%CD%

echo 源目录: %SOURCE_DIR%
echo 目标目录: %TARGET_DIR%
echo.

echo 检查源目录是否存在...
if not exist "%SOURCE_DIR%" (
    echo 错误: 源目录不存在！
    echo 请确保原始项目已构建Web版本
    echo 运行: flutter build web --release
    pause
    exit /b 1
)

echo.
echo 开始复制文件...

echo 1. 复制主要JS文件...
if exist "%SOURCE_DIR%\main.dart.js" (
    copy "%SOURCE_DIR%\main.dart.js" "%TARGET_DIR%\"
    echo ✅ main.dart.js
) else (
    echo ❌ main.dart.js 不存在
)

if exist "%SOURCE_DIR%\flutter.js" (
    copy "%SOURCE_DIR%\flutter.js" "%TARGET_DIR%\"
    echo ✅ flutter.js
) else (
    echo ❌ flutter.js 不存在
)

if exist "%SOURCE_DIR%\flutter_service_worker.js" (
    copy "%SOURCE_DIR%\flutter_service_worker.js" "%TARGET_DIR%\"
    echo ✅ flutter_service_worker.js
) else (
    echo ❌ flutter_service_worker.js 不存在
)

echo.
echo 2. 复制其他文件...
if exist "%SOURCE_DIR%\favicon.png" (
    copy "%SOURCE_DIR%\favicon.png" "%TARGET_DIR%\"
    echo ✅ favicon.png
) else (
    echo ❌ favicon.png 不存在
)

if exist "%SOURCE_DIR%\version.json" (
    copy "%SOURCE_DIR%\version.json" "%TARGET_DIR%\"
    echo ✅ version.json
) else (
    echo ❌ version.json 不存在
)

echo.
echo 3. 复制文件夹...
if exist "%SOURCE_DIR%\assets" (
    xcopy "%SOURCE_DIR%\assets" "%TARGET_DIR%\assets\" /E /I /Y
    echo ✅ assets/ 文件夹
) else (
    echo ❌ assets/ 文件夹不存在
)

if exist "%SOURCE_DIR%\canvaskit" (
    xcopy "%SOURCE_DIR%\canvaskit" "%TARGET_DIR%\canvaskit\" /E /I /Y
    echo ✅ canvaskit/ 文件夹
) else (
    echo ❌ canvaskit/ 文件夹不存在
)

if exist "%SOURCE_DIR%\icons" (
    xcopy "%SOURCE_DIR%\icons" "%TARGET_DIR%\icons\" /E /I /Y
    echo ✅ icons/ 文件夹
) else (
    echo ❌ icons/ 文件夹不存在，跳过
)

echo.
echo ================================
echo 复制完成！
echo ================================
echo.

echo 验证文件...
if exist "%TARGET_DIR%\main.dart.js" (
    for %%A in ("%TARGET_DIR%\main.dart.js") do (
        echo main.dart.js 大小: %%~zA 字节
    )
) else (
    echo ⚠️ 警告: main.dart.js 复制失败
)

echo.
echo 当前目录文件列表:
dir /B *.js *.html *.json *.png

echo.
echo 🎯 下一步:
echo 1. 检查所有文件是否复制成功
echo 2. 运行 deploy.bat 部署到GitHub
echo 3. 在Vercel中连接仓库并部署
echo.
pause 