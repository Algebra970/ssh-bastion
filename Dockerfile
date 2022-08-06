FROM alpine:3.16

RUN apk add --no-cache openssh runit dumb-init
RUN sed -i 's/^\(root:.*:\)[^:]\+$/\1\/sbin\/nologin/' /etc/passwd
RUN mkdir -p /input/server /input/client

EXPOSE 22

ENV SSH_SERVER=false
ENV SSH_SERVER_RESTART_DELAY=5

ENV SSH_CLIENT=false
ENV SSH_CLIENT_RESTART_DELAY=5

ADD ./etc /etc
ADD ./bin /bin
ADD LICENSE /

ENTRYPOINT [ "dumb-init", "dumb-runit"]
