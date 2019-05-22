FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://swadeshness-nginx/ || exit 1
