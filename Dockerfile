FROM alpine

LABEL maintainer="docker-dario@neomediatech.it"

RUN echo "root:!::0:::::" > /etc/shadow ; echo "ftp:!::0:::::" >> /etc/shadow ; echo "root:x:0:0:root:/root:/bin/ash" > /etc/passwd ; echo "ftp:x:21:21::/var/lib/ftp:/sbin/nologin" >> /etc/passwd
RUN apk update; apk upgrade ; apk add --no-cache tzdata; cp /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apk add --no-cache tini vsftpd
RUN rm -rf /usr/local/share/doc /usr/local/share/man
COPY vsftpd.conf /etc/vsftpd/
COPY init.sh /
RUN chmod +x /init.sh

EXPOSE 20 21 

ENTRYPOINT ["tini", "--", "/init.sh"]

