$LogFolder = "C:\Logs"
if (-not (Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder
}

$LogFile = "$LogFolder\CPU_Usage.txt"

while ($true) {
    $cpu = Get-Counter '\Processor(_Total)\% Processor Time'
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "$timestamp - CPU Usage: $($cpu.CounterSamples.CookedValue)%"
    $line | Out-File -FilePath $LogFile -Append
    Write-Output $line
    Start-Sleep -Seconds 5
}
