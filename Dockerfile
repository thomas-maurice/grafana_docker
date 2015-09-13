FROM debian:jessie
MAINTAINER Thomas Maurice <thomas@maurice.fr>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install apt-transport-https supervisor curl -y
RUN curl https://packagecloud.io/gpg.key | apt-key add -
COPY apt/grafana.list /etc/apt/sources.list.d/grafanaa.list
RUN apt-get update && apt-get install grafana graphite-web graphite-carbon -y

COPY supervisor/graphite.conf /etc/supervisor/conf.d/graphite.conf
COPY supervisor/grafana.conf /etc/supervisor/conf.d/grafana.conf
COPY supervisor/carbon.conf /etc/supervisor/conf.d/carbon.conf
COPY grafana/grafana.ini /usr/share/grafana/conf/defaults.ini
COPY graphite/local_settings.py /etc/graphite/local_settings.py
COPY carbon/carbon.conf /etc/carbon/carbon.conf
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf

RUN /usr/bin/python /usr/bin/graphite-manage syncdb --noinput

EXPOSE 3000 2003

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
