# Use lightweight nginx server
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML files into nginx folder
COPY . /usr/share/nginx/html

# Expose port 80 (web server)
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
