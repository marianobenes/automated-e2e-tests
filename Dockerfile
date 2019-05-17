FROM node:8-stretch-slim

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

#Install Java
RUN apt-get update && \
    apt-get -y -f install openjdk-8-jdk-headless

#Install Chrome
ENV NODE_PATH=/usr/local/lib/node_modules:/protractor/node_modules

ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb CHROME_PACKAGE

RUN   dpkg --unpack CHROME_PACKAGE && \
    apt-get install -f -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    rm CHROME_PACKAGE

#Build Project
RUN mkdir /opt/automated-tests

WORKDIR /opt/automated-tests

COPY tests .
COPY automated-e2e-tests .

RUN npm install
RUN npm run webdriver-update
RUN npm run build

CMD [ "npm", "run", "test" ]