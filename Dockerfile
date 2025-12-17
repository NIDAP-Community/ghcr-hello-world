# Minimal hello world container for GHCR connectivity tests
FROM ubuntu:20.04

# Install a simple script that prints environment info
RUN cat <<'EOF' > /hello.sh
#!/bin/bash
echo "Hello from GHCR!"
echo "Container connectivity test successful."
echo "Platform: $(uname -m)"
os_name=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
echo "OS: ${os_name}"
EOF
RUN chmod +x /hello.sh

CMD ["/hello.sh"]
