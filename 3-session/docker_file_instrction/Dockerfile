# Use an existing image as a base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV MY_VAR=my_value

# Set build arguments
ARG BUILD_ARG1=default_value
ARG BUILD_ARG2

# Set labels
LABEL maintainer="example@example.com" \
      version="1.0" \
      description="An example Dockerfile with many instructions"

# Run commands during the build process
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        vim \
        build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy files from the host to the image
COPY ./src /app/src
COPY ./config /app/config

# Add files from a URL or a local archive
ADD https://example.com/sample-file.txt /app/sample-file.txt
ADD local-archive.tar.gz /app

# Set the working directory for future instructions
WORKDIR /app

# Create a user and set permissions
RUN useradd -ms /bin/bash myuser && \
    chown -R myuser:myuser /app
USER myuser

# Set volumes to share data between the host and container
VOLUME ["/app/data"]

# Expose a port for the container to listen on
EXPOSE 8080

# Provide a health check command for Docker to monitor the container's health
HEALTHCHECK --interval=1m --timeout=10s --retries=3 \
  CMD curl --fail http://localhost:8080/health || exit 1

# Set the command to run when the container starts
CMD ["./src/start.sh"]
#This Dockerfile includes a variety of Docker instructions, such as :
#ENV, ARG, LABEL, RUN, COPY, ADD, WORKDIR, USER, VOLUME, EXPOSE, HEALTHCHECK, and CMD. 
#Note that it may not be practical to include all these instructions in a single Dockerfile for a real-world project, as some instructions may conflict or be unnecessary for your use case.
