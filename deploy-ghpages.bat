@echo off
setlocal

REM ===== Build Flutter Web =====
echo 🚀 Building Flutter Web...
flutter build web

REM ===== Fix base href in index.html =====
echo 🔧 Fixing base href in index.html...
powershell -Command "(Get-Content build/web/index.html) -replace '<base href=\"/\">', '<base href=\"/my_portfolio-/\">' | Set-Content build/web/index.html"

REM ===== Switch to gh-pages branch =====
git checkout -B gh-pages

REM ===== Remove old files =====
git rm -rf .

REM ===== Copy new build files =====
xcopy build\web\* . /E /H /C /I

REM ===== Commit and Push =====
git add .
git commit -m "deploy: update gh-pages with fixed base href"
git push origin gh-pages --force

echo 🎉 Deployment Done!
pause
