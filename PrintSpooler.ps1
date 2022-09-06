#Restarts printer spooler and clears queue
$serviceName = "Spooler"
#Create object to use later for WaitForStatus
$getServiceName = Get-Service -Name $serviceName
Write-Host Stopping $serviceName service...
Stop-Service -Name Spooler -Force
#wait until the print spooler service is stopped
$getServiceName.WaitForStatus("Stopped")
Write-Host Clearing print queue...
#deletes the spooler queue
$spoolerPath = "$env:SystemRoot\System32\spool\PRINTERS\*.*"
Remove-Item -Path $spoolerPath
Write-Host Starting $serviceName service...
Start-Service -Name Spooler
$getServiceName.WaitForStatus("Running")
Write-Host Task complete!