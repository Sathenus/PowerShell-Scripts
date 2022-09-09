Import-Module ActiveDirectory
# Specify the csv file to use, ensure to export your users by SamAccountName and to keep typing enabled
$Users = Import-Csv "C:\Users\LabAdmin\Documents\CSVs\ADUsers.csv"
# Specify target group where the users will be added to
$Group = "TestUserGroup" 
# Add each $Users to $Group if their AD account is enabled
foreach ($User in $Users) {
    $ADUser = Get-ADUser $User.samaccountname
    if ($ADUser.enabled) {
        Add-ADGroupMember -Identity $Group -Members $ADUser
    }
}