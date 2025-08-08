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
    dbus-x11 xfonts-base xauth x11vnc && \
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

# Configurar senha VNC
USER developer
WORKDIR /home/developer
RUN mkdir -p .vnc && \
    echo "android" | vncpasswd -f > .vnc/passwd && \
    chmod 600 .vnc/passwd && \
    echo "#!/bin/bash\nstartxfce4 &" > .vnc/xstartup && \
    chmod +x .vnc/xstartup

USER root

# Configuração VNC e Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY xstartup /home/developer/.vnc/xstartup
RUN chmod +x /home/developer/.vnc/xstartup && \
    chown developer:developer /home/developer/.vnc/xstartup

EXPOSE 5901 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]