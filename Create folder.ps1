# Specify the base downloads path
$downloadsPath = "C:\Users\achma\Downloads"  # Adjust if needed

# Create the folders
New-Item -ItemType Directory -Path "$downloadsPath\Videos"
New-Item -ItemType Directory -Path "$downloadsPath\Images"
New-Item -ItemType Directory -Path "$downloadsPath\Documents"
New-Item -ItemType Directory -Path "$downloadsPath\Apps"
New-Item -ItemType Directory -Path "$downloadsPath\Compressed"
New-Item -ItemType Directory -Path "$downloadsPath\Others"
New-Item -ItemType Directory -Path "$downloadsPath\Music"
New-Item -ItemType Directory -Path "$downloadsPath\Graphic"
