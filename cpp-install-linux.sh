#!/bin/bash

# Fungsi untuk mengecek apakah VS Code sudah terinstal
function is_vscode_installed {
    if command -v code >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Cek apakah VS Code sudah terinstal
if is_vscode_installed; then
    echo "Visual Studio Code sudah terinstal."
else
    # Instal VS Code
    if [ -x "$(command -v snap)" ]; then
        sudo snap install --classic code
    elif [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install software-properties-common apt-transport-https wget -y
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt-get update
        sudo apt-get install code -y
    elif [ -x "$(command -v yum)" ]; then
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        sudo yum install code -y
    fi
    echo "Visual Studio Code sukses terinstal."
fi

# Instal GCC dan g++ berdasarkan distro
if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install -y build-essential g++
elif [ -x "$(command -v yum)" ]; then
    sudo yum groupinstall "Development Tools" -y
    sudo yum install -y gcc-c++
fi

# Verify installation
g++ --version
