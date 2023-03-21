FROM alpine:latest

RUN apk update && \
    apk add mercurial && \
    apk add iputils && \
    apk add busybox-extras && \
    apk add sudo && \
    apk add bash && \
    adduser -D -u 1000 hguser && \
    mkdir -p /repos

COPY hg-server.sh /usr/local/bin/hg-server.sh
RUN chmod +x /usr/local/bin/hg-server.sh

WORKDIR /repos

CMD ["/usr/local/bin/hg-server.sh"]
