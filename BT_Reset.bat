@echo off
cls
:start
echo Restarting bluetooth...
powershell -command .\bluetooth.ps1 -BluetoothStatus Off
powershell -command .\bluetooth.ps1 -BluetoothStatus On
echo Done.
TIMEOUT 4 >nul
powershell -command .\sound.ps1
echo Restart ?
pause >nul
goto start