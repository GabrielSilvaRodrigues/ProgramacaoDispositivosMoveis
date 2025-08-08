#!/bin/bash

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
vncserver -kill :1 2>/dev/null || true

# Aguardar um pouco
sleep 2

# Iniciar VNC server
vncserver :1 -geometry 1280x800 -depth 24 -localhost no -xstartup /home/developer/.vnc/xstartup

# Aguardar o VNC iniciar
sleep 5

# Verificar se o VNC está rodando
if pgrep -f "Xvnc :1" > /dev/null; then
    echo "VNC Server iniciado com sucesso na porta 5901"
else
    echo "Erro ao iniciar VNC Server"
    exit 1
fi
