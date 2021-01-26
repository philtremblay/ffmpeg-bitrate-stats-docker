.DEFAULT_GOAL = help

DOCKER_IMAGE = ffmpeg-bitrate-stats

.PHONY: build
build: DOCKER_IMAGE ?= $(DOCKER_IMAGE)
build: ## Build the project container with Docker
	@ $(MAKE) --no-print-directory log-$@
	@ docker build --tag $(DOCKER_IMAGE):latest .

.PHONY: run
run: FILE ?= file.mp4
run:
	@ $(MAKE) --no-print-directory log-$@
	@ docker run --rm -it -v $(PWD):/app/data $(DOCKER_IMAGE):latest /app/data/$(FILE)

.PHONY: help
help:
	@ grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

log-%:
	@ grep -h -E '^$*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m==> %s\033[0m\n", $$2}'