#!/bin/bash

# Definir las interfaces de red
WAN="eth0" # Interfaz externa (Internet)
LAN="eth1" # Interfaz interna (Red local)

echo "Configurando Firewall para 2 interfaces (WAN: $WAN, LAN: $LAN)..."

# 1. Habilitar el reenvío de paquetes (IP Forwarding) en el kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

# 2. Limpiar reglas anteriores (Filtro y NAT)
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# 3. Políticas por defecto restrictivas
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# 4. Permitir tráfico interno del sistema (loopback)
iptables -A INPUT -i lo -j ACCEPT

# 5. Permitir tráfico de conexiones ya establecidas
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 6. Permitir administración por SSH (Puerto 22) solo desde la red local
iptables -A INPUT -i $LAN -p tcp --dport 22 -j ACCEPT

# 7. Permitir que el tráfico de la red local (LAN) se reenvíe hacia Internet (WAN)
iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT

# 8. Configurar NAT (Enmascaramiento) para dar salida a Internet a la red local
iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE

echo "Reglas de Firewall para 2 interfaces aplicadas correctamente."
