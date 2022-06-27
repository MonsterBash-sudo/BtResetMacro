@echo off

FOR /F %%i IN (.actualrecord.txt) DO set /A BTRESETCOUNTERMAX = %%i
if [%BTRESETCOUNTERMAX%]==[] set /A BTRESETCOUNTERMAX = 0
echo Welcome to this shitty program i made
echo:

set /a BTRESETCOUNTER=0
echo %BTRESETCOUNTERMAX% is da number

:start
cls
set /a BTRESETCOUNTER+=1
echo Try #%BTRESETCOUNTER% - Actual Record : %BTRESETCOUNTERMAX%
echo:

echo Turning bluetooth off...
powershell -command .\bluetooth.ps1 -BluetoothStatus Off
echo Turning bluetooth on...
powershell -command .\bluetooth.ps1 -BluetoothStatus On
echo Done.
TIMEOUT 3 >nul
echo:

powershell -command .\sound.ps1

if %BTRESETCOUNTER% LSS %BTRESETCOUNTERMAX% goto norecord
set /A BTRESETCOUNTERMAX = %BTRESETCOUNTER%
echo %BTRESETCOUNTERMAX% > .actualrecord.txt
echo New record : %BTRESETCOUNTERMAX% tries

:norecord
echo Restart ?
pause >nul
goto start