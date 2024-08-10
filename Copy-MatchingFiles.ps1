#function Copy-MatchingFiles {
    param (
        [Parameter(Mandatory=$true)]
        [string]$TargetDir,
        
        [Parameter(Mandatory=$true)]
        [string]$SourceDir
    )

    # Get all files in the target directory
    $targetFiles = Get-ChildItem -Path $TargetDir -File

    foreach ($file in $targetFiles) {
        $sourceFilePath = Join-Path -Path $SourceDir -ChildPath $file.Name

        # Check if the file exists in the source directory
        if (Test-Path $sourceFilePath) {
            # Copy the file from the source to the target directory
            Copy-Item -Path $sourceFilePath -Destination $TargetDir -Force
            Write-Host "Copied $($file.Name) from $SourceDir to $TargetDir"
        } else {
           # Write-Host "File $($file.Name) not found in $SourceDir"
        }
    }
#}