FROM nginx:alpine

MAINTAINER Maxim Betin <betinmaxim@gmail.com>

# Copy the contents of the website into the container
COPY website /website

# Copy the Nginx config into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Port exposed in order to run the container
EXPOSE 80 
