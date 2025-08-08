#!/bin/bash

echo "=== Verificando Status do Ambiente Android Studio ==="
echo

# Verificar se o container está rodando
echo "1. Status do Container:"
docker compose ps

echo
echo "2. Verificando Processos VNC:"
docker compose exec androidstudio pgrep -f "Xvnc" && echo "✓ VNC Server está rodando" || echo "✗ VNC Server não encontrado"

echo
echo "3. Verificando Websockify:"
docker compose exec androidstudio pgrep -f "websockify" && echo "✓ Websockify está rodando" || echo "✗ Websockify não encontrado"

echo
echo "4. Verificando Portas Abertas:"
echo "Porta 5901 (VNC):"
docker compose exec androidstudio netstat -tlnp | grep 5901 || echo "  ✗ Porta 5901 não está aberta"
echo "Porta 6080 (noVNC):"
docker compose exec androidstudio netstat -tlnp | grep 6080 || echo "  ✗ Porta 6080 não está aberta"

echo
echo "5. Testando Conectividade VNC:"
docker compose exec androidstudio timeout 5 nc -z localhost 5901 && echo "✓ VNC server acessível" || echo "✗ VNC server não acessível"

echo
echo "6. Testando Conectividade noVNC:"
docker compose exec androidstudio timeout 5 nc -z localhost 6080 && echo "✓ noVNC server acessível" || echo "✗ noVNC server não acessível"

echo
echo "7. Logs do Supervisor:"
echo "VNC Logs (últimas 5 linhas):"
docker compose logs --tail=5 androidstudio | grep vnc || echo "Nenhum log VNC encontrado"
echo
echo "Websockify Logs (últimas 5 linhas):"
docker compose logs --tail=5 androidstudio | grep websockify || echo "Nenhum log websockify encontrado"

echo
echo "8. Para acessar o ambiente:"
if [ -n "$CODESPACE_NAME" ]; then
    echo "   - Codespaces URL: https://$CODESPACE_NAME-6080.app.github.dev"
    echo "   - Execute: \"\$BROWSER\" https://$CODESPACE_NAME-6080.app.github.dev"
else
    echo "   - Local: http://localhost:6080"
fi
echo "   - Senha VNC: android"
echo

echo "9. Se ainda houver problemas, tente:"
echo "   docker compose restart"
echo "   docker compose logs -f"
