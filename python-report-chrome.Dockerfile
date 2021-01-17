FROM docker13972684/ubuntu18-python:report
# RUN cd /tmp && apt-get install -y --fix-missing fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxrandr2 libxss1 libxtst6 xdg-utils && apt-get update -y
# RUN cd /tmp && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb; apt-get install -fy && dpkg -i google-chrome-stable_current_amd64.deb
# RUN apt-get update && apt install google-chrome-stable
RUN apt-get update -y && apt-get upgrade -y  && apt-get install wget -y && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub |  apt-key add - && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' |  tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install google-chrome-stable -y && apt-get -f install
RUN apt-get update -y && apt-get upgrade -y && apt-get install curl -y && curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install nodejs -y && npm install -g chrome-headless-render-pdf && mkdir -p /opt/script
RUN apt-get install ghostscript -y
