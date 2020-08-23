$path = $env:USERPROFILE + "\Documents\My Games\Skyrim Special Edition"
$savesFolder = "\Saves"
$savesFolderBackup = '^Saves \d{12}$'
$backupCount = 5

# create new backup
Copy-Item -Path ($path + $savesFolder) -Destination ($path + $savesFolder + " " + (Get-Date -format yyyyMMddHHmm)) -Recurse

# delete old backups
$currentBackups = Get-ChildItem $path | Where-Object Name -match $savesFolderBackup

while ($currentBackups.length -gt $backupCount) {
	$currentBackups[0] | Remove-Item -Recurse
	$currentBackups = Get-ChildItem $path | Where-Object Name -match $savesFolderBackup
}
