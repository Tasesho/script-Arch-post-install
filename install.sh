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



DRIVERS=(
    "mesa"
    "lib32-mesa"
    "vulkan-radeon"
    "lib32-vulkan-radeon"
    "xf86-video-amdgpu"
)

echo -e "${VERDE}Instalando Drivers graficos...${NC}"
for d in "${DRIVERS[@]}"; do
    instalar "$d"
done


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
    "lib32-mangohud"
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

PacAUR=(
    "visual-studio-code-bin"
    "wlogout"
    "swww"
    "swaync"
    "brave-bin"
    "vesktop-bin" 
)

echo -e "${VERDE}Instalando paquetes desde AUR...${NC}"
for a in "${PacAUR[@]}"; do
    AUR "$a"
done


echo -e "${VERDE}Configurando soporte para arquitectura Fiji (GCN 3)...${NC}"
echo 'options amdgpu si_support=1 cik_support=1' | sudo tee /etc/modprobe.d/amdgpu.conf
echo 'options radeon si_support=0 cik_support=0' | sudo tee /etc/modprobe.d/radeon.conf



# --- MENSAJE FINAL ---
echo -e "\n${VERDE}#######################################################${NC}"
echo -e "${VERDE}             INSTALACIÓN COMPLETADA CON EXITO          ${NC}"
echo -e "${VERDE}#######################################################${NC}"
echo -e "${AZUL}1. Se han instalado los drivers AMD y Gaming.${NC}"
echo -e "${AZUL}2. Hyprland y herramientas están listas.${NC}"
echo -e "${AZUL}3. Entorno de coding configurado.${NC}"
echo -e "${AZUL}4. Apps de AUR instaladas.${NC}"
echo -e "${VERDE}#######################################################${NC}"
echo -e "${ROJO}Reinicia el sistema para aplicar los cambios.${NC}"
echo -e "${VERDE}Para reiniciar ahora, escribe: reboot${NC}\n"