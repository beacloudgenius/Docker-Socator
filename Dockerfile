FROM alpine:3.14
MAINTAINER Nilesh

ADD ./tor-socat.sh /

RUN apk update \
	&& apk upgrade  \
	&& apk add tor socat \
    # && mkdir -p /var/log/supervisor \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /tor-socat.sh

# ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./torrc /etc/tor/torrc


EXPOSE 5000


# ENTRYPOINT ["/entry_point.sh"]
ENTRYPOINT ["/tor-socat.sh"]

# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# CMD tail -f /dev/null
