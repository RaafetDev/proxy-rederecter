# Use Tor proxy image
FROM dperson/torproxy:latest

# Expose the web port for Render (HTTPS)
EXPOSE 443

# Run Tor and the HTTP proxy, binding to all interfaces
CMD ["-a", "0.0.0.0", "-p", "443", "-r"]
