FROM nginx:1.13
COPY /tmp/build /usr/share/nginx/html/bettairApp
RUN sh -c 'touch /usr/share/nginx/html/bettairApp/index.html'
COPY bet-nginx.conf /etc/nginx/conf.d