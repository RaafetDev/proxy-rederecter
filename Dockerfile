# Use Tor proxy image
FROM dperson/torproxy:latest

# Expose HTTPS port for Render
EXPOSE 443

# Run the proxy with HTTP (port 443) and Tor routing
# The newer image uses -p to define port; -r is no longer required
CMD ["/usr/bin/torproxy.sh", "-p", "443"]
