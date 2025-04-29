@echo off
REM 10.17.2024.EA
REM set NTP servers as RA-DC and RA-DC02 with the 0x8 flag which means "Use Network Time Protocol" option.

REM w32tm /config /manualpeerlist:192.168.101.144 /syncfromflags:MANUAL
REM net time /querysntp

echo Configuring registry for NTP manual peer list...
w32tm /config /manualpeerlist:"192.168.101.144,0x8 192.168.101.145,0x8" /syncfromflags:MANUAL /reliable:YES
w32tm /config /update
net stop w32time
net start w32time
w32tm /resync

echo Check results..
pause
exit