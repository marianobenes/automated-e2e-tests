FROM node:8-stretch-slim

#Install Java
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get -y -f install openjdk-8-jdk-headless

#Install Chrome
ENV NODE_PATH=/usr/local/lib/node_modules:/protractor/node_modules

ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb CHROME_PACKAGE

RUN dpkg --unpack CHROME_PACKAGE && \
    apt-get install -f -y && \
    apt-get clean

#Build Project

WORKDIR /opt/automated-tests

COPY tests .
COPY automated-e2e-tests .

RUN npm install && \
    npm run webdriver-update && \
    npm run build

CMD [ "npm", "run", "test" ]