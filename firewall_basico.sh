#!/bin/bash

# Definir la interfaz de red a proteger
INTERFAZ="eth0"

echo "Configurando Firewall en la interfaz $INTERFAZ..."

# Limpiar reglas anteriores para empezar desde cero
iptables -F
iptables -X

# Establecer políticas por defecto: Bloquear entrada, Permitir salida
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permitir tráfico en la interfaz local (loopback) esencial para el sistema
iptables -A INPUT -i lo -j ACCEPT

# Permitir tráfico entrante de conexiones que el servidor ya inició
iptables -A INPUT -i $INTERFAZ -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permitir tráfico entrante para SSH (Puerto 22) para gestión remota
iptables -A INPUT -i $INTERFAZ -p tcp --dport 22 -j ACCEPT

# (Opcional) Permitir tráfico web HTTP y HTTPS si es un servidor web
iptables -A INPUT -i $INTERFAZ -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i $INTERFAZ -p tcp --dport 443 -j ACCEPT

echo "Reglas de Firewall aplicadas."
