#Get all users "mail" from the distinguishedName and export their "mail"s to a csv file
Get-ADUser -Filter * -Property mail -SearchBase "OU=USERS,OU=CORP,DC=corp,DC=contoso,DC=com" |
Select-Object -Property mail |
Export-Csv -Path C:\Users\LabAdmin\Documents\CSVs\ADUsersmail.csv