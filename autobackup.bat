rem 备份文件并删除30天前的旧备份文件
@echo off
rem 取日期串
set d=%date:~0,4%%date:~5,2%%date:~8,2%
rem 获取时间串
set t=%time:~0,2%%time:~3,2%%time:~6,2%
rem 压缩文件路径
set path=C:\Program Files\7-Zip
rem 设置备份目录
set dstDir=F:\autoBackUpTest\
rem 设置要备份的目录
set srcDir=F:\dev\tooldetective
rem 备份文件名前缀
set backUpPrefix=backup
rem 如果不存在，开始备份

if not exist %dstDir%%backUpPrefix%tooldetec%d%%t%.7z start 7z a -t7z %dstDir%%backUpPrefix%tooldetec%d%%t%.7z %srcDir% 

@echo on
rem 删除30天前的备份文件
forfiles /p %dstDir% /d -30 /c "cmd /c del @path"
