FROM        ubuntu:14.10
MAINTAINER  Love Nyberg "love.nyberg@lovemusic.se"
ENV REFRESHED_AT 2015-01-08

# Update the package repository and install applications
RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish && \
  apt-get -yqq clean

# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_IP 172.17.42.1
ENV VARNISH_PORT 80

# Expose port 80
EXPOSE 80

ADD start.sh /start.sh
CMD ["/start.sh"]
