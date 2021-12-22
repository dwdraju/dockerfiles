#! /bin/sh
set -e

if [ "${SERVER_NAME}" ]; then
  sed -i "s|server_name default_server;|server_name $SERVER_NAME;|g" /etc/nginx/conf.d/default.conf
fi

if [ "${OPENSEARCH_URL}" ]; then
  sed -i "s|OPENSEARCH_URL|$OPENSEARCH_URL|g" /etc/nginx/conf.d/default.conf
fi

exec nginx -g 'daemon off;'
