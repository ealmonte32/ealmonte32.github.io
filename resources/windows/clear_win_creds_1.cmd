@echo off
cls
echo Deleting all cached credentials..
rmdir %localappdata%\Microsoft\Vault /S /Q
rmdir %appdata%\Microsoft\Vault /S /Q
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0clear_win_creds_ps.ps1"
echo Done..
pause
exit