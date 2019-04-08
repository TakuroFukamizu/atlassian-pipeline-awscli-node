# NGT docker

This is a dcoker image for Bitbucket Pipeline to using awscli and node.js.

## How to use

A example of pipeline config is below.

```yml
image: fkmy/atlassian-pipeline-awscli-node:latest

pipelines:
  branches:
    master:
      - step:
          name: Deploy to S3 (Production)
          deployment: production
          caches:
            - node
          script:
            - node --version
            - aws --version
            - npm i
            - npm run build
            - aws s3 sync --delete --exclude "bitbucket-pipelines.yml" . s3://hoge-bucket
```

## Rebuild image

```sh
$ docker build \
    --build-arg AWS_CLI_VERSION=1.16.98 \
    -t fkmy/atlassian-pipeline-awscli-node:1.16.98 .
```