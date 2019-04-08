FROM node:10

LABEL maintainer "Takuro Fukamizu <takuro.f.1987@gmail.com>"

ARG AWS_CLI_VERSION=1.16.98

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
            python \
            python-pip \
            python-setuptools \
            python-dev \
            jq \
            git \
            groff \
            less \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    pip install --no-cache-dir awscli==$AWS_CLI_VERSION; \
    rm -rf /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]