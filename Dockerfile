FROM clojure:lein-2.8.1

WORKDIR /opt/urbest

# install aws and jq
RUN apt-get update; \
    apt-get -y --no-install-recommends install ca-certificates \
    # Install Puthon3 and pip
    python3 python3-pip python3-setuptools \
    # Install jq
    jq; \
    # Install awscli
    pip3 install --upgrade pip; \
    pip3 install awscli

# install docker
ENV DOCKER_VERSION=17.06.0-ce
RUN curl -L -o /tmp/docker-${DOCKER_VERSION}.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz; \
    tar -xz -C /tmp -f /tmp/docker-${DOCKER_VERSION}.tgz; \
    mv /tmp/docker/* /usr/bin; \
    rm /tmp/docker-${DOCKER_VERSION}.tgz; \
    rm -rf /tmp/docker

