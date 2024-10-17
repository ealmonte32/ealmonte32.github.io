@echo off
REM 10.14.2024.EA
REM Disable Windows 10 unnecessary scheduled tasks

schtasks /change /TN "\Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /change /TN "\Microsoft\Office\Office ClickToRun Service Monitor" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable

schtasks /change /TN "\Microsoft\Windows\Application Experience\MareBackup" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\PcaWallpaperAppDetect" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable

schtasks /change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /change /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /change /TN "\Microsoft\Windows\CloudRestore\Backup" /Disable
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /change /TN "\Microsoft\Windows\HelloFace\FODCleanupTask" /Disable
schtasks /change /TN "\Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /change /TN "\Microsoft\Windows\Location\Notifications" /Disable
schtasks /change /TN "\Microsoft\Windows\Location\WindowsActionDialog" /Disable
schtasks /change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Maps\MapsToastTask" /Disable
schtasks /change /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Offline Files\Background Synchronization" /Disable
schtasks /Change /TN "\Microsoft\Windows\Offline Files\Logon Synchronization" /Disable
schtasks /Change /TN "\Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable
schtasks /Change /TN "\Microsoft\Windows\Wininet\CacheTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Device-Sync" /Disable
schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Recovery-Check" /Disable

exit
