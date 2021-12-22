# Proxy Pass Custom Domain to OpenSearch Dashboard

This works for Amazon OpenSearch Service

## Docker Image
`dwdraju/dockerfiles:opensearchproxy-no-auth`

## Build your own Image
docker build -t opensearchproxy .

## Run the Proxy
```
docker run -p 8080:80 -e OPENSEARCH_URL=$OPENSEARCH_URL opensearchproxy-no-auth:latest
```

Browse with url: http://localhost:8080
