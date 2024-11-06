#!/bin/bash

menu() {
    echo "========================================="
    echo "  Xui.One Cambiar Contrasena de Usuario  "
    echo "========================================="
    echo "1) Listar Todos Los Usuarios"
    echo "2) Ver Usuario Especifico"
    echo "3) Cambiar Contrasena De Un Usuario"
    echo "4) Salir"
    echo -n "Por favor elija una de las siguientes opciones:"
    read opcion
}

clear

while true; do
    menu
    case $opcion in
        1)
            mysql -u root -e "SELECT User, Host FROM mysql.user;"
            ;;
        2)
            read -p "Introduce el nombre del usuario: " usuario
            mysql -u root -e "SELECT User, Host FROM mysql.user WHERE User='$usuario';"
            ;;
        3)
            read -p "Introduce el nombre del usuario: " usuario
            read -p "Introduce la nueva contrasena: " nueva_contrasena
			read -p "Introduce el host: " host
            mysql -u root -e "USE mysql; ALTER USER '$usuario'@'$host' IDENTIFIED BY '$nueva_contrasena';"
            ;;
        4)
		    echo "Saliendo..."; 
			break 
			;;
        *)
		    clear
		    echo "Opcion no Valida."
			;;
    esac
done

