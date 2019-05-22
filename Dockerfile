FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean
COPY nginx.conf /etc/nginx/nginx.conf
COPY health.json /etc/nginx/health.json
HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost:81/health.json || exit 1
