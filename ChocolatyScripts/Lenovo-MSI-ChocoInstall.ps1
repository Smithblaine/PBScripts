#Self-Elevate to Administrator so that you dont have to set-executionpolicy to Remotesigned
# if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
#     if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
#      $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
#      Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
#      Exit
#     }
#    }

$homePrograms = 'unifying', 'git', 'mobaxterm', '7zip', 'vscode', 'eclipse', ''

Write-Host "Which Installation would you like to install?

1.) Home Program Install?
2.) Uninstall Home Programs
3.) Exit Program
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
        ForEach ($PackageName in $homePrograms) {
        choco install $PackageName -y
      }
    }
    Else {
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        ForEach ($PackageName in $homePrograms) {
        choco install $PackageName -y
        }
    } 
        break;
    }

    #Uninstall Home Programs
    2 { If(Test-Path -Path "$env:ProgramData\Chocolatey") {
        ForEach ($PackageName in $homePrograms) {
            choco uninstall $PackageName -y
        }
    } 
    }

    #Exiting the program if the user selects to.
    3 { exit; }
}