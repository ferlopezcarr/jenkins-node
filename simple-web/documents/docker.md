# Simple web

## Docker

### Docker Build

```bash
docker build -t simple-web:local -f "simple-web/docker/simple-web.local.dockerfile" .
```

### Docker RUN

```bash
docker run -d --name simple-web-local -p 80:80 simple-web:local
```
