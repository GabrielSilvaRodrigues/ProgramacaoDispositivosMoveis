# ProgramacaoDispositivosMoveis
Matéria Programação para Dispositivos Moveis.

Linguagem utilizada: Kotlin

## Ambiente de Desenvolvimento
Este projeto inclui uma configuração Docker para executar Android Studio via VNC/NoVNC.

### Como usar no GitHub Codespaces:
1. Navegue para a pasta Aula_01: `cd Aula_01`
2. Execute: `docker compose up --build -d`
3. Aguarde a compilação (pode demorar alguns minutos)
4. **IMPORTANTE**: Aguarde 2-3 minutos para os serviços VNC inicializarem completamente
5. Verifique o status: `./check-status.sh` (ou `bash check-status.sh`)
6. Para acessar via navegador:
   - **GitHub Codespaces**: 
     - Vá na aba "PORTS" no VS Code
     - Encontre a porta 6080 e clique no ícone do globo para abrir
     - Ou execute: `./open-vnc.sh`
   - **Localmente**: `http://localhost:6080`

### Credenciais:
- Usuário: developer
- Senha: developer
- Senha VNC: android

### Primeiros Passos após Conexão:
1. Aguarde o carregamento do desktop XFCE (pode demorar alguns minutos na primeira vez)
2. Abra um terminal no desktop
3. Execute: `/opt/android-studio/bin/studio.sh` para iniciar o Android Studio
4. Configure o Android Studio na primeira execução

### Troubleshooting:
- **Se a conexão falhar ("Failed to connect to server")**:
  - Aguarde mais alguns minutos para os serviços iniciarem
  - Execute: `./check-status.sh` para ver o status detalhado
  - Se necessário, reinicie: `docker compose restart`
- **Se o VNC não conectar**:
  - Verifique os logs: `docker compose logs -f androidstudio`
  - Execute o diagnóstico: `./check-status.sh`
- **Para rebuild completo**: `docker compose down && docker compose up --build -d`

### Comandos úteis:
```bash
# Verificar status completo (RECOMENDADO)
./check-status.sh

# Abrir ambiente VNC automaticamente
./open-vnc.sh

# Verificar status dos containers
docker compose ps

# Ver logs em tempo real
docker compose logs -f

# Ver logs específicos do VNC
docker compose logs -f androidstudio | grep vnc

# Acessar o container
docker compose exec androidstudio bash

# Reiniciar serviços (se houver problemas)
docker compose restart

# Parar os serviços
docker compose down
```

### Estrutura do Projeto:
```
Aula_01/
├── Dockerfile              # Configuração da imagem Docker
├── docker-compose.yml      # Orquestração dos serviços
├── supervisord.conf         # Configuração do supervisor
├── xstartup                # Script de inicialização do XFCE
├── start-vnc.sh            # Script de inicialização do VNC
├── check-status.sh         # Script de verificação de status
├── open-vnc.sh             # Script para abrir VNC no navegador
└── workspace/              # Diretório de trabalho compartilhado
```

Bibliografia: