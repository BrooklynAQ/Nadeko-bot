FROM microsoft/1.0.0-preview2-onbuild
MAINTAINER Kwoth <nadekodiscordbot@gmail.com>

# Install Pre-Requisites
RUN add-apt-repository ppa:mc3man/trusty-media -y
RUN apt-get -q update && \
apt-get install -qy libopus0 opus-tools libopus-dev unzip ffmpeg rsync nano ca-certificates curl git wget unzip

#Mappings and ports
VOLUME ["/config"]

#Clean Up
RUN apt-get autoclean -y; apt-get autoremove -y &&\
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh
