NAME=mcpe
VERSION=latest
DOCKER_RUN_OPTIONS= \
	--privileged \
	-v `pwd`/players:/var/mcpe/players \
	-v `pwd`/worlds:/var/mcpe/worlds \
	-p 19132:19132/udp

include docker.mk
