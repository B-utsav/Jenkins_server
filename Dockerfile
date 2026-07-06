FROM nginx:latest
COPY website.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 1435
CMD ["nginx","-g","daemon off;"]
