FROM ubuntu:22.04

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências base
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    curl \
    openjdk-17-jdk \
    libc6-dev \
    libncurses5 \
    libstdc++6 \
    lib32z1 \
    libbz2-1.0 \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

# Configurar JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Criar usuário para desenvolvimento
RUN useradd -m -s /bin/bash developer
USER developer
WORKDIR /home/developer

# Baixar e instalar Android Studio
RUN wget -q https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.3.1.18/android-studio-2023.3.1.18-linux.tar.gz \
    && tar -xzf android-studio-2023.3.1.18-linux.tar.gz \
    && rm android-studio-2023.3.1.18-linux.tar.gz

# Configurar Android SDK
ENV ANDROID_HOME=/home/developer/Android/Sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Criar diretórios necessários
RUN mkdir -p $ANDROID_HOME

# Script de inicialização
COPY start.sh /home/developer/start.sh
USER root
RUN chmod +x /home/developer/start.sh
USER developer

EXPOSE 6080 5900

CMD ["/home/developer/start.sh"]
