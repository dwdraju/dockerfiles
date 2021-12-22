# Proxy Pass Custom Domain to OpenSearch Dashboard

This works for Amazon OpenSearch Service

## Docker Image
`dwdraju/dockerfiles:opensearch-proxy`

## Build your own Image
docker build -t opensearchproxy .

## Run the Proxy
```
docker run -p 8080:80 -e OPENSEARCH_URL=[opensearch-url] opensearchproxy:latest
```

Browse with url: http://localhost:8080
