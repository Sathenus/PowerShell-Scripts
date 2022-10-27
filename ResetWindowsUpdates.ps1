#Reset Windows Updates
function Stop-ServiceName {
    param (
        $serviceName
    )
    #Create object to use later for WaitForStatus
    $getServiceName = Get-Service -Name $serviceName
    Write-Host Stopping $serviceName service...
    Stop-Service -Name $serviceName
    #wait until the service is stopped
    $getServiceName.WaitForStatus("Stopped")
}
function Start-ServiceName {
    param (
        $serviceName
    )
    #Create object to use later for WaitForStatus
    $getServiceName = Get-Service -Name $serviceName
    Write-Host Starting $serviceName service...
    Start-Service -Name $serviceName
    #wait until the service is running
    $getServiceName.WaitForStatus("Running")
}

#Stop services
Stop-ServiceName wuauserv
Stop-ServiceName cryptSvc
Stop-ServiceName bits
Stop-ServiceName msiserver
Get-Service wuauserv,cryptSvc,bits,msiserver | Format-Table

#Renames the SoftwareDistribution and catroot2 folders to .old
Write-Host Renaming SoftwareDistribution and Catroot2...
Rename-Item -Path "$env:SystemRoot\SoftwareDistribution" -NewName "SoftwareDistribution.old"
Rename-Item -Path "$env:SystemRoot\System32\catroot2" -NewName "catroot2.old"

#Start services
Start-ServiceName wuauserv
Start-ServiceName cryptSvc
Start-ServiceName bits
Start-ServiceName msiserver
Get-Service wuauserv,cryptSvc,bits,msiserver | Format-Table

Write-Host Waiting for folders to re-create...
while ((Test-Path "$env:SystemRoot\SoftwareDistribution") -eq $false) {
    Start-Sleep 2
}
while ((Test-Path "$env:SystemRoot\System32\catroot2") -eq $false) {
    Start-Sleep 2
}

#Sanity check
Get-ChildItem "$env:SystemRoot" -Filter "SoftwareDistribution*" | Select-Object LastWritetime,Name | Format-Table
Get-ChildItem "$env:SystemRoot\System32\" -Filter "catroot2*" | Select-Object LastWritetime,Name | Format-Table

Write-Host Task complete!