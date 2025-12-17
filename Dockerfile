# Minimal hello world container for GHCR connectivity tests
FROM ubuntu:20.04

# Install a simple script that prints environment info
RUN echo '#!/bin/bash' > /hello.sh && \
    echo 'echo "Hello from GHCR!"' >> /hello.sh && \
    echo 'echo "Container connectivity test successful."' >> /hello.sh && \
    echo 'echo "Platform: $(uname -m)"' >> /hello.sh && \
    echo 'echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d\"\" -f2)"' >> /hello.sh && \
    chmod +x /hello.sh

CMD ["/hello.sh"]
