#!/bin/bash

# Script para actualizar el sistema y activar funciones específicas

# Función para actualizar el sistema
actualizar_sistema() {
    echo "Actualizando la lista de paquetes..."
    sudo apt update

    if [ $? -eq 0 ]; then
        echo "Actualizando todos los paquetes instalados..."
        sudo apt upgrade -y
        if [ $? -eq 0 ]; then
            echo "Sistema actualizado con éxito."
        else
            echo "Error al actualizar los paquetes."
            exit 1
        fi
    else
        echo "Error al actualizar la lista de paquetes."
        exit 1
    fi
}

# Función para reiniciar el sistema (opcional)
reiniciar_sistema() {
    echo "Reiniciando el sistema en 10 segundos..."
    sleep 10
    sudo reboot
}

# Función para habilitar el firewall
habilitar_firewall() {
    echo "Habilitando el firewall..."
    sudo ufw enable
    if [ $? -eq 0 ]; then
        echo "Firewall habilitado con éxito."
    else
        echo "Error al habilitar el firewall."
    fi
}

# Función para iniciar un servicio específico (por ejemplo, ssh)
iniciar_servicio() {
    echo "Iniciando el servicio ssh..."
    sudo systemctl start ssh
    if [ $? -eq 0 ]; then
        echo "Servicio ssh iniciado con éxito."
    else
        echo "Error al iniciar el servicio ssh."
    fi
}

# Ejecutar las funciones
actualizar_sistema
reiniciar_sistema
habilitar_firewall
iniciar_servicio