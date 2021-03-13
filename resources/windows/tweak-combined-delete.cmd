REM delete temp files
del /q/s/f %windir%\temp\*

REM delete from registry
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps /f

REM end
pause
exit