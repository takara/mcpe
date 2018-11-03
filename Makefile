NAME=mcpe
VERSION=latest
DOCKER_RUN_OPTIONS= \
	--privileged \
	-p 19132:19132 \
	-v `pwd`/worlds:/var/mcpe/worlds

include docker.mk
