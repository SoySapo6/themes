#!/bin/bash

COLOR_AZUL="\e[34m"
COLOR_RESET="\e[0m"

OS=$(grep "^ID=" /etc/os-release | cut -d= -f2)

if [ "$OS" != "ubuntu" ] && [ "$OS" != "debian" ]; then
    echo "Este script solo funciona en Ubuntu o Debian."
    exit 1
fi

if [ ! -d "/var/www/pterodactyl" ]; then
    echo "No se encontró Pterodactyl en /var/www/pterodactyl"
    exit 1
fi

REPO="https://raw.githubusercontent.com/SoySapo6/themes/main"

clear
echo
echo -e "      ${COLOR_AZUL}Hecho por${COLOR_RESET}"

echo -e "${COLOR_AZUL}"
echo " _____         _____                 _ 
|   __|___ _ _|     |___ _ _ ___ ___| |
|__   | . | | | | | | .'| | |  _| . | |
|_____|___|_  |_|_|_|__,|_  |___|___|_|
          |___|         |___|          "
echo -e "${COLOR_RESET}"

while true; do
    echo "°.•☆•.°°.• [ Temas ] •.°°.•☆•.°"
    echo
    echo "1) Nebula"
    echo "2) Elysium"
    echo "3) Stellar"
    echo "4) Nightcore"
    echo
    echo "°.•☆•.°°.• [ Extras ] •.°°.•☆•.°"
    echo
    echo "5) Abrir GitHub"
    echo "6) Salir"
    read -p "╰┈➤ Elige una opción: " op

    cd /var/www/pterodactyl || exit 1

    case $op in
        1) bash <(curl -s $REPO/scripts/nebula.sh) ;;
        2) bash <(curl -s $REPO/scripts/elysium.sh) ;;
        3) bash <(curl -s $REPO/scripts/stellar) ;;
        4) bash <(curl -s $REPO/scripts/nightcore.sh) ;;
        5) xdg-open "https://github.com/SoySapo6/themes" 2>/dev/null || echo "Abre este enlace: https://github.com/SoySapo6/themes" ;;
        6) exit 0 ;;
        *) echo "[ ERROR ] Opción inválida." ;;
    esac
done
