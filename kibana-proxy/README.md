# Proxy Pass Custom Domain to Kibana Dashboard

This works for Amazon Elasticsearch Service

## Docker Image
`dwdraju/dockerfiles:kibana-proxy`

## Build your own Image
docker build -t kibanaproxy .

## Generate Htpasswd
Enter password on the prompt

```
htpasswd -c auth kibanauser
```

## Run the Proxy
```
docker run -p 8080:80 -e KIBANA_URL=[kibana-url] -e HTPASSWD_USER=kibanauser -e HTPASSWD_PASSWORD='kibanapassword' kibanaproxy:latest
```

Browse with url: http://localhost:8080
