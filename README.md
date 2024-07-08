PowerShell Script Description: Organize Downloads Folder by File Types
This PowerShell script is designed to organize the contents of a user's Downloads folder by moving files into categorized subfolders based on their file extensions. It specifically excludes certain folders from being moved to the "Others" folder. Here is a detailed description of the script's functionality:

Script Setup
1. Define Paths:
    The script sets the path to the Downloads folder.
    It defines paths for categorized subfolders: Videos, Images, Documents, Apps, Compressed, Others, Music, and Graphic.
2. Excluded Folders:

    A list of folders to be excluded from moving to the "Others" folder is defined: "ID Card Lampung", "Videos", "Images", "Documents", "Apps", "Compressed", "Music", and "Graphic".
Script Execution
1. Get Files and Folders:
    The script retrieves all files and folders in the Downloads directory.
2. Process Each Item:
    The script iterates through each item (file or folder) in the Downloads folder.
3. Skip Excluded Folders:
    If the current item is in the list of excluded folders, the script writes a message to the console and skips further processing for that item.

4. Determine Destination Folder:
    Based on the file extension, the script sets the appropriate destination folder:
    Videos: .mp4, .mov, .mkv, .ts, .flv
    Images: .jpg, .jpeg, .png, .gif, .webp
    Documents: .pdf, .docx, .xlsx, .pptx, .txt, .csv, .rtf
    Apps: .exe, .msi, .apk, .xapk
    Compressed: .zip, .rar, .7z, .iso
    Music: .mp3, .wav, .m4a
    Graphic: .ai, .psd, .cdr, .ae, .pproj, .blend, .fbx, .glb
    Others: Any other file types not listed above

5. Move Files:
   If the file is not already in the correct destination folder:
    The script checks if the destination folder exists and creates it if necessary.
    It checks for name conflicts in the destination folder and renames the file to avoid overwriting existing files by appending _copy and a count number to the filename.
    The file is moved to the destination folder with the new name if necessary.
    The script writes a message to the console indicating the file has been moved or is already in the correct folder.

6. Summary
This script effectively organizes the Downloads folder by categorizing files into subfolders based on their extensions while ensuring that certain important folders are not moved to the "Others" folder. It handles potential filename conflicts by renaming files to prevent overwriting.
