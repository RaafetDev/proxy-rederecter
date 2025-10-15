FROM dperson/torproxy:latest

RUN apk add --no-cache privoxy

# Override torrc (optional)
# You may disable TransPort etc
# For simplicity, let default torrc, but add HTTP tunnel port line
RUN echo "HTTPTunnelPort 0.0.0.0:443" >> /etc/tor/torrc

# Configure privoxy (if still needed)
RUN echo "forward-socks5t / 127.0.0.1:9050 ." > /etc/privoxy/config \
    && echo "listen-address 127.0.0.1:8118" >> /etc/privoxy/config

EXPOSE 443

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
