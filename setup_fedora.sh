#!/bin/bash

# Crear un archivo de registro
exec > >(tee -i setup_log.txt)
exec 2>&1

# Parar el script si ocurre un error
set -e

# Actualizar todos los paquetes del sistema
echo "Actualizando todos los paquetes..."
sudo dnf update -y

# Añadir el repositorio de RPM Fusion para controladores Nvidia
echo "Añadiendo repositorio de RPM Fusion..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Instalar controladores de Nvidia
echo "Instalando controladores de Nvidia..."
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y

# Instalar herramientas y bibliotecas para desarrollo en Qt6 y Python
echo "Instalando herramientas para desarrollo en Qt6 y Python..."
sudo dnf install python3 python3-pip python3-devel -y
sudo dnf install qt6-qtbase-devel -y

# Instalar PyQt6
echo "Instalando PyQt6..."
pip install PyQt6

# Instalar Visual Studio Code
echo "Instalando Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

# Configuración de seguridad básica
echo "Configurando seguridad básica..."

# Configurar el firewall
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --set-default-zone=home

# Actualizar SELinux a modo enforcing
sudo setenforce 1
sudo sed -i 's/^SELINUX=permissive/SELINUX=enforcing/' /etc/selinux/config

# Instalar y configurar fail2ban para protección básica contra ataques de fuerza bruta
sudo dnf install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Todo listo. Podrías querer reiniciar el sistema para asegurarte de que todos los cambios tomen efecto."

