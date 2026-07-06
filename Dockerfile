FROM nginx:alpine
COPY website.html /usr/share/nginx/html/index.html
EXPOSE 80