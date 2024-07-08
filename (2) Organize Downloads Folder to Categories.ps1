$downloadsPath = "C:\\Users\\achma\\Downloads"
$downloadsFolder = $downloadsPath
$videosFolder = Join-Path -Path $downloadsPath -ChildPath "Videos"
$imagesFolder = Join-Path -Path $downloadsPath -ChildPath "Images"
$documentsFolder = Join-Path -Path $downloadsPath -ChildPath "Documents"
$appsFolder = Join-Path -Path $downloadsPath -ChildPath "Apps"
$compressedFolder = Join-Path -Path $downloadsPath -ChildPath "Compressed"
$othersFolder = Join-Path -Path $downloadsPath -ChildPath "Others"
$musicFolder = Join-Path -Path $downloadsPath -ChildPath "Music"
$graphicFolder = Join-Path -Path $downloadsPath -ChildPath "Graphic"

$foldersToExclude = @("ID Card Lampung", "Videos", "Images", "Documents", "Apps", "Compressed", "Music", "Graphic")

$filesToMove = Get-ChildItem -Path $downloadsPath

foreach ($file in $filesToMove) {
    $extension = $file.Extension
    $destination = $downloadsFolder

    # Check if the item is in the list of excluded folders and skip it
    if ($foldersToExclude -contains $file.Name -and $file.PSIsContainer) {
        Write-Host "Skipping folder: $($file.Name)"
        continue
    }

    # Check file extension and set the destination folder accordingly
    if ($extension -match "\.(mp4|mov|mkv|ts|flv)$") {
        $destination = $videosFolder
    }
    elseif ($extension -match "\.(jpg|jpeg|png|gif|webp)$") {
        $destination = $imagesFolder
    }
    elseif ($extension -match "\.(pdf|docx|xlsx|pptx|txt|csv|rtf)$") {
        $destination = $documentsFolder
    }
    elseif ($extension -match "\.(exe|msi|apk|xapk|)$") {
        $destination = $appsFolder
    }
    elseif ($extension -match "\.(zip|rar|7z|iso)$") {
        $destination = $compressedFolder
    }
    elseif ($extension -match "\.(mp3|wav|m4a)$") {
        $destination = $musicFolder
    }
    elseif ($extension -match "\.(ai|psd|cdr|ae|pproj|blend|fbx|glb)$") {
        $destination = $graphicFolder
    }
    else {
        $destination = $othersFolder
    }

    # If the file is not already in the destination folder, move it
    if ($file.FullName -ne $destination) {
        # Create the destination folder if it doesn't exist
        if (-not (Test-Path $destination)) {
            New-Item -Path $destination -ItemType Directory | Out-Null
        }

        # Check if a file with the same name already exists in the destination folder
        $newFileName = $file.Name
        $count = 1
        while (Test-Path (Join-Path -Path $destination -ChildPath $newFileName)) {
            $newFileName = "{0}_copy{1}{2}" -f $file.BaseName, $count, $file.Extension
            $count++
        }

        # Move the file to the destination with the new name
        $newFilePath = Join-Path -Path $destination -ChildPath $newFileName
        Move-Item -Path $file.FullName -Destination $newFilePath -Force

        Write-Host "Moved file: $($file.Name) to $($newFilePath)"
    }
    else {
        Write-Host "File is already in the correct folder: $($file.Name)"
    }
}
