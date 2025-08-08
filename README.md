# ProgramacaoDispositivosMoveis
Matéria Programação para Dispositivos Moveis.

Linguagem utilizada: Kotlin

## Ambiente de Desenvolvimento
Este projeto inclui uma configuração Docker para executar Android Studio via VNC/NoVNC.

### Como usar no GitHub Codespaces:
1. Navegue para a pasta Aula_01: `cd Aula_01`
2. Execute: `docker compose up --build -d`
3. Aguarde a compilação (pode demorar alguns minutos)
4. Verifique se os containers estão rodando: `docker compose ps`
5. Para acessar via navegador:
   - **Localmente**: `http://localhost:6080`
   - **GitHub Codespaces**: Use a aba "PORTS" no VS Code e abra a porta 6080
   - **Ou use o comando**: `"$BROWSER" https://$CODESPACE_NAME-6080.app.github.dev`

### Credenciais:
- Usuário: developer
- Senha: developer
- Senha VNC: android

### Troubleshooting:
- Se a conexão falhar, verifique os logs: `docker compose logs`
- Para reiniciar: `docker compose restart`
- Para rebuild completo: `docker compose down && docker compose up --build -d`

### Comandos úteis:
```bash
# Verificar status dos containers
docker compose ps

# Ver logs em tempo real
docker compose logs -f

# Acessar o container
docker compose exec androidstudio bash

# Parar os serviços
docker compose down
```

Bibliografia: