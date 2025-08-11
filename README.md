# Android Studio Web via Docker

Este projeto configura o Android Studio para execução via web browser usando Docker e noVNC.

## Como usar

1. **Construir e iniciar o container:**
```bash
docker-compose up -d --build
```

2. **Acessar o Android Studio:**
- Abra o browser em: http://localhost:6080
- Use a senha VNC: `android123`

3. **Parar o ambiente:**
```bash
docker-compose down
```

## Recursos

- ✅ Android Studio via web browser
- ✅ Persistência de projetos em `./projects`
- ✅ SDK Android configurado
- ✅ Interface desktop completa
- ✅ Acesso VNC direto na porta 5900

## Estrutura

- `Dockerfile` - Configuração do ambiente Android
- `docker-compose.yml` - Orquestração dos serviços
- `start.sh` - Script de inicialização
- `projects/` - Diretório para seus projetos Android

## Requisitos

- Docker
- Docker Compose
- 4GB+ RAM recomendado
