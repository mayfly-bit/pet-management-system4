@echo off
echo ================================
echo Pet Management System Web Deploy
echo ================================
echo.

echo Current directory: %CD%
echo.

echo 1. Initializing Git repository...
git init

echo.
echo 2. Adding all web files...
git add .

echo.
echo 3. Committing changes...
git commit -m "Pet Management System Web - Production ready Flutter web app"

echo.
echo 4. Setting up remote repository...
set /p REPO_URL="Enter GitHub repository URL (e.g. https://github.com/username/pet-management-web.git): "
git remote add origin %REPO_URL%

echo.
echo 5. Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
if %ERRORLEVEL% NEQ 0 (
    echo Push failed, trying force push...
    git push --force-with-lease origin main
)

echo.
echo ================================
echo Deployment completed!
echo.
echo Next steps:
echo 1. Connect your GitHub repository in Vercel
echo 2. Select framework: Other
echo 3. Set output directory to: .
echo 4. Deploy now!
echo ================================
echo.
echo Repository setup complete.
echo Your web app is ready for Vercel deployment.
echo.
pause 