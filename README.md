# Post Installation Arch Script

This script is designed to **automate** the system settings of **Arch Linux**. It is optimized for my workflow in **Hyprland**, software development, and gaming.

## Features
- **Modular:** Split into blocks (Drivers, Graphics, Gaming, Coding, and AUR).
- **GPU Optimized:** Specific configuration for **AMD Fiji (GCN 3)** architecture.
- **Wayland Environment:** Complete installation of Hyprland and customization tools.
- **Gaming Ready:** Includes Steam, MangoHud, and required multilib libraries.

## Main Components
- **Drivers:** Mesa, Vulkan (Radeon), xf86-video-amdgpu.
- **Environment:** Hyprland, Waybar, Wlogout, Swaync, Kitty.
- **Coding:** Python, Rust (via rustup), VS Code.
- **Apps:** Brave Browser, Vesktop (Discord with Wayland support).

## How to use it?

> **Warning:** Make sure to have a stable internet connection before continuing.

1. **Install Git** (If you don't have it):
   ```bash
   sudo pacman -S git

2. **Clone the repo**
   ```bash
   git clone [https://github.com/Tasesho/script-Arch-post-install.git](https://github.com/Tasesho/script-Arch-post-install.git)
   cd script-Arch-post-install

3. **Give execution Permission**
   ```bash
   chmod +x post-install.sh

4. **Run the script**
   ```bash
   ./post-install.sh



## Author

- [@Tasesho](https://github.com/Tasesho)
