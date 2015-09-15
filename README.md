# Grafana & Graphite docker images
This little project is about providing ready to use
Docker images containing Graphite and Grafana.

Select the one you want to use, exemple `cd grafana` and
then `docker build -t grafana .`. Note that there are
four different images, each one does a different thing.

## `grafana`
Only contains Grafana, nothing else, the default password
and login is admin:admin, it listen on the ports 80
and 3000 by default.

## `graphite`
Only contains graphite, no passwords whatsoever, it listens
on the port 8000 and 2003 for carbon

## `grafana_and_graphite`
A bundle of the two previous images, just in case you
don't want to split

## `producer`
A test image that produces random data and sends it to
a backend named `graphite`, for debug purposes.
