# VARS

$Img = 'https://i.imgur.com/JcdvSXZ.jpeg' # IMAGE DOWNLOAD
$Dst = @('.\fundo.jpg', '.\logo.jpg', '.\abertura.jpg') 
$Patch = 'C:\Program Files (x86)\FRE\FREACCESSCONDOMINIO\DADOS\'



# FUNCTIONS #

# INSTALL

function installFre {
    $freFile = 'https://drive.google.com/uc?id=14RuowEiT0Aomu2IaODbGNkdZg9p9mMLT&export=download&confirm=1&uuid=b56d31a9-ea84-458b-a00b-ca2eb41e358d'
    Invoke-WebRequest -Uri $freFile -OutFile '.\FRE_INSTALADOR.zip'
    Start-Sleep -s 5
    Expand-Archive '.\FRE_INSTALADOR.zip' -Destination '.\'
    Start-Process '.\FRE_INSTALADOR.exe'    
}

# UPDATE BACKGROUND

function upBack {
    "Test to see if folder [$Patch]  exists"
    if (Test-Path -Path $Patch) {
        for ($num = 0 ; $num -lt $Dst.Count ; $num++) {
            Invoke-WebRequest $Img -OutFile $Dst[$num]
            Move-Item -Path $Dst[$num] -Force -Destination $Patch
        }
        "Path exists!"
    }
    else {
        "Path doesn't exist."
    }   
}

# MENU
function DisplayMenu {
    Clear-Host
    Write-Host @"
    +===============================================+
    |  POWERSHELL CONSOLE - USER MENU               | 
    +===============================================+
    |                                               |
    |    1) CHANGE BACKGROUND                       |
    |    2) INSTALL FRE ACCESS                      |
    |    3) EXIT                                    |
    +===============================================+
    
"@
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU) {
        1 {
            #OPTION1 - CHANGE BACKGROUND
            upBack
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        2 {
            #OPTION2 - DISPLAY MESSAGE
            nstallFre
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        3 {
            #OPTION3 - EXIT
            Write-Host "Bye"
            Break
        }
        default {
            #DEFAULT OPTION
            Write-Host "Option not available"
            Start-Sleep -Seconds 2
            DisplayMenu
        }
    }
}
DisplayMenu

# Set-ExecutionPolicy -ExecutionPolicy Bypass