FROM alpine:latest

RUN apk update && \
    apk add mercurial && \
    apk add iputils && \
    apk add busybox-extras && \
    apk add sudo && \
    mkdir -p /var/hg/repos

COPY hg-server.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/hg-server.sh

WORKDIR /var/hg/repos

CMD ["/usr/local/bin/hg-server.sh"]
