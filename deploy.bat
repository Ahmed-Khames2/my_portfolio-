@echo off
REM === ارجع للفرع الرئيسي ===
git checkout main

REM === اعمل build للويب ===
flutter build web

REM === امسح فرع gh-pages القديم (لو موجود) ===
git push origin --delete gh-pages
git branch -D gh-pages

REM === أنشئ فرع gh-pages من build/web بس ===
git subtree split --prefix build/web -b gh-pages

REM === ابعت الفرع الجديد على GitHub ===
git push origin gh-pages --force

echo.
echo ✅ Deployment Done! 
echo افتح Settings -> Pages على GitHub وخلي الفرع gh-pages والمكان root.
pause
