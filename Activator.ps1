# Clear the screen
Clear-Host

# Function to check if the user has administrator privileges
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "This script requires administrative privileges. Please run it as an Administrator."
        exit
    }
}

# Ensure script is running with administrative privileges
Test-Admin

# Start of the script
function Start-Script {
    Clear-Host
    Write-Host "WARNING: USE AT YOUR OWN RISK"
    Write-Host "I AM NOT RESPONSIBLE FOR ANY DAMAGES"
    
    # Ask user for confirmation
    $choice = Read-Host "Would you like to Continue [Y/N]?"
    if ($choice -ne "Y") {
        Exit
    }

    # Display menu options
    Clear-Host
    Write-Host "1. Home"
    Write-Host "2. Home N"
    Write-Host "3. Home Single Language"
    Write-Host "4. Home Country Specific"
    Write-Host "5. Pro"
    Write-Host "6. Pro N"
    Write-Host "7. Pro for Workstations"
    Write-Host "8. Pro for Workstations N"
    Write-Host "9. Pro Education"
    Write-Host "10. Pro Education N"
    Write-Host "11. Education"
    Write-Host "12. Education N"
    Write-Host "13. Enterprise"
    Write-Host "14. Enterprise N"
    Write-Host "15. Enterprise G"
    Write-Host "16. Enterprise G N"
    Write-Host "17. Enterprise LTSC 2019"
    Write-Host "18. Enterprise N LTSC 2019"
    Write-Host "19. End"
    
    # Get the user's selection
    $selection = Read-Host "Select Your Operating System to Continue"
    
    # Define product key based on user choice
    $productKey = switch ($selection) {
        1  { "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" }
        2  { "3KHY7-WNT83-DGQKR-F7HPR-844BM" }
        3  { "7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH" }
        4  { "PVMJN-6DFY6-9CCP6-7BKTT-D3WVR" }
        5  { "W269N-WFGWX-YVC9B-4J6C9-T83GX" }
        6  { "MH37W-N47XK-V7XM9-C7227-GCQG9" }
        7  { "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J" }
        8  { "9FNHH-K3HBT-3W4TD-6383H-6XYWF" }
        9  { "6TP4R-GNPTD-KYYHQ-7B7DP-J447Y" }
        10 { "YVWGF-BXNMC-HTQYQ-CPQ99-66QFC" }
        11 { "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2" }
        12 { "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ" }
        13 { "NPPR9-FWDCX-D2C8J-H872K-2YT43" }
        14 { "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4" }
        15 { "YYVX9-NTFWV-6MDM3-9PT4T-4M68B" }
        16 { "44RPN-FTY23-9VTTB-MP9BX-T84FV" }
        17 { "M7XTQ-FN8P6-TTKYV-9D4CC-J462D" }
        18 { "92NFX-8DJQP-P6BBQ-THF9C-7CG2H" }
        19 { return }
        default { Write-Host "Invalid selection. Please try again."; Start-Script }
    }

    if (-not $productKey) {
        Write-Host "Invalid selection. Exiting."
        exit
    }

    # Activate Windows using the provided product key
    Write-Host "Installing product key $productKey..."
    Start-Process -FilePath "cscript.exe" -ArgumentList "/ipk $productKey" -Wait -NoNewWindow

    Write-Host "Setting KMS server..."
    Start-Process -FilePath "cscript.exe" -ArgumentList "/skms kms8.msguides.com" -Wait -NoNewWindow

    Write-Host "Activating Windows..."
    Start-Process -FilePath "cscript.exe" -ArgumentList "/ato" -Wait -NoNewWindow

    Write-Host "Windows activation process complete."
    
    # End of the script
    $endChoice = Read-Host "Would You Like to quit [Y/N]?"
    if ($endChoice -eq "Y") {
        Write-Host "Thank you for using this script. Exiting."
        exit
    } elseif ($endChoice -eq "N") {
        Start-Script
    }
}

# Start the script
Start-Script
