
#INSTALL FRE ACCESS
function InstallFre {
    $freFile = 'https://drive.google.com/uc?id=14RuowEiT0Aomu2IaODbGNkdZg9p9mMLT&export=download&confirm=1&uuid=b56d31a9-ea84-458b-a00b-ca2eb41e358d'
    Invoke-WebRequest -Uri $freFile -OutFile '.\FRE_INSTALADOR.zip'
    Start-Sleep -s 5
    Expand-Archive '.\FRE_INSTALADOR.zip' -Destination '.\'
    start '.\FRE_INSTALADOR.exe'    
}

# Set-ExecutionPolicy -ExecutionPolicy Bypass

# # Imagens

$Img = 'https://i.imgur.com/JcdvSXZ.jpeg'
# Destino

$Destino = @('.\fundo.jpg', '.\logo.jpg', '.\abertura.jpg')

$Patch = 'C:\Program Files (x86)\FRE\FREACCESSCONDOMINIO\DADOS\'

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
            "Test to see if folder [$Patch]  exists"
            if (Test-Path -Path $Patch) {
                for ($num = 0 ; $num -lt $Destino.Count ; $num++) {
                    Invoke-WebRequest $Img -OutFile $Destino[$num]
                    Move-Item -Path $Destino[$num] -Force -Destination $Patch
                }
                "Path exists!"
            }
            else {
                "Path doesn't exist."
            }
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        2 {
            #OPTION2 - DISPLAY MESSAGE
            InstallFre
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