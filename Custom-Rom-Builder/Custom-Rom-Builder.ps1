param ($originalRomFileName);
$Host.ui.RawUI.WindowTitle = "Name";

if([string]::IsNullOrEmpty($originalRomFileName)) {
    Write-Host "No argument was provided for the original rom file name."
    $originalRomFileName = Read-Host "Please enter the original rom file name inside the Input folder"
} else {
    Write-Host Original Rom File name argument provided: $originalRomFileName
}

Write-Host;
$pathTest = Test-Path -Path Input\$originalRomFileName -PathType Leaf;

while((-Not $pathTest) -and (-Not [string]::IsNullOrEmpty($originalRomFileName))) {
    Write-Host $originalRomFileName does not link to a valid original rom file inside the Input folder.;
    $originalRomFileName = Read-Host Please enter the original rom file name inside the Input folder;
    $pathTest = Test-Path -Path Input\$originalRomFileName -PathType Leaf;
    Write-Host;
}

Write-Output $originalRomFileName;
Read-Host -Prompt "Press Enter to exit"
