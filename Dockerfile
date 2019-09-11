FROM amazonlinux:2

ENV VERSION_HUGO=0.58.1
ENV VERSION_NODE=12.10.0
ENV VERSION_YARN=1.16.0

# Install Curl, Git, OpenSSL (AWS Amplify requirements) and tar (required to install hugo)
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

# Install Node and Yarn (AWS Amplify requirements)
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN curl -o- -L https://yarnpkg.com/install.sh > /usr/local/bin/yarn-install.sh
RUN /bin/bash -c ". ~/.nvm/nvm.sh && \
	nvm install $VERSION_NODE && nvm use $VERSION_NODE && \
    bash /usr/local/bin/yarn-install.sh --version $VERSION_YARN && \
	nvm alias default node && nvm cache clear"

# Install Hugo
RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz

# Configure environment
RUN echo export PATH="\
/root/.yarn/bin:\
/root/.config/yarn/global/node_modules/.bin:\
/root/.nvm/versions/node/${VERSION_NODE}/bin:\
$PATH" >> ~/.bashrc && \
    echo "nvm use ${VERSION_NODE} 1> /dev/null" >> ~/.bashrc

ENTRYPOINT [ "bash", "-c" ]