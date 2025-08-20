
----

## Запуск

### Настройка окружения

1. Скопируй `.sample` dotenv файлы проекта

```shell
cp .env.sample .env.dev
cp .env.func.sample .env.func.dev
cp .env.runner.sample .env.runner.dev
```

2. В каждом из `.env` файлов необходимо указать **GitHub токен авторизации**.  

```markdown
# Аутентификация GitHub API
GITHUB_TOKEN={Токен Авторизации}
```
Получить персональный токен можно на [странице GitHub](https://github.com/settings/tokens).

3. Внимательно смотрите на **Credentials** в dotenv файлах. Они должны совпадать, иначе ничего не заработает.

### Запуск в Docker-Compose

```shell
docker-compose up -d
```

