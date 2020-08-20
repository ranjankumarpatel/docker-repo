FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl python3 python3-pip ansible && mkdir -p /opt/script
COPY . /opt/script
RUN cd /opt/script && ansible-playbook python.yml -l localhost -f 5 -e ansible_python_interpreter=/usr/bin/python3 --user=root --become-user=root
RUN cd /opt/script && ansible-playbook set-timezone.yml -l localhost -f 5 -e ansible_python_interpreter=/usr/bin/python3 --user=root --become-user=root
RUN mkdir -p /opt/python
