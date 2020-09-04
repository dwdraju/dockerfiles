# Nginx Proxy Pass

## Docker Image
`dwdraju/dockerfiles:nginx-proxy`

## Build your own Image
docker build -t nginx-proxy .

## Generate Htpasswd
Enter password on the prompt

```
htpasswd -c auth nginxuser
```

## Run the Proxy
```
docker run -p 8080:80 -e PROXY_URL=[nginx-url] -e HTPASSWD_USER=nginxuser -e HTPASSWD_PASSWORD='nginxpassword' nginx-proxy:latest
```

Browse with url: http://localhost:8080
