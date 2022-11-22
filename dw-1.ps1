Set-ExecutionPolicy -ExecutionPolicy Bypass

# Imagens

$Fundo = 'https://i.imgur.com/jDKkRV6.jpg'
$Logo = 'https://i.imgur.com/t9LuxW9.jpg'
$Abertura = 'https://i.imgur.com/7JjXcS8.jpg'

# Destino

$Destino = @('.\fundo.jpg', '.\logo.jpg', '.\abertura.jpg')

$Patch = 'C:\Program Files (x86)\FRE\FREACCESSCONDOMINIO\DADOS\'

"Test to see if folder [$Patch]  exists"
if (Test-Path -Path $Patch) {
    for ($num = 0 ; $num -lt $Destino.Count ; $num++) {
        Invoke-WebRequest $Fundo -OutFile $Destino[$num]
        Move-Item -Path $Destino[$num] -Force -Destination $Patch
    }
    "Path exists!"
}
else {
    "Path doesn't exist."
}