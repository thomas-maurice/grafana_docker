FROM debian:jessie
MAINTAINER Thomas Maurice <thomas@maurice.fr>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install apt-transport-https supervisor curl -y
RUN curl https://packagecloud.io/gpg.key | apt-key add -
COPY apt/grafana.list /etc/apt/sources.list.d/grafanaa.list
RUN apt-get update && apt-get install grafana nginx-extras -y

COPY supervisor/grafana.conf /etc/supervisor/conf.d/grafana.conf
COPY supervisor/nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY grafana/grafana.ini /usr/share/grafana/conf/defaults.ini
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY nginx/default /etc/nginx/sites-available/default
EXPOSE 3000 80

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
