FROM ubuntu:20.04

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

# Existing lsb_release causes issues with modern installations of Python3
# https://github.com/pypa/pip/issues/4924#issuecomment-435825490
# Set (temporarily) DEBIAN_FRONTEND to avoid interacting with tzdata
RUN apt-get -qq -y update && \
    DEBIAN_FRONTEND=noninteractive apt -qq -y install \
        gcc \
        g++ \
        zlibc \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libreadline-dev \
        uuid-dev \
        libffi-dev \
        tk-dev \
        wget \
        curl \
        git \
        make \
        sudo \
        bash-completion \
        tree \
        vim \
        nano \
        iputils-ping \
        software-properties-common \
        dnsutils \
        postgresql-client \
        mysql-client \
		p7zip-full \
		cron

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-amd64.deb && dpkg -i filebeat-7.12.0-amd64.deb

# python 
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update && apt-get -y install python3.8 python3-pip

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
