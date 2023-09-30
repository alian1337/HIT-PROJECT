@echo off
title HIT - %USERNAME%
@echo off
mode 90,20
setlocal enabledelayedexpansion
:Admin
title 
    if "processor_architecture" equ "amd64" (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
) else (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

)

if '%errorlevel%' neq '0' (
echo.
title 
    goto getadmin
) else ( goto fadmin )

:GetAdmin
    echo set uac = createobject^("shell.application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""09
    echo uac.shellexecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "temp\getadmin.vbs"
    exit \b

:FAdmin
    pushd "%CD%"
    cd /d "%~dp0"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:loadingkk
@echo off
md %appdata%\HIT
cls
cls
title HIT ScreenShare - [ 0.0.2 ]
mode con: cols=107 lines=27

color 4
echo Loading...
ping localhost -n 1 >nul



bitsadmin /transfer calcmyDownload /download /priority foreground https://cdn.discordapp.com/attachments/1115010616978055240/1146775418595196958/strings2.exe %appdata%\HIT\strings2.exe > nul
:::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DPS'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\HIT/dpspid.txt
cd %appdata%\HIT
set /p dps=<dpspid.txt
strings2.exe -pid %dps% > %appdata%\HIT/dps.txt
:::::::::::::::::::::::::::::::::

powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'explorer.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/explorerpid.txt
cd %appdata%\HIT
set /p Build=<explorerpid.txt
strings2.exe -pid %Build% > %appdata%\HIT/explorer.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'PcaSvc'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\HIT/pcasvcpid.txt
cd %appdata%\HIT
set /p pcasvc=<pcasvcpid.txt
strings2.exe -pid %pcasvc% > %appdata%\HIT/pcasvc.txt

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'lsass.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/lsassid.txt
cd %appdata%\HIT
set /p Build=<lsassid.txt
strings2.exe -pid %Build% > %appdata%\HIT/lsass.txt

::::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DiagTrack'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\HIT/DiagTrackpid.txt
cd %appdata%\HIT
set /p DiagTrack=<DiagTrackpid.txt
strings2.exe -pid %DiagTrack% > %appdata%\HIT/DiagTrack.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'svchost.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/svchostid.txt
cd %appdata%\HIT
set /p Build=<svchostid.txt
strings2.exe -pid %Build% > %appdata%\HIT/svchost.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'Discord.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/discordid.txt
cd %appdata%\HIT
set /p Build=<discordid.txt
strings2.exe -pid %Build% > %appdata%\HIT/discord.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'msedge.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/msedgeid.txt
cd %appdata%\HIT
set /p Build=<msedgeid.txt
strings2.exe -pid %Build% > %appdata%\HIT/msedge.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'SearchIndexer.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/searchindexerid.txt
cd %appdata%\HIT
set /p Build=<searchindexerid.txt
strings2.exe -pid %Build% > %appdata%\HIT/searchindexer.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'csrss.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/csrssid.txt
cd %appdata%\HIT
set /p Build=<csrssid.txt
strings2.exe -pid %Build% > %appdata%\HIT/csrss.txt

::::::::::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'dllhost.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\HIT/dllhostid.txt
cd %appdata%\HIT
set /p Build=<dllhostid.txt
strings2.exe -pid %Build% > %appdata%\HIT/dllhost.txt


cls
goto :menu
:menu
@echo off
mode con: cols=120 lines=30
title HIT - %USERNAME%
chcp 65001>nul

:menu
echo     __  __     __     ______  
echo    /\ \_\ \   /\ \   /\__  _\    Welcome to HIT ScreenShare !
echo    \ \  __ \  \ \ \  \/_/\ \/    Version : 0.0.2          
echo     \ \_\ \_\  \ \_\    \ \_\    Dev : bucea
echo      \/_/\/_/   \/_/     \/_/    discord.gg/h1t      
color C           
echo.           
echo.--------------------------------------------------------------------
echo.
echo         " 1 " - Scanner                    " 2 " - Apps
echo         " 3 " - Auto             
echo.

set /p slct=[31m »  [0m
if %slct%==1 goto menu1
if %slct%==2 goto programass
if %slct%==3 goto automain3
if not exist %slct% (
    echo invalid option
    timeout /t 2 >nobreak
    cls
    goto menu
:menu1
mode con: cols=120 lines=30
cls
echo     __  __     __     ______  
echo    /\ \_\ \   /\ \   /\__  _\    Welcome to HIT Scanner !
echo    \ \  __ \  \ \ \  \/_/\ \/    Version : 0.0.2          
echo     \ \_\ \_\  \ \_\    \ \_\    Dev : bucea
echo      \/_/\/_/   \/_/     \/_/    discord.gg/h1t      
color C                      
echo.--------------------------------------------------------------------
echo.
echo        " 1 " - Processes             " 2 " - Slot
echo.       " 3 " - Back
echo.

set /p slct=[31m »  [0m
if %slct%==1 goto scanall
if %slct%==2 goto slot
if %slct%==3 goto menu

:: Scan All
:scanall
cls
7
mode 67, 40
echo     The cheats will be displayed below !
echo.
echo.
echo.
set link= "%appdata%\HIT\pcasvc.txt" >nul
set link= "%appdata%\HIT\DiagTrack.txt" >nul
set link= "%appdata%\HIT\explorer.txt" >nul
set link= "%appdata%\HIT\lsass.txt" >nul
set link= "%appdata%\HIT\msedge.txt" >nul
set link= "%appdata%\HIT\discord.txt" >nul
set link= "%appdata%\HIT\svchost.txt" >nul
set link= "%appdata%\HIT\csrss.txt" >nul
set link= "%appdata%\HIT\dllhost.txt" >nul


>nul findstr /c:"Discord" %link% && (
 echo [31m     -[0m[90m String Cleaner found!
echo.
)

>nul findstr /c:":::2019/05/25:15:30:08" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2019/05/25:15:31:29" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2018/09/23:17:01:28" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2020/01/05:12:15:27" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2020/05/16:20:19:46" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2010/05/30:13:06:42" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2020/05/07:21:30:43" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:":::2020/07/12:00:03:20" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:"!2023/04/13:17:33:54!" %link% && (
 echo [31m     -[0m[90m Asgard found!
echo.
)

>nul findstr /c:"!2023/08/05:23:12:33!" %link% && (
 echo [31m     -[0m[90m Asgard found!
echo.
)

>nul findstr /c:" !2023/08/16:22:43:26!" %link% && (
 echo [31m     -[0m[90m Sicario found!
echo.
)

>nul findstr /c:":::!2023/08/16:22:43:26!" %link% && (
 echo [31m     -[0m[90m Sicario found!
echo.
)

>nul findstr /c:"!2023/07/13:19:22:55" %link% && (
 echo [31m     -[0m[90m Testo.gg found!
echo.
)

>nul findstr /c:"2012/07/13:22:47:16" %link% && (
 echo [31m     -[0m[90m CleanUp Royale found (Clear Regedit)
echo.
)

>nul findstr /c:"2016/01/26:08:23:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"2016/01/26:09:24:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"!2023/07/13:15:48:20!" %link% && (
 echo [31m     -[0m[90m aloha found!
echo.
)

>nul findstr /c:"!!cfxloader.exe!2023/07/24:20:21:43!340988!" %link% && (
 echo [31m     -[0m[90m cfxmafia found!
echo.
)

>nul findstr /c:"!1988/01/03:04:23:06!" %link% && (
 echo [31m     -[0m[90m susano Found
echo.
)

>nul findstr /c:":::!1988/01/03:04:23:06!" %link% && (
 echo [31m     -[0m[90m susano Found
echo.
)

>nul findstr /c:":::!2023/05/21:20:56:21!" %link% && (
 echo [31m     -[0m[90m susano Found
echo.
)

>nul findstr /c:"DPS:::!2023/08/18:01:20:41!" %link% && (
 echo [31m     -[0m[90m RedEngine Found
echo.
)

>nul findstr /c:"!2023/08/18:01:20:41!" %link% && (
 echo [31m     -[0m[90m RedEngine Found!
echo.
)

>nul findstr /c:"2018/04/28:15:32:22" %link% && (
 echo [31m     -[0m[90m Remove Strings Found!
echo.
)

>nul findstr /c:"!2023/07/29 44:47!" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:":::!2023/07/29:15:44:47!" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"!2023/07/29 44:47!" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:":::!2022/01/28:16:21:07!8561b0!" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"!2023/06/19: 18. 06: 05!" %link% && (
 echo [31m     -[0m[90m Eulen Found!
echo.
)

>nul findstr /c:"2018/07/13:16:44:10" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:"0x1ae4000" %link% && (
 echo [31m     -[0m[90m gosth found!
echo.
)

>nul findstr /c:"0x16b2000" %link% && (
 echo [31m     -[0m[90m RedEngine found!
echo.
)

>nul findstr /c:"0x552f2f" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0xc02000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x551be3" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0xdc3000" %link% && (
 echo [31m     -[0m[90m eulen Found!
echo.
)

>nul findstr /c:"0xbfdeos " %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"8x28c000 " %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)

>nul findstr /c:"0x59b000" %link% && (
 echo [31m     -[0m[90m HxCheats Found!
echo.
)

>nul findstr /c:"0x1a6b000 " %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0xda3000 " %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:"0x1b6000" %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)

>nul findstr /c:"0x845000" %link% && (
 echo [31m     -[0m[90m cfxmafia Found!
echo.
)

>nul findstr /c:"0x854300" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x2315000" %link% && (
 echo [31m     -[0m[90m RedEngine Found!
echo.
)

>nul findstr /c:"0x8a9000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x1a6be0a" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0xc7da00" %link% && (
 echo [31m     -[0m[90m Cobalt Found!
echo.
)

>nul findstr /c:"0x11b4000" %link% && (
 echo [31m     -[0m[90m Testo.gg Found!
echo.
)

>nul findstr /c:"0x1be4800" %link% && (
 echo [31m     -[0m[90m Gosth Found!
echo.
)

>nul findstr /c:"0xdc0973" %link% && (
 echo [31m     -[0m[90m RedEngine Found!
echo.
)

>nul findstr /c:"0x895000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x5c000" %link% && (
 echo [31m     -[0m[90m Cheat Hider Found!
echo.
)

>nul findstr /c:"0x3d8b27" %link% && (
 echo [31m     -[0m[90m Cheat Hider Found!
echo.
)

>nul findstr /c:"0x4487090 " %link% && (
 echo [31m     -[0m[90m Melancholy Found!
echo.
)

>nul findstr /c:"0x3d69ed" %link% && (
 echo [31m     -[0m[90m Ov Project Found!
echo.
)

>nul findstr /c:"0x18f9000" %link% && (
 echo [31m     -[0m[90m Susano Found!
echo.
)

>nul findstr /c:"0x87fe0" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x8b1000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x22000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x830000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)

>nul findstr /c:"0x1be6000" %link% && (
 echo [31m     -[0m[90m Gosth Found!
echo.
)

>nul findstr /c:"0x348000" %link% && (
 echo [31m     -[0m[90m Hx Cheats Found!
echo.
)

>nul findstr /c:"0x244000" %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)

>nul findstr /c:"0x3c8000" %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)

>nul findstr /c:"0x552000" %link% && (
 echo [31m     -[0m[90m Stringless Found!
echo.
)

>nul findstr /c:"0x8cc900" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)


>nul findstr /c:"0x87f900" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)


>nul findstr /c:"0x45e000" %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)


>nul findstr /c:"0x21c1bd" %link% && (
 echo [31m     -[0m[90m Stringless Found!
echo.
)


>nul findstr /c:"0x2363000" %link% && (
 echo [31m     -[0m[90m RedEngine Found!
echo.
)


>nul findstr /c:"0xdc3000" %link% && (
 echo [31m     -[0m[90m Eulen Found!
echo.
)


>nul findstr /c:"0x1537000" %link% && (
 echo [31m     -[0m[90m Skript.gg Found!
echo.
)


>nul findstr /c:"0x2b4080" %link% && (
 echo [31m     -[0m[90m FivemFix Found!
echo.
)


>nul findstr /c:"0x419000" %link% && (
 echo [31m     -[0m[90m Sicario Found!
echo.
)

>nul findstr /c:"0x1c3000" %link% && (
 echo [31m     -[0m[90m Tz Cheats Found!
echo.
)

>nul findstr /c:"0x585000" %link% && (
 echo [31m     -[0m[90m Tz Cheats Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /f" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags" /f" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn" %link% && (
 echo [31m     -[0m[0m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"fsutil  usn" %link% && (
 echo [31m     -[0m[0m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"flushdns" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"reg add" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"reg ADD" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d c:" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal c:" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d e:" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal e:" %link% && (
 echo [31m     -[0m[0m Clear String Found!
echo.
)

>nul findstr /c:"eulen" %link% && (
 echo [31m     -[0m[0m Eulen Found!
echo.
)

>nul findstr /c:"iBackupViewer10Setup.exe" %link% && (
 echo [31m     -[0m[0m Testo.gg found!
echo.
)

>nul findstr /c:"ec2-3-235-182-75.compute-1.amazonaws.com" %link% && (
 echo [31m     -[0m[0m Eulen found!
echo.
)

>nul findstr /c:"settings.cock" %link% && (
 echo [31m     -[0m[0m RedEngine found!
echo.
)

>nul findstr /c:"public.zip" %link% && (
 echo [31m     -[0m[0m RedEngine found!
echo.
)

>nul findstr /c:"redengine" %link% && (
 echo [31m     -[0m[0m RedEngine found!
echo.
)

>nul findstr /c:"ezilax.com" %link% && (
 echo [31m     -[0m[0m Sicario found!
echo.
)

>nul findstr /c:"shey.tech" %link% && (
 echo [31m     -[0m[0m Sicario found!
echo.
)

>nul findstr /c:"cutiehook" %link% && (
 echo [31m     -[0m[0m Sicario found!
echo.
)

>nul findstr /c:"steamwebhelper.exe" %link% && (
 echo [31m     -[0m[0m Unicore found! steamwebhelper.exe - prob unicore
echo.
)

>nul findstr /c:"unicore" %link% && (
 echo [31m     -[0m[0m Unicore found!
echo.
)

>nul findstr /c:"vps-f2fc0768.vps.ovh.ca" %link% && (
 echo [31m     -[0m[0m Unicore found!
echo.
)

>nul findstr /c:"vps-b7a11d64.vps.ovh.net" %link% && (
 echo [31m     -[0m[0m Unicore found!
echo.
)

>nul findstr /c:"cfxloader" %link% && (
 echo [31m     -[0m[0m cfxmafia found!
echo.
)

>nul findstr /c:"cryptography.dll" %link% && (
 echo [31m     -[0m[0m cfxmafia found!
echo.
)

>nul findstr /c:"keyauth.win" %link% && (
 echo [31m     -[0m[0m Gosth found! Must check
echo.
)

>nul findstr /c:"ovisetup.exe" %link% && (
 echo [31m     -[0m[0m Skript.gg found!
echo.
)

>nul findstr /c:"loader.exe" %link% && (
 echo [31m     -[0m[0m Loader.exe found! Must Check
echo.
)

>nul findstr /c:"d3d10.dll" %link% && (
 echo [31m     -[0m[0m HxCheats found! Must Check
echo.
)

>nul findstr /c:"hxcheats.com" %link% && (
 echo [31m     -[0m[0m HxCheats found!
echo.
)

>nul findstr /c:"hxcheats" %link% && (
 echo [31m     -[0m[0m HxCheats found!
echo.
)

>nul findstr /c:"w4b76e93rbgfw9e.exe" %link% && (
 echo [31m     -[0m[0m Asgard found!
echo.
)

>nul findstr /c:"dxgi.dll" %link% && (
 echo [31m     -[0m[0m dxgi.dll found! Must Check
echo.
)


>nul findstr /c:"api.tzproject.com" %link% && (
 echo [31m     -[0m[0m Tz Cheats found!
echo.
)

>nul findstr /c:"tzproject" %link% && (
 echo [31m     -[0m[0m Tz Cheats found!
echo.
)

>nul findstr /c:"vps-8ab174ba.vps.ovh.net" %link% && (
 echo [31m     -[0m[0m Tz Cheats found!
echo.
)

>nul findstr /c:"d3d10.dll" %link% && (
 echo [31m     -[0m[0m d3d10.dll found! Must Check
echo.
)

>nul findstr /c:"Skript.gg" %link% && (
 echo [31m     -[0m[0m Skript.gg found!
echo.
)


echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [ 1 ] Back
echo.
set /p slct=[31m »  [0m
cls
if %slct%==1 goto menu1

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:programass
cls
@echo off
echo     __  __     __     ______  
echo    /\ \_\ \   /\ \   /\__  _\    Welcome to HIT Apps !
echo    \ \  __ \  \ \ \  \/_/\ \/    Version : 0.0.2         
echo     \ \_\ \_\  \ \_\    \ \_\    Dev : bucea
echo      \/_/\/_/   \/_/     \/_/    discord.gg/h1t      
color C                      
echo.--------------------------------------------------------------------
echo.
echo   " 1 " - RecentFilesView                 " 2 " - WinDefThreatsView
echo   " 3 " - WinPrefetchView                 " 4 " - ShellBagsView
echo   " 5 " - ServiceExecution                " 6 " - RegistryExplorer
echo   " 7 " - JournalTrace                    " 8 " - SystemInformer
echo.  " 9 " - CachedProgramList               " 0 " - RegScanner
echo.
echo.                            " 11 " - Back
echo.
set select=
set /p select=[31m »  [0m
if %select%==1 goto muie
if %select%==2 goto eve
if %select%==3 goto exe
if %select%==4 goto last
if %select%==5 goto assist
if %select%==6 goto registryexpl
if %select%==7 goto idkyetxd
if %select%==8 goto samasugi
if %select%==9 goto cachedprogram
if %select%==0 goto regscannnigga
if %select%==11 goto menu


:muie
bitsadmin /transfer calcmyDownload /download /priority foreground https://www.nirsoft.net/utils/recentfilesview.zip "%appdata%\HIT\recentfilesview.zip" > nul
explorer "%appdata%\HIT\recentfilesview.zip"
goto programass

:eve
bitsadmin /transfer calcmyDownload /download /priority foreground https://www.nirsoft.net/utils/windefthreatsview-x64.zip "%appdata%\HIT\windefthreatsview-x64.zip" > nul
explorer "%appdata%\HIT\windefthreatsview-x64.zip
goto programass

:exe
bitsadmin /transfer calcmyDownload /download /priority foreground https://www.nirsoft.net/utils/winprefetchview-x64.zip "%appdata%\HIT\winprefetchview-x64.zip" > nul
explorer "%appdata%\HIT\winprefetchview-x64.zip
goto programass

:last
bitsadmin /transfer calcmyDownload /download /priority foreground https://www.nirsoft.net/utils/shellbagsview.zip "%appdata%\HIT\shellbagsview.zip" > nul
explorer "%appdata%\HIT\shellbagsview.zip
goto programass

:assist 
bitsadmin /transfer calcmyDownload /download /priority foreground https://github.com/Zack-src/Service-Execution/releases/download/1.0/Service-Execution.exe "%appdata%\HIT\Service-Execution.exe" > nul
explorer "%appdata%\HIT\Service-Execution.exe
goto programass

:registryexpl
bitsadmin /transfer calcmyDownload /download /priority foreground https://f001.backblazeb2.com/file/EricZimmermanTools/net6/RegistryExplorer.zip "%appdata%\HIT\RegistryExplorer.zip" > nul
explorer "%appdata%\HIT\RegistryExplorer.zip
goto programass

:idkyetxd
bitsadmin /transfer calcmyDownload /download /priority foreground https://github.com/ponei/JournalTrace/releases/download/1.0/JournalTrace.exe "%appdata%\HIT\JournalTrace.exe" > nul
explorer "%appdata%\HIT\JournalTrace.exe
goto programass

:samasugi
bitsadmin /transfer calcmyDownload /download /priority foreground https://github.com/winsiderss/si-builds/releases/download/3.0.7039/systeminformer-3.0.7039-setup.exe "%appdata%\HIT\systeminformer-3.0.7039-setup.exe" > nul
explorer "%appdata%\HIT\systeminformer-3.0.7039-setup.exe
goto programass

:cachedprogram
bitsadmin /transfer calcmyDownload /download /priority foreground https://cdn.discordapp.com/attachments/1143089712614088704/1143089751369465916/Cached.exe "%appdata%\HIT\Cached.exe" > nul
explorer "%appdata%\HIT\Cached.exe
goto programass

:regscannnigga
bitsadmin /transfer calcmyDownload /download /priority foreground https://www.nirsoft.net/utils/regscanner-x64.zip "%appdata%\HIT\regscanner-x64.zip" > nul
explorer "%appdata%\HIT\regscanner-x64.zip
goto programass

:automain3
@echo off
cls
set folderPath=%appdata%\HIT\Auto
if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
mkdir %appdata%\HIT\Auto\Util\Extra 2>nul
mkdir %appdata%\HIT\Auto\Util\EXE 2>nul
mkdir %appdata%\HIT\Auto\Util\DLL 2>nul
mkdir %appdata%\HIT\Auto\Util\PF 2>nul
mkdir %appdata%\HIT\Auto\Util\BAT 2>nul
mkdir %appdata%\HIT\Auto\Util\Archives 2>nul
mkdir %appdata%\HIT\Auto 2>nul
echo %d% Running...
fsutil usn readjournal c: csv >> %appdata%\HIT\Auto\Util\FsutilJournal.txt
set Fsutil="%appdata%\HIT\Auto\FsutilJournal.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x80000200" >> "%appdata%\HIT\Auto\Util\EXE\DeletedExes.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00080000" >> "%appdata%\HIT\Auto\Util\EXE\ObjectIDChange.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00001000" >> "%appdata%\HIT\Auto\Util\EXE\RenamedExes.txt"
findstr /i /c:".crdownload" "%Fsutil%" >> %appdata%\HIT\Auto\Extra\DownloadCache.txt
findstr /i /c:".evtx" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\Extra\DeletedEventLog.txt
findstr /i /c:"?" "%Fsutil%" >> %appdata%\HIT\Auto\Extra\EmptyCharacter.txt
findstr /i /c:"0x00080000" "%Fsutil%" | findstr /i /c:"0x00000005" >> %appdata%\HIT\Auto\Util\Extra\DataTruncation.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\HIT\Auto\Util\PF\RenamedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\PF\DeletedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00008000" >> %appdata%\HIT\Auto\Util\PF\Prefetch.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\HIT\Auto\Util\BAT\RenamedBats.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\BAT\DeletedBats.txt
findstr /i /c:".rar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\Archives\DeletedRar.txt
findstr /i /c:".zip" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\Archives\DeletedZip.txt
findstr /i /c:".7z" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\HIT\Auto\Util\Archives\Deleted7z.txt
findstr /i /c:".tar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\HIT\Auto\Util\Archives\DeletedTar.txt
findstr /i /c:".gz" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\HIT\Auto\Util\Archives\DeletedGz.txt
start "" "%appdata%\HIT\Auto\Util"
cls
goto menu