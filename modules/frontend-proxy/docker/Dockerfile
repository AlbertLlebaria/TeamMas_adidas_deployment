FROM nginx:1.13
COPY /tmp/build /usr/share/nginx/html/adidasApp
RUN sh -c 'touch /usr/share/nginx/html/adidasApp/index.html'
COPY adidas-nginx.conf /etc/nginx/conf.d
