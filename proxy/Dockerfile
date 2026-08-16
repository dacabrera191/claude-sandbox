FROM alpine:3.20
RUN apk add --no-cache squid
COPY squid.conf /etc/squid/squid.conf
RUN mkdir -p /var/log/squid /var/cache/squid /var/run/squid \
 && chown -R squid:squid /var/log/squid /var/cache/squid /var/run/squid
CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
