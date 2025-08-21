
----

## Запуск

### Настройка окружения

1. Скопируй `.sample` dotenv файлы проекта

```shell
cp .env.sample .env.dev
cp .env.func.sample .env.func.dev
cp .env.runner.sample .env.runner.dev
```

2. В файлах `.env.func.*`, `.env.runner.*` необходимо указать [**GitHub токен авторизации**](https://github.com/settings/tokens) аккаунта, у которого есть доступ к GitHub репозиториям S3P плагинов (В настройках токена нужно дать разрешения на чтение репозитория и релизов).  

```markdown
# Аутентификация GitHub API
GITHUB_TOKEN={Токен Авторизации}
```

3. Авторизуйся в docker через [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic). В настройках токена нужно дать разрешения на `read:packages`.


4. Внимательно смотрите на **Credentials** в dotenv файлах. Они должны совпадать, иначе ничего не заработает.

### Запуск в Docker-Compose

```shell
docker-compose -f compose.dev.yml up -d
```

