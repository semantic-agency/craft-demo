.DEFAULT: local

IMAGE ?= semantic/craft-demo
TAG ?= local
REGISTRY ?= your-registry-info

build:
	docker build . -t $(IMAGE):$(TAG)

down:
	docker-compose down

local:
	docker-compose exec app ./craft install/craft \
		--interactive \
		--username=admin \
		--password=password \
		--email=<your_name>@semantic.dev \
		--site-name="Craft" \
		--site-url="http://craft.local:8080" \
		--language=en-US

push:
	docker push "$(REGISTRY)/$(IMAGE):$(TAG)"

restart: down up

stop:
	docker-compose stop

tag:
	docker tag "$(IMAGE):$(TAG)" "$(REGISTRY)/$(IMAGE):$(TAG)"

up:
	docker-compose up -d

xdebug:
	docker-compose exec app /usr/local/bin/docker-php-source extract
	docker-compose exec app pecl install xdebug
	docker-compose exec app /usr/local/bin/docker-php-ext-enable xdebug
	docker-compose exec app /usr/local/bin/docker-php-source delete
	docker-compose stop
	docker-compose up -d
