# Dockerfile com noVNC
FROM ubuntu:22.04

# Instalar dependências
RUN apt-get update && apt-get install -y \
    wget curl git unzip openjdk-17-jdk \
    x11vnc xvfb openbox \
    supervisor novnc websockify \
    && rm -rf /var/lib/apt/lists/*

# Android Studio
RUN wget -q https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz \
    && tar -xzf android-studio-*.tar.gz -C /opt/ \
    && rm android-studio-*.tar.gz

# Configurar VNC
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6080 5900
CMD ["/usr/bin/supervisord"]