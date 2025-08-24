# Makefile для автоматизации настройки и запуска проекта
# Переменные:
#   GITHUB_USER — ваш логин GitHub (например, yourusername)
#   GITHUB_PACKAGES_TOKEN — персональный токен GitHub с правами на чтение пакетов

.PHONY: all setup-env docker-login compose-up

GITHUB_PACKAGES_TOKEN ?=
GITHUB_USER ?=
REPO_URL = https://github.com/S3-Platform-Inc/complex-keyword-analysis-project.git

all: setup-env docker-login compose-up

setup-env:
	@echo "Setting up environment files..."
	cp .env.sample .env.dev && \
	cp .env.func.sample .env.func.dev && \
	cp .env.runner.sample .env.runner.dev

docker-login:
	@echo "Logging in to GitHub Container Registry..."
	@if [ -n "$(GITHUB_PACKAGES_TOKEN)" ] && [ -n "$(GITHUB_USER)" ]; then \
	  echo $(GITHUB_PACKAGES_TOKEN) | docker login ghcr.io -u $(GITHUB_USER) --password-stdin; \
	else \
	  echo "Skip docker login (GITHUB_TOKEN or GITHUB_USER not set)."; \
	fi

compose-up:
	@echo "Starting services via docker-compose..."
	docker compose -f compose.dev.yml up -d
