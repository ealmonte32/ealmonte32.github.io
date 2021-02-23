REM delete certain files we dont want
del "%programfiles%\Common Files\SMART Technologies\Customer Experience\harvester.exe"
del "%ProgramFiles%\Common Files\SMART Technologies\SMART Product Update\SmartProductUpdate.exe"
del "%ProgramFiles%\Davka Corp\DavkaWriter\DWUpdater.exe"
del "%ProgramFiles%\Davka Corp\DavkaWriter\Updater.exe"
del "%programfiles%\foxit software\foxit reader\profstore\profstore.xml"
del "%programfiles(x86)%\foxit software\foxit reader\profstore\profstore.xml"

REM delete temp files
del /q/s/f %windir%\temp\*

REM delete from registry
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps /f

REM disable fancy boot screen
bcdedit /set bootux basic

REM end
