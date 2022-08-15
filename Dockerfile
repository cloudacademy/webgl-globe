FROM nginx:1.23.1-alpine

ADD conf.d /etc/nginx/conf.d/
ADD src /usr/share/nginx/html/

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]