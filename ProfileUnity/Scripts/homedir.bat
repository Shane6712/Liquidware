@echo off
REM ********************Liquidware ProfileUnity Config Managment*************************
REM ********************Uses Home Directory based on VDI.COM\DATA DFS Root***************

if not exist \\vdi.com\data\home\%username%\MyIni md \\vdi.com\data\home\%username%\MyIni
if not exist \\vdi.com\data\home\%username%\MyIni\profileunity.lic echo f | xcopy \\vdi.com\NETLOGON\ProfileUnity\Configs\User\profileunity.lic \\vdi.com\data\home\%username%\MyIni\profileunity.lic| xcopy \\vdi.com\data\home\%username%\MyIni\profileunity.lic


if not exist \\vdi.com\data\home\%username%\MyIni\*.ini goto exit
xcopy /y \\vdi.com\NETLOGON\ProfileUnity\Configs\User\*.ini \\vdi.com\data\home\%username%\MyIni
reg add "HKCU\Software\Liquidware Labs\ProfileUnity" /v INIPath /t REG_SZ /d \\vdi.com\data\home\%username%\MyIni /f

:exit
exit

