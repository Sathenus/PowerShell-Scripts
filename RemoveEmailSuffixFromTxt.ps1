# Removes email suffix
# source txt file, input requires no quotes
$Sourcefile = Read-Host "Path to Source txt file. EX: C:\Users\LabAdmin\Documents\CSVs\ADUsersmail.txt" 
# output txt file, input requires no quotes
$Output = Read-Host "Path to output. Ex: C:\Users\LabAdmin\Documents\CSVs\ADUserNames.txt"
# delete @contoso.com suffix, save content to output file
(Get-Content $Sourcefile) -replace ('@contoso.com', '') | Set-Content $Output