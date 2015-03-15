FROM python
MAINTAINER Ian Blenke <ian@blenke.com>

RUN pip install flask
RUN apt-get update && apt-get install -y python-ceph

ENV PYTHONPATH /usr/lib/python2.7/dist-packages

RUN mkdir -p /app && cd /app && git clone https://github.com/Crapworks/ceph-dash

WORKDIR /app/ceph-dash

EXPOSE 5000

CMD python2.7 ceph-dash.py
