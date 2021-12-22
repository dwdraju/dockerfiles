#! /bin/sh

set -e

if [ "${SERVER_NAME}" ]; then
  sed -i "s|server_name default_server;|server_name $SERVER_NAME;|g" /etc/nginx/conf.d/default.conf
fi

if [ "${OPENSEARCH_URL}" ]; then
  sed -i "s|OPENSEARCH_URL|$OPENSEARCH_URL|g" /etc/nginx/conf.d/default.conf
fi

if [ "${HTPASSWD_USER}" ]; then
  sed -i "s|user|$HTPASSWD_USER|g" /etc/nginx/.htpasswd
fi

if [ "${HTPASSWD_PASSWORD}" ]; then
  sed -i "s:password:$HTPASSWD_PASSWORD:g" /etc/nginx/.htpasswd
fi

exec nginx -g 'daemon off;'
