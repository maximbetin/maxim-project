FROM jenkins/jenkins:alpine

MAINTAINER Maxim Betin <betinmaxim@gmail.com>

# Jenkin's plugins, which are almost a must
COPY plugins.txt /usr/share/jenkins/plugins.txt

# Install the plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# To make the service available, expose the port 8080
EXPOSE 8080
