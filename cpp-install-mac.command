#!/bin/bash

# Memastikan script sudah executable
chmod +x "$0"

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
    # Instal Homebrew jika belum terinstal
    if ! command -v brew &>/dev/null; then
        echo "Homebrew belum terinstal, menginstal Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Instal VS Code menggunakan Homebrew
    echo "Menginstal Visual Studio Code..."
    brew install --cask visual-studio-code
    echo "Visual Studio Code sukses terinstal."
fi

# Instalasi Xcode command line tools
if ! xcode-select -p &>/dev/null; then
    echo "Menginstal Xcode command line tools..."
    xcode-select --install
else
    echo "Xcode command line tools telah terinstal."
fi

# Cek apakah g++ sudah terinstal
if command -v g++ &>/dev/null; then
    echo "g++ telah terinstal."
else
    echo "Menginstal g++ compiler..."
    # Instal Xcode command line tools jika belum terinstal
    xcode-select --install
fi

echo "Instalasi selesai. Terimaa Kasih <3"
g++ --version
