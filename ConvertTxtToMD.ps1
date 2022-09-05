# Change all .txt files in the directory to .md
Get-ChildItem *.txt | Rename-Item -NewName { [io.path]::ChangeExtension($_.name, "md") }