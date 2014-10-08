FROM ubuntu:14.04

MAINTAINER Chris Grimmett <chris@grimtech.net>

# open ports for BF server
# game traffic
EXPOSE 14567/udp
# server browser client request (LAN)
EXPOSE 3117/udp
# server browser response (LAN)
EXPOSE 22000/udp

# add server assets to container
ADD ./assets /srv/assets

# satisfy setup script and bf1942 dependencies
RUN apt-get update && \
    apt-get -y install wget expect libc6-i386 lib32ncurses5 libc6-dev-i386

# setup battlefield server package
#   * downloads needed bf server files
#   * extracts 1.6 files
#   * patches to 1.61
RUN bash -x /srv/assets/setup.sh


# set default command for running this container (run bf server)
CMD /srv/start

