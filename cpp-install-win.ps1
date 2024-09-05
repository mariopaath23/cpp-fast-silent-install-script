# Fungsi cek instalasi Visual Studio Code
function IsVSCodeInstalled {
    $vsCodePath = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object { $_.DisplayName -like "Microsoft Visual Studio Code*" }
    return $vsCodePath -ne $null
}

# Cek apakah VIsual Studio Code sudah terinstal
if (IsVSCodeInstalled) {
    Write-Host "Visual Studio Code telah terinstal. Skipped."
} else {
    # Download and install VS Code silently if not installed
    $vsCodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    $vsCodeInstallerPath = "$env:TEMP\vscode-setup.exe"
    
    # Download the installer
    Invoke-WebRequest -Uri $vsCodeInstallerUrl -OutFile $vsCodeInstallerPath
    
    # Install silently
    Start-Process -FilePath $vsCodeInstallerPath -ArgumentList "/verysilent /mergetasks=!runcode" -Wait
    Write-Host "Instalasi Visual Studio Code sukses."
}

# Continue with the MinGW installation as before
$installerUrl = "https://sourceforge.net/projects/mingw/files/latest/download"
$installerPath = "$env:TEMP\mingw-get-setup.exe"
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait

# Set MinGW path
$mingwPath = "C:\MinGW\bin"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$mingwPath", [EnvironmentVariableTarget]::Machine)

# Verify installation
$gccVersion = & "C:\MinGW\bin\g++" --version
if ($gccVersion) {
    Write-Host "MinGW (g++) sukses terinstal. Terima kasih <3"
} else {
    Write-Host "Instalasi gagal. Silahkan coba lagi atau lakukan instalasi secara manual."
}
