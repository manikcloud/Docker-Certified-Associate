# Use Ubuntu as the base image
FROM ubuntu

# Update the package list
RUN apt-get update

# Install nginx
RUN apt-get install -y nginx

# Copy the custom index.html file to the default nginx directory
COPY index.nginx-debian.html /var/www/html/index.nginx-debian.html

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
