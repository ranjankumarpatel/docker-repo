FROM docker13972684/ubuntu18-python:basic
RUN apt-get install -y fontconfig libfreetype6 libjpeg-turbo8 libpng16-16 libssl1.0.0 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base
RUN apt-get install -y wget && cd /tmp && wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb && dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb && apt-get install -f
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections &&  apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer
RUN fc-cache -f -v & mkdir -p /opt/script