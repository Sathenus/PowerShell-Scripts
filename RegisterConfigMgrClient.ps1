#Stops the 'CcmExec' service(SMS Agent Host), deletes the SMSCFG file, and starts the 'CcmExec' service
$serviceName = "CcmExec"
#Create object to use later for WaitForStatus
$getServiceName = Get-Service -Name $serviceName
Write-Host Stopping $serviceName service...
Stop-Service -Name $serviceName -Force
#Wait until the CcmExec service is stopped
$getServiceName.WaitForStatus("Stopped")
Write-Host Clearing print queue...
#Deletes the SMSCFG file
Remove-Item "$env:SystemRoot\SMSCFG.INI"
Write-Host Starting $serviceName service...
Start-Service -Name $serviceName
#Wait untilt he CcmExec service is running
$getServiceName.WaitForStatus("Running")
Write-Host $serviceName started!