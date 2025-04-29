@echo off
REM 03.06.2025.EA
REM Disable the Windows 11 context-menu.
cls

if not exist "%appdata%\GAT_disable_win11_cmenu" (GOTO DISWINCMENU) else (exit)

:DISWINCMENU
echo Adding the registry key to disable Win11 context-menu..
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
echo Win11 Context Menu Disabled > %appdata%\GAT_disable_win11_cmenu

echo Restarting Windows Explorer..
taskkill /f /im explorer.exe
start explorer.exe
exit