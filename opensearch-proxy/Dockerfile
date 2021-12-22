FROM nginx:1.20-alpine

COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY run.sh /etc/nginx/run.sh
COPY htpasswd /etc/nginx/.htpasswd

RUN apk add curl && chmod +x /etc/nginx/run.sh

EXPOSE 8080

CMD ["sh", "/etc/nginx/run.sh"]
