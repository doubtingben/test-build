FROM python:3-alpine
MAINTAINER Ben Wilson "doubtingben@gmai.com"

RUN apk update
RUN apk add bash
RUN pip install elasticsearch-curator
ADD curator-entrypoint.sh /

ENTRYPOINT ["/curator-entrypoint.sh"]
