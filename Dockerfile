FROM nginx:1.17.0
ENV NVM_VERSION 0.34.0
ENV NODE_VERSION 12.4.0
ENV PATH $PATH:/root/.nvm/versions/node/v$NODE_VERSION/bin/
RUN apt-get update
RUN apt-get install -y openssl curl vim

# install node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN echo "source /root/.nvm/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default" | bash
