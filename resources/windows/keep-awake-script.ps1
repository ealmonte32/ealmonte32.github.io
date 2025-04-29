Clear-Host
Get-Date
Echo "Keep-awake with Scroll Lock and F15 key..."

$WShell = New-Object -ComObject WScript.Shell

while ($true)
{
  $WShell.SendKeys("{SCROLLLOCK}")
  Start-Sleep -Milliseconds 100
  $WShell.SendKeys("{SCROLLLOCK}")
  #$WShell.SendKeys("{F15}")
  Start-Sleep -Seconds 300
}