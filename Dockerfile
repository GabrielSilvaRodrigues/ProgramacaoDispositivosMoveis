# Dockerfile para Android Studio web
FROM ubuntu:22.04

# Instalar dependências
RUN apt-get update && apt-get install -y \
    curl wget git unzip openjdk-17-jdk \
    x11vnc xvfb fluxbox \
    && rm -rf /var/lib/apt/lists/*

# Instalar Code-Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Baixar Android Studio
RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz \
    && tar -xzf android-studio-*.tar.gz -C /opt/ \
    && rm android-studio-*.tar.gz

# Configurar ambiente
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

EXPOSE 8080
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]