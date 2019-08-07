$Packages = 'firefox', 'googlechrome', 'adobereader', 'flashplayerplugin', 'jre8', 'javaruntime', 'zoom','notepadplusplus', 'slack', '7zip', 'unifying', 'office365proplus'

Test-Path -Path "$env:ProgramData\Chocolatey"

$ChocoInstalled = $false
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    $ChocoInstalled = $true
}
else {
Set-ExecutionPolicy Bypass -Scope Process -Force; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

If(Test-Path -Path "$env:ProgramData\Chocolatey") {
    ForEach ($PackageName in $Packages) {
        choco install $PackageName -y
    }
}
Else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    ForEach ($PackageName in $Packages) {
        choco install $PackageName -y
    }
}
