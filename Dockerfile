FROM dperson/torproxy:latest

USER root
RUN apk add --no-cache privoxy

# Configure Privoxy to forward to Tor SOCKS5
RUN echo "forward-socks5t / 127.0.0.1:9050 ." > /etc/privoxy/config \
 && echo "listen-address 0.0.0.0:8080" >> /etc/privoxy/config

ENV PORT=8080
EXPOSE 8080

CMD torproxy.sh & privoxy --no-daemon /etc/privoxy/config

