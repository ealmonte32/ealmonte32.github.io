@echo off
cls

echo Leaving Azure AD..
dsregcmd /leave

echo Waiting 5 seconds before joining Azure AD..
timeout 5

echo Joining Azure AD..
dsregcmd /join

echo Checking the status of the Workplace Join task required for Azure AD joining..
schtasks /Change /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Enable
schtasks /query /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join"

echo Checking the Joined status of Azure AD and Domain..
dsregcmd /status | findstr /i joined

pause
exit