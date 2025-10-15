FROM dperson/torproxy:latest

# Install privoxy to translate HTTP -> SOCKS5 (Tor)
RUN apk add --no-cache privoxy

# Configure Privoxy to forward all traffic to Tor's SOCKS5 proxy
RUN echo "forward-socks5t / 127.0.0.1:9050 ." > /etc/privoxy/config \
    && echo "listen-address 0.0.0.0:443" >> /etc/privoxy/config \
    && echo "enable-remote-toggle 0" >> /etc/privoxy/config \
    && echo "enable-remote-http-toggle 0" >> /etc/privoxy/config \
    && echo "accept-intercepted-requests 1" >> /etc/privoxy/config

# Expose HTTPS port
EXPOSE 443

# Start Tor and Privoxy together
CMD torproxy.sh & privoxy --no-daemon /etc/privoxy/config
