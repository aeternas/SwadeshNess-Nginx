FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean
COPY nginx.conf /etc/nginx/nginx.conf
HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://swadeshness-nginx/ || exit 1
