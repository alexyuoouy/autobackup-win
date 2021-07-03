rem 备份文件
@echo off
rem 获取日期串
set d=%date:~0,4%%date:~5,2%%date:~8,2%
rem 获取时间串
if %time:~0,2% LSS 10 (set t=0%time:~1,1%%time:~3,2%%time:~6,2%)else (set t=%time:~0,2%%time:~3,2%%time:~6,2%)
rem 压缩文件路径
set path=D:\7-Zip
rem 备份文件dist目录1
set dstDir1=F:\autobackup\
rem 备份文件dist目录2
set dstDir2=D:\autobackup\
rem 备份文件dist目录3
set dstDir3=G:\autobackup\
rem 设置要备份的目录
set srcDir=F:\project
rem 备份文件名前缀
set backUpPrefix=backupProject


echo ----------------------------------------------------------------------- >> %dstDir1%7zbackup.log
echo time:%d%%t% >> %dstDir1%7zbackup.log
rem 如果不存在，开始备份,备份过程与结果写入日志
if not exist "%dstDir1%%backUpPrefix%%d%%t%.7z" 7z a -t7z "%dstDir1%%backUpPrefix%%d%%t%.7z" %srcDir% >> %dstDir1%7zbackup.log
echo done
@echo on

rem 拷贝文件至其它备份目录
@echo off
copy "%dstDir1%%backUpPrefix%%d%%t%.7z" %dstDir3% >> %dstDir1%7zbackup.log
echo done
@echo on
rem 删除30天前的备份文件
C:\Windows\System32\forfiles /p %dstDir1% /d -30 /c "cmd /c del @path" >> %dstDir1%7zbackup.log
C:\Windows\System32\forfiles /p %dstDir3% /d -30 /c "cmd /c del @path" >> %dstDir1%7zbackup.log
