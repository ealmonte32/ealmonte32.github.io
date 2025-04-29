cls
while ($true) {
start msedge.exe
Start-Sleep -Seconds 3
start winword.exe
Start-Sleep -Seconds 3
start acrobat.exe
Start-Sleep -Seconds 3
start excel.exe
Start-Sleep -Seconds 3
start calc.exe
Start-Sleep -Seconds 3
start cmd.exe
Start-Sleep -Seconds 5
start powerpnt.exe
Start-Sleep -Seconds 60
taskkill /F /IM msedge.exe
taskkill /F /IM winword.exe
taskkill /F /IM acrobat.exe
taskkill /F /IM excel.exe
taskkill /F /IM calculator.exe
taskkill /F /IM cmd.exe
taskkill /F /IM powerpnt.exe
}