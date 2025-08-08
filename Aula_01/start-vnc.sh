#!/bin/bash

echo "Iniciando configuração VNC..."

# Configurar ambiente
export HOME=/home/developer
export USER=developer
export DISPLAY=:1

# Criar diretório VNC se não existir
mkdir -p /home/developer/.vnc

# Configurar senha VNC
echo "android" | vncpasswd -f > /home/developer/.vnc/passwd
chmod 600 /home/developer/.vnc/passwd

# Matar sessões VNC existentes
echo "Parando sessões VNC existentes..."
vncserver -kill :1 2>/dev/null || true
pkill -f "Xvnc" || true

# Aguardar limpeza
sleep 5

echo "Iniciando VNC server..."
# Iniciar VNC server com configurações específicas
vncserver :1 \
    -geometry 1280x800 \
    -depth 24 \
    -localhost no \
    -SecurityTypes None \
    -xstartup /home/developer/.vnc/xstartup \
    -verbose

# Aguardar o VNC iniciar completamente
echo "Aguardando VNC inicializar..."
for i in {1..30}; do
    if pgrep -f "Xvnc :1" > /dev/null; then
        echo "VNC Server iniciado com sucesso na porta 5901 (tentativa $i)"
        break
    fi
    sleep 2
done

# Verificar se o VNC está rodando
if pgrep -f "Xvnc :1" > /dev/null; then
    echo "VNC Server confirmado rodando"
    netstat -tlnp | grep 5901 || echo "Porta 5901 não encontrada"
else
    echo "ERRO: VNC Server não iniciou"
    echo "Logs do VNC:"
    cat /home/developer/.vnc/*.log 2>/dev/null || echo "Nenhum log encontrado"
    exit 1
fi

# Manter o processo rodando
tail -f /home/developer/.vnc/*.log
