FROM alpine:latest
MAINTAINER VonTucky

RUN apk add --no-cache openssh-server \
    && rm -rf /tmp/* /var/cache/apk/* \
    && ssh-keygen -A

RUN addgroup alpine \
    && adduser  -G alpine -s /bin/sh -D alpine \
    && echo "alpine:alpine" | /usr/sbin/chpasswd \
    && echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers

COPY ./authorized_keys /home/alpine/.ssh/ 
COPY ./sshd_config /etc/ssh/

RUN mkdir -p /home/alpine/.ssh \
    && chown -R alpine /home/alpine/.ssh \
    && chgrp -R alpine /home/alpine/.ssh \
    && chmod -R 755 /home/alpine/.ssh \
    && chmod 644 /home/alpine/.ssh/authorized_keys 

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

