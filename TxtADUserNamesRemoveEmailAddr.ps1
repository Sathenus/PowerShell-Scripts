# source txt
$Sourcefile = "C:\Users\LabAdmin\Documents\CSVs\ADUsersmail.txt"
# output txt
$Output = "C:\Users\LabAdmin\Documents\CSVs\ADUserNames.txt"
# delete @contoso.com suffix, save content to output file
(Get-Content $Sourcefile) -replace ('@contoso.com', '') | Set-Content $Output