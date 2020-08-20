FROM docker13972684/ubuntu18-python:basic
RUN python3 -m pip install pip -U
RUN apt-get update -y && apt-get upgrade -y && apt-get install git -y
RUN mkdir -p /opt/git
RUN cd /opt/git && git clone https://github.com/ranjankumarpatel/flask-multi-session.git && cd /opt/git/flask-multi-session && python3 setup.py install
RUN cd /opt/git && pip3 uninstall flask-oauthlib && pip3 uninstall flask-oauthlib && git clone https://github.com/ranjankumarpatel/flask-oauthlib.git && cd /opt/git/flask-oauthlib && python3 setup.py install