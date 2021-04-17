FROM ubuntu:20.04

ARG GO_VERSION=1.16.3

# install deps
RUN apt-get update
RUN apt-get install -y locales && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get -fy install git vim emacs sudo \
    apt-utils dialog zsh \
    iproute2 procps lsb-release \
    bash-completion \
    wget curl telnet \
    vim \
    iputils-ping net-tools

# install golang
RUN cd /tmp && wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz \
     && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
     && export PATH=$PATH:/usr/local/go/bin \
     && rm -rf go1.15.4.linux-amd64.tar.gz \
     && echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

ADD . /source
WORKDIR /source

