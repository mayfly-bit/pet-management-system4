@echo off
echo ================================
echo GitHub Push Script
echo ================================
echo.

echo 正在尝试推送源代码到GitHub...
cd /d "C:\Users\34770\Desktop\pet_management_system"
git push origin main
if %errorlevel% equ 0 (
    echo [成功] 源代码推送成功!
) else (
    echo [失败] 源代码推送失败，错误码: %errorlevel%
)

echo.
echo 正在尝试推送Web版本到GitHub...
cd /d "C:\Users\34770\Desktop\pet_management_web"
git push origin main
if %errorlevel% equ 0 (
    echo [成功] Web版本推送成功!
) else (
    echo [失败] Web版本推送失败，错误码: %errorlevel%
)

echo.
echo ================================
echo 推送完成！
echo ================================
echo.
echo 如果推送失败，请尝试以下解决方案：
echo 1. 检查网络连接和代理设置
echo 2. 重新启动路由器/调制解调器
echo 3. 稍后重试（可能是GitHub服务器临时问题）
echo 4. 使用GitHub Desktop客户端
echo 5. 手动在GitHub网站上传文件
echo.
pause 