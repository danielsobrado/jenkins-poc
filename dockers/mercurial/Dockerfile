FROM alpine:latest

RUN apk update && \
    apk add mercurial && \
    apk add iputils && \
    apk add busybox-extras && \
    apk add sudo && \
    apk add bash && \ 
    mkdir -p /repos

COPY hg-server.sh /usr/local/bin/hg-server.sh
RUN chmod +x /usr/local/bin/hg-server.sh

WORKDIR /repos

CMD ["~/hg-server.sh"]
