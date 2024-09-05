# Install Script untuk Praktikum Algoritma dan Pemrograman
Melakukan instalasi aplikasi yang dibutuhkan untuk digunakan dalam pemrograman aplikasi C++ secara cepat

<br>

## Apa yang dilakukan script ini?
Ketika dijalankan, script ini akan:
- Memeriksa instalasi Visual Studio Code dan menentukan apakah akan menginstal VS Code atau tidak
- Menginstal package manager (Homebrew untuk MacOS) untuk mempermudah instalasi
- (Untuk Windows) Menginstal MinGW(g++)
- (Untuk MacOS) Menginstal XCode Command Line Tools yang telah memiliki compiler g++
- (Untuk Linux) Menginstal g++

<br>

## Panduan untuk Asdos
> Pastikan perangkat praktikan telah terhubung ke internet!
<details>
<summary>Windows</summary>

<br>

- Download file `cpp-install-win.ps1`
- Pindahkan file tersebut ke `C:\`
- Buka Windows PowerShell sebagai Administrator
- Jalankan:
  ```
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
- `cd` ke direktori di mana file `.ps1` tersebut berada
  ```
  cd C:
  ```
- Jalankan script dengan:
  ```
  ./cpp-install-win.ps1
  ```
- Tunggu hingga instalasi selesai
</details>

<details>
<summary>MacOS</summary>

<br>

- Download file `cpp-install-mac.command`
- Buka aplikasi Terminal di MacOS (Bisa mencarinya dengan membuka Spotlight (Command + Space) dan mencari Terminal)
- `cd` ke folder Downloads dengan:
  ```
  cd Downloads
  ```
- Buat file script tersebut menjadi executable dengan:
  ```
  chmod +x cpp-install-mac.command
  ```
- Jalankan script dengan:
  ```
  ./cpp-install-mac.command
  ```
- Tunggu hingga instalasi selesai
</details>

<details>
<summary>Linux</summary>

<br>

- Download file `cpp-install-linux.sh`
- Buka aplikasi Terminal di Linux
- `cd` ke folder Downloads dengan:
  ```
  cd Downloads
  ```
- Buat file script tersebut menjadi executable dengan:
  ```
  chmod +x cpp-install-linux.sh
  ```
- Jalankan script dengan:
  ```
  ./cpp-install-linux.sh
  ```
- Tunggu hingga instalasi selesai
</details>

Thanks!
Made with ❤️ by Mario Paath