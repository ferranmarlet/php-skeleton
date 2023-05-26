ENV := dev
PROJECT_NAME := php-skeleton
DOCKER_CONTAINER := php-skeleton

# Output colors
NORMAL := \033[0m
NORMAL_BOLD := \033[1;37m
CYAN   := \033[36m
YELLOW := \033[33m
BLUE   := \033[34m
RED    := \033[31m

# Detect docker executable and when called inside container
DOCKER :=
DOCKER_OPTIONS = --user $(USER)
DOCKER_EXEC := "$(shell which docker docker.exe | head -n1)"
ifneq ($(DOCKER_EXEC),"")
	DOCKER = $(DOCKER_EXEC) exec $(DOCKER_OPTIONS) $(DOCKER_CONTAINER)
endif

CONSOLE = bin/console --no-interaction --env $(ENV)

.DEFAULT_GOAL = help
.SUFFIXES:
ifndef VERBOSE
.SILENT:
endif

.PHONY: help
help: ## Show command list
	echo ""
	echo " > $(NORMAL_BOLD)$(PROJECT_NAME)$(NORMAL) commands"
	echo ""
	echo You can use the following commands:
	# Parses current makefile looking for targets
	# Comments after the command are used as description
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN { FS = ":.*?## " }; { printf " - $(CYAN)%s:$(NORMAL) %s\n", $$1, $$2 }'
	echo

.PHONY: build
build: ## Build application images
	docker-compose build

.PHONY: up
up: ## Start application
	docker-compose up -d 

.PHONY: down
down: ## Stop application
	docker-compose down

.PHONY: sh
sh: ## Log into container
	docker exec -it php-skeleton bash

.PHONY: status
status: ## Show container status
	docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Networks}}\t{{.State}}\t{{.CreatedAt}}"

.PHONY: tests
tests: ## Run test suite inside the container
	docker exec -it php-skeleton vendor/bin/phpunit tests
