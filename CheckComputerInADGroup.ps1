#Test if computers are in an AD group
$group = 'TestComputerGroup'
$computer = Import-Csv "C:\Users\LabAdmin\Documents\Output Files\ADComputers.csv"
#Get all members of the group
$member = Get-ADGroupMember -Identity $group -Recursive| Select-Object -ExpandProperty SamAccountName
#Loop through all the computers and see if they're a member
foreach($computer in $member)
{
        If ($member -contains $computer) {
        Write-Host "$computer is a member"
    } 
    Else {
        Write-Host "$computer is not a member of"
    }
}