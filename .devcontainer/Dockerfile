# All tools required for compilation belong in chip-build, forms "truth" for CHIP build tooling
FROM ubuntu:20.04

ARG GO_VERSION=1.16.3

# This Dockerfile contains things useful for an interactive development environment
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV LANG en_US.utf8

# these are installed for terminal/dev convenience.  If more tooling for build is required, please
#  add them to chip-build (in integrations/docker/images/chip-build)
RUN apt-get update
RUN apt-get install -y locales && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get -fy install git vim emacs sudo \
    apt-utils dialog zsh \
    iproute2 procps lsb-release \
    bash-completion \
    wget curl telnet \
    docker.io \
    vim \
    iputils-ping net-tools
RUN groupadd -g $USER_GID $USERNAME
RUN useradd -s /bin/bash -u $USER_UID -g $USER_GID -G docker -m $USERNAME
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

# install golang
RUN cd /tmp && wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz \
     && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
     && export PATH=$PATH:/usr/local/go/bin \
     && rm -rf go1.15.4.linux-amd64.tar.gz \
     && echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
    && curl \
        -L https://raw.githubusercontent.com/docker/compose/1.29.1/contrib/completion/bash/docker-compose \
        -o /etc/bash_completion.d/docker-compose
