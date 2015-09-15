FROM debian:jessie
MAINTAINER Thomas Maurice <thomas@maurice.fr>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get update && apt-get install supervisor graphite-web graphite-carbon -y

COPY supervisor/graphite.conf /etc/supervisor/conf.d/graphite.conf
COPY supervisor/carbon.conf /etc/supervisor/conf.d/carbon.conf
COPY graphite/local_settings.py /etc/graphite/local_settings.py
COPY carbon/carbon.conf /etc/carbon/carbon.conf
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf

RUN /usr/bin/python /usr/bin/graphite-manage syncdb --noinput

EXPOSE 8000 2003

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
