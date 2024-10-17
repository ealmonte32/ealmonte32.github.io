reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter /t REG_DWORD /d 1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0

REM Need to add services like data usage , delivery optimization, tabletinputservice, etc.. in Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\...
