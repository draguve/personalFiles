
#Requires -RunAsAdministrator

<#
   This Is A Script To Batch Install Useful Programs Easily
   Usage 
        ./sysinit (programs or packages to install)
#>

function Install-Stuff(){
    foreach($arg in $args){
        $toInstall = @()
        if($arg.ToLower().Equals("newmachine")){
            $toInstall += "googlechrome","jdownloader","vlc","winrar","steam","spotify","qbittorrent"
        }elseif($arg.ToLower().Equals("nvidia")){
            $toInstall += "geforce-driver"
        }elseif($arg.ToLower().Equals("virtualmachine")){
            $toInstall += "virtualbox","vagrant"
        }elseif($arg.ToLower().Equals("gamer")){
            $toInstall += "directx","vcredist2005","vcredist2008","vcredist2010","vcredist2012","vcredist2013","vcredist2015","vcredist2017"
        }elseif($arg.ToLower().Equals("developer")){
            $toInstall += "git","python2","sublimetext3","clink"
        }elseif($arg.ToLower().Equals("extragaming")){
            $toInstall += "origin","uplay","twitch","discord","depressurizer"
        }else{
            $toInstall += $arg
        }
    }
    &$choco install $toInstallc
}

function Install-Choco(){
    Write-Host "Installing chocolatey"
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
    Install-Stuff
}


$choco = "C:\ProgramData\chocolatey\choco.exe"
if((Test-Path C:\ProgramData\chocolatey) -And (Test-Path C:\ProgramData\chocolatey\choco.exe)){
    Install-Stuff
}else {
    Write-Host "chocolatey is not installed"
    Install-Choco
}
