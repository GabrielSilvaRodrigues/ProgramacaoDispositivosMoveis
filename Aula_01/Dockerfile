FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_RESOLUTION=1280x800

RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    echo "America/Sao_Paulo" > /etc/timezone

RUN apt-get update && \
    apt-get install -y tzdata wget curl unzip git supervisor \
    xfce4 xfce4-goodies tightvncserver novnc websockify \
    openjdk-17-jdk libcanberra-gtk-module libglu1-mesa \
    dbus-x11 xfonts-base xauth x11vnc firefox && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar Android Studio
RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.24/android-studio-2023.1.1.24-linux.tar.gz \
    && tar -xzf android-studio-2023.1.1.24-linux.tar.gz -C /opt \
    && rm android-studio-2023.1.1.24-linux.tar.gz

# Criar usuário e configurar VNC
RUN useradd -m developer && \
    echo 'developer:developer' | chpasswd && \
    usermod -aG sudo developer && \
    mkdir -p /home/developer/.vnc /var/log/supervisor && \
    chown -R developer:developer /home/developer

# Configurar VNC como root primeiro
USER root
RUN mkdir -p /home/developer/.vnc

# Configuração VNC e Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY xstartup /home/developer/.vnc/xstartup
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /home/developer/.vnc/xstartup && \
    chmod +x /usr/local/bin/start-vnc.sh && \
    chown -R developer:developer /home/developer/.vnc

# Configurar senha VNC
USER developer
WORKDIR /home/developer
RUN mkdir -p .vnc && \
    echo "android" | vncpasswd -f > .vnc/passwd && \
    chmod 600 .vnc/passwd

USER root

# Configurar variáveis de ambiente
ENV VNC_PORT=5901
ENV NOVNC_PORT=6080

EXPOSE 5901 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]