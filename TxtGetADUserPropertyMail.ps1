# Txt file, no quotes around entries, and no headers
Get-ADUser -Filter * -Property mail -SearchBase "OU=USERS,OU=CORP,DC=corp,DC=contoso,DC=com" |
Select-Object -ExpandProperty mail |
Out-File -FilePath "C:\Users\LabAdmin\Documents\CSVs\ADUsersmail.txt"