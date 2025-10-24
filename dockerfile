# Base image
FROM ubuntu:22.04

# Prevent interactive installation prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache (web) and MySQL (database)
RUN apt-get update && \
    apt-get install -y apache2 mysql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add a simple web page
RUN echo '<!doctype html><html><body><h1>Web + DB Server is running!</h1></body></html>' > /var/www/html/index.html

# Expose ports for Apache (80) and MySQL (3306)
EXPOSE 80 3306

# Command to start both services when container runs
CMD service mysql start && apachectl -D FOREGROUND
