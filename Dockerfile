FROM gliderlabs/alpine:3.1
MAINTAINER SequenceIQ

ENV ULU_SERVER_PORT 3000
RUN apk-install curl nodejs bash git
EXPOSE 3000
ADD . /uluwatu
RUN rm -rf /uluwatu/.git

RUN cd /uluwatu && npm install && npm install -g bower
RUN cd /uluwatu/app/static && bower install --allow-root

CMD ["/uluwatu/start-docker.sh"]
