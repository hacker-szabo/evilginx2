# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install only necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
RUN mkdir -p /app

# Copy the Evilginx build to the /app/evilginx directory
COPY build/evilginx /app/evilginx

# Expose port 443
EXPOSE 443

# Define the mount points for phishlets and config folders
VOLUME ["/phishlets", "/root/.evilginx"]

# Define the command to run Evilginx with mounted folders
CMD ["/app/evilginx", "-p", "/phishlets", "-c", "/root/.evilginx", "-developer"]
