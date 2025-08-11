# .gitpod.Dockerfile
FROM gitpod/workspace-full-vnc

# Instalar Android Studio
RUN wget -q https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz \
    && sudo tar -xzf android-studio-*.tar.gz -C /opt/ \
    && rm android-studio-*.tar.gz \
    && sudo ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio