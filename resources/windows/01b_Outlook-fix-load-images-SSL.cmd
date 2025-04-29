@echo off
REM 04.03.2025.EA
REM Disable the Caching of SSL Pages to fix Outlook desktop app loading of embedded images from Safe Senders
cls

reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableCachingOfSSLPages" /t REG_DWORD /d 0 /f

exit
