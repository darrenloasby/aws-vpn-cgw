FROM ubuntu:artful

MAINTAINER Darren Loasby <darren.loasby@gmail.com>

ENV \
  DEBIAN_FRONTEND=noninteractive \
  TERM=xterm-color


RUN apt-get update && apt-get -y install --no-install-recommends \
  iputils-ping net-tools iptables openswan ipsec-tools lsof iptables wget supervisor 

WORKDIR /root

ADD startup.sh /
ADD ./etc/ipsec.conf /etc/
ADD ./etc/ipsec.d/vultr-to-aws.conf /etc/ipsec.d/


EXPOSE 500 4500

CMD ["/startup.sh"]
