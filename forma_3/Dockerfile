# Usar Theia com extensões Android
FROM theiaide/theia:latest

USER root

# Instalar Android SDK
RUN apt-get update && apt-get install -y openjdk-17-jdk wget unzip \
    && wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip \
    && unzip commandlinetools-linux-*_latest.zip -d /opt/android-sdk \
    && rm commandlinetools-linux-*_latest.zip

ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools

USER theia
EXPOSE 3000