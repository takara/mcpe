FROM debian:8.7

MAINTAINER takara

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install net-tools git make vim curl chkconfig gcc libpcre3-dev unzip locales autoconf automake m4 bzip2 bison g++ libtool libtool-bin wget
ENV DEBIAN_FRONTEND dialog

# tty停止
COPY asset/ttystop /etc/init.d/
RUN chkconfig --add ttystop
RUN chkconfig ttystop on

RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

RUN adduser -q --shell /bin/bash mcpe
RUN mkdir /var/mcpe && chown -R mcpe /var/mcpe 
USER mcpe
WORKDIR /var/mcpe
COPY asset/pmmp.sh /var/mcpe
COPY asset/compile.sh /var/mcpe
RUN ./pmmp.sh


COPY asset/pocketmine.yml /var/mcpe/
COPY asset/server.properties /var/mcpe/

EXPOSE 19132

CMD ["/var/mcpe/start.sh"]
