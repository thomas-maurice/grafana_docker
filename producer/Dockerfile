FROM debian:jessie
MAINTAINER Thomas Maurice <thomas@maurice.fr>
RUN apt-get update && apt-get upgrade -y && apt-get install netcat -y
ADD run.sh /run.sh
CMD /run.sh
