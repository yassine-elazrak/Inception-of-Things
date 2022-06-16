PROJECT_NAME	= webapp 
REPO			= Humanitics

# -f is not used because --env-file is not available on the version of docker-compose
# the VM uses.
webapp_UID		= $(shell id -u)
COMPOSE			= docker-compose -p $(PROJECT_NAME) -f  docker-compose.yaml
VAR				= $(shell echo  "webapp_UID=$(id -u)"> .env )
NEW_FILE		= touch
RM				= rm -rf
DT 				= $(shell date +%Y%m%d%H%M%S) 
IMAGE_BACK  = $(REPO)/webapp:$(DT)
IMAGE_LATEST = $(REPO)/webapp:staging

all: .up

# build images separately, without starting the containers.

build:
	$(COMPOSE) build  --no-cache

# build the service's images and run the containers in the background.
# ensure containers are down before performing up.
.up: clean
	$(COMPOSE) up -d --build

clean: 
	$(COMPOSE) down 

# Deletes docker volumes, but persistance should remain as ~/data directories
# are left untouched. 
fclean: clean
	$(COMPOSE)  down --rmi all 

# Delete docker volumes and up (data should persist)
re: fclean all

# /!\ ROOT ACCESS REQUIRED /!\
# Cleanup the entire docker environment as well as volumes that persisted.
prune: fclean
	docker system prune  --all --force
	docker volume prune  --force
build:
	@echo "build image webapp "
	@docker login
	@cd docker && docker build  -f Dockerfile -t $(IMAGE_BACK) .
	@docker tag $(IMAGE_BACK) $(IMAGE_LATEST)
	@docker push $(IMAGE_LATEST) 
	@docker push	$(IMAGE_BACK)
	##remove the image from locdocker al
	@docker rmi $(IMAGE_BACK)
	@docker rmi $(IMAGE_LATEST)
	@echo "deploy image $(IMAGE_LATEST) $(IMAGE_BACK)"

app webserver:
	$(COMPOSE) stop $@
	$(COMPOSE) rm -f $@
	$(COMPOSE) up -d $@

reload: down all

down:
	$(COMPOSE)  down


.PHONY: build clean fclean all re .up ssl down reload 