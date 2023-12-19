@echo off

REM 运行 Hugo
hugo -F --cleanDestinationDir

REM 复制 CNAME 文件
copy CNAME docs\

REM 添加所有改动到 git
git add .

REM 提交改动
git commit -m "update %date% %time%"

REM 推送改动到 main 分支
git push origin main
