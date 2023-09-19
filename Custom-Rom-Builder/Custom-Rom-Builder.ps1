param ($originalRomFilePath, $GSIFilePath);

#Initial check to see if original rom path argument was provided or not.
Write-Host ;
if([string]::IsNullOrEmpty($originalRomFileName)) {
    Write-Host "No argument was provided for the original rom file path."
    $originalRomFilePath = "";
} else {
    Write-Host Original Rom File name argument provided: $originalRomFilePath
}

#Initial check to see if GSI path argument was provided or not.
if([string]::IsNullOrEmpty($GSIFilePath)) {
    Write-Host "No argument was provided for the GSI File path."
    $GSIFilePath = "";
} else {
    Write-Host GSI File path argument provided: $GSIFilePath;
}
Write-Host;

#Data verification so user can't easily pass in an invalid original rom path.
if (-not [string]::IsNullOrEmpty($originalRomFilePath)) {
   $romPathTest = Test-Path -Path $originalRomFilePath -PathType Leaf;
   $romFileExtensionTest = [IO.Path]::GetExtension($originalRomFilePath);
}

#Request path from user, looping until a completely valid original rom path is provided.
while((-Not $romPathTest) -or (-Not ($romFileExtensionTest -eq '.img')) -or ([string]::IsNullOrEmpty($originalRomFilePath))) {
    $originalRomFilePath = Read-Host -Prompt "Please enter the original rom file path";
    $originalRomFilePath = $originalRomFilePath.Trim('"');
    if (-not [string]::IsNullOrEmpty($originalRomFilePath)) {
        $romPathTest = Test-Path -Path $originalRomFilePath -PathType Leaf;
        $romFileExtensionTest = [IO.Path]::GetExtension($originalRomFilePath);
    }
    if([string]::IsNullOrEmpty($originalRomFilePath)) {
        Write-Host Original Rom File path entered was null or empty.;
    } elseif(-Not $romPathTest ) {
        Write-Host $originalRomFilePath is not a valid path.;
    } elseif(-Not ($romFileExtensionTest -eq '.img')) {
        Write-Host $originalRomFilePath does not point to an image file.;
    } 
    Write-Host;
}

#Data verification so user can't easily pass in an invalid GSI path.
if (-not [string]::IsNullOrEmpty($GSIFilePath)) {
    $gsiPathTest = Test-Path -Path $GSIFilePath -PathType Leaf;
    $gsiFileExtensionTest = [IO.Path]::GetExtension($GSIFilePath);
}

#Request path from user, looping until a completely valid GSI path is provided.
while((-Not $gsiPathTest) -or (-Not ($gsiFileExtensionTest -eq '.img')) -or ([string]::IsNullOrEmpty($GSIFilePath))) {
    $GSIFilePath = Read-Host -Prompt "Please enter the GSI File path";
    $GSIFilePath = $GSIFilePath.Trim('"');
    if (-not [string]::IsNullOrEmpty($GSIFilePath)) {
        $gsiPathTest = Test-Path -Path $GSIFilePath -PathType Leaf;
        $gsiFileExtensionTest = [IO.Path]::GetExtension($GSIFilePath);
    }
    if([string]::IsNullOrEmpty($GSIFilePath)) {
        Write-Host GSI File path entered was null or empty.;
    } elseif(-Not $gsiPathTest ) {
        Write-Host $GSIFilePath is not a valid path.;
    } elseif(-Not ($gsiFileExtensionTest -eq '.img')) {
        Write-Host $GSIFilePath does not point to an image file.;
    } 
    Write-Host;
}



Read-Host -Prompt "Press Enter to exit"
