FROM node:buster

WORKDIR /usr/app

RUN apt-get update \
    && apt install -y default-jre \
    && apt install -y fonts-liberation \
    && apt install -y libgbm1 \
    && apt install -y xdg-utils \
    && npm install --force protractor \
    && npm install -g webdriver-manager \
    && webdriver-manager update \
    && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb;
ENTRYPOINT ["sh", "-c", "webdriver-manager start"]
