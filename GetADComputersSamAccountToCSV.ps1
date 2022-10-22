#Get all computers  from the distinguishedName(corp.contoso.com/CORP/USERS) and export their SamAccountName's to a csv file
Get-ADComputer -Filter * -SearchBase "OU=Computers,OU=CORP,DC=corp,DC=contoso,DC=com" |
Select-Object -Property SamAccountName |
Export-Csv -Path "C:\Users\LabAdmin\Documents\Output Files\ADComputers.csv"