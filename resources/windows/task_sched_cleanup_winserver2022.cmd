@echo off
REM 04.06.2023.EA
REM Windows Server 2022 was used to provide these tasks.
cls

echo Cleaning up Task Scheduler...
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable

schtasks.exe /change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks.exe /change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable

schtasks.exe /change /TN "\Microsoft\XblGameSave\XblGameSaveTask" /Disable

echo Done..
pause
exit
