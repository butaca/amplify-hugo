# amplify-hugo

Fastest Docker image to run Hugo on Amazon AWS Amplify Console

## Trial and error

At the time of writting, the [Amplify Console documentation about custom build images](https://docs.aws.amazon.com/amplify/latest/userguide/custom-build-image.html) doesn't give a lot of info about the requirements and about the environment. Therefore I tried different build images to roughly measeure and compare the build times.

| Image | Time |
| --- | --- |
| Default Amazon Image | ~3 minutes |
| alpine:latest | doesn't work* |
| **amazonlinux:2** | ~1 minute |
| debian:stable-slim | ~1.5 minutes |
| ubuntu:latest | ~1 minute |

\* Alpine is not supported yet: <https://github.com/aws-amplify/amplify-console/issues/105#issuecomment-530477402>

## Git Branches & Docker Hub

You can try the different images using the branches in this repo. They are also uploaded to Docker Hub.

| Image              | Git Branch | Docker Hub                 |
| ------------------ | ---------- | -------------------------- |
| amazonlinux:2      | master     | butaca/amplify-hugo        |
| alpine:latest      | alpine     | butaca/amplify-hugo:alpine |
| debian:stable-slim | debian     | butaca/amplify-hugo:debian |
| ubuntu:latest      | ubuntu     | butaca/amplify-hugo:ubuntu |
