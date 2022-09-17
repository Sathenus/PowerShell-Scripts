<#
Prompts for a username and returns any devices they are set as the primary user for
Returns the prompt back to the prior location so the script can easily be run again
#>
Import-Module ConfigurationManager
$PriorLocation = Get-Location
Set-Location CHQ:
$UserName = Read-Host "Please enter the username. EX:'corp\testuser1'"
Get-CMUserDeviceAffinity -UserName $UserName | Select-Object -Property ResourceName
Set-Location $PriorLocation