$TechnicalPrograms = 'firefox', 'googlechrome', 'unifying', 'adobereader', 'flashplayerplugin', 'jre8', 'javaruntime', 'zoom','notepadplusplus', 'intellijidea-ultimate', 'sql-server-management-studio', 'nodejs', 'postman', 'slack', 'git', 'mobaxterm', '7zip', 'office365proplus'

$SimpleProgram = 'firefox', 'googlechrome', 'adobereader', 'flashplayerplugin', 'jre8', 'javaruntime', 'zoom','notepadplusplus', 'slack', '7zip', 'unifying', 'office365proplus'

Write-Host "Which Installation would you like to install?

1.) Technical Install?
2.) Simple Installation?
3.) Uninstall Technical Programs
4.) Uninstall Simple Programs
5.) Exit Program
";

$choice = Read-Host "Please enter your choice";

switch ($choice) {

    #Technical script
    1 { 
    Test-Path -Path "$env:ProgramData\Chocolatey"
    
    $ChocoInstalled = $false
    if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
        $ChocoInstalled = $true
    }
    
    If(Test-Path -Path "$env:ProgramData\Chocolatey") {
        ForEach ($PackageName in $TechnicalPrograms) {
        choco install $PackageName -y
      }
    }
    Else {
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        ForEach ($PackageName in $TechnicalPrograms) {
        choco install $PackageName -y
        }
    } 
        break;
    }

    #Non-Techinal script
    2 { 
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
        ForEach ($PackageName in $SimpleProgram) {
            choco install $PackageName -y
        }
    }
    Else {
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        ForEach ($PackageName in $SimpleProgram) {
            choco install $PackageName -y
        }
    } 
        break;
    }

    #Uninstall Technical Programs
    3 { If(Test-Path -Path "$env:ProgramData\Chocolatey") {
        ForEach ($PackageName in $TechnicalPrograms) {
            choco uninstall $PackageName -y
        }
    } 
    }

    #Uninstall Simple Programs
    4 { If(Test-Path -Path "$env:ProgramData\Chocolatey") {
        ForEach ($PackageName in $SimpleProgram) {
            choco uninstall $PackageName -y
        }
    } 
    }

    #Exiting the program if the user selects to.
    5 { exit; }
}