.PHONY: build run shell down
PROJECT_DIR := $(shell grep -oP '^PROJECT_DIR=\K.*' .env)

prep:
	@mkdir -p "$(PROJECT_DIR)"

build: prep
	docker compose build

run: prep
	docker compose run --rm sbx

shell: prep
	docker compose run --rm sbx bash

down:
	docker compose down
