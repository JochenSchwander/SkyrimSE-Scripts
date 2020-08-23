$savesFolder = $env:USERPROFILE + "\Documents\My Games\Skyrim Special Edition\Saves\"

$skseCoSaves = Get-ChildItem $savesFolder | Where-Object Name -match '^.+\.skse$'

foreach($skseCoSave in $skseCoSaves) {
    $save = $savesFolder + ($skseCoSave -replace '^(.+)\.skse$', '$1.ess')

    if (-Not (Test-Path $save -PathType Leaf)) {
        Remove-Item ($savesFolder + $skseCoSave)
    }
}
