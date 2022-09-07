#Get all users from the distinguishedName(corp.contoso.com/CORP/USERS) and export their SamAccountName's to a csv file
Get-ADUser -Filter * -SearchBase "OU=USERS,OU=CORP,DC=corp,DC=contoso,DC=com" |
Select-Object -Property SamAccountName |
Export-Csv -Path C:\Users\LabAdmin\Documents\CSVs\ADUsers.csv