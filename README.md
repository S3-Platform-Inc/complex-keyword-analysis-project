
----

## Запуск через Make

### Настройка Docker
Для разворачивания проекта необходим token GitHub с соответствующим доступом.
Для получения токена:
1. Войдите на [GitHub](github.com).
2. Перейдите в меню Settings → Developer settings → Personal access tokens. 
3. Нажмите `Generate new classic token`. 
4. Установите права `read:packages`. 
5. Скопируйте токен и сохраните его в надёжном месте — он понадобится для работы с docker и git.
6. Установить переменные окружения:
```shell
export GITHUB_USER="YOUR_USER"
export GITHUB_TOKEN="YOUR_TOKEN"
```

### Настройка dotenv проекта
1. Запустить Make-файл
```shell
make setup-env
```

### Запуск Make файла
```shell
make
```

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

