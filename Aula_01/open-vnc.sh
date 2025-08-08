#!/bin/bash

echo "Abrindo ambiente Android Studio..."

if [ -n "$CODESPACE_NAME" ]; then
    URL="https://$CODESPACE_NAME-6080.app.github.dev"
    echo "Abrindo no GitHub Codespaces: $URL"
    "$BROWSER" "$URL"
else
    URL="http://localhost:6080"
    echo "Abrindo localmente: $URL"
    "$BROWSER" "$URL"
fi

echo
echo "Credenciais VNC:"
echo "- Senha: android"
echo
echo "Para iniciar Android Studio no desktop:"
echo "- Abra um terminal no desktop VNC"
echo "- Execute: /opt/android-studio/bin/studio.sh"
