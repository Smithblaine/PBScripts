$Packages = 'firefox', 'googlechrome', 'office365proplus', 'adobereader', 'flashplayerplugin', 'jre8', 'javaruntime', 'zoom','notepadplusplus', 'intellijidea-ultimate', 'sql-server-management-studio', 'nodejs', 'postman', 'slack', 'git', 'mobaxterm', '7zip
Test-Path -Path "$env:ProgramData\Chocolatey"

$ChocoInstalled = $false
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    $ChocoInstalled = $true
}

If(Test-Path -Path "$env:ProgramData\Chocolatey") {
    ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y
}
}
Else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y
}
}

