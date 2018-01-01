
REPOSITORY=docker.io/cybermaggedon/snort
VERSION=$(shell git describe | sed 's/^v//')
SNORT_VERSION=2.9.11

SUDO=
BUILD_ARGS=

all: snort.rpm
	${SUDO} docker build ${BUILD_ARGS} -t ${REPOSITORY}:${VERSION} .

# FIXME: May not be the right mirror for you.
snort.rpm:
	wget -q -O snort.rpm https://forensics.cert.org/fedora/cert/27/x86_64/snort-${SNORT_VERSION}-1.fc27.x86_64.rpm

push:
	${SUDO} docker push ${REPOSITORY}:${VERSION}
	${SUDO} docker push ${REPOSITORY}:latest
