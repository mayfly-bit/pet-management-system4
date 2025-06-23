@echo off
echo ================================
echo 宠物管理系统 Chrome版本部署脚本
echo ================================
echo.

echo 当前目录: %CD%
echo.

echo 1. 初始化Git仓库...
git init

echo.
echo 2. 添加所有Web文件...
git add .

echo.
echo 3. 提交更改...
git commit -m "宠物管理系统Chrome版本 - 生产就绪的Web应用"

echo.
echo 4. 设置远程仓库...
set /p REPO_URL="请输入GitHub仓库地址(例如: https://github.com/username/pet-management-web.git): "
git remote add origin %REPO_URL%

echo.
echo 5. 推送到GitHub...
git branch -M main
git push -u origin main

echo.
if %ERRORLEVEL% NEQ 0 (
    echo 推送失败，尝试强制推送...
    git push --force-with-lease origin main
)

echo.
echo ================================
echo 部署完成！
echo.
echo 下一步:
echo 1. 在Vercel中连接您的GitHub仓库
echo 2. 选择framework: Other
echo 3. 输出目录设置为: .
echo 4. 立即部署!
echo ================================
pause 