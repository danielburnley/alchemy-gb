.PHONY: build

build-docker:
	docker-compose build

test: build-docker
	docker-compose run --rm gb env MIX_ENV=test mix test.watch
