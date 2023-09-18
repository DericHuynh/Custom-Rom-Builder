param ($originalRomFileName);
$Host.ui.RawUI.WindowTitle = "Name";

Write-Host;
if([string]::IsNullOrEmpty($originalRomFileName)) {
    Write-Host "No argument was provided for the original rom file name."
    Write-Host;
    $originalRomFileName = Read-Host "Please enter the original rom file name inside the Input folder"
} else {
    Write-Host Original Rom File name argument provided: $originalRomFileName
}

$pathTest = Test-Path -Path Input\$originalRomFileName -PathType Leaf;
$fileExtensionTest = [IO.Path]::GetExtension($originalRomFileName);

while((-Not $pathTest) -or (-Not ($fileExtensionTest -eq '.img')) -or ([string]::IsNullOrEmpty($originalRomFileName))) {
    if([string]::IsNullOrEmpty($originalRomFileName)) {
        Write-Host File name is entereed was null or empty.;
    } elseif(-Not $pathTest ) {
        Write-Host $originalRomFileName is not a valid path.;
    } elseif(-Not ($fileExtensionTest -eq '.img')) {
        Write-Host $originalRomFileName is not an image file.;
    } 
    Write-Host;
    $originalRomFileName = Read-Host Please enter the original rom file name inside the Input folder;
    $pathTest = Test-Path -Path Input\$originalRomFileName -PathType Leaf;
    $fileExtensionTest = [IO.Path]::GetExtension($originalRomFileName);
    
}

Write-Output $originalRomFileName;
Read-Host -Prompt "Press Enter to exit"
