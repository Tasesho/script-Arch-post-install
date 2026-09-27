# Post Installation Arch Script

This script automates a post-installation setup for Arch Linux systems focused on Hyprland, software development, gaming, and everyday desktop applications.

## What the script does

- Enables the `multilib` repository and synchronizes pacman databases.
- Performs a full system upgrade with pacman.
- Installs `yay` automatically when it is not already available.
- Installs packages with pacman using `--needed`, so already-installed packages are skipped.
- Installs AUR packages with yay using `--needed`.
- Preserves colored status messages and the final completion banner.
- Does not install, configure, or manage graphics drivers. Hardware-driver configuration is intentionally outside the scope of this script.

## Official repository packages

The following groups are installed with pacman.

### Fonts

`ttf-jetbrains-mono-nerd` and `ttf-iosevka-nerd`.

### Gaming

`steam` and `mangohud`.

### Development

`python`, `python-pip`, and `rustup`.

### Desktop applications and utilities

`7zip`, `alacritty`, `ark`, `bluez`, `bluez-utils`, `btop`, `dolphin`, `fastfetch`, `firefox`, `filelight`, `fwupd`, `git`, `github-cli`, `gwenview`, `haruna`, `kate`, `kcalc`, `kdeconnect`, `konsole`, `meld`, `micro`, `nicotine+`, `networkmanager`, `networkmanager-openvpn`, `obs-studio`, `obsidian`, `openssh`, `partitionmanager`, `pavucontrol`, `pipewire-alsa`, `pipewire-pulse`, `prismlauncher`, `protonup-qt`, `power-profiles-daemon`, `spectacle`, `steam`, `sudo`, `ufw`, `unrar`, `unzip`, `usbutils`, `vim`, `vlc-plugins-all`, `wget`, and `wireplumber`.

## AUR packages

The following packages are installed with yay:

```text
visual-studio-code-bin
wlogout
swww
swaync
brave-bin
vesktop
oracle-datamodeler
psysonic
vscodium-bin
```

The AUR list includes the detected user-facing packages `vesktop`, `oracle-datamodeler`, `psysonic`, and `vscodium-bin`. `vesktop` and `obs-studio` are both included for communication and recording/streaming workflows.

## How to use it

> **Warning:** Make sure you have a stable internet connection and review the package lists before running the script.

1. Install Git if necessary:

   ```bash
   sudo pacman -S git
   ```

2. Clone the repository:

   ```bash
   git clone https://github.com/Tasesho/script-Arch-post-install.git
   cd script-Arch-post-install
   ```

3. Make the script executable:

   ```bash
   chmod +x install.sh
   ```

4. Run it:

   ```bash
   ./install.sh
   ```

## Recent changes

- Removed all graphics-driver packages, including Mesa, Vulkan Radeon packages, and `xf86-video-amdgpu`.
- Removed AMD Fiji/GCN 3-specific modprobe configuration.
- Kept package installation limited to pacman and yay.
- Added a dedicated official-repository software package group.
- Added `obs-studio` to the official pacman packages.
- Added the detected AUR packages `oracle-datamodeler`, `psysonic`, `vesktop`, and `vscodium-bin`.
- Removed the library-style `lib32-mangohud` package from the gaming list.
- Updated the completion message so it no longer claims that drivers were installed.
- Corrected the usage instructions to reference `install.sh`.
- Replaced the graphical-environment package group with a fonts package group.
- Added `ttf-iosevka-nerd` alongside `ttf-jetbrains-mono-nerd`.

## Author

- [@Tasesho](https://github.com/Tasesho)
