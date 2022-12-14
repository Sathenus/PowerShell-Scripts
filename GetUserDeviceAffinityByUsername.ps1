<#
Prompts for username(s) and returns any devices they are set as the primary user for
Returns the prompt back to the prior location so another script can easily be run
#>
Import-Module ConfigurationManager
$PriorLocation = Get-Location
Set-Location CHQ:
$UserName = (Read-Host  `
"Please enter a single username or comma delimited list of usernames. EX: corp\testuser1,corp\sccm_admin").Split(',')
Get-CMUserDeviceAffinity -UserName $UserName | Select-Object -Property UniqueUserName,ResourceName
Set-Location $PriorLocation