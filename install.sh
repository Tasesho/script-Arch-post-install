#!/bin/bash

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m'

instalar(){
    echo -e "${AZUL}Instalando: $1...${NC}"
    sudo pacman -S --needed --noconfirm "$1"
}

AUR(){
    echo -e "${AZUL}Instalando desde AUR: $1...${NC}"
    yay -S --needed --noconfirm "$1"
}


clear


sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
sudo pacman -Sy

echo -e "${VERDE}Iniciando Post-Instalacion con Programas relevantes${NC}"

sudo pacman -Syu --noconfirm

if ! command -v yay  &> /dev/null; then
    echo -e "${VERDE}Yay no encontrado. Instalando...${NC}"
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo -e "${VERDE}Yay ya esta instalado. Siguiendo con el script...${NC}"
fi


GRAPHICS=(
    "hyprland"
    "waybar"
    "swaybg"
    "rofi-wayland"
    "kitty"
    "dunst"
    "xdg-desktop-portal-hyprland"
    "ttf-jetbrains-mono-nerd"
)

echo -e "${VERDE}Instalando Entorno Grafico...${NC}"
for g in "${GRAPHICS[@]}"; do
    instalar "$g"
done


GAMING=(
    "steam"
    "mangohud"
)

echo -e "${VERDE}Instalando Gaming...${NC}"
for ga in "${GAMING[@]}"; do
    instalar "$ga"
done


CODING=(
    "python"
    "python-pip"
    "rustup"
)

echo -e "${VERDE}Instalando herramientas de programacion...${NC}"
for co in "${CODING[@]}"; do
    instalar "$co"
done

SOFTWARE=(
    "7zip"
    "alacritty"
    "ark"
    "bluez"
    "bluez-utils"
    "btop"
    "dolphin"
    "fastfetch"
    "firefox"
    "filelight"
    "fwupd"
    "git"
    "github-cli"
    "gwenview"
    "haruna"
    "kate"
    "kcalc"
    "kdeconnect"
    "konsole"
    "meld"
    "micro"
    "nicotine+"
    "networkmanager"
    "networkmanager-openvpn"
    "obs-studio"
    "obsidian"
    "openssh"
    "partitionmanager"
    "pavucontrol"
    "pipewire-alsa"
    "pipewire-pulse"
    "prismlauncher"
    "protonup-qt"
    "power-profiles-daemon"
    "spectacle"
    "steam"
    "sudo"
    "ufw"
    "unrar"
    "unzip"
    "usbutils"
    "vim"
    "vlc-plugins-all"
    "wget"
    "wireplumber"
)

echo -e "${VERDE}Instalando software desde los repositorios oficiales...${NC}"
for s in "${SOFTWARE[@]}"; do
    instalar "$s"
done

PacAUR=(
    "visual-studio-code-bin"
    "wlogout"
    "swww"
    "swaync"
    "brave-bin"
    "vesktop"
    "oracle-datamodeler"
    "psysonic"
    "vscodium-bin"
)

echo -e "${VERDE}Instalando paquetes desde AUR...${NC}"
for a in "${PacAUR[@]}"; do
    AUR "$a"
done

# --- MENSAJE FINAL ---
echo -e "\n${VERDE}#######################################################${NC}"
echo -e "${VERDE}             INSTALACIÓN COMPLETADA CON EXITO          ${NC}"
echo -e "${VERDE}#######################################################${NC}"
echo -e "${AZUL}1. Paquetes del entorno gráfico y gaming instalados.${NC}"
echo -e "${AZUL}2. Hyprland y herramientas están listas.${NC}"
echo -e "${AZUL}3. Entorno de coding configurado.${NC}"
echo -e "${AZUL}4. Apps de AUR instaladas.${NC}"
echo -e "${VERDE}#######################################################${NC}"
echo -e "${ROJO}Reinicia el sistema para aplicar los cambios.${NC}"
echo -e "${VERDE}Para reiniciar ahora, escribe: reboot${NC}\n"
