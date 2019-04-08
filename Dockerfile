FROM node:10

LABEL maintainer "Takuro Fukamizu <takuro.f.1987@gmail.com>"

ARG AWS_CLI_VERSION

RUN apk --update --no-cache add \
    python \
    py-pip \
    jq \
    bash \
    git \
    groff \
    less \
    mailcap \
    bash \
    && pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]