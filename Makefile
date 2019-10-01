TYPE = GPU
IMAGE_NAME = $(USER)-lab-image
CONTAINER_NAME = $(USER)-lab-container

.PHONY: build
build:
	docker build . -t $(IMAGE_NAME)

.PHONY: run
run:
	nvidia-docker run -itd --name $(CONTAINER_NAME) \
	-v $(HOST_DIRECTORY):/code \
	-p $(HOST_PORT):8888 $(IMAGE_NAME) \
	jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --notebook-dir=/code

.PHONY: exec
exec:
	docker exec -it $(CONTAINER_NAME) /bin/bash

# Clean
.PHONY: all-clean
all-clean:
	make stop
	make container-clean
	docker rmi `docker images -q kajyuuen-lab-image`

.PHONY: image-clean
image-clean:
	docker rmi `docker images -q kajyuuen-lab-image`

.PHONY: container-clean
container-clean:
	docker rm `docker ps -aq --filter name=$(CONTAINER_NAME)`

.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME)

.PHONY: notebook-url
notebook-url:
	docker logs $(CONTAINER_NAME) | head
	@echo HOST_PORT: $(HOST_PORT)

.PHONY: config
config:
	@echo TYPE: $(TYPE)
	@echo IMAGE_NAME: $(IMAGE_NAME)
	@echo CONTAINER_NAME: $(CONTAINER_NAME)
	@echo CONTAINER_DIRECTORY: $(CONTAINER_DIRECTORY)
	@echo HOST_PORT: $(HOST_PORT)
