FROM node:8-stretch-slim

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

#Install Java
RUN apt-get update && \
    apt-get -y -f install openjdk-8-jdk-headless

#Install Chrome
ENV CHROME_PACKAGE="google-chrome-stable_74.0.3729.157-1_amd64.deb" NODE_PATH=/usr/local/lib/node_modules:/protractor/node_modules

RUN wget -q https://github.com/webnicer/chrome-downloads/raw/master/x64.deb/${CHROME_PACKAGE} && \
    dpkg --unpack ${CHROME_PACKAGE} && \
    apt-get install -f -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    rm ${CHROME_PACKAGE}

#Build Project
RUN mkdir /opt/tests
WORKDIR /opt/tests

COPY . .
RUN npm install
RUN npm run webdriver-update
RUN npm run build

CMD [ "npm", "run", "test" ]