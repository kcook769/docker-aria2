NAME=aria2
VERSION=1.0
IMAGE_NAME=$(NAME):$(VERSION)
DATA_DIR=/usr/local/media/aria
CONTAINER_DATA_DIR=/data
build-image:
	docker build -t $(IMAGE_NAME) .

run-foreground:
	docker run -it --rm --hostname $(NAME)-$(VERSION) -v $(DATA_DIR):/$(CONTAINER_DATA_DIR) -p 6800:6800 $(IMAGE_NAME)
run-daemonize:
	docker run -d --hostname $(NAME)-$(VERSION) --name $(NAME) -v $(DATA_DIR):/$(CONTAINER_DATA_DIR) -p 6800:6800 -p 6890-6999:6890-6999 $(IMAGE_NAME)
