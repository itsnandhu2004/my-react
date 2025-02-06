# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML file into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 60

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
