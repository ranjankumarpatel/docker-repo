FROM ubuntu
RUN apt-get update && apt-get install -y tzdata && export DEBIAN_FRONTEND=noninteractive && ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get update &&  apt-get upgrade -y &&  apt install -y build-essential dirmngr gnupg apt-transport-https ca-certificates software-properties-common gcc-9-base wget
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN apt-get install -y r-base r-base-dev
RUN apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev gdebi-core libmariadbclient-dev libsodium-dev
RUN R -e "install.packages(c('shinyjs','rmarkdown'))"
RUN apt-get install -y gdebi-core
RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.14.948-amd64.deb
RUN gdebi -n shiny-server-1.5.14.948-amd64.deb
# RUN R -e "install.packages(c('gsubfn','purrr','dplyr','pool','DBI','shiny','RMySQL','shinydashboard','rvest','tidyr','stringr','shinyjs','shinycssloaders','shinyjs','v8','DT','proto','rPython','highcharter'))"
COPY shiny-requirements.sh .
RUN bash -v shiny-requirements.sh
RUN chmod -R 755 /srv/shiny-server
EXPOSE 3838
CMD /usr/bin/shiny-server
