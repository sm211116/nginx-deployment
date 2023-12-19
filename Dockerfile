# Stage 1: Build the application
FROM nginx:latest as builder

# Install curl for testing
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/share/nginx/html

# Create or update HTML files
COPY index.html .
COPY page1.html .
COPY page-2.html .

# Stage 2: Copy artifacts to a clean Nginx image
FROM nginx:latest

# Copy the built artifacts from the previous stage
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html

# Configure Nginx for the application
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to the outside world
EXPOSE 80

# CMD to start the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]

