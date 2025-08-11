#!/bin/bash

# Configurar display virtual
export DISPLAY=:0
Xvfb :0 -screen 0 1920x1080x24 &

# Aguardar X server iniciar
sleep 2

# Iniciar window manager
fluxbox &

# Configurar VNC
x11vnc -display :0 -forever -usepw -create -shared &

# Iniciar noVNC para acesso web
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

# Aguardar serviços iniciarem
sleep 3

# Iniciar Android Studio
cd /home/developer/android-studio/bin
./studio.sh &

# Manter container rodando
tail -f /dev/null
