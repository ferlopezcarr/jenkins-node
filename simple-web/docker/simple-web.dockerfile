#FROM jenkins/agent:alpine-jdk11
FROM nginx:alpine
USER root

# Node arguments
ARG nvm_version=0.39.0
ENV NVM_VERSION=$nvm_version
ARG node_version=16.17.0
ENV NODE_VERSION=$node_version

# Install node
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
USER jenkins


FROM nginx:alpine
USER root

# App src files
ARG app_src_files=/simple-web/app/src
ENV APP_SRC_FILES=$app_src_files

COPY ${APP_SRC_FILES} /usr/share/nginx/html