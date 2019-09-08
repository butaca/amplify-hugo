FROM amazonlinux:2

ENV VERSION_HUGO=0.58.1

RUN touch ~/.bashrc
RUN yum -y update && \
    yum -y install \
        curl \
        git \
        openssl-devel \
        openssh-clients \
        tar \
    yum clean all && \
    rm -rf /var/cache/yum

RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz

ENTRYPOINT [ "bash", "-c" ]